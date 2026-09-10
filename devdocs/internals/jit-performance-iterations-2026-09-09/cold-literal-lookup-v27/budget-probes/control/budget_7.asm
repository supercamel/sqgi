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
   0x0000fffff7fb40ec:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb40f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb40f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb40f8:	d63f0200	blr	x16
   0x0000fffff7fb40fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4100:	5400bd80	b.eq	0xfffff7fb58b0  // b.none
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
   0x0000fffff7fb417c:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fb4180:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb4184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4188:	d63f0200	blr	x16
   0x0000fffff7fb418c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4190:	5400b940	b.eq	0xfffff7fb58b8  // b.none
   0x0000fffff7fb4194:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb4198:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb419c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb41a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb41a4:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fb41a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb41ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fb41b0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb41b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb41b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb41bc:	d63f0200	blr	x16
   0x0000fffff7fb41c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb41c4:	5400b7e0	b.eq	0xfffff7fb58c0  // b.none
   0x0000fffff7fb41c8:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb41cc:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb41d0:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fb41d4:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7fb41d8:	36d80211	tbz	w17, #27, 0xfffff7fb4218
   0x0000fffff7fb41dc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb41e0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb41e4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb41e8:	540001e1	b.ne	0xfffff7fb4224  // b.any
   0x0000fffff7fb41ec:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7fb41f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb41f4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb41f8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb41fc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4200:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4204:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4208:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb420c:	540000c9	b.ls	0xfffff7fb4224  // b.plast
   0x0000fffff7fb4210:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4214:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4218:	f900166c	str	x12, [x19, #40]
   0x0000fffff7fb421c:	b900226d	str	w13, [x19, #32]
   0x0000fffff7fb4220:	1400000e	b	0xfffff7fb4258
   0x0000fffff7fb4224:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb4228:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb422c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4230:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4234:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7fb4238:	aa1403e4	mov	x4, x20
   0x0000fffff7fb423c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4240:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fb4244:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb4248:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb424c:	d63f0200	blr	x16
   0x0000fffff7fb4250:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4254:	5400b3a0	b.eq	0xfffff7fb58c8  // b.none
   0x0000fffff7fb4258:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb425c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4260:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4264:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4268:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7fb426c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4270:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4274:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb4278:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb427c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4280:	d63f0200	blr	x16
   0x0000fffff7fb4284:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4288:	5400b240	b.eq	0xfffff7fb58d0  // b.none
   0x0000fffff7fb428c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb4290:	37d806a9	tbnz	w9, #27, 0xfffff7fb4364
   0x0000fffff7fb4294:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb4298:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb429c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb42a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb42a4:	540001c1	b.ne	0xfffff7fb42dc  // b.any
   0x0000fffff7fb42a8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb42ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb42b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb42b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb42b8:	54000121	b.ne	0xfffff7fb42dc  // b.any
   0x0000fffff7fb42bc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb42c0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb42c4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb42c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb42cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb42d0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb42d4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb42d8:	14000030	b	0xfffff7fb4398
   0x0000fffff7fb42dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb42e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb42e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb42e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb42ec:	54000120	b.eq	0xfffff7fb4310  // b.none
   0x0000fffff7fb42f0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb42f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb42f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb42fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4300:	54000321	b.ne	0xfffff7fb4364  // b.any
   0x0000fffff7fb4304:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb4308:	9e620120	scvtf	d0, x9
   0x0000fffff7fb430c:	14000002	b	0xfffff7fb4314
   0x0000fffff7fb4310:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb4314:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb4318:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb431c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4320:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4324:	54000120	b.eq	0xfffff7fb4348  // b.none
   0x0000fffff7fb4328:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb432c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4330:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4334:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4338:	54000161	b.ne	0xfffff7fb4364  // b.any
   0x0000fffff7fb433c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb4340:	9e620121	scvtf	d1, x9
   0x0000fffff7fb4344:	14000002	b	0xfffff7fb434c
   0x0000fffff7fb4348:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb434c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb4350:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb4354:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4358:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb435c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb4360:	17ffffde	b	0xfffff7fb42d8
   0x0000fffff7fb4364:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb4368:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb436c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4370:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4374:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fb4378:	aa1403e4	mov	x4, x20
   0x0000fffff7fb437c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4380:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb4384:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb4388:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb438c:	d63f0200	blr	x16
   0x0000fffff7fb4390:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4394:	5400aa20	b.eq	0xfffff7fb58d8  // b.none
   0x0000fffff7fb4398:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb439c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb43a0:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb43a4:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb43a8:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb43ac:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb43b0:	36d801d1	tbz	w17, #27, 0xfffff7fb43e8
   0x0000fffff7fb43b4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb43b8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb43bc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb43c0:	54000281	b.ne	0xfffff7fb4410  // b.any
   0x0000fffff7fb43c4:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb43c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb43cc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb43d0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb43d4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb43d8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb43dc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb43e0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb43e4:	54000169	b.ls	0xfffff7fb4410  // b.plast
   0x0000fffff7fb43e8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb43ec:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb43f0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb43f4:	36d80091	tbz	w17, #27, 0xfffff7fb4404
   0x0000fffff7fb43f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb43fc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4400:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4404:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb4408:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb440c:	1400000e	b	0xfffff7fb4444
   0x0000fffff7fb4410:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb4414:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4418:	aa1303e1	mov	x1, x19
   0x0000fffff7fb441c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4420:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fb4424:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4428:	aa1603e5	mov	x5, x22
   0x0000fffff7fb442c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb4430:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb4434:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4438:	d63f0200	blr	x16
   0x0000fffff7fb443c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4440:	5400a500	b.eq	0xfffff7fb58e0  // b.none
   0x0000fffff7fb4444:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb4448:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb444c:	540003a0	b.eq	0xfffff7fb44c0  // b.none
   0x0000fffff7fb4450:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb4454:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb4458:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb445c:	36d801d1	tbz	w17, #27, 0xfffff7fb4494
   0x0000fffff7fb4460:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb4464:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4468:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb446c:	540002a1	b.ne	0xfffff7fb44c0  // b.any
   0x0000fffff7fb4470:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb4474:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4478:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb447c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4480:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4484:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4488:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb448c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4490:	54000189	b.ls	0xfffff7fb44c0  // b.plast
   0x0000fffff7fb4494:	36d8008d	tbz	w13, #27, 0xfffff7fb44a4
   0x0000fffff7fb4498:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb449c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb44a0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb44a4:	36d80091	tbz	w17, #27, 0xfffff7fb44b4
   0x0000fffff7fb44a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb44ac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb44b0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb44b4:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb44b8:	b900016d	str	w13, [x11]
   0x0000fffff7fb44bc:	1400000e	b	0xfffff7fb44f4
   0x0000fffff7fb44c0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb44c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb44c8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb44cc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb44d0:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fb44d4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb44d8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb44dc:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb44e0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb44e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb44e8:	d63f0200	blr	x16
   0x0000fffff7fb44ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb44f0:	54009fc0	b.eq	0xfffff7fb58e8  // b.none
   0x0000fffff7fb44f4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb44f8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb44fc:	540004a0	b.eq	0xfffff7fb4590  // b.none
   0x0000fffff7fb4500:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb4504:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb4508:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb450c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb4510:	54000400	b.eq	0xfffff7fb4590  // b.none
   0x0000fffff7fb4514:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb4518:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb451c:	36d801d1	tbz	w17, #27, 0xfffff7fb4554
   0x0000fffff7fb4520:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb4524:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4528:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb452c:	54000321	b.ne	0xfffff7fb4590  // b.any
   0x0000fffff7fb4530:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb4534:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4538:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb453c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4540:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4544:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4548:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb454c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4550:	54000209	b.ls	0xfffff7fb4590  // b.plast
   0x0000fffff7fb4554:	36d8008d	tbz	w13, #27, 0xfffff7fb4564
   0x0000fffff7fb4558:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb455c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4560:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb4564:	36d80091	tbz	w17, #27, 0xfffff7fb4574
   0x0000fffff7fb4568:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb456c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4570:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4574:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb4578:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb457c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb4580:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb4584:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb4588:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb458c:	1400000e	b	0xfffff7fb45c4
   0x0000fffff7fb4590:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb4594:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4598:	aa1303e1	mov	x1, x19
   0x0000fffff7fb459c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb45a0:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fb45a4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb45a8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb45ac:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb45b0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb45b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb45b8:	d63f0200	blr	x16
   0x0000fffff7fb45bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb45c0:	54009980	b.eq	0xfffff7fb58f0  // b.none
   0x0000fffff7fb45c4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb45c8:	37d806a9	tbnz	w9, #27, 0xfffff7fb469c
   0x0000fffff7fb45cc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb45d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb45d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb45d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb45dc:	540001c1	b.ne	0xfffff7fb4614  // b.any
   0x0000fffff7fb45e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb45e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb45e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb45ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb45f0:	54000121	b.ne	0xfffff7fb4614  // b.any
   0x0000fffff7fb45f4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb45f8:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb45fc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb4600:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4604:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4608:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb460c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb4610:	14000030	b	0xfffff7fb46d0
   0x0000fffff7fb4614:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb4618:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb461c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4620:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4624:	54000120	b.eq	0xfffff7fb4648  // b.none
   0x0000fffff7fb4628:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb462c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4630:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4634:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4638:	54000321	b.ne	0xfffff7fb469c  // b.any
   0x0000fffff7fb463c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb4640:	9e620120	scvtf	d0, x9
   0x0000fffff7fb4644:	14000002	b	0xfffff7fb464c
   0x0000fffff7fb4648:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb464c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb4650:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4654:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4658:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb465c:	54000120	b.eq	0xfffff7fb4680  // b.none
   0x0000fffff7fb4660:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb4664:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4668:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb466c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4670:	54000161	b.ne	0xfffff7fb469c  // b.any
   0x0000fffff7fb4674:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb4678:	9e620121	scvtf	d1, x9
   0x0000fffff7fb467c:	14000002	b	0xfffff7fb4684
   0x0000fffff7fb4680:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb4684:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb4688:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb468c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4690:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4694:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb4698:	17ffffde	b	0xfffff7fb4610
   0x0000fffff7fb469c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb46a0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb46a4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb46a8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb46ac:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fb46b0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb46b4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb46b8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb46bc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb46c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb46c4:	d63f0200	blr	x16
   0x0000fffff7fb46c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb46cc:	54009160	b.eq	0xfffff7fb58f8  // b.none
   0x0000fffff7fb46d0:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb46d4:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb46d8:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb46dc:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb46e0:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb46e4:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb46e8:	36d801d1	tbz	w17, #27, 0xfffff7fb4720
   0x0000fffff7fb46ec:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb46f0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb46f4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb46f8:	54000281	b.ne	0xfffff7fb4748  // b.any
   0x0000fffff7fb46fc:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb4700:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4704:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4708:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb470c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4710:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4714:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4718:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb471c:	54000169	b.ls	0xfffff7fb4748  // b.plast
   0x0000fffff7fb4720:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb4724:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4728:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb472c:	36d80091	tbz	w17, #27, 0xfffff7fb473c
   0x0000fffff7fb4730:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4734:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4738:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb473c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb4740:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb4744:	1400000e	b	0xfffff7fb477c
   0x0000fffff7fb4748:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb474c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4750:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4754:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4758:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fb475c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4760:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4764:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb4768:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb476c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4770:	d63f0200	blr	x16
   0x0000fffff7fb4774:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4778:	54008c40	b.eq	0xfffff7fb5900  // b.none
   0x0000fffff7fb477c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb4780:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb4784:	540003a0	b.eq	0xfffff7fb47f8  // b.none
   0x0000fffff7fb4788:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb478c:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb4790:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb4794:	36d801d1	tbz	w17, #27, 0xfffff7fb47cc
   0x0000fffff7fb4798:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb479c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb47a0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb47a4:	540002a1	b.ne	0xfffff7fb47f8  // b.any
   0x0000fffff7fb47a8:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb47ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb47b0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb47b4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb47b8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb47bc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb47c0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb47c4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb47c8:	54000189	b.ls	0xfffff7fb47f8  // b.plast
   0x0000fffff7fb47cc:	36d8008d	tbz	w13, #27, 0xfffff7fb47dc
   0x0000fffff7fb47d0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb47d4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb47d8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb47dc:	36d80091	tbz	w17, #27, 0xfffff7fb47ec
   0x0000fffff7fb47e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb47e4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb47e8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb47ec:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb47f0:	b900016d	str	w13, [x11]
   0x0000fffff7fb47f4:	1400000e	b	0xfffff7fb482c
   0x0000fffff7fb47f8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb47fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4800:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4804:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4808:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fb480c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4810:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4814:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb4818:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb481c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4820:	d63f0200	blr	x16
   0x0000fffff7fb4824:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4828:	54008700	b.eq	0xfffff7fb5908  // b.none
   0x0000fffff7fb482c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb4830:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb4834:	540004a0	b.eq	0xfffff7fb48c8  // b.none
   0x0000fffff7fb4838:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb483c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb4840:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb4844:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb4848:	54000400	b.eq	0xfffff7fb48c8  // b.none
   0x0000fffff7fb484c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb4850:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb4854:	36d801d1	tbz	w17, #27, 0xfffff7fb488c
   0x0000fffff7fb4858:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb485c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4860:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4864:	54000321	b.ne	0xfffff7fb48c8  // b.any
   0x0000fffff7fb4868:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb486c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4870:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4874:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4878:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb487c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4880:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4884:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4888:	54000209	b.ls	0xfffff7fb48c8  // b.plast
   0x0000fffff7fb488c:	36d8008d	tbz	w13, #27, 0xfffff7fb489c
   0x0000fffff7fb4890:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb4894:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4898:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb489c:	36d80091	tbz	w17, #27, 0xfffff7fb48ac
   0x0000fffff7fb48a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb48a4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb48a8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb48ac:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb48b0:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb48b4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb48b8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb48bc:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb48c0:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb48c4:	1400000e	b	0xfffff7fb48fc
   0x0000fffff7fb48c8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb48cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb48d0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb48d4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb48d8:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fb48dc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb48e0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb48e4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb48e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb48ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb48f0:	d63f0200	blr	x16
   0x0000fffff7fb48f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb48f8:	540080c0	b.eq	0xfffff7fb5910  // b.none
   0x0000fffff7fb48fc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb4900:	37d806a9	tbnz	w9, #27, 0xfffff7fb49d4
   0x0000fffff7fb4904:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb4908:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb490c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4910:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4914:	540001c1	b.ne	0xfffff7fb494c  // b.any
   0x0000fffff7fb4918:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb491c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4920:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4924:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4928:	54000121	b.ne	0xfffff7fb494c  // b.any
   0x0000fffff7fb492c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb4930:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb4934:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb4938:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb493c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4940:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb4944:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb4948:	14000030	b	0xfffff7fb4a08
   0x0000fffff7fb494c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb4950:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4954:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4958:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb495c:	54000120	b.eq	0xfffff7fb4980  // b.none
   0x0000fffff7fb4960:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb4964:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4968:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb496c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4970:	54000321	b.ne	0xfffff7fb49d4  // b.any
   0x0000fffff7fb4974:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb4978:	9e620120	scvtf	d0, x9
   0x0000fffff7fb497c:	14000002	b	0xfffff7fb4984
   0x0000fffff7fb4980:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb4984:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb4988:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb498c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4990:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4994:	54000120	b.eq	0xfffff7fb49b8  // b.none
   0x0000fffff7fb4998:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb499c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb49a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb49a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb49a8:	54000161	b.ne	0xfffff7fb49d4  // b.any
   0x0000fffff7fb49ac:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb49b0:	9e620121	scvtf	d1, x9
   0x0000fffff7fb49b4:	14000002	b	0xfffff7fb49bc
   0x0000fffff7fb49b8:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb49bc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb49c0:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb49c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb49c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb49cc:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb49d0:	17ffffde	b	0xfffff7fb4948
   0x0000fffff7fb49d4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb49d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb49dc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb49e0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb49e4:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fb49e8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb49ec:	aa1603e5	mov	x5, x22
   0x0000fffff7fb49f0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb49f4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb49f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb49fc:	d63f0200	blr	x16
   0x0000fffff7fb4a00:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4a04:	540078a0	b.eq	0xfffff7fb5918  // b.none
   0x0000fffff7fb4a08:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb4a0c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb4a10:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb4a14:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb4a18:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb4a1c:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb4a20:	36d801d1	tbz	w17, #27, 0xfffff7fb4a58
   0x0000fffff7fb4a24:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb4a28:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4a2c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4a30:	54000281	b.ne	0xfffff7fb4a80  // b.any
   0x0000fffff7fb4a34:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb4a38:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4a3c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4a40:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4a44:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4a48:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4a4c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4a50:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4a54:	54000169	b.ls	0xfffff7fb4a80  // b.plast
   0x0000fffff7fb4a58:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb4a5c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4a60:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb4a64:	36d80091	tbz	w17, #27, 0xfffff7fb4a74
   0x0000fffff7fb4a68:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4a6c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4a70:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4a74:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb4a78:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb4a7c:	1400000e	b	0xfffff7fb4ab4
   0x0000fffff7fb4a80:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb4a84:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4a88:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4a8c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4a90:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fb4a94:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4a98:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4a9c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb4aa0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb4aa4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4aa8:	d63f0200	blr	x16
   0x0000fffff7fb4aac:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4ab0:	54007380	b.eq	0xfffff7fb5920  // b.none
   0x0000fffff7fb4ab4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb4ab8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb4abc:	540003a0	b.eq	0xfffff7fb4b30  // b.none
   0x0000fffff7fb4ac0:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb4ac4:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb4ac8:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb4acc:	36d801d1	tbz	w17, #27, 0xfffff7fb4b04
   0x0000fffff7fb4ad0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb4ad4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4ad8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4adc:	540002a1	b.ne	0xfffff7fb4b30  // b.any
   0x0000fffff7fb4ae0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb4ae4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4ae8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4aec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4af0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4af4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4af8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4afc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4b00:	54000189	b.ls	0xfffff7fb4b30  // b.plast
   0x0000fffff7fb4b04:	36d8008d	tbz	w13, #27, 0xfffff7fb4b14
   0x0000fffff7fb4b08:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb4b0c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4b10:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb4b14:	36d80091	tbz	w17, #27, 0xfffff7fb4b24
   0x0000fffff7fb4b18:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4b1c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4b20:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4b24:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb4b28:	b900016d	str	w13, [x11]
   0x0000fffff7fb4b2c:	1400000e	b	0xfffff7fb4b64
   0x0000fffff7fb4b30:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb4b34:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4b38:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4b3c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4b40:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fb4b44:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4b48:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4b4c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb4b50:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb4b54:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4b58:	d63f0200	blr	x16
   0x0000fffff7fb4b5c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4b60:	54006e40	b.eq	0xfffff7fb5928  // b.none
   0x0000fffff7fb4b64:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb4b68:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb4b6c:	540004a0	b.eq	0xfffff7fb4c00  // b.none
   0x0000fffff7fb4b70:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb4b74:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb4b78:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb4b7c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb4b80:	54000400	b.eq	0xfffff7fb4c00  // b.none
   0x0000fffff7fb4b84:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb4b88:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb4b8c:	36d801d1	tbz	w17, #27, 0xfffff7fb4bc4
   0x0000fffff7fb4b90:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb4b94:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4b98:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4b9c:	54000321	b.ne	0xfffff7fb4c00  // b.any
   0x0000fffff7fb4ba0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb4ba4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4ba8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4bac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4bb0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4bb4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4bb8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4bbc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4bc0:	54000209	b.ls	0xfffff7fb4c00  // b.plast
   0x0000fffff7fb4bc4:	36d8008d	tbz	w13, #27, 0xfffff7fb4bd4
   0x0000fffff7fb4bc8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb4bcc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4bd0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb4bd4:	36d80091	tbz	w17, #27, 0xfffff7fb4be4
   0x0000fffff7fb4bd8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4bdc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4be0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4be4:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb4be8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb4bec:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb4bf0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb4bf4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb4bf8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb4bfc:	1400000e	b	0xfffff7fb4c34
   0x0000fffff7fb4c00:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb4c04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4c08:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4c0c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4c10:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fb4c14:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4c18:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4c1c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb4c20:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb4c24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4c28:	d63f0200	blr	x16
   0x0000fffff7fb4c2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4c30:	54006800	b.eq	0xfffff7fb5930  // b.none
   0x0000fffff7fb4c34:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb4c38:	37d806a9	tbnz	w9, #27, 0xfffff7fb4d0c
   0x0000fffff7fb4c3c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb4c40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4c44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4c48:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4c4c:	540001c1	b.ne	0xfffff7fb4c84  // b.any
   0x0000fffff7fb4c50:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb4c54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4c58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4c5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4c60:	54000121	b.ne	0xfffff7fb4c84  // b.any
   0x0000fffff7fb4c64:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb4c68:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb4c6c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb4c70:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4c74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4c78:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb4c7c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb4c80:	14000030	b	0xfffff7fb4d40
   0x0000fffff7fb4c84:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb4c88:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4c8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4c90:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4c94:	54000120	b.eq	0xfffff7fb4cb8  // b.none
   0x0000fffff7fb4c98:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb4c9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4ca0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4ca4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4ca8:	54000321	b.ne	0xfffff7fb4d0c  // b.any
   0x0000fffff7fb4cac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb4cb0:	9e620120	scvtf	d0, x9
   0x0000fffff7fb4cb4:	14000002	b	0xfffff7fb4cbc
   0x0000fffff7fb4cb8:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb4cbc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb4cc0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4cc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4cc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4ccc:	54000120	b.eq	0xfffff7fb4cf0  // b.none
   0x0000fffff7fb4cd0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb4cd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4cd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4cdc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4ce0:	54000161	b.ne	0xfffff7fb4d0c  // b.any
   0x0000fffff7fb4ce4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb4ce8:	9e620121	scvtf	d1, x9
   0x0000fffff7fb4cec:	14000002	b	0xfffff7fb4cf4
   0x0000fffff7fb4cf0:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb4cf4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb4cf8:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb4cfc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4d00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4d04:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb4d08:	17ffffde	b	0xfffff7fb4c80
   0x0000fffff7fb4d0c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb4d10:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4d14:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4d18:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4d1c:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fb4d20:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4d24:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4d28:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb4d2c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb4d30:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4d34:	d63f0200	blr	x16
   0x0000fffff7fb4d38:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4d3c:	54005fe0	b.eq	0xfffff7fb5938  // b.none
   0x0000fffff7fb4d40:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb4d44:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb4d48:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb4d4c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb4d50:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb4d54:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb4d58:	36d801d1	tbz	w17, #27, 0xfffff7fb4d90
   0x0000fffff7fb4d5c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb4d60:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4d64:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4d68:	54000281	b.ne	0xfffff7fb4db8  // b.any
   0x0000fffff7fb4d6c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb4d70:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4d74:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4d78:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4d7c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4d80:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4d84:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4d88:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4d8c:	54000169	b.ls	0xfffff7fb4db8  // b.plast
   0x0000fffff7fb4d90:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb4d94:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4d98:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb4d9c:	36d80091	tbz	w17, #27, 0xfffff7fb4dac
   0x0000fffff7fb4da0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4da4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4da8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4dac:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb4db0:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb4db4:	1400000e	b	0xfffff7fb4dec
   0x0000fffff7fb4db8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb4dbc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4dc0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4dc4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4dc8:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fb4dcc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4dd0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4dd4:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb4dd8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb4ddc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4de0:	d63f0200	blr	x16
   0x0000fffff7fb4de4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4de8:	54005ac0	b.eq	0xfffff7fb5940  // b.none
   0x0000fffff7fb4dec:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb4df0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb4df4:	540003a0	b.eq	0xfffff7fb4e68  // b.none
   0x0000fffff7fb4df8:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb4dfc:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb4e00:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb4e04:	36d801d1	tbz	w17, #27, 0xfffff7fb4e3c
   0x0000fffff7fb4e08:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb4e0c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4e10:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4e14:	540002a1	b.ne	0xfffff7fb4e68  // b.any
   0x0000fffff7fb4e18:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb4e1c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4e20:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4e24:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4e28:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4e2c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4e30:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4e34:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4e38:	54000189	b.ls	0xfffff7fb4e68  // b.plast
   0x0000fffff7fb4e3c:	36d8008d	tbz	w13, #27, 0xfffff7fb4e4c
   0x0000fffff7fb4e40:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb4e44:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4e48:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb4e4c:	36d80091	tbz	w17, #27, 0xfffff7fb4e5c
   0x0000fffff7fb4e50:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4e54:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4e58:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4e5c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb4e60:	b900016d	str	w13, [x11]
   0x0000fffff7fb4e64:	1400000e	b	0xfffff7fb4e9c
   0x0000fffff7fb4e68:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb4e6c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4e70:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4e74:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4e78:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fb4e7c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4e80:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4e84:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb4e88:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb4e8c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4e90:	d63f0200	blr	x16
   0x0000fffff7fb4e94:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4e98:	54005580	b.eq	0xfffff7fb5948  // b.none
   0x0000fffff7fb4e9c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb4ea0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb4ea4:	540004a0	b.eq	0xfffff7fb4f38  // b.none
   0x0000fffff7fb4ea8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb4eac:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb4eb0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb4eb4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb4eb8:	54000400	b.eq	0xfffff7fb4f38  // b.none
   0x0000fffff7fb4ebc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb4ec0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb4ec4:	36d801d1	tbz	w17, #27, 0xfffff7fb4efc
   0x0000fffff7fb4ec8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb4ecc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4ed0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4ed4:	54000321	b.ne	0xfffff7fb4f38  // b.any
   0x0000fffff7fb4ed8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb4edc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4ee0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4ee4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4ee8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4eec:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4ef0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4ef4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4ef8:	54000209	b.ls	0xfffff7fb4f38  // b.plast
   0x0000fffff7fb4efc:	36d8008d	tbz	w13, #27, 0xfffff7fb4f0c
   0x0000fffff7fb4f00:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb4f04:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4f08:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb4f0c:	36d80091	tbz	w17, #27, 0xfffff7fb4f1c
   0x0000fffff7fb4f10:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4f14:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4f18:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4f1c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb4f20:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb4f24:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb4f28:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb4f2c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb4f30:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb4f34:	1400000e	b	0xfffff7fb4f6c
   0x0000fffff7fb4f38:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb4f3c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4f40:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4f44:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4f48:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fb4f4c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4f50:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4f54:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb4f58:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb4f5c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4f60:	d63f0200	blr	x16
   0x0000fffff7fb4f64:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4f68:	54004f40	b.eq	0xfffff7fb5950  // b.none
   0x0000fffff7fb4f6c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb4f70:	37d806a9	tbnz	w9, #27, 0xfffff7fb5044
   0x0000fffff7fb4f74:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb4f78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4f7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4f80:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4f84:	540001c1	b.ne	0xfffff7fb4fbc  // b.any
   0x0000fffff7fb4f88:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb4f8c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4f90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4f94:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4f98:	54000121	b.ne	0xfffff7fb4fbc  // b.any
   0x0000fffff7fb4f9c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb4fa0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb4fa4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb4fa8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4fac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4fb0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb4fb4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb4fb8:	14000030	b	0xfffff7fb5078
   0x0000fffff7fb4fbc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb4fc0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4fc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4fc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4fcc:	54000120	b.eq	0xfffff7fb4ff0  // b.none
   0x0000fffff7fb4fd0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb4fd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4fd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4fdc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4fe0:	54000321	b.ne	0xfffff7fb5044  // b.any
   0x0000fffff7fb4fe4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb4fe8:	9e620120	scvtf	d0, x9
   0x0000fffff7fb4fec:	14000002	b	0xfffff7fb4ff4
   0x0000fffff7fb4ff0:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb4ff4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb4ff8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4ffc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5000:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5004:	54000120	b.eq	0xfffff7fb5028  // b.none
   0x0000fffff7fb5008:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb500c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5010:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5014:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5018:	54000161	b.ne	0xfffff7fb5044  // b.any
   0x0000fffff7fb501c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb5020:	9e620121	scvtf	d1, x9
   0x0000fffff7fb5024:	14000002	b	0xfffff7fb502c
   0x0000fffff7fb5028:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb502c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb5030:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb5034:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb5038:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb503c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb5040:	17ffffde	b	0xfffff7fb4fb8
   0x0000fffff7fb5044:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb5048:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb504c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb5050:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5054:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fb5058:	aa1403e4	mov	x4, x20
   0x0000fffff7fb505c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb5060:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb5064:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb5068:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb506c:	d63f0200	blr	x16
   0x0000fffff7fb5070:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb5074:	54004720	b.eq	0xfffff7fb5958  // b.none
   0x0000fffff7fb5078:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb507c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb5080:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb5084:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb5088:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb508c:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb5090:	36d801d1	tbz	w17, #27, 0xfffff7fb50c8
   0x0000fffff7fb5094:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb5098:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb509c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb50a0:	54000281	b.ne	0xfffff7fb50f0  // b.any
   0x0000fffff7fb50a4:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb50a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb50ac:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb50b0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb50b4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb50b8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb50bc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb50c0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb50c4:	54000169	b.ls	0xfffff7fb50f0  // b.plast
   0x0000fffff7fb50c8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb50cc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb50d0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb50d4:	36d80091	tbz	w17, #27, 0xfffff7fb50e4
   0x0000fffff7fb50d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb50dc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb50e0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb50e4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb50e8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb50ec:	1400000e	b	0xfffff7fb5124
   0x0000fffff7fb50f0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb50f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb50f8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb50fc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5100:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fb5104:	aa1403e4	mov	x4, x20
   0x0000fffff7fb5108:	aa1603e5	mov	x5, x22
   0x0000fffff7fb510c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb5110:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb5114:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb5118:	d63f0200	blr	x16
   0x0000fffff7fb511c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb5120:	54004200	b.eq	0xfffff7fb5960  // b.none
   0x0000fffff7fb5124:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb5128:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb512c:	540003a0	b.eq	0xfffff7fb51a0  // b.none
   0x0000fffff7fb5130:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb5134:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb5138:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb513c:	36d801d1	tbz	w17, #27, 0xfffff7fb5174
   0x0000fffff7fb5140:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb5144:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb5148:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb514c:	540002a1	b.ne	0xfffff7fb51a0  // b.any
   0x0000fffff7fb5150:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb5154:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb5158:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb515c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb5160:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb5164:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb5168:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb516c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb5170:	54000189	b.ls	0xfffff7fb51a0  // b.plast
   0x0000fffff7fb5174:	36d8008d	tbz	w13, #27, 0xfffff7fb5184
   0x0000fffff7fb5178:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb517c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb5180:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb5184:	36d80091	tbz	w17, #27, 0xfffff7fb5194
   0x0000fffff7fb5188:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb518c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb5190:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb5194:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb5198:	b900016d	str	w13, [x11]
   0x0000fffff7fb519c:	1400000e	b	0xfffff7fb51d4
   0x0000fffff7fb51a0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb51a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb51a8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb51ac:	aa1503e2	mov	x2, x21
   0x0000fffff7fb51b0:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fb51b4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb51b8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb51bc:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb51c0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb51c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb51c8:	d63f0200	blr	x16
   0x0000fffff7fb51cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb51d0:	54003cc0	b.eq	0xfffff7fb5968  // b.none
   0x0000fffff7fb51d4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb51d8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb51dc:	540004a0	b.eq	0xfffff7fb5270  // b.none
   0x0000fffff7fb51e0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb51e4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb51e8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb51ec:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb51f0:	54000400	b.eq	0xfffff7fb5270  // b.none
   0x0000fffff7fb51f4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb51f8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb51fc:	36d801d1	tbz	w17, #27, 0xfffff7fb5234
   0x0000fffff7fb5200:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb5204:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb5208:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb520c:	54000321	b.ne	0xfffff7fb5270  // b.any
   0x0000fffff7fb5210:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb5214:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb5218:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb521c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb5220:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb5224:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb5228:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb522c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb5230:	54000209	b.ls	0xfffff7fb5270  // b.plast
   0x0000fffff7fb5234:	36d8008d	tbz	w13, #27, 0xfffff7fb5244
   0x0000fffff7fb5238:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb523c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb5240:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb5244:	36d80091	tbz	w17, #27, 0xfffff7fb5254
   0x0000fffff7fb5248:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb524c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb5250:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb5254:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb5258:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb525c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb5260:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb5264:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb5268:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb526c:	1400000e	b	0xfffff7fb52a4
   0x0000fffff7fb5270:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb5274:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb5278:	aa1303e1	mov	x1, x19
   0x0000fffff7fb527c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5280:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fb5284:	aa1403e4	mov	x4, x20
   0x0000fffff7fb5288:	aa1603e5	mov	x5, x22
   0x0000fffff7fb528c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb5290:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb5294:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb5298:	d63f0200	blr	x16
   0x0000fffff7fb529c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb52a0:	54003680	b.eq	0xfffff7fb5970  // b.none
   0x0000fffff7fb52a4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb52a8:	37d806a9	tbnz	w9, #27, 0xfffff7fb537c
   0x0000fffff7fb52ac:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb52b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb52b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb52b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb52bc:	540001c1	b.ne	0xfffff7fb52f4  // b.any
   0x0000fffff7fb52c0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb52c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb52c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb52cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb52d0:	54000121	b.ne	0xfffff7fb52f4  // b.any
   0x0000fffff7fb52d4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb52d8:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb52dc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb52e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb52e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb52e8:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb52ec:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb52f0:	14000030	b	0xfffff7fb53b0
   0x0000fffff7fb52f4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb52f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb52fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5300:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5304:	54000120	b.eq	0xfffff7fb5328  // b.none
   0x0000fffff7fb5308:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb530c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5310:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5314:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5318:	54000321	b.ne	0xfffff7fb537c  // b.any
   0x0000fffff7fb531c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb5320:	9e620120	scvtf	d0, x9
   0x0000fffff7fb5324:	14000002	b	0xfffff7fb532c
   0x0000fffff7fb5328:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb532c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb5330:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb5334:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5338:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb533c:	54000120	b.eq	0xfffff7fb5360  // b.none
   0x0000fffff7fb5340:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb5344:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5348:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb534c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5350:	54000161	b.ne	0xfffff7fb537c  // b.any
   0x0000fffff7fb5354:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb5358:	9e620121	scvtf	d1, x9
   0x0000fffff7fb535c:	14000002	b	0xfffff7fb5364
   0x0000fffff7fb5360:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb5364:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb5368:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb536c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb5370:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5374:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb5378:	17ffffde	b	0xfffff7fb52f0
   0x0000fffff7fb537c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb5380:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb5384:	aa1303e1	mov	x1, x19
   0x0000fffff7fb5388:	aa1503e2	mov	x2, x21
   0x0000fffff7fb538c:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fb5390:	aa1403e4	mov	x4, x20
   0x0000fffff7fb5394:	aa1603e5	mov	x5, x22
   0x0000fffff7fb5398:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb539c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb53a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb53a4:	d63f0200	blr	x16
   0x0000fffff7fb53a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb53ac:	54002e60	b.eq	0xfffff7fb5978  // b.none
   0x0000fffff7fb53b0:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb53b4:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb53b8:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb53bc:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb53c0:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb53c4:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb53c8:	36d801d1	tbz	w17, #27, 0xfffff7fb5400
   0x0000fffff7fb53cc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb53d0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb53d4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb53d8:	54000281	b.ne	0xfffff7fb5428  // b.any
   0x0000fffff7fb53dc:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb53e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb53e4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb53e8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb53ec:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb53f0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb53f4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb53f8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb53fc:	54000169	b.ls	0xfffff7fb5428  // b.plast
   0x0000fffff7fb5400:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb5404:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb5408:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb540c:	36d80091	tbz	w17, #27, 0xfffff7fb541c
   0x0000fffff7fb5410:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb5414:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb5418:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb541c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb5420:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb5424:	1400000e	b	0xfffff7fb545c
   0x0000fffff7fb5428:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb542c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb5430:	aa1303e1	mov	x1, x19
   0x0000fffff7fb5434:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5438:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fb543c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb5440:	aa1603e5	mov	x5, x22
   0x0000fffff7fb5444:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb5448:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb544c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb5450:	d63f0200	blr	x16
   0x0000fffff7fb5454:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb5458:	54002940	b.eq	0xfffff7fb5980  // b.none
   0x0000fffff7fb545c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb5460:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb5464:	540003a0	b.eq	0xfffff7fb54d8  // b.none
   0x0000fffff7fb5468:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb546c:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb5470:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb5474:	36d801d1	tbz	w17, #27, 0xfffff7fb54ac
   0x0000fffff7fb5478:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb547c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb5480:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb5484:	540002a1	b.ne	0xfffff7fb54d8  // b.any
   0x0000fffff7fb5488:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb548c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb5490:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb5494:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb5498:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb549c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb54a0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb54a4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb54a8:	54000189	b.ls	0xfffff7fb54d8  // b.plast
   0x0000fffff7fb54ac:	36d8008d	tbz	w13, #27, 0xfffff7fb54bc
   0x0000fffff7fb54b0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb54b4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb54b8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb54bc:	36d80091	tbz	w17, #27, 0xfffff7fb54cc
   0x0000fffff7fb54c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb54c4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb54c8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb54cc:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb54d0:	b900016d	str	w13, [x11]
   0x0000fffff7fb54d4:	1400000e	b	0xfffff7fb550c
   0x0000fffff7fb54d8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb54dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb54e0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb54e4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb54e8:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fb54ec:	aa1403e4	mov	x4, x20
   0x0000fffff7fb54f0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb54f4:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb54f8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb54fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb5500:	d63f0200	blr	x16
   0x0000fffff7fb5504:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb5508:	54002400	b.eq	0xfffff7fb5988  // b.none
   0x0000fffff7fb550c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb5510:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb5514:	540004a0	b.eq	0xfffff7fb55a8  // b.none
   0x0000fffff7fb5518:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb551c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb5520:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb5524:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb5528:	54000400	b.eq	0xfffff7fb55a8  // b.none
   0x0000fffff7fb552c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb5530:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb5534:	36d801d1	tbz	w17, #27, 0xfffff7fb556c
   0x0000fffff7fb5538:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb553c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb5540:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb5544:	54000321	b.ne	0xfffff7fb55a8  // b.any
   0x0000fffff7fb5548:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb554c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb5550:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb5554:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb5558:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb555c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb5560:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb5564:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb5568:	54000209	b.ls	0xfffff7fb55a8  // b.plast
   0x0000fffff7fb556c:	36d8008d	tbz	w13, #27, 0xfffff7fb557c
   0x0000fffff7fb5570:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb5574:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb5578:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb557c:	36d80091	tbz	w17, #27, 0xfffff7fb558c
   0x0000fffff7fb5580:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb5584:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb5588:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb558c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb5590:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb5594:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb5598:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb559c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb55a0:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb55a4:	1400000e	b	0xfffff7fb55dc
   0x0000fffff7fb55a8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb55ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb55b0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb55b4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb55b8:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fb55bc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb55c0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb55c4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb55c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb55cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb55d0:	d63f0200	blr	x16
   0x0000fffff7fb55d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb55d8:	54001dc0	b.eq	0xfffff7fb5990  // b.none
   0x0000fffff7fb55dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb55e0:	37d806a9	tbnz	w9, #27, 0xfffff7fb56b4
   0x0000fffff7fb55e4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb55e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb55ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb55f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb55f4:	540001c1	b.ne	0xfffff7fb562c  // b.any
   0x0000fffff7fb55f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb55fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5600:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5604:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5608:	54000121	b.ne	0xfffff7fb562c  // b.any
   0x0000fffff7fb560c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb5610:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb5614:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb5618:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb561c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5620:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb5624:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb5628:	14000030	b	0xfffff7fb56e8
   0x0000fffff7fb562c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb5630:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb5634:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5638:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb563c:	54000120	b.eq	0xfffff7fb5660  // b.none
   0x0000fffff7fb5640:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb5644:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5648:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb564c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5650:	54000321	b.ne	0xfffff7fb56b4  // b.any
   0x0000fffff7fb5654:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb5658:	9e620120	scvtf	d0, x9
   0x0000fffff7fb565c:	14000002	b	0xfffff7fb5664
   0x0000fffff7fb5660:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb5664:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb5668:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb566c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5670:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5674:	54000120	b.eq	0xfffff7fb5698  // b.none
   0x0000fffff7fb5678:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb567c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb5680:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5684:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb5688:	54000161	b.ne	0xfffff7fb56b4  // b.any
   0x0000fffff7fb568c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb5690:	9e620121	scvtf	d1, x9
   0x0000fffff7fb5694:	14000002	b	0xfffff7fb569c
   0x0000fffff7fb5698:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb569c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb56a0:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb56a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb56a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb56ac:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb56b0:	17ffffde	b	0xfffff7fb5628
   0x0000fffff7fb56b4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb56b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb56bc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb56c0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb56c4:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fb56c8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb56cc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb56d0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb56d4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb56d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb56dc:	d63f0200	blr	x16
   0x0000fffff7fb56e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb56e4:	540015a0	b.eq	0xfffff7fb5998  // b.none
   0x0000fffff7fb56e8:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb56ec:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb56f0:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb56f4:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb56f8:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb56fc:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb5700:	36d801d1	tbz	w17, #27, 0xfffff7fb5738
   0x0000fffff7fb5704:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb5708:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb570c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb5710:	54000281	b.ne	0xfffff7fb5760  // b.any
   0x0000fffff7fb5714:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb5718:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb571c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb5720:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb5724:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb5728:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb572c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb5730:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb5734:	54000169	b.ls	0xfffff7fb5760  // b.plast
   0x0000fffff7fb5738:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb573c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb5740:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb5744:	36d80091	tbz	w17, #27, 0xfffff7fb5754
   0x0000fffff7fb5748:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb574c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb5750:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb5754:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb5758:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb575c:	1400000e	b	0xfffff7fb5794
   0x0000fffff7fb5760:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb5764:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb5768:	aa1303e1	mov	x1, x19
   0x0000fffff7fb576c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5770:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fb5774:	aa1403e4	mov	x4, x20
   0x0000fffff7fb5778:	aa1603e5	mov	x5, x22
   0x0000fffff7fb577c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb5780:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb5784:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb5788:	d63f0200	blr	x16
   0x0000fffff7fb578c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb5790:	54001080	b.eq	0xfffff7fb59a0  // b.none
   0x0000fffff7fb5794:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb5798:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb579c:	540003a0	b.eq	0xfffff7fb5810  // b.none
   0x0000fffff7fb57a0:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb57a4:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb57a8:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb57ac:	36d801d1	tbz	w17, #27, 0xfffff7fb57e4
   0x0000fffff7fb57b0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb57b4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb57b8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb57bc:	540002a1	b.ne	0xfffff7fb5810  // b.any
   0x0000fffff7fb57c0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb57c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb57c8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb57cc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb57d0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb57d4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb57d8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb57dc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb57e0:	54000189	b.ls	0xfffff7fb5810  // b.plast
   0x0000fffff7fb57e4:	36d8008d	tbz	w13, #27, 0xfffff7fb57f4
   0x0000fffff7fb57e8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb57ec:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb57f0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb57f4:	36d80091	tbz	w17, #27, 0xfffff7fb5804
   0x0000fffff7fb57f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb57fc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb5800:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb5804:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb5808:	b900016d	str	w13, [x11]
   0x0000fffff7fb580c:	1400000e	b	0xfffff7fb5844
   0x0000fffff7fb5810:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb5814:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb5818:	aa1303e1	mov	x1, x19
   0x0000fffff7fb581c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5820:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fb5824:	aa1403e4	mov	x4, x20
   0x0000fffff7fb5828:	aa1603e5	mov	x5, x22
   0x0000fffff7fb582c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb5830:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb5834:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb5838:	d63f0200	blr	x16
   0x0000fffff7fb583c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb5840:	54000b40	b.eq	0xfffff7fb59a8  // b.none
   0x0000fffff7fb5844:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb5848:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb584c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb5850:	aa1503e2	mov	x2, x21
   0x0000fffff7fb5854:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fb5858:	aa1403e4	mov	x4, x20
   0x0000fffff7fb585c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb5860:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7fb5864:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb5868:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb586c:	d63f0200	blr	x16
   0x0000fffff7fb5870:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb5874:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb5878:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb587c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb5880:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fb5884:	d65f03c0	ret
   0x0000fffff7fb5888:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb588c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb5890:	b900028a	str	w10, [x20]
   0x0000fffff7fb5894:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fb5898:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb589c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb58a0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb58a4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb58a8:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fb58ac:	d65f03c0	ret
   0x0000fffff7fb58b0:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fb58b4:	17fffff5	b	0xfffff7fb5888
   0x0000fffff7fb58b8:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fb58bc:	17fffff3	b	0xfffff7fb5888
   0x0000fffff7fb58c0:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fb58c4:	17fffff1	b	0xfffff7fb5888
   0x0000fffff7fb58c8:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7fb58cc:	17ffffef	b	0xfffff7fb5888
   0x0000fffff7fb58d0:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7fb58d4:	17ffffed	b	0xfffff7fb5888
   0x0000fffff7fb58d8:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fb58dc:	17ffffeb	b	0xfffff7fb5888
   0x0000fffff7fb58e0:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fb58e4:	17ffffe9	b	0xfffff7fb5888
   0x0000fffff7fb58e8:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fb58ec:	17ffffe7	b	0xfffff7fb5888
   0x0000fffff7fb58f0:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fb58f4:	17ffffe5	b	0xfffff7fb5888
   0x0000fffff7fb58f8:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fb58fc:	17ffffe3	b	0xfffff7fb5888
   0x0000fffff7fb5900:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fb5904:	17ffffe1	b	0xfffff7fb5888
   0x0000fffff7fb5908:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fb590c:	17ffffdf	b	0xfffff7fb5888
   0x0000fffff7fb5910:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fb5914:	17ffffdd	b	0xfffff7fb5888
   0x0000fffff7fb5918:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fb591c:	17ffffdb	b	0xfffff7fb5888
   0x0000fffff7fb5920:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fb5924:	17ffffd9	b	0xfffff7fb5888
   0x0000fffff7fb5928:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fb592c:	17ffffd7	b	0xfffff7fb5888
   0x0000fffff7fb5930:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fb5934:	17ffffd5	b	0xfffff7fb5888
   0x0000fffff7fb5938:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fb593c:	17ffffd3	b	0xfffff7fb5888
   0x0000fffff7fb5940:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fb5944:	17ffffd1	b	0xfffff7fb5888
   0x0000fffff7fb5948:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fb594c:	17ffffcf	b	0xfffff7fb5888
   0x0000fffff7fb5950:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fb5954:	17ffffcd	b	0xfffff7fb5888
   0x0000fffff7fb5958:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fb595c:	17ffffcb	b	0xfffff7fb5888
   0x0000fffff7fb5960:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fb5964:	17ffffc9	b	0xfffff7fb5888
   0x0000fffff7fb5968:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fb596c:	17ffffc7	b	0xfffff7fb5888
   0x0000fffff7fb5970:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fb5974:	17ffffc5	b	0xfffff7fb5888
   0x0000fffff7fb5978:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fb597c:	17ffffc3	b	0xfffff7fb5888
   0x0000fffff7fb5980:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fb5984:	17ffffc1	b	0xfffff7fb5888
   0x0000fffff7fb5988:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fb598c:	17ffffbf	b	0xfffff7fb5888
   0x0000fffff7fb5990:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fb5994:	17ffffbd	b	0xfffff7fb5888
   0x0000fffff7fb5998:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fb599c:	17ffffbb	b	0xfffff7fb5888
   0x0000fffff7fb59a0:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fb59a4:	17ffffb9	b	0xfffff7fb5888
   0x0000fffff7fb59a8:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fb59ac:	17ffffb7	b	0xfffff7fb5888
   0x0000fffff7fb59b0:	00000000	udf	#0
   0x0000fffff7fb59b4:	00000000	udf	#0
   0x0000fffff7fb59b8:	00000000	udf	#0
   0x0000fffff7fb59bc:	00000000	udf	#0
   0x0000fffff7fb59c0:	00000000	udf	#0
   0x0000fffff7fb59c4:	00000000	udf	#0
   0x0000fffff7fb59c8:	00000000	udf	#0
   0x0000fffff7fb59cc:	00000000	udf	#0
   0x0000fffff7fb59d0:	00000000	udf	#0
   0x0000fffff7fb59d4:	00000000	udf	#0
   0x0000fffff7fb59d8:	00000000	udf	#0
   0x0000fffff7fb59dc:	00000000	udf	#0
   0x0000fffff7fb59e0:	00000000	udf	#0
   0x0000fffff7fb59e4:	00000000	udf	#0
   0x0000fffff7fb59e8:	00000000	udf	#0
   0x0000fffff7fb59ec:	00000000	udf	#0
   0x0000fffff7fb59f0:	00000000	udf	#0
   0x0000fffff7fb59f4:	00000000	udf	#0
   0x0000fffff7fb59f8:	00000000	udf	#0
   0x0000fffff7fb59fc:	00000000	udf	#0
   0x0000fffff7fb5a00:	00000000	udf	#0
   0x0000fffff7fb5a04:	00000000	udf	#0
   0x0000fffff7fb5a08:	00000000	udf	#0
   0x0000fffff7fb5a0c:	00000000	udf	#0
   0x0000fffff7fb5a10:	00000000	udf	#0
   0x0000fffff7fb5a14:	00000000	udf	#0
   0x0000fffff7fb5a18:	00000000	udf	#0
   0x0000fffff7fb5a1c:	00000000	udf	#0
   0x0000fffff7fb5a20:	00000000	udf	#0
   0x0000fffff7fb5a24:	00000000	udf	#0
   0x0000fffff7fb5a28:	00000000	udf	#0
   0x0000fffff7fb5a2c:	00000000	udf	#0
   0x0000fffff7fb5a30:	00000000	udf	#0
   0x0000fffff7fb5a34:	00000000	udf	#0
   0x0000fffff7fb5a38:	00000000	udf	#0
   0x0000fffff7fb5a3c:	00000000	udf	#0
   0x0000fffff7fb5a40:	00000000	udf	#0
   0x0000fffff7fb5a44:	00000000	udf	#0
   0x0000fffff7fb5a48:	00000000	udf	#0
   0x0000fffff7fb5a4c:	00000000	udf	#0
   0x0000fffff7fb5a50:	00000000	udf	#0
   0x0000fffff7fb5a54:	00000000	udf	#0
   0x0000fffff7fb5a58:	00000000	udf	#0
   0x0000fffff7fb5a5c:	00000000	udf	#0
   0x0000fffff7fb5a60:	00000000	udf	#0
   0x0000fffff7fb5a64:	00000000	udf	#0
   0x0000fffff7fb5a68:	00000000	udf	#0
   0x0000fffff7fb5a6c:	00000000	udf	#0
   0x0000fffff7fb5a70:	00000000	udf	#0
   0x0000fffff7fb5a74:	00000000	udf	#0
   0x0000fffff7fb5a78:	00000000	udf	#0
   0x0000fffff7fb5a7c:	00000000	udf	#0
   0x0000fffff7fb5a80:	00000000	udf	#0
   0x0000fffff7fb5a84:	00000000	udf	#0
   0x0000fffff7fb5a88:	00000000	udf	#0
   0x0000fffff7fb5a8c:	00000000	udf	#0
   0x0000fffff7fb5a90:	00000000	udf	#0
   0x0000fffff7fb5a94:	00000000	udf	#0
   0x0000fffff7fb5a98:	00000000	udf	#0
   0x0000fffff7fb5a9c:	00000000	udf	#0
   0x0000fffff7fb5aa0:	00000000	udf	#0
   0x0000fffff7fb5aa4:	00000000	udf	#0
   0x0000fffff7fb5aa8:	00000000	udf	#0
   0x0000fffff7fb5aac:	00000000	udf	#0
   0x0000fffff7fb5ab0:	00000000	udf	#0
   0x0000fffff7fb5ab4:	00000000	udf	#0
   0x0000fffff7fb5ab8:	00000000	udf	#0
   0x0000fffff7fb5abc:	00000000	udf	#0
   0x0000fffff7fb5ac0:	00000000	udf	#0
   0x0000fffff7fb5ac4:	00000000	udf	#0
   0x0000fffff7fb5ac8:	00000000	udf	#0
   0x0000fffff7fb5acc:	00000000	udf	#0
   0x0000fffff7fb5ad0:	00000000	udf	#0
   0x0000fffff7fb5ad4:	00000000	udf	#0
   0x0000fffff7fb5ad8:	00000000	udf	#0
   0x0000fffff7fb5adc:	00000000	udf	#0
   0x0000fffff7fb5ae0:	00000000	udf	#0
   0x0000fffff7fb5ae4:	00000000	udf	#0
   0x0000fffff7fb5ae8:	00000000	udf	#0
   0x0000fffff7fb5aec:	00000000	udf	#0
   0x0000fffff7fb5af0:	00000000	udf	#0
   0x0000fffff7fb5af4:	00000000	udf	#0
   0x0000fffff7fb5af8:	00000000	udf	#0
   0x0000fffff7fb5afc:	00000000	udf	#0
   0x0000fffff7fb5b00:	00000000	udf	#0
   0x0000fffff7fb5b04:	00000000	udf	#0
   0x0000fffff7fb5b08:	00000000	udf	#0
   0x0000fffff7fb5b0c:	00000000	udf	#0
   0x0000fffff7fb5b10:	00000000	udf	#0
   0x0000fffff7fb5b14:	00000000	udf	#0
   0x0000fffff7fb5b18:	00000000	udf	#0
   0x0000fffff7fb5b1c:	00000000	udf	#0
   0x0000fffff7fb5b20:	00000000	udf	#0
   0x0000fffff7fb5b24:	00000000	udf	#0
   0x0000fffff7fb5b28:	00000000	udf	#0
   0x0000fffff7fb5b2c:	00000000	udf	#0
   0x0000fffff7fb5b30:	00000000	udf	#0
   0x0000fffff7fb5b34:	00000000	udf	#0
   0x0000fffff7fb5b38:	00000000	udf	#0
   0x0000fffff7fb5b3c:	00000000	udf	#0
   0x0000fffff7fb5b40:	00000000	udf	#0
   0x0000fffff7fb5b44:	00000000	udf	#0
   0x0000fffff7fb5b48:	00000000	udf	#0
   0x0000fffff7fb5b4c:	00000000	udf	#0
   0x0000fffff7fb5b50:	00000000	udf	#0
   0x0000fffff7fb5b54:	00000000	udf	#0
   0x0000fffff7fb5b58:	00000000	udf	#0
   0x0000fffff7fb5b5c:	00000000	udf	#0
   0x0000fffff7fb5b60:	00000000	udf	#0
   0x0000fffff7fb5b64:	00000000	udf	#0
   0x0000fffff7fb5b68:	00000000	udf	#0
   0x0000fffff7fb5b6c:	00000000	udf	#0
   0x0000fffff7fb5b70:	00000000	udf	#0
   0x0000fffff7fb5b74:	00000000	udf	#0
   0x0000fffff7fb5b78:	00000000	udf	#0
   0x0000fffff7fb5b7c:	00000000	udf	#0
   0x0000fffff7fb5b80:	00000000	udf	#0
   0x0000fffff7fb5b84:	00000000	udf	#0
   0x0000fffff7fb5b88:	00000000	udf	#0
   0x0000fffff7fb5b8c:	00000000	udf	#0
   0x0000fffff7fb5b90:	00000000	udf	#0
   0x0000fffff7fb5b94:	00000000	udf	#0
   0x0000fffff7fb5b98:	00000000	udf	#0
   0x0000fffff7fb5b9c:	00000000	udf	#0
   0x0000fffff7fb5ba0:	00000000	udf	#0
   0x0000fffff7fb5ba4:	00000000	udf	#0
   0x0000fffff7fb5ba8:	00000000	udf	#0
   0x0000fffff7fb5bac:	00000000	udf	#0
   0x0000fffff7fb5bb0:	00000000	udf	#0
   0x0000fffff7fb5bb4:	00000000	udf	#0
   0x0000fffff7fb5bb8:	00000000	udf	#0
   0x0000fffff7fb5bbc:	00000000	udf	#0
   0x0000fffff7fb5bc0:	00000000	udf	#0
   0x0000fffff7fb5bc4:	00000000	udf	#0
   0x0000fffff7fb5bc8:	00000000	udf	#0
   0x0000fffff7fb5bcc:	00000000	udf	#0
   0x0000fffff7fb5bd0:	00000000	udf	#0
   0x0000fffff7fb5bd4:	00000000	udf	#0
   0x0000fffff7fb5bd8:	00000000	udf	#0
   0x0000fffff7fb5bdc:	00000000	udf	#0
   0x0000fffff7fb5be0:	00000000	udf	#0
   0x0000fffff7fb5be4:	00000000	udf	#0
   0x0000fffff7fb5be8:	00000000	udf	#0
   0x0000fffff7fb5bec:	00000000	udf	#0
   0x0000fffff7fb5bf0:	00000000	udf	#0
   0x0000fffff7fb5bf4:	00000000	udf	#0
   0x0000fffff7fb5bf8:	00000000	udf	#0
   0x0000fffff7fb5bfc:	00000000	udf	#0
   0x0000fffff7fb5c00:	00000000	udf	#0
   0x0000fffff7fb5c04:	00000000	udf	#0
   0x0000fffff7fb5c08:	00000000	udf	#0
   0x0000fffff7fb5c0c:	00000000	udf	#0
   0x0000fffff7fb5c10:	00000000	udf	#0
   0x0000fffff7fb5c14:	00000000	udf	#0
   0x0000fffff7fb5c18:	00000000	udf	#0
   0x0000fffff7fb5c1c:	00000000	udf	#0
   0x0000fffff7fb5c20:	00000000	udf	#0
   0x0000fffff7fb5c24:	00000000	udf	#0
   0x0000fffff7fb5c28:	00000000	udf	#0
   0x0000fffff7fb5c2c:	00000000	udf	#0
   0x0000fffff7fb5c30:	00000000	udf	#0
   0x0000fffff7fb5c34:	00000000	udf	#0
   0x0000fffff7fb5c38:	00000000	udf	#0
   0x0000fffff7fb5c3c:	00000000	udf	#0
   0x0000fffff7fb5c40:	00000000	udf	#0
   0x0000fffff7fb5c44:	00000000	udf	#0
   0x0000fffff7fb5c48:	00000000	udf	#0
   0x0000fffff7fb5c4c:	00000000	udf	#0
   0x0000fffff7fb5c50:	00000000	udf	#0
   0x0000fffff7fb5c54:	00000000	udf	#0
   0x0000fffff7fb5c58:	00000000	udf	#0
   0x0000fffff7fb5c5c:	00000000	udf	#0
   0x0000fffff7fb5c60:	00000000	udf	#0
   0x0000fffff7fb5c64:	00000000	udf	#0
   0x0000fffff7fb5c68:	00000000	udf	#0
   0x0000fffff7fb5c6c:	00000000	udf	#0
   0x0000fffff7fb5c70:	00000000	udf	#0
   0x0000fffff7fb5c74:	00000000	udf	#0
   0x0000fffff7fb5c78:	00000000	udf	#0
   0x0000fffff7fb5c7c:	00000000	udf	#0
   0x0000fffff7fb5c80:	00000000	udf	#0
   0x0000fffff7fb5c84:	00000000	udf	#0
   0x0000fffff7fb5c88:	00000000	udf	#0
   0x0000fffff7fb5c8c:	00000000	udf	#0
   0x0000fffff7fb5c90:	00000000	udf	#0
   0x0000fffff7fb5c94:	00000000	udf	#0
   0x0000fffff7fb5c98:	00000000	udf	#0
   0x0000fffff7fb5c9c:	00000000	udf	#0
   0x0000fffff7fb5ca0:	00000000	udf	#0
   0x0000fffff7fb5ca4:	00000000	udf	#0
   0x0000fffff7fb5ca8:	00000000	udf	#0
   0x0000fffff7fb5cac:	00000000	udf	#0
   0x0000fffff7fb5cb0:	00000000	udf	#0
   0x0000fffff7fb5cb4:	00000000	udf	#0
   0x0000fffff7fb5cb8:	00000000	udf	#0
   0x0000fffff7fb5cbc:	00000000	udf	#0
   0x0000fffff7fb5cc0:	00000000	udf	#0
   0x0000fffff7fb5cc4:	00000000	udf	#0
   0x0000fffff7fb5cc8:	00000000	udf	#0
   0x0000fffff7fb5ccc:	00000000	udf	#0
   0x0000fffff7fb5cd0:	00000000	udf	#0
   0x0000fffff7fb5cd4:	00000000	udf	#0
   0x0000fffff7fb5cd8:	00000000	udf	#0
   0x0000fffff7fb5cdc:	00000000	udf	#0
   0x0000fffff7fb5ce0:	00000000	udf	#0
   0x0000fffff7fb5ce4:	00000000	udf	#0
   0x0000fffff7fb5ce8:	00000000	udf	#0
   0x0000fffff7fb5cec:	00000000	udf	#0
   0x0000fffff7fb5cf0:	00000000	udf	#0
   0x0000fffff7fb5cf4:	00000000	udf	#0
   0x0000fffff7fb5cf8:	00000000	udf	#0
   0x0000fffff7fb5cfc:	00000000	udf	#0
   0x0000fffff7fb5d00:	00000000	udf	#0
   0x0000fffff7fb5d04:	00000000	udf	#0
   0x0000fffff7fb5d08:	00000000	udf	#0
   0x0000fffff7fb5d0c:	00000000	udf	#0
   0x0000fffff7fb5d10:	00000000	udf	#0
   0x0000fffff7fb5d14:	00000000	udf	#0
   0x0000fffff7fb5d18:	00000000	udf	#0
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
