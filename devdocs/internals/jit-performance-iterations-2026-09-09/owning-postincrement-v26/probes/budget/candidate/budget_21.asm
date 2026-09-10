Dump of assembler code from 0xfffff7f99000 to 0xfffff7f9b000:
   0x0000fffff7f99000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7f99004:	910003fd	mov	x29, sp
   0x0000fffff7f99008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7f9900c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7f99010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7f99014:	aa0003f3	mov	x19, x0
   0x0000fffff7f99018:	aa0103f4	mov	x20, x1
   0x0000fffff7f9901c:	aa0203f5	mov	x21, x2
   0x0000fffff7f99020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7f99024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7f99028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f9902c:	f90003e9	str	x9, [sp]
   0x0000fffff7f99030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7f99034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7f99038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7f9903c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f99040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99044:	d63f0200	blr	x16
   0x0000fffff7f99048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7f9904c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7f99050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7f99054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7f99058:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9905c:	37d800e9	tbnz	w9, #27, 0xfffff7f99078
   0x0000fffff7f99060:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f99064:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99068:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9906c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f99070:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f99074:	1400000e	b	0xfffff7f990ac
   0x0000fffff7f99078:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9907c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99080:	aa1303e1	mov	x1, x19
   0x0000fffff7f99084:	aa1503e2	mov	x2, x21
   0x0000fffff7f99088:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7f9908c:	aa1403e4	mov	x4, x20
   0x0000fffff7f99090:	aa1603e5	mov	x5, x22
   0x0000fffff7f99094:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7f99098:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9909c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f990a0:	d63f0200	blr	x16
   0x0000fffff7f990a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f990a8:	5400e180	b.eq	0xfffff7f9acd8  // b.none
   0x0000fffff7f990ac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f990b0:	37d800e9	tbnz	w9, #27, 0xfffff7f990cc
   0x0000fffff7f990b4:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f990b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f990bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f990c0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f990c4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f990c8:	1400000e	b	0xfffff7f99100
   0x0000fffff7f990cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f990d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f990d4:	aa1303e1	mov	x1, x19
   0x0000fffff7f990d8:	aa1503e2	mov	x2, x21
   0x0000fffff7f990dc:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7f990e0:	aa1403e4	mov	x4, x20
   0x0000fffff7f990e4:	aa1603e5	mov	x5, x22
   0x0000fffff7f990e8:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7f990ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f990f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f990f4:	d63f0200	blr	x16
   0x0000fffff7f990f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f990fc:	5400df20	b.eq	0xfffff7f9ace0  // b.none
   0x0000fffff7f99100:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f99104:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99108:	aa1303e1	mov	x1, x19
   0x0000fffff7f9910c:	aa1503e2	mov	x2, x21
   0x0000fffff7f99110:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f99114:	aa1403e4	mov	x4, x20
   0x0000fffff7f99118:	aa1603e5	mov	x5, x22
   0x0000fffff7f9911c:	d2909810	mov	x16, #0x84c0                	// #33984
   0x0000fffff7f99120:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f99124:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99128:	d63f0200	blr	x16
   0x0000fffff7f9912c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99130:	5400ddc0	b.eq	0xfffff7f9ace8  // b.none
   0x0000fffff7f99134:	f100041f	cmp	x0, #0x1
   0x0000fffff7f99138:	5400d9a0	b.eq	0xfffff7f9ac6c  // b.none
   0x0000fffff7f9913c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f99140:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99144:	aa1303e1	mov	x1, x19
   0x0000fffff7f99148:	aa1503e2	mov	x2, x21
   0x0000fffff7f9914c:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7f99150:	aa1403e4	mov	x4, x20
   0x0000fffff7f99154:	aa1603e5	mov	x5, x22
   0x0000fffff7f99158:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9915c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f99160:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99164:	d63f0200	blr	x16
   0x0000fffff7f99168:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9916c:	5400dc20	b.eq	0xfffff7f9acf0  // b.none
   0x0000fffff7f99170:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f99174:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99178:	aa1303e1	mov	x1, x19
   0x0000fffff7f9917c:	aa1503e2	mov	x2, x21
   0x0000fffff7f99180:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7f99184:	aa1403e4	mov	x4, x20
   0x0000fffff7f99188:	aa1603e5	mov	x5, x22
   0x0000fffff7f9918c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f99190:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f99194:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99198:	d63f0200	blr	x16
   0x0000fffff7f9919c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f991a0:	5400dac0	b.eq	0xfffff7f9acf8  // b.none
   0x0000fffff7f991a4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f991a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f991ac:	aa1303e1	mov	x1, x19
   0x0000fffff7f991b0:	aa1503e2	mov	x2, x21
   0x0000fffff7f991b4:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f991b8:	aa1403e4	mov	x4, x20
   0x0000fffff7f991bc:	aa1603e5	mov	x5, x22
   0x0000fffff7f991c0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f991c4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f991c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f991cc:	d63f0200	blr	x16
   0x0000fffff7f991d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f991d4:	5400d960	b.eq	0xfffff7f9ad00  // b.none
   0x0000fffff7f991d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f991dc:	37d806a9	tbnz	w9, #27, 0xfffff7f992b0
   0x0000fffff7f991e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f991e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f991e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f991ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f991f0:	540001c1	b.ne	0xfffff7f99228  // b.any
   0x0000fffff7f991f4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f991f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f991fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99200:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99204:	54000121	b.ne	0xfffff7f99228  // b.any
   0x0000fffff7f99208:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9920c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f99210:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f99214:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99218:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9921c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f99220:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f99224:	14000030	b	0xfffff7f992e4
   0x0000fffff7f99228:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9922c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99230:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99234:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99238:	54000120	b.eq	0xfffff7f9925c  // b.none
   0x0000fffff7f9923c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f99240:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99244:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99248:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9924c:	54000321	b.ne	0xfffff7f992b0  // b.any
   0x0000fffff7f99250:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f99254:	9e620120	scvtf	d0, x9
   0x0000fffff7f99258:	14000002	b	0xfffff7f99260
   0x0000fffff7f9925c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f99260:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f99264:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99268:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9926c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99270:	54000120	b.eq	0xfffff7f99294  // b.none
   0x0000fffff7f99274:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f99278:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9927c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99280:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99284:	54000161	b.ne	0xfffff7f992b0  // b.any
   0x0000fffff7f99288:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9928c:	9e620121	scvtf	d1, x9
   0x0000fffff7f99290:	14000002	b	0xfffff7f99298
   0x0000fffff7f99294:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f99298:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9929c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f992a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f992a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f992a8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f992ac:	17ffffde	b	0xfffff7f99224
   0x0000fffff7f992b0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f992b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f992b8:	aa1303e1	mov	x1, x19
   0x0000fffff7f992bc:	aa1503e2	mov	x2, x21
   0x0000fffff7f992c0:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f992c4:	aa1403e4	mov	x4, x20
   0x0000fffff7f992c8:	aa1603e5	mov	x5, x22
   0x0000fffff7f992cc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f992d0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f992d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f992d8:	d63f0200	blr	x16
   0x0000fffff7f992dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f992e0:	5400d140	b.eq	0xfffff7f9ad08  // b.none
   0x0000fffff7f992e4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f992e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f992ec:	aa1303e1	mov	x1, x19
   0x0000fffff7f992f0:	aa1503e2	mov	x2, x21
   0x0000fffff7f992f4:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f992f8:	aa1403e4	mov	x4, x20
   0x0000fffff7f992fc:	aa1603e5	mov	x5, x22
   0x0000fffff7f99300:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f99304:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f99308:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9930c:	d63f0200	blr	x16
   0x0000fffff7f99310:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99314:	5400cfe0	b.eq	0xfffff7f9ad10  // b.none
   0x0000fffff7f99318:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9931c:	37d806a9	tbnz	w9, #27, 0xfffff7f993f0
   0x0000fffff7f99320:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f99324:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99328:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9932c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99330:	540001c1	b.ne	0xfffff7f99368  // b.any
   0x0000fffff7f99334:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f99338:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9933c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99340:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99344:	54000121	b.ne	0xfffff7f99368  // b.any
   0x0000fffff7f99348:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9934c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f99350:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f99354:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99358:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9935c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f99360:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f99364:	14000030	b	0xfffff7f99424
   0x0000fffff7f99368:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9936c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99370:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99374:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99378:	54000120	b.eq	0xfffff7f9939c  // b.none
   0x0000fffff7f9937c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f99380:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99384:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99388:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9938c:	54000321	b.ne	0xfffff7f993f0  // b.any
   0x0000fffff7f99390:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f99394:	9e620120	scvtf	d0, x9
   0x0000fffff7f99398:	14000002	b	0xfffff7f993a0
   0x0000fffff7f9939c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f993a0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f993a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f993a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f993ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f993b0:	54000120	b.eq	0xfffff7f993d4  // b.none
   0x0000fffff7f993b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f993b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f993bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f993c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f993c4:	54000161	b.ne	0xfffff7f993f0  // b.any
   0x0000fffff7f993c8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f993cc:	9e620121	scvtf	d1, x9
   0x0000fffff7f993d0:	14000002	b	0xfffff7f993d8
   0x0000fffff7f993d4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f993d8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f993dc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f993e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f993e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f993e8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f993ec:	17ffffde	b	0xfffff7f99364
   0x0000fffff7f993f0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f993f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f993f8:	aa1303e1	mov	x1, x19
   0x0000fffff7f993fc:	aa1503e2	mov	x2, x21
   0x0000fffff7f99400:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f99404:	aa1403e4	mov	x4, x20
   0x0000fffff7f99408:	aa1603e5	mov	x5, x22
   0x0000fffff7f9940c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f99410:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f99414:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99418:	d63f0200	blr	x16
   0x0000fffff7f9941c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99420:	5400c7c0	b.eq	0xfffff7f9ad18  // b.none
   0x0000fffff7f99424:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f99428:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9942c:	aa1303e1	mov	x1, x19
   0x0000fffff7f99430:	aa1503e2	mov	x2, x21
   0x0000fffff7f99434:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f99438:	aa1403e4	mov	x4, x20
   0x0000fffff7f9943c:	aa1603e5	mov	x5, x22
   0x0000fffff7f99440:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f99444:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f99448:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9944c:	d63f0200	blr	x16
   0x0000fffff7f99450:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99454:	5400c660	b.eq	0xfffff7f9ad20  // b.none
   0x0000fffff7f99458:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9945c:	37d806a9	tbnz	w9, #27, 0xfffff7f99530
   0x0000fffff7f99460:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f99464:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99468:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9946c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99470:	540001c1	b.ne	0xfffff7f994a8  // b.any
   0x0000fffff7f99474:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f99478:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9947c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99480:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99484:	54000121	b.ne	0xfffff7f994a8  // b.any
   0x0000fffff7f99488:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9948c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f99490:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f99494:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99498:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9949c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f994a0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f994a4:	14000030	b	0xfffff7f99564
   0x0000fffff7f994a8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f994ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f994b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f994b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f994b8:	54000120	b.eq	0xfffff7f994dc  // b.none
   0x0000fffff7f994bc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f994c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f994c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f994c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f994cc:	54000321	b.ne	0xfffff7f99530  // b.any
   0x0000fffff7f994d0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f994d4:	9e620120	scvtf	d0, x9
   0x0000fffff7f994d8:	14000002	b	0xfffff7f994e0
   0x0000fffff7f994dc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f994e0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f994e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f994e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f994ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f994f0:	54000120	b.eq	0xfffff7f99514  // b.none
   0x0000fffff7f994f4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f994f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f994fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99500:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99504:	54000161	b.ne	0xfffff7f99530  // b.any
   0x0000fffff7f99508:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9950c:	9e620121	scvtf	d1, x9
   0x0000fffff7f99510:	14000002	b	0xfffff7f99518
   0x0000fffff7f99514:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f99518:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9951c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f99520:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99524:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99528:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9952c:	17ffffde	b	0xfffff7f994a4
   0x0000fffff7f99530:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f99534:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99538:	aa1303e1	mov	x1, x19
   0x0000fffff7f9953c:	aa1503e2	mov	x2, x21
   0x0000fffff7f99540:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f99544:	aa1403e4	mov	x4, x20
   0x0000fffff7f99548:	aa1603e5	mov	x5, x22
   0x0000fffff7f9954c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f99550:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f99554:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99558:	d63f0200	blr	x16
   0x0000fffff7f9955c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99560:	5400be40	b.eq	0xfffff7f9ad28  // b.none
   0x0000fffff7f99564:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f99568:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9956c:	aa1303e1	mov	x1, x19
   0x0000fffff7f99570:	aa1503e2	mov	x2, x21
   0x0000fffff7f99574:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7f99578:	aa1403e4	mov	x4, x20
   0x0000fffff7f9957c:	aa1603e5	mov	x5, x22
   0x0000fffff7f99580:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f99584:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f99588:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9958c:	d63f0200	blr	x16
   0x0000fffff7f99590:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99594:	5400bce0	b.eq	0xfffff7f9ad30  // b.none
   0x0000fffff7f99598:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9959c:	37d806a9	tbnz	w9, #27, 0xfffff7f99670
   0x0000fffff7f995a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f995a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f995a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f995ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f995b0:	540001c1	b.ne	0xfffff7f995e8  // b.any
   0x0000fffff7f995b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f995b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f995bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f995c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f995c4:	54000121	b.ne	0xfffff7f995e8  // b.any
   0x0000fffff7f995c8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f995cc:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f995d0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f995d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f995d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f995dc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f995e0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f995e4:	14000030	b	0xfffff7f996a4
   0x0000fffff7f995e8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f995ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f995f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f995f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f995f8:	54000120	b.eq	0xfffff7f9961c  // b.none
   0x0000fffff7f995fc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f99600:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99604:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99608:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9960c:	54000321	b.ne	0xfffff7f99670  // b.any
   0x0000fffff7f99610:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f99614:	9e620120	scvtf	d0, x9
   0x0000fffff7f99618:	14000002	b	0xfffff7f99620
   0x0000fffff7f9961c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f99620:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f99624:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99628:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9962c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99630:	54000120	b.eq	0xfffff7f99654  // b.none
   0x0000fffff7f99634:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f99638:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9963c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99640:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99644:	54000161	b.ne	0xfffff7f99670  // b.any
   0x0000fffff7f99648:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9964c:	9e620121	scvtf	d1, x9
   0x0000fffff7f99650:	14000002	b	0xfffff7f99658
   0x0000fffff7f99654:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f99658:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9965c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f99660:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99664:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99668:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9966c:	17ffffde	b	0xfffff7f995e4
   0x0000fffff7f99670:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f99674:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99678:	aa1303e1	mov	x1, x19
   0x0000fffff7f9967c:	aa1503e2	mov	x2, x21
   0x0000fffff7f99680:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7f99684:	aa1403e4	mov	x4, x20
   0x0000fffff7f99688:	aa1603e5	mov	x5, x22
   0x0000fffff7f9968c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f99690:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f99694:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99698:	d63f0200	blr	x16
   0x0000fffff7f9969c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f996a0:	5400b4c0	b.eq	0xfffff7f9ad38  // b.none
   0x0000fffff7f996a4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f996a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f996ac:	aa1303e1	mov	x1, x19
   0x0000fffff7f996b0:	aa1503e2	mov	x2, x21
   0x0000fffff7f996b4:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7f996b8:	aa1403e4	mov	x4, x20
   0x0000fffff7f996bc:	aa1603e5	mov	x5, x22
   0x0000fffff7f996c0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f996c4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f996c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f996cc:	d63f0200	blr	x16
   0x0000fffff7f996d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f996d4:	5400b360	b.eq	0xfffff7f9ad40  // b.none
   0x0000fffff7f996d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f996dc:	37d806a9	tbnz	w9, #27, 0xfffff7f997b0
   0x0000fffff7f996e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f996e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f996e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f996ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f996f0:	540001c1	b.ne	0xfffff7f99728  // b.any
   0x0000fffff7f996f4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f996f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f996fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99700:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99704:	54000121	b.ne	0xfffff7f99728  // b.any
   0x0000fffff7f99708:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9970c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f99710:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f99714:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99718:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9971c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f99720:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f99724:	14000030	b	0xfffff7f997e4
   0x0000fffff7f99728:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9972c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99730:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99734:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99738:	54000120	b.eq	0xfffff7f9975c  // b.none
   0x0000fffff7f9973c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f99740:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99744:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99748:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9974c:	54000321	b.ne	0xfffff7f997b0  // b.any
   0x0000fffff7f99750:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f99754:	9e620120	scvtf	d0, x9
   0x0000fffff7f99758:	14000002	b	0xfffff7f99760
   0x0000fffff7f9975c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f99760:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f99764:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99768:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9976c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99770:	54000120	b.eq	0xfffff7f99794  // b.none
   0x0000fffff7f99774:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f99778:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9977c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99780:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99784:	54000161	b.ne	0xfffff7f997b0  // b.any
   0x0000fffff7f99788:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9978c:	9e620121	scvtf	d1, x9
   0x0000fffff7f99790:	14000002	b	0xfffff7f99798
   0x0000fffff7f99794:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f99798:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9979c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f997a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f997a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f997a8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f997ac:	17ffffde	b	0xfffff7f99724
   0x0000fffff7f997b0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f997b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f997b8:	aa1303e1	mov	x1, x19
   0x0000fffff7f997bc:	aa1503e2	mov	x2, x21
   0x0000fffff7f997c0:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7f997c4:	aa1403e4	mov	x4, x20
   0x0000fffff7f997c8:	aa1603e5	mov	x5, x22
   0x0000fffff7f997cc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f997d0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f997d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f997d8:	d63f0200	blr	x16
   0x0000fffff7f997dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f997e0:	5400ab40	b.eq	0xfffff7f9ad48  // b.none
   0x0000fffff7f997e4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f997e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f997ec:	aa1303e1	mov	x1, x19
   0x0000fffff7f997f0:	aa1503e2	mov	x2, x21
   0x0000fffff7f997f4:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7f997f8:	aa1403e4	mov	x4, x20
   0x0000fffff7f997fc:	aa1603e5	mov	x5, x22
   0x0000fffff7f99800:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f99804:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f99808:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9980c:	d63f0200	blr	x16
   0x0000fffff7f99810:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99814:	5400a9e0	b.eq	0xfffff7f9ad50  // b.none
   0x0000fffff7f99818:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9981c:	37d806a9	tbnz	w9, #27, 0xfffff7f998f0
   0x0000fffff7f99820:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f99824:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99828:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9982c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99830:	540001c1	b.ne	0xfffff7f99868  // b.any
   0x0000fffff7f99834:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f99838:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9983c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99840:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99844:	54000121	b.ne	0xfffff7f99868  // b.any
   0x0000fffff7f99848:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9984c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f99850:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f99854:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99858:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9985c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f99860:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f99864:	14000030	b	0xfffff7f99924
   0x0000fffff7f99868:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9986c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99870:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99874:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99878:	54000120	b.eq	0xfffff7f9989c  // b.none
   0x0000fffff7f9987c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f99880:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99884:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99888:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9988c:	54000321	b.ne	0xfffff7f998f0  // b.any
   0x0000fffff7f99890:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f99894:	9e620120	scvtf	d0, x9
   0x0000fffff7f99898:	14000002	b	0xfffff7f998a0
   0x0000fffff7f9989c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f998a0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f998a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f998a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f998ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f998b0:	54000120	b.eq	0xfffff7f998d4  // b.none
   0x0000fffff7f998b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f998b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f998bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f998c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f998c4:	54000161	b.ne	0xfffff7f998f0  // b.any
   0x0000fffff7f998c8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f998cc:	9e620121	scvtf	d1, x9
   0x0000fffff7f998d0:	14000002	b	0xfffff7f998d8
   0x0000fffff7f998d4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f998d8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f998dc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f998e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f998e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f998e8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f998ec:	17ffffde	b	0xfffff7f99864
   0x0000fffff7f998f0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f998f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f998f8:	aa1303e1	mov	x1, x19
   0x0000fffff7f998fc:	aa1503e2	mov	x2, x21
   0x0000fffff7f99900:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7f99904:	aa1403e4	mov	x4, x20
   0x0000fffff7f99908:	aa1603e5	mov	x5, x22
   0x0000fffff7f9990c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f99910:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f99914:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99918:	d63f0200	blr	x16
   0x0000fffff7f9991c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99920:	5400a1c0	b.eq	0xfffff7f9ad58  // b.none
   0x0000fffff7f99924:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f99928:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9992c:	aa1303e1	mov	x1, x19
   0x0000fffff7f99930:	aa1503e2	mov	x2, x21
   0x0000fffff7f99934:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7f99938:	aa1403e4	mov	x4, x20
   0x0000fffff7f9993c:	aa1603e5	mov	x5, x22
   0x0000fffff7f99940:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f99944:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f99948:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9994c:	d63f0200	blr	x16
   0x0000fffff7f99950:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99954:	5400a060	b.eq	0xfffff7f9ad60  // b.none
   0x0000fffff7f99958:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9995c:	37d806a9	tbnz	w9, #27, 0xfffff7f99a30
   0x0000fffff7f99960:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f99964:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99968:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9996c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99970:	540001c1	b.ne	0xfffff7f999a8  // b.any
   0x0000fffff7f99974:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f99978:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9997c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99980:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99984:	54000121	b.ne	0xfffff7f999a8  // b.any
   0x0000fffff7f99988:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9998c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f99990:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f99994:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99998:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9999c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f999a0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f999a4:	14000030	b	0xfffff7f99a64
   0x0000fffff7f999a8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f999ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f999b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f999b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f999b8:	54000120	b.eq	0xfffff7f999dc  // b.none
   0x0000fffff7f999bc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f999c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f999c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f999c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f999cc:	54000321	b.ne	0xfffff7f99a30  // b.any
   0x0000fffff7f999d0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f999d4:	9e620120	scvtf	d0, x9
   0x0000fffff7f999d8:	14000002	b	0xfffff7f999e0
   0x0000fffff7f999dc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f999e0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f999e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f999e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f999ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f999f0:	54000120	b.eq	0xfffff7f99a14  // b.none
   0x0000fffff7f999f4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f999f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f999fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99a00:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99a04:	54000161	b.ne	0xfffff7f99a30  // b.any
   0x0000fffff7f99a08:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f99a0c:	9e620121	scvtf	d1, x9
   0x0000fffff7f99a10:	14000002	b	0xfffff7f99a18
   0x0000fffff7f99a14:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f99a18:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f99a1c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f99a20:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99a24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99a28:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f99a2c:	17ffffde	b	0xfffff7f999a4
   0x0000fffff7f99a30:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f99a34:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99a38:	aa1303e1	mov	x1, x19
   0x0000fffff7f99a3c:	aa1503e2	mov	x2, x21
   0x0000fffff7f99a40:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7f99a44:	aa1403e4	mov	x4, x20
   0x0000fffff7f99a48:	aa1603e5	mov	x5, x22
   0x0000fffff7f99a4c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f99a50:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f99a54:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99a58:	d63f0200	blr	x16
   0x0000fffff7f99a5c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99a60:	54009840	b.eq	0xfffff7f9ad68  // b.none
   0x0000fffff7f99a64:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f99a68:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99a6c:	aa1303e1	mov	x1, x19
   0x0000fffff7f99a70:	aa1503e2	mov	x2, x21
   0x0000fffff7f99a74:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7f99a78:	aa1403e4	mov	x4, x20
   0x0000fffff7f99a7c:	aa1603e5	mov	x5, x22
   0x0000fffff7f99a80:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f99a84:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f99a88:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99a8c:	d63f0200	blr	x16
   0x0000fffff7f99a90:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99a94:	540096e0	b.eq	0xfffff7f9ad70  // b.none
   0x0000fffff7f99a98:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f99a9c:	37d806a9	tbnz	w9, #27, 0xfffff7f99b70
   0x0000fffff7f99aa0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f99aa4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99aa8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99aac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99ab0:	540001c1	b.ne	0xfffff7f99ae8  // b.any
   0x0000fffff7f99ab4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f99ab8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99abc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99ac0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99ac4:	54000121	b.ne	0xfffff7f99ae8  // b.any
   0x0000fffff7f99ac8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f99acc:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f99ad0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f99ad4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99ad8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99adc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f99ae0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f99ae4:	14000030	b	0xfffff7f99ba4
   0x0000fffff7f99ae8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f99aec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99af0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99af4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99af8:	54000120	b.eq	0xfffff7f99b1c  // b.none
   0x0000fffff7f99afc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f99b00:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99b04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99b08:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99b0c:	54000321	b.ne	0xfffff7f99b70  // b.any
   0x0000fffff7f99b10:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f99b14:	9e620120	scvtf	d0, x9
   0x0000fffff7f99b18:	14000002	b	0xfffff7f99b20
   0x0000fffff7f99b1c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f99b20:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f99b24:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99b28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99b2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99b30:	54000120	b.eq	0xfffff7f99b54  // b.none
   0x0000fffff7f99b34:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f99b38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99b3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99b40:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99b44:	54000161	b.ne	0xfffff7f99b70  // b.any
   0x0000fffff7f99b48:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f99b4c:	9e620121	scvtf	d1, x9
   0x0000fffff7f99b50:	14000002	b	0xfffff7f99b58
   0x0000fffff7f99b54:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f99b58:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f99b5c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f99b60:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99b64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99b68:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f99b6c:	17ffffde	b	0xfffff7f99ae4
   0x0000fffff7f99b70:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f99b74:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99b78:	aa1303e1	mov	x1, x19
   0x0000fffff7f99b7c:	aa1503e2	mov	x2, x21
   0x0000fffff7f99b80:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7f99b84:	aa1403e4	mov	x4, x20
   0x0000fffff7f99b88:	aa1603e5	mov	x5, x22
   0x0000fffff7f99b8c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f99b90:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f99b94:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99b98:	d63f0200	blr	x16
   0x0000fffff7f99b9c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99ba0:	54008ec0	b.eq	0xfffff7f9ad78  // b.none
   0x0000fffff7f99ba4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f99ba8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99bac:	aa1303e1	mov	x1, x19
   0x0000fffff7f99bb0:	aa1503e2	mov	x2, x21
   0x0000fffff7f99bb4:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7f99bb8:	aa1403e4	mov	x4, x20
   0x0000fffff7f99bbc:	aa1603e5	mov	x5, x22
   0x0000fffff7f99bc0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f99bc4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f99bc8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99bcc:	d63f0200	blr	x16
   0x0000fffff7f99bd0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99bd4:	54008d60	b.eq	0xfffff7f9ad80  // b.none
   0x0000fffff7f99bd8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f99bdc:	37d806a9	tbnz	w9, #27, 0xfffff7f99cb0
   0x0000fffff7f99be0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f99be4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99be8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99bec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99bf0:	540001c1	b.ne	0xfffff7f99c28  // b.any
   0x0000fffff7f99bf4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f99bf8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99bfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99c00:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99c04:	54000121	b.ne	0xfffff7f99c28  // b.any
   0x0000fffff7f99c08:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f99c0c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f99c10:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f99c14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99c18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99c1c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f99c20:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f99c24:	14000030	b	0xfffff7f99ce4
   0x0000fffff7f99c28:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f99c2c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99c30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99c34:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99c38:	54000120	b.eq	0xfffff7f99c5c  // b.none
   0x0000fffff7f99c3c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f99c40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99c44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99c48:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99c4c:	54000321	b.ne	0xfffff7f99cb0  // b.any
   0x0000fffff7f99c50:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f99c54:	9e620120	scvtf	d0, x9
   0x0000fffff7f99c58:	14000002	b	0xfffff7f99c60
   0x0000fffff7f99c5c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f99c60:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f99c64:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99c68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99c6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99c70:	54000120	b.eq	0xfffff7f99c94  // b.none
   0x0000fffff7f99c74:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f99c78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99c7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99c80:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99c84:	54000161	b.ne	0xfffff7f99cb0  // b.any
   0x0000fffff7f99c88:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f99c8c:	9e620121	scvtf	d1, x9
   0x0000fffff7f99c90:	14000002	b	0xfffff7f99c98
   0x0000fffff7f99c94:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f99c98:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f99c9c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f99ca0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99ca4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99ca8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f99cac:	17ffffde	b	0xfffff7f99c24
   0x0000fffff7f99cb0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f99cb4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99cb8:	aa1303e1	mov	x1, x19
   0x0000fffff7f99cbc:	aa1503e2	mov	x2, x21
   0x0000fffff7f99cc0:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7f99cc4:	aa1403e4	mov	x4, x20
   0x0000fffff7f99cc8:	aa1603e5	mov	x5, x22
   0x0000fffff7f99ccc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f99cd0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f99cd4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99cd8:	d63f0200	blr	x16
   0x0000fffff7f99cdc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99ce0:	54008540	b.eq	0xfffff7f9ad88  // b.none
   0x0000fffff7f99ce4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f99ce8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99cec:	aa1303e1	mov	x1, x19
   0x0000fffff7f99cf0:	aa1503e2	mov	x2, x21
   0x0000fffff7f99cf4:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7f99cf8:	aa1403e4	mov	x4, x20
   0x0000fffff7f99cfc:	aa1603e5	mov	x5, x22
   0x0000fffff7f99d00:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f99d04:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f99d08:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99d0c:	d63f0200	blr	x16
   0x0000fffff7f99d10:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99d14:	540083e0	b.eq	0xfffff7f9ad90  // b.none
   0x0000fffff7f99d18:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f99d1c:	37d806a9	tbnz	w9, #27, 0xfffff7f99df0
   0x0000fffff7f99d20:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f99d24:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99d28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99d2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99d30:	540001c1	b.ne	0xfffff7f99d68  // b.any
   0x0000fffff7f99d34:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f99d38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99d3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99d40:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99d44:	54000121	b.ne	0xfffff7f99d68  // b.any
   0x0000fffff7f99d48:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f99d4c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f99d50:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f99d54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99d58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99d5c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f99d60:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f99d64:	14000030	b	0xfffff7f99e24
   0x0000fffff7f99d68:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f99d6c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99d70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99d74:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99d78:	54000120	b.eq	0xfffff7f99d9c  // b.none
   0x0000fffff7f99d7c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f99d80:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99d84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99d88:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99d8c:	54000321	b.ne	0xfffff7f99df0  // b.any
   0x0000fffff7f99d90:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f99d94:	9e620120	scvtf	d0, x9
   0x0000fffff7f99d98:	14000002	b	0xfffff7f99da0
   0x0000fffff7f99d9c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f99da0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f99da4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99da8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99dac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99db0:	54000120	b.eq	0xfffff7f99dd4  // b.none
   0x0000fffff7f99db4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f99db8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99dbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99dc0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99dc4:	54000161	b.ne	0xfffff7f99df0  // b.any
   0x0000fffff7f99dc8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f99dcc:	9e620121	scvtf	d1, x9
   0x0000fffff7f99dd0:	14000002	b	0xfffff7f99dd8
   0x0000fffff7f99dd4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f99dd8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f99ddc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f99de0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99de4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99de8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f99dec:	17ffffde	b	0xfffff7f99d64
   0x0000fffff7f99df0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f99df4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99df8:	aa1303e1	mov	x1, x19
   0x0000fffff7f99dfc:	aa1503e2	mov	x2, x21
   0x0000fffff7f99e00:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7f99e04:	aa1403e4	mov	x4, x20
   0x0000fffff7f99e08:	aa1603e5	mov	x5, x22
   0x0000fffff7f99e0c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f99e10:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f99e14:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99e18:	d63f0200	blr	x16
   0x0000fffff7f99e1c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99e20:	54007bc0	b.eq	0xfffff7f9ad98  // b.none
   0x0000fffff7f99e24:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f99e28:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99e2c:	aa1303e1	mov	x1, x19
   0x0000fffff7f99e30:	aa1503e2	mov	x2, x21
   0x0000fffff7f99e34:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7f99e38:	aa1403e4	mov	x4, x20
   0x0000fffff7f99e3c:	aa1603e5	mov	x5, x22
   0x0000fffff7f99e40:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f99e44:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f99e48:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99e4c:	d63f0200	blr	x16
   0x0000fffff7f99e50:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99e54:	54007a60	b.eq	0xfffff7f9ada0  // b.none
   0x0000fffff7f99e58:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f99e5c:	37d806a9	tbnz	w9, #27, 0xfffff7f99f30
   0x0000fffff7f99e60:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f99e64:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99e68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99e6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99e70:	540001c1	b.ne	0xfffff7f99ea8  // b.any
   0x0000fffff7f99e74:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f99e78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99e7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99e80:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99e84:	54000121	b.ne	0xfffff7f99ea8  // b.any
   0x0000fffff7f99e88:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f99e8c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f99e90:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f99e94:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99e98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99e9c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f99ea0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f99ea4:	14000030	b	0xfffff7f99f64
   0x0000fffff7f99ea8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f99eac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99eb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99eb4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99eb8:	54000120	b.eq	0xfffff7f99edc  // b.none
   0x0000fffff7f99ebc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f99ec0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99ec4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99ec8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99ecc:	54000321	b.ne	0xfffff7f99f30  // b.any
   0x0000fffff7f99ed0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f99ed4:	9e620120	scvtf	d0, x9
   0x0000fffff7f99ed8:	14000002	b	0xfffff7f99ee0
   0x0000fffff7f99edc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f99ee0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f99ee4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99ee8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99eec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99ef0:	54000120	b.eq	0xfffff7f99f14  // b.none
   0x0000fffff7f99ef4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f99ef8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99efc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99f00:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99f04:	54000161	b.ne	0xfffff7f99f30  // b.any
   0x0000fffff7f99f08:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f99f0c:	9e620121	scvtf	d1, x9
   0x0000fffff7f99f10:	14000002	b	0xfffff7f99f18
   0x0000fffff7f99f14:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f99f18:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f99f1c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f99f20:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99f24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99f28:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f99f2c:	17ffffde	b	0xfffff7f99ea4
   0x0000fffff7f99f30:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f99f34:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99f38:	aa1303e1	mov	x1, x19
   0x0000fffff7f99f3c:	aa1503e2	mov	x2, x21
   0x0000fffff7f99f40:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7f99f44:	aa1403e4	mov	x4, x20
   0x0000fffff7f99f48:	aa1603e5	mov	x5, x22
   0x0000fffff7f99f4c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f99f50:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f99f54:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99f58:	d63f0200	blr	x16
   0x0000fffff7f99f5c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99f60:	54007240	b.eq	0xfffff7f9ada8  // b.none
   0x0000fffff7f99f64:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f99f68:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99f6c:	aa1303e1	mov	x1, x19
   0x0000fffff7f99f70:	aa1503e2	mov	x2, x21
   0x0000fffff7f99f74:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7f99f78:	aa1403e4	mov	x4, x20
   0x0000fffff7f99f7c:	aa1603e5	mov	x5, x22
   0x0000fffff7f99f80:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f99f84:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f99f88:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99f8c:	d63f0200	blr	x16
   0x0000fffff7f99f90:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99f94:	540070e0	b.eq	0xfffff7f9adb0  // b.none
   0x0000fffff7f99f98:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f99f9c:	37d806a9	tbnz	w9, #27, 0xfffff7f9a070
   0x0000fffff7f99fa0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f99fa4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99fa8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99fac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99fb0:	540001c1	b.ne	0xfffff7f99fe8  // b.any
   0x0000fffff7f99fb4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f99fb8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99fbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99fc0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99fc4:	54000121	b.ne	0xfffff7f99fe8  // b.any
   0x0000fffff7f99fc8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f99fcc:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f99fd0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f99fd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99fd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99fdc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f99fe0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f99fe4:	14000030	b	0xfffff7f9a0a4
   0x0000fffff7f99fe8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f99fec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99ff0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99ff4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99ff8:	54000120	b.eq	0xfffff7f9a01c  // b.none
   0x0000fffff7f99ffc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a000:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a004:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a008:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a00c:	54000321	b.ne	0xfffff7f9a070  // b.any
   0x0000fffff7f9a010:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9a014:	9e620120	scvtf	d0, x9
   0x0000fffff7f9a018:	14000002	b	0xfffff7f9a020
   0x0000fffff7f9a01c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9a020:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9a024:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a028:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a02c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a030:	54000120	b.eq	0xfffff7f9a054  // b.none
   0x0000fffff7f9a034:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9a038:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a03c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a040:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a044:	54000161	b.ne	0xfffff7f9a070  // b.any
   0x0000fffff7f9a048:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9a04c:	9e620121	scvtf	d1, x9
   0x0000fffff7f9a050:	14000002	b	0xfffff7f9a058
   0x0000fffff7f9a054:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9a058:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9a05c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9a060:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a064:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a068:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9a06c:	17ffffde	b	0xfffff7f99fe4
   0x0000fffff7f9a070:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9a074:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9a078:	aa1303e1	mov	x1, x19
   0x0000fffff7f9a07c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9a080:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7f9a084:	aa1403e4	mov	x4, x20
   0x0000fffff7f9a088:	aa1603e5	mov	x5, x22
   0x0000fffff7f9a08c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9a090:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9a094:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9a098:	d63f0200	blr	x16
   0x0000fffff7f9a09c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9a0a0:	540068c0	b.eq	0xfffff7f9adb8  // b.none
   0x0000fffff7f9a0a4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9a0a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9a0ac:	aa1303e1	mov	x1, x19
   0x0000fffff7f9a0b0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9a0b4:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7f9a0b8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9a0bc:	aa1603e5	mov	x5, x22
   0x0000fffff7f9a0c0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9a0c4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9a0c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9a0cc:	d63f0200	blr	x16
   0x0000fffff7f9a0d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9a0d4:	54006760	b.eq	0xfffff7f9adc0  // b.none
   0x0000fffff7f9a0d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a0dc:	37d806a9	tbnz	w9, #27, 0xfffff7f9a1b0
   0x0000fffff7f9a0e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a0e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a0e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a0ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a0f0:	540001c1	b.ne	0xfffff7f9a128  // b.any
   0x0000fffff7f9a0f4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9a0f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a0fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a100:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a104:	54000121	b.ne	0xfffff7f9a128  // b.any
   0x0000fffff7f9a108:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9a10c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f9a110:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9a114:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a118:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a11c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9a120:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9a124:	14000030	b	0xfffff7f9a1e4
   0x0000fffff7f9a128:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a12c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a130:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a134:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a138:	54000120	b.eq	0xfffff7f9a15c  // b.none
   0x0000fffff7f9a13c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a140:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a144:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a148:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a14c:	54000321	b.ne	0xfffff7f9a1b0  // b.any
   0x0000fffff7f9a150:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9a154:	9e620120	scvtf	d0, x9
   0x0000fffff7f9a158:	14000002	b	0xfffff7f9a160
   0x0000fffff7f9a15c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9a160:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9a164:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a168:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a16c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a170:	54000120	b.eq	0xfffff7f9a194  // b.none
   0x0000fffff7f9a174:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9a178:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a17c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a180:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a184:	54000161	b.ne	0xfffff7f9a1b0  // b.any
   0x0000fffff7f9a188:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9a18c:	9e620121	scvtf	d1, x9
   0x0000fffff7f9a190:	14000002	b	0xfffff7f9a198
   0x0000fffff7f9a194:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9a198:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9a19c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9a1a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a1a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a1a8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9a1ac:	17ffffde	b	0xfffff7f9a124
   0x0000fffff7f9a1b0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9a1b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9a1b8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9a1bc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9a1c0:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7f9a1c4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9a1c8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9a1cc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9a1d0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9a1d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9a1d8:	d63f0200	blr	x16
   0x0000fffff7f9a1dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9a1e0:	54005f40	b.eq	0xfffff7f9adc8  // b.none
   0x0000fffff7f9a1e4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9a1e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9a1ec:	aa1303e1	mov	x1, x19
   0x0000fffff7f9a1f0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9a1f4:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7f9a1f8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9a1fc:	aa1603e5	mov	x5, x22
   0x0000fffff7f9a200:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9a204:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9a208:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9a20c:	d63f0200	blr	x16
   0x0000fffff7f9a210:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9a214:	54005de0	b.eq	0xfffff7f9add0  // b.none
   0x0000fffff7f9a218:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a21c:	37d806a9	tbnz	w9, #27, 0xfffff7f9a2f0
   0x0000fffff7f9a220:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a224:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a228:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a22c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a230:	540001c1	b.ne	0xfffff7f9a268  // b.any
   0x0000fffff7f9a234:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9a238:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a23c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a240:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a244:	54000121	b.ne	0xfffff7f9a268  // b.any
   0x0000fffff7f9a248:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9a24c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f9a250:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9a254:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a258:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a25c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9a260:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9a264:	14000030	b	0xfffff7f9a324
   0x0000fffff7f9a268:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a26c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a270:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a274:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a278:	54000120	b.eq	0xfffff7f9a29c  // b.none
   0x0000fffff7f9a27c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a280:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a284:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a288:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a28c:	54000321	b.ne	0xfffff7f9a2f0  // b.any
   0x0000fffff7f9a290:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9a294:	9e620120	scvtf	d0, x9
   0x0000fffff7f9a298:	14000002	b	0xfffff7f9a2a0
   0x0000fffff7f9a29c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9a2a0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9a2a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a2a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a2ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a2b0:	54000120	b.eq	0xfffff7f9a2d4  // b.none
   0x0000fffff7f9a2b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9a2b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a2bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a2c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a2c4:	54000161	b.ne	0xfffff7f9a2f0  // b.any
   0x0000fffff7f9a2c8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9a2cc:	9e620121	scvtf	d1, x9
   0x0000fffff7f9a2d0:	14000002	b	0xfffff7f9a2d8
   0x0000fffff7f9a2d4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9a2d8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9a2dc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9a2e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a2e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a2e8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9a2ec:	17ffffde	b	0xfffff7f9a264
   0x0000fffff7f9a2f0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9a2f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9a2f8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9a2fc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9a300:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7f9a304:	aa1403e4	mov	x4, x20
   0x0000fffff7f9a308:	aa1603e5	mov	x5, x22
   0x0000fffff7f9a30c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9a310:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9a314:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9a318:	d63f0200	blr	x16
   0x0000fffff7f9a31c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9a320:	540055c0	b.eq	0xfffff7f9add8  // b.none
   0x0000fffff7f9a324:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9a328:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9a32c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9a330:	aa1503e2	mov	x2, x21
   0x0000fffff7f9a334:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7f9a338:	aa1403e4	mov	x4, x20
   0x0000fffff7f9a33c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9a340:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9a344:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9a348:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9a34c:	d63f0200	blr	x16
   0x0000fffff7f9a350:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9a354:	54005460	b.eq	0xfffff7f9ade0  // b.none
   0x0000fffff7f9a358:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a35c:	37d806a9	tbnz	w9, #27, 0xfffff7f9a430
   0x0000fffff7f9a360:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a364:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a368:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a36c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a370:	540001c1	b.ne	0xfffff7f9a3a8  // b.any
   0x0000fffff7f9a374:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9a378:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a37c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a380:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a384:	54000121	b.ne	0xfffff7f9a3a8  // b.any
   0x0000fffff7f9a388:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9a38c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f9a390:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9a394:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a398:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a39c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9a3a0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9a3a4:	14000030	b	0xfffff7f9a464
   0x0000fffff7f9a3a8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a3ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a3b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a3b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a3b8:	54000120	b.eq	0xfffff7f9a3dc  // b.none
   0x0000fffff7f9a3bc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a3c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a3c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a3c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a3cc:	54000321	b.ne	0xfffff7f9a430  // b.any
   0x0000fffff7f9a3d0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9a3d4:	9e620120	scvtf	d0, x9
   0x0000fffff7f9a3d8:	14000002	b	0xfffff7f9a3e0
   0x0000fffff7f9a3dc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9a3e0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9a3e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a3e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a3ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a3f0:	54000120	b.eq	0xfffff7f9a414  // b.none
   0x0000fffff7f9a3f4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9a3f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a3fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a400:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a404:	54000161	b.ne	0xfffff7f9a430  // b.any
   0x0000fffff7f9a408:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9a40c:	9e620121	scvtf	d1, x9
   0x0000fffff7f9a410:	14000002	b	0xfffff7f9a418
   0x0000fffff7f9a414:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9a418:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9a41c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9a420:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a424:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a428:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9a42c:	17ffffde	b	0xfffff7f9a3a4
   0x0000fffff7f9a430:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9a434:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9a438:	aa1303e1	mov	x1, x19
   0x0000fffff7f9a43c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9a440:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7f9a444:	aa1403e4	mov	x4, x20
   0x0000fffff7f9a448:	aa1603e5	mov	x5, x22
   0x0000fffff7f9a44c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9a450:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9a454:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9a458:	d63f0200	blr	x16
   0x0000fffff7f9a45c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9a460:	54004c40	b.eq	0xfffff7f9ade8  // b.none
   0x0000fffff7f9a464:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9a468:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9a46c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9a470:	aa1503e2	mov	x2, x21
   0x0000fffff7f9a474:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7f9a478:	aa1403e4	mov	x4, x20
   0x0000fffff7f9a47c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9a480:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9a484:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9a488:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9a48c:	d63f0200	blr	x16
   0x0000fffff7f9a490:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9a494:	54004ae0	b.eq	0xfffff7f9adf0  // b.none
   0x0000fffff7f9a498:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a49c:	37d806a9	tbnz	w9, #27, 0xfffff7f9a570
   0x0000fffff7f9a4a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a4a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a4a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a4ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a4b0:	540001c1	b.ne	0xfffff7f9a4e8  // b.any
   0x0000fffff7f9a4b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9a4b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a4bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a4c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a4c4:	54000121	b.ne	0xfffff7f9a4e8  // b.any
   0x0000fffff7f9a4c8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9a4cc:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f9a4d0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9a4d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a4d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a4dc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9a4e0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9a4e4:	14000030	b	0xfffff7f9a5a4
   0x0000fffff7f9a4e8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a4ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a4f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a4f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a4f8:	54000120	b.eq	0xfffff7f9a51c  // b.none
   0x0000fffff7f9a4fc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a500:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a504:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a508:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a50c:	54000321	b.ne	0xfffff7f9a570  // b.any
   0x0000fffff7f9a510:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9a514:	9e620120	scvtf	d0, x9
   0x0000fffff7f9a518:	14000002	b	0xfffff7f9a520
   0x0000fffff7f9a51c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9a520:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9a524:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a528:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a52c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a530:	54000120	b.eq	0xfffff7f9a554  // b.none
   0x0000fffff7f9a534:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9a538:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a53c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a540:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a544:	54000161	b.ne	0xfffff7f9a570  // b.any
   0x0000fffff7f9a548:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9a54c:	9e620121	scvtf	d1, x9
   0x0000fffff7f9a550:	14000002	b	0xfffff7f9a558
   0x0000fffff7f9a554:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9a558:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9a55c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9a560:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a564:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a568:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9a56c:	17ffffde	b	0xfffff7f9a4e4
   0x0000fffff7f9a570:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9a574:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9a578:	aa1303e1	mov	x1, x19
   0x0000fffff7f9a57c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9a580:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7f9a584:	aa1403e4	mov	x4, x20
   0x0000fffff7f9a588:	aa1603e5	mov	x5, x22
   0x0000fffff7f9a58c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9a590:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9a594:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9a598:	d63f0200	blr	x16
   0x0000fffff7f9a59c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9a5a0:	540042c0	b.eq	0xfffff7f9adf8  // b.none
   0x0000fffff7f9a5a4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9a5a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9a5ac:	aa1303e1	mov	x1, x19
   0x0000fffff7f9a5b0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9a5b4:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7f9a5b8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9a5bc:	aa1603e5	mov	x5, x22
   0x0000fffff7f9a5c0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9a5c4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9a5c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9a5cc:	d63f0200	blr	x16
   0x0000fffff7f9a5d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9a5d4:	54004160	b.eq	0xfffff7f9ae00  // b.none
   0x0000fffff7f9a5d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a5dc:	37d806a9	tbnz	w9, #27, 0xfffff7f9a6b0
   0x0000fffff7f9a5e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a5e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a5e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a5ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a5f0:	540001c1	b.ne	0xfffff7f9a628  // b.any
   0x0000fffff7f9a5f4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9a5f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a5fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a600:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a604:	54000121	b.ne	0xfffff7f9a628  // b.any
   0x0000fffff7f9a608:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9a60c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f9a610:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9a614:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a618:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a61c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9a620:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9a624:	14000030	b	0xfffff7f9a6e4
   0x0000fffff7f9a628:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a62c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a630:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a634:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a638:	54000120	b.eq	0xfffff7f9a65c  // b.none
   0x0000fffff7f9a63c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a640:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a644:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a648:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a64c:	54000321	b.ne	0xfffff7f9a6b0  // b.any
   0x0000fffff7f9a650:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9a654:	9e620120	scvtf	d0, x9
   0x0000fffff7f9a658:	14000002	b	0xfffff7f9a660
   0x0000fffff7f9a65c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9a660:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9a664:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a668:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a66c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a670:	54000120	b.eq	0xfffff7f9a694  // b.none
   0x0000fffff7f9a674:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9a678:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a67c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a680:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a684:	54000161	b.ne	0xfffff7f9a6b0  // b.any
   0x0000fffff7f9a688:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9a68c:	9e620121	scvtf	d1, x9
   0x0000fffff7f9a690:	14000002	b	0xfffff7f9a698
   0x0000fffff7f9a694:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9a698:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9a69c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9a6a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a6a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a6a8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9a6ac:	17ffffde	b	0xfffff7f9a624
   0x0000fffff7f9a6b0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9a6b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9a6b8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9a6bc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9a6c0:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7f9a6c4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9a6c8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9a6cc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9a6d0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9a6d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9a6d8:	d63f0200	blr	x16
   0x0000fffff7f9a6dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9a6e0:	54003940	b.eq	0xfffff7f9ae08  // b.none
   0x0000fffff7f9a6e4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9a6e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9a6ec:	aa1303e1	mov	x1, x19
   0x0000fffff7f9a6f0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9a6f4:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7f9a6f8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9a6fc:	aa1603e5	mov	x5, x22
   0x0000fffff7f9a700:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9a704:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9a708:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9a70c:	d63f0200	blr	x16
   0x0000fffff7f9a710:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9a714:	540037e0	b.eq	0xfffff7f9ae10  // b.none
   0x0000fffff7f9a718:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a71c:	37d806a9	tbnz	w9, #27, 0xfffff7f9a7f0
   0x0000fffff7f9a720:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a724:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a728:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a72c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a730:	540001c1	b.ne	0xfffff7f9a768  // b.any
   0x0000fffff7f9a734:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9a738:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a73c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a740:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a744:	54000121	b.ne	0xfffff7f9a768  // b.any
   0x0000fffff7f9a748:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9a74c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f9a750:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9a754:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a758:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a75c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9a760:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9a764:	14000030	b	0xfffff7f9a824
   0x0000fffff7f9a768:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a76c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a770:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a774:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a778:	54000120	b.eq	0xfffff7f9a79c  // b.none
   0x0000fffff7f9a77c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a780:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a784:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a788:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a78c:	54000321	b.ne	0xfffff7f9a7f0  // b.any
   0x0000fffff7f9a790:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9a794:	9e620120	scvtf	d0, x9
   0x0000fffff7f9a798:	14000002	b	0xfffff7f9a7a0
   0x0000fffff7f9a79c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9a7a0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9a7a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a7a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a7ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a7b0:	54000120	b.eq	0xfffff7f9a7d4  // b.none
   0x0000fffff7f9a7b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9a7b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a7bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a7c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a7c4:	54000161	b.ne	0xfffff7f9a7f0  // b.any
   0x0000fffff7f9a7c8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9a7cc:	9e620121	scvtf	d1, x9
   0x0000fffff7f9a7d0:	14000002	b	0xfffff7f9a7d8
   0x0000fffff7f9a7d4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9a7d8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9a7dc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9a7e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a7e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a7e8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9a7ec:	17ffffde	b	0xfffff7f9a764
   0x0000fffff7f9a7f0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9a7f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9a7f8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9a7fc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9a800:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7f9a804:	aa1403e4	mov	x4, x20
   0x0000fffff7f9a808:	aa1603e5	mov	x5, x22
   0x0000fffff7f9a80c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9a810:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9a814:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9a818:	d63f0200	blr	x16
   0x0000fffff7f9a81c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9a820:	54002fc0	b.eq	0xfffff7f9ae18  // b.none
   0x0000fffff7f9a824:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9a828:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9a82c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9a830:	aa1503e2	mov	x2, x21
   0x0000fffff7f9a834:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7f9a838:	aa1403e4	mov	x4, x20
   0x0000fffff7f9a83c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9a840:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9a844:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9a848:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9a84c:	d63f0200	blr	x16
   0x0000fffff7f9a850:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9a854:	54002e60	b.eq	0xfffff7f9ae20  // b.none
   0x0000fffff7f9a858:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a85c:	37d806a9	tbnz	w9, #27, 0xfffff7f9a930
   0x0000fffff7f9a860:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a864:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a868:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a86c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a870:	540001c1	b.ne	0xfffff7f9a8a8  // b.any
   0x0000fffff7f9a874:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9a878:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a87c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a880:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a884:	54000121	b.ne	0xfffff7f9a8a8  // b.any
   0x0000fffff7f9a888:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9a88c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f9a890:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9a894:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a898:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a89c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9a8a0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9a8a4:	14000030	b	0xfffff7f9a964
   0x0000fffff7f9a8a8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a8ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a8b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a8b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a8b8:	54000120	b.eq	0xfffff7f9a8dc  // b.none
   0x0000fffff7f9a8bc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a8c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a8c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a8c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a8cc:	54000321	b.ne	0xfffff7f9a930  // b.any
   0x0000fffff7f9a8d0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9a8d4:	9e620120	scvtf	d0, x9
   0x0000fffff7f9a8d8:	14000002	b	0xfffff7f9a8e0
   0x0000fffff7f9a8dc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9a8e0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9a8e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a8e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a8ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a8f0:	54000120	b.eq	0xfffff7f9a914  // b.none
   0x0000fffff7f9a8f4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9a8f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a8fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a900:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a904:	54000161	b.ne	0xfffff7f9a930  // b.any
   0x0000fffff7f9a908:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9a90c:	9e620121	scvtf	d1, x9
   0x0000fffff7f9a910:	14000002	b	0xfffff7f9a918
   0x0000fffff7f9a914:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9a918:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9a91c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9a920:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a924:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a928:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9a92c:	17ffffde	b	0xfffff7f9a8a4
   0x0000fffff7f9a930:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9a934:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9a938:	aa1303e1	mov	x1, x19
   0x0000fffff7f9a93c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9a940:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7f9a944:	aa1403e4	mov	x4, x20
   0x0000fffff7f9a948:	aa1603e5	mov	x5, x22
   0x0000fffff7f9a94c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9a950:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9a954:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9a958:	d63f0200	blr	x16
   0x0000fffff7f9a95c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9a960:	54002640	b.eq	0xfffff7f9ae28  // b.none
   0x0000fffff7f9a964:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9a968:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9a96c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9a970:	aa1503e2	mov	x2, x21
   0x0000fffff7f9a974:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7f9a978:	aa1403e4	mov	x4, x20
   0x0000fffff7f9a97c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9a980:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9a984:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9a988:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9a98c:	d63f0200	blr	x16
   0x0000fffff7f9a990:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9a994:	540024e0	b.eq	0xfffff7f9ae30  // b.none
   0x0000fffff7f9a998:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a99c:	37d806a9	tbnz	w9, #27, 0xfffff7f9aa70
   0x0000fffff7f9a9a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a9a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a9a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a9ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a9b0:	540001c1	b.ne	0xfffff7f9a9e8  // b.any
   0x0000fffff7f9a9b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9a9b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a9bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a9c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a9c4:	54000121	b.ne	0xfffff7f9a9e8  // b.any
   0x0000fffff7f9a9c8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9a9cc:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f9a9d0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9a9d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a9d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a9dc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9a9e0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9a9e4:	14000030	b	0xfffff7f9aaa4
   0x0000fffff7f9a9e8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9a9ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a9f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a9f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a9f8:	54000120	b.eq	0xfffff7f9aa1c  // b.none
   0x0000fffff7f9a9fc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9aa00:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9aa04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9aa08:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9aa0c:	54000321	b.ne	0xfffff7f9aa70  // b.any
   0x0000fffff7f9aa10:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9aa14:	9e620120	scvtf	d0, x9
   0x0000fffff7f9aa18:	14000002	b	0xfffff7f9aa20
   0x0000fffff7f9aa1c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9aa20:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9aa24:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9aa28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9aa2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9aa30:	54000120	b.eq	0xfffff7f9aa54  // b.none
   0x0000fffff7f9aa34:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9aa38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9aa3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9aa40:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9aa44:	54000161	b.ne	0xfffff7f9aa70  // b.any
   0x0000fffff7f9aa48:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9aa4c:	9e620121	scvtf	d1, x9
   0x0000fffff7f9aa50:	14000002	b	0xfffff7f9aa58
   0x0000fffff7f9aa54:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9aa58:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9aa5c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9aa60:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9aa64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9aa68:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9aa6c:	17ffffde	b	0xfffff7f9a9e4
   0x0000fffff7f9aa70:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9aa74:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9aa78:	aa1303e1	mov	x1, x19
   0x0000fffff7f9aa7c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9aa80:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7f9aa84:	aa1403e4	mov	x4, x20
   0x0000fffff7f9aa88:	aa1603e5	mov	x5, x22
   0x0000fffff7f9aa8c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9aa90:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9aa94:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9aa98:	d63f0200	blr	x16
   0x0000fffff7f9aa9c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9aaa0:	54001cc0	b.eq	0xfffff7f9ae38  // b.none
   0x0000fffff7f9aaa4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9aaa8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9aaac:	aa1303e1	mov	x1, x19
   0x0000fffff7f9aab0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9aab4:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7f9aab8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9aabc:	aa1603e5	mov	x5, x22
   0x0000fffff7f9aac0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9aac4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9aac8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9aacc:	d63f0200	blr	x16
   0x0000fffff7f9aad0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9aad4:	54001b60	b.eq	0xfffff7f9ae40  // b.none
   0x0000fffff7f9aad8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9aadc:	37d806a9	tbnz	w9, #27, 0xfffff7f9abb0
   0x0000fffff7f9aae0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9aae4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9aae8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9aaec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9aaf0:	540001c1	b.ne	0xfffff7f9ab28  // b.any
   0x0000fffff7f9aaf4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9aaf8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9aafc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ab00:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ab04:	54000121	b.ne	0xfffff7f9ab28  // b.any
   0x0000fffff7f9ab08:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9ab0c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f9ab10:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9ab14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ab18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ab1c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9ab20:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9ab24:	14000030	b	0xfffff7f9abe4
   0x0000fffff7f9ab28:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9ab2c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9ab30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ab34:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ab38:	54000120	b.eq	0xfffff7f9ab5c  // b.none
   0x0000fffff7f9ab3c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9ab40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ab44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ab48:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ab4c:	54000321	b.ne	0xfffff7f9abb0  // b.any
   0x0000fffff7f9ab50:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9ab54:	9e620120	scvtf	d0, x9
   0x0000fffff7f9ab58:	14000002	b	0xfffff7f9ab60
   0x0000fffff7f9ab5c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9ab60:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9ab64:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9ab68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ab6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ab70:	54000120	b.eq	0xfffff7f9ab94  // b.none
   0x0000fffff7f9ab74:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9ab78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ab7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ab80:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ab84:	54000161	b.ne	0xfffff7f9abb0  // b.any
   0x0000fffff7f9ab88:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9ab8c:	9e620121	scvtf	d1, x9
   0x0000fffff7f9ab90:	14000002	b	0xfffff7f9ab98
   0x0000fffff7f9ab94:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9ab98:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9ab9c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9aba0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9aba4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9aba8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9abac:	17ffffde	b	0xfffff7f9ab24
   0x0000fffff7f9abb0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9abb4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9abb8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9abbc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9abc0:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7f9abc4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9abc8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9abcc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9abd0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9abd4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9abd8:	d63f0200	blr	x16
   0x0000fffff7f9abdc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9abe0:	54001340	b.eq	0xfffff7f9ae48  // b.none
   0x0000fffff7f9abe4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9abe8:	37d80269	tbnz	w9, #27, 0xfffff7f9ac34
   0x0000fffff7f9abec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9abf0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9abf4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9abf8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9abfc:	540001c1	b.ne	0xfffff7f9ac34  // b.any
   0x0000fffff7f9ac00:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9ac04:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7f9ac08:	8b0a012b	add	x11, x9, x10
   0x0000fffff7f9ac0c:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f9ac10:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ac14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ac18:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f9ac1c:	aa0b03e9	mov	x9, x11
   0x0000fffff7f9ac20:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ac24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ac28:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9ac2c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9ac30:	1400000e	b	0xfffff7f9ac68
   0x0000fffff7f9ac34:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9ac38:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ac3c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ac40:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ac44:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7f9ac48:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ac4c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ac50:	d2916810	mov	x16, #0x8b40                	// #35648
   0x0000fffff7f9ac54:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9ac58:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ac5c:	d63f0200	blr	x16
   0x0000fffff7f9ac60:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ac64:	54000f60	b.eq	0xfffff7f9ae50  // b.none
   0x0000fffff7f9ac68:	17fff926	b	0xfffff7f99100
   0x0000fffff7f9ac6c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9ac70:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ac74:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ac78:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ac7c:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7f9ac80:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ac84:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ac88:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7f9ac8c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9ac90:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ac94:	d63f0200	blr	x16
   0x0000fffff7f9ac98:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f9ac9c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f9aca0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f9aca4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f9aca8:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f9acac:	d65f03c0	ret
   0x0000fffff7f9acb0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9acb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9acb8:	b900028a	str	w10, [x20]
   0x0000fffff7f9acbc:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f9acc0:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f9acc4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f9acc8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f9accc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f9acd0:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f9acd4:	d65f03c0	ret
   0x0000fffff7f9acd8:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f9acdc:	17fffff5	b	0xfffff7f9acb0
   0x0000fffff7f9ace0:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f9ace4:	17fffff3	b	0xfffff7f9acb0
   0x0000fffff7f9ace8:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f9acec:	17fffff1	b	0xfffff7f9acb0
   0x0000fffff7f9acf0:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f9acf4:	17ffffef	b	0xfffff7f9acb0
   0x0000fffff7f9acf8:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f9acfc:	17ffffed	b	0xfffff7f9acb0
   0x0000fffff7f9ad00:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f9ad04:	17ffffeb	b	0xfffff7f9acb0
   0x0000fffff7f9ad08:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f9ad0c:	17ffffe9	b	0xfffff7f9acb0
   0x0000fffff7f9ad10:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f9ad14:	17ffffe7	b	0xfffff7f9acb0
   0x0000fffff7f9ad18:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f9ad1c:	17ffffe5	b	0xfffff7f9acb0
   0x0000fffff7f9ad20:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f9ad24:	17ffffe3	b	0xfffff7f9acb0
   0x0000fffff7f9ad28:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7f9ad2c:	17ffffe1	b	0xfffff7f9acb0
   0x0000fffff7f9ad30:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7f9ad34:	17ffffdf	b	0xfffff7f9acb0
   0x0000fffff7f9ad38:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7f9ad3c:	17ffffdd	b	0xfffff7f9acb0
   0x0000fffff7f9ad40:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7f9ad44:	17ffffdb	b	0xfffff7f9acb0
   0x0000fffff7f9ad48:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7f9ad4c:	17ffffd9	b	0xfffff7f9acb0
   0x0000fffff7f9ad50:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7f9ad54:	17ffffd7	b	0xfffff7f9acb0
   0x0000fffff7f9ad58:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7f9ad5c:	17ffffd5	b	0xfffff7f9acb0
   0x0000fffff7f9ad60:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7f9ad64:	17ffffd3	b	0xfffff7f9acb0
   0x0000fffff7f9ad68:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7f9ad6c:	17ffffd1	b	0xfffff7f9acb0
   0x0000fffff7f9ad70:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7f9ad74:	17ffffcf	b	0xfffff7f9acb0
   0x0000fffff7f9ad78:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7f9ad7c:	17ffffcd	b	0xfffff7f9acb0
   0x0000fffff7f9ad80:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7f9ad84:	17ffffcb	b	0xfffff7f9acb0
   0x0000fffff7f9ad88:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7f9ad8c:	17ffffc9	b	0xfffff7f9acb0
   0x0000fffff7f9ad90:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7f9ad94:	17ffffc7	b	0xfffff7f9acb0
   0x0000fffff7f9ad98:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7f9ad9c:	17ffffc5	b	0xfffff7f9acb0
   0x0000fffff7f9ada0:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7f9ada4:	17ffffc3	b	0xfffff7f9acb0
   0x0000fffff7f9ada8:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7f9adac:	17ffffc1	b	0xfffff7f9acb0
   0x0000fffff7f9adb0:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7f9adb4:	17ffffbf	b	0xfffff7f9acb0
   0x0000fffff7f9adb8:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7f9adbc:	17ffffbd	b	0xfffff7f9acb0
   0x0000fffff7f9adc0:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7f9adc4:	17ffffbb	b	0xfffff7f9acb0
   0x0000fffff7f9adc8:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7f9adcc:	17ffffb9	b	0xfffff7f9acb0
   0x0000fffff7f9add0:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7f9add4:	17ffffb7	b	0xfffff7f9acb0
   0x0000fffff7f9add8:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7f9addc:	17ffffb5	b	0xfffff7f9acb0
   0x0000fffff7f9ade0:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7f9ade4:	17ffffb3	b	0xfffff7f9acb0
   0x0000fffff7f9ade8:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7f9adec:	17ffffb1	b	0xfffff7f9acb0
   0x0000fffff7f9adf0:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7f9adf4:	17ffffaf	b	0xfffff7f9acb0
   0x0000fffff7f9adf8:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7f9adfc:	17ffffad	b	0xfffff7f9acb0
   0x0000fffff7f9ae00:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7f9ae04:	17ffffab	b	0xfffff7f9acb0
   0x0000fffff7f9ae08:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7f9ae0c:	17ffffa9	b	0xfffff7f9acb0
   0x0000fffff7f9ae10:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7f9ae14:	17ffffa7	b	0xfffff7f9acb0
   0x0000fffff7f9ae18:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7f9ae1c:	17ffffa5	b	0xfffff7f9acb0
   0x0000fffff7f9ae20:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7f9ae24:	17ffffa3	b	0xfffff7f9acb0
   0x0000fffff7f9ae28:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7f9ae2c:	17ffffa1	b	0xfffff7f9acb0
   0x0000fffff7f9ae30:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7f9ae34:	17ffff9f	b	0xfffff7f9acb0
   0x0000fffff7f9ae38:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7f9ae3c:	17ffff9d	b	0xfffff7f9acb0
   0x0000fffff7f9ae40:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7f9ae44:	17ffff9b	b	0xfffff7f9acb0
   0x0000fffff7f9ae48:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7f9ae4c:	17ffff99	b	0xfffff7f9acb0
   0x0000fffff7f9ae50:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7f9ae54:	17ffff97	b	0xfffff7f9acb0
   0x0000fffff7f9ae58:	00000000	udf	#0
   0x0000fffff7f9ae5c:	00000000	udf	#0
   0x0000fffff7f9ae60:	00000000	udf	#0
   0x0000fffff7f9ae64:	00000000	udf	#0
   0x0000fffff7f9ae68:	00000000	udf	#0
   0x0000fffff7f9ae6c:	00000000	udf	#0
   0x0000fffff7f9ae70:	00000000	udf	#0
   0x0000fffff7f9ae74:	00000000	udf	#0
   0x0000fffff7f9ae78:	00000000	udf	#0
   0x0000fffff7f9ae7c:	00000000	udf	#0
   0x0000fffff7f9ae80:	00000000	udf	#0
   0x0000fffff7f9ae84:	00000000	udf	#0
   0x0000fffff7f9ae88:	00000000	udf	#0
   0x0000fffff7f9ae8c:	00000000	udf	#0
   0x0000fffff7f9ae90:	00000000	udf	#0
   0x0000fffff7f9ae94:	00000000	udf	#0
   0x0000fffff7f9ae98:	00000000	udf	#0
   0x0000fffff7f9ae9c:	00000000	udf	#0
   0x0000fffff7f9aea0:	00000000	udf	#0
   0x0000fffff7f9aea4:	00000000	udf	#0
   0x0000fffff7f9aea8:	00000000	udf	#0
   0x0000fffff7f9aeac:	00000000	udf	#0
   0x0000fffff7f9aeb0:	00000000	udf	#0
   0x0000fffff7f9aeb4:	00000000	udf	#0
   0x0000fffff7f9aeb8:	00000000	udf	#0
   0x0000fffff7f9aebc:	00000000	udf	#0
   0x0000fffff7f9aec0:	00000000	udf	#0
   0x0000fffff7f9aec4:	00000000	udf	#0
   0x0000fffff7f9aec8:	00000000	udf	#0
   0x0000fffff7f9aecc:	00000000	udf	#0
   0x0000fffff7f9aed0:	00000000	udf	#0
   0x0000fffff7f9aed4:	00000000	udf	#0
   0x0000fffff7f9aed8:	00000000	udf	#0
   0x0000fffff7f9aedc:	00000000	udf	#0
   0x0000fffff7f9aee0:	00000000	udf	#0
   0x0000fffff7f9aee4:	00000000	udf	#0
   0x0000fffff7f9aee8:	00000000	udf	#0
   0x0000fffff7f9aeec:	00000000	udf	#0
   0x0000fffff7f9aef0:	00000000	udf	#0
   0x0000fffff7f9aef4:	00000000	udf	#0
   0x0000fffff7f9aef8:	00000000	udf	#0
   0x0000fffff7f9aefc:	00000000	udf	#0
   0x0000fffff7f9af00:	00000000	udf	#0
   0x0000fffff7f9af04:	00000000	udf	#0
   0x0000fffff7f9af08:	00000000	udf	#0
   0x0000fffff7f9af0c:	00000000	udf	#0
   0x0000fffff7f9af10:	00000000	udf	#0
   0x0000fffff7f9af14:	00000000	udf	#0
   0x0000fffff7f9af18:	00000000	udf	#0
   0x0000fffff7f9af1c:	00000000	udf	#0
   0x0000fffff7f9af20:	00000000	udf	#0
   0x0000fffff7f9af24:	00000000	udf	#0
   0x0000fffff7f9af28:	00000000	udf	#0
   0x0000fffff7f9af2c:	00000000	udf	#0
   0x0000fffff7f9af30:	00000000	udf	#0
   0x0000fffff7f9af34:	00000000	udf	#0
   0x0000fffff7f9af38:	00000000	udf	#0
   0x0000fffff7f9af3c:	00000000	udf	#0
   0x0000fffff7f9af40:	00000000	udf	#0
   0x0000fffff7f9af44:	00000000	udf	#0
   0x0000fffff7f9af48:	00000000	udf	#0
   0x0000fffff7f9af4c:	00000000	udf	#0
   0x0000fffff7f9af50:	00000000	udf	#0
   0x0000fffff7f9af54:	00000000	udf	#0
   0x0000fffff7f9af58:	00000000	udf	#0
   0x0000fffff7f9af5c:	00000000	udf	#0
   0x0000fffff7f9af60:	00000000	udf	#0
   0x0000fffff7f9af64:	00000000	udf	#0
   0x0000fffff7f9af68:	00000000	udf	#0
   0x0000fffff7f9af6c:	00000000	udf	#0
   0x0000fffff7f9af70:	00000000	udf	#0
   0x0000fffff7f9af74:	00000000	udf	#0
   0x0000fffff7f9af78:	00000000	udf	#0
   0x0000fffff7f9af7c:	00000000	udf	#0
   0x0000fffff7f9af80:	00000000	udf	#0
   0x0000fffff7f9af84:	00000000	udf	#0
   0x0000fffff7f9af88:	00000000	udf	#0
   0x0000fffff7f9af8c:	00000000	udf	#0
   0x0000fffff7f9af90:	00000000	udf	#0
   0x0000fffff7f9af94:	00000000	udf	#0
   0x0000fffff7f9af98:	00000000	udf	#0
   0x0000fffff7f9af9c:	00000000	udf	#0
   0x0000fffff7f9afa0:	00000000	udf	#0
   0x0000fffff7f9afa4:	00000000	udf	#0
   0x0000fffff7f9afa8:	00000000	udf	#0
   0x0000fffff7f9afac:	00000000	udf	#0
   0x0000fffff7f9afb0:	00000000	udf	#0
   0x0000fffff7f9afb4:	00000000	udf	#0
   0x0000fffff7f9afb8:	00000000	udf	#0
   0x0000fffff7f9afbc:	00000000	udf	#0
   0x0000fffff7f9afc0:	00000000	udf	#0
   0x0000fffff7f9afc4:	00000000	udf	#0
   0x0000fffff7f9afc8:	00000000	udf	#0
   0x0000fffff7f9afcc:	00000000	udf	#0
   0x0000fffff7f9afd0:	00000000	udf	#0
   0x0000fffff7f9afd4:	00000000	udf	#0
   0x0000fffff7f9afd8:	00000000	udf	#0
   0x0000fffff7f9afdc:	00000000	udf	#0
   0x0000fffff7f9afe0:	00000000	udf	#0
   0x0000fffff7f9afe4:	00000000	udf	#0
   0x0000fffff7f9afe8:	00000000	udf	#0
   0x0000fffff7f9afec:	00000000	udf	#0
   0x0000fffff7f9aff0:	00000000	udf	#0
   0x0000fffff7f9aff4:	00000000	udf	#0
   0x0000fffff7f9aff8:	00000000	udf	#0
   0x0000fffff7f9affc:	00000000	udf	#0
End of assembler dump.
