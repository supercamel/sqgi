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
   0x0000fffff7fa4058:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa405c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa4060:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa4064:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa4068:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa406c:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7fa4070:	36d801d1	tbz	w17, #27, 0xfffff7fa40a8
   0x0000fffff7fa4074:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa4078:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa407c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa4080:	54000281	b.ne	0xfffff7fa40d0  // b.any
   0x0000fffff7fa4084:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7fa4088:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa408c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa4090:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa4094:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa4098:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa409c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa40a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa40a4:	54000169	b.ls	0xfffff7fa40d0  // b.plast
   0x0000fffff7fa40a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa40ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa40b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa40b4:	36d80091	tbz	w17, #27, 0xfffff7fa40c4
   0x0000fffff7fa40b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa40bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa40c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa40c4:	f900166c	str	x12, [x19, #40]
   0x0000fffff7fa40c8:	b900226d	str	w13, [x19, #32]
   0x0000fffff7fa40cc:	1400000e	b	0xfffff7fa4104
   0x0000fffff7fa40d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa40d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa40d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa40dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa40e0:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fa40e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa40e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa40ec:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa40f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa40f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa40f8:	d63f0200	blr	x16
   0x0000fffff7fa40fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4100:	5400d8e0	b.eq	0xfffff7fa5c1c  // b.none
   0x0000fffff7fa4104:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fa4108:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fa410c:	d280002c	mov	x12, #0x1                   	// #1
   0x0000fffff7fa4110:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fa4114:	36d80211	tbz	w17, #27, 0xfffff7fa4154
   0x0000fffff7fa4118:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa411c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa4120:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa4124:	540001e1	b.ne	0xfffff7fa4160  // b.any
   0x0000fffff7fa4128:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa412c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4130:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa4134:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa4138:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa413c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa4140:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa4144:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa4148:	540000c9	b.ls	0xfffff7fa4160  // b.plast
   0x0000fffff7fa414c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa4150:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa4154:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa4158:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa415c:	1400000e	b	0xfffff7fa4194
   0x0000fffff7fa4160:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa4164:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4168:	aa1303e1	mov	x1, x19
   0x0000fffff7fa416c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4170:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fa4174:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4178:	aa1603e5	mov	x5, x22
   0x0000fffff7fa417c:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fa4180:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa4184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4188:	d63f0200	blr	x16
   0x0000fffff7fa418c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4190:	5400d4a0	b.eq	0xfffff7fa5c24  // b.none
   0x0000fffff7fa4194:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa4198:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa419c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa41a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa41a4:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fa41a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa41ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fa41b0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa41b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa41b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa41bc:	d63f0200	blr	x16
   0x0000fffff7fa41c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa41c4:	5400d340	b.eq	0xfffff7fa5c2c  // b.none
   0x0000fffff7fa41c8:	14000001	b	0xfffff7fa41cc
   0x0000fffff7fa41cc:	14000001	b	0xfffff7fa41d0
   0x0000fffff7fa41d0:	14000001	b	0xfffff7fa41d4
   0x0000fffff7fa41d4:	14000001	b	0xfffff7fa41d8
   0x0000fffff7fa41d8:	14000001	b	0xfffff7fa41dc
   0x0000fffff7fa41dc:	14000001	b	0xfffff7fa41e0
   0x0000fffff7fa41e0:	14000001	b	0xfffff7fa41e4
   0x0000fffff7fa41e4:	14000001	b	0xfffff7fa41e8
   0x0000fffff7fa41e8:	14000001	b	0xfffff7fa41ec
   0x0000fffff7fa41ec:	14000001	b	0xfffff7fa41f0
   0x0000fffff7fa41f0:	14000001	b	0xfffff7fa41f4
   0x0000fffff7fa41f4:	14000001	b	0xfffff7fa41f8
   0x0000fffff7fa41f8:	14000001	b	0xfffff7fa41fc
   0x0000fffff7fa41fc:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fa4200:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fa4204:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fa4208:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fa420c:	36d80211	tbz	w17, #27, 0xfffff7fa424c
   0x0000fffff7fa4210:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa4214:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa4218:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa421c:	540001e1	b.ne	0xfffff7fa4258  // b.any
   0x0000fffff7fa4220:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa4224:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4228:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa422c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa4230:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa4234:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa4238:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa423c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa4240:	540000c9	b.ls	0xfffff7fa4258  // b.plast
   0x0000fffff7fa4244:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa4248:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa424c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa4250:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa4254:	1400000e	b	0xfffff7fa428c
   0x0000fffff7fa4258:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa425c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4260:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4264:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4268:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fa426c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4270:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4274:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fa4278:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa427c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4280:	d63f0200	blr	x16
   0x0000fffff7fa4284:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4288:	5400cd60	b.eq	0xfffff7fa5c34  // b.none
   0x0000fffff7fa428c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa4290:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4294:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4298:	aa1503e2	mov	x2, x21
   0x0000fffff7fa429c:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fa42a0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa42a4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa42a8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa42ac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa42b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa42b4:	d63f0200	blr	x16
   0x0000fffff7fa42b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa42bc:	5400cc00	b.eq	0xfffff7fa5c3c  // b.none
   0x0000fffff7fa42c0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa42c4:	37d806a9	tbnz	w9, #27, 0xfffff7fa4398
   0x0000fffff7fa42c8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa42cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa42d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa42d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa42d8:	540001c1	b.ne	0xfffff7fa4310  // b.any
   0x0000fffff7fa42dc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa42e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa42e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa42e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa42ec:	54000121	b.ne	0xfffff7fa4310  // b.any
   0x0000fffff7fa42f0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa42f4:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa42f8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa42fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4300:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4304:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa4308:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa430c:	14000030	b	0xfffff7fa43cc
   0x0000fffff7fa4310:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4314:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4318:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa431c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4320:	54000120	b.eq	0xfffff7fa4344  // b.none
   0x0000fffff7fa4324:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4328:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa432c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4330:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4334:	54000321	b.ne	0xfffff7fa4398  // b.any
   0x0000fffff7fa4338:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa433c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa4340:	14000002	b	0xfffff7fa4348
   0x0000fffff7fa4344:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa4348:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa434c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4350:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4354:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4358:	54000120	b.eq	0xfffff7fa437c  // b.none
   0x0000fffff7fa435c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa4360:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4364:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4368:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa436c:	54000161	b.ne	0xfffff7fa4398  // b.any
   0x0000fffff7fa4370:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa4374:	9e620121	scvtf	d1, x9
   0x0000fffff7fa4378:	14000002	b	0xfffff7fa4380
   0x0000fffff7fa437c:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa4380:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa4384:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa4388:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa438c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4390:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa4394:	17ffffde	b	0xfffff7fa430c
   0x0000fffff7fa4398:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa439c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa43a0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa43a4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa43a8:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fa43ac:	aa1403e4	mov	x4, x20
   0x0000fffff7fa43b0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa43b4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa43b8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa43bc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa43c0:	d63f0200	blr	x16
   0x0000fffff7fa43c4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa43c8:	5400c3e0	b.eq	0xfffff7fa5c44  // b.none
   0x0000fffff7fa43cc:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa43d0:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa43d4:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa43d8:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa43dc:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa43e0:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa43e4:	36d801d1	tbz	w17, #27, 0xfffff7fa441c
   0x0000fffff7fa43e8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa43ec:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa43f0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa43f4:	54000281	b.ne	0xfffff7fa4444  // b.any
   0x0000fffff7fa43f8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa43fc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4400:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa4404:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa4408:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa440c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa4410:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa4414:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa4418:	54000169	b.ls	0xfffff7fa4444  // b.plast
   0x0000fffff7fa441c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa4420:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa4424:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa4428:	36d80091	tbz	w17, #27, 0xfffff7fa4438
   0x0000fffff7fa442c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4430:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa4434:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa4438:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa443c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa4440:	1400000e	b	0xfffff7fa4478
   0x0000fffff7fa4444:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa4448:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa444c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4450:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4454:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fa4458:	aa1403e4	mov	x4, x20
   0x0000fffff7fa445c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4460:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa4464:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa4468:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa446c:	d63f0200	blr	x16
   0x0000fffff7fa4470:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4474:	5400bec0	b.eq	0xfffff7fa5c4c  // b.none
   0x0000fffff7fa4478:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa447c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa4480:	540003a0	b.eq	0xfffff7fa44f4  // b.none
   0x0000fffff7fa4484:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa4488:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa448c:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa4490:	36d801d1	tbz	w17, #27, 0xfffff7fa44c8
   0x0000fffff7fa4494:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa4498:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa449c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa44a0:	540002a1	b.ne	0xfffff7fa44f4  // b.any
   0x0000fffff7fa44a4:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa44a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa44ac:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa44b0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa44b4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa44b8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa44bc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa44c0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa44c4:	54000189	b.ls	0xfffff7fa44f4  // b.plast
   0x0000fffff7fa44c8:	36d8008d	tbz	w13, #27, 0xfffff7fa44d8
   0x0000fffff7fa44cc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa44d0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa44d4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa44d8:	36d80091	tbz	w17, #27, 0xfffff7fa44e8
   0x0000fffff7fa44dc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa44e0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa44e4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa44e8:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa44ec:	b900016d	str	w13, [x11]
   0x0000fffff7fa44f0:	1400000e	b	0xfffff7fa4528
   0x0000fffff7fa44f4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa44f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa44fc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4500:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4504:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fa4508:	aa1403e4	mov	x4, x20
   0x0000fffff7fa450c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4510:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa4514:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa4518:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa451c:	d63f0200	blr	x16
   0x0000fffff7fa4520:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4524:	5400b980	b.eq	0xfffff7fa5c54  // b.none
   0x0000fffff7fa4528:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa452c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa4530:	540004a0	b.eq	0xfffff7fa45c4  // b.none
   0x0000fffff7fa4534:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa4538:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa453c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa4540:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa4544:	54000400	b.eq	0xfffff7fa45c4  // b.none
   0x0000fffff7fa4548:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa454c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa4550:	36d801d1	tbz	w17, #27, 0xfffff7fa4588
   0x0000fffff7fa4554:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa4558:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa455c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa4560:	54000321	b.ne	0xfffff7fa45c4  // b.any
   0x0000fffff7fa4564:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa4568:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa456c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa4570:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa4574:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa4578:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa457c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa4580:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa4584:	54000209	b.ls	0xfffff7fa45c4  // b.plast
   0x0000fffff7fa4588:	36d8008d	tbz	w13, #27, 0xfffff7fa4598
   0x0000fffff7fa458c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa4590:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa4594:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa4598:	36d80091	tbz	w17, #27, 0xfffff7fa45a8
   0x0000fffff7fa459c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa45a0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa45a4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa45a8:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa45ac:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa45b0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa45b4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa45b8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa45bc:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa45c0:	1400000e	b	0xfffff7fa45f8
   0x0000fffff7fa45c4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa45c8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa45cc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa45d0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa45d4:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fa45d8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa45dc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa45e0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa45e4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa45e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa45ec:	d63f0200	blr	x16
   0x0000fffff7fa45f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa45f4:	5400b340	b.eq	0xfffff7fa5c5c  // b.none
   0x0000fffff7fa45f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa45fc:	37d806a9	tbnz	w9, #27, 0xfffff7fa46d0
   0x0000fffff7fa4600:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4604:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4608:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa460c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4610:	540001c1	b.ne	0xfffff7fa4648  // b.any
   0x0000fffff7fa4614:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa4618:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa461c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4620:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4624:	54000121	b.ne	0xfffff7fa4648  // b.any
   0x0000fffff7fa4628:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa462c:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa4630:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa4634:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4638:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa463c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa4640:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa4644:	14000030	b	0xfffff7fa4704
   0x0000fffff7fa4648:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa464c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4650:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4654:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4658:	54000120	b.eq	0xfffff7fa467c  // b.none
   0x0000fffff7fa465c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4660:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4664:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4668:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa466c:	54000321	b.ne	0xfffff7fa46d0  // b.any
   0x0000fffff7fa4670:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa4674:	9e620120	scvtf	d0, x9
   0x0000fffff7fa4678:	14000002	b	0xfffff7fa4680
   0x0000fffff7fa467c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa4680:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa4684:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4688:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa468c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4690:	54000120	b.eq	0xfffff7fa46b4  // b.none
   0x0000fffff7fa4694:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa4698:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa469c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa46a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa46a4:	54000161	b.ne	0xfffff7fa46d0  // b.any
   0x0000fffff7fa46a8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa46ac:	9e620121	scvtf	d1, x9
   0x0000fffff7fa46b0:	14000002	b	0xfffff7fa46b8
   0x0000fffff7fa46b4:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa46b8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa46bc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa46c0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa46c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa46c8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa46cc:	17ffffde	b	0xfffff7fa4644
   0x0000fffff7fa46d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa46d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa46d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa46dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa46e0:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fa46e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa46e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa46ec:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa46f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa46f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa46f8:	d63f0200	blr	x16
   0x0000fffff7fa46fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4700:	5400ab20	b.eq	0xfffff7fa5c64  // b.none
   0x0000fffff7fa4704:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa4708:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa470c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa4710:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa4714:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa4718:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa471c:	36d801d1	tbz	w17, #27, 0xfffff7fa4754
   0x0000fffff7fa4720:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa4724:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa4728:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa472c:	54000281	b.ne	0xfffff7fa477c  // b.any
   0x0000fffff7fa4730:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa4734:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4738:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa473c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa4740:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa4744:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa4748:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa474c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa4750:	54000169	b.ls	0xfffff7fa477c  // b.plast
   0x0000fffff7fa4754:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa4758:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa475c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa4760:	36d80091	tbz	w17, #27, 0xfffff7fa4770
   0x0000fffff7fa4764:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4768:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa476c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa4770:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa4774:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa4778:	1400000e	b	0xfffff7fa47b0
   0x0000fffff7fa477c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa4780:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4784:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4788:	aa1503e2	mov	x2, x21
   0x0000fffff7fa478c:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fa4790:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4794:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4798:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa479c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa47a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa47a4:	d63f0200	blr	x16
   0x0000fffff7fa47a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa47ac:	5400a600	b.eq	0xfffff7fa5c6c  // b.none
   0x0000fffff7fa47b0:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa47b4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa47b8:	540003a0	b.eq	0xfffff7fa482c  // b.none
   0x0000fffff7fa47bc:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa47c0:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa47c4:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa47c8:	36d801d1	tbz	w17, #27, 0xfffff7fa4800
   0x0000fffff7fa47cc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa47d0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa47d4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa47d8:	540002a1	b.ne	0xfffff7fa482c  // b.any
   0x0000fffff7fa47dc:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa47e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa47e4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa47e8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa47ec:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa47f0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa47f4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa47f8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa47fc:	54000189	b.ls	0xfffff7fa482c  // b.plast
   0x0000fffff7fa4800:	36d8008d	tbz	w13, #27, 0xfffff7fa4810
   0x0000fffff7fa4804:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa4808:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa480c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa4810:	36d80091	tbz	w17, #27, 0xfffff7fa4820
   0x0000fffff7fa4814:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4818:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa481c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa4820:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa4824:	b900016d	str	w13, [x11]
   0x0000fffff7fa4828:	1400000e	b	0xfffff7fa4860
   0x0000fffff7fa482c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa4830:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4834:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4838:	aa1503e2	mov	x2, x21
   0x0000fffff7fa483c:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fa4840:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4844:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4848:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa484c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa4850:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4854:	d63f0200	blr	x16
   0x0000fffff7fa4858:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa485c:	5400a0c0	b.eq	0xfffff7fa5c74  // b.none
   0x0000fffff7fa4860:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa4864:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa4868:	540004a0	b.eq	0xfffff7fa48fc  // b.none
   0x0000fffff7fa486c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa4870:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa4874:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa4878:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa487c:	54000400	b.eq	0xfffff7fa48fc  // b.none
   0x0000fffff7fa4880:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa4884:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa4888:	36d801d1	tbz	w17, #27, 0xfffff7fa48c0
   0x0000fffff7fa488c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa4890:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa4894:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa4898:	54000321	b.ne	0xfffff7fa48fc  // b.any
   0x0000fffff7fa489c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa48a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa48a4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa48a8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa48ac:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa48b0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa48b4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa48b8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa48bc:	54000209	b.ls	0xfffff7fa48fc  // b.plast
   0x0000fffff7fa48c0:	36d8008d	tbz	w13, #27, 0xfffff7fa48d0
   0x0000fffff7fa48c4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa48c8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa48cc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa48d0:	36d80091	tbz	w17, #27, 0xfffff7fa48e0
   0x0000fffff7fa48d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa48d8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa48dc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa48e0:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa48e4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa48e8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa48ec:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa48f0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa48f4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa48f8:	1400000e	b	0xfffff7fa4930
   0x0000fffff7fa48fc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa4900:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4904:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4908:	aa1503e2	mov	x2, x21
   0x0000fffff7fa490c:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fa4910:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4914:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4918:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa491c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa4920:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4924:	d63f0200	blr	x16
   0x0000fffff7fa4928:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa492c:	54009a80	b.eq	0xfffff7fa5c7c  // b.none
   0x0000fffff7fa4930:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4934:	37d806a9	tbnz	w9, #27, 0xfffff7fa4a08
   0x0000fffff7fa4938:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa493c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4940:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4944:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4948:	540001c1	b.ne	0xfffff7fa4980  // b.any
   0x0000fffff7fa494c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa4950:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4954:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4958:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa495c:	54000121	b.ne	0xfffff7fa4980  // b.any
   0x0000fffff7fa4960:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa4964:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa4968:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa496c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4970:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4974:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa4978:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa497c:	14000030	b	0xfffff7fa4a3c
   0x0000fffff7fa4980:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4984:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4988:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa498c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4990:	54000120	b.eq	0xfffff7fa49b4  // b.none
   0x0000fffff7fa4994:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4998:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa499c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa49a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa49a4:	54000321	b.ne	0xfffff7fa4a08  // b.any
   0x0000fffff7fa49a8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa49ac:	9e620120	scvtf	d0, x9
   0x0000fffff7fa49b0:	14000002	b	0xfffff7fa49b8
   0x0000fffff7fa49b4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa49b8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa49bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa49c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa49c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa49c8:	54000120	b.eq	0xfffff7fa49ec  // b.none
   0x0000fffff7fa49cc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa49d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa49d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa49d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa49dc:	54000161	b.ne	0xfffff7fa4a08  // b.any
   0x0000fffff7fa49e0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa49e4:	9e620121	scvtf	d1, x9
   0x0000fffff7fa49e8:	14000002	b	0xfffff7fa49f0
   0x0000fffff7fa49ec:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa49f0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa49f4:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa49f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa49fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4a00:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa4a04:	17ffffde	b	0xfffff7fa497c
   0x0000fffff7fa4a08:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa4a0c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4a10:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4a14:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4a18:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fa4a1c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4a20:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4a24:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa4a28:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa4a2c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4a30:	d63f0200	blr	x16
   0x0000fffff7fa4a34:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4a38:	54009260	b.eq	0xfffff7fa5c84  // b.none
   0x0000fffff7fa4a3c:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa4a40:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa4a44:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa4a48:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa4a4c:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa4a50:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa4a54:	36d801d1	tbz	w17, #27, 0xfffff7fa4a8c
   0x0000fffff7fa4a58:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa4a5c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa4a60:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa4a64:	54000281	b.ne	0xfffff7fa4ab4  // b.any
   0x0000fffff7fa4a68:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa4a6c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4a70:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa4a74:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa4a78:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa4a7c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa4a80:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa4a84:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa4a88:	54000169	b.ls	0xfffff7fa4ab4  // b.plast
   0x0000fffff7fa4a8c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa4a90:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa4a94:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa4a98:	36d80091	tbz	w17, #27, 0xfffff7fa4aa8
   0x0000fffff7fa4a9c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4aa0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa4aa4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa4aa8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa4aac:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa4ab0:	1400000e	b	0xfffff7fa4ae8
   0x0000fffff7fa4ab4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa4ab8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4abc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4ac0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4ac4:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fa4ac8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4acc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4ad0:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa4ad4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa4ad8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4adc:	d63f0200	blr	x16
   0x0000fffff7fa4ae0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4ae4:	54008d40	b.eq	0xfffff7fa5c8c  // b.none
   0x0000fffff7fa4ae8:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa4aec:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa4af0:	540003a0	b.eq	0xfffff7fa4b64  // b.none
   0x0000fffff7fa4af4:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa4af8:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa4afc:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa4b00:	36d801d1	tbz	w17, #27, 0xfffff7fa4b38
   0x0000fffff7fa4b04:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa4b08:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa4b0c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa4b10:	540002a1	b.ne	0xfffff7fa4b64  // b.any
   0x0000fffff7fa4b14:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa4b18:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4b1c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa4b20:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa4b24:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa4b28:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa4b2c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa4b30:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa4b34:	54000189	b.ls	0xfffff7fa4b64  // b.plast
   0x0000fffff7fa4b38:	36d8008d	tbz	w13, #27, 0xfffff7fa4b48
   0x0000fffff7fa4b3c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa4b40:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa4b44:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa4b48:	36d80091	tbz	w17, #27, 0xfffff7fa4b58
   0x0000fffff7fa4b4c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4b50:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa4b54:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa4b58:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa4b5c:	b900016d	str	w13, [x11]
   0x0000fffff7fa4b60:	1400000e	b	0xfffff7fa4b98
   0x0000fffff7fa4b64:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa4b68:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4b6c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4b70:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4b74:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fa4b78:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4b7c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4b80:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa4b84:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa4b88:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4b8c:	d63f0200	blr	x16
   0x0000fffff7fa4b90:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4b94:	54008800	b.eq	0xfffff7fa5c94  // b.none
   0x0000fffff7fa4b98:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa4b9c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa4ba0:	540004a0	b.eq	0xfffff7fa4c34  // b.none
   0x0000fffff7fa4ba4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa4ba8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa4bac:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa4bb0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa4bb4:	54000400	b.eq	0xfffff7fa4c34  // b.none
   0x0000fffff7fa4bb8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa4bbc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa4bc0:	36d801d1	tbz	w17, #27, 0xfffff7fa4bf8
   0x0000fffff7fa4bc4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa4bc8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa4bcc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa4bd0:	54000321	b.ne	0xfffff7fa4c34  // b.any
   0x0000fffff7fa4bd4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa4bd8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4bdc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa4be0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa4be4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa4be8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa4bec:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa4bf0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa4bf4:	54000209	b.ls	0xfffff7fa4c34  // b.plast
   0x0000fffff7fa4bf8:	36d8008d	tbz	w13, #27, 0xfffff7fa4c08
   0x0000fffff7fa4bfc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa4c00:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa4c04:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa4c08:	36d80091	tbz	w17, #27, 0xfffff7fa4c18
   0x0000fffff7fa4c0c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4c10:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa4c14:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa4c18:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa4c1c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa4c20:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa4c24:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa4c28:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa4c2c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa4c30:	1400000e	b	0xfffff7fa4c68
   0x0000fffff7fa4c34:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa4c38:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4c3c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4c40:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4c44:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fa4c48:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4c4c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4c50:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa4c54:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa4c58:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4c5c:	d63f0200	blr	x16
   0x0000fffff7fa4c60:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4c64:	540081c0	b.eq	0xfffff7fa5c9c  // b.none
   0x0000fffff7fa4c68:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4c6c:	37d806a9	tbnz	w9, #27, 0xfffff7fa4d40
   0x0000fffff7fa4c70:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4c74:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4c78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4c7c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4c80:	540001c1	b.ne	0xfffff7fa4cb8  // b.any
   0x0000fffff7fa4c84:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa4c88:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4c8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4c90:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4c94:	54000121	b.ne	0xfffff7fa4cb8  // b.any
   0x0000fffff7fa4c98:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa4c9c:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa4ca0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa4ca4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4ca8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4cac:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa4cb0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa4cb4:	14000030	b	0xfffff7fa4d74
   0x0000fffff7fa4cb8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4cbc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4cc0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4cc4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4cc8:	54000120	b.eq	0xfffff7fa4cec  // b.none
   0x0000fffff7fa4ccc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4cd0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4cd4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4cd8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4cdc:	54000321	b.ne	0xfffff7fa4d40  // b.any
   0x0000fffff7fa4ce0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa4ce4:	9e620120	scvtf	d0, x9
   0x0000fffff7fa4ce8:	14000002	b	0xfffff7fa4cf0
   0x0000fffff7fa4cec:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa4cf0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa4cf4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4cf8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4cfc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4d00:	54000120	b.eq	0xfffff7fa4d24  // b.none
   0x0000fffff7fa4d04:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa4d08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4d0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4d10:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4d14:	54000161	b.ne	0xfffff7fa4d40  // b.any
   0x0000fffff7fa4d18:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa4d1c:	9e620121	scvtf	d1, x9
   0x0000fffff7fa4d20:	14000002	b	0xfffff7fa4d28
   0x0000fffff7fa4d24:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa4d28:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa4d2c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa4d30:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4d34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4d38:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa4d3c:	17ffffde	b	0xfffff7fa4cb4
   0x0000fffff7fa4d40:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa4d44:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4d48:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4d4c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4d50:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fa4d54:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4d58:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4d5c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa4d60:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa4d64:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4d68:	d63f0200	blr	x16
   0x0000fffff7fa4d6c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4d70:	540079a0	b.eq	0xfffff7fa5ca4  // b.none
   0x0000fffff7fa4d74:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa4d78:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa4d7c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa4d80:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa4d84:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa4d88:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa4d8c:	36d801d1	tbz	w17, #27, 0xfffff7fa4dc4
   0x0000fffff7fa4d90:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa4d94:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa4d98:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa4d9c:	54000281	b.ne	0xfffff7fa4dec  // b.any
   0x0000fffff7fa4da0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa4da4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4da8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa4dac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa4db0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa4db4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa4db8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa4dbc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa4dc0:	54000169	b.ls	0xfffff7fa4dec  // b.plast
   0x0000fffff7fa4dc4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa4dc8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa4dcc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa4dd0:	36d80091	tbz	w17, #27, 0xfffff7fa4de0
   0x0000fffff7fa4dd4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4dd8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa4ddc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa4de0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa4de4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa4de8:	1400000e	b	0xfffff7fa4e20
   0x0000fffff7fa4dec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa4df0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4df4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4df8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4dfc:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fa4e00:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4e04:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4e08:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa4e0c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa4e10:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4e14:	d63f0200	blr	x16
   0x0000fffff7fa4e18:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4e1c:	54007480	b.eq	0xfffff7fa5cac  // b.none
   0x0000fffff7fa4e20:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa4e24:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa4e28:	540003a0	b.eq	0xfffff7fa4e9c  // b.none
   0x0000fffff7fa4e2c:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa4e30:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa4e34:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa4e38:	36d801d1	tbz	w17, #27, 0xfffff7fa4e70
   0x0000fffff7fa4e3c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa4e40:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa4e44:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa4e48:	540002a1	b.ne	0xfffff7fa4e9c  // b.any
   0x0000fffff7fa4e4c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa4e50:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4e54:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa4e58:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa4e5c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa4e60:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa4e64:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa4e68:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa4e6c:	54000189	b.ls	0xfffff7fa4e9c  // b.plast
   0x0000fffff7fa4e70:	36d8008d	tbz	w13, #27, 0xfffff7fa4e80
   0x0000fffff7fa4e74:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa4e78:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa4e7c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa4e80:	36d80091	tbz	w17, #27, 0xfffff7fa4e90
   0x0000fffff7fa4e84:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4e88:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa4e8c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa4e90:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa4e94:	b900016d	str	w13, [x11]
   0x0000fffff7fa4e98:	1400000e	b	0xfffff7fa4ed0
   0x0000fffff7fa4e9c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa4ea0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4ea4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4ea8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4eac:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fa4eb0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4eb4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4eb8:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa4ebc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa4ec0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4ec4:	d63f0200	blr	x16
   0x0000fffff7fa4ec8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4ecc:	54006f40	b.eq	0xfffff7fa5cb4  // b.none
   0x0000fffff7fa4ed0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa4ed4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa4ed8:	540004a0	b.eq	0xfffff7fa4f6c  // b.none
   0x0000fffff7fa4edc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa4ee0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa4ee4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa4ee8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa4eec:	54000400	b.eq	0xfffff7fa4f6c  // b.none
   0x0000fffff7fa4ef0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa4ef4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa4ef8:	36d801d1	tbz	w17, #27, 0xfffff7fa4f30
   0x0000fffff7fa4efc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa4f00:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa4f04:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa4f08:	54000321	b.ne	0xfffff7fa4f6c  // b.any
   0x0000fffff7fa4f0c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa4f10:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4f14:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa4f18:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa4f1c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa4f20:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa4f24:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa4f28:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa4f2c:	54000209	b.ls	0xfffff7fa4f6c  // b.plast
   0x0000fffff7fa4f30:	36d8008d	tbz	w13, #27, 0xfffff7fa4f40
   0x0000fffff7fa4f34:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa4f38:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa4f3c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa4f40:	36d80091	tbz	w17, #27, 0xfffff7fa4f50
   0x0000fffff7fa4f44:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4f48:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa4f4c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa4f50:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa4f54:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa4f58:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa4f5c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa4f60:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa4f64:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa4f68:	1400000e	b	0xfffff7fa4fa0
   0x0000fffff7fa4f6c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa4f70:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4f74:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4f78:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4f7c:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fa4f80:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4f84:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4f88:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa4f8c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa4f90:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4f94:	d63f0200	blr	x16
   0x0000fffff7fa4f98:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4f9c:	54006900	b.eq	0xfffff7fa5cbc  // b.none
   0x0000fffff7fa4fa0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4fa4:	37d806a9	tbnz	w9, #27, 0xfffff7fa5078
   0x0000fffff7fa4fa8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4fac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4fb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4fb4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4fb8:	540001c1	b.ne	0xfffff7fa4ff0  // b.any
   0x0000fffff7fa4fbc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa4fc0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4fc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4fc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4fcc:	54000121	b.ne	0xfffff7fa4ff0  // b.any
   0x0000fffff7fa4fd0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa4fd4:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa4fd8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa4fdc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4fe0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4fe4:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa4fe8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa4fec:	14000030	b	0xfffff7fa50ac
   0x0000fffff7fa4ff0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4ff4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4ff8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4ffc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5000:	54000120	b.eq	0xfffff7fa5024  // b.none
   0x0000fffff7fa5004:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa5008:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa500c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5010:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5014:	54000321	b.ne	0xfffff7fa5078  // b.any
   0x0000fffff7fa5018:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa501c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa5020:	14000002	b	0xfffff7fa5028
   0x0000fffff7fa5024:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa5028:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa502c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5030:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5034:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5038:	54000120	b.eq	0xfffff7fa505c  // b.none
   0x0000fffff7fa503c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa5040:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5044:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5048:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa504c:	54000161	b.ne	0xfffff7fa5078  // b.any
   0x0000fffff7fa5050:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa5054:	9e620121	scvtf	d1, x9
   0x0000fffff7fa5058:	14000002	b	0xfffff7fa5060
   0x0000fffff7fa505c:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa5060:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa5064:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa5068:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa506c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5070:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa5074:	17ffffde	b	0xfffff7fa4fec
   0x0000fffff7fa5078:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa507c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5080:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5084:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5088:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fa508c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5090:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5094:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa5098:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa509c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa50a0:	d63f0200	blr	x16
   0x0000fffff7fa50a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa50a8:	540060e0	b.eq	0xfffff7fa5cc4  // b.none
   0x0000fffff7fa50ac:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa50b0:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa50b4:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa50b8:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa50bc:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa50c0:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa50c4:	36d801d1	tbz	w17, #27, 0xfffff7fa50fc
   0x0000fffff7fa50c8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa50cc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa50d0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa50d4:	54000281	b.ne	0xfffff7fa5124  // b.any
   0x0000fffff7fa50d8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa50dc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa50e0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa50e4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa50e8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa50ec:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa50f0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa50f4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa50f8:	54000169	b.ls	0xfffff7fa5124  // b.plast
   0x0000fffff7fa50fc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa5100:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa5104:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa5108:	36d80091	tbz	w17, #27, 0xfffff7fa5118
   0x0000fffff7fa510c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa5110:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa5114:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa5118:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa511c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa5120:	1400000e	b	0xfffff7fa5158
   0x0000fffff7fa5124:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa5128:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa512c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5130:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5134:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fa5138:	aa1403e4	mov	x4, x20
   0x0000fffff7fa513c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5140:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa5144:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa5148:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa514c:	d63f0200	blr	x16
   0x0000fffff7fa5150:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5154:	54005bc0	b.eq	0xfffff7fa5ccc  // b.none
   0x0000fffff7fa5158:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa515c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa5160:	540003a0	b.eq	0xfffff7fa51d4  // b.none
   0x0000fffff7fa5164:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa5168:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa516c:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa5170:	36d801d1	tbz	w17, #27, 0xfffff7fa51a8
   0x0000fffff7fa5174:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa5178:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa517c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa5180:	540002a1	b.ne	0xfffff7fa51d4  // b.any
   0x0000fffff7fa5184:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa5188:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa518c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa5190:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa5194:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa5198:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa519c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa51a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa51a4:	54000189	b.ls	0xfffff7fa51d4  // b.plast
   0x0000fffff7fa51a8:	36d8008d	tbz	w13, #27, 0xfffff7fa51b8
   0x0000fffff7fa51ac:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa51b0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa51b4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa51b8:	36d80091	tbz	w17, #27, 0xfffff7fa51c8
   0x0000fffff7fa51bc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa51c0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa51c4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa51c8:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa51cc:	b900016d	str	w13, [x11]
   0x0000fffff7fa51d0:	1400000e	b	0xfffff7fa5208
   0x0000fffff7fa51d4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa51d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa51dc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa51e0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa51e4:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fa51e8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa51ec:	aa1603e5	mov	x5, x22
   0x0000fffff7fa51f0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa51f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa51f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa51fc:	d63f0200	blr	x16
   0x0000fffff7fa5200:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5204:	54005680	b.eq	0xfffff7fa5cd4  // b.none
   0x0000fffff7fa5208:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa520c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa5210:	540004a0	b.eq	0xfffff7fa52a4  // b.none
   0x0000fffff7fa5214:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa5218:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa521c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa5220:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa5224:	54000400	b.eq	0xfffff7fa52a4  // b.none
   0x0000fffff7fa5228:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa522c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa5230:	36d801d1	tbz	w17, #27, 0xfffff7fa5268
   0x0000fffff7fa5234:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa5238:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa523c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa5240:	54000321	b.ne	0xfffff7fa52a4  // b.any
   0x0000fffff7fa5244:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa5248:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa524c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa5250:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa5254:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa5258:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa525c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa5260:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa5264:	54000209	b.ls	0xfffff7fa52a4  // b.plast
   0x0000fffff7fa5268:	36d8008d	tbz	w13, #27, 0xfffff7fa5278
   0x0000fffff7fa526c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa5270:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa5274:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa5278:	36d80091	tbz	w17, #27, 0xfffff7fa5288
   0x0000fffff7fa527c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa5280:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa5284:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa5288:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa528c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa5290:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa5294:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa5298:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa529c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa52a0:	1400000e	b	0xfffff7fa52d8
   0x0000fffff7fa52a4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa52a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa52ac:	aa1303e1	mov	x1, x19
   0x0000fffff7fa52b0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa52b4:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fa52b8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa52bc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa52c0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa52c4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa52c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa52cc:	d63f0200	blr	x16
   0x0000fffff7fa52d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa52d4:	54005040	b.eq	0xfffff7fa5cdc  // b.none
   0x0000fffff7fa52d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa52dc:	37d806a9	tbnz	w9, #27, 0xfffff7fa53b0
   0x0000fffff7fa52e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa52e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa52e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa52ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa52f0:	540001c1	b.ne	0xfffff7fa5328  // b.any
   0x0000fffff7fa52f4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa52f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa52fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5300:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5304:	54000121	b.ne	0xfffff7fa5328  // b.any
   0x0000fffff7fa5308:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa530c:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa5310:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa5314:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5318:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa531c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa5320:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa5324:	14000030	b	0xfffff7fa53e4
   0x0000fffff7fa5328:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa532c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5330:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5334:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5338:	54000120	b.eq	0xfffff7fa535c  // b.none
   0x0000fffff7fa533c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa5340:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5344:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5348:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa534c:	54000321	b.ne	0xfffff7fa53b0  // b.any
   0x0000fffff7fa5350:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa5354:	9e620120	scvtf	d0, x9
   0x0000fffff7fa5358:	14000002	b	0xfffff7fa5360
   0x0000fffff7fa535c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa5360:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa5364:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5368:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa536c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5370:	54000120	b.eq	0xfffff7fa5394  // b.none
   0x0000fffff7fa5374:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa5378:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa537c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5380:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5384:	54000161	b.ne	0xfffff7fa53b0  // b.any
   0x0000fffff7fa5388:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa538c:	9e620121	scvtf	d1, x9
   0x0000fffff7fa5390:	14000002	b	0xfffff7fa5398
   0x0000fffff7fa5394:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa5398:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa539c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa53a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa53a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa53a8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa53ac:	17ffffde	b	0xfffff7fa5324
   0x0000fffff7fa53b0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa53b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa53b8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa53bc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa53c0:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fa53c4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa53c8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa53cc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa53d0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa53d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa53d8:	d63f0200	blr	x16
   0x0000fffff7fa53dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa53e0:	54004820	b.eq	0xfffff7fa5ce4  // b.none
   0x0000fffff7fa53e4:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa53e8:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa53ec:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa53f0:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa53f4:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa53f8:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa53fc:	36d801d1	tbz	w17, #27, 0xfffff7fa5434
   0x0000fffff7fa5400:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa5404:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa5408:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa540c:	54000281	b.ne	0xfffff7fa545c  // b.any
   0x0000fffff7fa5410:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa5414:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa5418:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa541c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa5420:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa5424:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa5428:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa542c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa5430:	54000169	b.ls	0xfffff7fa545c  // b.plast
   0x0000fffff7fa5434:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa5438:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa543c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa5440:	36d80091	tbz	w17, #27, 0xfffff7fa5450
   0x0000fffff7fa5444:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa5448:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa544c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa5450:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa5454:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa5458:	1400000e	b	0xfffff7fa5490
   0x0000fffff7fa545c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa5460:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5464:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5468:	aa1503e2	mov	x2, x21
   0x0000fffff7fa546c:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fa5470:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5474:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5478:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa547c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa5480:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5484:	d63f0200	blr	x16
   0x0000fffff7fa5488:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa548c:	54004300	b.eq	0xfffff7fa5cec  // b.none
   0x0000fffff7fa5490:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa5494:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa5498:	540003a0	b.eq	0xfffff7fa550c  // b.none
   0x0000fffff7fa549c:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa54a0:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa54a4:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa54a8:	36d801d1	tbz	w17, #27, 0xfffff7fa54e0
   0x0000fffff7fa54ac:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa54b0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa54b4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa54b8:	540002a1	b.ne	0xfffff7fa550c  // b.any
   0x0000fffff7fa54bc:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa54c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa54c4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa54c8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa54cc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa54d0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa54d4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa54d8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa54dc:	54000189	b.ls	0xfffff7fa550c  // b.plast
   0x0000fffff7fa54e0:	36d8008d	tbz	w13, #27, 0xfffff7fa54f0
   0x0000fffff7fa54e4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa54e8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa54ec:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa54f0:	36d80091	tbz	w17, #27, 0xfffff7fa5500
   0x0000fffff7fa54f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa54f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa54fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa5500:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa5504:	b900016d	str	w13, [x11]
   0x0000fffff7fa5508:	1400000e	b	0xfffff7fa5540
   0x0000fffff7fa550c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa5510:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5514:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5518:	aa1503e2	mov	x2, x21
   0x0000fffff7fa551c:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fa5520:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5524:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5528:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa552c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa5530:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5534:	d63f0200	blr	x16
   0x0000fffff7fa5538:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa553c:	54003dc0	b.eq	0xfffff7fa5cf4  // b.none
   0x0000fffff7fa5540:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa5544:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa5548:	540004a0	b.eq	0xfffff7fa55dc  // b.none
   0x0000fffff7fa554c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa5550:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa5554:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa5558:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa555c:	54000400	b.eq	0xfffff7fa55dc  // b.none
   0x0000fffff7fa5560:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa5564:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa5568:	36d801d1	tbz	w17, #27, 0xfffff7fa55a0
   0x0000fffff7fa556c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa5570:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa5574:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa5578:	54000321	b.ne	0xfffff7fa55dc  // b.any
   0x0000fffff7fa557c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa5580:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa5584:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa5588:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa558c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa5590:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa5594:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa5598:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa559c:	54000209	b.ls	0xfffff7fa55dc  // b.plast
   0x0000fffff7fa55a0:	36d8008d	tbz	w13, #27, 0xfffff7fa55b0
   0x0000fffff7fa55a4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa55a8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa55ac:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa55b0:	36d80091	tbz	w17, #27, 0xfffff7fa55c0
   0x0000fffff7fa55b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa55b8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa55bc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa55c0:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa55c4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa55c8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa55cc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa55d0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa55d4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa55d8:	1400000e	b	0xfffff7fa5610
   0x0000fffff7fa55dc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa55e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa55e4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa55e8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa55ec:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7fa55f0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa55f4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa55f8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa55fc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa5600:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5604:	d63f0200	blr	x16
   0x0000fffff7fa5608:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa560c:	54003780	b.eq	0xfffff7fa5cfc  // b.none
   0x0000fffff7fa5610:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa5614:	37d806a9	tbnz	w9, #27, 0xfffff7fa56e8
   0x0000fffff7fa5618:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa561c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5620:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5624:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5628:	540001c1	b.ne	0xfffff7fa5660  // b.any
   0x0000fffff7fa562c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa5630:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5634:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5638:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa563c:	54000121	b.ne	0xfffff7fa5660  // b.any
   0x0000fffff7fa5640:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa5644:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa5648:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa564c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5650:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5654:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa5658:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa565c:	14000030	b	0xfffff7fa571c
   0x0000fffff7fa5660:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa5664:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5668:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa566c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5670:	54000120	b.eq	0xfffff7fa5694  // b.none
   0x0000fffff7fa5674:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa5678:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa567c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5680:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5684:	54000321	b.ne	0xfffff7fa56e8  // b.any
   0x0000fffff7fa5688:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa568c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa5690:	14000002	b	0xfffff7fa5698
   0x0000fffff7fa5694:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa5698:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa569c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa56a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa56a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa56a8:	54000120	b.eq	0xfffff7fa56cc  // b.none
   0x0000fffff7fa56ac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa56b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa56b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa56b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa56bc:	54000161	b.ne	0xfffff7fa56e8  // b.any
   0x0000fffff7fa56c0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa56c4:	9e620121	scvtf	d1, x9
   0x0000fffff7fa56c8:	14000002	b	0xfffff7fa56d0
   0x0000fffff7fa56cc:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa56d0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa56d4:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa56d8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa56dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa56e0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa56e4:	17ffffde	b	0xfffff7fa565c
   0x0000fffff7fa56e8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa56ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa56f0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa56f4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa56f8:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7fa56fc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5700:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5704:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa5708:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa570c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5710:	d63f0200	blr	x16
   0x0000fffff7fa5714:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5718:	54002f60	b.eq	0xfffff7fa5d04  // b.none
   0x0000fffff7fa571c:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa5720:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa5724:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa5728:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa572c:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa5730:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa5734:	36d801d1	tbz	w17, #27, 0xfffff7fa576c
   0x0000fffff7fa5738:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa573c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa5740:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa5744:	54000281	b.ne	0xfffff7fa5794  // b.any
   0x0000fffff7fa5748:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa574c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa5750:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa5754:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa5758:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa575c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa5760:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa5764:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa5768:	54000169	b.ls	0xfffff7fa5794  // b.plast
   0x0000fffff7fa576c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa5770:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa5774:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa5778:	36d80091	tbz	w17, #27, 0xfffff7fa5788
   0x0000fffff7fa577c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa5780:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa5784:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa5788:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa578c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa5790:	1400000e	b	0xfffff7fa57c8
   0x0000fffff7fa5794:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa5798:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa579c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa57a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa57a4:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7fa57a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa57ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fa57b0:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa57b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa57b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa57bc:	d63f0200	blr	x16
   0x0000fffff7fa57c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa57c4:	54002a40	b.eq	0xfffff7fa5d0c  // b.none
   0x0000fffff7fa57c8:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa57cc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa57d0:	540003a0	b.eq	0xfffff7fa5844  // b.none
   0x0000fffff7fa57d4:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa57d8:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa57dc:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa57e0:	36d801d1	tbz	w17, #27, 0xfffff7fa5818
   0x0000fffff7fa57e4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa57e8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa57ec:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa57f0:	540002a1	b.ne	0xfffff7fa5844  // b.any
   0x0000fffff7fa57f4:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa57f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa57fc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa5800:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa5804:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa5808:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa580c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa5810:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa5814:	54000189	b.ls	0xfffff7fa5844  // b.plast
   0x0000fffff7fa5818:	36d8008d	tbz	w13, #27, 0xfffff7fa5828
   0x0000fffff7fa581c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa5820:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa5824:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa5828:	36d80091	tbz	w17, #27, 0xfffff7fa5838
   0x0000fffff7fa582c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa5830:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa5834:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa5838:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa583c:	b900016d	str	w13, [x11]
   0x0000fffff7fa5840:	1400000e	b	0xfffff7fa5878
   0x0000fffff7fa5844:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa5848:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa584c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5850:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5854:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7fa5858:	aa1403e4	mov	x4, x20
   0x0000fffff7fa585c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5860:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa5864:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa5868:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa586c:	d63f0200	blr	x16
   0x0000fffff7fa5870:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5874:	54002500	b.eq	0xfffff7fa5d14  // b.none
   0x0000fffff7fa5878:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa587c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa5880:	540004a0	b.eq	0xfffff7fa5914  // b.none
   0x0000fffff7fa5884:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa5888:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa588c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa5890:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa5894:	54000400	b.eq	0xfffff7fa5914  // b.none
   0x0000fffff7fa5898:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa589c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa58a0:	36d801d1	tbz	w17, #27, 0xfffff7fa58d8
   0x0000fffff7fa58a4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa58a8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa58ac:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa58b0:	54000321	b.ne	0xfffff7fa5914  // b.any
   0x0000fffff7fa58b4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa58b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa58bc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa58c0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa58c4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa58c8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa58cc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa58d0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa58d4:	54000209	b.ls	0xfffff7fa5914  // b.plast
   0x0000fffff7fa58d8:	36d8008d	tbz	w13, #27, 0xfffff7fa58e8
   0x0000fffff7fa58dc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa58e0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa58e4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa58e8:	36d80091	tbz	w17, #27, 0xfffff7fa58f8
   0x0000fffff7fa58ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa58f0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa58f4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa58f8:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa58fc:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa5900:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa5904:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa5908:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa590c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa5910:	1400000e	b	0xfffff7fa5948
   0x0000fffff7fa5914:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa5918:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa591c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5920:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5924:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7fa5928:	aa1403e4	mov	x4, x20
   0x0000fffff7fa592c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5930:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa5934:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa5938:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa593c:	d63f0200	blr	x16
   0x0000fffff7fa5940:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5944:	54001ec0	b.eq	0xfffff7fa5d1c  // b.none
   0x0000fffff7fa5948:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa594c:	37d806a9	tbnz	w9, #27, 0xfffff7fa5a20
   0x0000fffff7fa5950:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa5954:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5958:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa595c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5960:	540001c1	b.ne	0xfffff7fa5998  // b.any
   0x0000fffff7fa5964:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa5968:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa596c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5970:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5974:	54000121	b.ne	0xfffff7fa5998  // b.any
   0x0000fffff7fa5978:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa597c:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa5980:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa5984:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5988:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa598c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa5990:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa5994:	14000030	b	0xfffff7fa5a54
   0x0000fffff7fa5998:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa599c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa59a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa59a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa59a8:	54000120	b.eq	0xfffff7fa59cc  // b.none
   0x0000fffff7fa59ac:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa59b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa59b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa59b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa59bc:	54000321	b.ne	0xfffff7fa5a20  // b.any
   0x0000fffff7fa59c0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa59c4:	9e620120	scvtf	d0, x9
   0x0000fffff7fa59c8:	14000002	b	0xfffff7fa59d0
   0x0000fffff7fa59cc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa59d0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa59d4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa59d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa59dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa59e0:	54000120	b.eq	0xfffff7fa5a04  // b.none
   0x0000fffff7fa59e4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa59e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa59ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa59f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa59f4:	54000161	b.ne	0xfffff7fa5a20  // b.any
   0x0000fffff7fa59f8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa59fc:	9e620121	scvtf	d1, x9
   0x0000fffff7fa5a00:	14000002	b	0xfffff7fa5a08
   0x0000fffff7fa5a04:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa5a08:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa5a0c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa5a10:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5a14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5a18:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa5a1c:	17ffffde	b	0xfffff7fa5994
   0x0000fffff7fa5a20:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa5a24:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5a28:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5a2c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5a30:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7fa5a34:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5a38:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5a3c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa5a40:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa5a44:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5a48:	d63f0200	blr	x16
   0x0000fffff7fa5a4c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5a50:	540016a0	b.eq	0xfffff7fa5d24  // b.none
   0x0000fffff7fa5a54:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa5a58:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa5a5c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa5a60:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa5a64:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa5a68:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa5a6c:	36d801d1	tbz	w17, #27, 0xfffff7fa5aa4
   0x0000fffff7fa5a70:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa5a74:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa5a78:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa5a7c:	54000281	b.ne	0xfffff7fa5acc  // b.any
   0x0000fffff7fa5a80:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa5a84:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa5a88:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa5a8c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa5a90:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa5a94:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa5a98:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa5a9c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa5aa0:	54000169	b.ls	0xfffff7fa5acc  // b.plast
   0x0000fffff7fa5aa4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa5aa8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa5aac:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa5ab0:	36d80091	tbz	w17, #27, 0xfffff7fa5ac0
   0x0000fffff7fa5ab4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa5ab8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa5abc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa5ac0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa5ac4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa5ac8:	1400000e	b	0xfffff7fa5b00
   0x0000fffff7fa5acc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa5ad0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5ad4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5ad8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5adc:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7fa5ae0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5ae4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5ae8:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa5aec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa5af0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5af4:	d63f0200	blr	x16
   0x0000fffff7fa5af8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5afc:	54001180	b.eq	0xfffff7fa5d2c  // b.none
   0x0000fffff7fa5b00:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa5b04:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa5b08:	540003a0	b.eq	0xfffff7fa5b7c  // b.none
   0x0000fffff7fa5b0c:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa5b10:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa5b14:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa5b18:	36d801d1	tbz	w17, #27, 0xfffff7fa5b50
   0x0000fffff7fa5b1c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa5b20:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa5b24:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa5b28:	540002a1	b.ne	0xfffff7fa5b7c  // b.any
   0x0000fffff7fa5b2c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa5b30:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa5b34:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa5b38:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa5b3c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa5b40:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa5b44:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa5b48:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa5b4c:	54000189	b.ls	0xfffff7fa5b7c  // b.plast
   0x0000fffff7fa5b50:	36d8008d	tbz	w13, #27, 0xfffff7fa5b60
   0x0000fffff7fa5b54:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa5b58:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa5b5c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa5b60:	36d80091	tbz	w17, #27, 0xfffff7fa5b70
   0x0000fffff7fa5b64:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa5b68:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa5b6c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa5b70:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa5b74:	b900016d	str	w13, [x11]
   0x0000fffff7fa5b78:	1400000e	b	0xfffff7fa5bb0
   0x0000fffff7fa5b7c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa5b80:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5b84:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5b88:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5b8c:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7fa5b90:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5b94:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5b98:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa5b9c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa5ba0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5ba4:	d63f0200	blr	x16
   0x0000fffff7fa5ba8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5bac:	54000c40	b.eq	0xfffff7fa5d34  // b.none
   0x0000fffff7fa5bb0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa5bb4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5bb8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5bbc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5bc0:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7fa5bc4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5bc8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5bcc:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7fa5bd0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa5bd4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5bd8:	d63f0200	blr	x16
   0x0000fffff7fa5bdc:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa5be0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa5be4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa5be8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa5bec:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fa5bf0:	d65f03c0	ret
   0x0000fffff7fa5bf4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5bf8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5bfc:	b900028a	str	w10, [x20]
   0x0000fffff7fa5c00:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fa5c04:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa5c08:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa5c0c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa5c10:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa5c14:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fa5c18:	d65f03c0	ret
   0x0000fffff7fa5c1c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fa5c20:	17fffff5	b	0xfffff7fa5bf4
   0x0000fffff7fa5c24:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fa5c28:	17fffff3	b	0xfffff7fa5bf4
   0x0000fffff7fa5c2c:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fa5c30:	17fffff1	b	0xfffff7fa5bf4
   0x0000fffff7fa5c34:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fa5c38:	17ffffef	b	0xfffff7fa5bf4
   0x0000fffff7fa5c3c:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fa5c40:	17ffffed	b	0xfffff7fa5bf4
   0x0000fffff7fa5c44:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fa5c48:	17ffffeb	b	0xfffff7fa5bf4
   0x0000fffff7fa5c4c:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fa5c50:	17ffffe9	b	0xfffff7fa5bf4
   0x0000fffff7fa5c54:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fa5c58:	17ffffe7	b	0xfffff7fa5bf4
   0x0000fffff7fa5c5c:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fa5c60:	17ffffe5	b	0xfffff7fa5bf4
   0x0000fffff7fa5c64:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fa5c68:	17ffffe3	b	0xfffff7fa5bf4
   0x0000fffff7fa5c6c:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fa5c70:	17ffffe1	b	0xfffff7fa5bf4
   0x0000fffff7fa5c74:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fa5c78:	17ffffdf	b	0xfffff7fa5bf4
   0x0000fffff7fa5c7c:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fa5c80:	17ffffdd	b	0xfffff7fa5bf4
   0x0000fffff7fa5c84:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fa5c88:	17ffffdb	b	0xfffff7fa5bf4
   0x0000fffff7fa5c8c:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fa5c90:	17ffffd9	b	0xfffff7fa5bf4
   0x0000fffff7fa5c94:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fa5c98:	17ffffd7	b	0xfffff7fa5bf4
   0x0000fffff7fa5c9c:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fa5ca0:	17ffffd5	b	0xfffff7fa5bf4
   0x0000fffff7fa5ca4:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fa5ca8:	17ffffd3	b	0xfffff7fa5bf4
   0x0000fffff7fa5cac:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fa5cb0:	17ffffd1	b	0xfffff7fa5bf4
   0x0000fffff7fa5cb4:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fa5cb8:	17ffffcf	b	0xfffff7fa5bf4
   0x0000fffff7fa5cbc:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fa5cc0:	17ffffcd	b	0xfffff7fa5bf4
   0x0000fffff7fa5cc4:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fa5cc8:	17ffffcb	b	0xfffff7fa5bf4
   0x0000fffff7fa5ccc:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fa5cd0:	17ffffc9	b	0xfffff7fa5bf4
   0x0000fffff7fa5cd4:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fa5cd8:	17ffffc7	b	0xfffff7fa5bf4
   0x0000fffff7fa5cdc:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fa5ce0:	17ffffc5	b	0xfffff7fa5bf4
   0x0000fffff7fa5ce4:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fa5ce8:	17ffffc3	b	0xfffff7fa5bf4
   0x0000fffff7fa5cec:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7fa5cf0:	17ffffc1	b	0xfffff7fa5bf4
   0x0000fffff7fa5cf4:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fa5cf8:	17ffffbf	b	0xfffff7fa5bf4
   0x0000fffff7fa5cfc:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7fa5d00:	17ffffbd	b	0xfffff7fa5bf4
   0x0000fffff7fa5d04:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7fa5d08:	17ffffbb	b	0xfffff7fa5bf4
   0x0000fffff7fa5d0c:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7fa5d10:	17ffffb9	b	0xfffff7fa5bf4
   0x0000fffff7fa5d14:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7fa5d18:	17ffffb7	b	0xfffff7fa5bf4
   0x0000fffff7fa5d1c:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7fa5d20:	17ffffb5	b	0xfffff7fa5bf4
   0x0000fffff7fa5d24:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7fa5d28:	17ffffb3	b	0xfffff7fa5bf4
   0x0000fffff7fa5d2c:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7fa5d30:	17ffffb1	b	0xfffff7fa5bf4
   0x0000fffff7fa5d34:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7fa5d38:	17ffffaf	b	0xfffff7fa5bf4
   0x0000fffff7fa5d3c:	00000000	udf	#0
   0x0000fffff7fa5d40:	00000000	udf	#0
   0x0000fffff7fa5d44:	00000000	udf	#0
   0x0000fffff7fa5d48:	00000000	udf	#0
   0x0000fffff7fa5d4c:	00000000	udf	#0
   0x0000fffff7fa5d50:	00000000	udf	#0
   0x0000fffff7fa5d54:	00000000	udf	#0
   0x0000fffff7fa5d58:	00000000	udf	#0
   0x0000fffff7fa5d5c:	00000000	udf	#0
   0x0000fffff7fa5d60:	00000000	udf	#0
   0x0000fffff7fa5d64:	00000000	udf	#0
   0x0000fffff7fa5d68:	00000000	udf	#0
   0x0000fffff7fa5d6c:	00000000	udf	#0
   0x0000fffff7fa5d70:	00000000	udf	#0
   0x0000fffff7fa5d74:	00000000	udf	#0
   0x0000fffff7fa5d78:	00000000	udf	#0
   0x0000fffff7fa5d7c:	00000000	udf	#0
   0x0000fffff7fa5d80:	00000000	udf	#0
   0x0000fffff7fa5d84:	00000000	udf	#0
   0x0000fffff7fa5d88:	00000000	udf	#0
   0x0000fffff7fa5d8c:	00000000	udf	#0
   0x0000fffff7fa5d90:	00000000	udf	#0
   0x0000fffff7fa5d94:	00000000	udf	#0
   0x0000fffff7fa5d98:	00000000	udf	#0
   0x0000fffff7fa5d9c:	00000000	udf	#0
   0x0000fffff7fa5da0:	00000000	udf	#0
   0x0000fffff7fa5da4:	00000000	udf	#0
   0x0000fffff7fa5da8:	00000000	udf	#0
   0x0000fffff7fa5dac:	00000000	udf	#0
   0x0000fffff7fa5db0:	00000000	udf	#0
   0x0000fffff7fa5db4:	00000000	udf	#0
   0x0000fffff7fa5db8:	00000000	udf	#0
   0x0000fffff7fa5dbc:	00000000	udf	#0
   0x0000fffff7fa5dc0:	00000000	udf	#0
   0x0000fffff7fa5dc4:	00000000	udf	#0
   0x0000fffff7fa5dc8:	00000000	udf	#0
   0x0000fffff7fa5dcc:	00000000	udf	#0
   0x0000fffff7fa5dd0:	00000000	udf	#0
   0x0000fffff7fa5dd4:	00000000	udf	#0
   0x0000fffff7fa5dd8:	00000000	udf	#0
   0x0000fffff7fa5ddc:	00000000	udf	#0
   0x0000fffff7fa5de0:	00000000	udf	#0
   0x0000fffff7fa5de4:	00000000	udf	#0
   0x0000fffff7fa5de8:	00000000	udf	#0
   0x0000fffff7fa5dec:	00000000	udf	#0
   0x0000fffff7fa5df0:	00000000	udf	#0
   0x0000fffff7fa5df4:	00000000	udf	#0
   0x0000fffff7fa5df8:	00000000	udf	#0
   0x0000fffff7fa5dfc:	00000000	udf	#0
   0x0000fffff7fa5e00:	00000000	udf	#0
   0x0000fffff7fa5e04:	00000000	udf	#0
   0x0000fffff7fa5e08:	00000000	udf	#0
   0x0000fffff7fa5e0c:	00000000	udf	#0
   0x0000fffff7fa5e10:	00000000	udf	#0
   0x0000fffff7fa5e14:	00000000	udf	#0
   0x0000fffff7fa5e18:	00000000	udf	#0
   0x0000fffff7fa5e1c:	00000000	udf	#0
   0x0000fffff7fa5e20:	00000000	udf	#0
   0x0000fffff7fa5e24:	00000000	udf	#0
   0x0000fffff7fa5e28:	00000000	udf	#0
   0x0000fffff7fa5e2c:	00000000	udf	#0
   0x0000fffff7fa5e30:	00000000	udf	#0
   0x0000fffff7fa5e34:	00000000	udf	#0
   0x0000fffff7fa5e38:	00000000	udf	#0
   0x0000fffff7fa5e3c:	00000000	udf	#0
   0x0000fffff7fa5e40:	00000000	udf	#0
   0x0000fffff7fa5e44:	00000000	udf	#0
   0x0000fffff7fa5e48:	00000000	udf	#0
   0x0000fffff7fa5e4c:	00000000	udf	#0
   0x0000fffff7fa5e50:	00000000	udf	#0
   0x0000fffff7fa5e54:	00000000	udf	#0
   0x0000fffff7fa5e58:	00000000	udf	#0
   0x0000fffff7fa5e5c:	00000000	udf	#0
   0x0000fffff7fa5e60:	00000000	udf	#0
   0x0000fffff7fa5e64:	00000000	udf	#0
   0x0000fffff7fa5e68:	00000000	udf	#0
   0x0000fffff7fa5e6c:	00000000	udf	#0
   0x0000fffff7fa5e70:	00000000	udf	#0
   0x0000fffff7fa5e74:	00000000	udf	#0
   0x0000fffff7fa5e78:	00000000	udf	#0
   0x0000fffff7fa5e7c:	00000000	udf	#0
   0x0000fffff7fa5e80:	00000000	udf	#0
   0x0000fffff7fa5e84:	00000000	udf	#0
   0x0000fffff7fa5e88:	00000000	udf	#0
   0x0000fffff7fa5e8c:	00000000	udf	#0
   0x0000fffff7fa5e90:	00000000	udf	#0
   0x0000fffff7fa5e94:	00000000	udf	#0
   0x0000fffff7fa5e98:	00000000	udf	#0
   0x0000fffff7fa5e9c:	00000000	udf	#0
   0x0000fffff7fa5ea0:	00000000	udf	#0
   0x0000fffff7fa5ea4:	00000000	udf	#0
   0x0000fffff7fa5ea8:	00000000	udf	#0
   0x0000fffff7fa5eac:	00000000	udf	#0
   0x0000fffff7fa5eb0:	00000000	udf	#0
   0x0000fffff7fa5eb4:	00000000	udf	#0
   0x0000fffff7fa5eb8:	00000000	udf	#0
   0x0000fffff7fa5ebc:	00000000	udf	#0
   0x0000fffff7fa5ec0:	00000000	udf	#0
   0x0000fffff7fa5ec4:	00000000	udf	#0
   0x0000fffff7fa5ec8:	00000000	udf	#0
   0x0000fffff7fa5ecc:	00000000	udf	#0
   0x0000fffff7fa5ed0:	00000000	udf	#0
   0x0000fffff7fa5ed4:	00000000	udf	#0
   0x0000fffff7fa5ed8:	00000000	udf	#0
   0x0000fffff7fa5edc:	00000000	udf	#0
   0x0000fffff7fa5ee0:	00000000	udf	#0
   0x0000fffff7fa5ee4:	00000000	udf	#0
   0x0000fffff7fa5ee8:	00000000	udf	#0
   0x0000fffff7fa5eec:	00000000	udf	#0
   0x0000fffff7fa5ef0:	00000000	udf	#0
   0x0000fffff7fa5ef4:	00000000	udf	#0
   0x0000fffff7fa5ef8:	00000000	udf	#0
   0x0000fffff7fa5efc:	00000000	udf	#0
   0x0000fffff7fa5f00:	00000000	udf	#0
   0x0000fffff7fa5f04:	00000000	udf	#0
   0x0000fffff7fa5f08:	00000000	udf	#0
   0x0000fffff7fa5f0c:	00000000	udf	#0
   0x0000fffff7fa5f10:	00000000	udf	#0
   0x0000fffff7fa5f14:	00000000	udf	#0
   0x0000fffff7fa5f18:	00000000	udf	#0
   0x0000fffff7fa5f1c:	00000000	udf	#0
   0x0000fffff7fa5f20:	00000000	udf	#0
   0x0000fffff7fa5f24:	00000000	udf	#0
   0x0000fffff7fa5f28:	00000000	udf	#0
   0x0000fffff7fa5f2c:	00000000	udf	#0
   0x0000fffff7fa5f30:	00000000	udf	#0
   0x0000fffff7fa5f34:	00000000	udf	#0
   0x0000fffff7fa5f38:	00000000	udf	#0
   0x0000fffff7fa5f3c:	00000000	udf	#0
   0x0000fffff7fa5f40:	00000000	udf	#0
   0x0000fffff7fa5f44:	00000000	udf	#0
   0x0000fffff7fa5f48:	00000000	udf	#0
   0x0000fffff7fa5f4c:	00000000	udf	#0
   0x0000fffff7fa5f50:	00000000	udf	#0
   0x0000fffff7fa5f54:	00000000	udf	#0
   0x0000fffff7fa5f58:	00000000	udf	#0
   0x0000fffff7fa5f5c:	00000000	udf	#0
   0x0000fffff7fa5f60:	00000000	udf	#0
   0x0000fffff7fa5f64:	00000000	udf	#0
   0x0000fffff7fa5f68:	00000000	udf	#0
   0x0000fffff7fa5f6c:	00000000	udf	#0
   0x0000fffff7fa5f70:	00000000	udf	#0
   0x0000fffff7fa5f74:	00000000	udf	#0
   0x0000fffff7fa5f78:	00000000	udf	#0
   0x0000fffff7fa5f7c:	00000000	udf	#0
   0x0000fffff7fa5f80:	00000000	udf	#0
   0x0000fffff7fa5f84:	00000000	udf	#0
   0x0000fffff7fa5f88:	00000000	udf	#0
   0x0000fffff7fa5f8c:	00000000	udf	#0
   0x0000fffff7fa5f90:	00000000	udf	#0
   0x0000fffff7fa5f94:	00000000	udf	#0
   0x0000fffff7fa5f98:	00000000	udf	#0
   0x0000fffff7fa5f9c:	00000000	udf	#0
   0x0000fffff7fa5fa0:	00000000	udf	#0
   0x0000fffff7fa5fa4:	00000000	udf	#0
   0x0000fffff7fa5fa8:	00000000	udf	#0
   0x0000fffff7fa5fac:	00000000	udf	#0
   0x0000fffff7fa5fb0:	00000000	udf	#0
   0x0000fffff7fa5fb4:	00000000	udf	#0
   0x0000fffff7fa5fb8:	00000000	udf	#0
   0x0000fffff7fa5fbc:	00000000	udf	#0
   0x0000fffff7fa5fc0:	00000000	udf	#0
   0x0000fffff7fa5fc4:	00000000	udf	#0
   0x0000fffff7fa5fc8:	00000000	udf	#0
   0x0000fffff7fa5fcc:	00000000	udf	#0
   0x0000fffff7fa5fd0:	00000000	udf	#0
   0x0000fffff7fa5fd4:	00000000	udf	#0
   0x0000fffff7fa5fd8:	00000000	udf	#0
   0x0000fffff7fa5fdc:	00000000	udf	#0
   0x0000fffff7fa5fe0:	00000000	udf	#0
   0x0000fffff7fa5fe4:	00000000	udf	#0
   0x0000fffff7fa5fe8:	00000000	udf	#0
   0x0000fffff7fa5fec:	00000000	udf	#0
   0x0000fffff7fa5ff0:	00000000	udf	#0
   0x0000fffff7fa5ff4:	00000000	udf	#0
   0x0000fffff7fa5ff8:	00000000	udf	#0
   0x0000fffff7fa5ffc:	00000000	udf	#0
End of assembler dump.
