
/tmp/sqgi-v21-native-profile/floats/638430-1.bin:     file format binary


Disassembly of section .data:

0000ffff9c6d5000 <.data>:
    ffff9c6d5000:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    ffff9c6d5004:	910003fd 	mov	x29, sp
    ffff9c6d5008:	a9bf53f3 	stp	x19, x20, [sp, #-16]!
    ffff9c6d500c:	a9bf5bf5 	stp	x21, x22, [sp, #-16]!
    ffff9c6d5010:	d13003ff 	sub	sp, sp, #0xc00
    ffff9c6d5014:	aa0003f3 	mov	x19, x0
    ffff9c6d5018:	aa0103f4 	mov	x20, x1
    ffff9c6d501c:	aa0203f5 	mov	x21, x2
    ffff9c6d5020:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d5024:	912063e1 	add	x1, sp, #0x818
    ffff9c6d5028:	d2856c02 	mov	x2, #0x2b60                	// #11104
    ffff9c6d502c:	f2ba7742 	movk	x2, #0xd3ba, lsl #16
    ffff9c6d5030:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6d5034:	d2910410 	mov	x16, #0x8820                	// #34848
    ffff9c6d5038:	f2ba2290 	movk	x16, #0xd114, lsl #16
    ffff9c6d503c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d5040:	d63f0200 	blr	x16
    ffff9c6d5044:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d5048:	f90403e9 	str	x9, [sp, #2048]
    ffff9c6d504c:	f9401ea9 	ldr	x9, [x21, #56]
    ffff9c6d5050:	d285da0a 	mov	x10, #0x2ed0                	// #11984
    ffff9c6d5054:	f2ba778a 	movk	x10, #0xd3bc, lsl #16
    ffff9c6d5058:	f2d5554a 	movk	x10, #0xaaaa, lsl #32
    ffff9c6d505c:	eb0a013f 	cmp	x9, x10
    ffff9c6d5060:	54001381 	b.ne	0xffff9c6d52d0  // b.any
    ffff9c6d5064:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d5068:	aa1303e1 	mov	x1, x19
    ffff9c6d506c:	d2800042 	mov	x2, #0x2                   	// #2
    ffff9c6d5070:	d2822610 	mov	x16, #0x1130                	// #4400
    ffff9c6d5074:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d5078:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d507c:	d63f0200 	blr	x16
    ffff9c6d5080:	f100001f 	cmp	x0, #0x0
    ffff9c6d5084:	54001260 	b.eq	0xffff9c6d52d0  // b.none
    ffff9c6d5088:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d508c:	aa1303e1 	mov	x1, x19
    ffff9c6d5090:	d2800062 	mov	x2, #0x3                   	// #3
    ffff9c6d5094:	d2822610 	mov	x16, #0x1130                	// #4400
    ffff9c6d5098:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d509c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d50a0:	d63f0200 	blr	x16
    ffff9c6d50a4:	f100001f 	cmp	x0, #0x0
    ffff9c6d50a8:	54001140 	b.eq	0xffff9c6d52d0  // b.none
    ffff9c6d50ac:	b9401269 	ldr	w9, [x19, #16]
    ffff9c6d50b0:	5280004a 	mov	w10, #0x2                   	// #2
    ffff9c6d50b4:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6d50b8:	eb0a013f 	cmp	x9, x10
    ffff9c6d50bc:	540010a1 	b.ne	0xffff9c6d52d0  // b.any
    ffff9c6d50c0:	f9400e69 	ldr	x9, [x19, #24]
    ffff9c6d50c4:	f90007e9 	str	x9, [sp, #8]
    ffff9c6d50c8:	b9402269 	ldr	w9, [x19, #32]
    ffff9c6d50cc:	5280008a 	mov	w10, #0x4                   	// #4
    ffff9c6d50d0:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6d50d4:	eb0a013f 	cmp	x9, x10
    ffff9c6d50d8:	54000fc1 	b.ne	0xffff9c6d52d0  // b.any
    ffff9c6d50dc:	fd401660 	ldr	d0, [x19, #40]
    ffff9c6d50e0:	fd000be0 	str	d0, [sp, #16]
    ffff9c6d50e4:	b9403269 	ldr	w9, [x19, #48]
    ffff9c6d50e8:	5280004a 	mov	w10, #0x2                   	// #2
    ffff9c6d50ec:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6d50f0:	eb0a013f 	cmp	x9, x10
    ffff9c6d50f4:	54000ee1 	b.ne	0xffff9c6d52d0  // b.any
    ffff9c6d50f8:	f9401e69 	ldr	x9, [x19, #56]
    ffff9c6d50fc:	f9000fe9 	str	x9, [sp, #24]
    ffff9c6d5100:	1400007f 	b	0xffff9c6d52fc
    ffff9c6d5104:	f9400fe9 	ldr	x9, [sp, #24]
    ffff9c6d5108:	f94007ea 	ldr	x10, [sp, #8]
    ffff9c6d510c:	eb0a013f 	cmp	x9, x10
    ffff9c6d5110:	540007aa 	b.ge	0xffff9c6d5204  // b.tcont
    ffff9c6d5114:	d2800029 	mov	x9, #0x1                   	// #1
    ffff9c6d5118:	f90403e9 	str	x9, [sp, #2048]
    ffff9c6d511c:	14000011 	b	0xffff9c6d5160
    ffff9c6d5120:	d2800001 	mov	x1, #0x0                   	// #0
    ffff9c6d5124:	d2899e02 	mov	x2, #0x4cf0                	// #19696
    ffff9c6d5128:	f2ba77a2 	movk	x2, #0xd3bd, lsl #16
    ffff9c6d512c:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6d5130:	d2826803 	mov	x3, #0x1340                	// #4928
    ffff9c6d5134:	f2ba79e3 	movk	x3, #0xd3cf, lsl #16
    ffff9c6d5138:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff9c6d513c:	d285dd04 	mov	x4, #0x2ee8                	// #12008
    ffff9c6d5140:	f2ba7784 	movk	x4, #0xd3bc, lsl #16
    ffff9c6d5144:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff9c6d5148:	d28cc810 	mov	x16, #0x6640                	// #26176
    ffff9c6d514c:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d5150:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d5154:	d63f0200 	blr	x16
    ffff9c6d5158:	f100001f 	cmp	x0, #0x0
    ffff9c6d515c:	54000ba0 	b.eq	0xffff9c6d52d0  // b.none
    ffff9c6d5160:	f9400be9 	ldr	x9, [sp, #16]
    ffff9c6d5164:	f9001be9 	str	x9, [sp, #48]
    ffff9c6d5168:	d28002e9 	mov	x9, #0x17                  	// #23
    ffff9c6d516c:	f9001fe9 	str	x9, [sp, #56]
    ffff9c6d5170:	f9400fe9 	ldr	x9, [sp, #24]
    ffff9c6d5174:	d28002ea 	mov	x10, #0x17                  	// #23
    ffff9c6d5178:	9aca0d2b 	sdiv	x11, x9, x10
    ffff9c6d517c:	9b0aa569 	msub	x9, x11, x10, x9
    ffff9c6d5180:	f9001fe9 	str	x9, [sp, #56]
    ffff9c6d5184:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d5188:	f2e7fd89 	movk	x9, #0x3fec, lsl #48
    ffff9c6d518c:	f90023e9 	str	x9, [sp, #64]
    ffff9c6d5190:	fd401be0 	ldr	d0, [sp, #48]
    ffff9c6d5194:	fd4023e1 	ldr	d1, [sp, #64]
    ffff9c6d5198:	1e610800 	fmul	d0, d0, d1
    ffff9c6d519c:	fd0027e0 	str	d0, [sp, #72]
    ffff9c6d51a0:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d51a4:	f2e7fe09 	movk	x9, #0x3ff0, lsl #48
    ffff9c6d51a8:	f9002be9 	str	x9, [sp, #80]
    ffff9c6d51ac:	fd402be0 	ldr	d0, [sp, #80]
    ffff9c6d51b0:	fd4023e1 	ldr	d1, [sp, #64]
    ffff9c6d51b4:	1e613800 	fsub	d0, d0, d1
    ffff9c6d51b8:	fd002be0 	str	d0, [sp, #80]
    ffff9c6d51bc:	f9401fe9 	ldr	x9, [sp, #56]
    ffff9c6d51c0:	9e620120 	scvtf	d0, x9
    ffff9c6d51c4:	fd402be1 	ldr	d1, [sp, #80]
    ffff9c6d51c8:	1e610800 	fmul	d0, d0, d1
    ffff9c6d51cc:	fd002be0 	str	d0, [sp, #80]
    ffff9c6d51d0:	fd4027e0 	ldr	d0, [sp, #72]
    ffff9c6d51d4:	fd402be1 	ldr	d1, [sp, #80]
    ffff9c6d51d8:	1e612800 	fadd	d0, d0, d1
    ffff9c6d51dc:	fd0027e0 	str	d0, [sp, #72]
    ffff9c6d51e0:	f94027e9 	ldr	x9, [sp, #72]
    ffff9c6d51e4:	f90013e9 	str	x9, [sp, #32]
    ffff9c6d51e8:	f94013e9 	ldr	x9, [sp, #32]
    ffff9c6d51ec:	f9000be9 	str	x9, [sp, #16]
    ffff9c6d51f0:	f9400fe9 	ldr	x9, [sp, #24]
    ffff9c6d51f4:	f90013e9 	str	x9, [sp, #32]
    ffff9c6d51f8:	91000529 	add	x9, x9, #0x1
    ffff9c6d51fc:	f9000fe9 	str	x9, [sp, #24]
    ffff9c6d5200:	17ffffc1 	b	0xffff9c6d5104
    ffff9c6d5204:	f94403e9 	ldr	x9, [sp, #2048]
    ffff9c6d5208:	f100013f 	cmp	x9, #0x0
    ffff9c6d520c:	54000480 	b.eq	0xffff9c6d529c  // b.none
    ffff9c6d5210:	aa1303e0 	mov	x0, x19
    ffff9c6d5214:	d2800041 	mov	x1, #0x2                   	// #2
    ffff9c6d5218:	910043e2 	add	x2, sp, #0x10
    ffff9c6d521c:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d5220:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d5224:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d5228:	d63f0200 	blr	x16
    ffff9c6d522c:	aa1303e0 	mov	x0, x19
    ffff9c6d5230:	d2800061 	mov	x1, #0x3                   	// #3
    ffff9c6d5234:	f9400fe2 	ldr	x2, [sp, #24]
    ffff9c6d5238:	d282ae10 	mov	x16, #0x1570                	// #5488
    ffff9c6d523c:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d5240:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d5244:	d63f0200 	blr	x16
    ffff9c6d5248:	aa1303e0 	mov	x0, x19
    ffff9c6d524c:	d2800081 	mov	x1, #0x4                   	// #4
    ffff9c6d5250:	f94013e2 	ldr	x2, [sp, #32]
    ffff9c6d5254:	d282ae10 	mov	x16, #0x1570                	// #5488
    ffff9c6d5258:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d525c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d5260:	d63f0200 	blr	x16
    ffff9c6d5264:	aa1303e0 	mov	x0, x19
    ffff9c6d5268:	d28000c1 	mov	x1, #0x6                   	// #6
    ffff9c6d526c:	9100c3e2 	add	x2, sp, #0x30
    ffff9c6d5270:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d5274:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d5278:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d527c:	d63f0200 	blr	x16
    ffff9c6d5280:	aa1303e0 	mov	x0, x19
    ffff9c6d5284:	d28000e1 	mov	x1, #0x7                   	// #7
    ffff9c6d5288:	f9401fe2 	ldr	x2, [sp, #56]
    ffff9c6d528c:	d282ae10 	mov	x16, #0x1570                	// #5488
    ffff9c6d5290:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d5294:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d5298:	d63f0200 	blr	x16
    ffff9c6d529c:	d2800189 	mov	x9, #0xc                   	// #12
    ffff9c6d52a0:	f9000289 	str	x9, [x20]
    ffff9c6d52a4:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d52a8:	d2827e10 	mov	x16, #0x13f0                	// #5104
    ffff9c6d52ac:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d52b0:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d52b4:	d63f0200 	blr	x16
    ffff9c6d52b8:	913003ff 	add	sp, sp, #0xc00
    ffff9c6d52bc:	a8c15bf5 	ldp	x21, x22, [sp], #16
    ffff9c6d52c0:	a8c153f3 	ldp	x19, x20, [sp], #16
    ffff9c6d52c4:	a8c17bfd 	ldp	x29, x30, [sp], #16
    ffff9c6d52c8:	d2800020 	mov	x0, #0x1                   	// #1
    ffff9c6d52cc:	d65f03c0 	ret
    ffff9c6d52d0:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d52d4:	d2828010 	mov	x16, #0x1400                	// #5120
    ffff9c6d52d8:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d52dc:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d52e0:	d63f0200 	blr	x16
    ffff9c6d52e4:	913003ff 	add	sp, sp, #0xc00
    ffff9c6d52e8:	a8c15bf5 	ldp	x21, x22, [sp], #16
    ffff9c6d52ec:	a8c153f3 	ldp	x19, x20, [sp], #16
    ffff9c6d52f0:	a8c17bfd 	ldp	x29, x30, [sp], #16
    ffff9c6d52f4:	d2800000 	mov	x0, #0x0                   	// #0
    ffff9c6d52f8:	d65f03c0 	ret
    ffff9c6d52fc:	aa1303e0 	mov	x0, x19
    ffff9c6d5300:	d2800001 	mov	x1, #0x0                   	// #0
    ffff9c6d5304:	d2899e02 	mov	x2, #0x4cf0                	// #19696
    ffff9c6d5308:	f2ba77a2 	movk	x2, #0xd3bd, lsl #16
    ffff9c6d530c:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6d5310:	d2826803 	mov	x3, #0x1340                	// #4928
    ffff9c6d5314:	f2ba79e3 	movk	x3, #0xd3cf, lsl #16
    ffff9c6d5318:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff9c6d531c:	d285dd04 	mov	x4, #0x2ee8                	// #12008
    ffff9c6d5320:	f2ba7784 	movk	x4, #0xd3bc, lsl #16
    ffff9c6d5324:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff9c6d5328:	d28cc810 	mov	x16, #0x6640                	// #26176
    ffff9c6d532c:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d5330:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d5334:	d63f0200 	blr	x16
    ffff9c6d5338:	f100001f 	cmp	x0, #0x0
    ffff9c6d533c:	54fffca0 	b.eq	0xffff9c6d52d0  // b.none
    ffff9c6d5340:	17ffff71 	b	0xffff9c6d5104
