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
   0x0000fffff7f85038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7f8503c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f85040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85044:	d63f0200	blr	x16
   0x0000fffff7f85048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7f8504c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7f85050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7f85054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7f85058:	b940126d	ldr	w13, [x19, #16]
   0x0000fffff7f8505c:	f9400e6c	ldr	x12, [x19, #24]
   0x0000fffff7f85060:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7f85064:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7f85068:	eb0a01bf	cmp	x13, x10
   0x0000fffff7f8506c:	54000100	b.eq	0xfffff7f8508c  // b.none
   0x0000fffff7f85070:	5290000a	mov	w10, #0x8000                	// #32768
   0x0000fffff7f85074:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7f85078:	eb0a01bf	cmp	x13, x10
   0x0000fffff7f8507c:	54000b41	b.ne	0xfffff7f851e4  // b.any
   0x0000fffff7f85080:	f9401d8b	ldr	x11, [x12, #56]
   0x0000fffff7f85084:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f85088:	14000002	b	0xfffff7f85090
   0x0000fffff7f8508c:	aa0c03eb	mov	x11, x12
   0x0000fffff7f85090:	f9402569	ldr	x9, [x11, #72]
   0x0000fffff7f85094:	d1000529	sub	x9, x9, #0x1
   0x0000fffff7f85098:	d292fc2a	mov	x10, #0x97e1                	// #38881
   0x0000fffff7f8509c:	f2bf84ea	movk	x10, #0xfc27, lsl #16
   0x0000fffff7f850a0:	f2c00b2a	movk	x10, #0x59, lsl #32
   0x0000fffff7f850a4:	8a09014a	and	x10, x10, x9
   0x0000fffff7f850a8:	f940216b	ldr	x11, [x11, #64]
   0x0000fffff7f850ac:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7f850b0:	9b097d4a	mul	x10, x10, x9
   0x0000fffff7f850b4:	8b0a016b	add	x11, x11, x10
   0x0000fffff7f850b8:	b9401169	ldr	w9, [x11, #16]
   0x0000fffff7f850bc:	5280020a	mov	w10, #0x10                  	// #16
   0x0000fffff7f850c0:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f850c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f850c8:	540008e1	b.ne	0xfffff7f851e4  // b.any
   0x0000fffff7f850cc:	f9400d69	ldr	x9, [x11, #24]
   0x0000fffff7f850d0:	d29a880a	mov	x10, #0xd440                	// #54336
   0x0000fffff7f850d4:	f2b5580a	movk	x10, #0xaac0, lsl #16
   0x0000fffff7f850d8:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7f850dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f850e0:	54000821	b.ne	0xfffff7f851e4  // b.any
   0x0000fffff7f850e4:	9100016b	add	x11, x11, #0x0
   0x0000fffff7f850e8:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7f850ec:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7f850f0:	eb0a01bf	cmp	x13, x10
   0x0000fffff7f850f4:	540002a0	b.eq	0xfffff7f85148  // b.none
   0x0000fffff7f850f8:	b9400169	ldr	w9, [x11]
   0x0000fffff7f850fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85100:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85104:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85108:	540006e1	b.ne	0xfffff7f851e4  // b.any
   0x0000fffff7f8510c:	f9400569	ldr	x9, [x11, #8]
   0x0000fffff7f85110:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7f85114:	f2a0400a	movk	x10, #0x200, lsl #16
   0x0000fffff7f85118:	8a0a012a	and	x10, x9, x10
   0x0000fffff7f8511c:	f100015f	cmp	x10, #0x0
   0x0000fffff7f85120:	54000620	b.eq	0xfffff7f851e4  // b.none
   0x0000fffff7f85124:	d29fffea	mov	x10, #0xffff                	// #65535
   0x0000fffff7f85128:	f2a01fea	movk	x10, #0xff, lsl #16
   0x0000fffff7f8512c:	8a0a0129	and	x9, x9, x10
   0x0000fffff7f85130:	f9401d8a	ldr	x10, [x12, #56]
   0x0000fffff7f85134:	f940254a	ldr	x10, [x10, #72]
   0x0000fffff7f85138:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8513c:	54000542	b.cs	0xfffff7f851e4  // b.hs, b.nlast
   0x0000fffff7f85140:	9101618b	add	x11, x12, #0x58
   0x0000fffff7f85144:	8b09116b	add	x11, x11, x9, lsl #4
   0x0000fffff7f85148:	b90013ed	str	w13, [sp, #16]
   0x0000fffff7f8514c:	f9000fec	str	x12, [sp, #24]
   0x0000fffff7f85150:	f90017eb	str	x11, [sp, #40]
   0x0000fffff7f85154:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85158:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8515c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85160:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85164:	54000400	b.eq	0xfffff7f851e4  // b.none
   0x0000fffff7f85168:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8516c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85170:	36d801d1	tbz	w17, #27, 0xfffff7f851a8
   0x0000fffff7f85174:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85178:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8517c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85180:	54000321	b.ne	0xfffff7f851e4  // b.any
   0x0000fffff7f85184:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85188:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8518c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85190:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85194:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85198:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8519c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f851a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f851a4:	54000209	b.ls	0xfffff7f851e4  // b.plast
   0x0000fffff7f851a8:	36d8008d	tbz	w13, #27, 0xfffff7f851b8
   0x0000fffff7f851ac:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f851b0:	91000529	add	x9, x9, #0x1
   0x0000fffff7f851b4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f851b8:	36d80091	tbz	w17, #27, 0xfffff7f851c8
   0x0000fffff7f851bc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f851c0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f851c4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f851c8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f851cc:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f851d0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f851d4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f851d8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f851dc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f851e0:	1400000e	b	0xfffff7f85218
   0x0000fffff7f851e4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f851e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f851ec:	aa1303e1	mov	x1, x19
   0x0000fffff7f851f0:	aa1503e2	mov	x2, x21
   0x0000fffff7f851f4:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7f851f8:	aa1403e4	mov	x4, x20
   0x0000fffff7f851fc:	aa1603e5	mov	x5, x22
   0x0000fffff7f85200:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f85204:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85208:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8520c:	d63f0200	blr	x16
   0x0000fffff7f85210:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85214:	54005bc0	b.eq	0xfffff7f85d8c  // b.none
   0x0000fffff7f85218:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8521c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85220:	aa1303e1	mov	x1, x19
   0x0000fffff7f85224:	aa1503e2	mov	x2, x21
   0x0000fffff7f85228:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7f8522c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85230:	aa1603e5	mov	x5, x22
   0x0000fffff7f85234:	d286a610	mov	x16, #0x3530                	// #13616
   0x0000fffff7f85238:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8523c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85240:	d63f0200	blr	x16
   0x0000fffff7f85244:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85248:	54005a60	b.eq	0xfffff7f85d94  // b.none
   0x0000fffff7f8524c:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7f85250:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7f85254:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7f85258:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7f8525c:	eb0a01bf	cmp	x13, x10
   0x0000fffff7f85260:	54000100	b.eq	0xfffff7f85280  // b.none
   0x0000fffff7f85264:	5290000a	mov	w10, #0x8000                	// #32768
   0x0000fffff7f85268:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7f8526c:	eb0a01bf	cmp	x13, x10
   0x0000fffff7f85270:	54000b41	b.ne	0xfffff7f853d8  // b.any
   0x0000fffff7f85274:	f9401d8b	ldr	x11, [x12, #56]
   0x0000fffff7f85278:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f8527c:	14000002	b	0xfffff7f85284
   0x0000fffff7f85280:	aa0c03eb	mov	x11, x12
   0x0000fffff7f85284:	f9402569	ldr	x9, [x11, #72]
   0x0000fffff7f85288:	d1000529	sub	x9, x9, #0x1
   0x0000fffff7f8528c:	d292fc2a	mov	x10, #0x97e1                	// #38881
   0x0000fffff7f85290:	f2bf84ea	movk	x10, #0xfc27, lsl #16
   0x0000fffff7f85294:	f2c00b2a	movk	x10, #0x59, lsl #32
   0x0000fffff7f85298:	8a09014a	and	x10, x10, x9
   0x0000fffff7f8529c:	f940216b	ldr	x11, [x11, #64]
   0x0000fffff7f852a0:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7f852a4:	9b097d4a	mul	x10, x10, x9
   0x0000fffff7f852a8:	8b0a016b	add	x11, x11, x10
   0x0000fffff7f852ac:	b9401169	ldr	w9, [x11, #16]
   0x0000fffff7f852b0:	5280020a	mov	w10, #0x10                  	// #16
   0x0000fffff7f852b4:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f852b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f852bc:	540008e1	b.ne	0xfffff7f853d8  // b.any
   0x0000fffff7f852c0:	f9400d69	ldr	x9, [x11, #24]
   0x0000fffff7f852c4:	d29a880a	mov	x10, #0xd440                	// #54336
   0x0000fffff7f852c8:	f2b5580a	movk	x10, #0xaac0, lsl #16
   0x0000fffff7f852cc:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7f852d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f852d4:	54000821	b.ne	0xfffff7f853d8  // b.any
   0x0000fffff7f852d8:	9100016b	add	x11, x11, #0x0
   0x0000fffff7f852dc:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7f852e0:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7f852e4:	eb0a01bf	cmp	x13, x10
   0x0000fffff7f852e8:	540002a0	b.eq	0xfffff7f8533c  // b.none
   0x0000fffff7f852ec:	b9400169	ldr	w9, [x11]
   0x0000fffff7f852f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f852f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f852f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f852fc:	540006e1	b.ne	0xfffff7f853d8  // b.any
   0x0000fffff7f85300:	f9400569	ldr	x9, [x11, #8]
   0x0000fffff7f85304:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7f85308:	f2a0400a	movk	x10, #0x200, lsl #16
   0x0000fffff7f8530c:	8a0a012a	and	x10, x9, x10
   0x0000fffff7f85310:	f100015f	cmp	x10, #0x0
   0x0000fffff7f85314:	54000620	b.eq	0xfffff7f853d8  // b.none
   0x0000fffff7f85318:	d29fffea	mov	x10, #0xffff                	// #65535
   0x0000fffff7f8531c:	f2a01fea	movk	x10, #0xff, lsl #16
   0x0000fffff7f85320:	8a0a0129	and	x9, x9, x10
   0x0000fffff7f85324:	f9401d8a	ldr	x10, [x12, #56]
   0x0000fffff7f85328:	f940254a	ldr	x10, [x10, #72]
   0x0000fffff7f8532c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85330:	54000542	b.cs	0xfffff7f853d8  // b.hs, b.nlast
   0x0000fffff7f85334:	9101618b	add	x11, x12, #0x58
   0x0000fffff7f85338:	8b09116b	add	x11, x11, x9, lsl #4
   0x0000fffff7f8533c:	b90033ed	str	w13, [sp, #48]
   0x0000fffff7f85340:	f9001fec	str	x12, [sp, #56]
   0x0000fffff7f85344:	f90027eb	str	x11, [sp, #72]
   0x0000fffff7f85348:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8534c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85350:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85354:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85358:	54000400	b.eq	0xfffff7f853d8  // b.none
   0x0000fffff7f8535c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85360:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85364:	36d801d1	tbz	w17, #27, 0xfffff7f8539c
   0x0000fffff7f85368:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8536c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85370:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85374:	54000321	b.ne	0xfffff7f853d8  // b.any
   0x0000fffff7f85378:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8537c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85380:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85384:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85388:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8538c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85390:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85394:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85398:	54000209	b.ls	0xfffff7f853d8  // b.plast
   0x0000fffff7f8539c:	36d8008d	tbz	w13, #27, 0xfffff7f853ac
   0x0000fffff7f853a0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f853a4:	91000529	add	x9, x9, #0x1
   0x0000fffff7f853a8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f853ac:	36d80091	tbz	w17, #27, 0xfffff7f853bc
   0x0000fffff7f853b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f853b4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f853b8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f853bc:	b940826e	ldr	w14, [x19, #128]
   0x0000fffff7f853c0:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7f853c4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f853c8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f853cc:	f900466c	str	x12, [x19, #136]
   0x0000fffff7f853d0:	b900826d	str	w13, [x19, #128]
   0x0000fffff7f853d4:	1400000e	b	0xfffff7f8540c
   0x0000fffff7f853d8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f853dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f853e0:	aa1303e1	mov	x1, x19
   0x0000fffff7f853e4:	aa1503e2	mov	x2, x21
   0x0000fffff7f853e8:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f853ec:	aa1403e4	mov	x4, x20
   0x0000fffff7f853f0:	aa1603e5	mov	x5, x22
   0x0000fffff7f853f4:	d2923c10	mov	x16, #0x91e0                	// #37344
   0x0000fffff7f853f8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f853fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85400:	d63f0200	blr	x16
   0x0000fffff7f85404:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85408:	54004ca0	b.eq	0xfffff7f85d9c  // b.none
   0x0000fffff7f8540c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f85410:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85414:	540003a0	b.eq	0xfffff7f85488  // b.none
   0x0000fffff7f85418:	b940826d	ldr	w13, [x19, #128]
   0x0000fffff7f8541c:	f940466c	ldr	x12, [x19, #136]
   0x0000fffff7f85420:	b9400171	ldr	w17, [x11]
   0x0000fffff7f85424:	36d801d1	tbz	w17, #27, 0xfffff7f8545c
   0x0000fffff7f85428:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8542c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85430:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85434:	540002a1	b.ne	0xfffff7f85488  // b.any
   0x0000fffff7f85438:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f8543c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85440:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85444:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85448:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8544c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85450:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85454:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85458:	54000189	b.ls	0xfffff7f85488  // b.plast
   0x0000fffff7f8545c:	36d8008d	tbz	w13, #27, 0xfffff7f8546c
   0x0000fffff7f85460:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85464:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85468:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8546c:	36d80091	tbz	w17, #27, 0xfffff7f8547c
   0x0000fffff7f85470:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85474:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85478:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8547c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f85480:	b900016d	str	w13, [x11]
   0x0000fffff7f85484:	1400000e	b	0xfffff7f854bc
   0x0000fffff7f85488:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f8548c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85490:	aa1303e1	mov	x1, x19
   0x0000fffff7f85494:	aa1503e2	mov	x2, x21
   0x0000fffff7f85498:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7f8549c:	aa1403e4	mov	x4, x20
   0x0000fffff7f854a0:	aa1603e5	mov	x5, x22
   0x0000fffff7f854a4:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7f854a8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f854ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f854b0:	d63f0200	blr	x16
   0x0000fffff7f854b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f854b8:	54004760	b.eq	0xfffff7f85da4  // b.none
   0x0000fffff7f854bc:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f854c0:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f854c4:	d29a880c	mov	x12, #0xd440                	// #54336
   0x0000fffff7f854c8:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f854cc:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f854d0:	b9407271	ldr	w17, [x19, #112]
   0x0000fffff7f854d4:	36d801d1	tbz	w17, #27, 0xfffff7f8550c
   0x0000fffff7f854d8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f854dc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f854e0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f854e4:	54000281	b.ne	0xfffff7f85534  // b.any
   0x0000fffff7f854e8:	f9403e6f	ldr	x15, [x19, #120]
   0x0000fffff7f854ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f854f0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f854f4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f854f8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f854fc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85500:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85504:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85508:	54000169	b.ls	0xfffff7f85534  // b.plast
   0x0000fffff7f8550c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85510:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85514:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85518:	36d80091	tbz	w17, #27, 0xfffff7f85528
   0x0000fffff7f8551c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85520:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85524:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85528:	f9003e6c	str	x12, [x19, #120]
   0x0000fffff7f8552c:	b900726d	str	w13, [x19, #112]
   0x0000fffff7f85530:	1400000e	b	0xfffff7f85568
   0x0000fffff7f85534:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85538:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8553c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85540:	aa1503e2	mov	x2, x21
   0x0000fffff7f85544:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7f85548:	aa1403e4	mov	x4, x20
   0x0000fffff7f8554c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85550:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7f85554:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85558:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8555c:	d63f0200	blr	x16
   0x0000fffff7f85560:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85564:	54004240	b.eq	0xfffff7f85dac  // b.none
   0x0000fffff7f85568:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8556c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85570:	540003a0	b.eq	0xfffff7f855e4  // b.none
   0x0000fffff7f85574:	b940626d	ldr	w13, [x19, #96]
   0x0000fffff7f85578:	f940366c	ldr	x12, [x19, #104]
   0x0000fffff7f8557c:	b9400171	ldr	w17, [x11]
   0x0000fffff7f85580:	36d801d1	tbz	w17, #27, 0xfffff7f855b8
   0x0000fffff7f85584:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85588:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8558c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85590:	540002a1	b.ne	0xfffff7f855e4  // b.any
   0x0000fffff7f85594:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f85598:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8559c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f855a0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f855a4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f855a8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f855ac:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f855b0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f855b4:	54000189	b.ls	0xfffff7f855e4  // b.plast
   0x0000fffff7f855b8:	36d8008d	tbz	w13, #27, 0xfffff7f855c8
   0x0000fffff7f855bc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f855c0:	91000529	add	x9, x9, #0x1
   0x0000fffff7f855c4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f855c8:	36d80091	tbz	w17, #27, 0xfffff7f855d8
   0x0000fffff7f855cc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f855d0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f855d4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f855d8:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f855dc:	b900016d	str	w13, [x11]
   0x0000fffff7f855e0:	1400000e	b	0xfffff7f85618
   0x0000fffff7f855e4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f855e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f855ec:	aa1303e1	mov	x1, x19
   0x0000fffff7f855f0:	aa1503e2	mov	x2, x21
   0x0000fffff7f855f4:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f855f8:	aa1403e4	mov	x4, x20
   0x0000fffff7f855fc:	aa1603e5	mov	x5, x22
   0x0000fffff7f85600:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7f85604:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85608:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8560c:	d63f0200	blr	x16
   0x0000fffff7f85610:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85614:	54003d00	b.eq	0xfffff7f85db4  // b.none
   0x0000fffff7f85618:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f8561c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f85620:	d29a940c	mov	x12, #0xd4a0                	// #54432
   0x0000fffff7f85624:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f85628:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f8562c:	b9407271	ldr	w17, [x19, #112]
   0x0000fffff7f85630:	36d801d1	tbz	w17, #27, 0xfffff7f85668
   0x0000fffff7f85634:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85638:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8563c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85640:	54000281	b.ne	0xfffff7f85690  // b.any
   0x0000fffff7f85644:	f9403e6f	ldr	x15, [x19, #120]
   0x0000fffff7f85648:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8564c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85650:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85654:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85658:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8565c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85660:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85664:	54000169	b.ls	0xfffff7f85690  // b.plast
   0x0000fffff7f85668:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8566c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85670:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85674:	36d80091	tbz	w17, #27, 0xfffff7f85684
   0x0000fffff7f85678:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8567c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85680:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85684:	f9003e6c	str	x12, [x19, #120]
   0x0000fffff7f85688:	b900726d	str	w13, [x19, #112]
   0x0000fffff7f8568c:	1400000e	b	0xfffff7f856c4
   0x0000fffff7f85690:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85694:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85698:	aa1303e1	mov	x1, x19
   0x0000fffff7f8569c:	aa1503e2	mov	x2, x21
   0x0000fffff7f856a0:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f856a4:	aa1403e4	mov	x4, x20
   0x0000fffff7f856a8:	aa1603e5	mov	x5, x22
   0x0000fffff7f856ac:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7f856b0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f856b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f856b8:	d63f0200	blr	x16
   0x0000fffff7f856bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f856c0:	540037e0	b.eq	0xfffff7f85dbc  // b.none
   0x0000fffff7f856c4:	b940126d	ldr	w13, [x19, #16]
   0x0000fffff7f856c8:	f9400e6c	ldr	x12, [x19, #24]
   0x0000fffff7f856cc:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7f856d0:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7f856d4:	eb0a01bf	cmp	x13, x10
   0x0000fffff7f856d8:	54000100	b.eq	0xfffff7f856f8  // b.none
   0x0000fffff7f856dc:	5290000a	mov	w10, #0x8000                	// #32768
   0x0000fffff7f856e0:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7f856e4:	eb0a01bf	cmp	x13, x10
   0x0000fffff7f856e8:	54000a41	b.ne	0xfffff7f85830  // b.any
   0x0000fffff7f856ec:	f9401d8b	ldr	x11, [x12, #56]
   0x0000fffff7f856f0:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f856f4:	14000002	b	0xfffff7f856fc
   0x0000fffff7f856f8:	aa0c03eb	mov	x11, x12
   0x0000fffff7f856fc:	f9402569	ldr	x9, [x11, #72]
   0x0000fffff7f85700:	d1000529	sub	x9, x9, #0x1
   0x0000fffff7f85704:	d297258a	mov	x10, #0xb92c                	// #47404
   0x0000fffff7f85708:	f2b1912a	movk	x10, #0x8c89, lsl #16
   0x0000fffff7f8570c:	f2c00aaa	movk	x10, #0x55, lsl #32
   0x0000fffff7f85710:	8a09014a	and	x10, x10, x9
   0x0000fffff7f85714:	f940216b	ldr	x11, [x11, #64]
   0x0000fffff7f85718:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7f8571c:	9b097d4a	mul	x10, x10, x9
   0x0000fffff7f85720:	8b0a016b	add	x11, x11, x10
   0x0000fffff7f85724:	b9401169	ldr	w9, [x11, #16]
   0x0000fffff7f85728:	5280020a	mov	w10, #0x10                  	// #16
   0x0000fffff7f8572c:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f85730:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85734:	540007e1	b.ne	0xfffff7f85830  // b.any
   0x0000fffff7f85738:	f9400d69	ldr	x9, [x11, #24]
   0x0000fffff7f8573c:	d29a940a	mov	x10, #0xd4a0                	// #54432
   0x0000fffff7f85740:	f2b5580a	movk	x10, #0xaac0, lsl #16
   0x0000fffff7f85744:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7f85748:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8574c:	54000721	b.ne	0xfffff7f85830  // b.any
   0x0000fffff7f85750:	9100016b	add	x11, x11, #0x0
   0x0000fffff7f85754:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7f85758:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7f8575c:	eb0a01bf	cmp	x13, x10
   0x0000fffff7f85760:	540002a0	b.eq	0xfffff7f857b4  // b.none
   0x0000fffff7f85764:	b9400169	ldr	w9, [x11]
   0x0000fffff7f85768:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8576c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85770:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85774:	540005e1	b.ne	0xfffff7f85830  // b.any
   0x0000fffff7f85778:	f9400569	ldr	x9, [x11, #8]
   0x0000fffff7f8577c:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7f85780:	f2a0400a	movk	x10, #0x200, lsl #16
   0x0000fffff7f85784:	8a0a012a	and	x10, x9, x10
   0x0000fffff7f85788:	f100015f	cmp	x10, #0x0
   0x0000fffff7f8578c:	54000520	b.eq	0xfffff7f85830  // b.none
   0x0000fffff7f85790:	d29fffea	mov	x10, #0xffff                	// #65535
   0x0000fffff7f85794:	f2a01fea	movk	x10, #0xff, lsl #16
   0x0000fffff7f85798:	8a0a0129	and	x9, x9, x10
   0x0000fffff7f8579c:	f9401d8a	ldr	x10, [x12, #56]
   0x0000fffff7f857a0:	f940254a	ldr	x10, [x10, #72]
   0x0000fffff7f857a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f857a8:	54000442	b.cs	0xfffff7f85830  // b.hs, b.nlast
   0x0000fffff7f857ac:	9101618b	add	x11, x12, #0x58
   0x0000fffff7f857b0:	8b09116b	add	x11, x11, x9, lsl #4
   0x0000fffff7f857b4:	b90053ed	str	w13, [sp, #80]
   0x0000fffff7f857b8:	f9002fec	str	x12, [sp, #88]
   0x0000fffff7f857bc:	f90037eb	str	x11, [sp, #104]
   0x0000fffff7f857c0:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7f857c4:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7f857c8:	b9400171	ldr	w17, [x11]
   0x0000fffff7f857cc:	36d801d1	tbz	w17, #27, 0xfffff7f85804
   0x0000fffff7f857d0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f857d4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f857d8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f857dc:	540002a1	b.ne	0xfffff7f85830  // b.any
   0x0000fffff7f857e0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f857e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f857e8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f857ec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f857f0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f857f4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f857f8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f857fc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85800:	54000189	b.ls	0xfffff7f85830  // b.plast
   0x0000fffff7f85804:	36d8008d	tbz	w13, #27, 0xfffff7f85814
   0x0000fffff7f85808:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8580c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85810:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85814:	36d80091	tbz	w17, #27, 0xfffff7f85824
   0x0000fffff7f85818:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8581c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85820:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85824:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f85828:	b900016d	str	w13, [x11]
   0x0000fffff7f8582c:	1400000e	b	0xfffff7f85864
   0x0000fffff7f85830:	910143e6	add	x6, sp, #0x50
   0x0000fffff7f85834:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85838:	aa1303e1	mov	x1, x19
   0x0000fffff7f8583c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85840:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f85844:	aa1403e4	mov	x4, x20
   0x0000fffff7f85848:	aa1603e5	mov	x5, x22
   0x0000fffff7f8584c:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7f85850:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85854:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85858:	d63f0200	blr	x16
   0x0000fffff7f8585c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85860:	54002b20	b.eq	0xfffff7f85dc4  // b.none
   0x0000fffff7f85864:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f85868:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8586c:	540004a0	b.eq	0xfffff7f85900  // b.none
   0x0000fffff7f85870:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85874:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85878:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8587c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85880:	54000400	b.eq	0xfffff7f85900  // b.none
   0x0000fffff7f85884:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85888:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8588c:	36d801d1	tbz	w17, #27, 0xfffff7f858c4
   0x0000fffff7f85890:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85894:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85898:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8589c:	54000321	b.ne	0xfffff7f85900  // b.any
   0x0000fffff7f858a0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f858a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f858a8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f858ac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f858b0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f858b4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f858b8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f858bc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f858c0:	54000209	b.ls	0xfffff7f85900  // b.plast
   0x0000fffff7f858c4:	36d8008d	tbz	w13, #27, 0xfffff7f858d4
   0x0000fffff7f858c8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f858cc:	91000529	add	x9, x9, #0x1
   0x0000fffff7f858d0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f858d4:	36d80091	tbz	w17, #27, 0xfffff7f858e4
   0x0000fffff7f858d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f858dc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f858e0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f858e4:	b940726e	ldr	w14, [x19, #112]
   0x0000fffff7f858e8:	f9403e6f	ldr	x15, [x19, #120]
   0x0000fffff7f858ec:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f858f0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f858f4:	f9003e6c	str	x12, [x19, #120]
   0x0000fffff7f858f8:	b900726d	str	w13, [x19, #112]
   0x0000fffff7f858fc:	1400000e	b	0xfffff7f85934
   0x0000fffff7f85900:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f85904:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85908:	aa1303e1	mov	x1, x19
   0x0000fffff7f8590c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85910:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f85914:	aa1403e4	mov	x4, x20
   0x0000fffff7f85918:	aa1603e5	mov	x5, x22
   0x0000fffff7f8591c:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f85920:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85924:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85928:	d63f0200	blr	x16
   0x0000fffff7f8592c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85930:	540024e0	b.eq	0xfffff7f85dcc  // b.none
   0x0000fffff7f85934:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f85938:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f8593c:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f85940:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85944:	54000621	b.ne	0xfffff7f85a08  // b.any
   0x0000fffff7f85948:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8594c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85950:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85954:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85958:	54000581	b.ne	0xfffff7f85a08  // b.any
   0x0000fffff7f8595c:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f85960:	f9403e6b	ldr	x11, [x19, #120]
   0x0000fffff7f85964:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f85968:	eb09015f	cmp	x10, x9
   0x0000fffff7f8596c:	540004e2	b.cs	0xfffff7f85a08  // b.hs, b.nlast
   0x0000fffff7f85970:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f85974:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f85978:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8597c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85980:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85984:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85988:	54000400	b.eq	0xfffff7f85a08  // b.none
   0x0000fffff7f8598c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85990:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85994:	36d801d1	tbz	w17, #27, 0xfffff7f859cc
   0x0000fffff7f85998:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8599c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f859a0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f859a4:	54000321	b.ne	0xfffff7f85a08  // b.any
   0x0000fffff7f859a8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f859ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f859b0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f859b4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f859b8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f859bc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f859c0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f859c4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f859c8:	54000209	b.ls	0xfffff7f85a08  // b.plast
   0x0000fffff7f859cc:	36d8008d	tbz	w13, #27, 0xfffff7f859dc
   0x0000fffff7f859d0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f859d4:	91000529	add	x9, x9, #0x1
   0x0000fffff7f859d8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f859dc:	36d80091	tbz	w17, #27, 0xfffff7f859ec
   0x0000fffff7f859e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f859e4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f859e8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f859ec:	b940726e	ldr	w14, [x19, #112]
   0x0000fffff7f859f0:	f9403e6f	ldr	x15, [x19, #120]
   0x0000fffff7f859f4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f859f8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f859fc:	f9003e6c	str	x12, [x19, #120]
   0x0000fffff7f85a00:	b900726d	str	w13, [x19, #112]
   0x0000fffff7f85a04:	1400000e	b	0xfffff7f85a3c
   0x0000fffff7f85a08:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f85a0c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85a10:	aa1303e1	mov	x1, x19
   0x0000fffff7f85a14:	aa1503e2	mov	x2, x21
   0x0000fffff7f85a18:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f85a1c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85a20:	aa1603e5	mov	x5, x22
   0x0000fffff7f85a24:	d289d210	mov	x16, #0x4e90                	// #20112
   0x0000fffff7f85a28:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85a2c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85a30:	d63f0200	blr	x16
   0x0000fffff7f85a34:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85a38:	54001ce0	b.eq	0xfffff7f85dd4  // b.none
   0x0000fffff7f85a3c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f85a40:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85a44:	540004a0	b.eq	0xfffff7f85ad8  // b.none
   0x0000fffff7f85a48:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85a4c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85a50:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85a54:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85a58:	54000400	b.eq	0xfffff7f85ad8  // b.none
   0x0000fffff7f85a5c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85a60:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85a64:	36d801d1	tbz	w17, #27, 0xfffff7f85a9c
   0x0000fffff7f85a68:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85a6c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85a70:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85a74:	54000321	b.ne	0xfffff7f85ad8  // b.any
   0x0000fffff7f85a78:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85a7c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85a80:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85a84:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85a88:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85a8c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85a90:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85a94:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85a98:	54000209	b.ls	0xfffff7f85ad8  // b.plast
   0x0000fffff7f85a9c:	36d8008d	tbz	w13, #27, 0xfffff7f85aac
   0x0000fffff7f85aa0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85aa4:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85aa8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85aac:	36d80091	tbz	w17, #27, 0xfffff7f85abc
   0x0000fffff7f85ab0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85ab4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85ab8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85abc:	b940826e	ldr	w14, [x19, #128]
   0x0000fffff7f85ac0:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7f85ac4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85ac8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85acc:	f900466c	str	x12, [x19, #136]
   0x0000fffff7f85ad0:	b900826d	str	w13, [x19, #128]
   0x0000fffff7f85ad4:	1400000e	b	0xfffff7f85b0c
   0x0000fffff7f85ad8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85adc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85ae0:	aa1303e1	mov	x1, x19
   0x0000fffff7f85ae4:	aa1503e2	mov	x2, x21
   0x0000fffff7f85ae8:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f85aec:	aa1403e4	mov	x4, x20
   0x0000fffff7f85af0:	aa1603e5	mov	x5, x22
   0x0000fffff7f85af4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f85af8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85afc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85b00:	d63f0200	blr	x16
   0x0000fffff7f85b04:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85b08:	540016a0	b.eq	0xfffff7f85ddc  // b.none
   0x0000fffff7f85b0c:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85b10:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f85b14:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f85b18:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85b1c:	54000621	b.ne	0xfffff7f85be0  // b.any
   0x0000fffff7f85b20:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85b24:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85b28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85b2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85b30:	54000581	b.ne	0xfffff7f85be0  // b.any
   0x0000fffff7f85b34:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f85b38:	f940466b	ldr	x11, [x19, #136]
   0x0000fffff7f85b3c:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f85b40:	eb09015f	cmp	x10, x9
   0x0000fffff7f85b44:	540004e2	b.cs	0xfffff7f85be0  // b.hs, b.nlast
   0x0000fffff7f85b48:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f85b4c:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f85b50:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85b54:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85b58:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85b5c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85b60:	54000400	b.eq	0xfffff7f85be0  // b.none
   0x0000fffff7f85b64:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85b68:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85b6c:	36d801d1	tbz	w17, #27, 0xfffff7f85ba4
   0x0000fffff7f85b70:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85b74:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85b78:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85b7c:	54000321	b.ne	0xfffff7f85be0  // b.any
   0x0000fffff7f85b80:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85b84:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85b88:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85b8c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85b90:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85b94:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85b98:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85b9c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85ba0:	54000209	b.ls	0xfffff7f85be0  // b.plast
   0x0000fffff7f85ba4:	36d8008d	tbz	w13, #27, 0xfffff7f85bb4
   0x0000fffff7f85ba8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85bac:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85bb0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85bb4:	36d80091	tbz	w17, #27, 0xfffff7f85bc4
   0x0000fffff7f85bb8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85bbc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85bc0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85bc4:	b940826e	ldr	w14, [x19, #128]
   0x0000fffff7f85bc8:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7f85bcc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85bd0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85bd4:	f900466c	str	x12, [x19, #136]
   0x0000fffff7f85bd8:	b900826d	str	w13, [x19, #128]
   0x0000fffff7f85bdc:	1400000e	b	0xfffff7f85c14
   0x0000fffff7f85be0:	910243e6	add	x6, sp, #0x90
   0x0000fffff7f85be4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85be8:	aa1303e1	mov	x1, x19
   0x0000fffff7f85bec:	aa1503e2	mov	x2, x21
   0x0000fffff7f85bf0:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7f85bf4:	aa1403e4	mov	x4, x20
   0x0000fffff7f85bf8:	aa1603e5	mov	x5, x22
   0x0000fffff7f85bfc:	d289d210	mov	x16, #0x4e90                	// #20112
   0x0000fffff7f85c00:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85c04:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85c08:	d63f0200	blr	x16
   0x0000fffff7f85c0c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85c10:	54000ea0	b.eq	0xfffff7f85de4  // b.none
   0x0000fffff7f85c14:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f85c18:	37d806a9	tbnz	w9, #27, 0xfffff7f85cec
   0x0000fffff7f85c1c:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f85c20:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85c24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85c28:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85c2c:	540001c1	b.ne	0xfffff7f85c64  // b.any
   0x0000fffff7f85c30:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85c34:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85c38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85c3c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85c40:	54000121	b.ne	0xfffff7f85c64  // b.any
   0x0000fffff7f85c44:	f9403e69	ldr	x9, [x19, #120]
   0x0000fffff7f85c48:	f940466a	ldr	x10, [x19, #136]
   0x0000fffff7f85c4c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85c50:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85c54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85c58:	f9003e69	str	x9, [x19, #120]
   0x0000fffff7f85c5c:	b900726a	str	w10, [x19, #112]
   0x0000fffff7f85c60:	14000030	b	0xfffff7f85d20
   0x0000fffff7f85c64:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f85c68:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85c6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85c70:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85c74:	54000120	b.eq	0xfffff7f85c98  // b.none
   0x0000fffff7f85c78:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f85c7c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85c80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85c84:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85c88:	54000321	b.ne	0xfffff7f85cec  // b.any
   0x0000fffff7f85c8c:	f9403e69	ldr	x9, [x19, #120]
   0x0000fffff7f85c90:	9e620120	scvtf	d0, x9
   0x0000fffff7f85c94:	14000002	b	0xfffff7f85c9c
   0x0000fffff7f85c98:	fd403e60	ldr	d0, [x19, #120]
   0x0000fffff7f85c9c:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85ca0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85ca4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85ca8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85cac:	54000120	b.eq	0xfffff7f85cd0  // b.none
   0x0000fffff7f85cb0:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85cb4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85cb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85cbc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85cc0:	54000161	b.ne	0xfffff7f85cec  // b.any
   0x0000fffff7f85cc4:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f85cc8:	9e620121	scvtf	d1, x9
   0x0000fffff7f85ccc:	14000002	b	0xfffff7f85cd4
   0x0000fffff7f85cd0:	fd404661	ldr	d1, [x19, #136]
   0x0000fffff7f85cd4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f85cd8:	fd003e60	str	d0, [x19, #120]
   0x0000fffff7f85cdc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85ce0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85ce4:	b900726a	str	w10, [x19, #112]
   0x0000fffff7f85ce8:	17ffffde	b	0xfffff7f85c60
   0x0000fffff7f85cec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85cf0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85cf4:	aa1303e1	mov	x1, x19
   0x0000fffff7f85cf8:	aa1503e2	mov	x2, x21
   0x0000fffff7f85cfc:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7f85d00:	aa1403e4	mov	x4, x20
   0x0000fffff7f85d04:	aa1603e5	mov	x5, x22
   0x0000fffff7f85d08:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7f85d0c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85d10:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85d14:	d63f0200	blr	x16
   0x0000fffff7f85d18:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85d1c:	54000680	b.eq	0xfffff7f85dec  // b.none
   0x0000fffff7f85d20:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85d24:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85d28:	aa1303e1	mov	x1, x19
   0x0000fffff7f85d2c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85d30:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7f85d34:	aa1403e4	mov	x4, x20
   0x0000fffff7f85d38:	aa1603e5	mov	x5, x22
   0x0000fffff7f85d3c:	d2869090	mov	x16, #0x3484                	// #13444
   0x0000fffff7f85d40:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85d44:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85d48:	d63f0200	blr	x16
   0x0000fffff7f85d4c:	9102c3ff	add	sp, sp, #0xb0
   0x0000fffff7f85d50:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85d54:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85d58:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85d5c:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f85d60:	d65f03c0	ret
   0x0000fffff7f85d64:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85d68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85d6c:	b900028a	str	w10, [x20]
   0x0000fffff7f85d70:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85d74:	9102c3ff	add	sp, sp, #0xb0
   0x0000fffff7f85d78:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85d7c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85d80:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85d84:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85d88:	d65f03c0	ret
   0x0000fffff7f85d8c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f85d90:	17fffff5	b	0xfffff7f85d64
   0x0000fffff7f85d94:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f85d98:	17fffff3	b	0xfffff7f85d64
   0x0000fffff7f85d9c:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f85da0:	17fffff1	b	0xfffff7f85d64
   0x0000fffff7f85da4:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f85da8:	17ffffef	b	0xfffff7f85d64
   0x0000fffff7f85dac:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f85db0:	17ffffed	b	0xfffff7f85d64
   0x0000fffff7f85db4:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f85db8:	17ffffeb	b	0xfffff7f85d64
   0x0000fffff7f85dbc:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f85dc0:	17ffffe9	b	0xfffff7f85d64
   0x0000fffff7f85dc4:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f85dc8:	17ffffe7	b	0xfffff7f85d64
   0x0000fffff7f85dcc:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f85dd0:	17ffffe5	b	0xfffff7f85d64
   0x0000fffff7f85dd4:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f85dd8:	17ffffe3	b	0xfffff7f85d64
   0x0000fffff7f85ddc:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7f85de0:	17ffffe1	b	0xfffff7f85d64
   0x0000fffff7f85de4:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7f85de8:	17ffffdf	b	0xfffff7f85d64
   0x0000fffff7f85dec:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7f85df0:	17ffffdd	b	0xfffff7f85d64
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
