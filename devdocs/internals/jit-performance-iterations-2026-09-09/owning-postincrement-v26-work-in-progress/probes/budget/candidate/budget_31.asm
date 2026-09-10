Dump of assembler code from 0xfffff7f85000 to 0xfffff7f87000:
   0x0000fffff7f85000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7f85004:	910003fd	mov	x29, sp
   0x0000fffff7f85008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7f8500c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7f85010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7f85014:	aa0003f3	mov	x19, x0
   0x0000fffff7f85018:	aa0103f4	mov	x20, x1
   0x0000fffff7f8501c:	aa0203f5	mov	x21, x2
   0x0000fffff7f85020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7f85024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7f85028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f8502c:	f90003e9	str	x9, [sp]
   0x0000fffff7f85030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7f85034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7f85038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7f8503c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f85040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85044:	d63f0200	blr	x16
   0x0000fffff7f85048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7f8504c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7f85050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7f85054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7f85058:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f8505c:	37d800e9	tbnz	w9, #27, 0xfffff7f85078
   0x0000fffff7f85060:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f85064:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85068:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8506c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f85070:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f85074:	1400000e	b	0xfffff7f850ac
   0x0000fffff7f85078:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8507c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85080:	aa1303e1	mov	x1, x19
   0x0000fffff7f85084:	aa1503e2	mov	x2, x21
   0x0000fffff7f85088:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7f8508c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85090:	aa1603e5	mov	x5, x22
   0x0000fffff7f85094:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7f85098:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8509c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f850a0:	d63f0200	blr	x16
   0x0000fffff7f850a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f850a8:	5400c1c0	b.eq	0xfffff7f868e0  // b.none
   0x0000fffff7f850ac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f850b0:	37d800e9	tbnz	w9, #27, 0xfffff7f850cc
   0x0000fffff7f850b4:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f850b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f850bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f850c0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f850c4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f850c8:	1400000e	b	0xfffff7f85100
   0x0000fffff7f850cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f850d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f850d4:	aa1303e1	mov	x1, x19
   0x0000fffff7f850d8:	aa1503e2	mov	x2, x21
   0x0000fffff7f850dc:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7f850e0:	aa1403e4	mov	x4, x20
   0x0000fffff7f850e4:	aa1603e5	mov	x5, x22
   0x0000fffff7f850e8:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7f850ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f850f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f850f4:	d63f0200	blr	x16
   0x0000fffff7f850f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f850fc:	5400bf60	b.eq	0xfffff7f868e8  // b.none
   0x0000fffff7f85100:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85104:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85108:	aa1303e1	mov	x1, x19
   0x0000fffff7f8510c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85110:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f85114:	aa1403e4	mov	x4, x20
   0x0000fffff7f85118:	aa1603e5	mov	x5, x22
   0x0000fffff7f8511c:	d2909810	mov	x16, #0x84c0                	// #33984
   0x0000fffff7f85120:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85124:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85128:	d63f0200	blr	x16
   0x0000fffff7f8512c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85130:	5400be00	b.eq	0xfffff7f868f0  // b.none
   0x0000fffff7f85134:	f100041f	cmp	x0, #0x1
   0x0000fffff7f85138:	5400b9e0	b.eq	0xfffff7f86874  // b.none
   0x0000fffff7f8513c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85140:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85144:	aa1303e1	mov	x1, x19
   0x0000fffff7f85148:	aa1503e2	mov	x2, x21
   0x0000fffff7f8514c:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7f85150:	aa1403e4	mov	x4, x20
   0x0000fffff7f85154:	aa1603e5	mov	x5, x22
   0x0000fffff7f85158:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f8515c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85160:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85164:	d63f0200	blr	x16
   0x0000fffff7f85168:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8516c:	5400bc60	b.eq	0xfffff7f868f8  // b.none
   0x0000fffff7f85170:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f85174:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85178:	aa1303e1	mov	x1, x19
   0x0000fffff7f8517c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85180:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7f85184:	aa1403e4	mov	x4, x20
   0x0000fffff7f85188:	aa1603e5	mov	x5, x22
   0x0000fffff7f8518c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f85190:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85194:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85198:	d63f0200	blr	x16
   0x0000fffff7f8519c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f851a0:	5400bb00	b.eq	0xfffff7f86900  // b.none
   0x0000fffff7f851a4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f851a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f851ac:	aa1303e1	mov	x1, x19
   0x0000fffff7f851b0:	aa1503e2	mov	x2, x21
   0x0000fffff7f851b4:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f851b8:	aa1403e4	mov	x4, x20
   0x0000fffff7f851bc:	aa1603e5	mov	x5, x22
   0x0000fffff7f851c0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f851c4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f851c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f851cc:	d63f0200	blr	x16
   0x0000fffff7f851d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f851d4:	5400b9a0	b.eq	0xfffff7f86908  // b.none
   0x0000fffff7f851d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f851dc:	37d80269	tbnz	w9, #27, 0xfffff7f85228
   0x0000fffff7f851e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f851e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f851e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f851ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f851f0:	540001c1	b.ne	0xfffff7f85228  // b.any
   0x0000fffff7f851f4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f851f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f851fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85200:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85204:	54000121	b.ne	0xfffff7f85228  // b.any
   0x0000fffff7f85208:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f8520c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f85210:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85214:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85218:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8521c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f85220:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f85224:	1400000e	b	0xfffff7f8525c
   0x0000fffff7f85228:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8522c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85230:	aa1303e1	mov	x1, x19
   0x0000fffff7f85234:	aa1503e2	mov	x2, x21
   0x0000fffff7f85238:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f8523c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85240:	aa1603e5	mov	x5, x22
   0x0000fffff7f85244:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f85248:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8524c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85250:	d63f0200	blr	x16
   0x0000fffff7f85254:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85258:	5400b5c0	b.eq	0xfffff7f86910  // b.none
   0x0000fffff7f8525c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85260:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85264:	aa1303e1	mov	x1, x19
   0x0000fffff7f85268:	aa1503e2	mov	x2, x21
   0x0000fffff7f8526c:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f85270:	aa1403e4	mov	x4, x20
   0x0000fffff7f85274:	aa1603e5	mov	x5, x22
   0x0000fffff7f85278:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8527c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85280:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85284:	d63f0200	blr	x16
   0x0000fffff7f85288:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8528c:	5400b460	b.eq	0xfffff7f86918  // b.none
   0x0000fffff7f85290:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f85294:	37d80269	tbnz	w9, #27, 0xfffff7f852e0
   0x0000fffff7f85298:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f8529c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f852a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f852a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f852a8:	540001c1	b.ne	0xfffff7f852e0  // b.any
   0x0000fffff7f852ac:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f852b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f852b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f852b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f852bc:	54000121	b.ne	0xfffff7f852e0  // b.any
   0x0000fffff7f852c0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f852c4:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f852c8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f852cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f852d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f852d4:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f852d8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f852dc:	1400000e	b	0xfffff7f85314
   0x0000fffff7f852e0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f852e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f852e8:	aa1303e1	mov	x1, x19
   0x0000fffff7f852ec:	aa1503e2	mov	x2, x21
   0x0000fffff7f852f0:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f852f4:	aa1403e4	mov	x4, x20
   0x0000fffff7f852f8:	aa1603e5	mov	x5, x22
   0x0000fffff7f852fc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f85300:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85304:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85308:	d63f0200	blr	x16
   0x0000fffff7f8530c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85310:	5400b080	b.eq	0xfffff7f86920  // b.none
   0x0000fffff7f85314:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85318:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8531c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85320:	aa1503e2	mov	x2, x21
   0x0000fffff7f85324:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f85328:	aa1403e4	mov	x4, x20
   0x0000fffff7f8532c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85330:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f85334:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85338:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8533c:	d63f0200	blr	x16
   0x0000fffff7f85340:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85344:	5400af20	b.eq	0xfffff7f86928  // b.none
   0x0000fffff7f85348:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f8534c:	37d80269	tbnz	w9, #27, 0xfffff7f85398
   0x0000fffff7f85350:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f85354:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85358:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8535c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85360:	540001c1	b.ne	0xfffff7f85398  // b.any
   0x0000fffff7f85364:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85368:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8536c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85370:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85374:	54000121	b.ne	0xfffff7f85398  // b.any
   0x0000fffff7f85378:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f8537c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f85380:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85384:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85388:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8538c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f85390:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f85394:	1400000e	b	0xfffff7f853cc
   0x0000fffff7f85398:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8539c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f853a0:	aa1303e1	mov	x1, x19
   0x0000fffff7f853a4:	aa1503e2	mov	x2, x21
   0x0000fffff7f853a8:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f853ac:	aa1403e4	mov	x4, x20
   0x0000fffff7f853b0:	aa1603e5	mov	x5, x22
   0x0000fffff7f853b4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f853b8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f853bc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f853c0:	d63f0200	blr	x16
   0x0000fffff7f853c4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f853c8:	5400ab40	b.eq	0xfffff7f86930  // b.none
   0x0000fffff7f853cc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f853d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f853d4:	aa1303e1	mov	x1, x19
   0x0000fffff7f853d8:	aa1503e2	mov	x2, x21
   0x0000fffff7f853dc:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7f853e0:	aa1403e4	mov	x4, x20
   0x0000fffff7f853e4:	aa1603e5	mov	x5, x22
   0x0000fffff7f853e8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f853ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f853f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f853f4:	d63f0200	blr	x16
   0x0000fffff7f853f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f853fc:	5400a9e0	b.eq	0xfffff7f86938  // b.none
   0x0000fffff7f85400:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f85404:	37d80269	tbnz	w9, #27, 0xfffff7f85450
   0x0000fffff7f85408:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f8540c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85410:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85414:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85418:	540001c1	b.ne	0xfffff7f85450  // b.any
   0x0000fffff7f8541c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85420:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85424:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85428:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8542c:	54000121	b.ne	0xfffff7f85450  // b.any
   0x0000fffff7f85430:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f85434:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f85438:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8543c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85440:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85444:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f85448:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f8544c:	1400000e	b	0xfffff7f85484
   0x0000fffff7f85450:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85454:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85458:	aa1303e1	mov	x1, x19
   0x0000fffff7f8545c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85460:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7f85464:	aa1403e4	mov	x4, x20
   0x0000fffff7f85468:	aa1603e5	mov	x5, x22
   0x0000fffff7f8546c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f85470:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85474:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85478:	d63f0200	blr	x16
   0x0000fffff7f8547c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85480:	5400a600	b.eq	0xfffff7f86940  // b.none
   0x0000fffff7f85484:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85488:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8548c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85490:	aa1503e2	mov	x2, x21
   0x0000fffff7f85494:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7f85498:	aa1403e4	mov	x4, x20
   0x0000fffff7f8549c:	aa1603e5	mov	x5, x22
   0x0000fffff7f854a0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f854a4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f854a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f854ac:	d63f0200	blr	x16
   0x0000fffff7f854b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f854b4:	5400a4a0	b.eq	0xfffff7f86948  // b.none
   0x0000fffff7f854b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f854bc:	37d80269	tbnz	w9, #27, 0xfffff7f85508
   0x0000fffff7f854c0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f854c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f854c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f854cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f854d0:	540001c1	b.ne	0xfffff7f85508  // b.any
   0x0000fffff7f854d4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f854d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f854dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f854e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f854e4:	54000121	b.ne	0xfffff7f85508  // b.any
   0x0000fffff7f854e8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f854ec:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f854f0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f854f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f854f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f854fc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f85500:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f85504:	1400000e	b	0xfffff7f8553c
   0x0000fffff7f85508:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8550c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85510:	aa1303e1	mov	x1, x19
   0x0000fffff7f85514:	aa1503e2	mov	x2, x21
   0x0000fffff7f85518:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7f8551c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85520:	aa1603e5	mov	x5, x22
   0x0000fffff7f85524:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f85528:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8552c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85530:	d63f0200	blr	x16
   0x0000fffff7f85534:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85538:	5400a0c0	b.eq	0xfffff7f86950  // b.none
   0x0000fffff7f8553c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85540:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85544:	aa1303e1	mov	x1, x19
   0x0000fffff7f85548:	aa1503e2	mov	x2, x21
   0x0000fffff7f8554c:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7f85550:	aa1403e4	mov	x4, x20
   0x0000fffff7f85554:	aa1603e5	mov	x5, x22
   0x0000fffff7f85558:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8555c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85560:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85564:	d63f0200	blr	x16
   0x0000fffff7f85568:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8556c:	54009f60	b.eq	0xfffff7f86958  // b.none
   0x0000fffff7f85570:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f85574:	37d80269	tbnz	w9, #27, 0xfffff7f855c0
   0x0000fffff7f85578:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f8557c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85580:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85584:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85588:	540001c1	b.ne	0xfffff7f855c0  // b.any
   0x0000fffff7f8558c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85590:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85594:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85598:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8559c:	54000121	b.ne	0xfffff7f855c0  // b.any
   0x0000fffff7f855a0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f855a4:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f855a8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f855ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f855b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f855b4:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f855b8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f855bc:	1400000e	b	0xfffff7f855f4
   0x0000fffff7f855c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f855c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f855c8:	aa1303e1	mov	x1, x19
   0x0000fffff7f855cc:	aa1503e2	mov	x2, x21
   0x0000fffff7f855d0:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7f855d4:	aa1403e4	mov	x4, x20
   0x0000fffff7f855d8:	aa1603e5	mov	x5, x22
   0x0000fffff7f855dc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f855e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f855e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f855e8:	d63f0200	blr	x16
   0x0000fffff7f855ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f855f0:	54009b80	b.eq	0xfffff7f86960  // b.none
   0x0000fffff7f855f4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f855f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f855fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f85600:	aa1503e2	mov	x2, x21
   0x0000fffff7f85604:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7f85608:	aa1403e4	mov	x4, x20
   0x0000fffff7f8560c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85610:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f85614:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85618:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8561c:	d63f0200	blr	x16
   0x0000fffff7f85620:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85624:	54009a20	b.eq	0xfffff7f86968  // b.none
   0x0000fffff7f85628:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f8562c:	37d80269	tbnz	w9, #27, 0xfffff7f85678
   0x0000fffff7f85630:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f85634:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85638:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8563c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85640:	540001c1	b.ne	0xfffff7f85678  // b.any
   0x0000fffff7f85644:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85648:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8564c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85650:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85654:	54000121	b.ne	0xfffff7f85678  // b.any
   0x0000fffff7f85658:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f8565c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f85660:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85664:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85668:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8566c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f85670:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f85674:	1400000e	b	0xfffff7f856ac
   0x0000fffff7f85678:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8567c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85680:	aa1303e1	mov	x1, x19
   0x0000fffff7f85684:	aa1503e2	mov	x2, x21
   0x0000fffff7f85688:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7f8568c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85690:	aa1603e5	mov	x5, x22
   0x0000fffff7f85694:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f85698:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8569c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f856a0:	d63f0200	blr	x16
   0x0000fffff7f856a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f856a8:	54009640	b.eq	0xfffff7f86970  // b.none
   0x0000fffff7f856ac:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f856b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f856b4:	aa1303e1	mov	x1, x19
   0x0000fffff7f856b8:	aa1503e2	mov	x2, x21
   0x0000fffff7f856bc:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7f856c0:	aa1403e4	mov	x4, x20
   0x0000fffff7f856c4:	aa1603e5	mov	x5, x22
   0x0000fffff7f856c8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f856cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f856d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f856d4:	d63f0200	blr	x16
   0x0000fffff7f856d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f856dc:	540094e0	b.eq	0xfffff7f86978  // b.none
   0x0000fffff7f856e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f856e4:	37d80269	tbnz	w9, #27, 0xfffff7f85730
   0x0000fffff7f856e8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f856ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f856f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f856f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f856f8:	540001c1	b.ne	0xfffff7f85730  // b.any
   0x0000fffff7f856fc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85700:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85704:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85708:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8570c:	54000121	b.ne	0xfffff7f85730  // b.any
   0x0000fffff7f85710:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f85714:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f85718:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8571c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85720:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85724:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f85728:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f8572c:	1400000e	b	0xfffff7f85764
   0x0000fffff7f85730:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85734:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85738:	aa1303e1	mov	x1, x19
   0x0000fffff7f8573c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85740:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7f85744:	aa1403e4	mov	x4, x20
   0x0000fffff7f85748:	aa1603e5	mov	x5, x22
   0x0000fffff7f8574c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f85750:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85754:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85758:	d63f0200	blr	x16
   0x0000fffff7f8575c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85760:	54009100	b.eq	0xfffff7f86980  // b.none
   0x0000fffff7f85764:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85768:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8576c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85770:	aa1503e2	mov	x2, x21
   0x0000fffff7f85774:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7f85778:	aa1403e4	mov	x4, x20
   0x0000fffff7f8577c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85780:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f85784:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85788:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8578c:	d63f0200	blr	x16
   0x0000fffff7f85790:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85794:	54008fa0	b.eq	0xfffff7f86988  // b.none
   0x0000fffff7f85798:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f8579c:	37d80269	tbnz	w9, #27, 0xfffff7f857e8
   0x0000fffff7f857a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f857a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f857a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f857ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f857b0:	540001c1	b.ne	0xfffff7f857e8  // b.any
   0x0000fffff7f857b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f857b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f857bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f857c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f857c4:	54000121	b.ne	0xfffff7f857e8  // b.any
   0x0000fffff7f857c8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f857cc:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f857d0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f857d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f857d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f857dc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f857e0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f857e4:	1400000e	b	0xfffff7f8581c
   0x0000fffff7f857e8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f857ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f857f0:	aa1303e1	mov	x1, x19
   0x0000fffff7f857f4:	aa1503e2	mov	x2, x21
   0x0000fffff7f857f8:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7f857fc:	aa1403e4	mov	x4, x20
   0x0000fffff7f85800:	aa1603e5	mov	x5, x22
   0x0000fffff7f85804:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f85808:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8580c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85810:	d63f0200	blr	x16
   0x0000fffff7f85814:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85818:	54008bc0	b.eq	0xfffff7f86990  // b.none
   0x0000fffff7f8581c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85820:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85824:	aa1303e1	mov	x1, x19
   0x0000fffff7f85828:	aa1503e2	mov	x2, x21
   0x0000fffff7f8582c:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7f85830:	aa1403e4	mov	x4, x20
   0x0000fffff7f85834:	aa1603e5	mov	x5, x22
   0x0000fffff7f85838:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8583c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85840:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85844:	d63f0200	blr	x16
   0x0000fffff7f85848:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8584c:	54008a60	b.eq	0xfffff7f86998  // b.none
   0x0000fffff7f85850:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f85854:	37d80269	tbnz	w9, #27, 0xfffff7f858a0
   0x0000fffff7f85858:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f8585c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85860:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85864:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85868:	540001c1	b.ne	0xfffff7f858a0  // b.any
   0x0000fffff7f8586c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85870:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85874:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85878:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8587c:	54000121	b.ne	0xfffff7f858a0  // b.any
   0x0000fffff7f85880:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f85884:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f85888:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8588c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85890:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85894:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f85898:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f8589c:	1400000e	b	0xfffff7f858d4
   0x0000fffff7f858a0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f858a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f858a8:	aa1303e1	mov	x1, x19
   0x0000fffff7f858ac:	aa1503e2	mov	x2, x21
   0x0000fffff7f858b0:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7f858b4:	aa1403e4	mov	x4, x20
   0x0000fffff7f858b8:	aa1603e5	mov	x5, x22
   0x0000fffff7f858bc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f858c0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f858c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f858c8:	d63f0200	blr	x16
   0x0000fffff7f858cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f858d0:	54008680	b.eq	0xfffff7f869a0  // b.none
   0x0000fffff7f858d4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f858d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f858dc:	aa1303e1	mov	x1, x19
   0x0000fffff7f858e0:	aa1503e2	mov	x2, x21
   0x0000fffff7f858e4:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7f858e8:	aa1403e4	mov	x4, x20
   0x0000fffff7f858ec:	aa1603e5	mov	x5, x22
   0x0000fffff7f858f0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f858f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f858f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f858fc:	d63f0200	blr	x16
   0x0000fffff7f85900:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85904:	54008520	b.eq	0xfffff7f869a8  // b.none
   0x0000fffff7f85908:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f8590c:	37d80269	tbnz	w9, #27, 0xfffff7f85958
   0x0000fffff7f85910:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f85914:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85918:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8591c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85920:	540001c1	b.ne	0xfffff7f85958  // b.any
   0x0000fffff7f85924:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85928:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8592c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85930:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85934:	54000121	b.ne	0xfffff7f85958  // b.any
   0x0000fffff7f85938:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f8593c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f85940:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85944:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85948:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8594c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f85950:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f85954:	1400000e	b	0xfffff7f8598c
   0x0000fffff7f85958:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8595c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85960:	aa1303e1	mov	x1, x19
   0x0000fffff7f85964:	aa1503e2	mov	x2, x21
   0x0000fffff7f85968:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7f8596c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85970:	aa1603e5	mov	x5, x22
   0x0000fffff7f85974:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f85978:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8597c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85980:	d63f0200	blr	x16
   0x0000fffff7f85984:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85988:	54008140	b.eq	0xfffff7f869b0  // b.none
   0x0000fffff7f8598c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85990:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85994:	aa1303e1	mov	x1, x19
   0x0000fffff7f85998:	aa1503e2	mov	x2, x21
   0x0000fffff7f8599c:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7f859a0:	aa1403e4	mov	x4, x20
   0x0000fffff7f859a4:	aa1603e5	mov	x5, x22
   0x0000fffff7f859a8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f859ac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f859b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f859b4:	d63f0200	blr	x16
   0x0000fffff7f859b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f859bc:	54007fe0	b.eq	0xfffff7f869b8  // b.none
   0x0000fffff7f859c0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f859c4:	37d80269	tbnz	w9, #27, 0xfffff7f85a10
   0x0000fffff7f859c8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f859cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f859d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f859d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f859d8:	540001c1	b.ne	0xfffff7f85a10  // b.any
   0x0000fffff7f859dc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f859e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f859e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f859e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f859ec:	54000121	b.ne	0xfffff7f85a10  // b.any
   0x0000fffff7f859f0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f859f4:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f859f8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f859fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85a00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85a04:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f85a08:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f85a0c:	1400000e	b	0xfffff7f85a44
   0x0000fffff7f85a10:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85a14:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85a18:	aa1303e1	mov	x1, x19
   0x0000fffff7f85a1c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85a20:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7f85a24:	aa1403e4	mov	x4, x20
   0x0000fffff7f85a28:	aa1603e5	mov	x5, x22
   0x0000fffff7f85a2c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f85a30:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85a34:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85a38:	d63f0200	blr	x16
   0x0000fffff7f85a3c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85a40:	54007c00	b.eq	0xfffff7f869c0  // b.none
   0x0000fffff7f85a44:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85a48:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85a4c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85a50:	aa1503e2	mov	x2, x21
   0x0000fffff7f85a54:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7f85a58:	aa1403e4	mov	x4, x20
   0x0000fffff7f85a5c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85a60:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f85a64:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85a68:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85a6c:	d63f0200	blr	x16
   0x0000fffff7f85a70:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85a74:	54007aa0	b.eq	0xfffff7f869c8  // b.none
   0x0000fffff7f85a78:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f85a7c:	37d80269	tbnz	w9, #27, 0xfffff7f85ac8
   0x0000fffff7f85a80:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f85a84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85a88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85a8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85a90:	540001c1	b.ne	0xfffff7f85ac8  // b.any
   0x0000fffff7f85a94:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85a98:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85a9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85aa0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85aa4:	54000121	b.ne	0xfffff7f85ac8  // b.any
   0x0000fffff7f85aa8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f85aac:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f85ab0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85ab4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85ab8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85abc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f85ac0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f85ac4:	1400000e	b	0xfffff7f85afc
   0x0000fffff7f85ac8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85acc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85ad0:	aa1303e1	mov	x1, x19
   0x0000fffff7f85ad4:	aa1503e2	mov	x2, x21
   0x0000fffff7f85ad8:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7f85adc:	aa1403e4	mov	x4, x20
   0x0000fffff7f85ae0:	aa1603e5	mov	x5, x22
   0x0000fffff7f85ae4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f85ae8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85aec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85af0:	d63f0200	blr	x16
   0x0000fffff7f85af4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85af8:	540076c0	b.eq	0xfffff7f869d0  // b.none
   0x0000fffff7f85afc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85b00:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85b04:	aa1303e1	mov	x1, x19
   0x0000fffff7f85b08:	aa1503e2	mov	x2, x21
   0x0000fffff7f85b0c:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7f85b10:	aa1403e4	mov	x4, x20
   0x0000fffff7f85b14:	aa1603e5	mov	x5, x22
   0x0000fffff7f85b18:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f85b1c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85b20:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85b24:	d63f0200	blr	x16
   0x0000fffff7f85b28:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85b2c:	54007560	b.eq	0xfffff7f869d8  // b.none
   0x0000fffff7f85b30:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f85b34:	37d80269	tbnz	w9, #27, 0xfffff7f85b80
   0x0000fffff7f85b38:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f85b3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85b40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85b44:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85b48:	540001c1	b.ne	0xfffff7f85b80  // b.any
   0x0000fffff7f85b4c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85b50:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85b54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85b58:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85b5c:	54000121	b.ne	0xfffff7f85b80  // b.any
   0x0000fffff7f85b60:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f85b64:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f85b68:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85b6c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85b70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85b74:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f85b78:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f85b7c:	1400000e	b	0xfffff7f85bb4
   0x0000fffff7f85b80:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85b84:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85b88:	aa1303e1	mov	x1, x19
   0x0000fffff7f85b8c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85b90:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7f85b94:	aa1403e4	mov	x4, x20
   0x0000fffff7f85b98:	aa1603e5	mov	x5, x22
   0x0000fffff7f85b9c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f85ba0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85ba4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85ba8:	d63f0200	blr	x16
   0x0000fffff7f85bac:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85bb0:	54007180	b.eq	0xfffff7f869e0  // b.none
   0x0000fffff7f85bb4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85bb8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85bbc:	aa1303e1	mov	x1, x19
   0x0000fffff7f85bc0:	aa1503e2	mov	x2, x21
   0x0000fffff7f85bc4:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7f85bc8:	aa1403e4	mov	x4, x20
   0x0000fffff7f85bcc:	aa1603e5	mov	x5, x22
   0x0000fffff7f85bd0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f85bd4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85bd8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85bdc:	d63f0200	blr	x16
   0x0000fffff7f85be0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85be4:	54007020	b.eq	0xfffff7f869e8  // b.none
   0x0000fffff7f85be8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f85bec:	37d80269	tbnz	w9, #27, 0xfffff7f85c38
   0x0000fffff7f85bf0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f85bf4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85bf8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85bfc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85c00:	540001c1	b.ne	0xfffff7f85c38  // b.any
   0x0000fffff7f85c04:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85c08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85c0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85c10:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85c14:	54000121	b.ne	0xfffff7f85c38  // b.any
   0x0000fffff7f85c18:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f85c1c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f85c20:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85c24:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85c28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85c2c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f85c30:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f85c34:	1400000e	b	0xfffff7f85c6c
   0x0000fffff7f85c38:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85c3c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85c40:	aa1303e1	mov	x1, x19
   0x0000fffff7f85c44:	aa1503e2	mov	x2, x21
   0x0000fffff7f85c48:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7f85c4c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85c50:	aa1603e5	mov	x5, x22
   0x0000fffff7f85c54:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f85c58:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85c5c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85c60:	d63f0200	blr	x16
   0x0000fffff7f85c64:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85c68:	54006c40	b.eq	0xfffff7f869f0  // b.none
   0x0000fffff7f85c6c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85c70:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85c74:	aa1303e1	mov	x1, x19
   0x0000fffff7f85c78:	aa1503e2	mov	x2, x21
   0x0000fffff7f85c7c:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7f85c80:	aa1403e4	mov	x4, x20
   0x0000fffff7f85c84:	aa1603e5	mov	x5, x22
   0x0000fffff7f85c88:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f85c8c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85c90:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85c94:	d63f0200	blr	x16
   0x0000fffff7f85c98:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85c9c:	54006ae0	b.eq	0xfffff7f869f8  // b.none
   0x0000fffff7f85ca0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f85ca4:	37d80269	tbnz	w9, #27, 0xfffff7f85cf0
   0x0000fffff7f85ca8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f85cac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85cb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85cb4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85cb8:	540001c1	b.ne	0xfffff7f85cf0  // b.any
   0x0000fffff7f85cbc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85cc0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85cc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85cc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85ccc:	54000121	b.ne	0xfffff7f85cf0  // b.any
   0x0000fffff7f85cd0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f85cd4:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f85cd8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85cdc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85ce0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85ce4:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f85ce8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f85cec:	1400000e	b	0xfffff7f85d24
   0x0000fffff7f85cf0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85cf4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85cf8:	aa1303e1	mov	x1, x19
   0x0000fffff7f85cfc:	aa1503e2	mov	x2, x21
   0x0000fffff7f85d00:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7f85d04:	aa1403e4	mov	x4, x20
   0x0000fffff7f85d08:	aa1603e5	mov	x5, x22
   0x0000fffff7f85d0c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f85d10:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85d14:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85d18:	d63f0200	blr	x16
   0x0000fffff7f85d1c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85d20:	54006700	b.eq	0xfffff7f86a00  // b.none
   0x0000fffff7f85d24:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85d28:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85d2c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85d30:	aa1503e2	mov	x2, x21
   0x0000fffff7f85d34:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7f85d38:	aa1403e4	mov	x4, x20
   0x0000fffff7f85d3c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85d40:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f85d44:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85d48:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85d4c:	d63f0200	blr	x16
   0x0000fffff7f85d50:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85d54:	540065a0	b.eq	0xfffff7f86a08  // b.none
   0x0000fffff7f85d58:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f85d5c:	37d80269	tbnz	w9, #27, 0xfffff7f85da8
   0x0000fffff7f85d60:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f85d64:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85d68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85d6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85d70:	540001c1	b.ne	0xfffff7f85da8  // b.any
   0x0000fffff7f85d74:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85d78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85d7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85d80:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85d84:	54000121	b.ne	0xfffff7f85da8  // b.any
   0x0000fffff7f85d88:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f85d8c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f85d90:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85d94:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85d98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85d9c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f85da0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f85da4:	1400000e	b	0xfffff7f85ddc
   0x0000fffff7f85da8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85dac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85db0:	aa1303e1	mov	x1, x19
   0x0000fffff7f85db4:	aa1503e2	mov	x2, x21
   0x0000fffff7f85db8:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7f85dbc:	aa1403e4	mov	x4, x20
   0x0000fffff7f85dc0:	aa1603e5	mov	x5, x22
   0x0000fffff7f85dc4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f85dc8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85dcc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85dd0:	d63f0200	blr	x16
   0x0000fffff7f85dd4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85dd8:	540061c0	b.eq	0xfffff7f86a10  // b.none
   0x0000fffff7f85ddc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85de0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85de4:	aa1303e1	mov	x1, x19
   0x0000fffff7f85de8:	aa1503e2	mov	x2, x21
   0x0000fffff7f85dec:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7f85df0:	aa1403e4	mov	x4, x20
   0x0000fffff7f85df4:	aa1603e5	mov	x5, x22
   0x0000fffff7f85df8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f85dfc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85e00:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85e04:	d63f0200	blr	x16
   0x0000fffff7f85e08:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85e0c:	54006060	b.eq	0xfffff7f86a18  // b.none
   0x0000fffff7f85e10:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f85e14:	37d80269	tbnz	w9, #27, 0xfffff7f85e60
   0x0000fffff7f85e18:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f85e1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85e20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85e24:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85e28:	540001c1	b.ne	0xfffff7f85e60  // b.any
   0x0000fffff7f85e2c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85e30:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85e34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85e38:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85e3c:	54000121	b.ne	0xfffff7f85e60  // b.any
   0x0000fffff7f85e40:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f85e44:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f85e48:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85e4c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85e50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85e54:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f85e58:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f85e5c:	1400000e	b	0xfffff7f85e94
   0x0000fffff7f85e60:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85e64:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85e68:	aa1303e1	mov	x1, x19
   0x0000fffff7f85e6c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85e70:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7f85e74:	aa1403e4	mov	x4, x20
   0x0000fffff7f85e78:	aa1603e5	mov	x5, x22
   0x0000fffff7f85e7c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f85e80:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85e84:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85e88:	d63f0200	blr	x16
   0x0000fffff7f85e8c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85e90:	54005c80	b.eq	0xfffff7f86a20  // b.none
   0x0000fffff7f85e94:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85e98:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85e9c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85ea0:	aa1503e2	mov	x2, x21
   0x0000fffff7f85ea4:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7f85ea8:	aa1403e4	mov	x4, x20
   0x0000fffff7f85eac:	aa1603e5	mov	x5, x22
   0x0000fffff7f85eb0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f85eb4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85eb8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85ebc:	d63f0200	blr	x16
   0x0000fffff7f85ec0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85ec4:	54005b20	b.eq	0xfffff7f86a28  // b.none
   0x0000fffff7f85ec8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f85ecc:	37d80269	tbnz	w9, #27, 0xfffff7f85f18
   0x0000fffff7f85ed0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f85ed4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85ed8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85edc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85ee0:	540001c1	b.ne	0xfffff7f85f18  // b.any
   0x0000fffff7f85ee4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85ee8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85eec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85ef0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85ef4:	54000121	b.ne	0xfffff7f85f18  // b.any
   0x0000fffff7f85ef8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f85efc:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f85f00:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85f04:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85f08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85f0c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f85f10:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f85f14:	1400000e	b	0xfffff7f85f4c
   0x0000fffff7f85f18:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85f1c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85f20:	aa1303e1	mov	x1, x19
   0x0000fffff7f85f24:	aa1503e2	mov	x2, x21
   0x0000fffff7f85f28:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7f85f2c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85f30:	aa1603e5	mov	x5, x22
   0x0000fffff7f85f34:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f85f38:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85f3c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85f40:	d63f0200	blr	x16
   0x0000fffff7f85f44:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85f48:	54005740	b.eq	0xfffff7f86a30  // b.none
   0x0000fffff7f85f4c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85f50:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85f54:	aa1303e1	mov	x1, x19
   0x0000fffff7f85f58:	aa1503e2	mov	x2, x21
   0x0000fffff7f85f5c:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7f85f60:	aa1403e4	mov	x4, x20
   0x0000fffff7f85f64:	aa1603e5	mov	x5, x22
   0x0000fffff7f85f68:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f85f6c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85f70:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85f74:	d63f0200	blr	x16
   0x0000fffff7f85f78:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85f7c:	540055e0	b.eq	0xfffff7f86a38  // b.none
   0x0000fffff7f85f80:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f85f84:	37d80269	tbnz	w9, #27, 0xfffff7f85fd0
   0x0000fffff7f85f88:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f85f8c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85f90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85f94:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85f98:	540001c1	b.ne	0xfffff7f85fd0  // b.any
   0x0000fffff7f85f9c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85fa0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85fa4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85fa8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85fac:	54000121	b.ne	0xfffff7f85fd0  // b.any
   0x0000fffff7f85fb0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f85fb4:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f85fb8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85fbc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85fc0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85fc4:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f85fc8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f85fcc:	1400000e	b	0xfffff7f86004
   0x0000fffff7f85fd0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85fd4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85fd8:	aa1303e1	mov	x1, x19
   0x0000fffff7f85fdc:	aa1503e2	mov	x2, x21
   0x0000fffff7f85fe0:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7f85fe4:	aa1403e4	mov	x4, x20
   0x0000fffff7f85fe8:	aa1603e5	mov	x5, x22
   0x0000fffff7f85fec:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f85ff0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85ff4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85ff8:	d63f0200	blr	x16
   0x0000fffff7f85ffc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f86000:	54005200	b.eq	0xfffff7f86a40  // b.none
   0x0000fffff7f86004:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f86008:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8600c:	aa1303e1	mov	x1, x19
   0x0000fffff7f86010:	aa1503e2	mov	x2, x21
   0x0000fffff7f86014:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7f86018:	aa1403e4	mov	x4, x20
   0x0000fffff7f8601c:	aa1603e5	mov	x5, x22
   0x0000fffff7f86020:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f86024:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f86028:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8602c:	d63f0200	blr	x16
   0x0000fffff7f86030:	f100001f	cmp	x0, #0x0
   0x0000fffff7f86034:	540050a0	b.eq	0xfffff7f86a48  // b.none
   0x0000fffff7f86038:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f8603c:	37d80269	tbnz	w9, #27, 0xfffff7f86088
   0x0000fffff7f86040:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f86044:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86048:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8604c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86050:	540001c1	b.ne	0xfffff7f86088  // b.any
   0x0000fffff7f86054:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f86058:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8605c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86060:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86064:	54000121	b.ne	0xfffff7f86088  // b.any
   0x0000fffff7f86068:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f8606c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f86070:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f86074:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86078:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8607c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f86080:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f86084:	1400000e	b	0xfffff7f860bc
   0x0000fffff7f86088:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8608c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f86090:	aa1303e1	mov	x1, x19
   0x0000fffff7f86094:	aa1503e2	mov	x2, x21
   0x0000fffff7f86098:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7f8609c:	aa1403e4	mov	x4, x20
   0x0000fffff7f860a0:	aa1603e5	mov	x5, x22
   0x0000fffff7f860a4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f860a8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f860ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f860b0:	d63f0200	blr	x16
   0x0000fffff7f860b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f860b8:	54004cc0	b.eq	0xfffff7f86a50  // b.none
   0x0000fffff7f860bc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f860c0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f860c4:	aa1303e1	mov	x1, x19
   0x0000fffff7f860c8:	aa1503e2	mov	x2, x21
   0x0000fffff7f860cc:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7f860d0:	aa1403e4	mov	x4, x20
   0x0000fffff7f860d4:	aa1603e5	mov	x5, x22
   0x0000fffff7f860d8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f860dc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f860e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f860e4:	d63f0200	blr	x16
   0x0000fffff7f860e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f860ec:	54004b60	b.eq	0xfffff7f86a58  // b.none
   0x0000fffff7f860f0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f860f4:	37d80269	tbnz	w9, #27, 0xfffff7f86140
   0x0000fffff7f860f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f860fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86100:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86104:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86108:	540001c1	b.ne	0xfffff7f86140  // b.any
   0x0000fffff7f8610c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f86110:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86114:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86118:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8611c:	54000121	b.ne	0xfffff7f86140  // b.any
   0x0000fffff7f86120:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f86124:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f86128:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8612c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86130:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86134:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f86138:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f8613c:	1400000e	b	0xfffff7f86174
   0x0000fffff7f86140:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f86144:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f86148:	aa1303e1	mov	x1, x19
   0x0000fffff7f8614c:	aa1503e2	mov	x2, x21
   0x0000fffff7f86150:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7f86154:	aa1403e4	mov	x4, x20
   0x0000fffff7f86158:	aa1603e5	mov	x5, x22
   0x0000fffff7f8615c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f86160:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f86164:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f86168:	d63f0200	blr	x16
   0x0000fffff7f8616c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f86170:	54004780	b.eq	0xfffff7f86a60  // b.none
   0x0000fffff7f86174:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f86178:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8617c:	aa1303e1	mov	x1, x19
   0x0000fffff7f86180:	aa1503e2	mov	x2, x21
   0x0000fffff7f86184:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7f86188:	aa1403e4	mov	x4, x20
   0x0000fffff7f8618c:	aa1603e5	mov	x5, x22
   0x0000fffff7f86190:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f86194:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f86198:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8619c:	d63f0200	blr	x16
   0x0000fffff7f861a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f861a4:	54004620	b.eq	0xfffff7f86a68  // b.none
   0x0000fffff7f861a8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f861ac:	37d80269	tbnz	w9, #27, 0xfffff7f861f8
   0x0000fffff7f861b0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f861b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f861b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f861bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f861c0:	540001c1	b.ne	0xfffff7f861f8  // b.any
   0x0000fffff7f861c4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f861c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f861cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f861d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f861d4:	54000121	b.ne	0xfffff7f861f8  // b.any
   0x0000fffff7f861d8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f861dc:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f861e0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f861e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f861e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f861ec:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f861f0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f861f4:	1400000e	b	0xfffff7f8622c
   0x0000fffff7f861f8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f861fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f86200:	aa1303e1	mov	x1, x19
   0x0000fffff7f86204:	aa1503e2	mov	x2, x21
   0x0000fffff7f86208:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7f8620c:	aa1403e4	mov	x4, x20
   0x0000fffff7f86210:	aa1603e5	mov	x5, x22
   0x0000fffff7f86214:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f86218:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8621c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f86220:	d63f0200	blr	x16
   0x0000fffff7f86224:	f100001f	cmp	x0, #0x0
   0x0000fffff7f86228:	54004240	b.eq	0xfffff7f86a70  // b.none
   0x0000fffff7f8622c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f86230:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f86234:	aa1303e1	mov	x1, x19
   0x0000fffff7f86238:	aa1503e2	mov	x2, x21
   0x0000fffff7f8623c:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7f86240:	aa1403e4	mov	x4, x20
   0x0000fffff7f86244:	aa1603e5	mov	x5, x22
   0x0000fffff7f86248:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8624c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f86250:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f86254:	d63f0200	blr	x16
   0x0000fffff7f86258:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8625c:	540040e0	b.eq	0xfffff7f86a78  // b.none
   0x0000fffff7f86260:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f86264:	37d80269	tbnz	w9, #27, 0xfffff7f862b0
   0x0000fffff7f86268:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f8626c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86270:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86274:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86278:	540001c1	b.ne	0xfffff7f862b0  // b.any
   0x0000fffff7f8627c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f86280:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86284:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86288:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8628c:	54000121	b.ne	0xfffff7f862b0  // b.any
   0x0000fffff7f86290:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f86294:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f86298:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8629c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f862a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f862a4:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f862a8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f862ac:	1400000e	b	0xfffff7f862e4
   0x0000fffff7f862b0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f862b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f862b8:	aa1303e1	mov	x1, x19
   0x0000fffff7f862bc:	aa1503e2	mov	x2, x21
   0x0000fffff7f862c0:	d2800683	mov	x3, #0x34                  	// #52
   0x0000fffff7f862c4:	aa1403e4	mov	x4, x20
   0x0000fffff7f862c8:	aa1603e5	mov	x5, x22
   0x0000fffff7f862cc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f862d0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f862d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f862d8:	d63f0200	blr	x16
   0x0000fffff7f862dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f862e0:	54003d00	b.eq	0xfffff7f86a80  // b.none
   0x0000fffff7f862e4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f862e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f862ec:	aa1303e1	mov	x1, x19
   0x0000fffff7f862f0:	aa1503e2	mov	x2, x21
   0x0000fffff7f862f4:	d28006a3	mov	x3, #0x35                  	// #53
   0x0000fffff7f862f8:	aa1403e4	mov	x4, x20
   0x0000fffff7f862fc:	aa1603e5	mov	x5, x22
   0x0000fffff7f86300:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f86304:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f86308:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8630c:	d63f0200	blr	x16
   0x0000fffff7f86310:	f100001f	cmp	x0, #0x0
   0x0000fffff7f86314:	54003ba0	b.eq	0xfffff7f86a88  // b.none
   0x0000fffff7f86318:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f8631c:	37d80269	tbnz	w9, #27, 0xfffff7f86368
   0x0000fffff7f86320:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f86324:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86328:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8632c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86330:	540001c1	b.ne	0xfffff7f86368  // b.any
   0x0000fffff7f86334:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f86338:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8633c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86340:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86344:	54000121	b.ne	0xfffff7f86368  // b.any
   0x0000fffff7f86348:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f8634c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f86350:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f86354:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86358:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8635c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f86360:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f86364:	1400000e	b	0xfffff7f8639c
   0x0000fffff7f86368:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8636c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f86370:	aa1303e1	mov	x1, x19
   0x0000fffff7f86374:	aa1503e2	mov	x2, x21
   0x0000fffff7f86378:	d28006c3	mov	x3, #0x36                  	// #54
   0x0000fffff7f8637c:	aa1403e4	mov	x4, x20
   0x0000fffff7f86380:	aa1603e5	mov	x5, x22
   0x0000fffff7f86384:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f86388:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8638c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f86390:	d63f0200	blr	x16
   0x0000fffff7f86394:	f100001f	cmp	x0, #0x0
   0x0000fffff7f86398:	540037c0	b.eq	0xfffff7f86a90  // b.none
   0x0000fffff7f8639c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f863a0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f863a4:	aa1303e1	mov	x1, x19
   0x0000fffff7f863a8:	aa1503e2	mov	x2, x21
   0x0000fffff7f863ac:	d28006e3	mov	x3, #0x37                  	// #55
   0x0000fffff7f863b0:	aa1403e4	mov	x4, x20
   0x0000fffff7f863b4:	aa1603e5	mov	x5, x22
   0x0000fffff7f863b8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f863bc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f863c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f863c4:	d63f0200	blr	x16
   0x0000fffff7f863c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f863cc:	54003660	b.eq	0xfffff7f86a98  // b.none
   0x0000fffff7f863d0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f863d4:	37d80269	tbnz	w9, #27, 0xfffff7f86420
   0x0000fffff7f863d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f863dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f863e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f863e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f863e8:	540001c1	b.ne	0xfffff7f86420  // b.any
   0x0000fffff7f863ec:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f863f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f863f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f863f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f863fc:	54000121	b.ne	0xfffff7f86420  // b.any
   0x0000fffff7f86400:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f86404:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f86408:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8640c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86410:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86414:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f86418:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f8641c:	1400000e	b	0xfffff7f86454
   0x0000fffff7f86420:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f86424:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f86428:	aa1303e1	mov	x1, x19
   0x0000fffff7f8642c:	aa1503e2	mov	x2, x21
   0x0000fffff7f86430:	d2800703	mov	x3, #0x38                  	// #56
   0x0000fffff7f86434:	aa1403e4	mov	x4, x20
   0x0000fffff7f86438:	aa1603e5	mov	x5, x22
   0x0000fffff7f8643c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f86440:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f86444:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f86448:	d63f0200	blr	x16
   0x0000fffff7f8644c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f86450:	54003280	b.eq	0xfffff7f86aa0  // b.none
   0x0000fffff7f86454:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f86458:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8645c:	aa1303e1	mov	x1, x19
   0x0000fffff7f86460:	aa1503e2	mov	x2, x21
   0x0000fffff7f86464:	d2800723	mov	x3, #0x39                  	// #57
   0x0000fffff7f86468:	aa1403e4	mov	x4, x20
   0x0000fffff7f8646c:	aa1603e5	mov	x5, x22
   0x0000fffff7f86470:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f86474:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f86478:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8647c:	d63f0200	blr	x16
   0x0000fffff7f86480:	f100001f	cmp	x0, #0x0
   0x0000fffff7f86484:	54003120	b.eq	0xfffff7f86aa8  // b.none
   0x0000fffff7f86488:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f8648c:	37d80269	tbnz	w9, #27, 0xfffff7f864d8
   0x0000fffff7f86490:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f86494:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86498:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8649c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f864a0:	540001c1	b.ne	0xfffff7f864d8  // b.any
   0x0000fffff7f864a4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f864a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f864ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f864b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f864b4:	54000121	b.ne	0xfffff7f864d8  // b.any
   0x0000fffff7f864b8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f864bc:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f864c0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f864c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f864c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f864cc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f864d0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f864d4:	1400000e	b	0xfffff7f8650c
   0x0000fffff7f864d8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f864dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f864e0:	aa1303e1	mov	x1, x19
   0x0000fffff7f864e4:	aa1503e2	mov	x2, x21
   0x0000fffff7f864e8:	d2800743	mov	x3, #0x3a                  	// #58
   0x0000fffff7f864ec:	aa1403e4	mov	x4, x20
   0x0000fffff7f864f0:	aa1603e5	mov	x5, x22
   0x0000fffff7f864f4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f864f8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f864fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f86500:	d63f0200	blr	x16
   0x0000fffff7f86504:	f100001f	cmp	x0, #0x0
   0x0000fffff7f86508:	54002d40	b.eq	0xfffff7f86ab0  // b.none
   0x0000fffff7f8650c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f86510:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f86514:	aa1303e1	mov	x1, x19
   0x0000fffff7f86518:	aa1503e2	mov	x2, x21
   0x0000fffff7f8651c:	d2800763	mov	x3, #0x3b                  	// #59
   0x0000fffff7f86520:	aa1403e4	mov	x4, x20
   0x0000fffff7f86524:	aa1603e5	mov	x5, x22
   0x0000fffff7f86528:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8652c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f86530:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f86534:	d63f0200	blr	x16
   0x0000fffff7f86538:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8653c:	54002be0	b.eq	0xfffff7f86ab8  // b.none
   0x0000fffff7f86540:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f86544:	37d80269	tbnz	w9, #27, 0xfffff7f86590
   0x0000fffff7f86548:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f8654c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86550:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86554:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86558:	540001c1	b.ne	0xfffff7f86590  // b.any
   0x0000fffff7f8655c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f86560:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86564:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86568:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8656c:	54000121	b.ne	0xfffff7f86590  // b.any
   0x0000fffff7f86570:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f86574:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f86578:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8657c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86580:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86584:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f86588:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f8658c:	1400000e	b	0xfffff7f865c4
   0x0000fffff7f86590:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f86594:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f86598:	aa1303e1	mov	x1, x19
   0x0000fffff7f8659c:	aa1503e2	mov	x2, x21
   0x0000fffff7f865a0:	d2800783	mov	x3, #0x3c                  	// #60
   0x0000fffff7f865a4:	aa1403e4	mov	x4, x20
   0x0000fffff7f865a8:	aa1603e5	mov	x5, x22
   0x0000fffff7f865ac:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f865b0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f865b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f865b8:	d63f0200	blr	x16
   0x0000fffff7f865bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f865c0:	54002800	b.eq	0xfffff7f86ac0  // b.none
   0x0000fffff7f865c4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f865c8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f865cc:	aa1303e1	mov	x1, x19
   0x0000fffff7f865d0:	aa1503e2	mov	x2, x21
   0x0000fffff7f865d4:	d28007a3	mov	x3, #0x3d                  	// #61
   0x0000fffff7f865d8:	aa1403e4	mov	x4, x20
   0x0000fffff7f865dc:	aa1603e5	mov	x5, x22
   0x0000fffff7f865e0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f865e4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f865e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f865ec:	d63f0200	blr	x16
   0x0000fffff7f865f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f865f4:	540026a0	b.eq	0xfffff7f86ac8  // b.none
   0x0000fffff7f865f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f865fc:	37d80269	tbnz	w9, #27, 0xfffff7f86648
   0x0000fffff7f86600:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f86604:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86608:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8660c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86610:	540001c1	b.ne	0xfffff7f86648  // b.any
   0x0000fffff7f86614:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f86618:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8661c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86620:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86624:	54000121	b.ne	0xfffff7f86648  // b.any
   0x0000fffff7f86628:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f8662c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f86630:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f86634:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86638:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8663c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f86640:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f86644:	1400000e	b	0xfffff7f8667c
   0x0000fffff7f86648:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8664c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f86650:	aa1303e1	mov	x1, x19
   0x0000fffff7f86654:	aa1503e2	mov	x2, x21
   0x0000fffff7f86658:	d28007c3	mov	x3, #0x3e                  	// #62
   0x0000fffff7f8665c:	aa1403e4	mov	x4, x20
   0x0000fffff7f86660:	aa1603e5	mov	x5, x22
   0x0000fffff7f86664:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f86668:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8666c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f86670:	d63f0200	blr	x16
   0x0000fffff7f86674:	f100001f	cmp	x0, #0x0
   0x0000fffff7f86678:	540022c0	b.eq	0xfffff7f86ad0  // b.none
   0x0000fffff7f8667c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f86680:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f86684:	aa1303e1	mov	x1, x19
   0x0000fffff7f86688:	aa1503e2	mov	x2, x21
   0x0000fffff7f8668c:	d28007e3	mov	x3, #0x3f                  	// #63
   0x0000fffff7f86690:	aa1403e4	mov	x4, x20
   0x0000fffff7f86694:	aa1603e5	mov	x5, x22
   0x0000fffff7f86698:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8669c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f866a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f866a4:	d63f0200	blr	x16
   0x0000fffff7f866a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f866ac:	54002160	b.eq	0xfffff7f86ad8  // b.none
   0x0000fffff7f866b0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f866b4:	37d80269	tbnz	w9, #27, 0xfffff7f86700
   0x0000fffff7f866b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f866bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f866c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f866c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f866c8:	540001c1	b.ne	0xfffff7f86700  // b.any
   0x0000fffff7f866cc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f866d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f866d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f866d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f866dc:	54000121	b.ne	0xfffff7f86700  // b.any
   0x0000fffff7f866e0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f866e4:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f866e8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f866ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f866f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f866f4:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f866f8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f866fc:	1400000e	b	0xfffff7f86734
   0x0000fffff7f86700:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f86704:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f86708:	aa1303e1	mov	x1, x19
   0x0000fffff7f8670c:	aa1503e2	mov	x2, x21
   0x0000fffff7f86710:	d2800803	mov	x3, #0x40                  	// #64
   0x0000fffff7f86714:	aa1403e4	mov	x4, x20
   0x0000fffff7f86718:	aa1603e5	mov	x5, x22
   0x0000fffff7f8671c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f86720:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f86724:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f86728:	d63f0200	blr	x16
   0x0000fffff7f8672c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f86730:	54001d80	b.eq	0xfffff7f86ae0  // b.none
   0x0000fffff7f86734:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f86738:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8673c:	aa1303e1	mov	x1, x19
   0x0000fffff7f86740:	aa1503e2	mov	x2, x21
   0x0000fffff7f86744:	d2800823	mov	x3, #0x41                  	// #65
   0x0000fffff7f86748:	aa1403e4	mov	x4, x20
   0x0000fffff7f8674c:	aa1603e5	mov	x5, x22
   0x0000fffff7f86750:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f86754:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f86758:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8675c:	d63f0200	blr	x16
   0x0000fffff7f86760:	f100001f	cmp	x0, #0x0
   0x0000fffff7f86764:	54001c20	b.eq	0xfffff7f86ae8  // b.none
   0x0000fffff7f86768:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f8676c:	37d80269	tbnz	w9, #27, 0xfffff7f867b8
   0x0000fffff7f86770:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f86774:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86778:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8677c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86780:	540001c1	b.ne	0xfffff7f867b8  // b.any
   0x0000fffff7f86784:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f86788:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8678c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86790:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86794:	54000121	b.ne	0xfffff7f867b8  // b.any
   0x0000fffff7f86798:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f8679c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f867a0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f867a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f867a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f867ac:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f867b0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f867b4:	1400000e	b	0xfffff7f867ec
   0x0000fffff7f867b8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f867bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f867c0:	aa1303e1	mov	x1, x19
   0x0000fffff7f867c4:	aa1503e2	mov	x2, x21
   0x0000fffff7f867c8:	d2800843	mov	x3, #0x42                  	// #66
   0x0000fffff7f867cc:	aa1403e4	mov	x4, x20
   0x0000fffff7f867d0:	aa1603e5	mov	x5, x22
   0x0000fffff7f867d4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f867d8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f867dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f867e0:	d63f0200	blr	x16
   0x0000fffff7f867e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f867e8:	54001840	b.eq	0xfffff7f86af0  // b.none
   0x0000fffff7f867ec:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f867f0:	37d80269	tbnz	w9, #27, 0xfffff7f8683c
   0x0000fffff7f867f4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f867f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f867fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86800:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86804:	540001c1	b.ne	0xfffff7f8683c  // b.any
   0x0000fffff7f86808:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8680c:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7f86810:	8b0a012b	add	x11, x9, x10
   0x0000fffff7f86814:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f86818:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8681c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86820:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f86824:	aa0b03e9	mov	x9, x11
   0x0000fffff7f86828:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8682c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86830:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f86834:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f86838:	1400000e	b	0xfffff7f86870
   0x0000fffff7f8683c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f86840:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f86844:	aa1303e1	mov	x1, x19
   0x0000fffff7f86848:	aa1503e2	mov	x2, x21
   0x0000fffff7f8684c:	d2800863	mov	x3, #0x43                  	// #67
   0x0000fffff7f86850:	aa1403e4	mov	x4, x20
   0x0000fffff7f86854:	aa1603e5	mov	x5, x22
   0x0000fffff7f86858:	d2916810	mov	x16, #0x8b40                	// #35648
   0x0000fffff7f8685c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f86860:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f86864:	d63f0200	blr	x16
   0x0000fffff7f86868:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8686c:	54001460	b.eq	0xfffff7f86af8  // b.none
   0x0000fffff7f86870:	17fffa24	b	0xfffff7f85100
   0x0000fffff7f86874:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f86878:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8687c:	aa1303e1	mov	x1, x19
   0x0000fffff7f86880:	aa1503e2	mov	x2, x21
   0x0000fffff7f86884:	d28008a3	mov	x3, #0x45                  	// #69
   0x0000fffff7f86888:	aa1403e4	mov	x4, x20
   0x0000fffff7f8688c:	aa1603e5	mov	x5, x22
   0x0000fffff7f86890:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7f86894:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f86898:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8689c:	d63f0200	blr	x16
   0x0000fffff7f868a0:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f868a4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f868a8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f868ac:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f868b0:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f868b4:	d65f03c0	ret
   0x0000fffff7f868b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f868bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f868c0:	b900028a	str	w10, [x20]
   0x0000fffff7f868c4:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f868c8:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f868cc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f868d0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f868d4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f868d8:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f868dc:	d65f03c0	ret
   0x0000fffff7f868e0:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f868e4:	17fffff5	b	0xfffff7f868b8
   0x0000fffff7f868e8:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f868ec:	17fffff3	b	0xfffff7f868b8
   0x0000fffff7f868f0:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f868f4:	17fffff1	b	0xfffff7f868b8
   0x0000fffff7f868f8:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f868fc:	17ffffef	b	0xfffff7f868b8
   0x0000fffff7f86900:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f86904:	17ffffed	b	0xfffff7f868b8
   0x0000fffff7f86908:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f8690c:	17ffffeb	b	0xfffff7f868b8
   0x0000fffff7f86910:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f86914:	17ffffe9	b	0xfffff7f868b8
   0x0000fffff7f86918:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f8691c:	17ffffe7	b	0xfffff7f868b8
   0x0000fffff7f86920:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f86924:	17ffffe5	b	0xfffff7f868b8
   0x0000fffff7f86928:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f8692c:	17ffffe3	b	0xfffff7f868b8
   0x0000fffff7f86930:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7f86934:	17ffffe1	b	0xfffff7f868b8
   0x0000fffff7f86938:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7f8693c:	17ffffdf	b	0xfffff7f868b8
   0x0000fffff7f86940:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7f86944:	17ffffdd	b	0xfffff7f868b8
   0x0000fffff7f86948:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7f8694c:	17ffffdb	b	0xfffff7f868b8
   0x0000fffff7f86950:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7f86954:	17ffffd9	b	0xfffff7f868b8
   0x0000fffff7f86958:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7f8695c:	17ffffd7	b	0xfffff7f868b8
   0x0000fffff7f86960:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7f86964:	17ffffd5	b	0xfffff7f868b8
   0x0000fffff7f86968:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7f8696c:	17ffffd3	b	0xfffff7f868b8
   0x0000fffff7f86970:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7f86974:	17ffffd1	b	0xfffff7f868b8
   0x0000fffff7f86978:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7f8697c:	17ffffcf	b	0xfffff7f868b8
   0x0000fffff7f86980:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7f86984:	17ffffcd	b	0xfffff7f868b8
   0x0000fffff7f86988:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7f8698c:	17ffffcb	b	0xfffff7f868b8
   0x0000fffff7f86990:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7f86994:	17ffffc9	b	0xfffff7f868b8
   0x0000fffff7f86998:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7f8699c:	17ffffc7	b	0xfffff7f868b8
   0x0000fffff7f869a0:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7f869a4:	17ffffc5	b	0xfffff7f868b8
   0x0000fffff7f869a8:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7f869ac:	17ffffc3	b	0xfffff7f868b8
   0x0000fffff7f869b0:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7f869b4:	17ffffc1	b	0xfffff7f868b8
   0x0000fffff7f869b8:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7f869bc:	17ffffbf	b	0xfffff7f868b8
   0x0000fffff7f869c0:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7f869c4:	17ffffbd	b	0xfffff7f868b8
   0x0000fffff7f869c8:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7f869cc:	17ffffbb	b	0xfffff7f868b8
   0x0000fffff7f869d0:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7f869d4:	17ffffb9	b	0xfffff7f868b8
   0x0000fffff7f869d8:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7f869dc:	17ffffb7	b	0xfffff7f868b8
   0x0000fffff7f869e0:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7f869e4:	17ffffb5	b	0xfffff7f868b8
   0x0000fffff7f869e8:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7f869ec:	17ffffb3	b	0xfffff7f868b8
   0x0000fffff7f869f0:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7f869f4:	17ffffb1	b	0xfffff7f868b8
   0x0000fffff7f869f8:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7f869fc:	17ffffaf	b	0xfffff7f868b8
   0x0000fffff7f86a00:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7f86a04:	17ffffad	b	0xfffff7f868b8
   0x0000fffff7f86a08:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7f86a0c:	17ffffab	b	0xfffff7f868b8
   0x0000fffff7f86a10:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7f86a14:	17ffffa9	b	0xfffff7f868b8
   0x0000fffff7f86a18:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7f86a1c:	17ffffa7	b	0xfffff7f868b8
   0x0000fffff7f86a20:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7f86a24:	17ffffa5	b	0xfffff7f868b8
   0x0000fffff7f86a28:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7f86a2c:	17ffffa3	b	0xfffff7f868b8
   0x0000fffff7f86a30:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7f86a34:	17ffffa1	b	0xfffff7f868b8
   0x0000fffff7f86a38:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7f86a3c:	17ffff9f	b	0xfffff7f868b8
   0x0000fffff7f86a40:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7f86a44:	17ffff9d	b	0xfffff7f868b8
   0x0000fffff7f86a48:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7f86a4c:	17ffff9b	b	0xfffff7f868b8
   0x0000fffff7f86a50:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7f86a54:	17ffff99	b	0xfffff7f868b8
   0x0000fffff7f86a58:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7f86a5c:	17ffff97	b	0xfffff7f868b8
   0x0000fffff7f86a60:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7f86a64:	17ffff95	b	0xfffff7f868b8
   0x0000fffff7f86a68:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7f86a6c:	17ffff93	b	0xfffff7f868b8
   0x0000fffff7f86a70:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7f86a74:	17ffff91	b	0xfffff7f868b8
   0x0000fffff7f86a78:	d2800669	mov	x9, #0x33                  	// #51
   0x0000fffff7f86a7c:	17ffff8f	b	0xfffff7f868b8
   0x0000fffff7f86a80:	d2800689	mov	x9, #0x34                  	// #52
   0x0000fffff7f86a84:	17ffff8d	b	0xfffff7f868b8
   0x0000fffff7f86a88:	d28006a9	mov	x9, #0x35                  	// #53
   0x0000fffff7f86a8c:	17ffff8b	b	0xfffff7f868b8
   0x0000fffff7f86a90:	d28006c9	mov	x9, #0x36                  	// #54
   0x0000fffff7f86a94:	17ffff89	b	0xfffff7f868b8
   0x0000fffff7f86a98:	d28006e9	mov	x9, #0x37                  	// #55
   0x0000fffff7f86a9c:	17ffff87	b	0xfffff7f868b8
   0x0000fffff7f86aa0:	d2800709	mov	x9, #0x38                  	// #56
   0x0000fffff7f86aa4:	17ffff85	b	0xfffff7f868b8
   0x0000fffff7f86aa8:	d2800729	mov	x9, #0x39                  	// #57
   0x0000fffff7f86aac:	17ffff83	b	0xfffff7f868b8
   0x0000fffff7f86ab0:	d2800749	mov	x9, #0x3a                  	// #58
   0x0000fffff7f86ab4:	17ffff81	b	0xfffff7f868b8
   0x0000fffff7f86ab8:	d2800769	mov	x9, #0x3b                  	// #59
   0x0000fffff7f86abc:	17ffff7f	b	0xfffff7f868b8
   0x0000fffff7f86ac0:	d2800789	mov	x9, #0x3c                  	// #60
   0x0000fffff7f86ac4:	17ffff7d	b	0xfffff7f868b8
   0x0000fffff7f86ac8:	d28007a9	mov	x9, #0x3d                  	// #61
   0x0000fffff7f86acc:	17ffff7b	b	0xfffff7f868b8
   0x0000fffff7f86ad0:	d28007c9	mov	x9, #0x3e                  	// #62
   0x0000fffff7f86ad4:	17ffff79	b	0xfffff7f868b8
   0x0000fffff7f86ad8:	d28007e9	mov	x9, #0x3f                  	// #63
   0x0000fffff7f86adc:	17ffff77	b	0xfffff7f868b8
   0x0000fffff7f86ae0:	d2800809	mov	x9, #0x40                  	// #64
   0x0000fffff7f86ae4:	17ffff75	b	0xfffff7f868b8
   0x0000fffff7f86ae8:	d2800829	mov	x9, #0x41                  	// #65
   0x0000fffff7f86aec:	17ffff73	b	0xfffff7f868b8
   0x0000fffff7f86af0:	d2800849	mov	x9, #0x42                  	// #66
   0x0000fffff7f86af4:	17ffff71	b	0xfffff7f868b8
   0x0000fffff7f86af8:	d2800869	mov	x9, #0x43                  	// #67
   0x0000fffff7f86afc:	17ffff6f	b	0xfffff7f868b8
   0x0000fffff7f86b00:	00000000	udf	#0
   0x0000fffff7f86b04:	00000000	udf	#0
   0x0000fffff7f86b08:	00000000	udf	#0
   0x0000fffff7f86b0c:	00000000	udf	#0
   0x0000fffff7f86b10:	00000000	udf	#0
   0x0000fffff7f86b14:	00000000	udf	#0
   0x0000fffff7f86b18:	00000000	udf	#0
   0x0000fffff7f86b1c:	00000000	udf	#0
   0x0000fffff7f86b20:	00000000	udf	#0
   0x0000fffff7f86b24:	00000000	udf	#0
   0x0000fffff7f86b28:	00000000	udf	#0
   0x0000fffff7f86b2c:	00000000	udf	#0
   0x0000fffff7f86b30:	00000000	udf	#0
   0x0000fffff7f86b34:	00000000	udf	#0
   0x0000fffff7f86b38:	00000000	udf	#0
   0x0000fffff7f86b3c:	00000000	udf	#0
   0x0000fffff7f86b40:	00000000	udf	#0
   0x0000fffff7f86b44:	00000000	udf	#0
   0x0000fffff7f86b48:	00000000	udf	#0
   0x0000fffff7f86b4c:	00000000	udf	#0
   0x0000fffff7f86b50:	00000000	udf	#0
   0x0000fffff7f86b54:	00000000	udf	#0
   0x0000fffff7f86b58:	00000000	udf	#0
   0x0000fffff7f86b5c:	00000000	udf	#0
   0x0000fffff7f86b60:	00000000	udf	#0
   0x0000fffff7f86b64:	00000000	udf	#0
   0x0000fffff7f86b68:	00000000	udf	#0
   0x0000fffff7f86b6c:	00000000	udf	#0
   0x0000fffff7f86b70:	00000000	udf	#0
   0x0000fffff7f86b74:	00000000	udf	#0
   0x0000fffff7f86b78:	00000000	udf	#0
   0x0000fffff7f86b7c:	00000000	udf	#0
   0x0000fffff7f86b80:	00000000	udf	#0
   0x0000fffff7f86b84:	00000000	udf	#0
   0x0000fffff7f86b88:	00000000	udf	#0
   0x0000fffff7f86b8c:	00000000	udf	#0
   0x0000fffff7f86b90:	00000000	udf	#0
   0x0000fffff7f86b94:	00000000	udf	#0
   0x0000fffff7f86b98:	00000000	udf	#0
   0x0000fffff7f86b9c:	00000000	udf	#0
   0x0000fffff7f86ba0:	00000000	udf	#0
   0x0000fffff7f86ba4:	00000000	udf	#0
   0x0000fffff7f86ba8:	00000000	udf	#0
   0x0000fffff7f86bac:	00000000	udf	#0
   0x0000fffff7f86bb0:	00000000	udf	#0
   0x0000fffff7f86bb4:	00000000	udf	#0
   0x0000fffff7f86bb8:	00000000	udf	#0
   0x0000fffff7f86bbc:	00000000	udf	#0
   0x0000fffff7f86bc0:	00000000	udf	#0
   0x0000fffff7f86bc4:	00000000	udf	#0
   0x0000fffff7f86bc8:	00000000	udf	#0
   0x0000fffff7f86bcc:	00000000	udf	#0
   0x0000fffff7f86bd0:	00000000	udf	#0
   0x0000fffff7f86bd4:	00000000	udf	#0
   0x0000fffff7f86bd8:	00000000	udf	#0
   0x0000fffff7f86bdc:	00000000	udf	#0
   0x0000fffff7f86be0:	00000000	udf	#0
   0x0000fffff7f86be4:	00000000	udf	#0
   0x0000fffff7f86be8:	00000000	udf	#0
   0x0000fffff7f86bec:	00000000	udf	#0
   0x0000fffff7f86bf0:	00000000	udf	#0
   0x0000fffff7f86bf4:	00000000	udf	#0
   0x0000fffff7f86bf8:	00000000	udf	#0
   0x0000fffff7f86bfc:	00000000	udf	#0
   0x0000fffff7f86c00:	00000000	udf	#0
   0x0000fffff7f86c04:	00000000	udf	#0
   0x0000fffff7f86c08:	00000000	udf	#0
   0x0000fffff7f86c0c:	00000000	udf	#0
   0x0000fffff7f86c10:	00000000	udf	#0
   0x0000fffff7f86c14:	00000000	udf	#0
   0x0000fffff7f86c18:	00000000	udf	#0
   0x0000fffff7f86c1c:	00000000	udf	#0
   0x0000fffff7f86c20:	00000000	udf	#0
   0x0000fffff7f86c24:	00000000	udf	#0
   0x0000fffff7f86c28:	00000000	udf	#0
   0x0000fffff7f86c2c:	00000000	udf	#0
   0x0000fffff7f86c30:	00000000	udf	#0
   0x0000fffff7f86c34:	00000000	udf	#0
   0x0000fffff7f86c38:	00000000	udf	#0
   0x0000fffff7f86c3c:	00000000	udf	#0
   0x0000fffff7f86c40:	00000000	udf	#0
   0x0000fffff7f86c44:	00000000	udf	#0
   0x0000fffff7f86c48:	00000000	udf	#0
   0x0000fffff7f86c4c:	00000000	udf	#0
   0x0000fffff7f86c50:	00000000	udf	#0
   0x0000fffff7f86c54:	00000000	udf	#0
   0x0000fffff7f86c58:	00000000	udf	#0
   0x0000fffff7f86c5c:	00000000	udf	#0
   0x0000fffff7f86c60:	00000000	udf	#0
   0x0000fffff7f86c64:	00000000	udf	#0
   0x0000fffff7f86c68:	00000000	udf	#0
   0x0000fffff7f86c6c:	00000000	udf	#0
   0x0000fffff7f86c70:	00000000	udf	#0
   0x0000fffff7f86c74:	00000000	udf	#0
   0x0000fffff7f86c78:	00000000	udf	#0
   0x0000fffff7f86c7c:	00000000	udf	#0
   0x0000fffff7f86c80:	00000000	udf	#0
   0x0000fffff7f86c84:	00000000	udf	#0
   0x0000fffff7f86c88:	00000000	udf	#0
   0x0000fffff7f86c8c:	00000000	udf	#0
   0x0000fffff7f86c90:	00000000	udf	#0
   0x0000fffff7f86c94:	00000000	udf	#0
   0x0000fffff7f86c98:	00000000	udf	#0
   0x0000fffff7f86c9c:	00000000	udf	#0
   0x0000fffff7f86ca0:	00000000	udf	#0
   0x0000fffff7f86ca4:	00000000	udf	#0
   0x0000fffff7f86ca8:	00000000	udf	#0
   0x0000fffff7f86cac:	00000000	udf	#0
   0x0000fffff7f86cb0:	00000000	udf	#0
   0x0000fffff7f86cb4:	00000000	udf	#0
   0x0000fffff7f86cb8:	00000000	udf	#0
   0x0000fffff7f86cbc:	00000000	udf	#0
   0x0000fffff7f86cc0:	00000000	udf	#0
   0x0000fffff7f86cc4:	00000000	udf	#0
   0x0000fffff7f86cc8:	00000000	udf	#0
   0x0000fffff7f86ccc:	00000000	udf	#0
   0x0000fffff7f86cd0:	00000000	udf	#0
   0x0000fffff7f86cd4:	00000000	udf	#0
   0x0000fffff7f86cd8:	00000000	udf	#0
   0x0000fffff7f86cdc:	00000000	udf	#0
   0x0000fffff7f86ce0:	00000000	udf	#0
   0x0000fffff7f86ce4:	00000000	udf	#0
   0x0000fffff7f86ce8:	00000000	udf	#0
   0x0000fffff7f86cec:	00000000	udf	#0
   0x0000fffff7f86cf0:	00000000	udf	#0
   0x0000fffff7f86cf4:	00000000	udf	#0
   0x0000fffff7f86cf8:	00000000	udf	#0
   0x0000fffff7f86cfc:	00000000	udf	#0
   0x0000fffff7f86d00:	00000000	udf	#0
   0x0000fffff7f86d04:	00000000	udf	#0
   0x0000fffff7f86d08:	00000000	udf	#0
   0x0000fffff7f86d0c:	00000000	udf	#0
   0x0000fffff7f86d10:	00000000	udf	#0
   0x0000fffff7f86d14:	00000000	udf	#0
   0x0000fffff7f86d18:	00000000	udf	#0
   0x0000fffff7f86d1c:	00000000	udf	#0
   0x0000fffff7f86d20:	00000000	udf	#0
   0x0000fffff7f86d24:	00000000	udf	#0
   0x0000fffff7f86d28:	00000000	udf	#0
   0x0000fffff7f86d2c:	00000000	udf	#0
   0x0000fffff7f86d30:	00000000	udf	#0
   0x0000fffff7f86d34:	00000000	udf	#0
   0x0000fffff7f86d38:	00000000	udf	#0
   0x0000fffff7f86d3c:	00000000	udf	#0
   0x0000fffff7f86d40:	00000000	udf	#0
   0x0000fffff7f86d44:	00000000	udf	#0
   0x0000fffff7f86d48:	00000000	udf	#0
   0x0000fffff7f86d4c:	00000000	udf	#0
   0x0000fffff7f86d50:	00000000	udf	#0
   0x0000fffff7f86d54:	00000000	udf	#0
   0x0000fffff7f86d58:	00000000	udf	#0
   0x0000fffff7f86d5c:	00000000	udf	#0
   0x0000fffff7f86d60:	00000000	udf	#0
   0x0000fffff7f86d64:	00000000	udf	#0
   0x0000fffff7f86d68:	00000000	udf	#0
   0x0000fffff7f86d6c:	00000000	udf	#0
   0x0000fffff7f86d70:	00000000	udf	#0
   0x0000fffff7f86d74:	00000000	udf	#0
   0x0000fffff7f86d78:	00000000	udf	#0
   0x0000fffff7f86d7c:	00000000	udf	#0
   0x0000fffff7f86d80:	00000000	udf	#0
   0x0000fffff7f86d84:	00000000	udf	#0
   0x0000fffff7f86d88:	00000000	udf	#0
   0x0000fffff7f86d8c:	00000000	udf	#0
   0x0000fffff7f86d90:	00000000	udf	#0
   0x0000fffff7f86d94:	00000000	udf	#0
   0x0000fffff7f86d98:	00000000	udf	#0
   0x0000fffff7f86d9c:	00000000	udf	#0
   0x0000fffff7f86da0:	00000000	udf	#0
   0x0000fffff7f86da4:	00000000	udf	#0
   0x0000fffff7f86da8:	00000000	udf	#0
   0x0000fffff7f86dac:	00000000	udf	#0
   0x0000fffff7f86db0:	00000000	udf	#0
   0x0000fffff7f86db4:	00000000	udf	#0
   0x0000fffff7f86db8:	00000000	udf	#0
   0x0000fffff7f86dbc:	00000000	udf	#0
   0x0000fffff7f86dc0:	00000000	udf	#0
   0x0000fffff7f86dc4:	00000000	udf	#0
   0x0000fffff7f86dc8:	00000000	udf	#0
   0x0000fffff7f86dcc:	00000000	udf	#0
   0x0000fffff7f86dd0:	00000000	udf	#0
   0x0000fffff7f86dd4:	00000000	udf	#0
   0x0000fffff7f86dd8:	00000000	udf	#0
   0x0000fffff7f86ddc:	00000000	udf	#0
   0x0000fffff7f86de0:	00000000	udf	#0
   0x0000fffff7f86de4:	00000000	udf	#0
   0x0000fffff7f86de8:	00000000	udf	#0
   0x0000fffff7f86dec:	00000000	udf	#0
   0x0000fffff7f86df0:	00000000	udf	#0
   0x0000fffff7f86df4:	00000000	udf	#0
   0x0000fffff7f86df8:	00000000	udf	#0
   0x0000fffff7f86dfc:	00000000	udf	#0
   0x0000fffff7f86e00:	00000000	udf	#0
   0x0000fffff7f86e04:	00000000	udf	#0
   0x0000fffff7f86e08:	00000000	udf	#0
   0x0000fffff7f86e0c:	00000000	udf	#0
   0x0000fffff7f86e10:	00000000	udf	#0
   0x0000fffff7f86e14:	00000000	udf	#0
   0x0000fffff7f86e18:	00000000	udf	#0
   0x0000fffff7f86e1c:	00000000	udf	#0
   0x0000fffff7f86e20:	00000000	udf	#0
   0x0000fffff7f86e24:	00000000	udf	#0
   0x0000fffff7f86e28:	00000000	udf	#0
   0x0000fffff7f86e2c:	00000000	udf	#0
   0x0000fffff7f86e30:	00000000	udf	#0
   0x0000fffff7f86e34:	00000000	udf	#0
   0x0000fffff7f86e38:	00000000	udf	#0
   0x0000fffff7f86e3c:	00000000	udf	#0
   0x0000fffff7f86e40:	00000000	udf	#0
   0x0000fffff7f86e44:	00000000	udf	#0
   0x0000fffff7f86e48:	00000000	udf	#0
   0x0000fffff7f86e4c:	00000000	udf	#0
   0x0000fffff7f86e50:	00000000	udf	#0
   0x0000fffff7f86e54:	00000000	udf	#0
   0x0000fffff7f86e58:	00000000	udf	#0
   0x0000fffff7f86e5c:	00000000	udf	#0
   0x0000fffff7f86e60:	00000000	udf	#0
   0x0000fffff7f86e64:	00000000	udf	#0
   0x0000fffff7f86e68:	00000000	udf	#0
   0x0000fffff7f86e6c:	00000000	udf	#0
   0x0000fffff7f86e70:	00000000	udf	#0
   0x0000fffff7f86e74:	00000000	udf	#0
   0x0000fffff7f86e78:	00000000	udf	#0
   0x0000fffff7f86e7c:	00000000	udf	#0
   0x0000fffff7f86e80:	00000000	udf	#0
   0x0000fffff7f86e84:	00000000	udf	#0
   0x0000fffff7f86e88:	00000000	udf	#0
   0x0000fffff7f86e8c:	00000000	udf	#0
   0x0000fffff7f86e90:	00000000	udf	#0
   0x0000fffff7f86e94:	00000000	udf	#0
   0x0000fffff7f86e98:	00000000	udf	#0
   0x0000fffff7f86e9c:	00000000	udf	#0
   0x0000fffff7f86ea0:	00000000	udf	#0
   0x0000fffff7f86ea4:	00000000	udf	#0
   0x0000fffff7f86ea8:	00000000	udf	#0
   0x0000fffff7f86eac:	00000000	udf	#0
   0x0000fffff7f86eb0:	00000000	udf	#0
   0x0000fffff7f86eb4:	00000000	udf	#0
   0x0000fffff7f86eb8:	00000000	udf	#0
   0x0000fffff7f86ebc:	00000000	udf	#0
   0x0000fffff7f86ec0:	00000000	udf	#0
   0x0000fffff7f86ec4:	00000000	udf	#0
   0x0000fffff7f86ec8:	00000000	udf	#0
   0x0000fffff7f86ecc:	00000000	udf	#0
   0x0000fffff7f86ed0:	00000000	udf	#0
   0x0000fffff7f86ed4:	00000000	udf	#0
   0x0000fffff7f86ed8:	00000000	udf	#0
   0x0000fffff7f86edc:	00000000	udf	#0
   0x0000fffff7f86ee0:	00000000	udf	#0
   0x0000fffff7f86ee4:	00000000	udf	#0
   0x0000fffff7f86ee8:	00000000	udf	#0
   0x0000fffff7f86eec:	00000000	udf	#0
   0x0000fffff7f86ef0:	00000000	udf	#0
   0x0000fffff7f86ef4:	00000000	udf	#0
   0x0000fffff7f86ef8:	00000000	udf	#0
   0x0000fffff7f86efc:	00000000	udf	#0
   0x0000fffff7f86f00:	00000000	udf	#0
   0x0000fffff7f86f04:	00000000	udf	#0
   0x0000fffff7f86f08:	00000000	udf	#0
   0x0000fffff7f86f0c:	00000000	udf	#0
   0x0000fffff7f86f10:	00000000	udf	#0
   0x0000fffff7f86f14:	00000000	udf	#0
   0x0000fffff7f86f18:	00000000	udf	#0
   0x0000fffff7f86f1c:	00000000	udf	#0
   0x0000fffff7f86f20:	00000000	udf	#0
   0x0000fffff7f86f24:	00000000	udf	#0
   0x0000fffff7f86f28:	00000000	udf	#0
   0x0000fffff7f86f2c:	00000000	udf	#0
   0x0000fffff7f86f30:	00000000	udf	#0
   0x0000fffff7f86f34:	00000000	udf	#0
   0x0000fffff7f86f38:	00000000	udf	#0
   0x0000fffff7f86f3c:	00000000	udf	#0
   0x0000fffff7f86f40:	00000000	udf	#0
   0x0000fffff7f86f44:	00000000	udf	#0
   0x0000fffff7f86f48:	00000000	udf	#0
   0x0000fffff7f86f4c:	00000000	udf	#0
   0x0000fffff7f86f50:	00000000	udf	#0
   0x0000fffff7f86f54:	00000000	udf	#0
   0x0000fffff7f86f58:	00000000	udf	#0
   0x0000fffff7f86f5c:	00000000	udf	#0
   0x0000fffff7f86f60:	00000000	udf	#0
   0x0000fffff7f86f64:	00000000	udf	#0
   0x0000fffff7f86f68:	00000000	udf	#0
   0x0000fffff7f86f6c:	00000000	udf	#0
   0x0000fffff7f86f70:	00000000	udf	#0
   0x0000fffff7f86f74:	00000000	udf	#0
   0x0000fffff7f86f78:	00000000	udf	#0
   0x0000fffff7f86f7c:	00000000	udf	#0
   0x0000fffff7f86f80:	00000000	udf	#0
   0x0000fffff7f86f84:	00000000	udf	#0
   0x0000fffff7f86f88:	00000000	udf	#0
   0x0000fffff7f86f8c:	00000000	udf	#0
   0x0000fffff7f86f90:	00000000	udf	#0
   0x0000fffff7f86f94:	00000000	udf	#0
   0x0000fffff7f86f98:	00000000	udf	#0
   0x0000fffff7f86f9c:	00000000	udf	#0
   0x0000fffff7f86fa0:	00000000	udf	#0
   0x0000fffff7f86fa4:	00000000	udf	#0
   0x0000fffff7f86fa8:	00000000	udf	#0
   0x0000fffff7f86fac:	00000000	udf	#0
   0x0000fffff7f86fb0:	00000000	udf	#0
   0x0000fffff7f86fb4:	00000000	udf	#0
   0x0000fffff7f86fb8:	00000000	udf	#0
   0x0000fffff7f86fbc:	00000000	udf	#0
   0x0000fffff7f86fc0:	00000000	udf	#0
   0x0000fffff7f86fc4:	00000000	udf	#0
   0x0000fffff7f86fc8:	00000000	udf	#0
   0x0000fffff7f86fcc:	00000000	udf	#0
   0x0000fffff7f86fd0:	00000000	udf	#0
   0x0000fffff7f86fd4:	00000000	udf	#0
   0x0000fffff7f86fd8:	00000000	udf	#0
   0x0000fffff7f86fdc:	00000000	udf	#0
   0x0000fffff7f86fe0:	00000000	udf	#0
   0x0000fffff7f86fe4:	00000000	udf	#0
   0x0000fffff7f86fe8:	00000000	udf	#0
   0x0000fffff7f86fec:	00000000	udf	#0
   0x0000fffff7f86ff0:	00000000	udf	#0
   0x0000fffff7f86ff4:	00000000	udf	#0
   0x0000fffff7f86ff8:	00000000	udf	#0
   0x0000fffff7f86ffc:	00000000	udf	#0
End of assembler dump.
