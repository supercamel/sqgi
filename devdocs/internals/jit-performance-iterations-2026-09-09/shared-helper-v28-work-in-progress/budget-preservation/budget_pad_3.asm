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
   0x0000fffff7fb8058:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb805c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb8060:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb8064:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb8068:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb806c:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7fb8070:	36d801d1	tbz	w17, #27, 0xfffff7fb80a8
   0x0000fffff7fb8074:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb8078:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb807c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb8080:	54000281	b.ne	0xfffff7fb80d0  // b.any
   0x0000fffff7fb8084:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7fb8088:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb808c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb8090:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb8094:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb8098:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb809c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb80a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb80a4:	54000169	b.ls	0xfffff7fb80d0  // b.plast
   0x0000fffff7fb80a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb80ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb80b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb80b4:	36d80091	tbz	w17, #27, 0xfffff7fb80c4
   0x0000fffff7fb80b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb80bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb80c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb80c4:	f900166c	str	x12, [x19, #40]
   0x0000fffff7fb80c8:	b900226d	str	w13, [x19, #32]
   0x0000fffff7fb80cc:	1400000e	b	0xfffff7fb8104
   0x0000fffff7fb80d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb80d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb80d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb80dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb80e0:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fb80e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb80e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb80ec:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7fb80f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb80f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb80f8:	d63f0200	blr	x16
   0x0000fffff7fb80fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb8100:	5400d7a0	b.eq	0xfffff7fb9bf4  // b.none
   0x0000fffff7fb8104:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb8108:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb810c:	d280002c	mov	x12, #0x1                   	// #1
   0x0000fffff7fb8110:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb8114:	36d80211	tbz	w17, #27, 0xfffff7fb8154
   0x0000fffff7fb8118:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb811c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb8120:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb8124:	540001e1	b.ne	0xfffff7fb8160  // b.any
   0x0000fffff7fb8128:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb812c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8130:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb8134:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb8138:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb813c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb8140:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb8144:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb8148:	540000c9	b.ls	0xfffff7fb8160  // b.plast
   0x0000fffff7fb814c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb8150:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb8154:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb8158:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb815c:	1400000e	b	0xfffff7fb8194
   0x0000fffff7fb8160:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb8164:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb8168:	aa1303e1	mov	x1, x19
   0x0000fffff7fb816c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb8170:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fb8174:	aa1403e4	mov	x4, x20
   0x0000fffff7fb8178:	aa1603e5	mov	x5, x22
   0x0000fffff7fb817c:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7fb8180:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb8184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb8188:	d63f0200	blr	x16
   0x0000fffff7fb818c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb8190:	5400d360	b.eq	0xfffff7fb9bfc  // b.none
   0x0000fffff7fb8194:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb8198:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb819c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb81a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb81a4:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fb81a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb81ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fb81b0:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7fb81b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb81b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb81bc:	d63f0200	blr	x16
   0x0000fffff7fb81c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb81c4:	5400d200	b.eq	0xfffff7fb9c04  // b.none
   0x0000fffff7fb81c8:	14000001	b	0xfffff7fb81cc
   0x0000fffff7fb81cc:	14000001	b	0xfffff7fb81d0
   0x0000fffff7fb81d0:	14000001	b	0xfffff7fb81d4
   0x0000fffff7fb81d4:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb81d8:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb81dc:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fb81e0:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb81e4:	36d80211	tbz	w17, #27, 0xfffff7fb8224
   0x0000fffff7fb81e8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb81ec:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb81f0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb81f4:	540001e1	b.ne	0xfffff7fb8230  // b.any
   0x0000fffff7fb81f8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb81fc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8200:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb8204:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb8208:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb820c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb8210:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb8214:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb8218:	540000c9	b.ls	0xfffff7fb8230  // b.plast
   0x0000fffff7fb821c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb8220:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb8224:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb8228:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb822c:	1400000e	b	0xfffff7fb8264
   0x0000fffff7fb8230:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb8234:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb8238:	aa1303e1	mov	x1, x19
   0x0000fffff7fb823c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb8240:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fb8244:	aa1403e4	mov	x4, x20
   0x0000fffff7fb8248:	aa1603e5	mov	x5, x22
   0x0000fffff7fb824c:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7fb8250:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb8254:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb8258:	d63f0200	blr	x16
   0x0000fffff7fb825c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb8260:	5400cd60	b.eq	0xfffff7fb9c0c  // b.none
   0x0000fffff7fb8264:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb8268:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb826c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb8270:	aa1503e2	mov	x2, x21
   0x0000fffff7fb8274:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fb8278:	aa1403e4	mov	x4, x20
   0x0000fffff7fb827c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb8280:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb8284:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb8288:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb828c:	d63f0200	blr	x16
   0x0000fffff7fb8290:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb8294:	5400cc00	b.eq	0xfffff7fb9c14  // b.none
   0x0000fffff7fb8298:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb829c:	37d806a9	tbnz	w9, #27, 0xfffff7fb8370
   0x0000fffff7fb82a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb82a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb82a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb82ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb82b0:	540001c1	b.ne	0xfffff7fb82e8  // b.any
   0x0000fffff7fb82b4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb82b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb82bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb82c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb82c4:	54000121	b.ne	0xfffff7fb82e8  // b.any
   0x0000fffff7fb82c8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb82cc:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb82d0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb82d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb82d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb82dc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb82e0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb82e4:	14000030	b	0xfffff7fb83a4
   0x0000fffff7fb82e8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb82ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb82f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb82f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb82f8:	54000120	b.eq	0xfffff7fb831c  // b.none
   0x0000fffff7fb82fc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb8300:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8304:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8308:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb830c:	54000321	b.ne	0xfffff7fb8370  // b.any
   0x0000fffff7fb8310:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb8314:	9e620120	scvtf	d0, x9
   0x0000fffff7fb8318:	14000002	b	0xfffff7fb8320
   0x0000fffff7fb831c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb8320:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb8324:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb8328:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb832c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8330:	54000120	b.eq	0xfffff7fb8354  // b.none
   0x0000fffff7fb8334:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb8338:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb833c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8340:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8344:	54000161	b.ne	0xfffff7fb8370  // b.any
   0x0000fffff7fb8348:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb834c:	9e620121	scvtf	d1, x9
   0x0000fffff7fb8350:	14000002	b	0xfffff7fb8358
   0x0000fffff7fb8354:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb8358:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb835c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb8360:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb8364:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8368:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb836c:	17ffffde	b	0xfffff7fb82e4
   0x0000fffff7fb8370:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb8374:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb8378:	aa1303e1	mov	x1, x19
   0x0000fffff7fb837c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb8380:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fb8384:	aa1403e4	mov	x4, x20
   0x0000fffff7fb8388:	aa1603e5	mov	x5, x22
   0x0000fffff7fb838c:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7fb8390:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb8394:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb8398:	d63f0200	blr	x16
   0x0000fffff7fb839c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb83a0:	5400c3e0	b.eq	0xfffff7fb9c1c  // b.none
   0x0000fffff7fb83a4:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb83a8:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb83ac:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb83b0:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb83b4:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb83b8:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb83bc:	36d801d1	tbz	w17, #27, 0xfffff7fb83f4
   0x0000fffff7fb83c0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb83c4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb83c8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb83cc:	54000281	b.ne	0xfffff7fb841c  // b.any
   0x0000fffff7fb83d0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb83d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb83d8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb83dc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb83e0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb83e4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb83e8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb83ec:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb83f0:	54000169	b.ls	0xfffff7fb841c  // b.plast
   0x0000fffff7fb83f4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb83f8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb83fc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb8400:	36d80091	tbz	w17, #27, 0xfffff7fb8410
   0x0000fffff7fb8404:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8408:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb840c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb8410:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb8414:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb8418:	1400000e	b	0xfffff7fb8450
   0x0000fffff7fb841c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb8420:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb8424:	aa1303e1	mov	x1, x19
   0x0000fffff7fb8428:	aa1503e2	mov	x2, x21
   0x0000fffff7fb842c:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fb8430:	aa1403e4	mov	x4, x20
   0x0000fffff7fb8434:	aa1603e5	mov	x5, x22
   0x0000fffff7fb8438:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7fb843c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb8440:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb8444:	d63f0200	blr	x16
   0x0000fffff7fb8448:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb844c:	5400bec0	b.eq	0xfffff7fb9c24  // b.none
   0x0000fffff7fb8450:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb8454:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb8458:	540003a0	b.eq	0xfffff7fb84cc  // b.none
   0x0000fffff7fb845c:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb8460:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb8464:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb8468:	36d801d1	tbz	w17, #27, 0xfffff7fb84a0
   0x0000fffff7fb846c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb8470:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb8474:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb8478:	540002a1	b.ne	0xfffff7fb84cc  // b.any
   0x0000fffff7fb847c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb8480:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8484:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb8488:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb848c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb8490:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb8494:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb8498:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb849c:	54000189	b.ls	0xfffff7fb84cc  // b.plast
   0x0000fffff7fb84a0:	36d8008d	tbz	w13, #27, 0xfffff7fb84b0
   0x0000fffff7fb84a4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb84a8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb84ac:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb84b0:	36d80091	tbz	w17, #27, 0xfffff7fb84c0
   0x0000fffff7fb84b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb84b8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb84bc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb84c0:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb84c4:	b900016d	str	w13, [x11]
   0x0000fffff7fb84c8:	1400000e	b	0xfffff7fb8500
   0x0000fffff7fb84cc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb84d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb84d4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb84d8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb84dc:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fb84e0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb84e4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb84e8:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7fb84ec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb84f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb84f4:	d63f0200	blr	x16
   0x0000fffff7fb84f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb84fc:	5400b980	b.eq	0xfffff7fb9c2c  // b.none
   0x0000fffff7fb8500:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb8504:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb8508:	540004a0	b.eq	0xfffff7fb859c  // b.none
   0x0000fffff7fb850c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb8510:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb8514:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb8518:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb851c:	54000400	b.eq	0xfffff7fb859c  // b.none
   0x0000fffff7fb8520:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb8524:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb8528:	36d801d1	tbz	w17, #27, 0xfffff7fb8560
   0x0000fffff7fb852c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb8530:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb8534:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb8538:	54000321	b.ne	0xfffff7fb859c  // b.any
   0x0000fffff7fb853c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb8540:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8544:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb8548:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb854c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb8550:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb8554:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb8558:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb855c:	54000209	b.ls	0xfffff7fb859c  // b.plast
   0x0000fffff7fb8560:	36d8008d	tbz	w13, #27, 0xfffff7fb8570
   0x0000fffff7fb8564:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb8568:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb856c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb8570:	36d80091	tbz	w17, #27, 0xfffff7fb8580
   0x0000fffff7fb8574:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8578:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb857c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb8580:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb8584:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb8588:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb858c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb8590:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb8594:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb8598:	1400000e	b	0xfffff7fb85d0
   0x0000fffff7fb859c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb85a0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb85a4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb85a8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb85ac:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fb85b0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb85b4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb85b8:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb85bc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb85c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb85c4:	d63f0200	blr	x16
   0x0000fffff7fb85c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb85cc:	5400b340	b.eq	0xfffff7fb9c34  // b.none
   0x0000fffff7fb85d0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb85d4:	37d806a9	tbnz	w9, #27, 0xfffff7fb86a8
   0x0000fffff7fb85d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb85dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb85e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb85e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb85e8:	540001c1	b.ne	0xfffff7fb8620  // b.any
   0x0000fffff7fb85ec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb85f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb85f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb85f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb85fc:	54000121	b.ne	0xfffff7fb8620  // b.any
   0x0000fffff7fb8600:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb8604:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb8608:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb860c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8610:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8614:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb8618:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb861c:	14000030	b	0xfffff7fb86dc
   0x0000fffff7fb8620:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb8624:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb8628:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb862c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8630:	54000120	b.eq	0xfffff7fb8654  // b.none
   0x0000fffff7fb8634:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb8638:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb863c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8640:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8644:	54000321	b.ne	0xfffff7fb86a8  // b.any
   0x0000fffff7fb8648:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb864c:	9e620120	scvtf	d0, x9
   0x0000fffff7fb8650:	14000002	b	0xfffff7fb8658
   0x0000fffff7fb8654:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb8658:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb865c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb8660:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8664:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8668:	54000120	b.eq	0xfffff7fb868c  // b.none
   0x0000fffff7fb866c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb8670:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8674:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8678:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb867c:	54000161	b.ne	0xfffff7fb86a8  // b.any
   0x0000fffff7fb8680:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb8684:	9e620121	scvtf	d1, x9
   0x0000fffff7fb8688:	14000002	b	0xfffff7fb8690
   0x0000fffff7fb868c:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb8690:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb8694:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb8698:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb869c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb86a0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb86a4:	17ffffde	b	0xfffff7fb861c
   0x0000fffff7fb86a8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb86ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb86b0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb86b4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb86b8:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fb86bc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb86c0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb86c4:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7fb86c8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb86cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb86d0:	d63f0200	blr	x16
   0x0000fffff7fb86d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb86d8:	5400ab20	b.eq	0xfffff7fb9c3c  // b.none
   0x0000fffff7fb86dc:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb86e0:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb86e4:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb86e8:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb86ec:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb86f0:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb86f4:	36d801d1	tbz	w17, #27, 0xfffff7fb872c
   0x0000fffff7fb86f8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb86fc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb8700:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb8704:	54000281	b.ne	0xfffff7fb8754  // b.any
   0x0000fffff7fb8708:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb870c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8710:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb8714:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb8718:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb871c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb8720:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb8724:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb8728:	54000169	b.ls	0xfffff7fb8754  // b.plast
   0x0000fffff7fb872c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb8730:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb8734:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb8738:	36d80091	tbz	w17, #27, 0xfffff7fb8748
   0x0000fffff7fb873c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8740:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb8744:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb8748:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb874c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb8750:	1400000e	b	0xfffff7fb8788
   0x0000fffff7fb8754:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb8758:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb875c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb8760:	aa1503e2	mov	x2, x21
   0x0000fffff7fb8764:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fb8768:	aa1403e4	mov	x4, x20
   0x0000fffff7fb876c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb8770:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7fb8774:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb8778:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb877c:	d63f0200	blr	x16
   0x0000fffff7fb8780:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb8784:	5400a600	b.eq	0xfffff7fb9c44  // b.none
   0x0000fffff7fb8788:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb878c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb8790:	540003a0	b.eq	0xfffff7fb8804  // b.none
   0x0000fffff7fb8794:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb8798:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb879c:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb87a0:	36d801d1	tbz	w17, #27, 0xfffff7fb87d8
   0x0000fffff7fb87a4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb87a8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb87ac:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb87b0:	540002a1	b.ne	0xfffff7fb8804  // b.any
   0x0000fffff7fb87b4:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb87b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb87bc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb87c0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb87c4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb87c8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb87cc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb87d0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb87d4:	54000189	b.ls	0xfffff7fb8804  // b.plast
   0x0000fffff7fb87d8:	36d8008d	tbz	w13, #27, 0xfffff7fb87e8
   0x0000fffff7fb87dc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb87e0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb87e4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb87e8:	36d80091	tbz	w17, #27, 0xfffff7fb87f8
   0x0000fffff7fb87ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb87f0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb87f4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb87f8:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb87fc:	b900016d	str	w13, [x11]
   0x0000fffff7fb8800:	1400000e	b	0xfffff7fb8838
   0x0000fffff7fb8804:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb8808:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb880c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb8810:	aa1503e2	mov	x2, x21
   0x0000fffff7fb8814:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fb8818:	aa1403e4	mov	x4, x20
   0x0000fffff7fb881c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb8820:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7fb8824:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb8828:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb882c:	d63f0200	blr	x16
   0x0000fffff7fb8830:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb8834:	5400a0c0	b.eq	0xfffff7fb9c4c  // b.none
   0x0000fffff7fb8838:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb883c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb8840:	540004a0	b.eq	0xfffff7fb88d4  // b.none
   0x0000fffff7fb8844:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb8848:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb884c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb8850:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb8854:	54000400	b.eq	0xfffff7fb88d4  // b.none
   0x0000fffff7fb8858:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb885c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb8860:	36d801d1	tbz	w17, #27, 0xfffff7fb8898
   0x0000fffff7fb8864:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb8868:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb886c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb8870:	54000321	b.ne	0xfffff7fb88d4  // b.any
   0x0000fffff7fb8874:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb8878:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb887c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb8880:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb8884:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb8888:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb888c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb8890:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb8894:	54000209	b.ls	0xfffff7fb88d4  // b.plast
   0x0000fffff7fb8898:	36d8008d	tbz	w13, #27, 0xfffff7fb88a8
   0x0000fffff7fb889c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb88a0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb88a4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb88a8:	36d80091	tbz	w17, #27, 0xfffff7fb88b8
   0x0000fffff7fb88ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb88b0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb88b4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb88b8:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb88bc:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb88c0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb88c4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb88c8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb88cc:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb88d0:	1400000e	b	0xfffff7fb8908
   0x0000fffff7fb88d4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb88d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb88dc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb88e0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb88e4:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fb88e8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb88ec:	aa1603e5	mov	x5, x22
   0x0000fffff7fb88f0:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb88f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb88f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb88fc:	d63f0200	blr	x16
   0x0000fffff7fb8900:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb8904:	54009a80	b.eq	0xfffff7fb9c54  // b.none
   0x0000fffff7fb8908:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb890c:	37d806a9	tbnz	w9, #27, 0xfffff7fb89e0
   0x0000fffff7fb8910:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb8914:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8918:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb891c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8920:	540001c1	b.ne	0xfffff7fb8958  // b.any
   0x0000fffff7fb8924:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb8928:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb892c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8930:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8934:	54000121	b.ne	0xfffff7fb8958  // b.any
   0x0000fffff7fb8938:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb893c:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb8940:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb8944:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8948:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb894c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb8950:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb8954:	14000030	b	0xfffff7fb8a14
   0x0000fffff7fb8958:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb895c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb8960:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8964:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8968:	54000120	b.eq	0xfffff7fb898c  // b.none
   0x0000fffff7fb896c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb8970:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8974:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8978:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb897c:	54000321	b.ne	0xfffff7fb89e0  // b.any
   0x0000fffff7fb8980:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb8984:	9e620120	scvtf	d0, x9
   0x0000fffff7fb8988:	14000002	b	0xfffff7fb8990
   0x0000fffff7fb898c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb8990:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb8994:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb8998:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb899c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb89a0:	54000120	b.eq	0xfffff7fb89c4  // b.none
   0x0000fffff7fb89a4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb89a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb89ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb89b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb89b4:	54000161	b.ne	0xfffff7fb89e0  // b.any
   0x0000fffff7fb89b8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb89bc:	9e620121	scvtf	d1, x9
   0x0000fffff7fb89c0:	14000002	b	0xfffff7fb89c8
   0x0000fffff7fb89c4:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb89c8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb89cc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb89d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb89d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb89d8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb89dc:	17ffffde	b	0xfffff7fb8954
   0x0000fffff7fb89e0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb89e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb89e8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb89ec:	aa1503e2	mov	x2, x21
   0x0000fffff7fb89f0:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fb89f4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb89f8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb89fc:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7fb8a00:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb8a04:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb8a08:	d63f0200	blr	x16
   0x0000fffff7fb8a0c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb8a10:	54009260	b.eq	0xfffff7fb9c5c  // b.none
   0x0000fffff7fb8a14:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb8a18:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb8a1c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb8a20:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb8a24:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb8a28:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb8a2c:	36d801d1	tbz	w17, #27, 0xfffff7fb8a64
   0x0000fffff7fb8a30:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb8a34:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb8a38:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb8a3c:	54000281	b.ne	0xfffff7fb8a8c  // b.any
   0x0000fffff7fb8a40:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb8a44:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8a48:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb8a4c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb8a50:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb8a54:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb8a58:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb8a5c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb8a60:	54000169	b.ls	0xfffff7fb8a8c  // b.plast
   0x0000fffff7fb8a64:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb8a68:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb8a6c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb8a70:	36d80091	tbz	w17, #27, 0xfffff7fb8a80
   0x0000fffff7fb8a74:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8a78:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb8a7c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb8a80:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb8a84:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb8a88:	1400000e	b	0xfffff7fb8ac0
   0x0000fffff7fb8a8c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb8a90:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb8a94:	aa1303e1	mov	x1, x19
   0x0000fffff7fb8a98:	aa1503e2	mov	x2, x21
   0x0000fffff7fb8a9c:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fb8aa0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb8aa4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb8aa8:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7fb8aac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb8ab0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb8ab4:	d63f0200	blr	x16
   0x0000fffff7fb8ab8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb8abc:	54008d40	b.eq	0xfffff7fb9c64  // b.none
   0x0000fffff7fb8ac0:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb8ac4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb8ac8:	540003a0	b.eq	0xfffff7fb8b3c  // b.none
   0x0000fffff7fb8acc:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb8ad0:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb8ad4:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb8ad8:	36d801d1	tbz	w17, #27, 0xfffff7fb8b10
   0x0000fffff7fb8adc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb8ae0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb8ae4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb8ae8:	540002a1	b.ne	0xfffff7fb8b3c  // b.any
   0x0000fffff7fb8aec:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb8af0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8af4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb8af8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb8afc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb8b00:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb8b04:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb8b08:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb8b0c:	54000189	b.ls	0xfffff7fb8b3c  // b.plast
   0x0000fffff7fb8b10:	36d8008d	tbz	w13, #27, 0xfffff7fb8b20
   0x0000fffff7fb8b14:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb8b18:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb8b1c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb8b20:	36d80091	tbz	w17, #27, 0xfffff7fb8b30
   0x0000fffff7fb8b24:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8b28:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb8b2c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb8b30:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb8b34:	b900016d	str	w13, [x11]
   0x0000fffff7fb8b38:	1400000e	b	0xfffff7fb8b70
   0x0000fffff7fb8b3c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb8b40:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb8b44:	aa1303e1	mov	x1, x19
   0x0000fffff7fb8b48:	aa1503e2	mov	x2, x21
   0x0000fffff7fb8b4c:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fb8b50:	aa1403e4	mov	x4, x20
   0x0000fffff7fb8b54:	aa1603e5	mov	x5, x22
   0x0000fffff7fb8b58:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7fb8b5c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb8b60:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb8b64:	d63f0200	blr	x16
   0x0000fffff7fb8b68:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb8b6c:	54008800	b.eq	0xfffff7fb9c6c  // b.none
   0x0000fffff7fb8b70:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb8b74:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb8b78:	540004a0	b.eq	0xfffff7fb8c0c  // b.none
   0x0000fffff7fb8b7c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb8b80:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb8b84:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb8b88:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb8b8c:	54000400	b.eq	0xfffff7fb8c0c  // b.none
   0x0000fffff7fb8b90:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb8b94:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb8b98:	36d801d1	tbz	w17, #27, 0xfffff7fb8bd0
   0x0000fffff7fb8b9c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb8ba0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb8ba4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb8ba8:	54000321	b.ne	0xfffff7fb8c0c  // b.any
   0x0000fffff7fb8bac:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb8bb0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8bb4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb8bb8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb8bbc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb8bc0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb8bc4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb8bc8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb8bcc:	54000209	b.ls	0xfffff7fb8c0c  // b.plast
   0x0000fffff7fb8bd0:	36d8008d	tbz	w13, #27, 0xfffff7fb8be0
   0x0000fffff7fb8bd4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb8bd8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb8bdc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb8be0:	36d80091	tbz	w17, #27, 0xfffff7fb8bf0
   0x0000fffff7fb8be4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8be8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb8bec:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb8bf0:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb8bf4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb8bf8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb8bfc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb8c00:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb8c04:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb8c08:	1400000e	b	0xfffff7fb8c40
   0x0000fffff7fb8c0c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb8c10:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb8c14:	aa1303e1	mov	x1, x19
   0x0000fffff7fb8c18:	aa1503e2	mov	x2, x21
   0x0000fffff7fb8c1c:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fb8c20:	aa1403e4	mov	x4, x20
   0x0000fffff7fb8c24:	aa1603e5	mov	x5, x22
   0x0000fffff7fb8c28:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb8c2c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb8c30:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb8c34:	d63f0200	blr	x16
   0x0000fffff7fb8c38:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb8c3c:	540081c0	b.eq	0xfffff7fb9c74  // b.none
   0x0000fffff7fb8c40:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb8c44:	37d806a9	tbnz	w9, #27, 0xfffff7fb8d18
   0x0000fffff7fb8c48:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb8c4c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8c50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8c54:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8c58:	540001c1	b.ne	0xfffff7fb8c90  // b.any
   0x0000fffff7fb8c5c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb8c60:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8c64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8c68:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8c6c:	54000121	b.ne	0xfffff7fb8c90  // b.any
   0x0000fffff7fb8c70:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb8c74:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb8c78:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb8c7c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8c80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8c84:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb8c88:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb8c8c:	14000030	b	0xfffff7fb8d4c
   0x0000fffff7fb8c90:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb8c94:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb8c98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8c9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8ca0:	54000120	b.eq	0xfffff7fb8cc4  // b.none
   0x0000fffff7fb8ca4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb8ca8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8cac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8cb0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8cb4:	54000321	b.ne	0xfffff7fb8d18  // b.any
   0x0000fffff7fb8cb8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb8cbc:	9e620120	scvtf	d0, x9
   0x0000fffff7fb8cc0:	14000002	b	0xfffff7fb8cc8
   0x0000fffff7fb8cc4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb8cc8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb8ccc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb8cd0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8cd4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8cd8:	54000120	b.eq	0xfffff7fb8cfc  // b.none
   0x0000fffff7fb8cdc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb8ce0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8ce4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8ce8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8cec:	54000161	b.ne	0xfffff7fb8d18  // b.any
   0x0000fffff7fb8cf0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb8cf4:	9e620121	scvtf	d1, x9
   0x0000fffff7fb8cf8:	14000002	b	0xfffff7fb8d00
   0x0000fffff7fb8cfc:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb8d00:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb8d04:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb8d08:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb8d0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8d10:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb8d14:	17ffffde	b	0xfffff7fb8c8c
   0x0000fffff7fb8d18:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb8d1c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb8d20:	aa1303e1	mov	x1, x19
   0x0000fffff7fb8d24:	aa1503e2	mov	x2, x21
   0x0000fffff7fb8d28:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fb8d2c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb8d30:	aa1603e5	mov	x5, x22
   0x0000fffff7fb8d34:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7fb8d38:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb8d3c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb8d40:	d63f0200	blr	x16
   0x0000fffff7fb8d44:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb8d48:	540079a0	b.eq	0xfffff7fb9c7c  // b.none
   0x0000fffff7fb8d4c:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb8d50:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb8d54:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb8d58:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb8d5c:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb8d60:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb8d64:	36d801d1	tbz	w17, #27, 0xfffff7fb8d9c
   0x0000fffff7fb8d68:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb8d6c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb8d70:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb8d74:	54000281	b.ne	0xfffff7fb8dc4  // b.any
   0x0000fffff7fb8d78:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb8d7c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8d80:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb8d84:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb8d88:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb8d8c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb8d90:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb8d94:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb8d98:	54000169	b.ls	0xfffff7fb8dc4  // b.plast
   0x0000fffff7fb8d9c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb8da0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb8da4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb8da8:	36d80091	tbz	w17, #27, 0xfffff7fb8db8
   0x0000fffff7fb8dac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8db0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb8db4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb8db8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb8dbc:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb8dc0:	1400000e	b	0xfffff7fb8df8
   0x0000fffff7fb8dc4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb8dc8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb8dcc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb8dd0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb8dd4:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fb8dd8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb8ddc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb8de0:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7fb8de4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb8de8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb8dec:	d63f0200	blr	x16
   0x0000fffff7fb8df0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb8df4:	54007480	b.eq	0xfffff7fb9c84  // b.none
   0x0000fffff7fb8df8:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb8dfc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb8e00:	540003a0	b.eq	0xfffff7fb8e74  // b.none
   0x0000fffff7fb8e04:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb8e08:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb8e0c:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb8e10:	36d801d1	tbz	w17, #27, 0xfffff7fb8e48
   0x0000fffff7fb8e14:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb8e18:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb8e1c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb8e20:	540002a1	b.ne	0xfffff7fb8e74  // b.any
   0x0000fffff7fb8e24:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb8e28:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8e2c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb8e30:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb8e34:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb8e38:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb8e3c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb8e40:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb8e44:	54000189	b.ls	0xfffff7fb8e74  // b.plast
   0x0000fffff7fb8e48:	36d8008d	tbz	w13, #27, 0xfffff7fb8e58
   0x0000fffff7fb8e4c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb8e50:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb8e54:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb8e58:	36d80091	tbz	w17, #27, 0xfffff7fb8e68
   0x0000fffff7fb8e5c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8e60:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb8e64:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb8e68:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb8e6c:	b900016d	str	w13, [x11]
   0x0000fffff7fb8e70:	1400000e	b	0xfffff7fb8ea8
   0x0000fffff7fb8e74:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb8e78:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb8e7c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb8e80:	aa1503e2	mov	x2, x21
   0x0000fffff7fb8e84:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fb8e88:	aa1403e4	mov	x4, x20
   0x0000fffff7fb8e8c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb8e90:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7fb8e94:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb8e98:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb8e9c:	d63f0200	blr	x16
   0x0000fffff7fb8ea0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb8ea4:	54006f40	b.eq	0xfffff7fb9c8c  // b.none
   0x0000fffff7fb8ea8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb8eac:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb8eb0:	540004a0	b.eq	0xfffff7fb8f44  // b.none
   0x0000fffff7fb8eb4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb8eb8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb8ebc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb8ec0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb8ec4:	54000400	b.eq	0xfffff7fb8f44  // b.none
   0x0000fffff7fb8ec8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb8ecc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb8ed0:	36d801d1	tbz	w17, #27, 0xfffff7fb8f08
   0x0000fffff7fb8ed4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb8ed8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb8edc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb8ee0:	54000321	b.ne	0xfffff7fb8f44  // b.any
   0x0000fffff7fb8ee4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb8ee8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8eec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb8ef0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb8ef4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb8ef8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb8efc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb8f00:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb8f04:	54000209	b.ls	0xfffff7fb8f44  // b.plast
   0x0000fffff7fb8f08:	36d8008d	tbz	w13, #27, 0xfffff7fb8f18
   0x0000fffff7fb8f0c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb8f10:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb8f14:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb8f18:	36d80091	tbz	w17, #27, 0xfffff7fb8f28
   0x0000fffff7fb8f1c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb8f20:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb8f24:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb8f28:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb8f2c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb8f30:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb8f34:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb8f38:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb8f3c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb8f40:	1400000e	b	0xfffff7fb8f78
   0x0000fffff7fb8f44:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb8f48:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb8f4c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb8f50:	aa1503e2	mov	x2, x21
   0x0000fffff7fb8f54:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fb8f58:	aa1403e4	mov	x4, x20
   0x0000fffff7fb8f5c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb8f60:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb8f64:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb8f68:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb8f6c:	d63f0200	blr	x16
   0x0000fffff7fb8f70:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb8f74:	54006900	b.eq	0xfffff7fb9c94  // b.none
   0x0000fffff7fb8f78:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb8f7c:	37d806a9	tbnz	w9, #27, 0xfffff7fb9050
   0x0000fffff7fb8f80:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb8f84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8f88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8f8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8f90:	540001c1	b.ne	0xfffff7fb8fc8  // b.any
   0x0000fffff7fb8f94:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb8f98:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8f9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8fa0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8fa4:	54000121	b.ne	0xfffff7fb8fc8  // b.any
   0x0000fffff7fb8fa8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb8fac:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb8fb0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb8fb4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8fb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8fbc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb8fc0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb8fc4:	14000030	b	0xfffff7fb9084
   0x0000fffff7fb8fc8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb8fcc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb8fd0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8fd4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8fd8:	54000120	b.eq	0xfffff7fb8ffc  // b.none
   0x0000fffff7fb8fdc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb8fe0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb8fe4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb8fe8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb8fec:	54000321	b.ne	0xfffff7fb9050  // b.any
   0x0000fffff7fb8ff0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb8ff4:	9e620120	scvtf	d0, x9
   0x0000fffff7fb8ff8:	14000002	b	0xfffff7fb9000
   0x0000fffff7fb8ffc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb9000:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb9004:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9008:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb900c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9010:	54000120	b.eq	0xfffff7fb9034  // b.none
   0x0000fffff7fb9014:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb9018:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb901c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9020:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9024:	54000161	b.ne	0xfffff7fb9050  // b.any
   0x0000fffff7fb9028:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb902c:	9e620121	scvtf	d1, x9
   0x0000fffff7fb9030:	14000002	b	0xfffff7fb9038
   0x0000fffff7fb9034:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb9038:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb903c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb9040:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9044:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9048:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb904c:	17ffffde	b	0xfffff7fb8fc4
   0x0000fffff7fb9050:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb9054:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9058:	aa1303e1	mov	x1, x19
   0x0000fffff7fb905c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9060:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fb9064:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9068:	aa1603e5	mov	x5, x22
   0x0000fffff7fb906c:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7fb9070:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb9074:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9078:	d63f0200	blr	x16
   0x0000fffff7fb907c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb9080:	540060e0	b.eq	0xfffff7fb9c9c  // b.none
   0x0000fffff7fb9084:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb9088:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb908c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb9090:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb9094:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb9098:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb909c:	36d801d1	tbz	w17, #27, 0xfffff7fb90d4
   0x0000fffff7fb90a0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb90a4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb90a8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb90ac:	54000281	b.ne	0xfffff7fb90fc  // b.any
   0x0000fffff7fb90b0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb90b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb90b8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb90bc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb90c0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb90c4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb90c8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb90cc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb90d0:	54000169	b.ls	0xfffff7fb90fc  // b.plast
   0x0000fffff7fb90d4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb90d8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb90dc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb90e0:	36d80091	tbz	w17, #27, 0xfffff7fb90f0
   0x0000fffff7fb90e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb90e8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb90ec:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb90f0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb90f4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb90f8:	1400000e	b	0xfffff7fb9130
   0x0000fffff7fb90fc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb9100:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9104:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9108:	aa1503e2	mov	x2, x21
   0x0000fffff7fb910c:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fb9110:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9114:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9118:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7fb911c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb9120:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9124:	d63f0200	blr	x16
   0x0000fffff7fb9128:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb912c:	54005bc0	b.eq	0xfffff7fb9ca4  // b.none
   0x0000fffff7fb9130:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb9134:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb9138:	540003a0	b.eq	0xfffff7fb91ac  // b.none
   0x0000fffff7fb913c:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb9140:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb9144:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb9148:	36d801d1	tbz	w17, #27, 0xfffff7fb9180
   0x0000fffff7fb914c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb9150:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb9154:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb9158:	540002a1	b.ne	0xfffff7fb91ac  // b.any
   0x0000fffff7fb915c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb9160:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb9164:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb9168:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb916c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb9170:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb9174:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb9178:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb917c:	54000189	b.ls	0xfffff7fb91ac  // b.plast
   0x0000fffff7fb9180:	36d8008d	tbz	w13, #27, 0xfffff7fb9190
   0x0000fffff7fb9184:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb9188:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb918c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb9190:	36d80091	tbz	w17, #27, 0xfffff7fb91a0
   0x0000fffff7fb9194:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb9198:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb919c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb91a0:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb91a4:	b900016d	str	w13, [x11]
   0x0000fffff7fb91a8:	1400000e	b	0xfffff7fb91e0
   0x0000fffff7fb91ac:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb91b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb91b4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb91b8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb91bc:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fb91c0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb91c4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb91c8:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7fb91cc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb91d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb91d4:	d63f0200	blr	x16
   0x0000fffff7fb91d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb91dc:	54005680	b.eq	0xfffff7fb9cac  // b.none
   0x0000fffff7fb91e0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb91e4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb91e8:	540004a0	b.eq	0xfffff7fb927c  // b.none
   0x0000fffff7fb91ec:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb91f0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb91f4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb91f8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb91fc:	54000400	b.eq	0xfffff7fb927c  // b.none
   0x0000fffff7fb9200:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb9204:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb9208:	36d801d1	tbz	w17, #27, 0xfffff7fb9240
   0x0000fffff7fb920c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb9210:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb9214:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb9218:	54000321	b.ne	0xfffff7fb927c  // b.any
   0x0000fffff7fb921c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb9220:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb9224:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb9228:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb922c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb9230:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb9234:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb9238:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb923c:	54000209	b.ls	0xfffff7fb927c  // b.plast
   0x0000fffff7fb9240:	36d8008d	tbz	w13, #27, 0xfffff7fb9250
   0x0000fffff7fb9244:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb9248:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb924c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb9250:	36d80091	tbz	w17, #27, 0xfffff7fb9260
   0x0000fffff7fb9254:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb9258:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb925c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb9260:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb9264:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb9268:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb926c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb9270:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb9274:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb9278:	1400000e	b	0xfffff7fb92b0
   0x0000fffff7fb927c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb9280:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9284:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9288:	aa1503e2	mov	x2, x21
   0x0000fffff7fb928c:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fb9290:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9294:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9298:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb929c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb92a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb92a4:	d63f0200	blr	x16
   0x0000fffff7fb92a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb92ac:	54005040	b.eq	0xfffff7fb9cb4  // b.none
   0x0000fffff7fb92b0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb92b4:	37d806a9	tbnz	w9, #27, 0xfffff7fb9388
   0x0000fffff7fb92b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb92bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb92c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb92c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb92c8:	540001c1	b.ne	0xfffff7fb9300  // b.any
   0x0000fffff7fb92cc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb92d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb92d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb92d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb92dc:	54000121	b.ne	0xfffff7fb9300  // b.any
   0x0000fffff7fb92e0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb92e4:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb92e8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb92ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb92f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb92f4:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb92f8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb92fc:	14000030	b	0xfffff7fb93bc
   0x0000fffff7fb9300:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb9304:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9308:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb930c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9310:	54000120	b.eq	0xfffff7fb9334  // b.none
   0x0000fffff7fb9314:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb9318:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb931c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9320:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9324:	54000321	b.ne	0xfffff7fb9388  // b.any
   0x0000fffff7fb9328:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb932c:	9e620120	scvtf	d0, x9
   0x0000fffff7fb9330:	14000002	b	0xfffff7fb9338
   0x0000fffff7fb9334:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb9338:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb933c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9340:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9344:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9348:	54000120	b.eq	0xfffff7fb936c  // b.none
   0x0000fffff7fb934c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb9350:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9354:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9358:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb935c:	54000161	b.ne	0xfffff7fb9388  // b.any
   0x0000fffff7fb9360:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb9364:	9e620121	scvtf	d1, x9
   0x0000fffff7fb9368:	14000002	b	0xfffff7fb9370
   0x0000fffff7fb936c:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb9370:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb9374:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb9378:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb937c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9380:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb9384:	17ffffde	b	0xfffff7fb92fc
   0x0000fffff7fb9388:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb938c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9390:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9394:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9398:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fb939c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb93a0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb93a4:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7fb93a8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb93ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb93b0:	d63f0200	blr	x16
   0x0000fffff7fb93b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb93b8:	54004820	b.eq	0xfffff7fb9cbc  // b.none
   0x0000fffff7fb93bc:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb93c0:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb93c4:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb93c8:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb93cc:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb93d0:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb93d4:	36d801d1	tbz	w17, #27, 0xfffff7fb940c
   0x0000fffff7fb93d8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb93dc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb93e0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb93e4:	54000281	b.ne	0xfffff7fb9434  // b.any
   0x0000fffff7fb93e8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb93ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb93f0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb93f4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb93f8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb93fc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb9400:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb9404:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb9408:	54000169	b.ls	0xfffff7fb9434  // b.plast
   0x0000fffff7fb940c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb9410:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb9414:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb9418:	36d80091	tbz	w17, #27, 0xfffff7fb9428
   0x0000fffff7fb941c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb9420:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb9424:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb9428:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb942c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb9430:	1400000e	b	0xfffff7fb9468
   0x0000fffff7fb9434:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb9438:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb943c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9440:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9444:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fb9448:	aa1403e4	mov	x4, x20
   0x0000fffff7fb944c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9450:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7fb9454:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb9458:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb945c:	d63f0200	blr	x16
   0x0000fffff7fb9460:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb9464:	54004300	b.eq	0xfffff7fb9cc4  // b.none
   0x0000fffff7fb9468:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb946c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb9470:	540003a0	b.eq	0xfffff7fb94e4  // b.none
   0x0000fffff7fb9474:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb9478:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb947c:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb9480:	36d801d1	tbz	w17, #27, 0xfffff7fb94b8
   0x0000fffff7fb9484:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb9488:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb948c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb9490:	540002a1	b.ne	0xfffff7fb94e4  // b.any
   0x0000fffff7fb9494:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb9498:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb949c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb94a0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb94a4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb94a8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb94ac:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb94b0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb94b4:	54000189	b.ls	0xfffff7fb94e4  // b.plast
   0x0000fffff7fb94b8:	36d8008d	tbz	w13, #27, 0xfffff7fb94c8
   0x0000fffff7fb94bc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb94c0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb94c4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb94c8:	36d80091	tbz	w17, #27, 0xfffff7fb94d8
   0x0000fffff7fb94cc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb94d0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb94d4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb94d8:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb94dc:	b900016d	str	w13, [x11]
   0x0000fffff7fb94e0:	1400000e	b	0xfffff7fb9518
   0x0000fffff7fb94e4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb94e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb94ec:	aa1303e1	mov	x1, x19
   0x0000fffff7fb94f0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb94f4:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fb94f8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb94fc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9500:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7fb9504:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb9508:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb950c:	d63f0200	blr	x16
   0x0000fffff7fb9510:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb9514:	54003dc0	b.eq	0xfffff7fb9ccc  // b.none
   0x0000fffff7fb9518:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb951c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb9520:	540004a0	b.eq	0xfffff7fb95b4  // b.none
   0x0000fffff7fb9524:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb9528:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb952c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb9530:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb9534:	54000400	b.eq	0xfffff7fb95b4  // b.none
   0x0000fffff7fb9538:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb953c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb9540:	36d801d1	tbz	w17, #27, 0xfffff7fb9578
   0x0000fffff7fb9544:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb9548:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb954c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb9550:	54000321	b.ne	0xfffff7fb95b4  // b.any
   0x0000fffff7fb9554:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb9558:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb955c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb9560:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb9564:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb9568:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb956c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb9570:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb9574:	54000209	b.ls	0xfffff7fb95b4  // b.plast
   0x0000fffff7fb9578:	36d8008d	tbz	w13, #27, 0xfffff7fb9588
   0x0000fffff7fb957c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb9580:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb9584:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb9588:	36d80091	tbz	w17, #27, 0xfffff7fb9598
   0x0000fffff7fb958c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb9590:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb9594:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb9598:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb959c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb95a0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb95a4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb95a8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb95ac:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb95b0:	1400000e	b	0xfffff7fb95e8
   0x0000fffff7fb95b4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb95b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb95bc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb95c0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb95c4:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fb95c8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb95cc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb95d0:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb95d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb95d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb95dc:	d63f0200	blr	x16
   0x0000fffff7fb95e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb95e4:	54003780	b.eq	0xfffff7fb9cd4  // b.none
   0x0000fffff7fb95e8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb95ec:	37d806a9	tbnz	w9, #27, 0xfffff7fb96c0
   0x0000fffff7fb95f0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb95f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb95f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb95fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9600:	540001c1	b.ne	0xfffff7fb9638  // b.any
   0x0000fffff7fb9604:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb9608:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb960c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9610:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9614:	54000121	b.ne	0xfffff7fb9638  // b.any
   0x0000fffff7fb9618:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb961c:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb9620:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb9624:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9628:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb962c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb9630:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb9634:	14000030	b	0xfffff7fb96f4
   0x0000fffff7fb9638:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb963c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9640:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9644:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9648:	54000120	b.eq	0xfffff7fb966c  // b.none
   0x0000fffff7fb964c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb9650:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9654:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9658:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb965c:	54000321	b.ne	0xfffff7fb96c0  // b.any
   0x0000fffff7fb9660:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb9664:	9e620120	scvtf	d0, x9
   0x0000fffff7fb9668:	14000002	b	0xfffff7fb9670
   0x0000fffff7fb966c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb9670:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb9674:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9678:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb967c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9680:	54000120	b.eq	0xfffff7fb96a4  // b.none
   0x0000fffff7fb9684:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb9688:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb968c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9690:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9694:	54000161	b.ne	0xfffff7fb96c0  // b.any
   0x0000fffff7fb9698:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb969c:	9e620121	scvtf	d1, x9
   0x0000fffff7fb96a0:	14000002	b	0xfffff7fb96a8
   0x0000fffff7fb96a4:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb96a8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb96ac:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb96b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb96b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb96b8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb96bc:	17ffffde	b	0xfffff7fb9634
   0x0000fffff7fb96c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb96c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb96c8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb96cc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb96d0:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fb96d4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb96d8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb96dc:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7fb96e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb96e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb96e8:	d63f0200	blr	x16
   0x0000fffff7fb96ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb96f0:	54002f60	b.eq	0xfffff7fb9cdc  // b.none
   0x0000fffff7fb96f4:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb96f8:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb96fc:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb9700:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb9704:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb9708:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb970c:	36d801d1	tbz	w17, #27, 0xfffff7fb9744
   0x0000fffff7fb9710:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb9714:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb9718:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb971c:	54000281	b.ne	0xfffff7fb976c  // b.any
   0x0000fffff7fb9720:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb9724:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb9728:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb972c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb9730:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb9734:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb9738:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb973c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb9740:	54000169	b.ls	0xfffff7fb976c  // b.plast
   0x0000fffff7fb9744:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb9748:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb974c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb9750:	36d80091	tbz	w17, #27, 0xfffff7fb9760
   0x0000fffff7fb9754:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb9758:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb975c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb9760:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb9764:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb9768:	1400000e	b	0xfffff7fb97a0
   0x0000fffff7fb976c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb9770:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9774:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9778:	aa1503e2	mov	x2, x21
   0x0000fffff7fb977c:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fb9780:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9784:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9788:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7fb978c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb9790:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9794:	d63f0200	blr	x16
   0x0000fffff7fb9798:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb979c:	54002a40	b.eq	0xfffff7fb9ce4  // b.none
   0x0000fffff7fb97a0:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb97a4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb97a8:	540003a0	b.eq	0xfffff7fb981c  // b.none
   0x0000fffff7fb97ac:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb97b0:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb97b4:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb97b8:	36d801d1	tbz	w17, #27, 0xfffff7fb97f0
   0x0000fffff7fb97bc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb97c0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb97c4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb97c8:	540002a1	b.ne	0xfffff7fb981c  // b.any
   0x0000fffff7fb97cc:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb97d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb97d4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb97d8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb97dc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb97e0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb97e4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb97e8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb97ec:	54000189	b.ls	0xfffff7fb981c  // b.plast
   0x0000fffff7fb97f0:	36d8008d	tbz	w13, #27, 0xfffff7fb9800
   0x0000fffff7fb97f4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb97f8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb97fc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb9800:	36d80091	tbz	w17, #27, 0xfffff7fb9810
   0x0000fffff7fb9804:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb9808:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb980c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb9810:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb9814:	b900016d	str	w13, [x11]
   0x0000fffff7fb9818:	1400000e	b	0xfffff7fb9850
   0x0000fffff7fb981c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb9820:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9824:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9828:	aa1503e2	mov	x2, x21
   0x0000fffff7fb982c:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fb9830:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9834:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9838:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7fb983c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb9840:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9844:	d63f0200	blr	x16
   0x0000fffff7fb9848:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb984c:	54002500	b.eq	0xfffff7fb9cec  // b.none
   0x0000fffff7fb9850:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb9854:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb9858:	540004a0	b.eq	0xfffff7fb98ec  // b.none
   0x0000fffff7fb985c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb9860:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb9864:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb9868:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb986c:	54000400	b.eq	0xfffff7fb98ec  // b.none
   0x0000fffff7fb9870:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb9874:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb9878:	36d801d1	tbz	w17, #27, 0xfffff7fb98b0
   0x0000fffff7fb987c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb9880:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb9884:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb9888:	54000321	b.ne	0xfffff7fb98ec  // b.any
   0x0000fffff7fb988c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb9890:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb9894:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb9898:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb989c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb98a0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb98a4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb98a8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb98ac:	54000209	b.ls	0xfffff7fb98ec  // b.plast
   0x0000fffff7fb98b0:	36d8008d	tbz	w13, #27, 0xfffff7fb98c0
   0x0000fffff7fb98b4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb98b8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb98bc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb98c0:	36d80091	tbz	w17, #27, 0xfffff7fb98d0
   0x0000fffff7fb98c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb98c8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb98cc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb98d0:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb98d4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb98d8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb98dc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb98e0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb98e4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb98e8:	1400000e	b	0xfffff7fb9920
   0x0000fffff7fb98ec:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb98f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb98f4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb98f8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb98fc:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fb9900:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9904:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9908:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb990c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb9910:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9914:	d63f0200	blr	x16
   0x0000fffff7fb9918:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb991c:	54001ec0	b.eq	0xfffff7fb9cf4  // b.none
   0x0000fffff7fb9920:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb9924:	37d806a9	tbnz	w9, #27, 0xfffff7fb99f8
   0x0000fffff7fb9928:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb992c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9930:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9934:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9938:	540001c1	b.ne	0xfffff7fb9970  // b.any
   0x0000fffff7fb993c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb9940:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9944:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9948:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb994c:	54000121	b.ne	0xfffff7fb9970  // b.any
   0x0000fffff7fb9950:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb9954:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb9958:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb995c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9960:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9964:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb9968:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb996c:	14000030	b	0xfffff7fb9a2c
   0x0000fffff7fb9970:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb9974:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb9978:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb997c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9980:	54000120	b.eq	0xfffff7fb99a4  // b.none
   0x0000fffff7fb9984:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb9988:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb998c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9990:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb9994:	54000321	b.ne	0xfffff7fb99f8  // b.any
   0x0000fffff7fb9998:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb999c:	9e620120	scvtf	d0, x9
   0x0000fffff7fb99a0:	14000002	b	0xfffff7fb99a8
   0x0000fffff7fb99a4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb99a8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb99ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb99b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb99b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb99b8:	54000120	b.eq	0xfffff7fb99dc  // b.none
   0x0000fffff7fb99bc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb99c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb99c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb99c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb99cc:	54000161	b.ne	0xfffff7fb99f8  // b.any
   0x0000fffff7fb99d0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb99d4:	9e620121	scvtf	d1, x9
   0x0000fffff7fb99d8:	14000002	b	0xfffff7fb99e0
   0x0000fffff7fb99dc:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb99e0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb99e4:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb99e8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb99ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb99f0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb99f4:	17ffffde	b	0xfffff7fb996c
   0x0000fffff7fb99f8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb99fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9a00:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9a04:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9a08:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fb9a0c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9a10:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9a14:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7fb9a18:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb9a1c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9a20:	d63f0200	blr	x16
   0x0000fffff7fb9a24:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb9a28:	540016a0	b.eq	0xfffff7fb9cfc  // b.none
   0x0000fffff7fb9a2c:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb9a30:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb9a34:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb9a38:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb9a3c:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb9a40:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb9a44:	36d801d1	tbz	w17, #27, 0xfffff7fb9a7c
   0x0000fffff7fb9a48:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb9a4c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb9a50:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb9a54:	54000281	b.ne	0xfffff7fb9aa4  // b.any
   0x0000fffff7fb9a58:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb9a5c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb9a60:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb9a64:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb9a68:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb9a6c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb9a70:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb9a74:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb9a78:	54000169	b.ls	0xfffff7fb9aa4  // b.plast
   0x0000fffff7fb9a7c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb9a80:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb9a84:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb9a88:	36d80091	tbz	w17, #27, 0xfffff7fb9a98
   0x0000fffff7fb9a8c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb9a90:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb9a94:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb9a98:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb9a9c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb9aa0:	1400000e	b	0xfffff7fb9ad8
   0x0000fffff7fb9aa4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb9aa8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9aac:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9ab0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9ab4:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fb9ab8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9abc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9ac0:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7fb9ac4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb9ac8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9acc:	d63f0200	blr	x16
   0x0000fffff7fb9ad0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb9ad4:	54001180	b.eq	0xfffff7fb9d04  // b.none
   0x0000fffff7fb9ad8:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb9adc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb9ae0:	540003a0	b.eq	0xfffff7fb9b54  // b.none
   0x0000fffff7fb9ae4:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb9ae8:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb9aec:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb9af0:	36d801d1	tbz	w17, #27, 0xfffff7fb9b28
   0x0000fffff7fb9af4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb9af8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb9afc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb9b00:	540002a1	b.ne	0xfffff7fb9b54  // b.any
   0x0000fffff7fb9b04:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb9b08:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb9b0c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb9b10:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb9b14:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb9b18:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb9b1c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb9b20:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb9b24:	54000189	b.ls	0xfffff7fb9b54  // b.plast
   0x0000fffff7fb9b28:	36d8008d	tbz	w13, #27, 0xfffff7fb9b38
   0x0000fffff7fb9b2c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb9b30:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb9b34:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb9b38:	36d80091	tbz	w17, #27, 0xfffff7fb9b48
   0x0000fffff7fb9b3c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb9b40:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb9b44:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb9b48:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb9b4c:	b900016d	str	w13, [x11]
   0x0000fffff7fb9b50:	1400000e	b	0xfffff7fb9b88
   0x0000fffff7fb9b54:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb9b58:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9b5c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9b60:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9b64:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fb9b68:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9b6c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9b70:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7fb9b74:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb9b78:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9b7c:	d63f0200	blr	x16
   0x0000fffff7fb9b80:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb9b84:	54000c40	b.eq	0xfffff7fb9d0c  // b.none
   0x0000fffff7fb9b88:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb9b8c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb9b90:	aa1303e1	mov	x1, x19
   0x0000fffff7fb9b94:	aa1503e2	mov	x2, x21
   0x0000fffff7fb9b98:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fb9b9c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb9ba0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb9ba4:	d2869090	mov	x16, #0x3484                	// #13444
   0x0000fffff7fb9ba8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb9bac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb9bb0:	d63f0200	blr	x16
   0x0000fffff7fb9bb4:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb9bb8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb9bbc:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb9bc0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb9bc4:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fb9bc8:	d65f03c0	ret
   0x0000fffff7fb9bcc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb9bd0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb9bd4:	b900028a	str	w10, [x20]
   0x0000fffff7fb9bd8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fb9bdc:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb9be0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb9be4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb9be8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb9bec:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fb9bf0:	d65f03c0	ret
   0x0000fffff7fb9bf4:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fb9bf8:	17fffff5	b	0xfffff7fb9bcc
   0x0000fffff7fb9bfc:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fb9c00:	17fffff3	b	0xfffff7fb9bcc
   0x0000fffff7fb9c04:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fb9c08:	17fffff1	b	0xfffff7fb9bcc
   0x0000fffff7fb9c0c:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fb9c10:	17ffffef	b	0xfffff7fb9bcc
   0x0000fffff7fb9c14:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fb9c18:	17ffffed	b	0xfffff7fb9bcc
   0x0000fffff7fb9c1c:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fb9c20:	17ffffeb	b	0xfffff7fb9bcc
   0x0000fffff7fb9c24:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fb9c28:	17ffffe9	b	0xfffff7fb9bcc
   0x0000fffff7fb9c2c:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fb9c30:	17ffffe7	b	0xfffff7fb9bcc
   0x0000fffff7fb9c34:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fb9c38:	17ffffe5	b	0xfffff7fb9bcc
   0x0000fffff7fb9c3c:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fb9c40:	17ffffe3	b	0xfffff7fb9bcc
   0x0000fffff7fb9c44:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fb9c48:	17ffffe1	b	0xfffff7fb9bcc
   0x0000fffff7fb9c4c:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fb9c50:	17ffffdf	b	0xfffff7fb9bcc
   0x0000fffff7fb9c54:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fb9c58:	17ffffdd	b	0xfffff7fb9bcc
   0x0000fffff7fb9c5c:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fb9c60:	17ffffdb	b	0xfffff7fb9bcc
   0x0000fffff7fb9c64:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fb9c68:	17ffffd9	b	0xfffff7fb9bcc
   0x0000fffff7fb9c6c:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fb9c70:	17ffffd7	b	0xfffff7fb9bcc
   0x0000fffff7fb9c74:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fb9c78:	17ffffd5	b	0xfffff7fb9bcc
   0x0000fffff7fb9c7c:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fb9c80:	17ffffd3	b	0xfffff7fb9bcc
   0x0000fffff7fb9c84:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fb9c88:	17ffffd1	b	0xfffff7fb9bcc
   0x0000fffff7fb9c8c:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fb9c90:	17ffffcf	b	0xfffff7fb9bcc
   0x0000fffff7fb9c94:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fb9c98:	17ffffcd	b	0xfffff7fb9bcc
   0x0000fffff7fb9c9c:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fb9ca0:	17ffffcb	b	0xfffff7fb9bcc
   0x0000fffff7fb9ca4:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fb9ca8:	17ffffc9	b	0xfffff7fb9bcc
   0x0000fffff7fb9cac:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fb9cb0:	17ffffc7	b	0xfffff7fb9bcc
   0x0000fffff7fb9cb4:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fb9cb8:	17ffffc5	b	0xfffff7fb9bcc
   0x0000fffff7fb9cbc:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fb9cc0:	17ffffc3	b	0xfffff7fb9bcc
   0x0000fffff7fb9cc4:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fb9cc8:	17ffffc1	b	0xfffff7fb9bcc
   0x0000fffff7fb9ccc:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fb9cd0:	17ffffbf	b	0xfffff7fb9bcc
   0x0000fffff7fb9cd4:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fb9cd8:	17ffffbd	b	0xfffff7fb9bcc
   0x0000fffff7fb9cdc:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fb9ce0:	17ffffbb	b	0xfffff7fb9bcc
   0x0000fffff7fb9ce4:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fb9ce8:	17ffffb9	b	0xfffff7fb9bcc
   0x0000fffff7fb9cec:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fb9cf0:	17ffffb7	b	0xfffff7fb9bcc
   0x0000fffff7fb9cf4:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fb9cf8:	17ffffb5	b	0xfffff7fb9bcc
   0x0000fffff7fb9cfc:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fb9d00:	17ffffb3	b	0xfffff7fb9bcc
   0x0000fffff7fb9d04:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fb9d08:	17ffffb1	b	0xfffff7fb9bcc
   0x0000fffff7fb9d0c:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fb9d10:	17ffffaf	b	0xfffff7fb9bcc
   0x0000fffff7fb9d14:	00000000	udf	#0
   0x0000fffff7fb9d18:	00000000	udf	#0
   0x0000fffff7fb9d1c:	00000000	udf	#0
   0x0000fffff7fb9d20:	00000000	udf	#0
   0x0000fffff7fb9d24:	00000000	udf	#0
   0x0000fffff7fb9d28:	00000000	udf	#0
   0x0000fffff7fb9d2c:	00000000	udf	#0
   0x0000fffff7fb9d30:	00000000	udf	#0
   0x0000fffff7fb9d34:	00000000	udf	#0
   0x0000fffff7fb9d38:	00000000	udf	#0
   0x0000fffff7fb9d3c:	00000000	udf	#0
   0x0000fffff7fb9d40:	00000000	udf	#0
   0x0000fffff7fb9d44:	00000000	udf	#0
   0x0000fffff7fb9d48:	00000000	udf	#0
   0x0000fffff7fb9d4c:	00000000	udf	#0
   0x0000fffff7fb9d50:	00000000	udf	#0
   0x0000fffff7fb9d54:	00000000	udf	#0
   0x0000fffff7fb9d58:	00000000	udf	#0
   0x0000fffff7fb9d5c:	00000000	udf	#0
   0x0000fffff7fb9d60:	00000000	udf	#0
   0x0000fffff7fb9d64:	00000000	udf	#0
   0x0000fffff7fb9d68:	00000000	udf	#0
   0x0000fffff7fb9d6c:	00000000	udf	#0
   0x0000fffff7fb9d70:	00000000	udf	#0
   0x0000fffff7fb9d74:	00000000	udf	#0
   0x0000fffff7fb9d78:	00000000	udf	#0
   0x0000fffff7fb9d7c:	00000000	udf	#0
   0x0000fffff7fb9d80:	00000000	udf	#0
   0x0000fffff7fb9d84:	00000000	udf	#0
   0x0000fffff7fb9d88:	00000000	udf	#0
   0x0000fffff7fb9d8c:	00000000	udf	#0
   0x0000fffff7fb9d90:	00000000	udf	#0
   0x0000fffff7fb9d94:	00000000	udf	#0
   0x0000fffff7fb9d98:	00000000	udf	#0
   0x0000fffff7fb9d9c:	00000000	udf	#0
   0x0000fffff7fb9da0:	00000000	udf	#0
   0x0000fffff7fb9da4:	00000000	udf	#0
   0x0000fffff7fb9da8:	00000000	udf	#0
   0x0000fffff7fb9dac:	00000000	udf	#0
   0x0000fffff7fb9db0:	00000000	udf	#0
   0x0000fffff7fb9db4:	00000000	udf	#0
   0x0000fffff7fb9db8:	00000000	udf	#0
   0x0000fffff7fb9dbc:	00000000	udf	#0
   0x0000fffff7fb9dc0:	00000000	udf	#0
   0x0000fffff7fb9dc4:	00000000	udf	#0
   0x0000fffff7fb9dc8:	00000000	udf	#0
   0x0000fffff7fb9dcc:	00000000	udf	#0
   0x0000fffff7fb9dd0:	00000000	udf	#0
   0x0000fffff7fb9dd4:	00000000	udf	#0
   0x0000fffff7fb9dd8:	00000000	udf	#0
   0x0000fffff7fb9ddc:	00000000	udf	#0
   0x0000fffff7fb9de0:	00000000	udf	#0
   0x0000fffff7fb9de4:	00000000	udf	#0
   0x0000fffff7fb9de8:	00000000	udf	#0
   0x0000fffff7fb9dec:	00000000	udf	#0
   0x0000fffff7fb9df0:	00000000	udf	#0
   0x0000fffff7fb9df4:	00000000	udf	#0
   0x0000fffff7fb9df8:	00000000	udf	#0
   0x0000fffff7fb9dfc:	00000000	udf	#0
   0x0000fffff7fb9e00:	00000000	udf	#0
   0x0000fffff7fb9e04:	00000000	udf	#0
   0x0000fffff7fb9e08:	00000000	udf	#0
   0x0000fffff7fb9e0c:	00000000	udf	#0
   0x0000fffff7fb9e10:	00000000	udf	#0
   0x0000fffff7fb9e14:	00000000	udf	#0
   0x0000fffff7fb9e18:	00000000	udf	#0
   0x0000fffff7fb9e1c:	00000000	udf	#0
   0x0000fffff7fb9e20:	00000000	udf	#0
   0x0000fffff7fb9e24:	00000000	udf	#0
   0x0000fffff7fb9e28:	00000000	udf	#0
   0x0000fffff7fb9e2c:	00000000	udf	#0
   0x0000fffff7fb9e30:	00000000	udf	#0
   0x0000fffff7fb9e34:	00000000	udf	#0
   0x0000fffff7fb9e38:	00000000	udf	#0
   0x0000fffff7fb9e3c:	00000000	udf	#0
   0x0000fffff7fb9e40:	00000000	udf	#0
   0x0000fffff7fb9e44:	00000000	udf	#0
   0x0000fffff7fb9e48:	00000000	udf	#0
   0x0000fffff7fb9e4c:	00000000	udf	#0
   0x0000fffff7fb9e50:	00000000	udf	#0
   0x0000fffff7fb9e54:	00000000	udf	#0
   0x0000fffff7fb9e58:	00000000	udf	#0
   0x0000fffff7fb9e5c:	00000000	udf	#0
   0x0000fffff7fb9e60:	00000000	udf	#0
   0x0000fffff7fb9e64:	00000000	udf	#0
   0x0000fffff7fb9e68:	00000000	udf	#0
   0x0000fffff7fb9e6c:	00000000	udf	#0
   0x0000fffff7fb9e70:	00000000	udf	#0
   0x0000fffff7fb9e74:	00000000	udf	#0
   0x0000fffff7fb9e78:	00000000	udf	#0
   0x0000fffff7fb9e7c:	00000000	udf	#0
   0x0000fffff7fb9e80:	00000000	udf	#0
   0x0000fffff7fb9e84:	00000000	udf	#0
   0x0000fffff7fb9e88:	00000000	udf	#0
   0x0000fffff7fb9e8c:	00000000	udf	#0
   0x0000fffff7fb9e90:	00000000	udf	#0
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
