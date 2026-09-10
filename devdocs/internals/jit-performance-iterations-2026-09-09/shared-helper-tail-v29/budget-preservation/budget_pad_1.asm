Dump of assembler code from 0xfffff7fbc000 to 0xfffff7fbe000:
   0x0000fffff7fbc000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fbc004:	910003fd	mov	x29, sp
   0x0000fffff7fbc008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fbc00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fbc010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fbc014:	aa0003f3	mov	x19, x0
   0x0000fffff7fbc018:	aa0103f4	mov	x20, x1
   0x0000fffff7fbc01c:	aa0203f5	mov	x21, x2
   0x0000fffff7fbc020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fbc024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fbc028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fbc02c:	f90003e9	str	x9, [sp]
   0x0000fffff7fbc030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fbc034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fbc038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fbc03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fbc040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc044:	d63f0200	blr	x16
   0x0000fffff7fbc048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fbc04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fbc050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fbc054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fbc058:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbc05c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbc060:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbc064:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbc068:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbc06c:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7fbc070:	36d801d1	tbz	w17, #27, 0xfffff7fbc0a8
   0x0000fffff7fbc074:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbc078:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbc07c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbc080:	54000281	b.ne	0xfffff7fbc0d0  // b.any
   0x0000fffff7fbc084:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7fbc088:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc08c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbc090:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbc094:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbc098:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbc09c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbc0a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbc0a4:	54000169	b.ls	0xfffff7fbc0d0  // b.plast
   0x0000fffff7fbc0a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbc0ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbc0b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbc0b4:	36d80091	tbz	w17, #27, 0xfffff7fbc0c4
   0x0000fffff7fbc0b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc0bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbc0c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbc0c4:	f900166c	str	x12, [x19, #40]
   0x0000fffff7fbc0c8:	b900226d	str	w13, [x19, #32]
   0x0000fffff7fbc0cc:	1400000e	b	0xfffff7fbc104
   0x0000fffff7fbc0d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbc0d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc0d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc0dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc0e0:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fbc0e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc0e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc0ec:	d2956a10	mov	x16, #0xab50                	// #43856
   0x0000fffff7fbc0f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbc0f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc0f8:	d63f0200	blr	x16
   0x0000fffff7fbc0fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc100:	5400eee0	b.eq	0xfffff7fbdedc  // b.none
   0x0000fffff7fbc104:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fbc108:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fbc10c:	d280002c	mov	x12, #0x1                   	// #1
   0x0000fffff7fbc110:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fbc114:	36d80211	tbz	w17, #27, 0xfffff7fbc154
   0x0000fffff7fbc118:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbc11c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbc120:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbc124:	540001e1	b.ne	0xfffff7fbc160  // b.any
   0x0000fffff7fbc128:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fbc12c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc130:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbc134:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbc138:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbc13c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbc140:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbc144:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbc148:	540000c9	b.ls	0xfffff7fbc160  // b.plast
   0x0000fffff7fbc14c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbc150:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbc154:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fbc158:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fbc15c:	1400000e	b	0xfffff7fbc194
   0x0000fffff7fbc160:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbc164:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc168:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc16c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc170:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fbc174:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc178:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc17c:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7fbc180:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbc184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc188:	d63f0200	blr	x16
   0x0000fffff7fbc18c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc190:	5400eaa0	b.eq	0xfffff7fbdee4  // b.none
   0x0000fffff7fbc194:	b940126d	ldr	w13, [x19, #16]
   0x0000fffff7fbc198:	f9400e6c	ldr	x12, [x19, #24]
   0x0000fffff7fbc19c:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7fbc1a0:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fbc1a4:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fbc1a8:	54000100	b.eq	0xfffff7fbc1c8  // b.none
   0x0000fffff7fbc1ac:	5290000a	mov	w10, #0x8000                	// #32768
   0x0000fffff7fbc1b0:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fbc1b4:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fbc1b8:	54000a21	b.ne	0xfffff7fbc2fc  // b.any
   0x0000fffff7fbc1bc:	f9401d8b	ldr	x11, [x12, #56]
   0x0000fffff7fbc1c0:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7fbc1c4:	14000002	b	0xfffff7fbc1cc
   0x0000fffff7fbc1c8:	aa0c03eb	mov	x11, x12
   0x0000fffff7fbc1cc:	f9402569	ldr	x9, [x11, #72]
   0x0000fffff7fbc1d0:	d1000529	sub	x9, x9, #0x1
   0x0000fffff7fbc1d4:	d298b66a	mov	x10, #0xc5b3                	// #50611
   0x0000fffff7fbc1d8:	f2a00f0a	movk	x10, #0x78, lsl #16
   0x0000fffff7fbc1dc:	8a09014a	and	x10, x10, x9
   0x0000fffff7fbc1e0:	f940216b	ldr	x11, [x11, #64]
   0x0000fffff7fbc1e4:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fbc1e8:	9b097d4a	mul	x10, x10, x9
   0x0000fffff7fbc1ec:	8b0a016b	add	x11, x11, x10
   0x0000fffff7fbc1f0:	b9401169	ldr	w9, [x11, #16]
   0x0000fffff7fbc1f4:	5280020a	mov	w10, #0x10                  	// #16
   0x0000fffff7fbc1f8:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7fbc1fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc200:	540007e1	b.ne	0xfffff7fbc2fc  // b.any
   0x0000fffff7fbc204:	f9400d69	ldr	x9, [x11, #24]
   0x0000fffff7fbc208:	d299ba0a	mov	x10, #0xcdd0                	// #52688
   0x0000fffff7fbc20c:	f2b5580a	movk	x10, #0xaac0, lsl #16
   0x0000fffff7fbc210:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7fbc214:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc218:	54000721	b.ne	0xfffff7fbc2fc  // b.any
   0x0000fffff7fbc21c:	9100016b	add	x11, x11, #0x0
   0x0000fffff7fbc220:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7fbc224:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fbc228:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fbc22c:	540002a0	b.eq	0xfffff7fbc280  // b.none
   0x0000fffff7fbc230:	b9400169	ldr	w9, [x11]
   0x0000fffff7fbc234:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc238:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc23c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc240:	540005e1	b.ne	0xfffff7fbc2fc  // b.any
   0x0000fffff7fbc244:	f9400569	ldr	x9, [x11, #8]
   0x0000fffff7fbc248:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7fbc24c:	f2a0400a	movk	x10, #0x200, lsl #16
   0x0000fffff7fbc250:	8a0a012a	and	x10, x9, x10
   0x0000fffff7fbc254:	f100015f	cmp	x10, #0x0
   0x0000fffff7fbc258:	54000520	b.eq	0xfffff7fbc2fc  // b.none
   0x0000fffff7fbc25c:	d29fffea	mov	x10, #0xffff                	// #65535
   0x0000fffff7fbc260:	f2a01fea	movk	x10, #0xff, lsl #16
   0x0000fffff7fbc264:	8a0a0129	and	x9, x9, x10
   0x0000fffff7fbc268:	f9401d8a	ldr	x10, [x12, #56]
   0x0000fffff7fbc26c:	f940254a	ldr	x10, [x10, #72]
   0x0000fffff7fbc270:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc274:	54000442	b.cs	0xfffff7fbc2fc  // b.hs, b.nlast
   0x0000fffff7fbc278:	9101618b	add	x11, x12, #0x58
   0x0000fffff7fbc27c:	8b09116b	add	x11, x11, x9, lsl #4
   0x0000fffff7fbc280:	b90013ed	str	w13, [sp, #16]
   0x0000fffff7fbc284:	f9000fec	str	x12, [sp, #24]
   0x0000fffff7fbc288:	f90017eb	str	x11, [sp, #40]
   0x0000fffff7fbc28c:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbc290:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbc294:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbc298:	36d801d1	tbz	w17, #27, 0xfffff7fbc2d0
   0x0000fffff7fbc29c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbc2a0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbc2a4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbc2a8:	540002a1	b.ne	0xfffff7fbc2fc  // b.any
   0x0000fffff7fbc2ac:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbc2b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc2b4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbc2b8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbc2bc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbc2c0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbc2c4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbc2c8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbc2cc:	54000189	b.ls	0xfffff7fbc2fc  // b.plast
   0x0000fffff7fbc2d0:	36d8008d	tbz	w13, #27, 0xfffff7fbc2e0
   0x0000fffff7fbc2d4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbc2d8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbc2dc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbc2e0:	36d80091	tbz	w17, #27, 0xfffff7fbc2f0
   0x0000fffff7fbc2e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc2e8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbc2ec:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbc2f0:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbc2f4:	b900016d	str	w13, [x11]
   0x0000fffff7fbc2f8:	1400000e	b	0xfffff7fbc330
   0x0000fffff7fbc2fc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbc300:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc304:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc308:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc30c:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fbc310:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc314:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc318:	d282a010	mov	x16, #0x1500                	// #5376
   0x0000fffff7fbc31c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbc320:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc324:	d63f0200	blr	x16
   0x0000fffff7fbc328:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc32c:	5400de00	b.eq	0xfffff7fbdeec  // b.none
   0x0000fffff7fbc330:	14000001	b	0xfffff7fbc334
   0x0000fffff7fbc334:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fbc338:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fbc33c:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fbc340:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fbc344:	36d80211	tbz	w17, #27, 0xfffff7fbc384
   0x0000fffff7fbc348:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbc34c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbc350:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbc354:	540001e1	b.ne	0xfffff7fbc390  // b.any
   0x0000fffff7fbc358:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fbc35c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc360:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbc364:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbc368:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbc36c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbc370:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbc374:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbc378:	540000c9	b.ls	0xfffff7fbc390  // b.plast
   0x0000fffff7fbc37c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbc380:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbc384:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fbc388:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fbc38c:	1400000e	b	0xfffff7fbc3c4
   0x0000fffff7fbc390:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbc394:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc398:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc39c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc3a0:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7fbc3a4:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc3a8:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc3ac:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7fbc3b0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbc3b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc3b8:	d63f0200	blr	x16
   0x0000fffff7fbc3bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc3c0:	5400d9a0	b.eq	0xfffff7fbdef4  // b.none
   0x0000fffff7fbc3c4:	b940126d	ldr	w13, [x19, #16]
   0x0000fffff7fbc3c8:	f9400e6c	ldr	x12, [x19, #24]
   0x0000fffff7fbc3cc:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7fbc3d0:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fbc3d4:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fbc3d8:	54000100	b.eq	0xfffff7fbc3f8  // b.none
   0x0000fffff7fbc3dc:	5290000a	mov	w10, #0x8000                	// #32768
   0x0000fffff7fbc3e0:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fbc3e4:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fbc3e8:	54000b21	b.ne	0xfffff7fbc54c  // b.any
   0x0000fffff7fbc3ec:	f9401d8b	ldr	x11, [x12, #56]
   0x0000fffff7fbc3f0:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7fbc3f4:	14000002	b	0xfffff7fbc3fc
   0x0000fffff7fbc3f8:	aa0c03eb	mov	x11, x12
   0x0000fffff7fbc3fc:	f9402569	ldr	x9, [x11, #72]
   0x0000fffff7fbc400:	d1000529	sub	x9, x9, #0x1
   0x0000fffff7fbc404:	d29ba34a	mov	x10, #0xdd1a                	// #56602
   0x0000fffff7fbc408:	f2a2374a	movk	x10, #0x11ba, lsl #16
   0x0000fffff7fbc40c:	8a09014a	and	x10, x10, x9
   0x0000fffff7fbc410:	f940216b	ldr	x11, [x11, #64]
   0x0000fffff7fbc414:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fbc418:	9b097d4a	mul	x10, x10, x9
   0x0000fffff7fbc41c:	8b0a016b	add	x11, x11, x10
   0x0000fffff7fbc420:	b9401169	ldr	w9, [x11, #16]
   0x0000fffff7fbc424:	5280020a	mov	w10, #0x10                  	// #16
   0x0000fffff7fbc428:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7fbc42c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc430:	540008e1	b.ne	0xfffff7fbc54c  // b.any
   0x0000fffff7fbc434:	f9400d69	ldr	x9, [x11, #24]
   0x0000fffff7fbc438:	d299de0a	mov	x10, #0xcef0                	// #52976
   0x0000fffff7fbc43c:	f2b5580a	movk	x10, #0xaac0, lsl #16
   0x0000fffff7fbc440:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7fbc444:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc448:	54000821	b.ne	0xfffff7fbc54c  // b.any
   0x0000fffff7fbc44c:	9100016b	add	x11, x11, #0x0
   0x0000fffff7fbc450:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7fbc454:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fbc458:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fbc45c:	540002a0	b.eq	0xfffff7fbc4b0  // b.none
   0x0000fffff7fbc460:	b9400169	ldr	w9, [x11]
   0x0000fffff7fbc464:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc468:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc46c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc470:	540006e1	b.ne	0xfffff7fbc54c  // b.any
   0x0000fffff7fbc474:	f9400569	ldr	x9, [x11, #8]
   0x0000fffff7fbc478:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7fbc47c:	f2a0400a	movk	x10, #0x200, lsl #16
   0x0000fffff7fbc480:	8a0a012a	and	x10, x9, x10
   0x0000fffff7fbc484:	f100015f	cmp	x10, #0x0
   0x0000fffff7fbc488:	54000620	b.eq	0xfffff7fbc54c  // b.none
   0x0000fffff7fbc48c:	d29fffea	mov	x10, #0xffff                	// #65535
   0x0000fffff7fbc490:	f2a01fea	movk	x10, #0xff, lsl #16
   0x0000fffff7fbc494:	8a0a0129	and	x9, x9, x10
   0x0000fffff7fbc498:	f9401d8a	ldr	x10, [x12, #56]
   0x0000fffff7fbc49c:	f940254a	ldr	x10, [x10, #72]
   0x0000fffff7fbc4a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc4a4:	54000542	b.cs	0xfffff7fbc54c  // b.hs, b.nlast
   0x0000fffff7fbc4a8:	9101618b	add	x11, x12, #0x58
   0x0000fffff7fbc4ac:	8b09116b	add	x11, x11, x9, lsl #4
   0x0000fffff7fbc4b0:	b90033ed	str	w13, [sp, #48]
   0x0000fffff7fbc4b4:	f9001fec	str	x12, [sp, #56]
   0x0000fffff7fbc4b8:	f90027eb	str	x11, [sp, #72]
   0x0000fffff7fbc4bc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbc4c0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbc4c4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbc4c8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbc4cc:	54000400	b.eq	0xfffff7fbc54c  // b.none
   0x0000fffff7fbc4d0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbc4d4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbc4d8:	36d801d1	tbz	w17, #27, 0xfffff7fbc510
   0x0000fffff7fbc4dc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbc4e0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbc4e4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbc4e8:	54000321	b.ne	0xfffff7fbc54c  // b.any
   0x0000fffff7fbc4ec:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbc4f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc4f4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbc4f8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbc4fc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbc500:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbc504:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbc508:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbc50c:	54000209	b.ls	0xfffff7fbc54c  // b.plast
   0x0000fffff7fbc510:	36d8008d	tbz	w13, #27, 0xfffff7fbc520
   0x0000fffff7fbc514:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbc518:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbc51c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbc520:	36d80091	tbz	w17, #27, 0xfffff7fbc530
   0x0000fffff7fbc524:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc528:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbc52c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbc530:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fbc534:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbc538:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbc53c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbc540:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbc544:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbc548:	1400000e	b	0xfffff7fbc580
   0x0000fffff7fbc54c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbc550:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc554:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc558:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc55c:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fbc560:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc564:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc568:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fbc56c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbc570:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc574:	d63f0200	blr	x16
   0x0000fffff7fbc578:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc57c:	5400cc00	b.eq	0xfffff7fbdefc  // b.none
   0x0000fffff7fbc580:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbc584:	37d806a9	tbnz	w9, #27, 0xfffff7fbc658
   0x0000fffff7fbc588:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbc58c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc590:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc594:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc598:	540001c1	b.ne	0xfffff7fbc5d0  // b.any
   0x0000fffff7fbc59c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbc5a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc5a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc5a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc5ac:	54000121	b.ne	0xfffff7fbc5d0  // b.any
   0x0000fffff7fbc5b0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbc5b4:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fbc5b8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbc5bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc5c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc5c4:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbc5c8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbc5cc:	14000030	b	0xfffff7fbc68c
   0x0000fffff7fbc5d0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbc5d4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbc5d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc5dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc5e0:	54000120	b.eq	0xfffff7fbc604  // b.none
   0x0000fffff7fbc5e4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbc5e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc5ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc5f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc5f4:	54000321	b.ne	0xfffff7fbc658  // b.any
   0x0000fffff7fbc5f8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbc5fc:	9e620120	scvtf	d0, x9
   0x0000fffff7fbc600:	14000002	b	0xfffff7fbc608
   0x0000fffff7fbc604:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbc608:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbc60c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbc610:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc614:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc618:	54000120	b.eq	0xfffff7fbc63c  // b.none
   0x0000fffff7fbc61c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbc620:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc624:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc628:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc62c:	54000161	b.ne	0xfffff7fbc658  // b.any
   0x0000fffff7fbc630:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbc634:	9e620121	scvtf	d1, x9
   0x0000fffff7fbc638:	14000002	b	0xfffff7fbc640
   0x0000fffff7fbc63c:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fbc640:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbc644:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbc648:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbc64c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc650:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbc654:	17ffffde	b	0xfffff7fbc5cc
   0x0000fffff7fbc658:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbc65c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc660:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc664:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc668:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fbc66c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc670:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc674:	d294c490	mov	x16, #0xa624                	// #42532
   0x0000fffff7fbc678:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbc67c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc680:	d63f0200	blr	x16
   0x0000fffff7fbc684:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc688:	5400c3e0	b.eq	0xfffff7fbdf04  // b.none
   0x0000fffff7fbc68c:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbc690:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbc694:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbc698:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbc69c:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbc6a0:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbc6a4:	36d801d1	tbz	w17, #27, 0xfffff7fbc6dc
   0x0000fffff7fbc6a8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbc6ac:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbc6b0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbc6b4:	54000281	b.ne	0xfffff7fbc704  // b.any
   0x0000fffff7fbc6b8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbc6bc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc6c0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbc6c4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbc6c8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbc6cc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbc6d0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbc6d4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbc6d8:	54000169	b.ls	0xfffff7fbc704  // b.plast
   0x0000fffff7fbc6dc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbc6e0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbc6e4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbc6e8:	36d80091	tbz	w17, #27, 0xfffff7fbc6f8
   0x0000fffff7fbc6ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc6f0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbc6f4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbc6f8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbc6fc:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbc700:	1400000e	b	0xfffff7fbc738
   0x0000fffff7fbc704:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbc708:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc70c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc710:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc714:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fbc718:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc71c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc720:	d2956a10	mov	x16, #0xab50                	// #43856
   0x0000fffff7fbc724:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbc728:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc72c:	d63f0200	blr	x16
   0x0000fffff7fbc730:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc734:	5400bec0	b.eq	0xfffff7fbdf0c  // b.none
   0x0000fffff7fbc738:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbc73c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbc740:	540003a0	b.eq	0xfffff7fbc7b4  // b.none
   0x0000fffff7fbc744:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbc748:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbc74c:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbc750:	36d801d1	tbz	w17, #27, 0xfffff7fbc788
   0x0000fffff7fbc754:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbc758:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbc75c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbc760:	540002a1	b.ne	0xfffff7fbc7b4  // b.any
   0x0000fffff7fbc764:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbc768:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc76c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbc770:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbc774:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbc778:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbc77c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbc780:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbc784:	54000189	b.ls	0xfffff7fbc7b4  // b.plast
   0x0000fffff7fbc788:	36d8008d	tbz	w13, #27, 0xfffff7fbc798
   0x0000fffff7fbc78c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbc790:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbc794:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbc798:	36d80091	tbz	w17, #27, 0xfffff7fbc7a8
   0x0000fffff7fbc79c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc7a0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbc7a4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbc7a8:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbc7ac:	b900016d	str	w13, [x11]
   0x0000fffff7fbc7b0:	1400000e	b	0xfffff7fbc7e8
   0x0000fffff7fbc7b4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbc7b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc7bc:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc7c0:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc7c4:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fbc7c8:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc7cc:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc7d0:	d282a010	mov	x16, #0x1500                	// #5376
   0x0000fffff7fbc7d4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbc7d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc7dc:	d63f0200	blr	x16
   0x0000fffff7fbc7e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc7e4:	5400b980	b.eq	0xfffff7fbdf14  // b.none
   0x0000fffff7fbc7e8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbc7ec:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbc7f0:	540004a0	b.eq	0xfffff7fbc884  // b.none
   0x0000fffff7fbc7f4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbc7f8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbc7fc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbc800:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbc804:	54000400	b.eq	0xfffff7fbc884  // b.none
   0x0000fffff7fbc808:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbc80c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbc810:	36d801d1	tbz	w17, #27, 0xfffff7fbc848
   0x0000fffff7fbc814:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbc818:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbc81c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbc820:	54000321	b.ne	0xfffff7fbc884  // b.any
   0x0000fffff7fbc824:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbc828:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc82c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbc830:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbc834:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbc838:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbc83c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbc840:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbc844:	54000209	b.ls	0xfffff7fbc884  // b.plast
   0x0000fffff7fbc848:	36d8008d	tbz	w13, #27, 0xfffff7fbc858
   0x0000fffff7fbc84c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbc850:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbc854:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbc858:	36d80091	tbz	w17, #27, 0xfffff7fbc868
   0x0000fffff7fbc85c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc860:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbc864:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbc868:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fbc86c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbc870:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbc874:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbc878:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbc87c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbc880:	1400000e	b	0xfffff7fbc8b8
   0x0000fffff7fbc884:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbc888:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc88c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc890:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc894:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fbc898:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc89c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc8a0:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fbc8a4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbc8a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc8ac:	d63f0200	blr	x16
   0x0000fffff7fbc8b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc8b4:	5400b340	b.eq	0xfffff7fbdf1c  // b.none
   0x0000fffff7fbc8b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbc8bc:	37d806a9	tbnz	w9, #27, 0xfffff7fbc990
   0x0000fffff7fbc8c0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbc8c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc8c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc8cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc8d0:	540001c1	b.ne	0xfffff7fbc908  // b.any
   0x0000fffff7fbc8d4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbc8d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc8dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc8e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc8e4:	54000121	b.ne	0xfffff7fbc908  // b.any
   0x0000fffff7fbc8e8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbc8ec:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fbc8f0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbc8f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc8f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc8fc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbc900:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbc904:	14000030	b	0xfffff7fbc9c4
   0x0000fffff7fbc908:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbc90c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbc910:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc914:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc918:	54000120	b.eq	0xfffff7fbc93c  // b.none
   0x0000fffff7fbc91c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbc920:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc924:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc928:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc92c:	54000321	b.ne	0xfffff7fbc990  // b.any
   0x0000fffff7fbc930:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbc934:	9e620120	scvtf	d0, x9
   0x0000fffff7fbc938:	14000002	b	0xfffff7fbc940
   0x0000fffff7fbc93c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbc940:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbc944:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbc948:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc94c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc950:	54000120	b.eq	0xfffff7fbc974  // b.none
   0x0000fffff7fbc954:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbc958:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc95c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc960:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc964:	54000161	b.ne	0xfffff7fbc990  // b.any
   0x0000fffff7fbc968:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbc96c:	9e620121	scvtf	d1, x9
   0x0000fffff7fbc970:	14000002	b	0xfffff7fbc978
   0x0000fffff7fbc974:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fbc978:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbc97c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbc980:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbc984:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc988:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbc98c:	17ffffde	b	0xfffff7fbc904
   0x0000fffff7fbc990:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbc994:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc998:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc99c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc9a0:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fbc9a4:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc9a8:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc9ac:	d294c490	mov	x16, #0xa624                	// #42532
   0x0000fffff7fbc9b0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbc9b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc9b8:	d63f0200	blr	x16
   0x0000fffff7fbc9bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc9c0:	5400ab20	b.eq	0xfffff7fbdf24  // b.none
   0x0000fffff7fbc9c4:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbc9c8:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbc9cc:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbc9d0:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbc9d4:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbc9d8:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbc9dc:	36d801d1	tbz	w17, #27, 0xfffff7fbca14
   0x0000fffff7fbc9e0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbc9e4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbc9e8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbc9ec:	54000281	b.ne	0xfffff7fbca3c  // b.any
   0x0000fffff7fbc9f0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbc9f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc9f8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbc9fc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbca00:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbca04:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbca08:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbca0c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbca10:	54000169	b.ls	0xfffff7fbca3c  // b.plast
   0x0000fffff7fbca14:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbca18:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbca1c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbca20:	36d80091	tbz	w17, #27, 0xfffff7fbca30
   0x0000fffff7fbca24:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbca28:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbca2c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbca30:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbca34:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbca38:	1400000e	b	0xfffff7fbca70
   0x0000fffff7fbca3c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbca40:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbca44:	aa1303e1	mov	x1, x19
   0x0000fffff7fbca48:	aa1503e2	mov	x2, x21
   0x0000fffff7fbca4c:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fbca50:	aa1403e4	mov	x4, x20
   0x0000fffff7fbca54:	aa1603e5	mov	x5, x22
   0x0000fffff7fbca58:	d2956a10	mov	x16, #0xab50                	// #43856
   0x0000fffff7fbca5c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbca60:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbca64:	d63f0200	blr	x16
   0x0000fffff7fbca68:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbca6c:	5400a600	b.eq	0xfffff7fbdf2c  // b.none
   0x0000fffff7fbca70:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbca74:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbca78:	540003a0	b.eq	0xfffff7fbcaec  // b.none
   0x0000fffff7fbca7c:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbca80:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbca84:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbca88:	36d801d1	tbz	w17, #27, 0xfffff7fbcac0
   0x0000fffff7fbca8c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbca90:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbca94:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbca98:	540002a1	b.ne	0xfffff7fbcaec  // b.any
   0x0000fffff7fbca9c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbcaa0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbcaa4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbcaa8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbcaac:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbcab0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbcab4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbcab8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbcabc:	54000189	b.ls	0xfffff7fbcaec  // b.plast
   0x0000fffff7fbcac0:	36d8008d	tbz	w13, #27, 0xfffff7fbcad0
   0x0000fffff7fbcac4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbcac8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbcacc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbcad0:	36d80091	tbz	w17, #27, 0xfffff7fbcae0
   0x0000fffff7fbcad4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbcad8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbcadc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbcae0:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbcae4:	b900016d	str	w13, [x11]
   0x0000fffff7fbcae8:	1400000e	b	0xfffff7fbcb20
   0x0000fffff7fbcaec:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbcaf0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbcaf4:	aa1303e1	mov	x1, x19
   0x0000fffff7fbcaf8:	aa1503e2	mov	x2, x21
   0x0000fffff7fbcafc:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fbcb00:	aa1403e4	mov	x4, x20
   0x0000fffff7fbcb04:	aa1603e5	mov	x5, x22
   0x0000fffff7fbcb08:	d282a010	mov	x16, #0x1500                	// #5376
   0x0000fffff7fbcb0c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbcb10:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbcb14:	d63f0200	blr	x16
   0x0000fffff7fbcb18:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbcb1c:	5400a0c0	b.eq	0xfffff7fbdf34  // b.none
   0x0000fffff7fbcb20:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbcb24:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbcb28:	540004a0	b.eq	0xfffff7fbcbbc  // b.none
   0x0000fffff7fbcb2c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbcb30:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbcb34:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbcb38:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbcb3c:	54000400	b.eq	0xfffff7fbcbbc  // b.none
   0x0000fffff7fbcb40:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbcb44:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbcb48:	36d801d1	tbz	w17, #27, 0xfffff7fbcb80
   0x0000fffff7fbcb4c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbcb50:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbcb54:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbcb58:	54000321	b.ne	0xfffff7fbcbbc  // b.any
   0x0000fffff7fbcb5c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbcb60:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbcb64:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbcb68:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbcb6c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbcb70:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbcb74:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbcb78:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbcb7c:	54000209	b.ls	0xfffff7fbcbbc  // b.plast
   0x0000fffff7fbcb80:	36d8008d	tbz	w13, #27, 0xfffff7fbcb90
   0x0000fffff7fbcb84:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbcb88:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbcb8c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbcb90:	36d80091	tbz	w17, #27, 0xfffff7fbcba0
   0x0000fffff7fbcb94:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbcb98:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbcb9c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbcba0:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fbcba4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbcba8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbcbac:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbcbb0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbcbb4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbcbb8:	1400000e	b	0xfffff7fbcbf0
   0x0000fffff7fbcbbc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbcbc0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbcbc4:	aa1303e1	mov	x1, x19
   0x0000fffff7fbcbc8:	aa1503e2	mov	x2, x21
   0x0000fffff7fbcbcc:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fbcbd0:	aa1403e4	mov	x4, x20
   0x0000fffff7fbcbd4:	aa1603e5	mov	x5, x22
   0x0000fffff7fbcbd8:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fbcbdc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbcbe0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbcbe4:	d63f0200	blr	x16
   0x0000fffff7fbcbe8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbcbec:	54009a80	b.eq	0xfffff7fbdf3c  // b.none
   0x0000fffff7fbcbf0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbcbf4:	37d806a9	tbnz	w9, #27, 0xfffff7fbccc8
   0x0000fffff7fbcbf8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbcbfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbcc00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcc04:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcc08:	540001c1	b.ne	0xfffff7fbcc40  // b.any
   0x0000fffff7fbcc0c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbcc10:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbcc14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcc18:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcc1c:	54000121	b.ne	0xfffff7fbcc40  // b.any
   0x0000fffff7fbcc20:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbcc24:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fbcc28:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbcc2c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbcc30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcc34:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbcc38:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbcc3c:	14000030	b	0xfffff7fbccfc
   0x0000fffff7fbcc40:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbcc44:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbcc48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcc4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcc50:	54000120	b.eq	0xfffff7fbcc74  // b.none
   0x0000fffff7fbcc54:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbcc58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbcc5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcc60:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcc64:	54000321	b.ne	0xfffff7fbccc8  // b.any
   0x0000fffff7fbcc68:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbcc6c:	9e620120	scvtf	d0, x9
   0x0000fffff7fbcc70:	14000002	b	0xfffff7fbcc78
   0x0000fffff7fbcc74:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbcc78:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbcc7c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbcc80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcc84:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcc88:	54000120	b.eq	0xfffff7fbccac  // b.none
   0x0000fffff7fbcc8c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbcc90:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbcc94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcc98:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcc9c:	54000161	b.ne	0xfffff7fbccc8  // b.any
   0x0000fffff7fbcca0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbcca4:	9e620121	scvtf	d1, x9
   0x0000fffff7fbcca8:	14000002	b	0xfffff7fbccb0
   0x0000fffff7fbccac:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fbccb0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbccb4:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbccb8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbccbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbccc0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbccc4:	17ffffde	b	0xfffff7fbcc3c
   0x0000fffff7fbccc8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbcccc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbccd0:	aa1303e1	mov	x1, x19
   0x0000fffff7fbccd4:	aa1503e2	mov	x2, x21
   0x0000fffff7fbccd8:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fbccdc:	aa1403e4	mov	x4, x20
   0x0000fffff7fbcce0:	aa1603e5	mov	x5, x22
   0x0000fffff7fbcce4:	d294c490	mov	x16, #0xa624                	// #42532
   0x0000fffff7fbcce8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbccec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbccf0:	d63f0200	blr	x16
   0x0000fffff7fbccf4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbccf8:	54009260	b.eq	0xfffff7fbdf44  // b.none
   0x0000fffff7fbccfc:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbcd00:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbcd04:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbcd08:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbcd0c:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbcd10:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbcd14:	36d801d1	tbz	w17, #27, 0xfffff7fbcd4c
   0x0000fffff7fbcd18:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbcd1c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbcd20:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbcd24:	54000281	b.ne	0xfffff7fbcd74  // b.any
   0x0000fffff7fbcd28:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbcd2c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbcd30:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbcd34:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbcd38:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbcd3c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbcd40:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbcd44:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbcd48:	54000169	b.ls	0xfffff7fbcd74  // b.plast
   0x0000fffff7fbcd4c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbcd50:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbcd54:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbcd58:	36d80091	tbz	w17, #27, 0xfffff7fbcd68
   0x0000fffff7fbcd5c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbcd60:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbcd64:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbcd68:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbcd6c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbcd70:	1400000e	b	0xfffff7fbcda8
   0x0000fffff7fbcd74:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbcd78:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbcd7c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbcd80:	aa1503e2	mov	x2, x21
   0x0000fffff7fbcd84:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fbcd88:	aa1403e4	mov	x4, x20
   0x0000fffff7fbcd8c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbcd90:	d2956a10	mov	x16, #0xab50                	// #43856
   0x0000fffff7fbcd94:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbcd98:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbcd9c:	d63f0200	blr	x16
   0x0000fffff7fbcda0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbcda4:	54008d40	b.eq	0xfffff7fbdf4c  // b.none
   0x0000fffff7fbcda8:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbcdac:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbcdb0:	540003a0	b.eq	0xfffff7fbce24  // b.none
   0x0000fffff7fbcdb4:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbcdb8:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbcdbc:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbcdc0:	36d801d1	tbz	w17, #27, 0xfffff7fbcdf8
   0x0000fffff7fbcdc4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbcdc8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbcdcc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbcdd0:	540002a1	b.ne	0xfffff7fbce24  // b.any
   0x0000fffff7fbcdd4:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbcdd8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbcddc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbcde0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbcde4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbcde8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbcdec:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbcdf0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbcdf4:	54000189	b.ls	0xfffff7fbce24  // b.plast
   0x0000fffff7fbcdf8:	36d8008d	tbz	w13, #27, 0xfffff7fbce08
   0x0000fffff7fbcdfc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbce00:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbce04:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbce08:	36d80091	tbz	w17, #27, 0xfffff7fbce18
   0x0000fffff7fbce0c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbce10:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbce14:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbce18:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbce1c:	b900016d	str	w13, [x11]
   0x0000fffff7fbce20:	1400000e	b	0xfffff7fbce58
   0x0000fffff7fbce24:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbce28:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbce2c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbce30:	aa1503e2	mov	x2, x21
   0x0000fffff7fbce34:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fbce38:	aa1403e4	mov	x4, x20
   0x0000fffff7fbce3c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbce40:	d282a010	mov	x16, #0x1500                	// #5376
   0x0000fffff7fbce44:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbce48:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbce4c:	d63f0200	blr	x16
   0x0000fffff7fbce50:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbce54:	54008800	b.eq	0xfffff7fbdf54  // b.none
   0x0000fffff7fbce58:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbce5c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbce60:	540004a0	b.eq	0xfffff7fbcef4  // b.none
   0x0000fffff7fbce64:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbce68:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbce6c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbce70:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbce74:	54000400	b.eq	0xfffff7fbcef4  // b.none
   0x0000fffff7fbce78:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbce7c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbce80:	36d801d1	tbz	w17, #27, 0xfffff7fbceb8
   0x0000fffff7fbce84:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbce88:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbce8c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbce90:	54000321	b.ne	0xfffff7fbcef4  // b.any
   0x0000fffff7fbce94:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbce98:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbce9c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbcea0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbcea4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbcea8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbceac:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbceb0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbceb4:	54000209	b.ls	0xfffff7fbcef4  // b.plast
   0x0000fffff7fbceb8:	36d8008d	tbz	w13, #27, 0xfffff7fbcec8
   0x0000fffff7fbcebc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbcec0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbcec4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbcec8:	36d80091	tbz	w17, #27, 0xfffff7fbced8
   0x0000fffff7fbcecc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbced0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbced4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbced8:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fbcedc:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbcee0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbcee4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbcee8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbceec:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbcef0:	1400000e	b	0xfffff7fbcf28
   0x0000fffff7fbcef4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbcef8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbcefc:	aa1303e1	mov	x1, x19
   0x0000fffff7fbcf00:	aa1503e2	mov	x2, x21
   0x0000fffff7fbcf04:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fbcf08:	aa1403e4	mov	x4, x20
   0x0000fffff7fbcf0c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbcf10:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fbcf14:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbcf18:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbcf1c:	d63f0200	blr	x16
   0x0000fffff7fbcf20:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbcf24:	540081c0	b.eq	0xfffff7fbdf5c  // b.none
   0x0000fffff7fbcf28:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbcf2c:	37d806a9	tbnz	w9, #27, 0xfffff7fbd000
   0x0000fffff7fbcf30:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbcf34:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbcf38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcf3c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcf40:	540001c1	b.ne	0xfffff7fbcf78  // b.any
   0x0000fffff7fbcf44:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbcf48:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbcf4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcf50:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcf54:	54000121	b.ne	0xfffff7fbcf78  // b.any
   0x0000fffff7fbcf58:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbcf5c:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fbcf60:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbcf64:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbcf68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcf6c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbcf70:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbcf74:	14000030	b	0xfffff7fbd034
   0x0000fffff7fbcf78:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbcf7c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbcf80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcf84:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcf88:	54000120	b.eq	0xfffff7fbcfac  // b.none
   0x0000fffff7fbcf8c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbcf90:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbcf94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcf98:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcf9c:	54000321	b.ne	0xfffff7fbd000  // b.any
   0x0000fffff7fbcfa0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbcfa4:	9e620120	scvtf	d0, x9
   0x0000fffff7fbcfa8:	14000002	b	0xfffff7fbcfb0
   0x0000fffff7fbcfac:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbcfb0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbcfb4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbcfb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcfbc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcfc0:	54000120	b.eq	0xfffff7fbcfe4  // b.none
   0x0000fffff7fbcfc4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbcfc8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbcfcc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcfd0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcfd4:	54000161	b.ne	0xfffff7fbd000  // b.any
   0x0000fffff7fbcfd8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbcfdc:	9e620121	scvtf	d1, x9
   0x0000fffff7fbcfe0:	14000002	b	0xfffff7fbcfe8
   0x0000fffff7fbcfe4:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fbcfe8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbcfec:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbcff0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbcff4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcff8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbcffc:	17ffffde	b	0xfffff7fbcf74
   0x0000fffff7fbd000:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbd004:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd008:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd00c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd010:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fbd014:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd018:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd01c:	d294c490	mov	x16, #0xa624                	// #42532
   0x0000fffff7fbd020:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbd024:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd028:	d63f0200	blr	x16
   0x0000fffff7fbd02c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd030:	540079a0	b.eq	0xfffff7fbdf64  // b.none
   0x0000fffff7fbd034:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbd038:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbd03c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbd040:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbd044:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbd048:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbd04c:	36d801d1	tbz	w17, #27, 0xfffff7fbd084
   0x0000fffff7fbd050:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbd054:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbd058:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbd05c:	54000281	b.ne	0xfffff7fbd0ac  // b.any
   0x0000fffff7fbd060:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbd064:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd068:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbd06c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbd070:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbd074:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbd078:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbd07c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbd080:	54000169	b.ls	0xfffff7fbd0ac  // b.plast
   0x0000fffff7fbd084:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbd088:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbd08c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbd090:	36d80091	tbz	w17, #27, 0xfffff7fbd0a0
   0x0000fffff7fbd094:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd098:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbd09c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbd0a0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbd0a4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbd0a8:	1400000e	b	0xfffff7fbd0e0
   0x0000fffff7fbd0ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbd0b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd0b4:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd0b8:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd0bc:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fbd0c0:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd0c4:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd0c8:	d2956a10	mov	x16, #0xab50                	// #43856
   0x0000fffff7fbd0cc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbd0d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd0d4:	d63f0200	blr	x16
   0x0000fffff7fbd0d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd0dc:	54007480	b.eq	0xfffff7fbdf6c  // b.none
   0x0000fffff7fbd0e0:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbd0e4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbd0e8:	540003a0	b.eq	0xfffff7fbd15c  // b.none
   0x0000fffff7fbd0ec:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbd0f0:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbd0f4:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbd0f8:	36d801d1	tbz	w17, #27, 0xfffff7fbd130
   0x0000fffff7fbd0fc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbd100:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbd104:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbd108:	540002a1	b.ne	0xfffff7fbd15c  // b.any
   0x0000fffff7fbd10c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbd110:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd114:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbd118:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbd11c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbd120:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbd124:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbd128:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbd12c:	54000189	b.ls	0xfffff7fbd15c  // b.plast
   0x0000fffff7fbd130:	36d8008d	tbz	w13, #27, 0xfffff7fbd140
   0x0000fffff7fbd134:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbd138:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbd13c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbd140:	36d80091	tbz	w17, #27, 0xfffff7fbd150
   0x0000fffff7fbd144:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd148:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbd14c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbd150:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbd154:	b900016d	str	w13, [x11]
   0x0000fffff7fbd158:	1400000e	b	0xfffff7fbd190
   0x0000fffff7fbd15c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbd160:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd164:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd168:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd16c:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fbd170:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd174:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd178:	d282a010	mov	x16, #0x1500                	// #5376
   0x0000fffff7fbd17c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbd180:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd184:	d63f0200	blr	x16
   0x0000fffff7fbd188:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd18c:	54006f40	b.eq	0xfffff7fbdf74  // b.none
   0x0000fffff7fbd190:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbd194:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbd198:	540004a0	b.eq	0xfffff7fbd22c  // b.none
   0x0000fffff7fbd19c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbd1a0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbd1a4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbd1a8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbd1ac:	54000400	b.eq	0xfffff7fbd22c  // b.none
   0x0000fffff7fbd1b0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbd1b4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbd1b8:	36d801d1	tbz	w17, #27, 0xfffff7fbd1f0
   0x0000fffff7fbd1bc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbd1c0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbd1c4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbd1c8:	54000321	b.ne	0xfffff7fbd22c  // b.any
   0x0000fffff7fbd1cc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbd1d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd1d4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbd1d8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbd1dc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbd1e0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbd1e4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbd1e8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbd1ec:	54000209	b.ls	0xfffff7fbd22c  // b.plast
   0x0000fffff7fbd1f0:	36d8008d	tbz	w13, #27, 0xfffff7fbd200
   0x0000fffff7fbd1f4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbd1f8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbd1fc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbd200:	36d80091	tbz	w17, #27, 0xfffff7fbd210
   0x0000fffff7fbd204:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd208:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbd20c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbd210:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fbd214:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbd218:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbd21c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbd220:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbd224:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbd228:	1400000e	b	0xfffff7fbd260
   0x0000fffff7fbd22c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbd230:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd234:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd238:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd23c:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fbd240:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd244:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd248:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fbd24c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbd250:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd254:	d63f0200	blr	x16
   0x0000fffff7fbd258:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd25c:	54006900	b.eq	0xfffff7fbdf7c  // b.none
   0x0000fffff7fbd260:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbd264:	37d806a9	tbnz	w9, #27, 0xfffff7fbd338
   0x0000fffff7fbd268:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbd26c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd270:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd274:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd278:	540001c1	b.ne	0xfffff7fbd2b0  // b.any
   0x0000fffff7fbd27c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd280:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd284:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd288:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd28c:	54000121	b.ne	0xfffff7fbd2b0  // b.any
   0x0000fffff7fbd290:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbd294:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fbd298:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbd29c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd2a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd2a4:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbd2a8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbd2ac:	14000030	b	0xfffff7fbd36c
   0x0000fffff7fbd2b0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbd2b4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd2b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd2bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd2c0:	54000120	b.eq	0xfffff7fbd2e4  // b.none
   0x0000fffff7fbd2c4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbd2c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd2cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd2d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd2d4:	54000321	b.ne	0xfffff7fbd338  // b.any
   0x0000fffff7fbd2d8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbd2dc:	9e620120	scvtf	d0, x9
   0x0000fffff7fbd2e0:	14000002	b	0xfffff7fbd2e8
   0x0000fffff7fbd2e4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbd2e8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd2ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd2f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd2f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd2f8:	54000120	b.eq	0xfffff7fbd31c  // b.none
   0x0000fffff7fbd2fc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd300:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd304:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd308:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd30c:	54000161	b.ne	0xfffff7fbd338  // b.any
   0x0000fffff7fbd310:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbd314:	9e620121	scvtf	d1, x9
   0x0000fffff7fbd318:	14000002	b	0xfffff7fbd320
   0x0000fffff7fbd31c:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fbd320:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbd324:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbd328:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd32c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd330:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbd334:	17ffffde	b	0xfffff7fbd2ac
   0x0000fffff7fbd338:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbd33c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd340:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd344:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd348:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fbd34c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd350:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd354:	d294c490	mov	x16, #0xa624                	// #42532
   0x0000fffff7fbd358:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbd35c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd360:	d63f0200	blr	x16
   0x0000fffff7fbd364:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd368:	540060e0	b.eq	0xfffff7fbdf84  // b.none
   0x0000fffff7fbd36c:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbd370:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbd374:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbd378:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbd37c:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbd380:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbd384:	36d801d1	tbz	w17, #27, 0xfffff7fbd3bc
   0x0000fffff7fbd388:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbd38c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbd390:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbd394:	54000281	b.ne	0xfffff7fbd3e4  // b.any
   0x0000fffff7fbd398:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbd39c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd3a0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbd3a4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbd3a8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbd3ac:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbd3b0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbd3b4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbd3b8:	54000169	b.ls	0xfffff7fbd3e4  // b.plast
   0x0000fffff7fbd3bc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbd3c0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbd3c4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbd3c8:	36d80091	tbz	w17, #27, 0xfffff7fbd3d8
   0x0000fffff7fbd3cc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd3d0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbd3d4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbd3d8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbd3dc:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbd3e0:	1400000e	b	0xfffff7fbd418
   0x0000fffff7fbd3e4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbd3e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd3ec:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd3f0:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd3f4:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fbd3f8:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd3fc:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd400:	d2956a10	mov	x16, #0xab50                	// #43856
   0x0000fffff7fbd404:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbd408:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd40c:	d63f0200	blr	x16
   0x0000fffff7fbd410:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd414:	54005bc0	b.eq	0xfffff7fbdf8c  // b.none
   0x0000fffff7fbd418:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbd41c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbd420:	540003a0	b.eq	0xfffff7fbd494  // b.none
   0x0000fffff7fbd424:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbd428:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbd42c:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbd430:	36d801d1	tbz	w17, #27, 0xfffff7fbd468
   0x0000fffff7fbd434:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbd438:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbd43c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbd440:	540002a1	b.ne	0xfffff7fbd494  // b.any
   0x0000fffff7fbd444:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbd448:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd44c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbd450:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbd454:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbd458:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbd45c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbd460:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbd464:	54000189	b.ls	0xfffff7fbd494  // b.plast
   0x0000fffff7fbd468:	36d8008d	tbz	w13, #27, 0xfffff7fbd478
   0x0000fffff7fbd46c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbd470:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbd474:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbd478:	36d80091	tbz	w17, #27, 0xfffff7fbd488
   0x0000fffff7fbd47c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd480:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbd484:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbd488:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbd48c:	b900016d	str	w13, [x11]
   0x0000fffff7fbd490:	1400000e	b	0xfffff7fbd4c8
   0x0000fffff7fbd494:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbd498:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd49c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd4a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd4a4:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fbd4a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd4ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd4b0:	d282a010	mov	x16, #0x1500                	// #5376
   0x0000fffff7fbd4b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbd4b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd4bc:	d63f0200	blr	x16
   0x0000fffff7fbd4c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd4c4:	54005680	b.eq	0xfffff7fbdf94  // b.none
   0x0000fffff7fbd4c8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbd4cc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbd4d0:	540004a0	b.eq	0xfffff7fbd564  // b.none
   0x0000fffff7fbd4d4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbd4d8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbd4dc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbd4e0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbd4e4:	54000400	b.eq	0xfffff7fbd564  // b.none
   0x0000fffff7fbd4e8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbd4ec:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbd4f0:	36d801d1	tbz	w17, #27, 0xfffff7fbd528
   0x0000fffff7fbd4f4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbd4f8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbd4fc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbd500:	54000321	b.ne	0xfffff7fbd564  // b.any
   0x0000fffff7fbd504:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbd508:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd50c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbd510:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbd514:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbd518:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbd51c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbd520:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbd524:	54000209	b.ls	0xfffff7fbd564  // b.plast
   0x0000fffff7fbd528:	36d8008d	tbz	w13, #27, 0xfffff7fbd538
   0x0000fffff7fbd52c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbd530:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbd534:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbd538:	36d80091	tbz	w17, #27, 0xfffff7fbd548
   0x0000fffff7fbd53c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd540:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbd544:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbd548:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fbd54c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbd550:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbd554:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbd558:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbd55c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbd560:	1400000e	b	0xfffff7fbd598
   0x0000fffff7fbd564:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbd568:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd56c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd570:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd574:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fbd578:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd57c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd580:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fbd584:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbd588:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd58c:	d63f0200	blr	x16
   0x0000fffff7fbd590:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd594:	54005040	b.eq	0xfffff7fbdf9c  // b.none
   0x0000fffff7fbd598:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbd59c:	37d806a9	tbnz	w9, #27, 0xfffff7fbd670
   0x0000fffff7fbd5a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbd5a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd5a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd5ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd5b0:	540001c1	b.ne	0xfffff7fbd5e8  // b.any
   0x0000fffff7fbd5b4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd5b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd5bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd5c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd5c4:	54000121	b.ne	0xfffff7fbd5e8  // b.any
   0x0000fffff7fbd5c8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbd5cc:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fbd5d0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbd5d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd5d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd5dc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbd5e0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbd5e4:	14000030	b	0xfffff7fbd6a4
   0x0000fffff7fbd5e8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbd5ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd5f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd5f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd5f8:	54000120	b.eq	0xfffff7fbd61c  // b.none
   0x0000fffff7fbd5fc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbd600:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd604:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd608:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd60c:	54000321	b.ne	0xfffff7fbd670  // b.any
   0x0000fffff7fbd610:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbd614:	9e620120	scvtf	d0, x9
   0x0000fffff7fbd618:	14000002	b	0xfffff7fbd620
   0x0000fffff7fbd61c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbd620:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd624:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd628:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd62c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd630:	54000120	b.eq	0xfffff7fbd654  // b.none
   0x0000fffff7fbd634:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd638:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd63c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd640:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd644:	54000161	b.ne	0xfffff7fbd670  // b.any
   0x0000fffff7fbd648:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbd64c:	9e620121	scvtf	d1, x9
   0x0000fffff7fbd650:	14000002	b	0xfffff7fbd658
   0x0000fffff7fbd654:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fbd658:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbd65c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbd660:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd664:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd668:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbd66c:	17ffffde	b	0xfffff7fbd5e4
   0x0000fffff7fbd670:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbd674:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd678:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd67c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd680:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fbd684:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd688:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd68c:	d294c490	mov	x16, #0xa624                	// #42532
   0x0000fffff7fbd690:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbd694:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd698:	d63f0200	blr	x16
   0x0000fffff7fbd69c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd6a0:	54004820	b.eq	0xfffff7fbdfa4  // b.none
   0x0000fffff7fbd6a4:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbd6a8:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbd6ac:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbd6b0:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbd6b4:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbd6b8:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbd6bc:	36d801d1	tbz	w17, #27, 0xfffff7fbd6f4
   0x0000fffff7fbd6c0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbd6c4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbd6c8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbd6cc:	54000281	b.ne	0xfffff7fbd71c  // b.any
   0x0000fffff7fbd6d0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbd6d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd6d8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbd6dc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbd6e0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbd6e4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbd6e8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbd6ec:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbd6f0:	54000169	b.ls	0xfffff7fbd71c  // b.plast
   0x0000fffff7fbd6f4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbd6f8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbd6fc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbd700:	36d80091	tbz	w17, #27, 0xfffff7fbd710
   0x0000fffff7fbd704:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd708:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbd70c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbd710:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbd714:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbd718:	1400000e	b	0xfffff7fbd750
   0x0000fffff7fbd71c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbd720:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd724:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd728:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd72c:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fbd730:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd734:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd738:	d2956a10	mov	x16, #0xab50                	// #43856
   0x0000fffff7fbd73c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbd740:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd744:	d63f0200	blr	x16
   0x0000fffff7fbd748:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd74c:	54004300	b.eq	0xfffff7fbdfac  // b.none
   0x0000fffff7fbd750:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbd754:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbd758:	540003a0	b.eq	0xfffff7fbd7cc  // b.none
   0x0000fffff7fbd75c:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbd760:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbd764:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbd768:	36d801d1	tbz	w17, #27, 0xfffff7fbd7a0
   0x0000fffff7fbd76c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbd770:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbd774:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbd778:	540002a1	b.ne	0xfffff7fbd7cc  // b.any
   0x0000fffff7fbd77c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbd780:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd784:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbd788:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbd78c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbd790:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbd794:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbd798:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbd79c:	54000189	b.ls	0xfffff7fbd7cc  // b.plast
   0x0000fffff7fbd7a0:	36d8008d	tbz	w13, #27, 0xfffff7fbd7b0
   0x0000fffff7fbd7a4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbd7a8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbd7ac:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbd7b0:	36d80091	tbz	w17, #27, 0xfffff7fbd7c0
   0x0000fffff7fbd7b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd7b8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbd7bc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbd7c0:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbd7c4:	b900016d	str	w13, [x11]
   0x0000fffff7fbd7c8:	1400000e	b	0xfffff7fbd800
   0x0000fffff7fbd7cc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbd7d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd7d4:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd7d8:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd7dc:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fbd7e0:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd7e4:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd7e8:	d282a010	mov	x16, #0x1500                	// #5376
   0x0000fffff7fbd7ec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbd7f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd7f4:	d63f0200	blr	x16
   0x0000fffff7fbd7f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd7fc:	54003dc0	b.eq	0xfffff7fbdfb4  // b.none
   0x0000fffff7fbd800:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbd804:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbd808:	540004a0	b.eq	0xfffff7fbd89c  // b.none
   0x0000fffff7fbd80c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbd810:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbd814:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbd818:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbd81c:	54000400	b.eq	0xfffff7fbd89c  // b.none
   0x0000fffff7fbd820:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbd824:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbd828:	36d801d1	tbz	w17, #27, 0xfffff7fbd860
   0x0000fffff7fbd82c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbd830:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbd834:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbd838:	54000321	b.ne	0xfffff7fbd89c  // b.any
   0x0000fffff7fbd83c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbd840:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd844:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbd848:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbd84c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbd850:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbd854:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbd858:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbd85c:	54000209	b.ls	0xfffff7fbd89c  // b.plast
   0x0000fffff7fbd860:	36d8008d	tbz	w13, #27, 0xfffff7fbd870
   0x0000fffff7fbd864:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbd868:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbd86c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbd870:	36d80091	tbz	w17, #27, 0xfffff7fbd880
   0x0000fffff7fbd874:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd878:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbd87c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbd880:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fbd884:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbd888:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbd88c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbd890:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbd894:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbd898:	1400000e	b	0xfffff7fbd8d0
   0x0000fffff7fbd89c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbd8a0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd8a4:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd8a8:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd8ac:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fbd8b0:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd8b4:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd8b8:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fbd8bc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbd8c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd8c4:	d63f0200	blr	x16
   0x0000fffff7fbd8c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd8cc:	54003780	b.eq	0xfffff7fbdfbc  // b.none
   0x0000fffff7fbd8d0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbd8d4:	37d806a9	tbnz	w9, #27, 0xfffff7fbd9a8
   0x0000fffff7fbd8d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbd8dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd8e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd8e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd8e8:	540001c1	b.ne	0xfffff7fbd920  // b.any
   0x0000fffff7fbd8ec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd8f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd8f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd8f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd8fc:	54000121	b.ne	0xfffff7fbd920  // b.any
   0x0000fffff7fbd900:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbd904:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fbd908:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbd90c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd910:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd914:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbd918:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbd91c:	14000030	b	0xfffff7fbd9dc
   0x0000fffff7fbd920:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbd924:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd928:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd92c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd930:	54000120	b.eq	0xfffff7fbd954  // b.none
   0x0000fffff7fbd934:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbd938:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd93c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd940:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd944:	54000321	b.ne	0xfffff7fbd9a8  // b.any
   0x0000fffff7fbd948:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbd94c:	9e620120	scvtf	d0, x9
   0x0000fffff7fbd950:	14000002	b	0xfffff7fbd958
   0x0000fffff7fbd954:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbd958:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd95c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd960:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd964:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd968:	54000120	b.eq	0xfffff7fbd98c  // b.none
   0x0000fffff7fbd96c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd970:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd974:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd978:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd97c:	54000161	b.ne	0xfffff7fbd9a8  // b.any
   0x0000fffff7fbd980:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbd984:	9e620121	scvtf	d1, x9
   0x0000fffff7fbd988:	14000002	b	0xfffff7fbd990
   0x0000fffff7fbd98c:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fbd990:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbd994:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbd998:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd99c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd9a0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbd9a4:	17ffffde	b	0xfffff7fbd91c
   0x0000fffff7fbd9a8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbd9ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd9b0:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd9b4:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd9b8:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fbd9bc:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd9c0:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd9c4:	d294c490	mov	x16, #0xa624                	// #42532
   0x0000fffff7fbd9c8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbd9cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd9d0:	d63f0200	blr	x16
   0x0000fffff7fbd9d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd9d8:	54002f60	b.eq	0xfffff7fbdfc4  // b.none
   0x0000fffff7fbd9dc:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbd9e0:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbd9e4:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbd9e8:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbd9ec:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbd9f0:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbd9f4:	36d801d1	tbz	w17, #27, 0xfffff7fbda2c
   0x0000fffff7fbd9f8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbd9fc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbda00:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbda04:	54000281	b.ne	0xfffff7fbda54  // b.any
   0x0000fffff7fbda08:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbda0c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbda10:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbda14:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbda18:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbda1c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbda20:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbda24:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbda28:	54000169	b.ls	0xfffff7fbda54  // b.plast
   0x0000fffff7fbda2c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbda30:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbda34:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbda38:	36d80091	tbz	w17, #27, 0xfffff7fbda48
   0x0000fffff7fbda3c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbda40:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbda44:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbda48:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbda4c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbda50:	1400000e	b	0xfffff7fbda88
   0x0000fffff7fbda54:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbda58:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbda5c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbda60:	aa1503e2	mov	x2, x21
   0x0000fffff7fbda64:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fbda68:	aa1403e4	mov	x4, x20
   0x0000fffff7fbda6c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbda70:	d2956a10	mov	x16, #0xab50                	// #43856
   0x0000fffff7fbda74:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbda78:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbda7c:	d63f0200	blr	x16
   0x0000fffff7fbda80:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbda84:	54002a40	b.eq	0xfffff7fbdfcc  // b.none
   0x0000fffff7fbda88:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbda8c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbda90:	540003a0	b.eq	0xfffff7fbdb04  // b.none
   0x0000fffff7fbda94:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbda98:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbda9c:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbdaa0:	36d801d1	tbz	w17, #27, 0xfffff7fbdad8
   0x0000fffff7fbdaa4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbdaa8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbdaac:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbdab0:	540002a1	b.ne	0xfffff7fbdb04  // b.any
   0x0000fffff7fbdab4:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbdab8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbdabc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbdac0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbdac4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbdac8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbdacc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbdad0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbdad4:	54000189	b.ls	0xfffff7fbdb04  // b.plast
   0x0000fffff7fbdad8:	36d8008d	tbz	w13, #27, 0xfffff7fbdae8
   0x0000fffff7fbdadc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbdae0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbdae4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbdae8:	36d80091	tbz	w17, #27, 0xfffff7fbdaf8
   0x0000fffff7fbdaec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbdaf0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbdaf4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbdaf8:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbdafc:	b900016d	str	w13, [x11]
   0x0000fffff7fbdb00:	1400000e	b	0xfffff7fbdb38
   0x0000fffff7fbdb04:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbdb08:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbdb0c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbdb10:	aa1503e2	mov	x2, x21
   0x0000fffff7fbdb14:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fbdb18:	aa1403e4	mov	x4, x20
   0x0000fffff7fbdb1c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbdb20:	d282a010	mov	x16, #0x1500                	// #5376
   0x0000fffff7fbdb24:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbdb28:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbdb2c:	d63f0200	blr	x16
   0x0000fffff7fbdb30:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbdb34:	54002500	b.eq	0xfffff7fbdfd4  // b.none
   0x0000fffff7fbdb38:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbdb3c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbdb40:	540004a0	b.eq	0xfffff7fbdbd4  // b.none
   0x0000fffff7fbdb44:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbdb48:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbdb4c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbdb50:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbdb54:	54000400	b.eq	0xfffff7fbdbd4  // b.none
   0x0000fffff7fbdb58:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbdb5c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbdb60:	36d801d1	tbz	w17, #27, 0xfffff7fbdb98
   0x0000fffff7fbdb64:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbdb68:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbdb6c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbdb70:	54000321	b.ne	0xfffff7fbdbd4  // b.any
   0x0000fffff7fbdb74:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbdb78:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbdb7c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbdb80:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbdb84:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbdb88:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbdb8c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbdb90:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbdb94:	54000209	b.ls	0xfffff7fbdbd4  // b.plast
   0x0000fffff7fbdb98:	36d8008d	tbz	w13, #27, 0xfffff7fbdba8
   0x0000fffff7fbdb9c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbdba0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbdba4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbdba8:	36d80091	tbz	w17, #27, 0xfffff7fbdbb8
   0x0000fffff7fbdbac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbdbb0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbdbb4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbdbb8:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fbdbbc:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbdbc0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbdbc4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbdbc8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbdbcc:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbdbd0:	1400000e	b	0xfffff7fbdc08
   0x0000fffff7fbdbd4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbdbd8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbdbdc:	aa1303e1	mov	x1, x19
   0x0000fffff7fbdbe0:	aa1503e2	mov	x2, x21
   0x0000fffff7fbdbe4:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fbdbe8:	aa1403e4	mov	x4, x20
   0x0000fffff7fbdbec:	aa1603e5	mov	x5, x22
   0x0000fffff7fbdbf0:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fbdbf4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbdbf8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbdbfc:	d63f0200	blr	x16
   0x0000fffff7fbdc00:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbdc04:	54001ec0	b.eq	0xfffff7fbdfdc  // b.none
   0x0000fffff7fbdc08:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbdc0c:	37d806a9	tbnz	w9, #27, 0xfffff7fbdce0
   0x0000fffff7fbdc10:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbdc14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbdc18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbdc1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbdc20:	540001c1	b.ne	0xfffff7fbdc58  // b.any
   0x0000fffff7fbdc24:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbdc28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbdc2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbdc30:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbdc34:	54000121	b.ne	0xfffff7fbdc58  // b.any
   0x0000fffff7fbdc38:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbdc3c:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fbdc40:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbdc44:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbdc48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbdc4c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbdc50:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbdc54:	14000030	b	0xfffff7fbdd14
   0x0000fffff7fbdc58:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbdc5c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbdc60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbdc64:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbdc68:	54000120	b.eq	0xfffff7fbdc8c  // b.none
   0x0000fffff7fbdc6c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbdc70:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbdc74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbdc78:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbdc7c:	54000321	b.ne	0xfffff7fbdce0  // b.any
   0x0000fffff7fbdc80:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbdc84:	9e620120	scvtf	d0, x9
   0x0000fffff7fbdc88:	14000002	b	0xfffff7fbdc90
   0x0000fffff7fbdc8c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbdc90:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbdc94:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbdc98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbdc9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbdca0:	54000120	b.eq	0xfffff7fbdcc4  // b.none
   0x0000fffff7fbdca4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbdca8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbdcac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbdcb0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbdcb4:	54000161	b.ne	0xfffff7fbdce0  // b.any
   0x0000fffff7fbdcb8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbdcbc:	9e620121	scvtf	d1, x9
   0x0000fffff7fbdcc0:	14000002	b	0xfffff7fbdcc8
   0x0000fffff7fbdcc4:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fbdcc8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbdccc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbdcd0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbdcd4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbdcd8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbdcdc:	17ffffde	b	0xfffff7fbdc54
   0x0000fffff7fbdce0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbdce4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbdce8:	aa1303e1	mov	x1, x19
   0x0000fffff7fbdcec:	aa1503e2	mov	x2, x21
   0x0000fffff7fbdcf0:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fbdcf4:	aa1403e4	mov	x4, x20
   0x0000fffff7fbdcf8:	aa1603e5	mov	x5, x22
   0x0000fffff7fbdcfc:	d294c490	mov	x16, #0xa624                	// #42532
   0x0000fffff7fbdd00:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbdd04:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbdd08:	d63f0200	blr	x16
   0x0000fffff7fbdd0c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbdd10:	540016a0	b.eq	0xfffff7fbdfe4  // b.none
   0x0000fffff7fbdd14:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbdd18:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbdd1c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbdd20:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbdd24:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbdd28:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbdd2c:	36d801d1	tbz	w17, #27, 0xfffff7fbdd64
   0x0000fffff7fbdd30:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbdd34:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbdd38:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbdd3c:	54000281	b.ne	0xfffff7fbdd8c  // b.any
   0x0000fffff7fbdd40:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbdd44:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbdd48:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbdd4c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbdd50:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbdd54:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbdd58:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbdd5c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbdd60:	54000169	b.ls	0xfffff7fbdd8c  // b.plast
   0x0000fffff7fbdd64:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbdd68:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbdd6c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbdd70:	36d80091	tbz	w17, #27, 0xfffff7fbdd80
   0x0000fffff7fbdd74:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbdd78:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbdd7c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbdd80:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbdd84:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbdd88:	1400000e	b	0xfffff7fbddc0
   0x0000fffff7fbdd8c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbdd90:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbdd94:	aa1303e1	mov	x1, x19
   0x0000fffff7fbdd98:	aa1503e2	mov	x2, x21
   0x0000fffff7fbdd9c:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fbdda0:	aa1403e4	mov	x4, x20
   0x0000fffff7fbdda4:	aa1603e5	mov	x5, x22
   0x0000fffff7fbdda8:	d2956a10	mov	x16, #0xab50                	// #43856
   0x0000fffff7fbddac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbddb0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbddb4:	d63f0200	blr	x16
   0x0000fffff7fbddb8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbddbc:	54001180	b.eq	0xfffff7fbdfec  // b.none
   0x0000fffff7fbddc0:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbddc4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbddc8:	540003a0	b.eq	0xfffff7fbde3c  // b.none
   0x0000fffff7fbddcc:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbddd0:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbddd4:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbddd8:	36d801d1	tbz	w17, #27, 0xfffff7fbde10
   0x0000fffff7fbdddc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbdde0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbdde4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbdde8:	540002a1	b.ne	0xfffff7fbde3c  // b.any
   0x0000fffff7fbddec:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbddf0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbddf4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbddf8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbddfc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbde00:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbde04:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbde08:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbde0c:	54000189	b.ls	0xfffff7fbde3c  // b.plast
   0x0000fffff7fbde10:	36d8008d	tbz	w13, #27, 0xfffff7fbde20
   0x0000fffff7fbde14:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbde18:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbde1c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbde20:	36d80091	tbz	w17, #27, 0xfffff7fbde30
   0x0000fffff7fbde24:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbde28:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbde2c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbde30:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbde34:	b900016d	str	w13, [x11]
   0x0000fffff7fbde38:	1400000e	b	0xfffff7fbde70
   0x0000fffff7fbde3c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbde40:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbde44:	aa1303e1	mov	x1, x19
   0x0000fffff7fbde48:	aa1503e2	mov	x2, x21
   0x0000fffff7fbde4c:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fbde50:	aa1403e4	mov	x4, x20
   0x0000fffff7fbde54:	aa1603e5	mov	x5, x22
   0x0000fffff7fbde58:	d282a010	mov	x16, #0x1500                	// #5376
   0x0000fffff7fbde5c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbde60:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbde64:	d63f0200	blr	x16
   0x0000fffff7fbde68:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbde6c:	54000c40	b.eq	0xfffff7fbdff4  // b.none
   0x0000fffff7fbde70:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbde74:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbde78:	aa1303e1	mov	x1, x19
   0x0000fffff7fbde7c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbde80:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fbde84:	aa1403e4	mov	x4, x20
   0x0000fffff7fbde88:	aa1603e5	mov	x5, x22
   0x0000fffff7fbde8c:	d2869090	mov	x16, #0x3484                	// #13444
   0x0000fffff7fbde90:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbde94:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbde98:	d63f0200	blr	x16
   0x0000fffff7fbde9c:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fbdea0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fbdea4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fbdea8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fbdeac:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fbdeb0:	d65f03c0	ret
   0x0000fffff7fbdeb4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbdeb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbdebc:	b900028a	str	w10, [x20]
   0x0000fffff7fbdec0:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fbdec4:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fbdec8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fbdecc:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fbded0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fbded4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fbded8:	d65f03c0	ret
   0x0000fffff7fbdedc:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fbdee0:	17fffff5	b	0xfffff7fbdeb4
   0x0000fffff7fbdee4:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fbdee8:	17fffff3	b	0xfffff7fbdeb4
   0x0000fffff7fbdeec:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fbdef0:	17fffff1	b	0xfffff7fbdeb4
   0x0000fffff7fbdef4:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7fbdef8:	17ffffef	b	0xfffff7fbdeb4
   0x0000fffff7fbdefc:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fbdf00:	17ffffed	b	0xfffff7fbdeb4
   0x0000fffff7fbdf04:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fbdf08:	17ffffeb	b	0xfffff7fbdeb4
   0x0000fffff7fbdf0c:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fbdf10:	17ffffe9	b	0xfffff7fbdeb4
   0x0000fffff7fbdf14:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fbdf18:	17ffffe7	b	0xfffff7fbdeb4
   0x0000fffff7fbdf1c:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fbdf20:	17ffffe5	b	0xfffff7fbdeb4
   0x0000fffff7fbdf24:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fbdf28:	17ffffe3	b	0xfffff7fbdeb4
   0x0000fffff7fbdf2c:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fbdf30:	17ffffe1	b	0xfffff7fbdeb4
   0x0000fffff7fbdf34:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fbdf38:	17ffffdf	b	0xfffff7fbdeb4
   0x0000fffff7fbdf3c:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fbdf40:	17ffffdd	b	0xfffff7fbdeb4
   0x0000fffff7fbdf44:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fbdf48:	17ffffdb	b	0xfffff7fbdeb4
   0x0000fffff7fbdf4c:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fbdf50:	17ffffd9	b	0xfffff7fbdeb4
   0x0000fffff7fbdf54:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fbdf58:	17ffffd7	b	0xfffff7fbdeb4
   0x0000fffff7fbdf5c:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fbdf60:	17ffffd5	b	0xfffff7fbdeb4
   0x0000fffff7fbdf64:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fbdf68:	17ffffd3	b	0xfffff7fbdeb4
   0x0000fffff7fbdf6c:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fbdf70:	17ffffd1	b	0xfffff7fbdeb4
   0x0000fffff7fbdf74:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fbdf78:	17ffffcf	b	0xfffff7fbdeb4
   0x0000fffff7fbdf7c:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fbdf80:	17ffffcd	b	0xfffff7fbdeb4
   0x0000fffff7fbdf84:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fbdf88:	17ffffcb	b	0xfffff7fbdeb4
   0x0000fffff7fbdf8c:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fbdf90:	17ffffc9	b	0xfffff7fbdeb4
   0x0000fffff7fbdf94:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fbdf98:	17ffffc7	b	0xfffff7fbdeb4
   0x0000fffff7fbdf9c:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fbdfa0:	17ffffc5	b	0xfffff7fbdeb4
   0x0000fffff7fbdfa4:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fbdfa8:	17ffffc3	b	0xfffff7fbdeb4
   0x0000fffff7fbdfac:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fbdfb0:	17ffffc1	b	0xfffff7fbdeb4
   0x0000fffff7fbdfb4:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fbdfb8:	17ffffbf	b	0xfffff7fbdeb4
   0x0000fffff7fbdfbc:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fbdfc0:	17ffffbd	b	0xfffff7fbdeb4
   0x0000fffff7fbdfc4:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fbdfc8:	17ffffbb	b	0xfffff7fbdeb4
   0x0000fffff7fbdfcc:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fbdfd0:	17ffffb9	b	0xfffff7fbdeb4
   0x0000fffff7fbdfd4:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fbdfd8:	17ffffb7	b	0xfffff7fbdeb4
   0x0000fffff7fbdfdc:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fbdfe0:	17ffffb5	b	0xfffff7fbdeb4
   0x0000fffff7fbdfe4:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fbdfe8:	17ffffb3	b	0xfffff7fbdeb4
   0x0000fffff7fbdfec:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fbdff0:	17ffffb1	b	0xfffff7fbdeb4
   0x0000fffff7fbdff4:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fbdff8:	17ffffaf	b	0xfffff7fbdeb4
   0x0000fffff7fbdffc:	00000000	udf	#0
End of assembler dump.
