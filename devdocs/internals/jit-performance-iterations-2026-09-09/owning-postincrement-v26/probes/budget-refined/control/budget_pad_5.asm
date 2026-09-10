Dump of assembler code from 0xfffff7fb4000 to 0xfffff7fb6000:
   0x0000fffff7fb4000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fb4004:	910003fd	mov	x29, sp
   0x0000fffff7fb4008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fb400c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fb4010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fb4014:	aa0003f3	mov	x19, x0
   0x0000fffff7fb4018:	aa0103f4	mov	x20, x1
   0x0000fffff7fb401c:	aa0203f5	mov	x21, x2
   0x0000fffff7fb4020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fb4024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fb4028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fb402c:	f90003e9	str	x9, [sp]
   0x0000fffff7fb4030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fb4034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fb4038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fb403c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fb4040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4044:	d63f0200	blr	x16
   0x0000fffff7fb4048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fb404c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fb4050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fb4054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fb4058:	14000001	b	0xfffff7fb405c
   0x0000fffff7fb405c:	14000001	b	0xfffff7fb4060
   0x0000fffff7fb4060:	14000001	b	0xfffff7fb4064
   0x0000fffff7fb4064:	14000001	b	0xfffff7fb4068
   0x0000fffff7fb4068:	14000001	b	0xfffff7fb406c
   0x0000fffff7fb406c:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb4070:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb4074:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fb4078:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb407c:	36d80211	tbz	w17, #27, 0xfffff7fb40bc
   0x0000fffff7fb4080:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb4084:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4088:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb408c:	540001e1	b.ne	0xfffff7fb40c8  // b.any
   0x0000fffff7fb4090:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb4094:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4098:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb409c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb40a0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb40a4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb40a8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb40ac:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb40b0:	540000c9	b.ls	0xfffff7fb40c8  // b.plast
   0x0000fffff7fb40b4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb40b8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb40bc:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb40c0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb40c4:	1400000e	b	0xfffff7fb40fc
   0x0000fffff7fb40c8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb40cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb40d0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb40d4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb40d8:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fb40dc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb40e0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb40e4:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7fb40e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb40ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb40f0:	d63f0200	blr	x16
   0x0000fffff7fb40f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb40f8:	5400ede0	b.eq	0xfffff7fb5eb4  // b.none
   0x0000fffff7fb40fc:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb4100:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb4104:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fb4108:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7fb410c:	36d80211	tbz	w17, #27, 0xfffff7fb414c
   0x0000fffff7fb4110:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb4114:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4118:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb411c:	540001e1	b.ne	0xfffff7fb4158  // b.any
   0x0000fffff7fb4120:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fb4124:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4128:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb412c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4130:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4134:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4138:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb413c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4140:	540000c9	b.ls	0xfffff7fb4158  // b.plast
   0x0000fffff7fb4144:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4148:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb414c:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fb4150:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fb4154:	1400000e	b	0xfffff7fb418c
   0x0000fffff7fb4158:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb415c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4160:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4164:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4168:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fb416c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4170:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4174:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7fb4178:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb417c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4180:	d63f0200	blr	x16
   0x0000fffff7fb4184:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4188:	5400e9a0	b.eq	0xfffff7fb5ebc  // b.none
   0x0000fffff7fb418c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb4190:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4194:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4198:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb419c:	54000421	b.ne	0xfffff7fb4220  // b.any
   0x0000fffff7fb41a0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb41a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb41a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb41ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb41b0:	54000381	b.ne	0xfffff7fb4220  // b.any
   0x0000fffff7fb41b4:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fb41b8:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7fb41bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb41c0:	9a9fa7ec	cset	x12, lt	// lt = tstop
   0x0000fffff7fb41c4:	5280010d	mov	w13, #0x8                   	// #8
   0x0000fffff7fb41c8:	72a0200d	movk	w13, #0x100, lsl #16
   0x0000fffff7fb41cc:	91000580	add	x0, x12, #0x1
   0x0000fffff7fb41d0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb41d4:	36d80211	tbz	w17, #27, 0xfffff7fb4214
   0x0000fffff7fb41d8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb41dc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb41e0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb41e4:	540001e1	b.ne	0xfffff7fb4220  // b.any
   0x0000fffff7fb41e8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb41ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb41f0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb41f4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb41f8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb41fc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4200:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4204:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4208:	540000c9	b.ls	0xfffff7fb4220  // b.plast
   0x0000fffff7fb420c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4210:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4214:	f9005ecc	str	x12, [x22, #184]
   0x0000fffff7fb4218:	b900b2cd	str	w13, [x22, #176]
   0x0000fffff7fb421c:	1400000e	b	0xfffff7fb4254
   0x0000fffff7fb4220:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb4224:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4228:	aa1303e1	mov	x1, x19
   0x0000fffff7fb422c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4230:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fb4234:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4238:	aa1603e5	mov	x5, x22
   0x0000fffff7fb423c:	d28fec90	mov	x16, #0x7f64                	// #32612
   0x0000fffff7fb4240:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb4244:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4248:	d63f0200	blr	x16
   0x0000fffff7fb424c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4250:	5400e3a0	b.eq	0xfffff7fb5ec4  // b.none
   0x0000fffff7fb4254:	f100041f	cmp	x0, #0x1
   0x0000fffff7fb4258:	5400df80	b.eq	0xfffff7fb5e48  // b.none
   0x0000fffff7fb425c:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb4260:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb4264:	d299d20c	mov	x12, #0xce90                	// #52880
   0x0000fffff7fb4268:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb426c:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb4270:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7fb4274:	36d801d1	tbz	w17, #27, 0xfffff7fb42ac
   0x0000fffff7fb4278:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb427c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4280:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4284:	54000281	b.ne	0xfffff7fb42d4  // b.any
   0x0000fffff7fb4288:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb428c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4290:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4294:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4298:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb429c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb42a0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb42a4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb42a8:	54000169	b.ls	0xfffff7fb42d4  // b.plast
   0x0000fffff7fb42ac:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb42b0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb42b4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb42b8:	36d80091	tbz	w17, #27, 0xfffff7fb42c8
   0x0000fffff7fb42bc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb42c0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb42c4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb42c8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb42cc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb42d0:	1400000e	b	0xfffff7fb4308
   0x0000fffff7fb42d4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb42d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb42dc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb42e0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb42e4:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fb42e8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb42ec:	aa1603e5	mov	x5, x22
   0x0000fffff7fb42f0:	d2933c10	mov	x16, #0x99e0                	// #39392
   0x0000fffff7fb42f4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb42f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb42fc:	d63f0200	blr	x16
   0x0000fffff7fb4300:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4304:	5400de40	b.eq	0xfffff7fb5ecc  // b.none
   0x0000fffff7fb4308:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb430c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb4310:	540003a0	b.eq	0xfffff7fb4384  // b.none
   0x0000fffff7fb4314:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7fb4318:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7fb431c:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb4320:	36d801d1	tbz	w17, #27, 0xfffff7fb4358
   0x0000fffff7fb4324:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb4328:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb432c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4330:	540002a1	b.ne	0xfffff7fb4384  // b.any
   0x0000fffff7fb4334:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb4338:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb433c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4340:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4344:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4348:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb434c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4350:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4354:	54000189	b.ls	0xfffff7fb4384  // b.plast
   0x0000fffff7fb4358:	36d8008d	tbz	w13, #27, 0xfffff7fb4368
   0x0000fffff7fb435c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb4360:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4364:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb4368:	36d80091	tbz	w17, #27, 0xfffff7fb4378
   0x0000fffff7fb436c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4370:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4374:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4378:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb437c:	b900016d	str	w13, [x11]
   0x0000fffff7fb4380:	1400000e	b	0xfffff7fb43b8
   0x0000fffff7fb4384:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb4388:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb438c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4390:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4394:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fb4398:	aa1403e4	mov	x4, x20
   0x0000fffff7fb439c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb43a0:	d29e2e10	mov	x16, #0xf170                	// #61808
   0x0000fffff7fb43a4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb43a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb43ac:	d63f0200	blr	x16
   0x0000fffff7fb43b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb43b4:	5400d900	b.eq	0xfffff7fb5ed4  // b.none
   0x0000fffff7fb43b8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb43bc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb43c0:	540004a0	b.eq	0xfffff7fb4454  // b.none
   0x0000fffff7fb43c4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb43c8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb43cc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb43d0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb43d4:	54000400	b.eq	0xfffff7fb4454  // b.none
   0x0000fffff7fb43d8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb43dc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb43e0:	36d801d1	tbz	w17, #27, 0xfffff7fb4418
   0x0000fffff7fb43e4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb43e8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb43ec:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb43f0:	54000321	b.ne	0xfffff7fb4454  // b.any
   0x0000fffff7fb43f4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb43f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb43fc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4400:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4404:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4408:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb440c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4410:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4414:	54000209	b.ls	0xfffff7fb4454  // b.plast
   0x0000fffff7fb4418:	36d8008d	tbz	w13, #27, 0xfffff7fb4428
   0x0000fffff7fb441c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb4420:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4424:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb4428:	36d80091	tbz	w17, #27, 0xfffff7fb4438
   0x0000fffff7fb442c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4430:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4434:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4438:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb443c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb4440:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb4444:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb4448:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb444c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb4450:	1400000e	b	0xfffff7fb4488
   0x0000fffff7fb4454:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb4458:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb445c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4460:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4464:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fb4468:	aa1403e4	mov	x4, x20
   0x0000fffff7fb446c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4470:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb4474:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb4478:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb447c:	d63f0200	blr	x16
   0x0000fffff7fb4480:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4484:	5400d2c0	b.eq	0xfffff7fb5edc  // b.none
   0x0000fffff7fb4488:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb448c:	37d806a9	tbnz	w9, #27, 0xfffff7fb4560
   0x0000fffff7fb4490:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb4494:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4498:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb449c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb44a0:	540001c1	b.ne	0xfffff7fb44d8  // b.any
   0x0000fffff7fb44a4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb44a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb44ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb44b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb44b4:	54000121	b.ne	0xfffff7fb44d8  // b.any
   0x0000fffff7fb44b8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb44bc:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb44c0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb44c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb44c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb44cc:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb44d0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb44d4:	14000030	b	0xfffff7fb4594
   0x0000fffff7fb44d8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb44dc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb44e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb44e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb44e8:	54000120	b.eq	0xfffff7fb450c  // b.none
   0x0000fffff7fb44ec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb44f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb44f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb44f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb44fc:	54000321	b.ne	0xfffff7fb4560  // b.any
   0x0000fffff7fb4500:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb4504:	9e620120	scvtf	d0, x9
   0x0000fffff7fb4508:	14000002	b	0xfffff7fb4510
   0x0000fffff7fb450c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb4510:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb4514:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4518:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb451c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4520:	54000120	b.eq	0xfffff7fb4544  // b.none
   0x0000fffff7fb4524:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb4528:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb452c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4530:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4534:	54000161	b.ne	0xfffff7fb4560  // b.any
   0x0000fffff7fb4538:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb453c:	9e620121	scvtf	d1, x9
   0x0000fffff7fb4540:	14000002	b	0xfffff7fb4548
   0x0000fffff7fb4544:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb4548:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb454c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb4550:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4554:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4558:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb455c:	17ffffde	b	0xfffff7fb44d4
   0x0000fffff7fb4560:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb4564:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4568:	aa1303e1	mov	x1, x19
   0x0000fffff7fb456c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4570:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fb4574:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4578:	aa1603e5	mov	x5, x22
   0x0000fffff7fb457c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb4580:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb4584:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4588:	d63f0200	blr	x16
   0x0000fffff7fb458c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4590:	5400caa0	b.eq	0xfffff7fb5ee4  // b.none
   0x0000fffff7fb4594:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb4598:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb459c:	540004a0	b.eq	0xfffff7fb4630  // b.none
   0x0000fffff7fb45a0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb45a4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb45a8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb45ac:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb45b0:	54000400	b.eq	0xfffff7fb4630  // b.none
   0x0000fffff7fb45b4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb45b8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb45bc:	36d801d1	tbz	w17, #27, 0xfffff7fb45f4
   0x0000fffff7fb45c0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb45c4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb45c8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb45cc:	54000321	b.ne	0xfffff7fb4630  // b.any
   0x0000fffff7fb45d0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb45d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb45d8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb45dc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb45e0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb45e4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb45e8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb45ec:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb45f0:	54000209	b.ls	0xfffff7fb4630  // b.plast
   0x0000fffff7fb45f4:	36d8008d	tbz	w13, #27, 0xfffff7fb4604
   0x0000fffff7fb45f8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb45fc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4600:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb4604:	36d80091	tbz	w17, #27, 0xfffff7fb4614
   0x0000fffff7fb4608:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb460c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4610:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4614:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb4618:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb461c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb4620:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb4624:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb4628:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb462c:	1400000e	b	0xfffff7fb4664
   0x0000fffff7fb4630:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb4634:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4638:	aa1303e1	mov	x1, x19
   0x0000fffff7fb463c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4640:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fb4644:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4648:	aa1603e5	mov	x5, x22
   0x0000fffff7fb464c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb4650:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb4654:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4658:	d63f0200	blr	x16
   0x0000fffff7fb465c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4660:	5400c460	b.eq	0xfffff7fb5eec  // b.none
   0x0000fffff7fb4664:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb4668:	37d806a9	tbnz	w9, #27, 0xfffff7fb473c
   0x0000fffff7fb466c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb4670:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4674:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4678:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb467c:	540001c1	b.ne	0xfffff7fb46b4  // b.any
   0x0000fffff7fb4680:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb4684:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4688:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb468c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4690:	54000121	b.ne	0xfffff7fb46b4  // b.any
   0x0000fffff7fb4694:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb4698:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb469c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb46a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb46a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb46a8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb46ac:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb46b0:	14000030	b	0xfffff7fb4770
   0x0000fffff7fb46b4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb46b8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb46bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb46c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb46c4:	54000120	b.eq	0xfffff7fb46e8  // b.none
   0x0000fffff7fb46c8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb46cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb46d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb46d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb46d8:	54000321	b.ne	0xfffff7fb473c  // b.any
   0x0000fffff7fb46dc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb46e0:	9e620120	scvtf	d0, x9
   0x0000fffff7fb46e4:	14000002	b	0xfffff7fb46ec
   0x0000fffff7fb46e8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb46ec:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb46f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb46f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb46f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb46fc:	54000120	b.eq	0xfffff7fb4720  // b.none
   0x0000fffff7fb4700:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb4704:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4708:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb470c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4710:	54000161	b.ne	0xfffff7fb473c  // b.any
   0x0000fffff7fb4714:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb4718:	9e620121	scvtf	d1, x9
   0x0000fffff7fb471c:	14000002	b	0xfffff7fb4724
   0x0000fffff7fb4720:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb4724:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb4728:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb472c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4730:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4734:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb4738:	17ffffde	b	0xfffff7fb46b0
   0x0000fffff7fb473c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb4740:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4744:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4748:	aa1503e2	mov	x2, x21
   0x0000fffff7fb474c:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fb4750:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4754:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4758:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb475c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb4760:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4764:	d63f0200	blr	x16
   0x0000fffff7fb4768:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb476c:	5400bc40	b.eq	0xfffff7fb5ef4  // b.none
   0x0000fffff7fb4770:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb4774:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb4778:	540004a0	b.eq	0xfffff7fb480c  // b.none
   0x0000fffff7fb477c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb4780:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb4784:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb4788:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb478c:	54000400	b.eq	0xfffff7fb480c  // b.none
   0x0000fffff7fb4790:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb4794:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb4798:	36d801d1	tbz	w17, #27, 0xfffff7fb47d0
   0x0000fffff7fb479c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb47a0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb47a4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb47a8:	54000321	b.ne	0xfffff7fb480c  // b.any
   0x0000fffff7fb47ac:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb47b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb47b4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb47b8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb47bc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb47c0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb47c4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb47c8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb47cc:	54000209	b.ls	0xfffff7fb480c  // b.plast
   0x0000fffff7fb47d0:	36d8008d	tbz	w13, #27, 0xfffff7fb47e0
   0x0000fffff7fb47d4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb47d8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb47dc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb47e0:	36d80091	tbz	w17, #27, 0xfffff7fb47f0
   0x0000fffff7fb47e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb47e8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb47ec:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb47f0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb47f4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb47f8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb47fc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb4800:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb4804:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb4808:	1400000e	b	0xfffff7fb4840
   0x0000fffff7fb480c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb4810:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4814:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4818:	aa1503e2	mov	x2, x21
   0x0000fffff7fb481c:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fb4820:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4824:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4828:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb482c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb4830:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4834:	d63f0200	blr	x16
   0x0000fffff7fb4838:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb483c:	5400b600	b.eq	0xfffff7fb5efc  // b.none
   0x0000fffff7fb4840:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb4844:	37d806a9	tbnz	w9, #27, 0xfffff7fb4918
   0x0000fffff7fb4848:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb484c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4850:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4854:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4858:	540001c1	b.ne	0xfffff7fb4890  // b.any
   0x0000fffff7fb485c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb4860:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4864:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4868:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb486c:	54000121	b.ne	0xfffff7fb4890  // b.any
   0x0000fffff7fb4870:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb4874:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb4878:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb487c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4880:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4884:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb4888:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb488c:	14000030	b	0xfffff7fb494c
   0x0000fffff7fb4890:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb4894:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4898:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb489c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb48a0:	54000120	b.eq	0xfffff7fb48c4  // b.none
   0x0000fffff7fb48a4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb48a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb48ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb48b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb48b4:	54000321	b.ne	0xfffff7fb4918  // b.any
   0x0000fffff7fb48b8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb48bc:	9e620120	scvtf	d0, x9
   0x0000fffff7fb48c0:	14000002	b	0xfffff7fb48c8
   0x0000fffff7fb48c4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb48c8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb48cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb48d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb48d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb48d8:	54000120	b.eq	0xfffff7fb48fc  // b.none
   0x0000fffff7fb48dc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb48e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb48e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb48e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb48ec:	54000161	b.ne	0xfffff7fb4918  // b.any
   0x0000fffff7fb48f0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb48f4:	9e620121	scvtf	d1, x9
   0x0000fffff7fb48f8:	14000002	b	0xfffff7fb4900
   0x0000fffff7fb48fc:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb4900:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb4904:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb4908:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb490c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4910:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb4914:	17ffffde	b	0xfffff7fb488c
   0x0000fffff7fb4918:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb491c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4920:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4924:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4928:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fb492c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4930:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4934:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb4938:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb493c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4940:	d63f0200	blr	x16
   0x0000fffff7fb4944:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4948:	5400ade0	b.eq	0xfffff7fb5f04  // b.none
   0x0000fffff7fb494c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb4950:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb4954:	540004a0	b.eq	0xfffff7fb49e8  // b.none
   0x0000fffff7fb4958:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb495c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb4960:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb4964:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb4968:	54000400	b.eq	0xfffff7fb49e8  // b.none
   0x0000fffff7fb496c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb4970:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb4974:	36d801d1	tbz	w17, #27, 0xfffff7fb49ac
   0x0000fffff7fb4978:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb497c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4980:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4984:	54000321	b.ne	0xfffff7fb49e8  // b.any
   0x0000fffff7fb4988:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb498c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4990:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4994:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4998:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb499c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb49a0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb49a4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb49a8:	54000209	b.ls	0xfffff7fb49e8  // b.plast
   0x0000fffff7fb49ac:	36d8008d	tbz	w13, #27, 0xfffff7fb49bc
   0x0000fffff7fb49b0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb49b4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb49b8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb49bc:	36d80091	tbz	w17, #27, 0xfffff7fb49cc
   0x0000fffff7fb49c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb49c4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb49c8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb49cc:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb49d0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb49d4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb49d8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb49dc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb49e0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb49e4:	1400000e	b	0xfffff7fb4a1c
   0x0000fffff7fb49e8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb49ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb49f0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb49f4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb49f8:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fb49fc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4a00:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4a04:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb4a08:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb4a0c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4a10:	d63f0200	blr	x16
   0x0000fffff7fb4a14:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4a18:	5400a7a0	b.eq	0xfffff7fb5f0c  // b.none
   0x0000fffff7fb4a1c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb4a20:	37d806a9	tbnz	w9, #27, 0xfffff7fb4af4
   0x0000fffff7fb4a24:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb4a28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4a2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4a30:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4a34:	540001c1	b.ne	0xfffff7fb4a6c  // b.any
   0x0000fffff7fb4a38:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb4a3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4a40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4a44:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4a48:	54000121	b.ne	0xfffff7fb4a6c  // b.any
   0x0000fffff7fb4a4c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb4a50:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb4a54:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb4a58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4a5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4a60:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb4a64:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb4a68:	14000030	b	0xfffff7fb4b28
   0x0000fffff7fb4a6c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb4a70:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4a74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4a78:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4a7c:	54000120	b.eq	0xfffff7fb4aa0  // b.none
   0x0000fffff7fb4a80:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb4a84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4a88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4a8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4a90:	54000321	b.ne	0xfffff7fb4af4  // b.any
   0x0000fffff7fb4a94:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb4a98:	9e620120	scvtf	d0, x9
   0x0000fffff7fb4a9c:	14000002	b	0xfffff7fb4aa4
   0x0000fffff7fb4aa0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb4aa4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb4aa8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4aac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4ab0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4ab4:	54000120	b.eq	0xfffff7fb4ad8  // b.none
   0x0000fffff7fb4ab8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb4abc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4ac0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4ac4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4ac8:	54000161	b.ne	0xfffff7fb4af4  // b.any
   0x0000fffff7fb4acc:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb4ad0:	9e620121	scvtf	d1, x9
   0x0000fffff7fb4ad4:	14000002	b	0xfffff7fb4adc
   0x0000fffff7fb4ad8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb4adc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb4ae0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb4ae4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4ae8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4aec:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb4af0:	17ffffde	b	0xfffff7fb4a68
   0x0000fffff7fb4af4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb4af8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4afc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4b00:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4b04:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fb4b08:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4b0c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4b10:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb4b14:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb4b18:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4b1c:	d63f0200	blr	x16
   0x0000fffff7fb4b20:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4b24:	54009f80	b.eq	0xfffff7fb5f14  // b.none
   0x0000fffff7fb4b28:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb4b2c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb4b30:	540004a0	b.eq	0xfffff7fb4bc4  // b.none
   0x0000fffff7fb4b34:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb4b38:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb4b3c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb4b40:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb4b44:	54000400	b.eq	0xfffff7fb4bc4  // b.none
   0x0000fffff7fb4b48:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb4b4c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb4b50:	36d801d1	tbz	w17, #27, 0xfffff7fb4b88
   0x0000fffff7fb4b54:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb4b58:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4b5c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4b60:	54000321	b.ne	0xfffff7fb4bc4  // b.any
   0x0000fffff7fb4b64:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb4b68:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4b6c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4b70:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4b74:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4b78:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4b7c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4b80:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4b84:	54000209	b.ls	0xfffff7fb4bc4  // b.plast
   0x0000fffff7fb4b88:	36d8008d	tbz	w13, #27, 0xfffff7fb4b98
   0x0000fffff7fb4b8c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb4b90:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4b94:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb4b98:	36d80091	tbz	w17, #27, 0xfffff7fb4ba8
   0x0000fffff7fb4b9c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4ba0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4ba4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4ba8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb4bac:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb4bb0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb4bb4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb4bb8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb4bbc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb4bc0:	1400000e	b	0xfffff7fb4bf8
   0x0000fffff7fb4bc4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb4bc8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4bcc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4bd0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4bd4:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fb4bd8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4bdc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4be0:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb4be4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb4be8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4bec:	d63f0200	blr	x16
   0x0000fffff7fb4bf0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4bf4:	54009940	b.eq	0xfffff7fb5f1c  // b.none
   0x0000fffff7fb4bf8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb4bfc:	37d806a9	tbnz	w9, #27, 0xfffff7fb4cd0
   0x0000fffff7fb4c00:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb4c04:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4c08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4c0c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4c10:	540001c1	b.ne	0xfffff7fb4c48  // b.any
   0x0000fffff7fb4c14:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb4c18:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4c1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4c20:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4c24:	54000121	b.ne	0xfffff7fb4c48  // b.any
   0x0000fffff7fb4c28:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb4c2c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb4c30:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb4c34:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4c38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4c3c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb4c40:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb4c44:	14000030	b	0xfffff7fb4d04
   0x0000fffff7fb4c48:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb4c4c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4c50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4c54:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4c58:	54000120	b.eq	0xfffff7fb4c7c  // b.none
   0x0000fffff7fb4c5c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb4c60:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4c64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4c68:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4c6c:	54000321	b.ne	0xfffff7fb4cd0  // b.any
   0x0000fffff7fb4c70:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb4c74:	9e620120	scvtf	d0, x9
   0x0000fffff7fb4c78:	14000002	b	0xfffff7fb4c80
   0x0000fffff7fb4c7c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb4c80:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb4c84:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4c88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4c8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4c90:	54000120	b.eq	0xfffff7fb4cb4  // b.none
   0x0000fffff7fb4c94:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb4c98:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4c9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4ca0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4ca4:	54000161	b.ne	0xfffff7fb4cd0  // b.any
   0x0000fffff7fb4ca8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb4cac:	9e620121	scvtf	d1, x9
   0x0000fffff7fb4cb0:	14000002	b	0xfffff7fb4cb8
   0x0000fffff7fb4cb4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb4cb8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb4cbc:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb4cc0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4cc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4cc8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb4ccc:	17ffffde	b	0xfffff7fb4c44
   0x0000fffff7fb4cd0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb4cd4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4cd8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4cdc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4ce0:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fb4ce4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4ce8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4cec:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb4cf0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb4cf4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4cf8:	d63f0200	blr	x16
   0x0000fffff7fb4cfc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4d00:	54009120	b.eq	0xfffff7fb5f24  // b.none
   0x0000fffff7fb4d04:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb4d08:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb4d0c:	540004a0	b.eq	0xfffff7fb4da0  // b.none
   0x0000fffff7fb4d10:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb4d14:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb4d18:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb4d1c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb4d20:	54000400	b.eq	0xfffff7fb4da0  // b.none
   0x0000fffff7fb4d24:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb4d28:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb4d2c:	36d801d1	tbz	w17, #27, 0xfffff7fb4d64
   0x0000fffff7fb4d30:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb4d34:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4d38:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4d3c:	54000321	b.ne	0xfffff7fb4da0  // b.any
   0x0000fffff7fb4d40:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb4d44:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4d48:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4d4c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4d50:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4d54:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4d58:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4d5c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4d60:	54000209	b.ls	0xfffff7fb4da0  // b.plast
   0x0000fffff7fb4d64:	36d8008d	tbz	w13, #27, 0xfffff7fb4d74
   0x0000fffff7fb4d68:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb4d6c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4d70:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb4d74:	36d80091	tbz	w17, #27, 0xfffff7fb4d84
   0x0000fffff7fb4d78:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4d7c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4d80:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4d84:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb4d88:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb4d8c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb4d90:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb4d94:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb4d98:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb4d9c:	1400000e	b	0xfffff7fb4dd4
   0x0000fffff7fb4da0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb4da4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4da8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4dac:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4db0:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fb4db4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4db8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4dbc:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb4dc0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb4dc4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4dc8:	d63f0200	blr	x16
   0x0000fffff7fb4dcc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4dd0:	54008ae0	b.eq	0xfffff7fb5f2c  // b.none
   0x0000fffff7fb4dd4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb4dd8:	37d806a9	tbnz	w9, #27, 0xfffff7fb4eac
   0x0000fffff7fb4ddc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb4de0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4de4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4de8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4dec:	540001c1	b.ne	0xfffff7fb4e24  // b.any
   0x0000fffff7fb4df0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb4df4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4df8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4dfc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4e00:	54000121	b.ne	0xfffff7fb4e24  // b.any
   0x0000fffff7fb4e04:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb4e08:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb4e0c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb4e10:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4e14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4e18:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb4e1c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb4e20:	14000030	b	0xfffff7fb4ee0
   0x0000fffff7fb4e24:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb4e28:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4e2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4e30:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4e34:	54000120	b.eq	0xfffff7fb4e58  // b.none
   0x0000fffff7fb4e38:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb4e3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4e40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4e44:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4e48:	54000321	b.ne	0xfffff7fb4eac  // b.any
   0x0000fffff7fb4e4c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb4e50:	9e620120	scvtf	d0, x9
   0x0000fffff7fb4e54:	14000002	b	0xfffff7fb4e5c
   0x0000fffff7fb4e58:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb4e5c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb4e60:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4e64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4e68:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4e6c:	54000120	b.eq	0xfffff7fb4e90  // b.none
   0x0000fffff7fb4e70:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb4e74:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4e78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4e7c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4e80:	54000161	b.ne	0xfffff7fb4eac  // b.any
   0x0000fffff7fb4e84:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb4e88:	9e620121	scvtf	d1, x9
   0x0000fffff7fb4e8c:	14000002	b	0xfffff7fb4e94
   0x0000fffff7fb4e90:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb4e94:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb4e98:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb4e9c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4ea0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4ea4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb4ea8:	17ffffde	b	0xfffff7fb4e20
   0x0000fffff7fb4eac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb4eb0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4eb4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4eb8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4ebc:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fb4ec0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4ec4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4ec8:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb4ecc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb4ed0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4ed4:	d63f0200	blr	x16
   0x0000fffff7fb4ed8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4edc:	540082c0	b.eq	0xfffff7fb5f34  // b.none
   0x0000fffff7fb4ee0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb4ee4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb4ee8:	540004a0	b.eq	0xfffff7fb4f7c  // b.none
   0x0000fffff7fb4eec:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb4ef0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb4ef4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb4ef8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb4efc:	54000400	b.eq	0xfffff7fb4f7c  // b.none
   0x0000fffff7fb4f00:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb4f04:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb4f08:	36d801d1	tbz	w17, #27, 0xfffff7fb4f40
   0x0000fffff7fb4f0c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb4f10:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4f14:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4f18:	54000321	b.ne	0xfffff7fb4f7c  // b.any
   0x0000fffff7fb4f1c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb4f20:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4f24:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4f28:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4f2c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4f30:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4f34:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4f38:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4f3c:	54000209	b.ls	0xfffff7fb4f7c  // b.plast
   0x0000fffff7fb4f40:	36d8008d	tbz	w13, #27, 0xfffff7fb4f50
   0x0000fffff7fb4f44:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb4f48:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4f4c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb4f50:	36d80091	tbz	w17, #27, 0xfffff7fb4f60
   0x0000fffff7fb4f54:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4f58:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4f5c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4f60:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb4f64:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb4f68:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb4f6c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb4f70:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb4f74:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb4f78:	1400000e	b	0xfffff7fb4fb0
   0x0000fffff7fb4f7c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb4f80:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4f84:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4f88:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4f8c:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fb4f90:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4f94:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4f98:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb4f9c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb4fa0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4fa4:	d63f0200	blr	x16
   0x0000fffff7fb4fa8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4fac:	54007c80	b.eq	0xfffff7fb5f3c  // b.none
   0x0000fffff7fb4fb0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb4fb4:	37d806a9	tbnz	w9, #27, 0xfffff7fb5088
   0x0000fffff7fb4fb8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb4fbc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4fc0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4fc4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4fc8:	540001c1	b.ne	0xfffff7fb5000  // b.any
   0x0000fffff7fb4fcc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb4fd0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4fd4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4fd8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4fdc:	54000121	b.ne	0xfffff7fb5000  // b.any
   0x0000fffff7fb4fe0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb4fe4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb4fe8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb4fec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4ff0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4ff4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb4ff8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb4ffc:	14000030	b	0xfffff7fb50bc
   0x0000fffff7fb5000:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb5004:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb5008:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb500c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5010:	54000120	b.eq	0xfffff7fb5034  // b.none
   0x0000fffff7fb5014:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb5018:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb501c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5020:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5024:	54000321	b.ne	0xfffff7fb5088  // b.any
   0x0000fffff7fb5028:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb502c:	9e620120	scvtf	d0, x9
   0x0000fffff7fb5030:	14000002	b	0xfffff7fb5038
   0x0000fffff7fb5034:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb5038:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb503c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb5040:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5044:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5048:	54000120	b.eq	0xfffff7fb506c  // b.none
   0x0000fffff7fb504c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb5050:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5054:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5058:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb505c:	54000161	b.ne	0xfffff7fb5088  // b.any
   0x0000fffff7fb5060:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb5064:	9e620121	scvtf	d1, x9
   0x0000fffff7fb5068:	14000002	b	0xfffff7fb5070
   0x0000fffff7fb506c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb5070:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb5074:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb5078:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb507c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5080:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb5084:	17ffffde	b	0xfffff7fb4ffc
   0x0000fffff7fb5088:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb508c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb5090:	aa1303e1	mov	x1, x19
   0x0000fffff7fb5094:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5098:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fb509c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb50a0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb50a4:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb50a8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb50ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb50b0:	d63f0200	blr	x16
   0x0000fffff7fb50b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb50b8:	54007460	b.eq	0xfffff7fb5f44  // b.none
   0x0000fffff7fb50bc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb50c0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb50c4:	540004a0	b.eq	0xfffff7fb5158  // b.none
   0x0000fffff7fb50c8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb50cc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb50d0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb50d4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb50d8:	54000400	b.eq	0xfffff7fb5158  // b.none
   0x0000fffff7fb50dc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb50e0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb50e4:	36d801d1	tbz	w17, #27, 0xfffff7fb511c
   0x0000fffff7fb50e8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb50ec:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb50f0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb50f4:	54000321	b.ne	0xfffff7fb5158  // b.any
   0x0000fffff7fb50f8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb50fc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb5100:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb5104:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb5108:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb510c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb5110:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb5114:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb5118:	54000209	b.ls	0xfffff7fb5158  // b.plast
   0x0000fffff7fb511c:	36d8008d	tbz	w13, #27, 0xfffff7fb512c
   0x0000fffff7fb5120:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb5124:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb5128:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb512c:	36d80091	tbz	w17, #27, 0xfffff7fb513c
   0x0000fffff7fb5130:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb5134:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb5138:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb513c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb5140:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb5144:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb5148:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb514c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb5150:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb5154:	1400000e	b	0xfffff7fb518c
   0x0000fffff7fb5158:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb515c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb5160:	aa1303e1	mov	x1, x19
   0x0000fffff7fb5164:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5168:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fb516c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb5170:	aa1603e5	mov	x5, x22
   0x0000fffff7fb5174:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb5178:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb517c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb5180:	d63f0200	blr	x16
   0x0000fffff7fb5184:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb5188:	54006e20	b.eq	0xfffff7fb5f4c  // b.none
   0x0000fffff7fb518c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb5190:	37d806a9	tbnz	w9, #27, 0xfffff7fb5264
   0x0000fffff7fb5194:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb5198:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb519c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb51a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb51a4:	540001c1	b.ne	0xfffff7fb51dc  // b.any
   0x0000fffff7fb51a8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb51ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb51b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb51b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb51b8:	54000121	b.ne	0xfffff7fb51dc  // b.any
   0x0000fffff7fb51bc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb51c0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb51c4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb51c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb51cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb51d0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb51d4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb51d8:	14000030	b	0xfffff7fb5298
   0x0000fffff7fb51dc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb51e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb51e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb51e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb51ec:	54000120	b.eq	0xfffff7fb5210  // b.none
   0x0000fffff7fb51f0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb51f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb51f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb51fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5200:	54000321	b.ne	0xfffff7fb5264  // b.any
   0x0000fffff7fb5204:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb5208:	9e620120	scvtf	d0, x9
   0x0000fffff7fb520c:	14000002	b	0xfffff7fb5214
   0x0000fffff7fb5210:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb5214:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb5218:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb521c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5220:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5224:	54000120	b.eq	0xfffff7fb5248  // b.none
   0x0000fffff7fb5228:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb522c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5230:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5234:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5238:	54000161	b.ne	0xfffff7fb5264  // b.any
   0x0000fffff7fb523c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb5240:	9e620121	scvtf	d1, x9
   0x0000fffff7fb5244:	14000002	b	0xfffff7fb524c
   0x0000fffff7fb5248:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb524c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb5250:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb5254:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb5258:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb525c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb5260:	17ffffde	b	0xfffff7fb51d8
   0x0000fffff7fb5264:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb5268:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb526c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb5270:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5274:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fb5278:	aa1403e4	mov	x4, x20
   0x0000fffff7fb527c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb5280:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb5284:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb5288:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb528c:	d63f0200	blr	x16
   0x0000fffff7fb5290:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb5294:	54006600	b.eq	0xfffff7fb5f54  // b.none
   0x0000fffff7fb5298:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb529c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb52a0:	540004a0	b.eq	0xfffff7fb5334  // b.none
   0x0000fffff7fb52a4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb52a8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb52ac:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb52b0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb52b4:	54000400	b.eq	0xfffff7fb5334  // b.none
   0x0000fffff7fb52b8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb52bc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb52c0:	36d801d1	tbz	w17, #27, 0xfffff7fb52f8
   0x0000fffff7fb52c4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb52c8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb52cc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb52d0:	54000321	b.ne	0xfffff7fb5334  // b.any
   0x0000fffff7fb52d4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb52d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb52dc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb52e0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb52e4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb52e8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb52ec:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb52f0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb52f4:	54000209	b.ls	0xfffff7fb5334  // b.plast
   0x0000fffff7fb52f8:	36d8008d	tbz	w13, #27, 0xfffff7fb5308
   0x0000fffff7fb52fc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb5300:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb5304:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb5308:	36d80091	tbz	w17, #27, 0xfffff7fb5318
   0x0000fffff7fb530c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb5310:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb5314:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb5318:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb531c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb5320:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb5324:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb5328:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb532c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb5330:	1400000e	b	0xfffff7fb5368
   0x0000fffff7fb5334:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb5338:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb533c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb5340:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5344:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fb5348:	aa1403e4	mov	x4, x20
   0x0000fffff7fb534c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb5350:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb5354:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb5358:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb535c:	d63f0200	blr	x16
   0x0000fffff7fb5360:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb5364:	54005fc0	b.eq	0xfffff7fb5f5c  // b.none
   0x0000fffff7fb5368:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb536c:	37d806a9	tbnz	w9, #27, 0xfffff7fb5440
   0x0000fffff7fb5370:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb5374:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5378:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb537c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5380:	540001c1	b.ne	0xfffff7fb53b8  // b.any
   0x0000fffff7fb5384:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb5388:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb538c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5390:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5394:	54000121	b.ne	0xfffff7fb53b8  // b.any
   0x0000fffff7fb5398:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb539c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb53a0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb53a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb53a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb53ac:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb53b0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb53b4:	14000030	b	0xfffff7fb5474
   0x0000fffff7fb53b8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb53bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb53c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb53c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb53c8:	54000120	b.eq	0xfffff7fb53ec  // b.none
   0x0000fffff7fb53cc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb53d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb53d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb53d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb53dc:	54000321	b.ne	0xfffff7fb5440  // b.any
   0x0000fffff7fb53e0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb53e4:	9e620120	scvtf	d0, x9
   0x0000fffff7fb53e8:	14000002	b	0xfffff7fb53f0
   0x0000fffff7fb53ec:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb53f0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb53f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb53f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb53fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5400:	54000120	b.eq	0xfffff7fb5424  // b.none
   0x0000fffff7fb5404:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb5408:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb540c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5410:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5414:	54000161	b.ne	0xfffff7fb5440  // b.any
   0x0000fffff7fb5418:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb541c:	9e620121	scvtf	d1, x9
   0x0000fffff7fb5420:	14000002	b	0xfffff7fb5428
   0x0000fffff7fb5424:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb5428:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb542c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb5430:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb5434:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5438:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb543c:	17ffffde	b	0xfffff7fb53b4
   0x0000fffff7fb5440:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb5444:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb5448:	aa1303e1	mov	x1, x19
   0x0000fffff7fb544c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5450:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fb5454:	aa1403e4	mov	x4, x20
   0x0000fffff7fb5458:	aa1603e5	mov	x5, x22
   0x0000fffff7fb545c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb5460:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb5464:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb5468:	d63f0200	blr	x16
   0x0000fffff7fb546c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb5470:	540057a0	b.eq	0xfffff7fb5f64  // b.none
   0x0000fffff7fb5474:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb5478:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb547c:	540004a0	b.eq	0xfffff7fb5510  // b.none
   0x0000fffff7fb5480:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb5484:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb5488:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb548c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb5490:	54000400	b.eq	0xfffff7fb5510  // b.none
   0x0000fffff7fb5494:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb5498:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb549c:	36d801d1	tbz	w17, #27, 0xfffff7fb54d4
   0x0000fffff7fb54a0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb54a4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb54a8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb54ac:	54000321	b.ne	0xfffff7fb5510  // b.any
   0x0000fffff7fb54b0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb54b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb54b8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb54bc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb54c0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb54c4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb54c8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb54cc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb54d0:	54000209	b.ls	0xfffff7fb5510  // b.plast
   0x0000fffff7fb54d4:	36d8008d	tbz	w13, #27, 0xfffff7fb54e4
   0x0000fffff7fb54d8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb54dc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb54e0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb54e4:	36d80091	tbz	w17, #27, 0xfffff7fb54f4
   0x0000fffff7fb54e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb54ec:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb54f0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb54f4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb54f8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb54fc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb5500:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb5504:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb5508:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb550c:	1400000e	b	0xfffff7fb5544
   0x0000fffff7fb5510:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb5514:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb5518:	aa1303e1	mov	x1, x19
   0x0000fffff7fb551c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5520:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fb5524:	aa1403e4	mov	x4, x20
   0x0000fffff7fb5528:	aa1603e5	mov	x5, x22
   0x0000fffff7fb552c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb5530:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb5534:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb5538:	d63f0200	blr	x16
   0x0000fffff7fb553c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb5540:	54005160	b.eq	0xfffff7fb5f6c  // b.none
   0x0000fffff7fb5544:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb5548:	37d806a9	tbnz	w9, #27, 0xfffff7fb561c
   0x0000fffff7fb554c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb5550:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5554:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5558:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb555c:	540001c1	b.ne	0xfffff7fb5594  // b.any
   0x0000fffff7fb5560:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb5564:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5568:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb556c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5570:	54000121	b.ne	0xfffff7fb5594  // b.any
   0x0000fffff7fb5574:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb5578:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb557c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb5580:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5584:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5588:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb558c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb5590:	14000030	b	0xfffff7fb5650
   0x0000fffff7fb5594:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb5598:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb559c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb55a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb55a4:	54000120	b.eq	0xfffff7fb55c8  // b.none
   0x0000fffff7fb55a8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb55ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb55b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb55b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb55b8:	54000321	b.ne	0xfffff7fb561c  // b.any
   0x0000fffff7fb55bc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb55c0:	9e620120	scvtf	d0, x9
   0x0000fffff7fb55c4:	14000002	b	0xfffff7fb55cc
   0x0000fffff7fb55c8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb55cc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb55d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb55d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb55d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb55dc:	54000120	b.eq	0xfffff7fb5600  // b.none
   0x0000fffff7fb55e0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb55e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb55e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb55ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb55f0:	54000161	b.ne	0xfffff7fb561c  // b.any
   0x0000fffff7fb55f4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb55f8:	9e620121	scvtf	d1, x9
   0x0000fffff7fb55fc:	14000002	b	0xfffff7fb5604
   0x0000fffff7fb5600:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb5604:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb5608:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb560c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb5610:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5614:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb5618:	17ffffde	b	0xfffff7fb5590
   0x0000fffff7fb561c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb5620:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb5624:	aa1303e1	mov	x1, x19
   0x0000fffff7fb5628:	aa1503e2	mov	x2, x21
   0x0000fffff7fb562c:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fb5630:	aa1403e4	mov	x4, x20
   0x0000fffff7fb5634:	aa1603e5	mov	x5, x22
   0x0000fffff7fb5638:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb563c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb5640:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb5644:	d63f0200	blr	x16
   0x0000fffff7fb5648:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb564c:	54004940	b.eq	0xfffff7fb5f74  // b.none
   0x0000fffff7fb5650:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb5654:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb5658:	540004a0	b.eq	0xfffff7fb56ec  // b.none
   0x0000fffff7fb565c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb5660:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb5664:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb5668:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb566c:	54000400	b.eq	0xfffff7fb56ec  // b.none
   0x0000fffff7fb5670:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb5674:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb5678:	36d801d1	tbz	w17, #27, 0xfffff7fb56b0
   0x0000fffff7fb567c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb5680:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb5684:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb5688:	54000321	b.ne	0xfffff7fb56ec  // b.any
   0x0000fffff7fb568c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb5690:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb5694:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb5698:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb569c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb56a0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb56a4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb56a8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb56ac:	54000209	b.ls	0xfffff7fb56ec  // b.plast
   0x0000fffff7fb56b0:	36d8008d	tbz	w13, #27, 0xfffff7fb56c0
   0x0000fffff7fb56b4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb56b8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb56bc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb56c0:	36d80091	tbz	w17, #27, 0xfffff7fb56d0
   0x0000fffff7fb56c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb56c8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb56cc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb56d0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb56d4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb56d8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb56dc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb56e0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb56e4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb56e8:	1400000e	b	0xfffff7fb5720
   0x0000fffff7fb56ec:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb56f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb56f4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb56f8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb56fc:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fb5700:	aa1403e4	mov	x4, x20
   0x0000fffff7fb5704:	aa1603e5	mov	x5, x22
   0x0000fffff7fb5708:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb570c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb5710:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb5714:	d63f0200	blr	x16
   0x0000fffff7fb5718:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb571c:	54004300	b.eq	0xfffff7fb5f7c  // b.none
   0x0000fffff7fb5720:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb5724:	37d806a9	tbnz	w9, #27, 0xfffff7fb57f8
   0x0000fffff7fb5728:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb572c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5730:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5734:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5738:	540001c1	b.ne	0xfffff7fb5770  // b.any
   0x0000fffff7fb573c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb5740:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5744:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5748:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb574c:	54000121	b.ne	0xfffff7fb5770  // b.any
   0x0000fffff7fb5750:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb5754:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb5758:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb575c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5760:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5764:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb5768:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb576c:	14000030	b	0xfffff7fb582c
   0x0000fffff7fb5770:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb5774:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb5778:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb577c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5780:	54000120	b.eq	0xfffff7fb57a4  // b.none
   0x0000fffff7fb5784:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb5788:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb578c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5790:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5794:	54000321	b.ne	0xfffff7fb57f8  // b.any
   0x0000fffff7fb5798:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb579c:	9e620120	scvtf	d0, x9
   0x0000fffff7fb57a0:	14000002	b	0xfffff7fb57a8
   0x0000fffff7fb57a4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb57a8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb57ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb57b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb57b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb57b8:	54000120	b.eq	0xfffff7fb57dc  // b.none
   0x0000fffff7fb57bc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb57c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb57c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb57c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb57cc:	54000161	b.ne	0xfffff7fb57f8  // b.any
   0x0000fffff7fb57d0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb57d4:	9e620121	scvtf	d1, x9
   0x0000fffff7fb57d8:	14000002	b	0xfffff7fb57e0
   0x0000fffff7fb57dc:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb57e0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb57e4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb57e8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb57ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb57f0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb57f4:	17ffffde	b	0xfffff7fb576c
   0x0000fffff7fb57f8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb57fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb5800:	aa1303e1	mov	x1, x19
   0x0000fffff7fb5804:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5808:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fb580c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb5810:	aa1603e5	mov	x5, x22
   0x0000fffff7fb5814:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb5818:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb581c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb5820:	d63f0200	blr	x16
   0x0000fffff7fb5824:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb5828:	54003ae0	b.eq	0xfffff7fb5f84  // b.none
   0x0000fffff7fb582c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb5830:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb5834:	540004a0	b.eq	0xfffff7fb58c8  // b.none
   0x0000fffff7fb5838:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb583c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb5840:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb5844:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb5848:	54000400	b.eq	0xfffff7fb58c8  // b.none
   0x0000fffff7fb584c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb5850:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb5854:	36d801d1	tbz	w17, #27, 0xfffff7fb588c
   0x0000fffff7fb5858:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb585c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb5860:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb5864:	54000321	b.ne	0xfffff7fb58c8  // b.any
   0x0000fffff7fb5868:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb586c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb5870:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb5874:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb5878:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb587c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb5880:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb5884:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb5888:	54000209	b.ls	0xfffff7fb58c8  // b.plast
   0x0000fffff7fb588c:	36d8008d	tbz	w13, #27, 0xfffff7fb589c
   0x0000fffff7fb5890:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb5894:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb5898:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb589c:	36d80091	tbz	w17, #27, 0xfffff7fb58ac
   0x0000fffff7fb58a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb58a4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb58a8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb58ac:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb58b0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb58b4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb58b8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb58bc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb58c0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb58c4:	1400000e	b	0xfffff7fb58fc
   0x0000fffff7fb58c8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb58cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb58d0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb58d4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb58d8:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fb58dc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb58e0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb58e4:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb58e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb58ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb58f0:	d63f0200	blr	x16
   0x0000fffff7fb58f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb58f8:	540034a0	b.eq	0xfffff7fb5f8c  // b.none
   0x0000fffff7fb58fc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb5900:	37d806a9	tbnz	w9, #27, 0xfffff7fb59d4
   0x0000fffff7fb5904:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb5908:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb590c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5910:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5914:	540001c1	b.ne	0xfffff7fb594c  // b.any
   0x0000fffff7fb5918:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb591c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5920:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5924:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5928:	54000121	b.ne	0xfffff7fb594c  // b.any
   0x0000fffff7fb592c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb5930:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb5934:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb5938:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb593c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5940:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb5944:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb5948:	14000030	b	0xfffff7fb5a08
   0x0000fffff7fb594c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb5950:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb5954:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5958:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb595c:	54000120	b.eq	0xfffff7fb5980  // b.none
   0x0000fffff7fb5960:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb5964:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5968:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb596c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5970:	54000321	b.ne	0xfffff7fb59d4  // b.any
   0x0000fffff7fb5974:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb5978:	9e620120	scvtf	d0, x9
   0x0000fffff7fb597c:	14000002	b	0xfffff7fb5984
   0x0000fffff7fb5980:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb5984:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb5988:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb598c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5990:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5994:	54000120	b.eq	0xfffff7fb59b8  // b.none
   0x0000fffff7fb5998:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb599c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb59a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb59a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb59a8:	54000161	b.ne	0xfffff7fb59d4  // b.any
   0x0000fffff7fb59ac:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb59b0:	9e620121	scvtf	d1, x9
   0x0000fffff7fb59b4:	14000002	b	0xfffff7fb59bc
   0x0000fffff7fb59b8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb59bc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb59c0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb59c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb59c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb59cc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb59d0:	17ffffde	b	0xfffff7fb5948
   0x0000fffff7fb59d4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb59d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb59dc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb59e0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb59e4:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fb59e8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb59ec:	aa1603e5	mov	x5, x22
   0x0000fffff7fb59f0:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb59f4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb59f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb59fc:	d63f0200	blr	x16
   0x0000fffff7fb5a00:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb5a04:	54002c80	b.eq	0xfffff7fb5f94  // b.none
   0x0000fffff7fb5a08:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb5a0c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb5a10:	540004a0	b.eq	0xfffff7fb5aa4  // b.none
   0x0000fffff7fb5a14:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb5a18:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb5a1c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb5a20:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb5a24:	54000400	b.eq	0xfffff7fb5aa4  // b.none
   0x0000fffff7fb5a28:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb5a2c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb5a30:	36d801d1	tbz	w17, #27, 0xfffff7fb5a68
   0x0000fffff7fb5a34:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb5a38:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb5a3c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb5a40:	54000321	b.ne	0xfffff7fb5aa4  // b.any
   0x0000fffff7fb5a44:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb5a48:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb5a4c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb5a50:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb5a54:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb5a58:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb5a5c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb5a60:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb5a64:	54000209	b.ls	0xfffff7fb5aa4  // b.plast
   0x0000fffff7fb5a68:	36d8008d	tbz	w13, #27, 0xfffff7fb5a78
   0x0000fffff7fb5a6c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb5a70:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb5a74:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb5a78:	36d80091	tbz	w17, #27, 0xfffff7fb5a88
   0x0000fffff7fb5a7c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb5a80:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb5a84:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb5a88:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb5a8c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb5a90:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb5a94:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb5a98:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb5a9c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb5aa0:	1400000e	b	0xfffff7fb5ad8
   0x0000fffff7fb5aa4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb5aa8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb5aac:	aa1303e1	mov	x1, x19
   0x0000fffff7fb5ab0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5ab4:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fb5ab8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb5abc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb5ac0:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb5ac4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb5ac8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb5acc:	d63f0200	blr	x16
   0x0000fffff7fb5ad0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb5ad4:	54002640	b.eq	0xfffff7fb5f9c  // b.none
   0x0000fffff7fb5ad8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb5adc:	37d806a9	tbnz	w9, #27, 0xfffff7fb5bb0
   0x0000fffff7fb5ae0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb5ae4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5ae8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5aec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5af0:	540001c1	b.ne	0xfffff7fb5b28  // b.any
   0x0000fffff7fb5af4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb5af8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5afc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5b00:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5b04:	54000121	b.ne	0xfffff7fb5b28  // b.any
   0x0000fffff7fb5b08:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb5b0c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb5b10:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb5b14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5b18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5b1c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb5b20:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb5b24:	14000030	b	0xfffff7fb5be4
   0x0000fffff7fb5b28:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb5b2c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb5b30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5b34:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5b38:	54000120	b.eq	0xfffff7fb5b5c  // b.none
   0x0000fffff7fb5b3c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb5b40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5b44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5b48:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5b4c:	54000321	b.ne	0xfffff7fb5bb0  // b.any
   0x0000fffff7fb5b50:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb5b54:	9e620120	scvtf	d0, x9
   0x0000fffff7fb5b58:	14000002	b	0xfffff7fb5b60
   0x0000fffff7fb5b5c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb5b60:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb5b64:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb5b68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5b6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5b70:	54000120	b.eq	0xfffff7fb5b94  // b.none
   0x0000fffff7fb5b74:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb5b78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5b7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5b80:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5b84:	54000161	b.ne	0xfffff7fb5bb0  // b.any
   0x0000fffff7fb5b88:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb5b8c:	9e620121	scvtf	d1, x9
   0x0000fffff7fb5b90:	14000002	b	0xfffff7fb5b98
   0x0000fffff7fb5b94:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb5b98:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb5b9c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb5ba0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb5ba4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5ba8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb5bac:	17ffffde	b	0xfffff7fb5b24
   0x0000fffff7fb5bb0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb5bb4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb5bb8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb5bbc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5bc0:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fb5bc4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb5bc8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb5bcc:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb5bd0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb5bd4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb5bd8:	d63f0200	blr	x16
   0x0000fffff7fb5bdc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb5be0:	54001e20	b.eq	0xfffff7fb5fa4  // b.none
   0x0000fffff7fb5be4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb5be8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb5bec:	540004a0	b.eq	0xfffff7fb5c80  // b.none
   0x0000fffff7fb5bf0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb5bf4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb5bf8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb5bfc:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb5c00:	54000400	b.eq	0xfffff7fb5c80  // b.none
   0x0000fffff7fb5c04:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb5c08:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb5c0c:	36d801d1	tbz	w17, #27, 0xfffff7fb5c44
   0x0000fffff7fb5c10:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb5c14:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb5c18:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb5c1c:	54000321	b.ne	0xfffff7fb5c80  // b.any
   0x0000fffff7fb5c20:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb5c24:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb5c28:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb5c2c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb5c30:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb5c34:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb5c38:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb5c3c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb5c40:	54000209	b.ls	0xfffff7fb5c80  // b.plast
   0x0000fffff7fb5c44:	36d8008d	tbz	w13, #27, 0xfffff7fb5c54
   0x0000fffff7fb5c48:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb5c4c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb5c50:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb5c54:	36d80091	tbz	w17, #27, 0xfffff7fb5c64
   0x0000fffff7fb5c58:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb5c5c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb5c60:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb5c64:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb5c68:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb5c6c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb5c70:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb5c74:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb5c78:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb5c7c:	1400000e	b	0xfffff7fb5cb4
   0x0000fffff7fb5c80:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb5c84:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb5c88:	aa1303e1	mov	x1, x19
   0x0000fffff7fb5c8c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5c90:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fb5c94:	aa1403e4	mov	x4, x20
   0x0000fffff7fb5c98:	aa1603e5	mov	x5, x22
   0x0000fffff7fb5c9c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb5ca0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb5ca4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb5ca8:	d63f0200	blr	x16
   0x0000fffff7fb5cac:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb5cb0:	540017e0	b.eq	0xfffff7fb5fac  // b.none
   0x0000fffff7fb5cb4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb5cb8:	37d806a9	tbnz	w9, #27, 0xfffff7fb5d8c
   0x0000fffff7fb5cbc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb5cc0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5cc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5cc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5ccc:	540001c1	b.ne	0xfffff7fb5d04  // b.any
   0x0000fffff7fb5cd0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb5cd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5cd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5cdc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5ce0:	54000121	b.ne	0xfffff7fb5d04  // b.any
   0x0000fffff7fb5ce4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb5ce8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb5cec:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb5cf0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5cf4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5cf8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb5cfc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb5d00:	14000030	b	0xfffff7fb5dc0
   0x0000fffff7fb5d04:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb5d08:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb5d0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5d10:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5d14:	54000120	b.eq	0xfffff7fb5d38  // b.none
   0x0000fffff7fb5d18:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb5d1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5d20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5d24:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5d28:	54000321	b.ne	0xfffff7fb5d8c  // b.any
   0x0000fffff7fb5d2c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb5d30:	9e620120	scvtf	d0, x9
   0x0000fffff7fb5d34:	14000002	b	0xfffff7fb5d3c
   0x0000fffff7fb5d38:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb5d3c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb5d40:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb5d44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5d48:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5d4c:	54000120	b.eq	0xfffff7fb5d70  // b.none
   0x0000fffff7fb5d50:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb5d54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5d58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5d5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5d60:	54000161	b.ne	0xfffff7fb5d8c  // b.any
   0x0000fffff7fb5d64:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb5d68:	9e620121	scvtf	d1, x9
   0x0000fffff7fb5d6c:	14000002	b	0xfffff7fb5d74
   0x0000fffff7fb5d70:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb5d74:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb5d78:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb5d7c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb5d80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5d84:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb5d88:	17ffffde	b	0xfffff7fb5d00
   0x0000fffff7fb5d8c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb5d90:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb5d94:	aa1303e1	mov	x1, x19
   0x0000fffff7fb5d98:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5d9c:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fb5da0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb5da4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb5da8:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb5dac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb5db0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb5db4:	d63f0200	blr	x16
   0x0000fffff7fb5db8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb5dbc:	54000fc0	b.eq	0xfffff7fb5fb4  // b.none
   0x0000fffff7fb5dc0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb5dc4:	37d80269	tbnz	w9, #27, 0xfffff7fb5e10
   0x0000fffff7fb5dc8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb5dcc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5dd0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5dd4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5dd8:	540001c1	b.ne	0xfffff7fb5e10  // b.any
   0x0000fffff7fb5ddc:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fb5de0:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7fb5de4:	8b0a012b	add	x11, x9, x10
   0x0000fffff7fb5de8:	f9003669	str	x9, [x19, #104]
   0x0000fffff7fb5dec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5df0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5df4:	b900626a	str	w10, [x19, #96]
   0x0000fffff7fb5df8:	aa0b03e9	mov	x9, x11
   0x0000fffff7fb5dfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5e00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5e04:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7fb5e08:	b900526a	str	w10, [x19, #80]
   0x0000fffff7fb5e0c:	1400000e	b	0xfffff7fb5e44
   0x0000fffff7fb5e10:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb5e14:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb5e18:	aa1303e1	mov	x1, x19
   0x0000fffff7fb5e1c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5e20:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fb5e24:	aa1403e4	mov	x4, x20
   0x0000fffff7fb5e28:	aa1603e5	mov	x5, x22
   0x0000fffff7fb5e2c:	d290bc10	mov	x16, #0x85e0                	// #34272
   0x0000fffff7fb5e30:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb5e34:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb5e38:	d63f0200	blr	x16
   0x0000fffff7fb5e3c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb5e40:	54000be0	b.eq	0xfffff7fb5fbc  // b.none
   0x0000fffff7fb5e44:	17fff8d2	b	0xfffff7fb418c
   0x0000fffff7fb5e48:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb5e4c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb5e50:	aa1303e1	mov	x1, x19
   0x0000fffff7fb5e54:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5e58:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fb5e5c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb5e60:	aa1603e5	mov	x5, x22
   0x0000fffff7fb5e64:	d286be90	mov	x16, #0x35f4                	// #13812
   0x0000fffff7fb5e68:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb5e6c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb5e70:	d63f0200	blr	x16
   0x0000fffff7fb5e74:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb5e78:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb5e7c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb5e80:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb5e84:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fb5e88:	d65f03c0	ret
   0x0000fffff7fb5e8c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5e90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5e94:	b900028a	str	w10, [x20]
   0x0000fffff7fb5e98:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fb5e9c:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb5ea0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb5ea4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb5ea8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb5eac:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fb5eb0:	d65f03c0	ret
   0x0000fffff7fb5eb4:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fb5eb8:	17fffff5	b	0xfffff7fb5e8c
   0x0000fffff7fb5ebc:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fb5ec0:	17fffff3	b	0xfffff7fb5e8c
   0x0000fffff7fb5ec4:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fb5ec8:	17fffff1	b	0xfffff7fb5e8c
   0x0000fffff7fb5ecc:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fb5ed0:	17ffffef	b	0xfffff7fb5e8c
   0x0000fffff7fb5ed4:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fb5ed8:	17ffffed	b	0xfffff7fb5e8c
   0x0000fffff7fb5edc:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fb5ee0:	17ffffeb	b	0xfffff7fb5e8c
   0x0000fffff7fb5ee4:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fb5ee8:	17ffffe9	b	0xfffff7fb5e8c
   0x0000fffff7fb5eec:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fb5ef0:	17ffffe7	b	0xfffff7fb5e8c
   0x0000fffff7fb5ef4:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fb5ef8:	17ffffe5	b	0xfffff7fb5e8c
   0x0000fffff7fb5efc:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fb5f00:	17ffffe3	b	0xfffff7fb5e8c
   0x0000fffff7fb5f04:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fb5f08:	17ffffe1	b	0xfffff7fb5e8c
   0x0000fffff7fb5f0c:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fb5f10:	17ffffdf	b	0xfffff7fb5e8c
   0x0000fffff7fb5f14:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fb5f18:	17ffffdd	b	0xfffff7fb5e8c
   0x0000fffff7fb5f1c:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fb5f20:	17ffffdb	b	0xfffff7fb5e8c
   0x0000fffff7fb5f24:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fb5f28:	17ffffd9	b	0xfffff7fb5e8c
   0x0000fffff7fb5f2c:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fb5f30:	17ffffd7	b	0xfffff7fb5e8c
   0x0000fffff7fb5f34:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fb5f38:	17ffffd5	b	0xfffff7fb5e8c
   0x0000fffff7fb5f3c:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fb5f40:	17ffffd3	b	0xfffff7fb5e8c
   0x0000fffff7fb5f44:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fb5f48:	17ffffd1	b	0xfffff7fb5e8c
   0x0000fffff7fb5f4c:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fb5f50:	17ffffcf	b	0xfffff7fb5e8c
   0x0000fffff7fb5f54:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fb5f58:	17ffffcd	b	0xfffff7fb5e8c
   0x0000fffff7fb5f5c:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fb5f60:	17ffffcb	b	0xfffff7fb5e8c
   0x0000fffff7fb5f64:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fb5f68:	17ffffc9	b	0xfffff7fb5e8c
   0x0000fffff7fb5f6c:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fb5f70:	17ffffc7	b	0xfffff7fb5e8c
   0x0000fffff7fb5f74:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fb5f78:	17ffffc5	b	0xfffff7fb5e8c
   0x0000fffff7fb5f7c:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fb5f80:	17ffffc3	b	0xfffff7fb5e8c
   0x0000fffff7fb5f84:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fb5f88:	17ffffc1	b	0xfffff7fb5e8c
   0x0000fffff7fb5f8c:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fb5f90:	17ffffbf	b	0xfffff7fb5e8c
   0x0000fffff7fb5f94:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fb5f98:	17ffffbd	b	0xfffff7fb5e8c
   0x0000fffff7fb5f9c:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fb5fa0:	17ffffbb	b	0xfffff7fb5e8c
   0x0000fffff7fb5fa4:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fb5fa8:	17ffffb9	b	0xfffff7fb5e8c
   0x0000fffff7fb5fac:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fb5fb0:	17ffffb7	b	0xfffff7fb5e8c
   0x0000fffff7fb5fb4:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fb5fb8:	17ffffb5	b	0xfffff7fb5e8c
   0x0000fffff7fb5fbc:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fb5fc0:	17ffffb3	b	0xfffff7fb5e8c
   0x0000fffff7fb5fc4:	00000000	udf	#0
   0x0000fffff7fb5fc8:	00000000	udf	#0
   0x0000fffff7fb5fcc:	00000000	udf	#0
   0x0000fffff7fb5fd0:	00000000	udf	#0
   0x0000fffff7fb5fd4:	00000000	udf	#0
   0x0000fffff7fb5fd8:	00000000	udf	#0
   0x0000fffff7fb5fdc:	00000000	udf	#0
   0x0000fffff7fb5fe0:	00000000	udf	#0
   0x0000fffff7fb5fe4:	00000000	udf	#0
   0x0000fffff7fb5fe8:	00000000	udf	#0
   0x0000fffff7fb5fec:	00000000	udf	#0
   0x0000fffff7fb5ff0:	00000000	udf	#0
   0x0000fffff7fb5ff4:	00000000	udf	#0
   0x0000fffff7fb5ff8:	00000000	udf	#0
   0x0000fffff7fb5ffc:	00000000	udf	#0
End of assembler dump.
