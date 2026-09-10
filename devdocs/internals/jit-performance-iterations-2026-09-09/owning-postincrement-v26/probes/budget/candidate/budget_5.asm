Dump of assembler code from 0xfffff7fb9000 to 0xfffff7fba000:
   0x0000fffff7fb9000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fb9004:	910003fd	mov	x29, sp
   0x0000fffff7fb9008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fb900c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fb9010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fb9014:	aa0003f3	mov	x19, x0
   0x0000fffff7fb9018:	aa0103f4	mov	x20, x1
   0x0000fffff7fb901c:	aa0203f5	mov	x21, x2
   0x0000fffff7fb9020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fb9024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fb9028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fb902c:	f90003e9	str	x9, [sp]
   0x0000fffff7fb9030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fb9034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fb9038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fb903c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fb9040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9044:	d63f0200	blr	x16
   0x0000fffff7fb9048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fb904c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fb9050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fb9054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fb9058:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb905c:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb9060:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fb9064:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb9068:	36d80211	tbz	w17, #27, 0xfffff7fb90a8
   0x0000fffff7fb906c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb9070:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb9074:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb9078:	540001e1	b.ne	0xfffff7fb90b4  // b.any
   0x0000fffff7fb907c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb9080:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb9084:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb9088:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb908c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb9090:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb9094:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb9098:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb909c:	540000c9	b.ls	0xfffff7fb90b4  // b.plast
   0x0000fffff7fb90a0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb90a4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb90a8:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb90ac:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb90b0:	1400000e	b	0xfffff7fb90e8
   0x0000fffff7fb90b4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb90b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb90bc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb90c0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb90c4:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fb90c8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb90cc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb90d0:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fb90d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb90d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb90dc:	d63f0200	blr	x16
   0x0000fffff7fb90e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb90e4:	54006980	b.eq	0xfffff7fb9e14  // b.none
   0x0000fffff7fb90e8:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb90ec:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb90f0:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fb90f4:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb90f8:	36d80211	tbz	w17, #27, 0xfffff7fb9138
   0x0000fffff7fb90fc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb9100:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb9104:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb9108:	540001e1	b.ne	0xfffff7fb9144  // b.any
   0x0000fffff7fb910c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb9110:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb9114:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb9118:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb911c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb9120:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb9124:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb9128:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb912c:	540000c9	b.ls	0xfffff7fb9144  // b.plast
   0x0000fffff7fb9130:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb9134:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb9138:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb913c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb9140:	1400000e	b	0xfffff7fb9178
   0x0000fffff7fb9144:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb9148:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb914c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9150:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9154:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fb9158:	aa1403e4	mov	x4, x20
   0x0000fffff7fb915c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9160:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fb9164:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb9168:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb916c:	d63f0200	blr	x16
   0x0000fffff7fb9170:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb9174:	54006540	b.eq	0xfffff7fb9e1c  // b.none
   0x0000fffff7fb9178:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb917c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9180:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9184:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9188:	54000421	b.ne	0xfffff7fb920c  // b.any
   0x0000fffff7fb918c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb9190:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9194:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9198:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb919c:	54000381	b.ne	0xfffff7fb920c  // b.any
   0x0000fffff7fb91a0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb91a4:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7fb91a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb91ac:	9a9fa7ec	cset	x12, lt	// lt = tstop
   0x0000fffff7fb91b0:	5280010d	mov	w13, #0x8                   	// #8
   0x0000fffff7fb91b4:	72a0200d	movk	w13, #0x100, lsl #16
   0x0000fffff7fb91b8:	91000580	add	x0, x12, #0x1
   0x0000fffff7fb91bc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb91c0:	36d80211	tbz	w17, #27, 0xfffff7fb9200
   0x0000fffff7fb91c4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb91c8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb91cc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb91d0:	540001e1	b.ne	0xfffff7fb920c  // b.any
   0x0000fffff7fb91d4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb91d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb91dc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb91e0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb91e4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb91e8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb91ec:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb91f0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb91f4:	540000c9	b.ls	0xfffff7fb920c  // b.plast
   0x0000fffff7fb91f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb91fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb9200:	f9005ecc	str	x12, [x22, #184]
   0x0000fffff7fb9204:	b900b2cd	str	w13, [x22, #176]
   0x0000fffff7fb9208:	1400000e	b	0xfffff7fb9240
   0x0000fffff7fb920c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb9210:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9214:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9218:	aa1503e2	mov	x2, x21
   0x0000fffff7fb921c:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fb9220:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9224:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9228:	d2909810	mov	x16, #0x84c0                	// #33984
   0x0000fffff7fb922c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb9230:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9234:	d63f0200	blr	x16
   0x0000fffff7fb9238:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb923c:	54005f40	b.eq	0xfffff7fb9e24  // b.none
   0x0000fffff7fb9240:	f100041f	cmp	x0, #0x1
   0x0000fffff7fb9244:	54005b20	b.eq	0xfffff7fb9da8  // b.none
   0x0000fffff7fb9248:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb924c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb9250:	d299c60c	mov	x12, #0xce30                	// #52784
   0x0000fffff7fb9254:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb9258:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb925c:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7fb9260:	36d801d1	tbz	w17, #27, 0xfffff7fb9298
   0x0000fffff7fb9264:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb9268:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb926c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb9270:	54000281	b.ne	0xfffff7fb92c0  // b.any
   0x0000fffff7fb9274:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fb9278:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb927c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb9280:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb9284:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb9288:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb928c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb9290:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb9294:	54000169	b.ls	0xfffff7fb92c0  // b.plast
   0x0000fffff7fb9298:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb929c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb92a0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb92a4:	36d80091	tbz	w17, #27, 0xfffff7fb92b4
   0x0000fffff7fb92a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb92ac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb92b0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb92b4:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fb92b8:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fb92bc:	1400000e	b	0xfffff7fb92f4
   0x0000fffff7fb92c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb92c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb92c8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb92cc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb92d0:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7fb92d4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb92d8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb92dc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb92e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb92e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb92e8:	d63f0200	blr	x16
   0x0000fffff7fb92ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb92f0:	540059e0	b.eq	0xfffff7fb9e2c  // b.none
   0x0000fffff7fb92f4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb92f8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb92fc:	540003a0	b.eq	0xfffff7fb9370  // b.none
   0x0000fffff7fb9300:	b940426d	ldr	w13, [x19, #64]
   0x0000fffff7fb9304:	f940266c	ldr	x12, [x19, #72]
   0x0000fffff7fb9308:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb930c:	36d801d1	tbz	w17, #27, 0xfffff7fb9344
   0x0000fffff7fb9310:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb9314:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb9318:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb931c:	540002a1	b.ne	0xfffff7fb9370  // b.any
   0x0000fffff7fb9320:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb9324:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb9328:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb932c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb9330:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb9334:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb9338:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb933c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb9340:	54000189	b.ls	0xfffff7fb9370  // b.plast
   0x0000fffff7fb9344:	36d8008d	tbz	w13, #27, 0xfffff7fb9354
   0x0000fffff7fb9348:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb934c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb9350:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb9354:	36d80091	tbz	w17, #27, 0xfffff7fb9364
   0x0000fffff7fb9358:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb935c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb9360:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb9364:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb9368:	b900016d	str	w13, [x11]
   0x0000fffff7fb936c:	1400000e	b	0xfffff7fb93a4
   0x0000fffff7fb9370:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb9374:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9378:	aa1303e1	mov	x1, x19
   0x0000fffff7fb937c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9380:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7fb9384:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9388:	aa1603e5	mov	x5, x22
   0x0000fffff7fb938c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb9390:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb9394:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9398:	d63f0200	blr	x16
   0x0000fffff7fb939c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb93a0:	540054a0	b.eq	0xfffff7fb9e34  // b.none
   0x0000fffff7fb93a4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb93a8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb93ac:	540004a0	b.eq	0xfffff7fb9440  // b.none
   0x0000fffff7fb93b0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb93b4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb93b8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb93bc:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb93c0:	54000400	b.eq	0xfffff7fb9440  // b.none
   0x0000fffff7fb93c4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb93c8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb93cc:	36d801d1	tbz	w17, #27, 0xfffff7fb9404
   0x0000fffff7fb93d0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb93d4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb93d8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb93dc:	54000321	b.ne	0xfffff7fb9440  // b.any
   0x0000fffff7fb93e0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb93e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb93e8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb93ec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb93f0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb93f4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb93f8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb93fc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb9400:	54000209	b.ls	0xfffff7fb9440  // b.plast
   0x0000fffff7fb9404:	36d8008d	tbz	w13, #27, 0xfffff7fb9414
   0x0000fffff7fb9408:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb940c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb9410:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb9414:	36d80091	tbz	w17, #27, 0xfffff7fb9424
   0x0000fffff7fb9418:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb941c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb9420:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb9424:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fb9428:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fb942c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb9430:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb9434:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fb9438:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fb943c:	1400000e	b	0xfffff7fb9474
   0x0000fffff7fb9440:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb9444:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9448:	aa1303e1	mov	x1, x19
   0x0000fffff7fb944c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9450:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fb9454:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9458:	aa1603e5	mov	x5, x22
   0x0000fffff7fb945c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb9460:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb9464:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9468:	d63f0200	blr	x16
   0x0000fffff7fb946c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb9470:	54004e60	b.eq	0xfffff7fb9e3c  // b.none
   0x0000fffff7fb9474:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb9478:	37d806a9	tbnz	w9, #27, 0xfffff7fb954c
   0x0000fffff7fb947c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb9480:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9484:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9488:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb948c:	540001c1	b.ne	0xfffff7fb94c4  // b.any
   0x0000fffff7fb9490:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb9494:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9498:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb949c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb94a0:	54000121	b.ne	0xfffff7fb94c4  // b.any
   0x0000fffff7fb94a4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb94a8:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fb94ac:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb94b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb94b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb94b8:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb94bc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb94c0:	14000030	b	0xfffff7fb9580
   0x0000fffff7fb94c4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb94c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb94cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb94d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb94d4:	54000120	b.eq	0xfffff7fb94f8  // b.none
   0x0000fffff7fb94d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb94dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb94e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb94e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb94e8:	54000321	b.ne	0xfffff7fb954c  // b.any
   0x0000fffff7fb94ec:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb94f0:	9e620120	scvtf	d0, x9
   0x0000fffff7fb94f4:	14000002	b	0xfffff7fb94fc
   0x0000fffff7fb94f8:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb94fc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb9500:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9504:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9508:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb950c:	54000120	b.eq	0xfffff7fb9530  // b.none
   0x0000fffff7fb9510:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb9514:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9518:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb951c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9520:	54000161	b.ne	0xfffff7fb954c  // b.any
   0x0000fffff7fb9524:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fb9528:	9e620121	scvtf	d1, x9
   0x0000fffff7fb952c:	14000002	b	0xfffff7fb9534
   0x0000fffff7fb9530:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fb9534:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb9538:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb953c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9540:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9544:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb9548:	17ffffde	b	0xfffff7fb94c0
   0x0000fffff7fb954c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb9550:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9554:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9558:	aa1503e2	mov	x2, x21
   0x0000fffff7fb955c:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fb9560:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9564:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9568:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb956c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb9570:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9574:	d63f0200	blr	x16
   0x0000fffff7fb9578:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb957c:	54004640	b.eq	0xfffff7fb9e44  // b.none
   0x0000fffff7fb9580:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb9584:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb9588:	540004a0	b.eq	0xfffff7fb961c  // b.none
   0x0000fffff7fb958c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb9590:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb9594:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb9598:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb959c:	54000400	b.eq	0xfffff7fb961c  // b.none
   0x0000fffff7fb95a0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb95a4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb95a8:	36d801d1	tbz	w17, #27, 0xfffff7fb95e0
   0x0000fffff7fb95ac:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb95b0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb95b4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb95b8:	54000321	b.ne	0xfffff7fb961c  // b.any
   0x0000fffff7fb95bc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb95c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb95c4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb95c8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb95cc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb95d0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb95d4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb95d8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb95dc:	54000209	b.ls	0xfffff7fb961c  // b.plast
   0x0000fffff7fb95e0:	36d8008d	tbz	w13, #27, 0xfffff7fb95f0
   0x0000fffff7fb95e4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb95e8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb95ec:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb95f0:	36d80091	tbz	w17, #27, 0xfffff7fb9600
   0x0000fffff7fb95f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb95f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb95fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb9600:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fb9604:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fb9608:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb960c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb9610:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fb9614:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fb9618:	1400000e	b	0xfffff7fb9650
   0x0000fffff7fb961c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb9620:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9624:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9628:	aa1503e2	mov	x2, x21
   0x0000fffff7fb962c:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fb9630:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9634:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9638:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb963c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb9640:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9644:	d63f0200	blr	x16
   0x0000fffff7fb9648:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb964c:	54004000	b.eq	0xfffff7fb9e4c  // b.none
   0x0000fffff7fb9650:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb9654:	37d806a9	tbnz	w9, #27, 0xfffff7fb9728
   0x0000fffff7fb9658:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb965c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9660:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9664:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9668:	540001c1	b.ne	0xfffff7fb96a0  // b.any
   0x0000fffff7fb966c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb9670:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9674:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9678:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb967c:	54000121	b.ne	0xfffff7fb96a0  // b.any
   0x0000fffff7fb9680:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb9684:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fb9688:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb968c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9690:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9694:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb9698:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb969c:	14000030	b	0xfffff7fb975c
   0x0000fffff7fb96a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb96a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb96a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb96ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb96b0:	54000120	b.eq	0xfffff7fb96d4  // b.none
   0x0000fffff7fb96b4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb96b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb96bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb96c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb96c4:	54000321	b.ne	0xfffff7fb9728  // b.any
   0x0000fffff7fb96c8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb96cc:	9e620120	scvtf	d0, x9
   0x0000fffff7fb96d0:	14000002	b	0xfffff7fb96d8
   0x0000fffff7fb96d4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb96d8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb96dc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb96e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb96e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb96e8:	54000120	b.eq	0xfffff7fb970c  // b.none
   0x0000fffff7fb96ec:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb96f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb96f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb96f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb96fc:	54000161	b.ne	0xfffff7fb9728  // b.any
   0x0000fffff7fb9700:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fb9704:	9e620121	scvtf	d1, x9
   0x0000fffff7fb9708:	14000002	b	0xfffff7fb9710
   0x0000fffff7fb970c:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fb9710:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb9714:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb9718:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb971c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9720:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb9724:	17ffffde	b	0xfffff7fb969c
   0x0000fffff7fb9728:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb972c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9730:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9734:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9738:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fb973c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9740:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9744:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb9748:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb974c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9750:	d63f0200	blr	x16
   0x0000fffff7fb9754:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb9758:	540037e0	b.eq	0xfffff7fb9e54  // b.none
   0x0000fffff7fb975c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb9760:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb9764:	540004a0	b.eq	0xfffff7fb97f8  // b.none
   0x0000fffff7fb9768:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb976c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb9770:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb9774:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb9778:	54000400	b.eq	0xfffff7fb97f8  // b.none
   0x0000fffff7fb977c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb9780:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb9784:	36d801d1	tbz	w17, #27, 0xfffff7fb97bc
   0x0000fffff7fb9788:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb978c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb9790:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb9794:	54000321	b.ne	0xfffff7fb97f8  // b.any
   0x0000fffff7fb9798:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb979c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb97a0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb97a4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb97a8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb97ac:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb97b0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb97b4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb97b8:	54000209	b.ls	0xfffff7fb97f8  // b.plast
   0x0000fffff7fb97bc:	36d8008d	tbz	w13, #27, 0xfffff7fb97cc
   0x0000fffff7fb97c0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb97c4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb97c8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb97cc:	36d80091	tbz	w17, #27, 0xfffff7fb97dc
   0x0000fffff7fb97d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb97d4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb97d8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb97dc:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fb97e0:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fb97e4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb97e8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb97ec:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fb97f0:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fb97f4:	1400000e	b	0xfffff7fb982c
   0x0000fffff7fb97f8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb97fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9800:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9804:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9808:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fb980c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9810:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9814:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb9818:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb981c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9820:	d63f0200	blr	x16
   0x0000fffff7fb9824:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb9828:	540031a0	b.eq	0xfffff7fb9e5c  // b.none
   0x0000fffff7fb982c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb9830:	37d806a9	tbnz	w9, #27, 0xfffff7fb9904
   0x0000fffff7fb9834:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb9838:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb983c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9840:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9844:	540001c1	b.ne	0xfffff7fb987c  // b.any
   0x0000fffff7fb9848:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb984c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9850:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9854:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9858:	54000121	b.ne	0xfffff7fb987c  // b.any
   0x0000fffff7fb985c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb9860:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fb9864:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb9868:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb986c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9870:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb9874:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb9878:	14000030	b	0xfffff7fb9938
   0x0000fffff7fb987c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb9880:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9884:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9888:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb988c:	54000120	b.eq	0xfffff7fb98b0  // b.none
   0x0000fffff7fb9890:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb9894:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9898:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb989c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb98a0:	54000321	b.ne	0xfffff7fb9904  // b.any
   0x0000fffff7fb98a4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb98a8:	9e620120	scvtf	d0, x9
   0x0000fffff7fb98ac:	14000002	b	0xfffff7fb98b4
   0x0000fffff7fb98b0:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb98b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb98b8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb98bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb98c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb98c4:	54000120	b.eq	0xfffff7fb98e8  // b.none
   0x0000fffff7fb98c8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb98cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb98d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb98d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb98d8:	54000161	b.ne	0xfffff7fb9904  // b.any
   0x0000fffff7fb98dc:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fb98e0:	9e620121	scvtf	d1, x9
   0x0000fffff7fb98e4:	14000002	b	0xfffff7fb98ec
   0x0000fffff7fb98e8:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fb98ec:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb98f0:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb98f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb98f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb98fc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb9900:	17ffffde	b	0xfffff7fb9878
   0x0000fffff7fb9904:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb9908:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb990c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9910:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9914:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fb9918:	aa1403e4	mov	x4, x20
   0x0000fffff7fb991c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9920:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb9924:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb9928:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb992c:	d63f0200	blr	x16
   0x0000fffff7fb9930:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb9934:	54002980	b.eq	0xfffff7fb9e64  // b.none
   0x0000fffff7fb9938:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb993c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb9940:	540004a0	b.eq	0xfffff7fb99d4  // b.none
   0x0000fffff7fb9944:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb9948:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb994c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb9950:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb9954:	54000400	b.eq	0xfffff7fb99d4  // b.none
   0x0000fffff7fb9958:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb995c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb9960:	36d801d1	tbz	w17, #27, 0xfffff7fb9998
   0x0000fffff7fb9964:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb9968:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb996c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb9970:	54000321	b.ne	0xfffff7fb99d4  // b.any
   0x0000fffff7fb9974:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb9978:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb997c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb9980:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb9984:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb9988:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb998c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb9990:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb9994:	54000209	b.ls	0xfffff7fb99d4  // b.plast
   0x0000fffff7fb9998:	36d8008d	tbz	w13, #27, 0xfffff7fb99a8
   0x0000fffff7fb999c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb99a0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb99a4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb99a8:	36d80091	tbz	w17, #27, 0xfffff7fb99b8
   0x0000fffff7fb99ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb99b0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb99b4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb99b8:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fb99bc:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fb99c0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb99c4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb99c8:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fb99cc:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fb99d0:	1400000e	b	0xfffff7fb9a08
   0x0000fffff7fb99d4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb99d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb99dc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb99e0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb99e4:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fb99e8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb99ec:	aa1603e5	mov	x5, x22
   0x0000fffff7fb99f0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb99f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb99f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb99fc:	d63f0200	blr	x16
   0x0000fffff7fb9a00:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb9a04:	54002340	b.eq	0xfffff7fb9e6c  // b.none
   0x0000fffff7fb9a08:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb9a0c:	37d806a9	tbnz	w9, #27, 0xfffff7fb9ae0
   0x0000fffff7fb9a10:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb9a14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9a18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9a1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9a20:	540001c1	b.ne	0xfffff7fb9a58  // b.any
   0x0000fffff7fb9a24:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb9a28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9a2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9a30:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9a34:	54000121	b.ne	0xfffff7fb9a58  // b.any
   0x0000fffff7fb9a38:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb9a3c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fb9a40:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb9a44:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9a48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9a4c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb9a50:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb9a54:	14000030	b	0xfffff7fb9b14
   0x0000fffff7fb9a58:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb9a5c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9a60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9a64:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9a68:	54000120	b.eq	0xfffff7fb9a8c  // b.none
   0x0000fffff7fb9a6c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb9a70:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9a74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9a78:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9a7c:	54000321	b.ne	0xfffff7fb9ae0  // b.any
   0x0000fffff7fb9a80:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb9a84:	9e620120	scvtf	d0, x9
   0x0000fffff7fb9a88:	14000002	b	0xfffff7fb9a90
   0x0000fffff7fb9a8c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb9a90:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb9a94:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9a98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9a9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9aa0:	54000120	b.eq	0xfffff7fb9ac4  // b.none
   0x0000fffff7fb9aa4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb9aa8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9aac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9ab0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9ab4:	54000161	b.ne	0xfffff7fb9ae0  // b.any
   0x0000fffff7fb9ab8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fb9abc:	9e620121	scvtf	d1, x9
   0x0000fffff7fb9ac0:	14000002	b	0xfffff7fb9ac8
   0x0000fffff7fb9ac4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fb9ac8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb9acc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb9ad0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9ad4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9ad8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb9adc:	17ffffde	b	0xfffff7fb9a54
   0x0000fffff7fb9ae0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb9ae4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9ae8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9aec:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9af0:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fb9af4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9af8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9afc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb9b00:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb9b04:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9b08:	d63f0200	blr	x16
   0x0000fffff7fb9b0c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb9b10:	54001b20	b.eq	0xfffff7fb9e74  // b.none
   0x0000fffff7fb9b14:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb9b18:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb9b1c:	540004a0	b.eq	0xfffff7fb9bb0  // b.none
   0x0000fffff7fb9b20:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb9b24:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb9b28:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb9b2c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb9b30:	54000400	b.eq	0xfffff7fb9bb0  // b.none
   0x0000fffff7fb9b34:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb9b38:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb9b3c:	36d801d1	tbz	w17, #27, 0xfffff7fb9b74
   0x0000fffff7fb9b40:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb9b44:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb9b48:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb9b4c:	54000321	b.ne	0xfffff7fb9bb0  // b.any
   0x0000fffff7fb9b50:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb9b54:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb9b58:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb9b5c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb9b60:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb9b64:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb9b68:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb9b6c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb9b70:	54000209	b.ls	0xfffff7fb9bb0  // b.plast
   0x0000fffff7fb9b74:	36d8008d	tbz	w13, #27, 0xfffff7fb9b84
   0x0000fffff7fb9b78:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb9b7c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb9b80:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb9b84:	36d80091	tbz	w17, #27, 0xfffff7fb9b94
   0x0000fffff7fb9b88:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb9b8c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb9b90:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb9b94:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fb9b98:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fb9b9c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb9ba0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb9ba4:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fb9ba8:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fb9bac:	1400000e	b	0xfffff7fb9be4
   0x0000fffff7fb9bb0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb9bb4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9bb8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9bbc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9bc0:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fb9bc4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9bc8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9bcc:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb9bd0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb9bd4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9bd8:	d63f0200	blr	x16
   0x0000fffff7fb9bdc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb9be0:	540014e0	b.eq	0xfffff7fb9e7c  // b.none
   0x0000fffff7fb9be4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb9be8:	37d806a9	tbnz	w9, #27, 0xfffff7fb9cbc
   0x0000fffff7fb9bec:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb9bf0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9bf4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9bf8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9bfc:	540001c1	b.ne	0xfffff7fb9c34  // b.any
   0x0000fffff7fb9c00:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb9c04:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9c08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9c0c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9c10:	54000121	b.ne	0xfffff7fb9c34  // b.any
   0x0000fffff7fb9c14:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb9c18:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fb9c1c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb9c20:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9c24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9c28:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb9c2c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb9c30:	14000030	b	0xfffff7fb9cf0
   0x0000fffff7fb9c34:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb9c38:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9c3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9c40:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9c44:	54000120	b.eq	0xfffff7fb9c68  // b.none
   0x0000fffff7fb9c48:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb9c4c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9c50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9c54:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9c58:	54000321	b.ne	0xfffff7fb9cbc  // b.any
   0x0000fffff7fb9c5c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb9c60:	9e620120	scvtf	d0, x9
   0x0000fffff7fb9c64:	14000002	b	0xfffff7fb9c6c
   0x0000fffff7fb9c68:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb9c6c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb9c70:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9c74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9c78:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9c7c:	54000120	b.eq	0xfffff7fb9ca0  // b.none
   0x0000fffff7fb9c80:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb9c84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9c88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9c8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9c90:	54000161	b.ne	0xfffff7fb9cbc  // b.any
   0x0000fffff7fb9c94:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fb9c98:	9e620121	scvtf	d1, x9
   0x0000fffff7fb9c9c:	14000002	b	0xfffff7fb9ca4
   0x0000fffff7fb9ca0:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fb9ca4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb9ca8:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb9cac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9cb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9cb4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb9cb8:	17ffffde	b	0xfffff7fb9c30
   0x0000fffff7fb9cbc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb9cc0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9cc4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9cc8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9ccc:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fb9cd0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9cd4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9cd8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb9cdc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb9ce0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9ce4:	d63f0200	blr	x16
   0x0000fffff7fb9ce8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb9cec:	54000cc0	b.eq	0xfffff7fb9e84  // b.none
   0x0000fffff7fb9cf0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb9cf4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9cf8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9cfc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9d00:	54000381	b.ne	0xfffff7fb9d70  // b.any
   0x0000fffff7fb9d04:	f940266c	ldr	x12, [x19, #72]
   0x0000fffff7fb9d08:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7fb9d0c:	8b0a018b	add	x11, x12, x10
   0x0000fffff7fb9d10:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7fb9d14:	36d80211	tbz	w17, #27, 0xfffff7fb9d54
   0x0000fffff7fb9d18:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb9d1c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb9d20:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb9d24:	54000261	b.ne	0xfffff7fb9d70  // b.any
   0x0000fffff7fb9d28:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fb9d2c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb9d30:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb9d34:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb9d38:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb9d3c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb9d40:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb9d44:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb9d48:	54000149	b.ls	0xfffff7fb9d70  // b.plast
   0x0000fffff7fb9d4c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb9d50:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb9d54:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb9d58:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb9d5c:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fb9d60:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fb9d64:	f900266b	str	x11, [x19, #72]
   0x0000fffff7fb9d68:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb9d6c:	1400000e	b	0xfffff7fb9da4
   0x0000fffff7fb9d70:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb9d74:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9d78:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9d7c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9d80:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fb9d84:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9d88:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9d8c:	d2916810	mov	x16, #0x8b40                	// #35648
   0x0000fffff7fb9d90:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb9d94:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9d98:	d63f0200	blr	x16
   0x0000fffff7fb9d9c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb9da0:	54000760	b.eq	0xfffff7fb9e8c  // b.none
   0x0000fffff7fb9da4:	17fffcf5	b	0xfffff7fb9178
   0x0000fffff7fb9da8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb9dac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9db0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9db4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9db8:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fb9dbc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9dc0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9dc4:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7fb9dc8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb9dcc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9dd0:	d63f0200	blr	x16
   0x0000fffff7fb9dd4:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb9dd8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb9ddc:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb9de0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb9de4:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fb9de8:	d65f03c0	ret
   0x0000fffff7fb9dec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9df0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9df4:	b900028a	str	w10, [x20]
   0x0000fffff7fb9df8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fb9dfc:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb9e00:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb9e04:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb9e08:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb9e0c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fb9e10:	d65f03c0	ret
   0x0000fffff7fb9e14:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fb9e18:	17fffff5	b	0xfffff7fb9dec
   0x0000fffff7fb9e1c:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fb9e20:	17fffff3	b	0xfffff7fb9dec
   0x0000fffff7fb9e24:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fb9e28:	17fffff1	b	0xfffff7fb9dec
   0x0000fffff7fb9e2c:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7fb9e30:	17ffffef	b	0xfffff7fb9dec
   0x0000fffff7fb9e34:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7fb9e38:	17ffffed	b	0xfffff7fb9dec
   0x0000fffff7fb9e3c:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fb9e40:	17ffffeb	b	0xfffff7fb9dec
   0x0000fffff7fb9e44:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fb9e48:	17ffffe9	b	0xfffff7fb9dec
   0x0000fffff7fb9e4c:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fb9e50:	17ffffe7	b	0xfffff7fb9dec
   0x0000fffff7fb9e54:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fb9e58:	17ffffe5	b	0xfffff7fb9dec
   0x0000fffff7fb9e5c:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fb9e60:	17ffffe3	b	0xfffff7fb9dec
   0x0000fffff7fb9e64:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fb9e68:	17ffffe1	b	0xfffff7fb9dec
   0x0000fffff7fb9e6c:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fb9e70:	17ffffdf	b	0xfffff7fb9dec
   0x0000fffff7fb9e74:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fb9e78:	17ffffdd	b	0xfffff7fb9dec
   0x0000fffff7fb9e7c:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fb9e80:	17ffffdb	b	0xfffff7fb9dec
   0x0000fffff7fb9e84:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fb9e88:	17ffffd9	b	0xfffff7fb9dec
   0x0000fffff7fb9e8c:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fb9e90:	17ffffd7	b	0xfffff7fb9dec
   0x0000fffff7fb9e94:	00000000	udf	#0
   0x0000fffff7fb9e98:	00000000	udf	#0
   0x0000fffff7fb9e9c:	00000000	udf	#0
   0x0000fffff7fb9ea0:	00000000	udf	#0
   0x0000fffff7fb9ea4:	00000000	udf	#0
   0x0000fffff7fb9ea8:	00000000	udf	#0
   0x0000fffff7fb9eac:	00000000	udf	#0
   0x0000fffff7fb9eb0:	00000000	udf	#0
   0x0000fffff7fb9eb4:	00000000	udf	#0
   0x0000fffff7fb9eb8:	00000000	udf	#0
   0x0000fffff7fb9ebc:	00000000	udf	#0
   0x0000fffff7fb9ec0:	00000000	udf	#0
   0x0000fffff7fb9ec4:	00000000	udf	#0
   0x0000fffff7fb9ec8:	00000000	udf	#0
   0x0000fffff7fb9ecc:	00000000	udf	#0
   0x0000fffff7fb9ed0:	00000000	udf	#0
   0x0000fffff7fb9ed4:	00000000	udf	#0
   0x0000fffff7fb9ed8:	00000000	udf	#0
   0x0000fffff7fb9edc:	00000000	udf	#0
   0x0000fffff7fb9ee0:	00000000	udf	#0
   0x0000fffff7fb9ee4:	00000000	udf	#0
   0x0000fffff7fb9ee8:	00000000	udf	#0
   0x0000fffff7fb9eec:	00000000	udf	#0
   0x0000fffff7fb9ef0:	00000000	udf	#0
   0x0000fffff7fb9ef4:	00000000	udf	#0
   0x0000fffff7fb9ef8:	00000000	udf	#0
   0x0000fffff7fb9efc:	00000000	udf	#0
   0x0000fffff7fb9f00:	00000000	udf	#0
   0x0000fffff7fb9f04:	00000000	udf	#0
   0x0000fffff7fb9f08:	00000000	udf	#0
   0x0000fffff7fb9f0c:	00000000	udf	#0
   0x0000fffff7fb9f10:	00000000	udf	#0
   0x0000fffff7fb9f14:	00000000	udf	#0
   0x0000fffff7fb9f18:	00000000	udf	#0
   0x0000fffff7fb9f1c:	00000000	udf	#0
   0x0000fffff7fb9f20:	00000000	udf	#0
   0x0000fffff7fb9f24:	00000000	udf	#0
   0x0000fffff7fb9f28:	00000000	udf	#0
   0x0000fffff7fb9f2c:	00000000	udf	#0
   0x0000fffff7fb9f30:	00000000	udf	#0
   0x0000fffff7fb9f34:	00000000	udf	#0
   0x0000fffff7fb9f38:	00000000	udf	#0
   0x0000fffff7fb9f3c:	00000000	udf	#0
   0x0000fffff7fb9f40:	00000000	udf	#0
   0x0000fffff7fb9f44:	00000000	udf	#0
   0x0000fffff7fb9f48:	00000000	udf	#0
   0x0000fffff7fb9f4c:	00000000	udf	#0
   0x0000fffff7fb9f50:	00000000	udf	#0
   0x0000fffff7fb9f54:	00000000	udf	#0
   0x0000fffff7fb9f58:	00000000	udf	#0
   0x0000fffff7fb9f5c:	00000000	udf	#0
   0x0000fffff7fb9f60:	00000000	udf	#0
   0x0000fffff7fb9f64:	00000000	udf	#0
   0x0000fffff7fb9f68:	00000000	udf	#0
   0x0000fffff7fb9f6c:	00000000	udf	#0
   0x0000fffff7fb9f70:	00000000	udf	#0
   0x0000fffff7fb9f74:	00000000	udf	#0
   0x0000fffff7fb9f78:	00000000	udf	#0
   0x0000fffff7fb9f7c:	00000000	udf	#0
   0x0000fffff7fb9f80:	00000000	udf	#0
   0x0000fffff7fb9f84:	00000000	udf	#0
   0x0000fffff7fb9f88:	00000000	udf	#0
   0x0000fffff7fb9f8c:	00000000	udf	#0
   0x0000fffff7fb9f90:	00000000	udf	#0
   0x0000fffff7fb9f94:	00000000	udf	#0
   0x0000fffff7fb9f98:	00000000	udf	#0
   0x0000fffff7fb9f9c:	00000000	udf	#0
   0x0000fffff7fb9fa0:	00000000	udf	#0
   0x0000fffff7fb9fa4:	00000000	udf	#0
   0x0000fffff7fb9fa8:	00000000	udf	#0
   0x0000fffff7fb9fac:	00000000	udf	#0
   0x0000fffff7fb9fb0:	00000000	udf	#0
   0x0000fffff7fb9fb4:	00000000	udf	#0
   0x0000fffff7fb9fb8:	00000000	udf	#0
   0x0000fffff7fb9fbc:	00000000	udf	#0
   0x0000fffff7fb9fc0:	00000000	udf	#0
   0x0000fffff7fb9fc4:	00000000	udf	#0
   0x0000fffff7fb9fc8:	00000000	udf	#0
   0x0000fffff7fb9fcc:	00000000	udf	#0
   0x0000fffff7fb9fd0:	00000000	udf	#0
   0x0000fffff7fb9fd4:	00000000	udf	#0
   0x0000fffff7fb9fd8:	00000000	udf	#0
   0x0000fffff7fb9fdc:	00000000	udf	#0
   0x0000fffff7fb9fe0:	00000000	udf	#0
   0x0000fffff7fb9fe4:	00000000	udf	#0
   0x0000fffff7fb9fe8:	00000000	udf	#0
   0x0000fffff7fb9fec:	00000000	udf	#0
   0x0000fffff7fb9ff0:	00000000	udf	#0
   0x0000fffff7fb9ff4:	00000000	udf	#0
   0x0000fffff7fb9ff8:	00000000	udf	#0
   0x0000fffff7fb9ffc:	00000000	udf	#0
End of assembler dump.
