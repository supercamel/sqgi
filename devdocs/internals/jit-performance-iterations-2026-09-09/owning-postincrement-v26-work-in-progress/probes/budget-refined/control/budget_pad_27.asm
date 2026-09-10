Dump of assembler code from 0xfffff7f88000 to 0xfffff7f8a000:
   0x0000fffff7f88000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7f88004:	910003fd	mov	x29, sp
   0x0000fffff7f88008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7f8800c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7f88010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7f88014:	aa0003f3	mov	x19, x0
   0x0000fffff7f88018:	aa0103f4	mov	x20, x1
   0x0000fffff7f8801c:	aa0203f5	mov	x21, x2
   0x0000fffff7f88020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7f88024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7f88028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f8802c:	f90003e9	str	x9, [sp]
   0x0000fffff7f88030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7f88034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7f88038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7f8803c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f88040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f88044:	d63f0200	blr	x16
   0x0000fffff7f88048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7f8804c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7f88050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7f88054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7f88058:	14000001	b	0xfffff7f8805c
   0x0000fffff7f8805c:	14000001	b	0xfffff7f88060
   0x0000fffff7f88060:	14000001	b	0xfffff7f88064
   0x0000fffff7f88064:	14000001	b	0xfffff7f88068
   0x0000fffff7f88068:	14000001	b	0xfffff7f8806c
   0x0000fffff7f8806c:	14000001	b	0xfffff7f88070
   0x0000fffff7f88070:	14000001	b	0xfffff7f88074
   0x0000fffff7f88074:	14000001	b	0xfffff7f88078
   0x0000fffff7f88078:	14000001	b	0xfffff7f8807c
   0x0000fffff7f8807c:	14000001	b	0xfffff7f88080
   0x0000fffff7f88080:	14000001	b	0xfffff7f88084
   0x0000fffff7f88084:	14000001	b	0xfffff7f88088
   0x0000fffff7f88088:	14000001	b	0xfffff7f8808c
   0x0000fffff7f8808c:	14000001	b	0xfffff7f88090
   0x0000fffff7f88090:	14000001	b	0xfffff7f88094
   0x0000fffff7f88094:	14000001	b	0xfffff7f88098
   0x0000fffff7f88098:	14000001	b	0xfffff7f8809c
   0x0000fffff7f8809c:	14000001	b	0xfffff7f880a0
   0x0000fffff7f880a0:	14000001	b	0xfffff7f880a4
   0x0000fffff7f880a4:	14000001	b	0xfffff7f880a8
   0x0000fffff7f880a8:	14000001	b	0xfffff7f880ac
   0x0000fffff7f880ac:	14000001	b	0xfffff7f880b0
   0x0000fffff7f880b0:	14000001	b	0xfffff7f880b4
   0x0000fffff7f880b4:	14000001	b	0xfffff7f880b8
   0x0000fffff7f880b8:	14000001	b	0xfffff7f880bc
   0x0000fffff7f880bc:	14000001	b	0xfffff7f880c0
   0x0000fffff7f880c0:	14000001	b	0xfffff7f880c4
   0x0000fffff7f880c4:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f880c8:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f880cc:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f880d0:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7f880d4:	36d80211	tbz	w17, #27, 0xfffff7f88114
   0x0000fffff7f880d8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f880dc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f880e0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f880e4:	540001e1	b.ne	0xfffff7f88120  // b.any
   0x0000fffff7f880e8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f880ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f880f0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f880f4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f880f8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f880fc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f88100:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f88104:	f100055f	cmp	x10, #0x1
   0x0000fffff7f88108:	540000c9	b.ls	0xfffff7f88120  // b.plast
   0x0000fffff7f8810c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f88110:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f88114:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f88118:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f8811c:	1400000e	b	0xfffff7f88154
   0x0000fffff7f88120:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f88124:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f88128:	aa1303e1	mov	x1, x19
   0x0000fffff7f8812c:	aa1503e2	mov	x2, x21
   0x0000fffff7f88130:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7f88134:	aa1403e4	mov	x4, x20
   0x0000fffff7f88138:	aa1603e5	mov	x5, x22
   0x0000fffff7f8813c:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7f88140:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f88144:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f88148:	d63f0200	blr	x16
   0x0000fffff7f8814c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f88150:	5400e940	b.eq	0xfffff7f89e78  // b.none
   0x0000fffff7f88154:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f88158:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f8815c:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f88160:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7f88164:	36d80211	tbz	w17, #27, 0xfffff7f881a4
   0x0000fffff7f88168:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8816c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f88170:	f100013f	cmp	x9, #0x0
   0x0000fffff7f88174:	540001e1	b.ne	0xfffff7f881b0  // b.any
   0x0000fffff7f88178:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f8817c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f88180:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f88184:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f88188:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8818c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f88190:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f88194:	f100055f	cmp	x10, #0x1
   0x0000fffff7f88198:	540000c9	b.ls	0xfffff7f881b0  // b.plast
   0x0000fffff7f8819c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f881a0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f881a4:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f881a8:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f881ac:	1400000e	b	0xfffff7f881e4
   0x0000fffff7f881b0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f881b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f881b8:	aa1303e1	mov	x1, x19
   0x0000fffff7f881bc:	aa1503e2	mov	x2, x21
   0x0000fffff7f881c0:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7f881c4:	aa1403e4	mov	x4, x20
   0x0000fffff7f881c8:	aa1603e5	mov	x5, x22
   0x0000fffff7f881cc:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7f881d0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f881d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f881d8:	d63f0200	blr	x16
   0x0000fffff7f881dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f881e0:	5400e500	b.eq	0xfffff7f89e80  // b.none
   0x0000fffff7f881e4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f881e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f881ec:	aa1303e1	mov	x1, x19
   0x0000fffff7f881f0:	aa1503e2	mov	x2, x21
   0x0000fffff7f881f4:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7f881f8:	aa1403e4	mov	x4, x20
   0x0000fffff7f881fc:	aa1603e5	mov	x5, x22
   0x0000fffff7f88200:	d28fec90	mov	x16, #0x7f64                	// #32612
   0x0000fffff7f88204:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f88208:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8820c:	d63f0200	blr	x16
   0x0000fffff7f88210:	f100001f	cmp	x0, #0x0
   0x0000fffff7f88214:	5400e3a0	b.eq	0xfffff7f89e88  // b.none
   0x0000fffff7f88218:	f100041f	cmp	x0, #0x1
   0x0000fffff7f8821c:	5400df80	b.eq	0xfffff7f89e0c  // b.none
   0x0000fffff7f88220:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f88224:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f88228:	d299d20c	mov	x12, #0xce90                	// #52880
   0x0000fffff7f8822c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f88230:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f88234:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7f88238:	36d801d1	tbz	w17, #27, 0xfffff7f88270
   0x0000fffff7f8823c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f88240:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f88244:	f100013f	cmp	x9, #0x0
   0x0000fffff7f88248:	54000281	b.ne	0xfffff7f88298  // b.any
   0x0000fffff7f8824c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f88250:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f88254:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f88258:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8825c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f88260:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f88264:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f88268:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8826c:	54000169	b.ls	0xfffff7f88298  // b.plast
   0x0000fffff7f88270:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f88274:	91000529	add	x9, x9, #0x1
   0x0000fffff7f88278:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8827c:	36d80091	tbz	w17, #27, 0xfffff7f8828c
   0x0000fffff7f88280:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f88284:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f88288:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8828c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f88290:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f88294:	1400000e	b	0xfffff7f882cc
   0x0000fffff7f88298:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8829c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f882a0:	aa1303e1	mov	x1, x19
   0x0000fffff7f882a4:	aa1503e2	mov	x2, x21
   0x0000fffff7f882a8:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7f882ac:	aa1403e4	mov	x4, x20
   0x0000fffff7f882b0:	aa1603e5	mov	x5, x22
   0x0000fffff7f882b4:	d2933c10	mov	x16, #0x99e0                	// #39392
   0x0000fffff7f882b8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f882bc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f882c0:	d63f0200	blr	x16
   0x0000fffff7f882c4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f882c8:	5400de40	b.eq	0xfffff7f89e90  // b.none
   0x0000fffff7f882cc:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f882d0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f882d4:	540003a0	b.eq	0xfffff7f88348  // b.none
   0x0000fffff7f882d8:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7f882dc:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7f882e0:	b9400171	ldr	w17, [x11]
   0x0000fffff7f882e4:	36d801d1	tbz	w17, #27, 0xfffff7f8831c
   0x0000fffff7f882e8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f882ec:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f882f0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f882f4:	540002a1	b.ne	0xfffff7f88348  // b.any
   0x0000fffff7f882f8:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f882fc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f88300:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f88304:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f88308:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8830c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f88310:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f88314:	f100055f	cmp	x10, #0x1
   0x0000fffff7f88318:	54000189	b.ls	0xfffff7f88348  // b.plast
   0x0000fffff7f8831c:	36d8008d	tbz	w13, #27, 0xfffff7f8832c
   0x0000fffff7f88320:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f88324:	91000529	add	x9, x9, #0x1
   0x0000fffff7f88328:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8832c:	36d80091	tbz	w17, #27, 0xfffff7f8833c
   0x0000fffff7f88330:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f88334:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f88338:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8833c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f88340:	b900016d	str	w13, [x11]
   0x0000fffff7f88344:	1400000e	b	0xfffff7f8837c
   0x0000fffff7f88348:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f8834c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f88350:	aa1303e1	mov	x1, x19
   0x0000fffff7f88354:	aa1503e2	mov	x2, x21
   0x0000fffff7f88358:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7f8835c:	aa1403e4	mov	x4, x20
   0x0000fffff7f88360:	aa1603e5	mov	x5, x22
   0x0000fffff7f88364:	d29e2e10	mov	x16, #0xf170                	// #61808
   0x0000fffff7f88368:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8836c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f88370:	d63f0200	blr	x16
   0x0000fffff7f88374:	f100001f	cmp	x0, #0x0
   0x0000fffff7f88378:	5400d900	b.eq	0xfffff7f89e98  // b.none
   0x0000fffff7f8837c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f88380:	f100017f	cmp	x11, #0x0
   0x0000fffff7f88384:	540004a0	b.eq	0xfffff7f88418  // b.none
   0x0000fffff7f88388:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8838c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f88390:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f88394:	eb0901bf	cmp	x13, x9
   0x0000fffff7f88398:	54000400	b.eq	0xfffff7f88418  // b.none
   0x0000fffff7f8839c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f883a0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f883a4:	36d801d1	tbz	w17, #27, 0xfffff7f883dc
   0x0000fffff7f883a8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f883ac:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f883b0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f883b4:	54000321	b.ne	0xfffff7f88418  // b.any
   0x0000fffff7f883b8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f883bc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f883c0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f883c4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f883c8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f883cc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f883d0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f883d4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f883d8:	54000209	b.ls	0xfffff7f88418  // b.plast
   0x0000fffff7f883dc:	36d8008d	tbz	w13, #27, 0xfffff7f883ec
   0x0000fffff7f883e0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f883e4:	91000529	add	x9, x9, #0x1
   0x0000fffff7f883e8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f883ec:	36d80091	tbz	w17, #27, 0xfffff7f883fc
   0x0000fffff7f883f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f883f4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f883f8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f883fc:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f88400:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f88404:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f88408:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8840c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f88410:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f88414:	1400000e	b	0xfffff7f8844c
   0x0000fffff7f88418:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8841c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f88420:	aa1303e1	mov	x1, x19
   0x0000fffff7f88424:	aa1503e2	mov	x2, x21
   0x0000fffff7f88428:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7f8842c:	aa1403e4	mov	x4, x20
   0x0000fffff7f88430:	aa1603e5	mov	x5, x22
   0x0000fffff7f88434:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f88438:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8843c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f88440:	d63f0200	blr	x16
   0x0000fffff7f88444:	f100001f	cmp	x0, #0x0
   0x0000fffff7f88448:	5400d2c0	b.eq	0xfffff7f89ea0  // b.none
   0x0000fffff7f8844c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f88450:	37d806a9	tbnz	w9, #27, 0xfffff7f88524
   0x0000fffff7f88454:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f88458:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8845c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88460:	eb0a013f	cmp	x9, x10
   0x0000fffff7f88464:	540001c1	b.ne	0xfffff7f8849c  // b.any
   0x0000fffff7f88468:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8846c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f88470:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88474:	eb0a013f	cmp	x9, x10
   0x0000fffff7f88478:	54000121	b.ne	0xfffff7f8849c  // b.any
   0x0000fffff7f8847c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f88480:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f88484:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f88488:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8848c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88490:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f88494:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f88498:	14000030	b	0xfffff7f88558
   0x0000fffff7f8849c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f884a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f884a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f884a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f884ac:	54000120	b.eq	0xfffff7f884d0  // b.none
   0x0000fffff7f884b0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f884b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f884b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f884bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f884c0:	54000321	b.ne	0xfffff7f88524  // b.any
   0x0000fffff7f884c4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f884c8:	9e620120	scvtf	d0, x9
   0x0000fffff7f884cc:	14000002	b	0xfffff7f884d4
   0x0000fffff7f884d0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f884d4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f884d8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f884dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f884e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f884e4:	54000120	b.eq	0xfffff7f88508  // b.none
   0x0000fffff7f884e8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f884ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f884f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f884f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f884f8:	54000161	b.ne	0xfffff7f88524  // b.any
   0x0000fffff7f884fc:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f88500:	9e620121	scvtf	d1, x9
   0x0000fffff7f88504:	14000002	b	0xfffff7f8850c
   0x0000fffff7f88508:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8850c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f88510:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f88514:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f88518:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8851c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f88520:	17ffffde	b	0xfffff7f88498
   0x0000fffff7f88524:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f88528:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8852c:	aa1303e1	mov	x1, x19
   0x0000fffff7f88530:	aa1503e2	mov	x2, x21
   0x0000fffff7f88534:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7f88538:	aa1403e4	mov	x4, x20
   0x0000fffff7f8853c:	aa1603e5	mov	x5, x22
   0x0000fffff7f88540:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f88544:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f88548:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8854c:	d63f0200	blr	x16
   0x0000fffff7f88550:	f100001f	cmp	x0, #0x0
   0x0000fffff7f88554:	5400caa0	b.eq	0xfffff7f89ea8  // b.none
   0x0000fffff7f88558:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8855c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f88560:	540004a0	b.eq	0xfffff7f885f4  // b.none
   0x0000fffff7f88564:	b940016d	ldr	w13, [x11]
   0x0000fffff7f88568:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8856c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f88570:	eb0901bf	cmp	x13, x9
   0x0000fffff7f88574:	54000400	b.eq	0xfffff7f885f4  // b.none
   0x0000fffff7f88578:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8857c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f88580:	36d801d1	tbz	w17, #27, 0xfffff7f885b8
   0x0000fffff7f88584:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f88588:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8858c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f88590:	54000321	b.ne	0xfffff7f885f4  // b.any
   0x0000fffff7f88594:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f88598:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8859c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f885a0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f885a4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f885a8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f885ac:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f885b0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f885b4:	54000209	b.ls	0xfffff7f885f4  // b.plast
   0x0000fffff7f885b8:	36d8008d	tbz	w13, #27, 0xfffff7f885c8
   0x0000fffff7f885bc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f885c0:	91000529	add	x9, x9, #0x1
   0x0000fffff7f885c4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f885c8:	36d80091	tbz	w17, #27, 0xfffff7f885d8
   0x0000fffff7f885cc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f885d0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f885d4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f885d8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f885dc:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f885e0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f885e4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f885e8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f885ec:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f885f0:	1400000e	b	0xfffff7f88628
   0x0000fffff7f885f4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f885f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f885fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f88600:	aa1503e2	mov	x2, x21
   0x0000fffff7f88604:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7f88608:	aa1403e4	mov	x4, x20
   0x0000fffff7f8860c:	aa1603e5	mov	x5, x22
   0x0000fffff7f88610:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f88614:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f88618:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8861c:	d63f0200	blr	x16
   0x0000fffff7f88620:	f100001f	cmp	x0, #0x0
   0x0000fffff7f88624:	5400c460	b.eq	0xfffff7f89eb0  // b.none
   0x0000fffff7f88628:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8862c:	37d806a9	tbnz	w9, #27, 0xfffff7f88700
   0x0000fffff7f88630:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f88634:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f88638:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8863c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f88640:	540001c1	b.ne	0xfffff7f88678  // b.any
   0x0000fffff7f88644:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f88648:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8864c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88650:	eb0a013f	cmp	x9, x10
   0x0000fffff7f88654:	54000121	b.ne	0xfffff7f88678  // b.any
   0x0000fffff7f88658:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8865c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f88660:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f88664:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f88668:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8866c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f88670:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f88674:	14000030	b	0xfffff7f88734
   0x0000fffff7f88678:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8867c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f88680:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88684:	eb0a013f	cmp	x9, x10
   0x0000fffff7f88688:	54000120	b.eq	0xfffff7f886ac  // b.none
   0x0000fffff7f8868c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f88690:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f88694:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88698:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8869c:	54000321	b.ne	0xfffff7f88700  // b.any
   0x0000fffff7f886a0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f886a4:	9e620120	scvtf	d0, x9
   0x0000fffff7f886a8:	14000002	b	0xfffff7f886b0
   0x0000fffff7f886ac:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f886b0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f886b4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f886b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f886bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f886c0:	54000120	b.eq	0xfffff7f886e4  // b.none
   0x0000fffff7f886c4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f886c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f886cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f886d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f886d4:	54000161	b.ne	0xfffff7f88700  // b.any
   0x0000fffff7f886d8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f886dc:	9e620121	scvtf	d1, x9
   0x0000fffff7f886e0:	14000002	b	0xfffff7f886e8
   0x0000fffff7f886e4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f886e8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f886ec:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f886f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f886f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f886f8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f886fc:	17ffffde	b	0xfffff7f88674
   0x0000fffff7f88700:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f88704:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f88708:	aa1303e1	mov	x1, x19
   0x0000fffff7f8870c:	aa1503e2	mov	x2, x21
   0x0000fffff7f88710:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7f88714:	aa1403e4	mov	x4, x20
   0x0000fffff7f88718:	aa1603e5	mov	x5, x22
   0x0000fffff7f8871c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f88720:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f88724:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f88728:	d63f0200	blr	x16
   0x0000fffff7f8872c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f88730:	5400bc40	b.eq	0xfffff7f89eb8  // b.none
   0x0000fffff7f88734:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f88738:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8873c:	540004a0	b.eq	0xfffff7f887d0  // b.none
   0x0000fffff7f88740:	b940016d	ldr	w13, [x11]
   0x0000fffff7f88744:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f88748:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8874c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f88750:	54000400	b.eq	0xfffff7f887d0  // b.none
   0x0000fffff7f88754:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f88758:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8875c:	36d801d1	tbz	w17, #27, 0xfffff7f88794
   0x0000fffff7f88760:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f88764:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f88768:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8876c:	54000321	b.ne	0xfffff7f887d0  // b.any
   0x0000fffff7f88770:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f88774:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f88778:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8877c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f88780:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f88784:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f88788:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8878c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f88790:	54000209	b.ls	0xfffff7f887d0  // b.plast
   0x0000fffff7f88794:	36d8008d	tbz	w13, #27, 0xfffff7f887a4
   0x0000fffff7f88798:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8879c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f887a0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f887a4:	36d80091	tbz	w17, #27, 0xfffff7f887b4
   0x0000fffff7f887a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f887ac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f887b0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f887b4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f887b8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f887bc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f887c0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f887c4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f887c8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f887cc:	1400000e	b	0xfffff7f88804
   0x0000fffff7f887d0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f887d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f887d8:	aa1303e1	mov	x1, x19
   0x0000fffff7f887dc:	aa1503e2	mov	x2, x21
   0x0000fffff7f887e0:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7f887e4:	aa1403e4	mov	x4, x20
   0x0000fffff7f887e8:	aa1603e5	mov	x5, x22
   0x0000fffff7f887ec:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f887f0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f887f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f887f8:	d63f0200	blr	x16
   0x0000fffff7f887fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f88800:	5400b600	b.eq	0xfffff7f89ec0  // b.none
   0x0000fffff7f88804:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f88808:	37d806a9	tbnz	w9, #27, 0xfffff7f888dc
   0x0000fffff7f8880c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f88810:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f88814:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88818:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8881c:	540001c1	b.ne	0xfffff7f88854  // b.any
   0x0000fffff7f88820:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f88824:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f88828:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8882c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f88830:	54000121	b.ne	0xfffff7f88854  // b.any
   0x0000fffff7f88834:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f88838:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8883c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f88840:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f88844:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88848:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8884c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f88850:	14000030	b	0xfffff7f88910
   0x0000fffff7f88854:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f88858:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8885c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88860:	eb0a013f	cmp	x9, x10
   0x0000fffff7f88864:	54000120	b.eq	0xfffff7f88888  // b.none
   0x0000fffff7f88868:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8886c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f88870:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88874:	eb0a013f	cmp	x9, x10
   0x0000fffff7f88878:	54000321	b.ne	0xfffff7f888dc  // b.any
   0x0000fffff7f8887c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f88880:	9e620120	scvtf	d0, x9
   0x0000fffff7f88884:	14000002	b	0xfffff7f8888c
   0x0000fffff7f88888:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8888c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f88890:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f88894:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88898:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8889c:	54000120	b.eq	0xfffff7f888c0  // b.none
   0x0000fffff7f888a0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f888a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f888a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f888ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f888b0:	54000161	b.ne	0xfffff7f888dc  // b.any
   0x0000fffff7f888b4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f888b8:	9e620121	scvtf	d1, x9
   0x0000fffff7f888bc:	14000002	b	0xfffff7f888c4
   0x0000fffff7f888c0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f888c4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f888c8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f888cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f888d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f888d4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f888d8:	17ffffde	b	0xfffff7f88850
   0x0000fffff7f888dc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f888e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f888e4:	aa1303e1	mov	x1, x19
   0x0000fffff7f888e8:	aa1503e2	mov	x2, x21
   0x0000fffff7f888ec:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7f888f0:	aa1403e4	mov	x4, x20
   0x0000fffff7f888f4:	aa1603e5	mov	x5, x22
   0x0000fffff7f888f8:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f888fc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f88900:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f88904:	d63f0200	blr	x16
   0x0000fffff7f88908:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8890c:	5400ade0	b.eq	0xfffff7f89ec8  // b.none
   0x0000fffff7f88910:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f88914:	f100017f	cmp	x11, #0x0
   0x0000fffff7f88918:	540004a0	b.eq	0xfffff7f889ac  // b.none
   0x0000fffff7f8891c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f88920:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f88924:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f88928:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8892c:	54000400	b.eq	0xfffff7f889ac  // b.none
   0x0000fffff7f88930:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f88934:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f88938:	36d801d1	tbz	w17, #27, 0xfffff7f88970
   0x0000fffff7f8893c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f88940:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f88944:	f100013f	cmp	x9, #0x0
   0x0000fffff7f88948:	54000321	b.ne	0xfffff7f889ac  // b.any
   0x0000fffff7f8894c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f88950:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f88954:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f88958:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8895c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f88960:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f88964:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f88968:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8896c:	54000209	b.ls	0xfffff7f889ac  // b.plast
   0x0000fffff7f88970:	36d8008d	tbz	w13, #27, 0xfffff7f88980
   0x0000fffff7f88974:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f88978:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8897c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f88980:	36d80091	tbz	w17, #27, 0xfffff7f88990
   0x0000fffff7f88984:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f88988:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8898c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f88990:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f88994:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f88998:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8899c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f889a0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f889a4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f889a8:	1400000e	b	0xfffff7f889e0
   0x0000fffff7f889ac:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f889b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f889b4:	aa1303e1	mov	x1, x19
   0x0000fffff7f889b8:	aa1503e2	mov	x2, x21
   0x0000fffff7f889bc:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7f889c0:	aa1403e4	mov	x4, x20
   0x0000fffff7f889c4:	aa1603e5	mov	x5, x22
   0x0000fffff7f889c8:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f889cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f889d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f889d4:	d63f0200	blr	x16
   0x0000fffff7f889d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f889dc:	5400a7a0	b.eq	0xfffff7f89ed0  // b.none
   0x0000fffff7f889e0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f889e4:	37d806a9	tbnz	w9, #27, 0xfffff7f88ab8
   0x0000fffff7f889e8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f889ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f889f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f889f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f889f8:	540001c1	b.ne	0xfffff7f88a30  // b.any
   0x0000fffff7f889fc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f88a00:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f88a04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88a08:	eb0a013f	cmp	x9, x10
   0x0000fffff7f88a0c:	54000121	b.ne	0xfffff7f88a30  // b.any
   0x0000fffff7f88a10:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f88a14:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f88a18:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f88a1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f88a20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88a24:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f88a28:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f88a2c:	14000030	b	0xfffff7f88aec
   0x0000fffff7f88a30:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f88a34:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f88a38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88a3c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f88a40:	54000120	b.eq	0xfffff7f88a64  // b.none
   0x0000fffff7f88a44:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f88a48:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f88a4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88a50:	eb0a013f	cmp	x9, x10
   0x0000fffff7f88a54:	54000321	b.ne	0xfffff7f88ab8  // b.any
   0x0000fffff7f88a58:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f88a5c:	9e620120	scvtf	d0, x9
   0x0000fffff7f88a60:	14000002	b	0xfffff7f88a68
   0x0000fffff7f88a64:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f88a68:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f88a6c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f88a70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88a74:	eb0a013f	cmp	x9, x10
   0x0000fffff7f88a78:	54000120	b.eq	0xfffff7f88a9c  // b.none
   0x0000fffff7f88a7c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f88a80:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f88a84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88a88:	eb0a013f	cmp	x9, x10
   0x0000fffff7f88a8c:	54000161	b.ne	0xfffff7f88ab8  // b.any
   0x0000fffff7f88a90:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f88a94:	9e620121	scvtf	d1, x9
   0x0000fffff7f88a98:	14000002	b	0xfffff7f88aa0
   0x0000fffff7f88a9c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f88aa0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f88aa4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f88aa8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f88aac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88ab0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f88ab4:	17ffffde	b	0xfffff7f88a2c
   0x0000fffff7f88ab8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f88abc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f88ac0:	aa1303e1	mov	x1, x19
   0x0000fffff7f88ac4:	aa1503e2	mov	x2, x21
   0x0000fffff7f88ac8:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7f88acc:	aa1403e4	mov	x4, x20
   0x0000fffff7f88ad0:	aa1603e5	mov	x5, x22
   0x0000fffff7f88ad4:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f88ad8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f88adc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f88ae0:	d63f0200	blr	x16
   0x0000fffff7f88ae4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f88ae8:	54009f80	b.eq	0xfffff7f89ed8  // b.none
   0x0000fffff7f88aec:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f88af0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f88af4:	540004a0	b.eq	0xfffff7f88b88  // b.none
   0x0000fffff7f88af8:	b940016d	ldr	w13, [x11]
   0x0000fffff7f88afc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f88b00:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f88b04:	eb0901bf	cmp	x13, x9
   0x0000fffff7f88b08:	54000400	b.eq	0xfffff7f88b88  // b.none
   0x0000fffff7f88b0c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f88b10:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f88b14:	36d801d1	tbz	w17, #27, 0xfffff7f88b4c
   0x0000fffff7f88b18:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f88b1c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f88b20:	f100013f	cmp	x9, #0x0
   0x0000fffff7f88b24:	54000321	b.ne	0xfffff7f88b88  // b.any
   0x0000fffff7f88b28:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f88b2c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f88b30:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f88b34:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f88b38:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f88b3c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f88b40:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f88b44:	f100055f	cmp	x10, #0x1
   0x0000fffff7f88b48:	54000209	b.ls	0xfffff7f88b88  // b.plast
   0x0000fffff7f88b4c:	36d8008d	tbz	w13, #27, 0xfffff7f88b5c
   0x0000fffff7f88b50:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f88b54:	91000529	add	x9, x9, #0x1
   0x0000fffff7f88b58:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f88b5c:	36d80091	tbz	w17, #27, 0xfffff7f88b6c
   0x0000fffff7f88b60:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f88b64:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f88b68:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f88b6c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f88b70:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f88b74:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f88b78:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f88b7c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f88b80:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f88b84:	1400000e	b	0xfffff7f88bbc
   0x0000fffff7f88b88:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f88b8c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f88b90:	aa1303e1	mov	x1, x19
   0x0000fffff7f88b94:	aa1503e2	mov	x2, x21
   0x0000fffff7f88b98:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7f88b9c:	aa1403e4	mov	x4, x20
   0x0000fffff7f88ba0:	aa1603e5	mov	x5, x22
   0x0000fffff7f88ba4:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f88ba8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f88bac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f88bb0:	d63f0200	blr	x16
   0x0000fffff7f88bb4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f88bb8:	54009940	b.eq	0xfffff7f89ee0  // b.none
   0x0000fffff7f88bbc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f88bc0:	37d806a9	tbnz	w9, #27, 0xfffff7f88c94
   0x0000fffff7f88bc4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f88bc8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f88bcc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88bd0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f88bd4:	540001c1	b.ne	0xfffff7f88c0c  // b.any
   0x0000fffff7f88bd8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f88bdc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f88be0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88be4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f88be8:	54000121	b.ne	0xfffff7f88c0c  // b.any
   0x0000fffff7f88bec:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f88bf0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f88bf4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f88bf8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f88bfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88c00:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f88c04:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f88c08:	14000030	b	0xfffff7f88cc8
   0x0000fffff7f88c0c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f88c10:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f88c14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88c18:	eb0a013f	cmp	x9, x10
   0x0000fffff7f88c1c:	54000120	b.eq	0xfffff7f88c40  // b.none
   0x0000fffff7f88c20:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f88c24:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f88c28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88c2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f88c30:	54000321	b.ne	0xfffff7f88c94  // b.any
   0x0000fffff7f88c34:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f88c38:	9e620120	scvtf	d0, x9
   0x0000fffff7f88c3c:	14000002	b	0xfffff7f88c44
   0x0000fffff7f88c40:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f88c44:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f88c48:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f88c4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88c50:	eb0a013f	cmp	x9, x10
   0x0000fffff7f88c54:	54000120	b.eq	0xfffff7f88c78  // b.none
   0x0000fffff7f88c58:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f88c5c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f88c60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88c64:	eb0a013f	cmp	x9, x10
   0x0000fffff7f88c68:	54000161	b.ne	0xfffff7f88c94  // b.any
   0x0000fffff7f88c6c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f88c70:	9e620121	scvtf	d1, x9
   0x0000fffff7f88c74:	14000002	b	0xfffff7f88c7c
   0x0000fffff7f88c78:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f88c7c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f88c80:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f88c84:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f88c88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88c8c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f88c90:	17ffffde	b	0xfffff7f88c08
   0x0000fffff7f88c94:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f88c98:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f88c9c:	aa1303e1	mov	x1, x19
   0x0000fffff7f88ca0:	aa1503e2	mov	x2, x21
   0x0000fffff7f88ca4:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7f88ca8:	aa1403e4	mov	x4, x20
   0x0000fffff7f88cac:	aa1603e5	mov	x5, x22
   0x0000fffff7f88cb0:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f88cb4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f88cb8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f88cbc:	d63f0200	blr	x16
   0x0000fffff7f88cc0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f88cc4:	54009120	b.eq	0xfffff7f89ee8  // b.none
   0x0000fffff7f88cc8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f88ccc:	f100017f	cmp	x11, #0x0
   0x0000fffff7f88cd0:	540004a0	b.eq	0xfffff7f88d64  // b.none
   0x0000fffff7f88cd4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f88cd8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f88cdc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f88ce0:	eb0901bf	cmp	x13, x9
   0x0000fffff7f88ce4:	54000400	b.eq	0xfffff7f88d64  // b.none
   0x0000fffff7f88ce8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f88cec:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f88cf0:	36d801d1	tbz	w17, #27, 0xfffff7f88d28
   0x0000fffff7f88cf4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f88cf8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f88cfc:	f100013f	cmp	x9, #0x0
   0x0000fffff7f88d00:	54000321	b.ne	0xfffff7f88d64  // b.any
   0x0000fffff7f88d04:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f88d08:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f88d0c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f88d10:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f88d14:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f88d18:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f88d1c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f88d20:	f100055f	cmp	x10, #0x1
   0x0000fffff7f88d24:	54000209	b.ls	0xfffff7f88d64  // b.plast
   0x0000fffff7f88d28:	36d8008d	tbz	w13, #27, 0xfffff7f88d38
   0x0000fffff7f88d2c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f88d30:	91000529	add	x9, x9, #0x1
   0x0000fffff7f88d34:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f88d38:	36d80091	tbz	w17, #27, 0xfffff7f88d48
   0x0000fffff7f88d3c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f88d40:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f88d44:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f88d48:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f88d4c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f88d50:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f88d54:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f88d58:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f88d5c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f88d60:	1400000e	b	0xfffff7f88d98
   0x0000fffff7f88d64:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f88d68:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f88d6c:	aa1303e1	mov	x1, x19
   0x0000fffff7f88d70:	aa1503e2	mov	x2, x21
   0x0000fffff7f88d74:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7f88d78:	aa1403e4	mov	x4, x20
   0x0000fffff7f88d7c:	aa1603e5	mov	x5, x22
   0x0000fffff7f88d80:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f88d84:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f88d88:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f88d8c:	d63f0200	blr	x16
   0x0000fffff7f88d90:	f100001f	cmp	x0, #0x0
   0x0000fffff7f88d94:	54008ae0	b.eq	0xfffff7f89ef0  // b.none
   0x0000fffff7f88d98:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f88d9c:	37d806a9	tbnz	w9, #27, 0xfffff7f88e70
   0x0000fffff7f88da0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f88da4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f88da8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88dac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f88db0:	540001c1	b.ne	0xfffff7f88de8  // b.any
   0x0000fffff7f88db4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f88db8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f88dbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88dc0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f88dc4:	54000121	b.ne	0xfffff7f88de8  // b.any
   0x0000fffff7f88dc8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f88dcc:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f88dd0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f88dd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f88dd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88ddc:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f88de0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f88de4:	14000030	b	0xfffff7f88ea4
   0x0000fffff7f88de8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f88dec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f88df0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88df4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f88df8:	54000120	b.eq	0xfffff7f88e1c  // b.none
   0x0000fffff7f88dfc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f88e00:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f88e04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88e08:	eb0a013f	cmp	x9, x10
   0x0000fffff7f88e0c:	54000321	b.ne	0xfffff7f88e70  // b.any
   0x0000fffff7f88e10:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f88e14:	9e620120	scvtf	d0, x9
   0x0000fffff7f88e18:	14000002	b	0xfffff7f88e20
   0x0000fffff7f88e1c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f88e20:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f88e24:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f88e28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88e2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f88e30:	54000120	b.eq	0xfffff7f88e54  // b.none
   0x0000fffff7f88e34:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f88e38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f88e3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88e40:	eb0a013f	cmp	x9, x10
   0x0000fffff7f88e44:	54000161	b.ne	0xfffff7f88e70  // b.any
   0x0000fffff7f88e48:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f88e4c:	9e620121	scvtf	d1, x9
   0x0000fffff7f88e50:	14000002	b	0xfffff7f88e58
   0x0000fffff7f88e54:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f88e58:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f88e5c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f88e60:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f88e64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88e68:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f88e6c:	17ffffde	b	0xfffff7f88de4
   0x0000fffff7f88e70:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f88e74:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f88e78:	aa1303e1	mov	x1, x19
   0x0000fffff7f88e7c:	aa1503e2	mov	x2, x21
   0x0000fffff7f88e80:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7f88e84:	aa1403e4	mov	x4, x20
   0x0000fffff7f88e88:	aa1603e5	mov	x5, x22
   0x0000fffff7f88e8c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f88e90:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f88e94:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f88e98:	d63f0200	blr	x16
   0x0000fffff7f88e9c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f88ea0:	540082c0	b.eq	0xfffff7f89ef8  // b.none
   0x0000fffff7f88ea4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f88ea8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f88eac:	540004a0	b.eq	0xfffff7f88f40  // b.none
   0x0000fffff7f88eb0:	b940016d	ldr	w13, [x11]
   0x0000fffff7f88eb4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f88eb8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f88ebc:	eb0901bf	cmp	x13, x9
   0x0000fffff7f88ec0:	54000400	b.eq	0xfffff7f88f40  // b.none
   0x0000fffff7f88ec4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f88ec8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f88ecc:	36d801d1	tbz	w17, #27, 0xfffff7f88f04
   0x0000fffff7f88ed0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f88ed4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f88ed8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f88edc:	54000321	b.ne	0xfffff7f88f40  // b.any
   0x0000fffff7f88ee0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f88ee4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f88ee8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f88eec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f88ef0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f88ef4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f88ef8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f88efc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f88f00:	54000209	b.ls	0xfffff7f88f40  // b.plast
   0x0000fffff7f88f04:	36d8008d	tbz	w13, #27, 0xfffff7f88f14
   0x0000fffff7f88f08:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f88f0c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f88f10:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f88f14:	36d80091	tbz	w17, #27, 0xfffff7f88f24
   0x0000fffff7f88f18:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f88f1c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f88f20:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f88f24:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f88f28:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f88f2c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f88f30:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f88f34:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f88f38:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f88f3c:	1400000e	b	0xfffff7f88f74
   0x0000fffff7f88f40:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f88f44:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f88f48:	aa1303e1	mov	x1, x19
   0x0000fffff7f88f4c:	aa1503e2	mov	x2, x21
   0x0000fffff7f88f50:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7f88f54:	aa1403e4	mov	x4, x20
   0x0000fffff7f88f58:	aa1603e5	mov	x5, x22
   0x0000fffff7f88f5c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f88f60:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f88f64:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f88f68:	d63f0200	blr	x16
   0x0000fffff7f88f6c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f88f70:	54007c80	b.eq	0xfffff7f89f00  // b.none
   0x0000fffff7f88f74:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f88f78:	37d806a9	tbnz	w9, #27, 0xfffff7f8904c
   0x0000fffff7f88f7c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f88f80:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f88f84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88f88:	eb0a013f	cmp	x9, x10
   0x0000fffff7f88f8c:	540001c1	b.ne	0xfffff7f88fc4  // b.any
   0x0000fffff7f88f90:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f88f94:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f88f98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88f9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f88fa0:	54000121	b.ne	0xfffff7f88fc4  // b.any
   0x0000fffff7f88fa4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f88fa8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f88fac:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f88fb0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f88fb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88fb8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f88fbc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f88fc0:	14000030	b	0xfffff7f89080
   0x0000fffff7f88fc4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f88fc8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f88fcc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88fd0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f88fd4:	54000120	b.eq	0xfffff7f88ff8  // b.none
   0x0000fffff7f88fd8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f88fdc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f88fe0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f88fe4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f88fe8:	54000321	b.ne	0xfffff7f8904c  // b.any
   0x0000fffff7f88fec:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f88ff0:	9e620120	scvtf	d0, x9
   0x0000fffff7f88ff4:	14000002	b	0xfffff7f88ffc
   0x0000fffff7f88ff8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f88ffc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f89000:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f89004:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89008:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8900c:	54000120	b.eq	0xfffff7f89030  // b.none
   0x0000fffff7f89010:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f89014:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f89018:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8901c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f89020:	54000161	b.ne	0xfffff7f8904c  // b.any
   0x0000fffff7f89024:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f89028:	9e620121	scvtf	d1, x9
   0x0000fffff7f8902c:	14000002	b	0xfffff7f89034
   0x0000fffff7f89030:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f89034:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f89038:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8903c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f89040:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89044:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f89048:	17ffffde	b	0xfffff7f88fc0
   0x0000fffff7f8904c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f89050:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f89054:	aa1303e1	mov	x1, x19
   0x0000fffff7f89058:	aa1503e2	mov	x2, x21
   0x0000fffff7f8905c:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7f89060:	aa1403e4	mov	x4, x20
   0x0000fffff7f89064:	aa1603e5	mov	x5, x22
   0x0000fffff7f89068:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f8906c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f89070:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f89074:	d63f0200	blr	x16
   0x0000fffff7f89078:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8907c:	54007460	b.eq	0xfffff7f89f08  // b.none
   0x0000fffff7f89080:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f89084:	f100017f	cmp	x11, #0x0
   0x0000fffff7f89088:	540004a0	b.eq	0xfffff7f8911c  // b.none
   0x0000fffff7f8908c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f89090:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f89094:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f89098:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8909c:	54000400	b.eq	0xfffff7f8911c  // b.none
   0x0000fffff7f890a0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f890a4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f890a8:	36d801d1	tbz	w17, #27, 0xfffff7f890e0
   0x0000fffff7f890ac:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f890b0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f890b4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f890b8:	54000321	b.ne	0xfffff7f8911c  // b.any
   0x0000fffff7f890bc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f890c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f890c4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f890c8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f890cc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f890d0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f890d4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f890d8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f890dc:	54000209	b.ls	0xfffff7f8911c  // b.plast
   0x0000fffff7f890e0:	36d8008d	tbz	w13, #27, 0xfffff7f890f0
   0x0000fffff7f890e4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f890e8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f890ec:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f890f0:	36d80091	tbz	w17, #27, 0xfffff7f89100
   0x0000fffff7f890f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f890f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f890fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f89100:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f89104:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f89108:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8910c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f89110:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f89114:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f89118:	1400000e	b	0xfffff7f89150
   0x0000fffff7f8911c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f89120:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f89124:	aa1303e1	mov	x1, x19
   0x0000fffff7f89128:	aa1503e2	mov	x2, x21
   0x0000fffff7f8912c:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7f89130:	aa1403e4	mov	x4, x20
   0x0000fffff7f89134:	aa1603e5	mov	x5, x22
   0x0000fffff7f89138:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f8913c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f89140:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f89144:	d63f0200	blr	x16
   0x0000fffff7f89148:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8914c:	54006e20	b.eq	0xfffff7f89f10  // b.none
   0x0000fffff7f89150:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f89154:	37d806a9	tbnz	w9, #27, 0xfffff7f89228
   0x0000fffff7f89158:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8915c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f89160:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89164:	eb0a013f	cmp	x9, x10
   0x0000fffff7f89168:	540001c1	b.ne	0xfffff7f891a0  // b.any
   0x0000fffff7f8916c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f89170:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f89174:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89178:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8917c:	54000121	b.ne	0xfffff7f891a0  // b.any
   0x0000fffff7f89180:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f89184:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f89188:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8918c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f89190:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89194:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f89198:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8919c:	14000030	b	0xfffff7f8925c
   0x0000fffff7f891a0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f891a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f891a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f891ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f891b0:	54000120	b.eq	0xfffff7f891d4  // b.none
   0x0000fffff7f891b4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f891b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f891bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f891c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f891c4:	54000321	b.ne	0xfffff7f89228  // b.any
   0x0000fffff7f891c8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f891cc:	9e620120	scvtf	d0, x9
   0x0000fffff7f891d0:	14000002	b	0xfffff7f891d8
   0x0000fffff7f891d4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f891d8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f891dc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f891e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f891e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f891e8:	54000120	b.eq	0xfffff7f8920c  // b.none
   0x0000fffff7f891ec:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f891f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f891f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f891f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f891fc:	54000161	b.ne	0xfffff7f89228  // b.any
   0x0000fffff7f89200:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f89204:	9e620121	scvtf	d1, x9
   0x0000fffff7f89208:	14000002	b	0xfffff7f89210
   0x0000fffff7f8920c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f89210:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f89214:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f89218:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8921c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89220:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f89224:	17ffffde	b	0xfffff7f8919c
   0x0000fffff7f89228:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8922c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f89230:	aa1303e1	mov	x1, x19
   0x0000fffff7f89234:	aa1503e2	mov	x2, x21
   0x0000fffff7f89238:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7f8923c:	aa1403e4	mov	x4, x20
   0x0000fffff7f89240:	aa1603e5	mov	x5, x22
   0x0000fffff7f89244:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f89248:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8924c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f89250:	d63f0200	blr	x16
   0x0000fffff7f89254:	f100001f	cmp	x0, #0x0
   0x0000fffff7f89258:	54006600	b.eq	0xfffff7f89f18  // b.none
   0x0000fffff7f8925c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f89260:	f100017f	cmp	x11, #0x0
   0x0000fffff7f89264:	540004a0	b.eq	0xfffff7f892f8  // b.none
   0x0000fffff7f89268:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8926c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f89270:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f89274:	eb0901bf	cmp	x13, x9
   0x0000fffff7f89278:	54000400	b.eq	0xfffff7f892f8  // b.none
   0x0000fffff7f8927c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f89280:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f89284:	36d801d1	tbz	w17, #27, 0xfffff7f892bc
   0x0000fffff7f89288:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8928c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f89290:	f100013f	cmp	x9, #0x0
   0x0000fffff7f89294:	54000321	b.ne	0xfffff7f892f8  // b.any
   0x0000fffff7f89298:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8929c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f892a0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f892a4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f892a8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f892ac:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f892b0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f892b4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f892b8:	54000209	b.ls	0xfffff7f892f8  // b.plast
   0x0000fffff7f892bc:	36d8008d	tbz	w13, #27, 0xfffff7f892cc
   0x0000fffff7f892c0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f892c4:	91000529	add	x9, x9, #0x1
   0x0000fffff7f892c8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f892cc:	36d80091	tbz	w17, #27, 0xfffff7f892dc
   0x0000fffff7f892d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f892d4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f892d8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f892dc:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f892e0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f892e4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f892e8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f892ec:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f892f0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f892f4:	1400000e	b	0xfffff7f8932c
   0x0000fffff7f892f8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f892fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f89300:	aa1303e1	mov	x1, x19
   0x0000fffff7f89304:	aa1503e2	mov	x2, x21
   0x0000fffff7f89308:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7f8930c:	aa1403e4	mov	x4, x20
   0x0000fffff7f89310:	aa1603e5	mov	x5, x22
   0x0000fffff7f89314:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f89318:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8931c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f89320:	d63f0200	blr	x16
   0x0000fffff7f89324:	f100001f	cmp	x0, #0x0
   0x0000fffff7f89328:	54005fc0	b.eq	0xfffff7f89f20  // b.none
   0x0000fffff7f8932c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f89330:	37d806a9	tbnz	w9, #27, 0xfffff7f89404
   0x0000fffff7f89334:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f89338:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8933c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89340:	eb0a013f	cmp	x9, x10
   0x0000fffff7f89344:	540001c1	b.ne	0xfffff7f8937c  // b.any
   0x0000fffff7f89348:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8934c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f89350:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89354:	eb0a013f	cmp	x9, x10
   0x0000fffff7f89358:	54000121	b.ne	0xfffff7f8937c  // b.any
   0x0000fffff7f8935c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f89360:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f89364:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f89368:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8936c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89370:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f89374:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f89378:	14000030	b	0xfffff7f89438
   0x0000fffff7f8937c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f89380:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f89384:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89388:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8938c:	54000120	b.eq	0xfffff7f893b0  // b.none
   0x0000fffff7f89390:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f89394:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f89398:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8939c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f893a0:	54000321	b.ne	0xfffff7f89404  // b.any
   0x0000fffff7f893a4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f893a8:	9e620120	scvtf	d0, x9
   0x0000fffff7f893ac:	14000002	b	0xfffff7f893b4
   0x0000fffff7f893b0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f893b4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f893b8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f893bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f893c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f893c4:	54000120	b.eq	0xfffff7f893e8  // b.none
   0x0000fffff7f893c8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f893cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f893d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f893d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f893d8:	54000161	b.ne	0xfffff7f89404  // b.any
   0x0000fffff7f893dc:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f893e0:	9e620121	scvtf	d1, x9
   0x0000fffff7f893e4:	14000002	b	0xfffff7f893ec
   0x0000fffff7f893e8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f893ec:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f893f0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f893f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f893f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f893fc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f89400:	17ffffde	b	0xfffff7f89378
   0x0000fffff7f89404:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f89408:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8940c:	aa1303e1	mov	x1, x19
   0x0000fffff7f89410:	aa1503e2	mov	x2, x21
   0x0000fffff7f89414:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7f89418:	aa1403e4	mov	x4, x20
   0x0000fffff7f8941c:	aa1603e5	mov	x5, x22
   0x0000fffff7f89420:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f89424:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f89428:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8942c:	d63f0200	blr	x16
   0x0000fffff7f89430:	f100001f	cmp	x0, #0x0
   0x0000fffff7f89434:	540057a0	b.eq	0xfffff7f89f28  // b.none
   0x0000fffff7f89438:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8943c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f89440:	540004a0	b.eq	0xfffff7f894d4  // b.none
   0x0000fffff7f89444:	b940016d	ldr	w13, [x11]
   0x0000fffff7f89448:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8944c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f89450:	eb0901bf	cmp	x13, x9
   0x0000fffff7f89454:	54000400	b.eq	0xfffff7f894d4  // b.none
   0x0000fffff7f89458:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8945c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f89460:	36d801d1	tbz	w17, #27, 0xfffff7f89498
   0x0000fffff7f89464:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f89468:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8946c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f89470:	54000321	b.ne	0xfffff7f894d4  // b.any
   0x0000fffff7f89474:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f89478:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8947c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f89480:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f89484:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f89488:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8948c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f89490:	f100055f	cmp	x10, #0x1
   0x0000fffff7f89494:	54000209	b.ls	0xfffff7f894d4  // b.plast
   0x0000fffff7f89498:	36d8008d	tbz	w13, #27, 0xfffff7f894a8
   0x0000fffff7f8949c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f894a0:	91000529	add	x9, x9, #0x1
   0x0000fffff7f894a4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f894a8:	36d80091	tbz	w17, #27, 0xfffff7f894b8
   0x0000fffff7f894ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f894b0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f894b4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f894b8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f894bc:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f894c0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f894c4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f894c8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f894cc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f894d0:	1400000e	b	0xfffff7f89508
   0x0000fffff7f894d4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f894d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f894dc:	aa1303e1	mov	x1, x19
   0x0000fffff7f894e0:	aa1503e2	mov	x2, x21
   0x0000fffff7f894e4:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7f894e8:	aa1403e4	mov	x4, x20
   0x0000fffff7f894ec:	aa1603e5	mov	x5, x22
   0x0000fffff7f894f0:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f894f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f894f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f894fc:	d63f0200	blr	x16
   0x0000fffff7f89500:	f100001f	cmp	x0, #0x0
   0x0000fffff7f89504:	54005160	b.eq	0xfffff7f89f30  // b.none
   0x0000fffff7f89508:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8950c:	37d806a9	tbnz	w9, #27, 0xfffff7f895e0
   0x0000fffff7f89510:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f89514:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f89518:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8951c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f89520:	540001c1	b.ne	0xfffff7f89558  // b.any
   0x0000fffff7f89524:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f89528:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8952c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89530:	eb0a013f	cmp	x9, x10
   0x0000fffff7f89534:	54000121	b.ne	0xfffff7f89558  // b.any
   0x0000fffff7f89538:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8953c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f89540:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f89544:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f89548:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8954c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f89550:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f89554:	14000030	b	0xfffff7f89614
   0x0000fffff7f89558:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8955c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f89560:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89564:	eb0a013f	cmp	x9, x10
   0x0000fffff7f89568:	54000120	b.eq	0xfffff7f8958c  // b.none
   0x0000fffff7f8956c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f89570:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f89574:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89578:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8957c:	54000321	b.ne	0xfffff7f895e0  // b.any
   0x0000fffff7f89580:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f89584:	9e620120	scvtf	d0, x9
   0x0000fffff7f89588:	14000002	b	0xfffff7f89590
   0x0000fffff7f8958c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f89590:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f89594:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f89598:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8959c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f895a0:	54000120	b.eq	0xfffff7f895c4  // b.none
   0x0000fffff7f895a4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f895a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f895ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f895b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f895b4:	54000161	b.ne	0xfffff7f895e0  // b.any
   0x0000fffff7f895b8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f895bc:	9e620121	scvtf	d1, x9
   0x0000fffff7f895c0:	14000002	b	0xfffff7f895c8
   0x0000fffff7f895c4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f895c8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f895cc:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f895d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f895d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f895d8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f895dc:	17ffffde	b	0xfffff7f89554
   0x0000fffff7f895e0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f895e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f895e8:	aa1303e1	mov	x1, x19
   0x0000fffff7f895ec:	aa1503e2	mov	x2, x21
   0x0000fffff7f895f0:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7f895f4:	aa1403e4	mov	x4, x20
   0x0000fffff7f895f8:	aa1603e5	mov	x5, x22
   0x0000fffff7f895fc:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f89600:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f89604:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f89608:	d63f0200	blr	x16
   0x0000fffff7f8960c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f89610:	54004940	b.eq	0xfffff7f89f38  // b.none
   0x0000fffff7f89614:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f89618:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8961c:	540004a0	b.eq	0xfffff7f896b0  // b.none
   0x0000fffff7f89620:	b940016d	ldr	w13, [x11]
   0x0000fffff7f89624:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f89628:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8962c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f89630:	54000400	b.eq	0xfffff7f896b0  // b.none
   0x0000fffff7f89634:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f89638:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8963c:	36d801d1	tbz	w17, #27, 0xfffff7f89674
   0x0000fffff7f89640:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f89644:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f89648:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8964c:	54000321	b.ne	0xfffff7f896b0  // b.any
   0x0000fffff7f89650:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f89654:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f89658:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8965c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f89660:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f89664:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f89668:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8966c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f89670:	54000209	b.ls	0xfffff7f896b0  // b.plast
   0x0000fffff7f89674:	36d8008d	tbz	w13, #27, 0xfffff7f89684
   0x0000fffff7f89678:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8967c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f89680:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f89684:	36d80091	tbz	w17, #27, 0xfffff7f89694
   0x0000fffff7f89688:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8968c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f89690:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f89694:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f89698:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8969c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f896a0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f896a4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f896a8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f896ac:	1400000e	b	0xfffff7f896e4
   0x0000fffff7f896b0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f896b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f896b8:	aa1303e1	mov	x1, x19
   0x0000fffff7f896bc:	aa1503e2	mov	x2, x21
   0x0000fffff7f896c0:	d2800683	mov	x3, #0x34                  	// #52
   0x0000fffff7f896c4:	aa1403e4	mov	x4, x20
   0x0000fffff7f896c8:	aa1603e5	mov	x5, x22
   0x0000fffff7f896cc:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f896d0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f896d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f896d8:	d63f0200	blr	x16
   0x0000fffff7f896dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f896e0:	54004300	b.eq	0xfffff7f89f40  // b.none
   0x0000fffff7f896e4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f896e8:	37d806a9	tbnz	w9, #27, 0xfffff7f897bc
   0x0000fffff7f896ec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f896f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f896f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f896f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f896fc:	540001c1	b.ne	0xfffff7f89734  // b.any
   0x0000fffff7f89700:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f89704:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f89708:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8970c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f89710:	54000121	b.ne	0xfffff7f89734  // b.any
   0x0000fffff7f89714:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f89718:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8971c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f89720:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f89724:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89728:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8972c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f89730:	14000030	b	0xfffff7f897f0
   0x0000fffff7f89734:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f89738:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8973c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89740:	eb0a013f	cmp	x9, x10
   0x0000fffff7f89744:	54000120	b.eq	0xfffff7f89768  // b.none
   0x0000fffff7f89748:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8974c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f89750:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89754:	eb0a013f	cmp	x9, x10
   0x0000fffff7f89758:	54000321	b.ne	0xfffff7f897bc  // b.any
   0x0000fffff7f8975c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f89760:	9e620120	scvtf	d0, x9
   0x0000fffff7f89764:	14000002	b	0xfffff7f8976c
   0x0000fffff7f89768:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8976c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f89770:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f89774:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89778:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8977c:	54000120	b.eq	0xfffff7f897a0  // b.none
   0x0000fffff7f89780:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f89784:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f89788:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8978c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f89790:	54000161	b.ne	0xfffff7f897bc  // b.any
   0x0000fffff7f89794:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f89798:	9e620121	scvtf	d1, x9
   0x0000fffff7f8979c:	14000002	b	0xfffff7f897a4
   0x0000fffff7f897a0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f897a4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f897a8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f897ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f897b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f897b4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f897b8:	17ffffde	b	0xfffff7f89730
   0x0000fffff7f897bc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f897c0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f897c4:	aa1303e1	mov	x1, x19
   0x0000fffff7f897c8:	aa1503e2	mov	x2, x21
   0x0000fffff7f897cc:	d28006a3	mov	x3, #0x35                  	// #53
   0x0000fffff7f897d0:	aa1403e4	mov	x4, x20
   0x0000fffff7f897d4:	aa1603e5	mov	x5, x22
   0x0000fffff7f897d8:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f897dc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f897e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f897e4:	d63f0200	blr	x16
   0x0000fffff7f897e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f897ec:	54003ae0	b.eq	0xfffff7f89f48  // b.none
   0x0000fffff7f897f0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f897f4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f897f8:	540004a0	b.eq	0xfffff7f8988c  // b.none
   0x0000fffff7f897fc:	b940016d	ldr	w13, [x11]
   0x0000fffff7f89800:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f89804:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f89808:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8980c:	54000400	b.eq	0xfffff7f8988c  // b.none
   0x0000fffff7f89810:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f89814:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f89818:	36d801d1	tbz	w17, #27, 0xfffff7f89850
   0x0000fffff7f8981c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f89820:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f89824:	f100013f	cmp	x9, #0x0
   0x0000fffff7f89828:	54000321	b.ne	0xfffff7f8988c  // b.any
   0x0000fffff7f8982c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f89830:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f89834:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f89838:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8983c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f89840:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f89844:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f89848:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8984c:	54000209	b.ls	0xfffff7f8988c  // b.plast
   0x0000fffff7f89850:	36d8008d	tbz	w13, #27, 0xfffff7f89860
   0x0000fffff7f89854:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f89858:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8985c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f89860:	36d80091	tbz	w17, #27, 0xfffff7f89870
   0x0000fffff7f89864:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f89868:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8986c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f89870:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f89874:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f89878:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8987c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f89880:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f89884:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f89888:	1400000e	b	0xfffff7f898c0
   0x0000fffff7f8988c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f89890:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f89894:	aa1303e1	mov	x1, x19
   0x0000fffff7f89898:	aa1503e2	mov	x2, x21
   0x0000fffff7f8989c:	d28006c3	mov	x3, #0x36                  	// #54
   0x0000fffff7f898a0:	aa1403e4	mov	x4, x20
   0x0000fffff7f898a4:	aa1603e5	mov	x5, x22
   0x0000fffff7f898a8:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f898ac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f898b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f898b4:	d63f0200	blr	x16
   0x0000fffff7f898b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f898bc:	540034a0	b.eq	0xfffff7f89f50  // b.none
   0x0000fffff7f898c0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f898c4:	37d806a9	tbnz	w9, #27, 0xfffff7f89998
   0x0000fffff7f898c8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f898cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f898d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f898d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f898d8:	540001c1	b.ne	0xfffff7f89910  // b.any
   0x0000fffff7f898dc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f898e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f898e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f898e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f898ec:	54000121	b.ne	0xfffff7f89910  // b.any
   0x0000fffff7f898f0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f898f4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f898f8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f898fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f89900:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89904:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f89908:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8990c:	14000030	b	0xfffff7f899cc
   0x0000fffff7f89910:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f89914:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f89918:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8991c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f89920:	54000120	b.eq	0xfffff7f89944  // b.none
   0x0000fffff7f89924:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f89928:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8992c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89930:	eb0a013f	cmp	x9, x10
   0x0000fffff7f89934:	54000321	b.ne	0xfffff7f89998  // b.any
   0x0000fffff7f89938:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8993c:	9e620120	scvtf	d0, x9
   0x0000fffff7f89940:	14000002	b	0xfffff7f89948
   0x0000fffff7f89944:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f89948:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8994c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f89950:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89954:	eb0a013f	cmp	x9, x10
   0x0000fffff7f89958:	54000120	b.eq	0xfffff7f8997c  // b.none
   0x0000fffff7f8995c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f89960:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f89964:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89968:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8996c:	54000161	b.ne	0xfffff7f89998  // b.any
   0x0000fffff7f89970:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f89974:	9e620121	scvtf	d1, x9
   0x0000fffff7f89978:	14000002	b	0xfffff7f89980
   0x0000fffff7f8997c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f89980:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f89984:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f89988:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8998c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89990:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f89994:	17ffffde	b	0xfffff7f8990c
   0x0000fffff7f89998:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8999c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f899a0:	aa1303e1	mov	x1, x19
   0x0000fffff7f899a4:	aa1503e2	mov	x2, x21
   0x0000fffff7f899a8:	d28006e3	mov	x3, #0x37                  	// #55
   0x0000fffff7f899ac:	aa1403e4	mov	x4, x20
   0x0000fffff7f899b0:	aa1603e5	mov	x5, x22
   0x0000fffff7f899b4:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f899b8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f899bc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f899c0:	d63f0200	blr	x16
   0x0000fffff7f899c4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f899c8:	54002c80	b.eq	0xfffff7f89f58  // b.none
   0x0000fffff7f899cc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f899d0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f899d4:	540004a0	b.eq	0xfffff7f89a68  // b.none
   0x0000fffff7f899d8:	b940016d	ldr	w13, [x11]
   0x0000fffff7f899dc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f899e0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f899e4:	eb0901bf	cmp	x13, x9
   0x0000fffff7f899e8:	54000400	b.eq	0xfffff7f89a68  // b.none
   0x0000fffff7f899ec:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f899f0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f899f4:	36d801d1	tbz	w17, #27, 0xfffff7f89a2c
   0x0000fffff7f899f8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f899fc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f89a00:	f100013f	cmp	x9, #0x0
   0x0000fffff7f89a04:	54000321	b.ne	0xfffff7f89a68  // b.any
   0x0000fffff7f89a08:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f89a0c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f89a10:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f89a14:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f89a18:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f89a1c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f89a20:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f89a24:	f100055f	cmp	x10, #0x1
   0x0000fffff7f89a28:	54000209	b.ls	0xfffff7f89a68  // b.plast
   0x0000fffff7f89a2c:	36d8008d	tbz	w13, #27, 0xfffff7f89a3c
   0x0000fffff7f89a30:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f89a34:	91000529	add	x9, x9, #0x1
   0x0000fffff7f89a38:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f89a3c:	36d80091	tbz	w17, #27, 0xfffff7f89a4c
   0x0000fffff7f89a40:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f89a44:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f89a48:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f89a4c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f89a50:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f89a54:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f89a58:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f89a5c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f89a60:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f89a64:	1400000e	b	0xfffff7f89a9c
   0x0000fffff7f89a68:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f89a6c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f89a70:	aa1303e1	mov	x1, x19
   0x0000fffff7f89a74:	aa1503e2	mov	x2, x21
   0x0000fffff7f89a78:	d2800703	mov	x3, #0x38                  	// #56
   0x0000fffff7f89a7c:	aa1403e4	mov	x4, x20
   0x0000fffff7f89a80:	aa1603e5	mov	x5, x22
   0x0000fffff7f89a84:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f89a88:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f89a8c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f89a90:	d63f0200	blr	x16
   0x0000fffff7f89a94:	f100001f	cmp	x0, #0x0
   0x0000fffff7f89a98:	54002640	b.eq	0xfffff7f89f60  // b.none
   0x0000fffff7f89a9c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f89aa0:	37d806a9	tbnz	w9, #27, 0xfffff7f89b74
   0x0000fffff7f89aa4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f89aa8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f89aac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89ab0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f89ab4:	540001c1	b.ne	0xfffff7f89aec  // b.any
   0x0000fffff7f89ab8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f89abc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f89ac0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89ac4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f89ac8:	54000121	b.ne	0xfffff7f89aec  // b.any
   0x0000fffff7f89acc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f89ad0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f89ad4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f89ad8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f89adc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89ae0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f89ae4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f89ae8:	14000030	b	0xfffff7f89ba8
   0x0000fffff7f89aec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f89af0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f89af4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89af8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f89afc:	54000120	b.eq	0xfffff7f89b20  // b.none
   0x0000fffff7f89b00:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f89b04:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f89b08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89b0c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f89b10:	54000321	b.ne	0xfffff7f89b74  // b.any
   0x0000fffff7f89b14:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f89b18:	9e620120	scvtf	d0, x9
   0x0000fffff7f89b1c:	14000002	b	0xfffff7f89b24
   0x0000fffff7f89b20:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f89b24:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f89b28:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f89b2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89b30:	eb0a013f	cmp	x9, x10
   0x0000fffff7f89b34:	54000120	b.eq	0xfffff7f89b58  // b.none
   0x0000fffff7f89b38:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f89b3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f89b40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89b44:	eb0a013f	cmp	x9, x10
   0x0000fffff7f89b48:	54000161	b.ne	0xfffff7f89b74  // b.any
   0x0000fffff7f89b4c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f89b50:	9e620121	scvtf	d1, x9
   0x0000fffff7f89b54:	14000002	b	0xfffff7f89b5c
   0x0000fffff7f89b58:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f89b5c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f89b60:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f89b64:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f89b68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89b6c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f89b70:	17ffffde	b	0xfffff7f89ae8
   0x0000fffff7f89b74:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f89b78:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f89b7c:	aa1303e1	mov	x1, x19
   0x0000fffff7f89b80:	aa1503e2	mov	x2, x21
   0x0000fffff7f89b84:	d2800723	mov	x3, #0x39                  	// #57
   0x0000fffff7f89b88:	aa1403e4	mov	x4, x20
   0x0000fffff7f89b8c:	aa1603e5	mov	x5, x22
   0x0000fffff7f89b90:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f89b94:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f89b98:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f89b9c:	d63f0200	blr	x16
   0x0000fffff7f89ba0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f89ba4:	54001e20	b.eq	0xfffff7f89f68  // b.none
   0x0000fffff7f89ba8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f89bac:	f100017f	cmp	x11, #0x0
   0x0000fffff7f89bb0:	540004a0	b.eq	0xfffff7f89c44  // b.none
   0x0000fffff7f89bb4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f89bb8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f89bbc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f89bc0:	eb0901bf	cmp	x13, x9
   0x0000fffff7f89bc4:	54000400	b.eq	0xfffff7f89c44  // b.none
   0x0000fffff7f89bc8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f89bcc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f89bd0:	36d801d1	tbz	w17, #27, 0xfffff7f89c08
   0x0000fffff7f89bd4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f89bd8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f89bdc:	f100013f	cmp	x9, #0x0
   0x0000fffff7f89be0:	54000321	b.ne	0xfffff7f89c44  // b.any
   0x0000fffff7f89be4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f89be8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f89bec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f89bf0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f89bf4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f89bf8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f89bfc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f89c00:	f100055f	cmp	x10, #0x1
   0x0000fffff7f89c04:	54000209	b.ls	0xfffff7f89c44  // b.plast
   0x0000fffff7f89c08:	36d8008d	tbz	w13, #27, 0xfffff7f89c18
   0x0000fffff7f89c0c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f89c10:	91000529	add	x9, x9, #0x1
   0x0000fffff7f89c14:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f89c18:	36d80091	tbz	w17, #27, 0xfffff7f89c28
   0x0000fffff7f89c1c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f89c20:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f89c24:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f89c28:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f89c2c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f89c30:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f89c34:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f89c38:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f89c3c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f89c40:	1400000e	b	0xfffff7f89c78
   0x0000fffff7f89c44:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f89c48:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f89c4c:	aa1303e1	mov	x1, x19
   0x0000fffff7f89c50:	aa1503e2	mov	x2, x21
   0x0000fffff7f89c54:	d2800743	mov	x3, #0x3a                  	// #58
   0x0000fffff7f89c58:	aa1403e4	mov	x4, x20
   0x0000fffff7f89c5c:	aa1603e5	mov	x5, x22
   0x0000fffff7f89c60:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f89c64:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f89c68:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f89c6c:	d63f0200	blr	x16
   0x0000fffff7f89c70:	f100001f	cmp	x0, #0x0
   0x0000fffff7f89c74:	540017e0	b.eq	0xfffff7f89f70  // b.none
   0x0000fffff7f89c78:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f89c7c:	37d806a9	tbnz	w9, #27, 0xfffff7f89d50
   0x0000fffff7f89c80:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f89c84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f89c88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89c8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f89c90:	540001c1	b.ne	0xfffff7f89cc8  // b.any
   0x0000fffff7f89c94:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f89c98:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f89c9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89ca0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f89ca4:	54000121	b.ne	0xfffff7f89cc8  // b.any
   0x0000fffff7f89ca8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f89cac:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f89cb0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f89cb4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f89cb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89cbc:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f89cc0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f89cc4:	14000030	b	0xfffff7f89d84
   0x0000fffff7f89cc8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f89ccc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f89cd0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89cd4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f89cd8:	54000120	b.eq	0xfffff7f89cfc  // b.none
   0x0000fffff7f89cdc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f89ce0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f89ce4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89ce8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f89cec:	54000321	b.ne	0xfffff7f89d50  // b.any
   0x0000fffff7f89cf0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f89cf4:	9e620120	scvtf	d0, x9
   0x0000fffff7f89cf8:	14000002	b	0xfffff7f89d00
   0x0000fffff7f89cfc:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f89d00:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f89d04:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f89d08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89d0c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f89d10:	54000120	b.eq	0xfffff7f89d34  // b.none
   0x0000fffff7f89d14:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f89d18:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f89d1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89d20:	eb0a013f	cmp	x9, x10
   0x0000fffff7f89d24:	54000161	b.ne	0xfffff7f89d50  // b.any
   0x0000fffff7f89d28:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f89d2c:	9e620121	scvtf	d1, x9
   0x0000fffff7f89d30:	14000002	b	0xfffff7f89d38
   0x0000fffff7f89d34:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f89d38:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f89d3c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f89d40:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f89d44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89d48:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f89d4c:	17ffffde	b	0xfffff7f89cc4
   0x0000fffff7f89d50:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f89d54:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f89d58:	aa1303e1	mov	x1, x19
   0x0000fffff7f89d5c:	aa1503e2	mov	x2, x21
   0x0000fffff7f89d60:	d2800763	mov	x3, #0x3b                  	// #59
   0x0000fffff7f89d64:	aa1403e4	mov	x4, x20
   0x0000fffff7f89d68:	aa1603e5	mov	x5, x22
   0x0000fffff7f89d6c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f89d70:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f89d74:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f89d78:	d63f0200	blr	x16
   0x0000fffff7f89d7c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f89d80:	54000fc0	b.eq	0xfffff7f89f78  // b.none
   0x0000fffff7f89d84:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f89d88:	37d80269	tbnz	w9, #27, 0xfffff7f89dd4
   0x0000fffff7f89d8c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f89d90:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f89d94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89d98:	eb0a013f	cmp	x9, x10
   0x0000fffff7f89d9c:	540001c1	b.ne	0xfffff7f89dd4  // b.any
   0x0000fffff7f89da0:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f89da4:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7f89da8:	8b0a012b	add	x11, x9, x10
   0x0000fffff7f89dac:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f89db0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f89db4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89db8:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f89dbc:	aa0b03e9	mov	x9, x11
   0x0000fffff7f89dc0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f89dc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89dc8:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f89dcc:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f89dd0:	1400000e	b	0xfffff7f89e08
   0x0000fffff7f89dd4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f89dd8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f89ddc:	aa1303e1	mov	x1, x19
   0x0000fffff7f89de0:	aa1503e2	mov	x2, x21
   0x0000fffff7f89de4:	d2800783	mov	x3, #0x3c                  	// #60
   0x0000fffff7f89de8:	aa1403e4	mov	x4, x20
   0x0000fffff7f89dec:	aa1603e5	mov	x5, x22
   0x0000fffff7f89df0:	d290bc10	mov	x16, #0x85e0                	// #34272
   0x0000fffff7f89df4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f89df8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f89dfc:	d63f0200	blr	x16
   0x0000fffff7f89e00:	f100001f	cmp	x0, #0x0
   0x0000fffff7f89e04:	54000be0	b.eq	0xfffff7f89f80  // b.none
   0x0000fffff7f89e08:	17fff8f7	b	0xfffff7f881e4
   0x0000fffff7f89e0c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f89e10:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f89e14:	aa1303e1	mov	x1, x19
   0x0000fffff7f89e18:	aa1503e2	mov	x2, x21
   0x0000fffff7f89e1c:	d28007c3	mov	x3, #0x3e                  	// #62
   0x0000fffff7f89e20:	aa1403e4	mov	x4, x20
   0x0000fffff7f89e24:	aa1603e5	mov	x5, x22
   0x0000fffff7f89e28:	d286be90	mov	x16, #0x35f4                	// #13812
   0x0000fffff7f89e2c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f89e30:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f89e34:	d63f0200	blr	x16
   0x0000fffff7f89e38:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f89e3c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f89e40:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f89e44:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f89e48:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f89e4c:	d65f03c0	ret
   0x0000fffff7f89e50:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f89e54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f89e58:	b900028a	str	w10, [x20]
   0x0000fffff7f89e5c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f89e60:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f89e64:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f89e68:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f89e6c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f89e70:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f89e74:	d65f03c0	ret
   0x0000fffff7f89e78:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7f89e7c:	17fffff5	b	0xfffff7f89e50
   0x0000fffff7f89e80:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7f89e84:	17fffff3	b	0xfffff7f89e50
   0x0000fffff7f89e88:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7f89e8c:	17fffff1	b	0xfffff7f89e50
   0x0000fffff7f89e90:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7f89e94:	17ffffef	b	0xfffff7f89e50
   0x0000fffff7f89e98:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7f89e9c:	17ffffed	b	0xfffff7f89e50
   0x0000fffff7f89ea0:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7f89ea4:	17ffffeb	b	0xfffff7f89e50
   0x0000fffff7f89ea8:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7f89eac:	17ffffe9	b	0xfffff7f89e50
   0x0000fffff7f89eb0:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7f89eb4:	17ffffe7	b	0xfffff7f89e50
   0x0000fffff7f89eb8:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7f89ebc:	17ffffe5	b	0xfffff7f89e50
   0x0000fffff7f89ec0:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7f89ec4:	17ffffe3	b	0xfffff7f89e50
   0x0000fffff7f89ec8:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7f89ecc:	17ffffe1	b	0xfffff7f89e50
   0x0000fffff7f89ed0:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7f89ed4:	17ffffdf	b	0xfffff7f89e50
   0x0000fffff7f89ed8:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7f89edc:	17ffffdd	b	0xfffff7f89e50
   0x0000fffff7f89ee0:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7f89ee4:	17ffffdb	b	0xfffff7f89e50
   0x0000fffff7f89ee8:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7f89eec:	17ffffd9	b	0xfffff7f89e50
   0x0000fffff7f89ef0:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7f89ef4:	17ffffd7	b	0xfffff7f89e50
   0x0000fffff7f89ef8:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7f89efc:	17ffffd5	b	0xfffff7f89e50
   0x0000fffff7f89f00:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7f89f04:	17ffffd3	b	0xfffff7f89e50
   0x0000fffff7f89f08:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7f89f0c:	17ffffd1	b	0xfffff7f89e50
   0x0000fffff7f89f10:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7f89f14:	17ffffcf	b	0xfffff7f89e50
   0x0000fffff7f89f18:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7f89f1c:	17ffffcd	b	0xfffff7f89e50
   0x0000fffff7f89f20:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7f89f24:	17ffffcb	b	0xfffff7f89e50
   0x0000fffff7f89f28:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7f89f2c:	17ffffc9	b	0xfffff7f89e50
   0x0000fffff7f89f30:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7f89f34:	17ffffc7	b	0xfffff7f89e50
   0x0000fffff7f89f38:	d2800669	mov	x9, #0x33                  	// #51
   0x0000fffff7f89f3c:	17ffffc5	b	0xfffff7f89e50
   0x0000fffff7f89f40:	d2800689	mov	x9, #0x34                  	// #52
   0x0000fffff7f89f44:	17ffffc3	b	0xfffff7f89e50
   0x0000fffff7f89f48:	d28006a9	mov	x9, #0x35                  	// #53
   0x0000fffff7f89f4c:	17ffffc1	b	0xfffff7f89e50
   0x0000fffff7f89f50:	d28006c9	mov	x9, #0x36                  	// #54
   0x0000fffff7f89f54:	17ffffbf	b	0xfffff7f89e50
   0x0000fffff7f89f58:	d28006e9	mov	x9, #0x37                  	// #55
   0x0000fffff7f89f5c:	17ffffbd	b	0xfffff7f89e50
   0x0000fffff7f89f60:	d2800709	mov	x9, #0x38                  	// #56
   0x0000fffff7f89f64:	17ffffbb	b	0xfffff7f89e50
   0x0000fffff7f89f68:	d2800729	mov	x9, #0x39                  	// #57
   0x0000fffff7f89f6c:	17ffffb9	b	0xfffff7f89e50
   0x0000fffff7f89f70:	d2800749	mov	x9, #0x3a                  	// #58
   0x0000fffff7f89f74:	17ffffb7	b	0xfffff7f89e50
   0x0000fffff7f89f78:	d2800769	mov	x9, #0x3b                  	// #59
   0x0000fffff7f89f7c:	17ffffb5	b	0xfffff7f89e50
   0x0000fffff7f89f80:	d2800789	mov	x9, #0x3c                  	// #60
   0x0000fffff7f89f84:	17ffffb3	b	0xfffff7f89e50
   0x0000fffff7f89f88:	00000000	udf	#0
   0x0000fffff7f89f8c:	00000000	udf	#0
   0x0000fffff7f89f90:	00000000	udf	#0
   0x0000fffff7f89f94:	00000000	udf	#0
   0x0000fffff7f89f98:	00000000	udf	#0
   0x0000fffff7f89f9c:	00000000	udf	#0
   0x0000fffff7f89fa0:	00000000	udf	#0
   0x0000fffff7f89fa4:	00000000	udf	#0
   0x0000fffff7f89fa8:	00000000	udf	#0
   0x0000fffff7f89fac:	00000000	udf	#0
   0x0000fffff7f89fb0:	00000000	udf	#0
   0x0000fffff7f89fb4:	00000000	udf	#0
   0x0000fffff7f89fb8:	00000000	udf	#0
   0x0000fffff7f89fbc:	00000000	udf	#0
   0x0000fffff7f89fc0:	00000000	udf	#0
   0x0000fffff7f89fc4:	00000000	udf	#0
   0x0000fffff7f89fc8:	00000000	udf	#0
   0x0000fffff7f89fcc:	00000000	udf	#0
   0x0000fffff7f89fd0:	00000000	udf	#0
   0x0000fffff7f89fd4:	00000000	udf	#0
   0x0000fffff7f89fd8:	00000000	udf	#0
   0x0000fffff7f89fdc:	00000000	udf	#0
   0x0000fffff7f89fe0:	00000000	udf	#0
   0x0000fffff7f89fe4:	00000000	udf	#0
   0x0000fffff7f89fe8:	00000000	udf	#0
   0x0000fffff7f89fec:	00000000	udf	#0
   0x0000fffff7f89ff0:	00000000	udf	#0
   0x0000fffff7f89ff4:	00000000	udf	#0
   0x0000fffff7f89ff8:	00000000	udf	#0
   0x0000fffff7f89ffc:	00000000	udf	#0
End of assembler dump.
