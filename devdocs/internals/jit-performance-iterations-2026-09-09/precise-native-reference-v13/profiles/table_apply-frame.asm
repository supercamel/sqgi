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
   0x0000fffff7f851ac:	54005cc0	b.eq	0xfffff7f85d44  // b.none
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
   0x0000fffff7f852a4:	d2949490	mov	x16, #0xa4a4                	// #42148
   0x0000fffff7f852a8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f852ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f852b0:	d63f0200	blr	x16
   0x0000fffff7f852b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f852b8:	540055c0	b.eq	0xfffff7f85d70  // b.none
   0x0000fffff7f852bc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f852c0:	37d800e9	tbnz	w9, #27, 0xfffff7f852dc
   0x0000fffff7f852c4:	d29ffe29	mov	x9, #0xfff1                	// #65521
   0x0000fffff7f852c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f852cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f852d0:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f852d4:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f852d8:	1400000e	b	0xfffff7f85310
   0x0000fffff7f852dc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f852e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f852e4:	aa1303e1	mov	x1, x19
   0x0000fffff7f852e8:	aa1503e2	mov	x2, x21
   0x0000fffff7f852ec:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f852f0:	aa1403e4	mov	x4, x20
   0x0000fffff7f852f4:	aa1603e5	mov	x5, x22
   0x0000fffff7f852f8:	d286be10	mov	x16, #0x35f0                	// #13808
   0x0000fffff7f852fc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85300:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85304:	d63f0200	blr	x16
   0x0000fffff7f85308:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8530c:	54005480	b.eq	0xfffff7f85d9c  // b.none
   0x0000fffff7f85310:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85314:	37d80389	tbnz	w9, #27, 0xfffff7f85384
   0x0000fffff7f85318:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f8531c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85320:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85324:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85328:	540002e1	b.ne	0xfffff7f85384  // b.any
   0x0000fffff7f8532c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85330:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85334:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85338:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8533c:	54000241	b.ne	0xfffff7f85384  // b.any
   0x0000fffff7f85340:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f85344:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f85348:	f100015f	cmp	x10, #0x0
   0x0000fffff7f8534c:	540001c0	b.eq	0xfffff7f85384  // b.none
   0x0000fffff7f85350:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f85354:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f85358:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f8535c:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f85360:	eb0b015f	cmp	x10, x11
   0x0000fffff7f85364:	54000100	b.eq	0xfffff7f85384  // b.none
   0x0000fffff7f85368:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f8536c:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f85370:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85374:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85378:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f8537c:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f85380:	1400000e	b	0xfffff7f853b8
   0x0000fffff7f85384:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85388:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8538c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85390:	aa1503e2	mov	x2, x21
   0x0000fffff7f85394:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7f85398:	aa1403e4	mov	x4, x20
   0x0000fffff7f8539c:	aa1603e5	mov	x5, x22
   0x0000fffff7f853a0:	d2936610	mov	x16, #0x9b30                	// #39728
   0x0000fffff7f853a4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f853a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f853ac:	d63f0200	blr	x16
   0x0000fffff7f853b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f853b4:	540050a0	b.eq	0xfffff7f85dc8  // b.none
   0x0000fffff7f853b8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f853bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f853c0:	aa1303e1	mov	x1, x19
   0x0000fffff7f853c4:	aa1503e2	mov	x2, x21
   0x0000fffff7f853c8:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7f853cc:	aa1403e4	mov	x4, x20
   0x0000fffff7f853d0:	aa1603e5	mov	x5, x22
   0x0000fffff7f853d4:	d28d3010	mov	x16, #0x6980                	// #27008
   0x0000fffff7f853d8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f853dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f853e0:	d63f0200	blr	x16
   0x0000fffff7f853e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f853e8:	54005060	b.eq	0xfffff7f85df4  // b.none
   0x0000fffff7f853ec:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f853f0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f853f4:	540005a0	b.eq	0xfffff7f854a8  // b.none
   0x0000fffff7f853f8:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f853fc:	b94033ea	ldr	w10, [sp, #48]
   0x0000fffff7f85400:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85404:	54000521	b.ne	0xfffff7f854a8  // b.any
   0x0000fffff7f85408:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f8540c:	f9401fea	ldr	x10, [sp, #56]
   0x0000fffff7f85410:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85414:	540004a1	b.ne	0xfffff7f854a8  // b.any
   0x0000fffff7f85418:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8541c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85420:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85424:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85428:	54000400	b.eq	0xfffff7f854a8  // b.none
   0x0000fffff7f8542c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85430:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85434:	36d801d1	tbz	w17, #27, 0xfffff7f8546c
   0x0000fffff7f85438:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8543c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85440:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85444:	54000321	b.ne	0xfffff7f854a8  // b.any
   0x0000fffff7f85448:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8544c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85450:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85454:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85458:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8545c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85460:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85464:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85468:	54000209	b.ls	0xfffff7f854a8  // b.plast
   0x0000fffff7f8546c:	36d8008d	tbz	w13, #27, 0xfffff7f8547c
   0x0000fffff7f85470:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85474:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85478:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8547c:	36d80091	tbz	w17, #27, 0xfffff7f8548c
   0x0000fffff7f85480:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85484:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85488:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8548c:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7f85490:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f85494:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85498:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8549c:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f854a0:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f854a4:	1400000e	b	0xfffff7f854dc
   0x0000fffff7f854a8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f854ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f854b0:	aa1303e1	mov	x1, x19
   0x0000fffff7f854b4:	aa1503e2	mov	x2, x21
   0x0000fffff7f854b8:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f854bc:	aa1403e4	mov	x4, x20
   0x0000fffff7f854c0:	aa1603e5	mov	x5, x22
   0x0000fffff7f854c4:	d2963e10	mov	x16, #0xb1f0                	// #45552
   0x0000fffff7f854c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f854cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f854d0:	d63f0200	blr	x16
   0x0000fffff7f854d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f854d8:	54004a40	b.eq	0xfffff7f85e20  // b.none
   0x0000fffff7f854dc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f854e0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f854e4:	540005a0	b.eq	0xfffff7f85598  // b.none
   0x0000fffff7f854e8:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f854ec:	b94033ea	ldr	w10, [sp, #48]
   0x0000fffff7f854f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f854f4:	54000521	b.ne	0xfffff7f85598  // b.any
   0x0000fffff7f854f8:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f854fc:	f9401fea	ldr	x10, [sp, #56]
   0x0000fffff7f85500:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85504:	540004a1	b.ne	0xfffff7f85598  // b.any
   0x0000fffff7f85508:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8550c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85510:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85514:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85518:	54000400	b.eq	0xfffff7f85598  // b.none
   0x0000fffff7f8551c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85520:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85524:	36d801d1	tbz	w17, #27, 0xfffff7f8555c
   0x0000fffff7f85528:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8552c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85530:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85534:	54000321	b.ne	0xfffff7f85598  // b.any
   0x0000fffff7f85538:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8553c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85540:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85544:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85548:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8554c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85550:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85554:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85558:	54000209	b.ls	0xfffff7f85598  // b.plast
   0x0000fffff7f8555c:	36d8008d	tbz	w13, #27, 0xfffff7f8556c
   0x0000fffff7f85560:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85564:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85568:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8556c:	36d80091	tbz	w17, #27, 0xfffff7f8557c
   0x0000fffff7f85570:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85574:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85578:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8557c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f85580:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f85584:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85588:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8558c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f85590:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f85594:	1400000e	b	0xfffff7f855cc
   0x0000fffff7f85598:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8559c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f855a0:	aa1303e1	mov	x1, x19
   0x0000fffff7f855a4:	aa1503e2	mov	x2, x21
   0x0000fffff7f855a8:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f855ac:	aa1403e4	mov	x4, x20
   0x0000fffff7f855b0:	aa1603e5	mov	x5, x22
   0x0000fffff7f855b4:	d2963e10	mov	x16, #0xb1f0                	// #45552
   0x0000fffff7f855b8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f855bc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f855c0:	d63f0200	blr	x16
   0x0000fffff7f855c4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f855c8:	54004420	b.eq	0xfffff7f85e4c  // b.none
   0x0000fffff7f855cc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f855d0:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f855d4:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f855d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f855dc:	540001c1	b.ne	0xfffff7f85614  // b.any
   0x0000fffff7f855e0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f855e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f855e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f855ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f855f0:	54000801	b.ne	0xfffff7f856f0  // b.any
   0x0000fffff7f855f4:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f855f8:	f940366b	ldr	x11, [x19, #104]
   0x0000fffff7f855fc:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f85600:	eb09015f	cmp	x10, x9
   0x0000fffff7f85604:	54000762	b.cs	0xfffff7f856f0  // b.hs, b.nlast
   0x0000fffff7f85608:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f8560c:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f85610:	14000014	b	0xfffff7f85660
   0x0000fffff7f85614:	f94037eb	ldr	x11, [sp, #104]
   0x0000fffff7f85618:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8561c:	540006a0	b.eq	0xfffff7f856f0  // b.none
   0x0000fffff7f85620:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85624:	b94053ea	ldr	w10, [sp, #80]
   0x0000fffff7f85628:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8562c:	54000621	b.ne	0xfffff7f856f0  // b.any
   0x0000fffff7f85630:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f85634:	f9402fea	ldr	x10, [sp, #88]
   0x0000fffff7f85638:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8563c:	540005a1	b.ne	0xfffff7f856f0  // b.any
   0x0000fffff7f85640:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85644:	b94057ea	ldr	w10, [sp, #84]
   0x0000fffff7f85648:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8564c:	54000521	b.ne	0xfffff7f856f0  // b.any
   0x0000fffff7f85650:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f85654:	f94033ea	ldr	x10, [sp, #96]
   0x0000fffff7f85658:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8565c:	540004a1	b.ne	0xfffff7f856f0  // b.any
   0x0000fffff7f85660:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85664:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85668:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8566c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85670:	54000400	b.eq	0xfffff7f856f0  // b.none
   0x0000fffff7f85674:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85678:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8567c:	36d801d1	tbz	w17, #27, 0xfffff7f856b4
   0x0000fffff7f85680:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85684:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85688:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8568c:	54000321	b.ne	0xfffff7f856f0  // b.any
   0x0000fffff7f85690:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85694:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85698:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8569c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f856a0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f856a4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f856a8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f856ac:	f100055f	cmp	x10, #0x1
   0x0000fffff7f856b0:	54000209	b.ls	0xfffff7f856f0  // b.plast
   0x0000fffff7f856b4:	36d8008d	tbz	w13, #27, 0xfffff7f856c4
   0x0000fffff7f856b8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f856bc:	91000529	add	x9, x9, #0x1
   0x0000fffff7f856c0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f856c4:	36d80091	tbz	w17, #27, 0xfffff7f856d4
   0x0000fffff7f856c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f856cc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f856d0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f856d4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f856d8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f856dc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f856e0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f856e4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f856e8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f856ec:	1400000e	b	0xfffff7f85724
   0x0000fffff7f856f0:	910143e6	add	x6, sp, #0x50
   0x0000fffff7f856f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f856f8:	aa1303e1	mov	x1, x19
   0x0000fffff7f856fc:	aa1503e2	mov	x2, x21
   0x0000fffff7f85700:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f85704:	aa1403e4	mov	x4, x20
   0x0000fffff7f85708:	aa1603e5	mov	x5, x22
   0x0000fffff7f8570c:	d28ac810	mov	x16, #0x5640                	// #22080
   0x0000fffff7f85710:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85714:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85718:	d63f0200	blr	x16
   0x0000fffff7f8571c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85720:	54003ac0	b.eq	0xfffff7f85e78  // b.none
   0x0000fffff7f85724:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f85728:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f8572c:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f85730:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85734:	540001c1	b.ne	0xfffff7f8576c  // b.any
   0x0000fffff7f85738:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f8573c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85740:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85744:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85748:	54000801	b.ne	0xfffff7f85848  // b.any
   0x0000fffff7f8574c:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7f85750:	f9400e6b	ldr	x11, [x19, #24]
   0x0000fffff7f85754:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f85758:	eb09015f	cmp	x10, x9
   0x0000fffff7f8575c:	54000762	b.cs	0xfffff7f85848  // b.hs, b.nlast
   0x0000fffff7f85760:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f85764:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f85768:	14000014	b	0xfffff7f857b8
   0x0000fffff7f8576c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f85770:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85774:	540006a0	b.eq	0xfffff7f85848  // b.none
   0x0000fffff7f85778:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f8577c:	b94013ea	ldr	w10, [sp, #16]
   0x0000fffff7f85780:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85784:	54000621	b.ne	0xfffff7f85848  // b.any
   0x0000fffff7f85788:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f8578c:	f9400fea	ldr	x10, [sp, #24]
   0x0000fffff7f85790:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85794:	540005a1	b.ne	0xfffff7f85848  // b.any
   0x0000fffff7f85798:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f8579c:	b94017ea	ldr	w10, [sp, #20]
   0x0000fffff7f857a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f857a4:	54000521	b.ne	0xfffff7f85848  // b.any
   0x0000fffff7f857a8:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f857ac:	f94013ea	ldr	x10, [sp, #32]
   0x0000fffff7f857b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f857b4:	540004a1	b.ne	0xfffff7f85848  // b.any
   0x0000fffff7f857b8:	b940016d	ldr	w13, [x11]
   0x0000fffff7f857bc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f857c0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f857c4:	eb0901bf	cmp	x13, x9
   0x0000fffff7f857c8:	54000400	b.eq	0xfffff7f85848  // b.none
   0x0000fffff7f857cc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f857d0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f857d4:	36d801d1	tbz	w17, #27, 0xfffff7f8580c
   0x0000fffff7f857d8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f857dc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f857e0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f857e4:	54000321	b.ne	0xfffff7f85848  // b.any
   0x0000fffff7f857e8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f857ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f857f0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f857f4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f857f8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f857fc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85800:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85804:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85808:	54000209	b.ls	0xfffff7f85848  // b.plast
   0x0000fffff7f8580c:	36d8008d	tbz	w13, #27, 0xfffff7f8581c
   0x0000fffff7f85810:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85814:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85818:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8581c:	36d80091	tbz	w17, #27, 0xfffff7f8582c
   0x0000fffff7f85820:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85824:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85828:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8582c:	b940726e	ldr	w14, [x19, #112]
   0x0000fffff7f85830:	f9403e6f	ldr	x15, [x19, #120]
   0x0000fffff7f85834:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85838:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8583c:	f9003e6c	str	x12, [x19, #120]
   0x0000fffff7f85840:	b900726d	str	w13, [x19, #112]
   0x0000fffff7f85844:	1400000e	b	0xfffff7f8587c
   0x0000fffff7f85848:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f8584c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85850:	aa1303e1	mov	x1, x19
   0x0000fffff7f85854:	aa1503e2	mov	x2, x21
   0x0000fffff7f85858:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f8585c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85860:	aa1603e5	mov	x5, x22
   0x0000fffff7f85864:	d28ac810	mov	x16, #0x5640                	// #22080
   0x0000fffff7f85868:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8586c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85870:	d63f0200	blr	x16
   0x0000fffff7f85874:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85878:	54003160	b.eq	0xfffff7f85ea4  // b.none
   0x0000fffff7f8587c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85880:	37d806a9	tbnz	w9, #27, 0xfffff7f85954
   0x0000fffff7f85884:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85888:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8588c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85890:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85894:	540001c1	b.ne	0xfffff7f858cc  // b.any
   0x0000fffff7f85898:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f8589c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f858a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f858a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f858a8:	54000121	b.ne	0xfffff7f858cc  // b.any
   0x0000fffff7f858ac:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f858b0:	f9403e6a	ldr	x10, [x19, #120]
   0x0000fffff7f858b4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f858b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f858bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f858c0:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f858c4:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f858c8:	14000030	b	0xfffff7f85988
   0x0000fffff7f858cc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f858d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f858d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f858d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f858dc:	54000120	b.eq	0xfffff7f85900  // b.none
   0x0000fffff7f858e0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f858e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f858e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f858ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f858f0:	54000321	b.ne	0xfffff7f85954  // b.any
   0x0000fffff7f858f4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f858f8:	9e620120	scvtf	d0, x9
   0x0000fffff7f858fc:	14000002	b	0xfffff7f85904
   0x0000fffff7f85900:	fd403660	ldr	d0, [x19, #104]
   0x0000fffff7f85904:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f85908:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8590c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85910:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85914:	54000120	b.eq	0xfffff7f85938  // b.none
   0x0000fffff7f85918:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f8591c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85920:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85924:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85928:	54000161	b.ne	0xfffff7f85954  // b.any
   0x0000fffff7f8592c:	f9403e69	ldr	x9, [x19, #120]
   0x0000fffff7f85930:	9e620121	scvtf	d1, x9
   0x0000fffff7f85934:	14000002	b	0xfffff7f8593c
   0x0000fffff7f85938:	fd403e61	ldr	d1, [x19, #120]
   0x0000fffff7f8593c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f85940:	fd003660	str	d0, [x19, #104]
   0x0000fffff7f85944:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85948:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8594c:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f85950:	17ffffde	b	0xfffff7f858c8
   0x0000fffff7f85954:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85958:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8595c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85960:	aa1503e2	mov	x2, x21
   0x0000fffff7f85964:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f85968:	aa1403e4	mov	x4, x20
   0x0000fffff7f8596c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85970:	d2949490	mov	x16, #0xa4a4                	// #42148
   0x0000fffff7f85974:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85978:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8597c:	d63f0200	blr	x16
   0x0000fffff7f85980:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85984:	54002a60	b.eq	0xfffff7f85ed0  // b.none
   0x0000fffff7f85988:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f8598c:	37d800e9	tbnz	w9, #27, 0xfffff7f859a8
   0x0000fffff7f85990:	d2807ca9	mov	x9, #0x3e5                 	// #997
   0x0000fffff7f85994:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85998:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8599c:	f9003e69	str	x9, [x19, #120]
   0x0000fffff7f859a0:	b900726a	str	w10, [x19, #112]
   0x0000fffff7f859a4:	1400000e	b	0xfffff7f859dc
   0x0000fffff7f859a8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f859ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f859b0:	aa1303e1	mov	x1, x19
   0x0000fffff7f859b4:	aa1503e2	mov	x2, x21
   0x0000fffff7f859b8:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f859bc:	aa1403e4	mov	x4, x20
   0x0000fffff7f859c0:	aa1603e5	mov	x5, x22
   0x0000fffff7f859c4:	d286be10	mov	x16, #0x35f0                	// #13808
   0x0000fffff7f859c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f859cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f859d0:	d63f0200	blr	x16
   0x0000fffff7f859d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f859d8:	54002920	b.eq	0xfffff7f85efc  // b.none
   0x0000fffff7f859dc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f859e0:	37d80389	tbnz	w9, #27, 0xfffff7f85a50
   0x0000fffff7f859e4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f859e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f859ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f859f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f859f4:	540002e1	b.ne	0xfffff7f85a50  // b.any
   0x0000fffff7f859f8:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f859fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85a00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85a04:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85a08:	54000241	b.ne	0xfffff7f85a50  // b.any
   0x0000fffff7f85a0c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f85a10:	f9403e6a	ldr	x10, [x19, #120]
   0x0000fffff7f85a14:	f100015f	cmp	x10, #0x0
   0x0000fffff7f85a18:	540001c0	b.eq	0xfffff7f85a50  // b.none
   0x0000fffff7f85a1c:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f85a20:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f85a24:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f85a28:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f85a2c:	eb0b015f	cmp	x10, x11
   0x0000fffff7f85a30:	54000100	b.eq	0xfffff7f85a50  // b.none
   0x0000fffff7f85a34:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f85a38:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f85a3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85a40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85a44:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f85a48:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f85a4c:	1400000e	b	0xfffff7f85a84
   0x0000fffff7f85a50:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85a54:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85a58:	aa1303e1	mov	x1, x19
   0x0000fffff7f85a5c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85a60:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7f85a64:	aa1403e4	mov	x4, x20
   0x0000fffff7f85a68:	aa1603e5	mov	x5, x22
   0x0000fffff7f85a6c:	d2936610	mov	x16, #0x9b30                	// #39728
   0x0000fffff7f85a70:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85a74:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85a78:	d63f0200	blr	x16
   0x0000fffff7f85a7c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85a80:	54002540	b.eq	0xfffff7f85f28  // b.none
   0x0000fffff7f85a84:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f85a88:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85a8c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85a90:	aa1503e2	mov	x2, x21
   0x0000fffff7f85a94:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7f85a98:	aa1403e4	mov	x4, x20
   0x0000fffff7f85a9c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85aa0:	d28d3010	mov	x16, #0x6980                	// #27008
   0x0000fffff7f85aa4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85aa8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85aac:	d63f0200	blr	x16
   0x0000fffff7f85ab0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85ab4:	54002500	b.eq	0xfffff7f85f54  // b.none
   0x0000fffff7f85ab8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f85abc:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85ac0:	540005a0	b.eq	0xfffff7f85b74  // b.none
   0x0000fffff7f85ac4:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f85ac8:	b94033ea	ldr	w10, [sp, #48]
   0x0000fffff7f85acc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85ad0:	54000521	b.ne	0xfffff7f85b74  // b.any
   0x0000fffff7f85ad4:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f85ad8:	f9401fea	ldr	x10, [sp, #56]
   0x0000fffff7f85adc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85ae0:	540004a1	b.ne	0xfffff7f85b74  // b.any
   0x0000fffff7f85ae4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85ae8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85aec:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85af0:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85af4:	54000400	b.eq	0xfffff7f85b74  // b.none
   0x0000fffff7f85af8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85afc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85b00:	36d801d1	tbz	w17, #27, 0xfffff7f85b38
   0x0000fffff7f85b04:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85b08:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85b0c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85b10:	54000321	b.ne	0xfffff7f85b74  // b.any
   0x0000fffff7f85b14:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85b18:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85b1c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85b20:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85b24:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85b28:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85b2c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85b30:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85b34:	54000209	b.ls	0xfffff7f85b74  // b.plast
   0x0000fffff7f85b38:	36d8008d	tbz	w13, #27, 0xfffff7f85b48
   0x0000fffff7f85b3c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85b40:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85b44:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85b48:	36d80091	tbz	w17, #27, 0xfffff7f85b58
   0x0000fffff7f85b4c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85b50:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85b54:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85b58:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7f85b5c:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f85b60:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85b64:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85b68:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f85b6c:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f85b70:	1400000e	b	0xfffff7f85ba8
   0x0000fffff7f85b74:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85b78:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85b7c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85b80:	aa1503e2	mov	x2, x21
   0x0000fffff7f85b84:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7f85b88:	aa1403e4	mov	x4, x20
   0x0000fffff7f85b8c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85b90:	d2963e10	mov	x16, #0xb1f0                	// #45552
   0x0000fffff7f85b94:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85b98:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85b9c:	d63f0200	blr	x16
   0x0000fffff7f85ba0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85ba4:	54001ee0	b.eq	0xfffff7f85f80  // b.none
   0x0000fffff7f85ba8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85bac:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f85bb0:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f85bb4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85bb8:	540001c1	b.ne	0xfffff7f85bf0  // b.any
   0x0000fffff7f85bbc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85bc0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85bc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85bc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85bcc:	54000801	b.ne	0xfffff7f85ccc  // b.any
   0x0000fffff7f85bd0:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f85bd4:	f9402e6b	ldr	x11, [x19, #88]
   0x0000fffff7f85bd8:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f85bdc:	eb09015f	cmp	x10, x9
   0x0000fffff7f85be0:	54000762	b.cs	0xfffff7f85ccc  // b.hs, b.nlast
   0x0000fffff7f85be4:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f85be8:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f85bec:	14000014	b	0xfffff7f85c3c
   0x0000fffff7f85bf0:	f94047eb	ldr	x11, [sp, #136]
   0x0000fffff7f85bf4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85bf8:	540006a0	b.eq	0xfffff7f85ccc  // b.none
   0x0000fffff7f85bfc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85c00:	b94073ea	ldr	w10, [sp, #112]
   0x0000fffff7f85c04:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85c08:	54000621	b.ne	0xfffff7f85ccc  // b.any
   0x0000fffff7f85c0c:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f85c10:	f9403fea	ldr	x10, [sp, #120]
   0x0000fffff7f85c14:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85c18:	540005a1	b.ne	0xfffff7f85ccc  // b.any
   0x0000fffff7f85c1c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85c20:	b94077ea	ldr	w10, [sp, #116]
   0x0000fffff7f85c24:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85c28:	54000521	b.ne	0xfffff7f85ccc  // b.any
   0x0000fffff7f85c2c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f85c30:	f94043ea	ldr	x10, [sp, #128]
   0x0000fffff7f85c34:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85c38:	540004a1	b.ne	0xfffff7f85ccc  // b.any
   0x0000fffff7f85c3c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85c40:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85c44:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85c48:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85c4c:	54000400	b.eq	0xfffff7f85ccc  // b.none
   0x0000fffff7f85c50:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85c54:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85c58:	36d801d1	tbz	w17, #27, 0xfffff7f85c90
   0x0000fffff7f85c5c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85c60:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85c64:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85c68:	54000321	b.ne	0xfffff7f85ccc  // b.any
   0x0000fffff7f85c6c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85c70:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85c74:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85c78:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85c7c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85c80:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85c84:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85c88:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85c8c:	54000209	b.ls	0xfffff7f85ccc  // b.plast
   0x0000fffff7f85c90:	36d8008d	tbz	w13, #27, 0xfffff7f85ca0
   0x0000fffff7f85c94:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85c98:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85c9c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85ca0:	36d80091	tbz	w17, #27, 0xfffff7f85cb0
   0x0000fffff7f85ca4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85ca8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85cac:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85cb0:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7f85cb4:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f85cb8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85cbc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85cc0:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f85cc4:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f85cc8:	1400000e	b	0xfffff7f85d00
   0x0000fffff7f85ccc:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f85cd0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85cd4:	aa1303e1	mov	x1, x19
   0x0000fffff7f85cd8:	aa1503e2	mov	x2, x21
   0x0000fffff7f85cdc:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7f85ce0:	aa1403e4	mov	x4, x20
   0x0000fffff7f85ce4:	aa1603e5	mov	x5, x22
   0x0000fffff7f85ce8:	d28ac810	mov	x16, #0x5640                	// #22080
   0x0000fffff7f85cec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85cf0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85cf4:	d63f0200	blr	x16
   0x0000fffff7f85cf8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85cfc:	54001580	b.eq	0xfffff7f85fac  // b.none
   0x0000fffff7f85d00:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85d04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85d08:	aa1303e1	mov	x1, x19
   0x0000fffff7f85d0c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85d10:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7f85d14:	aa1403e4	mov	x4, x20
   0x0000fffff7f85d18:	aa1603e5	mov	x5, x22
   0x0000fffff7f85d1c:	d288c090	mov	x16, #0x4604                	// #17924
   0x0000fffff7f85d20:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85d24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85d28:	d63f0200	blr	x16
   0x0000fffff7f85d2c:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85d30:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85d34:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85d38:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85d3c:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f85d40:	d65f03c0	ret
   0x0000fffff7f85d44:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85d48:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85d4c:	b9000289	str	w9, [x20]
   0x0000fffff7f85d50:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f85d54:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85d58:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85d5c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85d60:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85d64:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85d68:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85d6c:	d65f03c0	ret
   0x0000fffff7f85d70:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85d74:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85d78:	b9000289	str	w9, [x20]
   0x0000fffff7f85d7c:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f85d80:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85d84:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85d88:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85d8c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85d90:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85d94:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85d98:	d65f03c0	ret
   0x0000fffff7f85d9c:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85da0:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85da4:	b9000289	str	w9, [x20]
   0x0000fffff7f85da8:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f85dac:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85db0:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85db4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85db8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85dbc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85dc0:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85dc4:	d65f03c0	ret
   0x0000fffff7f85dc8:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85dcc:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85dd0:	b9000289	str	w9, [x20]
   0x0000fffff7f85dd4:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f85dd8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85ddc:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85de0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85de4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85de8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85dec:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85df0:	d65f03c0	ret
   0x0000fffff7f85df4:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85df8:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85dfc:	b9000289	str	w9, [x20]
   0x0000fffff7f85e00:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f85e04:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85e08:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85e0c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85e10:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85e14:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85e18:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85e1c:	d65f03c0	ret
   0x0000fffff7f85e20:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85e24:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85e28:	b9000289	str	w9, [x20]
   0x0000fffff7f85e2c:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f85e30:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85e34:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85e38:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85e3c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85e40:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85e44:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85e48:	d65f03c0	ret
   0x0000fffff7f85e4c:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85e50:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85e54:	b9000289	str	w9, [x20]
   0x0000fffff7f85e58:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f85e5c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85e60:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85e64:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85e68:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85e6c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85e70:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85e74:	d65f03c0	ret
   0x0000fffff7f85e78:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85e7c:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85e80:	b9000289	str	w9, [x20]
   0x0000fffff7f85e84:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f85e88:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85e8c:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85e90:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85e94:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85e98:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85e9c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85ea0:	d65f03c0	ret
   0x0000fffff7f85ea4:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85ea8:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85eac:	b9000289	str	w9, [x20]
   0x0000fffff7f85eb0:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f85eb4:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85eb8:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85ebc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85ec0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85ec4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85ec8:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85ecc:	d65f03c0	ret
   0x0000fffff7f85ed0:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85ed4:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85ed8:	b9000289	str	w9, [x20]
   0x0000fffff7f85edc:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f85ee0:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85ee4:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85ee8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85eec:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85ef0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85ef4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85ef8:	d65f03c0	ret
   0x0000fffff7f85efc:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85f00:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85f04:	b9000289	str	w9, [x20]
   0x0000fffff7f85f08:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7f85f0c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85f10:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85f14:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85f18:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85f1c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85f20:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85f24:	d65f03c0	ret
   0x0000fffff7f85f28:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85f2c:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85f30:	b9000289	str	w9, [x20]
   0x0000fffff7f85f34:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7f85f38:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85f3c:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85f40:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85f44:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85f48:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85f4c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85f50:	d65f03c0	ret
   0x0000fffff7f85f54:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85f58:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85f5c:	b9000289	str	w9, [x20]
   0x0000fffff7f85f60:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7f85f64:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85f68:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85f6c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85f70:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85f74:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85f78:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85f7c:	d65f03c0	ret
   0x0000fffff7f85f80:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85f84:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85f88:	b9000289	str	w9, [x20]
   0x0000fffff7f85f8c:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7f85f90:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85f94:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85f98:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85f9c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85fa0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85fa4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85fa8:	d65f03c0	ret
   0x0000fffff7f85fac:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85fb0:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85fb4:	b9000289	str	w9, [x20]
   0x0000fffff7f85fb8:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7f85fbc:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85fc0:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85fc4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85fc8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85fcc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85fd0:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85fd4:	d65f03c0	ret
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
