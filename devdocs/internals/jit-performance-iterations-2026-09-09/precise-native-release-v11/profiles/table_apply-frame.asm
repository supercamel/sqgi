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
   0x0000fffff7f85068:	54000501	b.ne	0xfffff7f85108  // b.any
   0x0000fffff7f8506c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f85070:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85074:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85078:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8507c:	54000461	b.ne	0xfffff7f85108  // b.any
   0x0000fffff7f85080:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7f85084:	f9400e6b	ldr	x11, [x19, #24]
   0x0000fffff7f85088:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f8508c:	eb09015f	cmp	x10, x9
   0x0000fffff7f85090:	540003c2	b.cs	0xfffff7f85108  // b.hs, b.nlast
   0x0000fffff7f85094:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f85098:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f8509c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f850a0:	37d8034d	tbnz	w13, #27, 0xfffff7f85108
   0x0000fffff7f850a4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f850a8:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f850ac:	36d8020e	tbz	w14, #27, 0xfffff7f850ec
   0x0000fffff7f850b0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f850b4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f850b8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f850bc:	54000261	b.ne	0xfffff7f85108  // b.any
   0x0000fffff7f850c0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f850c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f850c8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f850cc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f850d0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f850d4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f850d8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f850dc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f850e0:	54000149	b.ls	0xfffff7f85108  // b.plast
   0x0000fffff7f850e4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f850e8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f850ec:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7f850f0:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f850f4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f850f8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f850fc:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f85100:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f85104:	1400000e	b	0xfffff7f8513c
   0x0000fffff7f85108:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f8510c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85110:	aa1303e1	mov	x1, x19
   0x0000fffff7f85114:	aa1503e2	mov	x2, x21
   0x0000fffff7f85118:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7f8511c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85120:	aa1603e5	mov	x5, x22
   0x0000fffff7f85124:	d28e2010	mov	x16, #0x7100                	// #28928
   0x0000fffff7f85128:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8512c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85130:	d63f0200	blr	x16
   0x0000fffff7f85134:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85138:	54004040	b.eq	0xfffff7f85940  // b.none
   0x0000fffff7f8513c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85140:	37d806a9	tbnz	w9, #27, 0xfffff7f85214
   0x0000fffff7f85144:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85148:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8514c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85150:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85154:	540001c1	b.ne	0xfffff7f8518c  // b.any
   0x0000fffff7f85158:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f8515c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85160:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85164:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85168:	54000121	b.ne	0xfffff7f8518c  // b.any
   0x0000fffff7f8516c:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f85170:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f85174:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85178:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8517c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85180:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f85184:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f85188:	14000030	b	0xfffff7f85248
   0x0000fffff7f8518c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85190:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85194:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85198:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8519c:	54000120	b.eq	0xfffff7f851c0  // b.none
   0x0000fffff7f851a0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f851a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f851a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f851ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f851b0:	54000321	b.ne	0xfffff7f85214  // b.any
   0x0000fffff7f851b4:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f851b8:	9e620120	scvtf	d0, x9
   0x0000fffff7f851bc:	14000002	b	0xfffff7f851c4
   0x0000fffff7f851c0:	fd402e60	ldr	d0, [x19, #88]
   0x0000fffff7f851c4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f851c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f851cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f851d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f851d4:	54000120	b.eq	0xfffff7f851f8  // b.none
   0x0000fffff7f851d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f851dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f851e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f851e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f851e8:	54000161	b.ne	0xfffff7f85214  // b.any
   0x0000fffff7f851ec:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f851f0:	9e620121	scvtf	d1, x9
   0x0000fffff7f851f4:	14000002	b	0xfffff7f851fc
   0x0000fffff7f851f8:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7f851fc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f85200:	fd002e60	str	d0, [x19, #88]
   0x0000fffff7f85204:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85208:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8520c:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f85210:	17ffffde	b	0xfffff7f85188
   0x0000fffff7f85214:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85218:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8521c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85220:	aa1503e2	mov	x2, x21
   0x0000fffff7f85224:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7f85228:	aa1403e4	mov	x4, x20
   0x0000fffff7f8522c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85230:	d293fa90	mov	x16, #0x9fd4                	// #40916
   0x0000fffff7f85234:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85238:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8523c:	d63f0200	blr	x16
   0x0000fffff7f85240:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85244:	54003940	b.eq	0xfffff7f8596c  // b.none
   0x0000fffff7f85248:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8524c:	37d800e9	tbnz	w9, #27, 0xfffff7f85268
   0x0000fffff7f85250:	d29ffe29	mov	x9, #0xfff1                	// #65521
   0x0000fffff7f85254:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85258:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8525c:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f85260:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f85264:	1400000e	b	0xfffff7f8529c
   0x0000fffff7f85268:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8526c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85270:	aa1303e1	mov	x1, x19
   0x0000fffff7f85274:	aa1503e2	mov	x2, x21
   0x0000fffff7f85278:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f8527c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85280:	aa1603e5	mov	x5, x22
   0x0000fffff7f85284:	d286be10	mov	x16, #0x35f0                	// #13808
   0x0000fffff7f85288:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8528c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85290:	d63f0200	blr	x16
   0x0000fffff7f85294:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85298:	54003800	b.eq	0xfffff7f85998  // b.none
   0x0000fffff7f8529c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f852a0:	37d80389	tbnz	w9, #27, 0xfffff7f85310
   0x0000fffff7f852a4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f852a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f852ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f852b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f852b4:	540002e1	b.ne	0xfffff7f85310  // b.any
   0x0000fffff7f852b8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f852bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f852c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f852c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f852c8:	54000241	b.ne	0xfffff7f85310  // b.any
   0x0000fffff7f852cc:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f852d0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f852d4:	f100015f	cmp	x10, #0x0
   0x0000fffff7f852d8:	540001c0	b.eq	0xfffff7f85310  // b.none
   0x0000fffff7f852dc:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f852e0:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f852e4:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f852e8:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f852ec:	eb0b015f	cmp	x10, x11
   0x0000fffff7f852f0:	54000100	b.eq	0xfffff7f85310  // b.none
   0x0000fffff7f852f4:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f852f8:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f852fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85300:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85304:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f85308:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f8530c:	1400000e	b	0xfffff7f85344
   0x0000fffff7f85310:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85314:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85318:	aa1303e1	mov	x1, x19
   0x0000fffff7f8531c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85320:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7f85324:	aa1403e4	mov	x4, x20
   0x0000fffff7f85328:	aa1603e5	mov	x5, x22
   0x0000fffff7f8532c:	d292cc10	mov	x16, #0x9660                	// #38496
   0x0000fffff7f85330:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85334:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85338:	d63f0200	blr	x16
   0x0000fffff7f8533c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85340:	54003420	b.eq	0xfffff7f859c4  // b.none
   0x0000fffff7f85344:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f85348:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8534c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85350:	aa1503e2	mov	x2, x21
   0x0000fffff7f85354:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7f85358:	aa1403e4	mov	x4, x20
   0x0000fffff7f8535c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85360:	d2908810	mov	x16, #0x8440                	// #33856
   0x0000fffff7f85364:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85368:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8536c:	d63f0200	blr	x16
   0x0000fffff7f85370:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85374:	540033e0	b.eq	0xfffff7f859f0  // b.none
   0x0000fffff7f85378:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8537c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85380:	aa1303e1	mov	x1, x19
   0x0000fffff7f85384:	aa1503e2	mov	x2, x21
   0x0000fffff7f85388:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f8538c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85390:	aa1603e5	mov	x5, x22
   0x0000fffff7f85394:	d2980e10	mov	x16, #0xc070                	// #49264
   0x0000fffff7f85398:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8539c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f853a0:	d63f0200	blr	x16
   0x0000fffff7f853a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f853a8:	540033a0	b.eq	0xfffff7f85a1c  // b.none
   0x0000fffff7f853ac:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f853b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f853b4:	aa1303e1	mov	x1, x19
   0x0000fffff7f853b8:	aa1503e2	mov	x2, x21
   0x0000fffff7f853bc:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f853c0:	aa1403e4	mov	x4, x20
   0x0000fffff7f853c4:	aa1603e5	mov	x5, x22
   0x0000fffff7f853c8:	d2980e10	mov	x16, #0xc070                	// #49264
   0x0000fffff7f853cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f853d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f853d4:	d63f0200	blr	x16
   0x0000fffff7f853d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f853dc:	54003360	b.eq	0xfffff7f85a48  // b.none
   0x0000fffff7f853e0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f853e4:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f853e8:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f853ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f853f0:	54000501	b.ne	0xfffff7f85490  // b.any
   0x0000fffff7f853f4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f853f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f853fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85400:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85404:	54000461	b.ne	0xfffff7f85490  // b.any
   0x0000fffff7f85408:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f8540c:	f940366b	ldr	x11, [x19, #104]
   0x0000fffff7f85410:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f85414:	eb09015f	cmp	x10, x9
   0x0000fffff7f85418:	540003c2	b.cs	0xfffff7f85490  // b.hs, b.nlast
   0x0000fffff7f8541c:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f85420:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f85424:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85428:	37d8034d	tbnz	w13, #27, 0xfffff7f85490
   0x0000fffff7f8542c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85430:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f85434:	36d8020e	tbz	w14, #27, 0xfffff7f85474
   0x0000fffff7f85438:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8543c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85440:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85444:	54000261	b.ne	0xfffff7f85490  // b.any
   0x0000fffff7f85448:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8544c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85450:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85454:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85458:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8545c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85460:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85464:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85468:	54000149	b.ls	0xfffff7f85490  // b.plast
   0x0000fffff7f8546c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85470:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85474:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f85478:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8547c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85480:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85484:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f85488:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8548c:	1400000e	b	0xfffff7f854c4
   0x0000fffff7f85490:	910143e6	add	x6, sp, #0x50
   0x0000fffff7f85494:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85498:	aa1303e1	mov	x1, x19
   0x0000fffff7f8549c:	aa1503e2	mov	x2, x21
   0x0000fffff7f854a0:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f854a4:	aa1403e4	mov	x4, x20
   0x0000fffff7f854a8:	aa1603e5	mov	x5, x22
   0x0000fffff7f854ac:	d28e2010	mov	x16, #0x7100                	// #28928
   0x0000fffff7f854b0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f854b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f854b8:	d63f0200	blr	x16
   0x0000fffff7f854bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f854c0:	54002da0	b.eq	0xfffff7f85a74  // b.none
   0x0000fffff7f854c4:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f854c8:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f854cc:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f854d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f854d4:	54000501	b.ne	0xfffff7f85574  // b.any
   0x0000fffff7f854d8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f854dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f854e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f854e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f854e8:	54000461	b.ne	0xfffff7f85574  // b.any
   0x0000fffff7f854ec:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7f854f0:	f9400e6b	ldr	x11, [x19, #24]
   0x0000fffff7f854f4:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f854f8:	eb09015f	cmp	x10, x9
   0x0000fffff7f854fc:	540003c2	b.cs	0xfffff7f85574  // b.hs, b.nlast
   0x0000fffff7f85500:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f85504:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f85508:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8550c:	37d8034d	tbnz	w13, #27, 0xfffff7f85574
   0x0000fffff7f85510:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85514:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f85518:	36d8020e	tbz	w14, #27, 0xfffff7f85558
   0x0000fffff7f8551c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85520:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85524:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85528:	54000261	b.ne	0xfffff7f85574  // b.any
   0x0000fffff7f8552c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85530:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85534:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85538:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8553c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85540:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85544:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85548:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8554c:	54000149	b.ls	0xfffff7f85574  // b.plast
   0x0000fffff7f85550:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85554:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85558:	b940726e	ldr	w14, [x19, #112]
   0x0000fffff7f8555c:	f9403e6f	ldr	x15, [x19, #120]
   0x0000fffff7f85560:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85564:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85568:	f9003e6c	str	x12, [x19, #120]
   0x0000fffff7f8556c:	b900726d	str	w13, [x19, #112]
   0x0000fffff7f85570:	1400000e	b	0xfffff7f855a8
   0x0000fffff7f85574:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f85578:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8557c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85580:	aa1503e2	mov	x2, x21
   0x0000fffff7f85584:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f85588:	aa1403e4	mov	x4, x20
   0x0000fffff7f8558c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85590:	d28e2010	mov	x16, #0x7100                	// #28928
   0x0000fffff7f85594:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85598:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8559c:	d63f0200	blr	x16
   0x0000fffff7f855a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f855a4:	540027e0	b.eq	0xfffff7f85aa0  // b.none
   0x0000fffff7f855a8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f855ac:	37d806a9	tbnz	w9, #27, 0xfffff7f85680
   0x0000fffff7f855b0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f855b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f855b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f855bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f855c0:	540001c1	b.ne	0xfffff7f855f8  // b.any
   0x0000fffff7f855c4:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f855c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f855cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f855d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f855d4:	54000121	b.ne	0xfffff7f855f8  // b.any
   0x0000fffff7f855d8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f855dc:	f9403e6a	ldr	x10, [x19, #120]
   0x0000fffff7f855e0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f855e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f855e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f855ec:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f855f0:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f855f4:	14000030	b	0xfffff7f856b4
   0x0000fffff7f855f8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f855fc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85600:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85604:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85608:	54000120	b.eq	0xfffff7f8562c  // b.none
   0x0000fffff7f8560c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85610:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85614:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85618:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8561c:	54000321	b.ne	0xfffff7f85680  // b.any
   0x0000fffff7f85620:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f85624:	9e620120	scvtf	d0, x9
   0x0000fffff7f85628:	14000002	b	0xfffff7f85630
   0x0000fffff7f8562c:	fd403660	ldr	d0, [x19, #104]
   0x0000fffff7f85630:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f85634:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85638:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8563c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85640:	54000120	b.eq	0xfffff7f85664  // b.none
   0x0000fffff7f85644:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f85648:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8564c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85650:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85654:	54000161	b.ne	0xfffff7f85680  // b.any
   0x0000fffff7f85658:	f9403e69	ldr	x9, [x19, #120]
   0x0000fffff7f8565c:	9e620121	scvtf	d1, x9
   0x0000fffff7f85660:	14000002	b	0xfffff7f85668
   0x0000fffff7f85664:	fd403e61	ldr	d1, [x19, #120]
   0x0000fffff7f85668:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8566c:	fd003660	str	d0, [x19, #104]
   0x0000fffff7f85670:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85674:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85678:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f8567c:	17ffffde	b	0xfffff7f855f4
   0x0000fffff7f85680:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85684:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85688:	aa1303e1	mov	x1, x19
   0x0000fffff7f8568c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85690:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f85694:	aa1403e4	mov	x4, x20
   0x0000fffff7f85698:	aa1603e5	mov	x5, x22
   0x0000fffff7f8569c:	d293fa90	mov	x16, #0x9fd4                	// #40916
   0x0000fffff7f856a0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f856a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f856a8:	d63f0200	blr	x16
   0x0000fffff7f856ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7f856b0:	540020e0	b.eq	0xfffff7f85acc  // b.none
   0x0000fffff7f856b4:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f856b8:	37d800e9	tbnz	w9, #27, 0xfffff7f856d4
   0x0000fffff7f856bc:	d2807ca9	mov	x9, #0x3e5                 	// #997
   0x0000fffff7f856c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f856c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f856c8:	f9003e69	str	x9, [x19, #120]
   0x0000fffff7f856cc:	b900726a	str	w10, [x19, #112]
   0x0000fffff7f856d0:	1400000e	b	0xfffff7f85708
   0x0000fffff7f856d4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f856d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f856dc:	aa1303e1	mov	x1, x19
   0x0000fffff7f856e0:	aa1503e2	mov	x2, x21
   0x0000fffff7f856e4:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f856e8:	aa1403e4	mov	x4, x20
   0x0000fffff7f856ec:	aa1603e5	mov	x5, x22
   0x0000fffff7f856f0:	d286be10	mov	x16, #0x35f0                	// #13808
   0x0000fffff7f856f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f856f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f856fc:	d63f0200	blr	x16
   0x0000fffff7f85700:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85704:	54001fa0	b.eq	0xfffff7f85af8  // b.none
   0x0000fffff7f85708:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8570c:	37d80389	tbnz	w9, #27, 0xfffff7f8577c
   0x0000fffff7f85710:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85714:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85718:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8571c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85720:	540002e1	b.ne	0xfffff7f8577c  // b.any
   0x0000fffff7f85724:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f85728:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8572c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85730:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85734:	54000241	b.ne	0xfffff7f8577c  // b.any
   0x0000fffff7f85738:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8573c:	f9403e6a	ldr	x10, [x19, #120]
   0x0000fffff7f85740:	f100015f	cmp	x10, #0x0
   0x0000fffff7f85744:	540001c0	b.eq	0xfffff7f8577c  // b.none
   0x0000fffff7f85748:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f8574c:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f85750:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f85754:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f85758:	eb0b015f	cmp	x10, x11
   0x0000fffff7f8575c:	54000100	b.eq	0xfffff7f8577c  // b.none
   0x0000fffff7f85760:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f85764:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f85768:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8576c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85770:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f85774:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f85778:	1400000e	b	0xfffff7f857b0
   0x0000fffff7f8577c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85780:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85784:	aa1303e1	mov	x1, x19
   0x0000fffff7f85788:	aa1503e2	mov	x2, x21
   0x0000fffff7f8578c:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7f85790:	aa1403e4	mov	x4, x20
   0x0000fffff7f85794:	aa1603e5	mov	x5, x22
   0x0000fffff7f85798:	d292cc10	mov	x16, #0x9660                	// #38496
   0x0000fffff7f8579c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f857a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f857a4:	d63f0200	blr	x16
   0x0000fffff7f857a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f857ac:	54001bc0	b.eq	0xfffff7f85b24  // b.none
   0x0000fffff7f857b0:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f857b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f857b8:	aa1303e1	mov	x1, x19
   0x0000fffff7f857bc:	aa1503e2	mov	x2, x21
   0x0000fffff7f857c0:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7f857c4:	aa1403e4	mov	x4, x20
   0x0000fffff7f857c8:	aa1603e5	mov	x5, x22
   0x0000fffff7f857cc:	d2908810	mov	x16, #0x8440                	// #33856
   0x0000fffff7f857d0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f857d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f857d8:	d63f0200	blr	x16
   0x0000fffff7f857dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f857e0:	54001b80	b.eq	0xfffff7f85b50  // b.none
   0x0000fffff7f857e4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f857e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f857ec:	aa1303e1	mov	x1, x19
   0x0000fffff7f857f0:	aa1503e2	mov	x2, x21
   0x0000fffff7f857f4:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7f857f8:	aa1403e4	mov	x4, x20
   0x0000fffff7f857fc:	aa1603e5	mov	x5, x22
   0x0000fffff7f85800:	d2980e10	mov	x16, #0xc070                	// #49264
   0x0000fffff7f85804:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85808:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8580c:	d63f0200	blr	x16
   0x0000fffff7f85810:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85814:	54001b40	b.eq	0xfffff7f85b7c  // b.none
   0x0000fffff7f85818:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f8581c:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f85820:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f85824:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85828:	54000501	b.ne	0xfffff7f858c8  // b.any
   0x0000fffff7f8582c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85830:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85834:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85838:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8583c:	54000461	b.ne	0xfffff7f858c8  // b.any
   0x0000fffff7f85840:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f85844:	f9402e6b	ldr	x11, [x19, #88]
   0x0000fffff7f85848:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f8584c:	eb09015f	cmp	x10, x9
   0x0000fffff7f85850:	540003c2	b.cs	0xfffff7f858c8  // b.hs, b.nlast
   0x0000fffff7f85854:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f85858:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f8585c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85860:	37d8034d	tbnz	w13, #27, 0xfffff7f858c8
   0x0000fffff7f85864:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85868:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f8586c:	36d8020e	tbz	w14, #27, 0xfffff7f858ac
   0x0000fffff7f85870:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85874:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85878:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8587c:	54000261	b.ne	0xfffff7f858c8  // b.any
   0x0000fffff7f85880:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85884:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85888:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8588c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85890:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85894:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85898:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8589c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f858a0:	54000149	b.ls	0xfffff7f858c8  // b.plast
   0x0000fffff7f858a4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f858a8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f858ac:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7f858b0:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f858b4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f858b8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f858bc:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f858c0:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f858c4:	1400000e	b	0xfffff7f858fc
   0x0000fffff7f858c8:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f858cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f858d0:	aa1303e1	mov	x1, x19
   0x0000fffff7f858d4:	aa1503e2	mov	x2, x21
   0x0000fffff7f858d8:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7f858dc:	aa1403e4	mov	x4, x20
   0x0000fffff7f858e0:	aa1603e5	mov	x5, x22
   0x0000fffff7f858e4:	d28e2010	mov	x16, #0x7100                	// #28928
   0x0000fffff7f858e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f858ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f858f0:	d63f0200	blr	x16
   0x0000fffff7f858f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f858f8:	54001580	b.eq	0xfffff7f85ba8  // b.none
   0x0000fffff7f858fc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85900:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85904:	aa1303e1	mov	x1, x19
   0x0000fffff7f85908:	aa1503e2	mov	x2, x21
   0x0000fffff7f8590c:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7f85910:	aa1403e4	mov	x4, x20
   0x0000fffff7f85914:	aa1603e5	mov	x5, x22
   0x0000fffff7f85918:	d288c090	mov	x16, #0x4604                	// #17924
   0x0000fffff7f8591c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85920:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85924:	d63f0200	blr	x16
   0x0000fffff7f85928:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f8592c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85930:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85934:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85938:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f8593c:	d65f03c0	ret
   0x0000fffff7f85940:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85944:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85948:	b9000289	str	w9, [x20]
   0x0000fffff7f8594c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f85950:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85954:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85958:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f8595c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85960:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85964:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85968:	d65f03c0	ret
   0x0000fffff7f8596c:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85970:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85974:	b9000289	str	w9, [x20]
   0x0000fffff7f85978:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f8597c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85980:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85984:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85988:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f8598c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85990:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85994:	d65f03c0	ret
   0x0000fffff7f85998:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f8599c:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f859a0:	b9000289	str	w9, [x20]
   0x0000fffff7f859a4:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f859a8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f859ac:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f859b0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f859b4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f859b8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f859bc:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f859c0:	d65f03c0	ret
   0x0000fffff7f859c4:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f859c8:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f859cc:	b9000289	str	w9, [x20]
   0x0000fffff7f859d0:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f859d4:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f859d8:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f859dc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f859e0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f859e4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f859e8:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f859ec:	d65f03c0	ret
   0x0000fffff7f859f0:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f859f4:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f859f8:	b9000289	str	w9, [x20]
   0x0000fffff7f859fc:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f85a00:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85a04:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85a08:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85a0c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85a10:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85a14:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85a18:	d65f03c0	ret
   0x0000fffff7f85a1c:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85a20:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85a24:	b9000289	str	w9, [x20]
   0x0000fffff7f85a28:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f85a2c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85a30:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85a34:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85a38:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85a3c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85a40:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85a44:	d65f03c0	ret
   0x0000fffff7f85a48:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85a4c:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85a50:	b9000289	str	w9, [x20]
   0x0000fffff7f85a54:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f85a58:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85a5c:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85a60:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85a64:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85a68:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85a6c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85a70:	d65f03c0	ret
   0x0000fffff7f85a74:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85a78:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85a7c:	b9000289	str	w9, [x20]
   0x0000fffff7f85a80:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f85a84:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85a88:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85a8c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85a90:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85a94:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85a98:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85a9c:	d65f03c0	ret
   0x0000fffff7f85aa0:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85aa4:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85aa8:	b9000289	str	w9, [x20]
   0x0000fffff7f85aac:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f85ab0:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85ab4:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85ab8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85abc:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85ac0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85ac4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85ac8:	d65f03c0	ret
   0x0000fffff7f85acc:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85ad0:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85ad4:	b9000289	str	w9, [x20]
   0x0000fffff7f85ad8:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f85adc:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85ae0:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85ae4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85ae8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85aec:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85af0:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85af4:	d65f03c0	ret
   0x0000fffff7f85af8:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85afc:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85b00:	b9000289	str	w9, [x20]
   0x0000fffff7f85b04:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7f85b08:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85b0c:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85b10:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85b14:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85b18:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85b1c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85b20:	d65f03c0	ret
   0x0000fffff7f85b24:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85b28:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85b2c:	b9000289	str	w9, [x20]
   0x0000fffff7f85b30:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7f85b34:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85b38:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85b3c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85b40:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85b44:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85b48:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85b4c:	d65f03c0	ret
   0x0000fffff7f85b50:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85b54:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85b58:	b9000289	str	w9, [x20]
   0x0000fffff7f85b5c:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7f85b60:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85b64:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85b68:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85b6c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85b70:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85b74:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85b78:	d65f03c0	ret
   0x0000fffff7f85b7c:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85b80:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85b84:	b9000289	str	w9, [x20]
   0x0000fffff7f85b88:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7f85b8c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85b90:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85b94:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85b98:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85b9c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85ba0:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85ba4:	d65f03c0	ret
   0x0000fffff7f85ba8:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85bac:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85bb0:	b9000289	str	w9, [x20]
   0x0000fffff7f85bb4:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7f85bb8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85bbc:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f85bc0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85bc4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85bc8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85bcc:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85bd0:	d65f03c0	ret
   0x0000fffff7f85bd4:	00000000	udf	#0
   0x0000fffff7f85bd8:	00000000	udf	#0
   0x0000fffff7f85bdc:	00000000	udf	#0
   0x0000fffff7f85be0:	00000000	udf	#0
   0x0000fffff7f85be4:	00000000	udf	#0
   0x0000fffff7f85be8:	00000000	udf	#0
   0x0000fffff7f85bec:	00000000	udf	#0
   0x0000fffff7f85bf0:	00000000	udf	#0
   0x0000fffff7f85bf4:	00000000	udf	#0
   0x0000fffff7f85bf8:	00000000	udf	#0
   0x0000fffff7f85bfc:	00000000	udf	#0
   0x0000fffff7f85c00:	00000000	udf	#0
   0x0000fffff7f85c04:	00000000	udf	#0
   0x0000fffff7f85c08:	00000000	udf	#0
   0x0000fffff7f85c0c:	00000000	udf	#0
   0x0000fffff7f85c10:	00000000	udf	#0
   0x0000fffff7f85c14:	00000000	udf	#0
   0x0000fffff7f85c18:	00000000	udf	#0
   0x0000fffff7f85c1c:	00000000	udf	#0
   0x0000fffff7f85c20:	00000000	udf	#0
   0x0000fffff7f85c24:	00000000	udf	#0
   0x0000fffff7f85c28:	00000000	udf	#0
   0x0000fffff7f85c2c:	00000000	udf	#0
   0x0000fffff7f85c30:	00000000	udf	#0
   0x0000fffff7f85c34:	00000000	udf	#0
   0x0000fffff7f85c38:	00000000	udf	#0
   0x0000fffff7f85c3c:	00000000	udf	#0
   0x0000fffff7f85c40:	00000000	udf	#0
   0x0000fffff7f85c44:	00000000	udf	#0
   0x0000fffff7f85c48:	00000000	udf	#0
   0x0000fffff7f85c4c:	00000000	udf	#0
   0x0000fffff7f85c50:	00000000	udf	#0
   0x0000fffff7f85c54:	00000000	udf	#0
   0x0000fffff7f85c58:	00000000	udf	#0
   0x0000fffff7f85c5c:	00000000	udf	#0
   0x0000fffff7f85c60:	00000000	udf	#0
   0x0000fffff7f85c64:	00000000	udf	#0
   0x0000fffff7f85c68:	00000000	udf	#0
   0x0000fffff7f85c6c:	00000000	udf	#0
   0x0000fffff7f85c70:	00000000	udf	#0
   0x0000fffff7f85c74:	00000000	udf	#0
   0x0000fffff7f85c78:	00000000	udf	#0
   0x0000fffff7f85c7c:	00000000	udf	#0
   0x0000fffff7f85c80:	00000000	udf	#0
   0x0000fffff7f85c84:	00000000	udf	#0
   0x0000fffff7f85c88:	00000000	udf	#0
   0x0000fffff7f85c8c:	00000000	udf	#0
   0x0000fffff7f85c90:	00000000	udf	#0
   0x0000fffff7f85c94:	00000000	udf	#0
   0x0000fffff7f85c98:	00000000	udf	#0
   0x0000fffff7f85c9c:	00000000	udf	#0
   0x0000fffff7f85ca0:	00000000	udf	#0
   0x0000fffff7f85ca4:	00000000	udf	#0
   0x0000fffff7f85ca8:	00000000	udf	#0
   0x0000fffff7f85cac:	00000000	udf	#0
   0x0000fffff7f85cb0:	00000000	udf	#0
   0x0000fffff7f85cb4:	00000000	udf	#0
   0x0000fffff7f85cb8:	00000000	udf	#0
   0x0000fffff7f85cbc:	00000000	udf	#0
   0x0000fffff7f85cc0:	00000000	udf	#0
   0x0000fffff7f85cc4:	00000000	udf	#0
   0x0000fffff7f85cc8:	00000000	udf	#0
   0x0000fffff7f85ccc:	00000000	udf	#0
   0x0000fffff7f85cd0:	00000000	udf	#0
   0x0000fffff7f85cd4:	00000000	udf	#0
   0x0000fffff7f85cd8:	00000000	udf	#0
   0x0000fffff7f85cdc:	00000000	udf	#0
   0x0000fffff7f85ce0:	00000000	udf	#0
   0x0000fffff7f85ce4:	00000000	udf	#0
   0x0000fffff7f85ce8:	00000000	udf	#0
   0x0000fffff7f85cec:	00000000	udf	#0
   0x0000fffff7f85cf0:	00000000	udf	#0
   0x0000fffff7f85cf4:	00000000	udf	#0
   0x0000fffff7f85cf8:	00000000	udf	#0
   0x0000fffff7f85cfc:	00000000	udf	#0
   0x0000fffff7f85d00:	00000000	udf	#0
   0x0000fffff7f85d04:	00000000	udf	#0
   0x0000fffff7f85d08:	00000000	udf	#0
   0x0000fffff7f85d0c:	00000000	udf	#0
   0x0000fffff7f85d10:	00000000	udf	#0
   0x0000fffff7f85d14:	00000000	udf	#0
   0x0000fffff7f85d18:	00000000	udf	#0
   0x0000fffff7f85d1c:	00000000	udf	#0
   0x0000fffff7f85d20:	00000000	udf	#0
   0x0000fffff7f85d24:	00000000	udf	#0
   0x0000fffff7f85d28:	00000000	udf	#0
   0x0000fffff7f85d2c:	00000000	udf	#0
   0x0000fffff7f85d30:	00000000	udf	#0
   0x0000fffff7f85d34:	00000000	udf	#0
   0x0000fffff7f85d38:	00000000	udf	#0
   0x0000fffff7f85d3c:	00000000	udf	#0
   0x0000fffff7f85d40:	00000000	udf	#0
   0x0000fffff7f85d44:	00000000	udf	#0
   0x0000fffff7f85d48:	00000000	udf	#0
   0x0000fffff7f85d4c:	00000000	udf	#0
   0x0000fffff7f85d50:	00000000	udf	#0
   0x0000fffff7f85d54:	00000000	udf	#0
   0x0000fffff7f85d58:	00000000	udf	#0
   0x0000fffff7f85d5c:	00000000	udf	#0
   0x0000fffff7f85d60:	00000000	udf	#0
   0x0000fffff7f85d64:	00000000	udf	#0
   0x0000fffff7f85d68:	00000000	udf	#0
   0x0000fffff7f85d6c:	00000000	udf	#0
   0x0000fffff7f85d70:	00000000	udf	#0
   0x0000fffff7f85d74:	00000000	udf	#0
   0x0000fffff7f85d78:	00000000	udf	#0
   0x0000fffff7f85d7c:	00000000	udf	#0
   0x0000fffff7f85d80:	00000000	udf	#0
   0x0000fffff7f85d84:	00000000	udf	#0
   0x0000fffff7f85d88:	00000000	udf	#0
   0x0000fffff7f85d8c:	00000000	udf	#0
   0x0000fffff7f85d90:	00000000	udf	#0
   0x0000fffff7f85d94:	00000000	udf	#0
   0x0000fffff7f85d98:	00000000	udf	#0
   0x0000fffff7f85d9c:	00000000	udf	#0
   0x0000fffff7f85da0:	00000000	udf	#0
   0x0000fffff7f85da4:	00000000	udf	#0
   0x0000fffff7f85da8:	00000000	udf	#0
   0x0000fffff7f85dac:	00000000	udf	#0
   0x0000fffff7f85db0:	00000000	udf	#0
   0x0000fffff7f85db4:	00000000	udf	#0
   0x0000fffff7f85db8:	00000000	udf	#0
   0x0000fffff7f85dbc:	00000000	udf	#0
   0x0000fffff7f85dc0:	00000000	udf	#0
   0x0000fffff7f85dc4:	00000000	udf	#0
   0x0000fffff7f85dc8:	00000000	udf	#0
   0x0000fffff7f85dcc:	00000000	udf	#0
   0x0000fffff7f85dd0:	00000000	udf	#0
   0x0000fffff7f85dd4:	00000000	udf	#0
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
