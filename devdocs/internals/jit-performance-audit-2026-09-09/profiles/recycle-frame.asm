Dump of assembler code from 0xfffff7f85000 to 0xfffff7f86000:
   0x0000fffff7f85000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7f85004:	910003fd	mov	x29, sp
   0x0000fffff7f85008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7f8500c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7f85010:	d13003ff	sub	sp, sp, #0xc00
   0x0000fffff7f85014:	aa0003f3	mov	x19, x0
   0x0000fffff7f85018:	aa0103f4	mov	x20, x1
   0x0000fffff7f8501c:	aa0203f5	mov	x21, x2
   0x0000fffff7f85020:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f85024:	912043e1	add	x1, sp, #0x810
   0x0000fffff7f85028:	d2996c02	mov	x2, #0xcb60                	// #52064
   0x0000fffff7f8502c:	f2b55782	movk	x2, #0xaabc, lsl #16
   0x0000fffff7f85030:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f85034:	d28c0810	mov	x16, #0x6040                	// #24640
   0x0000fffff7f85038:	f2b55650	movk	x16, #0xaab2, lsl #16
   0x0000fffff7f8503c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85040:	d63f0200	blr	x16
   0x0000fffff7f85044:	f9401ea9	ldr	x9, [x21, #56]
   0x0000fffff7f85048:	d299da0a	mov	x10, #0xced0                	// #52944
   0x0000fffff7f8504c:	f2b557ca	movk	x10, #0xaabe, lsl #16
   0x0000fffff7f85050:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7f85054:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85058:	54006d81	b.ne	0xfffff7f85e08  // b.any
   0x0000fffff7f8505c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f85060:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85064:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85068:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8506c:	54006ce1	b.ne	0xfffff7f85e08  // b.any
   0x0000fffff7f85070:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f85074:	f9000fe9	str	x9, [sp, #24]
   0x0000fffff7f85078:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8507c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85080:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85084:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85088:	54006c01	b.ne	0xfffff7f85e08  // b.any
   0x0000fffff7f8508c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f85090:	f90013e9	str	x9, [sp, #32]
   0x0000fffff7f85094:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f85098:	f90017e9	str	x9, [sp, #40]
   0x0000fffff7f8509c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f850a0:	36d801c9	tbz	w9, #27, 0xfffff7f850d8
   0x0000fffff7f850a4:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f850a8:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7f850ac:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7f850b0:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7f850b4:	aa1303e1	mov	x1, x19
   0x0000fffff7f850b8:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7f850bc:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7f850c0:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7f850c4:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f850c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f850cc:	d63f0200	blr	x16
   0x0000fffff7f850d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f850d4:	540069a0	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f850d8:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f850dc:	f9001be9	str	x9, [sp, #48]
   0x0000fffff7f850e0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f850e4:	36d801c9	tbz	w9, #27, 0xfffff7f8511c
   0x0000fffff7f850e8:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f850ec:	f9401be3	ldr	x3, [sp, #48]
   0x0000fffff7f850f0:	d2800044	mov	x4, #0x2                   	// #2
   0x0000fffff7f850f4:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7f850f8:	aa1303e1	mov	x1, x19
   0x0000fffff7f850fc:	d28000c2	mov	x2, #0x6                   	// #6
   0x0000fffff7f85100:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7f85104:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7f85108:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f8510c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85110:	d63f0200	blr	x16
   0x0000fffff7f85114:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85118:	54006780	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f8511c:	f9401be9	ldr	x9, [sp, #48]
   0x0000fffff7f85120:	f9400fea	ldr	x10, [sp, #24]
   0x0000fffff7f85124:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85128:	540064ca	b.ge	0xfffff7f85dc0  // b.tcont
   0x0000fffff7f8512c:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f85130:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7f85134:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7f85138:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8513c:	54000381	b.ne	0xfffff7f851ac  // b.any
   0x0000fffff7f85140:	f9400e6b	ldr	x11, [x19, #24]
   0x0000fffff7f85144:	f9402569	ldr	x9, [x11, #72]
   0x0000fffff7f85148:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7f8514c:	eb09015f	cmp	x10, x9
   0x0000fffff7f85150:	540002ea	b.ge	0xfffff7f851ac  // b.tcont
   0x0000fffff7f85154:	f940216b	ldr	x11, [x11, #64]
   0x0000fffff7f85158:	d280050a	mov	x10, #0x28                  	// #40
   0x0000fffff7f8515c:	8b0a016b	add	x11, x11, x10
   0x0000fffff7f85160:	b9401169	ldr	w9, [x11, #16]
   0x0000fffff7f85164:	5280020a	mov	w10, #0x10                  	// #16
   0x0000fffff7f85168:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f8516c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85170:	540001e1	b.ne	0xfffff7f851ac  // b.any
   0x0000fffff7f85174:	f9400d69	ldr	x9, [x11, #24]
   0x0000fffff7f85178:	d29ab00a	mov	x10, #0xd580                	// #54656
   0x0000fffff7f8517c:	f2b557ea	movk	x10, #0xaabf, lsl #16
   0x0000fffff7f85180:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7f85184:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85188:	54000121	b.ne	0xfffff7f851ac  // b.any
   0x0000fffff7f8518c:	b9400169	ldr	w9, [x11]
   0x0000fffff7f85190:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f85194:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f85198:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8519c:	54000081	b.ne	0xfffff7f851ac  // b.any
   0x0000fffff7f851a0:	f9400569	ldr	x9, [x11, #8]
   0x0000fffff7f851a4:	f9001fe9	str	x9, [sp, #56]
   0x0000fffff7f851a8:	1400000d	b	0xfffff7f851dc
   0x0000fffff7f851ac:	aa1303e0	mov	x0, x19
   0x0000fffff7f851b0:	d2800021	mov	x1, #0x1                   	// #1
   0x0000fffff7f851b4:	d29ba702	mov	x2, #0xdd38                	// #56632
   0x0000fffff7f851b8:	f2b557e2	movk	x2, #0xaabf, lsl #16
   0x0000fffff7f851bc:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f851c0:	9100e3e3	add	x3, sp, #0x38
   0x0000fffff7f851c4:	d28db410	mov	x16, #0x6da0                	// #28064
   0x0000fffff7f851c8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f851cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f851d0:	d63f0200	blr	x16
   0x0000fffff7f851d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f851d8:	54006180	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f851dc:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f851e0:	f9401fe3	ldr	x3, [sp, #56]
   0x0000fffff7f851e4:	d2800804	mov	x4, #0x40                  	// #64
   0x0000fffff7f851e8:	f2a10004	movk	x4, #0x800, lsl #16
   0x0000fffff7f851ec:	aa1303e1	mov	x1, x19
   0x0000fffff7f851f0:	d28000e2	mov	x2, #0x7                   	// #7
   0x0000fffff7f851f4:	d2800025	mov	x5, #0x1                   	// #1
   0x0000fffff7f851f8:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7f851fc:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f85200:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85204:	d63f0200	blr	x16
   0x0000fffff7f85208:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8520c:	54005fe0	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f85210:	d29ab009	mov	x9, #0xd580                	// #54656
   0x0000fffff7f85214:	f2b557e9	movk	x9, #0xaabf, lsl #16
   0x0000fffff7f85218:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f8521c:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7f85220:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f85224:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7f85228:	d2800204	mov	x4, #0x10                  	// #16
   0x0000fffff7f8522c:	f2a10004	movk	x4, #0x800, lsl #16
   0x0000fffff7f85230:	aa1303e1	mov	x1, x19
   0x0000fffff7f85234:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7f85238:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7f8523c:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7f85240:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f85244:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85248:	d63f0200	blr	x16
   0x0000fffff7f8524c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85250:	54005dc0	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f85254:	f9401be9	ldr	x9, [sp, #48]
   0x0000fffff7f85258:	f94013ea	ldr	x10, [sp, #32]
   0x0000fffff7f8525c:	f100015f	cmp	x10, #0x0
   0x0000fffff7f85260:	54005d40	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f85264:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f85268:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f8526c:	f90027e9	str	x9, [sp, #72]
   0x0000fffff7f85270:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f85274:	36d801c9	tbz	w9, #27, 0xfffff7f852ac
   0x0000fffff7f85278:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f8527c:	f94027e3	ldr	x3, [sp, #72]
   0x0000fffff7f85280:	d2800044	mov	x4, #0x2                   	// #2
   0x0000fffff7f85284:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7f85288:	aa1303e1	mov	x1, x19
   0x0000fffff7f8528c:	d2800122	mov	x2, #0x9                   	// #9
   0x0000fffff7f85290:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7f85294:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7f85298:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f8529c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f852a0:	d63f0200	blr	x16
   0x0000fffff7f852a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f852a8:	54005b00	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f852ac:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f852b0:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f852b4:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f852b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f852bc:	54005a61	b.ne	0xfffff7f85e08  // b.any
   0x0000fffff7f852c0:	f940166b	ldr	x11, [x19, #40]
   0x0000fffff7f852c4:	f94027ea	ldr	x10, [sp, #72]
   0x0000fffff7f852c8:	f100015f	cmp	x10, #0x0
   0x0000fffff7f852cc:	540059eb	b.lt	0xfffff7f85e08  // b.tstop
   0x0000fffff7f852d0:	f9401d6c	ldr	x12, [x11, #56]
   0x0000fffff7f852d4:	eb0c015f	cmp	x10, x12
   0x0000fffff7f852d8:	5400598a	b.ge	0xfffff7f85e08  // b.tcont
   0x0000fffff7f852dc:	f940196d	ldr	x13, [x11, #48]
   0x0000fffff7f852e0:	8b0a11ad	add	x13, x13, x10, lsl #4
   0x0000fffff7f852e4:	b94001ae	ldr	w14, [x13]
   0x0000fffff7f852e8:	5280080f	mov	w15, #0x40                  	// #64
   0x0000fffff7f852ec:	72a1000f	movk	w15, #0x800, lsl #16
   0x0000fffff7f852f0:	eb0f01df	cmp	x14, x15
   0x0000fffff7f852f4:	540058a1	b.ne	0xfffff7f85e08  // b.any
   0x0000fffff7f852f8:	f94005a9	ldr	x9, [x13, #8]
   0x0000fffff7f852fc:	f90027e9	str	x9, [sp, #72]
   0x0000fffff7f85300:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f85304:	f94027e3	ldr	x3, [sp, #72]
   0x0000fffff7f85308:	d2800804	mov	x4, #0x40                  	// #64
   0x0000fffff7f8530c:	f2a10004	movk	x4, #0x800, lsl #16
   0x0000fffff7f85310:	aa1303e1	mov	x1, x19
   0x0000fffff7f85314:	d2800122	mov	x2, #0x9                   	// #9
   0x0000fffff7f85318:	d2800025	mov	x5, #0x1                   	// #1
   0x0000fffff7f8531c:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7f85320:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f85324:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85328:	d63f0200	blr	x16
   0x0000fffff7f8532c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85330:	540056c0	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f85334:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f85338:	91004261	add	x1, x19, #0x10
   0x0000fffff7f8533c:	d2800002	mov	x2, #0x0                   	// #0
   0x0000fffff7f85340:	d29ba703	mov	x3, #0xdd38                	// #56632
   0x0000fffff7f85344:	f2b557e3	movk	x3, #0xaabf, lsl #16
   0x0000fffff7f85348:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7f8534c:	f94027e4	ldr	x4, [sp, #72]
   0x0000fffff7f85350:	d2800805	mov	x5, #0x40                  	// #64
   0x0000fffff7f85354:	f2a10005	movk	x5, #0x800, lsl #16
   0x0000fffff7f85358:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8535c:	d2800007	mov	x7, #0x0                   	// #0
   0x0000fffff7f85360:	d2948210	mov	x16, #0xa410                	// #42000
   0x0000fffff7f85364:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85368:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8536c:	d63f0200	blr	x16
   0x0000fffff7f85370:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85374:	540054a0	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f85378:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f8537c:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7f85380:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7f85384:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85388:	54000381	b.ne	0xfffff7f853f8  // b.any
   0x0000fffff7f8538c:	f9400e6b	ldr	x11, [x19, #24]
   0x0000fffff7f85390:	f9402569	ldr	x9, [x11, #72]
   0x0000fffff7f85394:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7f85398:	eb09015f	cmp	x10, x9
   0x0000fffff7f8539c:	540002ea	b.ge	0xfffff7f853f8  // b.tcont
   0x0000fffff7f853a0:	f940216b	ldr	x11, [x11, #64]
   0x0000fffff7f853a4:	d280050a	mov	x10, #0x28                  	// #40
   0x0000fffff7f853a8:	8b0a016b	add	x11, x11, x10
   0x0000fffff7f853ac:	b9401169	ldr	w9, [x11, #16]
   0x0000fffff7f853b0:	5280020a	mov	w10, #0x10                  	// #16
   0x0000fffff7f853b4:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f853b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f853bc:	540001e1	b.ne	0xfffff7f853f8  // b.any
   0x0000fffff7f853c0:	f9400d69	ldr	x9, [x11, #24]
   0x0000fffff7f853c4:	d29ab00a	mov	x10, #0xd580                	// #54656
   0x0000fffff7f853c8:	f2b557ea	movk	x10, #0xaabf, lsl #16
   0x0000fffff7f853cc:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7f853d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f853d4:	54000121	b.ne	0xfffff7f853f8  // b.any
   0x0000fffff7f853d8:	b9400169	ldr	w9, [x11]
   0x0000fffff7f853dc:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f853e0:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f853e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f853e8:	54000081	b.ne	0xfffff7f853f8  // b.any
   0x0000fffff7f853ec:	f9400569	ldr	x9, [x11, #8]
   0x0000fffff7f853f0:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7f853f4:	1400000d	b	0xfffff7f85428
   0x0000fffff7f853f8:	aa1303e0	mov	x0, x19
   0x0000fffff7f853fc:	d2800021	mov	x1, #0x1                   	// #1
   0x0000fffff7f85400:	d29ba702	mov	x2, #0xdd38                	// #56632
   0x0000fffff7f85404:	f2b557e2	movk	x2, #0xaabf, lsl #16
   0x0000fffff7f85408:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f8540c:	910103e3	add	x3, sp, #0x40
   0x0000fffff7f85410:	d28db410	mov	x16, #0x6da0                	// #28064
   0x0000fffff7f85414:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85418:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8541c:	d63f0200	blr	x16
   0x0000fffff7f85420:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85424:	54004f20	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f85428:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f8542c:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7f85430:	d2800804	mov	x4, #0x40                  	// #64
   0x0000fffff7f85434:	f2a10004	movk	x4, #0x800, lsl #16
   0x0000fffff7f85438:	aa1303e1	mov	x1, x19
   0x0000fffff7f8543c:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7f85440:	d2800025	mov	x5, #0x1                   	// #1
   0x0000fffff7f85444:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7f85448:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f8544c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85450:	d63f0200	blr	x16
   0x0000fffff7f85454:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85458:	54004d80	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f8545c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f85460:	f90027e9	str	x9, [sp, #72]
   0x0000fffff7f85464:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f85468:	36d801c9	tbz	w9, #27, 0xfffff7f854a0
   0x0000fffff7f8546c:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f85470:	f94027e3	ldr	x3, [sp, #72]
   0x0000fffff7f85474:	d2800044	mov	x4, #0x2                   	// #2
   0x0000fffff7f85478:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7f8547c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85480:	d2800122	mov	x2, #0x9                   	// #9
   0x0000fffff7f85484:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7f85488:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7f8548c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f85490:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85494:	d63f0200	blr	x16
   0x0000fffff7f85498:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8549c:	54004b60	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f854a0:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f854a4:	f9002be9	str	x9, [sp, #80]
   0x0000fffff7f854a8:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f854ac:	36d801c9	tbz	w9, #27, 0xfffff7f854e4
   0x0000fffff7f854b0:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f854b4:	f9402be3	ldr	x3, [sp, #80]
   0x0000fffff7f854b8:	d2800044	mov	x4, #0x2                   	// #2
   0x0000fffff7f854bc:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7f854c0:	aa1303e1	mov	x1, x19
   0x0000fffff7f854c4:	d2800142	mov	x2, #0xa                   	// #10
   0x0000fffff7f854c8:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7f854cc:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7f854d0:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f854d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f854d8:	d63f0200	blr	x16
   0x0000fffff7f854dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f854e0:	54004940	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f854e4:	f9401feb	ldr	x11, [sp, #56]
   0x0000fffff7f854e8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f854ec:	540048e0	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f854f0:	f9402bea	ldr	x10, [sp, #80]
   0x0000fffff7f854f4:	f100015f	cmp	x10, #0x0
   0x0000fffff7f854f8:	5400488b	b.lt	0xfffff7f85e08  // b.tstop
   0x0000fffff7f854fc:	f9401d6c	ldr	x12, [x11, #56]
   0x0000fffff7f85500:	eb0c015f	cmp	x10, x12
   0x0000fffff7f85504:	5400482a	b.ge	0xfffff7f85e08  // b.tcont
   0x0000fffff7f85508:	f940196d	ldr	x13, [x11, #48]
   0x0000fffff7f8550c:	8b0a11ad	add	x13, x13, x10, lsl #4
   0x0000fffff7f85510:	b94001ae	ldr	w14, [x13]
   0x0000fffff7f85514:	5280004f	mov	w15, #0x2                   	// #2
   0x0000fffff7f85518:	72a0a00f	movk	w15, #0x500, lsl #16
   0x0000fffff7f8551c:	eb0f01df	cmp	x14, x15
   0x0000fffff7f85520:	54004741	b.ne	0xfffff7f85e08  // b.any
   0x0000fffff7f85524:	f94005a9	ldr	x9, [x13, #8]
   0x0000fffff7f85528:	f9002be9	str	x9, [sp, #80]
   0x0000fffff7f8552c:	d2997009	mov	x9, #0xcb80                	// #52096
   0x0000fffff7f85530:	f2b55789	movk	x9, #0xaabc, lsl #16
   0x0000fffff7f85534:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f85538:	f9400129	ldr	x9, [x9]
   0x0000fffff7f8553c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85540:	540000a0	b.eq	0xfffff7f85554  // b.none
   0x0000fffff7f85544:	b940a26a	ldr	w10, [x19, #160]
   0x0000fffff7f85548:	37d8006a	tbnz	w10, #27, 0xfffff7f85554
   0x0000fffff7f8554c:	b940b12a	ldr	w10, [x9, #176]
   0x0000fffff7f85550:	36d801ca	tbz	w10, #27, 0xfffff7f85588
   0x0000fffff7f85554:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f85558:	f9402be3	ldr	x3, [sp, #80]
   0x0000fffff7f8555c:	d2800044	mov	x4, #0x2                   	// #2
   0x0000fffff7f85560:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7f85564:	aa1303e1	mov	x1, x19
   0x0000fffff7f85568:	d2800142	mov	x2, #0xa                   	// #10
   0x0000fffff7f8556c:	d2800025	mov	x5, #0x1                   	// #1
   0x0000fffff7f85570:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7f85574:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f85578:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8557c:	d63f0200	blr	x16
   0x0000fffff7f85580:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85584:	54004420	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f85588:	f9402be9	ldr	x9, [sp, #80]
   0x0000fffff7f8558c:	f9401bea	ldr	x10, [sp, #48]
   0x0000fffff7f85590:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85594:	f9002be9	str	x9, [sp, #80]
   0x0000fffff7f85598:	d2807ca9	mov	x9, #0x3e5                 	// #997
   0x0000fffff7f8559c:	f9002fe9	str	x9, [sp, #88]
   0x0000fffff7f855a0:	b940b269	ldr	w9, [x19, #176]
   0x0000fffff7f855a4:	36d801c9	tbz	w9, #27, 0xfffff7f855dc
   0x0000fffff7f855a8:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f855ac:	f9402fe3	ldr	x3, [sp, #88]
   0x0000fffff7f855b0:	d2800044	mov	x4, #0x2                   	// #2
   0x0000fffff7f855b4:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7f855b8:	aa1303e1	mov	x1, x19
   0x0000fffff7f855bc:	d2800162	mov	x2, #0xb                   	// #11
   0x0000fffff7f855c0:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7f855c4:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7f855c8:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f855cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f855d0:	d63f0200	blr	x16
   0x0000fffff7f855d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f855d8:	54004180	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f855dc:	f9402be9	ldr	x9, [sp, #80]
   0x0000fffff7f855e0:	f9402fea	ldr	x10, [sp, #88]
   0x0000fffff7f855e4:	f100015f	cmp	x10, #0x0
   0x0000fffff7f855e8:	54004100	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f855ec:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f855f0:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f855f4:	f9002be9	str	x9, [sp, #80]
   0x0000fffff7f855f8:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f855fc:	f94023e1	ldr	x1, [sp, #64]
   0x0000fffff7f85600:	f94027e2	ldr	x2, [sp, #72]
   0x0000fffff7f85604:	f9402be3	ldr	x3, [sp, #80]
   0x0000fffff7f85608:	d2871410	mov	x16, #0x38a0                	// #14496
   0x0000fffff7f8560c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85610:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85614:	d63f0200	blr	x16
   0x0000fffff7f85618:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8561c:	54003f60	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f85620:	d29abc09	mov	x9, #0xd5e0                	// #54752
   0x0000fffff7f85624:	f2b557e9	movk	x9, #0xaabf, lsl #16
   0x0000fffff7f85628:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f8562c:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7f85630:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f85634:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7f85638:	d2800204	mov	x4, #0x10                  	// #16
   0x0000fffff7f8563c:	f2a10004	movk	x4, #0x800, lsl #16
   0x0000fffff7f85640:	aa1303e1	mov	x1, x19
   0x0000fffff7f85644:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7f85648:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7f8564c:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7f85650:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f85654:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85658:	d63f0200	blr	x16
   0x0000fffff7f8565c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85660:	54003d40	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f85664:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f85668:	aa1303e1	mov	x1, x19
   0x0000fffff7f8566c:	d2800022	mov	x2, #0x1                   	// #1
   0x0000fffff7f85670:	d29ba903	mov	x3, #0xdd48                	// #56648
   0x0000fffff7f85674:	f2b557e3	movk	x3, #0xaabf, lsl #16
   0x0000fffff7f85678:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7f8567c:	f9401be4	ldr	x4, [sp, #48]
   0x0000fffff7f85680:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7f85684:	d2853810	mov	x16, #0x29c0                	// #10688
   0x0000fffff7f85688:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8568c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85690:	d63f0200	blr	x16
   0x0000fffff7f85694:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85698:	54003b80	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f8569c:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f856a0:	aa1303e1	mov	x1, x19
   0x0000fffff7f856a4:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7f856a8:	d29d4e10	mov	x16, #0xea70                	// #60016
   0x0000fffff7f856ac:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f856b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f856b4:	d63f0200	blr	x16
   0x0000fffff7f856b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f856bc:	54003a60	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f856c0:	d2912a09	mov	x9, #0x8950                	// #35152
   0x0000fffff7f856c4:	f2b557e9	movk	x9, #0xaabf, lsl #16
   0x0000fffff7f856c8:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f856cc:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7f856d0:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f856d4:	f94023e1	ldr	x1, [sp, #64]
   0x0000fffff7f856d8:	d2800202	mov	x2, #0x10                  	// #16
   0x0000fffff7f856dc:	f2a10002	movk	x2, #0x800, lsl #16
   0x0000fffff7f856e0:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7f856e4:	d29da890	mov	x16, #0xed44                	// #60740
   0x0000fffff7f856e8:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f856ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f856f0:	d63f0200	blr	x16
   0x0000fffff7f856f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f856f8:	54003880	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f856fc:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f85700:	aa1303e1	mov	x1, x19
   0x0000fffff7f85704:	d2800122	mov	x2, #0x9                   	// #9
   0x0000fffff7f85708:	d29d4e10	mov	x16, #0xea70                	// #60016
   0x0000fffff7f8570c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f85710:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85714:	d63f0200	blr	x16
   0x0000fffff7f85718:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8571c:	54003760	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f85720:	d2912a09	mov	x9, #0x8950                	// #35152
   0x0000fffff7f85724:	f2b557e9	movk	x9, #0xaabf, lsl #16
   0x0000fffff7f85728:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f8572c:	f90027e9	str	x9, [sp, #72]
   0x0000fffff7f85730:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f85734:	f94027e1	ldr	x1, [sp, #72]
   0x0000fffff7f85738:	d2800202	mov	x2, #0x10                  	// #16
   0x0000fffff7f8573c:	f2a10002	movk	x2, #0x800, lsl #16
   0x0000fffff7f85740:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7f85744:	d29da890	mov	x16, #0xed44                	// #60740
   0x0000fffff7f85748:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f8574c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85750:	d63f0200	blr	x16
   0x0000fffff7f85754:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85758:	54003580	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f8575c:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f85760:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7f85764:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7f85768:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8576c:	54000381	b.ne	0xfffff7f857dc  // b.any
   0x0000fffff7f85770:	f9400e6b	ldr	x11, [x19, #24]
   0x0000fffff7f85774:	f9402569	ldr	x9, [x11, #72]
   0x0000fffff7f85778:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7f8577c:	eb09015f	cmp	x10, x9
   0x0000fffff7f85780:	540002ea	b.ge	0xfffff7f857dc  // b.tcont
   0x0000fffff7f85784:	f940216b	ldr	x11, [x11, #64]
   0x0000fffff7f85788:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7f8578c:	8b0a016b	add	x11, x11, x10
   0x0000fffff7f85790:	b9401169	ldr	w9, [x11, #16]
   0x0000fffff7f85794:	5280020a	mov	w10, #0x10                  	// #16
   0x0000fffff7f85798:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f8579c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f857a0:	540001e1	b.ne	0xfffff7f857dc  // b.any
   0x0000fffff7f857a4:	f9400d69	ldr	x9, [x11, #24]
   0x0000fffff7f857a8:	d2912a0a	mov	x10, #0x8950                	// #35152
   0x0000fffff7f857ac:	f2b557ea	movk	x10, #0xaabf, lsl #16
   0x0000fffff7f857b0:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7f857b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f857b8:	54000121	b.ne	0xfffff7f857dc  // b.any
   0x0000fffff7f857bc:	b9400169	ldr	w9, [x11]
   0x0000fffff7f857c0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f857c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f857c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f857cc:	54000081	b.ne	0xfffff7f857dc  // b.any
   0x0000fffff7f857d0:	fd400560	ldr	d0, [x11, #8]
   0x0000fffff7f857d4:	fd0027e0	str	d0, [sp, #72]
   0x0000fffff7f857d8:	1400000d	b	0xfffff7f8580c
   0x0000fffff7f857dc:	aa1303e0	mov	x0, x19
   0x0000fffff7f857e0:	d2800021	mov	x1, #0x1                   	// #1
   0x0000fffff7f857e4:	d29bab02	mov	x2, #0xdd58                	// #56664
   0x0000fffff7f857e8:	f2b557e2	movk	x2, #0xaabf, lsl #16
   0x0000fffff7f857ec:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f857f0:	910123e3	add	x3, sp, #0x48
   0x0000fffff7f857f4:	d28e7090	mov	x16, #0x7384                	// #29572
   0x0000fffff7f857f8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f857fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85800:	d63f0200	blr	x16
   0x0000fffff7f85804:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85808:	54003000	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f8580c:	d2997009	mov	x9, #0xcb80                	// #52096
   0x0000fffff7f85810:	f2b55789	movk	x9, #0xaabc, lsl #16
   0x0000fffff7f85814:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f85818:	f9400129	ldr	x9, [x9]
   0x0000fffff7f8581c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85820:	540000a0	b.eq	0xfffff7f85834  // b.none
   0x0000fffff7f85824:	b940926a	ldr	w10, [x19, #144]
   0x0000fffff7f85828:	37d8006a	tbnz	w10, #27, 0xfffff7f85834
   0x0000fffff7f8582c:	b940b12a	ldr	w10, [x9, #176]
   0x0000fffff7f85830:	36d801ca	tbz	w10, #27, 0xfffff7f85868
   0x0000fffff7f85834:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f85838:	f94027e3	ldr	x3, [sp, #72]
   0x0000fffff7f8583c:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7f85840:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7f85844:	aa1303e1	mov	x1, x19
   0x0000fffff7f85848:	d2800122	mov	x2, #0x9                   	// #9
   0x0000fffff7f8584c:	d2800025	mov	x5, #0x1                   	// #1
   0x0000fffff7f85850:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7f85854:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f85858:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8585c:	d63f0200	blr	x16
   0x0000fffff7f85860:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85864:	54002d20	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f85868:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f8586c:	f2e7fa09	movk	x9, #0x3fd0, lsl #48
   0x0000fffff7f85870:	f9002be9	str	x9, [sp, #80]
   0x0000fffff7f85874:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f85878:	36d801c9	tbz	w9, #27, 0xfffff7f858b0
   0x0000fffff7f8587c:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f85880:	f9402be3	ldr	x3, [sp, #80]
   0x0000fffff7f85884:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7f85888:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7f8588c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85890:	d2800142	mov	x2, #0xa                   	// #10
   0x0000fffff7f85894:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7f85898:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7f8589c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f858a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f858a4:	d63f0200	blr	x16
   0x0000fffff7f858a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f858ac:	54002ae0	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f858b0:	fd4027e0	ldr	d0, [sp, #72]
   0x0000fffff7f858b4:	fd402be1	ldr	d1, [sp, #80]
   0x0000fffff7f858b8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f858bc:	fd0027e0	str	d0, [sp, #72]
   0x0000fffff7f858c0:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f858c4:	aa1303e1	mov	x1, x19
   0x0000fffff7f858c8:	d2800022	mov	x2, #0x1                   	// #1
   0x0000fffff7f858cc:	d29bab03	mov	x3, #0xdd58                	// #56664
   0x0000fffff7f858d0:	f2b557e3	movk	x3, #0xaabf, lsl #16
   0x0000fffff7f858d4:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7f858d8:	910123e4	add	x4, sp, #0x48
   0x0000fffff7f858dc:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7f858e0:	d2849810	mov	x16, #0x24c0                	// #9408
   0x0000fffff7f858e4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f858e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f858ec:	d63f0200	blr	x16
   0x0000fffff7f858f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f858f4:	540028a0	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f858f8:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f858fc:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7f85900:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7f85904:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85908:	54000381	b.ne	0xfffff7f85978  // b.any
   0x0000fffff7f8590c:	f9400e6b	ldr	x11, [x19, #24]
   0x0000fffff7f85910:	f9402569	ldr	x9, [x11, #72]
   0x0000fffff7f85914:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7f85918:	eb09015f	cmp	x10, x9
   0x0000fffff7f8591c:	540002ea	b.ge	0xfffff7f85978  // b.tcont
   0x0000fffff7f85920:	f940216b	ldr	x11, [x11, #64]
   0x0000fffff7f85924:	d280050a	mov	x10, #0x28                  	// #40
   0x0000fffff7f85928:	8b0a016b	add	x11, x11, x10
   0x0000fffff7f8592c:	b9401169	ldr	w9, [x11, #16]
   0x0000fffff7f85930:	5280020a	mov	w10, #0x10                  	// #16
   0x0000fffff7f85934:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f85938:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8593c:	540001e1	b.ne	0xfffff7f85978  // b.any
   0x0000fffff7f85940:	f9400d69	ldr	x9, [x11, #24]
   0x0000fffff7f85944:	d29ab00a	mov	x10, #0xd580                	// #54656
   0x0000fffff7f85948:	f2b557ea	movk	x10, #0xaabf, lsl #16
   0x0000fffff7f8594c:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7f85950:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85954:	54000121	b.ne	0xfffff7f85978  // b.any
   0x0000fffff7f85958:	b9400169	ldr	w9, [x11]
   0x0000fffff7f8595c:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f85960:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f85964:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85968:	54000081	b.ne	0xfffff7f85978  // b.any
   0x0000fffff7f8596c:	f9400569	ldr	x9, [x11, #8]
   0x0000fffff7f85970:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7f85974:	1400000d	b	0xfffff7f859a8
   0x0000fffff7f85978:	aa1303e0	mov	x0, x19
   0x0000fffff7f8597c:	d2800021	mov	x1, #0x1                   	// #1
   0x0000fffff7f85980:	d29ba702	mov	x2, #0xdd38                	// #56632
   0x0000fffff7f85984:	f2b557e2	movk	x2, #0xaabf, lsl #16
   0x0000fffff7f85988:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f8598c:	910103e3	add	x3, sp, #0x40
   0x0000fffff7f85990:	d28db410	mov	x16, #0x6da0                	// #28064
   0x0000fffff7f85994:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85998:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8599c:	d63f0200	blr	x16
   0x0000fffff7f859a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f859a4:	54002320	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f859a8:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f859ac:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7f859b0:	d2800804	mov	x4, #0x40                  	// #64
   0x0000fffff7f859b4:	f2a10004	movk	x4, #0x800, lsl #16
   0x0000fffff7f859b8:	aa1303e1	mov	x1, x19
   0x0000fffff7f859bc:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7f859c0:	d2800025	mov	x5, #0x1                   	// #1
   0x0000fffff7f859c4:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7f859c8:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f859cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f859d0:	d63f0200	blr	x16
   0x0000fffff7f859d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f859d8:	54002180	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f859dc:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f859e0:	f90027e9	str	x9, [sp, #72]
   0x0000fffff7f859e4:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f859e8:	36d801c9	tbz	w9, #27, 0xfffff7f85a20
   0x0000fffff7f859ec:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f859f0:	f94027e3	ldr	x3, [sp, #72]
   0x0000fffff7f859f4:	d2800044	mov	x4, #0x2                   	// #2
   0x0000fffff7f859f8:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7f859fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f85a00:	d2800122	mov	x2, #0x9                   	// #9
   0x0000fffff7f85a04:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7f85a08:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7f85a0c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f85a10:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85a14:	d63f0200	blr	x16
   0x0000fffff7f85a18:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85a1c:	54001f60	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f85a20:	f94023eb	ldr	x11, [sp, #64]
   0x0000fffff7f85a24:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85a28:	54001f00	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f85a2c:	f94027ea	ldr	x10, [sp, #72]
   0x0000fffff7f85a30:	f100015f	cmp	x10, #0x0
   0x0000fffff7f85a34:	54001eab	b.lt	0xfffff7f85e08  // b.tstop
   0x0000fffff7f85a38:	f9401d6c	ldr	x12, [x11, #56]
   0x0000fffff7f85a3c:	eb0c015f	cmp	x10, x12
   0x0000fffff7f85a40:	54001e4a	b.ge	0xfffff7f85e08  // b.tcont
   0x0000fffff7f85a44:	f940196d	ldr	x13, [x11, #48]
   0x0000fffff7f85a48:	8b0a11ad	add	x13, x13, x10, lsl #4
   0x0000fffff7f85a4c:	b94001ae	ldr	w14, [x13]
   0x0000fffff7f85a50:	5280004f	mov	w15, #0x2                   	// #2
   0x0000fffff7f85a54:	72a0a00f	movk	w15, #0x500, lsl #16
   0x0000fffff7f85a58:	eb0f01df	cmp	x14, x15
   0x0000fffff7f85a5c:	54001d61	b.ne	0xfffff7f85e08  // b.any
   0x0000fffff7f85a60:	f94005a9	ldr	x9, [x13, #8]
   0x0000fffff7f85a64:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7f85a68:	d2997009	mov	x9, #0xcb80                	// #52096
   0x0000fffff7f85a6c:	f2b55789	movk	x9, #0xaabc, lsl #16
   0x0000fffff7f85a70:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f85a74:	f9400129	ldr	x9, [x9]
   0x0000fffff7f85a78:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85a7c:	540000a0	b.eq	0xfffff7f85a90  // b.none
   0x0000fffff7f85a80:	b940826a	ldr	w10, [x19, #128]
   0x0000fffff7f85a84:	37d8006a	tbnz	w10, #27, 0xfffff7f85a90
   0x0000fffff7f85a88:	b940b12a	ldr	w10, [x9, #176]
   0x0000fffff7f85a8c:	36d801ca	tbz	w10, #27, 0xfffff7f85ac4
   0x0000fffff7f85a90:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f85a94:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7f85a98:	d2800044	mov	x4, #0x2                   	// #2
   0x0000fffff7f85a9c:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7f85aa0:	aa1303e1	mov	x1, x19
   0x0000fffff7f85aa4:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7f85aa8:	d2800025	mov	x5, #0x1                   	// #1
   0x0000fffff7f85aac:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7f85ab0:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f85ab4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85ab8:	d63f0200	blr	x16
   0x0000fffff7f85abc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85ac0:	54001a40	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f85ac4:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f85ac8:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7f85acc:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7f85ad0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85ad4:	54000381	b.ne	0xfffff7f85b44  // b.any
   0x0000fffff7f85ad8:	f9400e6b	ldr	x11, [x19, #24]
   0x0000fffff7f85adc:	f9402569	ldr	x9, [x11, #72]
   0x0000fffff7f85ae0:	d280006a	mov	x10, #0x3                   	// #3
   0x0000fffff7f85ae4:	eb09015f	cmp	x10, x9
   0x0000fffff7f85ae8:	540002ea	b.ge	0xfffff7f85b44  // b.tcont
   0x0000fffff7f85aec:	f940216b	ldr	x11, [x11, #64]
   0x0000fffff7f85af0:	d2800f0a	mov	x10, #0x78                  	// #120
   0x0000fffff7f85af4:	8b0a016b	add	x11, x11, x10
   0x0000fffff7f85af8:	b9401169	ldr	w9, [x11, #16]
   0x0000fffff7f85afc:	5280020a	mov	w10, #0x10                  	// #16
   0x0000fffff7f85b00:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f85b04:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85b08:	540001e1	b.ne	0xfffff7f85b44  // b.any
   0x0000fffff7f85b0c:	f9400d69	ldr	x9, [x11, #24]
   0x0000fffff7f85b10:	d29abc0a	mov	x10, #0xd5e0                	// #54752
   0x0000fffff7f85b14:	f2b557ea	movk	x10, #0xaabf, lsl #16
   0x0000fffff7f85b18:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7f85b1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85b20:	54000121	b.ne	0xfffff7f85b44  // b.any
   0x0000fffff7f85b24:	b9400169	ldr	w9, [x11]
   0x0000fffff7f85b28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85b2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85b30:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85b34:	54000081	b.ne	0xfffff7f85b44  // b.any
   0x0000fffff7f85b38:	f9400569	ldr	x9, [x11, #8]
   0x0000fffff7f85b3c:	f90027e9	str	x9, [sp, #72]
   0x0000fffff7f85b40:	1400000d	b	0xfffff7f85b74
   0x0000fffff7f85b44:	aa1303e0	mov	x0, x19
   0x0000fffff7f85b48:	d2800021	mov	x1, #0x1                   	// #1
   0x0000fffff7f85b4c:	d29ba902	mov	x2, #0xdd48                	// #56648
   0x0000fffff7f85b50:	f2b557e2	movk	x2, #0xaabf, lsl #16
   0x0000fffff7f85b54:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f85b58:	910123e3	add	x3, sp, #0x48
   0x0000fffff7f85b5c:	d28e0c90	mov	x16, #0x7064                	// #28772
   0x0000fffff7f85b60:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85b64:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85b68:	d63f0200	blr	x16
   0x0000fffff7f85b6c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85b70:	540014c0	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f85b74:	d2997009	mov	x9, #0xcb80                	// #52096
   0x0000fffff7f85b78:	f2b55789	movk	x9, #0xaabc, lsl #16
   0x0000fffff7f85b7c:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f85b80:	f9400129	ldr	x9, [x9]
   0x0000fffff7f85b84:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85b88:	540000a0	b.eq	0xfffff7f85b9c  // b.none
   0x0000fffff7f85b8c:	b940926a	ldr	w10, [x19, #144]
   0x0000fffff7f85b90:	37d8006a	tbnz	w10, #27, 0xfffff7f85b9c
   0x0000fffff7f85b94:	b940b12a	ldr	w10, [x9, #176]
   0x0000fffff7f85b98:	36d801ca	tbz	w10, #27, 0xfffff7f85bd0
   0x0000fffff7f85b9c:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f85ba0:	f94027e3	ldr	x3, [sp, #72]
   0x0000fffff7f85ba4:	d2800044	mov	x4, #0x2                   	// #2
   0x0000fffff7f85ba8:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7f85bac:	aa1303e1	mov	x1, x19
   0x0000fffff7f85bb0:	d2800122	mov	x2, #0x9                   	// #9
   0x0000fffff7f85bb4:	d2800025	mov	x5, #0x1                   	// #1
   0x0000fffff7f85bb8:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7f85bbc:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f85bc0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85bc4:	d63f0200	blr	x16
   0x0000fffff7f85bc8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85bcc:	540011e0	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f85bd0:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7f85bd4:	f9002be9	str	x9, [sp, #80]
   0x0000fffff7f85bd8:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f85bdc:	36d801c9	tbz	w9, #27, 0xfffff7f85c14
   0x0000fffff7f85be0:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f85be4:	f9402be3	ldr	x3, [sp, #80]
   0x0000fffff7f85be8:	d2800044	mov	x4, #0x2                   	// #2
   0x0000fffff7f85bec:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7f85bf0:	aa1303e1	mov	x1, x19
   0x0000fffff7f85bf4:	d2800142	mov	x2, #0xa                   	// #10
   0x0000fffff7f85bf8:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7f85bfc:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7f85c00:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f85c04:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85c08:	d63f0200	blr	x16
   0x0000fffff7f85c0c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85c10:	54000fc0	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f85c14:	f94027e9	ldr	x9, [sp, #72]
   0x0000fffff7f85c18:	f9402bea	ldr	x10, [sp, #80]
   0x0000fffff7f85c1c:	f100015f	cmp	x10, #0x0
   0x0000fffff7f85c20:	54000f40	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f85c24:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f85c28:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f85c2c:	f90027e9	str	x9, [sp, #72]
   0x0000fffff7f85c30:	f94023e9	ldr	x9, [sp, #64]
   0x0000fffff7f85c34:	f94027ea	ldr	x10, [sp, #72]
   0x0000fffff7f85c38:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85c3c:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7f85c40:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f85c44:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7f85c48:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7f85c4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85c50:	54000381	b.ne	0xfffff7f85cc0  // b.any
   0x0000fffff7f85c54:	f9400e6b	ldr	x11, [x19, #24]
   0x0000fffff7f85c58:	f9402569	ldr	x9, [x11, #72]
   0x0000fffff7f85c5c:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7f85c60:	eb09015f	cmp	x10, x9
   0x0000fffff7f85c64:	540002ea	b.ge	0xfffff7f85cc0  // b.tcont
   0x0000fffff7f85c68:	f940216b	ldr	x11, [x11, #64]
   0x0000fffff7f85c6c:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7f85c70:	8b0a016b	add	x11, x11, x10
   0x0000fffff7f85c74:	b9401169	ldr	w9, [x11, #16]
   0x0000fffff7f85c78:	5280020a	mov	w10, #0x10                  	// #16
   0x0000fffff7f85c7c:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f85c80:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85c84:	540001e1	b.ne	0xfffff7f85cc0  // b.any
   0x0000fffff7f85c88:	f9400d69	ldr	x9, [x11, #24]
   0x0000fffff7f85c8c:	d2912a0a	mov	x10, #0x8950                	// #35152
   0x0000fffff7f85c90:	f2b557ea	movk	x10, #0xaabf, lsl #16
   0x0000fffff7f85c94:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7f85c98:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85c9c:	54000121	b.ne	0xfffff7f85cc0  // b.any
   0x0000fffff7f85ca0:	b9400169	ldr	w9, [x11]
   0x0000fffff7f85ca4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85ca8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85cac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85cb0:	54000081	b.ne	0xfffff7f85cc0  // b.any
   0x0000fffff7f85cb4:	fd400560	ldr	d0, [x11, #8]
   0x0000fffff7f85cb8:	fd0027e0	str	d0, [sp, #72]
   0x0000fffff7f85cbc:	1400000d	b	0xfffff7f85cf0
   0x0000fffff7f85cc0:	aa1303e0	mov	x0, x19
   0x0000fffff7f85cc4:	d2800021	mov	x1, #0x1                   	// #1
   0x0000fffff7f85cc8:	d29bab02	mov	x2, #0xdd58                	// #56664
   0x0000fffff7f85ccc:	f2b557e2	movk	x2, #0xaabf, lsl #16
   0x0000fffff7f85cd0:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f85cd4:	910123e3	add	x3, sp, #0x48
   0x0000fffff7f85cd8:	d28e7090	mov	x16, #0x7384                	// #29572
   0x0000fffff7f85cdc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85ce0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85ce4:	d63f0200	blr	x16
   0x0000fffff7f85ce8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85cec:	540008e0	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f85cf0:	d2997009	mov	x9, #0xcb80                	// #52096
   0x0000fffff7f85cf4:	f2b55789	movk	x9, #0xaabc, lsl #16
   0x0000fffff7f85cf8:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f85cfc:	f9400129	ldr	x9, [x9]
   0x0000fffff7f85d00:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85d04:	540000a0	b.eq	0xfffff7f85d18  // b.none
   0x0000fffff7f85d08:	b940926a	ldr	w10, [x19, #144]
   0x0000fffff7f85d0c:	37d8006a	tbnz	w10, #27, 0xfffff7f85d18
   0x0000fffff7f85d10:	b940b12a	ldr	w10, [x9, #176]
   0x0000fffff7f85d14:	36d801ca	tbz	w10, #27, 0xfffff7f85d4c
   0x0000fffff7f85d18:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f85d1c:	f94027e3	ldr	x3, [sp, #72]
   0x0000fffff7f85d20:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7f85d24:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7f85d28:	aa1303e1	mov	x1, x19
   0x0000fffff7f85d2c:	d2800122	mov	x2, #0x9                   	// #9
   0x0000fffff7f85d30:	d2800025	mov	x5, #0x1                   	// #1
   0x0000fffff7f85d34:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7f85d38:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f85d3c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85d40:	d63f0200	blr	x16
   0x0000fffff7f85d44:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85d48:	54000600	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f85d4c:	f94023e9	ldr	x9, [sp, #64]
   0x0000fffff7f85d50:	9e620120	scvtf	d0, x9
   0x0000fffff7f85d54:	fd4027e1	ldr	d1, [sp, #72]
   0x0000fffff7f85d58:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f85d5c:	fd0023e0	str	d0, [sp, #64]
   0x0000fffff7f85d60:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7f85d64:	fd4023e1	ldr	d1, [sp, #64]
   0x0000fffff7f85d68:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f85d6c:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7f85d70:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85d74:	36d801c9	tbz	w9, #27, 0xfffff7f85dac
   0x0000fffff7f85d78:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f85d7c:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7f85d80:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7f85d84:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7f85d88:	aa1303e1	mov	x1, x19
   0x0000fffff7f85d8c:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7f85d90:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7f85d94:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7f85d98:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f85d9c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85da0:	d63f0200	blr	x16
   0x0000fffff7f85da4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85da8:	54000300	b.eq	0xfffff7f85e08  // b.none
   0x0000fffff7f85dac:	f9401be9	ldr	x9, [sp, #48]
   0x0000fffff7f85db0:	f9001fe9	str	x9, [sp, #56]
   0x0000fffff7f85db4:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85db8:	f9001be9	str	x9, [sp, #48]
   0x0000fffff7f85dbc:	17fffcd8	b	0xfffff7f8511c
   0x0000fffff7f85dc0:	52800089	mov	w9, #0x4                   	// #4
   0x0000fffff7f85dc4:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85dc8:	b9000289	str	w9, [x20]
   0x0000fffff7f85dcc:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7f85dd0:	f900068a	str	x10, [x20, #8]
   0x0000fffff7f85dd4:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7f85dd8:	fd000680	str	d0, [x20, #8]
   0x0000fffff7f85ddc:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f85de0:	d29dbe10	mov	x16, #0xedf0                	// #60912
   0x0000fffff7f85de4:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f85de8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85dec:	d63f0200	blr	x16
   0x0000fffff7f85df0:	913003ff	add	sp, sp, #0xc00
   0x0000fffff7f85df4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85df8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85dfc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85e00:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f85e04:	d65f03c0	ret
   0x0000fffff7f85e08:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f85e0c:	d29dc010	mov	x16, #0xee00                	// #60928
   0x0000fffff7f85e10:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f85e14:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85e18:	d63f0200	blr	x16
   0x0000fffff7f85e1c:	913003ff	add	sp, sp, #0xc00
   0x0000fffff7f85e20:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85e24:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85e28:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85e2c:	d2800000	mov	x0, #0x0                   	// #0
   0x0000fffff7f85e30:	d65f03c0	ret
   0x0000fffff7f85e34:	00000000	udf	#0
   0x0000fffff7f85e38:	00000000	udf	#0
   0x0000fffff7f85e3c:	00000000	udf	#0
   0x0000fffff7f85e40:	00000000	udf	#0
   0x0000fffff7f85e44:	00000000	udf	#0
   0x0000fffff7f85e48:	00000000	udf	#0
   0x0000fffff7f85e4c:	00000000	udf	#0
   0x0000fffff7f85e50:	00000000	udf	#0
   0x0000fffff7f85e54:	00000000	udf	#0
   0x0000fffff7f85e58:	00000000	udf	#0
   0x0000fffff7f85e5c:	00000000	udf	#0
   0x0000fffff7f85e60:	00000000	udf	#0
   0x0000fffff7f85e64:	00000000	udf	#0
   0x0000fffff7f85e68:	00000000	udf	#0
   0x0000fffff7f85e6c:	00000000	udf	#0
   0x0000fffff7f85e70:	00000000	udf	#0
   0x0000fffff7f85e74:	00000000	udf	#0
   0x0000fffff7f85e78:	00000000	udf	#0
   0x0000fffff7f85e7c:	00000000	udf	#0
   0x0000fffff7f85e80:	00000000	udf	#0
   0x0000fffff7f85e84:	00000000	udf	#0
   0x0000fffff7f85e88:	00000000	udf	#0
   0x0000fffff7f85e8c:	00000000	udf	#0
   0x0000fffff7f85e90:	00000000	udf	#0
   0x0000fffff7f85e94:	00000000	udf	#0
   0x0000fffff7f85e98:	00000000	udf	#0
   0x0000fffff7f85e9c:	00000000	udf	#0
   0x0000fffff7f85ea0:	00000000	udf	#0
   0x0000fffff7f85ea4:	00000000	udf	#0
   0x0000fffff7f85ea8:	00000000	udf	#0
   0x0000fffff7f85eac:	00000000	udf	#0
   0x0000fffff7f85eb0:	00000000	udf	#0
   0x0000fffff7f85eb4:	00000000	udf	#0
   0x0000fffff7f85eb8:	00000000	udf	#0
   0x0000fffff7f85ebc:	00000000	udf	#0
   0x0000fffff7f85ec0:	00000000	udf	#0
   0x0000fffff7f85ec4:	00000000	udf	#0
   0x0000fffff7f85ec8:	00000000	udf	#0
   0x0000fffff7f85ecc:	00000000	udf	#0
   0x0000fffff7f85ed0:	00000000	udf	#0
   0x0000fffff7f85ed4:	00000000	udf	#0
   0x0000fffff7f85ed8:	00000000	udf	#0
   0x0000fffff7f85edc:	00000000	udf	#0
   0x0000fffff7f85ee0:	00000000	udf	#0
   0x0000fffff7f85ee4:	00000000	udf	#0
   0x0000fffff7f85ee8:	00000000	udf	#0
   0x0000fffff7f85eec:	00000000	udf	#0
   0x0000fffff7f85ef0:	00000000	udf	#0
   0x0000fffff7f85ef4:	00000000	udf	#0
   0x0000fffff7f85ef8:	00000000	udf	#0
   0x0000fffff7f85efc:	00000000	udf	#0
   0x0000fffff7f85f00:	00000000	udf	#0
   0x0000fffff7f85f04:	00000000	udf	#0
   0x0000fffff7f85f08:	00000000	udf	#0
   0x0000fffff7f85f0c:	00000000	udf	#0
   0x0000fffff7f85f10:	00000000	udf	#0
   0x0000fffff7f85f14:	00000000	udf	#0
   0x0000fffff7f85f18:	00000000	udf	#0
   0x0000fffff7f85f1c:	00000000	udf	#0
   0x0000fffff7f85f20:	00000000	udf	#0
   0x0000fffff7f85f24:	00000000	udf	#0
   0x0000fffff7f85f28:	00000000	udf	#0
   0x0000fffff7f85f2c:	00000000	udf	#0
   0x0000fffff7f85f30:	00000000	udf	#0
   0x0000fffff7f85f34:	00000000	udf	#0
   0x0000fffff7f85f38:	00000000	udf	#0
   0x0000fffff7f85f3c:	00000000	udf	#0
   0x0000fffff7f85f40:	00000000	udf	#0
   0x0000fffff7f85f44:	00000000	udf	#0
   0x0000fffff7f85f48:	00000000	udf	#0
   0x0000fffff7f85f4c:	00000000	udf	#0
   0x0000fffff7f85f50:	00000000	udf	#0
   0x0000fffff7f85f54:	00000000	udf	#0
   0x0000fffff7f85f58:	00000000	udf	#0
   0x0000fffff7f85f5c:	00000000	udf	#0
   0x0000fffff7f85f60:	00000000	udf	#0
   0x0000fffff7f85f64:	00000000	udf	#0
   0x0000fffff7f85f68:	00000000	udf	#0
   0x0000fffff7f85f6c:	00000000	udf	#0
   0x0000fffff7f85f70:	00000000	udf	#0
   0x0000fffff7f85f74:	00000000	udf	#0
   0x0000fffff7f85f78:	00000000	udf	#0
   0x0000fffff7f85f7c:	00000000	udf	#0
   0x0000fffff7f85f80:	00000000	udf	#0
   0x0000fffff7f85f84:	00000000	udf	#0
   0x0000fffff7f85f88:	00000000	udf	#0
   0x0000fffff7f85f8c:	00000000	udf	#0
   0x0000fffff7f85f90:	00000000	udf	#0
   0x0000fffff7f85f94:	00000000	udf	#0
   0x0000fffff7f85f98:	00000000	udf	#0
   0x0000fffff7f85f9c:	00000000	udf	#0
   0x0000fffff7f85fa0:	00000000	udf	#0
   0x0000fffff7f85fa4:	00000000	udf	#0
   0x0000fffff7f85fa8:	00000000	udf	#0
   0x0000fffff7f85fac:	00000000	udf	#0
   0x0000fffff7f85fb0:	00000000	udf	#0
   0x0000fffff7f85fb4:	00000000	udf	#0
   0x0000fffff7f85fb8:	00000000	udf	#0
   0x0000fffff7f85fbc:	00000000	udf	#0
   0x0000fffff7f85fc0:	00000000	udf	#0
   0x0000fffff7f85fc4:	00000000	udf	#0
   0x0000fffff7f85fc8:	00000000	udf	#0
   0x0000fffff7f85fcc:	00000000	udf	#0
   0x0000fffff7f85fd0:	00000000	udf	#0
   0x0000fffff7f85fd4:	00000000	udf	#0
   0x0000fffff7f85fd8:	00000000	udf	#0
   0x0000fffff7f85fdc:	00000000	udf	#0
   0x0000fffff7f85fe0:	00000000	udf	#0
   0x0000fffff7f85fe4:	00000000	udf	#0
   0x0000fffff7f85fe8:	00000000	udf	#0
   0x0000fffff7f85fec:	00000000	udf	#0
   0x0000fffff7f85ff0:	00000000	udf	#0
   0x0000fffff7f85ff4:	00000000	udf	#0
   0x0000fffff7f85ff8:	00000000	udf	#0
   0x0000fffff7f85ffc:	00000000	udf	#0
End of assembler dump.
