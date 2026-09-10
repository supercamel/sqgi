Dump of assembler code from 0xfffff7fa4000 to 0xfffff7fa6000:
   0x0000fffff7fa4000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fa4004:	910003fd	mov	x29, sp
   0x0000fffff7fa4008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fa400c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fa4010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fa4014:	aa0003f3	mov	x19, x0
   0x0000fffff7fa4018:	aa0103f4	mov	x20, x1
   0x0000fffff7fa401c:	aa0203f5	mov	x21, x2
   0x0000fffff7fa4020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fa4024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fa4028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fa402c:	f90003e9	str	x9, [sp]
   0x0000fffff7fa4030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fa4034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fa4038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fa403c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fa4040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4044:	d63f0200	blr	x16
   0x0000fffff7fa4048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fa404c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fa4050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fa4054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fa4058:	14000001	b	0xfffff7fa405c
   0x0000fffff7fa405c:	14000001	b	0xfffff7fa4060
   0x0000fffff7fa4060:	14000001	b	0xfffff7fa4064
   0x0000fffff7fa4064:	14000001	b	0xfffff7fa4068
   0x0000fffff7fa4068:	14000001	b	0xfffff7fa406c
   0x0000fffff7fa406c:	14000001	b	0xfffff7fa4070
   0x0000fffff7fa4070:	14000001	b	0xfffff7fa4074
   0x0000fffff7fa4074:	14000001	b	0xfffff7fa4078
   0x0000fffff7fa4078:	14000001	b	0xfffff7fa407c
   0x0000fffff7fa407c:	14000001	b	0xfffff7fa4080
   0x0000fffff7fa4080:	14000001	b	0xfffff7fa4084
   0x0000fffff7fa4084:	14000001	b	0xfffff7fa4088
   0x0000fffff7fa4088:	14000001	b	0xfffff7fa408c
   0x0000fffff7fa408c:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fa4090:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fa4094:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fa4098:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa409c:	36d80211	tbz	w17, #27, 0xfffff7fa40dc
   0x0000fffff7fa40a0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa40a4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa40a8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa40ac:	540001e1	b.ne	0xfffff7fa40e8  // b.any
   0x0000fffff7fa40b0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa40b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa40b8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa40bc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa40c0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa40c4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa40c8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa40cc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa40d0:	540000c9	b.ls	0xfffff7fa40e8  // b.plast
   0x0000fffff7fa40d4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa40d8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa40dc:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa40e0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa40e4:	1400000e	b	0xfffff7fa411c
   0x0000fffff7fa40e8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa40ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa40f0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa40f4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa40f8:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fa40fc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4100:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4104:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7fa4108:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa410c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4110:	d63f0200	blr	x16
   0x0000fffff7fa4114:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4118:	5400ede0	b.eq	0xfffff7fa5ed4  // b.none
   0x0000fffff7fa411c:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fa4120:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fa4124:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fa4128:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7fa412c:	36d80211	tbz	w17, #27, 0xfffff7fa416c
   0x0000fffff7fa4130:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa4134:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa4138:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa413c:	540001e1	b.ne	0xfffff7fa4178  // b.any
   0x0000fffff7fa4140:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa4144:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4148:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa414c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa4150:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa4154:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa4158:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa415c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa4160:	540000c9	b.ls	0xfffff7fa4178  // b.plast
   0x0000fffff7fa4164:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa4168:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa416c:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa4170:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa4174:	1400000e	b	0xfffff7fa41ac
   0x0000fffff7fa4178:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa417c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4180:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4184:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4188:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fa418c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4190:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4194:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7fa4198:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa419c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa41a0:	d63f0200	blr	x16
   0x0000fffff7fa41a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa41a8:	5400e9a0	b.eq	0xfffff7fa5edc  // b.none
   0x0000fffff7fa41ac:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa41b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa41b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa41b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa41bc:	54000421	b.ne	0xfffff7fa4240  // b.any
   0x0000fffff7fa41c0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa41c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa41c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa41cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa41d0:	54000381	b.ne	0xfffff7fa4240  // b.any
   0x0000fffff7fa41d4:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa41d8:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7fa41dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa41e0:	9a9fa7ec	cset	x12, lt	// lt = tstop
   0x0000fffff7fa41e4:	5280010d	mov	w13, #0x8                   	// #8
   0x0000fffff7fa41e8:	72a0200d	movk	w13, #0x100, lsl #16
   0x0000fffff7fa41ec:	91000580	add	x0, x12, #0x1
   0x0000fffff7fa41f0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa41f4:	36d80211	tbz	w17, #27, 0xfffff7fa4234
   0x0000fffff7fa41f8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa41fc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa4200:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa4204:	540001e1	b.ne	0xfffff7fa4240  // b.any
   0x0000fffff7fa4208:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa420c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4210:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa4214:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa4218:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa421c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa4220:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa4224:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa4228:	540000c9	b.ls	0xfffff7fa4240  // b.plast
   0x0000fffff7fa422c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa4230:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa4234:	f9005ecc	str	x12, [x22, #184]
   0x0000fffff7fa4238:	b900b2cd	str	w13, [x22, #176]
   0x0000fffff7fa423c:	1400000e	b	0xfffff7fa4274
   0x0000fffff7fa4240:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa4244:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4248:	aa1303e1	mov	x1, x19
   0x0000fffff7fa424c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4250:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fa4254:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4258:	aa1603e5	mov	x5, x22
   0x0000fffff7fa425c:	d28fec90	mov	x16, #0x7f64                	// #32612
   0x0000fffff7fa4260:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa4264:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4268:	d63f0200	blr	x16
   0x0000fffff7fa426c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4270:	5400e3a0	b.eq	0xfffff7fa5ee4  // b.none
   0x0000fffff7fa4274:	f100041f	cmp	x0, #0x1
   0x0000fffff7fa4278:	5400df80	b.eq	0xfffff7fa5e68  // b.none
   0x0000fffff7fa427c:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa4280:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa4284:	d299d20c	mov	x12, #0xce90                	// #52880
   0x0000fffff7fa4288:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa428c:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa4290:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7fa4294:	36d801d1	tbz	w17, #27, 0xfffff7fa42cc
   0x0000fffff7fa4298:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa429c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa42a0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa42a4:	54000281	b.ne	0xfffff7fa42f4  // b.any
   0x0000fffff7fa42a8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa42ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa42b0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa42b4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa42b8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa42bc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa42c0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa42c4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa42c8:	54000169	b.ls	0xfffff7fa42f4  // b.plast
   0x0000fffff7fa42cc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa42d0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa42d4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa42d8:	36d80091	tbz	w17, #27, 0xfffff7fa42e8
   0x0000fffff7fa42dc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa42e0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa42e4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa42e8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa42ec:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa42f0:	1400000e	b	0xfffff7fa4328
   0x0000fffff7fa42f4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa42f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa42fc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4300:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4304:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fa4308:	aa1403e4	mov	x4, x20
   0x0000fffff7fa430c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4310:	d2933c10	mov	x16, #0x99e0                	// #39392
   0x0000fffff7fa4314:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa4318:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa431c:	d63f0200	blr	x16
   0x0000fffff7fa4320:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4324:	5400de40	b.eq	0xfffff7fa5eec  // b.none
   0x0000fffff7fa4328:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa432c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa4330:	540003a0	b.eq	0xfffff7fa43a4  // b.none
   0x0000fffff7fa4334:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7fa4338:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7fa433c:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa4340:	36d801d1	tbz	w17, #27, 0xfffff7fa4378
   0x0000fffff7fa4344:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa4348:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa434c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa4350:	540002a1	b.ne	0xfffff7fa43a4  // b.any
   0x0000fffff7fa4354:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa4358:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa435c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa4360:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa4364:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa4368:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa436c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa4370:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa4374:	54000189	b.ls	0xfffff7fa43a4  // b.plast
   0x0000fffff7fa4378:	36d8008d	tbz	w13, #27, 0xfffff7fa4388
   0x0000fffff7fa437c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa4380:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa4384:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa4388:	36d80091	tbz	w17, #27, 0xfffff7fa4398
   0x0000fffff7fa438c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4390:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa4394:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa4398:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa439c:	b900016d	str	w13, [x11]
   0x0000fffff7fa43a0:	1400000e	b	0xfffff7fa43d8
   0x0000fffff7fa43a4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa43a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa43ac:	aa1303e1	mov	x1, x19
   0x0000fffff7fa43b0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa43b4:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fa43b8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa43bc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa43c0:	d29e2e10	mov	x16, #0xf170                	// #61808
   0x0000fffff7fa43c4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa43c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa43cc:	d63f0200	blr	x16
   0x0000fffff7fa43d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa43d4:	5400d900	b.eq	0xfffff7fa5ef4  // b.none
   0x0000fffff7fa43d8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa43dc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa43e0:	540004a0	b.eq	0xfffff7fa4474  // b.none
   0x0000fffff7fa43e4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa43e8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa43ec:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa43f0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa43f4:	54000400	b.eq	0xfffff7fa4474  // b.none
   0x0000fffff7fa43f8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa43fc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa4400:	36d801d1	tbz	w17, #27, 0xfffff7fa4438
   0x0000fffff7fa4404:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa4408:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa440c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa4410:	54000321	b.ne	0xfffff7fa4474  // b.any
   0x0000fffff7fa4414:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa4418:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa441c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa4420:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa4424:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa4428:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa442c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa4430:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa4434:	54000209	b.ls	0xfffff7fa4474  // b.plast
   0x0000fffff7fa4438:	36d8008d	tbz	w13, #27, 0xfffff7fa4448
   0x0000fffff7fa443c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa4440:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa4444:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa4448:	36d80091	tbz	w17, #27, 0xfffff7fa4458
   0x0000fffff7fa444c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4450:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa4454:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa4458:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa445c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa4460:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa4464:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa4468:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa446c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa4470:	1400000e	b	0xfffff7fa44a8
   0x0000fffff7fa4474:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa4478:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa447c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4480:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4484:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fa4488:	aa1403e4	mov	x4, x20
   0x0000fffff7fa448c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4490:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa4494:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa4498:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa449c:	d63f0200	blr	x16
   0x0000fffff7fa44a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa44a4:	5400d2c0	b.eq	0xfffff7fa5efc  // b.none
   0x0000fffff7fa44a8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa44ac:	37d806a9	tbnz	w9, #27, 0xfffff7fa4580
   0x0000fffff7fa44b0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa44b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa44b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa44bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa44c0:	540001c1	b.ne	0xfffff7fa44f8  // b.any
   0x0000fffff7fa44c4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa44c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa44cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa44d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa44d4:	54000121	b.ne	0xfffff7fa44f8  // b.any
   0x0000fffff7fa44d8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa44dc:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa44e0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa44e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa44e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa44ec:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa44f0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa44f4:	14000030	b	0xfffff7fa45b4
   0x0000fffff7fa44f8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa44fc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4500:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4504:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4508:	54000120	b.eq	0xfffff7fa452c  // b.none
   0x0000fffff7fa450c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa4510:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4514:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4518:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa451c:	54000321	b.ne	0xfffff7fa4580  // b.any
   0x0000fffff7fa4520:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa4524:	9e620120	scvtf	d0, x9
   0x0000fffff7fa4528:	14000002	b	0xfffff7fa4530
   0x0000fffff7fa452c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa4530:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa4534:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4538:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa453c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4540:	54000120	b.eq	0xfffff7fa4564  // b.none
   0x0000fffff7fa4544:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa4548:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa454c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4550:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4554:	54000161	b.ne	0xfffff7fa4580  // b.any
   0x0000fffff7fa4558:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa455c:	9e620121	scvtf	d1, x9
   0x0000fffff7fa4560:	14000002	b	0xfffff7fa4568
   0x0000fffff7fa4564:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa4568:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa456c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa4570:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4574:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4578:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa457c:	17ffffde	b	0xfffff7fa44f4
   0x0000fffff7fa4580:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa4584:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4588:	aa1303e1	mov	x1, x19
   0x0000fffff7fa458c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4590:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fa4594:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4598:	aa1603e5	mov	x5, x22
   0x0000fffff7fa459c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa45a0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa45a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa45a8:	d63f0200	blr	x16
   0x0000fffff7fa45ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa45b0:	5400caa0	b.eq	0xfffff7fa5f04  // b.none
   0x0000fffff7fa45b4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa45b8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa45bc:	540004a0	b.eq	0xfffff7fa4650  // b.none
   0x0000fffff7fa45c0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa45c4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa45c8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa45cc:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa45d0:	54000400	b.eq	0xfffff7fa4650  // b.none
   0x0000fffff7fa45d4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa45d8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa45dc:	36d801d1	tbz	w17, #27, 0xfffff7fa4614
   0x0000fffff7fa45e0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa45e4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa45e8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa45ec:	54000321	b.ne	0xfffff7fa4650  // b.any
   0x0000fffff7fa45f0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa45f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa45f8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa45fc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa4600:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa4604:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa4608:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa460c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa4610:	54000209	b.ls	0xfffff7fa4650  // b.plast
   0x0000fffff7fa4614:	36d8008d	tbz	w13, #27, 0xfffff7fa4624
   0x0000fffff7fa4618:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa461c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa4620:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa4624:	36d80091	tbz	w17, #27, 0xfffff7fa4634
   0x0000fffff7fa4628:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa462c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa4630:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa4634:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa4638:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa463c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa4640:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa4644:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa4648:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa464c:	1400000e	b	0xfffff7fa4684
   0x0000fffff7fa4650:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa4654:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4658:	aa1303e1	mov	x1, x19
   0x0000fffff7fa465c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4660:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fa4664:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4668:	aa1603e5	mov	x5, x22
   0x0000fffff7fa466c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa4670:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa4674:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4678:	d63f0200	blr	x16
   0x0000fffff7fa467c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4680:	5400c460	b.eq	0xfffff7fa5f0c  // b.none
   0x0000fffff7fa4684:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa4688:	37d806a9	tbnz	w9, #27, 0xfffff7fa475c
   0x0000fffff7fa468c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa4690:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4694:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4698:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa469c:	540001c1	b.ne	0xfffff7fa46d4  // b.any
   0x0000fffff7fa46a0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa46a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa46a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa46ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa46b0:	54000121	b.ne	0xfffff7fa46d4  // b.any
   0x0000fffff7fa46b4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa46b8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa46bc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa46c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa46c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa46c8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa46cc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa46d0:	14000030	b	0xfffff7fa4790
   0x0000fffff7fa46d4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa46d8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa46dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa46e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa46e4:	54000120	b.eq	0xfffff7fa4708  // b.none
   0x0000fffff7fa46e8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa46ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa46f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa46f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa46f8:	54000321	b.ne	0xfffff7fa475c  // b.any
   0x0000fffff7fa46fc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa4700:	9e620120	scvtf	d0, x9
   0x0000fffff7fa4704:	14000002	b	0xfffff7fa470c
   0x0000fffff7fa4708:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa470c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa4710:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4714:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4718:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa471c:	54000120	b.eq	0xfffff7fa4740  // b.none
   0x0000fffff7fa4720:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa4724:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4728:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa472c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4730:	54000161	b.ne	0xfffff7fa475c  // b.any
   0x0000fffff7fa4734:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa4738:	9e620121	scvtf	d1, x9
   0x0000fffff7fa473c:	14000002	b	0xfffff7fa4744
   0x0000fffff7fa4740:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa4744:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa4748:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa474c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4750:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4754:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa4758:	17ffffde	b	0xfffff7fa46d0
   0x0000fffff7fa475c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa4760:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4764:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4768:	aa1503e2	mov	x2, x21
   0x0000fffff7fa476c:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fa4770:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4774:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4778:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa477c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa4780:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4784:	d63f0200	blr	x16
   0x0000fffff7fa4788:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa478c:	5400bc40	b.eq	0xfffff7fa5f14  // b.none
   0x0000fffff7fa4790:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa4794:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa4798:	540004a0	b.eq	0xfffff7fa482c  // b.none
   0x0000fffff7fa479c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa47a0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa47a4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa47a8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa47ac:	54000400	b.eq	0xfffff7fa482c  // b.none
   0x0000fffff7fa47b0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa47b4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa47b8:	36d801d1	tbz	w17, #27, 0xfffff7fa47f0
   0x0000fffff7fa47bc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa47c0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa47c4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa47c8:	54000321	b.ne	0xfffff7fa482c  // b.any
   0x0000fffff7fa47cc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa47d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa47d4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa47d8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa47dc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa47e0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa47e4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa47e8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa47ec:	54000209	b.ls	0xfffff7fa482c  // b.plast
   0x0000fffff7fa47f0:	36d8008d	tbz	w13, #27, 0xfffff7fa4800
   0x0000fffff7fa47f4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa47f8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa47fc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa4800:	36d80091	tbz	w17, #27, 0xfffff7fa4810
   0x0000fffff7fa4804:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4808:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa480c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa4810:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa4814:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa4818:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa481c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa4820:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa4824:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa4828:	1400000e	b	0xfffff7fa4860
   0x0000fffff7fa482c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa4830:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4834:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4838:	aa1503e2	mov	x2, x21
   0x0000fffff7fa483c:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fa4840:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4844:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4848:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa484c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa4850:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4854:	d63f0200	blr	x16
   0x0000fffff7fa4858:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa485c:	5400b600	b.eq	0xfffff7fa5f1c  // b.none
   0x0000fffff7fa4860:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa4864:	37d806a9	tbnz	w9, #27, 0xfffff7fa4938
   0x0000fffff7fa4868:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa486c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4870:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4874:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4878:	540001c1	b.ne	0xfffff7fa48b0  // b.any
   0x0000fffff7fa487c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa4880:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4884:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4888:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa488c:	54000121	b.ne	0xfffff7fa48b0  // b.any
   0x0000fffff7fa4890:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa4894:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa4898:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa489c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa48a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa48a4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa48a8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa48ac:	14000030	b	0xfffff7fa496c
   0x0000fffff7fa48b0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa48b4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa48b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa48bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa48c0:	54000120	b.eq	0xfffff7fa48e4  // b.none
   0x0000fffff7fa48c4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa48c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa48cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa48d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa48d4:	54000321	b.ne	0xfffff7fa4938  // b.any
   0x0000fffff7fa48d8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa48dc:	9e620120	scvtf	d0, x9
   0x0000fffff7fa48e0:	14000002	b	0xfffff7fa48e8
   0x0000fffff7fa48e4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa48e8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa48ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa48f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa48f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa48f8:	54000120	b.eq	0xfffff7fa491c  // b.none
   0x0000fffff7fa48fc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa4900:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4904:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4908:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa490c:	54000161	b.ne	0xfffff7fa4938  // b.any
   0x0000fffff7fa4910:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa4914:	9e620121	scvtf	d1, x9
   0x0000fffff7fa4918:	14000002	b	0xfffff7fa4920
   0x0000fffff7fa491c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa4920:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa4924:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa4928:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa492c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4930:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa4934:	17ffffde	b	0xfffff7fa48ac
   0x0000fffff7fa4938:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa493c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4940:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4944:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4948:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fa494c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4950:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4954:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa4958:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa495c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4960:	d63f0200	blr	x16
   0x0000fffff7fa4964:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4968:	5400ade0	b.eq	0xfffff7fa5f24  // b.none
   0x0000fffff7fa496c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa4970:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa4974:	540004a0	b.eq	0xfffff7fa4a08  // b.none
   0x0000fffff7fa4978:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa497c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa4980:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa4984:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa4988:	54000400	b.eq	0xfffff7fa4a08  // b.none
   0x0000fffff7fa498c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa4990:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa4994:	36d801d1	tbz	w17, #27, 0xfffff7fa49cc
   0x0000fffff7fa4998:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa499c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa49a0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa49a4:	54000321	b.ne	0xfffff7fa4a08  // b.any
   0x0000fffff7fa49a8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa49ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa49b0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa49b4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa49b8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa49bc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa49c0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa49c4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa49c8:	54000209	b.ls	0xfffff7fa4a08  // b.plast
   0x0000fffff7fa49cc:	36d8008d	tbz	w13, #27, 0xfffff7fa49dc
   0x0000fffff7fa49d0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa49d4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa49d8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa49dc:	36d80091	tbz	w17, #27, 0xfffff7fa49ec
   0x0000fffff7fa49e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa49e4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa49e8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa49ec:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa49f0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa49f4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa49f8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa49fc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa4a00:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa4a04:	1400000e	b	0xfffff7fa4a3c
   0x0000fffff7fa4a08:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa4a0c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4a10:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4a14:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4a18:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fa4a1c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4a20:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4a24:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa4a28:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa4a2c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4a30:	d63f0200	blr	x16
   0x0000fffff7fa4a34:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4a38:	5400a7a0	b.eq	0xfffff7fa5f2c  // b.none
   0x0000fffff7fa4a3c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa4a40:	37d806a9	tbnz	w9, #27, 0xfffff7fa4b14
   0x0000fffff7fa4a44:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa4a48:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4a4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4a50:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4a54:	540001c1	b.ne	0xfffff7fa4a8c  // b.any
   0x0000fffff7fa4a58:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa4a5c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4a60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4a64:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4a68:	54000121	b.ne	0xfffff7fa4a8c  // b.any
   0x0000fffff7fa4a6c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa4a70:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa4a74:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa4a78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4a7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4a80:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa4a84:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa4a88:	14000030	b	0xfffff7fa4b48
   0x0000fffff7fa4a8c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa4a90:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4a94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4a98:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4a9c:	54000120	b.eq	0xfffff7fa4ac0  // b.none
   0x0000fffff7fa4aa0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa4aa4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4aa8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4aac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4ab0:	54000321	b.ne	0xfffff7fa4b14  // b.any
   0x0000fffff7fa4ab4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa4ab8:	9e620120	scvtf	d0, x9
   0x0000fffff7fa4abc:	14000002	b	0xfffff7fa4ac4
   0x0000fffff7fa4ac0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa4ac4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa4ac8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4acc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4ad0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4ad4:	54000120	b.eq	0xfffff7fa4af8  // b.none
   0x0000fffff7fa4ad8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa4adc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4ae0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4ae4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4ae8:	54000161	b.ne	0xfffff7fa4b14  // b.any
   0x0000fffff7fa4aec:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa4af0:	9e620121	scvtf	d1, x9
   0x0000fffff7fa4af4:	14000002	b	0xfffff7fa4afc
   0x0000fffff7fa4af8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa4afc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa4b00:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa4b04:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4b08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4b0c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa4b10:	17ffffde	b	0xfffff7fa4a88
   0x0000fffff7fa4b14:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa4b18:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4b1c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4b20:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4b24:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fa4b28:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4b2c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4b30:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa4b34:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa4b38:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4b3c:	d63f0200	blr	x16
   0x0000fffff7fa4b40:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4b44:	54009f80	b.eq	0xfffff7fa5f34  // b.none
   0x0000fffff7fa4b48:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa4b4c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa4b50:	540004a0	b.eq	0xfffff7fa4be4  // b.none
   0x0000fffff7fa4b54:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa4b58:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa4b5c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa4b60:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa4b64:	54000400	b.eq	0xfffff7fa4be4  // b.none
   0x0000fffff7fa4b68:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa4b6c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa4b70:	36d801d1	tbz	w17, #27, 0xfffff7fa4ba8
   0x0000fffff7fa4b74:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa4b78:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa4b7c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa4b80:	54000321	b.ne	0xfffff7fa4be4  // b.any
   0x0000fffff7fa4b84:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa4b88:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4b8c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa4b90:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa4b94:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa4b98:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa4b9c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa4ba0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa4ba4:	54000209	b.ls	0xfffff7fa4be4  // b.plast
   0x0000fffff7fa4ba8:	36d8008d	tbz	w13, #27, 0xfffff7fa4bb8
   0x0000fffff7fa4bac:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa4bb0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa4bb4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa4bb8:	36d80091	tbz	w17, #27, 0xfffff7fa4bc8
   0x0000fffff7fa4bbc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4bc0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa4bc4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa4bc8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa4bcc:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa4bd0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa4bd4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa4bd8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa4bdc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa4be0:	1400000e	b	0xfffff7fa4c18
   0x0000fffff7fa4be4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa4be8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4bec:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4bf0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4bf4:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fa4bf8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4bfc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4c00:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa4c04:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa4c08:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4c0c:	d63f0200	blr	x16
   0x0000fffff7fa4c10:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4c14:	54009940	b.eq	0xfffff7fa5f3c  // b.none
   0x0000fffff7fa4c18:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa4c1c:	37d806a9	tbnz	w9, #27, 0xfffff7fa4cf0
   0x0000fffff7fa4c20:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa4c24:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4c28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4c2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4c30:	540001c1	b.ne	0xfffff7fa4c68  // b.any
   0x0000fffff7fa4c34:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa4c38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4c3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4c40:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4c44:	54000121	b.ne	0xfffff7fa4c68  // b.any
   0x0000fffff7fa4c48:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa4c4c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa4c50:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa4c54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4c58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4c5c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa4c60:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa4c64:	14000030	b	0xfffff7fa4d24
   0x0000fffff7fa4c68:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa4c6c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4c70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4c74:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4c78:	54000120	b.eq	0xfffff7fa4c9c  // b.none
   0x0000fffff7fa4c7c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa4c80:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4c84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4c88:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4c8c:	54000321	b.ne	0xfffff7fa4cf0  // b.any
   0x0000fffff7fa4c90:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa4c94:	9e620120	scvtf	d0, x9
   0x0000fffff7fa4c98:	14000002	b	0xfffff7fa4ca0
   0x0000fffff7fa4c9c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa4ca0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa4ca4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4ca8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4cac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4cb0:	54000120	b.eq	0xfffff7fa4cd4  // b.none
   0x0000fffff7fa4cb4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa4cb8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4cbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4cc0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4cc4:	54000161	b.ne	0xfffff7fa4cf0  // b.any
   0x0000fffff7fa4cc8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa4ccc:	9e620121	scvtf	d1, x9
   0x0000fffff7fa4cd0:	14000002	b	0xfffff7fa4cd8
   0x0000fffff7fa4cd4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa4cd8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa4cdc:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa4ce0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4ce4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4ce8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa4cec:	17ffffde	b	0xfffff7fa4c64
   0x0000fffff7fa4cf0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa4cf4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4cf8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4cfc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4d00:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fa4d04:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4d08:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4d0c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa4d10:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa4d14:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4d18:	d63f0200	blr	x16
   0x0000fffff7fa4d1c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4d20:	54009120	b.eq	0xfffff7fa5f44  // b.none
   0x0000fffff7fa4d24:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa4d28:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa4d2c:	540004a0	b.eq	0xfffff7fa4dc0  // b.none
   0x0000fffff7fa4d30:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa4d34:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa4d38:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa4d3c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa4d40:	54000400	b.eq	0xfffff7fa4dc0  // b.none
   0x0000fffff7fa4d44:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa4d48:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa4d4c:	36d801d1	tbz	w17, #27, 0xfffff7fa4d84
   0x0000fffff7fa4d50:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa4d54:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa4d58:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa4d5c:	54000321	b.ne	0xfffff7fa4dc0  // b.any
   0x0000fffff7fa4d60:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa4d64:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4d68:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa4d6c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa4d70:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa4d74:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa4d78:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa4d7c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa4d80:	54000209	b.ls	0xfffff7fa4dc0  // b.plast
   0x0000fffff7fa4d84:	36d8008d	tbz	w13, #27, 0xfffff7fa4d94
   0x0000fffff7fa4d88:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa4d8c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa4d90:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa4d94:	36d80091	tbz	w17, #27, 0xfffff7fa4da4
   0x0000fffff7fa4d98:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4d9c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa4da0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa4da4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa4da8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa4dac:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa4db0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa4db4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa4db8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa4dbc:	1400000e	b	0xfffff7fa4df4
   0x0000fffff7fa4dc0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa4dc4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4dc8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4dcc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4dd0:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fa4dd4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4dd8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4ddc:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa4de0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa4de4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4de8:	d63f0200	blr	x16
   0x0000fffff7fa4dec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4df0:	54008ae0	b.eq	0xfffff7fa5f4c  // b.none
   0x0000fffff7fa4df4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa4df8:	37d806a9	tbnz	w9, #27, 0xfffff7fa4ecc
   0x0000fffff7fa4dfc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa4e00:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4e04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4e08:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4e0c:	540001c1	b.ne	0xfffff7fa4e44  // b.any
   0x0000fffff7fa4e10:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa4e14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4e18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4e1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4e20:	54000121	b.ne	0xfffff7fa4e44  // b.any
   0x0000fffff7fa4e24:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa4e28:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa4e2c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa4e30:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4e34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4e38:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa4e3c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa4e40:	14000030	b	0xfffff7fa4f00
   0x0000fffff7fa4e44:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa4e48:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4e4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4e50:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4e54:	54000120	b.eq	0xfffff7fa4e78  // b.none
   0x0000fffff7fa4e58:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa4e5c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4e60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4e64:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4e68:	54000321	b.ne	0xfffff7fa4ecc  // b.any
   0x0000fffff7fa4e6c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa4e70:	9e620120	scvtf	d0, x9
   0x0000fffff7fa4e74:	14000002	b	0xfffff7fa4e7c
   0x0000fffff7fa4e78:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa4e7c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa4e80:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4e84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4e88:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4e8c:	54000120	b.eq	0xfffff7fa4eb0  // b.none
   0x0000fffff7fa4e90:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa4e94:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4e98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4e9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4ea0:	54000161	b.ne	0xfffff7fa4ecc  // b.any
   0x0000fffff7fa4ea4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa4ea8:	9e620121	scvtf	d1, x9
   0x0000fffff7fa4eac:	14000002	b	0xfffff7fa4eb4
   0x0000fffff7fa4eb0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa4eb4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa4eb8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa4ebc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4ec0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4ec4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa4ec8:	17ffffde	b	0xfffff7fa4e40
   0x0000fffff7fa4ecc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa4ed0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4ed4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4ed8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4edc:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fa4ee0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4ee4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4ee8:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa4eec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa4ef0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4ef4:	d63f0200	blr	x16
   0x0000fffff7fa4ef8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4efc:	540082c0	b.eq	0xfffff7fa5f54  // b.none
   0x0000fffff7fa4f00:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa4f04:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa4f08:	540004a0	b.eq	0xfffff7fa4f9c  // b.none
   0x0000fffff7fa4f0c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa4f10:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa4f14:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa4f18:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa4f1c:	54000400	b.eq	0xfffff7fa4f9c  // b.none
   0x0000fffff7fa4f20:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa4f24:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa4f28:	36d801d1	tbz	w17, #27, 0xfffff7fa4f60
   0x0000fffff7fa4f2c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa4f30:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa4f34:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa4f38:	54000321	b.ne	0xfffff7fa4f9c  // b.any
   0x0000fffff7fa4f3c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa4f40:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4f44:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa4f48:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa4f4c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa4f50:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa4f54:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa4f58:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa4f5c:	54000209	b.ls	0xfffff7fa4f9c  // b.plast
   0x0000fffff7fa4f60:	36d8008d	tbz	w13, #27, 0xfffff7fa4f70
   0x0000fffff7fa4f64:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa4f68:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa4f6c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa4f70:	36d80091	tbz	w17, #27, 0xfffff7fa4f80
   0x0000fffff7fa4f74:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4f78:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa4f7c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa4f80:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa4f84:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa4f88:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa4f8c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa4f90:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa4f94:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa4f98:	1400000e	b	0xfffff7fa4fd0
   0x0000fffff7fa4f9c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa4fa0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4fa4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4fa8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4fac:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fa4fb0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4fb4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4fb8:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa4fbc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa4fc0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4fc4:	d63f0200	blr	x16
   0x0000fffff7fa4fc8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4fcc:	54007c80	b.eq	0xfffff7fa5f5c  // b.none
   0x0000fffff7fa4fd0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa4fd4:	37d806a9	tbnz	w9, #27, 0xfffff7fa50a8
   0x0000fffff7fa4fd8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa4fdc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4fe0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4fe4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4fe8:	540001c1	b.ne	0xfffff7fa5020  // b.any
   0x0000fffff7fa4fec:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa4ff0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4ff4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4ff8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4ffc:	54000121	b.ne	0xfffff7fa5020  // b.any
   0x0000fffff7fa5000:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa5004:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa5008:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa500c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5010:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5014:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa5018:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa501c:	14000030	b	0xfffff7fa50dc
   0x0000fffff7fa5020:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa5024:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5028:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa502c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5030:	54000120	b.eq	0xfffff7fa5054  // b.none
   0x0000fffff7fa5034:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa5038:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa503c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5040:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5044:	54000321	b.ne	0xfffff7fa50a8  // b.any
   0x0000fffff7fa5048:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa504c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa5050:	14000002	b	0xfffff7fa5058
   0x0000fffff7fa5054:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa5058:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa505c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5060:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5064:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5068:	54000120	b.eq	0xfffff7fa508c  // b.none
   0x0000fffff7fa506c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa5070:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5074:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5078:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa507c:	54000161	b.ne	0xfffff7fa50a8  // b.any
   0x0000fffff7fa5080:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa5084:	9e620121	scvtf	d1, x9
   0x0000fffff7fa5088:	14000002	b	0xfffff7fa5090
   0x0000fffff7fa508c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa5090:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa5094:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa5098:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa509c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa50a0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa50a4:	17ffffde	b	0xfffff7fa501c
   0x0000fffff7fa50a8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa50ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa50b0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa50b4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa50b8:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fa50bc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa50c0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa50c4:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa50c8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa50cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa50d0:	d63f0200	blr	x16
   0x0000fffff7fa50d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa50d8:	54007460	b.eq	0xfffff7fa5f64  // b.none
   0x0000fffff7fa50dc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa50e0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa50e4:	540004a0	b.eq	0xfffff7fa5178  // b.none
   0x0000fffff7fa50e8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa50ec:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa50f0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa50f4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa50f8:	54000400	b.eq	0xfffff7fa5178  // b.none
   0x0000fffff7fa50fc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa5100:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa5104:	36d801d1	tbz	w17, #27, 0xfffff7fa513c
   0x0000fffff7fa5108:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa510c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa5110:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa5114:	54000321	b.ne	0xfffff7fa5178  // b.any
   0x0000fffff7fa5118:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa511c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa5120:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa5124:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa5128:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa512c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa5130:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa5134:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa5138:	54000209	b.ls	0xfffff7fa5178  // b.plast
   0x0000fffff7fa513c:	36d8008d	tbz	w13, #27, 0xfffff7fa514c
   0x0000fffff7fa5140:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa5144:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa5148:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa514c:	36d80091	tbz	w17, #27, 0xfffff7fa515c
   0x0000fffff7fa5150:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa5154:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa5158:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa515c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa5160:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa5164:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa5168:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa516c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa5170:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa5174:	1400000e	b	0xfffff7fa51ac
   0x0000fffff7fa5178:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa517c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5180:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5184:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5188:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fa518c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5190:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5194:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa5198:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa519c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa51a0:	d63f0200	blr	x16
   0x0000fffff7fa51a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa51a8:	54006e20	b.eq	0xfffff7fa5f6c  // b.none
   0x0000fffff7fa51ac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa51b0:	37d806a9	tbnz	w9, #27, 0xfffff7fa5284
   0x0000fffff7fa51b4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa51b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa51bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa51c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa51c4:	540001c1	b.ne	0xfffff7fa51fc  // b.any
   0x0000fffff7fa51c8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa51cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa51d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa51d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa51d8:	54000121	b.ne	0xfffff7fa51fc  // b.any
   0x0000fffff7fa51dc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa51e0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa51e4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa51e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa51ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa51f0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa51f4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa51f8:	14000030	b	0xfffff7fa52b8
   0x0000fffff7fa51fc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa5200:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5204:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5208:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa520c:	54000120	b.eq	0xfffff7fa5230  // b.none
   0x0000fffff7fa5210:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa5214:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5218:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa521c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5220:	54000321	b.ne	0xfffff7fa5284  // b.any
   0x0000fffff7fa5224:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa5228:	9e620120	scvtf	d0, x9
   0x0000fffff7fa522c:	14000002	b	0xfffff7fa5234
   0x0000fffff7fa5230:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa5234:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa5238:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa523c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5240:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5244:	54000120	b.eq	0xfffff7fa5268  // b.none
   0x0000fffff7fa5248:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa524c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5250:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5254:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5258:	54000161	b.ne	0xfffff7fa5284  // b.any
   0x0000fffff7fa525c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa5260:	9e620121	scvtf	d1, x9
   0x0000fffff7fa5264:	14000002	b	0xfffff7fa526c
   0x0000fffff7fa5268:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa526c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa5270:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa5274:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5278:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa527c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa5280:	17ffffde	b	0xfffff7fa51f8
   0x0000fffff7fa5284:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa5288:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa528c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5290:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5294:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fa5298:	aa1403e4	mov	x4, x20
   0x0000fffff7fa529c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa52a0:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa52a4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa52a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa52ac:	d63f0200	blr	x16
   0x0000fffff7fa52b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa52b4:	54006600	b.eq	0xfffff7fa5f74  // b.none
   0x0000fffff7fa52b8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa52bc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa52c0:	540004a0	b.eq	0xfffff7fa5354  // b.none
   0x0000fffff7fa52c4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa52c8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa52cc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa52d0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa52d4:	54000400	b.eq	0xfffff7fa5354  // b.none
   0x0000fffff7fa52d8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa52dc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa52e0:	36d801d1	tbz	w17, #27, 0xfffff7fa5318
   0x0000fffff7fa52e4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa52e8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa52ec:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa52f0:	54000321	b.ne	0xfffff7fa5354  // b.any
   0x0000fffff7fa52f4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa52f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa52fc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa5300:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa5304:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa5308:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa530c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa5310:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa5314:	54000209	b.ls	0xfffff7fa5354  // b.plast
   0x0000fffff7fa5318:	36d8008d	tbz	w13, #27, 0xfffff7fa5328
   0x0000fffff7fa531c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa5320:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa5324:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa5328:	36d80091	tbz	w17, #27, 0xfffff7fa5338
   0x0000fffff7fa532c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa5330:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa5334:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa5338:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa533c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa5340:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa5344:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa5348:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa534c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa5350:	1400000e	b	0xfffff7fa5388
   0x0000fffff7fa5354:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa5358:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa535c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5360:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5364:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fa5368:	aa1403e4	mov	x4, x20
   0x0000fffff7fa536c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5370:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa5374:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa5378:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa537c:	d63f0200	blr	x16
   0x0000fffff7fa5380:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5384:	54005fc0	b.eq	0xfffff7fa5f7c  // b.none
   0x0000fffff7fa5388:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa538c:	37d806a9	tbnz	w9, #27, 0xfffff7fa5460
   0x0000fffff7fa5390:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa5394:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5398:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa539c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa53a0:	540001c1	b.ne	0xfffff7fa53d8  // b.any
   0x0000fffff7fa53a4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa53a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa53ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa53b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa53b4:	54000121	b.ne	0xfffff7fa53d8  // b.any
   0x0000fffff7fa53b8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa53bc:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa53c0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa53c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa53c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa53cc:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa53d0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa53d4:	14000030	b	0xfffff7fa5494
   0x0000fffff7fa53d8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa53dc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa53e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa53e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa53e8:	54000120	b.eq	0xfffff7fa540c  // b.none
   0x0000fffff7fa53ec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa53f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa53f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa53f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa53fc:	54000321	b.ne	0xfffff7fa5460  // b.any
   0x0000fffff7fa5400:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa5404:	9e620120	scvtf	d0, x9
   0x0000fffff7fa5408:	14000002	b	0xfffff7fa5410
   0x0000fffff7fa540c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa5410:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa5414:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5418:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa541c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5420:	54000120	b.eq	0xfffff7fa5444  // b.none
   0x0000fffff7fa5424:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa5428:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa542c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5430:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5434:	54000161	b.ne	0xfffff7fa5460  // b.any
   0x0000fffff7fa5438:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa543c:	9e620121	scvtf	d1, x9
   0x0000fffff7fa5440:	14000002	b	0xfffff7fa5448
   0x0000fffff7fa5444:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa5448:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa544c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa5450:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5454:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5458:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa545c:	17ffffde	b	0xfffff7fa53d4
   0x0000fffff7fa5460:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa5464:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5468:	aa1303e1	mov	x1, x19
   0x0000fffff7fa546c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5470:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fa5474:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5478:	aa1603e5	mov	x5, x22
   0x0000fffff7fa547c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa5480:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa5484:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5488:	d63f0200	blr	x16
   0x0000fffff7fa548c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5490:	540057a0	b.eq	0xfffff7fa5f84  // b.none
   0x0000fffff7fa5494:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa5498:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa549c:	540004a0	b.eq	0xfffff7fa5530  // b.none
   0x0000fffff7fa54a0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa54a4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa54a8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa54ac:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa54b0:	54000400	b.eq	0xfffff7fa5530  // b.none
   0x0000fffff7fa54b4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa54b8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa54bc:	36d801d1	tbz	w17, #27, 0xfffff7fa54f4
   0x0000fffff7fa54c0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa54c4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa54c8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa54cc:	54000321	b.ne	0xfffff7fa5530  // b.any
   0x0000fffff7fa54d0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa54d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa54d8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa54dc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa54e0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa54e4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa54e8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa54ec:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa54f0:	54000209	b.ls	0xfffff7fa5530  // b.plast
   0x0000fffff7fa54f4:	36d8008d	tbz	w13, #27, 0xfffff7fa5504
   0x0000fffff7fa54f8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa54fc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa5500:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa5504:	36d80091	tbz	w17, #27, 0xfffff7fa5514
   0x0000fffff7fa5508:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa550c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa5510:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa5514:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa5518:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa551c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa5520:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa5524:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa5528:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa552c:	1400000e	b	0xfffff7fa5564
   0x0000fffff7fa5530:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa5534:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5538:	aa1303e1	mov	x1, x19
   0x0000fffff7fa553c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5540:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fa5544:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5548:	aa1603e5	mov	x5, x22
   0x0000fffff7fa554c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa5550:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa5554:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5558:	d63f0200	blr	x16
   0x0000fffff7fa555c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5560:	54005160	b.eq	0xfffff7fa5f8c  // b.none
   0x0000fffff7fa5564:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa5568:	37d806a9	tbnz	w9, #27, 0xfffff7fa563c
   0x0000fffff7fa556c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa5570:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5574:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5578:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa557c:	540001c1	b.ne	0xfffff7fa55b4  // b.any
   0x0000fffff7fa5580:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa5584:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5588:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa558c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5590:	54000121	b.ne	0xfffff7fa55b4  // b.any
   0x0000fffff7fa5594:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa5598:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa559c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa55a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa55a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa55a8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa55ac:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa55b0:	14000030	b	0xfffff7fa5670
   0x0000fffff7fa55b4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa55b8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa55bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa55c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa55c4:	54000120	b.eq	0xfffff7fa55e8  // b.none
   0x0000fffff7fa55c8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa55cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa55d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa55d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa55d8:	54000321	b.ne	0xfffff7fa563c  // b.any
   0x0000fffff7fa55dc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa55e0:	9e620120	scvtf	d0, x9
   0x0000fffff7fa55e4:	14000002	b	0xfffff7fa55ec
   0x0000fffff7fa55e8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa55ec:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa55f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa55f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa55f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa55fc:	54000120	b.eq	0xfffff7fa5620  // b.none
   0x0000fffff7fa5600:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa5604:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5608:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa560c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5610:	54000161	b.ne	0xfffff7fa563c  // b.any
   0x0000fffff7fa5614:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa5618:	9e620121	scvtf	d1, x9
   0x0000fffff7fa561c:	14000002	b	0xfffff7fa5624
   0x0000fffff7fa5620:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa5624:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa5628:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa562c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5630:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5634:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa5638:	17ffffde	b	0xfffff7fa55b0
   0x0000fffff7fa563c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa5640:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5644:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5648:	aa1503e2	mov	x2, x21
   0x0000fffff7fa564c:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fa5650:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5654:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5658:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa565c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa5660:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5664:	d63f0200	blr	x16
   0x0000fffff7fa5668:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa566c:	54004940	b.eq	0xfffff7fa5f94  // b.none
   0x0000fffff7fa5670:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa5674:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa5678:	540004a0	b.eq	0xfffff7fa570c  // b.none
   0x0000fffff7fa567c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa5680:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa5684:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa5688:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa568c:	54000400	b.eq	0xfffff7fa570c  // b.none
   0x0000fffff7fa5690:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa5694:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa5698:	36d801d1	tbz	w17, #27, 0xfffff7fa56d0
   0x0000fffff7fa569c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa56a0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa56a4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa56a8:	54000321	b.ne	0xfffff7fa570c  // b.any
   0x0000fffff7fa56ac:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa56b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa56b4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa56b8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa56bc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa56c0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa56c4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa56c8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa56cc:	54000209	b.ls	0xfffff7fa570c  // b.plast
   0x0000fffff7fa56d0:	36d8008d	tbz	w13, #27, 0xfffff7fa56e0
   0x0000fffff7fa56d4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa56d8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa56dc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa56e0:	36d80091	tbz	w17, #27, 0xfffff7fa56f0
   0x0000fffff7fa56e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa56e8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa56ec:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa56f0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa56f4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa56f8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa56fc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa5700:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa5704:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa5708:	1400000e	b	0xfffff7fa5740
   0x0000fffff7fa570c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa5710:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5714:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5718:	aa1503e2	mov	x2, x21
   0x0000fffff7fa571c:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fa5720:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5724:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5728:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa572c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa5730:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5734:	d63f0200	blr	x16
   0x0000fffff7fa5738:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa573c:	54004300	b.eq	0xfffff7fa5f9c  // b.none
   0x0000fffff7fa5740:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa5744:	37d806a9	tbnz	w9, #27, 0xfffff7fa5818
   0x0000fffff7fa5748:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa574c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5750:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5754:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5758:	540001c1	b.ne	0xfffff7fa5790  // b.any
   0x0000fffff7fa575c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa5760:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5764:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5768:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa576c:	54000121	b.ne	0xfffff7fa5790  // b.any
   0x0000fffff7fa5770:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa5774:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa5778:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa577c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5780:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5784:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa5788:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa578c:	14000030	b	0xfffff7fa584c
   0x0000fffff7fa5790:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa5794:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5798:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa579c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa57a0:	54000120	b.eq	0xfffff7fa57c4  // b.none
   0x0000fffff7fa57a4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa57a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa57ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa57b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa57b4:	54000321	b.ne	0xfffff7fa5818  // b.any
   0x0000fffff7fa57b8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa57bc:	9e620120	scvtf	d0, x9
   0x0000fffff7fa57c0:	14000002	b	0xfffff7fa57c8
   0x0000fffff7fa57c4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa57c8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa57cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa57d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa57d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa57d8:	54000120	b.eq	0xfffff7fa57fc  // b.none
   0x0000fffff7fa57dc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa57e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa57e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa57e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa57ec:	54000161	b.ne	0xfffff7fa5818  // b.any
   0x0000fffff7fa57f0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa57f4:	9e620121	scvtf	d1, x9
   0x0000fffff7fa57f8:	14000002	b	0xfffff7fa5800
   0x0000fffff7fa57fc:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa5800:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa5804:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa5808:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa580c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5810:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa5814:	17ffffde	b	0xfffff7fa578c
   0x0000fffff7fa5818:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa581c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5820:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5824:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5828:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fa582c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5830:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5834:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa5838:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa583c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5840:	d63f0200	blr	x16
   0x0000fffff7fa5844:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5848:	54003ae0	b.eq	0xfffff7fa5fa4  // b.none
   0x0000fffff7fa584c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa5850:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa5854:	540004a0	b.eq	0xfffff7fa58e8  // b.none
   0x0000fffff7fa5858:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa585c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa5860:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa5864:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa5868:	54000400	b.eq	0xfffff7fa58e8  // b.none
   0x0000fffff7fa586c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa5870:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa5874:	36d801d1	tbz	w17, #27, 0xfffff7fa58ac
   0x0000fffff7fa5878:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa587c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa5880:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa5884:	54000321	b.ne	0xfffff7fa58e8  // b.any
   0x0000fffff7fa5888:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa588c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa5890:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa5894:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa5898:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa589c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa58a0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa58a4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa58a8:	54000209	b.ls	0xfffff7fa58e8  // b.plast
   0x0000fffff7fa58ac:	36d8008d	tbz	w13, #27, 0xfffff7fa58bc
   0x0000fffff7fa58b0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa58b4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa58b8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa58bc:	36d80091	tbz	w17, #27, 0xfffff7fa58cc
   0x0000fffff7fa58c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa58c4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa58c8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa58cc:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa58d0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa58d4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa58d8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa58dc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa58e0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa58e4:	1400000e	b	0xfffff7fa591c
   0x0000fffff7fa58e8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa58ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa58f0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa58f4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa58f8:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fa58fc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5900:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5904:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa5908:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa590c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5910:	d63f0200	blr	x16
   0x0000fffff7fa5914:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5918:	540034a0	b.eq	0xfffff7fa5fac  // b.none
   0x0000fffff7fa591c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa5920:	37d806a9	tbnz	w9, #27, 0xfffff7fa59f4
   0x0000fffff7fa5924:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa5928:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa592c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5930:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5934:	540001c1	b.ne	0xfffff7fa596c  // b.any
   0x0000fffff7fa5938:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa593c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5940:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5944:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5948:	54000121	b.ne	0xfffff7fa596c  // b.any
   0x0000fffff7fa594c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa5950:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa5954:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa5958:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa595c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5960:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa5964:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa5968:	14000030	b	0xfffff7fa5a28
   0x0000fffff7fa596c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa5970:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5974:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5978:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa597c:	54000120	b.eq	0xfffff7fa59a0  // b.none
   0x0000fffff7fa5980:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa5984:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5988:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa598c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5990:	54000321	b.ne	0xfffff7fa59f4  // b.any
   0x0000fffff7fa5994:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa5998:	9e620120	scvtf	d0, x9
   0x0000fffff7fa599c:	14000002	b	0xfffff7fa59a4
   0x0000fffff7fa59a0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa59a4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa59a8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa59ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa59b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa59b4:	54000120	b.eq	0xfffff7fa59d8  // b.none
   0x0000fffff7fa59b8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa59bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa59c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa59c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa59c8:	54000161	b.ne	0xfffff7fa59f4  // b.any
   0x0000fffff7fa59cc:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa59d0:	9e620121	scvtf	d1, x9
   0x0000fffff7fa59d4:	14000002	b	0xfffff7fa59dc
   0x0000fffff7fa59d8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa59dc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa59e0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa59e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa59e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa59ec:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa59f0:	17ffffde	b	0xfffff7fa5968
   0x0000fffff7fa59f4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa59f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa59fc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5a00:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5a04:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7fa5a08:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5a0c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5a10:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa5a14:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa5a18:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5a1c:	d63f0200	blr	x16
   0x0000fffff7fa5a20:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5a24:	54002c80	b.eq	0xfffff7fa5fb4  // b.none
   0x0000fffff7fa5a28:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa5a2c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa5a30:	540004a0	b.eq	0xfffff7fa5ac4  // b.none
   0x0000fffff7fa5a34:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa5a38:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa5a3c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa5a40:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa5a44:	54000400	b.eq	0xfffff7fa5ac4  // b.none
   0x0000fffff7fa5a48:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa5a4c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa5a50:	36d801d1	tbz	w17, #27, 0xfffff7fa5a88
   0x0000fffff7fa5a54:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa5a58:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa5a5c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa5a60:	54000321	b.ne	0xfffff7fa5ac4  // b.any
   0x0000fffff7fa5a64:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa5a68:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa5a6c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa5a70:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa5a74:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa5a78:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa5a7c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa5a80:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa5a84:	54000209	b.ls	0xfffff7fa5ac4  // b.plast
   0x0000fffff7fa5a88:	36d8008d	tbz	w13, #27, 0xfffff7fa5a98
   0x0000fffff7fa5a8c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa5a90:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa5a94:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa5a98:	36d80091	tbz	w17, #27, 0xfffff7fa5aa8
   0x0000fffff7fa5a9c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa5aa0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa5aa4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa5aa8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa5aac:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa5ab0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa5ab4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa5ab8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa5abc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa5ac0:	1400000e	b	0xfffff7fa5af8
   0x0000fffff7fa5ac4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa5ac8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5acc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5ad0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5ad4:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7fa5ad8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5adc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5ae0:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa5ae4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa5ae8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5aec:	d63f0200	blr	x16
   0x0000fffff7fa5af0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5af4:	54002640	b.eq	0xfffff7fa5fbc  // b.none
   0x0000fffff7fa5af8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa5afc:	37d806a9	tbnz	w9, #27, 0xfffff7fa5bd0
   0x0000fffff7fa5b00:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa5b04:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5b08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5b0c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5b10:	540001c1	b.ne	0xfffff7fa5b48  // b.any
   0x0000fffff7fa5b14:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa5b18:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5b1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5b20:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5b24:	54000121	b.ne	0xfffff7fa5b48  // b.any
   0x0000fffff7fa5b28:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa5b2c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa5b30:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa5b34:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5b38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5b3c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa5b40:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa5b44:	14000030	b	0xfffff7fa5c04
   0x0000fffff7fa5b48:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa5b4c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5b50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5b54:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5b58:	54000120	b.eq	0xfffff7fa5b7c  // b.none
   0x0000fffff7fa5b5c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa5b60:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5b64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5b68:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5b6c:	54000321	b.ne	0xfffff7fa5bd0  // b.any
   0x0000fffff7fa5b70:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa5b74:	9e620120	scvtf	d0, x9
   0x0000fffff7fa5b78:	14000002	b	0xfffff7fa5b80
   0x0000fffff7fa5b7c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa5b80:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa5b84:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5b88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5b8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5b90:	54000120	b.eq	0xfffff7fa5bb4  // b.none
   0x0000fffff7fa5b94:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa5b98:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5b9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5ba0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5ba4:	54000161	b.ne	0xfffff7fa5bd0  // b.any
   0x0000fffff7fa5ba8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa5bac:	9e620121	scvtf	d1, x9
   0x0000fffff7fa5bb0:	14000002	b	0xfffff7fa5bb8
   0x0000fffff7fa5bb4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa5bb8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa5bbc:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa5bc0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5bc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5bc8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa5bcc:	17ffffde	b	0xfffff7fa5b44
   0x0000fffff7fa5bd0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa5bd4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5bd8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5bdc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5be0:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7fa5be4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5be8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5bec:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa5bf0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa5bf4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5bf8:	d63f0200	blr	x16
   0x0000fffff7fa5bfc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5c00:	54001e20	b.eq	0xfffff7fa5fc4  // b.none
   0x0000fffff7fa5c04:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa5c08:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa5c0c:	540004a0	b.eq	0xfffff7fa5ca0  // b.none
   0x0000fffff7fa5c10:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa5c14:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa5c18:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa5c1c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa5c20:	54000400	b.eq	0xfffff7fa5ca0  // b.none
   0x0000fffff7fa5c24:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa5c28:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa5c2c:	36d801d1	tbz	w17, #27, 0xfffff7fa5c64
   0x0000fffff7fa5c30:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa5c34:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa5c38:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa5c3c:	54000321	b.ne	0xfffff7fa5ca0  // b.any
   0x0000fffff7fa5c40:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa5c44:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa5c48:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa5c4c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa5c50:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa5c54:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa5c58:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa5c5c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa5c60:	54000209	b.ls	0xfffff7fa5ca0  // b.plast
   0x0000fffff7fa5c64:	36d8008d	tbz	w13, #27, 0xfffff7fa5c74
   0x0000fffff7fa5c68:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa5c6c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa5c70:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa5c74:	36d80091	tbz	w17, #27, 0xfffff7fa5c84
   0x0000fffff7fa5c78:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa5c7c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa5c80:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa5c84:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa5c88:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa5c8c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa5c90:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa5c94:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa5c98:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa5c9c:	1400000e	b	0xfffff7fa5cd4
   0x0000fffff7fa5ca0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa5ca4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5ca8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5cac:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5cb0:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7fa5cb4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5cb8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5cbc:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa5cc0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa5cc4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5cc8:	d63f0200	blr	x16
   0x0000fffff7fa5ccc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5cd0:	540017e0	b.eq	0xfffff7fa5fcc  // b.none
   0x0000fffff7fa5cd4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa5cd8:	37d806a9	tbnz	w9, #27, 0xfffff7fa5dac
   0x0000fffff7fa5cdc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa5ce0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5ce4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5ce8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5cec:	540001c1	b.ne	0xfffff7fa5d24  // b.any
   0x0000fffff7fa5cf0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa5cf4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5cf8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5cfc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5d00:	54000121	b.ne	0xfffff7fa5d24  // b.any
   0x0000fffff7fa5d04:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa5d08:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa5d0c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa5d10:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5d14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5d18:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa5d1c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa5d20:	14000030	b	0xfffff7fa5de0
   0x0000fffff7fa5d24:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa5d28:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5d2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5d30:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5d34:	54000120	b.eq	0xfffff7fa5d58  // b.none
   0x0000fffff7fa5d38:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa5d3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5d40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5d44:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5d48:	54000321	b.ne	0xfffff7fa5dac  // b.any
   0x0000fffff7fa5d4c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa5d50:	9e620120	scvtf	d0, x9
   0x0000fffff7fa5d54:	14000002	b	0xfffff7fa5d5c
   0x0000fffff7fa5d58:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa5d5c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa5d60:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5d64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5d68:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5d6c:	54000120	b.eq	0xfffff7fa5d90  // b.none
   0x0000fffff7fa5d70:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa5d74:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5d78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5d7c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5d80:	54000161	b.ne	0xfffff7fa5dac  // b.any
   0x0000fffff7fa5d84:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa5d88:	9e620121	scvtf	d1, x9
   0x0000fffff7fa5d8c:	14000002	b	0xfffff7fa5d94
   0x0000fffff7fa5d90:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa5d94:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa5d98:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa5d9c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5da0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5da4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa5da8:	17ffffde	b	0xfffff7fa5d20
   0x0000fffff7fa5dac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa5db0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5db4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5db8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5dbc:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7fa5dc0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5dc4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5dc8:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa5dcc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa5dd0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5dd4:	d63f0200	blr	x16
   0x0000fffff7fa5dd8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5ddc:	54000fc0	b.eq	0xfffff7fa5fd4  // b.none
   0x0000fffff7fa5de0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa5de4:	37d80269	tbnz	w9, #27, 0xfffff7fa5e30
   0x0000fffff7fa5de8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa5dec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5df0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5df4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5df8:	540001c1	b.ne	0xfffff7fa5e30  // b.any
   0x0000fffff7fa5dfc:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa5e00:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7fa5e04:	8b0a012b	add	x11, x9, x10
   0x0000fffff7fa5e08:	f9003669	str	x9, [x19, #104]
   0x0000fffff7fa5e0c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5e10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5e14:	b900626a	str	w10, [x19, #96]
   0x0000fffff7fa5e18:	aa0b03e9	mov	x9, x11
   0x0000fffff7fa5e1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5e20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5e24:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7fa5e28:	b900526a	str	w10, [x19, #80]
   0x0000fffff7fa5e2c:	1400000e	b	0xfffff7fa5e64
   0x0000fffff7fa5e30:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa5e34:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5e38:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5e3c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5e40:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7fa5e44:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5e48:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5e4c:	d290bc10	mov	x16, #0x85e0                	// #34272
   0x0000fffff7fa5e50:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa5e54:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5e58:	d63f0200	blr	x16
   0x0000fffff7fa5e5c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5e60:	54000be0	b.eq	0xfffff7fa5fdc  // b.none
   0x0000fffff7fa5e64:	17fff8d2	b	0xfffff7fa41ac
   0x0000fffff7fa5e68:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa5e6c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5e70:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5e74:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5e78:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7fa5e7c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5e80:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5e84:	d286be90	mov	x16, #0x35f4                	// #13812
   0x0000fffff7fa5e88:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa5e8c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5e90:	d63f0200	blr	x16
   0x0000fffff7fa5e94:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa5e98:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa5e9c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa5ea0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa5ea4:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fa5ea8:	d65f03c0	ret
   0x0000fffff7fa5eac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5eb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5eb4:	b900028a	str	w10, [x20]
   0x0000fffff7fa5eb8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fa5ebc:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa5ec0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa5ec4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa5ec8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa5ecc:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fa5ed0:	d65f03c0	ret
   0x0000fffff7fa5ed4:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fa5ed8:	17fffff5	b	0xfffff7fa5eac
   0x0000fffff7fa5edc:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fa5ee0:	17fffff3	b	0xfffff7fa5eac
   0x0000fffff7fa5ee4:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fa5ee8:	17fffff1	b	0xfffff7fa5eac
   0x0000fffff7fa5eec:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fa5ef0:	17ffffef	b	0xfffff7fa5eac
   0x0000fffff7fa5ef4:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fa5ef8:	17ffffed	b	0xfffff7fa5eac
   0x0000fffff7fa5efc:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fa5f00:	17ffffeb	b	0xfffff7fa5eac
   0x0000fffff7fa5f04:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fa5f08:	17ffffe9	b	0xfffff7fa5eac
   0x0000fffff7fa5f0c:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fa5f10:	17ffffe7	b	0xfffff7fa5eac
   0x0000fffff7fa5f14:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fa5f18:	17ffffe5	b	0xfffff7fa5eac
   0x0000fffff7fa5f1c:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fa5f20:	17ffffe3	b	0xfffff7fa5eac
   0x0000fffff7fa5f24:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fa5f28:	17ffffe1	b	0xfffff7fa5eac
   0x0000fffff7fa5f2c:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fa5f30:	17ffffdf	b	0xfffff7fa5eac
   0x0000fffff7fa5f34:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fa5f38:	17ffffdd	b	0xfffff7fa5eac
   0x0000fffff7fa5f3c:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fa5f40:	17ffffdb	b	0xfffff7fa5eac
   0x0000fffff7fa5f44:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fa5f48:	17ffffd9	b	0xfffff7fa5eac
   0x0000fffff7fa5f4c:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fa5f50:	17ffffd7	b	0xfffff7fa5eac
   0x0000fffff7fa5f54:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fa5f58:	17ffffd5	b	0xfffff7fa5eac
   0x0000fffff7fa5f5c:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fa5f60:	17ffffd3	b	0xfffff7fa5eac
   0x0000fffff7fa5f64:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fa5f68:	17ffffd1	b	0xfffff7fa5eac
   0x0000fffff7fa5f6c:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fa5f70:	17ffffcf	b	0xfffff7fa5eac
   0x0000fffff7fa5f74:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fa5f78:	17ffffcd	b	0xfffff7fa5eac
   0x0000fffff7fa5f7c:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fa5f80:	17ffffcb	b	0xfffff7fa5eac
   0x0000fffff7fa5f84:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fa5f88:	17ffffc9	b	0xfffff7fa5eac
   0x0000fffff7fa5f8c:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fa5f90:	17ffffc7	b	0xfffff7fa5eac
   0x0000fffff7fa5f94:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fa5f98:	17ffffc5	b	0xfffff7fa5eac
   0x0000fffff7fa5f9c:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fa5fa0:	17ffffc3	b	0xfffff7fa5eac
   0x0000fffff7fa5fa4:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7fa5fa8:	17ffffc1	b	0xfffff7fa5eac
   0x0000fffff7fa5fac:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fa5fb0:	17ffffbf	b	0xfffff7fa5eac
   0x0000fffff7fa5fb4:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7fa5fb8:	17ffffbd	b	0xfffff7fa5eac
   0x0000fffff7fa5fbc:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7fa5fc0:	17ffffbb	b	0xfffff7fa5eac
   0x0000fffff7fa5fc4:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7fa5fc8:	17ffffb9	b	0xfffff7fa5eac
   0x0000fffff7fa5fcc:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7fa5fd0:	17ffffb7	b	0xfffff7fa5eac
   0x0000fffff7fa5fd4:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7fa5fd8:	17ffffb5	b	0xfffff7fa5eac
   0x0000fffff7fa5fdc:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7fa5fe0:	17ffffb3	b	0xfffff7fa5eac
   0x0000fffff7fa5fe4:	00000000	udf	#0
   0x0000fffff7fa5fe8:	00000000	udf	#0
   0x0000fffff7fa5fec:	00000000	udf	#0
   0x0000fffff7fa5ff0:	00000000	udf	#0
   0x0000fffff7fa5ff4:	00000000	udf	#0
   0x0000fffff7fa5ff8:	00000000	udf	#0
   0x0000fffff7fa5ffc:	00000000	udf	#0
End of assembler dump.
