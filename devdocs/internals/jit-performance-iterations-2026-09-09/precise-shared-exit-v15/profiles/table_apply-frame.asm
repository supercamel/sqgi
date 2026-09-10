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
   0x0000fffff7f85038:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7f8503c:	f2b55690	movk	x16, #0xaab4, lsl #16
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
   0x0000fffff7f85068:	540001c1	b.ne	0xfffff7f850a0  // b.any
   0x0000fffff7f8506c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f85070:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85074:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85078:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8507c:	54000801	b.ne	0xfffff7f8517c  // b.any
   0x0000fffff7f85080:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7f85084:	f9400e6b	ldr	x11, [x19, #24]
   0x0000fffff7f85088:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f8508c:	eb09015f	cmp	x10, x9
   0x0000fffff7f85090:	54000762	b.cs	0xfffff7f8517c  // b.hs, b.nlast
   0x0000fffff7f85094:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f85098:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f8509c:	14000014	b	0xfffff7f850ec
   0x0000fffff7f850a0:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f850a4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f850a8:	540006a0	b.eq	0xfffff7f8517c  // b.none
   0x0000fffff7f850ac:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f850b0:	b94013ea	ldr	w10, [sp, #16]
   0x0000fffff7f850b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f850b8:	54000621	b.ne	0xfffff7f8517c  // b.any
   0x0000fffff7f850bc:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f850c0:	f9400fea	ldr	x10, [sp, #24]
   0x0000fffff7f850c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f850c8:	540005a1	b.ne	0xfffff7f8517c  // b.any
   0x0000fffff7f850cc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f850d0:	b94017ea	ldr	w10, [sp, #20]
   0x0000fffff7f850d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f850d8:	54000521	b.ne	0xfffff7f8517c  // b.any
   0x0000fffff7f850dc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f850e0:	f94013ea	ldr	x10, [sp, #32]
   0x0000fffff7f850e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f850e8:	540004a1	b.ne	0xfffff7f8517c  // b.any
   0x0000fffff7f850ec:	b940016d	ldr	w13, [x11]
   0x0000fffff7f850f0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f850f4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f850f8:	eb0901bf	cmp	x13, x9
   0x0000fffff7f850fc:	54000400	b.eq	0xfffff7f8517c  // b.none
   0x0000fffff7f85100:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85104:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85108:	36d801d1	tbz	w17, #27, 0xfffff7f85140
   0x0000fffff7f8510c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85110:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85114:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85118:	54000321	b.ne	0xfffff7f8517c  // b.any
   0x0000fffff7f8511c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85120:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85124:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85128:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8512c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85130:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85134:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85138:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8513c:	54000209	b.ls	0xfffff7f8517c  // b.plast
   0x0000fffff7f85140:	36d8008d	tbz	w13, #27, 0xfffff7f85150
   0x0000fffff7f85144:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85148:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8514c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85150:	36d80091	tbz	w17, #27, 0xfffff7f85160
   0x0000fffff7f85154:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85158:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8515c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85160:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7f85164:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f85168:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8516c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85170:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f85174:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f85178:	1400000e	b	0xfffff7f851b0
   0x0000fffff7f8517c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f85180:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85184:	aa1303e1	mov	x1, x19
   0x0000fffff7f85188:	aa1503e2	mov	x2, x21
   0x0000fffff7f8518c:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7f85190:	aa1403e4	mov	x4, x20
   0x0000fffff7f85194:	aa1603e5	mov	x5, x22
   0x0000fffff7f85198:	d28ac810	mov	x16, #0x5640                	// #22080
   0x0000fffff7f8519c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f851a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f851a4:	d63f0200	blr	x16
   0x0000fffff7f851a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f851ac:	540061c0	b.eq	0xfffff7f85de4  // b.none
   0x0000fffff7f851b0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f851b4:	37d806a9	tbnz	w9, #27, 0xfffff7f85288
   0x0000fffff7f851b8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f851bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f851c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f851c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f851c8:	540001c1	b.ne	0xfffff7f85200  // b.any
   0x0000fffff7f851cc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f851d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f851d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f851d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f851dc:	54000121	b.ne	0xfffff7f85200  // b.any
   0x0000fffff7f851e0:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f851e4:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f851e8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f851ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f851f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f851f4:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f851f8:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f851fc:	14000030	b	0xfffff7f852bc
   0x0000fffff7f85200:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85204:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85208:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8520c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85210:	54000120	b.eq	0xfffff7f85234  // b.none
   0x0000fffff7f85214:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85218:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8521c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85220:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85224:	54000321	b.ne	0xfffff7f85288  // b.any
   0x0000fffff7f85228:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f8522c:	9e620120	scvtf	d0, x9
   0x0000fffff7f85230:	14000002	b	0xfffff7f85238
   0x0000fffff7f85234:	fd402e60	ldr	d0, [x19, #88]
   0x0000fffff7f85238:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f8523c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85240:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85244:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85248:	54000120	b.eq	0xfffff7f8526c  // b.none
   0x0000fffff7f8524c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f85250:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85254:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85258:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8525c:	54000161	b.ne	0xfffff7f85288  // b.any
   0x0000fffff7f85260:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f85264:	9e620121	scvtf	d1, x9
   0x0000fffff7f85268:	14000002	b	0xfffff7f85270
   0x0000fffff7f8526c:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7f85270:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f85274:	fd002e60	str	d0, [x19, #88]
   0x0000fffff7f85278:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8527c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85280:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f85284:	17ffffde	b	0xfffff7f851fc
   0x0000fffff7f85288:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8528c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85290:	aa1303e1	mov	x1, x19
   0x0000fffff7f85294:	aa1503e2	mov	x2, x21
   0x0000fffff7f85298:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7f8529c:	aa1403e4	mov	x4, x20
   0x0000fffff7f852a0:	aa1603e5	mov	x5, x22
   0x0000fffff7f852a4:	d295e690	mov	x16, #0xaf34                	// #44852
   0x0000fffff7f852a8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f852ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f852b0:	d63f0200	blr	x16
   0x0000fffff7f852b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f852b8:	540059a0	b.eq	0xfffff7f85dec  // b.none
   0x0000fffff7f852bc:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f852c0:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f852c4:	d29ffe2c	mov	x12, #0xfff1                	// #65521
   0x0000fffff7f852c8:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7f852cc:	36d80211	tbz	w17, #27, 0xfffff7f8530c
   0x0000fffff7f852d0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f852d4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f852d8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f852dc:	540001e1	b.ne	0xfffff7f85318  // b.any
   0x0000fffff7f852e0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f852e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f852e8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f852ec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f852f0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f852f4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f852f8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f852fc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85300:	540000c9	b.ls	0xfffff7f85318  // b.plast
   0x0000fffff7f85304:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85308:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8530c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f85310:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f85314:	1400000e	b	0xfffff7f8534c
   0x0000fffff7f85318:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8531c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85320:	aa1303e1	mov	x1, x19
   0x0000fffff7f85324:	aa1503e2	mov	x2, x21
   0x0000fffff7f85328:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f8532c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85330:	aa1603e5	mov	x5, x22
   0x0000fffff7f85334:	d286be10	mov	x16, #0x35f0                	// #13808
   0x0000fffff7f85338:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8533c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85340:	d63f0200	blr	x16
   0x0000fffff7f85344:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85348:	54005560	b.eq	0xfffff7f85df4  // b.none
   0x0000fffff7f8534c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85350:	37d80389	tbnz	w9, #27, 0xfffff7f853c0
   0x0000fffff7f85354:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85358:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8535c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85360:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85364:	540002e1	b.ne	0xfffff7f853c0  // b.any
   0x0000fffff7f85368:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8536c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85370:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85374:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85378:	54000241	b.ne	0xfffff7f853c0  // b.any
   0x0000fffff7f8537c:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f85380:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f85384:	f100015f	cmp	x10, #0x0
   0x0000fffff7f85388:	540001c0	b.eq	0xfffff7f853c0  // b.none
   0x0000fffff7f8538c:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f85390:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f85394:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f85398:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f8539c:	eb0b015f	cmp	x10, x11
   0x0000fffff7f853a0:	54000100	b.eq	0xfffff7f853c0  // b.none
   0x0000fffff7f853a4:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f853a8:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f853ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f853b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f853b4:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f853b8:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f853bc:	1400000e	b	0xfffff7f853f4
   0x0000fffff7f853c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f853c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f853c8:	aa1303e1	mov	x1, x19
   0x0000fffff7f853cc:	aa1503e2	mov	x2, x21
   0x0000fffff7f853d0:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7f853d4:	aa1403e4	mov	x4, x20
   0x0000fffff7f853d8:	aa1603e5	mov	x5, x22
   0x0000fffff7f853dc:	d294b810	mov	x16, #0xa5c0                	// #42432
   0x0000fffff7f853e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f853e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f853e8:	d63f0200	blr	x16
   0x0000fffff7f853ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f853f0:	54005060	b.eq	0xfffff7f85dfc  // b.none
   0x0000fffff7f853f4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f853f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f853fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f85400:	aa1503e2	mov	x2, x21
   0x0000fffff7f85404:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7f85408:	aa1403e4	mov	x4, x20
   0x0000fffff7f8540c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85410:	d28d3010	mov	x16, #0x6980                	// #27008
   0x0000fffff7f85414:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85418:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8541c:	d63f0200	blr	x16
   0x0000fffff7f85420:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85424:	54004f00	b.eq	0xfffff7f85e04  // b.none
   0x0000fffff7f85428:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8542c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85430:	540005a0	b.eq	0xfffff7f854e4  // b.none
   0x0000fffff7f85434:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f85438:	b94033ea	ldr	w10, [sp, #48]
   0x0000fffff7f8543c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85440:	54000521	b.ne	0xfffff7f854e4  // b.any
   0x0000fffff7f85444:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f85448:	f9401fea	ldr	x10, [sp, #56]
   0x0000fffff7f8544c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85450:	540004a1	b.ne	0xfffff7f854e4  // b.any
   0x0000fffff7f85454:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85458:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8545c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85460:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85464:	54000400	b.eq	0xfffff7f854e4  // b.none
   0x0000fffff7f85468:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8546c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85470:	36d801d1	tbz	w17, #27, 0xfffff7f854a8
   0x0000fffff7f85474:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85478:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8547c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85480:	54000321	b.ne	0xfffff7f854e4  // b.any
   0x0000fffff7f85484:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85488:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8548c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85490:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85494:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85498:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8549c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f854a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f854a4:	54000209	b.ls	0xfffff7f854e4  // b.plast
   0x0000fffff7f854a8:	36d8008d	tbz	w13, #27, 0xfffff7f854b8
   0x0000fffff7f854ac:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f854b0:	91000529	add	x9, x9, #0x1
   0x0000fffff7f854b4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f854b8:	36d80091	tbz	w17, #27, 0xfffff7f854c8
   0x0000fffff7f854bc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f854c0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f854c4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f854c8:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7f854cc:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f854d0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f854d4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f854d8:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f854dc:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f854e0:	1400000e	b	0xfffff7f85518
   0x0000fffff7f854e4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f854e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f854ec:	aa1303e1	mov	x1, x19
   0x0000fffff7f854f0:	aa1503e2	mov	x2, x21
   0x0000fffff7f854f4:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f854f8:	aa1403e4	mov	x4, x20
   0x0000fffff7f854fc:	aa1603e5	mov	x5, x22
   0x0000fffff7f85500:	d2963e10	mov	x16, #0xb1f0                	// #45552
   0x0000fffff7f85504:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85508:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8550c:	d63f0200	blr	x16
   0x0000fffff7f85510:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85514:	540047c0	b.eq	0xfffff7f85e0c  // b.none
   0x0000fffff7f85518:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8551c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85520:	540005a0	b.eq	0xfffff7f855d4  // b.none
   0x0000fffff7f85524:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f85528:	b94033ea	ldr	w10, [sp, #48]
   0x0000fffff7f8552c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85530:	54000521	b.ne	0xfffff7f855d4  // b.any
   0x0000fffff7f85534:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f85538:	f9401fea	ldr	x10, [sp, #56]
   0x0000fffff7f8553c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85540:	540004a1	b.ne	0xfffff7f855d4  // b.any
   0x0000fffff7f85544:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85548:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8554c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85550:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85554:	54000400	b.eq	0xfffff7f855d4  // b.none
   0x0000fffff7f85558:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8555c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85560:	36d801d1	tbz	w17, #27, 0xfffff7f85598
   0x0000fffff7f85564:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85568:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8556c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85570:	54000321	b.ne	0xfffff7f855d4  // b.any
   0x0000fffff7f85574:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85578:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8557c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85580:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85584:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85588:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8558c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85590:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85594:	54000209	b.ls	0xfffff7f855d4  // b.plast
   0x0000fffff7f85598:	36d8008d	tbz	w13, #27, 0xfffff7f855a8
   0x0000fffff7f8559c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f855a0:	91000529	add	x9, x9, #0x1
   0x0000fffff7f855a4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f855a8:	36d80091	tbz	w17, #27, 0xfffff7f855b8
   0x0000fffff7f855ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f855b0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f855b4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f855b8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f855bc:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f855c0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f855c4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f855c8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f855cc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f855d0:	1400000e	b	0xfffff7f85608
   0x0000fffff7f855d4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f855d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f855dc:	aa1303e1	mov	x1, x19
   0x0000fffff7f855e0:	aa1503e2	mov	x2, x21
   0x0000fffff7f855e4:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f855e8:	aa1403e4	mov	x4, x20
   0x0000fffff7f855ec:	aa1603e5	mov	x5, x22
   0x0000fffff7f855f0:	d2963e10	mov	x16, #0xb1f0                	// #45552
   0x0000fffff7f855f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f855f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f855fc:	d63f0200	blr	x16
   0x0000fffff7f85600:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85604:	54004080	b.eq	0xfffff7f85e14  // b.none
   0x0000fffff7f85608:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8560c:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f85610:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f85614:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85618:	540001c1	b.ne	0xfffff7f85650  // b.any
   0x0000fffff7f8561c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85620:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85624:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85628:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8562c:	54000801	b.ne	0xfffff7f8572c  // b.any
   0x0000fffff7f85630:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f85634:	f940366b	ldr	x11, [x19, #104]
   0x0000fffff7f85638:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f8563c:	eb09015f	cmp	x10, x9
   0x0000fffff7f85640:	54000762	b.cs	0xfffff7f8572c  // b.hs, b.nlast
   0x0000fffff7f85644:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f85648:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f8564c:	14000014	b	0xfffff7f8569c
   0x0000fffff7f85650:	f94037eb	ldr	x11, [sp, #104]
   0x0000fffff7f85654:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85658:	540006a0	b.eq	0xfffff7f8572c  // b.none
   0x0000fffff7f8565c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85660:	b94053ea	ldr	w10, [sp, #80]
   0x0000fffff7f85664:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85668:	54000621	b.ne	0xfffff7f8572c  // b.any
   0x0000fffff7f8566c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f85670:	f9402fea	ldr	x10, [sp, #88]
   0x0000fffff7f85674:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85678:	540005a1	b.ne	0xfffff7f8572c  // b.any
   0x0000fffff7f8567c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85680:	b94057ea	ldr	w10, [sp, #84]
   0x0000fffff7f85684:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85688:	54000521	b.ne	0xfffff7f8572c  // b.any
   0x0000fffff7f8568c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f85690:	f94033ea	ldr	x10, [sp, #96]
   0x0000fffff7f85694:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85698:	540004a1	b.ne	0xfffff7f8572c  // b.any
   0x0000fffff7f8569c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f856a0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f856a4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f856a8:	eb0901bf	cmp	x13, x9
   0x0000fffff7f856ac:	54000400	b.eq	0xfffff7f8572c  // b.none
   0x0000fffff7f856b0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f856b4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f856b8:	36d801d1	tbz	w17, #27, 0xfffff7f856f0
   0x0000fffff7f856bc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f856c0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f856c4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f856c8:	54000321	b.ne	0xfffff7f8572c  // b.any
   0x0000fffff7f856cc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f856d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f856d4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f856d8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f856dc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f856e0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f856e4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f856e8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f856ec:	54000209	b.ls	0xfffff7f8572c  // b.plast
   0x0000fffff7f856f0:	36d8008d	tbz	w13, #27, 0xfffff7f85700
   0x0000fffff7f856f4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f856f8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f856fc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85700:	36d80091	tbz	w17, #27, 0xfffff7f85710
   0x0000fffff7f85704:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85708:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8570c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85710:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f85714:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f85718:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8571c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85720:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f85724:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f85728:	1400000e	b	0xfffff7f85760
   0x0000fffff7f8572c:	910143e6	add	x6, sp, #0x50
   0x0000fffff7f85730:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85734:	aa1303e1	mov	x1, x19
   0x0000fffff7f85738:	aa1503e2	mov	x2, x21
   0x0000fffff7f8573c:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f85740:	aa1403e4	mov	x4, x20
   0x0000fffff7f85744:	aa1603e5	mov	x5, x22
   0x0000fffff7f85748:	d28ac810	mov	x16, #0x5640                	// #22080
   0x0000fffff7f8574c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85750:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85754:	d63f0200	blr	x16
   0x0000fffff7f85758:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8575c:	54003600	b.eq	0xfffff7f85e1c  // b.none
   0x0000fffff7f85760:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f85764:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f85768:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f8576c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85770:	540001c1	b.ne	0xfffff7f857a8  // b.any
   0x0000fffff7f85774:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f85778:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8577c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85780:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85784:	54000801	b.ne	0xfffff7f85884  // b.any
   0x0000fffff7f85788:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7f8578c:	f9400e6b	ldr	x11, [x19, #24]
   0x0000fffff7f85790:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f85794:	eb09015f	cmp	x10, x9
   0x0000fffff7f85798:	54000762	b.cs	0xfffff7f85884  // b.hs, b.nlast
   0x0000fffff7f8579c:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f857a0:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f857a4:	14000014	b	0xfffff7f857f4
   0x0000fffff7f857a8:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f857ac:	f100017f	cmp	x11, #0x0
   0x0000fffff7f857b0:	540006a0	b.eq	0xfffff7f85884  // b.none
   0x0000fffff7f857b4:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f857b8:	b94013ea	ldr	w10, [sp, #16]
   0x0000fffff7f857bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f857c0:	54000621	b.ne	0xfffff7f85884  // b.any
   0x0000fffff7f857c4:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f857c8:	f9400fea	ldr	x10, [sp, #24]
   0x0000fffff7f857cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f857d0:	540005a1	b.ne	0xfffff7f85884  // b.any
   0x0000fffff7f857d4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f857d8:	b94017ea	ldr	w10, [sp, #20]
   0x0000fffff7f857dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f857e0:	54000521	b.ne	0xfffff7f85884  // b.any
   0x0000fffff7f857e4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f857e8:	f94013ea	ldr	x10, [sp, #32]
   0x0000fffff7f857ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f857f0:	540004a1	b.ne	0xfffff7f85884  // b.any
   0x0000fffff7f857f4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f857f8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f857fc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85800:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85804:	54000400	b.eq	0xfffff7f85884  // b.none
   0x0000fffff7f85808:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8580c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85810:	36d801d1	tbz	w17, #27, 0xfffff7f85848
   0x0000fffff7f85814:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85818:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8581c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85820:	54000321	b.ne	0xfffff7f85884  // b.any
   0x0000fffff7f85824:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85828:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8582c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85830:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85834:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85838:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8583c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85840:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85844:	54000209	b.ls	0xfffff7f85884  // b.plast
   0x0000fffff7f85848:	36d8008d	tbz	w13, #27, 0xfffff7f85858
   0x0000fffff7f8584c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85850:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85854:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85858:	36d80091	tbz	w17, #27, 0xfffff7f85868
   0x0000fffff7f8585c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85860:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85864:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85868:	b940726e	ldr	w14, [x19, #112]
   0x0000fffff7f8586c:	f9403e6f	ldr	x15, [x19, #120]
   0x0000fffff7f85870:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85874:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85878:	f9003e6c	str	x12, [x19, #120]
   0x0000fffff7f8587c:	b900726d	str	w13, [x19, #112]
   0x0000fffff7f85880:	1400000e	b	0xfffff7f858b8
   0x0000fffff7f85884:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f85888:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8588c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85890:	aa1503e2	mov	x2, x21
   0x0000fffff7f85894:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f85898:	aa1403e4	mov	x4, x20
   0x0000fffff7f8589c:	aa1603e5	mov	x5, x22
   0x0000fffff7f858a0:	d28ac810	mov	x16, #0x5640                	// #22080
   0x0000fffff7f858a4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f858a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f858ac:	d63f0200	blr	x16
   0x0000fffff7f858b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f858b4:	54002b80	b.eq	0xfffff7f85e24  // b.none
   0x0000fffff7f858b8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f858bc:	37d806a9	tbnz	w9, #27, 0xfffff7f85990
   0x0000fffff7f858c0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f858c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f858c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f858cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f858d0:	540001c1	b.ne	0xfffff7f85908  // b.any
   0x0000fffff7f858d4:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f858d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f858dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f858e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f858e4:	54000121	b.ne	0xfffff7f85908  // b.any
   0x0000fffff7f858e8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f858ec:	f9403e6a	ldr	x10, [x19, #120]
   0x0000fffff7f858f0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f858f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f858f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f858fc:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f85900:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f85904:	14000030	b	0xfffff7f859c4
   0x0000fffff7f85908:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8590c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85910:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85914:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85918:	54000120	b.eq	0xfffff7f8593c  // b.none
   0x0000fffff7f8591c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85920:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85924:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85928:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8592c:	54000321	b.ne	0xfffff7f85990  // b.any
   0x0000fffff7f85930:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f85934:	9e620120	scvtf	d0, x9
   0x0000fffff7f85938:	14000002	b	0xfffff7f85940
   0x0000fffff7f8593c:	fd403660	ldr	d0, [x19, #104]
   0x0000fffff7f85940:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f85944:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85948:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8594c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85950:	54000120	b.eq	0xfffff7f85974  // b.none
   0x0000fffff7f85954:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f85958:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8595c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85960:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85964:	54000161	b.ne	0xfffff7f85990  // b.any
   0x0000fffff7f85968:	f9403e69	ldr	x9, [x19, #120]
   0x0000fffff7f8596c:	9e620121	scvtf	d1, x9
   0x0000fffff7f85970:	14000002	b	0xfffff7f85978
   0x0000fffff7f85974:	fd403e61	ldr	d1, [x19, #120]
   0x0000fffff7f85978:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8597c:	fd003660	str	d0, [x19, #104]
   0x0000fffff7f85980:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85984:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85988:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f8598c:	17ffffde	b	0xfffff7f85904
   0x0000fffff7f85990:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85994:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85998:	aa1303e1	mov	x1, x19
   0x0000fffff7f8599c:	aa1503e2	mov	x2, x21
   0x0000fffff7f859a0:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f859a4:	aa1403e4	mov	x4, x20
   0x0000fffff7f859a8:	aa1603e5	mov	x5, x22
   0x0000fffff7f859ac:	d295e690	mov	x16, #0xaf34                	// #44852
   0x0000fffff7f859b0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f859b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f859b8:	d63f0200	blr	x16
   0x0000fffff7f859bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f859c0:	54002360	b.eq	0xfffff7f85e2c  // b.none
   0x0000fffff7f859c4:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f859c8:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f859cc:	d2807cac	mov	x12, #0x3e5                 	// #997
   0x0000fffff7f859d0:	b9407271	ldr	w17, [x19, #112]
   0x0000fffff7f859d4:	36d80211	tbz	w17, #27, 0xfffff7f85a14
   0x0000fffff7f859d8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f859dc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f859e0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f859e4:	540001e1	b.ne	0xfffff7f85a20  // b.any
   0x0000fffff7f859e8:	f9403e6f	ldr	x15, [x19, #120]
   0x0000fffff7f859ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f859f0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f859f4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f859f8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f859fc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85a00:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85a04:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85a08:	540000c9	b.ls	0xfffff7f85a20  // b.plast
   0x0000fffff7f85a0c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85a10:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85a14:	f9003e6c	str	x12, [x19, #120]
   0x0000fffff7f85a18:	b900726d	str	w13, [x19, #112]
   0x0000fffff7f85a1c:	1400000e	b	0xfffff7f85a54
   0x0000fffff7f85a20:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85a24:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85a28:	aa1303e1	mov	x1, x19
   0x0000fffff7f85a2c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85a30:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f85a34:	aa1403e4	mov	x4, x20
   0x0000fffff7f85a38:	aa1603e5	mov	x5, x22
   0x0000fffff7f85a3c:	d286be10	mov	x16, #0x35f0                	// #13808
   0x0000fffff7f85a40:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85a44:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85a48:	d63f0200	blr	x16
   0x0000fffff7f85a4c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85a50:	54001f20	b.eq	0xfffff7f85e34  // b.none
   0x0000fffff7f85a54:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85a58:	37d80389	tbnz	w9, #27, 0xfffff7f85ac8
   0x0000fffff7f85a5c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85a60:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85a64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85a68:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85a6c:	540002e1	b.ne	0xfffff7f85ac8  // b.any
   0x0000fffff7f85a70:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f85a74:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85a78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85a7c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85a80:	54000241	b.ne	0xfffff7f85ac8  // b.any
   0x0000fffff7f85a84:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f85a88:	f9403e6a	ldr	x10, [x19, #120]
   0x0000fffff7f85a8c:	f100015f	cmp	x10, #0x0
   0x0000fffff7f85a90:	540001c0	b.eq	0xfffff7f85ac8  // b.none
   0x0000fffff7f85a94:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f85a98:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f85a9c:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f85aa0:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f85aa4:	eb0b015f	cmp	x10, x11
   0x0000fffff7f85aa8:	54000100	b.eq	0xfffff7f85ac8  // b.none
   0x0000fffff7f85aac:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f85ab0:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f85ab4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85ab8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85abc:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f85ac0:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f85ac4:	1400000e	b	0xfffff7f85afc
   0x0000fffff7f85ac8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85acc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85ad0:	aa1303e1	mov	x1, x19
   0x0000fffff7f85ad4:	aa1503e2	mov	x2, x21
   0x0000fffff7f85ad8:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7f85adc:	aa1403e4	mov	x4, x20
   0x0000fffff7f85ae0:	aa1603e5	mov	x5, x22
   0x0000fffff7f85ae4:	d294b810	mov	x16, #0xa5c0                	// #42432
   0x0000fffff7f85ae8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85aec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85af0:	d63f0200	blr	x16
   0x0000fffff7f85af4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85af8:	54001a20	b.eq	0xfffff7f85e3c  // b.none
   0x0000fffff7f85afc:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f85b00:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85b04:	aa1303e1	mov	x1, x19
   0x0000fffff7f85b08:	aa1503e2	mov	x2, x21
   0x0000fffff7f85b0c:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7f85b10:	aa1403e4	mov	x4, x20
   0x0000fffff7f85b14:	aa1603e5	mov	x5, x22
   0x0000fffff7f85b18:	d28d3010	mov	x16, #0x6980                	// #27008
   0x0000fffff7f85b1c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85b20:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85b24:	d63f0200	blr	x16
   0x0000fffff7f85b28:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85b2c:	540018c0	b.eq	0xfffff7f85e44  // b.none
   0x0000fffff7f85b30:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f85b34:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85b38:	540005a0	b.eq	0xfffff7f85bec  // b.none
   0x0000fffff7f85b3c:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f85b40:	b94033ea	ldr	w10, [sp, #48]
   0x0000fffff7f85b44:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85b48:	54000521	b.ne	0xfffff7f85bec  // b.any
   0x0000fffff7f85b4c:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f85b50:	f9401fea	ldr	x10, [sp, #56]
   0x0000fffff7f85b54:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85b58:	540004a1	b.ne	0xfffff7f85bec  // b.any
   0x0000fffff7f85b5c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85b60:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85b64:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85b68:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85b6c:	54000400	b.eq	0xfffff7f85bec  // b.none
   0x0000fffff7f85b70:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85b74:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85b78:	36d801d1	tbz	w17, #27, 0xfffff7f85bb0
   0x0000fffff7f85b7c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85b80:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85b84:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85b88:	54000321	b.ne	0xfffff7f85bec  // b.any
   0x0000fffff7f85b8c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85b90:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85b94:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85b98:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85b9c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85ba0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85ba4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85ba8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85bac:	54000209	b.ls	0xfffff7f85bec  // b.plast
   0x0000fffff7f85bb0:	36d8008d	tbz	w13, #27, 0xfffff7f85bc0
   0x0000fffff7f85bb4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85bb8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85bbc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85bc0:	36d80091	tbz	w17, #27, 0xfffff7f85bd0
   0x0000fffff7f85bc4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85bc8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85bcc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85bd0:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7f85bd4:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f85bd8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85bdc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85be0:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f85be4:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f85be8:	1400000e	b	0xfffff7f85c20
   0x0000fffff7f85bec:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85bf0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85bf4:	aa1303e1	mov	x1, x19
   0x0000fffff7f85bf8:	aa1503e2	mov	x2, x21
   0x0000fffff7f85bfc:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7f85c00:	aa1403e4	mov	x4, x20
   0x0000fffff7f85c04:	aa1603e5	mov	x5, x22
   0x0000fffff7f85c08:	d2963e10	mov	x16, #0xb1f0                	// #45552
   0x0000fffff7f85c0c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85c10:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85c14:	d63f0200	blr	x16
   0x0000fffff7f85c18:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85c1c:	54001180	b.eq	0xfffff7f85e4c  // b.none
   0x0000fffff7f85c20:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85c24:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f85c28:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f85c2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85c30:	540001c1	b.ne	0xfffff7f85c68  // b.any
   0x0000fffff7f85c34:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85c38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85c3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85c40:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85c44:	54000801	b.ne	0xfffff7f85d44  // b.any
   0x0000fffff7f85c48:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f85c4c:	f9402e6b	ldr	x11, [x19, #88]
   0x0000fffff7f85c50:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f85c54:	eb09015f	cmp	x10, x9
   0x0000fffff7f85c58:	54000762	b.cs	0xfffff7f85d44  // b.hs, b.nlast
   0x0000fffff7f85c5c:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f85c60:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f85c64:	14000014	b	0xfffff7f85cb4
   0x0000fffff7f85c68:	f94047eb	ldr	x11, [sp, #136]
   0x0000fffff7f85c6c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85c70:	540006a0	b.eq	0xfffff7f85d44  // b.none
   0x0000fffff7f85c74:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85c78:	b94073ea	ldr	w10, [sp, #112]
   0x0000fffff7f85c7c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85c80:	54000621	b.ne	0xfffff7f85d44  // b.any
   0x0000fffff7f85c84:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f85c88:	f9403fea	ldr	x10, [sp, #120]
   0x0000fffff7f85c8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85c90:	540005a1	b.ne	0xfffff7f85d44  // b.any
   0x0000fffff7f85c94:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85c98:	b94077ea	ldr	w10, [sp, #116]
   0x0000fffff7f85c9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85ca0:	54000521	b.ne	0xfffff7f85d44  // b.any
   0x0000fffff7f85ca4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f85ca8:	f94043ea	ldr	x10, [sp, #128]
   0x0000fffff7f85cac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85cb0:	540004a1	b.ne	0xfffff7f85d44  // b.any
   0x0000fffff7f85cb4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85cb8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85cbc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85cc0:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85cc4:	54000400	b.eq	0xfffff7f85d44  // b.none
   0x0000fffff7f85cc8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85ccc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85cd0:	36d801d1	tbz	w17, #27, 0xfffff7f85d08
   0x0000fffff7f85cd4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85cd8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85cdc:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85ce0:	54000321	b.ne	0xfffff7f85d44  // b.any
   0x0000fffff7f85ce4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85ce8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85cec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85cf0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85cf4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85cf8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85cfc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85d00:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85d04:	54000209	b.ls	0xfffff7f85d44  // b.plast
   0x0000fffff7f85d08:	36d8008d	tbz	w13, #27, 0xfffff7f85d18
   0x0000fffff7f85d0c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85d10:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85d14:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85d18:	36d80091	tbz	w17, #27, 0xfffff7f85d28
   0x0000fffff7f85d1c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85d20:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85d24:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85d28:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7f85d2c:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f85d30:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85d34:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85d38:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f85d3c:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f85d40:	1400000e	b	0xfffff7f85d78
   0x0000fffff7f85d44:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f85d48:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85d4c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85d50:	aa1503e2	mov	x2, x21
   0x0000fffff7f85d54:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7f85d58:	aa1403e4	mov	x4, x20
   0x0000fffff7f85d5c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85d60:	d28ac810	mov	x16, #0x5640                	// #22080
   0x0000fffff7f85d64:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85d68:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85d6c:	d63f0200	blr	x16
   0x0000fffff7f85d70:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85d74:	54000700	b.eq	0xfffff7f85e54  // b.none
   0x0000fffff7f85d78:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85d7c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85d80:	aa1303e1	mov	x1, x19
   0x0000fffff7f85d84:	aa1503e2	mov	x2, x21
   0x0000fffff7f85d88:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7f85d8c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85d90:	aa1603e5	mov	x5, x22
   0x0000fffff7f85d94:	d288c090	mov	x16, #0x4604                	// #17924
   0x0000fffff7f85d98:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85d9c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85da0:	d63f0200	blr	x16
   0x0000fffff7f85da4:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85da8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85dac:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85db0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85db4:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f85db8:	d65f03c0	ret
   0x0000fffff7f85dbc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85dc0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85dc4:	b900028a	str	w10, [x20]
   0x0000fffff7f85dc8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85dcc:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85dd0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85dd4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85dd8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85ddc:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85de0:	d65f03c0	ret
   0x0000fffff7f85de4:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f85de8:	17fffff5	b	0xfffff7f85dbc
   0x0000fffff7f85dec:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f85df0:	17fffff3	b	0xfffff7f85dbc
   0x0000fffff7f85df4:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f85df8:	17fffff1	b	0xfffff7f85dbc
   0x0000fffff7f85dfc:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f85e00:	17ffffef	b	0xfffff7f85dbc
   0x0000fffff7f85e04:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f85e08:	17ffffed	b	0xfffff7f85dbc
   0x0000fffff7f85e0c:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f85e10:	17ffffeb	b	0xfffff7f85dbc
   0x0000fffff7f85e14:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f85e18:	17ffffe9	b	0xfffff7f85dbc
   0x0000fffff7f85e1c:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f85e20:	17ffffe7	b	0xfffff7f85dbc
   0x0000fffff7f85e24:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f85e28:	17ffffe5	b	0xfffff7f85dbc
   0x0000fffff7f85e2c:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f85e30:	17ffffe3	b	0xfffff7f85dbc
   0x0000fffff7f85e34:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7f85e38:	17ffffe1	b	0xfffff7f85dbc
   0x0000fffff7f85e3c:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7f85e40:	17ffffdf	b	0xfffff7f85dbc
   0x0000fffff7f85e44:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7f85e48:	17ffffdd	b	0xfffff7f85dbc
   0x0000fffff7f85e4c:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7f85e50:	17ffffdb	b	0xfffff7f85dbc
   0x0000fffff7f85e54:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7f85e58:	17ffffd9	b	0xfffff7f85dbc
   0x0000fffff7f85e5c:	00000000	udf	#0
   0x0000fffff7f85e60:	00000000	udf	#0
   0x0000fffff7f85e64:	00000000	udf	#0
   0x0000fffff7f85e68:	00000000	udf	#0
   0x0000fffff7f85e6c:	00000000	udf	#0
   0x0000fffff7f85e70:	00000000	udf	#0
   0x0000fffff7f85e74:	00000000	udf	#0
   0x0000fffff7f85e78:	00000000	udf	#0
   0x0000fffff7f85e7c:	00000000	udf	#0
   0x0000fffff7f85e80:	00000000	udf	#0
   0x0000fffff7f85e84:	00000000	udf	#0
   0x0000fffff7f85e88:	00000000	udf	#0
   0x0000fffff7f85e8c:	00000000	udf	#0
   0x0000fffff7f85e90:	00000000	udf	#0
   0x0000fffff7f85e94:	00000000	udf	#0
   0x0000fffff7f85e98:	00000000	udf	#0
   0x0000fffff7f85e9c:	00000000	udf	#0
   0x0000fffff7f85ea0:	00000000	udf	#0
   0x0000fffff7f85ea4:	00000000	udf	#0
   0x0000fffff7f85ea8:	00000000	udf	#0
   0x0000fffff7f85eac:	00000000	udf	#0
   0x0000fffff7f85eb0:	00000000	udf	#0
   0x0000fffff7f85eb4:	00000000	udf	#0
   0x0000fffff7f85eb8:	00000000	udf	#0
   0x0000fffff7f85ebc:	00000000	udf	#0
   0x0000fffff7f85ec0:	00000000	udf	#0
   0x0000fffff7f85ec4:	00000000	udf	#0
   0x0000fffff7f85ec8:	00000000	udf	#0
   0x0000fffff7f85ecc:	00000000	udf	#0
   0x0000fffff7f85ed0:	00000000	udf	#0
   0x0000fffff7f85ed4:	00000000	udf	#0
   0x0000fffff7f85ed8:	00000000	udf	#0
   0x0000fffff7f85edc:	00000000	udf	#0
   0x0000fffff7f85ee0:	00000000	udf	#0
   0x0000fffff7f85ee4:	00000000	udf	#0
   0x0000fffff7f85ee8:	00000000	udf	#0
   0x0000fffff7f85eec:	00000000	udf	#0
   0x0000fffff7f85ef0:	00000000	udf	#0
   0x0000fffff7f85ef4:	00000000	udf	#0
   0x0000fffff7f85ef8:	00000000	udf	#0
   0x0000fffff7f85efc:	00000000	udf	#0
   0x0000fffff7f85f00:	00000000	udf	#0
   0x0000fffff7f85f04:	00000000	udf	#0
   0x0000fffff7f85f08:	00000000	udf	#0
   0x0000fffff7f85f0c:	00000000	udf	#0
   0x0000fffff7f85f10:	00000000	udf	#0
   0x0000fffff7f85f14:	00000000	udf	#0
   0x0000fffff7f85f18:	00000000	udf	#0
   0x0000fffff7f85f1c:	00000000	udf	#0
   0x0000fffff7f85f20:	00000000	udf	#0
   0x0000fffff7f85f24:	00000000	udf	#0
   0x0000fffff7f85f28:	00000000	udf	#0
   0x0000fffff7f85f2c:	00000000	udf	#0
   0x0000fffff7f85f30:	00000000	udf	#0
   0x0000fffff7f85f34:	00000000	udf	#0
   0x0000fffff7f85f38:	00000000	udf	#0
   0x0000fffff7f85f3c:	00000000	udf	#0
   0x0000fffff7f85f40:	00000000	udf	#0
   0x0000fffff7f85f44:	00000000	udf	#0
   0x0000fffff7f85f48:	00000000	udf	#0
   0x0000fffff7f85f4c:	00000000	udf	#0
   0x0000fffff7f85f50:	00000000	udf	#0
   0x0000fffff7f85f54:	00000000	udf	#0
   0x0000fffff7f85f58:	00000000	udf	#0
   0x0000fffff7f85f5c:	00000000	udf	#0
   0x0000fffff7f85f60:	00000000	udf	#0
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
