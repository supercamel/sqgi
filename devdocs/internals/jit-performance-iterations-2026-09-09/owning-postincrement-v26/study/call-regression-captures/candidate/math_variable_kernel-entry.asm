Dump of assembler code from 0xfffff7d2d000 to 0xfffff7d2e000:
   0x0000fffff7d2d000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7d2d004:	910003fd	mov	x29, sp
   0x0000fffff7d2d008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7d2d00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7d2d010:	d13003ff	sub	sp, sp, #0xc00
   0x0000fffff7d2d014:	aa0003f3	mov	x19, x0
   0x0000fffff7d2d018:	aa0103f4	mov	x20, x1
   0x0000fffff7d2d01c:	aa0203f5	mov	x21, x2
   0x0000fffff7d2d020:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2d024:	912043e1	add	x1, sp, #0x810
   0x0000fffff7d2d028:	d2996c02	mov	x2, #0xcb60                	// #52064
   0x0000fffff7d2d02c:	f2b557a2	movk	x2, #0xaabd, lsl #16
   0x0000fffff7d2d030:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2d034:	d28d0c10	mov	x16, #0x6860                	// #26720
   0x0000fffff7d2d038:	f2b55650	movk	x16, #0xaab2, lsl #16
   0x0000fffff7d2d03c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d040:	d63f0200	blr	x16
   0x0000fffff7d2d044:	f9401ea9	ldr	x9, [x21, #56]
   0x0000fffff7d2d048:	d299da0a	mov	x10, #0xced0                	// #52944
   0x0000fffff7d2d04c:	f2b557ea	movk	x10, #0xaabf, lsl #16
   0x0000fffff7d2d050:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7d2d054:	eb0a013f	cmp	x9, x10
   0x0000fffff7d2d058:	540058e1	b.ne	0xfffff7d2db74  // b.any
   0x0000fffff7d2d05c:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7d2d060:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d2d064:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d2d068:	eb0a013f	cmp	x9, x10
   0x0000fffff7d2d06c:	54005841	b.ne	0xfffff7d2db74  // b.any
   0x0000fffff7d2d070:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7d2d074:	f90007e9	str	x9, [sp, #8]
   0x0000fffff7d2d078:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2d07c:	f9000be9	str	x9, [sp, #16]
   0x0000fffff7d2d080:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7d2d084:	36d801c9	tbz	w9, #27, 0xfffff7d2d0bc
   0x0000fffff7d2d088:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2d08c:	f9400be3	ldr	x3, [sp, #16]
   0x0000fffff7d2d090:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2d094:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2d098:	aa1303e1	mov	x1, x19
   0x0000fffff7d2d09c:	d2800042	mov	x2, #0x2                   	// #2
   0x0000fffff7d2d0a0:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2d0a4:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7d2d0a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2d0ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d0b0:	d63f0200	blr	x16
   0x0000fffff7d2d0b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d0b8:	540055e0	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d0bc:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2d0c0:	f9000fe9	str	x9, [sp, #24]
   0x0000fffff7d2d0c4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7d2d0c8:	36d801c9	tbz	w9, #27, 0xfffff7d2d100
   0x0000fffff7d2d0cc:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2d0d0:	f9400fe3	ldr	x3, [sp, #24]
   0x0000fffff7d2d0d4:	d2800044	mov	x4, #0x2                   	// #2
   0x0000fffff7d2d0d8:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2d0dc:	aa1303e1	mov	x1, x19
   0x0000fffff7d2d0e0:	d2800062	mov	x2, #0x3                   	// #3
   0x0000fffff7d2d0e4:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2d0e8:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7d2d0ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2d0f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d0f4:	d63f0200	blr	x16
   0x0000fffff7d2d0f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d0fc:	540053c0	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d100:	f9400fe9	ldr	x9, [sp, #24]
   0x0000fffff7d2d104:	f94007ea	ldr	x10, [sp, #8]
   0x0000fffff7d2d108:	eb0a013f	cmp	x9, x10
   0x0000fffff7d2d10c:	5400510a	b.ge	0xfffff7d2db2c  // b.tcont
   0x0000fffff7d2d110:	d2800c29	mov	x9, #0x61                  	// #97
   0x0000fffff7d2d114:	f90013e9	str	x9, [sp, #32]
   0x0000fffff7d2d118:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d2d11c:	36d801c9	tbz	w9, #27, 0xfffff7d2d154
   0x0000fffff7d2d120:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2d124:	f94013e3	ldr	x3, [sp, #32]
   0x0000fffff7d2d128:	d2800044	mov	x4, #0x2                   	// #2
   0x0000fffff7d2d12c:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2d130:	aa1303e1	mov	x1, x19
   0x0000fffff7d2d134:	d2800082	mov	x2, #0x4                   	// #4
   0x0000fffff7d2d138:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2d13c:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7d2d140:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2d144:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d148:	d63f0200	blr	x16
   0x0000fffff7d2d14c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d150:	54005120	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d154:	f9400fe9	ldr	x9, [sp, #24]
   0x0000fffff7d2d158:	d2800c2a	mov	x10, #0x61                  	// #97
   0x0000fffff7d2d15c:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7d2d160:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7d2d164:	f90013e9	str	x9, [sp, #32]
   0x0000fffff7d2d168:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7d2d16c:	f90017e9	str	x9, [sp, #40]
   0x0000fffff7d2d170:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2d174:	36d801c9	tbz	w9, #27, 0xfffff7d2d1ac
   0x0000fffff7d2d178:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2d17c:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2d180:	d2800044	mov	x4, #0x2                   	// #2
   0x0000fffff7d2d184:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2d188:	aa1303e1	mov	x1, x19
   0x0000fffff7d2d18c:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2d190:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2d194:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7d2d198:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2d19c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d1a0:	d63f0200	blr	x16
   0x0000fffff7d2d1a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d1a8:	54004e60	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d1ac:	f94013e9	ldr	x9, [sp, #32]
   0x0000fffff7d2d1b0:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7d2d1b4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d2d1b8:	f90013e9	str	x9, [sp, #32]
   0x0000fffff7d2d1bc:	f94013e9	ldr	x9, [sp, #32]
   0x0000fffff7d2d1c0:	f90017e9	str	x9, [sp, #40]
   0x0000fffff7d2d1c4:	aa1503e0	mov	x0, x21
   0x0000fffff7d2d1c8:	d2962901	mov	x1, #0xb148                	// #45384
   0x0000fffff7d2d1cc:	f2b55821	movk	x1, #0xaac1, lsl #16
   0x0000fffff7d2d1d0:	f2d55541	movk	x1, #0xaaaa, lsl #32
   0x0000fffff7d2d1d4:	d291f210	mov	x16, #0x8f90                	// #36752
   0x0000fffff7d2d1d8:	f2b55650	movk	x16, #0xaab2, lsl #16
   0x0000fffff7d2d1dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d1e0:	d63f0200	blr	x16
   0x0000fffff7d2d1e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d1e8:	54004c60	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d1ec:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2d1f0:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7d2d1f4:	f2a1000a	movk	x10, #0x800, lsl #16
   0x0000fffff7d2d1f8:	8a0a0129	and	x9, x9, x10
   0x0000fffff7d2d1fc:	f100013f	cmp	x9, #0x0
   0x0000fffff7d2d200:	54004ba1	b.ne	0xfffff7d2db74  // b.any
   0x0000fffff7d2d204:	f94017e0	ldr	x0, [sp, #40]
   0x0000fffff7d2d208:	910083e1	add	x1, sp, #0x20
   0x0000fffff7d2d20c:	d2919a10	mov	x16, #0x8cd0                	// #36048
   0x0000fffff7d2d210:	f2b55650	movk	x16, #0xaab2, lsl #16
   0x0000fffff7d2d214:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d218:	d63f0200	blr	x16
   0x0000fffff7d2d21c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d220:	54004aa0	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d224:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d2d228:	36d801c9	tbz	w9, #27, 0xfffff7d2d260
   0x0000fffff7d2d22c:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2d230:	f94013e3	ldr	x3, [sp, #32]
   0x0000fffff7d2d234:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2d238:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2d23c:	aa1303e1	mov	x1, x19
   0x0000fffff7d2d240:	d2800082	mov	x2, #0x4                   	// #4
   0x0000fffff7d2d244:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2d248:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7d2d24c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2d250:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d254:	d63f0200	blr	x16
   0x0000fffff7d2d258:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d25c:	540048c0	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d260:	d2828f69	mov	x9, #0x147b                	// #5243
   0x0000fffff7d2d264:	f2a8f5c9	movk	x9, #0x47ae, lsl #16
   0x0000fffff7d2d268:	f2cf5c29	movk	x9, #0x7ae1, lsl #32
   0x0000fffff7d2d26c:	f2e7f089	movk	x9, #0x3f84, lsl #48
   0x0000fffff7d2d270:	f90017e9	str	x9, [sp, #40]
   0x0000fffff7d2d274:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2d278:	36d801c9	tbz	w9, #27, 0xfffff7d2d2b0
   0x0000fffff7d2d27c:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2d280:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2d284:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2d288:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2d28c:	aa1303e1	mov	x1, x19
   0x0000fffff7d2d290:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2d294:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2d298:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7d2d29c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2d2a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d2a4:	d63f0200	blr	x16
   0x0000fffff7d2d2a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d2ac:	54004640	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d2b0:	fd4013e0	ldr	d0, [sp, #32]
   0x0000fffff7d2d2b4:	fd4017e1	ldr	d1, [sp, #40]
   0x0000fffff7d2d2b8:	1e610800	fmul	d0, d0, d1
   0x0000fffff7d2d2bc:	fd0013e0	str	d0, [sp, #32]
   0x0000fffff7d2d2c0:	aa1303e0	mov	x0, x19
   0x0000fffff7d2d2c4:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2d2c8:	d2962d02	mov	x2, #0xb168                	// #45416
   0x0000fffff7d2d2cc:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7d2d2d0:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2d2d4:	d2945603	mov	x3, #0xa2b0                	// #41648
   0x0000fffff7d2d2d8:	f2b55a63	movk	x3, #0xaad3, lsl #16
   0x0000fffff7d2d2dc:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2d2e0:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2d2e4:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7d2d2e8:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2d2ec:	d28bda10	mov	x16, #0x5ed0                	// #24272
   0x0000fffff7d2d2f0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2d2f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d2f8:	d63f0200	blr	x16
   0x0000fffff7d2d2fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d300:	540043a0	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d304:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d2d308:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7d2d30c:	f2a1000a	movk	x10, #0x800, lsl #16
   0x0000fffff7d2d310:	8a0a0129	and	x9, x9, x10
   0x0000fffff7d2d314:	f100013f	cmp	x9, #0x0
   0x0000fffff7d2d318:	540042e1	b.ne	0xfffff7d2db74  // b.any
   0x0000fffff7d2d31c:	f94013e9	ldr	x9, [sp, #32]
   0x0000fffff7d2d320:	f9001fe9	str	x9, [sp, #56]
   0x0000fffff7d2d324:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d2d328:	36d801c9	tbz	w9, #27, 0xfffff7d2d360
   0x0000fffff7d2d32c:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2d330:	f9401fe3	ldr	x3, [sp, #56]
   0x0000fffff7d2d334:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2d338:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2d33c:	aa1303e1	mov	x1, x19
   0x0000fffff7d2d340:	d28000e2	mov	x2, #0x7                   	// #7
   0x0000fffff7d2d344:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2d348:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7d2d34c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2d350:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d354:	d63f0200	blr	x16
   0x0000fffff7d2d358:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d35c:	540040c0	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d360:	fd401fe0	ldr	d0, [sp, #56]
   0x0000fffff7d2d364:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2d368:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2d36c:	d291d610	mov	x16, #0x8eb0                	// #36528
   0x0000fffff7d2d370:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2d374:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d378:	d63f0200	blr	x16
   0x0000fffff7d2d37c:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2d380:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2d384:	36d801c9	tbz	w9, #27, 0xfffff7d2d3bc
   0x0000fffff7d2d388:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2d38c:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2d390:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2d394:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2d398:	aa1303e1	mov	x1, x19
   0x0000fffff7d2d39c:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2d3a0:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2d3a4:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7d2d3a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2d3ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d3b0:	d63f0200	blr	x16
   0x0000fffff7d2d3b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d3b8:	54003de0	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d3bc:	aa1303e0	mov	x0, x19
   0x0000fffff7d2d3c0:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2d3c4:	d2962f02	mov	x2, #0xb178                	// #45432
   0x0000fffff7d2d3c8:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7d2d3cc:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2d3d0:	d2960403	mov	x3, #0xb020                	// #45088
   0x0000fffff7d2d3d4:	f2b55a63	movk	x3, #0xaad3, lsl #16
   0x0000fffff7d2d3d8:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2d3dc:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2d3e0:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7d2d3e4:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2d3e8:	d28bda10	mov	x16, #0x5ed0                	// #24272
   0x0000fffff7d2d3ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2d3f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d3f4:	d63f0200	blr	x16
   0x0000fffff7d2d3f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d3fc:	54003bc0	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d400:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d2d404:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7d2d408:	f2a1000a	movk	x10, #0x800, lsl #16
   0x0000fffff7d2d40c:	8a0a0129	and	x9, x9, x10
   0x0000fffff7d2d410:	f100013f	cmp	x9, #0x0
   0x0000fffff7d2d414:	54003b01	b.ne	0xfffff7d2db74  // b.any
   0x0000fffff7d2d418:	f94013e9	ldr	x9, [sp, #32]
   0x0000fffff7d2d41c:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2d420:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2d424:	36d801c9	tbz	w9, #27, 0xfffff7d2d45c
   0x0000fffff7d2d428:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2d42c:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2d430:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2d434:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2d438:	aa1303e1	mov	x1, x19
   0x0000fffff7d2d43c:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2d440:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2d444:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7d2d448:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2d44c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d450:	d63f0200	blr	x16
   0x0000fffff7d2d454:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d458:	540038e0	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d45c:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2d460:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2d464:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2d468:	d291c610	mov	x16, #0x8e30                	// #36400
   0x0000fffff7d2d46c:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2d470:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d474:	d63f0200	blr	x16
   0x0000fffff7d2d478:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7d2d47c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d2d480:	36d801c9	tbz	w9, #27, 0xfffff7d2d4b8
   0x0000fffff7d2d484:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2d488:	f9401be3	ldr	x3, [sp, #48]
   0x0000fffff7d2d48c:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2d490:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2d494:	aa1303e1	mov	x1, x19
   0x0000fffff7d2d498:	d28000c2	mov	x2, #0x6                   	// #6
   0x0000fffff7d2d49c:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2d4a0:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7d2d4a4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2d4a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d4ac:	d63f0200	blr	x16
   0x0000fffff7d2d4b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d4b4:	54003600	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d4b8:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7d2d4bc:	fd401be1	ldr	d1, [sp, #48]
   0x0000fffff7d2d4c0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2d4c4:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2d4c8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2d4cc:	36d801c9	tbz	w9, #27, 0xfffff7d2d504
   0x0000fffff7d2d4d0:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2d4d4:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2d4d8:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2d4dc:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2d4e0:	aa1303e1	mov	x1, x19
   0x0000fffff7d2d4e4:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2d4e8:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2d4ec:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7d2d4f0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2d4f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d4f8:	d63f0200	blr	x16
   0x0000fffff7d2d4fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d500:	540033a0	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d504:	aa1303e0	mov	x0, x19
   0x0000fffff7d2d508:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2d50c:	d2963102	mov	x2, #0xb188                	// #45448
   0x0000fffff7d2d510:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7d2d514:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2d518:	d297d003	mov	x3, #0xbe80                	// #48768
   0x0000fffff7d2d51c:	f2b55a63	movk	x3, #0xaad3, lsl #16
   0x0000fffff7d2d520:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2d524:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2d528:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7d2d52c:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2d530:	d28bda10	mov	x16, #0x5ed0                	// #24272
   0x0000fffff7d2d534:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2d538:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d53c:	d63f0200	blr	x16
   0x0000fffff7d2d540:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d544:	54003180	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d548:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d2d54c:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7d2d550:	f2a1000a	movk	x10, #0x800, lsl #16
   0x0000fffff7d2d554:	8a0a0129	and	x9, x9, x10
   0x0000fffff7d2d558:	f100013f	cmp	x9, #0x0
   0x0000fffff7d2d55c:	540030c1	b.ne	0xfffff7d2db74  // b.any
   0x0000fffff7d2d560:	f94013e9	ldr	x9, [sp, #32]
   0x0000fffff7d2d564:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2d568:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2d56c:	36d801c9	tbz	w9, #27, 0xfffff7d2d5a4
   0x0000fffff7d2d570:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2d574:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2d578:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2d57c:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2d580:	aa1303e1	mov	x1, x19
   0x0000fffff7d2d584:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2d588:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2d58c:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7d2d590:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2d594:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d598:	d63f0200	blr	x16
   0x0000fffff7d2d59c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d5a0:	54002ea0	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d5a4:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2d5a8:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2d5ac:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2d5b0:	d291b610	mov	x16, #0x8db0                	// #36272
   0x0000fffff7d2d5b4:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2d5b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d5bc:	d63f0200	blr	x16
   0x0000fffff7d2d5c0:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7d2d5c4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d2d5c8:	36d801c9	tbz	w9, #27, 0xfffff7d2d600
   0x0000fffff7d2d5cc:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2d5d0:	f9401be3	ldr	x3, [sp, #48]
   0x0000fffff7d2d5d4:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2d5d8:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2d5dc:	aa1303e1	mov	x1, x19
   0x0000fffff7d2d5e0:	d28000c2	mov	x2, #0x6                   	// #6
   0x0000fffff7d2d5e4:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2d5e8:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7d2d5ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2d5f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d5f4:	d63f0200	blr	x16
   0x0000fffff7d2d5f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d5fc:	54002bc0	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d600:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7d2d604:	fd401be1	ldr	d1, [sp, #48]
   0x0000fffff7d2d608:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2d60c:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2d610:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2d614:	36d801c9	tbz	w9, #27, 0xfffff7d2d64c
   0x0000fffff7d2d618:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2d61c:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2d620:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2d624:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2d628:	aa1303e1	mov	x1, x19
   0x0000fffff7d2d62c:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2d630:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2d634:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7d2d638:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2d63c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d640:	d63f0200	blr	x16
   0x0000fffff7d2d644:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d648:	54002960	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d64c:	aa1303e0	mov	x0, x19
   0x0000fffff7d2d650:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2d654:	d2963302	mov	x2, #0xb198                	// #45464
   0x0000fffff7d2d658:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7d2d65c:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2d660:	d2995a03	mov	x3, #0xcad0                	// #51920
   0x0000fffff7d2d664:	f2b55a63	movk	x3, #0xaad3, lsl #16
   0x0000fffff7d2d668:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2d66c:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2d670:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7d2d674:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2d678:	d28bda10	mov	x16, #0x5ed0                	// #24272
   0x0000fffff7d2d67c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2d680:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d684:	d63f0200	blr	x16
   0x0000fffff7d2d688:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d68c:	54002740	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d690:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d2d694:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7d2d698:	f2a1000a	movk	x10, #0x800, lsl #16
   0x0000fffff7d2d69c:	8a0a0129	and	x9, x9, x10
   0x0000fffff7d2d6a0:	f100013f	cmp	x9, #0x0
   0x0000fffff7d2d6a4:	54002681	b.ne	0xfffff7d2db74  // b.any
   0x0000fffff7d2d6a8:	f94013e9	ldr	x9, [sp, #32]
   0x0000fffff7d2d6ac:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2d6b0:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2d6b4:	36d801c9	tbz	w9, #27, 0xfffff7d2d6ec
   0x0000fffff7d2d6b8:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2d6bc:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2d6c0:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2d6c4:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2d6c8:	aa1303e1	mov	x1, x19
   0x0000fffff7d2d6cc:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2d6d0:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2d6d4:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7d2d6d8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2d6dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d6e0:	d63f0200	blr	x16
   0x0000fffff7d2d6e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d6e8:	54002460	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d6ec:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2d6f0:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2d6f4:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2d6f8:	d2918610	mov	x16, #0x8c30                	// #35888
   0x0000fffff7d2d6fc:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2d700:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d704:	d63f0200	blr	x16
   0x0000fffff7d2d708:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7d2d70c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d2d710:	36d801c9	tbz	w9, #27, 0xfffff7d2d748
   0x0000fffff7d2d714:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2d718:	f9401be3	ldr	x3, [sp, #48]
   0x0000fffff7d2d71c:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2d720:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2d724:	aa1303e1	mov	x1, x19
   0x0000fffff7d2d728:	d28000c2	mov	x2, #0x6                   	// #6
   0x0000fffff7d2d72c:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2d730:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7d2d734:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2d738:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d73c:	d63f0200	blr	x16
   0x0000fffff7d2d740:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d744:	54002180	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d748:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7d2d74c:	fd401be1	ldr	d1, [sp, #48]
   0x0000fffff7d2d750:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2d754:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2d758:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2d75c:	36d801c9	tbz	w9, #27, 0xfffff7d2d794
   0x0000fffff7d2d760:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2d764:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2d768:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2d76c:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2d770:	aa1303e1	mov	x1, x19
   0x0000fffff7d2d774:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2d778:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2d77c:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7d2d780:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2d784:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d788:	d63f0200	blr	x16
   0x0000fffff7d2d78c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d790:	54001f20	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d794:	aa1303e0	mov	x0, x19
   0x0000fffff7d2d798:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2d79c:	d2963502	mov	x2, #0xb1a8                	// #45480
   0x0000fffff7d2d7a0:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7d2d7a4:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2d7a8:	d287ca03	mov	x3, #0x3e50                	// #15952
   0x0000fffff7d2d7ac:	f2b55a83	movk	x3, #0xaad4, lsl #16
   0x0000fffff7d2d7b0:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2d7b4:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2d7b8:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7d2d7bc:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2d7c0:	d28bda10	mov	x16, #0x5ed0                	// #24272
   0x0000fffff7d2d7c4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2d7c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d7cc:	d63f0200	blr	x16
   0x0000fffff7d2d7d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d7d4:	54001d00	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d7d8:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d2d7dc:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7d2d7e0:	f2a1000a	movk	x10, #0x800, lsl #16
   0x0000fffff7d2d7e4:	8a0a0129	and	x9, x9, x10
   0x0000fffff7d2d7e8:	f100013f	cmp	x9, #0x0
   0x0000fffff7d2d7ec:	54001c41	b.ne	0xfffff7d2db74  // b.any
   0x0000fffff7d2d7f0:	f94013e9	ldr	x9, [sp, #32]
   0x0000fffff7d2d7f4:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2d7f8:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2d7fc:	36d801c9	tbz	w9, #27, 0xfffff7d2d834
   0x0000fffff7d2d800:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2d804:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2d808:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2d80c:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2d810:	aa1303e1	mov	x1, x19
   0x0000fffff7d2d814:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2d818:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2d81c:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7d2d820:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2d824:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d828:	d63f0200	blr	x16
   0x0000fffff7d2d82c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d830:	54001a20	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d834:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2d838:	f2e7fd09	movk	x9, #0x3fe8, lsl #48
   0x0000fffff7d2d83c:	f90027e9	str	x9, [sp, #72]
   0x0000fffff7d2d840:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d2d844:	36d801c9	tbz	w9, #27, 0xfffff7d2d87c
   0x0000fffff7d2d848:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2d84c:	f94027e3	ldr	x3, [sp, #72]
   0x0000fffff7d2d850:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2d854:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2d858:	aa1303e1	mov	x1, x19
   0x0000fffff7d2d85c:	d2800122	mov	x2, #0x9                   	// #9
   0x0000fffff7d2d860:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2d864:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7d2d868:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2d86c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d870:	d63f0200	blr	x16
   0x0000fffff7d2d874:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d878:	540017e0	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d87c:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2d880:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2d884:	fd4027e0	ldr	d0, [sp, #72]
   0x0000fffff7d2d888:	fd0407e0	str	d0, [sp, #2056]
   0x0000fffff7d2d88c:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2d890:	fd4407e1	ldr	d1, [sp, #2056]
   0x0000fffff7d2d894:	d2911010	mov	x16, #0x8880                	// #34944
   0x0000fffff7d2d898:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2d89c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d8a0:	d63f0200	blr	x16
   0x0000fffff7d2d8a4:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7d2d8a8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d2d8ac:	36d801c9	tbz	w9, #27, 0xfffff7d2d8e4
   0x0000fffff7d2d8b0:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2d8b4:	f9401be3	ldr	x3, [sp, #48]
   0x0000fffff7d2d8b8:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2d8bc:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2d8c0:	aa1303e1	mov	x1, x19
   0x0000fffff7d2d8c4:	d28000c2	mov	x2, #0x6                   	// #6
   0x0000fffff7d2d8c8:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2d8cc:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7d2d8d0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2d8d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d8d8:	d63f0200	blr	x16
   0x0000fffff7d2d8dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d8e0:	540014a0	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d8e4:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7d2d8e8:	fd401be1	ldr	d1, [sp, #48]
   0x0000fffff7d2d8ec:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2d8f0:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2d8f4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2d8f8:	36d801c9	tbz	w9, #27, 0xfffff7d2d930
   0x0000fffff7d2d8fc:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2d900:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2d904:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2d908:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2d90c:	aa1303e1	mov	x1, x19
   0x0000fffff7d2d910:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2d914:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2d918:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7d2d91c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2d920:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d924:	d63f0200	blr	x16
   0x0000fffff7d2d928:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d92c:	54001240	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d930:	aa1303e0	mov	x0, x19
   0x0000fffff7d2d934:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2d938:	d2963902	mov	x2, #0xb1c8                	// #45512
   0x0000fffff7d2d93c:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7d2d940:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2d944:	d2969e03	mov	x3, #0xb4f0                	// #46320
   0x0000fffff7d2d948:	f2b557e3	movk	x3, #0xaabf, lsl #16
   0x0000fffff7d2d94c:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2d950:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2d954:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7d2d958:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2d95c:	d28bda10	mov	x16, #0x5ed0                	// #24272
   0x0000fffff7d2d960:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2d964:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d968:	d63f0200	blr	x16
   0x0000fffff7d2d96c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d970:	54001020	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d974:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d2d978:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7d2d97c:	f2a1000a	movk	x10, #0x800, lsl #16
   0x0000fffff7d2d980:	8a0a0129	and	x9, x9, x10
   0x0000fffff7d2d984:	f100013f	cmp	x9, #0x0
   0x0000fffff7d2d988:	54000f61	b.ne	0xfffff7d2db74  // b.any
   0x0000fffff7d2d98c:	f94013e9	ldr	x9, [sp, #32]
   0x0000fffff7d2d990:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2d994:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2d998:	36d801c9	tbz	w9, #27, 0xfffff7d2d9d0
   0x0000fffff7d2d99c:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2d9a0:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2d9a4:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2d9a8:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2d9ac:	aa1303e1	mov	x1, x19
   0x0000fffff7d2d9b0:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2d9b4:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2d9b8:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7d2d9bc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2d9c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2d9c4:	d63f0200	blr	x16
   0x0000fffff7d2d9c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2d9cc:	54000d40	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2d9d0:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2d9d4:	f2e7fe49	movk	x9, #0x3ff2, lsl #48
   0x0000fffff7d2d9d8:	f90027e9	str	x9, [sp, #72]
   0x0000fffff7d2d9dc:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d2d9e0:	36d801c9	tbz	w9, #27, 0xfffff7d2da18
   0x0000fffff7d2d9e4:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2d9e8:	f94027e3	ldr	x3, [sp, #72]
   0x0000fffff7d2d9ec:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2d9f0:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2d9f4:	aa1303e1	mov	x1, x19
   0x0000fffff7d2d9f8:	d2800122	mov	x2, #0x9                   	// #9
   0x0000fffff7d2d9fc:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2da00:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7d2da04:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2da08:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2da0c:	d63f0200	blr	x16
   0x0000fffff7d2da10:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2da14:	54000b00	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2da18:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2da1c:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2da20:	fd4027e0	ldr	d0, [sp, #72]
   0x0000fffff7d2da24:	fd0407e0	str	d0, [sp, #2056]
   0x0000fffff7d2da28:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2da2c:	fd4407e1	ldr	d1, [sp, #2056]
   0x0000fffff7d2da30:	d290ee10	mov	x16, #0x8770                	// #34672
   0x0000fffff7d2da34:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2da38:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2da3c:	d63f0200	blr	x16
   0x0000fffff7d2da40:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7d2da44:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d2da48:	36d801c9	tbz	w9, #27, 0xfffff7d2da80
   0x0000fffff7d2da4c:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2da50:	f9401be3	ldr	x3, [sp, #48]
   0x0000fffff7d2da54:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2da58:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2da5c:	aa1303e1	mov	x1, x19
   0x0000fffff7d2da60:	d28000c2	mov	x2, #0x6                   	// #6
   0x0000fffff7d2da64:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2da68:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7d2da6c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2da70:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2da74:	d63f0200	blr	x16
   0x0000fffff7d2da78:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2da7c:	540007c0	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2da80:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7d2da84:	fd401be1	ldr	d1, [sp, #48]
   0x0000fffff7d2da88:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2da8c:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2da90:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2da94:	36d801c9	tbz	w9, #27, 0xfffff7d2dacc
   0x0000fffff7d2da98:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2da9c:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2daa0:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2daa4:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2daa8:	aa1303e1	mov	x1, x19
   0x0000fffff7d2daac:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2dab0:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2dab4:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7d2dab8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2dabc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2dac0:	d63f0200	blr	x16
   0x0000fffff7d2dac4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2dac8:	54000560	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2dacc:	fd400be0	ldr	d0, [sp, #16]
   0x0000fffff7d2dad0:	fd4017e1	ldr	d1, [sp, #40]
   0x0000fffff7d2dad4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2dad8:	fd000be0	str	d0, [sp, #16]
   0x0000fffff7d2dadc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7d2dae0:	36d801c9	tbz	w9, #27, 0xfffff7d2db18
   0x0000fffff7d2dae4:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2dae8:	f9400be3	ldr	x3, [sp, #16]
   0x0000fffff7d2daec:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2daf0:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2daf4:	aa1303e1	mov	x1, x19
   0x0000fffff7d2daf8:	d2800042	mov	x2, #0x2                   	// #2
   0x0000fffff7d2dafc:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2db00:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7d2db04:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2db08:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2db0c:	d63f0200	blr	x16
   0x0000fffff7d2db10:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2db14:	54000300	b.eq	0xfffff7d2db74  // b.none
   0x0000fffff7d2db18:	f9400fe9	ldr	x9, [sp, #24]
   0x0000fffff7d2db1c:	f90013e9	str	x9, [sp, #32]
   0x0000fffff7d2db20:	91000529	add	x9, x9, #0x1
   0x0000fffff7d2db24:	f9000fe9	str	x9, [sp, #24]
   0x0000fffff7d2db28:	17fffd76	b	0xfffff7d2d100
   0x0000fffff7d2db2c:	52800089	mov	w9, #0x4                   	// #4
   0x0000fffff7d2db30:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7d2db34:	b9000289	str	w9, [x20]
   0x0000fffff7d2db38:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7d2db3c:	f900068a	str	x10, [x20, #8]
   0x0000fffff7d2db40:	fd400be0	ldr	d0, [sp, #16]
   0x0000fffff7d2db44:	fd000680	str	d0, [x20, #8]
   0x0000fffff7d2db48:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2db4c:	d280a610	mov	x16, #0x530                 	// #1328
   0x0000fffff7d2db50:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2db54:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2db58:	d63f0200	blr	x16
   0x0000fffff7d2db5c:	913003ff	add	sp, sp, #0xc00
   0x0000fffff7d2db60:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7d2db64:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7d2db68:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7d2db6c:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7d2db70:	d65f03c0	ret
   0x0000fffff7d2db74:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2db78:	d280a810	mov	x16, #0x540                 	// #1344
   0x0000fffff7d2db7c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2db80:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2db84:	d63f0200	blr	x16
   0x0000fffff7d2db88:	913003ff	add	sp, sp, #0xc00
   0x0000fffff7d2db8c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7d2db90:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7d2db94:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7d2db98:	d2800000	mov	x0, #0x0                   	// #0
   0x0000fffff7d2db9c:	d65f03c0	ret
   0x0000fffff7d2dba0:	00000000	udf	#0
   0x0000fffff7d2dba4:	00000000	udf	#0
   0x0000fffff7d2dba8:	00000000	udf	#0
   0x0000fffff7d2dbac:	00000000	udf	#0
   0x0000fffff7d2dbb0:	00000000	udf	#0
   0x0000fffff7d2dbb4:	00000000	udf	#0
   0x0000fffff7d2dbb8:	00000000	udf	#0
   0x0000fffff7d2dbbc:	00000000	udf	#0
   0x0000fffff7d2dbc0:	00000000	udf	#0
   0x0000fffff7d2dbc4:	00000000	udf	#0
   0x0000fffff7d2dbc8:	00000000	udf	#0
   0x0000fffff7d2dbcc:	00000000	udf	#0
   0x0000fffff7d2dbd0:	00000000	udf	#0
   0x0000fffff7d2dbd4:	00000000	udf	#0
   0x0000fffff7d2dbd8:	00000000	udf	#0
   0x0000fffff7d2dbdc:	00000000	udf	#0
   0x0000fffff7d2dbe0:	00000000	udf	#0
   0x0000fffff7d2dbe4:	00000000	udf	#0
   0x0000fffff7d2dbe8:	00000000	udf	#0
   0x0000fffff7d2dbec:	00000000	udf	#0
   0x0000fffff7d2dbf0:	00000000	udf	#0
   0x0000fffff7d2dbf4:	00000000	udf	#0
   0x0000fffff7d2dbf8:	00000000	udf	#0
   0x0000fffff7d2dbfc:	00000000	udf	#0
   0x0000fffff7d2dc00:	00000000	udf	#0
   0x0000fffff7d2dc04:	00000000	udf	#0
   0x0000fffff7d2dc08:	00000000	udf	#0
   0x0000fffff7d2dc0c:	00000000	udf	#0
   0x0000fffff7d2dc10:	00000000	udf	#0
   0x0000fffff7d2dc14:	00000000	udf	#0
   0x0000fffff7d2dc18:	00000000	udf	#0
   0x0000fffff7d2dc1c:	00000000	udf	#0
   0x0000fffff7d2dc20:	00000000	udf	#0
   0x0000fffff7d2dc24:	00000000	udf	#0
   0x0000fffff7d2dc28:	00000000	udf	#0
   0x0000fffff7d2dc2c:	00000000	udf	#0
   0x0000fffff7d2dc30:	00000000	udf	#0
   0x0000fffff7d2dc34:	00000000	udf	#0
   0x0000fffff7d2dc38:	00000000	udf	#0
   0x0000fffff7d2dc3c:	00000000	udf	#0
   0x0000fffff7d2dc40:	00000000	udf	#0
   0x0000fffff7d2dc44:	00000000	udf	#0
   0x0000fffff7d2dc48:	00000000	udf	#0
   0x0000fffff7d2dc4c:	00000000	udf	#0
   0x0000fffff7d2dc50:	00000000	udf	#0
   0x0000fffff7d2dc54:	00000000	udf	#0
   0x0000fffff7d2dc58:	00000000	udf	#0
   0x0000fffff7d2dc5c:	00000000	udf	#0
   0x0000fffff7d2dc60:	00000000	udf	#0
   0x0000fffff7d2dc64:	00000000	udf	#0
   0x0000fffff7d2dc68:	00000000	udf	#0
   0x0000fffff7d2dc6c:	00000000	udf	#0
   0x0000fffff7d2dc70:	00000000	udf	#0
   0x0000fffff7d2dc74:	00000000	udf	#0
   0x0000fffff7d2dc78:	00000000	udf	#0
   0x0000fffff7d2dc7c:	00000000	udf	#0
   0x0000fffff7d2dc80:	00000000	udf	#0
   0x0000fffff7d2dc84:	00000000	udf	#0
   0x0000fffff7d2dc88:	00000000	udf	#0
   0x0000fffff7d2dc8c:	00000000	udf	#0
   0x0000fffff7d2dc90:	00000000	udf	#0
   0x0000fffff7d2dc94:	00000000	udf	#0
   0x0000fffff7d2dc98:	00000000	udf	#0
   0x0000fffff7d2dc9c:	00000000	udf	#0
   0x0000fffff7d2dca0:	00000000	udf	#0
   0x0000fffff7d2dca4:	00000000	udf	#0
   0x0000fffff7d2dca8:	00000000	udf	#0
   0x0000fffff7d2dcac:	00000000	udf	#0
   0x0000fffff7d2dcb0:	00000000	udf	#0
   0x0000fffff7d2dcb4:	00000000	udf	#0
   0x0000fffff7d2dcb8:	00000000	udf	#0
   0x0000fffff7d2dcbc:	00000000	udf	#0
   0x0000fffff7d2dcc0:	00000000	udf	#0
   0x0000fffff7d2dcc4:	00000000	udf	#0
   0x0000fffff7d2dcc8:	00000000	udf	#0
   0x0000fffff7d2dccc:	00000000	udf	#0
   0x0000fffff7d2dcd0:	00000000	udf	#0
   0x0000fffff7d2dcd4:	00000000	udf	#0
   0x0000fffff7d2dcd8:	00000000	udf	#0
   0x0000fffff7d2dcdc:	00000000	udf	#0
   0x0000fffff7d2dce0:	00000000	udf	#0
   0x0000fffff7d2dce4:	00000000	udf	#0
   0x0000fffff7d2dce8:	00000000	udf	#0
   0x0000fffff7d2dcec:	00000000	udf	#0
   0x0000fffff7d2dcf0:	00000000	udf	#0
   0x0000fffff7d2dcf4:	00000000	udf	#0
   0x0000fffff7d2dcf8:	00000000	udf	#0
   0x0000fffff7d2dcfc:	00000000	udf	#0
   0x0000fffff7d2dd00:	00000000	udf	#0
   0x0000fffff7d2dd04:	00000000	udf	#0
   0x0000fffff7d2dd08:	00000000	udf	#0
   0x0000fffff7d2dd0c:	00000000	udf	#0
   0x0000fffff7d2dd10:	00000000	udf	#0
   0x0000fffff7d2dd14:	00000000	udf	#0
   0x0000fffff7d2dd18:	00000000	udf	#0
   0x0000fffff7d2dd1c:	00000000	udf	#0
   0x0000fffff7d2dd20:	00000000	udf	#0
   0x0000fffff7d2dd24:	00000000	udf	#0
   0x0000fffff7d2dd28:	00000000	udf	#0
   0x0000fffff7d2dd2c:	00000000	udf	#0
   0x0000fffff7d2dd30:	00000000	udf	#0
   0x0000fffff7d2dd34:	00000000	udf	#0
   0x0000fffff7d2dd38:	00000000	udf	#0
   0x0000fffff7d2dd3c:	00000000	udf	#0
   0x0000fffff7d2dd40:	00000000	udf	#0
   0x0000fffff7d2dd44:	00000000	udf	#0
   0x0000fffff7d2dd48:	00000000	udf	#0
   0x0000fffff7d2dd4c:	00000000	udf	#0
   0x0000fffff7d2dd50:	00000000	udf	#0
   0x0000fffff7d2dd54:	00000000	udf	#0
   0x0000fffff7d2dd58:	00000000	udf	#0
   0x0000fffff7d2dd5c:	00000000	udf	#0
   0x0000fffff7d2dd60:	00000000	udf	#0
   0x0000fffff7d2dd64:	00000000	udf	#0
   0x0000fffff7d2dd68:	00000000	udf	#0
   0x0000fffff7d2dd6c:	00000000	udf	#0
   0x0000fffff7d2dd70:	00000000	udf	#0
   0x0000fffff7d2dd74:	00000000	udf	#0
   0x0000fffff7d2dd78:	00000000	udf	#0
   0x0000fffff7d2dd7c:	00000000	udf	#0
   0x0000fffff7d2dd80:	00000000	udf	#0
   0x0000fffff7d2dd84:	00000000	udf	#0
   0x0000fffff7d2dd88:	00000000	udf	#0
   0x0000fffff7d2dd8c:	00000000	udf	#0
   0x0000fffff7d2dd90:	00000000	udf	#0
   0x0000fffff7d2dd94:	00000000	udf	#0
   0x0000fffff7d2dd98:	00000000	udf	#0
   0x0000fffff7d2dd9c:	00000000	udf	#0
   0x0000fffff7d2dda0:	00000000	udf	#0
   0x0000fffff7d2dda4:	00000000	udf	#0
   0x0000fffff7d2dda8:	00000000	udf	#0
   0x0000fffff7d2ddac:	00000000	udf	#0
   0x0000fffff7d2ddb0:	00000000	udf	#0
   0x0000fffff7d2ddb4:	00000000	udf	#0
   0x0000fffff7d2ddb8:	00000000	udf	#0
   0x0000fffff7d2ddbc:	00000000	udf	#0
   0x0000fffff7d2ddc0:	00000000	udf	#0
   0x0000fffff7d2ddc4:	00000000	udf	#0
   0x0000fffff7d2ddc8:	00000000	udf	#0
   0x0000fffff7d2ddcc:	00000000	udf	#0
   0x0000fffff7d2ddd0:	00000000	udf	#0
   0x0000fffff7d2ddd4:	00000000	udf	#0
   0x0000fffff7d2ddd8:	00000000	udf	#0
   0x0000fffff7d2dddc:	00000000	udf	#0
   0x0000fffff7d2dde0:	00000000	udf	#0
   0x0000fffff7d2dde4:	00000000	udf	#0
   0x0000fffff7d2dde8:	00000000	udf	#0
   0x0000fffff7d2ddec:	00000000	udf	#0
   0x0000fffff7d2ddf0:	00000000	udf	#0
   0x0000fffff7d2ddf4:	00000000	udf	#0
   0x0000fffff7d2ddf8:	00000000	udf	#0
   0x0000fffff7d2ddfc:	00000000	udf	#0
   0x0000fffff7d2de00:	00000000	udf	#0
   0x0000fffff7d2de04:	00000000	udf	#0
   0x0000fffff7d2de08:	00000000	udf	#0
   0x0000fffff7d2de0c:	00000000	udf	#0
   0x0000fffff7d2de10:	00000000	udf	#0
   0x0000fffff7d2de14:	00000000	udf	#0
   0x0000fffff7d2de18:	00000000	udf	#0
   0x0000fffff7d2de1c:	00000000	udf	#0
   0x0000fffff7d2de20:	00000000	udf	#0
   0x0000fffff7d2de24:	00000000	udf	#0
   0x0000fffff7d2de28:	00000000	udf	#0
   0x0000fffff7d2de2c:	00000000	udf	#0
   0x0000fffff7d2de30:	00000000	udf	#0
   0x0000fffff7d2de34:	00000000	udf	#0
   0x0000fffff7d2de38:	00000000	udf	#0
   0x0000fffff7d2de3c:	00000000	udf	#0
   0x0000fffff7d2de40:	00000000	udf	#0
   0x0000fffff7d2de44:	00000000	udf	#0
   0x0000fffff7d2de48:	00000000	udf	#0
   0x0000fffff7d2de4c:	00000000	udf	#0
   0x0000fffff7d2de50:	00000000	udf	#0
   0x0000fffff7d2de54:	00000000	udf	#0
   0x0000fffff7d2de58:	00000000	udf	#0
   0x0000fffff7d2de5c:	00000000	udf	#0
   0x0000fffff7d2de60:	00000000	udf	#0
   0x0000fffff7d2de64:	00000000	udf	#0
   0x0000fffff7d2de68:	00000000	udf	#0
   0x0000fffff7d2de6c:	00000000	udf	#0
   0x0000fffff7d2de70:	00000000	udf	#0
   0x0000fffff7d2de74:	00000000	udf	#0
   0x0000fffff7d2de78:	00000000	udf	#0
   0x0000fffff7d2de7c:	00000000	udf	#0
   0x0000fffff7d2de80:	00000000	udf	#0
   0x0000fffff7d2de84:	00000000	udf	#0
   0x0000fffff7d2de88:	00000000	udf	#0
   0x0000fffff7d2de8c:	00000000	udf	#0
   0x0000fffff7d2de90:	00000000	udf	#0
   0x0000fffff7d2de94:	00000000	udf	#0
   0x0000fffff7d2de98:	00000000	udf	#0
   0x0000fffff7d2de9c:	00000000	udf	#0
   0x0000fffff7d2dea0:	00000000	udf	#0
   0x0000fffff7d2dea4:	00000000	udf	#0
   0x0000fffff7d2dea8:	00000000	udf	#0
   0x0000fffff7d2deac:	00000000	udf	#0
   0x0000fffff7d2deb0:	00000000	udf	#0
   0x0000fffff7d2deb4:	00000000	udf	#0
   0x0000fffff7d2deb8:	00000000	udf	#0
   0x0000fffff7d2debc:	00000000	udf	#0
   0x0000fffff7d2dec0:	00000000	udf	#0
   0x0000fffff7d2dec4:	00000000	udf	#0
   0x0000fffff7d2dec8:	00000000	udf	#0
   0x0000fffff7d2decc:	00000000	udf	#0
   0x0000fffff7d2ded0:	00000000	udf	#0
   0x0000fffff7d2ded4:	00000000	udf	#0
   0x0000fffff7d2ded8:	00000000	udf	#0
   0x0000fffff7d2dedc:	00000000	udf	#0
   0x0000fffff7d2dee0:	00000000	udf	#0
   0x0000fffff7d2dee4:	00000000	udf	#0
   0x0000fffff7d2dee8:	00000000	udf	#0
   0x0000fffff7d2deec:	00000000	udf	#0
   0x0000fffff7d2def0:	00000000	udf	#0
   0x0000fffff7d2def4:	00000000	udf	#0
   0x0000fffff7d2def8:	00000000	udf	#0
   0x0000fffff7d2defc:	00000000	udf	#0
   0x0000fffff7d2df00:	00000000	udf	#0
   0x0000fffff7d2df04:	00000000	udf	#0
   0x0000fffff7d2df08:	00000000	udf	#0
   0x0000fffff7d2df0c:	00000000	udf	#0
   0x0000fffff7d2df10:	00000000	udf	#0
   0x0000fffff7d2df14:	00000000	udf	#0
   0x0000fffff7d2df18:	00000000	udf	#0
   0x0000fffff7d2df1c:	00000000	udf	#0
   0x0000fffff7d2df20:	00000000	udf	#0
   0x0000fffff7d2df24:	00000000	udf	#0
   0x0000fffff7d2df28:	00000000	udf	#0
   0x0000fffff7d2df2c:	00000000	udf	#0
   0x0000fffff7d2df30:	00000000	udf	#0
   0x0000fffff7d2df34:	00000000	udf	#0
   0x0000fffff7d2df38:	00000000	udf	#0
   0x0000fffff7d2df3c:	00000000	udf	#0
   0x0000fffff7d2df40:	00000000	udf	#0
   0x0000fffff7d2df44:	00000000	udf	#0
   0x0000fffff7d2df48:	00000000	udf	#0
   0x0000fffff7d2df4c:	00000000	udf	#0
   0x0000fffff7d2df50:	00000000	udf	#0
   0x0000fffff7d2df54:	00000000	udf	#0
   0x0000fffff7d2df58:	00000000	udf	#0
   0x0000fffff7d2df5c:	00000000	udf	#0
   0x0000fffff7d2df60:	00000000	udf	#0
   0x0000fffff7d2df64:	00000000	udf	#0
   0x0000fffff7d2df68:	00000000	udf	#0
   0x0000fffff7d2df6c:	00000000	udf	#0
   0x0000fffff7d2df70:	00000000	udf	#0
   0x0000fffff7d2df74:	00000000	udf	#0
   0x0000fffff7d2df78:	00000000	udf	#0
   0x0000fffff7d2df7c:	00000000	udf	#0
   0x0000fffff7d2df80:	00000000	udf	#0
   0x0000fffff7d2df84:	00000000	udf	#0
   0x0000fffff7d2df88:	00000000	udf	#0
   0x0000fffff7d2df8c:	00000000	udf	#0
   0x0000fffff7d2df90:	00000000	udf	#0
   0x0000fffff7d2df94:	00000000	udf	#0
   0x0000fffff7d2df98:	00000000	udf	#0
   0x0000fffff7d2df9c:	00000000	udf	#0
   0x0000fffff7d2dfa0:	00000000	udf	#0
   0x0000fffff7d2dfa4:	00000000	udf	#0
   0x0000fffff7d2dfa8:	00000000	udf	#0
   0x0000fffff7d2dfac:	00000000	udf	#0
   0x0000fffff7d2dfb0:	00000000	udf	#0
   0x0000fffff7d2dfb4:	00000000	udf	#0
   0x0000fffff7d2dfb8:	00000000	udf	#0
   0x0000fffff7d2dfbc:	00000000	udf	#0
   0x0000fffff7d2dfc0:	00000000	udf	#0
   0x0000fffff7d2dfc4:	00000000	udf	#0
   0x0000fffff7d2dfc8:	00000000	udf	#0
   0x0000fffff7d2dfcc:	00000000	udf	#0
   0x0000fffff7d2dfd0:	00000000	udf	#0
   0x0000fffff7d2dfd4:	00000000	udf	#0
   0x0000fffff7d2dfd8:	00000000	udf	#0
   0x0000fffff7d2dfdc:	00000000	udf	#0
   0x0000fffff7d2dfe0:	00000000	udf	#0
   0x0000fffff7d2dfe4:	00000000	udf	#0
   0x0000fffff7d2dfe8:	00000000	udf	#0
   0x0000fffff7d2dfec:	00000000	udf	#0
   0x0000fffff7d2dff0:	00000000	udf	#0
   0x0000fffff7d2dff4:	00000000	udf	#0
   0x0000fffff7d2dff8:	00000000	udf	#0
   0x0000fffff7d2dffc:	00000000	udf	#0
End of assembler dump.
