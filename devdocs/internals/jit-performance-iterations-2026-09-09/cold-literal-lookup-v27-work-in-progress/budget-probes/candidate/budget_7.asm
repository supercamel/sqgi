Dump of assembler code from 0xfffff7fb3000 to 0xfffff7fb5000:
   0x0000fffff7fb3000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fb3004:	910003fd	mov	x29, sp
   0x0000fffff7fb3008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fb300c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fb3010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fb3014:	aa0003f3	mov	x19, x0
   0x0000fffff7fb3018:	aa0103f4	mov	x20, x1
   0x0000fffff7fb301c:	aa0203f5	mov	x21, x2
   0x0000fffff7fb3020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fb3024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fb3028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fb302c:	f90003e9	str	x9, [sp]
   0x0000fffff7fb3030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fb3034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fb3038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fb303c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fb3040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3044:	d63f0200	blr	x16
   0x0000fffff7fb3048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fb304c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fb3050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fb3054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fb3058:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb305c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb3060:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb3064:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb3068:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb306c:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7fb3070:	36d801d1	tbz	w17, #27, 0xfffff7fb30a8
   0x0000fffff7fb3074:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb3078:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb307c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb3080:	54000281	b.ne	0xfffff7fb30d0  // b.any
   0x0000fffff7fb3084:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7fb3088:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb308c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb3090:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb3094:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb3098:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb309c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb30a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb30a4:	54000169	b.ls	0xfffff7fb30d0  // b.plast
   0x0000fffff7fb30a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb30ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb30b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb30b4:	36d80091	tbz	w17, #27, 0xfffff7fb30c4
   0x0000fffff7fb30b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb30bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb30c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb30c4:	f900166c	str	x12, [x19, #40]
   0x0000fffff7fb30c8:	b900226d	str	w13, [x19, #32]
   0x0000fffff7fb30cc:	1400000e	b	0xfffff7fb3104
   0x0000fffff7fb30d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb30d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb30d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb30dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb30e0:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fb30e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb30e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb30ec:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb30f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb30f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb30f8:	d63f0200	blr	x16
   0x0000fffff7fb30fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3100:	5400d500	b.eq	0xfffff7fb4ba0  // b.none
   0x0000fffff7fb3104:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb3108:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb310c:	d280002c	mov	x12, #0x1                   	// #1
   0x0000fffff7fb3110:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb3114:	36d80211	tbz	w17, #27, 0xfffff7fb3154
   0x0000fffff7fb3118:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb311c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb3120:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb3124:	540001e1	b.ne	0xfffff7fb3160  // b.any
   0x0000fffff7fb3128:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb312c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3130:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb3134:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb3138:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb313c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb3140:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb3144:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb3148:	540000c9	b.ls	0xfffff7fb3160  // b.plast
   0x0000fffff7fb314c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb3150:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb3154:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb3158:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb315c:	1400000e	b	0xfffff7fb3194
   0x0000fffff7fb3160:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb3164:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3168:	aa1303e1	mov	x1, x19
   0x0000fffff7fb316c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3170:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fb3174:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3178:	aa1603e5	mov	x5, x22
   0x0000fffff7fb317c:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7fb3180:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb3184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3188:	d63f0200	blr	x16
   0x0000fffff7fb318c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3190:	5400d0c0	b.eq	0xfffff7fb4ba8  // b.none
   0x0000fffff7fb3194:	b940126d	ldr	w13, [x19, #16]
   0x0000fffff7fb3198:	f9400e6c	ldr	x12, [x19, #24]
   0x0000fffff7fb319c:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7fb31a0:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fb31a4:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fb31a8:	54000100	b.eq	0xfffff7fb31c8  // b.none
   0x0000fffff7fb31ac:	5290000a	mov	w10, #0x8000                	// #32768
   0x0000fffff7fb31b0:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fb31b4:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fb31b8:	54000a21	b.ne	0xfffff7fb32fc  // b.any
   0x0000fffff7fb31bc:	f9401d8b	ldr	x11, [x12, #56]
   0x0000fffff7fb31c0:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7fb31c4:	14000002	b	0xfffff7fb31cc
   0x0000fffff7fb31c8:	aa0c03eb	mov	x11, x12
   0x0000fffff7fb31cc:	f9402569	ldr	x9, [x11, #72]
   0x0000fffff7fb31d0:	d1000529	sub	x9, x9, #0x1
   0x0000fffff7fb31d4:	d298b66a	mov	x10, #0xc5b3                	// #50611
   0x0000fffff7fb31d8:	f2a00f0a	movk	x10, #0x78, lsl #16
   0x0000fffff7fb31dc:	8a09014a	and	x10, x10, x9
   0x0000fffff7fb31e0:	f940216b	ldr	x11, [x11, #64]
   0x0000fffff7fb31e4:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fb31e8:	9b097d4a	mul	x10, x10, x9
   0x0000fffff7fb31ec:	8b0a016b	add	x11, x11, x10
   0x0000fffff7fb31f0:	b9401169	ldr	w9, [x11, #16]
   0x0000fffff7fb31f4:	5280020a	mov	w10, #0x10                  	// #16
   0x0000fffff7fb31f8:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7fb31fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3200:	540007e1	b.ne	0xfffff7fb32fc  // b.any
   0x0000fffff7fb3204:	f9400d69	ldr	x9, [x11, #24]
   0x0000fffff7fb3208:	d299ba0a	mov	x10, #0xcdd0                	// #52688
   0x0000fffff7fb320c:	f2b5580a	movk	x10, #0xaac0, lsl #16
   0x0000fffff7fb3210:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7fb3214:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3218:	54000721	b.ne	0xfffff7fb32fc  // b.any
   0x0000fffff7fb321c:	9100016b	add	x11, x11, #0x0
   0x0000fffff7fb3220:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7fb3224:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fb3228:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fb322c:	540002a0	b.eq	0xfffff7fb3280  // b.none
   0x0000fffff7fb3230:	b9400169	ldr	w9, [x11]
   0x0000fffff7fb3234:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3238:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb323c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3240:	540005e1	b.ne	0xfffff7fb32fc  // b.any
   0x0000fffff7fb3244:	f9400569	ldr	x9, [x11, #8]
   0x0000fffff7fb3248:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7fb324c:	f2a0400a	movk	x10, #0x200, lsl #16
   0x0000fffff7fb3250:	8a0a012a	and	x10, x9, x10
   0x0000fffff7fb3254:	f100015f	cmp	x10, #0x0
   0x0000fffff7fb3258:	54000520	b.eq	0xfffff7fb32fc  // b.none
   0x0000fffff7fb325c:	d29fffea	mov	x10, #0xffff                	// #65535
   0x0000fffff7fb3260:	f2a01fea	movk	x10, #0xff, lsl #16
   0x0000fffff7fb3264:	8a0a0129	and	x9, x9, x10
   0x0000fffff7fb3268:	f9401d8a	ldr	x10, [x12, #56]
   0x0000fffff7fb326c:	f940254a	ldr	x10, [x10, #72]
   0x0000fffff7fb3270:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3274:	54000442	b.cs	0xfffff7fb32fc  // b.hs, b.nlast
   0x0000fffff7fb3278:	9101618b	add	x11, x12, #0x58
   0x0000fffff7fb327c:	8b09116b	add	x11, x11, x9, lsl #4
   0x0000fffff7fb3280:	b90013ed	str	w13, [sp, #16]
   0x0000fffff7fb3284:	f9000fec	str	x12, [sp, #24]
   0x0000fffff7fb3288:	f90017eb	str	x11, [sp, #40]
   0x0000fffff7fb328c:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb3290:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb3294:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb3298:	36d801d1	tbz	w17, #27, 0xfffff7fb32d0
   0x0000fffff7fb329c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb32a0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb32a4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb32a8:	540002a1	b.ne	0xfffff7fb32fc  // b.any
   0x0000fffff7fb32ac:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb32b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb32b4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb32b8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb32bc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb32c0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb32c4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb32c8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb32cc:	54000189	b.ls	0xfffff7fb32fc  // b.plast
   0x0000fffff7fb32d0:	36d8008d	tbz	w13, #27, 0xfffff7fb32e0
   0x0000fffff7fb32d4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb32d8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb32dc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb32e0:	36d80091	tbz	w17, #27, 0xfffff7fb32f0
   0x0000fffff7fb32e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb32e8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb32ec:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb32f0:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb32f4:	b900016d	str	w13, [x11]
   0x0000fffff7fb32f8:	1400000e	b	0xfffff7fb3330
   0x0000fffff7fb32fc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb3300:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3304:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3308:	aa1503e2	mov	x2, x21
   0x0000fffff7fb330c:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fb3310:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3314:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3318:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb331c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb3320:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3324:	d63f0200	blr	x16
   0x0000fffff7fb3328:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb332c:	5400c420	b.eq	0xfffff7fb4bb0  // b.none
   0x0000fffff7fb3330:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb3334:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb3338:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fb333c:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7fb3340:	36d80211	tbz	w17, #27, 0xfffff7fb3380
   0x0000fffff7fb3344:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb3348:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb334c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb3350:	540001e1	b.ne	0xfffff7fb338c  // b.any
   0x0000fffff7fb3354:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7fb3358:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb335c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb3360:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb3364:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb3368:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb336c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb3370:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb3374:	540000c9	b.ls	0xfffff7fb338c  // b.plast
   0x0000fffff7fb3378:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb337c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb3380:	f900166c	str	x12, [x19, #40]
   0x0000fffff7fb3384:	b900226d	str	w13, [x19, #32]
   0x0000fffff7fb3388:	1400000e	b	0xfffff7fb33c0
   0x0000fffff7fb338c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb3390:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3394:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3398:	aa1503e2	mov	x2, x21
   0x0000fffff7fb339c:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7fb33a0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb33a4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb33a8:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7fb33ac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb33b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb33b4:	d63f0200	blr	x16
   0x0000fffff7fb33b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb33bc:	5400bfe0	b.eq	0xfffff7fb4bb8  // b.none
   0x0000fffff7fb33c0:	b940126d	ldr	w13, [x19, #16]
   0x0000fffff7fb33c4:	f9400e6c	ldr	x12, [x19, #24]
   0x0000fffff7fb33c8:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7fb33cc:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fb33d0:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fb33d4:	54000100	b.eq	0xfffff7fb33f4  // b.none
   0x0000fffff7fb33d8:	5290000a	mov	w10, #0x8000                	// #32768
   0x0000fffff7fb33dc:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fb33e0:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fb33e4:	54000b21	b.ne	0xfffff7fb3548  // b.any
   0x0000fffff7fb33e8:	f9401d8b	ldr	x11, [x12, #56]
   0x0000fffff7fb33ec:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7fb33f0:	14000002	b	0xfffff7fb33f8
   0x0000fffff7fb33f4:	aa0c03eb	mov	x11, x12
   0x0000fffff7fb33f8:	f9402569	ldr	x9, [x11, #72]
   0x0000fffff7fb33fc:	d1000529	sub	x9, x9, #0x1
   0x0000fffff7fb3400:	d29ba34a	mov	x10, #0xdd1a                	// #56602
   0x0000fffff7fb3404:	f2a2374a	movk	x10, #0x11ba, lsl #16
   0x0000fffff7fb3408:	8a09014a	and	x10, x10, x9
   0x0000fffff7fb340c:	f940216b	ldr	x11, [x11, #64]
   0x0000fffff7fb3410:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fb3414:	9b097d4a	mul	x10, x10, x9
   0x0000fffff7fb3418:	8b0a016b	add	x11, x11, x10
   0x0000fffff7fb341c:	b9401169	ldr	w9, [x11, #16]
   0x0000fffff7fb3420:	5280020a	mov	w10, #0x10                  	// #16
   0x0000fffff7fb3424:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7fb3428:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb342c:	540008e1	b.ne	0xfffff7fb3548  // b.any
   0x0000fffff7fb3430:	f9400d69	ldr	x9, [x11, #24]
   0x0000fffff7fb3434:	d299d20a	mov	x10, #0xce90                	// #52880
   0x0000fffff7fb3438:	f2b5580a	movk	x10, #0xaac0, lsl #16
   0x0000fffff7fb343c:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7fb3440:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3444:	54000821	b.ne	0xfffff7fb3548  // b.any
   0x0000fffff7fb3448:	9100016b	add	x11, x11, #0x0
   0x0000fffff7fb344c:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7fb3450:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7fb3454:	eb0a01bf	cmp	x13, x10
   0x0000fffff7fb3458:	540002a0	b.eq	0xfffff7fb34ac  // b.none
   0x0000fffff7fb345c:	b9400169	ldr	w9, [x11]
   0x0000fffff7fb3460:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3464:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3468:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb346c:	540006e1	b.ne	0xfffff7fb3548  // b.any
   0x0000fffff7fb3470:	f9400569	ldr	x9, [x11, #8]
   0x0000fffff7fb3474:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7fb3478:	f2a0400a	movk	x10, #0x200, lsl #16
   0x0000fffff7fb347c:	8a0a012a	and	x10, x9, x10
   0x0000fffff7fb3480:	f100015f	cmp	x10, #0x0
   0x0000fffff7fb3484:	54000620	b.eq	0xfffff7fb3548  // b.none
   0x0000fffff7fb3488:	d29fffea	mov	x10, #0xffff                	// #65535
   0x0000fffff7fb348c:	f2a01fea	movk	x10, #0xff, lsl #16
   0x0000fffff7fb3490:	8a0a0129	and	x9, x9, x10
   0x0000fffff7fb3494:	f9401d8a	ldr	x10, [x12, #56]
   0x0000fffff7fb3498:	f940254a	ldr	x10, [x10, #72]
   0x0000fffff7fb349c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb34a0:	54000542	b.cs	0xfffff7fb3548  // b.hs, b.nlast
   0x0000fffff7fb34a4:	9101618b	add	x11, x12, #0x58
   0x0000fffff7fb34a8:	8b09116b	add	x11, x11, x9, lsl #4
   0x0000fffff7fb34ac:	b90033ed	str	w13, [sp, #48]
   0x0000fffff7fb34b0:	f9001fec	str	x12, [sp, #56]
   0x0000fffff7fb34b4:	f90027eb	str	x11, [sp, #72]
   0x0000fffff7fb34b8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb34bc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb34c0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb34c4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb34c8:	54000400	b.eq	0xfffff7fb3548  // b.none
   0x0000fffff7fb34cc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb34d0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb34d4:	36d801d1	tbz	w17, #27, 0xfffff7fb350c
   0x0000fffff7fb34d8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb34dc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb34e0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb34e4:	54000321	b.ne	0xfffff7fb3548  // b.any
   0x0000fffff7fb34e8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb34ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb34f0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb34f4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb34f8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb34fc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb3500:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb3504:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb3508:	54000209	b.ls	0xfffff7fb3548  // b.plast
   0x0000fffff7fb350c:	36d8008d	tbz	w13, #27, 0xfffff7fb351c
   0x0000fffff7fb3510:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb3514:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb3518:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb351c:	36d80091	tbz	w17, #27, 0xfffff7fb352c
   0x0000fffff7fb3520:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3524:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb3528:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb352c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb3530:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb3534:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb3538:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb353c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb3540:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb3544:	1400000e	b	0xfffff7fb357c
   0x0000fffff7fb3548:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb354c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3550:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3554:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3558:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7fb355c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3560:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3564:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb3568:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb356c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3570:	d63f0200	blr	x16
   0x0000fffff7fb3574:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3578:	5400b240	b.eq	0xfffff7fb4bc0  // b.none
   0x0000fffff7fb357c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb3580:	37d806a9	tbnz	w9, #27, 0xfffff7fb3654
   0x0000fffff7fb3584:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb3588:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb358c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3590:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3594:	540001c1	b.ne	0xfffff7fb35cc  // b.any
   0x0000fffff7fb3598:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb359c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb35a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb35a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb35a8:	54000121	b.ne	0xfffff7fb35cc  // b.any
   0x0000fffff7fb35ac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb35b0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb35b4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb35b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb35bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb35c0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb35c4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb35c8:	14000030	b	0xfffff7fb3688
   0x0000fffff7fb35cc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb35d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb35d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb35d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb35dc:	54000120	b.eq	0xfffff7fb3600  // b.none
   0x0000fffff7fb35e0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb35e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb35e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb35ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb35f0:	54000321	b.ne	0xfffff7fb3654  // b.any
   0x0000fffff7fb35f4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb35f8:	9e620120	scvtf	d0, x9
   0x0000fffff7fb35fc:	14000002	b	0xfffff7fb3604
   0x0000fffff7fb3600:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb3604:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb3608:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb360c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3610:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3614:	54000120	b.eq	0xfffff7fb3638  // b.none
   0x0000fffff7fb3618:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb361c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3620:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3624:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3628:	54000161	b.ne	0xfffff7fb3654  // b.any
   0x0000fffff7fb362c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb3630:	9e620121	scvtf	d1, x9
   0x0000fffff7fb3634:	14000002	b	0xfffff7fb363c
   0x0000fffff7fb3638:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb363c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb3640:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb3644:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3648:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb364c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb3650:	17ffffde	b	0xfffff7fb35c8
   0x0000fffff7fb3654:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb3658:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb365c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3660:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3664:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fb3668:	aa1403e4	mov	x4, x20
   0x0000fffff7fb366c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3670:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fb3674:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb3678:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb367c:	d63f0200	blr	x16
   0x0000fffff7fb3680:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3684:	5400aa20	b.eq	0xfffff7fb4bc8  // b.none
   0x0000fffff7fb3688:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb368c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb3690:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb3694:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb3698:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb369c:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb36a0:	36d801d1	tbz	w17, #27, 0xfffff7fb36d8
   0x0000fffff7fb36a4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb36a8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb36ac:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb36b0:	54000281	b.ne	0xfffff7fb3700  // b.any
   0x0000fffff7fb36b4:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb36b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb36bc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb36c0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb36c4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb36c8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb36cc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb36d0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb36d4:	54000169	b.ls	0xfffff7fb3700  // b.plast
   0x0000fffff7fb36d8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb36dc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb36e0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb36e4:	36d80091	tbz	w17, #27, 0xfffff7fb36f4
   0x0000fffff7fb36e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb36ec:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb36f0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb36f4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb36f8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb36fc:	1400000e	b	0xfffff7fb3734
   0x0000fffff7fb3700:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb3704:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3708:	aa1303e1	mov	x1, x19
   0x0000fffff7fb370c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3710:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fb3714:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3718:	aa1603e5	mov	x5, x22
   0x0000fffff7fb371c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb3720:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb3724:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3728:	d63f0200	blr	x16
   0x0000fffff7fb372c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3730:	5400a500	b.eq	0xfffff7fb4bd0  // b.none
   0x0000fffff7fb3734:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb3738:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb373c:	540003a0	b.eq	0xfffff7fb37b0  // b.none
   0x0000fffff7fb3740:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb3744:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb3748:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb374c:	36d801d1	tbz	w17, #27, 0xfffff7fb3784
   0x0000fffff7fb3750:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb3754:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb3758:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb375c:	540002a1	b.ne	0xfffff7fb37b0  // b.any
   0x0000fffff7fb3760:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb3764:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3768:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb376c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb3770:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb3774:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb3778:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb377c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb3780:	54000189	b.ls	0xfffff7fb37b0  // b.plast
   0x0000fffff7fb3784:	36d8008d	tbz	w13, #27, 0xfffff7fb3794
   0x0000fffff7fb3788:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb378c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb3790:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb3794:	36d80091	tbz	w17, #27, 0xfffff7fb37a4
   0x0000fffff7fb3798:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb379c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb37a0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb37a4:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb37a8:	b900016d	str	w13, [x11]
   0x0000fffff7fb37ac:	1400000e	b	0xfffff7fb37e4
   0x0000fffff7fb37b0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb37b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb37b8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb37bc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb37c0:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fb37c4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb37c8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb37cc:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb37d0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb37d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb37d8:	d63f0200	blr	x16
   0x0000fffff7fb37dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb37e0:	54009fc0	b.eq	0xfffff7fb4bd8  // b.none
   0x0000fffff7fb37e4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb37e8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb37ec:	540004a0	b.eq	0xfffff7fb3880  // b.none
   0x0000fffff7fb37f0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb37f4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb37f8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb37fc:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb3800:	54000400	b.eq	0xfffff7fb3880  // b.none
   0x0000fffff7fb3804:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb3808:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb380c:	36d801d1	tbz	w17, #27, 0xfffff7fb3844
   0x0000fffff7fb3810:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb3814:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb3818:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb381c:	54000321	b.ne	0xfffff7fb3880  // b.any
   0x0000fffff7fb3820:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb3824:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3828:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb382c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb3830:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb3834:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb3838:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb383c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb3840:	54000209	b.ls	0xfffff7fb3880  // b.plast
   0x0000fffff7fb3844:	36d8008d	tbz	w13, #27, 0xfffff7fb3854
   0x0000fffff7fb3848:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb384c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb3850:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb3854:	36d80091	tbz	w17, #27, 0xfffff7fb3864
   0x0000fffff7fb3858:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb385c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb3860:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb3864:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb3868:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb386c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb3870:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb3874:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb3878:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb387c:	1400000e	b	0xfffff7fb38b4
   0x0000fffff7fb3880:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb3884:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3888:	aa1303e1	mov	x1, x19
   0x0000fffff7fb388c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3890:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fb3894:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3898:	aa1603e5	mov	x5, x22
   0x0000fffff7fb389c:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb38a0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb38a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb38a8:	d63f0200	blr	x16
   0x0000fffff7fb38ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb38b0:	54009980	b.eq	0xfffff7fb4be0  // b.none
   0x0000fffff7fb38b4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb38b8:	37d806a9	tbnz	w9, #27, 0xfffff7fb398c
   0x0000fffff7fb38bc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb38c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb38c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb38c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb38cc:	540001c1	b.ne	0xfffff7fb3904  // b.any
   0x0000fffff7fb38d0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb38d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb38d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb38dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb38e0:	54000121	b.ne	0xfffff7fb3904  // b.any
   0x0000fffff7fb38e4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb38e8:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb38ec:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb38f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb38f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb38f8:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb38fc:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb3900:	14000030	b	0xfffff7fb39c0
   0x0000fffff7fb3904:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb3908:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb390c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3910:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3914:	54000120	b.eq	0xfffff7fb3938  // b.none
   0x0000fffff7fb3918:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb391c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3920:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3924:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3928:	54000321	b.ne	0xfffff7fb398c  // b.any
   0x0000fffff7fb392c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb3930:	9e620120	scvtf	d0, x9
   0x0000fffff7fb3934:	14000002	b	0xfffff7fb393c
   0x0000fffff7fb3938:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb393c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb3940:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3944:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3948:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb394c:	54000120	b.eq	0xfffff7fb3970  // b.none
   0x0000fffff7fb3950:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb3954:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3958:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb395c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3960:	54000161	b.ne	0xfffff7fb398c  // b.any
   0x0000fffff7fb3964:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb3968:	9e620121	scvtf	d1, x9
   0x0000fffff7fb396c:	14000002	b	0xfffff7fb3974
   0x0000fffff7fb3970:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb3974:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb3978:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb397c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3980:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3984:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb3988:	17ffffde	b	0xfffff7fb3900
   0x0000fffff7fb398c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb3990:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3994:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3998:	aa1503e2	mov	x2, x21
   0x0000fffff7fb399c:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fb39a0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb39a4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb39a8:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fb39ac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb39b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb39b4:	d63f0200	blr	x16
   0x0000fffff7fb39b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb39bc:	54009160	b.eq	0xfffff7fb4be8  // b.none
   0x0000fffff7fb39c0:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb39c4:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb39c8:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb39cc:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb39d0:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb39d4:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb39d8:	36d801d1	tbz	w17, #27, 0xfffff7fb3a10
   0x0000fffff7fb39dc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb39e0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb39e4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb39e8:	54000281	b.ne	0xfffff7fb3a38  // b.any
   0x0000fffff7fb39ec:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb39f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb39f4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb39f8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb39fc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb3a00:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb3a04:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb3a08:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb3a0c:	54000169	b.ls	0xfffff7fb3a38  // b.plast
   0x0000fffff7fb3a10:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb3a14:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb3a18:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb3a1c:	36d80091	tbz	w17, #27, 0xfffff7fb3a2c
   0x0000fffff7fb3a20:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3a24:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb3a28:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb3a2c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb3a30:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb3a34:	1400000e	b	0xfffff7fb3a6c
   0x0000fffff7fb3a38:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb3a3c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3a40:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3a44:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3a48:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fb3a4c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3a50:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3a54:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb3a58:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb3a5c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3a60:	d63f0200	blr	x16
   0x0000fffff7fb3a64:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3a68:	54008c40	b.eq	0xfffff7fb4bf0  // b.none
   0x0000fffff7fb3a6c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb3a70:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb3a74:	540003a0	b.eq	0xfffff7fb3ae8  // b.none
   0x0000fffff7fb3a78:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb3a7c:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb3a80:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb3a84:	36d801d1	tbz	w17, #27, 0xfffff7fb3abc
   0x0000fffff7fb3a88:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb3a8c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb3a90:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb3a94:	540002a1	b.ne	0xfffff7fb3ae8  // b.any
   0x0000fffff7fb3a98:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb3a9c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3aa0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb3aa4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb3aa8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb3aac:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb3ab0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb3ab4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb3ab8:	54000189	b.ls	0xfffff7fb3ae8  // b.plast
   0x0000fffff7fb3abc:	36d8008d	tbz	w13, #27, 0xfffff7fb3acc
   0x0000fffff7fb3ac0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb3ac4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb3ac8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb3acc:	36d80091	tbz	w17, #27, 0xfffff7fb3adc
   0x0000fffff7fb3ad0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3ad4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb3ad8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb3adc:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb3ae0:	b900016d	str	w13, [x11]
   0x0000fffff7fb3ae4:	1400000e	b	0xfffff7fb3b1c
   0x0000fffff7fb3ae8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb3aec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3af0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3af4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3af8:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fb3afc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3b00:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3b04:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb3b08:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb3b0c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3b10:	d63f0200	blr	x16
   0x0000fffff7fb3b14:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3b18:	54008700	b.eq	0xfffff7fb4bf8  // b.none
   0x0000fffff7fb3b1c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb3b20:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb3b24:	540004a0	b.eq	0xfffff7fb3bb8  // b.none
   0x0000fffff7fb3b28:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb3b2c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb3b30:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb3b34:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb3b38:	54000400	b.eq	0xfffff7fb3bb8  // b.none
   0x0000fffff7fb3b3c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb3b40:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb3b44:	36d801d1	tbz	w17, #27, 0xfffff7fb3b7c
   0x0000fffff7fb3b48:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb3b4c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb3b50:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb3b54:	54000321	b.ne	0xfffff7fb3bb8  // b.any
   0x0000fffff7fb3b58:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb3b5c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3b60:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb3b64:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb3b68:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb3b6c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb3b70:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb3b74:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb3b78:	54000209	b.ls	0xfffff7fb3bb8  // b.plast
   0x0000fffff7fb3b7c:	36d8008d	tbz	w13, #27, 0xfffff7fb3b8c
   0x0000fffff7fb3b80:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb3b84:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb3b88:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb3b8c:	36d80091	tbz	w17, #27, 0xfffff7fb3b9c
   0x0000fffff7fb3b90:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3b94:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb3b98:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb3b9c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb3ba0:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb3ba4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb3ba8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb3bac:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb3bb0:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb3bb4:	1400000e	b	0xfffff7fb3bec
   0x0000fffff7fb3bb8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb3bbc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3bc0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3bc4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3bc8:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fb3bcc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3bd0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3bd4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb3bd8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb3bdc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3be0:	d63f0200	blr	x16
   0x0000fffff7fb3be4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3be8:	540080c0	b.eq	0xfffff7fb4c00  // b.none
   0x0000fffff7fb3bec:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb3bf0:	37d806a9	tbnz	w9, #27, 0xfffff7fb3cc4
   0x0000fffff7fb3bf4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb3bf8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3bfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3c00:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3c04:	540001c1	b.ne	0xfffff7fb3c3c  // b.any
   0x0000fffff7fb3c08:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb3c0c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3c10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3c14:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3c18:	54000121	b.ne	0xfffff7fb3c3c  // b.any
   0x0000fffff7fb3c1c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb3c20:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb3c24:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb3c28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3c2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3c30:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb3c34:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb3c38:	14000030	b	0xfffff7fb3cf8
   0x0000fffff7fb3c3c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb3c40:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3c44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3c48:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3c4c:	54000120	b.eq	0xfffff7fb3c70  // b.none
   0x0000fffff7fb3c50:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb3c54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3c58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3c5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3c60:	54000321	b.ne	0xfffff7fb3cc4  // b.any
   0x0000fffff7fb3c64:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb3c68:	9e620120	scvtf	d0, x9
   0x0000fffff7fb3c6c:	14000002	b	0xfffff7fb3c74
   0x0000fffff7fb3c70:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb3c74:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb3c78:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3c7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3c80:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3c84:	54000120	b.eq	0xfffff7fb3ca8  // b.none
   0x0000fffff7fb3c88:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb3c8c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3c90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3c94:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3c98:	54000161	b.ne	0xfffff7fb3cc4  // b.any
   0x0000fffff7fb3c9c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb3ca0:	9e620121	scvtf	d1, x9
   0x0000fffff7fb3ca4:	14000002	b	0xfffff7fb3cac
   0x0000fffff7fb3ca8:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb3cac:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb3cb0:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb3cb4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3cb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3cbc:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb3cc0:	17ffffde	b	0xfffff7fb3c38
   0x0000fffff7fb3cc4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb3cc8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3ccc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3cd0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3cd4:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fb3cd8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3cdc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3ce0:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fb3ce4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb3ce8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3cec:	d63f0200	blr	x16
   0x0000fffff7fb3cf0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3cf4:	540078a0	b.eq	0xfffff7fb4c08  // b.none
   0x0000fffff7fb3cf8:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb3cfc:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb3d00:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb3d04:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb3d08:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb3d0c:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb3d10:	36d801d1	tbz	w17, #27, 0xfffff7fb3d48
   0x0000fffff7fb3d14:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb3d18:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb3d1c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb3d20:	54000281	b.ne	0xfffff7fb3d70  // b.any
   0x0000fffff7fb3d24:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb3d28:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3d2c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb3d30:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb3d34:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb3d38:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb3d3c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb3d40:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb3d44:	54000169	b.ls	0xfffff7fb3d70  // b.plast
   0x0000fffff7fb3d48:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb3d4c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb3d50:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb3d54:	36d80091	tbz	w17, #27, 0xfffff7fb3d64
   0x0000fffff7fb3d58:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3d5c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb3d60:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb3d64:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb3d68:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb3d6c:	1400000e	b	0xfffff7fb3da4
   0x0000fffff7fb3d70:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb3d74:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3d78:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3d7c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3d80:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fb3d84:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3d88:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3d8c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb3d90:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb3d94:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3d98:	d63f0200	blr	x16
   0x0000fffff7fb3d9c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3da0:	54007380	b.eq	0xfffff7fb4c10  // b.none
   0x0000fffff7fb3da4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb3da8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb3dac:	540003a0	b.eq	0xfffff7fb3e20  // b.none
   0x0000fffff7fb3db0:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb3db4:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb3db8:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb3dbc:	36d801d1	tbz	w17, #27, 0xfffff7fb3df4
   0x0000fffff7fb3dc0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb3dc4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb3dc8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb3dcc:	540002a1	b.ne	0xfffff7fb3e20  // b.any
   0x0000fffff7fb3dd0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb3dd4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3dd8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb3ddc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb3de0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb3de4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb3de8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb3dec:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb3df0:	54000189	b.ls	0xfffff7fb3e20  // b.plast
   0x0000fffff7fb3df4:	36d8008d	tbz	w13, #27, 0xfffff7fb3e04
   0x0000fffff7fb3df8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb3dfc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb3e00:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb3e04:	36d80091	tbz	w17, #27, 0xfffff7fb3e14
   0x0000fffff7fb3e08:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3e0c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb3e10:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb3e14:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb3e18:	b900016d	str	w13, [x11]
   0x0000fffff7fb3e1c:	1400000e	b	0xfffff7fb3e54
   0x0000fffff7fb3e20:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb3e24:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3e28:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3e2c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3e30:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fb3e34:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3e38:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3e3c:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb3e40:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb3e44:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3e48:	d63f0200	blr	x16
   0x0000fffff7fb3e4c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3e50:	54006e40	b.eq	0xfffff7fb4c18  // b.none
   0x0000fffff7fb3e54:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb3e58:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb3e5c:	540004a0	b.eq	0xfffff7fb3ef0  // b.none
   0x0000fffff7fb3e60:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb3e64:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb3e68:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb3e6c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb3e70:	54000400	b.eq	0xfffff7fb3ef0  // b.none
   0x0000fffff7fb3e74:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb3e78:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb3e7c:	36d801d1	tbz	w17, #27, 0xfffff7fb3eb4
   0x0000fffff7fb3e80:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb3e84:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb3e88:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb3e8c:	54000321	b.ne	0xfffff7fb3ef0  // b.any
   0x0000fffff7fb3e90:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb3e94:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3e98:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb3e9c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb3ea0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb3ea4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb3ea8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb3eac:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb3eb0:	54000209	b.ls	0xfffff7fb3ef0  // b.plast
   0x0000fffff7fb3eb4:	36d8008d	tbz	w13, #27, 0xfffff7fb3ec4
   0x0000fffff7fb3eb8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb3ebc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb3ec0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb3ec4:	36d80091	tbz	w17, #27, 0xfffff7fb3ed4
   0x0000fffff7fb3ec8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3ecc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb3ed0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb3ed4:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb3ed8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb3edc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb3ee0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb3ee4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb3ee8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb3eec:	1400000e	b	0xfffff7fb3f24
   0x0000fffff7fb3ef0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb3ef4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3ef8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3efc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3f00:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fb3f04:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3f08:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3f0c:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb3f10:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb3f14:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3f18:	d63f0200	blr	x16
   0x0000fffff7fb3f1c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3f20:	54006800	b.eq	0xfffff7fb4c20  // b.none
   0x0000fffff7fb3f24:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb3f28:	37d806a9	tbnz	w9, #27, 0xfffff7fb3ffc
   0x0000fffff7fb3f2c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb3f30:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3f34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3f38:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3f3c:	540001c1	b.ne	0xfffff7fb3f74  // b.any
   0x0000fffff7fb3f40:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb3f44:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3f48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3f4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3f50:	54000121	b.ne	0xfffff7fb3f74  // b.any
   0x0000fffff7fb3f54:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb3f58:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb3f5c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb3f60:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3f64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3f68:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb3f6c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb3f70:	14000030	b	0xfffff7fb4030
   0x0000fffff7fb3f74:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb3f78:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3f7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3f80:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3f84:	54000120	b.eq	0xfffff7fb3fa8  // b.none
   0x0000fffff7fb3f88:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb3f8c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3f90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3f94:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3f98:	54000321	b.ne	0xfffff7fb3ffc  // b.any
   0x0000fffff7fb3f9c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb3fa0:	9e620120	scvtf	d0, x9
   0x0000fffff7fb3fa4:	14000002	b	0xfffff7fb3fac
   0x0000fffff7fb3fa8:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb3fac:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb3fb0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3fb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3fb8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3fbc:	54000120	b.eq	0xfffff7fb3fe0  // b.none
   0x0000fffff7fb3fc0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb3fc4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3fc8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3fcc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3fd0:	54000161	b.ne	0xfffff7fb3ffc  // b.any
   0x0000fffff7fb3fd4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb3fd8:	9e620121	scvtf	d1, x9
   0x0000fffff7fb3fdc:	14000002	b	0xfffff7fb3fe4
   0x0000fffff7fb3fe0:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb3fe4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb3fe8:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb3fec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3ff0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3ff4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb3ff8:	17ffffde	b	0xfffff7fb3f70
   0x0000fffff7fb3ffc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb4000:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4004:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4008:	aa1503e2	mov	x2, x21
   0x0000fffff7fb400c:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fb4010:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4014:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4018:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fb401c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb4020:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4024:	d63f0200	blr	x16
   0x0000fffff7fb4028:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb402c:	54005fe0	b.eq	0xfffff7fb4c28  // b.none
   0x0000fffff7fb4030:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb4034:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb4038:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb403c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb4040:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb4044:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb4048:	36d801d1	tbz	w17, #27, 0xfffff7fb4080
   0x0000fffff7fb404c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb4050:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4054:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4058:	54000281	b.ne	0xfffff7fb40a8  // b.any
   0x0000fffff7fb405c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb4060:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4064:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4068:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb406c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4070:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4074:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4078:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb407c:	54000169	b.ls	0xfffff7fb40a8  // b.plast
   0x0000fffff7fb4080:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb4084:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4088:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb408c:	36d80091	tbz	w17, #27, 0xfffff7fb409c
   0x0000fffff7fb4090:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4094:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4098:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb409c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb40a0:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb40a4:	1400000e	b	0xfffff7fb40dc
   0x0000fffff7fb40a8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb40ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb40b0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb40b4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb40b8:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fb40bc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb40c0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb40c4:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb40c8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb40cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb40d0:	d63f0200	blr	x16
   0x0000fffff7fb40d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb40d8:	54005ac0	b.eq	0xfffff7fb4c30  // b.none
   0x0000fffff7fb40dc:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb40e0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb40e4:	540003a0	b.eq	0xfffff7fb4158  // b.none
   0x0000fffff7fb40e8:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb40ec:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb40f0:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb40f4:	36d801d1	tbz	w17, #27, 0xfffff7fb412c
   0x0000fffff7fb40f8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb40fc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4100:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4104:	540002a1	b.ne	0xfffff7fb4158  // b.any
   0x0000fffff7fb4108:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb410c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4110:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4114:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4118:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb411c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4120:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4124:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4128:	54000189	b.ls	0xfffff7fb4158  // b.plast
   0x0000fffff7fb412c:	36d8008d	tbz	w13, #27, 0xfffff7fb413c
   0x0000fffff7fb4130:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb4134:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4138:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb413c:	36d80091	tbz	w17, #27, 0xfffff7fb414c
   0x0000fffff7fb4140:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4144:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4148:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb414c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb4150:	b900016d	str	w13, [x11]
   0x0000fffff7fb4154:	1400000e	b	0xfffff7fb418c
   0x0000fffff7fb4158:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb415c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4160:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4164:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4168:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fb416c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4170:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4174:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb4178:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb417c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4180:	d63f0200	blr	x16
   0x0000fffff7fb4184:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4188:	54005580	b.eq	0xfffff7fb4c38  // b.none
   0x0000fffff7fb418c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb4190:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb4194:	540004a0	b.eq	0xfffff7fb4228  // b.none
   0x0000fffff7fb4198:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb419c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb41a0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb41a4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb41a8:	54000400	b.eq	0xfffff7fb4228  // b.none
   0x0000fffff7fb41ac:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb41b0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb41b4:	36d801d1	tbz	w17, #27, 0xfffff7fb41ec
   0x0000fffff7fb41b8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb41bc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb41c0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb41c4:	54000321	b.ne	0xfffff7fb4228  // b.any
   0x0000fffff7fb41c8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb41cc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb41d0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb41d4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb41d8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb41dc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb41e0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb41e4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb41e8:	54000209	b.ls	0xfffff7fb4228  // b.plast
   0x0000fffff7fb41ec:	36d8008d	tbz	w13, #27, 0xfffff7fb41fc
   0x0000fffff7fb41f0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb41f4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb41f8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb41fc:	36d80091	tbz	w17, #27, 0xfffff7fb420c
   0x0000fffff7fb4200:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4204:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4208:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb420c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb4210:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb4214:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb4218:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb421c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb4220:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb4224:	1400000e	b	0xfffff7fb425c
   0x0000fffff7fb4228:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb422c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4230:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4234:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4238:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fb423c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4240:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4244:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb4248:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb424c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4250:	d63f0200	blr	x16
   0x0000fffff7fb4254:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4258:	54004f40	b.eq	0xfffff7fb4c40  // b.none
   0x0000fffff7fb425c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb4260:	37d806a9	tbnz	w9, #27, 0xfffff7fb4334
   0x0000fffff7fb4264:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb4268:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb426c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4270:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4274:	540001c1	b.ne	0xfffff7fb42ac  // b.any
   0x0000fffff7fb4278:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb427c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4280:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4284:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4288:	54000121	b.ne	0xfffff7fb42ac  // b.any
   0x0000fffff7fb428c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb4290:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb4294:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb4298:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb429c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb42a0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb42a4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb42a8:	14000030	b	0xfffff7fb4368
   0x0000fffff7fb42ac:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb42b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb42b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb42b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb42bc:	54000120	b.eq	0xfffff7fb42e0  // b.none
   0x0000fffff7fb42c0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb42c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb42c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb42cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb42d0:	54000321	b.ne	0xfffff7fb4334  // b.any
   0x0000fffff7fb42d4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb42d8:	9e620120	scvtf	d0, x9
   0x0000fffff7fb42dc:	14000002	b	0xfffff7fb42e4
   0x0000fffff7fb42e0:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb42e4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb42e8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb42ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb42f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb42f4:	54000120	b.eq	0xfffff7fb4318  // b.none
   0x0000fffff7fb42f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb42fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4300:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4304:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4308:	54000161	b.ne	0xfffff7fb4334  // b.any
   0x0000fffff7fb430c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb4310:	9e620121	scvtf	d1, x9
   0x0000fffff7fb4314:	14000002	b	0xfffff7fb431c
   0x0000fffff7fb4318:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb431c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb4320:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb4324:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4328:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb432c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb4330:	17ffffde	b	0xfffff7fb42a8
   0x0000fffff7fb4334:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb4338:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb433c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4340:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4344:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fb4348:	aa1403e4	mov	x4, x20
   0x0000fffff7fb434c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4350:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fb4354:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb4358:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb435c:	d63f0200	blr	x16
   0x0000fffff7fb4360:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4364:	54004720	b.eq	0xfffff7fb4c48  // b.none
   0x0000fffff7fb4368:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb436c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb4370:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb4374:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb4378:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb437c:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb4380:	36d801d1	tbz	w17, #27, 0xfffff7fb43b8
   0x0000fffff7fb4384:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb4388:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb438c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4390:	54000281	b.ne	0xfffff7fb43e0  // b.any
   0x0000fffff7fb4394:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb4398:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb439c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb43a0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb43a4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb43a8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb43ac:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb43b0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb43b4:	54000169	b.ls	0xfffff7fb43e0  // b.plast
   0x0000fffff7fb43b8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb43bc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb43c0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb43c4:	36d80091	tbz	w17, #27, 0xfffff7fb43d4
   0x0000fffff7fb43c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb43cc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb43d0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb43d4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb43d8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb43dc:	1400000e	b	0xfffff7fb4414
   0x0000fffff7fb43e0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb43e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb43e8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb43ec:	aa1503e2	mov	x2, x21
   0x0000fffff7fb43f0:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fb43f4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb43f8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb43fc:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb4400:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb4404:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4408:	d63f0200	blr	x16
   0x0000fffff7fb440c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4410:	54004200	b.eq	0xfffff7fb4c50  // b.none
   0x0000fffff7fb4414:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb4418:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb441c:	540003a0	b.eq	0xfffff7fb4490  // b.none
   0x0000fffff7fb4420:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb4424:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb4428:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb442c:	36d801d1	tbz	w17, #27, 0xfffff7fb4464
   0x0000fffff7fb4430:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb4434:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4438:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb443c:	540002a1	b.ne	0xfffff7fb4490  // b.any
   0x0000fffff7fb4440:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb4444:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4448:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb444c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4450:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4454:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4458:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb445c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4460:	54000189	b.ls	0xfffff7fb4490  // b.plast
   0x0000fffff7fb4464:	36d8008d	tbz	w13, #27, 0xfffff7fb4474
   0x0000fffff7fb4468:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb446c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4470:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb4474:	36d80091	tbz	w17, #27, 0xfffff7fb4484
   0x0000fffff7fb4478:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb447c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4480:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4484:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb4488:	b900016d	str	w13, [x11]
   0x0000fffff7fb448c:	1400000e	b	0xfffff7fb44c4
   0x0000fffff7fb4490:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb4494:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4498:	aa1303e1	mov	x1, x19
   0x0000fffff7fb449c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb44a0:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fb44a4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb44a8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb44ac:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb44b0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb44b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb44b8:	d63f0200	blr	x16
   0x0000fffff7fb44bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb44c0:	54003cc0	b.eq	0xfffff7fb4c58  // b.none
   0x0000fffff7fb44c4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb44c8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb44cc:	540004a0	b.eq	0xfffff7fb4560  // b.none
   0x0000fffff7fb44d0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb44d4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb44d8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb44dc:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb44e0:	54000400	b.eq	0xfffff7fb4560  // b.none
   0x0000fffff7fb44e4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb44e8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb44ec:	36d801d1	tbz	w17, #27, 0xfffff7fb4524
   0x0000fffff7fb44f0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb44f4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb44f8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb44fc:	54000321	b.ne	0xfffff7fb4560  // b.any
   0x0000fffff7fb4500:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb4504:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4508:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb450c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4510:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4514:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4518:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb451c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4520:	54000209	b.ls	0xfffff7fb4560  // b.plast
   0x0000fffff7fb4524:	36d8008d	tbz	w13, #27, 0xfffff7fb4534
   0x0000fffff7fb4528:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb452c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4530:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb4534:	36d80091	tbz	w17, #27, 0xfffff7fb4544
   0x0000fffff7fb4538:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb453c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4540:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4544:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb4548:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb454c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb4550:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb4554:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb4558:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb455c:	1400000e	b	0xfffff7fb4594
   0x0000fffff7fb4560:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb4564:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4568:	aa1303e1	mov	x1, x19
   0x0000fffff7fb456c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4570:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fb4574:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4578:	aa1603e5	mov	x5, x22
   0x0000fffff7fb457c:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb4580:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb4584:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4588:	d63f0200	blr	x16
   0x0000fffff7fb458c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4590:	54003680	b.eq	0xfffff7fb4c60  // b.none
   0x0000fffff7fb4594:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb4598:	37d806a9	tbnz	w9, #27, 0xfffff7fb466c
   0x0000fffff7fb459c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb45a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb45a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb45a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb45ac:	540001c1	b.ne	0xfffff7fb45e4  // b.any
   0x0000fffff7fb45b0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb45b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb45b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb45bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb45c0:	54000121	b.ne	0xfffff7fb45e4  // b.any
   0x0000fffff7fb45c4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb45c8:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb45cc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb45d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb45d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb45d8:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb45dc:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb45e0:	14000030	b	0xfffff7fb46a0
   0x0000fffff7fb45e4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb45e8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb45ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb45f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb45f4:	54000120	b.eq	0xfffff7fb4618  // b.none
   0x0000fffff7fb45f8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb45fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4600:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4604:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4608:	54000321	b.ne	0xfffff7fb466c  // b.any
   0x0000fffff7fb460c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb4610:	9e620120	scvtf	d0, x9
   0x0000fffff7fb4614:	14000002	b	0xfffff7fb461c
   0x0000fffff7fb4618:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb461c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb4620:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4624:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4628:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb462c:	54000120	b.eq	0xfffff7fb4650  // b.none
   0x0000fffff7fb4630:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb4634:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4638:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb463c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4640:	54000161	b.ne	0xfffff7fb466c  // b.any
   0x0000fffff7fb4644:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb4648:	9e620121	scvtf	d1, x9
   0x0000fffff7fb464c:	14000002	b	0xfffff7fb4654
   0x0000fffff7fb4650:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb4654:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb4658:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb465c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4660:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4664:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb4668:	17ffffde	b	0xfffff7fb45e0
   0x0000fffff7fb466c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb4670:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4674:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4678:	aa1503e2	mov	x2, x21
   0x0000fffff7fb467c:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fb4680:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4684:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4688:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fb468c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb4690:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4694:	d63f0200	blr	x16
   0x0000fffff7fb4698:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb469c:	54002e60	b.eq	0xfffff7fb4c68  // b.none
   0x0000fffff7fb46a0:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb46a4:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb46a8:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb46ac:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb46b0:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb46b4:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb46b8:	36d801d1	tbz	w17, #27, 0xfffff7fb46f0
   0x0000fffff7fb46bc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb46c0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb46c4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb46c8:	54000281	b.ne	0xfffff7fb4718  // b.any
   0x0000fffff7fb46cc:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb46d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb46d4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb46d8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb46dc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb46e0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb46e4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb46e8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb46ec:	54000169	b.ls	0xfffff7fb4718  // b.plast
   0x0000fffff7fb46f0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb46f4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb46f8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb46fc:	36d80091	tbz	w17, #27, 0xfffff7fb470c
   0x0000fffff7fb4700:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4704:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4708:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb470c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb4710:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb4714:	1400000e	b	0xfffff7fb474c
   0x0000fffff7fb4718:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb471c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4720:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4724:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4728:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fb472c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4730:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4734:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb4738:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb473c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4740:	d63f0200	blr	x16
   0x0000fffff7fb4744:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4748:	54002940	b.eq	0xfffff7fb4c70  // b.none
   0x0000fffff7fb474c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb4750:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb4754:	540003a0	b.eq	0xfffff7fb47c8  // b.none
   0x0000fffff7fb4758:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb475c:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb4760:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb4764:	36d801d1	tbz	w17, #27, 0xfffff7fb479c
   0x0000fffff7fb4768:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb476c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4770:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4774:	540002a1	b.ne	0xfffff7fb47c8  // b.any
   0x0000fffff7fb4778:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb477c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4780:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4784:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4788:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb478c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4790:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4794:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4798:	54000189	b.ls	0xfffff7fb47c8  // b.plast
   0x0000fffff7fb479c:	36d8008d	tbz	w13, #27, 0xfffff7fb47ac
   0x0000fffff7fb47a0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb47a4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb47a8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb47ac:	36d80091	tbz	w17, #27, 0xfffff7fb47bc
   0x0000fffff7fb47b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb47b4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb47b8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb47bc:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb47c0:	b900016d	str	w13, [x11]
   0x0000fffff7fb47c4:	1400000e	b	0xfffff7fb47fc
   0x0000fffff7fb47c8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb47cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb47d0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb47d4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb47d8:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fb47dc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb47e0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb47e4:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb47e8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb47ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb47f0:	d63f0200	blr	x16
   0x0000fffff7fb47f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb47f8:	54002400	b.eq	0xfffff7fb4c78  // b.none
   0x0000fffff7fb47fc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb4800:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb4804:	540004a0	b.eq	0xfffff7fb4898  // b.none
   0x0000fffff7fb4808:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb480c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb4810:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb4814:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb4818:	54000400	b.eq	0xfffff7fb4898  // b.none
   0x0000fffff7fb481c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb4820:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb4824:	36d801d1	tbz	w17, #27, 0xfffff7fb485c
   0x0000fffff7fb4828:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb482c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4830:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4834:	54000321	b.ne	0xfffff7fb4898  // b.any
   0x0000fffff7fb4838:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb483c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4840:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4844:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4848:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb484c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4850:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4854:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4858:	54000209	b.ls	0xfffff7fb4898  // b.plast
   0x0000fffff7fb485c:	36d8008d	tbz	w13, #27, 0xfffff7fb486c
   0x0000fffff7fb4860:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb4864:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4868:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb486c:	36d80091	tbz	w17, #27, 0xfffff7fb487c
   0x0000fffff7fb4870:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4874:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4878:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb487c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb4880:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb4884:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb4888:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb488c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb4890:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb4894:	1400000e	b	0xfffff7fb48cc
   0x0000fffff7fb4898:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb489c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb48a0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb48a4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb48a8:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fb48ac:	aa1403e4	mov	x4, x20
   0x0000fffff7fb48b0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb48b4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb48b8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb48bc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb48c0:	d63f0200	blr	x16
   0x0000fffff7fb48c4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb48c8:	54001dc0	b.eq	0xfffff7fb4c80  // b.none
   0x0000fffff7fb48cc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb48d0:	37d806a9	tbnz	w9, #27, 0xfffff7fb49a4
   0x0000fffff7fb48d4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb48d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb48dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb48e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb48e4:	540001c1	b.ne	0xfffff7fb491c  // b.any
   0x0000fffff7fb48e8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb48ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb48f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb48f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb48f8:	54000121	b.ne	0xfffff7fb491c  // b.any
   0x0000fffff7fb48fc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb4900:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb4904:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb4908:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb490c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4910:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb4914:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb4918:	14000030	b	0xfffff7fb49d8
   0x0000fffff7fb491c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb4920:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4924:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4928:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb492c:	54000120	b.eq	0xfffff7fb4950  // b.none
   0x0000fffff7fb4930:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb4934:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4938:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb493c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4940:	54000321	b.ne	0xfffff7fb49a4  // b.any
   0x0000fffff7fb4944:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb4948:	9e620120	scvtf	d0, x9
   0x0000fffff7fb494c:	14000002	b	0xfffff7fb4954
   0x0000fffff7fb4950:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb4954:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb4958:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb495c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4960:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4964:	54000120	b.eq	0xfffff7fb4988  // b.none
   0x0000fffff7fb4968:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb496c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4970:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4974:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb4978:	54000161	b.ne	0xfffff7fb49a4  // b.any
   0x0000fffff7fb497c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb4980:	9e620121	scvtf	d1, x9
   0x0000fffff7fb4984:	14000002	b	0xfffff7fb498c
   0x0000fffff7fb4988:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb498c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb4990:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb4994:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb4998:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb499c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb49a0:	17ffffde	b	0xfffff7fb4918
   0x0000fffff7fb49a4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb49a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb49ac:	aa1303e1	mov	x1, x19
   0x0000fffff7fb49b0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb49b4:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fb49b8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb49bc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb49c0:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fb49c4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb49c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb49cc:	d63f0200	blr	x16
   0x0000fffff7fb49d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb49d4:	540015a0	b.eq	0xfffff7fb4c88  // b.none
   0x0000fffff7fb49d8:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb49dc:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb49e0:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb49e4:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb49e8:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb49ec:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb49f0:	36d801d1	tbz	w17, #27, 0xfffff7fb4a28
   0x0000fffff7fb49f4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb49f8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb49fc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4a00:	54000281	b.ne	0xfffff7fb4a50  // b.any
   0x0000fffff7fb4a04:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb4a08:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4a0c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4a10:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4a14:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4a18:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4a1c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4a20:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4a24:	54000169	b.ls	0xfffff7fb4a50  // b.plast
   0x0000fffff7fb4a28:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb4a2c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4a30:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb4a34:	36d80091	tbz	w17, #27, 0xfffff7fb4a44
   0x0000fffff7fb4a38:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4a3c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4a40:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4a44:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb4a48:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb4a4c:	1400000e	b	0xfffff7fb4a84
   0x0000fffff7fb4a50:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb4a54:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4a58:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4a5c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4a60:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fb4a64:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4a68:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4a6c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb4a70:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb4a74:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4a78:	d63f0200	blr	x16
   0x0000fffff7fb4a7c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4a80:	54001080	b.eq	0xfffff7fb4c90  // b.none
   0x0000fffff7fb4a84:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb4a88:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb4a8c:	540003a0	b.eq	0xfffff7fb4b00  // b.none
   0x0000fffff7fb4a90:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb4a94:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb4a98:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb4a9c:	36d801d1	tbz	w17, #27, 0xfffff7fb4ad4
   0x0000fffff7fb4aa0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb4aa4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb4aa8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb4aac:	540002a1	b.ne	0xfffff7fb4b00  // b.any
   0x0000fffff7fb4ab0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb4ab4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4ab8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb4abc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb4ac0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb4ac4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb4ac8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb4acc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb4ad0:	54000189	b.ls	0xfffff7fb4b00  // b.plast
   0x0000fffff7fb4ad4:	36d8008d	tbz	w13, #27, 0xfffff7fb4ae4
   0x0000fffff7fb4ad8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb4adc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb4ae0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb4ae4:	36d80091	tbz	w17, #27, 0xfffff7fb4af4
   0x0000fffff7fb4ae8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb4aec:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb4af0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb4af4:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb4af8:	b900016d	str	w13, [x11]
   0x0000fffff7fb4afc:	1400000e	b	0xfffff7fb4b34
   0x0000fffff7fb4b00:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb4b04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4b08:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4b0c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4b10:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fb4b14:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4b18:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4b1c:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb4b20:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb4b24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4b28:	d63f0200	blr	x16
   0x0000fffff7fb4b2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb4b30:	54000b40	b.eq	0xfffff7fb4c98  // b.none
   0x0000fffff7fb4b34:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb4b38:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb4b3c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb4b40:	aa1503e2	mov	x2, x21
   0x0000fffff7fb4b44:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fb4b48:	aa1403e4	mov	x4, x20
   0x0000fffff7fb4b4c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb4b50:	d2869090	mov	x16, #0x3484                	// #13444
   0x0000fffff7fb4b54:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb4b58:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb4b5c:	d63f0200	blr	x16
   0x0000fffff7fb4b60:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb4b64:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb4b68:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb4b6c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb4b70:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fb4b74:	d65f03c0	ret
   0x0000fffff7fb4b78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb4b7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb4b80:	b900028a	str	w10, [x20]
   0x0000fffff7fb4b84:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fb4b88:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb4b8c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb4b90:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb4b94:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb4b98:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fb4b9c:	d65f03c0	ret
   0x0000fffff7fb4ba0:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fb4ba4:	17fffff5	b	0xfffff7fb4b78
   0x0000fffff7fb4ba8:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fb4bac:	17fffff3	b	0xfffff7fb4b78
   0x0000fffff7fb4bb0:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fb4bb4:	17fffff1	b	0xfffff7fb4b78
   0x0000fffff7fb4bb8:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7fb4bbc:	17ffffef	b	0xfffff7fb4b78
   0x0000fffff7fb4bc0:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7fb4bc4:	17ffffed	b	0xfffff7fb4b78
   0x0000fffff7fb4bc8:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fb4bcc:	17ffffeb	b	0xfffff7fb4b78
   0x0000fffff7fb4bd0:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fb4bd4:	17ffffe9	b	0xfffff7fb4b78
   0x0000fffff7fb4bd8:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fb4bdc:	17ffffe7	b	0xfffff7fb4b78
   0x0000fffff7fb4be0:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fb4be4:	17ffffe5	b	0xfffff7fb4b78
   0x0000fffff7fb4be8:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fb4bec:	17ffffe3	b	0xfffff7fb4b78
   0x0000fffff7fb4bf0:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fb4bf4:	17ffffe1	b	0xfffff7fb4b78
   0x0000fffff7fb4bf8:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fb4bfc:	17ffffdf	b	0xfffff7fb4b78
   0x0000fffff7fb4c00:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fb4c04:	17ffffdd	b	0xfffff7fb4b78
   0x0000fffff7fb4c08:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fb4c0c:	17ffffdb	b	0xfffff7fb4b78
   0x0000fffff7fb4c10:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fb4c14:	17ffffd9	b	0xfffff7fb4b78
   0x0000fffff7fb4c18:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fb4c1c:	17ffffd7	b	0xfffff7fb4b78
   0x0000fffff7fb4c20:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fb4c24:	17ffffd5	b	0xfffff7fb4b78
   0x0000fffff7fb4c28:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fb4c2c:	17ffffd3	b	0xfffff7fb4b78
   0x0000fffff7fb4c30:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fb4c34:	17ffffd1	b	0xfffff7fb4b78
   0x0000fffff7fb4c38:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fb4c3c:	17ffffcf	b	0xfffff7fb4b78
   0x0000fffff7fb4c40:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fb4c44:	17ffffcd	b	0xfffff7fb4b78
   0x0000fffff7fb4c48:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fb4c4c:	17ffffcb	b	0xfffff7fb4b78
   0x0000fffff7fb4c50:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fb4c54:	17ffffc9	b	0xfffff7fb4b78
   0x0000fffff7fb4c58:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fb4c5c:	17ffffc7	b	0xfffff7fb4b78
   0x0000fffff7fb4c60:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fb4c64:	17ffffc5	b	0xfffff7fb4b78
   0x0000fffff7fb4c68:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fb4c6c:	17ffffc3	b	0xfffff7fb4b78
   0x0000fffff7fb4c70:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fb4c74:	17ffffc1	b	0xfffff7fb4b78
   0x0000fffff7fb4c78:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fb4c7c:	17ffffbf	b	0xfffff7fb4b78
   0x0000fffff7fb4c80:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fb4c84:	17ffffbd	b	0xfffff7fb4b78
   0x0000fffff7fb4c88:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fb4c8c:	17ffffbb	b	0xfffff7fb4b78
   0x0000fffff7fb4c90:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fb4c94:	17ffffb9	b	0xfffff7fb4b78
   0x0000fffff7fb4c98:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fb4c9c:	17ffffb7	b	0xfffff7fb4b78
   0x0000fffff7fb4ca0:	00000000	udf	#0
   0x0000fffff7fb4ca4:	00000000	udf	#0
   0x0000fffff7fb4ca8:	00000000	udf	#0
   0x0000fffff7fb4cac:	00000000	udf	#0
   0x0000fffff7fb4cb0:	00000000	udf	#0
   0x0000fffff7fb4cb4:	00000000	udf	#0
   0x0000fffff7fb4cb8:	00000000	udf	#0
   0x0000fffff7fb4cbc:	00000000	udf	#0
   0x0000fffff7fb4cc0:	00000000	udf	#0
   0x0000fffff7fb4cc4:	00000000	udf	#0
   0x0000fffff7fb4cc8:	00000000	udf	#0
   0x0000fffff7fb4ccc:	00000000	udf	#0
   0x0000fffff7fb4cd0:	00000000	udf	#0
   0x0000fffff7fb4cd4:	00000000	udf	#0
   0x0000fffff7fb4cd8:	00000000	udf	#0
   0x0000fffff7fb4cdc:	00000000	udf	#0
   0x0000fffff7fb4ce0:	00000000	udf	#0
   0x0000fffff7fb4ce4:	00000000	udf	#0
   0x0000fffff7fb4ce8:	00000000	udf	#0
   0x0000fffff7fb4cec:	00000000	udf	#0
   0x0000fffff7fb4cf0:	00000000	udf	#0
   0x0000fffff7fb4cf4:	00000000	udf	#0
   0x0000fffff7fb4cf8:	00000000	udf	#0
   0x0000fffff7fb4cfc:	00000000	udf	#0
   0x0000fffff7fb4d00:	00000000	udf	#0
   0x0000fffff7fb4d04:	00000000	udf	#0
   0x0000fffff7fb4d08:	00000000	udf	#0
   0x0000fffff7fb4d0c:	00000000	udf	#0
   0x0000fffff7fb4d10:	00000000	udf	#0
   0x0000fffff7fb4d14:	00000000	udf	#0
   0x0000fffff7fb4d18:	00000000	udf	#0
   0x0000fffff7fb4d1c:	00000000	udf	#0
   0x0000fffff7fb4d20:	00000000	udf	#0
   0x0000fffff7fb4d24:	00000000	udf	#0
   0x0000fffff7fb4d28:	00000000	udf	#0
   0x0000fffff7fb4d2c:	00000000	udf	#0
   0x0000fffff7fb4d30:	00000000	udf	#0
   0x0000fffff7fb4d34:	00000000	udf	#0
   0x0000fffff7fb4d38:	00000000	udf	#0
   0x0000fffff7fb4d3c:	00000000	udf	#0
   0x0000fffff7fb4d40:	00000000	udf	#0
   0x0000fffff7fb4d44:	00000000	udf	#0
   0x0000fffff7fb4d48:	00000000	udf	#0
   0x0000fffff7fb4d4c:	00000000	udf	#0
   0x0000fffff7fb4d50:	00000000	udf	#0
   0x0000fffff7fb4d54:	00000000	udf	#0
   0x0000fffff7fb4d58:	00000000	udf	#0
   0x0000fffff7fb4d5c:	00000000	udf	#0
   0x0000fffff7fb4d60:	00000000	udf	#0
   0x0000fffff7fb4d64:	00000000	udf	#0
   0x0000fffff7fb4d68:	00000000	udf	#0
   0x0000fffff7fb4d6c:	00000000	udf	#0
   0x0000fffff7fb4d70:	00000000	udf	#0
   0x0000fffff7fb4d74:	00000000	udf	#0
   0x0000fffff7fb4d78:	00000000	udf	#0
   0x0000fffff7fb4d7c:	00000000	udf	#0
   0x0000fffff7fb4d80:	00000000	udf	#0
   0x0000fffff7fb4d84:	00000000	udf	#0
   0x0000fffff7fb4d88:	00000000	udf	#0
   0x0000fffff7fb4d8c:	00000000	udf	#0
   0x0000fffff7fb4d90:	00000000	udf	#0
   0x0000fffff7fb4d94:	00000000	udf	#0
   0x0000fffff7fb4d98:	00000000	udf	#0
   0x0000fffff7fb4d9c:	00000000	udf	#0
   0x0000fffff7fb4da0:	00000000	udf	#0
   0x0000fffff7fb4da4:	00000000	udf	#0
   0x0000fffff7fb4da8:	00000000	udf	#0
   0x0000fffff7fb4dac:	00000000	udf	#0
   0x0000fffff7fb4db0:	00000000	udf	#0
   0x0000fffff7fb4db4:	00000000	udf	#0
   0x0000fffff7fb4db8:	00000000	udf	#0
   0x0000fffff7fb4dbc:	00000000	udf	#0
   0x0000fffff7fb4dc0:	00000000	udf	#0
   0x0000fffff7fb4dc4:	00000000	udf	#0
   0x0000fffff7fb4dc8:	00000000	udf	#0
   0x0000fffff7fb4dcc:	00000000	udf	#0
   0x0000fffff7fb4dd0:	00000000	udf	#0
   0x0000fffff7fb4dd4:	00000000	udf	#0
   0x0000fffff7fb4dd8:	00000000	udf	#0
   0x0000fffff7fb4ddc:	00000000	udf	#0
   0x0000fffff7fb4de0:	00000000	udf	#0
   0x0000fffff7fb4de4:	00000000	udf	#0
   0x0000fffff7fb4de8:	00000000	udf	#0
   0x0000fffff7fb4dec:	00000000	udf	#0
   0x0000fffff7fb4df0:	00000000	udf	#0
   0x0000fffff7fb4df4:	00000000	udf	#0
   0x0000fffff7fb4df8:	00000000	udf	#0
   0x0000fffff7fb4dfc:	00000000	udf	#0
   0x0000fffff7fb4e00:	00000000	udf	#0
   0x0000fffff7fb4e04:	00000000	udf	#0
   0x0000fffff7fb4e08:	00000000	udf	#0
   0x0000fffff7fb4e0c:	00000000	udf	#0
   0x0000fffff7fb4e10:	00000000	udf	#0
   0x0000fffff7fb4e14:	00000000	udf	#0
   0x0000fffff7fb4e18:	00000000	udf	#0
   0x0000fffff7fb4e1c:	00000000	udf	#0
   0x0000fffff7fb4e20:	00000000	udf	#0
   0x0000fffff7fb4e24:	00000000	udf	#0
   0x0000fffff7fb4e28:	00000000	udf	#0
   0x0000fffff7fb4e2c:	00000000	udf	#0
   0x0000fffff7fb4e30:	00000000	udf	#0
   0x0000fffff7fb4e34:	00000000	udf	#0
   0x0000fffff7fb4e38:	00000000	udf	#0
   0x0000fffff7fb4e3c:	00000000	udf	#0
   0x0000fffff7fb4e40:	00000000	udf	#0
   0x0000fffff7fb4e44:	00000000	udf	#0
   0x0000fffff7fb4e48:	00000000	udf	#0
   0x0000fffff7fb4e4c:	00000000	udf	#0
   0x0000fffff7fb4e50:	00000000	udf	#0
   0x0000fffff7fb4e54:	00000000	udf	#0
   0x0000fffff7fb4e58:	00000000	udf	#0
   0x0000fffff7fb4e5c:	00000000	udf	#0
   0x0000fffff7fb4e60:	00000000	udf	#0
   0x0000fffff7fb4e64:	00000000	udf	#0
   0x0000fffff7fb4e68:	00000000	udf	#0
   0x0000fffff7fb4e6c:	00000000	udf	#0
   0x0000fffff7fb4e70:	00000000	udf	#0
   0x0000fffff7fb4e74:	00000000	udf	#0
   0x0000fffff7fb4e78:	00000000	udf	#0
   0x0000fffff7fb4e7c:	00000000	udf	#0
   0x0000fffff7fb4e80:	00000000	udf	#0
   0x0000fffff7fb4e84:	00000000	udf	#0
   0x0000fffff7fb4e88:	00000000	udf	#0
   0x0000fffff7fb4e8c:	00000000	udf	#0
   0x0000fffff7fb4e90:	00000000	udf	#0
   0x0000fffff7fb4e94:	00000000	udf	#0
   0x0000fffff7fb4e98:	00000000	udf	#0
   0x0000fffff7fb4e9c:	00000000	udf	#0
   0x0000fffff7fb4ea0:	00000000	udf	#0
   0x0000fffff7fb4ea4:	00000000	udf	#0
   0x0000fffff7fb4ea8:	00000000	udf	#0
   0x0000fffff7fb4eac:	00000000	udf	#0
   0x0000fffff7fb4eb0:	00000000	udf	#0
   0x0000fffff7fb4eb4:	00000000	udf	#0
   0x0000fffff7fb4eb8:	00000000	udf	#0
   0x0000fffff7fb4ebc:	00000000	udf	#0
   0x0000fffff7fb4ec0:	00000000	udf	#0
   0x0000fffff7fb4ec4:	00000000	udf	#0
   0x0000fffff7fb4ec8:	00000000	udf	#0
   0x0000fffff7fb4ecc:	00000000	udf	#0
   0x0000fffff7fb4ed0:	00000000	udf	#0
   0x0000fffff7fb4ed4:	00000000	udf	#0
   0x0000fffff7fb4ed8:	00000000	udf	#0
   0x0000fffff7fb4edc:	00000000	udf	#0
   0x0000fffff7fb4ee0:	00000000	udf	#0
   0x0000fffff7fb4ee4:	00000000	udf	#0
   0x0000fffff7fb4ee8:	00000000	udf	#0
   0x0000fffff7fb4eec:	00000000	udf	#0
   0x0000fffff7fb4ef0:	00000000	udf	#0
   0x0000fffff7fb4ef4:	00000000	udf	#0
   0x0000fffff7fb4ef8:	00000000	udf	#0
   0x0000fffff7fb4efc:	00000000	udf	#0
   0x0000fffff7fb4f00:	00000000	udf	#0
   0x0000fffff7fb4f04:	00000000	udf	#0
   0x0000fffff7fb4f08:	00000000	udf	#0
   0x0000fffff7fb4f0c:	00000000	udf	#0
   0x0000fffff7fb4f10:	00000000	udf	#0
   0x0000fffff7fb4f14:	00000000	udf	#0
   0x0000fffff7fb4f18:	00000000	udf	#0
   0x0000fffff7fb4f1c:	00000000	udf	#0
   0x0000fffff7fb4f20:	00000000	udf	#0
   0x0000fffff7fb4f24:	00000000	udf	#0
   0x0000fffff7fb4f28:	00000000	udf	#0
   0x0000fffff7fb4f2c:	00000000	udf	#0
   0x0000fffff7fb4f30:	00000000	udf	#0
   0x0000fffff7fb4f34:	00000000	udf	#0
   0x0000fffff7fb4f38:	00000000	udf	#0
   0x0000fffff7fb4f3c:	00000000	udf	#0
   0x0000fffff7fb4f40:	00000000	udf	#0
   0x0000fffff7fb4f44:	00000000	udf	#0
   0x0000fffff7fb4f48:	00000000	udf	#0
   0x0000fffff7fb4f4c:	00000000	udf	#0
   0x0000fffff7fb4f50:	00000000	udf	#0
   0x0000fffff7fb4f54:	00000000	udf	#0
   0x0000fffff7fb4f58:	00000000	udf	#0
   0x0000fffff7fb4f5c:	00000000	udf	#0
   0x0000fffff7fb4f60:	00000000	udf	#0
   0x0000fffff7fb4f64:	00000000	udf	#0
   0x0000fffff7fb4f68:	00000000	udf	#0
   0x0000fffff7fb4f6c:	00000000	udf	#0
   0x0000fffff7fb4f70:	00000000	udf	#0
   0x0000fffff7fb4f74:	00000000	udf	#0
   0x0000fffff7fb4f78:	00000000	udf	#0
   0x0000fffff7fb4f7c:	00000000	udf	#0
   0x0000fffff7fb4f80:	00000000	udf	#0
   0x0000fffff7fb4f84:	00000000	udf	#0
   0x0000fffff7fb4f88:	00000000	udf	#0
   0x0000fffff7fb4f8c:	00000000	udf	#0
   0x0000fffff7fb4f90:	00000000	udf	#0
   0x0000fffff7fb4f94:	00000000	udf	#0
   0x0000fffff7fb4f98:	00000000	udf	#0
   0x0000fffff7fb4f9c:	00000000	udf	#0
   0x0000fffff7fb4fa0:	00000000	udf	#0
   0x0000fffff7fb4fa4:	00000000	udf	#0
   0x0000fffff7fb4fa8:	00000000	udf	#0
   0x0000fffff7fb4fac:	00000000	udf	#0
   0x0000fffff7fb4fb0:	00000000	udf	#0
   0x0000fffff7fb4fb4:	00000000	udf	#0
   0x0000fffff7fb4fb8:	00000000	udf	#0
   0x0000fffff7fb4fbc:	00000000	udf	#0
   0x0000fffff7fb4fc0:	00000000	udf	#0
   0x0000fffff7fb4fc4:	00000000	udf	#0
   0x0000fffff7fb4fc8:	00000000	udf	#0
   0x0000fffff7fb4fcc:	00000000	udf	#0
   0x0000fffff7fb4fd0:	00000000	udf	#0
   0x0000fffff7fb4fd4:	00000000	udf	#0
   0x0000fffff7fb4fd8:	00000000	udf	#0
   0x0000fffff7fb4fdc:	00000000	udf	#0
   0x0000fffff7fb4fe0:	00000000	udf	#0
   0x0000fffff7fb4fe4:	00000000	udf	#0
   0x0000fffff7fb4fe8:	00000000	udf	#0
   0x0000fffff7fb4fec:	00000000	udf	#0
   0x0000fffff7fb4ff0:	00000000	udf	#0
   0x0000fffff7fb4ff4:	00000000	udf	#0
   0x0000fffff7fb4ff8:	00000000	udf	#0
   0x0000fffff7fb4ffc:	00000000	udf	#0
End of assembler dump.
