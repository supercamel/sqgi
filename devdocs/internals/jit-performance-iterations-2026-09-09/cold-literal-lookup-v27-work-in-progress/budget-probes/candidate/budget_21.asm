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
   0x0000fffff7f97058:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9705c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97060:	aa1303e1	mov	x1, x19
   0x0000fffff7f97064:	aa1503e2	mov	x2, x21
   0x0000fffff7f97068:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7f9706c:	aa1403e4	mov	x4, x20
   0x0000fffff7f97070:	aa1603e5	mov	x5, x22
   0x0000fffff7f97074:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7f97078:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9707c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97080:	d63f0200	blr	x16
   0x0000fffff7f97084:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97088:	5400c760	b.eq	0xfffff7f98974  // b.none
   0x0000fffff7f9708c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97090:	37d800e9	tbnz	w9, #27, 0xfffff7f970ac
   0x0000fffff7f97094:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f97098:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9709c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f970a0:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f970a4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f970a8:	1400000e	b	0xfffff7f970e0
   0x0000fffff7f970ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f970b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f970b4:	aa1303e1	mov	x1, x19
   0x0000fffff7f970b8:	aa1503e2	mov	x2, x21
   0x0000fffff7f970bc:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7f970c0:	aa1403e4	mov	x4, x20
   0x0000fffff7f970c4:	aa1603e5	mov	x5, x22
   0x0000fffff7f970c8:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7f970cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f970d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f970d4:	d63f0200	blr	x16
   0x0000fffff7f970d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f970dc:	5400c500	b.eq	0xfffff7f9897c  // b.none
   0x0000fffff7f970e0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f970e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f970e8:	aa1303e1	mov	x1, x19
   0x0000fffff7f970ec:	aa1503e2	mov	x2, x21
   0x0000fffff7f970f0:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f970f4:	aa1403e4	mov	x4, x20
   0x0000fffff7f970f8:	aa1603e5	mov	x5, x22
   0x0000fffff7f970fc:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7f97100:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97104:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97108:	d63f0200	blr	x16
   0x0000fffff7f9710c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97110:	5400c3a0	b.eq	0xfffff7f98984  // b.none
   0x0000fffff7f97114:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97118:	37d800e9	tbnz	w9, #27, 0xfffff7f97134
   0x0000fffff7f9711c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f97120:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97124:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97128:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9712c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f97130:	1400000e	b	0xfffff7f97168
   0x0000fffff7f97134:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97138:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9713c:	aa1303e1	mov	x1, x19
   0x0000fffff7f97140:	aa1503e2	mov	x2, x21
   0x0000fffff7f97144:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7f97148:	aa1403e4	mov	x4, x20
   0x0000fffff7f9714c:	aa1603e5	mov	x5, x22
   0x0000fffff7f97150:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7f97154:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97158:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9715c:	d63f0200	blr	x16
   0x0000fffff7f97160:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97164:	5400c140	b.eq	0xfffff7f9898c  // b.none
   0x0000fffff7f97168:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9716c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97170:	aa1303e1	mov	x1, x19
   0x0000fffff7f97174:	aa1503e2	mov	x2, x21
   0x0000fffff7f97178:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7f9717c:	aa1403e4	mov	x4, x20
   0x0000fffff7f97180:	aa1603e5	mov	x5, x22
   0x0000fffff7f97184:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f97188:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9718c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97190:	d63f0200	blr	x16
   0x0000fffff7f97194:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97198:	5400bfe0	b.eq	0xfffff7f98994  // b.none
   0x0000fffff7f9719c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f971a0:	37d80269	tbnz	w9, #27, 0xfffff7f971ec
   0x0000fffff7f971a4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f971a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f971ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f971b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f971b4:	540001c1	b.ne	0xfffff7f971ec  // b.any
   0x0000fffff7f971b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f971bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f971c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f971c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f971c8:	54000121	b.ne	0xfffff7f971ec  // b.any
   0x0000fffff7f971cc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f971d0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f971d4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f971d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f971dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f971e0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f971e4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f971e8:	1400000e	b	0xfffff7f97220
   0x0000fffff7f971ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f971f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f971f4:	aa1303e1	mov	x1, x19
   0x0000fffff7f971f8:	aa1503e2	mov	x2, x21
   0x0000fffff7f971fc:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f97200:	aa1403e4	mov	x4, x20
   0x0000fffff7f97204:	aa1603e5	mov	x5, x22
   0x0000fffff7f97208:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7f9720c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97210:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97214:	d63f0200	blr	x16
   0x0000fffff7f97218:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9721c:	5400bc00	b.eq	0xfffff7f9899c  // b.none
   0x0000fffff7f97220:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97224:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97228:	aa1303e1	mov	x1, x19
   0x0000fffff7f9722c:	aa1503e2	mov	x2, x21
   0x0000fffff7f97230:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f97234:	aa1403e4	mov	x4, x20
   0x0000fffff7f97238:	aa1603e5	mov	x5, x22
   0x0000fffff7f9723c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7f97240:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97244:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97248:	d63f0200	blr	x16
   0x0000fffff7f9724c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97250:	5400baa0	b.eq	0xfffff7f989a4  // b.none
   0x0000fffff7f97254:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f97258:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9725c:	aa1303e1	mov	x1, x19
   0x0000fffff7f97260:	aa1503e2	mov	x2, x21
   0x0000fffff7f97264:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f97268:	aa1403e4	mov	x4, x20
   0x0000fffff7f9726c:	aa1603e5	mov	x5, x22
   0x0000fffff7f97270:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7f97274:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97278:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9727c:	d63f0200	blr	x16
   0x0000fffff7f97280:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97284:	5400b940	b.eq	0xfffff7f989ac  // b.none
   0x0000fffff7f97288:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9728c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97290:	aa1303e1	mov	x1, x19
   0x0000fffff7f97294:	aa1503e2	mov	x2, x21
   0x0000fffff7f97298:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f9729c:	aa1403e4	mov	x4, x20
   0x0000fffff7f972a0:	aa1603e5	mov	x5, x22
   0x0000fffff7f972a4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f972a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f972ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f972b0:	d63f0200	blr	x16
   0x0000fffff7f972b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f972b8:	5400b7e0	b.eq	0xfffff7f989b4  // b.none
   0x0000fffff7f972bc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f972c0:	37d80269	tbnz	w9, #27, 0xfffff7f9730c
   0x0000fffff7f972c4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f972c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f972cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f972d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f972d4:	540001c1	b.ne	0xfffff7f9730c  // b.any
   0x0000fffff7f972d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f972dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f972e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f972e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f972e8:	54000121	b.ne	0xfffff7f9730c  // b.any
   0x0000fffff7f972ec:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f972f0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f972f4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f972f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f972fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97300:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f97304:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f97308:	1400000e	b	0xfffff7f97340
   0x0000fffff7f9730c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97310:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97314:	aa1303e1	mov	x1, x19
   0x0000fffff7f97318:	aa1503e2	mov	x2, x21
   0x0000fffff7f9731c:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f97320:	aa1403e4	mov	x4, x20
   0x0000fffff7f97324:	aa1603e5	mov	x5, x22
   0x0000fffff7f97328:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7f9732c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97330:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97334:	d63f0200	blr	x16
   0x0000fffff7f97338:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9733c:	5400b400	b.eq	0xfffff7f989bc  // b.none
   0x0000fffff7f97340:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97344:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97348:	aa1303e1	mov	x1, x19
   0x0000fffff7f9734c:	aa1503e2	mov	x2, x21
   0x0000fffff7f97350:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f97354:	aa1403e4	mov	x4, x20
   0x0000fffff7f97358:	aa1603e5	mov	x5, x22
   0x0000fffff7f9735c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7f97360:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97364:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97368:	d63f0200	blr	x16
   0x0000fffff7f9736c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97370:	5400b2a0	b.eq	0xfffff7f989c4  // b.none
   0x0000fffff7f97374:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f97378:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9737c:	aa1303e1	mov	x1, x19
   0x0000fffff7f97380:	aa1503e2	mov	x2, x21
   0x0000fffff7f97384:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7f97388:	aa1403e4	mov	x4, x20
   0x0000fffff7f9738c:	aa1603e5	mov	x5, x22
   0x0000fffff7f97390:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7f97394:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97398:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9739c:	d63f0200	blr	x16
   0x0000fffff7f973a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f973a4:	5400b140	b.eq	0xfffff7f989cc  // b.none
   0x0000fffff7f973a8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f973ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f973b0:	aa1303e1	mov	x1, x19
   0x0000fffff7f973b4:	aa1503e2	mov	x2, x21
   0x0000fffff7f973b8:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7f973bc:	aa1403e4	mov	x4, x20
   0x0000fffff7f973c0:	aa1603e5	mov	x5, x22
   0x0000fffff7f973c4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f973c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f973cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f973d0:	d63f0200	blr	x16
   0x0000fffff7f973d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f973d8:	5400afe0	b.eq	0xfffff7f989d4  // b.none
   0x0000fffff7f973dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f973e0:	37d80269	tbnz	w9, #27, 0xfffff7f9742c
   0x0000fffff7f973e4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f973e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f973ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f973f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f973f4:	540001c1	b.ne	0xfffff7f9742c  // b.any
   0x0000fffff7f973f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f973fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97400:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97404:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97408:	54000121	b.ne	0xfffff7f9742c  // b.any
   0x0000fffff7f9740c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f97410:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f97414:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97418:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9741c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97420:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f97424:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f97428:	1400000e	b	0xfffff7f97460
   0x0000fffff7f9742c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97430:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97434:	aa1303e1	mov	x1, x19
   0x0000fffff7f97438:	aa1503e2	mov	x2, x21
   0x0000fffff7f9743c:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7f97440:	aa1403e4	mov	x4, x20
   0x0000fffff7f97444:	aa1603e5	mov	x5, x22
   0x0000fffff7f97448:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7f9744c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97450:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97454:	d63f0200	blr	x16
   0x0000fffff7f97458:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9745c:	5400ac00	b.eq	0xfffff7f989dc  // b.none
   0x0000fffff7f97460:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97464:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97468:	aa1303e1	mov	x1, x19
   0x0000fffff7f9746c:	aa1503e2	mov	x2, x21
   0x0000fffff7f97470:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7f97474:	aa1403e4	mov	x4, x20
   0x0000fffff7f97478:	aa1603e5	mov	x5, x22
   0x0000fffff7f9747c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7f97480:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97484:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97488:	d63f0200	blr	x16
   0x0000fffff7f9748c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97490:	5400aaa0	b.eq	0xfffff7f989e4  // b.none
   0x0000fffff7f97494:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f97498:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9749c:	aa1303e1	mov	x1, x19
   0x0000fffff7f974a0:	aa1503e2	mov	x2, x21
   0x0000fffff7f974a4:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7f974a8:	aa1403e4	mov	x4, x20
   0x0000fffff7f974ac:	aa1603e5	mov	x5, x22
   0x0000fffff7f974b0:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7f974b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f974b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f974bc:	d63f0200	blr	x16
   0x0000fffff7f974c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f974c4:	5400a940	b.eq	0xfffff7f989ec  // b.none
   0x0000fffff7f974c8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f974cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f974d0:	aa1303e1	mov	x1, x19
   0x0000fffff7f974d4:	aa1503e2	mov	x2, x21
   0x0000fffff7f974d8:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7f974dc:	aa1403e4	mov	x4, x20
   0x0000fffff7f974e0:	aa1603e5	mov	x5, x22
   0x0000fffff7f974e4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f974e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f974ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f974f0:	d63f0200	blr	x16
   0x0000fffff7f974f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f974f8:	5400a7e0	b.eq	0xfffff7f989f4  // b.none
   0x0000fffff7f974fc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97500:	37d80269	tbnz	w9, #27, 0xfffff7f9754c
   0x0000fffff7f97504:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97508:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9750c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97510:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97514:	540001c1	b.ne	0xfffff7f9754c  // b.any
   0x0000fffff7f97518:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9751c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97520:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97524:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97528:	54000121	b.ne	0xfffff7f9754c  // b.any
   0x0000fffff7f9752c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f97530:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f97534:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97538:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9753c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97540:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f97544:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f97548:	1400000e	b	0xfffff7f97580
   0x0000fffff7f9754c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97550:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97554:	aa1303e1	mov	x1, x19
   0x0000fffff7f97558:	aa1503e2	mov	x2, x21
   0x0000fffff7f9755c:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7f97560:	aa1403e4	mov	x4, x20
   0x0000fffff7f97564:	aa1603e5	mov	x5, x22
   0x0000fffff7f97568:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7f9756c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97570:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97574:	d63f0200	blr	x16
   0x0000fffff7f97578:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9757c:	5400a400	b.eq	0xfffff7f989fc  // b.none
   0x0000fffff7f97580:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97584:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97588:	aa1303e1	mov	x1, x19
   0x0000fffff7f9758c:	aa1503e2	mov	x2, x21
   0x0000fffff7f97590:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7f97594:	aa1403e4	mov	x4, x20
   0x0000fffff7f97598:	aa1603e5	mov	x5, x22
   0x0000fffff7f9759c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7f975a0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f975a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f975a8:	d63f0200	blr	x16
   0x0000fffff7f975ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7f975b0:	5400a2a0	b.eq	0xfffff7f98a04  // b.none
   0x0000fffff7f975b4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f975b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f975bc:	aa1303e1	mov	x1, x19
   0x0000fffff7f975c0:	aa1503e2	mov	x2, x21
   0x0000fffff7f975c4:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7f975c8:	aa1403e4	mov	x4, x20
   0x0000fffff7f975cc:	aa1603e5	mov	x5, x22
   0x0000fffff7f975d0:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7f975d4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f975d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f975dc:	d63f0200	blr	x16
   0x0000fffff7f975e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f975e4:	5400a140	b.eq	0xfffff7f98a0c  // b.none
   0x0000fffff7f975e8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f975ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f975f0:	aa1303e1	mov	x1, x19
   0x0000fffff7f975f4:	aa1503e2	mov	x2, x21
   0x0000fffff7f975f8:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7f975fc:	aa1403e4	mov	x4, x20
   0x0000fffff7f97600:	aa1603e5	mov	x5, x22
   0x0000fffff7f97604:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f97608:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9760c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97610:	d63f0200	blr	x16
   0x0000fffff7f97614:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97618:	54009fe0	b.eq	0xfffff7f98a14  // b.none
   0x0000fffff7f9761c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97620:	37d80269	tbnz	w9, #27, 0xfffff7f9766c
   0x0000fffff7f97624:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97628:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9762c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97630:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97634:	540001c1	b.ne	0xfffff7f9766c  // b.any
   0x0000fffff7f97638:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9763c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97640:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97644:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97648:	54000121	b.ne	0xfffff7f9766c  // b.any
   0x0000fffff7f9764c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f97650:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f97654:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97658:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9765c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97660:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f97664:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f97668:	1400000e	b	0xfffff7f976a0
   0x0000fffff7f9766c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97670:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97674:	aa1303e1	mov	x1, x19
   0x0000fffff7f97678:	aa1503e2	mov	x2, x21
   0x0000fffff7f9767c:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7f97680:	aa1403e4	mov	x4, x20
   0x0000fffff7f97684:	aa1603e5	mov	x5, x22
   0x0000fffff7f97688:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7f9768c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97690:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97694:	d63f0200	blr	x16
   0x0000fffff7f97698:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9769c:	54009c00	b.eq	0xfffff7f98a1c  // b.none
   0x0000fffff7f976a0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f976a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f976a8:	aa1303e1	mov	x1, x19
   0x0000fffff7f976ac:	aa1503e2	mov	x2, x21
   0x0000fffff7f976b0:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7f976b4:	aa1403e4	mov	x4, x20
   0x0000fffff7f976b8:	aa1603e5	mov	x5, x22
   0x0000fffff7f976bc:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7f976c0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f976c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f976c8:	d63f0200	blr	x16
   0x0000fffff7f976cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f976d0:	54009aa0	b.eq	0xfffff7f98a24  // b.none
   0x0000fffff7f976d4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f976d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f976dc:	aa1303e1	mov	x1, x19
   0x0000fffff7f976e0:	aa1503e2	mov	x2, x21
   0x0000fffff7f976e4:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7f976e8:	aa1403e4	mov	x4, x20
   0x0000fffff7f976ec:	aa1603e5	mov	x5, x22
   0x0000fffff7f976f0:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7f976f4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f976f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f976fc:	d63f0200	blr	x16
   0x0000fffff7f97700:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97704:	54009940	b.eq	0xfffff7f98a2c  // b.none
   0x0000fffff7f97708:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9770c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97710:	aa1303e1	mov	x1, x19
   0x0000fffff7f97714:	aa1503e2	mov	x2, x21
   0x0000fffff7f97718:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7f9771c:	aa1403e4	mov	x4, x20
   0x0000fffff7f97720:	aa1603e5	mov	x5, x22
   0x0000fffff7f97724:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f97728:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9772c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97730:	d63f0200	blr	x16
   0x0000fffff7f97734:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97738:	540097e0	b.eq	0xfffff7f98a34  // b.none
   0x0000fffff7f9773c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97740:	37d80269	tbnz	w9, #27, 0xfffff7f9778c
   0x0000fffff7f97744:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97748:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9774c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97750:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97754:	540001c1	b.ne	0xfffff7f9778c  // b.any
   0x0000fffff7f97758:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9775c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97760:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97764:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97768:	54000121	b.ne	0xfffff7f9778c  // b.any
   0x0000fffff7f9776c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f97770:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f97774:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97778:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9777c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97780:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f97784:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f97788:	1400000e	b	0xfffff7f977c0
   0x0000fffff7f9778c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97790:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97794:	aa1303e1	mov	x1, x19
   0x0000fffff7f97798:	aa1503e2	mov	x2, x21
   0x0000fffff7f9779c:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7f977a0:	aa1403e4	mov	x4, x20
   0x0000fffff7f977a4:	aa1603e5	mov	x5, x22
   0x0000fffff7f977a8:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7f977ac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f977b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f977b4:	d63f0200	blr	x16
   0x0000fffff7f977b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f977bc:	54009400	b.eq	0xfffff7f98a3c  // b.none
   0x0000fffff7f977c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f977c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f977c8:	aa1303e1	mov	x1, x19
   0x0000fffff7f977cc:	aa1503e2	mov	x2, x21
   0x0000fffff7f977d0:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7f977d4:	aa1403e4	mov	x4, x20
   0x0000fffff7f977d8:	aa1603e5	mov	x5, x22
   0x0000fffff7f977dc:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7f977e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f977e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f977e8:	d63f0200	blr	x16
   0x0000fffff7f977ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f977f0:	540092a0	b.eq	0xfffff7f98a44  // b.none
   0x0000fffff7f977f4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f977f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f977fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f97800:	aa1503e2	mov	x2, x21
   0x0000fffff7f97804:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7f97808:	aa1403e4	mov	x4, x20
   0x0000fffff7f9780c:	aa1603e5	mov	x5, x22
   0x0000fffff7f97810:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7f97814:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97818:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9781c:	d63f0200	blr	x16
   0x0000fffff7f97820:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97824:	54009140	b.eq	0xfffff7f98a4c  // b.none
   0x0000fffff7f97828:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9782c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97830:	aa1303e1	mov	x1, x19
   0x0000fffff7f97834:	aa1503e2	mov	x2, x21
   0x0000fffff7f97838:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7f9783c:	aa1403e4	mov	x4, x20
   0x0000fffff7f97840:	aa1603e5	mov	x5, x22
   0x0000fffff7f97844:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f97848:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9784c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97850:	d63f0200	blr	x16
   0x0000fffff7f97854:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97858:	54008fe0	b.eq	0xfffff7f98a54  // b.none
   0x0000fffff7f9785c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97860:	37d80269	tbnz	w9, #27, 0xfffff7f978ac
   0x0000fffff7f97864:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97868:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9786c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97870:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97874:	540001c1	b.ne	0xfffff7f978ac  // b.any
   0x0000fffff7f97878:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9787c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97880:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97884:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97888:	54000121	b.ne	0xfffff7f978ac  // b.any
   0x0000fffff7f9788c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f97890:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f97894:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97898:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9789c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f978a0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f978a4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f978a8:	1400000e	b	0xfffff7f978e0
   0x0000fffff7f978ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f978b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f978b4:	aa1303e1	mov	x1, x19
   0x0000fffff7f978b8:	aa1503e2	mov	x2, x21
   0x0000fffff7f978bc:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7f978c0:	aa1403e4	mov	x4, x20
   0x0000fffff7f978c4:	aa1603e5	mov	x5, x22
   0x0000fffff7f978c8:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7f978cc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f978d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f978d4:	d63f0200	blr	x16
   0x0000fffff7f978d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f978dc:	54008c00	b.eq	0xfffff7f98a5c  // b.none
   0x0000fffff7f978e0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f978e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f978e8:	aa1303e1	mov	x1, x19
   0x0000fffff7f978ec:	aa1503e2	mov	x2, x21
   0x0000fffff7f978f0:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7f978f4:	aa1403e4	mov	x4, x20
   0x0000fffff7f978f8:	aa1603e5	mov	x5, x22
   0x0000fffff7f978fc:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7f97900:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97904:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97908:	d63f0200	blr	x16
   0x0000fffff7f9790c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97910:	54008aa0	b.eq	0xfffff7f98a64  // b.none
   0x0000fffff7f97914:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f97918:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9791c:	aa1303e1	mov	x1, x19
   0x0000fffff7f97920:	aa1503e2	mov	x2, x21
   0x0000fffff7f97924:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7f97928:	aa1403e4	mov	x4, x20
   0x0000fffff7f9792c:	aa1603e5	mov	x5, x22
   0x0000fffff7f97930:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7f97934:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97938:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9793c:	d63f0200	blr	x16
   0x0000fffff7f97940:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97944:	54008940	b.eq	0xfffff7f98a6c  // b.none
   0x0000fffff7f97948:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9794c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97950:	aa1303e1	mov	x1, x19
   0x0000fffff7f97954:	aa1503e2	mov	x2, x21
   0x0000fffff7f97958:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7f9795c:	aa1403e4	mov	x4, x20
   0x0000fffff7f97960:	aa1603e5	mov	x5, x22
   0x0000fffff7f97964:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f97968:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9796c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97970:	d63f0200	blr	x16
   0x0000fffff7f97974:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97978:	540087e0	b.eq	0xfffff7f98a74  // b.none
   0x0000fffff7f9797c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97980:	37d80269	tbnz	w9, #27, 0xfffff7f979cc
   0x0000fffff7f97984:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97988:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9798c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97990:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97994:	540001c1	b.ne	0xfffff7f979cc  // b.any
   0x0000fffff7f97998:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9799c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f979a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f979a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f979a8:	54000121	b.ne	0xfffff7f979cc  // b.any
   0x0000fffff7f979ac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f979b0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f979b4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f979b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f979bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f979c0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f979c4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f979c8:	1400000e	b	0xfffff7f97a00
   0x0000fffff7f979cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f979d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f979d4:	aa1303e1	mov	x1, x19
   0x0000fffff7f979d8:	aa1503e2	mov	x2, x21
   0x0000fffff7f979dc:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7f979e0:	aa1403e4	mov	x4, x20
   0x0000fffff7f979e4:	aa1603e5	mov	x5, x22
   0x0000fffff7f979e8:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7f979ec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f979f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f979f4:	d63f0200	blr	x16
   0x0000fffff7f979f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f979fc:	54008400	b.eq	0xfffff7f98a7c  // b.none
   0x0000fffff7f97a00:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97a04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97a08:	aa1303e1	mov	x1, x19
   0x0000fffff7f97a0c:	aa1503e2	mov	x2, x21
   0x0000fffff7f97a10:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7f97a14:	aa1403e4	mov	x4, x20
   0x0000fffff7f97a18:	aa1603e5	mov	x5, x22
   0x0000fffff7f97a1c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7f97a20:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97a24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97a28:	d63f0200	blr	x16
   0x0000fffff7f97a2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97a30:	540082a0	b.eq	0xfffff7f98a84  // b.none
   0x0000fffff7f97a34:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f97a38:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97a3c:	aa1303e1	mov	x1, x19
   0x0000fffff7f97a40:	aa1503e2	mov	x2, x21
   0x0000fffff7f97a44:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7f97a48:	aa1403e4	mov	x4, x20
   0x0000fffff7f97a4c:	aa1603e5	mov	x5, x22
   0x0000fffff7f97a50:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7f97a54:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97a58:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97a5c:	d63f0200	blr	x16
   0x0000fffff7f97a60:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97a64:	54008140	b.eq	0xfffff7f98a8c  // b.none
   0x0000fffff7f97a68:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f97a6c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97a70:	aa1303e1	mov	x1, x19
   0x0000fffff7f97a74:	aa1503e2	mov	x2, x21
   0x0000fffff7f97a78:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7f97a7c:	aa1403e4	mov	x4, x20
   0x0000fffff7f97a80:	aa1603e5	mov	x5, x22
   0x0000fffff7f97a84:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f97a88:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97a8c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97a90:	d63f0200	blr	x16
   0x0000fffff7f97a94:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97a98:	54007fe0	b.eq	0xfffff7f98a94  // b.none
   0x0000fffff7f97a9c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97aa0:	37d80269	tbnz	w9, #27, 0xfffff7f97aec
   0x0000fffff7f97aa4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97aa8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97aac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97ab0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97ab4:	540001c1	b.ne	0xfffff7f97aec  // b.any
   0x0000fffff7f97ab8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97abc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97ac0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97ac4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97ac8:	54000121	b.ne	0xfffff7f97aec  // b.any
   0x0000fffff7f97acc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f97ad0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f97ad4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97ad8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97adc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97ae0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f97ae4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f97ae8:	1400000e	b	0xfffff7f97b20
   0x0000fffff7f97aec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97af0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97af4:	aa1303e1	mov	x1, x19
   0x0000fffff7f97af8:	aa1503e2	mov	x2, x21
   0x0000fffff7f97afc:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7f97b00:	aa1403e4	mov	x4, x20
   0x0000fffff7f97b04:	aa1603e5	mov	x5, x22
   0x0000fffff7f97b08:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7f97b0c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97b10:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97b14:	d63f0200	blr	x16
   0x0000fffff7f97b18:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97b1c:	54007c00	b.eq	0xfffff7f98a9c  // b.none
   0x0000fffff7f97b20:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97b24:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97b28:	aa1303e1	mov	x1, x19
   0x0000fffff7f97b2c:	aa1503e2	mov	x2, x21
   0x0000fffff7f97b30:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7f97b34:	aa1403e4	mov	x4, x20
   0x0000fffff7f97b38:	aa1603e5	mov	x5, x22
   0x0000fffff7f97b3c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7f97b40:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97b44:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97b48:	d63f0200	blr	x16
   0x0000fffff7f97b4c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97b50:	54007aa0	b.eq	0xfffff7f98aa4  // b.none
   0x0000fffff7f97b54:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f97b58:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97b5c:	aa1303e1	mov	x1, x19
   0x0000fffff7f97b60:	aa1503e2	mov	x2, x21
   0x0000fffff7f97b64:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7f97b68:	aa1403e4	mov	x4, x20
   0x0000fffff7f97b6c:	aa1603e5	mov	x5, x22
   0x0000fffff7f97b70:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7f97b74:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97b78:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97b7c:	d63f0200	blr	x16
   0x0000fffff7f97b80:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97b84:	54007940	b.eq	0xfffff7f98aac  // b.none
   0x0000fffff7f97b88:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f97b8c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97b90:	aa1303e1	mov	x1, x19
   0x0000fffff7f97b94:	aa1503e2	mov	x2, x21
   0x0000fffff7f97b98:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7f97b9c:	aa1403e4	mov	x4, x20
   0x0000fffff7f97ba0:	aa1603e5	mov	x5, x22
   0x0000fffff7f97ba4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f97ba8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97bac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97bb0:	d63f0200	blr	x16
   0x0000fffff7f97bb4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97bb8:	540077e0	b.eq	0xfffff7f98ab4  // b.none
   0x0000fffff7f97bbc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97bc0:	37d80269	tbnz	w9, #27, 0xfffff7f97c0c
   0x0000fffff7f97bc4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97bc8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97bcc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97bd0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97bd4:	540001c1	b.ne	0xfffff7f97c0c  // b.any
   0x0000fffff7f97bd8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97bdc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97be0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97be4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97be8:	54000121	b.ne	0xfffff7f97c0c  // b.any
   0x0000fffff7f97bec:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f97bf0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f97bf4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97bf8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97bfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97c00:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f97c04:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f97c08:	1400000e	b	0xfffff7f97c40
   0x0000fffff7f97c0c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97c10:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97c14:	aa1303e1	mov	x1, x19
   0x0000fffff7f97c18:	aa1503e2	mov	x2, x21
   0x0000fffff7f97c1c:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7f97c20:	aa1403e4	mov	x4, x20
   0x0000fffff7f97c24:	aa1603e5	mov	x5, x22
   0x0000fffff7f97c28:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7f97c2c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97c30:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97c34:	d63f0200	blr	x16
   0x0000fffff7f97c38:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97c3c:	54007400	b.eq	0xfffff7f98abc  // b.none
   0x0000fffff7f97c40:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97c44:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97c48:	aa1303e1	mov	x1, x19
   0x0000fffff7f97c4c:	aa1503e2	mov	x2, x21
   0x0000fffff7f97c50:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7f97c54:	aa1403e4	mov	x4, x20
   0x0000fffff7f97c58:	aa1603e5	mov	x5, x22
   0x0000fffff7f97c5c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7f97c60:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97c64:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97c68:	d63f0200	blr	x16
   0x0000fffff7f97c6c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97c70:	540072a0	b.eq	0xfffff7f98ac4  // b.none
   0x0000fffff7f97c74:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f97c78:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97c7c:	aa1303e1	mov	x1, x19
   0x0000fffff7f97c80:	aa1503e2	mov	x2, x21
   0x0000fffff7f97c84:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7f97c88:	aa1403e4	mov	x4, x20
   0x0000fffff7f97c8c:	aa1603e5	mov	x5, x22
   0x0000fffff7f97c90:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7f97c94:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97c98:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97c9c:	d63f0200	blr	x16
   0x0000fffff7f97ca0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97ca4:	54007140	b.eq	0xfffff7f98acc  // b.none
   0x0000fffff7f97ca8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f97cac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97cb0:	aa1303e1	mov	x1, x19
   0x0000fffff7f97cb4:	aa1503e2	mov	x2, x21
   0x0000fffff7f97cb8:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7f97cbc:	aa1403e4	mov	x4, x20
   0x0000fffff7f97cc0:	aa1603e5	mov	x5, x22
   0x0000fffff7f97cc4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f97cc8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97ccc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97cd0:	d63f0200	blr	x16
   0x0000fffff7f97cd4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97cd8:	54006fe0	b.eq	0xfffff7f98ad4  // b.none
   0x0000fffff7f97cdc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97ce0:	37d80269	tbnz	w9, #27, 0xfffff7f97d2c
   0x0000fffff7f97ce4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97ce8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97cec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97cf0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97cf4:	540001c1	b.ne	0xfffff7f97d2c  // b.any
   0x0000fffff7f97cf8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97cfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97d00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97d04:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97d08:	54000121	b.ne	0xfffff7f97d2c  // b.any
   0x0000fffff7f97d0c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f97d10:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f97d14:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97d18:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97d1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97d20:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f97d24:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f97d28:	1400000e	b	0xfffff7f97d60
   0x0000fffff7f97d2c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97d30:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97d34:	aa1303e1	mov	x1, x19
   0x0000fffff7f97d38:	aa1503e2	mov	x2, x21
   0x0000fffff7f97d3c:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7f97d40:	aa1403e4	mov	x4, x20
   0x0000fffff7f97d44:	aa1603e5	mov	x5, x22
   0x0000fffff7f97d48:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7f97d4c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97d50:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97d54:	d63f0200	blr	x16
   0x0000fffff7f97d58:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97d5c:	54006c00	b.eq	0xfffff7f98adc  // b.none
   0x0000fffff7f97d60:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97d64:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97d68:	aa1303e1	mov	x1, x19
   0x0000fffff7f97d6c:	aa1503e2	mov	x2, x21
   0x0000fffff7f97d70:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7f97d74:	aa1403e4	mov	x4, x20
   0x0000fffff7f97d78:	aa1603e5	mov	x5, x22
   0x0000fffff7f97d7c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7f97d80:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97d84:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97d88:	d63f0200	blr	x16
   0x0000fffff7f97d8c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97d90:	54006aa0	b.eq	0xfffff7f98ae4  // b.none
   0x0000fffff7f97d94:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f97d98:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97d9c:	aa1303e1	mov	x1, x19
   0x0000fffff7f97da0:	aa1503e2	mov	x2, x21
   0x0000fffff7f97da4:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7f97da8:	aa1403e4	mov	x4, x20
   0x0000fffff7f97dac:	aa1603e5	mov	x5, x22
   0x0000fffff7f97db0:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7f97db4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97db8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97dbc:	d63f0200	blr	x16
   0x0000fffff7f97dc0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97dc4:	54006940	b.eq	0xfffff7f98aec  // b.none
   0x0000fffff7f97dc8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f97dcc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97dd0:	aa1303e1	mov	x1, x19
   0x0000fffff7f97dd4:	aa1503e2	mov	x2, x21
   0x0000fffff7f97dd8:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7f97ddc:	aa1403e4	mov	x4, x20
   0x0000fffff7f97de0:	aa1603e5	mov	x5, x22
   0x0000fffff7f97de4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f97de8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97dec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97df0:	d63f0200	blr	x16
   0x0000fffff7f97df4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97df8:	540067e0	b.eq	0xfffff7f98af4  // b.none
   0x0000fffff7f97dfc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97e00:	37d80269	tbnz	w9, #27, 0xfffff7f97e4c
   0x0000fffff7f97e04:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97e08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97e0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97e10:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97e14:	540001c1	b.ne	0xfffff7f97e4c  // b.any
   0x0000fffff7f97e18:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97e1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97e20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97e24:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97e28:	54000121	b.ne	0xfffff7f97e4c  // b.any
   0x0000fffff7f97e2c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f97e30:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f97e34:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97e38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97e3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97e40:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f97e44:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f97e48:	1400000e	b	0xfffff7f97e80
   0x0000fffff7f97e4c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97e50:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97e54:	aa1303e1	mov	x1, x19
   0x0000fffff7f97e58:	aa1503e2	mov	x2, x21
   0x0000fffff7f97e5c:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7f97e60:	aa1403e4	mov	x4, x20
   0x0000fffff7f97e64:	aa1603e5	mov	x5, x22
   0x0000fffff7f97e68:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7f97e6c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97e70:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97e74:	d63f0200	blr	x16
   0x0000fffff7f97e78:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97e7c:	54006400	b.eq	0xfffff7f98afc  // b.none
   0x0000fffff7f97e80:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97e84:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97e88:	aa1303e1	mov	x1, x19
   0x0000fffff7f97e8c:	aa1503e2	mov	x2, x21
   0x0000fffff7f97e90:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7f97e94:	aa1403e4	mov	x4, x20
   0x0000fffff7f97e98:	aa1603e5	mov	x5, x22
   0x0000fffff7f97e9c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7f97ea0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97ea4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97ea8:	d63f0200	blr	x16
   0x0000fffff7f97eac:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97eb0:	540062a0	b.eq	0xfffff7f98b04  // b.none
   0x0000fffff7f97eb4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f97eb8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97ebc:	aa1303e1	mov	x1, x19
   0x0000fffff7f97ec0:	aa1503e2	mov	x2, x21
   0x0000fffff7f97ec4:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7f97ec8:	aa1403e4	mov	x4, x20
   0x0000fffff7f97ecc:	aa1603e5	mov	x5, x22
   0x0000fffff7f97ed0:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7f97ed4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97ed8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97edc:	d63f0200	blr	x16
   0x0000fffff7f97ee0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97ee4:	54006140	b.eq	0xfffff7f98b0c  // b.none
   0x0000fffff7f97ee8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f97eec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97ef0:	aa1303e1	mov	x1, x19
   0x0000fffff7f97ef4:	aa1503e2	mov	x2, x21
   0x0000fffff7f97ef8:	d2800683	mov	x3, #0x34                  	// #52
   0x0000fffff7f97efc:	aa1403e4	mov	x4, x20
   0x0000fffff7f97f00:	aa1603e5	mov	x5, x22
   0x0000fffff7f97f04:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f97f08:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97f0c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97f10:	d63f0200	blr	x16
   0x0000fffff7f97f14:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97f18:	54005fe0	b.eq	0xfffff7f98b14  // b.none
   0x0000fffff7f97f1c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97f20:	37d80269	tbnz	w9, #27, 0xfffff7f97f6c
   0x0000fffff7f97f24:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97f28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97f2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97f30:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97f34:	540001c1	b.ne	0xfffff7f97f6c  // b.any
   0x0000fffff7f97f38:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f97f3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97f40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97f44:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97f48:	54000121	b.ne	0xfffff7f97f6c  // b.any
   0x0000fffff7f97f4c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f97f50:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f97f54:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97f58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97f5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97f60:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f97f64:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f97f68:	1400000e	b	0xfffff7f97fa0
   0x0000fffff7f97f6c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97f70:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97f74:	aa1303e1	mov	x1, x19
   0x0000fffff7f97f78:	aa1503e2	mov	x2, x21
   0x0000fffff7f97f7c:	d28006a3	mov	x3, #0x35                  	// #53
   0x0000fffff7f97f80:	aa1403e4	mov	x4, x20
   0x0000fffff7f97f84:	aa1603e5	mov	x5, x22
   0x0000fffff7f97f88:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7f97f8c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97f90:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97f94:	d63f0200	blr	x16
   0x0000fffff7f97f98:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97f9c:	54005c00	b.eq	0xfffff7f98b1c  // b.none
   0x0000fffff7f97fa0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97fa4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97fa8:	aa1303e1	mov	x1, x19
   0x0000fffff7f97fac:	aa1503e2	mov	x2, x21
   0x0000fffff7f97fb0:	d28006c3	mov	x3, #0x36                  	// #54
   0x0000fffff7f97fb4:	aa1403e4	mov	x4, x20
   0x0000fffff7f97fb8:	aa1603e5	mov	x5, x22
   0x0000fffff7f97fbc:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7f97fc0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97fc4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97fc8:	d63f0200	blr	x16
   0x0000fffff7f97fcc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97fd0:	54005aa0	b.eq	0xfffff7f98b24  // b.none
   0x0000fffff7f97fd4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f97fd8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97fdc:	aa1303e1	mov	x1, x19
   0x0000fffff7f97fe0:	aa1503e2	mov	x2, x21
   0x0000fffff7f97fe4:	d28006e3	mov	x3, #0x37                  	// #55
   0x0000fffff7f97fe8:	aa1403e4	mov	x4, x20
   0x0000fffff7f97fec:	aa1603e5	mov	x5, x22
   0x0000fffff7f97ff0:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7f97ff4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97ff8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97ffc:	d63f0200	blr	x16
   0x0000fffff7f98000:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98004:	54005940	b.eq	0xfffff7f98b2c  // b.none
   0x0000fffff7f98008:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9800c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98010:	aa1303e1	mov	x1, x19
   0x0000fffff7f98014:	aa1503e2	mov	x2, x21
   0x0000fffff7f98018:	d2800703	mov	x3, #0x38                  	// #56
   0x0000fffff7f9801c:	aa1403e4	mov	x4, x20
   0x0000fffff7f98020:	aa1603e5	mov	x5, x22
   0x0000fffff7f98024:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f98028:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9802c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98030:	d63f0200	blr	x16
   0x0000fffff7f98034:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98038:	540057e0	b.eq	0xfffff7f98b34  // b.none
   0x0000fffff7f9803c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98040:	37d80269	tbnz	w9, #27, 0xfffff7f9808c
   0x0000fffff7f98044:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98048:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9804c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98050:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98054:	540001c1	b.ne	0xfffff7f9808c  // b.any
   0x0000fffff7f98058:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9805c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98060:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98064:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98068:	54000121	b.ne	0xfffff7f9808c  // b.any
   0x0000fffff7f9806c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f98070:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f98074:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f98078:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9807c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98080:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f98084:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f98088:	1400000e	b	0xfffff7f980c0
   0x0000fffff7f9808c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98090:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98094:	aa1303e1	mov	x1, x19
   0x0000fffff7f98098:	aa1503e2	mov	x2, x21
   0x0000fffff7f9809c:	d2800723	mov	x3, #0x39                  	// #57
   0x0000fffff7f980a0:	aa1403e4	mov	x4, x20
   0x0000fffff7f980a4:	aa1603e5	mov	x5, x22
   0x0000fffff7f980a8:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7f980ac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f980b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f980b4:	d63f0200	blr	x16
   0x0000fffff7f980b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f980bc:	54005400	b.eq	0xfffff7f98b3c  // b.none
   0x0000fffff7f980c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f980c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f980c8:	aa1303e1	mov	x1, x19
   0x0000fffff7f980cc:	aa1503e2	mov	x2, x21
   0x0000fffff7f980d0:	d2800743	mov	x3, #0x3a                  	// #58
   0x0000fffff7f980d4:	aa1403e4	mov	x4, x20
   0x0000fffff7f980d8:	aa1603e5	mov	x5, x22
   0x0000fffff7f980dc:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7f980e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f980e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f980e8:	d63f0200	blr	x16
   0x0000fffff7f980ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f980f0:	540052a0	b.eq	0xfffff7f98b44  // b.none
   0x0000fffff7f980f4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f980f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f980fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f98100:	aa1503e2	mov	x2, x21
   0x0000fffff7f98104:	d2800763	mov	x3, #0x3b                  	// #59
   0x0000fffff7f98108:	aa1403e4	mov	x4, x20
   0x0000fffff7f9810c:	aa1603e5	mov	x5, x22
   0x0000fffff7f98110:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7f98114:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98118:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9811c:	d63f0200	blr	x16
   0x0000fffff7f98120:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98124:	54005140	b.eq	0xfffff7f98b4c  // b.none
   0x0000fffff7f98128:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9812c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98130:	aa1303e1	mov	x1, x19
   0x0000fffff7f98134:	aa1503e2	mov	x2, x21
   0x0000fffff7f98138:	d2800783	mov	x3, #0x3c                  	// #60
   0x0000fffff7f9813c:	aa1403e4	mov	x4, x20
   0x0000fffff7f98140:	aa1603e5	mov	x5, x22
   0x0000fffff7f98144:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f98148:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9814c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98150:	d63f0200	blr	x16
   0x0000fffff7f98154:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98158:	54004fe0	b.eq	0xfffff7f98b54  // b.none
   0x0000fffff7f9815c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98160:	37d80269	tbnz	w9, #27, 0xfffff7f981ac
   0x0000fffff7f98164:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98168:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9816c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98170:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98174:	540001c1	b.ne	0xfffff7f981ac  // b.any
   0x0000fffff7f98178:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9817c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98180:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98184:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98188:	54000121	b.ne	0xfffff7f981ac  // b.any
   0x0000fffff7f9818c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f98190:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f98194:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f98198:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9819c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f981a0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f981a4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f981a8:	1400000e	b	0xfffff7f981e0
   0x0000fffff7f981ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f981b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f981b4:	aa1303e1	mov	x1, x19
   0x0000fffff7f981b8:	aa1503e2	mov	x2, x21
   0x0000fffff7f981bc:	d28007a3	mov	x3, #0x3d                  	// #61
   0x0000fffff7f981c0:	aa1403e4	mov	x4, x20
   0x0000fffff7f981c4:	aa1603e5	mov	x5, x22
   0x0000fffff7f981c8:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7f981cc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f981d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f981d4:	d63f0200	blr	x16
   0x0000fffff7f981d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f981dc:	54004c00	b.eq	0xfffff7f98b5c  // b.none
   0x0000fffff7f981e0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f981e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f981e8:	aa1303e1	mov	x1, x19
   0x0000fffff7f981ec:	aa1503e2	mov	x2, x21
   0x0000fffff7f981f0:	d28007c3	mov	x3, #0x3e                  	// #62
   0x0000fffff7f981f4:	aa1403e4	mov	x4, x20
   0x0000fffff7f981f8:	aa1603e5	mov	x5, x22
   0x0000fffff7f981fc:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7f98200:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98204:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98208:	d63f0200	blr	x16
   0x0000fffff7f9820c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98210:	54004aa0	b.eq	0xfffff7f98b64  // b.none
   0x0000fffff7f98214:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f98218:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9821c:	aa1303e1	mov	x1, x19
   0x0000fffff7f98220:	aa1503e2	mov	x2, x21
   0x0000fffff7f98224:	d28007e3	mov	x3, #0x3f                  	// #63
   0x0000fffff7f98228:	aa1403e4	mov	x4, x20
   0x0000fffff7f9822c:	aa1603e5	mov	x5, x22
   0x0000fffff7f98230:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7f98234:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98238:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9823c:	d63f0200	blr	x16
   0x0000fffff7f98240:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98244:	54004940	b.eq	0xfffff7f98b6c  // b.none
   0x0000fffff7f98248:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9824c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98250:	aa1303e1	mov	x1, x19
   0x0000fffff7f98254:	aa1503e2	mov	x2, x21
   0x0000fffff7f98258:	d2800803	mov	x3, #0x40                  	// #64
   0x0000fffff7f9825c:	aa1403e4	mov	x4, x20
   0x0000fffff7f98260:	aa1603e5	mov	x5, x22
   0x0000fffff7f98264:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f98268:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9826c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98270:	d63f0200	blr	x16
   0x0000fffff7f98274:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98278:	540047e0	b.eq	0xfffff7f98b74  // b.none
   0x0000fffff7f9827c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98280:	37d80269	tbnz	w9, #27, 0xfffff7f982cc
   0x0000fffff7f98284:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98288:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9828c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98290:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98294:	540001c1	b.ne	0xfffff7f982cc  // b.any
   0x0000fffff7f98298:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9829c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f982a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f982a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f982a8:	54000121	b.ne	0xfffff7f982cc  // b.any
   0x0000fffff7f982ac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f982b0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f982b4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f982b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f982bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f982c0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f982c4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f982c8:	1400000e	b	0xfffff7f98300
   0x0000fffff7f982cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f982d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f982d4:	aa1303e1	mov	x1, x19
   0x0000fffff7f982d8:	aa1503e2	mov	x2, x21
   0x0000fffff7f982dc:	d2800823	mov	x3, #0x41                  	// #65
   0x0000fffff7f982e0:	aa1403e4	mov	x4, x20
   0x0000fffff7f982e4:	aa1603e5	mov	x5, x22
   0x0000fffff7f982e8:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7f982ec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f982f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f982f4:	d63f0200	blr	x16
   0x0000fffff7f982f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f982fc:	54004400	b.eq	0xfffff7f98b7c  // b.none
   0x0000fffff7f98300:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98304:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98308:	aa1303e1	mov	x1, x19
   0x0000fffff7f9830c:	aa1503e2	mov	x2, x21
   0x0000fffff7f98310:	d2800843	mov	x3, #0x42                  	// #66
   0x0000fffff7f98314:	aa1403e4	mov	x4, x20
   0x0000fffff7f98318:	aa1603e5	mov	x5, x22
   0x0000fffff7f9831c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7f98320:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98324:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98328:	d63f0200	blr	x16
   0x0000fffff7f9832c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98330:	540042a0	b.eq	0xfffff7f98b84  // b.none
   0x0000fffff7f98334:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f98338:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9833c:	aa1303e1	mov	x1, x19
   0x0000fffff7f98340:	aa1503e2	mov	x2, x21
   0x0000fffff7f98344:	d2800863	mov	x3, #0x43                  	// #67
   0x0000fffff7f98348:	aa1403e4	mov	x4, x20
   0x0000fffff7f9834c:	aa1603e5	mov	x5, x22
   0x0000fffff7f98350:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7f98354:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98358:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9835c:	d63f0200	blr	x16
   0x0000fffff7f98360:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98364:	54004140	b.eq	0xfffff7f98b8c  // b.none
   0x0000fffff7f98368:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9836c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98370:	aa1303e1	mov	x1, x19
   0x0000fffff7f98374:	aa1503e2	mov	x2, x21
   0x0000fffff7f98378:	d2800883	mov	x3, #0x44                  	// #68
   0x0000fffff7f9837c:	aa1403e4	mov	x4, x20
   0x0000fffff7f98380:	aa1603e5	mov	x5, x22
   0x0000fffff7f98384:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f98388:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9838c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98390:	d63f0200	blr	x16
   0x0000fffff7f98394:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98398:	54003fe0	b.eq	0xfffff7f98b94  // b.none
   0x0000fffff7f9839c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f983a0:	37d80269	tbnz	w9, #27, 0xfffff7f983ec
   0x0000fffff7f983a4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f983a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f983ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f983b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f983b4:	540001c1	b.ne	0xfffff7f983ec  // b.any
   0x0000fffff7f983b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f983bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f983c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f983c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f983c8:	54000121	b.ne	0xfffff7f983ec  // b.any
   0x0000fffff7f983cc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f983d0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f983d4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f983d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f983dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f983e0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f983e4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f983e8:	1400000e	b	0xfffff7f98420
   0x0000fffff7f983ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f983f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f983f4:	aa1303e1	mov	x1, x19
   0x0000fffff7f983f8:	aa1503e2	mov	x2, x21
   0x0000fffff7f983fc:	d28008a3	mov	x3, #0x45                  	// #69
   0x0000fffff7f98400:	aa1403e4	mov	x4, x20
   0x0000fffff7f98404:	aa1603e5	mov	x5, x22
   0x0000fffff7f98408:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7f9840c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98410:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98414:	d63f0200	blr	x16
   0x0000fffff7f98418:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9841c:	54003c00	b.eq	0xfffff7f98b9c  // b.none
   0x0000fffff7f98420:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98424:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98428:	aa1303e1	mov	x1, x19
   0x0000fffff7f9842c:	aa1503e2	mov	x2, x21
   0x0000fffff7f98430:	d28008c3	mov	x3, #0x46                  	// #70
   0x0000fffff7f98434:	aa1403e4	mov	x4, x20
   0x0000fffff7f98438:	aa1603e5	mov	x5, x22
   0x0000fffff7f9843c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7f98440:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98444:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98448:	d63f0200	blr	x16
   0x0000fffff7f9844c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98450:	54003aa0	b.eq	0xfffff7f98ba4  // b.none
   0x0000fffff7f98454:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f98458:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9845c:	aa1303e1	mov	x1, x19
   0x0000fffff7f98460:	aa1503e2	mov	x2, x21
   0x0000fffff7f98464:	d28008e3	mov	x3, #0x47                  	// #71
   0x0000fffff7f98468:	aa1403e4	mov	x4, x20
   0x0000fffff7f9846c:	aa1603e5	mov	x5, x22
   0x0000fffff7f98470:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7f98474:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98478:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9847c:	d63f0200	blr	x16
   0x0000fffff7f98480:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98484:	54003940	b.eq	0xfffff7f98bac  // b.none
   0x0000fffff7f98488:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9848c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98490:	aa1303e1	mov	x1, x19
   0x0000fffff7f98494:	aa1503e2	mov	x2, x21
   0x0000fffff7f98498:	d2800903	mov	x3, #0x48                  	// #72
   0x0000fffff7f9849c:	aa1403e4	mov	x4, x20
   0x0000fffff7f984a0:	aa1603e5	mov	x5, x22
   0x0000fffff7f984a4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f984a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f984ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f984b0:	d63f0200	blr	x16
   0x0000fffff7f984b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f984b8:	540037e0	b.eq	0xfffff7f98bb4  // b.none
   0x0000fffff7f984bc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f984c0:	37d80269	tbnz	w9, #27, 0xfffff7f9850c
   0x0000fffff7f984c4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f984c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f984cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f984d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f984d4:	540001c1	b.ne	0xfffff7f9850c  // b.any
   0x0000fffff7f984d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f984dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f984e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f984e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f984e8:	54000121	b.ne	0xfffff7f9850c  // b.any
   0x0000fffff7f984ec:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f984f0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f984f4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f984f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f984fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98500:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f98504:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f98508:	1400000e	b	0xfffff7f98540
   0x0000fffff7f9850c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98510:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98514:	aa1303e1	mov	x1, x19
   0x0000fffff7f98518:	aa1503e2	mov	x2, x21
   0x0000fffff7f9851c:	d2800923	mov	x3, #0x49                  	// #73
   0x0000fffff7f98520:	aa1403e4	mov	x4, x20
   0x0000fffff7f98524:	aa1603e5	mov	x5, x22
   0x0000fffff7f98528:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7f9852c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98530:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98534:	d63f0200	blr	x16
   0x0000fffff7f98538:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9853c:	54003400	b.eq	0xfffff7f98bbc  // b.none
   0x0000fffff7f98540:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98544:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98548:	aa1303e1	mov	x1, x19
   0x0000fffff7f9854c:	aa1503e2	mov	x2, x21
   0x0000fffff7f98550:	d2800943	mov	x3, #0x4a                  	// #74
   0x0000fffff7f98554:	aa1403e4	mov	x4, x20
   0x0000fffff7f98558:	aa1603e5	mov	x5, x22
   0x0000fffff7f9855c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7f98560:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98564:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98568:	d63f0200	blr	x16
   0x0000fffff7f9856c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98570:	540032a0	b.eq	0xfffff7f98bc4  // b.none
   0x0000fffff7f98574:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f98578:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9857c:	aa1303e1	mov	x1, x19
   0x0000fffff7f98580:	aa1503e2	mov	x2, x21
   0x0000fffff7f98584:	d2800963	mov	x3, #0x4b                  	// #75
   0x0000fffff7f98588:	aa1403e4	mov	x4, x20
   0x0000fffff7f9858c:	aa1603e5	mov	x5, x22
   0x0000fffff7f98590:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7f98594:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98598:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9859c:	d63f0200	blr	x16
   0x0000fffff7f985a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f985a4:	54003140	b.eq	0xfffff7f98bcc  // b.none
   0x0000fffff7f985a8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f985ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f985b0:	aa1303e1	mov	x1, x19
   0x0000fffff7f985b4:	aa1503e2	mov	x2, x21
   0x0000fffff7f985b8:	d2800983	mov	x3, #0x4c                  	// #76
   0x0000fffff7f985bc:	aa1403e4	mov	x4, x20
   0x0000fffff7f985c0:	aa1603e5	mov	x5, x22
   0x0000fffff7f985c4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f985c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f985cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f985d0:	d63f0200	blr	x16
   0x0000fffff7f985d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f985d8:	54002fe0	b.eq	0xfffff7f98bd4  // b.none
   0x0000fffff7f985dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f985e0:	37d80269	tbnz	w9, #27, 0xfffff7f9862c
   0x0000fffff7f985e4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f985e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f985ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f985f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f985f4:	540001c1	b.ne	0xfffff7f9862c  // b.any
   0x0000fffff7f985f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f985fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98600:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98604:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98608:	54000121	b.ne	0xfffff7f9862c  // b.any
   0x0000fffff7f9860c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f98610:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f98614:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f98618:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9861c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98620:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f98624:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f98628:	1400000e	b	0xfffff7f98660
   0x0000fffff7f9862c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98630:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98634:	aa1303e1	mov	x1, x19
   0x0000fffff7f98638:	aa1503e2	mov	x2, x21
   0x0000fffff7f9863c:	d28009a3	mov	x3, #0x4d                  	// #77
   0x0000fffff7f98640:	aa1403e4	mov	x4, x20
   0x0000fffff7f98644:	aa1603e5	mov	x5, x22
   0x0000fffff7f98648:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7f9864c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98650:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98654:	d63f0200	blr	x16
   0x0000fffff7f98658:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9865c:	54002c00	b.eq	0xfffff7f98bdc  // b.none
   0x0000fffff7f98660:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98664:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98668:	aa1303e1	mov	x1, x19
   0x0000fffff7f9866c:	aa1503e2	mov	x2, x21
   0x0000fffff7f98670:	d28009c3	mov	x3, #0x4e                  	// #78
   0x0000fffff7f98674:	aa1403e4	mov	x4, x20
   0x0000fffff7f98678:	aa1603e5	mov	x5, x22
   0x0000fffff7f9867c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7f98680:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98684:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98688:	d63f0200	blr	x16
   0x0000fffff7f9868c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98690:	54002aa0	b.eq	0xfffff7f98be4  // b.none
   0x0000fffff7f98694:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f98698:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9869c:	aa1303e1	mov	x1, x19
   0x0000fffff7f986a0:	aa1503e2	mov	x2, x21
   0x0000fffff7f986a4:	d28009e3	mov	x3, #0x4f                  	// #79
   0x0000fffff7f986a8:	aa1403e4	mov	x4, x20
   0x0000fffff7f986ac:	aa1603e5	mov	x5, x22
   0x0000fffff7f986b0:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7f986b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f986b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f986bc:	d63f0200	blr	x16
   0x0000fffff7f986c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f986c4:	54002940	b.eq	0xfffff7f98bec  // b.none
   0x0000fffff7f986c8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f986cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f986d0:	aa1303e1	mov	x1, x19
   0x0000fffff7f986d4:	aa1503e2	mov	x2, x21
   0x0000fffff7f986d8:	d2800a03	mov	x3, #0x50                  	// #80
   0x0000fffff7f986dc:	aa1403e4	mov	x4, x20
   0x0000fffff7f986e0:	aa1603e5	mov	x5, x22
   0x0000fffff7f986e4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f986e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f986ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f986f0:	d63f0200	blr	x16
   0x0000fffff7f986f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f986f8:	540027e0	b.eq	0xfffff7f98bf4  // b.none
   0x0000fffff7f986fc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98700:	37d80269	tbnz	w9, #27, 0xfffff7f9874c
   0x0000fffff7f98704:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98708:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9870c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98710:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98714:	540001c1	b.ne	0xfffff7f9874c  // b.any
   0x0000fffff7f98718:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9871c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98720:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98724:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98728:	54000121	b.ne	0xfffff7f9874c  // b.any
   0x0000fffff7f9872c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f98730:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f98734:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f98738:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9873c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98740:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f98744:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f98748:	1400000e	b	0xfffff7f98780
   0x0000fffff7f9874c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98750:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98754:	aa1303e1	mov	x1, x19
   0x0000fffff7f98758:	aa1503e2	mov	x2, x21
   0x0000fffff7f9875c:	d2800a23	mov	x3, #0x51                  	// #81
   0x0000fffff7f98760:	aa1403e4	mov	x4, x20
   0x0000fffff7f98764:	aa1603e5	mov	x5, x22
   0x0000fffff7f98768:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7f9876c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98770:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98774:	d63f0200	blr	x16
   0x0000fffff7f98778:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9877c:	54002400	b.eq	0xfffff7f98bfc  // b.none
   0x0000fffff7f98780:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98784:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98788:	aa1303e1	mov	x1, x19
   0x0000fffff7f9878c:	aa1503e2	mov	x2, x21
   0x0000fffff7f98790:	d2800a43	mov	x3, #0x52                  	// #82
   0x0000fffff7f98794:	aa1403e4	mov	x4, x20
   0x0000fffff7f98798:	aa1603e5	mov	x5, x22
   0x0000fffff7f9879c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7f987a0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f987a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f987a8:	d63f0200	blr	x16
   0x0000fffff7f987ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7f987b0:	540022a0	b.eq	0xfffff7f98c04  // b.none
   0x0000fffff7f987b4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f987b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f987bc:	aa1303e1	mov	x1, x19
   0x0000fffff7f987c0:	aa1503e2	mov	x2, x21
   0x0000fffff7f987c4:	d2800a63	mov	x3, #0x53                  	// #83
   0x0000fffff7f987c8:	aa1403e4	mov	x4, x20
   0x0000fffff7f987cc:	aa1603e5	mov	x5, x22
   0x0000fffff7f987d0:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7f987d4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f987d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f987dc:	d63f0200	blr	x16
   0x0000fffff7f987e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f987e4:	54002140	b.eq	0xfffff7f98c0c  // b.none
   0x0000fffff7f987e8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f987ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f987f0:	aa1303e1	mov	x1, x19
   0x0000fffff7f987f4:	aa1503e2	mov	x2, x21
   0x0000fffff7f987f8:	d2800a83	mov	x3, #0x54                  	// #84
   0x0000fffff7f987fc:	aa1403e4	mov	x4, x20
   0x0000fffff7f98800:	aa1603e5	mov	x5, x22
   0x0000fffff7f98804:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f98808:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9880c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98810:	d63f0200	blr	x16
   0x0000fffff7f98814:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98818:	54001fe0	b.eq	0xfffff7f98c14  // b.none
   0x0000fffff7f9881c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98820:	37d80269	tbnz	w9, #27, 0xfffff7f9886c
   0x0000fffff7f98824:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98828:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9882c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98830:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98834:	540001c1	b.ne	0xfffff7f9886c  // b.any
   0x0000fffff7f98838:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9883c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98840:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98844:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98848:	54000121	b.ne	0xfffff7f9886c  // b.any
   0x0000fffff7f9884c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f98850:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f98854:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f98858:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9885c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98860:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f98864:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f98868:	1400000e	b	0xfffff7f988a0
   0x0000fffff7f9886c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98870:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98874:	aa1303e1	mov	x1, x19
   0x0000fffff7f98878:	aa1503e2	mov	x2, x21
   0x0000fffff7f9887c:	d2800aa3	mov	x3, #0x55                  	// #85
   0x0000fffff7f98880:	aa1403e4	mov	x4, x20
   0x0000fffff7f98884:	aa1603e5	mov	x5, x22
   0x0000fffff7f98888:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7f9888c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98890:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98894:	d63f0200	blr	x16
   0x0000fffff7f98898:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9889c:	54001c00	b.eq	0xfffff7f98c1c  // b.none
   0x0000fffff7f988a0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f988a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f988a8:	aa1303e1	mov	x1, x19
   0x0000fffff7f988ac:	aa1503e2	mov	x2, x21
   0x0000fffff7f988b0:	d2800ac3	mov	x3, #0x56                  	// #86
   0x0000fffff7f988b4:	aa1403e4	mov	x4, x20
   0x0000fffff7f988b8:	aa1603e5	mov	x5, x22
   0x0000fffff7f988bc:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7f988c0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f988c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f988c8:	d63f0200	blr	x16
   0x0000fffff7f988cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f988d0:	54001aa0	b.eq	0xfffff7f98c24  // b.none
   0x0000fffff7f988d4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f988d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f988dc:	aa1303e1	mov	x1, x19
   0x0000fffff7f988e0:	aa1503e2	mov	x2, x21
   0x0000fffff7f988e4:	d2800ae3	mov	x3, #0x57                  	// #87
   0x0000fffff7f988e8:	aa1403e4	mov	x4, x20
   0x0000fffff7f988ec:	aa1603e5	mov	x5, x22
   0x0000fffff7f988f0:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7f988f4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f988f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f988fc:	d63f0200	blr	x16
   0x0000fffff7f98900:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98904:	54001940	b.eq	0xfffff7f98c2c  // b.none
   0x0000fffff7f98908:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9890c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98910:	aa1303e1	mov	x1, x19
   0x0000fffff7f98914:	aa1503e2	mov	x2, x21
   0x0000fffff7f98918:	d2800b03	mov	x3, #0x58                  	// #88
   0x0000fffff7f9891c:	aa1403e4	mov	x4, x20
   0x0000fffff7f98920:	aa1603e5	mov	x5, x22
   0x0000fffff7f98924:	d2869090	mov	x16, #0x3484                	// #13444
   0x0000fffff7f98928:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9892c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98930:	d63f0200	blr	x16
   0x0000fffff7f98934:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f98938:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f9893c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f98940:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f98944:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f98948:	d65f03c0	ret
   0x0000fffff7f9894c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98950:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98954:	b900028a	str	w10, [x20]
   0x0000fffff7f98958:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f9895c:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f98960:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f98964:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f98968:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f9896c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f98970:	d65f03c0	ret
   0x0000fffff7f98974:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f98978:	17fffff5	b	0xfffff7f9894c
   0x0000fffff7f9897c:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f98980:	17fffff3	b	0xfffff7f9894c
   0x0000fffff7f98984:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f98988:	17fffff1	b	0xfffff7f9894c
   0x0000fffff7f9898c:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f98990:	17ffffef	b	0xfffff7f9894c
   0x0000fffff7f98994:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f98998:	17ffffed	b	0xfffff7f9894c
   0x0000fffff7f9899c:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f989a0:	17ffffeb	b	0xfffff7f9894c
   0x0000fffff7f989a4:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f989a8:	17ffffe9	b	0xfffff7f9894c
   0x0000fffff7f989ac:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f989b0:	17ffffe7	b	0xfffff7f9894c
   0x0000fffff7f989b4:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f989b8:	17ffffe5	b	0xfffff7f9894c
   0x0000fffff7f989bc:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f989c0:	17ffffe3	b	0xfffff7f9894c
   0x0000fffff7f989c4:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7f989c8:	17ffffe1	b	0xfffff7f9894c
   0x0000fffff7f989cc:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7f989d0:	17ffffdf	b	0xfffff7f9894c
   0x0000fffff7f989d4:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7f989d8:	17ffffdd	b	0xfffff7f9894c
   0x0000fffff7f989dc:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7f989e0:	17ffffdb	b	0xfffff7f9894c
   0x0000fffff7f989e4:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7f989e8:	17ffffd9	b	0xfffff7f9894c
   0x0000fffff7f989ec:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7f989f0:	17ffffd7	b	0xfffff7f9894c
   0x0000fffff7f989f4:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7f989f8:	17ffffd5	b	0xfffff7f9894c
   0x0000fffff7f989fc:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7f98a00:	17ffffd3	b	0xfffff7f9894c
   0x0000fffff7f98a04:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7f98a08:	17ffffd1	b	0xfffff7f9894c
   0x0000fffff7f98a0c:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7f98a10:	17ffffcf	b	0xfffff7f9894c
   0x0000fffff7f98a14:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7f98a18:	17ffffcd	b	0xfffff7f9894c
   0x0000fffff7f98a1c:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7f98a20:	17ffffcb	b	0xfffff7f9894c
   0x0000fffff7f98a24:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7f98a28:	17ffffc9	b	0xfffff7f9894c
   0x0000fffff7f98a2c:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7f98a30:	17ffffc7	b	0xfffff7f9894c
   0x0000fffff7f98a34:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7f98a38:	17ffffc5	b	0xfffff7f9894c
   0x0000fffff7f98a3c:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7f98a40:	17ffffc3	b	0xfffff7f9894c
   0x0000fffff7f98a44:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7f98a48:	17ffffc1	b	0xfffff7f9894c
   0x0000fffff7f98a4c:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7f98a50:	17ffffbf	b	0xfffff7f9894c
   0x0000fffff7f98a54:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7f98a58:	17ffffbd	b	0xfffff7f9894c
   0x0000fffff7f98a5c:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7f98a60:	17ffffbb	b	0xfffff7f9894c
   0x0000fffff7f98a64:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7f98a68:	17ffffb9	b	0xfffff7f9894c
   0x0000fffff7f98a6c:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7f98a70:	17ffffb7	b	0xfffff7f9894c
   0x0000fffff7f98a74:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7f98a78:	17ffffb5	b	0xfffff7f9894c
   0x0000fffff7f98a7c:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7f98a80:	17ffffb3	b	0xfffff7f9894c
   0x0000fffff7f98a84:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7f98a88:	17ffffb1	b	0xfffff7f9894c
   0x0000fffff7f98a8c:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7f98a90:	17ffffaf	b	0xfffff7f9894c
   0x0000fffff7f98a94:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7f98a98:	17ffffad	b	0xfffff7f9894c
   0x0000fffff7f98a9c:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7f98aa0:	17ffffab	b	0xfffff7f9894c
   0x0000fffff7f98aa4:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7f98aa8:	17ffffa9	b	0xfffff7f9894c
   0x0000fffff7f98aac:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7f98ab0:	17ffffa7	b	0xfffff7f9894c
   0x0000fffff7f98ab4:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7f98ab8:	17ffffa5	b	0xfffff7f9894c
   0x0000fffff7f98abc:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7f98ac0:	17ffffa3	b	0xfffff7f9894c
   0x0000fffff7f98ac4:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7f98ac8:	17ffffa1	b	0xfffff7f9894c
   0x0000fffff7f98acc:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7f98ad0:	17ffff9f	b	0xfffff7f9894c
   0x0000fffff7f98ad4:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7f98ad8:	17ffff9d	b	0xfffff7f9894c
   0x0000fffff7f98adc:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7f98ae0:	17ffff9b	b	0xfffff7f9894c
   0x0000fffff7f98ae4:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7f98ae8:	17ffff99	b	0xfffff7f9894c
   0x0000fffff7f98aec:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7f98af0:	17ffff97	b	0xfffff7f9894c
   0x0000fffff7f98af4:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7f98af8:	17ffff95	b	0xfffff7f9894c
   0x0000fffff7f98afc:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7f98b00:	17ffff93	b	0xfffff7f9894c
   0x0000fffff7f98b04:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7f98b08:	17ffff91	b	0xfffff7f9894c
   0x0000fffff7f98b0c:	d2800669	mov	x9, #0x33                  	// #51
   0x0000fffff7f98b10:	17ffff8f	b	0xfffff7f9894c
   0x0000fffff7f98b14:	d2800689	mov	x9, #0x34                  	// #52
   0x0000fffff7f98b18:	17ffff8d	b	0xfffff7f9894c
   0x0000fffff7f98b1c:	d28006a9	mov	x9, #0x35                  	// #53
   0x0000fffff7f98b20:	17ffff8b	b	0xfffff7f9894c
   0x0000fffff7f98b24:	d28006c9	mov	x9, #0x36                  	// #54
   0x0000fffff7f98b28:	17ffff89	b	0xfffff7f9894c
   0x0000fffff7f98b2c:	d28006e9	mov	x9, #0x37                  	// #55
   0x0000fffff7f98b30:	17ffff87	b	0xfffff7f9894c
   0x0000fffff7f98b34:	d2800709	mov	x9, #0x38                  	// #56
   0x0000fffff7f98b38:	17ffff85	b	0xfffff7f9894c
   0x0000fffff7f98b3c:	d2800729	mov	x9, #0x39                  	// #57
   0x0000fffff7f98b40:	17ffff83	b	0xfffff7f9894c
   0x0000fffff7f98b44:	d2800749	mov	x9, #0x3a                  	// #58
   0x0000fffff7f98b48:	17ffff81	b	0xfffff7f9894c
   0x0000fffff7f98b4c:	d2800769	mov	x9, #0x3b                  	// #59
   0x0000fffff7f98b50:	17ffff7f	b	0xfffff7f9894c
   0x0000fffff7f98b54:	d2800789	mov	x9, #0x3c                  	// #60
   0x0000fffff7f98b58:	17ffff7d	b	0xfffff7f9894c
   0x0000fffff7f98b5c:	d28007a9	mov	x9, #0x3d                  	// #61
   0x0000fffff7f98b60:	17ffff7b	b	0xfffff7f9894c
   0x0000fffff7f98b64:	d28007c9	mov	x9, #0x3e                  	// #62
   0x0000fffff7f98b68:	17ffff79	b	0xfffff7f9894c
   0x0000fffff7f98b6c:	d28007e9	mov	x9, #0x3f                  	// #63
   0x0000fffff7f98b70:	17ffff77	b	0xfffff7f9894c
   0x0000fffff7f98b74:	d2800809	mov	x9, #0x40                  	// #64
   0x0000fffff7f98b78:	17ffff75	b	0xfffff7f9894c
   0x0000fffff7f98b7c:	d2800829	mov	x9, #0x41                  	// #65
   0x0000fffff7f98b80:	17ffff73	b	0xfffff7f9894c
   0x0000fffff7f98b84:	d2800849	mov	x9, #0x42                  	// #66
   0x0000fffff7f98b88:	17ffff71	b	0xfffff7f9894c
   0x0000fffff7f98b8c:	d2800869	mov	x9, #0x43                  	// #67
   0x0000fffff7f98b90:	17ffff6f	b	0xfffff7f9894c
   0x0000fffff7f98b94:	d2800889	mov	x9, #0x44                  	// #68
   0x0000fffff7f98b98:	17ffff6d	b	0xfffff7f9894c
   0x0000fffff7f98b9c:	d28008a9	mov	x9, #0x45                  	// #69
   0x0000fffff7f98ba0:	17ffff6b	b	0xfffff7f9894c
   0x0000fffff7f98ba4:	d28008c9	mov	x9, #0x46                  	// #70
   0x0000fffff7f98ba8:	17ffff69	b	0xfffff7f9894c
   0x0000fffff7f98bac:	d28008e9	mov	x9, #0x47                  	// #71
   0x0000fffff7f98bb0:	17ffff67	b	0xfffff7f9894c
   0x0000fffff7f98bb4:	d2800909	mov	x9, #0x48                  	// #72
   0x0000fffff7f98bb8:	17ffff65	b	0xfffff7f9894c
   0x0000fffff7f98bbc:	d2800929	mov	x9, #0x49                  	// #73
   0x0000fffff7f98bc0:	17ffff63	b	0xfffff7f9894c
   0x0000fffff7f98bc4:	d2800949	mov	x9, #0x4a                  	// #74
   0x0000fffff7f98bc8:	17ffff61	b	0xfffff7f9894c
   0x0000fffff7f98bcc:	d2800969	mov	x9, #0x4b                  	// #75
   0x0000fffff7f98bd0:	17ffff5f	b	0xfffff7f9894c
   0x0000fffff7f98bd4:	d2800989	mov	x9, #0x4c                  	// #76
   0x0000fffff7f98bd8:	17ffff5d	b	0xfffff7f9894c
   0x0000fffff7f98bdc:	d28009a9	mov	x9, #0x4d                  	// #77
   0x0000fffff7f98be0:	17ffff5b	b	0xfffff7f9894c
   0x0000fffff7f98be4:	d28009c9	mov	x9, #0x4e                  	// #78
   0x0000fffff7f98be8:	17ffff59	b	0xfffff7f9894c
   0x0000fffff7f98bec:	d28009e9	mov	x9, #0x4f                  	// #79
   0x0000fffff7f98bf0:	17ffff57	b	0xfffff7f9894c
   0x0000fffff7f98bf4:	d2800a09	mov	x9, #0x50                  	// #80
   0x0000fffff7f98bf8:	17ffff55	b	0xfffff7f9894c
   0x0000fffff7f98bfc:	d2800a29	mov	x9, #0x51                  	// #81
   0x0000fffff7f98c00:	17ffff53	b	0xfffff7f9894c
   0x0000fffff7f98c04:	d2800a49	mov	x9, #0x52                  	// #82
   0x0000fffff7f98c08:	17ffff51	b	0xfffff7f9894c
   0x0000fffff7f98c0c:	d2800a69	mov	x9, #0x53                  	// #83
   0x0000fffff7f98c10:	17ffff4f	b	0xfffff7f9894c
   0x0000fffff7f98c14:	d2800a89	mov	x9, #0x54                  	// #84
   0x0000fffff7f98c18:	17ffff4d	b	0xfffff7f9894c
   0x0000fffff7f98c1c:	d2800aa9	mov	x9, #0x55                  	// #85
   0x0000fffff7f98c20:	17ffff4b	b	0xfffff7f9894c
   0x0000fffff7f98c24:	d2800ac9	mov	x9, #0x56                  	// #86
   0x0000fffff7f98c28:	17ffff49	b	0xfffff7f9894c
   0x0000fffff7f98c2c:	d2800ae9	mov	x9, #0x57                  	// #87
   0x0000fffff7f98c30:	17ffff47	b	0xfffff7f9894c
   0x0000fffff7f98c34:	00000000	udf	#0
   0x0000fffff7f98c38:	00000000	udf	#0
   0x0000fffff7f98c3c:	00000000	udf	#0
   0x0000fffff7f98c40:	00000000	udf	#0
   0x0000fffff7f98c44:	00000000	udf	#0
   0x0000fffff7f98c48:	00000000	udf	#0
   0x0000fffff7f98c4c:	00000000	udf	#0
   0x0000fffff7f98c50:	00000000	udf	#0
   0x0000fffff7f98c54:	00000000	udf	#0
   0x0000fffff7f98c58:	00000000	udf	#0
   0x0000fffff7f98c5c:	00000000	udf	#0
   0x0000fffff7f98c60:	00000000	udf	#0
   0x0000fffff7f98c64:	00000000	udf	#0
   0x0000fffff7f98c68:	00000000	udf	#0
   0x0000fffff7f98c6c:	00000000	udf	#0
   0x0000fffff7f98c70:	00000000	udf	#0
   0x0000fffff7f98c74:	00000000	udf	#0
   0x0000fffff7f98c78:	00000000	udf	#0
   0x0000fffff7f98c7c:	00000000	udf	#0
   0x0000fffff7f98c80:	00000000	udf	#0
   0x0000fffff7f98c84:	00000000	udf	#0
   0x0000fffff7f98c88:	00000000	udf	#0
   0x0000fffff7f98c8c:	00000000	udf	#0
   0x0000fffff7f98c90:	00000000	udf	#0
   0x0000fffff7f98c94:	00000000	udf	#0
   0x0000fffff7f98c98:	00000000	udf	#0
   0x0000fffff7f98c9c:	00000000	udf	#0
   0x0000fffff7f98ca0:	00000000	udf	#0
   0x0000fffff7f98ca4:	00000000	udf	#0
   0x0000fffff7f98ca8:	00000000	udf	#0
   0x0000fffff7f98cac:	00000000	udf	#0
   0x0000fffff7f98cb0:	00000000	udf	#0
   0x0000fffff7f98cb4:	00000000	udf	#0
   0x0000fffff7f98cb8:	00000000	udf	#0
   0x0000fffff7f98cbc:	00000000	udf	#0
   0x0000fffff7f98cc0:	00000000	udf	#0
   0x0000fffff7f98cc4:	00000000	udf	#0
   0x0000fffff7f98cc8:	00000000	udf	#0
   0x0000fffff7f98ccc:	00000000	udf	#0
   0x0000fffff7f98cd0:	00000000	udf	#0
   0x0000fffff7f98cd4:	00000000	udf	#0
   0x0000fffff7f98cd8:	00000000	udf	#0
   0x0000fffff7f98cdc:	00000000	udf	#0
   0x0000fffff7f98ce0:	00000000	udf	#0
   0x0000fffff7f98ce4:	00000000	udf	#0
   0x0000fffff7f98ce8:	00000000	udf	#0
   0x0000fffff7f98cec:	00000000	udf	#0
   0x0000fffff7f98cf0:	00000000	udf	#0
   0x0000fffff7f98cf4:	00000000	udf	#0
   0x0000fffff7f98cf8:	00000000	udf	#0
   0x0000fffff7f98cfc:	00000000	udf	#0
   0x0000fffff7f98d00:	00000000	udf	#0
   0x0000fffff7f98d04:	00000000	udf	#0
   0x0000fffff7f98d08:	00000000	udf	#0
   0x0000fffff7f98d0c:	00000000	udf	#0
   0x0000fffff7f98d10:	00000000	udf	#0
   0x0000fffff7f98d14:	00000000	udf	#0
   0x0000fffff7f98d18:	00000000	udf	#0
   0x0000fffff7f98d1c:	00000000	udf	#0
   0x0000fffff7f98d20:	00000000	udf	#0
   0x0000fffff7f98d24:	00000000	udf	#0
   0x0000fffff7f98d28:	00000000	udf	#0
   0x0000fffff7f98d2c:	00000000	udf	#0
   0x0000fffff7f98d30:	00000000	udf	#0
   0x0000fffff7f98d34:	00000000	udf	#0
   0x0000fffff7f98d38:	00000000	udf	#0
   0x0000fffff7f98d3c:	00000000	udf	#0
   0x0000fffff7f98d40:	00000000	udf	#0
   0x0000fffff7f98d44:	00000000	udf	#0
   0x0000fffff7f98d48:	00000000	udf	#0
   0x0000fffff7f98d4c:	00000000	udf	#0
   0x0000fffff7f98d50:	00000000	udf	#0
   0x0000fffff7f98d54:	00000000	udf	#0
   0x0000fffff7f98d58:	00000000	udf	#0
   0x0000fffff7f98d5c:	00000000	udf	#0
   0x0000fffff7f98d60:	00000000	udf	#0
   0x0000fffff7f98d64:	00000000	udf	#0
   0x0000fffff7f98d68:	00000000	udf	#0
   0x0000fffff7f98d6c:	00000000	udf	#0
   0x0000fffff7f98d70:	00000000	udf	#0
   0x0000fffff7f98d74:	00000000	udf	#0
   0x0000fffff7f98d78:	00000000	udf	#0
   0x0000fffff7f98d7c:	00000000	udf	#0
   0x0000fffff7f98d80:	00000000	udf	#0
   0x0000fffff7f98d84:	00000000	udf	#0
   0x0000fffff7f98d88:	00000000	udf	#0
   0x0000fffff7f98d8c:	00000000	udf	#0
   0x0000fffff7f98d90:	00000000	udf	#0
   0x0000fffff7f98d94:	00000000	udf	#0
   0x0000fffff7f98d98:	00000000	udf	#0
   0x0000fffff7f98d9c:	00000000	udf	#0
   0x0000fffff7f98da0:	00000000	udf	#0
   0x0000fffff7f98da4:	00000000	udf	#0
   0x0000fffff7f98da8:	00000000	udf	#0
   0x0000fffff7f98dac:	00000000	udf	#0
   0x0000fffff7f98db0:	00000000	udf	#0
   0x0000fffff7f98db4:	00000000	udf	#0
   0x0000fffff7f98db8:	00000000	udf	#0
   0x0000fffff7f98dbc:	00000000	udf	#0
   0x0000fffff7f98dc0:	00000000	udf	#0
   0x0000fffff7f98dc4:	00000000	udf	#0
   0x0000fffff7f98dc8:	00000000	udf	#0
   0x0000fffff7f98dcc:	00000000	udf	#0
   0x0000fffff7f98dd0:	00000000	udf	#0
   0x0000fffff7f98dd4:	00000000	udf	#0
   0x0000fffff7f98dd8:	00000000	udf	#0
   0x0000fffff7f98ddc:	00000000	udf	#0
   0x0000fffff7f98de0:	00000000	udf	#0
   0x0000fffff7f98de4:	00000000	udf	#0
   0x0000fffff7f98de8:	00000000	udf	#0
   0x0000fffff7f98dec:	00000000	udf	#0
   0x0000fffff7f98df0:	00000000	udf	#0
   0x0000fffff7f98df4:	00000000	udf	#0
   0x0000fffff7f98df8:	00000000	udf	#0
   0x0000fffff7f98dfc:	00000000	udf	#0
   0x0000fffff7f98e00:	00000000	udf	#0
   0x0000fffff7f98e04:	00000000	udf	#0
   0x0000fffff7f98e08:	00000000	udf	#0
   0x0000fffff7f98e0c:	00000000	udf	#0
   0x0000fffff7f98e10:	00000000	udf	#0
   0x0000fffff7f98e14:	00000000	udf	#0
   0x0000fffff7f98e18:	00000000	udf	#0
   0x0000fffff7f98e1c:	00000000	udf	#0
   0x0000fffff7f98e20:	00000000	udf	#0
   0x0000fffff7f98e24:	00000000	udf	#0
   0x0000fffff7f98e28:	00000000	udf	#0
   0x0000fffff7f98e2c:	00000000	udf	#0
   0x0000fffff7f98e30:	00000000	udf	#0
   0x0000fffff7f98e34:	00000000	udf	#0
   0x0000fffff7f98e38:	00000000	udf	#0
   0x0000fffff7f98e3c:	00000000	udf	#0
   0x0000fffff7f98e40:	00000000	udf	#0
   0x0000fffff7f98e44:	00000000	udf	#0
   0x0000fffff7f98e48:	00000000	udf	#0
   0x0000fffff7f98e4c:	00000000	udf	#0
   0x0000fffff7f98e50:	00000000	udf	#0
   0x0000fffff7f98e54:	00000000	udf	#0
   0x0000fffff7f98e58:	00000000	udf	#0
   0x0000fffff7f98e5c:	00000000	udf	#0
   0x0000fffff7f98e60:	00000000	udf	#0
   0x0000fffff7f98e64:	00000000	udf	#0
   0x0000fffff7f98e68:	00000000	udf	#0
   0x0000fffff7f98e6c:	00000000	udf	#0
   0x0000fffff7f98e70:	00000000	udf	#0
   0x0000fffff7f98e74:	00000000	udf	#0
   0x0000fffff7f98e78:	00000000	udf	#0
   0x0000fffff7f98e7c:	00000000	udf	#0
   0x0000fffff7f98e80:	00000000	udf	#0
   0x0000fffff7f98e84:	00000000	udf	#0
   0x0000fffff7f98e88:	00000000	udf	#0
   0x0000fffff7f98e8c:	00000000	udf	#0
   0x0000fffff7f98e90:	00000000	udf	#0
   0x0000fffff7f98e94:	00000000	udf	#0
   0x0000fffff7f98e98:	00000000	udf	#0
   0x0000fffff7f98e9c:	00000000	udf	#0
   0x0000fffff7f98ea0:	00000000	udf	#0
   0x0000fffff7f98ea4:	00000000	udf	#0
   0x0000fffff7f98ea8:	00000000	udf	#0
   0x0000fffff7f98eac:	00000000	udf	#0
   0x0000fffff7f98eb0:	00000000	udf	#0
   0x0000fffff7f98eb4:	00000000	udf	#0
   0x0000fffff7f98eb8:	00000000	udf	#0
   0x0000fffff7f98ebc:	00000000	udf	#0
   0x0000fffff7f98ec0:	00000000	udf	#0
   0x0000fffff7f98ec4:	00000000	udf	#0
   0x0000fffff7f98ec8:	00000000	udf	#0
   0x0000fffff7f98ecc:	00000000	udf	#0
   0x0000fffff7f98ed0:	00000000	udf	#0
   0x0000fffff7f98ed4:	00000000	udf	#0
   0x0000fffff7f98ed8:	00000000	udf	#0
   0x0000fffff7f98edc:	00000000	udf	#0
   0x0000fffff7f98ee0:	00000000	udf	#0
   0x0000fffff7f98ee4:	00000000	udf	#0
   0x0000fffff7f98ee8:	00000000	udf	#0
   0x0000fffff7f98eec:	00000000	udf	#0
   0x0000fffff7f98ef0:	00000000	udf	#0
   0x0000fffff7f98ef4:	00000000	udf	#0
   0x0000fffff7f98ef8:	00000000	udf	#0
   0x0000fffff7f98efc:	00000000	udf	#0
   0x0000fffff7f98f00:	00000000	udf	#0
   0x0000fffff7f98f04:	00000000	udf	#0
   0x0000fffff7f98f08:	00000000	udf	#0
   0x0000fffff7f98f0c:	00000000	udf	#0
   0x0000fffff7f98f10:	00000000	udf	#0
   0x0000fffff7f98f14:	00000000	udf	#0
   0x0000fffff7f98f18:	00000000	udf	#0
   0x0000fffff7f98f1c:	00000000	udf	#0
   0x0000fffff7f98f20:	00000000	udf	#0
   0x0000fffff7f98f24:	00000000	udf	#0
   0x0000fffff7f98f28:	00000000	udf	#0
   0x0000fffff7f98f2c:	00000000	udf	#0
   0x0000fffff7f98f30:	00000000	udf	#0
   0x0000fffff7f98f34:	00000000	udf	#0
   0x0000fffff7f98f38:	00000000	udf	#0
   0x0000fffff7f98f3c:	00000000	udf	#0
   0x0000fffff7f98f40:	00000000	udf	#0
   0x0000fffff7f98f44:	00000000	udf	#0
   0x0000fffff7f98f48:	00000000	udf	#0
   0x0000fffff7f98f4c:	00000000	udf	#0
   0x0000fffff7f98f50:	00000000	udf	#0
   0x0000fffff7f98f54:	00000000	udf	#0
   0x0000fffff7f98f58:	00000000	udf	#0
   0x0000fffff7f98f5c:	00000000	udf	#0
   0x0000fffff7f98f60:	00000000	udf	#0
   0x0000fffff7f98f64:	00000000	udf	#0
   0x0000fffff7f98f68:	00000000	udf	#0
   0x0000fffff7f98f6c:	00000000	udf	#0
   0x0000fffff7f98f70:	00000000	udf	#0
   0x0000fffff7f98f74:	00000000	udf	#0
   0x0000fffff7f98f78:	00000000	udf	#0
   0x0000fffff7f98f7c:	00000000	udf	#0
   0x0000fffff7f98f80:	00000000	udf	#0
   0x0000fffff7f98f84:	00000000	udf	#0
   0x0000fffff7f98f88:	00000000	udf	#0
   0x0000fffff7f98f8c:	00000000	udf	#0
   0x0000fffff7f98f90:	00000000	udf	#0
   0x0000fffff7f98f94:	00000000	udf	#0
   0x0000fffff7f98f98:	00000000	udf	#0
   0x0000fffff7f98f9c:	00000000	udf	#0
   0x0000fffff7f98fa0:	00000000	udf	#0
   0x0000fffff7f98fa4:	00000000	udf	#0
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
