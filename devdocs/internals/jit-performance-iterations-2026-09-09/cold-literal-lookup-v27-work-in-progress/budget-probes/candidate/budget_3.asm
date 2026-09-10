Dump of assembler code from 0xfffff7fbb000 to 0xfffff7fbc000:
   0x0000fffff7fbb000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fbb004:	910003fd	mov	x29, sp
   0x0000fffff7fbb008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fbb00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fbb010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fbb014:	aa0003f3	mov	x19, x0
   0x0000fffff7fbb018:	aa0103f4	mov	x20, x1
   0x0000fffff7fbb01c:	aa0203f5	mov	x21, x2
   0x0000fffff7fbb020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fbb024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fbb028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fbb02c:	f90003e9	str	x9, [sp]
   0x0000fffff7fbb030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fbb034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fbb038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fbb03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fbb040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb044:	d63f0200	blr	x16
   0x0000fffff7fbb048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fbb04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fbb050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fbb054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fbb058:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbb05c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbb060:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbb064:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbb068:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbb06c:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7fbb070:	36d801d1	tbz	w17, #27, 0xfffff7fbb0a8
   0x0000fffff7fbb074:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb078:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb07c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb080:	54000281	b.ne	0xfffff7fbb0d0  // b.any
   0x0000fffff7fbb084:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7fbb088:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb08c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb090:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb094:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb098:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb09c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb0a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb0a4:	54000169	b.ls	0xfffff7fbb0d0  // b.plast
   0x0000fffff7fbb0a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb0ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb0b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb0b4:	36d80091	tbz	w17, #27, 0xfffff7fbb0c4
   0x0000fffff7fbb0b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb0bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb0c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb0c4:	f900166c	str	x12, [x19, #40]
   0x0000fffff7fbb0c8:	b900226d	str	w13, [x19, #32]
   0x0000fffff7fbb0cc:	1400000e	b	0xfffff7fbb104
   0x0000fffff7fbb0d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb0d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb0d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb0dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb0e0:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fbb0e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb0e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb0ec:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fbb0f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb0f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb0f8:	d63f0200	blr	x16
   0x0000fffff7fbb0fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb100:	54006e00	b.eq	0xfffff7fbbec0  // b.none
   0x0000fffff7fbb104:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fbb108:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fbb10c:	d280002c	mov	x12, #0x1                   	// #1
   0x0000fffff7fbb110:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fbb114:	36d80211	tbz	w17, #27, 0xfffff7fbb154
   0x0000fffff7fbb118:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb11c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb120:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb124:	540001e1	b.ne	0xfffff7fbb160  // b.any
   0x0000fffff7fbb128:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fbb12c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb130:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb134:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb138:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb13c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb140:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb144:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb148:	540000c9	b.ls	0xfffff7fbb160  // b.plast
   0x0000fffff7fbb14c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb150:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb154:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fbb158:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fbb15c:	1400000e	b	0xfffff7fbb194
   0x0000fffff7fbb160:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb164:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb168:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb16c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb170:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fbb174:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb178:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb17c:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7fbb180:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbb184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb188:	d63f0200	blr	x16
   0x0000fffff7fbb18c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb190:	540069c0	b.eq	0xfffff7fbbec8  // b.none
   0x0000fffff7fbb194:	b940126d	ldr	w13, [x19, #16]
   0x0000fffff7fbb198:	f9400e6c	ldr	x12, [x19, #24]
   0x0000fffff7fbb19c:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7fbb1a0:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fbb1a4:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fbb1a8:	54000100	b.eq	0xfffff7fbb1c8  // b.none
   0x0000fffff7fbb1ac:	5290000a	mov	w10, #0x8000                	// #32768
   0x0000fffff7fbb1b0:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fbb1b4:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fbb1b8:	54000a21	b.ne	0xfffff7fbb2fc  // b.any
   0x0000fffff7fbb1bc:	f9401d8b	ldr	x11, [x12, #56]
   0x0000fffff7fbb1c0:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7fbb1c4:	14000002	b	0xfffff7fbb1cc
   0x0000fffff7fbb1c8:	aa0c03eb	mov	x11, x12
   0x0000fffff7fbb1cc:	f9402569	ldr	x9, [x11, #72]
   0x0000fffff7fbb1d0:	d1000529	sub	x9, x9, #0x1
   0x0000fffff7fbb1d4:	d298b66a	mov	x10, #0xc5b3                	// #50611
   0x0000fffff7fbb1d8:	f2a00f0a	movk	x10, #0x78, lsl #16
   0x0000fffff7fbb1dc:	8a09014a	and	x10, x10, x9
   0x0000fffff7fbb1e0:	f940216b	ldr	x11, [x11, #64]
   0x0000fffff7fbb1e4:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fbb1e8:	9b097d4a	mul	x10, x10, x9
   0x0000fffff7fbb1ec:	8b0a016b	add	x11, x11, x10
   0x0000fffff7fbb1f0:	b9401169	ldr	w9, [x11, #16]
   0x0000fffff7fbb1f4:	5280020a	mov	w10, #0x10                  	// #16
   0x0000fffff7fbb1f8:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7fbb1fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb200:	540007e1	b.ne	0xfffff7fbb2fc  // b.any
   0x0000fffff7fbb204:	f9400d69	ldr	x9, [x11, #24]
   0x0000fffff7fbb208:	d299ba0a	mov	x10, #0xcdd0                	// #52688
   0x0000fffff7fbb20c:	f2b5580a	movk	x10, #0xaac0, lsl #16
   0x0000fffff7fbb210:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7fbb214:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb218:	54000721	b.ne	0xfffff7fbb2fc  // b.any
   0x0000fffff7fbb21c:	9100016b	add	x11, x11, #0x0
   0x0000fffff7fbb220:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7fbb224:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fbb228:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fbb22c:	540002a0	b.eq	0xfffff7fbb280  // b.none
   0x0000fffff7fbb230:	b9400169	ldr	w9, [x11]
   0x0000fffff7fbb234:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb238:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb23c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb240:	540005e1	b.ne	0xfffff7fbb2fc  // b.any
   0x0000fffff7fbb244:	f9400569	ldr	x9, [x11, #8]
   0x0000fffff7fbb248:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7fbb24c:	f2a0400a	movk	x10, #0x200, lsl #16
   0x0000fffff7fbb250:	8a0a012a	and	x10, x9, x10
   0x0000fffff7fbb254:	f100015f	cmp	x10, #0x0
   0x0000fffff7fbb258:	54000520	b.eq	0xfffff7fbb2fc  // b.none
   0x0000fffff7fbb25c:	d29fffea	mov	x10, #0xffff                	// #65535
   0x0000fffff7fbb260:	f2a01fea	movk	x10, #0xff, lsl #16
   0x0000fffff7fbb264:	8a0a0129	and	x9, x9, x10
   0x0000fffff7fbb268:	f9401d8a	ldr	x10, [x12, #56]
   0x0000fffff7fbb26c:	f940254a	ldr	x10, [x10, #72]
   0x0000fffff7fbb270:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb274:	54000442	b.cs	0xfffff7fbb2fc  // b.hs, b.nlast
   0x0000fffff7fbb278:	9101618b	add	x11, x12, #0x58
   0x0000fffff7fbb27c:	8b09116b	add	x11, x11, x9, lsl #4
   0x0000fffff7fbb280:	b90013ed	str	w13, [sp, #16]
   0x0000fffff7fbb284:	f9000fec	str	x12, [sp, #24]
   0x0000fffff7fbb288:	f90017eb	str	x11, [sp, #40]
   0x0000fffff7fbb28c:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbb290:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbb294:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbb298:	36d801d1	tbz	w17, #27, 0xfffff7fbb2d0
   0x0000fffff7fbb29c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb2a0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb2a4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb2a8:	540002a1	b.ne	0xfffff7fbb2fc  // b.any
   0x0000fffff7fbb2ac:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbb2b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb2b4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb2b8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb2bc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb2c0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb2c4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb2c8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb2cc:	54000189	b.ls	0xfffff7fbb2fc  // b.plast
   0x0000fffff7fbb2d0:	36d8008d	tbz	w13, #27, 0xfffff7fbb2e0
   0x0000fffff7fbb2d4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb2d8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb2dc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb2e0:	36d80091	tbz	w17, #27, 0xfffff7fbb2f0
   0x0000fffff7fbb2e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb2e8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb2ec:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb2f0:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbb2f4:	b900016d	str	w13, [x11]
   0x0000fffff7fbb2f8:	1400000e	b	0xfffff7fbb330
   0x0000fffff7fbb2fc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbb300:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb304:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb308:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb30c:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fbb310:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb314:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb318:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fbb31c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb320:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb324:	d63f0200	blr	x16
   0x0000fffff7fbb328:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb32c:	54005d20	b.eq	0xfffff7fbbed0  // b.none
   0x0000fffff7fbb330:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fbb334:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fbb338:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fbb33c:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7fbb340:	36d80211	tbz	w17, #27, 0xfffff7fbb380
   0x0000fffff7fbb344:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb348:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb34c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb350:	540001e1	b.ne	0xfffff7fbb38c  // b.any
   0x0000fffff7fbb354:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7fbb358:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb35c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb360:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb364:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb368:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb36c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb370:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb374:	540000c9	b.ls	0xfffff7fbb38c  // b.plast
   0x0000fffff7fbb378:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb37c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb380:	f900166c	str	x12, [x19, #40]
   0x0000fffff7fbb384:	b900226d	str	w13, [x19, #32]
   0x0000fffff7fbb388:	1400000e	b	0xfffff7fbb3c0
   0x0000fffff7fbb38c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb390:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb394:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb398:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb39c:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7fbb3a0:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb3a4:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb3a8:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7fbb3ac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbb3b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb3b4:	d63f0200	blr	x16
   0x0000fffff7fbb3b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb3bc:	540058e0	b.eq	0xfffff7fbbed8  // b.none
   0x0000fffff7fbb3c0:	b940126d	ldr	w13, [x19, #16]
   0x0000fffff7fbb3c4:	f9400e6c	ldr	x12, [x19, #24]
   0x0000fffff7fbb3c8:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7fbb3cc:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fbb3d0:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fbb3d4:	54000100	b.eq	0xfffff7fbb3f4  // b.none
   0x0000fffff7fbb3d8:	5290000a	mov	w10, #0x8000                	// #32768
   0x0000fffff7fbb3dc:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fbb3e0:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fbb3e4:	54000b21	b.ne	0xfffff7fbb548  // b.any
   0x0000fffff7fbb3e8:	f9401d8b	ldr	x11, [x12, #56]
   0x0000fffff7fbb3ec:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7fbb3f0:	14000002	b	0xfffff7fbb3f8
   0x0000fffff7fbb3f4:	aa0c03eb	mov	x11, x12
   0x0000fffff7fbb3f8:	f9402569	ldr	x9, [x11, #72]
   0x0000fffff7fbb3fc:	d1000529	sub	x9, x9, #0x1
   0x0000fffff7fbb400:	d29ba34a	mov	x10, #0xdd1a                	// #56602
   0x0000fffff7fbb404:	f2a2374a	movk	x10, #0x11ba, lsl #16
   0x0000fffff7fbb408:	8a09014a	and	x10, x10, x9
   0x0000fffff7fbb40c:	f940216b	ldr	x11, [x11, #64]
   0x0000fffff7fbb410:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fbb414:	9b097d4a	mul	x10, x10, x9
   0x0000fffff7fbb418:	8b0a016b	add	x11, x11, x10
   0x0000fffff7fbb41c:	b9401169	ldr	w9, [x11, #16]
   0x0000fffff7fbb420:	5280020a	mov	w10, #0x10                  	// #16
   0x0000fffff7fbb424:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7fbb428:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb42c:	540008e1	b.ne	0xfffff7fbb548  // b.any
   0x0000fffff7fbb430:	f9400d69	ldr	x9, [x11, #24]
   0x0000fffff7fbb434:	d299d20a	mov	x10, #0xce90                	// #52880
   0x0000fffff7fbb438:	f2b5580a	movk	x10, #0xaac0, lsl #16
   0x0000fffff7fbb43c:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7fbb440:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb444:	54000821	b.ne	0xfffff7fbb548  // b.any
   0x0000fffff7fbb448:	9100016b	add	x11, x11, #0x0
   0x0000fffff7fbb44c:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7fbb450:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fbb454:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fbb458:	540002a0	b.eq	0xfffff7fbb4ac  // b.none
   0x0000fffff7fbb45c:	b9400169	ldr	w9, [x11]
   0x0000fffff7fbb460:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb464:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb468:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb46c:	540006e1	b.ne	0xfffff7fbb548  // b.any
   0x0000fffff7fbb470:	f9400569	ldr	x9, [x11, #8]
   0x0000fffff7fbb474:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7fbb478:	f2a0400a	movk	x10, #0x200, lsl #16
   0x0000fffff7fbb47c:	8a0a012a	and	x10, x9, x10
   0x0000fffff7fbb480:	f100015f	cmp	x10, #0x0
   0x0000fffff7fbb484:	54000620	b.eq	0xfffff7fbb548  // b.none
   0x0000fffff7fbb488:	d29fffea	mov	x10, #0xffff                	// #65535
   0x0000fffff7fbb48c:	f2a01fea	movk	x10, #0xff, lsl #16
   0x0000fffff7fbb490:	8a0a0129	and	x9, x9, x10
   0x0000fffff7fbb494:	f9401d8a	ldr	x10, [x12, #56]
   0x0000fffff7fbb498:	f940254a	ldr	x10, [x10, #72]
   0x0000fffff7fbb49c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb4a0:	54000542	b.cs	0xfffff7fbb548  // b.hs, b.nlast
   0x0000fffff7fbb4a4:	9101618b	add	x11, x12, #0x58
   0x0000fffff7fbb4a8:	8b09116b	add	x11, x11, x9, lsl #4
   0x0000fffff7fbb4ac:	b90033ed	str	w13, [sp, #48]
   0x0000fffff7fbb4b0:	f9001fec	str	x12, [sp, #56]
   0x0000fffff7fbb4b4:	f90027eb	str	x11, [sp, #72]
   0x0000fffff7fbb4b8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbb4bc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbb4c0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbb4c4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbb4c8:	54000400	b.eq	0xfffff7fbb548  // b.none
   0x0000fffff7fbb4cc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbb4d0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbb4d4:	36d801d1	tbz	w17, #27, 0xfffff7fbb50c
   0x0000fffff7fbb4d8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb4dc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb4e0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb4e4:	54000321	b.ne	0xfffff7fbb548  // b.any
   0x0000fffff7fbb4e8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbb4ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb4f0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb4f4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb4f8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb4fc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb500:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb504:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb508:	54000209	b.ls	0xfffff7fbb548  // b.plast
   0x0000fffff7fbb50c:	36d8008d	tbz	w13, #27, 0xfffff7fbb51c
   0x0000fffff7fbb510:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb514:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb518:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb51c:	36d80091	tbz	w17, #27, 0xfffff7fbb52c
   0x0000fffff7fbb520:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb524:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb528:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb52c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fbb530:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fbb534:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbb538:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbb53c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fbb540:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fbb544:	1400000e	b	0xfffff7fbb57c
   0x0000fffff7fbb548:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbb54c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb550:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb554:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb558:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7fbb55c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb560:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb564:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fbb568:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbb56c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb570:	d63f0200	blr	x16
   0x0000fffff7fbb574:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb578:	54004b40	b.eq	0xfffff7fbbee0  // b.none
   0x0000fffff7fbb57c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fbb580:	37d806a9	tbnz	w9, #27, 0xfffff7fbb654
   0x0000fffff7fbb584:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fbb588:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb58c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb590:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb594:	540001c1	b.ne	0xfffff7fbb5cc  // b.any
   0x0000fffff7fbb598:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb59c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb5a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb5a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb5a8:	54000121	b.ne	0xfffff7fbb5cc  // b.any
   0x0000fffff7fbb5ac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fbb5b0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fbb5b4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbb5b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb5bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb5c0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fbb5c4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fbb5c8:	14000030	b	0xfffff7fbb688
   0x0000fffff7fbb5cc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fbb5d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb5d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb5d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb5dc:	54000120	b.eq	0xfffff7fbb600  // b.none
   0x0000fffff7fbb5e0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fbb5e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb5e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb5ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb5f0:	54000321	b.ne	0xfffff7fbb654  // b.any
   0x0000fffff7fbb5f4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fbb5f8:	9e620120	scvtf	d0, x9
   0x0000fffff7fbb5fc:	14000002	b	0xfffff7fbb604
   0x0000fffff7fbb600:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fbb604:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb608:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb60c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb610:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb614:	54000120	b.eq	0xfffff7fbb638  // b.none
   0x0000fffff7fbb618:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb61c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb620:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb624:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb628:	54000161	b.ne	0xfffff7fbb654  // b.any
   0x0000fffff7fbb62c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbb630:	9e620121	scvtf	d1, x9
   0x0000fffff7fbb634:	14000002	b	0xfffff7fbb63c
   0x0000fffff7fbb638:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fbb63c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbb640:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fbb644:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb648:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb64c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fbb650:	17ffffde	b	0xfffff7fbb5c8
   0x0000fffff7fbb654:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb658:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb65c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb660:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb664:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fbb668:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb66c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb670:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fbb674:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb678:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb67c:	d63f0200	blr	x16
   0x0000fffff7fbb680:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb684:	54004320	b.eq	0xfffff7fbbee8  // b.none
   0x0000fffff7fbb688:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbb68c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbb690:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbb694:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbb698:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbb69c:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fbb6a0:	36d801d1	tbz	w17, #27, 0xfffff7fbb6d8
   0x0000fffff7fbb6a4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb6a8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb6ac:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb6b0:	54000281	b.ne	0xfffff7fbb700  // b.any
   0x0000fffff7fbb6b4:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fbb6b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb6bc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb6c0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb6c4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb6c8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb6cc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb6d0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb6d4:	54000169	b.ls	0xfffff7fbb700  // b.plast
   0x0000fffff7fbb6d8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb6dc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb6e0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb6e4:	36d80091	tbz	w17, #27, 0xfffff7fbb6f4
   0x0000fffff7fbb6e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb6ec:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb6f0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb6f4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fbb6f8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fbb6fc:	1400000e	b	0xfffff7fbb734
   0x0000fffff7fbb700:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb704:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb708:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb70c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb710:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fbb714:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb718:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb71c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fbb720:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb724:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb728:	d63f0200	blr	x16
   0x0000fffff7fbb72c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb730:	54003e00	b.eq	0xfffff7fbbef0  // b.none
   0x0000fffff7fbb734:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbb738:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbb73c:	540003a0	b.eq	0xfffff7fbb7b0  // b.none
   0x0000fffff7fbb740:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fbb744:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fbb748:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbb74c:	36d801d1	tbz	w17, #27, 0xfffff7fbb784
   0x0000fffff7fbb750:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb754:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb758:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb75c:	540002a1	b.ne	0xfffff7fbb7b0  // b.any
   0x0000fffff7fbb760:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbb764:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb768:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb76c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb770:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb774:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb778:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb77c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb780:	54000189	b.ls	0xfffff7fbb7b0  // b.plast
   0x0000fffff7fbb784:	36d8008d	tbz	w13, #27, 0xfffff7fbb794
   0x0000fffff7fbb788:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb78c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb790:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb794:	36d80091	tbz	w17, #27, 0xfffff7fbb7a4
   0x0000fffff7fbb798:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb79c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb7a0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb7a4:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbb7a8:	b900016d	str	w13, [x11]
   0x0000fffff7fbb7ac:	1400000e	b	0xfffff7fbb7e4
   0x0000fffff7fbb7b0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbb7b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb7b8:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb7bc:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb7c0:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fbb7c4:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb7c8:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb7cc:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fbb7d0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb7d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb7d8:	d63f0200	blr	x16
   0x0000fffff7fbb7dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb7e0:	540038c0	b.eq	0xfffff7fbbef8  // b.none
   0x0000fffff7fbb7e4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbb7e8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbb7ec:	540004a0	b.eq	0xfffff7fbb880  // b.none
   0x0000fffff7fbb7f0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbb7f4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbb7f8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbb7fc:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbb800:	54000400	b.eq	0xfffff7fbb880  // b.none
   0x0000fffff7fbb804:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbb808:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbb80c:	36d801d1	tbz	w17, #27, 0xfffff7fbb844
   0x0000fffff7fbb810:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb814:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb818:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb81c:	54000321	b.ne	0xfffff7fbb880  // b.any
   0x0000fffff7fbb820:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbb824:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb828:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb82c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb830:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb834:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb838:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb83c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb840:	54000209	b.ls	0xfffff7fbb880  // b.plast
   0x0000fffff7fbb844:	36d8008d	tbz	w13, #27, 0xfffff7fbb854
   0x0000fffff7fbb848:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb84c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb850:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb854:	36d80091	tbz	w17, #27, 0xfffff7fbb864
   0x0000fffff7fbb858:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb85c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb860:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb864:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fbb868:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fbb86c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbb870:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbb874:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fbb878:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fbb87c:	1400000e	b	0xfffff7fbb8b4
   0x0000fffff7fbb880:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbb884:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb888:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb88c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb890:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fbb894:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb898:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb89c:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fbb8a0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbb8a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb8a8:	d63f0200	blr	x16
   0x0000fffff7fbb8ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb8b0:	54003280	b.eq	0xfffff7fbbf00  // b.none
   0x0000fffff7fbb8b4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fbb8b8:	37d806a9	tbnz	w9, #27, 0xfffff7fbb98c
   0x0000fffff7fbb8bc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fbb8c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb8c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb8c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb8cc:	540001c1	b.ne	0xfffff7fbb904  // b.any
   0x0000fffff7fbb8d0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb8d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb8d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb8dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb8e0:	54000121	b.ne	0xfffff7fbb904  // b.any
   0x0000fffff7fbb8e4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fbb8e8:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fbb8ec:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbb8f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb8f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb8f8:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fbb8fc:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fbb900:	14000030	b	0xfffff7fbb9c0
   0x0000fffff7fbb904:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fbb908:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb90c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb910:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb914:	54000120	b.eq	0xfffff7fbb938  // b.none
   0x0000fffff7fbb918:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fbb91c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb920:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb924:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb928:	54000321	b.ne	0xfffff7fbb98c  // b.any
   0x0000fffff7fbb92c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fbb930:	9e620120	scvtf	d0, x9
   0x0000fffff7fbb934:	14000002	b	0xfffff7fbb93c
   0x0000fffff7fbb938:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fbb93c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb940:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb944:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb948:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb94c:	54000120	b.eq	0xfffff7fbb970  // b.none
   0x0000fffff7fbb950:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb954:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb958:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb95c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb960:	54000161	b.ne	0xfffff7fbb98c  // b.any
   0x0000fffff7fbb964:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbb968:	9e620121	scvtf	d1, x9
   0x0000fffff7fbb96c:	14000002	b	0xfffff7fbb974
   0x0000fffff7fbb970:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fbb974:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbb978:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fbb97c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb980:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb984:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fbb988:	17ffffde	b	0xfffff7fbb900
   0x0000fffff7fbb98c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb990:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb994:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb998:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb99c:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fbb9a0:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb9a4:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb9a8:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fbb9ac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb9b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb9b4:	d63f0200	blr	x16
   0x0000fffff7fbb9b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb9bc:	54002a60	b.eq	0xfffff7fbbf08  // b.none
   0x0000fffff7fbb9c0:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbb9c4:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbb9c8:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbb9cc:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbb9d0:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbb9d4:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fbb9d8:	36d801d1	tbz	w17, #27, 0xfffff7fbba10
   0x0000fffff7fbb9dc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb9e0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb9e4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb9e8:	54000281	b.ne	0xfffff7fbba38  // b.any
   0x0000fffff7fbb9ec:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fbb9f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb9f4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb9f8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb9fc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbba00:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbba04:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbba08:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbba0c:	54000169	b.ls	0xfffff7fbba38  // b.plast
   0x0000fffff7fbba10:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbba14:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbba18:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbba1c:	36d80091	tbz	w17, #27, 0xfffff7fbba2c
   0x0000fffff7fbba20:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbba24:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbba28:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbba2c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fbba30:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fbba34:	1400000e	b	0xfffff7fbba6c
   0x0000fffff7fbba38:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbba3c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbba40:	aa1303e1	mov	x1, x19
   0x0000fffff7fbba44:	aa1503e2	mov	x2, x21
   0x0000fffff7fbba48:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fbba4c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbba50:	aa1603e5	mov	x5, x22
   0x0000fffff7fbba54:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fbba58:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbba5c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbba60:	d63f0200	blr	x16
   0x0000fffff7fbba64:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbba68:	54002540	b.eq	0xfffff7fbbf10  // b.none
   0x0000fffff7fbba6c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbba70:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbba74:	540003a0	b.eq	0xfffff7fbbae8  // b.none
   0x0000fffff7fbba78:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fbba7c:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fbba80:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbba84:	36d801d1	tbz	w17, #27, 0xfffff7fbbabc
   0x0000fffff7fbba88:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbba8c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbba90:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbba94:	540002a1	b.ne	0xfffff7fbbae8  // b.any
   0x0000fffff7fbba98:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbba9c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbbaa0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbbaa4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbbaa8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbbaac:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbbab0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbbab4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbbab8:	54000189	b.ls	0xfffff7fbbae8  // b.plast
   0x0000fffff7fbbabc:	36d8008d	tbz	w13, #27, 0xfffff7fbbacc
   0x0000fffff7fbbac0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbbac4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbbac8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbbacc:	36d80091	tbz	w17, #27, 0xfffff7fbbadc
   0x0000fffff7fbbad0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbbad4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbbad8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbbadc:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbbae0:	b900016d	str	w13, [x11]
   0x0000fffff7fbbae4:	1400000e	b	0xfffff7fbbb1c
   0x0000fffff7fbbae8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbbaec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbbaf0:	aa1303e1	mov	x1, x19
   0x0000fffff7fbbaf4:	aa1503e2	mov	x2, x21
   0x0000fffff7fbbaf8:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fbbafc:	aa1403e4	mov	x4, x20
   0x0000fffff7fbbb00:	aa1603e5	mov	x5, x22
   0x0000fffff7fbbb04:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fbbb08:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbbb0c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbbb10:	d63f0200	blr	x16
   0x0000fffff7fbbb14:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbbb18:	54002000	b.eq	0xfffff7fbbf18  // b.none
   0x0000fffff7fbbb1c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbbb20:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbbb24:	540004a0	b.eq	0xfffff7fbbbb8  // b.none
   0x0000fffff7fbbb28:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbbb2c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbbb30:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbbb34:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbbb38:	54000400	b.eq	0xfffff7fbbbb8  // b.none
   0x0000fffff7fbbb3c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbbb40:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbbb44:	36d801d1	tbz	w17, #27, 0xfffff7fbbb7c
   0x0000fffff7fbbb48:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbbb4c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbbb50:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbbb54:	54000321	b.ne	0xfffff7fbbbb8  // b.any
   0x0000fffff7fbbb58:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbbb5c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbbb60:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbbb64:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbbb68:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbbb6c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbbb70:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbbb74:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbbb78:	54000209	b.ls	0xfffff7fbbbb8  // b.plast
   0x0000fffff7fbbb7c:	36d8008d	tbz	w13, #27, 0xfffff7fbbb8c
   0x0000fffff7fbbb80:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbbb84:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbbb88:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbbb8c:	36d80091	tbz	w17, #27, 0xfffff7fbbb9c
   0x0000fffff7fbbb90:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbbb94:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbbb98:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbbb9c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fbbba0:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fbbba4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbbba8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbbbac:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fbbbb0:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fbbbb4:	1400000e	b	0xfffff7fbbbec
   0x0000fffff7fbbbb8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbbbbc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbbbc0:	aa1303e1	mov	x1, x19
   0x0000fffff7fbbbc4:	aa1503e2	mov	x2, x21
   0x0000fffff7fbbbc8:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fbbbcc:	aa1403e4	mov	x4, x20
   0x0000fffff7fbbbd0:	aa1603e5	mov	x5, x22
   0x0000fffff7fbbbd4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fbbbd8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbbbdc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbbbe0:	d63f0200	blr	x16
   0x0000fffff7fbbbe4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbbbe8:	540019c0	b.eq	0xfffff7fbbf20  // b.none
   0x0000fffff7fbbbec:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fbbbf0:	37d806a9	tbnz	w9, #27, 0xfffff7fbbcc4
   0x0000fffff7fbbbf4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fbbbf8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbbbfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbc00:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbbc04:	540001c1	b.ne	0xfffff7fbbc3c  // b.any
   0x0000fffff7fbbc08:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbbc0c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbbc10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbc14:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbbc18:	54000121	b.ne	0xfffff7fbbc3c  // b.any
   0x0000fffff7fbbc1c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fbbc20:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fbbc24:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbbc28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbbc2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbc30:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fbbc34:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fbbc38:	14000030	b	0xfffff7fbbcf8
   0x0000fffff7fbbc3c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fbbc40:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbbc44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbc48:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbbc4c:	54000120	b.eq	0xfffff7fbbc70  // b.none
   0x0000fffff7fbbc50:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fbbc54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbbc58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbc5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbbc60:	54000321	b.ne	0xfffff7fbbcc4  // b.any
   0x0000fffff7fbbc64:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fbbc68:	9e620120	scvtf	d0, x9
   0x0000fffff7fbbc6c:	14000002	b	0xfffff7fbbc74
   0x0000fffff7fbbc70:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fbbc74:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbbc78:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbbc7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbc80:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbbc84:	54000120	b.eq	0xfffff7fbbca8  // b.none
   0x0000fffff7fbbc88:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbbc8c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbbc90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbc94:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbbc98:	54000161	b.ne	0xfffff7fbbcc4  // b.any
   0x0000fffff7fbbc9c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbbca0:	9e620121	scvtf	d1, x9
   0x0000fffff7fbbca4:	14000002	b	0xfffff7fbbcac
   0x0000fffff7fbbca8:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fbbcac:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbbcb0:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fbbcb4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbbcb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbcbc:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fbbcc0:	17ffffde	b	0xfffff7fbbc38
   0x0000fffff7fbbcc4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbbcc8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbbccc:	aa1303e1	mov	x1, x19
   0x0000fffff7fbbcd0:	aa1503e2	mov	x2, x21
   0x0000fffff7fbbcd4:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fbbcd8:	aa1403e4	mov	x4, x20
   0x0000fffff7fbbcdc:	aa1603e5	mov	x5, x22
   0x0000fffff7fbbce0:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fbbce4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbbce8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbbcec:	d63f0200	blr	x16
   0x0000fffff7fbbcf0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbbcf4:	540011a0	b.eq	0xfffff7fbbf28  // b.none
   0x0000fffff7fbbcf8:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbbcfc:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbbd00:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbbd04:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbbd08:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbbd0c:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fbbd10:	36d801d1	tbz	w17, #27, 0xfffff7fbbd48
   0x0000fffff7fbbd14:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbbd18:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbbd1c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbbd20:	54000281	b.ne	0xfffff7fbbd70  // b.any
   0x0000fffff7fbbd24:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fbbd28:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbbd2c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbbd30:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbbd34:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbbd38:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbbd3c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbbd40:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbbd44:	54000169	b.ls	0xfffff7fbbd70  // b.plast
   0x0000fffff7fbbd48:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbbd4c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbbd50:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbbd54:	36d80091	tbz	w17, #27, 0xfffff7fbbd64
   0x0000fffff7fbbd58:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbbd5c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbbd60:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbbd64:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fbbd68:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fbbd6c:	1400000e	b	0xfffff7fbbda4
   0x0000fffff7fbbd70:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbbd74:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbbd78:	aa1303e1	mov	x1, x19
   0x0000fffff7fbbd7c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbbd80:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fbbd84:	aa1403e4	mov	x4, x20
   0x0000fffff7fbbd88:	aa1603e5	mov	x5, x22
   0x0000fffff7fbbd8c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fbbd90:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbbd94:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbbd98:	d63f0200	blr	x16
   0x0000fffff7fbbd9c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbbda0:	54000c80	b.eq	0xfffff7fbbf30  // b.none
   0x0000fffff7fbbda4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbbda8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbbdac:	540003a0	b.eq	0xfffff7fbbe20  // b.none
   0x0000fffff7fbbdb0:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fbbdb4:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fbbdb8:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbbdbc:	36d801d1	tbz	w17, #27, 0xfffff7fbbdf4
   0x0000fffff7fbbdc0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbbdc4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbbdc8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbbdcc:	540002a1	b.ne	0xfffff7fbbe20  // b.any
   0x0000fffff7fbbdd0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbbdd4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbbdd8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbbddc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbbde0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbbde4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbbde8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbbdec:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbbdf0:	54000189	b.ls	0xfffff7fbbe20  // b.plast
   0x0000fffff7fbbdf4:	36d8008d	tbz	w13, #27, 0xfffff7fbbe04
   0x0000fffff7fbbdf8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbbdfc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbbe00:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbbe04:	36d80091	tbz	w17, #27, 0xfffff7fbbe14
   0x0000fffff7fbbe08:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbbe0c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbbe10:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbbe14:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbbe18:	b900016d	str	w13, [x11]
   0x0000fffff7fbbe1c:	1400000e	b	0xfffff7fbbe54
   0x0000fffff7fbbe20:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbbe24:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbbe28:	aa1303e1	mov	x1, x19
   0x0000fffff7fbbe2c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbbe30:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fbbe34:	aa1403e4	mov	x4, x20
   0x0000fffff7fbbe38:	aa1603e5	mov	x5, x22
   0x0000fffff7fbbe3c:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fbbe40:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbbe44:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbbe48:	d63f0200	blr	x16
   0x0000fffff7fbbe4c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbbe50:	54000740	b.eq	0xfffff7fbbf38  // b.none
   0x0000fffff7fbbe54:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbbe58:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbbe5c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbbe60:	aa1503e2	mov	x2, x21
   0x0000fffff7fbbe64:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fbbe68:	aa1403e4	mov	x4, x20
   0x0000fffff7fbbe6c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbbe70:	d2869090	mov	x16, #0x3484                	// #13444
   0x0000fffff7fbbe74:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbbe78:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbbe7c:	d63f0200	blr	x16
   0x0000fffff7fbbe80:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fbbe84:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fbbe88:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fbbe8c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fbbe90:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fbbe94:	d65f03c0	ret
   0x0000fffff7fbbe98:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbbe9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbea0:	b900028a	str	w10, [x20]
   0x0000fffff7fbbea4:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fbbea8:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fbbeac:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fbbeb0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fbbeb4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fbbeb8:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fbbebc:	d65f03c0	ret
   0x0000fffff7fbbec0:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fbbec4:	17fffff5	b	0xfffff7fbbe98
   0x0000fffff7fbbec8:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fbbecc:	17fffff3	b	0xfffff7fbbe98
   0x0000fffff7fbbed0:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fbbed4:	17fffff1	b	0xfffff7fbbe98
   0x0000fffff7fbbed8:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7fbbedc:	17ffffef	b	0xfffff7fbbe98
   0x0000fffff7fbbee0:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7fbbee4:	17ffffed	b	0xfffff7fbbe98
   0x0000fffff7fbbee8:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fbbeec:	17ffffeb	b	0xfffff7fbbe98
   0x0000fffff7fbbef0:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fbbef4:	17ffffe9	b	0xfffff7fbbe98
   0x0000fffff7fbbef8:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fbbefc:	17ffffe7	b	0xfffff7fbbe98
   0x0000fffff7fbbf00:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fbbf04:	17ffffe5	b	0xfffff7fbbe98
   0x0000fffff7fbbf08:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fbbf0c:	17ffffe3	b	0xfffff7fbbe98
   0x0000fffff7fbbf10:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fbbf14:	17ffffe1	b	0xfffff7fbbe98
   0x0000fffff7fbbf18:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fbbf1c:	17ffffdf	b	0xfffff7fbbe98
   0x0000fffff7fbbf20:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fbbf24:	17ffffdd	b	0xfffff7fbbe98
   0x0000fffff7fbbf28:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fbbf2c:	17ffffdb	b	0xfffff7fbbe98
   0x0000fffff7fbbf30:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fbbf34:	17ffffd9	b	0xfffff7fbbe98
   0x0000fffff7fbbf38:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fbbf3c:	17ffffd7	b	0xfffff7fbbe98
   0x0000fffff7fbbf40:	00000000	udf	#0
   0x0000fffff7fbbf44:	00000000	udf	#0
   0x0000fffff7fbbf48:	00000000	udf	#0
   0x0000fffff7fbbf4c:	00000000	udf	#0
   0x0000fffff7fbbf50:	00000000	udf	#0
   0x0000fffff7fbbf54:	00000000	udf	#0
   0x0000fffff7fbbf58:	00000000	udf	#0
   0x0000fffff7fbbf5c:	00000000	udf	#0
   0x0000fffff7fbbf60:	00000000	udf	#0
   0x0000fffff7fbbf64:	00000000	udf	#0
   0x0000fffff7fbbf68:	00000000	udf	#0
   0x0000fffff7fbbf6c:	00000000	udf	#0
   0x0000fffff7fbbf70:	00000000	udf	#0
   0x0000fffff7fbbf74:	00000000	udf	#0
   0x0000fffff7fbbf78:	00000000	udf	#0
   0x0000fffff7fbbf7c:	00000000	udf	#0
   0x0000fffff7fbbf80:	00000000	udf	#0
   0x0000fffff7fbbf84:	00000000	udf	#0
   0x0000fffff7fbbf88:	00000000	udf	#0
   0x0000fffff7fbbf8c:	00000000	udf	#0
   0x0000fffff7fbbf90:	00000000	udf	#0
   0x0000fffff7fbbf94:	00000000	udf	#0
   0x0000fffff7fbbf98:	00000000	udf	#0
   0x0000fffff7fbbf9c:	00000000	udf	#0
   0x0000fffff7fbbfa0:	00000000	udf	#0
   0x0000fffff7fbbfa4:	00000000	udf	#0
   0x0000fffff7fbbfa8:	00000000	udf	#0
   0x0000fffff7fbbfac:	00000000	udf	#0
   0x0000fffff7fbbfb0:	00000000	udf	#0
   0x0000fffff7fbbfb4:	00000000	udf	#0
   0x0000fffff7fbbfb8:	00000000	udf	#0
   0x0000fffff7fbbfbc:	00000000	udf	#0
   0x0000fffff7fbbfc0:	00000000	udf	#0
   0x0000fffff7fbbfc4:	00000000	udf	#0
   0x0000fffff7fbbfc8:	00000000	udf	#0
   0x0000fffff7fbbfcc:	00000000	udf	#0
   0x0000fffff7fbbfd0:	00000000	udf	#0
   0x0000fffff7fbbfd4:	00000000	udf	#0
   0x0000fffff7fbbfd8:	00000000	udf	#0
   0x0000fffff7fbbfdc:	00000000	udf	#0
   0x0000fffff7fbbfe0:	00000000	udf	#0
   0x0000fffff7fbbfe4:	00000000	udf	#0
   0x0000fffff7fbbfe8:	00000000	udf	#0
   0x0000fffff7fbbfec:	00000000	udf	#0
   0x0000fffff7fbbff0:	00000000	udf	#0
   0x0000fffff7fbbff4:	00000000	udf	#0
   0x0000fffff7fbbff8:	00000000	udf	#0
   0x0000fffff7fbbffc:	00000000	udf	#0
End of assembler dump.
