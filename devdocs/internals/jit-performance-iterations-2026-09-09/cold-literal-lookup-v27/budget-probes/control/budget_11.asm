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
   0x0000fffff7fac058:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac05c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac060:	aa1303e1	mov	x1, x19
   0x0000fffff7fac064:	aa1503e2	mov	x2, x21
   0x0000fffff7fac068:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fac06c:	aa1403e4	mov	x4, x20
   0x0000fffff7fac070:	aa1603e5	mov	x5, x22
   0x0000fffff7fac074:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fac078:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac07c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac080:	d63f0200	blr	x16
   0x0000fffff7fac084:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac088:	5400cce0	b.eq	0xfffff7fada24  // b.none
   0x0000fffff7fac08c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac090:	37d800e9	tbnz	w9, #27, 0xfffff7fac0ac
   0x0000fffff7fac094:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fac098:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac09c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac0a0:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fac0a4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fac0a8:	1400000e	b	0xfffff7fac0e0
   0x0000fffff7fac0ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac0b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac0b4:	aa1303e1	mov	x1, x19
   0x0000fffff7fac0b8:	aa1503e2	mov	x2, x21
   0x0000fffff7fac0bc:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fac0c0:	aa1403e4	mov	x4, x20
   0x0000fffff7fac0c4:	aa1603e5	mov	x5, x22
   0x0000fffff7fac0c8:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fac0cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac0d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac0d4:	d63f0200	blr	x16
   0x0000fffff7fac0d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac0dc:	5400ca80	b.eq	0xfffff7fada2c  // b.none
   0x0000fffff7fac0e0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fac0e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac0e8:	aa1303e1	mov	x1, x19
   0x0000fffff7fac0ec:	aa1503e2	mov	x2, x21
   0x0000fffff7fac0f0:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fac0f4:	aa1403e4	mov	x4, x20
   0x0000fffff7fac0f8:	aa1603e5	mov	x5, x22
   0x0000fffff7fac0fc:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fac100:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac104:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac108:	d63f0200	blr	x16
   0x0000fffff7fac10c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac110:	5400c920	b.eq	0xfffff7fada34  // b.none
   0x0000fffff7fac114:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac118:	37d800e9	tbnz	w9, #27, 0xfffff7fac134
   0x0000fffff7fac11c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fac120:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac124:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac128:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fac12c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fac130:	1400000e	b	0xfffff7fac168
   0x0000fffff7fac134:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac138:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac13c:	aa1303e1	mov	x1, x19
   0x0000fffff7fac140:	aa1503e2	mov	x2, x21
   0x0000fffff7fac144:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7fac148:	aa1403e4	mov	x4, x20
   0x0000fffff7fac14c:	aa1603e5	mov	x5, x22
   0x0000fffff7fac150:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fac154:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac158:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac15c:	d63f0200	blr	x16
   0x0000fffff7fac160:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac164:	5400c6c0	b.eq	0xfffff7fada3c  // b.none
   0x0000fffff7fac168:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fac16c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac170:	aa1303e1	mov	x1, x19
   0x0000fffff7fac174:	aa1503e2	mov	x2, x21
   0x0000fffff7fac178:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7fac17c:	aa1403e4	mov	x4, x20
   0x0000fffff7fac180:	aa1603e5	mov	x5, x22
   0x0000fffff7fac184:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fac188:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac18c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac190:	d63f0200	blr	x16
   0x0000fffff7fac194:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac198:	5400c560	b.eq	0xfffff7fada44  // b.none
   0x0000fffff7fac19c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac1a0:	37d806a9	tbnz	w9, #27, 0xfffff7fac274
   0x0000fffff7fac1a4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac1a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac1ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac1b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac1b4:	540001c1	b.ne	0xfffff7fac1ec  // b.any
   0x0000fffff7fac1b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac1bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac1c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac1c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac1c8:	54000121	b.ne	0xfffff7fac1ec  // b.any
   0x0000fffff7fac1cc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fac1d0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fac1d4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fac1d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac1dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac1e0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fac1e4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fac1e8:	14000030	b	0xfffff7fac2a8
   0x0000fffff7fac1ec:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac1f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac1f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac1f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac1fc:	54000120	b.eq	0xfffff7fac220  // b.none
   0x0000fffff7fac200:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac204:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac208:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac20c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac210:	54000321	b.ne	0xfffff7fac274  // b.any
   0x0000fffff7fac214:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fac218:	9e620120	scvtf	d0, x9
   0x0000fffff7fac21c:	14000002	b	0xfffff7fac224
   0x0000fffff7fac220:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fac224:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac228:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac22c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac230:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac234:	54000120	b.eq	0xfffff7fac258  // b.none
   0x0000fffff7fac238:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac23c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac240:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac244:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac248:	54000161	b.ne	0xfffff7fac274  // b.any
   0x0000fffff7fac24c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fac250:	9e620121	scvtf	d1, x9
   0x0000fffff7fac254:	14000002	b	0xfffff7fac25c
   0x0000fffff7fac258:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fac25c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fac260:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fac264:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac268:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac26c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fac270:	17ffffde	b	0xfffff7fac1e8
   0x0000fffff7fac274:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac278:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac27c:	aa1303e1	mov	x1, x19
   0x0000fffff7fac280:	aa1503e2	mov	x2, x21
   0x0000fffff7fac284:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fac288:	aa1403e4	mov	x4, x20
   0x0000fffff7fac28c:	aa1603e5	mov	x5, x22
   0x0000fffff7fac290:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fac294:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac298:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac29c:	d63f0200	blr	x16
   0x0000fffff7fac2a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac2a4:	5400bd40	b.eq	0xfffff7fada4c  // b.none
   0x0000fffff7fac2a8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac2ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac2b0:	aa1303e1	mov	x1, x19
   0x0000fffff7fac2b4:	aa1503e2	mov	x2, x21
   0x0000fffff7fac2b8:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fac2bc:	aa1403e4	mov	x4, x20
   0x0000fffff7fac2c0:	aa1603e5	mov	x5, x22
   0x0000fffff7fac2c4:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fac2c8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac2cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac2d0:	d63f0200	blr	x16
   0x0000fffff7fac2d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac2d8:	5400bbe0	b.eq	0xfffff7fada54  // b.none
   0x0000fffff7fac2dc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fac2e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac2e4:	aa1303e1	mov	x1, x19
   0x0000fffff7fac2e8:	aa1503e2	mov	x2, x21
   0x0000fffff7fac2ec:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fac2f0:	aa1403e4	mov	x4, x20
   0x0000fffff7fac2f4:	aa1603e5	mov	x5, x22
   0x0000fffff7fac2f8:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fac2fc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac300:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac304:	d63f0200	blr	x16
   0x0000fffff7fac308:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac30c:	5400ba80	b.eq	0xfffff7fada5c  // b.none
   0x0000fffff7fac310:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fac314:	f100017f	cmp	x11, #0x0
   0x0000fffff7fac318:	540004a0	b.eq	0xfffff7fac3ac  // b.none
   0x0000fffff7fac31c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fac320:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fac324:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fac328:	eb0901bf	cmp	x13, x9
   0x0000fffff7fac32c:	54000400	b.eq	0xfffff7fac3ac  // b.none
   0x0000fffff7fac330:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fac334:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fac338:	36d801d1	tbz	w17, #27, 0xfffff7fac370
   0x0000fffff7fac33c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac340:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac344:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac348:	54000321	b.ne	0xfffff7fac3ac  // b.any
   0x0000fffff7fac34c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fac350:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac354:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac358:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac35c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac360:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac364:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac368:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac36c:	54000209	b.ls	0xfffff7fac3ac  // b.plast
   0x0000fffff7fac370:	36d8008d	tbz	w13, #27, 0xfffff7fac380
   0x0000fffff7fac374:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fac378:	91000529	add	x9, x9, #0x1
   0x0000fffff7fac37c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fac380:	36d80091	tbz	w17, #27, 0xfffff7fac390
   0x0000fffff7fac384:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac388:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac38c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac390:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fac394:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fac398:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fac39c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fac3a0:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fac3a4:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fac3a8:	1400000e	b	0xfffff7fac3e0
   0x0000fffff7fac3ac:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fac3b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac3b4:	aa1303e1	mov	x1, x19
   0x0000fffff7fac3b8:	aa1503e2	mov	x2, x21
   0x0000fffff7fac3bc:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fac3c0:	aa1403e4	mov	x4, x20
   0x0000fffff7fac3c4:	aa1603e5	mov	x5, x22
   0x0000fffff7fac3c8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fac3cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac3d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac3d4:	d63f0200	blr	x16
   0x0000fffff7fac3d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac3dc:	5400b440	b.eq	0xfffff7fada64  // b.none
   0x0000fffff7fac3e0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac3e4:	37d806a9	tbnz	w9, #27, 0xfffff7fac4b8
   0x0000fffff7fac3e8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac3ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac3f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac3f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac3f8:	540001c1	b.ne	0xfffff7fac430  // b.any
   0x0000fffff7fac3fc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac400:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac404:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac408:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac40c:	54000121	b.ne	0xfffff7fac430  // b.any
   0x0000fffff7fac410:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fac414:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fac418:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fac41c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac420:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac424:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fac428:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fac42c:	14000030	b	0xfffff7fac4ec
   0x0000fffff7fac430:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac434:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac438:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac43c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac440:	54000120	b.eq	0xfffff7fac464  // b.none
   0x0000fffff7fac444:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac448:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac44c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac450:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac454:	54000321	b.ne	0xfffff7fac4b8  // b.any
   0x0000fffff7fac458:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fac45c:	9e620120	scvtf	d0, x9
   0x0000fffff7fac460:	14000002	b	0xfffff7fac468
   0x0000fffff7fac464:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fac468:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac46c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac470:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac474:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac478:	54000120	b.eq	0xfffff7fac49c  // b.none
   0x0000fffff7fac47c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac480:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac484:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac488:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac48c:	54000161	b.ne	0xfffff7fac4b8  // b.any
   0x0000fffff7fac490:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fac494:	9e620121	scvtf	d1, x9
   0x0000fffff7fac498:	14000002	b	0xfffff7fac4a0
   0x0000fffff7fac49c:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fac4a0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fac4a4:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fac4a8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac4ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac4b0:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fac4b4:	17ffffde	b	0xfffff7fac42c
   0x0000fffff7fac4b8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac4bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac4c0:	aa1303e1	mov	x1, x19
   0x0000fffff7fac4c4:	aa1503e2	mov	x2, x21
   0x0000fffff7fac4c8:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fac4cc:	aa1403e4	mov	x4, x20
   0x0000fffff7fac4d0:	aa1603e5	mov	x5, x22
   0x0000fffff7fac4d4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fac4d8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac4dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac4e0:	d63f0200	blr	x16
   0x0000fffff7fac4e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac4e8:	5400ac20	b.eq	0xfffff7fada6c  // b.none
   0x0000fffff7fac4ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac4f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac4f4:	aa1303e1	mov	x1, x19
   0x0000fffff7fac4f8:	aa1503e2	mov	x2, x21
   0x0000fffff7fac4fc:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fac500:	aa1403e4	mov	x4, x20
   0x0000fffff7fac504:	aa1603e5	mov	x5, x22
   0x0000fffff7fac508:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fac50c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac510:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac514:	d63f0200	blr	x16
   0x0000fffff7fac518:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac51c:	5400aac0	b.eq	0xfffff7fada74  // b.none
   0x0000fffff7fac520:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fac524:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac528:	aa1303e1	mov	x1, x19
   0x0000fffff7fac52c:	aa1503e2	mov	x2, x21
   0x0000fffff7fac530:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fac534:	aa1403e4	mov	x4, x20
   0x0000fffff7fac538:	aa1603e5	mov	x5, x22
   0x0000fffff7fac53c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fac540:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac544:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac548:	d63f0200	blr	x16
   0x0000fffff7fac54c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac550:	5400a960	b.eq	0xfffff7fada7c  // b.none
   0x0000fffff7fac554:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fac558:	f100017f	cmp	x11, #0x0
   0x0000fffff7fac55c:	540004a0	b.eq	0xfffff7fac5f0  // b.none
   0x0000fffff7fac560:	b940016d	ldr	w13, [x11]
   0x0000fffff7fac564:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fac568:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fac56c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fac570:	54000400	b.eq	0xfffff7fac5f0  // b.none
   0x0000fffff7fac574:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fac578:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fac57c:	36d801d1	tbz	w17, #27, 0xfffff7fac5b4
   0x0000fffff7fac580:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac584:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac588:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac58c:	54000321	b.ne	0xfffff7fac5f0  // b.any
   0x0000fffff7fac590:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fac594:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac598:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac59c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac5a0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac5a4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac5a8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac5ac:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac5b0:	54000209	b.ls	0xfffff7fac5f0  // b.plast
   0x0000fffff7fac5b4:	36d8008d	tbz	w13, #27, 0xfffff7fac5c4
   0x0000fffff7fac5b8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fac5bc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fac5c0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fac5c4:	36d80091	tbz	w17, #27, 0xfffff7fac5d4
   0x0000fffff7fac5c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac5cc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac5d0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac5d4:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fac5d8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fac5dc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fac5e0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fac5e4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fac5e8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fac5ec:	1400000e	b	0xfffff7fac624
   0x0000fffff7fac5f0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fac5f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac5f8:	aa1303e1	mov	x1, x19
   0x0000fffff7fac5fc:	aa1503e2	mov	x2, x21
   0x0000fffff7fac600:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fac604:	aa1403e4	mov	x4, x20
   0x0000fffff7fac608:	aa1603e5	mov	x5, x22
   0x0000fffff7fac60c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fac610:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac614:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac618:	d63f0200	blr	x16
   0x0000fffff7fac61c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac620:	5400a320	b.eq	0xfffff7fada84  // b.none
   0x0000fffff7fac624:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac628:	37d806a9	tbnz	w9, #27, 0xfffff7fac6fc
   0x0000fffff7fac62c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac630:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac634:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac638:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac63c:	540001c1	b.ne	0xfffff7fac674  // b.any
   0x0000fffff7fac640:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac644:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac648:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac64c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac650:	54000121	b.ne	0xfffff7fac674  // b.any
   0x0000fffff7fac654:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fac658:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fac65c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fac660:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac664:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac668:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fac66c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fac670:	14000030	b	0xfffff7fac730
   0x0000fffff7fac674:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac678:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac67c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac680:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac684:	54000120	b.eq	0xfffff7fac6a8  // b.none
   0x0000fffff7fac688:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac68c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac690:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac694:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac698:	54000321	b.ne	0xfffff7fac6fc  // b.any
   0x0000fffff7fac69c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fac6a0:	9e620120	scvtf	d0, x9
   0x0000fffff7fac6a4:	14000002	b	0xfffff7fac6ac
   0x0000fffff7fac6a8:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fac6ac:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac6b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac6b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac6b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac6bc:	54000120	b.eq	0xfffff7fac6e0  // b.none
   0x0000fffff7fac6c0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac6c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac6c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac6cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac6d0:	54000161	b.ne	0xfffff7fac6fc  // b.any
   0x0000fffff7fac6d4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fac6d8:	9e620121	scvtf	d1, x9
   0x0000fffff7fac6dc:	14000002	b	0xfffff7fac6e4
   0x0000fffff7fac6e0:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fac6e4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fac6e8:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fac6ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac6f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac6f4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fac6f8:	17ffffde	b	0xfffff7fac670
   0x0000fffff7fac6fc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac700:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac704:	aa1303e1	mov	x1, x19
   0x0000fffff7fac708:	aa1503e2	mov	x2, x21
   0x0000fffff7fac70c:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fac710:	aa1403e4	mov	x4, x20
   0x0000fffff7fac714:	aa1603e5	mov	x5, x22
   0x0000fffff7fac718:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fac71c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac720:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac724:	d63f0200	blr	x16
   0x0000fffff7fac728:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac72c:	54009b00	b.eq	0xfffff7fada8c  // b.none
   0x0000fffff7fac730:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac734:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac738:	aa1303e1	mov	x1, x19
   0x0000fffff7fac73c:	aa1503e2	mov	x2, x21
   0x0000fffff7fac740:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fac744:	aa1403e4	mov	x4, x20
   0x0000fffff7fac748:	aa1603e5	mov	x5, x22
   0x0000fffff7fac74c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fac750:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac754:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac758:	d63f0200	blr	x16
   0x0000fffff7fac75c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac760:	540099a0	b.eq	0xfffff7fada94  // b.none
   0x0000fffff7fac764:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fac768:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac76c:	aa1303e1	mov	x1, x19
   0x0000fffff7fac770:	aa1503e2	mov	x2, x21
   0x0000fffff7fac774:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fac778:	aa1403e4	mov	x4, x20
   0x0000fffff7fac77c:	aa1603e5	mov	x5, x22
   0x0000fffff7fac780:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fac784:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac788:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac78c:	d63f0200	blr	x16
   0x0000fffff7fac790:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac794:	54009840	b.eq	0xfffff7fada9c  // b.none
   0x0000fffff7fac798:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fac79c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fac7a0:	540004a0	b.eq	0xfffff7fac834  // b.none
   0x0000fffff7fac7a4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fac7a8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fac7ac:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fac7b0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fac7b4:	54000400	b.eq	0xfffff7fac834  // b.none
   0x0000fffff7fac7b8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fac7bc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fac7c0:	36d801d1	tbz	w17, #27, 0xfffff7fac7f8
   0x0000fffff7fac7c4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac7c8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac7cc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac7d0:	54000321	b.ne	0xfffff7fac834  // b.any
   0x0000fffff7fac7d4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fac7d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac7dc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac7e0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac7e4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac7e8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac7ec:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac7f0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac7f4:	54000209	b.ls	0xfffff7fac834  // b.plast
   0x0000fffff7fac7f8:	36d8008d	tbz	w13, #27, 0xfffff7fac808
   0x0000fffff7fac7fc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fac800:	91000529	add	x9, x9, #0x1
   0x0000fffff7fac804:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fac808:	36d80091	tbz	w17, #27, 0xfffff7fac818
   0x0000fffff7fac80c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac810:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac814:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac818:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fac81c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fac820:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fac824:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fac828:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fac82c:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fac830:	1400000e	b	0xfffff7fac868
   0x0000fffff7fac834:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fac838:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac83c:	aa1303e1	mov	x1, x19
   0x0000fffff7fac840:	aa1503e2	mov	x2, x21
   0x0000fffff7fac844:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fac848:	aa1403e4	mov	x4, x20
   0x0000fffff7fac84c:	aa1603e5	mov	x5, x22
   0x0000fffff7fac850:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fac854:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac858:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac85c:	d63f0200	blr	x16
   0x0000fffff7fac860:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac864:	54009200	b.eq	0xfffff7fadaa4  // b.none
   0x0000fffff7fac868:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac86c:	37d806a9	tbnz	w9, #27, 0xfffff7fac940
   0x0000fffff7fac870:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac874:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac878:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac87c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac880:	540001c1	b.ne	0xfffff7fac8b8  // b.any
   0x0000fffff7fac884:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac888:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac88c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac890:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac894:	54000121	b.ne	0xfffff7fac8b8  // b.any
   0x0000fffff7fac898:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fac89c:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fac8a0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fac8a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac8a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac8ac:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fac8b0:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fac8b4:	14000030	b	0xfffff7fac974
   0x0000fffff7fac8b8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac8bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac8c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac8c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac8c8:	54000120	b.eq	0xfffff7fac8ec  // b.none
   0x0000fffff7fac8cc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac8d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac8d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac8d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac8dc:	54000321	b.ne	0xfffff7fac940  // b.any
   0x0000fffff7fac8e0:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fac8e4:	9e620120	scvtf	d0, x9
   0x0000fffff7fac8e8:	14000002	b	0xfffff7fac8f0
   0x0000fffff7fac8ec:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fac8f0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac8f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac8f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac8fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac900:	54000120	b.eq	0xfffff7fac924  // b.none
   0x0000fffff7fac904:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac908:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac90c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac910:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac914:	54000161	b.ne	0xfffff7fac940  // b.any
   0x0000fffff7fac918:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fac91c:	9e620121	scvtf	d1, x9
   0x0000fffff7fac920:	14000002	b	0xfffff7fac928
   0x0000fffff7fac924:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fac928:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fac92c:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fac930:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac934:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac938:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fac93c:	17ffffde	b	0xfffff7fac8b4
   0x0000fffff7fac940:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac944:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac948:	aa1303e1	mov	x1, x19
   0x0000fffff7fac94c:	aa1503e2	mov	x2, x21
   0x0000fffff7fac950:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fac954:	aa1403e4	mov	x4, x20
   0x0000fffff7fac958:	aa1603e5	mov	x5, x22
   0x0000fffff7fac95c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fac960:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac964:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac968:	d63f0200	blr	x16
   0x0000fffff7fac96c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac970:	540089e0	b.eq	0xfffff7fadaac  // b.none
   0x0000fffff7fac974:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac978:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac97c:	aa1303e1	mov	x1, x19
   0x0000fffff7fac980:	aa1503e2	mov	x2, x21
   0x0000fffff7fac984:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fac988:	aa1403e4	mov	x4, x20
   0x0000fffff7fac98c:	aa1603e5	mov	x5, x22
   0x0000fffff7fac990:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fac994:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac998:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac99c:	d63f0200	blr	x16
   0x0000fffff7fac9a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac9a4:	54008880	b.eq	0xfffff7fadab4  // b.none
   0x0000fffff7fac9a8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fac9ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac9b0:	aa1303e1	mov	x1, x19
   0x0000fffff7fac9b4:	aa1503e2	mov	x2, x21
   0x0000fffff7fac9b8:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fac9bc:	aa1403e4	mov	x4, x20
   0x0000fffff7fac9c0:	aa1603e5	mov	x5, x22
   0x0000fffff7fac9c4:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fac9c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac9cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac9d0:	d63f0200	blr	x16
   0x0000fffff7fac9d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac9d8:	54008720	b.eq	0xfffff7fadabc  // b.none
   0x0000fffff7fac9dc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fac9e0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fac9e4:	540004a0	b.eq	0xfffff7faca78  // b.none
   0x0000fffff7fac9e8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fac9ec:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fac9f0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fac9f4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fac9f8:	54000400	b.eq	0xfffff7faca78  // b.none
   0x0000fffff7fac9fc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faca00:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faca04:	36d801d1	tbz	w17, #27, 0xfffff7faca3c
   0x0000fffff7faca08:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faca0c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faca10:	f100013f	cmp	x9, #0x0
   0x0000fffff7faca14:	54000321	b.ne	0xfffff7faca78  // b.any
   0x0000fffff7faca18:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faca1c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faca20:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faca24:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faca28:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faca2c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faca30:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faca34:	f100055f	cmp	x10, #0x1
   0x0000fffff7faca38:	54000209	b.ls	0xfffff7faca78  // b.plast
   0x0000fffff7faca3c:	36d8008d	tbz	w13, #27, 0xfffff7faca4c
   0x0000fffff7faca40:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faca44:	91000529	add	x9, x9, #0x1
   0x0000fffff7faca48:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faca4c:	36d80091	tbz	w17, #27, 0xfffff7faca5c
   0x0000fffff7faca50:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faca54:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faca58:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faca5c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7faca60:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faca64:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faca68:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faca6c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faca70:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faca74:	1400000e	b	0xfffff7facaac
   0x0000fffff7faca78:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faca7c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faca80:	aa1303e1	mov	x1, x19
   0x0000fffff7faca84:	aa1503e2	mov	x2, x21
   0x0000fffff7faca88:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7faca8c:	aa1403e4	mov	x4, x20
   0x0000fffff7faca90:	aa1603e5	mov	x5, x22
   0x0000fffff7faca94:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faca98:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faca9c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7facaa0:	d63f0200	blr	x16
   0x0000fffff7facaa4:	f100001f	cmp	x0, #0x0
   0x0000fffff7facaa8:	540080e0	b.eq	0xfffff7fadac4  // b.none
   0x0000fffff7facaac:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7facab0:	37d806a9	tbnz	w9, #27, 0xfffff7facb84
   0x0000fffff7facab4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7facab8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facabc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facac0:	eb0a013f	cmp	x9, x10
   0x0000fffff7facac4:	540001c1	b.ne	0xfffff7facafc  // b.any
   0x0000fffff7facac8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7facacc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facad0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facad4:	eb0a013f	cmp	x9, x10
   0x0000fffff7facad8:	54000121	b.ne	0xfffff7facafc  // b.any
   0x0000fffff7facadc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7facae0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7facae4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7facae8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facaec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facaf0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7facaf4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7facaf8:	14000030	b	0xfffff7facbb8
   0x0000fffff7facafc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7facb00:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7facb04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facb08:	eb0a013f	cmp	x9, x10
   0x0000fffff7facb0c:	54000120	b.eq	0xfffff7facb30  // b.none
   0x0000fffff7facb10:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7facb14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facb18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facb1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7facb20:	54000321	b.ne	0xfffff7facb84  // b.any
   0x0000fffff7facb24:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7facb28:	9e620120	scvtf	d0, x9
   0x0000fffff7facb2c:	14000002	b	0xfffff7facb34
   0x0000fffff7facb30:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7facb34:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7facb38:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7facb3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facb40:	eb0a013f	cmp	x9, x10
   0x0000fffff7facb44:	54000120	b.eq	0xfffff7facb68  // b.none
   0x0000fffff7facb48:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7facb4c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facb50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facb54:	eb0a013f	cmp	x9, x10
   0x0000fffff7facb58:	54000161	b.ne	0xfffff7facb84  // b.any
   0x0000fffff7facb5c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7facb60:	9e620121	scvtf	d1, x9
   0x0000fffff7facb64:	14000002	b	0xfffff7facb6c
   0x0000fffff7facb68:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7facb6c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7facb70:	fd001660	str	d0, [x19, #40]
   0x0000fffff7facb74:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7facb78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facb7c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7facb80:	17ffffde	b	0xfffff7facaf8
   0x0000fffff7facb84:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7facb88:	f94003e0	ldr	x0, [sp]
   0x0000fffff7facb8c:	aa1303e1	mov	x1, x19
   0x0000fffff7facb90:	aa1503e2	mov	x2, x21
   0x0000fffff7facb94:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7facb98:	aa1403e4	mov	x4, x20
   0x0000fffff7facb9c:	aa1603e5	mov	x5, x22
   0x0000fffff7facba0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7facba4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7facba8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7facbac:	d63f0200	blr	x16
   0x0000fffff7facbb0:	f100001f	cmp	x0, #0x0
   0x0000fffff7facbb4:	540078c0	b.eq	0xfffff7fadacc  // b.none
   0x0000fffff7facbb8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7facbbc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7facbc0:	aa1303e1	mov	x1, x19
   0x0000fffff7facbc4:	aa1503e2	mov	x2, x21
   0x0000fffff7facbc8:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7facbcc:	aa1403e4	mov	x4, x20
   0x0000fffff7facbd0:	aa1603e5	mov	x5, x22
   0x0000fffff7facbd4:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7facbd8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7facbdc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7facbe0:	d63f0200	blr	x16
   0x0000fffff7facbe4:	f100001f	cmp	x0, #0x0
   0x0000fffff7facbe8:	54007760	b.eq	0xfffff7fadad4  // b.none
   0x0000fffff7facbec:	910043e6	add	x6, sp, #0x10
   0x0000fffff7facbf0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7facbf4:	aa1303e1	mov	x1, x19
   0x0000fffff7facbf8:	aa1503e2	mov	x2, x21
   0x0000fffff7facbfc:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7facc00:	aa1403e4	mov	x4, x20
   0x0000fffff7facc04:	aa1603e5	mov	x5, x22
   0x0000fffff7facc08:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7facc0c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7facc10:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7facc14:	d63f0200	blr	x16
   0x0000fffff7facc18:	f100001f	cmp	x0, #0x0
   0x0000fffff7facc1c:	54007600	b.eq	0xfffff7fadadc  // b.none
   0x0000fffff7facc20:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7facc24:	f100017f	cmp	x11, #0x0
   0x0000fffff7facc28:	540004a0	b.eq	0xfffff7faccbc  // b.none
   0x0000fffff7facc2c:	b940016d	ldr	w13, [x11]
   0x0000fffff7facc30:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7facc34:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7facc38:	eb0901bf	cmp	x13, x9
   0x0000fffff7facc3c:	54000400	b.eq	0xfffff7faccbc  // b.none
   0x0000fffff7facc40:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7facc44:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7facc48:	36d801d1	tbz	w17, #27, 0xfffff7facc80
   0x0000fffff7facc4c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7facc50:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7facc54:	f100013f	cmp	x9, #0x0
   0x0000fffff7facc58:	54000321	b.ne	0xfffff7faccbc  // b.any
   0x0000fffff7facc5c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7facc60:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7facc64:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7facc68:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7facc6c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7facc70:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7facc74:	8a0901ca	and	x10, x14, x9
   0x0000fffff7facc78:	f100055f	cmp	x10, #0x1
   0x0000fffff7facc7c:	54000209	b.ls	0xfffff7faccbc  // b.plast
   0x0000fffff7facc80:	36d8008d	tbz	w13, #27, 0xfffff7facc90
   0x0000fffff7facc84:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7facc88:	91000529	add	x9, x9, #0x1
   0x0000fffff7facc8c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7facc90:	36d80091	tbz	w17, #27, 0xfffff7facca0
   0x0000fffff7facc94:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7facc98:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7facc9c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7facca0:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7facca4:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7facca8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faccac:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faccb0:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faccb4:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faccb8:	1400000e	b	0xfffff7faccf0
   0x0000fffff7faccbc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faccc0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faccc4:	aa1303e1	mov	x1, x19
   0x0000fffff7faccc8:	aa1503e2	mov	x2, x21
   0x0000fffff7facccc:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7faccd0:	aa1403e4	mov	x4, x20
   0x0000fffff7faccd4:	aa1603e5	mov	x5, x22
   0x0000fffff7faccd8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faccdc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7facce0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7facce4:	d63f0200	blr	x16
   0x0000fffff7facce8:	f100001f	cmp	x0, #0x0
   0x0000fffff7faccec:	54006fc0	b.eq	0xfffff7fadae4  // b.none
   0x0000fffff7faccf0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faccf4:	37d806a9	tbnz	w9, #27, 0xfffff7facdc8
   0x0000fffff7faccf8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faccfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facd00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facd04:	eb0a013f	cmp	x9, x10
   0x0000fffff7facd08:	540001c1	b.ne	0xfffff7facd40  // b.any
   0x0000fffff7facd0c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7facd10:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facd14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facd18:	eb0a013f	cmp	x9, x10
   0x0000fffff7facd1c:	54000121	b.ne	0xfffff7facd40  // b.any
   0x0000fffff7facd20:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7facd24:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7facd28:	8b0a0129	add	x9, x9, x10
   0x0000fffff7facd2c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facd30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facd34:	f9001669	str	x9, [x19, #40]
   0x0000fffff7facd38:	b900226a	str	w10, [x19, #32]
   0x0000fffff7facd3c:	14000030	b	0xfffff7facdfc
   0x0000fffff7facd40:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7facd44:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7facd48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facd4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7facd50:	54000120	b.eq	0xfffff7facd74  // b.none
   0x0000fffff7facd54:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7facd58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facd5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facd60:	eb0a013f	cmp	x9, x10
   0x0000fffff7facd64:	54000321	b.ne	0xfffff7facdc8  // b.any
   0x0000fffff7facd68:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7facd6c:	9e620120	scvtf	d0, x9
   0x0000fffff7facd70:	14000002	b	0xfffff7facd78
   0x0000fffff7facd74:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7facd78:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7facd7c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7facd80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facd84:	eb0a013f	cmp	x9, x10
   0x0000fffff7facd88:	54000120	b.eq	0xfffff7facdac  // b.none
   0x0000fffff7facd8c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7facd90:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facd94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facd98:	eb0a013f	cmp	x9, x10
   0x0000fffff7facd9c:	54000161	b.ne	0xfffff7facdc8  // b.any
   0x0000fffff7facda0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7facda4:	9e620121	scvtf	d1, x9
   0x0000fffff7facda8:	14000002	b	0xfffff7facdb0
   0x0000fffff7facdac:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7facdb0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7facdb4:	fd001660	str	d0, [x19, #40]
   0x0000fffff7facdb8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7facdbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facdc0:	b900226a	str	w10, [x19, #32]
   0x0000fffff7facdc4:	17ffffde	b	0xfffff7facd3c
   0x0000fffff7facdc8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7facdcc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7facdd0:	aa1303e1	mov	x1, x19
   0x0000fffff7facdd4:	aa1503e2	mov	x2, x21
   0x0000fffff7facdd8:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7facddc:	aa1403e4	mov	x4, x20
   0x0000fffff7facde0:	aa1603e5	mov	x5, x22
   0x0000fffff7facde4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7facde8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7facdec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7facdf0:	d63f0200	blr	x16
   0x0000fffff7facdf4:	f100001f	cmp	x0, #0x0
   0x0000fffff7facdf8:	540067a0	b.eq	0xfffff7fadaec  // b.none
   0x0000fffff7facdfc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7face00:	f94003e0	ldr	x0, [sp]
   0x0000fffff7face04:	aa1303e1	mov	x1, x19
   0x0000fffff7face08:	aa1503e2	mov	x2, x21
   0x0000fffff7face0c:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7face10:	aa1403e4	mov	x4, x20
   0x0000fffff7face14:	aa1603e5	mov	x5, x22
   0x0000fffff7face18:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7face1c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7face20:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7face24:	d63f0200	blr	x16
   0x0000fffff7face28:	f100001f	cmp	x0, #0x0
   0x0000fffff7face2c:	54006640	b.eq	0xfffff7fadaf4  // b.none
   0x0000fffff7face30:	910043e6	add	x6, sp, #0x10
   0x0000fffff7face34:	f94003e0	ldr	x0, [sp]
   0x0000fffff7face38:	aa1303e1	mov	x1, x19
   0x0000fffff7face3c:	aa1503e2	mov	x2, x21
   0x0000fffff7face40:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7face44:	aa1403e4	mov	x4, x20
   0x0000fffff7face48:	aa1603e5	mov	x5, x22
   0x0000fffff7face4c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7face50:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7face54:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7face58:	d63f0200	blr	x16
   0x0000fffff7face5c:	f100001f	cmp	x0, #0x0
   0x0000fffff7face60:	540064e0	b.eq	0xfffff7fadafc  // b.none
   0x0000fffff7face64:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7face68:	f100017f	cmp	x11, #0x0
   0x0000fffff7face6c:	540004a0	b.eq	0xfffff7facf00  // b.none
   0x0000fffff7face70:	b940016d	ldr	w13, [x11]
   0x0000fffff7face74:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7face78:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7face7c:	eb0901bf	cmp	x13, x9
   0x0000fffff7face80:	54000400	b.eq	0xfffff7facf00  // b.none
   0x0000fffff7face84:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7face88:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7face8c:	36d801d1	tbz	w17, #27, 0xfffff7facec4
   0x0000fffff7face90:	f94003e9	ldr	x9, [sp]
   0x0000fffff7face94:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7face98:	f100013f	cmp	x9, #0x0
   0x0000fffff7face9c:	54000321	b.ne	0xfffff7facf00  // b.any
   0x0000fffff7facea0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7facea4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7facea8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faceac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faceb0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faceb4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faceb8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7facebc:	f100055f	cmp	x10, #0x1
   0x0000fffff7facec0:	54000209	b.ls	0xfffff7facf00  // b.plast
   0x0000fffff7facec4:	36d8008d	tbz	w13, #27, 0xfffff7faced4
   0x0000fffff7facec8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7facecc:	91000529	add	x9, x9, #0x1
   0x0000fffff7faced0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faced4:	36d80091	tbz	w17, #27, 0xfffff7facee4
   0x0000fffff7faced8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7facedc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7facee0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7facee4:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7facee8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faceec:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7facef0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7facef4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7facef8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7facefc:	1400000e	b	0xfffff7facf34
   0x0000fffff7facf00:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7facf04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7facf08:	aa1303e1	mov	x1, x19
   0x0000fffff7facf0c:	aa1503e2	mov	x2, x21
   0x0000fffff7facf10:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7facf14:	aa1403e4	mov	x4, x20
   0x0000fffff7facf18:	aa1603e5	mov	x5, x22
   0x0000fffff7facf1c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7facf20:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7facf24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7facf28:	d63f0200	blr	x16
   0x0000fffff7facf2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7facf30:	54005ea0	b.eq	0xfffff7fadb04  // b.none
   0x0000fffff7facf34:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7facf38:	37d806a9	tbnz	w9, #27, 0xfffff7fad00c
   0x0000fffff7facf3c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7facf40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facf44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facf48:	eb0a013f	cmp	x9, x10
   0x0000fffff7facf4c:	540001c1	b.ne	0xfffff7facf84  // b.any
   0x0000fffff7facf50:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7facf54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facf58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facf5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7facf60:	54000121	b.ne	0xfffff7facf84  // b.any
   0x0000fffff7facf64:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7facf68:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7facf6c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7facf70:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facf74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facf78:	f9001669	str	x9, [x19, #40]
   0x0000fffff7facf7c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7facf80:	14000030	b	0xfffff7fad040
   0x0000fffff7facf84:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7facf88:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7facf8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facf90:	eb0a013f	cmp	x9, x10
   0x0000fffff7facf94:	54000120	b.eq	0xfffff7facfb8  // b.none
   0x0000fffff7facf98:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7facf9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facfa0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facfa4:	eb0a013f	cmp	x9, x10
   0x0000fffff7facfa8:	54000321	b.ne	0xfffff7fad00c  // b.any
   0x0000fffff7facfac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7facfb0:	9e620120	scvtf	d0, x9
   0x0000fffff7facfb4:	14000002	b	0xfffff7facfbc
   0x0000fffff7facfb8:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7facfbc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7facfc0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7facfc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facfc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7facfcc:	54000120	b.eq	0xfffff7facff0  // b.none
   0x0000fffff7facfd0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7facfd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facfd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facfdc:	eb0a013f	cmp	x9, x10
   0x0000fffff7facfe0:	54000161	b.ne	0xfffff7fad00c  // b.any
   0x0000fffff7facfe4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7facfe8:	9e620121	scvtf	d1, x9
   0x0000fffff7facfec:	14000002	b	0xfffff7facff4
   0x0000fffff7facff0:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7facff4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7facff8:	fd001660	str	d0, [x19, #40]
   0x0000fffff7facffc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad000:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad004:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fad008:	17ffffde	b	0xfffff7facf80
   0x0000fffff7fad00c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad010:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad014:	aa1303e1	mov	x1, x19
   0x0000fffff7fad018:	aa1503e2	mov	x2, x21
   0x0000fffff7fad01c:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fad020:	aa1403e4	mov	x4, x20
   0x0000fffff7fad024:	aa1603e5	mov	x5, x22
   0x0000fffff7fad028:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fad02c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad030:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad034:	d63f0200	blr	x16
   0x0000fffff7fad038:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad03c:	54005680	b.eq	0xfffff7fadb0c  // b.none
   0x0000fffff7fad040:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad044:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad048:	aa1303e1	mov	x1, x19
   0x0000fffff7fad04c:	aa1503e2	mov	x2, x21
   0x0000fffff7fad050:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fad054:	aa1403e4	mov	x4, x20
   0x0000fffff7fad058:	aa1603e5	mov	x5, x22
   0x0000fffff7fad05c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fad060:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad064:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad068:	d63f0200	blr	x16
   0x0000fffff7fad06c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad070:	54005520	b.eq	0xfffff7fadb14  // b.none
   0x0000fffff7fad074:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fad078:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad07c:	aa1303e1	mov	x1, x19
   0x0000fffff7fad080:	aa1503e2	mov	x2, x21
   0x0000fffff7fad084:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fad088:	aa1403e4	mov	x4, x20
   0x0000fffff7fad08c:	aa1603e5	mov	x5, x22
   0x0000fffff7fad090:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fad094:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fad098:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad09c:	d63f0200	blr	x16
   0x0000fffff7fad0a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad0a4:	540053c0	b.eq	0xfffff7fadb1c  // b.none
   0x0000fffff7fad0a8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fad0ac:	f100017f	cmp	x11, #0x0
   0x0000fffff7fad0b0:	540004a0	b.eq	0xfffff7fad144  // b.none
   0x0000fffff7fad0b4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fad0b8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fad0bc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fad0c0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fad0c4:	54000400	b.eq	0xfffff7fad144  // b.none
   0x0000fffff7fad0c8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fad0cc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fad0d0:	36d801d1	tbz	w17, #27, 0xfffff7fad108
   0x0000fffff7fad0d4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fad0d8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fad0dc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fad0e0:	54000321	b.ne	0xfffff7fad144  // b.any
   0x0000fffff7fad0e4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fad0e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad0ec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fad0f0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fad0f4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fad0f8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fad0fc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fad100:	f100055f	cmp	x10, #0x1
   0x0000fffff7fad104:	54000209	b.ls	0xfffff7fad144  // b.plast
   0x0000fffff7fad108:	36d8008d	tbz	w13, #27, 0xfffff7fad118
   0x0000fffff7fad10c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fad110:	91000529	add	x9, x9, #0x1
   0x0000fffff7fad114:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fad118:	36d80091	tbz	w17, #27, 0xfffff7fad128
   0x0000fffff7fad11c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad120:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fad124:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fad128:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fad12c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fad130:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fad134:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fad138:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fad13c:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fad140:	1400000e	b	0xfffff7fad178
   0x0000fffff7fad144:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fad148:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad14c:	aa1303e1	mov	x1, x19
   0x0000fffff7fad150:	aa1503e2	mov	x2, x21
   0x0000fffff7fad154:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fad158:	aa1403e4	mov	x4, x20
   0x0000fffff7fad15c:	aa1603e5	mov	x5, x22
   0x0000fffff7fad160:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fad164:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fad168:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad16c:	d63f0200	blr	x16
   0x0000fffff7fad170:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad174:	54004d80	b.eq	0xfffff7fadb24  // b.none
   0x0000fffff7fad178:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fad17c:	37d806a9	tbnz	w9, #27, 0xfffff7fad250
   0x0000fffff7fad180:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fad184:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad188:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad18c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad190:	540001c1	b.ne	0xfffff7fad1c8  // b.any
   0x0000fffff7fad194:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad198:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad19c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad1a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad1a4:	54000121	b.ne	0xfffff7fad1c8  // b.any
   0x0000fffff7fad1a8:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fad1ac:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fad1b0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fad1b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad1b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad1bc:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fad1c0:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fad1c4:	14000030	b	0xfffff7fad284
   0x0000fffff7fad1c8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fad1cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad1d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad1d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad1d8:	54000120	b.eq	0xfffff7fad1fc  // b.none
   0x0000fffff7fad1dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fad1e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad1e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad1e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad1ec:	54000321	b.ne	0xfffff7fad250  // b.any
   0x0000fffff7fad1f0:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fad1f4:	9e620120	scvtf	d0, x9
   0x0000fffff7fad1f8:	14000002	b	0xfffff7fad200
   0x0000fffff7fad1fc:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fad200:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad204:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad208:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad20c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad210:	54000120	b.eq	0xfffff7fad234  // b.none
   0x0000fffff7fad214:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad218:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad21c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad220:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad224:	54000161	b.ne	0xfffff7fad250  // b.any
   0x0000fffff7fad228:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fad22c:	9e620121	scvtf	d1, x9
   0x0000fffff7fad230:	14000002	b	0xfffff7fad238
   0x0000fffff7fad234:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fad238:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fad23c:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fad240:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad244:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad248:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fad24c:	17ffffde	b	0xfffff7fad1c4
   0x0000fffff7fad250:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad254:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad258:	aa1303e1	mov	x1, x19
   0x0000fffff7fad25c:	aa1503e2	mov	x2, x21
   0x0000fffff7fad260:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fad264:	aa1403e4	mov	x4, x20
   0x0000fffff7fad268:	aa1603e5	mov	x5, x22
   0x0000fffff7fad26c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fad270:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad274:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad278:	d63f0200	blr	x16
   0x0000fffff7fad27c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad280:	54004560	b.eq	0xfffff7fadb2c  // b.none
   0x0000fffff7fad284:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad288:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad28c:	aa1303e1	mov	x1, x19
   0x0000fffff7fad290:	aa1503e2	mov	x2, x21
   0x0000fffff7fad294:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fad298:	aa1403e4	mov	x4, x20
   0x0000fffff7fad29c:	aa1603e5	mov	x5, x22
   0x0000fffff7fad2a0:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fad2a4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad2a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad2ac:	d63f0200	blr	x16
   0x0000fffff7fad2b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad2b4:	54004400	b.eq	0xfffff7fadb34  // b.none
   0x0000fffff7fad2b8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fad2bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad2c0:	aa1303e1	mov	x1, x19
   0x0000fffff7fad2c4:	aa1503e2	mov	x2, x21
   0x0000fffff7fad2c8:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fad2cc:	aa1403e4	mov	x4, x20
   0x0000fffff7fad2d0:	aa1603e5	mov	x5, x22
   0x0000fffff7fad2d4:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fad2d8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fad2dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad2e0:	d63f0200	blr	x16
   0x0000fffff7fad2e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad2e8:	540042a0	b.eq	0xfffff7fadb3c  // b.none
   0x0000fffff7fad2ec:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fad2f0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fad2f4:	540004a0	b.eq	0xfffff7fad388  // b.none
   0x0000fffff7fad2f8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fad2fc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fad300:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fad304:	eb0901bf	cmp	x13, x9
   0x0000fffff7fad308:	54000400	b.eq	0xfffff7fad388  // b.none
   0x0000fffff7fad30c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fad310:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fad314:	36d801d1	tbz	w17, #27, 0xfffff7fad34c
   0x0000fffff7fad318:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fad31c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fad320:	f100013f	cmp	x9, #0x0
   0x0000fffff7fad324:	54000321	b.ne	0xfffff7fad388  // b.any
   0x0000fffff7fad328:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fad32c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad330:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fad334:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fad338:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fad33c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fad340:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fad344:	f100055f	cmp	x10, #0x1
   0x0000fffff7fad348:	54000209	b.ls	0xfffff7fad388  // b.plast
   0x0000fffff7fad34c:	36d8008d	tbz	w13, #27, 0xfffff7fad35c
   0x0000fffff7fad350:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fad354:	91000529	add	x9, x9, #0x1
   0x0000fffff7fad358:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fad35c:	36d80091	tbz	w17, #27, 0xfffff7fad36c
   0x0000fffff7fad360:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad364:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fad368:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fad36c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fad370:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fad374:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fad378:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fad37c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fad380:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fad384:	1400000e	b	0xfffff7fad3bc
   0x0000fffff7fad388:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fad38c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad390:	aa1303e1	mov	x1, x19
   0x0000fffff7fad394:	aa1503e2	mov	x2, x21
   0x0000fffff7fad398:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fad39c:	aa1403e4	mov	x4, x20
   0x0000fffff7fad3a0:	aa1603e5	mov	x5, x22
   0x0000fffff7fad3a4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fad3a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fad3ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad3b0:	d63f0200	blr	x16
   0x0000fffff7fad3b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad3b8:	54003c60	b.eq	0xfffff7fadb44  // b.none
   0x0000fffff7fad3bc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fad3c0:	37d806a9	tbnz	w9, #27, 0xfffff7fad494
   0x0000fffff7fad3c4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fad3c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad3cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad3d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad3d4:	540001c1	b.ne	0xfffff7fad40c  // b.any
   0x0000fffff7fad3d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad3dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad3e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad3e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad3e8:	54000121	b.ne	0xfffff7fad40c  // b.any
   0x0000fffff7fad3ec:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fad3f0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fad3f4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fad3f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad3fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad400:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fad404:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fad408:	14000030	b	0xfffff7fad4c8
   0x0000fffff7fad40c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fad410:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad414:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad418:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad41c:	54000120	b.eq	0xfffff7fad440  // b.none
   0x0000fffff7fad420:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fad424:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad428:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad42c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad430:	54000321	b.ne	0xfffff7fad494  // b.any
   0x0000fffff7fad434:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fad438:	9e620120	scvtf	d0, x9
   0x0000fffff7fad43c:	14000002	b	0xfffff7fad444
   0x0000fffff7fad440:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fad444:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad448:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad44c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad450:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad454:	54000120	b.eq	0xfffff7fad478  // b.none
   0x0000fffff7fad458:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad45c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad460:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad464:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad468:	54000161	b.ne	0xfffff7fad494  // b.any
   0x0000fffff7fad46c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fad470:	9e620121	scvtf	d1, x9
   0x0000fffff7fad474:	14000002	b	0xfffff7fad47c
   0x0000fffff7fad478:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fad47c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fad480:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fad484:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad488:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad48c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fad490:	17ffffde	b	0xfffff7fad408
   0x0000fffff7fad494:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad498:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad49c:	aa1303e1	mov	x1, x19
   0x0000fffff7fad4a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fad4a4:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fad4a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fad4ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fad4b0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fad4b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad4b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad4bc:	d63f0200	blr	x16
   0x0000fffff7fad4c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad4c4:	54003440	b.eq	0xfffff7fadb4c  // b.none
   0x0000fffff7fad4c8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad4cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad4d0:	aa1303e1	mov	x1, x19
   0x0000fffff7fad4d4:	aa1503e2	mov	x2, x21
   0x0000fffff7fad4d8:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fad4dc:	aa1403e4	mov	x4, x20
   0x0000fffff7fad4e0:	aa1603e5	mov	x5, x22
   0x0000fffff7fad4e4:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fad4e8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad4ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad4f0:	d63f0200	blr	x16
   0x0000fffff7fad4f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad4f8:	540032e0	b.eq	0xfffff7fadb54  // b.none
   0x0000fffff7fad4fc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fad500:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad504:	aa1303e1	mov	x1, x19
   0x0000fffff7fad508:	aa1503e2	mov	x2, x21
   0x0000fffff7fad50c:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fad510:	aa1403e4	mov	x4, x20
   0x0000fffff7fad514:	aa1603e5	mov	x5, x22
   0x0000fffff7fad518:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fad51c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fad520:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad524:	d63f0200	blr	x16
   0x0000fffff7fad528:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad52c:	54003180	b.eq	0xfffff7fadb5c  // b.none
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
   0x0000fffff7fad5b0:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fad5b4:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fad5b8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fad5bc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fad5c0:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fad5c4:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fad5c8:	1400000e	b	0xfffff7fad600
   0x0000fffff7fad5cc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fad5d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad5d4:	aa1303e1	mov	x1, x19
   0x0000fffff7fad5d8:	aa1503e2	mov	x2, x21
   0x0000fffff7fad5dc:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fad5e0:	aa1403e4	mov	x4, x20
   0x0000fffff7fad5e4:	aa1603e5	mov	x5, x22
   0x0000fffff7fad5e8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fad5ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fad5f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad5f4:	d63f0200	blr	x16
   0x0000fffff7fad5f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad5fc:	54002b40	b.eq	0xfffff7fadb64  // b.none
   0x0000fffff7fad600:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fad604:	37d806a9	tbnz	w9, #27, 0xfffff7fad6d8
   0x0000fffff7fad608:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fad60c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad610:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad614:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad618:	540001c1	b.ne	0xfffff7fad650  // b.any
   0x0000fffff7fad61c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad620:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad624:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad628:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad62c:	54000121	b.ne	0xfffff7fad650  // b.any
   0x0000fffff7fad630:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fad634:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fad638:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fad63c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad640:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad644:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fad648:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fad64c:	14000030	b	0xfffff7fad70c
   0x0000fffff7fad650:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fad654:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad658:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad65c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad660:	54000120	b.eq	0xfffff7fad684  // b.none
   0x0000fffff7fad664:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fad668:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad66c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad670:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad674:	54000321	b.ne	0xfffff7fad6d8  // b.any
   0x0000fffff7fad678:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fad67c:	9e620120	scvtf	d0, x9
   0x0000fffff7fad680:	14000002	b	0xfffff7fad688
   0x0000fffff7fad684:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fad688:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad68c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad690:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad694:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad698:	54000120	b.eq	0xfffff7fad6bc  // b.none
   0x0000fffff7fad69c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad6a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad6a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad6a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad6ac:	54000161	b.ne	0xfffff7fad6d8  // b.any
   0x0000fffff7fad6b0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fad6b4:	9e620121	scvtf	d1, x9
   0x0000fffff7fad6b8:	14000002	b	0xfffff7fad6c0
   0x0000fffff7fad6bc:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fad6c0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fad6c4:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fad6c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad6cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad6d0:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fad6d4:	17ffffde	b	0xfffff7fad64c
   0x0000fffff7fad6d8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad6dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad6e0:	aa1303e1	mov	x1, x19
   0x0000fffff7fad6e4:	aa1503e2	mov	x2, x21
   0x0000fffff7fad6e8:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7fad6ec:	aa1403e4	mov	x4, x20
   0x0000fffff7fad6f0:	aa1603e5	mov	x5, x22
   0x0000fffff7fad6f4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fad6f8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad6fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad700:	d63f0200	blr	x16
   0x0000fffff7fad704:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad708:	54002320	b.eq	0xfffff7fadb6c  // b.none
   0x0000fffff7fad70c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad710:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad714:	aa1303e1	mov	x1, x19
   0x0000fffff7fad718:	aa1503e2	mov	x2, x21
   0x0000fffff7fad71c:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7fad720:	aa1403e4	mov	x4, x20
   0x0000fffff7fad724:	aa1603e5	mov	x5, x22
   0x0000fffff7fad728:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fad72c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad730:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad734:	d63f0200	blr	x16
   0x0000fffff7fad738:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad73c:	540021c0	b.eq	0xfffff7fadb74  // b.none
   0x0000fffff7fad740:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fad744:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad748:	aa1303e1	mov	x1, x19
   0x0000fffff7fad74c:	aa1503e2	mov	x2, x21
   0x0000fffff7fad750:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7fad754:	aa1403e4	mov	x4, x20
   0x0000fffff7fad758:	aa1603e5	mov	x5, x22
   0x0000fffff7fad75c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fad760:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fad764:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad768:	d63f0200	blr	x16
   0x0000fffff7fad76c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad770:	54002060	b.eq	0xfffff7fadb7c  // b.none
   0x0000fffff7fad774:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fad778:	f100017f	cmp	x11, #0x0
   0x0000fffff7fad77c:	540004a0	b.eq	0xfffff7fad810  // b.none
   0x0000fffff7fad780:	b940016d	ldr	w13, [x11]
   0x0000fffff7fad784:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fad788:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fad78c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fad790:	54000400	b.eq	0xfffff7fad810  // b.none
   0x0000fffff7fad794:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fad798:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fad79c:	36d801d1	tbz	w17, #27, 0xfffff7fad7d4
   0x0000fffff7fad7a0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fad7a4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fad7a8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fad7ac:	54000321	b.ne	0xfffff7fad810  // b.any
   0x0000fffff7fad7b0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fad7b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad7b8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fad7bc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fad7c0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fad7c4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fad7c8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fad7cc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fad7d0:	54000209	b.ls	0xfffff7fad810  // b.plast
   0x0000fffff7fad7d4:	36d8008d	tbz	w13, #27, 0xfffff7fad7e4
   0x0000fffff7fad7d8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fad7dc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fad7e0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fad7e4:	36d80091	tbz	w17, #27, 0xfffff7fad7f4
   0x0000fffff7fad7e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad7ec:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fad7f0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fad7f4:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fad7f8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fad7fc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fad800:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fad804:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fad808:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fad80c:	1400000e	b	0xfffff7fad844
   0x0000fffff7fad810:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fad814:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad818:	aa1303e1	mov	x1, x19
   0x0000fffff7fad81c:	aa1503e2	mov	x2, x21
   0x0000fffff7fad820:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7fad824:	aa1403e4	mov	x4, x20
   0x0000fffff7fad828:	aa1603e5	mov	x5, x22
   0x0000fffff7fad82c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fad830:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fad834:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad838:	d63f0200	blr	x16
   0x0000fffff7fad83c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad840:	54001a20	b.eq	0xfffff7fadb84  // b.none
   0x0000fffff7fad844:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fad848:	37d806a9	tbnz	w9, #27, 0xfffff7fad91c
   0x0000fffff7fad84c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fad850:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad854:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad858:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad85c:	540001c1	b.ne	0xfffff7fad894  // b.any
   0x0000fffff7fad860:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad864:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad868:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad86c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad870:	54000121	b.ne	0xfffff7fad894  // b.any
   0x0000fffff7fad874:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fad878:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fad87c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fad880:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad884:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad888:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fad88c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fad890:	14000030	b	0xfffff7fad950
   0x0000fffff7fad894:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fad898:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad89c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad8a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad8a4:	54000120	b.eq	0xfffff7fad8c8  // b.none
   0x0000fffff7fad8a8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fad8ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad8b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad8b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad8b8:	54000321	b.ne	0xfffff7fad91c  // b.any
   0x0000fffff7fad8bc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fad8c0:	9e620120	scvtf	d0, x9
   0x0000fffff7fad8c4:	14000002	b	0xfffff7fad8cc
   0x0000fffff7fad8c8:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fad8cc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad8d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad8d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad8d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad8dc:	54000120	b.eq	0xfffff7fad900  // b.none
   0x0000fffff7fad8e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fad8e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad8e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad8ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad8f0:	54000161	b.ne	0xfffff7fad91c  // b.any
   0x0000fffff7fad8f4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fad8f8:	9e620121	scvtf	d1, x9
   0x0000fffff7fad8fc:	14000002	b	0xfffff7fad904
   0x0000fffff7fad900:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fad904:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fad908:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fad90c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad910:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad914:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fad918:	17ffffde	b	0xfffff7fad890
   0x0000fffff7fad91c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad920:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad924:	aa1303e1	mov	x1, x19
   0x0000fffff7fad928:	aa1503e2	mov	x2, x21
   0x0000fffff7fad92c:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7fad930:	aa1403e4	mov	x4, x20
   0x0000fffff7fad934:	aa1603e5	mov	x5, x22
   0x0000fffff7fad938:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fad93c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad940:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad944:	d63f0200	blr	x16
   0x0000fffff7fad948:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad94c:	54001200	b.eq	0xfffff7fadb8c  // b.none
   0x0000fffff7fad950:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad954:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad958:	aa1303e1	mov	x1, x19
   0x0000fffff7fad95c:	aa1503e2	mov	x2, x21
   0x0000fffff7fad960:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7fad964:	aa1403e4	mov	x4, x20
   0x0000fffff7fad968:	aa1603e5	mov	x5, x22
   0x0000fffff7fad96c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fad970:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad974:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad978:	d63f0200	blr	x16
   0x0000fffff7fad97c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad980:	540010a0	b.eq	0xfffff7fadb94  // b.none
   0x0000fffff7fad984:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fad988:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad98c:	aa1303e1	mov	x1, x19
   0x0000fffff7fad990:	aa1503e2	mov	x2, x21
   0x0000fffff7fad994:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7fad998:	aa1403e4	mov	x4, x20
   0x0000fffff7fad99c:	aa1603e5	mov	x5, x22
   0x0000fffff7fad9a0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fad9a4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fad9a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad9ac:	d63f0200	blr	x16
   0x0000fffff7fad9b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad9b4:	54000f40	b.eq	0xfffff7fadb9c  // b.none
   0x0000fffff7fad9b8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad9bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad9c0:	aa1303e1	mov	x1, x19
   0x0000fffff7fad9c4:	aa1503e2	mov	x2, x21
   0x0000fffff7fad9c8:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7fad9cc:	aa1403e4	mov	x4, x20
   0x0000fffff7fad9d0:	aa1603e5	mov	x5, x22
   0x0000fffff7fad9d4:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7fad9d8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fad9dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad9e0:	d63f0200	blr	x16
   0x0000fffff7fad9e4:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fad9e8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fad9ec:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fad9f0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fad9f4:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fad9f8:	d65f03c0	ret
   0x0000fffff7fad9fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fada00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fada04:	b900028a	str	w10, [x20]
   0x0000fffff7fada08:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fada0c:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fada10:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fada14:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fada18:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fada1c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fada20:	d65f03c0	ret
   0x0000fffff7fada24:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fada28:	17fffff5	b	0xfffff7fad9fc
   0x0000fffff7fada2c:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fada30:	17fffff3	b	0xfffff7fad9fc
   0x0000fffff7fada34:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fada38:	17fffff1	b	0xfffff7fad9fc
   0x0000fffff7fada3c:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7fada40:	17ffffef	b	0xfffff7fad9fc
   0x0000fffff7fada44:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7fada48:	17ffffed	b	0xfffff7fad9fc
   0x0000fffff7fada4c:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fada50:	17ffffeb	b	0xfffff7fad9fc
   0x0000fffff7fada54:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fada58:	17ffffe9	b	0xfffff7fad9fc
   0x0000fffff7fada5c:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fada60:	17ffffe7	b	0xfffff7fad9fc
   0x0000fffff7fada64:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fada68:	17ffffe5	b	0xfffff7fad9fc
   0x0000fffff7fada6c:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fada70:	17ffffe3	b	0xfffff7fad9fc
   0x0000fffff7fada74:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fada78:	17ffffe1	b	0xfffff7fad9fc
   0x0000fffff7fada7c:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fada80:	17ffffdf	b	0xfffff7fad9fc
   0x0000fffff7fada84:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fada88:	17ffffdd	b	0xfffff7fad9fc
   0x0000fffff7fada8c:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fada90:	17ffffdb	b	0xfffff7fad9fc
   0x0000fffff7fada94:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fada98:	17ffffd9	b	0xfffff7fad9fc
   0x0000fffff7fada9c:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fadaa0:	17ffffd7	b	0xfffff7fad9fc
   0x0000fffff7fadaa4:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fadaa8:	17ffffd5	b	0xfffff7fad9fc
   0x0000fffff7fadaac:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fadab0:	17ffffd3	b	0xfffff7fad9fc
   0x0000fffff7fadab4:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fadab8:	17ffffd1	b	0xfffff7fad9fc
   0x0000fffff7fadabc:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fadac0:	17ffffcf	b	0xfffff7fad9fc
   0x0000fffff7fadac4:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fadac8:	17ffffcd	b	0xfffff7fad9fc
   0x0000fffff7fadacc:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fadad0:	17ffffcb	b	0xfffff7fad9fc
   0x0000fffff7fadad4:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fadad8:	17ffffc9	b	0xfffff7fad9fc
   0x0000fffff7fadadc:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fadae0:	17ffffc7	b	0xfffff7fad9fc
   0x0000fffff7fadae4:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fadae8:	17ffffc5	b	0xfffff7fad9fc
   0x0000fffff7fadaec:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fadaf0:	17ffffc3	b	0xfffff7fad9fc
   0x0000fffff7fadaf4:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fadaf8:	17ffffc1	b	0xfffff7fad9fc
   0x0000fffff7fadafc:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fadb00:	17ffffbf	b	0xfffff7fad9fc
   0x0000fffff7fadb04:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fadb08:	17ffffbd	b	0xfffff7fad9fc
   0x0000fffff7fadb0c:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fadb10:	17ffffbb	b	0xfffff7fad9fc
   0x0000fffff7fadb14:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fadb18:	17ffffb9	b	0xfffff7fad9fc
   0x0000fffff7fadb1c:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fadb20:	17ffffb7	b	0xfffff7fad9fc
   0x0000fffff7fadb24:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fadb28:	17ffffb5	b	0xfffff7fad9fc
   0x0000fffff7fadb2c:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fadb30:	17ffffb3	b	0xfffff7fad9fc
   0x0000fffff7fadb34:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fadb38:	17ffffb1	b	0xfffff7fad9fc
   0x0000fffff7fadb3c:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fadb40:	17ffffaf	b	0xfffff7fad9fc
   0x0000fffff7fadb44:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fadb48:	17ffffad	b	0xfffff7fad9fc
   0x0000fffff7fadb4c:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fadb50:	17ffffab	b	0xfffff7fad9fc
   0x0000fffff7fadb54:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fadb58:	17ffffa9	b	0xfffff7fad9fc
   0x0000fffff7fadb5c:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7fadb60:	17ffffa7	b	0xfffff7fad9fc
   0x0000fffff7fadb64:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fadb68:	17ffffa5	b	0xfffff7fad9fc
   0x0000fffff7fadb6c:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7fadb70:	17ffffa3	b	0xfffff7fad9fc
   0x0000fffff7fadb74:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7fadb78:	17ffffa1	b	0xfffff7fad9fc
   0x0000fffff7fadb7c:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7fadb80:	17ffff9f	b	0xfffff7fad9fc
   0x0000fffff7fadb84:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7fadb88:	17ffff9d	b	0xfffff7fad9fc
   0x0000fffff7fadb8c:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7fadb90:	17ffff9b	b	0xfffff7fad9fc
   0x0000fffff7fadb94:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7fadb98:	17ffff99	b	0xfffff7fad9fc
   0x0000fffff7fadb9c:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7fadba0:	17ffff97	b	0xfffff7fad9fc
   0x0000fffff7fadba4:	00000000	udf	#0
   0x0000fffff7fadba8:	00000000	udf	#0
   0x0000fffff7fadbac:	00000000	udf	#0
   0x0000fffff7fadbb0:	00000000	udf	#0
   0x0000fffff7fadbb4:	00000000	udf	#0
   0x0000fffff7fadbb8:	00000000	udf	#0
   0x0000fffff7fadbbc:	00000000	udf	#0
   0x0000fffff7fadbc0:	00000000	udf	#0
   0x0000fffff7fadbc4:	00000000	udf	#0
   0x0000fffff7fadbc8:	00000000	udf	#0
   0x0000fffff7fadbcc:	00000000	udf	#0
   0x0000fffff7fadbd0:	00000000	udf	#0
   0x0000fffff7fadbd4:	00000000	udf	#0
   0x0000fffff7fadbd8:	00000000	udf	#0
   0x0000fffff7fadbdc:	00000000	udf	#0
   0x0000fffff7fadbe0:	00000000	udf	#0
   0x0000fffff7fadbe4:	00000000	udf	#0
   0x0000fffff7fadbe8:	00000000	udf	#0
   0x0000fffff7fadbec:	00000000	udf	#0
   0x0000fffff7fadbf0:	00000000	udf	#0
   0x0000fffff7fadbf4:	00000000	udf	#0
   0x0000fffff7fadbf8:	00000000	udf	#0
   0x0000fffff7fadbfc:	00000000	udf	#0
   0x0000fffff7fadc00:	00000000	udf	#0
   0x0000fffff7fadc04:	00000000	udf	#0
   0x0000fffff7fadc08:	00000000	udf	#0
   0x0000fffff7fadc0c:	00000000	udf	#0
   0x0000fffff7fadc10:	00000000	udf	#0
   0x0000fffff7fadc14:	00000000	udf	#0
   0x0000fffff7fadc18:	00000000	udf	#0
   0x0000fffff7fadc1c:	00000000	udf	#0
   0x0000fffff7fadc20:	00000000	udf	#0
   0x0000fffff7fadc24:	00000000	udf	#0
   0x0000fffff7fadc28:	00000000	udf	#0
   0x0000fffff7fadc2c:	00000000	udf	#0
   0x0000fffff7fadc30:	00000000	udf	#0
   0x0000fffff7fadc34:	00000000	udf	#0
   0x0000fffff7fadc38:	00000000	udf	#0
   0x0000fffff7fadc3c:	00000000	udf	#0
   0x0000fffff7fadc40:	00000000	udf	#0
   0x0000fffff7fadc44:	00000000	udf	#0
   0x0000fffff7fadc48:	00000000	udf	#0
   0x0000fffff7fadc4c:	00000000	udf	#0
   0x0000fffff7fadc50:	00000000	udf	#0
   0x0000fffff7fadc54:	00000000	udf	#0
   0x0000fffff7fadc58:	00000000	udf	#0
   0x0000fffff7fadc5c:	00000000	udf	#0
   0x0000fffff7fadc60:	00000000	udf	#0
   0x0000fffff7fadc64:	00000000	udf	#0
   0x0000fffff7fadc68:	00000000	udf	#0
   0x0000fffff7fadc6c:	00000000	udf	#0
   0x0000fffff7fadc70:	00000000	udf	#0
   0x0000fffff7fadc74:	00000000	udf	#0
   0x0000fffff7fadc78:	00000000	udf	#0
   0x0000fffff7fadc7c:	00000000	udf	#0
   0x0000fffff7fadc80:	00000000	udf	#0
   0x0000fffff7fadc84:	00000000	udf	#0
   0x0000fffff7fadc88:	00000000	udf	#0
   0x0000fffff7fadc8c:	00000000	udf	#0
   0x0000fffff7fadc90:	00000000	udf	#0
   0x0000fffff7fadc94:	00000000	udf	#0
   0x0000fffff7fadc98:	00000000	udf	#0
   0x0000fffff7fadc9c:	00000000	udf	#0
   0x0000fffff7fadca0:	00000000	udf	#0
   0x0000fffff7fadca4:	00000000	udf	#0
   0x0000fffff7fadca8:	00000000	udf	#0
   0x0000fffff7fadcac:	00000000	udf	#0
   0x0000fffff7fadcb0:	00000000	udf	#0
   0x0000fffff7fadcb4:	00000000	udf	#0
   0x0000fffff7fadcb8:	00000000	udf	#0
   0x0000fffff7fadcbc:	00000000	udf	#0
   0x0000fffff7fadcc0:	00000000	udf	#0
   0x0000fffff7fadcc4:	00000000	udf	#0
   0x0000fffff7fadcc8:	00000000	udf	#0
   0x0000fffff7fadccc:	00000000	udf	#0
   0x0000fffff7fadcd0:	00000000	udf	#0
   0x0000fffff7fadcd4:	00000000	udf	#0
   0x0000fffff7fadcd8:	00000000	udf	#0
   0x0000fffff7fadcdc:	00000000	udf	#0
   0x0000fffff7fadce0:	00000000	udf	#0
   0x0000fffff7fadce4:	00000000	udf	#0
   0x0000fffff7fadce8:	00000000	udf	#0
   0x0000fffff7fadcec:	00000000	udf	#0
   0x0000fffff7fadcf0:	00000000	udf	#0
   0x0000fffff7fadcf4:	00000000	udf	#0
   0x0000fffff7fadcf8:	00000000	udf	#0
   0x0000fffff7fadcfc:	00000000	udf	#0
   0x0000fffff7fadd00:	00000000	udf	#0
   0x0000fffff7fadd04:	00000000	udf	#0
   0x0000fffff7fadd08:	00000000	udf	#0
   0x0000fffff7fadd0c:	00000000	udf	#0
   0x0000fffff7fadd10:	00000000	udf	#0
   0x0000fffff7fadd14:	00000000	udf	#0
   0x0000fffff7fadd18:	00000000	udf	#0
   0x0000fffff7fadd1c:	00000000	udf	#0
   0x0000fffff7fadd20:	00000000	udf	#0
   0x0000fffff7fadd24:	00000000	udf	#0
   0x0000fffff7fadd28:	00000000	udf	#0
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
