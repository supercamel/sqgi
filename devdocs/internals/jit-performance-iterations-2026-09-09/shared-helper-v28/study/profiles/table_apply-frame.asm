Dump of assembler code from 0xfffff7f85000 to 0xfffff7f86000:
   0x0000fffff7f85000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7f85004:	910003fd	mov	x29, sp
   0x0000fffff7f85008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7f8500c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7f85010:	d10243ff	sub	sp, sp, #0x90
   0x0000fffff7f85014:	aa0003f3	mov	x19, x0
   0x0000fffff7f85018:	aa0103f4	mov	x20, x1
   0x0000fffff7f8501c:	aa0203f5	mov	x21, x2
   0x0000fffff7f85020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7f85024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7f85028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f8502c:	f90003e9	str	x9, [sp]
   0x0000fffff7f85030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7f85034:	d2800081	mov	x1, #0x4                   	// #4
   0x0000fffff7f85038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7f8503c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f85040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85044:	d63f0200	blr	x16
   0x0000fffff7f85048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7f8504c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7f85050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7f85054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7f85058:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f8505c:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f85060:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f85064:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85068:	54000621	b.ne	0xfffff7f8512c  // b.any
   0x0000fffff7f8506c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f85070:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85074:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85078:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8507c:	54000581	b.ne	0xfffff7f8512c  // b.any
   0x0000fffff7f85080:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7f85084:	f9400e6b	ldr	x11, [x19, #24]
   0x0000fffff7f85088:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f8508c:	eb09015f	cmp	x10, x9
   0x0000fffff7f85090:	540004e2	b.cs	0xfffff7f8512c  // b.hs, b.nlast
   0x0000fffff7f85094:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f85098:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f8509c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f850a0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f850a4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f850a8:	eb0901bf	cmp	x13, x9
   0x0000fffff7f850ac:	54000400	b.eq	0xfffff7f8512c  // b.none
   0x0000fffff7f850b0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f850b4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f850b8:	36d801d1	tbz	w17, #27, 0xfffff7f850f0
   0x0000fffff7f850bc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f850c0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f850c4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f850c8:	54000321	b.ne	0xfffff7f8512c  // b.any
   0x0000fffff7f850cc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f850d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f850d4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f850d8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f850dc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f850e0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f850e4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f850e8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f850ec:	54000209	b.ls	0xfffff7f8512c  // b.plast
   0x0000fffff7f850f0:	36d8008d	tbz	w13, #27, 0xfffff7f85100
   0x0000fffff7f850f4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f850f8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f850fc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85100:	36d80091	tbz	w17, #27, 0xfffff7f85110
   0x0000fffff7f85104:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85108:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8510c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85110:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7f85114:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f85118:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8511c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85120:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f85124:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f85128:	1400000e	b	0xfffff7f85160
   0x0000fffff7f8512c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f85130:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85134:	aa1303e1	mov	x1, x19
   0x0000fffff7f85138:	aa1503e2	mov	x2, x21
   0x0000fffff7f8513c:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7f85140:	aa1403e4	mov	x4, x20
   0x0000fffff7f85144:	aa1603e5	mov	x5, x22
   0x0000fffff7f85148:	d289d210	mov	x16, #0x4e90                	// #20112
   0x0000fffff7f8514c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85150:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85154:	d63f0200	blr	x16
   0x0000fffff7f85158:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8515c:	54006c80	b.eq	0xfffff7f85eec  // b.none
   0x0000fffff7f85160:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85164:	37d806a9	tbnz	w9, #27, 0xfffff7f85238
   0x0000fffff7f85168:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f8516c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85170:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85174:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85178:	540001c1	b.ne	0xfffff7f851b0  // b.any
   0x0000fffff7f8517c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f85180:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85184:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85188:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8518c:	54000121	b.ne	0xfffff7f851b0  // b.any
   0x0000fffff7f85190:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f85194:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f85198:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8519c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f851a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f851a4:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f851a8:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f851ac:	14000030	b	0xfffff7f8526c
   0x0000fffff7f851b0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f851b4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f851b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f851bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f851c0:	54000120	b.eq	0xfffff7f851e4  // b.none
   0x0000fffff7f851c4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f851c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f851cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f851d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f851d4:	54000321	b.ne	0xfffff7f85238  // b.any
   0x0000fffff7f851d8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f851dc:	9e620120	scvtf	d0, x9
   0x0000fffff7f851e0:	14000002	b	0xfffff7f851e8
   0x0000fffff7f851e4:	fd402e60	ldr	d0, [x19, #88]
   0x0000fffff7f851e8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f851ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f851f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f851f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f851f8:	54000120	b.eq	0xfffff7f8521c  // b.none
   0x0000fffff7f851fc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f85200:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85204:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85208:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8520c:	54000161	b.ne	0xfffff7f85238  // b.any
   0x0000fffff7f85210:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f85214:	9e620121	scvtf	d1, x9
   0x0000fffff7f85218:	14000002	b	0xfffff7f85220
   0x0000fffff7f8521c:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7f85220:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f85224:	fd002e60	str	d0, [x19, #88]
   0x0000fffff7f85228:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8522c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85230:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f85234:	17ffffde	b	0xfffff7f851ac
   0x0000fffff7f85238:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8523c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85240:	aa1303e1	mov	x1, x19
   0x0000fffff7f85244:	aa1503e2	mov	x2, x21
   0x0000fffff7f85248:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7f8524c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85250:	aa1603e5	mov	x5, x22
   0x0000fffff7f85254:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7f85258:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8525c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85260:	d63f0200	blr	x16
   0x0000fffff7f85264:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85268:	54006460	b.eq	0xfffff7f85ef4  // b.none
   0x0000fffff7f8526c:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f85270:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f85274:	d29ffe2c	mov	x12, #0xfff1                	// #65521
   0x0000fffff7f85278:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7f8527c:	36d80211	tbz	w17, #27, 0xfffff7f852bc
   0x0000fffff7f85280:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85284:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85288:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8528c:	540001e1	b.ne	0xfffff7f852c8  // b.any
   0x0000fffff7f85290:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f85294:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85298:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8529c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f852a0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f852a4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f852a8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f852ac:	f100055f	cmp	x10, #0x1
   0x0000fffff7f852b0:	540000c9	b.ls	0xfffff7f852c8  // b.plast
   0x0000fffff7f852b4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f852b8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f852bc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f852c0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f852c4:	1400000e	b	0xfffff7f852fc
   0x0000fffff7f852c8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f852cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f852d0:	aa1303e1	mov	x1, x19
   0x0000fffff7f852d4:	aa1503e2	mov	x2, x21
   0x0000fffff7f852d8:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f852dc:	aa1403e4	mov	x4, x20
   0x0000fffff7f852e0:	aa1603e5	mov	x5, x22
   0x0000fffff7f852e4:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7f852e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f852ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f852f0:	d63f0200	blr	x16
   0x0000fffff7f852f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f852f8:	54006020	b.eq	0xfffff7f85efc  // b.none
   0x0000fffff7f852fc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85300:	37d80389	tbnz	w9, #27, 0xfffff7f85370
   0x0000fffff7f85304:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85308:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8530c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85310:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85314:	540002e1	b.ne	0xfffff7f85370  // b.any
   0x0000fffff7f85318:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8531c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85320:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85324:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85328:	54000241	b.ne	0xfffff7f85370  // b.any
   0x0000fffff7f8532c:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f85330:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f85334:	f100015f	cmp	x10, #0x0
   0x0000fffff7f85338:	540001c0	b.eq	0xfffff7f85370  // b.none
   0x0000fffff7f8533c:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f85340:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f85344:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f85348:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f8534c:	eb0b015f	cmp	x10, x11
   0x0000fffff7f85350:	54000100	b.eq	0xfffff7f85370  // b.none
   0x0000fffff7f85354:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f85358:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f8535c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85360:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85364:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f85368:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f8536c:	1400000e	b	0xfffff7f853a4
   0x0000fffff7f85370:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85374:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85378:	aa1303e1	mov	x1, x19
   0x0000fffff7f8537c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85380:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7f85384:	aa1403e4	mov	x4, x20
   0x0000fffff7f85388:	aa1603e5	mov	x5, x22
   0x0000fffff7f8538c:	d293a610	mov	x16, #0x9d30                	// #40240
   0x0000fffff7f85390:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85394:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85398:	d63f0200	blr	x16
   0x0000fffff7f8539c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f853a0:	54005b20	b.eq	0xfffff7f85f04  // b.none
   0x0000fffff7f853a4:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f853a8:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f853ac:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f853b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f853b4:	540001c1	b.ne	0xfffff7f853ec  // b.any
   0x0000fffff7f853b8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f853bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f853c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f853c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f853c8:	54000501	b.ne	0xfffff7f85468  // b.any
   0x0000fffff7f853cc:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7f853d0:	f9400e6b	ldr	x11, [x19, #24]
   0x0000fffff7f853d4:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f853d8:	eb09015f	cmp	x10, x9
   0x0000fffff7f853dc:	54000462	b.cs	0xfffff7f85468  // b.hs, b.nlast
   0x0000fffff7f853e0:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f853e4:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f853e8:	14000004	b	0xfffff7f853f8
   0x0000fffff7f853ec:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f853f0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f853f4:	540003a0	b.eq	0xfffff7f85468  // b.none
   0x0000fffff7f853f8:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7f853fc:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7f85400:	b9400171	ldr	w17, [x11]
   0x0000fffff7f85404:	36d801d1	tbz	w17, #27, 0xfffff7f8543c
   0x0000fffff7f85408:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8540c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85410:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85414:	540002a1	b.ne	0xfffff7f85468  // b.any
   0x0000fffff7f85418:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f8541c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85420:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85424:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85428:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8542c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85430:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85434:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85438:	54000189	b.ls	0xfffff7f85468  // b.plast
   0x0000fffff7f8543c:	36d8008d	tbz	w13, #27, 0xfffff7f8544c
   0x0000fffff7f85440:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85444:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85448:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8544c:	36d80091	tbz	w17, #27, 0xfffff7f8545c
   0x0000fffff7f85450:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85454:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85458:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8545c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f85460:	b900016d	str	w13, [x11]
   0x0000fffff7f85464:	1400000e	b	0xfffff7f8549c
   0x0000fffff7f85468:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f8546c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85470:	aa1303e1	mov	x1, x19
   0x0000fffff7f85474:	aa1503e2	mov	x2, x21
   0x0000fffff7f85478:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7f8547c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85480:	aa1603e5	mov	x5, x22
   0x0000fffff7f85484:	d28be610	mov	x16, #0x5f30                	// #24368
   0x0000fffff7f85488:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8548c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85490:	d63f0200	blr	x16
   0x0000fffff7f85494:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85498:	540053a0	b.eq	0xfffff7f85f0c  // b.none
   0x0000fffff7f8549c:	b940126d	ldr	w13, [x19, #16]
   0x0000fffff7f854a0:	f9400e6c	ldr	x12, [x19, #24]
   0x0000fffff7f854a4:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7f854a8:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7f854ac:	eb0a01bf	cmp	x13, x10
   0x0000fffff7f854b0:	54000100	b.eq	0xfffff7f854d0  // b.none
   0x0000fffff7f854b4:	5290000a	mov	w10, #0x8000                	// #32768
   0x0000fffff7f854b8:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7f854bc:	eb0a01bf	cmp	x13, x10
   0x0000fffff7f854c0:	54000b41	b.ne	0xfffff7f85628  // b.any
   0x0000fffff7f854c4:	f9401d8b	ldr	x11, [x12, #56]
   0x0000fffff7f854c8:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f854cc:	14000002	b	0xfffff7f854d4
   0x0000fffff7f854d0:	aa0c03eb	mov	x11, x12
   0x0000fffff7f854d4:	f9402569	ldr	x9, [x11, #72]
   0x0000fffff7f854d8:	d1000529	sub	x9, x9, #0x1
   0x0000fffff7f854dc:	d28fe6aa	mov	x10, #0x7f35                	// #32565
   0x0000fffff7f854e0:	f2bc252a	movk	x10, #0xe129, lsl #16
   0x0000fffff7f854e4:	f2c00b2a	movk	x10, #0x59, lsl #32
   0x0000fffff7f854e8:	8a09014a	and	x10, x10, x9
   0x0000fffff7f854ec:	f940216b	ldr	x11, [x11, #64]
   0x0000fffff7f854f0:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7f854f4:	9b097d4a	mul	x10, x10, x9
   0x0000fffff7f854f8:	8b0a016b	add	x11, x11, x10
   0x0000fffff7f854fc:	b9401169	ldr	w9, [x11, #16]
   0x0000fffff7f85500:	5280020a	mov	w10, #0x10                  	// #16
   0x0000fffff7f85504:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f85508:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8550c:	540008e1	b.ne	0xfffff7f85628  // b.any
   0x0000fffff7f85510:	f9400d69	ldr	x9, [x11, #24]
   0x0000fffff7f85514:	d29ab80a	mov	x10, #0xd5c0                	// #54720
   0x0000fffff7f85518:	f2b5580a	movk	x10, #0xaac0, lsl #16
   0x0000fffff7f8551c:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7f85520:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85524:	54000821	b.ne	0xfffff7f85628  // b.any
   0x0000fffff7f85528:	9100016b	add	x11, x11, #0x0
   0x0000fffff7f8552c:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7f85530:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7f85534:	eb0a01bf	cmp	x13, x10
   0x0000fffff7f85538:	540002a0	b.eq	0xfffff7f8558c  // b.none
   0x0000fffff7f8553c:	b9400169	ldr	w9, [x11]
   0x0000fffff7f85540:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85544:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85548:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8554c:	540006e1	b.ne	0xfffff7f85628  // b.any
   0x0000fffff7f85550:	f9400569	ldr	x9, [x11, #8]
   0x0000fffff7f85554:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7f85558:	f2a0400a	movk	x10, #0x200, lsl #16
   0x0000fffff7f8555c:	8a0a012a	and	x10, x9, x10
   0x0000fffff7f85560:	f100015f	cmp	x10, #0x0
   0x0000fffff7f85564:	54000620	b.eq	0xfffff7f85628  // b.none
   0x0000fffff7f85568:	d29fffea	mov	x10, #0xffff                	// #65535
   0x0000fffff7f8556c:	f2a01fea	movk	x10, #0xff, lsl #16
   0x0000fffff7f85570:	8a0a0129	and	x9, x9, x10
   0x0000fffff7f85574:	f9401d8a	ldr	x10, [x12, #56]
   0x0000fffff7f85578:	f940254a	ldr	x10, [x10, #72]
   0x0000fffff7f8557c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85580:	54000542	b.cs	0xfffff7f85628  // b.hs, b.nlast
   0x0000fffff7f85584:	9101618b	add	x11, x12, #0x58
   0x0000fffff7f85588:	8b09116b	add	x11, x11, x9, lsl #4
   0x0000fffff7f8558c:	b90033ed	str	w13, [sp, #48]
   0x0000fffff7f85590:	f9001fec	str	x12, [sp, #56]
   0x0000fffff7f85594:	f90027eb	str	x11, [sp, #72]
   0x0000fffff7f85598:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8559c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f855a0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f855a4:	eb0901bf	cmp	x13, x9
   0x0000fffff7f855a8:	54000400	b.eq	0xfffff7f85628  // b.none
   0x0000fffff7f855ac:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f855b0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f855b4:	36d801d1	tbz	w17, #27, 0xfffff7f855ec
   0x0000fffff7f855b8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f855bc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f855c0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f855c4:	54000321	b.ne	0xfffff7f85628  // b.any
   0x0000fffff7f855c8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f855cc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f855d0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f855d4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f855d8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f855dc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f855e0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f855e4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f855e8:	54000209	b.ls	0xfffff7f85628  // b.plast
   0x0000fffff7f855ec:	36d8008d	tbz	w13, #27, 0xfffff7f855fc
   0x0000fffff7f855f0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f855f4:	91000529	add	x9, x9, #0x1
   0x0000fffff7f855f8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f855fc:	36d80091	tbz	w17, #27, 0xfffff7f8560c
   0x0000fffff7f85600:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85604:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85608:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8560c:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7f85610:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f85614:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85618:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8561c:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f85620:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f85624:	1400000e	b	0xfffff7f8565c
   0x0000fffff7f85628:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8562c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85630:	aa1303e1	mov	x1, x19
   0x0000fffff7f85634:	aa1503e2	mov	x2, x21
   0x0000fffff7f85638:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f8563c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85640:	aa1603e5	mov	x5, x22
   0x0000fffff7f85644:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f85648:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8564c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85650:	d63f0200	blr	x16
   0x0000fffff7f85654:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85658:	540045e0	b.eq	0xfffff7f85f14  // b.none
   0x0000fffff7f8565c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f85660:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85664:	540004a0	b.eq	0xfffff7f856f8  // b.none
   0x0000fffff7f85668:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8566c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85670:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85674:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85678:	54000400	b.eq	0xfffff7f856f8  // b.none
   0x0000fffff7f8567c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85680:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85684:	36d801d1	tbz	w17, #27, 0xfffff7f856bc
   0x0000fffff7f85688:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8568c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85690:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85694:	54000321	b.ne	0xfffff7f856f8  // b.any
   0x0000fffff7f85698:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8569c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f856a0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f856a4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f856a8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f856ac:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f856b0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f856b4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f856b8:	54000209	b.ls	0xfffff7f856f8  // b.plast
   0x0000fffff7f856bc:	36d8008d	tbz	w13, #27, 0xfffff7f856cc
   0x0000fffff7f856c0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f856c4:	91000529	add	x9, x9, #0x1
   0x0000fffff7f856c8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f856cc:	36d80091	tbz	w17, #27, 0xfffff7f856dc
   0x0000fffff7f856d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f856d4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f856d8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f856dc:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f856e0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f856e4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f856e8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f856ec:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f856f0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f856f4:	1400000e	b	0xfffff7f8572c
   0x0000fffff7f856f8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f856fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85700:	aa1303e1	mov	x1, x19
   0x0000fffff7f85704:	aa1503e2	mov	x2, x21
   0x0000fffff7f85708:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f8570c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85710:	aa1603e5	mov	x5, x22
   0x0000fffff7f85714:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f85718:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8571c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85720:	d63f0200	blr	x16
   0x0000fffff7f85724:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85728:	54003fa0	b.eq	0xfffff7f85f1c  // b.none
   0x0000fffff7f8572c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85730:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f85734:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f85738:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8573c:	54000621	b.ne	0xfffff7f85800  // b.any
   0x0000fffff7f85740:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85744:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85748:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8574c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85750:	54000581	b.ne	0xfffff7f85800  // b.any
   0x0000fffff7f85754:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f85758:	f940366b	ldr	x11, [x19, #104]
   0x0000fffff7f8575c:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f85760:	eb09015f	cmp	x10, x9
   0x0000fffff7f85764:	540004e2	b.cs	0xfffff7f85800  // b.hs, b.nlast
   0x0000fffff7f85768:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f8576c:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f85770:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85774:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85778:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8577c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85780:	54000400	b.eq	0xfffff7f85800  // b.none
   0x0000fffff7f85784:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85788:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8578c:	36d801d1	tbz	w17, #27, 0xfffff7f857c4
   0x0000fffff7f85790:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85794:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85798:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8579c:	54000321	b.ne	0xfffff7f85800  // b.any
   0x0000fffff7f857a0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f857a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f857a8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f857ac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f857b0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f857b4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f857b8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f857bc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f857c0:	54000209	b.ls	0xfffff7f85800  // b.plast
   0x0000fffff7f857c4:	36d8008d	tbz	w13, #27, 0xfffff7f857d4
   0x0000fffff7f857c8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f857cc:	91000529	add	x9, x9, #0x1
   0x0000fffff7f857d0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f857d4:	36d80091	tbz	w17, #27, 0xfffff7f857e4
   0x0000fffff7f857d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f857dc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f857e0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f857e4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f857e8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f857ec:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f857f0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f857f4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f857f8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f857fc:	1400000e	b	0xfffff7f85834
   0x0000fffff7f85800:	910143e6	add	x6, sp, #0x50
   0x0000fffff7f85804:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85808:	aa1303e1	mov	x1, x19
   0x0000fffff7f8580c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85810:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f85814:	aa1403e4	mov	x4, x20
   0x0000fffff7f85818:	aa1603e5	mov	x5, x22
   0x0000fffff7f8581c:	d289d210	mov	x16, #0x4e90                	// #20112
   0x0000fffff7f85820:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85824:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85828:	d63f0200	blr	x16
   0x0000fffff7f8582c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85830:	540037a0	b.eq	0xfffff7f85f24  // b.none
   0x0000fffff7f85834:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f85838:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f8583c:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f85840:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85844:	540001c1	b.ne	0xfffff7f8587c  // b.any
   0x0000fffff7f85848:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f8584c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85850:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85854:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85858:	54000601	b.ne	0xfffff7f85918  // b.any
   0x0000fffff7f8585c:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7f85860:	f9400e6b	ldr	x11, [x19, #24]
   0x0000fffff7f85864:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f85868:	eb09015f	cmp	x10, x9
   0x0000fffff7f8586c:	54000562	b.cs	0xfffff7f85918  // b.hs, b.nlast
   0x0000fffff7f85870:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f85874:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f85878:	14000004	b	0xfffff7f85888
   0x0000fffff7f8587c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f85880:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85884:	540004a0	b.eq	0xfffff7f85918  // b.none
   0x0000fffff7f85888:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8588c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85890:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85894:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85898:	54000400	b.eq	0xfffff7f85918  // b.none
   0x0000fffff7f8589c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f858a0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f858a4:	36d801d1	tbz	w17, #27, 0xfffff7f858dc
   0x0000fffff7f858a8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f858ac:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f858b0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f858b4:	54000321	b.ne	0xfffff7f85918  // b.any
   0x0000fffff7f858b8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f858bc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f858c0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f858c4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f858c8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f858cc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f858d0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f858d4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f858d8:	54000209	b.ls	0xfffff7f85918  // b.plast
   0x0000fffff7f858dc:	36d8008d	tbz	w13, #27, 0xfffff7f858ec
   0x0000fffff7f858e0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f858e4:	91000529	add	x9, x9, #0x1
   0x0000fffff7f858e8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f858ec:	36d80091	tbz	w17, #27, 0xfffff7f858fc
   0x0000fffff7f858f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f858f4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f858f8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f858fc:	b940726e	ldr	w14, [x19, #112]
   0x0000fffff7f85900:	f9403e6f	ldr	x15, [x19, #120]
   0x0000fffff7f85904:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85908:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8590c:	f9003e6c	str	x12, [x19, #120]
   0x0000fffff7f85910:	b900726d	str	w13, [x19, #112]
   0x0000fffff7f85914:	1400000e	b	0xfffff7f8594c
   0x0000fffff7f85918:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f8591c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85920:	aa1303e1	mov	x1, x19
   0x0000fffff7f85924:	aa1503e2	mov	x2, x21
   0x0000fffff7f85928:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f8592c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85930:	aa1603e5	mov	x5, x22
   0x0000fffff7f85934:	d289d210	mov	x16, #0x4e90                	// #20112
   0x0000fffff7f85938:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8593c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85940:	d63f0200	blr	x16
   0x0000fffff7f85944:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85948:	54002f20	b.eq	0xfffff7f85f2c  // b.none
   0x0000fffff7f8594c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85950:	37d806a9	tbnz	w9, #27, 0xfffff7f85a24
   0x0000fffff7f85954:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85958:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8595c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85960:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85964:	540001c1	b.ne	0xfffff7f8599c  // b.any
   0x0000fffff7f85968:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f8596c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85970:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85974:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85978:	54000121	b.ne	0xfffff7f8599c  // b.any
   0x0000fffff7f8597c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f85980:	f9403e6a	ldr	x10, [x19, #120]
   0x0000fffff7f85984:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85988:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8598c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85990:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f85994:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f85998:	14000030	b	0xfffff7f85a58
   0x0000fffff7f8599c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f859a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f859a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f859a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f859ac:	54000120	b.eq	0xfffff7f859d0  // b.none
   0x0000fffff7f859b0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f859b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f859b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f859bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f859c0:	54000321	b.ne	0xfffff7f85a24  // b.any
   0x0000fffff7f859c4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f859c8:	9e620120	scvtf	d0, x9
   0x0000fffff7f859cc:	14000002	b	0xfffff7f859d4
   0x0000fffff7f859d0:	fd403660	ldr	d0, [x19, #104]
   0x0000fffff7f859d4:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f859d8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f859dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f859e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f859e4:	54000120	b.eq	0xfffff7f85a08  // b.none
   0x0000fffff7f859e8:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f859ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f859f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f859f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f859f8:	54000161	b.ne	0xfffff7f85a24  // b.any
   0x0000fffff7f859fc:	f9403e69	ldr	x9, [x19, #120]
   0x0000fffff7f85a00:	9e620121	scvtf	d1, x9
   0x0000fffff7f85a04:	14000002	b	0xfffff7f85a0c
   0x0000fffff7f85a08:	fd403e61	ldr	d1, [x19, #120]
   0x0000fffff7f85a0c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f85a10:	fd003660	str	d0, [x19, #104]
   0x0000fffff7f85a14:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85a18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85a1c:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f85a20:	17ffffde	b	0xfffff7f85998
   0x0000fffff7f85a24:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85a28:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85a2c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85a30:	aa1503e2	mov	x2, x21
   0x0000fffff7f85a34:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f85a38:	aa1403e4	mov	x4, x20
   0x0000fffff7f85a3c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85a40:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7f85a44:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85a48:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85a4c:	d63f0200	blr	x16
   0x0000fffff7f85a50:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85a54:	54002700	b.eq	0xfffff7f85f34  // b.none
   0x0000fffff7f85a58:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f85a5c:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f85a60:	d2807cac	mov	x12, #0x3e5                 	// #997
   0x0000fffff7f85a64:	b9407271	ldr	w17, [x19, #112]
   0x0000fffff7f85a68:	36d80211	tbz	w17, #27, 0xfffff7f85aa8
   0x0000fffff7f85a6c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85a70:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85a74:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85a78:	540001e1	b.ne	0xfffff7f85ab4  // b.any
   0x0000fffff7f85a7c:	f9403e6f	ldr	x15, [x19, #120]
   0x0000fffff7f85a80:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85a84:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85a88:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85a8c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85a90:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85a94:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85a98:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85a9c:	540000c9	b.ls	0xfffff7f85ab4  // b.plast
   0x0000fffff7f85aa0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85aa4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85aa8:	f9003e6c	str	x12, [x19, #120]
   0x0000fffff7f85aac:	b900726d	str	w13, [x19, #112]
   0x0000fffff7f85ab0:	1400000e	b	0xfffff7f85ae8
   0x0000fffff7f85ab4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85ab8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85abc:	aa1303e1	mov	x1, x19
   0x0000fffff7f85ac0:	aa1503e2	mov	x2, x21
   0x0000fffff7f85ac4:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f85ac8:	aa1403e4	mov	x4, x20
   0x0000fffff7f85acc:	aa1603e5	mov	x5, x22
   0x0000fffff7f85ad0:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7f85ad4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85ad8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85adc:	d63f0200	blr	x16
   0x0000fffff7f85ae0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85ae4:	540022c0	b.eq	0xfffff7f85f3c  // b.none
   0x0000fffff7f85ae8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85aec:	37d80389	tbnz	w9, #27, 0xfffff7f85b5c
   0x0000fffff7f85af0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85af4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85af8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85afc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85b00:	540002e1	b.ne	0xfffff7f85b5c  // b.any
   0x0000fffff7f85b04:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f85b08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85b0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85b10:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85b14:	54000241	b.ne	0xfffff7f85b5c  // b.any
   0x0000fffff7f85b18:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f85b1c:	f9403e6a	ldr	x10, [x19, #120]
   0x0000fffff7f85b20:	f100015f	cmp	x10, #0x0
   0x0000fffff7f85b24:	540001c0	b.eq	0xfffff7f85b5c  // b.none
   0x0000fffff7f85b28:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f85b2c:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f85b30:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f85b34:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f85b38:	eb0b015f	cmp	x10, x11
   0x0000fffff7f85b3c:	54000100	b.eq	0xfffff7f85b5c  // b.none
   0x0000fffff7f85b40:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f85b44:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f85b48:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85b4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85b50:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f85b54:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f85b58:	1400000e	b	0xfffff7f85b90
   0x0000fffff7f85b5c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85b60:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85b64:	aa1303e1	mov	x1, x19
   0x0000fffff7f85b68:	aa1503e2	mov	x2, x21
   0x0000fffff7f85b6c:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7f85b70:	aa1403e4	mov	x4, x20
   0x0000fffff7f85b74:	aa1603e5	mov	x5, x22
   0x0000fffff7f85b78:	d293a610	mov	x16, #0x9d30                	// #40240
   0x0000fffff7f85b7c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85b80:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85b84:	d63f0200	blr	x16
   0x0000fffff7f85b88:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85b8c:	54001dc0	b.eq	0xfffff7f85f44  // b.none
   0x0000fffff7f85b90:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85b94:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f85b98:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f85b9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85ba0:	54000521	b.ne	0xfffff7f85c44  // b.any
   0x0000fffff7f85ba4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85ba8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85bac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85bb0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85bb4:	54000481	b.ne	0xfffff7f85c44  // b.any
   0x0000fffff7f85bb8:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f85bbc:	f9402e6b	ldr	x11, [x19, #88]
   0x0000fffff7f85bc0:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f85bc4:	eb09015f	cmp	x10, x9
   0x0000fffff7f85bc8:	540003e2	b.cs	0xfffff7f85c44  // b.hs, b.nlast
   0x0000fffff7f85bcc:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f85bd0:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f85bd4:	b940626d	ldr	w13, [x19, #96]
   0x0000fffff7f85bd8:	f940366c	ldr	x12, [x19, #104]
   0x0000fffff7f85bdc:	b9400171	ldr	w17, [x11]
   0x0000fffff7f85be0:	36d801d1	tbz	w17, #27, 0xfffff7f85c18
   0x0000fffff7f85be4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85be8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85bec:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85bf0:	540002a1	b.ne	0xfffff7f85c44  // b.any
   0x0000fffff7f85bf4:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f85bf8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85bfc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85c00:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85c04:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85c08:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85c0c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85c10:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85c14:	54000189	b.ls	0xfffff7f85c44  // b.plast
   0x0000fffff7f85c18:	36d8008d	tbz	w13, #27, 0xfffff7f85c28
   0x0000fffff7f85c1c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85c20:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85c24:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85c28:	36d80091	tbz	w17, #27, 0xfffff7f85c38
   0x0000fffff7f85c2c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85c30:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85c34:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85c38:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f85c3c:	b900016d	str	w13, [x11]
   0x0000fffff7f85c40:	1400000e	b	0xfffff7f85c78
   0x0000fffff7f85c44:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f85c48:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85c4c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85c50:	aa1503e2	mov	x2, x21
   0x0000fffff7f85c54:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7f85c58:	aa1403e4	mov	x4, x20
   0x0000fffff7f85c5c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85c60:	d28be610	mov	x16, #0x5f30                	// #24368
   0x0000fffff7f85c64:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85c68:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85c6c:	d63f0200	blr	x16
   0x0000fffff7f85c70:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85c74:	540016c0	b.eq	0xfffff7f85f4c  // b.none
   0x0000fffff7f85c78:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f85c7c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85c80:	540004a0	b.eq	0xfffff7f85d14  // b.none
   0x0000fffff7f85c84:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85c88:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85c8c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85c90:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85c94:	54000400	b.eq	0xfffff7f85d14  // b.none
   0x0000fffff7f85c98:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85c9c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85ca0:	36d801d1	tbz	w17, #27, 0xfffff7f85cd8
   0x0000fffff7f85ca4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85ca8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85cac:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85cb0:	54000321	b.ne	0xfffff7f85d14  // b.any
   0x0000fffff7f85cb4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85cb8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85cbc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85cc0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85cc4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85cc8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85ccc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85cd0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85cd4:	54000209	b.ls	0xfffff7f85d14  // b.plast
   0x0000fffff7f85cd8:	36d8008d	tbz	w13, #27, 0xfffff7f85ce8
   0x0000fffff7f85cdc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85ce0:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85ce4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85ce8:	36d80091	tbz	w17, #27, 0xfffff7f85cf8
   0x0000fffff7f85cec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85cf0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85cf4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85cf8:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7f85cfc:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f85d00:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85d04:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85d08:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f85d0c:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f85d10:	1400000e	b	0xfffff7f85d48
   0x0000fffff7f85d14:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85d18:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85d1c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85d20:	aa1503e2	mov	x2, x21
   0x0000fffff7f85d24:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7f85d28:	aa1403e4	mov	x4, x20
   0x0000fffff7f85d2c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85d30:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f85d34:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85d38:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85d3c:	d63f0200	blr	x16
   0x0000fffff7f85d40:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85d44:	54001080	b.eq	0xfffff7f85f54  // b.none
   0x0000fffff7f85d48:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85d4c:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f85d50:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f85d54:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85d58:	540001c1	b.ne	0xfffff7f85d90  // b.any
   0x0000fffff7f85d5c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85d60:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85d64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85d68:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85d6c:	54000701	b.ne	0xfffff7f85e4c  // b.any
   0x0000fffff7f85d70:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f85d74:	f9402e6b	ldr	x11, [x19, #88]
   0x0000fffff7f85d78:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f85d7c:	eb09015f	cmp	x10, x9
   0x0000fffff7f85d80:	54000662	b.cs	0xfffff7f85e4c  // b.hs, b.nlast
   0x0000fffff7f85d84:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f85d88:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f85d8c:	1400000c	b	0xfffff7f85dbc
   0x0000fffff7f85d90:	f94047eb	ldr	x11, [sp, #136]
   0x0000fffff7f85d94:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85d98:	540005a0	b.eq	0xfffff7f85e4c  // b.none
   0x0000fffff7f85d9c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85da0:	b94073ea	ldr	w10, [sp, #112]
   0x0000fffff7f85da4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85da8:	54000521	b.ne	0xfffff7f85e4c  // b.any
   0x0000fffff7f85dac:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f85db0:	f9403fea	ldr	x10, [sp, #120]
   0x0000fffff7f85db4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85db8:	540004a1	b.ne	0xfffff7f85e4c  // b.any
   0x0000fffff7f85dbc:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85dc0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85dc4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85dc8:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85dcc:	54000400	b.eq	0xfffff7f85e4c  // b.none
   0x0000fffff7f85dd0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85dd4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85dd8:	36d801d1	tbz	w17, #27, 0xfffff7f85e10
   0x0000fffff7f85ddc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85de0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85de4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85de8:	54000321	b.ne	0xfffff7f85e4c  // b.any
   0x0000fffff7f85dec:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85df0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85df4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85df8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85dfc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85e00:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85e04:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85e08:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85e0c:	54000209	b.ls	0xfffff7f85e4c  // b.plast
   0x0000fffff7f85e10:	36d8008d	tbz	w13, #27, 0xfffff7f85e20
   0x0000fffff7f85e14:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85e18:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85e1c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85e20:	36d80091	tbz	w17, #27, 0xfffff7f85e30
   0x0000fffff7f85e24:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85e28:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85e2c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85e30:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7f85e34:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f85e38:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85e3c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85e40:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f85e44:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f85e48:	1400000e	b	0xfffff7f85e80
   0x0000fffff7f85e4c:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f85e50:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85e54:	aa1303e1	mov	x1, x19
   0x0000fffff7f85e58:	aa1503e2	mov	x2, x21
   0x0000fffff7f85e5c:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7f85e60:	aa1403e4	mov	x4, x20
   0x0000fffff7f85e64:	aa1603e5	mov	x5, x22
   0x0000fffff7f85e68:	d289d210	mov	x16, #0x4e90                	// #20112
   0x0000fffff7f85e6c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85e70:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85e74:	d63f0200	blr	x16
   0x0000fffff7f85e78:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85e7c:	54000700	b.eq	0xfffff7f85f5c  // b.none
   0x0000fffff7f85e80:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85e84:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85e88:	aa1303e1	mov	x1, x19
   0x0000fffff7f85e8c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85e90:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7f85e94:	aa1403e4	mov	x4, x20
   0x0000fffff7f85e98:	aa1603e5	mov	x5, x22
   0x0000fffff7f85e9c:	d2869090	mov	x16, #0x3484                	// #13444
   0x0000fffff7f85ea0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85ea4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85ea8:	d63f0200	blr	x16
   0x0000fffff7f85eac:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85eb0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85eb4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85eb8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85ebc:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f85ec0:	d65f03c0	ret
   0x0000fffff7f85ec4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85ec8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85ecc:	b900028a	str	w10, [x20]
   0x0000fffff7f85ed0:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85ed4:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85ed8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85edc:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85ee0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85ee4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85ee8:	d65f03c0	ret
   0x0000fffff7f85eec:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f85ef0:	17fffff5	b	0xfffff7f85ec4
   0x0000fffff7f85ef4:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f85ef8:	17fffff3	b	0xfffff7f85ec4
   0x0000fffff7f85efc:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f85f00:	17fffff1	b	0xfffff7f85ec4
   0x0000fffff7f85f04:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f85f08:	17ffffef	b	0xfffff7f85ec4
   0x0000fffff7f85f0c:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f85f10:	17ffffed	b	0xfffff7f85ec4
   0x0000fffff7f85f14:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f85f18:	17ffffeb	b	0xfffff7f85ec4
   0x0000fffff7f85f1c:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f85f20:	17ffffe9	b	0xfffff7f85ec4
   0x0000fffff7f85f24:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f85f28:	17ffffe7	b	0xfffff7f85ec4
   0x0000fffff7f85f2c:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f85f30:	17ffffe5	b	0xfffff7f85ec4
   0x0000fffff7f85f34:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f85f38:	17ffffe3	b	0xfffff7f85ec4
   0x0000fffff7f85f3c:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7f85f40:	17ffffe1	b	0xfffff7f85ec4
   0x0000fffff7f85f44:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7f85f48:	17ffffdf	b	0xfffff7f85ec4
   0x0000fffff7f85f4c:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7f85f50:	17ffffdd	b	0xfffff7f85ec4
   0x0000fffff7f85f54:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7f85f58:	17ffffdb	b	0xfffff7f85ec4
   0x0000fffff7f85f5c:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7f85f60:	17ffffd9	b	0xfffff7f85ec4
   0x0000fffff7f85f64:	00000000	udf	#0
   0x0000fffff7f85f68:	00000000	udf	#0
   0x0000fffff7f85f6c:	00000000	udf	#0
   0x0000fffff7f85f70:	00000000	udf	#0
   0x0000fffff7f85f74:	00000000	udf	#0
   0x0000fffff7f85f78:	00000000	udf	#0
   0x0000fffff7f85f7c:	00000000	udf	#0
   0x0000fffff7f85f80:	00000000	udf	#0
   0x0000fffff7f85f84:	00000000	udf	#0
   0x0000fffff7f85f88:	00000000	udf	#0
   0x0000fffff7f85f8c:	00000000	udf	#0
   0x0000fffff7f85f90:	00000000	udf	#0
   0x0000fffff7f85f94:	00000000	udf	#0
   0x0000fffff7f85f98:	00000000	udf	#0
   0x0000fffff7f85f9c:	00000000	udf	#0
   0x0000fffff7f85fa0:	00000000	udf	#0
   0x0000fffff7f85fa4:	00000000	udf	#0
   0x0000fffff7f85fa8:	00000000	udf	#0
   0x0000fffff7f85fac:	00000000	udf	#0
   0x0000fffff7f85fb0:	00000000	udf	#0
   0x0000fffff7f85fb4:	00000000	udf	#0
   0x0000fffff7f85fb8:	00000000	udf	#0
   0x0000fffff7f85fbc:	00000000	udf	#0
   0x0000fffff7f85fc0:	00000000	udf	#0
   0x0000fffff7f85fc4:	00000000	udf	#0
   0x0000fffff7f85fc8:	00000000	udf	#0
   0x0000fffff7f85fcc:	00000000	udf	#0
   0x0000fffff7f85fd0:	00000000	udf	#0
   0x0000fffff7f85fd4:	00000000	udf	#0
   0x0000fffff7f85fd8:	00000000	udf	#0
   0x0000fffff7f85fdc:	00000000	udf	#0
   0x0000fffff7f85fe0:	00000000	udf	#0
   0x0000fffff7f85fe4:	00000000	udf	#0
   0x0000fffff7f85fe8:	00000000	udf	#0
   0x0000fffff7f85fec:	00000000	udf	#0
   0x0000fffff7f85ff0:	00000000	udf	#0
   0x0000fffff7f85ff4:	00000000	udf	#0
   0x0000fffff7f85ff8:	00000000	udf	#0
   0x0000fffff7f85ffc:	00000000	udf	#0
End of assembler dump.
