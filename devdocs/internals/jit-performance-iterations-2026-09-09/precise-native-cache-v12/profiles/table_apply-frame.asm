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
   0x0000fffff7f8507c:	540006e1	b.ne	0xfffff7f85158  // b.any
   0x0000fffff7f85080:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7f85084:	f9400e6b	ldr	x11, [x19, #24]
   0x0000fffff7f85088:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f8508c:	eb09015f	cmp	x10, x9
   0x0000fffff7f85090:	54000642	b.cs	0xfffff7f85158  // b.hs, b.nlast
   0x0000fffff7f85094:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f85098:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f8509c:	14000014	b	0xfffff7f850ec
   0x0000fffff7f850a0:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f850a4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f850a8:	54000580	b.eq	0xfffff7f85158  // b.none
   0x0000fffff7f850ac:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f850b0:	b94013ea	ldr	w10, [sp, #16]
   0x0000fffff7f850b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f850b8:	54000501	b.ne	0xfffff7f85158  // b.any
   0x0000fffff7f850bc:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f850c0:	f9400fea	ldr	x10, [sp, #24]
   0x0000fffff7f850c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f850c8:	54000481	b.ne	0xfffff7f85158  // b.any
   0x0000fffff7f850cc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f850d0:	b94017ea	ldr	w10, [sp, #20]
   0x0000fffff7f850d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f850d8:	54000401	b.ne	0xfffff7f85158  // b.any
   0x0000fffff7f850dc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f850e0:	f94013ea	ldr	x10, [sp, #32]
   0x0000fffff7f850e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f850e8:	54000381	b.ne	0xfffff7f85158  // b.any
   0x0000fffff7f850ec:	b940016d	ldr	w13, [x11]
   0x0000fffff7f850f0:	37d8034d	tbnz	w13, #27, 0xfffff7f85158
   0x0000fffff7f850f4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f850f8:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f850fc:	36d8020e	tbz	w14, #27, 0xfffff7f8513c
   0x0000fffff7f85100:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85104:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85108:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8510c:	54000261	b.ne	0xfffff7f85158  // b.any
   0x0000fffff7f85110:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85114:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85118:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8511c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85120:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85124:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85128:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8512c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85130:	54000149	b.ls	0xfffff7f85158  // b.plast
   0x0000fffff7f85134:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85138:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8513c:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7f85140:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f85144:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85148:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8514c:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f85150:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f85154:	1400000e	b	0xfffff7f8518c
   0x0000fffff7f85158:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f8515c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85160:	aa1303e1	mov	x1, x19
   0x0000fffff7f85164:	aa1503e2	mov	x2, x21
   0x0000fffff7f85168:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7f8516c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85170:	aa1603e5	mov	x5, x22
   0x0000fffff7f85174:	d28ac810	mov	x16, #0x5640                	// #22080
   0x0000fffff7f85178:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8517c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85180:	d63f0200	blr	x16
   0x0000fffff7f85184:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85188:	54005600	b.eq	0xfffff7f85c48  // b.none
   0x0000fffff7f8518c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85190:	37d806a9	tbnz	w9, #27, 0xfffff7f85264
   0x0000fffff7f85194:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85198:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8519c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f851a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f851a4:	540001c1	b.ne	0xfffff7f851dc  // b.any
   0x0000fffff7f851a8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f851ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f851b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f851b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f851b8:	54000121	b.ne	0xfffff7f851dc  // b.any
   0x0000fffff7f851bc:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f851c0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f851c4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f851c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f851cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f851d0:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f851d4:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f851d8:	14000030	b	0xfffff7f85298
   0x0000fffff7f851dc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f851e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f851e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f851e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f851ec:	54000120	b.eq	0xfffff7f85210  // b.none
   0x0000fffff7f851f0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f851f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f851f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f851fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85200:	54000321	b.ne	0xfffff7f85264  // b.any
   0x0000fffff7f85204:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f85208:	9e620120	scvtf	d0, x9
   0x0000fffff7f8520c:	14000002	b	0xfffff7f85214
   0x0000fffff7f85210:	fd402e60	ldr	d0, [x19, #88]
   0x0000fffff7f85214:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f85218:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8521c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85220:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85224:	54000120	b.eq	0xfffff7f85248  // b.none
   0x0000fffff7f85228:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f8522c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85230:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85234:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85238:	54000161	b.ne	0xfffff7f85264  // b.any
   0x0000fffff7f8523c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f85240:	9e620121	scvtf	d1, x9
   0x0000fffff7f85244:	14000002	b	0xfffff7f8524c
   0x0000fffff7f85248:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7f8524c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f85250:	fd002e60	str	d0, [x19, #88]
   0x0000fffff7f85254:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85258:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8525c:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f85260:	17ffffde	b	0xfffff7f851d8
   0x0000fffff7f85264:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85268:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8526c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85270:	aa1503e2	mov	x2, x21
   0x0000fffff7f85274:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7f85278:	aa1403e4	mov	x4, x20
   0x0000fffff7f8527c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85280:	d294a890	mov	x16, #0xa544                	// #42308
   0x0000fffff7f85284:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85288:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8528c:	d63f0200	blr	x16
   0x0000fffff7f85290:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85294:	54004f00	b.eq	0xfffff7f85c74  // b.none
   0x0000fffff7f85298:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8529c:	37d800e9	tbnz	w9, #27, 0xfffff7f852b8
   0x0000fffff7f852a0:	d29ffe29	mov	x9, #0xfff1                	// #65521
   0x0000fffff7f852a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f852a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f852ac:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f852b0:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f852b4:	1400000e	b	0xfffff7f852ec
   0x0000fffff7f852b8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f852bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f852c0:	aa1303e1	mov	x1, x19
   0x0000fffff7f852c4:	aa1503e2	mov	x2, x21
   0x0000fffff7f852c8:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f852cc:	aa1403e4	mov	x4, x20
   0x0000fffff7f852d0:	aa1603e5	mov	x5, x22
   0x0000fffff7f852d4:	d286be10	mov	x16, #0x35f0                	// #13808
   0x0000fffff7f852d8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f852dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f852e0:	d63f0200	blr	x16
   0x0000fffff7f852e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f852e8:	54004dc0	b.eq	0xfffff7f85ca0  // b.none
   0x0000fffff7f852ec:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f852f0:	37d80389	tbnz	w9, #27, 0xfffff7f85360
   0x0000fffff7f852f4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f852f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f852fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85300:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85304:	540002e1	b.ne	0xfffff7f85360  // b.any
   0x0000fffff7f85308:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8530c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85310:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85314:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85318:	54000241	b.ne	0xfffff7f85360  // b.any
   0x0000fffff7f8531c:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f85320:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f85324:	f100015f	cmp	x10, #0x0
   0x0000fffff7f85328:	540001c0	b.eq	0xfffff7f85360  // b.none
   0x0000fffff7f8532c:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f85330:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f85334:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f85338:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f8533c:	eb0b015f	cmp	x10, x11
   0x0000fffff7f85340:	54000100	b.eq	0xfffff7f85360  // b.none
   0x0000fffff7f85344:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f85348:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f8534c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85350:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85354:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f85358:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f8535c:	1400000e	b	0xfffff7f85394
   0x0000fffff7f85360:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85364:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85368:	aa1303e1	mov	x1, x19
   0x0000fffff7f8536c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85370:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7f85374:	aa1403e4	mov	x4, x20
   0x0000fffff7f85378:	aa1603e5	mov	x5, x22
   0x0000fffff7f8537c:	d2937a10	mov	x16, #0x9bd0                	// #39888
   0x0000fffff7f85380:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85384:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85388:	d63f0200	blr	x16
   0x0000fffff7f8538c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85390:	540049e0	b.eq	0xfffff7f85ccc  // b.none
   0x0000fffff7f85394:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f85398:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8539c:	aa1303e1	mov	x1, x19
   0x0000fffff7f853a0:	aa1503e2	mov	x2, x21
   0x0000fffff7f853a4:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7f853a8:	aa1403e4	mov	x4, x20
   0x0000fffff7f853ac:	aa1603e5	mov	x5, x22
   0x0000fffff7f853b0:	d28d3010	mov	x16, #0x6980                	// #27008
   0x0000fffff7f853b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f853b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f853bc:	d63f0200	blr	x16
   0x0000fffff7f853c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f853c4:	540049a0	b.eq	0xfffff7f85cf8  // b.none
   0x0000fffff7f853c8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f853cc:	f100017f	cmp	x11, #0x0
   0x0000fffff7f853d0:	54000480	b.eq	0xfffff7f85460  // b.none
   0x0000fffff7f853d4:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f853d8:	b94033ea	ldr	w10, [sp, #48]
   0x0000fffff7f853dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f853e0:	54000401	b.ne	0xfffff7f85460  // b.any
   0x0000fffff7f853e4:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f853e8:	f9401fea	ldr	x10, [sp, #56]
   0x0000fffff7f853ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f853f0:	54000381	b.ne	0xfffff7f85460  // b.any
   0x0000fffff7f853f4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f853f8:	37d8034d	tbnz	w13, #27, 0xfffff7f85460
   0x0000fffff7f853fc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85400:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f85404:	36d8020e	tbz	w14, #27, 0xfffff7f85444
   0x0000fffff7f85408:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8540c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85410:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85414:	54000261	b.ne	0xfffff7f85460  // b.any
   0x0000fffff7f85418:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8541c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85420:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85424:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85428:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8542c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85430:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85434:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85438:	54000149	b.ls	0xfffff7f85460  // b.plast
   0x0000fffff7f8543c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85440:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85444:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7f85448:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f8544c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85450:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85454:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f85458:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f8545c:	1400000e	b	0xfffff7f85494
   0x0000fffff7f85460:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85464:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85468:	aa1303e1	mov	x1, x19
   0x0000fffff7f8546c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85470:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f85474:	aa1403e4	mov	x4, x20
   0x0000fffff7f85478:	aa1603e5	mov	x5, x22
   0x0000fffff7f8547c:	d294b610	mov	x16, #0xa5b0                	// #42416
   0x0000fffff7f85480:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85484:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85488:	d63f0200	blr	x16
   0x0000fffff7f8548c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85490:	540044a0	b.eq	0xfffff7f85d24  // b.none
   0x0000fffff7f85494:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f85498:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8549c:	54000480	b.eq	0xfffff7f8552c  // b.none
   0x0000fffff7f854a0:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f854a4:	b94033ea	ldr	w10, [sp, #48]
   0x0000fffff7f854a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f854ac:	54000401	b.ne	0xfffff7f8552c  // b.any
   0x0000fffff7f854b0:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f854b4:	f9401fea	ldr	x10, [sp, #56]
   0x0000fffff7f854b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f854bc:	54000381	b.ne	0xfffff7f8552c  // b.any
   0x0000fffff7f854c0:	b940016d	ldr	w13, [x11]
   0x0000fffff7f854c4:	37d8034d	tbnz	w13, #27, 0xfffff7f8552c
   0x0000fffff7f854c8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f854cc:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f854d0:	36d8020e	tbz	w14, #27, 0xfffff7f85510
   0x0000fffff7f854d4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f854d8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f854dc:	f100013f	cmp	x9, #0x0
   0x0000fffff7f854e0:	54000261	b.ne	0xfffff7f8552c  // b.any
   0x0000fffff7f854e4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f854e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f854ec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f854f0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f854f4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f854f8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f854fc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85500:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85504:	54000149	b.ls	0xfffff7f8552c  // b.plast
   0x0000fffff7f85508:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8550c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85510:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f85514:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f85518:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8551c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85520:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f85524:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f85528:	1400000e	b	0xfffff7f85560
   0x0000fffff7f8552c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85530:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85534:	aa1303e1	mov	x1, x19
   0x0000fffff7f85538:	aa1503e2	mov	x2, x21
   0x0000fffff7f8553c:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f85540:	aa1403e4	mov	x4, x20
   0x0000fffff7f85544:	aa1603e5	mov	x5, x22
   0x0000fffff7f85548:	d294b610	mov	x16, #0xa5b0                	// #42416
   0x0000fffff7f8554c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85550:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85554:	d63f0200	blr	x16
   0x0000fffff7f85558:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8555c:	54003fa0	b.eq	0xfffff7f85d50  // b.none
   0x0000fffff7f85560:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85564:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f85568:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f8556c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85570:	540001c1	b.ne	0xfffff7f855a8  // b.any
   0x0000fffff7f85574:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85578:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8557c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85580:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85584:	540006e1	b.ne	0xfffff7f85660  // b.any
   0x0000fffff7f85588:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f8558c:	f940366b	ldr	x11, [x19, #104]
   0x0000fffff7f85590:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f85594:	eb09015f	cmp	x10, x9
   0x0000fffff7f85598:	54000642	b.cs	0xfffff7f85660  // b.hs, b.nlast
   0x0000fffff7f8559c:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f855a0:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f855a4:	14000014	b	0xfffff7f855f4
   0x0000fffff7f855a8:	f94037eb	ldr	x11, [sp, #104]
   0x0000fffff7f855ac:	f100017f	cmp	x11, #0x0
   0x0000fffff7f855b0:	54000580	b.eq	0xfffff7f85660  // b.none
   0x0000fffff7f855b4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f855b8:	b94053ea	ldr	w10, [sp, #80]
   0x0000fffff7f855bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f855c0:	54000501	b.ne	0xfffff7f85660  // b.any
   0x0000fffff7f855c4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f855c8:	f9402fea	ldr	x10, [sp, #88]
   0x0000fffff7f855cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f855d0:	54000481	b.ne	0xfffff7f85660  // b.any
   0x0000fffff7f855d4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f855d8:	b94057ea	ldr	w10, [sp, #84]
   0x0000fffff7f855dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f855e0:	54000401	b.ne	0xfffff7f85660  // b.any
   0x0000fffff7f855e4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f855e8:	f94033ea	ldr	x10, [sp, #96]
   0x0000fffff7f855ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f855f0:	54000381	b.ne	0xfffff7f85660  // b.any
   0x0000fffff7f855f4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f855f8:	37d8034d	tbnz	w13, #27, 0xfffff7f85660
   0x0000fffff7f855fc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85600:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f85604:	36d8020e	tbz	w14, #27, 0xfffff7f85644
   0x0000fffff7f85608:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8560c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85610:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85614:	54000261	b.ne	0xfffff7f85660  // b.any
   0x0000fffff7f85618:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8561c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85620:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85624:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85628:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8562c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85630:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85634:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85638:	54000149	b.ls	0xfffff7f85660  // b.plast
   0x0000fffff7f8563c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85640:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85644:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f85648:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8564c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85650:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85654:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f85658:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8565c:	1400000e	b	0xfffff7f85694
   0x0000fffff7f85660:	910143e6	add	x6, sp, #0x50
   0x0000fffff7f85664:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85668:	aa1303e1	mov	x1, x19
   0x0000fffff7f8566c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85670:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f85674:	aa1403e4	mov	x4, x20
   0x0000fffff7f85678:	aa1603e5	mov	x5, x22
   0x0000fffff7f8567c:	d28ac810	mov	x16, #0x5640                	// #22080
   0x0000fffff7f85680:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85684:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85688:	d63f0200	blr	x16
   0x0000fffff7f8568c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85690:	54003760	b.eq	0xfffff7f85d7c  // b.none
   0x0000fffff7f85694:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f85698:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f8569c:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f856a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f856a4:	540001c1	b.ne	0xfffff7f856dc  // b.any
   0x0000fffff7f856a8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f856ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f856b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f856b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f856b8:	540006e1	b.ne	0xfffff7f85794  // b.any
   0x0000fffff7f856bc:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7f856c0:	f9400e6b	ldr	x11, [x19, #24]
   0x0000fffff7f856c4:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f856c8:	eb09015f	cmp	x10, x9
   0x0000fffff7f856cc:	54000642	b.cs	0xfffff7f85794  // b.hs, b.nlast
   0x0000fffff7f856d0:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f856d4:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f856d8:	14000014	b	0xfffff7f85728
   0x0000fffff7f856dc:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f856e0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f856e4:	54000580	b.eq	0xfffff7f85794  // b.none
   0x0000fffff7f856e8:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f856ec:	b94013ea	ldr	w10, [sp, #16]
   0x0000fffff7f856f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f856f4:	54000501	b.ne	0xfffff7f85794  // b.any
   0x0000fffff7f856f8:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f856fc:	f9400fea	ldr	x10, [sp, #24]
   0x0000fffff7f85700:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85704:	54000481	b.ne	0xfffff7f85794  // b.any
   0x0000fffff7f85708:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f8570c:	b94017ea	ldr	w10, [sp, #20]
   0x0000fffff7f85710:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85714:	54000401	b.ne	0xfffff7f85794  // b.any
   0x0000fffff7f85718:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f8571c:	f94013ea	ldr	x10, [sp, #32]
   0x0000fffff7f85720:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85724:	54000381	b.ne	0xfffff7f85794  // b.any
   0x0000fffff7f85728:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8572c:	37d8034d	tbnz	w13, #27, 0xfffff7f85794
   0x0000fffff7f85730:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85734:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f85738:	36d8020e	tbz	w14, #27, 0xfffff7f85778
   0x0000fffff7f8573c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85740:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85744:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85748:	54000261	b.ne	0xfffff7f85794  // b.any
   0x0000fffff7f8574c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85750:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85754:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85758:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8575c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85760:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85764:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85768:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8576c:	54000149	b.ls	0xfffff7f85794  // b.plast
   0x0000fffff7f85770:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85774:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85778:	b940726e	ldr	w14, [x19, #112]
   0x0000fffff7f8577c:	f9403e6f	ldr	x15, [x19, #120]
   0x0000fffff7f85780:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85784:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85788:	f9003e6c	str	x12, [x19, #120]
   0x0000fffff7f8578c:	b900726d	str	w13, [x19, #112]
   0x0000fffff7f85790:	1400000e	b	0xfffff7f857c8
   0x0000fffff7f85794:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f85798:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8579c:	aa1303e1	mov	x1, x19
   0x0000fffff7f857a0:	aa1503e2	mov	x2, x21
   0x0000fffff7f857a4:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f857a8:	aa1403e4	mov	x4, x20
   0x0000fffff7f857ac:	aa1603e5	mov	x5, x22
   0x0000fffff7f857b0:	d28ac810	mov	x16, #0x5640                	// #22080
   0x0000fffff7f857b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f857b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f857bc:	d63f0200	blr	x16
   0x0000fffff7f857c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f857c4:	54002f20	b.eq	0xfffff7f85da8  // b.none
   0x0000fffff7f857c8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f857cc:	37d806a9	tbnz	w9, #27, 0xfffff7f858a0
   0x0000fffff7f857d0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f857d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f857d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f857dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f857e0:	540001c1	b.ne	0xfffff7f85818  // b.any
   0x0000fffff7f857e4:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f857e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f857ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f857f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f857f4:	54000121	b.ne	0xfffff7f85818  // b.any
   0x0000fffff7f857f8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f857fc:	f9403e6a	ldr	x10, [x19, #120]
   0x0000fffff7f85800:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85804:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85808:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8580c:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f85810:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f85814:	14000030	b	0xfffff7f858d4
   0x0000fffff7f85818:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8581c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85820:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85824:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85828:	54000120	b.eq	0xfffff7f8584c  // b.none
   0x0000fffff7f8582c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85830:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85834:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85838:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8583c:	54000321	b.ne	0xfffff7f858a0  // b.any
   0x0000fffff7f85840:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f85844:	9e620120	scvtf	d0, x9
   0x0000fffff7f85848:	14000002	b	0xfffff7f85850
   0x0000fffff7f8584c:	fd403660	ldr	d0, [x19, #104]
   0x0000fffff7f85850:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f85854:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85858:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8585c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85860:	54000120	b.eq	0xfffff7f85884  // b.none
   0x0000fffff7f85864:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f85868:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8586c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85870:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85874:	54000161	b.ne	0xfffff7f858a0  // b.any
   0x0000fffff7f85878:	f9403e69	ldr	x9, [x19, #120]
   0x0000fffff7f8587c:	9e620121	scvtf	d1, x9
   0x0000fffff7f85880:	14000002	b	0xfffff7f85888
   0x0000fffff7f85884:	fd403e61	ldr	d1, [x19, #120]
   0x0000fffff7f85888:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8588c:	fd003660	str	d0, [x19, #104]
   0x0000fffff7f85890:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85894:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85898:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f8589c:	17ffffde	b	0xfffff7f85814
   0x0000fffff7f858a0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f858a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f858a8:	aa1303e1	mov	x1, x19
   0x0000fffff7f858ac:	aa1503e2	mov	x2, x21
   0x0000fffff7f858b0:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f858b4:	aa1403e4	mov	x4, x20
   0x0000fffff7f858b8:	aa1603e5	mov	x5, x22
   0x0000fffff7f858bc:	d294a890	mov	x16, #0xa544                	// #42308
   0x0000fffff7f858c0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f858c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f858c8:	d63f0200	blr	x16
   0x0000fffff7f858cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f858d0:	54002820	b.eq	0xfffff7f85dd4  // b.none
   0x0000fffff7f858d4:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f858d8:	37d800e9	tbnz	w9, #27, 0xfffff7f858f4
   0x0000fffff7f858dc:	d2807ca9	mov	x9, #0x3e5                 	// #997
   0x0000fffff7f858e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f858e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f858e8:	f9003e69	str	x9, [x19, #120]
   0x0000fffff7f858ec:	b900726a	str	w10, [x19, #112]
   0x0000fffff7f858f0:	1400000e	b	0xfffff7f85928
   0x0000fffff7f858f4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f858f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f858fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f85900:	aa1503e2	mov	x2, x21
   0x0000fffff7f85904:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f85908:	aa1403e4	mov	x4, x20
   0x0000fffff7f8590c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85910:	d286be10	mov	x16, #0x35f0                	// #13808
   0x0000fffff7f85914:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85918:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8591c:	d63f0200	blr	x16
   0x0000fffff7f85920:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85924:	540026e0	b.eq	0xfffff7f85e00  // b.none
   0x0000fffff7f85928:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8592c:	37d80389	tbnz	w9, #27, 0xfffff7f8599c
   0x0000fffff7f85930:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85934:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85938:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8593c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85940:	540002e1	b.ne	0xfffff7f8599c  // b.any
   0x0000fffff7f85944:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f85948:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8594c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85950:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85954:	54000241	b.ne	0xfffff7f8599c  // b.any
   0x0000fffff7f85958:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8595c:	f9403e6a	ldr	x10, [x19, #120]
   0x0000fffff7f85960:	f100015f	cmp	x10, #0x0
   0x0000fffff7f85964:	540001c0	b.eq	0xfffff7f8599c  // b.none
   0x0000fffff7f85968:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f8596c:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f85970:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f85974:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f85978:	eb0b015f	cmp	x10, x11
   0x0000fffff7f8597c:	54000100	b.eq	0xfffff7f8599c  // b.none
   0x0000fffff7f85980:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f85984:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f85988:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8598c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85990:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f85994:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f85998:	1400000e	b	0xfffff7f859d0
   0x0000fffff7f8599c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f859a0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f859a4:	aa1303e1	mov	x1, x19
   0x0000fffff7f859a8:	aa1503e2	mov	x2, x21
   0x0000fffff7f859ac:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7f859b0:	aa1403e4	mov	x4, x20
   0x0000fffff7f859b4:	aa1603e5	mov	x5, x22
   0x0000fffff7f859b8:	d2937a10	mov	x16, #0x9bd0                	// #39888
   0x0000fffff7f859bc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f859c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f859c4:	d63f0200	blr	x16
   0x0000fffff7f859c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f859cc:	54002300	b.eq	0xfffff7f85e2c  // b.none
   0x0000fffff7f859d0:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f859d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f859d8:	aa1303e1	mov	x1, x19
   0x0000fffff7f859dc:	aa1503e2	mov	x2, x21
   0x0000fffff7f859e0:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7f859e4:	aa1403e4	mov	x4, x20
   0x0000fffff7f859e8:	aa1603e5	mov	x5, x22
   0x0000fffff7f859ec:	d28d3010	mov	x16, #0x6980                	// #27008
   0x0000fffff7f859f0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f859f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f859f8:	d63f0200	blr	x16
   0x0000fffff7f859fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85a00:	540022c0	b.eq	0xfffff7f85e58  // b.none
   0x0000fffff7f85a04:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f85a08:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85a0c:	54000480	b.eq	0xfffff7f85a9c  // b.none
   0x0000fffff7f85a10:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f85a14:	b94033ea	ldr	w10, [sp, #48]
   0x0000fffff7f85a18:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85a1c:	54000401	b.ne	0xfffff7f85a9c  // b.any
   0x0000fffff7f85a20:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f85a24:	f9401fea	ldr	x10, [sp, #56]
   0x0000fffff7f85a28:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85a2c:	54000381	b.ne	0xfffff7f85a9c  // b.any
   0x0000fffff7f85a30:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85a34:	37d8034d	tbnz	w13, #27, 0xfffff7f85a9c
   0x0000fffff7f85a38:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85a3c:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f85a40:	36d8020e	tbz	w14, #27, 0xfffff7f85a80
   0x0000fffff7f85a44:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85a48:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85a4c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85a50:	54000261	b.ne	0xfffff7f85a9c  // b.any
   0x0000fffff7f85a54:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85a58:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85a5c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85a60:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85a64:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85a68:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85a6c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85a70:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85a74:	54000149	b.ls	0xfffff7f85a9c  // b.plast
   0x0000fffff7f85a78:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85a7c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85a80:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7f85a84:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f85a88:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85a8c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85a90:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f85a94:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f85a98:	1400000e	b	0xfffff7f85ad0
   0x0000fffff7f85a9c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85aa0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85aa4:	aa1303e1	mov	x1, x19
   0x0000fffff7f85aa8:	aa1503e2	mov	x2, x21
   0x0000fffff7f85aac:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7f85ab0:	aa1403e4	mov	x4, x20
   0x0000fffff7f85ab4:	aa1603e5	mov	x5, x22
   0x0000fffff7f85ab8:	d294b610	mov	x16, #0xa5b0                	// #42416
   0x0000fffff7f85abc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85ac0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85ac4:	d63f0200	blr	x16
   0x0000fffff7f85ac8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85acc:	54001dc0	b.eq	0xfffff7f85e84  // b.none
   0x0000fffff7f85ad0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85ad4:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f85ad8:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f85adc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85ae0:	540001c1	b.ne	0xfffff7f85b18  // b.any
   0x0000fffff7f85ae4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85ae8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85aec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85af0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85af4:	540006e1	b.ne	0xfffff7f85bd0  // b.any
   0x0000fffff7f85af8:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f85afc:	f9402e6b	ldr	x11, [x19, #88]
   0x0000fffff7f85b00:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f85b04:	eb09015f	cmp	x10, x9
   0x0000fffff7f85b08:	54000642	b.cs	0xfffff7f85bd0  // b.hs, b.nlast
   0x0000fffff7f85b0c:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f85b10:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f85b14:	14000014	b	0xfffff7f85b64
   0x0000fffff7f85b18:	f94047eb	ldr	x11, [sp, #136]
   0x0000fffff7f85b1c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85b20:	54000580	b.eq	0xfffff7f85bd0  // b.none
   0x0000fffff7f85b24:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85b28:	b94073ea	ldr	w10, [sp, #112]
   0x0000fffff7f85b2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85b30:	54000501	b.ne	0xfffff7f85bd0  // b.any
   0x0000fffff7f85b34:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f85b38:	f9403fea	ldr	x10, [sp, #120]
   0x0000fffff7f85b3c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85b40:	54000481	b.ne	0xfffff7f85bd0  // b.any
   0x0000fffff7f85b44:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85b48:	b94077ea	ldr	w10, [sp, #116]
   0x0000fffff7f85b4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85b50:	54000401	b.ne	0xfffff7f85bd0  // b.any
   0x0000fffff7f85b54:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f85b58:	f94043ea	ldr	x10, [sp, #128]
   0x0000fffff7f85b5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85b60:	54000381	b.ne	0xfffff7f85bd0  // b.any
   0x0000fffff7f85b64:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85b68:	37d8034d	tbnz	w13, #27, 0xfffff7f85bd0
   0x0000fffff7f85b6c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85b70:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f85b74:	36d8020e	tbz	w14, #27, 0xfffff7f85bb4
   0x0000fffff7f85b78:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85b7c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85b80:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85b84:	54000261	b.ne	0xfffff7f85bd0  // b.any
   0x0000fffff7f85b88:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85b8c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85b90:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85b94:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85b98:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85b9c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85ba0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85ba4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85ba8:	54000149	b.ls	0xfffff7f85bd0  // b.plast
   0x0000fffff7f85bac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85bb0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85bb4:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7f85bb8:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f85bbc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85bc0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85bc4:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f85bc8:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f85bcc:	1400000e	b	0xfffff7f85c04
   0x0000fffff7f85bd0:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f85bd4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85bd8:	aa1303e1	mov	x1, x19
   0x0000fffff7f85bdc:	aa1503e2	mov	x2, x21
   0x0000fffff7f85be0:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7f85be4:	aa1403e4	mov	x4, x20
   0x0000fffff7f85be8:	aa1603e5	mov	x5, x22
   0x0000fffff7f85bec:	d28ac810	mov	x16, #0x5640                	// #22080
   0x0000fffff7f85bf0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85bf4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85bf8:	d63f0200	blr	x16
   0x0000fffff7f85bfc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85c00:	54001580	b.eq	0xfffff7f85eb0  // b.none
   0x0000fffff7f85c04:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85c08:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85c0c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85c10:	aa1503e2	mov	x2, x21
   0x0000fffff7f85c14:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7f85c18:	aa1403e4	mov	x4, x20
   0x0000fffff7f85c1c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85c20:	d288c090	mov	x16, #0x4604                	// #17924
   0x0000fffff7f85c24:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85c28:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85c2c:	d63f0200	blr	x16
   0x0000fffff7f85c30:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85c34:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85c38:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85c3c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85c40:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f85c44:	d65f03c0	ret
   0x0000fffff7f85c48:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85c4c:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85c50:	b9000289	str	w9, [x20]
   0x0000fffff7f85c54:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f85c58:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85c5c:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85c60:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85c64:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85c68:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85c6c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85c70:	d65f03c0	ret
   0x0000fffff7f85c74:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85c78:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85c7c:	b9000289	str	w9, [x20]
   0x0000fffff7f85c80:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f85c84:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85c88:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85c8c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85c90:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85c94:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85c98:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85c9c:	d65f03c0	ret
   0x0000fffff7f85ca0:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85ca4:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85ca8:	b9000289	str	w9, [x20]
   0x0000fffff7f85cac:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f85cb0:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85cb4:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85cb8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85cbc:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85cc0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85cc4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85cc8:	d65f03c0	ret
   0x0000fffff7f85ccc:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85cd0:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85cd4:	b9000289	str	w9, [x20]
   0x0000fffff7f85cd8:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f85cdc:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85ce0:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85ce4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85ce8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85cec:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85cf0:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85cf4:	d65f03c0	ret
   0x0000fffff7f85cf8:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85cfc:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85d00:	b9000289	str	w9, [x20]
   0x0000fffff7f85d04:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f85d08:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85d0c:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85d10:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85d14:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85d18:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85d1c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85d20:	d65f03c0	ret
   0x0000fffff7f85d24:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85d28:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85d2c:	b9000289	str	w9, [x20]
   0x0000fffff7f85d30:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f85d34:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85d38:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85d3c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85d40:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85d44:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85d48:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85d4c:	d65f03c0	ret
   0x0000fffff7f85d50:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85d54:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85d58:	b9000289	str	w9, [x20]
   0x0000fffff7f85d5c:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f85d60:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85d64:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85d68:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85d6c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85d70:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85d74:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85d78:	d65f03c0	ret
   0x0000fffff7f85d7c:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85d80:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85d84:	b9000289	str	w9, [x20]
   0x0000fffff7f85d88:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f85d8c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85d90:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85d94:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85d98:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85d9c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85da0:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85da4:	d65f03c0	ret
   0x0000fffff7f85da8:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85dac:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85db0:	b9000289	str	w9, [x20]
   0x0000fffff7f85db4:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f85db8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85dbc:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85dc0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85dc4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85dc8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85dcc:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85dd0:	d65f03c0	ret
   0x0000fffff7f85dd4:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85dd8:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85ddc:	b9000289	str	w9, [x20]
   0x0000fffff7f85de0:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f85de4:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85de8:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85dec:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85df0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85df4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85df8:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85dfc:	d65f03c0	ret
   0x0000fffff7f85e00:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85e04:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85e08:	b9000289	str	w9, [x20]
   0x0000fffff7f85e0c:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7f85e10:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85e14:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85e18:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85e1c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85e20:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85e24:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85e28:	d65f03c0	ret
   0x0000fffff7f85e2c:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85e30:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85e34:	b9000289	str	w9, [x20]
   0x0000fffff7f85e38:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7f85e3c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85e40:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85e44:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85e48:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85e4c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85e50:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85e54:	d65f03c0	ret
   0x0000fffff7f85e58:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85e5c:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85e60:	b9000289	str	w9, [x20]
   0x0000fffff7f85e64:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7f85e68:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85e6c:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85e70:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85e74:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85e78:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85e7c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85e80:	d65f03c0	ret
   0x0000fffff7f85e84:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85e88:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85e8c:	b9000289	str	w9, [x20]
   0x0000fffff7f85e90:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7f85e94:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85e98:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85e9c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85ea0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85ea4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85ea8:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85eac:	d65f03c0	ret
   0x0000fffff7f85eb0:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85eb4:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85eb8:	b9000289	str	w9, [x20]
   0x0000fffff7f85ebc:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7f85ec0:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85ec4:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85ec8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85ecc:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85ed0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85ed4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85ed8:	d65f03c0	ret
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
