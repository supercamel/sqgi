Dump of assembler code from 0xfffff7f96000 to 0xfffff7f98000:
   0x0000fffff7f96000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7f96004:	910003fd	mov	x29, sp
   0x0000fffff7f96008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7f9600c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7f96010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7f96014:	aa0003f3	mov	x19, x0
   0x0000fffff7f96018:	aa0103f4	mov	x20, x1
   0x0000fffff7f9601c:	aa0203f5	mov	x21, x2
   0x0000fffff7f96020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7f96024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7f96028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f9602c:	f90003e9	str	x9, [sp]
   0x0000fffff7f96030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7f96034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7f96038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7f9603c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f96040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96044:	d63f0200	blr	x16
   0x0000fffff7f96048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7f9604c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7f96050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7f96054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7f96058:	14000001	b	0xfffff7f9605c
   0x0000fffff7f9605c:	14000001	b	0xfffff7f96060
   0x0000fffff7f96060:	14000001	b	0xfffff7f96064
   0x0000fffff7f96064:	14000001	b	0xfffff7f96068
   0x0000fffff7f96068:	14000001	b	0xfffff7f9606c
   0x0000fffff7f9606c:	14000001	b	0xfffff7f96070
   0x0000fffff7f96070:	14000001	b	0xfffff7f96074
   0x0000fffff7f96074:	14000001	b	0xfffff7f96078
   0x0000fffff7f96078:	14000001	b	0xfffff7f9607c
   0x0000fffff7f9607c:	14000001	b	0xfffff7f96080
   0x0000fffff7f96080:	14000001	b	0xfffff7f96084
   0x0000fffff7f96084:	14000001	b	0xfffff7f96088
   0x0000fffff7f96088:	14000001	b	0xfffff7f9608c
   0x0000fffff7f9608c:	14000001	b	0xfffff7f96090
   0x0000fffff7f96090:	14000001	b	0xfffff7f96094
   0x0000fffff7f96094:	14000001	b	0xfffff7f96098
   0x0000fffff7f96098:	14000001	b	0xfffff7f9609c
   0x0000fffff7f9609c:	14000001	b	0xfffff7f960a0
   0x0000fffff7f960a0:	14000001	b	0xfffff7f960a4
   0x0000fffff7f960a4:	14000001	b	0xfffff7f960a8
   0x0000fffff7f960a8:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f960ac:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f960b0:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f960b4:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7f960b8:	36d80211	tbz	w17, #27, 0xfffff7f960f8
   0x0000fffff7f960bc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f960c0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f960c4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f960c8:	540001e1	b.ne	0xfffff7f96104  // b.any
   0x0000fffff7f960cc:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f960d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f960d4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f960d8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f960dc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f960e0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f960e4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f960e8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f960ec:	540000c9	b.ls	0xfffff7f96104  // b.plast
   0x0000fffff7f960f0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f960f4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f960f8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f960fc:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f96100:	1400000e	b	0xfffff7f96138
   0x0000fffff7f96104:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f96108:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9610c:	aa1303e1	mov	x1, x19
   0x0000fffff7f96110:	aa1503e2	mov	x2, x21
   0x0000fffff7f96114:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7f96118:	aa1403e4	mov	x4, x20
   0x0000fffff7f9611c:	aa1603e5	mov	x5, x22
   0x0000fffff7f96120:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7f96124:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f96128:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9612c:	d63f0200	blr	x16
   0x0000fffff7f96130:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96134:	5400ede0	b.eq	0xfffff7f97ef0  // b.none
   0x0000fffff7f96138:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f9613c:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f96140:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f96144:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7f96148:	36d80211	tbz	w17, #27, 0xfffff7f96188
   0x0000fffff7f9614c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f96150:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f96154:	f100013f	cmp	x9, #0x0
   0x0000fffff7f96158:	540001e1	b.ne	0xfffff7f96194  // b.any
   0x0000fffff7f9615c:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f96160:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f96164:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f96168:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9616c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f96170:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f96174:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f96178:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9617c:	540000c9	b.ls	0xfffff7f96194  // b.plast
   0x0000fffff7f96180:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f96184:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f96188:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f9618c:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f96190:	1400000e	b	0xfffff7f961c8
   0x0000fffff7f96194:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f96198:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9619c:	aa1303e1	mov	x1, x19
   0x0000fffff7f961a0:	aa1503e2	mov	x2, x21
   0x0000fffff7f961a4:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7f961a8:	aa1403e4	mov	x4, x20
   0x0000fffff7f961ac:	aa1603e5	mov	x5, x22
   0x0000fffff7f961b0:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7f961b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f961b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f961bc:	d63f0200	blr	x16
   0x0000fffff7f961c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f961c4:	5400e9a0	b.eq	0xfffff7f97ef8  // b.none
   0x0000fffff7f961c8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f961cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f961d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f961d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f961d8:	54000421	b.ne	0xfffff7f9625c  // b.any
   0x0000fffff7f961dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f961e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f961e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f961e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f961ec:	54000381	b.ne	0xfffff7f9625c  // b.any
   0x0000fffff7f961f0:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f961f4:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7f961f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f961fc:	9a9fa7ec	cset	x12, lt	// lt = tstop
   0x0000fffff7f96200:	5280010d	mov	w13, #0x8                   	// #8
   0x0000fffff7f96204:	72a0200d	movk	w13, #0x100, lsl #16
   0x0000fffff7f96208:	91000580	add	x0, x12, #0x1
   0x0000fffff7f9620c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f96210:	36d80211	tbz	w17, #27, 0xfffff7f96250
   0x0000fffff7f96214:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f96218:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9621c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f96220:	540001e1	b.ne	0xfffff7f9625c  // b.any
   0x0000fffff7f96224:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f96228:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9622c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f96230:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f96234:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f96238:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9623c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f96240:	f100055f	cmp	x10, #0x1
   0x0000fffff7f96244:	540000c9	b.ls	0xfffff7f9625c  // b.plast
   0x0000fffff7f96248:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9624c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f96250:	f9005ecc	str	x12, [x22, #184]
   0x0000fffff7f96254:	b900b2cd	str	w13, [x22, #176]
   0x0000fffff7f96258:	1400000e	b	0xfffff7f96290
   0x0000fffff7f9625c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f96260:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96264:	aa1303e1	mov	x1, x19
   0x0000fffff7f96268:	aa1503e2	mov	x2, x21
   0x0000fffff7f9626c:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7f96270:	aa1403e4	mov	x4, x20
   0x0000fffff7f96274:	aa1603e5	mov	x5, x22
   0x0000fffff7f96278:	d2909810	mov	x16, #0x84c0                	// #33984
   0x0000fffff7f9627c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f96280:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96284:	d63f0200	blr	x16
   0x0000fffff7f96288:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9628c:	5400e3a0	b.eq	0xfffff7f97f00  // b.none
   0x0000fffff7f96290:	f100041f	cmp	x0, #0x1
   0x0000fffff7f96294:	5400df80	b.eq	0xfffff7f97e84  // b.none
   0x0000fffff7f96298:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f9629c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f962a0:	d299d20c	mov	x12, #0xce90                	// #52880
   0x0000fffff7f962a4:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f962a8:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f962ac:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7f962b0:	36d801d1	tbz	w17, #27, 0xfffff7f962e8
   0x0000fffff7f962b4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f962b8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f962bc:	f100013f	cmp	x9, #0x0
   0x0000fffff7f962c0:	54000281	b.ne	0xfffff7f96310  // b.any
   0x0000fffff7f962c4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f962c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f962cc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f962d0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f962d4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f962d8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f962dc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f962e0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f962e4:	54000169	b.ls	0xfffff7f96310  // b.plast
   0x0000fffff7f962e8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f962ec:	91000529	add	x9, x9, #0x1
   0x0000fffff7f962f0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f962f4:	36d80091	tbz	w17, #27, 0xfffff7f96304
   0x0000fffff7f962f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f962fc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f96300:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f96304:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f96308:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9630c:	1400000e	b	0xfffff7f96344
   0x0000fffff7f96310:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f96314:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96318:	aa1303e1	mov	x1, x19
   0x0000fffff7f9631c:	aa1503e2	mov	x2, x21
   0x0000fffff7f96320:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7f96324:	aa1403e4	mov	x4, x20
   0x0000fffff7f96328:	aa1603e5	mov	x5, x22
   0x0000fffff7f9632c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f96330:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f96334:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96338:	d63f0200	blr	x16
   0x0000fffff7f9633c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96340:	5400de40	b.eq	0xfffff7f97f08  // b.none
   0x0000fffff7f96344:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f96348:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9634c:	540003a0	b.eq	0xfffff7f963c0  // b.none
   0x0000fffff7f96350:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7f96354:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7f96358:	b9400171	ldr	w17, [x11]
   0x0000fffff7f9635c:	36d801d1	tbz	w17, #27, 0xfffff7f96394
   0x0000fffff7f96360:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f96364:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f96368:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9636c:	540002a1	b.ne	0xfffff7f963c0  // b.any
   0x0000fffff7f96370:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f96374:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f96378:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9637c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f96380:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f96384:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f96388:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9638c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f96390:	54000189	b.ls	0xfffff7f963c0  // b.plast
   0x0000fffff7f96394:	36d8008d	tbz	w13, #27, 0xfffff7f963a4
   0x0000fffff7f96398:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9639c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f963a0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f963a4:	36d80091	tbz	w17, #27, 0xfffff7f963b4
   0x0000fffff7f963a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f963ac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f963b0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f963b4:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f963b8:	b900016d	str	w13, [x11]
   0x0000fffff7f963bc:	1400000e	b	0xfffff7f963f4
   0x0000fffff7f963c0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f963c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f963c8:	aa1303e1	mov	x1, x19
   0x0000fffff7f963cc:	aa1503e2	mov	x2, x21
   0x0000fffff7f963d0:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7f963d4:	aa1403e4	mov	x4, x20
   0x0000fffff7f963d8:	aa1603e5	mov	x5, x22
   0x0000fffff7f963dc:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f963e0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f963e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f963e8:	d63f0200	blr	x16
   0x0000fffff7f963ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f963f0:	5400d900	b.eq	0xfffff7f97f10  // b.none
   0x0000fffff7f963f4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f963f8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f963fc:	540004a0	b.eq	0xfffff7f96490  // b.none
   0x0000fffff7f96400:	b940016d	ldr	w13, [x11]
   0x0000fffff7f96404:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f96408:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9640c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f96410:	54000400	b.eq	0xfffff7f96490  // b.none
   0x0000fffff7f96414:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f96418:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9641c:	36d801d1	tbz	w17, #27, 0xfffff7f96454
   0x0000fffff7f96420:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f96424:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f96428:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9642c:	54000321	b.ne	0xfffff7f96490  // b.any
   0x0000fffff7f96430:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f96434:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f96438:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9643c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f96440:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f96444:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f96448:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9644c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f96450:	54000209	b.ls	0xfffff7f96490  // b.plast
   0x0000fffff7f96454:	36d8008d	tbz	w13, #27, 0xfffff7f96464
   0x0000fffff7f96458:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9645c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f96460:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f96464:	36d80091	tbz	w17, #27, 0xfffff7f96474
   0x0000fffff7f96468:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9646c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f96470:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f96474:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f96478:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9647c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f96480:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f96484:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f96488:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9648c:	1400000e	b	0xfffff7f964c4
   0x0000fffff7f96490:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f96494:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96498:	aa1303e1	mov	x1, x19
   0x0000fffff7f9649c:	aa1503e2	mov	x2, x21
   0x0000fffff7f964a0:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7f964a4:	aa1403e4	mov	x4, x20
   0x0000fffff7f964a8:	aa1603e5	mov	x5, x22
   0x0000fffff7f964ac:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f964b0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f964b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f964b8:	d63f0200	blr	x16
   0x0000fffff7f964bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f964c0:	5400d2c0	b.eq	0xfffff7f97f18  // b.none
   0x0000fffff7f964c4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f964c8:	37d806a9	tbnz	w9, #27, 0xfffff7f9659c
   0x0000fffff7f964cc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f964d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f964d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f964d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f964dc:	540001c1	b.ne	0xfffff7f96514  // b.any
   0x0000fffff7f964e0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f964e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f964e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f964ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f964f0:	54000121	b.ne	0xfffff7f96514  // b.any
   0x0000fffff7f964f4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f964f8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f964fc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f96500:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96504:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96508:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9650c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f96510:	14000030	b	0xfffff7f965d0
   0x0000fffff7f96514:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f96518:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9651c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96520:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96524:	54000120	b.eq	0xfffff7f96548  // b.none
   0x0000fffff7f96528:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9652c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96530:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96534:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96538:	54000321	b.ne	0xfffff7f9659c  // b.any
   0x0000fffff7f9653c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f96540:	9e620120	scvtf	d0, x9
   0x0000fffff7f96544:	14000002	b	0xfffff7f9654c
   0x0000fffff7f96548:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9654c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f96550:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f96554:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96558:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9655c:	54000120	b.eq	0xfffff7f96580  // b.none
   0x0000fffff7f96560:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f96564:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96568:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9656c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96570:	54000161	b.ne	0xfffff7f9659c  // b.any
   0x0000fffff7f96574:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f96578:	9e620121	scvtf	d1, x9
   0x0000fffff7f9657c:	14000002	b	0xfffff7f96584
   0x0000fffff7f96580:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f96584:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f96588:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9658c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f96590:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96594:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f96598:	17ffffde	b	0xfffff7f96510
   0x0000fffff7f9659c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f965a0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f965a4:	aa1303e1	mov	x1, x19
   0x0000fffff7f965a8:	aa1503e2	mov	x2, x21
   0x0000fffff7f965ac:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7f965b0:	aa1403e4	mov	x4, x20
   0x0000fffff7f965b4:	aa1603e5	mov	x5, x22
   0x0000fffff7f965b8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f965bc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f965c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f965c4:	d63f0200	blr	x16
   0x0000fffff7f965c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f965cc:	5400caa0	b.eq	0xfffff7f97f20  // b.none
   0x0000fffff7f965d0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f965d4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f965d8:	540004a0	b.eq	0xfffff7f9666c  // b.none
   0x0000fffff7f965dc:	b940016d	ldr	w13, [x11]
   0x0000fffff7f965e0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f965e4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f965e8:	eb0901bf	cmp	x13, x9
   0x0000fffff7f965ec:	54000400	b.eq	0xfffff7f9666c  // b.none
   0x0000fffff7f965f0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f965f4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f965f8:	36d801d1	tbz	w17, #27, 0xfffff7f96630
   0x0000fffff7f965fc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f96600:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f96604:	f100013f	cmp	x9, #0x0
   0x0000fffff7f96608:	54000321	b.ne	0xfffff7f9666c  // b.any
   0x0000fffff7f9660c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f96610:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f96614:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f96618:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9661c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f96620:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f96624:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f96628:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9662c:	54000209	b.ls	0xfffff7f9666c  // b.plast
   0x0000fffff7f96630:	36d8008d	tbz	w13, #27, 0xfffff7f96640
   0x0000fffff7f96634:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f96638:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9663c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f96640:	36d80091	tbz	w17, #27, 0xfffff7f96650
   0x0000fffff7f96644:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f96648:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9664c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f96650:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f96654:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f96658:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9665c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f96660:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f96664:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f96668:	1400000e	b	0xfffff7f966a0
   0x0000fffff7f9666c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f96670:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96674:	aa1303e1	mov	x1, x19
   0x0000fffff7f96678:	aa1503e2	mov	x2, x21
   0x0000fffff7f9667c:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7f96680:	aa1403e4	mov	x4, x20
   0x0000fffff7f96684:	aa1603e5	mov	x5, x22
   0x0000fffff7f96688:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9668c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f96690:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96694:	d63f0200	blr	x16
   0x0000fffff7f96698:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9669c:	5400c460	b.eq	0xfffff7f97f28  // b.none
   0x0000fffff7f966a0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f966a4:	37d806a9	tbnz	w9, #27, 0xfffff7f96778
   0x0000fffff7f966a8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f966ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f966b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f966b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f966b8:	540001c1	b.ne	0xfffff7f966f0  // b.any
   0x0000fffff7f966bc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f966c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f966c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f966c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f966cc:	54000121	b.ne	0xfffff7f966f0  // b.any
   0x0000fffff7f966d0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f966d4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f966d8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f966dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f966e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f966e4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f966e8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f966ec:	14000030	b	0xfffff7f967ac
   0x0000fffff7f966f0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f966f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f966f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f966fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96700:	54000120	b.eq	0xfffff7f96724  // b.none
   0x0000fffff7f96704:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f96708:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9670c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96710:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96714:	54000321	b.ne	0xfffff7f96778  // b.any
   0x0000fffff7f96718:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9671c:	9e620120	scvtf	d0, x9
   0x0000fffff7f96720:	14000002	b	0xfffff7f96728
   0x0000fffff7f96724:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f96728:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9672c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f96730:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96734:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96738:	54000120	b.eq	0xfffff7f9675c  // b.none
   0x0000fffff7f9673c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f96740:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96744:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96748:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9674c:	54000161	b.ne	0xfffff7f96778  // b.any
   0x0000fffff7f96750:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f96754:	9e620121	scvtf	d1, x9
   0x0000fffff7f96758:	14000002	b	0xfffff7f96760
   0x0000fffff7f9675c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f96760:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f96764:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f96768:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9676c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96770:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f96774:	17ffffde	b	0xfffff7f966ec
   0x0000fffff7f96778:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9677c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96780:	aa1303e1	mov	x1, x19
   0x0000fffff7f96784:	aa1503e2	mov	x2, x21
   0x0000fffff7f96788:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7f9678c:	aa1403e4	mov	x4, x20
   0x0000fffff7f96790:	aa1603e5	mov	x5, x22
   0x0000fffff7f96794:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f96798:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9679c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f967a0:	d63f0200	blr	x16
   0x0000fffff7f967a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f967a8:	5400bc40	b.eq	0xfffff7f97f30  // b.none
   0x0000fffff7f967ac:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f967b0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f967b4:	540004a0	b.eq	0xfffff7f96848  // b.none
   0x0000fffff7f967b8:	b940016d	ldr	w13, [x11]
   0x0000fffff7f967bc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f967c0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f967c4:	eb0901bf	cmp	x13, x9
   0x0000fffff7f967c8:	54000400	b.eq	0xfffff7f96848  // b.none
   0x0000fffff7f967cc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f967d0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f967d4:	36d801d1	tbz	w17, #27, 0xfffff7f9680c
   0x0000fffff7f967d8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f967dc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f967e0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f967e4:	54000321	b.ne	0xfffff7f96848  // b.any
   0x0000fffff7f967e8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f967ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f967f0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f967f4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f967f8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f967fc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f96800:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f96804:	f100055f	cmp	x10, #0x1
   0x0000fffff7f96808:	54000209	b.ls	0xfffff7f96848  // b.plast
   0x0000fffff7f9680c:	36d8008d	tbz	w13, #27, 0xfffff7f9681c
   0x0000fffff7f96810:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f96814:	91000529	add	x9, x9, #0x1
   0x0000fffff7f96818:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9681c:	36d80091	tbz	w17, #27, 0xfffff7f9682c
   0x0000fffff7f96820:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f96824:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f96828:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9682c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f96830:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f96834:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f96838:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9683c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f96840:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f96844:	1400000e	b	0xfffff7f9687c
   0x0000fffff7f96848:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9684c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96850:	aa1303e1	mov	x1, x19
   0x0000fffff7f96854:	aa1503e2	mov	x2, x21
   0x0000fffff7f96858:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7f9685c:	aa1403e4	mov	x4, x20
   0x0000fffff7f96860:	aa1603e5	mov	x5, x22
   0x0000fffff7f96864:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f96868:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9686c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96870:	d63f0200	blr	x16
   0x0000fffff7f96874:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96878:	5400b600	b.eq	0xfffff7f97f38  // b.none
   0x0000fffff7f9687c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f96880:	37d806a9	tbnz	w9, #27, 0xfffff7f96954
   0x0000fffff7f96884:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f96888:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9688c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96890:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96894:	540001c1	b.ne	0xfffff7f968cc  // b.any
   0x0000fffff7f96898:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9689c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f968a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f968a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f968a8:	54000121	b.ne	0xfffff7f968cc  // b.any
   0x0000fffff7f968ac:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f968b0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f968b4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f968b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f968bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f968c0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f968c4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f968c8:	14000030	b	0xfffff7f96988
   0x0000fffff7f968cc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f968d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f968d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f968d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f968dc:	54000120	b.eq	0xfffff7f96900  // b.none
   0x0000fffff7f968e0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f968e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f968e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f968ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f968f0:	54000321	b.ne	0xfffff7f96954  // b.any
   0x0000fffff7f968f4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f968f8:	9e620120	scvtf	d0, x9
   0x0000fffff7f968fc:	14000002	b	0xfffff7f96904
   0x0000fffff7f96900:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f96904:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f96908:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9690c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96910:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96914:	54000120	b.eq	0xfffff7f96938  // b.none
   0x0000fffff7f96918:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9691c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96920:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96924:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96928:	54000161	b.ne	0xfffff7f96954  // b.any
   0x0000fffff7f9692c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f96930:	9e620121	scvtf	d1, x9
   0x0000fffff7f96934:	14000002	b	0xfffff7f9693c
   0x0000fffff7f96938:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9693c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f96940:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f96944:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f96948:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9694c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f96950:	17ffffde	b	0xfffff7f968c8
   0x0000fffff7f96954:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f96958:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9695c:	aa1303e1	mov	x1, x19
   0x0000fffff7f96960:	aa1503e2	mov	x2, x21
   0x0000fffff7f96964:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7f96968:	aa1403e4	mov	x4, x20
   0x0000fffff7f9696c:	aa1603e5	mov	x5, x22
   0x0000fffff7f96970:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f96974:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f96978:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9697c:	d63f0200	blr	x16
   0x0000fffff7f96980:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96984:	5400ade0	b.eq	0xfffff7f97f40  // b.none
   0x0000fffff7f96988:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9698c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f96990:	540004a0	b.eq	0xfffff7f96a24  // b.none
   0x0000fffff7f96994:	b940016d	ldr	w13, [x11]
   0x0000fffff7f96998:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9699c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f969a0:	eb0901bf	cmp	x13, x9
   0x0000fffff7f969a4:	54000400	b.eq	0xfffff7f96a24  // b.none
   0x0000fffff7f969a8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f969ac:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f969b0:	36d801d1	tbz	w17, #27, 0xfffff7f969e8
   0x0000fffff7f969b4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f969b8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f969bc:	f100013f	cmp	x9, #0x0
   0x0000fffff7f969c0:	54000321	b.ne	0xfffff7f96a24  // b.any
   0x0000fffff7f969c4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f969c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f969cc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f969d0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f969d4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f969d8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f969dc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f969e0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f969e4:	54000209	b.ls	0xfffff7f96a24  // b.plast
   0x0000fffff7f969e8:	36d8008d	tbz	w13, #27, 0xfffff7f969f8
   0x0000fffff7f969ec:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f969f0:	91000529	add	x9, x9, #0x1
   0x0000fffff7f969f4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f969f8:	36d80091	tbz	w17, #27, 0xfffff7f96a08
   0x0000fffff7f969fc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f96a00:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f96a04:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f96a08:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f96a0c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f96a10:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f96a14:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f96a18:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f96a1c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f96a20:	1400000e	b	0xfffff7f96a58
   0x0000fffff7f96a24:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f96a28:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96a2c:	aa1303e1	mov	x1, x19
   0x0000fffff7f96a30:	aa1503e2	mov	x2, x21
   0x0000fffff7f96a34:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7f96a38:	aa1403e4	mov	x4, x20
   0x0000fffff7f96a3c:	aa1603e5	mov	x5, x22
   0x0000fffff7f96a40:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f96a44:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f96a48:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96a4c:	d63f0200	blr	x16
   0x0000fffff7f96a50:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96a54:	5400a7a0	b.eq	0xfffff7f97f48  // b.none
   0x0000fffff7f96a58:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f96a5c:	37d806a9	tbnz	w9, #27, 0xfffff7f96b30
   0x0000fffff7f96a60:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f96a64:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96a68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96a6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96a70:	540001c1	b.ne	0xfffff7f96aa8  // b.any
   0x0000fffff7f96a74:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f96a78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96a7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96a80:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96a84:	54000121	b.ne	0xfffff7f96aa8  // b.any
   0x0000fffff7f96a88:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f96a8c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f96a90:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f96a94:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96a98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96a9c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f96aa0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f96aa4:	14000030	b	0xfffff7f96b64
   0x0000fffff7f96aa8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f96aac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f96ab0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96ab4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96ab8:	54000120	b.eq	0xfffff7f96adc  // b.none
   0x0000fffff7f96abc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f96ac0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96ac4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96ac8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96acc:	54000321	b.ne	0xfffff7f96b30  // b.any
   0x0000fffff7f96ad0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f96ad4:	9e620120	scvtf	d0, x9
   0x0000fffff7f96ad8:	14000002	b	0xfffff7f96ae0
   0x0000fffff7f96adc:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f96ae0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f96ae4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f96ae8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96aec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96af0:	54000120	b.eq	0xfffff7f96b14  // b.none
   0x0000fffff7f96af4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f96af8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96afc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96b00:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96b04:	54000161	b.ne	0xfffff7f96b30  // b.any
   0x0000fffff7f96b08:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f96b0c:	9e620121	scvtf	d1, x9
   0x0000fffff7f96b10:	14000002	b	0xfffff7f96b18
   0x0000fffff7f96b14:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f96b18:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f96b1c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f96b20:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f96b24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96b28:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f96b2c:	17ffffde	b	0xfffff7f96aa4
   0x0000fffff7f96b30:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f96b34:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96b38:	aa1303e1	mov	x1, x19
   0x0000fffff7f96b3c:	aa1503e2	mov	x2, x21
   0x0000fffff7f96b40:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7f96b44:	aa1403e4	mov	x4, x20
   0x0000fffff7f96b48:	aa1603e5	mov	x5, x22
   0x0000fffff7f96b4c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f96b50:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f96b54:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96b58:	d63f0200	blr	x16
   0x0000fffff7f96b5c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96b60:	54009f80	b.eq	0xfffff7f97f50  // b.none
   0x0000fffff7f96b64:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f96b68:	f100017f	cmp	x11, #0x0
   0x0000fffff7f96b6c:	540004a0	b.eq	0xfffff7f96c00  // b.none
   0x0000fffff7f96b70:	b940016d	ldr	w13, [x11]
   0x0000fffff7f96b74:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f96b78:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f96b7c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f96b80:	54000400	b.eq	0xfffff7f96c00  // b.none
   0x0000fffff7f96b84:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f96b88:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f96b8c:	36d801d1	tbz	w17, #27, 0xfffff7f96bc4
   0x0000fffff7f96b90:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f96b94:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f96b98:	f100013f	cmp	x9, #0x0
   0x0000fffff7f96b9c:	54000321	b.ne	0xfffff7f96c00  // b.any
   0x0000fffff7f96ba0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f96ba4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f96ba8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f96bac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f96bb0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f96bb4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f96bb8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f96bbc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f96bc0:	54000209	b.ls	0xfffff7f96c00  // b.plast
   0x0000fffff7f96bc4:	36d8008d	tbz	w13, #27, 0xfffff7f96bd4
   0x0000fffff7f96bc8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f96bcc:	91000529	add	x9, x9, #0x1
   0x0000fffff7f96bd0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f96bd4:	36d80091	tbz	w17, #27, 0xfffff7f96be4
   0x0000fffff7f96bd8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f96bdc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f96be0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f96be4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f96be8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f96bec:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f96bf0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f96bf4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f96bf8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f96bfc:	1400000e	b	0xfffff7f96c34
   0x0000fffff7f96c00:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f96c04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96c08:	aa1303e1	mov	x1, x19
   0x0000fffff7f96c0c:	aa1503e2	mov	x2, x21
   0x0000fffff7f96c10:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7f96c14:	aa1403e4	mov	x4, x20
   0x0000fffff7f96c18:	aa1603e5	mov	x5, x22
   0x0000fffff7f96c1c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f96c20:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f96c24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96c28:	d63f0200	blr	x16
   0x0000fffff7f96c2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96c30:	54009940	b.eq	0xfffff7f97f58  // b.none
   0x0000fffff7f96c34:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f96c38:	37d806a9	tbnz	w9, #27, 0xfffff7f96d0c
   0x0000fffff7f96c3c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f96c40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96c44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96c48:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96c4c:	540001c1	b.ne	0xfffff7f96c84  // b.any
   0x0000fffff7f96c50:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f96c54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96c58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96c5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96c60:	54000121	b.ne	0xfffff7f96c84  // b.any
   0x0000fffff7f96c64:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f96c68:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f96c6c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f96c70:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96c74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96c78:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f96c7c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f96c80:	14000030	b	0xfffff7f96d40
   0x0000fffff7f96c84:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f96c88:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f96c8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96c90:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96c94:	54000120	b.eq	0xfffff7f96cb8  // b.none
   0x0000fffff7f96c98:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f96c9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96ca0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96ca4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96ca8:	54000321	b.ne	0xfffff7f96d0c  // b.any
   0x0000fffff7f96cac:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f96cb0:	9e620120	scvtf	d0, x9
   0x0000fffff7f96cb4:	14000002	b	0xfffff7f96cbc
   0x0000fffff7f96cb8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f96cbc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f96cc0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f96cc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96cc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96ccc:	54000120	b.eq	0xfffff7f96cf0  // b.none
   0x0000fffff7f96cd0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f96cd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96cd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96cdc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96ce0:	54000161	b.ne	0xfffff7f96d0c  // b.any
   0x0000fffff7f96ce4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f96ce8:	9e620121	scvtf	d1, x9
   0x0000fffff7f96cec:	14000002	b	0xfffff7f96cf4
   0x0000fffff7f96cf0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f96cf4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f96cf8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f96cfc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f96d00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96d04:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f96d08:	17ffffde	b	0xfffff7f96c80
   0x0000fffff7f96d0c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f96d10:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96d14:	aa1303e1	mov	x1, x19
   0x0000fffff7f96d18:	aa1503e2	mov	x2, x21
   0x0000fffff7f96d1c:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7f96d20:	aa1403e4	mov	x4, x20
   0x0000fffff7f96d24:	aa1603e5	mov	x5, x22
   0x0000fffff7f96d28:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f96d2c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f96d30:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96d34:	d63f0200	blr	x16
   0x0000fffff7f96d38:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96d3c:	54009120	b.eq	0xfffff7f97f60  // b.none
   0x0000fffff7f96d40:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f96d44:	f100017f	cmp	x11, #0x0
   0x0000fffff7f96d48:	540004a0	b.eq	0xfffff7f96ddc  // b.none
   0x0000fffff7f96d4c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f96d50:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f96d54:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f96d58:	eb0901bf	cmp	x13, x9
   0x0000fffff7f96d5c:	54000400	b.eq	0xfffff7f96ddc  // b.none
   0x0000fffff7f96d60:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f96d64:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f96d68:	36d801d1	tbz	w17, #27, 0xfffff7f96da0
   0x0000fffff7f96d6c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f96d70:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f96d74:	f100013f	cmp	x9, #0x0
   0x0000fffff7f96d78:	54000321	b.ne	0xfffff7f96ddc  // b.any
   0x0000fffff7f96d7c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f96d80:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f96d84:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f96d88:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f96d8c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f96d90:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f96d94:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f96d98:	f100055f	cmp	x10, #0x1
   0x0000fffff7f96d9c:	54000209	b.ls	0xfffff7f96ddc  // b.plast
   0x0000fffff7f96da0:	36d8008d	tbz	w13, #27, 0xfffff7f96db0
   0x0000fffff7f96da4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f96da8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f96dac:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f96db0:	36d80091	tbz	w17, #27, 0xfffff7f96dc0
   0x0000fffff7f96db4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f96db8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f96dbc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f96dc0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f96dc4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f96dc8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f96dcc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f96dd0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f96dd4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f96dd8:	1400000e	b	0xfffff7f96e10
   0x0000fffff7f96ddc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f96de0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96de4:	aa1303e1	mov	x1, x19
   0x0000fffff7f96de8:	aa1503e2	mov	x2, x21
   0x0000fffff7f96dec:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7f96df0:	aa1403e4	mov	x4, x20
   0x0000fffff7f96df4:	aa1603e5	mov	x5, x22
   0x0000fffff7f96df8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f96dfc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f96e00:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96e04:	d63f0200	blr	x16
   0x0000fffff7f96e08:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96e0c:	54008ae0	b.eq	0xfffff7f97f68  // b.none
   0x0000fffff7f96e10:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f96e14:	37d806a9	tbnz	w9, #27, 0xfffff7f96ee8
   0x0000fffff7f96e18:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f96e1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96e20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96e24:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96e28:	540001c1	b.ne	0xfffff7f96e60  // b.any
   0x0000fffff7f96e2c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f96e30:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96e34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96e38:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96e3c:	54000121	b.ne	0xfffff7f96e60  // b.any
   0x0000fffff7f96e40:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f96e44:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f96e48:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f96e4c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96e50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96e54:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f96e58:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f96e5c:	14000030	b	0xfffff7f96f1c
   0x0000fffff7f96e60:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f96e64:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f96e68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96e6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96e70:	54000120	b.eq	0xfffff7f96e94  // b.none
   0x0000fffff7f96e74:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f96e78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96e7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96e80:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96e84:	54000321	b.ne	0xfffff7f96ee8  // b.any
   0x0000fffff7f96e88:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f96e8c:	9e620120	scvtf	d0, x9
   0x0000fffff7f96e90:	14000002	b	0xfffff7f96e98
   0x0000fffff7f96e94:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f96e98:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f96e9c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f96ea0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96ea4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96ea8:	54000120	b.eq	0xfffff7f96ecc  // b.none
   0x0000fffff7f96eac:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f96eb0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96eb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96eb8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96ebc:	54000161	b.ne	0xfffff7f96ee8  // b.any
   0x0000fffff7f96ec0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f96ec4:	9e620121	scvtf	d1, x9
   0x0000fffff7f96ec8:	14000002	b	0xfffff7f96ed0
   0x0000fffff7f96ecc:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f96ed0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f96ed4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f96ed8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f96edc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96ee0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f96ee4:	17ffffde	b	0xfffff7f96e5c
   0x0000fffff7f96ee8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f96eec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96ef0:	aa1303e1	mov	x1, x19
   0x0000fffff7f96ef4:	aa1503e2	mov	x2, x21
   0x0000fffff7f96ef8:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7f96efc:	aa1403e4	mov	x4, x20
   0x0000fffff7f96f00:	aa1603e5	mov	x5, x22
   0x0000fffff7f96f04:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f96f08:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f96f0c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96f10:	d63f0200	blr	x16
   0x0000fffff7f96f14:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96f18:	540082c0	b.eq	0xfffff7f97f70  // b.none
   0x0000fffff7f96f1c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f96f20:	f100017f	cmp	x11, #0x0
   0x0000fffff7f96f24:	540004a0	b.eq	0xfffff7f96fb8  // b.none
   0x0000fffff7f96f28:	b940016d	ldr	w13, [x11]
   0x0000fffff7f96f2c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f96f30:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f96f34:	eb0901bf	cmp	x13, x9
   0x0000fffff7f96f38:	54000400	b.eq	0xfffff7f96fb8  // b.none
   0x0000fffff7f96f3c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f96f40:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f96f44:	36d801d1	tbz	w17, #27, 0xfffff7f96f7c
   0x0000fffff7f96f48:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f96f4c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f96f50:	f100013f	cmp	x9, #0x0
   0x0000fffff7f96f54:	54000321	b.ne	0xfffff7f96fb8  // b.any
   0x0000fffff7f96f58:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f96f5c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f96f60:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f96f64:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f96f68:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f96f6c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f96f70:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f96f74:	f100055f	cmp	x10, #0x1
   0x0000fffff7f96f78:	54000209	b.ls	0xfffff7f96fb8  // b.plast
   0x0000fffff7f96f7c:	36d8008d	tbz	w13, #27, 0xfffff7f96f8c
   0x0000fffff7f96f80:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f96f84:	91000529	add	x9, x9, #0x1
   0x0000fffff7f96f88:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f96f8c:	36d80091	tbz	w17, #27, 0xfffff7f96f9c
   0x0000fffff7f96f90:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f96f94:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f96f98:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f96f9c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f96fa0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f96fa4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f96fa8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f96fac:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f96fb0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f96fb4:	1400000e	b	0xfffff7f96fec
   0x0000fffff7f96fb8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f96fbc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96fc0:	aa1303e1	mov	x1, x19
   0x0000fffff7f96fc4:	aa1503e2	mov	x2, x21
   0x0000fffff7f96fc8:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7f96fcc:	aa1403e4	mov	x4, x20
   0x0000fffff7f96fd0:	aa1603e5	mov	x5, x22
   0x0000fffff7f96fd4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f96fd8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f96fdc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96fe0:	d63f0200	blr	x16
   0x0000fffff7f96fe4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96fe8:	54007c80	b.eq	0xfffff7f97f78  // b.none
   0x0000fffff7f96fec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f96ff0:	37d806a9	tbnz	w9, #27, 0xfffff7f970c4
   0x0000fffff7f96ff4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f96ff8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96ffc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97000:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97004:	540001c1	b.ne	0xfffff7f9703c  // b.any
   0x0000fffff7f97008:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9700c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97010:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97014:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97018:	54000121	b.ne	0xfffff7f9703c  // b.any
   0x0000fffff7f9701c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f97020:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f97024:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97028:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9702c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97030:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f97034:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f97038:	14000030	b	0xfffff7f970f8
   0x0000fffff7f9703c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f97040:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97044:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97048:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9704c:	54000120	b.eq	0xfffff7f97070  // b.none
   0x0000fffff7f97050:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f97054:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97058:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9705c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97060:	54000321	b.ne	0xfffff7f970c4  // b.any
   0x0000fffff7f97064:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f97068:	9e620120	scvtf	d0, x9
   0x0000fffff7f9706c:	14000002	b	0xfffff7f97074
   0x0000fffff7f97070:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f97074:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f97078:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9707c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97080:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97084:	54000120	b.eq	0xfffff7f970a8  // b.none
   0x0000fffff7f97088:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9708c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97090:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97094:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97098:	54000161	b.ne	0xfffff7f970c4  // b.any
   0x0000fffff7f9709c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f970a0:	9e620121	scvtf	d1, x9
   0x0000fffff7f970a4:	14000002	b	0xfffff7f970ac
   0x0000fffff7f970a8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f970ac:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f970b0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f970b4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f970b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f970bc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f970c0:	17ffffde	b	0xfffff7f97038
   0x0000fffff7f970c4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f970c8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f970cc:	aa1303e1	mov	x1, x19
   0x0000fffff7f970d0:	aa1503e2	mov	x2, x21
   0x0000fffff7f970d4:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7f970d8:	aa1403e4	mov	x4, x20
   0x0000fffff7f970dc:	aa1603e5	mov	x5, x22
   0x0000fffff7f970e0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f970e4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f970e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f970ec:	d63f0200	blr	x16
   0x0000fffff7f970f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f970f4:	54007460	b.eq	0xfffff7f97f80  // b.none
   0x0000fffff7f970f8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f970fc:	f100017f	cmp	x11, #0x0
   0x0000fffff7f97100:	540004a0	b.eq	0xfffff7f97194  // b.none
   0x0000fffff7f97104:	b940016d	ldr	w13, [x11]
   0x0000fffff7f97108:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9710c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f97110:	eb0901bf	cmp	x13, x9
   0x0000fffff7f97114:	54000400	b.eq	0xfffff7f97194  // b.none
   0x0000fffff7f97118:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9711c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f97120:	36d801d1	tbz	w17, #27, 0xfffff7f97158
   0x0000fffff7f97124:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f97128:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9712c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f97130:	54000321	b.ne	0xfffff7f97194  // b.any
   0x0000fffff7f97134:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f97138:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9713c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f97140:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f97144:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f97148:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9714c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f97150:	f100055f	cmp	x10, #0x1
   0x0000fffff7f97154:	54000209	b.ls	0xfffff7f97194  // b.plast
   0x0000fffff7f97158:	36d8008d	tbz	w13, #27, 0xfffff7f97168
   0x0000fffff7f9715c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f97160:	91000529	add	x9, x9, #0x1
   0x0000fffff7f97164:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f97168:	36d80091	tbz	w17, #27, 0xfffff7f97178
   0x0000fffff7f9716c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f97170:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f97174:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f97178:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9717c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f97180:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f97184:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f97188:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9718c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f97190:	1400000e	b	0xfffff7f971c8
   0x0000fffff7f97194:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f97198:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9719c:	aa1303e1	mov	x1, x19
   0x0000fffff7f971a0:	aa1503e2	mov	x2, x21
   0x0000fffff7f971a4:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7f971a8:	aa1403e4	mov	x4, x20
   0x0000fffff7f971ac:	aa1603e5	mov	x5, x22
   0x0000fffff7f971b0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f971b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f971b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f971bc:	d63f0200	blr	x16
   0x0000fffff7f971c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f971c4:	54006e20	b.eq	0xfffff7f97f88  // b.none
   0x0000fffff7f971c8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f971cc:	37d806a9	tbnz	w9, #27, 0xfffff7f972a0
   0x0000fffff7f971d0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f971d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f971d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f971dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f971e0:	540001c1	b.ne	0xfffff7f97218  // b.any
   0x0000fffff7f971e4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f971e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f971ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f971f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f971f4:	54000121	b.ne	0xfffff7f97218  // b.any
   0x0000fffff7f971f8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f971fc:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f97200:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97204:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97208:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9720c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f97210:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f97214:	14000030	b	0xfffff7f972d4
   0x0000fffff7f97218:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9721c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97220:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97224:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97228:	54000120	b.eq	0xfffff7f9724c  // b.none
   0x0000fffff7f9722c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f97230:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97234:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97238:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9723c:	54000321	b.ne	0xfffff7f972a0  // b.any
   0x0000fffff7f97240:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f97244:	9e620120	scvtf	d0, x9
   0x0000fffff7f97248:	14000002	b	0xfffff7f97250
   0x0000fffff7f9724c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f97250:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f97254:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97258:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9725c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97260:	54000120	b.eq	0xfffff7f97284  // b.none
   0x0000fffff7f97264:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f97268:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9726c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97270:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97274:	54000161	b.ne	0xfffff7f972a0  // b.any
   0x0000fffff7f97278:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9727c:	9e620121	scvtf	d1, x9
   0x0000fffff7f97280:	14000002	b	0xfffff7f97288
   0x0000fffff7f97284:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f97288:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9728c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f97290:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97294:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97298:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9729c:	17ffffde	b	0xfffff7f97214
   0x0000fffff7f972a0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f972a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f972a8:	aa1303e1	mov	x1, x19
   0x0000fffff7f972ac:	aa1503e2	mov	x2, x21
   0x0000fffff7f972b0:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7f972b4:	aa1403e4	mov	x4, x20
   0x0000fffff7f972b8:	aa1603e5	mov	x5, x22
   0x0000fffff7f972bc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f972c0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f972c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f972c8:	d63f0200	blr	x16
   0x0000fffff7f972cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f972d0:	54006600	b.eq	0xfffff7f97f90  // b.none
   0x0000fffff7f972d4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f972d8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f972dc:	540004a0	b.eq	0xfffff7f97370  // b.none
   0x0000fffff7f972e0:	b940016d	ldr	w13, [x11]
   0x0000fffff7f972e4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f972e8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f972ec:	eb0901bf	cmp	x13, x9
   0x0000fffff7f972f0:	54000400	b.eq	0xfffff7f97370  // b.none
   0x0000fffff7f972f4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f972f8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f972fc:	36d801d1	tbz	w17, #27, 0xfffff7f97334
   0x0000fffff7f97300:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f97304:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f97308:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9730c:	54000321	b.ne	0xfffff7f97370  // b.any
   0x0000fffff7f97310:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f97314:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f97318:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9731c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f97320:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f97324:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f97328:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9732c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f97330:	54000209	b.ls	0xfffff7f97370  // b.plast
   0x0000fffff7f97334:	36d8008d	tbz	w13, #27, 0xfffff7f97344
   0x0000fffff7f97338:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9733c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f97340:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f97344:	36d80091	tbz	w17, #27, 0xfffff7f97354
   0x0000fffff7f97348:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9734c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f97350:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f97354:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f97358:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9735c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f97360:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f97364:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f97368:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9736c:	1400000e	b	0xfffff7f973a4
   0x0000fffff7f97370:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f97374:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97378:	aa1303e1	mov	x1, x19
   0x0000fffff7f9737c:	aa1503e2	mov	x2, x21
   0x0000fffff7f97380:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7f97384:	aa1403e4	mov	x4, x20
   0x0000fffff7f97388:	aa1603e5	mov	x5, x22
   0x0000fffff7f9738c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f97390:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97394:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97398:	d63f0200	blr	x16
   0x0000fffff7f9739c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f973a0:	54005fc0	b.eq	0xfffff7f97f98  // b.none
   0x0000fffff7f973a4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f973a8:	37d806a9	tbnz	w9, #27, 0xfffff7f9747c
   0x0000fffff7f973ac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f973b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f973b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f973b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f973bc:	540001c1	b.ne	0xfffff7f973f4  // b.any
   0x0000fffff7f973c0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f973c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f973c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f973cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f973d0:	54000121	b.ne	0xfffff7f973f4  // b.any
   0x0000fffff7f973d4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f973d8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f973dc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f973e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f973e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f973e8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f973ec:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f973f0:	14000030	b	0xfffff7f974b0
   0x0000fffff7f973f4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f973f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f973fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97400:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97404:	54000120	b.eq	0xfffff7f97428  // b.none
   0x0000fffff7f97408:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9740c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97410:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97414:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97418:	54000321	b.ne	0xfffff7f9747c  // b.any
   0x0000fffff7f9741c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f97420:	9e620120	scvtf	d0, x9
   0x0000fffff7f97424:	14000002	b	0xfffff7f9742c
   0x0000fffff7f97428:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9742c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f97430:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97434:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97438:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9743c:	54000120	b.eq	0xfffff7f97460  // b.none
   0x0000fffff7f97440:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f97444:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97448:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9744c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97450:	54000161	b.ne	0xfffff7f9747c  // b.any
   0x0000fffff7f97454:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f97458:	9e620121	scvtf	d1, x9
   0x0000fffff7f9745c:	14000002	b	0xfffff7f97464
   0x0000fffff7f97460:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f97464:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f97468:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9746c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97470:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97474:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f97478:	17ffffde	b	0xfffff7f973f0
   0x0000fffff7f9747c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97480:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97484:	aa1303e1	mov	x1, x19
   0x0000fffff7f97488:	aa1503e2	mov	x2, x21
   0x0000fffff7f9748c:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7f97490:	aa1403e4	mov	x4, x20
   0x0000fffff7f97494:	aa1603e5	mov	x5, x22
   0x0000fffff7f97498:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9749c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f974a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f974a4:	d63f0200	blr	x16
   0x0000fffff7f974a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f974ac:	540057a0	b.eq	0xfffff7f97fa0  // b.none
   0x0000fffff7f974b0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f974b4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f974b8:	540004a0	b.eq	0xfffff7f9754c  // b.none
   0x0000fffff7f974bc:	b940016d	ldr	w13, [x11]
   0x0000fffff7f974c0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f974c4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f974c8:	eb0901bf	cmp	x13, x9
   0x0000fffff7f974cc:	54000400	b.eq	0xfffff7f9754c  // b.none
   0x0000fffff7f974d0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f974d4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f974d8:	36d801d1	tbz	w17, #27, 0xfffff7f97510
   0x0000fffff7f974dc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f974e0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f974e4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f974e8:	54000321	b.ne	0xfffff7f9754c  // b.any
   0x0000fffff7f974ec:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f974f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f974f4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f974f8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f974fc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f97500:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f97504:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f97508:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9750c:	54000209	b.ls	0xfffff7f9754c  // b.plast
   0x0000fffff7f97510:	36d8008d	tbz	w13, #27, 0xfffff7f97520
   0x0000fffff7f97514:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f97518:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9751c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f97520:	36d80091	tbz	w17, #27, 0xfffff7f97530
   0x0000fffff7f97524:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f97528:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9752c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f97530:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f97534:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f97538:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9753c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f97540:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f97544:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f97548:	1400000e	b	0xfffff7f97580
   0x0000fffff7f9754c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f97550:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97554:	aa1303e1	mov	x1, x19
   0x0000fffff7f97558:	aa1503e2	mov	x2, x21
   0x0000fffff7f9755c:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7f97560:	aa1403e4	mov	x4, x20
   0x0000fffff7f97564:	aa1603e5	mov	x5, x22
   0x0000fffff7f97568:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9756c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97570:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97574:	d63f0200	blr	x16
   0x0000fffff7f97578:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9757c:	54005160	b.eq	0xfffff7f97fa8  // b.none
   0x0000fffff7f97580:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f97584:	37d806a9	tbnz	w9, #27, 0xfffff7f97658
   0x0000fffff7f97588:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9758c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97590:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97594:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97598:	540001c1	b.ne	0xfffff7f975d0  // b.any
   0x0000fffff7f9759c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f975a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f975a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f975a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f975ac:	54000121	b.ne	0xfffff7f975d0  // b.any
   0x0000fffff7f975b0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f975b4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f975b8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f975bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f975c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f975c4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f975c8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f975cc:	14000030	b	0xfffff7f9768c
   0x0000fffff7f975d0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f975d4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f975d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f975dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f975e0:	54000120	b.eq	0xfffff7f97604  // b.none
   0x0000fffff7f975e4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f975e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f975ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f975f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f975f4:	54000321	b.ne	0xfffff7f97658  // b.any
   0x0000fffff7f975f8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f975fc:	9e620120	scvtf	d0, x9
   0x0000fffff7f97600:	14000002	b	0xfffff7f97608
   0x0000fffff7f97604:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f97608:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9760c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97610:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97614:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97618:	54000120	b.eq	0xfffff7f9763c  // b.none
   0x0000fffff7f9761c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f97620:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97624:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97628:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9762c:	54000161	b.ne	0xfffff7f97658  // b.any
   0x0000fffff7f97630:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f97634:	9e620121	scvtf	d1, x9
   0x0000fffff7f97638:	14000002	b	0xfffff7f97640
   0x0000fffff7f9763c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f97640:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f97644:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f97648:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9764c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97650:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f97654:	17ffffde	b	0xfffff7f975cc
   0x0000fffff7f97658:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9765c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97660:	aa1303e1	mov	x1, x19
   0x0000fffff7f97664:	aa1503e2	mov	x2, x21
   0x0000fffff7f97668:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7f9766c:	aa1403e4	mov	x4, x20
   0x0000fffff7f97670:	aa1603e5	mov	x5, x22
   0x0000fffff7f97674:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f97678:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9767c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97680:	d63f0200	blr	x16
   0x0000fffff7f97684:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97688:	54004940	b.eq	0xfffff7f97fb0  // b.none
   0x0000fffff7f9768c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f97690:	f100017f	cmp	x11, #0x0
   0x0000fffff7f97694:	540004a0	b.eq	0xfffff7f97728  // b.none
   0x0000fffff7f97698:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9769c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f976a0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f976a4:	eb0901bf	cmp	x13, x9
   0x0000fffff7f976a8:	54000400	b.eq	0xfffff7f97728  // b.none
   0x0000fffff7f976ac:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f976b0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f976b4:	36d801d1	tbz	w17, #27, 0xfffff7f976ec
   0x0000fffff7f976b8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f976bc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f976c0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f976c4:	54000321	b.ne	0xfffff7f97728  // b.any
   0x0000fffff7f976c8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f976cc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f976d0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f976d4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f976d8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f976dc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f976e0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f976e4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f976e8:	54000209	b.ls	0xfffff7f97728  // b.plast
   0x0000fffff7f976ec:	36d8008d	tbz	w13, #27, 0xfffff7f976fc
   0x0000fffff7f976f0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f976f4:	91000529	add	x9, x9, #0x1
   0x0000fffff7f976f8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f976fc:	36d80091	tbz	w17, #27, 0xfffff7f9770c
   0x0000fffff7f97700:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f97704:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f97708:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9770c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f97710:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f97714:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f97718:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9771c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f97720:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f97724:	1400000e	b	0xfffff7f9775c
   0x0000fffff7f97728:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9772c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97730:	aa1303e1	mov	x1, x19
   0x0000fffff7f97734:	aa1503e2	mov	x2, x21
   0x0000fffff7f97738:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7f9773c:	aa1403e4	mov	x4, x20
   0x0000fffff7f97740:	aa1603e5	mov	x5, x22
   0x0000fffff7f97744:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f97748:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9774c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97750:	d63f0200	blr	x16
   0x0000fffff7f97754:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97758:	54004300	b.eq	0xfffff7f97fb8  // b.none
   0x0000fffff7f9775c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f97760:	37d806a9	tbnz	w9, #27, 0xfffff7f97834
   0x0000fffff7f97764:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f97768:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9776c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97770:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97774:	540001c1	b.ne	0xfffff7f977ac  // b.any
   0x0000fffff7f97778:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9777c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97780:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97784:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97788:	54000121	b.ne	0xfffff7f977ac  // b.any
   0x0000fffff7f9778c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f97790:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f97794:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97798:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9779c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f977a0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f977a4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f977a8:	14000030	b	0xfffff7f97868
   0x0000fffff7f977ac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f977b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f977b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f977b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f977bc:	54000120	b.eq	0xfffff7f977e0  // b.none
   0x0000fffff7f977c0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f977c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f977c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f977cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f977d0:	54000321	b.ne	0xfffff7f97834  // b.any
   0x0000fffff7f977d4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f977d8:	9e620120	scvtf	d0, x9
   0x0000fffff7f977dc:	14000002	b	0xfffff7f977e4
   0x0000fffff7f977e0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f977e4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f977e8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f977ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f977f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f977f4:	54000120	b.eq	0xfffff7f97818  // b.none
   0x0000fffff7f977f8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f977fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97800:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97804:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97808:	54000161	b.ne	0xfffff7f97834  // b.any
   0x0000fffff7f9780c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f97810:	9e620121	scvtf	d1, x9
   0x0000fffff7f97814:	14000002	b	0xfffff7f9781c
   0x0000fffff7f97818:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9781c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f97820:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f97824:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97828:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9782c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f97830:	17ffffde	b	0xfffff7f977a8
   0x0000fffff7f97834:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97838:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9783c:	aa1303e1	mov	x1, x19
   0x0000fffff7f97840:	aa1503e2	mov	x2, x21
   0x0000fffff7f97844:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7f97848:	aa1403e4	mov	x4, x20
   0x0000fffff7f9784c:	aa1603e5	mov	x5, x22
   0x0000fffff7f97850:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f97854:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97858:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9785c:	d63f0200	blr	x16
   0x0000fffff7f97860:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97864:	54003ae0	b.eq	0xfffff7f97fc0  // b.none
   0x0000fffff7f97868:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9786c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f97870:	540004a0	b.eq	0xfffff7f97904  // b.none
   0x0000fffff7f97874:	b940016d	ldr	w13, [x11]
   0x0000fffff7f97878:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9787c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f97880:	eb0901bf	cmp	x13, x9
   0x0000fffff7f97884:	54000400	b.eq	0xfffff7f97904  // b.none
   0x0000fffff7f97888:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9788c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f97890:	36d801d1	tbz	w17, #27, 0xfffff7f978c8
   0x0000fffff7f97894:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f97898:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9789c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f978a0:	54000321	b.ne	0xfffff7f97904  // b.any
   0x0000fffff7f978a4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f978a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f978ac:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f978b0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f978b4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f978b8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f978bc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f978c0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f978c4:	54000209	b.ls	0xfffff7f97904  // b.plast
   0x0000fffff7f978c8:	36d8008d	tbz	w13, #27, 0xfffff7f978d8
   0x0000fffff7f978cc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f978d0:	91000529	add	x9, x9, #0x1
   0x0000fffff7f978d4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f978d8:	36d80091	tbz	w17, #27, 0xfffff7f978e8
   0x0000fffff7f978dc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f978e0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f978e4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f978e8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f978ec:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f978f0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f978f4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f978f8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f978fc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f97900:	1400000e	b	0xfffff7f97938
   0x0000fffff7f97904:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f97908:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9790c:	aa1303e1	mov	x1, x19
   0x0000fffff7f97910:	aa1503e2	mov	x2, x21
   0x0000fffff7f97914:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7f97918:	aa1403e4	mov	x4, x20
   0x0000fffff7f9791c:	aa1603e5	mov	x5, x22
   0x0000fffff7f97920:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f97924:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97928:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9792c:	d63f0200	blr	x16
   0x0000fffff7f97930:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97934:	540034a0	b.eq	0xfffff7f97fc8  // b.none
   0x0000fffff7f97938:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9793c:	37d806a9	tbnz	w9, #27, 0xfffff7f97a10
   0x0000fffff7f97940:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f97944:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97948:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9794c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97950:	540001c1	b.ne	0xfffff7f97988  // b.any
   0x0000fffff7f97954:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f97958:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9795c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97960:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97964:	54000121	b.ne	0xfffff7f97988  // b.any
   0x0000fffff7f97968:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9796c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f97970:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97974:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97978:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9797c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f97980:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f97984:	14000030	b	0xfffff7f97a44
   0x0000fffff7f97988:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9798c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97990:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97994:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97998:	54000120	b.eq	0xfffff7f979bc  // b.none
   0x0000fffff7f9799c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f979a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f979a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f979a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f979ac:	54000321	b.ne	0xfffff7f97a10  // b.any
   0x0000fffff7f979b0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f979b4:	9e620120	scvtf	d0, x9
   0x0000fffff7f979b8:	14000002	b	0xfffff7f979c0
   0x0000fffff7f979bc:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f979c0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f979c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f979c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f979cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f979d0:	54000120	b.eq	0xfffff7f979f4  // b.none
   0x0000fffff7f979d4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f979d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f979dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f979e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f979e4:	54000161	b.ne	0xfffff7f97a10  // b.any
   0x0000fffff7f979e8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f979ec:	9e620121	scvtf	d1, x9
   0x0000fffff7f979f0:	14000002	b	0xfffff7f979f8
   0x0000fffff7f979f4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f979f8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f979fc:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f97a00:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97a04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97a08:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f97a0c:	17ffffde	b	0xfffff7f97984
   0x0000fffff7f97a10:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97a14:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97a18:	aa1303e1	mov	x1, x19
   0x0000fffff7f97a1c:	aa1503e2	mov	x2, x21
   0x0000fffff7f97a20:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7f97a24:	aa1403e4	mov	x4, x20
   0x0000fffff7f97a28:	aa1603e5	mov	x5, x22
   0x0000fffff7f97a2c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f97a30:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97a34:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97a38:	d63f0200	blr	x16
   0x0000fffff7f97a3c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97a40:	54002c80	b.eq	0xfffff7f97fd0  // b.none
   0x0000fffff7f97a44:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f97a48:	f100017f	cmp	x11, #0x0
   0x0000fffff7f97a4c:	540004a0	b.eq	0xfffff7f97ae0  // b.none
   0x0000fffff7f97a50:	b940016d	ldr	w13, [x11]
   0x0000fffff7f97a54:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f97a58:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f97a5c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f97a60:	54000400	b.eq	0xfffff7f97ae0  // b.none
   0x0000fffff7f97a64:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f97a68:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f97a6c:	36d801d1	tbz	w17, #27, 0xfffff7f97aa4
   0x0000fffff7f97a70:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f97a74:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f97a78:	f100013f	cmp	x9, #0x0
   0x0000fffff7f97a7c:	54000321	b.ne	0xfffff7f97ae0  // b.any
   0x0000fffff7f97a80:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f97a84:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f97a88:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f97a8c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f97a90:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f97a94:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f97a98:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f97a9c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f97aa0:	54000209	b.ls	0xfffff7f97ae0  // b.plast
   0x0000fffff7f97aa4:	36d8008d	tbz	w13, #27, 0xfffff7f97ab4
   0x0000fffff7f97aa8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f97aac:	91000529	add	x9, x9, #0x1
   0x0000fffff7f97ab0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f97ab4:	36d80091	tbz	w17, #27, 0xfffff7f97ac4
   0x0000fffff7f97ab8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f97abc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f97ac0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f97ac4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f97ac8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f97acc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f97ad0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f97ad4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f97ad8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f97adc:	1400000e	b	0xfffff7f97b14
   0x0000fffff7f97ae0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f97ae4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97ae8:	aa1303e1	mov	x1, x19
   0x0000fffff7f97aec:	aa1503e2	mov	x2, x21
   0x0000fffff7f97af0:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7f97af4:	aa1403e4	mov	x4, x20
   0x0000fffff7f97af8:	aa1603e5	mov	x5, x22
   0x0000fffff7f97afc:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f97b00:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97b04:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97b08:	d63f0200	blr	x16
   0x0000fffff7f97b0c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97b10:	54002640	b.eq	0xfffff7f97fd8  // b.none
   0x0000fffff7f97b14:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f97b18:	37d806a9	tbnz	w9, #27, 0xfffff7f97bec
   0x0000fffff7f97b1c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f97b20:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97b24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97b28:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97b2c:	540001c1	b.ne	0xfffff7f97b64  // b.any
   0x0000fffff7f97b30:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f97b34:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97b38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97b3c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97b40:	54000121	b.ne	0xfffff7f97b64  // b.any
   0x0000fffff7f97b44:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f97b48:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f97b4c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97b50:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97b54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97b58:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f97b5c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f97b60:	14000030	b	0xfffff7f97c20
   0x0000fffff7f97b64:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f97b68:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97b6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97b70:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97b74:	54000120	b.eq	0xfffff7f97b98  // b.none
   0x0000fffff7f97b78:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f97b7c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97b80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97b84:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97b88:	54000321	b.ne	0xfffff7f97bec  // b.any
   0x0000fffff7f97b8c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f97b90:	9e620120	scvtf	d0, x9
   0x0000fffff7f97b94:	14000002	b	0xfffff7f97b9c
   0x0000fffff7f97b98:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f97b9c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f97ba0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97ba4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97ba8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97bac:	54000120	b.eq	0xfffff7f97bd0  // b.none
   0x0000fffff7f97bb0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f97bb4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97bb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97bbc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97bc0:	54000161	b.ne	0xfffff7f97bec  // b.any
   0x0000fffff7f97bc4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f97bc8:	9e620121	scvtf	d1, x9
   0x0000fffff7f97bcc:	14000002	b	0xfffff7f97bd4
   0x0000fffff7f97bd0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f97bd4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f97bd8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f97bdc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97be0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97be4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f97be8:	17ffffde	b	0xfffff7f97b60
   0x0000fffff7f97bec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97bf0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97bf4:	aa1303e1	mov	x1, x19
   0x0000fffff7f97bf8:	aa1503e2	mov	x2, x21
   0x0000fffff7f97bfc:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7f97c00:	aa1403e4	mov	x4, x20
   0x0000fffff7f97c04:	aa1603e5	mov	x5, x22
   0x0000fffff7f97c08:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f97c0c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97c10:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97c14:	d63f0200	blr	x16
   0x0000fffff7f97c18:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97c1c:	54001e20	b.eq	0xfffff7f97fe0  // b.none
   0x0000fffff7f97c20:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f97c24:	f100017f	cmp	x11, #0x0
   0x0000fffff7f97c28:	540004a0	b.eq	0xfffff7f97cbc  // b.none
   0x0000fffff7f97c2c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f97c30:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f97c34:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f97c38:	eb0901bf	cmp	x13, x9
   0x0000fffff7f97c3c:	54000400	b.eq	0xfffff7f97cbc  // b.none
   0x0000fffff7f97c40:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f97c44:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f97c48:	36d801d1	tbz	w17, #27, 0xfffff7f97c80
   0x0000fffff7f97c4c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f97c50:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f97c54:	f100013f	cmp	x9, #0x0
   0x0000fffff7f97c58:	54000321	b.ne	0xfffff7f97cbc  // b.any
   0x0000fffff7f97c5c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f97c60:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f97c64:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f97c68:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f97c6c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f97c70:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f97c74:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f97c78:	f100055f	cmp	x10, #0x1
   0x0000fffff7f97c7c:	54000209	b.ls	0xfffff7f97cbc  // b.plast
   0x0000fffff7f97c80:	36d8008d	tbz	w13, #27, 0xfffff7f97c90
   0x0000fffff7f97c84:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f97c88:	91000529	add	x9, x9, #0x1
   0x0000fffff7f97c8c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f97c90:	36d80091	tbz	w17, #27, 0xfffff7f97ca0
   0x0000fffff7f97c94:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f97c98:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f97c9c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f97ca0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f97ca4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f97ca8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f97cac:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f97cb0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f97cb4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f97cb8:	1400000e	b	0xfffff7f97cf0
   0x0000fffff7f97cbc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f97cc0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97cc4:	aa1303e1	mov	x1, x19
   0x0000fffff7f97cc8:	aa1503e2	mov	x2, x21
   0x0000fffff7f97ccc:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7f97cd0:	aa1403e4	mov	x4, x20
   0x0000fffff7f97cd4:	aa1603e5	mov	x5, x22
   0x0000fffff7f97cd8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f97cdc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97ce0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97ce4:	d63f0200	blr	x16
   0x0000fffff7f97ce8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97cec:	540017e0	b.eq	0xfffff7f97fe8  // b.none
   0x0000fffff7f97cf0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f97cf4:	37d806a9	tbnz	w9, #27, 0xfffff7f97dc8
   0x0000fffff7f97cf8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f97cfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97d00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97d04:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97d08:	540001c1	b.ne	0xfffff7f97d40  // b.any
   0x0000fffff7f97d0c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f97d10:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97d14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97d18:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97d1c:	54000121	b.ne	0xfffff7f97d40  // b.any
   0x0000fffff7f97d20:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f97d24:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f97d28:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97d2c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97d30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97d34:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f97d38:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f97d3c:	14000030	b	0xfffff7f97dfc
   0x0000fffff7f97d40:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f97d44:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97d48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97d4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97d50:	54000120	b.eq	0xfffff7f97d74  // b.none
   0x0000fffff7f97d54:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f97d58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97d5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97d60:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97d64:	54000321	b.ne	0xfffff7f97dc8  // b.any
   0x0000fffff7f97d68:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f97d6c:	9e620120	scvtf	d0, x9
   0x0000fffff7f97d70:	14000002	b	0xfffff7f97d78
   0x0000fffff7f97d74:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f97d78:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f97d7c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97d80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97d84:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97d88:	54000120	b.eq	0xfffff7f97dac  // b.none
   0x0000fffff7f97d8c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f97d90:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97d94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97d98:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97d9c:	54000161	b.ne	0xfffff7f97dc8  // b.any
   0x0000fffff7f97da0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f97da4:	9e620121	scvtf	d1, x9
   0x0000fffff7f97da8:	14000002	b	0xfffff7f97db0
   0x0000fffff7f97dac:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f97db0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f97db4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f97db8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f97dbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97dc0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f97dc4:	17ffffde	b	0xfffff7f97d3c
   0x0000fffff7f97dc8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97dcc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97dd0:	aa1303e1	mov	x1, x19
   0x0000fffff7f97dd4:	aa1503e2	mov	x2, x21
   0x0000fffff7f97dd8:	d2800683	mov	x3, #0x34                  	// #52
   0x0000fffff7f97ddc:	aa1403e4	mov	x4, x20
   0x0000fffff7f97de0:	aa1603e5	mov	x5, x22
   0x0000fffff7f97de4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f97de8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97dec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97df0:	d63f0200	blr	x16
   0x0000fffff7f97df4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97df8:	54000fc0	b.eq	0xfffff7f97ff0  // b.none
   0x0000fffff7f97dfc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f97e00:	37d80269	tbnz	w9, #27, 0xfffff7f97e4c
   0x0000fffff7f97e04:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f97e08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97e0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97e10:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97e14:	540001c1	b.ne	0xfffff7f97e4c  // b.any
   0x0000fffff7f97e18:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f97e1c:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7f97e20:	8b0a012b	add	x11, x9, x10
   0x0000fffff7f97e24:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f97e28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97e2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97e30:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f97e34:	aa0b03e9	mov	x9, x11
   0x0000fffff7f97e38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97e3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97e40:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f97e44:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f97e48:	1400000e	b	0xfffff7f97e80
   0x0000fffff7f97e4c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97e50:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97e54:	aa1303e1	mov	x1, x19
   0x0000fffff7f97e58:	aa1503e2	mov	x2, x21
   0x0000fffff7f97e5c:	d28006a3	mov	x3, #0x35                  	// #53
   0x0000fffff7f97e60:	aa1403e4	mov	x4, x20
   0x0000fffff7f97e64:	aa1603e5	mov	x5, x22
   0x0000fffff7f97e68:	d2916810	mov	x16, #0x8b40                	// #35648
   0x0000fffff7f97e6c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97e70:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97e74:	d63f0200	blr	x16
   0x0000fffff7f97e78:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97e7c:	54000be0	b.eq	0xfffff7f97ff8  // b.none
   0x0000fffff7f97e80:	17fff8d2	b	0xfffff7f961c8
   0x0000fffff7f97e84:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97e88:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97e8c:	aa1303e1	mov	x1, x19
   0x0000fffff7f97e90:	aa1503e2	mov	x2, x21
   0x0000fffff7f97e94:	d28006e3	mov	x3, #0x37                  	// #55
   0x0000fffff7f97e98:	aa1403e4	mov	x4, x20
   0x0000fffff7f97e9c:	aa1603e5	mov	x5, x22
   0x0000fffff7f97ea0:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7f97ea4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97ea8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97eac:	d63f0200	blr	x16
   0x0000fffff7f97eb0:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f97eb4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f97eb8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f97ebc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f97ec0:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f97ec4:	d65f03c0	ret
   0x0000fffff7f97ec8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97ecc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97ed0:	b900028a	str	w10, [x20]
   0x0000fffff7f97ed4:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f97ed8:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f97edc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f97ee0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f97ee4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f97ee8:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f97eec:	d65f03c0	ret
   0x0000fffff7f97ef0:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7f97ef4:	17fffff5	b	0xfffff7f97ec8
   0x0000fffff7f97ef8:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7f97efc:	17fffff3	b	0xfffff7f97ec8
   0x0000fffff7f97f00:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7f97f04:	17fffff1	b	0xfffff7f97ec8
   0x0000fffff7f97f08:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7f97f0c:	17ffffef	b	0xfffff7f97ec8
   0x0000fffff7f97f10:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7f97f14:	17ffffed	b	0xfffff7f97ec8
   0x0000fffff7f97f18:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7f97f1c:	17ffffeb	b	0xfffff7f97ec8
   0x0000fffff7f97f20:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7f97f24:	17ffffe9	b	0xfffff7f97ec8
   0x0000fffff7f97f28:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7f97f2c:	17ffffe7	b	0xfffff7f97ec8
   0x0000fffff7f97f30:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7f97f34:	17ffffe5	b	0xfffff7f97ec8
   0x0000fffff7f97f38:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7f97f3c:	17ffffe3	b	0xfffff7f97ec8
   0x0000fffff7f97f40:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7f97f44:	17ffffe1	b	0xfffff7f97ec8
   0x0000fffff7f97f48:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7f97f4c:	17ffffdf	b	0xfffff7f97ec8
   0x0000fffff7f97f50:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7f97f54:	17ffffdd	b	0xfffff7f97ec8
   0x0000fffff7f97f58:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7f97f5c:	17ffffdb	b	0xfffff7f97ec8
   0x0000fffff7f97f60:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7f97f64:	17ffffd9	b	0xfffff7f97ec8
   0x0000fffff7f97f68:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7f97f6c:	17ffffd7	b	0xfffff7f97ec8
   0x0000fffff7f97f70:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7f97f74:	17ffffd5	b	0xfffff7f97ec8
   0x0000fffff7f97f78:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7f97f7c:	17ffffd3	b	0xfffff7f97ec8
   0x0000fffff7f97f80:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7f97f84:	17ffffd1	b	0xfffff7f97ec8
   0x0000fffff7f97f88:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7f97f8c:	17ffffcf	b	0xfffff7f97ec8
   0x0000fffff7f97f90:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7f97f94:	17ffffcd	b	0xfffff7f97ec8
   0x0000fffff7f97f98:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7f97f9c:	17ffffcb	b	0xfffff7f97ec8
   0x0000fffff7f97fa0:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7f97fa4:	17ffffc9	b	0xfffff7f97ec8
   0x0000fffff7f97fa8:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7f97fac:	17ffffc7	b	0xfffff7f97ec8
   0x0000fffff7f97fb0:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7f97fb4:	17ffffc5	b	0xfffff7f97ec8
   0x0000fffff7f97fb8:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7f97fbc:	17ffffc3	b	0xfffff7f97ec8
   0x0000fffff7f97fc0:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7f97fc4:	17ffffc1	b	0xfffff7f97ec8
   0x0000fffff7f97fc8:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7f97fcc:	17ffffbf	b	0xfffff7f97ec8
   0x0000fffff7f97fd0:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7f97fd4:	17ffffbd	b	0xfffff7f97ec8
   0x0000fffff7f97fd8:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7f97fdc:	17ffffbb	b	0xfffff7f97ec8
   0x0000fffff7f97fe0:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7f97fe4:	17ffffb9	b	0xfffff7f97ec8
   0x0000fffff7f97fe8:	d2800669	mov	x9, #0x33                  	// #51
   0x0000fffff7f97fec:	17ffffb7	b	0xfffff7f97ec8
   0x0000fffff7f97ff0:	d2800689	mov	x9, #0x34                  	// #52
   0x0000fffff7f97ff4:	17ffffb5	b	0xfffff7f97ec8
   0x0000fffff7f97ff8:	d28006a9	mov	x9, #0x35                  	// #53
   0x0000fffff7f97ffc:	17ffffb3	b	0xfffff7f97ec8
End of assembler dump.
