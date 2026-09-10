Dump of assembler code from 0xfffff7fb8000 to 0xfffff7fba000:
   0x0000fffff7fb8000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fb8004:	910003fd	mov	x29, sp
   0x0000fffff7fb8008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fb800c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fb8010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fb8014:	aa0003f3	mov	x19, x0
   0x0000fffff7fb8018:	aa0103f4	mov	x20, x1
   0x0000fffff7fb801c:	aa0203f5	mov	x21, x2
   0x0000fffff7fb8020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fb8024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fb8028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fb802c:	f90003e9	str	x9, [sp]
   0x0000fffff7fb8030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fb8034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fb8038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fb803c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fb8040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb8044:	d63f0200	blr	x16
   0x0000fffff7fb8048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fb804c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fb8050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fb8054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fb8058:	14000001	b	0xfffff7fb805c
   0x0000fffff7fb805c:	14000001	b	0xfffff7fb8060
   0x0000fffff7fb8060:	14000001	b	0xfffff7fb8064
   0x0000fffff7fb8064:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb8068:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb806c:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fb8070:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb8074:	36d80211	tbz	w17, #27, 0xfffff7fb80b4
   0x0000fffff7fb8078:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb807c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb8080:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb8084:	540001e1	b.ne	0xfffff7fb80c0  // b.any
   0x0000fffff7fb8088:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb808c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8090:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb8094:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb8098:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb809c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb80a0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb80a4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb80a8:	540000c9	b.ls	0xfffff7fb80c0  // b.plast
   0x0000fffff7fb80ac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb80b0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb80b4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb80b8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb80bc:	1400000e	b	0xfffff7fb80f4
   0x0000fffff7fb80c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb80c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb80c8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb80cc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb80d0:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7fb80d4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb80d8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb80dc:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fb80e0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb80e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb80e8:	d63f0200	blr	x16
   0x0000fffff7fb80ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb80f0:	5400ef60	b.eq	0xfffff7fb9edc  // b.none
   0x0000fffff7fb80f4:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb80f8:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb80fc:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fb8100:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7fb8104:	36d80211	tbz	w17, #27, 0xfffff7fb8144
   0x0000fffff7fb8108:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb810c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb8110:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb8114:	540001e1	b.ne	0xfffff7fb8150  // b.any
   0x0000fffff7fb8118:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fb811c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8120:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb8124:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb8128:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb812c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb8130:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb8134:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb8138:	540000c9	b.ls	0xfffff7fb8150  // b.plast
   0x0000fffff7fb813c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb8140:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb8144:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fb8148:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fb814c:	1400000e	b	0xfffff7fb8184
   0x0000fffff7fb8150:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb8154:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb8158:	aa1303e1	mov	x1, x19
   0x0000fffff7fb815c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb8160:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7fb8164:	aa1403e4	mov	x4, x20
   0x0000fffff7fb8168:	aa1603e5	mov	x5, x22
   0x0000fffff7fb816c:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fb8170:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb8174:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb8178:	d63f0200	blr	x16
   0x0000fffff7fb817c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb8180:	5400eb20	b.eq	0xfffff7fb9ee4  // b.none
   0x0000fffff7fb8184:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb8188:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb818c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8190:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8194:	54000421	b.ne	0xfffff7fb8218  // b.any
   0x0000fffff7fb8198:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb819c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb81a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb81a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb81a8:	54000381	b.ne	0xfffff7fb8218  // b.any
   0x0000fffff7fb81ac:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fb81b0:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7fb81b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb81b8:	9a9fa7ec	cset	x12, lt	// lt = tstop
   0x0000fffff7fb81bc:	5280010d	mov	w13, #0x8                   	// #8
   0x0000fffff7fb81c0:	72a0200d	movk	w13, #0x100, lsl #16
   0x0000fffff7fb81c4:	91000580	add	x0, x12, #0x1
   0x0000fffff7fb81c8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb81cc:	36d80211	tbz	w17, #27, 0xfffff7fb820c
   0x0000fffff7fb81d0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb81d4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb81d8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb81dc:	540001e1	b.ne	0xfffff7fb8218  // b.any
   0x0000fffff7fb81e0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb81e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb81e8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb81ec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb81f0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb81f4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb81f8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb81fc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb8200:	540000c9	b.ls	0xfffff7fb8218  // b.plast
   0x0000fffff7fb8204:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb8208:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb820c:	f9005ecc	str	x12, [x22, #184]
   0x0000fffff7fb8210:	b900b2cd	str	w13, [x22, #176]
   0x0000fffff7fb8214:	1400000e	b	0xfffff7fb824c
   0x0000fffff7fb8218:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb821c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb8220:	aa1303e1	mov	x1, x19
   0x0000fffff7fb8224:	aa1503e2	mov	x2, x21
   0x0000fffff7fb8228:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fb822c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb8230:	aa1603e5	mov	x5, x22
   0x0000fffff7fb8234:	d2909810	mov	x16, #0x84c0                	// #33984
   0x0000fffff7fb8238:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb823c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb8240:	d63f0200	blr	x16
   0x0000fffff7fb8244:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb8248:	5400e520	b.eq	0xfffff7fb9eec  // b.none
   0x0000fffff7fb824c:	f100041f	cmp	x0, #0x1
   0x0000fffff7fb8250:	5400e100	b.eq	0xfffff7fb9e70  // b.none
   0x0000fffff7fb8254:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb8258:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb825c:	d299d20c	mov	x12, #0xce90                	// #52880
   0x0000fffff7fb8260:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb8264:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb8268:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7fb826c:	36d801d1	tbz	w17, #27, 0xfffff7fb82a4
   0x0000fffff7fb8270:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb8274:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb8278:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb827c:	54000281	b.ne	0xfffff7fb82cc  // b.any
   0x0000fffff7fb8280:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb8284:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8288:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb828c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb8290:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb8294:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb8298:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb829c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb82a0:	54000169	b.ls	0xfffff7fb82cc  // b.plast
   0x0000fffff7fb82a4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb82a8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb82ac:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb82b0:	36d80091	tbz	w17, #27, 0xfffff7fb82c0
   0x0000fffff7fb82b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb82b8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb82bc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb82c0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb82c4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb82c8:	1400000e	b	0xfffff7fb8300
   0x0000fffff7fb82cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb82d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb82d4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb82d8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb82dc:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fb82e0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb82e4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb82e8:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb82ec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb82f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb82f4:	d63f0200	blr	x16
   0x0000fffff7fb82f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb82fc:	5400dfc0	b.eq	0xfffff7fb9ef4  // b.none
   0x0000fffff7fb8300:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb8304:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb8308:	540003a0	b.eq	0xfffff7fb837c  // b.none
   0x0000fffff7fb830c:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7fb8310:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7fb8314:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb8318:	36d801d1	tbz	w17, #27, 0xfffff7fb8350
   0x0000fffff7fb831c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb8320:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb8324:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb8328:	540002a1	b.ne	0xfffff7fb837c  // b.any
   0x0000fffff7fb832c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb8330:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8334:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb8338:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb833c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb8340:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb8344:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb8348:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb834c:	54000189	b.ls	0xfffff7fb837c  // b.plast
   0x0000fffff7fb8350:	36d8008d	tbz	w13, #27, 0xfffff7fb8360
   0x0000fffff7fb8354:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb8358:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb835c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb8360:	36d80091	tbz	w17, #27, 0xfffff7fb8370
   0x0000fffff7fb8364:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8368:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb836c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb8370:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb8374:	b900016d	str	w13, [x11]
   0x0000fffff7fb8378:	1400000e	b	0xfffff7fb83b0
   0x0000fffff7fb837c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb8380:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb8384:	aa1303e1	mov	x1, x19
   0x0000fffff7fb8388:	aa1503e2	mov	x2, x21
   0x0000fffff7fb838c:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fb8390:	aa1403e4	mov	x4, x20
   0x0000fffff7fb8394:	aa1603e5	mov	x5, x22
   0x0000fffff7fb8398:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb839c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb83a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb83a4:	d63f0200	blr	x16
   0x0000fffff7fb83a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb83ac:	5400da80	b.eq	0xfffff7fb9efc  // b.none
   0x0000fffff7fb83b0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb83b4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb83b8:	540004a0	b.eq	0xfffff7fb844c  // b.none
   0x0000fffff7fb83bc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb83c0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb83c4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb83c8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb83cc:	54000400	b.eq	0xfffff7fb844c  // b.none
   0x0000fffff7fb83d0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb83d4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb83d8:	36d801d1	tbz	w17, #27, 0xfffff7fb8410
   0x0000fffff7fb83dc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb83e0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb83e4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb83e8:	54000321	b.ne	0xfffff7fb844c  // b.any
   0x0000fffff7fb83ec:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb83f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb83f4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb83f8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb83fc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb8400:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb8404:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb8408:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb840c:	54000209	b.ls	0xfffff7fb844c  // b.plast
   0x0000fffff7fb8410:	36d8008d	tbz	w13, #27, 0xfffff7fb8420
   0x0000fffff7fb8414:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb8418:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb841c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb8420:	36d80091	tbz	w17, #27, 0xfffff7fb8430
   0x0000fffff7fb8424:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8428:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb842c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb8430:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb8434:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb8438:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb843c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb8440:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb8444:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb8448:	1400000e	b	0xfffff7fb8480
   0x0000fffff7fb844c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb8450:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb8454:	aa1303e1	mov	x1, x19
   0x0000fffff7fb8458:	aa1503e2	mov	x2, x21
   0x0000fffff7fb845c:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fb8460:	aa1403e4	mov	x4, x20
   0x0000fffff7fb8464:	aa1603e5	mov	x5, x22
   0x0000fffff7fb8468:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb846c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb8470:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb8474:	d63f0200	blr	x16
   0x0000fffff7fb8478:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb847c:	5400d440	b.eq	0xfffff7fb9f04  // b.none
   0x0000fffff7fb8480:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb8484:	37d806a9	tbnz	w9, #27, 0xfffff7fb8558
   0x0000fffff7fb8488:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb848c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8490:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8494:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8498:	540001c1	b.ne	0xfffff7fb84d0  // b.any
   0x0000fffff7fb849c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb84a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb84a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb84a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb84ac:	54000121	b.ne	0xfffff7fb84d0  // b.any
   0x0000fffff7fb84b0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb84b4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb84b8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb84bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb84c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb84c4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb84c8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb84cc:	14000030	b	0xfffff7fb858c
   0x0000fffff7fb84d0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb84d4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb84d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb84dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb84e0:	54000120	b.eq	0xfffff7fb8504  // b.none
   0x0000fffff7fb84e4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb84e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb84ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb84f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb84f4:	54000321	b.ne	0xfffff7fb8558  // b.any
   0x0000fffff7fb84f8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb84fc:	9e620120	scvtf	d0, x9
   0x0000fffff7fb8500:	14000002	b	0xfffff7fb8508
   0x0000fffff7fb8504:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb8508:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb850c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb8510:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8514:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8518:	54000120	b.eq	0xfffff7fb853c  // b.none
   0x0000fffff7fb851c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb8520:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8524:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8528:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb852c:	54000161	b.ne	0xfffff7fb8558  // b.any
   0x0000fffff7fb8530:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb8534:	9e620121	scvtf	d1, x9
   0x0000fffff7fb8538:	14000002	b	0xfffff7fb8540
   0x0000fffff7fb853c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb8540:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb8544:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb8548:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb854c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8550:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb8554:	17ffffde	b	0xfffff7fb84cc
   0x0000fffff7fb8558:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb855c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb8560:	aa1303e1	mov	x1, x19
   0x0000fffff7fb8564:	aa1503e2	mov	x2, x21
   0x0000fffff7fb8568:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fb856c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb8570:	aa1603e5	mov	x5, x22
   0x0000fffff7fb8574:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb8578:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb857c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb8580:	d63f0200	blr	x16
   0x0000fffff7fb8584:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb8588:	5400cc20	b.eq	0xfffff7fb9f0c  // b.none
   0x0000fffff7fb858c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb8590:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb8594:	540004a0	b.eq	0xfffff7fb8628  // b.none
   0x0000fffff7fb8598:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb859c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb85a0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb85a4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb85a8:	54000400	b.eq	0xfffff7fb8628  // b.none
   0x0000fffff7fb85ac:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb85b0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb85b4:	36d801d1	tbz	w17, #27, 0xfffff7fb85ec
   0x0000fffff7fb85b8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb85bc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb85c0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb85c4:	54000321	b.ne	0xfffff7fb8628  // b.any
   0x0000fffff7fb85c8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb85cc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb85d0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb85d4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb85d8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb85dc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb85e0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb85e4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb85e8:	54000209	b.ls	0xfffff7fb8628  // b.plast
   0x0000fffff7fb85ec:	36d8008d	tbz	w13, #27, 0xfffff7fb85fc
   0x0000fffff7fb85f0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb85f4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb85f8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb85fc:	36d80091	tbz	w17, #27, 0xfffff7fb860c
   0x0000fffff7fb8600:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8604:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb8608:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb860c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb8610:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb8614:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb8618:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb861c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb8620:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb8624:	1400000e	b	0xfffff7fb865c
   0x0000fffff7fb8628:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb862c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb8630:	aa1303e1	mov	x1, x19
   0x0000fffff7fb8634:	aa1503e2	mov	x2, x21
   0x0000fffff7fb8638:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fb863c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb8640:	aa1603e5	mov	x5, x22
   0x0000fffff7fb8644:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb8648:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb864c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb8650:	d63f0200	blr	x16
   0x0000fffff7fb8654:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb8658:	5400c5e0	b.eq	0xfffff7fb9f14  // b.none
   0x0000fffff7fb865c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb8660:	37d806a9	tbnz	w9, #27, 0xfffff7fb8734
   0x0000fffff7fb8664:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb8668:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb866c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8670:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8674:	540001c1	b.ne	0xfffff7fb86ac  // b.any
   0x0000fffff7fb8678:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb867c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8680:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8684:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8688:	54000121	b.ne	0xfffff7fb86ac  // b.any
   0x0000fffff7fb868c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb8690:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb8694:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb8698:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb869c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb86a0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb86a4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb86a8:	14000030	b	0xfffff7fb8768
   0x0000fffff7fb86ac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb86b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb86b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb86b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb86bc:	54000120	b.eq	0xfffff7fb86e0  // b.none
   0x0000fffff7fb86c0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb86c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb86c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb86cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb86d0:	54000321	b.ne	0xfffff7fb8734  // b.any
   0x0000fffff7fb86d4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb86d8:	9e620120	scvtf	d0, x9
   0x0000fffff7fb86dc:	14000002	b	0xfffff7fb86e4
   0x0000fffff7fb86e0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb86e4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb86e8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb86ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb86f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb86f4:	54000120	b.eq	0xfffff7fb8718  // b.none
   0x0000fffff7fb86f8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb86fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8700:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8704:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8708:	54000161	b.ne	0xfffff7fb8734  // b.any
   0x0000fffff7fb870c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb8710:	9e620121	scvtf	d1, x9
   0x0000fffff7fb8714:	14000002	b	0xfffff7fb871c
   0x0000fffff7fb8718:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb871c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb8720:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb8724:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb8728:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb872c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb8730:	17ffffde	b	0xfffff7fb86a8
   0x0000fffff7fb8734:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb8738:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb873c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb8740:	aa1503e2	mov	x2, x21
   0x0000fffff7fb8744:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fb8748:	aa1403e4	mov	x4, x20
   0x0000fffff7fb874c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb8750:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb8754:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb8758:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb875c:	d63f0200	blr	x16
   0x0000fffff7fb8760:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb8764:	5400bdc0	b.eq	0xfffff7fb9f1c  // b.none
   0x0000fffff7fb8768:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb876c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb8770:	540004a0	b.eq	0xfffff7fb8804  // b.none
   0x0000fffff7fb8774:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb8778:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb877c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb8780:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb8784:	54000400	b.eq	0xfffff7fb8804  // b.none
   0x0000fffff7fb8788:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb878c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb8790:	36d801d1	tbz	w17, #27, 0xfffff7fb87c8
   0x0000fffff7fb8794:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb8798:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb879c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb87a0:	54000321	b.ne	0xfffff7fb8804  // b.any
   0x0000fffff7fb87a4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb87a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb87ac:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb87b0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb87b4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb87b8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb87bc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb87c0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb87c4:	54000209	b.ls	0xfffff7fb8804  // b.plast
   0x0000fffff7fb87c8:	36d8008d	tbz	w13, #27, 0xfffff7fb87d8
   0x0000fffff7fb87cc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb87d0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb87d4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb87d8:	36d80091	tbz	w17, #27, 0xfffff7fb87e8
   0x0000fffff7fb87dc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb87e0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb87e4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb87e8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb87ec:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb87f0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb87f4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb87f8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb87fc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb8800:	1400000e	b	0xfffff7fb8838
   0x0000fffff7fb8804:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb8808:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb880c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb8810:	aa1503e2	mov	x2, x21
   0x0000fffff7fb8814:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fb8818:	aa1403e4	mov	x4, x20
   0x0000fffff7fb881c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb8820:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb8824:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb8828:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb882c:	d63f0200	blr	x16
   0x0000fffff7fb8830:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb8834:	5400b780	b.eq	0xfffff7fb9f24  // b.none
   0x0000fffff7fb8838:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb883c:	37d806a9	tbnz	w9, #27, 0xfffff7fb8910
   0x0000fffff7fb8840:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb8844:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8848:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb884c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8850:	540001c1	b.ne	0xfffff7fb8888  // b.any
   0x0000fffff7fb8854:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb8858:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb885c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8860:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8864:	54000121	b.ne	0xfffff7fb8888  // b.any
   0x0000fffff7fb8868:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb886c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb8870:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb8874:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8878:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb887c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb8880:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb8884:	14000030	b	0xfffff7fb8944
   0x0000fffff7fb8888:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb888c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb8890:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8894:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8898:	54000120	b.eq	0xfffff7fb88bc  // b.none
   0x0000fffff7fb889c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb88a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb88a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb88a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb88ac:	54000321	b.ne	0xfffff7fb8910  // b.any
   0x0000fffff7fb88b0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb88b4:	9e620120	scvtf	d0, x9
   0x0000fffff7fb88b8:	14000002	b	0xfffff7fb88c0
   0x0000fffff7fb88bc:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb88c0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb88c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb88c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb88cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb88d0:	54000120	b.eq	0xfffff7fb88f4  // b.none
   0x0000fffff7fb88d4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb88d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb88dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb88e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb88e4:	54000161	b.ne	0xfffff7fb8910  // b.any
   0x0000fffff7fb88e8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb88ec:	9e620121	scvtf	d1, x9
   0x0000fffff7fb88f0:	14000002	b	0xfffff7fb88f8
   0x0000fffff7fb88f4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb88f8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb88fc:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb8900:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb8904:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8908:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb890c:	17ffffde	b	0xfffff7fb8884
   0x0000fffff7fb8910:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb8914:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb8918:	aa1303e1	mov	x1, x19
   0x0000fffff7fb891c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb8920:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fb8924:	aa1403e4	mov	x4, x20
   0x0000fffff7fb8928:	aa1603e5	mov	x5, x22
   0x0000fffff7fb892c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb8930:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb8934:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb8938:	d63f0200	blr	x16
   0x0000fffff7fb893c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb8940:	5400af60	b.eq	0xfffff7fb9f2c  // b.none
   0x0000fffff7fb8944:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb8948:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb894c:	540004a0	b.eq	0xfffff7fb89e0  // b.none
   0x0000fffff7fb8950:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb8954:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb8958:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb895c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb8960:	54000400	b.eq	0xfffff7fb89e0  // b.none
   0x0000fffff7fb8964:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb8968:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb896c:	36d801d1	tbz	w17, #27, 0xfffff7fb89a4
   0x0000fffff7fb8970:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb8974:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb8978:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb897c:	54000321	b.ne	0xfffff7fb89e0  // b.any
   0x0000fffff7fb8980:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb8984:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8988:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb898c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb8990:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb8994:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb8998:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb899c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb89a0:	54000209	b.ls	0xfffff7fb89e0  // b.plast
   0x0000fffff7fb89a4:	36d8008d	tbz	w13, #27, 0xfffff7fb89b4
   0x0000fffff7fb89a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb89ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb89b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb89b4:	36d80091	tbz	w17, #27, 0xfffff7fb89c4
   0x0000fffff7fb89b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb89bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb89c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb89c4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb89c8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb89cc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb89d0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb89d4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb89d8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb89dc:	1400000e	b	0xfffff7fb8a14
   0x0000fffff7fb89e0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb89e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb89e8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb89ec:	aa1503e2	mov	x2, x21
   0x0000fffff7fb89f0:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fb89f4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb89f8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb89fc:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb8a00:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb8a04:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb8a08:	d63f0200	blr	x16
   0x0000fffff7fb8a0c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb8a10:	5400a920	b.eq	0xfffff7fb9f34  // b.none
   0x0000fffff7fb8a14:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb8a18:	37d806a9	tbnz	w9, #27, 0xfffff7fb8aec
   0x0000fffff7fb8a1c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb8a20:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8a24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8a28:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8a2c:	540001c1	b.ne	0xfffff7fb8a64  // b.any
   0x0000fffff7fb8a30:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb8a34:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8a38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8a3c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8a40:	54000121	b.ne	0xfffff7fb8a64  // b.any
   0x0000fffff7fb8a44:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb8a48:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb8a4c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb8a50:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8a54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8a58:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb8a5c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb8a60:	14000030	b	0xfffff7fb8b20
   0x0000fffff7fb8a64:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb8a68:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb8a6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8a70:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8a74:	54000120	b.eq	0xfffff7fb8a98  // b.none
   0x0000fffff7fb8a78:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb8a7c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8a80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8a84:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8a88:	54000321	b.ne	0xfffff7fb8aec  // b.any
   0x0000fffff7fb8a8c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb8a90:	9e620120	scvtf	d0, x9
   0x0000fffff7fb8a94:	14000002	b	0xfffff7fb8a9c
   0x0000fffff7fb8a98:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb8a9c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb8aa0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb8aa4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8aa8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8aac:	54000120	b.eq	0xfffff7fb8ad0  // b.none
   0x0000fffff7fb8ab0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb8ab4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8ab8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8abc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8ac0:	54000161	b.ne	0xfffff7fb8aec  // b.any
   0x0000fffff7fb8ac4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb8ac8:	9e620121	scvtf	d1, x9
   0x0000fffff7fb8acc:	14000002	b	0xfffff7fb8ad4
   0x0000fffff7fb8ad0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb8ad4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb8ad8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb8adc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb8ae0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8ae4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb8ae8:	17ffffde	b	0xfffff7fb8a60
   0x0000fffff7fb8aec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb8af0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb8af4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb8af8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb8afc:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fb8b00:	aa1403e4	mov	x4, x20
   0x0000fffff7fb8b04:	aa1603e5	mov	x5, x22
   0x0000fffff7fb8b08:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb8b0c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb8b10:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb8b14:	d63f0200	blr	x16
   0x0000fffff7fb8b18:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb8b1c:	5400a100	b.eq	0xfffff7fb9f3c  // b.none
   0x0000fffff7fb8b20:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb8b24:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb8b28:	540004a0	b.eq	0xfffff7fb8bbc  // b.none
   0x0000fffff7fb8b2c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb8b30:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb8b34:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb8b38:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb8b3c:	54000400	b.eq	0xfffff7fb8bbc  // b.none
   0x0000fffff7fb8b40:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb8b44:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb8b48:	36d801d1	tbz	w17, #27, 0xfffff7fb8b80
   0x0000fffff7fb8b4c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb8b50:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb8b54:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb8b58:	54000321	b.ne	0xfffff7fb8bbc  // b.any
   0x0000fffff7fb8b5c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb8b60:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8b64:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb8b68:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb8b6c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb8b70:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb8b74:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb8b78:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb8b7c:	54000209	b.ls	0xfffff7fb8bbc  // b.plast
   0x0000fffff7fb8b80:	36d8008d	tbz	w13, #27, 0xfffff7fb8b90
   0x0000fffff7fb8b84:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb8b88:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb8b8c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb8b90:	36d80091	tbz	w17, #27, 0xfffff7fb8ba0
   0x0000fffff7fb8b94:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8b98:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb8b9c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb8ba0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb8ba4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb8ba8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb8bac:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb8bb0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb8bb4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb8bb8:	1400000e	b	0xfffff7fb8bf0
   0x0000fffff7fb8bbc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb8bc0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb8bc4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb8bc8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb8bcc:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fb8bd0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb8bd4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb8bd8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb8bdc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb8be0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb8be4:	d63f0200	blr	x16
   0x0000fffff7fb8be8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb8bec:	54009ac0	b.eq	0xfffff7fb9f44  // b.none
   0x0000fffff7fb8bf0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb8bf4:	37d806a9	tbnz	w9, #27, 0xfffff7fb8cc8
   0x0000fffff7fb8bf8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb8bfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8c00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8c04:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8c08:	540001c1	b.ne	0xfffff7fb8c40  // b.any
   0x0000fffff7fb8c0c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb8c10:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8c14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8c18:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8c1c:	54000121	b.ne	0xfffff7fb8c40  // b.any
   0x0000fffff7fb8c20:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb8c24:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb8c28:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb8c2c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8c30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8c34:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb8c38:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb8c3c:	14000030	b	0xfffff7fb8cfc
   0x0000fffff7fb8c40:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb8c44:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb8c48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8c4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8c50:	54000120	b.eq	0xfffff7fb8c74  // b.none
   0x0000fffff7fb8c54:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb8c58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8c5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8c60:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8c64:	54000321	b.ne	0xfffff7fb8cc8  // b.any
   0x0000fffff7fb8c68:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb8c6c:	9e620120	scvtf	d0, x9
   0x0000fffff7fb8c70:	14000002	b	0xfffff7fb8c78
   0x0000fffff7fb8c74:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb8c78:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb8c7c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb8c80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8c84:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8c88:	54000120	b.eq	0xfffff7fb8cac  // b.none
   0x0000fffff7fb8c8c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb8c90:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8c94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8c98:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8c9c:	54000161	b.ne	0xfffff7fb8cc8  // b.any
   0x0000fffff7fb8ca0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb8ca4:	9e620121	scvtf	d1, x9
   0x0000fffff7fb8ca8:	14000002	b	0xfffff7fb8cb0
   0x0000fffff7fb8cac:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb8cb0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb8cb4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb8cb8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb8cbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8cc0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb8cc4:	17ffffde	b	0xfffff7fb8c3c
   0x0000fffff7fb8cc8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb8ccc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb8cd0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb8cd4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb8cd8:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fb8cdc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb8ce0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb8ce4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb8ce8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb8cec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb8cf0:	d63f0200	blr	x16
   0x0000fffff7fb8cf4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb8cf8:	540092a0	b.eq	0xfffff7fb9f4c  // b.none
   0x0000fffff7fb8cfc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb8d00:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb8d04:	540004a0	b.eq	0xfffff7fb8d98  // b.none
   0x0000fffff7fb8d08:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb8d0c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb8d10:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb8d14:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb8d18:	54000400	b.eq	0xfffff7fb8d98  // b.none
   0x0000fffff7fb8d1c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb8d20:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb8d24:	36d801d1	tbz	w17, #27, 0xfffff7fb8d5c
   0x0000fffff7fb8d28:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb8d2c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb8d30:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb8d34:	54000321	b.ne	0xfffff7fb8d98  // b.any
   0x0000fffff7fb8d38:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb8d3c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8d40:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb8d44:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb8d48:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb8d4c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb8d50:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb8d54:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb8d58:	54000209	b.ls	0xfffff7fb8d98  // b.plast
   0x0000fffff7fb8d5c:	36d8008d	tbz	w13, #27, 0xfffff7fb8d6c
   0x0000fffff7fb8d60:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb8d64:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb8d68:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb8d6c:	36d80091	tbz	w17, #27, 0xfffff7fb8d7c
   0x0000fffff7fb8d70:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8d74:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb8d78:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb8d7c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb8d80:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb8d84:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb8d88:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb8d8c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb8d90:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb8d94:	1400000e	b	0xfffff7fb8dcc
   0x0000fffff7fb8d98:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb8d9c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb8da0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb8da4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb8da8:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fb8dac:	aa1403e4	mov	x4, x20
   0x0000fffff7fb8db0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb8db4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb8db8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb8dbc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb8dc0:	d63f0200	blr	x16
   0x0000fffff7fb8dc4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb8dc8:	54008c60	b.eq	0xfffff7fb9f54  // b.none
   0x0000fffff7fb8dcc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb8dd0:	37d806a9	tbnz	w9, #27, 0xfffff7fb8ea4
   0x0000fffff7fb8dd4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb8dd8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8ddc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8de0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8de4:	540001c1	b.ne	0xfffff7fb8e1c  // b.any
   0x0000fffff7fb8de8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb8dec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8df0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8df4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8df8:	54000121	b.ne	0xfffff7fb8e1c  // b.any
   0x0000fffff7fb8dfc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb8e00:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb8e04:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb8e08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8e0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8e10:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb8e14:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb8e18:	14000030	b	0xfffff7fb8ed8
   0x0000fffff7fb8e1c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb8e20:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb8e24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8e28:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8e2c:	54000120	b.eq	0xfffff7fb8e50  // b.none
   0x0000fffff7fb8e30:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb8e34:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8e38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8e3c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8e40:	54000321	b.ne	0xfffff7fb8ea4  // b.any
   0x0000fffff7fb8e44:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb8e48:	9e620120	scvtf	d0, x9
   0x0000fffff7fb8e4c:	14000002	b	0xfffff7fb8e54
   0x0000fffff7fb8e50:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb8e54:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb8e58:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb8e5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8e60:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8e64:	54000120	b.eq	0xfffff7fb8e88  // b.none
   0x0000fffff7fb8e68:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb8e6c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8e70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8e74:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8e78:	54000161	b.ne	0xfffff7fb8ea4  // b.any
   0x0000fffff7fb8e7c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb8e80:	9e620121	scvtf	d1, x9
   0x0000fffff7fb8e84:	14000002	b	0xfffff7fb8e8c
   0x0000fffff7fb8e88:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb8e8c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb8e90:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb8e94:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb8e98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8e9c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb8ea0:	17ffffde	b	0xfffff7fb8e18
   0x0000fffff7fb8ea4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb8ea8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb8eac:	aa1303e1	mov	x1, x19
   0x0000fffff7fb8eb0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb8eb4:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fb8eb8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb8ebc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb8ec0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb8ec4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb8ec8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb8ecc:	d63f0200	blr	x16
   0x0000fffff7fb8ed0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb8ed4:	54008440	b.eq	0xfffff7fb9f5c  // b.none
   0x0000fffff7fb8ed8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb8edc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb8ee0:	540004a0	b.eq	0xfffff7fb8f74  // b.none
   0x0000fffff7fb8ee4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb8ee8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb8eec:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb8ef0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb8ef4:	54000400	b.eq	0xfffff7fb8f74  // b.none
   0x0000fffff7fb8ef8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb8efc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb8f00:	36d801d1	tbz	w17, #27, 0xfffff7fb8f38
   0x0000fffff7fb8f04:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb8f08:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb8f0c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb8f10:	54000321	b.ne	0xfffff7fb8f74  // b.any
   0x0000fffff7fb8f14:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb8f18:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8f1c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb8f20:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb8f24:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb8f28:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb8f2c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb8f30:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb8f34:	54000209	b.ls	0xfffff7fb8f74  // b.plast
   0x0000fffff7fb8f38:	36d8008d	tbz	w13, #27, 0xfffff7fb8f48
   0x0000fffff7fb8f3c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb8f40:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb8f44:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb8f48:	36d80091	tbz	w17, #27, 0xfffff7fb8f58
   0x0000fffff7fb8f4c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8f50:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb8f54:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb8f58:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb8f5c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb8f60:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb8f64:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb8f68:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb8f6c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb8f70:	1400000e	b	0xfffff7fb8fa8
   0x0000fffff7fb8f74:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb8f78:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb8f7c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb8f80:	aa1503e2	mov	x2, x21
   0x0000fffff7fb8f84:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fb8f88:	aa1403e4	mov	x4, x20
   0x0000fffff7fb8f8c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb8f90:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb8f94:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb8f98:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb8f9c:	d63f0200	blr	x16
   0x0000fffff7fb8fa0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb8fa4:	54007e00	b.eq	0xfffff7fb9f64  // b.none
   0x0000fffff7fb8fa8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb8fac:	37d806a9	tbnz	w9, #27, 0xfffff7fb9080
   0x0000fffff7fb8fb0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb8fb4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8fb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8fbc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8fc0:	540001c1	b.ne	0xfffff7fb8ff8  // b.any
   0x0000fffff7fb8fc4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb8fc8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8fcc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8fd0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8fd4:	54000121	b.ne	0xfffff7fb8ff8  // b.any
   0x0000fffff7fb8fd8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb8fdc:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb8fe0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb8fe4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8fe8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8fec:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb8ff0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb8ff4:	14000030	b	0xfffff7fb90b4
   0x0000fffff7fb8ff8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb8ffc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9000:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9004:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9008:	54000120	b.eq	0xfffff7fb902c  // b.none
   0x0000fffff7fb900c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb9010:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9014:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9018:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb901c:	54000321	b.ne	0xfffff7fb9080  // b.any
   0x0000fffff7fb9020:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb9024:	9e620120	scvtf	d0, x9
   0x0000fffff7fb9028:	14000002	b	0xfffff7fb9030
   0x0000fffff7fb902c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb9030:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb9034:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9038:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb903c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9040:	54000120	b.eq	0xfffff7fb9064  // b.none
   0x0000fffff7fb9044:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb9048:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb904c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9050:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9054:	54000161	b.ne	0xfffff7fb9080  // b.any
   0x0000fffff7fb9058:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb905c:	9e620121	scvtf	d1, x9
   0x0000fffff7fb9060:	14000002	b	0xfffff7fb9068
   0x0000fffff7fb9064:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb9068:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb906c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb9070:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9074:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9078:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb907c:	17ffffde	b	0xfffff7fb8ff4
   0x0000fffff7fb9080:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb9084:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9088:	aa1303e1	mov	x1, x19
   0x0000fffff7fb908c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9090:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fb9094:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9098:	aa1603e5	mov	x5, x22
   0x0000fffff7fb909c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb90a0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb90a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb90a8:	d63f0200	blr	x16
   0x0000fffff7fb90ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb90b0:	540075e0	b.eq	0xfffff7fb9f6c  // b.none
   0x0000fffff7fb90b4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb90b8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb90bc:	540004a0	b.eq	0xfffff7fb9150  // b.none
   0x0000fffff7fb90c0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb90c4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb90c8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb90cc:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb90d0:	54000400	b.eq	0xfffff7fb9150  // b.none
   0x0000fffff7fb90d4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb90d8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb90dc:	36d801d1	tbz	w17, #27, 0xfffff7fb9114
   0x0000fffff7fb90e0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb90e4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb90e8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb90ec:	54000321	b.ne	0xfffff7fb9150  // b.any
   0x0000fffff7fb90f0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb90f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb90f8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb90fc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb9100:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb9104:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb9108:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb910c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb9110:	54000209	b.ls	0xfffff7fb9150  // b.plast
   0x0000fffff7fb9114:	36d8008d	tbz	w13, #27, 0xfffff7fb9124
   0x0000fffff7fb9118:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb911c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb9120:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb9124:	36d80091	tbz	w17, #27, 0xfffff7fb9134
   0x0000fffff7fb9128:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb912c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb9130:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb9134:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb9138:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb913c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb9140:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb9144:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb9148:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb914c:	1400000e	b	0xfffff7fb9184
   0x0000fffff7fb9150:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb9154:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9158:	aa1303e1	mov	x1, x19
   0x0000fffff7fb915c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9160:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fb9164:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9168:	aa1603e5	mov	x5, x22
   0x0000fffff7fb916c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb9170:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb9174:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9178:	d63f0200	blr	x16
   0x0000fffff7fb917c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb9180:	54006fa0	b.eq	0xfffff7fb9f74  // b.none
   0x0000fffff7fb9184:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb9188:	37d806a9	tbnz	w9, #27, 0xfffff7fb925c
   0x0000fffff7fb918c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb9190:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9194:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9198:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb919c:	540001c1	b.ne	0xfffff7fb91d4  // b.any
   0x0000fffff7fb91a0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb91a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb91a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb91ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb91b0:	54000121	b.ne	0xfffff7fb91d4  // b.any
   0x0000fffff7fb91b4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb91b8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb91bc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb91c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb91c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb91c8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb91cc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb91d0:	14000030	b	0xfffff7fb9290
   0x0000fffff7fb91d4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb91d8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb91dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb91e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb91e4:	54000120	b.eq	0xfffff7fb9208  // b.none
   0x0000fffff7fb91e8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb91ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb91f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb91f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb91f8:	54000321	b.ne	0xfffff7fb925c  // b.any
   0x0000fffff7fb91fc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb9200:	9e620120	scvtf	d0, x9
   0x0000fffff7fb9204:	14000002	b	0xfffff7fb920c
   0x0000fffff7fb9208:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb920c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb9210:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9214:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9218:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb921c:	54000120	b.eq	0xfffff7fb9240  // b.none
   0x0000fffff7fb9220:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb9224:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9228:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb922c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9230:	54000161	b.ne	0xfffff7fb925c  // b.any
   0x0000fffff7fb9234:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb9238:	9e620121	scvtf	d1, x9
   0x0000fffff7fb923c:	14000002	b	0xfffff7fb9244
   0x0000fffff7fb9240:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb9244:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb9248:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb924c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9250:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9254:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb9258:	17ffffde	b	0xfffff7fb91d0
   0x0000fffff7fb925c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb9260:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9264:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9268:	aa1503e2	mov	x2, x21
   0x0000fffff7fb926c:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fb9270:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9274:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9278:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb927c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb9280:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9284:	d63f0200	blr	x16
   0x0000fffff7fb9288:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb928c:	54006780	b.eq	0xfffff7fb9f7c  // b.none
   0x0000fffff7fb9290:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb9294:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb9298:	540004a0	b.eq	0xfffff7fb932c  // b.none
   0x0000fffff7fb929c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb92a0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb92a4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb92a8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb92ac:	54000400	b.eq	0xfffff7fb932c  // b.none
   0x0000fffff7fb92b0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb92b4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb92b8:	36d801d1	tbz	w17, #27, 0xfffff7fb92f0
   0x0000fffff7fb92bc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb92c0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb92c4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb92c8:	54000321	b.ne	0xfffff7fb932c  // b.any
   0x0000fffff7fb92cc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb92d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb92d4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb92d8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb92dc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb92e0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb92e4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb92e8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb92ec:	54000209	b.ls	0xfffff7fb932c  // b.plast
   0x0000fffff7fb92f0:	36d8008d	tbz	w13, #27, 0xfffff7fb9300
   0x0000fffff7fb92f4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb92f8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb92fc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb9300:	36d80091	tbz	w17, #27, 0xfffff7fb9310
   0x0000fffff7fb9304:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb9308:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb930c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb9310:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb9314:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb9318:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb931c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb9320:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb9324:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb9328:	1400000e	b	0xfffff7fb9360
   0x0000fffff7fb932c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb9330:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9334:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9338:	aa1503e2	mov	x2, x21
   0x0000fffff7fb933c:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fb9340:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9344:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9348:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb934c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb9350:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9354:	d63f0200	blr	x16
   0x0000fffff7fb9358:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb935c:	54006140	b.eq	0xfffff7fb9f84  // b.none
   0x0000fffff7fb9360:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb9364:	37d806a9	tbnz	w9, #27, 0xfffff7fb9438
   0x0000fffff7fb9368:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb936c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9370:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9374:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9378:	540001c1	b.ne	0xfffff7fb93b0  // b.any
   0x0000fffff7fb937c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb9380:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9384:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9388:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb938c:	54000121	b.ne	0xfffff7fb93b0  // b.any
   0x0000fffff7fb9390:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb9394:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb9398:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb939c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb93a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb93a4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb93a8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb93ac:	14000030	b	0xfffff7fb946c
   0x0000fffff7fb93b0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb93b4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb93b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb93bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb93c0:	54000120	b.eq	0xfffff7fb93e4  // b.none
   0x0000fffff7fb93c4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb93c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb93cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb93d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb93d4:	54000321	b.ne	0xfffff7fb9438  // b.any
   0x0000fffff7fb93d8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb93dc:	9e620120	scvtf	d0, x9
   0x0000fffff7fb93e0:	14000002	b	0xfffff7fb93e8
   0x0000fffff7fb93e4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb93e8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb93ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb93f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb93f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb93f8:	54000120	b.eq	0xfffff7fb941c  // b.none
   0x0000fffff7fb93fc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb9400:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9404:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9408:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb940c:	54000161	b.ne	0xfffff7fb9438  // b.any
   0x0000fffff7fb9410:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb9414:	9e620121	scvtf	d1, x9
   0x0000fffff7fb9418:	14000002	b	0xfffff7fb9420
   0x0000fffff7fb941c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb9420:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb9424:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb9428:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb942c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9430:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb9434:	17ffffde	b	0xfffff7fb93ac
   0x0000fffff7fb9438:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb943c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9440:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9444:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9448:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fb944c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9450:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9454:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb9458:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb945c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9460:	d63f0200	blr	x16
   0x0000fffff7fb9464:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb9468:	54005920	b.eq	0xfffff7fb9f8c  // b.none
   0x0000fffff7fb946c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb9470:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb9474:	540004a0	b.eq	0xfffff7fb9508  // b.none
   0x0000fffff7fb9478:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb947c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb9480:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb9484:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb9488:	54000400	b.eq	0xfffff7fb9508  // b.none
   0x0000fffff7fb948c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb9490:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb9494:	36d801d1	tbz	w17, #27, 0xfffff7fb94cc
   0x0000fffff7fb9498:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb949c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb94a0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb94a4:	54000321	b.ne	0xfffff7fb9508  // b.any
   0x0000fffff7fb94a8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb94ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb94b0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb94b4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb94b8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb94bc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb94c0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb94c4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb94c8:	54000209	b.ls	0xfffff7fb9508  // b.plast
   0x0000fffff7fb94cc:	36d8008d	tbz	w13, #27, 0xfffff7fb94dc
   0x0000fffff7fb94d0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb94d4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb94d8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb94dc:	36d80091	tbz	w17, #27, 0xfffff7fb94ec
   0x0000fffff7fb94e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb94e4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb94e8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb94ec:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb94f0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb94f4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb94f8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb94fc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb9500:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb9504:	1400000e	b	0xfffff7fb953c
   0x0000fffff7fb9508:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb950c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9510:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9514:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9518:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fb951c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9520:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9524:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb9528:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb952c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9530:	d63f0200	blr	x16
   0x0000fffff7fb9534:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb9538:	540052e0	b.eq	0xfffff7fb9f94  // b.none
   0x0000fffff7fb953c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb9540:	37d806a9	tbnz	w9, #27, 0xfffff7fb9614
   0x0000fffff7fb9544:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb9548:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb954c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9550:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9554:	540001c1	b.ne	0xfffff7fb958c  // b.any
   0x0000fffff7fb9558:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb955c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9560:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9564:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9568:	54000121	b.ne	0xfffff7fb958c  // b.any
   0x0000fffff7fb956c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb9570:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb9574:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb9578:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb957c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9580:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb9584:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb9588:	14000030	b	0xfffff7fb9648
   0x0000fffff7fb958c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb9590:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9594:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9598:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb959c:	54000120	b.eq	0xfffff7fb95c0  // b.none
   0x0000fffff7fb95a0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb95a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb95a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb95ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb95b0:	54000321	b.ne	0xfffff7fb9614  // b.any
   0x0000fffff7fb95b4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb95b8:	9e620120	scvtf	d0, x9
   0x0000fffff7fb95bc:	14000002	b	0xfffff7fb95c4
   0x0000fffff7fb95c0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb95c4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb95c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb95cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb95d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb95d4:	54000120	b.eq	0xfffff7fb95f8  // b.none
   0x0000fffff7fb95d8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb95dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb95e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb95e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb95e8:	54000161	b.ne	0xfffff7fb9614  // b.any
   0x0000fffff7fb95ec:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb95f0:	9e620121	scvtf	d1, x9
   0x0000fffff7fb95f4:	14000002	b	0xfffff7fb95fc
   0x0000fffff7fb95f8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb95fc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb9600:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb9604:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9608:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb960c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb9610:	17ffffde	b	0xfffff7fb9588
   0x0000fffff7fb9614:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb9618:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb961c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9620:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9624:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fb9628:	aa1403e4	mov	x4, x20
   0x0000fffff7fb962c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9630:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb9634:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb9638:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb963c:	d63f0200	blr	x16
   0x0000fffff7fb9640:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb9644:	54004ac0	b.eq	0xfffff7fb9f9c  // b.none
   0x0000fffff7fb9648:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb964c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb9650:	540004a0	b.eq	0xfffff7fb96e4  // b.none
   0x0000fffff7fb9654:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb9658:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb965c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb9660:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb9664:	54000400	b.eq	0xfffff7fb96e4  // b.none
   0x0000fffff7fb9668:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb966c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb9670:	36d801d1	tbz	w17, #27, 0xfffff7fb96a8
   0x0000fffff7fb9674:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb9678:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb967c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb9680:	54000321	b.ne	0xfffff7fb96e4  // b.any
   0x0000fffff7fb9684:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb9688:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb968c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb9690:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb9694:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb9698:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb969c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb96a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb96a4:	54000209	b.ls	0xfffff7fb96e4  // b.plast
   0x0000fffff7fb96a8:	36d8008d	tbz	w13, #27, 0xfffff7fb96b8
   0x0000fffff7fb96ac:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb96b0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb96b4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb96b8:	36d80091	tbz	w17, #27, 0xfffff7fb96c8
   0x0000fffff7fb96bc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb96c0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb96c4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb96c8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb96cc:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb96d0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb96d4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb96d8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb96dc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb96e0:	1400000e	b	0xfffff7fb9718
   0x0000fffff7fb96e4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb96e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb96ec:	aa1303e1	mov	x1, x19
   0x0000fffff7fb96f0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb96f4:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fb96f8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb96fc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9700:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb9704:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb9708:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb970c:	d63f0200	blr	x16
   0x0000fffff7fb9710:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb9714:	54004480	b.eq	0xfffff7fb9fa4  // b.none
   0x0000fffff7fb9718:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb971c:	37d806a9	tbnz	w9, #27, 0xfffff7fb97f0
   0x0000fffff7fb9720:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb9724:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9728:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb972c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9730:	540001c1	b.ne	0xfffff7fb9768  // b.any
   0x0000fffff7fb9734:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb9738:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb973c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9740:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9744:	54000121	b.ne	0xfffff7fb9768  // b.any
   0x0000fffff7fb9748:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb974c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb9750:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb9754:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9758:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb975c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb9760:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb9764:	14000030	b	0xfffff7fb9824
   0x0000fffff7fb9768:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb976c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9770:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9774:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9778:	54000120	b.eq	0xfffff7fb979c  // b.none
   0x0000fffff7fb977c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb9780:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9784:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9788:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb978c:	54000321	b.ne	0xfffff7fb97f0  // b.any
   0x0000fffff7fb9790:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb9794:	9e620120	scvtf	d0, x9
   0x0000fffff7fb9798:	14000002	b	0xfffff7fb97a0
   0x0000fffff7fb979c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb97a0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb97a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb97a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb97ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb97b0:	54000120	b.eq	0xfffff7fb97d4  // b.none
   0x0000fffff7fb97b4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb97b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb97bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb97c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb97c4:	54000161	b.ne	0xfffff7fb97f0  // b.any
   0x0000fffff7fb97c8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb97cc:	9e620121	scvtf	d1, x9
   0x0000fffff7fb97d0:	14000002	b	0xfffff7fb97d8
   0x0000fffff7fb97d4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb97d8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb97dc:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb97e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb97e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb97e8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb97ec:	17ffffde	b	0xfffff7fb9764
   0x0000fffff7fb97f0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb97f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb97f8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb97fc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9800:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fb9804:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9808:	aa1603e5	mov	x5, x22
   0x0000fffff7fb980c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb9810:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb9814:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9818:	d63f0200	blr	x16
   0x0000fffff7fb981c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb9820:	54003c60	b.eq	0xfffff7fb9fac  // b.none
   0x0000fffff7fb9824:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb9828:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb982c:	540004a0	b.eq	0xfffff7fb98c0  // b.none
   0x0000fffff7fb9830:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb9834:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb9838:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb983c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb9840:	54000400	b.eq	0xfffff7fb98c0  // b.none
   0x0000fffff7fb9844:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb9848:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb984c:	36d801d1	tbz	w17, #27, 0xfffff7fb9884
   0x0000fffff7fb9850:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb9854:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb9858:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb985c:	54000321	b.ne	0xfffff7fb98c0  // b.any
   0x0000fffff7fb9860:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb9864:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb9868:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb986c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb9870:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb9874:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb9878:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb987c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb9880:	54000209	b.ls	0xfffff7fb98c0  // b.plast
   0x0000fffff7fb9884:	36d8008d	tbz	w13, #27, 0xfffff7fb9894
   0x0000fffff7fb9888:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb988c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb9890:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb9894:	36d80091	tbz	w17, #27, 0xfffff7fb98a4
   0x0000fffff7fb9898:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb989c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb98a0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb98a4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb98a8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb98ac:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb98b0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb98b4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb98b8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb98bc:	1400000e	b	0xfffff7fb98f4
   0x0000fffff7fb98c0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb98c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb98c8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb98cc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb98d0:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fb98d4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb98d8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb98dc:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb98e0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb98e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb98e8:	d63f0200	blr	x16
   0x0000fffff7fb98ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb98f0:	54003620	b.eq	0xfffff7fb9fb4  // b.none
   0x0000fffff7fb98f4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb98f8:	37d806a9	tbnz	w9, #27, 0xfffff7fb99cc
   0x0000fffff7fb98fc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb9900:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9904:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9908:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb990c:	540001c1	b.ne	0xfffff7fb9944  // b.any
   0x0000fffff7fb9910:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb9914:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9918:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb991c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9920:	54000121	b.ne	0xfffff7fb9944  // b.any
   0x0000fffff7fb9924:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb9928:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb992c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb9930:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9934:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9938:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb993c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb9940:	14000030	b	0xfffff7fb9a00
   0x0000fffff7fb9944:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb9948:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb994c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9950:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9954:	54000120	b.eq	0xfffff7fb9978  // b.none
   0x0000fffff7fb9958:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb995c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9960:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9964:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9968:	54000321	b.ne	0xfffff7fb99cc  // b.any
   0x0000fffff7fb996c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb9970:	9e620120	scvtf	d0, x9
   0x0000fffff7fb9974:	14000002	b	0xfffff7fb997c
   0x0000fffff7fb9978:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb997c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb9980:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9984:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9988:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb998c:	54000120	b.eq	0xfffff7fb99b0  // b.none
   0x0000fffff7fb9990:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb9994:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9998:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb999c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb99a0:	54000161	b.ne	0xfffff7fb99cc  // b.any
   0x0000fffff7fb99a4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb99a8:	9e620121	scvtf	d1, x9
   0x0000fffff7fb99ac:	14000002	b	0xfffff7fb99b4
   0x0000fffff7fb99b0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb99b4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb99b8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb99bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb99c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb99c4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb99c8:	17ffffde	b	0xfffff7fb9940
   0x0000fffff7fb99cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb99d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb99d4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb99d8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb99dc:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fb99e0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb99e4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb99e8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb99ec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb99f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb99f4:	d63f0200	blr	x16
   0x0000fffff7fb99f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb99fc:	54002e00	b.eq	0xfffff7fb9fbc  // b.none
   0x0000fffff7fb9a00:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb9a04:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb9a08:	540004a0	b.eq	0xfffff7fb9a9c  // b.none
   0x0000fffff7fb9a0c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb9a10:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb9a14:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb9a18:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb9a1c:	54000400	b.eq	0xfffff7fb9a9c  // b.none
   0x0000fffff7fb9a20:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb9a24:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb9a28:	36d801d1	tbz	w17, #27, 0xfffff7fb9a60
   0x0000fffff7fb9a2c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb9a30:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb9a34:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb9a38:	54000321	b.ne	0xfffff7fb9a9c  // b.any
   0x0000fffff7fb9a3c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb9a40:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb9a44:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb9a48:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb9a4c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb9a50:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb9a54:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb9a58:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb9a5c:	54000209	b.ls	0xfffff7fb9a9c  // b.plast
   0x0000fffff7fb9a60:	36d8008d	tbz	w13, #27, 0xfffff7fb9a70
   0x0000fffff7fb9a64:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb9a68:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb9a6c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb9a70:	36d80091	tbz	w17, #27, 0xfffff7fb9a80
   0x0000fffff7fb9a74:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb9a78:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb9a7c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb9a80:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb9a84:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb9a88:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb9a8c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb9a90:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb9a94:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb9a98:	1400000e	b	0xfffff7fb9ad0
   0x0000fffff7fb9a9c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb9aa0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9aa4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9aa8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9aac:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fb9ab0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9ab4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9ab8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb9abc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb9ac0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9ac4:	d63f0200	blr	x16
   0x0000fffff7fb9ac8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb9acc:	540027c0	b.eq	0xfffff7fb9fc4  // b.none
   0x0000fffff7fb9ad0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb9ad4:	37d806a9	tbnz	w9, #27, 0xfffff7fb9ba8
   0x0000fffff7fb9ad8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb9adc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9ae0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9ae4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9ae8:	540001c1	b.ne	0xfffff7fb9b20  // b.any
   0x0000fffff7fb9aec:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb9af0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9af4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9af8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9afc:	54000121	b.ne	0xfffff7fb9b20  // b.any
   0x0000fffff7fb9b00:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb9b04:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb9b08:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb9b0c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9b10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9b14:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb9b18:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb9b1c:	14000030	b	0xfffff7fb9bdc
   0x0000fffff7fb9b20:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb9b24:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9b28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9b2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9b30:	54000120	b.eq	0xfffff7fb9b54  // b.none
   0x0000fffff7fb9b34:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb9b38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9b3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9b40:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9b44:	54000321	b.ne	0xfffff7fb9ba8  // b.any
   0x0000fffff7fb9b48:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb9b4c:	9e620120	scvtf	d0, x9
   0x0000fffff7fb9b50:	14000002	b	0xfffff7fb9b58
   0x0000fffff7fb9b54:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb9b58:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb9b5c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9b60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9b64:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9b68:	54000120	b.eq	0xfffff7fb9b8c  // b.none
   0x0000fffff7fb9b6c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb9b70:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9b74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9b78:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9b7c:	54000161	b.ne	0xfffff7fb9ba8  // b.any
   0x0000fffff7fb9b80:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb9b84:	9e620121	scvtf	d1, x9
   0x0000fffff7fb9b88:	14000002	b	0xfffff7fb9b90
   0x0000fffff7fb9b8c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb9b90:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb9b94:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb9b98:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9b9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9ba0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb9ba4:	17ffffde	b	0xfffff7fb9b1c
   0x0000fffff7fb9ba8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb9bac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9bb0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9bb4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9bb8:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fb9bbc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9bc0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9bc4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb9bc8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb9bcc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9bd0:	d63f0200	blr	x16
   0x0000fffff7fb9bd4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb9bd8:	54001fa0	b.eq	0xfffff7fb9fcc  // b.none
   0x0000fffff7fb9bdc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb9be0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb9be4:	540004a0	b.eq	0xfffff7fb9c78  // b.none
   0x0000fffff7fb9be8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb9bec:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb9bf0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb9bf4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb9bf8:	54000400	b.eq	0xfffff7fb9c78  // b.none
   0x0000fffff7fb9bfc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb9c00:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb9c04:	36d801d1	tbz	w17, #27, 0xfffff7fb9c3c
   0x0000fffff7fb9c08:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb9c0c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb9c10:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb9c14:	54000321	b.ne	0xfffff7fb9c78  // b.any
   0x0000fffff7fb9c18:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb9c1c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb9c20:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb9c24:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb9c28:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb9c2c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb9c30:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb9c34:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb9c38:	54000209	b.ls	0xfffff7fb9c78  // b.plast
   0x0000fffff7fb9c3c:	36d8008d	tbz	w13, #27, 0xfffff7fb9c4c
   0x0000fffff7fb9c40:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb9c44:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb9c48:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb9c4c:	36d80091	tbz	w17, #27, 0xfffff7fb9c5c
   0x0000fffff7fb9c50:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb9c54:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb9c58:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb9c5c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb9c60:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb9c64:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb9c68:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb9c6c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb9c70:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb9c74:	1400000e	b	0xfffff7fb9cac
   0x0000fffff7fb9c78:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb9c7c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9c80:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9c84:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9c88:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fb9c8c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9c90:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9c94:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb9c98:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb9c9c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9ca0:	d63f0200	blr	x16
   0x0000fffff7fb9ca4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb9ca8:	54001960	b.eq	0xfffff7fb9fd4  // b.none
   0x0000fffff7fb9cac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb9cb0:	37d806a9	tbnz	w9, #27, 0xfffff7fb9d84
   0x0000fffff7fb9cb4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb9cb8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9cbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9cc0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9cc4:	540001c1	b.ne	0xfffff7fb9cfc  // b.any
   0x0000fffff7fb9cc8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb9ccc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9cd0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9cd4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9cd8:	54000121	b.ne	0xfffff7fb9cfc  // b.any
   0x0000fffff7fb9cdc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb9ce0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb9ce4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb9ce8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9cec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9cf0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb9cf4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb9cf8:	14000030	b	0xfffff7fb9db8
   0x0000fffff7fb9cfc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb9d00:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9d04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9d08:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9d0c:	54000120	b.eq	0xfffff7fb9d30  // b.none
   0x0000fffff7fb9d10:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb9d14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9d18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9d1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9d20:	54000321	b.ne	0xfffff7fb9d84  // b.any
   0x0000fffff7fb9d24:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb9d28:	9e620120	scvtf	d0, x9
   0x0000fffff7fb9d2c:	14000002	b	0xfffff7fb9d34
   0x0000fffff7fb9d30:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb9d34:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb9d38:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9d3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9d40:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9d44:	54000120	b.eq	0xfffff7fb9d68  // b.none
   0x0000fffff7fb9d48:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb9d4c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9d50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9d54:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9d58:	54000161	b.ne	0xfffff7fb9d84  // b.any
   0x0000fffff7fb9d5c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb9d60:	9e620121	scvtf	d1, x9
   0x0000fffff7fb9d64:	14000002	b	0xfffff7fb9d6c
   0x0000fffff7fb9d68:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb9d6c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb9d70:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb9d74:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9d78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9d7c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb9d80:	17ffffde	b	0xfffff7fb9cf8
   0x0000fffff7fb9d84:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb9d88:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9d8c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9d90:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9d94:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fb9d98:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9d9c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9da0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb9da4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb9da8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9dac:	d63f0200	blr	x16
   0x0000fffff7fb9db0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb9db4:	54001140	b.eq	0xfffff7fb9fdc  // b.none
   0x0000fffff7fb9db8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb9dbc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9dc0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9dc4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9dc8:	54000381	b.ne	0xfffff7fb9e38  // b.any
   0x0000fffff7fb9dcc:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7fb9dd0:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7fb9dd4:	8b0a018b	add	x11, x12, x10
   0x0000fffff7fb9dd8:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7fb9ddc:	36d80211	tbz	w17, #27, 0xfffff7fb9e1c
   0x0000fffff7fb9de0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb9de4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb9de8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb9dec:	54000261	b.ne	0xfffff7fb9e38  // b.any
   0x0000fffff7fb9df0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb9df4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb9df8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb9dfc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb9e00:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb9e04:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb9e08:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb9e0c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb9e10:	54000149	b.ls	0xfffff7fb9e38  // b.plast
   0x0000fffff7fb9e14:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb9e18:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb9e1c:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb9e20:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb9e24:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb9e28:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb9e2c:	f9002e6b	str	x11, [x19, #88]
   0x0000fffff7fb9e30:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fb9e34:	1400000e	b	0xfffff7fb9e6c
   0x0000fffff7fb9e38:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb9e3c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9e40:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9e44:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9e48:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fb9e4c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9e50:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9e54:	d2916810	mov	x16, #0x8b40                	// #35648
   0x0000fffff7fb9e58:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb9e5c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9e60:	d63f0200	blr	x16
   0x0000fffff7fb9e64:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb9e68:	54000be0	b.eq	0xfffff7fb9fe4  // b.none
   0x0000fffff7fb9e6c:	17fff8c6	b	0xfffff7fb8184
   0x0000fffff7fb9e70:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb9e74:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9e78:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9e7c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9e80:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fb9e84:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9e88:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9e8c:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7fb9e90:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb9e94:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9e98:	d63f0200	blr	x16
   0x0000fffff7fb9e9c:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb9ea0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb9ea4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb9ea8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb9eac:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fb9eb0:	d65f03c0	ret
   0x0000fffff7fb9eb4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9eb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9ebc:	b900028a	str	w10, [x20]
   0x0000fffff7fb9ec0:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fb9ec4:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb9ec8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb9ecc:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb9ed0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb9ed4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fb9ed8:	d65f03c0	ret
   0x0000fffff7fb9edc:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7fb9ee0:	17fffff5	b	0xfffff7fb9eb4
   0x0000fffff7fb9ee4:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7fb9ee8:	17fffff3	b	0xfffff7fb9eb4
   0x0000fffff7fb9eec:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fb9ef0:	17fffff1	b	0xfffff7fb9eb4
   0x0000fffff7fb9ef4:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fb9ef8:	17ffffef	b	0xfffff7fb9eb4
   0x0000fffff7fb9efc:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fb9f00:	17ffffed	b	0xfffff7fb9eb4
   0x0000fffff7fb9f04:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fb9f08:	17ffffeb	b	0xfffff7fb9eb4
   0x0000fffff7fb9f0c:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fb9f10:	17ffffe9	b	0xfffff7fb9eb4
   0x0000fffff7fb9f14:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fb9f18:	17ffffe7	b	0xfffff7fb9eb4
   0x0000fffff7fb9f1c:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fb9f20:	17ffffe5	b	0xfffff7fb9eb4
   0x0000fffff7fb9f24:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fb9f28:	17ffffe3	b	0xfffff7fb9eb4
   0x0000fffff7fb9f2c:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fb9f30:	17ffffe1	b	0xfffff7fb9eb4
   0x0000fffff7fb9f34:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fb9f38:	17ffffdf	b	0xfffff7fb9eb4
   0x0000fffff7fb9f3c:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fb9f40:	17ffffdd	b	0xfffff7fb9eb4
   0x0000fffff7fb9f44:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fb9f48:	17ffffdb	b	0xfffff7fb9eb4
   0x0000fffff7fb9f4c:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fb9f50:	17ffffd9	b	0xfffff7fb9eb4
   0x0000fffff7fb9f54:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fb9f58:	17ffffd7	b	0xfffff7fb9eb4
   0x0000fffff7fb9f5c:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fb9f60:	17ffffd5	b	0xfffff7fb9eb4
   0x0000fffff7fb9f64:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fb9f68:	17ffffd3	b	0xfffff7fb9eb4
   0x0000fffff7fb9f6c:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fb9f70:	17ffffd1	b	0xfffff7fb9eb4
   0x0000fffff7fb9f74:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fb9f78:	17ffffcf	b	0xfffff7fb9eb4
   0x0000fffff7fb9f7c:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fb9f80:	17ffffcd	b	0xfffff7fb9eb4
   0x0000fffff7fb9f84:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fb9f88:	17ffffcb	b	0xfffff7fb9eb4
   0x0000fffff7fb9f8c:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fb9f90:	17ffffc9	b	0xfffff7fb9eb4
   0x0000fffff7fb9f94:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fb9f98:	17ffffc7	b	0xfffff7fb9eb4
   0x0000fffff7fb9f9c:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fb9fa0:	17ffffc5	b	0xfffff7fb9eb4
   0x0000fffff7fb9fa4:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fb9fa8:	17ffffc3	b	0xfffff7fb9eb4
   0x0000fffff7fb9fac:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fb9fb0:	17ffffc1	b	0xfffff7fb9eb4
   0x0000fffff7fb9fb4:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fb9fb8:	17ffffbf	b	0xfffff7fb9eb4
   0x0000fffff7fb9fbc:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fb9fc0:	17ffffbd	b	0xfffff7fb9eb4
   0x0000fffff7fb9fc4:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fb9fc8:	17ffffbb	b	0xfffff7fb9eb4
   0x0000fffff7fb9fcc:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fb9fd0:	17ffffb9	b	0xfffff7fb9eb4
   0x0000fffff7fb9fd4:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fb9fd8:	17ffffb7	b	0xfffff7fb9eb4
   0x0000fffff7fb9fdc:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fb9fe0:	17ffffb5	b	0xfffff7fb9eb4
   0x0000fffff7fb9fe4:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fb9fe8:	17ffffb3	b	0xfffff7fb9eb4
   0x0000fffff7fb9fec:	00000000	udf	#0
   0x0000fffff7fb9ff0:	00000000	udf	#0
   0x0000fffff7fb9ff4:	00000000	udf	#0
   0x0000fffff7fb9ff8:	00000000	udf	#0
   0x0000fffff7fb9ffc:	00000000	udf	#0
End of assembler dump.
