Dump of assembler code from 0xfffff7fba000 to 0xfffff7fbc000:
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
   0x0000fffff7fba100:	5400d780	b.eq	0xfffff7fbbbf0  // b.none
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
   0x0000fffff7fba190:	5400d340	b.eq	0xfffff7fbbbf8  // b.none
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
   0x0000fffff7fba1c4:	5400d1e0	b.eq	0xfffff7fbbc00  // b.none
   0x0000fffff7fba1c8:	14000001	b	0xfffff7fba1cc
   0x0000fffff7fba1cc:	14000001	b	0xfffff7fba1d0
   0x0000fffff7fba1d0:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fba1d4:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fba1d8:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fba1dc:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fba1e0:	36d80211	tbz	w17, #27, 0xfffff7fba220
   0x0000fffff7fba1e4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba1e8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba1ec:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba1f0:	540001e1	b.ne	0xfffff7fba22c  // b.any
   0x0000fffff7fba1f4:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fba1f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba1fc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba200:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba204:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba208:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba20c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba210:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba214:	540000c9	b.ls	0xfffff7fba22c  // b.plast
   0x0000fffff7fba218:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba21c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba220:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fba224:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fba228:	1400000e	b	0xfffff7fba260
   0x0000fffff7fba22c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba230:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba234:	aa1303e1	mov	x1, x19
   0x0000fffff7fba238:	aa1503e2	mov	x2, x21
   0x0000fffff7fba23c:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fba240:	aa1403e4	mov	x4, x20
   0x0000fffff7fba244:	aa1603e5	mov	x5, x22
   0x0000fffff7fba248:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fba24c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba250:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba254:	d63f0200	blr	x16
   0x0000fffff7fba258:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba25c:	5400cd60	b.eq	0xfffff7fbbc08  // b.none
   0x0000fffff7fba260:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fba264:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba268:	aa1303e1	mov	x1, x19
   0x0000fffff7fba26c:	aa1503e2	mov	x2, x21
   0x0000fffff7fba270:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fba274:	aa1403e4	mov	x4, x20
   0x0000fffff7fba278:	aa1603e5	mov	x5, x22
   0x0000fffff7fba27c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fba280:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba284:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba288:	d63f0200	blr	x16
   0x0000fffff7fba28c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba290:	5400cc00	b.eq	0xfffff7fbbc10  // b.none
   0x0000fffff7fba294:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba298:	37d806a9	tbnz	w9, #27, 0xfffff7fba36c
   0x0000fffff7fba29c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba2a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba2a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba2a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba2ac:	540001c1	b.ne	0xfffff7fba2e4  // b.any
   0x0000fffff7fba2b0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fba2b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba2b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba2bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba2c0:	54000121	b.ne	0xfffff7fba2e4  // b.any
   0x0000fffff7fba2c4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fba2c8:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fba2cc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fba2d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba2d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba2d8:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fba2dc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fba2e0:	14000030	b	0xfffff7fba3a0
   0x0000fffff7fba2e4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba2e8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba2ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba2f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba2f4:	54000120	b.eq	0xfffff7fba318  // b.none
   0x0000fffff7fba2f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba2fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba300:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba304:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba308:	54000321	b.ne	0xfffff7fba36c  // b.any
   0x0000fffff7fba30c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fba310:	9e620120	scvtf	d0, x9
   0x0000fffff7fba314:	14000002	b	0xfffff7fba31c
   0x0000fffff7fba318:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fba31c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fba320:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba324:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba328:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba32c:	54000120	b.eq	0xfffff7fba350  // b.none
   0x0000fffff7fba330:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fba334:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba338:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba33c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba340:	54000161	b.ne	0xfffff7fba36c  // b.any
   0x0000fffff7fba344:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fba348:	9e620121	scvtf	d1, x9
   0x0000fffff7fba34c:	14000002	b	0xfffff7fba354
   0x0000fffff7fba350:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fba354:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fba358:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fba35c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba360:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba364:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fba368:	17ffffde	b	0xfffff7fba2e0
   0x0000fffff7fba36c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba370:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba374:	aa1303e1	mov	x1, x19
   0x0000fffff7fba378:	aa1503e2	mov	x2, x21
   0x0000fffff7fba37c:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fba380:	aa1403e4	mov	x4, x20
   0x0000fffff7fba384:	aa1603e5	mov	x5, x22
   0x0000fffff7fba388:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fba38c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fba390:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba394:	d63f0200	blr	x16
   0x0000fffff7fba398:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba39c:	5400c3e0	b.eq	0xfffff7fbbc18  // b.none
   0x0000fffff7fba3a0:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fba3a4:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fba3a8:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fba3ac:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fba3b0:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fba3b4:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fba3b8:	36d801d1	tbz	w17, #27, 0xfffff7fba3f0
   0x0000fffff7fba3bc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba3c0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba3c4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba3c8:	54000281	b.ne	0xfffff7fba418  // b.any
   0x0000fffff7fba3cc:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fba3d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba3d4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba3d8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba3dc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba3e0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba3e4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba3e8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba3ec:	54000169	b.ls	0xfffff7fba418  // b.plast
   0x0000fffff7fba3f0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba3f4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba3f8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba3fc:	36d80091	tbz	w17, #27, 0xfffff7fba40c
   0x0000fffff7fba400:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba404:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba408:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba40c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fba410:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fba414:	1400000e	b	0xfffff7fba44c
   0x0000fffff7fba418:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba41c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba420:	aa1303e1	mov	x1, x19
   0x0000fffff7fba424:	aa1503e2	mov	x2, x21
   0x0000fffff7fba428:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fba42c:	aa1403e4	mov	x4, x20
   0x0000fffff7fba430:	aa1603e5	mov	x5, x22
   0x0000fffff7fba434:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fba438:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fba43c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba440:	d63f0200	blr	x16
   0x0000fffff7fba444:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba448:	5400bec0	b.eq	0xfffff7fbbc20  // b.none
   0x0000fffff7fba44c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fba450:	f100017f	cmp	x11, #0x0
   0x0000fffff7fba454:	540003a0	b.eq	0xfffff7fba4c8  // b.none
   0x0000fffff7fba458:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fba45c:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fba460:	b9400171	ldr	w17, [x11]
   0x0000fffff7fba464:	36d801d1	tbz	w17, #27, 0xfffff7fba49c
   0x0000fffff7fba468:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba46c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba470:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba474:	540002a1	b.ne	0xfffff7fba4c8  // b.any
   0x0000fffff7fba478:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fba47c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba480:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba484:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba488:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba48c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba490:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba494:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba498:	54000189	b.ls	0xfffff7fba4c8  // b.plast
   0x0000fffff7fba49c:	36d8008d	tbz	w13, #27, 0xfffff7fba4ac
   0x0000fffff7fba4a0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba4a4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba4a8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba4ac:	36d80091	tbz	w17, #27, 0xfffff7fba4bc
   0x0000fffff7fba4b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba4b4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba4b8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba4bc:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fba4c0:	b900016d	str	w13, [x11]
   0x0000fffff7fba4c4:	1400000e	b	0xfffff7fba4fc
   0x0000fffff7fba4c8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fba4cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba4d0:	aa1303e1	mov	x1, x19
   0x0000fffff7fba4d4:	aa1503e2	mov	x2, x21
   0x0000fffff7fba4d8:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fba4dc:	aa1403e4	mov	x4, x20
   0x0000fffff7fba4e0:	aa1603e5	mov	x5, x22
   0x0000fffff7fba4e4:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fba4e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba4ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba4f0:	d63f0200	blr	x16
   0x0000fffff7fba4f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba4f8:	5400b980	b.eq	0xfffff7fbbc28  // b.none
   0x0000fffff7fba4fc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fba500:	f100017f	cmp	x11, #0x0
   0x0000fffff7fba504:	540004a0	b.eq	0xfffff7fba598  // b.none
   0x0000fffff7fba508:	b940016d	ldr	w13, [x11]
   0x0000fffff7fba50c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fba510:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fba514:	eb0901bf	cmp	x13, x9
   0x0000fffff7fba518:	54000400	b.eq	0xfffff7fba598  // b.none
   0x0000fffff7fba51c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fba520:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fba524:	36d801d1	tbz	w17, #27, 0xfffff7fba55c
   0x0000fffff7fba528:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba52c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba530:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba534:	54000321	b.ne	0xfffff7fba598  // b.any
   0x0000fffff7fba538:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fba53c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba540:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba544:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba548:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba54c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba550:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba554:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba558:	54000209	b.ls	0xfffff7fba598  // b.plast
   0x0000fffff7fba55c:	36d8008d	tbz	w13, #27, 0xfffff7fba56c
   0x0000fffff7fba560:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba564:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba568:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba56c:	36d80091	tbz	w17, #27, 0xfffff7fba57c
   0x0000fffff7fba570:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba574:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba578:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba57c:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fba580:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fba584:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fba588:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fba58c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fba590:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fba594:	1400000e	b	0xfffff7fba5cc
   0x0000fffff7fba598:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fba59c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba5a0:	aa1303e1	mov	x1, x19
   0x0000fffff7fba5a4:	aa1503e2	mov	x2, x21
   0x0000fffff7fba5a8:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fba5ac:	aa1403e4	mov	x4, x20
   0x0000fffff7fba5b0:	aa1603e5	mov	x5, x22
   0x0000fffff7fba5b4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fba5b8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba5bc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba5c0:	d63f0200	blr	x16
   0x0000fffff7fba5c4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba5c8:	5400b340	b.eq	0xfffff7fbbc30  // b.none
   0x0000fffff7fba5cc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba5d0:	37d806a9	tbnz	w9, #27, 0xfffff7fba6a4
   0x0000fffff7fba5d4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba5d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba5dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba5e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba5e4:	540001c1	b.ne	0xfffff7fba61c  // b.any
   0x0000fffff7fba5e8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fba5ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba5f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba5f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba5f8:	54000121	b.ne	0xfffff7fba61c  // b.any
   0x0000fffff7fba5fc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fba600:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fba604:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fba608:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba60c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba610:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fba614:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fba618:	14000030	b	0xfffff7fba6d8
   0x0000fffff7fba61c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba620:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba624:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba628:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba62c:	54000120	b.eq	0xfffff7fba650  // b.none
   0x0000fffff7fba630:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba634:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba638:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba63c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba640:	54000321	b.ne	0xfffff7fba6a4  // b.any
   0x0000fffff7fba644:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fba648:	9e620120	scvtf	d0, x9
   0x0000fffff7fba64c:	14000002	b	0xfffff7fba654
   0x0000fffff7fba650:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fba654:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fba658:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba65c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba660:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba664:	54000120	b.eq	0xfffff7fba688  // b.none
   0x0000fffff7fba668:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fba66c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba670:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba674:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba678:	54000161	b.ne	0xfffff7fba6a4  // b.any
   0x0000fffff7fba67c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fba680:	9e620121	scvtf	d1, x9
   0x0000fffff7fba684:	14000002	b	0xfffff7fba68c
   0x0000fffff7fba688:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fba68c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fba690:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fba694:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba698:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba69c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fba6a0:	17ffffde	b	0xfffff7fba618
   0x0000fffff7fba6a4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba6a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba6ac:	aa1303e1	mov	x1, x19
   0x0000fffff7fba6b0:	aa1503e2	mov	x2, x21
   0x0000fffff7fba6b4:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fba6b8:	aa1403e4	mov	x4, x20
   0x0000fffff7fba6bc:	aa1603e5	mov	x5, x22
   0x0000fffff7fba6c0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fba6c4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fba6c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba6cc:	d63f0200	blr	x16
   0x0000fffff7fba6d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba6d4:	5400ab20	b.eq	0xfffff7fbbc38  // b.none
   0x0000fffff7fba6d8:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fba6dc:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fba6e0:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fba6e4:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fba6e8:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fba6ec:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fba6f0:	36d801d1	tbz	w17, #27, 0xfffff7fba728
   0x0000fffff7fba6f4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba6f8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba6fc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba700:	54000281	b.ne	0xfffff7fba750  // b.any
   0x0000fffff7fba704:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fba708:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba70c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba710:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba714:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba718:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba71c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba720:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba724:	54000169	b.ls	0xfffff7fba750  // b.plast
   0x0000fffff7fba728:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba72c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba730:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba734:	36d80091	tbz	w17, #27, 0xfffff7fba744
   0x0000fffff7fba738:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba73c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba740:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba744:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fba748:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fba74c:	1400000e	b	0xfffff7fba784
   0x0000fffff7fba750:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba754:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba758:	aa1303e1	mov	x1, x19
   0x0000fffff7fba75c:	aa1503e2	mov	x2, x21
   0x0000fffff7fba760:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fba764:	aa1403e4	mov	x4, x20
   0x0000fffff7fba768:	aa1603e5	mov	x5, x22
   0x0000fffff7fba76c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fba770:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fba774:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba778:	d63f0200	blr	x16
   0x0000fffff7fba77c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba780:	5400a600	b.eq	0xfffff7fbbc40  // b.none
   0x0000fffff7fba784:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fba788:	f100017f	cmp	x11, #0x0
   0x0000fffff7fba78c:	540003a0	b.eq	0xfffff7fba800  // b.none
   0x0000fffff7fba790:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fba794:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fba798:	b9400171	ldr	w17, [x11]
   0x0000fffff7fba79c:	36d801d1	tbz	w17, #27, 0xfffff7fba7d4
   0x0000fffff7fba7a0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba7a4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba7a8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba7ac:	540002a1	b.ne	0xfffff7fba800  // b.any
   0x0000fffff7fba7b0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fba7b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba7b8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba7bc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba7c0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba7c4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba7c8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba7cc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba7d0:	54000189	b.ls	0xfffff7fba800  // b.plast
   0x0000fffff7fba7d4:	36d8008d	tbz	w13, #27, 0xfffff7fba7e4
   0x0000fffff7fba7d8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba7dc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba7e0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba7e4:	36d80091	tbz	w17, #27, 0xfffff7fba7f4
   0x0000fffff7fba7e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba7ec:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba7f0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba7f4:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fba7f8:	b900016d	str	w13, [x11]
   0x0000fffff7fba7fc:	1400000e	b	0xfffff7fba834
   0x0000fffff7fba800:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fba804:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba808:	aa1303e1	mov	x1, x19
   0x0000fffff7fba80c:	aa1503e2	mov	x2, x21
   0x0000fffff7fba810:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fba814:	aa1403e4	mov	x4, x20
   0x0000fffff7fba818:	aa1603e5	mov	x5, x22
   0x0000fffff7fba81c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fba820:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba824:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba828:	d63f0200	blr	x16
   0x0000fffff7fba82c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba830:	5400a0c0	b.eq	0xfffff7fbbc48  // b.none
   0x0000fffff7fba834:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fba838:	f100017f	cmp	x11, #0x0
   0x0000fffff7fba83c:	540004a0	b.eq	0xfffff7fba8d0  // b.none
   0x0000fffff7fba840:	b940016d	ldr	w13, [x11]
   0x0000fffff7fba844:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fba848:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fba84c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fba850:	54000400	b.eq	0xfffff7fba8d0  // b.none
   0x0000fffff7fba854:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fba858:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fba85c:	36d801d1	tbz	w17, #27, 0xfffff7fba894
   0x0000fffff7fba860:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba864:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba868:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba86c:	54000321	b.ne	0xfffff7fba8d0  // b.any
   0x0000fffff7fba870:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fba874:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba878:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba87c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba880:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba884:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba888:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba88c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba890:	54000209	b.ls	0xfffff7fba8d0  // b.plast
   0x0000fffff7fba894:	36d8008d	tbz	w13, #27, 0xfffff7fba8a4
   0x0000fffff7fba898:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba89c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba8a0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba8a4:	36d80091	tbz	w17, #27, 0xfffff7fba8b4
   0x0000fffff7fba8a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba8ac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba8b0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba8b4:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fba8b8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fba8bc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fba8c0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fba8c4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fba8c8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fba8cc:	1400000e	b	0xfffff7fba904
   0x0000fffff7fba8d0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fba8d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba8d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fba8dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fba8e0:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fba8e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fba8e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fba8ec:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fba8f0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba8f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba8f8:	d63f0200	blr	x16
   0x0000fffff7fba8fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba900:	54009a80	b.eq	0xfffff7fbbc50  // b.none
   0x0000fffff7fba904:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba908:	37d806a9	tbnz	w9, #27, 0xfffff7fba9dc
   0x0000fffff7fba90c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba910:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba914:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba918:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba91c:	540001c1	b.ne	0xfffff7fba954  // b.any
   0x0000fffff7fba920:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fba924:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba928:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba92c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba930:	54000121	b.ne	0xfffff7fba954  // b.any
   0x0000fffff7fba934:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fba938:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fba93c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fba940:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba944:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba948:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fba94c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fba950:	14000030	b	0xfffff7fbaa10
   0x0000fffff7fba954:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba958:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba95c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba960:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba964:	54000120	b.eq	0xfffff7fba988  // b.none
   0x0000fffff7fba968:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba96c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba970:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba974:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba978:	54000321	b.ne	0xfffff7fba9dc  // b.any
   0x0000fffff7fba97c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fba980:	9e620120	scvtf	d0, x9
   0x0000fffff7fba984:	14000002	b	0xfffff7fba98c
   0x0000fffff7fba988:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fba98c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fba990:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba994:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba998:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba99c:	54000120	b.eq	0xfffff7fba9c0  // b.none
   0x0000fffff7fba9a0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fba9a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba9a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba9ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba9b0:	54000161	b.ne	0xfffff7fba9dc  // b.any
   0x0000fffff7fba9b4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fba9b8:	9e620121	scvtf	d1, x9
   0x0000fffff7fba9bc:	14000002	b	0xfffff7fba9c4
   0x0000fffff7fba9c0:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fba9c4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fba9c8:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fba9cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba9d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba9d4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fba9d8:	17ffffde	b	0xfffff7fba950
   0x0000fffff7fba9dc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba9e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba9e4:	aa1303e1	mov	x1, x19
   0x0000fffff7fba9e8:	aa1503e2	mov	x2, x21
   0x0000fffff7fba9ec:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fba9f0:	aa1403e4	mov	x4, x20
   0x0000fffff7fba9f4:	aa1603e5	mov	x5, x22
   0x0000fffff7fba9f8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fba9fc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbaa00:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbaa04:	d63f0200	blr	x16
   0x0000fffff7fbaa08:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbaa0c:	54009260	b.eq	0xfffff7fbbc58  // b.none
   0x0000fffff7fbaa10:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbaa14:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbaa18:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbaa1c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbaa20:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbaa24:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbaa28:	36d801d1	tbz	w17, #27, 0xfffff7fbaa60
   0x0000fffff7fbaa2c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbaa30:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbaa34:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbaa38:	54000281	b.ne	0xfffff7fbaa88  // b.any
   0x0000fffff7fbaa3c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbaa40:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbaa44:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbaa48:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbaa4c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbaa50:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbaa54:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbaa58:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbaa5c:	54000169	b.ls	0xfffff7fbaa88  // b.plast
   0x0000fffff7fbaa60:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbaa64:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbaa68:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbaa6c:	36d80091	tbz	w17, #27, 0xfffff7fbaa7c
   0x0000fffff7fbaa70:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbaa74:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbaa78:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbaa7c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbaa80:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbaa84:	1400000e	b	0xfffff7fbaabc
   0x0000fffff7fbaa88:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbaa8c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbaa90:	aa1303e1	mov	x1, x19
   0x0000fffff7fbaa94:	aa1503e2	mov	x2, x21
   0x0000fffff7fbaa98:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fbaa9c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbaaa0:	aa1603e5	mov	x5, x22
   0x0000fffff7fbaaa4:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fbaaa8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbaaac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbaab0:	d63f0200	blr	x16
   0x0000fffff7fbaab4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbaab8:	54008d40	b.eq	0xfffff7fbbc60  // b.none
   0x0000fffff7fbaabc:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbaac0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbaac4:	540003a0	b.eq	0xfffff7fbab38  // b.none
   0x0000fffff7fbaac8:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbaacc:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbaad0:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbaad4:	36d801d1	tbz	w17, #27, 0xfffff7fbab0c
   0x0000fffff7fbaad8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbaadc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbaae0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbaae4:	540002a1	b.ne	0xfffff7fbab38  // b.any
   0x0000fffff7fbaae8:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbaaec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbaaf0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbaaf4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbaaf8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbaafc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbab00:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbab04:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbab08:	54000189	b.ls	0xfffff7fbab38  // b.plast
   0x0000fffff7fbab0c:	36d8008d	tbz	w13, #27, 0xfffff7fbab1c
   0x0000fffff7fbab10:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbab14:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbab18:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbab1c:	36d80091	tbz	w17, #27, 0xfffff7fbab2c
   0x0000fffff7fbab20:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbab24:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbab28:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbab2c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbab30:	b900016d	str	w13, [x11]
   0x0000fffff7fbab34:	1400000e	b	0xfffff7fbab6c
   0x0000fffff7fbab38:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbab3c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbab40:	aa1303e1	mov	x1, x19
   0x0000fffff7fbab44:	aa1503e2	mov	x2, x21
   0x0000fffff7fbab48:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fbab4c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbab50:	aa1603e5	mov	x5, x22
   0x0000fffff7fbab54:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fbab58:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbab5c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbab60:	d63f0200	blr	x16
   0x0000fffff7fbab64:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbab68:	54008800	b.eq	0xfffff7fbbc68  // b.none
   0x0000fffff7fbab6c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbab70:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbab74:	540004a0	b.eq	0xfffff7fbac08  // b.none
   0x0000fffff7fbab78:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbab7c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbab80:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbab84:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbab88:	54000400	b.eq	0xfffff7fbac08  // b.none
   0x0000fffff7fbab8c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbab90:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbab94:	36d801d1	tbz	w17, #27, 0xfffff7fbabcc
   0x0000fffff7fbab98:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbab9c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbaba0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbaba4:	54000321	b.ne	0xfffff7fbac08  // b.any
   0x0000fffff7fbaba8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbabac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbabb0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbabb4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbabb8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbabbc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbabc0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbabc4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbabc8:	54000209	b.ls	0xfffff7fbac08  // b.plast
   0x0000fffff7fbabcc:	36d8008d	tbz	w13, #27, 0xfffff7fbabdc
   0x0000fffff7fbabd0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbabd4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbabd8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbabdc:	36d80091	tbz	w17, #27, 0xfffff7fbabec
   0x0000fffff7fbabe0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbabe4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbabe8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbabec:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fbabf0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbabf4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbabf8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbabfc:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbac00:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbac04:	1400000e	b	0xfffff7fbac3c
   0x0000fffff7fbac08:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbac0c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbac10:	aa1303e1	mov	x1, x19
   0x0000fffff7fbac14:	aa1503e2	mov	x2, x21
   0x0000fffff7fbac18:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fbac1c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbac20:	aa1603e5	mov	x5, x22
   0x0000fffff7fbac24:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbac28:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbac2c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbac30:	d63f0200	blr	x16
   0x0000fffff7fbac34:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbac38:	540081c0	b.eq	0xfffff7fbbc70  // b.none
   0x0000fffff7fbac3c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbac40:	37d806a9	tbnz	w9, #27, 0xfffff7fbad14
   0x0000fffff7fbac44:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbac48:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbac4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbac50:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbac54:	540001c1	b.ne	0xfffff7fbac8c  // b.any
   0x0000fffff7fbac58:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbac5c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbac60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbac64:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbac68:	54000121	b.ne	0xfffff7fbac8c  // b.any
   0x0000fffff7fbac6c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbac70:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fbac74:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbac78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbac7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbac80:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbac84:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbac88:	14000030	b	0xfffff7fbad48
   0x0000fffff7fbac8c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbac90:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbac94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbac98:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbac9c:	54000120	b.eq	0xfffff7fbacc0  // b.none
   0x0000fffff7fbaca0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbaca4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbaca8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbacac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbacb0:	54000321	b.ne	0xfffff7fbad14  // b.any
   0x0000fffff7fbacb4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbacb8:	9e620120	scvtf	d0, x9
   0x0000fffff7fbacbc:	14000002	b	0xfffff7fbacc4
   0x0000fffff7fbacc0:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbacc4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbacc8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbaccc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbacd0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbacd4:	54000120	b.eq	0xfffff7fbacf8  // b.none
   0x0000fffff7fbacd8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbacdc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbace0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbace4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbace8:	54000161	b.ne	0xfffff7fbad14  // b.any
   0x0000fffff7fbacec:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbacf0:	9e620121	scvtf	d1, x9
   0x0000fffff7fbacf4:	14000002	b	0xfffff7fbacfc
   0x0000fffff7fbacf8:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fbacfc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbad00:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbad04:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbad08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbad0c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbad10:	17ffffde	b	0xfffff7fbac88
   0x0000fffff7fbad14:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbad18:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbad1c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbad20:	aa1503e2	mov	x2, x21
   0x0000fffff7fbad24:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fbad28:	aa1403e4	mov	x4, x20
   0x0000fffff7fbad2c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbad30:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbad34:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbad38:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbad3c:	d63f0200	blr	x16
   0x0000fffff7fbad40:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbad44:	540079a0	b.eq	0xfffff7fbbc78  // b.none
   0x0000fffff7fbad48:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbad4c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbad50:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbad54:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbad58:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbad5c:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbad60:	36d801d1	tbz	w17, #27, 0xfffff7fbad98
   0x0000fffff7fbad64:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbad68:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbad6c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbad70:	54000281	b.ne	0xfffff7fbadc0  // b.any
   0x0000fffff7fbad74:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbad78:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbad7c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbad80:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbad84:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbad88:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbad8c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbad90:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbad94:	54000169	b.ls	0xfffff7fbadc0  // b.plast
   0x0000fffff7fbad98:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbad9c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbada0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbada4:	36d80091	tbz	w17, #27, 0xfffff7fbadb4
   0x0000fffff7fbada8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbadac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbadb0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbadb4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbadb8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbadbc:	1400000e	b	0xfffff7fbadf4
   0x0000fffff7fbadc0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbadc4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbadc8:	aa1303e1	mov	x1, x19
   0x0000fffff7fbadcc:	aa1503e2	mov	x2, x21
   0x0000fffff7fbadd0:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fbadd4:	aa1403e4	mov	x4, x20
   0x0000fffff7fbadd8:	aa1603e5	mov	x5, x22
   0x0000fffff7fbaddc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fbade0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbade4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbade8:	d63f0200	blr	x16
   0x0000fffff7fbadec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbadf0:	54007480	b.eq	0xfffff7fbbc80  // b.none
   0x0000fffff7fbadf4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbadf8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbadfc:	540003a0	b.eq	0xfffff7fbae70  // b.none
   0x0000fffff7fbae00:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbae04:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbae08:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbae0c:	36d801d1	tbz	w17, #27, 0xfffff7fbae44
   0x0000fffff7fbae10:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbae14:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbae18:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbae1c:	540002a1	b.ne	0xfffff7fbae70  // b.any
   0x0000fffff7fbae20:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbae24:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbae28:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbae2c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbae30:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbae34:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbae38:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbae3c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbae40:	54000189	b.ls	0xfffff7fbae70  // b.plast
   0x0000fffff7fbae44:	36d8008d	tbz	w13, #27, 0xfffff7fbae54
   0x0000fffff7fbae48:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbae4c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbae50:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbae54:	36d80091	tbz	w17, #27, 0xfffff7fbae64
   0x0000fffff7fbae58:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbae5c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbae60:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbae64:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbae68:	b900016d	str	w13, [x11]
   0x0000fffff7fbae6c:	1400000e	b	0xfffff7fbaea4
   0x0000fffff7fbae70:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbae74:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbae78:	aa1303e1	mov	x1, x19
   0x0000fffff7fbae7c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbae80:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fbae84:	aa1403e4	mov	x4, x20
   0x0000fffff7fbae88:	aa1603e5	mov	x5, x22
   0x0000fffff7fbae8c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fbae90:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbae94:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbae98:	d63f0200	blr	x16
   0x0000fffff7fbae9c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbaea0:	54006f40	b.eq	0xfffff7fbbc88  // b.none
   0x0000fffff7fbaea4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbaea8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbaeac:	540004a0	b.eq	0xfffff7fbaf40  // b.none
   0x0000fffff7fbaeb0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbaeb4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbaeb8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbaebc:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbaec0:	54000400	b.eq	0xfffff7fbaf40  // b.none
   0x0000fffff7fbaec4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbaec8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbaecc:	36d801d1	tbz	w17, #27, 0xfffff7fbaf04
   0x0000fffff7fbaed0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbaed4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbaed8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbaedc:	54000321	b.ne	0xfffff7fbaf40  // b.any
   0x0000fffff7fbaee0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbaee4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbaee8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbaeec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbaef0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbaef4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbaef8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbaefc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbaf00:	54000209	b.ls	0xfffff7fbaf40  // b.plast
   0x0000fffff7fbaf04:	36d8008d	tbz	w13, #27, 0xfffff7fbaf14
   0x0000fffff7fbaf08:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbaf0c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbaf10:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbaf14:	36d80091	tbz	w17, #27, 0xfffff7fbaf24
   0x0000fffff7fbaf18:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbaf1c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbaf20:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbaf24:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fbaf28:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbaf2c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbaf30:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbaf34:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbaf38:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbaf3c:	1400000e	b	0xfffff7fbaf74
   0x0000fffff7fbaf40:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbaf44:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbaf48:	aa1303e1	mov	x1, x19
   0x0000fffff7fbaf4c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbaf50:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fbaf54:	aa1403e4	mov	x4, x20
   0x0000fffff7fbaf58:	aa1603e5	mov	x5, x22
   0x0000fffff7fbaf5c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbaf60:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbaf64:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbaf68:	d63f0200	blr	x16
   0x0000fffff7fbaf6c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbaf70:	54006900	b.eq	0xfffff7fbbc90  // b.none
   0x0000fffff7fbaf74:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbaf78:	37d806a9	tbnz	w9, #27, 0xfffff7fbb04c
   0x0000fffff7fbaf7c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbaf80:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbaf84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbaf88:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbaf8c:	540001c1	b.ne	0xfffff7fbafc4  // b.any
   0x0000fffff7fbaf90:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbaf94:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbaf98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbaf9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbafa0:	54000121	b.ne	0xfffff7fbafc4  // b.any
   0x0000fffff7fbafa4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbafa8:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fbafac:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbafb0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbafb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbafb8:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbafbc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbafc0:	14000030	b	0xfffff7fbb080
   0x0000fffff7fbafc4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbafc8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbafcc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbafd0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbafd4:	54000120	b.eq	0xfffff7fbaff8  // b.none
   0x0000fffff7fbafd8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbafdc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbafe0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbafe4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbafe8:	54000321	b.ne	0xfffff7fbb04c  // b.any
   0x0000fffff7fbafec:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbaff0:	9e620120	scvtf	d0, x9
   0x0000fffff7fbaff4:	14000002	b	0xfffff7fbaffc
   0x0000fffff7fbaff8:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbaffc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb000:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb004:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb008:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb00c:	54000120	b.eq	0xfffff7fbb030  // b.none
   0x0000fffff7fbb010:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb014:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb018:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb01c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb020:	54000161	b.ne	0xfffff7fbb04c  // b.any
   0x0000fffff7fbb024:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbb028:	9e620121	scvtf	d1, x9
   0x0000fffff7fbb02c:	14000002	b	0xfffff7fbb034
   0x0000fffff7fbb030:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fbb034:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbb038:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbb03c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb040:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb044:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbb048:	17ffffde	b	0xfffff7fbafc0
   0x0000fffff7fbb04c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb050:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb054:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb058:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb05c:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fbb060:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb064:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb068:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbb06c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb070:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb074:	d63f0200	blr	x16
   0x0000fffff7fbb078:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb07c:	540060e0	b.eq	0xfffff7fbbc98  // b.none
   0x0000fffff7fbb080:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbb084:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbb088:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbb08c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbb090:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbb094:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbb098:	36d801d1	tbz	w17, #27, 0xfffff7fbb0d0
   0x0000fffff7fbb09c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb0a0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb0a4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb0a8:	54000281	b.ne	0xfffff7fbb0f8  // b.any
   0x0000fffff7fbb0ac:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbb0b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb0b4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb0b8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb0bc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb0c0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb0c4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb0c8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb0cc:	54000169	b.ls	0xfffff7fbb0f8  // b.plast
   0x0000fffff7fbb0d0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb0d4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb0d8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb0dc:	36d80091	tbz	w17, #27, 0xfffff7fbb0ec
   0x0000fffff7fbb0e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb0e4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb0e8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb0ec:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbb0f0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbb0f4:	1400000e	b	0xfffff7fbb12c
   0x0000fffff7fbb0f8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb0fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb100:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb104:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb108:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fbb10c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb110:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb114:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fbb118:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb11c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb120:	d63f0200	blr	x16
   0x0000fffff7fbb124:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb128:	54005bc0	b.eq	0xfffff7fbbca0  // b.none
   0x0000fffff7fbb12c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbb130:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbb134:	540003a0	b.eq	0xfffff7fbb1a8  // b.none
   0x0000fffff7fbb138:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbb13c:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbb140:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbb144:	36d801d1	tbz	w17, #27, 0xfffff7fbb17c
   0x0000fffff7fbb148:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb14c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb150:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb154:	540002a1	b.ne	0xfffff7fbb1a8  // b.any
   0x0000fffff7fbb158:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbb15c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb160:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb164:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb168:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb16c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb170:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb174:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb178:	54000189	b.ls	0xfffff7fbb1a8  // b.plast
   0x0000fffff7fbb17c:	36d8008d	tbz	w13, #27, 0xfffff7fbb18c
   0x0000fffff7fbb180:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb184:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb188:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb18c:	36d80091	tbz	w17, #27, 0xfffff7fbb19c
   0x0000fffff7fbb190:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb194:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb198:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb19c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbb1a0:	b900016d	str	w13, [x11]
   0x0000fffff7fbb1a4:	1400000e	b	0xfffff7fbb1dc
   0x0000fffff7fbb1a8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbb1ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb1b0:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb1b4:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb1b8:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fbb1bc:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb1c0:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb1c4:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fbb1c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbb1cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb1d0:	d63f0200	blr	x16
   0x0000fffff7fbb1d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb1d8:	54005680	b.eq	0xfffff7fbbca8  // b.none
   0x0000fffff7fbb1dc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbb1e0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbb1e4:	540004a0	b.eq	0xfffff7fbb278  // b.none
   0x0000fffff7fbb1e8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbb1ec:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbb1f0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbb1f4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbb1f8:	54000400	b.eq	0xfffff7fbb278  // b.none
   0x0000fffff7fbb1fc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbb200:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbb204:	36d801d1	tbz	w17, #27, 0xfffff7fbb23c
   0x0000fffff7fbb208:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb20c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb210:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb214:	54000321	b.ne	0xfffff7fbb278  // b.any
   0x0000fffff7fbb218:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbb21c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb220:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb224:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb228:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb22c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb230:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb234:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb238:	54000209	b.ls	0xfffff7fbb278  // b.plast
   0x0000fffff7fbb23c:	36d8008d	tbz	w13, #27, 0xfffff7fbb24c
   0x0000fffff7fbb240:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb244:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb248:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb24c:	36d80091	tbz	w17, #27, 0xfffff7fbb25c
   0x0000fffff7fbb250:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb254:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb258:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb25c:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fbb260:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbb264:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbb268:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbb26c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbb270:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbb274:	1400000e	b	0xfffff7fbb2ac
   0x0000fffff7fbb278:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbb27c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb280:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb284:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb288:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fbb28c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb290:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb294:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbb298:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbb29c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb2a0:	d63f0200	blr	x16
   0x0000fffff7fbb2a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb2a8:	54005040	b.eq	0xfffff7fbbcb0  // b.none
   0x0000fffff7fbb2ac:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb2b0:	37d806a9	tbnz	w9, #27, 0xfffff7fbb384
   0x0000fffff7fbb2b4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb2b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb2bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb2c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb2c4:	540001c1	b.ne	0xfffff7fbb2fc  // b.any
   0x0000fffff7fbb2c8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb2cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb2d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb2d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb2d8:	54000121	b.ne	0xfffff7fbb2fc  // b.any
   0x0000fffff7fbb2dc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbb2e0:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fbb2e4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbb2e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb2ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb2f0:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbb2f4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbb2f8:	14000030	b	0xfffff7fbb3b8
   0x0000fffff7fbb2fc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb300:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb304:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb308:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb30c:	54000120	b.eq	0xfffff7fbb330  // b.none
   0x0000fffff7fbb310:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb314:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb318:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb31c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb320:	54000321	b.ne	0xfffff7fbb384  // b.any
   0x0000fffff7fbb324:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbb328:	9e620120	scvtf	d0, x9
   0x0000fffff7fbb32c:	14000002	b	0xfffff7fbb334
   0x0000fffff7fbb330:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbb334:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb338:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb33c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb340:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb344:	54000120	b.eq	0xfffff7fbb368  // b.none
   0x0000fffff7fbb348:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb34c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb350:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb354:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb358:	54000161	b.ne	0xfffff7fbb384  // b.any
   0x0000fffff7fbb35c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbb360:	9e620121	scvtf	d1, x9
   0x0000fffff7fbb364:	14000002	b	0xfffff7fbb36c
   0x0000fffff7fbb368:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fbb36c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbb370:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbb374:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb378:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb37c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbb380:	17ffffde	b	0xfffff7fbb2f8
   0x0000fffff7fbb384:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb388:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb38c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb390:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb394:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fbb398:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb39c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb3a0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbb3a4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb3a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb3ac:	d63f0200	blr	x16
   0x0000fffff7fbb3b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb3b4:	54004820	b.eq	0xfffff7fbbcb8  // b.none
   0x0000fffff7fbb3b8:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbb3bc:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbb3c0:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbb3c4:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbb3c8:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbb3cc:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbb3d0:	36d801d1	tbz	w17, #27, 0xfffff7fbb408
   0x0000fffff7fbb3d4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb3d8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb3dc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb3e0:	54000281	b.ne	0xfffff7fbb430  // b.any
   0x0000fffff7fbb3e4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbb3e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb3ec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb3f0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb3f4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb3f8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb3fc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb400:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb404:	54000169	b.ls	0xfffff7fbb430  // b.plast
   0x0000fffff7fbb408:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb40c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb410:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb414:	36d80091	tbz	w17, #27, 0xfffff7fbb424
   0x0000fffff7fbb418:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb41c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb420:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb424:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbb428:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbb42c:	1400000e	b	0xfffff7fbb464
   0x0000fffff7fbb430:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb434:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb438:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb43c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb440:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fbb444:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb448:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb44c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fbb450:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb454:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb458:	d63f0200	blr	x16
   0x0000fffff7fbb45c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb460:	54004300	b.eq	0xfffff7fbbcc0  // b.none
   0x0000fffff7fbb464:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbb468:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbb46c:	540003a0	b.eq	0xfffff7fbb4e0  // b.none
   0x0000fffff7fbb470:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbb474:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbb478:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbb47c:	36d801d1	tbz	w17, #27, 0xfffff7fbb4b4
   0x0000fffff7fbb480:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb484:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb488:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb48c:	540002a1	b.ne	0xfffff7fbb4e0  // b.any
   0x0000fffff7fbb490:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbb494:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb498:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb49c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb4a0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb4a4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb4a8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb4ac:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb4b0:	54000189	b.ls	0xfffff7fbb4e0  // b.plast
   0x0000fffff7fbb4b4:	36d8008d	tbz	w13, #27, 0xfffff7fbb4c4
   0x0000fffff7fbb4b8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb4bc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb4c0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb4c4:	36d80091	tbz	w17, #27, 0xfffff7fbb4d4
   0x0000fffff7fbb4c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb4cc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb4d0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb4d4:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbb4d8:	b900016d	str	w13, [x11]
   0x0000fffff7fbb4dc:	1400000e	b	0xfffff7fbb514
   0x0000fffff7fbb4e0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbb4e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb4e8:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb4ec:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb4f0:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fbb4f4:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb4f8:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb4fc:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fbb500:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbb504:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb508:	d63f0200	blr	x16
   0x0000fffff7fbb50c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb510:	54003dc0	b.eq	0xfffff7fbbcc8  // b.none
   0x0000fffff7fbb514:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbb518:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbb51c:	540004a0	b.eq	0xfffff7fbb5b0  // b.none
   0x0000fffff7fbb520:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbb524:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbb528:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbb52c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbb530:	54000400	b.eq	0xfffff7fbb5b0  // b.none
   0x0000fffff7fbb534:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbb538:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbb53c:	36d801d1	tbz	w17, #27, 0xfffff7fbb574
   0x0000fffff7fbb540:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb544:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb548:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb54c:	54000321	b.ne	0xfffff7fbb5b0  // b.any
   0x0000fffff7fbb550:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbb554:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb558:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb55c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb560:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb564:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb568:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb56c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb570:	54000209	b.ls	0xfffff7fbb5b0  // b.plast
   0x0000fffff7fbb574:	36d8008d	tbz	w13, #27, 0xfffff7fbb584
   0x0000fffff7fbb578:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb57c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb580:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb584:	36d80091	tbz	w17, #27, 0xfffff7fbb594
   0x0000fffff7fbb588:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb58c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb590:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb594:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fbb598:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbb59c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbb5a0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbb5a4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbb5a8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbb5ac:	1400000e	b	0xfffff7fbb5e4
   0x0000fffff7fbb5b0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbb5b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb5b8:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb5bc:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb5c0:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fbb5c4:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb5c8:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb5cc:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbb5d0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbb5d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb5d8:	d63f0200	blr	x16
   0x0000fffff7fbb5dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb5e0:	54003780	b.eq	0xfffff7fbbcd0  // b.none
   0x0000fffff7fbb5e4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb5e8:	37d806a9	tbnz	w9, #27, 0xfffff7fbb6bc
   0x0000fffff7fbb5ec:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb5f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb5f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb5f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb5fc:	540001c1	b.ne	0xfffff7fbb634  // b.any
   0x0000fffff7fbb600:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb604:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb608:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb60c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb610:	54000121	b.ne	0xfffff7fbb634  // b.any
   0x0000fffff7fbb614:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbb618:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fbb61c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbb620:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb624:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb628:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbb62c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbb630:	14000030	b	0xfffff7fbb6f0
   0x0000fffff7fbb634:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb638:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb63c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb640:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb644:	54000120	b.eq	0xfffff7fbb668  // b.none
   0x0000fffff7fbb648:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb64c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb650:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb654:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb658:	54000321	b.ne	0xfffff7fbb6bc  // b.any
   0x0000fffff7fbb65c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbb660:	9e620120	scvtf	d0, x9
   0x0000fffff7fbb664:	14000002	b	0xfffff7fbb66c
   0x0000fffff7fbb668:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbb66c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb670:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb674:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb678:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb67c:	54000120	b.eq	0xfffff7fbb6a0  // b.none
   0x0000fffff7fbb680:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb684:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb688:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb68c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb690:	54000161	b.ne	0xfffff7fbb6bc  // b.any
   0x0000fffff7fbb694:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbb698:	9e620121	scvtf	d1, x9
   0x0000fffff7fbb69c:	14000002	b	0xfffff7fbb6a4
   0x0000fffff7fbb6a0:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fbb6a4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbb6a8:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbb6ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb6b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb6b4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbb6b8:	17ffffde	b	0xfffff7fbb630
   0x0000fffff7fbb6bc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb6c0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb6c4:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb6c8:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb6cc:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fbb6d0:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb6d4:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb6d8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbb6dc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb6e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb6e4:	d63f0200	blr	x16
   0x0000fffff7fbb6e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb6ec:	54002f60	b.eq	0xfffff7fbbcd8  // b.none
   0x0000fffff7fbb6f0:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbb6f4:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbb6f8:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbb6fc:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbb700:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbb704:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbb708:	36d801d1	tbz	w17, #27, 0xfffff7fbb740
   0x0000fffff7fbb70c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb710:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb714:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb718:	54000281	b.ne	0xfffff7fbb768  // b.any
   0x0000fffff7fbb71c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbb720:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb724:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb728:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb72c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb730:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb734:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb738:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb73c:	54000169	b.ls	0xfffff7fbb768  // b.plast
   0x0000fffff7fbb740:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb744:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb748:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb74c:	36d80091	tbz	w17, #27, 0xfffff7fbb75c
   0x0000fffff7fbb750:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb754:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb758:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb75c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbb760:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbb764:	1400000e	b	0xfffff7fbb79c
   0x0000fffff7fbb768:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb76c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb770:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb774:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb778:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fbb77c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb780:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb784:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fbb788:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb78c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb790:	d63f0200	blr	x16
   0x0000fffff7fbb794:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb798:	54002a40	b.eq	0xfffff7fbbce0  // b.none
   0x0000fffff7fbb79c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbb7a0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbb7a4:	540003a0	b.eq	0xfffff7fbb818  // b.none
   0x0000fffff7fbb7a8:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbb7ac:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbb7b0:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbb7b4:	36d801d1	tbz	w17, #27, 0xfffff7fbb7ec
   0x0000fffff7fbb7b8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb7bc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb7c0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb7c4:	540002a1	b.ne	0xfffff7fbb818  // b.any
   0x0000fffff7fbb7c8:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbb7cc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb7d0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb7d4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb7d8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb7dc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb7e0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb7e4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb7e8:	54000189	b.ls	0xfffff7fbb818  // b.plast
   0x0000fffff7fbb7ec:	36d8008d	tbz	w13, #27, 0xfffff7fbb7fc
   0x0000fffff7fbb7f0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb7f4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb7f8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb7fc:	36d80091	tbz	w17, #27, 0xfffff7fbb80c
   0x0000fffff7fbb800:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb804:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb808:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb80c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbb810:	b900016d	str	w13, [x11]
   0x0000fffff7fbb814:	1400000e	b	0xfffff7fbb84c
   0x0000fffff7fbb818:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbb81c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb820:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb824:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb828:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fbb82c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb830:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb834:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fbb838:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbb83c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb840:	d63f0200	blr	x16
   0x0000fffff7fbb844:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb848:	54002500	b.eq	0xfffff7fbbce8  // b.none
   0x0000fffff7fbb84c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbb850:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbb854:	540004a0	b.eq	0xfffff7fbb8e8  // b.none
   0x0000fffff7fbb858:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbb85c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbb860:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbb864:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbb868:	54000400	b.eq	0xfffff7fbb8e8  // b.none
   0x0000fffff7fbb86c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbb870:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbb874:	36d801d1	tbz	w17, #27, 0xfffff7fbb8ac
   0x0000fffff7fbb878:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb87c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb880:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb884:	54000321	b.ne	0xfffff7fbb8e8  // b.any
   0x0000fffff7fbb888:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbb88c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb890:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb894:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb898:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb89c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb8a0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb8a4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb8a8:	54000209	b.ls	0xfffff7fbb8e8  // b.plast
   0x0000fffff7fbb8ac:	36d8008d	tbz	w13, #27, 0xfffff7fbb8bc
   0x0000fffff7fbb8b0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb8b4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb8b8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb8bc:	36d80091	tbz	w17, #27, 0xfffff7fbb8cc
   0x0000fffff7fbb8c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb8c4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb8c8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb8cc:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fbb8d0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbb8d4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbb8d8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbb8dc:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbb8e0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbb8e4:	1400000e	b	0xfffff7fbb91c
   0x0000fffff7fbb8e8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbb8ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb8f0:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb8f4:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb8f8:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fbb8fc:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb900:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb904:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbb908:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbb90c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb910:	d63f0200	blr	x16
   0x0000fffff7fbb914:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb918:	54001ec0	b.eq	0xfffff7fbbcf0  // b.none
   0x0000fffff7fbb91c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb920:	37d806a9	tbnz	w9, #27, 0xfffff7fbb9f4
   0x0000fffff7fbb924:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb928:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb92c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb930:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb934:	540001c1	b.ne	0xfffff7fbb96c  // b.any
   0x0000fffff7fbb938:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb93c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb940:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb944:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb948:	54000121	b.ne	0xfffff7fbb96c  // b.any
   0x0000fffff7fbb94c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbb950:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fbb954:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbb958:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb95c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb960:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbb964:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbb968:	14000030	b	0xfffff7fbba28
   0x0000fffff7fbb96c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb970:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb974:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb978:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb97c:	54000120	b.eq	0xfffff7fbb9a0  // b.none
   0x0000fffff7fbb980:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb984:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb988:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb98c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb990:	54000321	b.ne	0xfffff7fbb9f4  // b.any
   0x0000fffff7fbb994:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbb998:	9e620120	scvtf	d0, x9
   0x0000fffff7fbb99c:	14000002	b	0xfffff7fbb9a4
   0x0000fffff7fbb9a0:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbb9a4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb9a8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb9ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb9b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb9b4:	54000120	b.eq	0xfffff7fbb9d8  // b.none
   0x0000fffff7fbb9b8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb9bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb9c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb9c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb9c8:	54000161	b.ne	0xfffff7fbb9f4  // b.any
   0x0000fffff7fbb9cc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbb9d0:	9e620121	scvtf	d1, x9
   0x0000fffff7fbb9d4:	14000002	b	0xfffff7fbb9dc
   0x0000fffff7fbb9d8:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fbb9dc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbb9e0:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbb9e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb9e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb9ec:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbb9f0:	17ffffde	b	0xfffff7fbb968
   0x0000fffff7fbb9f4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb9f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb9fc:	aa1303e1	mov	x1, x19
   0x0000fffff7fbba00:	aa1503e2	mov	x2, x21
   0x0000fffff7fbba04:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fbba08:	aa1403e4	mov	x4, x20
   0x0000fffff7fbba0c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbba10:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbba14:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbba18:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbba1c:	d63f0200	blr	x16
   0x0000fffff7fbba20:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbba24:	540016a0	b.eq	0xfffff7fbbcf8  // b.none
   0x0000fffff7fbba28:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbba2c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbba30:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbba34:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbba38:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbba3c:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbba40:	36d801d1	tbz	w17, #27, 0xfffff7fbba78
   0x0000fffff7fbba44:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbba48:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbba4c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbba50:	54000281	b.ne	0xfffff7fbbaa0  // b.any
   0x0000fffff7fbba54:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbba58:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbba5c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbba60:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbba64:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbba68:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbba6c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbba70:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbba74:	54000169	b.ls	0xfffff7fbbaa0  // b.plast
   0x0000fffff7fbba78:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbba7c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbba80:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbba84:	36d80091	tbz	w17, #27, 0xfffff7fbba94
   0x0000fffff7fbba88:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbba8c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbba90:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbba94:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbba98:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbba9c:	1400000e	b	0xfffff7fbbad4
   0x0000fffff7fbbaa0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbbaa4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbbaa8:	aa1303e1	mov	x1, x19
   0x0000fffff7fbbaac:	aa1503e2	mov	x2, x21
   0x0000fffff7fbbab0:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fbbab4:	aa1403e4	mov	x4, x20
   0x0000fffff7fbbab8:	aa1603e5	mov	x5, x22
   0x0000fffff7fbbabc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fbbac0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbbac4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbbac8:	d63f0200	blr	x16
   0x0000fffff7fbbacc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbbad0:	54001180	b.eq	0xfffff7fbbd00  // b.none
   0x0000fffff7fbbad4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbbad8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbbadc:	540003a0	b.eq	0xfffff7fbbb50  // b.none
   0x0000fffff7fbbae0:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbbae4:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbbae8:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbbaec:	36d801d1	tbz	w17, #27, 0xfffff7fbbb24
   0x0000fffff7fbbaf0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbbaf4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbbaf8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbbafc:	540002a1	b.ne	0xfffff7fbbb50  // b.any
   0x0000fffff7fbbb00:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbbb04:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbbb08:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbbb0c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbbb10:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbbb14:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbbb18:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbbb1c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbbb20:	54000189	b.ls	0xfffff7fbbb50  // b.plast
   0x0000fffff7fbbb24:	36d8008d	tbz	w13, #27, 0xfffff7fbbb34
   0x0000fffff7fbbb28:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbbb2c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbbb30:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbbb34:	36d80091	tbz	w17, #27, 0xfffff7fbbb44
   0x0000fffff7fbbb38:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbbb3c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbbb40:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbbb44:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbbb48:	b900016d	str	w13, [x11]
   0x0000fffff7fbbb4c:	1400000e	b	0xfffff7fbbb84
   0x0000fffff7fbbb50:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbbb54:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbbb58:	aa1303e1	mov	x1, x19
   0x0000fffff7fbbb5c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbbb60:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fbbb64:	aa1403e4	mov	x4, x20
   0x0000fffff7fbbb68:	aa1603e5	mov	x5, x22
   0x0000fffff7fbbb6c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fbbb70:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbbb74:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbbb78:	d63f0200	blr	x16
   0x0000fffff7fbbb7c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbbb80:	54000c40	b.eq	0xfffff7fbbd08  // b.none
   0x0000fffff7fbbb84:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbbb88:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbbb8c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbbb90:	aa1503e2	mov	x2, x21
   0x0000fffff7fbbb94:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fbbb98:	aa1403e4	mov	x4, x20
   0x0000fffff7fbbb9c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbbba0:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7fbbba4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbbba8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbbbac:	d63f0200	blr	x16
   0x0000fffff7fbbbb0:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fbbbb4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fbbbb8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fbbbbc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fbbbc0:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fbbbc4:	d65f03c0	ret
   0x0000fffff7fbbbc8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbbbcc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbbd0:	b900028a	str	w10, [x20]
   0x0000fffff7fbbbd4:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fbbbd8:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fbbbdc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fbbbe0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fbbbe4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fbbbe8:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fbbbec:	d65f03c0	ret
   0x0000fffff7fbbbf0:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fbbbf4:	17fffff5	b	0xfffff7fbbbc8
   0x0000fffff7fbbbf8:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fbbbfc:	17fffff3	b	0xfffff7fbbbc8
   0x0000fffff7fbbc00:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fbbc04:	17fffff1	b	0xfffff7fbbbc8
   0x0000fffff7fbbc08:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fbbc0c:	17ffffef	b	0xfffff7fbbbc8
   0x0000fffff7fbbc10:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fbbc14:	17ffffed	b	0xfffff7fbbbc8
   0x0000fffff7fbbc18:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fbbc1c:	17ffffeb	b	0xfffff7fbbbc8
   0x0000fffff7fbbc20:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fbbc24:	17ffffe9	b	0xfffff7fbbbc8
   0x0000fffff7fbbc28:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fbbc2c:	17ffffe7	b	0xfffff7fbbbc8
   0x0000fffff7fbbc30:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fbbc34:	17ffffe5	b	0xfffff7fbbbc8
   0x0000fffff7fbbc38:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fbbc3c:	17ffffe3	b	0xfffff7fbbbc8
   0x0000fffff7fbbc40:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fbbc44:	17ffffe1	b	0xfffff7fbbbc8
   0x0000fffff7fbbc48:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fbbc4c:	17ffffdf	b	0xfffff7fbbbc8
   0x0000fffff7fbbc50:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fbbc54:	17ffffdd	b	0xfffff7fbbbc8
   0x0000fffff7fbbc58:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fbbc5c:	17ffffdb	b	0xfffff7fbbbc8
   0x0000fffff7fbbc60:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fbbc64:	17ffffd9	b	0xfffff7fbbbc8
   0x0000fffff7fbbc68:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fbbc6c:	17ffffd7	b	0xfffff7fbbbc8
   0x0000fffff7fbbc70:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fbbc74:	17ffffd5	b	0xfffff7fbbbc8
   0x0000fffff7fbbc78:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fbbc7c:	17ffffd3	b	0xfffff7fbbbc8
   0x0000fffff7fbbc80:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fbbc84:	17ffffd1	b	0xfffff7fbbbc8
   0x0000fffff7fbbc88:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fbbc8c:	17ffffcf	b	0xfffff7fbbbc8
   0x0000fffff7fbbc90:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fbbc94:	17ffffcd	b	0xfffff7fbbbc8
   0x0000fffff7fbbc98:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fbbc9c:	17ffffcb	b	0xfffff7fbbbc8
   0x0000fffff7fbbca0:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fbbca4:	17ffffc9	b	0xfffff7fbbbc8
   0x0000fffff7fbbca8:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fbbcac:	17ffffc7	b	0xfffff7fbbbc8
   0x0000fffff7fbbcb0:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fbbcb4:	17ffffc5	b	0xfffff7fbbbc8
   0x0000fffff7fbbcb8:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fbbcbc:	17ffffc3	b	0xfffff7fbbbc8
   0x0000fffff7fbbcc0:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fbbcc4:	17ffffc1	b	0xfffff7fbbbc8
   0x0000fffff7fbbcc8:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fbbccc:	17ffffbf	b	0xfffff7fbbbc8
   0x0000fffff7fbbcd0:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fbbcd4:	17ffffbd	b	0xfffff7fbbbc8
   0x0000fffff7fbbcd8:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fbbcdc:	17ffffbb	b	0xfffff7fbbbc8
   0x0000fffff7fbbce0:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fbbce4:	17ffffb9	b	0xfffff7fbbbc8
   0x0000fffff7fbbce8:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fbbcec:	17ffffb7	b	0xfffff7fbbbc8
   0x0000fffff7fbbcf0:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fbbcf4:	17ffffb5	b	0xfffff7fbbbc8
   0x0000fffff7fbbcf8:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fbbcfc:	17ffffb3	b	0xfffff7fbbbc8
   0x0000fffff7fbbd00:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fbbd04:	17ffffb1	b	0xfffff7fbbbc8
   0x0000fffff7fbbd08:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fbbd0c:	17ffffaf	b	0xfffff7fbbbc8
   0x0000fffff7fbbd10:	00000000	udf	#0
   0x0000fffff7fbbd14:	00000000	udf	#0
   0x0000fffff7fbbd18:	00000000	udf	#0
   0x0000fffff7fbbd1c:	00000000	udf	#0
   0x0000fffff7fbbd20:	00000000	udf	#0
   0x0000fffff7fbbd24:	00000000	udf	#0
   0x0000fffff7fbbd28:	00000000	udf	#0
   0x0000fffff7fbbd2c:	00000000	udf	#0
   0x0000fffff7fbbd30:	00000000	udf	#0
   0x0000fffff7fbbd34:	00000000	udf	#0
   0x0000fffff7fbbd38:	00000000	udf	#0
   0x0000fffff7fbbd3c:	00000000	udf	#0
   0x0000fffff7fbbd40:	00000000	udf	#0
   0x0000fffff7fbbd44:	00000000	udf	#0
   0x0000fffff7fbbd48:	00000000	udf	#0
   0x0000fffff7fbbd4c:	00000000	udf	#0
   0x0000fffff7fbbd50:	00000000	udf	#0
   0x0000fffff7fbbd54:	00000000	udf	#0
   0x0000fffff7fbbd58:	00000000	udf	#0
   0x0000fffff7fbbd5c:	00000000	udf	#0
   0x0000fffff7fbbd60:	00000000	udf	#0
   0x0000fffff7fbbd64:	00000000	udf	#0
   0x0000fffff7fbbd68:	00000000	udf	#0
   0x0000fffff7fbbd6c:	00000000	udf	#0
   0x0000fffff7fbbd70:	00000000	udf	#0
   0x0000fffff7fbbd74:	00000000	udf	#0
   0x0000fffff7fbbd78:	00000000	udf	#0
   0x0000fffff7fbbd7c:	00000000	udf	#0
   0x0000fffff7fbbd80:	00000000	udf	#0
   0x0000fffff7fbbd84:	00000000	udf	#0
   0x0000fffff7fbbd88:	00000000	udf	#0
   0x0000fffff7fbbd8c:	00000000	udf	#0
   0x0000fffff7fbbd90:	00000000	udf	#0
   0x0000fffff7fbbd94:	00000000	udf	#0
   0x0000fffff7fbbd98:	00000000	udf	#0
   0x0000fffff7fbbd9c:	00000000	udf	#0
   0x0000fffff7fbbda0:	00000000	udf	#0
   0x0000fffff7fbbda4:	00000000	udf	#0
   0x0000fffff7fbbda8:	00000000	udf	#0
   0x0000fffff7fbbdac:	00000000	udf	#0
   0x0000fffff7fbbdb0:	00000000	udf	#0
   0x0000fffff7fbbdb4:	00000000	udf	#0
   0x0000fffff7fbbdb8:	00000000	udf	#0
   0x0000fffff7fbbdbc:	00000000	udf	#0
   0x0000fffff7fbbdc0:	00000000	udf	#0
   0x0000fffff7fbbdc4:	00000000	udf	#0
   0x0000fffff7fbbdc8:	00000000	udf	#0
   0x0000fffff7fbbdcc:	00000000	udf	#0
   0x0000fffff7fbbdd0:	00000000	udf	#0
   0x0000fffff7fbbdd4:	00000000	udf	#0
   0x0000fffff7fbbdd8:	00000000	udf	#0
   0x0000fffff7fbbddc:	00000000	udf	#0
   0x0000fffff7fbbde0:	00000000	udf	#0
   0x0000fffff7fbbde4:	00000000	udf	#0
   0x0000fffff7fbbde8:	00000000	udf	#0
   0x0000fffff7fbbdec:	00000000	udf	#0
   0x0000fffff7fbbdf0:	00000000	udf	#0
   0x0000fffff7fbbdf4:	00000000	udf	#0
   0x0000fffff7fbbdf8:	00000000	udf	#0
   0x0000fffff7fbbdfc:	00000000	udf	#0
   0x0000fffff7fbbe00:	00000000	udf	#0
   0x0000fffff7fbbe04:	00000000	udf	#0
   0x0000fffff7fbbe08:	00000000	udf	#0
   0x0000fffff7fbbe0c:	00000000	udf	#0
   0x0000fffff7fbbe10:	00000000	udf	#0
   0x0000fffff7fbbe14:	00000000	udf	#0
   0x0000fffff7fbbe18:	00000000	udf	#0
   0x0000fffff7fbbe1c:	00000000	udf	#0
   0x0000fffff7fbbe20:	00000000	udf	#0
   0x0000fffff7fbbe24:	00000000	udf	#0
   0x0000fffff7fbbe28:	00000000	udf	#0
   0x0000fffff7fbbe2c:	00000000	udf	#0
   0x0000fffff7fbbe30:	00000000	udf	#0
   0x0000fffff7fbbe34:	00000000	udf	#0
   0x0000fffff7fbbe38:	00000000	udf	#0
   0x0000fffff7fbbe3c:	00000000	udf	#0
   0x0000fffff7fbbe40:	00000000	udf	#0
   0x0000fffff7fbbe44:	00000000	udf	#0
   0x0000fffff7fbbe48:	00000000	udf	#0
   0x0000fffff7fbbe4c:	00000000	udf	#0
   0x0000fffff7fbbe50:	00000000	udf	#0
   0x0000fffff7fbbe54:	00000000	udf	#0
   0x0000fffff7fbbe58:	00000000	udf	#0
   0x0000fffff7fbbe5c:	00000000	udf	#0
   0x0000fffff7fbbe60:	00000000	udf	#0
   0x0000fffff7fbbe64:	00000000	udf	#0
   0x0000fffff7fbbe68:	00000000	udf	#0
   0x0000fffff7fbbe6c:	00000000	udf	#0
   0x0000fffff7fbbe70:	00000000	udf	#0
   0x0000fffff7fbbe74:	00000000	udf	#0
   0x0000fffff7fbbe78:	00000000	udf	#0
   0x0000fffff7fbbe7c:	00000000	udf	#0
   0x0000fffff7fbbe80:	00000000	udf	#0
   0x0000fffff7fbbe84:	00000000	udf	#0
   0x0000fffff7fbbe88:	00000000	udf	#0
   0x0000fffff7fbbe8c:	00000000	udf	#0
   0x0000fffff7fbbe90:	00000000	udf	#0
   0x0000fffff7fbbe94:	00000000	udf	#0
   0x0000fffff7fbbe98:	00000000	udf	#0
   0x0000fffff7fbbe9c:	00000000	udf	#0
   0x0000fffff7fbbea0:	00000000	udf	#0
   0x0000fffff7fbbea4:	00000000	udf	#0
   0x0000fffff7fbbea8:	00000000	udf	#0
   0x0000fffff7fbbeac:	00000000	udf	#0
   0x0000fffff7fbbeb0:	00000000	udf	#0
   0x0000fffff7fbbeb4:	00000000	udf	#0
   0x0000fffff7fbbeb8:	00000000	udf	#0
   0x0000fffff7fbbebc:	00000000	udf	#0
   0x0000fffff7fbbec0:	00000000	udf	#0
   0x0000fffff7fbbec4:	00000000	udf	#0
   0x0000fffff7fbbec8:	00000000	udf	#0
   0x0000fffff7fbbecc:	00000000	udf	#0
   0x0000fffff7fbbed0:	00000000	udf	#0
   0x0000fffff7fbbed4:	00000000	udf	#0
   0x0000fffff7fbbed8:	00000000	udf	#0
   0x0000fffff7fbbedc:	00000000	udf	#0
   0x0000fffff7fbbee0:	00000000	udf	#0
   0x0000fffff7fbbee4:	00000000	udf	#0
   0x0000fffff7fbbee8:	00000000	udf	#0
   0x0000fffff7fbbeec:	00000000	udf	#0
   0x0000fffff7fbbef0:	00000000	udf	#0
   0x0000fffff7fbbef4:	00000000	udf	#0
   0x0000fffff7fbbef8:	00000000	udf	#0
   0x0000fffff7fbbefc:	00000000	udf	#0
   0x0000fffff7fbbf00:	00000000	udf	#0
   0x0000fffff7fbbf04:	00000000	udf	#0
   0x0000fffff7fbbf08:	00000000	udf	#0
   0x0000fffff7fbbf0c:	00000000	udf	#0
   0x0000fffff7fbbf10:	00000000	udf	#0
   0x0000fffff7fbbf14:	00000000	udf	#0
   0x0000fffff7fbbf18:	00000000	udf	#0
   0x0000fffff7fbbf1c:	00000000	udf	#0
   0x0000fffff7fbbf20:	00000000	udf	#0
   0x0000fffff7fbbf24:	00000000	udf	#0
   0x0000fffff7fbbf28:	00000000	udf	#0
   0x0000fffff7fbbf2c:	00000000	udf	#0
   0x0000fffff7fbbf30:	00000000	udf	#0
   0x0000fffff7fbbf34:	00000000	udf	#0
   0x0000fffff7fbbf38:	00000000	udf	#0
   0x0000fffff7fbbf3c:	00000000	udf	#0
   0x0000fffff7fbbf40:	00000000	udf	#0
   0x0000fffff7fbbf44:	00000000	udf	#0
   0x0000fffff7fbbf48:	00000000	udf	#0
   0x0000fffff7fbbf4c:	00000000	udf	#0
   0x0000fffff7fbbf50:	00000000	udf	#0
   0x0000fffff7fbbf54:	00000000	udf	#0
   0x0000fffff7fbbf58:	00000000	udf	#0
   0x0000fffff7fbbf5c:	00000000	udf	#0
   0x0000fffff7fbbf60:	00000000	udf	#0
   0x0000fffff7fbbf64:	00000000	udf	#0
   0x0000fffff7fbbf68:	00000000	udf	#0
   0x0000fffff7fbbf6c:	00000000	udf	#0
   0x0000fffff7fbbf70:	00000000	udf	#0
   0x0000fffff7fbbf74:	00000000	udf	#0
   0x0000fffff7fbbf78:	00000000	udf	#0
   0x0000fffff7fbbf7c:	00000000	udf	#0
   0x0000fffff7fbbf80:	00000000	udf	#0
   0x0000fffff7fbbf84:	00000000	udf	#0
   0x0000fffff7fbbf88:	00000000	udf	#0
   0x0000fffff7fbbf8c:	00000000	udf	#0
   0x0000fffff7fbbf90:	00000000	udf	#0
   0x0000fffff7fbbf94:	00000000	udf	#0
   0x0000fffff7fbbf98:	00000000	udf	#0
   0x0000fffff7fbbf9c:	00000000	udf	#0
   0x0000fffff7fbbfa0:	00000000	udf	#0
   0x0000fffff7fbbfa4:	00000000	udf	#0
   0x0000fffff7fbbfa8:	00000000	udf	#0
   0x0000fffff7fbbfac:	00000000	udf	#0
   0x0000fffff7fbbfb0:	00000000	udf	#0
   0x0000fffff7fbbfb4:	00000000	udf	#0
   0x0000fffff7fbbfb8:	00000000	udf	#0
   0x0000fffff7fbbfbc:	00000000	udf	#0
   0x0000fffff7fbbfc0:	00000000	udf	#0
   0x0000fffff7fbbfc4:	00000000	udf	#0
   0x0000fffff7fbbfc8:	00000000	udf	#0
   0x0000fffff7fbbfcc:	00000000	udf	#0
   0x0000fffff7fbbfd0:	00000000	udf	#0
   0x0000fffff7fbbfd4:	00000000	udf	#0
   0x0000fffff7fbbfd8:	00000000	udf	#0
   0x0000fffff7fbbfdc:	00000000	udf	#0
   0x0000fffff7fbbfe0:	00000000	udf	#0
   0x0000fffff7fbbfe4:	00000000	udf	#0
   0x0000fffff7fbbfe8:	00000000	udf	#0
   0x0000fffff7fbbfec:	00000000	udf	#0
   0x0000fffff7fbbff0:	00000000	udf	#0
   0x0000fffff7fbbff4:	00000000	udf	#0
   0x0000fffff7fbbff8:	00000000	udf	#0
   0x0000fffff7fbbffc:	00000000	udf	#0
End of assembler dump.
