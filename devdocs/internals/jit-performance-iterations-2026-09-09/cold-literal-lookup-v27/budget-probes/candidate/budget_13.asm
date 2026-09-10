Dump of assembler code from 0xfffff7fa7000 to 0xfffff7fa9000:
   0x0000fffff7fa7000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fa7004:	910003fd	mov	x29, sp
   0x0000fffff7fa7008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fa700c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fa7010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fa7014:	aa0003f3	mov	x19, x0
   0x0000fffff7fa7018:	aa0103f4	mov	x20, x1
   0x0000fffff7fa701c:	aa0203f5	mov	x21, x2
   0x0000fffff7fa7020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fa7024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fa7028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fa702c:	f90003e9	str	x9, [sp]
   0x0000fffff7fa7030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fa7034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fa7038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fa703c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fa7040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7044:	d63f0200	blr	x16
   0x0000fffff7fa7048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fa704c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fa7050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fa7054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fa7058:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa705c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7060:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7064:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7068:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fa706c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7070:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7074:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fa7078:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa707c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7080:	d63f0200	blr	x16
   0x0000fffff7fa7084:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7088:	5400e3a0	b.eq	0xfffff7fa8cfc  // b.none
   0x0000fffff7fa708c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7090:	37d800e9	tbnz	w9, #27, 0xfffff7fa70ac
   0x0000fffff7fa7094:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fa7098:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa709c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa70a0:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa70a4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa70a8:	1400000e	b	0xfffff7fa70e0
   0x0000fffff7fa70ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa70b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa70b4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa70b8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa70bc:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fa70c0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa70c4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa70c8:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7fa70cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa70d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa70d4:	d63f0200	blr	x16
   0x0000fffff7fa70d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa70dc:	5400e140	b.eq	0xfffff7fa8d04  // b.none
   0x0000fffff7fa70e0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa70e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa70e8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa70ec:	aa1503e2	mov	x2, x21
   0x0000fffff7fa70f0:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fa70f4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa70f8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa70fc:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fa7100:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7104:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7108:	d63f0200	blr	x16
   0x0000fffff7fa710c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7110:	5400dfe0	b.eq	0xfffff7fa8d0c  // b.none
   0x0000fffff7fa7114:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa7118:	37d800e9	tbnz	w9, #27, 0xfffff7fa7134
   0x0000fffff7fa711c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fa7120:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7124:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7128:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa712c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa7130:	1400000e	b	0xfffff7fa7168
   0x0000fffff7fa7134:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa7138:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa713c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7140:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7144:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7fa7148:	aa1403e4	mov	x4, x20
   0x0000fffff7fa714c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7150:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7fa7154:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa7158:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa715c:	d63f0200	blr	x16
   0x0000fffff7fa7160:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7164:	5400dd80	b.eq	0xfffff7fa8d14  // b.none
   0x0000fffff7fa7168:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa716c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7170:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7174:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7178:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7fa717c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7180:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7184:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fa7188:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa718c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7190:	d63f0200	blr	x16
   0x0000fffff7fa7194:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7198:	5400dc20	b.eq	0xfffff7fa8d1c  // b.none
   0x0000fffff7fa719c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa71a0:	37d806a9	tbnz	w9, #27, 0xfffff7fa7274
   0x0000fffff7fa71a4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa71a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa71ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa71b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa71b4:	540001c1	b.ne	0xfffff7fa71ec  // b.any
   0x0000fffff7fa71b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa71bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa71c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa71c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa71c8:	54000121	b.ne	0xfffff7fa71ec  // b.any
   0x0000fffff7fa71cc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa71d0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa71d4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa71d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa71dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa71e0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa71e4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa71e8:	14000030	b	0xfffff7fa72a8
   0x0000fffff7fa71ec:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa71f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa71f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa71f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa71fc:	54000120	b.eq	0xfffff7fa7220  // b.none
   0x0000fffff7fa7200:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa7204:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7208:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa720c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7210:	54000321	b.ne	0xfffff7fa7274  // b.any
   0x0000fffff7fa7214:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa7218:	9e620120	scvtf	d0, x9
   0x0000fffff7fa721c:	14000002	b	0xfffff7fa7224
   0x0000fffff7fa7220:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa7224:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7228:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa722c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7230:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7234:	54000120	b.eq	0xfffff7fa7258  // b.none
   0x0000fffff7fa7238:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa723c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7240:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7244:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7248:	54000161	b.ne	0xfffff7fa7274  // b.any
   0x0000fffff7fa724c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa7250:	9e620121	scvtf	d1, x9
   0x0000fffff7fa7254:	14000002	b	0xfffff7fa725c
   0x0000fffff7fa7258:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa725c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa7260:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa7264:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7268:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa726c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa7270:	17ffffde	b	0xfffff7fa71e8
   0x0000fffff7fa7274:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa7278:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa727c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7280:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7284:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fa7288:	aa1403e4	mov	x4, x20
   0x0000fffff7fa728c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7290:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fa7294:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7298:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa729c:	d63f0200	blr	x16
   0x0000fffff7fa72a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa72a4:	5400d400	b.eq	0xfffff7fa8d24  // b.none
   0x0000fffff7fa72a8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa72ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa72b0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa72b4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa72b8:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fa72bc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa72c0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa72c4:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fa72c8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa72cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa72d0:	d63f0200	blr	x16
   0x0000fffff7fa72d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa72d8:	5400d2a0	b.eq	0xfffff7fa8d2c  // b.none
   0x0000fffff7fa72dc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa72e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa72e4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa72e8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa72ec:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fa72f0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa72f4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa72f8:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fa72fc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7300:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7304:	d63f0200	blr	x16
   0x0000fffff7fa7308:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa730c:	5400d140	b.eq	0xfffff7fa8d34  // b.none
   0x0000fffff7fa7310:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa7314:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa7318:	54000380	b.eq	0xfffff7fa7388  // b.none
   0x0000fffff7fa731c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa7320:	37d8034d	tbnz	w13, #27, 0xfffff7fa7388
   0x0000fffff7fa7324:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa7328:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa732c:	36d80211	tbz	w17, #27, 0xfffff7fa736c
   0x0000fffff7fa7330:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa7334:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa7338:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa733c:	54000261	b.ne	0xfffff7fa7388  // b.any
   0x0000fffff7fa7340:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa7344:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa7348:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa734c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa7350:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa7354:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa7358:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa735c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa7360:	54000149	b.ls	0xfffff7fa7388  // b.plast
   0x0000fffff7fa7364:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa7368:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa736c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa7370:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa7374:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa7378:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa737c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa7380:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa7384:	1400000e	b	0xfffff7fa73bc
   0x0000fffff7fa7388:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa738c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7390:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7394:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7398:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fa739c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa73a0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa73a4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fa73a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa73ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa73b0:	d63f0200	blr	x16
   0x0000fffff7fa73b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa73b8:	5400cc20	b.eq	0xfffff7fa8d3c  // b.none
   0x0000fffff7fa73bc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa73c0:	37d806a9	tbnz	w9, #27, 0xfffff7fa7494
   0x0000fffff7fa73c4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa73c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa73cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa73d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa73d4:	540001c1	b.ne	0xfffff7fa740c  // b.any
   0x0000fffff7fa73d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa73dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa73e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa73e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa73e8:	54000121	b.ne	0xfffff7fa740c  // b.any
   0x0000fffff7fa73ec:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa73f0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa73f4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa73f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa73fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7400:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa7404:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa7408:	14000030	b	0xfffff7fa74c8
   0x0000fffff7fa740c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa7410:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7414:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7418:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa741c:	54000120	b.eq	0xfffff7fa7440  // b.none
   0x0000fffff7fa7420:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa7424:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7428:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa742c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7430:	54000321	b.ne	0xfffff7fa7494  // b.any
   0x0000fffff7fa7434:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa7438:	9e620120	scvtf	d0, x9
   0x0000fffff7fa743c:	14000002	b	0xfffff7fa7444
   0x0000fffff7fa7440:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa7444:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7448:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa744c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7450:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7454:	54000120	b.eq	0xfffff7fa7478  // b.none
   0x0000fffff7fa7458:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa745c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7460:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7464:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7468:	54000161	b.ne	0xfffff7fa7494  // b.any
   0x0000fffff7fa746c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa7470:	9e620121	scvtf	d1, x9
   0x0000fffff7fa7474:	14000002	b	0xfffff7fa747c
   0x0000fffff7fa7478:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa747c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa7480:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa7484:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7488:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa748c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa7490:	17ffffde	b	0xfffff7fa7408
   0x0000fffff7fa7494:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa7498:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa749c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa74a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa74a4:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fa74a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa74ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fa74b0:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fa74b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa74b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa74bc:	d63f0200	blr	x16
   0x0000fffff7fa74c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa74c4:	5400c400	b.eq	0xfffff7fa8d44  // b.none
   0x0000fffff7fa74c8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa74cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa74d0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa74d4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa74d8:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fa74dc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa74e0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa74e4:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fa74e8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa74ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa74f0:	d63f0200	blr	x16
   0x0000fffff7fa74f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa74f8:	5400c2a0	b.eq	0xfffff7fa8d4c  // b.none
   0x0000fffff7fa74fc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa7500:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7504:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7508:	aa1503e2	mov	x2, x21
   0x0000fffff7fa750c:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fa7510:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7514:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7518:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fa751c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7520:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7524:	d63f0200	blr	x16
   0x0000fffff7fa7528:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa752c:	5400c140	b.eq	0xfffff7fa8d54  // b.none
   0x0000fffff7fa7530:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa7534:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa7538:	54000380	b.eq	0xfffff7fa75a8  // b.none
   0x0000fffff7fa753c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa7540:	37d8034d	tbnz	w13, #27, 0xfffff7fa75a8
   0x0000fffff7fa7544:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa7548:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa754c:	36d80211	tbz	w17, #27, 0xfffff7fa758c
   0x0000fffff7fa7550:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa7554:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa7558:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa755c:	54000261	b.ne	0xfffff7fa75a8  // b.any
   0x0000fffff7fa7560:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa7564:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa7568:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa756c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa7570:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa7574:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa7578:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa757c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa7580:	54000149	b.ls	0xfffff7fa75a8  // b.plast
   0x0000fffff7fa7584:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa7588:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa758c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa7590:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa7594:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa7598:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa759c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa75a0:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa75a4:	1400000e	b	0xfffff7fa75dc
   0x0000fffff7fa75a8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa75ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa75b0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa75b4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa75b8:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fa75bc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa75c0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa75c4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fa75c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa75cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa75d0:	d63f0200	blr	x16
   0x0000fffff7fa75d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa75d8:	5400bc20	b.eq	0xfffff7fa8d5c  // b.none
   0x0000fffff7fa75dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa75e0:	37d806a9	tbnz	w9, #27, 0xfffff7fa76b4
   0x0000fffff7fa75e4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa75e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa75ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa75f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa75f4:	540001c1	b.ne	0xfffff7fa762c  // b.any
   0x0000fffff7fa75f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa75fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7600:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7604:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7608:	54000121	b.ne	0xfffff7fa762c  // b.any
   0x0000fffff7fa760c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa7610:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa7614:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa7618:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa761c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7620:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa7624:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa7628:	14000030	b	0xfffff7fa76e8
   0x0000fffff7fa762c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa7630:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7634:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7638:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa763c:	54000120	b.eq	0xfffff7fa7660  // b.none
   0x0000fffff7fa7640:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa7644:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7648:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa764c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7650:	54000321	b.ne	0xfffff7fa76b4  // b.any
   0x0000fffff7fa7654:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa7658:	9e620120	scvtf	d0, x9
   0x0000fffff7fa765c:	14000002	b	0xfffff7fa7664
   0x0000fffff7fa7660:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa7664:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7668:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa766c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7670:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7674:	54000120	b.eq	0xfffff7fa7698  // b.none
   0x0000fffff7fa7678:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa767c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7680:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7684:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7688:	54000161	b.ne	0xfffff7fa76b4  // b.any
   0x0000fffff7fa768c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa7690:	9e620121	scvtf	d1, x9
   0x0000fffff7fa7694:	14000002	b	0xfffff7fa769c
   0x0000fffff7fa7698:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa769c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa76a0:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa76a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa76a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa76ac:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa76b0:	17ffffde	b	0xfffff7fa7628
   0x0000fffff7fa76b4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa76b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa76bc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa76c0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa76c4:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fa76c8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa76cc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa76d0:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fa76d4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa76d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa76dc:	d63f0200	blr	x16
   0x0000fffff7fa76e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa76e4:	5400b400	b.eq	0xfffff7fa8d64  // b.none
   0x0000fffff7fa76e8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa76ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa76f0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa76f4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa76f8:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fa76fc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7700:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7704:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fa7708:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa770c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7710:	d63f0200	blr	x16
   0x0000fffff7fa7714:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7718:	5400b2a0	b.eq	0xfffff7fa8d6c  // b.none
   0x0000fffff7fa771c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa7720:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7724:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7728:	aa1503e2	mov	x2, x21
   0x0000fffff7fa772c:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fa7730:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7734:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7738:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fa773c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7740:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7744:	d63f0200	blr	x16
   0x0000fffff7fa7748:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa774c:	5400b140	b.eq	0xfffff7fa8d74  // b.none
   0x0000fffff7fa7750:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa7754:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa7758:	54000380	b.eq	0xfffff7fa77c8  // b.none
   0x0000fffff7fa775c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa7760:	37d8034d	tbnz	w13, #27, 0xfffff7fa77c8
   0x0000fffff7fa7764:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa7768:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa776c:	36d80211	tbz	w17, #27, 0xfffff7fa77ac
   0x0000fffff7fa7770:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa7774:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa7778:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa777c:	54000261	b.ne	0xfffff7fa77c8  // b.any
   0x0000fffff7fa7780:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa7784:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa7788:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa778c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa7790:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa7794:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa7798:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa779c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa77a0:	54000149	b.ls	0xfffff7fa77c8  // b.plast
   0x0000fffff7fa77a4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa77a8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa77ac:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa77b0:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa77b4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa77b8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa77bc:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa77c0:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa77c4:	1400000e	b	0xfffff7fa77fc
   0x0000fffff7fa77c8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa77cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa77d0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa77d4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa77d8:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fa77dc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa77e0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa77e4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fa77e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa77ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa77f0:	d63f0200	blr	x16
   0x0000fffff7fa77f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa77f8:	5400ac20	b.eq	0xfffff7fa8d7c  // b.none
   0x0000fffff7fa77fc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa7800:	37d806a9	tbnz	w9, #27, 0xfffff7fa78d4
   0x0000fffff7fa7804:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa7808:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa780c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7810:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7814:	540001c1	b.ne	0xfffff7fa784c  // b.any
   0x0000fffff7fa7818:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa781c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7820:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7824:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7828:	54000121	b.ne	0xfffff7fa784c  // b.any
   0x0000fffff7fa782c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa7830:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa7834:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa7838:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa783c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7840:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa7844:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa7848:	14000030	b	0xfffff7fa7908
   0x0000fffff7fa784c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa7850:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7854:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7858:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa785c:	54000120	b.eq	0xfffff7fa7880  // b.none
   0x0000fffff7fa7860:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa7864:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7868:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa786c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7870:	54000321	b.ne	0xfffff7fa78d4  // b.any
   0x0000fffff7fa7874:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa7878:	9e620120	scvtf	d0, x9
   0x0000fffff7fa787c:	14000002	b	0xfffff7fa7884
   0x0000fffff7fa7880:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa7884:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7888:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa788c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7890:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7894:	54000120	b.eq	0xfffff7fa78b8  // b.none
   0x0000fffff7fa7898:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa789c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa78a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa78a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa78a8:	54000161	b.ne	0xfffff7fa78d4  // b.any
   0x0000fffff7fa78ac:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa78b0:	9e620121	scvtf	d1, x9
   0x0000fffff7fa78b4:	14000002	b	0xfffff7fa78bc
   0x0000fffff7fa78b8:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa78bc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa78c0:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa78c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa78c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa78cc:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa78d0:	17ffffde	b	0xfffff7fa7848
   0x0000fffff7fa78d4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa78d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa78dc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa78e0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa78e4:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fa78e8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa78ec:	aa1603e5	mov	x5, x22
   0x0000fffff7fa78f0:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fa78f4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa78f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa78fc:	d63f0200	blr	x16
   0x0000fffff7fa7900:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7904:	5400a400	b.eq	0xfffff7fa8d84  // b.none
   0x0000fffff7fa7908:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa790c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7910:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7914:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7918:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fa791c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7920:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7924:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fa7928:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa792c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7930:	d63f0200	blr	x16
   0x0000fffff7fa7934:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7938:	5400a2a0	b.eq	0xfffff7fa8d8c  // b.none
   0x0000fffff7fa793c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa7940:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7944:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7948:	aa1503e2	mov	x2, x21
   0x0000fffff7fa794c:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fa7950:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7954:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7958:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fa795c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7960:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7964:	d63f0200	blr	x16
   0x0000fffff7fa7968:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa796c:	5400a140	b.eq	0xfffff7fa8d94  // b.none
   0x0000fffff7fa7970:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa7974:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa7978:	54000380	b.eq	0xfffff7fa79e8  // b.none
   0x0000fffff7fa797c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa7980:	37d8034d	tbnz	w13, #27, 0xfffff7fa79e8
   0x0000fffff7fa7984:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa7988:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa798c:	36d80211	tbz	w17, #27, 0xfffff7fa79cc
   0x0000fffff7fa7990:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa7994:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa7998:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa799c:	54000261	b.ne	0xfffff7fa79e8  // b.any
   0x0000fffff7fa79a0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa79a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa79a8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa79ac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa79b0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa79b4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa79b8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa79bc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa79c0:	54000149	b.ls	0xfffff7fa79e8  // b.plast
   0x0000fffff7fa79c4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa79c8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa79cc:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa79d0:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa79d4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa79d8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa79dc:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa79e0:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa79e4:	1400000e	b	0xfffff7fa7a1c
   0x0000fffff7fa79e8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa79ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa79f0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa79f4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa79f8:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fa79fc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7a00:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7a04:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fa7a08:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa7a0c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7a10:	d63f0200	blr	x16
   0x0000fffff7fa7a14:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7a18:	54009c20	b.eq	0xfffff7fa8d9c  // b.none
   0x0000fffff7fa7a1c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa7a20:	37d806a9	tbnz	w9, #27, 0xfffff7fa7af4
   0x0000fffff7fa7a24:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa7a28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7a2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7a30:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7a34:	540001c1	b.ne	0xfffff7fa7a6c  // b.any
   0x0000fffff7fa7a38:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7a3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7a40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7a44:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7a48:	54000121	b.ne	0xfffff7fa7a6c  // b.any
   0x0000fffff7fa7a4c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa7a50:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa7a54:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa7a58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7a5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7a60:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa7a64:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa7a68:	14000030	b	0xfffff7fa7b28
   0x0000fffff7fa7a6c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa7a70:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7a74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7a78:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7a7c:	54000120	b.eq	0xfffff7fa7aa0  // b.none
   0x0000fffff7fa7a80:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa7a84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7a88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7a8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7a90:	54000321	b.ne	0xfffff7fa7af4  // b.any
   0x0000fffff7fa7a94:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa7a98:	9e620120	scvtf	d0, x9
   0x0000fffff7fa7a9c:	14000002	b	0xfffff7fa7aa4
   0x0000fffff7fa7aa0:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa7aa4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7aa8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7aac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7ab0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7ab4:	54000120	b.eq	0xfffff7fa7ad8  // b.none
   0x0000fffff7fa7ab8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7abc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7ac0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7ac4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7ac8:	54000161	b.ne	0xfffff7fa7af4  // b.any
   0x0000fffff7fa7acc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa7ad0:	9e620121	scvtf	d1, x9
   0x0000fffff7fa7ad4:	14000002	b	0xfffff7fa7adc
   0x0000fffff7fa7ad8:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa7adc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa7ae0:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa7ae4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7ae8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7aec:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa7af0:	17ffffde	b	0xfffff7fa7a68
   0x0000fffff7fa7af4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa7af8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7afc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7b00:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7b04:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fa7b08:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7b0c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7b10:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fa7b14:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7b18:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7b1c:	d63f0200	blr	x16
   0x0000fffff7fa7b20:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7b24:	54009400	b.eq	0xfffff7fa8da4  // b.none
   0x0000fffff7fa7b28:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa7b2c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7b30:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7b34:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7b38:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fa7b3c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7b40:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7b44:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fa7b48:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7b4c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7b50:	d63f0200	blr	x16
   0x0000fffff7fa7b54:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7b58:	540092a0	b.eq	0xfffff7fa8dac  // b.none
   0x0000fffff7fa7b5c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa7b60:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7b64:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7b68:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7b6c:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fa7b70:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7b74:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7b78:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fa7b7c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7b80:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7b84:	d63f0200	blr	x16
   0x0000fffff7fa7b88:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7b8c:	54009140	b.eq	0xfffff7fa8db4  // b.none
   0x0000fffff7fa7b90:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa7b94:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa7b98:	54000380	b.eq	0xfffff7fa7c08  // b.none
   0x0000fffff7fa7b9c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa7ba0:	37d8034d	tbnz	w13, #27, 0xfffff7fa7c08
   0x0000fffff7fa7ba4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa7ba8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa7bac:	36d80211	tbz	w17, #27, 0xfffff7fa7bec
   0x0000fffff7fa7bb0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa7bb4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa7bb8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa7bbc:	54000261	b.ne	0xfffff7fa7c08  // b.any
   0x0000fffff7fa7bc0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa7bc4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa7bc8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa7bcc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa7bd0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa7bd4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa7bd8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa7bdc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa7be0:	54000149	b.ls	0xfffff7fa7c08  // b.plast
   0x0000fffff7fa7be4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa7be8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa7bec:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa7bf0:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa7bf4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa7bf8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa7bfc:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa7c00:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa7c04:	1400000e	b	0xfffff7fa7c3c
   0x0000fffff7fa7c08:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa7c0c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7c10:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7c14:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7c18:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fa7c1c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7c20:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7c24:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fa7c28:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa7c2c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7c30:	d63f0200	blr	x16
   0x0000fffff7fa7c34:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7c38:	54008c20	b.eq	0xfffff7fa8dbc  // b.none
   0x0000fffff7fa7c3c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa7c40:	37d806a9	tbnz	w9, #27, 0xfffff7fa7d14
   0x0000fffff7fa7c44:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa7c48:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7c4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7c50:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7c54:	540001c1	b.ne	0xfffff7fa7c8c  // b.any
   0x0000fffff7fa7c58:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7c5c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7c60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7c64:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7c68:	54000121	b.ne	0xfffff7fa7c8c  // b.any
   0x0000fffff7fa7c6c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa7c70:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa7c74:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa7c78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7c7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7c80:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa7c84:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa7c88:	14000030	b	0xfffff7fa7d48
   0x0000fffff7fa7c8c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa7c90:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7c94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7c98:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7c9c:	54000120	b.eq	0xfffff7fa7cc0  // b.none
   0x0000fffff7fa7ca0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa7ca4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7ca8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7cac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7cb0:	54000321	b.ne	0xfffff7fa7d14  // b.any
   0x0000fffff7fa7cb4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa7cb8:	9e620120	scvtf	d0, x9
   0x0000fffff7fa7cbc:	14000002	b	0xfffff7fa7cc4
   0x0000fffff7fa7cc0:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa7cc4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7cc8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7ccc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7cd0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7cd4:	54000120	b.eq	0xfffff7fa7cf8  // b.none
   0x0000fffff7fa7cd8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7cdc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7ce0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7ce4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7ce8:	54000161	b.ne	0xfffff7fa7d14  // b.any
   0x0000fffff7fa7cec:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa7cf0:	9e620121	scvtf	d1, x9
   0x0000fffff7fa7cf4:	14000002	b	0xfffff7fa7cfc
   0x0000fffff7fa7cf8:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa7cfc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa7d00:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa7d04:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7d08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7d0c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa7d10:	17ffffde	b	0xfffff7fa7c88
   0x0000fffff7fa7d14:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa7d18:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7d1c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7d20:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7d24:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fa7d28:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7d2c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7d30:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fa7d34:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7d38:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7d3c:	d63f0200	blr	x16
   0x0000fffff7fa7d40:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7d44:	54008400	b.eq	0xfffff7fa8dc4  // b.none
   0x0000fffff7fa7d48:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa7d4c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7d50:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7d54:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7d58:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fa7d5c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7d60:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7d64:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fa7d68:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7d6c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7d70:	d63f0200	blr	x16
   0x0000fffff7fa7d74:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7d78:	540082a0	b.eq	0xfffff7fa8dcc  // b.none
   0x0000fffff7fa7d7c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa7d80:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7d84:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7d88:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7d8c:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fa7d90:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7d94:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7d98:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fa7d9c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7da0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7da4:	d63f0200	blr	x16
   0x0000fffff7fa7da8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7dac:	54008140	b.eq	0xfffff7fa8dd4  // b.none
   0x0000fffff7fa7db0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa7db4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa7db8:	54000380	b.eq	0xfffff7fa7e28  // b.none
   0x0000fffff7fa7dbc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa7dc0:	37d8034d	tbnz	w13, #27, 0xfffff7fa7e28
   0x0000fffff7fa7dc4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa7dc8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa7dcc:	36d80211	tbz	w17, #27, 0xfffff7fa7e0c
   0x0000fffff7fa7dd0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa7dd4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa7dd8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa7ddc:	54000261	b.ne	0xfffff7fa7e28  // b.any
   0x0000fffff7fa7de0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa7de4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa7de8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa7dec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa7df0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa7df4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa7df8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa7dfc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa7e00:	54000149	b.ls	0xfffff7fa7e28  // b.plast
   0x0000fffff7fa7e04:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa7e08:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa7e0c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa7e10:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa7e14:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa7e18:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa7e1c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa7e20:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa7e24:	1400000e	b	0xfffff7fa7e5c
   0x0000fffff7fa7e28:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa7e2c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7e30:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7e34:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7e38:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fa7e3c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7e40:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7e44:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fa7e48:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa7e4c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7e50:	d63f0200	blr	x16
   0x0000fffff7fa7e54:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7e58:	54007c20	b.eq	0xfffff7fa8ddc  // b.none
   0x0000fffff7fa7e5c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa7e60:	37d806a9	tbnz	w9, #27, 0xfffff7fa7f34
   0x0000fffff7fa7e64:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa7e68:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7e6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7e70:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7e74:	540001c1	b.ne	0xfffff7fa7eac  // b.any
   0x0000fffff7fa7e78:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7e7c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7e80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7e84:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7e88:	54000121	b.ne	0xfffff7fa7eac  // b.any
   0x0000fffff7fa7e8c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa7e90:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa7e94:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa7e98:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7e9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7ea0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa7ea4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa7ea8:	14000030	b	0xfffff7fa7f68
   0x0000fffff7fa7eac:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa7eb0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7eb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7eb8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7ebc:	54000120	b.eq	0xfffff7fa7ee0  // b.none
   0x0000fffff7fa7ec0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa7ec4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7ec8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7ecc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7ed0:	54000321	b.ne	0xfffff7fa7f34  // b.any
   0x0000fffff7fa7ed4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa7ed8:	9e620120	scvtf	d0, x9
   0x0000fffff7fa7edc:	14000002	b	0xfffff7fa7ee4
   0x0000fffff7fa7ee0:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa7ee4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7ee8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7eec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7ef0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7ef4:	54000120	b.eq	0xfffff7fa7f18  // b.none
   0x0000fffff7fa7ef8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7efc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7f00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7f04:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7f08:	54000161	b.ne	0xfffff7fa7f34  // b.any
   0x0000fffff7fa7f0c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa7f10:	9e620121	scvtf	d1, x9
   0x0000fffff7fa7f14:	14000002	b	0xfffff7fa7f1c
   0x0000fffff7fa7f18:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa7f1c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa7f20:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa7f24:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7f28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7f2c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa7f30:	17ffffde	b	0xfffff7fa7ea8
   0x0000fffff7fa7f34:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa7f38:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7f3c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7f40:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7f44:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fa7f48:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7f4c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7f50:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fa7f54:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7f58:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7f5c:	d63f0200	blr	x16
   0x0000fffff7fa7f60:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7f64:	54007400	b.eq	0xfffff7fa8de4  // b.none
   0x0000fffff7fa7f68:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa7f6c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7f70:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7f74:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7f78:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fa7f7c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7f80:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7f84:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fa7f88:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7f8c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7f90:	d63f0200	blr	x16
   0x0000fffff7fa7f94:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7f98:	540072a0	b.eq	0xfffff7fa8dec  // b.none
   0x0000fffff7fa7f9c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa7fa0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7fa4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7fa8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7fac:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fa7fb0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7fb4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7fb8:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fa7fbc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7fc0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7fc4:	d63f0200	blr	x16
   0x0000fffff7fa7fc8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7fcc:	54007140	b.eq	0xfffff7fa8df4  // b.none
   0x0000fffff7fa7fd0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa7fd4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa7fd8:	54000380	b.eq	0xfffff7fa8048  // b.none
   0x0000fffff7fa7fdc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa7fe0:	37d8034d	tbnz	w13, #27, 0xfffff7fa8048
   0x0000fffff7fa7fe4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa7fe8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa7fec:	36d80211	tbz	w17, #27, 0xfffff7fa802c
   0x0000fffff7fa7ff0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa7ff4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa7ff8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa7ffc:	54000261	b.ne	0xfffff7fa8048  // b.any
   0x0000fffff7fa8000:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa8004:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8008:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa800c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8010:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8014:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8018:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa801c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8020:	54000149	b.ls	0xfffff7fa8048  // b.plast
   0x0000fffff7fa8024:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8028:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa802c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa8030:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa8034:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa8038:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa803c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa8040:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa8044:	1400000e	b	0xfffff7fa807c
   0x0000fffff7fa8048:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa804c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8050:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8054:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8058:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fa805c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8060:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8064:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fa8068:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa806c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8070:	d63f0200	blr	x16
   0x0000fffff7fa8074:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8078:	54006c20	b.eq	0xfffff7fa8dfc  // b.none
   0x0000fffff7fa807c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8080:	37d806a9	tbnz	w9, #27, 0xfffff7fa8154
   0x0000fffff7fa8084:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8088:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa808c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8090:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8094:	540001c1	b.ne	0xfffff7fa80cc  // b.any
   0x0000fffff7fa8098:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa809c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa80a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa80a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa80a8:	54000121	b.ne	0xfffff7fa80cc  // b.any
   0x0000fffff7fa80ac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa80b0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa80b4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa80b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa80bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa80c0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa80c4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa80c8:	14000030	b	0xfffff7fa8188
   0x0000fffff7fa80cc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa80d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa80d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa80d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa80dc:	54000120	b.eq	0xfffff7fa8100  // b.none
   0x0000fffff7fa80e0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa80e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa80e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa80ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa80f0:	54000321	b.ne	0xfffff7fa8154  // b.any
   0x0000fffff7fa80f4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa80f8:	9e620120	scvtf	d0, x9
   0x0000fffff7fa80fc:	14000002	b	0xfffff7fa8104
   0x0000fffff7fa8100:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa8104:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8108:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa810c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8110:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8114:	54000120	b.eq	0xfffff7fa8138  // b.none
   0x0000fffff7fa8118:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa811c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8120:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8124:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8128:	54000161	b.ne	0xfffff7fa8154  // b.any
   0x0000fffff7fa812c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa8130:	9e620121	scvtf	d1, x9
   0x0000fffff7fa8134:	14000002	b	0xfffff7fa813c
   0x0000fffff7fa8138:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa813c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa8140:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa8144:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8148:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa814c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa8150:	17ffffde	b	0xfffff7fa80c8
   0x0000fffff7fa8154:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8158:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa815c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8160:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8164:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fa8168:	aa1403e4	mov	x4, x20
   0x0000fffff7fa816c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8170:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fa8174:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8178:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa817c:	d63f0200	blr	x16
   0x0000fffff7fa8180:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8184:	54006400	b.eq	0xfffff7fa8e04  // b.none
   0x0000fffff7fa8188:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa818c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8190:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8194:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8198:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fa819c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa81a0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa81a4:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fa81a8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa81ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa81b0:	d63f0200	blr	x16
   0x0000fffff7fa81b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa81b8:	540062a0	b.eq	0xfffff7fa8e0c  // b.none
   0x0000fffff7fa81bc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa81c0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa81c4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa81c8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa81cc:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fa81d0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa81d4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa81d8:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fa81dc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa81e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa81e4:	d63f0200	blr	x16
   0x0000fffff7fa81e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa81ec:	54006140	b.eq	0xfffff7fa8e14  // b.none
   0x0000fffff7fa81f0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa81f4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa81f8:	54000380	b.eq	0xfffff7fa8268  // b.none
   0x0000fffff7fa81fc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa8200:	37d8034d	tbnz	w13, #27, 0xfffff7fa8268
   0x0000fffff7fa8204:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa8208:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa820c:	36d80211	tbz	w17, #27, 0xfffff7fa824c
   0x0000fffff7fa8210:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8214:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8218:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa821c:	54000261	b.ne	0xfffff7fa8268  // b.any
   0x0000fffff7fa8220:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa8224:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8228:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa822c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8230:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8234:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8238:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa823c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8240:	54000149	b.ls	0xfffff7fa8268  // b.plast
   0x0000fffff7fa8244:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8248:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa824c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa8250:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa8254:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa8258:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa825c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa8260:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa8264:	1400000e	b	0xfffff7fa829c
   0x0000fffff7fa8268:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa826c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8270:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8274:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8278:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fa827c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8280:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8284:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fa8288:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa828c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8290:	d63f0200	blr	x16
   0x0000fffff7fa8294:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8298:	54005c20	b.eq	0xfffff7fa8e1c  // b.none
   0x0000fffff7fa829c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa82a0:	37d806a9	tbnz	w9, #27, 0xfffff7fa8374
   0x0000fffff7fa82a4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa82a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa82ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa82b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa82b4:	540001c1	b.ne	0xfffff7fa82ec  // b.any
   0x0000fffff7fa82b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa82bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa82c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa82c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa82c8:	54000121	b.ne	0xfffff7fa82ec  // b.any
   0x0000fffff7fa82cc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa82d0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa82d4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa82d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa82dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa82e0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa82e4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa82e8:	14000030	b	0xfffff7fa83a8
   0x0000fffff7fa82ec:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa82f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa82f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa82f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa82fc:	54000120	b.eq	0xfffff7fa8320  // b.none
   0x0000fffff7fa8300:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8304:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8308:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa830c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8310:	54000321	b.ne	0xfffff7fa8374  // b.any
   0x0000fffff7fa8314:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa8318:	9e620120	scvtf	d0, x9
   0x0000fffff7fa831c:	14000002	b	0xfffff7fa8324
   0x0000fffff7fa8320:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa8324:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8328:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa832c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8330:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8334:	54000120	b.eq	0xfffff7fa8358  // b.none
   0x0000fffff7fa8338:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa833c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8340:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8344:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8348:	54000161	b.ne	0xfffff7fa8374  // b.any
   0x0000fffff7fa834c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa8350:	9e620121	scvtf	d1, x9
   0x0000fffff7fa8354:	14000002	b	0xfffff7fa835c
   0x0000fffff7fa8358:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa835c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa8360:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa8364:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8368:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa836c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa8370:	17ffffde	b	0xfffff7fa82e8
   0x0000fffff7fa8374:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8378:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa837c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8380:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8384:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fa8388:	aa1403e4	mov	x4, x20
   0x0000fffff7fa838c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8390:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fa8394:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8398:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa839c:	d63f0200	blr	x16
   0x0000fffff7fa83a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa83a4:	54005400	b.eq	0xfffff7fa8e24  // b.none
   0x0000fffff7fa83a8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa83ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa83b0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa83b4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa83b8:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fa83bc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa83c0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa83c4:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fa83c8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa83cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa83d0:	d63f0200	blr	x16
   0x0000fffff7fa83d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa83d8:	540052a0	b.eq	0xfffff7fa8e2c  // b.none
   0x0000fffff7fa83dc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa83e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa83e4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa83e8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa83ec:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fa83f0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa83f4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa83f8:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fa83fc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8400:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8404:	d63f0200	blr	x16
   0x0000fffff7fa8408:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa840c:	54005140	b.eq	0xfffff7fa8e34  // b.none
   0x0000fffff7fa8410:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa8414:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa8418:	54000380	b.eq	0xfffff7fa8488  // b.none
   0x0000fffff7fa841c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa8420:	37d8034d	tbnz	w13, #27, 0xfffff7fa8488
   0x0000fffff7fa8424:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa8428:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa842c:	36d80211	tbz	w17, #27, 0xfffff7fa846c
   0x0000fffff7fa8430:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8434:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8438:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa843c:	54000261	b.ne	0xfffff7fa8488  // b.any
   0x0000fffff7fa8440:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa8444:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8448:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa844c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8450:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8454:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8458:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa845c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8460:	54000149	b.ls	0xfffff7fa8488  // b.plast
   0x0000fffff7fa8464:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8468:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa846c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa8470:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa8474:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa8478:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa847c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa8480:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa8484:	1400000e	b	0xfffff7fa84bc
   0x0000fffff7fa8488:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa848c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8490:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8494:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8498:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fa849c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa84a0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa84a4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fa84a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa84ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa84b0:	d63f0200	blr	x16
   0x0000fffff7fa84b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa84b8:	54004c20	b.eq	0xfffff7fa8e3c  // b.none
   0x0000fffff7fa84bc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa84c0:	37d806a9	tbnz	w9, #27, 0xfffff7fa8594
   0x0000fffff7fa84c4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa84c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa84cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa84d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa84d4:	540001c1	b.ne	0xfffff7fa850c  // b.any
   0x0000fffff7fa84d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa84dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa84e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa84e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa84e8:	54000121	b.ne	0xfffff7fa850c  // b.any
   0x0000fffff7fa84ec:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa84f0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa84f4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa84f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa84fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8500:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa8504:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa8508:	14000030	b	0xfffff7fa85c8
   0x0000fffff7fa850c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8510:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8514:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8518:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa851c:	54000120	b.eq	0xfffff7fa8540  // b.none
   0x0000fffff7fa8520:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8524:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8528:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa852c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8530:	54000321	b.ne	0xfffff7fa8594  // b.any
   0x0000fffff7fa8534:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa8538:	9e620120	scvtf	d0, x9
   0x0000fffff7fa853c:	14000002	b	0xfffff7fa8544
   0x0000fffff7fa8540:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa8544:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8548:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa854c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8550:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8554:	54000120	b.eq	0xfffff7fa8578  // b.none
   0x0000fffff7fa8558:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa855c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8560:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8564:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8568:	54000161	b.ne	0xfffff7fa8594  // b.any
   0x0000fffff7fa856c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa8570:	9e620121	scvtf	d1, x9
   0x0000fffff7fa8574:	14000002	b	0xfffff7fa857c
   0x0000fffff7fa8578:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa857c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa8580:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa8584:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8588:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa858c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa8590:	17ffffde	b	0xfffff7fa8508
   0x0000fffff7fa8594:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8598:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa859c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa85a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa85a4:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7fa85a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa85ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fa85b0:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fa85b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa85b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa85bc:	d63f0200	blr	x16
   0x0000fffff7fa85c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa85c4:	54004400	b.eq	0xfffff7fa8e44  // b.none
   0x0000fffff7fa85c8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa85cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa85d0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa85d4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa85d8:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7fa85dc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa85e0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa85e4:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fa85e8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa85ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa85f0:	d63f0200	blr	x16
   0x0000fffff7fa85f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa85f8:	540042a0	b.eq	0xfffff7fa8e4c  // b.none
   0x0000fffff7fa85fc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa8600:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8604:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8608:	aa1503e2	mov	x2, x21
   0x0000fffff7fa860c:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7fa8610:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8614:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8618:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fa861c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8620:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8624:	d63f0200	blr	x16
   0x0000fffff7fa8628:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa862c:	54004140	b.eq	0xfffff7fa8e54  // b.none
   0x0000fffff7fa8630:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa8634:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa8638:	54000380	b.eq	0xfffff7fa86a8  // b.none
   0x0000fffff7fa863c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa8640:	37d8034d	tbnz	w13, #27, 0xfffff7fa86a8
   0x0000fffff7fa8644:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa8648:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa864c:	36d80211	tbz	w17, #27, 0xfffff7fa868c
   0x0000fffff7fa8650:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8654:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8658:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa865c:	54000261	b.ne	0xfffff7fa86a8  // b.any
   0x0000fffff7fa8660:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa8664:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8668:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa866c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8670:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8674:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8678:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa867c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8680:	54000149	b.ls	0xfffff7fa86a8  // b.plast
   0x0000fffff7fa8684:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8688:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa868c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa8690:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa8694:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa8698:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa869c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa86a0:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa86a4:	1400000e	b	0xfffff7fa86dc
   0x0000fffff7fa86a8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa86ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa86b0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa86b4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa86b8:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7fa86bc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa86c0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa86c4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fa86c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa86cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa86d0:	d63f0200	blr	x16
   0x0000fffff7fa86d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa86d8:	54003c20	b.eq	0xfffff7fa8e5c  // b.none
   0x0000fffff7fa86dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa86e0:	37d806a9	tbnz	w9, #27, 0xfffff7fa87b4
   0x0000fffff7fa86e4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa86e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa86ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa86f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa86f4:	540001c1	b.ne	0xfffff7fa872c  // b.any
   0x0000fffff7fa86f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa86fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8700:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8704:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8708:	54000121	b.ne	0xfffff7fa872c  // b.any
   0x0000fffff7fa870c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa8710:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa8714:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa8718:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa871c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8720:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa8724:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa8728:	14000030	b	0xfffff7fa87e8
   0x0000fffff7fa872c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8730:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8734:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8738:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa873c:	54000120	b.eq	0xfffff7fa8760  // b.none
   0x0000fffff7fa8740:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8744:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8748:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa874c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8750:	54000321	b.ne	0xfffff7fa87b4  // b.any
   0x0000fffff7fa8754:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa8758:	9e620120	scvtf	d0, x9
   0x0000fffff7fa875c:	14000002	b	0xfffff7fa8764
   0x0000fffff7fa8760:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa8764:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8768:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa876c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8770:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8774:	54000120	b.eq	0xfffff7fa8798  // b.none
   0x0000fffff7fa8778:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa877c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8780:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8784:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8788:	54000161	b.ne	0xfffff7fa87b4  // b.any
   0x0000fffff7fa878c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa8790:	9e620121	scvtf	d1, x9
   0x0000fffff7fa8794:	14000002	b	0xfffff7fa879c
   0x0000fffff7fa8798:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa879c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa87a0:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa87a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa87a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa87ac:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa87b0:	17ffffde	b	0xfffff7fa8728
   0x0000fffff7fa87b4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa87b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa87bc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa87c0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa87c4:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7fa87c8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa87cc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa87d0:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fa87d4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa87d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa87dc:	d63f0200	blr	x16
   0x0000fffff7fa87e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa87e4:	54003400	b.eq	0xfffff7fa8e64  // b.none
   0x0000fffff7fa87e8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa87ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa87f0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa87f4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa87f8:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7fa87fc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8800:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8804:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fa8808:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa880c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8810:	d63f0200	blr	x16
   0x0000fffff7fa8814:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8818:	540032a0	b.eq	0xfffff7fa8e6c  // b.none
   0x0000fffff7fa881c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa8820:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8824:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8828:	aa1503e2	mov	x2, x21
   0x0000fffff7fa882c:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7fa8830:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8834:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8838:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fa883c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8840:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8844:	d63f0200	blr	x16
   0x0000fffff7fa8848:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa884c:	54003140	b.eq	0xfffff7fa8e74  // b.none
   0x0000fffff7fa8850:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa8854:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa8858:	54000380	b.eq	0xfffff7fa88c8  // b.none
   0x0000fffff7fa885c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa8860:	37d8034d	tbnz	w13, #27, 0xfffff7fa88c8
   0x0000fffff7fa8864:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa8868:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa886c:	36d80211	tbz	w17, #27, 0xfffff7fa88ac
   0x0000fffff7fa8870:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8874:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8878:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa887c:	54000261	b.ne	0xfffff7fa88c8  // b.any
   0x0000fffff7fa8880:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa8884:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8888:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa888c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8890:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8894:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8898:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa889c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa88a0:	54000149	b.ls	0xfffff7fa88c8  // b.plast
   0x0000fffff7fa88a4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa88a8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa88ac:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa88b0:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa88b4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa88b8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa88bc:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa88c0:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa88c4:	1400000e	b	0xfffff7fa88fc
   0x0000fffff7fa88c8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa88cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa88d0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa88d4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa88d8:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7fa88dc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa88e0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa88e4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fa88e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa88ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa88f0:	d63f0200	blr	x16
   0x0000fffff7fa88f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa88f8:	54002c20	b.eq	0xfffff7fa8e7c  // b.none
   0x0000fffff7fa88fc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8900:	37d806a9	tbnz	w9, #27, 0xfffff7fa89d4
   0x0000fffff7fa8904:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8908:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa890c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8910:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8914:	540001c1	b.ne	0xfffff7fa894c  // b.any
   0x0000fffff7fa8918:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa891c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8920:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8924:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8928:	54000121	b.ne	0xfffff7fa894c  // b.any
   0x0000fffff7fa892c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa8930:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa8934:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa8938:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa893c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8940:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa8944:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa8948:	14000030	b	0xfffff7fa8a08
   0x0000fffff7fa894c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8950:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8954:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8958:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa895c:	54000120	b.eq	0xfffff7fa8980  // b.none
   0x0000fffff7fa8960:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8964:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8968:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa896c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8970:	54000321	b.ne	0xfffff7fa89d4  // b.any
   0x0000fffff7fa8974:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa8978:	9e620120	scvtf	d0, x9
   0x0000fffff7fa897c:	14000002	b	0xfffff7fa8984
   0x0000fffff7fa8980:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa8984:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8988:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa898c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8990:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8994:	54000120	b.eq	0xfffff7fa89b8  // b.none
   0x0000fffff7fa8998:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa899c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa89a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa89a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa89a8:	54000161	b.ne	0xfffff7fa89d4  // b.any
   0x0000fffff7fa89ac:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa89b0:	9e620121	scvtf	d1, x9
   0x0000fffff7fa89b4:	14000002	b	0xfffff7fa89bc
   0x0000fffff7fa89b8:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa89bc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa89c0:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa89c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa89c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa89cc:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa89d0:	17ffffde	b	0xfffff7fa8948
   0x0000fffff7fa89d4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa89d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa89dc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa89e0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa89e4:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7fa89e8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa89ec:	aa1603e5	mov	x5, x22
   0x0000fffff7fa89f0:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fa89f4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa89f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa89fc:	d63f0200	blr	x16
   0x0000fffff7fa8a00:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8a04:	54002400	b.eq	0xfffff7fa8e84  // b.none
   0x0000fffff7fa8a08:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8a0c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8a10:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8a14:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8a18:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7fa8a1c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8a20:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8a24:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fa8a28:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8a2c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8a30:	d63f0200	blr	x16
   0x0000fffff7fa8a34:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8a38:	540022a0	b.eq	0xfffff7fa8e8c  // b.none
   0x0000fffff7fa8a3c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa8a40:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8a44:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8a48:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8a4c:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7fa8a50:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8a54:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8a58:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fa8a5c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8a60:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8a64:	d63f0200	blr	x16
   0x0000fffff7fa8a68:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8a6c:	54002140	b.eq	0xfffff7fa8e94  // b.none
   0x0000fffff7fa8a70:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa8a74:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa8a78:	54000380	b.eq	0xfffff7fa8ae8  // b.none
   0x0000fffff7fa8a7c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa8a80:	37d8034d	tbnz	w13, #27, 0xfffff7fa8ae8
   0x0000fffff7fa8a84:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa8a88:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa8a8c:	36d80211	tbz	w17, #27, 0xfffff7fa8acc
   0x0000fffff7fa8a90:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8a94:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8a98:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa8a9c:	54000261	b.ne	0xfffff7fa8ae8  // b.any
   0x0000fffff7fa8aa0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa8aa4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8aa8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa8aac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8ab0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8ab4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8ab8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa8abc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8ac0:	54000149	b.ls	0xfffff7fa8ae8  // b.plast
   0x0000fffff7fa8ac4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8ac8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa8acc:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fa8ad0:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa8ad4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa8ad8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa8adc:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa8ae0:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa8ae4:	1400000e	b	0xfffff7fa8b1c
   0x0000fffff7fa8ae8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa8aec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8af0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8af4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8af8:	d2800683	mov	x3, #0x34                  	// #52
   0x0000fffff7fa8afc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8b00:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8b04:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fa8b08:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8b0c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8b10:	d63f0200	blr	x16
   0x0000fffff7fa8b14:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8b18:	54001c20	b.eq	0xfffff7fa8e9c  // b.none
   0x0000fffff7fa8b1c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8b20:	37d806a9	tbnz	w9, #27, 0xfffff7fa8bf4
   0x0000fffff7fa8b24:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8b28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8b2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8b30:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8b34:	540001c1	b.ne	0xfffff7fa8b6c  // b.any
   0x0000fffff7fa8b38:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8b3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8b40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8b44:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8b48:	54000121	b.ne	0xfffff7fa8b6c  // b.any
   0x0000fffff7fa8b4c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa8b50:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa8b54:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa8b58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8b5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8b60:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa8b64:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa8b68:	14000030	b	0xfffff7fa8c28
   0x0000fffff7fa8b6c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8b70:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8b74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8b78:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8b7c:	54000120	b.eq	0xfffff7fa8ba0  // b.none
   0x0000fffff7fa8b80:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa8b84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8b88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8b8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8b90:	54000321	b.ne	0xfffff7fa8bf4  // b.any
   0x0000fffff7fa8b94:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa8b98:	9e620120	scvtf	d0, x9
   0x0000fffff7fa8b9c:	14000002	b	0xfffff7fa8ba4
   0x0000fffff7fa8ba0:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa8ba4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8ba8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8bac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8bb0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8bb4:	54000120	b.eq	0xfffff7fa8bd8  // b.none
   0x0000fffff7fa8bb8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8bbc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8bc0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8bc4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8bc8:	54000161	b.ne	0xfffff7fa8bf4  // b.any
   0x0000fffff7fa8bcc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa8bd0:	9e620121	scvtf	d1, x9
   0x0000fffff7fa8bd4:	14000002	b	0xfffff7fa8bdc
   0x0000fffff7fa8bd8:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa8bdc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa8be0:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa8be4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8be8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8bec:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa8bf0:	17ffffde	b	0xfffff7fa8b68
   0x0000fffff7fa8bf4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8bf8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8bfc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8c00:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8c04:	d28006a3	mov	x3, #0x35                  	// #53
   0x0000fffff7fa8c08:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8c0c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8c10:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fa8c14:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8c18:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8c1c:	d63f0200	blr	x16
   0x0000fffff7fa8c20:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8c24:	54001400	b.eq	0xfffff7fa8ea4  // b.none
   0x0000fffff7fa8c28:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8c2c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8c30:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8c34:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8c38:	d28006c3	mov	x3, #0x36                  	// #54
   0x0000fffff7fa8c3c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8c40:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8c44:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fa8c48:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8c4c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8c50:	d63f0200	blr	x16
   0x0000fffff7fa8c54:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8c58:	540012a0	b.eq	0xfffff7fa8eac  // b.none
   0x0000fffff7fa8c5c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa8c60:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8c64:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8c68:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8c6c:	d28006e3	mov	x3, #0x37                  	// #55
   0x0000fffff7fa8c70:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8c74:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8c78:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fa8c7c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8c80:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8c84:	d63f0200	blr	x16
   0x0000fffff7fa8c88:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8c8c:	54001140	b.eq	0xfffff7fa8eb4  // b.none
   0x0000fffff7fa8c90:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8c94:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8c98:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8c9c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8ca0:	d2800703	mov	x3, #0x38                  	// #56
   0x0000fffff7fa8ca4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8ca8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8cac:	d2869090	mov	x16, #0x3484                	// #13444
   0x0000fffff7fa8cb0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8cb4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8cb8:	d63f0200	blr	x16
   0x0000fffff7fa8cbc:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa8cc0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa8cc4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa8cc8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa8ccc:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fa8cd0:	d65f03c0	ret
   0x0000fffff7fa8cd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8cd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8cdc:	b900028a	str	w10, [x20]
   0x0000fffff7fa8ce0:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fa8ce4:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa8ce8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa8cec:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa8cf0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa8cf4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fa8cf8:	d65f03c0	ret
   0x0000fffff7fa8cfc:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fa8d00:	17fffff5	b	0xfffff7fa8cd4
   0x0000fffff7fa8d04:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fa8d08:	17fffff3	b	0xfffff7fa8cd4
   0x0000fffff7fa8d0c:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fa8d10:	17fffff1	b	0xfffff7fa8cd4
   0x0000fffff7fa8d14:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7fa8d18:	17ffffef	b	0xfffff7fa8cd4
   0x0000fffff7fa8d1c:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7fa8d20:	17ffffed	b	0xfffff7fa8cd4
   0x0000fffff7fa8d24:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fa8d28:	17ffffeb	b	0xfffff7fa8cd4
   0x0000fffff7fa8d2c:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fa8d30:	17ffffe9	b	0xfffff7fa8cd4
   0x0000fffff7fa8d34:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fa8d38:	17ffffe7	b	0xfffff7fa8cd4
   0x0000fffff7fa8d3c:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fa8d40:	17ffffe5	b	0xfffff7fa8cd4
   0x0000fffff7fa8d44:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fa8d48:	17ffffe3	b	0xfffff7fa8cd4
   0x0000fffff7fa8d4c:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fa8d50:	17ffffe1	b	0xfffff7fa8cd4
   0x0000fffff7fa8d54:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fa8d58:	17ffffdf	b	0xfffff7fa8cd4
   0x0000fffff7fa8d5c:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fa8d60:	17ffffdd	b	0xfffff7fa8cd4
   0x0000fffff7fa8d64:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fa8d68:	17ffffdb	b	0xfffff7fa8cd4
   0x0000fffff7fa8d6c:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fa8d70:	17ffffd9	b	0xfffff7fa8cd4
   0x0000fffff7fa8d74:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fa8d78:	17ffffd7	b	0xfffff7fa8cd4
   0x0000fffff7fa8d7c:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fa8d80:	17ffffd5	b	0xfffff7fa8cd4
   0x0000fffff7fa8d84:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fa8d88:	17ffffd3	b	0xfffff7fa8cd4
   0x0000fffff7fa8d8c:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fa8d90:	17ffffd1	b	0xfffff7fa8cd4
   0x0000fffff7fa8d94:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fa8d98:	17ffffcf	b	0xfffff7fa8cd4
   0x0000fffff7fa8d9c:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fa8da0:	17ffffcd	b	0xfffff7fa8cd4
   0x0000fffff7fa8da4:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fa8da8:	17ffffcb	b	0xfffff7fa8cd4
   0x0000fffff7fa8dac:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fa8db0:	17ffffc9	b	0xfffff7fa8cd4
   0x0000fffff7fa8db4:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fa8db8:	17ffffc7	b	0xfffff7fa8cd4
   0x0000fffff7fa8dbc:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fa8dc0:	17ffffc5	b	0xfffff7fa8cd4
   0x0000fffff7fa8dc4:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fa8dc8:	17ffffc3	b	0xfffff7fa8cd4
   0x0000fffff7fa8dcc:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fa8dd0:	17ffffc1	b	0xfffff7fa8cd4
   0x0000fffff7fa8dd4:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fa8dd8:	17ffffbf	b	0xfffff7fa8cd4
   0x0000fffff7fa8ddc:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fa8de0:	17ffffbd	b	0xfffff7fa8cd4
   0x0000fffff7fa8de4:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fa8de8:	17ffffbb	b	0xfffff7fa8cd4
   0x0000fffff7fa8dec:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fa8df0:	17ffffb9	b	0xfffff7fa8cd4
   0x0000fffff7fa8df4:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fa8df8:	17ffffb7	b	0xfffff7fa8cd4
   0x0000fffff7fa8dfc:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fa8e00:	17ffffb5	b	0xfffff7fa8cd4
   0x0000fffff7fa8e04:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fa8e08:	17ffffb3	b	0xfffff7fa8cd4
   0x0000fffff7fa8e0c:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fa8e10:	17ffffb1	b	0xfffff7fa8cd4
   0x0000fffff7fa8e14:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fa8e18:	17ffffaf	b	0xfffff7fa8cd4
   0x0000fffff7fa8e1c:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fa8e20:	17ffffad	b	0xfffff7fa8cd4
   0x0000fffff7fa8e24:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fa8e28:	17ffffab	b	0xfffff7fa8cd4
   0x0000fffff7fa8e2c:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fa8e30:	17ffffa9	b	0xfffff7fa8cd4
   0x0000fffff7fa8e34:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7fa8e38:	17ffffa7	b	0xfffff7fa8cd4
   0x0000fffff7fa8e3c:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fa8e40:	17ffffa5	b	0xfffff7fa8cd4
   0x0000fffff7fa8e44:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7fa8e48:	17ffffa3	b	0xfffff7fa8cd4
   0x0000fffff7fa8e4c:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7fa8e50:	17ffffa1	b	0xfffff7fa8cd4
   0x0000fffff7fa8e54:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7fa8e58:	17ffff9f	b	0xfffff7fa8cd4
   0x0000fffff7fa8e5c:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7fa8e60:	17ffff9d	b	0xfffff7fa8cd4
   0x0000fffff7fa8e64:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7fa8e68:	17ffff9b	b	0xfffff7fa8cd4
   0x0000fffff7fa8e6c:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7fa8e70:	17ffff99	b	0xfffff7fa8cd4
   0x0000fffff7fa8e74:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7fa8e78:	17ffff97	b	0xfffff7fa8cd4
   0x0000fffff7fa8e7c:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7fa8e80:	17ffff95	b	0xfffff7fa8cd4
   0x0000fffff7fa8e84:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7fa8e88:	17ffff93	b	0xfffff7fa8cd4
   0x0000fffff7fa8e8c:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7fa8e90:	17ffff91	b	0xfffff7fa8cd4
   0x0000fffff7fa8e94:	d2800669	mov	x9, #0x33                  	// #51
   0x0000fffff7fa8e98:	17ffff8f	b	0xfffff7fa8cd4
   0x0000fffff7fa8e9c:	d2800689	mov	x9, #0x34                  	// #52
   0x0000fffff7fa8ea0:	17ffff8d	b	0xfffff7fa8cd4
   0x0000fffff7fa8ea4:	d28006a9	mov	x9, #0x35                  	// #53
   0x0000fffff7fa8ea8:	17ffff8b	b	0xfffff7fa8cd4
   0x0000fffff7fa8eac:	d28006c9	mov	x9, #0x36                  	// #54
   0x0000fffff7fa8eb0:	17ffff89	b	0xfffff7fa8cd4
   0x0000fffff7fa8eb4:	d28006e9	mov	x9, #0x37                  	// #55
   0x0000fffff7fa8eb8:	17ffff87	b	0xfffff7fa8cd4
   0x0000fffff7fa8ebc:	00000000	udf	#0
   0x0000fffff7fa8ec0:	00000000	udf	#0
   0x0000fffff7fa8ec4:	00000000	udf	#0
   0x0000fffff7fa8ec8:	00000000	udf	#0
   0x0000fffff7fa8ecc:	00000000	udf	#0
   0x0000fffff7fa8ed0:	00000000	udf	#0
   0x0000fffff7fa8ed4:	00000000	udf	#0
   0x0000fffff7fa8ed8:	00000000	udf	#0
   0x0000fffff7fa8edc:	00000000	udf	#0
   0x0000fffff7fa8ee0:	00000000	udf	#0
   0x0000fffff7fa8ee4:	00000000	udf	#0
   0x0000fffff7fa8ee8:	00000000	udf	#0
   0x0000fffff7fa8eec:	00000000	udf	#0
   0x0000fffff7fa8ef0:	00000000	udf	#0
   0x0000fffff7fa8ef4:	00000000	udf	#0
   0x0000fffff7fa8ef8:	00000000	udf	#0
   0x0000fffff7fa8efc:	00000000	udf	#0
   0x0000fffff7fa8f00:	00000000	udf	#0
   0x0000fffff7fa8f04:	00000000	udf	#0
   0x0000fffff7fa8f08:	00000000	udf	#0
   0x0000fffff7fa8f0c:	00000000	udf	#0
   0x0000fffff7fa8f10:	00000000	udf	#0
   0x0000fffff7fa8f14:	00000000	udf	#0
   0x0000fffff7fa8f18:	00000000	udf	#0
   0x0000fffff7fa8f1c:	00000000	udf	#0
   0x0000fffff7fa8f20:	00000000	udf	#0
   0x0000fffff7fa8f24:	00000000	udf	#0
   0x0000fffff7fa8f28:	00000000	udf	#0
   0x0000fffff7fa8f2c:	00000000	udf	#0
   0x0000fffff7fa8f30:	00000000	udf	#0
   0x0000fffff7fa8f34:	00000000	udf	#0
   0x0000fffff7fa8f38:	00000000	udf	#0
   0x0000fffff7fa8f3c:	00000000	udf	#0
   0x0000fffff7fa8f40:	00000000	udf	#0
   0x0000fffff7fa8f44:	00000000	udf	#0
   0x0000fffff7fa8f48:	00000000	udf	#0
   0x0000fffff7fa8f4c:	00000000	udf	#0
   0x0000fffff7fa8f50:	00000000	udf	#0
   0x0000fffff7fa8f54:	00000000	udf	#0
   0x0000fffff7fa8f58:	00000000	udf	#0
   0x0000fffff7fa8f5c:	00000000	udf	#0
   0x0000fffff7fa8f60:	00000000	udf	#0
   0x0000fffff7fa8f64:	00000000	udf	#0
   0x0000fffff7fa8f68:	00000000	udf	#0
   0x0000fffff7fa8f6c:	00000000	udf	#0
   0x0000fffff7fa8f70:	00000000	udf	#0
   0x0000fffff7fa8f74:	00000000	udf	#0
   0x0000fffff7fa8f78:	00000000	udf	#0
   0x0000fffff7fa8f7c:	00000000	udf	#0
   0x0000fffff7fa8f80:	00000000	udf	#0
   0x0000fffff7fa8f84:	00000000	udf	#0
   0x0000fffff7fa8f88:	00000000	udf	#0
   0x0000fffff7fa8f8c:	00000000	udf	#0
   0x0000fffff7fa8f90:	00000000	udf	#0
   0x0000fffff7fa8f94:	00000000	udf	#0
   0x0000fffff7fa8f98:	00000000	udf	#0
   0x0000fffff7fa8f9c:	00000000	udf	#0
   0x0000fffff7fa8fa0:	00000000	udf	#0
   0x0000fffff7fa8fa4:	00000000	udf	#0
   0x0000fffff7fa8fa8:	00000000	udf	#0
   0x0000fffff7fa8fac:	00000000	udf	#0
   0x0000fffff7fa8fb0:	00000000	udf	#0
   0x0000fffff7fa8fb4:	00000000	udf	#0
   0x0000fffff7fa8fb8:	00000000	udf	#0
   0x0000fffff7fa8fbc:	00000000	udf	#0
   0x0000fffff7fa8fc0:	00000000	udf	#0
   0x0000fffff7fa8fc4:	00000000	udf	#0
   0x0000fffff7fa8fc8:	00000000	udf	#0
   0x0000fffff7fa8fcc:	00000000	udf	#0
   0x0000fffff7fa8fd0:	00000000	udf	#0
   0x0000fffff7fa8fd4:	00000000	udf	#0
   0x0000fffff7fa8fd8:	00000000	udf	#0
   0x0000fffff7fa8fdc:	00000000	udf	#0
   0x0000fffff7fa8fe0:	00000000	udf	#0
   0x0000fffff7fa8fe4:	00000000	udf	#0
   0x0000fffff7fa8fe8:	00000000	udf	#0
   0x0000fffff7fa8fec:	00000000	udf	#0
   0x0000fffff7fa8ff0:	00000000	udf	#0
   0x0000fffff7fa8ff4:	00000000	udf	#0
   0x0000fffff7fa8ff8:	00000000	udf	#0
   0x0000fffff7fa8ffc:	00000000	udf	#0
End of assembler dump.
