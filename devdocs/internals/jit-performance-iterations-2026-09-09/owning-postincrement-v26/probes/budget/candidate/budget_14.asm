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
   0x0000fffff7fa7058:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fa705c:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fa7060:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fa7064:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fa7068:	36d80211	tbz	w17, #27, 0xfffff7fa70a8
   0x0000fffff7fa706c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa7070:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa7074:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa7078:	540001e1	b.ne	0xfffff7fa70b4  // b.any
   0x0000fffff7fa707c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa7080:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa7084:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa7088:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa708c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa7090:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa7094:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa7098:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa709c:	540000c9	b.ls	0xfffff7fa70b4  // b.plast
   0x0000fffff7fa70a0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa70a4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa70a8:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa70ac:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa70b0:	1400000e	b	0xfffff7fa70e8
   0x0000fffff7fa70b4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa70b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa70bc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa70c0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa70c4:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fa70c8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa70cc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa70d0:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fa70d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa70d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa70dc:	d63f0200	blr	x16
   0x0000fffff7fa70e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa70e4:	5400ef60	b.eq	0xfffff7fa8ed0  // b.none
   0x0000fffff7fa70e8:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fa70ec:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fa70f0:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fa70f4:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa70f8:	36d80211	tbz	w17, #27, 0xfffff7fa7138
   0x0000fffff7fa70fc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa7100:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa7104:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa7108:	540001e1	b.ne	0xfffff7fa7144  // b.any
   0x0000fffff7fa710c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa7110:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa7114:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa7118:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa711c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa7120:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa7124:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa7128:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa712c:	540000c9	b.ls	0xfffff7fa7144  // b.plast
   0x0000fffff7fa7130:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa7134:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa7138:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa713c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa7140:	1400000e	b	0xfffff7fa7178
   0x0000fffff7fa7144:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa7148:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa714c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7150:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7154:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fa7158:	aa1403e4	mov	x4, x20
   0x0000fffff7fa715c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7160:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fa7164:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa7168:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa716c:	d63f0200	blr	x16
   0x0000fffff7fa7170:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7174:	5400eb20	b.eq	0xfffff7fa8ed8  // b.none
   0x0000fffff7fa7178:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa717c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7180:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7184:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7188:	54000421	b.ne	0xfffff7fa720c  // b.any
   0x0000fffff7fa718c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa7190:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7194:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7198:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa719c:	54000381	b.ne	0xfffff7fa720c  // b.any
   0x0000fffff7fa71a0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa71a4:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7fa71a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa71ac:	9a9fa7ec	cset	x12, lt	// lt = tstop
   0x0000fffff7fa71b0:	5280010d	mov	w13, #0x8                   	// #8
   0x0000fffff7fa71b4:	72a0200d	movk	w13, #0x100, lsl #16
   0x0000fffff7fa71b8:	91000580	add	x0, x12, #0x1
   0x0000fffff7fa71bc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa71c0:	36d80211	tbz	w17, #27, 0xfffff7fa7200
   0x0000fffff7fa71c4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa71c8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa71cc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa71d0:	540001e1	b.ne	0xfffff7fa720c  // b.any
   0x0000fffff7fa71d4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa71d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa71dc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa71e0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa71e4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa71e8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa71ec:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa71f0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa71f4:	540000c9	b.ls	0xfffff7fa720c  // b.plast
   0x0000fffff7fa71f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa71fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa7200:	f9005ecc	str	x12, [x22, #184]
   0x0000fffff7fa7204:	b900b2cd	str	w13, [x22, #176]
   0x0000fffff7fa7208:	1400000e	b	0xfffff7fa7240
   0x0000fffff7fa720c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa7210:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7214:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7218:	aa1503e2	mov	x2, x21
   0x0000fffff7fa721c:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fa7220:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7224:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7228:	d2909810	mov	x16, #0x84c0                	// #33984
   0x0000fffff7fa722c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7230:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7234:	d63f0200	blr	x16
   0x0000fffff7fa7238:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa723c:	5400e520	b.eq	0xfffff7fa8ee0  // b.none
   0x0000fffff7fa7240:	f100041f	cmp	x0, #0x1
   0x0000fffff7fa7244:	5400e100	b.eq	0xfffff7fa8e64  // b.none
   0x0000fffff7fa7248:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa724c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa7250:	d299c60c	mov	x12, #0xce30                	// #52784
   0x0000fffff7fa7254:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa7258:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa725c:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7fa7260:	36d801d1	tbz	w17, #27, 0xfffff7fa7298
   0x0000fffff7fa7264:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa7268:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa726c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa7270:	54000281	b.ne	0xfffff7fa72c0  // b.any
   0x0000fffff7fa7274:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa7278:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa727c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa7280:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa7284:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa7288:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa728c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa7290:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa7294:	54000169	b.ls	0xfffff7fa72c0  // b.plast
   0x0000fffff7fa7298:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa729c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa72a0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa72a4:	36d80091	tbz	w17, #27, 0xfffff7fa72b4
   0x0000fffff7fa72a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa72ac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa72b0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa72b4:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa72b8:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa72bc:	1400000e	b	0xfffff7fa72f4
   0x0000fffff7fa72c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa72c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa72c8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa72cc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa72d0:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7fa72d4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa72d8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa72dc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa72e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa72e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa72e8:	d63f0200	blr	x16
   0x0000fffff7fa72ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa72f0:	5400dfc0	b.eq	0xfffff7fa8ee8  // b.none
   0x0000fffff7fa72f4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa72f8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa72fc:	540003a0	b.eq	0xfffff7fa7370  // b.none
   0x0000fffff7fa7300:	b940426d	ldr	w13, [x19, #64]
   0x0000fffff7fa7304:	f940266c	ldr	x12, [x19, #72]
   0x0000fffff7fa7308:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa730c:	36d801d1	tbz	w17, #27, 0xfffff7fa7344
   0x0000fffff7fa7310:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa7314:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa7318:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa731c:	540002a1	b.ne	0xfffff7fa7370  // b.any
   0x0000fffff7fa7320:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa7324:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa7328:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa732c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa7330:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa7334:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa7338:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa733c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa7340:	54000189	b.ls	0xfffff7fa7370  // b.plast
   0x0000fffff7fa7344:	36d8008d	tbz	w13, #27, 0xfffff7fa7354
   0x0000fffff7fa7348:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa734c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa7350:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa7354:	36d80091	tbz	w17, #27, 0xfffff7fa7364
   0x0000fffff7fa7358:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa735c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa7360:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa7364:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa7368:	b900016d	str	w13, [x11]
   0x0000fffff7fa736c:	1400000e	b	0xfffff7fa73a4
   0x0000fffff7fa7370:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa7374:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7378:	aa1303e1	mov	x1, x19
   0x0000fffff7fa737c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7380:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7fa7384:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7388:	aa1603e5	mov	x5, x22
   0x0000fffff7fa738c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa7390:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa7394:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7398:	d63f0200	blr	x16
   0x0000fffff7fa739c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa73a0:	5400da80	b.eq	0xfffff7fa8ef0  // b.none
   0x0000fffff7fa73a4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa73a8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa73ac:	540004a0	b.eq	0xfffff7fa7440  // b.none
   0x0000fffff7fa73b0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa73b4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa73b8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa73bc:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa73c0:	54000400	b.eq	0xfffff7fa7440  // b.none
   0x0000fffff7fa73c4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa73c8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa73cc:	36d801d1	tbz	w17, #27, 0xfffff7fa7404
   0x0000fffff7fa73d0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa73d4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa73d8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa73dc:	54000321	b.ne	0xfffff7fa7440  // b.any
   0x0000fffff7fa73e0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa73e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa73e8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa73ec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa73f0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa73f4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa73f8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa73fc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa7400:	54000209	b.ls	0xfffff7fa7440  // b.plast
   0x0000fffff7fa7404:	36d8008d	tbz	w13, #27, 0xfffff7fa7414
   0x0000fffff7fa7408:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa740c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa7410:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa7414:	36d80091	tbz	w17, #27, 0xfffff7fa7424
   0x0000fffff7fa7418:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa741c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa7420:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa7424:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa7428:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa742c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa7430:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa7434:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa7438:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa743c:	1400000e	b	0xfffff7fa7474
   0x0000fffff7fa7440:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa7444:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7448:	aa1303e1	mov	x1, x19
   0x0000fffff7fa744c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7450:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fa7454:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7458:	aa1603e5	mov	x5, x22
   0x0000fffff7fa745c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa7460:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa7464:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7468:	d63f0200	blr	x16
   0x0000fffff7fa746c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7470:	5400d440	b.eq	0xfffff7fa8ef8  // b.none
   0x0000fffff7fa7474:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7478:	37d806a9	tbnz	w9, #27, 0xfffff7fa754c
   0x0000fffff7fa747c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7480:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7484:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7488:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa748c:	540001c1	b.ne	0xfffff7fa74c4  // b.any
   0x0000fffff7fa7490:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa7494:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7498:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa749c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa74a0:	54000121	b.ne	0xfffff7fa74c4  // b.any
   0x0000fffff7fa74a4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa74a8:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa74ac:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa74b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa74b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa74b8:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa74bc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa74c0:	14000030	b	0xfffff7fa7580
   0x0000fffff7fa74c4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa74c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa74cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa74d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa74d4:	54000120	b.eq	0xfffff7fa74f8  // b.none
   0x0000fffff7fa74d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa74dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa74e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa74e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa74e8:	54000321	b.ne	0xfffff7fa754c  // b.any
   0x0000fffff7fa74ec:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa74f0:	9e620120	scvtf	d0, x9
   0x0000fffff7fa74f4:	14000002	b	0xfffff7fa74fc
   0x0000fffff7fa74f8:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa74fc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa7500:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7504:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7508:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa750c:	54000120	b.eq	0xfffff7fa7530  // b.none
   0x0000fffff7fa7510:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa7514:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7518:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa751c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7520:	54000161	b.ne	0xfffff7fa754c  // b.any
   0x0000fffff7fa7524:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa7528:	9e620121	scvtf	d1, x9
   0x0000fffff7fa752c:	14000002	b	0xfffff7fa7534
   0x0000fffff7fa7530:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa7534:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa7538:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa753c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7540:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7544:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa7548:	17ffffde	b	0xfffff7fa74c0
   0x0000fffff7fa754c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa7550:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7554:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7558:	aa1503e2	mov	x2, x21
   0x0000fffff7fa755c:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fa7560:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7564:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7568:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa756c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7570:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7574:	d63f0200	blr	x16
   0x0000fffff7fa7578:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa757c:	5400cc20	b.eq	0xfffff7fa8f00  // b.none
   0x0000fffff7fa7580:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa7584:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa7588:	540004a0	b.eq	0xfffff7fa761c  // b.none
   0x0000fffff7fa758c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa7590:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa7594:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa7598:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa759c:	54000400	b.eq	0xfffff7fa761c  // b.none
   0x0000fffff7fa75a0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa75a4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa75a8:	36d801d1	tbz	w17, #27, 0xfffff7fa75e0
   0x0000fffff7fa75ac:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa75b0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa75b4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa75b8:	54000321	b.ne	0xfffff7fa761c  // b.any
   0x0000fffff7fa75bc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa75c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa75c4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa75c8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa75cc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa75d0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa75d4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa75d8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa75dc:	54000209	b.ls	0xfffff7fa761c  // b.plast
   0x0000fffff7fa75e0:	36d8008d	tbz	w13, #27, 0xfffff7fa75f0
   0x0000fffff7fa75e4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa75e8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa75ec:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa75f0:	36d80091	tbz	w17, #27, 0xfffff7fa7600
   0x0000fffff7fa75f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa75f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa75fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa7600:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa7604:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa7608:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa760c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa7610:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa7614:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa7618:	1400000e	b	0xfffff7fa7650
   0x0000fffff7fa761c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa7620:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7624:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7628:	aa1503e2	mov	x2, x21
   0x0000fffff7fa762c:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fa7630:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7634:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7638:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa763c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa7640:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7644:	d63f0200	blr	x16
   0x0000fffff7fa7648:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa764c:	5400c5e0	b.eq	0xfffff7fa8f08  // b.none
   0x0000fffff7fa7650:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7654:	37d806a9	tbnz	w9, #27, 0xfffff7fa7728
   0x0000fffff7fa7658:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa765c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7660:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7664:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7668:	540001c1	b.ne	0xfffff7fa76a0  // b.any
   0x0000fffff7fa766c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa7670:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7674:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7678:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa767c:	54000121	b.ne	0xfffff7fa76a0  // b.any
   0x0000fffff7fa7680:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa7684:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa7688:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa768c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7690:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7694:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa7698:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa769c:	14000030	b	0xfffff7fa775c
   0x0000fffff7fa76a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa76a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa76a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa76ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa76b0:	54000120	b.eq	0xfffff7fa76d4  // b.none
   0x0000fffff7fa76b4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa76b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa76bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa76c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa76c4:	54000321	b.ne	0xfffff7fa7728  // b.any
   0x0000fffff7fa76c8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa76cc:	9e620120	scvtf	d0, x9
   0x0000fffff7fa76d0:	14000002	b	0xfffff7fa76d8
   0x0000fffff7fa76d4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa76d8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa76dc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa76e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa76e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa76e8:	54000120	b.eq	0xfffff7fa770c  // b.none
   0x0000fffff7fa76ec:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa76f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa76f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa76f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa76fc:	54000161	b.ne	0xfffff7fa7728  // b.any
   0x0000fffff7fa7700:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa7704:	9e620121	scvtf	d1, x9
   0x0000fffff7fa7708:	14000002	b	0xfffff7fa7710
   0x0000fffff7fa770c:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa7710:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa7714:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa7718:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa771c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7720:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa7724:	17ffffde	b	0xfffff7fa769c
   0x0000fffff7fa7728:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa772c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7730:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7734:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7738:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fa773c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7740:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7744:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa7748:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa774c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7750:	d63f0200	blr	x16
   0x0000fffff7fa7754:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7758:	5400bdc0	b.eq	0xfffff7fa8f10  // b.none
   0x0000fffff7fa775c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa7760:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa7764:	540004a0	b.eq	0xfffff7fa77f8  // b.none
   0x0000fffff7fa7768:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa776c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa7770:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa7774:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa7778:	54000400	b.eq	0xfffff7fa77f8  // b.none
   0x0000fffff7fa777c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa7780:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa7784:	36d801d1	tbz	w17, #27, 0xfffff7fa77bc
   0x0000fffff7fa7788:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa778c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa7790:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa7794:	54000321	b.ne	0xfffff7fa77f8  // b.any
   0x0000fffff7fa7798:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa779c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa77a0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa77a4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa77a8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa77ac:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa77b0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa77b4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa77b8:	54000209	b.ls	0xfffff7fa77f8  // b.plast
   0x0000fffff7fa77bc:	36d8008d	tbz	w13, #27, 0xfffff7fa77cc
   0x0000fffff7fa77c0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa77c4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa77c8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa77cc:	36d80091	tbz	w17, #27, 0xfffff7fa77dc
   0x0000fffff7fa77d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa77d4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa77d8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa77dc:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa77e0:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa77e4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa77e8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa77ec:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa77f0:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa77f4:	1400000e	b	0xfffff7fa782c
   0x0000fffff7fa77f8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa77fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7800:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7804:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7808:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fa780c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7810:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7814:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa7818:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa781c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7820:	d63f0200	blr	x16
   0x0000fffff7fa7824:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7828:	5400b780	b.eq	0xfffff7fa8f18  // b.none
   0x0000fffff7fa782c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7830:	37d806a9	tbnz	w9, #27, 0xfffff7fa7904
   0x0000fffff7fa7834:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7838:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa783c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7840:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7844:	540001c1	b.ne	0xfffff7fa787c  // b.any
   0x0000fffff7fa7848:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa784c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7850:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7854:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7858:	54000121	b.ne	0xfffff7fa787c  // b.any
   0x0000fffff7fa785c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa7860:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa7864:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa7868:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa786c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7870:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa7874:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa7878:	14000030	b	0xfffff7fa7938
   0x0000fffff7fa787c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7880:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7884:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7888:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa788c:	54000120	b.eq	0xfffff7fa78b0  // b.none
   0x0000fffff7fa7890:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7894:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7898:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa789c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa78a0:	54000321	b.ne	0xfffff7fa7904  // b.any
   0x0000fffff7fa78a4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa78a8:	9e620120	scvtf	d0, x9
   0x0000fffff7fa78ac:	14000002	b	0xfffff7fa78b4
   0x0000fffff7fa78b0:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa78b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa78b8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa78bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa78c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa78c4:	54000120	b.eq	0xfffff7fa78e8  // b.none
   0x0000fffff7fa78c8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa78cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa78d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa78d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa78d8:	54000161	b.ne	0xfffff7fa7904  // b.any
   0x0000fffff7fa78dc:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa78e0:	9e620121	scvtf	d1, x9
   0x0000fffff7fa78e4:	14000002	b	0xfffff7fa78ec
   0x0000fffff7fa78e8:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa78ec:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa78f0:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa78f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa78f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa78fc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa7900:	17ffffde	b	0xfffff7fa7878
   0x0000fffff7fa7904:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa7908:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa790c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7910:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7914:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fa7918:	aa1403e4	mov	x4, x20
   0x0000fffff7fa791c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7920:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa7924:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7928:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa792c:	d63f0200	blr	x16
   0x0000fffff7fa7930:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7934:	5400af60	b.eq	0xfffff7fa8f20  // b.none
   0x0000fffff7fa7938:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa793c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa7940:	540004a0	b.eq	0xfffff7fa79d4  // b.none
   0x0000fffff7fa7944:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa7948:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa794c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa7950:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa7954:	54000400	b.eq	0xfffff7fa79d4  // b.none
   0x0000fffff7fa7958:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa795c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa7960:	36d801d1	tbz	w17, #27, 0xfffff7fa7998
   0x0000fffff7fa7964:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa7968:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa796c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa7970:	54000321	b.ne	0xfffff7fa79d4  // b.any
   0x0000fffff7fa7974:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa7978:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa797c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa7980:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa7984:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa7988:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa798c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa7990:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa7994:	54000209	b.ls	0xfffff7fa79d4  // b.plast
   0x0000fffff7fa7998:	36d8008d	tbz	w13, #27, 0xfffff7fa79a8
   0x0000fffff7fa799c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa79a0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa79a4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa79a8:	36d80091	tbz	w17, #27, 0xfffff7fa79b8
   0x0000fffff7fa79ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa79b0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa79b4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa79b8:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa79bc:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa79c0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa79c4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa79c8:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa79cc:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa79d0:	1400000e	b	0xfffff7fa7a08
   0x0000fffff7fa79d4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa79d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa79dc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa79e0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa79e4:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fa79e8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa79ec:	aa1603e5	mov	x5, x22
   0x0000fffff7fa79f0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa79f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa79f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa79fc:	d63f0200	blr	x16
   0x0000fffff7fa7a00:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7a04:	5400a920	b.eq	0xfffff7fa8f28  // b.none
   0x0000fffff7fa7a08:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7a0c:	37d806a9	tbnz	w9, #27, 0xfffff7fa7ae0
   0x0000fffff7fa7a10:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7a14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7a18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7a1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7a20:	540001c1	b.ne	0xfffff7fa7a58  // b.any
   0x0000fffff7fa7a24:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa7a28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7a2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7a30:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7a34:	54000121	b.ne	0xfffff7fa7a58  // b.any
   0x0000fffff7fa7a38:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa7a3c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa7a40:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa7a44:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7a48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7a4c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa7a50:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa7a54:	14000030	b	0xfffff7fa7b14
   0x0000fffff7fa7a58:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7a5c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7a60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7a64:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7a68:	54000120	b.eq	0xfffff7fa7a8c  // b.none
   0x0000fffff7fa7a6c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7a70:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7a74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7a78:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7a7c:	54000321	b.ne	0xfffff7fa7ae0  // b.any
   0x0000fffff7fa7a80:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa7a84:	9e620120	scvtf	d0, x9
   0x0000fffff7fa7a88:	14000002	b	0xfffff7fa7a90
   0x0000fffff7fa7a8c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa7a90:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa7a94:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7a98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7a9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7aa0:	54000120	b.eq	0xfffff7fa7ac4  // b.none
   0x0000fffff7fa7aa4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa7aa8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7aac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7ab0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7ab4:	54000161	b.ne	0xfffff7fa7ae0  // b.any
   0x0000fffff7fa7ab8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa7abc:	9e620121	scvtf	d1, x9
   0x0000fffff7fa7ac0:	14000002	b	0xfffff7fa7ac8
   0x0000fffff7fa7ac4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa7ac8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa7acc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa7ad0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7ad4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7ad8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa7adc:	17ffffde	b	0xfffff7fa7a54
   0x0000fffff7fa7ae0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa7ae4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7ae8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7aec:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7af0:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fa7af4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7af8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7afc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa7b00:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7b04:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7b08:	d63f0200	blr	x16
   0x0000fffff7fa7b0c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7b10:	5400a100	b.eq	0xfffff7fa8f30  // b.none
   0x0000fffff7fa7b14:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa7b18:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa7b1c:	540004a0	b.eq	0xfffff7fa7bb0  // b.none
   0x0000fffff7fa7b20:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa7b24:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa7b28:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa7b2c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa7b30:	54000400	b.eq	0xfffff7fa7bb0  // b.none
   0x0000fffff7fa7b34:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa7b38:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa7b3c:	36d801d1	tbz	w17, #27, 0xfffff7fa7b74
   0x0000fffff7fa7b40:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa7b44:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa7b48:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa7b4c:	54000321	b.ne	0xfffff7fa7bb0  // b.any
   0x0000fffff7fa7b50:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa7b54:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa7b58:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa7b5c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa7b60:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa7b64:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa7b68:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa7b6c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa7b70:	54000209	b.ls	0xfffff7fa7bb0  // b.plast
   0x0000fffff7fa7b74:	36d8008d	tbz	w13, #27, 0xfffff7fa7b84
   0x0000fffff7fa7b78:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa7b7c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa7b80:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa7b84:	36d80091	tbz	w17, #27, 0xfffff7fa7b94
   0x0000fffff7fa7b88:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa7b8c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa7b90:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa7b94:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa7b98:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa7b9c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa7ba0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa7ba4:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa7ba8:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa7bac:	1400000e	b	0xfffff7fa7be4
   0x0000fffff7fa7bb0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa7bb4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7bb8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7bbc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7bc0:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fa7bc4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7bc8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7bcc:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa7bd0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa7bd4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7bd8:	d63f0200	blr	x16
   0x0000fffff7fa7bdc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7be0:	54009ac0	b.eq	0xfffff7fa8f38  // b.none
   0x0000fffff7fa7be4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7be8:	37d806a9	tbnz	w9, #27, 0xfffff7fa7cbc
   0x0000fffff7fa7bec:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7bf0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7bf4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7bf8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7bfc:	540001c1	b.ne	0xfffff7fa7c34  // b.any
   0x0000fffff7fa7c00:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa7c04:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7c08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7c0c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7c10:	54000121	b.ne	0xfffff7fa7c34  // b.any
   0x0000fffff7fa7c14:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa7c18:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa7c1c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa7c20:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7c24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7c28:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa7c2c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa7c30:	14000030	b	0xfffff7fa7cf0
   0x0000fffff7fa7c34:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7c38:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7c3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7c40:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7c44:	54000120	b.eq	0xfffff7fa7c68  // b.none
   0x0000fffff7fa7c48:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7c4c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7c50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7c54:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7c58:	54000321	b.ne	0xfffff7fa7cbc  // b.any
   0x0000fffff7fa7c5c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa7c60:	9e620120	scvtf	d0, x9
   0x0000fffff7fa7c64:	14000002	b	0xfffff7fa7c6c
   0x0000fffff7fa7c68:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa7c6c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa7c70:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7c74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7c78:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7c7c:	54000120	b.eq	0xfffff7fa7ca0  // b.none
   0x0000fffff7fa7c80:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa7c84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7c88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7c8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7c90:	54000161	b.ne	0xfffff7fa7cbc  // b.any
   0x0000fffff7fa7c94:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa7c98:	9e620121	scvtf	d1, x9
   0x0000fffff7fa7c9c:	14000002	b	0xfffff7fa7ca4
   0x0000fffff7fa7ca0:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa7ca4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa7ca8:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa7cac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7cb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7cb4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa7cb8:	17ffffde	b	0xfffff7fa7c30
   0x0000fffff7fa7cbc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa7cc0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7cc4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7cc8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7ccc:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fa7cd0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7cd4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7cd8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa7cdc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7ce0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7ce4:	d63f0200	blr	x16
   0x0000fffff7fa7ce8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7cec:	540092a0	b.eq	0xfffff7fa8f40  // b.none
   0x0000fffff7fa7cf0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa7cf4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa7cf8:	540004a0	b.eq	0xfffff7fa7d8c  // b.none
   0x0000fffff7fa7cfc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa7d00:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa7d04:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa7d08:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa7d0c:	54000400	b.eq	0xfffff7fa7d8c  // b.none
   0x0000fffff7fa7d10:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa7d14:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa7d18:	36d801d1	tbz	w17, #27, 0xfffff7fa7d50
   0x0000fffff7fa7d1c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa7d20:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa7d24:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa7d28:	54000321	b.ne	0xfffff7fa7d8c  // b.any
   0x0000fffff7fa7d2c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa7d30:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa7d34:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa7d38:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa7d3c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa7d40:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa7d44:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa7d48:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa7d4c:	54000209	b.ls	0xfffff7fa7d8c  // b.plast
   0x0000fffff7fa7d50:	36d8008d	tbz	w13, #27, 0xfffff7fa7d60
   0x0000fffff7fa7d54:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa7d58:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa7d5c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa7d60:	36d80091	tbz	w17, #27, 0xfffff7fa7d70
   0x0000fffff7fa7d64:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa7d68:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa7d6c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa7d70:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa7d74:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa7d78:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa7d7c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa7d80:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa7d84:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa7d88:	1400000e	b	0xfffff7fa7dc0
   0x0000fffff7fa7d8c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa7d90:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7d94:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7d98:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7d9c:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fa7da0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7da4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7da8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa7dac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa7db0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7db4:	d63f0200	blr	x16
   0x0000fffff7fa7db8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7dbc:	54008c60	b.eq	0xfffff7fa8f48  // b.none
   0x0000fffff7fa7dc0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7dc4:	37d806a9	tbnz	w9, #27, 0xfffff7fa7e98
   0x0000fffff7fa7dc8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7dcc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7dd0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7dd4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7dd8:	540001c1	b.ne	0xfffff7fa7e10  // b.any
   0x0000fffff7fa7ddc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa7de0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7de4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7de8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7dec:	54000121	b.ne	0xfffff7fa7e10  // b.any
   0x0000fffff7fa7df0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa7df4:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa7df8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa7dfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7e00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7e04:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa7e08:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa7e0c:	14000030	b	0xfffff7fa7ecc
   0x0000fffff7fa7e10:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7e14:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7e18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7e1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7e20:	54000120	b.eq	0xfffff7fa7e44  // b.none
   0x0000fffff7fa7e24:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7e28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7e2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7e30:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7e34:	54000321	b.ne	0xfffff7fa7e98  // b.any
   0x0000fffff7fa7e38:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa7e3c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa7e40:	14000002	b	0xfffff7fa7e48
   0x0000fffff7fa7e44:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa7e48:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa7e4c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7e50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7e54:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7e58:	54000120	b.eq	0xfffff7fa7e7c  // b.none
   0x0000fffff7fa7e5c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa7e60:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7e64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7e68:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7e6c:	54000161	b.ne	0xfffff7fa7e98  // b.any
   0x0000fffff7fa7e70:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa7e74:	9e620121	scvtf	d1, x9
   0x0000fffff7fa7e78:	14000002	b	0xfffff7fa7e80
   0x0000fffff7fa7e7c:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa7e80:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa7e84:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa7e88:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7e8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7e90:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa7e94:	17ffffde	b	0xfffff7fa7e0c
   0x0000fffff7fa7e98:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa7e9c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7ea0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7ea4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7ea8:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fa7eac:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7eb0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7eb4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa7eb8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7ebc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7ec0:	d63f0200	blr	x16
   0x0000fffff7fa7ec4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7ec8:	54008440	b.eq	0xfffff7fa8f50  // b.none
   0x0000fffff7fa7ecc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa7ed0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa7ed4:	540004a0	b.eq	0xfffff7fa7f68  // b.none
   0x0000fffff7fa7ed8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa7edc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa7ee0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa7ee4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa7ee8:	54000400	b.eq	0xfffff7fa7f68  // b.none
   0x0000fffff7fa7eec:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa7ef0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa7ef4:	36d801d1	tbz	w17, #27, 0xfffff7fa7f2c
   0x0000fffff7fa7ef8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa7efc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa7f00:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa7f04:	54000321	b.ne	0xfffff7fa7f68  // b.any
   0x0000fffff7fa7f08:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa7f0c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa7f10:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa7f14:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa7f18:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa7f1c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa7f20:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa7f24:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa7f28:	54000209	b.ls	0xfffff7fa7f68  // b.plast
   0x0000fffff7fa7f2c:	36d8008d	tbz	w13, #27, 0xfffff7fa7f3c
   0x0000fffff7fa7f30:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa7f34:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa7f38:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa7f3c:	36d80091	tbz	w17, #27, 0xfffff7fa7f4c
   0x0000fffff7fa7f40:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa7f44:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa7f48:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa7f4c:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa7f50:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa7f54:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa7f58:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa7f5c:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa7f60:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa7f64:	1400000e	b	0xfffff7fa7f9c
   0x0000fffff7fa7f68:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa7f6c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7f70:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7f74:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7f78:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fa7f7c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7f80:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7f84:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa7f88:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa7f8c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7f90:	d63f0200	blr	x16
   0x0000fffff7fa7f94:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7f98:	54007e00	b.eq	0xfffff7fa8f58  // b.none
   0x0000fffff7fa7f9c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7fa0:	37d806a9	tbnz	w9, #27, 0xfffff7fa8074
   0x0000fffff7fa7fa4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7fa8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7fac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7fb0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7fb4:	540001c1	b.ne	0xfffff7fa7fec  // b.any
   0x0000fffff7fa7fb8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa7fbc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7fc0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7fc4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7fc8:	54000121	b.ne	0xfffff7fa7fec  // b.any
   0x0000fffff7fa7fcc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa7fd0:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa7fd4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa7fd8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7fdc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7fe0:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa7fe4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa7fe8:	14000030	b	0xfffff7fa80a8
   0x0000fffff7fa7fec:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7ff0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7ff4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7ff8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7ffc:	54000120	b.eq	0xfffff7fa8020  // b.none
   0x0000fffff7fa8000:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8004:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8008:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa800c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8010:	54000321	b.ne	0xfffff7fa8074  // b.any
   0x0000fffff7fa8014:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa8018:	9e620120	scvtf	d0, x9
   0x0000fffff7fa801c:	14000002	b	0xfffff7fa8024
   0x0000fffff7fa8020:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa8024:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa8028:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa802c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8030:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8034:	54000120	b.eq	0xfffff7fa8058  // b.none
   0x0000fffff7fa8038:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa803c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8040:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8044:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8048:	54000161	b.ne	0xfffff7fa8074  // b.any
   0x0000fffff7fa804c:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa8050:	9e620121	scvtf	d1, x9
   0x0000fffff7fa8054:	14000002	b	0xfffff7fa805c
   0x0000fffff7fa8058:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa805c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa8060:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa8064:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8068:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa806c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa8070:	17ffffde	b	0xfffff7fa7fe8
   0x0000fffff7fa8074:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8078:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa807c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8080:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8084:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fa8088:	aa1403e4	mov	x4, x20
   0x0000fffff7fa808c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8090:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa8094:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8098:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa809c:	d63f0200	blr	x16
   0x0000fffff7fa80a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa80a4:	540075e0	b.eq	0xfffff7fa8f60  // b.none
   0x0000fffff7fa80a8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa80ac:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa80b0:	540004a0	b.eq	0xfffff7fa8144  // b.none
   0x0000fffff7fa80b4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa80b8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa80bc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa80c0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa80c4:	54000400	b.eq	0xfffff7fa8144  // b.none
   0x0000fffff7fa80c8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa80cc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa80d0:	36d801d1	tbz	w17, #27, 0xfffff7fa8108
   0x0000fffff7fa80d4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa80d8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa80dc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa80e0:	54000321	b.ne	0xfffff7fa8144  // b.any
   0x0000fffff7fa80e4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa80e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa80ec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa80f0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa80f4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa80f8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa80fc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa8100:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8104:	54000209	b.ls	0xfffff7fa8144  // b.plast
   0x0000fffff7fa8108:	36d8008d	tbz	w13, #27, 0xfffff7fa8118
   0x0000fffff7fa810c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa8110:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa8114:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa8118:	36d80091	tbz	w17, #27, 0xfffff7fa8128
   0x0000fffff7fa811c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8120:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8124:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa8128:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa812c:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa8130:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa8134:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa8138:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa813c:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa8140:	1400000e	b	0xfffff7fa8178
   0x0000fffff7fa8144:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa8148:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa814c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8150:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8154:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fa8158:	aa1403e4	mov	x4, x20
   0x0000fffff7fa815c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8160:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa8164:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8168:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa816c:	d63f0200	blr	x16
   0x0000fffff7fa8170:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8174:	54006fa0	b.eq	0xfffff7fa8f68  // b.none
   0x0000fffff7fa8178:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa817c:	37d806a9	tbnz	w9, #27, 0xfffff7fa8250
   0x0000fffff7fa8180:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8184:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8188:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa818c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8190:	540001c1	b.ne	0xfffff7fa81c8  // b.any
   0x0000fffff7fa8194:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa8198:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa819c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa81a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa81a4:	54000121	b.ne	0xfffff7fa81c8  // b.any
   0x0000fffff7fa81a8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa81ac:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa81b0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa81b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa81b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa81bc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa81c0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa81c4:	14000030	b	0xfffff7fa8284
   0x0000fffff7fa81c8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa81cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa81d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa81d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa81d8:	54000120	b.eq	0xfffff7fa81fc  // b.none
   0x0000fffff7fa81dc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa81e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa81e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa81e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa81ec:	54000321	b.ne	0xfffff7fa8250  // b.any
   0x0000fffff7fa81f0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa81f4:	9e620120	scvtf	d0, x9
   0x0000fffff7fa81f8:	14000002	b	0xfffff7fa8200
   0x0000fffff7fa81fc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa8200:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa8204:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8208:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa820c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8210:	54000120	b.eq	0xfffff7fa8234  // b.none
   0x0000fffff7fa8214:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa8218:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa821c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8220:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8224:	54000161	b.ne	0xfffff7fa8250  // b.any
   0x0000fffff7fa8228:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa822c:	9e620121	scvtf	d1, x9
   0x0000fffff7fa8230:	14000002	b	0xfffff7fa8238
   0x0000fffff7fa8234:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa8238:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa823c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa8240:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8244:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8248:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa824c:	17ffffde	b	0xfffff7fa81c4
   0x0000fffff7fa8250:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8254:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8258:	aa1303e1	mov	x1, x19
   0x0000fffff7fa825c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8260:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fa8264:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8268:	aa1603e5	mov	x5, x22
   0x0000fffff7fa826c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa8270:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8274:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8278:	d63f0200	blr	x16
   0x0000fffff7fa827c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8280:	54006780	b.eq	0xfffff7fa8f70  // b.none
   0x0000fffff7fa8284:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa8288:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa828c:	540004a0	b.eq	0xfffff7fa8320  // b.none
   0x0000fffff7fa8290:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa8294:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa8298:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa829c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa82a0:	54000400	b.eq	0xfffff7fa8320  // b.none
   0x0000fffff7fa82a4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa82a8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa82ac:	36d801d1	tbz	w17, #27, 0xfffff7fa82e4
   0x0000fffff7fa82b0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa82b4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa82b8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa82bc:	54000321	b.ne	0xfffff7fa8320  // b.any
   0x0000fffff7fa82c0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa82c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa82c8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa82cc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa82d0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa82d4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa82d8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa82dc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa82e0:	54000209	b.ls	0xfffff7fa8320  // b.plast
   0x0000fffff7fa82e4:	36d8008d	tbz	w13, #27, 0xfffff7fa82f4
   0x0000fffff7fa82e8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa82ec:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa82f0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa82f4:	36d80091	tbz	w17, #27, 0xfffff7fa8304
   0x0000fffff7fa82f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa82fc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8300:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa8304:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa8308:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa830c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa8310:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa8314:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa8318:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa831c:	1400000e	b	0xfffff7fa8354
   0x0000fffff7fa8320:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa8324:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8328:	aa1303e1	mov	x1, x19
   0x0000fffff7fa832c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8330:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fa8334:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8338:	aa1603e5	mov	x5, x22
   0x0000fffff7fa833c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa8340:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8344:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8348:	d63f0200	blr	x16
   0x0000fffff7fa834c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8350:	54006140	b.eq	0xfffff7fa8f78  // b.none
   0x0000fffff7fa8354:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8358:	37d806a9	tbnz	w9, #27, 0xfffff7fa842c
   0x0000fffff7fa835c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8360:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8364:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8368:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa836c:	540001c1	b.ne	0xfffff7fa83a4  // b.any
   0x0000fffff7fa8370:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa8374:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8378:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa837c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8380:	54000121	b.ne	0xfffff7fa83a4  // b.any
   0x0000fffff7fa8384:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa8388:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa838c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa8390:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8394:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8398:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa839c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa83a0:	14000030	b	0xfffff7fa8460
   0x0000fffff7fa83a4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa83a8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa83ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa83b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa83b4:	54000120	b.eq	0xfffff7fa83d8  // b.none
   0x0000fffff7fa83b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa83bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa83c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa83c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa83c8:	54000321	b.ne	0xfffff7fa842c  // b.any
   0x0000fffff7fa83cc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa83d0:	9e620120	scvtf	d0, x9
   0x0000fffff7fa83d4:	14000002	b	0xfffff7fa83dc
   0x0000fffff7fa83d8:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa83dc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa83e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa83e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa83e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa83ec:	54000120	b.eq	0xfffff7fa8410  // b.none
   0x0000fffff7fa83f0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa83f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa83f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa83fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8400:	54000161	b.ne	0xfffff7fa842c  // b.any
   0x0000fffff7fa8404:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa8408:	9e620121	scvtf	d1, x9
   0x0000fffff7fa840c:	14000002	b	0xfffff7fa8414
   0x0000fffff7fa8410:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa8414:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa8418:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa841c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8420:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8424:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa8428:	17ffffde	b	0xfffff7fa83a0
   0x0000fffff7fa842c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8430:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8434:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8438:	aa1503e2	mov	x2, x21
   0x0000fffff7fa843c:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fa8440:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8444:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8448:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa844c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8450:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8454:	d63f0200	blr	x16
   0x0000fffff7fa8458:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa845c:	54005920	b.eq	0xfffff7fa8f80  // b.none
   0x0000fffff7fa8460:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa8464:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa8468:	540004a0	b.eq	0xfffff7fa84fc  // b.none
   0x0000fffff7fa846c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa8470:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa8474:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa8478:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa847c:	54000400	b.eq	0xfffff7fa84fc  // b.none
   0x0000fffff7fa8480:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa8484:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa8488:	36d801d1	tbz	w17, #27, 0xfffff7fa84c0
   0x0000fffff7fa848c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8490:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8494:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa8498:	54000321	b.ne	0xfffff7fa84fc  // b.any
   0x0000fffff7fa849c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa84a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa84a4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa84a8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa84ac:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa84b0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa84b4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa84b8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa84bc:	54000209	b.ls	0xfffff7fa84fc  // b.plast
   0x0000fffff7fa84c0:	36d8008d	tbz	w13, #27, 0xfffff7fa84d0
   0x0000fffff7fa84c4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa84c8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa84cc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa84d0:	36d80091	tbz	w17, #27, 0xfffff7fa84e0
   0x0000fffff7fa84d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa84d8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa84dc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa84e0:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa84e4:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa84e8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa84ec:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa84f0:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa84f4:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa84f8:	1400000e	b	0xfffff7fa8530
   0x0000fffff7fa84fc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa8500:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8504:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8508:	aa1503e2	mov	x2, x21
   0x0000fffff7fa850c:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fa8510:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8514:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8518:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa851c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8520:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8524:	d63f0200	blr	x16
   0x0000fffff7fa8528:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa852c:	540052e0	b.eq	0xfffff7fa8f88  // b.none
   0x0000fffff7fa8530:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8534:	37d806a9	tbnz	w9, #27, 0xfffff7fa8608
   0x0000fffff7fa8538:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa853c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8540:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8544:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8548:	540001c1	b.ne	0xfffff7fa8580  // b.any
   0x0000fffff7fa854c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa8550:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8554:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8558:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa855c:	54000121	b.ne	0xfffff7fa8580  // b.any
   0x0000fffff7fa8560:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa8564:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa8568:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa856c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8570:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8574:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa8578:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa857c:	14000030	b	0xfffff7fa863c
   0x0000fffff7fa8580:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8584:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8588:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa858c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8590:	54000120	b.eq	0xfffff7fa85b4  // b.none
   0x0000fffff7fa8594:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8598:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa859c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa85a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa85a4:	54000321	b.ne	0xfffff7fa8608  // b.any
   0x0000fffff7fa85a8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa85ac:	9e620120	scvtf	d0, x9
   0x0000fffff7fa85b0:	14000002	b	0xfffff7fa85b8
   0x0000fffff7fa85b4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa85b8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa85bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa85c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa85c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa85c8:	54000120	b.eq	0xfffff7fa85ec  // b.none
   0x0000fffff7fa85cc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa85d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa85d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa85d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa85dc:	54000161	b.ne	0xfffff7fa8608  // b.any
   0x0000fffff7fa85e0:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa85e4:	9e620121	scvtf	d1, x9
   0x0000fffff7fa85e8:	14000002	b	0xfffff7fa85f0
   0x0000fffff7fa85ec:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa85f0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa85f4:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa85f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa85fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8600:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa8604:	17ffffde	b	0xfffff7fa857c
   0x0000fffff7fa8608:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa860c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8610:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8614:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8618:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fa861c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8620:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8624:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa8628:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa862c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8630:	d63f0200	blr	x16
   0x0000fffff7fa8634:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8638:	54004ac0	b.eq	0xfffff7fa8f90  // b.none
   0x0000fffff7fa863c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa8640:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa8644:	540004a0	b.eq	0xfffff7fa86d8  // b.none
   0x0000fffff7fa8648:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa864c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa8650:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa8654:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa8658:	54000400	b.eq	0xfffff7fa86d8  // b.none
   0x0000fffff7fa865c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa8660:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa8664:	36d801d1	tbz	w17, #27, 0xfffff7fa869c
   0x0000fffff7fa8668:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa866c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8670:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa8674:	54000321	b.ne	0xfffff7fa86d8  // b.any
   0x0000fffff7fa8678:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa867c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8680:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa8684:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8688:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa868c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8690:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa8694:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8698:	54000209	b.ls	0xfffff7fa86d8  // b.plast
   0x0000fffff7fa869c:	36d8008d	tbz	w13, #27, 0xfffff7fa86ac
   0x0000fffff7fa86a0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa86a4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa86a8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa86ac:	36d80091	tbz	w17, #27, 0xfffff7fa86bc
   0x0000fffff7fa86b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa86b4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa86b8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa86bc:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa86c0:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa86c4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa86c8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa86cc:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa86d0:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa86d4:	1400000e	b	0xfffff7fa870c
   0x0000fffff7fa86d8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa86dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa86e0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa86e4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa86e8:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fa86ec:	aa1403e4	mov	x4, x20
   0x0000fffff7fa86f0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa86f4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa86f8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa86fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8700:	d63f0200	blr	x16
   0x0000fffff7fa8704:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8708:	54004480	b.eq	0xfffff7fa8f98  // b.none
   0x0000fffff7fa870c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8710:	37d806a9	tbnz	w9, #27, 0xfffff7fa87e4
   0x0000fffff7fa8714:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8718:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa871c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8720:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8724:	540001c1	b.ne	0xfffff7fa875c  // b.any
   0x0000fffff7fa8728:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa872c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8730:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8734:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8738:	54000121	b.ne	0xfffff7fa875c  // b.any
   0x0000fffff7fa873c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa8740:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa8744:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa8748:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa874c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8750:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa8754:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa8758:	14000030	b	0xfffff7fa8818
   0x0000fffff7fa875c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8760:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8764:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8768:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa876c:	54000120	b.eq	0xfffff7fa8790  // b.none
   0x0000fffff7fa8770:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8774:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8778:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa877c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8780:	54000321	b.ne	0xfffff7fa87e4  // b.any
   0x0000fffff7fa8784:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa8788:	9e620120	scvtf	d0, x9
   0x0000fffff7fa878c:	14000002	b	0xfffff7fa8794
   0x0000fffff7fa8790:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa8794:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa8798:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa879c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa87a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa87a4:	54000120	b.eq	0xfffff7fa87c8  // b.none
   0x0000fffff7fa87a8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa87ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa87b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa87b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa87b8:	54000161	b.ne	0xfffff7fa87e4  // b.any
   0x0000fffff7fa87bc:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa87c0:	9e620121	scvtf	d1, x9
   0x0000fffff7fa87c4:	14000002	b	0xfffff7fa87cc
   0x0000fffff7fa87c8:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa87cc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa87d0:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa87d4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa87d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa87dc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa87e0:	17ffffde	b	0xfffff7fa8758
   0x0000fffff7fa87e4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa87e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa87ec:	aa1303e1	mov	x1, x19
   0x0000fffff7fa87f0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa87f4:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fa87f8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa87fc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8800:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa8804:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8808:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa880c:	d63f0200	blr	x16
   0x0000fffff7fa8810:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8814:	54003c60	b.eq	0xfffff7fa8fa0  // b.none
   0x0000fffff7fa8818:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa881c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa8820:	540004a0	b.eq	0xfffff7fa88b4  // b.none
   0x0000fffff7fa8824:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa8828:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa882c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa8830:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa8834:	54000400	b.eq	0xfffff7fa88b4  // b.none
   0x0000fffff7fa8838:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa883c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa8840:	36d801d1	tbz	w17, #27, 0xfffff7fa8878
   0x0000fffff7fa8844:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8848:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa884c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa8850:	54000321	b.ne	0xfffff7fa88b4  // b.any
   0x0000fffff7fa8854:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa8858:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa885c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa8860:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8864:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8868:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa886c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa8870:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8874:	54000209	b.ls	0xfffff7fa88b4  // b.plast
   0x0000fffff7fa8878:	36d8008d	tbz	w13, #27, 0xfffff7fa8888
   0x0000fffff7fa887c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa8880:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa8884:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa8888:	36d80091	tbz	w17, #27, 0xfffff7fa8898
   0x0000fffff7fa888c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8890:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8894:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa8898:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa889c:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa88a0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa88a4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa88a8:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa88ac:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa88b0:	1400000e	b	0xfffff7fa88e8
   0x0000fffff7fa88b4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa88b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa88bc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa88c0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa88c4:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fa88c8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa88cc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa88d0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa88d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa88d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa88dc:	d63f0200	blr	x16
   0x0000fffff7fa88e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa88e4:	54003620	b.eq	0xfffff7fa8fa8  // b.none
   0x0000fffff7fa88e8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa88ec:	37d806a9	tbnz	w9, #27, 0xfffff7fa89c0
   0x0000fffff7fa88f0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa88f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa88f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa88fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8900:	540001c1	b.ne	0xfffff7fa8938  // b.any
   0x0000fffff7fa8904:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa8908:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa890c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8910:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8914:	54000121	b.ne	0xfffff7fa8938  // b.any
   0x0000fffff7fa8918:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa891c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa8920:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa8924:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8928:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa892c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa8930:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa8934:	14000030	b	0xfffff7fa89f4
   0x0000fffff7fa8938:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa893c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8940:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8944:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8948:	54000120	b.eq	0xfffff7fa896c  // b.none
   0x0000fffff7fa894c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8950:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8954:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8958:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa895c:	54000321	b.ne	0xfffff7fa89c0  // b.any
   0x0000fffff7fa8960:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa8964:	9e620120	scvtf	d0, x9
   0x0000fffff7fa8968:	14000002	b	0xfffff7fa8970
   0x0000fffff7fa896c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa8970:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa8974:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8978:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa897c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8980:	54000120	b.eq	0xfffff7fa89a4  // b.none
   0x0000fffff7fa8984:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa8988:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa898c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8990:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8994:	54000161	b.ne	0xfffff7fa89c0  // b.any
   0x0000fffff7fa8998:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa899c:	9e620121	scvtf	d1, x9
   0x0000fffff7fa89a0:	14000002	b	0xfffff7fa89a8
   0x0000fffff7fa89a4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa89a8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa89ac:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa89b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa89b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa89b8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa89bc:	17ffffde	b	0xfffff7fa8934
   0x0000fffff7fa89c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa89c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa89c8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa89cc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa89d0:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fa89d4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa89d8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa89dc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa89e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa89e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa89e8:	d63f0200	blr	x16
   0x0000fffff7fa89ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa89f0:	54002e00	b.eq	0xfffff7fa8fb0  // b.none
   0x0000fffff7fa89f4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa89f8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa89fc:	540004a0	b.eq	0xfffff7fa8a90  // b.none
   0x0000fffff7fa8a00:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa8a04:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa8a08:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa8a0c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa8a10:	54000400	b.eq	0xfffff7fa8a90  // b.none
   0x0000fffff7fa8a14:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa8a18:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa8a1c:	36d801d1	tbz	w17, #27, 0xfffff7fa8a54
   0x0000fffff7fa8a20:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8a24:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8a28:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa8a2c:	54000321	b.ne	0xfffff7fa8a90  // b.any
   0x0000fffff7fa8a30:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa8a34:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8a38:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa8a3c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8a40:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8a44:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8a48:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa8a4c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8a50:	54000209	b.ls	0xfffff7fa8a90  // b.plast
   0x0000fffff7fa8a54:	36d8008d	tbz	w13, #27, 0xfffff7fa8a64
   0x0000fffff7fa8a58:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa8a5c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa8a60:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa8a64:	36d80091	tbz	w17, #27, 0xfffff7fa8a74
   0x0000fffff7fa8a68:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8a6c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8a70:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa8a74:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa8a78:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa8a7c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa8a80:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa8a84:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa8a88:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa8a8c:	1400000e	b	0xfffff7fa8ac4
   0x0000fffff7fa8a90:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa8a94:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8a98:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8a9c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8aa0:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fa8aa4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8aa8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8aac:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa8ab0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8ab4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8ab8:	d63f0200	blr	x16
   0x0000fffff7fa8abc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8ac0:	540027c0	b.eq	0xfffff7fa8fb8  // b.none
   0x0000fffff7fa8ac4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8ac8:	37d806a9	tbnz	w9, #27, 0xfffff7fa8b9c
   0x0000fffff7fa8acc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8ad0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8ad4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8ad8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8adc:	540001c1	b.ne	0xfffff7fa8b14  // b.any
   0x0000fffff7fa8ae0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa8ae4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8ae8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8aec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8af0:	54000121	b.ne	0xfffff7fa8b14  // b.any
   0x0000fffff7fa8af4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa8af8:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa8afc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa8b00:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8b04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8b08:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa8b0c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa8b10:	14000030	b	0xfffff7fa8bd0
   0x0000fffff7fa8b14:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8b18:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8b1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8b20:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8b24:	54000120	b.eq	0xfffff7fa8b48  // b.none
   0x0000fffff7fa8b28:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8b2c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8b30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8b34:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8b38:	54000321	b.ne	0xfffff7fa8b9c  // b.any
   0x0000fffff7fa8b3c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa8b40:	9e620120	scvtf	d0, x9
   0x0000fffff7fa8b44:	14000002	b	0xfffff7fa8b4c
   0x0000fffff7fa8b48:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa8b4c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa8b50:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8b54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8b58:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8b5c:	54000120	b.eq	0xfffff7fa8b80  // b.none
   0x0000fffff7fa8b60:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa8b64:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8b68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8b6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8b70:	54000161	b.ne	0xfffff7fa8b9c  // b.any
   0x0000fffff7fa8b74:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa8b78:	9e620121	scvtf	d1, x9
   0x0000fffff7fa8b7c:	14000002	b	0xfffff7fa8b84
   0x0000fffff7fa8b80:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa8b84:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa8b88:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa8b8c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8b90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8b94:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa8b98:	17ffffde	b	0xfffff7fa8b10
   0x0000fffff7fa8b9c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8ba0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8ba4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8ba8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8bac:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fa8bb0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8bb4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8bb8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa8bbc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8bc0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8bc4:	d63f0200	blr	x16
   0x0000fffff7fa8bc8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8bcc:	54001fa0	b.eq	0xfffff7fa8fc0  // b.none
   0x0000fffff7fa8bd0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa8bd4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa8bd8:	540004a0	b.eq	0xfffff7fa8c6c  // b.none
   0x0000fffff7fa8bdc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa8be0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa8be4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa8be8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa8bec:	54000400	b.eq	0xfffff7fa8c6c  // b.none
   0x0000fffff7fa8bf0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa8bf4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa8bf8:	36d801d1	tbz	w17, #27, 0xfffff7fa8c30
   0x0000fffff7fa8bfc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8c00:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8c04:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa8c08:	54000321	b.ne	0xfffff7fa8c6c  // b.any
   0x0000fffff7fa8c0c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa8c10:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8c14:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa8c18:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8c1c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8c20:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8c24:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa8c28:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8c2c:	54000209	b.ls	0xfffff7fa8c6c  // b.plast
   0x0000fffff7fa8c30:	36d8008d	tbz	w13, #27, 0xfffff7fa8c40
   0x0000fffff7fa8c34:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa8c38:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa8c3c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa8c40:	36d80091	tbz	w17, #27, 0xfffff7fa8c50
   0x0000fffff7fa8c44:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8c48:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8c4c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa8c50:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa8c54:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa8c58:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa8c5c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa8c60:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa8c64:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa8c68:	1400000e	b	0xfffff7fa8ca0
   0x0000fffff7fa8c6c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa8c70:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8c74:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8c78:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8c7c:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fa8c80:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8c84:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8c88:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa8c8c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8c90:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8c94:	d63f0200	blr	x16
   0x0000fffff7fa8c98:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8c9c:	54001960	b.eq	0xfffff7fa8fc8  // b.none
   0x0000fffff7fa8ca0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8ca4:	37d806a9	tbnz	w9, #27, 0xfffff7fa8d78
   0x0000fffff7fa8ca8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8cac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8cb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8cb4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8cb8:	540001c1	b.ne	0xfffff7fa8cf0  // b.any
   0x0000fffff7fa8cbc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa8cc0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8cc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8cc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8ccc:	54000121	b.ne	0xfffff7fa8cf0  // b.any
   0x0000fffff7fa8cd0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa8cd4:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa8cd8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa8cdc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8ce0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8ce4:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa8ce8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa8cec:	14000030	b	0xfffff7fa8dac
   0x0000fffff7fa8cf0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8cf4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8cf8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8cfc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8d00:	54000120	b.eq	0xfffff7fa8d24  // b.none
   0x0000fffff7fa8d04:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa8d08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8d0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8d10:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8d14:	54000321	b.ne	0xfffff7fa8d78  // b.any
   0x0000fffff7fa8d18:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa8d1c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa8d20:	14000002	b	0xfffff7fa8d28
   0x0000fffff7fa8d24:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa8d28:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa8d2c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8d30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8d34:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8d38:	54000120	b.eq	0xfffff7fa8d5c  // b.none
   0x0000fffff7fa8d3c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa8d40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8d44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8d48:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8d4c:	54000161	b.ne	0xfffff7fa8d78  // b.any
   0x0000fffff7fa8d50:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa8d54:	9e620121	scvtf	d1, x9
   0x0000fffff7fa8d58:	14000002	b	0xfffff7fa8d60
   0x0000fffff7fa8d5c:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa8d60:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa8d64:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa8d68:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa8d6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8d70:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa8d74:	17ffffde	b	0xfffff7fa8cec
   0x0000fffff7fa8d78:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8d7c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8d80:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8d84:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8d88:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fa8d8c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8d90:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8d94:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa8d98:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8d9c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8da0:	d63f0200	blr	x16
   0x0000fffff7fa8da4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8da8:	54001140	b.eq	0xfffff7fa8fd0  // b.none
   0x0000fffff7fa8dac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa8db0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8db4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8db8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa8dbc:	54000381	b.ne	0xfffff7fa8e2c  // b.any
   0x0000fffff7fa8dc0:	f940266c	ldr	x12, [x19, #72]
   0x0000fffff7fa8dc4:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7fa8dc8:	8b0a018b	add	x11, x12, x10
   0x0000fffff7fa8dcc:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7fa8dd0:	36d80211	tbz	w17, #27, 0xfffff7fa8e10
   0x0000fffff7fa8dd4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa8dd8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa8ddc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa8de0:	54000261	b.ne	0xfffff7fa8e2c  // b.any
   0x0000fffff7fa8de4:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa8de8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa8dec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa8df0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa8df4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa8df8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa8dfc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa8e00:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa8e04:	54000149	b.ls	0xfffff7fa8e2c  // b.plast
   0x0000fffff7fa8e08:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa8e0c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa8e10:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fa8e14:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fa8e18:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa8e1c:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa8e20:	f900266b	str	x11, [x19, #72]
   0x0000fffff7fa8e24:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa8e28:	1400000e	b	0xfffff7fa8e60
   0x0000fffff7fa8e2c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8e30:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8e34:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8e38:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8e3c:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fa8e40:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8e44:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8e48:	d2916810	mov	x16, #0x8b40                	// #35648
   0x0000fffff7fa8e4c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa8e50:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8e54:	d63f0200	blr	x16
   0x0000fffff7fa8e58:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa8e5c:	54000be0	b.eq	0xfffff7fa8fd8  // b.none
   0x0000fffff7fa8e60:	17fff8c6	b	0xfffff7fa7178
   0x0000fffff7fa8e64:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa8e68:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa8e6c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa8e70:	aa1503e2	mov	x2, x21
   0x0000fffff7fa8e74:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fa8e78:	aa1403e4	mov	x4, x20
   0x0000fffff7fa8e7c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa8e80:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7fa8e84:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa8e88:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa8e8c:	d63f0200	blr	x16
   0x0000fffff7fa8e90:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa8e94:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa8e98:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa8e9c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa8ea0:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fa8ea4:	d65f03c0	ret
   0x0000fffff7fa8ea8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa8eac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa8eb0:	b900028a	str	w10, [x20]
   0x0000fffff7fa8eb4:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fa8eb8:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa8ebc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa8ec0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa8ec4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa8ec8:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fa8ecc:	d65f03c0	ret
   0x0000fffff7fa8ed0:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fa8ed4:	17fffff5	b	0xfffff7fa8ea8
   0x0000fffff7fa8ed8:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fa8edc:	17fffff3	b	0xfffff7fa8ea8
   0x0000fffff7fa8ee0:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fa8ee4:	17fffff1	b	0xfffff7fa8ea8
   0x0000fffff7fa8ee8:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7fa8eec:	17ffffef	b	0xfffff7fa8ea8
   0x0000fffff7fa8ef0:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7fa8ef4:	17ffffed	b	0xfffff7fa8ea8
   0x0000fffff7fa8ef8:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fa8efc:	17ffffeb	b	0xfffff7fa8ea8
   0x0000fffff7fa8f00:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fa8f04:	17ffffe9	b	0xfffff7fa8ea8
   0x0000fffff7fa8f08:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fa8f0c:	17ffffe7	b	0xfffff7fa8ea8
   0x0000fffff7fa8f10:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fa8f14:	17ffffe5	b	0xfffff7fa8ea8
   0x0000fffff7fa8f18:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fa8f1c:	17ffffe3	b	0xfffff7fa8ea8
   0x0000fffff7fa8f20:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fa8f24:	17ffffe1	b	0xfffff7fa8ea8
   0x0000fffff7fa8f28:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fa8f2c:	17ffffdf	b	0xfffff7fa8ea8
   0x0000fffff7fa8f30:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fa8f34:	17ffffdd	b	0xfffff7fa8ea8
   0x0000fffff7fa8f38:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fa8f3c:	17ffffdb	b	0xfffff7fa8ea8
   0x0000fffff7fa8f40:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fa8f44:	17ffffd9	b	0xfffff7fa8ea8
   0x0000fffff7fa8f48:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fa8f4c:	17ffffd7	b	0xfffff7fa8ea8
   0x0000fffff7fa8f50:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fa8f54:	17ffffd5	b	0xfffff7fa8ea8
   0x0000fffff7fa8f58:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fa8f5c:	17ffffd3	b	0xfffff7fa8ea8
   0x0000fffff7fa8f60:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fa8f64:	17ffffd1	b	0xfffff7fa8ea8
   0x0000fffff7fa8f68:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fa8f6c:	17ffffcf	b	0xfffff7fa8ea8
   0x0000fffff7fa8f70:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fa8f74:	17ffffcd	b	0xfffff7fa8ea8
   0x0000fffff7fa8f78:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fa8f7c:	17ffffcb	b	0xfffff7fa8ea8
   0x0000fffff7fa8f80:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fa8f84:	17ffffc9	b	0xfffff7fa8ea8
   0x0000fffff7fa8f88:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fa8f8c:	17ffffc7	b	0xfffff7fa8ea8
   0x0000fffff7fa8f90:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fa8f94:	17ffffc5	b	0xfffff7fa8ea8
   0x0000fffff7fa8f98:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fa8f9c:	17ffffc3	b	0xfffff7fa8ea8
   0x0000fffff7fa8fa0:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fa8fa4:	17ffffc1	b	0xfffff7fa8ea8
   0x0000fffff7fa8fa8:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fa8fac:	17ffffbf	b	0xfffff7fa8ea8
   0x0000fffff7fa8fb0:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fa8fb4:	17ffffbd	b	0xfffff7fa8ea8
   0x0000fffff7fa8fb8:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fa8fbc:	17ffffbb	b	0xfffff7fa8ea8
   0x0000fffff7fa8fc0:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fa8fc4:	17ffffb9	b	0xfffff7fa8ea8
   0x0000fffff7fa8fc8:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fa8fcc:	17ffffb7	b	0xfffff7fa8ea8
   0x0000fffff7fa8fd0:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fa8fd4:	17ffffb5	b	0xfffff7fa8ea8
   0x0000fffff7fa8fd8:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fa8fdc:	17ffffb3	b	0xfffff7fa8ea8
   0x0000fffff7fa8fe0:	00000000	udf	#0
   0x0000fffff7fa8fe4:	00000000	udf	#0
   0x0000fffff7fa8fe8:	00000000	udf	#0
   0x0000fffff7fa8fec:	00000000	udf	#0
   0x0000fffff7fa8ff0:	00000000	udf	#0
   0x0000fffff7fa8ff4:	00000000	udf	#0
   0x0000fffff7fa8ff8:	00000000	udf	#0
   0x0000fffff7fa8ffc:	00000000	udf	#0
End of assembler dump.
