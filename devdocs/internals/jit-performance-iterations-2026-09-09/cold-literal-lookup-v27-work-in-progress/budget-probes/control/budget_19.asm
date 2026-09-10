Dump of assembler code from 0xfffff7f9c000 to 0xfffff7f9e000:
   0x0000fffff7f9c000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7f9c004:	910003fd	mov	x29, sp
   0x0000fffff7f9c008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7f9c00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7f9c010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7f9c014:	aa0003f3	mov	x19, x0
   0x0000fffff7f9c018:	aa0103f4	mov	x20, x1
   0x0000fffff7f9c01c:	aa0203f5	mov	x21, x2
   0x0000fffff7f9c020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7f9c024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7f9c028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f9c02c:	f90003e9	str	x9, [sp]
   0x0000fffff7f9c030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7f9c034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7f9c038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7f9c03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f9c040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c044:	d63f0200	blr	x16
   0x0000fffff7f9c048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7f9c04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7f9c050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7f9c054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7f9c058:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c05c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c060:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c064:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c068:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7f9c06c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c070:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c074:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9c078:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9c07c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c080:	d63f0200	blr	x16
   0x0000fffff7f9c084:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c088:	5400b560	b.eq	0xfffff7f9d734  // b.none
   0x0000fffff7f9c08c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c090:	37d800e9	tbnz	w9, #27, 0xfffff7f9c0ac
   0x0000fffff7f9c094:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f9c098:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c09c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c0a0:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9c0a4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9c0a8:	1400000e	b	0xfffff7f9c0e0
   0x0000fffff7f9c0ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c0b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c0b4:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c0b8:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c0bc:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7f9c0c0:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c0c4:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c0c8:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7f9c0cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c0d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c0d4:	d63f0200	blr	x16
   0x0000fffff7f9c0d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c0dc:	5400b300	b.eq	0xfffff7f9d73c  // b.none
   0x0000fffff7f9c0e0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9c0e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c0e8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c0ec:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c0f0:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f9c0f4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c0f8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c0fc:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9c100:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c104:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c108:	d63f0200	blr	x16
   0x0000fffff7f9c10c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c110:	5400b1a0	b.eq	0xfffff7f9d744  // b.none
   0x0000fffff7f9c114:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9c118:	37d800e9	tbnz	w9, #27, 0xfffff7f9c134
   0x0000fffff7f9c11c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f9c120:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c124:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c128:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9c12c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9c130:	1400000e	b	0xfffff7f9c168
   0x0000fffff7f9c134:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c138:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c13c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c140:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c144:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7f9c148:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c14c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c150:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7f9c154:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c158:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c15c:	d63f0200	blr	x16
   0x0000fffff7f9c160:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c164:	5400af40	b.eq	0xfffff7f9d74c  // b.none
   0x0000fffff7f9c168:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9c16c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c170:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c174:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c178:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7f9c17c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c180:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c184:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9c188:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c18c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c190:	d63f0200	blr	x16
   0x0000fffff7f9c194:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c198:	5400ade0	b.eq	0xfffff7f9d754  // b.none
   0x0000fffff7f9c19c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9c1a0:	37d80269	tbnz	w9, #27, 0xfffff7f9c1ec
   0x0000fffff7f9c1a4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9c1a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c1ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c1b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c1b4:	540001c1	b.ne	0xfffff7f9c1ec  // b.any
   0x0000fffff7f9c1b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c1bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c1c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c1c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c1c8:	54000121	b.ne	0xfffff7f9c1ec  // b.any
   0x0000fffff7f9c1cc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9c1d0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9c1d4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9c1d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c1dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c1e0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9c1e4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9c1e8:	1400000e	b	0xfffff7f9c220
   0x0000fffff7f9c1ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c1f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c1f4:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c1f8:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c1fc:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f9c200:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c204:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c208:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9c20c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9c210:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c214:	d63f0200	blr	x16
   0x0000fffff7f9c218:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c21c:	5400aa00	b.eq	0xfffff7f9d75c  // b.none
   0x0000fffff7f9c220:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c224:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c228:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c22c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c230:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f9c234:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c238:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c23c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9c240:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9c244:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c248:	d63f0200	blr	x16
   0x0000fffff7f9c24c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c250:	5400a8a0	b.eq	0xfffff7f9d764  // b.none
   0x0000fffff7f9c254:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9c258:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c25c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c260:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c264:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f9c268:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c26c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c270:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9c274:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c278:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c27c:	d63f0200	blr	x16
   0x0000fffff7f9c280:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c284:	5400a740	b.eq	0xfffff7f9d76c  // b.none
   0x0000fffff7f9c288:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9c28c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c290:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c294:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c298:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f9c29c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c2a0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c2a4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9c2a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c2ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c2b0:	d63f0200	blr	x16
   0x0000fffff7f9c2b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c2b8:	5400a5e0	b.eq	0xfffff7f9d774  // b.none
   0x0000fffff7f9c2bc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9c2c0:	37d80269	tbnz	w9, #27, 0xfffff7f9c30c
   0x0000fffff7f9c2c4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9c2c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c2cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c2d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c2d4:	540001c1	b.ne	0xfffff7f9c30c  // b.any
   0x0000fffff7f9c2d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c2dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c2e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c2e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c2e8:	54000121	b.ne	0xfffff7f9c30c  // b.any
   0x0000fffff7f9c2ec:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9c2f0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9c2f4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9c2f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c2fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c300:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9c304:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9c308:	1400000e	b	0xfffff7f9c340
   0x0000fffff7f9c30c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c310:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c314:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c318:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c31c:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f9c320:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c324:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c328:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9c32c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9c330:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c334:	d63f0200	blr	x16
   0x0000fffff7f9c338:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c33c:	5400a200	b.eq	0xfffff7f9d77c  // b.none
   0x0000fffff7f9c340:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c344:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c348:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c34c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c350:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f9c354:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c358:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c35c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9c360:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9c364:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c368:	d63f0200	blr	x16
   0x0000fffff7f9c36c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c370:	5400a0a0	b.eq	0xfffff7f9d784  // b.none
   0x0000fffff7f9c374:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9c378:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c37c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c380:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c384:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7f9c388:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c38c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c390:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9c394:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c398:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c39c:	d63f0200	blr	x16
   0x0000fffff7f9c3a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c3a4:	54009f40	b.eq	0xfffff7f9d78c  // b.none
   0x0000fffff7f9c3a8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9c3ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c3b0:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c3b4:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c3b8:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7f9c3bc:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c3c0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c3c4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9c3c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c3cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c3d0:	d63f0200	blr	x16
   0x0000fffff7f9c3d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c3d8:	54009de0	b.eq	0xfffff7f9d794  // b.none
   0x0000fffff7f9c3dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9c3e0:	37d80269	tbnz	w9, #27, 0xfffff7f9c42c
   0x0000fffff7f9c3e4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9c3e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c3ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c3f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c3f4:	540001c1	b.ne	0xfffff7f9c42c  // b.any
   0x0000fffff7f9c3f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c3fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c400:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c404:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c408:	54000121	b.ne	0xfffff7f9c42c  // b.any
   0x0000fffff7f9c40c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9c410:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9c414:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9c418:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c41c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c420:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9c424:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9c428:	1400000e	b	0xfffff7f9c460
   0x0000fffff7f9c42c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c430:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c434:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c438:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c43c:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7f9c440:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c444:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c448:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9c44c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9c450:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c454:	d63f0200	blr	x16
   0x0000fffff7f9c458:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c45c:	54009a00	b.eq	0xfffff7f9d79c  // b.none
   0x0000fffff7f9c460:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c464:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c468:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c46c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c470:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7f9c474:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c478:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c47c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9c480:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9c484:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c488:	d63f0200	blr	x16
   0x0000fffff7f9c48c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c490:	540098a0	b.eq	0xfffff7f9d7a4  // b.none
   0x0000fffff7f9c494:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9c498:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c49c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c4a0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c4a4:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7f9c4a8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c4ac:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c4b0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9c4b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c4b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c4bc:	d63f0200	blr	x16
   0x0000fffff7f9c4c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c4c4:	54009740	b.eq	0xfffff7f9d7ac  // b.none
   0x0000fffff7f9c4c8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9c4cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c4d0:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c4d4:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c4d8:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7f9c4dc:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c4e0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c4e4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9c4e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c4ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c4f0:	d63f0200	blr	x16
   0x0000fffff7f9c4f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c4f8:	540095e0	b.eq	0xfffff7f9d7b4  // b.none
   0x0000fffff7f9c4fc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9c500:	37d80269	tbnz	w9, #27, 0xfffff7f9c54c
   0x0000fffff7f9c504:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9c508:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c50c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c510:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c514:	540001c1	b.ne	0xfffff7f9c54c  // b.any
   0x0000fffff7f9c518:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c51c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c520:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c524:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c528:	54000121	b.ne	0xfffff7f9c54c  // b.any
   0x0000fffff7f9c52c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9c530:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9c534:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9c538:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c53c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c540:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9c544:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9c548:	1400000e	b	0xfffff7f9c580
   0x0000fffff7f9c54c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c550:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c554:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c558:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c55c:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7f9c560:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c564:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c568:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9c56c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9c570:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c574:	d63f0200	blr	x16
   0x0000fffff7f9c578:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c57c:	54009200	b.eq	0xfffff7f9d7bc  // b.none
   0x0000fffff7f9c580:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c584:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c588:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c58c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c590:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7f9c594:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c598:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c59c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9c5a0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9c5a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c5a8:	d63f0200	blr	x16
   0x0000fffff7f9c5ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c5b0:	540090a0	b.eq	0xfffff7f9d7c4  // b.none
   0x0000fffff7f9c5b4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9c5b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c5bc:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c5c0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c5c4:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7f9c5c8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c5cc:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c5d0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9c5d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c5d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c5dc:	d63f0200	blr	x16
   0x0000fffff7f9c5e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c5e4:	54008f40	b.eq	0xfffff7f9d7cc  // b.none
   0x0000fffff7f9c5e8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9c5ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c5f0:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c5f4:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c5f8:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7f9c5fc:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c600:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c604:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9c608:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c60c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c610:	d63f0200	blr	x16
   0x0000fffff7f9c614:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c618:	54008de0	b.eq	0xfffff7f9d7d4  // b.none
   0x0000fffff7f9c61c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9c620:	37d80269	tbnz	w9, #27, 0xfffff7f9c66c
   0x0000fffff7f9c624:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9c628:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c62c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c630:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c634:	540001c1	b.ne	0xfffff7f9c66c  // b.any
   0x0000fffff7f9c638:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c63c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c640:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c644:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c648:	54000121	b.ne	0xfffff7f9c66c  // b.any
   0x0000fffff7f9c64c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9c650:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9c654:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9c658:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c65c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c660:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9c664:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9c668:	1400000e	b	0xfffff7f9c6a0
   0x0000fffff7f9c66c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c670:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c674:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c678:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c67c:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7f9c680:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c684:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c688:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9c68c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9c690:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c694:	d63f0200	blr	x16
   0x0000fffff7f9c698:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c69c:	54008a00	b.eq	0xfffff7f9d7dc  // b.none
   0x0000fffff7f9c6a0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c6a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c6a8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c6ac:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c6b0:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7f9c6b4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c6b8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c6bc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9c6c0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9c6c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c6c8:	d63f0200	blr	x16
   0x0000fffff7f9c6cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c6d0:	540088a0	b.eq	0xfffff7f9d7e4  // b.none
   0x0000fffff7f9c6d4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9c6d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c6dc:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c6e0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c6e4:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7f9c6e8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c6ec:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c6f0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9c6f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c6f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c6fc:	d63f0200	blr	x16
   0x0000fffff7f9c700:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c704:	54008740	b.eq	0xfffff7f9d7ec  // b.none
   0x0000fffff7f9c708:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9c70c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c710:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c714:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c718:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7f9c71c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c720:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c724:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9c728:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c72c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c730:	d63f0200	blr	x16
   0x0000fffff7f9c734:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c738:	540085e0	b.eq	0xfffff7f9d7f4  // b.none
   0x0000fffff7f9c73c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9c740:	37d80269	tbnz	w9, #27, 0xfffff7f9c78c
   0x0000fffff7f9c744:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9c748:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c74c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c750:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c754:	540001c1	b.ne	0xfffff7f9c78c  // b.any
   0x0000fffff7f9c758:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c75c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c760:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c764:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c768:	54000121	b.ne	0xfffff7f9c78c  // b.any
   0x0000fffff7f9c76c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9c770:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9c774:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9c778:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c77c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c780:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9c784:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9c788:	1400000e	b	0xfffff7f9c7c0
   0x0000fffff7f9c78c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c790:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c794:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c798:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c79c:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7f9c7a0:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c7a4:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c7a8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9c7ac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9c7b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c7b4:	d63f0200	blr	x16
   0x0000fffff7f9c7b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c7bc:	54008200	b.eq	0xfffff7f9d7fc  // b.none
   0x0000fffff7f9c7c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c7c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c7c8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c7cc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c7d0:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7f9c7d4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c7d8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c7dc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9c7e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9c7e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c7e8:	d63f0200	blr	x16
   0x0000fffff7f9c7ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c7f0:	540080a0	b.eq	0xfffff7f9d804  // b.none
   0x0000fffff7f9c7f4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9c7f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c7fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c800:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c804:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7f9c808:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c80c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c810:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9c814:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c818:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c81c:	d63f0200	blr	x16
   0x0000fffff7f9c820:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c824:	54007f40	b.eq	0xfffff7f9d80c  // b.none
   0x0000fffff7f9c828:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9c82c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c830:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c834:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c838:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7f9c83c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c840:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c844:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9c848:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c84c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c850:	d63f0200	blr	x16
   0x0000fffff7f9c854:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c858:	54007de0	b.eq	0xfffff7f9d814  // b.none
   0x0000fffff7f9c85c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9c860:	37d80269	tbnz	w9, #27, 0xfffff7f9c8ac
   0x0000fffff7f9c864:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9c868:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c86c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c870:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c874:	540001c1	b.ne	0xfffff7f9c8ac  // b.any
   0x0000fffff7f9c878:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c87c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c880:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c884:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c888:	54000121	b.ne	0xfffff7f9c8ac  // b.any
   0x0000fffff7f9c88c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9c890:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9c894:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9c898:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c89c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c8a0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9c8a4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9c8a8:	1400000e	b	0xfffff7f9c8e0
   0x0000fffff7f9c8ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c8b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c8b4:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c8b8:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c8bc:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7f9c8c0:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c8c4:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c8c8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9c8cc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9c8d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c8d4:	d63f0200	blr	x16
   0x0000fffff7f9c8d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c8dc:	54007a00	b.eq	0xfffff7f9d81c  // b.none
   0x0000fffff7f9c8e0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c8e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c8e8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c8ec:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c8f0:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7f9c8f4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c8f8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c8fc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9c900:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9c904:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c908:	d63f0200	blr	x16
   0x0000fffff7f9c90c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c910:	540078a0	b.eq	0xfffff7f9d824  // b.none
   0x0000fffff7f9c914:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9c918:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c91c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c920:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c924:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7f9c928:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c92c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c930:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9c934:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c938:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c93c:	d63f0200	blr	x16
   0x0000fffff7f9c940:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c944:	54007740	b.eq	0xfffff7f9d82c  // b.none
   0x0000fffff7f9c948:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9c94c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c950:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c954:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c958:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7f9c95c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c960:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c964:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9c968:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c96c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c970:	d63f0200	blr	x16
   0x0000fffff7f9c974:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c978:	540075e0	b.eq	0xfffff7f9d834  // b.none
   0x0000fffff7f9c97c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9c980:	37d80269	tbnz	w9, #27, 0xfffff7f9c9cc
   0x0000fffff7f9c984:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9c988:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c98c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c990:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c994:	540001c1	b.ne	0xfffff7f9c9cc  // b.any
   0x0000fffff7f9c998:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9c99c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c9a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c9a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c9a8:	54000121	b.ne	0xfffff7f9c9cc  // b.any
   0x0000fffff7f9c9ac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9c9b0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9c9b4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9c9b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c9bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c9c0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9c9c4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9c9c8:	1400000e	b	0xfffff7f9ca00
   0x0000fffff7f9c9cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c9d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c9d4:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c9d8:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c9dc:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7f9c9e0:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c9e4:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c9e8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9c9ec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9c9f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c9f4:	d63f0200	blr	x16
   0x0000fffff7f9c9f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c9fc:	54007200	b.eq	0xfffff7f9d83c  // b.none
   0x0000fffff7f9ca00:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9ca04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ca08:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ca0c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ca10:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7f9ca14:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ca18:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ca1c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9ca20:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9ca24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ca28:	d63f0200	blr	x16
   0x0000fffff7f9ca2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ca30:	540070a0	b.eq	0xfffff7f9d844  // b.none
   0x0000fffff7f9ca34:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9ca38:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ca3c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ca40:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ca44:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7f9ca48:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ca4c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ca50:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9ca54:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9ca58:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ca5c:	d63f0200	blr	x16
   0x0000fffff7f9ca60:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ca64:	54006f40	b.eq	0xfffff7f9d84c  // b.none
   0x0000fffff7f9ca68:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9ca6c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ca70:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ca74:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ca78:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7f9ca7c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ca80:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ca84:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9ca88:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9ca8c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ca90:	d63f0200	blr	x16
   0x0000fffff7f9ca94:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ca98:	54006de0	b.eq	0xfffff7f9d854  // b.none
   0x0000fffff7f9ca9c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9caa0:	37d80269	tbnz	w9, #27, 0xfffff7f9caec
   0x0000fffff7f9caa4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9caa8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9caac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9cab0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9cab4:	540001c1	b.ne	0xfffff7f9caec  // b.any
   0x0000fffff7f9cab8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9cabc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9cac0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9cac4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9cac8:	54000121	b.ne	0xfffff7f9caec  // b.any
   0x0000fffff7f9cacc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9cad0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9cad4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9cad8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9cadc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9cae0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9cae4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9cae8:	1400000e	b	0xfffff7f9cb20
   0x0000fffff7f9caec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9caf0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9caf4:	aa1303e1	mov	x1, x19
   0x0000fffff7f9caf8:	aa1503e2	mov	x2, x21
   0x0000fffff7f9cafc:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7f9cb00:	aa1403e4	mov	x4, x20
   0x0000fffff7f9cb04:	aa1603e5	mov	x5, x22
   0x0000fffff7f9cb08:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9cb0c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9cb10:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9cb14:	d63f0200	blr	x16
   0x0000fffff7f9cb18:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9cb1c:	54006a00	b.eq	0xfffff7f9d85c  // b.none
   0x0000fffff7f9cb20:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9cb24:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9cb28:	aa1303e1	mov	x1, x19
   0x0000fffff7f9cb2c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9cb30:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7f9cb34:	aa1403e4	mov	x4, x20
   0x0000fffff7f9cb38:	aa1603e5	mov	x5, x22
   0x0000fffff7f9cb3c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9cb40:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9cb44:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9cb48:	d63f0200	blr	x16
   0x0000fffff7f9cb4c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9cb50:	540068a0	b.eq	0xfffff7f9d864  // b.none
   0x0000fffff7f9cb54:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9cb58:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9cb5c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9cb60:	aa1503e2	mov	x2, x21
   0x0000fffff7f9cb64:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7f9cb68:	aa1403e4	mov	x4, x20
   0x0000fffff7f9cb6c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9cb70:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9cb74:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9cb78:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9cb7c:	d63f0200	blr	x16
   0x0000fffff7f9cb80:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9cb84:	54006740	b.eq	0xfffff7f9d86c  // b.none
   0x0000fffff7f9cb88:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9cb8c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9cb90:	aa1303e1	mov	x1, x19
   0x0000fffff7f9cb94:	aa1503e2	mov	x2, x21
   0x0000fffff7f9cb98:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7f9cb9c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9cba0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9cba4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9cba8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9cbac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9cbb0:	d63f0200	blr	x16
   0x0000fffff7f9cbb4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9cbb8:	540065e0	b.eq	0xfffff7f9d874  // b.none
   0x0000fffff7f9cbbc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9cbc0:	37d80269	tbnz	w9, #27, 0xfffff7f9cc0c
   0x0000fffff7f9cbc4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9cbc8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9cbcc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9cbd0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9cbd4:	540001c1	b.ne	0xfffff7f9cc0c  // b.any
   0x0000fffff7f9cbd8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9cbdc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9cbe0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9cbe4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9cbe8:	54000121	b.ne	0xfffff7f9cc0c  // b.any
   0x0000fffff7f9cbec:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9cbf0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9cbf4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9cbf8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9cbfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9cc00:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9cc04:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9cc08:	1400000e	b	0xfffff7f9cc40
   0x0000fffff7f9cc0c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9cc10:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9cc14:	aa1303e1	mov	x1, x19
   0x0000fffff7f9cc18:	aa1503e2	mov	x2, x21
   0x0000fffff7f9cc1c:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7f9cc20:	aa1403e4	mov	x4, x20
   0x0000fffff7f9cc24:	aa1603e5	mov	x5, x22
   0x0000fffff7f9cc28:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9cc2c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9cc30:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9cc34:	d63f0200	blr	x16
   0x0000fffff7f9cc38:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9cc3c:	54006200	b.eq	0xfffff7f9d87c  // b.none
   0x0000fffff7f9cc40:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9cc44:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9cc48:	aa1303e1	mov	x1, x19
   0x0000fffff7f9cc4c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9cc50:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7f9cc54:	aa1403e4	mov	x4, x20
   0x0000fffff7f9cc58:	aa1603e5	mov	x5, x22
   0x0000fffff7f9cc5c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9cc60:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9cc64:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9cc68:	d63f0200	blr	x16
   0x0000fffff7f9cc6c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9cc70:	540060a0	b.eq	0xfffff7f9d884  // b.none
   0x0000fffff7f9cc74:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9cc78:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9cc7c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9cc80:	aa1503e2	mov	x2, x21
   0x0000fffff7f9cc84:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7f9cc88:	aa1403e4	mov	x4, x20
   0x0000fffff7f9cc8c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9cc90:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9cc94:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9cc98:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9cc9c:	d63f0200	blr	x16
   0x0000fffff7f9cca0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9cca4:	54005f40	b.eq	0xfffff7f9d88c  // b.none
   0x0000fffff7f9cca8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9ccac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ccb0:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ccb4:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ccb8:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7f9ccbc:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ccc0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ccc4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9ccc8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9cccc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ccd0:	d63f0200	blr	x16
   0x0000fffff7f9ccd4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ccd8:	54005de0	b.eq	0xfffff7f9d894  // b.none
   0x0000fffff7f9ccdc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9cce0:	37d80269	tbnz	w9, #27, 0xfffff7f9cd2c
   0x0000fffff7f9cce4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9cce8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ccec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ccf0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ccf4:	540001c1	b.ne	0xfffff7f9cd2c  // b.any
   0x0000fffff7f9ccf8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9ccfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9cd00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9cd04:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9cd08:	54000121	b.ne	0xfffff7f9cd2c  // b.any
   0x0000fffff7f9cd0c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9cd10:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9cd14:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9cd18:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9cd1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9cd20:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9cd24:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9cd28:	1400000e	b	0xfffff7f9cd60
   0x0000fffff7f9cd2c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9cd30:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9cd34:	aa1303e1	mov	x1, x19
   0x0000fffff7f9cd38:	aa1503e2	mov	x2, x21
   0x0000fffff7f9cd3c:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7f9cd40:	aa1403e4	mov	x4, x20
   0x0000fffff7f9cd44:	aa1603e5	mov	x5, x22
   0x0000fffff7f9cd48:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9cd4c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9cd50:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9cd54:	d63f0200	blr	x16
   0x0000fffff7f9cd58:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9cd5c:	54005a00	b.eq	0xfffff7f9d89c  // b.none
   0x0000fffff7f9cd60:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9cd64:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9cd68:	aa1303e1	mov	x1, x19
   0x0000fffff7f9cd6c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9cd70:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7f9cd74:	aa1403e4	mov	x4, x20
   0x0000fffff7f9cd78:	aa1603e5	mov	x5, x22
   0x0000fffff7f9cd7c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9cd80:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9cd84:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9cd88:	d63f0200	blr	x16
   0x0000fffff7f9cd8c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9cd90:	540058a0	b.eq	0xfffff7f9d8a4  // b.none
   0x0000fffff7f9cd94:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9cd98:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9cd9c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9cda0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9cda4:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7f9cda8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9cdac:	aa1603e5	mov	x5, x22
   0x0000fffff7f9cdb0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9cdb4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9cdb8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9cdbc:	d63f0200	blr	x16
   0x0000fffff7f9cdc0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9cdc4:	54005740	b.eq	0xfffff7f9d8ac  // b.none
   0x0000fffff7f9cdc8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9cdcc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9cdd0:	aa1303e1	mov	x1, x19
   0x0000fffff7f9cdd4:	aa1503e2	mov	x2, x21
   0x0000fffff7f9cdd8:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7f9cddc:	aa1403e4	mov	x4, x20
   0x0000fffff7f9cde0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9cde4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9cde8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9cdec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9cdf0:	d63f0200	blr	x16
   0x0000fffff7f9cdf4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9cdf8:	540055e0	b.eq	0xfffff7f9d8b4  // b.none
   0x0000fffff7f9cdfc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9ce00:	37d80269	tbnz	w9, #27, 0xfffff7f9ce4c
   0x0000fffff7f9ce04:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9ce08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ce0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ce10:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ce14:	540001c1	b.ne	0xfffff7f9ce4c  // b.any
   0x0000fffff7f9ce18:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9ce1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ce20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ce24:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ce28:	54000121	b.ne	0xfffff7f9ce4c  // b.any
   0x0000fffff7f9ce2c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9ce30:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9ce34:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9ce38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ce3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ce40:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9ce44:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9ce48:	1400000e	b	0xfffff7f9ce80
   0x0000fffff7f9ce4c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9ce50:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ce54:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ce58:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ce5c:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7f9ce60:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ce64:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ce68:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9ce6c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9ce70:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ce74:	d63f0200	blr	x16
   0x0000fffff7f9ce78:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ce7c:	54005200	b.eq	0xfffff7f9d8bc  // b.none
   0x0000fffff7f9ce80:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9ce84:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ce88:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ce8c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ce90:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7f9ce94:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ce98:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ce9c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9cea0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9cea4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9cea8:	d63f0200	blr	x16
   0x0000fffff7f9ceac:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ceb0:	540050a0	b.eq	0xfffff7f9d8c4  // b.none
   0x0000fffff7f9ceb4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9ceb8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9cebc:	aa1303e1	mov	x1, x19
   0x0000fffff7f9cec0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9cec4:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7f9cec8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9cecc:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ced0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9ced4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9ced8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9cedc:	d63f0200	blr	x16
   0x0000fffff7f9cee0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9cee4:	54004f40	b.eq	0xfffff7f9d8cc  // b.none
   0x0000fffff7f9cee8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9ceec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9cef0:	aa1303e1	mov	x1, x19
   0x0000fffff7f9cef4:	aa1503e2	mov	x2, x21
   0x0000fffff7f9cef8:	d2800683	mov	x3, #0x34                  	// #52
   0x0000fffff7f9cefc:	aa1403e4	mov	x4, x20
   0x0000fffff7f9cf00:	aa1603e5	mov	x5, x22
   0x0000fffff7f9cf04:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9cf08:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9cf0c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9cf10:	d63f0200	blr	x16
   0x0000fffff7f9cf14:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9cf18:	54004de0	b.eq	0xfffff7f9d8d4  // b.none
   0x0000fffff7f9cf1c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9cf20:	37d80269	tbnz	w9, #27, 0xfffff7f9cf6c
   0x0000fffff7f9cf24:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9cf28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9cf2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9cf30:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9cf34:	540001c1	b.ne	0xfffff7f9cf6c  // b.any
   0x0000fffff7f9cf38:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9cf3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9cf40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9cf44:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9cf48:	54000121	b.ne	0xfffff7f9cf6c  // b.any
   0x0000fffff7f9cf4c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9cf50:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9cf54:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9cf58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9cf5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9cf60:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9cf64:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9cf68:	1400000e	b	0xfffff7f9cfa0
   0x0000fffff7f9cf6c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9cf70:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9cf74:	aa1303e1	mov	x1, x19
   0x0000fffff7f9cf78:	aa1503e2	mov	x2, x21
   0x0000fffff7f9cf7c:	d28006a3	mov	x3, #0x35                  	// #53
   0x0000fffff7f9cf80:	aa1403e4	mov	x4, x20
   0x0000fffff7f9cf84:	aa1603e5	mov	x5, x22
   0x0000fffff7f9cf88:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9cf8c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9cf90:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9cf94:	d63f0200	blr	x16
   0x0000fffff7f9cf98:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9cf9c:	54004a00	b.eq	0xfffff7f9d8dc  // b.none
   0x0000fffff7f9cfa0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9cfa4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9cfa8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9cfac:	aa1503e2	mov	x2, x21
   0x0000fffff7f9cfb0:	d28006c3	mov	x3, #0x36                  	// #54
   0x0000fffff7f9cfb4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9cfb8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9cfbc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9cfc0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9cfc4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9cfc8:	d63f0200	blr	x16
   0x0000fffff7f9cfcc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9cfd0:	540048a0	b.eq	0xfffff7f9d8e4  // b.none
   0x0000fffff7f9cfd4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9cfd8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9cfdc:	aa1303e1	mov	x1, x19
   0x0000fffff7f9cfe0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9cfe4:	d28006e3	mov	x3, #0x37                  	// #55
   0x0000fffff7f9cfe8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9cfec:	aa1603e5	mov	x5, x22
   0x0000fffff7f9cff0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9cff4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9cff8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9cffc:	d63f0200	blr	x16
   0x0000fffff7f9d000:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d004:	54004740	b.eq	0xfffff7f9d8ec  // b.none
   0x0000fffff7f9d008:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9d00c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d010:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d014:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d018:	d2800703	mov	x3, #0x38                  	// #56
   0x0000fffff7f9d01c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d020:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d024:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9d028:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9d02c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d030:	d63f0200	blr	x16
   0x0000fffff7f9d034:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d038:	540045e0	b.eq	0xfffff7f9d8f4  // b.none
   0x0000fffff7f9d03c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9d040:	37d80269	tbnz	w9, #27, 0xfffff7f9d08c
   0x0000fffff7f9d044:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9d048:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d04c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d050:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d054:	540001c1	b.ne	0xfffff7f9d08c  // b.any
   0x0000fffff7f9d058:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9d05c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d060:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d064:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d068:	54000121	b.ne	0xfffff7f9d08c  // b.any
   0x0000fffff7f9d06c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9d070:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9d074:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9d078:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d07c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d080:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9d084:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9d088:	1400000e	b	0xfffff7f9d0c0
   0x0000fffff7f9d08c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9d090:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d094:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d098:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d09c:	d2800723	mov	x3, #0x39                  	// #57
   0x0000fffff7f9d0a0:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d0a4:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d0a8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9d0ac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9d0b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d0b4:	d63f0200	blr	x16
   0x0000fffff7f9d0b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d0bc:	54004200	b.eq	0xfffff7f9d8fc  // b.none
   0x0000fffff7f9d0c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9d0c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d0c8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d0cc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d0d0:	d2800743	mov	x3, #0x3a                  	// #58
   0x0000fffff7f9d0d4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d0d8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d0dc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9d0e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9d0e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d0e8:	d63f0200	blr	x16
   0x0000fffff7f9d0ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d0f0:	540040a0	b.eq	0xfffff7f9d904  // b.none
   0x0000fffff7f9d0f4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9d0f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d0fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d100:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d104:	d2800763	mov	x3, #0x3b                  	// #59
   0x0000fffff7f9d108:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d10c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d110:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9d114:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9d118:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d11c:	d63f0200	blr	x16
   0x0000fffff7f9d120:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d124:	54003f40	b.eq	0xfffff7f9d90c  // b.none
   0x0000fffff7f9d128:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9d12c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d130:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d134:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d138:	d2800783	mov	x3, #0x3c                  	// #60
   0x0000fffff7f9d13c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d140:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d144:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9d148:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9d14c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d150:	d63f0200	blr	x16
   0x0000fffff7f9d154:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d158:	54003de0	b.eq	0xfffff7f9d914  // b.none
   0x0000fffff7f9d15c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9d160:	37d80269	tbnz	w9, #27, 0xfffff7f9d1ac
   0x0000fffff7f9d164:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9d168:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d16c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d170:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d174:	540001c1	b.ne	0xfffff7f9d1ac  // b.any
   0x0000fffff7f9d178:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9d17c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d180:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d184:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d188:	54000121	b.ne	0xfffff7f9d1ac  // b.any
   0x0000fffff7f9d18c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9d190:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9d194:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9d198:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d19c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d1a0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9d1a4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9d1a8:	1400000e	b	0xfffff7f9d1e0
   0x0000fffff7f9d1ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9d1b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d1b4:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d1b8:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d1bc:	d28007a3	mov	x3, #0x3d                  	// #61
   0x0000fffff7f9d1c0:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d1c4:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d1c8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9d1cc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9d1d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d1d4:	d63f0200	blr	x16
   0x0000fffff7f9d1d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d1dc:	54003a00	b.eq	0xfffff7f9d91c  // b.none
   0x0000fffff7f9d1e0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9d1e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d1e8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d1ec:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d1f0:	d28007c3	mov	x3, #0x3e                  	// #62
   0x0000fffff7f9d1f4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d1f8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d1fc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9d200:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9d204:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d208:	d63f0200	blr	x16
   0x0000fffff7f9d20c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d210:	540038a0	b.eq	0xfffff7f9d924  // b.none
   0x0000fffff7f9d214:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9d218:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d21c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d220:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d224:	d28007e3	mov	x3, #0x3f                  	// #63
   0x0000fffff7f9d228:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d22c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d230:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9d234:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9d238:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d23c:	d63f0200	blr	x16
   0x0000fffff7f9d240:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d244:	54003740	b.eq	0xfffff7f9d92c  // b.none
   0x0000fffff7f9d248:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9d24c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d250:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d254:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d258:	d2800803	mov	x3, #0x40                  	// #64
   0x0000fffff7f9d25c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d260:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d264:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9d268:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9d26c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d270:	d63f0200	blr	x16
   0x0000fffff7f9d274:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d278:	540035e0	b.eq	0xfffff7f9d934  // b.none
   0x0000fffff7f9d27c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9d280:	37d80269	tbnz	w9, #27, 0xfffff7f9d2cc
   0x0000fffff7f9d284:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9d288:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d28c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d290:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d294:	540001c1	b.ne	0xfffff7f9d2cc  // b.any
   0x0000fffff7f9d298:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9d29c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d2a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d2a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d2a8:	54000121	b.ne	0xfffff7f9d2cc  // b.any
   0x0000fffff7f9d2ac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9d2b0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9d2b4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9d2b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d2bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d2c0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9d2c4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9d2c8:	1400000e	b	0xfffff7f9d300
   0x0000fffff7f9d2cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9d2d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d2d4:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d2d8:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d2dc:	d2800823	mov	x3, #0x41                  	// #65
   0x0000fffff7f9d2e0:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d2e4:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d2e8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9d2ec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9d2f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d2f4:	d63f0200	blr	x16
   0x0000fffff7f9d2f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d2fc:	54003200	b.eq	0xfffff7f9d93c  // b.none
   0x0000fffff7f9d300:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9d304:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d308:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d30c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d310:	d2800843	mov	x3, #0x42                  	// #66
   0x0000fffff7f9d314:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d318:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d31c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9d320:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9d324:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d328:	d63f0200	blr	x16
   0x0000fffff7f9d32c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d330:	540030a0	b.eq	0xfffff7f9d944  // b.none
   0x0000fffff7f9d334:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9d338:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d33c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d340:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d344:	d2800863	mov	x3, #0x43                  	// #67
   0x0000fffff7f9d348:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d34c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d350:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9d354:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9d358:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d35c:	d63f0200	blr	x16
   0x0000fffff7f9d360:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d364:	54002f40	b.eq	0xfffff7f9d94c  // b.none
   0x0000fffff7f9d368:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9d36c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d370:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d374:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d378:	d2800883	mov	x3, #0x44                  	// #68
   0x0000fffff7f9d37c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d380:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d384:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9d388:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9d38c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d390:	d63f0200	blr	x16
   0x0000fffff7f9d394:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d398:	54002de0	b.eq	0xfffff7f9d954  // b.none
   0x0000fffff7f9d39c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9d3a0:	37d80269	tbnz	w9, #27, 0xfffff7f9d3ec
   0x0000fffff7f9d3a4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9d3a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d3ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d3b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d3b4:	540001c1	b.ne	0xfffff7f9d3ec  // b.any
   0x0000fffff7f9d3b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9d3bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d3c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d3c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d3c8:	54000121	b.ne	0xfffff7f9d3ec  // b.any
   0x0000fffff7f9d3cc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9d3d0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9d3d4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9d3d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d3dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d3e0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9d3e4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9d3e8:	1400000e	b	0xfffff7f9d420
   0x0000fffff7f9d3ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9d3f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d3f4:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d3f8:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d3fc:	d28008a3	mov	x3, #0x45                  	// #69
   0x0000fffff7f9d400:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d404:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d408:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9d40c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9d410:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d414:	d63f0200	blr	x16
   0x0000fffff7f9d418:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d41c:	54002a00	b.eq	0xfffff7f9d95c  // b.none
   0x0000fffff7f9d420:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9d424:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d428:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d42c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d430:	d28008c3	mov	x3, #0x46                  	// #70
   0x0000fffff7f9d434:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d438:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d43c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9d440:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9d444:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d448:	d63f0200	blr	x16
   0x0000fffff7f9d44c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d450:	540028a0	b.eq	0xfffff7f9d964  // b.none
   0x0000fffff7f9d454:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9d458:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d45c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d460:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d464:	d28008e3	mov	x3, #0x47                  	// #71
   0x0000fffff7f9d468:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d46c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d470:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9d474:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9d478:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d47c:	d63f0200	blr	x16
   0x0000fffff7f9d480:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d484:	54002740	b.eq	0xfffff7f9d96c  // b.none
   0x0000fffff7f9d488:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9d48c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d490:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d494:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d498:	d2800903	mov	x3, #0x48                  	// #72
   0x0000fffff7f9d49c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d4a0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d4a4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9d4a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9d4ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d4b0:	d63f0200	blr	x16
   0x0000fffff7f9d4b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d4b8:	540025e0	b.eq	0xfffff7f9d974  // b.none
   0x0000fffff7f9d4bc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9d4c0:	37d80269	tbnz	w9, #27, 0xfffff7f9d50c
   0x0000fffff7f9d4c4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9d4c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d4cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d4d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d4d4:	540001c1	b.ne	0xfffff7f9d50c  // b.any
   0x0000fffff7f9d4d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9d4dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d4e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d4e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d4e8:	54000121	b.ne	0xfffff7f9d50c  // b.any
   0x0000fffff7f9d4ec:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9d4f0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9d4f4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9d4f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d4fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d500:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9d504:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9d508:	1400000e	b	0xfffff7f9d540
   0x0000fffff7f9d50c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9d510:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d514:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d518:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d51c:	d2800923	mov	x3, #0x49                  	// #73
   0x0000fffff7f9d520:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d524:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d528:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9d52c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9d530:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d534:	d63f0200	blr	x16
   0x0000fffff7f9d538:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d53c:	54002200	b.eq	0xfffff7f9d97c  // b.none
   0x0000fffff7f9d540:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9d544:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d548:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d54c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d550:	d2800943	mov	x3, #0x4a                  	// #74
   0x0000fffff7f9d554:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d558:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d55c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9d560:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9d564:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d568:	d63f0200	blr	x16
   0x0000fffff7f9d56c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d570:	540020a0	b.eq	0xfffff7f9d984  // b.none
   0x0000fffff7f9d574:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9d578:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d57c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d580:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d584:	d2800963	mov	x3, #0x4b                  	// #75
   0x0000fffff7f9d588:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d58c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d590:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9d594:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9d598:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d59c:	d63f0200	blr	x16
   0x0000fffff7f9d5a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d5a4:	54001f40	b.eq	0xfffff7f9d98c  // b.none
   0x0000fffff7f9d5a8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9d5ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d5b0:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d5b4:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d5b8:	d2800983	mov	x3, #0x4c                  	// #76
   0x0000fffff7f9d5bc:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d5c0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d5c4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9d5c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9d5cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d5d0:	d63f0200	blr	x16
   0x0000fffff7f9d5d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d5d8:	54001de0	b.eq	0xfffff7f9d994  // b.none
   0x0000fffff7f9d5dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9d5e0:	37d80269	tbnz	w9, #27, 0xfffff7f9d62c
   0x0000fffff7f9d5e4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9d5e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d5ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d5f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d5f4:	540001c1	b.ne	0xfffff7f9d62c  // b.any
   0x0000fffff7f9d5f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9d5fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d600:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d604:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d608:	54000121	b.ne	0xfffff7f9d62c  // b.any
   0x0000fffff7f9d60c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f9d610:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f9d614:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9d618:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d61c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d620:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9d624:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f9d628:	1400000e	b	0xfffff7f9d660
   0x0000fffff7f9d62c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9d630:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d634:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d638:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d63c:	d28009a3	mov	x3, #0x4d                  	// #77
   0x0000fffff7f9d640:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d644:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d648:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9d64c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9d650:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d654:	d63f0200	blr	x16
   0x0000fffff7f9d658:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d65c:	54001a00	b.eq	0xfffff7f9d99c  // b.none
   0x0000fffff7f9d660:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9d664:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d668:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d66c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d670:	d28009c3	mov	x3, #0x4e                  	// #78
   0x0000fffff7f9d674:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d678:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d67c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9d680:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9d684:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d688:	d63f0200	blr	x16
   0x0000fffff7f9d68c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d690:	540018a0	b.eq	0xfffff7f9d9a4  // b.none
   0x0000fffff7f9d694:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9d698:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d69c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d6a0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d6a4:	d28009e3	mov	x3, #0x4f                  	// #79
   0x0000fffff7f9d6a8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d6ac:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d6b0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9d6b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9d6b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d6bc:	d63f0200	blr	x16
   0x0000fffff7f9d6c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d6c4:	54001740	b.eq	0xfffff7f9d9ac  // b.none
   0x0000fffff7f9d6c8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9d6cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d6d0:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d6d4:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d6d8:	d2800a03	mov	x3, #0x50                  	// #80
   0x0000fffff7f9d6dc:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d6e0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d6e4:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7f9d6e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9d6ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d6f0:	d63f0200	blr	x16
   0x0000fffff7f9d6f4:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f9d6f8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f9d6fc:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f9d700:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f9d704:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f9d708:	d65f03c0	ret
   0x0000fffff7f9d70c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d710:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d714:	b900028a	str	w10, [x20]
   0x0000fffff7f9d718:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f9d71c:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f9d720:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f9d724:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f9d728:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f9d72c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f9d730:	d65f03c0	ret
   0x0000fffff7f9d734:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f9d738:	17fffff5	b	0xfffff7f9d70c
   0x0000fffff7f9d73c:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f9d740:	17fffff3	b	0xfffff7f9d70c
   0x0000fffff7f9d744:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f9d748:	17fffff1	b	0xfffff7f9d70c
   0x0000fffff7f9d74c:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f9d750:	17ffffef	b	0xfffff7f9d70c
   0x0000fffff7f9d754:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f9d758:	17ffffed	b	0xfffff7f9d70c
   0x0000fffff7f9d75c:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f9d760:	17ffffeb	b	0xfffff7f9d70c
   0x0000fffff7f9d764:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f9d768:	17ffffe9	b	0xfffff7f9d70c
   0x0000fffff7f9d76c:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f9d770:	17ffffe7	b	0xfffff7f9d70c
   0x0000fffff7f9d774:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f9d778:	17ffffe5	b	0xfffff7f9d70c
   0x0000fffff7f9d77c:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f9d780:	17ffffe3	b	0xfffff7f9d70c
   0x0000fffff7f9d784:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7f9d788:	17ffffe1	b	0xfffff7f9d70c
   0x0000fffff7f9d78c:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7f9d790:	17ffffdf	b	0xfffff7f9d70c
   0x0000fffff7f9d794:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7f9d798:	17ffffdd	b	0xfffff7f9d70c
   0x0000fffff7f9d79c:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7f9d7a0:	17ffffdb	b	0xfffff7f9d70c
   0x0000fffff7f9d7a4:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7f9d7a8:	17ffffd9	b	0xfffff7f9d70c
   0x0000fffff7f9d7ac:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7f9d7b0:	17ffffd7	b	0xfffff7f9d70c
   0x0000fffff7f9d7b4:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7f9d7b8:	17ffffd5	b	0xfffff7f9d70c
   0x0000fffff7f9d7bc:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7f9d7c0:	17ffffd3	b	0xfffff7f9d70c
   0x0000fffff7f9d7c4:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7f9d7c8:	17ffffd1	b	0xfffff7f9d70c
   0x0000fffff7f9d7cc:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7f9d7d0:	17ffffcf	b	0xfffff7f9d70c
   0x0000fffff7f9d7d4:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7f9d7d8:	17ffffcd	b	0xfffff7f9d70c
   0x0000fffff7f9d7dc:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7f9d7e0:	17ffffcb	b	0xfffff7f9d70c
   0x0000fffff7f9d7e4:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7f9d7e8:	17ffffc9	b	0xfffff7f9d70c
   0x0000fffff7f9d7ec:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7f9d7f0:	17ffffc7	b	0xfffff7f9d70c
   0x0000fffff7f9d7f4:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7f9d7f8:	17ffffc5	b	0xfffff7f9d70c
   0x0000fffff7f9d7fc:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7f9d800:	17ffffc3	b	0xfffff7f9d70c
   0x0000fffff7f9d804:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7f9d808:	17ffffc1	b	0xfffff7f9d70c
   0x0000fffff7f9d80c:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7f9d810:	17ffffbf	b	0xfffff7f9d70c
   0x0000fffff7f9d814:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7f9d818:	17ffffbd	b	0xfffff7f9d70c
   0x0000fffff7f9d81c:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7f9d820:	17ffffbb	b	0xfffff7f9d70c
   0x0000fffff7f9d824:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7f9d828:	17ffffb9	b	0xfffff7f9d70c
   0x0000fffff7f9d82c:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7f9d830:	17ffffb7	b	0xfffff7f9d70c
   0x0000fffff7f9d834:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7f9d838:	17ffffb5	b	0xfffff7f9d70c
   0x0000fffff7f9d83c:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7f9d840:	17ffffb3	b	0xfffff7f9d70c
   0x0000fffff7f9d844:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7f9d848:	17ffffb1	b	0xfffff7f9d70c
   0x0000fffff7f9d84c:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7f9d850:	17ffffaf	b	0xfffff7f9d70c
   0x0000fffff7f9d854:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7f9d858:	17ffffad	b	0xfffff7f9d70c
   0x0000fffff7f9d85c:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7f9d860:	17ffffab	b	0xfffff7f9d70c
   0x0000fffff7f9d864:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7f9d868:	17ffffa9	b	0xfffff7f9d70c
   0x0000fffff7f9d86c:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7f9d870:	17ffffa7	b	0xfffff7f9d70c
   0x0000fffff7f9d874:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7f9d878:	17ffffa5	b	0xfffff7f9d70c
   0x0000fffff7f9d87c:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7f9d880:	17ffffa3	b	0xfffff7f9d70c
   0x0000fffff7f9d884:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7f9d888:	17ffffa1	b	0xfffff7f9d70c
   0x0000fffff7f9d88c:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7f9d890:	17ffff9f	b	0xfffff7f9d70c
   0x0000fffff7f9d894:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7f9d898:	17ffff9d	b	0xfffff7f9d70c
   0x0000fffff7f9d89c:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7f9d8a0:	17ffff9b	b	0xfffff7f9d70c
   0x0000fffff7f9d8a4:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7f9d8a8:	17ffff99	b	0xfffff7f9d70c
   0x0000fffff7f9d8ac:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7f9d8b0:	17ffff97	b	0xfffff7f9d70c
   0x0000fffff7f9d8b4:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7f9d8b8:	17ffff95	b	0xfffff7f9d70c
   0x0000fffff7f9d8bc:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7f9d8c0:	17ffff93	b	0xfffff7f9d70c
   0x0000fffff7f9d8c4:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7f9d8c8:	17ffff91	b	0xfffff7f9d70c
   0x0000fffff7f9d8cc:	d2800669	mov	x9, #0x33                  	// #51
   0x0000fffff7f9d8d0:	17ffff8f	b	0xfffff7f9d70c
   0x0000fffff7f9d8d4:	d2800689	mov	x9, #0x34                  	// #52
   0x0000fffff7f9d8d8:	17ffff8d	b	0xfffff7f9d70c
   0x0000fffff7f9d8dc:	d28006a9	mov	x9, #0x35                  	// #53
   0x0000fffff7f9d8e0:	17ffff8b	b	0xfffff7f9d70c
   0x0000fffff7f9d8e4:	d28006c9	mov	x9, #0x36                  	// #54
   0x0000fffff7f9d8e8:	17ffff89	b	0xfffff7f9d70c
   0x0000fffff7f9d8ec:	d28006e9	mov	x9, #0x37                  	// #55
   0x0000fffff7f9d8f0:	17ffff87	b	0xfffff7f9d70c
   0x0000fffff7f9d8f4:	d2800709	mov	x9, #0x38                  	// #56
   0x0000fffff7f9d8f8:	17ffff85	b	0xfffff7f9d70c
   0x0000fffff7f9d8fc:	d2800729	mov	x9, #0x39                  	// #57
   0x0000fffff7f9d900:	17ffff83	b	0xfffff7f9d70c
   0x0000fffff7f9d904:	d2800749	mov	x9, #0x3a                  	// #58
   0x0000fffff7f9d908:	17ffff81	b	0xfffff7f9d70c
   0x0000fffff7f9d90c:	d2800769	mov	x9, #0x3b                  	// #59
   0x0000fffff7f9d910:	17ffff7f	b	0xfffff7f9d70c
   0x0000fffff7f9d914:	d2800789	mov	x9, #0x3c                  	// #60
   0x0000fffff7f9d918:	17ffff7d	b	0xfffff7f9d70c
   0x0000fffff7f9d91c:	d28007a9	mov	x9, #0x3d                  	// #61
   0x0000fffff7f9d920:	17ffff7b	b	0xfffff7f9d70c
   0x0000fffff7f9d924:	d28007c9	mov	x9, #0x3e                  	// #62
   0x0000fffff7f9d928:	17ffff79	b	0xfffff7f9d70c
   0x0000fffff7f9d92c:	d28007e9	mov	x9, #0x3f                  	// #63
   0x0000fffff7f9d930:	17ffff77	b	0xfffff7f9d70c
   0x0000fffff7f9d934:	d2800809	mov	x9, #0x40                  	// #64
   0x0000fffff7f9d938:	17ffff75	b	0xfffff7f9d70c
   0x0000fffff7f9d93c:	d2800829	mov	x9, #0x41                  	// #65
   0x0000fffff7f9d940:	17ffff73	b	0xfffff7f9d70c
   0x0000fffff7f9d944:	d2800849	mov	x9, #0x42                  	// #66
   0x0000fffff7f9d948:	17ffff71	b	0xfffff7f9d70c
   0x0000fffff7f9d94c:	d2800869	mov	x9, #0x43                  	// #67
   0x0000fffff7f9d950:	17ffff6f	b	0xfffff7f9d70c
   0x0000fffff7f9d954:	d2800889	mov	x9, #0x44                  	// #68
   0x0000fffff7f9d958:	17ffff6d	b	0xfffff7f9d70c
   0x0000fffff7f9d95c:	d28008a9	mov	x9, #0x45                  	// #69
   0x0000fffff7f9d960:	17ffff6b	b	0xfffff7f9d70c
   0x0000fffff7f9d964:	d28008c9	mov	x9, #0x46                  	// #70
   0x0000fffff7f9d968:	17ffff69	b	0xfffff7f9d70c
   0x0000fffff7f9d96c:	d28008e9	mov	x9, #0x47                  	// #71
   0x0000fffff7f9d970:	17ffff67	b	0xfffff7f9d70c
   0x0000fffff7f9d974:	d2800909	mov	x9, #0x48                  	// #72
   0x0000fffff7f9d978:	17ffff65	b	0xfffff7f9d70c
   0x0000fffff7f9d97c:	d2800929	mov	x9, #0x49                  	// #73
   0x0000fffff7f9d980:	17ffff63	b	0xfffff7f9d70c
   0x0000fffff7f9d984:	d2800949	mov	x9, #0x4a                  	// #74
   0x0000fffff7f9d988:	17ffff61	b	0xfffff7f9d70c
   0x0000fffff7f9d98c:	d2800969	mov	x9, #0x4b                  	// #75
   0x0000fffff7f9d990:	17ffff5f	b	0xfffff7f9d70c
   0x0000fffff7f9d994:	d2800989	mov	x9, #0x4c                  	// #76
   0x0000fffff7f9d998:	17ffff5d	b	0xfffff7f9d70c
   0x0000fffff7f9d99c:	d28009a9	mov	x9, #0x4d                  	// #77
   0x0000fffff7f9d9a0:	17ffff5b	b	0xfffff7f9d70c
   0x0000fffff7f9d9a4:	d28009c9	mov	x9, #0x4e                  	// #78
   0x0000fffff7f9d9a8:	17ffff59	b	0xfffff7f9d70c
   0x0000fffff7f9d9ac:	d28009e9	mov	x9, #0x4f                  	// #79
   0x0000fffff7f9d9b0:	17ffff57	b	0xfffff7f9d70c
   0x0000fffff7f9d9b4:	00000000	udf	#0
   0x0000fffff7f9d9b8:	00000000	udf	#0
   0x0000fffff7f9d9bc:	00000000	udf	#0
   0x0000fffff7f9d9c0:	00000000	udf	#0
   0x0000fffff7f9d9c4:	00000000	udf	#0
   0x0000fffff7f9d9c8:	00000000	udf	#0
   0x0000fffff7f9d9cc:	00000000	udf	#0
   0x0000fffff7f9d9d0:	00000000	udf	#0
   0x0000fffff7f9d9d4:	00000000	udf	#0
   0x0000fffff7f9d9d8:	00000000	udf	#0
   0x0000fffff7f9d9dc:	00000000	udf	#0
   0x0000fffff7f9d9e0:	00000000	udf	#0
   0x0000fffff7f9d9e4:	00000000	udf	#0
   0x0000fffff7f9d9e8:	00000000	udf	#0
   0x0000fffff7f9d9ec:	00000000	udf	#0
   0x0000fffff7f9d9f0:	00000000	udf	#0
   0x0000fffff7f9d9f4:	00000000	udf	#0
   0x0000fffff7f9d9f8:	00000000	udf	#0
   0x0000fffff7f9d9fc:	00000000	udf	#0
   0x0000fffff7f9da00:	00000000	udf	#0
   0x0000fffff7f9da04:	00000000	udf	#0
   0x0000fffff7f9da08:	00000000	udf	#0
   0x0000fffff7f9da0c:	00000000	udf	#0
   0x0000fffff7f9da10:	00000000	udf	#0
   0x0000fffff7f9da14:	00000000	udf	#0
   0x0000fffff7f9da18:	00000000	udf	#0
   0x0000fffff7f9da1c:	00000000	udf	#0
   0x0000fffff7f9da20:	00000000	udf	#0
   0x0000fffff7f9da24:	00000000	udf	#0
   0x0000fffff7f9da28:	00000000	udf	#0
   0x0000fffff7f9da2c:	00000000	udf	#0
   0x0000fffff7f9da30:	00000000	udf	#0
   0x0000fffff7f9da34:	00000000	udf	#0
   0x0000fffff7f9da38:	00000000	udf	#0
   0x0000fffff7f9da3c:	00000000	udf	#0
   0x0000fffff7f9da40:	00000000	udf	#0
   0x0000fffff7f9da44:	00000000	udf	#0
   0x0000fffff7f9da48:	00000000	udf	#0
   0x0000fffff7f9da4c:	00000000	udf	#0
   0x0000fffff7f9da50:	00000000	udf	#0
   0x0000fffff7f9da54:	00000000	udf	#0
   0x0000fffff7f9da58:	00000000	udf	#0
   0x0000fffff7f9da5c:	00000000	udf	#0
   0x0000fffff7f9da60:	00000000	udf	#0
   0x0000fffff7f9da64:	00000000	udf	#0
   0x0000fffff7f9da68:	00000000	udf	#0
   0x0000fffff7f9da6c:	00000000	udf	#0
   0x0000fffff7f9da70:	00000000	udf	#0
   0x0000fffff7f9da74:	00000000	udf	#0
   0x0000fffff7f9da78:	00000000	udf	#0
   0x0000fffff7f9da7c:	00000000	udf	#0
   0x0000fffff7f9da80:	00000000	udf	#0
   0x0000fffff7f9da84:	00000000	udf	#0
   0x0000fffff7f9da88:	00000000	udf	#0
   0x0000fffff7f9da8c:	00000000	udf	#0
   0x0000fffff7f9da90:	00000000	udf	#0
   0x0000fffff7f9da94:	00000000	udf	#0
   0x0000fffff7f9da98:	00000000	udf	#0
   0x0000fffff7f9da9c:	00000000	udf	#0
   0x0000fffff7f9daa0:	00000000	udf	#0
   0x0000fffff7f9daa4:	00000000	udf	#0
   0x0000fffff7f9daa8:	00000000	udf	#0
   0x0000fffff7f9daac:	00000000	udf	#0
   0x0000fffff7f9dab0:	00000000	udf	#0
   0x0000fffff7f9dab4:	00000000	udf	#0
   0x0000fffff7f9dab8:	00000000	udf	#0
   0x0000fffff7f9dabc:	00000000	udf	#0
   0x0000fffff7f9dac0:	00000000	udf	#0
   0x0000fffff7f9dac4:	00000000	udf	#0
   0x0000fffff7f9dac8:	00000000	udf	#0
   0x0000fffff7f9dacc:	00000000	udf	#0
   0x0000fffff7f9dad0:	00000000	udf	#0
   0x0000fffff7f9dad4:	00000000	udf	#0
   0x0000fffff7f9dad8:	00000000	udf	#0
   0x0000fffff7f9dadc:	00000000	udf	#0
   0x0000fffff7f9dae0:	00000000	udf	#0
   0x0000fffff7f9dae4:	00000000	udf	#0
   0x0000fffff7f9dae8:	00000000	udf	#0
   0x0000fffff7f9daec:	00000000	udf	#0
   0x0000fffff7f9daf0:	00000000	udf	#0
   0x0000fffff7f9daf4:	00000000	udf	#0
   0x0000fffff7f9daf8:	00000000	udf	#0
   0x0000fffff7f9dafc:	00000000	udf	#0
   0x0000fffff7f9db00:	00000000	udf	#0
   0x0000fffff7f9db04:	00000000	udf	#0
   0x0000fffff7f9db08:	00000000	udf	#0
   0x0000fffff7f9db0c:	00000000	udf	#0
   0x0000fffff7f9db10:	00000000	udf	#0
   0x0000fffff7f9db14:	00000000	udf	#0
   0x0000fffff7f9db18:	00000000	udf	#0
   0x0000fffff7f9db1c:	00000000	udf	#0
   0x0000fffff7f9db20:	00000000	udf	#0
   0x0000fffff7f9db24:	00000000	udf	#0
   0x0000fffff7f9db28:	00000000	udf	#0
   0x0000fffff7f9db2c:	00000000	udf	#0
   0x0000fffff7f9db30:	00000000	udf	#0
   0x0000fffff7f9db34:	00000000	udf	#0
   0x0000fffff7f9db38:	00000000	udf	#0
   0x0000fffff7f9db3c:	00000000	udf	#0
   0x0000fffff7f9db40:	00000000	udf	#0
   0x0000fffff7f9db44:	00000000	udf	#0
   0x0000fffff7f9db48:	00000000	udf	#0
   0x0000fffff7f9db4c:	00000000	udf	#0
   0x0000fffff7f9db50:	00000000	udf	#0
   0x0000fffff7f9db54:	00000000	udf	#0
   0x0000fffff7f9db58:	00000000	udf	#0
   0x0000fffff7f9db5c:	00000000	udf	#0
   0x0000fffff7f9db60:	00000000	udf	#0
   0x0000fffff7f9db64:	00000000	udf	#0
   0x0000fffff7f9db68:	00000000	udf	#0
   0x0000fffff7f9db6c:	00000000	udf	#0
   0x0000fffff7f9db70:	00000000	udf	#0
   0x0000fffff7f9db74:	00000000	udf	#0
   0x0000fffff7f9db78:	00000000	udf	#0
   0x0000fffff7f9db7c:	00000000	udf	#0
   0x0000fffff7f9db80:	00000000	udf	#0
   0x0000fffff7f9db84:	00000000	udf	#0
   0x0000fffff7f9db88:	00000000	udf	#0
   0x0000fffff7f9db8c:	00000000	udf	#0
   0x0000fffff7f9db90:	00000000	udf	#0
   0x0000fffff7f9db94:	00000000	udf	#0
   0x0000fffff7f9db98:	00000000	udf	#0
   0x0000fffff7f9db9c:	00000000	udf	#0
   0x0000fffff7f9dba0:	00000000	udf	#0
   0x0000fffff7f9dba4:	00000000	udf	#0
   0x0000fffff7f9dba8:	00000000	udf	#0
   0x0000fffff7f9dbac:	00000000	udf	#0
   0x0000fffff7f9dbb0:	00000000	udf	#0
   0x0000fffff7f9dbb4:	00000000	udf	#0
   0x0000fffff7f9dbb8:	00000000	udf	#0
   0x0000fffff7f9dbbc:	00000000	udf	#0
   0x0000fffff7f9dbc0:	00000000	udf	#0
   0x0000fffff7f9dbc4:	00000000	udf	#0
   0x0000fffff7f9dbc8:	00000000	udf	#0
   0x0000fffff7f9dbcc:	00000000	udf	#0
   0x0000fffff7f9dbd0:	00000000	udf	#0
   0x0000fffff7f9dbd4:	00000000	udf	#0
   0x0000fffff7f9dbd8:	00000000	udf	#0
   0x0000fffff7f9dbdc:	00000000	udf	#0
   0x0000fffff7f9dbe0:	00000000	udf	#0
   0x0000fffff7f9dbe4:	00000000	udf	#0
   0x0000fffff7f9dbe8:	00000000	udf	#0
   0x0000fffff7f9dbec:	00000000	udf	#0
   0x0000fffff7f9dbf0:	00000000	udf	#0
   0x0000fffff7f9dbf4:	00000000	udf	#0
   0x0000fffff7f9dbf8:	00000000	udf	#0
   0x0000fffff7f9dbfc:	00000000	udf	#0
   0x0000fffff7f9dc00:	00000000	udf	#0
   0x0000fffff7f9dc04:	00000000	udf	#0
   0x0000fffff7f9dc08:	00000000	udf	#0
   0x0000fffff7f9dc0c:	00000000	udf	#0
   0x0000fffff7f9dc10:	00000000	udf	#0
   0x0000fffff7f9dc14:	00000000	udf	#0
   0x0000fffff7f9dc18:	00000000	udf	#0
   0x0000fffff7f9dc1c:	00000000	udf	#0
   0x0000fffff7f9dc20:	00000000	udf	#0
   0x0000fffff7f9dc24:	00000000	udf	#0
   0x0000fffff7f9dc28:	00000000	udf	#0
   0x0000fffff7f9dc2c:	00000000	udf	#0
   0x0000fffff7f9dc30:	00000000	udf	#0
   0x0000fffff7f9dc34:	00000000	udf	#0
   0x0000fffff7f9dc38:	00000000	udf	#0
   0x0000fffff7f9dc3c:	00000000	udf	#0
   0x0000fffff7f9dc40:	00000000	udf	#0
   0x0000fffff7f9dc44:	00000000	udf	#0
   0x0000fffff7f9dc48:	00000000	udf	#0
   0x0000fffff7f9dc4c:	00000000	udf	#0
   0x0000fffff7f9dc50:	00000000	udf	#0
   0x0000fffff7f9dc54:	00000000	udf	#0
   0x0000fffff7f9dc58:	00000000	udf	#0
   0x0000fffff7f9dc5c:	00000000	udf	#0
   0x0000fffff7f9dc60:	00000000	udf	#0
   0x0000fffff7f9dc64:	00000000	udf	#0
   0x0000fffff7f9dc68:	00000000	udf	#0
   0x0000fffff7f9dc6c:	00000000	udf	#0
   0x0000fffff7f9dc70:	00000000	udf	#0
   0x0000fffff7f9dc74:	00000000	udf	#0
   0x0000fffff7f9dc78:	00000000	udf	#0
   0x0000fffff7f9dc7c:	00000000	udf	#0
   0x0000fffff7f9dc80:	00000000	udf	#0
   0x0000fffff7f9dc84:	00000000	udf	#0
   0x0000fffff7f9dc88:	00000000	udf	#0
   0x0000fffff7f9dc8c:	00000000	udf	#0
   0x0000fffff7f9dc90:	00000000	udf	#0
   0x0000fffff7f9dc94:	00000000	udf	#0
   0x0000fffff7f9dc98:	00000000	udf	#0
   0x0000fffff7f9dc9c:	00000000	udf	#0
   0x0000fffff7f9dca0:	00000000	udf	#0
   0x0000fffff7f9dca4:	00000000	udf	#0
   0x0000fffff7f9dca8:	00000000	udf	#0
   0x0000fffff7f9dcac:	00000000	udf	#0
   0x0000fffff7f9dcb0:	00000000	udf	#0
   0x0000fffff7f9dcb4:	00000000	udf	#0
   0x0000fffff7f9dcb8:	00000000	udf	#0
   0x0000fffff7f9dcbc:	00000000	udf	#0
   0x0000fffff7f9dcc0:	00000000	udf	#0
   0x0000fffff7f9dcc4:	00000000	udf	#0
   0x0000fffff7f9dcc8:	00000000	udf	#0
   0x0000fffff7f9dccc:	00000000	udf	#0
   0x0000fffff7f9dcd0:	00000000	udf	#0
   0x0000fffff7f9dcd4:	00000000	udf	#0
   0x0000fffff7f9dcd8:	00000000	udf	#0
   0x0000fffff7f9dcdc:	00000000	udf	#0
   0x0000fffff7f9dce0:	00000000	udf	#0
   0x0000fffff7f9dce4:	00000000	udf	#0
   0x0000fffff7f9dce8:	00000000	udf	#0
   0x0000fffff7f9dcec:	00000000	udf	#0
   0x0000fffff7f9dcf0:	00000000	udf	#0
   0x0000fffff7f9dcf4:	00000000	udf	#0
   0x0000fffff7f9dcf8:	00000000	udf	#0
   0x0000fffff7f9dcfc:	00000000	udf	#0
   0x0000fffff7f9dd00:	00000000	udf	#0
   0x0000fffff7f9dd04:	00000000	udf	#0
   0x0000fffff7f9dd08:	00000000	udf	#0
   0x0000fffff7f9dd0c:	00000000	udf	#0
   0x0000fffff7f9dd10:	00000000	udf	#0
   0x0000fffff7f9dd14:	00000000	udf	#0
   0x0000fffff7f9dd18:	00000000	udf	#0
   0x0000fffff7f9dd1c:	00000000	udf	#0
   0x0000fffff7f9dd20:	00000000	udf	#0
   0x0000fffff7f9dd24:	00000000	udf	#0
   0x0000fffff7f9dd28:	00000000	udf	#0
   0x0000fffff7f9dd2c:	00000000	udf	#0
   0x0000fffff7f9dd30:	00000000	udf	#0
   0x0000fffff7f9dd34:	00000000	udf	#0
   0x0000fffff7f9dd38:	00000000	udf	#0
   0x0000fffff7f9dd3c:	00000000	udf	#0
   0x0000fffff7f9dd40:	00000000	udf	#0
   0x0000fffff7f9dd44:	00000000	udf	#0
   0x0000fffff7f9dd48:	00000000	udf	#0
   0x0000fffff7f9dd4c:	00000000	udf	#0
   0x0000fffff7f9dd50:	00000000	udf	#0
   0x0000fffff7f9dd54:	00000000	udf	#0
   0x0000fffff7f9dd58:	00000000	udf	#0
   0x0000fffff7f9dd5c:	00000000	udf	#0
   0x0000fffff7f9dd60:	00000000	udf	#0
   0x0000fffff7f9dd64:	00000000	udf	#0
   0x0000fffff7f9dd68:	00000000	udf	#0
   0x0000fffff7f9dd6c:	00000000	udf	#0
   0x0000fffff7f9dd70:	00000000	udf	#0
   0x0000fffff7f9dd74:	00000000	udf	#0
   0x0000fffff7f9dd78:	00000000	udf	#0
   0x0000fffff7f9dd7c:	00000000	udf	#0
   0x0000fffff7f9dd80:	00000000	udf	#0
   0x0000fffff7f9dd84:	00000000	udf	#0
   0x0000fffff7f9dd88:	00000000	udf	#0
   0x0000fffff7f9dd8c:	00000000	udf	#0
   0x0000fffff7f9dd90:	00000000	udf	#0
   0x0000fffff7f9dd94:	00000000	udf	#0
   0x0000fffff7f9dd98:	00000000	udf	#0
   0x0000fffff7f9dd9c:	00000000	udf	#0
   0x0000fffff7f9dda0:	00000000	udf	#0
   0x0000fffff7f9dda4:	00000000	udf	#0
   0x0000fffff7f9dda8:	00000000	udf	#0
   0x0000fffff7f9ddac:	00000000	udf	#0
   0x0000fffff7f9ddb0:	00000000	udf	#0
   0x0000fffff7f9ddb4:	00000000	udf	#0
   0x0000fffff7f9ddb8:	00000000	udf	#0
   0x0000fffff7f9ddbc:	00000000	udf	#0
   0x0000fffff7f9ddc0:	00000000	udf	#0
   0x0000fffff7f9ddc4:	00000000	udf	#0
   0x0000fffff7f9ddc8:	00000000	udf	#0
   0x0000fffff7f9ddcc:	00000000	udf	#0
   0x0000fffff7f9ddd0:	00000000	udf	#0
   0x0000fffff7f9ddd4:	00000000	udf	#0
   0x0000fffff7f9ddd8:	00000000	udf	#0
   0x0000fffff7f9dddc:	00000000	udf	#0
   0x0000fffff7f9dde0:	00000000	udf	#0
   0x0000fffff7f9dde4:	00000000	udf	#0
   0x0000fffff7f9dde8:	00000000	udf	#0
   0x0000fffff7f9ddec:	00000000	udf	#0
   0x0000fffff7f9ddf0:	00000000	udf	#0
   0x0000fffff7f9ddf4:	00000000	udf	#0
   0x0000fffff7f9ddf8:	00000000	udf	#0
   0x0000fffff7f9ddfc:	00000000	udf	#0
   0x0000fffff7f9de00:	00000000	udf	#0
   0x0000fffff7f9de04:	00000000	udf	#0
   0x0000fffff7f9de08:	00000000	udf	#0
   0x0000fffff7f9de0c:	00000000	udf	#0
   0x0000fffff7f9de10:	00000000	udf	#0
   0x0000fffff7f9de14:	00000000	udf	#0
   0x0000fffff7f9de18:	00000000	udf	#0
   0x0000fffff7f9de1c:	00000000	udf	#0
   0x0000fffff7f9de20:	00000000	udf	#0
   0x0000fffff7f9de24:	00000000	udf	#0
   0x0000fffff7f9de28:	00000000	udf	#0
   0x0000fffff7f9de2c:	00000000	udf	#0
   0x0000fffff7f9de30:	00000000	udf	#0
   0x0000fffff7f9de34:	00000000	udf	#0
   0x0000fffff7f9de38:	00000000	udf	#0
   0x0000fffff7f9de3c:	00000000	udf	#0
   0x0000fffff7f9de40:	00000000	udf	#0
   0x0000fffff7f9de44:	00000000	udf	#0
   0x0000fffff7f9de48:	00000000	udf	#0
   0x0000fffff7f9de4c:	00000000	udf	#0
   0x0000fffff7f9de50:	00000000	udf	#0
   0x0000fffff7f9de54:	00000000	udf	#0
   0x0000fffff7f9de58:	00000000	udf	#0
   0x0000fffff7f9de5c:	00000000	udf	#0
   0x0000fffff7f9de60:	00000000	udf	#0
   0x0000fffff7f9de64:	00000000	udf	#0
   0x0000fffff7f9de68:	00000000	udf	#0
   0x0000fffff7f9de6c:	00000000	udf	#0
   0x0000fffff7f9de70:	00000000	udf	#0
   0x0000fffff7f9de74:	00000000	udf	#0
   0x0000fffff7f9de78:	00000000	udf	#0
   0x0000fffff7f9de7c:	00000000	udf	#0
   0x0000fffff7f9de80:	00000000	udf	#0
   0x0000fffff7f9de84:	00000000	udf	#0
   0x0000fffff7f9de88:	00000000	udf	#0
   0x0000fffff7f9de8c:	00000000	udf	#0
   0x0000fffff7f9de90:	00000000	udf	#0
   0x0000fffff7f9de94:	00000000	udf	#0
   0x0000fffff7f9de98:	00000000	udf	#0
   0x0000fffff7f9de9c:	00000000	udf	#0
   0x0000fffff7f9dea0:	00000000	udf	#0
   0x0000fffff7f9dea4:	00000000	udf	#0
   0x0000fffff7f9dea8:	00000000	udf	#0
   0x0000fffff7f9deac:	00000000	udf	#0
   0x0000fffff7f9deb0:	00000000	udf	#0
   0x0000fffff7f9deb4:	00000000	udf	#0
   0x0000fffff7f9deb8:	00000000	udf	#0
   0x0000fffff7f9debc:	00000000	udf	#0
   0x0000fffff7f9dec0:	00000000	udf	#0
   0x0000fffff7f9dec4:	00000000	udf	#0
   0x0000fffff7f9dec8:	00000000	udf	#0
   0x0000fffff7f9decc:	00000000	udf	#0
   0x0000fffff7f9ded0:	00000000	udf	#0
   0x0000fffff7f9ded4:	00000000	udf	#0
   0x0000fffff7f9ded8:	00000000	udf	#0
   0x0000fffff7f9dedc:	00000000	udf	#0
   0x0000fffff7f9dee0:	00000000	udf	#0
   0x0000fffff7f9dee4:	00000000	udf	#0
   0x0000fffff7f9dee8:	00000000	udf	#0
   0x0000fffff7f9deec:	00000000	udf	#0
   0x0000fffff7f9def0:	00000000	udf	#0
   0x0000fffff7f9def4:	00000000	udf	#0
   0x0000fffff7f9def8:	00000000	udf	#0
   0x0000fffff7f9defc:	00000000	udf	#0
   0x0000fffff7f9df00:	00000000	udf	#0
   0x0000fffff7f9df04:	00000000	udf	#0
   0x0000fffff7f9df08:	00000000	udf	#0
   0x0000fffff7f9df0c:	00000000	udf	#0
   0x0000fffff7f9df10:	00000000	udf	#0
   0x0000fffff7f9df14:	00000000	udf	#0
   0x0000fffff7f9df18:	00000000	udf	#0
   0x0000fffff7f9df1c:	00000000	udf	#0
   0x0000fffff7f9df20:	00000000	udf	#0
   0x0000fffff7f9df24:	00000000	udf	#0
   0x0000fffff7f9df28:	00000000	udf	#0
   0x0000fffff7f9df2c:	00000000	udf	#0
   0x0000fffff7f9df30:	00000000	udf	#0
   0x0000fffff7f9df34:	00000000	udf	#0
   0x0000fffff7f9df38:	00000000	udf	#0
   0x0000fffff7f9df3c:	00000000	udf	#0
   0x0000fffff7f9df40:	00000000	udf	#0
   0x0000fffff7f9df44:	00000000	udf	#0
   0x0000fffff7f9df48:	00000000	udf	#0
   0x0000fffff7f9df4c:	00000000	udf	#0
   0x0000fffff7f9df50:	00000000	udf	#0
   0x0000fffff7f9df54:	00000000	udf	#0
   0x0000fffff7f9df58:	00000000	udf	#0
   0x0000fffff7f9df5c:	00000000	udf	#0
   0x0000fffff7f9df60:	00000000	udf	#0
   0x0000fffff7f9df64:	00000000	udf	#0
   0x0000fffff7f9df68:	00000000	udf	#0
   0x0000fffff7f9df6c:	00000000	udf	#0
   0x0000fffff7f9df70:	00000000	udf	#0
   0x0000fffff7f9df74:	00000000	udf	#0
   0x0000fffff7f9df78:	00000000	udf	#0
   0x0000fffff7f9df7c:	00000000	udf	#0
   0x0000fffff7f9df80:	00000000	udf	#0
   0x0000fffff7f9df84:	00000000	udf	#0
   0x0000fffff7f9df88:	00000000	udf	#0
   0x0000fffff7f9df8c:	00000000	udf	#0
   0x0000fffff7f9df90:	00000000	udf	#0
   0x0000fffff7f9df94:	00000000	udf	#0
   0x0000fffff7f9df98:	00000000	udf	#0
   0x0000fffff7f9df9c:	00000000	udf	#0
   0x0000fffff7f9dfa0:	00000000	udf	#0
   0x0000fffff7f9dfa4:	00000000	udf	#0
   0x0000fffff7f9dfa8:	00000000	udf	#0
   0x0000fffff7f9dfac:	00000000	udf	#0
   0x0000fffff7f9dfb0:	00000000	udf	#0
   0x0000fffff7f9dfb4:	00000000	udf	#0
   0x0000fffff7f9dfb8:	00000000	udf	#0
   0x0000fffff7f9dfbc:	00000000	udf	#0
   0x0000fffff7f9dfc0:	00000000	udf	#0
   0x0000fffff7f9dfc4:	00000000	udf	#0
   0x0000fffff7f9dfc8:	00000000	udf	#0
   0x0000fffff7f9dfcc:	00000000	udf	#0
   0x0000fffff7f9dfd0:	00000000	udf	#0
   0x0000fffff7f9dfd4:	00000000	udf	#0
   0x0000fffff7f9dfd8:	00000000	udf	#0
   0x0000fffff7f9dfdc:	00000000	udf	#0
   0x0000fffff7f9dfe0:	00000000	udf	#0
   0x0000fffff7f9dfe4:	00000000	udf	#0
   0x0000fffff7f9dfe8:	00000000	udf	#0
   0x0000fffff7f9dfec:	00000000	udf	#0
   0x0000fffff7f9dff0:	00000000	udf	#0
   0x0000fffff7f9dff4:	00000000	udf	#0
   0x0000fffff7f9dff8:	00000000	udf	#0
   0x0000fffff7f9dffc:	00000000	udf	#0
End of assembler dump.
