Dump of assembler code from 0xfffff7f94000 to 0xfffff7f96000:
   0x0000fffff7f94000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7f94004:	910003fd	mov	x29, sp
   0x0000fffff7f94008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7f9400c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7f94010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7f94014:	aa0003f3	mov	x19, x0
   0x0000fffff7f94018:	aa0103f4	mov	x20, x1
   0x0000fffff7f9401c:	aa0203f5	mov	x21, x2
   0x0000fffff7f94020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7f94024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7f94028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f9402c:	f90003e9	str	x9, [sp]
   0x0000fffff7f94030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7f94034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7f94038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7f9403c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f94040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94044:	d63f0200	blr	x16
   0x0000fffff7f94048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7f9404c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7f94050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7f94054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7f94058:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9405c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94060:	aa1303e1	mov	x1, x19
   0x0000fffff7f94064:	aa1503e2	mov	x2, x21
   0x0000fffff7f94068:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7f9406c:	aa1403e4	mov	x4, x20
   0x0000fffff7f94070:	aa1603e5	mov	x5, x22
   0x0000fffff7f94074:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f94078:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9407c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94080:	d63f0200	blr	x16
   0x0000fffff7f94084:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94088:	5400d960	b.eq	0xfffff7f95bb4  // b.none
   0x0000fffff7f9408c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f94090:	37d800e9	tbnz	w9, #27, 0xfffff7f940ac
   0x0000fffff7f94094:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f94098:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9409c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f940a0:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f940a4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f940a8:	1400000e	b	0xfffff7f940e0
   0x0000fffff7f940ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f940b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f940b4:	aa1303e1	mov	x1, x19
   0x0000fffff7f940b8:	aa1503e2	mov	x2, x21
   0x0000fffff7f940bc:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7f940c0:	aa1403e4	mov	x4, x20
   0x0000fffff7f940c4:	aa1603e5	mov	x5, x22
   0x0000fffff7f940c8:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7f940cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f940d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f940d4:	d63f0200	blr	x16
   0x0000fffff7f940d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f940dc:	5400d700	b.eq	0xfffff7f95bbc  // b.none
   0x0000fffff7f940e0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f940e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f940e8:	aa1303e1	mov	x1, x19
   0x0000fffff7f940ec:	aa1503e2	mov	x2, x21
   0x0000fffff7f940f0:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f940f4:	aa1403e4	mov	x4, x20
   0x0000fffff7f940f8:	aa1603e5	mov	x5, x22
   0x0000fffff7f940fc:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f94100:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f94104:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94108:	d63f0200	blr	x16
   0x0000fffff7f9410c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94110:	5400d5a0	b.eq	0xfffff7f95bc4  // b.none
   0x0000fffff7f94114:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f94118:	37d800e9	tbnz	w9, #27, 0xfffff7f94134
   0x0000fffff7f9411c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f94120:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f94124:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94128:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9412c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f94130:	1400000e	b	0xfffff7f94168
   0x0000fffff7f94134:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f94138:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9413c:	aa1303e1	mov	x1, x19
   0x0000fffff7f94140:	aa1503e2	mov	x2, x21
   0x0000fffff7f94144:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7f94148:	aa1403e4	mov	x4, x20
   0x0000fffff7f9414c:	aa1603e5	mov	x5, x22
   0x0000fffff7f94150:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7f94154:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f94158:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9415c:	d63f0200	blr	x16
   0x0000fffff7f94160:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94164:	5400d340	b.eq	0xfffff7f95bcc  // b.none
   0x0000fffff7f94168:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9416c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94170:	aa1303e1	mov	x1, x19
   0x0000fffff7f94174:	aa1503e2	mov	x2, x21
   0x0000fffff7f94178:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7f9417c:	aa1403e4	mov	x4, x20
   0x0000fffff7f94180:	aa1603e5	mov	x5, x22
   0x0000fffff7f94184:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f94188:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9418c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94190:	d63f0200	blr	x16
   0x0000fffff7f94194:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94198:	5400d1e0	b.eq	0xfffff7f95bd4  // b.none
   0x0000fffff7f9419c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f941a0:	37d80269	tbnz	w9, #27, 0xfffff7f941ec
   0x0000fffff7f941a4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f941a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f941ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f941b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f941b4:	540001c1	b.ne	0xfffff7f941ec  // b.any
   0x0000fffff7f941b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f941bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f941c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f941c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f941c8:	54000121	b.ne	0xfffff7f941ec  // b.any
   0x0000fffff7f941cc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f941d0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f941d4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f941d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f941dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f941e0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f941e4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f941e8:	1400000e	b	0xfffff7f94220
   0x0000fffff7f941ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f941f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f941f4:	aa1303e1	mov	x1, x19
   0x0000fffff7f941f8:	aa1503e2	mov	x2, x21
   0x0000fffff7f941fc:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f94200:	aa1403e4	mov	x4, x20
   0x0000fffff7f94204:	aa1603e5	mov	x5, x22
   0x0000fffff7f94208:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9420c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f94210:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94214:	d63f0200	blr	x16
   0x0000fffff7f94218:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9421c:	5400ce00	b.eq	0xfffff7f95bdc  // b.none
   0x0000fffff7f94220:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f94224:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94228:	aa1303e1	mov	x1, x19
   0x0000fffff7f9422c:	aa1503e2	mov	x2, x21
   0x0000fffff7f94230:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f94234:	aa1403e4	mov	x4, x20
   0x0000fffff7f94238:	aa1603e5	mov	x5, x22
   0x0000fffff7f9423c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f94240:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f94244:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94248:	d63f0200	blr	x16
   0x0000fffff7f9424c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94250:	5400cca0	b.eq	0xfffff7f95be4  // b.none
   0x0000fffff7f94254:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f94258:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9425c:	aa1303e1	mov	x1, x19
   0x0000fffff7f94260:	aa1503e2	mov	x2, x21
   0x0000fffff7f94264:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f94268:	aa1403e4	mov	x4, x20
   0x0000fffff7f9426c:	aa1603e5	mov	x5, x22
   0x0000fffff7f94270:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f94274:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f94278:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9427c:	d63f0200	blr	x16
   0x0000fffff7f94280:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94284:	5400cb40	b.eq	0xfffff7f95bec  // b.none
   0x0000fffff7f94288:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9428c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94290:	aa1303e1	mov	x1, x19
   0x0000fffff7f94294:	aa1503e2	mov	x2, x21
   0x0000fffff7f94298:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f9429c:	aa1403e4	mov	x4, x20
   0x0000fffff7f942a0:	aa1603e5	mov	x5, x22
   0x0000fffff7f942a4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f942a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f942ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f942b0:	d63f0200	blr	x16
   0x0000fffff7f942b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f942b8:	5400c9e0	b.eq	0xfffff7f95bf4  // b.none
   0x0000fffff7f942bc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f942c0:	37d80269	tbnz	w9, #27, 0xfffff7f9430c
   0x0000fffff7f942c4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f942c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f942cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f942d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f942d4:	540001c1	b.ne	0xfffff7f9430c  // b.any
   0x0000fffff7f942d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f942dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f942e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f942e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f942e8:	54000121	b.ne	0xfffff7f9430c  // b.any
   0x0000fffff7f942ec:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f942f0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f942f4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f942f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f942fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94300:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f94304:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f94308:	1400000e	b	0xfffff7f94340
   0x0000fffff7f9430c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f94310:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94314:	aa1303e1	mov	x1, x19
   0x0000fffff7f94318:	aa1503e2	mov	x2, x21
   0x0000fffff7f9431c:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f94320:	aa1403e4	mov	x4, x20
   0x0000fffff7f94324:	aa1603e5	mov	x5, x22
   0x0000fffff7f94328:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9432c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f94330:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94334:	d63f0200	blr	x16
   0x0000fffff7f94338:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9433c:	5400c600	b.eq	0xfffff7f95bfc  // b.none
   0x0000fffff7f94340:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f94344:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94348:	aa1303e1	mov	x1, x19
   0x0000fffff7f9434c:	aa1503e2	mov	x2, x21
   0x0000fffff7f94350:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f94354:	aa1403e4	mov	x4, x20
   0x0000fffff7f94358:	aa1603e5	mov	x5, x22
   0x0000fffff7f9435c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f94360:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f94364:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94368:	d63f0200	blr	x16
   0x0000fffff7f9436c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94370:	5400c4a0	b.eq	0xfffff7f95c04  // b.none
   0x0000fffff7f94374:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f94378:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9437c:	aa1303e1	mov	x1, x19
   0x0000fffff7f94380:	aa1503e2	mov	x2, x21
   0x0000fffff7f94384:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7f94388:	aa1403e4	mov	x4, x20
   0x0000fffff7f9438c:	aa1603e5	mov	x5, x22
   0x0000fffff7f94390:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f94394:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f94398:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9439c:	d63f0200	blr	x16
   0x0000fffff7f943a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f943a4:	5400c340	b.eq	0xfffff7f95c0c  // b.none
   0x0000fffff7f943a8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f943ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f943b0:	aa1303e1	mov	x1, x19
   0x0000fffff7f943b4:	aa1503e2	mov	x2, x21
   0x0000fffff7f943b8:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7f943bc:	aa1403e4	mov	x4, x20
   0x0000fffff7f943c0:	aa1603e5	mov	x5, x22
   0x0000fffff7f943c4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f943c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f943cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f943d0:	d63f0200	blr	x16
   0x0000fffff7f943d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f943d8:	5400c1e0	b.eq	0xfffff7f95c14  // b.none
   0x0000fffff7f943dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f943e0:	37d80269	tbnz	w9, #27, 0xfffff7f9442c
   0x0000fffff7f943e4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f943e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f943ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f943f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f943f4:	540001c1	b.ne	0xfffff7f9442c  // b.any
   0x0000fffff7f943f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f943fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f94400:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94404:	eb0a013f	cmp	x9, x10
   0x0000fffff7f94408:	54000121	b.ne	0xfffff7f9442c  // b.any
   0x0000fffff7f9440c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f94410:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f94414:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f94418:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9441c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94420:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f94424:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f94428:	1400000e	b	0xfffff7f94460
   0x0000fffff7f9442c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f94430:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94434:	aa1303e1	mov	x1, x19
   0x0000fffff7f94438:	aa1503e2	mov	x2, x21
   0x0000fffff7f9443c:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7f94440:	aa1403e4	mov	x4, x20
   0x0000fffff7f94444:	aa1603e5	mov	x5, x22
   0x0000fffff7f94448:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9444c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f94450:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94454:	d63f0200	blr	x16
   0x0000fffff7f94458:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9445c:	5400be00	b.eq	0xfffff7f95c1c  // b.none
   0x0000fffff7f94460:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f94464:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94468:	aa1303e1	mov	x1, x19
   0x0000fffff7f9446c:	aa1503e2	mov	x2, x21
   0x0000fffff7f94470:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7f94474:	aa1403e4	mov	x4, x20
   0x0000fffff7f94478:	aa1603e5	mov	x5, x22
   0x0000fffff7f9447c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f94480:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f94484:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94488:	d63f0200	blr	x16
   0x0000fffff7f9448c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94490:	5400bca0	b.eq	0xfffff7f95c24  // b.none
   0x0000fffff7f94494:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f94498:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9449c:	aa1303e1	mov	x1, x19
   0x0000fffff7f944a0:	aa1503e2	mov	x2, x21
   0x0000fffff7f944a4:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7f944a8:	aa1403e4	mov	x4, x20
   0x0000fffff7f944ac:	aa1603e5	mov	x5, x22
   0x0000fffff7f944b0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f944b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f944b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f944bc:	d63f0200	blr	x16
   0x0000fffff7f944c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f944c4:	5400bb40	b.eq	0xfffff7f95c2c  // b.none
   0x0000fffff7f944c8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f944cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f944d0:	aa1303e1	mov	x1, x19
   0x0000fffff7f944d4:	aa1503e2	mov	x2, x21
   0x0000fffff7f944d8:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7f944dc:	aa1403e4	mov	x4, x20
   0x0000fffff7f944e0:	aa1603e5	mov	x5, x22
   0x0000fffff7f944e4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f944e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f944ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f944f0:	d63f0200	blr	x16
   0x0000fffff7f944f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f944f8:	5400b9e0	b.eq	0xfffff7f95c34  // b.none
   0x0000fffff7f944fc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f94500:	37d80269	tbnz	w9, #27, 0xfffff7f9454c
   0x0000fffff7f94504:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f94508:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9450c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94510:	eb0a013f	cmp	x9, x10
   0x0000fffff7f94514:	540001c1	b.ne	0xfffff7f9454c  // b.any
   0x0000fffff7f94518:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9451c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f94520:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94524:	eb0a013f	cmp	x9, x10
   0x0000fffff7f94528:	54000121	b.ne	0xfffff7f9454c  // b.any
   0x0000fffff7f9452c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f94530:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f94534:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f94538:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9453c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94540:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f94544:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f94548:	1400000e	b	0xfffff7f94580
   0x0000fffff7f9454c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f94550:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94554:	aa1303e1	mov	x1, x19
   0x0000fffff7f94558:	aa1503e2	mov	x2, x21
   0x0000fffff7f9455c:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7f94560:	aa1403e4	mov	x4, x20
   0x0000fffff7f94564:	aa1603e5	mov	x5, x22
   0x0000fffff7f94568:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9456c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f94570:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94574:	d63f0200	blr	x16
   0x0000fffff7f94578:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9457c:	5400b600	b.eq	0xfffff7f95c3c  // b.none
   0x0000fffff7f94580:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f94584:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94588:	aa1303e1	mov	x1, x19
   0x0000fffff7f9458c:	aa1503e2	mov	x2, x21
   0x0000fffff7f94590:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7f94594:	aa1403e4	mov	x4, x20
   0x0000fffff7f94598:	aa1603e5	mov	x5, x22
   0x0000fffff7f9459c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f945a0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f945a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f945a8:	d63f0200	blr	x16
   0x0000fffff7f945ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7f945b0:	5400b4a0	b.eq	0xfffff7f95c44  // b.none
   0x0000fffff7f945b4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f945b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f945bc:	aa1303e1	mov	x1, x19
   0x0000fffff7f945c0:	aa1503e2	mov	x2, x21
   0x0000fffff7f945c4:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7f945c8:	aa1403e4	mov	x4, x20
   0x0000fffff7f945cc:	aa1603e5	mov	x5, x22
   0x0000fffff7f945d0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f945d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f945d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f945dc:	d63f0200	blr	x16
   0x0000fffff7f945e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f945e4:	5400b340	b.eq	0xfffff7f95c4c  // b.none
   0x0000fffff7f945e8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f945ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f945f0:	aa1303e1	mov	x1, x19
   0x0000fffff7f945f4:	aa1503e2	mov	x2, x21
   0x0000fffff7f945f8:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7f945fc:	aa1403e4	mov	x4, x20
   0x0000fffff7f94600:	aa1603e5	mov	x5, x22
   0x0000fffff7f94604:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f94608:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9460c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94610:	d63f0200	blr	x16
   0x0000fffff7f94614:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94618:	5400b1e0	b.eq	0xfffff7f95c54  // b.none
   0x0000fffff7f9461c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f94620:	37d80269	tbnz	w9, #27, 0xfffff7f9466c
   0x0000fffff7f94624:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f94628:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9462c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94630:	eb0a013f	cmp	x9, x10
   0x0000fffff7f94634:	540001c1	b.ne	0xfffff7f9466c  // b.any
   0x0000fffff7f94638:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9463c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f94640:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94644:	eb0a013f	cmp	x9, x10
   0x0000fffff7f94648:	54000121	b.ne	0xfffff7f9466c  // b.any
   0x0000fffff7f9464c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f94650:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f94654:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f94658:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9465c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94660:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f94664:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f94668:	1400000e	b	0xfffff7f946a0
   0x0000fffff7f9466c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f94670:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94674:	aa1303e1	mov	x1, x19
   0x0000fffff7f94678:	aa1503e2	mov	x2, x21
   0x0000fffff7f9467c:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7f94680:	aa1403e4	mov	x4, x20
   0x0000fffff7f94684:	aa1603e5	mov	x5, x22
   0x0000fffff7f94688:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9468c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f94690:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94694:	d63f0200	blr	x16
   0x0000fffff7f94698:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9469c:	5400ae00	b.eq	0xfffff7f95c5c  // b.none
   0x0000fffff7f946a0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f946a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f946a8:	aa1303e1	mov	x1, x19
   0x0000fffff7f946ac:	aa1503e2	mov	x2, x21
   0x0000fffff7f946b0:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7f946b4:	aa1403e4	mov	x4, x20
   0x0000fffff7f946b8:	aa1603e5	mov	x5, x22
   0x0000fffff7f946bc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f946c0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f946c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f946c8:	d63f0200	blr	x16
   0x0000fffff7f946cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f946d0:	5400aca0	b.eq	0xfffff7f95c64  // b.none
   0x0000fffff7f946d4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f946d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f946dc:	aa1303e1	mov	x1, x19
   0x0000fffff7f946e0:	aa1503e2	mov	x2, x21
   0x0000fffff7f946e4:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7f946e8:	aa1403e4	mov	x4, x20
   0x0000fffff7f946ec:	aa1603e5	mov	x5, x22
   0x0000fffff7f946f0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f946f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f946f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f946fc:	d63f0200	blr	x16
   0x0000fffff7f94700:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94704:	5400ab40	b.eq	0xfffff7f95c6c  // b.none
   0x0000fffff7f94708:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9470c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94710:	aa1303e1	mov	x1, x19
   0x0000fffff7f94714:	aa1503e2	mov	x2, x21
   0x0000fffff7f94718:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7f9471c:	aa1403e4	mov	x4, x20
   0x0000fffff7f94720:	aa1603e5	mov	x5, x22
   0x0000fffff7f94724:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f94728:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9472c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94730:	d63f0200	blr	x16
   0x0000fffff7f94734:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94738:	5400a9e0	b.eq	0xfffff7f95c74  // b.none
   0x0000fffff7f9473c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f94740:	37d80269	tbnz	w9, #27, 0xfffff7f9478c
   0x0000fffff7f94744:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f94748:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9474c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94750:	eb0a013f	cmp	x9, x10
   0x0000fffff7f94754:	540001c1	b.ne	0xfffff7f9478c  // b.any
   0x0000fffff7f94758:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9475c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f94760:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94764:	eb0a013f	cmp	x9, x10
   0x0000fffff7f94768:	54000121	b.ne	0xfffff7f9478c  // b.any
   0x0000fffff7f9476c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f94770:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f94774:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f94778:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9477c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94780:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f94784:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f94788:	1400000e	b	0xfffff7f947c0
   0x0000fffff7f9478c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f94790:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94794:	aa1303e1	mov	x1, x19
   0x0000fffff7f94798:	aa1503e2	mov	x2, x21
   0x0000fffff7f9479c:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7f947a0:	aa1403e4	mov	x4, x20
   0x0000fffff7f947a4:	aa1603e5	mov	x5, x22
   0x0000fffff7f947a8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f947ac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f947b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f947b4:	d63f0200	blr	x16
   0x0000fffff7f947b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f947bc:	5400a600	b.eq	0xfffff7f95c7c  // b.none
   0x0000fffff7f947c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f947c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f947c8:	aa1303e1	mov	x1, x19
   0x0000fffff7f947cc:	aa1503e2	mov	x2, x21
   0x0000fffff7f947d0:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7f947d4:	aa1403e4	mov	x4, x20
   0x0000fffff7f947d8:	aa1603e5	mov	x5, x22
   0x0000fffff7f947dc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f947e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f947e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f947e8:	d63f0200	blr	x16
   0x0000fffff7f947ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f947f0:	5400a4a0	b.eq	0xfffff7f95c84  // b.none
   0x0000fffff7f947f4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f947f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f947fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f94800:	aa1503e2	mov	x2, x21
   0x0000fffff7f94804:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7f94808:	aa1403e4	mov	x4, x20
   0x0000fffff7f9480c:	aa1603e5	mov	x5, x22
   0x0000fffff7f94810:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f94814:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f94818:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9481c:	d63f0200	blr	x16
   0x0000fffff7f94820:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94824:	5400a340	b.eq	0xfffff7f95c8c  // b.none
   0x0000fffff7f94828:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9482c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94830:	aa1303e1	mov	x1, x19
   0x0000fffff7f94834:	aa1503e2	mov	x2, x21
   0x0000fffff7f94838:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7f9483c:	aa1403e4	mov	x4, x20
   0x0000fffff7f94840:	aa1603e5	mov	x5, x22
   0x0000fffff7f94844:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f94848:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9484c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94850:	d63f0200	blr	x16
   0x0000fffff7f94854:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94858:	5400a1e0	b.eq	0xfffff7f95c94  // b.none
   0x0000fffff7f9485c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f94860:	37d80269	tbnz	w9, #27, 0xfffff7f948ac
   0x0000fffff7f94864:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f94868:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9486c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94870:	eb0a013f	cmp	x9, x10
   0x0000fffff7f94874:	540001c1	b.ne	0xfffff7f948ac  // b.any
   0x0000fffff7f94878:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9487c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f94880:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94884:	eb0a013f	cmp	x9, x10
   0x0000fffff7f94888:	54000121	b.ne	0xfffff7f948ac  // b.any
   0x0000fffff7f9488c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f94890:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f94894:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f94898:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9489c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f948a0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f948a4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f948a8:	1400000e	b	0xfffff7f948e0
   0x0000fffff7f948ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f948b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f948b4:	aa1303e1	mov	x1, x19
   0x0000fffff7f948b8:	aa1503e2	mov	x2, x21
   0x0000fffff7f948bc:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7f948c0:	aa1403e4	mov	x4, x20
   0x0000fffff7f948c4:	aa1603e5	mov	x5, x22
   0x0000fffff7f948c8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f948cc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f948d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f948d4:	d63f0200	blr	x16
   0x0000fffff7f948d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f948dc:	54009e00	b.eq	0xfffff7f95c9c  // b.none
   0x0000fffff7f948e0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f948e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f948e8:	aa1303e1	mov	x1, x19
   0x0000fffff7f948ec:	aa1503e2	mov	x2, x21
   0x0000fffff7f948f0:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7f948f4:	aa1403e4	mov	x4, x20
   0x0000fffff7f948f8:	aa1603e5	mov	x5, x22
   0x0000fffff7f948fc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f94900:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f94904:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94908:	d63f0200	blr	x16
   0x0000fffff7f9490c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94910:	54009ca0	b.eq	0xfffff7f95ca4  // b.none
   0x0000fffff7f94914:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f94918:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9491c:	aa1303e1	mov	x1, x19
   0x0000fffff7f94920:	aa1503e2	mov	x2, x21
   0x0000fffff7f94924:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7f94928:	aa1403e4	mov	x4, x20
   0x0000fffff7f9492c:	aa1603e5	mov	x5, x22
   0x0000fffff7f94930:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f94934:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f94938:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9493c:	d63f0200	blr	x16
   0x0000fffff7f94940:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94944:	54009b40	b.eq	0xfffff7f95cac  // b.none
   0x0000fffff7f94948:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9494c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94950:	aa1303e1	mov	x1, x19
   0x0000fffff7f94954:	aa1503e2	mov	x2, x21
   0x0000fffff7f94958:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7f9495c:	aa1403e4	mov	x4, x20
   0x0000fffff7f94960:	aa1603e5	mov	x5, x22
   0x0000fffff7f94964:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f94968:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9496c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94970:	d63f0200	blr	x16
   0x0000fffff7f94974:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94978:	540099e0	b.eq	0xfffff7f95cb4  // b.none
   0x0000fffff7f9497c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f94980:	37d80269	tbnz	w9, #27, 0xfffff7f949cc
   0x0000fffff7f94984:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f94988:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9498c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94990:	eb0a013f	cmp	x9, x10
   0x0000fffff7f94994:	540001c1	b.ne	0xfffff7f949cc  // b.any
   0x0000fffff7f94998:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9499c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f949a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f949a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f949a8:	54000121	b.ne	0xfffff7f949cc  // b.any
   0x0000fffff7f949ac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f949b0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f949b4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f949b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f949bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f949c0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f949c4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f949c8:	1400000e	b	0xfffff7f94a00
   0x0000fffff7f949cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f949d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f949d4:	aa1303e1	mov	x1, x19
   0x0000fffff7f949d8:	aa1503e2	mov	x2, x21
   0x0000fffff7f949dc:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7f949e0:	aa1403e4	mov	x4, x20
   0x0000fffff7f949e4:	aa1603e5	mov	x5, x22
   0x0000fffff7f949e8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f949ec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f949f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f949f4:	d63f0200	blr	x16
   0x0000fffff7f949f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f949fc:	54009600	b.eq	0xfffff7f95cbc  // b.none
   0x0000fffff7f94a00:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f94a04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94a08:	aa1303e1	mov	x1, x19
   0x0000fffff7f94a0c:	aa1503e2	mov	x2, x21
   0x0000fffff7f94a10:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7f94a14:	aa1403e4	mov	x4, x20
   0x0000fffff7f94a18:	aa1603e5	mov	x5, x22
   0x0000fffff7f94a1c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f94a20:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f94a24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94a28:	d63f0200	blr	x16
   0x0000fffff7f94a2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94a30:	540094a0	b.eq	0xfffff7f95cc4  // b.none
   0x0000fffff7f94a34:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f94a38:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94a3c:	aa1303e1	mov	x1, x19
   0x0000fffff7f94a40:	aa1503e2	mov	x2, x21
   0x0000fffff7f94a44:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7f94a48:	aa1403e4	mov	x4, x20
   0x0000fffff7f94a4c:	aa1603e5	mov	x5, x22
   0x0000fffff7f94a50:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f94a54:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f94a58:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94a5c:	d63f0200	blr	x16
   0x0000fffff7f94a60:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94a64:	54009340	b.eq	0xfffff7f95ccc  // b.none
   0x0000fffff7f94a68:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f94a6c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94a70:	aa1303e1	mov	x1, x19
   0x0000fffff7f94a74:	aa1503e2	mov	x2, x21
   0x0000fffff7f94a78:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7f94a7c:	aa1403e4	mov	x4, x20
   0x0000fffff7f94a80:	aa1603e5	mov	x5, x22
   0x0000fffff7f94a84:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f94a88:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f94a8c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94a90:	d63f0200	blr	x16
   0x0000fffff7f94a94:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94a98:	540091e0	b.eq	0xfffff7f95cd4  // b.none
   0x0000fffff7f94a9c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f94aa0:	37d80269	tbnz	w9, #27, 0xfffff7f94aec
   0x0000fffff7f94aa4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f94aa8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f94aac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94ab0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f94ab4:	540001c1	b.ne	0xfffff7f94aec  // b.any
   0x0000fffff7f94ab8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f94abc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f94ac0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94ac4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f94ac8:	54000121	b.ne	0xfffff7f94aec  // b.any
   0x0000fffff7f94acc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f94ad0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f94ad4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f94ad8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f94adc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94ae0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f94ae4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f94ae8:	1400000e	b	0xfffff7f94b20
   0x0000fffff7f94aec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f94af0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94af4:	aa1303e1	mov	x1, x19
   0x0000fffff7f94af8:	aa1503e2	mov	x2, x21
   0x0000fffff7f94afc:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7f94b00:	aa1403e4	mov	x4, x20
   0x0000fffff7f94b04:	aa1603e5	mov	x5, x22
   0x0000fffff7f94b08:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f94b0c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f94b10:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94b14:	d63f0200	blr	x16
   0x0000fffff7f94b18:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94b1c:	54008e00	b.eq	0xfffff7f95cdc  // b.none
   0x0000fffff7f94b20:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f94b24:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94b28:	aa1303e1	mov	x1, x19
   0x0000fffff7f94b2c:	aa1503e2	mov	x2, x21
   0x0000fffff7f94b30:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7f94b34:	aa1403e4	mov	x4, x20
   0x0000fffff7f94b38:	aa1603e5	mov	x5, x22
   0x0000fffff7f94b3c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f94b40:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f94b44:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94b48:	d63f0200	blr	x16
   0x0000fffff7f94b4c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94b50:	54008ca0	b.eq	0xfffff7f95ce4  // b.none
   0x0000fffff7f94b54:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f94b58:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94b5c:	aa1303e1	mov	x1, x19
   0x0000fffff7f94b60:	aa1503e2	mov	x2, x21
   0x0000fffff7f94b64:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7f94b68:	aa1403e4	mov	x4, x20
   0x0000fffff7f94b6c:	aa1603e5	mov	x5, x22
   0x0000fffff7f94b70:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f94b74:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f94b78:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94b7c:	d63f0200	blr	x16
   0x0000fffff7f94b80:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94b84:	54008b40	b.eq	0xfffff7f95cec  // b.none
   0x0000fffff7f94b88:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f94b8c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94b90:	aa1303e1	mov	x1, x19
   0x0000fffff7f94b94:	aa1503e2	mov	x2, x21
   0x0000fffff7f94b98:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7f94b9c:	aa1403e4	mov	x4, x20
   0x0000fffff7f94ba0:	aa1603e5	mov	x5, x22
   0x0000fffff7f94ba4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f94ba8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f94bac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94bb0:	d63f0200	blr	x16
   0x0000fffff7f94bb4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94bb8:	540089e0	b.eq	0xfffff7f95cf4  // b.none
   0x0000fffff7f94bbc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f94bc0:	37d80269	tbnz	w9, #27, 0xfffff7f94c0c
   0x0000fffff7f94bc4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f94bc8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f94bcc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94bd0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f94bd4:	540001c1	b.ne	0xfffff7f94c0c  // b.any
   0x0000fffff7f94bd8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f94bdc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f94be0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94be4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f94be8:	54000121	b.ne	0xfffff7f94c0c  // b.any
   0x0000fffff7f94bec:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f94bf0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f94bf4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f94bf8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f94bfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94c00:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f94c04:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f94c08:	1400000e	b	0xfffff7f94c40
   0x0000fffff7f94c0c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f94c10:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94c14:	aa1303e1	mov	x1, x19
   0x0000fffff7f94c18:	aa1503e2	mov	x2, x21
   0x0000fffff7f94c1c:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7f94c20:	aa1403e4	mov	x4, x20
   0x0000fffff7f94c24:	aa1603e5	mov	x5, x22
   0x0000fffff7f94c28:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f94c2c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f94c30:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94c34:	d63f0200	blr	x16
   0x0000fffff7f94c38:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94c3c:	54008600	b.eq	0xfffff7f95cfc  // b.none
   0x0000fffff7f94c40:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f94c44:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94c48:	aa1303e1	mov	x1, x19
   0x0000fffff7f94c4c:	aa1503e2	mov	x2, x21
   0x0000fffff7f94c50:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7f94c54:	aa1403e4	mov	x4, x20
   0x0000fffff7f94c58:	aa1603e5	mov	x5, x22
   0x0000fffff7f94c5c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f94c60:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f94c64:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94c68:	d63f0200	blr	x16
   0x0000fffff7f94c6c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94c70:	540084a0	b.eq	0xfffff7f95d04  // b.none
   0x0000fffff7f94c74:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f94c78:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94c7c:	aa1303e1	mov	x1, x19
   0x0000fffff7f94c80:	aa1503e2	mov	x2, x21
   0x0000fffff7f94c84:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7f94c88:	aa1403e4	mov	x4, x20
   0x0000fffff7f94c8c:	aa1603e5	mov	x5, x22
   0x0000fffff7f94c90:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f94c94:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f94c98:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94c9c:	d63f0200	blr	x16
   0x0000fffff7f94ca0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94ca4:	54008340	b.eq	0xfffff7f95d0c  // b.none
   0x0000fffff7f94ca8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f94cac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94cb0:	aa1303e1	mov	x1, x19
   0x0000fffff7f94cb4:	aa1503e2	mov	x2, x21
   0x0000fffff7f94cb8:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7f94cbc:	aa1403e4	mov	x4, x20
   0x0000fffff7f94cc0:	aa1603e5	mov	x5, x22
   0x0000fffff7f94cc4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f94cc8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f94ccc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94cd0:	d63f0200	blr	x16
   0x0000fffff7f94cd4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94cd8:	540081e0	b.eq	0xfffff7f95d14  // b.none
   0x0000fffff7f94cdc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f94ce0:	37d80269	tbnz	w9, #27, 0xfffff7f94d2c
   0x0000fffff7f94ce4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f94ce8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f94cec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94cf0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f94cf4:	540001c1	b.ne	0xfffff7f94d2c  // b.any
   0x0000fffff7f94cf8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f94cfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f94d00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94d04:	eb0a013f	cmp	x9, x10
   0x0000fffff7f94d08:	54000121	b.ne	0xfffff7f94d2c  // b.any
   0x0000fffff7f94d0c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f94d10:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f94d14:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f94d18:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f94d1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94d20:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f94d24:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f94d28:	1400000e	b	0xfffff7f94d60
   0x0000fffff7f94d2c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f94d30:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94d34:	aa1303e1	mov	x1, x19
   0x0000fffff7f94d38:	aa1503e2	mov	x2, x21
   0x0000fffff7f94d3c:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7f94d40:	aa1403e4	mov	x4, x20
   0x0000fffff7f94d44:	aa1603e5	mov	x5, x22
   0x0000fffff7f94d48:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f94d4c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f94d50:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94d54:	d63f0200	blr	x16
   0x0000fffff7f94d58:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94d5c:	54007e00	b.eq	0xfffff7f95d1c  // b.none
   0x0000fffff7f94d60:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f94d64:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94d68:	aa1303e1	mov	x1, x19
   0x0000fffff7f94d6c:	aa1503e2	mov	x2, x21
   0x0000fffff7f94d70:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7f94d74:	aa1403e4	mov	x4, x20
   0x0000fffff7f94d78:	aa1603e5	mov	x5, x22
   0x0000fffff7f94d7c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f94d80:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f94d84:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94d88:	d63f0200	blr	x16
   0x0000fffff7f94d8c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94d90:	54007ca0	b.eq	0xfffff7f95d24  // b.none
   0x0000fffff7f94d94:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f94d98:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94d9c:	aa1303e1	mov	x1, x19
   0x0000fffff7f94da0:	aa1503e2	mov	x2, x21
   0x0000fffff7f94da4:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7f94da8:	aa1403e4	mov	x4, x20
   0x0000fffff7f94dac:	aa1603e5	mov	x5, x22
   0x0000fffff7f94db0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f94db4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f94db8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94dbc:	d63f0200	blr	x16
   0x0000fffff7f94dc0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94dc4:	54007b40	b.eq	0xfffff7f95d2c  // b.none
   0x0000fffff7f94dc8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f94dcc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94dd0:	aa1303e1	mov	x1, x19
   0x0000fffff7f94dd4:	aa1503e2	mov	x2, x21
   0x0000fffff7f94dd8:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7f94ddc:	aa1403e4	mov	x4, x20
   0x0000fffff7f94de0:	aa1603e5	mov	x5, x22
   0x0000fffff7f94de4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f94de8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f94dec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94df0:	d63f0200	blr	x16
   0x0000fffff7f94df4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94df8:	540079e0	b.eq	0xfffff7f95d34  // b.none
   0x0000fffff7f94dfc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f94e00:	37d80269	tbnz	w9, #27, 0xfffff7f94e4c
   0x0000fffff7f94e04:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f94e08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f94e0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94e10:	eb0a013f	cmp	x9, x10
   0x0000fffff7f94e14:	540001c1	b.ne	0xfffff7f94e4c  // b.any
   0x0000fffff7f94e18:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f94e1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f94e20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94e24:	eb0a013f	cmp	x9, x10
   0x0000fffff7f94e28:	54000121	b.ne	0xfffff7f94e4c  // b.any
   0x0000fffff7f94e2c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f94e30:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f94e34:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f94e38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f94e3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94e40:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f94e44:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f94e48:	1400000e	b	0xfffff7f94e80
   0x0000fffff7f94e4c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f94e50:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94e54:	aa1303e1	mov	x1, x19
   0x0000fffff7f94e58:	aa1503e2	mov	x2, x21
   0x0000fffff7f94e5c:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7f94e60:	aa1403e4	mov	x4, x20
   0x0000fffff7f94e64:	aa1603e5	mov	x5, x22
   0x0000fffff7f94e68:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f94e6c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f94e70:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94e74:	d63f0200	blr	x16
   0x0000fffff7f94e78:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94e7c:	54007600	b.eq	0xfffff7f95d3c  // b.none
   0x0000fffff7f94e80:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f94e84:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94e88:	aa1303e1	mov	x1, x19
   0x0000fffff7f94e8c:	aa1503e2	mov	x2, x21
   0x0000fffff7f94e90:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7f94e94:	aa1403e4	mov	x4, x20
   0x0000fffff7f94e98:	aa1603e5	mov	x5, x22
   0x0000fffff7f94e9c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f94ea0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f94ea4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94ea8:	d63f0200	blr	x16
   0x0000fffff7f94eac:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94eb0:	540074a0	b.eq	0xfffff7f95d44  // b.none
   0x0000fffff7f94eb4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f94eb8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94ebc:	aa1303e1	mov	x1, x19
   0x0000fffff7f94ec0:	aa1503e2	mov	x2, x21
   0x0000fffff7f94ec4:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7f94ec8:	aa1403e4	mov	x4, x20
   0x0000fffff7f94ecc:	aa1603e5	mov	x5, x22
   0x0000fffff7f94ed0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f94ed4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f94ed8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94edc:	d63f0200	blr	x16
   0x0000fffff7f94ee0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94ee4:	54007340	b.eq	0xfffff7f95d4c  // b.none
   0x0000fffff7f94ee8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f94eec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94ef0:	aa1303e1	mov	x1, x19
   0x0000fffff7f94ef4:	aa1503e2	mov	x2, x21
   0x0000fffff7f94ef8:	d2800683	mov	x3, #0x34                  	// #52
   0x0000fffff7f94efc:	aa1403e4	mov	x4, x20
   0x0000fffff7f94f00:	aa1603e5	mov	x5, x22
   0x0000fffff7f94f04:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f94f08:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f94f0c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94f10:	d63f0200	blr	x16
   0x0000fffff7f94f14:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94f18:	540071e0	b.eq	0xfffff7f95d54  // b.none
   0x0000fffff7f94f1c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f94f20:	37d80269	tbnz	w9, #27, 0xfffff7f94f6c
   0x0000fffff7f94f24:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f94f28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f94f2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94f30:	eb0a013f	cmp	x9, x10
   0x0000fffff7f94f34:	540001c1	b.ne	0xfffff7f94f6c  // b.any
   0x0000fffff7f94f38:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f94f3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f94f40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94f44:	eb0a013f	cmp	x9, x10
   0x0000fffff7f94f48:	54000121	b.ne	0xfffff7f94f6c  // b.any
   0x0000fffff7f94f4c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f94f50:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f94f54:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f94f58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f94f5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f94f60:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f94f64:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f94f68:	1400000e	b	0xfffff7f94fa0
   0x0000fffff7f94f6c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f94f70:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94f74:	aa1303e1	mov	x1, x19
   0x0000fffff7f94f78:	aa1503e2	mov	x2, x21
   0x0000fffff7f94f7c:	d28006a3	mov	x3, #0x35                  	// #53
   0x0000fffff7f94f80:	aa1403e4	mov	x4, x20
   0x0000fffff7f94f84:	aa1603e5	mov	x5, x22
   0x0000fffff7f94f88:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f94f8c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f94f90:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94f94:	d63f0200	blr	x16
   0x0000fffff7f94f98:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94f9c:	54006e00	b.eq	0xfffff7f95d5c  // b.none
   0x0000fffff7f94fa0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f94fa4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94fa8:	aa1303e1	mov	x1, x19
   0x0000fffff7f94fac:	aa1503e2	mov	x2, x21
   0x0000fffff7f94fb0:	d28006c3	mov	x3, #0x36                  	// #54
   0x0000fffff7f94fb4:	aa1403e4	mov	x4, x20
   0x0000fffff7f94fb8:	aa1603e5	mov	x5, x22
   0x0000fffff7f94fbc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f94fc0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f94fc4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94fc8:	d63f0200	blr	x16
   0x0000fffff7f94fcc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f94fd0:	54006ca0	b.eq	0xfffff7f95d64  // b.none
   0x0000fffff7f94fd4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f94fd8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f94fdc:	aa1303e1	mov	x1, x19
   0x0000fffff7f94fe0:	aa1503e2	mov	x2, x21
   0x0000fffff7f94fe4:	d28006e3	mov	x3, #0x37                  	// #55
   0x0000fffff7f94fe8:	aa1403e4	mov	x4, x20
   0x0000fffff7f94fec:	aa1603e5	mov	x5, x22
   0x0000fffff7f94ff0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f94ff4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f94ff8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f94ffc:	d63f0200	blr	x16
   0x0000fffff7f95000:	f100001f	cmp	x0, #0x0
   0x0000fffff7f95004:	54006b40	b.eq	0xfffff7f95d6c  // b.none
   0x0000fffff7f95008:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9500c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f95010:	aa1303e1	mov	x1, x19
   0x0000fffff7f95014:	aa1503e2	mov	x2, x21
   0x0000fffff7f95018:	d2800703	mov	x3, #0x38                  	// #56
   0x0000fffff7f9501c:	aa1403e4	mov	x4, x20
   0x0000fffff7f95020:	aa1603e5	mov	x5, x22
   0x0000fffff7f95024:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f95028:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9502c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f95030:	d63f0200	blr	x16
   0x0000fffff7f95034:	f100001f	cmp	x0, #0x0
   0x0000fffff7f95038:	540069e0	b.eq	0xfffff7f95d74  // b.none
   0x0000fffff7f9503c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f95040:	37d80269	tbnz	w9, #27, 0xfffff7f9508c
   0x0000fffff7f95044:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f95048:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9504c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f95050:	eb0a013f	cmp	x9, x10
   0x0000fffff7f95054:	540001c1	b.ne	0xfffff7f9508c  // b.any
   0x0000fffff7f95058:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9505c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f95060:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f95064:	eb0a013f	cmp	x9, x10
   0x0000fffff7f95068:	54000121	b.ne	0xfffff7f9508c  // b.any
   0x0000fffff7f9506c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f95070:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f95074:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f95078:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9507c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f95080:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f95084:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f95088:	1400000e	b	0xfffff7f950c0
   0x0000fffff7f9508c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f95090:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f95094:	aa1303e1	mov	x1, x19
   0x0000fffff7f95098:	aa1503e2	mov	x2, x21
   0x0000fffff7f9509c:	d2800723	mov	x3, #0x39                  	// #57
   0x0000fffff7f950a0:	aa1403e4	mov	x4, x20
   0x0000fffff7f950a4:	aa1603e5	mov	x5, x22
   0x0000fffff7f950a8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f950ac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f950b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f950b4:	d63f0200	blr	x16
   0x0000fffff7f950b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f950bc:	54006600	b.eq	0xfffff7f95d7c  // b.none
   0x0000fffff7f950c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f950c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f950c8:	aa1303e1	mov	x1, x19
   0x0000fffff7f950cc:	aa1503e2	mov	x2, x21
   0x0000fffff7f950d0:	d2800743	mov	x3, #0x3a                  	// #58
   0x0000fffff7f950d4:	aa1403e4	mov	x4, x20
   0x0000fffff7f950d8:	aa1603e5	mov	x5, x22
   0x0000fffff7f950dc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f950e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f950e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f950e8:	d63f0200	blr	x16
   0x0000fffff7f950ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f950f0:	540064a0	b.eq	0xfffff7f95d84  // b.none
   0x0000fffff7f950f4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f950f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f950fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f95100:	aa1503e2	mov	x2, x21
   0x0000fffff7f95104:	d2800763	mov	x3, #0x3b                  	// #59
   0x0000fffff7f95108:	aa1403e4	mov	x4, x20
   0x0000fffff7f9510c:	aa1603e5	mov	x5, x22
   0x0000fffff7f95110:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f95114:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f95118:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9511c:	d63f0200	blr	x16
   0x0000fffff7f95120:	f100001f	cmp	x0, #0x0
   0x0000fffff7f95124:	54006340	b.eq	0xfffff7f95d8c  // b.none
   0x0000fffff7f95128:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9512c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f95130:	aa1303e1	mov	x1, x19
   0x0000fffff7f95134:	aa1503e2	mov	x2, x21
   0x0000fffff7f95138:	d2800783	mov	x3, #0x3c                  	// #60
   0x0000fffff7f9513c:	aa1403e4	mov	x4, x20
   0x0000fffff7f95140:	aa1603e5	mov	x5, x22
   0x0000fffff7f95144:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f95148:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9514c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f95150:	d63f0200	blr	x16
   0x0000fffff7f95154:	f100001f	cmp	x0, #0x0
   0x0000fffff7f95158:	540061e0	b.eq	0xfffff7f95d94  // b.none
   0x0000fffff7f9515c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f95160:	37d80269	tbnz	w9, #27, 0xfffff7f951ac
   0x0000fffff7f95164:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f95168:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9516c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f95170:	eb0a013f	cmp	x9, x10
   0x0000fffff7f95174:	540001c1	b.ne	0xfffff7f951ac  // b.any
   0x0000fffff7f95178:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9517c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f95180:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f95184:	eb0a013f	cmp	x9, x10
   0x0000fffff7f95188:	54000121	b.ne	0xfffff7f951ac  // b.any
   0x0000fffff7f9518c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f95190:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f95194:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f95198:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9519c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f951a0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f951a4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f951a8:	1400000e	b	0xfffff7f951e0
   0x0000fffff7f951ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f951b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f951b4:	aa1303e1	mov	x1, x19
   0x0000fffff7f951b8:	aa1503e2	mov	x2, x21
   0x0000fffff7f951bc:	d28007a3	mov	x3, #0x3d                  	// #61
   0x0000fffff7f951c0:	aa1403e4	mov	x4, x20
   0x0000fffff7f951c4:	aa1603e5	mov	x5, x22
   0x0000fffff7f951c8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f951cc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f951d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f951d4:	d63f0200	blr	x16
   0x0000fffff7f951d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f951dc:	54005e00	b.eq	0xfffff7f95d9c  // b.none
   0x0000fffff7f951e0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f951e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f951e8:	aa1303e1	mov	x1, x19
   0x0000fffff7f951ec:	aa1503e2	mov	x2, x21
   0x0000fffff7f951f0:	d28007c3	mov	x3, #0x3e                  	// #62
   0x0000fffff7f951f4:	aa1403e4	mov	x4, x20
   0x0000fffff7f951f8:	aa1603e5	mov	x5, x22
   0x0000fffff7f951fc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f95200:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f95204:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f95208:	d63f0200	blr	x16
   0x0000fffff7f9520c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f95210:	54005ca0	b.eq	0xfffff7f95da4  // b.none
   0x0000fffff7f95214:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f95218:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9521c:	aa1303e1	mov	x1, x19
   0x0000fffff7f95220:	aa1503e2	mov	x2, x21
   0x0000fffff7f95224:	d28007e3	mov	x3, #0x3f                  	// #63
   0x0000fffff7f95228:	aa1403e4	mov	x4, x20
   0x0000fffff7f9522c:	aa1603e5	mov	x5, x22
   0x0000fffff7f95230:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f95234:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f95238:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9523c:	d63f0200	blr	x16
   0x0000fffff7f95240:	f100001f	cmp	x0, #0x0
   0x0000fffff7f95244:	54005b40	b.eq	0xfffff7f95dac  // b.none
   0x0000fffff7f95248:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9524c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f95250:	aa1303e1	mov	x1, x19
   0x0000fffff7f95254:	aa1503e2	mov	x2, x21
   0x0000fffff7f95258:	d2800803	mov	x3, #0x40                  	// #64
   0x0000fffff7f9525c:	aa1403e4	mov	x4, x20
   0x0000fffff7f95260:	aa1603e5	mov	x5, x22
   0x0000fffff7f95264:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f95268:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9526c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f95270:	d63f0200	blr	x16
   0x0000fffff7f95274:	f100001f	cmp	x0, #0x0
   0x0000fffff7f95278:	540059e0	b.eq	0xfffff7f95db4  // b.none
   0x0000fffff7f9527c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f95280:	37d80269	tbnz	w9, #27, 0xfffff7f952cc
   0x0000fffff7f95284:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f95288:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9528c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f95290:	eb0a013f	cmp	x9, x10
   0x0000fffff7f95294:	540001c1	b.ne	0xfffff7f952cc  // b.any
   0x0000fffff7f95298:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9529c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f952a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f952a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f952a8:	54000121	b.ne	0xfffff7f952cc  // b.any
   0x0000fffff7f952ac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f952b0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f952b4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f952b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f952bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f952c0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f952c4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f952c8:	1400000e	b	0xfffff7f95300
   0x0000fffff7f952cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f952d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f952d4:	aa1303e1	mov	x1, x19
   0x0000fffff7f952d8:	aa1503e2	mov	x2, x21
   0x0000fffff7f952dc:	d2800823	mov	x3, #0x41                  	// #65
   0x0000fffff7f952e0:	aa1403e4	mov	x4, x20
   0x0000fffff7f952e4:	aa1603e5	mov	x5, x22
   0x0000fffff7f952e8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f952ec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f952f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f952f4:	d63f0200	blr	x16
   0x0000fffff7f952f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f952fc:	54005600	b.eq	0xfffff7f95dbc  // b.none
   0x0000fffff7f95300:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f95304:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f95308:	aa1303e1	mov	x1, x19
   0x0000fffff7f9530c:	aa1503e2	mov	x2, x21
   0x0000fffff7f95310:	d2800843	mov	x3, #0x42                  	// #66
   0x0000fffff7f95314:	aa1403e4	mov	x4, x20
   0x0000fffff7f95318:	aa1603e5	mov	x5, x22
   0x0000fffff7f9531c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f95320:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f95324:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f95328:	d63f0200	blr	x16
   0x0000fffff7f9532c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f95330:	540054a0	b.eq	0xfffff7f95dc4  // b.none
   0x0000fffff7f95334:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f95338:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9533c:	aa1303e1	mov	x1, x19
   0x0000fffff7f95340:	aa1503e2	mov	x2, x21
   0x0000fffff7f95344:	d2800863	mov	x3, #0x43                  	// #67
   0x0000fffff7f95348:	aa1403e4	mov	x4, x20
   0x0000fffff7f9534c:	aa1603e5	mov	x5, x22
   0x0000fffff7f95350:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f95354:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f95358:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9535c:	d63f0200	blr	x16
   0x0000fffff7f95360:	f100001f	cmp	x0, #0x0
   0x0000fffff7f95364:	54005340	b.eq	0xfffff7f95dcc  // b.none
   0x0000fffff7f95368:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9536c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f95370:	aa1303e1	mov	x1, x19
   0x0000fffff7f95374:	aa1503e2	mov	x2, x21
   0x0000fffff7f95378:	d2800883	mov	x3, #0x44                  	// #68
   0x0000fffff7f9537c:	aa1403e4	mov	x4, x20
   0x0000fffff7f95380:	aa1603e5	mov	x5, x22
   0x0000fffff7f95384:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f95388:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9538c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f95390:	d63f0200	blr	x16
   0x0000fffff7f95394:	f100001f	cmp	x0, #0x0
   0x0000fffff7f95398:	540051e0	b.eq	0xfffff7f95dd4  // b.none
   0x0000fffff7f9539c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f953a0:	37d80269	tbnz	w9, #27, 0xfffff7f953ec
   0x0000fffff7f953a4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f953a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f953ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f953b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f953b4:	540001c1	b.ne	0xfffff7f953ec  // b.any
   0x0000fffff7f953b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f953bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f953c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f953c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f953c8:	54000121	b.ne	0xfffff7f953ec  // b.any
   0x0000fffff7f953cc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f953d0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f953d4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f953d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f953dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f953e0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f953e4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f953e8:	1400000e	b	0xfffff7f95420
   0x0000fffff7f953ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f953f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f953f4:	aa1303e1	mov	x1, x19
   0x0000fffff7f953f8:	aa1503e2	mov	x2, x21
   0x0000fffff7f953fc:	d28008a3	mov	x3, #0x45                  	// #69
   0x0000fffff7f95400:	aa1403e4	mov	x4, x20
   0x0000fffff7f95404:	aa1603e5	mov	x5, x22
   0x0000fffff7f95408:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9540c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f95410:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f95414:	d63f0200	blr	x16
   0x0000fffff7f95418:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9541c:	54004e00	b.eq	0xfffff7f95ddc  // b.none
   0x0000fffff7f95420:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f95424:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f95428:	aa1303e1	mov	x1, x19
   0x0000fffff7f9542c:	aa1503e2	mov	x2, x21
   0x0000fffff7f95430:	d28008c3	mov	x3, #0x46                  	// #70
   0x0000fffff7f95434:	aa1403e4	mov	x4, x20
   0x0000fffff7f95438:	aa1603e5	mov	x5, x22
   0x0000fffff7f9543c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f95440:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f95444:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f95448:	d63f0200	blr	x16
   0x0000fffff7f9544c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f95450:	54004ca0	b.eq	0xfffff7f95de4  // b.none
   0x0000fffff7f95454:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f95458:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9545c:	aa1303e1	mov	x1, x19
   0x0000fffff7f95460:	aa1503e2	mov	x2, x21
   0x0000fffff7f95464:	d28008e3	mov	x3, #0x47                  	// #71
   0x0000fffff7f95468:	aa1403e4	mov	x4, x20
   0x0000fffff7f9546c:	aa1603e5	mov	x5, x22
   0x0000fffff7f95470:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f95474:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f95478:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9547c:	d63f0200	blr	x16
   0x0000fffff7f95480:	f100001f	cmp	x0, #0x0
   0x0000fffff7f95484:	54004b40	b.eq	0xfffff7f95dec  // b.none
   0x0000fffff7f95488:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9548c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f95490:	aa1303e1	mov	x1, x19
   0x0000fffff7f95494:	aa1503e2	mov	x2, x21
   0x0000fffff7f95498:	d2800903	mov	x3, #0x48                  	// #72
   0x0000fffff7f9549c:	aa1403e4	mov	x4, x20
   0x0000fffff7f954a0:	aa1603e5	mov	x5, x22
   0x0000fffff7f954a4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f954a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f954ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f954b0:	d63f0200	blr	x16
   0x0000fffff7f954b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f954b8:	540049e0	b.eq	0xfffff7f95df4  // b.none
   0x0000fffff7f954bc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f954c0:	37d80269	tbnz	w9, #27, 0xfffff7f9550c
   0x0000fffff7f954c4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f954c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f954cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f954d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f954d4:	540001c1	b.ne	0xfffff7f9550c  // b.any
   0x0000fffff7f954d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f954dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f954e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f954e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f954e8:	54000121	b.ne	0xfffff7f9550c  // b.any
   0x0000fffff7f954ec:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f954f0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f954f4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f954f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f954fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f95500:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f95504:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f95508:	1400000e	b	0xfffff7f95540
   0x0000fffff7f9550c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f95510:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f95514:	aa1303e1	mov	x1, x19
   0x0000fffff7f95518:	aa1503e2	mov	x2, x21
   0x0000fffff7f9551c:	d2800923	mov	x3, #0x49                  	// #73
   0x0000fffff7f95520:	aa1403e4	mov	x4, x20
   0x0000fffff7f95524:	aa1603e5	mov	x5, x22
   0x0000fffff7f95528:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9552c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f95530:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f95534:	d63f0200	blr	x16
   0x0000fffff7f95538:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9553c:	54004600	b.eq	0xfffff7f95dfc  // b.none
   0x0000fffff7f95540:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f95544:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f95548:	aa1303e1	mov	x1, x19
   0x0000fffff7f9554c:	aa1503e2	mov	x2, x21
   0x0000fffff7f95550:	d2800943	mov	x3, #0x4a                  	// #74
   0x0000fffff7f95554:	aa1403e4	mov	x4, x20
   0x0000fffff7f95558:	aa1603e5	mov	x5, x22
   0x0000fffff7f9555c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f95560:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f95564:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f95568:	d63f0200	blr	x16
   0x0000fffff7f9556c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f95570:	540044a0	b.eq	0xfffff7f95e04  // b.none
   0x0000fffff7f95574:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f95578:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9557c:	aa1303e1	mov	x1, x19
   0x0000fffff7f95580:	aa1503e2	mov	x2, x21
   0x0000fffff7f95584:	d2800963	mov	x3, #0x4b                  	// #75
   0x0000fffff7f95588:	aa1403e4	mov	x4, x20
   0x0000fffff7f9558c:	aa1603e5	mov	x5, x22
   0x0000fffff7f95590:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f95594:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f95598:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9559c:	d63f0200	blr	x16
   0x0000fffff7f955a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f955a4:	54004340	b.eq	0xfffff7f95e0c  // b.none
   0x0000fffff7f955a8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f955ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f955b0:	aa1303e1	mov	x1, x19
   0x0000fffff7f955b4:	aa1503e2	mov	x2, x21
   0x0000fffff7f955b8:	d2800983	mov	x3, #0x4c                  	// #76
   0x0000fffff7f955bc:	aa1403e4	mov	x4, x20
   0x0000fffff7f955c0:	aa1603e5	mov	x5, x22
   0x0000fffff7f955c4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f955c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f955cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f955d0:	d63f0200	blr	x16
   0x0000fffff7f955d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f955d8:	540041e0	b.eq	0xfffff7f95e14  // b.none
   0x0000fffff7f955dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f955e0:	37d80269	tbnz	w9, #27, 0xfffff7f9562c
   0x0000fffff7f955e4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f955e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f955ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f955f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f955f4:	540001c1	b.ne	0xfffff7f9562c  // b.any
   0x0000fffff7f955f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f955fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f95600:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f95604:	eb0a013f	cmp	x9, x10
   0x0000fffff7f95608:	54000121	b.ne	0xfffff7f9562c  // b.any
   0x0000fffff7f9560c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f95610:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f95614:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f95618:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9561c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f95620:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f95624:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f95628:	1400000e	b	0xfffff7f95660
   0x0000fffff7f9562c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f95630:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f95634:	aa1303e1	mov	x1, x19
   0x0000fffff7f95638:	aa1503e2	mov	x2, x21
   0x0000fffff7f9563c:	d28009a3	mov	x3, #0x4d                  	// #77
   0x0000fffff7f95640:	aa1403e4	mov	x4, x20
   0x0000fffff7f95644:	aa1603e5	mov	x5, x22
   0x0000fffff7f95648:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9564c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f95650:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f95654:	d63f0200	blr	x16
   0x0000fffff7f95658:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9565c:	54003e00	b.eq	0xfffff7f95e1c  // b.none
   0x0000fffff7f95660:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f95664:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f95668:	aa1303e1	mov	x1, x19
   0x0000fffff7f9566c:	aa1503e2	mov	x2, x21
   0x0000fffff7f95670:	d28009c3	mov	x3, #0x4e                  	// #78
   0x0000fffff7f95674:	aa1403e4	mov	x4, x20
   0x0000fffff7f95678:	aa1603e5	mov	x5, x22
   0x0000fffff7f9567c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f95680:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f95684:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f95688:	d63f0200	blr	x16
   0x0000fffff7f9568c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f95690:	54003ca0	b.eq	0xfffff7f95e24  // b.none
   0x0000fffff7f95694:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f95698:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9569c:	aa1303e1	mov	x1, x19
   0x0000fffff7f956a0:	aa1503e2	mov	x2, x21
   0x0000fffff7f956a4:	d28009e3	mov	x3, #0x4f                  	// #79
   0x0000fffff7f956a8:	aa1403e4	mov	x4, x20
   0x0000fffff7f956ac:	aa1603e5	mov	x5, x22
   0x0000fffff7f956b0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f956b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f956b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f956bc:	d63f0200	blr	x16
   0x0000fffff7f956c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f956c4:	54003b40	b.eq	0xfffff7f95e2c  // b.none
   0x0000fffff7f956c8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f956cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f956d0:	aa1303e1	mov	x1, x19
   0x0000fffff7f956d4:	aa1503e2	mov	x2, x21
   0x0000fffff7f956d8:	d2800a03	mov	x3, #0x50                  	// #80
   0x0000fffff7f956dc:	aa1403e4	mov	x4, x20
   0x0000fffff7f956e0:	aa1603e5	mov	x5, x22
   0x0000fffff7f956e4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f956e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f956ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f956f0:	d63f0200	blr	x16
   0x0000fffff7f956f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f956f8:	540039e0	b.eq	0xfffff7f95e34  // b.none
   0x0000fffff7f956fc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f95700:	37d80269	tbnz	w9, #27, 0xfffff7f9574c
   0x0000fffff7f95704:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f95708:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9570c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f95710:	eb0a013f	cmp	x9, x10
   0x0000fffff7f95714:	540001c1	b.ne	0xfffff7f9574c  // b.any
   0x0000fffff7f95718:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9571c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f95720:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f95724:	eb0a013f	cmp	x9, x10
   0x0000fffff7f95728:	54000121	b.ne	0xfffff7f9574c  // b.any
   0x0000fffff7f9572c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f95730:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f95734:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f95738:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9573c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f95740:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f95744:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f95748:	1400000e	b	0xfffff7f95780
   0x0000fffff7f9574c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f95750:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f95754:	aa1303e1	mov	x1, x19
   0x0000fffff7f95758:	aa1503e2	mov	x2, x21
   0x0000fffff7f9575c:	d2800a23	mov	x3, #0x51                  	// #81
   0x0000fffff7f95760:	aa1403e4	mov	x4, x20
   0x0000fffff7f95764:	aa1603e5	mov	x5, x22
   0x0000fffff7f95768:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9576c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f95770:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f95774:	d63f0200	blr	x16
   0x0000fffff7f95778:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9577c:	54003600	b.eq	0xfffff7f95e3c  // b.none
   0x0000fffff7f95780:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f95784:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f95788:	aa1303e1	mov	x1, x19
   0x0000fffff7f9578c:	aa1503e2	mov	x2, x21
   0x0000fffff7f95790:	d2800a43	mov	x3, #0x52                  	// #82
   0x0000fffff7f95794:	aa1403e4	mov	x4, x20
   0x0000fffff7f95798:	aa1603e5	mov	x5, x22
   0x0000fffff7f9579c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f957a0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f957a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f957a8:	d63f0200	blr	x16
   0x0000fffff7f957ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7f957b0:	540034a0	b.eq	0xfffff7f95e44  // b.none
   0x0000fffff7f957b4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f957b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f957bc:	aa1303e1	mov	x1, x19
   0x0000fffff7f957c0:	aa1503e2	mov	x2, x21
   0x0000fffff7f957c4:	d2800a63	mov	x3, #0x53                  	// #83
   0x0000fffff7f957c8:	aa1403e4	mov	x4, x20
   0x0000fffff7f957cc:	aa1603e5	mov	x5, x22
   0x0000fffff7f957d0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f957d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f957d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f957dc:	d63f0200	blr	x16
   0x0000fffff7f957e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f957e4:	54003340	b.eq	0xfffff7f95e4c  // b.none
   0x0000fffff7f957e8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f957ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f957f0:	aa1303e1	mov	x1, x19
   0x0000fffff7f957f4:	aa1503e2	mov	x2, x21
   0x0000fffff7f957f8:	d2800a83	mov	x3, #0x54                  	// #84
   0x0000fffff7f957fc:	aa1403e4	mov	x4, x20
   0x0000fffff7f95800:	aa1603e5	mov	x5, x22
   0x0000fffff7f95804:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f95808:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9580c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f95810:	d63f0200	blr	x16
   0x0000fffff7f95814:	f100001f	cmp	x0, #0x0
   0x0000fffff7f95818:	540031e0	b.eq	0xfffff7f95e54  // b.none
   0x0000fffff7f9581c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f95820:	37d80269	tbnz	w9, #27, 0xfffff7f9586c
   0x0000fffff7f95824:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f95828:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9582c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f95830:	eb0a013f	cmp	x9, x10
   0x0000fffff7f95834:	540001c1	b.ne	0xfffff7f9586c  // b.any
   0x0000fffff7f95838:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9583c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f95840:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f95844:	eb0a013f	cmp	x9, x10
   0x0000fffff7f95848:	54000121	b.ne	0xfffff7f9586c  // b.any
   0x0000fffff7f9584c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f95850:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f95854:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f95858:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9585c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f95860:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f95864:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f95868:	1400000e	b	0xfffff7f958a0
   0x0000fffff7f9586c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f95870:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f95874:	aa1303e1	mov	x1, x19
   0x0000fffff7f95878:	aa1503e2	mov	x2, x21
   0x0000fffff7f9587c:	d2800aa3	mov	x3, #0x55                  	// #85
   0x0000fffff7f95880:	aa1403e4	mov	x4, x20
   0x0000fffff7f95884:	aa1603e5	mov	x5, x22
   0x0000fffff7f95888:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9588c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f95890:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f95894:	d63f0200	blr	x16
   0x0000fffff7f95898:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9589c:	54002e00	b.eq	0xfffff7f95e5c  // b.none
   0x0000fffff7f958a0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f958a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f958a8:	aa1303e1	mov	x1, x19
   0x0000fffff7f958ac:	aa1503e2	mov	x2, x21
   0x0000fffff7f958b0:	d2800ac3	mov	x3, #0x56                  	// #86
   0x0000fffff7f958b4:	aa1403e4	mov	x4, x20
   0x0000fffff7f958b8:	aa1603e5	mov	x5, x22
   0x0000fffff7f958bc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f958c0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f958c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f958c8:	d63f0200	blr	x16
   0x0000fffff7f958cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f958d0:	54002ca0	b.eq	0xfffff7f95e64  // b.none
   0x0000fffff7f958d4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f958d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f958dc:	aa1303e1	mov	x1, x19
   0x0000fffff7f958e0:	aa1503e2	mov	x2, x21
   0x0000fffff7f958e4:	d2800ae3	mov	x3, #0x57                  	// #87
   0x0000fffff7f958e8:	aa1403e4	mov	x4, x20
   0x0000fffff7f958ec:	aa1603e5	mov	x5, x22
   0x0000fffff7f958f0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f958f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f958f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f958fc:	d63f0200	blr	x16
   0x0000fffff7f95900:	f100001f	cmp	x0, #0x0
   0x0000fffff7f95904:	54002b40	b.eq	0xfffff7f95e6c  // b.none
   0x0000fffff7f95908:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9590c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f95910:	aa1303e1	mov	x1, x19
   0x0000fffff7f95914:	aa1503e2	mov	x2, x21
   0x0000fffff7f95918:	d2800b03	mov	x3, #0x58                  	// #88
   0x0000fffff7f9591c:	aa1403e4	mov	x4, x20
   0x0000fffff7f95920:	aa1603e5	mov	x5, x22
   0x0000fffff7f95924:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f95928:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9592c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f95930:	d63f0200	blr	x16
   0x0000fffff7f95934:	f100001f	cmp	x0, #0x0
   0x0000fffff7f95938:	540029e0	b.eq	0xfffff7f95e74  // b.none
   0x0000fffff7f9593c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f95940:	37d80269	tbnz	w9, #27, 0xfffff7f9598c
   0x0000fffff7f95944:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f95948:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9594c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f95950:	eb0a013f	cmp	x9, x10
   0x0000fffff7f95954:	540001c1	b.ne	0xfffff7f9598c  // b.any
   0x0000fffff7f95958:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9595c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f95960:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f95964:	eb0a013f	cmp	x9, x10
   0x0000fffff7f95968:	54000121	b.ne	0xfffff7f9598c  // b.any
   0x0000fffff7f9596c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f95970:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f95974:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f95978:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9597c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f95980:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f95984:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f95988:	1400000e	b	0xfffff7f959c0
   0x0000fffff7f9598c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f95990:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f95994:	aa1303e1	mov	x1, x19
   0x0000fffff7f95998:	aa1503e2	mov	x2, x21
   0x0000fffff7f9599c:	d2800b23	mov	x3, #0x59                  	// #89
   0x0000fffff7f959a0:	aa1403e4	mov	x4, x20
   0x0000fffff7f959a4:	aa1603e5	mov	x5, x22
   0x0000fffff7f959a8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f959ac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f959b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f959b4:	d63f0200	blr	x16
   0x0000fffff7f959b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f959bc:	54002600	b.eq	0xfffff7f95e7c  // b.none
   0x0000fffff7f959c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f959c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f959c8:	aa1303e1	mov	x1, x19
   0x0000fffff7f959cc:	aa1503e2	mov	x2, x21
   0x0000fffff7f959d0:	d2800b43	mov	x3, #0x5a                  	// #90
   0x0000fffff7f959d4:	aa1403e4	mov	x4, x20
   0x0000fffff7f959d8:	aa1603e5	mov	x5, x22
   0x0000fffff7f959dc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f959e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f959e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f959e8:	d63f0200	blr	x16
   0x0000fffff7f959ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f959f0:	540024a0	b.eq	0xfffff7f95e84  // b.none
   0x0000fffff7f959f4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f959f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f959fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f95a00:	aa1503e2	mov	x2, x21
   0x0000fffff7f95a04:	d2800b63	mov	x3, #0x5b                  	// #91
   0x0000fffff7f95a08:	aa1403e4	mov	x4, x20
   0x0000fffff7f95a0c:	aa1603e5	mov	x5, x22
   0x0000fffff7f95a10:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f95a14:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f95a18:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f95a1c:	d63f0200	blr	x16
   0x0000fffff7f95a20:	f100001f	cmp	x0, #0x0
   0x0000fffff7f95a24:	54002340	b.eq	0xfffff7f95e8c  // b.none
   0x0000fffff7f95a28:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f95a2c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f95a30:	aa1303e1	mov	x1, x19
   0x0000fffff7f95a34:	aa1503e2	mov	x2, x21
   0x0000fffff7f95a38:	d2800b83	mov	x3, #0x5c                  	// #92
   0x0000fffff7f95a3c:	aa1403e4	mov	x4, x20
   0x0000fffff7f95a40:	aa1603e5	mov	x5, x22
   0x0000fffff7f95a44:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f95a48:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f95a4c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f95a50:	d63f0200	blr	x16
   0x0000fffff7f95a54:	f100001f	cmp	x0, #0x0
   0x0000fffff7f95a58:	540021e0	b.eq	0xfffff7f95e94  // b.none
   0x0000fffff7f95a5c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f95a60:	37d80269	tbnz	w9, #27, 0xfffff7f95aac
   0x0000fffff7f95a64:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f95a68:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f95a6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f95a70:	eb0a013f	cmp	x9, x10
   0x0000fffff7f95a74:	540001c1	b.ne	0xfffff7f95aac  // b.any
   0x0000fffff7f95a78:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f95a7c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f95a80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f95a84:	eb0a013f	cmp	x9, x10
   0x0000fffff7f95a88:	54000121	b.ne	0xfffff7f95aac  // b.any
   0x0000fffff7f95a8c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f95a90:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f95a94:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f95a98:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f95a9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f95aa0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f95aa4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f95aa8:	1400000e	b	0xfffff7f95ae0
   0x0000fffff7f95aac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f95ab0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f95ab4:	aa1303e1	mov	x1, x19
   0x0000fffff7f95ab8:	aa1503e2	mov	x2, x21
   0x0000fffff7f95abc:	d2800ba3	mov	x3, #0x5d                  	// #93
   0x0000fffff7f95ac0:	aa1403e4	mov	x4, x20
   0x0000fffff7f95ac4:	aa1603e5	mov	x5, x22
   0x0000fffff7f95ac8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f95acc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f95ad0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f95ad4:	d63f0200	blr	x16
   0x0000fffff7f95ad8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f95adc:	54001e00	b.eq	0xfffff7f95e9c  // b.none
   0x0000fffff7f95ae0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f95ae4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f95ae8:	aa1303e1	mov	x1, x19
   0x0000fffff7f95aec:	aa1503e2	mov	x2, x21
   0x0000fffff7f95af0:	d2800bc3	mov	x3, #0x5e                  	// #94
   0x0000fffff7f95af4:	aa1403e4	mov	x4, x20
   0x0000fffff7f95af8:	aa1603e5	mov	x5, x22
   0x0000fffff7f95afc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f95b00:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f95b04:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f95b08:	d63f0200	blr	x16
   0x0000fffff7f95b0c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f95b10:	54001ca0	b.eq	0xfffff7f95ea4  // b.none
   0x0000fffff7f95b14:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f95b18:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f95b1c:	aa1303e1	mov	x1, x19
   0x0000fffff7f95b20:	aa1503e2	mov	x2, x21
   0x0000fffff7f95b24:	d2800be3	mov	x3, #0x5f                  	// #95
   0x0000fffff7f95b28:	aa1403e4	mov	x4, x20
   0x0000fffff7f95b2c:	aa1603e5	mov	x5, x22
   0x0000fffff7f95b30:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f95b34:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f95b38:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f95b3c:	d63f0200	blr	x16
   0x0000fffff7f95b40:	f100001f	cmp	x0, #0x0
   0x0000fffff7f95b44:	54001b40	b.eq	0xfffff7f95eac  // b.none
   0x0000fffff7f95b48:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f95b4c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f95b50:	aa1303e1	mov	x1, x19
   0x0000fffff7f95b54:	aa1503e2	mov	x2, x21
   0x0000fffff7f95b58:	d2800c03	mov	x3, #0x60                  	// #96
   0x0000fffff7f95b5c:	aa1403e4	mov	x4, x20
   0x0000fffff7f95b60:	aa1603e5	mov	x5, x22
   0x0000fffff7f95b64:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7f95b68:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f95b6c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f95b70:	d63f0200	blr	x16
   0x0000fffff7f95b74:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f95b78:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f95b7c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f95b80:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f95b84:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f95b88:	d65f03c0	ret
   0x0000fffff7f95b8c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f95b90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f95b94:	b900028a	str	w10, [x20]
   0x0000fffff7f95b98:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f95b9c:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f95ba0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f95ba4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f95ba8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f95bac:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f95bb0:	d65f03c0	ret
   0x0000fffff7f95bb4:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f95bb8:	17fffff5	b	0xfffff7f95b8c
   0x0000fffff7f95bbc:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f95bc0:	17fffff3	b	0xfffff7f95b8c
   0x0000fffff7f95bc4:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f95bc8:	17fffff1	b	0xfffff7f95b8c
   0x0000fffff7f95bcc:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f95bd0:	17ffffef	b	0xfffff7f95b8c
   0x0000fffff7f95bd4:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f95bd8:	17ffffed	b	0xfffff7f95b8c
   0x0000fffff7f95bdc:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f95be0:	17ffffeb	b	0xfffff7f95b8c
   0x0000fffff7f95be4:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f95be8:	17ffffe9	b	0xfffff7f95b8c
   0x0000fffff7f95bec:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f95bf0:	17ffffe7	b	0xfffff7f95b8c
   0x0000fffff7f95bf4:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f95bf8:	17ffffe5	b	0xfffff7f95b8c
   0x0000fffff7f95bfc:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f95c00:	17ffffe3	b	0xfffff7f95b8c
   0x0000fffff7f95c04:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7f95c08:	17ffffe1	b	0xfffff7f95b8c
   0x0000fffff7f95c0c:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7f95c10:	17ffffdf	b	0xfffff7f95b8c
   0x0000fffff7f95c14:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7f95c18:	17ffffdd	b	0xfffff7f95b8c
   0x0000fffff7f95c1c:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7f95c20:	17ffffdb	b	0xfffff7f95b8c
   0x0000fffff7f95c24:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7f95c28:	17ffffd9	b	0xfffff7f95b8c
   0x0000fffff7f95c2c:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7f95c30:	17ffffd7	b	0xfffff7f95b8c
   0x0000fffff7f95c34:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7f95c38:	17ffffd5	b	0xfffff7f95b8c
   0x0000fffff7f95c3c:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7f95c40:	17ffffd3	b	0xfffff7f95b8c
   0x0000fffff7f95c44:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7f95c48:	17ffffd1	b	0xfffff7f95b8c
   0x0000fffff7f95c4c:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7f95c50:	17ffffcf	b	0xfffff7f95b8c
   0x0000fffff7f95c54:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7f95c58:	17ffffcd	b	0xfffff7f95b8c
   0x0000fffff7f95c5c:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7f95c60:	17ffffcb	b	0xfffff7f95b8c
   0x0000fffff7f95c64:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7f95c68:	17ffffc9	b	0xfffff7f95b8c
   0x0000fffff7f95c6c:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7f95c70:	17ffffc7	b	0xfffff7f95b8c
   0x0000fffff7f95c74:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7f95c78:	17ffffc5	b	0xfffff7f95b8c
   0x0000fffff7f95c7c:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7f95c80:	17ffffc3	b	0xfffff7f95b8c
   0x0000fffff7f95c84:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7f95c88:	17ffffc1	b	0xfffff7f95b8c
   0x0000fffff7f95c8c:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7f95c90:	17ffffbf	b	0xfffff7f95b8c
   0x0000fffff7f95c94:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7f95c98:	17ffffbd	b	0xfffff7f95b8c
   0x0000fffff7f95c9c:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7f95ca0:	17ffffbb	b	0xfffff7f95b8c
   0x0000fffff7f95ca4:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7f95ca8:	17ffffb9	b	0xfffff7f95b8c
   0x0000fffff7f95cac:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7f95cb0:	17ffffb7	b	0xfffff7f95b8c
   0x0000fffff7f95cb4:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7f95cb8:	17ffffb5	b	0xfffff7f95b8c
   0x0000fffff7f95cbc:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7f95cc0:	17ffffb3	b	0xfffff7f95b8c
   0x0000fffff7f95cc4:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7f95cc8:	17ffffb1	b	0xfffff7f95b8c
   0x0000fffff7f95ccc:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7f95cd0:	17ffffaf	b	0xfffff7f95b8c
   0x0000fffff7f95cd4:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7f95cd8:	17ffffad	b	0xfffff7f95b8c
   0x0000fffff7f95cdc:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7f95ce0:	17ffffab	b	0xfffff7f95b8c
   0x0000fffff7f95ce4:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7f95ce8:	17ffffa9	b	0xfffff7f95b8c
   0x0000fffff7f95cec:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7f95cf0:	17ffffa7	b	0xfffff7f95b8c
   0x0000fffff7f95cf4:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7f95cf8:	17ffffa5	b	0xfffff7f95b8c
   0x0000fffff7f95cfc:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7f95d00:	17ffffa3	b	0xfffff7f95b8c
   0x0000fffff7f95d04:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7f95d08:	17ffffa1	b	0xfffff7f95b8c
   0x0000fffff7f95d0c:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7f95d10:	17ffff9f	b	0xfffff7f95b8c
   0x0000fffff7f95d14:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7f95d18:	17ffff9d	b	0xfffff7f95b8c
   0x0000fffff7f95d1c:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7f95d20:	17ffff9b	b	0xfffff7f95b8c
   0x0000fffff7f95d24:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7f95d28:	17ffff99	b	0xfffff7f95b8c
   0x0000fffff7f95d2c:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7f95d30:	17ffff97	b	0xfffff7f95b8c
   0x0000fffff7f95d34:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7f95d38:	17ffff95	b	0xfffff7f95b8c
   0x0000fffff7f95d3c:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7f95d40:	17ffff93	b	0xfffff7f95b8c
   0x0000fffff7f95d44:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7f95d48:	17ffff91	b	0xfffff7f95b8c
   0x0000fffff7f95d4c:	d2800669	mov	x9, #0x33                  	// #51
   0x0000fffff7f95d50:	17ffff8f	b	0xfffff7f95b8c
   0x0000fffff7f95d54:	d2800689	mov	x9, #0x34                  	// #52
   0x0000fffff7f95d58:	17ffff8d	b	0xfffff7f95b8c
   0x0000fffff7f95d5c:	d28006a9	mov	x9, #0x35                  	// #53
   0x0000fffff7f95d60:	17ffff8b	b	0xfffff7f95b8c
   0x0000fffff7f95d64:	d28006c9	mov	x9, #0x36                  	// #54
   0x0000fffff7f95d68:	17ffff89	b	0xfffff7f95b8c
   0x0000fffff7f95d6c:	d28006e9	mov	x9, #0x37                  	// #55
   0x0000fffff7f95d70:	17ffff87	b	0xfffff7f95b8c
   0x0000fffff7f95d74:	d2800709	mov	x9, #0x38                  	// #56
   0x0000fffff7f95d78:	17ffff85	b	0xfffff7f95b8c
   0x0000fffff7f95d7c:	d2800729	mov	x9, #0x39                  	// #57
   0x0000fffff7f95d80:	17ffff83	b	0xfffff7f95b8c
   0x0000fffff7f95d84:	d2800749	mov	x9, #0x3a                  	// #58
   0x0000fffff7f95d88:	17ffff81	b	0xfffff7f95b8c
   0x0000fffff7f95d8c:	d2800769	mov	x9, #0x3b                  	// #59
   0x0000fffff7f95d90:	17ffff7f	b	0xfffff7f95b8c
   0x0000fffff7f95d94:	d2800789	mov	x9, #0x3c                  	// #60
   0x0000fffff7f95d98:	17ffff7d	b	0xfffff7f95b8c
   0x0000fffff7f95d9c:	d28007a9	mov	x9, #0x3d                  	// #61
   0x0000fffff7f95da0:	17ffff7b	b	0xfffff7f95b8c
   0x0000fffff7f95da4:	d28007c9	mov	x9, #0x3e                  	// #62
   0x0000fffff7f95da8:	17ffff79	b	0xfffff7f95b8c
   0x0000fffff7f95dac:	d28007e9	mov	x9, #0x3f                  	// #63
   0x0000fffff7f95db0:	17ffff77	b	0xfffff7f95b8c
   0x0000fffff7f95db4:	d2800809	mov	x9, #0x40                  	// #64
   0x0000fffff7f95db8:	17ffff75	b	0xfffff7f95b8c
   0x0000fffff7f95dbc:	d2800829	mov	x9, #0x41                  	// #65
   0x0000fffff7f95dc0:	17ffff73	b	0xfffff7f95b8c
   0x0000fffff7f95dc4:	d2800849	mov	x9, #0x42                  	// #66
   0x0000fffff7f95dc8:	17ffff71	b	0xfffff7f95b8c
   0x0000fffff7f95dcc:	d2800869	mov	x9, #0x43                  	// #67
   0x0000fffff7f95dd0:	17ffff6f	b	0xfffff7f95b8c
   0x0000fffff7f95dd4:	d2800889	mov	x9, #0x44                  	// #68
   0x0000fffff7f95dd8:	17ffff6d	b	0xfffff7f95b8c
   0x0000fffff7f95ddc:	d28008a9	mov	x9, #0x45                  	// #69
   0x0000fffff7f95de0:	17ffff6b	b	0xfffff7f95b8c
   0x0000fffff7f95de4:	d28008c9	mov	x9, #0x46                  	// #70
   0x0000fffff7f95de8:	17ffff69	b	0xfffff7f95b8c
   0x0000fffff7f95dec:	d28008e9	mov	x9, #0x47                  	// #71
   0x0000fffff7f95df0:	17ffff67	b	0xfffff7f95b8c
   0x0000fffff7f95df4:	d2800909	mov	x9, #0x48                  	// #72
   0x0000fffff7f95df8:	17ffff65	b	0xfffff7f95b8c
   0x0000fffff7f95dfc:	d2800929	mov	x9, #0x49                  	// #73
   0x0000fffff7f95e00:	17ffff63	b	0xfffff7f95b8c
   0x0000fffff7f95e04:	d2800949	mov	x9, #0x4a                  	// #74
   0x0000fffff7f95e08:	17ffff61	b	0xfffff7f95b8c
   0x0000fffff7f95e0c:	d2800969	mov	x9, #0x4b                  	// #75
   0x0000fffff7f95e10:	17ffff5f	b	0xfffff7f95b8c
   0x0000fffff7f95e14:	d2800989	mov	x9, #0x4c                  	// #76
   0x0000fffff7f95e18:	17ffff5d	b	0xfffff7f95b8c
   0x0000fffff7f95e1c:	d28009a9	mov	x9, #0x4d                  	// #77
   0x0000fffff7f95e20:	17ffff5b	b	0xfffff7f95b8c
   0x0000fffff7f95e24:	d28009c9	mov	x9, #0x4e                  	// #78
   0x0000fffff7f95e28:	17ffff59	b	0xfffff7f95b8c
   0x0000fffff7f95e2c:	d28009e9	mov	x9, #0x4f                  	// #79
   0x0000fffff7f95e30:	17ffff57	b	0xfffff7f95b8c
   0x0000fffff7f95e34:	d2800a09	mov	x9, #0x50                  	// #80
   0x0000fffff7f95e38:	17ffff55	b	0xfffff7f95b8c
   0x0000fffff7f95e3c:	d2800a29	mov	x9, #0x51                  	// #81
   0x0000fffff7f95e40:	17ffff53	b	0xfffff7f95b8c
   0x0000fffff7f95e44:	d2800a49	mov	x9, #0x52                  	// #82
   0x0000fffff7f95e48:	17ffff51	b	0xfffff7f95b8c
   0x0000fffff7f95e4c:	d2800a69	mov	x9, #0x53                  	// #83
   0x0000fffff7f95e50:	17ffff4f	b	0xfffff7f95b8c
   0x0000fffff7f95e54:	d2800a89	mov	x9, #0x54                  	// #84
   0x0000fffff7f95e58:	17ffff4d	b	0xfffff7f95b8c
   0x0000fffff7f95e5c:	d2800aa9	mov	x9, #0x55                  	// #85
   0x0000fffff7f95e60:	17ffff4b	b	0xfffff7f95b8c
   0x0000fffff7f95e64:	d2800ac9	mov	x9, #0x56                  	// #86
   0x0000fffff7f95e68:	17ffff49	b	0xfffff7f95b8c
   0x0000fffff7f95e6c:	d2800ae9	mov	x9, #0x57                  	// #87
   0x0000fffff7f95e70:	17ffff47	b	0xfffff7f95b8c
   0x0000fffff7f95e74:	d2800b09	mov	x9, #0x58                  	// #88
   0x0000fffff7f95e78:	17ffff45	b	0xfffff7f95b8c
   0x0000fffff7f95e7c:	d2800b29	mov	x9, #0x59                  	// #89
   0x0000fffff7f95e80:	17ffff43	b	0xfffff7f95b8c
   0x0000fffff7f95e84:	d2800b49	mov	x9, #0x5a                  	// #90
   0x0000fffff7f95e88:	17ffff41	b	0xfffff7f95b8c
   0x0000fffff7f95e8c:	d2800b69	mov	x9, #0x5b                  	// #91
   0x0000fffff7f95e90:	17ffff3f	b	0xfffff7f95b8c
   0x0000fffff7f95e94:	d2800b89	mov	x9, #0x5c                  	// #92
   0x0000fffff7f95e98:	17ffff3d	b	0xfffff7f95b8c
   0x0000fffff7f95e9c:	d2800ba9	mov	x9, #0x5d                  	// #93
   0x0000fffff7f95ea0:	17ffff3b	b	0xfffff7f95b8c
   0x0000fffff7f95ea4:	d2800bc9	mov	x9, #0x5e                  	// #94
   0x0000fffff7f95ea8:	17ffff39	b	0xfffff7f95b8c
   0x0000fffff7f95eac:	d2800be9	mov	x9, #0x5f                  	// #95
   0x0000fffff7f95eb0:	17ffff37	b	0xfffff7f95b8c
   0x0000fffff7f95eb4:	00000000	udf	#0
   0x0000fffff7f95eb8:	00000000	udf	#0
   0x0000fffff7f95ebc:	00000000	udf	#0
   0x0000fffff7f95ec0:	00000000	udf	#0
   0x0000fffff7f95ec4:	00000000	udf	#0
   0x0000fffff7f95ec8:	00000000	udf	#0
   0x0000fffff7f95ecc:	00000000	udf	#0
   0x0000fffff7f95ed0:	00000000	udf	#0
   0x0000fffff7f95ed4:	00000000	udf	#0
   0x0000fffff7f95ed8:	00000000	udf	#0
   0x0000fffff7f95edc:	00000000	udf	#0
   0x0000fffff7f95ee0:	00000000	udf	#0
   0x0000fffff7f95ee4:	00000000	udf	#0
   0x0000fffff7f95ee8:	00000000	udf	#0
   0x0000fffff7f95eec:	00000000	udf	#0
   0x0000fffff7f95ef0:	00000000	udf	#0
   0x0000fffff7f95ef4:	00000000	udf	#0
   0x0000fffff7f95ef8:	00000000	udf	#0
   0x0000fffff7f95efc:	00000000	udf	#0
   0x0000fffff7f95f00:	00000000	udf	#0
   0x0000fffff7f95f04:	00000000	udf	#0
   0x0000fffff7f95f08:	00000000	udf	#0
   0x0000fffff7f95f0c:	00000000	udf	#0
   0x0000fffff7f95f10:	00000000	udf	#0
   0x0000fffff7f95f14:	00000000	udf	#0
   0x0000fffff7f95f18:	00000000	udf	#0
   0x0000fffff7f95f1c:	00000000	udf	#0
   0x0000fffff7f95f20:	00000000	udf	#0
   0x0000fffff7f95f24:	00000000	udf	#0
   0x0000fffff7f95f28:	00000000	udf	#0
   0x0000fffff7f95f2c:	00000000	udf	#0
   0x0000fffff7f95f30:	00000000	udf	#0
   0x0000fffff7f95f34:	00000000	udf	#0
   0x0000fffff7f95f38:	00000000	udf	#0
   0x0000fffff7f95f3c:	00000000	udf	#0
   0x0000fffff7f95f40:	00000000	udf	#0
   0x0000fffff7f95f44:	00000000	udf	#0
   0x0000fffff7f95f48:	00000000	udf	#0
   0x0000fffff7f95f4c:	00000000	udf	#0
   0x0000fffff7f95f50:	00000000	udf	#0
   0x0000fffff7f95f54:	00000000	udf	#0
   0x0000fffff7f95f58:	00000000	udf	#0
   0x0000fffff7f95f5c:	00000000	udf	#0
   0x0000fffff7f95f60:	00000000	udf	#0
   0x0000fffff7f95f64:	00000000	udf	#0
   0x0000fffff7f95f68:	00000000	udf	#0
   0x0000fffff7f95f6c:	00000000	udf	#0
   0x0000fffff7f95f70:	00000000	udf	#0
   0x0000fffff7f95f74:	00000000	udf	#0
   0x0000fffff7f95f78:	00000000	udf	#0
   0x0000fffff7f95f7c:	00000000	udf	#0
   0x0000fffff7f95f80:	00000000	udf	#0
   0x0000fffff7f95f84:	00000000	udf	#0
   0x0000fffff7f95f88:	00000000	udf	#0
   0x0000fffff7f95f8c:	00000000	udf	#0
   0x0000fffff7f95f90:	00000000	udf	#0
   0x0000fffff7f95f94:	00000000	udf	#0
   0x0000fffff7f95f98:	00000000	udf	#0
   0x0000fffff7f95f9c:	00000000	udf	#0
   0x0000fffff7f95fa0:	00000000	udf	#0
   0x0000fffff7f95fa4:	00000000	udf	#0
   0x0000fffff7f95fa8:	00000000	udf	#0
   0x0000fffff7f95fac:	00000000	udf	#0
   0x0000fffff7f95fb0:	00000000	udf	#0
   0x0000fffff7f95fb4:	00000000	udf	#0
   0x0000fffff7f95fb8:	00000000	udf	#0
   0x0000fffff7f95fbc:	00000000	udf	#0
   0x0000fffff7f95fc0:	00000000	udf	#0
   0x0000fffff7f95fc4:	00000000	udf	#0
   0x0000fffff7f95fc8:	00000000	udf	#0
   0x0000fffff7f95fcc:	00000000	udf	#0
   0x0000fffff7f95fd0:	00000000	udf	#0
   0x0000fffff7f95fd4:	00000000	udf	#0
   0x0000fffff7f95fd8:	00000000	udf	#0
   0x0000fffff7f95fdc:	00000000	udf	#0
   0x0000fffff7f95fe0:	00000000	udf	#0
   0x0000fffff7f95fe4:	00000000	udf	#0
   0x0000fffff7f95fe8:	00000000	udf	#0
   0x0000fffff7f95fec:	00000000	udf	#0
   0x0000fffff7f95ff0:	00000000	udf	#0
   0x0000fffff7f95ff4:	00000000	udf	#0
   0x0000fffff7f95ff8:	00000000	udf	#0
   0x0000fffff7f95ffc:	00000000	udf	#0
End of assembler dump.
