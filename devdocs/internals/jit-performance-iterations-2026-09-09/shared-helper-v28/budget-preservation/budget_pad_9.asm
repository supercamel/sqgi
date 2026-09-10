Dump of assembler code from 0xfffff7fac000 to 0xfffff7fae000:
   0x0000fffff7fac000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fac004:	910003fd	mov	x29, sp
   0x0000fffff7fac008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fac00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fac010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fac014:	aa0003f3	mov	x19, x0
   0x0000fffff7fac018:	aa0103f4	mov	x20, x1
   0x0000fffff7fac01c:	aa0203f5	mov	x21, x2
   0x0000fffff7fac020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fac024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fac028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fac02c:	f90003e9	str	x9, [sp]
   0x0000fffff7fac030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fac034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fac038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fac03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fac040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac044:	d63f0200	blr	x16
   0x0000fffff7fac048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fac04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fac050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fac054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fac058:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fac05c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fac060:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fac064:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fac068:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fac06c:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7fac070:	36d801d1	tbz	w17, #27, 0xfffff7fac0a8
   0x0000fffff7fac074:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac078:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac07c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac080:	54000281	b.ne	0xfffff7fac0d0  // b.any
   0x0000fffff7fac084:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7fac088:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac08c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac090:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac094:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac098:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac09c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac0a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac0a4:	54000169	b.ls	0xfffff7fac0d0  // b.plast
   0x0000fffff7fac0a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fac0ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fac0b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fac0b4:	36d80091	tbz	w17, #27, 0xfffff7fac0c4
   0x0000fffff7fac0b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac0bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac0c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac0c4:	f900166c	str	x12, [x19, #40]
   0x0000fffff7fac0c8:	b900226d	str	w13, [x19, #32]
   0x0000fffff7fac0cc:	1400000e	b	0xfffff7fac104
   0x0000fffff7fac0d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac0d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac0d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fac0dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fac0e0:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fac0e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fac0e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fac0ec:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7fac0f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac0f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac0f8:	d63f0200	blr	x16
   0x0000fffff7fac0fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac100:	5400d860	b.eq	0xfffff7fadc0c  // b.none
   0x0000fffff7fac104:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fac108:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fac10c:	d280002c	mov	x12, #0x1                   	// #1
   0x0000fffff7fac110:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fac114:	36d80211	tbz	w17, #27, 0xfffff7fac154
   0x0000fffff7fac118:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac11c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac120:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac124:	540001e1	b.ne	0xfffff7fac160  // b.any
   0x0000fffff7fac128:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fac12c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac130:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac134:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac138:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac13c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac140:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac144:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac148:	540000c9	b.ls	0xfffff7fac160  // b.plast
   0x0000fffff7fac14c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac150:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac154:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fac158:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fac15c:	1400000e	b	0xfffff7fac194
   0x0000fffff7fac160:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac164:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac168:	aa1303e1	mov	x1, x19
   0x0000fffff7fac16c:	aa1503e2	mov	x2, x21
   0x0000fffff7fac170:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fac174:	aa1403e4	mov	x4, x20
   0x0000fffff7fac178:	aa1603e5	mov	x5, x22
   0x0000fffff7fac17c:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7fac180:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac188:	d63f0200	blr	x16
   0x0000fffff7fac18c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac190:	5400d420	b.eq	0xfffff7fadc14  // b.none
   0x0000fffff7fac194:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fac198:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac19c:	aa1303e1	mov	x1, x19
   0x0000fffff7fac1a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fac1a4:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fac1a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fac1ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fac1b0:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7fac1b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac1b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac1bc:	d63f0200	blr	x16
   0x0000fffff7fac1c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac1c4:	5400d2c0	b.eq	0xfffff7fadc1c  // b.none
   0x0000fffff7fac1c8:	14000001	b	0xfffff7fac1cc
   0x0000fffff7fac1cc:	14000001	b	0xfffff7fac1d0
   0x0000fffff7fac1d0:	14000001	b	0xfffff7fac1d4
   0x0000fffff7fac1d4:	14000001	b	0xfffff7fac1d8
   0x0000fffff7fac1d8:	14000001	b	0xfffff7fac1dc
   0x0000fffff7fac1dc:	14000001	b	0xfffff7fac1e0
   0x0000fffff7fac1e0:	14000001	b	0xfffff7fac1e4
   0x0000fffff7fac1e4:	14000001	b	0xfffff7fac1e8
   0x0000fffff7fac1e8:	14000001	b	0xfffff7fac1ec
   0x0000fffff7fac1ec:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fac1f0:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fac1f4:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fac1f8:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fac1fc:	36d80211	tbz	w17, #27, 0xfffff7fac23c
   0x0000fffff7fac200:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac204:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac208:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac20c:	540001e1	b.ne	0xfffff7fac248  // b.any
   0x0000fffff7fac210:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fac214:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac218:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac21c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac220:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac224:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac228:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac22c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac230:	540000c9	b.ls	0xfffff7fac248  // b.plast
   0x0000fffff7fac234:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac238:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac23c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fac240:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fac244:	1400000e	b	0xfffff7fac27c
   0x0000fffff7fac248:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac24c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac250:	aa1303e1	mov	x1, x19
   0x0000fffff7fac254:	aa1503e2	mov	x2, x21
   0x0000fffff7fac258:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fac25c:	aa1403e4	mov	x4, x20
   0x0000fffff7fac260:	aa1603e5	mov	x5, x22
   0x0000fffff7fac264:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7fac268:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac26c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac270:	d63f0200	blr	x16
   0x0000fffff7fac274:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac278:	5400cd60	b.eq	0xfffff7fadc24  // b.none
   0x0000fffff7fac27c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fac280:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac284:	aa1303e1	mov	x1, x19
   0x0000fffff7fac288:	aa1503e2	mov	x2, x21
   0x0000fffff7fac28c:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fac290:	aa1403e4	mov	x4, x20
   0x0000fffff7fac294:	aa1603e5	mov	x5, x22
   0x0000fffff7fac298:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fac29c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac2a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac2a4:	d63f0200	blr	x16
   0x0000fffff7fac2a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac2ac:	5400cc00	b.eq	0xfffff7fadc2c  // b.none
   0x0000fffff7fac2b0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac2b4:	37d806a9	tbnz	w9, #27, 0xfffff7fac388
   0x0000fffff7fac2b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac2bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac2c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac2c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac2c8:	540001c1	b.ne	0xfffff7fac300  // b.any
   0x0000fffff7fac2cc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fac2d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac2d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac2d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac2dc:	54000121	b.ne	0xfffff7fac300  // b.any
   0x0000fffff7fac2e0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fac2e4:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fac2e8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fac2ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac2f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac2f4:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fac2f8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fac2fc:	14000030	b	0xfffff7fac3bc
   0x0000fffff7fac300:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac304:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac308:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac30c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac310:	54000120	b.eq	0xfffff7fac334  // b.none
   0x0000fffff7fac314:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac318:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac31c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac320:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac324:	54000321	b.ne	0xfffff7fac388  // b.any
   0x0000fffff7fac328:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fac32c:	9e620120	scvtf	d0, x9
   0x0000fffff7fac330:	14000002	b	0xfffff7fac338
   0x0000fffff7fac334:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fac338:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fac33c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac340:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac344:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac348:	54000120	b.eq	0xfffff7fac36c  // b.none
   0x0000fffff7fac34c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fac350:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac354:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac358:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac35c:	54000161	b.ne	0xfffff7fac388  // b.any
   0x0000fffff7fac360:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fac364:	9e620121	scvtf	d1, x9
   0x0000fffff7fac368:	14000002	b	0xfffff7fac370
   0x0000fffff7fac36c:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fac370:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fac374:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fac378:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac37c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac380:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fac384:	17ffffde	b	0xfffff7fac2fc
   0x0000fffff7fac388:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac38c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac390:	aa1303e1	mov	x1, x19
   0x0000fffff7fac394:	aa1503e2	mov	x2, x21
   0x0000fffff7fac398:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fac39c:	aa1403e4	mov	x4, x20
   0x0000fffff7fac3a0:	aa1603e5	mov	x5, x22
   0x0000fffff7fac3a4:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7fac3a8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac3ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac3b0:	d63f0200	blr	x16
   0x0000fffff7fac3b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac3b8:	5400c3e0	b.eq	0xfffff7fadc34  // b.none
   0x0000fffff7fac3bc:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fac3c0:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fac3c4:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fac3c8:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fac3cc:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fac3d0:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fac3d4:	36d801d1	tbz	w17, #27, 0xfffff7fac40c
   0x0000fffff7fac3d8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac3dc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac3e0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac3e4:	54000281	b.ne	0xfffff7fac434  // b.any
   0x0000fffff7fac3e8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fac3ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac3f0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac3f4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac3f8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac3fc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac400:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac404:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac408:	54000169	b.ls	0xfffff7fac434  // b.plast
   0x0000fffff7fac40c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fac410:	91000529	add	x9, x9, #0x1
   0x0000fffff7fac414:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fac418:	36d80091	tbz	w17, #27, 0xfffff7fac428
   0x0000fffff7fac41c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac420:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac424:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac428:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fac42c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fac430:	1400000e	b	0xfffff7fac468
   0x0000fffff7fac434:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac438:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac43c:	aa1303e1	mov	x1, x19
   0x0000fffff7fac440:	aa1503e2	mov	x2, x21
   0x0000fffff7fac444:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fac448:	aa1403e4	mov	x4, x20
   0x0000fffff7fac44c:	aa1603e5	mov	x5, x22
   0x0000fffff7fac450:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7fac454:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac458:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac45c:	d63f0200	blr	x16
   0x0000fffff7fac460:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac464:	5400bec0	b.eq	0xfffff7fadc3c  // b.none
   0x0000fffff7fac468:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fac46c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fac470:	540003a0	b.eq	0xfffff7fac4e4  // b.none
   0x0000fffff7fac474:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fac478:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fac47c:	b9400171	ldr	w17, [x11]
   0x0000fffff7fac480:	36d801d1	tbz	w17, #27, 0xfffff7fac4b8
   0x0000fffff7fac484:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac488:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac48c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac490:	540002a1	b.ne	0xfffff7fac4e4  // b.any
   0x0000fffff7fac494:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fac498:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac49c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac4a0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac4a4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac4a8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac4ac:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac4b0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac4b4:	54000189	b.ls	0xfffff7fac4e4  // b.plast
   0x0000fffff7fac4b8:	36d8008d	tbz	w13, #27, 0xfffff7fac4c8
   0x0000fffff7fac4bc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fac4c0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fac4c4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fac4c8:	36d80091	tbz	w17, #27, 0xfffff7fac4d8
   0x0000fffff7fac4cc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac4d0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac4d4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac4d8:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fac4dc:	b900016d	str	w13, [x11]
   0x0000fffff7fac4e0:	1400000e	b	0xfffff7fac518
   0x0000fffff7fac4e4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fac4e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac4ec:	aa1303e1	mov	x1, x19
   0x0000fffff7fac4f0:	aa1503e2	mov	x2, x21
   0x0000fffff7fac4f4:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fac4f8:	aa1403e4	mov	x4, x20
   0x0000fffff7fac4fc:	aa1603e5	mov	x5, x22
   0x0000fffff7fac500:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7fac504:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac508:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac50c:	d63f0200	blr	x16
   0x0000fffff7fac510:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac514:	5400b980	b.eq	0xfffff7fadc44  // b.none
   0x0000fffff7fac518:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fac51c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fac520:	540004a0	b.eq	0xfffff7fac5b4  // b.none
   0x0000fffff7fac524:	b940016d	ldr	w13, [x11]
   0x0000fffff7fac528:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fac52c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fac530:	eb0901bf	cmp	x13, x9
   0x0000fffff7fac534:	54000400	b.eq	0xfffff7fac5b4  // b.none
   0x0000fffff7fac538:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fac53c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fac540:	36d801d1	tbz	w17, #27, 0xfffff7fac578
   0x0000fffff7fac544:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac548:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac54c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac550:	54000321	b.ne	0xfffff7fac5b4  // b.any
   0x0000fffff7fac554:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fac558:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac55c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac560:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac564:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac568:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac56c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac570:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac574:	54000209	b.ls	0xfffff7fac5b4  // b.plast
   0x0000fffff7fac578:	36d8008d	tbz	w13, #27, 0xfffff7fac588
   0x0000fffff7fac57c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fac580:	91000529	add	x9, x9, #0x1
   0x0000fffff7fac584:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fac588:	36d80091	tbz	w17, #27, 0xfffff7fac598
   0x0000fffff7fac58c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac590:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac594:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac598:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fac59c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fac5a0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fac5a4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fac5a8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fac5ac:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fac5b0:	1400000e	b	0xfffff7fac5e8
   0x0000fffff7fac5b4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fac5b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac5bc:	aa1303e1	mov	x1, x19
   0x0000fffff7fac5c0:	aa1503e2	mov	x2, x21
   0x0000fffff7fac5c4:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fac5c8:	aa1403e4	mov	x4, x20
   0x0000fffff7fac5cc:	aa1603e5	mov	x5, x22
   0x0000fffff7fac5d0:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fac5d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac5d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac5dc:	d63f0200	blr	x16
   0x0000fffff7fac5e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac5e4:	5400b340	b.eq	0xfffff7fadc4c  // b.none
   0x0000fffff7fac5e8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac5ec:	37d806a9	tbnz	w9, #27, 0xfffff7fac6c0
   0x0000fffff7fac5f0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac5f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac5f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac5fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac600:	540001c1	b.ne	0xfffff7fac638  // b.any
   0x0000fffff7fac604:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fac608:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac60c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac610:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac614:	54000121	b.ne	0xfffff7fac638  // b.any
   0x0000fffff7fac618:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fac61c:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fac620:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fac624:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac628:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac62c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fac630:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fac634:	14000030	b	0xfffff7fac6f4
   0x0000fffff7fac638:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac63c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac640:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac644:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac648:	54000120	b.eq	0xfffff7fac66c  // b.none
   0x0000fffff7fac64c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac650:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac654:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac658:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac65c:	54000321	b.ne	0xfffff7fac6c0  // b.any
   0x0000fffff7fac660:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fac664:	9e620120	scvtf	d0, x9
   0x0000fffff7fac668:	14000002	b	0xfffff7fac670
   0x0000fffff7fac66c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fac670:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fac674:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac678:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac67c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac680:	54000120	b.eq	0xfffff7fac6a4  // b.none
   0x0000fffff7fac684:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fac688:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac68c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac690:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac694:	54000161	b.ne	0xfffff7fac6c0  // b.any
   0x0000fffff7fac698:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fac69c:	9e620121	scvtf	d1, x9
   0x0000fffff7fac6a0:	14000002	b	0xfffff7fac6a8
   0x0000fffff7fac6a4:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fac6a8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fac6ac:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fac6b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac6b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac6b8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fac6bc:	17ffffde	b	0xfffff7fac634
   0x0000fffff7fac6c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac6c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac6c8:	aa1303e1	mov	x1, x19
   0x0000fffff7fac6cc:	aa1503e2	mov	x2, x21
   0x0000fffff7fac6d0:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fac6d4:	aa1403e4	mov	x4, x20
   0x0000fffff7fac6d8:	aa1603e5	mov	x5, x22
   0x0000fffff7fac6dc:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7fac6e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac6e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac6e8:	d63f0200	blr	x16
   0x0000fffff7fac6ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac6f0:	5400ab20	b.eq	0xfffff7fadc54  // b.none
   0x0000fffff7fac6f4:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fac6f8:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fac6fc:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fac700:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fac704:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fac708:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fac70c:	36d801d1	tbz	w17, #27, 0xfffff7fac744
   0x0000fffff7fac710:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac714:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac718:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac71c:	54000281	b.ne	0xfffff7fac76c  // b.any
   0x0000fffff7fac720:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fac724:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac728:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac72c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac730:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac734:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac738:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac73c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac740:	54000169	b.ls	0xfffff7fac76c  // b.plast
   0x0000fffff7fac744:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fac748:	91000529	add	x9, x9, #0x1
   0x0000fffff7fac74c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fac750:	36d80091	tbz	w17, #27, 0xfffff7fac760
   0x0000fffff7fac754:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac758:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac75c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac760:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fac764:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fac768:	1400000e	b	0xfffff7fac7a0
   0x0000fffff7fac76c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac770:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac774:	aa1303e1	mov	x1, x19
   0x0000fffff7fac778:	aa1503e2	mov	x2, x21
   0x0000fffff7fac77c:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fac780:	aa1403e4	mov	x4, x20
   0x0000fffff7fac784:	aa1603e5	mov	x5, x22
   0x0000fffff7fac788:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7fac78c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac790:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac794:	d63f0200	blr	x16
   0x0000fffff7fac798:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac79c:	5400a600	b.eq	0xfffff7fadc5c  // b.none
   0x0000fffff7fac7a0:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fac7a4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fac7a8:	540003a0	b.eq	0xfffff7fac81c  // b.none
   0x0000fffff7fac7ac:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fac7b0:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fac7b4:	b9400171	ldr	w17, [x11]
   0x0000fffff7fac7b8:	36d801d1	tbz	w17, #27, 0xfffff7fac7f0
   0x0000fffff7fac7bc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac7c0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac7c4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac7c8:	540002a1	b.ne	0xfffff7fac81c  // b.any
   0x0000fffff7fac7cc:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fac7d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac7d4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac7d8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac7dc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac7e0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac7e4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac7e8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac7ec:	54000189	b.ls	0xfffff7fac81c  // b.plast
   0x0000fffff7fac7f0:	36d8008d	tbz	w13, #27, 0xfffff7fac800
   0x0000fffff7fac7f4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fac7f8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fac7fc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fac800:	36d80091	tbz	w17, #27, 0xfffff7fac810
   0x0000fffff7fac804:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac808:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac80c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac810:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fac814:	b900016d	str	w13, [x11]
   0x0000fffff7fac818:	1400000e	b	0xfffff7fac850
   0x0000fffff7fac81c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fac820:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac824:	aa1303e1	mov	x1, x19
   0x0000fffff7fac828:	aa1503e2	mov	x2, x21
   0x0000fffff7fac82c:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fac830:	aa1403e4	mov	x4, x20
   0x0000fffff7fac834:	aa1603e5	mov	x5, x22
   0x0000fffff7fac838:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7fac83c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac840:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac844:	d63f0200	blr	x16
   0x0000fffff7fac848:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac84c:	5400a0c0	b.eq	0xfffff7fadc64  // b.none
   0x0000fffff7fac850:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fac854:	f100017f	cmp	x11, #0x0
   0x0000fffff7fac858:	540004a0	b.eq	0xfffff7fac8ec  // b.none
   0x0000fffff7fac85c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fac860:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fac864:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fac868:	eb0901bf	cmp	x13, x9
   0x0000fffff7fac86c:	54000400	b.eq	0xfffff7fac8ec  // b.none
   0x0000fffff7fac870:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fac874:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fac878:	36d801d1	tbz	w17, #27, 0xfffff7fac8b0
   0x0000fffff7fac87c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac880:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac884:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac888:	54000321	b.ne	0xfffff7fac8ec  // b.any
   0x0000fffff7fac88c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fac890:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac894:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac898:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac89c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac8a0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac8a4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac8a8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac8ac:	54000209	b.ls	0xfffff7fac8ec  // b.plast
   0x0000fffff7fac8b0:	36d8008d	tbz	w13, #27, 0xfffff7fac8c0
   0x0000fffff7fac8b4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fac8b8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fac8bc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fac8c0:	36d80091	tbz	w17, #27, 0xfffff7fac8d0
   0x0000fffff7fac8c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac8c8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac8cc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac8d0:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fac8d4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fac8d8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fac8dc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fac8e0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fac8e4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fac8e8:	1400000e	b	0xfffff7fac920
   0x0000fffff7fac8ec:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fac8f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac8f4:	aa1303e1	mov	x1, x19
   0x0000fffff7fac8f8:	aa1503e2	mov	x2, x21
   0x0000fffff7fac8fc:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fac900:	aa1403e4	mov	x4, x20
   0x0000fffff7fac904:	aa1603e5	mov	x5, x22
   0x0000fffff7fac908:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fac90c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac910:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac914:	d63f0200	blr	x16
   0x0000fffff7fac918:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac91c:	54009a80	b.eq	0xfffff7fadc6c  // b.none
   0x0000fffff7fac920:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac924:	37d806a9	tbnz	w9, #27, 0xfffff7fac9f8
   0x0000fffff7fac928:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac92c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac930:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac934:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac938:	540001c1	b.ne	0xfffff7fac970  // b.any
   0x0000fffff7fac93c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fac940:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac944:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac948:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac94c:	54000121	b.ne	0xfffff7fac970  // b.any
   0x0000fffff7fac950:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fac954:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fac958:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fac95c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac960:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac964:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fac968:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fac96c:	14000030	b	0xfffff7faca2c
   0x0000fffff7fac970:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac974:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac978:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac97c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac980:	54000120	b.eq	0xfffff7fac9a4  // b.none
   0x0000fffff7fac984:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac988:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac98c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac990:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac994:	54000321	b.ne	0xfffff7fac9f8  // b.any
   0x0000fffff7fac998:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fac99c:	9e620120	scvtf	d0, x9
   0x0000fffff7fac9a0:	14000002	b	0xfffff7fac9a8
   0x0000fffff7fac9a4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fac9a8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fac9ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac9b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac9b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac9b8:	54000120	b.eq	0xfffff7fac9dc  // b.none
   0x0000fffff7fac9bc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fac9c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac9c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac9c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac9cc:	54000161	b.ne	0xfffff7fac9f8  // b.any
   0x0000fffff7fac9d0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fac9d4:	9e620121	scvtf	d1, x9
   0x0000fffff7fac9d8:	14000002	b	0xfffff7fac9e0
   0x0000fffff7fac9dc:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fac9e0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fac9e4:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fac9e8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac9ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac9f0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fac9f4:	17ffffde	b	0xfffff7fac96c
   0x0000fffff7fac9f8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac9fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faca00:	aa1303e1	mov	x1, x19
   0x0000fffff7faca04:	aa1503e2	mov	x2, x21
   0x0000fffff7faca08:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7faca0c:	aa1403e4	mov	x4, x20
   0x0000fffff7faca10:	aa1603e5	mov	x5, x22
   0x0000fffff7faca14:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7faca18:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faca1c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faca20:	d63f0200	blr	x16
   0x0000fffff7faca24:	f100001f	cmp	x0, #0x0
   0x0000fffff7faca28:	54009260	b.eq	0xfffff7fadc74  // b.none
   0x0000fffff7faca2c:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7faca30:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7faca34:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7faca38:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7faca3c:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7faca40:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7faca44:	36d801d1	tbz	w17, #27, 0xfffff7faca7c
   0x0000fffff7faca48:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faca4c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faca50:	f100013f	cmp	x9, #0x0
   0x0000fffff7faca54:	54000281	b.ne	0xfffff7facaa4  // b.any
   0x0000fffff7faca58:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7faca5c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faca60:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faca64:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faca68:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faca6c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faca70:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faca74:	f100055f	cmp	x10, #0x1
   0x0000fffff7faca78:	54000169	b.ls	0xfffff7facaa4  // b.plast
   0x0000fffff7faca7c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faca80:	91000529	add	x9, x9, #0x1
   0x0000fffff7faca84:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faca88:	36d80091	tbz	w17, #27, 0xfffff7faca98
   0x0000fffff7faca8c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faca90:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faca94:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faca98:	f900266c	str	x12, [x19, #72]
   0x0000fffff7faca9c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7facaa0:	1400000e	b	0xfffff7facad8
   0x0000fffff7facaa4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7facaa8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7facaac:	aa1303e1	mov	x1, x19
   0x0000fffff7facab0:	aa1503e2	mov	x2, x21
   0x0000fffff7facab4:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7facab8:	aa1403e4	mov	x4, x20
   0x0000fffff7facabc:	aa1603e5	mov	x5, x22
   0x0000fffff7facac0:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7facac4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7facac8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7facacc:	d63f0200	blr	x16
   0x0000fffff7facad0:	f100001f	cmp	x0, #0x0
   0x0000fffff7facad4:	54008d40	b.eq	0xfffff7fadc7c  // b.none
   0x0000fffff7facad8:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7facadc:	f100017f	cmp	x11, #0x0
   0x0000fffff7facae0:	540003a0	b.eq	0xfffff7facb54  // b.none
   0x0000fffff7facae4:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7facae8:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7facaec:	b9400171	ldr	w17, [x11]
   0x0000fffff7facaf0:	36d801d1	tbz	w17, #27, 0xfffff7facb28
   0x0000fffff7facaf4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7facaf8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7facafc:	f100013f	cmp	x9, #0x0
   0x0000fffff7facb00:	540002a1	b.ne	0xfffff7facb54  // b.any
   0x0000fffff7facb04:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7facb08:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7facb0c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7facb10:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7facb14:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7facb18:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7facb1c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7facb20:	f100055f	cmp	x10, #0x1
   0x0000fffff7facb24:	54000189	b.ls	0xfffff7facb54  // b.plast
   0x0000fffff7facb28:	36d8008d	tbz	w13, #27, 0xfffff7facb38
   0x0000fffff7facb2c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7facb30:	91000529	add	x9, x9, #0x1
   0x0000fffff7facb34:	f9000589	str	x9, [x12, #8]
   0x0000fffff7facb38:	36d80091	tbz	w17, #27, 0xfffff7facb48
   0x0000fffff7facb3c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7facb40:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7facb44:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7facb48:	f900056c	str	x12, [x11, #8]
   0x0000fffff7facb4c:	b900016d	str	w13, [x11]
   0x0000fffff7facb50:	1400000e	b	0xfffff7facb88
   0x0000fffff7facb54:	910043e6	add	x6, sp, #0x10
   0x0000fffff7facb58:	f94003e0	ldr	x0, [sp]
   0x0000fffff7facb5c:	aa1303e1	mov	x1, x19
   0x0000fffff7facb60:	aa1503e2	mov	x2, x21
   0x0000fffff7facb64:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7facb68:	aa1403e4	mov	x4, x20
   0x0000fffff7facb6c:	aa1603e5	mov	x5, x22
   0x0000fffff7facb70:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7facb74:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7facb78:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7facb7c:	d63f0200	blr	x16
   0x0000fffff7facb80:	f100001f	cmp	x0, #0x0
   0x0000fffff7facb84:	54008800	b.eq	0xfffff7fadc84  // b.none
   0x0000fffff7facb88:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7facb8c:	f100017f	cmp	x11, #0x0
   0x0000fffff7facb90:	540004a0	b.eq	0xfffff7facc24  // b.none
   0x0000fffff7facb94:	b940016d	ldr	w13, [x11]
   0x0000fffff7facb98:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7facb9c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7facba0:	eb0901bf	cmp	x13, x9
   0x0000fffff7facba4:	54000400	b.eq	0xfffff7facc24  // b.none
   0x0000fffff7facba8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7facbac:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7facbb0:	36d801d1	tbz	w17, #27, 0xfffff7facbe8
   0x0000fffff7facbb4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7facbb8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7facbbc:	f100013f	cmp	x9, #0x0
   0x0000fffff7facbc0:	54000321	b.ne	0xfffff7facc24  // b.any
   0x0000fffff7facbc4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7facbc8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7facbcc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7facbd0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7facbd4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7facbd8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7facbdc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7facbe0:	f100055f	cmp	x10, #0x1
   0x0000fffff7facbe4:	54000209	b.ls	0xfffff7facc24  // b.plast
   0x0000fffff7facbe8:	36d8008d	tbz	w13, #27, 0xfffff7facbf8
   0x0000fffff7facbec:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7facbf0:	91000529	add	x9, x9, #0x1
   0x0000fffff7facbf4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7facbf8:	36d80091	tbz	w17, #27, 0xfffff7facc08
   0x0000fffff7facbfc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7facc00:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7facc04:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7facc08:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7facc0c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7facc10:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7facc14:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7facc18:	f900266c	str	x12, [x19, #72]
   0x0000fffff7facc1c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7facc20:	1400000e	b	0xfffff7facc58
   0x0000fffff7facc24:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7facc28:	f94003e0	ldr	x0, [sp]
   0x0000fffff7facc2c:	aa1303e1	mov	x1, x19
   0x0000fffff7facc30:	aa1503e2	mov	x2, x21
   0x0000fffff7facc34:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7facc38:	aa1403e4	mov	x4, x20
   0x0000fffff7facc3c:	aa1603e5	mov	x5, x22
   0x0000fffff7facc40:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7facc44:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7facc48:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7facc4c:	d63f0200	blr	x16
   0x0000fffff7facc50:	f100001f	cmp	x0, #0x0
   0x0000fffff7facc54:	540081c0	b.eq	0xfffff7fadc8c  // b.none
   0x0000fffff7facc58:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7facc5c:	37d806a9	tbnz	w9, #27, 0xfffff7facd30
   0x0000fffff7facc60:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7facc64:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facc68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facc6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7facc70:	540001c1	b.ne	0xfffff7facca8  // b.any
   0x0000fffff7facc74:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7facc78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facc7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facc80:	eb0a013f	cmp	x9, x10
   0x0000fffff7facc84:	54000121	b.ne	0xfffff7facca8  // b.any
   0x0000fffff7facc88:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7facc8c:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7facc90:	8b0a0129	add	x9, x9, x10
   0x0000fffff7facc94:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facc98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facc9c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7facca0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7facca4:	14000030	b	0xfffff7facd64
   0x0000fffff7facca8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faccac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faccb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faccb4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faccb8:	54000120	b.eq	0xfffff7faccdc  // b.none
   0x0000fffff7faccbc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faccc0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faccc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faccc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7facccc:	54000321	b.ne	0xfffff7facd30  // b.any
   0x0000fffff7faccd0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faccd4:	9e620120	scvtf	d0, x9
   0x0000fffff7faccd8:	14000002	b	0xfffff7facce0
   0x0000fffff7faccdc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7facce0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7facce4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7facce8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faccec:	eb0a013f	cmp	x9, x10
   0x0000fffff7faccf0:	54000120	b.eq	0xfffff7facd14  // b.none
   0x0000fffff7faccf4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faccf8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faccfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facd00:	eb0a013f	cmp	x9, x10
   0x0000fffff7facd04:	54000161	b.ne	0xfffff7facd30  // b.any
   0x0000fffff7facd08:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7facd0c:	9e620121	scvtf	d1, x9
   0x0000fffff7facd10:	14000002	b	0xfffff7facd18
   0x0000fffff7facd14:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7facd18:	1e612800	fadd	d0, d0, d1
   0x0000fffff7facd1c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7facd20:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7facd24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facd28:	b900326a	str	w10, [x19, #48]
   0x0000fffff7facd2c:	17ffffde	b	0xfffff7facca4
   0x0000fffff7facd30:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7facd34:	f94003e0	ldr	x0, [sp]
   0x0000fffff7facd38:	aa1303e1	mov	x1, x19
   0x0000fffff7facd3c:	aa1503e2	mov	x2, x21
   0x0000fffff7facd40:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7facd44:	aa1403e4	mov	x4, x20
   0x0000fffff7facd48:	aa1603e5	mov	x5, x22
   0x0000fffff7facd4c:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7facd50:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7facd54:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7facd58:	d63f0200	blr	x16
   0x0000fffff7facd5c:	f100001f	cmp	x0, #0x0
   0x0000fffff7facd60:	540079a0	b.eq	0xfffff7fadc94  // b.none
   0x0000fffff7facd64:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7facd68:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7facd6c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7facd70:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7facd74:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7facd78:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7facd7c:	36d801d1	tbz	w17, #27, 0xfffff7facdb4
   0x0000fffff7facd80:	f94003e9	ldr	x9, [sp]
   0x0000fffff7facd84:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7facd88:	f100013f	cmp	x9, #0x0
   0x0000fffff7facd8c:	54000281	b.ne	0xfffff7facddc  // b.any
   0x0000fffff7facd90:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7facd94:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7facd98:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7facd9c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7facda0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7facda4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7facda8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7facdac:	f100055f	cmp	x10, #0x1
   0x0000fffff7facdb0:	54000169	b.ls	0xfffff7facddc  // b.plast
   0x0000fffff7facdb4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7facdb8:	91000529	add	x9, x9, #0x1
   0x0000fffff7facdbc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7facdc0:	36d80091	tbz	w17, #27, 0xfffff7facdd0
   0x0000fffff7facdc4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7facdc8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7facdcc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7facdd0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7facdd4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7facdd8:	1400000e	b	0xfffff7face10
   0x0000fffff7facddc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7facde0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7facde4:	aa1303e1	mov	x1, x19
   0x0000fffff7facde8:	aa1503e2	mov	x2, x21
   0x0000fffff7facdec:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7facdf0:	aa1403e4	mov	x4, x20
   0x0000fffff7facdf4:	aa1603e5	mov	x5, x22
   0x0000fffff7facdf8:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7facdfc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7face00:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7face04:	d63f0200	blr	x16
   0x0000fffff7face08:	f100001f	cmp	x0, #0x0
   0x0000fffff7face0c:	54007480	b.eq	0xfffff7fadc9c  // b.none
   0x0000fffff7face10:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7face14:	f100017f	cmp	x11, #0x0
   0x0000fffff7face18:	540003a0	b.eq	0xfffff7face8c  // b.none
   0x0000fffff7face1c:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7face20:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7face24:	b9400171	ldr	w17, [x11]
   0x0000fffff7face28:	36d801d1	tbz	w17, #27, 0xfffff7face60
   0x0000fffff7face2c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7face30:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7face34:	f100013f	cmp	x9, #0x0
   0x0000fffff7face38:	540002a1	b.ne	0xfffff7face8c  // b.any
   0x0000fffff7face3c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7face40:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7face44:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7face48:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7face4c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7face50:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7face54:	8a0901ca	and	x10, x14, x9
   0x0000fffff7face58:	f100055f	cmp	x10, #0x1
   0x0000fffff7face5c:	54000189	b.ls	0xfffff7face8c  // b.plast
   0x0000fffff7face60:	36d8008d	tbz	w13, #27, 0xfffff7face70
   0x0000fffff7face64:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7face68:	91000529	add	x9, x9, #0x1
   0x0000fffff7face6c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7face70:	36d80091	tbz	w17, #27, 0xfffff7face80
   0x0000fffff7face74:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7face78:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7face7c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7face80:	f900056c	str	x12, [x11, #8]
   0x0000fffff7face84:	b900016d	str	w13, [x11]
   0x0000fffff7face88:	1400000e	b	0xfffff7facec0
   0x0000fffff7face8c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7face90:	f94003e0	ldr	x0, [sp]
   0x0000fffff7face94:	aa1303e1	mov	x1, x19
   0x0000fffff7face98:	aa1503e2	mov	x2, x21
   0x0000fffff7face9c:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7facea0:	aa1403e4	mov	x4, x20
   0x0000fffff7facea4:	aa1603e5	mov	x5, x22
   0x0000fffff7facea8:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7faceac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faceb0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faceb4:	d63f0200	blr	x16
   0x0000fffff7faceb8:	f100001f	cmp	x0, #0x0
   0x0000fffff7facebc:	54006f40	b.eq	0xfffff7fadca4  // b.none
   0x0000fffff7facec0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7facec4:	f100017f	cmp	x11, #0x0
   0x0000fffff7facec8:	540004a0	b.eq	0xfffff7facf5c  // b.none
   0x0000fffff7facecc:	b940016d	ldr	w13, [x11]
   0x0000fffff7faced0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faced4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faced8:	eb0901bf	cmp	x13, x9
   0x0000fffff7facedc:	54000400	b.eq	0xfffff7facf5c  // b.none
   0x0000fffff7facee0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7facee4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7facee8:	36d801d1	tbz	w17, #27, 0xfffff7facf20
   0x0000fffff7faceec:	f94003e9	ldr	x9, [sp]
   0x0000fffff7facef0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7facef4:	f100013f	cmp	x9, #0x0
   0x0000fffff7facef8:	54000321	b.ne	0xfffff7facf5c  // b.any
   0x0000fffff7facefc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7facf00:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7facf04:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7facf08:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7facf0c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7facf10:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7facf14:	8a0901ca	and	x10, x14, x9
   0x0000fffff7facf18:	f100055f	cmp	x10, #0x1
   0x0000fffff7facf1c:	54000209	b.ls	0xfffff7facf5c  // b.plast
   0x0000fffff7facf20:	36d8008d	tbz	w13, #27, 0xfffff7facf30
   0x0000fffff7facf24:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7facf28:	91000529	add	x9, x9, #0x1
   0x0000fffff7facf2c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7facf30:	36d80091	tbz	w17, #27, 0xfffff7facf40
   0x0000fffff7facf34:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7facf38:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7facf3c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7facf40:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7facf44:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7facf48:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7facf4c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7facf50:	f900266c	str	x12, [x19, #72]
   0x0000fffff7facf54:	b900426d	str	w13, [x19, #64]
   0x0000fffff7facf58:	1400000e	b	0xfffff7facf90
   0x0000fffff7facf5c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7facf60:	f94003e0	ldr	x0, [sp]
   0x0000fffff7facf64:	aa1303e1	mov	x1, x19
   0x0000fffff7facf68:	aa1503e2	mov	x2, x21
   0x0000fffff7facf6c:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7facf70:	aa1403e4	mov	x4, x20
   0x0000fffff7facf74:	aa1603e5	mov	x5, x22
   0x0000fffff7facf78:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7facf7c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7facf80:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7facf84:	d63f0200	blr	x16
   0x0000fffff7facf88:	f100001f	cmp	x0, #0x0
   0x0000fffff7facf8c:	54006900	b.eq	0xfffff7fadcac  // b.none
   0x0000fffff7facf90:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7facf94:	37d806a9	tbnz	w9, #27, 0xfffff7fad068
   0x0000fffff7facf98:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7facf9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facfa0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facfa4:	eb0a013f	cmp	x9, x10
   0x0000fffff7facfa8:	540001c1	b.ne	0xfffff7facfe0  // b.any
   0x0000fffff7facfac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7facfb0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facfb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facfb8:	eb0a013f	cmp	x9, x10
   0x0000fffff7facfbc:	54000121	b.ne	0xfffff7facfe0  // b.any
   0x0000fffff7facfc0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7facfc4:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7facfc8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7facfcc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facfd0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facfd4:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7facfd8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7facfdc:	14000030	b	0xfffff7fad09c
   0x0000fffff7facfe0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7facfe4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7facfe8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facfec:	eb0a013f	cmp	x9, x10
   0x0000fffff7facff0:	54000120	b.eq	0xfffff7fad014  // b.none
   0x0000fffff7facff4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7facff8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facffc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad000:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad004:	54000321	b.ne	0xfffff7fad068  // b.any
   0x0000fffff7fad008:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fad00c:	9e620120	scvtf	d0, x9
   0x0000fffff7fad010:	14000002	b	0xfffff7fad018
   0x0000fffff7fad014:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fad018:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad01c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad020:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad024:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad028:	54000120	b.eq	0xfffff7fad04c  // b.none
   0x0000fffff7fad02c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad030:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad034:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad038:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad03c:	54000161	b.ne	0xfffff7fad068  // b.any
   0x0000fffff7fad040:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fad044:	9e620121	scvtf	d1, x9
   0x0000fffff7fad048:	14000002	b	0xfffff7fad050
   0x0000fffff7fad04c:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fad050:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fad054:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fad058:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad05c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad060:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fad064:	17ffffde	b	0xfffff7facfdc
   0x0000fffff7fad068:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad06c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad070:	aa1303e1	mov	x1, x19
   0x0000fffff7fad074:	aa1503e2	mov	x2, x21
   0x0000fffff7fad078:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fad07c:	aa1403e4	mov	x4, x20
   0x0000fffff7fad080:	aa1603e5	mov	x5, x22
   0x0000fffff7fad084:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7fad088:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad08c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad090:	d63f0200	blr	x16
   0x0000fffff7fad094:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad098:	540060e0	b.eq	0xfffff7fadcb4  // b.none
   0x0000fffff7fad09c:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fad0a0:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fad0a4:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fad0a8:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fad0ac:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fad0b0:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fad0b4:	36d801d1	tbz	w17, #27, 0xfffff7fad0ec
   0x0000fffff7fad0b8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fad0bc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fad0c0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fad0c4:	54000281	b.ne	0xfffff7fad114  // b.any
   0x0000fffff7fad0c8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fad0cc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad0d0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fad0d4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fad0d8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fad0dc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fad0e0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fad0e4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fad0e8:	54000169	b.ls	0xfffff7fad114  // b.plast
   0x0000fffff7fad0ec:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fad0f0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fad0f4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fad0f8:	36d80091	tbz	w17, #27, 0xfffff7fad108
   0x0000fffff7fad0fc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad100:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fad104:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fad108:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fad10c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fad110:	1400000e	b	0xfffff7fad148
   0x0000fffff7fad114:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad118:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad11c:	aa1303e1	mov	x1, x19
   0x0000fffff7fad120:	aa1503e2	mov	x2, x21
   0x0000fffff7fad124:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fad128:	aa1403e4	mov	x4, x20
   0x0000fffff7fad12c:	aa1603e5	mov	x5, x22
   0x0000fffff7fad130:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7fad134:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad138:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad13c:	d63f0200	blr	x16
   0x0000fffff7fad140:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad144:	54005bc0	b.eq	0xfffff7fadcbc  // b.none
   0x0000fffff7fad148:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fad14c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fad150:	540003a0	b.eq	0xfffff7fad1c4  // b.none
   0x0000fffff7fad154:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fad158:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fad15c:	b9400171	ldr	w17, [x11]
   0x0000fffff7fad160:	36d801d1	tbz	w17, #27, 0xfffff7fad198
   0x0000fffff7fad164:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fad168:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fad16c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fad170:	540002a1	b.ne	0xfffff7fad1c4  // b.any
   0x0000fffff7fad174:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fad178:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad17c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fad180:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fad184:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fad188:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fad18c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fad190:	f100055f	cmp	x10, #0x1
   0x0000fffff7fad194:	54000189	b.ls	0xfffff7fad1c4  // b.plast
   0x0000fffff7fad198:	36d8008d	tbz	w13, #27, 0xfffff7fad1a8
   0x0000fffff7fad19c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fad1a0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fad1a4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fad1a8:	36d80091	tbz	w17, #27, 0xfffff7fad1b8
   0x0000fffff7fad1ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad1b0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fad1b4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fad1b8:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fad1bc:	b900016d	str	w13, [x11]
   0x0000fffff7fad1c0:	1400000e	b	0xfffff7fad1f8
   0x0000fffff7fad1c4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fad1c8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad1cc:	aa1303e1	mov	x1, x19
   0x0000fffff7fad1d0:	aa1503e2	mov	x2, x21
   0x0000fffff7fad1d4:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fad1d8:	aa1403e4	mov	x4, x20
   0x0000fffff7fad1dc:	aa1603e5	mov	x5, x22
   0x0000fffff7fad1e0:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7fad1e4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad1e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad1ec:	d63f0200	blr	x16
   0x0000fffff7fad1f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad1f4:	54005680	b.eq	0xfffff7fadcc4  // b.none
   0x0000fffff7fad1f8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fad1fc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fad200:	540004a0	b.eq	0xfffff7fad294  // b.none
   0x0000fffff7fad204:	b940016d	ldr	w13, [x11]
   0x0000fffff7fad208:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fad20c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fad210:	eb0901bf	cmp	x13, x9
   0x0000fffff7fad214:	54000400	b.eq	0xfffff7fad294  // b.none
   0x0000fffff7fad218:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fad21c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fad220:	36d801d1	tbz	w17, #27, 0xfffff7fad258
   0x0000fffff7fad224:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fad228:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fad22c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fad230:	54000321	b.ne	0xfffff7fad294  // b.any
   0x0000fffff7fad234:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fad238:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad23c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fad240:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fad244:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fad248:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fad24c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fad250:	f100055f	cmp	x10, #0x1
   0x0000fffff7fad254:	54000209	b.ls	0xfffff7fad294  // b.plast
   0x0000fffff7fad258:	36d8008d	tbz	w13, #27, 0xfffff7fad268
   0x0000fffff7fad25c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fad260:	91000529	add	x9, x9, #0x1
   0x0000fffff7fad264:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fad268:	36d80091	tbz	w17, #27, 0xfffff7fad278
   0x0000fffff7fad26c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad270:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fad274:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fad278:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fad27c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fad280:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fad284:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fad288:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fad28c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fad290:	1400000e	b	0xfffff7fad2c8
   0x0000fffff7fad294:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fad298:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad29c:	aa1303e1	mov	x1, x19
   0x0000fffff7fad2a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fad2a4:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fad2a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fad2ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fad2b0:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fad2b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fad2b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad2bc:	d63f0200	blr	x16
   0x0000fffff7fad2c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad2c4:	54005040	b.eq	0xfffff7fadccc  // b.none
   0x0000fffff7fad2c8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad2cc:	37d806a9	tbnz	w9, #27, 0xfffff7fad3a0
   0x0000fffff7fad2d0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad2d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad2d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad2dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad2e0:	540001c1	b.ne	0xfffff7fad318  // b.any
   0x0000fffff7fad2e4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad2e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad2ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad2f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad2f4:	54000121	b.ne	0xfffff7fad318  // b.any
   0x0000fffff7fad2f8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fad2fc:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fad300:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fad304:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad308:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad30c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fad310:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fad314:	14000030	b	0xfffff7fad3d4
   0x0000fffff7fad318:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad31c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad320:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad324:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad328:	54000120	b.eq	0xfffff7fad34c  // b.none
   0x0000fffff7fad32c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad330:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad334:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad338:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad33c:	54000321	b.ne	0xfffff7fad3a0  // b.any
   0x0000fffff7fad340:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fad344:	9e620120	scvtf	d0, x9
   0x0000fffff7fad348:	14000002	b	0xfffff7fad350
   0x0000fffff7fad34c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fad350:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad354:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad358:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad35c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad360:	54000120	b.eq	0xfffff7fad384  // b.none
   0x0000fffff7fad364:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad368:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad36c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad370:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad374:	54000161	b.ne	0xfffff7fad3a0  // b.any
   0x0000fffff7fad378:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fad37c:	9e620121	scvtf	d1, x9
   0x0000fffff7fad380:	14000002	b	0xfffff7fad388
   0x0000fffff7fad384:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fad388:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fad38c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fad390:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad394:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad398:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fad39c:	17ffffde	b	0xfffff7fad314
   0x0000fffff7fad3a0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad3a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad3a8:	aa1303e1	mov	x1, x19
   0x0000fffff7fad3ac:	aa1503e2	mov	x2, x21
   0x0000fffff7fad3b0:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fad3b4:	aa1403e4	mov	x4, x20
   0x0000fffff7fad3b8:	aa1603e5	mov	x5, x22
   0x0000fffff7fad3bc:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7fad3c0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad3c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad3c8:	d63f0200	blr	x16
   0x0000fffff7fad3cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad3d0:	54004820	b.eq	0xfffff7fadcd4  // b.none
   0x0000fffff7fad3d4:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fad3d8:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fad3dc:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fad3e0:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fad3e4:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fad3e8:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fad3ec:	36d801d1	tbz	w17, #27, 0xfffff7fad424
   0x0000fffff7fad3f0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fad3f4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fad3f8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fad3fc:	54000281	b.ne	0xfffff7fad44c  // b.any
   0x0000fffff7fad400:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fad404:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad408:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fad40c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fad410:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fad414:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fad418:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fad41c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fad420:	54000169	b.ls	0xfffff7fad44c  // b.plast
   0x0000fffff7fad424:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fad428:	91000529	add	x9, x9, #0x1
   0x0000fffff7fad42c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fad430:	36d80091	tbz	w17, #27, 0xfffff7fad440
   0x0000fffff7fad434:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad438:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fad43c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fad440:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fad444:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fad448:	1400000e	b	0xfffff7fad480
   0x0000fffff7fad44c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad450:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad454:	aa1303e1	mov	x1, x19
   0x0000fffff7fad458:	aa1503e2	mov	x2, x21
   0x0000fffff7fad45c:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fad460:	aa1403e4	mov	x4, x20
   0x0000fffff7fad464:	aa1603e5	mov	x5, x22
   0x0000fffff7fad468:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7fad46c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad470:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad474:	d63f0200	blr	x16
   0x0000fffff7fad478:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad47c:	54004300	b.eq	0xfffff7fadcdc  // b.none
   0x0000fffff7fad480:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fad484:	f100017f	cmp	x11, #0x0
   0x0000fffff7fad488:	540003a0	b.eq	0xfffff7fad4fc  // b.none
   0x0000fffff7fad48c:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fad490:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fad494:	b9400171	ldr	w17, [x11]
   0x0000fffff7fad498:	36d801d1	tbz	w17, #27, 0xfffff7fad4d0
   0x0000fffff7fad49c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fad4a0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fad4a4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fad4a8:	540002a1	b.ne	0xfffff7fad4fc  // b.any
   0x0000fffff7fad4ac:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fad4b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad4b4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fad4b8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fad4bc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fad4c0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fad4c4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fad4c8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fad4cc:	54000189	b.ls	0xfffff7fad4fc  // b.plast
   0x0000fffff7fad4d0:	36d8008d	tbz	w13, #27, 0xfffff7fad4e0
   0x0000fffff7fad4d4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fad4d8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fad4dc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fad4e0:	36d80091	tbz	w17, #27, 0xfffff7fad4f0
   0x0000fffff7fad4e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad4e8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fad4ec:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fad4f0:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fad4f4:	b900016d	str	w13, [x11]
   0x0000fffff7fad4f8:	1400000e	b	0xfffff7fad530
   0x0000fffff7fad4fc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fad500:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad504:	aa1303e1	mov	x1, x19
   0x0000fffff7fad508:	aa1503e2	mov	x2, x21
   0x0000fffff7fad50c:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fad510:	aa1403e4	mov	x4, x20
   0x0000fffff7fad514:	aa1603e5	mov	x5, x22
   0x0000fffff7fad518:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7fad51c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad520:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad524:	d63f0200	blr	x16
   0x0000fffff7fad528:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad52c:	54003dc0	b.eq	0xfffff7fadce4  // b.none
   0x0000fffff7fad530:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fad534:	f100017f	cmp	x11, #0x0
   0x0000fffff7fad538:	540004a0	b.eq	0xfffff7fad5cc  // b.none
   0x0000fffff7fad53c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fad540:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fad544:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fad548:	eb0901bf	cmp	x13, x9
   0x0000fffff7fad54c:	54000400	b.eq	0xfffff7fad5cc  // b.none
   0x0000fffff7fad550:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fad554:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fad558:	36d801d1	tbz	w17, #27, 0xfffff7fad590
   0x0000fffff7fad55c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fad560:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fad564:	f100013f	cmp	x9, #0x0
   0x0000fffff7fad568:	54000321	b.ne	0xfffff7fad5cc  // b.any
   0x0000fffff7fad56c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fad570:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad574:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fad578:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fad57c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fad580:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fad584:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fad588:	f100055f	cmp	x10, #0x1
   0x0000fffff7fad58c:	54000209	b.ls	0xfffff7fad5cc  // b.plast
   0x0000fffff7fad590:	36d8008d	tbz	w13, #27, 0xfffff7fad5a0
   0x0000fffff7fad594:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fad598:	91000529	add	x9, x9, #0x1
   0x0000fffff7fad59c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fad5a0:	36d80091	tbz	w17, #27, 0xfffff7fad5b0
   0x0000fffff7fad5a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad5a8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fad5ac:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fad5b0:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fad5b4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fad5b8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fad5bc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fad5c0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fad5c4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fad5c8:	1400000e	b	0xfffff7fad600
   0x0000fffff7fad5cc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fad5d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad5d4:	aa1303e1	mov	x1, x19
   0x0000fffff7fad5d8:	aa1503e2	mov	x2, x21
   0x0000fffff7fad5dc:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fad5e0:	aa1403e4	mov	x4, x20
   0x0000fffff7fad5e4:	aa1603e5	mov	x5, x22
   0x0000fffff7fad5e8:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fad5ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fad5f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad5f4:	d63f0200	blr	x16
   0x0000fffff7fad5f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad5fc:	54003780	b.eq	0xfffff7fadcec  // b.none
   0x0000fffff7fad600:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad604:	37d806a9	tbnz	w9, #27, 0xfffff7fad6d8
   0x0000fffff7fad608:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad60c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad610:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad614:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad618:	540001c1	b.ne	0xfffff7fad650  // b.any
   0x0000fffff7fad61c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad620:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad624:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad628:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad62c:	54000121	b.ne	0xfffff7fad650  // b.any
   0x0000fffff7fad630:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fad634:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fad638:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fad63c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad640:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad644:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fad648:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fad64c:	14000030	b	0xfffff7fad70c
   0x0000fffff7fad650:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad654:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad658:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad65c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad660:	54000120	b.eq	0xfffff7fad684  // b.none
   0x0000fffff7fad664:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad668:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad66c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad670:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad674:	54000321	b.ne	0xfffff7fad6d8  // b.any
   0x0000fffff7fad678:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fad67c:	9e620120	scvtf	d0, x9
   0x0000fffff7fad680:	14000002	b	0xfffff7fad688
   0x0000fffff7fad684:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fad688:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad68c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad690:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad694:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad698:	54000120	b.eq	0xfffff7fad6bc  // b.none
   0x0000fffff7fad69c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad6a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad6a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad6a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad6ac:	54000161	b.ne	0xfffff7fad6d8  // b.any
   0x0000fffff7fad6b0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fad6b4:	9e620121	scvtf	d1, x9
   0x0000fffff7fad6b8:	14000002	b	0xfffff7fad6c0
   0x0000fffff7fad6bc:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fad6c0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fad6c4:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fad6c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad6cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad6d0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fad6d4:	17ffffde	b	0xfffff7fad64c
   0x0000fffff7fad6d8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad6dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad6e0:	aa1303e1	mov	x1, x19
   0x0000fffff7fad6e4:	aa1503e2	mov	x2, x21
   0x0000fffff7fad6e8:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fad6ec:	aa1403e4	mov	x4, x20
   0x0000fffff7fad6f0:	aa1603e5	mov	x5, x22
   0x0000fffff7fad6f4:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7fad6f8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad6fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad700:	d63f0200	blr	x16
   0x0000fffff7fad704:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad708:	54002f60	b.eq	0xfffff7fadcf4  // b.none
   0x0000fffff7fad70c:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fad710:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fad714:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fad718:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fad71c:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fad720:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fad724:	36d801d1	tbz	w17, #27, 0xfffff7fad75c
   0x0000fffff7fad728:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fad72c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fad730:	f100013f	cmp	x9, #0x0
   0x0000fffff7fad734:	54000281	b.ne	0xfffff7fad784  // b.any
   0x0000fffff7fad738:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fad73c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad740:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fad744:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fad748:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fad74c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fad750:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fad754:	f100055f	cmp	x10, #0x1
   0x0000fffff7fad758:	54000169	b.ls	0xfffff7fad784  // b.plast
   0x0000fffff7fad75c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fad760:	91000529	add	x9, x9, #0x1
   0x0000fffff7fad764:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fad768:	36d80091	tbz	w17, #27, 0xfffff7fad778
   0x0000fffff7fad76c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad770:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fad774:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fad778:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fad77c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fad780:	1400000e	b	0xfffff7fad7b8
   0x0000fffff7fad784:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad788:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad78c:	aa1303e1	mov	x1, x19
   0x0000fffff7fad790:	aa1503e2	mov	x2, x21
   0x0000fffff7fad794:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fad798:	aa1403e4	mov	x4, x20
   0x0000fffff7fad79c:	aa1603e5	mov	x5, x22
   0x0000fffff7fad7a0:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7fad7a4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad7a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad7ac:	d63f0200	blr	x16
   0x0000fffff7fad7b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad7b4:	54002a40	b.eq	0xfffff7fadcfc  // b.none
   0x0000fffff7fad7b8:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fad7bc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fad7c0:	540003a0	b.eq	0xfffff7fad834  // b.none
   0x0000fffff7fad7c4:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fad7c8:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fad7cc:	b9400171	ldr	w17, [x11]
   0x0000fffff7fad7d0:	36d801d1	tbz	w17, #27, 0xfffff7fad808
   0x0000fffff7fad7d4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fad7d8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fad7dc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fad7e0:	540002a1	b.ne	0xfffff7fad834  // b.any
   0x0000fffff7fad7e4:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fad7e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad7ec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fad7f0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fad7f4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fad7f8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fad7fc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fad800:	f100055f	cmp	x10, #0x1
   0x0000fffff7fad804:	54000189	b.ls	0xfffff7fad834  // b.plast
   0x0000fffff7fad808:	36d8008d	tbz	w13, #27, 0xfffff7fad818
   0x0000fffff7fad80c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fad810:	91000529	add	x9, x9, #0x1
   0x0000fffff7fad814:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fad818:	36d80091	tbz	w17, #27, 0xfffff7fad828
   0x0000fffff7fad81c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad820:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fad824:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fad828:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fad82c:	b900016d	str	w13, [x11]
   0x0000fffff7fad830:	1400000e	b	0xfffff7fad868
   0x0000fffff7fad834:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fad838:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad83c:	aa1303e1	mov	x1, x19
   0x0000fffff7fad840:	aa1503e2	mov	x2, x21
   0x0000fffff7fad844:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fad848:	aa1403e4	mov	x4, x20
   0x0000fffff7fad84c:	aa1603e5	mov	x5, x22
   0x0000fffff7fad850:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7fad854:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad858:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad85c:	d63f0200	blr	x16
   0x0000fffff7fad860:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad864:	54002500	b.eq	0xfffff7fadd04  // b.none
   0x0000fffff7fad868:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fad86c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fad870:	540004a0	b.eq	0xfffff7fad904  // b.none
   0x0000fffff7fad874:	b940016d	ldr	w13, [x11]
   0x0000fffff7fad878:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fad87c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fad880:	eb0901bf	cmp	x13, x9
   0x0000fffff7fad884:	54000400	b.eq	0xfffff7fad904  // b.none
   0x0000fffff7fad888:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fad88c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fad890:	36d801d1	tbz	w17, #27, 0xfffff7fad8c8
   0x0000fffff7fad894:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fad898:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fad89c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fad8a0:	54000321	b.ne	0xfffff7fad904  // b.any
   0x0000fffff7fad8a4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fad8a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad8ac:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fad8b0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fad8b4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fad8b8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fad8bc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fad8c0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fad8c4:	54000209	b.ls	0xfffff7fad904  // b.plast
   0x0000fffff7fad8c8:	36d8008d	tbz	w13, #27, 0xfffff7fad8d8
   0x0000fffff7fad8cc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fad8d0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fad8d4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fad8d8:	36d80091	tbz	w17, #27, 0xfffff7fad8e8
   0x0000fffff7fad8dc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad8e0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fad8e4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fad8e8:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fad8ec:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fad8f0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fad8f4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fad8f8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fad8fc:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fad900:	1400000e	b	0xfffff7fad938
   0x0000fffff7fad904:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fad908:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad90c:	aa1303e1	mov	x1, x19
   0x0000fffff7fad910:	aa1503e2	mov	x2, x21
   0x0000fffff7fad914:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7fad918:	aa1403e4	mov	x4, x20
   0x0000fffff7fad91c:	aa1603e5	mov	x5, x22
   0x0000fffff7fad920:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fad924:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fad928:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad92c:	d63f0200	blr	x16
   0x0000fffff7fad930:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad934:	54001ec0	b.eq	0xfffff7fadd0c  // b.none
   0x0000fffff7fad938:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad93c:	37d806a9	tbnz	w9, #27, 0xfffff7fada10
   0x0000fffff7fad940:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad944:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad948:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad94c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad950:	540001c1	b.ne	0xfffff7fad988  // b.any
   0x0000fffff7fad954:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad958:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad95c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad960:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad964:	54000121	b.ne	0xfffff7fad988  // b.any
   0x0000fffff7fad968:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fad96c:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fad970:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fad974:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad978:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad97c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fad980:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fad984:	14000030	b	0xfffff7fada44
   0x0000fffff7fad988:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad98c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad990:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad994:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad998:	54000120	b.eq	0xfffff7fad9bc  // b.none
   0x0000fffff7fad99c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad9a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad9a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad9a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad9ac:	54000321	b.ne	0xfffff7fada10  // b.any
   0x0000fffff7fad9b0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fad9b4:	9e620120	scvtf	d0, x9
   0x0000fffff7fad9b8:	14000002	b	0xfffff7fad9c0
   0x0000fffff7fad9bc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fad9c0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad9c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad9c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad9cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad9d0:	54000120	b.eq	0xfffff7fad9f4  // b.none
   0x0000fffff7fad9d4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad9d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad9dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad9e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad9e4:	54000161	b.ne	0xfffff7fada10  // b.any
   0x0000fffff7fad9e8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fad9ec:	9e620121	scvtf	d1, x9
   0x0000fffff7fad9f0:	14000002	b	0xfffff7fad9f8
   0x0000fffff7fad9f4:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fad9f8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fad9fc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fada00:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fada04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fada08:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fada0c:	17ffffde	b	0xfffff7fad984
   0x0000fffff7fada10:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fada14:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fada18:	aa1303e1	mov	x1, x19
   0x0000fffff7fada1c:	aa1503e2	mov	x2, x21
   0x0000fffff7fada20:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7fada24:	aa1403e4	mov	x4, x20
   0x0000fffff7fada28:	aa1603e5	mov	x5, x22
   0x0000fffff7fada2c:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7fada30:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fada34:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fada38:	d63f0200	blr	x16
   0x0000fffff7fada3c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fada40:	540016a0	b.eq	0xfffff7fadd14  // b.none
   0x0000fffff7fada44:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fada48:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fada4c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fada50:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fada54:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fada58:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fada5c:	36d801d1	tbz	w17, #27, 0xfffff7fada94
   0x0000fffff7fada60:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fada64:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fada68:	f100013f	cmp	x9, #0x0
   0x0000fffff7fada6c:	54000281	b.ne	0xfffff7fadabc  // b.any
   0x0000fffff7fada70:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fada74:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fada78:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fada7c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fada80:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fada84:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fada88:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fada8c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fada90:	54000169	b.ls	0xfffff7fadabc  // b.plast
   0x0000fffff7fada94:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fada98:	91000529	add	x9, x9, #0x1
   0x0000fffff7fada9c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fadaa0:	36d80091	tbz	w17, #27, 0xfffff7fadab0
   0x0000fffff7fadaa4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fadaa8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fadaac:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fadab0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fadab4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fadab8:	1400000e	b	0xfffff7fadaf0
   0x0000fffff7fadabc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fadac0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fadac4:	aa1303e1	mov	x1, x19
   0x0000fffff7fadac8:	aa1503e2	mov	x2, x21
   0x0000fffff7fadacc:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7fadad0:	aa1403e4	mov	x4, x20
   0x0000fffff7fadad4:	aa1603e5	mov	x5, x22
   0x0000fffff7fadad8:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7fadadc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fadae0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fadae4:	d63f0200	blr	x16
   0x0000fffff7fadae8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fadaec:	54001180	b.eq	0xfffff7fadd1c  // b.none
   0x0000fffff7fadaf0:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fadaf4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fadaf8:	540003a0	b.eq	0xfffff7fadb6c  // b.none
   0x0000fffff7fadafc:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fadb00:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fadb04:	b9400171	ldr	w17, [x11]
   0x0000fffff7fadb08:	36d801d1	tbz	w17, #27, 0xfffff7fadb40
   0x0000fffff7fadb0c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fadb10:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fadb14:	f100013f	cmp	x9, #0x0
   0x0000fffff7fadb18:	540002a1	b.ne	0xfffff7fadb6c  // b.any
   0x0000fffff7fadb1c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fadb20:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fadb24:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fadb28:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fadb2c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fadb30:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fadb34:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fadb38:	f100055f	cmp	x10, #0x1
   0x0000fffff7fadb3c:	54000189	b.ls	0xfffff7fadb6c  // b.plast
   0x0000fffff7fadb40:	36d8008d	tbz	w13, #27, 0xfffff7fadb50
   0x0000fffff7fadb44:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fadb48:	91000529	add	x9, x9, #0x1
   0x0000fffff7fadb4c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fadb50:	36d80091	tbz	w17, #27, 0xfffff7fadb60
   0x0000fffff7fadb54:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fadb58:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fadb5c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fadb60:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fadb64:	b900016d	str	w13, [x11]
   0x0000fffff7fadb68:	1400000e	b	0xfffff7fadba0
   0x0000fffff7fadb6c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fadb70:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fadb74:	aa1303e1	mov	x1, x19
   0x0000fffff7fadb78:	aa1503e2	mov	x2, x21
   0x0000fffff7fadb7c:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7fadb80:	aa1403e4	mov	x4, x20
   0x0000fffff7fadb84:	aa1603e5	mov	x5, x22
   0x0000fffff7fadb88:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7fadb8c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fadb90:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fadb94:	d63f0200	blr	x16
   0x0000fffff7fadb98:	f100001f	cmp	x0, #0x0
   0x0000fffff7fadb9c:	54000c40	b.eq	0xfffff7fadd24  // b.none
   0x0000fffff7fadba0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fadba4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fadba8:	aa1303e1	mov	x1, x19
   0x0000fffff7fadbac:	aa1503e2	mov	x2, x21
   0x0000fffff7fadbb0:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7fadbb4:	aa1403e4	mov	x4, x20
   0x0000fffff7fadbb8:	aa1603e5	mov	x5, x22
   0x0000fffff7fadbbc:	d2869090	mov	x16, #0x3484                	// #13444
   0x0000fffff7fadbc0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fadbc4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fadbc8:	d63f0200	blr	x16
   0x0000fffff7fadbcc:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fadbd0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fadbd4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fadbd8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fadbdc:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fadbe0:	d65f03c0	ret
   0x0000fffff7fadbe4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fadbe8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fadbec:	b900028a	str	w10, [x20]
   0x0000fffff7fadbf0:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fadbf4:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fadbf8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fadbfc:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fadc00:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fadc04:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fadc08:	d65f03c0	ret
   0x0000fffff7fadc0c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fadc10:	17fffff5	b	0xfffff7fadbe4
   0x0000fffff7fadc14:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fadc18:	17fffff3	b	0xfffff7fadbe4
   0x0000fffff7fadc1c:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fadc20:	17fffff1	b	0xfffff7fadbe4
   0x0000fffff7fadc24:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fadc28:	17ffffef	b	0xfffff7fadbe4
   0x0000fffff7fadc2c:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fadc30:	17ffffed	b	0xfffff7fadbe4
   0x0000fffff7fadc34:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fadc38:	17ffffeb	b	0xfffff7fadbe4
   0x0000fffff7fadc3c:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fadc40:	17ffffe9	b	0xfffff7fadbe4
   0x0000fffff7fadc44:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fadc48:	17ffffe7	b	0xfffff7fadbe4
   0x0000fffff7fadc4c:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fadc50:	17ffffe5	b	0xfffff7fadbe4
   0x0000fffff7fadc54:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fadc58:	17ffffe3	b	0xfffff7fadbe4
   0x0000fffff7fadc5c:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fadc60:	17ffffe1	b	0xfffff7fadbe4
   0x0000fffff7fadc64:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fadc68:	17ffffdf	b	0xfffff7fadbe4
   0x0000fffff7fadc6c:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fadc70:	17ffffdd	b	0xfffff7fadbe4
   0x0000fffff7fadc74:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fadc78:	17ffffdb	b	0xfffff7fadbe4
   0x0000fffff7fadc7c:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fadc80:	17ffffd9	b	0xfffff7fadbe4
   0x0000fffff7fadc84:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fadc88:	17ffffd7	b	0xfffff7fadbe4
   0x0000fffff7fadc8c:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fadc90:	17ffffd5	b	0xfffff7fadbe4
   0x0000fffff7fadc94:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fadc98:	17ffffd3	b	0xfffff7fadbe4
   0x0000fffff7fadc9c:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fadca0:	17ffffd1	b	0xfffff7fadbe4
   0x0000fffff7fadca4:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fadca8:	17ffffcf	b	0xfffff7fadbe4
   0x0000fffff7fadcac:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fadcb0:	17ffffcd	b	0xfffff7fadbe4
   0x0000fffff7fadcb4:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fadcb8:	17ffffcb	b	0xfffff7fadbe4
   0x0000fffff7fadcbc:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fadcc0:	17ffffc9	b	0xfffff7fadbe4
   0x0000fffff7fadcc4:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fadcc8:	17ffffc7	b	0xfffff7fadbe4
   0x0000fffff7fadccc:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fadcd0:	17ffffc5	b	0xfffff7fadbe4
   0x0000fffff7fadcd4:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fadcd8:	17ffffc3	b	0xfffff7fadbe4
   0x0000fffff7fadcdc:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fadce0:	17ffffc1	b	0xfffff7fadbe4
   0x0000fffff7fadce4:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fadce8:	17ffffbf	b	0xfffff7fadbe4
   0x0000fffff7fadcec:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fadcf0:	17ffffbd	b	0xfffff7fadbe4
   0x0000fffff7fadcf4:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fadcf8:	17ffffbb	b	0xfffff7fadbe4
   0x0000fffff7fadcfc:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7fadd00:	17ffffb9	b	0xfffff7fadbe4
   0x0000fffff7fadd04:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fadd08:	17ffffb7	b	0xfffff7fadbe4
   0x0000fffff7fadd0c:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7fadd10:	17ffffb5	b	0xfffff7fadbe4
   0x0000fffff7fadd14:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7fadd18:	17ffffb3	b	0xfffff7fadbe4
   0x0000fffff7fadd1c:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7fadd20:	17ffffb1	b	0xfffff7fadbe4
   0x0000fffff7fadd24:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7fadd28:	17ffffaf	b	0xfffff7fadbe4
   0x0000fffff7fadd2c:	00000000	udf	#0
   0x0000fffff7fadd30:	00000000	udf	#0
   0x0000fffff7fadd34:	00000000	udf	#0
   0x0000fffff7fadd38:	00000000	udf	#0
   0x0000fffff7fadd3c:	00000000	udf	#0
   0x0000fffff7fadd40:	00000000	udf	#0
   0x0000fffff7fadd44:	00000000	udf	#0
   0x0000fffff7fadd48:	00000000	udf	#0
   0x0000fffff7fadd4c:	00000000	udf	#0
   0x0000fffff7fadd50:	00000000	udf	#0
   0x0000fffff7fadd54:	00000000	udf	#0
   0x0000fffff7fadd58:	00000000	udf	#0
   0x0000fffff7fadd5c:	00000000	udf	#0
   0x0000fffff7fadd60:	00000000	udf	#0
   0x0000fffff7fadd64:	00000000	udf	#0
   0x0000fffff7fadd68:	00000000	udf	#0
   0x0000fffff7fadd6c:	00000000	udf	#0
   0x0000fffff7fadd70:	00000000	udf	#0
   0x0000fffff7fadd74:	00000000	udf	#0
   0x0000fffff7fadd78:	00000000	udf	#0
   0x0000fffff7fadd7c:	00000000	udf	#0
   0x0000fffff7fadd80:	00000000	udf	#0
   0x0000fffff7fadd84:	00000000	udf	#0
   0x0000fffff7fadd88:	00000000	udf	#0
   0x0000fffff7fadd8c:	00000000	udf	#0
   0x0000fffff7fadd90:	00000000	udf	#0
   0x0000fffff7fadd94:	00000000	udf	#0
   0x0000fffff7fadd98:	00000000	udf	#0
   0x0000fffff7fadd9c:	00000000	udf	#0
   0x0000fffff7fadda0:	00000000	udf	#0
   0x0000fffff7fadda4:	00000000	udf	#0
   0x0000fffff7fadda8:	00000000	udf	#0
   0x0000fffff7faddac:	00000000	udf	#0
   0x0000fffff7faddb0:	00000000	udf	#0
   0x0000fffff7faddb4:	00000000	udf	#0
   0x0000fffff7faddb8:	00000000	udf	#0
   0x0000fffff7faddbc:	00000000	udf	#0
   0x0000fffff7faddc0:	00000000	udf	#0
   0x0000fffff7faddc4:	00000000	udf	#0
   0x0000fffff7faddc8:	00000000	udf	#0
   0x0000fffff7faddcc:	00000000	udf	#0
   0x0000fffff7faddd0:	00000000	udf	#0
   0x0000fffff7faddd4:	00000000	udf	#0
   0x0000fffff7faddd8:	00000000	udf	#0
   0x0000fffff7fadddc:	00000000	udf	#0
   0x0000fffff7fadde0:	00000000	udf	#0
   0x0000fffff7fadde4:	00000000	udf	#0
   0x0000fffff7fadde8:	00000000	udf	#0
   0x0000fffff7faddec:	00000000	udf	#0
   0x0000fffff7faddf0:	00000000	udf	#0
   0x0000fffff7faddf4:	00000000	udf	#0
   0x0000fffff7faddf8:	00000000	udf	#0
   0x0000fffff7faddfc:	00000000	udf	#0
   0x0000fffff7fade00:	00000000	udf	#0
   0x0000fffff7fade04:	00000000	udf	#0
   0x0000fffff7fade08:	00000000	udf	#0
   0x0000fffff7fade0c:	00000000	udf	#0
   0x0000fffff7fade10:	00000000	udf	#0
   0x0000fffff7fade14:	00000000	udf	#0
   0x0000fffff7fade18:	00000000	udf	#0
   0x0000fffff7fade1c:	00000000	udf	#0
   0x0000fffff7fade20:	00000000	udf	#0
   0x0000fffff7fade24:	00000000	udf	#0
   0x0000fffff7fade28:	00000000	udf	#0
   0x0000fffff7fade2c:	00000000	udf	#0
   0x0000fffff7fade30:	00000000	udf	#0
   0x0000fffff7fade34:	00000000	udf	#0
   0x0000fffff7fade38:	00000000	udf	#0
   0x0000fffff7fade3c:	00000000	udf	#0
   0x0000fffff7fade40:	00000000	udf	#0
   0x0000fffff7fade44:	00000000	udf	#0
   0x0000fffff7fade48:	00000000	udf	#0
   0x0000fffff7fade4c:	00000000	udf	#0
   0x0000fffff7fade50:	00000000	udf	#0
   0x0000fffff7fade54:	00000000	udf	#0
   0x0000fffff7fade58:	00000000	udf	#0
   0x0000fffff7fade5c:	00000000	udf	#0
   0x0000fffff7fade60:	00000000	udf	#0
   0x0000fffff7fade64:	00000000	udf	#0
   0x0000fffff7fade68:	00000000	udf	#0
   0x0000fffff7fade6c:	00000000	udf	#0
   0x0000fffff7fade70:	00000000	udf	#0
   0x0000fffff7fade74:	00000000	udf	#0
   0x0000fffff7fade78:	00000000	udf	#0
   0x0000fffff7fade7c:	00000000	udf	#0
   0x0000fffff7fade80:	00000000	udf	#0
   0x0000fffff7fade84:	00000000	udf	#0
   0x0000fffff7fade88:	00000000	udf	#0
   0x0000fffff7fade8c:	00000000	udf	#0
   0x0000fffff7fade90:	00000000	udf	#0
   0x0000fffff7fade94:	00000000	udf	#0
   0x0000fffff7fade98:	00000000	udf	#0
   0x0000fffff7fade9c:	00000000	udf	#0
   0x0000fffff7fadea0:	00000000	udf	#0
   0x0000fffff7fadea4:	00000000	udf	#0
   0x0000fffff7fadea8:	00000000	udf	#0
   0x0000fffff7fadeac:	00000000	udf	#0
   0x0000fffff7fadeb0:	00000000	udf	#0
   0x0000fffff7fadeb4:	00000000	udf	#0
   0x0000fffff7fadeb8:	00000000	udf	#0
   0x0000fffff7fadebc:	00000000	udf	#0
   0x0000fffff7fadec0:	00000000	udf	#0
   0x0000fffff7fadec4:	00000000	udf	#0
   0x0000fffff7fadec8:	00000000	udf	#0
   0x0000fffff7fadecc:	00000000	udf	#0
   0x0000fffff7faded0:	00000000	udf	#0
   0x0000fffff7faded4:	00000000	udf	#0
   0x0000fffff7faded8:	00000000	udf	#0
   0x0000fffff7fadedc:	00000000	udf	#0
   0x0000fffff7fadee0:	00000000	udf	#0
   0x0000fffff7fadee4:	00000000	udf	#0
   0x0000fffff7fadee8:	00000000	udf	#0
   0x0000fffff7fadeec:	00000000	udf	#0
   0x0000fffff7fadef0:	00000000	udf	#0
   0x0000fffff7fadef4:	00000000	udf	#0
   0x0000fffff7fadef8:	00000000	udf	#0
   0x0000fffff7fadefc:	00000000	udf	#0
   0x0000fffff7fadf00:	00000000	udf	#0
   0x0000fffff7fadf04:	00000000	udf	#0
   0x0000fffff7fadf08:	00000000	udf	#0
   0x0000fffff7fadf0c:	00000000	udf	#0
   0x0000fffff7fadf10:	00000000	udf	#0
   0x0000fffff7fadf14:	00000000	udf	#0
   0x0000fffff7fadf18:	00000000	udf	#0
   0x0000fffff7fadf1c:	00000000	udf	#0
   0x0000fffff7fadf20:	00000000	udf	#0
   0x0000fffff7fadf24:	00000000	udf	#0
   0x0000fffff7fadf28:	00000000	udf	#0
   0x0000fffff7fadf2c:	00000000	udf	#0
   0x0000fffff7fadf30:	00000000	udf	#0
   0x0000fffff7fadf34:	00000000	udf	#0
   0x0000fffff7fadf38:	00000000	udf	#0
   0x0000fffff7fadf3c:	00000000	udf	#0
   0x0000fffff7fadf40:	00000000	udf	#0
   0x0000fffff7fadf44:	00000000	udf	#0
   0x0000fffff7fadf48:	00000000	udf	#0
   0x0000fffff7fadf4c:	00000000	udf	#0
   0x0000fffff7fadf50:	00000000	udf	#0
   0x0000fffff7fadf54:	00000000	udf	#0
   0x0000fffff7fadf58:	00000000	udf	#0
   0x0000fffff7fadf5c:	00000000	udf	#0
   0x0000fffff7fadf60:	00000000	udf	#0
   0x0000fffff7fadf64:	00000000	udf	#0
   0x0000fffff7fadf68:	00000000	udf	#0
   0x0000fffff7fadf6c:	00000000	udf	#0
   0x0000fffff7fadf70:	00000000	udf	#0
   0x0000fffff7fadf74:	00000000	udf	#0
   0x0000fffff7fadf78:	00000000	udf	#0
   0x0000fffff7fadf7c:	00000000	udf	#0
   0x0000fffff7fadf80:	00000000	udf	#0
   0x0000fffff7fadf84:	00000000	udf	#0
   0x0000fffff7fadf88:	00000000	udf	#0
   0x0000fffff7fadf8c:	00000000	udf	#0
   0x0000fffff7fadf90:	00000000	udf	#0
   0x0000fffff7fadf94:	00000000	udf	#0
   0x0000fffff7fadf98:	00000000	udf	#0
   0x0000fffff7fadf9c:	00000000	udf	#0
   0x0000fffff7fadfa0:	00000000	udf	#0
   0x0000fffff7fadfa4:	00000000	udf	#0
   0x0000fffff7fadfa8:	00000000	udf	#0
   0x0000fffff7fadfac:	00000000	udf	#0
   0x0000fffff7fadfb0:	00000000	udf	#0
   0x0000fffff7fadfb4:	00000000	udf	#0
   0x0000fffff7fadfb8:	00000000	udf	#0
   0x0000fffff7fadfbc:	00000000	udf	#0
   0x0000fffff7fadfc0:	00000000	udf	#0
   0x0000fffff7fadfc4:	00000000	udf	#0
   0x0000fffff7fadfc8:	00000000	udf	#0
   0x0000fffff7fadfcc:	00000000	udf	#0
   0x0000fffff7fadfd0:	00000000	udf	#0
   0x0000fffff7fadfd4:	00000000	udf	#0
   0x0000fffff7fadfd8:	00000000	udf	#0
   0x0000fffff7fadfdc:	00000000	udf	#0
   0x0000fffff7fadfe0:	00000000	udf	#0
   0x0000fffff7fadfe4:	00000000	udf	#0
   0x0000fffff7fadfe8:	00000000	udf	#0
   0x0000fffff7fadfec:	00000000	udf	#0
   0x0000fffff7fadff0:	00000000	udf	#0
   0x0000fffff7fadff4:	00000000	udf	#0
   0x0000fffff7fadff8:	00000000	udf	#0
   0x0000fffff7fadffc:	00000000	udf	#0
End of assembler dump.
