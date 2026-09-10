Dump of assembler code from 0xfffff7fae000 to 0xfffff7fb0000:
   0x0000fffff7fae000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fae004:	910003fd	mov	x29, sp
   0x0000fffff7fae008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fae00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fae010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fae014:	aa0003f3	mov	x19, x0
   0x0000fffff7fae018:	aa0103f4	mov	x20, x1
   0x0000fffff7fae01c:	aa0203f5	mov	x21, x2
   0x0000fffff7fae020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fae024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fae028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fae02c:	f90003e9	str	x9, [sp]
   0x0000fffff7fae030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fae034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fae038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fae03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fae040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae044:	d63f0200	blr	x16
   0x0000fffff7fae048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fae04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fae050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fae054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fae058:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fae05c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fae060:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fae064:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fae068:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fae06c:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7fae070:	36d801d1	tbz	w17, #27, 0xfffff7fae0a8
   0x0000fffff7fae074:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae078:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae07c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae080:	54000281	b.ne	0xfffff7fae0d0  // b.any
   0x0000fffff7fae084:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7fae088:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae08c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae090:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae094:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae098:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae09c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae0a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae0a4:	54000169	b.ls	0xfffff7fae0d0  // b.plast
   0x0000fffff7fae0a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fae0ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fae0b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fae0b4:	36d80091	tbz	w17, #27, 0xfffff7fae0c4
   0x0000fffff7fae0b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae0bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae0c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae0c4:	f900166c	str	x12, [x19, #40]
   0x0000fffff7fae0c8:	b900226d	str	w13, [x19, #32]
   0x0000fffff7fae0cc:	1400000e	b	0xfffff7fae104
   0x0000fffff7fae0d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae0d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae0d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fae0dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fae0e0:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fae0e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fae0e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fae0ec:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fae0f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae0f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae0f8:	d63f0200	blr	x16
   0x0000fffff7fae0fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae100:	5400e400	b.eq	0xfffff7fafd80  // b.none
   0x0000fffff7fae104:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fae108:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fae10c:	d280002c	mov	x12, #0x1                   	// #1
   0x0000fffff7fae110:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fae114:	36d80211	tbz	w17, #27, 0xfffff7fae154
   0x0000fffff7fae118:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae11c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae120:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae124:	540001e1	b.ne	0xfffff7fae160  // b.any
   0x0000fffff7fae128:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fae12c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae130:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae134:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae138:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae13c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae140:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae144:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae148:	540000c9	b.ls	0xfffff7fae160  // b.plast
   0x0000fffff7fae14c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae150:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae154:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fae158:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fae15c:	1400000e	b	0xfffff7fae194
   0x0000fffff7fae160:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae164:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae168:	aa1303e1	mov	x1, x19
   0x0000fffff7fae16c:	aa1503e2	mov	x2, x21
   0x0000fffff7fae170:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fae174:	aa1403e4	mov	x4, x20
   0x0000fffff7fae178:	aa1603e5	mov	x5, x22
   0x0000fffff7fae17c:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fae180:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fae184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae188:	d63f0200	blr	x16
   0x0000fffff7fae18c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae190:	5400dfc0	b.eq	0xfffff7fafd88  // b.none
   0x0000fffff7fae194:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fae198:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae19c:	aa1303e1	mov	x1, x19
   0x0000fffff7fae1a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fae1a4:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fae1a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fae1ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fae1b0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fae1b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fae1b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae1bc:	d63f0200	blr	x16
   0x0000fffff7fae1c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae1c4:	5400de60	b.eq	0xfffff7fafd90  // b.none
   0x0000fffff7fae1c8:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fae1cc:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fae1d0:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fae1d4:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7fae1d8:	36d80211	tbz	w17, #27, 0xfffff7fae218
   0x0000fffff7fae1dc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae1e0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae1e4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae1e8:	540001e1	b.ne	0xfffff7fae224  // b.any
   0x0000fffff7fae1ec:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7fae1f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae1f4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae1f8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae1fc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae200:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae204:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae208:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae20c:	540000c9	b.ls	0xfffff7fae224  // b.plast
   0x0000fffff7fae210:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae214:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae218:	f900166c	str	x12, [x19, #40]
   0x0000fffff7fae21c:	b900226d	str	w13, [x19, #32]
   0x0000fffff7fae220:	1400000e	b	0xfffff7fae258
   0x0000fffff7fae224:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae228:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae22c:	aa1303e1	mov	x1, x19
   0x0000fffff7fae230:	aa1503e2	mov	x2, x21
   0x0000fffff7fae234:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7fae238:	aa1403e4	mov	x4, x20
   0x0000fffff7fae23c:	aa1603e5	mov	x5, x22
   0x0000fffff7fae240:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fae244:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fae248:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae24c:	d63f0200	blr	x16
   0x0000fffff7fae250:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae254:	5400da20	b.eq	0xfffff7fafd98  // b.none
   0x0000fffff7fae258:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fae25c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae260:	aa1303e1	mov	x1, x19
   0x0000fffff7fae264:	aa1503e2	mov	x2, x21
   0x0000fffff7fae268:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7fae26c:	aa1403e4	mov	x4, x20
   0x0000fffff7fae270:	aa1603e5	mov	x5, x22
   0x0000fffff7fae274:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fae278:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fae27c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae280:	d63f0200	blr	x16
   0x0000fffff7fae284:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae288:	5400d8c0	b.eq	0xfffff7fafda0  // b.none
   0x0000fffff7fae28c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fae290:	37d806a9	tbnz	w9, #27, 0xfffff7fae364
   0x0000fffff7fae294:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fae298:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae29c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae2a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae2a4:	540001c1	b.ne	0xfffff7fae2dc  // b.any
   0x0000fffff7fae2a8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae2ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae2b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae2b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae2b8:	54000121	b.ne	0xfffff7fae2dc  // b.any
   0x0000fffff7fae2bc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fae2c0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fae2c4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fae2c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae2cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae2d0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fae2d4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fae2d8:	14000030	b	0xfffff7fae398
   0x0000fffff7fae2dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fae2e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae2e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae2e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae2ec:	54000120	b.eq	0xfffff7fae310  // b.none
   0x0000fffff7fae2f0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fae2f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae2f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae2fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae300:	54000321	b.ne	0xfffff7fae364  // b.any
   0x0000fffff7fae304:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fae308:	9e620120	scvtf	d0, x9
   0x0000fffff7fae30c:	14000002	b	0xfffff7fae314
   0x0000fffff7fae310:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fae314:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae318:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae31c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae320:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae324:	54000120	b.eq	0xfffff7fae348  // b.none
   0x0000fffff7fae328:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae32c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae330:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae334:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae338:	54000161	b.ne	0xfffff7fae364  // b.any
   0x0000fffff7fae33c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fae340:	9e620121	scvtf	d1, x9
   0x0000fffff7fae344:	14000002	b	0xfffff7fae34c
   0x0000fffff7fae348:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fae34c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fae350:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fae354:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae358:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae35c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fae360:	17ffffde	b	0xfffff7fae2d8
   0x0000fffff7fae364:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae368:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae36c:	aa1303e1	mov	x1, x19
   0x0000fffff7fae370:	aa1503e2	mov	x2, x21
   0x0000fffff7fae374:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fae378:	aa1403e4	mov	x4, x20
   0x0000fffff7fae37c:	aa1603e5	mov	x5, x22
   0x0000fffff7fae380:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fae384:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae388:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae38c:	d63f0200	blr	x16
   0x0000fffff7fae390:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae394:	5400d0a0	b.eq	0xfffff7fafda8  // b.none
   0x0000fffff7fae398:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fae39c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fae3a0:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fae3a4:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fae3a8:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fae3ac:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fae3b0:	36d801d1	tbz	w17, #27, 0xfffff7fae3e8
   0x0000fffff7fae3b4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae3b8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae3bc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae3c0:	54000281	b.ne	0xfffff7fae410  // b.any
   0x0000fffff7fae3c4:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fae3c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae3cc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae3d0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae3d4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae3d8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae3dc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae3e0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae3e4:	54000169	b.ls	0xfffff7fae410  // b.plast
   0x0000fffff7fae3e8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fae3ec:	91000529	add	x9, x9, #0x1
   0x0000fffff7fae3f0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fae3f4:	36d80091	tbz	w17, #27, 0xfffff7fae404
   0x0000fffff7fae3f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae3fc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae400:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae404:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fae408:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fae40c:	1400000e	b	0xfffff7fae444
   0x0000fffff7fae410:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae414:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae418:	aa1303e1	mov	x1, x19
   0x0000fffff7fae41c:	aa1503e2	mov	x2, x21
   0x0000fffff7fae420:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fae424:	aa1403e4	mov	x4, x20
   0x0000fffff7fae428:	aa1603e5	mov	x5, x22
   0x0000fffff7fae42c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fae430:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae434:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae438:	d63f0200	blr	x16
   0x0000fffff7fae43c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae440:	5400cb80	b.eq	0xfffff7fafdb0  // b.none
   0x0000fffff7fae444:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fae448:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae44c:	aa1303e1	mov	x1, x19
   0x0000fffff7fae450:	aa1503e2	mov	x2, x21
   0x0000fffff7fae454:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fae458:	aa1403e4	mov	x4, x20
   0x0000fffff7fae45c:	aa1603e5	mov	x5, x22
   0x0000fffff7fae460:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fae464:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fae468:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae46c:	d63f0200	blr	x16
   0x0000fffff7fae470:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae474:	5400ca20	b.eq	0xfffff7fafdb8  // b.none
   0x0000fffff7fae478:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fae47c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fae480:	540004a0	b.eq	0xfffff7fae514  // b.none
   0x0000fffff7fae484:	b940016d	ldr	w13, [x11]
   0x0000fffff7fae488:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fae48c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fae490:	eb0901bf	cmp	x13, x9
   0x0000fffff7fae494:	54000400	b.eq	0xfffff7fae514  // b.none
   0x0000fffff7fae498:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fae49c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fae4a0:	36d801d1	tbz	w17, #27, 0xfffff7fae4d8
   0x0000fffff7fae4a4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae4a8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae4ac:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae4b0:	54000321	b.ne	0xfffff7fae514  // b.any
   0x0000fffff7fae4b4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fae4b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae4bc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae4c0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae4c4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae4c8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae4cc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae4d0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae4d4:	54000209	b.ls	0xfffff7fae514  // b.plast
   0x0000fffff7fae4d8:	36d8008d	tbz	w13, #27, 0xfffff7fae4e8
   0x0000fffff7fae4dc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fae4e0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fae4e4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fae4e8:	36d80091	tbz	w17, #27, 0xfffff7fae4f8
   0x0000fffff7fae4ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae4f0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae4f4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae4f8:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fae4fc:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fae500:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fae504:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fae508:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fae50c:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fae510:	1400000e	b	0xfffff7fae548
   0x0000fffff7fae514:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fae518:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae51c:	aa1303e1	mov	x1, x19
   0x0000fffff7fae520:	aa1503e2	mov	x2, x21
   0x0000fffff7fae524:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fae528:	aa1403e4	mov	x4, x20
   0x0000fffff7fae52c:	aa1603e5	mov	x5, x22
   0x0000fffff7fae530:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fae534:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fae538:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae53c:	d63f0200	blr	x16
   0x0000fffff7fae540:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae544:	5400c3e0	b.eq	0xfffff7fafdc0  // b.none
   0x0000fffff7fae548:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fae54c:	37d806a9	tbnz	w9, #27, 0xfffff7fae620
   0x0000fffff7fae550:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fae554:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae558:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae55c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae560:	540001c1	b.ne	0xfffff7fae598  // b.any
   0x0000fffff7fae564:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae568:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae56c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae570:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae574:	54000121	b.ne	0xfffff7fae598  // b.any
   0x0000fffff7fae578:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fae57c:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fae580:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fae584:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae588:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae58c:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fae590:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fae594:	14000030	b	0xfffff7fae654
   0x0000fffff7fae598:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fae59c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae5a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae5a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae5a8:	54000120	b.eq	0xfffff7fae5cc  // b.none
   0x0000fffff7fae5ac:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fae5b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae5b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae5b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae5bc:	54000321	b.ne	0xfffff7fae620  // b.any
   0x0000fffff7fae5c0:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fae5c4:	9e620120	scvtf	d0, x9
   0x0000fffff7fae5c8:	14000002	b	0xfffff7fae5d0
   0x0000fffff7fae5cc:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fae5d0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae5d4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae5d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae5dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae5e0:	54000120	b.eq	0xfffff7fae604  // b.none
   0x0000fffff7fae5e4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae5e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae5ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae5f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae5f4:	54000161	b.ne	0xfffff7fae620  // b.any
   0x0000fffff7fae5f8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fae5fc:	9e620121	scvtf	d1, x9
   0x0000fffff7fae600:	14000002	b	0xfffff7fae608
   0x0000fffff7fae604:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fae608:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fae60c:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fae610:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae614:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae618:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fae61c:	17ffffde	b	0xfffff7fae594
   0x0000fffff7fae620:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae624:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae628:	aa1303e1	mov	x1, x19
   0x0000fffff7fae62c:	aa1503e2	mov	x2, x21
   0x0000fffff7fae630:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fae634:	aa1403e4	mov	x4, x20
   0x0000fffff7fae638:	aa1603e5	mov	x5, x22
   0x0000fffff7fae63c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fae640:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae644:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae648:	d63f0200	blr	x16
   0x0000fffff7fae64c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae650:	5400bbc0	b.eq	0xfffff7fafdc8  // b.none
   0x0000fffff7fae654:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fae658:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fae65c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fae660:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fae664:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fae668:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fae66c:	36d801d1	tbz	w17, #27, 0xfffff7fae6a4
   0x0000fffff7fae670:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae674:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae678:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae67c:	54000281	b.ne	0xfffff7fae6cc  // b.any
   0x0000fffff7fae680:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fae684:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae688:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae68c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae690:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae694:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae698:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae69c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae6a0:	54000169	b.ls	0xfffff7fae6cc  // b.plast
   0x0000fffff7fae6a4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fae6a8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fae6ac:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fae6b0:	36d80091	tbz	w17, #27, 0xfffff7fae6c0
   0x0000fffff7fae6b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae6b8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae6bc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae6c0:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fae6c4:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fae6c8:	1400000e	b	0xfffff7fae700
   0x0000fffff7fae6cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae6d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae6d4:	aa1303e1	mov	x1, x19
   0x0000fffff7fae6d8:	aa1503e2	mov	x2, x21
   0x0000fffff7fae6dc:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fae6e0:	aa1403e4	mov	x4, x20
   0x0000fffff7fae6e4:	aa1603e5	mov	x5, x22
   0x0000fffff7fae6e8:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fae6ec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae6f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae6f4:	d63f0200	blr	x16
   0x0000fffff7fae6f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae6fc:	5400b6a0	b.eq	0xfffff7fafdd0  // b.none
   0x0000fffff7fae700:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fae704:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae708:	aa1303e1	mov	x1, x19
   0x0000fffff7fae70c:	aa1503e2	mov	x2, x21
   0x0000fffff7fae710:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fae714:	aa1403e4	mov	x4, x20
   0x0000fffff7fae718:	aa1603e5	mov	x5, x22
   0x0000fffff7fae71c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fae720:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fae724:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae728:	d63f0200	blr	x16
   0x0000fffff7fae72c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae730:	5400b540	b.eq	0xfffff7fafdd8  // b.none
   0x0000fffff7fae734:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fae738:	f100017f	cmp	x11, #0x0
   0x0000fffff7fae73c:	540004a0	b.eq	0xfffff7fae7d0  // b.none
   0x0000fffff7fae740:	b940016d	ldr	w13, [x11]
   0x0000fffff7fae744:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fae748:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fae74c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fae750:	54000400	b.eq	0xfffff7fae7d0  // b.none
   0x0000fffff7fae754:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fae758:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fae75c:	36d801d1	tbz	w17, #27, 0xfffff7fae794
   0x0000fffff7fae760:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae764:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae768:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae76c:	54000321	b.ne	0xfffff7fae7d0  // b.any
   0x0000fffff7fae770:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fae774:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae778:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae77c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae780:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae784:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae788:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae78c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae790:	54000209	b.ls	0xfffff7fae7d0  // b.plast
   0x0000fffff7fae794:	36d8008d	tbz	w13, #27, 0xfffff7fae7a4
   0x0000fffff7fae798:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fae79c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fae7a0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fae7a4:	36d80091	tbz	w17, #27, 0xfffff7fae7b4
   0x0000fffff7fae7a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae7ac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae7b0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae7b4:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fae7b8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fae7bc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fae7c0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fae7c4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fae7c8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fae7cc:	1400000e	b	0xfffff7fae804
   0x0000fffff7fae7d0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fae7d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae7d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fae7dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fae7e0:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fae7e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fae7e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fae7ec:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fae7f0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fae7f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae7f8:	d63f0200	blr	x16
   0x0000fffff7fae7fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae800:	5400af00	b.eq	0xfffff7fafde0  // b.none
   0x0000fffff7fae804:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fae808:	37d806a9	tbnz	w9, #27, 0xfffff7fae8dc
   0x0000fffff7fae80c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fae810:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae814:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae818:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae81c:	540001c1	b.ne	0xfffff7fae854  // b.any
   0x0000fffff7fae820:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae824:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae828:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae82c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae830:	54000121	b.ne	0xfffff7fae854  // b.any
   0x0000fffff7fae834:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fae838:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fae83c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fae840:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae844:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae848:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fae84c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fae850:	14000030	b	0xfffff7fae910
   0x0000fffff7fae854:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fae858:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae85c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae860:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae864:	54000120	b.eq	0xfffff7fae888  // b.none
   0x0000fffff7fae868:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fae86c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae870:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae874:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae878:	54000321	b.ne	0xfffff7fae8dc  // b.any
   0x0000fffff7fae87c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fae880:	9e620120	scvtf	d0, x9
   0x0000fffff7fae884:	14000002	b	0xfffff7fae88c
   0x0000fffff7fae888:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fae88c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae890:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae894:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae898:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae89c:	54000120	b.eq	0xfffff7fae8c0  // b.none
   0x0000fffff7fae8a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae8a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae8a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae8ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae8b0:	54000161	b.ne	0xfffff7fae8dc  // b.any
   0x0000fffff7fae8b4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fae8b8:	9e620121	scvtf	d1, x9
   0x0000fffff7fae8bc:	14000002	b	0xfffff7fae8c4
   0x0000fffff7fae8c0:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fae8c4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fae8c8:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fae8cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae8d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae8d4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fae8d8:	17ffffde	b	0xfffff7fae850
   0x0000fffff7fae8dc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae8e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae8e4:	aa1303e1	mov	x1, x19
   0x0000fffff7fae8e8:	aa1503e2	mov	x2, x21
   0x0000fffff7fae8ec:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fae8f0:	aa1403e4	mov	x4, x20
   0x0000fffff7fae8f4:	aa1603e5	mov	x5, x22
   0x0000fffff7fae8f8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fae8fc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae900:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae904:	d63f0200	blr	x16
   0x0000fffff7fae908:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae90c:	5400a6e0	b.eq	0xfffff7fafde8  // b.none
   0x0000fffff7fae910:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fae914:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fae918:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fae91c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fae920:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fae924:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fae928:	36d801d1	tbz	w17, #27, 0xfffff7fae960
   0x0000fffff7fae92c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae930:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae934:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae938:	54000281	b.ne	0xfffff7fae988  // b.any
   0x0000fffff7fae93c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fae940:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae944:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae948:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae94c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae950:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae954:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae958:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae95c:	54000169	b.ls	0xfffff7fae988  // b.plast
   0x0000fffff7fae960:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fae964:	91000529	add	x9, x9, #0x1
   0x0000fffff7fae968:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fae96c:	36d80091	tbz	w17, #27, 0xfffff7fae97c
   0x0000fffff7fae970:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae974:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae978:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae97c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fae980:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fae984:	1400000e	b	0xfffff7fae9bc
   0x0000fffff7fae988:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae98c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae990:	aa1303e1	mov	x1, x19
   0x0000fffff7fae994:	aa1503e2	mov	x2, x21
   0x0000fffff7fae998:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fae99c:	aa1403e4	mov	x4, x20
   0x0000fffff7fae9a0:	aa1603e5	mov	x5, x22
   0x0000fffff7fae9a4:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fae9a8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae9ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae9b0:	d63f0200	blr	x16
   0x0000fffff7fae9b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae9b8:	5400a1c0	b.eq	0xfffff7fafdf0  // b.none
   0x0000fffff7fae9bc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fae9c0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae9c4:	aa1303e1	mov	x1, x19
   0x0000fffff7fae9c8:	aa1503e2	mov	x2, x21
   0x0000fffff7fae9cc:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fae9d0:	aa1403e4	mov	x4, x20
   0x0000fffff7fae9d4:	aa1603e5	mov	x5, x22
   0x0000fffff7fae9d8:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fae9dc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fae9e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae9e4:	d63f0200	blr	x16
   0x0000fffff7fae9e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae9ec:	5400a060	b.eq	0xfffff7fafdf8  // b.none
   0x0000fffff7fae9f0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fae9f4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fae9f8:	540004a0	b.eq	0xfffff7faea8c  // b.none
   0x0000fffff7fae9fc:	b940016d	ldr	w13, [x11]
   0x0000fffff7faea00:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faea04:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faea08:	eb0901bf	cmp	x13, x9
   0x0000fffff7faea0c:	54000400	b.eq	0xfffff7faea8c  // b.none
   0x0000fffff7faea10:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faea14:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faea18:	36d801d1	tbz	w17, #27, 0xfffff7faea50
   0x0000fffff7faea1c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faea20:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faea24:	f100013f	cmp	x9, #0x0
   0x0000fffff7faea28:	54000321	b.ne	0xfffff7faea8c  // b.any
   0x0000fffff7faea2c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faea30:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faea34:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faea38:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faea3c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faea40:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faea44:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faea48:	f100055f	cmp	x10, #0x1
   0x0000fffff7faea4c:	54000209	b.ls	0xfffff7faea8c  // b.plast
   0x0000fffff7faea50:	36d8008d	tbz	w13, #27, 0xfffff7faea60
   0x0000fffff7faea54:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faea58:	91000529	add	x9, x9, #0x1
   0x0000fffff7faea5c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faea60:	36d80091	tbz	w17, #27, 0xfffff7faea70
   0x0000fffff7faea64:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faea68:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faea6c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faea70:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7faea74:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faea78:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faea7c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faea80:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faea84:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faea88:	1400000e	b	0xfffff7faeac0
   0x0000fffff7faea8c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faea90:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faea94:	aa1303e1	mov	x1, x19
   0x0000fffff7faea98:	aa1503e2	mov	x2, x21
   0x0000fffff7faea9c:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7faeaa0:	aa1403e4	mov	x4, x20
   0x0000fffff7faeaa4:	aa1603e5	mov	x5, x22
   0x0000fffff7faeaa8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faeaac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faeab0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faeab4:	d63f0200	blr	x16
   0x0000fffff7faeab8:	f100001f	cmp	x0, #0x0
   0x0000fffff7faeabc:	54009a20	b.eq	0xfffff7fafe00  // b.none
   0x0000fffff7faeac0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faeac4:	37d806a9	tbnz	w9, #27, 0xfffff7faeb98
   0x0000fffff7faeac8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faeacc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faead0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faead4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faead8:	540001c1	b.ne	0xfffff7faeb10  // b.any
   0x0000fffff7faeadc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faeae0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faeae4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faeae8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faeaec:	54000121	b.ne	0xfffff7faeb10  // b.any
   0x0000fffff7faeaf0:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faeaf4:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7faeaf8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faeafc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faeb00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faeb04:	f9001669	str	x9, [x19, #40]
   0x0000fffff7faeb08:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faeb0c:	14000030	b	0xfffff7faebcc
   0x0000fffff7faeb10:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faeb14:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faeb18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faeb1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faeb20:	54000120	b.eq	0xfffff7faeb44  // b.none
   0x0000fffff7faeb24:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faeb28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faeb2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faeb30:	eb0a013f	cmp	x9, x10
   0x0000fffff7faeb34:	54000321	b.ne	0xfffff7faeb98  // b.any
   0x0000fffff7faeb38:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faeb3c:	9e620120	scvtf	d0, x9
   0x0000fffff7faeb40:	14000002	b	0xfffff7faeb48
   0x0000fffff7faeb44:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7faeb48:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faeb4c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faeb50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faeb54:	eb0a013f	cmp	x9, x10
   0x0000fffff7faeb58:	54000120	b.eq	0xfffff7faeb7c  // b.none
   0x0000fffff7faeb5c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faeb60:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faeb64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faeb68:	eb0a013f	cmp	x9, x10
   0x0000fffff7faeb6c:	54000161	b.ne	0xfffff7faeb98  // b.any
   0x0000fffff7faeb70:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faeb74:	9e620121	scvtf	d1, x9
   0x0000fffff7faeb78:	14000002	b	0xfffff7faeb80
   0x0000fffff7faeb7c:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7faeb80:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faeb84:	fd001660	str	d0, [x19, #40]
   0x0000fffff7faeb88:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faeb8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faeb90:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faeb94:	17ffffde	b	0xfffff7faeb0c
   0x0000fffff7faeb98:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faeb9c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faeba0:	aa1303e1	mov	x1, x19
   0x0000fffff7faeba4:	aa1503e2	mov	x2, x21
   0x0000fffff7faeba8:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7faebac:	aa1403e4	mov	x4, x20
   0x0000fffff7faebb0:	aa1603e5	mov	x5, x22
   0x0000fffff7faebb4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faebb8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faebbc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faebc0:	d63f0200	blr	x16
   0x0000fffff7faebc4:	f100001f	cmp	x0, #0x0
   0x0000fffff7faebc8:	54009200	b.eq	0xfffff7fafe08  // b.none
   0x0000fffff7faebcc:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7faebd0:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7faebd4:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7faebd8:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7faebdc:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7faebe0:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7faebe4:	36d801d1	tbz	w17, #27, 0xfffff7faec1c
   0x0000fffff7faebe8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faebec:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faebf0:	f100013f	cmp	x9, #0x0
   0x0000fffff7faebf4:	54000281	b.ne	0xfffff7faec44  // b.any
   0x0000fffff7faebf8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faebfc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faec00:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faec04:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faec08:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faec0c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faec10:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faec14:	f100055f	cmp	x10, #0x1
   0x0000fffff7faec18:	54000169	b.ls	0xfffff7faec44  // b.plast
   0x0000fffff7faec1c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faec20:	91000529	add	x9, x9, #0x1
   0x0000fffff7faec24:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faec28:	36d80091	tbz	w17, #27, 0xfffff7faec38
   0x0000fffff7faec2c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faec30:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faec34:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faec38:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faec3c:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faec40:	1400000e	b	0xfffff7faec78
   0x0000fffff7faec44:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faec48:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faec4c:	aa1303e1	mov	x1, x19
   0x0000fffff7faec50:	aa1503e2	mov	x2, x21
   0x0000fffff7faec54:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7faec58:	aa1403e4	mov	x4, x20
   0x0000fffff7faec5c:	aa1603e5	mov	x5, x22
   0x0000fffff7faec60:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7faec64:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faec68:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faec6c:	d63f0200	blr	x16
   0x0000fffff7faec70:	f100001f	cmp	x0, #0x0
   0x0000fffff7faec74:	54008ce0	b.eq	0xfffff7fafe10  // b.none
   0x0000fffff7faec78:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faec7c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faec80:	aa1303e1	mov	x1, x19
   0x0000fffff7faec84:	aa1503e2	mov	x2, x21
   0x0000fffff7faec88:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7faec8c:	aa1403e4	mov	x4, x20
   0x0000fffff7faec90:	aa1603e5	mov	x5, x22
   0x0000fffff7faec94:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7faec98:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faec9c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faeca0:	d63f0200	blr	x16
   0x0000fffff7faeca4:	f100001f	cmp	x0, #0x0
   0x0000fffff7faeca8:	54008b80	b.eq	0xfffff7fafe18  // b.none
   0x0000fffff7faecac:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faecb0:	f100017f	cmp	x11, #0x0
   0x0000fffff7faecb4:	540004a0	b.eq	0xfffff7faed48  // b.none
   0x0000fffff7faecb8:	b940016d	ldr	w13, [x11]
   0x0000fffff7faecbc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faecc0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faecc4:	eb0901bf	cmp	x13, x9
   0x0000fffff7faecc8:	54000400	b.eq	0xfffff7faed48  // b.none
   0x0000fffff7faeccc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faecd0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faecd4:	36d801d1	tbz	w17, #27, 0xfffff7faed0c
   0x0000fffff7faecd8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faecdc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faece0:	f100013f	cmp	x9, #0x0
   0x0000fffff7faece4:	54000321	b.ne	0xfffff7faed48  // b.any
   0x0000fffff7faece8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faecec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faecf0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faecf4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faecf8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faecfc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faed00:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faed04:	f100055f	cmp	x10, #0x1
   0x0000fffff7faed08:	54000209	b.ls	0xfffff7faed48  // b.plast
   0x0000fffff7faed0c:	36d8008d	tbz	w13, #27, 0xfffff7faed1c
   0x0000fffff7faed10:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faed14:	91000529	add	x9, x9, #0x1
   0x0000fffff7faed18:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faed1c:	36d80091	tbz	w17, #27, 0xfffff7faed2c
   0x0000fffff7faed20:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faed24:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faed28:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faed2c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7faed30:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faed34:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faed38:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faed3c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faed40:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faed44:	1400000e	b	0xfffff7faed7c
   0x0000fffff7faed48:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faed4c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faed50:	aa1303e1	mov	x1, x19
   0x0000fffff7faed54:	aa1503e2	mov	x2, x21
   0x0000fffff7faed58:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7faed5c:	aa1403e4	mov	x4, x20
   0x0000fffff7faed60:	aa1603e5	mov	x5, x22
   0x0000fffff7faed64:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faed68:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faed6c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faed70:	d63f0200	blr	x16
   0x0000fffff7faed74:	f100001f	cmp	x0, #0x0
   0x0000fffff7faed78:	54008540	b.eq	0xfffff7fafe20  // b.none
   0x0000fffff7faed7c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faed80:	37d806a9	tbnz	w9, #27, 0xfffff7faee54
   0x0000fffff7faed84:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faed88:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faed8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faed90:	eb0a013f	cmp	x9, x10
   0x0000fffff7faed94:	540001c1	b.ne	0xfffff7faedcc  // b.any
   0x0000fffff7faed98:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faed9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faeda0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faeda4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faeda8:	54000121	b.ne	0xfffff7faedcc  // b.any
   0x0000fffff7faedac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faedb0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7faedb4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faedb8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faedbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faedc0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7faedc4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faedc8:	14000030	b	0xfffff7faee88
   0x0000fffff7faedcc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faedd0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faedd4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faedd8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faeddc:	54000120	b.eq	0xfffff7faee00  // b.none
   0x0000fffff7faede0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faede4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faede8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faedec:	eb0a013f	cmp	x9, x10
   0x0000fffff7faedf0:	54000321	b.ne	0xfffff7faee54  // b.any
   0x0000fffff7faedf4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faedf8:	9e620120	scvtf	d0, x9
   0x0000fffff7faedfc:	14000002	b	0xfffff7faee04
   0x0000fffff7faee00:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7faee04:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faee08:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faee0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faee10:	eb0a013f	cmp	x9, x10
   0x0000fffff7faee14:	54000120	b.eq	0xfffff7faee38  // b.none
   0x0000fffff7faee18:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faee1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faee20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faee24:	eb0a013f	cmp	x9, x10
   0x0000fffff7faee28:	54000161	b.ne	0xfffff7faee54  // b.any
   0x0000fffff7faee2c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faee30:	9e620121	scvtf	d1, x9
   0x0000fffff7faee34:	14000002	b	0xfffff7faee3c
   0x0000fffff7faee38:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7faee3c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faee40:	fd001660	str	d0, [x19, #40]
   0x0000fffff7faee44:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faee48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faee4c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faee50:	17ffffde	b	0xfffff7faedc8
   0x0000fffff7faee54:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faee58:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faee5c:	aa1303e1	mov	x1, x19
   0x0000fffff7faee60:	aa1503e2	mov	x2, x21
   0x0000fffff7faee64:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7faee68:	aa1403e4	mov	x4, x20
   0x0000fffff7faee6c:	aa1603e5	mov	x5, x22
   0x0000fffff7faee70:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faee74:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faee78:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faee7c:	d63f0200	blr	x16
   0x0000fffff7faee80:	f100001f	cmp	x0, #0x0
   0x0000fffff7faee84:	54007d20	b.eq	0xfffff7fafe28  // b.none
   0x0000fffff7faee88:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7faee8c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7faee90:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7faee94:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7faee98:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7faee9c:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7faeea0:	36d801d1	tbz	w17, #27, 0xfffff7faeed8
   0x0000fffff7faeea4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faeea8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faeeac:	f100013f	cmp	x9, #0x0
   0x0000fffff7faeeb0:	54000281	b.ne	0xfffff7faef00  // b.any
   0x0000fffff7faeeb4:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faeeb8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faeebc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faeec0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faeec4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faeec8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faeecc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faeed0:	f100055f	cmp	x10, #0x1
   0x0000fffff7faeed4:	54000169	b.ls	0xfffff7faef00  // b.plast
   0x0000fffff7faeed8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faeedc:	91000529	add	x9, x9, #0x1
   0x0000fffff7faeee0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faeee4:	36d80091	tbz	w17, #27, 0xfffff7faeef4
   0x0000fffff7faeee8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faeeec:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faeef0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faeef4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faeef8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faeefc:	1400000e	b	0xfffff7faef34
   0x0000fffff7faef00:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faef04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faef08:	aa1303e1	mov	x1, x19
   0x0000fffff7faef0c:	aa1503e2	mov	x2, x21
   0x0000fffff7faef10:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7faef14:	aa1403e4	mov	x4, x20
   0x0000fffff7faef18:	aa1603e5	mov	x5, x22
   0x0000fffff7faef1c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7faef20:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faef24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faef28:	d63f0200	blr	x16
   0x0000fffff7faef2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faef30:	54007800	b.eq	0xfffff7fafe30  // b.none
   0x0000fffff7faef34:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faef38:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faef3c:	aa1303e1	mov	x1, x19
   0x0000fffff7faef40:	aa1503e2	mov	x2, x21
   0x0000fffff7faef44:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7faef48:	aa1403e4	mov	x4, x20
   0x0000fffff7faef4c:	aa1603e5	mov	x5, x22
   0x0000fffff7faef50:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7faef54:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faef58:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faef5c:	d63f0200	blr	x16
   0x0000fffff7faef60:	f100001f	cmp	x0, #0x0
   0x0000fffff7faef64:	540076a0	b.eq	0xfffff7fafe38  // b.none
   0x0000fffff7faef68:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faef6c:	f100017f	cmp	x11, #0x0
   0x0000fffff7faef70:	540004a0	b.eq	0xfffff7faf004  // b.none
   0x0000fffff7faef74:	b940016d	ldr	w13, [x11]
   0x0000fffff7faef78:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faef7c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faef80:	eb0901bf	cmp	x13, x9
   0x0000fffff7faef84:	54000400	b.eq	0xfffff7faf004  // b.none
   0x0000fffff7faef88:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faef8c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faef90:	36d801d1	tbz	w17, #27, 0xfffff7faefc8
   0x0000fffff7faef94:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faef98:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faef9c:	f100013f	cmp	x9, #0x0
   0x0000fffff7faefa0:	54000321	b.ne	0xfffff7faf004  // b.any
   0x0000fffff7faefa4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faefa8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faefac:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faefb0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faefb4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faefb8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faefbc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faefc0:	f100055f	cmp	x10, #0x1
   0x0000fffff7faefc4:	54000209	b.ls	0xfffff7faf004  // b.plast
   0x0000fffff7faefc8:	36d8008d	tbz	w13, #27, 0xfffff7faefd8
   0x0000fffff7faefcc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faefd0:	91000529	add	x9, x9, #0x1
   0x0000fffff7faefd4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faefd8:	36d80091	tbz	w17, #27, 0xfffff7faefe8
   0x0000fffff7faefdc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faefe0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faefe4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faefe8:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7faefec:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faeff0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faeff4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faeff8:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faeffc:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faf000:	1400000e	b	0xfffff7faf038
   0x0000fffff7faf004:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faf008:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf00c:	aa1303e1	mov	x1, x19
   0x0000fffff7faf010:	aa1503e2	mov	x2, x21
   0x0000fffff7faf014:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7faf018:	aa1403e4	mov	x4, x20
   0x0000fffff7faf01c:	aa1603e5	mov	x5, x22
   0x0000fffff7faf020:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faf024:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faf028:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf02c:	d63f0200	blr	x16
   0x0000fffff7faf030:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf034:	54007060	b.eq	0xfffff7fafe40  // b.none
   0x0000fffff7faf038:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faf03c:	37d806a9	tbnz	w9, #27, 0xfffff7faf110
   0x0000fffff7faf040:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faf044:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf048:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf04c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf050:	540001c1	b.ne	0xfffff7faf088  // b.any
   0x0000fffff7faf054:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf058:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf05c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf060:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf064:	54000121	b.ne	0xfffff7faf088  // b.any
   0x0000fffff7faf068:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faf06c:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7faf070:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faf074:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf078:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf07c:	f9001669	str	x9, [x19, #40]
   0x0000fffff7faf080:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faf084:	14000030	b	0xfffff7faf144
   0x0000fffff7faf088:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faf08c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf090:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf094:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf098:	54000120	b.eq	0xfffff7faf0bc  // b.none
   0x0000fffff7faf09c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faf0a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf0a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf0a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf0ac:	54000321	b.ne	0xfffff7faf110  // b.any
   0x0000fffff7faf0b0:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faf0b4:	9e620120	scvtf	d0, x9
   0x0000fffff7faf0b8:	14000002	b	0xfffff7faf0c0
   0x0000fffff7faf0bc:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7faf0c0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf0c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf0c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf0cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf0d0:	54000120	b.eq	0xfffff7faf0f4  // b.none
   0x0000fffff7faf0d4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf0d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf0dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf0e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf0e4:	54000161	b.ne	0xfffff7faf110  // b.any
   0x0000fffff7faf0e8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faf0ec:	9e620121	scvtf	d1, x9
   0x0000fffff7faf0f0:	14000002	b	0xfffff7faf0f8
   0x0000fffff7faf0f4:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7faf0f8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faf0fc:	fd001660	str	d0, [x19, #40]
   0x0000fffff7faf100:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf104:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf108:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faf10c:	17ffffde	b	0xfffff7faf084
   0x0000fffff7faf110:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf114:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf118:	aa1303e1	mov	x1, x19
   0x0000fffff7faf11c:	aa1503e2	mov	x2, x21
   0x0000fffff7faf120:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7faf124:	aa1403e4	mov	x4, x20
   0x0000fffff7faf128:	aa1603e5	mov	x5, x22
   0x0000fffff7faf12c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faf130:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf134:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf138:	d63f0200	blr	x16
   0x0000fffff7faf13c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf140:	54006840	b.eq	0xfffff7fafe48  // b.none
   0x0000fffff7faf144:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7faf148:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7faf14c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7faf150:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7faf154:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7faf158:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7faf15c:	36d801d1	tbz	w17, #27, 0xfffff7faf194
   0x0000fffff7faf160:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf164:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf168:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf16c:	54000281	b.ne	0xfffff7faf1bc  // b.any
   0x0000fffff7faf170:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faf174:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf178:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf17c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf180:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf184:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf188:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf18c:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf190:	54000169	b.ls	0xfffff7faf1bc  // b.plast
   0x0000fffff7faf194:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf198:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf19c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf1a0:	36d80091	tbz	w17, #27, 0xfffff7faf1b0
   0x0000fffff7faf1a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf1a8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf1ac:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf1b0:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faf1b4:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faf1b8:	1400000e	b	0xfffff7faf1f0
   0x0000fffff7faf1bc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf1c0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf1c4:	aa1303e1	mov	x1, x19
   0x0000fffff7faf1c8:	aa1503e2	mov	x2, x21
   0x0000fffff7faf1cc:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7faf1d0:	aa1403e4	mov	x4, x20
   0x0000fffff7faf1d4:	aa1603e5	mov	x5, x22
   0x0000fffff7faf1d8:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7faf1dc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf1e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf1e4:	d63f0200	blr	x16
   0x0000fffff7faf1e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf1ec:	54006320	b.eq	0xfffff7fafe50  // b.none
   0x0000fffff7faf1f0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faf1f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf1f8:	aa1303e1	mov	x1, x19
   0x0000fffff7faf1fc:	aa1503e2	mov	x2, x21
   0x0000fffff7faf200:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7faf204:	aa1403e4	mov	x4, x20
   0x0000fffff7faf208:	aa1603e5	mov	x5, x22
   0x0000fffff7faf20c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7faf210:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faf214:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf218:	d63f0200	blr	x16
   0x0000fffff7faf21c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf220:	540061c0	b.eq	0xfffff7fafe58  // b.none
   0x0000fffff7faf224:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faf228:	f100017f	cmp	x11, #0x0
   0x0000fffff7faf22c:	540004a0	b.eq	0xfffff7faf2c0  // b.none
   0x0000fffff7faf230:	b940016d	ldr	w13, [x11]
   0x0000fffff7faf234:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faf238:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faf23c:	eb0901bf	cmp	x13, x9
   0x0000fffff7faf240:	54000400	b.eq	0xfffff7faf2c0  // b.none
   0x0000fffff7faf244:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faf248:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faf24c:	36d801d1	tbz	w17, #27, 0xfffff7faf284
   0x0000fffff7faf250:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf254:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf258:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf25c:	54000321	b.ne	0xfffff7faf2c0  // b.any
   0x0000fffff7faf260:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faf264:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf268:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf26c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf270:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf274:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf278:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf27c:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf280:	54000209	b.ls	0xfffff7faf2c0  // b.plast
   0x0000fffff7faf284:	36d8008d	tbz	w13, #27, 0xfffff7faf294
   0x0000fffff7faf288:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf28c:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf290:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf294:	36d80091	tbz	w17, #27, 0xfffff7faf2a4
   0x0000fffff7faf298:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf29c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf2a0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf2a4:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7faf2a8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faf2ac:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faf2b0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faf2b4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faf2b8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faf2bc:	1400000e	b	0xfffff7faf2f4
   0x0000fffff7faf2c0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faf2c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf2c8:	aa1303e1	mov	x1, x19
   0x0000fffff7faf2cc:	aa1503e2	mov	x2, x21
   0x0000fffff7faf2d0:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7faf2d4:	aa1403e4	mov	x4, x20
   0x0000fffff7faf2d8:	aa1603e5	mov	x5, x22
   0x0000fffff7faf2dc:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faf2e0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faf2e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf2e8:	d63f0200	blr	x16
   0x0000fffff7faf2ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf2f0:	54005b80	b.eq	0xfffff7fafe60  // b.none
   0x0000fffff7faf2f4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faf2f8:	37d806a9	tbnz	w9, #27, 0xfffff7faf3cc
   0x0000fffff7faf2fc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faf300:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf304:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf308:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf30c:	540001c1	b.ne	0xfffff7faf344  // b.any
   0x0000fffff7faf310:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf314:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf318:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf31c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf320:	54000121	b.ne	0xfffff7faf344  // b.any
   0x0000fffff7faf324:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faf328:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7faf32c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faf330:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf334:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf338:	f9001669	str	x9, [x19, #40]
   0x0000fffff7faf33c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faf340:	14000030	b	0xfffff7faf400
   0x0000fffff7faf344:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faf348:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf34c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf350:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf354:	54000120	b.eq	0xfffff7faf378  // b.none
   0x0000fffff7faf358:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faf35c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf360:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf364:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf368:	54000321	b.ne	0xfffff7faf3cc  // b.any
   0x0000fffff7faf36c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faf370:	9e620120	scvtf	d0, x9
   0x0000fffff7faf374:	14000002	b	0xfffff7faf37c
   0x0000fffff7faf378:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7faf37c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf380:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf384:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf388:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf38c:	54000120	b.eq	0xfffff7faf3b0  // b.none
   0x0000fffff7faf390:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf394:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf398:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf39c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf3a0:	54000161	b.ne	0xfffff7faf3cc  // b.any
   0x0000fffff7faf3a4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faf3a8:	9e620121	scvtf	d1, x9
   0x0000fffff7faf3ac:	14000002	b	0xfffff7faf3b4
   0x0000fffff7faf3b0:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7faf3b4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faf3b8:	fd001660	str	d0, [x19, #40]
   0x0000fffff7faf3bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf3c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf3c4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faf3c8:	17ffffde	b	0xfffff7faf340
   0x0000fffff7faf3cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf3d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf3d4:	aa1303e1	mov	x1, x19
   0x0000fffff7faf3d8:	aa1503e2	mov	x2, x21
   0x0000fffff7faf3dc:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7faf3e0:	aa1403e4	mov	x4, x20
   0x0000fffff7faf3e4:	aa1603e5	mov	x5, x22
   0x0000fffff7faf3e8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faf3ec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf3f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf3f4:	d63f0200	blr	x16
   0x0000fffff7faf3f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf3fc:	54005360	b.eq	0xfffff7fafe68  // b.none
   0x0000fffff7faf400:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7faf404:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7faf408:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7faf40c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7faf410:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7faf414:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7faf418:	36d801d1	tbz	w17, #27, 0xfffff7faf450
   0x0000fffff7faf41c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf420:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf424:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf428:	54000281	b.ne	0xfffff7faf478  // b.any
   0x0000fffff7faf42c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faf430:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf434:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf438:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf43c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf440:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf444:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf448:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf44c:	54000169	b.ls	0xfffff7faf478  // b.plast
   0x0000fffff7faf450:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf454:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf458:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf45c:	36d80091	tbz	w17, #27, 0xfffff7faf46c
   0x0000fffff7faf460:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf464:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf468:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf46c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faf470:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faf474:	1400000e	b	0xfffff7faf4ac
   0x0000fffff7faf478:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf47c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf480:	aa1303e1	mov	x1, x19
   0x0000fffff7faf484:	aa1503e2	mov	x2, x21
   0x0000fffff7faf488:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7faf48c:	aa1403e4	mov	x4, x20
   0x0000fffff7faf490:	aa1603e5	mov	x5, x22
   0x0000fffff7faf494:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7faf498:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf49c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf4a0:	d63f0200	blr	x16
   0x0000fffff7faf4a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf4a8:	54004e40	b.eq	0xfffff7fafe70  // b.none
   0x0000fffff7faf4ac:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faf4b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf4b4:	aa1303e1	mov	x1, x19
   0x0000fffff7faf4b8:	aa1503e2	mov	x2, x21
   0x0000fffff7faf4bc:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7faf4c0:	aa1403e4	mov	x4, x20
   0x0000fffff7faf4c4:	aa1603e5	mov	x5, x22
   0x0000fffff7faf4c8:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7faf4cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faf4d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf4d4:	d63f0200	blr	x16
   0x0000fffff7faf4d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf4dc:	54004ce0	b.eq	0xfffff7fafe78  // b.none
   0x0000fffff7faf4e0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faf4e4:	f100017f	cmp	x11, #0x0
   0x0000fffff7faf4e8:	540004a0	b.eq	0xfffff7faf57c  // b.none
   0x0000fffff7faf4ec:	b940016d	ldr	w13, [x11]
   0x0000fffff7faf4f0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faf4f4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faf4f8:	eb0901bf	cmp	x13, x9
   0x0000fffff7faf4fc:	54000400	b.eq	0xfffff7faf57c  // b.none
   0x0000fffff7faf500:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faf504:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faf508:	36d801d1	tbz	w17, #27, 0xfffff7faf540
   0x0000fffff7faf50c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf510:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf514:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf518:	54000321	b.ne	0xfffff7faf57c  // b.any
   0x0000fffff7faf51c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faf520:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf524:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf528:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf52c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf530:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf534:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf538:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf53c:	54000209	b.ls	0xfffff7faf57c  // b.plast
   0x0000fffff7faf540:	36d8008d	tbz	w13, #27, 0xfffff7faf550
   0x0000fffff7faf544:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf548:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf54c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf550:	36d80091	tbz	w17, #27, 0xfffff7faf560
   0x0000fffff7faf554:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf558:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf55c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf560:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7faf564:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faf568:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faf56c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faf570:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faf574:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faf578:	1400000e	b	0xfffff7faf5b0
   0x0000fffff7faf57c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faf580:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf584:	aa1303e1	mov	x1, x19
   0x0000fffff7faf588:	aa1503e2	mov	x2, x21
   0x0000fffff7faf58c:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7faf590:	aa1403e4	mov	x4, x20
   0x0000fffff7faf594:	aa1603e5	mov	x5, x22
   0x0000fffff7faf598:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faf59c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faf5a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf5a4:	d63f0200	blr	x16
   0x0000fffff7faf5a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf5ac:	540046a0	b.eq	0xfffff7fafe80  // b.none
   0x0000fffff7faf5b0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faf5b4:	37d806a9	tbnz	w9, #27, 0xfffff7faf688
   0x0000fffff7faf5b8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faf5bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf5c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf5c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf5c8:	540001c1	b.ne	0xfffff7faf600  // b.any
   0x0000fffff7faf5cc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf5d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf5d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf5d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf5dc:	54000121	b.ne	0xfffff7faf600  // b.any
   0x0000fffff7faf5e0:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faf5e4:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7faf5e8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faf5ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf5f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf5f4:	f9001669	str	x9, [x19, #40]
   0x0000fffff7faf5f8:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faf5fc:	14000030	b	0xfffff7faf6bc
   0x0000fffff7faf600:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faf604:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf608:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf60c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf610:	54000120	b.eq	0xfffff7faf634  // b.none
   0x0000fffff7faf614:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faf618:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf61c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf620:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf624:	54000321	b.ne	0xfffff7faf688  // b.any
   0x0000fffff7faf628:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faf62c:	9e620120	scvtf	d0, x9
   0x0000fffff7faf630:	14000002	b	0xfffff7faf638
   0x0000fffff7faf634:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7faf638:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf63c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf640:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf644:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf648:	54000120	b.eq	0xfffff7faf66c  // b.none
   0x0000fffff7faf64c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf650:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf654:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf658:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf65c:	54000161	b.ne	0xfffff7faf688  // b.any
   0x0000fffff7faf660:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faf664:	9e620121	scvtf	d1, x9
   0x0000fffff7faf668:	14000002	b	0xfffff7faf670
   0x0000fffff7faf66c:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7faf670:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faf674:	fd001660	str	d0, [x19, #40]
   0x0000fffff7faf678:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf67c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf680:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faf684:	17ffffde	b	0xfffff7faf5fc
   0x0000fffff7faf688:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf68c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf690:	aa1303e1	mov	x1, x19
   0x0000fffff7faf694:	aa1503e2	mov	x2, x21
   0x0000fffff7faf698:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7faf69c:	aa1403e4	mov	x4, x20
   0x0000fffff7faf6a0:	aa1603e5	mov	x5, x22
   0x0000fffff7faf6a4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faf6a8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf6ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf6b0:	d63f0200	blr	x16
   0x0000fffff7faf6b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf6b8:	54003e80	b.eq	0xfffff7fafe88  // b.none
   0x0000fffff7faf6bc:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7faf6c0:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7faf6c4:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7faf6c8:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7faf6cc:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7faf6d0:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7faf6d4:	36d801d1	tbz	w17, #27, 0xfffff7faf70c
   0x0000fffff7faf6d8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf6dc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf6e0:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf6e4:	54000281	b.ne	0xfffff7faf734  // b.any
   0x0000fffff7faf6e8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faf6ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf6f0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf6f4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf6f8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf6fc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf700:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf704:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf708:	54000169	b.ls	0xfffff7faf734  // b.plast
   0x0000fffff7faf70c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf710:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf714:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf718:	36d80091	tbz	w17, #27, 0xfffff7faf728
   0x0000fffff7faf71c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf720:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf724:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf728:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faf72c:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faf730:	1400000e	b	0xfffff7faf768
   0x0000fffff7faf734:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf738:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf73c:	aa1303e1	mov	x1, x19
   0x0000fffff7faf740:	aa1503e2	mov	x2, x21
   0x0000fffff7faf744:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7faf748:	aa1403e4	mov	x4, x20
   0x0000fffff7faf74c:	aa1603e5	mov	x5, x22
   0x0000fffff7faf750:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7faf754:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf758:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf75c:	d63f0200	blr	x16
   0x0000fffff7faf760:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf764:	54003960	b.eq	0xfffff7fafe90  // b.none
   0x0000fffff7faf768:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faf76c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf770:	aa1303e1	mov	x1, x19
   0x0000fffff7faf774:	aa1503e2	mov	x2, x21
   0x0000fffff7faf778:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7faf77c:	aa1403e4	mov	x4, x20
   0x0000fffff7faf780:	aa1603e5	mov	x5, x22
   0x0000fffff7faf784:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7faf788:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faf78c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf790:	d63f0200	blr	x16
   0x0000fffff7faf794:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf798:	54003800	b.eq	0xfffff7fafe98  // b.none
   0x0000fffff7faf79c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faf7a0:	f100017f	cmp	x11, #0x0
   0x0000fffff7faf7a4:	540004a0	b.eq	0xfffff7faf838  // b.none
   0x0000fffff7faf7a8:	b940016d	ldr	w13, [x11]
   0x0000fffff7faf7ac:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faf7b0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faf7b4:	eb0901bf	cmp	x13, x9
   0x0000fffff7faf7b8:	54000400	b.eq	0xfffff7faf838  // b.none
   0x0000fffff7faf7bc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faf7c0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faf7c4:	36d801d1	tbz	w17, #27, 0xfffff7faf7fc
   0x0000fffff7faf7c8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf7cc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf7d0:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf7d4:	54000321	b.ne	0xfffff7faf838  // b.any
   0x0000fffff7faf7d8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faf7dc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf7e0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf7e4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf7e8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf7ec:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf7f0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf7f4:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf7f8:	54000209	b.ls	0xfffff7faf838  // b.plast
   0x0000fffff7faf7fc:	36d8008d	tbz	w13, #27, 0xfffff7faf80c
   0x0000fffff7faf800:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf804:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf808:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf80c:	36d80091	tbz	w17, #27, 0xfffff7faf81c
   0x0000fffff7faf810:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf814:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf818:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf81c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7faf820:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faf824:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faf828:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faf82c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faf830:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faf834:	1400000e	b	0xfffff7faf86c
   0x0000fffff7faf838:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faf83c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf840:	aa1303e1	mov	x1, x19
   0x0000fffff7faf844:	aa1503e2	mov	x2, x21
   0x0000fffff7faf848:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7faf84c:	aa1403e4	mov	x4, x20
   0x0000fffff7faf850:	aa1603e5	mov	x5, x22
   0x0000fffff7faf854:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faf858:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faf85c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf860:	d63f0200	blr	x16
   0x0000fffff7faf864:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf868:	540031c0	b.eq	0xfffff7fafea0  // b.none
   0x0000fffff7faf86c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faf870:	37d806a9	tbnz	w9, #27, 0xfffff7faf944
   0x0000fffff7faf874:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faf878:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf87c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf880:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf884:	540001c1	b.ne	0xfffff7faf8bc  // b.any
   0x0000fffff7faf888:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf88c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf890:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf894:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf898:	54000121	b.ne	0xfffff7faf8bc  // b.any
   0x0000fffff7faf89c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faf8a0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7faf8a4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faf8a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf8ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf8b0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7faf8b4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faf8b8:	14000030	b	0xfffff7faf978
   0x0000fffff7faf8bc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faf8c0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf8c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf8c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf8cc:	54000120	b.eq	0xfffff7faf8f0  // b.none
   0x0000fffff7faf8d0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faf8d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf8d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf8dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf8e0:	54000321	b.ne	0xfffff7faf944  // b.any
   0x0000fffff7faf8e4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faf8e8:	9e620120	scvtf	d0, x9
   0x0000fffff7faf8ec:	14000002	b	0xfffff7faf8f4
   0x0000fffff7faf8f0:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7faf8f4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf8f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf8fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf900:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf904:	54000120	b.eq	0xfffff7faf928  // b.none
   0x0000fffff7faf908:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf90c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf910:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf914:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf918:	54000161	b.ne	0xfffff7faf944  // b.any
   0x0000fffff7faf91c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faf920:	9e620121	scvtf	d1, x9
   0x0000fffff7faf924:	14000002	b	0xfffff7faf92c
   0x0000fffff7faf928:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7faf92c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faf930:	fd001660	str	d0, [x19, #40]
   0x0000fffff7faf934:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf938:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf93c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faf940:	17ffffde	b	0xfffff7faf8b8
   0x0000fffff7faf944:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf948:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf94c:	aa1303e1	mov	x1, x19
   0x0000fffff7faf950:	aa1503e2	mov	x2, x21
   0x0000fffff7faf954:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7faf958:	aa1403e4	mov	x4, x20
   0x0000fffff7faf95c:	aa1603e5	mov	x5, x22
   0x0000fffff7faf960:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faf964:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf968:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf96c:	d63f0200	blr	x16
   0x0000fffff7faf970:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf974:	540029a0	b.eq	0xfffff7fafea8  // b.none
   0x0000fffff7faf978:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7faf97c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7faf980:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7faf984:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7faf988:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7faf98c:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7faf990:	36d801d1	tbz	w17, #27, 0xfffff7faf9c8
   0x0000fffff7faf994:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf998:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf99c:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf9a0:	54000281	b.ne	0xfffff7faf9f0  // b.any
   0x0000fffff7faf9a4:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faf9a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf9ac:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf9b0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf9b4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf9b8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf9bc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf9c0:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf9c4:	54000169	b.ls	0xfffff7faf9f0  // b.plast
   0x0000fffff7faf9c8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf9cc:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf9d0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf9d4:	36d80091	tbz	w17, #27, 0xfffff7faf9e4
   0x0000fffff7faf9d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf9dc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf9e0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf9e4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faf9e8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faf9ec:	1400000e	b	0xfffff7fafa24
   0x0000fffff7faf9f0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf9f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf9f8:	aa1303e1	mov	x1, x19
   0x0000fffff7faf9fc:	aa1503e2	mov	x2, x21
   0x0000fffff7fafa00:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fafa04:	aa1403e4	mov	x4, x20
   0x0000fffff7fafa08:	aa1603e5	mov	x5, x22
   0x0000fffff7fafa0c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fafa10:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fafa14:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fafa18:	d63f0200	blr	x16
   0x0000fffff7fafa1c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fafa20:	54002480	b.eq	0xfffff7fafeb0  // b.none
   0x0000fffff7fafa24:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fafa28:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fafa2c:	aa1303e1	mov	x1, x19
   0x0000fffff7fafa30:	aa1503e2	mov	x2, x21
   0x0000fffff7fafa34:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fafa38:	aa1403e4	mov	x4, x20
   0x0000fffff7fafa3c:	aa1603e5	mov	x5, x22
   0x0000fffff7fafa40:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fafa44:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fafa48:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fafa4c:	d63f0200	blr	x16
   0x0000fffff7fafa50:	f100001f	cmp	x0, #0x0
   0x0000fffff7fafa54:	54002320	b.eq	0xfffff7fafeb8  // b.none
   0x0000fffff7fafa58:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fafa5c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fafa60:	540004a0	b.eq	0xfffff7fafaf4  // b.none
   0x0000fffff7fafa64:	b940016d	ldr	w13, [x11]
   0x0000fffff7fafa68:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fafa6c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fafa70:	eb0901bf	cmp	x13, x9
   0x0000fffff7fafa74:	54000400	b.eq	0xfffff7fafaf4  // b.none
   0x0000fffff7fafa78:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fafa7c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fafa80:	36d801d1	tbz	w17, #27, 0xfffff7fafab8
   0x0000fffff7fafa84:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fafa88:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fafa8c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fafa90:	54000321	b.ne	0xfffff7fafaf4  // b.any
   0x0000fffff7fafa94:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fafa98:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fafa9c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fafaa0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fafaa4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fafaa8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fafaac:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fafab0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fafab4:	54000209	b.ls	0xfffff7fafaf4  // b.plast
   0x0000fffff7fafab8:	36d8008d	tbz	w13, #27, 0xfffff7fafac8
   0x0000fffff7fafabc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fafac0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fafac4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fafac8:	36d80091	tbz	w17, #27, 0xfffff7fafad8
   0x0000fffff7fafacc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fafad0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fafad4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fafad8:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fafadc:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fafae0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fafae4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fafae8:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fafaec:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fafaf0:	1400000e	b	0xfffff7fafb28
   0x0000fffff7fafaf4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fafaf8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fafafc:	aa1303e1	mov	x1, x19
   0x0000fffff7fafb00:	aa1503e2	mov	x2, x21
   0x0000fffff7fafb04:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fafb08:	aa1403e4	mov	x4, x20
   0x0000fffff7fafb0c:	aa1603e5	mov	x5, x22
   0x0000fffff7fafb10:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fafb14:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fafb18:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fafb1c:	d63f0200	blr	x16
   0x0000fffff7fafb20:	f100001f	cmp	x0, #0x0
   0x0000fffff7fafb24:	54001ce0	b.eq	0xfffff7fafec0  // b.none
   0x0000fffff7fafb28:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fafb2c:	37d806a9	tbnz	w9, #27, 0xfffff7fafc00
   0x0000fffff7fafb30:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fafb34:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafb38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafb3c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafb40:	540001c1	b.ne	0xfffff7fafb78  // b.any
   0x0000fffff7fafb44:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fafb48:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafb4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafb50:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafb54:	54000121	b.ne	0xfffff7fafb78  // b.any
   0x0000fffff7fafb58:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fafb5c:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fafb60:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fafb64:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafb68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafb6c:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fafb70:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fafb74:	14000030	b	0xfffff7fafc34
   0x0000fffff7fafb78:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fafb7c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fafb80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafb84:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafb88:	54000120	b.eq	0xfffff7fafbac  // b.none
   0x0000fffff7fafb8c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fafb90:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafb94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafb98:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafb9c:	54000321	b.ne	0xfffff7fafc00  // b.any
   0x0000fffff7fafba0:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fafba4:	9e620120	scvtf	d0, x9
   0x0000fffff7fafba8:	14000002	b	0xfffff7fafbb0
   0x0000fffff7fafbac:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fafbb0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fafbb4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fafbb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafbbc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafbc0:	54000120	b.eq	0xfffff7fafbe4  // b.none
   0x0000fffff7fafbc4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fafbc8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafbcc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafbd0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafbd4:	54000161	b.ne	0xfffff7fafc00  // b.any
   0x0000fffff7fafbd8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fafbdc:	9e620121	scvtf	d1, x9
   0x0000fffff7fafbe0:	14000002	b	0xfffff7fafbe8
   0x0000fffff7fafbe4:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fafbe8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fafbec:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fafbf0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fafbf4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafbf8:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fafbfc:	17ffffde	b	0xfffff7fafb74
   0x0000fffff7fafc00:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fafc04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fafc08:	aa1303e1	mov	x1, x19
   0x0000fffff7fafc0c:	aa1503e2	mov	x2, x21
   0x0000fffff7fafc10:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7fafc14:	aa1403e4	mov	x4, x20
   0x0000fffff7fafc18:	aa1603e5	mov	x5, x22
   0x0000fffff7fafc1c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fafc20:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fafc24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fafc28:	d63f0200	blr	x16
   0x0000fffff7fafc2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fafc30:	540014c0	b.eq	0xfffff7fafec8  // b.none
   0x0000fffff7fafc34:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fafc38:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fafc3c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fafc40:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fafc44:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fafc48:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fafc4c:	36d801d1	tbz	w17, #27, 0xfffff7fafc84
   0x0000fffff7fafc50:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fafc54:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fafc58:	f100013f	cmp	x9, #0x0
   0x0000fffff7fafc5c:	54000281	b.ne	0xfffff7fafcac  // b.any
   0x0000fffff7fafc60:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fafc64:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fafc68:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fafc6c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fafc70:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fafc74:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fafc78:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fafc7c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fafc80:	54000169	b.ls	0xfffff7fafcac  // b.plast
   0x0000fffff7fafc84:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fafc88:	91000529	add	x9, x9, #0x1
   0x0000fffff7fafc8c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fafc90:	36d80091	tbz	w17, #27, 0xfffff7fafca0
   0x0000fffff7fafc94:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fafc98:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fafc9c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fafca0:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fafca4:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fafca8:	1400000e	b	0xfffff7fafce0
   0x0000fffff7fafcac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fafcb0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fafcb4:	aa1303e1	mov	x1, x19
   0x0000fffff7fafcb8:	aa1503e2	mov	x2, x21
   0x0000fffff7fafcbc:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7fafcc0:	aa1403e4	mov	x4, x20
   0x0000fffff7fafcc4:	aa1603e5	mov	x5, x22
   0x0000fffff7fafcc8:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fafccc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fafcd0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fafcd4:	d63f0200	blr	x16
   0x0000fffff7fafcd8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fafcdc:	54000fa0	b.eq	0xfffff7fafed0  // b.none
   0x0000fffff7fafce0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fafce4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fafce8:	aa1303e1	mov	x1, x19
   0x0000fffff7fafcec:	aa1503e2	mov	x2, x21
   0x0000fffff7fafcf0:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7fafcf4:	aa1403e4	mov	x4, x20
   0x0000fffff7fafcf8:	aa1603e5	mov	x5, x22
   0x0000fffff7fafcfc:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fafd00:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fafd04:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fafd08:	d63f0200	blr	x16
   0x0000fffff7fafd0c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fafd10:	54000e40	b.eq	0xfffff7fafed8  // b.none
   0x0000fffff7fafd14:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fafd18:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fafd1c:	aa1303e1	mov	x1, x19
   0x0000fffff7fafd20:	aa1503e2	mov	x2, x21
   0x0000fffff7fafd24:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7fafd28:	aa1403e4	mov	x4, x20
   0x0000fffff7fafd2c:	aa1603e5	mov	x5, x22
   0x0000fffff7fafd30:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7fafd34:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fafd38:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fafd3c:	d63f0200	blr	x16
   0x0000fffff7fafd40:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fafd44:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fafd48:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fafd4c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fafd50:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fafd54:	d65f03c0	ret
   0x0000fffff7fafd58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafd5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafd60:	b900028a	str	w10, [x20]
   0x0000fffff7fafd64:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fafd68:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fafd6c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fafd70:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fafd74:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fafd78:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fafd7c:	d65f03c0	ret
   0x0000fffff7fafd80:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fafd84:	17fffff5	b	0xfffff7fafd58
   0x0000fffff7fafd88:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fafd8c:	17fffff3	b	0xfffff7fafd58
   0x0000fffff7fafd90:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fafd94:	17fffff1	b	0xfffff7fafd58
   0x0000fffff7fafd98:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7fafd9c:	17ffffef	b	0xfffff7fafd58
   0x0000fffff7fafda0:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7fafda4:	17ffffed	b	0xfffff7fafd58
   0x0000fffff7fafda8:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fafdac:	17ffffeb	b	0xfffff7fafd58
   0x0000fffff7fafdb0:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fafdb4:	17ffffe9	b	0xfffff7fafd58
   0x0000fffff7fafdb8:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fafdbc:	17ffffe7	b	0xfffff7fafd58
   0x0000fffff7fafdc0:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fafdc4:	17ffffe5	b	0xfffff7fafd58
   0x0000fffff7fafdc8:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fafdcc:	17ffffe3	b	0xfffff7fafd58
   0x0000fffff7fafdd0:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fafdd4:	17ffffe1	b	0xfffff7fafd58
   0x0000fffff7fafdd8:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fafddc:	17ffffdf	b	0xfffff7fafd58
   0x0000fffff7fafde0:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fafde4:	17ffffdd	b	0xfffff7fafd58
   0x0000fffff7fafde8:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fafdec:	17ffffdb	b	0xfffff7fafd58
   0x0000fffff7fafdf0:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fafdf4:	17ffffd9	b	0xfffff7fafd58
   0x0000fffff7fafdf8:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fafdfc:	17ffffd7	b	0xfffff7fafd58
   0x0000fffff7fafe00:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fafe04:	17ffffd5	b	0xfffff7fafd58
   0x0000fffff7fafe08:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fafe0c:	17ffffd3	b	0xfffff7fafd58
   0x0000fffff7fafe10:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fafe14:	17ffffd1	b	0xfffff7fafd58
   0x0000fffff7fafe18:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fafe1c:	17ffffcf	b	0xfffff7fafd58
   0x0000fffff7fafe20:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fafe24:	17ffffcd	b	0xfffff7fafd58
   0x0000fffff7fafe28:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fafe2c:	17ffffcb	b	0xfffff7fafd58
   0x0000fffff7fafe30:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fafe34:	17ffffc9	b	0xfffff7fafd58
   0x0000fffff7fafe38:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fafe3c:	17ffffc7	b	0xfffff7fafd58
   0x0000fffff7fafe40:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fafe44:	17ffffc5	b	0xfffff7fafd58
   0x0000fffff7fafe48:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fafe4c:	17ffffc3	b	0xfffff7fafd58
   0x0000fffff7fafe50:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fafe54:	17ffffc1	b	0xfffff7fafd58
   0x0000fffff7fafe58:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fafe5c:	17ffffbf	b	0xfffff7fafd58
   0x0000fffff7fafe60:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fafe64:	17ffffbd	b	0xfffff7fafd58
   0x0000fffff7fafe68:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fafe6c:	17ffffbb	b	0xfffff7fafd58
   0x0000fffff7fafe70:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fafe74:	17ffffb9	b	0xfffff7fafd58
   0x0000fffff7fafe78:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fafe7c:	17ffffb7	b	0xfffff7fafd58
   0x0000fffff7fafe80:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fafe84:	17ffffb5	b	0xfffff7fafd58
   0x0000fffff7fafe88:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fafe8c:	17ffffb3	b	0xfffff7fafd58
   0x0000fffff7fafe90:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fafe94:	17ffffb1	b	0xfffff7fafd58
   0x0000fffff7fafe98:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fafe9c:	17ffffaf	b	0xfffff7fafd58
   0x0000fffff7fafea0:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fafea4:	17ffffad	b	0xfffff7fafd58
   0x0000fffff7fafea8:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fafeac:	17ffffab	b	0xfffff7fafd58
   0x0000fffff7fafeb0:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fafeb4:	17ffffa9	b	0xfffff7fafd58
   0x0000fffff7fafeb8:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7fafebc:	17ffffa7	b	0xfffff7fafd58
   0x0000fffff7fafec0:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fafec4:	17ffffa5	b	0xfffff7fafd58
   0x0000fffff7fafec8:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7fafecc:	17ffffa3	b	0xfffff7fafd58
   0x0000fffff7fafed0:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7fafed4:	17ffffa1	b	0xfffff7fafd58
   0x0000fffff7fafed8:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7fafedc:	17ffff9f	b	0xfffff7fafd58
   0x0000fffff7fafee0:	00000000	udf	#0
   0x0000fffff7fafee4:	00000000	udf	#0
   0x0000fffff7fafee8:	00000000	udf	#0
   0x0000fffff7fafeec:	00000000	udf	#0
   0x0000fffff7fafef0:	00000000	udf	#0
   0x0000fffff7fafef4:	00000000	udf	#0
   0x0000fffff7fafef8:	00000000	udf	#0
   0x0000fffff7fafefc:	00000000	udf	#0
   0x0000fffff7faff00:	00000000	udf	#0
   0x0000fffff7faff04:	00000000	udf	#0
   0x0000fffff7faff08:	00000000	udf	#0
   0x0000fffff7faff0c:	00000000	udf	#0
   0x0000fffff7faff10:	00000000	udf	#0
   0x0000fffff7faff14:	00000000	udf	#0
   0x0000fffff7faff18:	00000000	udf	#0
   0x0000fffff7faff1c:	00000000	udf	#0
   0x0000fffff7faff20:	00000000	udf	#0
   0x0000fffff7faff24:	00000000	udf	#0
   0x0000fffff7faff28:	00000000	udf	#0
   0x0000fffff7faff2c:	00000000	udf	#0
   0x0000fffff7faff30:	00000000	udf	#0
   0x0000fffff7faff34:	00000000	udf	#0
   0x0000fffff7faff38:	00000000	udf	#0
   0x0000fffff7faff3c:	00000000	udf	#0
   0x0000fffff7faff40:	00000000	udf	#0
   0x0000fffff7faff44:	00000000	udf	#0
   0x0000fffff7faff48:	00000000	udf	#0
   0x0000fffff7faff4c:	00000000	udf	#0
   0x0000fffff7faff50:	00000000	udf	#0
   0x0000fffff7faff54:	00000000	udf	#0
   0x0000fffff7faff58:	00000000	udf	#0
   0x0000fffff7faff5c:	00000000	udf	#0
   0x0000fffff7faff60:	00000000	udf	#0
   0x0000fffff7faff64:	00000000	udf	#0
   0x0000fffff7faff68:	00000000	udf	#0
   0x0000fffff7faff6c:	00000000	udf	#0
   0x0000fffff7faff70:	00000000	udf	#0
   0x0000fffff7faff74:	00000000	udf	#0
   0x0000fffff7faff78:	00000000	udf	#0
   0x0000fffff7faff7c:	00000000	udf	#0
   0x0000fffff7faff80:	00000000	udf	#0
   0x0000fffff7faff84:	00000000	udf	#0
   0x0000fffff7faff88:	00000000	udf	#0
   0x0000fffff7faff8c:	00000000	udf	#0
   0x0000fffff7faff90:	00000000	udf	#0
   0x0000fffff7faff94:	00000000	udf	#0
   0x0000fffff7faff98:	00000000	udf	#0
   0x0000fffff7faff9c:	00000000	udf	#0
   0x0000fffff7faffa0:	00000000	udf	#0
   0x0000fffff7faffa4:	00000000	udf	#0
   0x0000fffff7faffa8:	00000000	udf	#0
   0x0000fffff7faffac:	00000000	udf	#0
   0x0000fffff7faffb0:	00000000	udf	#0
   0x0000fffff7faffb4:	00000000	udf	#0
   0x0000fffff7faffb8:	00000000	udf	#0
   0x0000fffff7faffbc:	00000000	udf	#0
   0x0000fffff7faffc0:	00000000	udf	#0
   0x0000fffff7faffc4:	00000000	udf	#0
   0x0000fffff7faffc8:	00000000	udf	#0
   0x0000fffff7faffcc:	00000000	udf	#0
   0x0000fffff7faffd0:	00000000	udf	#0
   0x0000fffff7faffd4:	00000000	udf	#0
   0x0000fffff7faffd8:	00000000	udf	#0
   0x0000fffff7faffdc:	00000000	udf	#0
   0x0000fffff7faffe0:	00000000	udf	#0
   0x0000fffff7faffe4:	00000000	udf	#0
   0x0000fffff7faffe8:	00000000	udf	#0
   0x0000fffff7faffec:	00000000	udf	#0
   0x0000fffff7fafff0:	00000000	udf	#0
   0x0000fffff7fafff4:	00000000	udf	#0
   0x0000fffff7fafff8:	00000000	udf	#0
   0x0000fffff7fafffc:	00000000	udf	#0
End of assembler dump.
