
/tmp/sqgi-v21-native-profile/floats/638430-5.bin:     file format binary


Disassembly of section .data:

0000ffff9c6d1000 <.data>:
    ffff9c6d1000:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    ffff9c6d1004:	910003fd 	mov	x29, sp
    ffff9c6d1008:	a9bf53f3 	stp	x19, x20, [sp, #-16]!
    ffff9c6d100c:	a9bf5bf5 	stp	x21, x22, [sp, #-16]!
    ffff9c6d1010:	d13003ff 	sub	sp, sp, #0xc00
    ffff9c6d1014:	aa0003f3 	mov	x19, x0
    ffff9c6d1018:	aa0103f4 	mov	x20, x1
    ffff9c6d101c:	aa0203f5 	mov	x21, x2
    ffff9c6d1020:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d1024:	912063e1 	add	x1, sp, #0x818
    ffff9c6d1028:	d2856c02 	mov	x2, #0x2b60                	// #11104
    ffff9c6d102c:	f2ba7742 	movk	x2, #0xd3ba, lsl #16
    ffff9c6d1030:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6d1034:	d2910410 	mov	x16, #0x8820                	// #34848
    ffff9c6d1038:	f2ba2290 	movk	x16, #0xd114, lsl #16
    ffff9c6d103c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d1040:	d63f0200 	blr	x16
    ffff9c6d1044:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d1048:	f90403e9 	str	x9, [sp, #2048]
    ffff9c6d104c:	f9401ea9 	ldr	x9, [x21, #56]
    ffff9c6d1050:	d285da0a 	mov	x10, #0x2ed0                	// #11984
    ffff9c6d1054:	f2ba778a 	movk	x10, #0xd3bc, lsl #16
    ffff9c6d1058:	f2d5554a 	movk	x10, #0xaaaa, lsl #32
    ffff9c6d105c:	eb0a013f 	cmp	x9, x10
    ffff9c6d1060:	54002021 	b.ne	0xffff9c6d1464  // b.any
    ffff9c6d1064:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d1068:	aa1303e1 	mov	x1, x19
    ffff9c6d106c:	d2800042 	mov	x2, #0x2                   	// #2
    ffff9c6d1070:	d2822610 	mov	x16, #0x1130                	// #4400
    ffff9c6d1074:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d1078:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d107c:	d63f0200 	blr	x16
    ffff9c6d1080:	f100001f 	cmp	x0, #0x0
    ffff9c6d1084:	54001f00 	b.eq	0xffff9c6d1464  // b.none
    ffff9c6d1088:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d108c:	aa1303e1 	mov	x1, x19
    ffff9c6d1090:	d2800062 	mov	x2, #0x3                   	// #3
    ffff9c6d1094:	d2822610 	mov	x16, #0x1130                	// #4400
    ffff9c6d1098:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d109c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d10a0:	d63f0200 	blr	x16
    ffff9c6d10a4:	f100001f 	cmp	x0, #0x0
    ffff9c6d10a8:	54001de0 	b.eq	0xffff9c6d1464  // b.none
    ffff9c6d10ac:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d10b0:	aa1303e1 	mov	x1, x19
    ffff9c6d10b4:	d2800082 	mov	x2, #0x4                   	// #4
    ffff9c6d10b8:	d2822610 	mov	x16, #0x1130                	// #4400
    ffff9c6d10bc:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d10c0:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d10c4:	d63f0200 	blr	x16
    ffff9c6d10c8:	f100001f 	cmp	x0, #0x0
    ffff9c6d10cc:	54001cc0 	b.eq	0xffff9c6d1464  // b.none
    ffff9c6d10d0:	b9401269 	ldr	w9, [x19, #16]
    ffff9c6d10d4:	5280004a 	mov	w10, #0x2                   	// #2
    ffff9c6d10d8:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6d10dc:	eb0a013f 	cmp	x9, x10
    ffff9c6d10e0:	54001c21 	b.ne	0xffff9c6d1464  // b.any
    ffff9c6d10e4:	f9400e69 	ldr	x9, [x19, #24]
    ffff9c6d10e8:	f90007e9 	str	x9, [sp, #8]
    ffff9c6d10ec:	b9402269 	ldr	w9, [x19, #32]
    ffff9c6d10f0:	5280008a 	mov	w10, #0x4                   	// #4
    ffff9c6d10f4:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6d10f8:	eb0a013f 	cmp	x9, x10
    ffff9c6d10fc:	54001b41 	b.ne	0xffff9c6d1464  // b.any
    ffff9c6d1100:	fd401660 	ldr	d0, [x19, #40]
    ffff9c6d1104:	fd000be0 	str	d0, [sp, #16]
    ffff9c6d1108:	b9403269 	ldr	w9, [x19, #48]
    ffff9c6d110c:	5280008a 	mov	w10, #0x4                   	// #4
    ffff9c6d1110:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6d1114:	eb0a013f 	cmp	x9, x10
    ffff9c6d1118:	54001a61 	b.ne	0xffff9c6d1464  // b.any
    ffff9c6d111c:	fd401e60 	ldr	d0, [x19, #56]
    ffff9c6d1120:	fd000fe0 	str	d0, [sp, #24]
    ffff9c6d1124:	b9404269 	ldr	w9, [x19, #64]
    ffff9c6d1128:	5280004a 	mov	w10, #0x2                   	// #2
    ffff9c6d112c:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6d1130:	eb0a013f 	cmp	x9, x10
    ffff9c6d1134:	54001981 	b.ne	0xffff9c6d1464  // b.any
    ffff9c6d1138:	f9402669 	ldr	x9, [x19, #72]
    ffff9c6d113c:	f90013e9 	str	x9, [sp, #32]
    ffff9c6d1140:	140000d4 	b	0xffff9c6d1490
    ffff9c6d1144:	f94013e9 	ldr	x9, [sp, #32]
    ffff9c6d1148:	f94007ea 	ldr	x10, [sp, #8]
    ffff9c6d114c:	eb0a013f 	cmp	x9, x10
    ffff9c6d1150:	54000eca 	b.ge	0xffff9c6d1328  // b.tcont
    ffff9c6d1154:	d2800029 	mov	x9, #0x1                   	// #1
    ffff9c6d1158:	f90403e9 	str	x9, [sp, #2048]
    ffff9c6d115c:	d2800229 	mov	x9, #0x11                  	// #17
    ffff9c6d1160:	f90017e9 	str	x9, [sp, #40]
    ffff9c6d1164:	f94013e9 	ldr	x9, [sp, #32]
    ffff9c6d1168:	d280022a 	mov	x10, #0x11                  	// #17
    ffff9c6d116c:	9aca0d2b 	sdiv	x11, x9, x10
    ffff9c6d1170:	9b0aa569 	msub	x9, x11, x10, x9
    ffff9c6d1174:	f90017e9 	str	x9, [sp, #40]
    ffff9c6d1178:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d117c:	f2e7f809 	movk	x9, #0x3fc0, lsl #48
    ffff9c6d1180:	f9001be9 	str	x9, [sp, #48]
    ffff9c6d1184:	f94017e9 	ldr	x9, [sp, #40]
    ffff9c6d1188:	9e620120 	scvtf	d0, x9
    ffff9c6d118c:	fd401be1 	ldr	d1, [sp, #48]
    ffff9c6d1190:	1e610800 	fmul	d0, d0, d1
    ffff9c6d1194:	fd0017e0 	str	d0, [sp, #40]
    ffff9c6d1198:	f9400be9 	ldr	x9, [sp, #16]
    ffff9c6d119c:	f9001be9 	str	x9, [sp, #48]
    ffff9c6d11a0:	14000011 	b	0xffff9c6d11e4
    ffff9c6d11a4:	d2800001 	mov	x1, #0x0                   	// #0
    ffff9c6d11a8:	d28ff002 	mov	x2, #0x7f80                	// #32640
    ffff9c6d11ac:	f2ba7782 	movk	x2, #0xd3bc, lsl #16
    ffff9c6d11b0:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6d11b4:	d2883e03 	mov	x3, #0x41f0                	// #16880
    ffff9c6d11b8:	f2ba79e3 	movk	x3, #0xd3cf, lsl #16
    ffff9c6d11bc:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff9c6d11c0:	d285dd04 	mov	x4, #0x2ee8                	// #12008
    ffff9c6d11c4:	f2ba7784 	movk	x4, #0xd3bc, lsl #16
    ffff9c6d11c8:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff9c6d11cc:	d28cc810 	mov	x16, #0x6640                	// #26176
    ffff9c6d11d0:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d11d4:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d11d8:	d63f0200 	blr	x16
    ffff9c6d11dc:	f100001f 	cmp	x0, #0x0
    ffff9c6d11e0:	54001420 	b.eq	0xffff9c6d1464  // b.none
    ffff9c6d11e4:	f9400be9 	ldr	x9, [sp, #16]
    ffff9c6d11e8:	f90027e9 	str	x9, [sp, #72]
    ffff9c6d11ec:	f94017e9 	ldr	x9, [sp, #40]
    ffff9c6d11f0:	f9002be9 	str	x9, [sp, #80]
    ffff9c6d11f4:	fd4027e0 	ldr	d0, [sp, #72]
    ffff9c6d11f8:	fd402be1 	ldr	d1, [sp, #80]
    ffff9c6d11fc:	1e613800 	fsub	d0, d0, d1
    ffff9c6d1200:	fd0037e0 	str	d0, [sp, #104]
    ffff9c6d1204:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d1208:	f2e7f809 	movk	x9, #0x3fc0, lsl #48
    ffff9c6d120c:	f9003be9 	str	x9, [sp, #112]
    ffff9c6d1210:	fd4037e0 	ldr	d0, [sp, #104]
    ffff9c6d1214:	fd403be1 	ldr	d1, [sp, #112]
    ffff9c6d1218:	1e610800 	fmul	d0, d0, d1
    ffff9c6d121c:	fd0037e0 	str	d0, [sp, #104]
    ffff9c6d1220:	f94037e9 	ldr	x9, [sp, #104]
    ffff9c6d1224:	f9001fe9 	str	x9, [sp, #56]
    ffff9c6d1228:	fd400be0 	ldr	d0, [sp, #16]
    ffff9c6d122c:	fd401be1 	ldr	d1, [sp, #48]
    ffff9c6d1230:	1e612800 	fadd	d0, d0, d1
    ffff9c6d1234:	fd0023e0 	str	d0, [sp, #64]
    ffff9c6d1238:	fd4023e0 	ldr	d0, [sp, #64]
    ffff9c6d123c:	fd401fe1 	ldr	d1, [sp, #56]
    ffff9c6d1240:	1e612800 	fadd	d0, d0, d1
    ffff9c6d1244:	fd0023e0 	str	d0, [sp, #64]
    ffff9c6d1248:	fd400fe0 	ldr	d0, [sp, #24]
    ffff9c6d124c:	fd4023e1 	ldr	d1, [sp, #64]
    ffff9c6d1250:	1e612800 	fadd	d0, d0, d1
    ffff9c6d1254:	fd000fe0 	str	d0, [sp, #24]
    ffff9c6d1258:	14000011 	b	0xffff9c6d129c
    ffff9c6d125c:	d2800001 	mov	x1, #0x0                   	// #0
    ffff9c6d1260:	d28ff202 	mov	x2, #0x7f90                	// #32656
    ffff9c6d1264:	f2ba7782 	movk	x2, #0xd3bc, lsl #16
    ffff9c6d1268:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6d126c:	d2826803 	mov	x3, #0x1340                	// #4928
    ffff9c6d1270:	f2ba79e3 	movk	x3, #0xd3cf, lsl #16
    ffff9c6d1274:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff9c6d1278:	d285dd04 	mov	x4, #0x2ee8                	// #12008
    ffff9c6d127c:	f2ba7784 	movk	x4, #0xd3bc, lsl #16
    ffff9c6d1280:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff9c6d1284:	d28cc810 	mov	x16, #0x6640                	// #26176
    ffff9c6d1288:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d128c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d1290:	d63f0200 	blr	x16
    ffff9c6d1294:	f100001f 	cmp	x0, #0x0
    ffff9c6d1298:	54000e60 	b.eq	0xffff9c6d1464  // b.none
    ffff9c6d129c:	f9400be9 	ldr	x9, [sp, #16]
    ffff9c6d12a0:	f9002be9 	str	x9, [sp, #80]
    ffff9c6d12a4:	f94017e9 	ldr	x9, [sp, #40]
    ffff9c6d12a8:	f9002fe9 	str	x9, [sp, #88]
    ffff9c6d12ac:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d12b0:	f2e7fd09 	movk	x9, #0x3fe8, lsl #48
    ffff9c6d12b4:	f90033e9 	str	x9, [sp, #96]
    ffff9c6d12b8:	fd402be0 	ldr	d0, [sp, #80]
    ffff9c6d12bc:	fd4033e1 	ldr	d1, [sp, #96]
    ffff9c6d12c0:	1e610800 	fmul	d0, d0, d1
    ffff9c6d12c4:	fd0037e0 	str	d0, [sp, #104]
    ffff9c6d12c8:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d12cc:	f2e7fe09 	movk	x9, #0x3ff0, lsl #48
    ffff9c6d12d0:	f9003be9 	str	x9, [sp, #112]
    ffff9c6d12d4:	fd403be0 	ldr	d0, [sp, #112]
    ffff9c6d12d8:	fd4033e1 	ldr	d1, [sp, #96]
    ffff9c6d12dc:	1e613800 	fsub	d0, d0, d1
    ffff9c6d12e0:	fd003be0 	str	d0, [sp, #112]
    ffff9c6d12e4:	fd402fe0 	ldr	d0, [sp, #88]
    ffff9c6d12e8:	fd403be1 	ldr	d1, [sp, #112]
    ffff9c6d12ec:	1e610800 	fmul	d0, d0, d1
    ffff9c6d12f0:	fd003be0 	str	d0, [sp, #112]
    ffff9c6d12f4:	fd4037e0 	ldr	d0, [sp, #104]
    ffff9c6d12f8:	fd403be1 	ldr	d1, [sp, #112]
    ffff9c6d12fc:	1e612800 	fadd	d0, d0, d1
    ffff9c6d1300:	fd0037e0 	str	d0, [sp, #104]
    ffff9c6d1304:	f94037e9 	ldr	x9, [sp, #104]
    ffff9c6d1308:	f90023e9 	str	x9, [sp, #64]
    ffff9c6d130c:	f94023e9 	ldr	x9, [sp, #64]
    ffff9c6d1310:	f9000be9 	str	x9, [sp, #16]
    ffff9c6d1314:	f94013e9 	ldr	x9, [sp, #32]
    ffff9c6d1318:	f90017e9 	str	x9, [sp, #40]
    ffff9c6d131c:	91000529 	add	x9, x9, #0x1
    ffff9c6d1320:	f90013e9 	str	x9, [sp, #32]
    ffff9c6d1324:	17ffff88 	b	0xffff9c6d1144
    ffff9c6d1328:	f94403e9 	ldr	x9, [sp, #2048]
    ffff9c6d132c:	f100013f 	cmp	x9, #0x0
    ffff9c6d1330:	54000800 	b.eq	0xffff9c6d1430  // b.none
    ffff9c6d1334:	aa1303e0 	mov	x0, x19
    ffff9c6d1338:	d2800041 	mov	x1, #0x2                   	// #2
    ffff9c6d133c:	910043e2 	add	x2, sp, #0x10
    ffff9c6d1340:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d1344:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d1348:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d134c:	d63f0200 	blr	x16
    ffff9c6d1350:	aa1303e0 	mov	x0, x19
    ffff9c6d1354:	d2800061 	mov	x1, #0x3                   	// #3
    ffff9c6d1358:	910063e2 	add	x2, sp, #0x18
    ffff9c6d135c:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d1360:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d1364:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d1368:	d63f0200 	blr	x16
    ffff9c6d136c:	aa1303e0 	mov	x0, x19
    ffff9c6d1370:	d2800081 	mov	x1, #0x4                   	// #4
    ffff9c6d1374:	f94013e2 	ldr	x2, [sp, #32]
    ffff9c6d1378:	d282ae10 	mov	x16, #0x1570                	// #5488
    ffff9c6d137c:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d1380:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d1384:	d63f0200 	blr	x16
    ffff9c6d1388:	aa1303e0 	mov	x0, x19
    ffff9c6d138c:	d28000a1 	mov	x1, #0x5                   	// #5
    ffff9c6d1390:	f94017e2 	ldr	x2, [sp, #40]
    ffff9c6d1394:	d282ae10 	mov	x16, #0x1570                	// #5488
    ffff9c6d1398:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d139c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d13a0:	d63f0200 	blr	x16
    ffff9c6d13a4:	aa1303e0 	mov	x0, x19
    ffff9c6d13a8:	d28000c1 	mov	x1, #0x6                   	// #6
    ffff9c6d13ac:	9100c3e2 	add	x2, sp, #0x30
    ffff9c6d13b0:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d13b4:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d13b8:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d13bc:	d63f0200 	blr	x16
    ffff9c6d13c0:	aa1303e0 	mov	x0, x19
    ffff9c6d13c4:	d28000e1 	mov	x1, #0x7                   	// #7
    ffff9c6d13c8:	9100e3e2 	add	x2, sp, #0x38
    ffff9c6d13cc:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d13d0:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d13d4:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d13d8:	d63f0200 	blr	x16
    ffff9c6d13dc:	aa1303e0 	mov	x0, x19
    ffff9c6d13e0:	d2800101 	mov	x1, #0x8                   	// #8
    ffff9c6d13e4:	910103e2 	add	x2, sp, #0x40
    ffff9c6d13e8:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d13ec:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d13f0:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d13f4:	d63f0200 	blr	x16
    ffff9c6d13f8:	aa1303e0 	mov	x0, x19
    ffff9c6d13fc:	d2800141 	mov	x1, #0xa                   	// #10
    ffff9c6d1400:	910143e2 	add	x2, sp, #0x50
    ffff9c6d1404:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d1408:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d140c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d1410:	d63f0200 	blr	x16
    ffff9c6d1414:	aa1303e0 	mov	x0, x19
    ffff9c6d1418:	d2800161 	mov	x1, #0xb                   	// #11
    ffff9c6d141c:	910163e2 	add	x2, sp, #0x58
    ffff9c6d1420:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d1424:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d1428:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d142c:	d63f0200 	blr	x16
    ffff9c6d1430:	d28002a9 	mov	x9, #0x15                  	// #21
    ffff9c6d1434:	f9000289 	str	x9, [x20]
    ffff9c6d1438:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d143c:	d2827e10 	mov	x16, #0x13f0                	// #5104
    ffff9c6d1440:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d1444:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d1448:	d63f0200 	blr	x16
    ffff9c6d144c:	913003ff 	add	sp, sp, #0xc00
    ffff9c6d1450:	a8c15bf5 	ldp	x21, x22, [sp], #16
    ffff9c6d1454:	a8c153f3 	ldp	x19, x20, [sp], #16
    ffff9c6d1458:	a8c17bfd 	ldp	x29, x30, [sp], #16
    ffff9c6d145c:	d2800020 	mov	x0, #0x1                   	// #1
    ffff9c6d1460:	d65f03c0 	ret
    ffff9c6d1464:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d1468:	d2828010 	mov	x16, #0x1400                	// #5120
    ffff9c6d146c:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d1470:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d1474:	d63f0200 	blr	x16
    ffff9c6d1478:	913003ff 	add	sp, sp, #0xc00
    ffff9c6d147c:	a8c15bf5 	ldp	x21, x22, [sp], #16
    ffff9c6d1480:	a8c153f3 	ldp	x19, x20, [sp], #16
    ffff9c6d1484:	a8c17bfd 	ldp	x29, x30, [sp], #16
    ffff9c6d1488:	d2800000 	mov	x0, #0x0                   	// #0
    ffff9c6d148c:	d65f03c0 	ret
    ffff9c6d1490:	aa1303e0 	mov	x0, x19
    ffff9c6d1494:	d2800001 	mov	x1, #0x0                   	// #0
    ffff9c6d1498:	d28ff002 	mov	x2, #0x7f80                	// #32640
    ffff9c6d149c:	f2ba7782 	movk	x2, #0xd3bc, lsl #16
    ffff9c6d14a0:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6d14a4:	d2883e03 	mov	x3, #0x41f0                	// #16880
    ffff9c6d14a8:	f2ba79e3 	movk	x3, #0xd3cf, lsl #16
    ffff9c6d14ac:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff9c6d14b0:	d285dd04 	mov	x4, #0x2ee8                	// #12008
    ffff9c6d14b4:	f2ba7784 	movk	x4, #0xd3bc, lsl #16
    ffff9c6d14b8:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff9c6d14bc:	d28cc810 	mov	x16, #0x6640                	// #26176
    ffff9c6d14c0:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d14c4:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d14c8:	d63f0200 	blr	x16
    ffff9c6d14cc:	f100001f 	cmp	x0, #0x0
    ffff9c6d14d0:	54fffca0 	b.eq	0xffff9c6d1464  // b.none
    ffff9c6d14d4:	aa1303e0 	mov	x0, x19
    ffff9c6d14d8:	d2800001 	mov	x1, #0x0                   	// #0
    ffff9c6d14dc:	d28ff202 	mov	x2, #0x7f90                	// #32656
    ffff9c6d14e0:	f2ba7782 	movk	x2, #0xd3bc, lsl #16
    ffff9c6d14e4:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6d14e8:	d2826803 	mov	x3, #0x1340                	// #4928
    ffff9c6d14ec:	f2ba79e3 	movk	x3, #0xd3cf, lsl #16
    ffff9c6d14f0:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff9c6d14f4:	d285dd04 	mov	x4, #0x2ee8                	// #12008
    ffff9c6d14f8:	f2ba7784 	movk	x4, #0xd3bc, lsl #16
    ffff9c6d14fc:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff9c6d1500:	d28cc810 	mov	x16, #0x6640                	// #26176
    ffff9c6d1504:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d1508:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d150c:	d63f0200 	blr	x16
    ffff9c6d1510:	f100001f 	cmp	x0, #0x0
    ffff9c6d1514:	54fffa80 	b.eq	0xffff9c6d1464  // b.none
    ffff9c6d1518:	17ffff0b 	b	0xffff9c6d1144
