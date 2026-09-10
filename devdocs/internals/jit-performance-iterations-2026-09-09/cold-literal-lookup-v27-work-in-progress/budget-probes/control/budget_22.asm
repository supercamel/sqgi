Dump of assembler code from 0xfffff7f96000 to 0xfffff7f98000:
   0x0000fffff7f96000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7f96004:	910003fd	mov	x29, sp
   0x0000fffff7f96008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7f9600c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7f96010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7f96014:	aa0003f3	mov	x19, x0
   0x0000fffff7f96018:	aa0103f4	mov	x20, x1
   0x0000fffff7f9601c:	aa0203f5	mov	x21, x2
   0x0000fffff7f96020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7f96024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7f96028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f9602c:	f90003e9	str	x9, [sp]
   0x0000fffff7f96030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7f96034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7f96038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7f9603c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f96040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96044:	d63f0200	blr	x16
   0x0000fffff7f96048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7f9604c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7f96050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7f96054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7f96058:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9605c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96060:	aa1303e1	mov	x1, x19
   0x0000fffff7f96064:	aa1503e2	mov	x2, x21
   0x0000fffff7f96068:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7f9606c:	aa1403e4	mov	x4, x20
   0x0000fffff7f96070:	aa1603e5	mov	x5, x22
   0x0000fffff7f96074:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f96078:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9607c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96080:	d63f0200	blr	x16
   0x0000fffff7f96084:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96088:	5400d060	b.eq	0xfffff7f97a94  // b.none
   0x0000fffff7f9608c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f96090:	37d800e9	tbnz	w9, #27, 0xfffff7f960ac
   0x0000fffff7f96094:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f96098:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9609c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f960a0:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f960a4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f960a8:	1400000e	b	0xfffff7f960e0
   0x0000fffff7f960ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f960b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f960b4:	aa1303e1	mov	x1, x19
   0x0000fffff7f960b8:	aa1503e2	mov	x2, x21
   0x0000fffff7f960bc:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7f960c0:	aa1403e4	mov	x4, x20
   0x0000fffff7f960c4:	aa1603e5	mov	x5, x22
   0x0000fffff7f960c8:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7f960cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f960d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f960d4:	d63f0200	blr	x16
   0x0000fffff7f960d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f960dc:	5400ce00	b.eq	0xfffff7f97a9c  // b.none
   0x0000fffff7f960e0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f960e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f960e8:	aa1303e1	mov	x1, x19
   0x0000fffff7f960ec:	aa1503e2	mov	x2, x21
   0x0000fffff7f960f0:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f960f4:	aa1403e4	mov	x4, x20
   0x0000fffff7f960f8:	aa1603e5	mov	x5, x22
   0x0000fffff7f960fc:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f96100:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f96104:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96108:	d63f0200	blr	x16
   0x0000fffff7f9610c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96110:	5400cca0	b.eq	0xfffff7f97aa4  // b.none
   0x0000fffff7f96114:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f96118:	37d800e9	tbnz	w9, #27, 0xfffff7f96134
   0x0000fffff7f9611c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f96120:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96124:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96128:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9612c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f96130:	1400000e	b	0xfffff7f96168
   0x0000fffff7f96134:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f96138:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9613c:	aa1303e1	mov	x1, x19
   0x0000fffff7f96140:	aa1503e2	mov	x2, x21
   0x0000fffff7f96144:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7f96148:	aa1403e4	mov	x4, x20
   0x0000fffff7f9614c:	aa1603e5	mov	x5, x22
   0x0000fffff7f96150:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7f96154:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f96158:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9615c:	d63f0200	blr	x16
   0x0000fffff7f96160:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96164:	5400ca40	b.eq	0xfffff7f97aac  // b.none
   0x0000fffff7f96168:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9616c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96170:	aa1303e1	mov	x1, x19
   0x0000fffff7f96174:	aa1503e2	mov	x2, x21
   0x0000fffff7f96178:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7f9617c:	aa1403e4	mov	x4, x20
   0x0000fffff7f96180:	aa1603e5	mov	x5, x22
   0x0000fffff7f96184:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f96188:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9618c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96190:	d63f0200	blr	x16
   0x0000fffff7f96194:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96198:	5400c8e0	b.eq	0xfffff7f97ab4  // b.none
   0x0000fffff7f9619c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f961a0:	37d80269	tbnz	w9, #27, 0xfffff7f961ec
   0x0000fffff7f961a4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f961a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f961ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f961b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f961b4:	540001c1	b.ne	0xfffff7f961ec  // b.any
   0x0000fffff7f961b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f961bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f961c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f961c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f961c8:	54000121	b.ne	0xfffff7f961ec  // b.any
   0x0000fffff7f961cc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f961d0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f961d4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f961d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f961dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f961e0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f961e4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f961e8:	1400000e	b	0xfffff7f96220
   0x0000fffff7f961ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f961f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f961f4:	aa1303e1	mov	x1, x19
   0x0000fffff7f961f8:	aa1503e2	mov	x2, x21
   0x0000fffff7f961fc:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f96200:	aa1403e4	mov	x4, x20
   0x0000fffff7f96204:	aa1603e5	mov	x5, x22
   0x0000fffff7f96208:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9620c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f96210:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96214:	d63f0200	blr	x16
   0x0000fffff7f96218:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9621c:	5400c500	b.eq	0xfffff7f97abc  // b.none
   0x0000fffff7f96220:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f96224:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96228:	aa1303e1	mov	x1, x19
   0x0000fffff7f9622c:	aa1503e2	mov	x2, x21
   0x0000fffff7f96230:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f96234:	aa1403e4	mov	x4, x20
   0x0000fffff7f96238:	aa1603e5	mov	x5, x22
   0x0000fffff7f9623c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f96240:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f96244:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96248:	d63f0200	blr	x16
   0x0000fffff7f9624c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96250:	5400c3a0	b.eq	0xfffff7f97ac4  // b.none
   0x0000fffff7f96254:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f96258:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9625c:	aa1303e1	mov	x1, x19
   0x0000fffff7f96260:	aa1503e2	mov	x2, x21
   0x0000fffff7f96264:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f96268:	aa1403e4	mov	x4, x20
   0x0000fffff7f9626c:	aa1603e5	mov	x5, x22
   0x0000fffff7f96270:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f96274:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f96278:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9627c:	d63f0200	blr	x16
   0x0000fffff7f96280:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96284:	5400c240	b.eq	0xfffff7f97acc  // b.none
   0x0000fffff7f96288:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9628c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96290:	aa1303e1	mov	x1, x19
   0x0000fffff7f96294:	aa1503e2	mov	x2, x21
   0x0000fffff7f96298:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f9629c:	aa1403e4	mov	x4, x20
   0x0000fffff7f962a0:	aa1603e5	mov	x5, x22
   0x0000fffff7f962a4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f962a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f962ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f962b0:	d63f0200	blr	x16
   0x0000fffff7f962b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f962b8:	5400c0e0	b.eq	0xfffff7f97ad4  // b.none
   0x0000fffff7f962bc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f962c0:	37d80269	tbnz	w9, #27, 0xfffff7f9630c
   0x0000fffff7f962c4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f962c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f962cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f962d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f962d4:	540001c1	b.ne	0xfffff7f9630c  // b.any
   0x0000fffff7f962d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f962dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f962e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f962e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f962e8:	54000121	b.ne	0xfffff7f9630c  // b.any
   0x0000fffff7f962ec:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f962f0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f962f4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f962f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f962fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96300:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f96304:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f96308:	1400000e	b	0xfffff7f96340
   0x0000fffff7f9630c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f96310:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96314:	aa1303e1	mov	x1, x19
   0x0000fffff7f96318:	aa1503e2	mov	x2, x21
   0x0000fffff7f9631c:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f96320:	aa1403e4	mov	x4, x20
   0x0000fffff7f96324:	aa1603e5	mov	x5, x22
   0x0000fffff7f96328:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9632c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f96330:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96334:	d63f0200	blr	x16
   0x0000fffff7f96338:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9633c:	5400bd00	b.eq	0xfffff7f97adc  // b.none
   0x0000fffff7f96340:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f96344:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96348:	aa1303e1	mov	x1, x19
   0x0000fffff7f9634c:	aa1503e2	mov	x2, x21
   0x0000fffff7f96350:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f96354:	aa1403e4	mov	x4, x20
   0x0000fffff7f96358:	aa1603e5	mov	x5, x22
   0x0000fffff7f9635c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f96360:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f96364:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96368:	d63f0200	blr	x16
   0x0000fffff7f9636c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96370:	5400bba0	b.eq	0xfffff7f97ae4  // b.none
   0x0000fffff7f96374:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f96378:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9637c:	aa1303e1	mov	x1, x19
   0x0000fffff7f96380:	aa1503e2	mov	x2, x21
   0x0000fffff7f96384:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7f96388:	aa1403e4	mov	x4, x20
   0x0000fffff7f9638c:	aa1603e5	mov	x5, x22
   0x0000fffff7f96390:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f96394:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f96398:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9639c:	d63f0200	blr	x16
   0x0000fffff7f963a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f963a4:	5400ba40	b.eq	0xfffff7f97aec  // b.none
   0x0000fffff7f963a8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f963ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f963b0:	aa1303e1	mov	x1, x19
   0x0000fffff7f963b4:	aa1503e2	mov	x2, x21
   0x0000fffff7f963b8:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7f963bc:	aa1403e4	mov	x4, x20
   0x0000fffff7f963c0:	aa1603e5	mov	x5, x22
   0x0000fffff7f963c4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f963c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f963cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f963d0:	d63f0200	blr	x16
   0x0000fffff7f963d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f963d8:	5400b8e0	b.eq	0xfffff7f97af4  // b.none
   0x0000fffff7f963dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f963e0:	37d80269	tbnz	w9, #27, 0xfffff7f9642c
   0x0000fffff7f963e4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f963e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f963ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f963f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f963f4:	540001c1	b.ne	0xfffff7f9642c  // b.any
   0x0000fffff7f963f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f963fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96400:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96404:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96408:	54000121	b.ne	0xfffff7f9642c  // b.any
   0x0000fffff7f9640c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f96410:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f96414:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f96418:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9641c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96420:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f96424:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f96428:	1400000e	b	0xfffff7f96460
   0x0000fffff7f9642c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f96430:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96434:	aa1303e1	mov	x1, x19
   0x0000fffff7f96438:	aa1503e2	mov	x2, x21
   0x0000fffff7f9643c:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7f96440:	aa1403e4	mov	x4, x20
   0x0000fffff7f96444:	aa1603e5	mov	x5, x22
   0x0000fffff7f96448:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9644c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f96450:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96454:	d63f0200	blr	x16
   0x0000fffff7f96458:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9645c:	5400b500	b.eq	0xfffff7f97afc  // b.none
   0x0000fffff7f96460:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f96464:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96468:	aa1303e1	mov	x1, x19
   0x0000fffff7f9646c:	aa1503e2	mov	x2, x21
   0x0000fffff7f96470:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7f96474:	aa1403e4	mov	x4, x20
   0x0000fffff7f96478:	aa1603e5	mov	x5, x22
   0x0000fffff7f9647c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f96480:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f96484:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96488:	d63f0200	blr	x16
   0x0000fffff7f9648c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96490:	5400b3a0	b.eq	0xfffff7f97b04  // b.none
   0x0000fffff7f96494:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f96498:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9649c:	aa1303e1	mov	x1, x19
   0x0000fffff7f964a0:	aa1503e2	mov	x2, x21
   0x0000fffff7f964a4:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7f964a8:	aa1403e4	mov	x4, x20
   0x0000fffff7f964ac:	aa1603e5	mov	x5, x22
   0x0000fffff7f964b0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f964b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f964b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f964bc:	d63f0200	blr	x16
   0x0000fffff7f964c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f964c4:	5400b240	b.eq	0xfffff7f97b0c  // b.none
   0x0000fffff7f964c8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f964cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f964d0:	aa1303e1	mov	x1, x19
   0x0000fffff7f964d4:	aa1503e2	mov	x2, x21
   0x0000fffff7f964d8:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7f964dc:	aa1403e4	mov	x4, x20
   0x0000fffff7f964e0:	aa1603e5	mov	x5, x22
   0x0000fffff7f964e4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f964e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f964ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f964f0:	d63f0200	blr	x16
   0x0000fffff7f964f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f964f8:	5400b0e0	b.eq	0xfffff7f97b14  // b.none
   0x0000fffff7f964fc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f96500:	37d80269	tbnz	w9, #27, 0xfffff7f9654c
   0x0000fffff7f96504:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f96508:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9650c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96510:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96514:	540001c1	b.ne	0xfffff7f9654c  // b.any
   0x0000fffff7f96518:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9651c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96520:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96524:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96528:	54000121	b.ne	0xfffff7f9654c  // b.any
   0x0000fffff7f9652c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f96530:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f96534:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f96538:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9653c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96540:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f96544:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f96548:	1400000e	b	0xfffff7f96580
   0x0000fffff7f9654c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f96550:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96554:	aa1303e1	mov	x1, x19
   0x0000fffff7f96558:	aa1503e2	mov	x2, x21
   0x0000fffff7f9655c:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7f96560:	aa1403e4	mov	x4, x20
   0x0000fffff7f96564:	aa1603e5	mov	x5, x22
   0x0000fffff7f96568:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9656c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f96570:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96574:	d63f0200	blr	x16
   0x0000fffff7f96578:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9657c:	5400ad00	b.eq	0xfffff7f97b1c  // b.none
   0x0000fffff7f96580:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f96584:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96588:	aa1303e1	mov	x1, x19
   0x0000fffff7f9658c:	aa1503e2	mov	x2, x21
   0x0000fffff7f96590:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7f96594:	aa1403e4	mov	x4, x20
   0x0000fffff7f96598:	aa1603e5	mov	x5, x22
   0x0000fffff7f9659c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f965a0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f965a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f965a8:	d63f0200	blr	x16
   0x0000fffff7f965ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7f965b0:	5400aba0	b.eq	0xfffff7f97b24  // b.none
   0x0000fffff7f965b4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f965b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f965bc:	aa1303e1	mov	x1, x19
   0x0000fffff7f965c0:	aa1503e2	mov	x2, x21
   0x0000fffff7f965c4:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7f965c8:	aa1403e4	mov	x4, x20
   0x0000fffff7f965cc:	aa1603e5	mov	x5, x22
   0x0000fffff7f965d0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f965d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f965d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f965dc:	d63f0200	blr	x16
   0x0000fffff7f965e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f965e4:	5400aa40	b.eq	0xfffff7f97b2c  // b.none
   0x0000fffff7f965e8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f965ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f965f0:	aa1303e1	mov	x1, x19
   0x0000fffff7f965f4:	aa1503e2	mov	x2, x21
   0x0000fffff7f965f8:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7f965fc:	aa1403e4	mov	x4, x20
   0x0000fffff7f96600:	aa1603e5	mov	x5, x22
   0x0000fffff7f96604:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f96608:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9660c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96610:	d63f0200	blr	x16
   0x0000fffff7f96614:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96618:	5400a8e0	b.eq	0xfffff7f97b34  // b.none
   0x0000fffff7f9661c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f96620:	37d80269	tbnz	w9, #27, 0xfffff7f9666c
   0x0000fffff7f96624:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f96628:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9662c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96630:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96634:	540001c1	b.ne	0xfffff7f9666c  // b.any
   0x0000fffff7f96638:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9663c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96640:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96644:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96648:	54000121	b.ne	0xfffff7f9666c  // b.any
   0x0000fffff7f9664c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f96650:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f96654:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f96658:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9665c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96660:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f96664:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f96668:	1400000e	b	0xfffff7f966a0
   0x0000fffff7f9666c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f96670:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96674:	aa1303e1	mov	x1, x19
   0x0000fffff7f96678:	aa1503e2	mov	x2, x21
   0x0000fffff7f9667c:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7f96680:	aa1403e4	mov	x4, x20
   0x0000fffff7f96684:	aa1603e5	mov	x5, x22
   0x0000fffff7f96688:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9668c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f96690:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96694:	d63f0200	blr	x16
   0x0000fffff7f96698:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9669c:	5400a500	b.eq	0xfffff7f97b3c  // b.none
   0x0000fffff7f966a0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f966a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f966a8:	aa1303e1	mov	x1, x19
   0x0000fffff7f966ac:	aa1503e2	mov	x2, x21
   0x0000fffff7f966b0:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7f966b4:	aa1403e4	mov	x4, x20
   0x0000fffff7f966b8:	aa1603e5	mov	x5, x22
   0x0000fffff7f966bc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f966c0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f966c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f966c8:	d63f0200	blr	x16
   0x0000fffff7f966cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f966d0:	5400a3a0	b.eq	0xfffff7f97b44  // b.none
   0x0000fffff7f966d4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f966d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f966dc:	aa1303e1	mov	x1, x19
   0x0000fffff7f966e0:	aa1503e2	mov	x2, x21
   0x0000fffff7f966e4:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7f966e8:	aa1403e4	mov	x4, x20
   0x0000fffff7f966ec:	aa1603e5	mov	x5, x22
   0x0000fffff7f966f0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f966f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f966f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f966fc:	d63f0200	blr	x16
   0x0000fffff7f96700:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96704:	5400a240	b.eq	0xfffff7f97b4c  // b.none
   0x0000fffff7f96708:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9670c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96710:	aa1303e1	mov	x1, x19
   0x0000fffff7f96714:	aa1503e2	mov	x2, x21
   0x0000fffff7f96718:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7f9671c:	aa1403e4	mov	x4, x20
   0x0000fffff7f96720:	aa1603e5	mov	x5, x22
   0x0000fffff7f96724:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f96728:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9672c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96730:	d63f0200	blr	x16
   0x0000fffff7f96734:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96738:	5400a0e0	b.eq	0xfffff7f97b54  // b.none
   0x0000fffff7f9673c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f96740:	37d80269	tbnz	w9, #27, 0xfffff7f9678c
   0x0000fffff7f96744:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f96748:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9674c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96750:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96754:	540001c1	b.ne	0xfffff7f9678c  // b.any
   0x0000fffff7f96758:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9675c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96760:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96764:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96768:	54000121	b.ne	0xfffff7f9678c  // b.any
   0x0000fffff7f9676c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f96770:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f96774:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f96778:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9677c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96780:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f96784:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f96788:	1400000e	b	0xfffff7f967c0
   0x0000fffff7f9678c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f96790:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96794:	aa1303e1	mov	x1, x19
   0x0000fffff7f96798:	aa1503e2	mov	x2, x21
   0x0000fffff7f9679c:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7f967a0:	aa1403e4	mov	x4, x20
   0x0000fffff7f967a4:	aa1603e5	mov	x5, x22
   0x0000fffff7f967a8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f967ac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f967b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f967b4:	d63f0200	blr	x16
   0x0000fffff7f967b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f967bc:	54009d00	b.eq	0xfffff7f97b5c  // b.none
   0x0000fffff7f967c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f967c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f967c8:	aa1303e1	mov	x1, x19
   0x0000fffff7f967cc:	aa1503e2	mov	x2, x21
   0x0000fffff7f967d0:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7f967d4:	aa1403e4	mov	x4, x20
   0x0000fffff7f967d8:	aa1603e5	mov	x5, x22
   0x0000fffff7f967dc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f967e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f967e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f967e8:	d63f0200	blr	x16
   0x0000fffff7f967ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f967f0:	54009ba0	b.eq	0xfffff7f97b64  // b.none
   0x0000fffff7f967f4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f967f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f967fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f96800:	aa1503e2	mov	x2, x21
   0x0000fffff7f96804:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7f96808:	aa1403e4	mov	x4, x20
   0x0000fffff7f9680c:	aa1603e5	mov	x5, x22
   0x0000fffff7f96810:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f96814:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f96818:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9681c:	d63f0200	blr	x16
   0x0000fffff7f96820:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96824:	54009a40	b.eq	0xfffff7f97b6c  // b.none
   0x0000fffff7f96828:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9682c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96830:	aa1303e1	mov	x1, x19
   0x0000fffff7f96834:	aa1503e2	mov	x2, x21
   0x0000fffff7f96838:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7f9683c:	aa1403e4	mov	x4, x20
   0x0000fffff7f96840:	aa1603e5	mov	x5, x22
   0x0000fffff7f96844:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f96848:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9684c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96850:	d63f0200	blr	x16
   0x0000fffff7f96854:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96858:	540098e0	b.eq	0xfffff7f97b74  // b.none
   0x0000fffff7f9685c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f96860:	37d80269	tbnz	w9, #27, 0xfffff7f968ac
   0x0000fffff7f96864:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f96868:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9686c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96870:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96874:	540001c1	b.ne	0xfffff7f968ac  // b.any
   0x0000fffff7f96878:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9687c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96880:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96884:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96888:	54000121	b.ne	0xfffff7f968ac  // b.any
   0x0000fffff7f9688c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f96890:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f96894:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f96898:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9689c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f968a0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f968a4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f968a8:	1400000e	b	0xfffff7f968e0
   0x0000fffff7f968ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f968b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f968b4:	aa1303e1	mov	x1, x19
   0x0000fffff7f968b8:	aa1503e2	mov	x2, x21
   0x0000fffff7f968bc:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7f968c0:	aa1403e4	mov	x4, x20
   0x0000fffff7f968c4:	aa1603e5	mov	x5, x22
   0x0000fffff7f968c8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f968cc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f968d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f968d4:	d63f0200	blr	x16
   0x0000fffff7f968d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f968dc:	54009500	b.eq	0xfffff7f97b7c  // b.none
   0x0000fffff7f968e0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f968e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f968e8:	aa1303e1	mov	x1, x19
   0x0000fffff7f968ec:	aa1503e2	mov	x2, x21
   0x0000fffff7f968f0:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7f968f4:	aa1403e4	mov	x4, x20
   0x0000fffff7f968f8:	aa1603e5	mov	x5, x22
   0x0000fffff7f968fc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f96900:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f96904:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96908:	d63f0200	blr	x16
   0x0000fffff7f9690c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96910:	540093a0	b.eq	0xfffff7f97b84  // b.none
   0x0000fffff7f96914:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f96918:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9691c:	aa1303e1	mov	x1, x19
   0x0000fffff7f96920:	aa1503e2	mov	x2, x21
   0x0000fffff7f96924:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7f96928:	aa1403e4	mov	x4, x20
   0x0000fffff7f9692c:	aa1603e5	mov	x5, x22
   0x0000fffff7f96930:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f96934:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f96938:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9693c:	d63f0200	blr	x16
   0x0000fffff7f96940:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96944:	54009240	b.eq	0xfffff7f97b8c  // b.none
   0x0000fffff7f96948:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9694c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96950:	aa1303e1	mov	x1, x19
   0x0000fffff7f96954:	aa1503e2	mov	x2, x21
   0x0000fffff7f96958:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7f9695c:	aa1403e4	mov	x4, x20
   0x0000fffff7f96960:	aa1603e5	mov	x5, x22
   0x0000fffff7f96964:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f96968:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9696c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96970:	d63f0200	blr	x16
   0x0000fffff7f96974:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96978:	540090e0	b.eq	0xfffff7f97b94  // b.none
   0x0000fffff7f9697c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f96980:	37d80269	tbnz	w9, #27, 0xfffff7f969cc
   0x0000fffff7f96984:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f96988:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9698c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96990:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96994:	540001c1	b.ne	0xfffff7f969cc  // b.any
   0x0000fffff7f96998:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9699c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f969a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f969a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f969a8:	54000121	b.ne	0xfffff7f969cc  // b.any
   0x0000fffff7f969ac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f969b0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f969b4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f969b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f969bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f969c0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f969c4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f969c8:	1400000e	b	0xfffff7f96a00
   0x0000fffff7f969cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f969d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f969d4:	aa1303e1	mov	x1, x19
   0x0000fffff7f969d8:	aa1503e2	mov	x2, x21
   0x0000fffff7f969dc:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7f969e0:	aa1403e4	mov	x4, x20
   0x0000fffff7f969e4:	aa1603e5	mov	x5, x22
   0x0000fffff7f969e8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f969ec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f969f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f969f4:	d63f0200	blr	x16
   0x0000fffff7f969f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f969fc:	54008d00	b.eq	0xfffff7f97b9c  // b.none
   0x0000fffff7f96a00:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f96a04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96a08:	aa1303e1	mov	x1, x19
   0x0000fffff7f96a0c:	aa1503e2	mov	x2, x21
   0x0000fffff7f96a10:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7f96a14:	aa1403e4	mov	x4, x20
   0x0000fffff7f96a18:	aa1603e5	mov	x5, x22
   0x0000fffff7f96a1c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f96a20:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f96a24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96a28:	d63f0200	blr	x16
   0x0000fffff7f96a2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96a30:	54008ba0	b.eq	0xfffff7f97ba4  // b.none
   0x0000fffff7f96a34:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f96a38:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96a3c:	aa1303e1	mov	x1, x19
   0x0000fffff7f96a40:	aa1503e2	mov	x2, x21
   0x0000fffff7f96a44:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7f96a48:	aa1403e4	mov	x4, x20
   0x0000fffff7f96a4c:	aa1603e5	mov	x5, x22
   0x0000fffff7f96a50:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f96a54:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f96a58:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96a5c:	d63f0200	blr	x16
   0x0000fffff7f96a60:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96a64:	54008a40	b.eq	0xfffff7f97bac  // b.none
   0x0000fffff7f96a68:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f96a6c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96a70:	aa1303e1	mov	x1, x19
   0x0000fffff7f96a74:	aa1503e2	mov	x2, x21
   0x0000fffff7f96a78:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7f96a7c:	aa1403e4	mov	x4, x20
   0x0000fffff7f96a80:	aa1603e5	mov	x5, x22
   0x0000fffff7f96a84:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f96a88:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f96a8c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96a90:	d63f0200	blr	x16
   0x0000fffff7f96a94:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96a98:	540088e0	b.eq	0xfffff7f97bb4  // b.none
   0x0000fffff7f96a9c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f96aa0:	37d80269	tbnz	w9, #27, 0xfffff7f96aec
   0x0000fffff7f96aa4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f96aa8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96aac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96ab0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96ab4:	540001c1	b.ne	0xfffff7f96aec  // b.any
   0x0000fffff7f96ab8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f96abc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96ac0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96ac4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96ac8:	54000121	b.ne	0xfffff7f96aec  // b.any
   0x0000fffff7f96acc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f96ad0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f96ad4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f96ad8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96adc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96ae0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f96ae4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f96ae8:	1400000e	b	0xfffff7f96b20
   0x0000fffff7f96aec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f96af0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96af4:	aa1303e1	mov	x1, x19
   0x0000fffff7f96af8:	aa1503e2	mov	x2, x21
   0x0000fffff7f96afc:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7f96b00:	aa1403e4	mov	x4, x20
   0x0000fffff7f96b04:	aa1603e5	mov	x5, x22
   0x0000fffff7f96b08:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f96b0c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f96b10:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96b14:	d63f0200	blr	x16
   0x0000fffff7f96b18:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96b1c:	54008500	b.eq	0xfffff7f97bbc  // b.none
   0x0000fffff7f96b20:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f96b24:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96b28:	aa1303e1	mov	x1, x19
   0x0000fffff7f96b2c:	aa1503e2	mov	x2, x21
   0x0000fffff7f96b30:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7f96b34:	aa1403e4	mov	x4, x20
   0x0000fffff7f96b38:	aa1603e5	mov	x5, x22
   0x0000fffff7f96b3c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f96b40:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f96b44:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96b48:	d63f0200	blr	x16
   0x0000fffff7f96b4c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96b50:	540083a0	b.eq	0xfffff7f97bc4  // b.none
   0x0000fffff7f96b54:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f96b58:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96b5c:	aa1303e1	mov	x1, x19
   0x0000fffff7f96b60:	aa1503e2	mov	x2, x21
   0x0000fffff7f96b64:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7f96b68:	aa1403e4	mov	x4, x20
   0x0000fffff7f96b6c:	aa1603e5	mov	x5, x22
   0x0000fffff7f96b70:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f96b74:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f96b78:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96b7c:	d63f0200	blr	x16
   0x0000fffff7f96b80:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96b84:	54008240	b.eq	0xfffff7f97bcc  // b.none
   0x0000fffff7f96b88:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f96b8c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96b90:	aa1303e1	mov	x1, x19
   0x0000fffff7f96b94:	aa1503e2	mov	x2, x21
   0x0000fffff7f96b98:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7f96b9c:	aa1403e4	mov	x4, x20
   0x0000fffff7f96ba0:	aa1603e5	mov	x5, x22
   0x0000fffff7f96ba4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f96ba8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f96bac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96bb0:	d63f0200	blr	x16
   0x0000fffff7f96bb4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96bb8:	540080e0	b.eq	0xfffff7f97bd4  // b.none
   0x0000fffff7f96bbc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f96bc0:	37d80269	tbnz	w9, #27, 0xfffff7f96c0c
   0x0000fffff7f96bc4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f96bc8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96bcc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96bd0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96bd4:	540001c1	b.ne	0xfffff7f96c0c  // b.any
   0x0000fffff7f96bd8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f96bdc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96be0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96be4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96be8:	54000121	b.ne	0xfffff7f96c0c  // b.any
   0x0000fffff7f96bec:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f96bf0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f96bf4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f96bf8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96bfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96c00:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f96c04:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f96c08:	1400000e	b	0xfffff7f96c40
   0x0000fffff7f96c0c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f96c10:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96c14:	aa1303e1	mov	x1, x19
   0x0000fffff7f96c18:	aa1503e2	mov	x2, x21
   0x0000fffff7f96c1c:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7f96c20:	aa1403e4	mov	x4, x20
   0x0000fffff7f96c24:	aa1603e5	mov	x5, x22
   0x0000fffff7f96c28:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f96c2c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f96c30:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96c34:	d63f0200	blr	x16
   0x0000fffff7f96c38:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96c3c:	54007d00	b.eq	0xfffff7f97bdc  // b.none
   0x0000fffff7f96c40:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f96c44:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96c48:	aa1303e1	mov	x1, x19
   0x0000fffff7f96c4c:	aa1503e2	mov	x2, x21
   0x0000fffff7f96c50:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7f96c54:	aa1403e4	mov	x4, x20
   0x0000fffff7f96c58:	aa1603e5	mov	x5, x22
   0x0000fffff7f96c5c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f96c60:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f96c64:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96c68:	d63f0200	blr	x16
   0x0000fffff7f96c6c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96c70:	54007ba0	b.eq	0xfffff7f97be4  // b.none
   0x0000fffff7f96c74:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f96c78:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96c7c:	aa1303e1	mov	x1, x19
   0x0000fffff7f96c80:	aa1503e2	mov	x2, x21
   0x0000fffff7f96c84:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7f96c88:	aa1403e4	mov	x4, x20
   0x0000fffff7f96c8c:	aa1603e5	mov	x5, x22
   0x0000fffff7f96c90:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f96c94:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f96c98:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96c9c:	d63f0200	blr	x16
   0x0000fffff7f96ca0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96ca4:	54007a40	b.eq	0xfffff7f97bec  // b.none
   0x0000fffff7f96ca8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f96cac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96cb0:	aa1303e1	mov	x1, x19
   0x0000fffff7f96cb4:	aa1503e2	mov	x2, x21
   0x0000fffff7f96cb8:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7f96cbc:	aa1403e4	mov	x4, x20
   0x0000fffff7f96cc0:	aa1603e5	mov	x5, x22
   0x0000fffff7f96cc4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f96cc8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f96ccc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96cd0:	d63f0200	blr	x16
   0x0000fffff7f96cd4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96cd8:	540078e0	b.eq	0xfffff7f97bf4  // b.none
   0x0000fffff7f96cdc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f96ce0:	37d80269	tbnz	w9, #27, 0xfffff7f96d2c
   0x0000fffff7f96ce4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f96ce8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96cec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96cf0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96cf4:	540001c1	b.ne	0xfffff7f96d2c  // b.any
   0x0000fffff7f96cf8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f96cfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96d00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96d04:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96d08:	54000121	b.ne	0xfffff7f96d2c  // b.any
   0x0000fffff7f96d0c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f96d10:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f96d14:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f96d18:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96d1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96d20:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f96d24:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f96d28:	1400000e	b	0xfffff7f96d60
   0x0000fffff7f96d2c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f96d30:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96d34:	aa1303e1	mov	x1, x19
   0x0000fffff7f96d38:	aa1503e2	mov	x2, x21
   0x0000fffff7f96d3c:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7f96d40:	aa1403e4	mov	x4, x20
   0x0000fffff7f96d44:	aa1603e5	mov	x5, x22
   0x0000fffff7f96d48:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f96d4c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f96d50:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96d54:	d63f0200	blr	x16
   0x0000fffff7f96d58:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96d5c:	54007500	b.eq	0xfffff7f97bfc  // b.none
   0x0000fffff7f96d60:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f96d64:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96d68:	aa1303e1	mov	x1, x19
   0x0000fffff7f96d6c:	aa1503e2	mov	x2, x21
   0x0000fffff7f96d70:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7f96d74:	aa1403e4	mov	x4, x20
   0x0000fffff7f96d78:	aa1603e5	mov	x5, x22
   0x0000fffff7f96d7c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f96d80:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f96d84:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96d88:	d63f0200	blr	x16
   0x0000fffff7f96d8c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96d90:	540073a0	b.eq	0xfffff7f97c04  // b.none
   0x0000fffff7f96d94:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f96d98:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96d9c:	aa1303e1	mov	x1, x19
   0x0000fffff7f96da0:	aa1503e2	mov	x2, x21
   0x0000fffff7f96da4:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7f96da8:	aa1403e4	mov	x4, x20
   0x0000fffff7f96dac:	aa1603e5	mov	x5, x22
   0x0000fffff7f96db0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f96db4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f96db8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96dbc:	d63f0200	blr	x16
   0x0000fffff7f96dc0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96dc4:	54007240	b.eq	0xfffff7f97c0c  // b.none
   0x0000fffff7f96dc8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f96dcc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96dd0:	aa1303e1	mov	x1, x19
   0x0000fffff7f96dd4:	aa1503e2	mov	x2, x21
   0x0000fffff7f96dd8:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7f96ddc:	aa1403e4	mov	x4, x20
   0x0000fffff7f96de0:	aa1603e5	mov	x5, x22
   0x0000fffff7f96de4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f96de8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f96dec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96df0:	d63f0200	blr	x16
   0x0000fffff7f96df4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96df8:	540070e0	b.eq	0xfffff7f97c14  // b.none
   0x0000fffff7f96dfc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f96e00:	37d80269	tbnz	w9, #27, 0xfffff7f96e4c
   0x0000fffff7f96e04:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f96e08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96e0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96e10:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96e14:	540001c1	b.ne	0xfffff7f96e4c  // b.any
   0x0000fffff7f96e18:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f96e1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96e20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96e24:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96e28:	54000121	b.ne	0xfffff7f96e4c  // b.any
   0x0000fffff7f96e2c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f96e30:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f96e34:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f96e38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96e3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96e40:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f96e44:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f96e48:	1400000e	b	0xfffff7f96e80
   0x0000fffff7f96e4c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f96e50:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96e54:	aa1303e1	mov	x1, x19
   0x0000fffff7f96e58:	aa1503e2	mov	x2, x21
   0x0000fffff7f96e5c:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7f96e60:	aa1403e4	mov	x4, x20
   0x0000fffff7f96e64:	aa1603e5	mov	x5, x22
   0x0000fffff7f96e68:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f96e6c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f96e70:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96e74:	d63f0200	blr	x16
   0x0000fffff7f96e78:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96e7c:	54006d00	b.eq	0xfffff7f97c1c  // b.none
   0x0000fffff7f96e80:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f96e84:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96e88:	aa1303e1	mov	x1, x19
   0x0000fffff7f96e8c:	aa1503e2	mov	x2, x21
   0x0000fffff7f96e90:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7f96e94:	aa1403e4	mov	x4, x20
   0x0000fffff7f96e98:	aa1603e5	mov	x5, x22
   0x0000fffff7f96e9c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f96ea0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f96ea4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96ea8:	d63f0200	blr	x16
   0x0000fffff7f96eac:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96eb0:	54006ba0	b.eq	0xfffff7f97c24  // b.none
   0x0000fffff7f96eb4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f96eb8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96ebc:	aa1303e1	mov	x1, x19
   0x0000fffff7f96ec0:	aa1503e2	mov	x2, x21
   0x0000fffff7f96ec4:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7f96ec8:	aa1403e4	mov	x4, x20
   0x0000fffff7f96ecc:	aa1603e5	mov	x5, x22
   0x0000fffff7f96ed0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f96ed4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f96ed8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96edc:	d63f0200	blr	x16
   0x0000fffff7f96ee0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96ee4:	54006a40	b.eq	0xfffff7f97c2c  // b.none
   0x0000fffff7f96ee8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f96eec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96ef0:	aa1303e1	mov	x1, x19
   0x0000fffff7f96ef4:	aa1503e2	mov	x2, x21
   0x0000fffff7f96ef8:	d2800683	mov	x3, #0x34                  	// #52
   0x0000fffff7f96efc:	aa1403e4	mov	x4, x20
   0x0000fffff7f96f00:	aa1603e5	mov	x5, x22
   0x0000fffff7f96f04:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f96f08:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f96f0c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96f10:	d63f0200	blr	x16
   0x0000fffff7f96f14:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96f18:	540068e0	b.eq	0xfffff7f97c34  // b.none
   0x0000fffff7f96f1c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f96f20:	37d80269	tbnz	w9, #27, 0xfffff7f96f6c
   0x0000fffff7f96f24:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f96f28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96f2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96f30:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96f34:	540001c1	b.ne	0xfffff7f96f6c  // b.any
   0x0000fffff7f96f38:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f96f3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96f40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96f44:	eb0a013f	cmp	x9, x10
   0x0000fffff7f96f48:	54000121	b.ne	0xfffff7f96f6c  // b.any
   0x0000fffff7f96f4c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f96f50:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f96f54:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f96f58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f96f5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f96f60:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f96f64:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f96f68:	1400000e	b	0xfffff7f96fa0
   0x0000fffff7f96f6c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f96f70:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96f74:	aa1303e1	mov	x1, x19
   0x0000fffff7f96f78:	aa1503e2	mov	x2, x21
   0x0000fffff7f96f7c:	d28006a3	mov	x3, #0x35                  	// #53
   0x0000fffff7f96f80:	aa1403e4	mov	x4, x20
   0x0000fffff7f96f84:	aa1603e5	mov	x5, x22
   0x0000fffff7f96f88:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f96f8c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f96f90:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96f94:	d63f0200	blr	x16
   0x0000fffff7f96f98:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96f9c:	54006500	b.eq	0xfffff7f97c3c  // b.none
   0x0000fffff7f96fa0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f96fa4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96fa8:	aa1303e1	mov	x1, x19
   0x0000fffff7f96fac:	aa1503e2	mov	x2, x21
   0x0000fffff7f96fb0:	d28006c3	mov	x3, #0x36                  	// #54
   0x0000fffff7f96fb4:	aa1403e4	mov	x4, x20
   0x0000fffff7f96fb8:	aa1603e5	mov	x5, x22
   0x0000fffff7f96fbc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f96fc0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f96fc4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96fc8:	d63f0200	blr	x16
   0x0000fffff7f96fcc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f96fd0:	540063a0	b.eq	0xfffff7f97c44  // b.none
   0x0000fffff7f96fd4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f96fd8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f96fdc:	aa1303e1	mov	x1, x19
   0x0000fffff7f96fe0:	aa1503e2	mov	x2, x21
   0x0000fffff7f96fe4:	d28006e3	mov	x3, #0x37                  	// #55
   0x0000fffff7f96fe8:	aa1403e4	mov	x4, x20
   0x0000fffff7f96fec:	aa1603e5	mov	x5, x22
   0x0000fffff7f96ff0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f96ff4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f96ff8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f96ffc:	d63f0200	blr	x16
   0x0000fffff7f97000:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97004:	54006240	b.eq	0xfffff7f97c4c  // b.none
   0x0000fffff7f97008:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9700c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97010:	aa1303e1	mov	x1, x19
   0x0000fffff7f97014:	aa1503e2	mov	x2, x21
   0x0000fffff7f97018:	d2800703	mov	x3, #0x38                  	// #56
   0x0000fffff7f9701c:	aa1403e4	mov	x4, x20
   0x0000fffff7f97020:	aa1603e5	mov	x5, x22
   0x0000fffff7f97024:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f97028:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9702c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97030:	d63f0200	blr	x16
   0x0000fffff7f97034:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97038:	540060e0	b.eq	0xfffff7f97c54  // b.none
   0x0000fffff7f9703c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97040:	37d80269	tbnz	w9, #27, 0xfffff7f9708c
   0x0000fffff7f97044:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97048:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9704c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97050:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97054:	540001c1	b.ne	0xfffff7f9708c  // b.any
   0x0000fffff7f97058:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9705c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97060:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97064:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97068:	54000121	b.ne	0xfffff7f9708c  // b.any
   0x0000fffff7f9706c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f97070:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f97074:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97078:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9707c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97080:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f97084:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f97088:	1400000e	b	0xfffff7f970c0
   0x0000fffff7f9708c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97090:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97094:	aa1303e1	mov	x1, x19
   0x0000fffff7f97098:	aa1503e2	mov	x2, x21
   0x0000fffff7f9709c:	d2800723	mov	x3, #0x39                  	// #57
   0x0000fffff7f970a0:	aa1403e4	mov	x4, x20
   0x0000fffff7f970a4:	aa1603e5	mov	x5, x22
   0x0000fffff7f970a8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f970ac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f970b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f970b4:	d63f0200	blr	x16
   0x0000fffff7f970b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f970bc:	54005d00	b.eq	0xfffff7f97c5c  // b.none
   0x0000fffff7f970c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f970c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f970c8:	aa1303e1	mov	x1, x19
   0x0000fffff7f970cc:	aa1503e2	mov	x2, x21
   0x0000fffff7f970d0:	d2800743	mov	x3, #0x3a                  	// #58
   0x0000fffff7f970d4:	aa1403e4	mov	x4, x20
   0x0000fffff7f970d8:	aa1603e5	mov	x5, x22
   0x0000fffff7f970dc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f970e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f970e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f970e8:	d63f0200	blr	x16
   0x0000fffff7f970ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f970f0:	54005ba0	b.eq	0xfffff7f97c64  // b.none
   0x0000fffff7f970f4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f970f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f970fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f97100:	aa1503e2	mov	x2, x21
   0x0000fffff7f97104:	d2800763	mov	x3, #0x3b                  	// #59
   0x0000fffff7f97108:	aa1403e4	mov	x4, x20
   0x0000fffff7f9710c:	aa1603e5	mov	x5, x22
   0x0000fffff7f97110:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f97114:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97118:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9711c:	d63f0200	blr	x16
   0x0000fffff7f97120:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97124:	54005a40	b.eq	0xfffff7f97c6c  // b.none
   0x0000fffff7f97128:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9712c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97130:	aa1303e1	mov	x1, x19
   0x0000fffff7f97134:	aa1503e2	mov	x2, x21
   0x0000fffff7f97138:	d2800783	mov	x3, #0x3c                  	// #60
   0x0000fffff7f9713c:	aa1403e4	mov	x4, x20
   0x0000fffff7f97140:	aa1603e5	mov	x5, x22
   0x0000fffff7f97144:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f97148:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9714c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97150:	d63f0200	blr	x16
   0x0000fffff7f97154:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97158:	540058e0	b.eq	0xfffff7f97c74  // b.none
   0x0000fffff7f9715c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97160:	37d80269	tbnz	w9, #27, 0xfffff7f971ac
   0x0000fffff7f97164:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97168:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9716c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97170:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97174:	540001c1	b.ne	0xfffff7f971ac  // b.any
   0x0000fffff7f97178:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9717c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97180:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97184:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97188:	54000121	b.ne	0xfffff7f971ac  // b.any
   0x0000fffff7f9718c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f97190:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f97194:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97198:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9719c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f971a0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f971a4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f971a8:	1400000e	b	0xfffff7f971e0
   0x0000fffff7f971ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f971b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f971b4:	aa1303e1	mov	x1, x19
   0x0000fffff7f971b8:	aa1503e2	mov	x2, x21
   0x0000fffff7f971bc:	d28007a3	mov	x3, #0x3d                  	// #61
   0x0000fffff7f971c0:	aa1403e4	mov	x4, x20
   0x0000fffff7f971c4:	aa1603e5	mov	x5, x22
   0x0000fffff7f971c8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f971cc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f971d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f971d4:	d63f0200	blr	x16
   0x0000fffff7f971d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f971dc:	54005500	b.eq	0xfffff7f97c7c  // b.none
   0x0000fffff7f971e0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f971e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f971e8:	aa1303e1	mov	x1, x19
   0x0000fffff7f971ec:	aa1503e2	mov	x2, x21
   0x0000fffff7f971f0:	d28007c3	mov	x3, #0x3e                  	// #62
   0x0000fffff7f971f4:	aa1403e4	mov	x4, x20
   0x0000fffff7f971f8:	aa1603e5	mov	x5, x22
   0x0000fffff7f971fc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f97200:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97204:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97208:	d63f0200	blr	x16
   0x0000fffff7f9720c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97210:	540053a0	b.eq	0xfffff7f97c84  // b.none
   0x0000fffff7f97214:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f97218:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9721c:	aa1303e1	mov	x1, x19
   0x0000fffff7f97220:	aa1503e2	mov	x2, x21
   0x0000fffff7f97224:	d28007e3	mov	x3, #0x3f                  	// #63
   0x0000fffff7f97228:	aa1403e4	mov	x4, x20
   0x0000fffff7f9722c:	aa1603e5	mov	x5, x22
   0x0000fffff7f97230:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f97234:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97238:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9723c:	d63f0200	blr	x16
   0x0000fffff7f97240:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97244:	54005240	b.eq	0xfffff7f97c8c  // b.none
   0x0000fffff7f97248:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9724c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97250:	aa1303e1	mov	x1, x19
   0x0000fffff7f97254:	aa1503e2	mov	x2, x21
   0x0000fffff7f97258:	d2800803	mov	x3, #0x40                  	// #64
   0x0000fffff7f9725c:	aa1403e4	mov	x4, x20
   0x0000fffff7f97260:	aa1603e5	mov	x5, x22
   0x0000fffff7f97264:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f97268:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9726c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97270:	d63f0200	blr	x16
   0x0000fffff7f97274:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97278:	540050e0	b.eq	0xfffff7f97c94  // b.none
   0x0000fffff7f9727c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97280:	37d80269	tbnz	w9, #27, 0xfffff7f972cc
   0x0000fffff7f97284:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97288:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9728c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97290:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97294:	540001c1	b.ne	0xfffff7f972cc  // b.any
   0x0000fffff7f97298:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9729c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f972a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f972a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f972a8:	54000121	b.ne	0xfffff7f972cc  // b.any
   0x0000fffff7f972ac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f972b0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f972b4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f972b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f972bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f972c0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f972c4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f972c8:	1400000e	b	0xfffff7f97300
   0x0000fffff7f972cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f972d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f972d4:	aa1303e1	mov	x1, x19
   0x0000fffff7f972d8:	aa1503e2	mov	x2, x21
   0x0000fffff7f972dc:	d2800823	mov	x3, #0x41                  	// #65
   0x0000fffff7f972e0:	aa1403e4	mov	x4, x20
   0x0000fffff7f972e4:	aa1603e5	mov	x5, x22
   0x0000fffff7f972e8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f972ec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f972f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f972f4:	d63f0200	blr	x16
   0x0000fffff7f972f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f972fc:	54004d00	b.eq	0xfffff7f97c9c  // b.none
   0x0000fffff7f97300:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97304:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97308:	aa1303e1	mov	x1, x19
   0x0000fffff7f9730c:	aa1503e2	mov	x2, x21
   0x0000fffff7f97310:	d2800843	mov	x3, #0x42                  	// #66
   0x0000fffff7f97314:	aa1403e4	mov	x4, x20
   0x0000fffff7f97318:	aa1603e5	mov	x5, x22
   0x0000fffff7f9731c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f97320:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97324:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97328:	d63f0200	blr	x16
   0x0000fffff7f9732c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97330:	54004ba0	b.eq	0xfffff7f97ca4  // b.none
   0x0000fffff7f97334:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f97338:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9733c:	aa1303e1	mov	x1, x19
   0x0000fffff7f97340:	aa1503e2	mov	x2, x21
   0x0000fffff7f97344:	d2800863	mov	x3, #0x43                  	// #67
   0x0000fffff7f97348:	aa1403e4	mov	x4, x20
   0x0000fffff7f9734c:	aa1603e5	mov	x5, x22
   0x0000fffff7f97350:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f97354:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97358:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9735c:	d63f0200	blr	x16
   0x0000fffff7f97360:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97364:	54004a40	b.eq	0xfffff7f97cac  // b.none
   0x0000fffff7f97368:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9736c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97370:	aa1303e1	mov	x1, x19
   0x0000fffff7f97374:	aa1503e2	mov	x2, x21
   0x0000fffff7f97378:	d2800883	mov	x3, #0x44                  	// #68
   0x0000fffff7f9737c:	aa1403e4	mov	x4, x20
   0x0000fffff7f97380:	aa1603e5	mov	x5, x22
   0x0000fffff7f97384:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f97388:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9738c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97390:	d63f0200	blr	x16
   0x0000fffff7f97394:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97398:	540048e0	b.eq	0xfffff7f97cb4  // b.none
   0x0000fffff7f9739c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f973a0:	37d80269	tbnz	w9, #27, 0xfffff7f973ec
   0x0000fffff7f973a4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f973a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f973ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f973b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f973b4:	540001c1	b.ne	0xfffff7f973ec  // b.any
   0x0000fffff7f973b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f973bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f973c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f973c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f973c8:	54000121	b.ne	0xfffff7f973ec  // b.any
   0x0000fffff7f973cc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f973d0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f973d4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f973d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f973dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f973e0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f973e4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f973e8:	1400000e	b	0xfffff7f97420
   0x0000fffff7f973ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f973f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f973f4:	aa1303e1	mov	x1, x19
   0x0000fffff7f973f8:	aa1503e2	mov	x2, x21
   0x0000fffff7f973fc:	d28008a3	mov	x3, #0x45                  	// #69
   0x0000fffff7f97400:	aa1403e4	mov	x4, x20
   0x0000fffff7f97404:	aa1603e5	mov	x5, x22
   0x0000fffff7f97408:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9740c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97410:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97414:	d63f0200	blr	x16
   0x0000fffff7f97418:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9741c:	54004500	b.eq	0xfffff7f97cbc  // b.none
   0x0000fffff7f97420:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97424:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97428:	aa1303e1	mov	x1, x19
   0x0000fffff7f9742c:	aa1503e2	mov	x2, x21
   0x0000fffff7f97430:	d28008c3	mov	x3, #0x46                  	// #70
   0x0000fffff7f97434:	aa1403e4	mov	x4, x20
   0x0000fffff7f97438:	aa1603e5	mov	x5, x22
   0x0000fffff7f9743c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f97440:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97444:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97448:	d63f0200	blr	x16
   0x0000fffff7f9744c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97450:	540043a0	b.eq	0xfffff7f97cc4  // b.none
   0x0000fffff7f97454:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f97458:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9745c:	aa1303e1	mov	x1, x19
   0x0000fffff7f97460:	aa1503e2	mov	x2, x21
   0x0000fffff7f97464:	d28008e3	mov	x3, #0x47                  	// #71
   0x0000fffff7f97468:	aa1403e4	mov	x4, x20
   0x0000fffff7f9746c:	aa1603e5	mov	x5, x22
   0x0000fffff7f97470:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f97474:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97478:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9747c:	d63f0200	blr	x16
   0x0000fffff7f97480:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97484:	54004240	b.eq	0xfffff7f97ccc  // b.none
   0x0000fffff7f97488:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9748c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97490:	aa1303e1	mov	x1, x19
   0x0000fffff7f97494:	aa1503e2	mov	x2, x21
   0x0000fffff7f97498:	d2800903	mov	x3, #0x48                  	// #72
   0x0000fffff7f9749c:	aa1403e4	mov	x4, x20
   0x0000fffff7f974a0:	aa1603e5	mov	x5, x22
   0x0000fffff7f974a4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f974a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f974ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f974b0:	d63f0200	blr	x16
   0x0000fffff7f974b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f974b8:	540040e0	b.eq	0xfffff7f97cd4  // b.none
   0x0000fffff7f974bc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f974c0:	37d80269	tbnz	w9, #27, 0xfffff7f9750c
   0x0000fffff7f974c4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f974c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f974cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f974d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f974d4:	540001c1	b.ne	0xfffff7f9750c  // b.any
   0x0000fffff7f974d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f974dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f974e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f974e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f974e8:	54000121	b.ne	0xfffff7f9750c  // b.any
   0x0000fffff7f974ec:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f974f0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f974f4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f974f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f974fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97500:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f97504:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f97508:	1400000e	b	0xfffff7f97540
   0x0000fffff7f9750c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97510:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97514:	aa1303e1	mov	x1, x19
   0x0000fffff7f97518:	aa1503e2	mov	x2, x21
   0x0000fffff7f9751c:	d2800923	mov	x3, #0x49                  	// #73
   0x0000fffff7f97520:	aa1403e4	mov	x4, x20
   0x0000fffff7f97524:	aa1603e5	mov	x5, x22
   0x0000fffff7f97528:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9752c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97530:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97534:	d63f0200	blr	x16
   0x0000fffff7f97538:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9753c:	54003d00	b.eq	0xfffff7f97cdc  // b.none
   0x0000fffff7f97540:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97544:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97548:	aa1303e1	mov	x1, x19
   0x0000fffff7f9754c:	aa1503e2	mov	x2, x21
   0x0000fffff7f97550:	d2800943	mov	x3, #0x4a                  	// #74
   0x0000fffff7f97554:	aa1403e4	mov	x4, x20
   0x0000fffff7f97558:	aa1603e5	mov	x5, x22
   0x0000fffff7f9755c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f97560:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97564:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97568:	d63f0200	blr	x16
   0x0000fffff7f9756c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97570:	54003ba0	b.eq	0xfffff7f97ce4  // b.none
   0x0000fffff7f97574:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f97578:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9757c:	aa1303e1	mov	x1, x19
   0x0000fffff7f97580:	aa1503e2	mov	x2, x21
   0x0000fffff7f97584:	d2800963	mov	x3, #0x4b                  	// #75
   0x0000fffff7f97588:	aa1403e4	mov	x4, x20
   0x0000fffff7f9758c:	aa1603e5	mov	x5, x22
   0x0000fffff7f97590:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f97594:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97598:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9759c:	d63f0200	blr	x16
   0x0000fffff7f975a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f975a4:	54003a40	b.eq	0xfffff7f97cec  // b.none
   0x0000fffff7f975a8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f975ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f975b0:	aa1303e1	mov	x1, x19
   0x0000fffff7f975b4:	aa1503e2	mov	x2, x21
   0x0000fffff7f975b8:	d2800983	mov	x3, #0x4c                  	// #76
   0x0000fffff7f975bc:	aa1403e4	mov	x4, x20
   0x0000fffff7f975c0:	aa1603e5	mov	x5, x22
   0x0000fffff7f975c4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f975c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f975cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f975d0:	d63f0200	blr	x16
   0x0000fffff7f975d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f975d8:	540038e0	b.eq	0xfffff7f97cf4  // b.none
   0x0000fffff7f975dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f975e0:	37d80269	tbnz	w9, #27, 0xfffff7f9762c
   0x0000fffff7f975e4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f975e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f975ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f975f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f975f4:	540001c1	b.ne	0xfffff7f9762c  // b.any
   0x0000fffff7f975f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f975fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97600:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97604:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97608:	54000121	b.ne	0xfffff7f9762c  // b.any
   0x0000fffff7f9760c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f97610:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f97614:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97618:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9761c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97620:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f97624:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f97628:	1400000e	b	0xfffff7f97660
   0x0000fffff7f9762c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97630:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97634:	aa1303e1	mov	x1, x19
   0x0000fffff7f97638:	aa1503e2	mov	x2, x21
   0x0000fffff7f9763c:	d28009a3	mov	x3, #0x4d                  	// #77
   0x0000fffff7f97640:	aa1403e4	mov	x4, x20
   0x0000fffff7f97644:	aa1603e5	mov	x5, x22
   0x0000fffff7f97648:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9764c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97650:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97654:	d63f0200	blr	x16
   0x0000fffff7f97658:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9765c:	54003500	b.eq	0xfffff7f97cfc  // b.none
   0x0000fffff7f97660:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97664:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97668:	aa1303e1	mov	x1, x19
   0x0000fffff7f9766c:	aa1503e2	mov	x2, x21
   0x0000fffff7f97670:	d28009c3	mov	x3, #0x4e                  	// #78
   0x0000fffff7f97674:	aa1403e4	mov	x4, x20
   0x0000fffff7f97678:	aa1603e5	mov	x5, x22
   0x0000fffff7f9767c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f97680:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97684:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97688:	d63f0200	blr	x16
   0x0000fffff7f9768c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97690:	540033a0	b.eq	0xfffff7f97d04  // b.none
   0x0000fffff7f97694:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f97698:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9769c:	aa1303e1	mov	x1, x19
   0x0000fffff7f976a0:	aa1503e2	mov	x2, x21
   0x0000fffff7f976a4:	d28009e3	mov	x3, #0x4f                  	// #79
   0x0000fffff7f976a8:	aa1403e4	mov	x4, x20
   0x0000fffff7f976ac:	aa1603e5	mov	x5, x22
   0x0000fffff7f976b0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f976b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f976b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f976bc:	d63f0200	blr	x16
   0x0000fffff7f976c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f976c4:	54003240	b.eq	0xfffff7f97d0c  // b.none
   0x0000fffff7f976c8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f976cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f976d0:	aa1303e1	mov	x1, x19
   0x0000fffff7f976d4:	aa1503e2	mov	x2, x21
   0x0000fffff7f976d8:	d2800a03	mov	x3, #0x50                  	// #80
   0x0000fffff7f976dc:	aa1403e4	mov	x4, x20
   0x0000fffff7f976e0:	aa1603e5	mov	x5, x22
   0x0000fffff7f976e4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f976e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f976ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f976f0:	d63f0200	blr	x16
   0x0000fffff7f976f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f976f8:	540030e0	b.eq	0xfffff7f97d14  // b.none
   0x0000fffff7f976fc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97700:	37d80269	tbnz	w9, #27, 0xfffff7f9774c
   0x0000fffff7f97704:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97708:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9770c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97710:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97714:	540001c1	b.ne	0xfffff7f9774c  // b.any
   0x0000fffff7f97718:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9771c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97720:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97724:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97728:	54000121	b.ne	0xfffff7f9774c  // b.any
   0x0000fffff7f9772c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f97730:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f97734:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97738:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9773c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97740:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f97744:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f97748:	1400000e	b	0xfffff7f97780
   0x0000fffff7f9774c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97750:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97754:	aa1303e1	mov	x1, x19
   0x0000fffff7f97758:	aa1503e2	mov	x2, x21
   0x0000fffff7f9775c:	d2800a23	mov	x3, #0x51                  	// #81
   0x0000fffff7f97760:	aa1403e4	mov	x4, x20
   0x0000fffff7f97764:	aa1603e5	mov	x5, x22
   0x0000fffff7f97768:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9776c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97770:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97774:	d63f0200	blr	x16
   0x0000fffff7f97778:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9777c:	54002d00	b.eq	0xfffff7f97d1c  // b.none
   0x0000fffff7f97780:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97784:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97788:	aa1303e1	mov	x1, x19
   0x0000fffff7f9778c:	aa1503e2	mov	x2, x21
   0x0000fffff7f97790:	d2800a43	mov	x3, #0x52                  	// #82
   0x0000fffff7f97794:	aa1403e4	mov	x4, x20
   0x0000fffff7f97798:	aa1603e5	mov	x5, x22
   0x0000fffff7f9779c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f977a0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f977a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f977a8:	d63f0200	blr	x16
   0x0000fffff7f977ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7f977b0:	54002ba0	b.eq	0xfffff7f97d24  // b.none
   0x0000fffff7f977b4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f977b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f977bc:	aa1303e1	mov	x1, x19
   0x0000fffff7f977c0:	aa1503e2	mov	x2, x21
   0x0000fffff7f977c4:	d2800a63	mov	x3, #0x53                  	// #83
   0x0000fffff7f977c8:	aa1403e4	mov	x4, x20
   0x0000fffff7f977cc:	aa1603e5	mov	x5, x22
   0x0000fffff7f977d0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f977d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f977d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f977dc:	d63f0200	blr	x16
   0x0000fffff7f977e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f977e4:	54002a40	b.eq	0xfffff7f97d2c  // b.none
   0x0000fffff7f977e8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f977ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f977f0:	aa1303e1	mov	x1, x19
   0x0000fffff7f977f4:	aa1503e2	mov	x2, x21
   0x0000fffff7f977f8:	d2800a83	mov	x3, #0x54                  	// #84
   0x0000fffff7f977fc:	aa1403e4	mov	x4, x20
   0x0000fffff7f97800:	aa1603e5	mov	x5, x22
   0x0000fffff7f97804:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f97808:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9780c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97810:	d63f0200	blr	x16
   0x0000fffff7f97814:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97818:	540028e0	b.eq	0xfffff7f97d34  // b.none
   0x0000fffff7f9781c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97820:	37d80269	tbnz	w9, #27, 0xfffff7f9786c
   0x0000fffff7f97824:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97828:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9782c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97830:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97834:	540001c1	b.ne	0xfffff7f9786c  // b.any
   0x0000fffff7f97838:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9783c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97840:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97844:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97848:	54000121	b.ne	0xfffff7f9786c  // b.any
   0x0000fffff7f9784c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f97850:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f97854:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97858:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9785c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97860:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f97864:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f97868:	1400000e	b	0xfffff7f978a0
   0x0000fffff7f9786c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97870:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97874:	aa1303e1	mov	x1, x19
   0x0000fffff7f97878:	aa1503e2	mov	x2, x21
   0x0000fffff7f9787c:	d2800aa3	mov	x3, #0x55                  	// #85
   0x0000fffff7f97880:	aa1403e4	mov	x4, x20
   0x0000fffff7f97884:	aa1603e5	mov	x5, x22
   0x0000fffff7f97888:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9788c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f97890:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97894:	d63f0200	blr	x16
   0x0000fffff7f97898:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9789c:	54002500	b.eq	0xfffff7f97d3c  // b.none
   0x0000fffff7f978a0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f978a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f978a8:	aa1303e1	mov	x1, x19
   0x0000fffff7f978ac:	aa1503e2	mov	x2, x21
   0x0000fffff7f978b0:	d2800ac3	mov	x3, #0x56                  	// #86
   0x0000fffff7f978b4:	aa1403e4	mov	x4, x20
   0x0000fffff7f978b8:	aa1603e5	mov	x5, x22
   0x0000fffff7f978bc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f978c0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f978c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f978c8:	d63f0200	blr	x16
   0x0000fffff7f978cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f978d0:	540023a0	b.eq	0xfffff7f97d44  // b.none
   0x0000fffff7f978d4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f978d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f978dc:	aa1303e1	mov	x1, x19
   0x0000fffff7f978e0:	aa1503e2	mov	x2, x21
   0x0000fffff7f978e4:	d2800ae3	mov	x3, #0x57                  	// #87
   0x0000fffff7f978e8:	aa1403e4	mov	x4, x20
   0x0000fffff7f978ec:	aa1603e5	mov	x5, x22
   0x0000fffff7f978f0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f978f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f978f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f978fc:	d63f0200	blr	x16
   0x0000fffff7f97900:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97904:	54002240	b.eq	0xfffff7f97d4c  // b.none
   0x0000fffff7f97908:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9790c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97910:	aa1303e1	mov	x1, x19
   0x0000fffff7f97914:	aa1503e2	mov	x2, x21
   0x0000fffff7f97918:	d2800b03	mov	x3, #0x58                  	// #88
   0x0000fffff7f9791c:	aa1403e4	mov	x4, x20
   0x0000fffff7f97920:	aa1603e5	mov	x5, x22
   0x0000fffff7f97924:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f97928:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9792c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97930:	d63f0200	blr	x16
   0x0000fffff7f97934:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97938:	540020e0	b.eq	0xfffff7f97d54  // b.none
   0x0000fffff7f9793c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97940:	37d80269	tbnz	w9, #27, 0xfffff7f9798c
   0x0000fffff7f97944:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f97948:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9794c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97950:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97954:	540001c1	b.ne	0xfffff7f9798c  // b.any
   0x0000fffff7f97958:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9795c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97960:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97964:	eb0a013f	cmp	x9, x10
   0x0000fffff7f97968:	54000121	b.ne	0xfffff7f9798c  // b.any
   0x0000fffff7f9796c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f97970:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f97974:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f97978:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9797c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97980:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f97984:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f97988:	1400000e	b	0xfffff7f979c0
   0x0000fffff7f9798c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97990:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97994:	aa1303e1	mov	x1, x19
   0x0000fffff7f97998:	aa1503e2	mov	x2, x21
   0x0000fffff7f9799c:	d2800b23	mov	x3, #0x59                  	// #89
   0x0000fffff7f979a0:	aa1403e4	mov	x4, x20
   0x0000fffff7f979a4:	aa1603e5	mov	x5, x22
   0x0000fffff7f979a8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f979ac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f979b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f979b4:	d63f0200	blr	x16
   0x0000fffff7f979b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f979bc:	54001d00	b.eq	0xfffff7f97d5c  // b.none
   0x0000fffff7f979c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f979c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f979c8:	aa1303e1	mov	x1, x19
   0x0000fffff7f979cc:	aa1503e2	mov	x2, x21
   0x0000fffff7f979d0:	d2800b43	mov	x3, #0x5a                  	// #90
   0x0000fffff7f979d4:	aa1403e4	mov	x4, x20
   0x0000fffff7f979d8:	aa1603e5	mov	x5, x22
   0x0000fffff7f979dc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f979e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f979e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f979e8:	d63f0200	blr	x16
   0x0000fffff7f979ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f979f0:	54001ba0	b.eq	0xfffff7f97d64  // b.none
   0x0000fffff7f979f4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f979f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f979fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f97a00:	aa1503e2	mov	x2, x21
   0x0000fffff7f97a04:	d2800b63	mov	x3, #0x5b                  	// #91
   0x0000fffff7f97a08:	aa1403e4	mov	x4, x20
   0x0000fffff7f97a0c:	aa1603e5	mov	x5, x22
   0x0000fffff7f97a10:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f97a14:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97a18:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97a1c:	d63f0200	blr	x16
   0x0000fffff7f97a20:	f100001f	cmp	x0, #0x0
   0x0000fffff7f97a24:	54001a40	b.eq	0xfffff7f97d6c  // b.none
   0x0000fffff7f97a28:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f97a2c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f97a30:	aa1303e1	mov	x1, x19
   0x0000fffff7f97a34:	aa1503e2	mov	x2, x21
   0x0000fffff7f97a38:	d2800b83	mov	x3, #0x5c                  	// #92
   0x0000fffff7f97a3c:	aa1403e4	mov	x4, x20
   0x0000fffff7f97a40:	aa1603e5	mov	x5, x22
   0x0000fffff7f97a44:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7f97a48:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f97a4c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f97a50:	d63f0200	blr	x16
   0x0000fffff7f97a54:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f97a58:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f97a5c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f97a60:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f97a64:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f97a68:	d65f03c0	ret
   0x0000fffff7f97a6c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f97a70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f97a74:	b900028a	str	w10, [x20]
   0x0000fffff7f97a78:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f97a7c:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f97a80:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f97a84:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f97a88:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f97a8c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f97a90:	d65f03c0	ret
   0x0000fffff7f97a94:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f97a98:	17fffff5	b	0xfffff7f97a6c
   0x0000fffff7f97a9c:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f97aa0:	17fffff3	b	0xfffff7f97a6c
   0x0000fffff7f97aa4:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f97aa8:	17fffff1	b	0xfffff7f97a6c
   0x0000fffff7f97aac:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f97ab0:	17ffffef	b	0xfffff7f97a6c
   0x0000fffff7f97ab4:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f97ab8:	17ffffed	b	0xfffff7f97a6c
   0x0000fffff7f97abc:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f97ac0:	17ffffeb	b	0xfffff7f97a6c
   0x0000fffff7f97ac4:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f97ac8:	17ffffe9	b	0xfffff7f97a6c
   0x0000fffff7f97acc:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f97ad0:	17ffffe7	b	0xfffff7f97a6c
   0x0000fffff7f97ad4:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f97ad8:	17ffffe5	b	0xfffff7f97a6c
   0x0000fffff7f97adc:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f97ae0:	17ffffe3	b	0xfffff7f97a6c
   0x0000fffff7f97ae4:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7f97ae8:	17ffffe1	b	0xfffff7f97a6c
   0x0000fffff7f97aec:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7f97af0:	17ffffdf	b	0xfffff7f97a6c
   0x0000fffff7f97af4:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7f97af8:	17ffffdd	b	0xfffff7f97a6c
   0x0000fffff7f97afc:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7f97b00:	17ffffdb	b	0xfffff7f97a6c
   0x0000fffff7f97b04:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7f97b08:	17ffffd9	b	0xfffff7f97a6c
   0x0000fffff7f97b0c:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7f97b10:	17ffffd7	b	0xfffff7f97a6c
   0x0000fffff7f97b14:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7f97b18:	17ffffd5	b	0xfffff7f97a6c
   0x0000fffff7f97b1c:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7f97b20:	17ffffd3	b	0xfffff7f97a6c
   0x0000fffff7f97b24:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7f97b28:	17ffffd1	b	0xfffff7f97a6c
   0x0000fffff7f97b2c:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7f97b30:	17ffffcf	b	0xfffff7f97a6c
   0x0000fffff7f97b34:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7f97b38:	17ffffcd	b	0xfffff7f97a6c
   0x0000fffff7f97b3c:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7f97b40:	17ffffcb	b	0xfffff7f97a6c
   0x0000fffff7f97b44:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7f97b48:	17ffffc9	b	0xfffff7f97a6c
   0x0000fffff7f97b4c:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7f97b50:	17ffffc7	b	0xfffff7f97a6c
   0x0000fffff7f97b54:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7f97b58:	17ffffc5	b	0xfffff7f97a6c
   0x0000fffff7f97b5c:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7f97b60:	17ffffc3	b	0xfffff7f97a6c
   0x0000fffff7f97b64:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7f97b68:	17ffffc1	b	0xfffff7f97a6c
   0x0000fffff7f97b6c:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7f97b70:	17ffffbf	b	0xfffff7f97a6c
   0x0000fffff7f97b74:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7f97b78:	17ffffbd	b	0xfffff7f97a6c
   0x0000fffff7f97b7c:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7f97b80:	17ffffbb	b	0xfffff7f97a6c
   0x0000fffff7f97b84:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7f97b88:	17ffffb9	b	0xfffff7f97a6c
   0x0000fffff7f97b8c:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7f97b90:	17ffffb7	b	0xfffff7f97a6c
   0x0000fffff7f97b94:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7f97b98:	17ffffb5	b	0xfffff7f97a6c
   0x0000fffff7f97b9c:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7f97ba0:	17ffffb3	b	0xfffff7f97a6c
   0x0000fffff7f97ba4:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7f97ba8:	17ffffb1	b	0xfffff7f97a6c
   0x0000fffff7f97bac:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7f97bb0:	17ffffaf	b	0xfffff7f97a6c
   0x0000fffff7f97bb4:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7f97bb8:	17ffffad	b	0xfffff7f97a6c
   0x0000fffff7f97bbc:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7f97bc0:	17ffffab	b	0xfffff7f97a6c
   0x0000fffff7f97bc4:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7f97bc8:	17ffffa9	b	0xfffff7f97a6c
   0x0000fffff7f97bcc:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7f97bd0:	17ffffa7	b	0xfffff7f97a6c
   0x0000fffff7f97bd4:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7f97bd8:	17ffffa5	b	0xfffff7f97a6c
   0x0000fffff7f97bdc:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7f97be0:	17ffffa3	b	0xfffff7f97a6c
   0x0000fffff7f97be4:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7f97be8:	17ffffa1	b	0xfffff7f97a6c
   0x0000fffff7f97bec:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7f97bf0:	17ffff9f	b	0xfffff7f97a6c
   0x0000fffff7f97bf4:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7f97bf8:	17ffff9d	b	0xfffff7f97a6c
   0x0000fffff7f97bfc:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7f97c00:	17ffff9b	b	0xfffff7f97a6c
   0x0000fffff7f97c04:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7f97c08:	17ffff99	b	0xfffff7f97a6c
   0x0000fffff7f97c0c:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7f97c10:	17ffff97	b	0xfffff7f97a6c
   0x0000fffff7f97c14:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7f97c18:	17ffff95	b	0xfffff7f97a6c
   0x0000fffff7f97c1c:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7f97c20:	17ffff93	b	0xfffff7f97a6c
   0x0000fffff7f97c24:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7f97c28:	17ffff91	b	0xfffff7f97a6c
   0x0000fffff7f97c2c:	d2800669	mov	x9, #0x33                  	// #51
   0x0000fffff7f97c30:	17ffff8f	b	0xfffff7f97a6c
   0x0000fffff7f97c34:	d2800689	mov	x9, #0x34                  	// #52
   0x0000fffff7f97c38:	17ffff8d	b	0xfffff7f97a6c
   0x0000fffff7f97c3c:	d28006a9	mov	x9, #0x35                  	// #53
   0x0000fffff7f97c40:	17ffff8b	b	0xfffff7f97a6c
   0x0000fffff7f97c44:	d28006c9	mov	x9, #0x36                  	// #54
   0x0000fffff7f97c48:	17ffff89	b	0xfffff7f97a6c
   0x0000fffff7f97c4c:	d28006e9	mov	x9, #0x37                  	// #55
   0x0000fffff7f97c50:	17ffff87	b	0xfffff7f97a6c
   0x0000fffff7f97c54:	d2800709	mov	x9, #0x38                  	// #56
   0x0000fffff7f97c58:	17ffff85	b	0xfffff7f97a6c
   0x0000fffff7f97c5c:	d2800729	mov	x9, #0x39                  	// #57
   0x0000fffff7f97c60:	17ffff83	b	0xfffff7f97a6c
   0x0000fffff7f97c64:	d2800749	mov	x9, #0x3a                  	// #58
   0x0000fffff7f97c68:	17ffff81	b	0xfffff7f97a6c
   0x0000fffff7f97c6c:	d2800769	mov	x9, #0x3b                  	// #59
   0x0000fffff7f97c70:	17ffff7f	b	0xfffff7f97a6c
   0x0000fffff7f97c74:	d2800789	mov	x9, #0x3c                  	// #60
   0x0000fffff7f97c78:	17ffff7d	b	0xfffff7f97a6c
   0x0000fffff7f97c7c:	d28007a9	mov	x9, #0x3d                  	// #61
   0x0000fffff7f97c80:	17ffff7b	b	0xfffff7f97a6c
   0x0000fffff7f97c84:	d28007c9	mov	x9, #0x3e                  	// #62
   0x0000fffff7f97c88:	17ffff79	b	0xfffff7f97a6c
   0x0000fffff7f97c8c:	d28007e9	mov	x9, #0x3f                  	// #63
   0x0000fffff7f97c90:	17ffff77	b	0xfffff7f97a6c
   0x0000fffff7f97c94:	d2800809	mov	x9, #0x40                  	// #64
   0x0000fffff7f97c98:	17ffff75	b	0xfffff7f97a6c
   0x0000fffff7f97c9c:	d2800829	mov	x9, #0x41                  	// #65
   0x0000fffff7f97ca0:	17ffff73	b	0xfffff7f97a6c
   0x0000fffff7f97ca4:	d2800849	mov	x9, #0x42                  	// #66
   0x0000fffff7f97ca8:	17ffff71	b	0xfffff7f97a6c
   0x0000fffff7f97cac:	d2800869	mov	x9, #0x43                  	// #67
   0x0000fffff7f97cb0:	17ffff6f	b	0xfffff7f97a6c
   0x0000fffff7f97cb4:	d2800889	mov	x9, #0x44                  	// #68
   0x0000fffff7f97cb8:	17ffff6d	b	0xfffff7f97a6c
   0x0000fffff7f97cbc:	d28008a9	mov	x9, #0x45                  	// #69
   0x0000fffff7f97cc0:	17ffff6b	b	0xfffff7f97a6c
   0x0000fffff7f97cc4:	d28008c9	mov	x9, #0x46                  	// #70
   0x0000fffff7f97cc8:	17ffff69	b	0xfffff7f97a6c
   0x0000fffff7f97ccc:	d28008e9	mov	x9, #0x47                  	// #71
   0x0000fffff7f97cd0:	17ffff67	b	0xfffff7f97a6c
   0x0000fffff7f97cd4:	d2800909	mov	x9, #0x48                  	// #72
   0x0000fffff7f97cd8:	17ffff65	b	0xfffff7f97a6c
   0x0000fffff7f97cdc:	d2800929	mov	x9, #0x49                  	// #73
   0x0000fffff7f97ce0:	17ffff63	b	0xfffff7f97a6c
   0x0000fffff7f97ce4:	d2800949	mov	x9, #0x4a                  	// #74
   0x0000fffff7f97ce8:	17ffff61	b	0xfffff7f97a6c
   0x0000fffff7f97cec:	d2800969	mov	x9, #0x4b                  	// #75
   0x0000fffff7f97cf0:	17ffff5f	b	0xfffff7f97a6c
   0x0000fffff7f97cf4:	d2800989	mov	x9, #0x4c                  	// #76
   0x0000fffff7f97cf8:	17ffff5d	b	0xfffff7f97a6c
   0x0000fffff7f97cfc:	d28009a9	mov	x9, #0x4d                  	// #77
   0x0000fffff7f97d00:	17ffff5b	b	0xfffff7f97a6c
   0x0000fffff7f97d04:	d28009c9	mov	x9, #0x4e                  	// #78
   0x0000fffff7f97d08:	17ffff59	b	0xfffff7f97a6c
   0x0000fffff7f97d0c:	d28009e9	mov	x9, #0x4f                  	// #79
   0x0000fffff7f97d10:	17ffff57	b	0xfffff7f97a6c
   0x0000fffff7f97d14:	d2800a09	mov	x9, #0x50                  	// #80
   0x0000fffff7f97d18:	17ffff55	b	0xfffff7f97a6c
   0x0000fffff7f97d1c:	d2800a29	mov	x9, #0x51                  	// #81
   0x0000fffff7f97d20:	17ffff53	b	0xfffff7f97a6c
   0x0000fffff7f97d24:	d2800a49	mov	x9, #0x52                  	// #82
   0x0000fffff7f97d28:	17ffff51	b	0xfffff7f97a6c
   0x0000fffff7f97d2c:	d2800a69	mov	x9, #0x53                  	// #83
   0x0000fffff7f97d30:	17ffff4f	b	0xfffff7f97a6c
   0x0000fffff7f97d34:	d2800a89	mov	x9, #0x54                  	// #84
   0x0000fffff7f97d38:	17ffff4d	b	0xfffff7f97a6c
   0x0000fffff7f97d3c:	d2800aa9	mov	x9, #0x55                  	// #85
   0x0000fffff7f97d40:	17ffff4b	b	0xfffff7f97a6c
   0x0000fffff7f97d44:	d2800ac9	mov	x9, #0x56                  	// #86
   0x0000fffff7f97d48:	17ffff49	b	0xfffff7f97a6c
   0x0000fffff7f97d4c:	d2800ae9	mov	x9, #0x57                  	// #87
   0x0000fffff7f97d50:	17ffff47	b	0xfffff7f97a6c
   0x0000fffff7f97d54:	d2800b09	mov	x9, #0x58                  	// #88
   0x0000fffff7f97d58:	17ffff45	b	0xfffff7f97a6c
   0x0000fffff7f97d5c:	d2800b29	mov	x9, #0x59                  	// #89
   0x0000fffff7f97d60:	17ffff43	b	0xfffff7f97a6c
   0x0000fffff7f97d64:	d2800b49	mov	x9, #0x5a                  	// #90
   0x0000fffff7f97d68:	17ffff41	b	0xfffff7f97a6c
   0x0000fffff7f97d6c:	d2800b69	mov	x9, #0x5b                  	// #91
   0x0000fffff7f97d70:	17ffff3f	b	0xfffff7f97a6c
   0x0000fffff7f97d74:	00000000	udf	#0
   0x0000fffff7f97d78:	00000000	udf	#0
   0x0000fffff7f97d7c:	00000000	udf	#0
   0x0000fffff7f97d80:	00000000	udf	#0
   0x0000fffff7f97d84:	00000000	udf	#0
   0x0000fffff7f97d88:	00000000	udf	#0
   0x0000fffff7f97d8c:	00000000	udf	#0
   0x0000fffff7f97d90:	00000000	udf	#0
   0x0000fffff7f97d94:	00000000	udf	#0
   0x0000fffff7f97d98:	00000000	udf	#0
   0x0000fffff7f97d9c:	00000000	udf	#0
   0x0000fffff7f97da0:	00000000	udf	#0
   0x0000fffff7f97da4:	00000000	udf	#0
   0x0000fffff7f97da8:	00000000	udf	#0
   0x0000fffff7f97dac:	00000000	udf	#0
   0x0000fffff7f97db0:	00000000	udf	#0
   0x0000fffff7f97db4:	00000000	udf	#0
   0x0000fffff7f97db8:	00000000	udf	#0
   0x0000fffff7f97dbc:	00000000	udf	#0
   0x0000fffff7f97dc0:	00000000	udf	#0
   0x0000fffff7f97dc4:	00000000	udf	#0
   0x0000fffff7f97dc8:	00000000	udf	#0
   0x0000fffff7f97dcc:	00000000	udf	#0
   0x0000fffff7f97dd0:	00000000	udf	#0
   0x0000fffff7f97dd4:	00000000	udf	#0
   0x0000fffff7f97dd8:	00000000	udf	#0
   0x0000fffff7f97ddc:	00000000	udf	#0
   0x0000fffff7f97de0:	00000000	udf	#0
   0x0000fffff7f97de4:	00000000	udf	#0
   0x0000fffff7f97de8:	00000000	udf	#0
   0x0000fffff7f97dec:	00000000	udf	#0
   0x0000fffff7f97df0:	00000000	udf	#0
   0x0000fffff7f97df4:	00000000	udf	#0
   0x0000fffff7f97df8:	00000000	udf	#0
   0x0000fffff7f97dfc:	00000000	udf	#0
   0x0000fffff7f97e00:	00000000	udf	#0
   0x0000fffff7f97e04:	00000000	udf	#0
   0x0000fffff7f97e08:	00000000	udf	#0
   0x0000fffff7f97e0c:	00000000	udf	#0
   0x0000fffff7f97e10:	00000000	udf	#0
   0x0000fffff7f97e14:	00000000	udf	#0
   0x0000fffff7f97e18:	00000000	udf	#0
   0x0000fffff7f97e1c:	00000000	udf	#0
   0x0000fffff7f97e20:	00000000	udf	#0
   0x0000fffff7f97e24:	00000000	udf	#0
   0x0000fffff7f97e28:	00000000	udf	#0
   0x0000fffff7f97e2c:	00000000	udf	#0
   0x0000fffff7f97e30:	00000000	udf	#0
   0x0000fffff7f97e34:	00000000	udf	#0
   0x0000fffff7f97e38:	00000000	udf	#0
   0x0000fffff7f97e3c:	00000000	udf	#0
   0x0000fffff7f97e40:	00000000	udf	#0
   0x0000fffff7f97e44:	00000000	udf	#0
   0x0000fffff7f97e48:	00000000	udf	#0
   0x0000fffff7f97e4c:	00000000	udf	#0
   0x0000fffff7f97e50:	00000000	udf	#0
   0x0000fffff7f97e54:	00000000	udf	#0
   0x0000fffff7f97e58:	00000000	udf	#0
   0x0000fffff7f97e5c:	00000000	udf	#0
   0x0000fffff7f97e60:	00000000	udf	#0
   0x0000fffff7f97e64:	00000000	udf	#0
   0x0000fffff7f97e68:	00000000	udf	#0
   0x0000fffff7f97e6c:	00000000	udf	#0
   0x0000fffff7f97e70:	00000000	udf	#0
   0x0000fffff7f97e74:	00000000	udf	#0
   0x0000fffff7f97e78:	00000000	udf	#0
   0x0000fffff7f97e7c:	00000000	udf	#0
   0x0000fffff7f97e80:	00000000	udf	#0
   0x0000fffff7f97e84:	00000000	udf	#0
   0x0000fffff7f97e88:	00000000	udf	#0
   0x0000fffff7f97e8c:	00000000	udf	#0
   0x0000fffff7f97e90:	00000000	udf	#0
   0x0000fffff7f97e94:	00000000	udf	#0
   0x0000fffff7f97e98:	00000000	udf	#0
   0x0000fffff7f97e9c:	00000000	udf	#0
   0x0000fffff7f97ea0:	00000000	udf	#0
   0x0000fffff7f97ea4:	00000000	udf	#0
   0x0000fffff7f97ea8:	00000000	udf	#0
   0x0000fffff7f97eac:	00000000	udf	#0
   0x0000fffff7f97eb0:	00000000	udf	#0
   0x0000fffff7f97eb4:	00000000	udf	#0
   0x0000fffff7f97eb8:	00000000	udf	#0
   0x0000fffff7f97ebc:	00000000	udf	#0
   0x0000fffff7f97ec0:	00000000	udf	#0
   0x0000fffff7f97ec4:	00000000	udf	#0
   0x0000fffff7f97ec8:	00000000	udf	#0
   0x0000fffff7f97ecc:	00000000	udf	#0
   0x0000fffff7f97ed0:	00000000	udf	#0
   0x0000fffff7f97ed4:	00000000	udf	#0
   0x0000fffff7f97ed8:	00000000	udf	#0
   0x0000fffff7f97edc:	00000000	udf	#0
   0x0000fffff7f97ee0:	00000000	udf	#0
   0x0000fffff7f97ee4:	00000000	udf	#0
   0x0000fffff7f97ee8:	00000000	udf	#0
   0x0000fffff7f97eec:	00000000	udf	#0
   0x0000fffff7f97ef0:	00000000	udf	#0
   0x0000fffff7f97ef4:	00000000	udf	#0
   0x0000fffff7f97ef8:	00000000	udf	#0
   0x0000fffff7f97efc:	00000000	udf	#0
   0x0000fffff7f97f00:	00000000	udf	#0
   0x0000fffff7f97f04:	00000000	udf	#0
   0x0000fffff7f97f08:	00000000	udf	#0
   0x0000fffff7f97f0c:	00000000	udf	#0
   0x0000fffff7f97f10:	00000000	udf	#0
   0x0000fffff7f97f14:	00000000	udf	#0
   0x0000fffff7f97f18:	00000000	udf	#0
   0x0000fffff7f97f1c:	00000000	udf	#0
   0x0000fffff7f97f20:	00000000	udf	#0
   0x0000fffff7f97f24:	00000000	udf	#0
   0x0000fffff7f97f28:	00000000	udf	#0
   0x0000fffff7f97f2c:	00000000	udf	#0
   0x0000fffff7f97f30:	00000000	udf	#0
   0x0000fffff7f97f34:	00000000	udf	#0
   0x0000fffff7f97f38:	00000000	udf	#0
   0x0000fffff7f97f3c:	00000000	udf	#0
   0x0000fffff7f97f40:	00000000	udf	#0
   0x0000fffff7f97f44:	00000000	udf	#0
   0x0000fffff7f97f48:	00000000	udf	#0
   0x0000fffff7f97f4c:	00000000	udf	#0
   0x0000fffff7f97f50:	00000000	udf	#0
   0x0000fffff7f97f54:	00000000	udf	#0
   0x0000fffff7f97f58:	00000000	udf	#0
   0x0000fffff7f97f5c:	00000000	udf	#0
   0x0000fffff7f97f60:	00000000	udf	#0
   0x0000fffff7f97f64:	00000000	udf	#0
   0x0000fffff7f97f68:	00000000	udf	#0
   0x0000fffff7f97f6c:	00000000	udf	#0
   0x0000fffff7f97f70:	00000000	udf	#0
   0x0000fffff7f97f74:	00000000	udf	#0
   0x0000fffff7f97f78:	00000000	udf	#0
   0x0000fffff7f97f7c:	00000000	udf	#0
   0x0000fffff7f97f80:	00000000	udf	#0
   0x0000fffff7f97f84:	00000000	udf	#0
   0x0000fffff7f97f88:	00000000	udf	#0
   0x0000fffff7f97f8c:	00000000	udf	#0
   0x0000fffff7f97f90:	00000000	udf	#0
   0x0000fffff7f97f94:	00000000	udf	#0
   0x0000fffff7f97f98:	00000000	udf	#0
   0x0000fffff7f97f9c:	00000000	udf	#0
   0x0000fffff7f97fa0:	00000000	udf	#0
   0x0000fffff7f97fa4:	00000000	udf	#0
   0x0000fffff7f97fa8:	00000000	udf	#0
   0x0000fffff7f97fac:	00000000	udf	#0
   0x0000fffff7f97fb0:	00000000	udf	#0
   0x0000fffff7f97fb4:	00000000	udf	#0
   0x0000fffff7f97fb8:	00000000	udf	#0
   0x0000fffff7f97fbc:	00000000	udf	#0
   0x0000fffff7f97fc0:	00000000	udf	#0
   0x0000fffff7f97fc4:	00000000	udf	#0
   0x0000fffff7f97fc8:	00000000	udf	#0
   0x0000fffff7f97fcc:	00000000	udf	#0
   0x0000fffff7f97fd0:	00000000	udf	#0
   0x0000fffff7f97fd4:	00000000	udf	#0
   0x0000fffff7f97fd8:	00000000	udf	#0
   0x0000fffff7f97fdc:	00000000	udf	#0
   0x0000fffff7f97fe0:	00000000	udf	#0
   0x0000fffff7f97fe4:	00000000	udf	#0
   0x0000fffff7f97fe8:	00000000	udf	#0
   0x0000fffff7f97fec:	00000000	udf	#0
   0x0000fffff7f97ff0:	00000000	udf	#0
   0x0000fffff7f97ff4:	00000000	udf	#0
   0x0000fffff7f97ff8:	00000000	udf	#0
   0x0000fffff7f97ffc:	00000000	udf	#0
End of assembler dump.
