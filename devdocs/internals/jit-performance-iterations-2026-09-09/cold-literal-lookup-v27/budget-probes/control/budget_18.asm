Dump of assembler code from 0xfffff7f9e000 to 0xfffff7fa0000:
   0x0000fffff7f9e000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7f9e004:	910003fd	mov	x29, sp
   0x0000fffff7f9e008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7f9e00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7f9e010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7f9e014:	aa0003f3	mov	x19, x0
   0x0000fffff7f9e018:	aa0103f4	mov	x20, x1
   0x0000fffff7f9e01c:	aa0203f5	mov	x21, x2
   0x0000fffff7f9e020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7f9e024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7f9e028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f9e02c:	f90003e9	str	x9, [sp]
   0x0000fffff7f9e030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7f9e034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7f9e038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7f9e03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f9e040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e044:	d63f0200	blr	x16
   0x0000fffff7f9e048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7f9e04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7f9e050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7f9e054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7f9e058:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e05c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e060:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e064:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e068:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7f9e06c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e070:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e074:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9e078:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9e07c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e080:	d63f0200	blr	x16
   0x0000fffff7f9e084:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e088:	5400ac60	b.eq	0xfffff7f9f614  // b.none
   0x0000fffff7f9e08c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9e090:	37d800e9	tbnz	w9, #27, 0xfffff7f9e0ac
   0x0000fffff7f9e094:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f9e098:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e09c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e0a0:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9e0a4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9e0a8:	1400000e	b	0xfffff7f9e0e0
   0x0000fffff7f9e0ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e0b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e0b4:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e0b8:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e0bc:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7f9e0c0:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e0c4:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e0c8:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7f9e0cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9e0d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e0d4:	d63f0200	blr	x16
   0x0000fffff7f9e0d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e0dc:	5400aa00	b.eq	0xfffff7f9f61c  // b.none
   0x0000fffff7f9e0e0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9e0e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e0e8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e0ec:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e0f0:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f9e0f4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e0f8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e0fc:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9e100:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9e104:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e108:	d63f0200	blr	x16
   0x0000fffff7f9e10c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e110:	5400a8a0	b.eq	0xfffff7f9f624  // b.none
   0x0000fffff7f9e114:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9e118:	37d800e9	tbnz	w9, #27, 0xfffff7f9e134
   0x0000fffff7f9e11c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f9e120:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e124:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e128:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9e12c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9e130:	1400000e	b	0xfffff7f9e168
   0x0000fffff7f9e134:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e138:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e13c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e140:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e144:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7f9e148:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e14c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e150:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7f9e154:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9e158:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e15c:	d63f0200	blr	x16
   0x0000fffff7f9e160:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e164:	5400a640	b.eq	0xfffff7f9f62c  // b.none
   0x0000fffff7f9e168:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9e16c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e170:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e174:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e178:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7f9e17c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e180:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e184:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9e188:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9e18c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e190:	d63f0200	blr	x16
   0x0000fffff7f9e194:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e198:	5400a4e0	b.eq	0xfffff7f9f634  // b.none
   0x0000fffff7f9e19c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9e1a0:	37d80269	tbnz	w9, #27, 0xfffff7f9e1ec
   0x0000fffff7f9e1a4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9e1a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e1ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e1b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e1b4:	540001c1	b.ne	0xfffff7f9e1ec  // b.any
   0x0000fffff7f9e1b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9e1bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e1c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e1c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e1c8:	54000121	b.ne	0xfffff7f9e1ec  // b.any
   0x0000fffff7f9e1cc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9e1d0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9e1d4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9e1d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e1dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e1e0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9e1e4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9e1e8:	1400000e	b	0xfffff7f9e220
   0x0000fffff7f9e1ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e1f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e1f4:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e1f8:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e1fc:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f9e200:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e204:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e208:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9e20c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9e210:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e214:	d63f0200	blr	x16
   0x0000fffff7f9e218:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e21c:	5400a100	b.eq	0xfffff7f9f63c  // b.none
   0x0000fffff7f9e220:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e224:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e228:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e22c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e230:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f9e234:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e238:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e23c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9e240:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9e244:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e248:	d63f0200	blr	x16
   0x0000fffff7f9e24c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e250:	54009fa0	b.eq	0xfffff7f9f644  // b.none
   0x0000fffff7f9e254:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9e258:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e25c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e260:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e264:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f9e268:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e26c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e270:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9e274:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9e278:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e27c:	d63f0200	blr	x16
   0x0000fffff7f9e280:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e284:	54009e40	b.eq	0xfffff7f9f64c  // b.none
   0x0000fffff7f9e288:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9e28c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e290:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e294:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e298:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f9e29c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e2a0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e2a4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9e2a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9e2ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e2b0:	d63f0200	blr	x16
   0x0000fffff7f9e2b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e2b8:	54009ce0	b.eq	0xfffff7f9f654  // b.none
   0x0000fffff7f9e2bc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9e2c0:	37d80269	tbnz	w9, #27, 0xfffff7f9e30c
   0x0000fffff7f9e2c4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9e2c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e2cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e2d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e2d4:	540001c1	b.ne	0xfffff7f9e30c  // b.any
   0x0000fffff7f9e2d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9e2dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e2e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e2e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e2e8:	54000121	b.ne	0xfffff7f9e30c  // b.any
   0x0000fffff7f9e2ec:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9e2f0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9e2f4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9e2f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e2fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e300:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9e304:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9e308:	1400000e	b	0xfffff7f9e340
   0x0000fffff7f9e30c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e310:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e314:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e318:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e31c:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f9e320:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e324:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e328:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9e32c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9e330:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e334:	d63f0200	blr	x16
   0x0000fffff7f9e338:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e33c:	54009900	b.eq	0xfffff7f9f65c  // b.none
   0x0000fffff7f9e340:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e344:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e348:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e34c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e350:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f9e354:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e358:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e35c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9e360:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9e364:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e368:	d63f0200	blr	x16
   0x0000fffff7f9e36c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e370:	540097a0	b.eq	0xfffff7f9f664  // b.none
   0x0000fffff7f9e374:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9e378:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e37c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e380:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e384:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7f9e388:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e38c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e390:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9e394:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9e398:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e39c:	d63f0200	blr	x16
   0x0000fffff7f9e3a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e3a4:	54009640	b.eq	0xfffff7f9f66c  // b.none
   0x0000fffff7f9e3a8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9e3ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e3b0:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e3b4:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e3b8:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7f9e3bc:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e3c0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e3c4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9e3c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9e3cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e3d0:	d63f0200	blr	x16
   0x0000fffff7f9e3d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e3d8:	540094e0	b.eq	0xfffff7f9f674  // b.none
   0x0000fffff7f9e3dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9e3e0:	37d80269	tbnz	w9, #27, 0xfffff7f9e42c
   0x0000fffff7f9e3e4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9e3e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e3ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e3f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e3f4:	540001c1	b.ne	0xfffff7f9e42c  // b.any
   0x0000fffff7f9e3f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9e3fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e400:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e404:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e408:	54000121	b.ne	0xfffff7f9e42c  // b.any
   0x0000fffff7f9e40c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9e410:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9e414:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9e418:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e41c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e420:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9e424:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9e428:	1400000e	b	0xfffff7f9e460
   0x0000fffff7f9e42c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e430:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e434:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e438:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e43c:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7f9e440:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e444:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e448:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9e44c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9e450:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e454:	d63f0200	blr	x16
   0x0000fffff7f9e458:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e45c:	54009100	b.eq	0xfffff7f9f67c  // b.none
   0x0000fffff7f9e460:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e464:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e468:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e46c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e470:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7f9e474:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e478:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e47c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9e480:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9e484:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e488:	d63f0200	blr	x16
   0x0000fffff7f9e48c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e490:	54008fa0	b.eq	0xfffff7f9f684  // b.none
   0x0000fffff7f9e494:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9e498:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e49c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e4a0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e4a4:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7f9e4a8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e4ac:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e4b0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9e4b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9e4b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e4bc:	d63f0200	blr	x16
   0x0000fffff7f9e4c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e4c4:	54008e40	b.eq	0xfffff7f9f68c  // b.none
   0x0000fffff7f9e4c8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9e4cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e4d0:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e4d4:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e4d8:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7f9e4dc:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e4e0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e4e4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9e4e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9e4ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e4f0:	d63f0200	blr	x16
   0x0000fffff7f9e4f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e4f8:	54008ce0	b.eq	0xfffff7f9f694  // b.none
   0x0000fffff7f9e4fc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9e500:	37d80269	tbnz	w9, #27, 0xfffff7f9e54c
   0x0000fffff7f9e504:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9e508:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e50c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e510:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e514:	540001c1	b.ne	0xfffff7f9e54c  // b.any
   0x0000fffff7f9e518:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9e51c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e520:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e524:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e528:	54000121	b.ne	0xfffff7f9e54c  // b.any
   0x0000fffff7f9e52c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9e530:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9e534:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9e538:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e53c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e540:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9e544:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9e548:	1400000e	b	0xfffff7f9e580
   0x0000fffff7f9e54c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e550:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e554:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e558:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e55c:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7f9e560:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e564:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e568:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9e56c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9e570:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e574:	d63f0200	blr	x16
   0x0000fffff7f9e578:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e57c:	54008900	b.eq	0xfffff7f9f69c  // b.none
   0x0000fffff7f9e580:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e584:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e588:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e58c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e590:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7f9e594:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e598:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e59c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9e5a0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9e5a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e5a8:	d63f0200	blr	x16
   0x0000fffff7f9e5ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e5b0:	540087a0	b.eq	0xfffff7f9f6a4  // b.none
   0x0000fffff7f9e5b4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9e5b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e5bc:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e5c0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e5c4:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7f9e5c8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e5cc:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e5d0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9e5d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9e5d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e5dc:	d63f0200	blr	x16
   0x0000fffff7f9e5e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e5e4:	54008640	b.eq	0xfffff7f9f6ac  // b.none
   0x0000fffff7f9e5e8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9e5ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e5f0:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e5f4:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e5f8:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7f9e5fc:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e600:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e604:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9e608:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9e60c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e610:	d63f0200	blr	x16
   0x0000fffff7f9e614:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e618:	540084e0	b.eq	0xfffff7f9f6b4  // b.none
   0x0000fffff7f9e61c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9e620:	37d80269	tbnz	w9, #27, 0xfffff7f9e66c
   0x0000fffff7f9e624:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9e628:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e62c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e630:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e634:	540001c1	b.ne	0xfffff7f9e66c  // b.any
   0x0000fffff7f9e638:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9e63c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e640:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e644:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e648:	54000121	b.ne	0xfffff7f9e66c  // b.any
   0x0000fffff7f9e64c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9e650:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9e654:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9e658:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e65c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e660:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9e664:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9e668:	1400000e	b	0xfffff7f9e6a0
   0x0000fffff7f9e66c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e670:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e674:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e678:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e67c:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7f9e680:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e684:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e688:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9e68c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9e690:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e694:	d63f0200	blr	x16
   0x0000fffff7f9e698:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e69c:	54008100	b.eq	0xfffff7f9f6bc  // b.none
   0x0000fffff7f9e6a0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e6a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e6a8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e6ac:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e6b0:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7f9e6b4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e6b8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e6bc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9e6c0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9e6c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e6c8:	d63f0200	blr	x16
   0x0000fffff7f9e6cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e6d0:	54007fa0	b.eq	0xfffff7f9f6c4  // b.none
   0x0000fffff7f9e6d4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9e6d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e6dc:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e6e0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e6e4:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7f9e6e8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e6ec:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e6f0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9e6f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9e6f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e6fc:	d63f0200	blr	x16
   0x0000fffff7f9e700:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e704:	54007e40	b.eq	0xfffff7f9f6cc  // b.none
   0x0000fffff7f9e708:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9e70c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e710:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e714:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e718:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7f9e71c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e720:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e724:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9e728:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9e72c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e730:	d63f0200	blr	x16
   0x0000fffff7f9e734:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e738:	54007ce0	b.eq	0xfffff7f9f6d4  // b.none
   0x0000fffff7f9e73c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9e740:	37d80269	tbnz	w9, #27, 0xfffff7f9e78c
   0x0000fffff7f9e744:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9e748:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e74c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e750:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e754:	540001c1	b.ne	0xfffff7f9e78c  // b.any
   0x0000fffff7f9e758:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9e75c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e760:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e764:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e768:	54000121	b.ne	0xfffff7f9e78c  // b.any
   0x0000fffff7f9e76c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9e770:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9e774:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9e778:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e77c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e780:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9e784:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9e788:	1400000e	b	0xfffff7f9e7c0
   0x0000fffff7f9e78c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e790:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e794:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e798:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e79c:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7f9e7a0:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e7a4:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e7a8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9e7ac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9e7b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e7b4:	d63f0200	blr	x16
   0x0000fffff7f9e7b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e7bc:	54007900	b.eq	0xfffff7f9f6dc  // b.none
   0x0000fffff7f9e7c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e7c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e7c8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e7cc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e7d0:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7f9e7d4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e7d8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e7dc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9e7e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9e7e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e7e8:	d63f0200	blr	x16
   0x0000fffff7f9e7ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e7f0:	540077a0	b.eq	0xfffff7f9f6e4  // b.none
   0x0000fffff7f9e7f4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9e7f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e7fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e800:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e804:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7f9e808:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e80c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e810:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9e814:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9e818:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e81c:	d63f0200	blr	x16
   0x0000fffff7f9e820:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e824:	54007640	b.eq	0xfffff7f9f6ec  // b.none
   0x0000fffff7f9e828:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9e82c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e830:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e834:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e838:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7f9e83c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e840:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e844:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9e848:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9e84c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e850:	d63f0200	blr	x16
   0x0000fffff7f9e854:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e858:	540074e0	b.eq	0xfffff7f9f6f4  // b.none
   0x0000fffff7f9e85c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9e860:	37d80269	tbnz	w9, #27, 0xfffff7f9e8ac
   0x0000fffff7f9e864:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9e868:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e86c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e870:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e874:	540001c1	b.ne	0xfffff7f9e8ac  // b.any
   0x0000fffff7f9e878:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9e87c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e880:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e884:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e888:	54000121	b.ne	0xfffff7f9e8ac  // b.any
   0x0000fffff7f9e88c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9e890:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9e894:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9e898:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e89c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e8a0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9e8a4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9e8a8:	1400000e	b	0xfffff7f9e8e0
   0x0000fffff7f9e8ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e8b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e8b4:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e8b8:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e8bc:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7f9e8c0:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e8c4:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e8c8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9e8cc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9e8d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e8d4:	d63f0200	blr	x16
   0x0000fffff7f9e8d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e8dc:	54007100	b.eq	0xfffff7f9f6fc  // b.none
   0x0000fffff7f9e8e0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e8e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e8e8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e8ec:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e8f0:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7f9e8f4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e8f8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e8fc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9e900:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9e904:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e908:	d63f0200	blr	x16
   0x0000fffff7f9e90c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e910:	54006fa0	b.eq	0xfffff7f9f704  // b.none
   0x0000fffff7f9e914:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9e918:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e91c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e920:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e924:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7f9e928:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e92c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e930:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9e934:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9e938:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e93c:	d63f0200	blr	x16
   0x0000fffff7f9e940:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e944:	54006e40	b.eq	0xfffff7f9f70c  // b.none
   0x0000fffff7f9e948:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9e94c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e950:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e954:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e958:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7f9e95c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e960:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e964:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9e968:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9e96c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e970:	d63f0200	blr	x16
   0x0000fffff7f9e974:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e978:	54006ce0	b.eq	0xfffff7f9f714  // b.none
   0x0000fffff7f9e97c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9e980:	37d80269	tbnz	w9, #27, 0xfffff7f9e9cc
   0x0000fffff7f9e984:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9e988:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e98c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e990:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e994:	540001c1	b.ne	0xfffff7f9e9cc  // b.any
   0x0000fffff7f9e998:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9e99c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e9a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e9a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e9a8:	54000121	b.ne	0xfffff7f9e9cc  // b.any
   0x0000fffff7f9e9ac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9e9b0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9e9b4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9e9b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e9bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e9c0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9e9c4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9e9c8:	1400000e	b	0xfffff7f9ea00
   0x0000fffff7f9e9cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e9d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e9d4:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e9d8:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e9dc:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7f9e9e0:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e9e4:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e9e8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9e9ec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9e9f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e9f4:	d63f0200	blr	x16
   0x0000fffff7f9e9f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e9fc:	54006900	b.eq	0xfffff7f9f71c  // b.none
   0x0000fffff7f9ea00:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9ea04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ea08:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ea0c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ea10:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7f9ea14:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ea18:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ea1c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9ea20:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9ea24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ea28:	d63f0200	blr	x16
   0x0000fffff7f9ea2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ea30:	540067a0	b.eq	0xfffff7f9f724  // b.none
   0x0000fffff7f9ea34:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9ea38:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ea3c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ea40:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ea44:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7f9ea48:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ea4c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ea50:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9ea54:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9ea58:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ea5c:	d63f0200	blr	x16
   0x0000fffff7f9ea60:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ea64:	54006640	b.eq	0xfffff7f9f72c  // b.none
   0x0000fffff7f9ea68:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9ea6c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ea70:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ea74:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ea78:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7f9ea7c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ea80:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ea84:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9ea88:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9ea8c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ea90:	d63f0200	blr	x16
   0x0000fffff7f9ea94:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ea98:	540064e0	b.eq	0xfffff7f9f734  // b.none
   0x0000fffff7f9ea9c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9eaa0:	37d80269	tbnz	w9, #27, 0xfffff7f9eaec
   0x0000fffff7f9eaa4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9eaa8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9eaac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9eab0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9eab4:	540001c1	b.ne	0xfffff7f9eaec  // b.any
   0x0000fffff7f9eab8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9eabc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9eac0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9eac4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9eac8:	54000121	b.ne	0xfffff7f9eaec  // b.any
   0x0000fffff7f9eacc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9ead0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9ead4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9ead8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9eadc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9eae0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9eae4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9eae8:	1400000e	b	0xfffff7f9eb20
   0x0000fffff7f9eaec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9eaf0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9eaf4:	aa1303e1	mov	x1, x19
   0x0000fffff7f9eaf8:	aa1503e2	mov	x2, x21
   0x0000fffff7f9eafc:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7f9eb00:	aa1403e4	mov	x4, x20
   0x0000fffff7f9eb04:	aa1603e5	mov	x5, x22
   0x0000fffff7f9eb08:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9eb0c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9eb10:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9eb14:	d63f0200	blr	x16
   0x0000fffff7f9eb18:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9eb1c:	54006100	b.eq	0xfffff7f9f73c  // b.none
   0x0000fffff7f9eb20:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9eb24:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9eb28:	aa1303e1	mov	x1, x19
   0x0000fffff7f9eb2c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9eb30:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7f9eb34:	aa1403e4	mov	x4, x20
   0x0000fffff7f9eb38:	aa1603e5	mov	x5, x22
   0x0000fffff7f9eb3c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9eb40:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9eb44:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9eb48:	d63f0200	blr	x16
   0x0000fffff7f9eb4c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9eb50:	54005fa0	b.eq	0xfffff7f9f744  // b.none
   0x0000fffff7f9eb54:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9eb58:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9eb5c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9eb60:	aa1503e2	mov	x2, x21
   0x0000fffff7f9eb64:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7f9eb68:	aa1403e4	mov	x4, x20
   0x0000fffff7f9eb6c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9eb70:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9eb74:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9eb78:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9eb7c:	d63f0200	blr	x16
   0x0000fffff7f9eb80:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9eb84:	54005e40	b.eq	0xfffff7f9f74c  // b.none
   0x0000fffff7f9eb88:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9eb8c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9eb90:	aa1303e1	mov	x1, x19
   0x0000fffff7f9eb94:	aa1503e2	mov	x2, x21
   0x0000fffff7f9eb98:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7f9eb9c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9eba0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9eba4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9eba8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9ebac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ebb0:	d63f0200	blr	x16
   0x0000fffff7f9ebb4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ebb8:	54005ce0	b.eq	0xfffff7f9f754  // b.none
   0x0000fffff7f9ebbc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9ebc0:	37d80269	tbnz	w9, #27, 0xfffff7f9ec0c
   0x0000fffff7f9ebc4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9ebc8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ebcc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ebd0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ebd4:	540001c1	b.ne	0xfffff7f9ec0c  // b.any
   0x0000fffff7f9ebd8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9ebdc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ebe0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ebe4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ebe8:	54000121	b.ne	0xfffff7f9ec0c  // b.any
   0x0000fffff7f9ebec:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9ebf0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9ebf4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9ebf8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ebfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ec00:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9ec04:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9ec08:	1400000e	b	0xfffff7f9ec40
   0x0000fffff7f9ec0c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9ec10:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ec14:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ec18:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ec1c:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7f9ec20:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ec24:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ec28:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9ec2c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9ec30:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ec34:	d63f0200	blr	x16
   0x0000fffff7f9ec38:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ec3c:	54005900	b.eq	0xfffff7f9f75c  // b.none
   0x0000fffff7f9ec40:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9ec44:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ec48:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ec4c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ec50:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7f9ec54:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ec58:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ec5c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9ec60:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9ec64:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ec68:	d63f0200	blr	x16
   0x0000fffff7f9ec6c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ec70:	540057a0	b.eq	0xfffff7f9f764  // b.none
   0x0000fffff7f9ec74:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9ec78:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ec7c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ec80:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ec84:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7f9ec88:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ec8c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ec90:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9ec94:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9ec98:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ec9c:	d63f0200	blr	x16
   0x0000fffff7f9eca0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9eca4:	54005640	b.eq	0xfffff7f9f76c  // b.none
   0x0000fffff7f9eca8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9ecac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ecb0:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ecb4:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ecb8:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7f9ecbc:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ecc0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ecc4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9ecc8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9eccc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ecd0:	d63f0200	blr	x16
   0x0000fffff7f9ecd4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ecd8:	540054e0	b.eq	0xfffff7f9f774  // b.none
   0x0000fffff7f9ecdc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9ece0:	37d80269	tbnz	w9, #27, 0xfffff7f9ed2c
   0x0000fffff7f9ece4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9ece8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ecec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ecf0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ecf4:	540001c1	b.ne	0xfffff7f9ed2c  // b.any
   0x0000fffff7f9ecf8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9ecfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ed00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ed04:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ed08:	54000121	b.ne	0xfffff7f9ed2c  // b.any
   0x0000fffff7f9ed0c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9ed10:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9ed14:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9ed18:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ed1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ed20:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9ed24:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9ed28:	1400000e	b	0xfffff7f9ed60
   0x0000fffff7f9ed2c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9ed30:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ed34:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ed38:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ed3c:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7f9ed40:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ed44:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ed48:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9ed4c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9ed50:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ed54:	d63f0200	blr	x16
   0x0000fffff7f9ed58:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ed5c:	54005100	b.eq	0xfffff7f9f77c  // b.none
   0x0000fffff7f9ed60:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9ed64:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ed68:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ed6c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ed70:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7f9ed74:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ed78:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ed7c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9ed80:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9ed84:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ed88:	d63f0200	blr	x16
   0x0000fffff7f9ed8c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ed90:	54004fa0	b.eq	0xfffff7f9f784  // b.none
   0x0000fffff7f9ed94:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9ed98:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ed9c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9eda0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9eda4:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7f9eda8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9edac:	aa1603e5	mov	x5, x22
   0x0000fffff7f9edb0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9edb4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9edb8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9edbc:	d63f0200	blr	x16
   0x0000fffff7f9edc0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9edc4:	54004e40	b.eq	0xfffff7f9f78c  // b.none
   0x0000fffff7f9edc8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9edcc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9edd0:	aa1303e1	mov	x1, x19
   0x0000fffff7f9edd4:	aa1503e2	mov	x2, x21
   0x0000fffff7f9edd8:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7f9eddc:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ede0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ede4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9ede8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9edec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9edf0:	d63f0200	blr	x16
   0x0000fffff7f9edf4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9edf8:	54004ce0	b.eq	0xfffff7f9f794  // b.none
   0x0000fffff7f9edfc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9ee00:	37d80269	tbnz	w9, #27, 0xfffff7f9ee4c
   0x0000fffff7f9ee04:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9ee08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ee0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ee10:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ee14:	540001c1	b.ne	0xfffff7f9ee4c  // b.any
   0x0000fffff7f9ee18:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9ee1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ee20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ee24:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ee28:	54000121	b.ne	0xfffff7f9ee4c  // b.any
   0x0000fffff7f9ee2c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9ee30:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9ee34:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9ee38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ee3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ee40:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9ee44:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9ee48:	1400000e	b	0xfffff7f9ee80
   0x0000fffff7f9ee4c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9ee50:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ee54:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ee58:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ee5c:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7f9ee60:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ee64:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ee68:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9ee6c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9ee70:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ee74:	d63f0200	blr	x16
   0x0000fffff7f9ee78:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ee7c:	54004900	b.eq	0xfffff7f9f79c  // b.none
   0x0000fffff7f9ee80:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9ee84:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ee88:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ee8c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ee90:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7f9ee94:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ee98:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ee9c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9eea0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9eea4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9eea8:	d63f0200	blr	x16
   0x0000fffff7f9eeac:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9eeb0:	540047a0	b.eq	0xfffff7f9f7a4  // b.none
   0x0000fffff7f9eeb4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9eeb8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9eebc:	aa1303e1	mov	x1, x19
   0x0000fffff7f9eec0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9eec4:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7f9eec8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9eecc:	aa1603e5	mov	x5, x22
   0x0000fffff7f9eed0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9eed4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9eed8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9eedc:	d63f0200	blr	x16
   0x0000fffff7f9eee0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9eee4:	54004640	b.eq	0xfffff7f9f7ac  // b.none
   0x0000fffff7f9eee8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9eeec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9eef0:	aa1303e1	mov	x1, x19
   0x0000fffff7f9eef4:	aa1503e2	mov	x2, x21
   0x0000fffff7f9eef8:	d2800683	mov	x3, #0x34                  	// #52
   0x0000fffff7f9eefc:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ef00:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ef04:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9ef08:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9ef0c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ef10:	d63f0200	blr	x16
   0x0000fffff7f9ef14:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ef18:	540044e0	b.eq	0xfffff7f9f7b4  // b.none
   0x0000fffff7f9ef1c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9ef20:	37d80269	tbnz	w9, #27, 0xfffff7f9ef6c
   0x0000fffff7f9ef24:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9ef28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ef2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ef30:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ef34:	540001c1	b.ne	0xfffff7f9ef6c  // b.any
   0x0000fffff7f9ef38:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9ef3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ef40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ef44:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ef48:	54000121	b.ne	0xfffff7f9ef6c  // b.any
   0x0000fffff7f9ef4c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9ef50:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9ef54:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9ef58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ef5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ef60:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9ef64:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9ef68:	1400000e	b	0xfffff7f9efa0
   0x0000fffff7f9ef6c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9ef70:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ef74:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ef78:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ef7c:	d28006a3	mov	x3, #0x35                  	// #53
   0x0000fffff7f9ef80:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ef84:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ef88:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9ef8c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9ef90:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ef94:	d63f0200	blr	x16
   0x0000fffff7f9ef98:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ef9c:	54004100	b.eq	0xfffff7f9f7bc  // b.none
   0x0000fffff7f9efa0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9efa4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9efa8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9efac:	aa1503e2	mov	x2, x21
   0x0000fffff7f9efb0:	d28006c3	mov	x3, #0x36                  	// #54
   0x0000fffff7f9efb4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9efb8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9efbc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9efc0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9efc4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9efc8:	d63f0200	blr	x16
   0x0000fffff7f9efcc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9efd0:	54003fa0	b.eq	0xfffff7f9f7c4  // b.none
   0x0000fffff7f9efd4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9efd8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9efdc:	aa1303e1	mov	x1, x19
   0x0000fffff7f9efe0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9efe4:	d28006e3	mov	x3, #0x37                  	// #55
   0x0000fffff7f9efe8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9efec:	aa1603e5	mov	x5, x22
   0x0000fffff7f9eff0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9eff4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9eff8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9effc:	d63f0200	blr	x16
   0x0000fffff7f9f000:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f004:	54003e40	b.eq	0xfffff7f9f7cc  // b.none
   0x0000fffff7f9f008:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9f00c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f010:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f014:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f018:	d2800703	mov	x3, #0x38                  	// #56
   0x0000fffff7f9f01c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f020:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f024:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9f028:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9f02c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f030:	d63f0200	blr	x16
   0x0000fffff7f9f034:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f038:	54003ce0	b.eq	0xfffff7f9f7d4  // b.none
   0x0000fffff7f9f03c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9f040:	37d80269	tbnz	w9, #27, 0xfffff7f9f08c
   0x0000fffff7f9f044:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9f048:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f04c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f050:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f054:	540001c1	b.ne	0xfffff7f9f08c  // b.any
   0x0000fffff7f9f058:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9f05c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f060:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f064:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f068:	54000121	b.ne	0xfffff7f9f08c  // b.any
   0x0000fffff7f9f06c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9f070:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9f074:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9f078:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f07c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f080:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9f084:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9f088:	1400000e	b	0xfffff7f9f0c0
   0x0000fffff7f9f08c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9f090:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f094:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f098:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f09c:	d2800723	mov	x3, #0x39                  	// #57
   0x0000fffff7f9f0a0:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f0a4:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f0a8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9f0ac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9f0b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f0b4:	d63f0200	blr	x16
   0x0000fffff7f9f0b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f0bc:	54003900	b.eq	0xfffff7f9f7dc  // b.none
   0x0000fffff7f9f0c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9f0c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f0c8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f0cc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f0d0:	d2800743	mov	x3, #0x3a                  	// #58
   0x0000fffff7f9f0d4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f0d8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f0dc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9f0e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9f0e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f0e8:	d63f0200	blr	x16
   0x0000fffff7f9f0ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f0f0:	540037a0	b.eq	0xfffff7f9f7e4  // b.none
   0x0000fffff7f9f0f4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9f0f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f0fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f100:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f104:	d2800763	mov	x3, #0x3b                  	// #59
   0x0000fffff7f9f108:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f10c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f110:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9f114:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9f118:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f11c:	d63f0200	blr	x16
   0x0000fffff7f9f120:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f124:	54003640	b.eq	0xfffff7f9f7ec  // b.none
   0x0000fffff7f9f128:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9f12c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f130:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f134:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f138:	d2800783	mov	x3, #0x3c                  	// #60
   0x0000fffff7f9f13c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f140:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f144:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9f148:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9f14c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f150:	d63f0200	blr	x16
   0x0000fffff7f9f154:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f158:	540034e0	b.eq	0xfffff7f9f7f4  // b.none
   0x0000fffff7f9f15c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9f160:	37d80269	tbnz	w9, #27, 0xfffff7f9f1ac
   0x0000fffff7f9f164:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9f168:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f16c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f170:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f174:	540001c1	b.ne	0xfffff7f9f1ac  // b.any
   0x0000fffff7f9f178:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9f17c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f180:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f184:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f188:	54000121	b.ne	0xfffff7f9f1ac  // b.any
   0x0000fffff7f9f18c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9f190:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9f194:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9f198:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f19c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f1a0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9f1a4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9f1a8:	1400000e	b	0xfffff7f9f1e0
   0x0000fffff7f9f1ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9f1b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f1b4:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f1b8:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f1bc:	d28007a3	mov	x3, #0x3d                  	// #61
   0x0000fffff7f9f1c0:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f1c4:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f1c8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9f1cc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9f1d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f1d4:	d63f0200	blr	x16
   0x0000fffff7f9f1d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f1dc:	54003100	b.eq	0xfffff7f9f7fc  // b.none
   0x0000fffff7f9f1e0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9f1e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f1e8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f1ec:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f1f0:	d28007c3	mov	x3, #0x3e                  	// #62
   0x0000fffff7f9f1f4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f1f8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f1fc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9f200:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9f204:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f208:	d63f0200	blr	x16
   0x0000fffff7f9f20c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f210:	54002fa0	b.eq	0xfffff7f9f804  // b.none
   0x0000fffff7f9f214:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9f218:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f21c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f220:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f224:	d28007e3	mov	x3, #0x3f                  	// #63
   0x0000fffff7f9f228:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f22c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f230:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9f234:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9f238:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f23c:	d63f0200	blr	x16
   0x0000fffff7f9f240:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f244:	54002e40	b.eq	0xfffff7f9f80c  // b.none
   0x0000fffff7f9f248:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9f24c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f250:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f254:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f258:	d2800803	mov	x3, #0x40                  	// #64
   0x0000fffff7f9f25c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f260:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f264:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9f268:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9f26c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f270:	d63f0200	blr	x16
   0x0000fffff7f9f274:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f278:	54002ce0	b.eq	0xfffff7f9f814  // b.none
   0x0000fffff7f9f27c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9f280:	37d80269	tbnz	w9, #27, 0xfffff7f9f2cc
   0x0000fffff7f9f284:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9f288:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f28c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f290:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f294:	540001c1	b.ne	0xfffff7f9f2cc  // b.any
   0x0000fffff7f9f298:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9f29c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f2a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f2a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f2a8:	54000121	b.ne	0xfffff7f9f2cc  // b.any
   0x0000fffff7f9f2ac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9f2b0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9f2b4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9f2b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f2bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f2c0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9f2c4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9f2c8:	1400000e	b	0xfffff7f9f300
   0x0000fffff7f9f2cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9f2d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f2d4:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f2d8:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f2dc:	d2800823	mov	x3, #0x41                  	// #65
   0x0000fffff7f9f2e0:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f2e4:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f2e8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9f2ec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9f2f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f2f4:	d63f0200	blr	x16
   0x0000fffff7f9f2f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f2fc:	54002900	b.eq	0xfffff7f9f81c  // b.none
   0x0000fffff7f9f300:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9f304:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f308:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f30c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f310:	d2800843	mov	x3, #0x42                  	// #66
   0x0000fffff7f9f314:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f318:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f31c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9f320:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9f324:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f328:	d63f0200	blr	x16
   0x0000fffff7f9f32c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f330:	540027a0	b.eq	0xfffff7f9f824  // b.none
   0x0000fffff7f9f334:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9f338:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f33c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f340:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f344:	d2800863	mov	x3, #0x43                  	// #67
   0x0000fffff7f9f348:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f34c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f350:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9f354:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9f358:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f35c:	d63f0200	blr	x16
   0x0000fffff7f9f360:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f364:	54002640	b.eq	0xfffff7f9f82c  // b.none
   0x0000fffff7f9f368:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9f36c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f370:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f374:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f378:	d2800883	mov	x3, #0x44                  	// #68
   0x0000fffff7f9f37c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f380:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f384:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9f388:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9f38c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f390:	d63f0200	blr	x16
   0x0000fffff7f9f394:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f398:	540024e0	b.eq	0xfffff7f9f834  // b.none
   0x0000fffff7f9f39c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9f3a0:	37d80269	tbnz	w9, #27, 0xfffff7f9f3ec
   0x0000fffff7f9f3a4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9f3a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f3ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f3b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f3b4:	540001c1	b.ne	0xfffff7f9f3ec  // b.any
   0x0000fffff7f9f3b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9f3bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f3c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f3c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f3c8:	54000121	b.ne	0xfffff7f9f3ec  // b.any
   0x0000fffff7f9f3cc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9f3d0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9f3d4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9f3d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f3dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f3e0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9f3e4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9f3e8:	1400000e	b	0xfffff7f9f420
   0x0000fffff7f9f3ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9f3f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f3f4:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f3f8:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f3fc:	d28008a3	mov	x3, #0x45                  	// #69
   0x0000fffff7f9f400:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f404:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f408:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9f40c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9f410:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f414:	d63f0200	blr	x16
   0x0000fffff7f9f418:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f41c:	54002100	b.eq	0xfffff7f9f83c  // b.none
   0x0000fffff7f9f420:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9f424:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f428:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f42c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f430:	d28008c3	mov	x3, #0x46                  	// #70
   0x0000fffff7f9f434:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f438:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f43c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9f440:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9f444:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f448:	d63f0200	blr	x16
   0x0000fffff7f9f44c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f450:	54001fa0	b.eq	0xfffff7f9f844  // b.none
   0x0000fffff7f9f454:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9f458:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f45c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f460:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f464:	d28008e3	mov	x3, #0x47                  	// #71
   0x0000fffff7f9f468:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f46c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f470:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9f474:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9f478:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f47c:	d63f0200	blr	x16
   0x0000fffff7f9f480:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f484:	54001e40	b.eq	0xfffff7f9f84c  // b.none
   0x0000fffff7f9f488:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9f48c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f490:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f494:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f498:	d2800903	mov	x3, #0x48                  	// #72
   0x0000fffff7f9f49c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f4a0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f4a4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9f4a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9f4ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f4b0:	d63f0200	blr	x16
   0x0000fffff7f9f4b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f4b8:	54001ce0	b.eq	0xfffff7f9f854  // b.none
   0x0000fffff7f9f4bc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9f4c0:	37d80269	tbnz	w9, #27, 0xfffff7f9f50c
   0x0000fffff7f9f4c4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9f4c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f4cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f4d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f4d4:	540001c1	b.ne	0xfffff7f9f50c  // b.any
   0x0000fffff7f9f4d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9f4dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f4e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f4e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f4e8:	54000121	b.ne	0xfffff7f9f50c  // b.any
   0x0000fffff7f9f4ec:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9f4f0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9f4f4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9f4f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f4fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f500:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9f504:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9f508:	1400000e	b	0xfffff7f9f540
   0x0000fffff7f9f50c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9f510:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f514:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f518:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f51c:	d2800923	mov	x3, #0x49                  	// #73
   0x0000fffff7f9f520:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f524:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f528:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9f52c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9f530:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f534:	d63f0200	blr	x16
   0x0000fffff7f9f538:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f53c:	54001900	b.eq	0xfffff7f9f85c  // b.none
   0x0000fffff7f9f540:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9f544:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f548:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f54c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f550:	d2800943	mov	x3, #0x4a                  	// #74
   0x0000fffff7f9f554:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f558:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f55c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9f560:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9f564:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f568:	d63f0200	blr	x16
   0x0000fffff7f9f56c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f570:	540017a0	b.eq	0xfffff7f9f864  // b.none
   0x0000fffff7f9f574:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9f578:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f57c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f580:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f584:	d2800963	mov	x3, #0x4b                  	// #75
   0x0000fffff7f9f588:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f58c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f590:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9f594:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9f598:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f59c:	d63f0200	blr	x16
   0x0000fffff7f9f5a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f5a4:	54001640	b.eq	0xfffff7f9f86c  // b.none
   0x0000fffff7f9f5a8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9f5ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f5b0:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f5b4:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f5b8:	d2800983	mov	x3, #0x4c                  	// #76
   0x0000fffff7f9f5bc:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f5c0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f5c4:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7f9f5c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9f5cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f5d0:	d63f0200	blr	x16
   0x0000fffff7f9f5d4:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f9f5d8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f9f5dc:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f9f5e0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f9f5e4:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f9f5e8:	d65f03c0	ret
   0x0000fffff7f9f5ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f5f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f5f4:	b900028a	str	w10, [x20]
   0x0000fffff7f9f5f8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f9f5fc:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f9f600:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f9f604:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f9f608:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f9f60c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f9f610:	d65f03c0	ret
   0x0000fffff7f9f614:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f9f618:	17fffff5	b	0xfffff7f9f5ec
   0x0000fffff7f9f61c:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f9f620:	17fffff3	b	0xfffff7f9f5ec
   0x0000fffff7f9f624:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f9f628:	17fffff1	b	0xfffff7f9f5ec
   0x0000fffff7f9f62c:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f9f630:	17ffffef	b	0xfffff7f9f5ec
   0x0000fffff7f9f634:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f9f638:	17ffffed	b	0xfffff7f9f5ec
   0x0000fffff7f9f63c:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f9f640:	17ffffeb	b	0xfffff7f9f5ec
   0x0000fffff7f9f644:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f9f648:	17ffffe9	b	0xfffff7f9f5ec
   0x0000fffff7f9f64c:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f9f650:	17ffffe7	b	0xfffff7f9f5ec
   0x0000fffff7f9f654:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f9f658:	17ffffe5	b	0xfffff7f9f5ec
   0x0000fffff7f9f65c:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f9f660:	17ffffe3	b	0xfffff7f9f5ec
   0x0000fffff7f9f664:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7f9f668:	17ffffe1	b	0xfffff7f9f5ec
   0x0000fffff7f9f66c:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7f9f670:	17ffffdf	b	0xfffff7f9f5ec
   0x0000fffff7f9f674:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7f9f678:	17ffffdd	b	0xfffff7f9f5ec
   0x0000fffff7f9f67c:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7f9f680:	17ffffdb	b	0xfffff7f9f5ec
   0x0000fffff7f9f684:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7f9f688:	17ffffd9	b	0xfffff7f9f5ec
   0x0000fffff7f9f68c:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7f9f690:	17ffffd7	b	0xfffff7f9f5ec
   0x0000fffff7f9f694:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7f9f698:	17ffffd5	b	0xfffff7f9f5ec
   0x0000fffff7f9f69c:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7f9f6a0:	17ffffd3	b	0xfffff7f9f5ec
   0x0000fffff7f9f6a4:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7f9f6a8:	17ffffd1	b	0xfffff7f9f5ec
   0x0000fffff7f9f6ac:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7f9f6b0:	17ffffcf	b	0xfffff7f9f5ec
   0x0000fffff7f9f6b4:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7f9f6b8:	17ffffcd	b	0xfffff7f9f5ec
   0x0000fffff7f9f6bc:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7f9f6c0:	17ffffcb	b	0xfffff7f9f5ec
   0x0000fffff7f9f6c4:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7f9f6c8:	17ffffc9	b	0xfffff7f9f5ec
   0x0000fffff7f9f6cc:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7f9f6d0:	17ffffc7	b	0xfffff7f9f5ec
   0x0000fffff7f9f6d4:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7f9f6d8:	17ffffc5	b	0xfffff7f9f5ec
   0x0000fffff7f9f6dc:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7f9f6e0:	17ffffc3	b	0xfffff7f9f5ec
   0x0000fffff7f9f6e4:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7f9f6e8:	17ffffc1	b	0xfffff7f9f5ec
   0x0000fffff7f9f6ec:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7f9f6f0:	17ffffbf	b	0xfffff7f9f5ec
   0x0000fffff7f9f6f4:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7f9f6f8:	17ffffbd	b	0xfffff7f9f5ec
   0x0000fffff7f9f6fc:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7f9f700:	17ffffbb	b	0xfffff7f9f5ec
   0x0000fffff7f9f704:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7f9f708:	17ffffb9	b	0xfffff7f9f5ec
   0x0000fffff7f9f70c:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7f9f710:	17ffffb7	b	0xfffff7f9f5ec
   0x0000fffff7f9f714:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7f9f718:	17ffffb5	b	0xfffff7f9f5ec
   0x0000fffff7f9f71c:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7f9f720:	17ffffb3	b	0xfffff7f9f5ec
   0x0000fffff7f9f724:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7f9f728:	17ffffb1	b	0xfffff7f9f5ec
   0x0000fffff7f9f72c:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7f9f730:	17ffffaf	b	0xfffff7f9f5ec
   0x0000fffff7f9f734:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7f9f738:	17ffffad	b	0xfffff7f9f5ec
   0x0000fffff7f9f73c:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7f9f740:	17ffffab	b	0xfffff7f9f5ec
   0x0000fffff7f9f744:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7f9f748:	17ffffa9	b	0xfffff7f9f5ec
   0x0000fffff7f9f74c:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7f9f750:	17ffffa7	b	0xfffff7f9f5ec
   0x0000fffff7f9f754:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7f9f758:	17ffffa5	b	0xfffff7f9f5ec
   0x0000fffff7f9f75c:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7f9f760:	17ffffa3	b	0xfffff7f9f5ec
   0x0000fffff7f9f764:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7f9f768:	17ffffa1	b	0xfffff7f9f5ec
   0x0000fffff7f9f76c:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7f9f770:	17ffff9f	b	0xfffff7f9f5ec
   0x0000fffff7f9f774:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7f9f778:	17ffff9d	b	0xfffff7f9f5ec
   0x0000fffff7f9f77c:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7f9f780:	17ffff9b	b	0xfffff7f9f5ec
   0x0000fffff7f9f784:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7f9f788:	17ffff99	b	0xfffff7f9f5ec
   0x0000fffff7f9f78c:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7f9f790:	17ffff97	b	0xfffff7f9f5ec
   0x0000fffff7f9f794:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7f9f798:	17ffff95	b	0xfffff7f9f5ec
   0x0000fffff7f9f79c:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7f9f7a0:	17ffff93	b	0xfffff7f9f5ec
   0x0000fffff7f9f7a4:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7f9f7a8:	17ffff91	b	0xfffff7f9f5ec
   0x0000fffff7f9f7ac:	d2800669	mov	x9, #0x33                  	// #51
   0x0000fffff7f9f7b0:	17ffff8f	b	0xfffff7f9f5ec
   0x0000fffff7f9f7b4:	d2800689	mov	x9, #0x34                  	// #52
   0x0000fffff7f9f7b8:	17ffff8d	b	0xfffff7f9f5ec
   0x0000fffff7f9f7bc:	d28006a9	mov	x9, #0x35                  	// #53
   0x0000fffff7f9f7c0:	17ffff8b	b	0xfffff7f9f5ec
   0x0000fffff7f9f7c4:	d28006c9	mov	x9, #0x36                  	// #54
   0x0000fffff7f9f7c8:	17ffff89	b	0xfffff7f9f5ec
   0x0000fffff7f9f7cc:	d28006e9	mov	x9, #0x37                  	// #55
   0x0000fffff7f9f7d0:	17ffff87	b	0xfffff7f9f5ec
   0x0000fffff7f9f7d4:	d2800709	mov	x9, #0x38                  	// #56
   0x0000fffff7f9f7d8:	17ffff85	b	0xfffff7f9f5ec
   0x0000fffff7f9f7dc:	d2800729	mov	x9, #0x39                  	// #57
   0x0000fffff7f9f7e0:	17ffff83	b	0xfffff7f9f5ec
   0x0000fffff7f9f7e4:	d2800749	mov	x9, #0x3a                  	// #58
   0x0000fffff7f9f7e8:	17ffff81	b	0xfffff7f9f5ec
   0x0000fffff7f9f7ec:	d2800769	mov	x9, #0x3b                  	// #59
   0x0000fffff7f9f7f0:	17ffff7f	b	0xfffff7f9f5ec
   0x0000fffff7f9f7f4:	d2800789	mov	x9, #0x3c                  	// #60
   0x0000fffff7f9f7f8:	17ffff7d	b	0xfffff7f9f5ec
   0x0000fffff7f9f7fc:	d28007a9	mov	x9, #0x3d                  	// #61
   0x0000fffff7f9f800:	17ffff7b	b	0xfffff7f9f5ec
   0x0000fffff7f9f804:	d28007c9	mov	x9, #0x3e                  	// #62
   0x0000fffff7f9f808:	17ffff79	b	0xfffff7f9f5ec
   0x0000fffff7f9f80c:	d28007e9	mov	x9, #0x3f                  	// #63
   0x0000fffff7f9f810:	17ffff77	b	0xfffff7f9f5ec
   0x0000fffff7f9f814:	d2800809	mov	x9, #0x40                  	// #64
   0x0000fffff7f9f818:	17ffff75	b	0xfffff7f9f5ec
   0x0000fffff7f9f81c:	d2800829	mov	x9, #0x41                  	// #65
   0x0000fffff7f9f820:	17ffff73	b	0xfffff7f9f5ec
   0x0000fffff7f9f824:	d2800849	mov	x9, #0x42                  	// #66
   0x0000fffff7f9f828:	17ffff71	b	0xfffff7f9f5ec
   0x0000fffff7f9f82c:	d2800869	mov	x9, #0x43                  	// #67
   0x0000fffff7f9f830:	17ffff6f	b	0xfffff7f9f5ec
   0x0000fffff7f9f834:	d2800889	mov	x9, #0x44                  	// #68
   0x0000fffff7f9f838:	17ffff6d	b	0xfffff7f9f5ec
   0x0000fffff7f9f83c:	d28008a9	mov	x9, #0x45                  	// #69
   0x0000fffff7f9f840:	17ffff6b	b	0xfffff7f9f5ec
   0x0000fffff7f9f844:	d28008c9	mov	x9, #0x46                  	// #70
   0x0000fffff7f9f848:	17ffff69	b	0xfffff7f9f5ec
   0x0000fffff7f9f84c:	d28008e9	mov	x9, #0x47                  	// #71
   0x0000fffff7f9f850:	17ffff67	b	0xfffff7f9f5ec
   0x0000fffff7f9f854:	d2800909	mov	x9, #0x48                  	// #72
   0x0000fffff7f9f858:	17ffff65	b	0xfffff7f9f5ec
   0x0000fffff7f9f85c:	d2800929	mov	x9, #0x49                  	// #73
   0x0000fffff7f9f860:	17ffff63	b	0xfffff7f9f5ec
   0x0000fffff7f9f864:	d2800949	mov	x9, #0x4a                  	// #74
   0x0000fffff7f9f868:	17ffff61	b	0xfffff7f9f5ec
   0x0000fffff7f9f86c:	d2800969	mov	x9, #0x4b                  	// #75
   0x0000fffff7f9f870:	17ffff5f	b	0xfffff7f9f5ec
   0x0000fffff7f9f874:	00000000	udf	#0
   0x0000fffff7f9f878:	00000000	udf	#0
   0x0000fffff7f9f87c:	00000000	udf	#0
   0x0000fffff7f9f880:	00000000	udf	#0
   0x0000fffff7f9f884:	00000000	udf	#0
   0x0000fffff7f9f888:	00000000	udf	#0
   0x0000fffff7f9f88c:	00000000	udf	#0
   0x0000fffff7f9f890:	00000000	udf	#0
   0x0000fffff7f9f894:	00000000	udf	#0
   0x0000fffff7f9f898:	00000000	udf	#0
   0x0000fffff7f9f89c:	00000000	udf	#0
   0x0000fffff7f9f8a0:	00000000	udf	#0
   0x0000fffff7f9f8a4:	00000000	udf	#0
   0x0000fffff7f9f8a8:	00000000	udf	#0
   0x0000fffff7f9f8ac:	00000000	udf	#0
   0x0000fffff7f9f8b0:	00000000	udf	#0
   0x0000fffff7f9f8b4:	00000000	udf	#0
   0x0000fffff7f9f8b8:	00000000	udf	#0
   0x0000fffff7f9f8bc:	00000000	udf	#0
   0x0000fffff7f9f8c0:	00000000	udf	#0
   0x0000fffff7f9f8c4:	00000000	udf	#0
   0x0000fffff7f9f8c8:	00000000	udf	#0
   0x0000fffff7f9f8cc:	00000000	udf	#0
   0x0000fffff7f9f8d0:	00000000	udf	#0
   0x0000fffff7f9f8d4:	00000000	udf	#0
   0x0000fffff7f9f8d8:	00000000	udf	#0
   0x0000fffff7f9f8dc:	00000000	udf	#0
   0x0000fffff7f9f8e0:	00000000	udf	#0
   0x0000fffff7f9f8e4:	00000000	udf	#0
   0x0000fffff7f9f8e8:	00000000	udf	#0
   0x0000fffff7f9f8ec:	00000000	udf	#0
   0x0000fffff7f9f8f0:	00000000	udf	#0
   0x0000fffff7f9f8f4:	00000000	udf	#0
   0x0000fffff7f9f8f8:	00000000	udf	#0
   0x0000fffff7f9f8fc:	00000000	udf	#0
   0x0000fffff7f9f900:	00000000	udf	#0
   0x0000fffff7f9f904:	00000000	udf	#0
   0x0000fffff7f9f908:	00000000	udf	#0
   0x0000fffff7f9f90c:	00000000	udf	#0
   0x0000fffff7f9f910:	00000000	udf	#0
   0x0000fffff7f9f914:	00000000	udf	#0
   0x0000fffff7f9f918:	00000000	udf	#0
   0x0000fffff7f9f91c:	00000000	udf	#0
   0x0000fffff7f9f920:	00000000	udf	#0
   0x0000fffff7f9f924:	00000000	udf	#0
   0x0000fffff7f9f928:	00000000	udf	#0
   0x0000fffff7f9f92c:	00000000	udf	#0
   0x0000fffff7f9f930:	00000000	udf	#0
   0x0000fffff7f9f934:	00000000	udf	#0
   0x0000fffff7f9f938:	00000000	udf	#0
   0x0000fffff7f9f93c:	00000000	udf	#0
   0x0000fffff7f9f940:	00000000	udf	#0
   0x0000fffff7f9f944:	00000000	udf	#0
   0x0000fffff7f9f948:	00000000	udf	#0
   0x0000fffff7f9f94c:	00000000	udf	#0
   0x0000fffff7f9f950:	00000000	udf	#0
   0x0000fffff7f9f954:	00000000	udf	#0
   0x0000fffff7f9f958:	00000000	udf	#0
   0x0000fffff7f9f95c:	00000000	udf	#0
   0x0000fffff7f9f960:	00000000	udf	#0
   0x0000fffff7f9f964:	00000000	udf	#0
   0x0000fffff7f9f968:	00000000	udf	#0
   0x0000fffff7f9f96c:	00000000	udf	#0
   0x0000fffff7f9f970:	00000000	udf	#0
   0x0000fffff7f9f974:	00000000	udf	#0
   0x0000fffff7f9f978:	00000000	udf	#0
   0x0000fffff7f9f97c:	00000000	udf	#0
   0x0000fffff7f9f980:	00000000	udf	#0
   0x0000fffff7f9f984:	00000000	udf	#0
   0x0000fffff7f9f988:	00000000	udf	#0
   0x0000fffff7f9f98c:	00000000	udf	#0
   0x0000fffff7f9f990:	00000000	udf	#0
   0x0000fffff7f9f994:	00000000	udf	#0
   0x0000fffff7f9f998:	00000000	udf	#0
   0x0000fffff7f9f99c:	00000000	udf	#0
   0x0000fffff7f9f9a0:	00000000	udf	#0
   0x0000fffff7f9f9a4:	00000000	udf	#0
   0x0000fffff7f9f9a8:	00000000	udf	#0
   0x0000fffff7f9f9ac:	00000000	udf	#0
   0x0000fffff7f9f9b0:	00000000	udf	#0
   0x0000fffff7f9f9b4:	00000000	udf	#0
   0x0000fffff7f9f9b8:	00000000	udf	#0
   0x0000fffff7f9f9bc:	00000000	udf	#0
   0x0000fffff7f9f9c0:	00000000	udf	#0
   0x0000fffff7f9f9c4:	00000000	udf	#0
   0x0000fffff7f9f9c8:	00000000	udf	#0
   0x0000fffff7f9f9cc:	00000000	udf	#0
   0x0000fffff7f9f9d0:	00000000	udf	#0
   0x0000fffff7f9f9d4:	00000000	udf	#0
   0x0000fffff7f9f9d8:	00000000	udf	#0
   0x0000fffff7f9f9dc:	00000000	udf	#0
   0x0000fffff7f9f9e0:	00000000	udf	#0
   0x0000fffff7f9f9e4:	00000000	udf	#0
   0x0000fffff7f9f9e8:	00000000	udf	#0
   0x0000fffff7f9f9ec:	00000000	udf	#0
   0x0000fffff7f9f9f0:	00000000	udf	#0
   0x0000fffff7f9f9f4:	00000000	udf	#0
   0x0000fffff7f9f9f8:	00000000	udf	#0
   0x0000fffff7f9f9fc:	00000000	udf	#0
   0x0000fffff7f9fa00:	00000000	udf	#0
   0x0000fffff7f9fa04:	00000000	udf	#0
   0x0000fffff7f9fa08:	00000000	udf	#0
   0x0000fffff7f9fa0c:	00000000	udf	#0
   0x0000fffff7f9fa10:	00000000	udf	#0
   0x0000fffff7f9fa14:	00000000	udf	#0
   0x0000fffff7f9fa18:	00000000	udf	#0
   0x0000fffff7f9fa1c:	00000000	udf	#0
   0x0000fffff7f9fa20:	00000000	udf	#0
   0x0000fffff7f9fa24:	00000000	udf	#0
   0x0000fffff7f9fa28:	00000000	udf	#0
   0x0000fffff7f9fa2c:	00000000	udf	#0
   0x0000fffff7f9fa30:	00000000	udf	#0
   0x0000fffff7f9fa34:	00000000	udf	#0
   0x0000fffff7f9fa38:	00000000	udf	#0
   0x0000fffff7f9fa3c:	00000000	udf	#0
   0x0000fffff7f9fa40:	00000000	udf	#0
   0x0000fffff7f9fa44:	00000000	udf	#0
   0x0000fffff7f9fa48:	00000000	udf	#0
   0x0000fffff7f9fa4c:	00000000	udf	#0
   0x0000fffff7f9fa50:	00000000	udf	#0
   0x0000fffff7f9fa54:	00000000	udf	#0
   0x0000fffff7f9fa58:	00000000	udf	#0
   0x0000fffff7f9fa5c:	00000000	udf	#0
   0x0000fffff7f9fa60:	00000000	udf	#0
   0x0000fffff7f9fa64:	00000000	udf	#0
   0x0000fffff7f9fa68:	00000000	udf	#0
   0x0000fffff7f9fa6c:	00000000	udf	#0
   0x0000fffff7f9fa70:	00000000	udf	#0
   0x0000fffff7f9fa74:	00000000	udf	#0
   0x0000fffff7f9fa78:	00000000	udf	#0
   0x0000fffff7f9fa7c:	00000000	udf	#0
   0x0000fffff7f9fa80:	00000000	udf	#0
   0x0000fffff7f9fa84:	00000000	udf	#0
   0x0000fffff7f9fa88:	00000000	udf	#0
   0x0000fffff7f9fa8c:	00000000	udf	#0
   0x0000fffff7f9fa90:	00000000	udf	#0
   0x0000fffff7f9fa94:	00000000	udf	#0
   0x0000fffff7f9fa98:	00000000	udf	#0
   0x0000fffff7f9fa9c:	00000000	udf	#0
   0x0000fffff7f9faa0:	00000000	udf	#0
   0x0000fffff7f9faa4:	00000000	udf	#0
   0x0000fffff7f9faa8:	00000000	udf	#0
   0x0000fffff7f9faac:	00000000	udf	#0
   0x0000fffff7f9fab0:	00000000	udf	#0
   0x0000fffff7f9fab4:	00000000	udf	#0
   0x0000fffff7f9fab8:	00000000	udf	#0
   0x0000fffff7f9fabc:	00000000	udf	#0
   0x0000fffff7f9fac0:	00000000	udf	#0
   0x0000fffff7f9fac4:	00000000	udf	#0
   0x0000fffff7f9fac8:	00000000	udf	#0
   0x0000fffff7f9facc:	00000000	udf	#0
   0x0000fffff7f9fad0:	00000000	udf	#0
   0x0000fffff7f9fad4:	00000000	udf	#0
   0x0000fffff7f9fad8:	00000000	udf	#0
   0x0000fffff7f9fadc:	00000000	udf	#0
   0x0000fffff7f9fae0:	00000000	udf	#0
   0x0000fffff7f9fae4:	00000000	udf	#0
   0x0000fffff7f9fae8:	00000000	udf	#0
   0x0000fffff7f9faec:	00000000	udf	#0
   0x0000fffff7f9faf0:	00000000	udf	#0
   0x0000fffff7f9faf4:	00000000	udf	#0
   0x0000fffff7f9faf8:	00000000	udf	#0
   0x0000fffff7f9fafc:	00000000	udf	#0
   0x0000fffff7f9fb00:	00000000	udf	#0
   0x0000fffff7f9fb04:	00000000	udf	#0
   0x0000fffff7f9fb08:	00000000	udf	#0
   0x0000fffff7f9fb0c:	00000000	udf	#0
   0x0000fffff7f9fb10:	00000000	udf	#0
   0x0000fffff7f9fb14:	00000000	udf	#0
   0x0000fffff7f9fb18:	00000000	udf	#0
   0x0000fffff7f9fb1c:	00000000	udf	#0
   0x0000fffff7f9fb20:	00000000	udf	#0
   0x0000fffff7f9fb24:	00000000	udf	#0
   0x0000fffff7f9fb28:	00000000	udf	#0
   0x0000fffff7f9fb2c:	00000000	udf	#0
   0x0000fffff7f9fb30:	00000000	udf	#0
   0x0000fffff7f9fb34:	00000000	udf	#0
   0x0000fffff7f9fb38:	00000000	udf	#0
   0x0000fffff7f9fb3c:	00000000	udf	#0
   0x0000fffff7f9fb40:	00000000	udf	#0
   0x0000fffff7f9fb44:	00000000	udf	#0
   0x0000fffff7f9fb48:	00000000	udf	#0
   0x0000fffff7f9fb4c:	00000000	udf	#0
   0x0000fffff7f9fb50:	00000000	udf	#0
   0x0000fffff7f9fb54:	00000000	udf	#0
   0x0000fffff7f9fb58:	00000000	udf	#0
   0x0000fffff7f9fb5c:	00000000	udf	#0
   0x0000fffff7f9fb60:	00000000	udf	#0
   0x0000fffff7f9fb64:	00000000	udf	#0
   0x0000fffff7f9fb68:	00000000	udf	#0
   0x0000fffff7f9fb6c:	00000000	udf	#0
   0x0000fffff7f9fb70:	00000000	udf	#0
   0x0000fffff7f9fb74:	00000000	udf	#0
   0x0000fffff7f9fb78:	00000000	udf	#0
   0x0000fffff7f9fb7c:	00000000	udf	#0
   0x0000fffff7f9fb80:	00000000	udf	#0
   0x0000fffff7f9fb84:	00000000	udf	#0
   0x0000fffff7f9fb88:	00000000	udf	#0
   0x0000fffff7f9fb8c:	00000000	udf	#0
   0x0000fffff7f9fb90:	00000000	udf	#0
   0x0000fffff7f9fb94:	00000000	udf	#0
   0x0000fffff7f9fb98:	00000000	udf	#0
   0x0000fffff7f9fb9c:	00000000	udf	#0
   0x0000fffff7f9fba0:	00000000	udf	#0
   0x0000fffff7f9fba4:	00000000	udf	#0
   0x0000fffff7f9fba8:	00000000	udf	#0
   0x0000fffff7f9fbac:	00000000	udf	#0
   0x0000fffff7f9fbb0:	00000000	udf	#0
   0x0000fffff7f9fbb4:	00000000	udf	#0
   0x0000fffff7f9fbb8:	00000000	udf	#0
   0x0000fffff7f9fbbc:	00000000	udf	#0
   0x0000fffff7f9fbc0:	00000000	udf	#0
   0x0000fffff7f9fbc4:	00000000	udf	#0
   0x0000fffff7f9fbc8:	00000000	udf	#0
   0x0000fffff7f9fbcc:	00000000	udf	#0
   0x0000fffff7f9fbd0:	00000000	udf	#0
   0x0000fffff7f9fbd4:	00000000	udf	#0
   0x0000fffff7f9fbd8:	00000000	udf	#0
   0x0000fffff7f9fbdc:	00000000	udf	#0
   0x0000fffff7f9fbe0:	00000000	udf	#0
   0x0000fffff7f9fbe4:	00000000	udf	#0
   0x0000fffff7f9fbe8:	00000000	udf	#0
   0x0000fffff7f9fbec:	00000000	udf	#0
   0x0000fffff7f9fbf0:	00000000	udf	#0
   0x0000fffff7f9fbf4:	00000000	udf	#0
   0x0000fffff7f9fbf8:	00000000	udf	#0
   0x0000fffff7f9fbfc:	00000000	udf	#0
   0x0000fffff7f9fc00:	00000000	udf	#0
   0x0000fffff7f9fc04:	00000000	udf	#0
   0x0000fffff7f9fc08:	00000000	udf	#0
   0x0000fffff7f9fc0c:	00000000	udf	#0
   0x0000fffff7f9fc10:	00000000	udf	#0
   0x0000fffff7f9fc14:	00000000	udf	#0
   0x0000fffff7f9fc18:	00000000	udf	#0
   0x0000fffff7f9fc1c:	00000000	udf	#0
   0x0000fffff7f9fc20:	00000000	udf	#0
   0x0000fffff7f9fc24:	00000000	udf	#0
   0x0000fffff7f9fc28:	00000000	udf	#0
   0x0000fffff7f9fc2c:	00000000	udf	#0
   0x0000fffff7f9fc30:	00000000	udf	#0
   0x0000fffff7f9fc34:	00000000	udf	#0
   0x0000fffff7f9fc38:	00000000	udf	#0
   0x0000fffff7f9fc3c:	00000000	udf	#0
   0x0000fffff7f9fc40:	00000000	udf	#0
   0x0000fffff7f9fc44:	00000000	udf	#0
   0x0000fffff7f9fc48:	00000000	udf	#0
   0x0000fffff7f9fc4c:	00000000	udf	#0
   0x0000fffff7f9fc50:	00000000	udf	#0
   0x0000fffff7f9fc54:	00000000	udf	#0
   0x0000fffff7f9fc58:	00000000	udf	#0
   0x0000fffff7f9fc5c:	00000000	udf	#0
   0x0000fffff7f9fc60:	00000000	udf	#0
   0x0000fffff7f9fc64:	00000000	udf	#0
   0x0000fffff7f9fc68:	00000000	udf	#0
   0x0000fffff7f9fc6c:	00000000	udf	#0
   0x0000fffff7f9fc70:	00000000	udf	#0
   0x0000fffff7f9fc74:	00000000	udf	#0
   0x0000fffff7f9fc78:	00000000	udf	#0
   0x0000fffff7f9fc7c:	00000000	udf	#0
   0x0000fffff7f9fc80:	00000000	udf	#0
   0x0000fffff7f9fc84:	00000000	udf	#0
   0x0000fffff7f9fc88:	00000000	udf	#0
   0x0000fffff7f9fc8c:	00000000	udf	#0
   0x0000fffff7f9fc90:	00000000	udf	#0
   0x0000fffff7f9fc94:	00000000	udf	#0
   0x0000fffff7f9fc98:	00000000	udf	#0
   0x0000fffff7f9fc9c:	00000000	udf	#0
   0x0000fffff7f9fca0:	00000000	udf	#0
   0x0000fffff7f9fca4:	00000000	udf	#0
   0x0000fffff7f9fca8:	00000000	udf	#0
   0x0000fffff7f9fcac:	00000000	udf	#0
   0x0000fffff7f9fcb0:	00000000	udf	#0
   0x0000fffff7f9fcb4:	00000000	udf	#0
   0x0000fffff7f9fcb8:	00000000	udf	#0
   0x0000fffff7f9fcbc:	00000000	udf	#0
   0x0000fffff7f9fcc0:	00000000	udf	#0
   0x0000fffff7f9fcc4:	00000000	udf	#0
   0x0000fffff7f9fcc8:	00000000	udf	#0
   0x0000fffff7f9fccc:	00000000	udf	#0
   0x0000fffff7f9fcd0:	00000000	udf	#0
   0x0000fffff7f9fcd4:	00000000	udf	#0
   0x0000fffff7f9fcd8:	00000000	udf	#0
   0x0000fffff7f9fcdc:	00000000	udf	#0
   0x0000fffff7f9fce0:	00000000	udf	#0
   0x0000fffff7f9fce4:	00000000	udf	#0
   0x0000fffff7f9fce8:	00000000	udf	#0
   0x0000fffff7f9fcec:	00000000	udf	#0
   0x0000fffff7f9fcf0:	00000000	udf	#0
   0x0000fffff7f9fcf4:	00000000	udf	#0
   0x0000fffff7f9fcf8:	00000000	udf	#0
   0x0000fffff7f9fcfc:	00000000	udf	#0
   0x0000fffff7f9fd00:	00000000	udf	#0
   0x0000fffff7f9fd04:	00000000	udf	#0
   0x0000fffff7f9fd08:	00000000	udf	#0
   0x0000fffff7f9fd0c:	00000000	udf	#0
   0x0000fffff7f9fd10:	00000000	udf	#0
   0x0000fffff7f9fd14:	00000000	udf	#0
   0x0000fffff7f9fd18:	00000000	udf	#0
   0x0000fffff7f9fd1c:	00000000	udf	#0
   0x0000fffff7f9fd20:	00000000	udf	#0
   0x0000fffff7f9fd24:	00000000	udf	#0
   0x0000fffff7f9fd28:	00000000	udf	#0
   0x0000fffff7f9fd2c:	00000000	udf	#0
   0x0000fffff7f9fd30:	00000000	udf	#0
   0x0000fffff7f9fd34:	00000000	udf	#0
   0x0000fffff7f9fd38:	00000000	udf	#0
   0x0000fffff7f9fd3c:	00000000	udf	#0
   0x0000fffff7f9fd40:	00000000	udf	#0
   0x0000fffff7f9fd44:	00000000	udf	#0
   0x0000fffff7f9fd48:	00000000	udf	#0
   0x0000fffff7f9fd4c:	00000000	udf	#0
   0x0000fffff7f9fd50:	00000000	udf	#0
   0x0000fffff7f9fd54:	00000000	udf	#0
   0x0000fffff7f9fd58:	00000000	udf	#0
   0x0000fffff7f9fd5c:	00000000	udf	#0
   0x0000fffff7f9fd60:	00000000	udf	#0
   0x0000fffff7f9fd64:	00000000	udf	#0
   0x0000fffff7f9fd68:	00000000	udf	#0
   0x0000fffff7f9fd6c:	00000000	udf	#0
   0x0000fffff7f9fd70:	00000000	udf	#0
   0x0000fffff7f9fd74:	00000000	udf	#0
   0x0000fffff7f9fd78:	00000000	udf	#0
   0x0000fffff7f9fd7c:	00000000	udf	#0
   0x0000fffff7f9fd80:	00000000	udf	#0
   0x0000fffff7f9fd84:	00000000	udf	#0
   0x0000fffff7f9fd88:	00000000	udf	#0
   0x0000fffff7f9fd8c:	00000000	udf	#0
   0x0000fffff7f9fd90:	00000000	udf	#0
   0x0000fffff7f9fd94:	00000000	udf	#0
   0x0000fffff7f9fd98:	00000000	udf	#0
   0x0000fffff7f9fd9c:	00000000	udf	#0
   0x0000fffff7f9fda0:	00000000	udf	#0
   0x0000fffff7f9fda4:	00000000	udf	#0
   0x0000fffff7f9fda8:	00000000	udf	#0
   0x0000fffff7f9fdac:	00000000	udf	#0
   0x0000fffff7f9fdb0:	00000000	udf	#0
   0x0000fffff7f9fdb4:	00000000	udf	#0
   0x0000fffff7f9fdb8:	00000000	udf	#0
   0x0000fffff7f9fdbc:	00000000	udf	#0
   0x0000fffff7f9fdc0:	00000000	udf	#0
   0x0000fffff7f9fdc4:	00000000	udf	#0
   0x0000fffff7f9fdc8:	00000000	udf	#0
   0x0000fffff7f9fdcc:	00000000	udf	#0
   0x0000fffff7f9fdd0:	00000000	udf	#0
   0x0000fffff7f9fdd4:	00000000	udf	#0
   0x0000fffff7f9fdd8:	00000000	udf	#0
   0x0000fffff7f9fddc:	00000000	udf	#0
   0x0000fffff7f9fde0:	00000000	udf	#0
   0x0000fffff7f9fde4:	00000000	udf	#0
   0x0000fffff7f9fde8:	00000000	udf	#0
   0x0000fffff7f9fdec:	00000000	udf	#0
   0x0000fffff7f9fdf0:	00000000	udf	#0
   0x0000fffff7f9fdf4:	00000000	udf	#0
   0x0000fffff7f9fdf8:	00000000	udf	#0
   0x0000fffff7f9fdfc:	00000000	udf	#0
   0x0000fffff7f9fe00:	00000000	udf	#0
   0x0000fffff7f9fe04:	00000000	udf	#0
   0x0000fffff7f9fe08:	00000000	udf	#0
   0x0000fffff7f9fe0c:	00000000	udf	#0
   0x0000fffff7f9fe10:	00000000	udf	#0
   0x0000fffff7f9fe14:	00000000	udf	#0
   0x0000fffff7f9fe18:	00000000	udf	#0
   0x0000fffff7f9fe1c:	00000000	udf	#0
   0x0000fffff7f9fe20:	00000000	udf	#0
   0x0000fffff7f9fe24:	00000000	udf	#0
   0x0000fffff7f9fe28:	00000000	udf	#0
   0x0000fffff7f9fe2c:	00000000	udf	#0
   0x0000fffff7f9fe30:	00000000	udf	#0
   0x0000fffff7f9fe34:	00000000	udf	#0
   0x0000fffff7f9fe38:	00000000	udf	#0
   0x0000fffff7f9fe3c:	00000000	udf	#0
   0x0000fffff7f9fe40:	00000000	udf	#0
   0x0000fffff7f9fe44:	00000000	udf	#0
   0x0000fffff7f9fe48:	00000000	udf	#0
   0x0000fffff7f9fe4c:	00000000	udf	#0
   0x0000fffff7f9fe50:	00000000	udf	#0
   0x0000fffff7f9fe54:	00000000	udf	#0
   0x0000fffff7f9fe58:	00000000	udf	#0
   0x0000fffff7f9fe5c:	00000000	udf	#0
   0x0000fffff7f9fe60:	00000000	udf	#0
   0x0000fffff7f9fe64:	00000000	udf	#0
   0x0000fffff7f9fe68:	00000000	udf	#0
   0x0000fffff7f9fe6c:	00000000	udf	#0
   0x0000fffff7f9fe70:	00000000	udf	#0
   0x0000fffff7f9fe74:	00000000	udf	#0
   0x0000fffff7f9fe78:	00000000	udf	#0
   0x0000fffff7f9fe7c:	00000000	udf	#0
   0x0000fffff7f9fe80:	00000000	udf	#0
   0x0000fffff7f9fe84:	00000000	udf	#0
   0x0000fffff7f9fe88:	00000000	udf	#0
   0x0000fffff7f9fe8c:	00000000	udf	#0
   0x0000fffff7f9fe90:	00000000	udf	#0
   0x0000fffff7f9fe94:	00000000	udf	#0
   0x0000fffff7f9fe98:	00000000	udf	#0
   0x0000fffff7f9fe9c:	00000000	udf	#0
   0x0000fffff7f9fea0:	00000000	udf	#0
   0x0000fffff7f9fea4:	00000000	udf	#0
   0x0000fffff7f9fea8:	00000000	udf	#0
   0x0000fffff7f9feac:	00000000	udf	#0
   0x0000fffff7f9feb0:	00000000	udf	#0
   0x0000fffff7f9feb4:	00000000	udf	#0
   0x0000fffff7f9feb8:	00000000	udf	#0
   0x0000fffff7f9febc:	00000000	udf	#0
   0x0000fffff7f9fec0:	00000000	udf	#0
   0x0000fffff7f9fec4:	00000000	udf	#0
   0x0000fffff7f9fec8:	00000000	udf	#0
   0x0000fffff7f9fecc:	00000000	udf	#0
   0x0000fffff7f9fed0:	00000000	udf	#0
   0x0000fffff7f9fed4:	00000000	udf	#0
   0x0000fffff7f9fed8:	00000000	udf	#0
   0x0000fffff7f9fedc:	00000000	udf	#0
   0x0000fffff7f9fee0:	00000000	udf	#0
   0x0000fffff7f9fee4:	00000000	udf	#0
   0x0000fffff7f9fee8:	00000000	udf	#0
   0x0000fffff7f9feec:	00000000	udf	#0
   0x0000fffff7f9fef0:	00000000	udf	#0
   0x0000fffff7f9fef4:	00000000	udf	#0
   0x0000fffff7f9fef8:	00000000	udf	#0
   0x0000fffff7f9fefc:	00000000	udf	#0
   0x0000fffff7f9ff00:	00000000	udf	#0
   0x0000fffff7f9ff04:	00000000	udf	#0
   0x0000fffff7f9ff08:	00000000	udf	#0
   0x0000fffff7f9ff0c:	00000000	udf	#0
   0x0000fffff7f9ff10:	00000000	udf	#0
   0x0000fffff7f9ff14:	00000000	udf	#0
   0x0000fffff7f9ff18:	00000000	udf	#0
   0x0000fffff7f9ff1c:	00000000	udf	#0
   0x0000fffff7f9ff20:	00000000	udf	#0
   0x0000fffff7f9ff24:	00000000	udf	#0
   0x0000fffff7f9ff28:	00000000	udf	#0
   0x0000fffff7f9ff2c:	00000000	udf	#0
   0x0000fffff7f9ff30:	00000000	udf	#0
   0x0000fffff7f9ff34:	00000000	udf	#0
   0x0000fffff7f9ff38:	00000000	udf	#0
   0x0000fffff7f9ff3c:	00000000	udf	#0
   0x0000fffff7f9ff40:	00000000	udf	#0
   0x0000fffff7f9ff44:	00000000	udf	#0
   0x0000fffff7f9ff48:	00000000	udf	#0
   0x0000fffff7f9ff4c:	00000000	udf	#0
   0x0000fffff7f9ff50:	00000000	udf	#0
   0x0000fffff7f9ff54:	00000000	udf	#0
   0x0000fffff7f9ff58:	00000000	udf	#0
   0x0000fffff7f9ff5c:	00000000	udf	#0
   0x0000fffff7f9ff60:	00000000	udf	#0
   0x0000fffff7f9ff64:	00000000	udf	#0
   0x0000fffff7f9ff68:	00000000	udf	#0
   0x0000fffff7f9ff6c:	00000000	udf	#0
   0x0000fffff7f9ff70:	00000000	udf	#0
   0x0000fffff7f9ff74:	00000000	udf	#0
   0x0000fffff7f9ff78:	00000000	udf	#0
   0x0000fffff7f9ff7c:	00000000	udf	#0
   0x0000fffff7f9ff80:	00000000	udf	#0
   0x0000fffff7f9ff84:	00000000	udf	#0
   0x0000fffff7f9ff88:	00000000	udf	#0
   0x0000fffff7f9ff8c:	00000000	udf	#0
   0x0000fffff7f9ff90:	00000000	udf	#0
   0x0000fffff7f9ff94:	00000000	udf	#0
   0x0000fffff7f9ff98:	00000000	udf	#0
   0x0000fffff7f9ff9c:	00000000	udf	#0
   0x0000fffff7f9ffa0:	00000000	udf	#0
   0x0000fffff7f9ffa4:	00000000	udf	#0
   0x0000fffff7f9ffa8:	00000000	udf	#0
   0x0000fffff7f9ffac:	00000000	udf	#0
   0x0000fffff7f9ffb0:	00000000	udf	#0
   0x0000fffff7f9ffb4:	00000000	udf	#0
   0x0000fffff7f9ffb8:	00000000	udf	#0
   0x0000fffff7f9ffbc:	00000000	udf	#0
   0x0000fffff7f9ffc0:	00000000	udf	#0
   0x0000fffff7f9ffc4:	00000000	udf	#0
   0x0000fffff7f9ffc8:	00000000	udf	#0
   0x0000fffff7f9ffcc:	00000000	udf	#0
   0x0000fffff7f9ffd0:	00000000	udf	#0
   0x0000fffff7f9ffd4:	00000000	udf	#0
   0x0000fffff7f9ffd8:	00000000	udf	#0
   0x0000fffff7f9ffdc:	00000000	udf	#0
   0x0000fffff7f9ffe0:	00000000	udf	#0
   0x0000fffff7f9ffe4:	00000000	udf	#0
   0x0000fffff7f9ffe8:	00000000	udf	#0
   0x0000fffff7f9ffec:	00000000	udf	#0
   0x0000fffff7f9fff0:	00000000	udf	#0
   0x0000fffff7f9fff4:	00000000	udf	#0
   0x0000fffff7f9fff8:	00000000	udf	#0
   0x0000fffff7f9fffc:	00000000	udf	#0
End of assembler dump.
