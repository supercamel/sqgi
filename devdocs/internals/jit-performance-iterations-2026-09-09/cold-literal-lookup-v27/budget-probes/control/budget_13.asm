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
   0x0000fffff7fa8058:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa805c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8060:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8064:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8068:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fa806c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8070:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8074:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa8078:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa807c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8080:	d63f0200	blr	x16
   0x0000fffff7fa8084:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8088:	5400e3a0	b.eq	0xfffff7fa9cfc  // b.none
   0x0000fffff7fa808c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8090:	37d800e9	tbnz	w9, #27, 0xfffff7fa80ac
   0x0000fffff7fa8094:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fa8098:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa809c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa80a0:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa80a4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa80a8:	1400000e	b	0xfffff7fa80e0
   0x0000fffff7fa80ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa80b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa80b4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa80b8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa80bc:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fa80c0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa80c4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa80c8:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fa80cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa80d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa80d4:	d63f0200	blr	x16
   0x0000fffff7fa80d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa80dc:	5400e140	b.eq	0xfffff7fa9d04  // b.none
   0x0000fffff7fa80e0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa80e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa80e8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa80ec:	aa1503e2	mov	x2, x21
   0x0000fffff7fa80f0:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fa80f4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa80f8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa80fc:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa8100:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8104:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8108:	d63f0200	blr	x16
   0x0000fffff7fa810c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8110:	5400dfe0	b.eq	0xfffff7fa9d0c  // b.none
   0x0000fffff7fa8114:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8118:	37d800e9	tbnz	w9, #27, 0xfffff7fa8134
   0x0000fffff7fa811c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fa8120:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8124:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8128:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa812c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa8130:	1400000e	b	0xfffff7fa8168
   0x0000fffff7fa8134:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8138:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa813c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8140:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8144:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7fa8148:	aa1403e4	mov	x4, x20
   0x0000fffff7fa814c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8150:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fa8154:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8158:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa815c:	d63f0200	blr	x16
   0x0000fffff7fa8160:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8164:	5400dd80	b.eq	0xfffff7fa9d14  // b.none
   0x0000fffff7fa8168:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa816c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8170:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8174:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8178:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7fa817c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8180:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8184:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa8188:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa818c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8190:	d63f0200	blr	x16
   0x0000fffff7fa8194:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8198:	5400dc20	b.eq	0xfffff7fa9d1c  // b.none
   0x0000fffff7fa819c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa81a0:	37d806a9	tbnz	w9, #27, 0xfffff7fa8274
   0x0000fffff7fa81a4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa81a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa81ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa81b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa81b4:	540001c1	b.ne	0xfffff7fa81ec  // b.any
   0x0000fffff7fa81b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa81bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa81c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa81c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa81c8:	54000121	b.ne	0xfffff7fa81ec  // b.any
   0x0000fffff7fa81cc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa81d0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa81d4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa81d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa81dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa81e0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa81e4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa81e8:	14000030	b	0xfffff7fa82a8
   0x0000fffff7fa81ec:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa81f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa81f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa81f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa81fc:	54000120	b.eq	0xfffff7fa8220  // b.none
   0x0000fffff7fa8200:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8204:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8208:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa820c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8210:	54000321	b.ne	0xfffff7fa8274  // b.any
   0x0000fffff7fa8214:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa8218:	9e620120	scvtf	d0, x9
   0x0000fffff7fa821c:	14000002	b	0xfffff7fa8224
   0x0000fffff7fa8220:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa8224:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8228:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa822c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8230:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8234:	54000120	b.eq	0xfffff7fa8258  // b.none
   0x0000fffff7fa8238:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa823c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8240:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8244:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8248:	54000161	b.ne	0xfffff7fa8274  // b.any
   0x0000fffff7fa824c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa8250:	9e620121	scvtf	d1, x9
   0x0000fffff7fa8254:	14000002	b	0xfffff7fa825c
   0x0000fffff7fa8258:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa825c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa8260:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa8264:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8268:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa826c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa8270:	17ffffde	b	0xfffff7fa81e8
   0x0000fffff7fa8274:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8278:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa827c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8280:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8284:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fa8288:	aa1403e4	mov	x4, x20
   0x0000fffff7fa828c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8290:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa8294:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8298:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa829c:	d63f0200	blr	x16
   0x0000fffff7fa82a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa82a4:	5400d400	b.eq	0xfffff7fa9d24  // b.none
   0x0000fffff7fa82a8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa82ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa82b0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa82b4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa82b8:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fa82bc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa82c0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa82c4:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa82c8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa82cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa82d0:	d63f0200	blr	x16
   0x0000fffff7fa82d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa82d8:	5400d2a0	b.eq	0xfffff7fa9d2c  // b.none
   0x0000fffff7fa82dc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa82e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa82e4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa82e8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa82ec:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fa82f0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa82f4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa82f8:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa82fc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8300:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8304:	d63f0200	blr	x16
   0x0000fffff7fa8308:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa830c:	5400d140	b.eq	0xfffff7fa9d34  // b.none
   0x0000fffff7fa8310:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa8314:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa8318:	54000380	b.eq	0xfffff7fa8388  // b.none
   0x0000fffff7fa831c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa8320:	37d8034d	tbnz	w13, #27, 0xfffff7fa8388
   0x0000fffff7fa8324:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa8328:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa832c:	36d80211	tbz	w17, #27, 0xfffff7fa836c
   0x0000fffff7fa8330:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8334:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8338:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa833c:	54000261	b.ne	0xfffff7fa8388  // b.any
   0x0000fffff7fa8340:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa8344:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8348:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa834c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8350:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8354:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8358:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa835c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8360:	54000149	b.ls	0xfffff7fa8388  // b.plast
   0x0000fffff7fa8364:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8368:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa836c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa8370:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa8374:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa8378:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa837c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa8380:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa8384:	1400000e	b	0xfffff7fa83bc
   0x0000fffff7fa8388:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa838c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8390:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8394:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8398:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fa839c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa83a0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa83a4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa83a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa83ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa83b0:	d63f0200	blr	x16
   0x0000fffff7fa83b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa83b8:	5400cc20	b.eq	0xfffff7fa9d3c  // b.none
   0x0000fffff7fa83bc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa83c0:	37d806a9	tbnz	w9, #27, 0xfffff7fa8494
   0x0000fffff7fa83c4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa83c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa83cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa83d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa83d4:	540001c1	b.ne	0xfffff7fa840c  // b.any
   0x0000fffff7fa83d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa83dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa83e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa83e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa83e8:	54000121	b.ne	0xfffff7fa840c  // b.any
   0x0000fffff7fa83ec:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa83f0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa83f4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa83f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa83fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8400:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa8404:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa8408:	14000030	b	0xfffff7fa84c8
   0x0000fffff7fa840c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8410:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8414:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8418:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa841c:	54000120	b.eq	0xfffff7fa8440  // b.none
   0x0000fffff7fa8420:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8424:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8428:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa842c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8430:	54000321	b.ne	0xfffff7fa8494  // b.any
   0x0000fffff7fa8434:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa8438:	9e620120	scvtf	d0, x9
   0x0000fffff7fa843c:	14000002	b	0xfffff7fa8444
   0x0000fffff7fa8440:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa8444:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8448:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa844c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8450:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8454:	54000120	b.eq	0xfffff7fa8478  // b.none
   0x0000fffff7fa8458:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa845c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8460:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8464:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8468:	54000161	b.ne	0xfffff7fa8494  // b.any
   0x0000fffff7fa846c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa8470:	9e620121	scvtf	d1, x9
   0x0000fffff7fa8474:	14000002	b	0xfffff7fa847c
   0x0000fffff7fa8478:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa847c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa8480:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa8484:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8488:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa848c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa8490:	17ffffde	b	0xfffff7fa8408
   0x0000fffff7fa8494:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8498:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa849c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa84a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa84a4:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fa84a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa84ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fa84b0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa84b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa84b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa84bc:	d63f0200	blr	x16
   0x0000fffff7fa84c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa84c4:	5400c400	b.eq	0xfffff7fa9d44  // b.none
   0x0000fffff7fa84c8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa84cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa84d0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa84d4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa84d8:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fa84dc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa84e0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa84e4:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa84e8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa84ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa84f0:	d63f0200	blr	x16
   0x0000fffff7fa84f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa84f8:	5400c2a0	b.eq	0xfffff7fa9d4c  // b.none
   0x0000fffff7fa84fc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa8500:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8504:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8508:	aa1503e2	mov	x2, x21
   0x0000fffff7fa850c:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fa8510:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8514:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8518:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa851c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8520:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8524:	d63f0200	blr	x16
   0x0000fffff7fa8528:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa852c:	5400c140	b.eq	0xfffff7fa9d54  // b.none
   0x0000fffff7fa8530:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa8534:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa8538:	54000380	b.eq	0xfffff7fa85a8  // b.none
   0x0000fffff7fa853c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa8540:	37d8034d	tbnz	w13, #27, 0xfffff7fa85a8
   0x0000fffff7fa8544:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa8548:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa854c:	36d80211	tbz	w17, #27, 0xfffff7fa858c
   0x0000fffff7fa8550:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8554:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8558:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa855c:	54000261	b.ne	0xfffff7fa85a8  // b.any
   0x0000fffff7fa8560:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa8564:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8568:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa856c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8570:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8574:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8578:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa857c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8580:	54000149	b.ls	0xfffff7fa85a8  // b.plast
   0x0000fffff7fa8584:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8588:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa858c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa8590:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa8594:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa8598:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa859c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa85a0:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa85a4:	1400000e	b	0xfffff7fa85dc
   0x0000fffff7fa85a8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa85ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa85b0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa85b4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa85b8:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fa85bc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa85c0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa85c4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa85c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa85cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa85d0:	d63f0200	blr	x16
   0x0000fffff7fa85d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa85d8:	5400bc20	b.eq	0xfffff7fa9d5c  // b.none
   0x0000fffff7fa85dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa85e0:	37d806a9	tbnz	w9, #27, 0xfffff7fa86b4
   0x0000fffff7fa85e4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa85e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa85ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa85f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa85f4:	540001c1	b.ne	0xfffff7fa862c  // b.any
   0x0000fffff7fa85f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa85fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8600:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8604:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8608:	54000121	b.ne	0xfffff7fa862c  // b.any
   0x0000fffff7fa860c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa8610:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa8614:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa8618:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa861c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8620:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa8624:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa8628:	14000030	b	0xfffff7fa86e8
   0x0000fffff7fa862c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8630:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8634:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8638:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa863c:	54000120	b.eq	0xfffff7fa8660  // b.none
   0x0000fffff7fa8640:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8644:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8648:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa864c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8650:	54000321	b.ne	0xfffff7fa86b4  // b.any
   0x0000fffff7fa8654:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa8658:	9e620120	scvtf	d0, x9
   0x0000fffff7fa865c:	14000002	b	0xfffff7fa8664
   0x0000fffff7fa8660:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa8664:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8668:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa866c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8670:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8674:	54000120	b.eq	0xfffff7fa8698  // b.none
   0x0000fffff7fa8678:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa867c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8680:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8684:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8688:	54000161	b.ne	0xfffff7fa86b4  // b.any
   0x0000fffff7fa868c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa8690:	9e620121	scvtf	d1, x9
   0x0000fffff7fa8694:	14000002	b	0xfffff7fa869c
   0x0000fffff7fa8698:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa869c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa86a0:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa86a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa86a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa86ac:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa86b0:	17ffffde	b	0xfffff7fa8628
   0x0000fffff7fa86b4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa86b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa86bc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa86c0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa86c4:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fa86c8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa86cc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa86d0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa86d4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa86d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa86dc:	d63f0200	blr	x16
   0x0000fffff7fa86e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa86e4:	5400b400	b.eq	0xfffff7fa9d64  // b.none
   0x0000fffff7fa86e8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa86ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa86f0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa86f4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa86f8:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fa86fc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8700:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8704:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa8708:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa870c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8710:	d63f0200	blr	x16
   0x0000fffff7fa8714:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8718:	5400b2a0	b.eq	0xfffff7fa9d6c  // b.none
   0x0000fffff7fa871c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa8720:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8724:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8728:	aa1503e2	mov	x2, x21
   0x0000fffff7fa872c:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fa8730:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8734:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8738:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa873c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8740:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8744:	d63f0200	blr	x16
   0x0000fffff7fa8748:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa874c:	5400b140	b.eq	0xfffff7fa9d74  // b.none
   0x0000fffff7fa8750:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa8754:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa8758:	54000380	b.eq	0xfffff7fa87c8  // b.none
   0x0000fffff7fa875c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa8760:	37d8034d	tbnz	w13, #27, 0xfffff7fa87c8
   0x0000fffff7fa8764:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa8768:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa876c:	36d80211	tbz	w17, #27, 0xfffff7fa87ac
   0x0000fffff7fa8770:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8774:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8778:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa877c:	54000261	b.ne	0xfffff7fa87c8  // b.any
   0x0000fffff7fa8780:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa8784:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8788:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa878c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8790:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8794:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8798:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa879c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa87a0:	54000149	b.ls	0xfffff7fa87c8  // b.plast
   0x0000fffff7fa87a4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa87a8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa87ac:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa87b0:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa87b4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa87b8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa87bc:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa87c0:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa87c4:	1400000e	b	0xfffff7fa87fc
   0x0000fffff7fa87c8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa87cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa87d0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa87d4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa87d8:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fa87dc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa87e0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa87e4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa87e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa87ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa87f0:	d63f0200	blr	x16
   0x0000fffff7fa87f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa87f8:	5400ac20	b.eq	0xfffff7fa9d7c  // b.none
   0x0000fffff7fa87fc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8800:	37d806a9	tbnz	w9, #27, 0xfffff7fa88d4
   0x0000fffff7fa8804:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8808:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa880c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8810:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8814:	540001c1	b.ne	0xfffff7fa884c  // b.any
   0x0000fffff7fa8818:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa881c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8820:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8824:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8828:	54000121	b.ne	0xfffff7fa884c  // b.any
   0x0000fffff7fa882c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa8830:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa8834:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa8838:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa883c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8840:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa8844:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa8848:	14000030	b	0xfffff7fa8908
   0x0000fffff7fa884c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8850:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8854:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8858:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa885c:	54000120	b.eq	0xfffff7fa8880  // b.none
   0x0000fffff7fa8860:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8864:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8868:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa886c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8870:	54000321	b.ne	0xfffff7fa88d4  // b.any
   0x0000fffff7fa8874:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa8878:	9e620120	scvtf	d0, x9
   0x0000fffff7fa887c:	14000002	b	0xfffff7fa8884
   0x0000fffff7fa8880:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa8884:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8888:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa888c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8890:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8894:	54000120	b.eq	0xfffff7fa88b8  // b.none
   0x0000fffff7fa8898:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa889c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa88a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa88a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa88a8:	54000161	b.ne	0xfffff7fa88d4  // b.any
   0x0000fffff7fa88ac:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa88b0:	9e620121	scvtf	d1, x9
   0x0000fffff7fa88b4:	14000002	b	0xfffff7fa88bc
   0x0000fffff7fa88b8:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa88bc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa88c0:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa88c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa88c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa88cc:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa88d0:	17ffffde	b	0xfffff7fa8848
   0x0000fffff7fa88d4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa88d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa88dc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa88e0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa88e4:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fa88e8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa88ec:	aa1603e5	mov	x5, x22
   0x0000fffff7fa88f0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa88f4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa88f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa88fc:	d63f0200	blr	x16
   0x0000fffff7fa8900:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8904:	5400a400	b.eq	0xfffff7fa9d84  // b.none
   0x0000fffff7fa8908:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa890c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8910:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8914:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8918:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fa891c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8920:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8924:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa8928:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa892c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8930:	d63f0200	blr	x16
   0x0000fffff7fa8934:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8938:	5400a2a0	b.eq	0xfffff7fa9d8c  // b.none
   0x0000fffff7fa893c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa8940:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8944:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8948:	aa1503e2	mov	x2, x21
   0x0000fffff7fa894c:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fa8950:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8954:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8958:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa895c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8960:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8964:	d63f0200	blr	x16
   0x0000fffff7fa8968:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa896c:	5400a140	b.eq	0xfffff7fa9d94  // b.none
   0x0000fffff7fa8970:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa8974:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa8978:	54000380	b.eq	0xfffff7fa89e8  // b.none
   0x0000fffff7fa897c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa8980:	37d8034d	tbnz	w13, #27, 0xfffff7fa89e8
   0x0000fffff7fa8984:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa8988:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa898c:	36d80211	tbz	w17, #27, 0xfffff7fa89cc
   0x0000fffff7fa8990:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8994:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8998:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa899c:	54000261	b.ne	0xfffff7fa89e8  // b.any
   0x0000fffff7fa89a0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa89a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa89a8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa89ac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa89b0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa89b4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa89b8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa89bc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa89c0:	54000149	b.ls	0xfffff7fa89e8  // b.plast
   0x0000fffff7fa89c4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa89c8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa89cc:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa89d0:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa89d4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa89d8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa89dc:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa89e0:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa89e4:	1400000e	b	0xfffff7fa8a1c
   0x0000fffff7fa89e8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa89ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa89f0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa89f4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa89f8:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fa89fc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8a00:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8a04:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa8a08:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8a0c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8a10:	d63f0200	blr	x16
   0x0000fffff7fa8a14:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8a18:	54009c20	b.eq	0xfffff7fa9d9c  // b.none
   0x0000fffff7fa8a1c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8a20:	37d806a9	tbnz	w9, #27, 0xfffff7fa8af4
   0x0000fffff7fa8a24:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8a28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8a2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8a30:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8a34:	540001c1	b.ne	0xfffff7fa8a6c  // b.any
   0x0000fffff7fa8a38:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8a3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8a40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8a44:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8a48:	54000121	b.ne	0xfffff7fa8a6c  // b.any
   0x0000fffff7fa8a4c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa8a50:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa8a54:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa8a58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8a5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8a60:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa8a64:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa8a68:	14000030	b	0xfffff7fa8b28
   0x0000fffff7fa8a6c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8a70:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8a74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8a78:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8a7c:	54000120	b.eq	0xfffff7fa8aa0  // b.none
   0x0000fffff7fa8a80:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8a84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8a88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8a8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8a90:	54000321	b.ne	0xfffff7fa8af4  // b.any
   0x0000fffff7fa8a94:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa8a98:	9e620120	scvtf	d0, x9
   0x0000fffff7fa8a9c:	14000002	b	0xfffff7fa8aa4
   0x0000fffff7fa8aa0:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa8aa4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8aa8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8aac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8ab0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8ab4:	54000120	b.eq	0xfffff7fa8ad8  // b.none
   0x0000fffff7fa8ab8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8abc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8ac0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8ac4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8ac8:	54000161	b.ne	0xfffff7fa8af4  // b.any
   0x0000fffff7fa8acc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa8ad0:	9e620121	scvtf	d1, x9
   0x0000fffff7fa8ad4:	14000002	b	0xfffff7fa8adc
   0x0000fffff7fa8ad8:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa8adc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa8ae0:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa8ae4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8ae8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8aec:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa8af0:	17ffffde	b	0xfffff7fa8a68
   0x0000fffff7fa8af4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8af8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8afc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8b00:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8b04:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fa8b08:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8b0c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8b10:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa8b14:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8b18:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8b1c:	d63f0200	blr	x16
   0x0000fffff7fa8b20:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8b24:	54009400	b.eq	0xfffff7fa9da4  // b.none
   0x0000fffff7fa8b28:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8b2c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8b30:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8b34:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8b38:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fa8b3c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8b40:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8b44:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa8b48:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8b4c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8b50:	d63f0200	blr	x16
   0x0000fffff7fa8b54:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8b58:	540092a0	b.eq	0xfffff7fa9dac  // b.none
   0x0000fffff7fa8b5c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa8b60:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8b64:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8b68:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8b6c:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fa8b70:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8b74:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8b78:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa8b7c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8b80:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8b84:	d63f0200	blr	x16
   0x0000fffff7fa8b88:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8b8c:	54009140	b.eq	0xfffff7fa9db4  // b.none
   0x0000fffff7fa8b90:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa8b94:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa8b98:	54000380	b.eq	0xfffff7fa8c08  // b.none
   0x0000fffff7fa8b9c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa8ba0:	37d8034d	tbnz	w13, #27, 0xfffff7fa8c08
   0x0000fffff7fa8ba4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa8ba8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa8bac:	36d80211	tbz	w17, #27, 0xfffff7fa8bec
   0x0000fffff7fa8bb0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8bb4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8bb8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa8bbc:	54000261	b.ne	0xfffff7fa8c08  // b.any
   0x0000fffff7fa8bc0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa8bc4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8bc8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa8bcc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8bd0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8bd4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8bd8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa8bdc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8be0:	54000149	b.ls	0xfffff7fa8c08  // b.plast
   0x0000fffff7fa8be4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8be8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa8bec:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa8bf0:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa8bf4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa8bf8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa8bfc:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa8c00:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa8c04:	1400000e	b	0xfffff7fa8c3c
   0x0000fffff7fa8c08:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa8c0c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8c10:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8c14:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8c18:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fa8c1c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8c20:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8c24:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa8c28:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8c2c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8c30:	d63f0200	blr	x16
   0x0000fffff7fa8c34:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8c38:	54008c20	b.eq	0xfffff7fa9dbc  // b.none
   0x0000fffff7fa8c3c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8c40:	37d806a9	tbnz	w9, #27, 0xfffff7fa8d14
   0x0000fffff7fa8c44:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8c48:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8c4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8c50:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8c54:	540001c1	b.ne	0xfffff7fa8c8c  // b.any
   0x0000fffff7fa8c58:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8c5c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8c60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8c64:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8c68:	54000121	b.ne	0xfffff7fa8c8c  // b.any
   0x0000fffff7fa8c6c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa8c70:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa8c74:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa8c78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8c7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8c80:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa8c84:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa8c88:	14000030	b	0xfffff7fa8d48
   0x0000fffff7fa8c8c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8c90:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8c94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8c98:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8c9c:	54000120	b.eq	0xfffff7fa8cc0  // b.none
   0x0000fffff7fa8ca0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8ca4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8ca8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8cac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8cb0:	54000321	b.ne	0xfffff7fa8d14  // b.any
   0x0000fffff7fa8cb4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa8cb8:	9e620120	scvtf	d0, x9
   0x0000fffff7fa8cbc:	14000002	b	0xfffff7fa8cc4
   0x0000fffff7fa8cc0:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa8cc4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8cc8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8ccc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8cd0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8cd4:	54000120	b.eq	0xfffff7fa8cf8  // b.none
   0x0000fffff7fa8cd8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8cdc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8ce0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8ce4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8ce8:	54000161	b.ne	0xfffff7fa8d14  // b.any
   0x0000fffff7fa8cec:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa8cf0:	9e620121	scvtf	d1, x9
   0x0000fffff7fa8cf4:	14000002	b	0xfffff7fa8cfc
   0x0000fffff7fa8cf8:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa8cfc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa8d00:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa8d04:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8d08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8d0c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa8d10:	17ffffde	b	0xfffff7fa8c88
   0x0000fffff7fa8d14:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8d18:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8d1c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8d20:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8d24:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fa8d28:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8d2c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8d30:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa8d34:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8d38:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8d3c:	d63f0200	blr	x16
   0x0000fffff7fa8d40:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8d44:	54008400	b.eq	0xfffff7fa9dc4  // b.none
   0x0000fffff7fa8d48:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8d4c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8d50:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8d54:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8d58:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fa8d5c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8d60:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8d64:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa8d68:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8d6c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8d70:	d63f0200	blr	x16
   0x0000fffff7fa8d74:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8d78:	540082a0	b.eq	0xfffff7fa9dcc  // b.none
   0x0000fffff7fa8d7c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa8d80:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8d84:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8d88:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8d8c:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fa8d90:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8d94:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8d98:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa8d9c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8da0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8da4:	d63f0200	blr	x16
   0x0000fffff7fa8da8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8dac:	54008140	b.eq	0xfffff7fa9dd4  // b.none
   0x0000fffff7fa8db0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa8db4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa8db8:	54000380	b.eq	0xfffff7fa8e28  // b.none
   0x0000fffff7fa8dbc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa8dc0:	37d8034d	tbnz	w13, #27, 0xfffff7fa8e28
   0x0000fffff7fa8dc4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa8dc8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa8dcc:	36d80211	tbz	w17, #27, 0xfffff7fa8e0c
   0x0000fffff7fa8dd0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8dd4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8dd8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa8ddc:	54000261	b.ne	0xfffff7fa8e28  // b.any
   0x0000fffff7fa8de0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa8de4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8de8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa8dec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8df0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8df4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8df8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa8dfc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8e00:	54000149	b.ls	0xfffff7fa8e28  // b.plast
   0x0000fffff7fa8e04:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8e08:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa8e0c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa8e10:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa8e14:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa8e18:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa8e1c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa8e20:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa8e24:	1400000e	b	0xfffff7fa8e5c
   0x0000fffff7fa8e28:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa8e2c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8e30:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8e34:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8e38:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fa8e3c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8e40:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8e44:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa8e48:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8e4c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8e50:	d63f0200	blr	x16
   0x0000fffff7fa8e54:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8e58:	54007c20	b.eq	0xfffff7fa9ddc  // b.none
   0x0000fffff7fa8e5c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8e60:	37d806a9	tbnz	w9, #27, 0xfffff7fa8f34
   0x0000fffff7fa8e64:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8e68:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8e6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8e70:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8e74:	540001c1	b.ne	0xfffff7fa8eac  // b.any
   0x0000fffff7fa8e78:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8e7c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8e80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8e84:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8e88:	54000121	b.ne	0xfffff7fa8eac  // b.any
   0x0000fffff7fa8e8c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa8e90:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa8e94:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa8e98:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8e9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8ea0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa8ea4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa8ea8:	14000030	b	0xfffff7fa8f68
   0x0000fffff7fa8eac:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8eb0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8eb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8eb8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8ebc:	54000120	b.eq	0xfffff7fa8ee0  // b.none
   0x0000fffff7fa8ec0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8ec4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8ec8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8ecc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8ed0:	54000321	b.ne	0xfffff7fa8f34  // b.any
   0x0000fffff7fa8ed4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa8ed8:	9e620120	scvtf	d0, x9
   0x0000fffff7fa8edc:	14000002	b	0xfffff7fa8ee4
   0x0000fffff7fa8ee0:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa8ee4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8ee8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8eec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8ef0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8ef4:	54000120	b.eq	0xfffff7fa8f18  // b.none
   0x0000fffff7fa8ef8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8efc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8f00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8f04:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8f08:	54000161	b.ne	0xfffff7fa8f34  // b.any
   0x0000fffff7fa8f0c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa8f10:	9e620121	scvtf	d1, x9
   0x0000fffff7fa8f14:	14000002	b	0xfffff7fa8f1c
   0x0000fffff7fa8f18:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa8f1c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa8f20:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa8f24:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8f28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8f2c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa8f30:	17ffffde	b	0xfffff7fa8ea8
   0x0000fffff7fa8f34:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8f38:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8f3c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8f40:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8f44:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fa8f48:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8f4c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8f50:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa8f54:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8f58:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8f5c:	d63f0200	blr	x16
   0x0000fffff7fa8f60:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8f64:	54007400	b.eq	0xfffff7fa9de4  // b.none
   0x0000fffff7fa8f68:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8f6c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8f70:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8f74:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8f78:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fa8f7c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8f80:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8f84:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa8f88:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8f8c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8f90:	d63f0200	blr	x16
   0x0000fffff7fa8f94:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8f98:	540072a0	b.eq	0xfffff7fa9dec  // b.none
   0x0000fffff7fa8f9c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa8fa0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8fa4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8fa8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8fac:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fa8fb0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8fb4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8fb8:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa8fbc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8fc0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8fc4:	d63f0200	blr	x16
   0x0000fffff7fa8fc8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8fcc:	54007140	b.eq	0xfffff7fa9df4  // b.none
   0x0000fffff7fa8fd0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa8fd4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa8fd8:	54000380	b.eq	0xfffff7fa9048  // b.none
   0x0000fffff7fa8fdc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa8fe0:	37d8034d	tbnz	w13, #27, 0xfffff7fa9048
   0x0000fffff7fa8fe4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa8fe8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa8fec:	36d80211	tbz	w17, #27, 0xfffff7fa902c
   0x0000fffff7fa8ff0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8ff4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8ff8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa8ffc:	54000261	b.ne	0xfffff7fa9048  // b.any
   0x0000fffff7fa9000:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa9004:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9008:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa900c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa9010:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9014:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa9018:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa901c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa9020:	54000149	b.ls	0xfffff7fa9048  // b.plast
   0x0000fffff7fa9024:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa9028:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa902c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa9030:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa9034:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa9038:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa903c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa9040:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa9044:	1400000e	b	0xfffff7fa907c
   0x0000fffff7fa9048:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa904c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9050:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9054:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9058:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fa905c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9060:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9064:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa9068:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa906c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9070:	d63f0200	blr	x16
   0x0000fffff7fa9074:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9078:	54006c20	b.eq	0xfffff7fa9dfc  // b.none
   0x0000fffff7fa907c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9080:	37d806a9	tbnz	w9, #27, 0xfffff7fa9154
   0x0000fffff7fa9084:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9088:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa908c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9090:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9094:	540001c1	b.ne	0xfffff7fa90cc  // b.any
   0x0000fffff7fa9098:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa909c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa90a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa90a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa90a8:	54000121	b.ne	0xfffff7fa90cc  // b.any
   0x0000fffff7fa90ac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa90b0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa90b4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa90b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa90bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa90c0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa90c4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa90c8:	14000030	b	0xfffff7fa9188
   0x0000fffff7fa90cc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa90d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa90d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa90d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa90dc:	54000120	b.eq	0xfffff7fa9100  // b.none
   0x0000fffff7fa90e0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa90e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa90e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa90ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa90f0:	54000321	b.ne	0xfffff7fa9154  // b.any
   0x0000fffff7fa90f4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa90f8:	9e620120	scvtf	d0, x9
   0x0000fffff7fa90fc:	14000002	b	0xfffff7fa9104
   0x0000fffff7fa9100:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa9104:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9108:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa910c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9110:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9114:	54000120	b.eq	0xfffff7fa9138  // b.none
   0x0000fffff7fa9118:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa911c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9120:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9124:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9128:	54000161	b.ne	0xfffff7fa9154  // b.any
   0x0000fffff7fa912c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa9130:	9e620121	scvtf	d1, x9
   0x0000fffff7fa9134:	14000002	b	0xfffff7fa913c
   0x0000fffff7fa9138:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa913c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa9140:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa9144:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9148:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa914c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa9150:	17ffffde	b	0xfffff7fa90c8
   0x0000fffff7fa9154:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9158:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa915c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9160:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9164:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fa9168:	aa1403e4	mov	x4, x20
   0x0000fffff7fa916c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9170:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa9174:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9178:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa917c:	d63f0200	blr	x16
   0x0000fffff7fa9180:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9184:	54006400	b.eq	0xfffff7fa9e04  // b.none
   0x0000fffff7fa9188:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa918c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9190:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9194:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9198:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fa919c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa91a0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa91a4:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa91a8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa91ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa91b0:	d63f0200	blr	x16
   0x0000fffff7fa91b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa91b8:	540062a0	b.eq	0xfffff7fa9e0c  // b.none
   0x0000fffff7fa91bc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa91c0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa91c4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa91c8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa91cc:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fa91d0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa91d4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa91d8:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa91dc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa91e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa91e4:	d63f0200	blr	x16
   0x0000fffff7fa91e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa91ec:	54006140	b.eq	0xfffff7fa9e14  // b.none
   0x0000fffff7fa91f0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa91f4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa91f8:	54000380	b.eq	0xfffff7fa9268  // b.none
   0x0000fffff7fa91fc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa9200:	37d8034d	tbnz	w13, #27, 0xfffff7fa9268
   0x0000fffff7fa9204:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa9208:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa920c:	36d80211	tbz	w17, #27, 0xfffff7fa924c
   0x0000fffff7fa9210:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa9214:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa9218:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa921c:	54000261	b.ne	0xfffff7fa9268  // b.any
   0x0000fffff7fa9220:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa9224:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9228:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa922c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa9230:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9234:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa9238:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa923c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa9240:	54000149	b.ls	0xfffff7fa9268  // b.plast
   0x0000fffff7fa9244:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa9248:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa924c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa9250:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa9254:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa9258:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa925c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa9260:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa9264:	1400000e	b	0xfffff7fa929c
   0x0000fffff7fa9268:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa926c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9270:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9274:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9278:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fa927c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9280:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9284:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa9288:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa928c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9290:	d63f0200	blr	x16
   0x0000fffff7fa9294:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9298:	54005c20	b.eq	0xfffff7fa9e1c  // b.none
   0x0000fffff7fa929c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa92a0:	37d806a9	tbnz	w9, #27, 0xfffff7fa9374
   0x0000fffff7fa92a4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa92a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa92ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa92b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa92b4:	540001c1	b.ne	0xfffff7fa92ec  // b.any
   0x0000fffff7fa92b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa92bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa92c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa92c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa92c8:	54000121	b.ne	0xfffff7fa92ec  // b.any
   0x0000fffff7fa92cc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa92d0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa92d4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa92d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa92dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa92e0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa92e4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa92e8:	14000030	b	0xfffff7fa93a8
   0x0000fffff7fa92ec:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa92f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa92f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa92f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa92fc:	54000120	b.eq	0xfffff7fa9320  // b.none
   0x0000fffff7fa9300:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9304:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9308:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa930c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9310:	54000321	b.ne	0xfffff7fa9374  // b.any
   0x0000fffff7fa9314:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa9318:	9e620120	scvtf	d0, x9
   0x0000fffff7fa931c:	14000002	b	0xfffff7fa9324
   0x0000fffff7fa9320:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa9324:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9328:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa932c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9330:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9334:	54000120	b.eq	0xfffff7fa9358  // b.none
   0x0000fffff7fa9338:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa933c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9340:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9344:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9348:	54000161	b.ne	0xfffff7fa9374  // b.any
   0x0000fffff7fa934c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa9350:	9e620121	scvtf	d1, x9
   0x0000fffff7fa9354:	14000002	b	0xfffff7fa935c
   0x0000fffff7fa9358:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa935c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa9360:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa9364:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9368:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa936c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa9370:	17ffffde	b	0xfffff7fa92e8
   0x0000fffff7fa9374:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9378:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa937c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9380:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9384:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fa9388:	aa1403e4	mov	x4, x20
   0x0000fffff7fa938c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9390:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa9394:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9398:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa939c:	d63f0200	blr	x16
   0x0000fffff7fa93a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa93a4:	54005400	b.eq	0xfffff7fa9e24  // b.none
   0x0000fffff7fa93a8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa93ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa93b0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa93b4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa93b8:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fa93bc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa93c0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa93c4:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa93c8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa93cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa93d0:	d63f0200	blr	x16
   0x0000fffff7fa93d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa93d8:	540052a0	b.eq	0xfffff7fa9e2c  // b.none
   0x0000fffff7fa93dc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa93e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa93e4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa93e8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa93ec:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fa93f0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa93f4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa93f8:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa93fc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9400:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9404:	d63f0200	blr	x16
   0x0000fffff7fa9408:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa940c:	54005140	b.eq	0xfffff7fa9e34  // b.none
   0x0000fffff7fa9410:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa9414:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa9418:	54000380	b.eq	0xfffff7fa9488  // b.none
   0x0000fffff7fa941c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa9420:	37d8034d	tbnz	w13, #27, 0xfffff7fa9488
   0x0000fffff7fa9424:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa9428:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa942c:	36d80211	tbz	w17, #27, 0xfffff7fa946c
   0x0000fffff7fa9430:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa9434:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa9438:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa943c:	54000261	b.ne	0xfffff7fa9488  // b.any
   0x0000fffff7fa9440:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa9444:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9448:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa944c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa9450:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9454:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa9458:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa945c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa9460:	54000149	b.ls	0xfffff7fa9488  // b.plast
   0x0000fffff7fa9464:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa9468:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa946c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa9470:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa9474:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa9478:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa947c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa9480:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa9484:	1400000e	b	0xfffff7fa94bc
   0x0000fffff7fa9488:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa948c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9490:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9494:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9498:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fa949c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa94a0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa94a4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa94a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa94ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa94b0:	d63f0200	blr	x16
   0x0000fffff7fa94b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa94b8:	54004c20	b.eq	0xfffff7fa9e3c  // b.none
   0x0000fffff7fa94bc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa94c0:	37d806a9	tbnz	w9, #27, 0xfffff7fa9594
   0x0000fffff7fa94c4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa94c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa94cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa94d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa94d4:	540001c1	b.ne	0xfffff7fa950c  // b.any
   0x0000fffff7fa94d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa94dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa94e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa94e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa94e8:	54000121	b.ne	0xfffff7fa950c  // b.any
   0x0000fffff7fa94ec:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa94f0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa94f4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa94f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa94fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9500:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa9504:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa9508:	14000030	b	0xfffff7fa95c8
   0x0000fffff7fa950c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9510:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9514:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9518:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa951c:	54000120	b.eq	0xfffff7fa9540  // b.none
   0x0000fffff7fa9520:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9524:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9528:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa952c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9530:	54000321	b.ne	0xfffff7fa9594  // b.any
   0x0000fffff7fa9534:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa9538:	9e620120	scvtf	d0, x9
   0x0000fffff7fa953c:	14000002	b	0xfffff7fa9544
   0x0000fffff7fa9540:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa9544:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9548:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa954c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9550:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9554:	54000120	b.eq	0xfffff7fa9578  // b.none
   0x0000fffff7fa9558:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa955c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9560:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9564:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9568:	54000161	b.ne	0xfffff7fa9594  // b.any
   0x0000fffff7fa956c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa9570:	9e620121	scvtf	d1, x9
   0x0000fffff7fa9574:	14000002	b	0xfffff7fa957c
   0x0000fffff7fa9578:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa957c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa9580:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa9584:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9588:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa958c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa9590:	17ffffde	b	0xfffff7fa9508
   0x0000fffff7fa9594:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9598:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa959c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa95a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa95a4:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7fa95a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa95ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fa95b0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa95b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa95b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa95bc:	d63f0200	blr	x16
   0x0000fffff7fa95c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa95c4:	54004400	b.eq	0xfffff7fa9e44  // b.none
   0x0000fffff7fa95c8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa95cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa95d0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa95d4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa95d8:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7fa95dc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa95e0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa95e4:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa95e8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa95ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa95f0:	d63f0200	blr	x16
   0x0000fffff7fa95f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa95f8:	540042a0	b.eq	0xfffff7fa9e4c  // b.none
   0x0000fffff7fa95fc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa9600:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9604:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9608:	aa1503e2	mov	x2, x21
   0x0000fffff7fa960c:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7fa9610:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9614:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9618:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa961c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9620:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9624:	d63f0200	blr	x16
   0x0000fffff7fa9628:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa962c:	54004140	b.eq	0xfffff7fa9e54  // b.none
   0x0000fffff7fa9630:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa9634:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa9638:	54000380	b.eq	0xfffff7fa96a8  // b.none
   0x0000fffff7fa963c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa9640:	37d8034d	tbnz	w13, #27, 0xfffff7fa96a8
   0x0000fffff7fa9644:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa9648:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa964c:	36d80211	tbz	w17, #27, 0xfffff7fa968c
   0x0000fffff7fa9650:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa9654:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa9658:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa965c:	54000261	b.ne	0xfffff7fa96a8  // b.any
   0x0000fffff7fa9660:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa9664:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9668:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa966c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa9670:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9674:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa9678:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa967c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa9680:	54000149	b.ls	0xfffff7fa96a8  // b.plast
   0x0000fffff7fa9684:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa9688:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa968c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa9690:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa9694:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa9698:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa969c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa96a0:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa96a4:	1400000e	b	0xfffff7fa96dc
   0x0000fffff7fa96a8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa96ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa96b0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa96b4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa96b8:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7fa96bc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa96c0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa96c4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa96c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa96cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa96d0:	d63f0200	blr	x16
   0x0000fffff7fa96d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa96d8:	54003c20	b.eq	0xfffff7fa9e5c  // b.none
   0x0000fffff7fa96dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa96e0:	37d806a9	tbnz	w9, #27, 0xfffff7fa97b4
   0x0000fffff7fa96e4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa96e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa96ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa96f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa96f4:	540001c1	b.ne	0xfffff7fa972c  // b.any
   0x0000fffff7fa96f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa96fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9700:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9704:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9708:	54000121	b.ne	0xfffff7fa972c  // b.any
   0x0000fffff7fa970c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa9710:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa9714:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa9718:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa971c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9720:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa9724:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa9728:	14000030	b	0xfffff7fa97e8
   0x0000fffff7fa972c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9730:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9734:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9738:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa973c:	54000120	b.eq	0xfffff7fa9760  // b.none
   0x0000fffff7fa9740:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9744:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9748:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa974c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9750:	54000321	b.ne	0xfffff7fa97b4  // b.any
   0x0000fffff7fa9754:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa9758:	9e620120	scvtf	d0, x9
   0x0000fffff7fa975c:	14000002	b	0xfffff7fa9764
   0x0000fffff7fa9760:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa9764:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9768:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa976c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9770:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9774:	54000120	b.eq	0xfffff7fa9798  // b.none
   0x0000fffff7fa9778:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa977c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9780:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9784:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9788:	54000161	b.ne	0xfffff7fa97b4  // b.any
   0x0000fffff7fa978c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa9790:	9e620121	scvtf	d1, x9
   0x0000fffff7fa9794:	14000002	b	0xfffff7fa979c
   0x0000fffff7fa9798:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa979c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa97a0:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa97a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa97a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa97ac:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa97b0:	17ffffde	b	0xfffff7fa9728
   0x0000fffff7fa97b4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa97b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa97bc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa97c0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa97c4:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7fa97c8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa97cc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa97d0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa97d4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa97d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa97dc:	d63f0200	blr	x16
   0x0000fffff7fa97e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa97e4:	54003400	b.eq	0xfffff7fa9e64  // b.none
   0x0000fffff7fa97e8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa97ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa97f0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa97f4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa97f8:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7fa97fc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9800:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9804:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa9808:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa980c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9810:	d63f0200	blr	x16
   0x0000fffff7fa9814:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9818:	540032a0	b.eq	0xfffff7fa9e6c  // b.none
   0x0000fffff7fa981c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa9820:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9824:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9828:	aa1503e2	mov	x2, x21
   0x0000fffff7fa982c:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7fa9830:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9834:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9838:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa983c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9840:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9844:	d63f0200	blr	x16
   0x0000fffff7fa9848:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa984c:	54003140	b.eq	0xfffff7fa9e74  // b.none
   0x0000fffff7fa9850:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa9854:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa9858:	54000380	b.eq	0xfffff7fa98c8  // b.none
   0x0000fffff7fa985c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa9860:	37d8034d	tbnz	w13, #27, 0xfffff7fa98c8
   0x0000fffff7fa9864:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa9868:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa986c:	36d80211	tbz	w17, #27, 0xfffff7fa98ac
   0x0000fffff7fa9870:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa9874:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa9878:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa987c:	54000261	b.ne	0xfffff7fa98c8  // b.any
   0x0000fffff7fa9880:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa9884:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9888:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa988c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa9890:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9894:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa9898:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa989c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa98a0:	54000149	b.ls	0xfffff7fa98c8  // b.plast
   0x0000fffff7fa98a4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa98a8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa98ac:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa98b0:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa98b4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa98b8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa98bc:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa98c0:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa98c4:	1400000e	b	0xfffff7fa98fc
   0x0000fffff7fa98c8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa98cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa98d0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa98d4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa98d8:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7fa98dc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa98e0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa98e4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa98e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa98ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa98f0:	d63f0200	blr	x16
   0x0000fffff7fa98f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa98f8:	54002c20	b.eq	0xfffff7fa9e7c  // b.none
   0x0000fffff7fa98fc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9900:	37d806a9	tbnz	w9, #27, 0xfffff7fa99d4
   0x0000fffff7fa9904:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9908:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa990c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9910:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9914:	540001c1	b.ne	0xfffff7fa994c  // b.any
   0x0000fffff7fa9918:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa991c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9920:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9924:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9928:	54000121	b.ne	0xfffff7fa994c  // b.any
   0x0000fffff7fa992c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa9930:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa9934:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa9938:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa993c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9940:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa9944:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa9948:	14000030	b	0xfffff7fa9a08
   0x0000fffff7fa994c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9950:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9954:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9958:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa995c:	54000120	b.eq	0xfffff7fa9980  // b.none
   0x0000fffff7fa9960:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9964:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9968:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa996c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9970:	54000321	b.ne	0xfffff7fa99d4  // b.any
   0x0000fffff7fa9974:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa9978:	9e620120	scvtf	d0, x9
   0x0000fffff7fa997c:	14000002	b	0xfffff7fa9984
   0x0000fffff7fa9980:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa9984:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9988:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa998c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9990:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9994:	54000120	b.eq	0xfffff7fa99b8  // b.none
   0x0000fffff7fa9998:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa999c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa99a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa99a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa99a8:	54000161	b.ne	0xfffff7fa99d4  // b.any
   0x0000fffff7fa99ac:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa99b0:	9e620121	scvtf	d1, x9
   0x0000fffff7fa99b4:	14000002	b	0xfffff7fa99bc
   0x0000fffff7fa99b8:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa99bc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa99c0:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa99c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa99c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa99cc:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa99d0:	17ffffde	b	0xfffff7fa9948
   0x0000fffff7fa99d4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa99d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa99dc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa99e0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa99e4:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7fa99e8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa99ec:	aa1603e5	mov	x5, x22
   0x0000fffff7fa99f0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa99f4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa99f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa99fc:	d63f0200	blr	x16
   0x0000fffff7fa9a00:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9a04:	54002400	b.eq	0xfffff7fa9e84  // b.none
   0x0000fffff7fa9a08:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9a0c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9a10:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9a14:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9a18:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7fa9a1c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9a20:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9a24:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa9a28:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9a2c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9a30:	d63f0200	blr	x16
   0x0000fffff7fa9a34:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9a38:	540022a0	b.eq	0xfffff7fa9e8c  // b.none
   0x0000fffff7fa9a3c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa9a40:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9a44:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9a48:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9a4c:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7fa9a50:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9a54:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9a58:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa9a5c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9a60:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9a64:	d63f0200	blr	x16
   0x0000fffff7fa9a68:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9a6c:	54002140	b.eq	0xfffff7fa9e94  // b.none
   0x0000fffff7fa9a70:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa9a74:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa9a78:	54000380	b.eq	0xfffff7fa9ae8  // b.none
   0x0000fffff7fa9a7c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa9a80:	37d8034d	tbnz	w13, #27, 0xfffff7fa9ae8
   0x0000fffff7fa9a84:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa9a88:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa9a8c:	36d80211	tbz	w17, #27, 0xfffff7fa9acc
   0x0000fffff7fa9a90:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa9a94:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa9a98:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa9a9c:	54000261	b.ne	0xfffff7fa9ae8  // b.any
   0x0000fffff7fa9aa0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa9aa4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa9aa8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa9aac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa9ab0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa9ab4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa9ab8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa9abc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa9ac0:	54000149	b.ls	0xfffff7fa9ae8  // b.plast
   0x0000fffff7fa9ac4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa9ac8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa9acc:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa9ad0:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa9ad4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa9ad8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa9adc:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa9ae0:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa9ae4:	1400000e	b	0xfffff7fa9b1c
   0x0000fffff7fa9ae8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa9aec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9af0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9af4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9af8:	d2800683	mov	x3, #0x34                  	// #52
   0x0000fffff7fa9afc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9b00:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9b04:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa9b08:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9b0c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9b10:	d63f0200	blr	x16
   0x0000fffff7fa9b14:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9b18:	54001c20	b.eq	0xfffff7fa9e9c  // b.none
   0x0000fffff7fa9b1c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9b20:	37d806a9	tbnz	w9, #27, 0xfffff7fa9bf4
   0x0000fffff7fa9b24:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9b28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9b2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9b30:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9b34:	540001c1	b.ne	0xfffff7fa9b6c  // b.any
   0x0000fffff7fa9b38:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9b3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9b40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9b44:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9b48:	54000121	b.ne	0xfffff7fa9b6c  // b.any
   0x0000fffff7fa9b4c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa9b50:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa9b54:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa9b58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9b5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9b60:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa9b64:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa9b68:	14000030	b	0xfffff7fa9c28
   0x0000fffff7fa9b6c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9b70:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9b74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9b78:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9b7c:	54000120	b.eq	0xfffff7fa9ba0  // b.none
   0x0000fffff7fa9b80:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa9b84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9b88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9b8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9b90:	54000321	b.ne	0xfffff7fa9bf4  // b.any
   0x0000fffff7fa9b94:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa9b98:	9e620120	scvtf	d0, x9
   0x0000fffff7fa9b9c:	14000002	b	0xfffff7fa9ba4
   0x0000fffff7fa9ba0:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa9ba4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9ba8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9bac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9bb0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9bb4:	54000120	b.eq	0xfffff7fa9bd8  // b.none
   0x0000fffff7fa9bb8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa9bbc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9bc0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9bc4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa9bc8:	54000161	b.ne	0xfffff7fa9bf4  // b.any
   0x0000fffff7fa9bcc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa9bd0:	9e620121	scvtf	d1, x9
   0x0000fffff7fa9bd4:	14000002	b	0xfffff7fa9bdc
   0x0000fffff7fa9bd8:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa9bdc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa9be0:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa9be4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa9be8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9bec:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa9bf0:	17ffffde	b	0xfffff7fa9b68
   0x0000fffff7fa9bf4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9bf8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9bfc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9c00:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9c04:	d28006a3	mov	x3, #0x35                  	// #53
   0x0000fffff7fa9c08:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9c0c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9c10:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa9c14:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9c18:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9c1c:	d63f0200	blr	x16
   0x0000fffff7fa9c20:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9c24:	54001400	b.eq	0xfffff7fa9ea4  // b.none
   0x0000fffff7fa9c28:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9c2c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9c30:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9c34:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9c38:	d28006c3	mov	x3, #0x36                  	// #54
   0x0000fffff7fa9c3c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9c40:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9c44:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa9c48:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa9c4c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9c50:	d63f0200	blr	x16
   0x0000fffff7fa9c54:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9c58:	540012a0	b.eq	0xfffff7fa9eac  // b.none
   0x0000fffff7fa9c5c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa9c60:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9c64:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9c68:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9c6c:	d28006e3	mov	x3, #0x37                  	// #55
   0x0000fffff7fa9c70:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9c74:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9c78:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa9c7c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9c80:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9c84:	d63f0200	blr	x16
   0x0000fffff7fa9c88:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa9c8c:	54001140	b.eq	0xfffff7fa9eb4  // b.none
   0x0000fffff7fa9c90:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa9c94:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa9c98:	aa1303e1	mov	x1, x19
   0x0000fffff7fa9c9c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa9ca0:	d2800703	mov	x3, #0x38                  	// #56
   0x0000fffff7fa9ca4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa9ca8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa9cac:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7fa9cb0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa9cb4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa9cb8:	d63f0200	blr	x16
   0x0000fffff7fa9cbc:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa9cc0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa9cc4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa9cc8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa9ccc:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fa9cd0:	d65f03c0	ret
   0x0000fffff7fa9cd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa9cd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa9cdc:	b900028a	str	w10, [x20]
   0x0000fffff7fa9ce0:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fa9ce4:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa9ce8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa9cec:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa9cf0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa9cf4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fa9cf8:	d65f03c0	ret
   0x0000fffff7fa9cfc:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fa9d00:	17fffff5	b	0xfffff7fa9cd4
   0x0000fffff7fa9d04:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fa9d08:	17fffff3	b	0xfffff7fa9cd4
   0x0000fffff7fa9d0c:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fa9d10:	17fffff1	b	0xfffff7fa9cd4
   0x0000fffff7fa9d14:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7fa9d18:	17ffffef	b	0xfffff7fa9cd4
   0x0000fffff7fa9d1c:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7fa9d20:	17ffffed	b	0xfffff7fa9cd4
   0x0000fffff7fa9d24:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fa9d28:	17ffffeb	b	0xfffff7fa9cd4
   0x0000fffff7fa9d2c:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fa9d30:	17ffffe9	b	0xfffff7fa9cd4
   0x0000fffff7fa9d34:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fa9d38:	17ffffe7	b	0xfffff7fa9cd4
   0x0000fffff7fa9d3c:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fa9d40:	17ffffe5	b	0xfffff7fa9cd4
   0x0000fffff7fa9d44:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fa9d48:	17ffffe3	b	0xfffff7fa9cd4
   0x0000fffff7fa9d4c:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fa9d50:	17ffffe1	b	0xfffff7fa9cd4
   0x0000fffff7fa9d54:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fa9d58:	17ffffdf	b	0xfffff7fa9cd4
   0x0000fffff7fa9d5c:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fa9d60:	17ffffdd	b	0xfffff7fa9cd4
   0x0000fffff7fa9d64:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fa9d68:	17ffffdb	b	0xfffff7fa9cd4
   0x0000fffff7fa9d6c:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fa9d70:	17ffffd9	b	0xfffff7fa9cd4
   0x0000fffff7fa9d74:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fa9d78:	17ffffd7	b	0xfffff7fa9cd4
   0x0000fffff7fa9d7c:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fa9d80:	17ffffd5	b	0xfffff7fa9cd4
   0x0000fffff7fa9d84:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fa9d88:	17ffffd3	b	0xfffff7fa9cd4
   0x0000fffff7fa9d8c:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fa9d90:	17ffffd1	b	0xfffff7fa9cd4
   0x0000fffff7fa9d94:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fa9d98:	17ffffcf	b	0xfffff7fa9cd4
   0x0000fffff7fa9d9c:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fa9da0:	17ffffcd	b	0xfffff7fa9cd4
   0x0000fffff7fa9da4:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fa9da8:	17ffffcb	b	0xfffff7fa9cd4
   0x0000fffff7fa9dac:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fa9db0:	17ffffc9	b	0xfffff7fa9cd4
   0x0000fffff7fa9db4:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fa9db8:	17ffffc7	b	0xfffff7fa9cd4
   0x0000fffff7fa9dbc:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fa9dc0:	17ffffc5	b	0xfffff7fa9cd4
   0x0000fffff7fa9dc4:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fa9dc8:	17ffffc3	b	0xfffff7fa9cd4
   0x0000fffff7fa9dcc:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fa9dd0:	17ffffc1	b	0xfffff7fa9cd4
   0x0000fffff7fa9dd4:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fa9dd8:	17ffffbf	b	0xfffff7fa9cd4
   0x0000fffff7fa9ddc:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fa9de0:	17ffffbd	b	0xfffff7fa9cd4
   0x0000fffff7fa9de4:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fa9de8:	17ffffbb	b	0xfffff7fa9cd4
   0x0000fffff7fa9dec:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fa9df0:	17ffffb9	b	0xfffff7fa9cd4
   0x0000fffff7fa9df4:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fa9df8:	17ffffb7	b	0xfffff7fa9cd4
   0x0000fffff7fa9dfc:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fa9e00:	17ffffb5	b	0xfffff7fa9cd4
   0x0000fffff7fa9e04:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fa9e08:	17ffffb3	b	0xfffff7fa9cd4
   0x0000fffff7fa9e0c:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fa9e10:	17ffffb1	b	0xfffff7fa9cd4
   0x0000fffff7fa9e14:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fa9e18:	17ffffaf	b	0xfffff7fa9cd4
   0x0000fffff7fa9e1c:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fa9e20:	17ffffad	b	0xfffff7fa9cd4
   0x0000fffff7fa9e24:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fa9e28:	17ffffab	b	0xfffff7fa9cd4
   0x0000fffff7fa9e2c:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fa9e30:	17ffffa9	b	0xfffff7fa9cd4
   0x0000fffff7fa9e34:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7fa9e38:	17ffffa7	b	0xfffff7fa9cd4
   0x0000fffff7fa9e3c:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fa9e40:	17ffffa5	b	0xfffff7fa9cd4
   0x0000fffff7fa9e44:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7fa9e48:	17ffffa3	b	0xfffff7fa9cd4
   0x0000fffff7fa9e4c:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7fa9e50:	17ffffa1	b	0xfffff7fa9cd4
   0x0000fffff7fa9e54:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7fa9e58:	17ffff9f	b	0xfffff7fa9cd4
   0x0000fffff7fa9e5c:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7fa9e60:	17ffff9d	b	0xfffff7fa9cd4
   0x0000fffff7fa9e64:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7fa9e68:	17ffff9b	b	0xfffff7fa9cd4
   0x0000fffff7fa9e6c:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7fa9e70:	17ffff99	b	0xfffff7fa9cd4
   0x0000fffff7fa9e74:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7fa9e78:	17ffff97	b	0xfffff7fa9cd4
   0x0000fffff7fa9e7c:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7fa9e80:	17ffff95	b	0xfffff7fa9cd4
   0x0000fffff7fa9e84:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7fa9e88:	17ffff93	b	0xfffff7fa9cd4
   0x0000fffff7fa9e8c:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7fa9e90:	17ffff91	b	0xfffff7fa9cd4
   0x0000fffff7fa9e94:	d2800669	mov	x9, #0x33                  	// #51
   0x0000fffff7fa9e98:	17ffff8f	b	0xfffff7fa9cd4
   0x0000fffff7fa9e9c:	d2800689	mov	x9, #0x34                  	// #52
   0x0000fffff7fa9ea0:	17ffff8d	b	0xfffff7fa9cd4
   0x0000fffff7fa9ea4:	d28006a9	mov	x9, #0x35                  	// #53
   0x0000fffff7fa9ea8:	17ffff8b	b	0xfffff7fa9cd4
   0x0000fffff7fa9eac:	d28006c9	mov	x9, #0x36                  	// #54
   0x0000fffff7fa9eb0:	17ffff89	b	0xfffff7fa9cd4
   0x0000fffff7fa9eb4:	d28006e9	mov	x9, #0x37                  	// #55
   0x0000fffff7fa9eb8:	17ffff87	b	0xfffff7fa9cd4
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
