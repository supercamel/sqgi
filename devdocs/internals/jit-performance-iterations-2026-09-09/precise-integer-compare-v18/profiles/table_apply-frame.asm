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
   0x0000fffff7f85148:	d28a3010	mov	x16, #0x5180                	// #20864
   0x0000fffff7f8514c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85150:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85154:	d63f0200	blr	x16
   0x0000fffff7f85158:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8515c:	54006020	b.eq	0xfffff7f85d60  // b.none
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
   0x0000fffff7f85254:	d294ee90	mov	x16, #0xa774                	// #42868
   0x0000fffff7f85258:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8525c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85260:	d63f0200	blr	x16
   0x0000fffff7f85264:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85268:	54005800	b.eq	0xfffff7f85d68  // b.none
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
   0x0000fffff7f852e4:	d286ce10	mov	x16, #0x3670                	// #13936
   0x0000fffff7f852e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f852ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f852f0:	d63f0200	blr	x16
   0x0000fffff7f852f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f852f8:	540053c0	b.eq	0xfffff7f85d70  // b.none
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
   0x0000fffff7f8538c:	d293c010	mov	x16, #0x9e00                	// #40448
   0x0000fffff7f85390:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85394:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85398:	d63f0200	blr	x16
   0x0000fffff7f8539c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f853a0:	54004ec0	b.eq	0xfffff7f85d78  // b.none
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
   0x0000fffff7f85484:	d28c9810	mov	x16, #0x64c0                	// #25792
   0x0000fffff7f85488:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8548c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85490:	d63f0200	blr	x16
   0x0000fffff7f85494:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85498:	54004740	b.eq	0xfffff7f85d80  // b.none
   0x0000fffff7f8549c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f854a0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f854a4:	aa1303e1	mov	x1, x19
   0x0000fffff7f854a8:	aa1503e2	mov	x2, x21
   0x0000fffff7f854ac:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f854b0:	aa1403e4	mov	x4, x20
   0x0000fffff7f854b4:	aa1603e5	mov	x5, x22
   0x0000fffff7f854b8:	d295a610	mov	x16, #0xad30                	// #44336
   0x0000fffff7f854bc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f854c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f854c4:	d63f0200	blr	x16
   0x0000fffff7f854c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f854cc:	540045e0	b.eq	0xfffff7f85d88  // b.none
   0x0000fffff7f854d0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f854d4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f854d8:	540004a0	b.eq	0xfffff7f8556c  // b.none
   0x0000fffff7f854dc:	b940016d	ldr	w13, [x11]
   0x0000fffff7f854e0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f854e4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f854e8:	eb0901bf	cmp	x13, x9
   0x0000fffff7f854ec:	54000400	b.eq	0xfffff7f8556c  // b.none
   0x0000fffff7f854f0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f854f4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f854f8:	36d801d1	tbz	w17, #27, 0xfffff7f85530
   0x0000fffff7f854fc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85500:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85504:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85508:	54000321	b.ne	0xfffff7f8556c  // b.any
   0x0000fffff7f8550c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85510:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85514:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85518:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8551c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85520:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85524:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85528:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8552c:	54000209	b.ls	0xfffff7f8556c  // b.plast
   0x0000fffff7f85530:	36d8008d	tbz	w13, #27, 0xfffff7f85540
   0x0000fffff7f85534:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85538:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8553c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85540:	36d80091	tbz	w17, #27, 0xfffff7f85550
   0x0000fffff7f85544:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85548:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8554c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85550:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f85554:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f85558:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8555c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85560:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f85564:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f85568:	1400000e	b	0xfffff7f855a0
   0x0000fffff7f8556c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85570:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85574:	aa1303e1	mov	x1, x19
   0x0000fffff7f85578:	aa1503e2	mov	x2, x21
   0x0000fffff7f8557c:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f85580:	aa1403e4	mov	x4, x20
   0x0000fffff7f85584:	aa1603e5	mov	x5, x22
   0x0000fffff7f85588:	d295a610	mov	x16, #0xad30                	// #44336
   0x0000fffff7f8558c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85590:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85594:	d63f0200	blr	x16
   0x0000fffff7f85598:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8559c:	54003fa0	b.eq	0xfffff7f85d90  // b.none
   0x0000fffff7f855a0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f855a4:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f855a8:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f855ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f855b0:	54000621	b.ne	0xfffff7f85674  // b.any
   0x0000fffff7f855b4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f855b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f855bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f855c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f855c4:	54000581	b.ne	0xfffff7f85674  // b.any
   0x0000fffff7f855c8:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f855cc:	f940366b	ldr	x11, [x19, #104]
   0x0000fffff7f855d0:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f855d4:	eb09015f	cmp	x10, x9
   0x0000fffff7f855d8:	540004e2	b.cs	0xfffff7f85674  // b.hs, b.nlast
   0x0000fffff7f855dc:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f855e0:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f855e4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f855e8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f855ec:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f855f0:	eb0901bf	cmp	x13, x9
   0x0000fffff7f855f4:	54000400	b.eq	0xfffff7f85674  // b.none
   0x0000fffff7f855f8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f855fc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85600:	36d801d1	tbz	w17, #27, 0xfffff7f85638
   0x0000fffff7f85604:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85608:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8560c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85610:	54000321	b.ne	0xfffff7f85674  // b.any
   0x0000fffff7f85614:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85618:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8561c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85620:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85624:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85628:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8562c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85630:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85634:	54000209	b.ls	0xfffff7f85674  // b.plast
   0x0000fffff7f85638:	36d8008d	tbz	w13, #27, 0xfffff7f85648
   0x0000fffff7f8563c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85640:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85644:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85648:	36d80091	tbz	w17, #27, 0xfffff7f85658
   0x0000fffff7f8564c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85650:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85654:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85658:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8565c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f85660:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85664:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85668:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8566c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f85670:	1400000e	b	0xfffff7f856a8
   0x0000fffff7f85674:	910143e6	add	x6, sp, #0x50
   0x0000fffff7f85678:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8567c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85680:	aa1503e2	mov	x2, x21
   0x0000fffff7f85684:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f85688:	aa1403e4	mov	x4, x20
   0x0000fffff7f8568c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85690:	d28a3010	mov	x16, #0x5180                	// #20864
   0x0000fffff7f85694:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85698:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8569c:	d63f0200	blr	x16
   0x0000fffff7f856a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f856a4:	540037a0	b.eq	0xfffff7f85d98  // b.none
   0x0000fffff7f856a8:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f856ac:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f856b0:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f856b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f856b8:	540001c1	b.ne	0xfffff7f856f0  // b.any
   0x0000fffff7f856bc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f856c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f856c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f856c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f856cc:	54000601	b.ne	0xfffff7f8578c  // b.any
   0x0000fffff7f856d0:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7f856d4:	f9400e6b	ldr	x11, [x19, #24]
   0x0000fffff7f856d8:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f856dc:	eb09015f	cmp	x10, x9
   0x0000fffff7f856e0:	54000562	b.cs	0xfffff7f8578c  // b.hs, b.nlast
   0x0000fffff7f856e4:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f856e8:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f856ec:	14000004	b	0xfffff7f856fc
   0x0000fffff7f856f0:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f856f4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f856f8:	540004a0	b.eq	0xfffff7f8578c  // b.none
   0x0000fffff7f856fc:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85700:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85704:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85708:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8570c:	54000400	b.eq	0xfffff7f8578c  // b.none
   0x0000fffff7f85710:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85714:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85718:	36d801d1	tbz	w17, #27, 0xfffff7f85750
   0x0000fffff7f8571c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85720:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85724:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85728:	54000321	b.ne	0xfffff7f8578c  // b.any
   0x0000fffff7f8572c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85730:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85734:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85738:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8573c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85740:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85744:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85748:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8574c:	54000209	b.ls	0xfffff7f8578c  // b.plast
   0x0000fffff7f85750:	36d8008d	tbz	w13, #27, 0xfffff7f85760
   0x0000fffff7f85754:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85758:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8575c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85760:	36d80091	tbz	w17, #27, 0xfffff7f85770
   0x0000fffff7f85764:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85768:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8576c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85770:	b940726e	ldr	w14, [x19, #112]
   0x0000fffff7f85774:	f9403e6f	ldr	x15, [x19, #120]
   0x0000fffff7f85778:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8577c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85780:	f9003e6c	str	x12, [x19, #120]
   0x0000fffff7f85784:	b900726d	str	w13, [x19, #112]
   0x0000fffff7f85788:	1400000e	b	0xfffff7f857c0
   0x0000fffff7f8578c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f85790:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85794:	aa1303e1	mov	x1, x19
   0x0000fffff7f85798:	aa1503e2	mov	x2, x21
   0x0000fffff7f8579c:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f857a0:	aa1403e4	mov	x4, x20
   0x0000fffff7f857a4:	aa1603e5	mov	x5, x22
   0x0000fffff7f857a8:	d28a3010	mov	x16, #0x5180                	// #20864
   0x0000fffff7f857ac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f857b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f857b4:	d63f0200	blr	x16
   0x0000fffff7f857b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f857bc:	54002f20	b.eq	0xfffff7f85da0  // b.none
   0x0000fffff7f857c0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f857c4:	37d806a9	tbnz	w9, #27, 0xfffff7f85898
   0x0000fffff7f857c8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f857cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f857d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f857d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f857d8:	540001c1	b.ne	0xfffff7f85810  // b.any
   0x0000fffff7f857dc:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f857e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f857e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f857e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f857ec:	54000121	b.ne	0xfffff7f85810  // b.any
   0x0000fffff7f857f0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f857f4:	f9403e6a	ldr	x10, [x19, #120]
   0x0000fffff7f857f8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f857fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85800:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85804:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f85808:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f8580c:	14000030	b	0xfffff7f858cc
   0x0000fffff7f85810:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85814:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85818:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8581c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85820:	54000120	b.eq	0xfffff7f85844  // b.none
   0x0000fffff7f85824:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85828:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8582c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85830:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85834:	54000321	b.ne	0xfffff7f85898  // b.any
   0x0000fffff7f85838:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8583c:	9e620120	scvtf	d0, x9
   0x0000fffff7f85840:	14000002	b	0xfffff7f85848
   0x0000fffff7f85844:	fd403660	ldr	d0, [x19, #104]
   0x0000fffff7f85848:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f8584c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85850:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85854:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85858:	54000120	b.eq	0xfffff7f8587c  // b.none
   0x0000fffff7f8585c:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f85860:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85864:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85868:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8586c:	54000161	b.ne	0xfffff7f85898  // b.any
   0x0000fffff7f85870:	f9403e69	ldr	x9, [x19, #120]
   0x0000fffff7f85874:	9e620121	scvtf	d1, x9
   0x0000fffff7f85878:	14000002	b	0xfffff7f85880
   0x0000fffff7f8587c:	fd403e61	ldr	d1, [x19, #120]
   0x0000fffff7f85880:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f85884:	fd003660	str	d0, [x19, #104]
   0x0000fffff7f85888:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8588c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85890:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f85894:	17ffffde	b	0xfffff7f8580c
   0x0000fffff7f85898:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8589c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f858a0:	aa1303e1	mov	x1, x19
   0x0000fffff7f858a4:	aa1503e2	mov	x2, x21
   0x0000fffff7f858a8:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f858ac:	aa1403e4	mov	x4, x20
   0x0000fffff7f858b0:	aa1603e5	mov	x5, x22
   0x0000fffff7f858b4:	d294ee90	mov	x16, #0xa774                	// #42868
   0x0000fffff7f858b8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f858bc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f858c0:	d63f0200	blr	x16
   0x0000fffff7f858c4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f858c8:	54002700	b.eq	0xfffff7f85da8  // b.none
   0x0000fffff7f858cc:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f858d0:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f858d4:	d2807cac	mov	x12, #0x3e5                 	// #997
   0x0000fffff7f858d8:	b9407271	ldr	w17, [x19, #112]
   0x0000fffff7f858dc:	36d80211	tbz	w17, #27, 0xfffff7f8591c
   0x0000fffff7f858e0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f858e4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f858e8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f858ec:	540001e1	b.ne	0xfffff7f85928  // b.any
   0x0000fffff7f858f0:	f9403e6f	ldr	x15, [x19, #120]
   0x0000fffff7f858f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f858f8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f858fc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85900:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85904:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85908:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8590c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85910:	540000c9	b.ls	0xfffff7f85928  // b.plast
   0x0000fffff7f85914:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85918:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8591c:	f9003e6c	str	x12, [x19, #120]
   0x0000fffff7f85920:	b900726d	str	w13, [x19, #112]
   0x0000fffff7f85924:	1400000e	b	0xfffff7f8595c
   0x0000fffff7f85928:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8592c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85930:	aa1303e1	mov	x1, x19
   0x0000fffff7f85934:	aa1503e2	mov	x2, x21
   0x0000fffff7f85938:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f8593c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85940:	aa1603e5	mov	x5, x22
   0x0000fffff7f85944:	d286ce10	mov	x16, #0x3670                	// #13936
   0x0000fffff7f85948:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8594c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85950:	d63f0200	blr	x16
   0x0000fffff7f85954:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85958:	540022c0	b.eq	0xfffff7f85db0  // b.none
   0x0000fffff7f8595c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85960:	37d80389	tbnz	w9, #27, 0xfffff7f859d0
   0x0000fffff7f85964:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85968:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8596c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85970:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85974:	540002e1	b.ne	0xfffff7f859d0  // b.any
   0x0000fffff7f85978:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f8597c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85980:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85984:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85988:	54000241	b.ne	0xfffff7f859d0  // b.any
   0x0000fffff7f8598c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f85990:	f9403e6a	ldr	x10, [x19, #120]
   0x0000fffff7f85994:	f100015f	cmp	x10, #0x0
   0x0000fffff7f85998:	540001c0	b.eq	0xfffff7f859d0  // b.none
   0x0000fffff7f8599c:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f859a0:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f859a4:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f859a8:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f859ac:	eb0b015f	cmp	x10, x11
   0x0000fffff7f859b0:	54000100	b.eq	0xfffff7f859d0  // b.none
   0x0000fffff7f859b4:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f859b8:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f859bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f859c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f859c4:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f859c8:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f859cc:	1400000e	b	0xfffff7f85a04
   0x0000fffff7f859d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f859d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f859d8:	aa1303e1	mov	x1, x19
   0x0000fffff7f859dc:	aa1503e2	mov	x2, x21
   0x0000fffff7f859e0:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7f859e4:	aa1403e4	mov	x4, x20
   0x0000fffff7f859e8:	aa1603e5	mov	x5, x22
   0x0000fffff7f859ec:	d293c010	mov	x16, #0x9e00                	// #40448
   0x0000fffff7f859f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f859f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f859f8:	d63f0200	blr	x16
   0x0000fffff7f859fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85a00:	54001dc0	b.eq	0xfffff7f85db8  // b.none
   0x0000fffff7f85a04:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85a08:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f85a0c:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f85a10:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85a14:	54000521	b.ne	0xfffff7f85ab8  // b.any
   0x0000fffff7f85a18:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85a1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85a20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85a24:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85a28:	54000481	b.ne	0xfffff7f85ab8  // b.any
   0x0000fffff7f85a2c:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f85a30:	f9402e6b	ldr	x11, [x19, #88]
   0x0000fffff7f85a34:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f85a38:	eb09015f	cmp	x10, x9
   0x0000fffff7f85a3c:	540003e2	b.cs	0xfffff7f85ab8  // b.hs, b.nlast
   0x0000fffff7f85a40:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f85a44:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f85a48:	b940626d	ldr	w13, [x19, #96]
   0x0000fffff7f85a4c:	f940366c	ldr	x12, [x19, #104]
   0x0000fffff7f85a50:	b9400171	ldr	w17, [x11]
   0x0000fffff7f85a54:	36d801d1	tbz	w17, #27, 0xfffff7f85a8c
   0x0000fffff7f85a58:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85a5c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85a60:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85a64:	540002a1	b.ne	0xfffff7f85ab8  // b.any
   0x0000fffff7f85a68:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f85a6c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85a70:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85a74:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85a78:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85a7c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85a80:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85a84:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85a88:	54000189	b.ls	0xfffff7f85ab8  // b.plast
   0x0000fffff7f85a8c:	36d8008d	tbz	w13, #27, 0xfffff7f85a9c
   0x0000fffff7f85a90:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85a94:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85a98:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85a9c:	36d80091	tbz	w17, #27, 0xfffff7f85aac
   0x0000fffff7f85aa0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85aa4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85aa8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85aac:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f85ab0:	b900016d	str	w13, [x11]
   0x0000fffff7f85ab4:	1400000e	b	0xfffff7f85aec
   0x0000fffff7f85ab8:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f85abc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85ac0:	aa1303e1	mov	x1, x19
   0x0000fffff7f85ac4:	aa1503e2	mov	x2, x21
   0x0000fffff7f85ac8:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7f85acc:	aa1403e4	mov	x4, x20
   0x0000fffff7f85ad0:	aa1603e5	mov	x5, x22
   0x0000fffff7f85ad4:	d28c9810	mov	x16, #0x64c0                	// #25792
   0x0000fffff7f85ad8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85adc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85ae0:	d63f0200	blr	x16
   0x0000fffff7f85ae4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85ae8:	540016c0	b.eq	0xfffff7f85dc0  // b.none
   0x0000fffff7f85aec:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f85af0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85af4:	540004a0	b.eq	0xfffff7f85b88  // b.none
   0x0000fffff7f85af8:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85afc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85b00:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85b04:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85b08:	54000400	b.eq	0xfffff7f85b88  // b.none
   0x0000fffff7f85b0c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85b10:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85b14:	36d801d1	tbz	w17, #27, 0xfffff7f85b4c
   0x0000fffff7f85b18:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85b1c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85b20:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85b24:	54000321	b.ne	0xfffff7f85b88  // b.any
   0x0000fffff7f85b28:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85b2c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85b30:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85b34:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85b38:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85b3c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85b40:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85b44:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85b48:	54000209	b.ls	0xfffff7f85b88  // b.plast
   0x0000fffff7f85b4c:	36d8008d	tbz	w13, #27, 0xfffff7f85b5c
   0x0000fffff7f85b50:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85b54:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85b58:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85b5c:	36d80091	tbz	w17, #27, 0xfffff7f85b6c
   0x0000fffff7f85b60:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85b64:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85b68:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85b6c:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7f85b70:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f85b74:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85b78:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85b7c:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f85b80:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f85b84:	1400000e	b	0xfffff7f85bbc
   0x0000fffff7f85b88:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85b8c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85b90:	aa1303e1	mov	x1, x19
   0x0000fffff7f85b94:	aa1503e2	mov	x2, x21
   0x0000fffff7f85b98:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7f85b9c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85ba0:	aa1603e5	mov	x5, x22
   0x0000fffff7f85ba4:	d295a610	mov	x16, #0xad30                	// #44336
   0x0000fffff7f85ba8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85bac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85bb0:	d63f0200	blr	x16
   0x0000fffff7f85bb4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85bb8:	54001080	b.eq	0xfffff7f85dc8  // b.none
   0x0000fffff7f85bbc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85bc0:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f85bc4:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f85bc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85bcc:	540001c1	b.ne	0xfffff7f85c04  // b.any
   0x0000fffff7f85bd0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85bd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85bd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85bdc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85be0:	54000701	b.ne	0xfffff7f85cc0  // b.any
   0x0000fffff7f85be4:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f85be8:	f9402e6b	ldr	x11, [x19, #88]
   0x0000fffff7f85bec:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f85bf0:	eb09015f	cmp	x10, x9
   0x0000fffff7f85bf4:	54000662	b.cs	0xfffff7f85cc0  // b.hs, b.nlast
   0x0000fffff7f85bf8:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f85bfc:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f85c00:	1400000c	b	0xfffff7f85c30
   0x0000fffff7f85c04:	f94047eb	ldr	x11, [sp, #136]
   0x0000fffff7f85c08:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85c0c:	540005a0	b.eq	0xfffff7f85cc0  // b.none
   0x0000fffff7f85c10:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85c14:	b94073ea	ldr	w10, [sp, #112]
   0x0000fffff7f85c18:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85c1c:	54000521	b.ne	0xfffff7f85cc0  // b.any
   0x0000fffff7f85c20:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f85c24:	f9403fea	ldr	x10, [sp, #120]
   0x0000fffff7f85c28:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85c2c:	540004a1	b.ne	0xfffff7f85cc0  // b.any
   0x0000fffff7f85c30:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85c34:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85c38:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85c3c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85c40:	54000400	b.eq	0xfffff7f85cc0  // b.none
   0x0000fffff7f85c44:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85c48:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85c4c:	36d801d1	tbz	w17, #27, 0xfffff7f85c84
   0x0000fffff7f85c50:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85c54:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85c58:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85c5c:	54000321	b.ne	0xfffff7f85cc0  // b.any
   0x0000fffff7f85c60:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85c64:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85c68:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85c6c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85c70:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85c74:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85c78:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85c7c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85c80:	54000209	b.ls	0xfffff7f85cc0  // b.plast
   0x0000fffff7f85c84:	36d8008d	tbz	w13, #27, 0xfffff7f85c94
   0x0000fffff7f85c88:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85c8c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85c90:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85c94:	36d80091	tbz	w17, #27, 0xfffff7f85ca4
   0x0000fffff7f85c98:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85c9c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85ca0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85ca4:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7f85ca8:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f85cac:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85cb0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85cb4:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f85cb8:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f85cbc:	1400000e	b	0xfffff7f85cf4
   0x0000fffff7f85cc0:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f85cc4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85cc8:	aa1303e1	mov	x1, x19
   0x0000fffff7f85ccc:	aa1503e2	mov	x2, x21
   0x0000fffff7f85cd0:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7f85cd4:	aa1403e4	mov	x4, x20
   0x0000fffff7f85cd8:	aa1603e5	mov	x5, x22
   0x0000fffff7f85cdc:	d28a3010	mov	x16, #0x5180                	// #20864
   0x0000fffff7f85ce0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85ce4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85ce8:	d63f0200	blr	x16
   0x0000fffff7f85cec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85cf0:	54000700	b.eq	0xfffff7f85dd0  // b.none
   0x0000fffff7f85cf4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85cf8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85cfc:	aa1303e1	mov	x1, x19
   0x0000fffff7f85d00:	aa1503e2	mov	x2, x21
   0x0000fffff7f85d04:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7f85d08:	aa1403e4	mov	x4, x20
   0x0000fffff7f85d0c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85d10:	d2882890	mov	x16, #0x4144                	// #16708
   0x0000fffff7f85d14:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85d18:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85d1c:	d63f0200	blr	x16
   0x0000fffff7f85d20:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85d24:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85d28:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85d2c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85d30:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f85d34:	d65f03c0	ret
   0x0000fffff7f85d38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85d3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85d40:	b900028a	str	w10, [x20]
   0x0000fffff7f85d44:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85d48:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85d4c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85d50:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85d54:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85d58:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85d5c:	d65f03c0	ret
   0x0000fffff7f85d60:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f85d64:	17fffff5	b	0xfffff7f85d38
   0x0000fffff7f85d68:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f85d6c:	17fffff3	b	0xfffff7f85d38
   0x0000fffff7f85d70:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f85d74:	17fffff1	b	0xfffff7f85d38
   0x0000fffff7f85d78:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f85d7c:	17ffffef	b	0xfffff7f85d38
   0x0000fffff7f85d80:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f85d84:	17ffffed	b	0xfffff7f85d38
   0x0000fffff7f85d88:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f85d8c:	17ffffeb	b	0xfffff7f85d38
   0x0000fffff7f85d90:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f85d94:	17ffffe9	b	0xfffff7f85d38
   0x0000fffff7f85d98:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f85d9c:	17ffffe7	b	0xfffff7f85d38
   0x0000fffff7f85da0:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f85da4:	17ffffe5	b	0xfffff7f85d38
   0x0000fffff7f85da8:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f85dac:	17ffffe3	b	0xfffff7f85d38
   0x0000fffff7f85db0:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7f85db4:	17ffffe1	b	0xfffff7f85d38
   0x0000fffff7f85db8:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7f85dbc:	17ffffdf	b	0xfffff7f85d38
   0x0000fffff7f85dc0:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7f85dc4:	17ffffdd	b	0xfffff7f85d38
   0x0000fffff7f85dc8:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7f85dcc:	17ffffdb	b	0xfffff7f85d38
   0x0000fffff7f85dd0:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7f85dd4:	17ffffd9	b	0xfffff7f85d38
   0x0000fffff7f85dd8:	00000000	udf	#0
   0x0000fffff7f85ddc:	00000000	udf	#0
   0x0000fffff7f85de0:	00000000	udf	#0
   0x0000fffff7f85de4:	00000000	udf	#0
   0x0000fffff7f85de8:	00000000	udf	#0
   0x0000fffff7f85dec:	00000000	udf	#0
   0x0000fffff7f85df0:	00000000	udf	#0
   0x0000fffff7f85df4:	00000000	udf	#0
   0x0000fffff7f85df8:	00000000	udf	#0
   0x0000fffff7f85dfc:	00000000	udf	#0
   0x0000fffff7f85e00:	00000000	udf	#0
   0x0000fffff7f85e04:	00000000	udf	#0
   0x0000fffff7f85e08:	00000000	udf	#0
   0x0000fffff7f85e0c:	00000000	udf	#0
   0x0000fffff7f85e10:	00000000	udf	#0
   0x0000fffff7f85e14:	00000000	udf	#0
   0x0000fffff7f85e18:	00000000	udf	#0
   0x0000fffff7f85e1c:	00000000	udf	#0
   0x0000fffff7f85e20:	00000000	udf	#0
   0x0000fffff7f85e24:	00000000	udf	#0
   0x0000fffff7f85e28:	00000000	udf	#0
   0x0000fffff7f85e2c:	00000000	udf	#0
   0x0000fffff7f85e30:	00000000	udf	#0
   0x0000fffff7f85e34:	00000000	udf	#0
   0x0000fffff7f85e38:	00000000	udf	#0
   0x0000fffff7f85e3c:	00000000	udf	#0
   0x0000fffff7f85e40:	00000000	udf	#0
   0x0000fffff7f85e44:	00000000	udf	#0
   0x0000fffff7f85e48:	00000000	udf	#0
   0x0000fffff7f85e4c:	00000000	udf	#0
   0x0000fffff7f85e50:	00000000	udf	#0
   0x0000fffff7f85e54:	00000000	udf	#0
   0x0000fffff7f85e58:	00000000	udf	#0
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
