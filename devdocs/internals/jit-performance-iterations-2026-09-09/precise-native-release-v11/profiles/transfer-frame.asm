Dump of assembler code from 0xfffff7f85000 to 0xfffff7f86000:
   0x0000fffff7f85000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7f85004:	910003fd	mov	x29, sp
   0x0000fffff7f85008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7f8500c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7f85010:	d102c3ff	sub	sp, sp, #0xb0
   0x0000fffff7f85014:	aa0003f3	mov	x19, x0
   0x0000fffff7f85018:	aa0103f4	mov	x20, x1
   0x0000fffff7f8501c:	aa0203f5	mov	x21, x2
   0x0000fffff7f85020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7f85024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7f85028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f8502c:	f90003e9	str	x9, [sp]
   0x0000fffff7f85030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7f85034:	d28000a1	mov	x1, #0x5                   	// #5
   0x0000fffff7f85038:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7f8503c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85044:	d63f0200	blr	x16
   0x0000fffff7f85048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7f8504c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7f85050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7f85054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7f85058:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f8505c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85060:	aa1303e1	mov	x1, x19
   0x0000fffff7f85064:	aa1503e2	mov	x2, x21
   0x0000fffff7f85068:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7f8506c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85070:	aa1603e5	mov	x5, x22
   0x0000fffff7f85074:	d2980e10	mov	x16, #0xc070                	// #49264
   0x0000fffff7f85078:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8507c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85080:	d63f0200	blr	x16
   0x0000fffff7f85084:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85088:	54002780	b.eq	0xfffff7f85578  // b.none
   0x0000fffff7f8508c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85090:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85094:	aa1303e1	mov	x1, x19
   0x0000fffff7f85098:	aa1503e2	mov	x2, x21
   0x0000fffff7f8509c:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7f850a0:	aa1403e4	mov	x4, x20
   0x0000fffff7f850a4:	aa1603e5	mov	x5, x22
   0x0000fffff7f850a8:	d2898810	mov	x16, #0x4c40                	// #19520
   0x0000fffff7f850ac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f850b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f850b4:	d63f0200	blr	x16
   0x0000fffff7f850b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f850bc:	54002740	b.eq	0xfffff7f855a4  // b.none
   0x0000fffff7f850c0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f850c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f850c8:	aa1303e1	mov	x1, x19
   0x0000fffff7f850cc:	aa1503e2	mov	x2, x21
   0x0000fffff7f850d0:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f850d4:	aa1403e4	mov	x4, x20
   0x0000fffff7f850d8:	aa1603e5	mov	x5, x22
   0x0000fffff7f850dc:	d2973c10	mov	x16, #0xb9e0                	// #47584
   0x0000fffff7f850e0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f850e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f850e8:	d63f0200	blr	x16
   0x0000fffff7f850ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f850f0:	54002700	b.eq	0xfffff7f855d0  // b.none
   0x0000fffff7f850f4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f850f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f850fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f85100:	aa1503e2	mov	x2, x21
   0x0000fffff7f85104:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7f85108:	aa1403e4	mov	x4, x20
   0x0000fffff7f8510c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85110:	d29b9a10	mov	x16, #0xdcd0                	// #56528
   0x0000fffff7f85114:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85118:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8511c:	d63f0200	blr	x16
   0x0000fffff7f85120:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85124:	540026c0	b.eq	0xfffff7f855fc  // b.none
   0x0000fffff7f85128:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8512c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85130:	aa1303e1	mov	x1, x19
   0x0000fffff7f85134:	aa1503e2	mov	x2, x21
   0x0000fffff7f85138:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7f8513c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85140:	aa1603e5	mov	x5, x22
   0x0000fffff7f85144:	d2944490	mov	x16, #0xa224                	// #41508
   0x0000fffff7f85148:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8514c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85150:	d63f0200	blr	x16
   0x0000fffff7f85154:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85158:	54002680	b.eq	0xfffff7f85628  // b.none
   0x0000fffff7f8515c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85160:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85164:	aa1303e1	mov	x1, x19
   0x0000fffff7f85168:	aa1503e2	mov	x2, x21
   0x0000fffff7f8516c:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f85170:	aa1403e4	mov	x4, x20
   0x0000fffff7f85174:	aa1603e5	mov	x5, x22
   0x0000fffff7f85178:	d29b9a10	mov	x16, #0xdcd0                	// #56528
   0x0000fffff7f8517c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85180:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85184:	d63f0200	blr	x16
   0x0000fffff7f85188:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8518c:	54002640	b.eq	0xfffff7f85654  // b.none
   0x0000fffff7f85190:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85194:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85198:	aa1303e1	mov	x1, x19
   0x0000fffff7f8519c:	aa1503e2	mov	x2, x21
   0x0000fffff7f851a0:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f851a4:	aa1403e4	mov	x4, x20
   0x0000fffff7f851a8:	aa1603e5	mov	x5, x22
   0x0000fffff7f851ac:	d2944490	mov	x16, #0xa224                	// #41508
   0x0000fffff7f851b0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f851b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f851b8:	d63f0200	blr	x16
   0x0000fffff7f851bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f851c0:	54002600	b.eq	0xfffff7f85680  // b.none
   0x0000fffff7f851c4:	910143e6	add	x6, sp, #0x50
   0x0000fffff7f851c8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f851cc:	aa1303e1	mov	x1, x19
   0x0000fffff7f851d0:	aa1503e2	mov	x2, x21
   0x0000fffff7f851d4:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f851d8:	aa1403e4	mov	x4, x20
   0x0000fffff7f851dc:	aa1603e5	mov	x5, x22
   0x0000fffff7f851e0:	d29b9a10	mov	x16, #0xdcd0                	// #56528
   0x0000fffff7f851e4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f851e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f851ec:	d63f0200	blr	x16
   0x0000fffff7f851f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f851f4:	540025c0	b.eq	0xfffff7f856ac  // b.none
   0x0000fffff7f851f8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f851fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85200:	aa1303e1	mov	x1, x19
   0x0000fffff7f85204:	aa1503e2	mov	x2, x21
   0x0000fffff7f85208:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f8520c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85210:	aa1603e5	mov	x5, x22
   0x0000fffff7f85214:	d2980e10	mov	x16, #0xc070                	// #49264
   0x0000fffff7f85218:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8521c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85220:	d63f0200	blr	x16
   0x0000fffff7f85224:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85228:	54002580	b.eq	0xfffff7f856d8  // b.none
   0x0000fffff7f8522c:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f85230:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f85234:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f85238:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8523c:	54000501	b.ne	0xfffff7f852dc  // b.any
   0x0000fffff7f85240:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85244:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85248:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8524c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85250:	54000461	b.ne	0xfffff7f852dc  // b.any
   0x0000fffff7f85254:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f85258:	f9403e6b	ldr	x11, [x19, #120]
   0x0000fffff7f8525c:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f85260:	eb09015f	cmp	x10, x9
   0x0000fffff7f85264:	540003c2	b.cs	0xfffff7f852dc  // b.hs, b.nlast
   0x0000fffff7f85268:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f8526c:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f85270:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85274:	37d8034d	tbnz	w13, #27, 0xfffff7f852dc
   0x0000fffff7f85278:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8527c:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f85280:	36d8020e	tbz	w14, #27, 0xfffff7f852c0
   0x0000fffff7f85284:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85288:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8528c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85290:	54000261	b.ne	0xfffff7f852dc  // b.any
   0x0000fffff7f85294:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85298:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8529c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f852a0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f852a4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f852a8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f852ac:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f852b0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f852b4:	54000149	b.ls	0xfffff7f852dc  // b.plast
   0x0000fffff7f852b8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f852bc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f852c0:	b940726e	ldr	w14, [x19, #112]
   0x0000fffff7f852c4:	f9403e6f	ldr	x15, [x19, #120]
   0x0000fffff7f852c8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f852cc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f852d0:	f9003e6c	str	x12, [x19, #120]
   0x0000fffff7f852d4:	b900726d	str	w13, [x19, #112]
   0x0000fffff7f852d8:	1400000e	b	0xfffff7f85310
   0x0000fffff7f852dc:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f852e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f852e4:	aa1303e1	mov	x1, x19
   0x0000fffff7f852e8:	aa1503e2	mov	x2, x21
   0x0000fffff7f852ec:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f852f0:	aa1403e4	mov	x4, x20
   0x0000fffff7f852f4:	aa1603e5	mov	x5, x22
   0x0000fffff7f852f8:	d28e2010	mov	x16, #0x7100                	// #28928
   0x0000fffff7f852fc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85300:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85304:	d63f0200	blr	x16
   0x0000fffff7f85308:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8530c:	54001fc0	b.eq	0xfffff7f85704  // b.none
   0x0000fffff7f85310:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85314:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85318:	aa1303e1	mov	x1, x19
   0x0000fffff7f8531c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85320:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f85324:	aa1403e4	mov	x4, x20
   0x0000fffff7f85328:	aa1603e5	mov	x5, x22
   0x0000fffff7f8532c:	d2980e10	mov	x16, #0xc070                	// #49264
   0x0000fffff7f85330:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85334:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85338:	d63f0200	blr	x16
   0x0000fffff7f8533c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85340:	54001f80	b.eq	0xfffff7f85730  // b.none
   0x0000fffff7f85344:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85348:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f8534c:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f85350:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85354:	54000501	b.ne	0xfffff7f853f4  // b.any
   0x0000fffff7f85358:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f8535c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85360:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85364:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85368:	54000461	b.ne	0xfffff7f853f4  // b.any
   0x0000fffff7f8536c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f85370:	f940466b	ldr	x11, [x19, #136]
   0x0000fffff7f85374:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f85378:	eb09015f	cmp	x10, x9
   0x0000fffff7f8537c:	540003c2	b.cs	0xfffff7f853f4  // b.hs, b.nlast
   0x0000fffff7f85380:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f85384:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f85388:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8538c:	37d8034d	tbnz	w13, #27, 0xfffff7f853f4
   0x0000fffff7f85390:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85394:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f85398:	36d8020e	tbz	w14, #27, 0xfffff7f853d8
   0x0000fffff7f8539c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f853a0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f853a4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f853a8:	54000261	b.ne	0xfffff7f853f4  // b.any
   0x0000fffff7f853ac:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f853b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f853b4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f853b8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f853bc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f853c0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f853c4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f853c8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f853cc:	54000149	b.ls	0xfffff7f853f4  // b.plast
   0x0000fffff7f853d0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f853d4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f853d8:	b940826e	ldr	w14, [x19, #128]
   0x0000fffff7f853dc:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7f853e0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f853e4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f853e8:	f900466c	str	x12, [x19, #136]
   0x0000fffff7f853ec:	b900826d	str	w13, [x19, #128]
   0x0000fffff7f853f0:	1400000e	b	0xfffff7f85428
   0x0000fffff7f853f4:	910243e6	add	x6, sp, #0x90
   0x0000fffff7f853f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f853fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f85400:	aa1503e2	mov	x2, x21
   0x0000fffff7f85404:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7f85408:	aa1403e4	mov	x4, x20
   0x0000fffff7f8540c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85410:	d28e2010	mov	x16, #0x7100                	// #28928
   0x0000fffff7f85414:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85418:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8541c:	d63f0200	blr	x16
   0x0000fffff7f85420:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85424:	540019c0	b.eq	0xfffff7f8575c  // b.none
   0x0000fffff7f85428:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f8542c:	37d806a9	tbnz	w9, #27, 0xfffff7f85500
   0x0000fffff7f85430:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f85434:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85438:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8543c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85440:	540001c1	b.ne	0xfffff7f85478  // b.any
   0x0000fffff7f85444:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85448:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8544c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85450:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85454:	54000121	b.ne	0xfffff7f85478  // b.any
   0x0000fffff7f85458:	f9403e69	ldr	x9, [x19, #120]
   0x0000fffff7f8545c:	f940466a	ldr	x10, [x19, #136]
   0x0000fffff7f85460:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85464:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85468:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8546c:	f9003e69	str	x9, [x19, #120]
   0x0000fffff7f85470:	b900726a	str	w10, [x19, #112]
   0x0000fffff7f85474:	14000030	b	0xfffff7f85534
   0x0000fffff7f85478:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f8547c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85480:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85484:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85488:	54000120	b.eq	0xfffff7f854ac  // b.none
   0x0000fffff7f8548c:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f85490:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85494:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85498:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8549c:	54000321	b.ne	0xfffff7f85500  // b.any
   0x0000fffff7f854a0:	f9403e69	ldr	x9, [x19, #120]
   0x0000fffff7f854a4:	9e620120	scvtf	d0, x9
   0x0000fffff7f854a8:	14000002	b	0xfffff7f854b0
   0x0000fffff7f854ac:	fd403e60	ldr	d0, [x19, #120]
   0x0000fffff7f854b0:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f854b4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f854b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f854bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f854c0:	54000120	b.eq	0xfffff7f854e4  // b.none
   0x0000fffff7f854c4:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f854c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f854cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f854d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f854d4:	54000161	b.ne	0xfffff7f85500  // b.any
   0x0000fffff7f854d8:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f854dc:	9e620121	scvtf	d1, x9
   0x0000fffff7f854e0:	14000002	b	0xfffff7f854e8
   0x0000fffff7f854e4:	fd404661	ldr	d1, [x19, #136]
   0x0000fffff7f854e8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f854ec:	fd003e60	str	d0, [x19, #120]
   0x0000fffff7f854f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f854f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f854f8:	b900726a	str	w10, [x19, #112]
   0x0000fffff7f854fc:	17ffffde	b	0xfffff7f85474
   0x0000fffff7f85500:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85504:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85508:	aa1303e1	mov	x1, x19
   0x0000fffff7f8550c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85510:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7f85514:	aa1403e4	mov	x4, x20
   0x0000fffff7f85518:	aa1603e5	mov	x5, x22
   0x0000fffff7f8551c:	d293fa90	mov	x16, #0x9fd4                	// #40916
   0x0000fffff7f85520:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85524:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85528:	d63f0200	blr	x16
   0x0000fffff7f8552c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85530:	540012c0	b.eq	0xfffff7f85788  // b.none
   0x0000fffff7f85534:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85538:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8553c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85540:	aa1503e2	mov	x2, x21
   0x0000fffff7f85544:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7f85548:	aa1403e4	mov	x4, x20
   0x0000fffff7f8554c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85550:	d288c090	mov	x16, #0x4604                	// #17924
   0x0000fffff7f85554:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85558:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8555c:	d63f0200	blr	x16
   0x0000fffff7f85560:	9102c3ff	add	sp, sp, #0xb0
   0x0000fffff7f85564:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85568:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f8556c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85570:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f85574:	d65f03c0	ret
   0x0000fffff7f85578:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f8557c:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85580:	b9000289	str	w9, [x20]
   0x0000fffff7f85584:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f85588:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f8558c:	9102c3ff	add	sp, sp, #0xb0
   0x0000fffff7f85590:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85594:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85598:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f8559c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f855a0:	d65f03c0	ret
   0x0000fffff7f855a4:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f855a8:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f855ac:	b9000289	str	w9, [x20]
   0x0000fffff7f855b0:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f855b4:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f855b8:	9102c3ff	add	sp, sp, #0xb0
   0x0000fffff7f855bc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f855c0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f855c4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f855c8:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f855cc:	d65f03c0	ret
   0x0000fffff7f855d0:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f855d4:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f855d8:	b9000289	str	w9, [x20]
   0x0000fffff7f855dc:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f855e0:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f855e4:	9102c3ff	add	sp, sp, #0xb0
   0x0000fffff7f855e8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f855ec:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f855f0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f855f4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f855f8:	d65f03c0	ret
   0x0000fffff7f855fc:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85600:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85604:	b9000289	str	w9, [x20]
   0x0000fffff7f85608:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f8560c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85610:	9102c3ff	add	sp, sp, #0xb0
   0x0000fffff7f85614:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85618:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f8561c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85620:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85624:	d65f03c0	ret
   0x0000fffff7f85628:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f8562c:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85630:	b9000289	str	w9, [x20]
   0x0000fffff7f85634:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f85638:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f8563c:	9102c3ff	add	sp, sp, #0xb0
   0x0000fffff7f85640:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85644:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85648:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f8564c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85650:	d65f03c0	ret
   0x0000fffff7f85654:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85658:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f8565c:	b9000289	str	w9, [x20]
   0x0000fffff7f85660:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f85664:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85668:	9102c3ff	add	sp, sp, #0xb0
   0x0000fffff7f8566c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85670:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85674:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85678:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f8567c:	d65f03c0	ret
   0x0000fffff7f85680:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85684:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85688:	b9000289	str	w9, [x20]
   0x0000fffff7f8568c:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f85690:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85694:	9102c3ff	add	sp, sp, #0xb0
   0x0000fffff7f85698:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f8569c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f856a0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f856a4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f856a8:	d65f03c0	ret
   0x0000fffff7f856ac:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f856b0:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f856b4:	b9000289	str	w9, [x20]
   0x0000fffff7f856b8:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f856bc:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f856c0:	9102c3ff	add	sp, sp, #0xb0
   0x0000fffff7f856c4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f856c8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f856cc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f856d0:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f856d4:	d65f03c0	ret
   0x0000fffff7f856d8:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f856dc:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f856e0:	b9000289	str	w9, [x20]
   0x0000fffff7f856e4:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f856e8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f856ec:	9102c3ff	add	sp, sp, #0xb0
   0x0000fffff7f856f0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f856f4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f856f8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f856fc:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85700:	d65f03c0	ret
   0x0000fffff7f85704:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85708:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f8570c:	b9000289	str	w9, [x20]
   0x0000fffff7f85710:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f85714:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85718:	9102c3ff	add	sp, sp, #0xb0
   0x0000fffff7f8571c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85720:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85724:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85728:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f8572c:	d65f03c0	ret
   0x0000fffff7f85730:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85734:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85738:	b9000289	str	w9, [x20]
   0x0000fffff7f8573c:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7f85740:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85744:	9102c3ff	add	sp, sp, #0xb0
   0x0000fffff7f85748:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f8574c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85750:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85754:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85758:	d65f03c0	ret
   0x0000fffff7f8575c:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85760:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85764:	b9000289	str	w9, [x20]
   0x0000fffff7f85768:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7f8576c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85770:	9102c3ff	add	sp, sp, #0xb0
   0x0000fffff7f85774:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85778:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f8577c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85780:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85784:	d65f03c0	ret
   0x0000fffff7f85788:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f8578c:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85790:	b9000289	str	w9, [x20]
   0x0000fffff7f85794:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7f85798:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f8579c:	9102c3ff	add	sp, sp, #0xb0
   0x0000fffff7f857a0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f857a4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f857a8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f857ac:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f857b0:	d65f03c0	ret
   0x0000fffff7f857b4:	00000000	udf	#0
   0x0000fffff7f857b8:	00000000	udf	#0
   0x0000fffff7f857bc:	00000000	udf	#0
   0x0000fffff7f857c0:	00000000	udf	#0
   0x0000fffff7f857c4:	00000000	udf	#0
   0x0000fffff7f857c8:	00000000	udf	#0
   0x0000fffff7f857cc:	00000000	udf	#0
   0x0000fffff7f857d0:	00000000	udf	#0
   0x0000fffff7f857d4:	00000000	udf	#0
   0x0000fffff7f857d8:	00000000	udf	#0
   0x0000fffff7f857dc:	00000000	udf	#0
   0x0000fffff7f857e0:	00000000	udf	#0
   0x0000fffff7f857e4:	00000000	udf	#0
   0x0000fffff7f857e8:	00000000	udf	#0
   0x0000fffff7f857ec:	00000000	udf	#0
   0x0000fffff7f857f0:	00000000	udf	#0
   0x0000fffff7f857f4:	00000000	udf	#0
   0x0000fffff7f857f8:	00000000	udf	#0
   0x0000fffff7f857fc:	00000000	udf	#0
   0x0000fffff7f85800:	00000000	udf	#0
   0x0000fffff7f85804:	00000000	udf	#0
   0x0000fffff7f85808:	00000000	udf	#0
   0x0000fffff7f8580c:	00000000	udf	#0
   0x0000fffff7f85810:	00000000	udf	#0
   0x0000fffff7f85814:	00000000	udf	#0
   0x0000fffff7f85818:	00000000	udf	#0
   0x0000fffff7f8581c:	00000000	udf	#0
   0x0000fffff7f85820:	00000000	udf	#0
   0x0000fffff7f85824:	00000000	udf	#0
   0x0000fffff7f85828:	00000000	udf	#0
   0x0000fffff7f8582c:	00000000	udf	#0
   0x0000fffff7f85830:	00000000	udf	#0
   0x0000fffff7f85834:	00000000	udf	#0
   0x0000fffff7f85838:	00000000	udf	#0
   0x0000fffff7f8583c:	00000000	udf	#0
   0x0000fffff7f85840:	00000000	udf	#0
   0x0000fffff7f85844:	00000000	udf	#0
   0x0000fffff7f85848:	00000000	udf	#0
   0x0000fffff7f8584c:	00000000	udf	#0
   0x0000fffff7f85850:	00000000	udf	#0
   0x0000fffff7f85854:	00000000	udf	#0
   0x0000fffff7f85858:	00000000	udf	#0
   0x0000fffff7f8585c:	00000000	udf	#0
   0x0000fffff7f85860:	00000000	udf	#0
   0x0000fffff7f85864:	00000000	udf	#0
   0x0000fffff7f85868:	00000000	udf	#0
   0x0000fffff7f8586c:	00000000	udf	#0
   0x0000fffff7f85870:	00000000	udf	#0
   0x0000fffff7f85874:	00000000	udf	#0
   0x0000fffff7f85878:	00000000	udf	#0
   0x0000fffff7f8587c:	00000000	udf	#0
   0x0000fffff7f85880:	00000000	udf	#0
   0x0000fffff7f85884:	00000000	udf	#0
   0x0000fffff7f85888:	00000000	udf	#0
   0x0000fffff7f8588c:	00000000	udf	#0
   0x0000fffff7f85890:	00000000	udf	#0
   0x0000fffff7f85894:	00000000	udf	#0
   0x0000fffff7f85898:	00000000	udf	#0
   0x0000fffff7f8589c:	00000000	udf	#0
   0x0000fffff7f858a0:	00000000	udf	#0
   0x0000fffff7f858a4:	00000000	udf	#0
   0x0000fffff7f858a8:	00000000	udf	#0
   0x0000fffff7f858ac:	00000000	udf	#0
   0x0000fffff7f858b0:	00000000	udf	#0
   0x0000fffff7f858b4:	00000000	udf	#0
   0x0000fffff7f858b8:	00000000	udf	#0
   0x0000fffff7f858bc:	00000000	udf	#0
   0x0000fffff7f858c0:	00000000	udf	#0
   0x0000fffff7f858c4:	00000000	udf	#0
   0x0000fffff7f858c8:	00000000	udf	#0
   0x0000fffff7f858cc:	00000000	udf	#0
   0x0000fffff7f858d0:	00000000	udf	#0
   0x0000fffff7f858d4:	00000000	udf	#0
   0x0000fffff7f858d8:	00000000	udf	#0
   0x0000fffff7f858dc:	00000000	udf	#0
   0x0000fffff7f858e0:	00000000	udf	#0
   0x0000fffff7f858e4:	00000000	udf	#0
   0x0000fffff7f858e8:	00000000	udf	#0
   0x0000fffff7f858ec:	00000000	udf	#0
   0x0000fffff7f858f0:	00000000	udf	#0
   0x0000fffff7f858f4:	00000000	udf	#0
   0x0000fffff7f858f8:	00000000	udf	#0
   0x0000fffff7f858fc:	00000000	udf	#0
   0x0000fffff7f85900:	00000000	udf	#0
   0x0000fffff7f85904:	00000000	udf	#0
   0x0000fffff7f85908:	00000000	udf	#0
   0x0000fffff7f8590c:	00000000	udf	#0
   0x0000fffff7f85910:	00000000	udf	#0
   0x0000fffff7f85914:	00000000	udf	#0
   0x0000fffff7f85918:	00000000	udf	#0
   0x0000fffff7f8591c:	00000000	udf	#0
   0x0000fffff7f85920:	00000000	udf	#0
   0x0000fffff7f85924:	00000000	udf	#0
   0x0000fffff7f85928:	00000000	udf	#0
   0x0000fffff7f8592c:	00000000	udf	#0
   0x0000fffff7f85930:	00000000	udf	#0
   0x0000fffff7f85934:	00000000	udf	#0
   0x0000fffff7f85938:	00000000	udf	#0
   0x0000fffff7f8593c:	00000000	udf	#0
   0x0000fffff7f85940:	00000000	udf	#0
   0x0000fffff7f85944:	00000000	udf	#0
   0x0000fffff7f85948:	00000000	udf	#0
   0x0000fffff7f8594c:	00000000	udf	#0
   0x0000fffff7f85950:	00000000	udf	#0
   0x0000fffff7f85954:	00000000	udf	#0
   0x0000fffff7f85958:	00000000	udf	#0
   0x0000fffff7f8595c:	00000000	udf	#0
   0x0000fffff7f85960:	00000000	udf	#0
   0x0000fffff7f85964:	00000000	udf	#0
   0x0000fffff7f85968:	00000000	udf	#0
   0x0000fffff7f8596c:	00000000	udf	#0
   0x0000fffff7f85970:	00000000	udf	#0
   0x0000fffff7f85974:	00000000	udf	#0
   0x0000fffff7f85978:	00000000	udf	#0
   0x0000fffff7f8597c:	00000000	udf	#0
   0x0000fffff7f85980:	00000000	udf	#0
   0x0000fffff7f85984:	00000000	udf	#0
   0x0000fffff7f85988:	00000000	udf	#0
   0x0000fffff7f8598c:	00000000	udf	#0
   0x0000fffff7f85990:	00000000	udf	#0
   0x0000fffff7f85994:	00000000	udf	#0
   0x0000fffff7f85998:	00000000	udf	#0
   0x0000fffff7f8599c:	00000000	udf	#0
   0x0000fffff7f859a0:	00000000	udf	#0
   0x0000fffff7f859a4:	00000000	udf	#0
   0x0000fffff7f859a8:	00000000	udf	#0
   0x0000fffff7f859ac:	00000000	udf	#0
   0x0000fffff7f859b0:	00000000	udf	#0
   0x0000fffff7f859b4:	00000000	udf	#0
   0x0000fffff7f859b8:	00000000	udf	#0
   0x0000fffff7f859bc:	00000000	udf	#0
   0x0000fffff7f859c0:	00000000	udf	#0
   0x0000fffff7f859c4:	00000000	udf	#0
   0x0000fffff7f859c8:	00000000	udf	#0
   0x0000fffff7f859cc:	00000000	udf	#0
   0x0000fffff7f859d0:	00000000	udf	#0
   0x0000fffff7f859d4:	00000000	udf	#0
   0x0000fffff7f859d8:	00000000	udf	#0
   0x0000fffff7f859dc:	00000000	udf	#0
   0x0000fffff7f859e0:	00000000	udf	#0
   0x0000fffff7f859e4:	00000000	udf	#0
   0x0000fffff7f859e8:	00000000	udf	#0
   0x0000fffff7f859ec:	00000000	udf	#0
   0x0000fffff7f859f0:	00000000	udf	#0
   0x0000fffff7f859f4:	00000000	udf	#0
   0x0000fffff7f859f8:	00000000	udf	#0
   0x0000fffff7f859fc:	00000000	udf	#0
   0x0000fffff7f85a00:	00000000	udf	#0
   0x0000fffff7f85a04:	00000000	udf	#0
   0x0000fffff7f85a08:	00000000	udf	#0
   0x0000fffff7f85a0c:	00000000	udf	#0
   0x0000fffff7f85a10:	00000000	udf	#0
   0x0000fffff7f85a14:	00000000	udf	#0
   0x0000fffff7f85a18:	00000000	udf	#0
   0x0000fffff7f85a1c:	00000000	udf	#0
   0x0000fffff7f85a20:	00000000	udf	#0
   0x0000fffff7f85a24:	00000000	udf	#0
   0x0000fffff7f85a28:	00000000	udf	#0
   0x0000fffff7f85a2c:	00000000	udf	#0
   0x0000fffff7f85a30:	00000000	udf	#0
   0x0000fffff7f85a34:	00000000	udf	#0
   0x0000fffff7f85a38:	00000000	udf	#0
   0x0000fffff7f85a3c:	00000000	udf	#0
   0x0000fffff7f85a40:	00000000	udf	#0
   0x0000fffff7f85a44:	00000000	udf	#0
   0x0000fffff7f85a48:	00000000	udf	#0
   0x0000fffff7f85a4c:	00000000	udf	#0
   0x0000fffff7f85a50:	00000000	udf	#0
   0x0000fffff7f85a54:	00000000	udf	#0
   0x0000fffff7f85a58:	00000000	udf	#0
   0x0000fffff7f85a5c:	00000000	udf	#0
   0x0000fffff7f85a60:	00000000	udf	#0
   0x0000fffff7f85a64:	00000000	udf	#0
   0x0000fffff7f85a68:	00000000	udf	#0
   0x0000fffff7f85a6c:	00000000	udf	#0
   0x0000fffff7f85a70:	00000000	udf	#0
   0x0000fffff7f85a74:	00000000	udf	#0
   0x0000fffff7f85a78:	00000000	udf	#0
   0x0000fffff7f85a7c:	00000000	udf	#0
   0x0000fffff7f85a80:	00000000	udf	#0
   0x0000fffff7f85a84:	00000000	udf	#0
   0x0000fffff7f85a88:	00000000	udf	#0
   0x0000fffff7f85a8c:	00000000	udf	#0
   0x0000fffff7f85a90:	00000000	udf	#0
   0x0000fffff7f85a94:	00000000	udf	#0
   0x0000fffff7f85a98:	00000000	udf	#0
   0x0000fffff7f85a9c:	00000000	udf	#0
   0x0000fffff7f85aa0:	00000000	udf	#0
   0x0000fffff7f85aa4:	00000000	udf	#0
   0x0000fffff7f85aa8:	00000000	udf	#0
   0x0000fffff7f85aac:	00000000	udf	#0
   0x0000fffff7f85ab0:	00000000	udf	#0
   0x0000fffff7f85ab4:	00000000	udf	#0
   0x0000fffff7f85ab8:	00000000	udf	#0
   0x0000fffff7f85abc:	00000000	udf	#0
   0x0000fffff7f85ac0:	00000000	udf	#0
   0x0000fffff7f85ac4:	00000000	udf	#0
   0x0000fffff7f85ac8:	00000000	udf	#0
   0x0000fffff7f85acc:	00000000	udf	#0
   0x0000fffff7f85ad0:	00000000	udf	#0
   0x0000fffff7f85ad4:	00000000	udf	#0
   0x0000fffff7f85ad8:	00000000	udf	#0
   0x0000fffff7f85adc:	00000000	udf	#0
   0x0000fffff7f85ae0:	00000000	udf	#0
   0x0000fffff7f85ae4:	00000000	udf	#0
   0x0000fffff7f85ae8:	00000000	udf	#0
   0x0000fffff7f85aec:	00000000	udf	#0
   0x0000fffff7f85af0:	00000000	udf	#0
   0x0000fffff7f85af4:	00000000	udf	#0
   0x0000fffff7f85af8:	00000000	udf	#0
   0x0000fffff7f85afc:	00000000	udf	#0
   0x0000fffff7f85b00:	00000000	udf	#0
   0x0000fffff7f85b04:	00000000	udf	#0
   0x0000fffff7f85b08:	00000000	udf	#0
   0x0000fffff7f85b0c:	00000000	udf	#0
   0x0000fffff7f85b10:	00000000	udf	#0
   0x0000fffff7f85b14:	00000000	udf	#0
   0x0000fffff7f85b18:	00000000	udf	#0
   0x0000fffff7f85b1c:	00000000	udf	#0
   0x0000fffff7f85b20:	00000000	udf	#0
   0x0000fffff7f85b24:	00000000	udf	#0
   0x0000fffff7f85b28:	00000000	udf	#0
   0x0000fffff7f85b2c:	00000000	udf	#0
   0x0000fffff7f85b30:	00000000	udf	#0
   0x0000fffff7f85b34:	00000000	udf	#0
   0x0000fffff7f85b38:	00000000	udf	#0
   0x0000fffff7f85b3c:	00000000	udf	#0
   0x0000fffff7f85b40:	00000000	udf	#0
   0x0000fffff7f85b44:	00000000	udf	#0
   0x0000fffff7f85b48:	00000000	udf	#0
   0x0000fffff7f85b4c:	00000000	udf	#0
   0x0000fffff7f85b50:	00000000	udf	#0
   0x0000fffff7f85b54:	00000000	udf	#0
   0x0000fffff7f85b58:	00000000	udf	#0
   0x0000fffff7f85b5c:	00000000	udf	#0
   0x0000fffff7f85b60:	00000000	udf	#0
   0x0000fffff7f85b64:	00000000	udf	#0
   0x0000fffff7f85b68:	00000000	udf	#0
   0x0000fffff7f85b6c:	00000000	udf	#0
   0x0000fffff7f85b70:	00000000	udf	#0
   0x0000fffff7f85b74:	00000000	udf	#0
   0x0000fffff7f85b78:	00000000	udf	#0
   0x0000fffff7f85b7c:	00000000	udf	#0
   0x0000fffff7f85b80:	00000000	udf	#0
   0x0000fffff7f85b84:	00000000	udf	#0
   0x0000fffff7f85b88:	00000000	udf	#0
   0x0000fffff7f85b8c:	00000000	udf	#0
   0x0000fffff7f85b90:	00000000	udf	#0
   0x0000fffff7f85b94:	00000000	udf	#0
   0x0000fffff7f85b98:	00000000	udf	#0
   0x0000fffff7f85b9c:	00000000	udf	#0
   0x0000fffff7f85ba0:	00000000	udf	#0
   0x0000fffff7f85ba4:	00000000	udf	#0
   0x0000fffff7f85ba8:	00000000	udf	#0
   0x0000fffff7f85bac:	00000000	udf	#0
   0x0000fffff7f85bb0:	00000000	udf	#0
   0x0000fffff7f85bb4:	00000000	udf	#0
   0x0000fffff7f85bb8:	00000000	udf	#0
   0x0000fffff7f85bbc:	00000000	udf	#0
   0x0000fffff7f85bc0:	00000000	udf	#0
   0x0000fffff7f85bc4:	00000000	udf	#0
   0x0000fffff7f85bc8:	00000000	udf	#0
   0x0000fffff7f85bcc:	00000000	udf	#0
   0x0000fffff7f85bd0:	00000000	udf	#0
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
