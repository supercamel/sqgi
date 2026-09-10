
/tmp/sqgi-v21-native-profile/floats/638430-3.bin:     file format binary


Disassembly of section .data:

0000ffff9c6d3000 <.data>:
    ffff9c6d3000:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    ffff9c6d3004:	910003fd 	mov	x29, sp
    ffff9c6d3008:	a9bf53f3 	stp	x19, x20, [sp, #-16]!
    ffff9c6d300c:	a9bf5bf5 	stp	x21, x22, [sp, #-16]!
    ffff9c6d3010:	d13003ff 	sub	sp, sp, #0xc00
    ffff9c6d3014:	aa0003f3 	mov	x19, x0
    ffff9c6d3018:	aa0103f4 	mov	x20, x1
    ffff9c6d301c:	aa0203f5 	mov	x21, x2
    ffff9c6d3020:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d3024:	912063e1 	add	x1, sp, #0x818
    ffff9c6d3028:	d2856c02 	mov	x2, #0x2b60                	// #11104
    ffff9c6d302c:	f2ba7742 	movk	x2, #0xd3ba, lsl #16
    ffff9c6d3030:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6d3034:	d2910410 	mov	x16, #0x8820                	// #34848
    ffff9c6d3038:	f2ba2290 	movk	x16, #0xd114, lsl #16
    ffff9c6d303c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d3040:	d63f0200 	blr	x16
    ffff9c6d3044:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d3048:	f90403e9 	str	x9, [sp, #2048]
    ffff9c6d304c:	f9401ea9 	ldr	x9, [x21, #56]
    ffff9c6d3050:	d285da0a 	mov	x10, #0x2ed0                	// #11984
    ffff9c6d3054:	f2ba778a 	movk	x10, #0xd3bc, lsl #16
    ffff9c6d3058:	f2d5554a 	movk	x10, #0xaaaa, lsl #32
    ffff9c6d305c:	eb0a013f 	cmp	x9, x10
    ffff9c6d3060:	540050c1 	b.ne	0xffff9c6d3a78  // b.any
    ffff9c6d3064:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d3068:	aa1303e1 	mov	x1, x19
    ffff9c6d306c:	d2800042 	mov	x2, #0x2                   	// #2
    ffff9c6d3070:	d2822610 	mov	x16, #0x1130                	// #4400
    ffff9c6d3074:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d3078:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d307c:	d63f0200 	blr	x16
    ffff9c6d3080:	f100001f 	cmp	x0, #0x0
    ffff9c6d3084:	54004fa0 	b.eq	0xffff9c6d3a78  // b.none
    ffff9c6d3088:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d308c:	aa1303e1 	mov	x1, x19
    ffff9c6d3090:	d2800062 	mov	x2, #0x3                   	// #3
    ffff9c6d3094:	d2822610 	mov	x16, #0x1130                	// #4400
    ffff9c6d3098:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d309c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d30a0:	d63f0200 	blr	x16
    ffff9c6d30a4:	f100001f 	cmp	x0, #0x0
    ffff9c6d30a8:	54004e80 	b.eq	0xffff9c6d3a78  // b.none
    ffff9c6d30ac:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d30b0:	aa1303e1 	mov	x1, x19
    ffff9c6d30b4:	d2800082 	mov	x2, #0x4                   	// #4
    ffff9c6d30b8:	d2822610 	mov	x16, #0x1130                	// #4400
    ffff9c6d30bc:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d30c0:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d30c4:	d63f0200 	blr	x16
    ffff9c6d30c8:	f100001f 	cmp	x0, #0x0
    ffff9c6d30cc:	54004d60 	b.eq	0xffff9c6d3a78  // b.none
    ffff9c6d30d0:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d30d4:	aa1303e1 	mov	x1, x19
    ffff9c6d30d8:	d28000a2 	mov	x2, #0x5                   	// #5
    ffff9c6d30dc:	d2822610 	mov	x16, #0x1130                	// #4400
    ffff9c6d30e0:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d30e4:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d30e8:	d63f0200 	blr	x16
    ffff9c6d30ec:	f100001f 	cmp	x0, #0x0
    ffff9c6d30f0:	54004c40 	b.eq	0xffff9c6d3a78  // b.none
    ffff9c6d30f4:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d30f8:	aa1303e1 	mov	x1, x19
    ffff9c6d30fc:	d28000c2 	mov	x2, #0x6                   	// #6
    ffff9c6d3100:	d2822610 	mov	x16, #0x1130                	// #4400
    ffff9c6d3104:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d3108:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d310c:	d63f0200 	blr	x16
    ffff9c6d3110:	f100001f 	cmp	x0, #0x0
    ffff9c6d3114:	54004b20 	b.eq	0xffff9c6d3a78  // b.none
    ffff9c6d3118:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d311c:	aa1303e1 	mov	x1, x19
    ffff9c6d3120:	d28000e2 	mov	x2, #0x7                   	// #7
    ffff9c6d3124:	d2822610 	mov	x16, #0x1130                	// #4400
    ffff9c6d3128:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d312c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d3130:	d63f0200 	blr	x16
    ffff9c6d3134:	f100001f 	cmp	x0, #0x0
    ffff9c6d3138:	54004a00 	b.eq	0xffff9c6d3a78  // b.none
    ffff9c6d313c:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d3140:	aa1303e1 	mov	x1, x19
    ffff9c6d3144:	d2800102 	mov	x2, #0x8                   	// #8
    ffff9c6d3148:	d2822610 	mov	x16, #0x1130                	// #4400
    ffff9c6d314c:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d3150:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d3154:	d63f0200 	blr	x16
    ffff9c6d3158:	f100001f 	cmp	x0, #0x0
    ffff9c6d315c:	540048e0 	b.eq	0xffff9c6d3a78  // b.none
    ffff9c6d3160:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d3164:	aa1303e1 	mov	x1, x19
    ffff9c6d3168:	d2800122 	mov	x2, #0x9                   	// #9
    ffff9c6d316c:	d2822610 	mov	x16, #0x1130                	// #4400
    ffff9c6d3170:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d3174:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d3178:	d63f0200 	blr	x16
    ffff9c6d317c:	f100001f 	cmp	x0, #0x0
    ffff9c6d3180:	540047c0 	b.eq	0xffff9c6d3a78  // b.none
    ffff9c6d3184:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d3188:	aa1303e1 	mov	x1, x19
    ffff9c6d318c:	d2800142 	mov	x2, #0xa                   	// #10
    ffff9c6d3190:	d2822610 	mov	x16, #0x1130                	// #4400
    ffff9c6d3194:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d3198:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d319c:	d63f0200 	blr	x16
    ffff9c6d31a0:	f100001f 	cmp	x0, #0x0
    ffff9c6d31a4:	540046a0 	b.eq	0xffff9c6d3a78  // b.none
    ffff9c6d31a8:	b9401269 	ldr	w9, [x19, #16]
    ffff9c6d31ac:	5280004a 	mov	w10, #0x2                   	// #2
    ffff9c6d31b0:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6d31b4:	eb0a013f 	cmp	x9, x10
    ffff9c6d31b8:	54004601 	b.ne	0xffff9c6d3a78  // b.any
    ffff9c6d31bc:	f9400e69 	ldr	x9, [x19, #24]
    ffff9c6d31c0:	f90007e9 	str	x9, [sp, #8]
    ffff9c6d31c4:	b9402269 	ldr	w9, [x19, #32]
    ffff9c6d31c8:	5280008a 	mov	w10, #0x4                   	// #4
    ffff9c6d31cc:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6d31d0:	eb0a013f 	cmp	x9, x10
    ffff9c6d31d4:	54004521 	b.ne	0xffff9c6d3a78  // b.any
    ffff9c6d31d8:	fd401660 	ldr	d0, [x19, #40]
    ffff9c6d31dc:	fd000be0 	str	d0, [sp, #16]
    ffff9c6d31e0:	b9403269 	ldr	w9, [x19, #48]
    ffff9c6d31e4:	5280008a 	mov	w10, #0x4                   	// #4
    ffff9c6d31e8:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6d31ec:	eb0a013f 	cmp	x9, x10
    ffff9c6d31f0:	54004441 	b.ne	0xffff9c6d3a78  // b.any
    ffff9c6d31f4:	fd401e60 	ldr	d0, [x19, #56]
    ffff9c6d31f8:	fd000fe0 	str	d0, [sp, #24]
    ffff9c6d31fc:	b9404269 	ldr	w9, [x19, #64]
    ffff9c6d3200:	5280008a 	mov	w10, #0x4                   	// #4
    ffff9c6d3204:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6d3208:	eb0a013f 	cmp	x9, x10
    ffff9c6d320c:	54004361 	b.ne	0xffff9c6d3a78  // b.any
    ffff9c6d3210:	fd402660 	ldr	d0, [x19, #72]
    ffff9c6d3214:	fd0013e0 	str	d0, [sp, #32]
    ffff9c6d3218:	b9405269 	ldr	w9, [x19, #80]
    ffff9c6d321c:	5280008a 	mov	w10, #0x4                   	// #4
    ffff9c6d3220:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6d3224:	eb0a013f 	cmp	x9, x10
    ffff9c6d3228:	54004281 	b.ne	0xffff9c6d3a78  // b.any
    ffff9c6d322c:	fd402e60 	ldr	d0, [x19, #88]
    ffff9c6d3230:	fd0017e0 	str	d0, [sp, #40]
    ffff9c6d3234:	b9406269 	ldr	w9, [x19, #96]
    ffff9c6d3238:	5280008a 	mov	w10, #0x4                   	// #4
    ffff9c6d323c:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6d3240:	eb0a013f 	cmp	x9, x10
    ffff9c6d3244:	540041a1 	b.ne	0xffff9c6d3a78  // b.any
    ffff9c6d3248:	fd403660 	ldr	d0, [x19, #104]
    ffff9c6d324c:	fd001be0 	str	d0, [sp, #48]
    ffff9c6d3250:	b9407269 	ldr	w9, [x19, #112]
    ffff9c6d3254:	5280008a 	mov	w10, #0x4                   	// #4
    ffff9c6d3258:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6d325c:	eb0a013f 	cmp	x9, x10
    ffff9c6d3260:	540040c1 	b.ne	0xffff9c6d3a78  // b.any
    ffff9c6d3264:	fd403e60 	ldr	d0, [x19, #120]
    ffff9c6d3268:	fd001fe0 	str	d0, [sp, #56]
    ffff9c6d326c:	b9408269 	ldr	w9, [x19, #128]
    ffff9c6d3270:	5280008a 	mov	w10, #0x4                   	// #4
    ffff9c6d3274:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6d3278:	eb0a013f 	cmp	x9, x10
    ffff9c6d327c:	54003fe1 	b.ne	0xffff9c6d3a78  // b.any
    ffff9c6d3280:	fd404660 	ldr	d0, [x19, #136]
    ffff9c6d3284:	fd0023e0 	str	d0, [sp, #64]
    ffff9c6d3288:	b9409269 	ldr	w9, [x19, #144]
    ffff9c6d328c:	5280008a 	mov	w10, #0x4                   	// #4
    ffff9c6d3290:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6d3294:	eb0a013f 	cmp	x9, x10
    ffff9c6d3298:	54003f01 	b.ne	0xffff9c6d3a78  // b.any
    ffff9c6d329c:	fd404e60 	ldr	d0, [x19, #152]
    ffff9c6d32a0:	fd0027e0 	str	d0, [sp, #72]
    ffff9c6d32a4:	b940a269 	ldr	w9, [x19, #160]
    ffff9c6d32a8:	5280004a 	mov	w10, #0x2                   	// #2
    ffff9c6d32ac:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6d32b0:	eb0a013f 	cmp	x9, x10
    ffff9c6d32b4:	54003e21 	b.ne	0xffff9c6d3a78  // b.any
    ffff9c6d32b8:	f9405669 	ldr	x9, [x19, #168]
    ffff9c6d32bc:	f9002be9 	str	x9, [sp, #80]
    ffff9c6d32c0:	140001f9 	b	0xffff9c6d3aa4
    ffff9c6d32c4:	f9402be9 	ldr	x9, [sp, #80]
    ffff9c6d32c8:	f94007ea 	ldr	x10, [sp, #8]
    ffff9c6d32cc:	eb0a013f 	cmp	x9, x10
    ffff9c6d32d0:	540030ca 	b.ge	0xffff9c6d38e8  // b.tcont
    ffff9c6d32d4:	d2800029 	mov	x9, #0x1                   	// #1
    ffff9c6d32d8:	f90403e9 	str	x9, [sp, #2048]
    ffff9c6d32dc:	14000011 	b	0xffff9c6d3320
    ffff9c6d32e0:	d2800001 	mov	x1, #0x0                   	// #0
    ffff9c6d32e4:	d28d0302 	mov	x2, #0x6818                	// #26648
    ffff9c6d32e8:	f2ba77a2 	movk	x2, #0xd3bd, lsl #16
    ffff9c6d32ec:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6d32f0:	d2826803 	mov	x3, #0x1340                	// #4928
    ffff9c6d32f4:	f2ba79e3 	movk	x3, #0xd3cf, lsl #16
    ffff9c6d32f8:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff9c6d32fc:	d285dd04 	mov	x4, #0x2ee8                	// #12008
    ffff9c6d3300:	f2ba7784 	movk	x4, #0xd3bc, lsl #16
    ffff9c6d3304:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff9c6d3308:	d28cc810 	mov	x16, #0x6640                	// #26176
    ffff9c6d330c:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d3310:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d3314:	d63f0200 	blr	x16
    ffff9c6d3318:	f100001f 	cmp	x0, #0x0
    ffff9c6d331c:	54003ae0 	b.eq	0xffff9c6d3a78  // b.none
    ffff9c6d3320:	f9400be9 	ldr	x9, [sp, #16]
    ffff9c6d3324:	f90037e9 	str	x9, [sp, #104]
    ffff9c6d3328:	d28002e9 	mov	x9, #0x17                  	// #23
    ffff9c6d332c:	f9003be9 	str	x9, [sp, #112]
    ffff9c6d3330:	f9402be9 	ldr	x9, [sp, #80]
    ffff9c6d3334:	d28002ea 	mov	x10, #0x17                  	// #23
    ffff9c6d3338:	9aca0d2b 	sdiv	x11, x9, x10
    ffff9c6d333c:	9b0aa569 	msub	x9, x11, x10, x9
    ffff9c6d3340:	f9003be9 	str	x9, [sp, #112]
    ffff9c6d3344:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d3348:	f2e7fd89 	movk	x9, #0x3fec, lsl #48
    ffff9c6d334c:	f9003fe9 	str	x9, [sp, #120]
    ffff9c6d3350:	fd4037e0 	ldr	d0, [sp, #104]
    ffff9c6d3354:	fd403fe1 	ldr	d1, [sp, #120]
    ffff9c6d3358:	1e610800 	fmul	d0, d0, d1
    ffff9c6d335c:	fd0043e0 	str	d0, [sp, #128]
    ffff9c6d3360:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d3364:	f2e7fe09 	movk	x9, #0x3ff0, lsl #48
    ffff9c6d3368:	f90047e9 	str	x9, [sp, #136]
    ffff9c6d336c:	fd4047e0 	ldr	d0, [sp, #136]
    ffff9c6d3370:	fd403fe1 	ldr	d1, [sp, #120]
    ffff9c6d3374:	1e613800 	fsub	d0, d0, d1
    ffff9c6d3378:	fd0047e0 	str	d0, [sp, #136]
    ffff9c6d337c:	f9403be9 	ldr	x9, [sp, #112]
    ffff9c6d3380:	9e620120 	scvtf	d0, x9
    ffff9c6d3384:	fd4047e1 	ldr	d1, [sp, #136]
    ffff9c6d3388:	1e610800 	fmul	d0, d0, d1
    ffff9c6d338c:	fd0047e0 	str	d0, [sp, #136]
    ffff9c6d3390:	fd4043e0 	ldr	d0, [sp, #128]
    ffff9c6d3394:	fd4047e1 	ldr	d1, [sp, #136]
    ffff9c6d3398:	1e612800 	fadd	d0, d0, d1
    ffff9c6d339c:	fd0043e0 	str	d0, [sp, #128]
    ffff9c6d33a0:	f94043e9 	ldr	x9, [sp, #128]
    ffff9c6d33a4:	f9002fe9 	str	x9, [sp, #88]
    ffff9c6d33a8:	f9402fe9 	ldr	x9, [sp, #88]
    ffff9c6d33ac:	f9000be9 	str	x9, [sp, #16]
    ffff9c6d33b0:	14000011 	b	0xffff9c6d33f4
    ffff9c6d33b4:	d2800001 	mov	x1, #0x0                   	// #0
    ffff9c6d33b8:	d28d0302 	mov	x2, #0x6818                	// #26648
    ffff9c6d33bc:	f2ba77a2 	movk	x2, #0xd3bd, lsl #16
    ffff9c6d33c0:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6d33c4:	d2826803 	mov	x3, #0x1340                	// #4928
    ffff9c6d33c8:	f2ba79e3 	movk	x3, #0xd3cf, lsl #16
    ffff9c6d33cc:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff9c6d33d0:	d285dd04 	mov	x4, #0x2ee8                	// #12008
    ffff9c6d33d4:	f2ba7784 	movk	x4, #0xd3bc, lsl #16
    ffff9c6d33d8:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff9c6d33dc:	d28cc810 	mov	x16, #0x6640                	// #26176
    ffff9c6d33e0:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d33e4:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d33e8:	d63f0200 	blr	x16
    ffff9c6d33ec:	f100001f 	cmp	x0, #0x0
    ffff9c6d33f0:	54003440 	b.eq	0xffff9c6d3a78  // b.none
    ffff9c6d33f4:	f9400fe9 	ldr	x9, [sp, #24]
    ffff9c6d33f8:	f90037e9 	str	x9, [sp, #104]
    ffff9c6d33fc:	f9400be9 	ldr	x9, [sp, #16]
    ffff9c6d3400:	f9003be9 	str	x9, [sp, #112]
    ffff9c6d3404:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d3408:	f2e7fd09 	movk	x9, #0x3fe8, lsl #48
    ffff9c6d340c:	f9003fe9 	str	x9, [sp, #120]
    ffff9c6d3410:	fd4037e0 	ldr	d0, [sp, #104]
    ffff9c6d3414:	fd403fe1 	ldr	d1, [sp, #120]
    ffff9c6d3418:	1e610800 	fmul	d0, d0, d1
    ffff9c6d341c:	fd0043e0 	str	d0, [sp, #128]
    ffff9c6d3420:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d3424:	f2e7fe09 	movk	x9, #0x3ff0, lsl #48
    ffff9c6d3428:	f90047e9 	str	x9, [sp, #136]
    ffff9c6d342c:	fd4047e0 	ldr	d0, [sp, #136]
    ffff9c6d3430:	fd403fe1 	ldr	d1, [sp, #120]
    ffff9c6d3434:	1e613800 	fsub	d0, d0, d1
    ffff9c6d3438:	fd0047e0 	str	d0, [sp, #136]
    ffff9c6d343c:	fd403be0 	ldr	d0, [sp, #112]
    ffff9c6d3440:	fd4047e1 	ldr	d1, [sp, #136]
    ffff9c6d3444:	1e610800 	fmul	d0, d0, d1
    ffff9c6d3448:	fd0047e0 	str	d0, [sp, #136]
    ffff9c6d344c:	fd4043e0 	ldr	d0, [sp, #128]
    ffff9c6d3450:	fd4047e1 	ldr	d1, [sp, #136]
    ffff9c6d3454:	1e612800 	fadd	d0, d0, d1
    ffff9c6d3458:	fd0043e0 	str	d0, [sp, #128]
    ffff9c6d345c:	f94043e9 	ldr	x9, [sp, #128]
    ffff9c6d3460:	f9002fe9 	str	x9, [sp, #88]
    ffff9c6d3464:	f9402fe9 	ldr	x9, [sp, #88]
    ffff9c6d3468:	f9000fe9 	str	x9, [sp, #24]
    ffff9c6d346c:	14000011 	b	0xffff9c6d34b0
    ffff9c6d3470:	d2800001 	mov	x1, #0x0                   	// #0
    ffff9c6d3474:	d28d0302 	mov	x2, #0x6818                	// #26648
    ffff9c6d3478:	f2ba77a2 	movk	x2, #0xd3bd, lsl #16
    ffff9c6d347c:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6d3480:	d2826803 	mov	x3, #0x1340                	// #4928
    ffff9c6d3484:	f2ba79e3 	movk	x3, #0xd3cf, lsl #16
    ffff9c6d3488:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff9c6d348c:	d285dd04 	mov	x4, #0x2ee8                	// #12008
    ffff9c6d3490:	f2ba7784 	movk	x4, #0xd3bc, lsl #16
    ffff9c6d3494:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff9c6d3498:	d28cc810 	mov	x16, #0x6640                	// #26176
    ffff9c6d349c:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d34a0:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d34a4:	d63f0200 	blr	x16
    ffff9c6d34a8:	f100001f 	cmp	x0, #0x0
    ffff9c6d34ac:	54002e60 	b.eq	0xffff9c6d3a78  // b.none
    ffff9c6d34b0:	f94013e9 	ldr	x9, [sp, #32]
    ffff9c6d34b4:	f90037e9 	str	x9, [sp, #104]
    ffff9c6d34b8:	f9400fe9 	ldr	x9, [sp, #24]
    ffff9c6d34bc:	f9003be9 	str	x9, [sp, #112]
    ffff9c6d34c0:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d34c4:	f2e7fc89 	movk	x9, #0x3fe4, lsl #48
    ffff9c6d34c8:	f9003fe9 	str	x9, [sp, #120]
    ffff9c6d34cc:	fd4037e0 	ldr	d0, [sp, #104]
    ffff9c6d34d0:	fd403fe1 	ldr	d1, [sp, #120]
    ffff9c6d34d4:	1e610800 	fmul	d0, d0, d1
    ffff9c6d34d8:	fd0043e0 	str	d0, [sp, #128]
    ffff9c6d34dc:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d34e0:	f2e7fe09 	movk	x9, #0x3ff0, lsl #48
    ffff9c6d34e4:	f90047e9 	str	x9, [sp, #136]
    ffff9c6d34e8:	fd4047e0 	ldr	d0, [sp, #136]
    ffff9c6d34ec:	fd403fe1 	ldr	d1, [sp, #120]
    ffff9c6d34f0:	1e613800 	fsub	d0, d0, d1
    ffff9c6d34f4:	fd0047e0 	str	d0, [sp, #136]
    ffff9c6d34f8:	fd403be0 	ldr	d0, [sp, #112]
    ffff9c6d34fc:	fd4047e1 	ldr	d1, [sp, #136]
    ffff9c6d3500:	1e610800 	fmul	d0, d0, d1
    ffff9c6d3504:	fd0047e0 	str	d0, [sp, #136]
    ffff9c6d3508:	fd4043e0 	ldr	d0, [sp, #128]
    ffff9c6d350c:	fd4047e1 	ldr	d1, [sp, #136]
    ffff9c6d3510:	1e612800 	fadd	d0, d0, d1
    ffff9c6d3514:	fd0043e0 	str	d0, [sp, #128]
    ffff9c6d3518:	f94043e9 	ldr	x9, [sp, #128]
    ffff9c6d351c:	f9002fe9 	str	x9, [sp, #88]
    ffff9c6d3520:	f9402fe9 	ldr	x9, [sp, #88]
    ffff9c6d3524:	f90013e9 	str	x9, [sp, #32]
    ffff9c6d3528:	14000011 	b	0xffff9c6d356c
    ffff9c6d352c:	d2800001 	mov	x1, #0x0                   	// #0
    ffff9c6d3530:	d28d0302 	mov	x2, #0x6818                	// #26648
    ffff9c6d3534:	f2ba77a2 	movk	x2, #0xd3bd, lsl #16
    ffff9c6d3538:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6d353c:	d2826803 	mov	x3, #0x1340                	// #4928
    ffff9c6d3540:	f2ba79e3 	movk	x3, #0xd3cf, lsl #16
    ffff9c6d3544:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff9c6d3548:	d285dd04 	mov	x4, #0x2ee8                	// #12008
    ffff9c6d354c:	f2ba7784 	movk	x4, #0xd3bc, lsl #16
    ffff9c6d3550:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff9c6d3554:	d28cc810 	mov	x16, #0x6640                	// #26176
    ffff9c6d3558:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d355c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d3560:	d63f0200 	blr	x16
    ffff9c6d3564:	f100001f 	cmp	x0, #0x0
    ffff9c6d3568:	54002880 	b.eq	0xffff9c6d3a78  // b.none
    ffff9c6d356c:	f94017e9 	ldr	x9, [sp, #40]
    ffff9c6d3570:	f90037e9 	str	x9, [sp, #104]
    ffff9c6d3574:	f94013e9 	ldr	x9, [sp, #32]
    ffff9c6d3578:	f9003be9 	str	x9, [sp, #112]
    ffff9c6d357c:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d3580:	f2e7fc09 	movk	x9, #0x3fe0, lsl #48
    ffff9c6d3584:	f9003fe9 	str	x9, [sp, #120]
    ffff9c6d3588:	fd4037e0 	ldr	d0, [sp, #104]
    ffff9c6d358c:	fd403fe1 	ldr	d1, [sp, #120]
    ffff9c6d3590:	1e610800 	fmul	d0, d0, d1
    ffff9c6d3594:	fd0043e0 	str	d0, [sp, #128]
    ffff9c6d3598:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d359c:	f2e7fe09 	movk	x9, #0x3ff0, lsl #48
    ffff9c6d35a0:	f90047e9 	str	x9, [sp, #136]
    ffff9c6d35a4:	fd4047e0 	ldr	d0, [sp, #136]
    ffff9c6d35a8:	fd403fe1 	ldr	d1, [sp, #120]
    ffff9c6d35ac:	1e613800 	fsub	d0, d0, d1
    ffff9c6d35b0:	fd0047e0 	str	d0, [sp, #136]
    ffff9c6d35b4:	fd403be0 	ldr	d0, [sp, #112]
    ffff9c6d35b8:	fd4047e1 	ldr	d1, [sp, #136]
    ffff9c6d35bc:	1e610800 	fmul	d0, d0, d1
    ffff9c6d35c0:	fd0047e0 	str	d0, [sp, #136]
    ffff9c6d35c4:	fd4043e0 	ldr	d0, [sp, #128]
    ffff9c6d35c8:	fd4047e1 	ldr	d1, [sp, #136]
    ffff9c6d35cc:	1e612800 	fadd	d0, d0, d1
    ffff9c6d35d0:	fd0043e0 	str	d0, [sp, #128]
    ffff9c6d35d4:	f94043e9 	ldr	x9, [sp, #128]
    ffff9c6d35d8:	f9002fe9 	str	x9, [sp, #88]
    ffff9c6d35dc:	f9402fe9 	ldr	x9, [sp, #88]
    ffff9c6d35e0:	f90017e9 	str	x9, [sp, #40]
    ffff9c6d35e4:	14000011 	b	0xffff9c6d3628
    ffff9c6d35e8:	d2800001 	mov	x1, #0x0                   	// #0
    ffff9c6d35ec:	d28d0302 	mov	x2, #0x6818                	// #26648
    ffff9c6d35f0:	f2ba77a2 	movk	x2, #0xd3bd, lsl #16
    ffff9c6d35f4:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6d35f8:	d2826803 	mov	x3, #0x1340                	// #4928
    ffff9c6d35fc:	f2ba79e3 	movk	x3, #0xd3cf, lsl #16
    ffff9c6d3600:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff9c6d3604:	d285dd04 	mov	x4, #0x2ee8                	// #12008
    ffff9c6d3608:	f2ba7784 	movk	x4, #0xd3bc, lsl #16
    ffff9c6d360c:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff9c6d3610:	d28cc810 	mov	x16, #0x6640                	// #26176
    ffff9c6d3614:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d3618:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d361c:	d63f0200 	blr	x16
    ffff9c6d3620:	f100001f 	cmp	x0, #0x0
    ffff9c6d3624:	540022a0 	b.eq	0xffff9c6d3a78  // b.none
    ffff9c6d3628:	f9401be9 	ldr	x9, [sp, #48]
    ffff9c6d362c:	f90037e9 	str	x9, [sp, #104]
    ffff9c6d3630:	f94017e9 	ldr	x9, [sp, #40]
    ffff9c6d3634:	f9003be9 	str	x9, [sp, #112]
    ffff9c6d3638:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d363c:	f2e7fd89 	movk	x9, #0x3fec, lsl #48
    ffff9c6d3640:	f9003fe9 	str	x9, [sp, #120]
    ffff9c6d3644:	fd4037e0 	ldr	d0, [sp, #104]
    ffff9c6d3648:	fd403fe1 	ldr	d1, [sp, #120]
    ffff9c6d364c:	1e610800 	fmul	d0, d0, d1
    ffff9c6d3650:	fd0043e0 	str	d0, [sp, #128]
    ffff9c6d3654:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d3658:	f2e7fe09 	movk	x9, #0x3ff0, lsl #48
    ffff9c6d365c:	f90047e9 	str	x9, [sp, #136]
    ffff9c6d3660:	fd4047e0 	ldr	d0, [sp, #136]
    ffff9c6d3664:	fd403fe1 	ldr	d1, [sp, #120]
    ffff9c6d3668:	1e613800 	fsub	d0, d0, d1
    ffff9c6d366c:	fd0047e0 	str	d0, [sp, #136]
    ffff9c6d3670:	fd403be0 	ldr	d0, [sp, #112]
    ffff9c6d3674:	fd4047e1 	ldr	d1, [sp, #136]
    ffff9c6d3678:	1e610800 	fmul	d0, d0, d1
    ffff9c6d367c:	fd0047e0 	str	d0, [sp, #136]
    ffff9c6d3680:	fd4043e0 	ldr	d0, [sp, #128]
    ffff9c6d3684:	fd4047e1 	ldr	d1, [sp, #136]
    ffff9c6d3688:	1e612800 	fadd	d0, d0, d1
    ffff9c6d368c:	fd0043e0 	str	d0, [sp, #128]
    ffff9c6d3690:	f94043e9 	ldr	x9, [sp, #128]
    ffff9c6d3694:	f9002fe9 	str	x9, [sp, #88]
    ffff9c6d3698:	f9402fe9 	ldr	x9, [sp, #88]
    ffff9c6d369c:	f9001be9 	str	x9, [sp, #48]
    ffff9c6d36a0:	14000011 	b	0xffff9c6d36e4
    ffff9c6d36a4:	d2800001 	mov	x1, #0x0                   	// #0
    ffff9c6d36a8:	d28d0302 	mov	x2, #0x6818                	// #26648
    ffff9c6d36ac:	f2ba77a2 	movk	x2, #0xd3bd, lsl #16
    ffff9c6d36b0:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6d36b4:	d2826803 	mov	x3, #0x1340                	// #4928
    ffff9c6d36b8:	f2ba79e3 	movk	x3, #0xd3cf, lsl #16
    ffff9c6d36bc:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff9c6d36c0:	d285dd04 	mov	x4, #0x2ee8                	// #12008
    ffff9c6d36c4:	f2ba7784 	movk	x4, #0xd3bc, lsl #16
    ffff9c6d36c8:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff9c6d36cc:	d28cc810 	mov	x16, #0x6640                	// #26176
    ffff9c6d36d0:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d36d4:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d36d8:	d63f0200 	blr	x16
    ffff9c6d36dc:	f100001f 	cmp	x0, #0x0
    ffff9c6d36e0:	54001cc0 	b.eq	0xffff9c6d3a78  // b.none
    ffff9c6d36e4:	f9401fe9 	ldr	x9, [sp, #56]
    ffff9c6d36e8:	f90037e9 	str	x9, [sp, #104]
    ffff9c6d36ec:	f9401be9 	ldr	x9, [sp, #48]
    ffff9c6d36f0:	f9003be9 	str	x9, [sp, #112]
    ffff9c6d36f4:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d36f8:	f2e7fd09 	movk	x9, #0x3fe8, lsl #48
    ffff9c6d36fc:	f9003fe9 	str	x9, [sp, #120]
    ffff9c6d3700:	fd4037e0 	ldr	d0, [sp, #104]
    ffff9c6d3704:	fd403fe1 	ldr	d1, [sp, #120]
    ffff9c6d3708:	1e610800 	fmul	d0, d0, d1
    ffff9c6d370c:	fd0043e0 	str	d0, [sp, #128]
    ffff9c6d3710:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d3714:	f2e7fe09 	movk	x9, #0x3ff0, lsl #48
    ffff9c6d3718:	f90047e9 	str	x9, [sp, #136]
    ffff9c6d371c:	fd4047e0 	ldr	d0, [sp, #136]
    ffff9c6d3720:	fd403fe1 	ldr	d1, [sp, #120]
    ffff9c6d3724:	1e613800 	fsub	d0, d0, d1
    ffff9c6d3728:	fd0047e0 	str	d0, [sp, #136]
    ffff9c6d372c:	fd403be0 	ldr	d0, [sp, #112]
    ffff9c6d3730:	fd4047e1 	ldr	d1, [sp, #136]
    ffff9c6d3734:	1e610800 	fmul	d0, d0, d1
    ffff9c6d3738:	fd0047e0 	str	d0, [sp, #136]
    ffff9c6d373c:	fd4043e0 	ldr	d0, [sp, #128]
    ffff9c6d3740:	fd4047e1 	ldr	d1, [sp, #136]
    ffff9c6d3744:	1e612800 	fadd	d0, d0, d1
    ffff9c6d3748:	fd0043e0 	str	d0, [sp, #128]
    ffff9c6d374c:	f94043e9 	ldr	x9, [sp, #128]
    ffff9c6d3750:	f9002fe9 	str	x9, [sp, #88]
    ffff9c6d3754:	f9402fe9 	ldr	x9, [sp, #88]
    ffff9c6d3758:	f9001fe9 	str	x9, [sp, #56]
    ffff9c6d375c:	14000011 	b	0xffff9c6d37a0
    ffff9c6d3760:	d2800001 	mov	x1, #0x0                   	// #0
    ffff9c6d3764:	d28d0302 	mov	x2, #0x6818                	// #26648
    ffff9c6d3768:	f2ba77a2 	movk	x2, #0xd3bd, lsl #16
    ffff9c6d376c:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6d3770:	d2826803 	mov	x3, #0x1340                	// #4928
    ffff9c6d3774:	f2ba79e3 	movk	x3, #0xd3cf, lsl #16
    ffff9c6d3778:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff9c6d377c:	d285dd04 	mov	x4, #0x2ee8                	// #12008
    ffff9c6d3780:	f2ba7784 	movk	x4, #0xd3bc, lsl #16
    ffff9c6d3784:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff9c6d3788:	d28cc810 	mov	x16, #0x6640                	// #26176
    ffff9c6d378c:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d3790:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d3794:	d63f0200 	blr	x16
    ffff9c6d3798:	f100001f 	cmp	x0, #0x0
    ffff9c6d379c:	540016e0 	b.eq	0xffff9c6d3a78  // b.none
    ffff9c6d37a0:	f94023e9 	ldr	x9, [sp, #64]
    ffff9c6d37a4:	f90037e9 	str	x9, [sp, #104]
    ffff9c6d37a8:	f9401fe9 	ldr	x9, [sp, #56]
    ffff9c6d37ac:	f9003be9 	str	x9, [sp, #112]
    ffff9c6d37b0:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d37b4:	f2e7fc89 	movk	x9, #0x3fe4, lsl #48
    ffff9c6d37b8:	f9003fe9 	str	x9, [sp, #120]
    ffff9c6d37bc:	fd4037e0 	ldr	d0, [sp, #104]
    ffff9c6d37c0:	fd403fe1 	ldr	d1, [sp, #120]
    ffff9c6d37c4:	1e610800 	fmul	d0, d0, d1
    ffff9c6d37c8:	fd0043e0 	str	d0, [sp, #128]
    ffff9c6d37cc:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d37d0:	f2e7fe09 	movk	x9, #0x3ff0, lsl #48
    ffff9c6d37d4:	f90047e9 	str	x9, [sp, #136]
    ffff9c6d37d8:	fd4047e0 	ldr	d0, [sp, #136]
    ffff9c6d37dc:	fd403fe1 	ldr	d1, [sp, #120]
    ffff9c6d37e0:	1e613800 	fsub	d0, d0, d1
    ffff9c6d37e4:	fd0047e0 	str	d0, [sp, #136]
    ffff9c6d37e8:	fd403be0 	ldr	d0, [sp, #112]
    ffff9c6d37ec:	fd4047e1 	ldr	d1, [sp, #136]
    ffff9c6d37f0:	1e610800 	fmul	d0, d0, d1
    ffff9c6d37f4:	fd0047e0 	str	d0, [sp, #136]
    ffff9c6d37f8:	fd4043e0 	ldr	d0, [sp, #128]
    ffff9c6d37fc:	fd4047e1 	ldr	d1, [sp, #136]
    ffff9c6d3800:	1e612800 	fadd	d0, d0, d1
    ffff9c6d3804:	fd0043e0 	str	d0, [sp, #128]
    ffff9c6d3808:	f94043e9 	ldr	x9, [sp, #128]
    ffff9c6d380c:	f9002fe9 	str	x9, [sp, #88]
    ffff9c6d3810:	f9402fe9 	ldr	x9, [sp, #88]
    ffff9c6d3814:	f90023e9 	str	x9, [sp, #64]
    ffff9c6d3818:	14000011 	b	0xffff9c6d385c
    ffff9c6d381c:	d2800001 	mov	x1, #0x0                   	// #0
    ffff9c6d3820:	d28d0302 	mov	x2, #0x6818                	// #26648
    ffff9c6d3824:	f2ba77a2 	movk	x2, #0xd3bd, lsl #16
    ffff9c6d3828:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6d382c:	d2826803 	mov	x3, #0x1340                	// #4928
    ffff9c6d3830:	f2ba79e3 	movk	x3, #0xd3cf, lsl #16
    ffff9c6d3834:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff9c6d3838:	d285dd04 	mov	x4, #0x2ee8                	// #12008
    ffff9c6d383c:	f2ba7784 	movk	x4, #0xd3bc, lsl #16
    ffff9c6d3840:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff9c6d3844:	d28cc810 	mov	x16, #0x6640                	// #26176
    ffff9c6d3848:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d384c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d3850:	d63f0200 	blr	x16
    ffff9c6d3854:	f100001f 	cmp	x0, #0x0
    ffff9c6d3858:	54001100 	b.eq	0xffff9c6d3a78  // b.none
    ffff9c6d385c:	f94027e9 	ldr	x9, [sp, #72]
    ffff9c6d3860:	f90037e9 	str	x9, [sp, #104]
    ffff9c6d3864:	f94023e9 	ldr	x9, [sp, #64]
    ffff9c6d3868:	f9003be9 	str	x9, [sp, #112]
    ffff9c6d386c:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d3870:	f2e7fc09 	movk	x9, #0x3fe0, lsl #48
    ffff9c6d3874:	f9003fe9 	str	x9, [sp, #120]
    ffff9c6d3878:	fd4037e0 	ldr	d0, [sp, #104]
    ffff9c6d387c:	fd403fe1 	ldr	d1, [sp, #120]
    ffff9c6d3880:	1e610800 	fmul	d0, d0, d1
    ffff9c6d3884:	fd0043e0 	str	d0, [sp, #128]
    ffff9c6d3888:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d388c:	f2e7fe09 	movk	x9, #0x3ff0, lsl #48
    ffff9c6d3890:	f90047e9 	str	x9, [sp, #136]
    ffff9c6d3894:	fd4047e0 	ldr	d0, [sp, #136]
    ffff9c6d3898:	fd403fe1 	ldr	d1, [sp, #120]
    ffff9c6d389c:	1e613800 	fsub	d0, d0, d1
    ffff9c6d38a0:	fd0047e0 	str	d0, [sp, #136]
    ffff9c6d38a4:	fd403be0 	ldr	d0, [sp, #112]
    ffff9c6d38a8:	fd4047e1 	ldr	d1, [sp, #136]
    ffff9c6d38ac:	1e610800 	fmul	d0, d0, d1
    ffff9c6d38b0:	fd0047e0 	str	d0, [sp, #136]
    ffff9c6d38b4:	fd4043e0 	ldr	d0, [sp, #128]
    ffff9c6d38b8:	fd4047e1 	ldr	d1, [sp, #136]
    ffff9c6d38bc:	1e612800 	fadd	d0, d0, d1
    ffff9c6d38c0:	fd0043e0 	str	d0, [sp, #128]
    ffff9c6d38c4:	f94043e9 	ldr	x9, [sp, #128]
    ffff9c6d38c8:	f9002fe9 	str	x9, [sp, #88]
    ffff9c6d38cc:	f9402fe9 	ldr	x9, [sp, #88]
    ffff9c6d38d0:	f90027e9 	str	x9, [sp, #72]
    ffff9c6d38d4:	f9402be9 	ldr	x9, [sp, #80]
    ffff9c6d38d8:	f9002fe9 	str	x9, [sp, #88]
    ffff9c6d38dc:	91000529 	add	x9, x9, #0x1
    ffff9c6d38e0:	f9002be9 	str	x9, [sp, #80]
    ffff9c6d38e4:	17fffe78 	b	0xffff9c6d32c4
    ffff9c6d38e8:	f94403e9 	ldr	x9, [sp, #2048]
    ffff9c6d38ec:	f100013f 	cmp	x9, #0x0
    ffff9c6d38f0:	54000aa0 	b.eq	0xffff9c6d3a44  // b.none
    ffff9c6d38f4:	aa1303e0 	mov	x0, x19
    ffff9c6d38f8:	d2800041 	mov	x1, #0x2                   	// #2
    ffff9c6d38fc:	910043e2 	add	x2, sp, #0x10
    ffff9c6d3900:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d3904:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d3908:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d390c:	d63f0200 	blr	x16
    ffff9c6d3910:	aa1303e0 	mov	x0, x19
    ffff9c6d3914:	d2800061 	mov	x1, #0x3                   	// #3
    ffff9c6d3918:	910063e2 	add	x2, sp, #0x18
    ffff9c6d391c:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d3920:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d3924:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d3928:	d63f0200 	blr	x16
    ffff9c6d392c:	aa1303e0 	mov	x0, x19
    ffff9c6d3930:	d2800081 	mov	x1, #0x4                   	// #4
    ffff9c6d3934:	910083e2 	add	x2, sp, #0x20
    ffff9c6d3938:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d393c:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d3940:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d3944:	d63f0200 	blr	x16
    ffff9c6d3948:	aa1303e0 	mov	x0, x19
    ffff9c6d394c:	d28000a1 	mov	x1, #0x5                   	// #5
    ffff9c6d3950:	9100a3e2 	add	x2, sp, #0x28
    ffff9c6d3954:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d3958:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d395c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d3960:	d63f0200 	blr	x16
    ffff9c6d3964:	aa1303e0 	mov	x0, x19
    ffff9c6d3968:	d28000c1 	mov	x1, #0x6                   	// #6
    ffff9c6d396c:	9100c3e2 	add	x2, sp, #0x30
    ffff9c6d3970:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d3974:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d3978:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d397c:	d63f0200 	blr	x16
    ffff9c6d3980:	aa1303e0 	mov	x0, x19
    ffff9c6d3984:	d28000e1 	mov	x1, #0x7                   	// #7
    ffff9c6d3988:	9100e3e2 	add	x2, sp, #0x38
    ffff9c6d398c:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d3990:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d3994:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d3998:	d63f0200 	blr	x16
    ffff9c6d399c:	aa1303e0 	mov	x0, x19
    ffff9c6d39a0:	d2800101 	mov	x1, #0x8                   	// #8
    ffff9c6d39a4:	910103e2 	add	x2, sp, #0x40
    ffff9c6d39a8:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d39ac:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d39b0:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d39b4:	d63f0200 	blr	x16
    ffff9c6d39b8:	aa1303e0 	mov	x0, x19
    ffff9c6d39bc:	d2800121 	mov	x1, #0x9                   	// #9
    ffff9c6d39c0:	910123e2 	add	x2, sp, #0x48
    ffff9c6d39c4:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d39c8:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d39cc:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d39d0:	d63f0200 	blr	x16
    ffff9c6d39d4:	aa1303e0 	mov	x0, x19
    ffff9c6d39d8:	d2800141 	mov	x1, #0xa                   	// #10
    ffff9c6d39dc:	f9402be2 	ldr	x2, [sp, #80]
    ffff9c6d39e0:	d282ae10 	mov	x16, #0x1570                	// #5488
    ffff9c6d39e4:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d39e8:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d39ec:	d63f0200 	blr	x16
    ffff9c6d39f0:	aa1303e0 	mov	x0, x19
    ffff9c6d39f4:	d2800161 	mov	x1, #0xb                   	// #11
    ffff9c6d39f8:	f9402fe2 	ldr	x2, [sp, #88]
    ffff9c6d39fc:	d282ae10 	mov	x16, #0x1570                	// #5488
    ffff9c6d3a00:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d3a04:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d3a08:	d63f0200 	blr	x16
    ffff9c6d3a0c:	aa1303e0 	mov	x0, x19
    ffff9c6d3a10:	d28001a1 	mov	x1, #0xd                   	// #13
    ffff9c6d3a14:	9101a3e2 	add	x2, sp, #0x68
    ffff9c6d3a18:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d3a1c:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d3a20:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d3a24:	d63f0200 	blr	x16
    ffff9c6d3a28:	aa1303e0 	mov	x0, x19
    ffff9c6d3a2c:	d28001c1 	mov	x1, #0xe                   	// #14
    ffff9c6d3a30:	9101c3e2 	add	x2, sp, #0x70
    ffff9c6d3a34:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d3a38:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d3a3c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d3a40:	d63f0200 	blr	x16
    ffff9c6d3a44:	d2800649 	mov	x9, #0x32                  	// #50
    ffff9c6d3a48:	f9000289 	str	x9, [x20]
    ffff9c6d3a4c:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d3a50:	d2827e10 	mov	x16, #0x13f0                	// #5104
    ffff9c6d3a54:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d3a58:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d3a5c:	d63f0200 	blr	x16
    ffff9c6d3a60:	913003ff 	add	sp, sp, #0xc00
    ffff9c6d3a64:	a8c15bf5 	ldp	x21, x22, [sp], #16
    ffff9c6d3a68:	a8c153f3 	ldp	x19, x20, [sp], #16
    ffff9c6d3a6c:	a8c17bfd 	ldp	x29, x30, [sp], #16
    ffff9c6d3a70:	d2800020 	mov	x0, #0x1                   	// #1
    ffff9c6d3a74:	d65f03c0 	ret
    ffff9c6d3a78:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d3a7c:	d2828010 	mov	x16, #0x1400                	// #5120
    ffff9c6d3a80:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d3a84:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d3a88:	d63f0200 	blr	x16
    ffff9c6d3a8c:	913003ff 	add	sp, sp, #0xc00
    ffff9c6d3a90:	a8c15bf5 	ldp	x21, x22, [sp], #16
    ffff9c6d3a94:	a8c153f3 	ldp	x19, x20, [sp], #16
    ffff9c6d3a98:	a8c17bfd 	ldp	x29, x30, [sp], #16
    ffff9c6d3a9c:	d2800000 	mov	x0, #0x0                   	// #0
    ffff9c6d3aa0:	d65f03c0 	ret
    ffff9c6d3aa4:	aa1303e0 	mov	x0, x19
    ffff9c6d3aa8:	d2800001 	mov	x1, #0x0                   	// #0
    ffff9c6d3aac:	d28d0302 	mov	x2, #0x6818                	// #26648
    ffff9c6d3ab0:	f2ba77a2 	movk	x2, #0xd3bd, lsl #16
    ffff9c6d3ab4:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6d3ab8:	d2826803 	mov	x3, #0x1340                	// #4928
    ffff9c6d3abc:	f2ba79e3 	movk	x3, #0xd3cf, lsl #16
    ffff9c6d3ac0:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff9c6d3ac4:	d285dd04 	mov	x4, #0x2ee8                	// #12008
    ffff9c6d3ac8:	f2ba7784 	movk	x4, #0xd3bc, lsl #16
    ffff9c6d3acc:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff9c6d3ad0:	d28cc810 	mov	x16, #0x6640                	// #26176
    ffff9c6d3ad4:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d3ad8:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d3adc:	d63f0200 	blr	x16
    ffff9c6d3ae0:	f100001f 	cmp	x0, #0x0
    ffff9c6d3ae4:	54fffca0 	b.eq	0xffff9c6d3a78  // b.none
    ffff9c6d3ae8:	17fffdf7 	b	0xffff9c6d32c4
