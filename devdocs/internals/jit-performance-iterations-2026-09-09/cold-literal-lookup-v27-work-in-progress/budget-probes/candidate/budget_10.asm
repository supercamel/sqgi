Dump of assembler code from 0xfffff7fad000 to 0xfffff7faf000:
   0x0000fffff7fad000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fad004:	910003fd	mov	x29, sp
   0x0000fffff7fad008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fad00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fad010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fad014:	aa0003f3	mov	x19, x0
   0x0000fffff7fad018:	aa0103f4	mov	x20, x1
   0x0000fffff7fad01c:	aa0203f5	mov	x21, x2
   0x0000fffff7fad020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fad024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fad028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fad02c:	f90003e9	str	x9, [sp]
   0x0000fffff7fad030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fad034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fad038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fad03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fad040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad044:	d63f0200	blr	x16
   0x0000fffff7fad048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fad04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fad050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fad054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fad058:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fad05c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fad060:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fad064:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fad068:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fad06c:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7fad070:	36d801d1	tbz	w17, #27, 0xfffff7fad0a8
   0x0000fffff7fad074:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fad078:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fad07c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fad080:	54000281	b.ne	0xfffff7fad0d0  // b.any
   0x0000fffff7fad084:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7fad088:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad08c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fad090:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fad094:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fad098:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fad09c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fad0a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fad0a4:	54000169	b.ls	0xfffff7fad0d0  // b.plast
   0x0000fffff7fad0a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fad0ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fad0b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fad0b4:	36d80091	tbz	w17, #27, 0xfffff7fad0c4
   0x0000fffff7fad0b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad0bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fad0c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fad0c4:	f900166c	str	x12, [x19, #40]
   0x0000fffff7fad0c8:	b900226d	str	w13, [x19, #32]
   0x0000fffff7fad0cc:	1400000e	b	0xfffff7fad104
   0x0000fffff7fad0d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad0d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad0d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fad0dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fad0e0:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fad0e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fad0e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fad0ec:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fad0f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad0f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad0f8:	d63f0200	blr	x16
   0x0000fffff7fad0fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad100:	5400e400	b.eq	0xfffff7faed80  // b.none
   0x0000fffff7fad104:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fad108:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fad10c:	d280002c	mov	x12, #0x1                   	// #1
   0x0000fffff7fad110:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fad114:	36d80211	tbz	w17, #27, 0xfffff7fad154
   0x0000fffff7fad118:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fad11c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fad120:	f100013f	cmp	x9, #0x0
   0x0000fffff7fad124:	540001e1	b.ne	0xfffff7fad160  // b.any
   0x0000fffff7fad128:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fad12c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad130:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fad134:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fad138:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fad13c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fad140:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fad144:	f100055f	cmp	x10, #0x1
   0x0000fffff7fad148:	540000c9	b.ls	0xfffff7fad160  // b.plast
   0x0000fffff7fad14c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fad150:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fad154:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fad158:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fad15c:	1400000e	b	0xfffff7fad194
   0x0000fffff7fad160:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad164:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad168:	aa1303e1	mov	x1, x19
   0x0000fffff7fad16c:	aa1503e2	mov	x2, x21
   0x0000fffff7fad170:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fad174:	aa1403e4	mov	x4, x20
   0x0000fffff7fad178:	aa1603e5	mov	x5, x22
   0x0000fffff7fad17c:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7fad180:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fad184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad188:	d63f0200	blr	x16
   0x0000fffff7fad18c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad190:	5400dfc0	b.eq	0xfffff7faed88  // b.none
   0x0000fffff7fad194:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fad198:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad19c:	aa1303e1	mov	x1, x19
   0x0000fffff7fad1a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fad1a4:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fad1a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fad1ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fad1b0:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fad1b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad1b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad1bc:	d63f0200	blr	x16
   0x0000fffff7fad1c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad1c4:	5400de60	b.eq	0xfffff7faed90  // b.none
   0x0000fffff7fad1c8:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fad1cc:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fad1d0:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fad1d4:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7fad1d8:	36d80211	tbz	w17, #27, 0xfffff7fad218
   0x0000fffff7fad1dc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fad1e0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fad1e4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fad1e8:	540001e1	b.ne	0xfffff7fad224  // b.any
   0x0000fffff7fad1ec:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7fad1f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad1f4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fad1f8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fad1fc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fad200:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fad204:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fad208:	f100055f	cmp	x10, #0x1
   0x0000fffff7fad20c:	540000c9	b.ls	0xfffff7fad224  // b.plast
   0x0000fffff7fad210:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fad214:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fad218:	f900166c	str	x12, [x19, #40]
   0x0000fffff7fad21c:	b900226d	str	w13, [x19, #32]
   0x0000fffff7fad220:	1400000e	b	0xfffff7fad258
   0x0000fffff7fad224:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad228:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad22c:	aa1303e1	mov	x1, x19
   0x0000fffff7fad230:	aa1503e2	mov	x2, x21
   0x0000fffff7fad234:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7fad238:	aa1403e4	mov	x4, x20
   0x0000fffff7fad23c:	aa1603e5	mov	x5, x22
   0x0000fffff7fad240:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7fad244:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fad248:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad24c:	d63f0200	blr	x16
   0x0000fffff7fad250:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad254:	5400da20	b.eq	0xfffff7faed98  // b.none
   0x0000fffff7fad258:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fad25c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad260:	aa1303e1	mov	x1, x19
   0x0000fffff7fad264:	aa1503e2	mov	x2, x21
   0x0000fffff7fad268:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7fad26c:	aa1403e4	mov	x4, x20
   0x0000fffff7fad270:	aa1603e5	mov	x5, x22
   0x0000fffff7fad274:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fad278:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fad27c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad280:	d63f0200	blr	x16
   0x0000fffff7fad284:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad288:	5400d8c0	b.eq	0xfffff7faeda0  // b.none
   0x0000fffff7fad28c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fad290:	37d806a9	tbnz	w9, #27, 0xfffff7fad364
   0x0000fffff7fad294:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fad298:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad29c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad2a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad2a4:	540001c1	b.ne	0xfffff7fad2dc  // b.any
   0x0000fffff7fad2a8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad2ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad2b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad2b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad2b8:	54000121	b.ne	0xfffff7fad2dc  // b.any
   0x0000fffff7fad2bc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fad2c0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fad2c4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fad2c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad2cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad2d0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fad2d4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fad2d8:	14000030	b	0xfffff7fad398
   0x0000fffff7fad2dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fad2e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad2e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad2e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad2ec:	54000120	b.eq	0xfffff7fad310  // b.none
   0x0000fffff7fad2f0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fad2f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad2f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad2fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad300:	54000321	b.ne	0xfffff7fad364  // b.any
   0x0000fffff7fad304:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fad308:	9e620120	scvtf	d0, x9
   0x0000fffff7fad30c:	14000002	b	0xfffff7fad314
   0x0000fffff7fad310:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fad314:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad318:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad31c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad320:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad324:	54000120	b.eq	0xfffff7fad348  // b.none
   0x0000fffff7fad328:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad32c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad330:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad334:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad338:	54000161	b.ne	0xfffff7fad364  // b.any
   0x0000fffff7fad33c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fad340:	9e620121	scvtf	d1, x9
   0x0000fffff7fad344:	14000002	b	0xfffff7fad34c
   0x0000fffff7fad348:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fad34c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fad350:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fad354:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad358:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad35c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fad360:	17ffffde	b	0xfffff7fad2d8
   0x0000fffff7fad364:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad368:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad36c:	aa1303e1	mov	x1, x19
   0x0000fffff7fad370:	aa1503e2	mov	x2, x21
   0x0000fffff7fad374:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fad378:	aa1403e4	mov	x4, x20
   0x0000fffff7fad37c:	aa1603e5	mov	x5, x22
   0x0000fffff7fad380:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fad384:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad388:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad38c:	d63f0200	blr	x16
   0x0000fffff7fad390:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad394:	5400d0a0	b.eq	0xfffff7faeda8  // b.none
   0x0000fffff7fad398:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fad39c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fad3a0:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fad3a4:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fad3a8:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fad3ac:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fad3b0:	36d801d1	tbz	w17, #27, 0xfffff7fad3e8
   0x0000fffff7fad3b4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fad3b8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fad3bc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fad3c0:	54000281	b.ne	0xfffff7fad410  // b.any
   0x0000fffff7fad3c4:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fad3c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad3cc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fad3d0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fad3d4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fad3d8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fad3dc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fad3e0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fad3e4:	54000169	b.ls	0xfffff7fad410  // b.plast
   0x0000fffff7fad3e8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fad3ec:	91000529	add	x9, x9, #0x1
   0x0000fffff7fad3f0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fad3f4:	36d80091	tbz	w17, #27, 0xfffff7fad404
   0x0000fffff7fad3f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad3fc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fad400:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fad404:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fad408:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fad40c:	1400000e	b	0xfffff7fad444
   0x0000fffff7fad410:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad414:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad418:	aa1303e1	mov	x1, x19
   0x0000fffff7fad41c:	aa1503e2	mov	x2, x21
   0x0000fffff7fad420:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fad424:	aa1403e4	mov	x4, x20
   0x0000fffff7fad428:	aa1603e5	mov	x5, x22
   0x0000fffff7fad42c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fad430:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad434:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad438:	d63f0200	blr	x16
   0x0000fffff7fad43c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad440:	5400cb80	b.eq	0xfffff7faedb0  // b.none
   0x0000fffff7fad444:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fad448:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad44c:	aa1303e1	mov	x1, x19
   0x0000fffff7fad450:	aa1503e2	mov	x2, x21
   0x0000fffff7fad454:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fad458:	aa1403e4	mov	x4, x20
   0x0000fffff7fad45c:	aa1603e5	mov	x5, x22
   0x0000fffff7fad460:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fad464:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad468:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad46c:	d63f0200	blr	x16
   0x0000fffff7fad470:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad474:	5400ca20	b.eq	0xfffff7faedb8  // b.none
   0x0000fffff7fad478:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fad47c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fad480:	540004a0	b.eq	0xfffff7fad514  // b.none
   0x0000fffff7fad484:	b940016d	ldr	w13, [x11]
   0x0000fffff7fad488:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fad48c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fad490:	eb0901bf	cmp	x13, x9
   0x0000fffff7fad494:	54000400	b.eq	0xfffff7fad514  // b.none
   0x0000fffff7fad498:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fad49c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fad4a0:	36d801d1	tbz	w17, #27, 0xfffff7fad4d8
   0x0000fffff7fad4a4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fad4a8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fad4ac:	f100013f	cmp	x9, #0x0
   0x0000fffff7fad4b0:	54000321	b.ne	0xfffff7fad514  // b.any
   0x0000fffff7fad4b4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fad4b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad4bc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fad4c0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fad4c4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fad4c8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fad4cc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fad4d0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fad4d4:	54000209	b.ls	0xfffff7fad514  // b.plast
   0x0000fffff7fad4d8:	36d8008d	tbz	w13, #27, 0xfffff7fad4e8
   0x0000fffff7fad4dc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fad4e0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fad4e4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fad4e8:	36d80091	tbz	w17, #27, 0xfffff7fad4f8
   0x0000fffff7fad4ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad4f0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fad4f4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fad4f8:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fad4fc:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fad500:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fad504:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fad508:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fad50c:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fad510:	1400000e	b	0xfffff7fad548
   0x0000fffff7fad514:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fad518:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad51c:	aa1303e1	mov	x1, x19
   0x0000fffff7fad520:	aa1503e2	mov	x2, x21
   0x0000fffff7fad524:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fad528:	aa1403e4	mov	x4, x20
   0x0000fffff7fad52c:	aa1603e5	mov	x5, x22
   0x0000fffff7fad530:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fad534:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fad538:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad53c:	d63f0200	blr	x16
   0x0000fffff7fad540:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad544:	5400c3e0	b.eq	0xfffff7faedc0  // b.none
   0x0000fffff7fad548:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fad54c:	37d806a9	tbnz	w9, #27, 0xfffff7fad620
   0x0000fffff7fad550:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fad554:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad558:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad55c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad560:	540001c1	b.ne	0xfffff7fad598  // b.any
   0x0000fffff7fad564:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad568:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad56c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad570:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad574:	54000121	b.ne	0xfffff7fad598  // b.any
   0x0000fffff7fad578:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fad57c:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fad580:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fad584:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad588:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad58c:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fad590:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fad594:	14000030	b	0xfffff7fad654
   0x0000fffff7fad598:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fad59c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad5a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad5a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad5a8:	54000120	b.eq	0xfffff7fad5cc  // b.none
   0x0000fffff7fad5ac:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fad5b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad5b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad5b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad5bc:	54000321	b.ne	0xfffff7fad620  // b.any
   0x0000fffff7fad5c0:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fad5c4:	9e620120	scvtf	d0, x9
   0x0000fffff7fad5c8:	14000002	b	0xfffff7fad5d0
   0x0000fffff7fad5cc:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fad5d0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad5d4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad5d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad5dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad5e0:	54000120	b.eq	0xfffff7fad604  // b.none
   0x0000fffff7fad5e4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad5e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad5ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad5f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad5f4:	54000161	b.ne	0xfffff7fad620  // b.any
   0x0000fffff7fad5f8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fad5fc:	9e620121	scvtf	d1, x9
   0x0000fffff7fad600:	14000002	b	0xfffff7fad608
   0x0000fffff7fad604:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fad608:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fad60c:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fad610:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad614:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad618:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fad61c:	17ffffde	b	0xfffff7fad594
   0x0000fffff7fad620:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad624:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad628:	aa1303e1	mov	x1, x19
   0x0000fffff7fad62c:	aa1503e2	mov	x2, x21
   0x0000fffff7fad630:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fad634:	aa1403e4	mov	x4, x20
   0x0000fffff7fad638:	aa1603e5	mov	x5, x22
   0x0000fffff7fad63c:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fad640:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad644:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad648:	d63f0200	blr	x16
   0x0000fffff7fad64c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad650:	5400bbc0	b.eq	0xfffff7faedc8  // b.none
   0x0000fffff7fad654:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fad658:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fad65c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fad660:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fad664:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fad668:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fad66c:	36d801d1	tbz	w17, #27, 0xfffff7fad6a4
   0x0000fffff7fad670:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fad674:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fad678:	f100013f	cmp	x9, #0x0
   0x0000fffff7fad67c:	54000281	b.ne	0xfffff7fad6cc  // b.any
   0x0000fffff7fad680:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fad684:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad688:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fad68c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fad690:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fad694:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fad698:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fad69c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fad6a0:	54000169	b.ls	0xfffff7fad6cc  // b.plast
   0x0000fffff7fad6a4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fad6a8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fad6ac:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fad6b0:	36d80091	tbz	w17, #27, 0xfffff7fad6c0
   0x0000fffff7fad6b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad6b8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fad6bc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fad6c0:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fad6c4:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fad6c8:	1400000e	b	0xfffff7fad700
   0x0000fffff7fad6cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad6d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad6d4:	aa1303e1	mov	x1, x19
   0x0000fffff7fad6d8:	aa1503e2	mov	x2, x21
   0x0000fffff7fad6dc:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fad6e0:	aa1403e4	mov	x4, x20
   0x0000fffff7fad6e4:	aa1603e5	mov	x5, x22
   0x0000fffff7fad6e8:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fad6ec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad6f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad6f4:	d63f0200	blr	x16
   0x0000fffff7fad6f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad6fc:	5400b6a0	b.eq	0xfffff7faedd0  // b.none
   0x0000fffff7fad700:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fad704:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad708:	aa1303e1	mov	x1, x19
   0x0000fffff7fad70c:	aa1503e2	mov	x2, x21
   0x0000fffff7fad710:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fad714:	aa1403e4	mov	x4, x20
   0x0000fffff7fad718:	aa1603e5	mov	x5, x22
   0x0000fffff7fad71c:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fad720:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad724:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad728:	d63f0200	blr	x16
   0x0000fffff7fad72c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad730:	5400b540	b.eq	0xfffff7faedd8  // b.none
   0x0000fffff7fad734:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fad738:	f100017f	cmp	x11, #0x0
   0x0000fffff7fad73c:	540004a0	b.eq	0xfffff7fad7d0  // b.none
   0x0000fffff7fad740:	b940016d	ldr	w13, [x11]
   0x0000fffff7fad744:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fad748:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fad74c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fad750:	54000400	b.eq	0xfffff7fad7d0  // b.none
   0x0000fffff7fad754:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fad758:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fad75c:	36d801d1	tbz	w17, #27, 0xfffff7fad794
   0x0000fffff7fad760:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fad764:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fad768:	f100013f	cmp	x9, #0x0
   0x0000fffff7fad76c:	54000321	b.ne	0xfffff7fad7d0  // b.any
   0x0000fffff7fad770:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fad774:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad778:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fad77c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fad780:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fad784:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fad788:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fad78c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fad790:	54000209	b.ls	0xfffff7fad7d0  // b.plast
   0x0000fffff7fad794:	36d8008d	tbz	w13, #27, 0xfffff7fad7a4
   0x0000fffff7fad798:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fad79c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fad7a0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fad7a4:	36d80091	tbz	w17, #27, 0xfffff7fad7b4
   0x0000fffff7fad7a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad7ac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fad7b0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fad7b4:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fad7b8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fad7bc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fad7c0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fad7c4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fad7c8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fad7cc:	1400000e	b	0xfffff7fad804
   0x0000fffff7fad7d0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fad7d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad7d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fad7dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fad7e0:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fad7e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fad7e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fad7ec:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fad7f0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fad7f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad7f8:	d63f0200	blr	x16
   0x0000fffff7fad7fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad800:	5400af00	b.eq	0xfffff7faede0  // b.none
   0x0000fffff7fad804:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fad808:	37d806a9	tbnz	w9, #27, 0xfffff7fad8dc
   0x0000fffff7fad80c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fad810:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad814:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad818:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad81c:	540001c1	b.ne	0xfffff7fad854  // b.any
   0x0000fffff7fad820:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad824:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad828:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad82c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad830:	54000121	b.ne	0xfffff7fad854  // b.any
   0x0000fffff7fad834:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fad838:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fad83c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fad840:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad844:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad848:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fad84c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fad850:	14000030	b	0xfffff7fad910
   0x0000fffff7fad854:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fad858:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad85c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad860:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad864:	54000120	b.eq	0xfffff7fad888  // b.none
   0x0000fffff7fad868:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fad86c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad870:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad874:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad878:	54000321	b.ne	0xfffff7fad8dc  // b.any
   0x0000fffff7fad87c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fad880:	9e620120	scvtf	d0, x9
   0x0000fffff7fad884:	14000002	b	0xfffff7fad88c
   0x0000fffff7fad888:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fad88c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad890:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad894:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad898:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad89c:	54000120	b.eq	0xfffff7fad8c0  // b.none
   0x0000fffff7fad8a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad8a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad8a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad8ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad8b0:	54000161	b.ne	0xfffff7fad8dc  // b.any
   0x0000fffff7fad8b4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fad8b8:	9e620121	scvtf	d1, x9
   0x0000fffff7fad8bc:	14000002	b	0xfffff7fad8c4
   0x0000fffff7fad8c0:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fad8c4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fad8c8:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fad8cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad8d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad8d4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fad8d8:	17ffffde	b	0xfffff7fad850
   0x0000fffff7fad8dc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad8e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad8e4:	aa1303e1	mov	x1, x19
   0x0000fffff7fad8e8:	aa1503e2	mov	x2, x21
   0x0000fffff7fad8ec:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fad8f0:	aa1403e4	mov	x4, x20
   0x0000fffff7fad8f4:	aa1603e5	mov	x5, x22
   0x0000fffff7fad8f8:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fad8fc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad900:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad904:	d63f0200	blr	x16
   0x0000fffff7fad908:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad90c:	5400a6e0	b.eq	0xfffff7faede8  // b.none
   0x0000fffff7fad910:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fad914:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fad918:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fad91c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fad920:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fad924:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fad928:	36d801d1	tbz	w17, #27, 0xfffff7fad960
   0x0000fffff7fad92c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fad930:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fad934:	f100013f	cmp	x9, #0x0
   0x0000fffff7fad938:	54000281	b.ne	0xfffff7fad988  // b.any
   0x0000fffff7fad93c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fad940:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad944:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fad948:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fad94c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fad950:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fad954:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fad958:	f100055f	cmp	x10, #0x1
   0x0000fffff7fad95c:	54000169	b.ls	0xfffff7fad988  // b.plast
   0x0000fffff7fad960:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fad964:	91000529	add	x9, x9, #0x1
   0x0000fffff7fad968:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fad96c:	36d80091	tbz	w17, #27, 0xfffff7fad97c
   0x0000fffff7fad970:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad974:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fad978:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fad97c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fad980:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fad984:	1400000e	b	0xfffff7fad9bc
   0x0000fffff7fad988:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad98c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad990:	aa1303e1	mov	x1, x19
   0x0000fffff7fad994:	aa1503e2	mov	x2, x21
   0x0000fffff7fad998:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fad99c:	aa1403e4	mov	x4, x20
   0x0000fffff7fad9a0:	aa1603e5	mov	x5, x22
   0x0000fffff7fad9a4:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fad9a8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad9ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad9b0:	d63f0200	blr	x16
   0x0000fffff7fad9b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad9b8:	5400a1c0	b.eq	0xfffff7faedf0  // b.none
   0x0000fffff7fad9bc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fad9c0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad9c4:	aa1303e1	mov	x1, x19
   0x0000fffff7fad9c8:	aa1503e2	mov	x2, x21
   0x0000fffff7fad9cc:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fad9d0:	aa1403e4	mov	x4, x20
   0x0000fffff7fad9d4:	aa1603e5	mov	x5, x22
   0x0000fffff7fad9d8:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fad9dc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad9e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad9e4:	d63f0200	blr	x16
   0x0000fffff7fad9e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad9ec:	5400a060	b.eq	0xfffff7faedf8  // b.none
   0x0000fffff7fad9f0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fad9f4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fad9f8:	540004a0	b.eq	0xfffff7fada8c  // b.none
   0x0000fffff7fad9fc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fada00:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fada04:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fada08:	eb0901bf	cmp	x13, x9
   0x0000fffff7fada0c:	54000400	b.eq	0xfffff7fada8c  // b.none
   0x0000fffff7fada10:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fada14:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fada18:	36d801d1	tbz	w17, #27, 0xfffff7fada50
   0x0000fffff7fada1c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fada20:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fada24:	f100013f	cmp	x9, #0x0
   0x0000fffff7fada28:	54000321	b.ne	0xfffff7fada8c  // b.any
   0x0000fffff7fada2c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fada30:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fada34:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fada38:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fada3c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fada40:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fada44:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fada48:	f100055f	cmp	x10, #0x1
   0x0000fffff7fada4c:	54000209	b.ls	0xfffff7fada8c  // b.plast
   0x0000fffff7fada50:	36d8008d	tbz	w13, #27, 0xfffff7fada60
   0x0000fffff7fada54:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fada58:	91000529	add	x9, x9, #0x1
   0x0000fffff7fada5c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fada60:	36d80091	tbz	w17, #27, 0xfffff7fada70
   0x0000fffff7fada64:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fada68:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fada6c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fada70:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fada74:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fada78:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fada7c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fada80:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fada84:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fada88:	1400000e	b	0xfffff7fadac0
   0x0000fffff7fada8c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fada90:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fada94:	aa1303e1	mov	x1, x19
   0x0000fffff7fada98:	aa1503e2	mov	x2, x21
   0x0000fffff7fada9c:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fadaa0:	aa1403e4	mov	x4, x20
   0x0000fffff7fadaa4:	aa1603e5	mov	x5, x22
   0x0000fffff7fadaa8:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fadaac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fadab0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fadab4:	d63f0200	blr	x16
   0x0000fffff7fadab8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fadabc:	54009a20	b.eq	0xfffff7faee00  // b.none
   0x0000fffff7fadac0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fadac4:	37d806a9	tbnz	w9, #27, 0xfffff7fadb98
   0x0000fffff7fadac8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fadacc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fadad0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fadad4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fadad8:	540001c1	b.ne	0xfffff7fadb10  // b.any
   0x0000fffff7fadadc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fadae0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fadae4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fadae8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fadaec:	54000121	b.ne	0xfffff7fadb10  // b.any
   0x0000fffff7fadaf0:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fadaf4:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fadaf8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fadafc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fadb00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fadb04:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fadb08:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fadb0c:	14000030	b	0xfffff7fadbcc
   0x0000fffff7fadb10:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fadb14:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fadb18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fadb1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fadb20:	54000120	b.eq	0xfffff7fadb44  // b.none
   0x0000fffff7fadb24:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fadb28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fadb2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fadb30:	eb0a013f	cmp	x9, x10
   0x0000fffff7fadb34:	54000321	b.ne	0xfffff7fadb98  // b.any
   0x0000fffff7fadb38:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fadb3c:	9e620120	scvtf	d0, x9
   0x0000fffff7fadb40:	14000002	b	0xfffff7fadb48
   0x0000fffff7fadb44:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fadb48:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fadb4c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fadb50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fadb54:	eb0a013f	cmp	x9, x10
   0x0000fffff7fadb58:	54000120	b.eq	0xfffff7fadb7c  // b.none
   0x0000fffff7fadb5c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fadb60:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fadb64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fadb68:	eb0a013f	cmp	x9, x10
   0x0000fffff7fadb6c:	54000161	b.ne	0xfffff7fadb98  // b.any
   0x0000fffff7fadb70:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fadb74:	9e620121	scvtf	d1, x9
   0x0000fffff7fadb78:	14000002	b	0xfffff7fadb80
   0x0000fffff7fadb7c:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fadb80:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fadb84:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fadb88:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fadb8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fadb90:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fadb94:	17ffffde	b	0xfffff7fadb0c
   0x0000fffff7fadb98:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fadb9c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fadba0:	aa1303e1	mov	x1, x19
   0x0000fffff7fadba4:	aa1503e2	mov	x2, x21
   0x0000fffff7fadba8:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fadbac:	aa1403e4	mov	x4, x20
   0x0000fffff7fadbb0:	aa1603e5	mov	x5, x22
   0x0000fffff7fadbb4:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fadbb8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fadbbc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fadbc0:	d63f0200	blr	x16
   0x0000fffff7fadbc4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fadbc8:	54009200	b.eq	0xfffff7faee08  // b.none
   0x0000fffff7fadbcc:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fadbd0:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fadbd4:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fadbd8:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fadbdc:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fadbe0:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fadbe4:	36d801d1	tbz	w17, #27, 0xfffff7fadc1c
   0x0000fffff7fadbe8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fadbec:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fadbf0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fadbf4:	54000281	b.ne	0xfffff7fadc44  // b.any
   0x0000fffff7fadbf8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fadbfc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fadc00:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fadc04:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fadc08:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fadc0c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fadc10:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fadc14:	f100055f	cmp	x10, #0x1
   0x0000fffff7fadc18:	54000169	b.ls	0xfffff7fadc44  // b.plast
   0x0000fffff7fadc1c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fadc20:	91000529	add	x9, x9, #0x1
   0x0000fffff7fadc24:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fadc28:	36d80091	tbz	w17, #27, 0xfffff7fadc38
   0x0000fffff7fadc2c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fadc30:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fadc34:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fadc38:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fadc3c:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fadc40:	1400000e	b	0xfffff7fadc78
   0x0000fffff7fadc44:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fadc48:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fadc4c:	aa1303e1	mov	x1, x19
   0x0000fffff7fadc50:	aa1503e2	mov	x2, x21
   0x0000fffff7fadc54:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fadc58:	aa1403e4	mov	x4, x20
   0x0000fffff7fadc5c:	aa1603e5	mov	x5, x22
   0x0000fffff7fadc60:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fadc64:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fadc68:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fadc6c:	d63f0200	blr	x16
   0x0000fffff7fadc70:	f100001f	cmp	x0, #0x0
   0x0000fffff7fadc74:	54008ce0	b.eq	0xfffff7faee10  // b.none
   0x0000fffff7fadc78:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fadc7c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fadc80:	aa1303e1	mov	x1, x19
   0x0000fffff7fadc84:	aa1503e2	mov	x2, x21
   0x0000fffff7fadc88:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fadc8c:	aa1403e4	mov	x4, x20
   0x0000fffff7fadc90:	aa1603e5	mov	x5, x22
   0x0000fffff7fadc94:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fadc98:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fadc9c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fadca0:	d63f0200	blr	x16
   0x0000fffff7fadca4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fadca8:	54008b80	b.eq	0xfffff7faee18  // b.none
   0x0000fffff7fadcac:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fadcb0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fadcb4:	540004a0	b.eq	0xfffff7fadd48  // b.none
   0x0000fffff7fadcb8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fadcbc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fadcc0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fadcc4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fadcc8:	54000400	b.eq	0xfffff7fadd48  // b.none
   0x0000fffff7fadccc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fadcd0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fadcd4:	36d801d1	tbz	w17, #27, 0xfffff7fadd0c
   0x0000fffff7fadcd8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fadcdc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fadce0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fadce4:	54000321	b.ne	0xfffff7fadd48  // b.any
   0x0000fffff7fadce8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fadcec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fadcf0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fadcf4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fadcf8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fadcfc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fadd00:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fadd04:	f100055f	cmp	x10, #0x1
   0x0000fffff7fadd08:	54000209	b.ls	0xfffff7fadd48  // b.plast
   0x0000fffff7fadd0c:	36d8008d	tbz	w13, #27, 0xfffff7fadd1c
   0x0000fffff7fadd10:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fadd14:	91000529	add	x9, x9, #0x1
   0x0000fffff7fadd18:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fadd1c:	36d80091	tbz	w17, #27, 0xfffff7fadd2c
   0x0000fffff7fadd20:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fadd24:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fadd28:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fadd2c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fadd30:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fadd34:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fadd38:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fadd3c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fadd40:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fadd44:	1400000e	b	0xfffff7fadd7c
   0x0000fffff7fadd48:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fadd4c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fadd50:	aa1303e1	mov	x1, x19
   0x0000fffff7fadd54:	aa1503e2	mov	x2, x21
   0x0000fffff7fadd58:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fadd5c:	aa1403e4	mov	x4, x20
   0x0000fffff7fadd60:	aa1603e5	mov	x5, x22
   0x0000fffff7fadd64:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fadd68:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fadd6c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fadd70:	d63f0200	blr	x16
   0x0000fffff7fadd74:	f100001f	cmp	x0, #0x0
   0x0000fffff7fadd78:	54008540	b.eq	0xfffff7faee20  // b.none
   0x0000fffff7fadd7c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fadd80:	37d806a9	tbnz	w9, #27, 0xfffff7fade54
   0x0000fffff7fadd84:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fadd88:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fadd8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fadd90:	eb0a013f	cmp	x9, x10
   0x0000fffff7fadd94:	540001c1	b.ne	0xfffff7faddcc  // b.any
   0x0000fffff7fadd98:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fadd9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fadda0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fadda4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fadda8:	54000121	b.ne	0xfffff7faddcc  // b.any
   0x0000fffff7faddac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faddb0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7faddb4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faddb8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faddbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faddc0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7faddc4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faddc8:	14000030	b	0xfffff7fade88
   0x0000fffff7faddcc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faddd0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faddd4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faddd8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fadddc:	54000120	b.eq	0xfffff7fade00  // b.none
   0x0000fffff7fadde0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fadde4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fadde8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faddec:	eb0a013f	cmp	x9, x10
   0x0000fffff7faddf0:	54000321	b.ne	0xfffff7fade54  // b.any
   0x0000fffff7faddf4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faddf8:	9e620120	scvtf	d0, x9
   0x0000fffff7faddfc:	14000002	b	0xfffff7fade04
   0x0000fffff7fade00:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fade04:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fade08:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fade0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fade10:	eb0a013f	cmp	x9, x10
   0x0000fffff7fade14:	54000120	b.eq	0xfffff7fade38  // b.none
   0x0000fffff7fade18:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fade1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fade20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fade24:	eb0a013f	cmp	x9, x10
   0x0000fffff7fade28:	54000161	b.ne	0xfffff7fade54  // b.any
   0x0000fffff7fade2c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fade30:	9e620121	scvtf	d1, x9
   0x0000fffff7fade34:	14000002	b	0xfffff7fade3c
   0x0000fffff7fade38:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fade3c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fade40:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fade44:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fade48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fade4c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fade50:	17ffffde	b	0xfffff7faddc8
   0x0000fffff7fade54:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fade58:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fade5c:	aa1303e1	mov	x1, x19
   0x0000fffff7fade60:	aa1503e2	mov	x2, x21
   0x0000fffff7fade64:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fade68:	aa1403e4	mov	x4, x20
   0x0000fffff7fade6c:	aa1603e5	mov	x5, x22
   0x0000fffff7fade70:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fade74:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fade78:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fade7c:	d63f0200	blr	x16
   0x0000fffff7fade80:	f100001f	cmp	x0, #0x0
   0x0000fffff7fade84:	54007d20	b.eq	0xfffff7faee28  // b.none
   0x0000fffff7fade88:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fade8c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fade90:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fade94:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fade98:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fade9c:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fadea0:	36d801d1	tbz	w17, #27, 0xfffff7faded8
   0x0000fffff7fadea4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fadea8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fadeac:	f100013f	cmp	x9, #0x0
   0x0000fffff7fadeb0:	54000281	b.ne	0xfffff7fadf00  // b.any
   0x0000fffff7fadeb4:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fadeb8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fadebc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fadec0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fadec4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fadec8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fadecc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faded0:	f100055f	cmp	x10, #0x1
   0x0000fffff7faded4:	54000169	b.ls	0xfffff7fadf00  // b.plast
   0x0000fffff7faded8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fadedc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fadee0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fadee4:	36d80091	tbz	w17, #27, 0xfffff7fadef4
   0x0000fffff7fadee8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fadeec:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fadef0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fadef4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fadef8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fadefc:	1400000e	b	0xfffff7fadf34
   0x0000fffff7fadf00:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fadf04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fadf08:	aa1303e1	mov	x1, x19
   0x0000fffff7fadf0c:	aa1503e2	mov	x2, x21
   0x0000fffff7fadf10:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fadf14:	aa1403e4	mov	x4, x20
   0x0000fffff7fadf18:	aa1603e5	mov	x5, x22
   0x0000fffff7fadf1c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fadf20:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fadf24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fadf28:	d63f0200	blr	x16
   0x0000fffff7fadf2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fadf30:	54007800	b.eq	0xfffff7faee30  // b.none
   0x0000fffff7fadf34:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fadf38:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fadf3c:	aa1303e1	mov	x1, x19
   0x0000fffff7fadf40:	aa1503e2	mov	x2, x21
   0x0000fffff7fadf44:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fadf48:	aa1403e4	mov	x4, x20
   0x0000fffff7fadf4c:	aa1603e5	mov	x5, x22
   0x0000fffff7fadf50:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fadf54:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fadf58:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fadf5c:	d63f0200	blr	x16
   0x0000fffff7fadf60:	f100001f	cmp	x0, #0x0
   0x0000fffff7fadf64:	540076a0	b.eq	0xfffff7faee38  // b.none
   0x0000fffff7fadf68:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fadf6c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fadf70:	540004a0	b.eq	0xfffff7fae004  // b.none
   0x0000fffff7fadf74:	b940016d	ldr	w13, [x11]
   0x0000fffff7fadf78:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fadf7c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fadf80:	eb0901bf	cmp	x13, x9
   0x0000fffff7fadf84:	54000400	b.eq	0xfffff7fae004  // b.none
   0x0000fffff7fadf88:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fadf8c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fadf90:	36d801d1	tbz	w17, #27, 0xfffff7fadfc8
   0x0000fffff7fadf94:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fadf98:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fadf9c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fadfa0:	54000321	b.ne	0xfffff7fae004  // b.any
   0x0000fffff7fadfa4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fadfa8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fadfac:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fadfb0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fadfb4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fadfb8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fadfbc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fadfc0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fadfc4:	54000209	b.ls	0xfffff7fae004  // b.plast
   0x0000fffff7fadfc8:	36d8008d	tbz	w13, #27, 0xfffff7fadfd8
   0x0000fffff7fadfcc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fadfd0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fadfd4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fadfd8:	36d80091	tbz	w17, #27, 0xfffff7fadfe8
   0x0000fffff7fadfdc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fadfe0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fadfe4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fadfe8:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fadfec:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fadff0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fadff4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fadff8:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fadffc:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fae000:	1400000e	b	0xfffff7fae038
   0x0000fffff7fae004:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fae008:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae00c:	aa1303e1	mov	x1, x19
   0x0000fffff7fae010:	aa1503e2	mov	x2, x21
   0x0000fffff7fae014:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fae018:	aa1403e4	mov	x4, x20
   0x0000fffff7fae01c:	aa1603e5	mov	x5, x22
   0x0000fffff7fae020:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fae024:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fae028:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae02c:	d63f0200	blr	x16
   0x0000fffff7fae030:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae034:	54007060	b.eq	0xfffff7faee40  // b.none
   0x0000fffff7fae038:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fae03c:	37d806a9	tbnz	w9, #27, 0xfffff7fae110
   0x0000fffff7fae040:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fae044:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae048:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae04c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae050:	540001c1	b.ne	0xfffff7fae088  // b.any
   0x0000fffff7fae054:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae058:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae05c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae060:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae064:	54000121	b.ne	0xfffff7fae088  // b.any
   0x0000fffff7fae068:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fae06c:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fae070:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fae074:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae078:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae07c:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fae080:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fae084:	14000030	b	0xfffff7fae144
   0x0000fffff7fae088:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fae08c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae090:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae094:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae098:	54000120	b.eq	0xfffff7fae0bc  // b.none
   0x0000fffff7fae09c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fae0a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae0a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae0a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae0ac:	54000321	b.ne	0xfffff7fae110  // b.any
   0x0000fffff7fae0b0:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fae0b4:	9e620120	scvtf	d0, x9
   0x0000fffff7fae0b8:	14000002	b	0xfffff7fae0c0
   0x0000fffff7fae0bc:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fae0c0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae0c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae0c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae0cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae0d0:	54000120	b.eq	0xfffff7fae0f4  // b.none
   0x0000fffff7fae0d4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae0d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae0dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae0e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae0e4:	54000161	b.ne	0xfffff7fae110  // b.any
   0x0000fffff7fae0e8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fae0ec:	9e620121	scvtf	d1, x9
   0x0000fffff7fae0f0:	14000002	b	0xfffff7fae0f8
   0x0000fffff7fae0f4:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fae0f8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fae0fc:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fae100:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae104:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae108:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fae10c:	17ffffde	b	0xfffff7fae084
   0x0000fffff7fae110:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae114:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae118:	aa1303e1	mov	x1, x19
   0x0000fffff7fae11c:	aa1503e2	mov	x2, x21
   0x0000fffff7fae120:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fae124:	aa1403e4	mov	x4, x20
   0x0000fffff7fae128:	aa1603e5	mov	x5, x22
   0x0000fffff7fae12c:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fae130:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae134:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae138:	d63f0200	blr	x16
   0x0000fffff7fae13c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae140:	54006840	b.eq	0xfffff7faee48  // b.none
   0x0000fffff7fae144:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fae148:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fae14c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fae150:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fae154:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fae158:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fae15c:	36d801d1	tbz	w17, #27, 0xfffff7fae194
   0x0000fffff7fae160:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae164:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae168:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae16c:	54000281	b.ne	0xfffff7fae1bc  // b.any
   0x0000fffff7fae170:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fae174:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae178:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae17c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae180:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae184:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae188:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae18c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae190:	54000169	b.ls	0xfffff7fae1bc  // b.plast
   0x0000fffff7fae194:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fae198:	91000529	add	x9, x9, #0x1
   0x0000fffff7fae19c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fae1a0:	36d80091	tbz	w17, #27, 0xfffff7fae1b0
   0x0000fffff7fae1a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae1a8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae1ac:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae1b0:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fae1b4:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fae1b8:	1400000e	b	0xfffff7fae1f0
   0x0000fffff7fae1bc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae1c0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae1c4:	aa1303e1	mov	x1, x19
   0x0000fffff7fae1c8:	aa1503e2	mov	x2, x21
   0x0000fffff7fae1cc:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fae1d0:	aa1403e4	mov	x4, x20
   0x0000fffff7fae1d4:	aa1603e5	mov	x5, x22
   0x0000fffff7fae1d8:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fae1dc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae1e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae1e4:	d63f0200	blr	x16
   0x0000fffff7fae1e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae1ec:	54006320	b.eq	0xfffff7faee50  // b.none
   0x0000fffff7fae1f0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fae1f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae1f8:	aa1303e1	mov	x1, x19
   0x0000fffff7fae1fc:	aa1503e2	mov	x2, x21
   0x0000fffff7fae200:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fae204:	aa1403e4	mov	x4, x20
   0x0000fffff7fae208:	aa1603e5	mov	x5, x22
   0x0000fffff7fae20c:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fae210:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae214:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae218:	d63f0200	blr	x16
   0x0000fffff7fae21c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae220:	540061c0	b.eq	0xfffff7faee58  // b.none
   0x0000fffff7fae224:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fae228:	f100017f	cmp	x11, #0x0
   0x0000fffff7fae22c:	540004a0	b.eq	0xfffff7fae2c0  // b.none
   0x0000fffff7fae230:	b940016d	ldr	w13, [x11]
   0x0000fffff7fae234:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fae238:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fae23c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fae240:	54000400	b.eq	0xfffff7fae2c0  // b.none
   0x0000fffff7fae244:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fae248:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fae24c:	36d801d1	tbz	w17, #27, 0xfffff7fae284
   0x0000fffff7fae250:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae254:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae258:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae25c:	54000321	b.ne	0xfffff7fae2c0  // b.any
   0x0000fffff7fae260:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fae264:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae268:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae26c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae270:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae274:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae278:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae27c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae280:	54000209	b.ls	0xfffff7fae2c0  // b.plast
   0x0000fffff7fae284:	36d8008d	tbz	w13, #27, 0xfffff7fae294
   0x0000fffff7fae288:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fae28c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fae290:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fae294:	36d80091	tbz	w17, #27, 0xfffff7fae2a4
   0x0000fffff7fae298:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae29c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae2a0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae2a4:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fae2a8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fae2ac:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fae2b0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fae2b4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fae2b8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fae2bc:	1400000e	b	0xfffff7fae2f4
   0x0000fffff7fae2c0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fae2c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae2c8:	aa1303e1	mov	x1, x19
   0x0000fffff7fae2cc:	aa1503e2	mov	x2, x21
   0x0000fffff7fae2d0:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fae2d4:	aa1403e4	mov	x4, x20
   0x0000fffff7fae2d8:	aa1603e5	mov	x5, x22
   0x0000fffff7fae2dc:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fae2e0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fae2e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae2e8:	d63f0200	blr	x16
   0x0000fffff7fae2ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae2f0:	54005b80	b.eq	0xfffff7faee60  // b.none
   0x0000fffff7fae2f4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fae2f8:	37d806a9	tbnz	w9, #27, 0xfffff7fae3cc
   0x0000fffff7fae2fc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fae300:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae304:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae308:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae30c:	540001c1	b.ne	0xfffff7fae344  // b.any
   0x0000fffff7fae310:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae314:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae318:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae31c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae320:	54000121	b.ne	0xfffff7fae344  // b.any
   0x0000fffff7fae324:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fae328:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fae32c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fae330:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae334:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae338:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fae33c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fae340:	14000030	b	0xfffff7fae400
   0x0000fffff7fae344:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fae348:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae34c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae350:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae354:	54000120	b.eq	0xfffff7fae378  // b.none
   0x0000fffff7fae358:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fae35c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae360:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae364:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae368:	54000321	b.ne	0xfffff7fae3cc  // b.any
   0x0000fffff7fae36c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fae370:	9e620120	scvtf	d0, x9
   0x0000fffff7fae374:	14000002	b	0xfffff7fae37c
   0x0000fffff7fae378:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fae37c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae380:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae384:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae388:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae38c:	54000120	b.eq	0xfffff7fae3b0  // b.none
   0x0000fffff7fae390:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae394:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae398:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae39c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae3a0:	54000161	b.ne	0xfffff7fae3cc  // b.any
   0x0000fffff7fae3a4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fae3a8:	9e620121	scvtf	d1, x9
   0x0000fffff7fae3ac:	14000002	b	0xfffff7fae3b4
   0x0000fffff7fae3b0:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fae3b4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fae3b8:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fae3bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae3c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae3c4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fae3c8:	17ffffde	b	0xfffff7fae340
   0x0000fffff7fae3cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae3d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae3d4:	aa1303e1	mov	x1, x19
   0x0000fffff7fae3d8:	aa1503e2	mov	x2, x21
   0x0000fffff7fae3dc:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fae3e0:	aa1403e4	mov	x4, x20
   0x0000fffff7fae3e4:	aa1603e5	mov	x5, x22
   0x0000fffff7fae3e8:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fae3ec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae3f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae3f4:	d63f0200	blr	x16
   0x0000fffff7fae3f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae3fc:	54005360	b.eq	0xfffff7faee68  // b.none
   0x0000fffff7fae400:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fae404:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fae408:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fae40c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fae410:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fae414:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fae418:	36d801d1	tbz	w17, #27, 0xfffff7fae450
   0x0000fffff7fae41c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae420:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae424:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae428:	54000281	b.ne	0xfffff7fae478  // b.any
   0x0000fffff7fae42c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fae430:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae434:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae438:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae43c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae440:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae444:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae448:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae44c:	54000169	b.ls	0xfffff7fae478  // b.plast
   0x0000fffff7fae450:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fae454:	91000529	add	x9, x9, #0x1
   0x0000fffff7fae458:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fae45c:	36d80091	tbz	w17, #27, 0xfffff7fae46c
   0x0000fffff7fae460:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae464:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae468:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae46c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fae470:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fae474:	1400000e	b	0xfffff7fae4ac
   0x0000fffff7fae478:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae47c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae480:	aa1303e1	mov	x1, x19
   0x0000fffff7fae484:	aa1503e2	mov	x2, x21
   0x0000fffff7fae488:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fae48c:	aa1403e4	mov	x4, x20
   0x0000fffff7fae490:	aa1603e5	mov	x5, x22
   0x0000fffff7fae494:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fae498:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae49c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae4a0:	d63f0200	blr	x16
   0x0000fffff7fae4a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae4a8:	54004e40	b.eq	0xfffff7faee70  // b.none
   0x0000fffff7fae4ac:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fae4b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae4b4:	aa1303e1	mov	x1, x19
   0x0000fffff7fae4b8:	aa1503e2	mov	x2, x21
   0x0000fffff7fae4bc:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fae4c0:	aa1403e4	mov	x4, x20
   0x0000fffff7fae4c4:	aa1603e5	mov	x5, x22
   0x0000fffff7fae4c8:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fae4cc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae4d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae4d4:	d63f0200	blr	x16
   0x0000fffff7fae4d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae4dc:	54004ce0	b.eq	0xfffff7faee78  // b.none
   0x0000fffff7fae4e0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fae4e4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fae4e8:	540004a0	b.eq	0xfffff7fae57c  // b.none
   0x0000fffff7fae4ec:	b940016d	ldr	w13, [x11]
   0x0000fffff7fae4f0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fae4f4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fae4f8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fae4fc:	54000400	b.eq	0xfffff7fae57c  // b.none
   0x0000fffff7fae500:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fae504:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fae508:	36d801d1	tbz	w17, #27, 0xfffff7fae540
   0x0000fffff7fae50c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae510:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae514:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae518:	54000321	b.ne	0xfffff7fae57c  // b.any
   0x0000fffff7fae51c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fae520:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae524:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae528:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae52c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae530:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae534:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae538:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae53c:	54000209	b.ls	0xfffff7fae57c  // b.plast
   0x0000fffff7fae540:	36d8008d	tbz	w13, #27, 0xfffff7fae550
   0x0000fffff7fae544:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fae548:	91000529	add	x9, x9, #0x1
   0x0000fffff7fae54c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fae550:	36d80091	tbz	w17, #27, 0xfffff7fae560
   0x0000fffff7fae554:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae558:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae55c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae560:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fae564:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fae568:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fae56c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fae570:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fae574:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fae578:	1400000e	b	0xfffff7fae5b0
   0x0000fffff7fae57c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fae580:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae584:	aa1303e1	mov	x1, x19
   0x0000fffff7fae588:	aa1503e2	mov	x2, x21
   0x0000fffff7fae58c:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fae590:	aa1403e4	mov	x4, x20
   0x0000fffff7fae594:	aa1603e5	mov	x5, x22
   0x0000fffff7fae598:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fae59c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fae5a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae5a4:	d63f0200	blr	x16
   0x0000fffff7fae5a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae5ac:	540046a0	b.eq	0xfffff7faee80  // b.none
   0x0000fffff7fae5b0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fae5b4:	37d806a9	tbnz	w9, #27, 0xfffff7fae688
   0x0000fffff7fae5b8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fae5bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae5c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae5c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae5c8:	540001c1	b.ne	0xfffff7fae600  // b.any
   0x0000fffff7fae5cc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae5d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae5d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae5d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae5dc:	54000121	b.ne	0xfffff7fae600  // b.any
   0x0000fffff7fae5e0:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fae5e4:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fae5e8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fae5ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae5f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae5f4:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fae5f8:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fae5fc:	14000030	b	0xfffff7fae6bc
   0x0000fffff7fae600:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fae604:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae608:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae60c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae610:	54000120	b.eq	0xfffff7fae634  // b.none
   0x0000fffff7fae614:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fae618:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae61c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae620:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae624:	54000321	b.ne	0xfffff7fae688  // b.any
   0x0000fffff7fae628:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fae62c:	9e620120	scvtf	d0, x9
   0x0000fffff7fae630:	14000002	b	0xfffff7fae638
   0x0000fffff7fae634:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fae638:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae63c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae640:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae644:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae648:	54000120	b.eq	0xfffff7fae66c  // b.none
   0x0000fffff7fae64c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae650:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae654:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae658:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae65c:	54000161	b.ne	0xfffff7fae688  // b.any
   0x0000fffff7fae660:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fae664:	9e620121	scvtf	d1, x9
   0x0000fffff7fae668:	14000002	b	0xfffff7fae670
   0x0000fffff7fae66c:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fae670:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fae674:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fae678:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae67c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae680:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fae684:	17ffffde	b	0xfffff7fae5fc
   0x0000fffff7fae688:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae68c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae690:	aa1303e1	mov	x1, x19
   0x0000fffff7fae694:	aa1503e2	mov	x2, x21
   0x0000fffff7fae698:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fae69c:	aa1403e4	mov	x4, x20
   0x0000fffff7fae6a0:	aa1603e5	mov	x5, x22
   0x0000fffff7fae6a4:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fae6a8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae6ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae6b0:	d63f0200	blr	x16
   0x0000fffff7fae6b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae6b8:	54003e80	b.eq	0xfffff7faee88  // b.none
   0x0000fffff7fae6bc:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fae6c0:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fae6c4:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fae6c8:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fae6cc:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fae6d0:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fae6d4:	36d801d1	tbz	w17, #27, 0xfffff7fae70c
   0x0000fffff7fae6d8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae6dc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae6e0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae6e4:	54000281	b.ne	0xfffff7fae734  // b.any
   0x0000fffff7fae6e8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fae6ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae6f0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae6f4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae6f8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae6fc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae700:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae704:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae708:	54000169	b.ls	0xfffff7fae734  // b.plast
   0x0000fffff7fae70c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fae710:	91000529	add	x9, x9, #0x1
   0x0000fffff7fae714:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fae718:	36d80091	tbz	w17, #27, 0xfffff7fae728
   0x0000fffff7fae71c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae720:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae724:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae728:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fae72c:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fae730:	1400000e	b	0xfffff7fae768
   0x0000fffff7fae734:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae738:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae73c:	aa1303e1	mov	x1, x19
   0x0000fffff7fae740:	aa1503e2	mov	x2, x21
   0x0000fffff7fae744:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fae748:	aa1403e4	mov	x4, x20
   0x0000fffff7fae74c:	aa1603e5	mov	x5, x22
   0x0000fffff7fae750:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fae754:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae758:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae75c:	d63f0200	blr	x16
   0x0000fffff7fae760:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae764:	54003960	b.eq	0xfffff7faee90  // b.none
   0x0000fffff7fae768:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fae76c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae770:	aa1303e1	mov	x1, x19
   0x0000fffff7fae774:	aa1503e2	mov	x2, x21
   0x0000fffff7fae778:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fae77c:	aa1403e4	mov	x4, x20
   0x0000fffff7fae780:	aa1603e5	mov	x5, x22
   0x0000fffff7fae784:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fae788:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae78c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae790:	d63f0200	blr	x16
   0x0000fffff7fae794:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae798:	54003800	b.eq	0xfffff7faee98  // b.none
   0x0000fffff7fae79c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fae7a0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fae7a4:	540004a0	b.eq	0xfffff7fae838  // b.none
   0x0000fffff7fae7a8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fae7ac:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fae7b0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fae7b4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fae7b8:	54000400	b.eq	0xfffff7fae838  // b.none
   0x0000fffff7fae7bc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fae7c0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fae7c4:	36d801d1	tbz	w17, #27, 0xfffff7fae7fc
   0x0000fffff7fae7c8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae7cc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae7d0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae7d4:	54000321	b.ne	0xfffff7fae838  // b.any
   0x0000fffff7fae7d8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fae7dc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae7e0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae7e4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae7e8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae7ec:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae7f0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae7f4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae7f8:	54000209	b.ls	0xfffff7fae838  // b.plast
   0x0000fffff7fae7fc:	36d8008d	tbz	w13, #27, 0xfffff7fae80c
   0x0000fffff7fae800:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fae804:	91000529	add	x9, x9, #0x1
   0x0000fffff7fae808:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fae80c:	36d80091	tbz	w17, #27, 0xfffff7fae81c
   0x0000fffff7fae810:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae814:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae818:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae81c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fae820:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fae824:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fae828:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fae82c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fae830:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fae834:	1400000e	b	0xfffff7fae86c
   0x0000fffff7fae838:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fae83c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae840:	aa1303e1	mov	x1, x19
   0x0000fffff7fae844:	aa1503e2	mov	x2, x21
   0x0000fffff7fae848:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fae84c:	aa1403e4	mov	x4, x20
   0x0000fffff7fae850:	aa1603e5	mov	x5, x22
   0x0000fffff7fae854:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fae858:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fae85c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae860:	d63f0200	blr	x16
   0x0000fffff7fae864:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae868:	540031c0	b.eq	0xfffff7faeea0  // b.none
   0x0000fffff7fae86c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fae870:	37d806a9	tbnz	w9, #27, 0xfffff7fae944
   0x0000fffff7fae874:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fae878:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae87c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae880:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae884:	540001c1	b.ne	0xfffff7fae8bc  // b.any
   0x0000fffff7fae888:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae88c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae890:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae894:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae898:	54000121	b.ne	0xfffff7fae8bc  // b.any
   0x0000fffff7fae89c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fae8a0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fae8a4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fae8a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae8ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae8b0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fae8b4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fae8b8:	14000030	b	0xfffff7fae978
   0x0000fffff7fae8bc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fae8c0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae8c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae8c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae8cc:	54000120	b.eq	0xfffff7fae8f0  // b.none
   0x0000fffff7fae8d0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fae8d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae8d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae8dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae8e0:	54000321	b.ne	0xfffff7fae944  // b.any
   0x0000fffff7fae8e4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fae8e8:	9e620120	scvtf	d0, x9
   0x0000fffff7fae8ec:	14000002	b	0xfffff7fae8f4
   0x0000fffff7fae8f0:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fae8f4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae8f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae8fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae900:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae904:	54000120	b.eq	0xfffff7fae928  // b.none
   0x0000fffff7fae908:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae90c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae910:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae914:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae918:	54000161	b.ne	0xfffff7fae944  // b.any
   0x0000fffff7fae91c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fae920:	9e620121	scvtf	d1, x9
   0x0000fffff7fae924:	14000002	b	0xfffff7fae92c
   0x0000fffff7fae928:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fae92c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fae930:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fae934:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae938:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae93c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fae940:	17ffffde	b	0xfffff7fae8b8
   0x0000fffff7fae944:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae948:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae94c:	aa1303e1	mov	x1, x19
   0x0000fffff7fae950:	aa1503e2	mov	x2, x21
   0x0000fffff7fae954:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fae958:	aa1403e4	mov	x4, x20
   0x0000fffff7fae95c:	aa1603e5	mov	x5, x22
   0x0000fffff7fae960:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fae964:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae968:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae96c:	d63f0200	blr	x16
   0x0000fffff7fae970:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae974:	540029a0	b.eq	0xfffff7faeea8  // b.none
   0x0000fffff7fae978:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fae97c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fae980:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fae984:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fae988:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fae98c:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fae990:	36d801d1	tbz	w17, #27, 0xfffff7fae9c8
   0x0000fffff7fae994:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae998:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae99c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae9a0:	54000281	b.ne	0xfffff7fae9f0  // b.any
   0x0000fffff7fae9a4:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fae9a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae9ac:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae9b0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae9b4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae9b8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae9bc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae9c0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae9c4:	54000169	b.ls	0xfffff7fae9f0  // b.plast
   0x0000fffff7fae9c8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fae9cc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fae9d0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fae9d4:	36d80091	tbz	w17, #27, 0xfffff7fae9e4
   0x0000fffff7fae9d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae9dc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae9e0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae9e4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fae9e8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fae9ec:	1400000e	b	0xfffff7faea24
   0x0000fffff7fae9f0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae9f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae9f8:	aa1303e1	mov	x1, x19
   0x0000fffff7fae9fc:	aa1503e2	mov	x2, x21
   0x0000fffff7faea00:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7faea04:	aa1403e4	mov	x4, x20
   0x0000fffff7faea08:	aa1603e5	mov	x5, x22
   0x0000fffff7faea0c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7faea10:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faea14:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faea18:	d63f0200	blr	x16
   0x0000fffff7faea1c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faea20:	54002480	b.eq	0xfffff7faeeb0  // b.none
   0x0000fffff7faea24:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faea28:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faea2c:	aa1303e1	mov	x1, x19
   0x0000fffff7faea30:	aa1503e2	mov	x2, x21
   0x0000fffff7faea34:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7faea38:	aa1403e4	mov	x4, x20
   0x0000fffff7faea3c:	aa1603e5	mov	x5, x22
   0x0000fffff7faea40:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7faea44:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faea48:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faea4c:	d63f0200	blr	x16
   0x0000fffff7faea50:	f100001f	cmp	x0, #0x0
   0x0000fffff7faea54:	54002320	b.eq	0xfffff7faeeb8  // b.none
   0x0000fffff7faea58:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faea5c:	f100017f	cmp	x11, #0x0
   0x0000fffff7faea60:	540004a0	b.eq	0xfffff7faeaf4  // b.none
   0x0000fffff7faea64:	b940016d	ldr	w13, [x11]
   0x0000fffff7faea68:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faea6c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faea70:	eb0901bf	cmp	x13, x9
   0x0000fffff7faea74:	54000400	b.eq	0xfffff7faeaf4  // b.none
   0x0000fffff7faea78:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faea7c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faea80:	36d801d1	tbz	w17, #27, 0xfffff7faeab8
   0x0000fffff7faea84:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faea88:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faea8c:	f100013f	cmp	x9, #0x0
   0x0000fffff7faea90:	54000321	b.ne	0xfffff7faeaf4  // b.any
   0x0000fffff7faea94:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faea98:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faea9c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faeaa0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faeaa4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faeaa8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faeaac:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faeab0:	f100055f	cmp	x10, #0x1
   0x0000fffff7faeab4:	54000209	b.ls	0xfffff7faeaf4  // b.plast
   0x0000fffff7faeab8:	36d8008d	tbz	w13, #27, 0xfffff7faeac8
   0x0000fffff7faeabc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faeac0:	91000529	add	x9, x9, #0x1
   0x0000fffff7faeac4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faeac8:	36d80091	tbz	w17, #27, 0xfffff7faead8
   0x0000fffff7faeacc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faead0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faead4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faead8:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7faeadc:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faeae0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faeae4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faeae8:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faeaec:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faeaf0:	1400000e	b	0xfffff7faeb28
   0x0000fffff7faeaf4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faeaf8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faeafc:	aa1303e1	mov	x1, x19
   0x0000fffff7faeb00:	aa1503e2	mov	x2, x21
   0x0000fffff7faeb04:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7faeb08:	aa1403e4	mov	x4, x20
   0x0000fffff7faeb0c:	aa1603e5	mov	x5, x22
   0x0000fffff7faeb10:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7faeb14:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faeb18:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faeb1c:	d63f0200	blr	x16
   0x0000fffff7faeb20:	f100001f	cmp	x0, #0x0
   0x0000fffff7faeb24:	54001ce0	b.eq	0xfffff7faeec0  // b.none
   0x0000fffff7faeb28:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faeb2c:	37d806a9	tbnz	w9, #27, 0xfffff7faec00
   0x0000fffff7faeb30:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faeb34:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faeb38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faeb3c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faeb40:	540001c1	b.ne	0xfffff7faeb78  // b.any
   0x0000fffff7faeb44:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faeb48:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faeb4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faeb50:	eb0a013f	cmp	x9, x10
   0x0000fffff7faeb54:	54000121	b.ne	0xfffff7faeb78  // b.any
   0x0000fffff7faeb58:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faeb5c:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7faeb60:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faeb64:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faeb68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faeb6c:	f9001669	str	x9, [x19, #40]
   0x0000fffff7faeb70:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faeb74:	14000030	b	0xfffff7faec34
   0x0000fffff7faeb78:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faeb7c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faeb80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faeb84:	eb0a013f	cmp	x9, x10
   0x0000fffff7faeb88:	54000120	b.eq	0xfffff7faebac  // b.none
   0x0000fffff7faeb8c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faeb90:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faeb94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faeb98:	eb0a013f	cmp	x9, x10
   0x0000fffff7faeb9c:	54000321	b.ne	0xfffff7faec00  // b.any
   0x0000fffff7faeba0:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faeba4:	9e620120	scvtf	d0, x9
   0x0000fffff7faeba8:	14000002	b	0xfffff7faebb0
   0x0000fffff7faebac:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7faebb0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faebb4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faebb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faebbc:	eb0a013f	cmp	x9, x10
   0x0000fffff7faebc0:	54000120	b.eq	0xfffff7faebe4  // b.none
   0x0000fffff7faebc4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faebc8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faebcc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faebd0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faebd4:	54000161	b.ne	0xfffff7faec00  // b.any
   0x0000fffff7faebd8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faebdc:	9e620121	scvtf	d1, x9
   0x0000fffff7faebe0:	14000002	b	0xfffff7faebe8
   0x0000fffff7faebe4:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7faebe8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faebec:	fd001660	str	d0, [x19, #40]
   0x0000fffff7faebf0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faebf4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faebf8:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faebfc:	17ffffde	b	0xfffff7faeb74
   0x0000fffff7faec00:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faec04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faec08:	aa1303e1	mov	x1, x19
   0x0000fffff7faec0c:	aa1503e2	mov	x2, x21
   0x0000fffff7faec10:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7faec14:	aa1403e4	mov	x4, x20
   0x0000fffff7faec18:	aa1603e5	mov	x5, x22
   0x0000fffff7faec1c:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7faec20:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faec24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faec28:	d63f0200	blr	x16
   0x0000fffff7faec2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faec30:	540014c0	b.eq	0xfffff7faeec8  // b.none
   0x0000fffff7faec34:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7faec38:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7faec3c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7faec40:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7faec44:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7faec48:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7faec4c:	36d801d1	tbz	w17, #27, 0xfffff7faec84
   0x0000fffff7faec50:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faec54:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faec58:	f100013f	cmp	x9, #0x0
   0x0000fffff7faec5c:	54000281	b.ne	0xfffff7faecac  // b.any
   0x0000fffff7faec60:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faec64:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faec68:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faec6c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faec70:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faec74:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faec78:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faec7c:	f100055f	cmp	x10, #0x1
   0x0000fffff7faec80:	54000169	b.ls	0xfffff7faecac  // b.plast
   0x0000fffff7faec84:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faec88:	91000529	add	x9, x9, #0x1
   0x0000fffff7faec8c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faec90:	36d80091	tbz	w17, #27, 0xfffff7faeca0
   0x0000fffff7faec94:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faec98:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faec9c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faeca0:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faeca4:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faeca8:	1400000e	b	0xfffff7faece0
   0x0000fffff7faecac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faecb0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faecb4:	aa1303e1	mov	x1, x19
   0x0000fffff7faecb8:	aa1503e2	mov	x2, x21
   0x0000fffff7faecbc:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7faecc0:	aa1403e4	mov	x4, x20
   0x0000fffff7faecc4:	aa1603e5	mov	x5, x22
   0x0000fffff7faecc8:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7faeccc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faecd0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faecd4:	d63f0200	blr	x16
   0x0000fffff7faecd8:	f100001f	cmp	x0, #0x0
   0x0000fffff7faecdc:	54000fa0	b.eq	0xfffff7faeed0  // b.none
   0x0000fffff7faece0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faece4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faece8:	aa1303e1	mov	x1, x19
   0x0000fffff7faecec:	aa1503e2	mov	x2, x21
   0x0000fffff7faecf0:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7faecf4:	aa1403e4	mov	x4, x20
   0x0000fffff7faecf8:	aa1603e5	mov	x5, x22
   0x0000fffff7faecfc:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7faed00:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faed04:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faed08:	d63f0200	blr	x16
   0x0000fffff7faed0c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faed10:	54000e40	b.eq	0xfffff7faeed8  // b.none
   0x0000fffff7faed14:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faed18:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faed1c:	aa1303e1	mov	x1, x19
   0x0000fffff7faed20:	aa1503e2	mov	x2, x21
   0x0000fffff7faed24:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7faed28:	aa1403e4	mov	x4, x20
   0x0000fffff7faed2c:	aa1603e5	mov	x5, x22
   0x0000fffff7faed30:	d2869090	mov	x16, #0x3484                	// #13444
   0x0000fffff7faed34:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faed38:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faed3c:	d63f0200	blr	x16
   0x0000fffff7faed40:	910143ff	add	sp, sp, #0x50
   0x0000fffff7faed44:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7faed48:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7faed4c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7faed50:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7faed54:	d65f03c0	ret
   0x0000fffff7faed58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faed5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faed60:	b900028a	str	w10, [x20]
   0x0000fffff7faed64:	f9000689	str	x9, [x20, #8]
   0x0000fffff7faed68:	910143ff	add	sp, sp, #0x50
   0x0000fffff7faed6c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7faed70:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7faed74:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7faed78:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7faed7c:	d65f03c0	ret
   0x0000fffff7faed80:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7faed84:	17fffff5	b	0xfffff7faed58
   0x0000fffff7faed88:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7faed8c:	17fffff3	b	0xfffff7faed58
   0x0000fffff7faed90:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7faed94:	17fffff1	b	0xfffff7faed58
   0x0000fffff7faed98:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7faed9c:	17ffffef	b	0xfffff7faed58
   0x0000fffff7faeda0:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7faeda4:	17ffffed	b	0xfffff7faed58
   0x0000fffff7faeda8:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7faedac:	17ffffeb	b	0xfffff7faed58
   0x0000fffff7faedb0:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7faedb4:	17ffffe9	b	0xfffff7faed58
   0x0000fffff7faedb8:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7faedbc:	17ffffe7	b	0xfffff7faed58
   0x0000fffff7faedc0:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7faedc4:	17ffffe5	b	0xfffff7faed58
   0x0000fffff7faedc8:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7faedcc:	17ffffe3	b	0xfffff7faed58
   0x0000fffff7faedd0:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7faedd4:	17ffffe1	b	0xfffff7faed58
   0x0000fffff7faedd8:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7faeddc:	17ffffdf	b	0xfffff7faed58
   0x0000fffff7faede0:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7faede4:	17ffffdd	b	0xfffff7faed58
   0x0000fffff7faede8:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7faedec:	17ffffdb	b	0xfffff7faed58
   0x0000fffff7faedf0:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7faedf4:	17ffffd9	b	0xfffff7faed58
   0x0000fffff7faedf8:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7faedfc:	17ffffd7	b	0xfffff7faed58
   0x0000fffff7faee00:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7faee04:	17ffffd5	b	0xfffff7faed58
   0x0000fffff7faee08:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7faee0c:	17ffffd3	b	0xfffff7faed58
   0x0000fffff7faee10:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7faee14:	17ffffd1	b	0xfffff7faed58
   0x0000fffff7faee18:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7faee1c:	17ffffcf	b	0xfffff7faed58
   0x0000fffff7faee20:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7faee24:	17ffffcd	b	0xfffff7faed58
   0x0000fffff7faee28:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7faee2c:	17ffffcb	b	0xfffff7faed58
   0x0000fffff7faee30:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7faee34:	17ffffc9	b	0xfffff7faed58
   0x0000fffff7faee38:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7faee3c:	17ffffc7	b	0xfffff7faed58
   0x0000fffff7faee40:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7faee44:	17ffffc5	b	0xfffff7faed58
   0x0000fffff7faee48:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7faee4c:	17ffffc3	b	0xfffff7faed58
   0x0000fffff7faee50:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7faee54:	17ffffc1	b	0xfffff7faed58
   0x0000fffff7faee58:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7faee5c:	17ffffbf	b	0xfffff7faed58
   0x0000fffff7faee60:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7faee64:	17ffffbd	b	0xfffff7faed58
   0x0000fffff7faee68:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7faee6c:	17ffffbb	b	0xfffff7faed58
   0x0000fffff7faee70:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7faee74:	17ffffb9	b	0xfffff7faed58
   0x0000fffff7faee78:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7faee7c:	17ffffb7	b	0xfffff7faed58
   0x0000fffff7faee80:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7faee84:	17ffffb5	b	0xfffff7faed58
   0x0000fffff7faee88:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7faee8c:	17ffffb3	b	0xfffff7faed58
   0x0000fffff7faee90:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7faee94:	17ffffb1	b	0xfffff7faed58
   0x0000fffff7faee98:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7faee9c:	17ffffaf	b	0xfffff7faed58
   0x0000fffff7faeea0:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7faeea4:	17ffffad	b	0xfffff7faed58
   0x0000fffff7faeea8:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7faeeac:	17ffffab	b	0xfffff7faed58
   0x0000fffff7faeeb0:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7faeeb4:	17ffffa9	b	0xfffff7faed58
   0x0000fffff7faeeb8:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7faeebc:	17ffffa7	b	0xfffff7faed58
   0x0000fffff7faeec0:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7faeec4:	17ffffa5	b	0xfffff7faed58
   0x0000fffff7faeec8:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7faeecc:	17ffffa3	b	0xfffff7faed58
   0x0000fffff7faeed0:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7faeed4:	17ffffa1	b	0xfffff7faed58
   0x0000fffff7faeed8:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7faeedc:	17ffff9f	b	0xfffff7faed58
   0x0000fffff7faeee0:	00000000	udf	#0
   0x0000fffff7faeee4:	00000000	udf	#0
   0x0000fffff7faeee8:	00000000	udf	#0
   0x0000fffff7faeeec:	00000000	udf	#0
   0x0000fffff7faeef0:	00000000	udf	#0
   0x0000fffff7faeef4:	00000000	udf	#0
   0x0000fffff7faeef8:	00000000	udf	#0
   0x0000fffff7faeefc:	00000000	udf	#0
   0x0000fffff7faef00:	00000000	udf	#0
   0x0000fffff7faef04:	00000000	udf	#0
   0x0000fffff7faef08:	00000000	udf	#0
   0x0000fffff7faef0c:	00000000	udf	#0
   0x0000fffff7faef10:	00000000	udf	#0
   0x0000fffff7faef14:	00000000	udf	#0
   0x0000fffff7faef18:	00000000	udf	#0
   0x0000fffff7faef1c:	00000000	udf	#0
   0x0000fffff7faef20:	00000000	udf	#0
   0x0000fffff7faef24:	00000000	udf	#0
   0x0000fffff7faef28:	00000000	udf	#0
   0x0000fffff7faef2c:	00000000	udf	#0
   0x0000fffff7faef30:	00000000	udf	#0
   0x0000fffff7faef34:	00000000	udf	#0
   0x0000fffff7faef38:	00000000	udf	#0
   0x0000fffff7faef3c:	00000000	udf	#0
   0x0000fffff7faef40:	00000000	udf	#0
   0x0000fffff7faef44:	00000000	udf	#0
   0x0000fffff7faef48:	00000000	udf	#0
   0x0000fffff7faef4c:	00000000	udf	#0
   0x0000fffff7faef50:	00000000	udf	#0
   0x0000fffff7faef54:	00000000	udf	#0
   0x0000fffff7faef58:	00000000	udf	#0
   0x0000fffff7faef5c:	00000000	udf	#0
   0x0000fffff7faef60:	00000000	udf	#0
   0x0000fffff7faef64:	00000000	udf	#0
   0x0000fffff7faef68:	00000000	udf	#0
   0x0000fffff7faef6c:	00000000	udf	#0
   0x0000fffff7faef70:	00000000	udf	#0
   0x0000fffff7faef74:	00000000	udf	#0
   0x0000fffff7faef78:	00000000	udf	#0
   0x0000fffff7faef7c:	00000000	udf	#0
   0x0000fffff7faef80:	00000000	udf	#0
   0x0000fffff7faef84:	00000000	udf	#0
   0x0000fffff7faef88:	00000000	udf	#0
   0x0000fffff7faef8c:	00000000	udf	#0
   0x0000fffff7faef90:	00000000	udf	#0
   0x0000fffff7faef94:	00000000	udf	#0
   0x0000fffff7faef98:	00000000	udf	#0
   0x0000fffff7faef9c:	00000000	udf	#0
   0x0000fffff7faefa0:	00000000	udf	#0
   0x0000fffff7faefa4:	00000000	udf	#0
   0x0000fffff7faefa8:	00000000	udf	#0
   0x0000fffff7faefac:	00000000	udf	#0
   0x0000fffff7faefb0:	00000000	udf	#0
   0x0000fffff7faefb4:	00000000	udf	#0
   0x0000fffff7faefb8:	00000000	udf	#0
   0x0000fffff7faefbc:	00000000	udf	#0
   0x0000fffff7faefc0:	00000000	udf	#0
   0x0000fffff7faefc4:	00000000	udf	#0
   0x0000fffff7faefc8:	00000000	udf	#0
   0x0000fffff7faefcc:	00000000	udf	#0
   0x0000fffff7faefd0:	00000000	udf	#0
   0x0000fffff7faefd4:	00000000	udf	#0
   0x0000fffff7faefd8:	00000000	udf	#0
   0x0000fffff7faefdc:	00000000	udf	#0
   0x0000fffff7faefe0:	00000000	udf	#0
   0x0000fffff7faefe4:	00000000	udf	#0
   0x0000fffff7faefe8:	00000000	udf	#0
   0x0000fffff7faefec:	00000000	udf	#0
   0x0000fffff7faeff0:	00000000	udf	#0
   0x0000fffff7faeff4:	00000000	udf	#0
   0x0000fffff7faeff8:	00000000	udf	#0
   0x0000fffff7faeffc:	00000000	udf	#0
End of assembler dump.
