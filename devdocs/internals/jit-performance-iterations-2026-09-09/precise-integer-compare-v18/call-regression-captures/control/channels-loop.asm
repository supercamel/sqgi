Dump of assembler code from 0xfffff7f84000 to 0xfffff7f85000:
   0x0000fffff7f84000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7f84004:	910003fd	mov	x29, sp
   0x0000fffff7f84008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7f8400c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7f84010:	d13003ff	sub	sp, sp, #0xc00
   0x0000fffff7f84014:	aa0003f3	mov	x19, x0
   0x0000fffff7f84018:	aa0103f4	mov	x20, x1
   0x0000fffff7f8401c:	aa0203f5	mov	x21, x2
   0x0000fffff7f84020:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f84024:	912063e1	add	x1, sp, #0x818
   0x0000fffff7f84028:	d2996c02	mov	x2, #0xcb60                	// #52064
   0x0000fffff7f8402c:	f2b557a2	movk	x2, #0xaabd, lsl #16
   0x0000fffff7f84030:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f84034:	d2910410	mov	x16, #0x8820                	// #34848
   0x0000fffff7f84038:	f2b55650	movk	x16, #0xaab2, lsl #16
   0x0000fffff7f8403c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84040:	d63f0200	blr	x16
   0x0000fffff7f84044:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f84048:	f90403e9	str	x9, [sp, #2048]
   0x0000fffff7f8404c:	f9401ea9	ldr	x9, [x21, #56]
   0x0000fffff7f84050:	d299da0a	mov	x10, #0xced0                	// #52944
   0x0000fffff7f84054:	f2b557ea	movk	x10, #0xaabf, lsl #16
   0x0000fffff7f84058:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7f8405c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84060:	54002f21	b.ne	0xfffff7f84644  // b.any
   0x0000fffff7f84064:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f84068:	aa1303e1	mov	x1, x19
   0x0000fffff7f8406c:	d2800042	mov	x2, #0x2                   	// #2
   0x0000fffff7f84070:	d282c610	mov	x16, #0x1630                	// #5680
   0x0000fffff7f84074:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84078:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8407c:	d63f0200	blr	x16
   0x0000fffff7f84080:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84084:	54002e00	b.eq	0xfffff7f84644  // b.none
   0x0000fffff7f84088:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f8408c:	aa1303e1	mov	x1, x19
   0x0000fffff7f84090:	d2800062	mov	x2, #0x3                   	// #3
   0x0000fffff7f84094:	d282c610	mov	x16, #0x1630                	// #5680
   0x0000fffff7f84098:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8409c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f840a0:	d63f0200	blr	x16
   0x0000fffff7f840a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f840a8:	54002ce0	b.eq	0xfffff7f84644  // b.none
   0x0000fffff7f840ac:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f840b0:	aa1303e1	mov	x1, x19
   0x0000fffff7f840b4:	d2800082	mov	x2, #0x4                   	// #4
   0x0000fffff7f840b8:	d282c610	mov	x16, #0x1630                	// #5680
   0x0000fffff7f840bc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f840c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f840c4:	d63f0200	blr	x16
   0x0000fffff7f840c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f840cc:	54002bc0	b.eq	0xfffff7f84644  // b.none
   0x0000fffff7f840d0:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f840d4:	aa1303e1	mov	x1, x19
   0x0000fffff7f840d8:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7f840dc:	d282c610	mov	x16, #0x1630                	// #5680
   0x0000fffff7f840e0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f840e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f840e8:	d63f0200	blr	x16
   0x0000fffff7f840ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f840f0:	54002aa0	b.eq	0xfffff7f84644  // b.none
   0x0000fffff7f840f4:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f840f8:	aa1303e1	mov	x1, x19
   0x0000fffff7f840fc:	d28000c2	mov	x2, #0x6                   	// #6
   0x0000fffff7f84100:	d282c610	mov	x16, #0x1630                	// #5680
   0x0000fffff7f84104:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84108:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8410c:	d63f0200	blr	x16
   0x0000fffff7f84110:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84114:	54002980	b.eq	0xfffff7f84644  // b.none
   0x0000fffff7f84118:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f8411c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84120:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84124:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84128:	540028e1	b.ne	0xfffff7f84644  // b.any
   0x0000fffff7f8412c:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f84130:	f90007e9	str	x9, [sp, #8]
   0x0000fffff7f84134:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f84138:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8413c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84140:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84144:	54002801	b.ne	0xfffff7f84644  // b.any
   0x0000fffff7f84148:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7f8414c:	fd000be0	str	d0, [sp, #16]
   0x0000fffff7f84150:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f84154:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84158:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8415c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84160:	54002721	b.ne	0xfffff7f84644  // b.any
   0x0000fffff7f84164:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f84168:	fd000fe0	str	d0, [sp, #24]
   0x0000fffff7f8416c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84170:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84174:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84178:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8417c:	54002641	b.ne	0xfffff7f84644  // b.any
   0x0000fffff7f84180:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f84184:	fd0013e0	str	d0, [sp, #32]
   0x0000fffff7f84188:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f8418c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84190:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84194:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84198:	54002561	b.ne	0xfffff7f84644  // b.any
   0x0000fffff7f8419c:	fd402e60	ldr	d0, [x19, #88]
   0x0000fffff7f841a0:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7f841a4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f841a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f841ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f841b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f841b4:	54002481	b.ne	0xfffff7f84644  // b.any
   0x0000fffff7f841b8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f841bc:	f9001be9	str	x9, [sp, #48]
   0x0000fffff7f841c0:	f9401be9	ldr	x9, [sp, #48]
   0x0000fffff7f841c4:	f94007ea	ldr	x10, [sp, #8]
   0x0000fffff7f841c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f841cc:	540019ea	b.ge	0xfffff7f84508  // b.tcont
   0x0000fffff7f841d0:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f841d4:	f90403e9	str	x9, [sp, #2048]
   0x0000fffff7f841d8:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7f841dc:	f9001fe9	str	x9, [sp, #56]
   0x0000fffff7f841e0:	f9401be9	ldr	x9, [sp, #48]
   0x0000fffff7f841e4:	d28002ea	mov	x10, #0x17                  	// #23
   0x0000fffff7f841e8:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f841ec:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f841f0:	f9001fe9	str	x9, [sp, #56]
   0x0000fffff7f841f4:	aa1303e0	mov	x0, x19
   0x0000fffff7f841f8:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7f841fc:	d29f1102	mov	x2, #0xf888                	// #63624
   0x0000fffff7f84200:	f2b55802	movk	x2, #0xaac0, lsl #16
   0x0000fffff7f84204:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f84208:	d293fe03	mov	x3, #0x9ff0                	// #40944
   0x0000fffff7f8420c:	f2b55a43	movk	x3, #0xaad2, lsl #16
   0x0000fffff7f84210:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7f84214:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7f84218:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7f8421c:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7f84220:	d28c3e10	mov	x16, #0x61f0                	// #25072
   0x0000fffff7f84224:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84228:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8422c:	d63f0200	blr	x16
   0x0000fffff7f84230:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84234:	54002080	b.eq	0xfffff7f84644  // b.none
   0x0000fffff7f84238:	f9400be9	ldr	x9, [sp, #16]
   0x0000fffff7f8423c:	f9002be9	str	x9, [sp, #80]
   0x0000fffff7f84240:	f9401fe9	ldr	x9, [sp, #56]
   0x0000fffff7f84244:	f9002fe9	str	x9, [sp, #88]
   0x0000fffff7f84248:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f8424c:	f2e7fd89	movk	x9, #0x3fec, lsl #48
   0x0000fffff7f84250:	f90033e9	str	x9, [sp, #96]
   0x0000fffff7f84254:	fd402be0	ldr	d0, [sp, #80]
   0x0000fffff7f84258:	fd4033e1	ldr	d1, [sp, #96]
   0x0000fffff7f8425c:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f84260:	fd0037e0	str	d0, [sp, #104]
   0x0000fffff7f84264:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f84268:	f2e7fe09	movk	x9, #0x3ff0, lsl #48
   0x0000fffff7f8426c:	f9003be9	str	x9, [sp, #112]
   0x0000fffff7f84270:	fd403be0	ldr	d0, [sp, #112]
   0x0000fffff7f84274:	fd4033e1	ldr	d1, [sp, #96]
   0x0000fffff7f84278:	1e613800	fsub	d0, d0, d1
   0x0000fffff7f8427c:	fd003be0	str	d0, [sp, #112]
   0x0000fffff7f84280:	f9402fe9	ldr	x9, [sp, #88]
   0x0000fffff7f84284:	9e620120	scvtf	d0, x9
   0x0000fffff7f84288:	fd403be1	ldr	d1, [sp, #112]
   0x0000fffff7f8428c:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f84290:	fd003be0	str	d0, [sp, #112]
   0x0000fffff7f84294:	fd4037e0	ldr	d0, [sp, #104]
   0x0000fffff7f84298:	fd403be1	ldr	d1, [sp, #112]
   0x0000fffff7f8429c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f842a0:	fd0037e0	str	d0, [sp, #104]
   0x0000fffff7f842a4:	f94037e9	ldr	x9, [sp, #104]
   0x0000fffff7f842a8:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7f842ac:	f94023e9	ldr	x9, [sp, #64]
   0x0000fffff7f842b0:	f9000be9	str	x9, [sp, #16]
   0x0000fffff7f842b4:	aa1303e0	mov	x0, x19
   0x0000fffff7f842b8:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7f842bc:	d29f1102	mov	x2, #0xf888                	// #63624
   0x0000fffff7f842c0:	f2b55802	movk	x2, #0xaac0, lsl #16
   0x0000fffff7f842c4:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f842c8:	d293fe03	mov	x3, #0x9ff0                	// #40944
   0x0000fffff7f842cc:	f2b55a43	movk	x3, #0xaad2, lsl #16
   0x0000fffff7f842d0:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7f842d4:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7f842d8:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7f842dc:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7f842e0:	d28c3e10	mov	x16, #0x61f0                	// #25072
   0x0000fffff7f842e4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f842e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f842ec:	d63f0200	blr	x16
   0x0000fffff7f842f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f842f4:	54001a80	b.eq	0xfffff7f84644  // b.none
   0x0000fffff7f842f8:	f9400fe9	ldr	x9, [sp, #24]
   0x0000fffff7f842fc:	f9002be9	str	x9, [sp, #80]
   0x0000fffff7f84300:	f9401fe9	ldr	x9, [sp, #56]
   0x0000fffff7f84304:	f9002fe9	str	x9, [sp, #88]
   0x0000fffff7f84308:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f8430c:	f2e7fd09	movk	x9, #0x3fe8, lsl #48
   0x0000fffff7f84310:	f90033e9	str	x9, [sp, #96]
   0x0000fffff7f84314:	fd402be0	ldr	d0, [sp, #80]
   0x0000fffff7f84318:	fd4033e1	ldr	d1, [sp, #96]
   0x0000fffff7f8431c:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f84320:	fd0037e0	str	d0, [sp, #104]
   0x0000fffff7f84324:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f84328:	f2e7fe09	movk	x9, #0x3ff0, lsl #48
   0x0000fffff7f8432c:	f9003be9	str	x9, [sp, #112]
   0x0000fffff7f84330:	fd403be0	ldr	d0, [sp, #112]
   0x0000fffff7f84334:	fd4033e1	ldr	d1, [sp, #96]
   0x0000fffff7f84338:	1e613800	fsub	d0, d0, d1
   0x0000fffff7f8433c:	fd003be0	str	d0, [sp, #112]
   0x0000fffff7f84340:	f9402fe9	ldr	x9, [sp, #88]
   0x0000fffff7f84344:	9e620120	scvtf	d0, x9
   0x0000fffff7f84348:	fd403be1	ldr	d1, [sp, #112]
   0x0000fffff7f8434c:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f84350:	fd003be0	str	d0, [sp, #112]
   0x0000fffff7f84354:	fd4037e0	ldr	d0, [sp, #104]
   0x0000fffff7f84358:	fd403be1	ldr	d1, [sp, #112]
   0x0000fffff7f8435c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f84360:	fd0037e0	str	d0, [sp, #104]
   0x0000fffff7f84364:	f94037e9	ldr	x9, [sp, #104]
   0x0000fffff7f84368:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7f8436c:	f94023e9	ldr	x9, [sp, #64]
   0x0000fffff7f84370:	f9000fe9	str	x9, [sp, #24]
   0x0000fffff7f84374:	aa1303e0	mov	x0, x19
   0x0000fffff7f84378:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7f8437c:	d29f1102	mov	x2, #0xf888                	// #63624
   0x0000fffff7f84380:	f2b55802	movk	x2, #0xaac0, lsl #16
   0x0000fffff7f84384:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f84388:	d293fe03	mov	x3, #0x9ff0                	// #40944
   0x0000fffff7f8438c:	f2b55a43	movk	x3, #0xaad2, lsl #16
   0x0000fffff7f84390:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7f84394:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7f84398:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7f8439c:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7f843a0:	d28c3e10	mov	x16, #0x61f0                	// #25072
   0x0000fffff7f843a4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f843a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f843ac:	d63f0200	blr	x16
   0x0000fffff7f843b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f843b4:	54001480	b.eq	0xfffff7f84644  // b.none
   0x0000fffff7f843b8:	f94013e9	ldr	x9, [sp, #32]
   0x0000fffff7f843bc:	f9002be9	str	x9, [sp, #80]
   0x0000fffff7f843c0:	f9401fe9	ldr	x9, [sp, #56]
   0x0000fffff7f843c4:	f9002fe9	str	x9, [sp, #88]
   0x0000fffff7f843c8:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f843cc:	f2e7fc89	movk	x9, #0x3fe4, lsl #48
   0x0000fffff7f843d0:	f90033e9	str	x9, [sp, #96]
   0x0000fffff7f843d4:	fd402be0	ldr	d0, [sp, #80]
   0x0000fffff7f843d8:	fd4033e1	ldr	d1, [sp, #96]
   0x0000fffff7f843dc:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f843e0:	fd0037e0	str	d0, [sp, #104]
   0x0000fffff7f843e4:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f843e8:	f2e7fe09	movk	x9, #0x3ff0, lsl #48
   0x0000fffff7f843ec:	f9003be9	str	x9, [sp, #112]
   0x0000fffff7f843f0:	fd403be0	ldr	d0, [sp, #112]
   0x0000fffff7f843f4:	fd4033e1	ldr	d1, [sp, #96]
   0x0000fffff7f843f8:	1e613800	fsub	d0, d0, d1
   0x0000fffff7f843fc:	fd003be0	str	d0, [sp, #112]
   0x0000fffff7f84400:	f9402fe9	ldr	x9, [sp, #88]
   0x0000fffff7f84404:	9e620120	scvtf	d0, x9
   0x0000fffff7f84408:	fd403be1	ldr	d1, [sp, #112]
   0x0000fffff7f8440c:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f84410:	fd003be0	str	d0, [sp, #112]
   0x0000fffff7f84414:	fd4037e0	ldr	d0, [sp, #104]
   0x0000fffff7f84418:	fd403be1	ldr	d1, [sp, #112]
   0x0000fffff7f8441c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f84420:	fd0037e0	str	d0, [sp, #104]
   0x0000fffff7f84424:	f94037e9	ldr	x9, [sp, #104]
   0x0000fffff7f84428:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7f8442c:	f94023e9	ldr	x9, [sp, #64]
   0x0000fffff7f84430:	f90013e9	str	x9, [sp, #32]
   0x0000fffff7f84434:	aa1303e0	mov	x0, x19
   0x0000fffff7f84438:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7f8443c:	d29f1102	mov	x2, #0xf888                	// #63624
   0x0000fffff7f84440:	f2b55802	movk	x2, #0xaac0, lsl #16
   0x0000fffff7f84444:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f84448:	d293fe03	mov	x3, #0x9ff0                	// #40944
   0x0000fffff7f8444c:	f2b55a43	movk	x3, #0xaad2, lsl #16
   0x0000fffff7f84450:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7f84454:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7f84458:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7f8445c:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7f84460:	d28c3e10	mov	x16, #0x61f0                	// #25072
   0x0000fffff7f84464:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84468:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8446c:	d63f0200	blr	x16
   0x0000fffff7f84470:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84474:	54000e80	b.eq	0xfffff7f84644  // b.none
   0x0000fffff7f84478:	f94017e9	ldr	x9, [sp, #40]
   0x0000fffff7f8447c:	f9002be9	str	x9, [sp, #80]
   0x0000fffff7f84480:	f9401fe9	ldr	x9, [sp, #56]
   0x0000fffff7f84484:	f9002fe9	str	x9, [sp, #88]
   0x0000fffff7f84488:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f8448c:	f2e7fc09	movk	x9, #0x3fe0, lsl #48
   0x0000fffff7f84490:	f90033e9	str	x9, [sp, #96]
   0x0000fffff7f84494:	fd402be0	ldr	d0, [sp, #80]
   0x0000fffff7f84498:	fd4033e1	ldr	d1, [sp, #96]
   0x0000fffff7f8449c:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f844a0:	fd0037e0	str	d0, [sp, #104]
   0x0000fffff7f844a4:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f844a8:	f2e7fe09	movk	x9, #0x3ff0, lsl #48
   0x0000fffff7f844ac:	f9003be9	str	x9, [sp, #112]
   0x0000fffff7f844b0:	fd403be0	ldr	d0, [sp, #112]
   0x0000fffff7f844b4:	fd4033e1	ldr	d1, [sp, #96]
   0x0000fffff7f844b8:	1e613800	fsub	d0, d0, d1
   0x0000fffff7f844bc:	fd003be0	str	d0, [sp, #112]
   0x0000fffff7f844c0:	f9402fe9	ldr	x9, [sp, #88]
   0x0000fffff7f844c4:	9e620120	scvtf	d0, x9
   0x0000fffff7f844c8:	fd403be1	ldr	d1, [sp, #112]
   0x0000fffff7f844cc:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f844d0:	fd003be0	str	d0, [sp, #112]
   0x0000fffff7f844d4:	fd4037e0	ldr	d0, [sp, #104]
   0x0000fffff7f844d8:	fd403be1	ldr	d1, [sp, #112]
   0x0000fffff7f844dc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f844e0:	fd0037e0	str	d0, [sp, #104]
   0x0000fffff7f844e4:	f94037e9	ldr	x9, [sp, #104]
   0x0000fffff7f844e8:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7f844ec:	f94023e9	ldr	x9, [sp, #64]
   0x0000fffff7f844f0:	f90017e9	str	x9, [sp, #40]
   0x0000fffff7f844f4:	f9401be9	ldr	x9, [sp, #48]
   0x0000fffff7f844f8:	f9001fe9	str	x9, [sp, #56]
   0x0000fffff7f844fc:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84500:	f9001be9	str	x9, [sp, #48]
   0x0000fffff7f84504:	17ffff2f	b	0xfffff7f841c0
   0x0000fffff7f84508:	f94403e9	ldr	x9, [sp, #2048]
   0x0000fffff7f8450c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84510:	54000800	b.eq	0xfffff7f84610  // b.none
   0x0000fffff7f84514:	aa1303e0	mov	x0, x19
   0x0000fffff7f84518:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7f8451c:	910043e2	add	x2, sp, #0x10
   0x0000fffff7f84520:	d2844e90	mov	x16, #0x2274                	// #8820
   0x0000fffff7f84524:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84528:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8452c:	d63f0200	blr	x16
   0x0000fffff7f84530:	aa1303e0	mov	x0, x19
   0x0000fffff7f84534:	d2800061	mov	x1, #0x3                   	// #3
   0x0000fffff7f84538:	910063e2	add	x2, sp, #0x18
   0x0000fffff7f8453c:	d2844e90	mov	x16, #0x2274                	// #8820
   0x0000fffff7f84540:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84544:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84548:	d63f0200	blr	x16
   0x0000fffff7f8454c:	aa1303e0	mov	x0, x19
   0x0000fffff7f84550:	d2800081	mov	x1, #0x4                   	// #4
   0x0000fffff7f84554:	910083e2	add	x2, sp, #0x20
   0x0000fffff7f84558:	d2844e90	mov	x16, #0x2274                	// #8820
   0x0000fffff7f8455c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84560:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84564:	d63f0200	blr	x16
   0x0000fffff7f84568:	aa1303e0	mov	x0, x19
   0x0000fffff7f8456c:	d28000a1	mov	x1, #0x5                   	// #5
   0x0000fffff7f84570:	9100a3e2	add	x2, sp, #0x28
   0x0000fffff7f84574:	d2844e90	mov	x16, #0x2274                	// #8820
   0x0000fffff7f84578:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8457c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84580:	d63f0200	blr	x16
   0x0000fffff7f84584:	aa1303e0	mov	x0, x19
   0x0000fffff7f84588:	d28000c1	mov	x1, #0x6                   	// #6
   0x0000fffff7f8458c:	f9401be2	ldr	x2, [sp, #48]
   0x0000fffff7f84590:	d2834e10	mov	x16, #0x1a70                	// #6768
   0x0000fffff7f84594:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84598:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8459c:	d63f0200	blr	x16
   0x0000fffff7f845a0:	aa1303e0	mov	x0, x19
   0x0000fffff7f845a4:	d28000e1	mov	x1, #0x7                   	// #7
   0x0000fffff7f845a8:	f9401fe2	ldr	x2, [sp, #56]
   0x0000fffff7f845ac:	d2834e10	mov	x16, #0x1a70                	// #6768
   0x0000fffff7f845b0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f845b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f845b8:	d63f0200	blr	x16
   0x0000fffff7f845bc:	aa1303e0	mov	x0, x19
   0x0000fffff7f845c0:	d2800101	mov	x1, #0x8                   	// #8
   0x0000fffff7f845c4:	910103e2	add	x2, sp, #0x40
   0x0000fffff7f845c8:	d2844e90	mov	x16, #0x2274                	// #8820
   0x0000fffff7f845cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f845d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f845d4:	d63f0200	blr	x16
   0x0000fffff7f845d8:	aa1303e0	mov	x0, x19
   0x0000fffff7f845dc:	d2800141	mov	x1, #0xa                   	// #10
   0x0000fffff7f845e0:	910143e2	add	x2, sp, #0x50
   0x0000fffff7f845e4:	d2844e90	mov	x16, #0x2274                	// #8820
   0x0000fffff7f845e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f845ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f845f0:	d63f0200	blr	x16
   0x0000fffff7f845f4:	aa1303e0	mov	x0, x19
   0x0000fffff7f845f8:	d2800161	mov	x1, #0xb                   	// #11
   0x0000fffff7f845fc:	f9402fe2	ldr	x2, [sp, #88]
   0x0000fffff7f84600:	d2834e10	mov	x16, #0x1a70                	// #6768
   0x0000fffff7f84604:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84608:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8460c:	d63f0200	blr	x16
   0x0000fffff7f84610:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7f84614:	f9000289	str	x9, [x20]
   0x0000fffff7f84618:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f8461c:	d2831e10	mov	x16, #0x18f0                	// #6384
   0x0000fffff7f84620:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84624:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84628:	d63f0200	blr	x16
   0x0000fffff7f8462c:	913003ff	add	sp, sp, #0xc00
   0x0000fffff7f84630:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84634:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84638:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f8463c:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f84640:	d65f03c0	ret
   0x0000fffff7f84644:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f84648:	d2832010	mov	x16, #0x1900                	// #6400
   0x0000fffff7f8464c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84650:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84654:	d63f0200	blr	x16
   0x0000fffff7f84658:	913003ff	add	sp, sp, #0xc00
   0x0000fffff7f8465c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84660:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84664:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84668:	d2800000	mov	x0, #0x0                   	// #0
   0x0000fffff7f8466c:	d65f03c0	ret
   0x0000fffff7f84670:	00000000	udf	#0
   0x0000fffff7f84674:	00000000	udf	#0
   0x0000fffff7f84678:	00000000	udf	#0
   0x0000fffff7f8467c:	00000000	udf	#0
   0x0000fffff7f84680:	00000000	udf	#0
   0x0000fffff7f84684:	00000000	udf	#0
   0x0000fffff7f84688:	00000000	udf	#0
   0x0000fffff7f8468c:	00000000	udf	#0
   0x0000fffff7f84690:	00000000	udf	#0
   0x0000fffff7f84694:	00000000	udf	#0
   0x0000fffff7f84698:	00000000	udf	#0
   0x0000fffff7f8469c:	00000000	udf	#0
   0x0000fffff7f846a0:	00000000	udf	#0
   0x0000fffff7f846a4:	00000000	udf	#0
   0x0000fffff7f846a8:	00000000	udf	#0
   0x0000fffff7f846ac:	00000000	udf	#0
   0x0000fffff7f846b0:	00000000	udf	#0
   0x0000fffff7f846b4:	00000000	udf	#0
   0x0000fffff7f846b8:	00000000	udf	#0
   0x0000fffff7f846bc:	00000000	udf	#0
   0x0000fffff7f846c0:	00000000	udf	#0
   0x0000fffff7f846c4:	00000000	udf	#0
   0x0000fffff7f846c8:	00000000	udf	#0
   0x0000fffff7f846cc:	00000000	udf	#0
   0x0000fffff7f846d0:	00000000	udf	#0
   0x0000fffff7f846d4:	00000000	udf	#0
   0x0000fffff7f846d8:	00000000	udf	#0
   0x0000fffff7f846dc:	00000000	udf	#0
   0x0000fffff7f846e0:	00000000	udf	#0
   0x0000fffff7f846e4:	00000000	udf	#0
   0x0000fffff7f846e8:	00000000	udf	#0
   0x0000fffff7f846ec:	00000000	udf	#0
   0x0000fffff7f846f0:	00000000	udf	#0
   0x0000fffff7f846f4:	00000000	udf	#0
   0x0000fffff7f846f8:	00000000	udf	#0
   0x0000fffff7f846fc:	00000000	udf	#0
   0x0000fffff7f84700:	00000000	udf	#0
   0x0000fffff7f84704:	00000000	udf	#0
   0x0000fffff7f84708:	00000000	udf	#0
   0x0000fffff7f8470c:	00000000	udf	#0
   0x0000fffff7f84710:	00000000	udf	#0
   0x0000fffff7f84714:	00000000	udf	#0
   0x0000fffff7f84718:	00000000	udf	#0
   0x0000fffff7f8471c:	00000000	udf	#0
   0x0000fffff7f84720:	00000000	udf	#0
   0x0000fffff7f84724:	00000000	udf	#0
   0x0000fffff7f84728:	00000000	udf	#0
   0x0000fffff7f8472c:	00000000	udf	#0
   0x0000fffff7f84730:	00000000	udf	#0
   0x0000fffff7f84734:	00000000	udf	#0
   0x0000fffff7f84738:	00000000	udf	#0
   0x0000fffff7f8473c:	00000000	udf	#0
   0x0000fffff7f84740:	00000000	udf	#0
   0x0000fffff7f84744:	00000000	udf	#0
   0x0000fffff7f84748:	00000000	udf	#0
   0x0000fffff7f8474c:	00000000	udf	#0
   0x0000fffff7f84750:	00000000	udf	#0
   0x0000fffff7f84754:	00000000	udf	#0
   0x0000fffff7f84758:	00000000	udf	#0
   0x0000fffff7f8475c:	00000000	udf	#0
   0x0000fffff7f84760:	00000000	udf	#0
   0x0000fffff7f84764:	00000000	udf	#0
   0x0000fffff7f84768:	00000000	udf	#0
   0x0000fffff7f8476c:	00000000	udf	#0
   0x0000fffff7f84770:	00000000	udf	#0
   0x0000fffff7f84774:	00000000	udf	#0
   0x0000fffff7f84778:	00000000	udf	#0
   0x0000fffff7f8477c:	00000000	udf	#0
   0x0000fffff7f84780:	00000000	udf	#0
   0x0000fffff7f84784:	00000000	udf	#0
   0x0000fffff7f84788:	00000000	udf	#0
   0x0000fffff7f8478c:	00000000	udf	#0
   0x0000fffff7f84790:	00000000	udf	#0
   0x0000fffff7f84794:	00000000	udf	#0
   0x0000fffff7f84798:	00000000	udf	#0
   0x0000fffff7f8479c:	00000000	udf	#0
   0x0000fffff7f847a0:	00000000	udf	#0
   0x0000fffff7f847a4:	00000000	udf	#0
   0x0000fffff7f847a8:	00000000	udf	#0
   0x0000fffff7f847ac:	00000000	udf	#0
   0x0000fffff7f847b0:	00000000	udf	#0
   0x0000fffff7f847b4:	00000000	udf	#0
   0x0000fffff7f847b8:	00000000	udf	#0
   0x0000fffff7f847bc:	00000000	udf	#0
   0x0000fffff7f847c0:	00000000	udf	#0
   0x0000fffff7f847c4:	00000000	udf	#0
   0x0000fffff7f847c8:	00000000	udf	#0
   0x0000fffff7f847cc:	00000000	udf	#0
   0x0000fffff7f847d0:	00000000	udf	#0
   0x0000fffff7f847d4:	00000000	udf	#0
   0x0000fffff7f847d8:	00000000	udf	#0
   0x0000fffff7f847dc:	00000000	udf	#0
   0x0000fffff7f847e0:	00000000	udf	#0
   0x0000fffff7f847e4:	00000000	udf	#0
   0x0000fffff7f847e8:	00000000	udf	#0
   0x0000fffff7f847ec:	00000000	udf	#0
   0x0000fffff7f847f0:	00000000	udf	#0
   0x0000fffff7f847f4:	00000000	udf	#0
   0x0000fffff7f847f8:	00000000	udf	#0
   0x0000fffff7f847fc:	00000000	udf	#0
   0x0000fffff7f84800:	00000000	udf	#0
   0x0000fffff7f84804:	00000000	udf	#0
   0x0000fffff7f84808:	00000000	udf	#0
   0x0000fffff7f8480c:	00000000	udf	#0
   0x0000fffff7f84810:	00000000	udf	#0
   0x0000fffff7f84814:	00000000	udf	#0
   0x0000fffff7f84818:	00000000	udf	#0
   0x0000fffff7f8481c:	00000000	udf	#0
   0x0000fffff7f84820:	00000000	udf	#0
   0x0000fffff7f84824:	00000000	udf	#0
   0x0000fffff7f84828:	00000000	udf	#0
   0x0000fffff7f8482c:	00000000	udf	#0
   0x0000fffff7f84830:	00000000	udf	#0
   0x0000fffff7f84834:	00000000	udf	#0
   0x0000fffff7f84838:	00000000	udf	#0
   0x0000fffff7f8483c:	00000000	udf	#0
   0x0000fffff7f84840:	00000000	udf	#0
   0x0000fffff7f84844:	00000000	udf	#0
   0x0000fffff7f84848:	00000000	udf	#0
   0x0000fffff7f8484c:	00000000	udf	#0
   0x0000fffff7f84850:	00000000	udf	#0
   0x0000fffff7f84854:	00000000	udf	#0
   0x0000fffff7f84858:	00000000	udf	#0
   0x0000fffff7f8485c:	00000000	udf	#0
   0x0000fffff7f84860:	00000000	udf	#0
   0x0000fffff7f84864:	00000000	udf	#0
   0x0000fffff7f84868:	00000000	udf	#0
   0x0000fffff7f8486c:	00000000	udf	#0
   0x0000fffff7f84870:	00000000	udf	#0
   0x0000fffff7f84874:	00000000	udf	#0
   0x0000fffff7f84878:	00000000	udf	#0
   0x0000fffff7f8487c:	00000000	udf	#0
   0x0000fffff7f84880:	00000000	udf	#0
   0x0000fffff7f84884:	00000000	udf	#0
   0x0000fffff7f84888:	00000000	udf	#0
   0x0000fffff7f8488c:	00000000	udf	#0
   0x0000fffff7f84890:	00000000	udf	#0
   0x0000fffff7f84894:	00000000	udf	#0
   0x0000fffff7f84898:	00000000	udf	#0
   0x0000fffff7f8489c:	00000000	udf	#0
   0x0000fffff7f848a0:	00000000	udf	#0
   0x0000fffff7f848a4:	00000000	udf	#0
   0x0000fffff7f848a8:	00000000	udf	#0
   0x0000fffff7f848ac:	00000000	udf	#0
   0x0000fffff7f848b0:	00000000	udf	#0
   0x0000fffff7f848b4:	00000000	udf	#0
   0x0000fffff7f848b8:	00000000	udf	#0
   0x0000fffff7f848bc:	00000000	udf	#0
   0x0000fffff7f848c0:	00000000	udf	#0
   0x0000fffff7f848c4:	00000000	udf	#0
   0x0000fffff7f848c8:	00000000	udf	#0
   0x0000fffff7f848cc:	00000000	udf	#0
   0x0000fffff7f848d0:	00000000	udf	#0
   0x0000fffff7f848d4:	00000000	udf	#0
   0x0000fffff7f848d8:	00000000	udf	#0
   0x0000fffff7f848dc:	00000000	udf	#0
   0x0000fffff7f848e0:	00000000	udf	#0
   0x0000fffff7f848e4:	00000000	udf	#0
   0x0000fffff7f848e8:	00000000	udf	#0
   0x0000fffff7f848ec:	00000000	udf	#0
   0x0000fffff7f848f0:	00000000	udf	#0
   0x0000fffff7f848f4:	00000000	udf	#0
   0x0000fffff7f848f8:	00000000	udf	#0
   0x0000fffff7f848fc:	00000000	udf	#0
   0x0000fffff7f84900:	00000000	udf	#0
   0x0000fffff7f84904:	00000000	udf	#0
   0x0000fffff7f84908:	00000000	udf	#0
   0x0000fffff7f8490c:	00000000	udf	#0
   0x0000fffff7f84910:	00000000	udf	#0
   0x0000fffff7f84914:	00000000	udf	#0
   0x0000fffff7f84918:	00000000	udf	#0
   0x0000fffff7f8491c:	00000000	udf	#0
   0x0000fffff7f84920:	00000000	udf	#0
   0x0000fffff7f84924:	00000000	udf	#0
   0x0000fffff7f84928:	00000000	udf	#0
   0x0000fffff7f8492c:	00000000	udf	#0
   0x0000fffff7f84930:	00000000	udf	#0
   0x0000fffff7f84934:	00000000	udf	#0
   0x0000fffff7f84938:	00000000	udf	#0
   0x0000fffff7f8493c:	00000000	udf	#0
   0x0000fffff7f84940:	00000000	udf	#0
   0x0000fffff7f84944:	00000000	udf	#0
   0x0000fffff7f84948:	00000000	udf	#0
   0x0000fffff7f8494c:	00000000	udf	#0
   0x0000fffff7f84950:	00000000	udf	#0
   0x0000fffff7f84954:	00000000	udf	#0
   0x0000fffff7f84958:	00000000	udf	#0
   0x0000fffff7f8495c:	00000000	udf	#0
   0x0000fffff7f84960:	00000000	udf	#0
   0x0000fffff7f84964:	00000000	udf	#0
   0x0000fffff7f84968:	00000000	udf	#0
   0x0000fffff7f8496c:	00000000	udf	#0
   0x0000fffff7f84970:	00000000	udf	#0
   0x0000fffff7f84974:	00000000	udf	#0
   0x0000fffff7f84978:	00000000	udf	#0
   0x0000fffff7f8497c:	00000000	udf	#0
   0x0000fffff7f84980:	00000000	udf	#0
   0x0000fffff7f84984:	00000000	udf	#0
   0x0000fffff7f84988:	00000000	udf	#0
   0x0000fffff7f8498c:	00000000	udf	#0
   0x0000fffff7f84990:	00000000	udf	#0
   0x0000fffff7f84994:	00000000	udf	#0
   0x0000fffff7f84998:	00000000	udf	#0
   0x0000fffff7f8499c:	00000000	udf	#0
   0x0000fffff7f849a0:	00000000	udf	#0
   0x0000fffff7f849a4:	00000000	udf	#0
   0x0000fffff7f849a8:	00000000	udf	#0
   0x0000fffff7f849ac:	00000000	udf	#0
   0x0000fffff7f849b0:	00000000	udf	#0
   0x0000fffff7f849b4:	00000000	udf	#0
   0x0000fffff7f849b8:	00000000	udf	#0
   0x0000fffff7f849bc:	00000000	udf	#0
   0x0000fffff7f849c0:	00000000	udf	#0
   0x0000fffff7f849c4:	00000000	udf	#0
   0x0000fffff7f849c8:	00000000	udf	#0
   0x0000fffff7f849cc:	00000000	udf	#0
   0x0000fffff7f849d0:	00000000	udf	#0
   0x0000fffff7f849d4:	00000000	udf	#0
   0x0000fffff7f849d8:	00000000	udf	#0
   0x0000fffff7f849dc:	00000000	udf	#0
   0x0000fffff7f849e0:	00000000	udf	#0
   0x0000fffff7f849e4:	00000000	udf	#0
   0x0000fffff7f849e8:	00000000	udf	#0
   0x0000fffff7f849ec:	00000000	udf	#0
   0x0000fffff7f849f0:	00000000	udf	#0
   0x0000fffff7f849f4:	00000000	udf	#0
   0x0000fffff7f849f8:	00000000	udf	#0
   0x0000fffff7f849fc:	00000000	udf	#0
   0x0000fffff7f84a00:	00000000	udf	#0
   0x0000fffff7f84a04:	00000000	udf	#0
   0x0000fffff7f84a08:	00000000	udf	#0
   0x0000fffff7f84a0c:	00000000	udf	#0
   0x0000fffff7f84a10:	00000000	udf	#0
   0x0000fffff7f84a14:	00000000	udf	#0
   0x0000fffff7f84a18:	00000000	udf	#0
   0x0000fffff7f84a1c:	00000000	udf	#0
   0x0000fffff7f84a20:	00000000	udf	#0
   0x0000fffff7f84a24:	00000000	udf	#0
   0x0000fffff7f84a28:	00000000	udf	#0
   0x0000fffff7f84a2c:	00000000	udf	#0
   0x0000fffff7f84a30:	00000000	udf	#0
   0x0000fffff7f84a34:	00000000	udf	#0
   0x0000fffff7f84a38:	00000000	udf	#0
   0x0000fffff7f84a3c:	00000000	udf	#0
   0x0000fffff7f84a40:	00000000	udf	#0
   0x0000fffff7f84a44:	00000000	udf	#0
   0x0000fffff7f84a48:	00000000	udf	#0
   0x0000fffff7f84a4c:	00000000	udf	#0
   0x0000fffff7f84a50:	00000000	udf	#0
   0x0000fffff7f84a54:	00000000	udf	#0
   0x0000fffff7f84a58:	00000000	udf	#0
   0x0000fffff7f84a5c:	00000000	udf	#0
   0x0000fffff7f84a60:	00000000	udf	#0
   0x0000fffff7f84a64:	00000000	udf	#0
   0x0000fffff7f84a68:	00000000	udf	#0
   0x0000fffff7f84a6c:	00000000	udf	#0
   0x0000fffff7f84a70:	00000000	udf	#0
   0x0000fffff7f84a74:	00000000	udf	#0
   0x0000fffff7f84a78:	00000000	udf	#0
   0x0000fffff7f84a7c:	00000000	udf	#0
   0x0000fffff7f84a80:	00000000	udf	#0
   0x0000fffff7f84a84:	00000000	udf	#0
   0x0000fffff7f84a88:	00000000	udf	#0
   0x0000fffff7f84a8c:	00000000	udf	#0
   0x0000fffff7f84a90:	00000000	udf	#0
   0x0000fffff7f84a94:	00000000	udf	#0
   0x0000fffff7f84a98:	00000000	udf	#0
   0x0000fffff7f84a9c:	00000000	udf	#0
   0x0000fffff7f84aa0:	00000000	udf	#0
   0x0000fffff7f84aa4:	00000000	udf	#0
   0x0000fffff7f84aa8:	00000000	udf	#0
   0x0000fffff7f84aac:	00000000	udf	#0
   0x0000fffff7f84ab0:	00000000	udf	#0
   0x0000fffff7f84ab4:	00000000	udf	#0
   0x0000fffff7f84ab8:	00000000	udf	#0
   0x0000fffff7f84abc:	00000000	udf	#0
   0x0000fffff7f84ac0:	00000000	udf	#0
   0x0000fffff7f84ac4:	00000000	udf	#0
   0x0000fffff7f84ac8:	00000000	udf	#0
   0x0000fffff7f84acc:	00000000	udf	#0
   0x0000fffff7f84ad0:	00000000	udf	#0
   0x0000fffff7f84ad4:	00000000	udf	#0
   0x0000fffff7f84ad8:	00000000	udf	#0
   0x0000fffff7f84adc:	00000000	udf	#0
   0x0000fffff7f84ae0:	00000000	udf	#0
   0x0000fffff7f84ae4:	00000000	udf	#0
   0x0000fffff7f84ae8:	00000000	udf	#0
   0x0000fffff7f84aec:	00000000	udf	#0
   0x0000fffff7f84af0:	00000000	udf	#0
   0x0000fffff7f84af4:	00000000	udf	#0
   0x0000fffff7f84af8:	00000000	udf	#0
   0x0000fffff7f84afc:	00000000	udf	#0
   0x0000fffff7f84b00:	00000000	udf	#0
   0x0000fffff7f84b04:	00000000	udf	#0
   0x0000fffff7f84b08:	00000000	udf	#0
   0x0000fffff7f84b0c:	00000000	udf	#0
   0x0000fffff7f84b10:	00000000	udf	#0
   0x0000fffff7f84b14:	00000000	udf	#0
   0x0000fffff7f84b18:	00000000	udf	#0
   0x0000fffff7f84b1c:	00000000	udf	#0
   0x0000fffff7f84b20:	00000000	udf	#0
   0x0000fffff7f84b24:	00000000	udf	#0
   0x0000fffff7f84b28:	00000000	udf	#0
   0x0000fffff7f84b2c:	00000000	udf	#0
   0x0000fffff7f84b30:	00000000	udf	#0
   0x0000fffff7f84b34:	00000000	udf	#0
   0x0000fffff7f84b38:	00000000	udf	#0
   0x0000fffff7f84b3c:	00000000	udf	#0
   0x0000fffff7f84b40:	00000000	udf	#0
   0x0000fffff7f84b44:	00000000	udf	#0
   0x0000fffff7f84b48:	00000000	udf	#0
   0x0000fffff7f84b4c:	00000000	udf	#0
   0x0000fffff7f84b50:	00000000	udf	#0
   0x0000fffff7f84b54:	00000000	udf	#0
   0x0000fffff7f84b58:	00000000	udf	#0
   0x0000fffff7f84b5c:	00000000	udf	#0
   0x0000fffff7f84b60:	00000000	udf	#0
   0x0000fffff7f84b64:	00000000	udf	#0
   0x0000fffff7f84b68:	00000000	udf	#0
   0x0000fffff7f84b6c:	00000000	udf	#0
   0x0000fffff7f84b70:	00000000	udf	#0
   0x0000fffff7f84b74:	00000000	udf	#0
   0x0000fffff7f84b78:	00000000	udf	#0
   0x0000fffff7f84b7c:	00000000	udf	#0
   0x0000fffff7f84b80:	00000000	udf	#0
   0x0000fffff7f84b84:	00000000	udf	#0
   0x0000fffff7f84b88:	00000000	udf	#0
   0x0000fffff7f84b8c:	00000000	udf	#0
   0x0000fffff7f84b90:	00000000	udf	#0
   0x0000fffff7f84b94:	00000000	udf	#0
   0x0000fffff7f84b98:	00000000	udf	#0
   0x0000fffff7f84b9c:	00000000	udf	#0
   0x0000fffff7f84ba0:	00000000	udf	#0
   0x0000fffff7f84ba4:	00000000	udf	#0
   0x0000fffff7f84ba8:	00000000	udf	#0
   0x0000fffff7f84bac:	00000000	udf	#0
   0x0000fffff7f84bb0:	00000000	udf	#0
   0x0000fffff7f84bb4:	00000000	udf	#0
   0x0000fffff7f84bb8:	00000000	udf	#0
   0x0000fffff7f84bbc:	00000000	udf	#0
   0x0000fffff7f84bc0:	00000000	udf	#0
   0x0000fffff7f84bc4:	00000000	udf	#0
   0x0000fffff7f84bc8:	00000000	udf	#0
   0x0000fffff7f84bcc:	00000000	udf	#0
   0x0000fffff7f84bd0:	00000000	udf	#0
   0x0000fffff7f84bd4:	00000000	udf	#0
   0x0000fffff7f84bd8:	00000000	udf	#0
   0x0000fffff7f84bdc:	00000000	udf	#0
   0x0000fffff7f84be0:	00000000	udf	#0
   0x0000fffff7f84be4:	00000000	udf	#0
   0x0000fffff7f84be8:	00000000	udf	#0
   0x0000fffff7f84bec:	00000000	udf	#0
   0x0000fffff7f84bf0:	00000000	udf	#0
   0x0000fffff7f84bf4:	00000000	udf	#0
   0x0000fffff7f84bf8:	00000000	udf	#0
   0x0000fffff7f84bfc:	00000000	udf	#0
   0x0000fffff7f84c00:	00000000	udf	#0
   0x0000fffff7f84c04:	00000000	udf	#0
   0x0000fffff7f84c08:	00000000	udf	#0
   0x0000fffff7f84c0c:	00000000	udf	#0
   0x0000fffff7f84c10:	00000000	udf	#0
   0x0000fffff7f84c14:	00000000	udf	#0
   0x0000fffff7f84c18:	00000000	udf	#0
   0x0000fffff7f84c1c:	00000000	udf	#0
   0x0000fffff7f84c20:	00000000	udf	#0
   0x0000fffff7f84c24:	00000000	udf	#0
   0x0000fffff7f84c28:	00000000	udf	#0
   0x0000fffff7f84c2c:	00000000	udf	#0
   0x0000fffff7f84c30:	00000000	udf	#0
   0x0000fffff7f84c34:	00000000	udf	#0
   0x0000fffff7f84c38:	00000000	udf	#0
   0x0000fffff7f84c3c:	00000000	udf	#0
   0x0000fffff7f84c40:	00000000	udf	#0
   0x0000fffff7f84c44:	00000000	udf	#0
   0x0000fffff7f84c48:	00000000	udf	#0
   0x0000fffff7f84c4c:	00000000	udf	#0
   0x0000fffff7f84c50:	00000000	udf	#0
   0x0000fffff7f84c54:	00000000	udf	#0
   0x0000fffff7f84c58:	00000000	udf	#0
   0x0000fffff7f84c5c:	00000000	udf	#0
   0x0000fffff7f84c60:	00000000	udf	#0
   0x0000fffff7f84c64:	00000000	udf	#0
   0x0000fffff7f84c68:	00000000	udf	#0
   0x0000fffff7f84c6c:	00000000	udf	#0
   0x0000fffff7f84c70:	00000000	udf	#0
   0x0000fffff7f84c74:	00000000	udf	#0
   0x0000fffff7f84c78:	00000000	udf	#0
   0x0000fffff7f84c7c:	00000000	udf	#0
   0x0000fffff7f84c80:	00000000	udf	#0
   0x0000fffff7f84c84:	00000000	udf	#0
   0x0000fffff7f84c88:	00000000	udf	#0
   0x0000fffff7f84c8c:	00000000	udf	#0
   0x0000fffff7f84c90:	00000000	udf	#0
   0x0000fffff7f84c94:	00000000	udf	#0
   0x0000fffff7f84c98:	00000000	udf	#0
   0x0000fffff7f84c9c:	00000000	udf	#0
   0x0000fffff7f84ca0:	00000000	udf	#0
   0x0000fffff7f84ca4:	00000000	udf	#0
   0x0000fffff7f84ca8:	00000000	udf	#0
   0x0000fffff7f84cac:	00000000	udf	#0
   0x0000fffff7f84cb0:	00000000	udf	#0
   0x0000fffff7f84cb4:	00000000	udf	#0
   0x0000fffff7f84cb8:	00000000	udf	#0
   0x0000fffff7f84cbc:	00000000	udf	#0
   0x0000fffff7f84cc0:	00000000	udf	#0
   0x0000fffff7f84cc4:	00000000	udf	#0
   0x0000fffff7f84cc8:	00000000	udf	#0
   0x0000fffff7f84ccc:	00000000	udf	#0
   0x0000fffff7f84cd0:	00000000	udf	#0
   0x0000fffff7f84cd4:	00000000	udf	#0
   0x0000fffff7f84cd8:	00000000	udf	#0
   0x0000fffff7f84cdc:	00000000	udf	#0
   0x0000fffff7f84ce0:	00000000	udf	#0
   0x0000fffff7f84ce4:	00000000	udf	#0
   0x0000fffff7f84ce8:	00000000	udf	#0
   0x0000fffff7f84cec:	00000000	udf	#0
   0x0000fffff7f84cf0:	00000000	udf	#0
   0x0000fffff7f84cf4:	00000000	udf	#0
   0x0000fffff7f84cf8:	00000000	udf	#0
   0x0000fffff7f84cfc:	00000000	udf	#0
   0x0000fffff7f84d00:	00000000	udf	#0
   0x0000fffff7f84d04:	00000000	udf	#0
   0x0000fffff7f84d08:	00000000	udf	#0
   0x0000fffff7f84d0c:	00000000	udf	#0
   0x0000fffff7f84d10:	00000000	udf	#0
   0x0000fffff7f84d14:	00000000	udf	#0
   0x0000fffff7f84d18:	00000000	udf	#0
   0x0000fffff7f84d1c:	00000000	udf	#0
   0x0000fffff7f84d20:	00000000	udf	#0
   0x0000fffff7f84d24:	00000000	udf	#0
   0x0000fffff7f84d28:	00000000	udf	#0
   0x0000fffff7f84d2c:	00000000	udf	#0
   0x0000fffff7f84d30:	00000000	udf	#0
   0x0000fffff7f84d34:	00000000	udf	#0
   0x0000fffff7f84d38:	00000000	udf	#0
   0x0000fffff7f84d3c:	00000000	udf	#0
   0x0000fffff7f84d40:	00000000	udf	#0
   0x0000fffff7f84d44:	00000000	udf	#0
   0x0000fffff7f84d48:	00000000	udf	#0
   0x0000fffff7f84d4c:	00000000	udf	#0
   0x0000fffff7f84d50:	00000000	udf	#0
   0x0000fffff7f84d54:	00000000	udf	#0
   0x0000fffff7f84d58:	00000000	udf	#0
   0x0000fffff7f84d5c:	00000000	udf	#0
   0x0000fffff7f84d60:	00000000	udf	#0
   0x0000fffff7f84d64:	00000000	udf	#0
   0x0000fffff7f84d68:	00000000	udf	#0
   0x0000fffff7f84d6c:	00000000	udf	#0
   0x0000fffff7f84d70:	00000000	udf	#0
   0x0000fffff7f84d74:	00000000	udf	#0
   0x0000fffff7f84d78:	00000000	udf	#0
   0x0000fffff7f84d7c:	00000000	udf	#0
   0x0000fffff7f84d80:	00000000	udf	#0
   0x0000fffff7f84d84:	00000000	udf	#0
   0x0000fffff7f84d88:	00000000	udf	#0
   0x0000fffff7f84d8c:	00000000	udf	#0
   0x0000fffff7f84d90:	00000000	udf	#0
   0x0000fffff7f84d94:	00000000	udf	#0
   0x0000fffff7f84d98:	00000000	udf	#0
   0x0000fffff7f84d9c:	00000000	udf	#0
   0x0000fffff7f84da0:	00000000	udf	#0
   0x0000fffff7f84da4:	00000000	udf	#0
   0x0000fffff7f84da8:	00000000	udf	#0
   0x0000fffff7f84dac:	00000000	udf	#0
   0x0000fffff7f84db0:	00000000	udf	#0
   0x0000fffff7f84db4:	00000000	udf	#0
   0x0000fffff7f84db8:	00000000	udf	#0
   0x0000fffff7f84dbc:	00000000	udf	#0
   0x0000fffff7f84dc0:	00000000	udf	#0
   0x0000fffff7f84dc4:	00000000	udf	#0
   0x0000fffff7f84dc8:	00000000	udf	#0
   0x0000fffff7f84dcc:	00000000	udf	#0
   0x0000fffff7f84dd0:	00000000	udf	#0
   0x0000fffff7f84dd4:	00000000	udf	#0
   0x0000fffff7f84dd8:	00000000	udf	#0
   0x0000fffff7f84ddc:	00000000	udf	#0
   0x0000fffff7f84de0:	00000000	udf	#0
   0x0000fffff7f84de4:	00000000	udf	#0
   0x0000fffff7f84de8:	00000000	udf	#0
   0x0000fffff7f84dec:	00000000	udf	#0
   0x0000fffff7f84df0:	00000000	udf	#0
   0x0000fffff7f84df4:	00000000	udf	#0
   0x0000fffff7f84df8:	00000000	udf	#0
   0x0000fffff7f84dfc:	00000000	udf	#0
   0x0000fffff7f84e00:	00000000	udf	#0
   0x0000fffff7f84e04:	00000000	udf	#0
   0x0000fffff7f84e08:	00000000	udf	#0
   0x0000fffff7f84e0c:	00000000	udf	#0
   0x0000fffff7f84e10:	00000000	udf	#0
   0x0000fffff7f84e14:	00000000	udf	#0
   0x0000fffff7f84e18:	00000000	udf	#0
   0x0000fffff7f84e1c:	00000000	udf	#0
   0x0000fffff7f84e20:	00000000	udf	#0
   0x0000fffff7f84e24:	00000000	udf	#0
   0x0000fffff7f84e28:	00000000	udf	#0
   0x0000fffff7f84e2c:	00000000	udf	#0
   0x0000fffff7f84e30:	00000000	udf	#0
   0x0000fffff7f84e34:	00000000	udf	#0
   0x0000fffff7f84e38:	00000000	udf	#0
   0x0000fffff7f84e3c:	00000000	udf	#0
   0x0000fffff7f84e40:	00000000	udf	#0
   0x0000fffff7f84e44:	00000000	udf	#0
   0x0000fffff7f84e48:	00000000	udf	#0
   0x0000fffff7f84e4c:	00000000	udf	#0
   0x0000fffff7f84e50:	00000000	udf	#0
   0x0000fffff7f84e54:	00000000	udf	#0
   0x0000fffff7f84e58:	00000000	udf	#0
   0x0000fffff7f84e5c:	00000000	udf	#0
   0x0000fffff7f84e60:	00000000	udf	#0
   0x0000fffff7f84e64:	00000000	udf	#0
   0x0000fffff7f84e68:	00000000	udf	#0
   0x0000fffff7f84e6c:	00000000	udf	#0
   0x0000fffff7f84e70:	00000000	udf	#0
   0x0000fffff7f84e74:	00000000	udf	#0
   0x0000fffff7f84e78:	00000000	udf	#0
   0x0000fffff7f84e7c:	00000000	udf	#0
   0x0000fffff7f84e80:	00000000	udf	#0
   0x0000fffff7f84e84:	00000000	udf	#0
   0x0000fffff7f84e88:	00000000	udf	#0
   0x0000fffff7f84e8c:	00000000	udf	#0
   0x0000fffff7f84e90:	00000000	udf	#0
   0x0000fffff7f84e94:	00000000	udf	#0
   0x0000fffff7f84e98:	00000000	udf	#0
   0x0000fffff7f84e9c:	00000000	udf	#0
   0x0000fffff7f84ea0:	00000000	udf	#0
   0x0000fffff7f84ea4:	00000000	udf	#0
   0x0000fffff7f84ea8:	00000000	udf	#0
   0x0000fffff7f84eac:	00000000	udf	#0
   0x0000fffff7f84eb0:	00000000	udf	#0
   0x0000fffff7f84eb4:	00000000	udf	#0
   0x0000fffff7f84eb8:	00000000	udf	#0
   0x0000fffff7f84ebc:	00000000	udf	#0
   0x0000fffff7f84ec0:	00000000	udf	#0
   0x0000fffff7f84ec4:	00000000	udf	#0
   0x0000fffff7f84ec8:	00000000	udf	#0
   0x0000fffff7f84ecc:	00000000	udf	#0
   0x0000fffff7f84ed0:	00000000	udf	#0
   0x0000fffff7f84ed4:	00000000	udf	#0
   0x0000fffff7f84ed8:	00000000	udf	#0
   0x0000fffff7f84edc:	00000000	udf	#0
   0x0000fffff7f84ee0:	00000000	udf	#0
   0x0000fffff7f84ee4:	00000000	udf	#0
   0x0000fffff7f84ee8:	00000000	udf	#0
   0x0000fffff7f84eec:	00000000	udf	#0
   0x0000fffff7f84ef0:	00000000	udf	#0
   0x0000fffff7f84ef4:	00000000	udf	#0
   0x0000fffff7f84ef8:	00000000	udf	#0
   0x0000fffff7f84efc:	00000000	udf	#0
   0x0000fffff7f84f00:	00000000	udf	#0
   0x0000fffff7f84f04:	00000000	udf	#0
   0x0000fffff7f84f08:	00000000	udf	#0
   0x0000fffff7f84f0c:	00000000	udf	#0
   0x0000fffff7f84f10:	00000000	udf	#0
   0x0000fffff7f84f14:	00000000	udf	#0
   0x0000fffff7f84f18:	00000000	udf	#0
   0x0000fffff7f84f1c:	00000000	udf	#0
   0x0000fffff7f84f20:	00000000	udf	#0
   0x0000fffff7f84f24:	00000000	udf	#0
   0x0000fffff7f84f28:	00000000	udf	#0
   0x0000fffff7f84f2c:	00000000	udf	#0
   0x0000fffff7f84f30:	00000000	udf	#0
   0x0000fffff7f84f34:	00000000	udf	#0
   0x0000fffff7f84f38:	00000000	udf	#0
   0x0000fffff7f84f3c:	00000000	udf	#0
   0x0000fffff7f84f40:	00000000	udf	#0
   0x0000fffff7f84f44:	00000000	udf	#0
   0x0000fffff7f84f48:	00000000	udf	#0
   0x0000fffff7f84f4c:	00000000	udf	#0
   0x0000fffff7f84f50:	00000000	udf	#0
   0x0000fffff7f84f54:	00000000	udf	#0
   0x0000fffff7f84f58:	00000000	udf	#0
   0x0000fffff7f84f5c:	00000000	udf	#0
   0x0000fffff7f84f60:	00000000	udf	#0
   0x0000fffff7f84f64:	00000000	udf	#0
   0x0000fffff7f84f68:	00000000	udf	#0
   0x0000fffff7f84f6c:	00000000	udf	#0
   0x0000fffff7f84f70:	00000000	udf	#0
   0x0000fffff7f84f74:	00000000	udf	#0
   0x0000fffff7f84f78:	00000000	udf	#0
   0x0000fffff7f84f7c:	00000000	udf	#0
   0x0000fffff7f84f80:	00000000	udf	#0
   0x0000fffff7f84f84:	00000000	udf	#0
   0x0000fffff7f84f88:	00000000	udf	#0
   0x0000fffff7f84f8c:	00000000	udf	#0
   0x0000fffff7f84f90:	00000000	udf	#0
   0x0000fffff7f84f94:	00000000	udf	#0
   0x0000fffff7f84f98:	00000000	udf	#0
   0x0000fffff7f84f9c:	00000000	udf	#0
   0x0000fffff7f84fa0:	00000000	udf	#0
   0x0000fffff7f84fa4:	00000000	udf	#0
   0x0000fffff7f84fa8:	00000000	udf	#0
   0x0000fffff7f84fac:	00000000	udf	#0
   0x0000fffff7f84fb0:	00000000	udf	#0
   0x0000fffff7f84fb4:	00000000	udf	#0
   0x0000fffff7f84fb8:	00000000	udf	#0
   0x0000fffff7f84fbc:	00000000	udf	#0
   0x0000fffff7f84fc0:	00000000	udf	#0
   0x0000fffff7f84fc4:	00000000	udf	#0
   0x0000fffff7f84fc8:	00000000	udf	#0
   0x0000fffff7f84fcc:	00000000	udf	#0
   0x0000fffff7f84fd0:	00000000	udf	#0
   0x0000fffff7f84fd4:	00000000	udf	#0
   0x0000fffff7f84fd8:	00000000	udf	#0
   0x0000fffff7f84fdc:	00000000	udf	#0
   0x0000fffff7f84fe0:	00000000	udf	#0
   0x0000fffff7f84fe4:	00000000	udf	#0
   0x0000fffff7f84fe8:	00000000	udf	#0
   0x0000fffff7f84fec:	00000000	udf	#0
   0x0000fffff7f84ff0:	00000000	udf	#0
   0x0000fffff7f84ff4:	00000000	udf	#0
   0x0000fffff7f84ff8:	00000000	udf	#0
   0x0000fffff7f84ffc:	00000000	udf	#0
End of assembler dump.
