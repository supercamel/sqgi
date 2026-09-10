Dump of assembler code from 0xfffff7fa8000 to 0xfffff7faa000:
   0x0000fffff7fa8000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fa8004:	910003fd	mov	x29, sp
   0x0000fffff7fa8008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fa800c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fa8010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fa8014:	aa0003f3	mov	x19, x0
   0x0000fffff7fa8018:	aa0103f4	mov	x20, x1
   0x0000fffff7fa801c:	aa0203f5	mov	x21, x2
   0x0000fffff7fa8020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fa8024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fa8028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fa802c:	f90003e9	str	x9, [sp]
   0x0000fffff7fa8030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fa8034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fa8038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fa803c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fa8040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8044:	d63f0200	blr	x16
   0x0000fffff7fa8048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fa804c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fa8050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fa8054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fa8058:	14000001	b	0xfffff7fa805c
   0x0000fffff7fa805c:	14000001	b	0xfffff7fa8060
   0x0000fffff7fa8060:	14000001	b	0xfffff7fa8064
   0x0000fffff7fa8064:	14000001	b	0xfffff7fa8068
   0x0000fffff7fa8068:	14000001	b	0xfffff7fa806c
   0x0000fffff7fa806c:	14000001	b	0xfffff7fa8070
   0x0000fffff7fa8070:	14000001	b	0xfffff7fa8074
   0x0000fffff7fa8074:	14000001	b	0xfffff7fa8078
   0x0000fffff7fa8078:	14000001	b	0xfffff7fa807c
   0x0000fffff7fa807c:	14000001	b	0xfffff7fa8080
   0x0000fffff7fa8080:	14000001	b	0xfffff7fa8084
   0x0000fffff7fa8084:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fa8088:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fa808c:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fa8090:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa8094:	36d80211	tbz	w17, #27, 0xfffff7fa80d4
   0x0000fffff7fa8098:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa809c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa80a0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa80a4:	540001e1	b.ne	0xfffff7fa80e0  // b.any
   0x0000fffff7fa80a8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa80ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa80b0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa80b4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa80b8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa80bc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa80c0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa80c4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa80c8:	540000c9	b.ls	0xfffff7fa80e0  // b.plast
   0x0000fffff7fa80cc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa80d0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa80d4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa80d8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa80dc:	1400000e	b	0xfffff7fa8114
   0x0000fffff7fa80e0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa80e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa80e8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa80ec:	aa1503e2	mov	x2, x21
   0x0000fffff7fa80f0:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fa80f4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa80f8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa80fc:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fa8100:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8104:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8108:	d63f0200	blr	x16
   0x0000fffff7fa810c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8110:	5400ede0	b.eq	0xfffff7fa9ecc  // b.none
   0x0000fffff7fa8114:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fa8118:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fa811c:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fa8120:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7fa8124:	36d80211	tbz	w17, #27, 0xfffff7fa8164
   0x0000fffff7fa8128:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa812c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8130:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa8134:	540001e1	b.ne	0xfffff7fa8170  // b.any
   0x0000fffff7fa8138:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa813c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8140:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa8144:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8148:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa814c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8150:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa8154:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8158:	540000c9	b.ls	0xfffff7fa8170  // b.plast
   0x0000fffff7fa815c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8160:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa8164:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa8168:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa816c:	1400000e	b	0xfffff7fa81a4
   0x0000fffff7fa8170:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8174:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8178:	aa1303e1	mov	x1, x19
   0x0000fffff7fa817c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8180:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fa8184:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8188:	aa1603e5	mov	x5, x22
   0x0000fffff7fa818c:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fa8190:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8194:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8198:	d63f0200	blr	x16
   0x0000fffff7fa819c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa81a0:	5400e9a0	b.eq	0xfffff7fa9ed4  // b.none
   0x0000fffff7fa81a4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa81a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa81ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa81b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa81b4:	54000421	b.ne	0xfffff7fa8238  // b.any
   0x0000fffff7fa81b8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa81bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa81c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa81c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa81c8:	54000381	b.ne	0xfffff7fa8238  // b.any
   0x0000fffff7fa81cc:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa81d0:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7fa81d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa81d8:	9a9fa7ec	cset	x12, lt	// lt = tstop
   0x0000fffff7fa81dc:	5280010d	mov	w13, #0x8                   	// #8
   0x0000fffff7fa81e0:	72a0200d	movk	w13, #0x100, lsl #16
   0x0000fffff7fa81e4:	91000580	add	x0, x12, #0x1
   0x0000fffff7fa81e8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa81ec:	36d80211	tbz	w17, #27, 0xfffff7fa822c
   0x0000fffff7fa81f0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa81f4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa81f8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa81fc:	540001e1	b.ne	0xfffff7fa8238  // b.any
   0x0000fffff7fa8200:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa8204:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8208:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa820c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8210:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8214:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8218:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa821c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8220:	540000c9	b.ls	0xfffff7fa8238  // b.plast
   0x0000fffff7fa8224:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8228:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa822c:	f9005ecc	str	x12, [x22, #184]
   0x0000fffff7fa8230:	b900b2cd	str	w13, [x22, #176]
   0x0000fffff7fa8234:	1400000e	b	0xfffff7fa826c
   0x0000fffff7fa8238:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa823c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8240:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8244:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8248:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fa824c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8250:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8254:	d2909810	mov	x16, #0x84c0                	// #33984
   0x0000fffff7fa8258:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa825c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8260:	d63f0200	blr	x16
   0x0000fffff7fa8264:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8268:	5400e3a0	b.eq	0xfffff7fa9edc  // b.none
   0x0000fffff7fa826c:	f100041f	cmp	x0, #0x1
   0x0000fffff7fa8270:	5400df80	b.eq	0xfffff7fa9e60  // b.none
   0x0000fffff7fa8274:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa8278:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa827c:	d299d20c	mov	x12, #0xce90                	// #52880
   0x0000fffff7fa8280:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa8284:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa8288:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7fa828c:	36d801d1	tbz	w17, #27, 0xfffff7fa82c4
   0x0000fffff7fa8290:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8294:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8298:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa829c:	54000281	b.ne	0xfffff7fa82ec  // b.any
   0x0000fffff7fa82a0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa82a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa82a8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa82ac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa82b0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa82b4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa82b8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa82bc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa82c0:	54000169	b.ls	0xfffff7fa82ec  // b.plast
   0x0000fffff7fa82c4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa82c8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa82cc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa82d0:	36d80091	tbz	w17, #27, 0xfffff7fa82e0
   0x0000fffff7fa82d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa82d8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa82dc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa82e0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa82e4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa82e8:	1400000e	b	0xfffff7fa8320
   0x0000fffff7fa82ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa82f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa82f4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa82f8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa82fc:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fa8300:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8304:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8308:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa830c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8310:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8314:	d63f0200	blr	x16
   0x0000fffff7fa8318:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa831c:	5400de40	b.eq	0xfffff7fa9ee4  // b.none
   0x0000fffff7fa8320:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa8324:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa8328:	540003a0	b.eq	0xfffff7fa839c  // b.none
   0x0000fffff7fa832c:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7fa8330:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7fa8334:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa8338:	36d801d1	tbz	w17, #27, 0xfffff7fa8370
   0x0000fffff7fa833c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8340:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8344:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa8348:	540002a1	b.ne	0xfffff7fa839c  // b.any
   0x0000fffff7fa834c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa8350:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8354:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa8358:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa835c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8360:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8364:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa8368:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa836c:	54000189	b.ls	0xfffff7fa839c  // b.plast
   0x0000fffff7fa8370:	36d8008d	tbz	w13, #27, 0xfffff7fa8380
   0x0000fffff7fa8374:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa8378:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa837c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa8380:	36d80091	tbz	w17, #27, 0xfffff7fa8390
   0x0000fffff7fa8384:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8388:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa838c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa8390:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa8394:	b900016d	str	w13, [x11]
   0x0000fffff7fa8398:	1400000e	b	0xfffff7fa83d0
   0x0000fffff7fa839c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa83a0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa83a4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa83a8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa83ac:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fa83b0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa83b4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa83b8:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa83bc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa83c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa83c4:	d63f0200	blr	x16
   0x0000fffff7fa83c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa83cc:	5400d900	b.eq	0xfffff7fa9eec  // b.none
   0x0000fffff7fa83d0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa83d4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa83d8:	540004a0	b.eq	0xfffff7fa846c  // b.none
   0x0000fffff7fa83dc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa83e0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa83e4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa83e8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa83ec:	54000400	b.eq	0xfffff7fa846c  // b.none
   0x0000fffff7fa83f0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa83f4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa83f8:	36d801d1	tbz	w17, #27, 0xfffff7fa8430
   0x0000fffff7fa83fc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8400:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8404:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa8408:	54000321	b.ne	0xfffff7fa846c  // b.any
   0x0000fffff7fa840c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa8410:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8414:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa8418:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa841c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8420:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8424:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa8428:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa842c:	54000209	b.ls	0xfffff7fa846c  // b.plast
   0x0000fffff7fa8430:	36d8008d	tbz	w13, #27, 0xfffff7fa8440
   0x0000fffff7fa8434:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa8438:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa843c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa8440:	36d80091	tbz	w17, #27, 0xfffff7fa8450
   0x0000fffff7fa8444:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8448:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa844c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa8450:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa8454:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa8458:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa845c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa8460:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa8464:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa8468:	1400000e	b	0xfffff7fa84a0
   0x0000fffff7fa846c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa8470:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8474:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8478:	aa1503e2	mov	x2, x21
   0x0000fffff7fa847c:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fa8480:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8484:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8488:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa848c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8490:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8494:	d63f0200	blr	x16
   0x0000fffff7fa8498:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa849c:	5400d2c0	b.eq	0xfffff7fa9ef4  // b.none
   0x0000fffff7fa84a0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa84a4:	37d806a9	tbnz	w9, #27, 0xfffff7fa8578
   0x0000fffff7fa84a8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa84ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa84b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa84b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa84b8:	540001c1	b.ne	0xfffff7fa84f0  // b.any
   0x0000fffff7fa84bc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa84c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa84c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa84c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa84cc:	54000121	b.ne	0xfffff7fa84f0  // b.any
   0x0000fffff7fa84d0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa84d4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa84d8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa84dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa84e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa84e4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa84e8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa84ec:	14000030	b	0xfffff7fa85ac
   0x0000fffff7fa84f0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa84f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa84f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa84fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8500:	54000120	b.eq	0xfffff7fa8524  // b.none
   0x0000fffff7fa8504:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa8508:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa850c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8510:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8514:	54000321	b.ne	0xfffff7fa8578  // b.any
   0x0000fffff7fa8518:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa851c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa8520:	14000002	b	0xfffff7fa8528
   0x0000fffff7fa8524:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa8528:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa852c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8530:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8534:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8538:	54000120	b.eq	0xfffff7fa855c  // b.none
   0x0000fffff7fa853c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa8540:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8544:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8548:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa854c:	54000161	b.ne	0xfffff7fa8578  // b.any
   0x0000fffff7fa8550:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa8554:	9e620121	scvtf	d1, x9
   0x0000fffff7fa8558:	14000002	b	0xfffff7fa8560
   0x0000fffff7fa855c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa8560:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa8564:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa8568:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa856c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8570:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa8574:	17ffffde	b	0xfffff7fa84ec
   0x0000fffff7fa8578:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa857c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8580:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8584:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8588:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fa858c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8590:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8594:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa8598:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa859c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa85a0:	d63f0200	blr	x16
   0x0000fffff7fa85a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa85a8:	5400caa0	b.eq	0xfffff7fa9efc  // b.none
   0x0000fffff7fa85ac:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa85b0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa85b4:	540004a0	b.eq	0xfffff7fa8648  // b.none
   0x0000fffff7fa85b8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa85bc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa85c0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa85c4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa85c8:	54000400	b.eq	0xfffff7fa8648  // b.none
   0x0000fffff7fa85cc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa85d0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa85d4:	36d801d1	tbz	w17, #27, 0xfffff7fa860c
   0x0000fffff7fa85d8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa85dc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa85e0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa85e4:	54000321	b.ne	0xfffff7fa8648  // b.any
   0x0000fffff7fa85e8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa85ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa85f0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa85f4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa85f8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa85fc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8600:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa8604:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8608:	54000209	b.ls	0xfffff7fa8648  // b.plast
   0x0000fffff7fa860c:	36d8008d	tbz	w13, #27, 0xfffff7fa861c
   0x0000fffff7fa8610:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa8614:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa8618:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa861c:	36d80091	tbz	w17, #27, 0xfffff7fa862c
   0x0000fffff7fa8620:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8624:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8628:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa862c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa8630:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa8634:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa8638:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa863c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa8640:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa8644:	1400000e	b	0xfffff7fa867c
   0x0000fffff7fa8648:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa864c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8650:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8654:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8658:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fa865c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8660:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8664:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa8668:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa866c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8670:	d63f0200	blr	x16
   0x0000fffff7fa8674:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8678:	5400c460	b.eq	0xfffff7fa9f04  // b.none
   0x0000fffff7fa867c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa8680:	37d806a9	tbnz	w9, #27, 0xfffff7fa8754
   0x0000fffff7fa8684:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa8688:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa868c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8690:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8694:	540001c1	b.ne	0xfffff7fa86cc  // b.any
   0x0000fffff7fa8698:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa869c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa86a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa86a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa86a8:	54000121	b.ne	0xfffff7fa86cc  // b.any
   0x0000fffff7fa86ac:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa86b0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa86b4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa86b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa86bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa86c0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa86c4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa86c8:	14000030	b	0xfffff7fa8788
   0x0000fffff7fa86cc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa86d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa86d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa86d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa86dc:	54000120	b.eq	0xfffff7fa8700  // b.none
   0x0000fffff7fa86e0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa86e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa86e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa86ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa86f0:	54000321	b.ne	0xfffff7fa8754  // b.any
   0x0000fffff7fa86f4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa86f8:	9e620120	scvtf	d0, x9
   0x0000fffff7fa86fc:	14000002	b	0xfffff7fa8704
   0x0000fffff7fa8700:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa8704:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa8708:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa870c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8710:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8714:	54000120	b.eq	0xfffff7fa8738  // b.none
   0x0000fffff7fa8718:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa871c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8720:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8724:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8728:	54000161	b.ne	0xfffff7fa8754  // b.any
   0x0000fffff7fa872c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa8730:	9e620121	scvtf	d1, x9
   0x0000fffff7fa8734:	14000002	b	0xfffff7fa873c
   0x0000fffff7fa8738:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa873c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa8740:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa8744:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8748:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa874c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa8750:	17ffffde	b	0xfffff7fa86c8
   0x0000fffff7fa8754:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8758:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa875c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8760:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8764:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fa8768:	aa1403e4	mov	x4, x20
   0x0000fffff7fa876c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8770:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa8774:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8778:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa877c:	d63f0200	blr	x16
   0x0000fffff7fa8780:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8784:	5400bc40	b.eq	0xfffff7fa9f0c  // b.none
   0x0000fffff7fa8788:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa878c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa8790:	540004a0	b.eq	0xfffff7fa8824  // b.none
   0x0000fffff7fa8794:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa8798:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa879c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa87a0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa87a4:	54000400	b.eq	0xfffff7fa8824  // b.none
   0x0000fffff7fa87a8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa87ac:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa87b0:	36d801d1	tbz	w17, #27, 0xfffff7fa87e8
   0x0000fffff7fa87b4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa87b8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa87bc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa87c0:	54000321	b.ne	0xfffff7fa8824  // b.any
   0x0000fffff7fa87c4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa87c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa87cc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa87d0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa87d4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa87d8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa87dc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa87e0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa87e4:	54000209	b.ls	0xfffff7fa8824  // b.plast
   0x0000fffff7fa87e8:	36d8008d	tbz	w13, #27, 0xfffff7fa87f8
   0x0000fffff7fa87ec:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa87f0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa87f4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa87f8:	36d80091	tbz	w17, #27, 0xfffff7fa8808
   0x0000fffff7fa87fc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8800:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8804:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa8808:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa880c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa8810:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa8814:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa8818:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa881c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa8820:	1400000e	b	0xfffff7fa8858
   0x0000fffff7fa8824:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa8828:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa882c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8830:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8834:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fa8838:	aa1403e4	mov	x4, x20
   0x0000fffff7fa883c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8840:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa8844:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8848:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa884c:	d63f0200	blr	x16
   0x0000fffff7fa8850:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8854:	5400b600	b.eq	0xfffff7fa9f14  // b.none
   0x0000fffff7fa8858:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa885c:	37d806a9	tbnz	w9, #27, 0xfffff7fa8930
   0x0000fffff7fa8860:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa8864:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8868:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa886c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8870:	540001c1	b.ne	0xfffff7fa88a8  // b.any
   0x0000fffff7fa8874:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa8878:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa887c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8880:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8884:	54000121	b.ne	0xfffff7fa88a8  // b.any
   0x0000fffff7fa8888:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa888c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa8890:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa8894:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8898:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa889c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa88a0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa88a4:	14000030	b	0xfffff7fa8964
   0x0000fffff7fa88a8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa88ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa88b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa88b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa88b8:	54000120	b.eq	0xfffff7fa88dc  // b.none
   0x0000fffff7fa88bc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa88c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa88c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa88c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa88cc:	54000321	b.ne	0xfffff7fa8930  // b.any
   0x0000fffff7fa88d0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa88d4:	9e620120	scvtf	d0, x9
   0x0000fffff7fa88d8:	14000002	b	0xfffff7fa88e0
   0x0000fffff7fa88dc:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa88e0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa88e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa88e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa88ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa88f0:	54000120	b.eq	0xfffff7fa8914  // b.none
   0x0000fffff7fa88f4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa88f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa88fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8900:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8904:	54000161	b.ne	0xfffff7fa8930  // b.any
   0x0000fffff7fa8908:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa890c:	9e620121	scvtf	d1, x9
   0x0000fffff7fa8910:	14000002	b	0xfffff7fa8918
   0x0000fffff7fa8914:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa8918:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa891c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa8920:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8924:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8928:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa892c:	17ffffde	b	0xfffff7fa88a4
   0x0000fffff7fa8930:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8934:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8938:	aa1303e1	mov	x1, x19
   0x0000fffff7fa893c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8940:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fa8944:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8948:	aa1603e5	mov	x5, x22
   0x0000fffff7fa894c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa8950:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8954:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8958:	d63f0200	blr	x16
   0x0000fffff7fa895c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8960:	5400ade0	b.eq	0xfffff7fa9f1c  // b.none
   0x0000fffff7fa8964:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa8968:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa896c:	540004a0	b.eq	0xfffff7fa8a00  // b.none
   0x0000fffff7fa8970:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa8974:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa8978:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa897c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa8980:	54000400	b.eq	0xfffff7fa8a00  // b.none
   0x0000fffff7fa8984:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa8988:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa898c:	36d801d1	tbz	w17, #27, 0xfffff7fa89c4
   0x0000fffff7fa8990:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8994:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8998:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa899c:	54000321	b.ne	0xfffff7fa8a00  // b.any
   0x0000fffff7fa89a0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa89a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa89a8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa89ac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa89b0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa89b4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa89b8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa89bc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa89c0:	54000209	b.ls	0xfffff7fa8a00  // b.plast
   0x0000fffff7fa89c4:	36d8008d	tbz	w13, #27, 0xfffff7fa89d4
   0x0000fffff7fa89c8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa89cc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa89d0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa89d4:	36d80091	tbz	w17, #27, 0xfffff7fa89e4
   0x0000fffff7fa89d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa89dc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa89e0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa89e4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa89e8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa89ec:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa89f0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa89f4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa89f8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa89fc:	1400000e	b	0xfffff7fa8a34
   0x0000fffff7fa8a00:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa8a04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8a08:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8a0c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8a10:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fa8a14:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8a18:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8a1c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa8a20:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8a24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8a28:	d63f0200	blr	x16
   0x0000fffff7fa8a2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8a30:	5400a7a0	b.eq	0xfffff7fa9f24  // b.none
   0x0000fffff7fa8a34:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa8a38:	37d806a9	tbnz	w9, #27, 0xfffff7fa8b0c
   0x0000fffff7fa8a3c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa8a40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8a44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8a48:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8a4c:	540001c1	b.ne	0xfffff7fa8a84  // b.any
   0x0000fffff7fa8a50:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa8a54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8a58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8a5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8a60:	54000121	b.ne	0xfffff7fa8a84  // b.any
   0x0000fffff7fa8a64:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa8a68:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa8a6c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa8a70:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8a74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8a78:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa8a7c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa8a80:	14000030	b	0xfffff7fa8b40
   0x0000fffff7fa8a84:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa8a88:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8a8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8a90:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8a94:	54000120	b.eq	0xfffff7fa8ab8  // b.none
   0x0000fffff7fa8a98:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa8a9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8aa0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8aa4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8aa8:	54000321	b.ne	0xfffff7fa8b0c  // b.any
   0x0000fffff7fa8aac:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa8ab0:	9e620120	scvtf	d0, x9
   0x0000fffff7fa8ab4:	14000002	b	0xfffff7fa8abc
   0x0000fffff7fa8ab8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa8abc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa8ac0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8ac4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8ac8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8acc:	54000120	b.eq	0xfffff7fa8af0  // b.none
   0x0000fffff7fa8ad0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa8ad4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8ad8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8adc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8ae0:	54000161	b.ne	0xfffff7fa8b0c  // b.any
   0x0000fffff7fa8ae4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa8ae8:	9e620121	scvtf	d1, x9
   0x0000fffff7fa8aec:	14000002	b	0xfffff7fa8af4
   0x0000fffff7fa8af0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa8af4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa8af8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa8afc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8b00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8b04:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa8b08:	17ffffde	b	0xfffff7fa8a80
   0x0000fffff7fa8b0c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8b10:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8b14:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8b18:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8b1c:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fa8b20:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8b24:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8b28:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa8b2c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8b30:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8b34:	d63f0200	blr	x16
   0x0000fffff7fa8b38:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8b3c:	54009f80	b.eq	0xfffff7fa9f2c  // b.none
   0x0000fffff7fa8b40:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa8b44:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa8b48:	540004a0	b.eq	0xfffff7fa8bdc  // b.none
   0x0000fffff7fa8b4c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa8b50:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa8b54:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa8b58:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa8b5c:	54000400	b.eq	0xfffff7fa8bdc  // b.none
   0x0000fffff7fa8b60:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa8b64:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa8b68:	36d801d1	tbz	w17, #27, 0xfffff7fa8ba0
   0x0000fffff7fa8b6c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8b70:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8b74:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa8b78:	54000321	b.ne	0xfffff7fa8bdc  // b.any
   0x0000fffff7fa8b7c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa8b80:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8b84:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa8b88:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8b8c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8b90:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8b94:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa8b98:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8b9c:	54000209	b.ls	0xfffff7fa8bdc  // b.plast
   0x0000fffff7fa8ba0:	36d8008d	tbz	w13, #27, 0xfffff7fa8bb0
   0x0000fffff7fa8ba4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa8ba8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa8bac:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa8bb0:	36d80091	tbz	w17, #27, 0xfffff7fa8bc0
   0x0000fffff7fa8bb4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8bb8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8bbc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa8bc0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa8bc4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa8bc8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa8bcc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa8bd0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa8bd4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa8bd8:	1400000e	b	0xfffff7fa8c10
   0x0000fffff7fa8bdc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa8be0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8be4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8be8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8bec:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fa8bf0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8bf4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8bf8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa8bfc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8c00:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8c04:	d63f0200	blr	x16
   0x0000fffff7fa8c08:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8c0c:	54009940	b.eq	0xfffff7fa9f34  // b.none
   0x0000fffff7fa8c10:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa8c14:	37d806a9	tbnz	w9, #27, 0xfffff7fa8ce8
   0x0000fffff7fa8c18:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa8c1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8c20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8c24:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8c28:	540001c1	b.ne	0xfffff7fa8c60  // b.any
   0x0000fffff7fa8c2c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa8c30:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8c34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8c38:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8c3c:	54000121	b.ne	0xfffff7fa8c60  // b.any
   0x0000fffff7fa8c40:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa8c44:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa8c48:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa8c4c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8c50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8c54:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa8c58:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa8c5c:	14000030	b	0xfffff7fa8d1c
   0x0000fffff7fa8c60:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa8c64:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8c68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8c6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8c70:	54000120	b.eq	0xfffff7fa8c94  // b.none
   0x0000fffff7fa8c74:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa8c78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8c7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8c80:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8c84:	54000321	b.ne	0xfffff7fa8ce8  // b.any
   0x0000fffff7fa8c88:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa8c8c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa8c90:	14000002	b	0xfffff7fa8c98
   0x0000fffff7fa8c94:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa8c98:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa8c9c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8ca0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8ca4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8ca8:	54000120	b.eq	0xfffff7fa8ccc  // b.none
   0x0000fffff7fa8cac:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa8cb0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8cb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8cb8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8cbc:	54000161	b.ne	0xfffff7fa8ce8  // b.any
   0x0000fffff7fa8cc0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa8cc4:	9e620121	scvtf	d1, x9
   0x0000fffff7fa8cc8:	14000002	b	0xfffff7fa8cd0
   0x0000fffff7fa8ccc:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa8cd0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa8cd4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa8cd8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8cdc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8ce0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa8ce4:	17ffffde	b	0xfffff7fa8c5c
   0x0000fffff7fa8ce8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8cec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8cf0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8cf4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8cf8:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fa8cfc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8d00:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8d04:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa8d08:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8d0c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8d10:	d63f0200	blr	x16
   0x0000fffff7fa8d14:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8d18:	54009120	b.eq	0xfffff7fa9f3c  // b.none
   0x0000fffff7fa8d1c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa8d20:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa8d24:	540004a0	b.eq	0xfffff7fa8db8  // b.none
   0x0000fffff7fa8d28:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa8d2c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa8d30:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa8d34:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa8d38:	54000400	b.eq	0xfffff7fa8db8  // b.none
   0x0000fffff7fa8d3c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa8d40:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa8d44:	36d801d1	tbz	w17, #27, 0xfffff7fa8d7c
   0x0000fffff7fa8d48:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8d4c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8d50:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa8d54:	54000321	b.ne	0xfffff7fa8db8  // b.any
   0x0000fffff7fa8d58:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa8d5c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8d60:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa8d64:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8d68:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8d6c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8d70:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa8d74:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8d78:	54000209	b.ls	0xfffff7fa8db8  // b.plast
   0x0000fffff7fa8d7c:	36d8008d	tbz	w13, #27, 0xfffff7fa8d8c
   0x0000fffff7fa8d80:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa8d84:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa8d88:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa8d8c:	36d80091	tbz	w17, #27, 0xfffff7fa8d9c
   0x0000fffff7fa8d90:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8d94:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8d98:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa8d9c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa8da0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa8da4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa8da8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa8dac:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa8db0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa8db4:	1400000e	b	0xfffff7fa8dec
   0x0000fffff7fa8db8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa8dbc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8dc0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8dc4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8dc8:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fa8dcc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8dd0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8dd4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa8dd8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8ddc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8de0:	d63f0200	blr	x16
   0x0000fffff7fa8de4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8de8:	54008ae0	b.eq	0xfffff7fa9f44  // b.none
   0x0000fffff7fa8dec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa8df0:	37d806a9	tbnz	w9, #27, 0xfffff7fa8ec4
   0x0000fffff7fa8df4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa8df8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8dfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8e00:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8e04:	540001c1	b.ne	0xfffff7fa8e3c  // b.any
   0x0000fffff7fa8e08:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa8e0c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8e10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8e14:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8e18:	54000121	b.ne	0xfffff7fa8e3c  // b.any
   0x0000fffff7fa8e1c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa8e20:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa8e24:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa8e28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8e2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8e30:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa8e34:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa8e38:	14000030	b	0xfffff7fa8ef8
   0x0000fffff7fa8e3c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa8e40:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8e44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8e48:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8e4c:	54000120	b.eq	0xfffff7fa8e70  // b.none
   0x0000fffff7fa8e50:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa8e54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8e58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8e5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8e60:	54000321	b.ne	0xfffff7fa8ec4  // b.any
   0x0000fffff7fa8e64:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa8e68:	9e620120	scvtf	d0, x9
   0x0000fffff7fa8e6c:	14000002	b	0xfffff7fa8e74
   0x0000fffff7fa8e70:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa8e74:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa8e78:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8e7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8e80:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8e84:	54000120	b.eq	0xfffff7fa8ea8  // b.none
   0x0000fffff7fa8e88:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa8e8c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8e90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8e94:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8e98:	54000161	b.ne	0xfffff7fa8ec4  // b.any
   0x0000fffff7fa8e9c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa8ea0:	9e620121	scvtf	d1, x9
   0x0000fffff7fa8ea4:	14000002	b	0xfffff7fa8eac
   0x0000fffff7fa8ea8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa8eac:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa8eb0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa8eb4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8eb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8ebc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa8ec0:	17ffffde	b	0xfffff7fa8e38
   0x0000fffff7fa8ec4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8ec8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8ecc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8ed0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8ed4:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fa8ed8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8edc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8ee0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa8ee4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8ee8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8eec:	d63f0200	blr	x16
   0x0000fffff7fa8ef0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8ef4:	540082c0	b.eq	0xfffff7fa9f4c  // b.none
   0x0000fffff7fa8ef8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa8efc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa8f00:	540004a0	b.eq	0xfffff7fa8f94  // b.none
   0x0000fffff7fa8f04:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa8f08:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa8f0c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa8f10:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa8f14:	54000400	b.eq	0xfffff7fa8f94  // b.none
   0x0000fffff7fa8f18:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa8f1c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa8f20:	36d801d1	tbz	w17, #27, 0xfffff7fa8f58
   0x0000fffff7fa8f24:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8f28:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8f2c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa8f30:	54000321	b.ne	0xfffff7fa8f94  // b.any
   0x0000fffff7fa8f34:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa8f38:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8f3c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa8f40:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8f44:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8f48:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8f4c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa8f50:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8f54:	54000209	b.ls	0xfffff7fa8f94  // b.plast
   0x0000fffff7fa8f58:	36d8008d	tbz	w13, #27, 0xfffff7fa8f68
   0x0000fffff7fa8f5c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa8f60:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa8f64:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa8f68:	36d80091	tbz	w17, #27, 0xfffff7fa8f78
   0x0000fffff7fa8f6c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8f70:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8f74:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa8f78:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa8f7c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa8f80:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa8f84:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa8f88:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa8f8c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa8f90:	1400000e	b	0xfffff7fa8fc8
   0x0000fffff7fa8f94:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa8f98:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8f9c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8fa0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8fa4:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fa8fa8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8fac:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8fb0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa8fb4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8fb8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8fbc:	d63f0200	blr	x16
   0x0000fffff7fa8fc0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8fc4:	54007c80	b.eq	0xfffff7fa9f54  // b.none
   0x0000fffff7fa8fc8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa8fcc:	37d806a9	tbnz	w9, #27, 0xfffff7fa90a0
   0x0000fffff7fa8fd0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa8fd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8fd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8fdc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8fe0:	540001c1	b.ne	0xfffff7fa9018  // b.any
   0x0000fffff7fa8fe4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa8fe8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8fec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8ff0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8ff4:	54000121	b.ne	0xfffff7fa9018  // b.any
   0x0000fffff7fa8ff8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa8ffc:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa9000:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa9004:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9008:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa900c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa9010:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa9014:	14000030	b	0xfffff7fa90d4
   0x0000fffff7fa9018:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa901c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9020:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9024:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9028:	54000120	b.eq	0xfffff7fa904c  // b.none
   0x0000fffff7fa902c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa9030:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9034:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9038:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa903c:	54000321	b.ne	0xfffff7fa90a0  // b.any
   0x0000fffff7fa9040:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa9044:	9e620120	scvtf	d0, x9
   0x0000fffff7fa9048:	14000002	b	0xfffff7fa9050
   0x0000fffff7fa904c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa9050:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa9054:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9058:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa905c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9060:	54000120	b.eq	0xfffff7fa9084  // b.none
   0x0000fffff7fa9064:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa9068:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa906c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9070:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9074:	54000161	b.ne	0xfffff7fa90a0  // b.any
   0x0000fffff7fa9078:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa907c:	9e620121	scvtf	d1, x9
   0x0000fffff7fa9080:	14000002	b	0xfffff7fa9088
   0x0000fffff7fa9084:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa9088:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa908c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa9090:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9094:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9098:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa909c:	17ffffde	b	0xfffff7fa9014
   0x0000fffff7fa90a0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa90a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa90a8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa90ac:	aa1503e2	mov	x2, x21
   0x0000fffff7fa90b0:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fa90b4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa90b8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa90bc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa90c0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa90c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa90c8:	d63f0200	blr	x16
   0x0000fffff7fa90cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa90d0:	54007460	b.eq	0xfffff7fa9f5c  // b.none
   0x0000fffff7fa90d4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa90d8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa90dc:	540004a0	b.eq	0xfffff7fa9170  // b.none
   0x0000fffff7fa90e0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa90e4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa90e8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa90ec:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa90f0:	54000400	b.eq	0xfffff7fa9170  // b.none
   0x0000fffff7fa90f4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa90f8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa90fc:	36d801d1	tbz	w17, #27, 0xfffff7fa9134
   0x0000fffff7fa9100:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa9104:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa9108:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa910c:	54000321	b.ne	0xfffff7fa9170  // b.any
   0x0000fffff7fa9110:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa9114:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9118:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa911c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa9120:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9124:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa9128:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa912c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa9130:	54000209	b.ls	0xfffff7fa9170  // b.plast
   0x0000fffff7fa9134:	36d8008d	tbz	w13, #27, 0xfffff7fa9144
   0x0000fffff7fa9138:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa913c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa9140:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa9144:	36d80091	tbz	w17, #27, 0xfffff7fa9154
   0x0000fffff7fa9148:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa914c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa9150:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa9154:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa9158:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa915c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa9160:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa9164:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa9168:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa916c:	1400000e	b	0xfffff7fa91a4
   0x0000fffff7fa9170:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa9174:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9178:	aa1303e1	mov	x1, x19
   0x0000fffff7fa917c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9180:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fa9184:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9188:	aa1603e5	mov	x5, x22
   0x0000fffff7fa918c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa9190:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9194:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9198:	d63f0200	blr	x16
   0x0000fffff7fa919c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa91a0:	54006e20	b.eq	0xfffff7fa9f64  // b.none
   0x0000fffff7fa91a4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa91a8:	37d806a9	tbnz	w9, #27, 0xfffff7fa927c
   0x0000fffff7fa91ac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa91b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa91b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa91b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa91bc:	540001c1	b.ne	0xfffff7fa91f4  // b.any
   0x0000fffff7fa91c0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa91c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa91c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa91cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa91d0:	54000121	b.ne	0xfffff7fa91f4  // b.any
   0x0000fffff7fa91d4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa91d8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa91dc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa91e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa91e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa91e8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa91ec:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa91f0:	14000030	b	0xfffff7fa92b0
   0x0000fffff7fa91f4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa91f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa91fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9200:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9204:	54000120	b.eq	0xfffff7fa9228  // b.none
   0x0000fffff7fa9208:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa920c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9210:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9214:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9218:	54000321	b.ne	0xfffff7fa927c  // b.any
   0x0000fffff7fa921c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa9220:	9e620120	scvtf	d0, x9
   0x0000fffff7fa9224:	14000002	b	0xfffff7fa922c
   0x0000fffff7fa9228:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa922c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa9230:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9234:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9238:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa923c:	54000120	b.eq	0xfffff7fa9260  // b.none
   0x0000fffff7fa9240:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa9244:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9248:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa924c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9250:	54000161	b.ne	0xfffff7fa927c  // b.any
   0x0000fffff7fa9254:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa9258:	9e620121	scvtf	d1, x9
   0x0000fffff7fa925c:	14000002	b	0xfffff7fa9264
   0x0000fffff7fa9260:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa9264:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa9268:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa926c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9270:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9274:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa9278:	17ffffde	b	0xfffff7fa91f0
   0x0000fffff7fa927c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9280:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9284:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9288:	aa1503e2	mov	x2, x21
   0x0000fffff7fa928c:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fa9290:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9294:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9298:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa929c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa92a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa92a4:	d63f0200	blr	x16
   0x0000fffff7fa92a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa92ac:	54006600	b.eq	0xfffff7fa9f6c  // b.none
   0x0000fffff7fa92b0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa92b4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa92b8:	540004a0	b.eq	0xfffff7fa934c  // b.none
   0x0000fffff7fa92bc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa92c0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa92c4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa92c8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa92cc:	54000400	b.eq	0xfffff7fa934c  // b.none
   0x0000fffff7fa92d0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa92d4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa92d8:	36d801d1	tbz	w17, #27, 0xfffff7fa9310
   0x0000fffff7fa92dc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa92e0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa92e4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa92e8:	54000321	b.ne	0xfffff7fa934c  // b.any
   0x0000fffff7fa92ec:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa92f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa92f4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa92f8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa92fc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9300:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa9304:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa9308:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa930c:	54000209	b.ls	0xfffff7fa934c  // b.plast
   0x0000fffff7fa9310:	36d8008d	tbz	w13, #27, 0xfffff7fa9320
   0x0000fffff7fa9314:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa9318:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa931c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa9320:	36d80091	tbz	w17, #27, 0xfffff7fa9330
   0x0000fffff7fa9324:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9328:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa932c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa9330:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa9334:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa9338:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa933c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa9340:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa9344:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa9348:	1400000e	b	0xfffff7fa9380
   0x0000fffff7fa934c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa9350:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9354:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9358:	aa1503e2	mov	x2, x21
   0x0000fffff7fa935c:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fa9360:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9364:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9368:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa936c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9370:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9374:	d63f0200	blr	x16
   0x0000fffff7fa9378:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa937c:	54005fc0	b.eq	0xfffff7fa9f74  // b.none
   0x0000fffff7fa9380:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa9384:	37d806a9	tbnz	w9, #27, 0xfffff7fa9458
   0x0000fffff7fa9388:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa938c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9390:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9394:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9398:	540001c1	b.ne	0xfffff7fa93d0  // b.any
   0x0000fffff7fa939c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa93a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa93a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa93a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa93ac:	54000121	b.ne	0xfffff7fa93d0  // b.any
   0x0000fffff7fa93b0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa93b4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa93b8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa93bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa93c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa93c4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa93c8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa93cc:	14000030	b	0xfffff7fa948c
   0x0000fffff7fa93d0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa93d4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa93d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa93dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa93e0:	54000120	b.eq	0xfffff7fa9404  // b.none
   0x0000fffff7fa93e4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa93e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa93ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa93f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa93f4:	54000321	b.ne	0xfffff7fa9458  // b.any
   0x0000fffff7fa93f8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa93fc:	9e620120	scvtf	d0, x9
   0x0000fffff7fa9400:	14000002	b	0xfffff7fa9408
   0x0000fffff7fa9404:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa9408:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa940c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9410:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9414:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9418:	54000120	b.eq	0xfffff7fa943c  // b.none
   0x0000fffff7fa941c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa9420:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9424:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9428:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa942c:	54000161	b.ne	0xfffff7fa9458  // b.any
   0x0000fffff7fa9430:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa9434:	9e620121	scvtf	d1, x9
   0x0000fffff7fa9438:	14000002	b	0xfffff7fa9440
   0x0000fffff7fa943c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa9440:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa9444:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa9448:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa944c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9450:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa9454:	17ffffde	b	0xfffff7fa93cc
   0x0000fffff7fa9458:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa945c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9460:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9464:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9468:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fa946c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9470:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9474:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa9478:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa947c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9480:	d63f0200	blr	x16
   0x0000fffff7fa9484:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9488:	540057a0	b.eq	0xfffff7fa9f7c  // b.none
   0x0000fffff7fa948c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa9490:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa9494:	540004a0	b.eq	0xfffff7fa9528  // b.none
   0x0000fffff7fa9498:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa949c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa94a0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa94a4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa94a8:	54000400	b.eq	0xfffff7fa9528  // b.none
   0x0000fffff7fa94ac:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa94b0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa94b4:	36d801d1	tbz	w17, #27, 0xfffff7fa94ec
   0x0000fffff7fa94b8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa94bc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa94c0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa94c4:	54000321	b.ne	0xfffff7fa9528  // b.any
   0x0000fffff7fa94c8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa94cc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa94d0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa94d4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa94d8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa94dc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa94e0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa94e4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa94e8:	54000209	b.ls	0xfffff7fa9528  // b.plast
   0x0000fffff7fa94ec:	36d8008d	tbz	w13, #27, 0xfffff7fa94fc
   0x0000fffff7fa94f0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa94f4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa94f8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa94fc:	36d80091	tbz	w17, #27, 0xfffff7fa950c
   0x0000fffff7fa9500:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9504:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa9508:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa950c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa9510:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa9514:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa9518:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa951c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa9520:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa9524:	1400000e	b	0xfffff7fa955c
   0x0000fffff7fa9528:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa952c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9530:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9534:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9538:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fa953c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9540:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9544:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa9548:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa954c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9550:	d63f0200	blr	x16
   0x0000fffff7fa9554:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9558:	54005160	b.eq	0xfffff7fa9f84  // b.none
   0x0000fffff7fa955c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa9560:	37d806a9	tbnz	w9, #27, 0xfffff7fa9634
   0x0000fffff7fa9564:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa9568:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa956c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9570:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9574:	540001c1	b.ne	0xfffff7fa95ac  // b.any
   0x0000fffff7fa9578:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa957c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9580:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9584:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9588:	54000121	b.ne	0xfffff7fa95ac  // b.any
   0x0000fffff7fa958c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa9590:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa9594:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa9598:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa959c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa95a0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa95a4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa95a8:	14000030	b	0xfffff7fa9668
   0x0000fffff7fa95ac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa95b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa95b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa95b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa95bc:	54000120	b.eq	0xfffff7fa95e0  // b.none
   0x0000fffff7fa95c0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa95c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa95c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa95cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa95d0:	54000321	b.ne	0xfffff7fa9634  // b.any
   0x0000fffff7fa95d4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa95d8:	9e620120	scvtf	d0, x9
   0x0000fffff7fa95dc:	14000002	b	0xfffff7fa95e4
   0x0000fffff7fa95e0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa95e4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa95e8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa95ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa95f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa95f4:	54000120	b.eq	0xfffff7fa9618  // b.none
   0x0000fffff7fa95f8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa95fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9600:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9604:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9608:	54000161	b.ne	0xfffff7fa9634  // b.any
   0x0000fffff7fa960c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa9610:	9e620121	scvtf	d1, x9
   0x0000fffff7fa9614:	14000002	b	0xfffff7fa961c
   0x0000fffff7fa9618:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa961c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa9620:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa9624:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9628:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa962c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa9630:	17ffffde	b	0xfffff7fa95a8
   0x0000fffff7fa9634:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9638:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa963c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9640:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9644:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fa9648:	aa1403e4	mov	x4, x20
   0x0000fffff7fa964c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9650:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa9654:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9658:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa965c:	d63f0200	blr	x16
   0x0000fffff7fa9660:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9664:	54004940	b.eq	0xfffff7fa9f8c  // b.none
   0x0000fffff7fa9668:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa966c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa9670:	540004a0	b.eq	0xfffff7fa9704  // b.none
   0x0000fffff7fa9674:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa9678:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa967c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa9680:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa9684:	54000400	b.eq	0xfffff7fa9704  // b.none
   0x0000fffff7fa9688:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa968c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa9690:	36d801d1	tbz	w17, #27, 0xfffff7fa96c8
   0x0000fffff7fa9694:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa9698:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa969c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa96a0:	54000321	b.ne	0xfffff7fa9704  // b.any
   0x0000fffff7fa96a4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa96a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa96ac:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa96b0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa96b4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa96b8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa96bc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa96c0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa96c4:	54000209	b.ls	0xfffff7fa9704  // b.plast
   0x0000fffff7fa96c8:	36d8008d	tbz	w13, #27, 0xfffff7fa96d8
   0x0000fffff7fa96cc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa96d0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa96d4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa96d8:	36d80091	tbz	w17, #27, 0xfffff7fa96e8
   0x0000fffff7fa96dc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa96e0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa96e4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa96e8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa96ec:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa96f0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa96f4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa96f8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa96fc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa9700:	1400000e	b	0xfffff7fa9738
   0x0000fffff7fa9704:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa9708:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa970c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9710:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9714:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fa9718:	aa1403e4	mov	x4, x20
   0x0000fffff7fa971c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9720:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa9724:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9728:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa972c:	d63f0200	blr	x16
   0x0000fffff7fa9730:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9734:	54004300	b.eq	0xfffff7fa9f94  // b.none
   0x0000fffff7fa9738:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa973c:	37d806a9	tbnz	w9, #27, 0xfffff7fa9810
   0x0000fffff7fa9740:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa9744:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9748:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa974c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9750:	540001c1	b.ne	0xfffff7fa9788  // b.any
   0x0000fffff7fa9754:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa9758:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa975c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9760:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9764:	54000121	b.ne	0xfffff7fa9788  // b.any
   0x0000fffff7fa9768:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa976c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa9770:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa9774:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9778:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa977c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa9780:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa9784:	14000030	b	0xfffff7fa9844
   0x0000fffff7fa9788:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa978c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9790:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9794:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9798:	54000120	b.eq	0xfffff7fa97bc  // b.none
   0x0000fffff7fa979c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa97a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa97a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa97a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa97ac:	54000321	b.ne	0xfffff7fa9810  // b.any
   0x0000fffff7fa97b0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa97b4:	9e620120	scvtf	d0, x9
   0x0000fffff7fa97b8:	14000002	b	0xfffff7fa97c0
   0x0000fffff7fa97bc:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa97c0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa97c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa97c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa97cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa97d0:	54000120	b.eq	0xfffff7fa97f4  // b.none
   0x0000fffff7fa97d4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa97d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa97dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa97e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa97e4:	54000161	b.ne	0xfffff7fa9810  // b.any
   0x0000fffff7fa97e8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa97ec:	9e620121	scvtf	d1, x9
   0x0000fffff7fa97f0:	14000002	b	0xfffff7fa97f8
   0x0000fffff7fa97f4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa97f8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa97fc:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa9800:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9804:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9808:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa980c:	17ffffde	b	0xfffff7fa9784
   0x0000fffff7fa9810:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9814:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9818:	aa1303e1	mov	x1, x19
   0x0000fffff7fa981c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9820:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fa9824:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9828:	aa1603e5	mov	x5, x22
   0x0000fffff7fa982c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa9830:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9834:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9838:	d63f0200	blr	x16
   0x0000fffff7fa983c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9840:	54003ae0	b.eq	0xfffff7fa9f9c  // b.none
   0x0000fffff7fa9844:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa9848:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa984c:	540004a0	b.eq	0xfffff7fa98e0  // b.none
   0x0000fffff7fa9850:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa9854:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa9858:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa985c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa9860:	54000400	b.eq	0xfffff7fa98e0  // b.none
   0x0000fffff7fa9864:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa9868:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa986c:	36d801d1	tbz	w17, #27, 0xfffff7fa98a4
   0x0000fffff7fa9870:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa9874:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa9878:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa987c:	54000321	b.ne	0xfffff7fa98e0  // b.any
   0x0000fffff7fa9880:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa9884:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9888:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa988c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa9890:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9894:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa9898:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa989c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa98a0:	54000209	b.ls	0xfffff7fa98e0  // b.plast
   0x0000fffff7fa98a4:	36d8008d	tbz	w13, #27, 0xfffff7fa98b4
   0x0000fffff7fa98a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa98ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa98b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa98b4:	36d80091	tbz	w17, #27, 0xfffff7fa98c4
   0x0000fffff7fa98b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa98bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa98c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa98c4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa98c8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa98cc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa98d0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa98d4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa98d8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa98dc:	1400000e	b	0xfffff7fa9914
   0x0000fffff7fa98e0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa98e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa98e8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa98ec:	aa1503e2	mov	x2, x21
   0x0000fffff7fa98f0:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fa98f4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa98f8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa98fc:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa9900:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9904:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9908:	d63f0200	blr	x16
   0x0000fffff7fa990c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9910:	540034a0	b.eq	0xfffff7fa9fa4  // b.none
   0x0000fffff7fa9914:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa9918:	37d806a9	tbnz	w9, #27, 0xfffff7fa99ec
   0x0000fffff7fa991c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa9920:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9924:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9928:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa992c:	540001c1	b.ne	0xfffff7fa9964  // b.any
   0x0000fffff7fa9930:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa9934:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9938:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa993c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9940:	54000121	b.ne	0xfffff7fa9964  // b.any
   0x0000fffff7fa9944:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa9948:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa994c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa9950:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9954:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9958:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa995c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa9960:	14000030	b	0xfffff7fa9a20
   0x0000fffff7fa9964:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa9968:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa996c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9970:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9974:	54000120	b.eq	0xfffff7fa9998  // b.none
   0x0000fffff7fa9978:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa997c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9980:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9984:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9988:	54000321	b.ne	0xfffff7fa99ec  // b.any
   0x0000fffff7fa998c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa9990:	9e620120	scvtf	d0, x9
   0x0000fffff7fa9994:	14000002	b	0xfffff7fa999c
   0x0000fffff7fa9998:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa999c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa99a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa99a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa99a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa99ac:	54000120	b.eq	0xfffff7fa99d0  // b.none
   0x0000fffff7fa99b0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa99b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa99b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa99bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa99c0:	54000161	b.ne	0xfffff7fa99ec  // b.any
   0x0000fffff7fa99c4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa99c8:	9e620121	scvtf	d1, x9
   0x0000fffff7fa99cc:	14000002	b	0xfffff7fa99d4
   0x0000fffff7fa99d0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa99d4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa99d8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa99dc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa99e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa99e4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa99e8:	17ffffde	b	0xfffff7fa9960
   0x0000fffff7fa99ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa99f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa99f4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa99f8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa99fc:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fa9a00:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9a04:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9a08:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa9a0c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9a10:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9a14:	d63f0200	blr	x16
   0x0000fffff7fa9a18:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9a1c:	54002c80	b.eq	0xfffff7fa9fac  // b.none
   0x0000fffff7fa9a20:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa9a24:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa9a28:	540004a0	b.eq	0xfffff7fa9abc  // b.none
   0x0000fffff7fa9a2c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa9a30:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa9a34:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa9a38:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa9a3c:	54000400	b.eq	0xfffff7fa9abc  // b.none
   0x0000fffff7fa9a40:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa9a44:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa9a48:	36d801d1	tbz	w17, #27, 0xfffff7fa9a80
   0x0000fffff7fa9a4c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa9a50:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa9a54:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa9a58:	54000321	b.ne	0xfffff7fa9abc  // b.any
   0x0000fffff7fa9a5c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa9a60:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9a64:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa9a68:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa9a6c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9a70:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa9a74:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa9a78:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa9a7c:	54000209	b.ls	0xfffff7fa9abc  // b.plast
   0x0000fffff7fa9a80:	36d8008d	tbz	w13, #27, 0xfffff7fa9a90
   0x0000fffff7fa9a84:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa9a88:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa9a8c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa9a90:	36d80091	tbz	w17, #27, 0xfffff7fa9aa0
   0x0000fffff7fa9a94:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9a98:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa9a9c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa9aa0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa9aa4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa9aa8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa9aac:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa9ab0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa9ab4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa9ab8:	1400000e	b	0xfffff7fa9af0
   0x0000fffff7fa9abc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa9ac0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9ac4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9ac8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9acc:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fa9ad0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9ad4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9ad8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa9adc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9ae0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9ae4:	d63f0200	blr	x16
   0x0000fffff7fa9ae8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9aec:	54002640	b.eq	0xfffff7fa9fb4  // b.none
   0x0000fffff7fa9af0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa9af4:	37d806a9	tbnz	w9, #27, 0xfffff7fa9bc8
   0x0000fffff7fa9af8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa9afc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9b00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9b04:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9b08:	540001c1	b.ne	0xfffff7fa9b40  // b.any
   0x0000fffff7fa9b0c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa9b10:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9b14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9b18:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9b1c:	54000121	b.ne	0xfffff7fa9b40  // b.any
   0x0000fffff7fa9b20:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa9b24:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa9b28:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa9b2c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9b30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9b34:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa9b38:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa9b3c:	14000030	b	0xfffff7fa9bfc
   0x0000fffff7fa9b40:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa9b44:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9b48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9b4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9b50:	54000120	b.eq	0xfffff7fa9b74  // b.none
   0x0000fffff7fa9b54:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa9b58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9b5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9b60:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9b64:	54000321	b.ne	0xfffff7fa9bc8  // b.any
   0x0000fffff7fa9b68:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa9b6c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa9b70:	14000002	b	0xfffff7fa9b78
   0x0000fffff7fa9b74:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa9b78:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa9b7c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9b80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9b84:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9b88:	54000120	b.eq	0xfffff7fa9bac  // b.none
   0x0000fffff7fa9b8c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa9b90:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9b94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9b98:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9b9c:	54000161	b.ne	0xfffff7fa9bc8  // b.any
   0x0000fffff7fa9ba0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa9ba4:	9e620121	scvtf	d1, x9
   0x0000fffff7fa9ba8:	14000002	b	0xfffff7fa9bb0
   0x0000fffff7fa9bac:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa9bb0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa9bb4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa9bb8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9bbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9bc0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa9bc4:	17ffffde	b	0xfffff7fa9b3c
   0x0000fffff7fa9bc8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9bcc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9bd0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9bd4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9bd8:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7fa9bdc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9be0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9be4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa9be8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9bec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9bf0:	d63f0200	blr	x16
   0x0000fffff7fa9bf4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9bf8:	54001e20	b.eq	0xfffff7fa9fbc  // b.none
   0x0000fffff7fa9bfc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa9c00:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa9c04:	540004a0	b.eq	0xfffff7fa9c98  // b.none
   0x0000fffff7fa9c08:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa9c0c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa9c10:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa9c14:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa9c18:	54000400	b.eq	0xfffff7fa9c98  // b.none
   0x0000fffff7fa9c1c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa9c20:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa9c24:	36d801d1	tbz	w17, #27, 0xfffff7fa9c5c
   0x0000fffff7fa9c28:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa9c2c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa9c30:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa9c34:	54000321	b.ne	0xfffff7fa9c98  // b.any
   0x0000fffff7fa9c38:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa9c3c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9c40:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa9c44:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa9c48:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9c4c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa9c50:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa9c54:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa9c58:	54000209	b.ls	0xfffff7fa9c98  // b.plast
   0x0000fffff7fa9c5c:	36d8008d	tbz	w13, #27, 0xfffff7fa9c6c
   0x0000fffff7fa9c60:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa9c64:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa9c68:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa9c6c:	36d80091	tbz	w17, #27, 0xfffff7fa9c7c
   0x0000fffff7fa9c70:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9c74:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa9c78:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa9c7c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa9c80:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa9c84:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa9c88:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa9c8c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa9c90:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa9c94:	1400000e	b	0xfffff7fa9ccc
   0x0000fffff7fa9c98:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa9c9c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9ca0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9ca4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9ca8:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7fa9cac:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9cb0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9cb4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa9cb8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9cbc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9cc0:	d63f0200	blr	x16
   0x0000fffff7fa9cc4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9cc8:	540017e0	b.eq	0xfffff7fa9fc4  // b.none
   0x0000fffff7fa9ccc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa9cd0:	37d806a9	tbnz	w9, #27, 0xfffff7fa9da4
   0x0000fffff7fa9cd4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa9cd8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9cdc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9ce0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9ce4:	540001c1	b.ne	0xfffff7fa9d1c  // b.any
   0x0000fffff7fa9ce8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa9cec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9cf0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9cf4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9cf8:	54000121	b.ne	0xfffff7fa9d1c  // b.any
   0x0000fffff7fa9cfc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa9d00:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa9d04:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa9d08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9d0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9d10:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa9d14:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa9d18:	14000030	b	0xfffff7fa9dd8
   0x0000fffff7fa9d1c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa9d20:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9d24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9d28:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9d2c:	54000120	b.eq	0xfffff7fa9d50  // b.none
   0x0000fffff7fa9d30:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa9d34:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9d38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9d3c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9d40:	54000321	b.ne	0xfffff7fa9da4  // b.any
   0x0000fffff7fa9d44:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa9d48:	9e620120	scvtf	d0, x9
   0x0000fffff7fa9d4c:	14000002	b	0xfffff7fa9d54
   0x0000fffff7fa9d50:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa9d54:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa9d58:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9d5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9d60:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9d64:	54000120	b.eq	0xfffff7fa9d88  // b.none
   0x0000fffff7fa9d68:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa9d6c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9d70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9d74:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9d78:	54000161	b.ne	0xfffff7fa9da4  // b.any
   0x0000fffff7fa9d7c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa9d80:	9e620121	scvtf	d1, x9
   0x0000fffff7fa9d84:	14000002	b	0xfffff7fa9d8c
   0x0000fffff7fa9d88:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa9d8c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa9d90:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa9d94:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9d98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9d9c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa9da0:	17ffffde	b	0xfffff7fa9d18
   0x0000fffff7fa9da4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9da8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9dac:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9db0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9db4:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7fa9db8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9dbc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9dc0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa9dc4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9dc8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9dcc:	d63f0200	blr	x16
   0x0000fffff7fa9dd0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9dd4:	54000fc0	b.eq	0xfffff7fa9fcc  // b.none
   0x0000fffff7fa9dd8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa9ddc:	37d80269	tbnz	w9, #27, 0xfffff7fa9e28
   0x0000fffff7fa9de0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa9de4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9de8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9dec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9df0:	540001c1	b.ne	0xfffff7fa9e28  // b.any
   0x0000fffff7fa9df4:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa9df8:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7fa9dfc:	8b0a012b	add	x11, x9, x10
   0x0000fffff7fa9e00:	f9003669	str	x9, [x19, #104]
   0x0000fffff7fa9e04:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9e08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9e0c:	b900626a	str	w10, [x19, #96]
   0x0000fffff7fa9e10:	aa0b03e9	mov	x9, x11
   0x0000fffff7fa9e14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9e18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9e1c:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7fa9e20:	b900526a	str	w10, [x19, #80]
   0x0000fffff7fa9e24:	1400000e	b	0xfffff7fa9e5c
   0x0000fffff7fa9e28:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9e2c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9e30:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9e34:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9e38:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7fa9e3c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9e40:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9e44:	d2916810	mov	x16, #0x8b40                	// #35648
   0x0000fffff7fa9e48:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9e4c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9e50:	d63f0200	blr	x16
   0x0000fffff7fa9e54:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9e58:	54000be0	b.eq	0xfffff7fa9fd4  // b.none
   0x0000fffff7fa9e5c:	17fff8d2	b	0xfffff7fa81a4
   0x0000fffff7fa9e60:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9e64:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9e68:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9e6c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9e70:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7fa9e74:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9e78:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9e7c:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7fa9e80:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9e84:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9e88:	d63f0200	blr	x16
   0x0000fffff7fa9e8c:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa9e90:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa9e94:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa9e98:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa9e9c:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fa9ea0:	d65f03c0	ret
   0x0000fffff7fa9ea4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9ea8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9eac:	b900028a	str	w10, [x20]
   0x0000fffff7fa9eb0:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fa9eb4:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa9eb8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa9ebc:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa9ec0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa9ec4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fa9ec8:	d65f03c0	ret
   0x0000fffff7fa9ecc:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fa9ed0:	17fffff5	b	0xfffff7fa9ea4
   0x0000fffff7fa9ed4:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fa9ed8:	17fffff3	b	0xfffff7fa9ea4
   0x0000fffff7fa9edc:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fa9ee0:	17fffff1	b	0xfffff7fa9ea4
   0x0000fffff7fa9ee4:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fa9ee8:	17ffffef	b	0xfffff7fa9ea4
   0x0000fffff7fa9eec:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fa9ef0:	17ffffed	b	0xfffff7fa9ea4
   0x0000fffff7fa9ef4:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fa9ef8:	17ffffeb	b	0xfffff7fa9ea4
   0x0000fffff7fa9efc:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fa9f00:	17ffffe9	b	0xfffff7fa9ea4
   0x0000fffff7fa9f04:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fa9f08:	17ffffe7	b	0xfffff7fa9ea4
   0x0000fffff7fa9f0c:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fa9f10:	17ffffe5	b	0xfffff7fa9ea4
   0x0000fffff7fa9f14:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fa9f18:	17ffffe3	b	0xfffff7fa9ea4
   0x0000fffff7fa9f1c:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fa9f20:	17ffffe1	b	0xfffff7fa9ea4
   0x0000fffff7fa9f24:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fa9f28:	17ffffdf	b	0xfffff7fa9ea4
   0x0000fffff7fa9f2c:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fa9f30:	17ffffdd	b	0xfffff7fa9ea4
   0x0000fffff7fa9f34:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fa9f38:	17ffffdb	b	0xfffff7fa9ea4
   0x0000fffff7fa9f3c:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fa9f40:	17ffffd9	b	0xfffff7fa9ea4
   0x0000fffff7fa9f44:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fa9f48:	17ffffd7	b	0xfffff7fa9ea4
   0x0000fffff7fa9f4c:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fa9f50:	17ffffd5	b	0xfffff7fa9ea4
   0x0000fffff7fa9f54:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fa9f58:	17ffffd3	b	0xfffff7fa9ea4
   0x0000fffff7fa9f5c:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fa9f60:	17ffffd1	b	0xfffff7fa9ea4
   0x0000fffff7fa9f64:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fa9f68:	17ffffcf	b	0xfffff7fa9ea4
   0x0000fffff7fa9f6c:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fa9f70:	17ffffcd	b	0xfffff7fa9ea4
   0x0000fffff7fa9f74:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fa9f78:	17ffffcb	b	0xfffff7fa9ea4
   0x0000fffff7fa9f7c:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fa9f80:	17ffffc9	b	0xfffff7fa9ea4
   0x0000fffff7fa9f84:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fa9f88:	17ffffc7	b	0xfffff7fa9ea4
   0x0000fffff7fa9f8c:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fa9f90:	17ffffc5	b	0xfffff7fa9ea4
   0x0000fffff7fa9f94:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fa9f98:	17ffffc3	b	0xfffff7fa9ea4
   0x0000fffff7fa9f9c:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fa9fa0:	17ffffc1	b	0xfffff7fa9ea4
   0x0000fffff7fa9fa4:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fa9fa8:	17ffffbf	b	0xfffff7fa9ea4
   0x0000fffff7fa9fac:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7fa9fb0:	17ffffbd	b	0xfffff7fa9ea4
   0x0000fffff7fa9fb4:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fa9fb8:	17ffffbb	b	0xfffff7fa9ea4
   0x0000fffff7fa9fbc:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7fa9fc0:	17ffffb9	b	0xfffff7fa9ea4
   0x0000fffff7fa9fc4:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7fa9fc8:	17ffffb7	b	0xfffff7fa9ea4
   0x0000fffff7fa9fcc:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7fa9fd0:	17ffffb5	b	0xfffff7fa9ea4
   0x0000fffff7fa9fd4:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7fa9fd8:	17ffffb3	b	0xfffff7fa9ea4
   0x0000fffff7fa9fdc:	00000000	udf	#0
   0x0000fffff7fa9fe0:	00000000	udf	#0
   0x0000fffff7fa9fe4:	00000000	udf	#0
   0x0000fffff7fa9fe8:	00000000	udf	#0
   0x0000fffff7fa9fec:	00000000	udf	#0
   0x0000fffff7fa9ff0:	00000000	udf	#0
   0x0000fffff7fa9ff4:	00000000	udf	#0
   0x0000fffff7fa9ff8:	00000000	udf	#0
   0x0000fffff7fa9ffc:	00000000	udf	#0
End of assembler dump.
