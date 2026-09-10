Dump of assembler code from 0xfffff7fa9000 to 0xfffff7fab000:
   0x0000fffff7fa9000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fa9004:	910003fd	mov	x29, sp
   0x0000fffff7fa9008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fa900c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fa9010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fa9014:	aa0003f3	mov	x19, x0
   0x0000fffff7fa9018:	aa0103f4	mov	x20, x1
   0x0000fffff7fa901c:	aa0203f5	mov	x21, x2
   0x0000fffff7fa9020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fa9024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fa9028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fa902c:	f90003e9	str	x9, [sp]
   0x0000fffff7fa9030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fa9034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fa9038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fa903c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fa9040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9044:	d63f0200	blr	x16
   0x0000fffff7fa9048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fa904c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fa9050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fa9054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fa9058:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa905c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9060:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9064:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9068:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fa906c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9070:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9074:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fa9078:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa907c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9080:	d63f0200	blr	x16
   0x0000fffff7fa9084:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9088:	5400df00	b.eq	0xfffff7faac68  // b.none
   0x0000fffff7fa908c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9090:	37d800e9	tbnz	w9, #27, 0xfffff7fa90ac
   0x0000fffff7fa9094:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fa9098:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa909c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa90a0:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa90a4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa90a8:	1400000e	b	0xfffff7fa90e0
   0x0000fffff7fa90ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa90b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa90b4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa90b8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa90bc:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fa90c0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa90c4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa90c8:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7fa90cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa90d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa90d4:	d63f0200	blr	x16
   0x0000fffff7fa90d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa90dc:	5400dca0	b.eq	0xfffff7faac70  // b.none
   0x0000fffff7fa90e0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa90e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa90e8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa90ec:	aa1503e2	mov	x2, x21
   0x0000fffff7fa90f0:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fa90f4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa90f8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa90fc:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fa9100:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9104:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9108:	d63f0200	blr	x16
   0x0000fffff7fa910c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9110:	5400db40	b.eq	0xfffff7faac78  // b.none
   0x0000fffff7fa9114:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9118:	37d800e9	tbnz	w9, #27, 0xfffff7fa9134
   0x0000fffff7fa911c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fa9120:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9124:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9128:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa912c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa9130:	1400000e	b	0xfffff7fa9168
   0x0000fffff7fa9134:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9138:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa913c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9140:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9144:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7fa9148:	aa1403e4	mov	x4, x20
   0x0000fffff7fa914c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9150:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7fa9154:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9158:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa915c:	d63f0200	blr	x16
   0x0000fffff7fa9160:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9164:	5400d8e0	b.eq	0xfffff7faac80  // b.none
   0x0000fffff7fa9168:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa916c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9170:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9174:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9178:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7fa917c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9180:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9184:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fa9188:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa918c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9190:	d63f0200	blr	x16
   0x0000fffff7fa9194:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9198:	5400d780	b.eq	0xfffff7faac88  // b.none
   0x0000fffff7fa919c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa91a0:	37d806a9	tbnz	w9, #27, 0xfffff7fa9274
   0x0000fffff7fa91a4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa91a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa91ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa91b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa91b4:	540001c1	b.ne	0xfffff7fa91ec  // b.any
   0x0000fffff7fa91b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa91bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa91c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa91c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa91c8:	54000121	b.ne	0xfffff7fa91ec  // b.any
   0x0000fffff7fa91cc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa91d0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa91d4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa91d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa91dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa91e0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa91e4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa91e8:	14000030	b	0xfffff7fa92a8
   0x0000fffff7fa91ec:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa91f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa91f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa91f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa91fc:	54000120	b.eq	0xfffff7fa9220  // b.none
   0x0000fffff7fa9200:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9204:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9208:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa920c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9210:	54000321	b.ne	0xfffff7fa9274  // b.any
   0x0000fffff7fa9214:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa9218:	9e620120	scvtf	d0, x9
   0x0000fffff7fa921c:	14000002	b	0xfffff7fa9224
   0x0000fffff7fa9220:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa9224:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9228:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa922c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9230:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9234:	54000120	b.eq	0xfffff7fa9258  // b.none
   0x0000fffff7fa9238:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa923c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9240:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9244:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9248:	54000161	b.ne	0xfffff7fa9274  // b.any
   0x0000fffff7fa924c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa9250:	9e620121	scvtf	d1, x9
   0x0000fffff7fa9254:	14000002	b	0xfffff7fa925c
   0x0000fffff7fa9258:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa925c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa9260:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa9264:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9268:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa926c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa9270:	17ffffde	b	0xfffff7fa91e8
   0x0000fffff7fa9274:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9278:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa927c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9280:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9284:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fa9288:	aa1403e4	mov	x4, x20
   0x0000fffff7fa928c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9290:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fa9294:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9298:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa929c:	d63f0200	blr	x16
   0x0000fffff7fa92a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa92a4:	5400cf60	b.eq	0xfffff7faac90  // b.none
   0x0000fffff7fa92a8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa92ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa92b0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa92b4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa92b8:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fa92bc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa92c0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa92c4:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fa92c8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa92cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa92d0:	d63f0200	blr	x16
   0x0000fffff7fa92d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa92d8:	5400ce00	b.eq	0xfffff7faac98  // b.none
   0x0000fffff7fa92dc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa92e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa92e4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa92e8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa92ec:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fa92f0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa92f4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa92f8:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fa92fc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9300:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9304:	d63f0200	blr	x16
   0x0000fffff7fa9308:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa930c:	5400cca0	b.eq	0xfffff7faaca0  // b.none
   0x0000fffff7fa9310:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa9314:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa9318:	540004a0	b.eq	0xfffff7fa93ac  // b.none
   0x0000fffff7fa931c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa9320:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa9324:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa9328:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa932c:	54000400	b.eq	0xfffff7fa93ac  // b.none
   0x0000fffff7fa9330:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa9334:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa9338:	36d801d1	tbz	w17, #27, 0xfffff7fa9370
   0x0000fffff7fa933c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa9340:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa9344:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa9348:	54000321	b.ne	0xfffff7fa93ac  // b.any
   0x0000fffff7fa934c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa9350:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9354:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa9358:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa935c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9360:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa9364:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa9368:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa936c:	54000209	b.ls	0xfffff7fa93ac  // b.plast
   0x0000fffff7fa9370:	36d8008d	tbz	w13, #27, 0xfffff7fa9380
   0x0000fffff7fa9374:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa9378:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa937c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa9380:	36d80091	tbz	w17, #27, 0xfffff7fa9390
   0x0000fffff7fa9384:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9388:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa938c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa9390:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa9394:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa9398:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa939c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa93a0:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa93a4:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa93a8:	1400000e	b	0xfffff7fa93e0
   0x0000fffff7fa93ac:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa93b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa93b4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa93b8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa93bc:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fa93c0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa93c4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa93c8:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fa93cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa93d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa93d4:	d63f0200	blr	x16
   0x0000fffff7fa93d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa93dc:	5400c660	b.eq	0xfffff7faaca8  // b.none
   0x0000fffff7fa93e0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa93e4:	37d806a9	tbnz	w9, #27, 0xfffff7fa94b8
   0x0000fffff7fa93e8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa93ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa93f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa93f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa93f8:	540001c1	b.ne	0xfffff7fa9430  // b.any
   0x0000fffff7fa93fc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9400:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9404:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9408:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa940c:	54000121	b.ne	0xfffff7fa9430  // b.any
   0x0000fffff7fa9410:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa9414:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa9418:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa941c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9420:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9424:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa9428:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa942c:	14000030	b	0xfffff7fa94ec
   0x0000fffff7fa9430:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9434:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9438:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa943c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9440:	54000120	b.eq	0xfffff7fa9464  // b.none
   0x0000fffff7fa9444:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9448:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa944c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9450:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9454:	54000321	b.ne	0xfffff7fa94b8  // b.any
   0x0000fffff7fa9458:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa945c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa9460:	14000002	b	0xfffff7fa9468
   0x0000fffff7fa9464:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa9468:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa946c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9470:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9474:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9478:	54000120	b.eq	0xfffff7fa949c  // b.none
   0x0000fffff7fa947c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9480:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9484:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9488:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa948c:	54000161	b.ne	0xfffff7fa94b8  // b.any
   0x0000fffff7fa9490:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa9494:	9e620121	scvtf	d1, x9
   0x0000fffff7fa9498:	14000002	b	0xfffff7fa94a0
   0x0000fffff7fa949c:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa94a0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa94a4:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa94a8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa94ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa94b0:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa94b4:	17ffffde	b	0xfffff7fa942c
   0x0000fffff7fa94b8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa94bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa94c0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa94c4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa94c8:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fa94cc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa94d0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa94d4:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fa94d8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa94dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa94e0:	d63f0200	blr	x16
   0x0000fffff7fa94e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa94e8:	5400be40	b.eq	0xfffff7faacb0  // b.none
   0x0000fffff7fa94ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa94f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa94f4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa94f8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa94fc:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fa9500:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9504:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9508:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fa950c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9510:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9514:	d63f0200	blr	x16
   0x0000fffff7fa9518:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa951c:	5400bce0	b.eq	0xfffff7faacb8  // b.none
   0x0000fffff7fa9520:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa9524:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9528:	aa1303e1	mov	x1, x19
   0x0000fffff7fa952c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9530:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fa9534:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9538:	aa1603e5	mov	x5, x22
   0x0000fffff7fa953c:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fa9540:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9544:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9548:	d63f0200	blr	x16
   0x0000fffff7fa954c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9550:	5400bb80	b.eq	0xfffff7faacc0  // b.none
   0x0000fffff7fa9554:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa9558:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa955c:	540004a0	b.eq	0xfffff7fa95f0  // b.none
   0x0000fffff7fa9560:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa9564:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa9568:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa956c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa9570:	54000400	b.eq	0xfffff7fa95f0  // b.none
   0x0000fffff7fa9574:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa9578:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa957c:	36d801d1	tbz	w17, #27, 0xfffff7fa95b4
   0x0000fffff7fa9580:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa9584:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa9588:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa958c:	54000321	b.ne	0xfffff7fa95f0  // b.any
   0x0000fffff7fa9590:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa9594:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9598:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa959c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa95a0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa95a4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa95a8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa95ac:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa95b0:	54000209	b.ls	0xfffff7fa95f0  // b.plast
   0x0000fffff7fa95b4:	36d8008d	tbz	w13, #27, 0xfffff7fa95c4
   0x0000fffff7fa95b8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa95bc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa95c0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa95c4:	36d80091	tbz	w17, #27, 0xfffff7fa95d4
   0x0000fffff7fa95c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa95cc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa95d0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa95d4:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa95d8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa95dc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa95e0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa95e4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa95e8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa95ec:	1400000e	b	0xfffff7fa9624
   0x0000fffff7fa95f0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa95f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa95f8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa95fc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9600:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fa9604:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9608:	aa1603e5	mov	x5, x22
   0x0000fffff7fa960c:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fa9610:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9614:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9618:	d63f0200	blr	x16
   0x0000fffff7fa961c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9620:	5400b540	b.eq	0xfffff7faacc8  // b.none
   0x0000fffff7fa9624:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9628:	37d806a9	tbnz	w9, #27, 0xfffff7fa96fc
   0x0000fffff7fa962c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9630:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9634:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9638:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa963c:	540001c1	b.ne	0xfffff7fa9674  // b.any
   0x0000fffff7fa9640:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9644:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9648:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa964c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9650:	54000121	b.ne	0xfffff7fa9674  // b.any
   0x0000fffff7fa9654:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa9658:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa965c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa9660:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9664:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9668:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa966c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa9670:	14000030	b	0xfffff7fa9730
   0x0000fffff7fa9674:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9678:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa967c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9680:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9684:	54000120	b.eq	0xfffff7fa96a8  // b.none
   0x0000fffff7fa9688:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa968c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9690:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9694:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9698:	54000321	b.ne	0xfffff7fa96fc  // b.any
   0x0000fffff7fa969c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa96a0:	9e620120	scvtf	d0, x9
   0x0000fffff7fa96a4:	14000002	b	0xfffff7fa96ac
   0x0000fffff7fa96a8:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa96ac:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa96b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa96b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa96b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa96bc:	54000120	b.eq	0xfffff7fa96e0  // b.none
   0x0000fffff7fa96c0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa96c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa96c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa96cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa96d0:	54000161	b.ne	0xfffff7fa96fc  // b.any
   0x0000fffff7fa96d4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa96d8:	9e620121	scvtf	d1, x9
   0x0000fffff7fa96dc:	14000002	b	0xfffff7fa96e4
   0x0000fffff7fa96e0:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa96e4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa96e8:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa96ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa96f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa96f4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa96f8:	17ffffde	b	0xfffff7fa9670
   0x0000fffff7fa96fc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9700:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9704:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9708:	aa1503e2	mov	x2, x21
   0x0000fffff7fa970c:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fa9710:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9714:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9718:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fa971c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9720:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9724:	d63f0200	blr	x16
   0x0000fffff7fa9728:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa972c:	5400ad20	b.eq	0xfffff7faacd0  // b.none
   0x0000fffff7fa9730:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9734:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9738:	aa1303e1	mov	x1, x19
   0x0000fffff7fa973c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9740:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fa9744:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9748:	aa1603e5	mov	x5, x22
   0x0000fffff7fa974c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fa9750:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9754:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9758:	d63f0200	blr	x16
   0x0000fffff7fa975c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9760:	5400abc0	b.eq	0xfffff7faacd8  // b.none
   0x0000fffff7fa9764:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa9768:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa976c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9770:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9774:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fa9778:	aa1403e4	mov	x4, x20
   0x0000fffff7fa977c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9780:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fa9784:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9788:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa978c:	d63f0200	blr	x16
   0x0000fffff7fa9790:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9794:	5400aa60	b.eq	0xfffff7faace0  // b.none
   0x0000fffff7fa9798:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa979c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa97a0:	540004a0	b.eq	0xfffff7fa9834  // b.none
   0x0000fffff7fa97a4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa97a8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa97ac:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa97b0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa97b4:	54000400	b.eq	0xfffff7fa9834  // b.none
   0x0000fffff7fa97b8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa97bc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa97c0:	36d801d1	tbz	w17, #27, 0xfffff7fa97f8
   0x0000fffff7fa97c4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa97c8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa97cc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa97d0:	54000321	b.ne	0xfffff7fa9834  // b.any
   0x0000fffff7fa97d4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa97d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa97dc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa97e0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa97e4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa97e8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa97ec:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa97f0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa97f4:	54000209	b.ls	0xfffff7fa9834  // b.plast
   0x0000fffff7fa97f8:	36d8008d	tbz	w13, #27, 0xfffff7fa9808
   0x0000fffff7fa97fc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa9800:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa9804:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa9808:	36d80091	tbz	w17, #27, 0xfffff7fa9818
   0x0000fffff7fa980c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9810:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa9814:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa9818:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa981c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa9820:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa9824:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa9828:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa982c:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa9830:	1400000e	b	0xfffff7fa9868
   0x0000fffff7fa9834:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa9838:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa983c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9840:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9844:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fa9848:	aa1403e4	mov	x4, x20
   0x0000fffff7fa984c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9850:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fa9854:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9858:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa985c:	d63f0200	blr	x16
   0x0000fffff7fa9860:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9864:	5400a420	b.eq	0xfffff7faace8  // b.none
   0x0000fffff7fa9868:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa986c:	37d806a9	tbnz	w9, #27, 0xfffff7fa9940
   0x0000fffff7fa9870:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9874:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9878:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa987c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9880:	540001c1	b.ne	0xfffff7fa98b8  // b.any
   0x0000fffff7fa9884:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9888:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa988c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9890:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9894:	54000121	b.ne	0xfffff7fa98b8  // b.any
   0x0000fffff7fa9898:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa989c:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa98a0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa98a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa98a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa98ac:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa98b0:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa98b4:	14000030	b	0xfffff7fa9974
   0x0000fffff7fa98b8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa98bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa98c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa98c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa98c8:	54000120	b.eq	0xfffff7fa98ec  // b.none
   0x0000fffff7fa98cc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa98d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa98d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa98d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa98dc:	54000321	b.ne	0xfffff7fa9940  // b.any
   0x0000fffff7fa98e0:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa98e4:	9e620120	scvtf	d0, x9
   0x0000fffff7fa98e8:	14000002	b	0xfffff7fa98f0
   0x0000fffff7fa98ec:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa98f0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa98f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa98f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa98fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9900:	54000120	b.eq	0xfffff7fa9924  // b.none
   0x0000fffff7fa9904:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9908:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa990c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9910:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9914:	54000161	b.ne	0xfffff7fa9940  // b.any
   0x0000fffff7fa9918:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa991c:	9e620121	scvtf	d1, x9
   0x0000fffff7fa9920:	14000002	b	0xfffff7fa9928
   0x0000fffff7fa9924:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa9928:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa992c:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa9930:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9934:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9938:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa993c:	17ffffde	b	0xfffff7fa98b4
   0x0000fffff7fa9940:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9944:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9948:	aa1303e1	mov	x1, x19
   0x0000fffff7fa994c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9950:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fa9954:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9958:	aa1603e5	mov	x5, x22
   0x0000fffff7fa995c:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fa9960:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9964:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9968:	d63f0200	blr	x16
   0x0000fffff7fa996c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9970:	54009c00	b.eq	0xfffff7faacf0  // b.none
   0x0000fffff7fa9974:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9978:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa997c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9980:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9984:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fa9988:	aa1403e4	mov	x4, x20
   0x0000fffff7fa998c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9990:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fa9994:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9998:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa999c:	d63f0200	blr	x16
   0x0000fffff7fa99a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa99a4:	54009aa0	b.eq	0xfffff7faacf8  // b.none
   0x0000fffff7fa99a8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa99ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa99b0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa99b4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa99b8:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fa99bc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa99c0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa99c4:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fa99c8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa99cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa99d0:	d63f0200	blr	x16
   0x0000fffff7fa99d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa99d8:	54009940	b.eq	0xfffff7faad00  // b.none
   0x0000fffff7fa99dc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa99e0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa99e4:	540004a0	b.eq	0xfffff7fa9a78  // b.none
   0x0000fffff7fa99e8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa99ec:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa99f0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa99f4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa99f8:	54000400	b.eq	0xfffff7fa9a78  // b.none
   0x0000fffff7fa99fc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa9a00:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa9a04:	36d801d1	tbz	w17, #27, 0xfffff7fa9a3c
   0x0000fffff7fa9a08:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa9a0c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa9a10:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa9a14:	54000321	b.ne	0xfffff7fa9a78  // b.any
   0x0000fffff7fa9a18:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa9a1c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9a20:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa9a24:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa9a28:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9a2c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa9a30:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa9a34:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa9a38:	54000209	b.ls	0xfffff7fa9a78  // b.plast
   0x0000fffff7fa9a3c:	36d8008d	tbz	w13, #27, 0xfffff7fa9a4c
   0x0000fffff7fa9a40:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa9a44:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa9a48:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa9a4c:	36d80091	tbz	w17, #27, 0xfffff7fa9a5c
   0x0000fffff7fa9a50:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9a54:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa9a58:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa9a5c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa9a60:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa9a64:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa9a68:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa9a6c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa9a70:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa9a74:	1400000e	b	0xfffff7fa9aac
   0x0000fffff7fa9a78:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa9a7c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9a80:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9a84:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9a88:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fa9a8c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9a90:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9a94:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fa9a98:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9a9c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9aa0:	d63f0200	blr	x16
   0x0000fffff7fa9aa4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9aa8:	54009300	b.eq	0xfffff7faad08  // b.none
   0x0000fffff7fa9aac:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9ab0:	37d806a9	tbnz	w9, #27, 0xfffff7fa9b84
   0x0000fffff7fa9ab4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9ab8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9abc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9ac0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9ac4:	540001c1	b.ne	0xfffff7fa9afc  // b.any
   0x0000fffff7fa9ac8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9acc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9ad0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9ad4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9ad8:	54000121	b.ne	0xfffff7fa9afc  // b.any
   0x0000fffff7fa9adc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa9ae0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa9ae4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa9ae8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9aec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9af0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa9af4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa9af8:	14000030	b	0xfffff7fa9bb8
   0x0000fffff7fa9afc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9b00:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9b04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9b08:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9b0c:	54000120	b.eq	0xfffff7fa9b30  // b.none
   0x0000fffff7fa9b10:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9b14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9b18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9b1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9b20:	54000321	b.ne	0xfffff7fa9b84  // b.any
   0x0000fffff7fa9b24:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa9b28:	9e620120	scvtf	d0, x9
   0x0000fffff7fa9b2c:	14000002	b	0xfffff7fa9b34
   0x0000fffff7fa9b30:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa9b34:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9b38:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9b3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9b40:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9b44:	54000120	b.eq	0xfffff7fa9b68  // b.none
   0x0000fffff7fa9b48:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9b4c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9b50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9b54:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9b58:	54000161	b.ne	0xfffff7fa9b84  // b.any
   0x0000fffff7fa9b5c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa9b60:	9e620121	scvtf	d1, x9
   0x0000fffff7fa9b64:	14000002	b	0xfffff7fa9b6c
   0x0000fffff7fa9b68:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa9b6c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa9b70:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa9b74:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9b78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9b7c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa9b80:	17ffffde	b	0xfffff7fa9af8
   0x0000fffff7fa9b84:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9b88:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9b8c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9b90:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9b94:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fa9b98:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9b9c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9ba0:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fa9ba4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9ba8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9bac:	d63f0200	blr	x16
   0x0000fffff7fa9bb0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9bb4:	54008ae0	b.eq	0xfffff7faad10  // b.none
   0x0000fffff7fa9bb8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9bbc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9bc0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9bc4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9bc8:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fa9bcc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9bd0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9bd4:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fa9bd8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9bdc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9be0:	d63f0200	blr	x16
   0x0000fffff7fa9be4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9be8:	54008980	b.eq	0xfffff7faad18  // b.none
   0x0000fffff7fa9bec:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa9bf0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9bf4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9bf8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9bfc:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fa9c00:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9c04:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9c08:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fa9c0c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9c10:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9c14:	d63f0200	blr	x16
   0x0000fffff7fa9c18:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9c1c:	54008820	b.eq	0xfffff7faad20  // b.none
   0x0000fffff7fa9c20:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa9c24:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa9c28:	540004a0	b.eq	0xfffff7fa9cbc  // b.none
   0x0000fffff7fa9c2c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa9c30:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa9c34:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa9c38:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa9c3c:	54000400	b.eq	0xfffff7fa9cbc  // b.none
   0x0000fffff7fa9c40:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa9c44:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa9c48:	36d801d1	tbz	w17, #27, 0xfffff7fa9c80
   0x0000fffff7fa9c4c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa9c50:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa9c54:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa9c58:	54000321	b.ne	0xfffff7fa9cbc  // b.any
   0x0000fffff7fa9c5c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa9c60:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9c64:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa9c68:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa9c6c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9c70:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa9c74:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa9c78:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa9c7c:	54000209	b.ls	0xfffff7fa9cbc  // b.plast
   0x0000fffff7fa9c80:	36d8008d	tbz	w13, #27, 0xfffff7fa9c90
   0x0000fffff7fa9c84:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa9c88:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa9c8c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa9c90:	36d80091	tbz	w17, #27, 0xfffff7fa9ca0
   0x0000fffff7fa9c94:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9c98:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa9c9c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa9ca0:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa9ca4:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa9ca8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa9cac:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa9cb0:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa9cb4:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa9cb8:	1400000e	b	0xfffff7fa9cf0
   0x0000fffff7fa9cbc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa9cc0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9cc4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9cc8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9ccc:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fa9cd0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9cd4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9cd8:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fa9cdc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9ce0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9ce4:	d63f0200	blr	x16
   0x0000fffff7fa9ce8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9cec:	540081e0	b.eq	0xfffff7faad28  // b.none
   0x0000fffff7fa9cf0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9cf4:	37d806a9	tbnz	w9, #27, 0xfffff7fa9dc8
   0x0000fffff7fa9cf8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9cfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9d00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9d04:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9d08:	540001c1	b.ne	0xfffff7fa9d40  // b.any
   0x0000fffff7fa9d0c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9d10:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9d14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9d18:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9d1c:	54000121	b.ne	0xfffff7fa9d40  // b.any
   0x0000fffff7fa9d20:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa9d24:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa9d28:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa9d2c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9d30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9d34:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa9d38:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa9d3c:	14000030	b	0xfffff7fa9dfc
   0x0000fffff7fa9d40:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9d44:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9d48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9d4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9d50:	54000120	b.eq	0xfffff7fa9d74  // b.none
   0x0000fffff7fa9d54:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9d58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9d5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9d60:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9d64:	54000321	b.ne	0xfffff7fa9dc8  // b.any
   0x0000fffff7fa9d68:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa9d6c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa9d70:	14000002	b	0xfffff7fa9d78
   0x0000fffff7fa9d74:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa9d78:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9d7c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9d80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9d84:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9d88:	54000120	b.eq	0xfffff7fa9dac  // b.none
   0x0000fffff7fa9d8c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9d90:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9d94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9d98:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9d9c:	54000161	b.ne	0xfffff7fa9dc8  // b.any
   0x0000fffff7fa9da0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa9da4:	9e620121	scvtf	d1, x9
   0x0000fffff7fa9da8:	14000002	b	0xfffff7fa9db0
   0x0000fffff7fa9dac:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa9db0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa9db4:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa9db8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9dbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9dc0:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa9dc4:	17ffffde	b	0xfffff7fa9d3c
   0x0000fffff7fa9dc8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9dcc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9dd0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9dd4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9dd8:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fa9ddc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9de0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9de4:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fa9de8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9dec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9df0:	d63f0200	blr	x16
   0x0000fffff7fa9df4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9df8:	540079c0	b.eq	0xfffff7faad30  // b.none
   0x0000fffff7fa9dfc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9e00:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9e04:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9e08:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9e0c:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fa9e10:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9e14:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9e18:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fa9e1c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9e20:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9e24:	d63f0200	blr	x16
   0x0000fffff7fa9e28:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9e2c:	54007860	b.eq	0xfffff7faad38  // b.none
   0x0000fffff7fa9e30:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa9e34:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9e38:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9e3c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9e40:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fa9e44:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9e48:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9e4c:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fa9e50:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9e54:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9e58:	d63f0200	blr	x16
   0x0000fffff7fa9e5c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9e60:	54007700	b.eq	0xfffff7faad40  // b.none
   0x0000fffff7fa9e64:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa9e68:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa9e6c:	540004a0	b.eq	0xfffff7fa9f00  // b.none
   0x0000fffff7fa9e70:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa9e74:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa9e78:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa9e7c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa9e80:	54000400	b.eq	0xfffff7fa9f00  // b.none
   0x0000fffff7fa9e84:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa9e88:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa9e8c:	36d801d1	tbz	w17, #27, 0xfffff7fa9ec4
   0x0000fffff7fa9e90:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa9e94:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa9e98:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa9e9c:	54000321	b.ne	0xfffff7fa9f00  // b.any
   0x0000fffff7fa9ea0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa9ea4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9ea8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa9eac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa9eb0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9eb4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa9eb8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa9ebc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa9ec0:	54000209	b.ls	0xfffff7fa9f00  // b.plast
   0x0000fffff7fa9ec4:	36d8008d	tbz	w13, #27, 0xfffff7fa9ed4
   0x0000fffff7fa9ec8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa9ecc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa9ed0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa9ed4:	36d80091	tbz	w17, #27, 0xfffff7fa9ee4
   0x0000fffff7fa9ed8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9edc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa9ee0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa9ee4:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa9ee8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa9eec:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa9ef0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa9ef4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa9ef8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa9efc:	1400000e	b	0xfffff7fa9f34
   0x0000fffff7fa9f00:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa9f04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9f08:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9f0c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9f10:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fa9f14:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9f18:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9f1c:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fa9f20:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9f24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9f28:	d63f0200	blr	x16
   0x0000fffff7fa9f2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9f30:	540070c0	b.eq	0xfffff7faad48  // b.none
   0x0000fffff7fa9f34:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9f38:	37d806a9	tbnz	w9, #27, 0xfffff7faa00c
   0x0000fffff7fa9f3c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9f40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9f44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9f48:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9f4c:	540001c1	b.ne	0xfffff7fa9f84  // b.any
   0x0000fffff7fa9f50:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9f54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9f58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9f5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9f60:	54000121	b.ne	0xfffff7fa9f84  // b.any
   0x0000fffff7fa9f64:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa9f68:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa9f6c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa9f70:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9f74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9f78:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa9f7c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa9f80:	14000030	b	0xfffff7faa040
   0x0000fffff7fa9f84:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9f88:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9f8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9f90:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9f94:	54000120	b.eq	0xfffff7fa9fb8  // b.none
   0x0000fffff7fa9f98:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9f9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9fa0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9fa4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9fa8:	54000321	b.ne	0xfffff7faa00c  // b.any
   0x0000fffff7fa9fac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa9fb0:	9e620120	scvtf	d0, x9
   0x0000fffff7fa9fb4:	14000002	b	0xfffff7fa9fbc
   0x0000fffff7fa9fb8:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa9fbc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9fc0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9fc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9fc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9fcc:	54000120	b.eq	0xfffff7fa9ff0  // b.none
   0x0000fffff7fa9fd0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9fd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9fd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9fdc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9fe0:	54000161	b.ne	0xfffff7faa00c  // b.any
   0x0000fffff7fa9fe4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa9fe8:	9e620121	scvtf	d1, x9
   0x0000fffff7fa9fec:	14000002	b	0xfffff7fa9ff4
   0x0000fffff7fa9ff0:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa9ff4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa9ff8:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa9ffc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa000:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa004:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faa008:	17ffffde	b	0xfffff7fa9f80
   0x0000fffff7faa00c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa010:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa014:	aa1303e1	mov	x1, x19
   0x0000fffff7faa018:	aa1503e2	mov	x2, x21
   0x0000fffff7faa01c:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7faa020:	aa1403e4	mov	x4, x20
   0x0000fffff7faa024:	aa1603e5	mov	x5, x22
   0x0000fffff7faa028:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7faa02c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa030:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa034:	d63f0200	blr	x16
   0x0000fffff7faa038:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa03c:	540068a0	b.eq	0xfffff7faad50  // b.none
   0x0000fffff7faa040:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa044:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa048:	aa1303e1	mov	x1, x19
   0x0000fffff7faa04c:	aa1503e2	mov	x2, x21
   0x0000fffff7faa050:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7faa054:	aa1403e4	mov	x4, x20
   0x0000fffff7faa058:	aa1603e5	mov	x5, x22
   0x0000fffff7faa05c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7faa060:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa064:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa068:	d63f0200	blr	x16
   0x0000fffff7faa06c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa070:	54006740	b.eq	0xfffff7faad58  // b.none
   0x0000fffff7faa074:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faa078:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa07c:	aa1303e1	mov	x1, x19
   0x0000fffff7faa080:	aa1503e2	mov	x2, x21
   0x0000fffff7faa084:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7faa088:	aa1403e4	mov	x4, x20
   0x0000fffff7faa08c:	aa1603e5	mov	x5, x22
   0x0000fffff7faa090:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7faa094:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa098:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa09c:	d63f0200	blr	x16
   0x0000fffff7faa0a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa0a4:	540065e0	b.eq	0xfffff7faad60  // b.none
   0x0000fffff7faa0a8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faa0ac:	f100017f	cmp	x11, #0x0
   0x0000fffff7faa0b0:	540004a0	b.eq	0xfffff7faa144  // b.none
   0x0000fffff7faa0b4:	b940016d	ldr	w13, [x11]
   0x0000fffff7faa0b8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faa0bc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faa0c0:	eb0901bf	cmp	x13, x9
   0x0000fffff7faa0c4:	54000400	b.eq	0xfffff7faa144  // b.none
   0x0000fffff7faa0c8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faa0cc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faa0d0:	36d801d1	tbz	w17, #27, 0xfffff7faa108
   0x0000fffff7faa0d4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa0d8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa0dc:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa0e0:	54000321	b.ne	0xfffff7faa144  // b.any
   0x0000fffff7faa0e4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faa0e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa0ec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faa0f0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faa0f4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faa0f8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faa0fc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faa100:	f100055f	cmp	x10, #0x1
   0x0000fffff7faa104:	54000209	b.ls	0xfffff7faa144  // b.plast
   0x0000fffff7faa108:	36d8008d	tbz	w13, #27, 0xfffff7faa118
   0x0000fffff7faa10c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faa110:	91000529	add	x9, x9, #0x1
   0x0000fffff7faa114:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faa118:	36d80091	tbz	w17, #27, 0xfffff7faa128
   0x0000fffff7faa11c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa120:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faa124:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faa128:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7faa12c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faa130:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faa134:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faa138:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faa13c:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faa140:	1400000e	b	0xfffff7faa178
   0x0000fffff7faa144:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faa148:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa14c:	aa1303e1	mov	x1, x19
   0x0000fffff7faa150:	aa1503e2	mov	x2, x21
   0x0000fffff7faa154:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7faa158:	aa1403e4	mov	x4, x20
   0x0000fffff7faa15c:	aa1603e5	mov	x5, x22
   0x0000fffff7faa160:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7faa164:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa168:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa16c:	d63f0200	blr	x16
   0x0000fffff7faa170:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa174:	54005fa0	b.eq	0xfffff7faad68  // b.none
   0x0000fffff7faa178:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa17c:	37d806a9	tbnz	w9, #27, 0xfffff7faa250
   0x0000fffff7faa180:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa184:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa188:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa18c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa190:	540001c1	b.ne	0xfffff7faa1c8  // b.any
   0x0000fffff7faa194:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa198:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa19c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa1a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa1a4:	54000121	b.ne	0xfffff7faa1c8  // b.any
   0x0000fffff7faa1a8:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faa1ac:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7faa1b0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faa1b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa1b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa1bc:	f9001669	str	x9, [x19, #40]
   0x0000fffff7faa1c0:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faa1c4:	14000030	b	0xfffff7faa284
   0x0000fffff7faa1c8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa1cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa1d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa1d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa1d8:	54000120	b.eq	0xfffff7faa1fc  // b.none
   0x0000fffff7faa1dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa1e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa1e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa1e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa1ec:	54000321	b.ne	0xfffff7faa250  // b.any
   0x0000fffff7faa1f0:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faa1f4:	9e620120	scvtf	d0, x9
   0x0000fffff7faa1f8:	14000002	b	0xfffff7faa200
   0x0000fffff7faa1fc:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7faa200:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa204:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa208:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa20c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa210:	54000120	b.eq	0xfffff7faa234  // b.none
   0x0000fffff7faa214:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa218:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa21c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa220:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa224:	54000161	b.ne	0xfffff7faa250  // b.any
   0x0000fffff7faa228:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faa22c:	9e620121	scvtf	d1, x9
   0x0000fffff7faa230:	14000002	b	0xfffff7faa238
   0x0000fffff7faa234:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7faa238:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faa23c:	fd001660	str	d0, [x19, #40]
   0x0000fffff7faa240:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa244:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa248:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faa24c:	17ffffde	b	0xfffff7faa1c4
   0x0000fffff7faa250:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa254:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa258:	aa1303e1	mov	x1, x19
   0x0000fffff7faa25c:	aa1503e2	mov	x2, x21
   0x0000fffff7faa260:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7faa264:	aa1403e4	mov	x4, x20
   0x0000fffff7faa268:	aa1603e5	mov	x5, x22
   0x0000fffff7faa26c:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7faa270:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa274:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa278:	d63f0200	blr	x16
   0x0000fffff7faa27c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa280:	54005780	b.eq	0xfffff7faad70  // b.none
   0x0000fffff7faa284:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa288:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa28c:	aa1303e1	mov	x1, x19
   0x0000fffff7faa290:	aa1503e2	mov	x2, x21
   0x0000fffff7faa294:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7faa298:	aa1403e4	mov	x4, x20
   0x0000fffff7faa29c:	aa1603e5	mov	x5, x22
   0x0000fffff7faa2a0:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7faa2a4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa2a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa2ac:	d63f0200	blr	x16
   0x0000fffff7faa2b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa2b4:	54005620	b.eq	0xfffff7faad78  // b.none
   0x0000fffff7faa2b8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faa2bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa2c0:	aa1303e1	mov	x1, x19
   0x0000fffff7faa2c4:	aa1503e2	mov	x2, x21
   0x0000fffff7faa2c8:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7faa2cc:	aa1403e4	mov	x4, x20
   0x0000fffff7faa2d0:	aa1603e5	mov	x5, x22
   0x0000fffff7faa2d4:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7faa2d8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa2dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa2e0:	d63f0200	blr	x16
   0x0000fffff7faa2e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa2e8:	540054c0	b.eq	0xfffff7faad80  // b.none
   0x0000fffff7faa2ec:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faa2f0:	f100017f	cmp	x11, #0x0
   0x0000fffff7faa2f4:	540004a0	b.eq	0xfffff7faa388  // b.none
   0x0000fffff7faa2f8:	b940016d	ldr	w13, [x11]
   0x0000fffff7faa2fc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faa300:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faa304:	eb0901bf	cmp	x13, x9
   0x0000fffff7faa308:	54000400	b.eq	0xfffff7faa388  // b.none
   0x0000fffff7faa30c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faa310:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faa314:	36d801d1	tbz	w17, #27, 0xfffff7faa34c
   0x0000fffff7faa318:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa31c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa320:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa324:	54000321	b.ne	0xfffff7faa388  // b.any
   0x0000fffff7faa328:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faa32c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa330:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faa334:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faa338:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faa33c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faa340:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faa344:	f100055f	cmp	x10, #0x1
   0x0000fffff7faa348:	54000209	b.ls	0xfffff7faa388  // b.plast
   0x0000fffff7faa34c:	36d8008d	tbz	w13, #27, 0xfffff7faa35c
   0x0000fffff7faa350:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faa354:	91000529	add	x9, x9, #0x1
   0x0000fffff7faa358:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faa35c:	36d80091	tbz	w17, #27, 0xfffff7faa36c
   0x0000fffff7faa360:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa364:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faa368:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faa36c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7faa370:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faa374:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faa378:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faa37c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faa380:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faa384:	1400000e	b	0xfffff7faa3bc
   0x0000fffff7faa388:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faa38c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa390:	aa1303e1	mov	x1, x19
   0x0000fffff7faa394:	aa1503e2	mov	x2, x21
   0x0000fffff7faa398:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7faa39c:	aa1403e4	mov	x4, x20
   0x0000fffff7faa3a0:	aa1603e5	mov	x5, x22
   0x0000fffff7faa3a4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7faa3a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa3ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa3b0:	d63f0200	blr	x16
   0x0000fffff7faa3b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa3b8:	54004e80	b.eq	0xfffff7faad88  // b.none
   0x0000fffff7faa3bc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa3c0:	37d806a9	tbnz	w9, #27, 0xfffff7faa494
   0x0000fffff7faa3c4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa3c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa3cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa3d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa3d4:	540001c1	b.ne	0xfffff7faa40c  // b.any
   0x0000fffff7faa3d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa3dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa3e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa3e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa3e8:	54000121	b.ne	0xfffff7faa40c  // b.any
   0x0000fffff7faa3ec:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faa3f0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7faa3f4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faa3f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa3fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa400:	f9001669	str	x9, [x19, #40]
   0x0000fffff7faa404:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faa408:	14000030	b	0xfffff7faa4c8
   0x0000fffff7faa40c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa410:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa414:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa418:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa41c:	54000120	b.eq	0xfffff7faa440  // b.none
   0x0000fffff7faa420:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa424:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa428:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa42c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa430:	54000321	b.ne	0xfffff7faa494  // b.any
   0x0000fffff7faa434:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faa438:	9e620120	scvtf	d0, x9
   0x0000fffff7faa43c:	14000002	b	0xfffff7faa444
   0x0000fffff7faa440:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7faa444:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa448:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa44c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa450:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa454:	54000120	b.eq	0xfffff7faa478  // b.none
   0x0000fffff7faa458:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa45c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa460:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa464:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa468:	54000161	b.ne	0xfffff7faa494  // b.any
   0x0000fffff7faa46c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faa470:	9e620121	scvtf	d1, x9
   0x0000fffff7faa474:	14000002	b	0xfffff7faa47c
   0x0000fffff7faa478:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7faa47c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faa480:	fd001660	str	d0, [x19, #40]
   0x0000fffff7faa484:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa488:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa48c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faa490:	17ffffde	b	0xfffff7faa408
   0x0000fffff7faa494:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa498:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa49c:	aa1303e1	mov	x1, x19
   0x0000fffff7faa4a0:	aa1503e2	mov	x2, x21
   0x0000fffff7faa4a4:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7faa4a8:	aa1403e4	mov	x4, x20
   0x0000fffff7faa4ac:	aa1603e5	mov	x5, x22
   0x0000fffff7faa4b0:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7faa4b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa4b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa4bc:	d63f0200	blr	x16
   0x0000fffff7faa4c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa4c4:	54004660	b.eq	0xfffff7faad90  // b.none
   0x0000fffff7faa4c8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa4cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa4d0:	aa1303e1	mov	x1, x19
   0x0000fffff7faa4d4:	aa1503e2	mov	x2, x21
   0x0000fffff7faa4d8:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7faa4dc:	aa1403e4	mov	x4, x20
   0x0000fffff7faa4e0:	aa1603e5	mov	x5, x22
   0x0000fffff7faa4e4:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7faa4e8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa4ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa4f0:	d63f0200	blr	x16
   0x0000fffff7faa4f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa4f8:	54004500	b.eq	0xfffff7faad98  // b.none
   0x0000fffff7faa4fc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faa500:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa504:	aa1303e1	mov	x1, x19
   0x0000fffff7faa508:	aa1503e2	mov	x2, x21
   0x0000fffff7faa50c:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7faa510:	aa1403e4	mov	x4, x20
   0x0000fffff7faa514:	aa1603e5	mov	x5, x22
   0x0000fffff7faa518:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7faa51c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa520:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa524:	d63f0200	blr	x16
   0x0000fffff7faa528:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa52c:	540043a0	b.eq	0xfffff7faada0  // b.none
   0x0000fffff7faa530:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faa534:	f100017f	cmp	x11, #0x0
   0x0000fffff7faa538:	540004a0	b.eq	0xfffff7faa5cc  // b.none
   0x0000fffff7faa53c:	b940016d	ldr	w13, [x11]
   0x0000fffff7faa540:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faa544:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faa548:	eb0901bf	cmp	x13, x9
   0x0000fffff7faa54c:	54000400	b.eq	0xfffff7faa5cc  // b.none
   0x0000fffff7faa550:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faa554:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faa558:	36d801d1	tbz	w17, #27, 0xfffff7faa590
   0x0000fffff7faa55c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa560:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa564:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa568:	54000321	b.ne	0xfffff7faa5cc  // b.any
   0x0000fffff7faa56c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faa570:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa574:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faa578:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faa57c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faa580:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faa584:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faa588:	f100055f	cmp	x10, #0x1
   0x0000fffff7faa58c:	54000209	b.ls	0xfffff7faa5cc  // b.plast
   0x0000fffff7faa590:	36d8008d	tbz	w13, #27, 0xfffff7faa5a0
   0x0000fffff7faa594:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faa598:	91000529	add	x9, x9, #0x1
   0x0000fffff7faa59c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faa5a0:	36d80091	tbz	w17, #27, 0xfffff7faa5b0
   0x0000fffff7faa5a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa5a8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faa5ac:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faa5b0:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7faa5b4:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faa5b8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faa5bc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faa5c0:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faa5c4:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faa5c8:	1400000e	b	0xfffff7faa600
   0x0000fffff7faa5cc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faa5d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa5d4:	aa1303e1	mov	x1, x19
   0x0000fffff7faa5d8:	aa1503e2	mov	x2, x21
   0x0000fffff7faa5dc:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7faa5e0:	aa1403e4	mov	x4, x20
   0x0000fffff7faa5e4:	aa1603e5	mov	x5, x22
   0x0000fffff7faa5e8:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7faa5ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa5f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa5f4:	d63f0200	blr	x16
   0x0000fffff7faa5f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa5fc:	54003d60	b.eq	0xfffff7faada8  // b.none
   0x0000fffff7faa600:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa604:	37d806a9	tbnz	w9, #27, 0xfffff7faa6d8
   0x0000fffff7faa608:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa60c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa610:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa614:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa618:	540001c1	b.ne	0xfffff7faa650  // b.any
   0x0000fffff7faa61c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa620:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa624:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa628:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa62c:	54000121	b.ne	0xfffff7faa650  // b.any
   0x0000fffff7faa630:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faa634:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7faa638:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faa63c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa640:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa644:	f9001669	str	x9, [x19, #40]
   0x0000fffff7faa648:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faa64c:	14000030	b	0xfffff7faa70c
   0x0000fffff7faa650:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa654:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa658:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa65c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa660:	54000120	b.eq	0xfffff7faa684  // b.none
   0x0000fffff7faa664:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa668:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa66c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa670:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa674:	54000321	b.ne	0xfffff7faa6d8  // b.any
   0x0000fffff7faa678:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faa67c:	9e620120	scvtf	d0, x9
   0x0000fffff7faa680:	14000002	b	0xfffff7faa688
   0x0000fffff7faa684:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7faa688:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa68c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa690:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa694:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa698:	54000120	b.eq	0xfffff7faa6bc  // b.none
   0x0000fffff7faa69c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa6a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa6a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa6a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa6ac:	54000161	b.ne	0xfffff7faa6d8  // b.any
   0x0000fffff7faa6b0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faa6b4:	9e620121	scvtf	d1, x9
   0x0000fffff7faa6b8:	14000002	b	0xfffff7faa6c0
   0x0000fffff7faa6bc:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7faa6c0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faa6c4:	fd001660	str	d0, [x19, #40]
   0x0000fffff7faa6c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa6cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa6d0:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faa6d4:	17ffffde	b	0xfffff7faa64c
   0x0000fffff7faa6d8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa6dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa6e0:	aa1303e1	mov	x1, x19
   0x0000fffff7faa6e4:	aa1503e2	mov	x2, x21
   0x0000fffff7faa6e8:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7faa6ec:	aa1403e4	mov	x4, x20
   0x0000fffff7faa6f0:	aa1603e5	mov	x5, x22
   0x0000fffff7faa6f4:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7faa6f8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa6fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa700:	d63f0200	blr	x16
   0x0000fffff7faa704:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa708:	54003540	b.eq	0xfffff7faadb0  // b.none
   0x0000fffff7faa70c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa710:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa714:	aa1303e1	mov	x1, x19
   0x0000fffff7faa718:	aa1503e2	mov	x2, x21
   0x0000fffff7faa71c:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7faa720:	aa1403e4	mov	x4, x20
   0x0000fffff7faa724:	aa1603e5	mov	x5, x22
   0x0000fffff7faa728:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7faa72c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa730:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa734:	d63f0200	blr	x16
   0x0000fffff7faa738:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa73c:	540033e0	b.eq	0xfffff7faadb8  // b.none
   0x0000fffff7faa740:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faa744:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa748:	aa1303e1	mov	x1, x19
   0x0000fffff7faa74c:	aa1503e2	mov	x2, x21
   0x0000fffff7faa750:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7faa754:	aa1403e4	mov	x4, x20
   0x0000fffff7faa758:	aa1603e5	mov	x5, x22
   0x0000fffff7faa75c:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7faa760:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa764:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa768:	d63f0200	blr	x16
   0x0000fffff7faa76c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa770:	54003280	b.eq	0xfffff7faadc0  // b.none
   0x0000fffff7faa774:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faa778:	f100017f	cmp	x11, #0x0
   0x0000fffff7faa77c:	540004a0	b.eq	0xfffff7faa810  // b.none
   0x0000fffff7faa780:	b940016d	ldr	w13, [x11]
   0x0000fffff7faa784:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faa788:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faa78c:	eb0901bf	cmp	x13, x9
   0x0000fffff7faa790:	54000400	b.eq	0xfffff7faa810  // b.none
   0x0000fffff7faa794:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faa798:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faa79c:	36d801d1	tbz	w17, #27, 0xfffff7faa7d4
   0x0000fffff7faa7a0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa7a4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa7a8:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa7ac:	54000321	b.ne	0xfffff7faa810  // b.any
   0x0000fffff7faa7b0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faa7b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa7b8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faa7bc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faa7c0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faa7c4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faa7c8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faa7cc:	f100055f	cmp	x10, #0x1
   0x0000fffff7faa7d0:	54000209	b.ls	0xfffff7faa810  // b.plast
   0x0000fffff7faa7d4:	36d8008d	tbz	w13, #27, 0xfffff7faa7e4
   0x0000fffff7faa7d8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faa7dc:	91000529	add	x9, x9, #0x1
   0x0000fffff7faa7e0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faa7e4:	36d80091	tbz	w17, #27, 0xfffff7faa7f4
   0x0000fffff7faa7e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa7ec:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faa7f0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faa7f4:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7faa7f8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faa7fc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faa800:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faa804:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faa808:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faa80c:	1400000e	b	0xfffff7faa844
   0x0000fffff7faa810:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faa814:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa818:	aa1303e1	mov	x1, x19
   0x0000fffff7faa81c:	aa1503e2	mov	x2, x21
   0x0000fffff7faa820:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7faa824:	aa1403e4	mov	x4, x20
   0x0000fffff7faa828:	aa1603e5	mov	x5, x22
   0x0000fffff7faa82c:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7faa830:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa834:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa838:	d63f0200	blr	x16
   0x0000fffff7faa83c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa840:	54002c40	b.eq	0xfffff7faadc8  // b.none
   0x0000fffff7faa844:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa848:	37d806a9	tbnz	w9, #27, 0xfffff7faa91c
   0x0000fffff7faa84c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa850:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa854:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa858:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa85c:	540001c1	b.ne	0xfffff7faa894  // b.any
   0x0000fffff7faa860:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa864:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa868:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa86c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa870:	54000121	b.ne	0xfffff7faa894  // b.any
   0x0000fffff7faa874:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faa878:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7faa87c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faa880:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa884:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa888:	f9001669	str	x9, [x19, #40]
   0x0000fffff7faa88c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faa890:	14000030	b	0xfffff7faa950
   0x0000fffff7faa894:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa898:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa89c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa8a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa8a4:	54000120	b.eq	0xfffff7faa8c8  // b.none
   0x0000fffff7faa8a8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa8ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa8b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa8b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa8b8:	54000321	b.ne	0xfffff7faa91c  // b.any
   0x0000fffff7faa8bc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faa8c0:	9e620120	scvtf	d0, x9
   0x0000fffff7faa8c4:	14000002	b	0xfffff7faa8cc
   0x0000fffff7faa8c8:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7faa8cc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa8d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa8d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa8d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa8dc:	54000120	b.eq	0xfffff7faa900  // b.none
   0x0000fffff7faa8e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa8e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa8e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa8ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa8f0:	54000161	b.ne	0xfffff7faa91c  // b.any
   0x0000fffff7faa8f4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faa8f8:	9e620121	scvtf	d1, x9
   0x0000fffff7faa8fc:	14000002	b	0xfffff7faa904
   0x0000fffff7faa900:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7faa904:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faa908:	fd001660	str	d0, [x19, #40]
   0x0000fffff7faa90c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa910:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa914:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faa918:	17ffffde	b	0xfffff7faa890
   0x0000fffff7faa91c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa920:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa924:	aa1303e1	mov	x1, x19
   0x0000fffff7faa928:	aa1503e2	mov	x2, x21
   0x0000fffff7faa92c:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7faa930:	aa1403e4	mov	x4, x20
   0x0000fffff7faa934:	aa1603e5	mov	x5, x22
   0x0000fffff7faa938:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7faa93c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa940:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa944:	d63f0200	blr	x16
   0x0000fffff7faa948:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa94c:	54002420	b.eq	0xfffff7faadd0  // b.none
   0x0000fffff7faa950:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa954:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa958:	aa1303e1	mov	x1, x19
   0x0000fffff7faa95c:	aa1503e2	mov	x2, x21
   0x0000fffff7faa960:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7faa964:	aa1403e4	mov	x4, x20
   0x0000fffff7faa968:	aa1603e5	mov	x5, x22
   0x0000fffff7faa96c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7faa970:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa974:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa978:	d63f0200	blr	x16
   0x0000fffff7faa97c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa980:	540022c0	b.eq	0xfffff7faadd8  // b.none
   0x0000fffff7faa984:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faa988:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa98c:	aa1303e1	mov	x1, x19
   0x0000fffff7faa990:	aa1503e2	mov	x2, x21
   0x0000fffff7faa994:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7faa998:	aa1403e4	mov	x4, x20
   0x0000fffff7faa99c:	aa1603e5	mov	x5, x22
   0x0000fffff7faa9a0:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7faa9a4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa9a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa9ac:	d63f0200	blr	x16
   0x0000fffff7faa9b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa9b4:	54002160	b.eq	0xfffff7faade0  // b.none
   0x0000fffff7faa9b8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faa9bc:	f100017f	cmp	x11, #0x0
   0x0000fffff7faa9c0:	540004a0	b.eq	0xfffff7faaa54  // b.none
   0x0000fffff7faa9c4:	b940016d	ldr	w13, [x11]
   0x0000fffff7faa9c8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faa9cc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faa9d0:	eb0901bf	cmp	x13, x9
   0x0000fffff7faa9d4:	54000400	b.eq	0xfffff7faaa54  // b.none
   0x0000fffff7faa9d8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faa9dc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faa9e0:	36d801d1	tbz	w17, #27, 0xfffff7faaa18
   0x0000fffff7faa9e4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa9e8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa9ec:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa9f0:	54000321	b.ne	0xfffff7faaa54  // b.any
   0x0000fffff7faa9f4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faa9f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa9fc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faaa00:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faaa04:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faaa08:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faaa0c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faaa10:	f100055f	cmp	x10, #0x1
   0x0000fffff7faaa14:	54000209	b.ls	0xfffff7faaa54  // b.plast
   0x0000fffff7faaa18:	36d8008d	tbz	w13, #27, 0xfffff7faaa28
   0x0000fffff7faaa1c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faaa20:	91000529	add	x9, x9, #0x1
   0x0000fffff7faaa24:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faaa28:	36d80091	tbz	w17, #27, 0xfffff7faaa38
   0x0000fffff7faaa2c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faaa30:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faaa34:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faaa38:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7faaa3c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faaa40:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faaa44:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faaa48:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faaa4c:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faaa50:	1400000e	b	0xfffff7faaa88
   0x0000fffff7faaa54:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faaa58:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faaa5c:	aa1303e1	mov	x1, x19
   0x0000fffff7faaa60:	aa1503e2	mov	x2, x21
   0x0000fffff7faaa64:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7faaa68:	aa1403e4	mov	x4, x20
   0x0000fffff7faaa6c:	aa1603e5	mov	x5, x22
   0x0000fffff7faaa70:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7faaa74:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faaa78:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faaa7c:	d63f0200	blr	x16
   0x0000fffff7faaa80:	f100001f	cmp	x0, #0x0
   0x0000fffff7faaa84:	54001b20	b.eq	0xfffff7faade8  // b.none
   0x0000fffff7faaa88:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faaa8c:	37d806a9	tbnz	w9, #27, 0xfffff7faab60
   0x0000fffff7faaa90:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faaa94:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faaa98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faaa9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faaaa0:	540001c1	b.ne	0xfffff7faaad8  // b.any
   0x0000fffff7faaaa4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faaaa8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faaaac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faaab0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faaab4:	54000121	b.ne	0xfffff7faaad8  // b.any
   0x0000fffff7faaab8:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faaabc:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7faaac0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faaac4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faaac8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faaacc:	f9001669	str	x9, [x19, #40]
   0x0000fffff7faaad0:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faaad4:	14000030	b	0xfffff7faab94
   0x0000fffff7faaad8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faaadc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faaae0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faaae4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faaae8:	54000120	b.eq	0xfffff7faab0c  // b.none
   0x0000fffff7faaaec:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faaaf0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faaaf4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faaaf8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faaafc:	54000321	b.ne	0xfffff7faab60  // b.any
   0x0000fffff7faab00:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faab04:	9e620120	scvtf	d0, x9
   0x0000fffff7faab08:	14000002	b	0xfffff7faab10
   0x0000fffff7faab0c:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7faab10:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faab14:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faab18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faab1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faab20:	54000120	b.eq	0xfffff7faab44  // b.none
   0x0000fffff7faab24:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faab28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faab2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faab30:	eb0a013f	cmp	x9, x10
   0x0000fffff7faab34:	54000161	b.ne	0xfffff7faab60  // b.any
   0x0000fffff7faab38:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faab3c:	9e620121	scvtf	d1, x9
   0x0000fffff7faab40:	14000002	b	0xfffff7faab48
   0x0000fffff7faab44:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7faab48:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faab4c:	fd001660	str	d0, [x19, #40]
   0x0000fffff7faab50:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faab54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faab58:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faab5c:	17ffffde	b	0xfffff7faaad4
   0x0000fffff7faab60:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faab64:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faab68:	aa1303e1	mov	x1, x19
   0x0000fffff7faab6c:	aa1503e2	mov	x2, x21
   0x0000fffff7faab70:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7faab74:	aa1403e4	mov	x4, x20
   0x0000fffff7faab78:	aa1603e5	mov	x5, x22
   0x0000fffff7faab7c:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7faab80:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faab84:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faab88:	d63f0200	blr	x16
   0x0000fffff7faab8c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faab90:	54001300	b.eq	0xfffff7faadf0  // b.none
   0x0000fffff7faab94:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faab98:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faab9c:	aa1303e1	mov	x1, x19
   0x0000fffff7faaba0:	aa1503e2	mov	x2, x21
   0x0000fffff7faaba4:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7faaba8:	aa1403e4	mov	x4, x20
   0x0000fffff7faabac:	aa1603e5	mov	x5, x22
   0x0000fffff7faabb0:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7faabb4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faabb8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faabbc:	d63f0200	blr	x16
   0x0000fffff7faabc0:	f100001f	cmp	x0, #0x0
   0x0000fffff7faabc4:	540011a0	b.eq	0xfffff7faadf8  // b.none
   0x0000fffff7faabc8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faabcc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faabd0:	aa1303e1	mov	x1, x19
   0x0000fffff7faabd4:	aa1503e2	mov	x2, x21
   0x0000fffff7faabd8:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7faabdc:	aa1403e4	mov	x4, x20
   0x0000fffff7faabe0:	aa1603e5	mov	x5, x22
   0x0000fffff7faabe4:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7faabe8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faabec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faabf0:	d63f0200	blr	x16
   0x0000fffff7faabf4:	f100001f	cmp	x0, #0x0
   0x0000fffff7faabf8:	54001040	b.eq	0xfffff7faae00  // b.none
   0x0000fffff7faabfc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faac00:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faac04:	aa1303e1	mov	x1, x19
   0x0000fffff7faac08:	aa1503e2	mov	x2, x21
   0x0000fffff7faac0c:	d2800683	mov	x3, #0x34                  	// #52
   0x0000fffff7faac10:	aa1403e4	mov	x4, x20
   0x0000fffff7faac14:	aa1603e5	mov	x5, x22
   0x0000fffff7faac18:	d2869090	mov	x16, #0x3484                	// #13444
   0x0000fffff7faac1c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faac20:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faac24:	d63f0200	blr	x16
   0x0000fffff7faac28:	910143ff	add	sp, sp, #0x50
   0x0000fffff7faac2c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7faac30:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7faac34:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7faac38:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7faac3c:	d65f03c0	ret
   0x0000fffff7faac40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faac44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faac48:	b900028a	str	w10, [x20]
   0x0000fffff7faac4c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7faac50:	910143ff	add	sp, sp, #0x50
   0x0000fffff7faac54:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7faac58:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7faac5c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7faac60:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7faac64:	d65f03c0	ret
   0x0000fffff7faac68:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7faac6c:	17fffff5	b	0xfffff7faac40
   0x0000fffff7faac70:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7faac74:	17fffff3	b	0xfffff7faac40
   0x0000fffff7faac78:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7faac7c:	17fffff1	b	0xfffff7faac40
   0x0000fffff7faac80:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7faac84:	17ffffef	b	0xfffff7faac40
   0x0000fffff7faac88:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7faac8c:	17ffffed	b	0xfffff7faac40
   0x0000fffff7faac90:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7faac94:	17ffffeb	b	0xfffff7faac40
   0x0000fffff7faac98:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7faac9c:	17ffffe9	b	0xfffff7faac40
   0x0000fffff7faaca0:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7faaca4:	17ffffe7	b	0xfffff7faac40
   0x0000fffff7faaca8:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7faacac:	17ffffe5	b	0xfffff7faac40
   0x0000fffff7faacb0:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7faacb4:	17ffffe3	b	0xfffff7faac40
   0x0000fffff7faacb8:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7faacbc:	17ffffe1	b	0xfffff7faac40
   0x0000fffff7faacc0:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7faacc4:	17ffffdf	b	0xfffff7faac40
   0x0000fffff7faacc8:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7faaccc:	17ffffdd	b	0xfffff7faac40
   0x0000fffff7faacd0:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7faacd4:	17ffffdb	b	0xfffff7faac40
   0x0000fffff7faacd8:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7faacdc:	17ffffd9	b	0xfffff7faac40
   0x0000fffff7faace0:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7faace4:	17ffffd7	b	0xfffff7faac40
   0x0000fffff7faace8:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7faacec:	17ffffd5	b	0xfffff7faac40
   0x0000fffff7faacf0:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7faacf4:	17ffffd3	b	0xfffff7faac40
   0x0000fffff7faacf8:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7faacfc:	17ffffd1	b	0xfffff7faac40
   0x0000fffff7faad00:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7faad04:	17ffffcf	b	0xfffff7faac40
   0x0000fffff7faad08:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7faad0c:	17ffffcd	b	0xfffff7faac40
   0x0000fffff7faad10:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7faad14:	17ffffcb	b	0xfffff7faac40
   0x0000fffff7faad18:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7faad1c:	17ffffc9	b	0xfffff7faac40
   0x0000fffff7faad20:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7faad24:	17ffffc7	b	0xfffff7faac40
   0x0000fffff7faad28:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7faad2c:	17ffffc5	b	0xfffff7faac40
   0x0000fffff7faad30:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7faad34:	17ffffc3	b	0xfffff7faac40
   0x0000fffff7faad38:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7faad3c:	17ffffc1	b	0xfffff7faac40
   0x0000fffff7faad40:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7faad44:	17ffffbf	b	0xfffff7faac40
   0x0000fffff7faad48:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7faad4c:	17ffffbd	b	0xfffff7faac40
   0x0000fffff7faad50:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7faad54:	17ffffbb	b	0xfffff7faac40
   0x0000fffff7faad58:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7faad5c:	17ffffb9	b	0xfffff7faac40
   0x0000fffff7faad60:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7faad64:	17ffffb7	b	0xfffff7faac40
   0x0000fffff7faad68:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7faad6c:	17ffffb5	b	0xfffff7faac40
   0x0000fffff7faad70:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7faad74:	17ffffb3	b	0xfffff7faac40
   0x0000fffff7faad78:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7faad7c:	17ffffb1	b	0xfffff7faac40
   0x0000fffff7faad80:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7faad84:	17ffffaf	b	0xfffff7faac40
   0x0000fffff7faad88:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7faad8c:	17ffffad	b	0xfffff7faac40
   0x0000fffff7faad90:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7faad94:	17ffffab	b	0xfffff7faac40
   0x0000fffff7faad98:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7faad9c:	17ffffa9	b	0xfffff7faac40
   0x0000fffff7faada0:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7faada4:	17ffffa7	b	0xfffff7faac40
   0x0000fffff7faada8:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7faadac:	17ffffa5	b	0xfffff7faac40
   0x0000fffff7faadb0:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7faadb4:	17ffffa3	b	0xfffff7faac40
   0x0000fffff7faadb8:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7faadbc:	17ffffa1	b	0xfffff7faac40
   0x0000fffff7faadc0:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7faadc4:	17ffff9f	b	0xfffff7faac40
   0x0000fffff7faadc8:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7faadcc:	17ffff9d	b	0xfffff7faac40
   0x0000fffff7faadd0:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7faadd4:	17ffff9b	b	0xfffff7faac40
   0x0000fffff7faadd8:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7faaddc:	17ffff99	b	0xfffff7faac40
   0x0000fffff7faade0:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7faade4:	17ffff97	b	0xfffff7faac40
   0x0000fffff7faade8:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7faadec:	17ffff95	b	0xfffff7faac40
   0x0000fffff7faadf0:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7faadf4:	17ffff93	b	0xfffff7faac40
   0x0000fffff7faadf8:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7faadfc:	17ffff91	b	0xfffff7faac40
   0x0000fffff7faae00:	d2800669	mov	x9, #0x33                  	// #51
   0x0000fffff7faae04:	17ffff8f	b	0xfffff7faac40
   0x0000fffff7faae08:	00000000	udf	#0
   0x0000fffff7faae0c:	00000000	udf	#0
   0x0000fffff7faae10:	00000000	udf	#0
   0x0000fffff7faae14:	00000000	udf	#0
   0x0000fffff7faae18:	00000000	udf	#0
   0x0000fffff7faae1c:	00000000	udf	#0
   0x0000fffff7faae20:	00000000	udf	#0
   0x0000fffff7faae24:	00000000	udf	#0
   0x0000fffff7faae28:	00000000	udf	#0
   0x0000fffff7faae2c:	00000000	udf	#0
   0x0000fffff7faae30:	00000000	udf	#0
   0x0000fffff7faae34:	00000000	udf	#0
   0x0000fffff7faae38:	00000000	udf	#0
   0x0000fffff7faae3c:	00000000	udf	#0
   0x0000fffff7faae40:	00000000	udf	#0
   0x0000fffff7faae44:	00000000	udf	#0
   0x0000fffff7faae48:	00000000	udf	#0
   0x0000fffff7faae4c:	00000000	udf	#0
   0x0000fffff7faae50:	00000000	udf	#0
   0x0000fffff7faae54:	00000000	udf	#0
   0x0000fffff7faae58:	00000000	udf	#0
   0x0000fffff7faae5c:	00000000	udf	#0
   0x0000fffff7faae60:	00000000	udf	#0
   0x0000fffff7faae64:	00000000	udf	#0
   0x0000fffff7faae68:	00000000	udf	#0
   0x0000fffff7faae6c:	00000000	udf	#0
   0x0000fffff7faae70:	00000000	udf	#0
   0x0000fffff7faae74:	00000000	udf	#0
   0x0000fffff7faae78:	00000000	udf	#0
   0x0000fffff7faae7c:	00000000	udf	#0
   0x0000fffff7faae80:	00000000	udf	#0
   0x0000fffff7faae84:	00000000	udf	#0
   0x0000fffff7faae88:	00000000	udf	#0
   0x0000fffff7faae8c:	00000000	udf	#0
   0x0000fffff7faae90:	00000000	udf	#0
   0x0000fffff7faae94:	00000000	udf	#0
   0x0000fffff7faae98:	00000000	udf	#0
   0x0000fffff7faae9c:	00000000	udf	#0
   0x0000fffff7faaea0:	00000000	udf	#0
   0x0000fffff7faaea4:	00000000	udf	#0
   0x0000fffff7faaea8:	00000000	udf	#0
   0x0000fffff7faaeac:	00000000	udf	#0
   0x0000fffff7faaeb0:	00000000	udf	#0
   0x0000fffff7faaeb4:	00000000	udf	#0
   0x0000fffff7faaeb8:	00000000	udf	#0
   0x0000fffff7faaebc:	00000000	udf	#0
   0x0000fffff7faaec0:	00000000	udf	#0
   0x0000fffff7faaec4:	00000000	udf	#0
   0x0000fffff7faaec8:	00000000	udf	#0
   0x0000fffff7faaecc:	00000000	udf	#0
   0x0000fffff7faaed0:	00000000	udf	#0
   0x0000fffff7faaed4:	00000000	udf	#0
   0x0000fffff7faaed8:	00000000	udf	#0
   0x0000fffff7faaedc:	00000000	udf	#0
   0x0000fffff7faaee0:	00000000	udf	#0
   0x0000fffff7faaee4:	00000000	udf	#0
   0x0000fffff7faaee8:	00000000	udf	#0
   0x0000fffff7faaeec:	00000000	udf	#0
   0x0000fffff7faaef0:	00000000	udf	#0
   0x0000fffff7faaef4:	00000000	udf	#0
   0x0000fffff7faaef8:	00000000	udf	#0
   0x0000fffff7faaefc:	00000000	udf	#0
   0x0000fffff7faaf00:	00000000	udf	#0
   0x0000fffff7faaf04:	00000000	udf	#0
   0x0000fffff7faaf08:	00000000	udf	#0
   0x0000fffff7faaf0c:	00000000	udf	#0
   0x0000fffff7faaf10:	00000000	udf	#0
   0x0000fffff7faaf14:	00000000	udf	#0
   0x0000fffff7faaf18:	00000000	udf	#0
   0x0000fffff7faaf1c:	00000000	udf	#0
   0x0000fffff7faaf20:	00000000	udf	#0
   0x0000fffff7faaf24:	00000000	udf	#0
   0x0000fffff7faaf28:	00000000	udf	#0
   0x0000fffff7faaf2c:	00000000	udf	#0
   0x0000fffff7faaf30:	00000000	udf	#0
   0x0000fffff7faaf34:	00000000	udf	#0
   0x0000fffff7faaf38:	00000000	udf	#0
   0x0000fffff7faaf3c:	00000000	udf	#0
   0x0000fffff7faaf40:	00000000	udf	#0
   0x0000fffff7faaf44:	00000000	udf	#0
   0x0000fffff7faaf48:	00000000	udf	#0
   0x0000fffff7faaf4c:	00000000	udf	#0
   0x0000fffff7faaf50:	00000000	udf	#0
   0x0000fffff7faaf54:	00000000	udf	#0
   0x0000fffff7faaf58:	00000000	udf	#0
   0x0000fffff7faaf5c:	00000000	udf	#0
   0x0000fffff7faaf60:	00000000	udf	#0
   0x0000fffff7faaf64:	00000000	udf	#0
   0x0000fffff7faaf68:	00000000	udf	#0
   0x0000fffff7faaf6c:	00000000	udf	#0
   0x0000fffff7faaf70:	00000000	udf	#0
   0x0000fffff7faaf74:	00000000	udf	#0
   0x0000fffff7faaf78:	00000000	udf	#0
   0x0000fffff7faaf7c:	00000000	udf	#0
   0x0000fffff7faaf80:	00000000	udf	#0
   0x0000fffff7faaf84:	00000000	udf	#0
   0x0000fffff7faaf88:	00000000	udf	#0
   0x0000fffff7faaf8c:	00000000	udf	#0
   0x0000fffff7faaf90:	00000000	udf	#0
   0x0000fffff7faaf94:	00000000	udf	#0
   0x0000fffff7faaf98:	00000000	udf	#0
   0x0000fffff7faaf9c:	00000000	udf	#0
   0x0000fffff7faafa0:	00000000	udf	#0
   0x0000fffff7faafa4:	00000000	udf	#0
   0x0000fffff7faafa8:	00000000	udf	#0
   0x0000fffff7faafac:	00000000	udf	#0
   0x0000fffff7faafb0:	00000000	udf	#0
   0x0000fffff7faafb4:	00000000	udf	#0
   0x0000fffff7faafb8:	00000000	udf	#0
   0x0000fffff7faafbc:	00000000	udf	#0
   0x0000fffff7faafc0:	00000000	udf	#0
   0x0000fffff7faafc4:	00000000	udf	#0
   0x0000fffff7faafc8:	00000000	udf	#0
   0x0000fffff7faafcc:	00000000	udf	#0
   0x0000fffff7faafd0:	00000000	udf	#0
   0x0000fffff7faafd4:	00000000	udf	#0
   0x0000fffff7faafd8:	00000000	udf	#0
   0x0000fffff7faafdc:	00000000	udf	#0
   0x0000fffff7faafe0:	00000000	udf	#0
   0x0000fffff7faafe4:	00000000	udf	#0
   0x0000fffff7faafe8:	00000000	udf	#0
   0x0000fffff7faafec:	00000000	udf	#0
   0x0000fffff7faaff0:	00000000	udf	#0
   0x0000fffff7faaff4:	00000000	udf	#0
   0x0000fffff7faaff8:	00000000	udf	#0
   0x0000fffff7faaffc:	00000000	udf	#0
End of assembler dump.
