Dump of assembler code from 0xfffff7f9b000 to 0xfffff7f9d000:
   0x0000fffff7f9b000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7f9b004:	910003fd	mov	x29, sp
   0x0000fffff7f9b008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7f9b00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7f9b010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7f9b014:	aa0003f3	mov	x19, x0
   0x0000fffff7f9b018:	aa0103f4	mov	x20, x1
   0x0000fffff7f9b01c:	aa0203f5	mov	x21, x2
   0x0000fffff7f9b020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7f9b024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7f9b028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f9b02c:	f90003e9	str	x9, [sp]
   0x0000fffff7f9b030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7f9b034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7f9b038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7f9b03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f9b040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9b044:	d63f0200	blr	x16
   0x0000fffff7f9b048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7f9b04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7f9b050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7f9b054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7f9b058:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9b05c:	37d800e9	tbnz	w9, #27, 0xfffff7f9b078
   0x0000fffff7f9b060:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f9b064:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b068:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b06c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9b070:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9b074:	1400000e	b	0xfffff7f9b0ac
   0x0000fffff7f9b078:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9b07c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9b080:	aa1303e1	mov	x1, x19
   0x0000fffff7f9b084:	aa1503e2	mov	x2, x21
   0x0000fffff7f9b088:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7f9b08c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9b090:	aa1603e5	mov	x5, x22
   0x0000fffff7f9b094:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7f9b098:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9b09c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9b0a0:	d63f0200	blr	x16
   0x0000fffff7f9b0a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9b0a8:	5400d780	b.eq	0xfffff7f9cb98  // b.none
   0x0000fffff7f9b0ac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9b0b0:	37d800e9	tbnz	w9, #27, 0xfffff7f9b0cc
   0x0000fffff7f9b0b4:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f9b0b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b0bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b0c0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9b0c4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9b0c8:	1400000e	b	0xfffff7f9b100
   0x0000fffff7f9b0cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9b0d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9b0d4:	aa1303e1	mov	x1, x19
   0x0000fffff7f9b0d8:	aa1503e2	mov	x2, x21
   0x0000fffff7f9b0dc:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7f9b0e0:	aa1403e4	mov	x4, x20
   0x0000fffff7f9b0e4:	aa1603e5	mov	x5, x22
   0x0000fffff7f9b0e8:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7f9b0ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9b0f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9b0f4:	d63f0200	blr	x16
   0x0000fffff7f9b0f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9b0fc:	5400d520	b.eq	0xfffff7f9cba0  // b.none
   0x0000fffff7f9b100:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9b104:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9b108:	aa1303e1	mov	x1, x19
   0x0000fffff7f9b10c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9b110:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f9b114:	aa1403e4	mov	x4, x20
   0x0000fffff7f9b118:	aa1603e5	mov	x5, x22
   0x0000fffff7f9b11c:	d2909810	mov	x16, #0x84c0                	// #33984
   0x0000fffff7f9b120:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9b124:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9b128:	d63f0200	blr	x16
   0x0000fffff7f9b12c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9b130:	5400d3c0	b.eq	0xfffff7f9cba8  // b.none
   0x0000fffff7f9b134:	f100041f	cmp	x0, #0x1
   0x0000fffff7f9b138:	5400cfa0	b.eq	0xfffff7f9cb2c  // b.none
   0x0000fffff7f9b13c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9b140:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9b144:	aa1303e1	mov	x1, x19
   0x0000fffff7f9b148:	aa1503e2	mov	x2, x21
   0x0000fffff7f9b14c:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7f9b150:	aa1403e4	mov	x4, x20
   0x0000fffff7f9b154:	aa1603e5	mov	x5, x22
   0x0000fffff7f9b158:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9b15c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9b160:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9b164:	d63f0200	blr	x16
   0x0000fffff7f9b168:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9b16c:	5400d220	b.eq	0xfffff7f9cbb0  // b.none
   0x0000fffff7f9b170:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9b174:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9b178:	aa1303e1	mov	x1, x19
   0x0000fffff7f9b17c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9b180:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7f9b184:	aa1403e4	mov	x4, x20
   0x0000fffff7f9b188:	aa1603e5	mov	x5, x22
   0x0000fffff7f9b18c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9b190:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9b194:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9b198:	d63f0200	blr	x16
   0x0000fffff7f9b19c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9b1a0:	5400d0c0	b.eq	0xfffff7f9cbb8  // b.none
   0x0000fffff7f9b1a4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9b1a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9b1ac:	aa1303e1	mov	x1, x19
   0x0000fffff7f9b1b0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9b1b4:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f9b1b8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9b1bc:	aa1603e5	mov	x5, x22
   0x0000fffff7f9b1c0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9b1c4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9b1c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9b1cc:	d63f0200	blr	x16
   0x0000fffff7f9b1d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9b1d4:	5400cf60	b.eq	0xfffff7f9cbc0  // b.none
   0x0000fffff7f9b1d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9b1dc:	37d806a9	tbnz	w9, #27, 0xfffff7f9b2b0
   0x0000fffff7f9b1e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9b1e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b1e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b1ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b1f0:	540001c1	b.ne	0xfffff7f9b228  // b.any
   0x0000fffff7f9b1f4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9b1f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b1fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b200:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b204:	54000121	b.ne	0xfffff7f9b228  // b.any
   0x0000fffff7f9b208:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9b20c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f9b210:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9b214:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b218:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b21c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9b220:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9b224:	14000030	b	0xfffff7f9b2e4
   0x0000fffff7f9b228:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9b22c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b230:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b234:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b238:	54000120	b.eq	0xfffff7f9b25c  // b.none
   0x0000fffff7f9b23c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9b240:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b244:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b248:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b24c:	54000321	b.ne	0xfffff7f9b2b0  // b.any
   0x0000fffff7f9b250:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9b254:	9e620120	scvtf	d0, x9
   0x0000fffff7f9b258:	14000002	b	0xfffff7f9b260
   0x0000fffff7f9b25c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9b260:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9b264:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b268:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b26c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b270:	54000120	b.eq	0xfffff7f9b294  // b.none
   0x0000fffff7f9b274:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9b278:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b27c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b280:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b284:	54000161	b.ne	0xfffff7f9b2b0  // b.any
   0x0000fffff7f9b288:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9b28c:	9e620121	scvtf	d1, x9
   0x0000fffff7f9b290:	14000002	b	0xfffff7f9b298
   0x0000fffff7f9b294:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9b298:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9b29c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9b2a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b2a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b2a8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9b2ac:	17ffffde	b	0xfffff7f9b224
   0x0000fffff7f9b2b0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9b2b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9b2b8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9b2bc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9b2c0:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f9b2c4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9b2c8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9b2cc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9b2d0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9b2d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9b2d8:	d63f0200	blr	x16
   0x0000fffff7f9b2dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9b2e0:	5400c740	b.eq	0xfffff7f9cbc8  // b.none
   0x0000fffff7f9b2e4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9b2e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9b2ec:	aa1303e1	mov	x1, x19
   0x0000fffff7f9b2f0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9b2f4:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f9b2f8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9b2fc:	aa1603e5	mov	x5, x22
   0x0000fffff7f9b300:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9b304:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9b308:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9b30c:	d63f0200	blr	x16
   0x0000fffff7f9b310:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9b314:	5400c5e0	b.eq	0xfffff7f9cbd0  // b.none
   0x0000fffff7f9b318:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9b31c:	37d806a9	tbnz	w9, #27, 0xfffff7f9b3f0
   0x0000fffff7f9b320:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9b324:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b328:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b32c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b330:	540001c1	b.ne	0xfffff7f9b368  // b.any
   0x0000fffff7f9b334:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9b338:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b33c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b340:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b344:	54000121	b.ne	0xfffff7f9b368  // b.any
   0x0000fffff7f9b348:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9b34c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f9b350:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9b354:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b358:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b35c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9b360:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9b364:	14000030	b	0xfffff7f9b424
   0x0000fffff7f9b368:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9b36c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b370:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b374:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b378:	54000120	b.eq	0xfffff7f9b39c  // b.none
   0x0000fffff7f9b37c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9b380:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b384:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b388:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b38c:	54000321	b.ne	0xfffff7f9b3f0  // b.any
   0x0000fffff7f9b390:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9b394:	9e620120	scvtf	d0, x9
   0x0000fffff7f9b398:	14000002	b	0xfffff7f9b3a0
   0x0000fffff7f9b39c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9b3a0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9b3a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b3a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b3ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b3b0:	54000120	b.eq	0xfffff7f9b3d4  // b.none
   0x0000fffff7f9b3b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9b3b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b3bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b3c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b3c4:	54000161	b.ne	0xfffff7f9b3f0  // b.any
   0x0000fffff7f9b3c8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9b3cc:	9e620121	scvtf	d1, x9
   0x0000fffff7f9b3d0:	14000002	b	0xfffff7f9b3d8
   0x0000fffff7f9b3d4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9b3d8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9b3dc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9b3e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b3e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b3e8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9b3ec:	17ffffde	b	0xfffff7f9b364
   0x0000fffff7f9b3f0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9b3f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9b3f8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9b3fc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9b400:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f9b404:	aa1403e4	mov	x4, x20
   0x0000fffff7f9b408:	aa1603e5	mov	x5, x22
   0x0000fffff7f9b40c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9b410:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9b414:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9b418:	d63f0200	blr	x16
   0x0000fffff7f9b41c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9b420:	5400bdc0	b.eq	0xfffff7f9cbd8  // b.none
   0x0000fffff7f9b424:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9b428:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9b42c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9b430:	aa1503e2	mov	x2, x21
   0x0000fffff7f9b434:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f9b438:	aa1403e4	mov	x4, x20
   0x0000fffff7f9b43c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9b440:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9b444:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9b448:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9b44c:	d63f0200	blr	x16
   0x0000fffff7f9b450:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9b454:	5400bc60	b.eq	0xfffff7f9cbe0  // b.none
   0x0000fffff7f9b458:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9b45c:	37d806a9	tbnz	w9, #27, 0xfffff7f9b530
   0x0000fffff7f9b460:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9b464:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b468:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b46c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b470:	540001c1	b.ne	0xfffff7f9b4a8  // b.any
   0x0000fffff7f9b474:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9b478:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b47c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b480:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b484:	54000121	b.ne	0xfffff7f9b4a8  // b.any
   0x0000fffff7f9b488:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9b48c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f9b490:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9b494:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b498:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b49c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9b4a0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9b4a4:	14000030	b	0xfffff7f9b564
   0x0000fffff7f9b4a8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9b4ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b4b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b4b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b4b8:	54000120	b.eq	0xfffff7f9b4dc  // b.none
   0x0000fffff7f9b4bc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9b4c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b4c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b4c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b4cc:	54000321	b.ne	0xfffff7f9b530  // b.any
   0x0000fffff7f9b4d0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9b4d4:	9e620120	scvtf	d0, x9
   0x0000fffff7f9b4d8:	14000002	b	0xfffff7f9b4e0
   0x0000fffff7f9b4dc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9b4e0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9b4e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b4e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b4ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b4f0:	54000120	b.eq	0xfffff7f9b514  // b.none
   0x0000fffff7f9b4f4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9b4f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b4fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b500:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b504:	54000161	b.ne	0xfffff7f9b530  // b.any
   0x0000fffff7f9b508:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9b50c:	9e620121	scvtf	d1, x9
   0x0000fffff7f9b510:	14000002	b	0xfffff7f9b518
   0x0000fffff7f9b514:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9b518:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9b51c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9b520:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b524:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b528:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9b52c:	17ffffde	b	0xfffff7f9b4a4
   0x0000fffff7f9b530:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9b534:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9b538:	aa1303e1	mov	x1, x19
   0x0000fffff7f9b53c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9b540:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f9b544:	aa1403e4	mov	x4, x20
   0x0000fffff7f9b548:	aa1603e5	mov	x5, x22
   0x0000fffff7f9b54c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9b550:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9b554:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9b558:	d63f0200	blr	x16
   0x0000fffff7f9b55c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9b560:	5400b440	b.eq	0xfffff7f9cbe8  // b.none
   0x0000fffff7f9b564:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9b568:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9b56c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9b570:	aa1503e2	mov	x2, x21
   0x0000fffff7f9b574:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7f9b578:	aa1403e4	mov	x4, x20
   0x0000fffff7f9b57c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9b580:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9b584:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9b588:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9b58c:	d63f0200	blr	x16
   0x0000fffff7f9b590:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9b594:	5400b2e0	b.eq	0xfffff7f9cbf0  // b.none
   0x0000fffff7f9b598:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9b59c:	37d806a9	tbnz	w9, #27, 0xfffff7f9b670
   0x0000fffff7f9b5a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9b5a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b5a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b5ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b5b0:	540001c1	b.ne	0xfffff7f9b5e8  // b.any
   0x0000fffff7f9b5b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9b5b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b5bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b5c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b5c4:	54000121	b.ne	0xfffff7f9b5e8  // b.any
   0x0000fffff7f9b5c8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9b5cc:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f9b5d0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9b5d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b5d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b5dc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9b5e0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9b5e4:	14000030	b	0xfffff7f9b6a4
   0x0000fffff7f9b5e8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9b5ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b5f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b5f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b5f8:	54000120	b.eq	0xfffff7f9b61c  // b.none
   0x0000fffff7f9b5fc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9b600:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b604:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b608:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b60c:	54000321	b.ne	0xfffff7f9b670  // b.any
   0x0000fffff7f9b610:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9b614:	9e620120	scvtf	d0, x9
   0x0000fffff7f9b618:	14000002	b	0xfffff7f9b620
   0x0000fffff7f9b61c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9b620:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9b624:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b628:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b62c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b630:	54000120	b.eq	0xfffff7f9b654  // b.none
   0x0000fffff7f9b634:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9b638:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b63c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b640:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b644:	54000161	b.ne	0xfffff7f9b670  // b.any
   0x0000fffff7f9b648:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9b64c:	9e620121	scvtf	d1, x9
   0x0000fffff7f9b650:	14000002	b	0xfffff7f9b658
   0x0000fffff7f9b654:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9b658:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9b65c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9b660:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b664:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b668:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9b66c:	17ffffde	b	0xfffff7f9b5e4
   0x0000fffff7f9b670:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9b674:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9b678:	aa1303e1	mov	x1, x19
   0x0000fffff7f9b67c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9b680:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7f9b684:	aa1403e4	mov	x4, x20
   0x0000fffff7f9b688:	aa1603e5	mov	x5, x22
   0x0000fffff7f9b68c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9b690:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9b694:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9b698:	d63f0200	blr	x16
   0x0000fffff7f9b69c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9b6a0:	5400aac0	b.eq	0xfffff7f9cbf8  // b.none
   0x0000fffff7f9b6a4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9b6a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9b6ac:	aa1303e1	mov	x1, x19
   0x0000fffff7f9b6b0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9b6b4:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7f9b6b8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9b6bc:	aa1603e5	mov	x5, x22
   0x0000fffff7f9b6c0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9b6c4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9b6c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9b6cc:	d63f0200	blr	x16
   0x0000fffff7f9b6d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9b6d4:	5400a960	b.eq	0xfffff7f9cc00  // b.none
   0x0000fffff7f9b6d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9b6dc:	37d806a9	tbnz	w9, #27, 0xfffff7f9b7b0
   0x0000fffff7f9b6e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9b6e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b6e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b6ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b6f0:	540001c1	b.ne	0xfffff7f9b728  // b.any
   0x0000fffff7f9b6f4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9b6f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b6fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b700:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b704:	54000121	b.ne	0xfffff7f9b728  // b.any
   0x0000fffff7f9b708:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9b70c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f9b710:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9b714:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b718:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b71c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9b720:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9b724:	14000030	b	0xfffff7f9b7e4
   0x0000fffff7f9b728:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9b72c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b730:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b734:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b738:	54000120	b.eq	0xfffff7f9b75c  // b.none
   0x0000fffff7f9b73c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9b740:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b744:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b748:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b74c:	54000321	b.ne	0xfffff7f9b7b0  // b.any
   0x0000fffff7f9b750:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9b754:	9e620120	scvtf	d0, x9
   0x0000fffff7f9b758:	14000002	b	0xfffff7f9b760
   0x0000fffff7f9b75c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9b760:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9b764:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b768:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b76c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b770:	54000120	b.eq	0xfffff7f9b794  // b.none
   0x0000fffff7f9b774:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9b778:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b77c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b780:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b784:	54000161	b.ne	0xfffff7f9b7b0  // b.any
   0x0000fffff7f9b788:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9b78c:	9e620121	scvtf	d1, x9
   0x0000fffff7f9b790:	14000002	b	0xfffff7f9b798
   0x0000fffff7f9b794:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9b798:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9b79c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9b7a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b7a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b7a8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9b7ac:	17ffffde	b	0xfffff7f9b724
   0x0000fffff7f9b7b0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9b7b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9b7b8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9b7bc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9b7c0:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7f9b7c4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9b7c8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9b7cc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9b7d0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9b7d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9b7d8:	d63f0200	blr	x16
   0x0000fffff7f9b7dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9b7e0:	5400a140	b.eq	0xfffff7f9cc08  // b.none
   0x0000fffff7f9b7e4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9b7e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9b7ec:	aa1303e1	mov	x1, x19
   0x0000fffff7f9b7f0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9b7f4:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7f9b7f8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9b7fc:	aa1603e5	mov	x5, x22
   0x0000fffff7f9b800:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9b804:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9b808:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9b80c:	d63f0200	blr	x16
   0x0000fffff7f9b810:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9b814:	54009fe0	b.eq	0xfffff7f9cc10  // b.none
   0x0000fffff7f9b818:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9b81c:	37d806a9	tbnz	w9, #27, 0xfffff7f9b8f0
   0x0000fffff7f9b820:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9b824:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b828:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b82c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b830:	540001c1	b.ne	0xfffff7f9b868  // b.any
   0x0000fffff7f9b834:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9b838:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b83c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b840:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b844:	54000121	b.ne	0xfffff7f9b868  // b.any
   0x0000fffff7f9b848:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9b84c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f9b850:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9b854:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b858:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b85c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9b860:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9b864:	14000030	b	0xfffff7f9b924
   0x0000fffff7f9b868:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9b86c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b870:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b874:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b878:	54000120	b.eq	0xfffff7f9b89c  // b.none
   0x0000fffff7f9b87c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9b880:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b884:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b888:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b88c:	54000321	b.ne	0xfffff7f9b8f0  // b.any
   0x0000fffff7f9b890:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9b894:	9e620120	scvtf	d0, x9
   0x0000fffff7f9b898:	14000002	b	0xfffff7f9b8a0
   0x0000fffff7f9b89c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9b8a0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9b8a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b8a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b8ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b8b0:	54000120	b.eq	0xfffff7f9b8d4  // b.none
   0x0000fffff7f9b8b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9b8b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b8bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b8c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b8c4:	54000161	b.ne	0xfffff7f9b8f0  // b.any
   0x0000fffff7f9b8c8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9b8cc:	9e620121	scvtf	d1, x9
   0x0000fffff7f9b8d0:	14000002	b	0xfffff7f9b8d8
   0x0000fffff7f9b8d4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9b8d8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9b8dc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9b8e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b8e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b8e8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9b8ec:	17ffffde	b	0xfffff7f9b864
   0x0000fffff7f9b8f0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9b8f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9b8f8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9b8fc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9b900:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7f9b904:	aa1403e4	mov	x4, x20
   0x0000fffff7f9b908:	aa1603e5	mov	x5, x22
   0x0000fffff7f9b90c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9b910:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9b914:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9b918:	d63f0200	blr	x16
   0x0000fffff7f9b91c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9b920:	540097c0	b.eq	0xfffff7f9cc18  // b.none
   0x0000fffff7f9b924:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9b928:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9b92c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9b930:	aa1503e2	mov	x2, x21
   0x0000fffff7f9b934:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7f9b938:	aa1403e4	mov	x4, x20
   0x0000fffff7f9b93c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9b940:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9b944:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9b948:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9b94c:	d63f0200	blr	x16
   0x0000fffff7f9b950:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9b954:	54009660	b.eq	0xfffff7f9cc20  // b.none
   0x0000fffff7f9b958:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9b95c:	37d806a9	tbnz	w9, #27, 0xfffff7f9ba30
   0x0000fffff7f9b960:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9b964:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b968:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b96c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b970:	540001c1	b.ne	0xfffff7f9b9a8  // b.any
   0x0000fffff7f9b974:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9b978:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b97c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b980:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b984:	54000121	b.ne	0xfffff7f9b9a8  // b.any
   0x0000fffff7f9b988:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9b98c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f9b990:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9b994:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b998:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b99c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9b9a0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9b9a4:	14000030	b	0xfffff7f9ba64
   0x0000fffff7f9b9a8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9b9ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b9b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b9b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b9b8:	54000120	b.eq	0xfffff7f9b9dc  // b.none
   0x0000fffff7f9b9bc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9b9c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b9c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b9c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b9cc:	54000321	b.ne	0xfffff7f9ba30  // b.any
   0x0000fffff7f9b9d0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9b9d4:	9e620120	scvtf	d0, x9
   0x0000fffff7f9b9d8:	14000002	b	0xfffff7f9b9e0
   0x0000fffff7f9b9dc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9b9e0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9b9e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b9e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b9ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b9f0:	54000120	b.eq	0xfffff7f9ba14  // b.none
   0x0000fffff7f9b9f4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9b9f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b9fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ba00:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ba04:	54000161	b.ne	0xfffff7f9ba30  // b.any
   0x0000fffff7f9ba08:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9ba0c:	9e620121	scvtf	d1, x9
   0x0000fffff7f9ba10:	14000002	b	0xfffff7f9ba18
   0x0000fffff7f9ba14:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9ba18:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9ba1c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9ba20:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9ba24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ba28:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9ba2c:	17ffffde	b	0xfffff7f9b9a4
   0x0000fffff7f9ba30:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9ba34:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ba38:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ba3c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ba40:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7f9ba44:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ba48:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ba4c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9ba50:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9ba54:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ba58:	d63f0200	blr	x16
   0x0000fffff7f9ba5c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ba60:	54008e40	b.eq	0xfffff7f9cc28  // b.none
   0x0000fffff7f9ba64:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9ba68:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ba6c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ba70:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ba74:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7f9ba78:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ba7c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ba80:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9ba84:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9ba88:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ba8c:	d63f0200	blr	x16
   0x0000fffff7f9ba90:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ba94:	54008ce0	b.eq	0xfffff7f9cc30  // b.none
   0x0000fffff7f9ba98:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9ba9c:	37d806a9	tbnz	w9, #27, 0xfffff7f9bb70
   0x0000fffff7f9baa0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9baa4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9baa8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9baac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bab0:	540001c1	b.ne	0xfffff7f9bae8  // b.any
   0x0000fffff7f9bab4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9bab8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9babc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bac0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bac4:	54000121	b.ne	0xfffff7f9bae8  // b.any
   0x0000fffff7f9bac8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9bacc:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f9bad0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9bad4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9bad8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9badc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9bae0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9bae4:	14000030	b	0xfffff7f9bba4
   0x0000fffff7f9bae8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9baec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9baf0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9baf4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9baf8:	54000120	b.eq	0xfffff7f9bb1c  // b.none
   0x0000fffff7f9bafc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9bb00:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9bb04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bb08:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bb0c:	54000321	b.ne	0xfffff7f9bb70  // b.any
   0x0000fffff7f9bb10:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9bb14:	9e620120	scvtf	d0, x9
   0x0000fffff7f9bb18:	14000002	b	0xfffff7f9bb20
   0x0000fffff7f9bb1c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9bb20:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9bb24:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9bb28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bb2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bb30:	54000120	b.eq	0xfffff7f9bb54  // b.none
   0x0000fffff7f9bb34:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9bb38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9bb3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bb40:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bb44:	54000161	b.ne	0xfffff7f9bb70  // b.any
   0x0000fffff7f9bb48:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9bb4c:	9e620121	scvtf	d1, x9
   0x0000fffff7f9bb50:	14000002	b	0xfffff7f9bb58
   0x0000fffff7f9bb54:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9bb58:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9bb5c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9bb60:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9bb64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bb68:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9bb6c:	17ffffde	b	0xfffff7f9bae4
   0x0000fffff7f9bb70:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9bb74:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9bb78:	aa1303e1	mov	x1, x19
   0x0000fffff7f9bb7c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9bb80:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7f9bb84:	aa1403e4	mov	x4, x20
   0x0000fffff7f9bb88:	aa1603e5	mov	x5, x22
   0x0000fffff7f9bb8c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9bb90:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9bb94:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9bb98:	d63f0200	blr	x16
   0x0000fffff7f9bb9c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9bba0:	540084c0	b.eq	0xfffff7f9cc38  // b.none
   0x0000fffff7f9bba4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9bba8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9bbac:	aa1303e1	mov	x1, x19
   0x0000fffff7f9bbb0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9bbb4:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7f9bbb8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9bbbc:	aa1603e5	mov	x5, x22
   0x0000fffff7f9bbc0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9bbc4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9bbc8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9bbcc:	d63f0200	blr	x16
   0x0000fffff7f9bbd0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9bbd4:	54008360	b.eq	0xfffff7f9cc40  // b.none
   0x0000fffff7f9bbd8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9bbdc:	37d806a9	tbnz	w9, #27, 0xfffff7f9bcb0
   0x0000fffff7f9bbe0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9bbe4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9bbe8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bbec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bbf0:	540001c1	b.ne	0xfffff7f9bc28  // b.any
   0x0000fffff7f9bbf4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9bbf8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9bbfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bc00:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bc04:	54000121	b.ne	0xfffff7f9bc28  // b.any
   0x0000fffff7f9bc08:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9bc0c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f9bc10:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9bc14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9bc18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bc1c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9bc20:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9bc24:	14000030	b	0xfffff7f9bce4
   0x0000fffff7f9bc28:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9bc2c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9bc30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bc34:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bc38:	54000120	b.eq	0xfffff7f9bc5c  // b.none
   0x0000fffff7f9bc3c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9bc40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9bc44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bc48:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bc4c:	54000321	b.ne	0xfffff7f9bcb0  // b.any
   0x0000fffff7f9bc50:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9bc54:	9e620120	scvtf	d0, x9
   0x0000fffff7f9bc58:	14000002	b	0xfffff7f9bc60
   0x0000fffff7f9bc5c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9bc60:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9bc64:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9bc68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bc6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bc70:	54000120	b.eq	0xfffff7f9bc94  // b.none
   0x0000fffff7f9bc74:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9bc78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9bc7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bc80:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bc84:	54000161	b.ne	0xfffff7f9bcb0  // b.any
   0x0000fffff7f9bc88:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9bc8c:	9e620121	scvtf	d1, x9
   0x0000fffff7f9bc90:	14000002	b	0xfffff7f9bc98
   0x0000fffff7f9bc94:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9bc98:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9bc9c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9bca0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9bca4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bca8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9bcac:	17ffffde	b	0xfffff7f9bc24
   0x0000fffff7f9bcb0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9bcb4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9bcb8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9bcbc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9bcc0:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7f9bcc4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9bcc8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9bccc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9bcd0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9bcd4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9bcd8:	d63f0200	blr	x16
   0x0000fffff7f9bcdc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9bce0:	54007b40	b.eq	0xfffff7f9cc48  // b.none
   0x0000fffff7f9bce4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9bce8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9bcec:	aa1303e1	mov	x1, x19
   0x0000fffff7f9bcf0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9bcf4:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7f9bcf8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9bcfc:	aa1603e5	mov	x5, x22
   0x0000fffff7f9bd00:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9bd04:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9bd08:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9bd0c:	d63f0200	blr	x16
   0x0000fffff7f9bd10:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9bd14:	540079e0	b.eq	0xfffff7f9cc50  // b.none
   0x0000fffff7f9bd18:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9bd1c:	37d806a9	tbnz	w9, #27, 0xfffff7f9bdf0
   0x0000fffff7f9bd20:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9bd24:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9bd28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bd2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bd30:	540001c1	b.ne	0xfffff7f9bd68  // b.any
   0x0000fffff7f9bd34:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9bd38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9bd3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bd40:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bd44:	54000121	b.ne	0xfffff7f9bd68  // b.any
   0x0000fffff7f9bd48:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9bd4c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f9bd50:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9bd54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9bd58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bd5c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9bd60:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9bd64:	14000030	b	0xfffff7f9be24
   0x0000fffff7f9bd68:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9bd6c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9bd70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bd74:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bd78:	54000120	b.eq	0xfffff7f9bd9c  // b.none
   0x0000fffff7f9bd7c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9bd80:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9bd84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bd88:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bd8c:	54000321	b.ne	0xfffff7f9bdf0  // b.any
   0x0000fffff7f9bd90:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9bd94:	9e620120	scvtf	d0, x9
   0x0000fffff7f9bd98:	14000002	b	0xfffff7f9bda0
   0x0000fffff7f9bd9c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9bda0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9bda4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9bda8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bdac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bdb0:	54000120	b.eq	0xfffff7f9bdd4  // b.none
   0x0000fffff7f9bdb4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9bdb8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9bdbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bdc0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bdc4:	54000161	b.ne	0xfffff7f9bdf0  // b.any
   0x0000fffff7f9bdc8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9bdcc:	9e620121	scvtf	d1, x9
   0x0000fffff7f9bdd0:	14000002	b	0xfffff7f9bdd8
   0x0000fffff7f9bdd4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9bdd8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9bddc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9bde0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9bde4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bde8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9bdec:	17ffffde	b	0xfffff7f9bd64
   0x0000fffff7f9bdf0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9bdf4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9bdf8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9bdfc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9be00:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7f9be04:	aa1403e4	mov	x4, x20
   0x0000fffff7f9be08:	aa1603e5	mov	x5, x22
   0x0000fffff7f9be0c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9be10:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9be14:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9be18:	d63f0200	blr	x16
   0x0000fffff7f9be1c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9be20:	540071c0	b.eq	0xfffff7f9cc58  // b.none
   0x0000fffff7f9be24:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9be28:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9be2c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9be30:	aa1503e2	mov	x2, x21
   0x0000fffff7f9be34:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7f9be38:	aa1403e4	mov	x4, x20
   0x0000fffff7f9be3c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9be40:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9be44:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9be48:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9be4c:	d63f0200	blr	x16
   0x0000fffff7f9be50:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9be54:	54007060	b.eq	0xfffff7f9cc60  // b.none
   0x0000fffff7f9be58:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9be5c:	37d806a9	tbnz	w9, #27, 0xfffff7f9bf30
   0x0000fffff7f9be60:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9be64:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9be68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9be6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9be70:	540001c1	b.ne	0xfffff7f9bea8  // b.any
   0x0000fffff7f9be74:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9be78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9be7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9be80:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9be84:	54000121	b.ne	0xfffff7f9bea8  // b.any
   0x0000fffff7f9be88:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9be8c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f9be90:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9be94:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9be98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9be9c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9bea0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9bea4:	14000030	b	0xfffff7f9bf64
   0x0000fffff7f9bea8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9beac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9beb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9beb4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9beb8:	54000120	b.eq	0xfffff7f9bedc  // b.none
   0x0000fffff7f9bebc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9bec0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9bec4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bec8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9becc:	54000321	b.ne	0xfffff7f9bf30  // b.any
   0x0000fffff7f9bed0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9bed4:	9e620120	scvtf	d0, x9
   0x0000fffff7f9bed8:	14000002	b	0xfffff7f9bee0
   0x0000fffff7f9bedc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9bee0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9bee4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9bee8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9beec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bef0:	54000120	b.eq	0xfffff7f9bf14  // b.none
   0x0000fffff7f9bef4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9bef8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9befc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bf00:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bf04:	54000161	b.ne	0xfffff7f9bf30  // b.any
   0x0000fffff7f9bf08:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9bf0c:	9e620121	scvtf	d1, x9
   0x0000fffff7f9bf10:	14000002	b	0xfffff7f9bf18
   0x0000fffff7f9bf14:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9bf18:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9bf1c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9bf20:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9bf24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bf28:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9bf2c:	17ffffde	b	0xfffff7f9bea4
   0x0000fffff7f9bf30:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9bf34:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9bf38:	aa1303e1	mov	x1, x19
   0x0000fffff7f9bf3c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9bf40:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7f9bf44:	aa1403e4	mov	x4, x20
   0x0000fffff7f9bf48:	aa1603e5	mov	x5, x22
   0x0000fffff7f9bf4c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9bf50:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9bf54:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9bf58:	d63f0200	blr	x16
   0x0000fffff7f9bf5c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9bf60:	54006840	b.eq	0xfffff7f9cc68  // b.none
   0x0000fffff7f9bf64:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9bf68:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9bf6c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9bf70:	aa1503e2	mov	x2, x21
   0x0000fffff7f9bf74:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7f9bf78:	aa1403e4	mov	x4, x20
   0x0000fffff7f9bf7c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9bf80:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9bf84:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9bf88:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9bf8c:	d63f0200	blr	x16
   0x0000fffff7f9bf90:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9bf94:	540066e0	b.eq	0xfffff7f9cc70  // b.none
   0x0000fffff7f9bf98:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9bf9c:	37d806a9	tbnz	w9, #27, 0xfffff7f9c070
   0x0000fffff7f9bfa0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9bfa4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9bfa8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bfac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bfb0:	540001c1	b.ne	0xfffff7f9bfe8  // b.any
   0x0000fffff7f9bfb4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9bfb8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9bfbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bfc0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bfc4:	54000121	b.ne	0xfffff7f9bfe8  // b.any
   0x0000fffff7f9bfc8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9bfcc:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f9bfd0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9bfd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9bfd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bfdc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9bfe0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9bfe4:	14000030	b	0xfffff7f9c0a4
   0x0000fffff7f9bfe8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9bfec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9bff0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bff4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bff8:	54000120	b.eq	0xfffff7f9c01c  // b.none
   0x0000fffff7f9bffc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c000:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c004:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c008:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c00c:	54000321	b.ne	0xfffff7f9c070  // b.any
   0x0000fffff7f9c010:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9c014:	9e620120	scvtf	d0, x9
   0x0000fffff7f9c018:	14000002	b	0xfffff7f9c020
   0x0000fffff7f9c01c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9c020:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9c024:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c028:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c02c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c030:	54000120	b.eq	0xfffff7f9c054  // b.none
   0x0000fffff7f9c034:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9c038:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c03c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c040:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c044:	54000161	b.ne	0xfffff7f9c070  // b.any
   0x0000fffff7f9c048:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9c04c:	9e620121	scvtf	d1, x9
   0x0000fffff7f9c050:	14000002	b	0xfffff7f9c058
   0x0000fffff7f9c054:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9c058:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9c05c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9c060:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c064:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c068:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9c06c:	17ffffde	b	0xfffff7f9bfe4
   0x0000fffff7f9c070:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c074:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c078:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c07c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c080:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7f9c084:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c088:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c08c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9c090:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9c094:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c098:	d63f0200	blr	x16
   0x0000fffff7f9c09c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c0a0:	54005ec0	b.eq	0xfffff7f9cc78  // b.none
   0x0000fffff7f9c0a4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9c0a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c0ac:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c0b0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c0b4:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7f9c0b8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c0bc:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c0c0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9c0c4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c0c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c0cc:	d63f0200	blr	x16
   0x0000fffff7f9c0d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c0d4:	54005d60	b.eq	0xfffff7f9cc80  // b.none
   0x0000fffff7f9c0d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c0dc:	37d806a9	tbnz	w9, #27, 0xfffff7f9c1b0
   0x0000fffff7f9c0e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c0e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c0e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c0ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c0f0:	540001c1	b.ne	0xfffff7f9c128  // b.any
   0x0000fffff7f9c0f4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9c0f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c0fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c100:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c104:	54000121	b.ne	0xfffff7f9c128  // b.any
   0x0000fffff7f9c108:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9c10c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f9c110:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9c114:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c118:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c11c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9c120:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9c124:	14000030	b	0xfffff7f9c1e4
   0x0000fffff7f9c128:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c12c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c130:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c134:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c138:	54000120	b.eq	0xfffff7f9c15c  // b.none
   0x0000fffff7f9c13c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c140:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c144:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c148:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c14c:	54000321	b.ne	0xfffff7f9c1b0  // b.any
   0x0000fffff7f9c150:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9c154:	9e620120	scvtf	d0, x9
   0x0000fffff7f9c158:	14000002	b	0xfffff7f9c160
   0x0000fffff7f9c15c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9c160:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9c164:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c168:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c16c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c170:	54000120	b.eq	0xfffff7f9c194  // b.none
   0x0000fffff7f9c174:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9c178:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c17c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c180:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c184:	54000161	b.ne	0xfffff7f9c1b0  // b.any
   0x0000fffff7f9c188:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9c18c:	9e620121	scvtf	d1, x9
   0x0000fffff7f9c190:	14000002	b	0xfffff7f9c198
   0x0000fffff7f9c194:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9c198:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9c19c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9c1a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c1a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c1a8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9c1ac:	17ffffde	b	0xfffff7f9c124
   0x0000fffff7f9c1b0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c1b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c1b8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c1bc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c1c0:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7f9c1c4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c1c8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c1cc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9c1d0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9c1d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c1d8:	d63f0200	blr	x16
   0x0000fffff7f9c1dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c1e0:	54005540	b.eq	0xfffff7f9cc88  // b.none
   0x0000fffff7f9c1e4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9c1e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c1ec:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c1f0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c1f4:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7f9c1f8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c1fc:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c200:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9c204:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c208:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c20c:	d63f0200	blr	x16
   0x0000fffff7f9c210:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c214:	540053e0	b.eq	0xfffff7f9cc90  // b.none
   0x0000fffff7f9c218:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c21c:	37d806a9	tbnz	w9, #27, 0xfffff7f9c2f0
   0x0000fffff7f9c220:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c224:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c228:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c22c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c230:	540001c1	b.ne	0xfffff7f9c268  // b.any
   0x0000fffff7f9c234:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9c238:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c23c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c240:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c244:	54000121	b.ne	0xfffff7f9c268  // b.any
   0x0000fffff7f9c248:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9c24c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f9c250:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9c254:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c258:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c25c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9c260:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9c264:	14000030	b	0xfffff7f9c324
   0x0000fffff7f9c268:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c26c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c270:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c274:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c278:	54000120	b.eq	0xfffff7f9c29c  // b.none
   0x0000fffff7f9c27c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c280:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c284:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c288:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c28c:	54000321	b.ne	0xfffff7f9c2f0  // b.any
   0x0000fffff7f9c290:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9c294:	9e620120	scvtf	d0, x9
   0x0000fffff7f9c298:	14000002	b	0xfffff7f9c2a0
   0x0000fffff7f9c29c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9c2a0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9c2a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c2a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c2ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c2b0:	54000120	b.eq	0xfffff7f9c2d4  // b.none
   0x0000fffff7f9c2b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9c2b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c2bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c2c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c2c4:	54000161	b.ne	0xfffff7f9c2f0  // b.any
   0x0000fffff7f9c2c8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9c2cc:	9e620121	scvtf	d1, x9
   0x0000fffff7f9c2d0:	14000002	b	0xfffff7f9c2d8
   0x0000fffff7f9c2d4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9c2d8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9c2dc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9c2e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c2e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c2e8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9c2ec:	17ffffde	b	0xfffff7f9c264
   0x0000fffff7f9c2f0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c2f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c2f8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c2fc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c300:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7f9c304:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c308:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c30c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9c310:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9c314:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c318:	d63f0200	blr	x16
   0x0000fffff7f9c31c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c320:	54004bc0	b.eq	0xfffff7f9cc98  // b.none
   0x0000fffff7f9c324:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9c328:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c32c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c330:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c334:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7f9c338:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c33c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c340:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9c344:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c348:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c34c:	d63f0200	blr	x16
   0x0000fffff7f9c350:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c354:	54004a60	b.eq	0xfffff7f9cca0  // b.none
   0x0000fffff7f9c358:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c35c:	37d806a9	tbnz	w9, #27, 0xfffff7f9c430
   0x0000fffff7f9c360:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c364:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c368:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c36c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c370:	540001c1	b.ne	0xfffff7f9c3a8  // b.any
   0x0000fffff7f9c374:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9c378:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c37c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c380:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c384:	54000121	b.ne	0xfffff7f9c3a8  // b.any
   0x0000fffff7f9c388:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9c38c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f9c390:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9c394:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c398:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c39c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9c3a0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9c3a4:	14000030	b	0xfffff7f9c464
   0x0000fffff7f9c3a8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c3ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c3b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c3b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c3b8:	54000120	b.eq	0xfffff7f9c3dc  // b.none
   0x0000fffff7f9c3bc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c3c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c3c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c3c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c3cc:	54000321	b.ne	0xfffff7f9c430  // b.any
   0x0000fffff7f9c3d0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9c3d4:	9e620120	scvtf	d0, x9
   0x0000fffff7f9c3d8:	14000002	b	0xfffff7f9c3e0
   0x0000fffff7f9c3dc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9c3e0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9c3e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c3e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c3ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c3f0:	54000120	b.eq	0xfffff7f9c414  // b.none
   0x0000fffff7f9c3f4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9c3f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c3fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c400:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c404:	54000161	b.ne	0xfffff7f9c430  // b.any
   0x0000fffff7f9c408:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9c40c:	9e620121	scvtf	d1, x9
   0x0000fffff7f9c410:	14000002	b	0xfffff7f9c418
   0x0000fffff7f9c414:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9c418:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9c41c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9c420:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c424:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c428:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9c42c:	17ffffde	b	0xfffff7f9c3a4
   0x0000fffff7f9c430:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c434:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c438:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c43c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c440:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7f9c444:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c448:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c44c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9c450:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9c454:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c458:	d63f0200	blr	x16
   0x0000fffff7f9c45c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c460:	54004240	b.eq	0xfffff7f9cca8  // b.none
   0x0000fffff7f9c464:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9c468:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c46c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c470:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c474:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7f9c478:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c47c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c480:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9c484:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c488:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c48c:	d63f0200	blr	x16
   0x0000fffff7f9c490:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c494:	540040e0	b.eq	0xfffff7f9ccb0  // b.none
   0x0000fffff7f9c498:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c49c:	37d806a9	tbnz	w9, #27, 0xfffff7f9c570
   0x0000fffff7f9c4a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c4a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c4a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c4ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c4b0:	540001c1	b.ne	0xfffff7f9c4e8  // b.any
   0x0000fffff7f9c4b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9c4b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c4bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c4c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c4c4:	54000121	b.ne	0xfffff7f9c4e8  // b.any
   0x0000fffff7f9c4c8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9c4cc:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f9c4d0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9c4d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c4d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c4dc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9c4e0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9c4e4:	14000030	b	0xfffff7f9c5a4
   0x0000fffff7f9c4e8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c4ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c4f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c4f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c4f8:	54000120	b.eq	0xfffff7f9c51c  // b.none
   0x0000fffff7f9c4fc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c500:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c504:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c508:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c50c:	54000321	b.ne	0xfffff7f9c570  // b.any
   0x0000fffff7f9c510:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9c514:	9e620120	scvtf	d0, x9
   0x0000fffff7f9c518:	14000002	b	0xfffff7f9c520
   0x0000fffff7f9c51c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9c520:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9c524:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c528:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c52c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c530:	54000120	b.eq	0xfffff7f9c554  // b.none
   0x0000fffff7f9c534:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9c538:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c53c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c540:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c544:	54000161	b.ne	0xfffff7f9c570  // b.any
   0x0000fffff7f9c548:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9c54c:	9e620121	scvtf	d1, x9
   0x0000fffff7f9c550:	14000002	b	0xfffff7f9c558
   0x0000fffff7f9c554:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9c558:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9c55c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9c560:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c564:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c568:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9c56c:	17ffffde	b	0xfffff7f9c4e4
   0x0000fffff7f9c570:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c574:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c578:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c57c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c580:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7f9c584:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c588:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c58c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9c590:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9c594:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c598:	d63f0200	blr	x16
   0x0000fffff7f9c59c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c5a0:	540038c0	b.eq	0xfffff7f9ccb8  // b.none
   0x0000fffff7f9c5a4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9c5a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c5ac:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c5b0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c5b4:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7f9c5b8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c5bc:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c5c0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9c5c4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c5c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c5cc:	d63f0200	blr	x16
   0x0000fffff7f9c5d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c5d4:	54003760	b.eq	0xfffff7f9ccc0  // b.none
   0x0000fffff7f9c5d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c5dc:	37d806a9	tbnz	w9, #27, 0xfffff7f9c6b0
   0x0000fffff7f9c5e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c5e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c5e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c5ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c5f0:	540001c1	b.ne	0xfffff7f9c628  // b.any
   0x0000fffff7f9c5f4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9c5f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c5fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c600:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c604:	54000121	b.ne	0xfffff7f9c628  // b.any
   0x0000fffff7f9c608:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9c60c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f9c610:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9c614:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c618:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c61c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9c620:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9c624:	14000030	b	0xfffff7f9c6e4
   0x0000fffff7f9c628:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c62c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c630:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c634:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c638:	54000120	b.eq	0xfffff7f9c65c  // b.none
   0x0000fffff7f9c63c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c640:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c644:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c648:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c64c:	54000321	b.ne	0xfffff7f9c6b0  // b.any
   0x0000fffff7f9c650:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9c654:	9e620120	scvtf	d0, x9
   0x0000fffff7f9c658:	14000002	b	0xfffff7f9c660
   0x0000fffff7f9c65c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9c660:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9c664:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c668:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c66c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c670:	54000120	b.eq	0xfffff7f9c694  // b.none
   0x0000fffff7f9c674:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9c678:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c67c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c680:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c684:	54000161	b.ne	0xfffff7f9c6b0  // b.any
   0x0000fffff7f9c688:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9c68c:	9e620121	scvtf	d1, x9
   0x0000fffff7f9c690:	14000002	b	0xfffff7f9c698
   0x0000fffff7f9c694:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9c698:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9c69c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9c6a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c6a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c6a8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9c6ac:	17ffffde	b	0xfffff7f9c624
   0x0000fffff7f9c6b0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c6b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c6b8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c6bc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c6c0:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7f9c6c4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c6c8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c6cc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9c6d0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9c6d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c6d8:	d63f0200	blr	x16
   0x0000fffff7f9c6dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c6e0:	54002f40	b.eq	0xfffff7f9ccc8  // b.none
   0x0000fffff7f9c6e4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9c6e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c6ec:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c6f0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c6f4:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7f9c6f8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c6fc:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c700:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9c704:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c708:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c70c:	d63f0200	blr	x16
   0x0000fffff7f9c710:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c714:	54002de0	b.eq	0xfffff7f9ccd0  // b.none
   0x0000fffff7f9c718:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c71c:	37d806a9	tbnz	w9, #27, 0xfffff7f9c7f0
   0x0000fffff7f9c720:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c724:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c728:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c72c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c730:	540001c1	b.ne	0xfffff7f9c768  // b.any
   0x0000fffff7f9c734:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9c738:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c73c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c740:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c744:	54000121	b.ne	0xfffff7f9c768  // b.any
   0x0000fffff7f9c748:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9c74c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f9c750:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9c754:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c758:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c75c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9c760:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9c764:	14000030	b	0xfffff7f9c824
   0x0000fffff7f9c768:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c76c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c770:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c774:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c778:	54000120	b.eq	0xfffff7f9c79c  // b.none
   0x0000fffff7f9c77c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c780:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c784:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c788:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c78c:	54000321	b.ne	0xfffff7f9c7f0  // b.any
   0x0000fffff7f9c790:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9c794:	9e620120	scvtf	d0, x9
   0x0000fffff7f9c798:	14000002	b	0xfffff7f9c7a0
   0x0000fffff7f9c79c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9c7a0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9c7a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c7a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c7ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c7b0:	54000120	b.eq	0xfffff7f9c7d4  // b.none
   0x0000fffff7f9c7b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9c7b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c7bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c7c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c7c4:	54000161	b.ne	0xfffff7f9c7f0  // b.any
   0x0000fffff7f9c7c8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9c7cc:	9e620121	scvtf	d1, x9
   0x0000fffff7f9c7d0:	14000002	b	0xfffff7f9c7d8
   0x0000fffff7f9c7d4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9c7d8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9c7dc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9c7e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c7e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c7e8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9c7ec:	17ffffde	b	0xfffff7f9c764
   0x0000fffff7f9c7f0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c7f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c7f8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c7fc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c800:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7f9c804:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c808:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c80c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9c810:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9c814:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c818:	d63f0200	blr	x16
   0x0000fffff7f9c81c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c820:	540025c0	b.eq	0xfffff7f9ccd8  // b.none
   0x0000fffff7f9c824:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9c828:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c82c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c830:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c834:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7f9c838:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c83c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c840:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9c844:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c848:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c84c:	d63f0200	blr	x16
   0x0000fffff7f9c850:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c854:	54002460	b.eq	0xfffff7f9cce0  // b.none
   0x0000fffff7f9c858:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c85c:	37d806a9	tbnz	w9, #27, 0xfffff7f9c930
   0x0000fffff7f9c860:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c864:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c868:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c86c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c870:	540001c1	b.ne	0xfffff7f9c8a8  // b.any
   0x0000fffff7f9c874:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9c878:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c87c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c880:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c884:	54000121	b.ne	0xfffff7f9c8a8  // b.any
   0x0000fffff7f9c888:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9c88c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f9c890:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9c894:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c898:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c89c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9c8a0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9c8a4:	14000030	b	0xfffff7f9c964
   0x0000fffff7f9c8a8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c8ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c8b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c8b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c8b8:	54000120	b.eq	0xfffff7f9c8dc  // b.none
   0x0000fffff7f9c8bc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c8c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c8c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c8c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c8cc:	54000321	b.ne	0xfffff7f9c930  // b.any
   0x0000fffff7f9c8d0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9c8d4:	9e620120	scvtf	d0, x9
   0x0000fffff7f9c8d8:	14000002	b	0xfffff7f9c8e0
   0x0000fffff7f9c8dc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9c8e0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9c8e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c8e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c8ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c8f0:	54000120	b.eq	0xfffff7f9c914  // b.none
   0x0000fffff7f9c8f4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9c8f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c8fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c900:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c904:	54000161	b.ne	0xfffff7f9c930  // b.any
   0x0000fffff7f9c908:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9c90c:	9e620121	scvtf	d1, x9
   0x0000fffff7f9c910:	14000002	b	0xfffff7f9c918
   0x0000fffff7f9c914:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9c918:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9c91c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9c920:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c924:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c928:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9c92c:	17ffffde	b	0xfffff7f9c8a4
   0x0000fffff7f9c930:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c934:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c938:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c93c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c940:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7f9c944:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c948:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c94c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9c950:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9c954:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c958:	d63f0200	blr	x16
   0x0000fffff7f9c95c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c960:	54001c40	b.eq	0xfffff7f9cce8  // b.none
   0x0000fffff7f9c964:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9c968:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c96c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c970:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c974:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7f9c978:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c97c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c980:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9c984:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c988:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c98c:	d63f0200	blr	x16
   0x0000fffff7f9c990:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c994:	54001ae0	b.eq	0xfffff7f9ccf0  // b.none
   0x0000fffff7f9c998:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c99c:	37d806a9	tbnz	w9, #27, 0xfffff7f9ca70
   0x0000fffff7f9c9a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c9a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c9a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c9ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c9b0:	540001c1	b.ne	0xfffff7f9c9e8  // b.any
   0x0000fffff7f9c9b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9c9b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c9bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c9c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c9c4:	54000121	b.ne	0xfffff7f9c9e8  // b.any
   0x0000fffff7f9c9c8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9c9cc:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f9c9d0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9c9d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c9d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c9dc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9c9e0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9c9e4:	14000030	b	0xfffff7f9caa4
   0x0000fffff7f9c9e8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c9ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c9f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c9f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c9f8:	54000120	b.eq	0xfffff7f9ca1c  // b.none
   0x0000fffff7f9c9fc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9ca00:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ca04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ca08:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ca0c:	54000321	b.ne	0xfffff7f9ca70  // b.any
   0x0000fffff7f9ca10:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9ca14:	9e620120	scvtf	d0, x9
   0x0000fffff7f9ca18:	14000002	b	0xfffff7f9ca20
   0x0000fffff7f9ca1c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9ca20:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9ca24:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9ca28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ca2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ca30:	54000120	b.eq	0xfffff7f9ca54  // b.none
   0x0000fffff7f9ca34:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9ca38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ca3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ca40:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ca44:	54000161	b.ne	0xfffff7f9ca70  // b.any
   0x0000fffff7f9ca48:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9ca4c:	9e620121	scvtf	d1, x9
   0x0000fffff7f9ca50:	14000002	b	0xfffff7f9ca58
   0x0000fffff7f9ca54:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7f9ca58:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9ca5c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9ca60:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9ca64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ca68:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9ca6c:	17ffffde	b	0xfffff7f9c9e4
   0x0000fffff7f9ca70:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9ca74:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ca78:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ca7c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ca80:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7f9ca84:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ca88:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ca8c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9ca90:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9ca94:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ca98:	d63f0200	blr	x16
   0x0000fffff7f9ca9c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9caa0:	540012c0	b.eq	0xfffff7f9ccf8  // b.none
   0x0000fffff7f9caa4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9caa8:	37d80269	tbnz	w9, #27, 0xfffff7f9caf4
   0x0000fffff7f9caac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9cab0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9cab4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9cab8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9cabc:	540001c1	b.ne	0xfffff7f9caf4  // b.any
   0x0000fffff7f9cac0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9cac4:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7f9cac8:	8b0a012b	add	x11, x9, x10
   0x0000fffff7f9cacc:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f9cad0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9cad4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9cad8:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f9cadc:	aa0b03e9	mov	x9, x11
   0x0000fffff7f9cae0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9cae4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9cae8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9caec:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9caf0:	1400000e	b	0xfffff7f9cb28
   0x0000fffff7f9caf4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9caf8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9cafc:	aa1303e1	mov	x1, x19
   0x0000fffff7f9cb00:	aa1503e2	mov	x2, x21
   0x0000fffff7f9cb04:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7f9cb08:	aa1403e4	mov	x4, x20
   0x0000fffff7f9cb0c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9cb10:	d2916810	mov	x16, #0x8b40                	// #35648
   0x0000fffff7f9cb14:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9cb18:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9cb1c:	d63f0200	blr	x16
   0x0000fffff7f9cb20:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9cb24:	54000ee0	b.eq	0xfffff7f9cd00  // b.none
   0x0000fffff7f9cb28:	17fff976	b	0xfffff7f9b100
   0x0000fffff7f9cb2c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9cb30:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9cb34:	aa1303e1	mov	x1, x19
   0x0000fffff7f9cb38:	aa1503e2	mov	x2, x21
   0x0000fffff7f9cb3c:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7f9cb40:	aa1403e4	mov	x4, x20
   0x0000fffff7f9cb44:	aa1603e5	mov	x5, x22
   0x0000fffff7f9cb48:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7f9cb4c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9cb50:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9cb54:	d63f0200	blr	x16
   0x0000fffff7f9cb58:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f9cb5c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f9cb60:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f9cb64:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f9cb68:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f9cb6c:	d65f03c0	ret
   0x0000fffff7f9cb70:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9cb74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9cb78:	b900028a	str	w10, [x20]
   0x0000fffff7f9cb7c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f9cb80:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f9cb84:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f9cb88:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f9cb8c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f9cb90:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f9cb94:	d65f03c0	ret
   0x0000fffff7f9cb98:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f9cb9c:	17fffff5	b	0xfffff7f9cb70
   0x0000fffff7f9cba0:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f9cba4:	17fffff3	b	0xfffff7f9cb70
   0x0000fffff7f9cba8:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f9cbac:	17fffff1	b	0xfffff7f9cb70
   0x0000fffff7f9cbb0:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f9cbb4:	17ffffef	b	0xfffff7f9cb70
   0x0000fffff7f9cbb8:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f9cbbc:	17ffffed	b	0xfffff7f9cb70
   0x0000fffff7f9cbc0:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f9cbc4:	17ffffeb	b	0xfffff7f9cb70
   0x0000fffff7f9cbc8:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f9cbcc:	17ffffe9	b	0xfffff7f9cb70
   0x0000fffff7f9cbd0:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f9cbd4:	17ffffe7	b	0xfffff7f9cb70
   0x0000fffff7f9cbd8:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f9cbdc:	17ffffe5	b	0xfffff7f9cb70
   0x0000fffff7f9cbe0:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f9cbe4:	17ffffe3	b	0xfffff7f9cb70
   0x0000fffff7f9cbe8:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7f9cbec:	17ffffe1	b	0xfffff7f9cb70
   0x0000fffff7f9cbf0:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7f9cbf4:	17ffffdf	b	0xfffff7f9cb70
   0x0000fffff7f9cbf8:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7f9cbfc:	17ffffdd	b	0xfffff7f9cb70
   0x0000fffff7f9cc00:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7f9cc04:	17ffffdb	b	0xfffff7f9cb70
   0x0000fffff7f9cc08:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7f9cc0c:	17ffffd9	b	0xfffff7f9cb70
   0x0000fffff7f9cc10:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7f9cc14:	17ffffd7	b	0xfffff7f9cb70
   0x0000fffff7f9cc18:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7f9cc1c:	17ffffd5	b	0xfffff7f9cb70
   0x0000fffff7f9cc20:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7f9cc24:	17ffffd3	b	0xfffff7f9cb70
   0x0000fffff7f9cc28:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7f9cc2c:	17ffffd1	b	0xfffff7f9cb70
   0x0000fffff7f9cc30:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7f9cc34:	17ffffcf	b	0xfffff7f9cb70
   0x0000fffff7f9cc38:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7f9cc3c:	17ffffcd	b	0xfffff7f9cb70
   0x0000fffff7f9cc40:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7f9cc44:	17ffffcb	b	0xfffff7f9cb70
   0x0000fffff7f9cc48:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7f9cc4c:	17ffffc9	b	0xfffff7f9cb70
   0x0000fffff7f9cc50:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7f9cc54:	17ffffc7	b	0xfffff7f9cb70
   0x0000fffff7f9cc58:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7f9cc5c:	17ffffc5	b	0xfffff7f9cb70
   0x0000fffff7f9cc60:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7f9cc64:	17ffffc3	b	0xfffff7f9cb70
   0x0000fffff7f9cc68:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7f9cc6c:	17ffffc1	b	0xfffff7f9cb70
   0x0000fffff7f9cc70:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7f9cc74:	17ffffbf	b	0xfffff7f9cb70
   0x0000fffff7f9cc78:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7f9cc7c:	17ffffbd	b	0xfffff7f9cb70
   0x0000fffff7f9cc80:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7f9cc84:	17ffffbb	b	0xfffff7f9cb70
   0x0000fffff7f9cc88:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7f9cc8c:	17ffffb9	b	0xfffff7f9cb70
   0x0000fffff7f9cc90:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7f9cc94:	17ffffb7	b	0xfffff7f9cb70
   0x0000fffff7f9cc98:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7f9cc9c:	17ffffb5	b	0xfffff7f9cb70
   0x0000fffff7f9cca0:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7f9cca4:	17ffffb3	b	0xfffff7f9cb70
   0x0000fffff7f9cca8:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7f9ccac:	17ffffb1	b	0xfffff7f9cb70
   0x0000fffff7f9ccb0:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7f9ccb4:	17ffffaf	b	0xfffff7f9cb70
   0x0000fffff7f9ccb8:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7f9ccbc:	17ffffad	b	0xfffff7f9cb70
   0x0000fffff7f9ccc0:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7f9ccc4:	17ffffab	b	0xfffff7f9cb70
   0x0000fffff7f9ccc8:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7f9cccc:	17ffffa9	b	0xfffff7f9cb70
   0x0000fffff7f9ccd0:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7f9ccd4:	17ffffa7	b	0xfffff7f9cb70
   0x0000fffff7f9ccd8:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7f9ccdc:	17ffffa5	b	0xfffff7f9cb70
   0x0000fffff7f9cce0:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7f9cce4:	17ffffa3	b	0xfffff7f9cb70
   0x0000fffff7f9cce8:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7f9ccec:	17ffffa1	b	0xfffff7f9cb70
   0x0000fffff7f9ccf0:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7f9ccf4:	17ffff9f	b	0xfffff7f9cb70
   0x0000fffff7f9ccf8:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7f9ccfc:	17ffff9d	b	0xfffff7f9cb70
   0x0000fffff7f9cd00:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7f9cd04:	17ffff9b	b	0xfffff7f9cb70
   0x0000fffff7f9cd08:	00000000	udf	#0
   0x0000fffff7f9cd0c:	00000000	udf	#0
   0x0000fffff7f9cd10:	00000000	udf	#0
   0x0000fffff7f9cd14:	00000000	udf	#0
   0x0000fffff7f9cd18:	00000000	udf	#0
   0x0000fffff7f9cd1c:	00000000	udf	#0
   0x0000fffff7f9cd20:	00000000	udf	#0
   0x0000fffff7f9cd24:	00000000	udf	#0
   0x0000fffff7f9cd28:	00000000	udf	#0
   0x0000fffff7f9cd2c:	00000000	udf	#0
   0x0000fffff7f9cd30:	00000000	udf	#0
   0x0000fffff7f9cd34:	00000000	udf	#0
   0x0000fffff7f9cd38:	00000000	udf	#0
   0x0000fffff7f9cd3c:	00000000	udf	#0
   0x0000fffff7f9cd40:	00000000	udf	#0
   0x0000fffff7f9cd44:	00000000	udf	#0
   0x0000fffff7f9cd48:	00000000	udf	#0
   0x0000fffff7f9cd4c:	00000000	udf	#0
   0x0000fffff7f9cd50:	00000000	udf	#0
   0x0000fffff7f9cd54:	00000000	udf	#0
   0x0000fffff7f9cd58:	00000000	udf	#0
   0x0000fffff7f9cd5c:	00000000	udf	#0
   0x0000fffff7f9cd60:	00000000	udf	#0
   0x0000fffff7f9cd64:	00000000	udf	#0
   0x0000fffff7f9cd68:	00000000	udf	#0
   0x0000fffff7f9cd6c:	00000000	udf	#0
   0x0000fffff7f9cd70:	00000000	udf	#0
   0x0000fffff7f9cd74:	00000000	udf	#0
   0x0000fffff7f9cd78:	00000000	udf	#0
   0x0000fffff7f9cd7c:	00000000	udf	#0
   0x0000fffff7f9cd80:	00000000	udf	#0
   0x0000fffff7f9cd84:	00000000	udf	#0
   0x0000fffff7f9cd88:	00000000	udf	#0
   0x0000fffff7f9cd8c:	00000000	udf	#0
   0x0000fffff7f9cd90:	00000000	udf	#0
   0x0000fffff7f9cd94:	00000000	udf	#0
   0x0000fffff7f9cd98:	00000000	udf	#0
   0x0000fffff7f9cd9c:	00000000	udf	#0
   0x0000fffff7f9cda0:	00000000	udf	#0
   0x0000fffff7f9cda4:	00000000	udf	#0
   0x0000fffff7f9cda8:	00000000	udf	#0
   0x0000fffff7f9cdac:	00000000	udf	#0
   0x0000fffff7f9cdb0:	00000000	udf	#0
   0x0000fffff7f9cdb4:	00000000	udf	#0
   0x0000fffff7f9cdb8:	00000000	udf	#0
   0x0000fffff7f9cdbc:	00000000	udf	#0
   0x0000fffff7f9cdc0:	00000000	udf	#0
   0x0000fffff7f9cdc4:	00000000	udf	#0
   0x0000fffff7f9cdc8:	00000000	udf	#0
   0x0000fffff7f9cdcc:	00000000	udf	#0
   0x0000fffff7f9cdd0:	00000000	udf	#0
   0x0000fffff7f9cdd4:	00000000	udf	#0
   0x0000fffff7f9cdd8:	00000000	udf	#0
   0x0000fffff7f9cddc:	00000000	udf	#0
   0x0000fffff7f9cde0:	00000000	udf	#0
   0x0000fffff7f9cde4:	00000000	udf	#0
   0x0000fffff7f9cde8:	00000000	udf	#0
   0x0000fffff7f9cdec:	00000000	udf	#0
   0x0000fffff7f9cdf0:	00000000	udf	#0
   0x0000fffff7f9cdf4:	00000000	udf	#0
   0x0000fffff7f9cdf8:	00000000	udf	#0
   0x0000fffff7f9cdfc:	00000000	udf	#0
   0x0000fffff7f9ce00:	00000000	udf	#0
   0x0000fffff7f9ce04:	00000000	udf	#0
   0x0000fffff7f9ce08:	00000000	udf	#0
   0x0000fffff7f9ce0c:	00000000	udf	#0
   0x0000fffff7f9ce10:	00000000	udf	#0
   0x0000fffff7f9ce14:	00000000	udf	#0
   0x0000fffff7f9ce18:	00000000	udf	#0
   0x0000fffff7f9ce1c:	00000000	udf	#0
   0x0000fffff7f9ce20:	00000000	udf	#0
   0x0000fffff7f9ce24:	00000000	udf	#0
   0x0000fffff7f9ce28:	00000000	udf	#0
   0x0000fffff7f9ce2c:	00000000	udf	#0
   0x0000fffff7f9ce30:	00000000	udf	#0
   0x0000fffff7f9ce34:	00000000	udf	#0
   0x0000fffff7f9ce38:	00000000	udf	#0
   0x0000fffff7f9ce3c:	00000000	udf	#0
   0x0000fffff7f9ce40:	00000000	udf	#0
   0x0000fffff7f9ce44:	00000000	udf	#0
   0x0000fffff7f9ce48:	00000000	udf	#0
   0x0000fffff7f9ce4c:	00000000	udf	#0
   0x0000fffff7f9ce50:	00000000	udf	#0
   0x0000fffff7f9ce54:	00000000	udf	#0
   0x0000fffff7f9ce58:	00000000	udf	#0
   0x0000fffff7f9ce5c:	00000000	udf	#0
   0x0000fffff7f9ce60:	00000000	udf	#0
   0x0000fffff7f9ce64:	00000000	udf	#0
   0x0000fffff7f9ce68:	00000000	udf	#0
   0x0000fffff7f9ce6c:	00000000	udf	#0
   0x0000fffff7f9ce70:	00000000	udf	#0
   0x0000fffff7f9ce74:	00000000	udf	#0
   0x0000fffff7f9ce78:	00000000	udf	#0
   0x0000fffff7f9ce7c:	00000000	udf	#0
   0x0000fffff7f9ce80:	00000000	udf	#0
   0x0000fffff7f9ce84:	00000000	udf	#0
   0x0000fffff7f9ce88:	00000000	udf	#0
   0x0000fffff7f9ce8c:	00000000	udf	#0
   0x0000fffff7f9ce90:	00000000	udf	#0
   0x0000fffff7f9ce94:	00000000	udf	#0
   0x0000fffff7f9ce98:	00000000	udf	#0
   0x0000fffff7f9ce9c:	00000000	udf	#0
   0x0000fffff7f9cea0:	00000000	udf	#0
   0x0000fffff7f9cea4:	00000000	udf	#0
   0x0000fffff7f9cea8:	00000000	udf	#0
   0x0000fffff7f9ceac:	00000000	udf	#0
   0x0000fffff7f9ceb0:	00000000	udf	#0
   0x0000fffff7f9ceb4:	00000000	udf	#0
   0x0000fffff7f9ceb8:	00000000	udf	#0
   0x0000fffff7f9cebc:	00000000	udf	#0
   0x0000fffff7f9cec0:	00000000	udf	#0
   0x0000fffff7f9cec4:	00000000	udf	#0
   0x0000fffff7f9cec8:	00000000	udf	#0
   0x0000fffff7f9cecc:	00000000	udf	#0
   0x0000fffff7f9ced0:	00000000	udf	#0
   0x0000fffff7f9ced4:	00000000	udf	#0
   0x0000fffff7f9ced8:	00000000	udf	#0
   0x0000fffff7f9cedc:	00000000	udf	#0
   0x0000fffff7f9cee0:	00000000	udf	#0
   0x0000fffff7f9cee4:	00000000	udf	#0
   0x0000fffff7f9cee8:	00000000	udf	#0
   0x0000fffff7f9ceec:	00000000	udf	#0
   0x0000fffff7f9cef0:	00000000	udf	#0
   0x0000fffff7f9cef4:	00000000	udf	#0
   0x0000fffff7f9cef8:	00000000	udf	#0
   0x0000fffff7f9cefc:	00000000	udf	#0
   0x0000fffff7f9cf00:	00000000	udf	#0
   0x0000fffff7f9cf04:	00000000	udf	#0
   0x0000fffff7f9cf08:	00000000	udf	#0
   0x0000fffff7f9cf0c:	00000000	udf	#0
   0x0000fffff7f9cf10:	00000000	udf	#0
   0x0000fffff7f9cf14:	00000000	udf	#0
   0x0000fffff7f9cf18:	00000000	udf	#0
   0x0000fffff7f9cf1c:	00000000	udf	#0
   0x0000fffff7f9cf20:	00000000	udf	#0
   0x0000fffff7f9cf24:	00000000	udf	#0
   0x0000fffff7f9cf28:	00000000	udf	#0
   0x0000fffff7f9cf2c:	00000000	udf	#0
   0x0000fffff7f9cf30:	00000000	udf	#0
   0x0000fffff7f9cf34:	00000000	udf	#0
   0x0000fffff7f9cf38:	00000000	udf	#0
   0x0000fffff7f9cf3c:	00000000	udf	#0
   0x0000fffff7f9cf40:	00000000	udf	#0
   0x0000fffff7f9cf44:	00000000	udf	#0
   0x0000fffff7f9cf48:	00000000	udf	#0
   0x0000fffff7f9cf4c:	00000000	udf	#0
   0x0000fffff7f9cf50:	00000000	udf	#0
   0x0000fffff7f9cf54:	00000000	udf	#0
   0x0000fffff7f9cf58:	00000000	udf	#0
   0x0000fffff7f9cf5c:	00000000	udf	#0
   0x0000fffff7f9cf60:	00000000	udf	#0
   0x0000fffff7f9cf64:	00000000	udf	#0
   0x0000fffff7f9cf68:	00000000	udf	#0
   0x0000fffff7f9cf6c:	00000000	udf	#0
   0x0000fffff7f9cf70:	00000000	udf	#0
   0x0000fffff7f9cf74:	00000000	udf	#0
   0x0000fffff7f9cf78:	00000000	udf	#0
   0x0000fffff7f9cf7c:	00000000	udf	#0
   0x0000fffff7f9cf80:	00000000	udf	#0
   0x0000fffff7f9cf84:	00000000	udf	#0
   0x0000fffff7f9cf88:	00000000	udf	#0
   0x0000fffff7f9cf8c:	00000000	udf	#0
   0x0000fffff7f9cf90:	00000000	udf	#0
   0x0000fffff7f9cf94:	00000000	udf	#0
   0x0000fffff7f9cf98:	00000000	udf	#0
   0x0000fffff7f9cf9c:	00000000	udf	#0
   0x0000fffff7f9cfa0:	00000000	udf	#0
   0x0000fffff7f9cfa4:	00000000	udf	#0
   0x0000fffff7f9cfa8:	00000000	udf	#0
   0x0000fffff7f9cfac:	00000000	udf	#0
   0x0000fffff7f9cfb0:	00000000	udf	#0
   0x0000fffff7f9cfb4:	00000000	udf	#0
   0x0000fffff7f9cfb8:	00000000	udf	#0
   0x0000fffff7f9cfbc:	00000000	udf	#0
   0x0000fffff7f9cfc0:	00000000	udf	#0
   0x0000fffff7f9cfc4:	00000000	udf	#0
   0x0000fffff7f9cfc8:	00000000	udf	#0
   0x0000fffff7f9cfcc:	00000000	udf	#0
   0x0000fffff7f9cfd0:	00000000	udf	#0
   0x0000fffff7f9cfd4:	00000000	udf	#0
   0x0000fffff7f9cfd8:	00000000	udf	#0
   0x0000fffff7f9cfdc:	00000000	udf	#0
   0x0000fffff7f9cfe0:	00000000	udf	#0
   0x0000fffff7f9cfe4:	00000000	udf	#0
   0x0000fffff7f9cfe8:	00000000	udf	#0
   0x0000fffff7f9cfec:	00000000	udf	#0
   0x0000fffff7f9cff0:	00000000	udf	#0
   0x0000fffff7f9cff4:	00000000	udf	#0
   0x0000fffff7f9cff8:	00000000	udf	#0
   0x0000fffff7f9cffc:	00000000	udf	#0
End of assembler dump.
