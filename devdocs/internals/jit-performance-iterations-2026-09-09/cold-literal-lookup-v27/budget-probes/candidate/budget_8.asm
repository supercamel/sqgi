Dump of assembler code from 0xfffff7fb1000 to 0xfffff7fb3000:
   0x0000fffff7fb1000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fb1004:	910003fd	mov	x29, sp
   0x0000fffff7fb1008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fb100c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fb1010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fb1014:	aa0003f3	mov	x19, x0
   0x0000fffff7fb1018:	aa0103f4	mov	x20, x1
   0x0000fffff7fb101c:	aa0203f5	mov	x21, x2
   0x0000fffff7fb1020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fb1024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fb1028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fb102c:	f90003e9	str	x9, [sp]
   0x0000fffff7fb1030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fb1034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fb1038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fb103c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fb1040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1044:	d63f0200	blr	x16
   0x0000fffff7fb1048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fb104c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fb1050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fb1054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fb1058:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb105c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb1060:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb1064:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb1068:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb106c:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7fb1070:	36d801d1	tbz	w17, #27, 0xfffff7fb10a8
   0x0000fffff7fb1074:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb1078:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb107c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb1080:	54000281	b.ne	0xfffff7fb10d0  // b.any
   0x0000fffff7fb1084:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7fb1088:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb108c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb1090:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb1094:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb1098:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb109c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb10a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb10a4:	54000169	b.ls	0xfffff7fb10d0  // b.plast
   0x0000fffff7fb10a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb10ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb10b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb10b4:	36d80091	tbz	w17, #27, 0xfffff7fb10c4
   0x0000fffff7fb10b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb10bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb10c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb10c4:	f900166c	str	x12, [x19, #40]
   0x0000fffff7fb10c8:	b900226d	str	w13, [x19, #32]
   0x0000fffff7fb10cc:	1400000e	b	0xfffff7fb1104
   0x0000fffff7fb10d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb10d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb10d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb10dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb10e0:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fb10e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb10e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb10ec:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb10f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb10f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb10f8:	d63f0200	blr	x16
   0x0000fffff7fb10fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1100:	5400eec0	b.eq	0xfffff7fb2ed8  // b.none
   0x0000fffff7fb1104:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb1108:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb110c:	d280002c	mov	x12, #0x1                   	// #1
   0x0000fffff7fb1110:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb1114:	36d80211	tbz	w17, #27, 0xfffff7fb1154
   0x0000fffff7fb1118:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb111c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb1120:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb1124:	540001e1	b.ne	0xfffff7fb1160  // b.any
   0x0000fffff7fb1128:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb112c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1130:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb1134:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb1138:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb113c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb1140:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb1144:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb1148:	540000c9	b.ls	0xfffff7fb1160  // b.plast
   0x0000fffff7fb114c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb1150:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb1154:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb1158:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb115c:	1400000e	b	0xfffff7fb1194
   0x0000fffff7fb1160:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb1164:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1168:	aa1303e1	mov	x1, x19
   0x0000fffff7fb116c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1170:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fb1174:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1178:	aa1603e5	mov	x5, x22
   0x0000fffff7fb117c:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7fb1180:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb1184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1188:	d63f0200	blr	x16
   0x0000fffff7fb118c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1190:	5400ea80	b.eq	0xfffff7fb2ee0  // b.none
   0x0000fffff7fb1194:	b940126d	ldr	w13, [x19, #16]
   0x0000fffff7fb1198:	f9400e6c	ldr	x12, [x19, #24]
   0x0000fffff7fb119c:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7fb11a0:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fb11a4:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fb11a8:	54000100	b.eq	0xfffff7fb11c8  // b.none
   0x0000fffff7fb11ac:	5290000a	mov	w10, #0x8000                	// #32768
   0x0000fffff7fb11b0:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fb11b4:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fb11b8:	54000a21	b.ne	0xfffff7fb12fc  // b.any
   0x0000fffff7fb11bc:	f9401d8b	ldr	x11, [x12, #56]
   0x0000fffff7fb11c0:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7fb11c4:	14000002	b	0xfffff7fb11cc
   0x0000fffff7fb11c8:	aa0c03eb	mov	x11, x12
   0x0000fffff7fb11cc:	f9402569	ldr	x9, [x11, #72]
   0x0000fffff7fb11d0:	d1000529	sub	x9, x9, #0x1
   0x0000fffff7fb11d4:	d298b66a	mov	x10, #0xc5b3                	// #50611
   0x0000fffff7fb11d8:	f2a00f0a	movk	x10, #0x78, lsl #16
   0x0000fffff7fb11dc:	8a09014a	and	x10, x10, x9
   0x0000fffff7fb11e0:	f940216b	ldr	x11, [x11, #64]
   0x0000fffff7fb11e4:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fb11e8:	9b097d4a	mul	x10, x10, x9
   0x0000fffff7fb11ec:	8b0a016b	add	x11, x11, x10
   0x0000fffff7fb11f0:	b9401169	ldr	w9, [x11, #16]
   0x0000fffff7fb11f4:	5280020a	mov	w10, #0x10                  	// #16
   0x0000fffff7fb11f8:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7fb11fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1200:	540007e1	b.ne	0xfffff7fb12fc  // b.any
   0x0000fffff7fb1204:	f9400d69	ldr	x9, [x11, #24]
   0x0000fffff7fb1208:	d299ba0a	mov	x10, #0xcdd0                	// #52688
   0x0000fffff7fb120c:	f2b5580a	movk	x10, #0xaac0, lsl #16
   0x0000fffff7fb1210:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7fb1214:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1218:	54000721	b.ne	0xfffff7fb12fc  // b.any
   0x0000fffff7fb121c:	9100016b	add	x11, x11, #0x0
   0x0000fffff7fb1220:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7fb1224:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fb1228:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fb122c:	540002a0	b.eq	0xfffff7fb1280  // b.none
   0x0000fffff7fb1230:	b9400169	ldr	w9, [x11]
   0x0000fffff7fb1234:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1238:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb123c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1240:	540005e1	b.ne	0xfffff7fb12fc  // b.any
   0x0000fffff7fb1244:	f9400569	ldr	x9, [x11, #8]
   0x0000fffff7fb1248:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7fb124c:	f2a0400a	movk	x10, #0x200, lsl #16
   0x0000fffff7fb1250:	8a0a012a	and	x10, x9, x10
   0x0000fffff7fb1254:	f100015f	cmp	x10, #0x0
   0x0000fffff7fb1258:	54000520	b.eq	0xfffff7fb12fc  // b.none
   0x0000fffff7fb125c:	d29fffea	mov	x10, #0xffff                	// #65535
   0x0000fffff7fb1260:	f2a01fea	movk	x10, #0xff, lsl #16
   0x0000fffff7fb1264:	8a0a0129	and	x9, x9, x10
   0x0000fffff7fb1268:	f9401d8a	ldr	x10, [x12, #56]
   0x0000fffff7fb126c:	f940254a	ldr	x10, [x10, #72]
   0x0000fffff7fb1270:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1274:	54000442	b.cs	0xfffff7fb12fc  // b.hs, b.nlast
   0x0000fffff7fb1278:	9101618b	add	x11, x12, #0x58
   0x0000fffff7fb127c:	8b09116b	add	x11, x11, x9, lsl #4
   0x0000fffff7fb1280:	b90013ed	str	w13, [sp, #16]
   0x0000fffff7fb1284:	f9000fec	str	x12, [sp, #24]
   0x0000fffff7fb1288:	f90017eb	str	x11, [sp, #40]
   0x0000fffff7fb128c:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb1290:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb1294:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb1298:	36d801d1	tbz	w17, #27, 0xfffff7fb12d0
   0x0000fffff7fb129c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb12a0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb12a4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb12a8:	540002a1	b.ne	0xfffff7fb12fc  // b.any
   0x0000fffff7fb12ac:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb12b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb12b4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb12b8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb12bc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb12c0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb12c4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb12c8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb12cc:	54000189	b.ls	0xfffff7fb12fc  // b.plast
   0x0000fffff7fb12d0:	36d8008d	tbz	w13, #27, 0xfffff7fb12e0
   0x0000fffff7fb12d4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb12d8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb12dc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb12e0:	36d80091	tbz	w17, #27, 0xfffff7fb12f0
   0x0000fffff7fb12e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb12e8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb12ec:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb12f0:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb12f4:	b900016d	str	w13, [x11]
   0x0000fffff7fb12f8:	1400000e	b	0xfffff7fb1330
   0x0000fffff7fb12fc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb1300:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1304:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1308:	aa1503e2	mov	x2, x21
   0x0000fffff7fb130c:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fb1310:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1314:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1318:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb131c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb1320:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1324:	d63f0200	blr	x16
   0x0000fffff7fb1328:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb132c:	5400dde0	b.eq	0xfffff7fb2ee8  // b.none
   0x0000fffff7fb1330:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb1334:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb1338:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fb133c:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7fb1340:	36d80211	tbz	w17, #27, 0xfffff7fb1380
   0x0000fffff7fb1344:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb1348:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb134c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb1350:	540001e1	b.ne	0xfffff7fb138c  // b.any
   0x0000fffff7fb1354:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7fb1358:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb135c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb1360:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb1364:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb1368:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb136c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb1370:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb1374:	540000c9	b.ls	0xfffff7fb138c  // b.plast
   0x0000fffff7fb1378:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb137c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb1380:	f900166c	str	x12, [x19, #40]
   0x0000fffff7fb1384:	b900226d	str	w13, [x19, #32]
   0x0000fffff7fb1388:	1400000e	b	0xfffff7fb13c0
   0x0000fffff7fb138c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb1390:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1394:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1398:	aa1503e2	mov	x2, x21
   0x0000fffff7fb139c:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7fb13a0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb13a4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb13a8:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7fb13ac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb13b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb13b4:	d63f0200	blr	x16
   0x0000fffff7fb13b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb13bc:	5400d9a0	b.eq	0xfffff7fb2ef0  // b.none
   0x0000fffff7fb13c0:	b940126d	ldr	w13, [x19, #16]
   0x0000fffff7fb13c4:	f9400e6c	ldr	x12, [x19, #24]
   0x0000fffff7fb13c8:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7fb13cc:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fb13d0:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fb13d4:	54000100	b.eq	0xfffff7fb13f4  // b.none
   0x0000fffff7fb13d8:	5290000a	mov	w10, #0x8000                	// #32768
   0x0000fffff7fb13dc:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fb13e0:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fb13e4:	54000b21	b.ne	0xfffff7fb1548  // b.any
   0x0000fffff7fb13e8:	f9401d8b	ldr	x11, [x12, #56]
   0x0000fffff7fb13ec:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7fb13f0:	14000002	b	0xfffff7fb13f8
   0x0000fffff7fb13f4:	aa0c03eb	mov	x11, x12
   0x0000fffff7fb13f8:	f9402569	ldr	x9, [x11, #72]
   0x0000fffff7fb13fc:	d1000529	sub	x9, x9, #0x1
   0x0000fffff7fb1400:	d29ba34a	mov	x10, #0xdd1a                	// #56602
   0x0000fffff7fb1404:	f2a2374a	movk	x10, #0x11ba, lsl #16
   0x0000fffff7fb1408:	8a09014a	and	x10, x10, x9
   0x0000fffff7fb140c:	f940216b	ldr	x11, [x11, #64]
   0x0000fffff7fb1410:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fb1414:	9b097d4a	mul	x10, x10, x9
   0x0000fffff7fb1418:	8b0a016b	add	x11, x11, x10
   0x0000fffff7fb141c:	b9401169	ldr	w9, [x11, #16]
   0x0000fffff7fb1420:	5280020a	mov	w10, #0x10                  	// #16
   0x0000fffff7fb1424:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7fb1428:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb142c:	540008e1	b.ne	0xfffff7fb1548  // b.any
   0x0000fffff7fb1430:	f9400d69	ldr	x9, [x11, #24]
   0x0000fffff7fb1434:	d299d20a	mov	x10, #0xce90                	// #52880
   0x0000fffff7fb1438:	f2b5580a	movk	x10, #0xaac0, lsl #16
   0x0000fffff7fb143c:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7fb1440:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1444:	54000821	b.ne	0xfffff7fb1548  // b.any
   0x0000fffff7fb1448:	9100016b	add	x11, x11, #0x0
   0x0000fffff7fb144c:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7fb1450:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fb1454:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fb1458:	540002a0	b.eq	0xfffff7fb14ac  // b.none
   0x0000fffff7fb145c:	b9400169	ldr	w9, [x11]
   0x0000fffff7fb1460:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1464:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1468:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb146c:	540006e1	b.ne	0xfffff7fb1548  // b.any
   0x0000fffff7fb1470:	f9400569	ldr	x9, [x11, #8]
   0x0000fffff7fb1474:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7fb1478:	f2a0400a	movk	x10, #0x200, lsl #16
   0x0000fffff7fb147c:	8a0a012a	and	x10, x9, x10
   0x0000fffff7fb1480:	f100015f	cmp	x10, #0x0
   0x0000fffff7fb1484:	54000620	b.eq	0xfffff7fb1548  // b.none
   0x0000fffff7fb1488:	d29fffea	mov	x10, #0xffff                	// #65535
   0x0000fffff7fb148c:	f2a01fea	movk	x10, #0xff, lsl #16
   0x0000fffff7fb1490:	8a0a0129	and	x9, x9, x10
   0x0000fffff7fb1494:	f9401d8a	ldr	x10, [x12, #56]
   0x0000fffff7fb1498:	f940254a	ldr	x10, [x10, #72]
   0x0000fffff7fb149c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb14a0:	54000542	b.cs	0xfffff7fb1548  // b.hs, b.nlast
   0x0000fffff7fb14a4:	9101618b	add	x11, x12, #0x58
   0x0000fffff7fb14a8:	8b09116b	add	x11, x11, x9, lsl #4
   0x0000fffff7fb14ac:	b90033ed	str	w13, [sp, #48]
   0x0000fffff7fb14b0:	f9001fec	str	x12, [sp, #56]
   0x0000fffff7fb14b4:	f90027eb	str	x11, [sp, #72]
   0x0000fffff7fb14b8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb14bc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb14c0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb14c4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb14c8:	54000400	b.eq	0xfffff7fb1548  // b.none
   0x0000fffff7fb14cc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb14d0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb14d4:	36d801d1	tbz	w17, #27, 0xfffff7fb150c
   0x0000fffff7fb14d8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb14dc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb14e0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb14e4:	54000321	b.ne	0xfffff7fb1548  // b.any
   0x0000fffff7fb14e8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb14ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb14f0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb14f4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb14f8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb14fc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb1500:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb1504:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb1508:	54000209	b.ls	0xfffff7fb1548  // b.plast
   0x0000fffff7fb150c:	36d8008d	tbz	w13, #27, 0xfffff7fb151c
   0x0000fffff7fb1510:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb1514:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb1518:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb151c:	36d80091	tbz	w17, #27, 0xfffff7fb152c
   0x0000fffff7fb1520:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1524:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb1528:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb152c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb1530:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb1534:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb1538:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb153c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb1540:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb1544:	1400000e	b	0xfffff7fb157c
   0x0000fffff7fb1548:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb154c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1550:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1554:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1558:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7fb155c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1560:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1564:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb1568:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb156c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1570:	d63f0200	blr	x16
   0x0000fffff7fb1574:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1578:	5400cc00	b.eq	0xfffff7fb2ef8  // b.none
   0x0000fffff7fb157c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb1580:	37d806a9	tbnz	w9, #27, 0xfffff7fb1654
   0x0000fffff7fb1584:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb1588:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb158c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1590:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1594:	540001c1	b.ne	0xfffff7fb15cc  // b.any
   0x0000fffff7fb1598:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb159c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb15a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb15a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb15a8:	54000121	b.ne	0xfffff7fb15cc  // b.any
   0x0000fffff7fb15ac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb15b0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb15b4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb15b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb15bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb15c0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb15c4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb15c8:	14000030	b	0xfffff7fb1688
   0x0000fffff7fb15cc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb15d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb15d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb15d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb15dc:	54000120	b.eq	0xfffff7fb1600  // b.none
   0x0000fffff7fb15e0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb15e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb15e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb15ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb15f0:	54000321	b.ne	0xfffff7fb1654  // b.any
   0x0000fffff7fb15f4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb15f8:	9e620120	scvtf	d0, x9
   0x0000fffff7fb15fc:	14000002	b	0xfffff7fb1604
   0x0000fffff7fb1600:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb1604:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb1608:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb160c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1610:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1614:	54000120	b.eq	0xfffff7fb1638  // b.none
   0x0000fffff7fb1618:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb161c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1620:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1624:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1628:	54000161	b.ne	0xfffff7fb1654  // b.any
   0x0000fffff7fb162c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb1630:	9e620121	scvtf	d1, x9
   0x0000fffff7fb1634:	14000002	b	0xfffff7fb163c
   0x0000fffff7fb1638:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb163c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb1640:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb1644:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1648:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb164c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb1650:	17ffffde	b	0xfffff7fb15c8
   0x0000fffff7fb1654:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb1658:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb165c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1660:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1664:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fb1668:	aa1403e4	mov	x4, x20
   0x0000fffff7fb166c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1670:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fb1674:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb1678:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb167c:	d63f0200	blr	x16
   0x0000fffff7fb1680:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1684:	5400c3e0	b.eq	0xfffff7fb2f00  // b.none
   0x0000fffff7fb1688:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb168c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb1690:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb1694:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb1698:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb169c:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb16a0:	36d801d1	tbz	w17, #27, 0xfffff7fb16d8
   0x0000fffff7fb16a4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb16a8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb16ac:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb16b0:	54000281	b.ne	0xfffff7fb1700  // b.any
   0x0000fffff7fb16b4:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb16b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb16bc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb16c0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb16c4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb16c8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb16cc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb16d0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb16d4:	54000169	b.ls	0xfffff7fb1700  // b.plast
   0x0000fffff7fb16d8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb16dc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb16e0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb16e4:	36d80091	tbz	w17, #27, 0xfffff7fb16f4
   0x0000fffff7fb16e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb16ec:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb16f0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb16f4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb16f8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb16fc:	1400000e	b	0xfffff7fb1734
   0x0000fffff7fb1700:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb1704:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1708:	aa1303e1	mov	x1, x19
   0x0000fffff7fb170c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1710:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fb1714:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1718:	aa1603e5	mov	x5, x22
   0x0000fffff7fb171c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb1720:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb1724:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1728:	d63f0200	blr	x16
   0x0000fffff7fb172c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1730:	5400bec0	b.eq	0xfffff7fb2f08  // b.none
   0x0000fffff7fb1734:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb1738:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb173c:	540003a0	b.eq	0xfffff7fb17b0  // b.none
   0x0000fffff7fb1740:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb1744:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb1748:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb174c:	36d801d1	tbz	w17, #27, 0xfffff7fb1784
   0x0000fffff7fb1750:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb1754:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb1758:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb175c:	540002a1	b.ne	0xfffff7fb17b0  // b.any
   0x0000fffff7fb1760:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb1764:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1768:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb176c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb1770:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb1774:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb1778:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb177c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb1780:	54000189	b.ls	0xfffff7fb17b0  // b.plast
   0x0000fffff7fb1784:	36d8008d	tbz	w13, #27, 0xfffff7fb1794
   0x0000fffff7fb1788:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb178c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb1790:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb1794:	36d80091	tbz	w17, #27, 0xfffff7fb17a4
   0x0000fffff7fb1798:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb179c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb17a0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb17a4:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb17a8:	b900016d	str	w13, [x11]
   0x0000fffff7fb17ac:	1400000e	b	0xfffff7fb17e4
   0x0000fffff7fb17b0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb17b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb17b8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb17bc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb17c0:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fb17c4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb17c8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb17cc:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb17d0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb17d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb17d8:	d63f0200	blr	x16
   0x0000fffff7fb17dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb17e0:	5400b980	b.eq	0xfffff7fb2f10  // b.none
   0x0000fffff7fb17e4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb17e8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb17ec:	540004a0	b.eq	0xfffff7fb1880  // b.none
   0x0000fffff7fb17f0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb17f4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb17f8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb17fc:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb1800:	54000400	b.eq	0xfffff7fb1880  // b.none
   0x0000fffff7fb1804:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb1808:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb180c:	36d801d1	tbz	w17, #27, 0xfffff7fb1844
   0x0000fffff7fb1810:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb1814:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb1818:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb181c:	54000321	b.ne	0xfffff7fb1880  // b.any
   0x0000fffff7fb1820:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb1824:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1828:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb182c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb1830:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb1834:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb1838:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb183c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb1840:	54000209	b.ls	0xfffff7fb1880  // b.plast
   0x0000fffff7fb1844:	36d8008d	tbz	w13, #27, 0xfffff7fb1854
   0x0000fffff7fb1848:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb184c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb1850:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb1854:	36d80091	tbz	w17, #27, 0xfffff7fb1864
   0x0000fffff7fb1858:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb185c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb1860:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb1864:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb1868:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb186c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb1870:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb1874:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb1878:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb187c:	1400000e	b	0xfffff7fb18b4
   0x0000fffff7fb1880:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb1884:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1888:	aa1303e1	mov	x1, x19
   0x0000fffff7fb188c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1890:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fb1894:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1898:	aa1603e5	mov	x5, x22
   0x0000fffff7fb189c:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb18a0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb18a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb18a8:	d63f0200	blr	x16
   0x0000fffff7fb18ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb18b0:	5400b340	b.eq	0xfffff7fb2f18  // b.none
   0x0000fffff7fb18b4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb18b8:	37d806a9	tbnz	w9, #27, 0xfffff7fb198c
   0x0000fffff7fb18bc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb18c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb18c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb18c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb18cc:	540001c1	b.ne	0xfffff7fb1904  // b.any
   0x0000fffff7fb18d0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb18d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb18d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb18dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb18e0:	54000121	b.ne	0xfffff7fb1904  // b.any
   0x0000fffff7fb18e4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb18e8:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb18ec:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb18f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb18f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb18f8:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb18fc:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb1900:	14000030	b	0xfffff7fb19c0
   0x0000fffff7fb1904:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb1908:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb190c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1910:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1914:	54000120	b.eq	0xfffff7fb1938  // b.none
   0x0000fffff7fb1918:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb191c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1920:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1924:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1928:	54000321	b.ne	0xfffff7fb198c  // b.any
   0x0000fffff7fb192c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb1930:	9e620120	scvtf	d0, x9
   0x0000fffff7fb1934:	14000002	b	0xfffff7fb193c
   0x0000fffff7fb1938:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb193c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb1940:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1944:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1948:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb194c:	54000120	b.eq	0xfffff7fb1970  // b.none
   0x0000fffff7fb1950:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb1954:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1958:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb195c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1960:	54000161	b.ne	0xfffff7fb198c  // b.any
   0x0000fffff7fb1964:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb1968:	9e620121	scvtf	d1, x9
   0x0000fffff7fb196c:	14000002	b	0xfffff7fb1974
   0x0000fffff7fb1970:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb1974:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb1978:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb197c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1980:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1984:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb1988:	17ffffde	b	0xfffff7fb1900
   0x0000fffff7fb198c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb1990:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1994:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1998:	aa1503e2	mov	x2, x21
   0x0000fffff7fb199c:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fb19a0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb19a4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb19a8:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fb19ac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb19b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb19b4:	d63f0200	blr	x16
   0x0000fffff7fb19b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb19bc:	5400ab20	b.eq	0xfffff7fb2f20  // b.none
   0x0000fffff7fb19c0:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb19c4:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb19c8:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb19cc:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb19d0:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb19d4:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb19d8:	36d801d1	tbz	w17, #27, 0xfffff7fb1a10
   0x0000fffff7fb19dc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb19e0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb19e4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb19e8:	54000281	b.ne	0xfffff7fb1a38  // b.any
   0x0000fffff7fb19ec:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb19f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb19f4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb19f8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb19fc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb1a00:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb1a04:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb1a08:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb1a0c:	54000169	b.ls	0xfffff7fb1a38  // b.plast
   0x0000fffff7fb1a10:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb1a14:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb1a18:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb1a1c:	36d80091	tbz	w17, #27, 0xfffff7fb1a2c
   0x0000fffff7fb1a20:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1a24:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb1a28:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb1a2c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb1a30:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb1a34:	1400000e	b	0xfffff7fb1a6c
   0x0000fffff7fb1a38:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb1a3c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1a40:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1a44:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1a48:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fb1a4c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1a50:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1a54:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb1a58:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb1a5c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1a60:	d63f0200	blr	x16
   0x0000fffff7fb1a64:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1a68:	5400a600	b.eq	0xfffff7fb2f28  // b.none
   0x0000fffff7fb1a6c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb1a70:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb1a74:	540003a0	b.eq	0xfffff7fb1ae8  // b.none
   0x0000fffff7fb1a78:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb1a7c:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb1a80:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb1a84:	36d801d1	tbz	w17, #27, 0xfffff7fb1abc
   0x0000fffff7fb1a88:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb1a8c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb1a90:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb1a94:	540002a1	b.ne	0xfffff7fb1ae8  // b.any
   0x0000fffff7fb1a98:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb1a9c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1aa0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb1aa4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb1aa8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb1aac:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb1ab0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb1ab4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb1ab8:	54000189	b.ls	0xfffff7fb1ae8  // b.plast
   0x0000fffff7fb1abc:	36d8008d	tbz	w13, #27, 0xfffff7fb1acc
   0x0000fffff7fb1ac0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb1ac4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb1ac8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb1acc:	36d80091	tbz	w17, #27, 0xfffff7fb1adc
   0x0000fffff7fb1ad0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1ad4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb1ad8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb1adc:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb1ae0:	b900016d	str	w13, [x11]
   0x0000fffff7fb1ae4:	1400000e	b	0xfffff7fb1b1c
   0x0000fffff7fb1ae8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb1aec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1af0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1af4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1af8:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fb1afc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1b00:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1b04:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb1b08:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb1b0c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1b10:	d63f0200	blr	x16
   0x0000fffff7fb1b14:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1b18:	5400a0c0	b.eq	0xfffff7fb2f30  // b.none
   0x0000fffff7fb1b1c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb1b20:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb1b24:	540004a0	b.eq	0xfffff7fb1bb8  // b.none
   0x0000fffff7fb1b28:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb1b2c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb1b30:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb1b34:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb1b38:	54000400	b.eq	0xfffff7fb1bb8  // b.none
   0x0000fffff7fb1b3c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb1b40:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb1b44:	36d801d1	tbz	w17, #27, 0xfffff7fb1b7c
   0x0000fffff7fb1b48:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb1b4c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb1b50:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb1b54:	54000321	b.ne	0xfffff7fb1bb8  // b.any
   0x0000fffff7fb1b58:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb1b5c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1b60:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb1b64:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb1b68:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb1b6c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb1b70:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb1b74:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb1b78:	54000209	b.ls	0xfffff7fb1bb8  // b.plast
   0x0000fffff7fb1b7c:	36d8008d	tbz	w13, #27, 0xfffff7fb1b8c
   0x0000fffff7fb1b80:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb1b84:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb1b88:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb1b8c:	36d80091	tbz	w17, #27, 0xfffff7fb1b9c
   0x0000fffff7fb1b90:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1b94:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb1b98:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb1b9c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb1ba0:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb1ba4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb1ba8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb1bac:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb1bb0:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb1bb4:	1400000e	b	0xfffff7fb1bec
   0x0000fffff7fb1bb8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb1bbc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1bc0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1bc4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1bc8:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fb1bcc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1bd0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1bd4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb1bd8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb1bdc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1be0:	d63f0200	blr	x16
   0x0000fffff7fb1be4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1be8:	54009a80	b.eq	0xfffff7fb2f38  // b.none
   0x0000fffff7fb1bec:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb1bf0:	37d806a9	tbnz	w9, #27, 0xfffff7fb1cc4
   0x0000fffff7fb1bf4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb1bf8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1bfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1c00:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1c04:	540001c1	b.ne	0xfffff7fb1c3c  // b.any
   0x0000fffff7fb1c08:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb1c0c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1c10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1c14:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1c18:	54000121	b.ne	0xfffff7fb1c3c  // b.any
   0x0000fffff7fb1c1c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb1c20:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb1c24:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb1c28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1c2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1c30:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb1c34:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb1c38:	14000030	b	0xfffff7fb1cf8
   0x0000fffff7fb1c3c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb1c40:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1c44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1c48:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1c4c:	54000120	b.eq	0xfffff7fb1c70  // b.none
   0x0000fffff7fb1c50:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb1c54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1c58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1c5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1c60:	54000321	b.ne	0xfffff7fb1cc4  // b.any
   0x0000fffff7fb1c64:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb1c68:	9e620120	scvtf	d0, x9
   0x0000fffff7fb1c6c:	14000002	b	0xfffff7fb1c74
   0x0000fffff7fb1c70:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb1c74:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb1c78:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1c7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1c80:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1c84:	54000120	b.eq	0xfffff7fb1ca8  // b.none
   0x0000fffff7fb1c88:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb1c8c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1c90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1c94:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1c98:	54000161	b.ne	0xfffff7fb1cc4  // b.any
   0x0000fffff7fb1c9c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb1ca0:	9e620121	scvtf	d1, x9
   0x0000fffff7fb1ca4:	14000002	b	0xfffff7fb1cac
   0x0000fffff7fb1ca8:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb1cac:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb1cb0:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb1cb4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1cb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1cbc:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb1cc0:	17ffffde	b	0xfffff7fb1c38
   0x0000fffff7fb1cc4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb1cc8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1ccc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1cd0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1cd4:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fb1cd8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1cdc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1ce0:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fb1ce4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb1ce8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1cec:	d63f0200	blr	x16
   0x0000fffff7fb1cf0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1cf4:	54009260	b.eq	0xfffff7fb2f40  // b.none
   0x0000fffff7fb1cf8:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb1cfc:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb1d00:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb1d04:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb1d08:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb1d0c:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb1d10:	36d801d1	tbz	w17, #27, 0xfffff7fb1d48
   0x0000fffff7fb1d14:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb1d18:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb1d1c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb1d20:	54000281	b.ne	0xfffff7fb1d70  // b.any
   0x0000fffff7fb1d24:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb1d28:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1d2c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb1d30:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb1d34:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb1d38:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb1d3c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb1d40:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb1d44:	54000169	b.ls	0xfffff7fb1d70  // b.plast
   0x0000fffff7fb1d48:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb1d4c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb1d50:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb1d54:	36d80091	tbz	w17, #27, 0xfffff7fb1d64
   0x0000fffff7fb1d58:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1d5c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb1d60:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb1d64:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb1d68:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb1d6c:	1400000e	b	0xfffff7fb1da4
   0x0000fffff7fb1d70:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb1d74:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1d78:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1d7c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1d80:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fb1d84:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1d88:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1d8c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb1d90:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb1d94:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1d98:	d63f0200	blr	x16
   0x0000fffff7fb1d9c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1da0:	54008d40	b.eq	0xfffff7fb2f48  // b.none
   0x0000fffff7fb1da4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb1da8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb1dac:	540003a0	b.eq	0xfffff7fb1e20  // b.none
   0x0000fffff7fb1db0:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb1db4:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb1db8:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb1dbc:	36d801d1	tbz	w17, #27, 0xfffff7fb1df4
   0x0000fffff7fb1dc0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb1dc4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb1dc8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb1dcc:	540002a1	b.ne	0xfffff7fb1e20  // b.any
   0x0000fffff7fb1dd0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb1dd4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1dd8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb1ddc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb1de0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb1de4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb1de8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb1dec:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb1df0:	54000189	b.ls	0xfffff7fb1e20  // b.plast
   0x0000fffff7fb1df4:	36d8008d	tbz	w13, #27, 0xfffff7fb1e04
   0x0000fffff7fb1df8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb1dfc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb1e00:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb1e04:	36d80091	tbz	w17, #27, 0xfffff7fb1e14
   0x0000fffff7fb1e08:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1e0c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb1e10:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb1e14:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb1e18:	b900016d	str	w13, [x11]
   0x0000fffff7fb1e1c:	1400000e	b	0xfffff7fb1e54
   0x0000fffff7fb1e20:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb1e24:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1e28:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1e2c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1e30:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fb1e34:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1e38:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1e3c:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb1e40:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb1e44:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1e48:	d63f0200	blr	x16
   0x0000fffff7fb1e4c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1e50:	54008800	b.eq	0xfffff7fb2f50  // b.none
   0x0000fffff7fb1e54:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb1e58:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb1e5c:	540004a0	b.eq	0xfffff7fb1ef0  // b.none
   0x0000fffff7fb1e60:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb1e64:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb1e68:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb1e6c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb1e70:	54000400	b.eq	0xfffff7fb1ef0  // b.none
   0x0000fffff7fb1e74:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb1e78:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb1e7c:	36d801d1	tbz	w17, #27, 0xfffff7fb1eb4
   0x0000fffff7fb1e80:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb1e84:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb1e88:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb1e8c:	54000321	b.ne	0xfffff7fb1ef0  // b.any
   0x0000fffff7fb1e90:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb1e94:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1e98:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb1e9c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb1ea0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb1ea4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb1ea8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb1eac:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb1eb0:	54000209	b.ls	0xfffff7fb1ef0  // b.plast
   0x0000fffff7fb1eb4:	36d8008d	tbz	w13, #27, 0xfffff7fb1ec4
   0x0000fffff7fb1eb8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb1ebc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb1ec0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb1ec4:	36d80091	tbz	w17, #27, 0xfffff7fb1ed4
   0x0000fffff7fb1ec8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1ecc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb1ed0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb1ed4:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb1ed8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb1edc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb1ee0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb1ee4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb1ee8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb1eec:	1400000e	b	0xfffff7fb1f24
   0x0000fffff7fb1ef0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb1ef4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1ef8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1efc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1f00:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fb1f04:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1f08:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1f0c:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb1f10:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb1f14:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1f18:	d63f0200	blr	x16
   0x0000fffff7fb1f1c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1f20:	540081c0	b.eq	0xfffff7fb2f58  // b.none
   0x0000fffff7fb1f24:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb1f28:	37d806a9	tbnz	w9, #27, 0xfffff7fb1ffc
   0x0000fffff7fb1f2c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb1f30:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1f34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1f38:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1f3c:	540001c1	b.ne	0xfffff7fb1f74  // b.any
   0x0000fffff7fb1f40:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb1f44:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1f48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1f4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1f50:	54000121	b.ne	0xfffff7fb1f74  // b.any
   0x0000fffff7fb1f54:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb1f58:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb1f5c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb1f60:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1f64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1f68:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb1f6c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb1f70:	14000030	b	0xfffff7fb2030
   0x0000fffff7fb1f74:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb1f78:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1f7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1f80:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1f84:	54000120	b.eq	0xfffff7fb1fa8  // b.none
   0x0000fffff7fb1f88:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb1f8c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1f90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1f94:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1f98:	54000321	b.ne	0xfffff7fb1ffc  // b.any
   0x0000fffff7fb1f9c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb1fa0:	9e620120	scvtf	d0, x9
   0x0000fffff7fb1fa4:	14000002	b	0xfffff7fb1fac
   0x0000fffff7fb1fa8:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb1fac:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb1fb0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1fb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1fb8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1fbc:	54000120	b.eq	0xfffff7fb1fe0  // b.none
   0x0000fffff7fb1fc0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb1fc4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1fc8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1fcc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1fd0:	54000161	b.ne	0xfffff7fb1ffc  // b.any
   0x0000fffff7fb1fd4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb1fd8:	9e620121	scvtf	d1, x9
   0x0000fffff7fb1fdc:	14000002	b	0xfffff7fb1fe4
   0x0000fffff7fb1fe0:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb1fe4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb1fe8:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb1fec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1ff0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1ff4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb1ff8:	17ffffde	b	0xfffff7fb1f70
   0x0000fffff7fb1ffc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb2000:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2004:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2008:	aa1503e2	mov	x2, x21
   0x0000fffff7fb200c:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fb2010:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2014:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2018:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fb201c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb2020:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2024:	d63f0200	blr	x16
   0x0000fffff7fb2028:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb202c:	540079a0	b.eq	0xfffff7fb2f60  // b.none
   0x0000fffff7fb2030:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb2034:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb2038:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb203c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb2040:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb2044:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb2048:	36d801d1	tbz	w17, #27, 0xfffff7fb2080
   0x0000fffff7fb204c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2050:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2054:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2058:	54000281	b.ne	0xfffff7fb20a8  // b.any
   0x0000fffff7fb205c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb2060:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2064:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2068:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb206c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2070:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2074:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2078:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb207c:	54000169	b.ls	0xfffff7fb20a8  // b.plast
   0x0000fffff7fb2080:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2084:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2088:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb208c:	36d80091	tbz	w17, #27, 0xfffff7fb209c
   0x0000fffff7fb2090:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2094:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2098:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb209c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb20a0:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb20a4:	1400000e	b	0xfffff7fb20dc
   0x0000fffff7fb20a8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb20ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb20b0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb20b4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb20b8:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fb20bc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb20c0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb20c4:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb20c8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb20cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb20d0:	d63f0200	blr	x16
   0x0000fffff7fb20d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb20d8:	54007480	b.eq	0xfffff7fb2f68  // b.none
   0x0000fffff7fb20dc:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb20e0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb20e4:	540003a0	b.eq	0xfffff7fb2158  // b.none
   0x0000fffff7fb20e8:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb20ec:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb20f0:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb20f4:	36d801d1	tbz	w17, #27, 0xfffff7fb212c
   0x0000fffff7fb20f8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb20fc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2100:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2104:	540002a1	b.ne	0xfffff7fb2158  // b.any
   0x0000fffff7fb2108:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb210c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2110:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2114:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2118:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb211c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2120:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2124:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2128:	54000189	b.ls	0xfffff7fb2158  // b.plast
   0x0000fffff7fb212c:	36d8008d	tbz	w13, #27, 0xfffff7fb213c
   0x0000fffff7fb2130:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2134:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2138:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb213c:	36d80091	tbz	w17, #27, 0xfffff7fb214c
   0x0000fffff7fb2140:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2144:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2148:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb214c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb2150:	b900016d	str	w13, [x11]
   0x0000fffff7fb2154:	1400000e	b	0xfffff7fb218c
   0x0000fffff7fb2158:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb215c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2160:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2164:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2168:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fb216c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2170:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2174:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb2178:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb217c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2180:	d63f0200	blr	x16
   0x0000fffff7fb2184:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2188:	54006f40	b.eq	0xfffff7fb2f70  // b.none
   0x0000fffff7fb218c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb2190:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb2194:	540004a0	b.eq	0xfffff7fb2228  // b.none
   0x0000fffff7fb2198:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb219c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb21a0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb21a4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb21a8:	54000400	b.eq	0xfffff7fb2228  // b.none
   0x0000fffff7fb21ac:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb21b0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb21b4:	36d801d1	tbz	w17, #27, 0xfffff7fb21ec
   0x0000fffff7fb21b8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb21bc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb21c0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb21c4:	54000321	b.ne	0xfffff7fb2228  // b.any
   0x0000fffff7fb21c8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb21cc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb21d0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb21d4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb21d8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb21dc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb21e0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb21e4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb21e8:	54000209	b.ls	0xfffff7fb2228  // b.plast
   0x0000fffff7fb21ec:	36d8008d	tbz	w13, #27, 0xfffff7fb21fc
   0x0000fffff7fb21f0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb21f4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb21f8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb21fc:	36d80091	tbz	w17, #27, 0xfffff7fb220c
   0x0000fffff7fb2200:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2204:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2208:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb220c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb2210:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb2214:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb2218:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb221c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb2220:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb2224:	1400000e	b	0xfffff7fb225c
   0x0000fffff7fb2228:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb222c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2230:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2234:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2238:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fb223c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2240:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2244:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb2248:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb224c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2250:	d63f0200	blr	x16
   0x0000fffff7fb2254:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2258:	54006900	b.eq	0xfffff7fb2f78  // b.none
   0x0000fffff7fb225c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb2260:	37d806a9	tbnz	w9, #27, 0xfffff7fb2334
   0x0000fffff7fb2264:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb2268:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb226c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2270:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2274:	540001c1	b.ne	0xfffff7fb22ac  // b.any
   0x0000fffff7fb2278:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb227c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2280:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2284:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2288:	54000121	b.ne	0xfffff7fb22ac  // b.any
   0x0000fffff7fb228c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb2290:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb2294:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb2298:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb229c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb22a0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb22a4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb22a8:	14000030	b	0xfffff7fb2368
   0x0000fffff7fb22ac:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb22b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb22b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb22b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb22bc:	54000120	b.eq	0xfffff7fb22e0  // b.none
   0x0000fffff7fb22c0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb22c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb22c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb22cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb22d0:	54000321	b.ne	0xfffff7fb2334  // b.any
   0x0000fffff7fb22d4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb22d8:	9e620120	scvtf	d0, x9
   0x0000fffff7fb22dc:	14000002	b	0xfffff7fb22e4
   0x0000fffff7fb22e0:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb22e4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb22e8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb22ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb22f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb22f4:	54000120	b.eq	0xfffff7fb2318  // b.none
   0x0000fffff7fb22f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb22fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2300:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2304:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2308:	54000161	b.ne	0xfffff7fb2334  // b.any
   0x0000fffff7fb230c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb2310:	9e620121	scvtf	d1, x9
   0x0000fffff7fb2314:	14000002	b	0xfffff7fb231c
   0x0000fffff7fb2318:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb231c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb2320:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb2324:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2328:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb232c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb2330:	17ffffde	b	0xfffff7fb22a8
   0x0000fffff7fb2334:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb2338:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb233c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2340:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2344:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fb2348:	aa1403e4	mov	x4, x20
   0x0000fffff7fb234c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2350:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fb2354:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb2358:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb235c:	d63f0200	blr	x16
   0x0000fffff7fb2360:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2364:	540060e0	b.eq	0xfffff7fb2f80  // b.none
   0x0000fffff7fb2368:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb236c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb2370:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb2374:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb2378:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb237c:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb2380:	36d801d1	tbz	w17, #27, 0xfffff7fb23b8
   0x0000fffff7fb2384:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2388:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb238c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2390:	54000281	b.ne	0xfffff7fb23e0  // b.any
   0x0000fffff7fb2394:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb2398:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb239c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb23a0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb23a4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb23a8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb23ac:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb23b0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb23b4:	54000169	b.ls	0xfffff7fb23e0  // b.plast
   0x0000fffff7fb23b8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb23bc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb23c0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb23c4:	36d80091	tbz	w17, #27, 0xfffff7fb23d4
   0x0000fffff7fb23c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb23cc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb23d0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb23d4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb23d8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb23dc:	1400000e	b	0xfffff7fb2414
   0x0000fffff7fb23e0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb23e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb23e8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb23ec:	aa1503e2	mov	x2, x21
   0x0000fffff7fb23f0:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fb23f4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb23f8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb23fc:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb2400:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb2404:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2408:	d63f0200	blr	x16
   0x0000fffff7fb240c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2410:	54005bc0	b.eq	0xfffff7fb2f88  // b.none
   0x0000fffff7fb2414:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb2418:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb241c:	540003a0	b.eq	0xfffff7fb2490  // b.none
   0x0000fffff7fb2420:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb2424:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb2428:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb242c:	36d801d1	tbz	w17, #27, 0xfffff7fb2464
   0x0000fffff7fb2430:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2434:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2438:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb243c:	540002a1	b.ne	0xfffff7fb2490  // b.any
   0x0000fffff7fb2440:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb2444:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2448:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb244c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2450:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2454:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2458:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb245c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2460:	54000189	b.ls	0xfffff7fb2490  // b.plast
   0x0000fffff7fb2464:	36d8008d	tbz	w13, #27, 0xfffff7fb2474
   0x0000fffff7fb2468:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb246c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2470:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb2474:	36d80091	tbz	w17, #27, 0xfffff7fb2484
   0x0000fffff7fb2478:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb247c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2480:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2484:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb2488:	b900016d	str	w13, [x11]
   0x0000fffff7fb248c:	1400000e	b	0xfffff7fb24c4
   0x0000fffff7fb2490:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb2494:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2498:	aa1303e1	mov	x1, x19
   0x0000fffff7fb249c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb24a0:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fb24a4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb24a8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb24ac:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb24b0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb24b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb24b8:	d63f0200	blr	x16
   0x0000fffff7fb24bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb24c0:	54005680	b.eq	0xfffff7fb2f90  // b.none
   0x0000fffff7fb24c4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb24c8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb24cc:	540004a0	b.eq	0xfffff7fb2560  // b.none
   0x0000fffff7fb24d0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb24d4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb24d8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb24dc:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb24e0:	54000400	b.eq	0xfffff7fb2560  // b.none
   0x0000fffff7fb24e4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb24e8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb24ec:	36d801d1	tbz	w17, #27, 0xfffff7fb2524
   0x0000fffff7fb24f0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb24f4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb24f8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb24fc:	54000321	b.ne	0xfffff7fb2560  // b.any
   0x0000fffff7fb2500:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb2504:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2508:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb250c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2510:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2514:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2518:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb251c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2520:	54000209	b.ls	0xfffff7fb2560  // b.plast
   0x0000fffff7fb2524:	36d8008d	tbz	w13, #27, 0xfffff7fb2534
   0x0000fffff7fb2528:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb252c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2530:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb2534:	36d80091	tbz	w17, #27, 0xfffff7fb2544
   0x0000fffff7fb2538:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb253c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2540:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2544:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb2548:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb254c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb2550:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb2554:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb2558:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb255c:	1400000e	b	0xfffff7fb2594
   0x0000fffff7fb2560:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb2564:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2568:	aa1303e1	mov	x1, x19
   0x0000fffff7fb256c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2570:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fb2574:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2578:	aa1603e5	mov	x5, x22
   0x0000fffff7fb257c:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb2580:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb2584:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2588:	d63f0200	blr	x16
   0x0000fffff7fb258c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2590:	54005040	b.eq	0xfffff7fb2f98  // b.none
   0x0000fffff7fb2594:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb2598:	37d806a9	tbnz	w9, #27, 0xfffff7fb266c
   0x0000fffff7fb259c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb25a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb25a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb25a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb25ac:	540001c1	b.ne	0xfffff7fb25e4  // b.any
   0x0000fffff7fb25b0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb25b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb25b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb25bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb25c0:	54000121	b.ne	0xfffff7fb25e4  // b.any
   0x0000fffff7fb25c4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb25c8:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb25cc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb25d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb25d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb25d8:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb25dc:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb25e0:	14000030	b	0xfffff7fb26a0
   0x0000fffff7fb25e4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb25e8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb25ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb25f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb25f4:	54000120	b.eq	0xfffff7fb2618  // b.none
   0x0000fffff7fb25f8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb25fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2600:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2604:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2608:	54000321	b.ne	0xfffff7fb266c  // b.any
   0x0000fffff7fb260c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb2610:	9e620120	scvtf	d0, x9
   0x0000fffff7fb2614:	14000002	b	0xfffff7fb261c
   0x0000fffff7fb2618:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb261c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb2620:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2624:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2628:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb262c:	54000120	b.eq	0xfffff7fb2650  // b.none
   0x0000fffff7fb2630:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb2634:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2638:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb263c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2640:	54000161	b.ne	0xfffff7fb266c  // b.any
   0x0000fffff7fb2644:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb2648:	9e620121	scvtf	d1, x9
   0x0000fffff7fb264c:	14000002	b	0xfffff7fb2654
   0x0000fffff7fb2650:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb2654:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb2658:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb265c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2660:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2664:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb2668:	17ffffde	b	0xfffff7fb25e0
   0x0000fffff7fb266c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb2670:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2674:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2678:	aa1503e2	mov	x2, x21
   0x0000fffff7fb267c:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fb2680:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2684:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2688:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fb268c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb2690:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2694:	d63f0200	blr	x16
   0x0000fffff7fb2698:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb269c:	54004820	b.eq	0xfffff7fb2fa0  // b.none
   0x0000fffff7fb26a0:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb26a4:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb26a8:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb26ac:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb26b0:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb26b4:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb26b8:	36d801d1	tbz	w17, #27, 0xfffff7fb26f0
   0x0000fffff7fb26bc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb26c0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb26c4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb26c8:	54000281	b.ne	0xfffff7fb2718  // b.any
   0x0000fffff7fb26cc:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb26d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb26d4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb26d8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb26dc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb26e0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb26e4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb26e8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb26ec:	54000169	b.ls	0xfffff7fb2718  // b.plast
   0x0000fffff7fb26f0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb26f4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb26f8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb26fc:	36d80091	tbz	w17, #27, 0xfffff7fb270c
   0x0000fffff7fb2700:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2704:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2708:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb270c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb2710:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb2714:	1400000e	b	0xfffff7fb274c
   0x0000fffff7fb2718:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb271c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2720:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2724:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2728:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fb272c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2730:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2734:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb2738:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb273c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2740:	d63f0200	blr	x16
   0x0000fffff7fb2744:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2748:	54004300	b.eq	0xfffff7fb2fa8  // b.none
   0x0000fffff7fb274c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb2750:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb2754:	540003a0	b.eq	0xfffff7fb27c8  // b.none
   0x0000fffff7fb2758:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb275c:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb2760:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb2764:	36d801d1	tbz	w17, #27, 0xfffff7fb279c
   0x0000fffff7fb2768:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb276c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2770:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2774:	540002a1	b.ne	0xfffff7fb27c8  // b.any
   0x0000fffff7fb2778:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb277c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2780:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2784:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2788:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb278c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2790:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2794:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2798:	54000189	b.ls	0xfffff7fb27c8  // b.plast
   0x0000fffff7fb279c:	36d8008d	tbz	w13, #27, 0xfffff7fb27ac
   0x0000fffff7fb27a0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb27a4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb27a8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb27ac:	36d80091	tbz	w17, #27, 0xfffff7fb27bc
   0x0000fffff7fb27b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb27b4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb27b8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb27bc:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb27c0:	b900016d	str	w13, [x11]
   0x0000fffff7fb27c4:	1400000e	b	0xfffff7fb27fc
   0x0000fffff7fb27c8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb27cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb27d0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb27d4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb27d8:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fb27dc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb27e0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb27e4:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb27e8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb27ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb27f0:	d63f0200	blr	x16
   0x0000fffff7fb27f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb27f8:	54003dc0	b.eq	0xfffff7fb2fb0  // b.none
   0x0000fffff7fb27fc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb2800:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb2804:	540004a0	b.eq	0xfffff7fb2898  // b.none
   0x0000fffff7fb2808:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb280c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb2810:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb2814:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb2818:	54000400	b.eq	0xfffff7fb2898  // b.none
   0x0000fffff7fb281c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb2820:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb2824:	36d801d1	tbz	w17, #27, 0xfffff7fb285c
   0x0000fffff7fb2828:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb282c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2830:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2834:	54000321	b.ne	0xfffff7fb2898  // b.any
   0x0000fffff7fb2838:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb283c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2840:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2844:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2848:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb284c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2850:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2854:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2858:	54000209	b.ls	0xfffff7fb2898  // b.plast
   0x0000fffff7fb285c:	36d8008d	tbz	w13, #27, 0xfffff7fb286c
   0x0000fffff7fb2860:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2864:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2868:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb286c:	36d80091	tbz	w17, #27, 0xfffff7fb287c
   0x0000fffff7fb2870:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2874:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2878:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb287c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb2880:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb2884:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb2888:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb288c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb2890:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb2894:	1400000e	b	0xfffff7fb28cc
   0x0000fffff7fb2898:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb289c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb28a0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb28a4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb28a8:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fb28ac:	aa1403e4	mov	x4, x20
   0x0000fffff7fb28b0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb28b4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb28b8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb28bc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb28c0:	d63f0200	blr	x16
   0x0000fffff7fb28c4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb28c8:	54003780	b.eq	0xfffff7fb2fb8  // b.none
   0x0000fffff7fb28cc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb28d0:	37d806a9	tbnz	w9, #27, 0xfffff7fb29a4
   0x0000fffff7fb28d4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb28d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb28dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb28e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb28e4:	540001c1	b.ne	0xfffff7fb291c  // b.any
   0x0000fffff7fb28e8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb28ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb28f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb28f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb28f8:	54000121	b.ne	0xfffff7fb291c  // b.any
   0x0000fffff7fb28fc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb2900:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb2904:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb2908:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb290c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2910:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb2914:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb2918:	14000030	b	0xfffff7fb29d8
   0x0000fffff7fb291c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb2920:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2924:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2928:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb292c:	54000120	b.eq	0xfffff7fb2950  // b.none
   0x0000fffff7fb2930:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb2934:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2938:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb293c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2940:	54000321	b.ne	0xfffff7fb29a4  // b.any
   0x0000fffff7fb2944:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb2948:	9e620120	scvtf	d0, x9
   0x0000fffff7fb294c:	14000002	b	0xfffff7fb2954
   0x0000fffff7fb2950:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb2954:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb2958:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb295c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2960:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2964:	54000120	b.eq	0xfffff7fb2988  // b.none
   0x0000fffff7fb2968:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb296c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2970:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2974:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2978:	54000161	b.ne	0xfffff7fb29a4  // b.any
   0x0000fffff7fb297c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb2980:	9e620121	scvtf	d1, x9
   0x0000fffff7fb2984:	14000002	b	0xfffff7fb298c
   0x0000fffff7fb2988:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb298c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb2990:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb2994:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2998:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb299c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb29a0:	17ffffde	b	0xfffff7fb2918
   0x0000fffff7fb29a4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb29a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb29ac:	aa1303e1	mov	x1, x19
   0x0000fffff7fb29b0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb29b4:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fb29b8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb29bc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb29c0:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fb29c4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb29c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb29cc:	d63f0200	blr	x16
   0x0000fffff7fb29d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb29d4:	54002f60	b.eq	0xfffff7fb2fc0  // b.none
   0x0000fffff7fb29d8:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb29dc:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb29e0:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb29e4:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb29e8:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb29ec:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb29f0:	36d801d1	tbz	w17, #27, 0xfffff7fb2a28
   0x0000fffff7fb29f4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb29f8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb29fc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2a00:	54000281	b.ne	0xfffff7fb2a50  // b.any
   0x0000fffff7fb2a04:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb2a08:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2a0c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2a10:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2a14:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2a18:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2a1c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2a20:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2a24:	54000169	b.ls	0xfffff7fb2a50  // b.plast
   0x0000fffff7fb2a28:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2a2c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2a30:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb2a34:	36d80091	tbz	w17, #27, 0xfffff7fb2a44
   0x0000fffff7fb2a38:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2a3c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2a40:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2a44:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb2a48:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb2a4c:	1400000e	b	0xfffff7fb2a84
   0x0000fffff7fb2a50:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb2a54:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2a58:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2a5c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2a60:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fb2a64:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2a68:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2a6c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb2a70:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb2a74:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2a78:	d63f0200	blr	x16
   0x0000fffff7fb2a7c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2a80:	54002a40	b.eq	0xfffff7fb2fc8  // b.none
   0x0000fffff7fb2a84:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb2a88:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb2a8c:	540003a0	b.eq	0xfffff7fb2b00  // b.none
   0x0000fffff7fb2a90:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb2a94:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb2a98:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb2a9c:	36d801d1	tbz	w17, #27, 0xfffff7fb2ad4
   0x0000fffff7fb2aa0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2aa4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2aa8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2aac:	540002a1	b.ne	0xfffff7fb2b00  // b.any
   0x0000fffff7fb2ab0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb2ab4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2ab8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2abc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2ac0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2ac4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2ac8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2acc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2ad0:	54000189	b.ls	0xfffff7fb2b00  // b.plast
   0x0000fffff7fb2ad4:	36d8008d	tbz	w13, #27, 0xfffff7fb2ae4
   0x0000fffff7fb2ad8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2adc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2ae0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb2ae4:	36d80091	tbz	w17, #27, 0xfffff7fb2af4
   0x0000fffff7fb2ae8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2aec:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2af0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2af4:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb2af8:	b900016d	str	w13, [x11]
   0x0000fffff7fb2afc:	1400000e	b	0xfffff7fb2b34
   0x0000fffff7fb2b00:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb2b04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2b08:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2b0c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2b10:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fb2b14:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2b18:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2b1c:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb2b20:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb2b24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2b28:	d63f0200	blr	x16
   0x0000fffff7fb2b2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2b30:	54002500	b.eq	0xfffff7fb2fd0  // b.none
   0x0000fffff7fb2b34:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb2b38:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb2b3c:	540004a0	b.eq	0xfffff7fb2bd0  // b.none
   0x0000fffff7fb2b40:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb2b44:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb2b48:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb2b4c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb2b50:	54000400	b.eq	0xfffff7fb2bd0  // b.none
   0x0000fffff7fb2b54:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb2b58:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb2b5c:	36d801d1	tbz	w17, #27, 0xfffff7fb2b94
   0x0000fffff7fb2b60:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2b64:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2b68:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2b6c:	54000321	b.ne	0xfffff7fb2bd0  // b.any
   0x0000fffff7fb2b70:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb2b74:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2b78:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2b7c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2b80:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2b84:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2b88:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2b8c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2b90:	54000209	b.ls	0xfffff7fb2bd0  // b.plast
   0x0000fffff7fb2b94:	36d8008d	tbz	w13, #27, 0xfffff7fb2ba4
   0x0000fffff7fb2b98:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2b9c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2ba0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb2ba4:	36d80091	tbz	w17, #27, 0xfffff7fb2bb4
   0x0000fffff7fb2ba8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2bac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2bb0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2bb4:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb2bb8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb2bbc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb2bc0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb2bc4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb2bc8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb2bcc:	1400000e	b	0xfffff7fb2c04
   0x0000fffff7fb2bd0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb2bd4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2bd8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2bdc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2be0:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fb2be4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2be8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2bec:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb2bf0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb2bf4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2bf8:	d63f0200	blr	x16
   0x0000fffff7fb2bfc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2c00:	54001ec0	b.eq	0xfffff7fb2fd8  // b.none
   0x0000fffff7fb2c04:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb2c08:	37d806a9	tbnz	w9, #27, 0xfffff7fb2cdc
   0x0000fffff7fb2c0c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb2c10:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2c14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2c18:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2c1c:	540001c1	b.ne	0xfffff7fb2c54  // b.any
   0x0000fffff7fb2c20:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb2c24:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2c28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2c2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2c30:	54000121	b.ne	0xfffff7fb2c54  // b.any
   0x0000fffff7fb2c34:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb2c38:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb2c3c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb2c40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2c44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2c48:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb2c4c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb2c50:	14000030	b	0xfffff7fb2d10
   0x0000fffff7fb2c54:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb2c58:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2c5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2c60:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2c64:	54000120	b.eq	0xfffff7fb2c88  // b.none
   0x0000fffff7fb2c68:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb2c6c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2c70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2c74:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2c78:	54000321	b.ne	0xfffff7fb2cdc  // b.any
   0x0000fffff7fb2c7c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb2c80:	9e620120	scvtf	d0, x9
   0x0000fffff7fb2c84:	14000002	b	0xfffff7fb2c8c
   0x0000fffff7fb2c88:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb2c8c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb2c90:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2c94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2c98:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2c9c:	54000120	b.eq	0xfffff7fb2cc0  // b.none
   0x0000fffff7fb2ca0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb2ca4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2ca8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2cac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2cb0:	54000161	b.ne	0xfffff7fb2cdc  // b.any
   0x0000fffff7fb2cb4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb2cb8:	9e620121	scvtf	d1, x9
   0x0000fffff7fb2cbc:	14000002	b	0xfffff7fb2cc4
   0x0000fffff7fb2cc0:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb2cc4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb2cc8:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb2ccc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2cd0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2cd4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb2cd8:	17ffffde	b	0xfffff7fb2c50
   0x0000fffff7fb2cdc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb2ce0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2ce4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2ce8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2cec:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fb2cf0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2cf4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2cf8:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fb2cfc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb2d00:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2d04:	d63f0200	blr	x16
   0x0000fffff7fb2d08:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2d0c:	540016a0	b.eq	0xfffff7fb2fe0  // b.none
   0x0000fffff7fb2d10:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb2d14:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb2d18:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb2d1c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb2d20:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb2d24:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb2d28:	36d801d1	tbz	w17, #27, 0xfffff7fb2d60
   0x0000fffff7fb2d2c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2d30:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2d34:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2d38:	54000281	b.ne	0xfffff7fb2d88  // b.any
   0x0000fffff7fb2d3c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb2d40:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2d44:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2d48:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2d4c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2d50:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2d54:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2d58:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2d5c:	54000169	b.ls	0xfffff7fb2d88  // b.plast
   0x0000fffff7fb2d60:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2d64:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2d68:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb2d6c:	36d80091	tbz	w17, #27, 0xfffff7fb2d7c
   0x0000fffff7fb2d70:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2d74:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2d78:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2d7c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb2d80:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb2d84:	1400000e	b	0xfffff7fb2dbc
   0x0000fffff7fb2d88:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb2d8c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2d90:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2d94:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2d98:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fb2d9c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2da0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2da4:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb2da8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb2dac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2db0:	d63f0200	blr	x16
   0x0000fffff7fb2db4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2db8:	54001180	b.eq	0xfffff7fb2fe8  // b.none
   0x0000fffff7fb2dbc:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb2dc0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb2dc4:	540003a0	b.eq	0xfffff7fb2e38  // b.none
   0x0000fffff7fb2dc8:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb2dcc:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb2dd0:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb2dd4:	36d801d1	tbz	w17, #27, 0xfffff7fb2e0c
   0x0000fffff7fb2dd8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2ddc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2de0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2de4:	540002a1	b.ne	0xfffff7fb2e38  // b.any
   0x0000fffff7fb2de8:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb2dec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2df0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2df4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2df8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2dfc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2e00:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2e04:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2e08:	54000189	b.ls	0xfffff7fb2e38  // b.plast
   0x0000fffff7fb2e0c:	36d8008d	tbz	w13, #27, 0xfffff7fb2e1c
   0x0000fffff7fb2e10:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2e14:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2e18:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb2e1c:	36d80091	tbz	w17, #27, 0xfffff7fb2e2c
   0x0000fffff7fb2e20:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2e24:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2e28:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2e2c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb2e30:	b900016d	str	w13, [x11]
   0x0000fffff7fb2e34:	1400000e	b	0xfffff7fb2e6c
   0x0000fffff7fb2e38:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb2e3c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2e40:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2e44:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2e48:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fb2e4c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2e50:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2e54:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb2e58:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb2e5c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2e60:	d63f0200	blr	x16
   0x0000fffff7fb2e64:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2e68:	54000c40	b.eq	0xfffff7fb2ff0  // b.none
   0x0000fffff7fb2e6c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb2e70:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2e74:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2e78:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2e7c:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fb2e80:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2e84:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2e88:	d2869090	mov	x16, #0x3484                	// #13444
   0x0000fffff7fb2e8c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb2e90:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2e94:	d63f0200	blr	x16
   0x0000fffff7fb2e98:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb2e9c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb2ea0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb2ea4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb2ea8:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fb2eac:	d65f03c0	ret
   0x0000fffff7fb2eb0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2eb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2eb8:	b900028a	str	w10, [x20]
   0x0000fffff7fb2ebc:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fb2ec0:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb2ec4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb2ec8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb2ecc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb2ed0:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fb2ed4:	d65f03c0	ret
   0x0000fffff7fb2ed8:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fb2edc:	17fffff5	b	0xfffff7fb2eb0
   0x0000fffff7fb2ee0:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fb2ee4:	17fffff3	b	0xfffff7fb2eb0
   0x0000fffff7fb2ee8:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fb2eec:	17fffff1	b	0xfffff7fb2eb0
   0x0000fffff7fb2ef0:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7fb2ef4:	17ffffef	b	0xfffff7fb2eb0
   0x0000fffff7fb2ef8:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7fb2efc:	17ffffed	b	0xfffff7fb2eb0
   0x0000fffff7fb2f00:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fb2f04:	17ffffeb	b	0xfffff7fb2eb0
   0x0000fffff7fb2f08:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fb2f0c:	17ffffe9	b	0xfffff7fb2eb0
   0x0000fffff7fb2f10:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fb2f14:	17ffffe7	b	0xfffff7fb2eb0
   0x0000fffff7fb2f18:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fb2f1c:	17ffffe5	b	0xfffff7fb2eb0
   0x0000fffff7fb2f20:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fb2f24:	17ffffe3	b	0xfffff7fb2eb0
   0x0000fffff7fb2f28:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fb2f2c:	17ffffe1	b	0xfffff7fb2eb0
   0x0000fffff7fb2f30:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fb2f34:	17ffffdf	b	0xfffff7fb2eb0
   0x0000fffff7fb2f38:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fb2f3c:	17ffffdd	b	0xfffff7fb2eb0
   0x0000fffff7fb2f40:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fb2f44:	17ffffdb	b	0xfffff7fb2eb0
   0x0000fffff7fb2f48:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fb2f4c:	17ffffd9	b	0xfffff7fb2eb0
   0x0000fffff7fb2f50:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fb2f54:	17ffffd7	b	0xfffff7fb2eb0
   0x0000fffff7fb2f58:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fb2f5c:	17ffffd5	b	0xfffff7fb2eb0
   0x0000fffff7fb2f60:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fb2f64:	17ffffd3	b	0xfffff7fb2eb0
   0x0000fffff7fb2f68:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fb2f6c:	17ffffd1	b	0xfffff7fb2eb0
   0x0000fffff7fb2f70:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fb2f74:	17ffffcf	b	0xfffff7fb2eb0
   0x0000fffff7fb2f78:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fb2f7c:	17ffffcd	b	0xfffff7fb2eb0
   0x0000fffff7fb2f80:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fb2f84:	17ffffcb	b	0xfffff7fb2eb0
   0x0000fffff7fb2f88:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fb2f8c:	17ffffc9	b	0xfffff7fb2eb0
   0x0000fffff7fb2f90:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fb2f94:	17ffffc7	b	0xfffff7fb2eb0
   0x0000fffff7fb2f98:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fb2f9c:	17ffffc5	b	0xfffff7fb2eb0
   0x0000fffff7fb2fa0:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fb2fa4:	17ffffc3	b	0xfffff7fb2eb0
   0x0000fffff7fb2fa8:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fb2fac:	17ffffc1	b	0xfffff7fb2eb0
   0x0000fffff7fb2fb0:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fb2fb4:	17ffffbf	b	0xfffff7fb2eb0
   0x0000fffff7fb2fb8:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fb2fbc:	17ffffbd	b	0xfffff7fb2eb0
   0x0000fffff7fb2fc0:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fb2fc4:	17ffffbb	b	0xfffff7fb2eb0
   0x0000fffff7fb2fc8:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fb2fcc:	17ffffb9	b	0xfffff7fb2eb0
   0x0000fffff7fb2fd0:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fb2fd4:	17ffffb7	b	0xfffff7fb2eb0
   0x0000fffff7fb2fd8:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fb2fdc:	17ffffb5	b	0xfffff7fb2eb0
   0x0000fffff7fb2fe0:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fb2fe4:	17ffffb3	b	0xfffff7fb2eb0
   0x0000fffff7fb2fe8:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fb2fec:	17ffffb1	b	0xfffff7fb2eb0
   0x0000fffff7fb2ff0:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fb2ff4:	17ffffaf	b	0xfffff7fb2eb0
   0x0000fffff7fb2ff8:	00000000	udf	#0
   0x0000fffff7fb2ffc:	00000000	udf	#0
End of assembler dump.
