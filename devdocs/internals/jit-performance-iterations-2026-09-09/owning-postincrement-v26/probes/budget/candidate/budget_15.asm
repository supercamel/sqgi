Dump of assembler code from 0xfffff7fa5000 to 0xfffff7fa7000:
   0x0000fffff7fa5000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fa5004:	910003fd	mov	x29, sp
   0x0000fffff7fa5008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fa500c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fa5010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fa5014:	aa0003f3	mov	x19, x0
   0x0000fffff7fa5018:	aa0103f4	mov	x20, x1
   0x0000fffff7fa501c:	aa0203f5	mov	x21, x2
   0x0000fffff7fa5020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fa5024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fa5028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fa502c:	f90003e9	str	x9, [sp]
   0x0000fffff7fa5030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fa5034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fa5038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fa503c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fa5040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5044:	d63f0200	blr	x16
   0x0000fffff7fa5048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fa504c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fa5050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fa5054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fa5058:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa505c:	37d800e9	tbnz	w9, #27, 0xfffff7fa5078
   0x0000fffff7fa5060:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fa5064:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5068:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa506c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa5070:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa5074:	1400000e	b	0xfffff7fa50ac
   0x0000fffff7fa5078:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa507c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5080:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5084:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5088:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fa508c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5090:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5094:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fa5098:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa509c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa50a0:	d63f0200	blr	x16
   0x0000fffff7fa50a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa50a8:	5400eea0	b.eq	0xfffff7fa6e7c  // b.none
   0x0000fffff7fa50ac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa50b0:	37d800e9	tbnz	w9, #27, 0xfffff7fa50cc
   0x0000fffff7fa50b4:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fa50b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa50bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa50c0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa50c4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa50c8:	1400000e	b	0xfffff7fa5100
   0x0000fffff7fa50cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa50d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa50d4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa50d8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa50dc:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fa50e0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa50e4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa50e8:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fa50ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa50f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa50f4:	d63f0200	blr	x16
   0x0000fffff7fa50f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa50fc:	5400ec40	b.eq	0xfffff7fa6e84  // b.none
   0x0000fffff7fa5100:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa5104:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5108:	aa1303e1	mov	x1, x19
   0x0000fffff7fa510c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5110:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fa5114:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5118:	aa1603e5	mov	x5, x22
   0x0000fffff7fa511c:	d2909810	mov	x16, #0x84c0                	// #33984
   0x0000fffff7fa5120:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa5124:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5128:	d63f0200	blr	x16
   0x0000fffff7fa512c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5130:	5400eae0	b.eq	0xfffff7fa6e8c  // b.none
   0x0000fffff7fa5134:	f100041f	cmp	x0, #0x1
   0x0000fffff7fa5138:	5400e6c0	b.eq	0xfffff7fa6e10  // b.none
   0x0000fffff7fa513c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa5140:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5144:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5148:	aa1503e2	mov	x2, x21
   0x0000fffff7fa514c:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7fa5150:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5154:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5158:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa515c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa5160:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5164:	d63f0200	blr	x16
   0x0000fffff7fa5168:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa516c:	5400e940	b.eq	0xfffff7fa6e94  // b.none
   0x0000fffff7fa5170:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa5174:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5178:	aa1303e1	mov	x1, x19
   0x0000fffff7fa517c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5180:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7fa5184:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5188:	aa1603e5	mov	x5, x22
   0x0000fffff7fa518c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa5190:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa5194:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5198:	d63f0200	blr	x16
   0x0000fffff7fa519c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa51a0:	5400e7e0	b.eq	0xfffff7fa6e9c  // b.none
   0x0000fffff7fa51a4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa51a8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa51ac:	540004a0	b.eq	0xfffff7fa5240  // b.none
   0x0000fffff7fa51b0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa51b4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa51b8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa51bc:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa51c0:	54000400	b.eq	0xfffff7fa5240  // b.none
   0x0000fffff7fa51c4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa51c8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa51cc:	36d801d1	tbz	w17, #27, 0xfffff7fa5204
   0x0000fffff7fa51d0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa51d4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa51d8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa51dc:	54000321	b.ne	0xfffff7fa5240  // b.any
   0x0000fffff7fa51e0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa51e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa51e8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa51ec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa51f0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa51f4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa51f8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa51fc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa5200:	54000209	b.ls	0xfffff7fa5240  // b.plast
   0x0000fffff7fa5204:	36d8008d	tbz	w13, #27, 0xfffff7fa5214
   0x0000fffff7fa5208:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa520c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa5210:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa5214:	36d80091	tbz	w17, #27, 0xfffff7fa5224
   0x0000fffff7fa5218:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa521c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa5220:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa5224:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa5228:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa522c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa5230:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa5234:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa5238:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa523c:	1400000e	b	0xfffff7fa5274
   0x0000fffff7fa5240:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa5244:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5248:	aa1303e1	mov	x1, x19
   0x0000fffff7fa524c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5250:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fa5254:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5258:	aa1603e5	mov	x5, x22
   0x0000fffff7fa525c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa5260:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa5264:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5268:	d63f0200	blr	x16
   0x0000fffff7fa526c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5270:	5400e1a0	b.eq	0xfffff7fa6ea4  // b.none
   0x0000fffff7fa5274:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa5278:	37d806a9	tbnz	w9, #27, 0xfffff7fa534c
   0x0000fffff7fa527c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa5280:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5284:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5288:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa528c:	540001c1	b.ne	0xfffff7fa52c4  // b.any
   0x0000fffff7fa5290:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa5294:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5298:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa529c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa52a0:	54000121	b.ne	0xfffff7fa52c4  // b.any
   0x0000fffff7fa52a4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa52a8:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa52ac:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa52b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa52b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa52b8:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa52bc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa52c0:	14000030	b	0xfffff7fa5380
   0x0000fffff7fa52c4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa52c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa52cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa52d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa52d4:	54000120	b.eq	0xfffff7fa52f8  // b.none
   0x0000fffff7fa52d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa52dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa52e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa52e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa52e8:	54000321	b.ne	0xfffff7fa534c  // b.any
   0x0000fffff7fa52ec:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa52f0:	9e620120	scvtf	d0, x9
   0x0000fffff7fa52f4:	14000002	b	0xfffff7fa52fc
   0x0000fffff7fa52f8:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa52fc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa5300:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5304:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5308:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa530c:	54000120	b.eq	0xfffff7fa5330  // b.none
   0x0000fffff7fa5310:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa5314:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5318:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa531c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5320:	54000161	b.ne	0xfffff7fa534c  // b.any
   0x0000fffff7fa5324:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa5328:	9e620121	scvtf	d1, x9
   0x0000fffff7fa532c:	14000002	b	0xfffff7fa5334
   0x0000fffff7fa5330:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa5334:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa5338:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa533c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5340:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5344:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa5348:	17ffffde	b	0xfffff7fa52c0
   0x0000fffff7fa534c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa5350:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5354:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5358:	aa1503e2	mov	x2, x21
   0x0000fffff7fa535c:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fa5360:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5364:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5368:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa536c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa5370:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5374:	d63f0200	blr	x16
   0x0000fffff7fa5378:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa537c:	5400d980	b.eq	0xfffff7fa6eac  // b.none
   0x0000fffff7fa5380:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa5384:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa5388:	540004a0	b.eq	0xfffff7fa541c  // b.none
   0x0000fffff7fa538c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa5390:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa5394:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa5398:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa539c:	54000400	b.eq	0xfffff7fa541c  // b.none
   0x0000fffff7fa53a0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa53a4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa53a8:	36d801d1	tbz	w17, #27, 0xfffff7fa53e0
   0x0000fffff7fa53ac:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa53b0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa53b4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa53b8:	54000321	b.ne	0xfffff7fa541c  // b.any
   0x0000fffff7fa53bc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa53c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa53c4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa53c8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa53cc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa53d0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa53d4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa53d8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa53dc:	54000209	b.ls	0xfffff7fa541c  // b.plast
   0x0000fffff7fa53e0:	36d8008d	tbz	w13, #27, 0xfffff7fa53f0
   0x0000fffff7fa53e4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa53e8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa53ec:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa53f0:	36d80091	tbz	w17, #27, 0xfffff7fa5400
   0x0000fffff7fa53f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa53f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa53fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa5400:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa5404:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa5408:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa540c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa5410:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa5414:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa5418:	1400000e	b	0xfffff7fa5450
   0x0000fffff7fa541c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa5420:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5424:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5428:	aa1503e2	mov	x2, x21
   0x0000fffff7fa542c:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fa5430:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5434:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5438:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa543c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa5440:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5444:	d63f0200	blr	x16
   0x0000fffff7fa5448:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa544c:	5400d340	b.eq	0xfffff7fa6eb4  // b.none
   0x0000fffff7fa5450:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa5454:	37d806a9	tbnz	w9, #27, 0xfffff7fa5528
   0x0000fffff7fa5458:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa545c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5460:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5464:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5468:	540001c1	b.ne	0xfffff7fa54a0  // b.any
   0x0000fffff7fa546c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa5470:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5474:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5478:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa547c:	54000121	b.ne	0xfffff7fa54a0  // b.any
   0x0000fffff7fa5480:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa5484:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa5488:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa548c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5490:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5494:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa5498:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa549c:	14000030	b	0xfffff7fa555c
   0x0000fffff7fa54a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa54a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa54a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa54ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa54b0:	54000120	b.eq	0xfffff7fa54d4  // b.none
   0x0000fffff7fa54b4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa54b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa54bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa54c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa54c4:	54000321	b.ne	0xfffff7fa5528  // b.any
   0x0000fffff7fa54c8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa54cc:	9e620120	scvtf	d0, x9
   0x0000fffff7fa54d0:	14000002	b	0xfffff7fa54d8
   0x0000fffff7fa54d4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa54d8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa54dc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa54e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa54e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa54e8:	54000120	b.eq	0xfffff7fa550c  // b.none
   0x0000fffff7fa54ec:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa54f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa54f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa54f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa54fc:	54000161	b.ne	0xfffff7fa5528  // b.any
   0x0000fffff7fa5500:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa5504:	9e620121	scvtf	d1, x9
   0x0000fffff7fa5508:	14000002	b	0xfffff7fa5510
   0x0000fffff7fa550c:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa5510:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa5514:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa5518:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa551c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5520:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa5524:	17ffffde	b	0xfffff7fa549c
   0x0000fffff7fa5528:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa552c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5530:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5534:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5538:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fa553c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5540:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5544:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa5548:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa554c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5550:	d63f0200	blr	x16
   0x0000fffff7fa5554:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5558:	5400cb20	b.eq	0xfffff7fa6ebc  // b.none
   0x0000fffff7fa555c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa5560:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa5564:	540004a0	b.eq	0xfffff7fa55f8  // b.none
   0x0000fffff7fa5568:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa556c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa5570:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa5574:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa5578:	54000400	b.eq	0xfffff7fa55f8  // b.none
   0x0000fffff7fa557c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa5580:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa5584:	36d801d1	tbz	w17, #27, 0xfffff7fa55bc
   0x0000fffff7fa5588:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa558c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa5590:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa5594:	54000321	b.ne	0xfffff7fa55f8  // b.any
   0x0000fffff7fa5598:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa559c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa55a0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa55a4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa55a8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa55ac:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa55b0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa55b4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa55b8:	54000209	b.ls	0xfffff7fa55f8  // b.plast
   0x0000fffff7fa55bc:	36d8008d	tbz	w13, #27, 0xfffff7fa55cc
   0x0000fffff7fa55c0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa55c4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa55c8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa55cc:	36d80091	tbz	w17, #27, 0xfffff7fa55dc
   0x0000fffff7fa55d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa55d4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa55d8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa55dc:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa55e0:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa55e4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa55e8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa55ec:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa55f0:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa55f4:	1400000e	b	0xfffff7fa562c
   0x0000fffff7fa55f8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa55fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5600:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5604:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5608:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fa560c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5610:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5614:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa5618:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa561c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5620:	d63f0200	blr	x16
   0x0000fffff7fa5624:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5628:	5400c4e0	b.eq	0xfffff7fa6ec4  // b.none
   0x0000fffff7fa562c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa5630:	37d806a9	tbnz	w9, #27, 0xfffff7fa5704
   0x0000fffff7fa5634:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa5638:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa563c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5640:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5644:	540001c1	b.ne	0xfffff7fa567c  // b.any
   0x0000fffff7fa5648:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa564c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5650:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5654:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5658:	54000121	b.ne	0xfffff7fa567c  // b.any
   0x0000fffff7fa565c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa5660:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa5664:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa5668:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa566c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5670:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa5674:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa5678:	14000030	b	0xfffff7fa5738
   0x0000fffff7fa567c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa5680:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5684:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5688:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa568c:	54000120	b.eq	0xfffff7fa56b0  // b.none
   0x0000fffff7fa5690:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa5694:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5698:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa569c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa56a0:	54000321	b.ne	0xfffff7fa5704  // b.any
   0x0000fffff7fa56a4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa56a8:	9e620120	scvtf	d0, x9
   0x0000fffff7fa56ac:	14000002	b	0xfffff7fa56b4
   0x0000fffff7fa56b0:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa56b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa56b8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa56bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa56c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa56c4:	54000120	b.eq	0xfffff7fa56e8  // b.none
   0x0000fffff7fa56c8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa56cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa56d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa56d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa56d8:	54000161	b.ne	0xfffff7fa5704  // b.any
   0x0000fffff7fa56dc:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa56e0:	9e620121	scvtf	d1, x9
   0x0000fffff7fa56e4:	14000002	b	0xfffff7fa56ec
   0x0000fffff7fa56e8:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa56ec:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa56f0:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa56f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa56f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa56fc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa5700:	17ffffde	b	0xfffff7fa5678
   0x0000fffff7fa5704:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa5708:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa570c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5710:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5714:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fa5718:	aa1403e4	mov	x4, x20
   0x0000fffff7fa571c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5720:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa5724:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa5728:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa572c:	d63f0200	blr	x16
   0x0000fffff7fa5730:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5734:	5400bcc0	b.eq	0xfffff7fa6ecc  // b.none
   0x0000fffff7fa5738:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa573c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa5740:	540004a0	b.eq	0xfffff7fa57d4  // b.none
   0x0000fffff7fa5744:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa5748:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa574c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa5750:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa5754:	54000400	b.eq	0xfffff7fa57d4  // b.none
   0x0000fffff7fa5758:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa575c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa5760:	36d801d1	tbz	w17, #27, 0xfffff7fa5798
   0x0000fffff7fa5764:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa5768:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa576c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa5770:	54000321	b.ne	0xfffff7fa57d4  // b.any
   0x0000fffff7fa5774:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa5778:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa577c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa5780:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa5784:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa5788:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa578c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa5790:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa5794:	54000209	b.ls	0xfffff7fa57d4  // b.plast
   0x0000fffff7fa5798:	36d8008d	tbz	w13, #27, 0xfffff7fa57a8
   0x0000fffff7fa579c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa57a0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa57a4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa57a8:	36d80091	tbz	w17, #27, 0xfffff7fa57b8
   0x0000fffff7fa57ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa57b0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa57b4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa57b8:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa57bc:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa57c0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa57c4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa57c8:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa57cc:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa57d0:	1400000e	b	0xfffff7fa5808
   0x0000fffff7fa57d4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa57d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa57dc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa57e0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa57e4:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fa57e8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa57ec:	aa1603e5	mov	x5, x22
   0x0000fffff7fa57f0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa57f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa57f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa57fc:	d63f0200	blr	x16
   0x0000fffff7fa5800:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5804:	5400b680	b.eq	0xfffff7fa6ed4  // b.none
   0x0000fffff7fa5808:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa580c:	37d806a9	tbnz	w9, #27, 0xfffff7fa58e0
   0x0000fffff7fa5810:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa5814:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5818:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa581c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5820:	540001c1	b.ne	0xfffff7fa5858  // b.any
   0x0000fffff7fa5824:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa5828:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa582c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5830:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5834:	54000121	b.ne	0xfffff7fa5858  // b.any
   0x0000fffff7fa5838:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa583c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa5840:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa5844:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5848:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa584c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa5850:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa5854:	14000030	b	0xfffff7fa5914
   0x0000fffff7fa5858:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa585c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5860:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5864:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5868:	54000120	b.eq	0xfffff7fa588c  // b.none
   0x0000fffff7fa586c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa5870:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5874:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5878:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa587c:	54000321	b.ne	0xfffff7fa58e0  // b.any
   0x0000fffff7fa5880:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa5884:	9e620120	scvtf	d0, x9
   0x0000fffff7fa5888:	14000002	b	0xfffff7fa5890
   0x0000fffff7fa588c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa5890:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa5894:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5898:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa589c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa58a0:	54000120	b.eq	0xfffff7fa58c4  // b.none
   0x0000fffff7fa58a4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa58a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa58ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa58b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa58b4:	54000161	b.ne	0xfffff7fa58e0  // b.any
   0x0000fffff7fa58b8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa58bc:	9e620121	scvtf	d1, x9
   0x0000fffff7fa58c0:	14000002	b	0xfffff7fa58c8
   0x0000fffff7fa58c4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa58c8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa58cc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa58d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa58d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa58d8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa58dc:	17ffffde	b	0xfffff7fa5854
   0x0000fffff7fa58e0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa58e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa58e8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa58ec:	aa1503e2	mov	x2, x21
   0x0000fffff7fa58f0:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fa58f4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa58f8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa58fc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa5900:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa5904:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5908:	d63f0200	blr	x16
   0x0000fffff7fa590c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5910:	5400ae60	b.eq	0xfffff7fa6edc  // b.none
   0x0000fffff7fa5914:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa5918:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa591c:	540004a0	b.eq	0xfffff7fa59b0  // b.none
   0x0000fffff7fa5920:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa5924:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa5928:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa592c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa5930:	54000400	b.eq	0xfffff7fa59b0  // b.none
   0x0000fffff7fa5934:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa5938:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa593c:	36d801d1	tbz	w17, #27, 0xfffff7fa5974
   0x0000fffff7fa5940:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa5944:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa5948:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa594c:	54000321	b.ne	0xfffff7fa59b0  // b.any
   0x0000fffff7fa5950:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa5954:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa5958:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa595c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa5960:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa5964:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa5968:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa596c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa5970:	54000209	b.ls	0xfffff7fa59b0  // b.plast
   0x0000fffff7fa5974:	36d8008d	tbz	w13, #27, 0xfffff7fa5984
   0x0000fffff7fa5978:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa597c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa5980:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa5984:	36d80091	tbz	w17, #27, 0xfffff7fa5994
   0x0000fffff7fa5988:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa598c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa5990:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa5994:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa5998:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa599c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa59a0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa59a4:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa59a8:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa59ac:	1400000e	b	0xfffff7fa59e4
   0x0000fffff7fa59b0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa59b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa59b8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa59bc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa59c0:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fa59c4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa59c8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa59cc:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa59d0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa59d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa59d8:	d63f0200	blr	x16
   0x0000fffff7fa59dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa59e0:	5400a820	b.eq	0xfffff7fa6ee4  // b.none
   0x0000fffff7fa59e4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa59e8:	37d806a9	tbnz	w9, #27, 0xfffff7fa5abc
   0x0000fffff7fa59ec:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa59f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa59f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa59f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa59fc:	540001c1	b.ne	0xfffff7fa5a34  // b.any
   0x0000fffff7fa5a00:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa5a04:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5a08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5a0c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5a10:	54000121	b.ne	0xfffff7fa5a34  // b.any
   0x0000fffff7fa5a14:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa5a18:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa5a1c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa5a20:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5a24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5a28:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa5a2c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa5a30:	14000030	b	0xfffff7fa5af0
   0x0000fffff7fa5a34:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa5a38:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5a3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5a40:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5a44:	54000120	b.eq	0xfffff7fa5a68  // b.none
   0x0000fffff7fa5a48:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa5a4c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5a50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5a54:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5a58:	54000321	b.ne	0xfffff7fa5abc  // b.any
   0x0000fffff7fa5a5c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa5a60:	9e620120	scvtf	d0, x9
   0x0000fffff7fa5a64:	14000002	b	0xfffff7fa5a6c
   0x0000fffff7fa5a68:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa5a6c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa5a70:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5a74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5a78:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5a7c:	54000120	b.eq	0xfffff7fa5aa0  // b.none
   0x0000fffff7fa5a80:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa5a84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5a88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5a8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5a90:	54000161	b.ne	0xfffff7fa5abc  // b.any
   0x0000fffff7fa5a94:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa5a98:	9e620121	scvtf	d1, x9
   0x0000fffff7fa5a9c:	14000002	b	0xfffff7fa5aa4
   0x0000fffff7fa5aa0:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa5aa4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa5aa8:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa5aac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5ab0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5ab4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa5ab8:	17ffffde	b	0xfffff7fa5a30
   0x0000fffff7fa5abc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa5ac0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5ac4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5ac8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5acc:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fa5ad0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5ad4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5ad8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa5adc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa5ae0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5ae4:	d63f0200	blr	x16
   0x0000fffff7fa5ae8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5aec:	5400a000	b.eq	0xfffff7fa6eec  // b.none
   0x0000fffff7fa5af0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa5af4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa5af8:	540004a0	b.eq	0xfffff7fa5b8c  // b.none
   0x0000fffff7fa5afc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa5b00:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa5b04:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa5b08:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa5b0c:	54000400	b.eq	0xfffff7fa5b8c  // b.none
   0x0000fffff7fa5b10:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa5b14:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa5b18:	36d801d1	tbz	w17, #27, 0xfffff7fa5b50
   0x0000fffff7fa5b1c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa5b20:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa5b24:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa5b28:	54000321	b.ne	0xfffff7fa5b8c  // b.any
   0x0000fffff7fa5b2c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa5b30:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa5b34:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa5b38:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa5b3c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa5b40:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa5b44:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa5b48:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa5b4c:	54000209	b.ls	0xfffff7fa5b8c  // b.plast
   0x0000fffff7fa5b50:	36d8008d	tbz	w13, #27, 0xfffff7fa5b60
   0x0000fffff7fa5b54:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa5b58:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa5b5c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa5b60:	36d80091	tbz	w17, #27, 0xfffff7fa5b70
   0x0000fffff7fa5b64:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa5b68:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa5b6c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa5b70:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa5b74:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa5b78:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa5b7c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa5b80:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa5b84:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa5b88:	1400000e	b	0xfffff7fa5bc0
   0x0000fffff7fa5b8c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa5b90:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5b94:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5b98:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5b9c:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fa5ba0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5ba4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5ba8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa5bac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa5bb0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5bb4:	d63f0200	blr	x16
   0x0000fffff7fa5bb8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5bbc:	540099c0	b.eq	0xfffff7fa6ef4  // b.none
   0x0000fffff7fa5bc0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa5bc4:	37d806a9	tbnz	w9, #27, 0xfffff7fa5c98
   0x0000fffff7fa5bc8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa5bcc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5bd0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5bd4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5bd8:	540001c1	b.ne	0xfffff7fa5c10  // b.any
   0x0000fffff7fa5bdc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa5be0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5be4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5be8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5bec:	54000121	b.ne	0xfffff7fa5c10  // b.any
   0x0000fffff7fa5bf0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa5bf4:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa5bf8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa5bfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5c00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5c04:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa5c08:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa5c0c:	14000030	b	0xfffff7fa5ccc
   0x0000fffff7fa5c10:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa5c14:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5c18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5c1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5c20:	54000120	b.eq	0xfffff7fa5c44  // b.none
   0x0000fffff7fa5c24:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa5c28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5c2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5c30:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5c34:	54000321	b.ne	0xfffff7fa5c98  // b.any
   0x0000fffff7fa5c38:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa5c3c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa5c40:	14000002	b	0xfffff7fa5c48
   0x0000fffff7fa5c44:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa5c48:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa5c4c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5c50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5c54:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5c58:	54000120	b.eq	0xfffff7fa5c7c  // b.none
   0x0000fffff7fa5c5c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa5c60:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5c64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5c68:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5c6c:	54000161	b.ne	0xfffff7fa5c98  // b.any
   0x0000fffff7fa5c70:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa5c74:	9e620121	scvtf	d1, x9
   0x0000fffff7fa5c78:	14000002	b	0xfffff7fa5c80
   0x0000fffff7fa5c7c:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa5c80:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa5c84:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa5c88:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5c8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5c90:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa5c94:	17ffffde	b	0xfffff7fa5c0c
   0x0000fffff7fa5c98:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa5c9c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5ca0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5ca4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5ca8:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fa5cac:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5cb0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5cb4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa5cb8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa5cbc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5cc0:	d63f0200	blr	x16
   0x0000fffff7fa5cc4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5cc8:	540091a0	b.eq	0xfffff7fa6efc  // b.none
   0x0000fffff7fa5ccc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa5cd0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa5cd4:	540004a0	b.eq	0xfffff7fa5d68  // b.none
   0x0000fffff7fa5cd8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa5cdc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa5ce0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa5ce4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa5ce8:	54000400	b.eq	0xfffff7fa5d68  // b.none
   0x0000fffff7fa5cec:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa5cf0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa5cf4:	36d801d1	tbz	w17, #27, 0xfffff7fa5d2c
   0x0000fffff7fa5cf8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa5cfc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa5d00:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa5d04:	54000321	b.ne	0xfffff7fa5d68  // b.any
   0x0000fffff7fa5d08:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa5d0c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa5d10:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa5d14:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa5d18:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa5d1c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa5d20:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa5d24:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa5d28:	54000209	b.ls	0xfffff7fa5d68  // b.plast
   0x0000fffff7fa5d2c:	36d8008d	tbz	w13, #27, 0xfffff7fa5d3c
   0x0000fffff7fa5d30:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa5d34:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa5d38:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa5d3c:	36d80091	tbz	w17, #27, 0xfffff7fa5d4c
   0x0000fffff7fa5d40:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa5d44:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa5d48:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa5d4c:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa5d50:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa5d54:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa5d58:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa5d5c:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa5d60:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa5d64:	1400000e	b	0xfffff7fa5d9c
   0x0000fffff7fa5d68:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa5d6c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5d70:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5d74:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5d78:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fa5d7c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5d80:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5d84:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa5d88:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa5d8c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5d90:	d63f0200	blr	x16
   0x0000fffff7fa5d94:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5d98:	54008b60	b.eq	0xfffff7fa6f04  // b.none
   0x0000fffff7fa5d9c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa5da0:	37d806a9	tbnz	w9, #27, 0xfffff7fa5e74
   0x0000fffff7fa5da4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa5da8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5dac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5db0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5db4:	540001c1	b.ne	0xfffff7fa5dec  // b.any
   0x0000fffff7fa5db8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa5dbc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5dc0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5dc4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5dc8:	54000121	b.ne	0xfffff7fa5dec  // b.any
   0x0000fffff7fa5dcc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa5dd0:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa5dd4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa5dd8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5ddc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5de0:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa5de4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa5de8:	14000030	b	0xfffff7fa5ea8
   0x0000fffff7fa5dec:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa5df0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5df4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5df8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5dfc:	54000120	b.eq	0xfffff7fa5e20  // b.none
   0x0000fffff7fa5e00:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa5e04:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5e08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5e0c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5e10:	54000321	b.ne	0xfffff7fa5e74  // b.any
   0x0000fffff7fa5e14:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa5e18:	9e620120	scvtf	d0, x9
   0x0000fffff7fa5e1c:	14000002	b	0xfffff7fa5e24
   0x0000fffff7fa5e20:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa5e24:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa5e28:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5e2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5e30:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5e34:	54000120	b.eq	0xfffff7fa5e58  // b.none
   0x0000fffff7fa5e38:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa5e3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5e40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5e44:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5e48:	54000161	b.ne	0xfffff7fa5e74  // b.any
   0x0000fffff7fa5e4c:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa5e50:	9e620121	scvtf	d1, x9
   0x0000fffff7fa5e54:	14000002	b	0xfffff7fa5e5c
   0x0000fffff7fa5e58:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa5e5c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa5e60:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa5e64:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5e68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5e6c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa5e70:	17ffffde	b	0xfffff7fa5de8
   0x0000fffff7fa5e74:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa5e78:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5e7c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5e80:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5e84:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fa5e88:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5e8c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5e90:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa5e94:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa5e98:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5e9c:	d63f0200	blr	x16
   0x0000fffff7fa5ea0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5ea4:	54008340	b.eq	0xfffff7fa6f0c  // b.none
   0x0000fffff7fa5ea8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa5eac:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa5eb0:	540004a0	b.eq	0xfffff7fa5f44  // b.none
   0x0000fffff7fa5eb4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa5eb8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa5ebc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa5ec0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa5ec4:	54000400	b.eq	0xfffff7fa5f44  // b.none
   0x0000fffff7fa5ec8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa5ecc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa5ed0:	36d801d1	tbz	w17, #27, 0xfffff7fa5f08
   0x0000fffff7fa5ed4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa5ed8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa5edc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa5ee0:	54000321	b.ne	0xfffff7fa5f44  // b.any
   0x0000fffff7fa5ee4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa5ee8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa5eec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa5ef0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa5ef4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa5ef8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa5efc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa5f00:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa5f04:	54000209	b.ls	0xfffff7fa5f44  // b.plast
   0x0000fffff7fa5f08:	36d8008d	tbz	w13, #27, 0xfffff7fa5f18
   0x0000fffff7fa5f0c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa5f10:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa5f14:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa5f18:	36d80091	tbz	w17, #27, 0xfffff7fa5f28
   0x0000fffff7fa5f1c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa5f20:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa5f24:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa5f28:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa5f2c:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa5f30:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa5f34:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa5f38:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa5f3c:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa5f40:	1400000e	b	0xfffff7fa5f78
   0x0000fffff7fa5f44:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa5f48:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa5f4c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa5f50:	aa1503e2	mov	x2, x21
   0x0000fffff7fa5f54:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fa5f58:	aa1403e4	mov	x4, x20
   0x0000fffff7fa5f5c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa5f60:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa5f64:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa5f68:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa5f6c:	d63f0200	blr	x16
   0x0000fffff7fa5f70:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa5f74:	54007d00	b.eq	0xfffff7fa6f14  // b.none
   0x0000fffff7fa5f78:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa5f7c:	37d806a9	tbnz	w9, #27, 0xfffff7fa6050
   0x0000fffff7fa5f80:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa5f84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5f88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5f8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5f90:	540001c1	b.ne	0xfffff7fa5fc8  // b.any
   0x0000fffff7fa5f94:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa5f98:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5f9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5fa0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5fa4:	54000121	b.ne	0xfffff7fa5fc8  // b.any
   0x0000fffff7fa5fa8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa5fac:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa5fb0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa5fb4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5fb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5fbc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa5fc0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa5fc4:	14000030	b	0xfffff7fa6084
   0x0000fffff7fa5fc8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa5fcc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa5fd0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5fd4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5fd8:	54000120	b.eq	0xfffff7fa5ffc  // b.none
   0x0000fffff7fa5fdc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa5fe0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa5fe4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa5fe8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa5fec:	54000321	b.ne	0xfffff7fa6050  // b.any
   0x0000fffff7fa5ff0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa5ff4:	9e620120	scvtf	d0, x9
   0x0000fffff7fa5ff8:	14000002	b	0xfffff7fa6000
   0x0000fffff7fa5ffc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa6000:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa6004:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6008:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa600c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6010:	54000120	b.eq	0xfffff7fa6034  // b.none
   0x0000fffff7fa6014:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa6018:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa601c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6020:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6024:	54000161	b.ne	0xfffff7fa6050  // b.any
   0x0000fffff7fa6028:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa602c:	9e620121	scvtf	d1, x9
   0x0000fffff7fa6030:	14000002	b	0xfffff7fa6038
   0x0000fffff7fa6034:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa6038:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa603c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa6040:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6044:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6048:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa604c:	17ffffde	b	0xfffff7fa5fc4
   0x0000fffff7fa6050:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa6054:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6058:	aa1303e1	mov	x1, x19
   0x0000fffff7fa605c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6060:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fa6064:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6068:	aa1603e5	mov	x5, x22
   0x0000fffff7fa606c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa6070:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa6074:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6078:	d63f0200	blr	x16
   0x0000fffff7fa607c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6080:	540074e0	b.eq	0xfffff7fa6f1c  // b.none
   0x0000fffff7fa6084:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa6088:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa608c:	540004a0	b.eq	0xfffff7fa6120  // b.none
   0x0000fffff7fa6090:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa6094:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa6098:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa609c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa60a0:	54000400	b.eq	0xfffff7fa6120  // b.none
   0x0000fffff7fa60a4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa60a8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa60ac:	36d801d1	tbz	w17, #27, 0xfffff7fa60e4
   0x0000fffff7fa60b0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa60b4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa60b8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa60bc:	54000321	b.ne	0xfffff7fa6120  // b.any
   0x0000fffff7fa60c0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa60c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa60c8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa60cc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa60d0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa60d4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa60d8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa60dc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa60e0:	54000209	b.ls	0xfffff7fa6120  // b.plast
   0x0000fffff7fa60e4:	36d8008d	tbz	w13, #27, 0xfffff7fa60f4
   0x0000fffff7fa60e8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa60ec:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa60f0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa60f4:	36d80091	tbz	w17, #27, 0xfffff7fa6104
   0x0000fffff7fa60f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa60fc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa6100:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa6104:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa6108:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa610c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa6110:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa6114:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa6118:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa611c:	1400000e	b	0xfffff7fa6154
   0x0000fffff7fa6120:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa6124:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6128:	aa1303e1	mov	x1, x19
   0x0000fffff7fa612c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6130:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fa6134:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6138:	aa1603e5	mov	x5, x22
   0x0000fffff7fa613c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa6140:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa6144:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6148:	d63f0200	blr	x16
   0x0000fffff7fa614c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6150:	54006ea0	b.eq	0xfffff7fa6f24  // b.none
   0x0000fffff7fa6154:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6158:	37d806a9	tbnz	w9, #27, 0xfffff7fa622c
   0x0000fffff7fa615c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6160:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6164:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6168:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa616c:	540001c1	b.ne	0xfffff7fa61a4  // b.any
   0x0000fffff7fa6170:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa6174:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6178:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa617c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6180:	54000121	b.ne	0xfffff7fa61a4  // b.any
   0x0000fffff7fa6184:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa6188:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa618c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa6190:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6194:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6198:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa619c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa61a0:	14000030	b	0xfffff7fa6260
   0x0000fffff7fa61a4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa61a8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa61ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa61b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa61b4:	54000120	b.eq	0xfffff7fa61d8  // b.none
   0x0000fffff7fa61b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa61bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa61c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa61c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa61c8:	54000321	b.ne	0xfffff7fa622c  // b.any
   0x0000fffff7fa61cc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa61d0:	9e620120	scvtf	d0, x9
   0x0000fffff7fa61d4:	14000002	b	0xfffff7fa61dc
   0x0000fffff7fa61d8:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa61dc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa61e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa61e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa61e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa61ec:	54000120	b.eq	0xfffff7fa6210  // b.none
   0x0000fffff7fa61f0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa61f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa61f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa61fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6200:	54000161	b.ne	0xfffff7fa622c  // b.any
   0x0000fffff7fa6204:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa6208:	9e620121	scvtf	d1, x9
   0x0000fffff7fa620c:	14000002	b	0xfffff7fa6214
   0x0000fffff7fa6210:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa6214:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa6218:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa621c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6220:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6224:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa6228:	17ffffde	b	0xfffff7fa61a0
   0x0000fffff7fa622c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa6230:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6234:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6238:	aa1503e2	mov	x2, x21
   0x0000fffff7fa623c:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fa6240:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6244:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6248:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa624c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa6250:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6254:	d63f0200	blr	x16
   0x0000fffff7fa6258:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa625c:	54006680	b.eq	0xfffff7fa6f2c  // b.none
   0x0000fffff7fa6260:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa6264:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa6268:	540004a0	b.eq	0xfffff7fa62fc  // b.none
   0x0000fffff7fa626c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa6270:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa6274:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa6278:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa627c:	54000400	b.eq	0xfffff7fa62fc  // b.none
   0x0000fffff7fa6280:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa6284:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa6288:	36d801d1	tbz	w17, #27, 0xfffff7fa62c0
   0x0000fffff7fa628c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa6290:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa6294:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa6298:	54000321	b.ne	0xfffff7fa62fc  // b.any
   0x0000fffff7fa629c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa62a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa62a4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa62a8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa62ac:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa62b0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa62b4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa62b8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa62bc:	54000209	b.ls	0xfffff7fa62fc  // b.plast
   0x0000fffff7fa62c0:	36d8008d	tbz	w13, #27, 0xfffff7fa62d0
   0x0000fffff7fa62c4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa62c8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa62cc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa62d0:	36d80091	tbz	w17, #27, 0xfffff7fa62e0
   0x0000fffff7fa62d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa62d8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa62dc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa62e0:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa62e4:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa62e8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa62ec:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa62f0:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa62f4:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa62f8:	1400000e	b	0xfffff7fa6330
   0x0000fffff7fa62fc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa6300:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6304:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6308:	aa1503e2	mov	x2, x21
   0x0000fffff7fa630c:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fa6310:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6314:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6318:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa631c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa6320:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6324:	d63f0200	blr	x16
   0x0000fffff7fa6328:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa632c:	54006040	b.eq	0xfffff7fa6f34  // b.none
   0x0000fffff7fa6330:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6334:	37d806a9	tbnz	w9, #27, 0xfffff7fa6408
   0x0000fffff7fa6338:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa633c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6340:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6344:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6348:	540001c1	b.ne	0xfffff7fa6380  // b.any
   0x0000fffff7fa634c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa6350:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6354:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6358:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa635c:	54000121	b.ne	0xfffff7fa6380  // b.any
   0x0000fffff7fa6360:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa6364:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa6368:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa636c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6370:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6374:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa6378:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa637c:	14000030	b	0xfffff7fa643c
   0x0000fffff7fa6380:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6384:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6388:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa638c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6390:	54000120	b.eq	0xfffff7fa63b4  // b.none
   0x0000fffff7fa6394:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6398:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa639c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa63a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa63a4:	54000321	b.ne	0xfffff7fa6408  // b.any
   0x0000fffff7fa63a8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa63ac:	9e620120	scvtf	d0, x9
   0x0000fffff7fa63b0:	14000002	b	0xfffff7fa63b8
   0x0000fffff7fa63b4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa63b8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa63bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa63c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa63c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa63c8:	54000120	b.eq	0xfffff7fa63ec  // b.none
   0x0000fffff7fa63cc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa63d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa63d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa63d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa63dc:	54000161	b.ne	0xfffff7fa6408  // b.any
   0x0000fffff7fa63e0:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa63e4:	9e620121	scvtf	d1, x9
   0x0000fffff7fa63e8:	14000002	b	0xfffff7fa63f0
   0x0000fffff7fa63ec:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa63f0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa63f4:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa63f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa63fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6400:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa6404:	17ffffde	b	0xfffff7fa637c
   0x0000fffff7fa6408:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa640c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6410:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6414:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6418:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fa641c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6420:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6424:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa6428:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa642c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6430:	d63f0200	blr	x16
   0x0000fffff7fa6434:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6438:	54005820	b.eq	0xfffff7fa6f3c  // b.none
   0x0000fffff7fa643c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa6440:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa6444:	540004a0	b.eq	0xfffff7fa64d8  // b.none
   0x0000fffff7fa6448:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa644c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa6450:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa6454:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa6458:	54000400	b.eq	0xfffff7fa64d8  // b.none
   0x0000fffff7fa645c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa6460:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa6464:	36d801d1	tbz	w17, #27, 0xfffff7fa649c
   0x0000fffff7fa6468:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa646c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa6470:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa6474:	54000321	b.ne	0xfffff7fa64d8  // b.any
   0x0000fffff7fa6478:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa647c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6480:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa6484:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa6488:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa648c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa6490:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa6494:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa6498:	54000209	b.ls	0xfffff7fa64d8  // b.plast
   0x0000fffff7fa649c:	36d8008d	tbz	w13, #27, 0xfffff7fa64ac
   0x0000fffff7fa64a0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa64a4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa64a8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa64ac:	36d80091	tbz	w17, #27, 0xfffff7fa64bc
   0x0000fffff7fa64b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa64b4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa64b8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa64bc:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa64c0:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa64c4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa64c8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa64cc:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa64d0:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa64d4:	1400000e	b	0xfffff7fa650c
   0x0000fffff7fa64d8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa64dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa64e0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa64e4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa64e8:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fa64ec:	aa1403e4	mov	x4, x20
   0x0000fffff7fa64f0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa64f4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa64f8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa64fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6500:	d63f0200	blr	x16
   0x0000fffff7fa6504:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6508:	540051e0	b.eq	0xfffff7fa6f44  // b.none
   0x0000fffff7fa650c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6510:	37d806a9	tbnz	w9, #27, 0xfffff7fa65e4
   0x0000fffff7fa6514:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6518:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa651c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6520:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6524:	540001c1	b.ne	0xfffff7fa655c  // b.any
   0x0000fffff7fa6528:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa652c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6530:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6534:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6538:	54000121	b.ne	0xfffff7fa655c  // b.any
   0x0000fffff7fa653c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa6540:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa6544:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa6548:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa654c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6550:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa6554:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa6558:	14000030	b	0xfffff7fa6618
   0x0000fffff7fa655c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6560:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6564:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6568:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa656c:	54000120	b.eq	0xfffff7fa6590  // b.none
   0x0000fffff7fa6570:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6574:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6578:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa657c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6580:	54000321	b.ne	0xfffff7fa65e4  // b.any
   0x0000fffff7fa6584:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa6588:	9e620120	scvtf	d0, x9
   0x0000fffff7fa658c:	14000002	b	0xfffff7fa6594
   0x0000fffff7fa6590:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa6594:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa6598:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa659c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa65a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa65a4:	54000120	b.eq	0xfffff7fa65c8  // b.none
   0x0000fffff7fa65a8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa65ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa65b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa65b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa65b8:	54000161	b.ne	0xfffff7fa65e4  // b.any
   0x0000fffff7fa65bc:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa65c0:	9e620121	scvtf	d1, x9
   0x0000fffff7fa65c4:	14000002	b	0xfffff7fa65cc
   0x0000fffff7fa65c8:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa65cc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa65d0:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa65d4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa65d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa65dc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa65e0:	17ffffde	b	0xfffff7fa6558
   0x0000fffff7fa65e4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa65e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa65ec:	aa1303e1	mov	x1, x19
   0x0000fffff7fa65f0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa65f4:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fa65f8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa65fc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6600:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa6604:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa6608:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa660c:	d63f0200	blr	x16
   0x0000fffff7fa6610:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6614:	540049c0	b.eq	0xfffff7fa6f4c  // b.none
   0x0000fffff7fa6618:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa661c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa6620:	540004a0	b.eq	0xfffff7fa66b4  // b.none
   0x0000fffff7fa6624:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa6628:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa662c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa6630:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa6634:	54000400	b.eq	0xfffff7fa66b4  // b.none
   0x0000fffff7fa6638:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa663c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa6640:	36d801d1	tbz	w17, #27, 0xfffff7fa6678
   0x0000fffff7fa6644:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa6648:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa664c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa6650:	54000321	b.ne	0xfffff7fa66b4  // b.any
   0x0000fffff7fa6654:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa6658:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa665c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa6660:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa6664:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa6668:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa666c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa6670:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa6674:	54000209	b.ls	0xfffff7fa66b4  // b.plast
   0x0000fffff7fa6678:	36d8008d	tbz	w13, #27, 0xfffff7fa6688
   0x0000fffff7fa667c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa6680:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa6684:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa6688:	36d80091	tbz	w17, #27, 0xfffff7fa6698
   0x0000fffff7fa668c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6690:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa6694:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa6698:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa669c:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa66a0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa66a4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa66a8:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa66ac:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa66b0:	1400000e	b	0xfffff7fa66e8
   0x0000fffff7fa66b4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa66b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa66bc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa66c0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa66c4:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fa66c8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa66cc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa66d0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa66d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa66d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa66dc:	d63f0200	blr	x16
   0x0000fffff7fa66e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa66e4:	54004380	b.eq	0xfffff7fa6f54  // b.none
   0x0000fffff7fa66e8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa66ec:	37d806a9	tbnz	w9, #27, 0xfffff7fa67c0
   0x0000fffff7fa66f0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa66f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa66f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa66fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6700:	540001c1	b.ne	0xfffff7fa6738  // b.any
   0x0000fffff7fa6704:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa6708:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa670c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6710:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6714:	54000121	b.ne	0xfffff7fa6738  // b.any
   0x0000fffff7fa6718:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa671c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa6720:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa6724:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6728:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa672c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa6730:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa6734:	14000030	b	0xfffff7fa67f4
   0x0000fffff7fa6738:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa673c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6740:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6744:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6748:	54000120	b.eq	0xfffff7fa676c  // b.none
   0x0000fffff7fa674c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6750:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6754:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6758:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa675c:	54000321	b.ne	0xfffff7fa67c0  // b.any
   0x0000fffff7fa6760:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa6764:	9e620120	scvtf	d0, x9
   0x0000fffff7fa6768:	14000002	b	0xfffff7fa6770
   0x0000fffff7fa676c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa6770:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa6774:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6778:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa677c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6780:	54000120	b.eq	0xfffff7fa67a4  // b.none
   0x0000fffff7fa6784:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa6788:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa678c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6790:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6794:	54000161	b.ne	0xfffff7fa67c0  // b.any
   0x0000fffff7fa6798:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa679c:	9e620121	scvtf	d1, x9
   0x0000fffff7fa67a0:	14000002	b	0xfffff7fa67a8
   0x0000fffff7fa67a4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa67a8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa67ac:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa67b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa67b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa67b8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa67bc:	17ffffde	b	0xfffff7fa6734
   0x0000fffff7fa67c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa67c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa67c8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa67cc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa67d0:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fa67d4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa67d8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa67dc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa67e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa67e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa67e8:	d63f0200	blr	x16
   0x0000fffff7fa67ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa67f0:	54003b60	b.eq	0xfffff7fa6f5c  // b.none
   0x0000fffff7fa67f4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa67f8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa67fc:	540004a0	b.eq	0xfffff7fa6890  // b.none
   0x0000fffff7fa6800:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa6804:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa6808:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa680c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa6810:	54000400	b.eq	0xfffff7fa6890  // b.none
   0x0000fffff7fa6814:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa6818:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa681c:	36d801d1	tbz	w17, #27, 0xfffff7fa6854
   0x0000fffff7fa6820:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa6824:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa6828:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa682c:	54000321	b.ne	0xfffff7fa6890  // b.any
   0x0000fffff7fa6830:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa6834:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6838:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa683c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa6840:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa6844:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa6848:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa684c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa6850:	54000209	b.ls	0xfffff7fa6890  // b.plast
   0x0000fffff7fa6854:	36d8008d	tbz	w13, #27, 0xfffff7fa6864
   0x0000fffff7fa6858:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa685c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa6860:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa6864:	36d80091	tbz	w17, #27, 0xfffff7fa6874
   0x0000fffff7fa6868:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa686c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa6870:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa6874:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa6878:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa687c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa6880:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa6884:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa6888:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa688c:	1400000e	b	0xfffff7fa68c4
   0x0000fffff7fa6890:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa6894:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6898:	aa1303e1	mov	x1, x19
   0x0000fffff7fa689c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa68a0:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fa68a4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa68a8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa68ac:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa68b0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa68b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa68b8:	d63f0200	blr	x16
   0x0000fffff7fa68bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa68c0:	54003520	b.eq	0xfffff7fa6f64  // b.none
   0x0000fffff7fa68c4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa68c8:	37d806a9	tbnz	w9, #27, 0xfffff7fa699c
   0x0000fffff7fa68cc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa68d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa68d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa68d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa68dc:	540001c1	b.ne	0xfffff7fa6914  // b.any
   0x0000fffff7fa68e0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa68e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa68e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa68ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa68f0:	54000121	b.ne	0xfffff7fa6914  // b.any
   0x0000fffff7fa68f4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa68f8:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa68fc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa6900:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6904:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6908:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa690c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa6910:	14000030	b	0xfffff7fa69d0
   0x0000fffff7fa6914:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6918:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa691c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6920:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6924:	54000120	b.eq	0xfffff7fa6948  // b.none
   0x0000fffff7fa6928:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa692c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6930:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6934:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6938:	54000321	b.ne	0xfffff7fa699c  // b.any
   0x0000fffff7fa693c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa6940:	9e620120	scvtf	d0, x9
   0x0000fffff7fa6944:	14000002	b	0xfffff7fa694c
   0x0000fffff7fa6948:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa694c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa6950:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6954:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6958:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa695c:	54000120	b.eq	0xfffff7fa6980  // b.none
   0x0000fffff7fa6960:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa6964:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6968:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa696c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6970:	54000161	b.ne	0xfffff7fa699c  // b.any
   0x0000fffff7fa6974:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa6978:	9e620121	scvtf	d1, x9
   0x0000fffff7fa697c:	14000002	b	0xfffff7fa6984
   0x0000fffff7fa6980:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa6984:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa6988:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa698c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6990:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6994:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa6998:	17ffffde	b	0xfffff7fa6910
   0x0000fffff7fa699c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa69a0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa69a4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa69a8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa69ac:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fa69b0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa69b4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa69b8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa69bc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa69c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa69c4:	d63f0200	blr	x16
   0x0000fffff7fa69c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa69cc:	54002d00	b.eq	0xfffff7fa6f6c  // b.none
   0x0000fffff7fa69d0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa69d4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa69d8:	540004a0	b.eq	0xfffff7fa6a6c  // b.none
   0x0000fffff7fa69dc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa69e0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa69e4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa69e8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa69ec:	54000400	b.eq	0xfffff7fa6a6c  // b.none
   0x0000fffff7fa69f0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa69f4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa69f8:	36d801d1	tbz	w17, #27, 0xfffff7fa6a30
   0x0000fffff7fa69fc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa6a00:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa6a04:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa6a08:	54000321	b.ne	0xfffff7fa6a6c  // b.any
   0x0000fffff7fa6a0c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa6a10:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6a14:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa6a18:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa6a1c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa6a20:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa6a24:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa6a28:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa6a2c:	54000209	b.ls	0xfffff7fa6a6c  // b.plast
   0x0000fffff7fa6a30:	36d8008d	tbz	w13, #27, 0xfffff7fa6a40
   0x0000fffff7fa6a34:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa6a38:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa6a3c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa6a40:	36d80091	tbz	w17, #27, 0xfffff7fa6a50
   0x0000fffff7fa6a44:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6a48:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa6a4c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa6a50:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa6a54:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa6a58:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa6a5c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa6a60:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa6a64:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa6a68:	1400000e	b	0xfffff7fa6aa0
   0x0000fffff7fa6a6c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa6a70:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6a74:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6a78:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6a7c:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fa6a80:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6a84:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6a88:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa6a8c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa6a90:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6a94:	d63f0200	blr	x16
   0x0000fffff7fa6a98:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6a9c:	540026c0	b.eq	0xfffff7fa6f74  // b.none
   0x0000fffff7fa6aa0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6aa4:	37d806a9	tbnz	w9, #27, 0xfffff7fa6b78
   0x0000fffff7fa6aa8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6aac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6ab0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6ab4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6ab8:	540001c1	b.ne	0xfffff7fa6af0  // b.any
   0x0000fffff7fa6abc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa6ac0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6ac4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6ac8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6acc:	54000121	b.ne	0xfffff7fa6af0  // b.any
   0x0000fffff7fa6ad0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa6ad4:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa6ad8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa6adc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6ae0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6ae4:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa6ae8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa6aec:	14000030	b	0xfffff7fa6bac
   0x0000fffff7fa6af0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6af4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6af8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6afc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6b00:	54000120	b.eq	0xfffff7fa6b24  // b.none
   0x0000fffff7fa6b04:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6b08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6b0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6b10:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6b14:	54000321	b.ne	0xfffff7fa6b78  // b.any
   0x0000fffff7fa6b18:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa6b1c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa6b20:	14000002	b	0xfffff7fa6b28
   0x0000fffff7fa6b24:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa6b28:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa6b2c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6b30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6b34:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6b38:	54000120	b.eq	0xfffff7fa6b5c  // b.none
   0x0000fffff7fa6b3c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa6b40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6b44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6b48:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6b4c:	54000161	b.ne	0xfffff7fa6b78  // b.any
   0x0000fffff7fa6b50:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa6b54:	9e620121	scvtf	d1, x9
   0x0000fffff7fa6b58:	14000002	b	0xfffff7fa6b60
   0x0000fffff7fa6b5c:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa6b60:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa6b64:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa6b68:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6b6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6b70:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa6b74:	17ffffde	b	0xfffff7fa6aec
   0x0000fffff7fa6b78:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa6b7c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6b80:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6b84:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6b88:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fa6b8c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6b90:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6b94:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa6b98:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa6b9c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6ba0:	d63f0200	blr	x16
   0x0000fffff7fa6ba4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6ba8:	54001ea0	b.eq	0xfffff7fa6f7c  // b.none
   0x0000fffff7fa6bac:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa6bb0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa6bb4:	540004a0	b.eq	0xfffff7fa6c48  // b.none
   0x0000fffff7fa6bb8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa6bbc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa6bc0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa6bc4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa6bc8:	54000400	b.eq	0xfffff7fa6c48  // b.none
   0x0000fffff7fa6bcc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa6bd0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa6bd4:	36d801d1	tbz	w17, #27, 0xfffff7fa6c0c
   0x0000fffff7fa6bd8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa6bdc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa6be0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa6be4:	54000321	b.ne	0xfffff7fa6c48  // b.any
   0x0000fffff7fa6be8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa6bec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6bf0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa6bf4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa6bf8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa6bfc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa6c00:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa6c04:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa6c08:	54000209	b.ls	0xfffff7fa6c48  // b.plast
   0x0000fffff7fa6c0c:	36d8008d	tbz	w13, #27, 0xfffff7fa6c1c
   0x0000fffff7fa6c10:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa6c14:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa6c18:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa6c1c:	36d80091	tbz	w17, #27, 0xfffff7fa6c2c
   0x0000fffff7fa6c20:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6c24:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa6c28:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa6c2c:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa6c30:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa6c34:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa6c38:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa6c3c:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa6c40:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa6c44:	1400000e	b	0xfffff7fa6c7c
   0x0000fffff7fa6c48:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa6c4c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6c50:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6c54:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6c58:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fa6c5c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6c60:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6c64:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa6c68:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa6c6c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6c70:	d63f0200	blr	x16
   0x0000fffff7fa6c74:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6c78:	54001860	b.eq	0xfffff7fa6f84  // b.none
   0x0000fffff7fa6c7c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6c80:	37d806a9	tbnz	w9, #27, 0xfffff7fa6d54
   0x0000fffff7fa6c84:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6c88:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6c8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6c90:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6c94:	540001c1	b.ne	0xfffff7fa6ccc  // b.any
   0x0000fffff7fa6c98:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa6c9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6ca0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6ca4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6ca8:	54000121	b.ne	0xfffff7fa6ccc  // b.any
   0x0000fffff7fa6cac:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa6cb0:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa6cb4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa6cb8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6cbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6cc0:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa6cc4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa6cc8:	14000030	b	0xfffff7fa6d88
   0x0000fffff7fa6ccc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6cd0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6cd4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6cd8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6cdc:	54000120	b.eq	0xfffff7fa6d00  // b.none
   0x0000fffff7fa6ce0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6ce4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6ce8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6cec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6cf0:	54000321	b.ne	0xfffff7fa6d54  // b.any
   0x0000fffff7fa6cf4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa6cf8:	9e620120	scvtf	d0, x9
   0x0000fffff7fa6cfc:	14000002	b	0xfffff7fa6d04
   0x0000fffff7fa6d00:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa6d04:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa6d08:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6d0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6d10:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6d14:	54000120	b.eq	0xfffff7fa6d38  // b.none
   0x0000fffff7fa6d18:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa6d1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6d20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6d24:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6d28:	54000161	b.ne	0xfffff7fa6d54  // b.any
   0x0000fffff7fa6d2c:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa6d30:	9e620121	scvtf	d1, x9
   0x0000fffff7fa6d34:	14000002	b	0xfffff7fa6d3c
   0x0000fffff7fa6d38:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa6d3c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa6d40:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa6d44:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6d48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6d4c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa6d50:	17ffffde	b	0xfffff7fa6cc8
   0x0000fffff7fa6d54:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa6d58:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6d5c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6d60:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6d64:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fa6d68:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6d6c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6d70:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa6d74:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa6d78:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6d7c:	d63f0200	blr	x16
   0x0000fffff7fa6d80:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6d84:	54001040	b.eq	0xfffff7fa6f8c  // b.none
   0x0000fffff7fa6d88:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa6d8c:	37d80269	tbnz	w9, #27, 0xfffff7fa6dd8
   0x0000fffff7fa6d90:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa6d94:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6d98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6d9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6da0:	540001c1	b.ne	0xfffff7fa6dd8  // b.any
   0x0000fffff7fa6da4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa6da8:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7fa6dac:	8b0a012b	add	x11, x9, x10
   0x0000fffff7fa6db0:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7fa6db4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6db8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6dbc:	b900526a	str	w10, [x19, #80]
   0x0000fffff7fa6dc0:	aa0b03e9	mov	x9, x11
   0x0000fffff7fa6dc4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6dc8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6dcc:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa6dd0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa6dd4:	1400000e	b	0xfffff7fa6e0c
   0x0000fffff7fa6dd8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa6ddc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6de0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6de4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6de8:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fa6dec:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6df0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6df4:	d2916810	mov	x16, #0x8b40                	// #35648
   0x0000fffff7fa6df8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa6dfc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6e00:	d63f0200	blr	x16
   0x0000fffff7fa6e04:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6e08:	54000c60	b.eq	0xfffff7fa6f94  // b.none
   0x0000fffff7fa6e0c:	17fff8bd	b	0xfffff7fa5100
   0x0000fffff7fa6e10:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa6e14:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6e18:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6e1c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6e20:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fa6e24:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6e28:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6e2c:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7fa6e30:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa6e34:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6e38:	d63f0200	blr	x16
   0x0000fffff7fa6e3c:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa6e40:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa6e44:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa6e48:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa6e4c:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fa6e50:	d65f03c0	ret
   0x0000fffff7fa6e54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6e58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6e5c:	b900028a	str	w10, [x20]
   0x0000fffff7fa6e60:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fa6e64:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa6e68:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa6e6c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa6e70:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa6e74:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fa6e78:	d65f03c0	ret
   0x0000fffff7fa6e7c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fa6e80:	17fffff5	b	0xfffff7fa6e54
   0x0000fffff7fa6e84:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fa6e88:	17fffff3	b	0xfffff7fa6e54
   0x0000fffff7fa6e8c:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fa6e90:	17fffff1	b	0xfffff7fa6e54
   0x0000fffff7fa6e94:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7fa6e98:	17ffffef	b	0xfffff7fa6e54
   0x0000fffff7fa6e9c:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7fa6ea0:	17ffffed	b	0xfffff7fa6e54
   0x0000fffff7fa6ea4:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fa6ea8:	17ffffeb	b	0xfffff7fa6e54
   0x0000fffff7fa6eac:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fa6eb0:	17ffffe9	b	0xfffff7fa6e54
   0x0000fffff7fa6eb4:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fa6eb8:	17ffffe7	b	0xfffff7fa6e54
   0x0000fffff7fa6ebc:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fa6ec0:	17ffffe5	b	0xfffff7fa6e54
   0x0000fffff7fa6ec4:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fa6ec8:	17ffffe3	b	0xfffff7fa6e54
   0x0000fffff7fa6ecc:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fa6ed0:	17ffffe1	b	0xfffff7fa6e54
   0x0000fffff7fa6ed4:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fa6ed8:	17ffffdf	b	0xfffff7fa6e54
   0x0000fffff7fa6edc:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fa6ee0:	17ffffdd	b	0xfffff7fa6e54
   0x0000fffff7fa6ee4:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fa6ee8:	17ffffdb	b	0xfffff7fa6e54
   0x0000fffff7fa6eec:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fa6ef0:	17ffffd9	b	0xfffff7fa6e54
   0x0000fffff7fa6ef4:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fa6ef8:	17ffffd7	b	0xfffff7fa6e54
   0x0000fffff7fa6efc:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fa6f00:	17ffffd5	b	0xfffff7fa6e54
   0x0000fffff7fa6f04:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fa6f08:	17ffffd3	b	0xfffff7fa6e54
   0x0000fffff7fa6f0c:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fa6f10:	17ffffd1	b	0xfffff7fa6e54
   0x0000fffff7fa6f14:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fa6f18:	17ffffcf	b	0xfffff7fa6e54
   0x0000fffff7fa6f1c:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fa6f20:	17ffffcd	b	0xfffff7fa6e54
   0x0000fffff7fa6f24:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fa6f28:	17ffffcb	b	0xfffff7fa6e54
   0x0000fffff7fa6f2c:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fa6f30:	17ffffc9	b	0xfffff7fa6e54
   0x0000fffff7fa6f34:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fa6f38:	17ffffc7	b	0xfffff7fa6e54
   0x0000fffff7fa6f3c:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fa6f40:	17ffffc5	b	0xfffff7fa6e54
   0x0000fffff7fa6f44:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fa6f48:	17ffffc3	b	0xfffff7fa6e54
   0x0000fffff7fa6f4c:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fa6f50:	17ffffc1	b	0xfffff7fa6e54
   0x0000fffff7fa6f54:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fa6f58:	17ffffbf	b	0xfffff7fa6e54
   0x0000fffff7fa6f5c:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fa6f60:	17ffffbd	b	0xfffff7fa6e54
   0x0000fffff7fa6f64:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fa6f68:	17ffffbb	b	0xfffff7fa6e54
   0x0000fffff7fa6f6c:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fa6f70:	17ffffb9	b	0xfffff7fa6e54
   0x0000fffff7fa6f74:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fa6f78:	17ffffb7	b	0xfffff7fa6e54
   0x0000fffff7fa6f7c:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fa6f80:	17ffffb5	b	0xfffff7fa6e54
   0x0000fffff7fa6f84:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fa6f88:	17ffffb3	b	0xfffff7fa6e54
   0x0000fffff7fa6f8c:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fa6f90:	17ffffb1	b	0xfffff7fa6e54
   0x0000fffff7fa6f94:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fa6f98:	17ffffaf	b	0xfffff7fa6e54
   0x0000fffff7fa6f9c:	00000000	udf	#0
   0x0000fffff7fa6fa0:	00000000	udf	#0
   0x0000fffff7fa6fa4:	00000000	udf	#0
   0x0000fffff7fa6fa8:	00000000	udf	#0
   0x0000fffff7fa6fac:	00000000	udf	#0
   0x0000fffff7fa6fb0:	00000000	udf	#0
   0x0000fffff7fa6fb4:	00000000	udf	#0
   0x0000fffff7fa6fb8:	00000000	udf	#0
   0x0000fffff7fa6fbc:	00000000	udf	#0
   0x0000fffff7fa6fc0:	00000000	udf	#0
   0x0000fffff7fa6fc4:	00000000	udf	#0
   0x0000fffff7fa6fc8:	00000000	udf	#0
   0x0000fffff7fa6fcc:	00000000	udf	#0
   0x0000fffff7fa6fd0:	00000000	udf	#0
   0x0000fffff7fa6fd4:	00000000	udf	#0
   0x0000fffff7fa6fd8:	00000000	udf	#0
   0x0000fffff7fa6fdc:	00000000	udf	#0
   0x0000fffff7fa6fe0:	00000000	udf	#0
   0x0000fffff7fa6fe4:	00000000	udf	#0
   0x0000fffff7fa6fe8:	00000000	udf	#0
   0x0000fffff7fa6fec:	00000000	udf	#0
   0x0000fffff7fa6ff0:	00000000	udf	#0
   0x0000fffff7fa6ff4:	00000000	udf	#0
   0x0000fffff7fa6ff8:	00000000	udf	#0
   0x0000fffff7fa6ffc:	00000000	udf	#0
End of assembler dump.
