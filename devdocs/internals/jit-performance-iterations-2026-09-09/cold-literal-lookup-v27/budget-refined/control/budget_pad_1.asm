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
   0x0000fffff7fbc0ec:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fbc0f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbc0f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc0f8:	d63f0200	blr	x16
   0x0000fffff7fbc0fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc100:	5400d760	b.eq	0xfffff7fbdbec  // b.none
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
   0x0000fffff7fbc17c:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fbc180:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbc184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc188:	d63f0200	blr	x16
   0x0000fffff7fbc18c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc190:	5400d320	b.eq	0xfffff7fbdbf4  // b.none
   0x0000fffff7fbc194:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbc198:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc19c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc1a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc1a4:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fbc1a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc1ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc1b0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fbc1b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbc1b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc1bc:	d63f0200	blr	x16
   0x0000fffff7fbc1c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc1c4:	5400d1c0	b.eq	0xfffff7fbdbfc  // b.none
   0x0000fffff7fbc1c8:	14000001	b	0xfffff7fbc1cc
   0x0000fffff7fbc1cc:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fbc1d0:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fbc1d4:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fbc1d8:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fbc1dc:	36d80211	tbz	w17, #27, 0xfffff7fbc21c
   0x0000fffff7fbc1e0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbc1e4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbc1e8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbc1ec:	540001e1	b.ne	0xfffff7fbc228  // b.any
   0x0000fffff7fbc1f0:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fbc1f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc1f8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbc1fc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbc200:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbc204:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbc208:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbc20c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbc210:	540000c9	b.ls	0xfffff7fbc228  // b.plast
   0x0000fffff7fbc214:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbc218:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbc21c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fbc220:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fbc224:	1400000e	b	0xfffff7fbc25c
   0x0000fffff7fbc228:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbc22c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc230:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc234:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc238:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7fbc23c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc240:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc244:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fbc248:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbc24c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc250:	d63f0200	blr	x16
   0x0000fffff7fbc254:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc258:	5400cd60	b.eq	0xfffff7fbdc04  // b.none
   0x0000fffff7fbc25c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbc260:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc264:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc268:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc26c:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fbc270:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc274:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc278:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbc27c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbc280:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc284:	d63f0200	blr	x16
   0x0000fffff7fbc288:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc28c:	5400cc00	b.eq	0xfffff7fbdc0c  // b.none
   0x0000fffff7fbc290:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbc294:	37d806a9	tbnz	w9, #27, 0xfffff7fbc368
   0x0000fffff7fbc298:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbc29c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc2a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc2a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc2a8:	540001c1	b.ne	0xfffff7fbc2e0  // b.any
   0x0000fffff7fbc2ac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbc2b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc2b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc2b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc2bc:	54000121	b.ne	0xfffff7fbc2e0  // b.any
   0x0000fffff7fbc2c0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbc2c4:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fbc2c8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbc2cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc2d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc2d4:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbc2d8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbc2dc:	14000030	b	0xfffff7fbc39c
   0x0000fffff7fbc2e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbc2e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbc2e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc2ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc2f0:	54000120	b.eq	0xfffff7fbc314  // b.none
   0x0000fffff7fbc2f4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbc2f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc2fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc300:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc304:	54000321	b.ne	0xfffff7fbc368  // b.any
   0x0000fffff7fbc308:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbc30c:	9e620120	scvtf	d0, x9
   0x0000fffff7fbc310:	14000002	b	0xfffff7fbc318
   0x0000fffff7fbc314:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbc318:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbc31c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbc320:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc324:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc328:	54000120	b.eq	0xfffff7fbc34c  // b.none
   0x0000fffff7fbc32c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbc330:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc334:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc338:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc33c:	54000161	b.ne	0xfffff7fbc368  // b.any
   0x0000fffff7fbc340:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbc344:	9e620121	scvtf	d1, x9
   0x0000fffff7fbc348:	14000002	b	0xfffff7fbc350
   0x0000fffff7fbc34c:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fbc350:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbc354:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbc358:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbc35c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc360:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbc364:	17ffffde	b	0xfffff7fbc2dc
   0x0000fffff7fbc368:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbc36c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc370:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc374:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc378:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fbc37c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc380:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc384:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbc388:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbc38c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc390:	d63f0200	blr	x16
   0x0000fffff7fbc394:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc398:	5400c3e0	b.eq	0xfffff7fbdc14  // b.none
   0x0000fffff7fbc39c:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbc3a0:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbc3a4:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbc3a8:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbc3ac:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbc3b0:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbc3b4:	36d801d1	tbz	w17, #27, 0xfffff7fbc3ec
   0x0000fffff7fbc3b8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbc3bc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbc3c0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbc3c4:	54000281	b.ne	0xfffff7fbc414  // b.any
   0x0000fffff7fbc3c8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbc3cc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc3d0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbc3d4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbc3d8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbc3dc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbc3e0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbc3e4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbc3e8:	54000169	b.ls	0xfffff7fbc414  // b.plast
   0x0000fffff7fbc3ec:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbc3f0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbc3f4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbc3f8:	36d80091	tbz	w17, #27, 0xfffff7fbc408
   0x0000fffff7fbc3fc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc400:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbc404:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbc408:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbc40c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbc410:	1400000e	b	0xfffff7fbc448
   0x0000fffff7fbc414:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbc418:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc41c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc420:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc424:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fbc428:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc42c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc430:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fbc434:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbc438:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc43c:	d63f0200	blr	x16
   0x0000fffff7fbc440:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc444:	5400bec0	b.eq	0xfffff7fbdc1c  // b.none
   0x0000fffff7fbc448:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbc44c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbc450:	540003a0	b.eq	0xfffff7fbc4c4  // b.none
   0x0000fffff7fbc454:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbc458:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbc45c:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbc460:	36d801d1	tbz	w17, #27, 0xfffff7fbc498
   0x0000fffff7fbc464:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbc468:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbc46c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbc470:	540002a1	b.ne	0xfffff7fbc4c4  // b.any
   0x0000fffff7fbc474:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbc478:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc47c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbc480:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbc484:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbc488:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbc48c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbc490:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbc494:	54000189	b.ls	0xfffff7fbc4c4  // b.plast
   0x0000fffff7fbc498:	36d8008d	tbz	w13, #27, 0xfffff7fbc4a8
   0x0000fffff7fbc49c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbc4a0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbc4a4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbc4a8:	36d80091	tbz	w17, #27, 0xfffff7fbc4b8
   0x0000fffff7fbc4ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc4b0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbc4b4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbc4b8:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbc4bc:	b900016d	str	w13, [x11]
   0x0000fffff7fbc4c0:	1400000e	b	0xfffff7fbc4f8
   0x0000fffff7fbc4c4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbc4c8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc4cc:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc4d0:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc4d4:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fbc4d8:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc4dc:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc4e0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fbc4e4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbc4e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc4ec:	d63f0200	blr	x16
   0x0000fffff7fbc4f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc4f4:	5400b980	b.eq	0xfffff7fbdc24  // b.none
   0x0000fffff7fbc4f8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbc4fc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbc500:	540004a0	b.eq	0xfffff7fbc594  // b.none
   0x0000fffff7fbc504:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbc508:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbc50c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbc510:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbc514:	54000400	b.eq	0xfffff7fbc594  // b.none
   0x0000fffff7fbc518:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbc51c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbc520:	36d801d1	tbz	w17, #27, 0xfffff7fbc558
   0x0000fffff7fbc524:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbc528:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbc52c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbc530:	54000321	b.ne	0xfffff7fbc594  // b.any
   0x0000fffff7fbc534:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbc538:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc53c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbc540:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbc544:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbc548:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbc54c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbc550:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbc554:	54000209	b.ls	0xfffff7fbc594  // b.plast
   0x0000fffff7fbc558:	36d8008d	tbz	w13, #27, 0xfffff7fbc568
   0x0000fffff7fbc55c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbc560:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbc564:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbc568:	36d80091	tbz	w17, #27, 0xfffff7fbc578
   0x0000fffff7fbc56c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc570:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbc574:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbc578:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fbc57c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbc580:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbc584:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbc588:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbc58c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbc590:	1400000e	b	0xfffff7fbc5c8
   0x0000fffff7fbc594:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbc598:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc59c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc5a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc5a4:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fbc5a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc5ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc5b0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbc5b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbc5b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc5bc:	d63f0200	blr	x16
   0x0000fffff7fbc5c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc5c4:	5400b340	b.eq	0xfffff7fbdc2c  // b.none
   0x0000fffff7fbc5c8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbc5cc:	37d806a9	tbnz	w9, #27, 0xfffff7fbc6a0
   0x0000fffff7fbc5d0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbc5d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc5d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc5dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc5e0:	540001c1	b.ne	0xfffff7fbc618  // b.any
   0x0000fffff7fbc5e4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbc5e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc5ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc5f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc5f4:	54000121	b.ne	0xfffff7fbc618  // b.any
   0x0000fffff7fbc5f8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbc5fc:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fbc600:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbc604:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc608:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc60c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbc610:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbc614:	14000030	b	0xfffff7fbc6d4
   0x0000fffff7fbc618:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbc61c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbc620:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc624:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc628:	54000120	b.eq	0xfffff7fbc64c  // b.none
   0x0000fffff7fbc62c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbc630:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc634:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc638:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc63c:	54000321	b.ne	0xfffff7fbc6a0  // b.any
   0x0000fffff7fbc640:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbc644:	9e620120	scvtf	d0, x9
   0x0000fffff7fbc648:	14000002	b	0xfffff7fbc650
   0x0000fffff7fbc64c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbc650:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbc654:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbc658:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc65c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc660:	54000120	b.eq	0xfffff7fbc684  // b.none
   0x0000fffff7fbc664:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbc668:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc66c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc670:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc674:	54000161	b.ne	0xfffff7fbc6a0  // b.any
   0x0000fffff7fbc678:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbc67c:	9e620121	scvtf	d1, x9
   0x0000fffff7fbc680:	14000002	b	0xfffff7fbc688
   0x0000fffff7fbc684:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fbc688:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbc68c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbc690:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbc694:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc698:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbc69c:	17ffffde	b	0xfffff7fbc614
   0x0000fffff7fbc6a0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbc6a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc6a8:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc6ac:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc6b0:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fbc6b4:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc6b8:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc6bc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbc6c0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbc6c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc6c8:	d63f0200	blr	x16
   0x0000fffff7fbc6cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc6d0:	5400ab20	b.eq	0xfffff7fbdc34  // b.none
   0x0000fffff7fbc6d4:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbc6d8:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbc6dc:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbc6e0:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbc6e4:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbc6e8:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbc6ec:	36d801d1	tbz	w17, #27, 0xfffff7fbc724
   0x0000fffff7fbc6f0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbc6f4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbc6f8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbc6fc:	54000281	b.ne	0xfffff7fbc74c  // b.any
   0x0000fffff7fbc700:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbc704:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc708:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbc70c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbc710:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbc714:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbc718:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbc71c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbc720:	54000169	b.ls	0xfffff7fbc74c  // b.plast
   0x0000fffff7fbc724:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbc728:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbc72c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbc730:	36d80091	tbz	w17, #27, 0xfffff7fbc740
   0x0000fffff7fbc734:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc738:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbc73c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbc740:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbc744:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbc748:	1400000e	b	0xfffff7fbc780
   0x0000fffff7fbc74c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbc750:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc754:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc758:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc75c:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fbc760:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc764:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc768:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fbc76c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbc770:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc774:	d63f0200	blr	x16
   0x0000fffff7fbc778:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc77c:	5400a600	b.eq	0xfffff7fbdc3c  // b.none
   0x0000fffff7fbc780:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbc784:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbc788:	540003a0	b.eq	0xfffff7fbc7fc  // b.none
   0x0000fffff7fbc78c:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbc790:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbc794:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbc798:	36d801d1	tbz	w17, #27, 0xfffff7fbc7d0
   0x0000fffff7fbc79c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbc7a0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbc7a4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbc7a8:	540002a1	b.ne	0xfffff7fbc7fc  // b.any
   0x0000fffff7fbc7ac:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbc7b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc7b4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbc7b8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbc7bc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbc7c0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbc7c4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbc7c8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbc7cc:	54000189	b.ls	0xfffff7fbc7fc  // b.plast
   0x0000fffff7fbc7d0:	36d8008d	tbz	w13, #27, 0xfffff7fbc7e0
   0x0000fffff7fbc7d4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbc7d8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbc7dc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbc7e0:	36d80091	tbz	w17, #27, 0xfffff7fbc7f0
   0x0000fffff7fbc7e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc7e8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbc7ec:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbc7f0:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbc7f4:	b900016d	str	w13, [x11]
   0x0000fffff7fbc7f8:	1400000e	b	0xfffff7fbc830
   0x0000fffff7fbc7fc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbc800:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc804:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc808:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc80c:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fbc810:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc814:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc818:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fbc81c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbc820:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc824:	d63f0200	blr	x16
   0x0000fffff7fbc828:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc82c:	5400a0c0	b.eq	0xfffff7fbdc44  // b.none
   0x0000fffff7fbc830:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbc834:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbc838:	540004a0	b.eq	0xfffff7fbc8cc  // b.none
   0x0000fffff7fbc83c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbc840:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbc844:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbc848:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbc84c:	54000400	b.eq	0xfffff7fbc8cc  // b.none
   0x0000fffff7fbc850:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbc854:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbc858:	36d801d1	tbz	w17, #27, 0xfffff7fbc890
   0x0000fffff7fbc85c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbc860:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbc864:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbc868:	54000321	b.ne	0xfffff7fbc8cc  // b.any
   0x0000fffff7fbc86c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbc870:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc874:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbc878:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbc87c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbc880:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbc884:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbc888:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbc88c:	54000209	b.ls	0xfffff7fbc8cc  // b.plast
   0x0000fffff7fbc890:	36d8008d	tbz	w13, #27, 0xfffff7fbc8a0
   0x0000fffff7fbc894:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbc898:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbc89c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbc8a0:	36d80091	tbz	w17, #27, 0xfffff7fbc8b0
   0x0000fffff7fbc8a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc8a8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbc8ac:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbc8b0:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fbc8b4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbc8b8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbc8bc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbc8c0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbc8c4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbc8c8:	1400000e	b	0xfffff7fbc900
   0x0000fffff7fbc8cc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbc8d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc8d4:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc8d8:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc8dc:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fbc8e0:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc8e4:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc8e8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbc8ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbc8f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc8f4:	d63f0200	blr	x16
   0x0000fffff7fbc8f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc8fc:	54009a80	b.eq	0xfffff7fbdc4c  // b.none
   0x0000fffff7fbc900:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbc904:	37d806a9	tbnz	w9, #27, 0xfffff7fbc9d8
   0x0000fffff7fbc908:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbc90c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc910:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc914:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc918:	540001c1	b.ne	0xfffff7fbc950  // b.any
   0x0000fffff7fbc91c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbc920:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc924:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc928:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc92c:	54000121	b.ne	0xfffff7fbc950  // b.any
   0x0000fffff7fbc930:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbc934:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fbc938:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbc93c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc940:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc944:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbc948:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbc94c:	14000030	b	0xfffff7fbca0c
   0x0000fffff7fbc950:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbc954:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbc958:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc95c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc960:	54000120	b.eq	0xfffff7fbc984  // b.none
   0x0000fffff7fbc964:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbc968:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc96c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc970:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc974:	54000321	b.ne	0xfffff7fbc9d8  // b.any
   0x0000fffff7fbc978:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbc97c:	9e620120	scvtf	d0, x9
   0x0000fffff7fbc980:	14000002	b	0xfffff7fbc988
   0x0000fffff7fbc984:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbc988:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbc98c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbc990:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc994:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc998:	54000120	b.eq	0xfffff7fbc9bc  // b.none
   0x0000fffff7fbc99c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbc9a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc9a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc9a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc9ac:	54000161	b.ne	0xfffff7fbc9d8  // b.any
   0x0000fffff7fbc9b0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbc9b4:	9e620121	scvtf	d1, x9
   0x0000fffff7fbc9b8:	14000002	b	0xfffff7fbc9c0
   0x0000fffff7fbc9bc:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fbc9c0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbc9c4:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbc9c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbc9cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc9d0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbc9d4:	17ffffde	b	0xfffff7fbc94c
   0x0000fffff7fbc9d8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbc9dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc9e0:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc9e4:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc9e8:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fbc9ec:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc9f0:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc9f4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbc9f8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbc9fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbca00:	d63f0200	blr	x16
   0x0000fffff7fbca04:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbca08:	54009260	b.eq	0xfffff7fbdc54  // b.none
   0x0000fffff7fbca0c:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbca10:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbca14:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbca18:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbca1c:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbca20:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbca24:	36d801d1	tbz	w17, #27, 0xfffff7fbca5c
   0x0000fffff7fbca28:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbca2c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbca30:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbca34:	54000281	b.ne	0xfffff7fbca84  // b.any
   0x0000fffff7fbca38:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbca3c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbca40:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbca44:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbca48:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbca4c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbca50:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbca54:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbca58:	54000169	b.ls	0xfffff7fbca84  // b.plast
   0x0000fffff7fbca5c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbca60:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbca64:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbca68:	36d80091	tbz	w17, #27, 0xfffff7fbca78
   0x0000fffff7fbca6c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbca70:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbca74:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbca78:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbca7c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbca80:	1400000e	b	0xfffff7fbcab8
   0x0000fffff7fbca84:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbca88:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbca8c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbca90:	aa1503e2	mov	x2, x21
   0x0000fffff7fbca94:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fbca98:	aa1403e4	mov	x4, x20
   0x0000fffff7fbca9c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbcaa0:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fbcaa4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbcaa8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbcaac:	d63f0200	blr	x16
   0x0000fffff7fbcab0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbcab4:	54008d40	b.eq	0xfffff7fbdc5c  // b.none
   0x0000fffff7fbcab8:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbcabc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbcac0:	540003a0	b.eq	0xfffff7fbcb34  // b.none
   0x0000fffff7fbcac4:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbcac8:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbcacc:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbcad0:	36d801d1	tbz	w17, #27, 0xfffff7fbcb08
   0x0000fffff7fbcad4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbcad8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbcadc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbcae0:	540002a1	b.ne	0xfffff7fbcb34  // b.any
   0x0000fffff7fbcae4:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbcae8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbcaec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbcaf0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbcaf4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbcaf8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbcafc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbcb00:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbcb04:	54000189	b.ls	0xfffff7fbcb34  // b.plast
   0x0000fffff7fbcb08:	36d8008d	tbz	w13, #27, 0xfffff7fbcb18
   0x0000fffff7fbcb0c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbcb10:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbcb14:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbcb18:	36d80091	tbz	w17, #27, 0xfffff7fbcb28
   0x0000fffff7fbcb1c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbcb20:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbcb24:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbcb28:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbcb2c:	b900016d	str	w13, [x11]
   0x0000fffff7fbcb30:	1400000e	b	0xfffff7fbcb68
   0x0000fffff7fbcb34:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbcb38:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbcb3c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbcb40:	aa1503e2	mov	x2, x21
   0x0000fffff7fbcb44:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fbcb48:	aa1403e4	mov	x4, x20
   0x0000fffff7fbcb4c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbcb50:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fbcb54:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbcb58:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbcb5c:	d63f0200	blr	x16
   0x0000fffff7fbcb60:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbcb64:	54008800	b.eq	0xfffff7fbdc64  // b.none
   0x0000fffff7fbcb68:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbcb6c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbcb70:	540004a0	b.eq	0xfffff7fbcc04  // b.none
   0x0000fffff7fbcb74:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbcb78:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbcb7c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbcb80:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbcb84:	54000400	b.eq	0xfffff7fbcc04  // b.none
   0x0000fffff7fbcb88:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbcb8c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbcb90:	36d801d1	tbz	w17, #27, 0xfffff7fbcbc8
   0x0000fffff7fbcb94:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbcb98:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbcb9c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbcba0:	54000321	b.ne	0xfffff7fbcc04  // b.any
   0x0000fffff7fbcba4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbcba8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbcbac:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbcbb0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbcbb4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbcbb8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbcbbc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbcbc0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbcbc4:	54000209	b.ls	0xfffff7fbcc04  // b.plast
   0x0000fffff7fbcbc8:	36d8008d	tbz	w13, #27, 0xfffff7fbcbd8
   0x0000fffff7fbcbcc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbcbd0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbcbd4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbcbd8:	36d80091	tbz	w17, #27, 0xfffff7fbcbe8
   0x0000fffff7fbcbdc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbcbe0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbcbe4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbcbe8:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fbcbec:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbcbf0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbcbf4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbcbf8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbcbfc:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbcc00:	1400000e	b	0xfffff7fbcc38
   0x0000fffff7fbcc04:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbcc08:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbcc0c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbcc10:	aa1503e2	mov	x2, x21
   0x0000fffff7fbcc14:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fbcc18:	aa1403e4	mov	x4, x20
   0x0000fffff7fbcc1c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbcc20:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbcc24:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbcc28:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbcc2c:	d63f0200	blr	x16
   0x0000fffff7fbcc30:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbcc34:	540081c0	b.eq	0xfffff7fbdc6c  // b.none
   0x0000fffff7fbcc38:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbcc3c:	37d806a9	tbnz	w9, #27, 0xfffff7fbcd10
   0x0000fffff7fbcc40:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbcc44:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbcc48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcc4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcc50:	540001c1	b.ne	0xfffff7fbcc88  // b.any
   0x0000fffff7fbcc54:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbcc58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbcc5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcc60:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcc64:	54000121	b.ne	0xfffff7fbcc88  // b.any
   0x0000fffff7fbcc68:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbcc6c:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fbcc70:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbcc74:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbcc78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcc7c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbcc80:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbcc84:	14000030	b	0xfffff7fbcd44
   0x0000fffff7fbcc88:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbcc8c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbcc90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcc94:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcc98:	54000120	b.eq	0xfffff7fbccbc  // b.none
   0x0000fffff7fbcc9c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbcca0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbcca4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcca8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbccac:	54000321	b.ne	0xfffff7fbcd10  // b.any
   0x0000fffff7fbccb0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbccb4:	9e620120	scvtf	d0, x9
   0x0000fffff7fbccb8:	14000002	b	0xfffff7fbccc0
   0x0000fffff7fbccbc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbccc0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbccc4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbccc8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcccc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbccd0:	54000120	b.eq	0xfffff7fbccf4  // b.none
   0x0000fffff7fbccd4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbccd8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbccdc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcce0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcce4:	54000161	b.ne	0xfffff7fbcd10  // b.any
   0x0000fffff7fbcce8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbccec:	9e620121	scvtf	d1, x9
   0x0000fffff7fbccf0:	14000002	b	0xfffff7fbccf8
   0x0000fffff7fbccf4:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fbccf8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbccfc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbcd00:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbcd04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcd08:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbcd0c:	17ffffde	b	0xfffff7fbcc84
   0x0000fffff7fbcd10:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbcd14:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbcd18:	aa1303e1	mov	x1, x19
   0x0000fffff7fbcd1c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbcd20:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fbcd24:	aa1403e4	mov	x4, x20
   0x0000fffff7fbcd28:	aa1603e5	mov	x5, x22
   0x0000fffff7fbcd2c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbcd30:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbcd34:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbcd38:	d63f0200	blr	x16
   0x0000fffff7fbcd3c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbcd40:	540079a0	b.eq	0xfffff7fbdc74  // b.none
   0x0000fffff7fbcd44:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbcd48:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbcd4c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbcd50:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbcd54:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbcd58:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbcd5c:	36d801d1	tbz	w17, #27, 0xfffff7fbcd94
   0x0000fffff7fbcd60:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbcd64:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbcd68:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbcd6c:	54000281	b.ne	0xfffff7fbcdbc  // b.any
   0x0000fffff7fbcd70:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbcd74:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbcd78:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbcd7c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbcd80:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbcd84:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbcd88:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbcd8c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbcd90:	54000169	b.ls	0xfffff7fbcdbc  // b.plast
   0x0000fffff7fbcd94:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbcd98:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbcd9c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbcda0:	36d80091	tbz	w17, #27, 0xfffff7fbcdb0
   0x0000fffff7fbcda4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbcda8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbcdac:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbcdb0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbcdb4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbcdb8:	1400000e	b	0xfffff7fbcdf0
   0x0000fffff7fbcdbc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbcdc0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbcdc4:	aa1303e1	mov	x1, x19
   0x0000fffff7fbcdc8:	aa1503e2	mov	x2, x21
   0x0000fffff7fbcdcc:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fbcdd0:	aa1403e4	mov	x4, x20
   0x0000fffff7fbcdd4:	aa1603e5	mov	x5, x22
   0x0000fffff7fbcdd8:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fbcddc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbcde0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbcde4:	d63f0200	blr	x16
   0x0000fffff7fbcde8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbcdec:	54007480	b.eq	0xfffff7fbdc7c  // b.none
   0x0000fffff7fbcdf0:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbcdf4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbcdf8:	540003a0	b.eq	0xfffff7fbce6c  // b.none
   0x0000fffff7fbcdfc:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbce00:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbce04:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbce08:	36d801d1	tbz	w17, #27, 0xfffff7fbce40
   0x0000fffff7fbce0c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbce10:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbce14:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbce18:	540002a1	b.ne	0xfffff7fbce6c  // b.any
   0x0000fffff7fbce1c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbce20:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbce24:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbce28:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbce2c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbce30:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbce34:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbce38:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbce3c:	54000189	b.ls	0xfffff7fbce6c  // b.plast
   0x0000fffff7fbce40:	36d8008d	tbz	w13, #27, 0xfffff7fbce50
   0x0000fffff7fbce44:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbce48:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbce4c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbce50:	36d80091	tbz	w17, #27, 0xfffff7fbce60
   0x0000fffff7fbce54:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbce58:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbce5c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbce60:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbce64:	b900016d	str	w13, [x11]
   0x0000fffff7fbce68:	1400000e	b	0xfffff7fbcea0
   0x0000fffff7fbce6c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbce70:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbce74:	aa1303e1	mov	x1, x19
   0x0000fffff7fbce78:	aa1503e2	mov	x2, x21
   0x0000fffff7fbce7c:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fbce80:	aa1403e4	mov	x4, x20
   0x0000fffff7fbce84:	aa1603e5	mov	x5, x22
   0x0000fffff7fbce88:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fbce8c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbce90:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbce94:	d63f0200	blr	x16
   0x0000fffff7fbce98:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbce9c:	54006f40	b.eq	0xfffff7fbdc84  // b.none
   0x0000fffff7fbcea0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbcea4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbcea8:	540004a0	b.eq	0xfffff7fbcf3c  // b.none
   0x0000fffff7fbceac:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbceb0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbceb4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbceb8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbcebc:	54000400	b.eq	0xfffff7fbcf3c  // b.none
   0x0000fffff7fbcec0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbcec4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbcec8:	36d801d1	tbz	w17, #27, 0xfffff7fbcf00
   0x0000fffff7fbcecc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbced0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbced4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbced8:	54000321	b.ne	0xfffff7fbcf3c  // b.any
   0x0000fffff7fbcedc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbcee0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbcee4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbcee8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbceec:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbcef0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbcef4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbcef8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbcefc:	54000209	b.ls	0xfffff7fbcf3c  // b.plast
   0x0000fffff7fbcf00:	36d8008d	tbz	w13, #27, 0xfffff7fbcf10
   0x0000fffff7fbcf04:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbcf08:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbcf0c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbcf10:	36d80091	tbz	w17, #27, 0xfffff7fbcf20
   0x0000fffff7fbcf14:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbcf18:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbcf1c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbcf20:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fbcf24:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbcf28:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbcf2c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbcf30:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbcf34:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbcf38:	1400000e	b	0xfffff7fbcf70
   0x0000fffff7fbcf3c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbcf40:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbcf44:	aa1303e1	mov	x1, x19
   0x0000fffff7fbcf48:	aa1503e2	mov	x2, x21
   0x0000fffff7fbcf4c:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fbcf50:	aa1403e4	mov	x4, x20
   0x0000fffff7fbcf54:	aa1603e5	mov	x5, x22
   0x0000fffff7fbcf58:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbcf5c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbcf60:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbcf64:	d63f0200	blr	x16
   0x0000fffff7fbcf68:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbcf6c:	54006900	b.eq	0xfffff7fbdc8c  // b.none
   0x0000fffff7fbcf70:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbcf74:	37d806a9	tbnz	w9, #27, 0xfffff7fbd048
   0x0000fffff7fbcf78:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbcf7c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbcf80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcf84:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcf88:	540001c1	b.ne	0xfffff7fbcfc0  // b.any
   0x0000fffff7fbcf8c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbcf90:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbcf94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcf98:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcf9c:	54000121	b.ne	0xfffff7fbcfc0  // b.any
   0x0000fffff7fbcfa0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbcfa4:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fbcfa8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbcfac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbcfb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcfb4:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbcfb8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbcfbc:	14000030	b	0xfffff7fbd07c
   0x0000fffff7fbcfc0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbcfc4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbcfc8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcfcc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcfd0:	54000120	b.eq	0xfffff7fbcff4  // b.none
   0x0000fffff7fbcfd4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbcfd8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbcfdc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcfe0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcfe4:	54000321	b.ne	0xfffff7fbd048  // b.any
   0x0000fffff7fbcfe8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbcfec:	9e620120	scvtf	d0, x9
   0x0000fffff7fbcff0:	14000002	b	0xfffff7fbcff8
   0x0000fffff7fbcff4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbcff8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbcffc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd000:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd004:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd008:	54000120	b.eq	0xfffff7fbd02c  // b.none
   0x0000fffff7fbd00c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd010:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd014:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd018:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd01c:	54000161	b.ne	0xfffff7fbd048  // b.any
   0x0000fffff7fbd020:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbd024:	9e620121	scvtf	d1, x9
   0x0000fffff7fbd028:	14000002	b	0xfffff7fbd030
   0x0000fffff7fbd02c:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fbd030:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbd034:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbd038:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd03c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd040:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbd044:	17ffffde	b	0xfffff7fbcfbc
   0x0000fffff7fbd048:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbd04c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd050:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd054:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd058:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fbd05c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd060:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd064:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbd068:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbd06c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd070:	d63f0200	blr	x16
   0x0000fffff7fbd074:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd078:	540060e0	b.eq	0xfffff7fbdc94  // b.none
   0x0000fffff7fbd07c:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbd080:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbd084:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbd088:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbd08c:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbd090:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbd094:	36d801d1	tbz	w17, #27, 0xfffff7fbd0cc
   0x0000fffff7fbd098:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbd09c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbd0a0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbd0a4:	54000281	b.ne	0xfffff7fbd0f4  // b.any
   0x0000fffff7fbd0a8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbd0ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd0b0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbd0b4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbd0b8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbd0bc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbd0c0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbd0c4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbd0c8:	54000169	b.ls	0xfffff7fbd0f4  // b.plast
   0x0000fffff7fbd0cc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbd0d0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbd0d4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbd0d8:	36d80091	tbz	w17, #27, 0xfffff7fbd0e8
   0x0000fffff7fbd0dc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd0e0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbd0e4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbd0e8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbd0ec:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbd0f0:	1400000e	b	0xfffff7fbd128
   0x0000fffff7fbd0f4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbd0f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd0fc:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd100:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd104:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fbd108:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd10c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd110:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fbd114:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbd118:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd11c:	d63f0200	blr	x16
   0x0000fffff7fbd120:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd124:	54005bc0	b.eq	0xfffff7fbdc9c  // b.none
   0x0000fffff7fbd128:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbd12c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbd130:	540003a0	b.eq	0xfffff7fbd1a4  // b.none
   0x0000fffff7fbd134:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbd138:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbd13c:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbd140:	36d801d1	tbz	w17, #27, 0xfffff7fbd178
   0x0000fffff7fbd144:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbd148:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbd14c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbd150:	540002a1	b.ne	0xfffff7fbd1a4  // b.any
   0x0000fffff7fbd154:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbd158:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd15c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbd160:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbd164:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbd168:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbd16c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbd170:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbd174:	54000189	b.ls	0xfffff7fbd1a4  // b.plast
   0x0000fffff7fbd178:	36d8008d	tbz	w13, #27, 0xfffff7fbd188
   0x0000fffff7fbd17c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbd180:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbd184:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbd188:	36d80091	tbz	w17, #27, 0xfffff7fbd198
   0x0000fffff7fbd18c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd190:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbd194:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbd198:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbd19c:	b900016d	str	w13, [x11]
   0x0000fffff7fbd1a0:	1400000e	b	0xfffff7fbd1d8
   0x0000fffff7fbd1a4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbd1a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd1ac:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd1b0:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd1b4:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fbd1b8:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd1bc:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd1c0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fbd1c4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbd1c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd1cc:	d63f0200	blr	x16
   0x0000fffff7fbd1d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd1d4:	54005680	b.eq	0xfffff7fbdca4  // b.none
   0x0000fffff7fbd1d8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbd1dc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbd1e0:	540004a0	b.eq	0xfffff7fbd274  // b.none
   0x0000fffff7fbd1e4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbd1e8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbd1ec:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbd1f0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbd1f4:	54000400	b.eq	0xfffff7fbd274  // b.none
   0x0000fffff7fbd1f8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbd1fc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbd200:	36d801d1	tbz	w17, #27, 0xfffff7fbd238
   0x0000fffff7fbd204:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbd208:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbd20c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbd210:	54000321	b.ne	0xfffff7fbd274  // b.any
   0x0000fffff7fbd214:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbd218:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd21c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbd220:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbd224:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbd228:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbd22c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbd230:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbd234:	54000209	b.ls	0xfffff7fbd274  // b.plast
   0x0000fffff7fbd238:	36d8008d	tbz	w13, #27, 0xfffff7fbd248
   0x0000fffff7fbd23c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbd240:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbd244:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbd248:	36d80091	tbz	w17, #27, 0xfffff7fbd258
   0x0000fffff7fbd24c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd250:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbd254:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbd258:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fbd25c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbd260:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbd264:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbd268:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbd26c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbd270:	1400000e	b	0xfffff7fbd2a8
   0x0000fffff7fbd274:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbd278:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd27c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd280:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd284:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fbd288:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd28c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd290:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbd294:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbd298:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd29c:	d63f0200	blr	x16
   0x0000fffff7fbd2a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd2a4:	54005040	b.eq	0xfffff7fbdcac  // b.none
   0x0000fffff7fbd2a8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbd2ac:	37d806a9	tbnz	w9, #27, 0xfffff7fbd380
   0x0000fffff7fbd2b0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbd2b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd2b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd2bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd2c0:	540001c1	b.ne	0xfffff7fbd2f8  // b.any
   0x0000fffff7fbd2c4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd2c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd2cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd2d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd2d4:	54000121	b.ne	0xfffff7fbd2f8  // b.any
   0x0000fffff7fbd2d8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbd2dc:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fbd2e0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbd2e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd2e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd2ec:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbd2f0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbd2f4:	14000030	b	0xfffff7fbd3b4
   0x0000fffff7fbd2f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbd2fc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd300:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd304:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd308:	54000120	b.eq	0xfffff7fbd32c  // b.none
   0x0000fffff7fbd30c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbd310:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd314:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd318:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd31c:	54000321	b.ne	0xfffff7fbd380  // b.any
   0x0000fffff7fbd320:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbd324:	9e620120	scvtf	d0, x9
   0x0000fffff7fbd328:	14000002	b	0xfffff7fbd330
   0x0000fffff7fbd32c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbd330:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd334:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd338:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd33c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd340:	54000120	b.eq	0xfffff7fbd364  // b.none
   0x0000fffff7fbd344:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd348:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd34c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd350:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd354:	54000161	b.ne	0xfffff7fbd380  // b.any
   0x0000fffff7fbd358:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbd35c:	9e620121	scvtf	d1, x9
   0x0000fffff7fbd360:	14000002	b	0xfffff7fbd368
   0x0000fffff7fbd364:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fbd368:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbd36c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbd370:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd374:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd378:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbd37c:	17ffffde	b	0xfffff7fbd2f4
   0x0000fffff7fbd380:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbd384:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd388:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd38c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd390:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fbd394:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd398:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd39c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbd3a0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbd3a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd3a8:	d63f0200	blr	x16
   0x0000fffff7fbd3ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd3b0:	54004820	b.eq	0xfffff7fbdcb4  // b.none
   0x0000fffff7fbd3b4:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbd3b8:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbd3bc:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbd3c0:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbd3c4:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbd3c8:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbd3cc:	36d801d1	tbz	w17, #27, 0xfffff7fbd404
   0x0000fffff7fbd3d0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbd3d4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbd3d8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbd3dc:	54000281	b.ne	0xfffff7fbd42c  // b.any
   0x0000fffff7fbd3e0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbd3e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd3e8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbd3ec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbd3f0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbd3f4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbd3f8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbd3fc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbd400:	54000169	b.ls	0xfffff7fbd42c  // b.plast
   0x0000fffff7fbd404:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbd408:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbd40c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbd410:	36d80091	tbz	w17, #27, 0xfffff7fbd420
   0x0000fffff7fbd414:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd418:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbd41c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbd420:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbd424:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbd428:	1400000e	b	0xfffff7fbd460
   0x0000fffff7fbd42c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbd430:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd434:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd438:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd43c:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fbd440:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd444:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd448:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fbd44c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbd450:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd454:	d63f0200	blr	x16
   0x0000fffff7fbd458:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd45c:	54004300	b.eq	0xfffff7fbdcbc  // b.none
   0x0000fffff7fbd460:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbd464:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbd468:	540003a0	b.eq	0xfffff7fbd4dc  // b.none
   0x0000fffff7fbd46c:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbd470:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbd474:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbd478:	36d801d1	tbz	w17, #27, 0xfffff7fbd4b0
   0x0000fffff7fbd47c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbd480:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbd484:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbd488:	540002a1	b.ne	0xfffff7fbd4dc  // b.any
   0x0000fffff7fbd48c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbd490:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd494:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbd498:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbd49c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbd4a0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbd4a4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbd4a8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbd4ac:	54000189	b.ls	0xfffff7fbd4dc  // b.plast
   0x0000fffff7fbd4b0:	36d8008d	tbz	w13, #27, 0xfffff7fbd4c0
   0x0000fffff7fbd4b4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbd4b8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbd4bc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbd4c0:	36d80091	tbz	w17, #27, 0xfffff7fbd4d0
   0x0000fffff7fbd4c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd4c8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbd4cc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbd4d0:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbd4d4:	b900016d	str	w13, [x11]
   0x0000fffff7fbd4d8:	1400000e	b	0xfffff7fbd510
   0x0000fffff7fbd4dc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbd4e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd4e4:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd4e8:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd4ec:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fbd4f0:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd4f4:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd4f8:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fbd4fc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbd500:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd504:	d63f0200	blr	x16
   0x0000fffff7fbd508:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd50c:	54003dc0	b.eq	0xfffff7fbdcc4  // b.none
   0x0000fffff7fbd510:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbd514:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbd518:	540004a0	b.eq	0xfffff7fbd5ac  // b.none
   0x0000fffff7fbd51c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbd520:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbd524:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbd528:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbd52c:	54000400	b.eq	0xfffff7fbd5ac  // b.none
   0x0000fffff7fbd530:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbd534:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbd538:	36d801d1	tbz	w17, #27, 0xfffff7fbd570
   0x0000fffff7fbd53c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbd540:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbd544:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbd548:	54000321	b.ne	0xfffff7fbd5ac  // b.any
   0x0000fffff7fbd54c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbd550:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd554:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbd558:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbd55c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbd560:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbd564:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbd568:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbd56c:	54000209	b.ls	0xfffff7fbd5ac  // b.plast
   0x0000fffff7fbd570:	36d8008d	tbz	w13, #27, 0xfffff7fbd580
   0x0000fffff7fbd574:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbd578:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbd57c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbd580:	36d80091	tbz	w17, #27, 0xfffff7fbd590
   0x0000fffff7fbd584:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd588:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbd58c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbd590:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fbd594:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbd598:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbd59c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbd5a0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbd5a4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbd5a8:	1400000e	b	0xfffff7fbd5e0
   0x0000fffff7fbd5ac:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbd5b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd5b4:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd5b8:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd5bc:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fbd5c0:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd5c4:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd5c8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbd5cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbd5d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd5d4:	d63f0200	blr	x16
   0x0000fffff7fbd5d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd5dc:	54003780	b.eq	0xfffff7fbdccc  // b.none
   0x0000fffff7fbd5e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbd5e4:	37d806a9	tbnz	w9, #27, 0xfffff7fbd6b8
   0x0000fffff7fbd5e8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbd5ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd5f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd5f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd5f8:	540001c1	b.ne	0xfffff7fbd630  // b.any
   0x0000fffff7fbd5fc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd600:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd604:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd608:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd60c:	54000121	b.ne	0xfffff7fbd630  // b.any
   0x0000fffff7fbd610:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbd614:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fbd618:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbd61c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd620:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd624:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbd628:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbd62c:	14000030	b	0xfffff7fbd6ec
   0x0000fffff7fbd630:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbd634:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd638:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd63c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd640:	54000120	b.eq	0xfffff7fbd664  // b.none
   0x0000fffff7fbd644:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbd648:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd64c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd650:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd654:	54000321	b.ne	0xfffff7fbd6b8  // b.any
   0x0000fffff7fbd658:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbd65c:	9e620120	scvtf	d0, x9
   0x0000fffff7fbd660:	14000002	b	0xfffff7fbd668
   0x0000fffff7fbd664:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbd668:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd66c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd670:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd674:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd678:	54000120	b.eq	0xfffff7fbd69c  // b.none
   0x0000fffff7fbd67c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd680:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd684:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd688:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd68c:	54000161	b.ne	0xfffff7fbd6b8  // b.any
   0x0000fffff7fbd690:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbd694:	9e620121	scvtf	d1, x9
   0x0000fffff7fbd698:	14000002	b	0xfffff7fbd6a0
   0x0000fffff7fbd69c:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fbd6a0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbd6a4:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbd6a8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd6ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd6b0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbd6b4:	17ffffde	b	0xfffff7fbd62c
   0x0000fffff7fbd6b8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbd6bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd6c0:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd6c4:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd6c8:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fbd6cc:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd6d0:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd6d4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbd6d8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbd6dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd6e0:	d63f0200	blr	x16
   0x0000fffff7fbd6e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd6e8:	54002f60	b.eq	0xfffff7fbdcd4  // b.none
   0x0000fffff7fbd6ec:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbd6f0:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbd6f4:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbd6f8:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbd6fc:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbd700:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbd704:	36d801d1	tbz	w17, #27, 0xfffff7fbd73c
   0x0000fffff7fbd708:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbd70c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbd710:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbd714:	54000281	b.ne	0xfffff7fbd764  // b.any
   0x0000fffff7fbd718:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbd71c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd720:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbd724:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbd728:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbd72c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbd730:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbd734:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbd738:	54000169	b.ls	0xfffff7fbd764  // b.plast
   0x0000fffff7fbd73c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbd740:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbd744:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbd748:	36d80091	tbz	w17, #27, 0xfffff7fbd758
   0x0000fffff7fbd74c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd750:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbd754:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbd758:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbd75c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbd760:	1400000e	b	0xfffff7fbd798
   0x0000fffff7fbd764:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbd768:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd76c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd770:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd774:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fbd778:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd77c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd780:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fbd784:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbd788:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd78c:	d63f0200	blr	x16
   0x0000fffff7fbd790:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd794:	54002a40	b.eq	0xfffff7fbdcdc  // b.none
   0x0000fffff7fbd798:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbd79c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbd7a0:	540003a0	b.eq	0xfffff7fbd814  // b.none
   0x0000fffff7fbd7a4:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbd7a8:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbd7ac:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbd7b0:	36d801d1	tbz	w17, #27, 0xfffff7fbd7e8
   0x0000fffff7fbd7b4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbd7b8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbd7bc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbd7c0:	540002a1	b.ne	0xfffff7fbd814  // b.any
   0x0000fffff7fbd7c4:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbd7c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd7cc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbd7d0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbd7d4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbd7d8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbd7dc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbd7e0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbd7e4:	54000189	b.ls	0xfffff7fbd814  // b.plast
   0x0000fffff7fbd7e8:	36d8008d	tbz	w13, #27, 0xfffff7fbd7f8
   0x0000fffff7fbd7ec:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbd7f0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbd7f4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbd7f8:	36d80091	tbz	w17, #27, 0xfffff7fbd808
   0x0000fffff7fbd7fc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd800:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbd804:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbd808:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbd80c:	b900016d	str	w13, [x11]
   0x0000fffff7fbd810:	1400000e	b	0xfffff7fbd848
   0x0000fffff7fbd814:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbd818:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd81c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd820:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd824:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fbd828:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd82c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd830:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fbd834:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbd838:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd83c:	d63f0200	blr	x16
   0x0000fffff7fbd840:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd844:	54002500	b.eq	0xfffff7fbdce4  // b.none
   0x0000fffff7fbd848:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbd84c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbd850:	540004a0	b.eq	0xfffff7fbd8e4  // b.none
   0x0000fffff7fbd854:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbd858:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbd85c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbd860:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbd864:	54000400	b.eq	0xfffff7fbd8e4  // b.none
   0x0000fffff7fbd868:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbd86c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbd870:	36d801d1	tbz	w17, #27, 0xfffff7fbd8a8
   0x0000fffff7fbd874:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbd878:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbd87c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbd880:	54000321	b.ne	0xfffff7fbd8e4  // b.any
   0x0000fffff7fbd884:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbd888:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd88c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbd890:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbd894:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbd898:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbd89c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbd8a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbd8a4:	54000209	b.ls	0xfffff7fbd8e4  // b.plast
   0x0000fffff7fbd8a8:	36d8008d	tbz	w13, #27, 0xfffff7fbd8b8
   0x0000fffff7fbd8ac:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbd8b0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbd8b4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbd8b8:	36d80091	tbz	w17, #27, 0xfffff7fbd8c8
   0x0000fffff7fbd8bc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd8c0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbd8c4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbd8c8:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fbd8cc:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbd8d0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbd8d4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbd8d8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbd8dc:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbd8e0:	1400000e	b	0xfffff7fbd918
   0x0000fffff7fbd8e4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbd8e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd8ec:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd8f0:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd8f4:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fbd8f8:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd8fc:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd900:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbd904:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbd908:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd90c:	d63f0200	blr	x16
   0x0000fffff7fbd910:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd914:	54001ec0	b.eq	0xfffff7fbdcec  // b.none
   0x0000fffff7fbd918:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbd91c:	37d806a9	tbnz	w9, #27, 0xfffff7fbd9f0
   0x0000fffff7fbd920:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbd924:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd928:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd92c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd930:	540001c1	b.ne	0xfffff7fbd968  // b.any
   0x0000fffff7fbd934:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd938:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd93c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd940:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd944:	54000121	b.ne	0xfffff7fbd968  // b.any
   0x0000fffff7fbd948:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbd94c:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fbd950:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbd954:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd958:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd95c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbd960:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbd964:	14000030	b	0xfffff7fbda24
   0x0000fffff7fbd968:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbd96c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd970:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd974:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd978:	54000120	b.eq	0xfffff7fbd99c  // b.none
   0x0000fffff7fbd97c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbd980:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd984:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd988:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd98c:	54000321	b.ne	0xfffff7fbd9f0  // b.any
   0x0000fffff7fbd990:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbd994:	9e620120	scvtf	d0, x9
   0x0000fffff7fbd998:	14000002	b	0xfffff7fbd9a0
   0x0000fffff7fbd99c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbd9a0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd9a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd9a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd9ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd9b0:	54000120	b.eq	0xfffff7fbd9d4  // b.none
   0x0000fffff7fbd9b4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd9b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd9bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd9c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd9c4:	54000161	b.ne	0xfffff7fbd9f0  // b.any
   0x0000fffff7fbd9c8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbd9cc:	9e620121	scvtf	d1, x9
   0x0000fffff7fbd9d0:	14000002	b	0xfffff7fbd9d8
   0x0000fffff7fbd9d4:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fbd9d8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbd9dc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbd9e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd9e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd9e8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbd9ec:	17ffffde	b	0xfffff7fbd964
   0x0000fffff7fbd9f0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbd9f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd9f8:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd9fc:	aa1503e2	mov	x2, x21
   0x0000fffff7fbda00:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fbda04:	aa1403e4	mov	x4, x20
   0x0000fffff7fbda08:	aa1603e5	mov	x5, x22
   0x0000fffff7fbda0c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbda10:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbda14:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbda18:	d63f0200	blr	x16
   0x0000fffff7fbda1c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbda20:	540016a0	b.eq	0xfffff7fbdcf4  // b.none
   0x0000fffff7fbda24:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbda28:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbda2c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fbda30:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbda34:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbda38:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbda3c:	36d801d1	tbz	w17, #27, 0xfffff7fbda74
   0x0000fffff7fbda40:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbda44:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbda48:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbda4c:	54000281	b.ne	0xfffff7fbda9c  // b.any
   0x0000fffff7fbda50:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbda54:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbda58:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbda5c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbda60:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbda64:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbda68:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbda6c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbda70:	54000169	b.ls	0xfffff7fbda9c  // b.plast
   0x0000fffff7fbda74:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbda78:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbda7c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbda80:	36d80091	tbz	w17, #27, 0xfffff7fbda90
   0x0000fffff7fbda84:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbda88:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbda8c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbda90:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbda94:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbda98:	1400000e	b	0xfffff7fbdad0
   0x0000fffff7fbda9c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbdaa0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbdaa4:	aa1303e1	mov	x1, x19
   0x0000fffff7fbdaa8:	aa1503e2	mov	x2, x21
   0x0000fffff7fbdaac:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fbdab0:	aa1403e4	mov	x4, x20
   0x0000fffff7fbdab4:	aa1603e5	mov	x5, x22
   0x0000fffff7fbdab8:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fbdabc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbdac0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbdac4:	d63f0200	blr	x16
   0x0000fffff7fbdac8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbdacc:	54001180	b.eq	0xfffff7fbdcfc  // b.none
   0x0000fffff7fbdad0:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbdad4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbdad8:	540003a0	b.eq	0xfffff7fbdb4c  // b.none
   0x0000fffff7fbdadc:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fbdae0:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fbdae4:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbdae8:	36d801d1	tbz	w17, #27, 0xfffff7fbdb20
   0x0000fffff7fbdaec:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbdaf0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbdaf4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbdaf8:	540002a1	b.ne	0xfffff7fbdb4c  // b.any
   0x0000fffff7fbdafc:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbdb00:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbdb04:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbdb08:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbdb0c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbdb10:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbdb14:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbdb18:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbdb1c:	54000189	b.ls	0xfffff7fbdb4c  // b.plast
   0x0000fffff7fbdb20:	36d8008d	tbz	w13, #27, 0xfffff7fbdb30
   0x0000fffff7fbdb24:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbdb28:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbdb2c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbdb30:	36d80091	tbz	w17, #27, 0xfffff7fbdb40
   0x0000fffff7fbdb34:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbdb38:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbdb3c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbdb40:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbdb44:	b900016d	str	w13, [x11]
   0x0000fffff7fbdb48:	1400000e	b	0xfffff7fbdb80
   0x0000fffff7fbdb4c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbdb50:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbdb54:	aa1303e1	mov	x1, x19
   0x0000fffff7fbdb58:	aa1503e2	mov	x2, x21
   0x0000fffff7fbdb5c:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fbdb60:	aa1403e4	mov	x4, x20
   0x0000fffff7fbdb64:	aa1603e5	mov	x5, x22
   0x0000fffff7fbdb68:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fbdb6c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbdb70:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbdb74:	d63f0200	blr	x16
   0x0000fffff7fbdb78:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbdb7c:	54000c40	b.eq	0xfffff7fbdd04  // b.none
   0x0000fffff7fbdb80:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbdb84:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbdb88:	aa1303e1	mov	x1, x19
   0x0000fffff7fbdb8c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbdb90:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fbdb94:	aa1403e4	mov	x4, x20
   0x0000fffff7fbdb98:	aa1603e5	mov	x5, x22
   0x0000fffff7fbdb9c:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7fbdba0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbdba4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbdba8:	d63f0200	blr	x16
   0x0000fffff7fbdbac:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fbdbb0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fbdbb4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fbdbb8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fbdbbc:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fbdbc0:	d65f03c0	ret
   0x0000fffff7fbdbc4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbdbc8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbdbcc:	b900028a	str	w10, [x20]
   0x0000fffff7fbdbd0:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fbdbd4:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fbdbd8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fbdbdc:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fbdbe0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fbdbe4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fbdbe8:	d65f03c0	ret
   0x0000fffff7fbdbec:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fbdbf0:	17fffff5	b	0xfffff7fbdbc4
   0x0000fffff7fbdbf4:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fbdbf8:	17fffff3	b	0xfffff7fbdbc4
   0x0000fffff7fbdbfc:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fbdc00:	17fffff1	b	0xfffff7fbdbc4
   0x0000fffff7fbdc04:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7fbdc08:	17ffffef	b	0xfffff7fbdbc4
   0x0000fffff7fbdc0c:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fbdc10:	17ffffed	b	0xfffff7fbdbc4
   0x0000fffff7fbdc14:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fbdc18:	17ffffeb	b	0xfffff7fbdbc4
   0x0000fffff7fbdc1c:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fbdc20:	17ffffe9	b	0xfffff7fbdbc4
   0x0000fffff7fbdc24:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fbdc28:	17ffffe7	b	0xfffff7fbdbc4
   0x0000fffff7fbdc2c:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fbdc30:	17ffffe5	b	0xfffff7fbdbc4
   0x0000fffff7fbdc34:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fbdc38:	17ffffe3	b	0xfffff7fbdbc4
   0x0000fffff7fbdc3c:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fbdc40:	17ffffe1	b	0xfffff7fbdbc4
   0x0000fffff7fbdc44:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fbdc48:	17ffffdf	b	0xfffff7fbdbc4
   0x0000fffff7fbdc4c:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fbdc50:	17ffffdd	b	0xfffff7fbdbc4
   0x0000fffff7fbdc54:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fbdc58:	17ffffdb	b	0xfffff7fbdbc4
   0x0000fffff7fbdc5c:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fbdc60:	17ffffd9	b	0xfffff7fbdbc4
   0x0000fffff7fbdc64:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fbdc68:	17ffffd7	b	0xfffff7fbdbc4
   0x0000fffff7fbdc6c:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fbdc70:	17ffffd5	b	0xfffff7fbdbc4
   0x0000fffff7fbdc74:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fbdc78:	17ffffd3	b	0xfffff7fbdbc4
   0x0000fffff7fbdc7c:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fbdc80:	17ffffd1	b	0xfffff7fbdbc4
   0x0000fffff7fbdc84:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fbdc88:	17ffffcf	b	0xfffff7fbdbc4
   0x0000fffff7fbdc8c:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fbdc90:	17ffffcd	b	0xfffff7fbdbc4
   0x0000fffff7fbdc94:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fbdc98:	17ffffcb	b	0xfffff7fbdbc4
   0x0000fffff7fbdc9c:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fbdca0:	17ffffc9	b	0xfffff7fbdbc4
   0x0000fffff7fbdca4:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fbdca8:	17ffffc7	b	0xfffff7fbdbc4
   0x0000fffff7fbdcac:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fbdcb0:	17ffffc5	b	0xfffff7fbdbc4
   0x0000fffff7fbdcb4:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fbdcb8:	17ffffc3	b	0xfffff7fbdbc4
   0x0000fffff7fbdcbc:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fbdcc0:	17ffffc1	b	0xfffff7fbdbc4
   0x0000fffff7fbdcc4:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fbdcc8:	17ffffbf	b	0xfffff7fbdbc4
   0x0000fffff7fbdccc:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fbdcd0:	17ffffbd	b	0xfffff7fbdbc4
   0x0000fffff7fbdcd4:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fbdcd8:	17ffffbb	b	0xfffff7fbdbc4
   0x0000fffff7fbdcdc:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fbdce0:	17ffffb9	b	0xfffff7fbdbc4
   0x0000fffff7fbdce4:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fbdce8:	17ffffb7	b	0xfffff7fbdbc4
   0x0000fffff7fbdcec:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fbdcf0:	17ffffb5	b	0xfffff7fbdbc4
   0x0000fffff7fbdcf4:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fbdcf8:	17ffffb3	b	0xfffff7fbdbc4
   0x0000fffff7fbdcfc:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fbdd00:	17ffffb1	b	0xfffff7fbdbc4
   0x0000fffff7fbdd04:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fbdd08:	17ffffaf	b	0xfffff7fbdbc4
   0x0000fffff7fbdd0c:	00000000	udf	#0
   0x0000fffff7fbdd10:	00000000	udf	#0
   0x0000fffff7fbdd14:	00000000	udf	#0
   0x0000fffff7fbdd18:	00000000	udf	#0
   0x0000fffff7fbdd1c:	00000000	udf	#0
   0x0000fffff7fbdd20:	00000000	udf	#0
   0x0000fffff7fbdd24:	00000000	udf	#0
   0x0000fffff7fbdd28:	00000000	udf	#0
   0x0000fffff7fbdd2c:	00000000	udf	#0
   0x0000fffff7fbdd30:	00000000	udf	#0
   0x0000fffff7fbdd34:	00000000	udf	#0
   0x0000fffff7fbdd38:	00000000	udf	#0
   0x0000fffff7fbdd3c:	00000000	udf	#0
   0x0000fffff7fbdd40:	00000000	udf	#0
   0x0000fffff7fbdd44:	00000000	udf	#0
   0x0000fffff7fbdd48:	00000000	udf	#0
   0x0000fffff7fbdd4c:	00000000	udf	#0
   0x0000fffff7fbdd50:	00000000	udf	#0
   0x0000fffff7fbdd54:	00000000	udf	#0
   0x0000fffff7fbdd58:	00000000	udf	#0
   0x0000fffff7fbdd5c:	00000000	udf	#0
   0x0000fffff7fbdd60:	00000000	udf	#0
   0x0000fffff7fbdd64:	00000000	udf	#0
   0x0000fffff7fbdd68:	00000000	udf	#0
   0x0000fffff7fbdd6c:	00000000	udf	#0
   0x0000fffff7fbdd70:	00000000	udf	#0
   0x0000fffff7fbdd74:	00000000	udf	#0
   0x0000fffff7fbdd78:	00000000	udf	#0
   0x0000fffff7fbdd7c:	00000000	udf	#0
   0x0000fffff7fbdd80:	00000000	udf	#0
   0x0000fffff7fbdd84:	00000000	udf	#0
   0x0000fffff7fbdd88:	00000000	udf	#0
   0x0000fffff7fbdd8c:	00000000	udf	#0
   0x0000fffff7fbdd90:	00000000	udf	#0
   0x0000fffff7fbdd94:	00000000	udf	#0
   0x0000fffff7fbdd98:	00000000	udf	#0
   0x0000fffff7fbdd9c:	00000000	udf	#0
   0x0000fffff7fbdda0:	00000000	udf	#0
   0x0000fffff7fbdda4:	00000000	udf	#0
   0x0000fffff7fbdda8:	00000000	udf	#0
   0x0000fffff7fbddac:	00000000	udf	#0
   0x0000fffff7fbddb0:	00000000	udf	#0
   0x0000fffff7fbddb4:	00000000	udf	#0
   0x0000fffff7fbddb8:	00000000	udf	#0
   0x0000fffff7fbddbc:	00000000	udf	#0
   0x0000fffff7fbddc0:	00000000	udf	#0
   0x0000fffff7fbddc4:	00000000	udf	#0
   0x0000fffff7fbddc8:	00000000	udf	#0
   0x0000fffff7fbddcc:	00000000	udf	#0
   0x0000fffff7fbddd0:	00000000	udf	#0
   0x0000fffff7fbddd4:	00000000	udf	#0
   0x0000fffff7fbddd8:	00000000	udf	#0
   0x0000fffff7fbdddc:	00000000	udf	#0
   0x0000fffff7fbdde0:	00000000	udf	#0
   0x0000fffff7fbdde4:	00000000	udf	#0
   0x0000fffff7fbdde8:	00000000	udf	#0
   0x0000fffff7fbddec:	00000000	udf	#0
   0x0000fffff7fbddf0:	00000000	udf	#0
   0x0000fffff7fbddf4:	00000000	udf	#0
   0x0000fffff7fbddf8:	00000000	udf	#0
   0x0000fffff7fbddfc:	00000000	udf	#0
   0x0000fffff7fbde00:	00000000	udf	#0
   0x0000fffff7fbde04:	00000000	udf	#0
   0x0000fffff7fbde08:	00000000	udf	#0
   0x0000fffff7fbde0c:	00000000	udf	#0
   0x0000fffff7fbde10:	00000000	udf	#0
   0x0000fffff7fbde14:	00000000	udf	#0
   0x0000fffff7fbde18:	00000000	udf	#0
   0x0000fffff7fbde1c:	00000000	udf	#0
   0x0000fffff7fbde20:	00000000	udf	#0
   0x0000fffff7fbde24:	00000000	udf	#0
   0x0000fffff7fbde28:	00000000	udf	#0
   0x0000fffff7fbde2c:	00000000	udf	#0
   0x0000fffff7fbde30:	00000000	udf	#0
   0x0000fffff7fbde34:	00000000	udf	#0
   0x0000fffff7fbde38:	00000000	udf	#0
   0x0000fffff7fbde3c:	00000000	udf	#0
   0x0000fffff7fbde40:	00000000	udf	#0
   0x0000fffff7fbde44:	00000000	udf	#0
   0x0000fffff7fbde48:	00000000	udf	#0
   0x0000fffff7fbde4c:	00000000	udf	#0
   0x0000fffff7fbde50:	00000000	udf	#0
   0x0000fffff7fbde54:	00000000	udf	#0
   0x0000fffff7fbde58:	00000000	udf	#0
   0x0000fffff7fbde5c:	00000000	udf	#0
   0x0000fffff7fbde60:	00000000	udf	#0
   0x0000fffff7fbde64:	00000000	udf	#0
   0x0000fffff7fbde68:	00000000	udf	#0
   0x0000fffff7fbde6c:	00000000	udf	#0
   0x0000fffff7fbde70:	00000000	udf	#0
   0x0000fffff7fbde74:	00000000	udf	#0
   0x0000fffff7fbde78:	00000000	udf	#0
   0x0000fffff7fbde7c:	00000000	udf	#0
   0x0000fffff7fbde80:	00000000	udf	#0
   0x0000fffff7fbde84:	00000000	udf	#0
   0x0000fffff7fbde88:	00000000	udf	#0
   0x0000fffff7fbde8c:	00000000	udf	#0
   0x0000fffff7fbde90:	00000000	udf	#0
   0x0000fffff7fbde94:	00000000	udf	#0
   0x0000fffff7fbde98:	00000000	udf	#0
   0x0000fffff7fbde9c:	00000000	udf	#0
   0x0000fffff7fbdea0:	00000000	udf	#0
   0x0000fffff7fbdea4:	00000000	udf	#0
   0x0000fffff7fbdea8:	00000000	udf	#0
   0x0000fffff7fbdeac:	00000000	udf	#0
   0x0000fffff7fbdeb0:	00000000	udf	#0
   0x0000fffff7fbdeb4:	00000000	udf	#0
   0x0000fffff7fbdeb8:	00000000	udf	#0
   0x0000fffff7fbdebc:	00000000	udf	#0
   0x0000fffff7fbdec0:	00000000	udf	#0
   0x0000fffff7fbdec4:	00000000	udf	#0
   0x0000fffff7fbdec8:	00000000	udf	#0
   0x0000fffff7fbdecc:	00000000	udf	#0
   0x0000fffff7fbded0:	00000000	udf	#0
   0x0000fffff7fbded4:	00000000	udf	#0
   0x0000fffff7fbded8:	00000000	udf	#0
   0x0000fffff7fbdedc:	00000000	udf	#0
   0x0000fffff7fbdee0:	00000000	udf	#0
   0x0000fffff7fbdee4:	00000000	udf	#0
   0x0000fffff7fbdee8:	00000000	udf	#0
   0x0000fffff7fbdeec:	00000000	udf	#0
   0x0000fffff7fbdef0:	00000000	udf	#0
   0x0000fffff7fbdef4:	00000000	udf	#0
   0x0000fffff7fbdef8:	00000000	udf	#0
   0x0000fffff7fbdefc:	00000000	udf	#0
   0x0000fffff7fbdf00:	00000000	udf	#0
   0x0000fffff7fbdf04:	00000000	udf	#0
   0x0000fffff7fbdf08:	00000000	udf	#0
   0x0000fffff7fbdf0c:	00000000	udf	#0
   0x0000fffff7fbdf10:	00000000	udf	#0
   0x0000fffff7fbdf14:	00000000	udf	#0
   0x0000fffff7fbdf18:	00000000	udf	#0
   0x0000fffff7fbdf1c:	00000000	udf	#0
   0x0000fffff7fbdf20:	00000000	udf	#0
   0x0000fffff7fbdf24:	00000000	udf	#0
   0x0000fffff7fbdf28:	00000000	udf	#0
   0x0000fffff7fbdf2c:	00000000	udf	#0
   0x0000fffff7fbdf30:	00000000	udf	#0
   0x0000fffff7fbdf34:	00000000	udf	#0
   0x0000fffff7fbdf38:	00000000	udf	#0
   0x0000fffff7fbdf3c:	00000000	udf	#0
   0x0000fffff7fbdf40:	00000000	udf	#0
   0x0000fffff7fbdf44:	00000000	udf	#0
   0x0000fffff7fbdf48:	00000000	udf	#0
   0x0000fffff7fbdf4c:	00000000	udf	#0
   0x0000fffff7fbdf50:	00000000	udf	#0
   0x0000fffff7fbdf54:	00000000	udf	#0
   0x0000fffff7fbdf58:	00000000	udf	#0
   0x0000fffff7fbdf5c:	00000000	udf	#0
   0x0000fffff7fbdf60:	00000000	udf	#0
   0x0000fffff7fbdf64:	00000000	udf	#0
   0x0000fffff7fbdf68:	00000000	udf	#0
   0x0000fffff7fbdf6c:	00000000	udf	#0
   0x0000fffff7fbdf70:	00000000	udf	#0
   0x0000fffff7fbdf74:	00000000	udf	#0
   0x0000fffff7fbdf78:	00000000	udf	#0
   0x0000fffff7fbdf7c:	00000000	udf	#0
   0x0000fffff7fbdf80:	00000000	udf	#0
   0x0000fffff7fbdf84:	00000000	udf	#0
   0x0000fffff7fbdf88:	00000000	udf	#0
   0x0000fffff7fbdf8c:	00000000	udf	#0
   0x0000fffff7fbdf90:	00000000	udf	#0
   0x0000fffff7fbdf94:	00000000	udf	#0
   0x0000fffff7fbdf98:	00000000	udf	#0
   0x0000fffff7fbdf9c:	00000000	udf	#0
   0x0000fffff7fbdfa0:	00000000	udf	#0
   0x0000fffff7fbdfa4:	00000000	udf	#0
   0x0000fffff7fbdfa8:	00000000	udf	#0
   0x0000fffff7fbdfac:	00000000	udf	#0
   0x0000fffff7fbdfb0:	00000000	udf	#0
   0x0000fffff7fbdfb4:	00000000	udf	#0
   0x0000fffff7fbdfb8:	00000000	udf	#0
   0x0000fffff7fbdfbc:	00000000	udf	#0
   0x0000fffff7fbdfc0:	00000000	udf	#0
   0x0000fffff7fbdfc4:	00000000	udf	#0
   0x0000fffff7fbdfc8:	00000000	udf	#0
   0x0000fffff7fbdfcc:	00000000	udf	#0
   0x0000fffff7fbdfd0:	00000000	udf	#0
   0x0000fffff7fbdfd4:	00000000	udf	#0
   0x0000fffff7fbdfd8:	00000000	udf	#0
   0x0000fffff7fbdfdc:	00000000	udf	#0
   0x0000fffff7fbdfe0:	00000000	udf	#0
   0x0000fffff7fbdfe4:	00000000	udf	#0
   0x0000fffff7fbdfe8:	00000000	udf	#0
   0x0000fffff7fbdfec:	00000000	udf	#0
   0x0000fffff7fbdff0:	00000000	udf	#0
   0x0000fffff7fbdff4:	00000000	udf	#0
   0x0000fffff7fbdff8:	00000000	udf	#0
   0x0000fffff7fbdffc:	00000000	udf	#0
End of assembler dump.
