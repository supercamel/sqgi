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
   0x0000fffff7fb4058:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb405c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb4060:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb4064:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb4068:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb406c:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7fb4070:	36d801d1	tbz	w17, #27, 0xfffff7fb40a8
   0x0000fffff7fb4074:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb4078:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb407c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4080:	54000281	b.ne	0xfffff7fb40d0  // b.any
   0x0000fffff7fb4084:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7fb4088:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb408c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4090:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4094:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4098:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb409c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb40a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb40a4:	54000169	b.ls	0xfffff7fb40d0  // b.plast
   0x0000fffff7fb40a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb40ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb40b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb40b4:	36d80091	tbz	w17, #27, 0xfffff7fb40c4
   0x0000fffff7fb40b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb40bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb40c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb40c4:	f900166c	str	x12, [x19, #40]
   0x0000fffff7fb40c8:	b900226d	str	w13, [x19, #32]
   0x0000fffff7fb40cc:	1400000e	b	0xfffff7fb4104
   0x0000fffff7fb40d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb40d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb40d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb40dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb40e0:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fb40e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb40e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb40ec:	d2956a10	mov	x16, #0xab50                	// #43856
   0x0000fffff7fb40f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb40f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb40f8:	d63f0200	blr	x16
   0x0000fffff7fb40fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4100:	5400d7e0	b.eq	0xfffff7fb5bfc  // b.none
   0x0000fffff7fb4104:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb4108:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb410c:	d280002c	mov	x12, #0x1                   	// #1
   0x0000fffff7fb4110:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb4114:	36d80211	tbz	w17, #27, 0xfffff7fb4154
   0x0000fffff7fb4118:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb411c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4120:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4124:	540001e1	b.ne	0xfffff7fb4160  // b.any
   0x0000fffff7fb4128:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb412c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4130:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4134:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4138:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb413c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4140:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4144:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4148:	540000c9	b.ls	0xfffff7fb4160  // b.plast
   0x0000fffff7fb414c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4150:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4154:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb4158:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb415c:	1400000e	b	0xfffff7fb4194
   0x0000fffff7fb4160:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb4164:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4168:	aa1303e1	mov	x1, x19
   0x0000fffff7fb416c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4170:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fb4174:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4178:	aa1603e5	mov	x5, x22
   0x0000fffff7fb417c:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7fb4180:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb4184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4188:	d63f0200	blr	x16
   0x0000fffff7fb418c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4190:	5400d3a0	b.eq	0xfffff7fb5c04  // b.none
   0x0000fffff7fb4194:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb4198:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb419c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb41a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb41a4:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fb41a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb41ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fb41b0:	d282a010	mov	x16, #0x1500                	// #5376
   0x0000fffff7fb41b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb41b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb41bc:	d63f0200	blr	x16
   0x0000fffff7fb41c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb41c4:	5400d240	b.eq	0xfffff7fb5c0c  // b.none
   0x0000fffff7fb41c8:	14000001	b	0xfffff7fb41cc
   0x0000fffff7fb41cc:	14000001	b	0xfffff7fb41d0
   0x0000fffff7fb41d0:	14000001	b	0xfffff7fb41d4
   0x0000fffff7fb41d4:	14000001	b	0xfffff7fb41d8
   0x0000fffff7fb41d8:	14000001	b	0xfffff7fb41dc
   0x0000fffff7fb41dc:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb41e0:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb41e4:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fb41e8:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb41ec:	36d80211	tbz	w17, #27, 0xfffff7fb422c
   0x0000fffff7fb41f0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb41f4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb41f8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb41fc:	540001e1	b.ne	0xfffff7fb4238  // b.any
   0x0000fffff7fb4200:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb4204:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4208:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb420c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4210:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4214:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4218:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb421c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4220:	540000c9	b.ls	0xfffff7fb4238  // b.plast
   0x0000fffff7fb4224:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4228:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb422c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb4230:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb4234:	1400000e	b	0xfffff7fb426c
   0x0000fffff7fb4238:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb423c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4240:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4244:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4248:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fb424c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4250:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4254:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7fb4258:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb425c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4260:	d63f0200	blr	x16
   0x0000fffff7fb4264:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4268:	5400cd60	b.eq	0xfffff7fb5c14  // b.none
   0x0000fffff7fb426c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb4270:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4274:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4278:	aa1503e2	mov	x2, x21
   0x0000fffff7fb427c:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fb4280:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4284:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4288:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb428c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb4290:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4294:	d63f0200	blr	x16
   0x0000fffff7fb4298:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb429c:	5400cc00	b.eq	0xfffff7fb5c1c  // b.none
   0x0000fffff7fb42a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb42a4:	37d806a9	tbnz	w9, #27, 0xfffff7fb4378
   0x0000fffff7fb42a8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb42ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb42b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb42b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb42b8:	540001c1	b.ne	0xfffff7fb42f0  // b.any
   0x0000fffff7fb42bc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb42c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb42c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb42c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb42cc:	54000121	b.ne	0xfffff7fb42f0  // b.any
   0x0000fffff7fb42d0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb42d4:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb42d8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb42dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb42e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb42e4:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb42e8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb42ec:	14000030	b	0xfffff7fb43ac
   0x0000fffff7fb42f0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb42f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb42f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb42fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4300:	54000120	b.eq	0xfffff7fb4324  // b.none
   0x0000fffff7fb4304:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb4308:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb430c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4310:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4314:	54000321	b.ne	0xfffff7fb4378  // b.any
   0x0000fffff7fb4318:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb431c:	9e620120	scvtf	d0, x9
   0x0000fffff7fb4320:	14000002	b	0xfffff7fb4328
   0x0000fffff7fb4324:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb4328:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb432c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4330:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4334:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4338:	54000120	b.eq	0xfffff7fb435c  // b.none
   0x0000fffff7fb433c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb4340:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4344:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4348:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb434c:	54000161	b.ne	0xfffff7fb4378  // b.any
   0x0000fffff7fb4350:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb4354:	9e620121	scvtf	d1, x9
   0x0000fffff7fb4358:	14000002	b	0xfffff7fb4360
   0x0000fffff7fb435c:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb4360:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb4364:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb4368:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb436c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4370:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb4374:	17ffffde	b	0xfffff7fb42ec
   0x0000fffff7fb4378:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb437c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4380:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4384:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4388:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fb438c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4390:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4394:	d294c490	mov	x16, #0xa624                	// #42532
   0x0000fffff7fb4398:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb439c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb43a0:	d63f0200	blr	x16
   0x0000fffff7fb43a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb43a8:	5400c3e0	b.eq	0xfffff7fb5c24  // b.none
   0x0000fffff7fb43ac:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb43b0:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb43b4:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb43b8:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb43bc:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb43c0:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb43c4:	36d801d1	tbz	w17, #27, 0xfffff7fb43fc
   0x0000fffff7fb43c8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb43cc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb43d0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb43d4:	54000281	b.ne	0xfffff7fb4424  // b.any
   0x0000fffff7fb43d8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb43dc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb43e0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb43e4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb43e8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb43ec:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb43f0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb43f4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb43f8:	54000169	b.ls	0xfffff7fb4424  // b.plast
   0x0000fffff7fb43fc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb4400:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4404:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb4408:	36d80091	tbz	w17, #27, 0xfffff7fb4418
   0x0000fffff7fb440c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4410:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4414:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4418:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb441c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb4420:	1400000e	b	0xfffff7fb4458
   0x0000fffff7fb4424:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb4428:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb442c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4430:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4434:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fb4438:	aa1403e4	mov	x4, x20
   0x0000fffff7fb443c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4440:	d2956a10	mov	x16, #0xab50                	// #43856
   0x0000fffff7fb4444:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb4448:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb444c:	d63f0200	blr	x16
   0x0000fffff7fb4450:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4454:	5400bec0	b.eq	0xfffff7fb5c2c  // b.none
   0x0000fffff7fb4458:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb445c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb4460:	540003a0	b.eq	0xfffff7fb44d4  // b.none
   0x0000fffff7fb4464:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb4468:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb446c:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb4470:	36d801d1	tbz	w17, #27, 0xfffff7fb44a8
   0x0000fffff7fb4474:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb4478:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb447c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4480:	540002a1	b.ne	0xfffff7fb44d4  // b.any
   0x0000fffff7fb4484:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb4488:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb448c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4490:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4494:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4498:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb449c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb44a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb44a4:	54000189	b.ls	0xfffff7fb44d4  // b.plast
   0x0000fffff7fb44a8:	36d8008d	tbz	w13, #27, 0xfffff7fb44b8
   0x0000fffff7fb44ac:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb44b0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb44b4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb44b8:	36d80091	tbz	w17, #27, 0xfffff7fb44c8
   0x0000fffff7fb44bc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb44c0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb44c4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb44c8:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb44cc:	b900016d	str	w13, [x11]
   0x0000fffff7fb44d0:	1400000e	b	0xfffff7fb4508
   0x0000fffff7fb44d4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb44d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb44dc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb44e0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb44e4:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fb44e8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb44ec:	aa1603e5	mov	x5, x22
   0x0000fffff7fb44f0:	d282a010	mov	x16, #0x1500                	// #5376
   0x0000fffff7fb44f4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb44f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb44fc:	d63f0200	blr	x16
   0x0000fffff7fb4500:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4504:	5400b980	b.eq	0xfffff7fb5c34  // b.none
   0x0000fffff7fb4508:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb450c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb4510:	540004a0	b.eq	0xfffff7fb45a4  // b.none
   0x0000fffff7fb4514:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb4518:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb451c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb4520:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb4524:	54000400	b.eq	0xfffff7fb45a4  // b.none
   0x0000fffff7fb4528:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb452c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb4530:	36d801d1	tbz	w17, #27, 0xfffff7fb4568
   0x0000fffff7fb4534:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb4538:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb453c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4540:	54000321	b.ne	0xfffff7fb45a4  // b.any
   0x0000fffff7fb4544:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb4548:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb454c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4550:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4554:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4558:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb455c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4560:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4564:	54000209	b.ls	0xfffff7fb45a4  // b.plast
   0x0000fffff7fb4568:	36d8008d	tbz	w13, #27, 0xfffff7fb4578
   0x0000fffff7fb456c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb4570:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4574:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb4578:	36d80091	tbz	w17, #27, 0xfffff7fb4588
   0x0000fffff7fb457c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4580:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4584:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4588:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb458c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb4590:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb4594:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb4598:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb459c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb45a0:	1400000e	b	0xfffff7fb45d8
   0x0000fffff7fb45a4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb45a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb45ac:	aa1303e1	mov	x1, x19
   0x0000fffff7fb45b0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb45b4:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fb45b8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb45bc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb45c0:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb45c4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb45c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb45cc:	d63f0200	blr	x16
   0x0000fffff7fb45d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb45d4:	5400b340	b.eq	0xfffff7fb5c3c  // b.none
   0x0000fffff7fb45d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb45dc:	37d806a9	tbnz	w9, #27, 0xfffff7fb46b0
   0x0000fffff7fb45e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb45e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb45e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb45ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb45f0:	540001c1	b.ne	0xfffff7fb4628  // b.any
   0x0000fffff7fb45f4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb45f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb45fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4600:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4604:	54000121	b.ne	0xfffff7fb4628  // b.any
   0x0000fffff7fb4608:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb460c:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb4610:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb4614:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4618:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb461c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb4620:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb4624:	14000030	b	0xfffff7fb46e4
   0x0000fffff7fb4628:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb462c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4630:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4634:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4638:	54000120	b.eq	0xfffff7fb465c  // b.none
   0x0000fffff7fb463c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb4640:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4644:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4648:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb464c:	54000321	b.ne	0xfffff7fb46b0  // b.any
   0x0000fffff7fb4650:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb4654:	9e620120	scvtf	d0, x9
   0x0000fffff7fb4658:	14000002	b	0xfffff7fb4660
   0x0000fffff7fb465c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb4660:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb4664:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4668:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb466c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4670:	54000120	b.eq	0xfffff7fb4694  // b.none
   0x0000fffff7fb4674:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb4678:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb467c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4680:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4684:	54000161	b.ne	0xfffff7fb46b0  // b.any
   0x0000fffff7fb4688:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb468c:	9e620121	scvtf	d1, x9
   0x0000fffff7fb4690:	14000002	b	0xfffff7fb4698
   0x0000fffff7fb4694:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb4698:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb469c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb46a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb46a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb46a8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb46ac:	17ffffde	b	0xfffff7fb4624
   0x0000fffff7fb46b0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb46b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb46b8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb46bc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb46c0:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fb46c4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb46c8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb46cc:	d294c490	mov	x16, #0xa624                	// #42532
   0x0000fffff7fb46d0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb46d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb46d8:	d63f0200	blr	x16
   0x0000fffff7fb46dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb46e0:	5400ab20	b.eq	0xfffff7fb5c44  // b.none
   0x0000fffff7fb46e4:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb46e8:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb46ec:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb46f0:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb46f4:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb46f8:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb46fc:	36d801d1	tbz	w17, #27, 0xfffff7fb4734
   0x0000fffff7fb4700:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb4704:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4708:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb470c:	54000281	b.ne	0xfffff7fb475c  // b.any
   0x0000fffff7fb4710:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb4714:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4718:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb471c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4720:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4724:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4728:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb472c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4730:	54000169	b.ls	0xfffff7fb475c  // b.plast
   0x0000fffff7fb4734:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb4738:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb473c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb4740:	36d80091	tbz	w17, #27, 0xfffff7fb4750
   0x0000fffff7fb4744:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4748:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb474c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4750:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb4754:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb4758:	1400000e	b	0xfffff7fb4790
   0x0000fffff7fb475c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb4760:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4764:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4768:	aa1503e2	mov	x2, x21
   0x0000fffff7fb476c:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fb4770:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4774:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4778:	d2956a10	mov	x16, #0xab50                	// #43856
   0x0000fffff7fb477c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb4780:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4784:	d63f0200	blr	x16
   0x0000fffff7fb4788:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb478c:	5400a600	b.eq	0xfffff7fb5c4c  // b.none
   0x0000fffff7fb4790:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb4794:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb4798:	540003a0	b.eq	0xfffff7fb480c  // b.none
   0x0000fffff7fb479c:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb47a0:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb47a4:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb47a8:	36d801d1	tbz	w17, #27, 0xfffff7fb47e0
   0x0000fffff7fb47ac:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb47b0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb47b4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb47b8:	540002a1	b.ne	0xfffff7fb480c  // b.any
   0x0000fffff7fb47bc:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb47c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb47c4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb47c8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb47cc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb47d0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb47d4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb47d8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb47dc:	54000189	b.ls	0xfffff7fb480c  // b.plast
   0x0000fffff7fb47e0:	36d8008d	tbz	w13, #27, 0xfffff7fb47f0
   0x0000fffff7fb47e4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb47e8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb47ec:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb47f0:	36d80091	tbz	w17, #27, 0xfffff7fb4800
   0x0000fffff7fb47f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb47f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb47fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4800:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb4804:	b900016d	str	w13, [x11]
   0x0000fffff7fb4808:	1400000e	b	0xfffff7fb4840
   0x0000fffff7fb480c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb4810:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4814:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4818:	aa1503e2	mov	x2, x21
   0x0000fffff7fb481c:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fb4820:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4824:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4828:	d282a010	mov	x16, #0x1500                	// #5376
   0x0000fffff7fb482c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb4830:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4834:	d63f0200	blr	x16
   0x0000fffff7fb4838:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb483c:	5400a0c0	b.eq	0xfffff7fb5c54  // b.none
   0x0000fffff7fb4840:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb4844:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb4848:	540004a0	b.eq	0xfffff7fb48dc  // b.none
   0x0000fffff7fb484c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb4850:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb4854:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb4858:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb485c:	54000400	b.eq	0xfffff7fb48dc  // b.none
   0x0000fffff7fb4860:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb4864:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb4868:	36d801d1	tbz	w17, #27, 0xfffff7fb48a0
   0x0000fffff7fb486c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb4870:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4874:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4878:	54000321	b.ne	0xfffff7fb48dc  // b.any
   0x0000fffff7fb487c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb4880:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4884:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4888:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb488c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4890:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4894:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4898:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb489c:	54000209	b.ls	0xfffff7fb48dc  // b.plast
   0x0000fffff7fb48a0:	36d8008d	tbz	w13, #27, 0xfffff7fb48b0
   0x0000fffff7fb48a4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb48a8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb48ac:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb48b0:	36d80091	tbz	w17, #27, 0xfffff7fb48c0
   0x0000fffff7fb48b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb48b8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb48bc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb48c0:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb48c4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb48c8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb48cc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb48d0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb48d4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb48d8:	1400000e	b	0xfffff7fb4910
   0x0000fffff7fb48dc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb48e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb48e4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb48e8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb48ec:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fb48f0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb48f4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb48f8:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb48fc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb4900:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4904:	d63f0200	blr	x16
   0x0000fffff7fb4908:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb490c:	54009a80	b.eq	0xfffff7fb5c5c  // b.none
   0x0000fffff7fb4910:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb4914:	37d806a9	tbnz	w9, #27, 0xfffff7fb49e8
   0x0000fffff7fb4918:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb491c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4920:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4924:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4928:	540001c1	b.ne	0xfffff7fb4960  // b.any
   0x0000fffff7fb492c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb4930:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4934:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4938:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb493c:	54000121	b.ne	0xfffff7fb4960  // b.any
   0x0000fffff7fb4940:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb4944:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb4948:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb494c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4950:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4954:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb4958:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb495c:	14000030	b	0xfffff7fb4a1c
   0x0000fffff7fb4960:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb4964:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4968:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb496c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4970:	54000120	b.eq	0xfffff7fb4994  // b.none
   0x0000fffff7fb4974:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb4978:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb497c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4980:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4984:	54000321	b.ne	0xfffff7fb49e8  // b.any
   0x0000fffff7fb4988:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb498c:	9e620120	scvtf	d0, x9
   0x0000fffff7fb4990:	14000002	b	0xfffff7fb4998
   0x0000fffff7fb4994:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb4998:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb499c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb49a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb49a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb49a8:	54000120	b.eq	0xfffff7fb49cc  // b.none
   0x0000fffff7fb49ac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb49b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb49b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb49b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb49bc:	54000161	b.ne	0xfffff7fb49e8  // b.any
   0x0000fffff7fb49c0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb49c4:	9e620121	scvtf	d1, x9
   0x0000fffff7fb49c8:	14000002	b	0xfffff7fb49d0
   0x0000fffff7fb49cc:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb49d0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb49d4:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb49d8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb49dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb49e0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb49e4:	17ffffde	b	0xfffff7fb495c
   0x0000fffff7fb49e8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb49ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb49f0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb49f4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb49f8:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fb49fc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4a00:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4a04:	d294c490	mov	x16, #0xa624                	// #42532
   0x0000fffff7fb4a08:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb4a0c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4a10:	d63f0200	blr	x16
   0x0000fffff7fb4a14:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4a18:	54009260	b.eq	0xfffff7fb5c64  // b.none
   0x0000fffff7fb4a1c:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb4a20:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb4a24:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb4a28:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb4a2c:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb4a30:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb4a34:	36d801d1	tbz	w17, #27, 0xfffff7fb4a6c
   0x0000fffff7fb4a38:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb4a3c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4a40:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4a44:	54000281	b.ne	0xfffff7fb4a94  // b.any
   0x0000fffff7fb4a48:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb4a4c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4a50:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4a54:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4a58:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4a5c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4a60:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4a64:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4a68:	54000169	b.ls	0xfffff7fb4a94  // b.plast
   0x0000fffff7fb4a6c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb4a70:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4a74:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb4a78:	36d80091	tbz	w17, #27, 0xfffff7fb4a88
   0x0000fffff7fb4a7c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4a80:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4a84:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4a88:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb4a8c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb4a90:	1400000e	b	0xfffff7fb4ac8
   0x0000fffff7fb4a94:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb4a98:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4a9c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4aa0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4aa4:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fb4aa8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4aac:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4ab0:	d2956a10	mov	x16, #0xab50                	// #43856
   0x0000fffff7fb4ab4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb4ab8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4abc:	d63f0200	blr	x16
   0x0000fffff7fb4ac0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4ac4:	54008d40	b.eq	0xfffff7fb5c6c  // b.none
   0x0000fffff7fb4ac8:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb4acc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb4ad0:	540003a0	b.eq	0xfffff7fb4b44  // b.none
   0x0000fffff7fb4ad4:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb4ad8:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb4adc:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb4ae0:	36d801d1	tbz	w17, #27, 0xfffff7fb4b18
   0x0000fffff7fb4ae4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb4ae8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4aec:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4af0:	540002a1	b.ne	0xfffff7fb4b44  // b.any
   0x0000fffff7fb4af4:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb4af8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4afc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4b00:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4b04:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4b08:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4b0c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4b10:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4b14:	54000189	b.ls	0xfffff7fb4b44  // b.plast
   0x0000fffff7fb4b18:	36d8008d	tbz	w13, #27, 0xfffff7fb4b28
   0x0000fffff7fb4b1c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb4b20:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4b24:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb4b28:	36d80091	tbz	w17, #27, 0xfffff7fb4b38
   0x0000fffff7fb4b2c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4b30:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4b34:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4b38:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb4b3c:	b900016d	str	w13, [x11]
   0x0000fffff7fb4b40:	1400000e	b	0xfffff7fb4b78
   0x0000fffff7fb4b44:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb4b48:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4b4c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4b50:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4b54:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fb4b58:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4b5c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4b60:	d282a010	mov	x16, #0x1500                	// #5376
   0x0000fffff7fb4b64:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb4b68:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4b6c:	d63f0200	blr	x16
   0x0000fffff7fb4b70:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4b74:	54008800	b.eq	0xfffff7fb5c74  // b.none
   0x0000fffff7fb4b78:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb4b7c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb4b80:	540004a0	b.eq	0xfffff7fb4c14  // b.none
   0x0000fffff7fb4b84:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb4b88:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb4b8c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb4b90:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb4b94:	54000400	b.eq	0xfffff7fb4c14  // b.none
   0x0000fffff7fb4b98:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb4b9c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb4ba0:	36d801d1	tbz	w17, #27, 0xfffff7fb4bd8
   0x0000fffff7fb4ba4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb4ba8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4bac:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4bb0:	54000321	b.ne	0xfffff7fb4c14  // b.any
   0x0000fffff7fb4bb4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb4bb8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4bbc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4bc0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4bc4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4bc8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4bcc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4bd0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4bd4:	54000209	b.ls	0xfffff7fb4c14  // b.plast
   0x0000fffff7fb4bd8:	36d8008d	tbz	w13, #27, 0xfffff7fb4be8
   0x0000fffff7fb4bdc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb4be0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4be4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb4be8:	36d80091	tbz	w17, #27, 0xfffff7fb4bf8
   0x0000fffff7fb4bec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4bf0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4bf4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4bf8:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb4bfc:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb4c00:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb4c04:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb4c08:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb4c0c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb4c10:	1400000e	b	0xfffff7fb4c48
   0x0000fffff7fb4c14:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb4c18:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4c1c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4c20:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4c24:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fb4c28:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4c2c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4c30:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb4c34:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb4c38:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4c3c:	d63f0200	blr	x16
   0x0000fffff7fb4c40:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4c44:	540081c0	b.eq	0xfffff7fb5c7c  // b.none
   0x0000fffff7fb4c48:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb4c4c:	37d806a9	tbnz	w9, #27, 0xfffff7fb4d20
   0x0000fffff7fb4c50:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb4c54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4c58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4c5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4c60:	540001c1	b.ne	0xfffff7fb4c98  // b.any
   0x0000fffff7fb4c64:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb4c68:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4c6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4c70:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4c74:	54000121	b.ne	0xfffff7fb4c98  // b.any
   0x0000fffff7fb4c78:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb4c7c:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb4c80:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb4c84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4c88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4c8c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb4c90:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb4c94:	14000030	b	0xfffff7fb4d54
   0x0000fffff7fb4c98:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb4c9c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4ca0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4ca4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4ca8:	54000120	b.eq	0xfffff7fb4ccc  // b.none
   0x0000fffff7fb4cac:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb4cb0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4cb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4cb8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4cbc:	54000321	b.ne	0xfffff7fb4d20  // b.any
   0x0000fffff7fb4cc0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb4cc4:	9e620120	scvtf	d0, x9
   0x0000fffff7fb4cc8:	14000002	b	0xfffff7fb4cd0
   0x0000fffff7fb4ccc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb4cd0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb4cd4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4cd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4cdc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4ce0:	54000120	b.eq	0xfffff7fb4d04  // b.none
   0x0000fffff7fb4ce4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb4ce8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4cec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4cf0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4cf4:	54000161	b.ne	0xfffff7fb4d20  // b.any
   0x0000fffff7fb4cf8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb4cfc:	9e620121	scvtf	d1, x9
   0x0000fffff7fb4d00:	14000002	b	0xfffff7fb4d08
   0x0000fffff7fb4d04:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb4d08:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb4d0c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb4d10:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4d14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4d18:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb4d1c:	17ffffde	b	0xfffff7fb4c94
   0x0000fffff7fb4d20:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb4d24:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4d28:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4d2c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4d30:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fb4d34:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4d38:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4d3c:	d294c490	mov	x16, #0xa624                	// #42532
   0x0000fffff7fb4d40:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb4d44:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4d48:	d63f0200	blr	x16
   0x0000fffff7fb4d4c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4d50:	540079a0	b.eq	0xfffff7fb5c84  // b.none
   0x0000fffff7fb4d54:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb4d58:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb4d5c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb4d60:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb4d64:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb4d68:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb4d6c:	36d801d1	tbz	w17, #27, 0xfffff7fb4da4
   0x0000fffff7fb4d70:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb4d74:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4d78:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4d7c:	54000281	b.ne	0xfffff7fb4dcc  // b.any
   0x0000fffff7fb4d80:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb4d84:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4d88:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4d8c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4d90:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4d94:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4d98:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4d9c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4da0:	54000169	b.ls	0xfffff7fb4dcc  // b.plast
   0x0000fffff7fb4da4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb4da8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4dac:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb4db0:	36d80091	tbz	w17, #27, 0xfffff7fb4dc0
   0x0000fffff7fb4db4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4db8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4dbc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4dc0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb4dc4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb4dc8:	1400000e	b	0xfffff7fb4e00
   0x0000fffff7fb4dcc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb4dd0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4dd4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4dd8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4ddc:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fb4de0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4de4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4de8:	d2956a10	mov	x16, #0xab50                	// #43856
   0x0000fffff7fb4dec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb4df0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4df4:	d63f0200	blr	x16
   0x0000fffff7fb4df8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4dfc:	54007480	b.eq	0xfffff7fb5c8c  // b.none
   0x0000fffff7fb4e00:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb4e04:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb4e08:	540003a0	b.eq	0xfffff7fb4e7c  // b.none
   0x0000fffff7fb4e0c:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb4e10:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb4e14:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb4e18:	36d801d1	tbz	w17, #27, 0xfffff7fb4e50
   0x0000fffff7fb4e1c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb4e20:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4e24:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4e28:	540002a1	b.ne	0xfffff7fb4e7c  // b.any
   0x0000fffff7fb4e2c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb4e30:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4e34:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4e38:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4e3c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4e40:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4e44:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4e48:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4e4c:	54000189	b.ls	0xfffff7fb4e7c  // b.plast
   0x0000fffff7fb4e50:	36d8008d	tbz	w13, #27, 0xfffff7fb4e60
   0x0000fffff7fb4e54:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb4e58:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4e5c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb4e60:	36d80091	tbz	w17, #27, 0xfffff7fb4e70
   0x0000fffff7fb4e64:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4e68:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4e6c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4e70:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb4e74:	b900016d	str	w13, [x11]
   0x0000fffff7fb4e78:	1400000e	b	0xfffff7fb4eb0
   0x0000fffff7fb4e7c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb4e80:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4e84:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4e88:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4e8c:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fb4e90:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4e94:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4e98:	d282a010	mov	x16, #0x1500                	// #5376
   0x0000fffff7fb4e9c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb4ea0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4ea4:	d63f0200	blr	x16
   0x0000fffff7fb4ea8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4eac:	54006f40	b.eq	0xfffff7fb5c94  // b.none
   0x0000fffff7fb4eb0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb4eb4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb4eb8:	540004a0	b.eq	0xfffff7fb4f4c  // b.none
   0x0000fffff7fb4ebc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb4ec0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb4ec4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb4ec8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb4ecc:	54000400	b.eq	0xfffff7fb4f4c  // b.none
   0x0000fffff7fb4ed0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb4ed4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb4ed8:	36d801d1	tbz	w17, #27, 0xfffff7fb4f10
   0x0000fffff7fb4edc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb4ee0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4ee4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4ee8:	54000321	b.ne	0xfffff7fb4f4c  // b.any
   0x0000fffff7fb4eec:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb4ef0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4ef4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4ef8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4efc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4f00:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4f04:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4f08:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4f0c:	54000209	b.ls	0xfffff7fb4f4c  // b.plast
   0x0000fffff7fb4f10:	36d8008d	tbz	w13, #27, 0xfffff7fb4f20
   0x0000fffff7fb4f14:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb4f18:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4f1c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb4f20:	36d80091	tbz	w17, #27, 0xfffff7fb4f30
   0x0000fffff7fb4f24:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4f28:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4f2c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4f30:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb4f34:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb4f38:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb4f3c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb4f40:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb4f44:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb4f48:	1400000e	b	0xfffff7fb4f80
   0x0000fffff7fb4f4c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb4f50:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4f54:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4f58:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4f5c:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fb4f60:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4f64:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4f68:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb4f6c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb4f70:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4f74:	d63f0200	blr	x16
   0x0000fffff7fb4f78:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4f7c:	54006900	b.eq	0xfffff7fb5c9c  // b.none
   0x0000fffff7fb4f80:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb4f84:	37d806a9	tbnz	w9, #27, 0xfffff7fb5058
   0x0000fffff7fb4f88:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb4f8c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4f90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4f94:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4f98:	540001c1	b.ne	0xfffff7fb4fd0  // b.any
   0x0000fffff7fb4f9c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb4fa0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4fa4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4fa8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4fac:	54000121	b.ne	0xfffff7fb4fd0  // b.any
   0x0000fffff7fb4fb0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb4fb4:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb4fb8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb4fbc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4fc0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4fc4:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb4fc8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb4fcc:	14000030	b	0xfffff7fb508c
   0x0000fffff7fb4fd0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb4fd4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4fd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4fdc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4fe0:	54000120	b.eq	0xfffff7fb5004  // b.none
   0x0000fffff7fb4fe4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb4fe8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4fec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4ff0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4ff4:	54000321	b.ne	0xfffff7fb5058  // b.any
   0x0000fffff7fb4ff8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb4ffc:	9e620120	scvtf	d0, x9
   0x0000fffff7fb5000:	14000002	b	0xfffff7fb5008
   0x0000fffff7fb5004:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb5008:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb500c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb5010:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5014:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5018:	54000120	b.eq	0xfffff7fb503c  // b.none
   0x0000fffff7fb501c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb5020:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5024:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5028:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb502c:	54000161	b.ne	0xfffff7fb5058  // b.any
   0x0000fffff7fb5030:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb5034:	9e620121	scvtf	d1, x9
   0x0000fffff7fb5038:	14000002	b	0xfffff7fb5040
   0x0000fffff7fb503c:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb5040:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb5044:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb5048:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb504c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5050:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb5054:	17ffffde	b	0xfffff7fb4fcc
   0x0000fffff7fb5058:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb505c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb5060:	aa1303e1	mov	x1, x19
   0x0000fffff7fb5064:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5068:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fb506c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb5070:	aa1603e5	mov	x5, x22
   0x0000fffff7fb5074:	d294c490	mov	x16, #0xa624                	// #42532
   0x0000fffff7fb5078:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb507c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb5080:	d63f0200	blr	x16
   0x0000fffff7fb5084:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb5088:	540060e0	b.eq	0xfffff7fb5ca4  // b.none
   0x0000fffff7fb508c:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb5090:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb5094:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb5098:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb509c:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb50a0:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb50a4:	36d801d1	tbz	w17, #27, 0xfffff7fb50dc
   0x0000fffff7fb50a8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb50ac:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb50b0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb50b4:	54000281	b.ne	0xfffff7fb5104  // b.any
   0x0000fffff7fb50b8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb50bc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb50c0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb50c4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb50c8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb50cc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb50d0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb50d4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb50d8:	54000169	b.ls	0xfffff7fb5104  // b.plast
   0x0000fffff7fb50dc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb50e0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb50e4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb50e8:	36d80091	tbz	w17, #27, 0xfffff7fb50f8
   0x0000fffff7fb50ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb50f0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb50f4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb50f8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb50fc:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb5100:	1400000e	b	0xfffff7fb5138
   0x0000fffff7fb5104:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb5108:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb510c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb5110:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5114:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fb5118:	aa1403e4	mov	x4, x20
   0x0000fffff7fb511c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb5120:	d2956a10	mov	x16, #0xab50                	// #43856
   0x0000fffff7fb5124:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb5128:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb512c:	d63f0200	blr	x16
   0x0000fffff7fb5130:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb5134:	54005bc0	b.eq	0xfffff7fb5cac  // b.none
   0x0000fffff7fb5138:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb513c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb5140:	540003a0	b.eq	0xfffff7fb51b4  // b.none
   0x0000fffff7fb5144:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb5148:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb514c:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb5150:	36d801d1	tbz	w17, #27, 0xfffff7fb5188
   0x0000fffff7fb5154:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb5158:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb515c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb5160:	540002a1	b.ne	0xfffff7fb51b4  // b.any
   0x0000fffff7fb5164:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb5168:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb516c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb5170:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb5174:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb5178:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb517c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb5180:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb5184:	54000189	b.ls	0xfffff7fb51b4  // b.plast
   0x0000fffff7fb5188:	36d8008d	tbz	w13, #27, 0xfffff7fb5198
   0x0000fffff7fb518c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb5190:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb5194:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb5198:	36d80091	tbz	w17, #27, 0xfffff7fb51a8
   0x0000fffff7fb519c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb51a0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb51a4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb51a8:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb51ac:	b900016d	str	w13, [x11]
   0x0000fffff7fb51b0:	1400000e	b	0xfffff7fb51e8
   0x0000fffff7fb51b4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb51b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb51bc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb51c0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb51c4:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fb51c8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb51cc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb51d0:	d282a010	mov	x16, #0x1500                	// #5376
   0x0000fffff7fb51d4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb51d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb51dc:	d63f0200	blr	x16
   0x0000fffff7fb51e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb51e4:	54005680	b.eq	0xfffff7fb5cb4  // b.none
   0x0000fffff7fb51e8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb51ec:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb51f0:	540004a0	b.eq	0xfffff7fb5284  // b.none
   0x0000fffff7fb51f4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb51f8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb51fc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb5200:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb5204:	54000400	b.eq	0xfffff7fb5284  // b.none
   0x0000fffff7fb5208:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb520c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb5210:	36d801d1	tbz	w17, #27, 0xfffff7fb5248
   0x0000fffff7fb5214:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb5218:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb521c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb5220:	54000321	b.ne	0xfffff7fb5284  // b.any
   0x0000fffff7fb5224:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb5228:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb522c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb5230:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb5234:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb5238:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb523c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb5240:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb5244:	54000209	b.ls	0xfffff7fb5284  // b.plast
   0x0000fffff7fb5248:	36d8008d	tbz	w13, #27, 0xfffff7fb5258
   0x0000fffff7fb524c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb5250:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb5254:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb5258:	36d80091	tbz	w17, #27, 0xfffff7fb5268
   0x0000fffff7fb525c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb5260:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb5264:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb5268:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb526c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb5270:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb5274:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb5278:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb527c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb5280:	1400000e	b	0xfffff7fb52b8
   0x0000fffff7fb5284:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb5288:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb528c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb5290:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5294:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fb5298:	aa1403e4	mov	x4, x20
   0x0000fffff7fb529c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb52a0:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb52a4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb52a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb52ac:	d63f0200	blr	x16
   0x0000fffff7fb52b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb52b4:	54005040	b.eq	0xfffff7fb5cbc  // b.none
   0x0000fffff7fb52b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb52bc:	37d806a9	tbnz	w9, #27, 0xfffff7fb5390
   0x0000fffff7fb52c0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb52c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb52c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb52cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb52d0:	540001c1	b.ne	0xfffff7fb5308  // b.any
   0x0000fffff7fb52d4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb52d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb52dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb52e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb52e4:	54000121	b.ne	0xfffff7fb5308  // b.any
   0x0000fffff7fb52e8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb52ec:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb52f0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb52f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb52f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb52fc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb5300:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb5304:	14000030	b	0xfffff7fb53c4
   0x0000fffff7fb5308:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb530c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb5310:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5314:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5318:	54000120	b.eq	0xfffff7fb533c  // b.none
   0x0000fffff7fb531c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb5320:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5324:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5328:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb532c:	54000321	b.ne	0xfffff7fb5390  // b.any
   0x0000fffff7fb5330:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb5334:	9e620120	scvtf	d0, x9
   0x0000fffff7fb5338:	14000002	b	0xfffff7fb5340
   0x0000fffff7fb533c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb5340:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb5344:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb5348:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb534c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5350:	54000120	b.eq	0xfffff7fb5374  // b.none
   0x0000fffff7fb5354:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb5358:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb535c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5360:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5364:	54000161	b.ne	0xfffff7fb5390  // b.any
   0x0000fffff7fb5368:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb536c:	9e620121	scvtf	d1, x9
   0x0000fffff7fb5370:	14000002	b	0xfffff7fb5378
   0x0000fffff7fb5374:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb5378:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb537c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb5380:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb5384:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5388:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb538c:	17ffffde	b	0xfffff7fb5304
   0x0000fffff7fb5390:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb5394:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb5398:	aa1303e1	mov	x1, x19
   0x0000fffff7fb539c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb53a0:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fb53a4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb53a8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb53ac:	d294c490	mov	x16, #0xa624                	// #42532
   0x0000fffff7fb53b0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb53b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb53b8:	d63f0200	blr	x16
   0x0000fffff7fb53bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb53c0:	54004820	b.eq	0xfffff7fb5cc4  // b.none
   0x0000fffff7fb53c4:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb53c8:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb53cc:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb53d0:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb53d4:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb53d8:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb53dc:	36d801d1	tbz	w17, #27, 0xfffff7fb5414
   0x0000fffff7fb53e0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb53e4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb53e8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb53ec:	54000281	b.ne	0xfffff7fb543c  // b.any
   0x0000fffff7fb53f0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb53f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb53f8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb53fc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb5400:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb5404:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb5408:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb540c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb5410:	54000169	b.ls	0xfffff7fb543c  // b.plast
   0x0000fffff7fb5414:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb5418:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb541c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb5420:	36d80091	tbz	w17, #27, 0xfffff7fb5430
   0x0000fffff7fb5424:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb5428:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb542c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb5430:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb5434:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb5438:	1400000e	b	0xfffff7fb5470
   0x0000fffff7fb543c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb5440:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb5444:	aa1303e1	mov	x1, x19
   0x0000fffff7fb5448:	aa1503e2	mov	x2, x21
   0x0000fffff7fb544c:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fb5450:	aa1403e4	mov	x4, x20
   0x0000fffff7fb5454:	aa1603e5	mov	x5, x22
   0x0000fffff7fb5458:	d2956a10	mov	x16, #0xab50                	// #43856
   0x0000fffff7fb545c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb5460:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb5464:	d63f0200	blr	x16
   0x0000fffff7fb5468:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb546c:	54004300	b.eq	0xfffff7fb5ccc  // b.none
   0x0000fffff7fb5470:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb5474:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb5478:	540003a0	b.eq	0xfffff7fb54ec  // b.none
   0x0000fffff7fb547c:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb5480:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb5484:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb5488:	36d801d1	tbz	w17, #27, 0xfffff7fb54c0
   0x0000fffff7fb548c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb5490:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb5494:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb5498:	540002a1	b.ne	0xfffff7fb54ec  // b.any
   0x0000fffff7fb549c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb54a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb54a4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb54a8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb54ac:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb54b0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb54b4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb54b8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb54bc:	54000189	b.ls	0xfffff7fb54ec  // b.plast
   0x0000fffff7fb54c0:	36d8008d	tbz	w13, #27, 0xfffff7fb54d0
   0x0000fffff7fb54c4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb54c8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb54cc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb54d0:	36d80091	tbz	w17, #27, 0xfffff7fb54e0
   0x0000fffff7fb54d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb54d8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb54dc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb54e0:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb54e4:	b900016d	str	w13, [x11]
   0x0000fffff7fb54e8:	1400000e	b	0xfffff7fb5520
   0x0000fffff7fb54ec:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb54f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb54f4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb54f8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb54fc:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fb5500:	aa1403e4	mov	x4, x20
   0x0000fffff7fb5504:	aa1603e5	mov	x5, x22
   0x0000fffff7fb5508:	d282a010	mov	x16, #0x1500                	// #5376
   0x0000fffff7fb550c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb5510:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb5514:	d63f0200	blr	x16
   0x0000fffff7fb5518:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb551c:	54003dc0	b.eq	0xfffff7fb5cd4  // b.none
   0x0000fffff7fb5520:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb5524:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb5528:	540004a0	b.eq	0xfffff7fb55bc  // b.none
   0x0000fffff7fb552c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb5530:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb5534:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb5538:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb553c:	54000400	b.eq	0xfffff7fb55bc  // b.none
   0x0000fffff7fb5540:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb5544:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb5548:	36d801d1	tbz	w17, #27, 0xfffff7fb5580
   0x0000fffff7fb554c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb5550:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb5554:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb5558:	54000321	b.ne	0xfffff7fb55bc  // b.any
   0x0000fffff7fb555c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb5560:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb5564:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb5568:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb556c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb5570:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb5574:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb5578:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb557c:	54000209	b.ls	0xfffff7fb55bc  // b.plast
   0x0000fffff7fb5580:	36d8008d	tbz	w13, #27, 0xfffff7fb5590
   0x0000fffff7fb5584:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb5588:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb558c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb5590:	36d80091	tbz	w17, #27, 0xfffff7fb55a0
   0x0000fffff7fb5594:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb5598:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb559c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb55a0:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb55a4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb55a8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb55ac:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb55b0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb55b4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb55b8:	1400000e	b	0xfffff7fb55f0
   0x0000fffff7fb55bc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb55c0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb55c4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb55c8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb55cc:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fb55d0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb55d4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb55d8:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb55dc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb55e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb55e4:	d63f0200	blr	x16
   0x0000fffff7fb55e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb55ec:	54003780	b.eq	0xfffff7fb5cdc  // b.none
   0x0000fffff7fb55f0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb55f4:	37d806a9	tbnz	w9, #27, 0xfffff7fb56c8
   0x0000fffff7fb55f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb55fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5600:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5604:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5608:	540001c1	b.ne	0xfffff7fb5640  // b.any
   0x0000fffff7fb560c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb5610:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5614:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5618:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb561c:	54000121	b.ne	0xfffff7fb5640  // b.any
   0x0000fffff7fb5620:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb5624:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb5628:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb562c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5630:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5634:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb5638:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb563c:	14000030	b	0xfffff7fb56fc
   0x0000fffff7fb5640:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb5644:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb5648:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb564c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5650:	54000120	b.eq	0xfffff7fb5674  // b.none
   0x0000fffff7fb5654:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb5658:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb565c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5660:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5664:	54000321	b.ne	0xfffff7fb56c8  // b.any
   0x0000fffff7fb5668:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb566c:	9e620120	scvtf	d0, x9
   0x0000fffff7fb5670:	14000002	b	0xfffff7fb5678
   0x0000fffff7fb5674:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb5678:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb567c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb5680:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5684:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5688:	54000120	b.eq	0xfffff7fb56ac  // b.none
   0x0000fffff7fb568c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb5690:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5694:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5698:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb569c:	54000161	b.ne	0xfffff7fb56c8  // b.any
   0x0000fffff7fb56a0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb56a4:	9e620121	scvtf	d1, x9
   0x0000fffff7fb56a8:	14000002	b	0xfffff7fb56b0
   0x0000fffff7fb56ac:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb56b0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb56b4:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb56b8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb56bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb56c0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb56c4:	17ffffde	b	0xfffff7fb563c
   0x0000fffff7fb56c8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb56cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb56d0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb56d4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb56d8:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fb56dc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb56e0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb56e4:	d294c490	mov	x16, #0xa624                	// #42532
   0x0000fffff7fb56e8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb56ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb56f0:	d63f0200	blr	x16
   0x0000fffff7fb56f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb56f8:	54002f60	b.eq	0xfffff7fb5ce4  // b.none
   0x0000fffff7fb56fc:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb5700:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb5704:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb5708:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb570c:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb5710:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb5714:	36d801d1	tbz	w17, #27, 0xfffff7fb574c
   0x0000fffff7fb5718:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb571c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb5720:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb5724:	54000281	b.ne	0xfffff7fb5774  // b.any
   0x0000fffff7fb5728:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb572c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb5730:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb5734:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb5738:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb573c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb5740:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb5744:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb5748:	54000169	b.ls	0xfffff7fb5774  // b.plast
   0x0000fffff7fb574c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb5750:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb5754:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb5758:	36d80091	tbz	w17, #27, 0xfffff7fb5768
   0x0000fffff7fb575c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb5760:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb5764:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb5768:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb576c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb5770:	1400000e	b	0xfffff7fb57a8
   0x0000fffff7fb5774:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb5778:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb577c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb5780:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5784:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fb5788:	aa1403e4	mov	x4, x20
   0x0000fffff7fb578c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb5790:	d2956a10	mov	x16, #0xab50                	// #43856
   0x0000fffff7fb5794:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb5798:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb579c:	d63f0200	blr	x16
   0x0000fffff7fb57a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb57a4:	54002a40	b.eq	0xfffff7fb5cec  // b.none
   0x0000fffff7fb57a8:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb57ac:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb57b0:	540003a0	b.eq	0xfffff7fb5824  // b.none
   0x0000fffff7fb57b4:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb57b8:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb57bc:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb57c0:	36d801d1	tbz	w17, #27, 0xfffff7fb57f8
   0x0000fffff7fb57c4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb57c8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb57cc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb57d0:	540002a1	b.ne	0xfffff7fb5824  // b.any
   0x0000fffff7fb57d4:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb57d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb57dc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb57e0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb57e4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb57e8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb57ec:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb57f0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb57f4:	54000189	b.ls	0xfffff7fb5824  // b.plast
   0x0000fffff7fb57f8:	36d8008d	tbz	w13, #27, 0xfffff7fb5808
   0x0000fffff7fb57fc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb5800:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb5804:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb5808:	36d80091	tbz	w17, #27, 0xfffff7fb5818
   0x0000fffff7fb580c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb5810:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb5814:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb5818:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb581c:	b900016d	str	w13, [x11]
   0x0000fffff7fb5820:	1400000e	b	0xfffff7fb5858
   0x0000fffff7fb5824:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb5828:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb582c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb5830:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5834:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fb5838:	aa1403e4	mov	x4, x20
   0x0000fffff7fb583c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb5840:	d282a010	mov	x16, #0x1500                	// #5376
   0x0000fffff7fb5844:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb5848:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb584c:	d63f0200	blr	x16
   0x0000fffff7fb5850:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb5854:	54002500	b.eq	0xfffff7fb5cf4  // b.none
   0x0000fffff7fb5858:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb585c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb5860:	540004a0	b.eq	0xfffff7fb58f4  // b.none
   0x0000fffff7fb5864:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb5868:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb586c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb5870:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb5874:	54000400	b.eq	0xfffff7fb58f4  // b.none
   0x0000fffff7fb5878:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb587c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb5880:	36d801d1	tbz	w17, #27, 0xfffff7fb58b8
   0x0000fffff7fb5884:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb5888:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb588c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb5890:	54000321	b.ne	0xfffff7fb58f4  // b.any
   0x0000fffff7fb5894:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb5898:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb589c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb58a0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb58a4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb58a8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb58ac:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb58b0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb58b4:	54000209	b.ls	0xfffff7fb58f4  // b.plast
   0x0000fffff7fb58b8:	36d8008d	tbz	w13, #27, 0xfffff7fb58c8
   0x0000fffff7fb58bc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb58c0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb58c4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb58c8:	36d80091	tbz	w17, #27, 0xfffff7fb58d8
   0x0000fffff7fb58cc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb58d0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb58d4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb58d8:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb58dc:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb58e0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb58e4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb58e8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb58ec:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb58f0:	1400000e	b	0xfffff7fb5928
   0x0000fffff7fb58f4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb58f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb58fc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb5900:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5904:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fb5908:	aa1403e4	mov	x4, x20
   0x0000fffff7fb590c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb5910:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb5914:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb5918:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb591c:	d63f0200	blr	x16
   0x0000fffff7fb5920:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb5924:	54001ec0	b.eq	0xfffff7fb5cfc  // b.none
   0x0000fffff7fb5928:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb592c:	37d806a9	tbnz	w9, #27, 0xfffff7fb5a00
   0x0000fffff7fb5930:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb5934:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5938:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb593c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5940:	540001c1	b.ne	0xfffff7fb5978  // b.any
   0x0000fffff7fb5944:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb5948:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb594c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5950:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5954:	54000121	b.ne	0xfffff7fb5978  // b.any
   0x0000fffff7fb5958:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb595c:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb5960:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb5964:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5968:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb596c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb5970:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb5974:	14000030	b	0xfffff7fb5a34
   0x0000fffff7fb5978:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb597c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb5980:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5984:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5988:	54000120	b.eq	0xfffff7fb59ac  // b.none
   0x0000fffff7fb598c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb5990:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5994:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5998:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb599c:	54000321	b.ne	0xfffff7fb5a00  // b.any
   0x0000fffff7fb59a0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb59a4:	9e620120	scvtf	d0, x9
   0x0000fffff7fb59a8:	14000002	b	0xfffff7fb59b0
   0x0000fffff7fb59ac:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb59b0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb59b4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb59b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb59bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb59c0:	54000120	b.eq	0xfffff7fb59e4  // b.none
   0x0000fffff7fb59c4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb59c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb59cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb59d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb59d4:	54000161	b.ne	0xfffff7fb5a00  // b.any
   0x0000fffff7fb59d8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb59dc:	9e620121	scvtf	d1, x9
   0x0000fffff7fb59e0:	14000002	b	0xfffff7fb59e8
   0x0000fffff7fb59e4:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb59e8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb59ec:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb59f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb59f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb59f8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb59fc:	17ffffde	b	0xfffff7fb5974
   0x0000fffff7fb5a00:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb5a04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb5a08:	aa1303e1	mov	x1, x19
   0x0000fffff7fb5a0c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5a10:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fb5a14:	aa1403e4	mov	x4, x20
   0x0000fffff7fb5a18:	aa1603e5	mov	x5, x22
   0x0000fffff7fb5a1c:	d294c490	mov	x16, #0xa624                	// #42532
   0x0000fffff7fb5a20:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb5a24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb5a28:	d63f0200	blr	x16
   0x0000fffff7fb5a2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb5a30:	540016a0	b.eq	0xfffff7fb5d04  // b.none
   0x0000fffff7fb5a34:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb5a38:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb5a3c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb5a40:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb5a44:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb5a48:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb5a4c:	36d801d1	tbz	w17, #27, 0xfffff7fb5a84
   0x0000fffff7fb5a50:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb5a54:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb5a58:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb5a5c:	54000281	b.ne	0xfffff7fb5aac  // b.any
   0x0000fffff7fb5a60:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb5a64:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb5a68:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb5a6c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb5a70:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb5a74:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb5a78:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb5a7c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb5a80:	54000169	b.ls	0xfffff7fb5aac  // b.plast
   0x0000fffff7fb5a84:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb5a88:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb5a8c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb5a90:	36d80091	tbz	w17, #27, 0xfffff7fb5aa0
   0x0000fffff7fb5a94:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb5a98:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb5a9c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb5aa0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb5aa4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb5aa8:	1400000e	b	0xfffff7fb5ae0
   0x0000fffff7fb5aac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb5ab0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb5ab4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb5ab8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5abc:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fb5ac0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb5ac4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb5ac8:	d2956a10	mov	x16, #0xab50                	// #43856
   0x0000fffff7fb5acc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb5ad0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb5ad4:	d63f0200	blr	x16
   0x0000fffff7fb5ad8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb5adc:	54001180	b.eq	0xfffff7fb5d0c  // b.none
   0x0000fffff7fb5ae0:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb5ae4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb5ae8:	540003a0	b.eq	0xfffff7fb5b5c  // b.none
   0x0000fffff7fb5aec:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb5af0:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb5af4:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb5af8:	36d801d1	tbz	w17, #27, 0xfffff7fb5b30
   0x0000fffff7fb5afc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb5b00:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb5b04:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb5b08:	540002a1	b.ne	0xfffff7fb5b5c  // b.any
   0x0000fffff7fb5b0c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb5b10:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb5b14:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb5b18:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb5b1c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb5b20:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb5b24:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb5b28:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb5b2c:	54000189	b.ls	0xfffff7fb5b5c  // b.plast
   0x0000fffff7fb5b30:	36d8008d	tbz	w13, #27, 0xfffff7fb5b40
   0x0000fffff7fb5b34:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb5b38:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb5b3c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb5b40:	36d80091	tbz	w17, #27, 0xfffff7fb5b50
   0x0000fffff7fb5b44:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb5b48:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb5b4c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb5b50:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb5b54:	b900016d	str	w13, [x11]
   0x0000fffff7fb5b58:	1400000e	b	0xfffff7fb5b90
   0x0000fffff7fb5b5c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb5b60:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb5b64:	aa1303e1	mov	x1, x19
   0x0000fffff7fb5b68:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5b6c:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fb5b70:	aa1403e4	mov	x4, x20
   0x0000fffff7fb5b74:	aa1603e5	mov	x5, x22
   0x0000fffff7fb5b78:	d282a010	mov	x16, #0x1500                	// #5376
   0x0000fffff7fb5b7c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb5b80:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb5b84:	d63f0200	blr	x16
   0x0000fffff7fb5b88:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb5b8c:	54000c40	b.eq	0xfffff7fb5d14  // b.none
   0x0000fffff7fb5b90:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb5b94:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb5b98:	aa1303e1	mov	x1, x19
   0x0000fffff7fb5b9c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5ba0:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7fb5ba4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb5ba8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb5bac:	d2869090	mov	x16, #0x3484                	// #13444
   0x0000fffff7fb5bb0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb5bb4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb5bb8:	d63f0200	blr	x16
   0x0000fffff7fb5bbc:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb5bc0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb5bc4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb5bc8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb5bcc:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fb5bd0:	d65f03c0	ret
   0x0000fffff7fb5bd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5bd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5bdc:	b900028a	str	w10, [x20]
   0x0000fffff7fb5be0:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fb5be4:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb5be8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb5bec:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb5bf0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb5bf4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fb5bf8:	d65f03c0	ret
   0x0000fffff7fb5bfc:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fb5c00:	17fffff5	b	0xfffff7fb5bd4
   0x0000fffff7fb5c04:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fb5c08:	17fffff3	b	0xfffff7fb5bd4
   0x0000fffff7fb5c0c:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fb5c10:	17fffff1	b	0xfffff7fb5bd4
   0x0000fffff7fb5c14:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fb5c18:	17ffffef	b	0xfffff7fb5bd4
   0x0000fffff7fb5c1c:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fb5c20:	17ffffed	b	0xfffff7fb5bd4
   0x0000fffff7fb5c24:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fb5c28:	17ffffeb	b	0xfffff7fb5bd4
   0x0000fffff7fb5c2c:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fb5c30:	17ffffe9	b	0xfffff7fb5bd4
   0x0000fffff7fb5c34:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fb5c38:	17ffffe7	b	0xfffff7fb5bd4
   0x0000fffff7fb5c3c:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fb5c40:	17ffffe5	b	0xfffff7fb5bd4
   0x0000fffff7fb5c44:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fb5c48:	17ffffe3	b	0xfffff7fb5bd4
   0x0000fffff7fb5c4c:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fb5c50:	17ffffe1	b	0xfffff7fb5bd4
   0x0000fffff7fb5c54:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fb5c58:	17ffffdf	b	0xfffff7fb5bd4
   0x0000fffff7fb5c5c:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fb5c60:	17ffffdd	b	0xfffff7fb5bd4
   0x0000fffff7fb5c64:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fb5c68:	17ffffdb	b	0xfffff7fb5bd4
   0x0000fffff7fb5c6c:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fb5c70:	17ffffd9	b	0xfffff7fb5bd4
   0x0000fffff7fb5c74:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fb5c78:	17ffffd7	b	0xfffff7fb5bd4
   0x0000fffff7fb5c7c:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fb5c80:	17ffffd5	b	0xfffff7fb5bd4
   0x0000fffff7fb5c84:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fb5c88:	17ffffd3	b	0xfffff7fb5bd4
   0x0000fffff7fb5c8c:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fb5c90:	17ffffd1	b	0xfffff7fb5bd4
   0x0000fffff7fb5c94:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fb5c98:	17ffffcf	b	0xfffff7fb5bd4
   0x0000fffff7fb5c9c:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fb5ca0:	17ffffcd	b	0xfffff7fb5bd4
   0x0000fffff7fb5ca4:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fb5ca8:	17ffffcb	b	0xfffff7fb5bd4
   0x0000fffff7fb5cac:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fb5cb0:	17ffffc9	b	0xfffff7fb5bd4
   0x0000fffff7fb5cb4:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fb5cb8:	17ffffc7	b	0xfffff7fb5bd4
   0x0000fffff7fb5cbc:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fb5cc0:	17ffffc5	b	0xfffff7fb5bd4
   0x0000fffff7fb5cc4:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fb5cc8:	17ffffc3	b	0xfffff7fb5bd4
   0x0000fffff7fb5ccc:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fb5cd0:	17ffffc1	b	0xfffff7fb5bd4
   0x0000fffff7fb5cd4:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fb5cd8:	17ffffbf	b	0xfffff7fb5bd4
   0x0000fffff7fb5cdc:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fb5ce0:	17ffffbd	b	0xfffff7fb5bd4
   0x0000fffff7fb5ce4:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fb5ce8:	17ffffbb	b	0xfffff7fb5bd4
   0x0000fffff7fb5cec:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fb5cf0:	17ffffb9	b	0xfffff7fb5bd4
   0x0000fffff7fb5cf4:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fb5cf8:	17ffffb7	b	0xfffff7fb5bd4
   0x0000fffff7fb5cfc:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fb5d00:	17ffffb5	b	0xfffff7fb5bd4
   0x0000fffff7fb5d04:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fb5d08:	17ffffb3	b	0xfffff7fb5bd4
   0x0000fffff7fb5d0c:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7fb5d10:	17ffffb1	b	0xfffff7fb5bd4
   0x0000fffff7fb5d14:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fb5d18:	17ffffaf	b	0xfffff7fb5bd4
   0x0000fffff7fb5d1c:	00000000	udf	#0
   0x0000fffff7fb5d20:	00000000	udf	#0
   0x0000fffff7fb5d24:	00000000	udf	#0
   0x0000fffff7fb5d28:	00000000	udf	#0
   0x0000fffff7fb5d2c:	00000000	udf	#0
   0x0000fffff7fb5d30:	00000000	udf	#0
   0x0000fffff7fb5d34:	00000000	udf	#0
   0x0000fffff7fb5d38:	00000000	udf	#0
   0x0000fffff7fb5d3c:	00000000	udf	#0
   0x0000fffff7fb5d40:	00000000	udf	#0
   0x0000fffff7fb5d44:	00000000	udf	#0
   0x0000fffff7fb5d48:	00000000	udf	#0
   0x0000fffff7fb5d4c:	00000000	udf	#0
   0x0000fffff7fb5d50:	00000000	udf	#0
   0x0000fffff7fb5d54:	00000000	udf	#0
   0x0000fffff7fb5d58:	00000000	udf	#0
   0x0000fffff7fb5d5c:	00000000	udf	#0
   0x0000fffff7fb5d60:	00000000	udf	#0
   0x0000fffff7fb5d64:	00000000	udf	#0
   0x0000fffff7fb5d68:	00000000	udf	#0
   0x0000fffff7fb5d6c:	00000000	udf	#0
   0x0000fffff7fb5d70:	00000000	udf	#0
   0x0000fffff7fb5d74:	00000000	udf	#0
   0x0000fffff7fb5d78:	00000000	udf	#0
   0x0000fffff7fb5d7c:	00000000	udf	#0
   0x0000fffff7fb5d80:	00000000	udf	#0
   0x0000fffff7fb5d84:	00000000	udf	#0
   0x0000fffff7fb5d88:	00000000	udf	#0
   0x0000fffff7fb5d8c:	00000000	udf	#0
   0x0000fffff7fb5d90:	00000000	udf	#0
   0x0000fffff7fb5d94:	00000000	udf	#0
   0x0000fffff7fb5d98:	00000000	udf	#0
   0x0000fffff7fb5d9c:	00000000	udf	#0
   0x0000fffff7fb5da0:	00000000	udf	#0
   0x0000fffff7fb5da4:	00000000	udf	#0
   0x0000fffff7fb5da8:	00000000	udf	#0
   0x0000fffff7fb5dac:	00000000	udf	#0
   0x0000fffff7fb5db0:	00000000	udf	#0
   0x0000fffff7fb5db4:	00000000	udf	#0
   0x0000fffff7fb5db8:	00000000	udf	#0
   0x0000fffff7fb5dbc:	00000000	udf	#0
   0x0000fffff7fb5dc0:	00000000	udf	#0
   0x0000fffff7fb5dc4:	00000000	udf	#0
   0x0000fffff7fb5dc8:	00000000	udf	#0
   0x0000fffff7fb5dcc:	00000000	udf	#0
   0x0000fffff7fb5dd0:	00000000	udf	#0
   0x0000fffff7fb5dd4:	00000000	udf	#0
   0x0000fffff7fb5dd8:	00000000	udf	#0
   0x0000fffff7fb5ddc:	00000000	udf	#0
   0x0000fffff7fb5de0:	00000000	udf	#0
   0x0000fffff7fb5de4:	00000000	udf	#0
   0x0000fffff7fb5de8:	00000000	udf	#0
   0x0000fffff7fb5dec:	00000000	udf	#0
   0x0000fffff7fb5df0:	00000000	udf	#0
   0x0000fffff7fb5df4:	00000000	udf	#0
   0x0000fffff7fb5df8:	00000000	udf	#0
   0x0000fffff7fb5dfc:	00000000	udf	#0
   0x0000fffff7fb5e00:	00000000	udf	#0
   0x0000fffff7fb5e04:	00000000	udf	#0
   0x0000fffff7fb5e08:	00000000	udf	#0
   0x0000fffff7fb5e0c:	00000000	udf	#0
   0x0000fffff7fb5e10:	00000000	udf	#0
   0x0000fffff7fb5e14:	00000000	udf	#0
   0x0000fffff7fb5e18:	00000000	udf	#0
   0x0000fffff7fb5e1c:	00000000	udf	#0
   0x0000fffff7fb5e20:	00000000	udf	#0
   0x0000fffff7fb5e24:	00000000	udf	#0
   0x0000fffff7fb5e28:	00000000	udf	#0
   0x0000fffff7fb5e2c:	00000000	udf	#0
   0x0000fffff7fb5e30:	00000000	udf	#0
   0x0000fffff7fb5e34:	00000000	udf	#0
   0x0000fffff7fb5e38:	00000000	udf	#0
   0x0000fffff7fb5e3c:	00000000	udf	#0
   0x0000fffff7fb5e40:	00000000	udf	#0
   0x0000fffff7fb5e44:	00000000	udf	#0
   0x0000fffff7fb5e48:	00000000	udf	#0
   0x0000fffff7fb5e4c:	00000000	udf	#0
   0x0000fffff7fb5e50:	00000000	udf	#0
   0x0000fffff7fb5e54:	00000000	udf	#0
   0x0000fffff7fb5e58:	00000000	udf	#0
   0x0000fffff7fb5e5c:	00000000	udf	#0
   0x0000fffff7fb5e60:	00000000	udf	#0
   0x0000fffff7fb5e64:	00000000	udf	#0
   0x0000fffff7fb5e68:	00000000	udf	#0
   0x0000fffff7fb5e6c:	00000000	udf	#0
   0x0000fffff7fb5e70:	00000000	udf	#0
   0x0000fffff7fb5e74:	00000000	udf	#0
   0x0000fffff7fb5e78:	00000000	udf	#0
   0x0000fffff7fb5e7c:	00000000	udf	#0
   0x0000fffff7fb5e80:	00000000	udf	#0
   0x0000fffff7fb5e84:	00000000	udf	#0
   0x0000fffff7fb5e88:	00000000	udf	#0
   0x0000fffff7fb5e8c:	00000000	udf	#0
   0x0000fffff7fb5e90:	00000000	udf	#0
   0x0000fffff7fb5e94:	00000000	udf	#0
   0x0000fffff7fb5e98:	00000000	udf	#0
   0x0000fffff7fb5e9c:	00000000	udf	#0
   0x0000fffff7fb5ea0:	00000000	udf	#0
   0x0000fffff7fb5ea4:	00000000	udf	#0
   0x0000fffff7fb5ea8:	00000000	udf	#0
   0x0000fffff7fb5eac:	00000000	udf	#0
   0x0000fffff7fb5eb0:	00000000	udf	#0
   0x0000fffff7fb5eb4:	00000000	udf	#0
   0x0000fffff7fb5eb8:	00000000	udf	#0
   0x0000fffff7fb5ebc:	00000000	udf	#0
   0x0000fffff7fb5ec0:	00000000	udf	#0
   0x0000fffff7fb5ec4:	00000000	udf	#0
   0x0000fffff7fb5ec8:	00000000	udf	#0
   0x0000fffff7fb5ecc:	00000000	udf	#0
   0x0000fffff7fb5ed0:	00000000	udf	#0
   0x0000fffff7fb5ed4:	00000000	udf	#0
   0x0000fffff7fb5ed8:	00000000	udf	#0
   0x0000fffff7fb5edc:	00000000	udf	#0
   0x0000fffff7fb5ee0:	00000000	udf	#0
   0x0000fffff7fb5ee4:	00000000	udf	#0
   0x0000fffff7fb5ee8:	00000000	udf	#0
   0x0000fffff7fb5eec:	00000000	udf	#0
   0x0000fffff7fb5ef0:	00000000	udf	#0
   0x0000fffff7fb5ef4:	00000000	udf	#0
   0x0000fffff7fb5ef8:	00000000	udf	#0
   0x0000fffff7fb5efc:	00000000	udf	#0
   0x0000fffff7fb5f00:	00000000	udf	#0
   0x0000fffff7fb5f04:	00000000	udf	#0
   0x0000fffff7fb5f08:	00000000	udf	#0
   0x0000fffff7fb5f0c:	00000000	udf	#0
   0x0000fffff7fb5f10:	00000000	udf	#0
   0x0000fffff7fb5f14:	00000000	udf	#0
   0x0000fffff7fb5f18:	00000000	udf	#0
   0x0000fffff7fb5f1c:	00000000	udf	#0
   0x0000fffff7fb5f20:	00000000	udf	#0
   0x0000fffff7fb5f24:	00000000	udf	#0
   0x0000fffff7fb5f28:	00000000	udf	#0
   0x0000fffff7fb5f2c:	00000000	udf	#0
   0x0000fffff7fb5f30:	00000000	udf	#0
   0x0000fffff7fb5f34:	00000000	udf	#0
   0x0000fffff7fb5f38:	00000000	udf	#0
   0x0000fffff7fb5f3c:	00000000	udf	#0
   0x0000fffff7fb5f40:	00000000	udf	#0
   0x0000fffff7fb5f44:	00000000	udf	#0
   0x0000fffff7fb5f48:	00000000	udf	#0
   0x0000fffff7fb5f4c:	00000000	udf	#0
   0x0000fffff7fb5f50:	00000000	udf	#0
   0x0000fffff7fb5f54:	00000000	udf	#0
   0x0000fffff7fb5f58:	00000000	udf	#0
   0x0000fffff7fb5f5c:	00000000	udf	#0
   0x0000fffff7fb5f60:	00000000	udf	#0
   0x0000fffff7fb5f64:	00000000	udf	#0
   0x0000fffff7fb5f68:	00000000	udf	#0
   0x0000fffff7fb5f6c:	00000000	udf	#0
   0x0000fffff7fb5f70:	00000000	udf	#0
   0x0000fffff7fb5f74:	00000000	udf	#0
   0x0000fffff7fb5f78:	00000000	udf	#0
   0x0000fffff7fb5f7c:	00000000	udf	#0
   0x0000fffff7fb5f80:	00000000	udf	#0
   0x0000fffff7fb5f84:	00000000	udf	#0
   0x0000fffff7fb5f88:	00000000	udf	#0
   0x0000fffff7fb5f8c:	00000000	udf	#0
   0x0000fffff7fb5f90:	00000000	udf	#0
   0x0000fffff7fb5f94:	00000000	udf	#0
   0x0000fffff7fb5f98:	00000000	udf	#0
   0x0000fffff7fb5f9c:	00000000	udf	#0
   0x0000fffff7fb5fa0:	00000000	udf	#0
   0x0000fffff7fb5fa4:	00000000	udf	#0
   0x0000fffff7fb5fa8:	00000000	udf	#0
   0x0000fffff7fb5fac:	00000000	udf	#0
   0x0000fffff7fb5fb0:	00000000	udf	#0
   0x0000fffff7fb5fb4:	00000000	udf	#0
   0x0000fffff7fb5fb8:	00000000	udf	#0
   0x0000fffff7fb5fbc:	00000000	udf	#0
   0x0000fffff7fb5fc0:	00000000	udf	#0
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
