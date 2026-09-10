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
   0x0000fffff7fae0ec:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7fae0f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae0f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae0f8:	d63f0200	blr	x16
   0x0000fffff7fae0fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae100:	5400d840	b.eq	0xfffff7fafc08  // b.none
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
   0x0000fffff7fae17c:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7fae180:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fae184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae188:	d63f0200	blr	x16
   0x0000fffff7fae18c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae190:	5400d400	b.eq	0xfffff7fafc10  // b.none
   0x0000fffff7fae194:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fae198:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae19c:	aa1303e1	mov	x1, x19
   0x0000fffff7fae1a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fae1a4:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fae1a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fae1ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fae1b0:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7fae1b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae1b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae1bc:	d63f0200	blr	x16
   0x0000fffff7fae1c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae1c4:	5400d2a0	b.eq	0xfffff7fafc18  // b.none
   0x0000fffff7fae1c8:	14000001	b	0xfffff7fae1cc
   0x0000fffff7fae1cc:	14000001	b	0xfffff7fae1d0
   0x0000fffff7fae1d0:	14000001	b	0xfffff7fae1d4
   0x0000fffff7fae1d4:	14000001	b	0xfffff7fae1d8
   0x0000fffff7fae1d8:	14000001	b	0xfffff7fae1dc
   0x0000fffff7fae1dc:	14000001	b	0xfffff7fae1e0
   0x0000fffff7fae1e0:	14000001	b	0xfffff7fae1e4
   0x0000fffff7fae1e4:	14000001	b	0xfffff7fae1e8
   0x0000fffff7fae1e8:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fae1ec:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fae1f0:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fae1f4:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fae1f8:	36d80211	tbz	w17, #27, 0xfffff7fae238
   0x0000fffff7fae1fc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae200:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae204:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae208:	540001e1	b.ne	0xfffff7fae244  // b.any
   0x0000fffff7fae20c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fae210:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae214:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae218:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae21c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae220:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae224:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae228:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae22c:	540000c9	b.ls	0xfffff7fae244  // b.plast
   0x0000fffff7fae230:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae234:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae238:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fae23c:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fae240:	1400000e	b	0xfffff7fae278
   0x0000fffff7fae244:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae248:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae24c:	aa1303e1	mov	x1, x19
   0x0000fffff7fae250:	aa1503e2	mov	x2, x21
   0x0000fffff7fae254:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fae258:	aa1403e4	mov	x4, x20
   0x0000fffff7fae25c:	aa1603e5	mov	x5, x22
   0x0000fffff7fae260:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7fae264:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fae268:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae26c:	d63f0200	blr	x16
   0x0000fffff7fae270:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae274:	5400cd60	b.eq	0xfffff7fafc20  // b.none
   0x0000fffff7fae278:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fae27c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae280:	aa1303e1	mov	x1, x19
   0x0000fffff7fae284:	aa1503e2	mov	x2, x21
   0x0000fffff7fae288:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fae28c:	aa1403e4	mov	x4, x20
   0x0000fffff7fae290:	aa1603e5	mov	x5, x22
   0x0000fffff7fae294:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fae298:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fae29c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae2a0:	d63f0200	blr	x16
   0x0000fffff7fae2a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae2a8:	5400cc00	b.eq	0xfffff7fafc28  // b.none
   0x0000fffff7fae2ac:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae2b0:	37d806a9	tbnz	w9, #27, 0xfffff7fae384
   0x0000fffff7fae2b4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae2b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae2bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae2c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae2c4:	540001c1	b.ne	0xfffff7fae2fc  // b.any
   0x0000fffff7fae2c8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fae2cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae2d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae2d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae2d8:	54000121	b.ne	0xfffff7fae2fc  // b.any
   0x0000fffff7fae2dc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fae2e0:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fae2e4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fae2e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae2ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae2f0:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fae2f4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fae2f8:	14000030	b	0xfffff7fae3b8
   0x0000fffff7fae2fc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae300:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae304:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae308:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae30c:	54000120	b.eq	0xfffff7fae330  // b.none
   0x0000fffff7fae310:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae314:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae318:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae31c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae320:	54000321	b.ne	0xfffff7fae384  // b.any
   0x0000fffff7fae324:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fae328:	9e620120	scvtf	d0, x9
   0x0000fffff7fae32c:	14000002	b	0xfffff7fae334
   0x0000fffff7fae330:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fae334:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fae338:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae33c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae340:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae344:	54000120	b.eq	0xfffff7fae368  // b.none
   0x0000fffff7fae348:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fae34c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae350:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae354:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae358:	54000161	b.ne	0xfffff7fae384  // b.any
   0x0000fffff7fae35c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fae360:	9e620121	scvtf	d1, x9
   0x0000fffff7fae364:	14000002	b	0xfffff7fae36c
   0x0000fffff7fae368:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fae36c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fae370:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fae374:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae378:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae37c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fae380:	17ffffde	b	0xfffff7fae2f8
   0x0000fffff7fae384:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae388:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae38c:	aa1303e1	mov	x1, x19
   0x0000fffff7fae390:	aa1503e2	mov	x2, x21
   0x0000fffff7fae394:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fae398:	aa1403e4	mov	x4, x20
   0x0000fffff7fae39c:	aa1603e5	mov	x5, x22
   0x0000fffff7fae3a0:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7fae3a4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae3a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae3ac:	d63f0200	blr	x16
   0x0000fffff7fae3b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae3b4:	5400c3e0	b.eq	0xfffff7fafc30  // b.none
   0x0000fffff7fae3b8:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fae3bc:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fae3c0:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fae3c4:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fae3c8:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fae3cc:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fae3d0:	36d801d1	tbz	w17, #27, 0xfffff7fae408
   0x0000fffff7fae3d4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae3d8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae3dc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae3e0:	54000281	b.ne	0xfffff7fae430  // b.any
   0x0000fffff7fae3e4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fae3e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae3ec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae3f0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae3f4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae3f8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae3fc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae400:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae404:	54000169	b.ls	0xfffff7fae430  // b.plast
   0x0000fffff7fae408:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fae40c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fae410:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fae414:	36d80091	tbz	w17, #27, 0xfffff7fae424
   0x0000fffff7fae418:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae41c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae420:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae424:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fae428:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fae42c:	1400000e	b	0xfffff7fae464
   0x0000fffff7fae430:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae434:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae438:	aa1303e1	mov	x1, x19
   0x0000fffff7fae43c:	aa1503e2	mov	x2, x21
   0x0000fffff7fae440:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fae444:	aa1403e4	mov	x4, x20
   0x0000fffff7fae448:	aa1603e5	mov	x5, x22
   0x0000fffff7fae44c:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7fae450:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae454:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae458:	d63f0200	blr	x16
   0x0000fffff7fae45c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae460:	5400bec0	b.eq	0xfffff7fafc38  // b.none
   0x0000fffff7fae464:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fae468:	f100017f	cmp	x11, #0x0
   0x0000fffff7fae46c:	540003a0	b.eq	0xfffff7fae4e0  // b.none
   0x0000fffff7fae470:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fae474:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fae478:	b9400171	ldr	w17, [x11]
   0x0000fffff7fae47c:	36d801d1	tbz	w17, #27, 0xfffff7fae4b4
   0x0000fffff7fae480:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae484:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae488:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae48c:	540002a1	b.ne	0xfffff7fae4e0  // b.any
   0x0000fffff7fae490:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fae494:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae498:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae49c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae4a0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae4a4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae4a8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae4ac:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae4b0:	54000189	b.ls	0xfffff7fae4e0  // b.plast
   0x0000fffff7fae4b4:	36d8008d	tbz	w13, #27, 0xfffff7fae4c4
   0x0000fffff7fae4b8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fae4bc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fae4c0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fae4c4:	36d80091	tbz	w17, #27, 0xfffff7fae4d4
   0x0000fffff7fae4c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae4cc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae4d0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae4d4:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fae4d8:	b900016d	str	w13, [x11]
   0x0000fffff7fae4dc:	1400000e	b	0xfffff7fae514
   0x0000fffff7fae4e0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fae4e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae4e8:	aa1303e1	mov	x1, x19
   0x0000fffff7fae4ec:	aa1503e2	mov	x2, x21
   0x0000fffff7fae4f0:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fae4f4:	aa1403e4	mov	x4, x20
   0x0000fffff7fae4f8:	aa1603e5	mov	x5, x22
   0x0000fffff7fae4fc:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7fae500:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae504:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae508:	d63f0200	blr	x16
   0x0000fffff7fae50c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae510:	5400b980	b.eq	0xfffff7fafc40  // b.none
   0x0000fffff7fae514:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fae518:	f100017f	cmp	x11, #0x0
   0x0000fffff7fae51c:	540004a0	b.eq	0xfffff7fae5b0  // b.none
   0x0000fffff7fae520:	b940016d	ldr	w13, [x11]
   0x0000fffff7fae524:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fae528:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fae52c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fae530:	54000400	b.eq	0xfffff7fae5b0  // b.none
   0x0000fffff7fae534:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fae538:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fae53c:	36d801d1	tbz	w17, #27, 0xfffff7fae574
   0x0000fffff7fae540:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae544:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae548:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae54c:	54000321	b.ne	0xfffff7fae5b0  // b.any
   0x0000fffff7fae550:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fae554:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae558:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae55c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae560:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae564:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae568:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae56c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae570:	54000209	b.ls	0xfffff7fae5b0  // b.plast
   0x0000fffff7fae574:	36d8008d	tbz	w13, #27, 0xfffff7fae584
   0x0000fffff7fae578:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fae57c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fae580:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fae584:	36d80091	tbz	w17, #27, 0xfffff7fae594
   0x0000fffff7fae588:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae58c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae590:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae594:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fae598:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fae59c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fae5a0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fae5a4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fae5a8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fae5ac:	1400000e	b	0xfffff7fae5e4
   0x0000fffff7fae5b0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fae5b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae5b8:	aa1303e1	mov	x1, x19
   0x0000fffff7fae5bc:	aa1503e2	mov	x2, x21
   0x0000fffff7fae5c0:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fae5c4:	aa1403e4	mov	x4, x20
   0x0000fffff7fae5c8:	aa1603e5	mov	x5, x22
   0x0000fffff7fae5cc:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fae5d0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fae5d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae5d8:	d63f0200	blr	x16
   0x0000fffff7fae5dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae5e0:	5400b340	b.eq	0xfffff7fafc48  // b.none
   0x0000fffff7fae5e4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae5e8:	37d806a9	tbnz	w9, #27, 0xfffff7fae6bc
   0x0000fffff7fae5ec:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae5f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae5f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae5f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae5fc:	540001c1	b.ne	0xfffff7fae634  // b.any
   0x0000fffff7fae600:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fae604:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae608:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae60c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae610:	54000121	b.ne	0xfffff7fae634  // b.any
   0x0000fffff7fae614:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fae618:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fae61c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fae620:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae624:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae628:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fae62c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fae630:	14000030	b	0xfffff7fae6f0
   0x0000fffff7fae634:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae638:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae63c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae640:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae644:	54000120	b.eq	0xfffff7fae668  // b.none
   0x0000fffff7fae648:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae64c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae650:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae654:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae658:	54000321	b.ne	0xfffff7fae6bc  // b.any
   0x0000fffff7fae65c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fae660:	9e620120	scvtf	d0, x9
   0x0000fffff7fae664:	14000002	b	0xfffff7fae66c
   0x0000fffff7fae668:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fae66c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fae670:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae674:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae678:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae67c:	54000120	b.eq	0xfffff7fae6a0  // b.none
   0x0000fffff7fae680:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fae684:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae688:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae68c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae690:	54000161	b.ne	0xfffff7fae6bc  // b.any
   0x0000fffff7fae694:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fae698:	9e620121	scvtf	d1, x9
   0x0000fffff7fae69c:	14000002	b	0xfffff7fae6a4
   0x0000fffff7fae6a0:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fae6a4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fae6a8:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fae6ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae6b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae6b4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fae6b8:	17ffffde	b	0xfffff7fae630
   0x0000fffff7fae6bc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae6c0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae6c4:	aa1303e1	mov	x1, x19
   0x0000fffff7fae6c8:	aa1503e2	mov	x2, x21
   0x0000fffff7fae6cc:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fae6d0:	aa1403e4	mov	x4, x20
   0x0000fffff7fae6d4:	aa1603e5	mov	x5, x22
   0x0000fffff7fae6d8:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7fae6dc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae6e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae6e4:	d63f0200	blr	x16
   0x0000fffff7fae6e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae6ec:	5400ab20	b.eq	0xfffff7fafc50  // b.none
   0x0000fffff7fae6f0:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fae6f4:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fae6f8:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fae6fc:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fae700:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fae704:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fae708:	36d801d1	tbz	w17, #27, 0xfffff7fae740
   0x0000fffff7fae70c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae710:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae714:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae718:	54000281	b.ne	0xfffff7fae768  // b.any
   0x0000fffff7fae71c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fae720:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae724:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae728:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae72c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae730:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae734:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae738:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae73c:	54000169	b.ls	0xfffff7fae768  // b.plast
   0x0000fffff7fae740:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fae744:	91000529	add	x9, x9, #0x1
   0x0000fffff7fae748:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fae74c:	36d80091	tbz	w17, #27, 0xfffff7fae75c
   0x0000fffff7fae750:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae754:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae758:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae75c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fae760:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fae764:	1400000e	b	0xfffff7fae79c
   0x0000fffff7fae768:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae76c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae770:	aa1303e1	mov	x1, x19
   0x0000fffff7fae774:	aa1503e2	mov	x2, x21
   0x0000fffff7fae778:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fae77c:	aa1403e4	mov	x4, x20
   0x0000fffff7fae780:	aa1603e5	mov	x5, x22
   0x0000fffff7fae784:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7fae788:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae78c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae790:	d63f0200	blr	x16
   0x0000fffff7fae794:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae798:	5400a600	b.eq	0xfffff7fafc58  // b.none
   0x0000fffff7fae79c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fae7a0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fae7a4:	540003a0	b.eq	0xfffff7fae818  // b.none
   0x0000fffff7fae7a8:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fae7ac:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fae7b0:	b9400171	ldr	w17, [x11]
   0x0000fffff7fae7b4:	36d801d1	tbz	w17, #27, 0xfffff7fae7ec
   0x0000fffff7fae7b8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae7bc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae7c0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae7c4:	540002a1	b.ne	0xfffff7fae818  // b.any
   0x0000fffff7fae7c8:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fae7cc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae7d0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae7d4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae7d8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae7dc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae7e0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae7e4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae7e8:	54000189	b.ls	0xfffff7fae818  // b.plast
   0x0000fffff7fae7ec:	36d8008d	tbz	w13, #27, 0xfffff7fae7fc
   0x0000fffff7fae7f0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fae7f4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fae7f8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fae7fc:	36d80091	tbz	w17, #27, 0xfffff7fae80c
   0x0000fffff7fae800:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae804:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae808:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae80c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fae810:	b900016d	str	w13, [x11]
   0x0000fffff7fae814:	1400000e	b	0xfffff7fae84c
   0x0000fffff7fae818:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fae81c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae820:	aa1303e1	mov	x1, x19
   0x0000fffff7fae824:	aa1503e2	mov	x2, x21
   0x0000fffff7fae828:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fae82c:	aa1403e4	mov	x4, x20
   0x0000fffff7fae830:	aa1603e5	mov	x5, x22
   0x0000fffff7fae834:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7fae838:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae83c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae840:	d63f0200	blr	x16
   0x0000fffff7fae844:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae848:	5400a0c0	b.eq	0xfffff7fafc60  // b.none
   0x0000fffff7fae84c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fae850:	f100017f	cmp	x11, #0x0
   0x0000fffff7fae854:	540004a0	b.eq	0xfffff7fae8e8  // b.none
   0x0000fffff7fae858:	b940016d	ldr	w13, [x11]
   0x0000fffff7fae85c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fae860:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fae864:	eb0901bf	cmp	x13, x9
   0x0000fffff7fae868:	54000400	b.eq	0xfffff7fae8e8  // b.none
   0x0000fffff7fae86c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fae870:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fae874:	36d801d1	tbz	w17, #27, 0xfffff7fae8ac
   0x0000fffff7fae878:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae87c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae880:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae884:	54000321	b.ne	0xfffff7fae8e8  // b.any
   0x0000fffff7fae888:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fae88c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae890:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae894:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae898:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae89c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae8a0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae8a4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae8a8:	54000209	b.ls	0xfffff7fae8e8  // b.plast
   0x0000fffff7fae8ac:	36d8008d	tbz	w13, #27, 0xfffff7fae8bc
   0x0000fffff7fae8b0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fae8b4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fae8b8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fae8bc:	36d80091	tbz	w17, #27, 0xfffff7fae8cc
   0x0000fffff7fae8c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae8c4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae8c8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae8cc:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fae8d0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fae8d4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fae8d8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fae8dc:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fae8e0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fae8e4:	1400000e	b	0xfffff7fae91c
   0x0000fffff7fae8e8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fae8ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae8f0:	aa1303e1	mov	x1, x19
   0x0000fffff7fae8f4:	aa1503e2	mov	x2, x21
   0x0000fffff7fae8f8:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fae8fc:	aa1403e4	mov	x4, x20
   0x0000fffff7fae900:	aa1603e5	mov	x5, x22
   0x0000fffff7fae904:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fae908:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fae90c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae910:	d63f0200	blr	x16
   0x0000fffff7fae914:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae918:	54009a80	b.eq	0xfffff7fafc68  // b.none
   0x0000fffff7fae91c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae920:	37d806a9	tbnz	w9, #27, 0xfffff7fae9f4
   0x0000fffff7fae924:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae928:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae92c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae930:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae934:	540001c1	b.ne	0xfffff7fae96c  // b.any
   0x0000fffff7fae938:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fae93c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae940:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae944:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae948:	54000121	b.ne	0xfffff7fae96c  // b.any
   0x0000fffff7fae94c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fae950:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fae954:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fae958:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae95c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae960:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fae964:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fae968:	14000030	b	0xfffff7faea28
   0x0000fffff7fae96c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae970:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae974:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae978:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae97c:	54000120	b.eq	0xfffff7fae9a0  // b.none
   0x0000fffff7fae980:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fae984:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae988:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae98c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae990:	54000321	b.ne	0xfffff7fae9f4  // b.any
   0x0000fffff7fae994:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fae998:	9e620120	scvtf	d0, x9
   0x0000fffff7fae99c:	14000002	b	0xfffff7fae9a4
   0x0000fffff7fae9a0:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fae9a4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fae9a8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae9ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae9b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae9b4:	54000120	b.eq	0xfffff7fae9d8  // b.none
   0x0000fffff7fae9b8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fae9bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae9c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae9c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae9c8:	54000161	b.ne	0xfffff7fae9f4  // b.any
   0x0000fffff7fae9cc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fae9d0:	9e620121	scvtf	d1, x9
   0x0000fffff7fae9d4:	14000002	b	0xfffff7fae9dc
   0x0000fffff7fae9d8:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fae9dc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fae9e0:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fae9e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae9e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae9ec:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fae9f0:	17ffffde	b	0xfffff7fae968
   0x0000fffff7fae9f4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae9f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae9fc:	aa1303e1	mov	x1, x19
   0x0000fffff7faea00:	aa1503e2	mov	x2, x21
   0x0000fffff7faea04:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7faea08:	aa1403e4	mov	x4, x20
   0x0000fffff7faea0c:	aa1603e5	mov	x5, x22
   0x0000fffff7faea10:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7faea14:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faea18:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faea1c:	d63f0200	blr	x16
   0x0000fffff7faea20:	f100001f	cmp	x0, #0x0
   0x0000fffff7faea24:	54009260	b.eq	0xfffff7fafc70  // b.none
   0x0000fffff7faea28:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7faea2c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7faea30:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7faea34:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7faea38:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7faea3c:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7faea40:	36d801d1	tbz	w17, #27, 0xfffff7faea78
   0x0000fffff7faea44:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faea48:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faea4c:	f100013f	cmp	x9, #0x0
   0x0000fffff7faea50:	54000281	b.ne	0xfffff7faeaa0  // b.any
   0x0000fffff7faea54:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7faea58:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faea5c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faea60:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faea64:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faea68:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faea6c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faea70:	f100055f	cmp	x10, #0x1
   0x0000fffff7faea74:	54000169	b.ls	0xfffff7faeaa0  // b.plast
   0x0000fffff7faea78:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faea7c:	91000529	add	x9, x9, #0x1
   0x0000fffff7faea80:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faea84:	36d80091	tbz	w17, #27, 0xfffff7faea94
   0x0000fffff7faea88:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faea8c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faea90:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faea94:	f900266c	str	x12, [x19, #72]
   0x0000fffff7faea98:	b900426d	str	w13, [x19, #64]
   0x0000fffff7faea9c:	1400000e	b	0xfffff7faead4
   0x0000fffff7faeaa0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faeaa4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faeaa8:	aa1303e1	mov	x1, x19
   0x0000fffff7faeaac:	aa1503e2	mov	x2, x21
   0x0000fffff7faeab0:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7faeab4:	aa1403e4	mov	x4, x20
   0x0000fffff7faeab8:	aa1603e5	mov	x5, x22
   0x0000fffff7faeabc:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7faeac0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faeac4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faeac8:	d63f0200	blr	x16
   0x0000fffff7faeacc:	f100001f	cmp	x0, #0x0
   0x0000fffff7faead0:	54008d40	b.eq	0xfffff7fafc78  // b.none
   0x0000fffff7faead4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7faead8:	f100017f	cmp	x11, #0x0
   0x0000fffff7faeadc:	540003a0	b.eq	0xfffff7faeb50  // b.none
   0x0000fffff7faeae0:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7faeae4:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7faeae8:	b9400171	ldr	w17, [x11]
   0x0000fffff7faeaec:	36d801d1	tbz	w17, #27, 0xfffff7faeb24
   0x0000fffff7faeaf0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faeaf4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faeaf8:	f100013f	cmp	x9, #0x0
   0x0000fffff7faeafc:	540002a1	b.ne	0xfffff7faeb50  // b.any
   0x0000fffff7faeb00:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7faeb04:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faeb08:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faeb0c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faeb10:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faeb14:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faeb18:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faeb1c:	f100055f	cmp	x10, #0x1
   0x0000fffff7faeb20:	54000189	b.ls	0xfffff7faeb50  // b.plast
   0x0000fffff7faeb24:	36d8008d	tbz	w13, #27, 0xfffff7faeb34
   0x0000fffff7faeb28:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faeb2c:	91000529	add	x9, x9, #0x1
   0x0000fffff7faeb30:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faeb34:	36d80091	tbz	w17, #27, 0xfffff7faeb44
   0x0000fffff7faeb38:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faeb3c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faeb40:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faeb44:	f900056c	str	x12, [x11, #8]
   0x0000fffff7faeb48:	b900016d	str	w13, [x11]
   0x0000fffff7faeb4c:	1400000e	b	0xfffff7faeb84
   0x0000fffff7faeb50:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faeb54:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faeb58:	aa1303e1	mov	x1, x19
   0x0000fffff7faeb5c:	aa1503e2	mov	x2, x21
   0x0000fffff7faeb60:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7faeb64:	aa1403e4	mov	x4, x20
   0x0000fffff7faeb68:	aa1603e5	mov	x5, x22
   0x0000fffff7faeb6c:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7faeb70:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faeb74:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faeb78:	d63f0200	blr	x16
   0x0000fffff7faeb7c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faeb80:	54008800	b.eq	0xfffff7fafc80  // b.none
   0x0000fffff7faeb84:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faeb88:	f100017f	cmp	x11, #0x0
   0x0000fffff7faeb8c:	540004a0	b.eq	0xfffff7faec20  // b.none
   0x0000fffff7faeb90:	b940016d	ldr	w13, [x11]
   0x0000fffff7faeb94:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faeb98:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faeb9c:	eb0901bf	cmp	x13, x9
   0x0000fffff7faeba0:	54000400	b.eq	0xfffff7faec20  // b.none
   0x0000fffff7faeba4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faeba8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faebac:	36d801d1	tbz	w17, #27, 0xfffff7faebe4
   0x0000fffff7faebb0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faebb4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faebb8:	f100013f	cmp	x9, #0x0
   0x0000fffff7faebbc:	54000321	b.ne	0xfffff7faec20  // b.any
   0x0000fffff7faebc0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faebc4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faebc8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faebcc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faebd0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faebd4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faebd8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faebdc:	f100055f	cmp	x10, #0x1
   0x0000fffff7faebe0:	54000209	b.ls	0xfffff7faec20  // b.plast
   0x0000fffff7faebe4:	36d8008d	tbz	w13, #27, 0xfffff7faebf4
   0x0000fffff7faebe8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faebec:	91000529	add	x9, x9, #0x1
   0x0000fffff7faebf0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faebf4:	36d80091	tbz	w17, #27, 0xfffff7faec04
   0x0000fffff7faebf8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faebfc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faec00:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faec04:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7faec08:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7faec0c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faec10:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faec14:	f900266c	str	x12, [x19, #72]
   0x0000fffff7faec18:	b900426d	str	w13, [x19, #64]
   0x0000fffff7faec1c:	1400000e	b	0xfffff7faec54
   0x0000fffff7faec20:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faec24:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faec28:	aa1303e1	mov	x1, x19
   0x0000fffff7faec2c:	aa1503e2	mov	x2, x21
   0x0000fffff7faec30:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7faec34:	aa1403e4	mov	x4, x20
   0x0000fffff7faec38:	aa1603e5	mov	x5, x22
   0x0000fffff7faec3c:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7faec40:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faec44:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faec48:	d63f0200	blr	x16
   0x0000fffff7faec4c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faec50:	540081c0	b.eq	0xfffff7fafc88  // b.none
   0x0000fffff7faec54:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faec58:	37d806a9	tbnz	w9, #27, 0xfffff7faed2c
   0x0000fffff7faec5c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faec60:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faec64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faec68:	eb0a013f	cmp	x9, x10
   0x0000fffff7faec6c:	540001c1	b.ne	0xfffff7faeca4  // b.any
   0x0000fffff7faec70:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faec74:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faec78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faec7c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faec80:	54000121	b.ne	0xfffff7faeca4  // b.any
   0x0000fffff7faec84:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faec88:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7faec8c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faec90:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faec94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faec98:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7faec9c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faeca0:	14000030	b	0xfffff7faed60
   0x0000fffff7faeca4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faeca8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faecac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faecb0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faecb4:	54000120	b.eq	0xfffff7faecd8  // b.none
   0x0000fffff7faecb8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faecbc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faecc0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faecc4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faecc8:	54000321	b.ne	0xfffff7faed2c  // b.any
   0x0000fffff7faeccc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faecd0:	9e620120	scvtf	d0, x9
   0x0000fffff7faecd4:	14000002	b	0xfffff7faecdc
   0x0000fffff7faecd8:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7faecdc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faece0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faece4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faece8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faecec:	54000120	b.eq	0xfffff7faed10  // b.none
   0x0000fffff7faecf0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faecf4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faecf8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faecfc:	eb0a013f	cmp	x9, x10
   0x0000fffff7faed00:	54000161	b.ne	0xfffff7faed2c  // b.any
   0x0000fffff7faed04:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faed08:	9e620121	scvtf	d1, x9
   0x0000fffff7faed0c:	14000002	b	0xfffff7faed14
   0x0000fffff7faed10:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7faed14:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faed18:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7faed1c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faed20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faed24:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faed28:	17ffffde	b	0xfffff7faeca0
   0x0000fffff7faed2c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faed30:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faed34:	aa1303e1	mov	x1, x19
   0x0000fffff7faed38:	aa1503e2	mov	x2, x21
   0x0000fffff7faed3c:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7faed40:	aa1403e4	mov	x4, x20
   0x0000fffff7faed44:	aa1603e5	mov	x5, x22
   0x0000fffff7faed48:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7faed4c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faed50:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faed54:	d63f0200	blr	x16
   0x0000fffff7faed58:	f100001f	cmp	x0, #0x0
   0x0000fffff7faed5c:	540079a0	b.eq	0xfffff7fafc90  // b.none
   0x0000fffff7faed60:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7faed64:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7faed68:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7faed6c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7faed70:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7faed74:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7faed78:	36d801d1	tbz	w17, #27, 0xfffff7faedb0
   0x0000fffff7faed7c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faed80:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faed84:	f100013f	cmp	x9, #0x0
   0x0000fffff7faed88:	54000281	b.ne	0xfffff7faedd8  // b.any
   0x0000fffff7faed8c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7faed90:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faed94:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faed98:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faed9c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faeda0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faeda4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faeda8:	f100055f	cmp	x10, #0x1
   0x0000fffff7faedac:	54000169	b.ls	0xfffff7faedd8  // b.plast
   0x0000fffff7faedb0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faedb4:	91000529	add	x9, x9, #0x1
   0x0000fffff7faedb8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faedbc:	36d80091	tbz	w17, #27, 0xfffff7faedcc
   0x0000fffff7faedc0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faedc4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faedc8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faedcc:	f900266c	str	x12, [x19, #72]
   0x0000fffff7faedd0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7faedd4:	1400000e	b	0xfffff7faee0c
   0x0000fffff7faedd8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faeddc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faede0:	aa1303e1	mov	x1, x19
   0x0000fffff7faede4:	aa1503e2	mov	x2, x21
   0x0000fffff7faede8:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7faedec:	aa1403e4	mov	x4, x20
   0x0000fffff7faedf0:	aa1603e5	mov	x5, x22
   0x0000fffff7faedf4:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7faedf8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faedfc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faee00:	d63f0200	blr	x16
   0x0000fffff7faee04:	f100001f	cmp	x0, #0x0
   0x0000fffff7faee08:	54007480	b.eq	0xfffff7fafc98  // b.none
   0x0000fffff7faee0c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7faee10:	f100017f	cmp	x11, #0x0
   0x0000fffff7faee14:	540003a0	b.eq	0xfffff7faee88  // b.none
   0x0000fffff7faee18:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7faee1c:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7faee20:	b9400171	ldr	w17, [x11]
   0x0000fffff7faee24:	36d801d1	tbz	w17, #27, 0xfffff7faee5c
   0x0000fffff7faee28:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faee2c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faee30:	f100013f	cmp	x9, #0x0
   0x0000fffff7faee34:	540002a1	b.ne	0xfffff7faee88  // b.any
   0x0000fffff7faee38:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7faee3c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faee40:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faee44:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faee48:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faee4c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faee50:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faee54:	f100055f	cmp	x10, #0x1
   0x0000fffff7faee58:	54000189	b.ls	0xfffff7faee88  // b.plast
   0x0000fffff7faee5c:	36d8008d	tbz	w13, #27, 0xfffff7faee6c
   0x0000fffff7faee60:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faee64:	91000529	add	x9, x9, #0x1
   0x0000fffff7faee68:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faee6c:	36d80091	tbz	w17, #27, 0xfffff7faee7c
   0x0000fffff7faee70:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faee74:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faee78:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faee7c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7faee80:	b900016d	str	w13, [x11]
   0x0000fffff7faee84:	1400000e	b	0xfffff7faeebc
   0x0000fffff7faee88:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faee8c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faee90:	aa1303e1	mov	x1, x19
   0x0000fffff7faee94:	aa1503e2	mov	x2, x21
   0x0000fffff7faee98:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7faee9c:	aa1403e4	mov	x4, x20
   0x0000fffff7faeea0:	aa1603e5	mov	x5, x22
   0x0000fffff7faeea4:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7faeea8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faeeac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faeeb0:	d63f0200	blr	x16
   0x0000fffff7faeeb4:	f100001f	cmp	x0, #0x0
   0x0000fffff7faeeb8:	54006f40	b.eq	0xfffff7fafca0  // b.none
   0x0000fffff7faeebc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faeec0:	f100017f	cmp	x11, #0x0
   0x0000fffff7faeec4:	540004a0	b.eq	0xfffff7faef58  // b.none
   0x0000fffff7faeec8:	b940016d	ldr	w13, [x11]
   0x0000fffff7faeecc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faeed0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faeed4:	eb0901bf	cmp	x13, x9
   0x0000fffff7faeed8:	54000400	b.eq	0xfffff7faef58  // b.none
   0x0000fffff7faeedc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faeee0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faeee4:	36d801d1	tbz	w17, #27, 0xfffff7faef1c
   0x0000fffff7faeee8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faeeec:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faeef0:	f100013f	cmp	x9, #0x0
   0x0000fffff7faeef4:	54000321	b.ne	0xfffff7faef58  // b.any
   0x0000fffff7faeef8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faeefc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faef00:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faef04:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faef08:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faef0c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faef10:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faef14:	f100055f	cmp	x10, #0x1
   0x0000fffff7faef18:	54000209	b.ls	0xfffff7faef58  // b.plast
   0x0000fffff7faef1c:	36d8008d	tbz	w13, #27, 0xfffff7faef2c
   0x0000fffff7faef20:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faef24:	91000529	add	x9, x9, #0x1
   0x0000fffff7faef28:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faef2c:	36d80091	tbz	w17, #27, 0xfffff7faef3c
   0x0000fffff7faef30:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faef34:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faef38:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faef3c:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7faef40:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7faef44:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faef48:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faef4c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7faef50:	b900426d	str	w13, [x19, #64]
   0x0000fffff7faef54:	1400000e	b	0xfffff7faef8c
   0x0000fffff7faef58:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faef5c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faef60:	aa1303e1	mov	x1, x19
   0x0000fffff7faef64:	aa1503e2	mov	x2, x21
   0x0000fffff7faef68:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7faef6c:	aa1403e4	mov	x4, x20
   0x0000fffff7faef70:	aa1603e5	mov	x5, x22
   0x0000fffff7faef74:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7faef78:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faef7c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faef80:	d63f0200	blr	x16
   0x0000fffff7faef84:	f100001f	cmp	x0, #0x0
   0x0000fffff7faef88:	54006900	b.eq	0xfffff7fafca8  // b.none
   0x0000fffff7faef8c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faef90:	37d806a9	tbnz	w9, #27, 0xfffff7faf064
   0x0000fffff7faef94:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faef98:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faef9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faefa0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faefa4:	540001c1	b.ne	0xfffff7faefdc  // b.any
   0x0000fffff7faefa8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faefac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faefb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faefb4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faefb8:	54000121	b.ne	0xfffff7faefdc  // b.any
   0x0000fffff7faefbc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faefc0:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7faefc4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faefc8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faefcc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faefd0:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7faefd4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faefd8:	14000030	b	0xfffff7faf098
   0x0000fffff7faefdc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faefe0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faefe4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faefe8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faefec:	54000120	b.eq	0xfffff7faf010  // b.none
   0x0000fffff7faeff0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faeff4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faeff8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faeffc:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf000:	54000321	b.ne	0xfffff7faf064  // b.any
   0x0000fffff7faf004:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faf008:	9e620120	scvtf	d0, x9
   0x0000fffff7faf00c:	14000002	b	0xfffff7faf014
   0x0000fffff7faf010:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7faf014:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf018:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf01c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf020:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf024:	54000120	b.eq	0xfffff7faf048  // b.none
   0x0000fffff7faf028:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf02c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf030:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf034:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf038:	54000161	b.ne	0xfffff7faf064  // b.any
   0x0000fffff7faf03c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faf040:	9e620121	scvtf	d1, x9
   0x0000fffff7faf044:	14000002	b	0xfffff7faf04c
   0x0000fffff7faf048:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7faf04c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faf050:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7faf054:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf058:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf05c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faf060:	17ffffde	b	0xfffff7faefd8
   0x0000fffff7faf064:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf068:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf06c:	aa1303e1	mov	x1, x19
   0x0000fffff7faf070:	aa1503e2	mov	x2, x21
   0x0000fffff7faf074:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7faf078:	aa1403e4	mov	x4, x20
   0x0000fffff7faf07c:	aa1603e5	mov	x5, x22
   0x0000fffff7faf080:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7faf084:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf088:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf08c:	d63f0200	blr	x16
   0x0000fffff7faf090:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf094:	540060e0	b.eq	0xfffff7fafcb0  // b.none
   0x0000fffff7faf098:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7faf09c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7faf0a0:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7faf0a4:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7faf0a8:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7faf0ac:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7faf0b0:	36d801d1	tbz	w17, #27, 0xfffff7faf0e8
   0x0000fffff7faf0b4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf0b8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf0bc:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf0c0:	54000281	b.ne	0xfffff7faf110  // b.any
   0x0000fffff7faf0c4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7faf0c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf0cc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf0d0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf0d4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf0d8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf0dc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf0e0:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf0e4:	54000169	b.ls	0xfffff7faf110  // b.plast
   0x0000fffff7faf0e8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf0ec:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf0f0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf0f4:	36d80091	tbz	w17, #27, 0xfffff7faf104
   0x0000fffff7faf0f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf0fc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf100:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf104:	f900266c	str	x12, [x19, #72]
   0x0000fffff7faf108:	b900426d	str	w13, [x19, #64]
   0x0000fffff7faf10c:	1400000e	b	0xfffff7faf144
   0x0000fffff7faf110:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf114:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf118:	aa1303e1	mov	x1, x19
   0x0000fffff7faf11c:	aa1503e2	mov	x2, x21
   0x0000fffff7faf120:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7faf124:	aa1403e4	mov	x4, x20
   0x0000fffff7faf128:	aa1603e5	mov	x5, x22
   0x0000fffff7faf12c:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7faf130:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf134:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf138:	d63f0200	blr	x16
   0x0000fffff7faf13c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf140:	54005bc0	b.eq	0xfffff7fafcb8  // b.none
   0x0000fffff7faf144:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7faf148:	f100017f	cmp	x11, #0x0
   0x0000fffff7faf14c:	540003a0	b.eq	0xfffff7faf1c0  // b.none
   0x0000fffff7faf150:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7faf154:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7faf158:	b9400171	ldr	w17, [x11]
   0x0000fffff7faf15c:	36d801d1	tbz	w17, #27, 0xfffff7faf194
   0x0000fffff7faf160:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf164:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf168:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf16c:	540002a1	b.ne	0xfffff7faf1c0  // b.any
   0x0000fffff7faf170:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7faf174:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf178:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf17c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf180:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf184:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf188:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf18c:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf190:	54000189	b.ls	0xfffff7faf1c0  // b.plast
   0x0000fffff7faf194:	36d8008d	tbz	w13, #27, 0xfffff7faf1a4
   0x0000fffff7faf198:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf19c:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf1a0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf1a4:	36d80091	tbz	w17, #27, 0xfffff7faf1b4
   0x0000fffff7faf1a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf1ac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf1b0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf1b4:	f900056c	str	x12, [x11, #8]
   0x0000fffff7faf1b8:	b900016d	str	w13, [x11]
   0x0000fffff7faf1bc:	1400000e	b	0xfffff7faf1f4
   0x0000fffff7faf1c0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faf1c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf1c8:	aa1303e1	mov	x1, x19
   0x0000fffff7faf1cc:	aa1503e2	mov	x2, x21
   0x0000fffff7faf1d0:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7faf1d4:	aa1403e4	mov	x4, x20
   0x0000fffff7faf1d8:	aa1603e5	mov	x5, x22
   0x0000fffff7faf1dc:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7faf1e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf1e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf1e8:	d63f0200	blr	x16
   0x0000fffff7faf1ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf1f0:	54005680	b.eq	0xfffff7fafcc0  // b.none
   0x0000fffff7faf1f4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faf1f8:	f100017f	cmp	x11, #0x0
   0x0000fffff7faf1fc:	540004a0	b.eq	0xfffff7faf290  // b.none
   0x0000fffff7faf200:	b940016d	ldr	w13, [x11]
   0x0000fffff7faf204:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faf208:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faf20c:	eb0901bf	cmp	x13, x9
   0x0000fffff7faf210:	54000400	b.eq	0xfffff7faf290  // b.none
   0x0000fffff7faf214:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faf218:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faf21c:	36d801d1	tbz	w17, #27, 0xfffff7faf254
   0x0000fffff7faf220:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf224:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf228:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf22c:	54000321	b.ne	0xfffff7faf290  // b.any
   0x0000fffff7faf230:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faf234:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf238:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf23c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf240:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf244:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf248:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf24c:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf250:	54000209	b.ls	0xfffff7faf290  // b.plast
   0x0000fffff7faf254:	36d8008d	tbz	w13, #27, 0xfffff7faf264
   0x0000fffff7faf258:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf25c:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf260:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf264:	36d80091	tbz	w17, #27, 0xfffff7faf274
   0x0000fffff7faf268:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf26c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf270:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf274:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7faf278:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7faf27c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faf280:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faf284:	f900266c	str	x12, [x19, #72]
   0x0000fffff7faf288:	b900426d	str	w13, [x19, #64]
   0x0000fffff7faf28c:	1400000e	b	0xfffff7faf2c4
   0x0000fffff7faf290:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faf294:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf298:	aa1303e1	mov	x1, x19
   0x0000fffff7faf29c:	aa1503e2	mov	x2, x21
   0x0000fffff7faf2a0:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7faf2a4:	aa1403e4	mov	x4, x20
   0x0000fffff7faf2a8:	aa1603e5	mov	x5, x22
   0x0000fffff7faf2ac:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7faf2b0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faf2b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf2b8:	d63f0200	blr	x16
   0x0000fffff7faf2bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf2c0:	54005040	b.eq	0xfffff7fafcc8  // b.none
   0x0000fffff7faf2c4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf2c8:	37d806a9	tbnz	w9, #27, 0xfffff7faf39c
   0x0000fffff7faf2cc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf2d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf2d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf2d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf2dc:	540001c1	b.ne	0xfffff7faf314  // b.any
   0x0000fffff7faf2e0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf2e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf2e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf2ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf2f0:	54000121	b.ne	0xfffff7faf314  // b.any
   0x0000fffff7faf2f4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faf2f8:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7faf2fc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faf300:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf304:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf308:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7faf30c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faf310:	14000030	b	0xfffff7faf3d0
   0x0000fffff7faf314:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf318:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf31c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf320:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf324:	54000120	b.eq	0xfffff7faf348  // b.none
   0x0000fffff7faf328:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf32c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf330:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf334:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf338:	54000321	b.ne	0xfffff7faf39c  // b.any
   0x0000fffff7faf33c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faf340:	9e620120	scvtf	d0, x9
   0x0000fffff7faf344:	14000002	b	0xfffff7faf34c
   0x0000fffff7faf348:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7faf34c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf350:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf354:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf358:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf35c:	54000120	b.eq	0xfffff7faf380  // b.none
   0x0000fffff7faf360:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf364:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf368:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf36c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf370:	54000161	b.ne	0xfffff7faf39c  // b.any
   0x0000fffff7faf374:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faf378:	9e620121	scvtf	d1, x9
   0x0000fffff7faf37c:	14000002	b	0xfffff7faf384
   0x0000fffff7faf380:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7faf384:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faf388:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7faf38c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf390:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf394:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faf398:	17ffffde	b	0xfffff7faf310
   0x0000fffff7faf39c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf3a0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf3a4:	aa1303e1	mov	x1, x19
   0x0000fffff7faf3a8:	aa1503e2	mov	x2, x21
   0x0000fffff7faf3ac:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7faf3b0:	aa1403e4	mov	x4, x20
   0x0000fffff7faf3b4:	aa1603e5	mov	x5, x22
   0x0000fffff7faf3b8:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7faf3bc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf3c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf3c4:	d63f0200	blr	x16
   0x0000fffff7faf3c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf3cc:	54004820	b.eq	0xfffff7fafcd0  // b.none
   0x0000fffff7faf3d0:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7faf3d4:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7faf3d8:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7faf3dc:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7faf3e0:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7faf3e4:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7faf3e8:	36d801d1	tbz	w17, #27, 0xfffff7faf420
   0x0000fffff7faf3ec:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf3f0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf3f4:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf3f8:	54000281	b.ne	0xfffff7faf448  // b.any
   0x0000fffff7faf3fc:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7faf400:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf404:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf408:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf40c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf410:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf414:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf418:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf41c:	54000169	b.ls	0xfffff7faf448  // b.plast
   0x0000fffff7faf420:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf424:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf428:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf42c:	36d80091	tbz	w17, #27, 0xfffff7faf43c
   0x0000fffff7faf430:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf434:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf438:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf43c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7faf440:	b900426d	str	w13, [x19, #64]
   0x0000fffff7faf444:	1400000e	b	0xfffff7faf47c
   0x0000fffff7faf448:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf44c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf450:	aa1303e1	mov	x1, x19
   0x0000fffff7faf454:	aa1503e2	mov	x2, x21
   0x0000fffff7faf458:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7faf45c:	aa1403e4	mov	x4, x20
   0x0000fffff7faf460:	aa1603e5	mov	x5, x22
   0x0000fffff7faf464:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7faf468:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf46c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf470:	d63f0200	blr	x16
   0x0000fffff7faf474:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf478:	54004300	b.eq	0xfffff7fafcd8  // b.none
   0x0000fffff7faf47c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7faf480:	f100017f	cmp	x11, #0x0
   0x0000fffff7faf484:	540003a0	b.eq	0xfffff7faf4f8  // b.none
   0x0000fffff7faf488:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7faf48c:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7faf490:	b9400171	ldr	w17, [x11]
   0x0000fffff7faf494:	36d801d1	tbz	w17, #27, 0xfffff7faf4cc
   0x0000fffff7faf498:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf49c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf4a0:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf4a4:	540002a1	b.ne	0xfffff7faf4f8  // b.any
   0x0000fffff7faf4a8:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7faf4ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf4b0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf4b4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf4b8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf4bc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf4c0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf4c4:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf4c8:	54000189	b.ls	0xfffff7faf4f8  // b.plast
   0x0000fffff7faf4cc:	36d8008d	tbz	w13, #27, 0xfffff7faf4dc
   0x0000fffff7faf4d0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf4d4:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf4d8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf4dc:	36d80091	tbz	w17, #27, 0xfffff7faf4ec
   0x0000fffff7faf4e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf4e4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf4e8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf4ec:	f900056c	str	x12, [x11, #8]
   0x0000fffff7faf4f0:	b900016d	str	w13, [x11]
   0x0000fffff7faf4f4:	1400000e	b	0xfffff7faf52c
   0x0000fffff7faf4f8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faf4fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf500:	aa1303e1	mov	x1, x19
   0x0000fffff7faf504:	aa1503e2	mov	x2, x21
   0x0000fffff7faf508:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7faf50c:	aa1403e4	mov	x4, x20
   0x0000fffff7faf510:	aa1603e5	mov	x5, x22
   0x0000fffff7faf514:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7faf518:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf51c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf520:	d63f0200	blr	x16
   0x0000fffff7faf524:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf528:	54003dc0	b.eq	0xfffff7fafce0  // b.none
   0x0000fffff7faf52c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faf530:	f100017f	cmp	x11, #0x0
   0x0000fffff7faf534:	540004a0	b.eq	0xfffff7faf5c8  // b.none
   0x0000fffff7faf538:	b940016d	ldr	w13, [x11]
   0x0000fffff7faf53c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faf540:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faf544:	eb0901bf	cmp	x13, x9
   0x0000fffff7faf548:	54000400	b.eq	0xfffff7faf5c8  // b.none
   0x0000fffff7faf54c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faf550:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faf554:	36d801d1	tbz	w17, #27, 0xfffff7faf58c
   0x0000fffff7faf558:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf55c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf560:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf564:	54000321	b.ne	0xfffff7faf5c8  // b.any
   0x0000fffff7faf568:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faf56c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf570:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf574:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf578:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf57c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf580:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf584:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf588:	54000209	b.ls	0xfffff7faf5c8  // b.plast
   0x0000fffff7faf58c:	36d8008d	tbz	w13, #27, 0xfffff7faf59c
   0x0000fffff7faf590:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf594:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf598:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf59c:	36d80091	tbz	w17, #27, 0xfffff7faf5ac
   0x0000fffff7faf5a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf5a4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf5a8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf5ac:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7faf5b0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7faf5b4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faf5b8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faf5bc:	f900266c	str	x12, [x19, #72]
   0x0000fffff7faf5c0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7faf5c4:	1400000e	b	0xfffff7faf5fc
   0x0000fffff7faf5c8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faf5cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf5d0:	aa1303e1	mov	x1, x19
   0x0000fffff7faf5d4:	aa1503e2	mov	x2, x21
   0x0000fffff7faf5d8:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7faf5dc:	aa1403e4	mov	x4, x20
   0x0000fffff7faf5e0:	aa1603e5	mov	x5, x22
   0x0000fffff7faf5e4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7faf5e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faf5ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf5f0:	d63f0200	blr	x16
   0x0000fffff7faf5f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf5f8:	54003780	b.eq	0xfffff7fafce8  // b.none
   0x0000fffff7faf5fc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf600:	37d806a9	tbnz	w9, #27, 0xfffff7faf6d4
   0x0000fffff7faf604:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf608:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf60c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf610:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf614:	540001c1	b.ne	0xfffff7faf64c  // b.any
   0x0000fffff7faf618:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf61c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf620:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf624:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf628:	54000121	b.ne	0xfffff7faf64c  // b.any
   0x0000fffff7faf62c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faf630:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7faf634:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faf638:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf63c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf640:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7faf644:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faf648:	14000030	b	0xfffff7faf708
   0x0000fffff7faf64c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf650:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf654:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf658:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf65c:	54000120	b.eq	0xfffff7faf680  // b.none
   0x0000fffff7faf660:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf664:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf668:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf66c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf670:	54000321	b.ne	0xfffff7faf6d4  // b.any
   0x0000fffff7faf674:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faf678:	9e620120	scvtf	d0, x9
   0x0000fffff7faf67c:	14000002	b	0xfffff7faf684
   0x0000fffff7faf680:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7faf684:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf688:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf68c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf690:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf694:	54000120	b.eq	0xfffff7faf6b8  // b.none
   0x0000fffff7faf698:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf69c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf6a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf6a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf6a8:	54000161	b.ne	0xfffff7faf6d4  // b.any
   0x0000fffff7faf6ac:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faf6b0:	9e620121	scvtf	d1, x9
   0x0000fffff7faf6b4:	14000002	b	0xfffff7faf6bc
   0x0000fffff7faf6b8:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7faf6bc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faf6c0:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7faf6c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf6c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf6cc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faf6d0:	17ffffde	b	0xfffff7faf648
   0x0000fffff7faf6d4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf6d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf6dc:	aa1303e1	mov	x1, x19
   0x0000fffff7faf6e0:	aa1503e2	mov	x2, x21
   0x0000fffff7faf6e4:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7faf6e8:	aa1403e4	mov	x4, x20
   0x0000fffff7faf6ec:	aa1603e5	mov	x5, x22
   0x0000fffff7faf6f0:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7faf6f4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf6f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf6fc:	d63f0200	blr	x16
   0x0000fffff7faf700:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf704:	54002f60	b.eq	0xfffff7fafcf0  // b.none
   0x0000fffff7faf708:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7faf70c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7faf710:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7faf714:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7faf718:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7faf71c:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7faf720:	36d801d1	tbz	w17, #27, 0xfffff7faf758
   0x0000fffff7faf724:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf728:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf72c:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf730:	54000281	b.ne	0xfffff7faf780  // b.any
   0x0000fffff7faf734:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7faf738:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf73c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf740:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf744:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf748:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf74c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf750:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf754:	54000169	b.ls	0xfffff7faf780  // b.plast
   0x0000fffff7faf758:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf75c:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf760:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf764:	36d80091	tbz	w17, #27, 0xfffff7faf774
   0x0000fffff7faf768:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf76c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf770:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf774:	f900266c	str	x12, [x19, #72]
   0x0000fffff7faf778:	b900426d	str	w13, [x19, #64]
   0x0000fffff7faf77c:	1400000e	b	0xfffff7faf7b4
   0x0000fffff7faf780:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf784:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf788:	aa1303e1	mov	x1, x19
   0x0000fffff7faf78c:	aa1503e2	mov	x2, x21
   0x0000fffff7faf790:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7faf794:	aa1403e4	mov	x4, x20
   0x0000fffff7faf798:	aa1603e5	mov	x5, x22
   0x0000fffff7faf79c:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7faf7a0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf7a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf7a8:	d63f0200	blr	x16
   0x0000fffff7faf7ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf7b0:	54002a40	b.eq	0xfffff7fafcf8  // b.none
   0x0000fffff7faf7b4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7faf7b8:	f100017f	cmp	x11, #0x0
   0x0000fffff7faf7bc:	540003a0	b.eq	0xfffff7faf830  // b.none
   0x0000fffff7faf7c0:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7faf7c4:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7faf7c8:	b9400171	ldr	w17, [x11]
   0x0000fffff7faf7cc:	36d801d1	tbz	w17, #27, 0xfffff7faf804
   0x0000fffff7faf7d0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf7d4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf7d8:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf7dc:	540002a1	b.ne	0xfffff7faf830  // b.any
   0x0000fffff7faf7e0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7faf7e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf7e8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf7ec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf7f0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf7f4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf7f8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf7fc:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf800:	54000189	b.ls	0xfffff7faf830  // b.plast
   0x0000fffff7faf804:	36d8008d	tbz	w13, #27, 0xfffff7faf814
   0x0000fffff7faf808:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf80c:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf810:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf814:	36d80091	tbz	w17, #27, 0xfffff7faf824
   0x0000fffff7faf818:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf81c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf820:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf824:	f900056c	str	x12, [x11, #8]
   0x0000fffff7faf828:	b900016d	str	w13, [x11]
   0x0000fffff7faf82c:	1400000e	b	0xfffff7faf864
   0x0000fffff7faf830:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faf834:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf838:	aa1303e1	mov	x1, x19
   0x0000fffff7faf83c:	aa1503e2	mov	x2, x21
   0x0000fffff7faf840:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7faf844:	aa1403e4	mov	x4, x20
   0x0000fffff7faf848:	aa1603e5	mov	x5, x22
   0x0000fffff7faf84c:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7faf850:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf854:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf858:	d63f0200	blr	x16
   0x0000fffff7faf85c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf860:	54002500	b.eq	0xfffff7fafd00  // b.none
   0x0000fffff7faf864:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faf868:	f100017f	cmp	x11, #0x0
   0x0000fffff7faf86c:	540004a0	b.eq	0xfffff7faf900  // b.none
   0x0000fffff7faf870:	b940016d	ldr	w13, [x11]
   0x0000fffff7faf874:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faf878:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faf87c:	eb0901bf	cmp	x13, x9
   0x0000fffff7faf880:	54000400	b.eq	0xfffff7faf900  // b.none
   0x0000fffff7faf884:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faf888:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faf88c:	36d801d1	tbz	w17, #27, 0xfffff7faf8c4
   0x0000fffff7faf890:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf894:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf898:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf89c:	54000321	b.ne	0xfffff7faf900  // b.any
   0x0000fffff7faf8a0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faf8a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf8a8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf8ac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf8b0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf8b4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf8b8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf8bc:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf8c0:	54000209	b.ls	0xfffff7faf900  // b.plast
   0x0000fffff7faf8c4:	36d8008d	tbz	w13, #27, 0xfffff7faf8d4
   0x0000fffff7faf8c8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf8cc:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf8d0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf8d4:	36d80091	tbz	w17, #27, 0xfffff7faf8e4
   0x0000fffff7faf8d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf8dc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf8e0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf8e4:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7faf8e8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7faf8ec:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faf8f0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faf8f4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7faf8f8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7faf8fc:	1400000e	b	0xfffff7faf934
   0x0000fffff7faf900:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faf904:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf908:	aa1303e1	mov	x1, x19
   0x0000fffff7faf90c:	aa1503e2	mov	x2, x21
   0x0000fffff7faf910:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7faf914:	aa1403e4	mov	x4, x20
   0x0000fffff7faf918:	aa1603e5	mov	x5, x22
   0x0000fffff7faf91c:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7faf920:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faf924:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf928:	d63f0200	blr	x16
   0x0000fffff7faf92c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf930:	54001ec0	b.eq	0xfffff7fafd08  // b.none
   0x0000fffff7faf934:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf938:	37d806a9	tbnz	w9, #27, 0xfffff7fafa0c
   0x0000fffff7faf93c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf940:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf944:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf948:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf94c:	540001c1	b.ne	0xfffff7faf984  // b.any
   0x0000fffff7faf950:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf954:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf958:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf95c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf960:	54000121	b.ne	0xfffff7faf984  // b.any
   0x0000fffff7faf964:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faf968:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7faf96c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faf970:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf974:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf978:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7faf97c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faf980:	14000030	b	0xfffff7fafa40
   0x0000fffff7faf984:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf988:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf98c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf990:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf994:	54000120	b.eq	0xfffff7faf9b8  // b.none
   0x0000fffff7faf998:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf99c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf9a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf9a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf9a8:	54000321	b.ne	0xfffff7fafa0c  // b.any
   0x0000fffff7faf9ac:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faf9b0:	9e620120	scvtf	d0, x9
   0x0000fffff7faf9b4:	14000002	b	0xfffff7faf9bc
   0x0000fffff7faf9b8:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7faf9bc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf9c0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf9c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf9c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf9cc:	54000120	b.eq	0xfffff7faf9f0  // b.none
   0x0000fffff7faf9d0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf9d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf9d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf9dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf9e0:	54000161	b.ne	0xfffff7fafa0c  // b.any
   0x0000fffff7faf9e4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faf9e8:	9e620121	scvtf	d1, x9
   0x0000fffff7faf9ec:	14000002	b	0xfffff7faf9f4
   0x0000fffff7faf9f0:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7faf9f4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faf9f8:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7faf9fc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fafa00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafa04:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fafa08:	17ffffde	b	0xfffff7faf980
   0x0000fffff7fafa0c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fafa10:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fafa14:	aa1303e1	mov	x1, x19
   0x0000fffff7fafa18:	aa1503e2	mov	x2, x21
   0x0000fffff7fafa1c:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7fafa20:	aa1403e4	mov	x4, x20
   0x0000fffff7fafa24:	aa1603e5	mov	x5, x22
   0x0000fffff7fafa28:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7fafa2c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fafa30:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fafa34:	d63f0200	blr	x16
   0x0000fffff7fafa38:	f100001f	cmp	x0, #0x0
   0x0000fffff7fafa3c:	540016a0	b.eq	0xfffff7fafd10  // b.none
   0x0000fffff7fafa40:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fafa44:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fafa48:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fafa4c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fafa50:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fafa54:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fafa58:	36d801d1	tbz	w17, #27, 0xfffff7fafa90
   0x0000fffff7fafa5c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fafa60:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fafa64:	f100013f	cmp	x9, #0x0
   0x0000fffff7fafa68:	54000281	b.ne	0xfffff7fafab8  // b.any
   0x0000fffff7fafa6c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fafa70:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fafa74:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fafa78:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fafa7c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fafa80:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fafa84:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fafa88:	f100055f	cmp	x10, #0x1
   0x0000fffff7fafa8c:	54000169	b.ls	0xfffff7fafab8  // b.plast
   0x0000fffff7fafa90:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fafa94:	91000529	add	x9, x9, #0x1
   0x0000fffff7fafa98:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fafa9c:	36d80091	tbz	w17, #27, 0xfffff7fafaac
   0x0000fffff7fafaa0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fafaa4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fafaa8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fafaac:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fafab0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fafab4:	1400000e	b	0xfffff7fafaec
   0x0000fffff7fafab8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fafabc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fafac0:	aa1303e1	mov	x1, x19
   0x0000fffff7fafac4:	aa1503e2	mov	x2, x21
   0x0000fffff7fafac8:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7fafacc:	aa1403e4	mov	x4, x20
   0x0000fffff7fafad0:	aa1603e5	mov	x5, x22
   0x0000fffff7fafad4:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7fafad8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fafadc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fafae0:	d63f0200	blr	x16
   0x0000fffff7fafae4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fafae8:	54001180	b.eq	0xfffff7fafd18  // b.none
   0x0000fffff7fafaec:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fafaf0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fafaf4:	540003a0	b.eq	0xfffff7fafb68  // b.none
   0x0000fffff7fafaf8:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fafafc:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fafb00:	b9400171	ldr	w17, [x11]
   0x0000fffff7fafb04:	36d801d1	tbz	w17, #27, 0xfffff7fafb3c
   0x0000fffff7fafb08:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fafb0c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fafb10:	f100013f	cmp	x9, #0x0
   0x0000fffff7fafb14:	540002a1	b.ne	0xfffff7fafb68  // b.any
   0x0000fffff7fafb18:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fafb1c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fafb20:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fafb24:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fafb28:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fafb2c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fafb30:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fafb34:	f100055f	cmp	x10, #0x1
   0x0000fffff7fafb38:	54000189	b.ls	0xfffff7fafb68  // b.plast
   0x0000fffff7fafb3c:	36d8008d	tbz	w13, #27, 0xfffff7fafb4c
   0x0000fffff7fafb40:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fafb44:	91000529	add	x9, x9, #0x1
   0x0000fffff7fafb48:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fafb4c:	36d80091	tbz	w17, #27, 0xfffff7fafb5c
   0x0000fffff7fafb50:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fafb54:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fafb58:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fafb5c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fafb60:	b900016d	str	w13, [x11]
   0x0000fffff7fafb64:	1400000e	b	0xfffff7fafb9c
   0x0000fffff7fafb68:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fafb6c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fafb70:	aa1303e1	mov	x1, x19
   0x0000fffff7fafb74:	aa1503e2	mov	x2, x21
   0x0000fffff7fafb78:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7fafb7c:	aa1403e4	mov	x4, x20
   0x0000fffff7fafb80:	aa1603e5	mov	x5, x22
   0x0000fffff7fafb84:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7fafb88:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fafb8c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fafb90:	d63f0200	blr	x16
   0x0000fffff7fafb94:	f100001f	cmp	x0, #0x0
   0x0000fffff7fafb98:	54000c40	b.eq	0xfffff7fafd20  // b.none
   0x0000fffff7fafb9c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fafba0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fafba4:	aa1303e1	mov	x1, x19
   0x0000fffff7fafba8:	aa1503e2	mov	x2, x21
   0x0000fffff7fafbac:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7fafbb0:	aa1403e4	mov	x4, x20
   0x0000fffff7fafbb4:	aa1603e5	mov	x5, x22
   0x0000fffff7fafbb8:	d2869090	mov	x16, #0x3484                	// #13444
   0x0000fffff7fafbbc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fafbc0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fafbc4:	d63f0200	blr	x16
   0x0000fffff7fafbc8:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fafbcc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fafbd0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fafbd4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fafbd8:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fafbdc:	d65f03c0	ret
   0x0000fffff7fafbe0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafbe4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafbe8:	b900028a	str	w10, [x20]
   0x0000fffff7fafbec:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fafbf0:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fafbf4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fafbf8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fafbfc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fafc00:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fafc04:	d65f03c0	ret
   0x0000fffff7fafc08:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fafc0c:	17fffff5	b	0xfffff7fafbe0
   0x0000fffff7fafc10:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fafc14:	17fffff3	b	0xfffff7fafbe0
   0x0000fffff7fafc18:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fafc1c:	17fffff1	b	0xfffff7fafbe0
   0x0000fffff7fafc20:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fafc24:	17ffffef	b	0xfffff7fafbe0
   0x0000fffff7fafc28:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fafc2c:	17ffffed	b	0xfffff7fafbe0
   0x0000fffff7fafc30:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fafc34:	17ffffeb	b	0xfffff7fafbe0
   0x0000fffff7fafc38:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fafc3c:	17ffffe9	b	0xfffff7fafbe0
   0x0000fffff7fafc40:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fafc44:	17ffffe7	b	0xfffff7fafbe0
   0x0000fffff7fafc48:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fafc4c:	17ffffe5	b	0xfffff7fafbe0
   0x0000fffff7fafc50:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fafc54:	17ffffe3	b	0xfffff7fafbe0
   0x0000fffff7fafc58:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fafc5c:	17ffffe1	b	0xfffff7fafbe0
   0x0000fffff7fafc60:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fafc64:	17ffffdf	b	0xfffff7fafbe0
   0x0000fffff7fafc68:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fafc6c:	17ffffdd	b	0xfffff7fafbe0
   0x0000fffff7fafc70:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fafc74:	17ffffdb	b	0xfffff7fafbe0
   0x0000fffff7fafc78:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fafc7c:	17ffffd9	b	0xfffff7fafbe0
   0x0000fffff7fafc80:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fafc84:	17ffffd7	b	0xfffff7fafbe0
   0x0000fffff7fafc88:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fafc8c:	17ffffd5	b	0xfffff7fafbe0
   0x0000fffff7fafc90:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fafc94:	17ffffd3	b	0xfffff7fafbe0
   0x0000fffff7fafc98:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fafc9c:	17ffffd1	b	0xfffff7fafbe0
   0x0000fffff7fafca0:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fafca4:	17ffffcf	b	0xfffff7fafbe0
   0x0000fffff7fafca8:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fafcac:	17ffffcd	b	0xfffff7fafbe0
   0x0000fffff7fafcb0:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fafcb4:	17ffffcb	b	0xfffff7fafbe0
   0x0000fffff7fafcb8:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fafcbc:	17ffffc9	b	0xfffff7fafbe0
   0x0000fffff7fafcc0:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fafcc4:	17ffffc7	b	0xfffff7fafbe0
   0x0000fffff7fafcc8:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fafccc:	17ffffc5	b	0xfffff7fafbe0
   0x0000fffff7fafcd0:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fafcd4:	17ffffc3	b	0xfffff7fafbe0
   0x0000fffff7fafcd8:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fafcdc:	17ffffc1	b	0xfffff7fafbe0
   0x0000fffff7fafce0:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fafce4:	17ffffbf	b	0xfffff7fafbe0
   0x0000fffff7fafce8:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fafcec:	17ffffbd	b	0xfffff7fafbe0
   0x0000fffff7fafcf0:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fafcf4:	17ffffbb	b	0xfffff7fafbe0
   0x0000fffff7fafcf8:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fafcfc:	17ffffb9	b	0xfffff7fafbe0
   0x0000fffff7fafd00:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7fafd04:	17ffffb7	b	0xfffff7fafbe0
   0x0000fffff7fafd08:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fafd0c:	17ffffb5	b	0xfffff7fafbe0
   0x0000fffff7fafd10:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7fafd14:	17ffffb3	b	0xfffff7fafbe0
   0x0000fffff7fafd18:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7fafd1c:	17ffffb1	b	0xfffff7fafbe0
   0x0000fffff7fafd20:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7fafd24:	17ffffaf	b	0xfffff7fafbe0
   0x0000fffff7fafd28:	00000000	udf	#0
   0x0000fffff7fafd2c:	00000000	udf	#0
   0x0000fffff7fafd30:	00000000	udf	#0
   0x0000fffff7fafd34:	00000000	udf	#0
   0x0000fffff7fafd38:	00000000	udf	#0
   0x0000fffff7fafd3c:	00000000	udf	#0
   0x0000fffff7fafd40:	00000000	udf	#0
   0x0000fffff7fafd44:	00000000	udf	#0
   0x0000fffff7fafd48:	00000000	udf	#0
   0x0000fffff7fafd4c:	00000000	udf	#0
   0x0000fffff7fafd50:	00000000	udf	#0
   0x0000fffff7fafd54:	00000000	udf	#0
   0x0000fffff7fafd58:	00000000	udf	#0
   0x0000fffff7fafd5c:	00000000	udf	#0
   0x0000fffff7fafd60:	00000000	udf	#0
   0x0000fffff7fafd64:	00000000	udf	#0
   0x0000fffff7fafd68:	00000000	udf	#0
   0x0000fffff7fafd6c:	00000000	udf	#0
   0x0000fffff7fafd70:	00000000	udf	#0
   0x0000fffff7fafd74:	00000000	udf	#0
   0x0000fffff7fafd78:	00000000	udf	#0
   0x0000fffff7fafd7c:	00000000	udf	#0
   0x0000fffff7fafd80:	00000000	udf	#0
   0x0000fffff7fafd84:	00000000	udf	#0
   0x0000fffff7fafd88:	00000000	udf	#0
   0x0000fffff7fafd8c:	00000000	udf	#0
   0x0000fffff7fafd90:	00000000	udf	#0
   0x0000fffff7fafd94:	00000000	udf	#0
   0x0000fffff7fafd98:	00000000	udf	#0
   0x0000fffff7fafd9c:	00000000	udf	#0
   0x0000fffff7fafda0:	00000000	udf	#0
   0x0000fffff7fafda4:	00000000	udf	#0
   0x0000fffff7fafda8:	00000000	udf	#0
   0x0000fffff7fafdac:	00000000	udf	#0
   0x0000fffff7fafdb0:	00000000	udf	#0
   0x0000fffff7fafdb4:	00000000	udf	#0
   0x0000fffff7fafdb8:	00000000	udf	#0
   0x0000fffff7fafdbc:	00000000	udf	#0
   0x0000fffff7fafdc0:	00000000	udf	#0
   0x0000fffff7fafdc4:	00000000	udf	#0
   0x0000fffff7fafdc8:	00000000	udf	#0
   0x0000fffff7fafdcc:	00000000	udf	#0
   0x0000fffff7fafdd0:	00000000	udf	#0
   0x0000fffff7fafdd4:	00000000	udf	#0
   0x0000fffff7fafdd8:	00000000	udf	#0
   0x0000fffff7fafddc:	00000000	udf	#0
   0x0000fffff7fafde0:	00000000	udf	#0
   0x0000fffff7fafde4:	00000000	udf	#0
   0x0000fffff7fafde8:	00000000	udf	#0
   0x0000fffff7fafdec:	00000000	udf	#0
   0x0000fffff7fafdf0:	00000000	udf	#0
   0x0000fffff7fafdf4:	00000000	udf	#0
   0x0000fffff7fafdf8:	00000000	udf	#0
   0x0000fffff7fafdfc:	00000000	udf	#0
   0x0000fffff7fafe00:	00000000	udf	#0
   0x0000fffff7fafe04:	00000000	udf	#0
   0x0000fffff7fafe08:	00000000	udf	#0
   0x0000fffff7fafe0c:	00000000	udf	#0
   0x0000fffff7fafe10:	00000000	udf	#0
   0x0000fffff7fafe14:	00000000	udf	#0
   0x0000fffff7fafe18:	00000000	udf	#0
   0x0000fffff7fafe1c:	00000000	udf	#0
   0x0000fffff7fafe20:	00000000	udf	#0
   0x0000fffff7fafe24:	00000000	udf	#0
   0x0000fffff7fafe28:	00000000	udf	#0
   0x0000fffff7fafe2c:	00000000	udf	#0
   0x0000fffff7fafe30:	00000000	udf	#0
   0x0000fffff7fafe34:	00000000	udf	#0
   0x0000fffff7fafe38:	00000000	udf	#0
   0x0000fffff7fafe3c:	00000000	udf	#0
   0x0000fffff7fafe40:	00000000	udf	#0
   0x0000fffff7fafe44:	00000000	udf	#0
   0x0000fffff7fafe48:	00000000	udf	#0
   0x0000fffff7fafe4c:	00000000	udf	#0
   0x0000fffff7fafe50:	00000000	udf	#0
   0x0000fffff7fafe54:	00000000	udf	#0
   0x0000fffff7fafe58:	00000000	udf	#0
   0x0000fffff7fafe5c:	00000000	udf	#0
   0x0000fffff7fafe60:	00000000	udf	#0
   0x0000fffff7fafe64:	00000000	udf	#0
   0x0000fffff7fafe68:	00000000	udf	#0
   0x0000fffff7fafe6c:	00000000	udf	#0
   0x0000fffff7fafe70:	00000000	udf	#0
   0x0000fffff7fafe74:	00000000	udf	#0
   0x0000fffff7fafe78:	00000000	udf	#0
   0x0000fffff7fafe7c:	00000000	udf	#0
   0x0000fffff7fafe80:	00000000	udf	#0
   0x0000fffff7fafe84:	00000000	udf	#0
   0x0000fffff7fafe88:	00000000	udf	#0
   0x0000fffff7fafe8c:	00000000	udf	#0
   0x0000fffff7fafe90:	00000000	udf	#0
   0x0000fffff7fafe94:	00000000	udf	#0
   0x0000fffff7fafe98:	00000000	udf	#0
   0x0000fffff7fafe9c:	00000000	udf	#0
   0x0000fffff7fafea0:	00000000	udf	#0
   0x0000fffff7fafea4:	00000000	udf	#0
   0x0000fffff7fafea8:	00000000	udf	#0
   0x0000fffff7fafeac:	00000000	udf	#0
   0x0000fffff7fafeb0:	00000000	udf	#0
   0x0000fffff7fafeb4:	00000000	udf	#0
   0x0000fffff7fafeb8:	00000000	udf	#0
   0x0000fffff7fafebc:	00000000	udf	#0
   0x0000fffff7fafec0:	00000000	udf	#0
   0x0000fffff7fafec4:	00000000	udf	#0
   0x0000fffff7fafec8:	00000000	udf	#0
   0x0000fffff7fafecc:	00000000	udf	#0
   0x0000fffff7fafed0:	00000000	udf	#0
   0x0000fffff7fafed4:	00000000	udf	#0
   0x0000fffff7fafed8:	00000000	udf	#0
   0x0000fffff7fafedc:	00000000	udf	#0
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
