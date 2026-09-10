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
   0x0000fffff7fba038:	d29ea810	mov	x16, #0xf540                	// #62784
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
   0x0000fffff7fba0ec:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fba0f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fba0f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba0f8:	d63f0200	blr	x16
   0x0000fffff7fba0fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba100:	5400ef00	b.eq	0xfffff7fbbee0  // b.none
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
   0x0000fffff7fba17c:	d2855410	mov	x16, #0x2aa0                	// #10912
   0x0000fffff7fba180:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba188:	d63f0200	blr	x16
   0x0000fffff7fba18c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba190:	5400eac0	b.eq	0xfffff7fbbee8  // b.none
   0x0000fffff7fba194:	b940126d	ldr	w13, [x19, #16]
   0x0000fffff7fba198:	f9400e6c	ldr	x12, [x19, #24]
   0x0000fffff7fba19c:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7fba1a0:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fba1a4:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fba1a8:	54000100	b.eq	0xfffff7fba1c8  // b.none
   0x0000fffff7fba1ac:	5290000a	mov	w10, #0x8000                	// #32768
   0x0000fffff7fba1b0:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fba1b4:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fba1b8:	54000a21	b.ne	0xfffff7fba2fc  // b.any
   0x0000fffff7fba1bc:	f9401d8b	ldr	x11, [x12, #56]
   0x0000fffff7fba1c0:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7fba1c4:	14000002	b	0xfffff7fba1cc
   0x0000fffff7fba1c8:	aa0c03eb	mov	x11, x12
   0x0000fffff7fba1cc:	f9402569	ldr	x9, [x11, #72]
   0x0000fffff7fba1d0:	d1000529	sub	x9, x9, #0x1
   0x0000fffff7fba1d4:	d298b66a	mov	x10, #0xc5b3                	// #50611
   0x0000fffff7fba1d8:	f2a00f0a	movk	x10, #0x78, lsl #16
   0x0000fffff7fba1dc:	8a09014a	and	x10, x10, x9
   0x0000fffff7fba1e0:	f940216b	ldr	x11, [x11, #64]
   0x0000fffff7fba1e4:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fba1e8:	9b097d4a	mul	x10, x10, x9
   0x0000fffff7fba1ec:	8b0a016b	add	x11, x11, x10
   0x0000fffff7fba1f0:	b9401169	ldr	w9, [x11, #16]
   0x0000fffff7fba1f4:	5280020a	mov	w10, #0x10                  	// #16
   0x0000fffff7fba1f8:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7fba1fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba200:	540007e1	b.ne	0xfffff7fba2fc  // b.any
   0x0000fffff7fba204:	f9400d69	ldr	x9, [x11, #24]
   0x0000fffff7fba208:	d299ba0a	mov	x10, #0xcdd0                	// #52688
   0x0000fffff7fba20c:	f2b5580a	movk	x10, #0xaac0, lsl #16
   0x0000fffff7fba210:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7fba214:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba218:	54000721	b.ne	0xfffff7fba2fc  // b.any
   0x0000fffff7fba21c:	9100016b	add	x11, x11, #0x0
   0x0000fffff7fba220:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7fba224:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fba228:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fba22c:	540002a0	b.eq	0xfffff7fba280  // b.none
   0x0000fffff7fba230:	b9400169	ldr	w9, [x11]
   0x0000fffff7fba234:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba238:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba23c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba240:	540005e1	b.ne	0xfffff7fba2fc  // b.any
   0x0000fffff7fba244:	f9400569	ldr	x9, [x11, #8]
   0x0000fffff7fba248:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7fba24c:	f2a0400a	movk	x10, #0x200, lsl #16
   0x0000fffff7fba250:	8a0a012a	and	x10, x9, x10
   0x0000fffff7fba254:	f100015f	cmp	x10, #0x0
   0x0000fffff7fba258:	54000520	b.eq	0xfffff7fba2fc  // b.none
   0x0000fffff7fba25c:	d29fffea	mov	x10, #0xffff                	// #65535
   0x0000fffff7fba260:	f2a01fea	movk	x10, #0xff, lsl #16
   0x0000fffff7fba264:	8a0a0129	and	x9, x9, x10
   0x0000fffff7fba268:	f9401d8a	ldr	x10, [x12, #56]
   0x0000fffff7fba26c:	f940254a	ldr	x10, [x10, #72]
   0x0000fffff7fba270:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba274:	54000442	b.cs	0xfffff7fba2fc  // b.hs, b.nlast
   0x0000fffff7fba278:	9101618b	add	x11, x12, #0x58
   0x0000fffff7fba27c:	8b09116b	add	x11, x11, x9, lsl #4
   0x0000fffff7fba280:	b90013ed	str	w13, [sp, #16]
   0x0000fffff7fba284:	f9000fec	str	x12, [sp, #24]
   0x0000fffff7fba288:	f90017eb	str	x11, [sp, #40]
   0x0000fffff7fba28c:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fba290:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fba294:	b9400171	ldr	w17, [x11]
   0x0000fffff7fba298:	36d801d1	tbz	w17, #27, 0xfffff7fba2d0
   0x0000fffff7fba29c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba2a0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba2a4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba2a8:	540002a1	b.ne	0xfffff7fba2fc  // b.any
   0x0000fffff7fba2ac:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fba2b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba2b4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba2b8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba2bc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba2c0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba2c4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba2c8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba2cc:	54000189	b.ls	0xfffff7fba2fc  // b.plast
   0x0000fffff7fba2d0:	36d8008d	tbz	w13, #27, 0xfffff7fba2e0
   0x0000fffff7fba2d4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba2d8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba2dc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba2e0:	36d80091	tbz	w17, #27, 0xfffff7fba2f0
   0x0000fffff7fba2e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba2e8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba2ec:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba2f0:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fba2f4:	b900016d	str	w13, [x11]
   0x0000fffff7fba2f8:	1400000e	b	0xfffff7fba330
   0x0000fffff7fba2fc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fba300:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba304:	aa1303e1	mov	x1, x19
   0x0000fffff7fba308:	aa1503e2	mov	x2, x21
   0x0000fffff7fba30c:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fba310:	aa1403e4	mov	x4, x20
   0x0000fffff7fba314:	aa1603e5	mov	x5, x22
   0x0000fffff7fba318:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fba31c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fba320:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba324:	d63f0200	blr	x16
   0x0000fffff7fba328:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba32c:	5400de20	b.eq	0xfffff7fbbef0  // b.none
   0x0000fffff7fba330:	14000001	b	0xfffff7fba334
   0x0000fffff7fba334:	14000001	b	0xfffff7fba338
   0x0000fffff7fba338:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fba33c:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fba340:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fba344:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fba348:	36d80211	tbz	w17, #27, 0xfffff7fba388
   0x0000fffff7fba34c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba350:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba354:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba358:	540001e1	b.ne	0xfffff7fba394  // b.any
   0x0000fffff7fba35c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fba360:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba364:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba368:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba36c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba370:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba374:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba378:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba37c:	540000c9	b.ls	0xfffff7fba394  // b.plast
   0x0000fffff7fba380:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba384:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba388:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fba38c:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fba390:	1400000e	b	0xfffff7fba3c8
   0x0000fffff7fba394:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba398:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba39c:	aa1303e1	mov	x1, x19
   0x0000fffff7fba3a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fba3a4:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fba3a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fba3ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fba3b0:	d2855410	mov	x16, #0x2aa0                	// #10912
   0x0000fffff7fba3b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba3b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba3bc:	d63f0200	blr	x16
   0x0000fffff7fba3c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba3c4:	5400d9a0	b.eq	0xfffff7fbbef8  // b.none
   0x0000fffff7fba3c8:	b940126d	ldr	w13, [x19, #16]
   0x0000fffff7fba3cc:	f9400e6c	ldr	x12, [x19, #24]
   0x0000fffff7fba3d0:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7fba3d4:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fba3d8:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fba3dc:	54000100	b.eq	0xfffff7fba3fc  // b.none
   0x0000fffff7fba3e0:	5290000a	mov	w10, #0x8000                	// #32768
   0x0000fffff7fba3e4:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fba3e8:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fba3ec:	54000b21	b.ne	0xfffff7fba550  // b.any
   0x0000fffff7fba3f0:	f9401d8b	ldr	x11, [x12, #56]
   0x0000fffff7fba3f4:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7fba3f8:	14000002	b	0xfffff7fba400
   0x0000fffff7fba3fc:	aa0c03eb	mov	x11, x12
   0x0000fffff7fba400:	f9402569	ldr	x9, [x11, #72]
   0x0000fffff7fba404:	d1000529	sub	x9, x9, #0x1
   0x0000fffff7fba408:	d29ba34a	mov	x10, #0xdd1a                	// #56602
   0x0000fffff7fba40c:	f2a2374a	movk	x10, #0x11ba, lsl #16
   0x0000fffff7fba410:	8a09014a	and	x10, x10, x9
   0x0000fffff7fba414:	f940216b	ldr	x11, [x11, #64]
   0x0000fffff7fba418:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fba41c:	9b097d4a	mul	x10, x10, x9
   0x0000fffff7fba420:	8b0a016b	add	x11, x11, x10
   0x0000fffff7fba424:	b9401169	ldr	w9, [x11, #16]
   0x0000fffff7fba428:	5280020a	mov	w10, #0x10                  	// #16
   0x0000fffff7fba42c:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7fba430:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba434:	540008e1	b.ne	0xfffff7fba550  // b.any
   0x0000fffff7fba438:	f9400d69	ldr	x9, [x11, #24]
   0x0000fffff7fba43c:	d299de0a	mov	x10, #0xcef0                	// #52976
   0x0000fffff7fba440:	f2b5580a	movk	x10, #0xaac0, lsl #16
   0x0000fffff7fba444:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7fba448:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba44c:	54000821	b.ne	0xfffff7fba550  // b.any
   0x0000fffff7fba450:	9100016b	add	x11, x11, #0x0
   0x0000fffff7fba454:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7fba458:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fba45c:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fba460:	540002a0	b.eq	0xfffff7fba4b4  // b.none
   0x0000fffff7fba464:	b9400169	ldr	w9, [x11]
   0x0000fffff7fba468:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba46c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba470:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba474:	540006e1	b.ne	0xfffff7fba550  // b.any
   0x0000fffff7fba478:	f9400569	ldr	x9, [x11, #8]
   0x0000fffff7fba47c:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7fba480:	f2a0400a	movk	x10, #0x200, lsl #16
   0x0000fffff7fba484:	8a0a012a	and	x10, x9, x10
   0x0000fffff7fba488:	f100015f	cmp	x10, #0x0
   0x0000fffff7fba48c:	54000620	b.eq	0xfffff7fba550  // b.none
   0x0000fffff7fba490:	d29fffea	mov	x10, #0xffff                	// #65535
   0x0000fffff7fba494:	f2a01fea	movk	x10, #0xff, lsl #16
   0x0000fffff7fba498:	8a0a0129	and	x9, x9, x10
   0x0000fffff7fba49c:	f9401d8a	ldr	x10, [x12, #56]
   0x0000fffff7fba4a0:	f940254a	ldr	x10, [x10, #72]
   0x0000fffff7fba4a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba4a8:	54000542	b.cs	0xfffff7fba550  // b.hs, b.nlast
   0x0000fffff7fba4ac:	9101618b	add	x11, x12, #0x58
   0x0000fffff7fba4b0:	8b09116b	add	x11, x11, x9, lsl #4
   0x0000fffff7fba4b4:	b90033ed	str	w13, [sp, #48]
   0x0000fffff7fba4b8:	f9001fec	str	x12, [sp, #56]
   0x0000fffff7fba4bc:	f90027eb	str	x11, [sp, #72]
   0x0000fffff7fba4c0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fba4c4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fba4c8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fba4cc:	eb0901bf	cmp	x13, x9
   0x0000fffff7fba4d0:	54000400	b.eq	0xfffff7fba550  // b.none
   0x0000fffff7fba4d4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fba4d8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fba4dc:	36d801d1	tbz	w17, #27, 0xfffff7fba514
   0x0000fffff7fba4e0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba4e4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba4e8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba4ec:	54000321	b.ne	0xfffff7fba550  // b.any
   0x0000fffff7fba4f0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fba4f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba4f8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba4fc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba500:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba504:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba508:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba50c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba510:	54000209	b.ls	0xfffff7fba550  // b.plast
   0x0000fffff7fba514:	36d8008d	tbz	w13, #27, 0xfffff7fba524
   0x0000fffff7fba518:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba51c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba520:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba524:	36d80091	tbz	w17, #27, 0xfffff7fba534
   0x0000fffff7fba528:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba52c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba530:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba534:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fba538:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fba53c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fba540:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fba544:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fba548:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fba54c:	1400000e	b	0xfffff7fba584
   0x0000fffff7fba550:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fba554:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba558:	aa1303e1	mov	x1, x19
   0x0000fffff7fba55c:	aa1503e2	mov	x2, x21
   0x0000fffff7fba560:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fba564:	aa1403e4	mov	x4, x20
   0x0000fffff7fba568:	aa1603e5	mov	x5, x22
   0x0000fffff7fba56c:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fba570:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba574:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba578:	d63f0200	blr	x16
   0x0000fffff7fba57c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba580:	5400cc00	b.eq	0xfffff7fbbf00  // b.none
   0x0000fffff7fba584:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba588:	37d806a9	tbnz	w9, #27, 0xfffff7fba65c
   0x0000fffff7fba58c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba590:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba594:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba598:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba59c:	540001c1	b.ne	0xfffff7fba5d4  // b.any
   0x0000fffff7fba5a0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fba5a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba5a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba5ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba5b0:	54000121	b.ne	0xfffff7fba5d4  // b.any
   0x0000fffff7fba5b4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fba5b8:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fba5bc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fba5c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba5c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba5c8:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fba5cc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fba5d0:	14000030	b	0xfffff7fba690
   0x0000fffff7fba5d4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba5d8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba5dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba5e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba5e4:	54000120	b.eq	0xfffff7fba608  // b.none
   0x0000fffff7fba5e8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba5ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba5f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba5f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba5f8:	54000321	b.ne	0xfffff7fba65c  // b.any
   0x0000fffff7fba5fc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fba600:	9e620120	scvtf	d0, x9
   0x0000fffff7fba604:	14000002	b	0xfffff7fba60c
   0x0000fffff7fba608:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fba60c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fba610:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba614:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba618:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba61c:	54000120	b.eq	0xfffff7fba640  // b.none
   0x0000fffff7fba620:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fba624:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba628:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba62c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba630:	54000161	b.ne	0xfffff7fba65c  // b.any
   0x0000fffff7fba634:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fba638:	9e620121	scvtf	d1, x9
   0x0000fffff7fba63c:	14000002	b	0xfffff7fba644
   0x0000fffff7fba640:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fba644:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fba648:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fba64c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba650:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba654:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fba658:	17ffffde	b	0xfffff7fba5d0
   0x0000fffff7fba65c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba660:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba664:	aa1303e1	mov	x1, x19
   0x0000fffff7fba668:	aa1503e2	mov	x2, x21
   0x0000fffff7fba66c:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fba670:	aa1403e4	mov	x4, x20
   0x0000fffff7fba674:	aa1603e5	mov	x5, x22
   0x0000fffff7fba678:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fba67c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fba680:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba684:	d63f0200	blr	x16
   0x0000fffff7fba688:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba68c:	5400c3e0	b.eq	0xfffff7fbbf08  // b.none
   0x0000fffff7fba690:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fba694:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fba698:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fba69c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fba6a0:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fba6a4:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fba6a8:	36d801d1	tbz	w17, #27, 0xfffff7fba6e0
   0x0000fffff7fba6ac:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba6b0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba6b4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba6b8:	54000281	b.ne	0xfffff7fba708  // b.any
   0x0000fffff7fba6bc:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fba6c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba6c4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba6c8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba6cc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba6d0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba6d4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba6d8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba6dc:	54000169	b.ls	0xfffff7fba708  // b.plast
   0x0000fffff7fba6e0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba6e4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba6e8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba6ec:	36d80091	tbz	w17, #27, 0xfffff7fba6fc
   0x0000fffff7fba6f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba6f4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba6f8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba6fc:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fba700:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fba704:	1400000e	b	0xfffff7fba73c
   0x0000fffff7fba708:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba70c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba710:	aa1303e1	mov	x1, x19
   0x0000fffff7fba714:	aa1503e2	mov	x2, x21
   0x0000fffff7fba718:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fba71c:	aa1403e4	mov	x4, x20
   0x0000fffff7fba720:	aa1603e5	mov	x5, x22
   0x0000fffff7fba724:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fba728:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fba72c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba730:	d63f0200	blr	x16
   0x0000fffff7fba734:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba738:	5400bec0	b.eq	0xfffff7fbbf10  // b.none
   0x0000fffff7fba73c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fba740:	f100017f	cmp	x11, #0x0
   0x0000fffff7fba744:	540003a0	b.eq	0xfffff7fba7b8  // b.none
   0x0000fffff7fba748:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fba74c:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fba750:	b9400171	ldr	w17, [x11]
   0x0000fffff7fba754:	36d801d1	tbz	w17, #27, 0xfffff7fba78c
   0x0000fffff7fba758:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba75c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba760:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba764:	540002a1	b.ne	0xfffff7fba7b8  // b.any
   0x0000fffff7fba768:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fba76c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba770:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba774:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba778:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba77c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba780:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba784:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba788:	54000189	b.ls	0xfffff7fba7b8  // b.plast
   0x0000fffff7fba78c:	36d8008d	tbz	w13, #27, 0xfffff7fba79c
   0x0000fffff7fba790:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba794:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba798:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba79c:	36d80091	tbz	w17, #27, 0xfffff7fba7ac
   0x0000fffff7fba7a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba7a4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba7a8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba7ac:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fba7b0:	b900016d	str	w13, [x11]
   0x0000fffff7fba7b4:	1400000e	b	0xfffff7fba7ec
   0x0000fffff7fba7b8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fba7bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba7c0:	aa1303e1	mov	x1, x19
   0x0000fffff7fba7c4:	aa1503e2	mov	x2, x21
   0x0000fffff7fba7c8:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fba7cc:	aa1403e4	mov	x4, x20
   0x0000fffff7fba7d0:	aa1603e5	mov	x5, x22
   0x0000fffff7fba7d4:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fba7d8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fba7dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba7e0:	d63f0200	blr	x16
   0x0000fffff7fba7e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba7e8:	5400b980	b.eq	0xfffff7fbbf18  // b.none
   0x0000fffff7fba7ec:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fba7f0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fba7f4:	540004a0	b.eq	0xfffff7fba888  // b.none
   0x0000fffff7fba7f8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fba7fc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fba800:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fba804:	eb0901bf	cmp	x13, x9
   0x0000fffff7fba808:	54000400	b.eq	0xfffff7fba888  // b.none
   0x0000fffff7fba80c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fba810:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fba814:	36d801d1	tbz	w17, #27, 0xfffff7fba84c
   0x0000fffff7fba818:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba81c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba820:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba824:	54000321	b.ne	0xfffff7fba888  // b.any
   0x0000fffff7fba828:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fba82c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba830:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba834:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba838:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba83c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba840:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba844:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba848:	54000209	b.ls	0xfffff7fba888  // b.plast
   0x0000fffff7fba84c:	36d8008d	tbz	w13, #27, 0xfffff7fba85c
   0x0000fffff7fba850:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba854:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba858:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba85c:	36d80091	tbz	w17, #27, 0xfffff7fba86c
   0x0000fffff7fba860:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba864:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba868:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba86c:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fba870:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fba874:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fba878:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fba87c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fba880:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fba884:	1400000e	b	0xfffff7fba8bc
   0x0000fffff7fba888:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fba88c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba890:	aa1303e1	mov	x1, x19
   0x0000fffff7fba894:	aa1503e2	mov	x2, x21
   0x0000fffff7fba898:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fba89c:	aa1403e4	mov	x4, x20
   0x0000fffff7fba8a0:	aa1603e5	mov	x5, x22
   0x0000fffff7fba8a4:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fba8a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba8ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba8b0:	d63f0200	blr	x16
   0x0000fffff7fba8b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba8b8:	5400b340	b.eq	0xfffff7fbbf20  // b.none
   0x0000fffff7fba8bc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba8c0:	37d806a9	tbnz	w9, #27, 0xfffff7fba994
   0x0000fffff7fba8c4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba8c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba8cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba8d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba8d4:	540001c1	b.ne	0xfffff7fba90c  // b.any
   0x0000fffff7fba8d8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fba8dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba8e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba8e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba8e8:	54000121	b.ne	0xfffff7fba90c  // b.any
   0x0000fffff7fba8ec:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fba8f0:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fba8f4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fba8f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba8fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba900:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fba904:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fba908:	14000030	b	0xfffff7fba9c8
   0x0000fffff7fba90c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba910:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba914:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba918:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba91c:	54000120	b.eq	0xfffff7fba940  // b.none
   0x0000fffff7fba920:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba924:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba928:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba92c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba930:	54000321	b.ne	0xfffff7fba994  // b.any
   0x0000fffff7fba934:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fba938:	9e620120	scvtf	d0, x9
   0x0000fffff7fba93c:	14000002	b	0xfffff7fba944
   0x0000fffff7fba940:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fba944:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fba948:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba94c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba950:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba954:	54000120	b.eq	0xfffff7fba978  // b.none
   0x0000fffff7fba958:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fba95c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba960:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba964:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba968:	54000161	b.ne	0xfffff7fba994  // b.any
   0x0000fffff7fba96c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fba970:	9e620121	scvtf	d1, x9
   0x0000fffff7fba974:	14000002	b	0xfffff7fba97c
   0x0000fffff7fba978:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fba97c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fba980:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fba984:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba988:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba98c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fba990:	17ffffde	b	0xfffff7fba908
   0x0000fffff7fba994:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba998:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba99c:	aa1303e1	mov	x1, x19
   0x0000fffff7fba9a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fba9a4:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fba9a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fba9ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fba9b0:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fba9b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fba9b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba9bc:	d63f0200	blr	x16
   0x0000fffff7fba9c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba9c4:	5400ab20	b.eq	0xfffff7fbbf28  // b.none
   0x0000fffff7fba9c8:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fba9cc:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fba9d0:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fba9d4:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fba9d8:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fba9dc:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fba9e0:	36d801d1	tbz	w17, #27, 0xfffff7fbaa18
   0x0000fffff7fba9e4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba9e8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba9ec:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba9f0:	54000281	b.ne	0xfffff7fbaa40  // b.any
   0x0000fffff7fba9f4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fba9f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba9fc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbaa00:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbaa04:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbaa08:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbaa0c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbaa10:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbaa14:	54000169	b.ls	0xfffff7fbaa40  // b.plast
   0x0000fffff7fbaa18:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbaa1c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbaa20:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbaa24:	36d80091	tbz	w17, #27, 0xfffff7fbaa34
   0x0000fffff7fbaa28:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbaa2c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbaa30:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbaa34:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbaa38:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbaa3c:	1400000e	b	0xfffff7fbaa74
   0x0000fffff7fbaa40:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbaa44:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbaa48:	aa1303e1	mov	x1, x19
   0x0000fffff7fbaa4c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbaa50:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fbaa54:	aa1403e4	mov	x4, x20
   0x0000fffff7fbaa58:	aa1603e5	mov	x5, x22
   0x0000fffff7fbaa5c:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fbaa60:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbaa64:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbaa68:	d63f0200	blr	x16
   0x0000fffff7fbaa6c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbaa70:	5400a600	b.eq	0xfffff7fbbf30  // b.none
   0x0000fffff7fbaa74:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbaa78:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbaa7c:	540003a0	b.eq	0xfffff7fbaaf0  // b.none
   0x0000fffff7fbaa80:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbaa84:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbaa88:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbaa8c:	36d801d1	tbz	w17, #27, 0xfffff7fbaac4
   0x0000fffff7fbaa90:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbaa94:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbaa98:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbaa9c:	540002a1	b.ne	0xfffff7fbaaf0  // b.any
   0x0000fffff7fbaaa0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbaaa4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbaaa8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbaaac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbaab0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbaab4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbaab8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbaabc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbaac0:	54000189	b.ls	0xfffff7fbaaf0  // b.plast
   0x0000fffff7fbaac4:	36d8008d	tbz	w13, #27, 0xfffff7fbaad4
   0x0000fffff7fbaac8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbaacc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbaad0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbaad4:	36d80091	tbz	w17, #27, 0xfffff7fbaae4
   0x0000fffff7fbaad8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbaadc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbaae0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbaae4:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbaae8:	b900016d	str	w13, [x11]
   0x0000fffff7fbaaec:	1400000e	b	0xfffff7fbab24
   0x0000fffff7fbaaf0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbaaf4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbaaf8:	aa1303e1	mov	x1, x19
   0x0000fffff7fbaafc:	aa1503e2	mov	x2, x21
   0x0000fffff7fbab00:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fbab04:	aa1403e4	mov	x4, x20
   0x0000fffff7fbab08:	aa1603e5	mov	x5, x22
   0x0000fffff7fbab0c:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fbab10:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbab14:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbab18:	d63f0200	blr	x16
   0x0000fffff7fbab1c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbab20:	5400a0c0	b.eq	0xfffff7fbbf38  // b.none
   0x0000fffff7fbab24:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbab28:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbab2c:	540004a0	b.eq	0xfffff7fbabc0  // b.none
   0x0000fffff7fbab30:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbab34:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbab38:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbab3c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbab40:	54000400	b.eq	0xfffff7fbabc0  // b.none
   0x0000fffff7fbab44:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbab48:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbab4c:	36d801d1	tbz	w17, #27, 0xfffff7fbab84
   0x0000fffff7fbab50:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbab54:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbab58:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbab5c:	54000321	b.ne	0xfffff7fbabc0  // b.any
   0x0000fffff7fbab60:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbab64:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbab68:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbab6c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbab70:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbab74:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbab78:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbab7c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbab80:	54000209	b.ls	0xfffff7fbabc0  // b.plast
   0x0000fffff7fbab84:	36d8008d	tbz	w13, #27, 0xfffff7fbab94
   0x0000fffff7fbab88:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbab8c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbab90:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbab94:	36d80091	tbz	w17, #27, 0xfffff7fbaba4
   0x0000fffff7fbab98:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbab9c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbaba0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbaba4:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fbaba8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbabac:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbabb0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbabb4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbabb8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbabbc:	1400000e	b	0xfffff7fbabf4
   0x0000fffff7fbabc0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbabc4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbabc8:	aa1303e1	mov	x1, x19
   0x0000fffff7fbabcc:	aa1503e2	mov	x2, x21
   0x0000fffff7fbabd0:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fbabd4:	aa1403e4	mov	x4, x20
   0x0000fffff7fbabd8:	aa1603e5	mov	x5, x22
   0x0000fffff7fbabdc:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fbabe0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbabe4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbabe8:	d63f0200	blr	x16
   0x0000fffff7fbabec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbabf0:	54009a80	b.eq	0xfffff7fbbf40  // b.none
   0x0000fffff7fbabf4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbabf8:	37d806a9	tbnz	w9, #27, 0xfffff7fbaccc
   0x0000fffff7fbabfc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbac00:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbac04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbac08:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbac0c:	540001c1	b.ne	0xfffff7fbac44  // b.any
   0x0000fffff7fbac10:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbac14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbac18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbac1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbac20:	54000121	b.ne	0xfffff7fbac44  // b.any
   0x0000fffff7fbac24:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbac28:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fbac2c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbac30:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbac34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbac38:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbac3c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbac40:	14000030	b	0xfffff7fbad00
   0x0000fffff7fbac44:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbac48:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbac4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbac50:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbac54:	54000120	b.eq	0xfffff7fbac78  // b.none
   0x0000fffff7fbac58:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbac5c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbac60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbac64:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbac68:	54000321	b.ne	0xfffff7fbaccc  // b.any
   0x0000fffff7fbac6c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbac70:	9e620120	scvtf	d0, x9
   0x0000fffff7fbac74:	14000002	b	0xfffff7fbac7c
   0x0000fffff7fbac78:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbac7c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbac80:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbac84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbac88:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbac8c:	54000120	b.eq	0xfffff7fbacb0  // b.none
   0x0000fffff7fbac90:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbac94:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbac98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbac9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbaca0:	54000161	b.ne	0xfffff7fbaccc  // b.any
   0x0000fffff7fbaca4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbaca8:	9e620121	scvtf	d1, x9
   0x0000fffff7fbacac:	14000002	b	0xfffff7fbacb4
   0x0000fffff7fbacb0:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fbacb4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbacb8:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbacbc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbacc0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbacc4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbacc8:	17ffffde	b	0xfffff7fbac40
   0x0000fffff7fbaccc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbacd0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbacd4:	aa1303e1	mov	x1, x19
   0x0000fffff7fbacd8:	aa1503e2	mov	x2, x21
   0x0000fffff7fbacdc:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fbace0:	aa1403e4	mov	x4, x20
   0x0000fffff7fbace4:	aa1603e5	mov	x5, x22
   0x0000fffff7fbace8:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fbacec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbacf0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbacf4:	d63f0200	blr	x16
   0x0000fffff7fbacf8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbacfc:	54009260	b.eq	0xfffff7fbbf48  // b.none
   0x0000fffff7fbad00:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbad04:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbad08:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbad0c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbad10:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbad14:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbad18:	36d801d1	tbz	w17, #27, 0xfffff7fbad50
   0x0000fffff7fbad1c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbad20:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbad24:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbad28:	54000281	b.ne	0xfffff7fbad78  // b.any
   0x0000fffff7fbad2c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbad30:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbad34:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbad38:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbad3c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbad40:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbad44:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbad48:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbad4c:	54000169	b.ls	0xfffff7fbad78  // b.plast
   0x0000fffff7fbad50:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbad54:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbad58:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbad5c:	36d80091	tbz	w17, #27, 0xfffff7fbad6c
   0x0000fffff7fbad60:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbad64:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbad68:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbad6c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbad70:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbad74:	1400000e	b	0xfffff7fbadac
   0x0000fffff7fbad78:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbad7c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbad80:	aa1303e1	mov	x1, x19
   0x0000fffff7fbad84:	aa1503e2	mov	x2, x21
   0x0000fffff7fbad88:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fbad8c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbad90:	aa1603e5	mov	x5, x22
   0x0000fffff7fbad94:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fbad98:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbad9c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbada0:	d63f0200	blr	x16
   0x0000fffff7fbada4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbada8:	54008d40	b.eq	0xfffff7fbbf50  // b.none
   0x0000fffff7fbadac:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbadb0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbadb4:	540003a0	b.eq	0xfffff7fbae28  // b.none
   0x0000fffff7fbadb8:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbadbc:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbadc0:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbadc4:	36d801d1	tbz	w17, #27, 0xfffff7fbadfc
   0x0000fffff7fbadc8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbadcc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbadd0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbadd4:	540002a1	b.ne	0xfffff7fbae28  // b.any
   0x0000fffff7fbadd8:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbaddc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbade0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbade4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbade8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbadec:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbadf0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbadf4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbadf8:	54000189	b.ls	0xfffff7fbae28  // b.plast
   0x0000fffff7fbadfc:	36d8008d	tbz	w13, #27, 0xfffff7fbae0c
   0x0000fffff7fbae00:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbae04:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbae08:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbae0c:	36d80091	tbz	w17, #27, 0xfffff7fbae1c
   0x0000fffff7fbae10:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbae14:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbae18:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbae1c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbae20:	b900016d	str	w13, [x11]
   0x0000fffff7fbae24:	1400000e	b	0xfffff7fbae5c
   0x0000fffff7fbae28:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbae2c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbae30:	aa1303e1	mov	x1, x19
   0x0000fffff7fbae34:	aa1503e2	mov	x2, x21
   0x0000fffff7fbae38:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fbae3c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbae40:	aa1603e5	mov	x5, x22
   0x0000fffff7fbae44:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fbae48:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbae4c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbae50:	d63f0200	blr	x16
   0x0000fffff7fbae54:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbae58:	54008800	b.eq	0xfffff7fbbf58  // b.none
   0x0000fffff7fbae5c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbae60:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbae64:	540004a0	b.eq	0xfffff7fbaef8  // b.none
   0x0000fffff7fbae68:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbae6c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbae70:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbae74:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbae78:	54000400	b.eq	0xfffff7fbaef8  // b.none
   0x0000fffff7fbae7c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbae80:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbae84:	36d801d1	tbz	w17, #27, 0xfffff7fbaebc
   0x0000fffff7fbae88:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbae8c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbae90:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbae94:	54000321	b.ne	0xfffff7fbaef8  // b.any
   0x0000fffff7fbae98:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbae9c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbaea0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbaea4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbaea8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbaeac:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbaeb0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbaeb4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbaeb8:	54000209	b.ls	0xfffff7fbaef8  // b.plast
   0x0000fffff7fbaebc:	36d8008d	tbz	w13, #27, 0xfffff7fbaecc
   0x0000fffff7fbaec0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbaec4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbaec8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbaecc:	36d80091	tbz	w17, #27, 0xfffff7fbaedc
   0x0000fffff7fbaed0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbaed4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbaed8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbaedc:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fbaee0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbaee4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbaee8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbaeec:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbaef0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbaef4:	1400000e	b	0xfffff7fbaf2c
   0x0000fffff7fbaef8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbaefc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbaf00:	aa1303e1	mov	x1, x19
   0x0000fffff7fbaf04:	aa1503e2	mov	x2, x21
   0x0000fffff7fbaf08:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fbaf0c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbaf10:	aa1603e5	mov	x5, x22
   0x0000fffff7fbaf14:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fbaf18:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbaf1c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbaf20:	d63f0200	blr	x16
   0x0000fffff7fbaf24:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbaf28:	540081c0	b.eq	0xfffff7fbbf60  // b.none
   0x0000fffff7fbaf2c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbaf30:	37d806a9	tbnz	w9, #27, 0xfffff7fbb004
   0x0000fffff7fbaf34:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbaf38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbaf3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbaf40:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbaf44:	540001c1	b.ne	0xfffff7fbaf7c  // b.any
   0x0000fffff7fbaf48:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbaf4c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbaf50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbaf54:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbaf58:	54000121	b.ne	0xfffff7fbaf7c  // b.any
   0x0000fffff7fbaf5c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbaf60:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fbaf64:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbaf68:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbaf6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbaf70:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbaf74:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbaf78:	14000030	b	0xfffff7fbb038
   0x0000fffff7fbaf7c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbaf80:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbaf84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbaf88:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbaf8c:	54000120	b.eq	0xfffff7fbafb0  // b.none
   0x0000fffff7fbaf90:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbaf94:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbaf98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbaf9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbafa0:	54000321	b.ne	0xfffff7fbb004  // b.any
   0x0000fffff7fbafa4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbafa8:	9e620120	scvtf	d0, x9
   0x0000fffff7fbafac:	14000002	b	0xfffff7fbafb4
   0x0000fffff7fbafb0:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbafb4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbafb8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbafbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbafc0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbafc4:	54000120	b.eq	0xfffff7fbafe8  // b.none
   0x0000fffff7fbafc8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbafcc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbafd0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbafd4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbafd8:	54000161	b.ne	0xfffff7fbb004  // b.any
   0x0000fffff7fbafdc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbafe0:	9e620121	scvtf	d1, x9
   0x0000fffff7fbafe4:	14000002	b	0xfffff7fbafec
   0x0000fffff7fbafe8:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fbafec:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbaff0:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbaff4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbaff8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbaffc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbb000:	17ffffde	b	0xfffff7fbaf78
   0x0000fffff7fbb004:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb008:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb00c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb010:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb014:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fbb018:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb01c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb020:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fbb024:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb028:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb02c:	d63f0200	blr	x16
   0x0000fffff7fbb030:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb034:	540079a0	b.eq	0xfffff7fbbf68  // b.none
   0x0000fffff7fbb038:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbb03c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbb040:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbb044:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbb048:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbb04c:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbb050:	36d801d1	tbz	w17, #27, 0xfffff7fbb088
   0x0000fffff7fbb054:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb058:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb05c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb060:	54000281	b.ne	0xfffff7fbb0b0  // b.any
   0x0000fffff7fbb064:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbb068:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb06c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb070:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb074:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb078:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb07c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb080:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb084:	54000169	b.ls	0xfffff7fbb0b0  // b.plast
   0x0000fffff7fbb088:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb08c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb090:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb094:	36d80091	tbz	w17, #27, 0xfffff7fbb0a4
   0x0000fffff7fbb098:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb09c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb0a0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb0a4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbb0a8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbb0ac:	1400000e	b	0xfffff7fbb0e4
   0x0000fffff7fbb0b0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb0b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb0b8:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb0bc:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb0c0:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fbb0c4:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb0c8:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb0cc:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fbb0d0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb0d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb0d8:	d63f0200	blr	x16
   0x0000fffff7fbb0dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb0e0:	54007480	b.eq	0xfffff7fbbf70  // b.none
   0x0000fffff7fbb0e4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbb0e8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbb0ec:	540003a0	b.eq	0xfffff7fbb160  // b.none
   0x0000fffff7fbb0f0:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbb0f4:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbb0f8:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbb0fc:	36d801d1	tbz	w17, #27, 0xfffff7fbb134
   0x0000fffff7fbb100:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb104:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb108:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb10c:	540002a1	b.ne	0xfffff7fbb160  // b.any
   0x0000fffff7fbb110:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbb114:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb118:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb11c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb120:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb124:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb128:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb12c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb130:	54000189	b.ls	0xfffff7fbb160  // b.plast
   0x0000fffff7fbb134:	36d8008d	tbz	w13, #27, 0xfffff7fbb144
   0x0000fffff7fbb138:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb13c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb140:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb144:	36d80091	tbz	w17, #27, 0xfffff7fbb154
   0x0000fffff7fbb148:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb14c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb150:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb154:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbb158:	b900016d	str	w13, [x11]
   0x0000fffff7fbb15c:	1400000e	b	0xfffff7fbb194
   0x0000fffff7fbb160:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbb164:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb168:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb16c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb170:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fbb174:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb178:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb17c:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fbb180:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb188:	d63f0200	blr	x16
   0x0000fffff7fbb18c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb190:	54006f40	b.eq	0xfffff7fbbf78  // b.none
   0x0000fffff7fbb194:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbb198:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbb19c:	540004a0	b.eq	0xfffff7fbb230  // b.none
   0x0000fffff7fbb1a0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbb1a4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbb1a8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbb1ac:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbb1b0:	54000400	b.eq	0xfffff7fbb230  // b.none
   0x0000fffff7fbb1b4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbb1b8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbb1bc:	36d801d1	tbz	w17, #27, 0xfffff7fbb1f4
   0x0000fffff7fbb1c0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb1c4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb1c8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb1cc:	54000321	b.ne	0xfffff7fbb230  // b.any
   0x0000fffff7fbb1d0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbb1d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb1d8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb1dc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb1e0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb1e4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb1e8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb1ec:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb1f0:	54000209	b.ls	0xfffff7fbb230  // b.plast
   0x0000fffff7fbb1f4:	36d8008d	tbz	w13, #27, 0xfffff7fbb204
   0x0000fffff7fbb1f8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb1fc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb200:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb204:	36d80091	tbz	w17, #27, 0xfffff7fbb214
   0x0000fffff7fbb208:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb20c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb210:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb214:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fbb218:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbb21c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbb220:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbb224:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbb228:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbb22c:	1400000e	b	0xfffff7fbb264
   0x0000fffff7fbb230:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbb234:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb238:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb23c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb240:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fbb244:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb248:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb24c:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fbb250:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbb254:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb258:	d63f0200	blr	x16
   0x0000fffff7fbb25c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb260:	54006900	b.eq	0xfffff7fbbf80  // b.none
   0x0000fffff7fbb264:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb268:	37d806a9	tbnz	w9, #27, 0xfffff7fbb33c
   0x0000fffff7fbb26c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb270:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb274:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb278:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb27c:	540001c1	b.ne	0xfffff7fbb2b4  // b.any
   0x0000fffff7fbb280:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb284:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb288:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb28c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb290:	54000121	b.ne	0xfffff7fbb2b4  // b.any
   0x0000fffff7fbb294:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbb298:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fbb29c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbb2a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb2a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb2a8:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbb2ac:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbb2b0:	14000030	b	0xfffff7fbb370
   0x0000fffff7fbb2b4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb2b8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb2bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb2c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb2c4:	54000120	b.eq	0xfffff7fbb2e8  // b.none
   0x0000fffff7fbb2c8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb2cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb2d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb2d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb2d8:	54000321	b.ne	0xfffff7fbb33c  // b.any
   0x0000fffff7fbb2dc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbb2e0:	9e620120	scvtf	d0, x9
   0x0000fffff7fbb2e4:	14000002	b	0xfffff7fbb2ec
   0x0000fffff7fbb2e8:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbb2ec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb2f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb2f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb2f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb2fc:	54000120	b.eq	0xfffff7fbb320  // b.none
   0x0000fffff7fbb300:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb304:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb308:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb30c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb310:	54000161	b.ne	0xfffff7fbb33c  // b.any
   0x0000fffff7fbb314:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbb318:	9e620121	scvtf	d1, x9
   0x0000fffff7fbb31c:	14000002	b	0xfffff7fbb324
   0x0000fffff7fbb320:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fbb324:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbb328:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbb32c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb330:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb334:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbb338:	17ffffde	b	0xfffff7fbb2b0
   0x0000fffff7fbb33c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb340:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb344:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb348:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb34c:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fbb350:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb354:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb358:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fbb35c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb360:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb364:	d63f0200	blr	x16
   0x0000fffff7fbb368:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb36c:	540060e0	b.eq	0xfffff7fbbf88  // b.none
   0x0000fffff7fbb370:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbb374:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbb378:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbb37c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbb380:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbb384:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbb388:	36d801d1	tbz	w17, #27, 0xfffff7fbb3c0
   0x0000fffff7fbb38c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb390:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb394:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb398:	54000281	b.ne	0xfffff7fbb3e8  // b.any
   0x0000fffff7fbb39c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbb3a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb3a4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb3a8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb3ac:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb3b0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb3b4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb3b8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb3bc:	54000169	b.ls	0xfffff7fbb3e8  // b.plast
   0x0000fffff7fbb3c0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb3c4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb3c8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb3cc:	36d80091	tbz	w17, #27, 0xfffff7fbb3dc
   0x0000fffff7fbb3d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb3d4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb3d8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb3dc:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbb3e0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbb3e4:	1400000e	b	0xfffff7fbb41c
   0x0000fffff7fbb3e8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb3ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb3f0:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb3f4:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb3f8:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fbb3fc:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb400:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb404:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fbb408:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb40c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb410:	d63f0200	blr	x16
   0x0000fffff7fbb414:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb418:	54005bc0	b.eq	0xfffff7fbbf90  // b.none
   0x0000fffff7fbb41c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbb420:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbb424:	540003a0	b.eq	0xfffff7fbb498  // b.none
   0x0000fffff7fbb428:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbb42c:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbb430:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbb434:	36d801d1	tbz	w17, #27, 0xfffff7fbb46c
   0x0000fffff7fbb438:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb43c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb440:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb444:	540002a1	b.ne	0xfffff7fbb498  // b.any
   0x0000fffff7fbb448:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbb44c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb450:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb454:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb458:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb45c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb460:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb464:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb468:	54000189	b.ls	0xfffff7fbb498  // b.plast
   0x0000fffff7fbb46c:	36d8008d	tbz	w13, #27, 0xfffff7fbb47c
   0x0000fffff7fbb470:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb474:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb478:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb47c:	36d80091	tbz	w17, #27, 0xfffff7fbb48c
   0x0000fffff7fbb480:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb484:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb488:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb48c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbb490:	b900016d	str	w13, [x11]
   0x0000fffff7fbb494:	1400000e	b	0xfffff7fbb4cc
   0x0000fffff7fbb498:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbb49c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb4a0:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb4a4:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb4a8:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fbb4ac:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb4b0:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb4b4:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fbb4b8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb4bc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb4c0:	d63f0200	blr	x16
   0x0000fffff7fbb4c4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb4c8:	54005680	b.eq	0xfffff7fbbf98  // b.none
   0x0000fffff7fbb4cc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbb4d0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbb4d4:	540004a0	b.eq	0xfffff7fbb568  // b.none
   0x0000fffff7fbb4d8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbb4dc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbb4e0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbb4e4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbb4e8:	54000400	b.eq	0xfffff7fbb568  // b.none
   0x0000fffff7fbb4ec:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbb4f0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbb4f4:	36d801d1	tbz	w17, #27, 0xfffff7fbb52c
   0x0000fffff7fbb4f8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb4fc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb500:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb504:	54000321	b.ne	0xfffff7fbb568  // b.any
   0x0000fffff7fbb508:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbb50c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb510:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb514:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb518:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb51c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb520:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb524:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb528:	54000209	b.ls	0xfffff7fbb568  // b.plast
   0x0000fffff7fbb52c:	36d8008d	tbz	w13, #27, 0xfffff7fbb53c
   0x0000fffff7fbb530:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb534:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb538:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb53c:	36d80091	tbz	w17, #27, 0xfffff7fbb54c
   0x0000fffff7fbb540:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb544:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb548:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb54c:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fbb550:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbb554:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbb558:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbb55c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbb560:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbb564:	1400000e	b	0xfffff7fbb59c
   0x0000fffff7fbb568:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbb56c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb570:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb574:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb578:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fbb57c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb580:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb584:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fbb588:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbb58c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb590:	d63f0200	blr	x16
   0x0000fffff7fbb594:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb598:	54005040	b.eq	0xfffff7fbbfa0  // b.none
   0x0000fffff7fbb59c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb5a0:	37d806a9	tbnz	w9, #27, 0xfffff7fbb674
   0x0000fffff7fbb5a4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb5a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb5ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb5b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb5b4:	540001c1	b.ne	0xfffff7fbb5ec  // b.any
   0x0000fffff7fbb5b8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb5bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb5c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb5c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb5c8:	54000121	b.ne	0xfffff7fbb5ec  // b.any
   0x0000fffff7fbb5cc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbb5d0:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fbb5d4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbb5d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb5dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb5e0:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbb5e4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbb5e8:	14000030	b	0xfffff7fbb6a8
   0x0000fffff7fbb5ec:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb5f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb5f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb5f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb5fc:	54000120	b.eq	0xfffff7fbb620  // b.none
   0x0000fffff7fbb600:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb604:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb608:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb60c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb610:	54000321	b.ne	0xfffff7fbb674  // b.any
   0x0000fffff7fbb614:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbb618:	9e620120	scvtf	d0, x9
   0x0000fffff7fbb61c:	14000002	b	0xfffff7fbb624
   0x0000fffff7fbb620:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbb624:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb628:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb62c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb630:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb634:	54000120	b.eq	0xfffff7fbb658  // b.none
   0x0000fffff7fbb638:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb63c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb640:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb644:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb648:	54000161	b.ne	0xfffff7fbb674  // b.any
   0x0000fffff7fbb64c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbb650:	9e620121	scvtf	d1, x9
   0x0000fffff7fbb654:	14000002	b	0xfffff7fbb65c
   0x0000fffff7fbb658:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fbb65c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbb660:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbb664:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb668:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb66c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbb670:	17ffffde	b	0xfffff7fbb5e8
   0x0000fffff7fbb674:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb678:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb67c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb680:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb684:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fbb688:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb68c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb690:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fbb694:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb698:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb69c:	d63f0200	blr	x16
   0x0000fffff7fbb6a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb6a4:	54004820	b.eq	0xfffff7fbbfa8  // b.none
   0x0000fffff7fbb6a8:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbb6ac:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbb6b0:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbb6b4:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbb6b8:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbb6bc:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbb6c0:	36d801d1	tbz	w17, #27, 0xfffff7fbb6f8
   0x0000fffff7fbb6c4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb6c8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb6cc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb6d0:	54000281	b.ne	0xfffff7fbb720  // b.any
   0x0000fffff7fbb6d4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbb6d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb6dc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb6e0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb6e4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb6e8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb6ec:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb6f0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb6f4:	54000169	b.ls	0xfffff7fbb720  // b.plast
   0x0000fffff7fbb6f8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb6fc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb700:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb704:	36d80091	tbz	w17, #27, 0xfffff7fbb714
   0x0000fffff7fbb708:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb70c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb710:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb714:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbb718:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbb71c:	1400000e	b	0xfffff7fbb754
   0x0000fffff7fbb720:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb724:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb728:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb72c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb730:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fbb734:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb738:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb73c:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fbb740:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb744:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb748:	d63f0200	blr	x16
   0x0000fffff7fbb74c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb750:	54004300	b.eq	0xfffff7fbbfb0  // b.none
   0x0000fffff7fbb754:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbb758:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbb75c:	540003a0	b.eq	0xfffff7fbb7d0  // b.none
   0x0000fffff7fbb760:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbb764:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbb768:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbb76c:	36d801d1	tbz	w17, #27, 0xfffff7fbb7a4
   0x0000fffff7fbb770:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb774:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb778:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb77c:	540002a1	b.ne	0xfffff7fbb7d0  // b.any
   0x0000fffff7fbb780:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbb784:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb788:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb78c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb790:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb794:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb798:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb79c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb7a0:	54000189	b.ls	0xfffff7fbb7d0  // b.plast
   0x0000fffff7fbb7a4:	36d8008d	tbz	w13, #27, 0xfffff7fbb7b4
   0x0000fffff7fbb7a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb7ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb7b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb7b4:	36d80091	tbz	w17, #27, 0xfffff7fbb7c4
   0x0000fffff7fbb7b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb7bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb7c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb7c4:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbb7c8:	b900016d	str	w13, [x11]
   0x0000fffff7fbb7cc:	1400000e	b	0xfffff7fbb804
   0x0000fffff7fbb7d0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbb7d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb7d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb7dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb7e0:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fbb7e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb7e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb7ec:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fbb7f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb7f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb7f8:	d63f0200	blr	x16
   0x0000fffff7fbb7fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb800:	54003dc0	b.eq	0xfffff7fbbfb8  // b.none
   0x0000fffff7fbb804:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbb808:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbb80c:	540004a0	b.eq	0xfffff7fbb8a0  // b.none
   0x0000fffff7fbb810:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbb814:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbb818:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbb81c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbb820:	54000400	b.eq	0xfffff7fbb8a0  // b.none
   0x0000fffff7fbb824:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbb828:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbb82c:	36d801d1	tbz	w17, #27, 0xfffff7fbb864
   0x0000fffff7fbb830:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb834:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb838:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb83c:	54000321	b.ne	0xfffff7fbb8a0  // b.any
   0x0000fffff7fbb840:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbb844:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb848:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb84c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb850:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb854:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb858:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb85c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb860:	54000209	b.ls	0xfffff7fbb8a0  // b.plast
   0x0000fffff7fbb864:	36d8008d	tbz	w13, #27, 0xfffff7fbb874
   0x0000fffff7fbb868:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb86c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb870:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb874:	36d80091	tbz	w17, #27, 0xfffff7fbb884
   0x0000fffff7fbb878:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb87c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb880:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb884:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fbb888:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbb88c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbb890:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbb894:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbb898:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbb89c:	1400000e	b	0xfffff7fbb8d4
   0x0000fffff7fbb8a0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbb8a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb8a8:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb8ac:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb8b0:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fbb8b4:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb8b8:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb8bc:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fbb8c0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbb8c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb8c8:	d63f0200	blr	x16
   0x0000fffff7fbb8cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb8d0:	54003780	b.eq	0xfffff7fbbfc0  // b.none
   0x0000fffff7fbb8d4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb8d8:	37d806a9	tbnz	w9, #27, 0xfffff7fbb9ac
   0x0000fffff7fbb8dc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb8e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb8e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb8e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb8ec:	540001c1	b.ne	0xfffff7fbb924  // b.any
   0x0000fffff7fbb8f0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb8f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb8f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb8fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb900:	54000121	b.ne	0xfffff7fbb924  // b.any
   0x0000fffff7fbb904:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbb908:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fbb90c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbb910:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb914:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb918:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbb91c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbb920:	14000030	b	0xfffff7fbb9e0
   0x0000fffff7fbb924:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb928:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb92c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb930:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb934:	54000120	b.eq	0xfffff7fbb958  // b.none
   0x0000fffff7fbb938:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb93c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb940:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb944:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb948:	54000321	b.ne	0xfffff7fbb9ac  // b.any
   0x0000fffff7fbb94c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbb950:	9e620120	scvtf	d0, x9
   0x0000fffff7fbb954:	14000002	b	0xfffff7fbb95c
   0x0000fffff7fbb958:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbb95c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb960:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb964:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb968:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb96c:	54000120	b.eq	0xfffff7fbb990  // b.none
   0x0000fffff7fbb970:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb974:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb978:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb97c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb980:	54000161	b.ne	0xfffff7fbb9ac  // b.any
   0x0000fffff7fbb984:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbb988:	9e620121	scvtf	d1, x9
   0x0000fffff7fbb98c:	14000002	b	0xfffff7fbb994
   0x0000fffff7fbb990:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fbb994:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbb998:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbb99c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb9a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb9a4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbb9a8:	17ffffde	b	0xfffff7fbb920
   0x0000fffff7fbb9ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb9b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb9b4:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb9b8:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb9bc:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fbb9c0:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb9c4:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb9c8:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fbb9cc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb9d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb9d4:	d63f0200	blr	x16
   0x0000fffff7fbb9d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb9dc:	54002f60	b.eq	0xfffff7fbbfc8  // b.none
   0x0000fffff7fbb9e0:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbb9e4:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbb9e8:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbb9ec:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbb9f0:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbb9f4:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbb9f8:	36d801d1	tbz	w17, #27, 0xfffff7fbba30
   0x0000fffff7fbb9fc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbba00:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbba04:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbba08:	54000281	b.ne	0xfffff7fbba58  // b.any
   0x0000fffff7fbba0c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbba10:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbba14:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbba18:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbba1c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbba20:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbba24:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbba28:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbba2c:	54000169	b.ls	0xfffff7fbba58  // b.plast
   0x0000fffff7fbba30:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbba34:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbba38:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbba3c:	36d80091	tbz	w17, #27, 0xfffff7fbba4c
   0x0000fffff7fbba40:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbba44:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbba48:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbba4c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbba50:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbba54:	1400000e	b	0xfffff7fbba8c
   0x0000fffff7fbba58:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbba5c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbba60:	aa1303e1	mov	x1, x19
   0x0000fffff7fbba64:	aa1503e2	mov	x2, x21
   0x0000fffff7fbba68:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fbba6c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbba70:	aa1603e5	mov	x5, x22
   0x0000fffff7fbba74:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fbba78:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbba7c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbba80:	d63f0200	blr	x16
   0x0000fffff7fbba84:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbba88:	54002a40	b.eq	0xfffff7fbbfd0  // b.none
   0x0000fffff7fbba8c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbba90:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbba94:	540003a0	b.eq	0xfffff7fbbb08  // b.none
   0x0000fffff7fbba98:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbba9c:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbbaa0:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbbaa4:	36d801d1	tbz	w17, #27, 0xfffff7fbbadc
   0x0000fffff7fbbaa8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbbaac:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbbab0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbbab4:	540002a1	b.ne	0xfffff7fbbb08  // b.any
   0x0000fffff7fbbab8:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbbabc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbbac0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbbac4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbbac8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbbacc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbbad0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbbad4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbbad8:	54000189	b.ls	0xfffff7fbbb08  // b.plast
   0x0000fffff7fbbadc:	36d8008d	tbz	w13, #27, 0xfffff7fbbaec
   0x0000fffff7fbbae0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbbae4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbbae8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbbaec:	36d80091	tbz	w17, #27, 0xfffff7fbbafc
   0x0000fffff7fbbaf0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbbaf4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbbaf8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbbafc:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbbb00:	b900016d	str	w13, [x11]
   0x0000fffff7fbbb04:	1400000e	b	0xfffff7fbbb3c
   0x0000fffff7fbbb08:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbbb0c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbbb10:	aa1303e1	mov	x1, x19
   0x0000fffff7fbbb14:	aa1503e2	mov	x2, x21
   0x0000fffff7fbbb18:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fbbb1c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbbb20:	aa1603e5	mov	x5, x22
   0x0000fffff7fbbb24:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fbbb28:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbbb2c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbbb30:	d63f0200	blr	x16
   0x0000fffff7fbbb34:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbbb38:	54002500	b.eq	0xfffff7fbbfd8  // b.none
   0x0000fffff7fbbb3c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbbb40:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbbb44:	540004a0	b.eq	0xfffff7fbbbd8  // b.none
   0x0000fffff7fbbb48:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbbb4c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbbb50:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbbb54:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbbb58:	54000400	b.eq	0xfffff7fbbbd8  // b.none
   0x0000fffff7fbbb5c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbbb60:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbbb64:	36d801d1	tbz	w17, #27, 0xfffff7fbbb9c
   0x0000fffff7fbbb68:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbbb6c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbbb70:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbbb74:	54000321	b.ne	0xfffff7fbbbd8  // b.any
   0x0000fffff7fbbb78:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbbb7c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbbb80:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbbb84:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbbb88:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbbb8c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbbb90:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbbb94:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbbb98:	54000209	b.ls	0xfffff7fbbbd8  // b.plast
   0x0000fffff7fbbb9c:	36d8008d	tbz	w13, #27, 0xfffff7fbbbac
   0x0000fffff7fbbba0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbbba4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbbba8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbbbac:	36d80091	tbz	w17, #27, 0xfffff7fbbbbc
   0x0000fffff7fbbbb0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbbbb4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbbbb8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbbbbc:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fbbbc0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbbbc4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbbbc8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbbbcc:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbbbd0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbbbd4:	1400000e	b	0xfffff7fbbc0c
   0x0000fffff7fbbbd8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbbbdc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbbbe0:	aa1303e1	mov	x1, x19
   0x0000fffff7fbbbe4:	aa1503e2	mov	x2, x21
   0x0000fffff7fbbbe8:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fbbbec:	aa1403e4	mov	x4, x20
   0x0000fffff7fbbbf0:	aa1603e5	mov	x5, x22
   0x0000fffff7fbbbf4:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fbbbf8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbbbfc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbbc00:	d63f0200	blr	x16
   0x0000fffff7fbbc04:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbbc08:	54001ec0	b.eq	0xfffff7fbbfe0  // b.none
   0x0000fffff7fbbc0c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbbc10:	37d806a9	tbnz	w9, #27, 0xfffff7fbbce4
   0x0000fffff7fbbc14:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbbc18:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbbc1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbc20:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbbc24:	540001c1	b.ne	0xfffff7fbbc5c  // b.any
   0x0000fffff7fbbc28:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbbc2c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbbc30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbc34:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbbc38:	54000121	b.ne	0xfffff7fbbc5c  // b.any
   0x0000fffff7fbbc3c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbbc40:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fbbc44:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbbc48:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbbc4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbc50:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbbc54:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbbc58:	14000030	b	0xfffff7fbbd18
   0x0000fffff7fbbc5c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbbc60:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbbc64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbc68:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbbc6c:	54000120	b.eq	0xfffff7fbbc90  // b.none
   0x0000fffff7fbbc70:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbbc74:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbbc78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbc7c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbbc80:	54000321	b.ne	0xfffff7fbbce4  // b.any
   0x0000fffff7fbbc84:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbbc88:	9e620120	scvtf	d0, x9
   0x0000fffff7fbbc8c:	14000002	b	0xfffff7fbbc94
   0x0000fffff7fbbc90:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbbc94:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbbc98:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbbc9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbca0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbbca4:	54000120	b.eq	0xfffff7fbbcc8  // b.none
   0x0000fffff7fbbca8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbbcac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbbcb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbcb4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbbcb8:	54000161	b.ne	0xfffff7fbbce4  // b.any
   0x0000fffff7fbbcbc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbbcc0:	9e620121	scvtf	d1, x9
   0x0000fffff7fbbcc4:	14000002	b	0xfffff7fbbccc
   0x0000fffff7fbbcc8:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fbbccc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbbcd0:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbbcd4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbbcd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbcdc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbbce0:	17ffffde	b	0xfffff7fbbc58
   0x0000fffff7fbbce4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbbce8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbbcec:	aa1303e1	mov	x1, x19
   0x0000fffff7fbbcf0:	aa1503e2	mov	x2, x21
   0x0000fffff7fbbcf4:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fbbcf8:	aa1403e4	mov	x4, x20
   0x0000fffff7fbbcfc:	aa1603e5	mov	x5, x22
   0x0000fffff7fbbd00:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fbbd04:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbbd08:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbbd0c:	d63f0200	blr	x16
   0x0000fffff7fbbd10:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbbd14:	540016a0	b.eq	0xfffff7fbbfe8  // b.none
   0x0000fffff7fbbd18:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbbd1c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbbd20:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbbd24:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbbd28:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbbd2c:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbbd30:	36d801d1	tbz	w17, #27, 0xfffff7fbbd68
   0x0000fffff7fbbd34:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbbd38:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbbd3c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbbd40:	54000281	b.ne	0xfffff7fbbd90  // b.any
   0x0000fffff7fbbd44:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbbd48:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbbd4c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbbd50:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbbd54:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbbd58:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbbd5c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbbd60:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbbd64:	54000169	b.ls	0xfffff7fbbd90  // b.plast
   0x0000fffff7fbbd68:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbbd6c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbbd70:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbbd74:	36d80091	tbz	w17, #27, 0xfffff7fbbd84
   0x0000fffff7fbbd78:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbbd7c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbbd80:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbbd84:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbbd88:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbbd8c:	1400000e	b	0xfffff7fbbdc4
   0x0000fffff7fbbd90:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbbd94:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbbd98:	aa1303e1	mov	x1, x19
   0x0000fffff7fbbd9c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbbda0:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fbbda4:	aa1403e4	mov	x4, x20
   0x0000fffff7fbbda8:	aa1603e5	mov	x5, x22
   0x0000fffff7fbbdac:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fbbdb0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbbdb4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbbdb8:	d63f0200	blr	x16
   0x0000fffff7fbbdbc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbbdc0:	54001180	b.eq	0xfffff7fbbff0  // b.none
   0x0000fffff7fbbdc4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbbdc8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbbdcc:	540003a0	b.eq	0xfffff7fbbe40  // b.none
   0x0000fffff7fbbdd0:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbbdd4:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbbdd8:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbbddc:	36d801d1	tbz	w17, #27, 0xfffff7fbbe14
   0x0000fffff7fbbde0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbbde4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbbde8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbbdec:	540002a1	b.ne	0xfffff7fbbe40  // b.any
   0x0000fffff7fbbdf0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbbdf4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbbdf8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbbdfc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbbe00:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbbe04:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbbe08:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbbe0c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbbe10:	54000189	b.ls	0xfffff7fbbe40  // b.plast
   0x0000fffff7fbbe14:	36d8008d	tbz	w13, #27, 0xfffff7fbbe24
   0x0000fffff7fbbe18:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbbe1c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbbe20:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbbe24:	36d80091	tbz	w17, #27, 0xfffff7fbbe34
   0x0000fffff7fbbe28:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbbe2c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbbe30:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbbe34:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbbe38:	b900016d	str	w13, [x11]
   0x0000fffff7fbbe3c:	1400000e	b	0xfffff7fbbe74
   0x0000fffff7fbbe40:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbbe44:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbbe48:	aa1303e1	mov	x1, x19
   0x0000fffff7fbbe4c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbbe50:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fbbe54:	aa1403e4	mov	x4, x20
   0x0000fffff7fbbe58:	aa1603e5	mov	x5, x22
   0x0000fffff7fbbe5c:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fbbe60:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbbe64:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbbe68:	d63f0200	blr	x16
   0x0000fffff7fbbe6c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbbe70:	54000c40	b.eq	0xfffff7fbbff8  // b.none
   0x0000fffff7fbbe74:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbbe78:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbbe7c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbbe80:	aa1503e2	mov	x2, x21
   0x0000fffff7fbbe84:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fbbe88:	aa1403e4	mov	x4, x20
   0x0000fffff7fbbe8c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbbe90:	d286ae90	mov	x16, #0x3574                	// #13684
   0x0000fffff7fbbe94:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbbe98:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbbe9c:	d63f0200	blr	x16
   0x0000fffff7fbbea0:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fbbea4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fbbea8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fbbeac:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fbbeb0:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fbbeb4:	d65f03c0	ret
   0x0000fffff7fbbeb8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbbebc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbec0:	b900028a	str	w10, [x20]
   0x0000fffff7fbbec4:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fbbec8:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fbbecc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fbbed0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fbbed4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fbbed8:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fbbedc:	d65f03c0	ret
   0x0000fffff7fbbee0:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fbbee4:	17fffff5	b	0xfffff7fbbeb8
   0x0000fffff7fbbee8:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fbbeec:	17fffff3	b	0xfffff7fbbeb8
   0x0000fffff7fbbef0:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fbbef4:	17fffff1	b	0xfffff7fbbeb8
   0x0000fffff7fbbef8:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fbbefc:	17ffffef	b	0xfffff7fbbeb8
   0x0000fffff7fbbf00:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fbbf04:	17ffffed	b	0xfffff7fbbeb8
   0x0000fffff7fbbf08:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fbbf0c:	17ffffeb	b	0xfffff7fbbeb8
   0x0000fffff7fbbf10:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fbbf14:	17ffffe9	b	0xfffff7fbbeb8
   0x0000fffff7fbbf18:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fbbf1c:	17ffffe7	b	0xfffff7fbbeb8
   0x0000fffff7fbbf20:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fbbf24:	17ffffe5	b	0xfffff7fbbeb8
   0x0000fffff7fbbf28:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fbbf2c:	17ffffe3	b	0xfffff7fbbeb8
   0x0000fffff7fbbf30:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fbbf34:	17ffffe1	b	0xfffff7fbbeb8
   0x0000fffff7fbbf38:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fbbf3c:	17ffffdf	b	0xfffff7fbbeb8
   0x0000fffff7fbbf40:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fbbf44:	17ffffdd	b	0xfffff7fbbeb8
   0x0000fffff7fbbf48:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fbbf4c:	17ffffdb	b	0xfffff7fbbeb8
   0x0000fffff7fbbf50:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fbbf54:	17ffffd9	b	0xfffff7fbbeb8
   0x0000fffff7fbbf58:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fbbf5c:	17ffffd7	b	0xfffff7fbbeb8
   0x0000fffff7fbbf60:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fbbf64:	17ffffd5	b	0xfffff7fbbeb8
   0x0000fffff7fbbf68:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fbbf6c:	17ffffd3	b	0xfffff7fbbeb8
   0x0000fffff7fbbf70:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fbbf74:	17ffffd1	b	0xfffff7fbbeb8
   0x0000fffff7fbbf78:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fbbf7c:	17ffffcf	b	0xfffff7fbbeb8
   0x0000fffff7fbbf80:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fbbf84:	17ffffcd	b	0xfffff7fbbeb8
   0x0000fffff7fbbf88:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fbbf8c:	17ffffcb	b	0xfffff7fbbeb8
   0x0000fffff7fbbf90:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fbbf94:	17ffffc9	b	0xfffff7fbbeb8
   0x0000fffff7fbbf98:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fbbf9c:	17ffffc7	b	0xfffff7fbbeb8
   0x0000fffff7fbbfa0:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fbbfa4:	17ffffc5	b	0xfffff7fbbeb8
   0x0000fffff7fbbfa8:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fbbfac:	17ffffc3	b	0xfffff7fbbeb8
   0x0000fffff7fbbfb0:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fbbfb4:	17ffffc1	b	0xfffff7fbbeb8
   0x0000fffff7fbbfb8:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fbbfbc:	17ffffbf	b	0xfffff7fbbeb8
   0x0000fffff7fbbfc0:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fbbfc4:	17ffffbd	b	0xfffff7fbbeb8
   0x0000fffff7fbbfc8:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fbbfcc:	17ffffbb	b	0xfffff7fbbeb8
   0x0000fffff7fbbfd0:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fbbfd4:	17ffffb9	b	0xfffff7fbbeb8
   0x0000fffff7fbbfd8:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fbbfdc:	17ffffb7	b	0xfffff7fbbeb8
   0x0000fffff7fbbfe0:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fbbfe4:	17ffffb5	b	0xfffff7fbbeb8
   0x0000fffff7fbbfe8:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fbbfec:	17ffffb3	b	0xfffff7fbbeb8
   0x0000fffff7fbbff0:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fbbff4:	17ffffb1	b	0xfffff7fbbeb8
   0x0000fffff7fbbff8:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fbbffc:	17ffffaf	b	0xfffff7fbbeb8
End of assembler dump.
