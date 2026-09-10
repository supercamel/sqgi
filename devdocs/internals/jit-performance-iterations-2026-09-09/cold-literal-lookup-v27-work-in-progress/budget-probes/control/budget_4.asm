Dump of assembler code from 0xfffff7fba000 to 0xfffff7fbb000:
   0x0000fffff7fba000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fba004:	910003fd	mov	x29, sp
   0x0000fffff7fba008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fba00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fba010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fba014:	aa0003f3	mov	x19, x0
   0x0000fffff7fba018:	aa0103f4	mov	x20, x1
   0x0000fffff7fba01c:	aa0203f5	mov	x21, x2
   0x0000fffff7fba020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fba024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fba028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fba02c:	f90003e9	str	x9, [sp]
   0x0000fffff7fba030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fba034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fba038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fba03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fba040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba044:	d63f0200	blr	x16
   0x0000fffff7fba048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fba04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fba050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fba054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fba058:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fba05c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fba060:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fba064:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fba068:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fba06c:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7fba070:	36d801d1	tbz	w17, #27, 0xfffff7fba0a8
   0x0000fffff7fba074:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba078:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba07c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba080:	54000281	b.ne	0xfffff7fba0d0  // b.any
   0x0000fffff7fba084:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7fba088:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba08c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba090:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba094:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba098:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba09c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba0a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba0a4:	54000169	b.ls	0xfffff7fba0d0  // b.plast
   0x0000fffff7fba0a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba0ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba0b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba0b4:	36d80091	tbz	w17, #27, 0xfffff7fba0c4
   0x0000fffff7fba0b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba0bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba0c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba0c4:	f900166c	str	x12, [x19, #40]
   0x0000fffff7fba0c8:	b900226d	str	w13, [x19, #32]
   0x0000fffff7fba0cc:	1400000e	b	0xfffff7fba104
   0x0000fffff7fba0d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba0d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba0d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fba0dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fba0e0:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fba0e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fba0e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fba0ec:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fba0f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fba0f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba0f8:	d63f0200	blr	x16
   0x0000fffff7fba0fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba100:	54007040	b.eq	0xfffff7fbaf08  // b.none
   0x0000fffff7fba104:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fba108:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fba10c:	d280002c	mov	x12, #0x1                   	// #1
   0x0000fffff7fba110:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fba114:	36d80211	tbz	w17, #27, 0xfffff7fba154
   0x0000fffff7fba118:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba11c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba120:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba124:	540001e1	b.ne	0xfffff7fba160  // b.any
   0x0000fffff7fba128:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fba12c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba130:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba134:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba138:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba13c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba140:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba144:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba148:	540000c9	b.ls	0xfffff7fba160  // b.plast
   0x0000fffff7fba14c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba150:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba154:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fba158:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fba15c:	1400000e	b	0xfffff7fba194
   0x0000fffff7fba160:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba164:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba168:	aa1303e1	mov	x1, x19
   0x0000fffff7fba16c:	aa1503e2	mov	x2, x21
   0x0000fffff7fba170:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fba174:	aa1403e4	mov	x4, x20
   0x0000fffff7fba178:	aa1603e5	mov	x5, x22
   0x0000fffff7fba17c:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fba180:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba188:	d63f0200	blr	x16
   0x0000fffff7fba18c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba190:	54006c00	b.eq	0xfffff7fbaf10  // b.none
   0x0000fffff7fba194:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fba198:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba19c:	aa1303e1	mov	x1, x19
   0x0000fffff7fba1a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fba1a4:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fba1a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fba1ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fba1b0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fba1b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba1b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba1bc:	d63f0200	blr	x16
   0x0000fffff7fba1c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba1c4:	54006aa0	b.eq	0xfffff7fbaf18  // b.none
   0x0000fffff7fba1c8:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fba1cc:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fba1d0:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fba1d4:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7fba1d8:	36d80211	tbz	w17, #27, 0xfffff7fba218
   0x0000fffff7fba1dc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba1e0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba1e4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba1e8:	540001e1	b.ne	0xfffff7fba224  // b.any
   0x0000fffff7fba1ec:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7fba1f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba1f4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba1f8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba1fc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba200:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba204:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba208:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba20c:	540000c9	b.ls	0xfffff7fba224  // b.plast
   0x0000fffff7fba210:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba214:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba218:	f900166c	str	x12, [x19, #40]
   0x0000fffff7fba21c:	b900226d	str	w13, [x19, #32]
   0x0000fffff7fba220:	1400000e	b	0xfffff7fba258
   0x0000fffff7fba224:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba228:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba22c:	aa1303e1	mov	x1, x19
   0x0000fffff7fba230:	aa1503e2	mov	x2, x21
   0x0000fffff7fba234:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7fba238:	aa1403e4	mov	x4, x20
   0x0000fffff7fba23c:	aa1603e5	mov	x5, x22
   0x0000fffff7fba240:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fba244:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba248:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba24c:	d63f0200	blr	x16
   0x0000fffff7fba250:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba254:	54006660	b.eq	0xfffff7fbaf20  // b.none
   0x0000fffff7fba258:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fba25c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba260:	aa1303e1	mov	x1, x19
   0x0000fffff7fba264:	aa1503e2	mov	x2, x21
   0x0000fffff7fba268:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7fba26c:	aa1403e4	mov	x4, x20
   0x0000fffff7fba270:	aa1603e5	mov	x5, x22
   0x0000fffff7fba274:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fba278:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba27c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba280:	d63f0200	blr	x16
   0x0000fffff7fba284:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba288:	54006500	b.eq	0xfffff7fbaf28  // b.none
   0x0000fffff7fba28c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fba290:	37d806a9	tbnz	w9, #27, 0xfffff7fba364
   0x0000fffff7fba294:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fba298:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba29c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba2a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba2a4:	540001c1	b.ne	0xfffff7fba2dc  // b.any
   0x0000fffff7fba2a8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba2ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba2b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba2b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba2b8:	54000121	b.ne	0xfffff7fba2dc  // b.any
   0x0000fffff7fba2bc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fba2c0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fba2c4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fba2c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba2cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba2d0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fba2d4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fba2d8:	14000030	b	0xfffff7fba398
   0x0000fffff7fba2dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fba2e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba2e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba2e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba2ec:	54000120	b.eq	0xfffff7fba310  // b.none
   0x0000fffff7fba2f0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fba2f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba2f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba2fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba300:	54000321	b.ne	0xfffff7fba364  // b.any
   0x0000fffff7fba304:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fba308:	9e620120	scvtf	d0, x9
   0x0000fffff7fba30c:	14000002	b	0xfffff7fba314
   0x0000fffff7fba310:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fba314:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba318:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba31c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba320:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba324:	54000120	b.eq	0xfffff7fba348  // b.none
   0x0000fffff7fba328:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba32c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba330:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba334:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba338:	54000161	b.ne	0xfffff7fba364  // b.any
   0x0000fffff7fba33c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fba340:	9e620121	scvtf	d1, x9
   0x0000fffff7fba344:	14000002	b	0xfffff7fba34c
   0x0000fffff7fba348:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fba34c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fba350:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fba354:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba358:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba35c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fba360:	17ffffde	b	0xfffff7fba2d8
   0x0000fffff7fba364:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba368:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba36c:	aa1303e1	mov	x1, x19
   0x0000fffff7fba370:	aa1503e2	mov	x2, x21
   0x0000fffff7fba374:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fba378:	aa1403e4	mov	x4, x20
   0x0000fffff7fba37c:	aa1603e5	mov	x5, x22
   0x0000fffff7fba380:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fba384:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fba388:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba38c:	d63f0200	blr	x16
   0x0000fffff7fba390:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba394:	54005ce0	b.eq	0xfffff7fbaf30  // b.none
   0x0000fffff7fba398:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fba39c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fba3a0:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fba3a4:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fba3a8:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fba3ac:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fba3b0:	36d801d1	tbz	w17, #27, 0xfffff7fba3e8
   0x0000fffff7fba3b4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba3b8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba3bc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba3c0:	54000281	b.ne	0xfffff7fba410  // b.any
   0x0000fffff7fba3c4:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fba3c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba3cc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba3d0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba3d4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba3d8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba3dc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba3e0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba3e4:	54000169	b.ls	0xfffff7fba410  // b.plast
   0x0000fffff7fba3e8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba3ec:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba3f0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba3f4:	36d80091	tbz	w17, #27, 0xfffff7fba404
   0x0000fffff7fba3f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba3fc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba400:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba404:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fba408:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fba40c:	1400000e	b	0xfffff7fba444
   0x0000fffff7fba410:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba414:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba418:	aa1303e1	mov	x1, x19
   0x0000fffff7fba41c:	aa1503e2	mov	x2, x21
   0x0000fffff7fba420:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fba424:	aa1403e4	mov	x4, x20
   0x0000fffff7fba428:	aa1603e5	mov	x5, x22
   0x0000fffff7fba42c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fba430:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fba434:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba438:	d63f0200	blr	x16
   0x0000fffff7fba43c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba440:	540057c0	b.eq	0xfffff7fbaf38  // b.none
   0x0000fffff7fba444:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fba448:	f100017f	cmp	x11, #0x0
   0x0000fffff7fba44c:	540003a0	b.eq	0xfffff7fba4c0  // b.none
   0x0000fffff7fba450:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fba454:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fba458:	b9400171	ldr	w17, [x11]
   0x0000fffff7fba45c:	36d801d1	tbz	w17, #27, 0xfffff7fba494
   0x0000fffff7fba460:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba464:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba468:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba46c:	540002a1	b.ne	0xfffff7fba4c0  // b.any
   0x0000fffff7fba470:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fba474:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba478:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba47c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba480:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba484:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba488:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba48c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba490:	54000189	b.ls	0xfffff7fba4c0  // b.plast
   0x0000fffff7fba494:	36d8008d	tbz	w13, #27, 0xfffff7fba4a4
   0x0000fffff7fba498:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba49c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba4a0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba4a4:	36d80091	tbz	w17, #27, 0xfffff7fba4b4
   0x0000fffff7fba4a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba4ac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba4b0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba4b4:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fba4b8:	b900016d	str	w13, [x11]
   0x0000fffff7fba4bc:	1400000e	b	0xfffff7fba4f4
   0x0000fffff7fba4c0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fba4c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba4c8:	aa1303e1	mov	x1, x19
   0x0000fffff7fba4cc:	aa1503e2	mov	x2, x21
   0x0000fffff7fba4d0:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fba4d4:	aa1403e4	mov	x4, x20
   0x0000fffff7fba4d8:	aa1603e5	mov	x5, x22
   0x0000fffff7fba4dc:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fba4e0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba4e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba4e8:	d63f0200	blr	x16
   0x0000fffff7fba4ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba4f0:	54005280	b.eq	0xfffff7fbaf40  // b.none
   0x0000fffff7fba4f4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fba4f8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fba4fc:	540004a0	b.eq	0xfffff7fba590  // b.none
   0x0000fffff7fba500:	b940016d	ldr	w13, [x11]
   0x0000fffff7fba504:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fba508:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fba50c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fba510:	54000400	b.eq	0xfffff7fba590  // b.none
   0x0000fffff7fba514:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fba518:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fba51c:	36d801d1	tbz	w17, #27, 0xfffff7fba554
   0x0000fffff7fba520:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba524:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba528:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba52c:	54000321	b.ne	0xfffff7fba590  // b.any
   0x0000fffff7fba530:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fba534:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba538:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba53c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba540:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba544:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba548:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba54c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba550:	54000209	b.ls	0xfffff7fba590  // b.plast
   0x0000fffff7fba554:	36d8008d	tbz	w13, #27, 0xfffff7fba564
   0x0000fffff7fba558:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba55c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba560:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba564:	36d80091	tbz	w17, #27, 0xfffff7fba574
   0x0000fffff7fba568:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba56c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba570:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba574:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fba578:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fba57c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fba580:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fba584:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fba588:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fba58c:	1400000e	b	0xfffff7fba5c4
   0x0000fffff7fba590:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fba594:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba598:	aa1303e1	mov	x1, x19
   0x0000fffff7fba59c:	aa1503e2	mov	x2, x21
   0x0000fffff7fba5a0:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fba5a4:	aa1403e4	mov	x4, x20
   0x0000fffff7fba5a8:	aa1603e5	mov	x5, x22
   0x0000fffff7fba5ac:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fba5b0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba5b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba5b8:	d63f0200	blr	x16
   0x0000fffff7fba5bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba5c0:	54004c40	b.eq	0xfffff7fbaf48  // b.none
   0x0000fffff7fba5c4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fba5c8:	37d806a9	tbnz	w9, #27, 0xfffff7fba69c
   0x0000fffff7fba5cc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fba5d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba5d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba5d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba5dc:	540001c1	b.ne	0xfffff7fba614  // b.any
   0x0000fffff7fba5e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba5e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba5e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba5ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba5f0:	54000121	b.ne	0xfffff7fba614  // b.any
   0x0000fffff7fba5f4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fba5f8:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fba5fc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fba600:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba604:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba608:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fba60c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fba610:	14000030	b	0xfffff7fba6d0
   0x0000fffff7fba614:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fba618:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba61c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba620:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba624:	54000120	b.eq	0xfffff7fba648  // b.none
   0x0000fffff7fba628:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fba62c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba630:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba634:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba638:	54000321	b.ne	0xfffff7fba69c  // b.any
   0x0000fffff7fba63c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fba640:	9e620120	scvtf	d0, x9
   0x0000fffff7fba644:	14000002	b	0xfffff7fba64c
   0x0000fffff7fba648:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fba64c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba650:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba654:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba658:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba65c:	54000120	b.eq	0xfffff7fba680  // b.none
   0x0000fffff7fba660:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba664:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba668:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba66c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba670:	54000161	b.ne	0xfffff7fba69c  // b.any
   0x0000fffff7fba674:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fba678:	9e620121	scvtf	d1, x9
   0x0000fffff7fba67c:	14000002	b	0xfffff7fba684
   0x0000fffff7fba680:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fba684:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fba688:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fba68c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba690:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba694:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fba698:	17ffffde	b	0xfffff7fba610
   0x0000fffff7fba69c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba6a0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba6a4:	aa1303e1	mov	x1, x19
   0x0000fffff7fba6a8:	aa1503e2	mov	x2, x21
   0x0000fffff7fba6ac:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fba6b0:	aa1403e4	mov	x4, x20
   0x0000fffff7fba6b4:	aa1603e5	mov	x5, x22
   0x0000fffff7fba6b8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fba6bc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fba6c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba6c4:	d63f0200	blr	x16
   0x0000fffff7fba6c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba6cc:	54004420	b.eq	0xfffff7fbaf50  // b.none
   0x0000fffff7fba6d0:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fba6d4:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fba6d8:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fba6dc:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fba6e0:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fba6e4:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fba6e8:	36d801d1	tbz	w17, #27, 0xfffff7fba720
   0x0000fffff7fba6ec:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba6f0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba6f4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba6f8:	54000281	b.ne	0xfffff7fba748  // b.any
   0x0000fffff7fba6fc:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fba700:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba704:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba708:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba70c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba710:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba714:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba718:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba71c:	54000169	b.ls	0xfffff7fba748  // b.plast
   0x0000fffff7fba720:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba724:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba728:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba72c:	36d80091	tbz	w17, #27, 0xfffff7fba73c
   0x0000fffff7fba730:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba734:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba738:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba73c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fba740:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fba744:	1400000e	b	0xfffff7fba77c
   0x0000fffff7fba748:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba74c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba750:	aa1303e1	mov	x1, x19
   0x0000fffff7fba754:	aa1503e2	mov	x2, x21
   0x0000fffff7fba758:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fba75c:	aa1403e4	mov	x4, x20
   0x0000fffff7fba760:	aa1603e5	mov	x5, x22
   0x0000fffff7fba764:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fba768:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fba76c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba770:	d63f0200	blr	x16
   0x0000fffff7fba774:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba778:	54003f00	b.eq	0xfffff7fbaf58  // b.none
   0x0000fffff7fba77c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fba780:	f100017f	cmp	x11, #0x0
   0x0000fffff7fba784:	540003a0	b.eq	0xfffff7fba7f8  // b.none
   0x0000fffff7fba788:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fba78c:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fba790:	b9400171	ldr	w17, [x11]
   0x0000fffff7fba794:	36d801d1	tbz	w17, #27, 0xfffff7fba7cc
   0x0000fffff7fba798:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba79c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba7a0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba7a4:	540002a1	b.ne	0xfffff7fba7f8  // b.any
   0x0000fffff7fba7a8:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fba7ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba7b0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba7b4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba7b8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba7bc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba7c0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba7c4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba7c8:	54000189	b.ls	0xfffff7fba7f8  // b.plast
   0x0000fffff7fba7cc:	36d8008d	tbz	w13, #27, 0xfffff7fba7dc
   0x0000fffff7fba7d0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba7d4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba7d8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba7dc:	36d80091	tbz	w17, #27, 0xfffff7fba7ec
   0x0000fffff7fba7e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba7e4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba7e8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba7ec:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fba7f0:	b900016d	str	w13, [x11]
   0x0000fffff7fba7f4:	1400000e	b	0xfffff7fba82c
   0x0000fffff7fba7f8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fba7fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba800:	aa1303e1	mov	x1, x19
   0x0000fffff7fba804:	aa1503e2	mov	x2, x21
   0x0000fffff7fba808:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fba80c:	aa1403e4	mov	x4, x20
   0x0000fffff7fba810:	aa1603e5	mov	x5, x22
   0x0000fffff7fba814:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fba818:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba81c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba820:	d63f0200	blr	x16
   0x0000fffff7fba824:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba828:	540039c0	b.eq	0xfffff7fbaf60  // b.none
   0x0000fffff7fba82c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fba830:	f100017f	cmp	x11, #0x0
   0x0000fffff7fba834:	540004a0	b.eq	0xfffff7fba8c8  // b.none
   0x0000fffff7fba838:	b940016d	ldr	w13, [x11]
   0x0000fffff7fba83c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fba840:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fba844:	eb0901bf	cmp	x13, x9
   0x0000fffff7fba848:	54000400	b.eq	0xfffff7fba8c8  // b.none
   0x0000fffff7fba84c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fba850:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fba854:	36d801d1	tbz	w17, #27, 0xfffff7fba88c
   0x0000fffff7fba858:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba85c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba860:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba864:	54000321	b.ne	0xfffff7fba8c8  // b.any
   0x0000fffff7fba868:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fba86c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba870:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba874:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba878:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba87c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba880:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba884:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba888:	54000209	b.ls	0xfffff7fba8c8  // b.plast
   0x0000fffff7fba88c:	36d8008d	tbz	w13, #27, 0xfffff7fba89c
   0x0000fffff7fba890:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba894:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba898:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba89c:	36d80091	tbz	w17, #27, 0xfffff7fba8ac
   0x0000fffff7fba8a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba8a4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba8a8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba8ac:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fba8b0:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fba8b4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fba8b8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fba8bc:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fba8c0:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fba8c4:	1400000e	b	0xfffff7fba8fc
   0x0000fffff7fba8c8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fba8cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba8d0:	aa1303e1	mov	x1, x19
   0x0000fffff7fba8d4:	aa1503e2	mov	x2, x21
   0x0000fffff7fba8d8:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fba8dc:	aa1403e4	mov	x4, x20
   0x0000fffff7fba8e0:	aa1603e5	mov	x5, x22
   0x0000fffff7fba8e4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fba8e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba8ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba8f0:	d63f0200	blr	x16
   0x0000fffff7fba8f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba8f8:	54003380	b.eq	0xfffff7fbaf68  // b.none
   0x0000fffff7fba8fc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fba900:	37d806a9	tbnz	w9, #27, 0xfffff7fba9d4
   0x0000fffff7fba904:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fba908:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba90c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba910:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba914:	540001c1	b.ne	0xfffff7fba94c  // b.any
   0x0000fffff7fba918:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba91c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba920:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba924:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba928:	54000121	b.ne	0xfffff7fba94c  // b.any
   0x0000fffff7fba92c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fba930:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fba934:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fba938:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba93c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba940:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fba944:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fba948:	14000030	b	0xfffff7fbaa08
   0x0000fffff7fba94c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fba950:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba954:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba958:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba95c:	54000120	b.eq	0xfffff7fba980  // b.none
   0x0000fffff7fba960:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fba964:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba968:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba96c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba970:	54000321	b.ne	0xfffff7fba9d4  // b.any
   0x0000fffff7fba974:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fba978:	9e620120	scvtf	d0, x9
   0x0000fffff7fba97c:	14000002	b	0xfffff7fba984
   0x0000fffff7fba980:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fba984:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba988:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba98c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba990:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba994:	54000120	b.eq	0xfffff7fba9b8  // b.none
   0x0000fffff7fba998:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba99c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba9a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba9a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba9a8:	54000161	b.ne	0xfffff7fba9d4  // b.any
   0x0000fffff7fba9ac:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fba9b0:	9e620121	scvtf	d1, x9
   0x0000fffff7fba9b4:	14000002	b	0xfffff7fba9bc
   0x0000fffff7fba9b8:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fba9bc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fba9c0:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fba9c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba9c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba9cc:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fba9d0:	17ffffde	b	0xfffff7fba948
   0x0000fffff7fba9d4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba9d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba9dc:	aa1303e1	mov	x1, x19
   0x0000fffff7fba9e0:	aa1503e2	mov	x2, x21
   0x0000fffff7fba9e4:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fba9e8:	aa1403e4	mov	x4, x20
   0x0000fffff7fba9ec:	aa1603e5	mov	x5, x22
   0x0000fffff7fba9f0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fba9f4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fba9f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba9fc:	d63f0200	blr	x16
   0x0000fffff7fbaa00:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbaa04:	54002b60	b.eq	0xfffff7fbaf70  // b.none
   0x0000fffff7fbaa08:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbaa0c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbaa10:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbaa14:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbaa18:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbaa1c:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fbaa20:	36d801d1	tbz	w17, #27, 0xfffff7fbaa58
   0x0000fffff7fbaa24:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbaa28:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbaa2c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbaa30:	54000281	b.ne	0xfffff7fbaa80  // b.any
   0x0000fffff7fbaa34:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fbaa38:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbaa3c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbaa40:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbaa44:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbaa48:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbaa4c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbaa50:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbaa54:	54000169	b.ls	0xfffff7fbaa80  // b.plast
   0x0000fffff7fbaa58:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbaa5c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbaa60:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbaa64:	36d80091	tbz	w17, #27, 0xfffff7fbaa74
   0x0000fffff7fbaa68:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbaa6c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbaa70:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbaa74:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fbaa78:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fbaa7c:	1400000e	b	0xfffff7fbaab4
   0x0000fffff7fbaa80:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbaa84:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbaa88:	aa1303e1	mov	x1, x19
   0x0000fffff7fbaa8c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbaa90:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fbaa94:	aa1403e4	mov	x4, x20
   0x0000fffff7fbaa98:	aa1603e5	mov	x5, x22
   0x0000fffff7fbaa9c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fbaaa0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbaaa4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbaaa8:	d63f0200	blr	x16
   0x0000fffff7fbaaac:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbaab0:	54002640	b.eq	0xfffff7fbaf78  // b.none
   0x0000fffff7fbaab4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbaab8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbaabc:	540003a0	b.eq	0xfffff7fbab30  // b.none
   0x0000fffff7fbaac0:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fbaac4:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fbaac8:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbaacc:	36d801d1	tbz	w17, #27, 0xfffff7fbab04
   0x0000fffff7fbaad0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbaad4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbaad8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbaadc:	540002a1	b.ne	0xfffff7fbab30  // b.any
   0x0000fffff7fbaae0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbaae4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbaae8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbaaec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbaaf0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbaaf4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbaaf8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbaafc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbab00:	54000189	b.ls	0xfffff7fbab30  // b.plast
   0x0000fffff7fbab04:	36d8008d	tbz	w13, #27, 0xfffff7fbab14
   0x0000fffff7fbab08:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbab0c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbab10:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbab14:	36d80091	tbz	w17, #27, 0xfffff7fbab24
   0x0000fffff7fbab18:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbab1c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbab20:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbab24:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbab28:	b900016d	str	w13, [x11]
   0x0000fffff7fbab2c:	1400000e	b	0xfffff7fbab64
   0x0000fffff7fbab30:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbab34:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbab38:	aa1303e1	mov	x1, x19
   0x0000fffff7fbab3c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbab40:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fbab44:	aa1403e4	mov	x4, x20
   0x0000fffff7fbab48:	aa1603e5	mov	x5, x22
   0x0000fffff7fbab4c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fbab50:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbab54:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbab58:	d63f0200	blr	x16
   0x0000fffff7fbab5c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbab60:	54002100	b.eq	0xfffff7fbaf80  // b.none
   0x0000fffff7fbab64:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbab68:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbab6c:	540004a0	b.eq	0xfffff7fbac00  // b.none
   0x0000fffff7fbab70:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbab74:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbab78:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbab7c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbab80:	54000400	b.eq	0xfffff7fbac00  // b.none
   0x0000fffff7fbab84:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbab88:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbab8c:	36d801d1	tbz	w17, #27, 0xfffff7fbabc4
   0x0000fffff7fbab90:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbab94:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbab98:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbab9c:	54000321	b.ne	0xfffff7fbac00  // b.any
   0x0000fffff7fbaba0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbaba4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbaba8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbabac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbabb0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbabb4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbabb8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbabbc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbabc0:	54000209	b.ls	0xfffff7fbac00  // b.plast
   0x0000fffff7fbabc4:	36d8008d	tbz	w13, #27, 0xfffff7fbabd4
   0x0000fffff7fbabc8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbabcc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbabd0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbabd4:	36d80091	tbz	w17, #27, 0xfffff7fbabe4
   0x0000fffff7fbabd8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbabdc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbabe0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbabe4:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fbabe8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fbabec:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbabf0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbabf4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fbabf8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fbabfc:	1400000e	b	0xfffff7fbac34
   0x0000fffff7fbac00:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbac04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbac08:	aa1303e1	mov	x1, x19
   0x0000fffff7fbac0c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbac10:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fbac14:	aa1403e4	mov	x4, x20
   0x0000fffff7fbac18:	aa1603e5	mov	x5, x22
   0x0000fffff7fbac1c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbac20:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbac24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbac28:	d63f0200	blr	x16
   0x0000fffff7fbac2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbac30:	54001ac0	b.eq	0xfffff7fbaf88  // b.none
   0x0000fffff7fbac34:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fbac38:	37d806a9	tbnz	w9, #27, 0xfffff7fbad0c
   0x0000fffff7fbac3c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fbac40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbac44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbac48:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbac4c:	540001c1	b.ne	0xfffff7fbac84  // b.any
   0x0000fffff7fbac50:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbac54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbac58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbac5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbac60:	54000121	b.ne	0xfffff7fbac84  // b.any
   0x0000fffff7fbac64:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fbac68:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fbac6c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbac70:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbac74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbac78:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fbac7c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fbac80:	14000030	b	0xfffff7fbad40
   0x0000fffff7fbac84:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fbac88:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbac8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbac90:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbac94:	54000120	b.eq	0xfffff7fbacb8  // b.none
   0x0000fffff7fbac98:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fbac9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbaca0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbaca4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbaca8:	54000321	b.ne	0xfffff7fbad0c  // b.any
   0x0000fffff7fbacac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fbacb0:	9e620120	scvtf	d0, x9
   0x0000fffff7fbacb4:	14000002	b	0xfffff7fbacbc
   0x0000fffff7fbacb8:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fbacbc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbacc0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbacc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbacc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbaccc:	54000120	b.eq	0xfffff7fbacf0  // b.none
   0x0000fffff7fbacd0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbacd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbacd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbacdc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbace0:	54000161	b.ne	0xfffff7fbad0c  // b.any
   0x0000fffff7fbace4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbace8:	9e620121	scvtf	d1, x9
   0x0000fffff7fbacec:	14000002	b	0xfffff7fbacf4
   0x0000fffff7fbacf0:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fbacf4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbacf8:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fbacfc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbad00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbad04:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fbad08:	17ffffde	b	0xfffff7fbac80
   0x0000fffff7fbad0c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbad10:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbad14:	aa1303e1	mov	x1, x19
   0x0000fffff7fbad18:	aa1503e2	mov	x2, x21
   0x0000fffff7fbad1c:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fbad20:	aa1403e4	mov	x4, x20
   0x0000fffff7fbad24:	aa1603e5	mov	x5, x22
   0x0000fffff7fbad28:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbad2c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbad30:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbad34:	d63f0200	blr	x16
   0x0000fffff7fbad38:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbad3c:	540012a0	b.eq	0xfffff7fbaf90  // b.none
   0x0000fffff7fbad40:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbad44:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbad48:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbad4c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbad50:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbad54:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fbad58:	36d801d1	tbz	w17, #27, 0xfffff7fbad90
   0x0000fffff7fbad5c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbad60:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbad64:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbad68:	54000281	b.ne	0xfffff7fbadb8  // b.any
   0x0000fffff7fbad6c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fbad70:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbad74:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbad78:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbad7c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbad80:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbad84:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbad88:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbad8c:	54000169	b.ls	0xfffff7fbadb8  // b.plast
   0x0000fffff7fbad90:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbad94:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbad98:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbad9c:	36d80091	tbz	w17, #27, 0xfffff7fbadac
   0x0000fffff7fbada0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbada4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbada8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbadac:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fbadb0:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fbadb4:	1400000e	b	0xfffff7fbadec
   0x0000fffff7fbadb8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbadbc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbadc0:	aa1303e1	mov	x1, x19
   0x0000fffff7fbadc4:	aa1503e2	mov	x2, x21
   0x0000fffff7fbadc8:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fbadcc:	aa1403e4	mov	x4, x20
   0x0000fffff7fbadd0:	aa1603e5	mov	x5, x22
   0x0000fffff7fbadd4:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fbadd8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbaddc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbade0:	d63f0200	blr	x16
   0x0000fffff7fbade4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbade8:	54000d80	b.eq	0xfffff7fbaf98  // b.none
   0x0000fffff7fbadec:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbadf0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbadf4:	540003a0	b.eq	0xfffff7fbae68  // b.none
   0x0000fffff7fbadf8:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fbadfc:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fbae00:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbae04:	36d801d1	tbz	w17, #27, 0xfffff7fbae3c
   0x0000fffff7fbae08:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbae0c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbae10:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbae14:	540002a1	b.ne	0xfffff7fbae68  // b.any
   0x0000fffff7fbae18:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbae1c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbae20:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbae24:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbae28:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbae2c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbae30:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbae34:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbae38:	54000189	b.ls	0xfffff7fbae68  // b.plast
   0x0000fffff7fbae3c:	36d8008d	tbz	w13, #27, 0xfffff7fbae4c
   0x0000fffff7fbae40:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbae44:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbae48:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbae4c:	36d80091	tbz	w17, #27, 0xfffff7fbae5c
   0x0000fffff7fbae50:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbae54:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbae58:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbae5c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbae60:	b900016d	str	w13, [x11]
   0x0000fffff7fbae64:	1400000e	b	0xfffff7fbae9c
   0x0000fffff7fbae68:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbae6c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbae70:	aa1303e1	mov	x1, x19
   0x0000fffff7fbae74:	aa1503e2	mov	x2, x21
   0x0000fffff7fbae78:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fbae7c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbae80:	aa1603e5	mov	x5, x22
   0x0000fffff7fbae84:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fbae88:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbae8c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbae90:	d63f0200	blr	x16
   0x0000fffff7fbae94:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbae98:	54000840	b.eq	0xfffff7fbafa0  // b.none
   0x0000fffff7fbae9c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbaea0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbaea4:	aa1303e1	mov	x1, x19
   0x0000fffff7fbaea8:	aa1503e2	mov	x2, x21
   0x0000fffff7fbaeac:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fbaeb0:	aa1403e4	mov	x4, x20
   0x0000fffff7fbaeb4:	aa1603e5	mov	x5, x22
   0x0000fffff7fbaeb8:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7fbaebc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbaec0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbaec4:	d63f0200	blr	x16
   0x0000fffff7fbaec8:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fbaecc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fbaed0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fbaed4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fbaed8:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fbaedc:	d65f03c0	ret
   0x0000fffff7fbaee0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbaee4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbaee8:	b900028a	str	w10, [x20]
   0x0000fffff7fbaeec:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fbaef0:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fbaef4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fbaef8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fbaefc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fbaf00:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fbaf04:	d65f03c0	ret
   0x0000fffff7fbaf08:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fbaf0c:	17fffff5	b	0xfffff7fbaee0
   0x0000fffff7fbaf10:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fbaf14:	17fffff3	b	0xfffff7fbaee0
   0x0000fffff7fbaf18:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fbaf1c:	17fffff1	b	0xfffff7fbaee0
   0x0000fffff7fbaf20:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7fbaf24:	17ffffef	b	0xfffff7fbaee0
   0x0000fffff7fbaf28:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7fbaf2c:	17ffffed	b	0xfffff7fbaee0
   0x0000fffff7fbaf30:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fbaf34:	17ffffeb	b	0xfffff7fbaee0
   0x0000fffff7fbaf38:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fbaf3c:	17ffffe9	b	0xfffff7fbaee0
   0x0000fffff7fbaf40:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fbaf44:	17ffffe7	b	0xfffff7fbaee0
   0x0000fffff7fbaf48:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fbaf4c:	17ffffe5	b	0xfffff7fbaee0
   0x0000fffff7fbaf50:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fbaf54:	17ffffe3	b	0xfffff7fbaee0
   0x0000fffff7fbaf58:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fbaf5c:	17ffffe1	b	0xfffff7fbaee0
   0x0000fffff7fbaf60:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fbaf64:	17ffffdf	b	0xfffff7fbaee0
   0x0000fffff7fbaf68:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fbaf6c:	17ffffdd	b	0xfffff7fbaee0
   0x0000fffff7fbaf70:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fbaf74:	17ffffdb	b	0xfffff7fbaee0
   0x0000fffff7fbaf78:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fbaf7c:	17ffffd9	b	0xfffff7fbaee0
   0x0000fffff7fbaf80:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fbaf84:	17ffffd7	b	0xfffff7fbaee0
   0x0000fffff7fbaf88:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fbaf8c:	17ffffd5	b	0xfffff7fbaee0
   0x0000fffff7fbaf90:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fbaf94:	17ffffd3	b	0xfffff7fbaee0
   0x0000fffff7fbaf98:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fbaf9c:	17ffffd1	b	0xfffff7fbaee0
   0x0000fffff7fbafa0:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fbafa4:	17ffffcf	b	0xfffff7fbaee0
   0x0000fffff7fbafa8:	00000000	udf	#0
   0x0000fffff7fbafac:	00000000	udf	#0
   0x0000fffff7fbafb0:	00000000	udf	#0
   0x0000fffff7fbafb4:	00000000	udf	#0
   0x0000fffff7fbafb8:	00000000	udf	#0
   0x0000fffff7fbafbc:	00000000	udf	#0
   0x0000fffff7fbafc0:	00000000	udf	#0
   0x0000fffff7fbafc4:	00000000	udf	#0
   0x0000fffff7fbafc8:	00000000	udf	#0
   0x0000fffff7fbafcc:	00000000	udf	#0
   0x0000fffff7fbafd0:	00000000	udf	#0
   0x0000fffff7fbafd4:	00000000	udf	#0
   0x0000fffff7fbafd8:	00000000	udf	#0
   0x0000fffff7fbafdc:	00000000	udf	#0
   0x0000fffff7fbafe0:	00000000	udf	#0
   0x0000fffff7fbafe4:	00000000	udf	#0
   0x0000fffff7fbafe8:	00000000	udf	#0
   0x0000fffff7fbafec:	00000000	udf	#0
   0x0000fffff7fbaff0:	00000000	udf	#0
   0x0000fffff7fbaff4:	00000000	udf	#0
   0x0000fffff7fbaff8:	00000000	udf	#0
   0x0000fffff7fbaffc:	00000000	udf	#0
End of assembler dump.
