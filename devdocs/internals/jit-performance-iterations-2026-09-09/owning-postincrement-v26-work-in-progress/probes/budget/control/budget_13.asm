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
   0x0000fffff7fa9058:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fa905c:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fa9060:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fa9064:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fa9068:	36d80211	tbz	w17, #27, 0xfffff7fa90a8
   0x0000fffff7fa906c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa9070:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa9074:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa9078:	540001e1	b.ne	0xfffff7fa90b4  // b.any
   0x0000fffff7fa907c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa9080:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9084:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa9088:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa908c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9090:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa9094:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa9098:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa909c:	540000c9	b.ls	0xfffff7fa90b4  // b.plast
   0x0000fffff7fa90a0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa90a4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa90a8:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa90ac:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa90b0:	1400000e	b	0xfffff7fa90e8
   0x0000fffff7fa90b4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa90b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa90bc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa90c0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa90c4:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fa90c8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa90cc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa90d0:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7fa90d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa90d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa90dc:	d63f0200	blr	x16
   0x0000fffff7fa90e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa90e4:	5400df00	b.eq	0xfffff7faacc4  // b.none
   0x0000fffff7fa90e8:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fa90ec:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fa90f0:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fa90f4:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa90f8:	36d80211	tbz	w17, #27, 0xfffff7fa9138
   0x0000fffff7fa90fc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa9100:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa9104:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa9108:	540001e1	b.ne	0xfffff7fa9144  // b.any
   0x0000fffff7fa910c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa9110:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9114:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa9118:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa911c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9120:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa9124:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa9128:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa912c:	540000c9	b.ls	0xfffff7fa9144  // b.plast
   0x0000fffff7fa9130:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa9134:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa9138:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa913c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa9140:	1400000e	b	0xfffff7fa9178
   0x0000fffff7fa9144:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9148:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa914c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9150:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9154:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fa9158:	aa1403e4	mov	x4, x20
   0x0000fffff7fa915c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9160:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7fa9164:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9168:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa916c:	d63f0200	blr	x16
   0x0000fffff7fa9170:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9174:	5400dac0	b.eq	0xfffff7faaccc  // b.none
   0x0000fffff7fa9178:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa917c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9180:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9184:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9188:	54000421	b.ne	0xfffff7fa920c  // b.any
   0x0000fffff7fa918c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9190:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9194:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9198:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa919c:	54000381	b.ne	0xfffff7fa920c  // b.any
   0x0000fffff7fa91a0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa91a4:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7fa91a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa91ac:	9a9fa7ec	cset	x12, lt	// lt = tstop
   0x0000fffff7fa91b0:	5280010d	mov	w13, #0x8                   	// #8
   0x0000fffff7fa91b4:	72a0200d	movk	w13, #0x100, lsl #16
   0x0000fffff7fa91b8:	91000580	add	x0, x12, #0x1
   0x0000fffff7fa91bc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa91c0:	36d80211	tbz	w17, #27, 0xfffff7fa9200
   0x0000fffff7fa91c4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa91c8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa91cc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa91d0:	540001e1	b.ne	0xfffff7fa920c  // b.any
   0x0000fffff7fa91d4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa91d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa91dc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa91e0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa91e4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa91e8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa91ec:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa91f0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa91f4:	540000c9	b.ls	0xfffff7fa920c  // b.plast
   0x0000fffff7fa91f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa91fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa9200:	f9005ecc	str	x12, [x22, #184]
   0x0000fffff7fa9204:	b900b2cd	str	w13, [x22, #176]
   0x0000fffff7fa9208:	1400000e	b	0xfffff7fa9240
   0x0000fffff7fa920c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9210:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9214:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9218:	aa1503e2	mov	x2, x21
   0x0000fffff7fa921c:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fa9220:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9224:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9228:	d28fec90	mov	x16, #0x7f64                	// #32612
   0x0000fffff7fa922c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9230:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9234:	d63f0200	blr	x16
   0x0000fffff7fa9238:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa923c:	5400d4c0	b.eq	0xfffff7faacd4  // b.none
   0x0000fffff7fa9240:	f100041f	cmp	x0, #0x1
   0x0000fffff7fa9244:	5400d0a0	b.eq	0xfffff7faac58  // b.none
   0x0000fffff7fa9248:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa924c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa9250:	d299c60c	mov	x12, #0xce30                	// #52784
   0x0000fffff7fa9254:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa9258:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa925c:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7fa9260:	36d801d1	tbz	w17, #27, 0xfffff7fa9298
   0x0000fffff7fa9264:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa9268:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa926c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa9270:	54000281	b.ne	0xfffff7fa92c0  // b.any
   0x0000fffff7fa9274:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa9278:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa927c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa9280:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa9284:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9288:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa928c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa9290:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa9294:	54000169	b.ls	0xfffff7fa92c0  // b.plast
   0x0000fffff7fa9298:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa929c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa92a0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa92a4:	36d80091	tbz	w17, #27, 0xfffff7fa92b4
   0x0000fffff7fa92a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa92ac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa92b0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa92b4:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa92b8:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa92bc:	1400000e	b	0xfffff7fa92f4
   0x0000fffff7fa92c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa92c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa92c8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa92cc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa92d0:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7fa92d4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa92d8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa92dc:	d2933c10	mov	x16, #0x99e0                	// #39392
   0x0000fffff7fa92e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa92e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa92e8:	d63f0200	blr	x16
   0x0000fffff7fa92ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa92f0:	5400cf60	b.eq	0xfffff7faacdc  // b.none
   0x0000fffff7fa92f4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa92f8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa92fc:	540003a0	b.eq	0xfffff7fa9370  // b.none
   0x0000fffff7fa9300:	b940426d	ldr	w13, [x19, #64]
   0x0000fffff7fa9304:	f940266c	ldr	x12, [x19, #72]
   0x0000fffff7fa9308:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa930c:	36d801d1	tbz	w17, #27, 0xfffff7fa9344
   0x0000fffff7fa9310:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa9314:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa9318:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa931c:	540002a1	b.ne	0xfffff7fa9370  // b.any
   0x0000fffff7fa9320:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa9324:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9328:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa932c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa9330:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9334:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa9338:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa933c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa9340:	54000189	b.ls	0xfffff7fa9370  // b.plast
   0x0000fffff7fa9344:	36d8008d	tbz	w13, #27, 0xfffff7fa9354
   0x0000fffff7fa9348:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa934c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa9350:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa9354:	36d80091	tbz	w17, #27, 0xfffff7fa9364
   0x0000fffff7fa9358:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa935c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa9360:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa9364:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa9368:	b900016d	str	w13, [x11]
   0x0000fffff7fa936c:	1400000e	b	0xfffff7fa93a4
   0x0000fffff7fa9370:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa9374:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9378:	aa1303e1	mov	x1, x19
   0x0000fffff7fa937c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9380:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7fa9384:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9388:	aa1603e5	mov	x5, x22
   0x0000fffff7fa938c:	d29e2e10	mov	x16, #0xf170                	// #61808
   0x0000fffff7fa9390:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9394:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9398:	d63f0200	blr	x16
   0x0000fffff7fa939c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa93a0:	5400ca20	b.eq	0xfffff7faace4  // b.none
   0x0000fffff7fa93a4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa93a8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa93ac:	540004a0	b.eq	0xfffff7fa9440  // b.none
   0x0000fffff7fa93b0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa93b4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa93b8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa93bc:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa93c0:	54000400	b.eq	0xfffff7fa9440  // b.none
   0x0000fffff7fa93c4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa93c8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa93cc:	36d801d1	tbz	w17, #27, 0xfffff7fa9404
   0x0000fffff7fa93d0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa93d4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa93d8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa93dc:	54000321	b.ne	0xfffff7fa9440  // b.any
   0x0000fffff7fa93e0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa93e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa93e8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa93ec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa93f0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa93f4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa93f8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa93fc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa9400:	54000209	b.ls	0xfffff7fa9440  // b.plast
   0x0000fffff7fa9404:	36d8008d	tbz	w13, #27, 0xfffff7fa9414
   0x0000fffff7fa9408:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa940c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa9410:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa9414:	36d80091	tbz	w17, #27, 0xfffff7fa9424
   0x0000fffff7fa9418:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa941c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa9420:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa9424:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa9428:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa942c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa9430:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa9434:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa9438:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa943c:	1400000e	b	0xfffff7fa9474
   0x0000fffff7fa9440:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa9444:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9448:	aa1303e1	mov	x1, x19
   0x0000fffff7fa944c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9450:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fa9454:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9458:	aa1603e5	mov	x5, x22
   0x0000fffff7fa945c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa9460:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9464:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9468:	d63f0200	blr	x16
   0x0000fffff7fa946c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9470:	5400c3e0	b.eq	0xfffff7faacec  // b.none
   0x0000fffff7fa9474:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9478:	37d806a9	tbnz	w9, #27, 0xfffff7fa954c
   0x0000fffff7fa947c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9480:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9484:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9488:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa948c:	540001c1	b.ne	0xfffff7fa94c4  // b.any
   0x0000fffff7fa9490:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa9494:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9498:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa949c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa94a0:	54000121	b.ne	0xfffff7fa94c4  // b.any
   0x0000fffff7fa94a4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa94a8:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa94ac:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa94b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa94b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa94b8:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa94bc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa94c0:	14000030	b	0xfffff7fa9580
   0x0000fffff7fa94c4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa94c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa94cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa94d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa94d4:	54000120	b.eq	0xfffff7fa94f8  // b.none
   0x0000fffff7fa94d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa94dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa94e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa94e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa94e8:	54000321	b.ne	0xfffff7fa954c  // b.any
   0x0000fffff7fa94ec:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa94f0:	9e620120	scvtf	d0, x9
   0x0000fffff7fa94f4:	14000002	b	0xfffff7fa94fc
   0x0000fffff7fa94f8:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa94fc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa9500:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9504:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9508:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa950c:	54000120	b.eq	0xfffff7fa9530  // b.none
   0x0000fffff7fa9510:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa9514:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9518:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa951c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9520:	54000161	b.ne	0xfffff7fa954c  // b.any
   0x0000fffff7fa9524:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa9528:	9e620121	scvtf	d1, x9
   0x0000fffff7fa952c:	14000002	b	0xfffff7fa9534
   0x0000fffff7fa9530:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa9534:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa9538:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa953c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9540:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9544:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa9548:	17ffffde	b	0xfffff7fa94c0
   0x0000fffff7fa954c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9550:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9554:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9558:	aa1503e2	mov	x2, x21
   0x0000fffff7fa955c:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fa9560:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9564:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9568:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa956c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9570:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9574:	d63f0200	blr	x16
   0x0000fffff7fa9578:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa957c:	5400bbc0	b.eq	0xfffff7faacf4  // b.none
   0x0000fffff7fa9580:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa9584:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa9588:	540004a0	b.eq	0xfffff7fa961c  // b.none
   0x0000fffff7fa958c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa9590:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa9594:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa9598:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa959c:	54000400	b.eq	0xfffff7fa961c  // b.none
   0x0000fffff7fa95a0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa95a4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa95a8:	36d801d1	tbz	w17, #27, 0xfffff7fa95e0
   0x0000fffff7fa95ac:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa95b0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa95b4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa95b8:	54000321	b.ne	0xfffff7fa961c  // b.any
   0x0000fffff7fa95bc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa95c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa95c4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa95c8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa95cc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa95d0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa95d4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa95d8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa95dc:	54000209	b.ls	0xfffff7fa961c  // b.plast
   0x0000fffff7fa95e0:	36d8008d	tbz	w13, #27, 0xfffff7fa95f0
   0x0000fffff7fa95e4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa95e8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa95ec:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa95f0:	36d80091	tbz	w17, #27, 0xfffff7fa9600
   0x0000fffff7fa95f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa95f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa95fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa9600:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa9604:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa9608:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa960c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa9610:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa9614:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa9618:	1400000e	b	0xfffff7fa9650
   0x0000fffff7fa961c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa9620:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9624:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9628:	aa1503e2	mov	x2, x21
   0x0000fffff7fa962c:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fa9630:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9634:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9638:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa963c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9640:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9644:	d63f0200	blr	x16
   0x0000fffff7fa9648:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa964c:	5400b580	b.eq	0xfffff7faacfc  // b.none
   0x0000fffff7fa9650:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9654:	37d806a9	tbnz	w9, #27, 0xfffff7fa9728
   0x0000fffff7fa9658:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa965c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9660:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9664:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9668:	540001c1	b.ne	0xfffff7fa96a0  // b.any
   0x0000fffff7fa966c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa9670:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9674:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9678:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa967c:	54000121	b.ne	0xfffff7fa96a0  // b.any
   0x0000fffff7fa9680:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa9684:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa9688:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa968c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9690:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9694:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa9698:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa969c:	14000030	b	0xfffff7fa975c
   0x0000fffff7fa96a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa96a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa96a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa96ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa96b0:	54000120	b.eq	0xfffff7fa96d4  // b.none
   0x0000fffff7fa96b4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa96b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa96bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa96c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa96c4:	54000321	b.ne	0xfffff7fa9728  // b.any
   0x0000fffff7fa96c8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa96cc:	9e620120	scvtf	d0, x9
   0x0000fffff7fa96d0:	14000002	b	0xfffff7fa96d8
   0x0000fffff7fa96d4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa96d8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa96dc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa96e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa96e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa96e8:	54000120	b.eq	0xfffff7fa970c  // b.none
   0x0000fffff7fa96ec:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa96f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa96f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa96f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa96fc:	54000161	b.ne	0xfffff7fa9728  // b.any
   0x0000fffff7fa9700:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa9704:	9e620121	scvtf	d1, x9
   0x0000fffff7fa9708:	14000002	b	0xfffff7fa9710
   0x0000fffff7fa970c:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa9710:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa9714:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa9718:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa971c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9720:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa9724:	17ffffde	b	0xfffff7fa969c
   0x0000fffff7fa9728:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa972c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9730:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9734:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9738:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fa973c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9740:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9744:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa9748:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa974c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9750:	d63f0200	blr	x16
   0x0000fffff7fa9754:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9758:	5400ad60	b.eq	0xfffff7faad04  // b.none
   0x0000fffff7fa975c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa9760:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa9764:	540004a0	b.eq	0xfffff7fa97f8  // b.none
   0x0000fffff7fa9768:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa976c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa9770:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa9774:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa9778:	54000400	b.eq	0xfffff7fa97f8  // b.none
   0x0000fffff7fa977c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa9780:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa9784:	36d801d1	tbz	w17, #27, 0xfffff7fa97bc
   0x0000fffff7fa9788:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa978c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa9790:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa9794:	54000321	b.ne	0xfffff7fa97f8  // b.any
   0x0000fffff7fa9798:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa979c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa97a0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa97a4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa97a8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa97ac:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa97b0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa97b4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa97b8:	54000209	b.ls	0xfffff7fa97f8  // b.plast
   0x0000fffff7fa97bc:	36d8008d	tbz	w13, #27, 0xfffff7fa97cc
   0x0000fffff7fa97c0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa97c4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa97c8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa97cc:	36d80091	tbz	w17, #27, 0xfffff7fa97dc
   0x0000fffff7fa97d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa97d4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa97d8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa97dc:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa97e0:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa97e4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa97e8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa97ec:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa97f0:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa97f4:	1400000e	b	0xfffff7fa982c
   0x0000fffff7fa97f8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa97fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9800:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9804:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9808:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fa980c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9810:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9814:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa9818:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa981c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9820:	d63f0200	blr	x16
   0x0000fffff7fa9824:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9828:	5400a720	b.eq	0xfffff7faad0c  // b.none
   0x0000fffff7fa982c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9830:	37d806a9	tbnz	w9, #27, 0xfffff7fa9904
   0x0000fffff7fa9834:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9838:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa983c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9840:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9844:	540001c1	b.ne	0xfffff7fa987c  // b.any
   0x0000fffff7fa9848:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa984c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9850:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9854:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9858:	54000121	b.ne	0xfffff7fa987c  // b.any
   0x0000fffff7fa985c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa9860:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa9864:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa9868:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa986c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9870:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa9874:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa9878:	14000030	b	0xfffff7fa9938
   0x0000fffff7fa987c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9880:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9884:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9888:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa988c:	54000120	b.eq	0xfffff7fa98b0  // b.none
   0x0000fffff7fa9890:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9894:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9898:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa989c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa98a0:	54000321	b.ne	0xfffff7fa9904  // b.any
   0x0000fffff7fa98a4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa98a8:	9e620120	scvtf	d0, x9
   0x0000fffff7fa98ac:	14000002	b	0xfffff7fa98b4
   0x0000fffff7fa98b0:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa98b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa98b8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa98bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa98c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa98c4:	54000120	b.eq	0xfffff7fa98e8  // b.none
   0x0000fffff7fa98c8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa98cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa98d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa98d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa98d8:	54000161	b.ne	0xfffff7fa9904  // b.any
   0x0000fffff7fa98dc:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa98e0:	9e620121	scvtf	d1, x9
   0x0000fffff7fa98e4:	14000002	b	0xfffff7fa98ec
   0x0000fffff7fa98e8:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa98ec:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa98f0:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa98f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa98f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa98fc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa9900:	17ffffde	b	0xfffff7fa9878
   0x0000fffff7fa9904:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9908:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa990c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9910:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9914:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fa9918:	aa1403e4	mov	x4, x20
   0x0000fffff7fa991c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9920:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa9924:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9928:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa992c:	d63f0200	blr	x16
   0x0000fffff7fa9930:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9934:	54009f00	b.eq	0xfffff7faad14  // b.none
   0x0000fffff7fa9938:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa993c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa9940:	540004a0	b.eq	0xfffff7fa99d4  // b.none
   0x0000fffff7fa9944:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa9948:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa994c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa9950:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa9954:	54000400	b.eq	0xfffff7fa99d4  // b.none
   0x0000fffff7fa9958:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa995c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa9960:	36d801d1	tbz	w17, #27, 0xfffff7fa9998
   0x0000fffff7fa9964:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa9968:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa996c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa9970:	54000321	b.ne	0xfffff7fa99d4  // b.any
   0x0000fffff7fa9974:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa9978:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa997c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa9980:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa9984:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9988:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa998c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa9990:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa9994:	54000209	b.ls	0xfffff7fa99d4  // b.plast
   0x0000fffff7fa9998:	36d8008d	tbz	w13, #27, 0xfffff7fa99a8
   0x0000fffff7fa999c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa99a0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa99a4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa99a8:	36d80091	tbz	w17, #27, 0xfffff7fa99b8
   0x0000fffff7fa99ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa99b0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa99b4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa99b8:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa99bc:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa99c0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa99c4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa99c8:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa99cc:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa99d0:	1400000e	b	0xfffff7fa9a08
   0x0000fffff7fa99d4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa99d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa99dc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa99e0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa99e4:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fa99e8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa99ec:	aa1603e5	mov	x5, x22
   0x0000fffff7fa99f0:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa99f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa99f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa99fc:	d63f0200	blr	x16
   0x0000fffff7fa9a00:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9a04:	540098c0	b.eq	0xfffff7faad1c  // b.none
   0x0000fffff7fa9a08:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9a0c:	37d806a9	tbnz	w9, #27, 0xfffff7fa9ae0
   0x0000fffff7fa9a10:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9a14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9a18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9a1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9a20:	540001c1	b.ne	0xfffff7fa9a58  // b.any
   0x0000fffff7fa9a24:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa9a28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9a2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9a30:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9a34:	54000121	b.ne	0xfffff7fa9a58  // b.any
   0x0000fffff7fa9a38:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa9a3c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa9a40:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa9a44:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9a48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9a4c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa9a50:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa9a54:	14000030	b	0xfffff7fa9b14
   0x0000fffff7fa9a58:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9a5c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9a60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9a64:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9a68:	54000120	b.eq	0xfffff7fa9a8c  // b.none
   0x0000fffff7fa9a6c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9a70:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9a74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9a78:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9a7c:	54000321	b.ne	0xfffff7fa9ae0  // b.any
   0x0000fffff7fa9a80:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa9a84:	9e620120	scvtf	d0, x9
   0x0000fffff7fa9a88:	14000002	b	0xfffff7fa9a90
   0x0000fffff7fa9a8c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa9a90:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa9a94:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9a98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9a9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9aa0:	54000120	b.eq	0xfffff7fa9ac4  // b.none
   0x0000fffff7fa9aa4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa9aa8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9aac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9ab0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9ab4:	54000161	b.ne	0xfffff7fa9ae0  // b.any
   0x0000fffff7fa9ab8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa9abc:	9e620121	scvtf	d1, x9
   0x0000fffff7fa9ac0:	14000002	b	0xfffff7fa9ac8
   0x0000fffff7fa9ac4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa9ac8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa9acc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa9ad0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9ad4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9ad8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa9adc:	17ffffde	b	0xfffff7fa9a54
   0x0000fffff7fa9ae0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9ae4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9ae8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9aec:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9af0:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fa9af4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9af8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9afc:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa9b00:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9b04:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9b08:	d63f0200	blr	x16
   0x0000fffff7fa9b0c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9b10:	540090a0	b.eq	0xfffff7faad24  // b.none
   0x0000fffff7fa9b14:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa9b18:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa9b1c:	540004a0	b.eq	0xfffff7fa9bb0  // b.none
   0x0000fffff7fa9b20:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa9b24:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa9b28:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa9b2c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa9b30:	54000400	b.eq	0xfffff7fa9bb0  // b.none
   0x0000fffff7fa9b34:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa9b38:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa9b3c:	36d801d1	tbz	w17, #27, 0xfffff7fa9b74
   0x0000fffff7fa9b40:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa9b44:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa9b48:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa9b4c:	54000321	b.ne	0xfffff7fa9bb0  // b.any
   0x0000fffff7fa9b50:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa9b54:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9b58:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa9b5c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa9b60:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9b64:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa9b68:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa9b6c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa9b70:	54000209	b.ls	0xfffff7fa9bb0  // b.plast
   0x0000fffff7fa9b74:	36d8008d	tbz	w13, #27, 0xfffff7fa9b84
   0x0000fffff7fa9b78:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa9b7c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa9b80:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa9b84:	36d80091	tbz	w17, #27, 0xfffff7fa9b94
   0x0000fffff7fa9b88:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9b8c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa9b90:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa9b94:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa9b98:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa9b9c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa9ba0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa9ba4:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa9ba8:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa9bac:	1400000e	b	0xfffff7fa9be4
   0x0000fffff7fa9bb0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa9bb4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9bb8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9bbc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9bc0:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fa9bc4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9bc8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9bcc:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa9bd0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9bd4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9bd8:	d63f0200	blr	x16
   0x0000fffff7fa9bdc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9be0:	54008a60	b.eq	0xfffff7faad2c  // b.none
   0x0000fffff7fa9be4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9be8:	37d806a9	tbnz	w9, #27, 0xfffff7fa9cbc
   0x0000fffff7fa9bec:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9bf0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9bf4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9bf8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9bfc:	540001c1	b.ne	0xfffff7fa9c34  // b.any
   0x0000fffff7fa9c00:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa9c04:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9c08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9c0c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9c10:	54000121	b.ne	0xfffff7fa9c34  // b.any
   0x0000fffff7fa9c14:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa9c18:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa9c1c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa9c20:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9c24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9c28:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa9c2c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa9c30:	14000030	b	0xfffff7fa9cf0
   0x0000fffff7fa9c34:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9c38:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9c3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9c40:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9c44:	54000120	b.eq	0xfffff7fa9c68  // b.none
   0x0000fffff7fa9c48:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9c4c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9c50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9c54:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9c58:	54000321	b.ne	0xfffff7fa9cbc  // b.any
   0x0000fffff7fa9c5c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa9c60:	9e620120	scvtf	d0, x9
   0x0000fffff7fa9c64:	14000002	b	0xfffff7fa9c6c
   0x0000fffff7fa9c68:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa9c6c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa9c70:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9c74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9c78:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9c7c:	54000120	b.eq	0xfffff7fa9ca0  // b.none
   0x0000fffff7fa9c80:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa9c84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9c88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9c8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9c90:	54000161	b.ne	0xfffff7fa9cbc  // b.any
   0x0000fffff7fa9c94:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa9c98:	9e620121	scvtf	d1, x9
   0x0000fffff7fa9c9c:	14000002	b	0xfffff7fa9ca4
   0x0000fffff7fa9ca0:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa9ca4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa9ca8:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa9cac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9cb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9cb4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa9cb8:	17ffffde	b	0xfffff7fa9c30
   0x0000fffff7fa9cbc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9cc0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9cc4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9cc8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9ccc:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fa9cd0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9cd4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9cd8:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa9cdc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9ce0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9ce4:	d63f0200	blr	x16
   0x0000fffff7fa9ce8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9cec:	54008240	b.eq	0xfffff7faad34  // b.none
   0x0000fffff7fa9cf0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa9cf4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa9cf8:	540004a0	b.eq	0xfffff7fa9d8c  // b.none
   0x0000fffff7fa9cfc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa9d00:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa9d04:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa9d08:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa9d0c:	54000400	b.eq	0xfffff7fa9d8c  // b.none
   0x0000fffff7fa9d10:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa9d14:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa9d18:	36d801d1	tbz	w17, #27, 0xfffff7fa9d50
   0x0000fffff7fa9d1c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa9d20:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa9d24:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa9d28:	54000321	b.ne	0xfffff7fa9d8c  // b.any
   0x0000fffff7fa9d2c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa9d30:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9d34:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa9d38:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa9d3c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9d40:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa9d44:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa9d48:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa9d4c:	54000209	b.ls	0xfffff7fa9d8c  // b.plast
   0x0000fffff7fa9d50:	36d8008d	tbz	w13, #27, 0xfffff7fa9d60
   0x0000fffff7fa9d54:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa9d58:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa9d5c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa9d60:	36d80091	tbz	w17, #27, 0xfffff7fa9d70
   0x0000fffff7fa9d64:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9d68:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa9d6c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa9d70:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa9d74:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa9d78:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa9d7c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa9d80:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa9d84:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa9d88:	1400000e	b	0xfffff7fa9dc0
   0x0000fffff7fa9d8c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa9d90:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9d94:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9d98:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9d9c:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fa9da0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9da4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9da8:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa9dac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9db0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9db4:	d63f0200	blr	x16
   0x0000fffff7fa9db8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9dbc:	54007c00	b.eq	0xfffff7faad3c  // b.none
   0x0000fffff7fa9dc0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9dc4:	37d806a9	tbnz	w9, #27, 0xfffff7fa9e98
   0x0000fffff7fa9dc8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9dcc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9dd0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9dd4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9dd8:	540001c1	b.ne	0xfffff7fa9e10  // b.any
   0x0000fffff7fa9ddc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa9de0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9de4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9de8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9dec:	54000121	b.ne	0xfffff7fa9e10  // b.any
   0x0000fffff7fa9df0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa9df4:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa9df8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa9dfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9e00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9e04:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa9e08:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa9e0c:	14000030	b	0xfffff7fa9ecc
   0x0000fffff7fa9e10:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9e14:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9e18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9e1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9e20:	54000120	b.eq	0xfffff7fa9e44  // b.none
   0x0000fffff7fa9e24:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9e28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9e2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9e30:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9e34:	54000321	b.ne	0xfffff7fa9e98  // b.any
   0x0000fffff7fa9e38:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa9e3c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa9e40:	14000002	b	0xfffff7fa9e48
   0x0000fffff7fa9e44:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa9e48:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa9e4c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9e50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9e54:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9e58:	54000120	b.eq	0xfffff7fa9e7c  // b.none
   0x0000fffff7fa9e5c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa9e60:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9e64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9e68:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9e6c:	54000161	b.ne	0xfffff7fa9e98  // b.any
   0x0000fffff7fa9e70:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa9e74:	9e620121	scvtf	d1, x9
   0x0000fffff7fa9e78:	14000002	b	0xfffff7fa9e80
   0x0000fffff7fa9e7c:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa9e80:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa9e84:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa9e88:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9e8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9e90:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa9e94:	17ffffde	b	0xfffff7fa9e0c
   0x0000fffff7fa9e98:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9e9c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9ea0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9ea4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9ea8:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fa9eac:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9eb0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9eb4:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa9eb8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9ebc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9ec0:	d63f0200	blr	x16
   0x0000fffff7fa9ec4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9ec8:	540073e0	b.eq	0xfffff7faad44  // b.none
   0x0000fffff7fa9ecc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa9ed0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa9ed4:	540004a0	b.eq	0xfffff7fa9f68  // b.none
   0x0000fffff7fa9ed8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa9edc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa9ee0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa9ee4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa9ee8:	54000400	b.eq	0xfffff7fa9f68  // b.none
   0x0000fffff7fa9eec:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa9ef0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa9ef4:	36d801d1	tbz	w17, #27, 0xfffff7fa9f2c
   0x0000fffff7fa9ef8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa9efc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa9f00:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa9f04:	54000321	b.ne	0xfffff7fa9f68  // b.any
   0x0000fffff7fa9f08:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa9f0c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9f10:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa9f14:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa9f18:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9f1c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa9f20:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa9f24:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa9f28:	54000209	b.ls	0xfffff7fa9f68  // b.plast
   0x0000fffff7fa9f2c:	36d8008d	tbz	w13, #27, 0xfffff7fa9f3c
   0x0000fffff7fa9f30:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa9f34:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa9f38:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa9f3c:	36d80091	tbz	w17, #27, 0xfffff7fa9f4c
   0x0000fffff7fa9f40:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9f44:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa9f48:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa9f4c:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa9f50:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa9f54:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa9f58:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa9f5c:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa9f60:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa9f64:	1400000e	b	0xfffff7fa9f9c
   0x0000fffff7fa9f68:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa9f6c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9f70:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9f74:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9f78:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fa9f7c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9f80:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9f84:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa9f88:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9f8c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9f90:	d63f0200	blr	x16
   0x0000fffff7fa9f94:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9f98:	54006da0	b.eq	0xfffff7faad4c  // b.none
   0x0000fffff7fa9f9c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9fa0:	37d806a9	tbnz	w9, #27, 0xfffff7faa074
   0x0000fffff7fa9fa4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9fa8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9fac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9fb0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9fb4:	540001c1	b.ne	0xfffff7fa9fec  // b.any
   0x0000fffff7fa9fb8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa9fbc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9fc0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9fc4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9fc8:	54000121	b.ne	0xfffff7fa9fec  // b.any
   0x0000fffff7fa9fcc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa9fd0:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa9fd4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa9fd8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9fdc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9fe0:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa9fe4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa9fe8:	14000030	b	0xfffff7faa0a8
   0x0000fffff7fa9fec:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9ff0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9ff4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9ff8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9ffc:	54000120	b.eq	0xfffff7faa020  // b.none
   0x0000fffff7faa000:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa004:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa008:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa00c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa010:	54000321	b.ne	0xfffff7faa074  // b.any
   0x0000fffff7faa014:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faa018:	9e620120	scvtf	d0, x9
   0x0000fffff7faa01c:	14000002	b	0xfffff7faa024
   0x0000fffff7faa020:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7faa024:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faa028:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa02c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa030:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa034:	54000120	b.eq	0xfffff7faa058  // b.none
   0x0000fffff7faa038:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faa03c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa040:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa044:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa048:	54000161	b.ne	0xfffff7faa074  // b.any
   0x0000fffff7faa04c:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7faa050:	9e620121	scvtf	d1, x9
   0x0000fffff7faa054:	14000002	b	0xfffff7faa05c
   0x0000fffff7faa058:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7faa05c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faa060:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7faa064:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa068:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa06c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faa070:	17ffffde	b	0xfffff7fa9fe8
   0x0000fffff7faa074:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa078:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa07c:	aa1303e1	mov	x1, x19
   0x0000fffff7faa080:	aa1503e2	mov	x2, x21
   0x0000fffff7faa084:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7faa088:	aa1403e4	mov	x4, x20
   0x0000fffff7faa08c:	aa1603e5	mov	x5, x22
   0x0000fffff7faa090:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7faa094:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa098:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa09c:	d63f0200	blr	x16
   0x0000fffff7faa0a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa0a4:	54006580	b.eq	0xfffff7faad54  // b.none
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
   0x0000fffff7faa128:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7faa12c:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7faa130:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faa134:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faa138:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7faa13c:	b900526d	str	w13, [x19, #80]
   0x0000fffff7faa140:	1400000e	b	0xfffff7faa178
   0x0000fffff7faa144:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faa148:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa14c:	aa1303e1	mov	x1, x19
   0x0000fffff7faa150:	aa1503e2	mov	x2, x21
   0x0000fffff7faa154:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7faa158:	aa1403e4	mov	x4, x20
   0x0000fffff7faa15c:	aa1603e5	mov	x5, x22
   0x0000fffff7faa160:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7faa164:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa168:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa16c:	d63f0200	blr	x16
   0x0000fffff7faa170:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa174:	54005f40	b.eq	0xfffff7faad5c  // b.none
   0x0000fffff7faa178:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa17c:	37d806a9	tbnz	w9, #27, 0xfffff7faa250
   0x0000fffff7faa180:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa184:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa188:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa18c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa190:	540001c1	b.ne	0xfffff7faa1c8  // b.any
   0x0000fffff7faa194:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faa198:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa19c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa1a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa1a4:	54000121	b.ne	0xfffff7faa1c8  // b.any
   0x0000fffff7faa1a8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faa1ac:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7faa1b0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faa1b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa1b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa1bc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7faa1c0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faa1c4:	14000030	b	0xfffff7faa284
   0x0000fffff7faa1c8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa1cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa1d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa1d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa1d8:	54000120	b.eq	0xfffff7faa1fc  // b.none
   0x0000fffff7faa1dc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa1e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa1e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa1e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa1ec:	54000321	b.ne	0xfffff7faa250  // b.any
   0x0000fffff7faa1f0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faa1f4:	9e620120	scvtf	d0, x9
   0x0000fffff7faa1f8:	14000002	b	0xfffff7faa200
   0x0000fffff7faa1fc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7faa200:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faa204:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa208:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa20c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa210:	54000120	b.eq	0xfffff7faa234  // b.none
   0x0000fffff7faa214:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faa218:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa21c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa220:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa224:	54000161	b.ne	0xfffff7faa250  // b.any
   0x0000fffff7faa228:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7faa22c:	9e620121	scvtf	d1, x9
   0x0000fffff7faa230:	14000002	b	0xfffff7faa238
   0x0000fffff7faa234:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7faa238:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faa23c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7faa240:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa244:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa248:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faa24c:	17ffffde	b	0xfffff7faa1c4
   0x0000fffff7faa250:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa254:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa258:	aa1303e1	mov	x1, x19
   0x0000fffff7faa25c:	aa1503e2	mov	x2, x21
   0x0000fffff7faa260:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7faa264:	aa1403e4	mov	x4, x20
   0x0000fffff7faa268:	aa1603e5	mov	x5, x22
   0x0000fffff7faa26c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7faa270:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa274:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa278:	d63f0200	blr	x16
   0x0000fffff7faa27c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa280:	54005720	b.eq	0xfffff7faad64  // b.none
   0x0000fffff7faa284:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faa288:	f100017f	cmp	x11, #0x0
   0x0000fffff7faa28c:	540004a0	b.eq	0xfffff7faa320  // b.none
   0x0000fffff7faa290:	b940016d	ldr	w13, [x11]
   0x0000fffff7faa294:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faa298:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faa29c:	eb0901bf	cmp	x13, x9
   0x0000fffff7faa2a0:	54000400	b.eq	0xfffff7faa320  // b.none
   0x0000fffff7faa2a4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faa2a8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faa2ac:	36d801d1	tbz	w17, #27, 0xfffff7faa2e4
   0x0000fffff7faa2b0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa2b4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa2b8:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa2bc:	54000321	b.ne	0xfffff7faa320  // b.any
   0x0000fffff7faa2c0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faa2c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa2c8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faa2cc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faa2d0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faa2d4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faa2d8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faa2dc:	f100055f	cmp	x10, #0x1
   0x0000fffff7faa2e0:	54000209	b.ls	0xfffff7faa320  // b.plast
   0x0000fffff7faa2e4:	36d8008d	tbz	w13, #27, 0xfffff7faa2f4
   0x0000fffff7faa2e8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faa2ec:	91000529	add	x9, x9, #0x1
   0x0000fffff7faa2f0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faa2f4:	36d80091	tbz	w17, #27, 0xfffff7faa304
   0x0000fffff7faa2f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa2fc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faa300:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faa304:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7faa308:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7faa30c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faa310:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faa314:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7faa318:	b900526d	str	w13, [x19, #80]
   0x0000fffff7faa31c:	1400000e	b	0xfffff7faa354
   0x0000fffff7faa320:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faa324:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa328:	aa1303e1	mov	x1, x19
   0x0000fffff7faa32c:	aa1503e2	mov	x2, x21
   0x0000fffff7faa330:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7faa334:	aa1403e4	mov	x4, x20
   0x0000fffff7faa338:	aa1603e5	mov	x5, x22
   0x0000fffff7faa33c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7faa340:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa344:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa348:	d63f0200	blr	x16
   0x0000fffff7faa34c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa350:	540050e0	b.eq	0xfffff7faad6c  // b.none
   0x0000fffff7faa354:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa358:	37d806a9	tbnz	w9, #27, 0xfffff7faa42c
   0x0000fffff7faa35c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa360:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa364:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa368:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa36c:	540001c1	b.ne	0xfffff7faa3a4  // b.any
   0x0000fffff7faa370:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faa374:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa378:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa37c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa380:	54000121	b.ne	0xfffff7faa3a4  // b.any
   0x0000fffff7faa384:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faa388:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7faa38c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faa390:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa394:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa398:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7faa39c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faa3a0:	14000030	b	0xfffff7faa460
   0x0000fffff7faa3a4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa3a8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa3ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa3b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa3b4:	54000120	b.eq	0xfffff7faa3d8  // b.none
   0x0000fffff7faa3b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa3bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa3c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa3c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa3c8:	54000321	b.ne	0xfffff7faa42c  // b.any
   0x0000fffff7faa3cc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faa3d0:	9e620120	scvtf	d0, x9
   0x0000fffff7faa3d4:	14000002	b	0xfffff7faa3dc
   0x0000fffff7faa3d8:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7faa3dc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faa3e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa3e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa3e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa3ec:	54000120	b.eq	0xfffff7faa410  // b.none
   0x0000fffff7faa3f0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faa3f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa3f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa3fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa400:	54000161	b.ne	0xfffff7faa42c  // b.any
   0x0000fffff7faa404:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7faa408:	9e620121	scvtf	d1, x9
   0x0000fffff7faa40c:	14000002	b	0xfffff7faa414
   0x0000fffff7faa410:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7faa414:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faa418:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7faa41c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa420:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa424:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faa428:	17ffffde	b	0xfffff7faa3a0
   0x0000fffff7faa42c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa430:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa434:	aa1303e1	mov	x1, x19
   0x0000fffff7faa438:	aa1503e2	mov	x2, x21
   0x0000fffff7faa43c:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7faa440:	aa1403e4	mov	x4, x20
   0x0000fffff7faa444:	aa1603e5	mov	x5, x22
   0x0000fffff7faa448:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7faa44c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa450:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa454:	d63f0200	blr	x16
   0x0000fffff7faa458:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa45c:	540048c0	b.eq	0xfffff7faad74  // b.none
   0x0000fffff7faa460:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faa464:	f100017f	cmp	x11, #0x0
   0x0000fffff7faa468:	540004a0	b.eq	0xfffff7faa4fc  // b.none
   0x0000fffff7faa46c:	b940016d	ldr	w13, [x11]
   0x0000fffff7faa470:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faa474:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faa478:	eb0901bf	cmp	x13, x9
   0x0000fffff7faa47c:	54000400	b.eq	0xfffff7faa4fc  // b.none
   0x0000fffff7faa480:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faa484:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faa488:	36d801d1	tbz	w17, #27, 0xfffff7faa4c0
   0x0000fffff7faa48c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa490:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa494:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa498:	54000321	b.ne	0xfffff7faa4fc  // b.any
   0x0000fffff7faa49c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faa4a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa4a4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faa4a8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faa4ac:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faa4b0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faa4b4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faa4b8:	f100055f	cmp	x10, #0x1
   0x0000fffff7faa4bc:	54000209	b.ls	0xfffff7faa4fc  // b.plast
   0x0000fffff7faa4c0:	36d8008d	tbz	w13, #27, 0xfffff7faa4d0
   0x0000fffff7faa4c4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faa4c8:	91000529	add	x9, x9, #0x1
   0x0000fffff7faa4cc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faa4d0:	36d80091	tbz	w17, #27, 0xfffff7faa4e0
   0x0000fffff7faa4d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa4d8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faa4dc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faa4e0:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7faa4e4:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7faa4e8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faa4ec:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faa4f0:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7faa4f4:	b900526d	str	w13, [x19, #80]
   0x0000fffff7faa4f8:	1400000e	b	0xfffff7faa530
   0x0000fffff7faa4fc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faa500:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa504:	aa1303e1	mov	x1, x19
   0x0000fffff7faa508:	aa1503e2	mov	x2, x21
   0x0000fffff7faa50c:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7faa510:	aa1403e4	mov	x4, x20
   0x0000fffff7faa514:	aa1603e5	mov	x5, x22
   0x0000fffff7faa518:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7faa51c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa520:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa524:	d63f0200	blr	x16
   0x0000fffff7faa528:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa52c:	54004280	b.eq	0xfffff7faad7c  // b.none
   0x0000fffff7faa530:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa534:	37d806a9	tbnz	w9, #27, 0xfffff7faa608
   0x0000fffff7faa538:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa53c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa540:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa544:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa548:	540001c1	b.ne	0xfffff7faa580  // b.any
   0x0000fffff7faa54c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faa550:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa554:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa558:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa55c:	54000121	b.ne	0xfffff7faa580  // b.any
   0x0000fffff7faa560:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faa564:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7faa568:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faa56c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa570:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa574:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7faa578:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faa57c:	14000030	b	0xfffff7faa63c
   0x0000fffff7faa580:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa584:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa588:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa58c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa590:	54000120	b.eq	0xfffff7faa5b4  // b.none
   0x0000fffff7faa594:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa598:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa59c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa5a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa5a4:	54000321	b.ne	0xfffff7faa608  // b.any
   0x0000fffff7faa5a8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faa5ac:	9e620120	scvtf	d0, x9
   0x0000fffff7faa5b0:	14000002	b	0xfffff7faa5b8
   0x0000fffff7faa5b4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7faa5b8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faa5bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa5c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa5c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa5c8:	54000120	b.eq	0xfffff7faa5ec  // b.none
   0x0000fffff7faa5cc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faa5d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa5d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa5d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa5dc:	54000161	b.ne	0xfffff7faa608  // b.any
   0x0000fffff7faa5e0:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7faa5e4:	9e620121	scvtf	d1, x9
   0x0000fffff7faa5e8:	14000002	b	0xfffff7faa5f0
   0x0000fffff7faa5ec:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7faa5f0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faa5f4:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7faa5f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa5fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa600:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faa604:	17ffffde	b	0xfffff7faa57c
   0x0000fffff7faa608:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa60c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa610:	aa1303e1	mov	x1, x19
   0x0000fffff7faa614:	aa1503e2	mov	x2, x21
   0x0000fffff7faa618:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7faa61c:	aa1403e4	mov	x4, x20
   0x0000fffff7faa620:	aa1603e5	mov	x5, x22
   0x0000fffff7faa624:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7faa628:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa62c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa630:	d63f0200	blr	x16
   0x0000fffff7faa634:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa638:	54003a60	b.eq	0xfffff7faad84  // b.none
   0x0000fffff7faa63c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faa640:	f100017f	cmp	x11, #0x0
   0x0000fffff7faa644:	540004a0	b.eq	0xfffff7faa6d8  // b.none
   0x0000fffff7faa648:	b940016d	ldr	w13, [x11]
   0x0000fffff7faa64c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faa650:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faa654:	eb0901bf	cmp	x13, x9
   0x0000fffff7faa658:	54000400	b.eq	0xfffff7faa6d8  // b.none
   0x0000fffff7faa65c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faa660:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faa664:	36d801d1	tbz	w17, #27, 0xfffff7faa69c
   0x0000fffff7faa668:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa66c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa670:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa674:	54000321	b.ne	0xfffff7faa6d8  // b.any
   0x0000fffff7faa678:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faa67c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa680:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faa684:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faa688:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faa68c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faa690:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faa694:	f100055f	cmp	x10, #0x1
   0x0000fffff7faa698:	54000209	b.ls	0xfffff7faa6d8  // b.plast
   0x0000fffff7faa69c:	36d8008d	tbz	w13, #27, 0xfffff7faa6ac
   0x0000fffff7faa6a0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faa6a4:	91000529	add	x9, x9, #0x1
   0x0000fffff7faa6a8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faa6ac:	36d80091	tbz	w17, #27, 0xfffff7faa6bc
   0x0000fffff7faa6b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa6b4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faa6b8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faa6bc:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7faa6c0:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7faa6c4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faa6c8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faa6cc:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7faa6d0:	b900526d	str	w13, [x19, #80]
   0x0000fffff7faa6d4:	1400000e	b	0xfffff7faa70c
   0x0000fffff7faa6d8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faa6dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa6e0:	aa1303e1	mov	x1, x19
   0x0000fffff7faa6e4:	aa1503e2	mov	x2, x21
   0x0000fffff7faa6e8:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7faa6ec:	aa1403e4	mov	x4, x20
   0x0000fffff7faa6f0:	aa1603e5	mov	x5, x22
   0x0000fffff7faa6f4:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7faa6f8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa6fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa700:	d63f0200	blr	x16
   0x0000fffff7faa704:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa708:	54003420	b.eq	0xfffff7faad8c  // b.none
   0x0000fffff7faa70c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa710:	37d806a9	tbnz	w9, #27, 0xfffff7faa7e4
   0x0000fffff7faa714:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa718:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa71c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa720:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa724:	540001c1	b.ne	0xfffff7faa75c  // b.any
   0x0000fffff7faa728:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faa72c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa730:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa734:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa738:	54000121	b.ne	0xfffff7faa75c  // b.any
   0x0000fffff7faa73c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faa740:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7faa744:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faa748:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa74c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa750:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7faa754:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faa758:	14000030	b	0xfffff7faa818
   0x0000fffff7faa75c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa760:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa764:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa768:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa76c:	54000120	b.eq	0xfffff7faa790  // b.none
   0x0000fffff7faa770:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa774:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa778:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa77c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa780:	54000321	b.ne	0xfffff7faa7e4  // b.any
   0x0000fffff7faa784:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faa788:	9e620120	scvtf	d0, x9
   0x0000fffff7faa78c:	14000002	b	0xfffff7faa794
   0x0000fffff7faa790:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7faa794:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faa798:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa79c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa7a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa7a4:	54000120	b.eq	0xfffff7faa7c8  // b.none
   0x0000fffff7faa7a8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faa7ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa7b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa7b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa7b8:	54000161	b.ne	0xfffff7faa7e4  // b.any
   0x0000fffff7faa7bc:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7faa7c0:	9e620121	scvtf	d1, x9
   0x0000fffff7faa7c4:	14000002	b	0xfffff7faa7cc
   0x0000fffff7faa7c8:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7faa7cc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faa7d0:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7faa7d4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa7d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa7dc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faa7e0:	17ffffde	b	0xfffff7faa758
   0x0000fffff7faa7e4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa7e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa7ec:	aa1303e1	mov	x1, x19
   0x0000fffff7faa7f0:	aa1503e2	mov	x2, x21
   0x0000fffff7faa7f4:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7faa7f8:	aa1403e4	mov	x4, x20
   0x0000fffff7faa7fc:	aa1603e5	mov	x5, x22
   0x0000fffff7faa800:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7faa804:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa808:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa80c:	d63f0200	blr	x16
   0x0000fffff7faa810:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa814:	54002c00	b.eq	0xfffff7faad94  // b.none
   0x0000fffff7faa818:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faa81c:	f100017f	cmp	x11, #0x0
   0x0000fffff7faa820:	540004a0	b.eq	0xfffff7faa8b4  // b.none
   0x0000fffff7faa824:	b940016d	ldr	w13, [x11]
   0x0000fffff7faa828:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faa82c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faa830:	eb0901bf	cmp	x13, x9
   0x0000fffff7faa834:	54000400	b.eq	0xfffff7faa8b4  // b.none
   0x0000fffff7faa838:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faa83c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faa840:	36d801d1	tbz	w17, #27, 0xfffff7faa878
   0x0000fffff7faa844:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa848:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa84c:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa850:	54000321	b.ne	0xfffff7faa8b4  // b.any
   0x0000fffff7faa854:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faa858:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa85c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faa860:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faa864:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faa868:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faa86c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faa870:	f100055f	cmp	x10, #0x1
   0x0000fffff7faa874:	54000209	b.ls	0xfffff7faa8b4  // b.plast
   0x0000fffff7faa878:	36d8008d	tbz	w13, #27, 0xfffff7faa888
   0x0000fffff7faa87c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faa880:	91000529	add	x9, x9, #0x1
   0x0000fffff7faa884:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faa888:	36d80091	tbz	w17, #27, 0xfffff7faa898
   0x0000fffff7faa88c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa890:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faa894:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faa898:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7faa89c:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7faa8a0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faa8a4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faa8a8:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7faa8ac:	b900526d	str	w13, [x19, #80]
   0x0000fffff7faa8b0:	1400000e	b	0xfffff7faa8e8
   0x0000fffff7faa8b4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faa8b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa8bc:	aa1303e1	mov	x1, x19
   0x0000fffff7faa8c0:	aa1503e2	mov	x2, x21
   0x0000fffff7faa8c4:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7faa8c8:	aa1403e4	mov	x4, x20
   0x0000fffff7faa8cc:	aa1603e5	mov	x5, x22
   0x0000fffff7faa8d0:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7faa8d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa8d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa8dc:	d63f0200	blr	x16
   0x0000fffff7faa8e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa8e4:	540025c0	b.eq	0xfffff7faad9c  // b.none
   0x0000fffff7faa8e8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa8ec:	37d806a9	tbnz	w9, #27, 0xfffff7faa9c0
   0x0000fffff7faa8f0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa8f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa8f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa8fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa900:	540001c1	b.ne	0xfffff7faa938  // b.any
   0x0000fffff7faa904:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faa908:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa90c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa910:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa914:	54000121	b.ne	0xfffff7faa938  // b.any
   0x0000fffff7faa918:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faa91c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7faa920:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faa924:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa928:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa92c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7faa930:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faa934:	14000030	b	0xfffff7faa9f4
   0x0000fffff7faa938:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa93c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa940:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa944:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa948:	54000120	b.eq	0xfffff7faa96c  // b.none
   0x0000fffff7faa94c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa950:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa954:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa958:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa95c:	54000321	b.ne	0xfffff7faa9c0  // b.any
   0x0000fffff7faa960:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faa964:	9e620120	scvtf	d0, x9
   0x0000fffff7faa968:	14000002	b	0xfffff7faa970
   0x0000fffff7faa96c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7faa970:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faa974:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa978:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa97c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa980:	54000120	b.eq	0xfffff7faa9a4  // b.none
   0x0000fffff7faa984:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faa988:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa98c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa990:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa994:	54000161	b.ne	0xfffff7faa9c0  // b.any
   0x0000fffff7faa998:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7faa99c:	9e620121	scvtf	d1, x9
   0x0000fffff7faa9a0:	14000002	b	0xfffff7faa9a8
   0x0000fffff7faa9a4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7faa9a8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faa9ac:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7faa9b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa9b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa9b8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faa9bc:	17ffffde	b	0xfffff7faa934
   0x0000fffff7faa9c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa9c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa9c8:	aa1303e1	mov	x1, x19
   0x0000fffff7faa9cc:	aa1503e2	mov	x2, x21
   0x0000fffff7faa9d0:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7faa9d4:	aa1403e4	mov	x4, x20
   0x0000fffff7faa9d8:	aa1603e5	mov	x5, x22
   0x0000fffff7faa9dc:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7faa9e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa9e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa9e8:	d63f0200	blr	x16
   0x0000fffff7faa9ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa9f0:	54001da0	b.eq	0xfffff7faada4  // b.none
   0x0000fffff7faa9f4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faa9f8:	f100017f	cmp	x11, #0x0
   0x0000fffff7faa9fc:	540004a0	b.eq	0xfffff7faaa90  // b.none
   0x0000fffff7faaa00:	b940016d	ldr	w13, [x11]
   0x0000fffff7faaa04:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faaa08:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faaa0c:	eb0901bf	cmp	x13, x9
   0x0000fffff7faaa10:	54000400	b.eq	0xfffff7faaa90  // b.none
   0x0000fffff7faaa14:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faaa18:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faaa1c:	36d801d1	tbz	w17, #27, 0xfffff7faaa54
   0x0000fffff7faaa20:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faaa24:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faaa28:	f100013f	cmp	x9, #0x0
   0x0000fffff7faaa2c:	54000321	b.ne	0xfffff7faaa90  // b.any
   0x0000fffff7faaa30:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faaa34:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faaa38:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faaa3c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faaa40:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faaa44:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faaa48:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faaa4c:	f100055f	cmp	x10, #0x1
   0x0000fffff7faaa50:	54000209	b.ls	0xfffff7faaa90  // b.plast
   0x0000fffff7faaa54:	36d8008d	tbz	w13, #27, 0xfffff7faaa64
   0x0000fffff7faaa58:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faaa5c:	91000529	add	x9, x9, #0x1
   0x0000fffff7faaa60:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faaa64:	36d80091	tbz	w17, #27, 0xfffff7faaa74
   0x0000fffff7faaa68:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faaa6c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faaa70:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faaa74:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7faaa78:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7faaa7c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faaa80:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faaa84:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7faaa88:	b900526d	str	w13, [x19, #80]
   0x0000fffff7faaa8c:	1400000e	b	0xfffff7faaac4
   0x0000fffff7faaa90:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faaa94:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faaa98:	aa1303e1	mov	x1, x19
   0x0000fffff7faaa9c:	aa1503e2	mov	x2, x21
   0x0000fffff7faaaa0:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7faaaa4:	aa1403e4	mov	x4, x20
   0x0000fffff7faaaa8:	aa1603e5	mov	x5, x22
   0x0000fffff7faaaac:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7faaab0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faaab4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faaab8:	d63f0200	blr	x16
   0x0000fffff7faaabc:	f100001f	cmp	x0, #0x0
   0x0000fffff7faaac0:	54001760	b.eq	0xfffff7faadac  // b.none
   0x0000fffff7faaac4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faaac8:	37d806a9	tbnz	w9, #27, 0xfffff7faab9c
   0x0000fffff7faaacc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faaad0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faaad4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faaad8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faaadc:	540001c1	b.ne	0xfffff7faab14  // b.any
   0x0000fffff7faaae0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faaae4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faaae8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faaaec:	eb0a013f	cmp	x9, x10
   0x0000fffff7faaaf0:	54000121	b.ne	0xfffff7faab14  // b.any
   0x0000fffff7faaaf4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faaaf8:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7faaafc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faab00:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faab04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faab08:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7faab0c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faab10:	14000030	b	0xfffff7faabd0
   0x0000fffff7faab14:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faab18:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faab1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faab20:	eb0a013f	cmp	x9, x10
   0x0000fffff7faab24:	54000120	b.eq	0xfffff7faab48  // b.none
   0x0000fffff7faab28:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faab2c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faab30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faab34:	eb0a013f	cmp	x9, x10
   0x0000fffff7faab38:	54000321	b.ne	0xfffff7faab9c  // b.any
   0x0000fffff7faab3c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faab40:	9e620120	scvtf	d0, x9
   0x0000fffff7faab44:	14000002	b	0xfffff7faab4c
   0x0000fffff7faab48:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7faab4c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faab50:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faab54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faab58:	eb0a013f	cmp	x9, x10
   0x0000fffff7faab5c:	54000120	b.eq	0xfffff7faab80  // b.none
   0x0000fffff7faab60:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faab64:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faab68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faab6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faab70:	54000161	b.ne	0xfffff7faab9c  // b.any
   0x0000fffff7faab74:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7faab78:	9e620121	scvtf	d1, x9
   0x0000fffff7faab7c:	14000002	b	0xfffff7faab84
   0x0000fffff7faab80:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7faab84:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faab88:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7faab8c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faab90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faab94:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faab98:	17ffffde	b	0xfffff7faab10
   0x0000fffff7faab9c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faaba0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faaba4:	aa1303e1	mov	x1, x19
   0x0000fffff7faaba8:	aa1503e2	mov	x2, x21
   0x0000fffff7faabac:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7faabb0:	aa1403e4	mov	x4, x20
   0x0000fffff7faabb4:	aa1603e5	mov	x5, x22
   0x0000fffff7faabb8:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7faabbc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faabc0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faabc4:	d63f0200	blr	x16
   0x0000fffff7faabc8:	f100001f	cmp	x0, #0x0
   0x0000fffff7faabcc:	54000f40	b.eq	0xfffff7faadb4  // b.none
   0x0000fffff7faabd0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faabd4:	37d80269	tbnz	w9, #27, 0xfffff7faac20
   0x0000fffff7faabd8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faabdc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faabe0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faabe4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faabe8:	540001c1	b.ne	0xfffff7faac20  // b.any
   0x0000fffff7faabec:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faabf0:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7faabf4:	8b0a012b	add	x11, x9, x10
   0x0000fffff7faabf8:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7faabfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faac00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faac04:	b900526a	str	w10, [x19, #80]
   0x0000fffff7faac08:	aa0b03e9	mov	x9, x11
   0x0000fffff7faac0c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faac10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faac14:	f9002669	str	x9, [x19, #72]
   0x0000fffff7faac18:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faac1c:	1400000e	b	0xfffff7faac54
   0x0000fffff7faac20:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faac24:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faac28:	aa1303e1	mov	x1, x19
   0x0000fffff7faac2c:	aa1503e2	mov	x2, x21
   0x0000fffff7faac30:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7faac34:	aa1403e4	mov	x4, x20
   0x0000fffff7faac38:	aa1603e5	mov	x5, x22
   0x0000fffff7faac3c:	d290bc10	mov	x16, #0x85e0                	// #34272
   0x0000fffff7faac40:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faac44:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faac48:	d63f0200	blr	x16
   0x0000fffff7faac4c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faac50:	54000b60	b.eq	0xfffff7faadbc  // b.none
   0x0000fffff7faac54:	17fff949	b	0xfffff7fa9178
   0x0000fffff7faac58:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faac5c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faac60:	aa1303e1	mov	x1, x19
   0x0000fffff7faac64:	aa1503e2	mov	x2, x21
   0x0000fffff7faac68:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7faac6c:	aa1403e4	mov	x4, x20
   0x0000fffff7faac70:	aa1603e5	mov	x5, x22
   0x0000fffff7faac74:	d286be90	mov	x16, #0x35f4                	// #13812
   0x0000fffff7faac78:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faac7c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faac80:	d63f0200	blr	x16
   0x0000fffff7faac84:	910143ff	add	sp, sp, #0x50
   0x0000fffff7faac88:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7faac8c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7faac90:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7faac94:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7faac98:	d65f03c0	ret
   0x0000fffff7faac9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faaca0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faaca4:	b900028a	str	w10, [x20]
   0x0000fffff7faaca8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7faacac:	910143ff	add	sp, sp, #0x50
   0x0000fffff7faacb0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7faacb4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7faacb8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7faacbc:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7faacc0:	d65f03c0	ret
   0x0000fffff7faacc4:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7faacc8:	17fffff5	b	0xfffff7faac9c
   0x0000fffff7faaccc:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7faacd0:	17fffff3	b	0xfffff7faac9c
   0x0000fffff7faacd4:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7faacd8:	17fffff1	b	0xfffff7faac9c
   0x0000fffff7faacdc:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7faace0:	17ffffef	b	0xfffff7faac9c
   0x0000fffff7faace4:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7faace8:	17ffffed	b	0xfffff7faac9c
   0x0000fffff7faacec:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7faacf0:	17ffffeb	b	0xfffff7faac9c
   0x0000fffff7faacf4:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7faacf8:	17ffffe9	b	0xfffff7faac9c
   0x0000fffff7faacfc:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7faad00:	17ffffe7	b	0xfffff7faac9c
   0x0000fffff7faad04:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7faad08:	17ffffe5	b	0xfffff7faac9c
   0x0000fffff7faad0c:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7faad10:	17ffffe3	b	0xfffff7faac9c
   0x0000fffff7faad14:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7faad18:	17ffffe1	b	0xfffff7faac9c
   0x0000fffff7faad1c:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7faad20:	17ffffdf	b	0xfffff7faac9c
   0x0000fffff7faad24:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7faad28:	17ffffdd	b	0xfffff7faac9c
   0x0000fffff7faad2c:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7faad30:	17ffffdb	b	0xfffff7faac9c
   0x0000fffff7faad34:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7faad38:	17ffffd9	b	0xfffff7faac9c
   0x0000fffff7faad3c:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7faad40:	17ffffd7	b	0xfffff7faac9c
   0x0000fffff7faad44:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7faad48:	17ffffd5	b	0xfffff7faac9c
   0x0000fffff7faad4c:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7faad50:	17ffffd3	b	0xfffff7faac9c
   0x0000fffff7faad54:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7faad58:	17ffffd1	b	0xfffff7faac9c
   0x0000fffff7faad5c:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7faad60:	17ffffcf	b	0xfffff7faac9c
   0x0000fffff7faad64:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7faad68:	17ffffcd	b	0xfffff7faac9c
   0x0000fffff7faad6c:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7faad70:	17ffffcb	b	0xfffff7faac9c
   0x0000fffff7faad74:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7faad78:	17ffffc9	b	0xfffff7faac9c
   0x0000fffff7faad7c:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7faad80:	17ffffc7	b	0xfffff7faac9c
   0x0000fffff7faad84:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7faad88:	17ffffc5	b	0xfffff7faac9c
   0x0000fffff7faad8c:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7faad90:	17ffffc3	b	0xfffff7faac9c
   0x0000fffff7faad94:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7faad98:	17ffffc1	b	0xfffff7faac9c
   0x0000fffff7faad9c:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7faada0:	17ffffbf	b	0xfffff7faac9c
   0x0000fffff7faada4:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7faada8:	17ffffbd	b	0xfffff7faac9c
   0x0000fffff7faadac:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7faadb0:	17ffffbb	b	0xfffff7faac9c
   0x0000fffff7faadb4:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7faadb8:	17ffffb9	b	0xfffff7faac9c
   0x0000fffff7faadbc:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7faadc0:	17ffffb7	b	0xfffff7faac9c
   0x0000fffff7faadc4:	00000000	udf	#0
   0x0000fffff7faadc8:	00000000	udf	#0
   0x0000fffff7faadcc:	00000000	udf	#0
   0x0000fffff7faadd0:	00000000	udf	#0
   0x0000fffff7faadd4:	00000000	udf	#0
   0x0000fffff7faadd8:	00000000	udf	#0
   0x0000fffff7faaddc:	00000000	udf	#0
   0x0000fffff7faade0:	00000000	udf	#0
   0x0000fffff7faade4:	00000000	udf	#0
   0x0000fffff7faade8:	00000000	udf	#0
   0x0000fffff7faadec:	00000000	udf	#0
   0x0000fffff7faadf0:	00000000	udf	#0
   0x0000fffff7faadf4:	00000000	udf	#0
   0x0000fffff7faadf8:	00000000	udf	#0
   0x0000fffff7faadfc:	00000000	udf	#0
   0x0000fffff7faae00:	00000000	udf	#0
   0x0000fffff7faae04:	00000000	udf	#0
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
