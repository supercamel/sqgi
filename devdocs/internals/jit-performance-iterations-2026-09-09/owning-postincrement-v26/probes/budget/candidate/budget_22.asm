Dump of assembler code from 0xfffff7f97000 to 0xfffff7f99000:
   0x0000fffff7f97000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7f97004:	910003fd	mov	x29, sp
   0x0000fffff7f97008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7f9700c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7f97010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7f97014:	aa0003f3	mov	x19, x0
   0x0000fffff7f97018:	aa0103f4	mov	x20, x1
   0x0000fffff7f9701c:	aa0203f5	mov	x21, x2
   0x0000fffff7f97020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7f97024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7f97028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f9702c:	f90003e9	str	x9, [sp]
   0x0000fffff7f97030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7f97034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7f97038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7f9703c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f97040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97044:	d63f0200	blr	x16
   0x0000fffff7f97048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7f9704c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7f97050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7f97054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7f97058:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9705c:	37d800e9	tbnz	w9, #27, 0xfffff7f97078
   0x0000fffff7f97060:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f97064:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97068:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9706c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f97070:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f97074:	1400000e	b	0xfffff7f970ac
   0x0000fffff7f97078:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9707c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97080:	aa1303e1	mov	x1, x19
   0x0000fffff7f97084:	aa1503e2	mov	x2, x21
   0x0000fffff7f97088:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7f9708c:	aa1403e4	mov	x4, x20
   0x0000fffff7f97090:	aa1603e5	mov	x5, x22
   0x0000fffff7f97094:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7f97098:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9709c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f970a0:	d63f0200	blr	x16
   0x0000fffff7f970a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f970a8:	5400eb80	b.eq	0xfffff7f98e18  // b.none
   0x0000fffff7f970ac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f970b0:	37d800e9	tbnz	w9, #27, 0xfffff7f970cc
   0x0000fffff7f970b4:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f970b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f970bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f970c0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f970c4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f970c8:	1400000e	b	0xfffff7f97100
   0x0000fffff7f970cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f970d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f970d4:	aa1303e1	mov	x1, x19
   0x0000fffff7f970d8:	aa1503e2	mov	x2, x21
   0x0000fffff7f970dc:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7f970e0:	aa1403e4	mov	x4, x20
   0x0000fffff7f970e4:	aa1603e5	mov	x5, x22
   0x0000fffff7f970e8:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7f970ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f970f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f970f4:	d63f0200	blr	x16
   0x0000fffff7f970f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f970fc:	5400e920	b.eq	0xfffff7f98e20  // b.none
   0x0000fffff7f97100:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97104:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97108:	aa1303e1	mov	x1, x19
   0x0000fffff7f9710c:	aa1503e2	mov	x2, x21
   0x0000fffff7f97110:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f97114:	aa1403e4	mov	x4, x20
   0x0000fffff7f97118:	aa1603e5	mov	x5, x22
   0x0000fffff7f9711c:	d2909810	mov	x16, #0x84c0                	// #33984
   0x0000fffff7f97120:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97124:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97128:	d63f0200	blr	x16
   0x0000fffff7f9712c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97130:	5400e7c0	b.eq	0xfffff7f98e28  // b.none
   0x0000fffff7f97134:	f100041f	cmp	x0, #0x1
   0x0000fffff7f97138:	5400e3a0	b.eq	0xfffff7f98dac  // b.none
   0x0000fffff7f9713c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97140:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97144:	aa1303e1	mov	x1, x19
   0x0000fffff7f97148:	aa1503e2	mov	x2, x21
   0x0000fffff7f9714c:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7f97150:	aa1403e4	mov	x4, x20
   0x0000fffff7f97154:	aa1603e5	mov	x5, x22
   0x0000fffff7f97158:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9715c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97160:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97164:	d63f0200	blr	x16
   0x0000fffff7f97168:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9716c:	5400e620	b.eq	0xfffff7f98e30  // b.none
   0x0000fffff7f97170:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f97174:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97178:	aa1303e1	mov	x1, x19
   0x0000fffff7f9717c:	aa1503e2	mov	x2, x21
   0x0000fffff7f97180:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7f97184:	aa1403e4	mov	x4, x20
   0x0000fffff7f97188:	aa1603e5	mov	x5, x22
   0x0000fffff7f9718c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f97190:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97194:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97198:	d63f0200	blr	x16
   0x0000fffff7f9719c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f971a0:	5400e4c0	b.eq	0xfffff7f98e38  // b.none
   0x0000fffff7f971a4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f971a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f971ac:	aa1303e1	mov	x1, x19
   0x0000fffff7f971b0:	aa1503e2	mov	x2, x21
   0x0000fffff7f971b4:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f971b8:	aa1403e4	mov	x4, x20
   0x0000fffff7f971bc:	aa1603e5	mov	x5, x22
   0x0000fffff7f971c0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f971c4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f971c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f971cc:	d63f0200	blr	x16
   0x0000fffff7f971d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f971d4:	5400e360	b.eq	0xfffff7f98e40  // b.none
   0x0000fffff7f971d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f971dc:	37d806a9	tbnz	w9, #27, 0xfffff7f972b0
   0x0000fffff7f971e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f971e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f971e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f971ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f971f0:	540001c1	b.ne	0xfffff7f97228  // b.any
   0x0000fffff7f971f4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f971f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f971fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97200:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97204:	54000121	b.ne	0xfffff7f97228  // b.any
   0x0000fffff7f97208:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9720c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f97210:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97214:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97218:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9721c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f97220:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f97224:	14000030	b	0xfffff7f972e4
   0x0000fffff7f97228:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9722c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97230:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97234:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97238:	54000120	b.eq	0xfffff7f9725c  // b.none
   0x0000fffff7f9723c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97240:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97244:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97248:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9724c:	54000321	b.ne	0xfffff7f972b0  // b.any
   0x0000fffff7f97250:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f97254:	9e620120	scvtf	d0, x9
   0x0000fffff7f97258:	14000002	b	0xfffff7f97260
   0x0000fffff7f9725c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f97260:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f97264:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97268:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9726c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97270:	54000120	b.eq	0xfffff7f97294  // b.none
   0x0000fffff7f97274:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f97278:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9727c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97280:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97284:	54000161	b.ne	0xfffff7f972b0  // b.any
   0x0000fffff7f97288:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9728c:	9e620121	scvtf	d1, x9
   0x0000fffff7f97290:	14000002	b	0xfffff7f97298
   0x0000fffff7f97294:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f97298:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9729c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f972a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f972a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f972a8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f972ac:	17ffffde	b	0xfffff7f97224
   0x0000fffff7f972b0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f972b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f972b8:	aa1303e1	mov	x1, x19
   0x0000fffff7f972bc:	aa1503e2	mov	x2, x21
   0x0000fffff7f972c0:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f972c4:	aa1403e4	mov	x4, x20
   0x0000fffff7f972c8:	aa1603e5	mov	x5, x22
   0x0000fffff7f972cc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f972d0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f972d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f972d8:	d63f0200	blr	x16
   0x0000fffff7f972dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f972e0:	5400db40	b.eq	0xfffff7f98e48  // b.none
   0x0000fffff7f972e4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f972e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f972ec:	aa1303e1	mov	x1, x19
   0x0000fffff7f972f0:	aa1503e2	mov	x2, x21
   0x0000fffff7f972f4:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f972f8:	aa1403e4	mov	x4, x20
   0x0000fffff7f972fc:	aa1603e5	mov	x5, x22
   0x0000fffff7f97300:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f97304:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97308:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9730c:	d63f0200	blr	x16
   0x0000fffff7f97310:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97314:	5400d9e0	b.eq	0xfffff7f98e50  // b.none
   0x0000fffff7f97318:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9731c:	37d806a9	tbnz	w9, #27, 0xfffff7f973f0
   0x0000fffff7f97320:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97324:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97328:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9732c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97330:	540001c1	b.ne	0xfffff7f97368  // b.any
   0x0000fffff7f97334:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f97338:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9733c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97340:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97344:	54000121	b.ne	0xfffff7f97368  // b.any
   0x0000fffff7f97348:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9734c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f97350:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97354:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97358:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9735c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f97360:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f97364:	14000030	b	0xfffff7f97424
   0x0000fffff7f97368:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9736c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97370:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97374:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97378:	54000120	b.eq	0xfffff7f9739c  // b.none
   0x0000fffff7f9737c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97380:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97384:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97388:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9738c:	54000321	b.ne	0xfffff7f973f0  // b.any
   0x0000fffff7f97390:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f97394:	9e620120	scvtf	d0, x9
   0x0000fffff7f97398:	14000002	b	0xfffff7f973a0
   0x0000fffff7f9739c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f973a0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f973a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f973a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f973ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f973b0:	54000120	b.eq	0xfffff7f973d4  // b.none
   0x0000fffff7f973b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f973b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f973bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f973c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f973c4:	54000161	b.ne	0xfffff7f973f0  // b.any
   0x0000fffff7f973c8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f973cc:	9e620121	scvtf	d1, x9
   0x0000fffff7f973d0:	14000002	b	0xfffff7f973d8
   0x0000fffff7f973d4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f973d8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f973dc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f973e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f973e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f973e8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f973ec:	17ffffde	b	0xfffff7f97364
   0x0000fffff7f973f0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f973f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f973f8:	aa1303e1	mov	x1, x19
   0x0000fffff7f973fc:	aa1503e2	mov	x2, x21
   0x0000fffff7f97400:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f97404:	aa1403e4	mov	x4, x20
   0x0000fffff7f97408:	aa1603e5	mov	x5, x22
   0x0000fffff7f9740c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f97410:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97414:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97418:	d63f0200	blr	x16
   0x0000fffff7f9741c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97420:	5400d1c0	b.eq	0xfffff7f98e58  // b.none
   0x0000fffff7f97424:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f97428:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9742c:	aa1303e1	mov	x1, x19
   0x0000fffff7f97430:	aa1503e2	mov	x2, x21
   0x0000fffff7f97434:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f97438:	aa1403e4	mov	x4, x20
   0x0000fffff7f9743c:	aa1603e5	mov	x5, x22
   0x0000fffff7f97440:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f97444:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97448:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9744c:	d63f0200	blr	x16
   0x0000fffff7f97450:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97454:	5400d060	b.eq	0xfffff7f98e60  // b.none
   0x0000fffff7f97458:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9745c:	37d806a9	tbnz	w9, #27, 0xfffff7f97530
   0x0000fffff7f97460:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97464:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97468:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9746c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97470:	540001c1	b.ne	0xfffff7f974a8  // b.any
   0x0000fffff7f97474:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f97478:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9747c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97480:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97484:	54000121	b.ne	0xfffff7f974a8  // b.any
   0x0000fffff7f97488:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9748c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f97490:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97494:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97498:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9749c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f974a0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f974a4:	14000030	b	0xfffff7f97564
   0x0000fffff7f974a8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f974ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f974b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f974b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f974b8:	54000120	b.eq	0xfffff7f974dc  // b.none
   0x0000fffff7f974bc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f974c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f974c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f974c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f974cc:	54000321	b.ne	0xfffff7f97530  // b.any
   0x0000fffff7f974d0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f974d4:	9e620120	scvtf	d0, x9
   0x0000fffff7f974d8:	14000002	b	0xfffff7f974e0
   0x0000fffff7f974dc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f974e0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f974e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f974e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f974ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f974f0:	54000120	b.eq	0xfffff7f97514  // b.none
   0x0000fffff7f974f4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f974f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f974fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97500:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97504:	54000161	b.ne	0xfffff7f97530  // b.any
   0x0000fffff7f97508:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9750c:	9e620121	scvtf	d1, x9
   0x0000fffff7f97510:	14000002	b	0xfffff7f97518
   0x0000fffff7f97514:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f97518:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9751c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f97520:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97524:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97528:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9752c:	17ffffde	b	0xfffff7f974a4
   0x0000fffff7f97530:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97534:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97538:	aa1303e1	mov	x1, x19
   0x0000fffff7f9753c:	aa1503e2	mov	x2, x21
   0x0000fffff7f97540:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f97544:	aa1403e4	mov	x4, x20
   0x0000fffff7f97548:	aa1603e5	mov	x5, x22
   0x0000fffff7f9754c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f97550:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97554:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97558:	d63f0200	blr	x16
   0x0000fffff7f9755c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97560:	5400c840	b.eq	0xfffff7f98e68  // b.none
   0x0000fffff7f97564:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f97568:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9756c:	aa1303e1	mov	x1, x19
   0x0000fffff7f97570:	aa1503e2	mov	x2, x21
   0x0000fffff7f97574:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7f97578:	aa1403e4	mov	x4, x20
   0x0000fffff7f9757c:	aa1603e5	mov	x5, x22
   0x0000fffff7f97580:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f97584:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97588:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9758c:	d63f0200	blr	x16
   0x0000fffff7f97590:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97594:	5400c6e0	b.eq	0xfffff7f98e70  // b.none
   0x0000fffff7f97598:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9759c:	37d806a9	tbnz	w9, #27, 0xfffff7f97670
   0x0000fffff7f975a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f975a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f975a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f975ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f975b0:	540001c1	b.ne	0xfffff7f975e8  // b.any
   0x0000fffff7f975b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f975b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f975bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f975c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f975c4:	54000121	b.ne	0xfffff7f975e8  // b.any
   0x0000fffff7f975c8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f975cc:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f975d0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f975d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f975d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f975dc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f975e0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f975e4:	14000030	b	0xfffff7f976a4
   0x0000fffff7f975e8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f975ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f975f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f975f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f975f8:	54000120	b.eq	0xfffff7f9761c  // b.none
   0x0000fffff7f975fc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97600:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97604:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97608:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9760c:	54000321	b.ne	0xfffff7f97670  // b.any
   0x0000fffff7f97610:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f97614:	9e620120	scvtf	d0, x9
   0x0000fffff7f97618:	14000002	b	0xfffff7f97620
   0x0000fffff7f9761c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f97620:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f97624:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97628:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9762c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97630:	54000120	b.eq	0xfffff7f97654  // b.none
   0x0000fffff7f97634:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f97638:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9763c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97640:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97644:	54000161	b.ne	0xfffff7f97670  // b.any
   0x0000fffff7f97648:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9764c:	9e620121	scvtf	d1, x9
   0x0000fffff7f97650:	14000002	b	0xfffff7f97658
   0x0000fffff7f97654:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f97658:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9765c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f97660:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97664:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97668:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9766c:	17ffffde	b	0xfffff7f975e4
   0x0000fffff7f97670:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97674:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97678:	aa1303e1	mov	x1, x19
   0x0000fffff7f9767c:	aa1503e2	mov	x2, x21
   0x0000fffff7f97680:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7f97684:	aa1403e4	mov	x4, x20
   0x0000fffff7f97688:	aa1603e5	mov	x5, x22
   0x0000fffff7f9768c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f97690:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97694:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97698:	d63f0200	blr	x16
   0x0000fffff7f9769c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f976a0:	5400bec0	b.eq	0xfffff7f98e78  // b.none
   0x0000fffff7f976a4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f976a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f976ac:	aa1303e1	mov	x1, x19
   0x0000fffff7f976b0:	aa1503e2	mov	x2, x21
   0x0000fffff7f976b4:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7f976b8:	aa1403e4	mov	x4, x20
   0x0000fffff7f976bc:	aa1603e5	mov	x5, x22
   0x0000fffff7f976c0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f976c4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f976c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f976cc:	d63f0200	blr	x16
   0x0000fffff7f976d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f976d4:	5400bd60	b.eq	0xfffff7f98e80  // b.none
   0x0000fffff7f976d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f976dc:	37d806a9	tbnz	w9, #27, 0xfffff7f977b0
   0x0000fffff7f976e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f976e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f976e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f976ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f976f0:	540001c1	b.ne	0xfffff7f97728  // b.any
   0x0000fffff7f976f4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f976f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f976fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97700:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97704:	54000121	b.ne	0xfffff7f97728  // b.any
   0x0000fffff7f97708:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9770c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f97710:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97714:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97718:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9771c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f97720:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f97724:	14000030	b	0xfffff7f977e4
   0x0000fffff7f97728:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9772c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97730:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97734:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97738:	54000120	b.eq	0xfffff7f9775c  // b.none
   0x0000fffff7f9773c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97740:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97744:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97748:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9774c:	54000321	b.ne	0xfffff7f977b0  // b.any
   0x0000fffff7f97750:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f97754:	9e620120	scvtf	d0, x9
   0x0000fffff7f97758:	14000002	b	0xfffff7f97760
   0x0000fffff7f9775c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f97760:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f97764:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97768:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9776c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97770:	54000120	b.eq	0xfffff7f97794  // b.none
   0x0000fffff7f97774:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f97778:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9777c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97780:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97784:	54000161	b.ne	0xfffff7f977b0  // b.any
   0x0000fffff7f97788:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9778c:	9e620121	scvtf	d1, x9
   0x0000fffff7f97790:	14000002	b	0xfffff7f97798
   0x0000fffff7f97794:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f97798:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9779c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f977a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f977a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f977a8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f977ac:	17ffffde	b	0xfffff7f97724
   0x0000fffff7f977b0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f977b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f977b8:	aa1303e1	mov	x1, x19
   0x0000fffff7f977bc:	aa1503e2	mov	x2, x21
   0x0000fffff7f977c0:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7f977c4:	aa1403e4	mov	x4, x20
   0x0000fffff7f977c8:	aa1603e5	mov	x5, x22
   0x0000fffff7f977cc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f977d0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f977d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f977d8:	d63f0200	blr	x16
   0x0000fffff7f977dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f977e0:	5400b540	b.eq	0xfffff7f98e88  // b.none
   0x0000fffff7f977e4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f977e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f977ec:	aa1303e1	mov	x1, x19
   0x0000fffff7f977f0:	aa1503e2	mov	x2, x21
   0x0000fffff7f977f4:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7f977f8:	aa1403e4	mov	x4, x20
   0x0000fffff7f977fc:	aa1603e5	mov	x5, x22
   0x0000fffff7f97800:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f97804:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97808:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9780c:	d63f0200	blr	x16
   0x0000fffff7f97810:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97814:	5400b3e0	b.eq	0xfffff7f98e90  // b.none
   0x0000fffff7f97818:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9781c:	37d806a9	tbnz	w9, #27, 0xfffff7f978f0
   0x0000fffff7f97820:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97824:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97828:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9782c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97830:	540001c1	b.ne	0xfffff7f97868  // b.any
   0x0000fffff7f97834:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f97838:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9783c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97840:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97844:	54000121	b.ne	0xfffff7f97868  // b.any
   0x0000fffff7f97848:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9784c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f97850:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97854:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97858:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9785c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f97860:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f97864:	14000030	b	0xfffff7f97924
   0x0000fffff7f97868:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9786c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97870:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97874:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97878:	54000120	b.eq	0xfffff7f9789c  // b.none
   0x0000fffff7f9787c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97880:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97884:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97888:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9788c:	54000321	b.ne	0xfffff7f978f0  // b.any
   0x0000fffff7f97890:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f97894:	9e620120	scvtf	d0, x9
   0x0000fffff7f97898:	14000002	b	0xfffff7f978a0
   0x0000fffff7f9789c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f978a0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f978a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f978a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f978ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f978b0:	54000120	b.eq	0xfffff7f978d4  // b.none
   0x0000fffff7f978b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f978b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f978bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f978c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f978c4:	54000161	b.ne	0xfffff7f978f0  // b.any
   0x0000fffff7f978c8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f978cc:	9e620121	scvtf	d1, x9
   0x0000fffff7f978d0:	14000002	b	0xfffff7f978d8
   0x0000fffff7f978d4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f978d8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f978dc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f978e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f978e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f978e8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f978ec:	17ffffde	b	0xfffff7f97864
   0x0000fffff7f978f0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f978f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f978f8:	aa1303e1	mov	x1, x19
   0x0000fffff7f978fc:	aa1503e2	mov	x2, x21
   0x0000fffff7f97900:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7f97904:	aa1403e4	mov	x4, x20
   0x0000fffff7f97908:	aa1603e5	mov	x5, x22
   0x0000fffff7f9790c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f97910:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97914:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97918:	d63f0200	blr	x16
   0x0000fffff7f9791c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97920:	5400abc0	b.eq	0xfffff7f98e98  // b.none
   0x0000fffff7f97924:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f97928:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9792c:	aa1303e1	mov	x1, x19
   0x0000fffff7f97930:	aa1503e2	mov	x2, x21
   0x0000fffff7f97934:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7f97938:	aa1403e4	mov	x4, x20
   0x0000fffff7f9793c:	aa1603e5	mov	x5, x22
   0x0000fffff7f97940:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f97944:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97948:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9794c:	d63f0200	blr	x16
   0x0000fffff7f97950:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97954:	5400aa60	b.eq	0xfffff7f98ea0  // b.none
   0x0000fffff7f97958:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9795c:	37d806a9	tbnz	w9, #27, 0xfffff7f97a30
   0x0000fffff7f97960:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97964:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97968:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9796c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97970:	540001c1	b.ne	0xfffff7f979a8  // b.any
   0x0000fffff7f97974:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f97978:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9797c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97980:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97984:	54000121	b.ne	0xfffff7f979a8  // b.any
   0x0000fffff7f97988:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9798c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f97990:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97994:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97998:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9799c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f979a0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f979a4:	14000030	b	0xfffff7f97a64
   0x0000fffff7f979a8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f979ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f979b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f979b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f979b8:	54000120	b.eq	0xfffff7f979dc  // b.none
   0x0000fffff7f979bc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f979c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f979c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f979c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f979cc:	54000321	b.ne	0xfffff7f97a30  // b.any
   0x0000fffff7f979d0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f979d4:	9e620120	scvtf	d0, x9
   0x0000fffff7f979d8:	14000002	b	0xfffff7f979e0
   0x0000fffff7f979dc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f979e0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f979e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f979e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f979ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f979f0:	54000120	b.eq	0xfffff7f97a14  // b.none
   0x0000fffff7f979f4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f979f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f979fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97a00:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97a04:	54000161	b.ne	0xfffff7f97a30  // b.any
   0x0000fffff7f97a08:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f97a0c:	9e620121	scvtf	d1, x9
   0x0000fffff7f97a10:	14000002	b	0xfffff7f97a18
   0x0000fffff7f97a14:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f97a18:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f97a1c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f97a20:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97a24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97a28:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f97a2c:	17ffffde	b	0xfffff7f979a4
   0x0000fffff7f97a30:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97a34:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97a38:	aa1303e1	mov	x1, x19
   0x0000fffff7f97a3c:	aa1503e2	mov	x2, x21
   0x0000fffff7f97a40:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7f97a44:	aa1403e4	mov	x4, x20
   0x0000fffff7f97a48:	aa1603e5	mov	x5, x22
   0x0000fffff7f97a4c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f97a50:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97a54:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97a58:	d63f0200	blr	x16
   0x0000fffff7f97a5c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97a60:	5400a240	b.eq	0xfffff7f98ea8  // b.none
   0x0000fffff7f97a64:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f97a68:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97a6c:	aa1303e1	mov	x1, x19
   0x0000fffff7f97a70:	aa1503e2	mov	x2, x21
   0x0000fffff7f97a74:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7f97a78:	aa1403e4	mov	x4, x20
   0x0000fffff7f97a7c:	aa1603e5	mov	x5, x22
   0x0000fffff7f97a80:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f97a84:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97a88:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97a8c:	d63f0200	blr	x16
   0x0000fffff7f97a90:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97a94:	5400a0e0	b.eq	0xfffff7f98eb0  // b.none
   0x0000fffff7f97a98:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97a9c:	37d806a9	tbnz	w9, #27, 0xfffff7f97b70
   0x0000fffff7f97aa0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97aa4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97aa8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97aac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97ab0:	540001c1	b.ne	0xfffff7f97ae8  // b.any
   0x0000fffff7f97ab4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f97ab8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97abc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97ac0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97ac4:	54000121	b.ne	0xfffff7f97ae8  // b.any
   0x0000fffff7f97ac8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f97acc:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f97ad0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97ad4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97ad8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97adc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f97ae0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f97ae4:	14000030	b	0xfffff7f97ba4
   0x0000fffff7f97ae8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97aec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97af0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97af4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97af8:	54000120	b.eq	0xfffff7f97b1c  // b.none
   0x0000fffff7f97afc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97b00:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97b04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97b08:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97b0c:	54000321	b.ne	0xfffff7f97b70  // b.any
   0x0000fffff7f97b10:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f97b14:	9e620120	scvtf	d0, x9
   0x0000fffff7f97b18:	14000002	b	0xfffff7f97b20
   0x0000fffff7f97b1c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f97b20:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f97b24:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97b28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97b2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97b30:	54000120	b.eq	0xfffff7f97b54  // b.none
   0x0000fffff7f97b34:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f97b38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97b3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97b40:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97b44:	54000161	b.ne	0xfffff7f97b70  // b.any
   0x0000fffff7f97b48:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f97b4c:	9e620121	scvtf	d1, x9
   0x0000fffff7f97b50:	14000002	b	0xfffff7f97b58
   0x0000fffff7f97b54:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f97b58:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f97b5c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f97b60:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97b64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97b68:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f97b6c:	17ffffde	b	0xfffff7f97ae4
   0x0000fffff7f97b70:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97b74:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97b78:	aa1303e1	mov	x1, x19
   0x0000fffff7f97b7c:	aa1503e2	mov	x2, x21
   0x0000fffff7f97b80:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7f97b84:	aa1403e4	mov	x4, x20
   0x0000fffff7f97b88:	aa1603e5	mov	x5, x22
   0x0000fffff7f97b8c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f97b90:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97b94:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97b98:	d63f0200	blr	x16
   0x0000fffff7f97b9c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97ba0:	540098c0	b.eq	0xfffff7f98eb8  // b.none
   0x0000fffff7f97ba4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f97ba8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97bac:	aa1303e1	mov	x1, x19
   0x0000fffff7f97bb0:	aa1503e2	mov	x2, x21
   0x0000fffff7f97bb4:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7f97bb8:	aa1403e4	mov	x4, x20
   0x0000fffff7f97bbc:	aa1603e5	mov	x5, x22
   0x0000fffff7f97bc0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f97bc4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97bc8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97bcc:	d63f0200	blr	x16
   0x0000fffff7f97bd0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97bd4:	54009760	b.eq	0xfffff7f98ec0  // b.none
   0x0000fffff7f97bd8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97bdc:	37d806a9	tbnz	w9, #27, 0xfffff7f97cb0
   0x0000fffff7f97be0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97be4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97be8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97bec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97bf0:	540001c1	b.ne	0xfffff7f97c28  // b.any
   0x0000fffff7f97bf4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f97bf8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97bfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97c00:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97c04:	54000121	b.ne	0xfffff7f97c28  // b.any
   0x0000fffff7f97c08:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f97c0c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f97c10:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97c14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97c18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97c1c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f97c20:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f97c24:	14000030	b	0xfffff7f97ce4
   0x0000fffff7f97c28:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97c2c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97c30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97c34:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97c38:	54000120	b.eq	0xfffff7f97c5c  // b.none
   0x0000fffff7f97c3c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97c40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97c44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97c48:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97c4c:	54000321	b.ne	0xfffff7f97cb0  // b.any
   0x0000fffff7f97c50:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f97c54:	9e620120	scvtf	d0, x9
   0x0000fffff7f97c58:	14000002	b	0xfffff7f97c60
   0x0000fffff7f97c5c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f97c60:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f97c64:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97c68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97c6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97c70:	54000120	b.eq	0xfffff7f97c94  // b.none
   0x0000fffff7f97c74:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f97c78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97c7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97c80:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97c84:	54000161	b.ne	0xfffff7f97cb0  // b.any
   0x0000fffff7f97c88:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f97c8c:	9e620121	scvtf	d1, x9
   0x0000fffff7f97c90:	14000002	b	0xfffff7f97c98
   0x0000fffff7f97c94:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f97c98:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f97c9c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f97ca0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97ca4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97ca8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f97cac:	17ffffde	b	0xfffff7f97c24
   0x0000fffff7f97cb0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97cb4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97cb8:	aa1303e1	mov	x1, x19
   0x0000fffff7f97cbc:	aa1503e2	mov	x2, x21
   0x0000fffff7f97cc0:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7f97cc4:	aa1403e4	mov	x4, x20
   0x0000fffff7f97cc8:	aa1603e5	mov	x5, x22
   0x0000fffff7f97ccc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f97cd0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97cd4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97cd8:	d63f0200	blr	x16
   0x0000fffff7f97cdc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97ce0:	54008f40	b.eq	0xfffff7f98ec8  // b.none
   0x0000fffff7f97ce4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f97ce8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97cec:	aa1303e1	mov	x1, x19
   0x0000fffff7f97cf0:	aa1503e2	mov	x2, x21
   0x0000fffff7f97cf4:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7f97cf8:	aa1403e4	mov	x4, x20
   0x0000fffff7f97cfc:	aa1603e5	mov	x5, x22
   0x0000fffff7f97d00:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f97d04:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97d08:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97d0c:	d63f0200	blr	x16
   0x0000fffff7f97d10:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97d14:	54008de0	b.eq	0xfffff7f98ed0  // b.none
   0x0000fffff7f97d18:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97d1c:	37d806a9	tbnz	w9, #27, 0xfffff7f97df0
   0x0000fffff7f97d20:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97d24:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97d28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97d2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97d30:	540001c1	b.ne	0xfffff7f97d68  // b.any
   0x0000fffff7f97d34:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f97d38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97d3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97d40:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97d44:	54000121	b.ne	0xfffff7f97d68  // b.any
   0x0000fffff7f97d48:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f97d4c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f97d50:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97d54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97d58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97d5c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f97d60:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f97d64:	14000030	b	0xfffff7f97e24
   0x0000fffff7f97d68:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97d6c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97d70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97d74:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97d78:	54000120	b.eq	0xfffff7f97d9c  // b.none
   0x0000fffff7f97d7c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97d80:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97d84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97d88:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97d8c:	54000321	b.ne	0xfffff7f97df0  // b.any
   0x0000fffff7f97d90:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f97d94:	9e620120	scvtf	d0, x9
   0x0000fffff7f97d98:	14000002	b	0xfffff7f97da0
   0x0000fffff7f97d9c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f97da0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f97da4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97da8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97dac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97db0:	54000120	b.eq	0xfffff7f97dd4  // b.none
   0x0000fffff7f97db4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f97db8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97dbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97dc0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97dc4:	54000161	b.ne	0xfffff7f97df0  // b.any
   0x0000fffff7f97dc8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f97dcc:	9e620121	scvtf	d1, x9
   0x0000fffff7f97dd0:	14000002	b	0xfffff7f97dd8
   0x0000fffff7f97dd4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f97dd8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f97ddc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f97de0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97de4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97de8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f97dec:	17ffffde	b	0xfffff7f97d64
   0x0000fffff7f97df0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97df4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97df8:	aa1303e1	mov	x1, x19
   0x0000fffff7f97dfc:	aa1503e2	mov	x2, x21
   0x0000fffff7f97e00:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7f97e04:	aa1403e4	mov	x4, x20
   0x0000fffff7f97e08:	aa1603e5	mov	x5, x22
   0x0000fffff7f97e0c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f97e10:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97e14:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97e18:	d63f0200	blr	x16
   0x0000fffff7f97e1c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97e20:	540085c0	b.eq	0xfffff7f98ed8  // b.none
   0x0000fffff7f97e24:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f97e28:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97e2c:	aa1303e1	mov	x1, x19
   0x0000fffff7f97e30:	aa1503e2	mov	x2, x21
   0x0000fffff7f97e34:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7f97e38:	aa1403e4	mov	x4, x20
   0x0000fffff7f97e3c:	aa1603e5	mov	x5, x22
   0x0000fffff7f97e40:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f97e44:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97e48:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97e4c:	d63f0200	blr	x16
   0x0000fffff7f97e50:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97e54:	54008460	b.eq	0xfffff7f98ee0  // b.none
   0x0000fffff7f97e58:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97e5c:	37d806a9	tbnz	w9, #27, 0xfffff7f97f30
   0x0000fffff7f97e60:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97e64:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97e68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97e6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97e70:	540001c1	b.ne	0xfffff7f97ea8  // b.any
   0x0000fffff7f97e74:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f97e78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97e7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97e80:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97e84:	54000121	b.ne	0xfffff7f97ea8  // b.any
   0x0000fffff7f97e88:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f97e8c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f97e90:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97e94:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97e98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97e9c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f97ea0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f97ea4:	14000030	b	0xfffff7f97f64
   0x0000fffff7f97ea8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97eac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97eb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97eb4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97eb8:	54000120	b.eq	0xfffff7f97edc  // b.none
   0x0000fffff7f97ebc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97ec0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97ec4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97ec8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97ecc:	54000321	b.ne	0xfffff7f97f30  // b.any
   0x0000fffff7f97ed0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f97ed4:	9e620120	scvtf	d0, x9
   0x0000fffff7f97ed8:	14000002	b	0xfffff7f97ee0
   0x0000fffff7f97edc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f97ee0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f97ee4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97ee8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97eec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97ef0:	54000120	b.eq	0xfffff7f97f14  // b.none
   0x0000fffff7f97ef4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f97ef8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97efc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97f00:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97f04:	54000161	b.ne	0xfffff7f97f30  // b.any
   0x0000fffff7f97f08:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f97f0c:	9e620121	scvtf	d1, x9
   0x0000fffff7f97f10:	14000002	b	0xfffff7f97f18
   0x0000fffff7f97f14:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f97f18:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f97f1c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f97f20:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97f24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97f28:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f97f2c:	17ffffde	b	0xfffff7f97ea4
   0x0000fffff7f97f30:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97f34:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97f38:	aa1303e1	mov	x1, x19
   0x0000fffff7f97f3c:	aa1503e2	mov	x2, x21
   0x0000fffff7f97f40:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7f97f44:	aa1403e4	mov	x4, x20
   0x0000fffff7f97f48:	aa1603e5	mov	x5, x22
   0x0000fffff7f97f4c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f97f50:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97f54:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97f58:	d63f0200	blr	x16
   0x0000fffff7f97f5c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97f60:	54007c40	b.eq	0xfffff7f98ee8  // b.none
   0x0000fffff7f97f64:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f97f68:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97f6c:	aa1303e1	mov	x1, x19
   0x0000fffff7f97f70:	aa1503e2	mov	x2, x21
   0x0000fffff7f97f74:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7f97f78:	aa1403e4	mov	x4, x20
   0x0000fffff7f97f7c:	aa1603e5	mov	x5, x22
   0x0000fffff7f97f80:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f97f84:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97f88:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97f8c:	d63f0200	blr	x16
   0x0000fffff7f97f90:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97f94:	54007ae0	b.eq	0xfffff7f98ef0  // b.none
   0x0000fffff7f97f98:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97f9c:	37d806a9	tbnz	w9, #27, 0xfffff7f98070
   0x0000fffff7f97fa0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97fa4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97fa8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97fac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97fb0:	540001c1	b.ne	0xfffff7f97fe8  // b.any
   0x0000fffff7f97fb4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f97fb8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97fbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97fc0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97fc4:	54000121	b.ne	0xfffff7f97fe8  // b.any
   0x0000fffff7f97fc8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f97fcc:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f97fd0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97fd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97fd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97fdc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f97fe0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f97fe4:	14000030	b	0xfffff7f980a4
   0x0000fffff7f97fe8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97fec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97ff0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97ff4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97ff8:	54000120	b.eq	0xfffff7f9801c  // b.none
   0x0000fffff7f97ffc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f98000:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98004:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98008:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9800c:	54000321	b.ne	0xfffff7f98070  // b.any
   0x0000fffff7f98010:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f98014:	9e620120	scvtf	d0, x9
   0x0000fffff7f98018:	14000002	b	0xfffff7f98020
   0x0000fffff7f9801c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f98020:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f98024:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98028:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9802c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98030:	54000120	b.eq	0xfffff7f98054  // b.none
   0x0000fffff7f98034:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f98038:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9803c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98040:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98044:	54000161	b.ne	0xfffff7f98070  // b.any
   0x0000fffff7f98048:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9804c:	9e620121	scvtf	d1, x9
   0x0000fffff7f98050:	14000002	b	0xfffff7f98058
   0x0000fffff7f98054:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f98058:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9805c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f98060:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98064:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98068:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9806c:	17ffffde	b	0xfffff7f97fe4
   0x0000fffff7f98070:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98074:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98078:	aa1303e1	mov	x1, x19
   0x0000fffff7f9807c:	aa1503e2	mov	x2, x21
   0x0000fffff7f98080:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7f98084:	aa1403e4	mov	x4, x20
   0x0000fffff7f98088:	aa1603e5	mov	x5, x22
   0x0000fffff7f9808c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f98090:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98094:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98098:	d63f0200	blr	x16
   0x0000fffff7f9809c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f980a0:	540072c0	b.eq	0xfffff7f98ef8  // b.none
   0x0000fffff7f980a4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f980a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f980ac:	aa1303e1	mov	x1, x19
   0x0000fffff7f980b0:	aa1503e2	mov	x2, x21
   0x0000fffff7f980b4:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7f980b8:	aa1403e4	mov	x4, x20
   0x0000fffff7f980bc:	aa1603e5	mov	x5, x22
   0x0000fffff7f980c0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f980c4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f980c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f980cc:	d63f0200	blr	x16
   0x0000fffff7f980d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f980d4:	54007160	b.eq	0xfffff7f98f00  // b.none
   0x0000fffff7f980d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f980dc:	37d806a9	tbnz	w9, #27, 0xfffff7f981b0
   0x0000fffff7f980e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f980e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f980e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f980ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f980f0:	540001c1	b.ne	0xfffff7f98128  // b.any
   0x0000fffff7f980f4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f980f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f980fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98100:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98104:	54000121	b.ne	0xfffff7f98128  // b.any
   0x0000fffff7f98108:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9810c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f98110:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f98114:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98118:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9811c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f98120:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f98124:	14000030	b	0xfffff7f981e4
   0x0000fffff7f98128:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9812c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98130:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98134:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98138:	54000120	b.eq	0xfffff7f9815c  // b.none
   0x0000fffff7f9813c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f98140:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98144:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98148:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9814c:	54000321	b.ne	0xfffff7f981b0  // b.any
   0x0000fffff7f98150:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f98154:	9e620120	scvtf	d0, x9
   0x0000fffff7f98158:	14000002	b	0xfffff7f98160
   0x0000fffff7f9815c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f98160:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f98164:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98168:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9816c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98170:	54000120	b.eq	0xfffff7f98194  // b.none
   0x0000fffff7f98174:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f98178:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9817c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98180:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98184:	54000161	b.ne	0xfffff7f981b0  // b.any
   0x0000fffff7f98188:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9818c:	9e620121	scvtf	d1, x9
   0x0000fffff7f98190:	14000002	b	0xfffff7f98198
   0x0000fffff7f98194:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f98198:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9819c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f981a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f981a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f981a8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f981ac:	17ffffde	b	0xfffff7f98124
   0x0000fffff7f981b0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f981b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f981b8:	aa1303e1	mov	x1, x19
   0x0000fffff7f981bc:	aa1503e2	mov	x2, x21
   0x0000fffff7f981c0:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7f981c4:	aa1403e4	mov	x4, x20
   0x0000fffff7f981c8:	aa1603e5	mov	x5, x22
   0x0000fffff7f981cc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f981d0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f981d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f981d8:	d63f0200	blr	x16
   0x0000fffff7f981dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f981e0:	54006940	b.eq	0xfffff7f98f08  // b.none
   0x0000fffff7f981e4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f981e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f981ec:	aa1303e1	mov	x1, x19
   0x0000fffff7f981f0:	aa1503e2	mov	x2, x21
   0x0000fffff7f981f4:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7f981f8:	aa1403e4	mov	x4, x20
   0x0000fffff7f981fc:	aa1603e5	mov	x5, x22
   0x0000fffff7f98200:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f98204:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98208:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9820c:	d63f0200	blr	x16
   0x0000fffff7f98210:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98214:	540067e0	b.eq	0xfffff7f98f10  // b.none
   0x0000fffff7f98218:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9821c:	37d806a9	tbnz	w9, #27, 0xfffff7f982f0
   0x0000fffff7f98220:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f98224:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98228:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9822c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98230:	540001c1	b.ne	0xfffff7f98268  // b.any
   0x0000fffff7f98234:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f98238:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9823c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98240:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98244:	54000121	b.ne	0xfffff7f98268  // b.any
   0x0000fffff7f98248:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9824c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f98250:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f98254:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98258:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9825c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f98260:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f98264:	14000030	b	0xfffff7f98324
   0x0000fffff7f98268:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9826c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98270:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98274:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98278:	54000120	b.eq	0xfffff7f9829c  // b.none
   0x0000fffff7f9827c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f98280:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98284:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98288:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9828c:	54000321	b.ne	0xfffff7f982f0  // b.any
   0x0000fffff7f98290:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f98294:	9e620120	scvtf	d0, x9
   0x0000fffff7f98298:	14000002	b	0xfffff7f982a0
   0x0000fffff7f9829c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f982a0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f982a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f982a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f982ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f982b0:	54000120	b.eq	0xfffff7f982d4  // b.none
   0x0000fffff7f982b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f982b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f982bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f982c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f982c4:	54000161	b.ne	0xfffff7f982f0  // b.any
   0x0000fffff7f982c8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f982cc:	9e620121	scvtf	d1, x9
   0x0000fffff7f982d0:	14000002	b	0xfffff7f982d8
   0x0000fffff7f982d4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f982d8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f982dc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f982e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f982e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f982e8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f982ec:	17ffffde	b	0xfffff7f98264
   0x0000fffff7f982f0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f982f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f982f8:	aa1303e1	mov	x1, x19
   0x0000fffff7f982fc:	aa1503e2	mov	x2, x21
   0x0000fffff7f98300:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7f98304:	aa1403e4	mov	x4, x20
   0x0000fffff7f98308:	aa1603e5	mov	x5, x22
   0x0000fffff7f9830c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f98310:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98314:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98318:	d63f0200	blr	x16
   0x0000fffff7f9831c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98320:	54005fc0	b.eq	0xfffff7f98f18  // b.none
   0x0000fffff7f98324:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f98328:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9832c:	aa1303e1	mov	x1, x19
   0x0000fffff7f98330:	aa1503e2	mov	x2, x21
   0x0000fffff7f98334:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7f98338:	aa1403e4	mov	x4, x20
   0x0000fffff7f9833c:	aa1603e5	mov	x5, x22
   0x0000fffff7f98340:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f98344:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98348:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9834c:	d63f0200	blr	x16
   0x0000fffff7f98350:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98354:	54005e60	b.eq	0xfffff7f98f20  // b.none
   0x0000fffff7f98358:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9835c:	37d806a9	tbnz	w9, #27, 0xfffff7f98430
   0x0000fffff7f98360:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f98364:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98368:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9836c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98370:	540001c1	b.ne	0xfffff7f983a8  // b.any
   0x0000fffff7f98374:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f98378:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9837c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98380:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98384:	54000121	b.ne	0xfffff7f983a8  // b.any
   0x0000fffff7f98388:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9838c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f98390:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f98394:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98398:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9839c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f983a0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f983a4:	14000030	b	0xfffff7f98464
   0x0000fffff7f983a8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f983ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f983b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f983b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f983b8:	54000120	b.eq	0xfffff7f983dc  // b.none
   0x0000fffff7f983bc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f983c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f983c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f983c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f983cc:	54000321	b.ne	0xfffff7f98430  // b.any
   0x0000fffff7f983d0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f983d4:	9e620120	scvtf	d0, x9
   0x0000fffff7f983d8:	14000002	b	0xfffff7f983e0
   0x0000fffff7f983dc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f983e0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f983e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f983e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f983ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f983f0:	54000120	b.eq	0xfffff7f98414  // b.none
   0x0000fffff7f983f4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f983f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f983fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98400:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98404:	54000161	b.ne	0xfffff7f98430  // b.any
   0x0000fffff7f98408:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9840c:	9e620121	scvtf	d1, x9
   0x0000fffff7f98410:	14000002	b	0xfffff7f98418
   0x0000fffff7f98414:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f98418:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9841c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f98420:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98424:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98428:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9842c:	17ffffde	b	0xfffff7f983a4
   0x0000fffff7f98430:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98434:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98438:	aa1303e1	mov	x1, x19
   0x0000fffff7f9843c:	aa1503e2	mov	x2, x21
   0x0000fffff7f98440:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7f98444:	aa1403e4	mov	x4, x20
   0x0000fffff7f98448:	aa1603e5	mov	x5, x22
   0x0000fffff7f9844c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f98450:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98454:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98458:	d63f0200	blr	x16
   0x0000fffff7f9845c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98460:	54005640	b.eq	0xfffff7f98f28  // b.none
   0x0000fffff7f98464:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f98468:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9846c:	aa1303e1	mov	x1, x19
   0x0000fffff7f98470:	aa1503e2	mov	x2, x21
   0x0000fffff7f98474:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7f98478:	aa1403e4	mov	x4, x20
   0x0000fffff7f9847c:	aa1603e5	mov	x5, x22
   0x0000fffff7f98480:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f98484:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98488:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9848c:	d63f0200	blr	x16
   0x0000fffff7f98490:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98494:	540054e0	b.eq	0xfffff7f98f30  // b.none
   0x0000fffff7f98498:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9849c:	37d806a9	tbnz	w9, #27, 0xfffff7f98570
   0x0000fffff7f984a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f984a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f984a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f984ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f984b0:	540001c1	b.ne	0xfffff7f984e8  // b.any
   0x0000fffff7f984b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f984b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f984bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f984c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f984c4:	54000121	b.ne	0xfffff7f984e8  // b.any
   0x0000fffff7f984c8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f984cc:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f984d0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f984d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f984d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f984dc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f984e0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f984e4:	14000030	b	0xfffff7f985a4
   0x0000fffff7f984e8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f984ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f984f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f984f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f984f8:	54000120	b.eq	0xfffff7f9851c  // b.none
   0x0000fffff7f984fc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f98500:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98504:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98508:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9850c:	54000321	b.ne	0xfffff7f98570  // b.any
   0x0000fffff7f98510:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f98514:	9e620120	scvtf	d0, x9
   0x0000fffff7f98518:	14000002	b	0xfffff7f98520
   0x0000fffff7f9851c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f98520:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f98524:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98528:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9852c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98530:	54000120	b.eq	0xfffff7f98554  // b.none
   0x0000fffff7f98534:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f98538:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9853c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98540:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98544:	54000161	b.ne	0xfffff7f98570  // b.any
   0x0000fffff7f98548:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9854c:	9e620121	scvtf	d1, x9
   0x0000fffff7f98550:	14000002	b	0xfffff7f98558
   0x0000fffff7f98554:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f98558:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9855c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f98560:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98564:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98568:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9856c:	17ffffde	b	0xfffff7f984e4
   0x0000fffff7f98570:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98574:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98578:	aa1303e1	mov	x1, x19
   0x0000fffff7f9857c:	aa1503e2	mov	x2, x21
   0x0000fffff7f98580:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7f98584:	aa1403e4	mov	x4, x20
   0x0000fffff7f98588:	aa1603e5	mov	x5, x22
   0x0000fffff7f9858c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f98590:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98594:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98598:	d63f0200	blr	x16
   0x0000fffff7f9859c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f985a0:	54004cc0	b.eq	0xfffff7f98f38  // b.none
   0x0000fffff7f985a4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f985a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f985ac:	aa1303e1	mov	x1, x19
   0x0000fffff7f985b0:	aa1503e2	mov	x2, x21
   0x0000fffff7f985b4:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7f985b8:	aa1403e4	mov	x4, x20
   0x0000fffff7f985bc:	aa1603e5	mov	x5, x22
   0x0000fffff7f985c0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f985c4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f985c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f985cc:	d63f0200	blr	x16
   0x0000fffff7f985d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f985d4:	54004b60	b.eq	0xfffff7f98f40  // b.none
   0x0000fffff7f985d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f985dc:	37d806a9	tbnz	w9, #27, 0xfffff7f986b0
   0x0000fffff7f985e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f985e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f985e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f985ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f985f0:	540001c1	b.ne	0xfffff7f98628  // b.any
   0x0000fffff7f985f4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f985f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f985fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98600:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98604:	54000121	b.ne	0xfffff7f98628  // b.any
   0x0000fffff7f98608:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9860c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f98610:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f98614:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98618:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9861c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f98620:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f98624:	14000030	b	0xfffff7f986e4
   0x0000fffff7f98628:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9862c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98630:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98634:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98638:	54000120	b.eq	0xfffff7f9865c  // b.none
   0x0000fffff7f9863c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f98640:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98644:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98648:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9864c:	54000321	b.ne	0xfffff7f986b0  // b.any
   0x0000fffff7f98650:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f98654:	9e620120	scvtf	d0, x9
   0x0000fffff7f98658:	14000002	b	0xfffff7f98660
   0x0000fffff7f9865c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f98660:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f98664:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98668:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9866c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98670:	54000120	b.eq	0xfffff7f98694  // b.none
   0x0000fffff7f98674:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f98678:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9867c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98680:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98684:	54000161	b.ne	0xfffff7f986b0  // b.any
   0x0000fffff7f98688:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9868c:	9e620121	scvtf	d1, x9
   0x0000fffff7f98690:	14000002	b	0xfffff7f98698
   0x0000fffff7f98694:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f98698:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9869c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f986a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f986a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f986a8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f986ac:	17ffffde	b	0xfffff7f98624
   0x0000fffff7f986b0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f986b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f986b8:	aa1303e1	mov	x1, x19
   0x0000fffff7f986bc:	aa1503e2	mov	x2, x21
   0x0000fffff7f986c0:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7f986c4:	aa1403e4	mov	x4, x20
   0x0000fffff7f986c8:	aa1603e5	mov	x5, x22
   0x0000fffff7f986cc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f986d0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f986d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f986d8:	d63f0200	blr	x16
   0x0000fffff7f986dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f986e0:	54004340	b.eq	0xfffff7f98f48  // b.none
   0x0000fffff7f986e4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f986e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f986ec:	aa1303e1	mov	x1, x19
   0x0000fffff7f986f0:	aa1503e2	mov	x2, x21
   0x0000fffff7f986f4:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7f986f8:	aa1403e4	mov	x4, x20
   0x0000fffff7f986fc:	aa1603e5	mov	x5, x22
   0x0000fffff7f98700:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f98704:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98708:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9870c:	d63f0200	blr	x16
   0x0000fffff7f98710:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98714:	540041e0	b.eq	0xfffff7f98f50  // b.none
   0x0000fffff7f98718:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9871c:	37d806a9	tbnz	w9, #27, 0xfffff7f987f0
   0x0000fffff7f98720:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f98724:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98728:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9872c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98730:	540001c1	b.ne	0xfffff7f98768  // b.any
   0x0000fffff7f98734:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f98738:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9873c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98740:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98744:	54000121	b.ne	0xfffff7f98768  // b.any
   0x0000fffff7f98748:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9874c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f98750:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f98754:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98758:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9875c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f98760:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f98764:	14000030	b	0xfffff7f98824
   0x0000fffff7f98768:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9876c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98770:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98774:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98778:	54000120	b.eq	0xfffff7f9879c  // b.none
   0x0000fffff7f9877c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f98780:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98784:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98788:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9878c:	54000321	b.ne	0xfffff7f987f0  // b.any
   0x0000fffff7f98790:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f98794:	9e620120	scvtf	d0, x9
   0x0000fffff7f98798:	14000002	b	0xfffff7f987a0
   0x0000fffff7f9879c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f987a0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f987a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f987a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f987ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f987b0:	54000120	b.eq	0xfffff7f987d4  // b.none
   0x0000fffff7f987b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f987b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f987bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f987c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f987c4:	54000161	b.ne	0xfffff7f987f0  // b.any
   0x0000fffff7f987c8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f987cc:	9e620121	scvtf	d1, x9
   0x0000fffff7f987d0:	14000002	b	0xfffff7f987d8
   0x0000fffff7f987d4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f987d8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f987dc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f987e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f987e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f987e8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f987ec:	17ffffde	b	0xfffff7f98764
   0x0000fffff7f987f0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f987f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f987f8:	aa1303e1	mov	x1, x19
   0x0000fffff7f987fc:	aa1503e2	mov	x2, x21
   0x0000fffff7f98800:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7f98804:	aa1403e4	mov	x4, x20
   0x0000fffff7f98808:	aa1603e5	mov	x5, x22
   0x0000fffff7f9880c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f98810:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98814:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98818:	d63f0200	blr	x16
   0x0000fffff7f9881c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98820:	540039c0	b.eq	0xfffff7f98f58  // b.none
   0x0000fffff7f98824:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f98828:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9882c:	aa1303e1	mov	x1, x19
   0x0000fffff7f98830:	aa1503e2	mov	x2, x21
   0x0000fffff7f98834:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7f98838:	aa1403e4	mov	x4, x20
   0x0000fffff7f9883c:	aa1603e5	mov	x5, x22
   0x0000fffff7f98840:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f98844:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98848:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9884c:	d63f0200	blr	x16
   0x0000fffff7f98850:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98854:	54003860	b.eq	0xfffff7f98f60  // b.none
   0x0000fffff7f98858:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9885c:	37d806a9	tbnz	w9, #27, 0xfffff7f98930
   0x0000fffff7f98860:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f98864:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98868:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9886c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98870:	540001c1	b.ne	0xfffff7f988a8  // b.any
   0x0000fffff7f98874:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f98878:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9887c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98880:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98884:	54000121	b.ne	0xfffff7f988a8  // b.any
   0x0000fffff7f98888:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9888c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f98890:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f98894:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98898:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9889c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f988a0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f988a4:	14000030	b	0xfffff7f98964
   0x0000fffff7f988a8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f988ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f988b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f988b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f988b8:	54000120	b.eq	0xfffff7f988dc  // b.none
   0x0000fffff7f988bc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f988c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f988c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f988c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f988cc:	54000321	b.ne	0xfffff7f98930  // b.any
   0x0000fffff7f988d0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f988d4:	9e620120	scvtf	d0, x9
   0x0000fffff7f988d8:	14000002	b	0xfffff7f988e0
   0x0000fffff7f988dc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f988e0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f988e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f988e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f988ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f988f0:	54000120	b.eq	0xfffff7f98914  // b.none
   0x0000fffff7f988f4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f988f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f988fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98900:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98904:	54000161	b.ne	0xfffff7f98930  // b.any
   0x0000fffff7f98908:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9890c:	9e620121	scvtf	d1, x9
   0x0000fffff7f98910:	14000002	b	0xfffff7f98918
   0x0000fffff7f98914:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f98918:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9891c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f98920:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98924:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98928:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9892c:	17ffffde	b	0xfffff7f988a4
   0x0000fffff7f98930:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98934:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98938:	aa1303e1	mov	x1, x19
   0x0000fffff7f9893c:	aa1503e2	mov	x2, x21
   0x0000fffff7f98940:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7f98944:	aa1403e4	mov	x4, x20
   0x0000fffff7f98948:	aa1603e5	mov	x5, x22
   0x0000fffff7f9894c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f98950:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98954:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98958:	d63f0200	blr	x16
   0x0000fffff7f9895c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98960:	54003040	b.eq	0xfffff7f98f68  // b.none
   0x0000fffff7f98964:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f98968:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9896c:	aa1303e1	mov	x1, x19
   0x0000fffff7f98970:	aa1503e2	mov	x2, x21
   0x0000fffff7f98974:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7f98978:	aa1403e4	mov	x4, x20
   0x0000fffff7f9897c:	aa1603e5	mov	x5, x22
   0x0000fffff7f98980:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f98984:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98988:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9898c:	d63f0200	blr	x16
   0x0000fffff7f98990:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98994:	54002ee0	b.eq	0xfffff7f98f70  // b.none
   0x0000fffff7f98998:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9899c:	37d806a9	tbnz	w9, #27, 0xfffff7f98a70
   0x0000fffff7f989a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f989a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f989a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f989ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f989b0:	540001c1	b.ne	0xfffff7f989e8  // b.any
   0x0000fffff7f989b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f989b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f989bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f989c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f989c4:	54000121	b.ne	0xfffff7f989e8  // b.any
   0x0000fffff7f989c8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f989cc:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f989d0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f989d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f989d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f989dc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f989e0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f989e4:	14000030	b	0xfffff7f98aa4
   0x0000fffff7f989e8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f989ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f989f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f989f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f989f8:	54000120	b.eq	0xfffff7f98a1c  // b.none
   0x0000fffff7f989fc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f98a00:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98a04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98a08:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98a0c:	54000321	b.ne	0xfffff7f98a70  // b.any
   0x0000fffff7f98a10:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f98a14:	9e620120	scvtf	d0, x9
   0x0000fffff7f98a18:	14000002	b	0xfffff7f98a20
   0x0000fffff7f98a1c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f98a20:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f98a24:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98a28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98a2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98a30:	54000120	b.eq	0xfffff7f98a54  // b.none
   0x0000fffff7f98a34:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f98a38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98a3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98a40:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98a44:	54000161	b.ne	0xfffff7f98a70  // b.any
   0x0000fffff7f98a48:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f98a4c:	9e620121	scvtf	d1, x9
   0x0000fffff7f98a50:	14000002	b	0xfffff7f98a58
   0x0000fffff7f98a54:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f98a58:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f98a5c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f98a60:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98a64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98a68:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f98a6c:	17ffffde	b	0xfffff7f989e4
   0x0000fffff7f98a70:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98a74:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98a78:	aa1303e1	mov	x1, x19
   0x0000fffff7f98a7c:	aa1503e2	mov	x2, x21
   0x0000fffff7f98a80:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7f98a84:	aa1403e4	mov	x4, x20
   0x0000fffff7f98a88:	aa1603e5	mov	x5, x22
   0x0000fffff7f98a8c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f98a90:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98a94:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98a98:	d63f0200	blr	x16
   0x0000fffff7f98a9c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98aa0:	540026c0	b.eq	0xfffff7f98f78  // b.none
   0x0000fffff7f98aa4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f98aa8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98aac:	aa1303e1	mov	x1, x19
   0x0000fffff7f98ab0:	aa1503e2	mov	x2, x21
   0x0000fffff7f98ab4:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7f98ab8:	aa1403e4	mov	x4, x20
   0x0000fffff7f98abc:	aa1603e5	mov	x5, x22
   0x0000fffff7f98ac0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f98ac4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98ac8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98acc:	d63f0200	blr	x16
   0x0000fffff7f98ad0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98ad4:	54002560	b.eq	0xfffff7f98f80  // b.none
   0x0000fffff7f98ad8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f98adc:	37d806a9	tbnz	w9, #27, 0xfffff7f98bb0
   0x0000fffff7f98ae0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f98ae4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98ae8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98aec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98af0:	540001c1	b.ne	0xfffff7f98b28  // b.any
   0x0000fffff7f98af4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f98af8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98afc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98b00:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98b04:	54000121	b.ne	0xfffff7f98b28  // b.any
   0x0000fffff7f98b08:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f98b0c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f98b10:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f98b14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98b18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98b1c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f98b20:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f98b24:	14000030	b	0xfffff7f98be4
   0x0000fffff7f98b28:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f98b2c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98b30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98b34:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98b38:	54000120	b.eq	0xfffff7f98b5c  // b.none
   0x0000fffff7f98b3c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f98b40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98b44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98b48:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98b4c:	54000321	b.ne	0xfffff7f98bb0  // b.any
   0x0000fffff7f98b50:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f98b54:	9e620120	scvtf	d0, x9
   0x0000fffff7f98b58:	14000002	b	0xfffff7f98b60
   0x0000fffff7f98b5c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f98b60:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f98b64:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98b68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98b6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98b70:	54000120	b.eq	0xfffff7f98b94  // b.none
   0x0000fffff7f98b74:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f98b78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98b7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98b80:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98b84:	54000161	b.ne	0xfffff7f98bb0  // b.any
   0x0000fffff7f98b88:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f98b8c:	9e620121	scvtf	d1, x9
   0x0000fffff7f98b90:	14000002	b	0xfffff7f98b98
   0x0000fffff7f98b94:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f98b98:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f98b9c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f98ba0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98ba4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98ba8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f98bac:	17ffffde	b	0xfffff7f98b24
   0x0000fffff7f98bb0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98bb4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98bb8:	aa1303e1	mov	x1, x19
   0x0000fffff7f98bbc:	aa1503e2	mov	x2, x21
   0x0000fffff7f98bc0:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7f98bc4:	aa1403e4	mov	x4, x20
   0x0000fffff7f98bc8:	aa1603e5	mov	x5, x22
   0x0000fffff7f98bcc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f98bd0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98bd4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98bd8:	d63f0200	blr	x16
   0x0000fffff7f98bdc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98be0:	54001d40	b.eq	0xfffff7f98f88  // b.none
   0x0000fffff7f98be4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f98be8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98bec:	aa1303e1	mov	x1, x19
   0x0000fffff7f98bf0:	aa1503e2	mov	x2, x21
   0x0000fffff7f98bf4:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7f98bf8:	aa1403e4	mov	x4, x20
   0x0000fffff7f98bfc:	aa1603e5	mov	x5, x22
   0x0000fffff7f98c00:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f98c04:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98c08:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98c0c:	d63f0200	blr	x16
   0x0000fffff7f98c10:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98c14:	54001be0	b.eq	0xfffff7f98f90  // b.none
   0x0000fffff7f98c18:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f98c1c:	37d806a9	tbnz	w9, #27, 0xfffff7f98cf0
   0x0000fffff7f98c20:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f98c24:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98c28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98c2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98c30:	540001c1	b.ne	0xfffff7f98c68  // b.any
   0x0000fffff7f98c34:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f98c38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98c3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98c40:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98c44:	54000121	b.ne	0xfffff7f98c68  // b.any
   0x0000fffff7f98c48:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f98c4c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f98c50:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f98c54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98c58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98c5c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f98c60:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f98c64:	14000030	b	0xfffff7f98d24
   0x0000fffff7f98c68:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f98c6c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98c70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98c74:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98c78:	54000120	b.eq	0xfffff7f98c9c  // b.none
   0x0000fffff7f98c7c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f98c80:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98c84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98c88:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98c8c:	54000321	b.ne	0xfffff7f98cf0  // b.any
   0x0000fffff7f98c90:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f98c94:	9e620120	scvtf	d0, x9
   0x0000fffff7f98c98:	14000002	b	0xfffff7f98ca0
   0x0000fffff7f98c9c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f98ca0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f98ca4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98ca8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98cac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98cb0:	54000120	b.eq	0xfffff7f98cd4  // b.none
   0x0000fffff7f98cb4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f98cb8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98cbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98cc0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98cc4:	54000161	b.ne	0xfffff7f98cf0  // b.any
   0x0000fffff7f98cc8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f98ccc:	9e620121	scvtf	d1, x9
   0x0000fffff7f98cd0:	14000002	b	0xfffff7f98cd8
   0x0000fffff7f98cd4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f98cd8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f98cdc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f98ce0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98ce4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98ce8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f98cec:	17ffffde	b	0xfffff7f98c64
   0x0000fffff7f98cf0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98cf4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98cf8:	aa1303e1	mov	x1, x19
   0x0000fffff7f98cfc:	aa1503e2	mov	x2, x21
   0x0000fffff7f98d00:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7f98d04:	aa1403e4	mov	x4, x20
   0x0000fffff7f98d08:	aa1603e5	mov	x5, x22
   0x0000fffff7f98d0c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f98d10:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98d14:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98d18:	d63f0200	blr	x16
   0x0000fffff7f98d1c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98d20:	540013c0	b.eq	0xfffff7f98f98  // b.none
   0x0000fffff7f98d24:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f98d28:	37d80269	tbnz	w9, #27, 0xfffff7f98d74
   0x0000fffff7f98d2c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f98d30:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98d34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98d38:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98d3c:	540001c1	b.ne	0xfffff7f98d74  // b.any
   0x0000fffff7f98d40:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f98d44:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7f98d48:	8b0a012b	add	x11, x9, x10
   0x0000fffff7f98d4c:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f98d50:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98d54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98d58:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f98d5c:	aa0b03e9	mov	x9, x11
   0x0000fffff7f98d60:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98d64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98d68:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f98d6c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f98d70:	1400000e	b	0xfffff7f98da8
   0x0000fffff7f98d74:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98d78:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98d7c:	aa1303e1	mov	x1, x19
   0x0000fffff7f98d80:	aa1503e2	mov	x2, x21
   0x0000fffff7f98d84:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7f98d88:	aa1403e4	mov	x4, x20
   0x0000fffff7f98d8c:	aa1603e5	mov	x5, x22
   0x0000fffff7f98d90:	d2916810	mov	x16, #0x8b40                	// #35648
   0x0000fffff7f98d94:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98d98:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98d9c:	d63f0200	blr	x16
   0x0000fffff7f98da0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98da4:	54000fe0	b.eq	0xfffff7f98fa0  // b.none
   0x0000fffff7f98da8:	17fff8d6	b	0xfffff7f97100
   0x0000fffff7f98dac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98db0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98db4:	aa1303e1	mov	x1, x19
   0x0000fffff7f98db8:	aa1503e2	mov	x2, x21
   0x0000fffff7f98dbc:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7f98dc0:	aa1403e4	mov	x4, x20
   0x0000fffff7f98dc4:	aa1603e5	mov	x5, x22
   0x0000fffff7f98dc8:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7f98dcc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98dd0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98dd4:	d63f0200	blr	x16
   0x0000fffff7f98dd8:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f98ddc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f98de0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f98de4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f98de8:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f98dec:	d65f03c0	ret
   0x0000fffff7f98df0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98df4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98df8:	b900028a	str	w10, [x20]
   0x0000fffff7f98dfc:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f98e00:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f98e04:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f98e08:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f98e0c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f98e10:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f98e14:	d65f03c0	ret
   0x0000fffff7f98e18:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f98e1c:	17fffff5	b	0xfffff7f98df0
   0x0000fffff7f98e20:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f98e24:	17fffff3	b	0xfffff7f98df0
   0x0000fffff7f98e28:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f98e2c:	17fffff1	b	0xfffff7f98df0
   0x0000fffff7f98e30:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f98e34:	17ffffef	b	0xfffff7f98df0
   0x0000fffff7f98e38:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f98e3c:	17ffffed	b	0xfffff7f98df0
   0x0000fffff7f98e40:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f98e44:	17ffffeb	b	0xfffff7f98df0
   0x0000fffff7f98e48:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f98e4c:	17ffffe9	b	0xfffff7f98df0
   0x0000fffff7f98e50:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f98e54:	17ffffe7	b	0xfffff7f98df0
   0x0000fffff7f98e58:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f98e5c:	17ffffe5	b	0xfffff7f98df0
   0x0000fffff7f98e60:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f98e64:	17ffffe3	b	0xfffff7f98df0
   0x0000fffff7f98e68:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7f98e6c:	17ffffe1	b	0xfffff7f98df0
   0x0000fffff7f98e70:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7f98e74:	17ffffdf	b	0xfffff7f98df0
   0x0000fffff7f98e78:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7f98e7c:	17ffffdd	b	0xfffff7f98df0
   0x0000fffff7f98e80:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7f98e84:	17ffffdb	b	0xfffff7f98df0
   0x0000fffff7f98e88:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7f98e8c:	17ffffd9	b	0xfffff7f98df0
   0x0000fffff7f98e90:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7f98e94:	17ffffd7	b	0xfffff7f98df0
   0x0000fffff7f98e98:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7f98e9c:	17ffffd5	b	0xfffff7f98df0
   0x0000fffff7f98ea0:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7f98ea4:	17ffffd3	b	0xfffff7f98df0
   0x0000fffff7f98ea8:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7f98eac:	17ffffd1	b	0xfffff7f98df0
   0x0000fffff7f98eb0:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7f98eb4:	17ffffcf	b	0xfffff7f98df0
   0x0000fffff7f98eb8:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7f98ebc:	17ffffcd	b	0xfffff7f98df0
   0x0000fffff7f98ec0:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7f98ec4:	17ffffcb	b	0xfffff7f98df0
   0x0000fffff7f98ec8:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7f98ecc:	17ffffc9	b	0xfffff7f98df0
   0x0000fffff7f98ed0:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7f98ed4:	17ffffc7	b	0xfffff7f98df0
   0x0000fffff7f98ed8:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7f98edc:	17ffffc5	b	0xfffff7f98df0
   0x0000fffff7f98ee0:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7f98ee4:	17ffffc3	b	0xfffff7f98df0
   0x0000fffff7f98ee8:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7f98eec:	17ffffc1	b	0xfffff7f98df0
   0x0000fffff7f98ef0:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7f98ef4:	17ffffbf	b	0xfffff7f98df0
   0x0000fffff7f98ef8:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7f98efc:	17ffffbd	b	0xfffff7f98df0
   0x0000fffff7f98f00:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7f98f04:	17ffffbb	b	0xfffff7f98df0
   0x0000fffff7f98f08:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7f98f0c:	17ffffb9	b	0xfffff7f98df0
   0x0000fffff7f98f10:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7f98f14:	17ffffb7	b	0xfffff7f98df0
   0x0000fffff7f98f18:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7f98f1c:	17ffffb5	b	0xfffff7f98df0
   0x0000fffff7f98f20:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7f98f24:	17ffffb3	b	0xfffff7f98df0
   0x0000fffff7f98f28:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7f98f2c:	17ffffb1	b	0xfffff7f98df0
   0x0000fffff7f98f30:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7f98f34:	17ffffaf	b	0xfffff7f98df0
   0x0000fffff7f98f38:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7f98f3c:	17ffffad	b	0xfffff7f98df0
   0x0000fffff7f98f40:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7f98f44:	17ffffab	b	0xfffff7f98df0
   0x0000fffff7f98f48:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7f98f4c:	17ffffa9	b	0xfffff7f98df0
   0x0000fffff7f98f50:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7f98f54:	17ffffa7	b	0xfffff7f98df0
   0x0000fffff7f98f58:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7f98f5c:	17ffffa5	b	0xfffff7f98df0
   0x0000fffff7f98f60:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7f98f64:	17ffffa3	b	0xfffff7f98df0
   0x0000fffff7f98f68:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7f98f6c:	17ffffa1	b	0xfffff7f98df0
   0x0000fffff7f98f70:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7f98f74:	17ffff9f	b	0xfffff7f98df0
   0x0000fffff7f98f78:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7f98f7c:	17ffff9d	b	0xfffff7f98df0
   0x0000fffff7f98f80:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7f98f84:	17ffff9b	b	0xfffff7f98df0
   0x0000fffff7f98f88:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7f98f8c:	17ffff99	b	0xfffff7f98df0
   0x0000fffff7f98f90:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7f98f94:	17ffff97	b	0xfffff7f98df0
   0x0000fffff7f98f98:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7f98f9c:	17ffff95	b	0xfffff7f98df0
   0x0000fffff7f98fa0:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7f98fa4:	17ffff93	b	0xfffff7f98df0
   0x0000fffff7f98fa8:	00000000	udf	#0
   0x0000fffff7f98fac:	00000000	udf	#0
   0x0000fffff7f98fb0:	00000000	udf	#0
   0x0000fffff7f98fb4:	00000000	udf	#0
   0x0000fffff7f98fb8:	00000000	udf	#0
   0x0000fffff7f98fbc:	00000000	udf	#0
   0x0000fffff7f98fc0:	00000000	udf	#0
   0x0000fffff7f98fc4:	00000000	udf	#0
   0x0000fffff7f98fc8:	00000000	udf	#0
   0x0000fffff7f98fcc:	00000000	udf	#0
   0x0000fffff7f98fd0:	00000000	udf	#0
   0x0000fffff7f98fd4:	00000000	udf	#0
   0x0000fffff7f98fd8:	00000000	udf	#0
   0x0000fffff7f98fdc:	00000000	udf	#0
   0x0000fffff7f98fe0:	00000000	udf	#0
   0x0000fffff7f98fe4:	00000000	udf	#0
   0x0000fffff7f98fe8:	00000000	udf	#0
   0x0000fffff7f98fec:	00000000	udf	#0
   0x0000fffff7f98ff0:	00000000	udf	#0
   0x0000fffff7f98ff4:	00000000	udf	#0
   0x0000fffff7f98ff8:	00000000	udf	#0
   0x0000fffff7f98ffc:	00000000	udf	#0
End of assembler dump.
