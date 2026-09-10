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
   0x0000fffff7fa8058:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa805c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa8060:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa8064:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa8068:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa806c:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7fa8070:	36d801d1	tbz	w17, #27, 0xfffff7fa80a8
   0x0000fffff7fa8074:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8078:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa807c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa8080:	54000281	b.ne	0xfffff7fa80d0  // b.any
   0x0000fffff7fa8084:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7fa8088:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa808c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa8090:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8094:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8098:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa809c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa80a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa80a4:	54000169	b.ls	0xfffff7fa80d0  // b.plast
   0x0000fffff7fa80a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa80ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa80b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa80b4:	36d80091	tbz	w17, #27, 0xfffff7fa80c4
   0x0000fffff7fa80b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa80bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa80c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa80c4:	f900166c	str	x12, [x19, #40]
   0x0000fffff7fa80c8:	b900226d	str	w13, [x19, #32]
   0x0000fffff7fa80cc:	1400000e	b	0xfffff7fa8104
   0x0000fffff7fa80d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa80d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa80d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa80dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa80e0:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fa80e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa80e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa80ec:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa80f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa80f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa80f8:	d63f0200	blr	x16
   0x0000fffff7fa80fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8100:	5400d8a0	b.eq	0xfffff7fa9c14  // b.none
   0x0000fffff7fa8104:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fa8108:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fa810c:	d280002c	mov	x12, #0x1                   	// #1
   0x0000fffff7fa8110:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fa8114:	36d80211	tbz	w17, #27, 0xfffff7fa8154
   0x0000fffff7fa8118:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa811c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8120:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa8124:	540001e1	b.ne	0xfffff7fa8160  // b.any
   0x0000fffff7fa8128:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa812c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8130:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa8134:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8138:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa813c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8140:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa8144:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8148:	540000c9	b.ls	0xfffff7fa8160  // b.plast
   0x0000fffff7fa814c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8150:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa8154:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa8158:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa815c:	1400000e	b	0xfffff7fa8194
   0x0000fffff7fa8160:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8164:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8168:	aa1303e1	mov	x1, x19
   0x0000fffff7fa816c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8170:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fa8174:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8178:	aa1603e5	mov	x5, x22
   0x0000fffff7fa817c:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fa8180:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8188:	d63f0200	blr	x16
   0x0000fffff7fa818c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8190:	5400d460	b.eq	0xfffff7fa9c1c  // b.none
   0x0000fffff7fa8194:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa8198:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa819c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa81a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa81a4:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fa81a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa81ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fa81b0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa81b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa81b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa81bc:	d63f0200	blr	x16
   0x0000fffff7fa81c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa81c4:	5400d300	b.eq	0xfffff7fa9c24  // b.none
   0x0000fffff7fa81c8:	14000001	b	0xfffff7fa81cc
   0x0000fffff7fa81cc:	14000001	b	0xfffff7fa81d0
   0x0000fffff7fa81d0:	14000001	b	0xfffff7fa81d4
   0x0000fffff7fa81d4:	14000001	b	0xfffff7fa81d8
   0x0000fffff7fa81d8:	14000001	b	0xfffff7fa81dc
   0x0000fffff7fa81dc:	14000001	b	0xfffff7fa81e0
   0x0000fffff7fa81e0:	14000001	b	0xfffff7fa81e4
   0x0000fffff7fa81e4:	14000001	b	0xfffff7fa81e8
   0x0000fffff7fa81e8:	14000001	b	0xfffff7fa81ec
   0x0000fffff7fa81ec:	14000001	b	0xfffff7fa81f0
   0x0000fffff7fa81f0:	14000001	b	0xfffff7fa81f4
   0x0000fffff7fa81f4:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fa81f8:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fa81fc:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fa8200:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fa8204:	36d80211	tbz	w17, #27, 0xfffff7fa8244
   0x0000fffff7fa8208:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa820c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8210:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa8214:	540001e1	b.ne	0xfffff7fa8250  // b.any
   0x0000fffff7fa8218:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa821c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8220:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa8224:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8228:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa822c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8230:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa8234:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8238:	540000c9	b.ls	0xfffff7fa8250  // b.plast
   0x0000fffff7fa823c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8240:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa8244:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa8248:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa824c:	1400000e	b	0xfffff7fa8284
   0x0000fffff7fa8250:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8254:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8258:	aa1303e1	mov	x1, x19
   0x0000fffff7fa825c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8260:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fa8264:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8268:	aa1603e5	mov	x5, x22
   0x0000fffff7fa826c:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fa8270:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8274:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8278:	d63f0200	blr	x16
   0x0000fffff7fa827c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8280:	5400cd60	b.eq	0xfffff7fa9c2c  // b.none
   0x0000fffff7fa8284:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa8288:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa828c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8290:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8294:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fa8298:	aa1403e4	mov	x4, x20
   0x0000fffff7fa829c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa82a0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa82a4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa82a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa82ac:	d63f0200	blr	x16
   0x0000fffff7fa82b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa82b4:	5400cc00	b.eq	0xfffff7fa9c34  // b.none
   0x0000fffff7fa82b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa82bc:	37d806a9	tbnz	w9, #27, 0xfffff7fa8390
   0x0000fffff7fa82c0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa82c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa82c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa82cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa82d0:	540001c1	b.ne	0xfffff7fa8308  // b.any
   0x0000fffff7fa82d4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa82d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa82dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa82e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa82e4:	54000121	b.ne	0xfffff7fa8308  // b.any
   0x0000fffff7fa82e8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa82ec:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa82f0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa82f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa82f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa82fc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa8300:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa8304:	14000030	b	0xfffff7fa83c4
   0x0000fffff7fa8308:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa830c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8310:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8314:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8318:	54000120	b.eq	0xfffff7fa833c  // b.none
   0x0000fffff7fa831c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8320:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8324:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8328:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa832c:	54000321	b.ne	0xfffff7fa8390  // b.any
   0x0000fffff7fa8330:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa8334:	9e620120	scvtf	d0, x9
   0x0000fffff7fa8338:	14000002	b	0xfffff7fa8340
   0x0000fffff7fa833c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa8340:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa8344:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8348:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa834c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8350:	54000120	b.eq	0xfffff7fa8374  // b.none
   0x0000fffff7fa8354:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa8358:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa835c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8360:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8364:	54000161	b.ne	0xfffff7fa8390  // b.any
   0x0000fffff7fa8368:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa836c:	9e620121	scvtf	d1, x9
   0x0000fffff7fa8370:	14000002	b	0xfffff7fa8378
   0x0000fffff7fa8374:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa8378:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa837c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa8380:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8384:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8388:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa838c:	17ffffde	b	0xfffff7fa8304
   0x0000fffff7fa8390:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8394:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8398:	aa1303e1	mov	x1, x19
   0x0000fffff7fa839c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa83a0:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fa83a4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa83a8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa83ac:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa83b0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa83b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa83b8:	d63f0200	blr	x16
   0x0000fffff7fa83bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa83c0:	5400c3e0	b.eq	0xfffff7fa9c3c  // b.none
   0x0000fffff7fa83c4:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa83c8:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa83cc:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa83d0:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa83d4:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa83d8:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa83dc:	36d801d1	tbz	w17, #27, 0xfffff7fa8414
   0x0000fffff7fa83e0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa83e4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa83e8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa83ec:	54000281	b.ne	0xfffff7fa843c  // b.any
   0x0000fffff7fa83f0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa83f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa83f8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa83fc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8400:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8404:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8408:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa840c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8410:	54000169	b.ls	0xfffff7fa843c  // b.plast
   0x0000fffff7fa8414:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa8418:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa841c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa8420:	36d80091	tbz	w17, #27, 0xfffff7fa8430
   0x0000fffff7fa8424:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8428:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa842c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa8430:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa8434:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa8438:	1400000e	b	0xfffff7fa8470
   0x0000fffff7fa843c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8440:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8444:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8448:	aa1503e2	mov	x2, x21
   0x0000fffff7fa844c:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fa8450:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8454:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8458:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa845c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8460:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8464:	d63f0200	blr	x16
   0x0000fffff7fa8468:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa846c:	5400bec0	b.eq	0xfffff7fa9c44  // b.none
   0x0000fffff7fa8470:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa8474:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa8478:	540003a0	b.eq	0xfffff7fa84ec  // b.none
   0x0000fffff7fa847c:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa8480:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa8484:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa8488:	36d801d1	tbz	w17, #27, 0xfffff7fa84c0
   0x0000fffff7fa848c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8490:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8494:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa8498:	540002a1	b.ne	0xfffff7fa84ec  // b.any
   0x0000fffff7fa849c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa84a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa84a4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa84a8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa84ac:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa84b0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa84b4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa84b8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa84bc:	54000189	b.ls	0xfffff7fa84ec  // b.plast
   0x0000fffff7fa84c0:	36d8008d	tbz	w13, #27, 0xfffff7fa84d0
   0x0000fffff7fa84c4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa84c8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa84cc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa84d0:	36d80091	tbz	w17, #27, 0xfffff7fa84e0
   0x0000fffff7fa84d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa84d8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa84dc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa84e0:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa84e4:	b900016d	str	w13, [x11]
   0x0000fffff7fa84e8:	1400000e	b	0xfffff7fa8520
   0x0000fffff7fa84ec:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa84f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa84f4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa84f8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa84fc:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fa8500:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8504:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8508:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa850c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8510:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8514:	d63f0200	blr	x16
   0x0000fffff7fa8518:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa851c:	5400b980	b.eq	0xfffff7fa9c4c  // b.none
   0x0000fffff7fa8520:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa8524:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa8528:	540004a0	b.eq	0xfffff7fa85bc  // b.none
   0x0000fffff7fa852c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa8530:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa8534:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa8538:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa853c:	54000400	b.eq	0xfffff7fa85bc  // b.none
   0x0000fffff7fa8540:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa8544:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa8548:	36d801d1	tbz	w17, #27, 0xfffff7fa8580
   0x0000fffff7fa854c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8550:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8554:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa8558:	54000321	b.ne	0xfffff7fa85bc  // b.any
   0x0000fffff7fa855c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa8560:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8564:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa8568:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa856c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8570:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8574:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa8578:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa857c:	54000209	b.ls	0xfffff7fa85bc  // b.plast
   0x0000fffff7fa8580:	36d8008d	tbz	w13, #27, 0xfffff7fa8590
   0x0000fffff7fa8584:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa8588:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa858c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa8590:	36d80091	tbz	w17, #27, 0xfffff7fa85a0
   0x0000fffff7fa8594:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8598:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa859c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa85a0:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa85a4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa85a8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa85ac:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa85b0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa85b4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa85b8:	1400000e	b	0xfffff7fa85f0
   0x0000fffff7fa85bc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa85c0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa85c4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa85c8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa85cc:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fa85d0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa85d4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa85d8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa85dc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa85e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa85e4:	d63f0200	blr	x16
   0x0000fffff7fa85e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa85ec:	5400b340	b.eq	0xfffff7fa9c54  // b.none
   0x0000fffff7fa85f0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa85f4:	37d806a9	tbnz	w9, #27, 0xfffff7fa86c8
   0x0000fffff7fa85f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa85fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8600:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8604:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8608:	540001c1	b.ne	0xfffff7fa8640  // b.any
   0x0000fffff7fa860c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa8610:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8614:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8618:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa861c:	54000121	b.ne	0xfffff7fa8640  // b.any
   0x0000fffff7fa8620:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa8624:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa8628:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa862c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8630:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8634:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa8638:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa863c:	14000030	b	0xfffff7fa86fc
   0x0000fffff7fa8640:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8644:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8648:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa864c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8650:	54000120	b.eq	0xfffff7fa8674  // b.none
   0x0000fffff7fa8654:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8658:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa865c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8660:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8664:	54000321	b.ne	0xfffff7fa86c8  // b.any
   0x0000fffff7fa8668:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa866c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa8670:	14000002	b	0xfffff7fa8678
   0x0000fffff7fa8674:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa8678:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa867c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8680:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8684:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8688:	54000120	b.eq	0xfffff7fa86ac  // b.none
   0x0000fffff7fa868c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa8690:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8694:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8698:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa869c:	54000161	b.ne	0xfffff7fa86c8  // b.any
   0x0000fffff7fa86a0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa86a4:	9e620121	scvtf	d1, x9
   0x0000fffff7fa86a8:	14000002	b	0xfffff7fa86b0
   0x0000fffff7fa86ac:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa86b0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa86b4:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa86b8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa86bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa86c0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa86c4:	17ffffde	b	0xfffff7fa863c
   0x0000fffff7fa86c8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa86cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa86d0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa86d4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa86d8:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fa86dc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa86e0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa86e4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa86e8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa86ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa86f0:	d63f0200	blr	x16
   0x0000fffff7fa86f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa86f8:	5400ab20	b.eq	0xfffff7fa9c5c  // b.none
   0x0000fffff7fa86fc:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa8700:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa8704:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa8708:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa870c:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa8710:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa8714:	36d801d1	tbz	w17, #27, 0xfffff7fa874c
   0x0000fffff7fa8718:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa871c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8720:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa8724:	54000281	b.ne	0xfffff7fa8774  // b.any
   0x0000fffff7fa8728:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa872c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8730:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa8734:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8738:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa873c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8740:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa8744:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8748:	54000169	b.ls	0xfffff7fa8774  // b.plast
   0x0000fffff7fa874c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa8750:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa8754:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa8758:	36d80091	tbz	w17, #27, 0xfffff7fa8768
   0x0000fffff7fa875c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8760:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8764:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa8768:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa876c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa8770:	1400000e	b	0xfffff7fa87a8
   0x0000fffff7fa8774:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8778:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa877c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8780:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8784:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fa8788:	aa1403e4	mov	x4, x20
   0x0000fffff7fa878c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8790:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa8794:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8798:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa879c:	d63f0200	blr	x16
   0x0000fffff7fa87a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa87a4:	5400a600	b.eq	0xfffff7fa9c64  // b.none
   0x0000fffff7fa87a8:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa87ac:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa87b0:	540003a0	b.eq	0xfffff7fa8824  // b.none
   0x0000fffff7fa87b4:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa87b8:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa87bc:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa87c0:	36d801d1	tbz	w17, #27, 0xfffff7fa87f8
   0x0000fffff7fa87c4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa87c8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa87cc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa87d0:	540002a1	b.ne	0xfffff7fa8824  // b.any
   0x0000fffff7fa87d4:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa87d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa87dc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa87e0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa87e4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa87e8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa87ec:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa87f0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa87f4:	54000189	b.ls	0xfffff7fa8824  // b.plast
   0x0000fffff7fa87f8:	36d8008d	tbz	w13, #27, 0xfffff7fa8808
   0x0000fffff7fa87fc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa8800:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa8804:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa8808:	36d80091	tbz	w17, #27, 0xfffff7fa8818
   0x0000fffff7fa880c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8810:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8814:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa8818:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa881c:	b900016d	str	w13, [x11]
   0x0000fffff7fa8820:	1400000e	b	0xfffff7fa8858
   0x0000fffff7fa8824:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa8828:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa882c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8830:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8834:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fa8838:	aa1403e4	mov	x4, x20
   0x0000fffff7fa883c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8840:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa8844:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8848:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa884c:	d63f0200	blr	x16
   0x0000fffff7fa8850:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8854:	5400a0c0	b.eq	0xfffff7fa9c6c  // b.none
   0x0000fffff7fa8858:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa885c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa8860:	540004a0	b.eq	0xfffff7fa88f4  // b.none
   0x0000fffff7fa8864:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa8868:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa886c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa8870:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa8874:	54000400	b.eq	0xfffff7fa88f4  // b.none
   0x0000fffff7fa8878:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa887c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa8880:	36d801d1	tbz	w17, #27, 0xfffff7fa88b8
   0x0000fffff7fa8884:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8888:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa888c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa8890:	54000321	b.ne	0xfffff7fa88f4  // b.any
   0x0000fffff7fa8894:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa8898:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa889c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa88a0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa88a4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa88a8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa88ac:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa88b0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa88b4:	54000209	b.ls	0xfffff7fa88f4  // b.plast
   0x0000fffff7fa88b8:	36d8008d	tbz	w13, #27, 0xfffff7fa88c8
   0x0000fffff7fa88bc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa88c0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa88c4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa88c8:	36d80091	tbz	w17, #27, 0xfffff7fa88d8
   0x0000fffff7fa88cc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa88d0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa88d4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa88d8:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa88dc:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa88e0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa88e4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa88e8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa88ec:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa88f0:	1400000e	b	0xfffff7fa8928
   0x0000fffff7fa88f4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa88f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa88fc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8900:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8904:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fa8908:	aa1403e4	mov	x4, x20
   0x0000fffff7fa890c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8910:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa8914:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8918:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa891c:	d63f0200	blr	x16
   0x0000fffff7fa8920:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8924:	54009a80	b.eq	0xfffff7fa9c74  // b.none
   0x0000fffff7fa8928:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa892c:	37d806a9	tbnz	w9, #27, 0xfffff7fa8a00
   0x0000fffff7fa8930:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8934:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8938:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa893c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8940:	540001c1	b.ne	0xfffff7fa8978  // b.any
   0x0000fffff7fa8944:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa8948:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa894c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8950:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8954:	54000121	b.ne	0xfffff7fa8978  // b.any
   0x0000fffff7fa8958:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa895c:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa8960:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa8964:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8968:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa896c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa8970:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa8974:	14000030	b	0xfffff7fa8a34
   0x0000fffff7fa8978:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa897c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8980:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8984:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8988:	54000120	b.eq	0xfffff7fa89ac  // b.none
   0x0000fffff7fa898c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8990:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8994:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8998:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa899c:	54000321	b.ne	0xfffff7fa8a00  // b.any
   0x0000fffff7fa89a0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa89a4:	9e620120	scvtf	d0, x9
   0x0000fffff7fa89a8:	14000002	b	0xfffff7fa89b0
   0x0000fffff7fa89ac:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa89b0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa89b4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa89b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa89bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa89c0:	54000120	b.eq	0xfffff7fa89e4  // b.none
   0x0000fffff7fa89c4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa89c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa89cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa89d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa89d4:	54000161	b.ne	0xfffff7fa8a00  // b.any
   0x0000fffff7fa89d8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa89dc:	9e620121	scvtf	d1, x9
   0x0000fffff7fa89e0:	14000002	b	0xfffff7fa89e8
   0x0000fffff7fa89e4:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa89e8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa89ec:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa89f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa89f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa89f8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa89fc:	17ffffde	b	0xfffff7fa8974
   0x0000fffff7fa8a00:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8a04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8a08:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8a0c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8a10:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fa8a14:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8a18:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8a1c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa8a20:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8a24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8a28:	d63f0200	blr	x16
   0x0000fffff7fa8a2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8a30:	54009260	b.eq	0xfffff7fa9c7c  // b.none
   0x0000fffff7fa8a34:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa8a38:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa8a3c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa8a40:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa8a44:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa8a48:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa8a4c:	36d801d1	tbz	w17, #27, 0xfffff7fa8a84
   0x0000fffff7fa8a50:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8a54:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8a58:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa8a5c:	54000281	b.ne	0xfffff7fa8aac  // b.any
   0x0000fffff7fa8a60:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa8a64:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8a68:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa8a6c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8a70:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8a74:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8a78:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa8a7c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8a80:	54000169	b.ls	0xfffff7fa8aac  // b.plast
   0x0000fffff7fa8a84:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa8a88:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa8a8c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa8a90:	36d80091	tbz	w17, #27, 0xfffff7fa8aa0
   0x0000fffff7fa8a94:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8a98:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8a9c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa8aa0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa8aa4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa8aa8:	1400000e	b	0xfffff7fa8ae0
   0x0000fffff7fa8aac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8ab0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8ab4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8ab8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8abc:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fa8ac0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8ac4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8ac8:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa8acc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8ad0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8ad4:	d63f0200	blr	x16
   0x0000fffff7fa8ad8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8adc:	54008d40	b.eq	0xfffff7fa9c84  // b.none
   0x0000fffff7fa8ae0:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa8ae4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa8ae8:	540003a0	b.eq	0xfffff7fa8b5c  // b.none
   0x0000fffff7fa8aec:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa8af0:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa8af4:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa8af8:	36d801d1	tbz	w17, #27, 0xfffff7fa8b30
   0x0000fffff7fa8afc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8b00:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8b04:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa8b08:	540002a1	b.ne	0xfffff7fa8b5c  // b.any
   0x0000fffff7fa8b0c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa8b10:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8b14:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa8b18:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8b1c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8b20:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8b24:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa8b28:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8b2c:	54000189	b.ls	0xfffff7fa8b5c  // b.plast
   0x0000fffff7fa8b30:	36d8008d	tbz	w13, #27, 0xfffff7fa8b40
   0x0000fffff7fa8b34:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa8b38:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa8b3c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa8b40:	36d80091	tbz	w17, #27, 0xfffff7fa8b50
   0x0000fffff7fa8b44:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8b48:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8b4c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa8b50:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa8b54:	b900016d	str	w13, [x11]
   0x0000fffff7fa8b58:	1400000e	b	0xfffff7fa8b90
   0x0000fffff7fa8b5c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa8b60:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8b64:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8b68:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8b6c:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fa8b70:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8b74:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8b78:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa8b7c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8b80:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8b84:	d63f0200	blr	x16
   0x0000fffff7fa8b88:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8b8c:	54008800	b.eq	0xfffff7fa9c8c  // b.none
   0x0000fffff7fa8b90:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa8b94:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa8b98:	540004a0	b.eq	0xfffff7fa8c2c  // b.none
   0x0000fffff7fa8b9c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa8ba0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa8ba4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa8ba8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa8bac:	54000400	b.eq	0xfffff7fa8c2c  // b.none
   0x0000fffff7fa8bb0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa8bb4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa8bb8:	36d801d1	tbz	w17, #27, 0xfffff7fa8bf0
   0x0000fffff7fa8bbc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8bc0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8bc4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa8bc8:	54000321	b.ne	0xfffff7fa8c2c  // b.any
   0x0000fffff7fa8bcc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa8bd0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8bd4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa8bd8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8bdc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8be0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8be4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa8be8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8bec:	54000209	b.ls	0xfffff7fa8c2c  // b.plast
   0x0000fffff7fa8bf0:	36d8008d	tbz	w13, #27, 0xfffff7fa8c00
   0x0000fffff7fa8bf4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa8bf8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa8bfc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa8c00:	36d80091	tbz	w17, #27, 0xfffff7fa8c10
   0x0000fffff7fa8c04:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8c08:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8c0c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa8c10:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa8c14:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa8c18:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa8c1c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa8c20:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa8c24:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa8c28:	1400000e	b	0xfffff7fa8c60
   0x0000fffff7fa8c2c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa8c30:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8c34:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8c38:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8c3c:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fa8c40:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8c44:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8c48:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa8c4c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8c50:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8c54:	d63f0200	blr	x16
   0x0000fffff7fa8c58:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8c5c:	540081c0	b.eq	0xfffff7fa9c94  // b.none
   0x0000fffff7fa8c60:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8c64:	37d806a9	tbnz	w9, #27, 0xfffff7fa8d38
   0x0000fffff7fa8c68:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8c6c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8c70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8c74:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8c78:	540001c1	b.ne	0xfffff7fa8cb0  // b.any
   0x0000fffff7fa8c7c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa8c80:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8c84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8c88:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8c8c:	54000121	b.ne	0xfffff7fa8cb0  // b.any
   0x0000fffff7fa8c90:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa8c94:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa8c98:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa8c9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8ca0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8ca4:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa8ca8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa8cac:	14000030	b	0xfffff7fa8d6c
   0x0000fffff7fa8cb0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8cb4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8cb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8cbc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8cc0:	54000120	b.eq	0xfffff7fa8ce4  // b.none
   0x0000fffff7fa8cc4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8cc8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8ccc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8cd0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8cd4:	54000321	b.ne	0xfffff7fa8d38  // b.any
   0x0000fffff7fa8cd8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa8cdc:	9e620120	scvtf	d0, x9
   0x0000fffff7fa8ce0:	14000002	b	0xfffff7fa8ce8
   0x0000fffff7fa8ce4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa8ce8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa8cec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8cf0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8cf4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8cf8:	54000120	b.eq	0xfffff7fa8d1c  // b.none
   0x0000fffff7fa8cfc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa8d00:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8d04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8d08:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8d0c:	54000161	b.ne	0xfffff7fa8d38  // b.any
   0x0000fffff7fa8d10:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa8d14:	9e620121	scvtf	d1, x9
   0x0000fffff7fa8d18:	14000002	b	0xfffff7fa8d20
   0x0000fffff7fa8d1c:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa8d20:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa8d24:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa8d28:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8d2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8d30:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa8d34:	17ffffde	b	0xfffff7fa8cac
   0x0000fffff7fa8d38:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8d3c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8d40:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8d44:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8d48:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fa8d4c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8d50:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8d54:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa8d58:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8d5c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8d60:	d63f0200	blr	x16
   0x0000fffff7fa8d64:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8d68:	540079a0	b.eq	0xfffff7fa9c9c  // b.none
   0x0000fffff7fa8d6c:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa8d70:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa8d74:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa8d78:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa8d7c:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa8d80:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa8d84:	36d801d1	tbz	w17, #27, 0xfffff7fa8dbc
   0x0000fffff7fa8d88:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8d8c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8d90:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa8d94:	54000281	b.ne	0xfffff7fa8de4  // b.any
   0x0000fffff7fa8d98:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa8d9c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8da0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa8da4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8da8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8dac:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8db0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa8db4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8db8:	54000169	b.ls	0xfffff7fa8de4  // b.plast
   0x0000fffff7fa8dbc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa8dc0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa8dc4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa8dc8:	36d80091	tbz	w17, #27, 0xfffff7fa8dd8
   0x0000fffff7fa8dcc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8dd0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8dd4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa8dd8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa8ddc:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa8de0:	1400000e	b	0xfffff7fa8e18
   0x0000fffff7fa8de4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8de8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8dec:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8df0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8df4:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fa8df8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8dfc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8e00:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa8e04:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8e08:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8e0c:	d63f0200	blr	x16
   0x0000fffff7fa8e10:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8e14:	54007480	b.eq	0xfffff7fa9ca4  // b.none
   0x0000fffff7fa8e18:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa8e1c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa8e20:	540003a0	b.eq	0xfffff7fa8e94  // b.none
   0x0000fffff7fa8e24:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa8e28:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa8e2c:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa8e30:	36d801d1	tbz	w17, #27, 0xfffff7fa8e68
   0x0000fffff7fa8e34:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8e38:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8e3c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa8e40:	540002a1	b.ne	0xfffff7fa8e94  // b.any
   0x0000fffff7fa8e44:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa8e48:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8e4c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa8e50:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8e54:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8e58:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8e5c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa8e60:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8e64:	54000189	b.ls	0xfffff7fa8e94  // b.plast
   0x0000fffff7fa8e68:	36d8008d	tbz	w13, #27, 0xfffff7fa8e78
   0x0000fffff7fa8e6c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa8e70:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa8e74:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa8e78:	36d80091	tbz	w17, #27, 0xfffff7fa8e88
   0x0000fffff7fa8e7c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8e80:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8e84:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa8e88:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa8e8c:	b900016d	str	w13, [x11]
   0x0000fffff7fa8e90:	1400000e	b	0xfffff7fa8ec8
   0x0000fffff7fa8e94:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa8e98:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8e9c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8ea0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8ea4:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fa8ea8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8eac:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8eb0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa8eb4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8eb8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8ebc:	d63f0200	blr	x16
   0x0000fffff7fa8ec0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8ec4:	54006f40	b.eq	0xfffff7fa9cac  // b.none
   0x0000fffff7fa8ec8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa8ecc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa8ed0:	540004a0	b.eq	0xfffff7fa8f64  // b.none
   0x0000fffff7fa8ed4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa8ed8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa8edc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa8ee0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa8ee4:	54000400	b.eq	0xfffff7fa8f64  // b.none
   0x0000fffff7fa8ee8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa8eec:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa8ef0:	36d801d1	tbz	w17, #27, 0xfffff7fa8f28
   0x0000fffff7fa8ef4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8ef8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8efc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa8f00:	54000321	b.ne	0xfffff7fa8f64  // b.any
   0x0000fffff7fa8f04:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa8f08:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8f0c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa8f10:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8f14:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8f18:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8f1c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa8f20:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8f24:	54000209	b.ls	0xfffff7fa8f64  // b.plast
   0x0000fffff7fa8f28:	36d8008d	tbz	w13, #27, 0xfffff7fa8f38
   0x0000fffff7fa8f2c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa8f30:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa8f34:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa8f38:	36d80091	tbz	w17, #27, 0xfffff7fa8f48
   0x0000fffff7fa8f3c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8f40:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8f44:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa8f48:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa8f4c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa8f50:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa8f54:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa8f58:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa8f5c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa8f60:	1400000e	b	0xfffff7fa8f98
   0x0000fffff7fa8f64:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa8f68:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8f6c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8f70:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8f74:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fa8f78:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8f7c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8f80:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa8f84:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8f88:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8f8c:	d63f0200	blr	x16
   0x0000fffff7fa8f90:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8f94:	54006900	b.eq	0xfffff7fa9cb4  // b.none
   0x0000fffff7fa8f98:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8f9c:	37d806a9	tbnz	w9, #27, 0xfffff7fa9070
   0x0000fffff7fa8fa0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8fa4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8fa8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8fac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8fb0:	540001c1	b.ne	0xfffff7fa8fe8  // b.any
   0x0000fffff7fa8fb4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa8fb8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8fbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8fc0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8fc4:	54000121	b.ne	0xfffff7fa8fe8  // b.any
   0x0000fffff7fa8fc8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa8fcc:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa8fd0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa8fd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8fd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8fdc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa8fe0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa8fe4:	14000030	b	0xfffff7fa90a4
   0x0000fffff7fa8fe8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8fec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8ff0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8ff4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8ff8:	54000120	b.eq	0xfffff7fa901c  // b.none
   0x0000fffff7fa8ffc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9000:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9004:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9008:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa900c:	54000321	b.ne	0xfffff7fa9070  // b.any
   0x0000fffff7fa9010:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa9014:	9e620120	scvtf	d0, x9
   0x0000fffff7fa9018:	14000002	b	0xfffff7fa9020
   0x0000fffff7fa901c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa9020:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa9024:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9028:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa902c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9030:	54000120	b.eq	0xfffff7fa9054  // b.none
   0x0000fffff7fa9034:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa9038:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa903c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9040:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9044:	54000161	b.ne	0xfffff7fa9070  // b.any
   0x0000fffff7fa9048:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa904c:	9e620121	scvtf	d1, x9
   0x0000fffff7fa9050:	14000002	b	0xfffff7fa9058
   0x0000fffff7fa9054:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa9058:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa905c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa9060:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9064:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9068:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa906c:	17ffffde	b	0xfffff7fa8fe4
   0x0000fffff7fa9070:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9074:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9078:	aa1303e1	mov	x1, x19
   0x0000fffff7fa907c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9080:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fa9084:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9088:	aa1603e5	mov	x5, x22
   0x0000fffff7fa908c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa9090:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9094:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9098:	d63f0200	blr	x16
   0x0000fffff7fa909c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa90a0:	540060e0	b.eq	0xfffff7fa9cbc  // b.none
   0x0000fffff7fa90a4:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa90a8:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa90ac:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa90b0:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa90b4:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa90b8:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa90bc:	36d801d1	tbz	w17, #27, 0xfffff7fa90f4
   0x0000fffff7fa90c0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa90c4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa90c8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa90cc:	54000281	b.ne	0xfffff7fa911c  // b.any
   0x0000fffff7fa90d0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa90d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa90d8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa90dc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa90e0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa90e4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa90e8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa90ec:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa90f0:	54000169	b.ls	0xfffff7fa911c  // b.plast
   0x0000fffff7fa90f4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa90f8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa90fc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa9100:	36d80091	tbz	w17, #27, 0xfffff7fa9110
   0x0000fffff7fa9104:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9108:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa910c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa9110:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa9114:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa9118:	1400000e	b	0xfffff7fa9150
   0x0000fffff7fa911c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9120:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9124:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9128:	aa1503e2	mov	x2, x21
   0x0000fffff7fa912c:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fa9130:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9134:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9138:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa913c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9140:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9144:	d63f0200	blr	x16
   0x0000fffff7fa9148:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa914c:	54005bc0	b.eq	0xfffff7fa9cc4  // b.none
   0x0000fffff7fa9150:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa9154:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa9158:	540003a0	b.eq	0xfffff7fa91cc  // b.none
   0x0000fffff7fa915c:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa9160:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa9164:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa9168:	36d801d1	tbz	w17, #27, 0xfffff7fa91a0
   0x0000fffff7fa916c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa9170:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa9174:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa9178:	540002a1	b.ne	0xfffff7fa91cc  // b.any
   0x0000fffff7fa917c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa9180:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9184:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa9188:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa918c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9190:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa9194:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa9198:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa919c:	54000189	b.ls	0xfffff7fa91cc  // b.plast
   0x0000fffff7fa91a0:	36d8008d	tbz	w13, #27, 0xfffff7fa91b0
   0x0000fffff7fa91a4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa91a8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa91ac:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa91b0:	36d80091	tbz	w17, #27, 0xfffff7fa91c0
   0x0000fffff7fa91b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa91b8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa91bc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa91c0:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa91c4:	b900016d	str	w13, [x11]
   0x0000fffff7fa91c8:	1400000e	b	0xfffff7fa9200
   0x0000fffff7fa91cc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa91d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa91d4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa91d8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa91dc:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fa91e0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa91e4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa91e8:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa91ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa91f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa91f4:	d63f0200	blr	x16
   0x0000fffff7fa91f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa91fc:	54005680	b.eq	0xfffff7fa9ccc  // b.none
   0x0000fffff7fa9200:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa9204:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa9208:	540004a0	b.eq	0xfffff7fa929c  // b.none
   0x0000fffff7fa920c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa9210:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa9214:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa9218:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa921c:	54000400	b.eq	0xfffff7fa929c  // b.none
   0x0000fffff7fa9220:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa9224:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa9228:	36d801d1	tbz	w17, #27, 0xfffff7fa9260
   0x0000fffff7fa922c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa9230:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa9234:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa9238:	54000321	b.ne	0xfffff7fa929c  // b.any
   0x0000fffff7fa923c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa9240:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9244:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa9248:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa924c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9250:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa9254:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa9258:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa925c:	54000209	b.ls	0xfffff7fa929c  // b.plast
   0x0000fffff7fa9260:	36d8008d	tbz	w13, #27, 0xfffff7fa9270
   0x0000fffff7fa9264:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa9268:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa926c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa9270:	36d80091	tbz	w17, #27, 0xfffff7fa9280
   0x0000fffff7fa9274:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9278:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa927c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa9280:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa9284:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa9288:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa928c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa9290:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa9294:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa9298:	1400000e	b	0xfffff7fa92d0
   0x0000fffff7fa929c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa92a0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa92a4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa92a8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa92ac:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fa92b0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa92b4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa92b8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa92bc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa92c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa92c4:	d63f0200	blr	x16
   0x0000fffff7fa92c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa92cc:	54005040	b.eq	0xfffff7fa9cd4  // b.none
   0x0000fffff7fa92d0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa92d4:	37d806a9	tbnz	w9, #27, 0xfffff7fa93a8
   0x0000fffff7fa92d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa92dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa92e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa92e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa92e8:	540001c1	b.ne	0xfffff7fa9320  // b.any
   0x0000fffff7fa92ec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa92f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa92f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa92f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa92fc:	54000121	b.ne	0xfffff7fa9320  // b.any
   0x0000fffff7fa9300:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa9304:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa9308:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa930c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9310:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9314:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa9318:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa931c:	14000030	b	0xfffff7fa93dc
   0x0000fffff7fa9320:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9324:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9328:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa932c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9330:	54000120	b.eq	0xfffff7fa9354  // b.none
   0x0000fffff7fa9334:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9338:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa933c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9340:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9344:	54000321	b.ne	0xfffff7fa93a8  // b.any
   0x0000fffff7fa9348:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa934c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa9350:	14000002	b	0xfffff7fa9358
   0x0000fffff7fa9354:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa9358:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa935c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9360:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9364:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9368:	54000120	b.eq	0xfffff7fa938c  // b.none
   0x0000fffff7fa936c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa9370:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9374:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9378:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa937c:	54000161	b.ne	0xfffff7fa93a8  // b.any
   0x0000fffff7fa9380:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa9384:	9e620121	scvtf	d1, x9
   0x0000fffff7fa9388:	14000002	b	0xfffff7fa9390
   0x0000fffff7fa938c:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa9390:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa9394:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa9398:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa939c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa93a0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa93a4:	17ffffde	b	0xfffff7fa931c
   0x0000fffff7fa93a8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa93ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa93b0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa93b4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa93b8:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fa93bc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa93c0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa93c4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa93c8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa93cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa93d0:	d63f0200	blr	x16
   0x0000fffff7fa93d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa93d8:	54004820	b.eq	0xfffff7fa9cdc  // b.none
   0x0000fffff7fa93dc:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa93e0:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa93e4:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa93e8:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa93ec:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa93f0:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa93f4:	36d801d1	tbz	w17, #27, 0xfffff7fa942c
   0x0000fffff7fa93f8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa93fc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa9400:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa9404:	54000281	b.ne	0xfffff7fa9454  // b.any
   0x0000fffff7fa9408:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa940c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9410:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa9414:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa9418:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa941c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa9420:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa9424:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa9428:	54000169	b.ls	0xfffff7fa9454  // b.plast
   0x0000fffff7fa942c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa9430:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa9434:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa9438:	36d80091	tbz	w17, #27, 0xfffff7fa9448
   0x0000fffff7fa943c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9440:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa9444:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa9448:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa944c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa9450:	1400000e	b	0xfffff7fa9488
   0x0000fffff7fa9454:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9458:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa945c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9460:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9464:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fa9468:	aa1403e4	mov	x4, x20
   0x0000fffff7fa946c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9470:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa9474:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9478:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa947c:	d63f0200	blr	x16
   0x0000fffff7fa9480:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9484:	54004300	b.eq	0xfffff7fa9ce4  // b.none
   0x0000fffff7fa9488:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa948c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa9490:	540003a0	b.eq	0xfffff7fa9504  // b.none
   0x0000fffff7fa9494:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa9498:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa949c:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa94a0:	36d801d1	tbz	w17, #27, 0xfffff7fa94d8
   0x0000fffff7fa94a4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa94a8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa94ac:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa94b0:	540002a1	b.ne	0xfffff7fa9504  // b.any
   0x0000fffff7fa94b4:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa94b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa94bc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa94c0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa94c4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa94c8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa94cc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa94d0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa94d4:	54000189	b.ls	0xfffff7fa9504  // b.plast
   0x0000fffff7fa94d8:	36d8008d	tbz	w13, #27, 0xfffff7fa94e8
   0x0000fffff7fa94dc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa94e0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa94e4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa94e8:	36d80091	tbz	w17, #27, 0xfffff7fa94f8
   0x0000fffff7fa94ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa94f0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa94f4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa94f8:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa94fc:	b900016d	str	w13, [x11]
   0x0000fffff7fa9500:	1400000e	b	0xfffff7fa9538
   0x0000fffff7fa9504:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa9508:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa950c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9510:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9514:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fa9518:	aa1403e4	mov	x4, x20
   0x0000fffff7fa951c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9520:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa9524:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9528:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa952c:	d63f0200	blr	x16
   0x0000fffff7fa9530:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9534:	54003dc0	b.eq	0xfffff7fa9cec  // b.none
   0x0000fffff7fa9538:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa953c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa9540:	540004a0	b.eq	0xfffff7fa95d4  // b.none
   0x0000fffff7fa9544:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa9548:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa954c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa9550:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa9554:	54000400	b.eq	0xfffff7fa95d4  // b.none
   0x0000fffff7fa9558:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa955c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa9560:	36d801d1	tbz	w17, #27, 0xfffff7fa9598
   0x0000fffff7fa9564:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa9568:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa956c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa9570:	54000321	b.ne	0xfffff7fa95d4  // b.any
   0x0000fffff7fa9574:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa9578:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa957c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa9580:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa9584:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9588:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa958c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa9590:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa9594:	54000209	b.ls	0xfffff7fa95d4  // b.plast
   0x0000fffff7fa9598:	36d8008d	tbz	w13, #27, 0xfffff7fa95a8
   0x0000fffff7fa959c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa95a0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa95a4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa95a8:	36d80091	tbz	w17, #27, 0xfffff7fa95b8
   0x0000fffff7fa95ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa95b0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa95b4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa95b8:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa95bc:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa95c0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa95c4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa95c8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa95cc:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa95d0:	1400000e	b	0xfffff7fa9608
   0x0000fffff7fa95d4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa95d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa95dc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa95e0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa95e4:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fa95e8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa95ec:	aa1603e5	mov	x5, x22
   0x0000fffff7fa95f0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa95f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa95f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa95fc:	d63f0200	blr	x16
   0x0000fffff7fa9600:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9604:	54003780	b.eq	0xfffff7fa9cf4  // b.none
   0x0000fffff7fa9608:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa960c:	37d806a9	tbnz	w9, #27, 0xfffff7fa96e0
   0x0000fffff7fa9610:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9614:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9618:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa961c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9620:	540001c1	b.ne	0xfffff7fa9658  // b.any
   0x0000fffff7fa9624:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa9628:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa962c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9630:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9634:	54000121	b.ne	0xfffff7fa9658  // b.any
   0x0000fffff7fa9638:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa963c:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa9640:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa9644:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9648:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa964c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa9650:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa9654:	14000030	b	0xfffff7fa9714
   0x0000fffff7fa9658:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa965c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9660:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9664:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9668:	54000120	b.eq	0xfffff7fa968c  // b.none
   0x0000fffff7fa966c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9670:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9674:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9678:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa967c:	54000321	b.ne	0xfffff7fa96e0  // b.any
   0x0000fffff7fa9680:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa9684:	9e620120	scvtf	d0, x9
   0x0000fffff7fa9688:	14000002	b	0xfffff7fa9690
   0x0000fffff7fa968c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa9690:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa9694:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9698:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa969c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa96a0:	54000120	b.eq	0xfffff7fa96c4  // b.none
   0x0000fffff7fa96a4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa96a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa96ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa96b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa96b4:	54000161	b.ne	0xfffff7fa96e0  // b.any
   0x0000fffff7fa96b8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa96bc:	9e620121	scvtf	d1, x9
   0x0000fffff7fa96c0:	14000002	b	0xfffff7fa96c8
   0x0000fffff7fa96c4:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa96c8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa96cc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa96d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa96d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa96d8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa96dc:	17ffffde	b	0xfffff7fa9654
   0x0000fffff7fa96e0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa96e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa96e8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa96ec:	aa1503e2	mov	x2, x21
   0x0000fffff7fa96f0:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fa96f4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa96f8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa96fc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa9700:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9704:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9708:	d63f0200	blr	x16
   0x0000fffff7fa970c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9710:	54002f60	b.eq	0xfffff7fa9cfc  // b.none
   0x0000fffff7fa9714:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa9718:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa971c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa9720:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa9724:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa9728:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa972c:	36d801d1	tbz	w17, #27, 0xfffff7fa9764
   0x0000fffff7fa9730:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa9734:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa9738:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa973c:	54000281	b.ne	0xfffff7fa978c  // b.any
   0x0000fffff7fa9740:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa9744:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9748:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa974c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa9750:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9754:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa9758:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa975c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa9760:	54000169	b.ls	0xfffff7fa978c  // b.plast
   0x0000fffff7fa9764:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa9768:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa976c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa9770:	36d80091	tbz	w17, #27, 0xfffff7fa9780
   0x0000fffff7fa9774:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9778:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa977c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa9780:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa9784:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa9788:	1400000e	b	0xfffff7fa97c0
   0x0000fffff7fa978c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9790:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9794:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9798:	aa1503e2	mov	x2, x21
   0x0000fffff7fa979c:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7fa97a0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa97a4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa97a8:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa97ac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa97b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa97b4:	d63f0200	blr	x16
   0x0000fffff7fa97b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa97bc:	54002a40	b.eq	0xfffff7fa9d04  // b.none
   0x0000fffff7fa97c0:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa97c4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa97c8:	540003a0	b.eq	0xfffff7fa983c  // b.none
   0x0000fffff7fa97cc:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa97d0:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa97d4:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa97d8:	36d801d1	tbz	w17, #27, 0xfffff7fa9810
   0x0000fffff7fa97dc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa97e0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa97e4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa97e8:	540002a1	b.ne	0xfffff7fa983c  // b.any
   0x0000fffff7fa97ec:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa97f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa97f4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa97f8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa97fc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9800:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa9804:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa9808:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa980c:	54000189	b.ls	0xfffff7fa983c  // b.plast
   0x0000fffff7fa9810:	36d8008d	tbz	w13, #27, 0xfffff7fa9820
   0x0000fffff7fa9814:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa9818:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa981c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa9820:	36d80091	tbz	w17, #27, 0xfffff7fa9830
   0x0000fffff7fa9824:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9828:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa982c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa9830:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa9834:	b900016d	str	w13, [x11]
   0x0000fffff7fa9838:	1400000e	b	0xfffff7fa9870
   0x0000fffff7fa983c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa9840:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9844:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9848:	aa1503e2	mov	x2, x21
   0x0000fffff7fa984c:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7fa9850:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9854:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9858:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa985c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9860:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9864:	d63f0200	blr	x16
   0x0000fffff7fa9868:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa986c:	54002500	b.eq	0xfffff7fa9d0c  // b.none
   0x0000fffff7fa9870:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa9874:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa9878:	540004a0	b.eq	0xfffff7fa990c  // b.none
   0x0000fffff7fa987c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa9880:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa9884:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa9888:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa988c:	54000400	b.eq	0xfffff7fa990c  // b.none
   0x0000fffff7fa9890:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa9894:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa9898:	36d801d1	tbz	w17, #27, 0xfffff7fa98d0
   0x0000fffff7fa989c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa98a0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa98a4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa98a8:	54000321	b.ne	0xfffff7fa990c  // b.any
   0x0000fffff7fa98ac:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa98b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa98b4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa98b8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa98bc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa98c0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa98c4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa98c8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa98cc:	54000209	b.ls	0xfffff7fa990c  // b.plast
   0x0000fffff7fa98d0:	36d8008d	tbz	w13, #27, 0xfffff7fa98e0
   0x0000fffff7fa98d4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa98d8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa98dc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa98e0:	36d80091	tbz	w17, #27, 0xfffff7fa98f0
   0x0000fffff7fa98e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa98e8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa98ec:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa98f0:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa98f4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa98f8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa98fc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa9900:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa9904:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa9908:	1400000e	b	0xfffff7fa9940
   0x0000fffff7fa990c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa9910:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9914:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9918:	aa1503e2	mov	x2, x21
   0x0000fffff7fa991c:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7fa9920:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9924:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9928:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa992c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9930:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9934:	d63f0200	blr	x16
   0x0000fffff7fa9938:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa993c:	54001ec0	b.eq	0xfffff7fa9d14  // b.none
   0x0000fffff7fa9940:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9944:	37d806a9	tbnz	w9, #27, 0xfffff7fa9a18
   0x0000fffff7fa9948:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa994c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9950:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9954:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9958:	540001c1	b.ne	0xfffff7fa9990  // b.any
   0x0000fffff7fa995c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa9960:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9964:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9968:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa996c:	54000121	b.ne	0xfffff7fa9990  // b.any
   0x0000fffff7fa9970:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa9974:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa9978:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa997c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9980:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9984:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa9988:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa998c:	14000030	b	0xfffff7fa9a4c
   0x0000fffff7fa9990:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9994:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9998:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa999c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa99a0:	54000120	b.eq	0xfffff7fa99c4  // b.none
   0x0000fffff7fa99a4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa99a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa99ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa99b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa99b4:	54000321	b.ne	0xfffff7fa9a18  // b.any
   0x0000fffff7fa99b8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa99bc:	9e620120	scvtf	d0, x9
   0x0000fffff7fa99c0:	14000002	b	0xfffff7fa99c8
   0x0000fffff7fa99c4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa99c8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa99cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa99d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa99d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa99d8:	54000120	b.eq	0xfffff7fa99fc  // b.none
   0x0000fffff7fa99dc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa99e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa99e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa99e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa99ec:	54000161	b.ne	0xfffff7fa9a18  // b.any
   0x0000fffff7fa99f0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa99f4:	9e620121	scvtf	d1, x9
   0x0000fffff7fa99f8:	14000002	b	0xfffff7fa9a00
   0x0000fffff7fa99fc:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa9a00:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa9a04:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa9a08:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9a0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9a10:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa9a14:	17ffffde	b	0xfffff7fa998c
   0x0000fffff7fa9a18:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9a1c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9a20:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9a24:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9a28:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7fa9a2c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9a30:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9a34:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa9a38:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9a3c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9a40:	d63f0200	blr	x16
   0x0000fffff7fa9a44:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9a48:	540016a0	b.eq	0xfffff7fa9d1c  // b.none
   0x0000fffff7fa9a4c:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa9a50:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa9a54:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa9a58:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa9a5c:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa9a60:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa9a64:	36d801d1	tbz	w17, #27, 0xfffff7fa9a9c
   0x0000fffff7fa9a68:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa9a6c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa9a70:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa9a74:	54000281	b.ne	0xfffff7fa9ac4  // b.any
   0x0000fffff7fa9a78:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa9a7c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9a80:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa9a84:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa9a88:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9a8c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa9a90:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa9a94:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa9a98:	54000169	b.ls	0xfffff7fa9ac4  // b.plast
   0x0000fffff7fa9a9c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa9aa0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa9aa4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa9aa8:	36d80091	tbz	w17, #27, 0xfffff7fa9ab8
   0x0000fffff7fa9aac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9ab0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa9ab4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa9ab8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa9abc:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa9ac0:	1400000e	b	0xfffff7fa9af8
   0x0000fffff7fa9ac4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9ac8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9acc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9ad0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9ad4:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7fa9ad8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9adc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9ae0:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa9ae4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9ae8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9aec:	d63f0200	blr	x16
   0x0000fffff7fa9af0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9af4:	54001180	b.eq	0xfffff7fa9d24  // b.none
   0x0000fffff7fa9af8:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa9afc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa9b00:	540003a0	b.eq	0xfffff7fa9b74  // b.none
   0x0000fffff7fa9b04:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa9b08:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa9b0c:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa9b10:	36d801d1	tbz	w17, #27, 0xfffff7fa9b48
   0x0000fffff7fa9b14:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa9b18:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa9b1c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa9b20:	540002a1	b.ne	0xfffff7fa9b74  // b.any
   0x0000fffff7fa9b24:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa9b28:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9b2c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa9b30:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa9b34:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9b38:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa9b3c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa9b40:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa9b44:	54000189	b.ls	0xfffff7fa9b74  // b.plast
   0x0000fffff7fa9b48:	36d8008d	tbz	w13, #27, 0xfffff7fa9b58
   0x0000fffff7fa9b4c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa9b50:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa9b54:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa9b58:	36d80091	tbz	w17, #27, 0xfffff7fa9b68
   0x0000fffff7fa9b5c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9b60:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa9b64:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa9b68:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa9b6c:	b900016d	str	w13, [x11]
   0x0000fffff7fa9b70:	1400000e	b	0xfffff7fa9ba8
   0x0000fffff7fa9b74:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa9b78:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9b7c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9b80:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9b84:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7fa9b88:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9b8c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9b90:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa9b94:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9b98:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9b9c:	d63f0200	blr	x16
   0x0000fffff7fa9ba0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9ba4:	54000c40	b.eq	0xfffff7fa9d2c  // b.none
   0x0000fffff7fa9ba8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9bac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9bb0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9bb4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9bb8:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7fa9bbc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9bc0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9bc4:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7fa9bc8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9bcc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9bd0:	d63f0200	blr	x16
   0x0000fffff7fa9bd4:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa9bd8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa9bdc:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa9be0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa9be4:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fa9be8:	d65f03c0	ret
   0x0000fffff7fa9bec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9bf0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9bf4:	b900028a	str	w10, [x20]
   0x0000fffff7fa9bf8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fa9bfc:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa9c00:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa9c04:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa9c08:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa9c0c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fa9c10:	d65f03c0	ret
   0x0000fffff7fa9c14:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fa9c18:	17fffff5	b	0xfffff7fa9bec
   0x0000fffff7fa9c1c:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fa9c20:	17fffff3	b	0xfffff7fa9bec
   0x0000fffff7fa9c24:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fa9c28:	17fffff1	b	0xfffff7fa9bec
   0x0000fffff7fa9c2c:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fa9c30:	17ffffef	b	0xfffff7fa9bec
   0x0000fffff7fa9c34:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fa9c38:	17ffffed	b	0xfffff7fa9bec
   0x0000fffff7fa9c3c:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fa9c40:	17ffffeb	b	0xfffff7fa9bec
   0x0000fffff7fa9c44:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fa9c48:	17ffffe9	b	0xfffff7fa9bec
   0x0000fffff7fa9c4c:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fa9c50:	17ffffe7	b	0xfffff7fa9bec
   0x0000fffff7fa9c54:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fa9c58:	17ffffe5	b	0xfffff7fa9bec
   0x0000fffff7fa9c5c:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fa9c60:	17ffffe3	b	0xfffff7fa9bec
   0x0000fffff7fa9c64:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fa9c68:	17ffffe1	b	0xfffff7fa9bec
   0x0000fffff7fa9c6c:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fa9c70:	17ffffdf	b	0xfffff7fa9bec
   0x0000fffff7fa9c74:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fa9c78:	17ffffdd	b	0xfffff7fa9bec
   0x0000fffff7fa9c7c:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fa9c80:	17ffffdb	b	0xfffff7fa9bec
   0x0000fffff7fa9c84:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fa9c88:	17ffffd9	b	0xfffff7fa9bec
   0x0000fffff7fa9c8c:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fa9c90:	17ffffd7	b	0xfffff7fa9bec
   0x0000fffff7fa9c94:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fa9c98:	17ffffd5	b	0xfffff7fa9bec
   0x0000fffff7fa9c9c:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fa9ca0:	17ffffd3	b	0xfffff7fa9bec
   0x0000fffff7fa9ca4:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fa9ca8:	17ffffd1	b	0xfffff7fa9bec
   0x0000fffff7fa9cac:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fa9cb0:	17ffffcf	b	0xfffff7fa9bec
   0x0000fffff7fa9cb4:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fa9cb8:	17ffffcd	b	0xfffff7fa9bec
   0x0000fffff7fa9cbc:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fa9cc0:	17ffffcb	b	0xfffff7fa9bec
   0x0000fffff7fa9cc4:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fa9cc8:	17ffffc9	b	0xfffff7fa9bec
   0x0000fffff7fa9ccc:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fa9cd0:	17ffffc7	b	0xfffff7fa9bec
   0x0000fffff7fa9cd4:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fa9cd8:	17ffffc5	b	0xfffff7fa9bec
   0x0000fffff7fa9cdc:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fa9ce0:	17ffffc3	b	0xfffff7fa9bec
   0x0000fffff7fa9ce4:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fa9ce8:	17ffffc1	b	0xfffff7fa9bec
   0x0000fffff7fa9cec:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fa9cf0:	17ffffbf	b	0xfffff7fa9bec
   0x0000fffff7fa9cf4:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7fa9cf8:	17ffffbd	b	0xfffff7fa9bec
   0x0000fffff7fa9cfc:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fa9d00:	17ffffbb	b	0xfffff7fa9bec
   0x0000fffff7fa9d04:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7fa9d08:	17ffffb9	b	0xfffff7fa9bec
   0x0000fffff7fa9d0c:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7fa9d10:	17ffffb7	b	0xfffff7fa9bec
   0x0000fffff7fa9d14:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7fa9d18:	17ffffb5	b	0xfffff7fa9bec
   0x0000fffff7fa9d1c:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7fa9d20:	17ffffb3	b	0xfffff7fa9bec
   0x0000fffff7fa9d24:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7fa9d28:	17ffffb1	b	0xfffff7fa9bec
   0x0000fffff7fa9d2c:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7fa9d30:	17ffffaf	b	0xfffff7fa9bec
   0x0000fffff7fa9d34:	00000000	udf	#0
   0x0000fffff7fa9d38:	00000000	udf	#0
   0x0000fffff7fa9d3c:	00000000	udf	#0
   0x0000fffff7fa9d40:	00000000	udf	#0
   0x0000fffff7fa9d44:	00000000	udf	#0
   0x0000fffff7fa9d48:	00000000	udf	#0
   0x0000fffff7fa9d4c:	00000000	udf	#0
   0x0000fffff7fa9d50:	00000000	udf	#0
   0x0000fffff7fa9d54:	00000000	udf	#0
   0x0000fffff7fa9d58:	00000000	udf	#0
   0x0000fffff7fa9d5c:	00000000	udf	#0
   0x0000fffff7fa9d60:	00000000	udf	#0
   0x0000fffff7fa9d64:	00000000	udf	#0
   0x0000fffff7fa9d68:	00000000	udf	#0
   0x0000fffff7fa9d6c:	00000000	udf	#0
   0x0000fffff7fa9d70:	00000000	udf	#0
   0x0000fffff7fa9d74:	00000000	udf	#0
   0x0000fffff7fa9d78:	00000000	udf	#0
   0x0000fffff7fa9d7c:	00000000	udf	#0
   0x0000fffff7fa9d80:	00000000	udf	#0
   0x0000fffff7fa9d84:	00000000	udf	#0
   0x0000fffff7fa9d88:	00000000	udf	#0
   0x0000fffff7fa9d8c:	00000000	udf	#0
   0x0000fffff7fa9d90:	00000000	udf	#0
   0x0000fffff7fa9d94:	00000000	udf	#0
   0x0000fffff7fa9d98:	00000000	udf	#0
   0x0000fffff7fa9d9c:	00000000	udf	#0
   0x0000fffff7fa9da0:	00000000	udf	#0
   0x0000fffff7fa9da4:	00000000	udf	#0
   0x0000fffff7fa9da8:	00000000	udf	#0
   0x0000fffff7fa9dac:	00000000	udf	#0
   0x0000fffff7fa9db0:	00000000	udf	#0
   0x0000fffff7fa9db4:	00000000	udf	#0
   0x0000fffff7fa9db8:	00000000	udf	#0
   0x0000fffff7fa9dbc:	00000000	udf	#0
   0x0000fffff7fa9dc0:	00000000	udf	#0
   0x0000fffff7fa9dc4:	00000000	udf	#0
   0x0000fffff7fa9dc8:	00000000	udf	#0
   0x0000fffff7fa9dcc:	00000000	udf	#0
   0x0000fffff7fa9dd0:	00000000	udf	#0
   0x0000fffff7fa9dd4:	00000000	udf	#0
   0x0000fffff7fa9dd8:	00000000	udf	#0
   0x0000fffff7fa9ddc:	00000000	udf	#0
   0x0000fffff7fa9de0:	00000000	udf	#0
   0x0000fffff7fa9de4:	00000000	udf	#0
   0x0000fffff7fa9de8:	00000000	udf	#0
   0x0000fffff7fa9dec:	00000000	udf	#0
   0x0000fffff7fa9df0:	00000000	udf	#0
   0x0000fffff7fa9df4:	00000000	udf	#0
   0x0000fffff7fa9df8:	00000000	udf	#0
   0x0000fffff7fa9dfc:	00000000	udf	#0
   0x0000fffff7fa9e00:	00000000	udf	#0
   0x0000fffff7fa9e04:	00000000	udf	#0
   0x0000fffff7fa9e08:	00000000	udf	#0
   0x0000fffff7fa9e0c:	00000000	udf	#0
   0x0000fffff7fa9e10:	00000000	udf	#0
   0x0000fffff7fa9e14:	00000000	udf	#0
   0x0000fffff7fa9e18:	00000000	udf	#0
   0x0000fffff7fa9e1c:	00000000	udf	#0
   0x0000fffff7fa9e20:	00000000	udf	#0
   0x0000fffff7fa9e24:	00000000	udf	#0
   0x0000fffff7fa9e28:	00000000	udf	#0
   0x0000fffff7fa9e2c:	00000000	udf	#0
   0x0000fffff7fa9e30:	00000000	udf	#0
   0x0000fffff7fa9e34:	00000000	udf	#0
   0x0000fffff7fa9e38:	00000000	udf	#0
   0x0000fffff7fa9e3c:	00000000	udf	#0
   0x0000fffff7fa9e40:	00000000	udf	#0
   0x0000fffff7fa9e44:	00000000	udf	#0
   0x0000fffff7fa9e48:	00000000	udf	#0
   0x0000fffff7fa9e4c:	00000000	udf	#0
   0x0000fffff7fa9e50:	00000000	udf	#0
   0x0000fffff7fa9e54:	00000000	udf	#0
   0x0000fffff7fa9e58:	00000000	udf	#0
   0x0000fffff7fa9e5c:	00000000	udf	#0
   0x0000fffff7fa9e60:	00000000	udf	#0
   0x0000fffff7fa9e64:	00000000	udf	#0
   0x0000fffff7fa9e68:	00000000	udf	#0
   0x0000fffff7fa9e6c:	00000000	udf	#0
   0x0000fffff7fa9e70:	00000000	udf	#0
   0x0000fffff7fa9e74:	00000000	udf	#0
   0x0000fffff7fa9e78:	00000000	udf	#0
   0x0000fffff7fa9e7c:	00000000	udf	#0
   0x0000fffff7fa9e80:	00000000	udf	#0
   0x0000fffff7fa9e84:	00000000	udf	#0
   0x0000fffff7fa9e88:	00000000	udf	#0
   0x0000fffff7fa9e8c:	00000000	udf	#0
   0x0000fffff7fa9e90:	00000000	udf	#0
   0x0000fffff7fa9e94:	00000000	udf	#0
   0x0000fffff7fa9e98:	00000000	udf	#0
   0x0000fffff7fa9e9c:	00000000	udf	#0
   0x0000fffff7fa9ea0:	00000000	udf	#0
   0x0000fffff7fa9ea4:	00000000	udf	#0
   0x0000fffff7fa9ea8:	00000000	udf	#0
   0x0000fffff7fa9eac:	00000000	udf	#0
   0x0000fffff7fa9eb0:	00000000	udf	#0
   0x0000fffff7fa9eb4:	00000000	udf	#0
   0x0000fffff7fa9eb8:	00000000	udf	#0
   0x0000fffff7fa9ebc:	00000000	udf	#0
   0x0000fffff7fa9ec0:	00000000	udf	#0
   0x0000fffff7fa9ec4:	00000000	udf	#0
   0x0000fffff7fa9ec8:	00000000	udf	#0
   0x0000fffff7fa9ecc:	00000000	udf	#0
   0x0000fffff7fa9ed0:	00000000	udf	#0
   0x0000fffff7fa9ed4:	00000000	udf	#0
   0x0000fffff7fa9ed8:	00000000	udf	#0
   0x0000fffff7fa9edc:	00000000	udf	#0
   0x0000fffff7fa9ee0:	00000000	udf	#0
   0x0000fffff7fa9ee4:	00000000	udf	#0
   0x0000fffff7fa9ee8:	00000000	udf	#0
   0x0000fffff7fa9eec:	00000000	udf	#0
   0x0000fffff7fa9ef0:	00000000	udf	#0
   0x0000fffff7fa9ef4:	00000000	udf	#0
   0x0000fffff7fa9ef8:	00000000	udf	#0
   0x0000fffff7fa9efc:	00000000	udf	#0
   0x0000fffff7fa9f00:	00000000	udf	#0
   0x0000fffff7fa9f04:	00000000	udf	#0
   0x0000fffff7fa9f08:	00000000	udf	#0
   0x0000fffff7fa9f0c:	00000000	udf	#0
   0x0000fffff7fa9f10:	00000000	udf	#0
   0x0000fffff7fa9f14:	00000000	udf	#0
   0x0000fffff7fa9f18:	00000000	udf	#0
   0x0000fffff7fa9f1c:	00000000	udf	#0
   0x0000fffff7fa9f20:	00000000	udf	#0
   0x0000fffff7fa9f24:	00000000	udf	#0
   0x0000fffff7fa9f28:	00000000	udf	#0
   0x0000fffff7fa9f2c:	00000000	udf	#0
   0x0000fffff7fa9f30:	00000000	udf	#0
   0x0000fffff7fa9f34:	00000000	udf	#0
   0x0000fffff7fa9f38:	00000000	udf	#0
   0x0000fffff7fa9f3c:	00000000	udf	#0
   0x0000fffff7fa9f40:	00000000	udf	#0
   0x0000fffff7fa9f44:	00000000	udf	#0
   0x0000fffff7fa9f48:	00000000	udf	#0
   0x0000fffff7fa9f4c:	00000000	udf	#0
   0x0000fffff7fa9f50:	00000000	udf	#0
   0x0000fffff7fa9f54:	00000000	udf	#0
   0x0000fffff7fa9f58:	00000000	udf	#0
   0x0000fffff7fa9f5c:	00000000	udf	#0
   0x0000fffff7fa9f60:	00000000	udf	#0
   0x0000fffff7fa9f64:	00000000	udf	#0
   0x0000fffff7fa9f68:	00000000	udf	#0
   0x0000fffff7fa9f6c:	00000000	udf	#0
   0x0000fffff7fa9f70:	00000000	udf	#0
   0x0000fffff7fa9f74:	00000000	udf	#0
   0x0000fffff7fa9f78:	00000000	udf	#0
   0x0000fffff7fa9f7c:	00000000	udf	#0
   0x0000fffff7fa9f80:	00000000	udf	#0
   0x0000fffff7fa9f84:	00000000	udf	#0
   0x0000fffff7fa9f88:	00000000	udf	#0
   0x0000fffff7fa9f8c:	00000000	udf	#0
   0x0000fffff7fa9f90:	00000000	udf	#0
   0x0000fffff7fa9f94:	00000000	udf	#0
   0x0000fffff7fa9f98:	00000000	udf	#0
   0x0000fffff7fa9f9c:	00000000	udf	#0
   0x0000fffff7fa9fa0:	00000000	udf	#0
   0x0000fffff7fa9fa4:	00000000	udf	#0
   0x0000fffff7fa9fa8:	00000000	udf	#0
   0x0000fffff7fa9fac:	00000000	udf	#0
   0x0000fffff7fa9fb0:	00000000	udf	#0
   0x0000fffff7fa9fb4:	00000000	udf	#0
   0x0000fffff7fa9fb8:	00000000	udf	#0
   0x0000fffff7fa9fbc:	00000000	udf	#0
   0x0000fffff7fa9fc0:	00000000	udf	#0
   0x0000fffff7fa9fc4:	00000000	udf	#0
   0x0000fffff7fa9fc8:	00000000	udf	#0
   0x0000fffff7fa9fcc:	00000000	udf	#0
   0x0000fffff7fa9fd0:	00000000	udf	#0
   0x0000fffff7fa9fd4:	00000000	udf	#0
   0x0000fffff7fa9fd8:	00000000	udf	#0
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
