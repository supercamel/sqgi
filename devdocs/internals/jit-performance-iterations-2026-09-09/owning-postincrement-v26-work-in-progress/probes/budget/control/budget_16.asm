Dump of assembler code from 0xfffff7fa3000 to 0xfffff7fa5000:
   0x0000fffff7fa3000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fa3004:	910003fd	mov	x29, sp
   0x0000fffff7fa3008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fa300c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fa3010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fa3014:	aa0003f3	mov	x19, x0
   0x0000fffff7fa3018:	aa0103f4	mov	x20, x1
   0x0000fffff7fa301c:	aa0203f5	mov	x21, x2
   0x0000fffff7fa3020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fa3024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fa3028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fa302c:	f90003e9	str	x9, [sp]
   0x0000fffff7fa3030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fa3034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fa3038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fa303c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fa3040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3044:	d63f0200	blr	x16
   0x0000fffff7fa3048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fa304c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fa3050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fa3054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fa3058:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa305c:	37d800e9	tbnz	w9, #27, 0xfffff7fa3078
   0x0000fffff7fa3060:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fa3064:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3068:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa306c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa3070:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa3074:	1400000e	b	0xfffff7fa30ac
   0x0000fffff7fa3078:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa307c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3080:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3084:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3088:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fa308c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3090:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3094:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7fa3098:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa309c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa30a0:	d63f0200	blr	x16
   0x0000fffff7fa30a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa30a8:	5400eb80	b.eq	0xfffff7fa4e18  // b.none
   0x0000fffff7fa30ac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa30b0:	37d800e9	tbnz	w9, #27, 0xfffff7fa30cc
   0x0000fffff7fa30b4:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fa30b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa30bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa30c0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa30c4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa30c8:	1400000e	b	0xfffff7fa3100
   0x0000fffff7fa30cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa30d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa30d4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa30d8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa30dc:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fa30e0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa30e4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa30e8:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7fa30ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa30f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa30f4:	d63f0200	blr	x16
   0x0000fffff7fa30f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa30fc:	5400e920	b.eq	0xfffff7fa4e20  // b.none
   0x0000fffff7fa3100:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa3104:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3108:	aa1303e1	mov	x1, x19
   0x0000fffff7fa310c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3110:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fa3114:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3118:	aa1603e5	mov	x5, x22
   0x0000fffff7fa311c:	d28fec90	mov	x16, #0x7f64                	// #32612
   0x0000fffff7fa3120:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa3124:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3128:	d63f0200	blr	x16
   0x0000fffff7fa312c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3130:	5400e7c0	b.eq	0xfffff7fa4e28  // b.none
   0x0000fffff7fa3134:	f100041f	cmp	x0, #0x1
   0x0000fffff7fa3138:	5400e3a0	b.eq	0xfffff7fa4dac  // b.none
   0x0000fffff7fa313c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa3140:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3144:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3148:	aa1503e2	mov	x2, x21
   0x0000fffff7fa314c:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7fa3150:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3154:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3158:	d2933c10	mov	x16, #0x99e0                	// #39392
   0x0000fffff7fa315c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa3160:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3164:	d63f0200	blr	x16
   0x0000fffff7fa3168:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa316c:	5400e620	b.eq	0xfffff7fa4e30  // b.none
   0x0000fffff7fa3170:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa3174:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3178:	aa1303e1	mov	x1, x19
   0x0000fffff7fa317c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3180:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7fa3184:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3188:	aa1603e5	mov	x5, x22
   0x0000fffff7fa318c:	d29e2e10	mov	x16, #0xf170                	// #61808
   0x0000fffff7fa3190:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa3194:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3198:	d63f0200	blr	x16
   0x0000fffff7fa319c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa31a0:	5400e4c0	b.eq	0xfffff7fa4e38  // b.none
   0x0000fffff7fa31a4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa31a8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa31ac:	54000380	b.eq	0xfffff7fa321c  // b.none
   0x0000fffff7fa31b0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa31b4:	37d8034d	tbnz	w13, #27, 0xfffff7fa321c
   0x0000fffff7fa31b8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa31bc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa31c0:	36d80211	tbz	w17, #27, 0xfffff7fa3200
   0x0000fffff7fa31c4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa31c8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa31cc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa31d0:	54000261	b.ne	0xfffff7fa321c  // b.any
   0x0000fffff7fa31d4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa31d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa31dc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa31e0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa31e4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa31e8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa31ec:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa31f0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa31f4:	54000149	b.ls	0xfffff7fa321c  // b.plast
   0x0000fffff7fa31f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa31fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa3200:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa3204:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa3208:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa320c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa3210:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa3214:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa3218:	1400000e	b	0xfffff7fa3250
   0x0000fffff7fa321c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa3220:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3224:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3228:	aa1503e2	mov	x2, x21
   0x0000fffff7fa322c:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fa3230:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3234:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3238:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa323c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa3240:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3244:	d63f0200	blr	x16
   0x0000fffff7fa3248:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa324c:	5400dfa0	b.eq	0xfffff7fa4e40  // b.none
   0x0000fffff7fa3250:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3254:	37d806a9	tbnz	w9, #27, 0xfffff7fa3328
   0x0000fffff7fa3258:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa325c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3260:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3264:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3268:	540001c1	b.ne	0xfffff7fa32a0  // b.any
   0x0000fffff7fa326c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa3270:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3274:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3278:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa327c:	54000121	b.ne	0xfffff7fa32a0  // b.any
   0x0000fffff7fa3280:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa3284:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa3288:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa328c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3290:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3294:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa3298:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa329c:	14000030	b	0xfffff7fa335c
   0x0000fffff7fa32a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa32a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa32a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa32ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa32b0:	54000120	b.eq	0xfffff7fa32d4  // b.none
   0x0000fffff7fa32b4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa32b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa32bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa32c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa32c4:	54000321	b.ne	0xfffff7fa3328  // b.any
   0x0000fffff7fa32c8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa32cc:	9e620120	scvtf	d0, x9
   0x0000fffff7fa32d0:	14000002	b	0xfffff7fa32d8
   0x0000fffff7fa32d4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa32d8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa32dc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa32e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa32e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa32e8:	54000120	b.eq	0xfffff7fa330c  // b.none
   0x0000fffff7fa32ec:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa32f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa32f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa32f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa32fc:	54000161	b.ne	0xfffff7fa3328  // b.any
   0x0000fffff7fa3300:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa3304:	9e620121	scvtf	d1, x9
   0x0000fffff7fa3308:	14000002	b	0xfffff7fa3310
   0x0000fffff7fa330c:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa3310:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa3314:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa3318:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa331c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3320:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa3324:	17ffffde	b	0xfffff7fa329c
   0x0000fffff7fa3328:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa332c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3330:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3334:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3338:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fa333c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3340:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3344:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa3348:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa334c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3350:	d63f0200	blr	x16
   0x0000fffff7fa3354:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3358:	5400d780	b.eq	0xfffff7fa4e48  // b.none
   0x0000fffff7fa335c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa3360:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa3364:	54000380	b.eq	0xfffff7fa33d4  // b.none
   0x0000fffff7fa3368:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa336c:	37d8034d	tbnz	w13, #27, 0xfffff7fa33d4
   0x0000fffff7fa3370:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa3374:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa3378:	36d80211	tbz	w17, #27, 0xfffff7fa33b8
   0x0000fffff7fa337c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa3380:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa3384:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa3388:	54000261	b.ne	0xfffff7fa33d4  // b.any
   0x0000fffff7fa338c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa3390:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa3394:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa3398:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa339c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa33a0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa33a4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa33a8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa33ac:	54000149	b.ls	0xfffff7fa33d4  // b.plast
   0x0000fffff7fa33b0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa33b4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa33b8:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa33bc:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa33c0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa33c4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa33c8:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa33cc:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa33d0:	1400000e	b	0xfffff7fa3408
   0x0000fffff7fa33d4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa33d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa33dc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa33e0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa33e4:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fa33e8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa33ec:	aa1603e5	mov	x5, x22
   0x0000fffff7fa33f0:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa33f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa33f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa33fc:	d63f0200	blr	x16
   0x0000fffff7fa3400:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3404:	5400d260	b.eq	0xfffff7fa4e50  // b.none
   0x0000fffff7fa3408:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa340c:	37d806a9	tbnz	w9, #27, 0xfffff7fa34e0
   0x0000fffff7fa3410:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3414:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3418:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa341c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3420:	540001c1	b.ne	0xfffff7fa3458  // b.any
   0x0000fffff7fa3424:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa3428:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa342c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3430:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3434:	54000121	b.ne	0xfffff7fa3458  // b.any
   0x0000fffff7fa3438:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa343c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa3440:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa3444:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3448:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa344c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa3450:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa3454:	14000030	b	0xfffff7fa3514
   0x0000fffff7fa3458:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa345c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3460:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3464:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3468:	54000120	b.eq	0xfffff7fa348c  // b.none
   0x0000fffff7fa346c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3470:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3474:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3478:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa347c:	54000321	b.ne	0xfffff7fa34e0  // b.any
   0x0000fffff7fa3480:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa3484:	9e620120	scvtf	d0, x9
   0x0000fffff7fa3488:	14000002	b	0xfffff7fa3490
   0x0000fffff7fa348c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa3490:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa3494:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3498:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa349c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa34a0:	54000120	b.eq	0xfffff7fa34c4  // b.none
   0x0000fffff7fa34a4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa34a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa34ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa34b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa34b4:	54000161	b.ne	0xfffff7fa34e0  // b.any
   0x0000fffff7fa34b8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa34bc:	9e620121	scvtf	d1, x9
   0x0000fffff7fa34c0:	14000002	b	0xfffff7fa34c8
   0x0000fffff7fa34c4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa34c8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa34cc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa34d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa34d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa34d8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa34dc:	17ffffde	b	0xfffff7fa3454
   0x0000fffff7fa34e0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa34e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa34e8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa34ec:	aa1503e2	mov	x2, x21
   0x0000fffff7fa34f0:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fa34f4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa34f8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa34fc:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa3500:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa3504:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3508:	d63f0200	blr	x16
   0x0000fffff7fa350c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3510:	5400ca40	b.eq	0xfffff7fa4e58  // b.none
   0x0000fffff7fa3514:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa3518:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa351c:	54000380	b.eq	0xfffff7fa358c  // b.none
   0x0000fffff7fa3520:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa3524:	37d8034d	tbnz	w13, #27, 0xfffff7fa358c
   0x0000fffff7fa3528:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa352c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa3530:	36d80211	tbz	w17, #27, 0xfffff7fa3570
   0x0000fffff7fa3534:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa3538:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa353c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa3540:	54000261	b.ne	0xfffff7fa358c  // b.any
   0x0000fffff7fa3544:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa3548:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa354c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa3550:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa3554:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa3558:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa355c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa3560:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa3564:	54000149	b.ls	0xfffff7fa358c  // b.plast
   0x0000fffff7fa3568:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa356c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa3570:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa3574:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa3578:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa357c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa3580:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa3584:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa3588:	1400000e	b	0xfffff7fa35c0
   0x0000fffff7fa358c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa3590:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3594:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3598:	aa1503e2	mov	x2, x21
   0x0000fffff7fa359c:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fa35a0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa35a4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa35a8:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa35ac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa35b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa35b4:	d63f0200	blr	x16
   0x0000fffff7fa35b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa35bc:	5400c520	b.eq	0xfffff7fa4e60  // b.none
   0x0000fffff7fa35c0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa35c4:	37d806a9	tbnz	w9, #27, 0xfffff7fa3698
   0x0000fffff7fa35c8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa35cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa35d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa35d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa35d8:	540001c1	b.ne	0xfffff7fa3610  // b.any
   0x0000fffff7fa35dc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa35e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa35e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa35e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa35ec:	54000121	b.ne	0xfffff7fa3610  // b.any
   0x0000fffff7fa35f0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa35f4:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa35f8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa35fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3600:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3604:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa3608:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa360c:	14000030	b	0xfffff7fa36cc
   0x0000fffff7fa3610:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3614:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3618:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa361c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3620:	54000120	b.eq	0xfffff7fa3644  // b.none
   0x0000fffff7fa3624:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3628:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa362c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3630:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3634:	54000321	b.ne	0xfffff7fa3698  // b.any
   0x0000fffff7fa3638:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa363c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa3640:	14000002	b	0xfffff7fa3648
   0x0000fffff7fa3644:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa3648:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa364c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3650:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3654:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3658:	54000120	b.eq	0xfffff7fa367c  // b.none
   0x0000fffff7fa365c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa3660:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3664:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3668:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa366c:	54000161	b.ne	0xfffff7fa3698  // b.any
   0x0000fffff7fa3670:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa3674:	9e620121	scvtf	d1, x9
   0x0000fffff7fa3678:	14000002	b	0xfffff7fa3680
   0x0000fffff7fa367c:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa3680:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa3684:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa3688:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa368c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3690:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa3694:	17ffffde	b	0xfffff7fa360c
   0x0000fffff7fa3698:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa369c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa36a0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa36a4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa36a8:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fa36ac:	aa1403e4	mov	x4, x20
   0x0000fffff7fa36b0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa36b4:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa36b8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa36bc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa36c0:	d63f0200	blr	x16
   0x0000fffff7fa36c4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa36c8:	5400bd00	b.eq	0xfffff7fa4e68  // b.none
   0x0000fffff7fa36cc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa36d0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa36d4:	54000380	b.eq	0xfffff7fa3744  // b.none
   0x0000fffff7fa36d8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa36dc:	37d8034d	tbnz	w13, #27, 0xfffff7fa3744
   0x0000fffff7fa36e0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa36e4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa36e8:	36d80211	tbz	w17, #27, 0xfffff7fa3728
   0x0000fffff7fa36ec:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa36f0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa36f4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa36f8:	54000261	b.ne	0xfffff7fa3744  // b.any
   0x0000fffff7fa36fc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa3700:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa3704:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa3708:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa370c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa3710:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa3714:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa3718:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa371c:	54000149	b.ls	0xfffff7fa3744  // b.plast
   0x0000fffff7fa3720:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa3724:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa3728:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa372c:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa3730:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa3734:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa3738:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa373c:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa3740:	1400000e	b	0xfffff7fa3778
   0x0000fffff7fa3744:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa3748:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa374c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3750:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3754:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fa3758:	aa1403e4	mov	x4, x20
   0x0000fffff7fa375c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3760:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa3764:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa3768:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa376c:	d63f0200	blr	x16
   0x0000fffff7fa3770:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3774:	5400b7e0	b.eq	0xfffff7fa4e70  // b.none
   0x0000fffff7fa3778:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa377c:	37d806a9	tbnz	w9, #27, 0xfffff7fa3850
   0x0000fffff7fa3780:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3784:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3788:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa378c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3790:	540001c1	b.ne	0xfffff7fa37c8  // b.any
   0x0000fffff7fa3794:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa3798:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa379c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa37a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa37a4:	54000121	b.ne	0xfffff7fa37c8  // b.any
   0x0000fffff7fa37a8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa37ac:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa37b0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa37b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa37b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa37bc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa37c0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa37c4:	14000030	b	0xfffff7fa3884
   0x0000fffff7fa37c8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa37cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa37d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa37d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa37d8:	54000120	b.eq	0xfffff7fa37fc  // b.none
   0x0000fffff7fa37dc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa37e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa37e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa37e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa37ec:	54000321	b.ne	0xfffff7fa3850  // b.any
   0x0000fffff7fa37f0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa37f4:	9e620120	scvtf	d0, x9
   0x0000fffff7fa37f8:	14000002	b	0xfffff7fa3800
   0x0000fffff7fa37fc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa3800:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa3804:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3808:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa380c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3810:	54000120	b.eq	0xfffff7fa3834  // b.none
   0x0000fffff7fa3814:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa3818:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa381c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3820:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3824:	54000161	b.ne	0xfffff7fa3850  // b.any
   0x0000fffff7fa3828:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa382c:	9e620121	scvtf	d1, x9
   0x0000fffff7fa3830:	14000002	b	0xfffff7fa3838
   0x0000fffff7fa3834:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa3838:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa383c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa3840:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3844:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3848:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa384c:	17ffffde	b	0xfffff7fa37c4
   0x0000fffff7fa3850:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa3854:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3858:	aa1303e1	mov	x1, x19
   0x0000fffff7fa385c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3860:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fa3864:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3868:	aa1603e5	mov	x5, x22
   0x0000fffff7fa386c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa3870:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa3874:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3878:	d63f0200	blr	x16
   0x0000fffff7fa387c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3880:	5400afc0	b.eq	0xfffff7fa4e78  // b.none
   0x0000fffff7fa3884:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa3888:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa388c:	54000380	b.eq	0xfffff7fa38fc  // b.none
   0x0000fffff7fa3890:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa3894:	37d8034d	tbnz	w13, #27, 0xfffff7fa38fc
   0x0000fffff7fa3898:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa389c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa38a0:	36d80211	tbz	w17, #27, 0xfffff7fa38e0
   0x0000fffff7fa38a4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa38a8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa38ac:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa38b0:	54000261	b.ne	0xfffff7fa38fc  // b.any
   0x0000fffff7fa38b4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa38b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa38bc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa38c0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa38c4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa38c8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa38cc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa38d0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa38d4:	54000149	b.ls	0xfffff7fa38fc  // b.plast
   0x0000fffff7fa38d8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa38dc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa38e0:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa38e4:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa38e8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa38ec:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa38f0:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa38f4:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa38f8:	1400000e	b	0xfffff7fa3930
   0x0000fffff7fa38fc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa3900:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3904:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3908:	aa1503e2	mov	x2, x21
   0x0000fffff7fa390c:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fa3910:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3914:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3918:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa391c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa3920:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3924:	d63f0200	blr	x16
   0x0000fffff7fa3928:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa392c:	5400aaa0	b.eq	0xfffff7fa4e80  // b.none
   0x0000fffff7fa3930:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3934:	37d806a9	tbnz	w9, #27, 0xfffff7fa3a08
   0x0000fffff7fa3938:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa393c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3940:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3944:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3948:	540001c1	b.ne	0xfffff7fa3980  // b.any
   0x0000fffff7fa394c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa3950:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3954:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3958:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa395c:	54000121	b.ne	0xfffff7fa3980  // b.any
   0x0000fffff7fa3960:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa3964:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa3968:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa396c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3970:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3974:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa3978:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa397c:	14000030	b	0xfffff7fa3a3c
   0x0000fffff7fa3980:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3984:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3988:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa398c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3990:	54000120	b.eq	0xfffff7fa39b4  // b.none
   0x0000fffff7fa3994:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3998:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa399c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa39a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa39a4:	54000321	b.ne	0xfffff7fa3a08  // b.any
   0x0000fffff7fa39a8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa39ac:	9e620120	scvtf	d0, x9
   0x0000fffff7fa39b0:	14000002	b	0xfffff7fa39b8
   0x0000fffff7fa39b4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa39b8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa39bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa39c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa39c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa39c8:	54000120	b.eq	0xfffff7fa39ec  // b.none
   0x0000fffff7fa39cc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa39d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa39d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa39d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa39dc:	54000161	b.ne	0xfffff7fa3a08  // b.any
   0x0000fffff7fa39e0:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa39e4:	9e620121	scvtf	d1, x9
   0x0000fffff7fa39e8:	14000002	b	0xfffff7fa39f0
   0x0000fffff7fa39ec:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa39f0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa39f4:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa39f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa39fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3a00:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa3a04:	17ffffde	b	0xfffff7fa397c
   0x0000fffff7fa3a08:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa3a0c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3a10:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3a14:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3a18:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fa3a1c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3a20:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3a24:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa3a28:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa3a2c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3a30:	d63f0200	blr	x16
   0x0000fffff7fa3a34:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3a38:	5400a280	b.eq	0xfffff7fa4e88  // b.none
   0x0000fffff7fa3a3c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa3a40:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa3a44:	54000380	b.eq	0xfffff7fa3ab4  // b.none
   0x0000fffff7fa3a48:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa3a4c:	37d8034d	tbnz	w13, #27, 0xfffff7fa3ab4
   0x0000fffff7fa3a50:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa3a54:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa3a58:	36d80211	tbz	w17, #27, 0xfffff7fa3a98
   0x0000fffff7fa3a5c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa3a60:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa3a64:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa3a68:	54000261	b.ne	0xfffff7fa3ab4  // b.any
   0x0000fffff7fa3a6c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa3a70:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa3a74:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa3a78:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa3a7c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa3a80:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa3a84:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa3a88:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa3a8c:	54000149	b.ls	0xfffff7fa3ab4  // b.plast
   0x0000fffff7fa3a90:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa3a94:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa3a98:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa3a9c:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa3aa0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa3aa4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa3aa8:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa3aac:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa3ab0:	1400000e	b	0xfffff7fa3ae8
   0x0000fffff7fa3ab4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa3ab8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3abc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3ac0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3ac4:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fa3ac8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3acc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3ad0:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa3ad4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa3ad8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3adc:	d63f0200	blr	x16
   0x0000fffff7fa3ae0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3ae4:	54009d60	b.eq	0xfffff7fa4e90  // b.none
   0x0000fffff7fa3ae8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3aec:	37d806a9	tbnz	w9, #27, 0xfffff7fa3bc0
   0x0000fffff7fa3af0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3af4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3af8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3afc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3b00:	540001c1	b.ne	0xfffff7fa3b38  // b.any
   0x0000fffff7fa3b04:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa3b08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3b0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3b10:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3b14:	54000121	b.ne	0xfffff7fa3b38  // b.any
   0x0000fffff7fa3b18:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa3b1c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa3b20:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa3b24:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3b28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3b2c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa3b30:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa3b34:	14000030	b	0xfffff7fa3bf4
   0x0000fffff7fa3b38:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3b3c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3b40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3b44:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3b48:	54000120	b.eq	0xfffff7fa3b6c  // b.none
   0x0000fffff7fa3b4c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3b50:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3b54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3b58:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3b5c:	54000321	b.ne	0xfffff7fa3bc0  // b.any
   0x0000fffff7fa3b60:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa3b64:	9e620120	scvtf	d0, x9
   0x0000fffff7fa3b68:	14000002	b	0xfffff7fa3b70
   0x0000fffff7fa3b6c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa3b70:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa3b74:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3b78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3b7c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3b80:	54000120	b.eq	0xfffff7fa3ba4  // b.none
   0x0000fffff7fa3b84:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa3b88:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3b8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3b90:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3b94:	54000161	b.ne	0xfffff7fa3bc0  // b.any
   0x0000fffff7fa3b98:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa3b9c:	9e620121	scvtf	d1, x9
   0x0000fffff7fa3ba0:	14000002	b	0xfffff7fa3ba8
   0x0000fffff7fa3ba4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa3ba8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa3bac:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa3bb0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3bb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3bb8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa3bbc:	17ffffde	b	0xfffff7fa3b34
   0x0000fffff7fa3bc0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa3bc4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3bc8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3bcc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3bd0:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fa3bd4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3bd8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3bdc:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa3be0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa3be4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3be8:	d63f0200	blr	x16
   0x0000fffff7fa3bec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3bf0:	54009540	b.eq	0xfffff7fa4e98  // b.none
   0x0000fffff7fa3bf4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa3bf8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa3bfc:	54000380	b.eq	0xfffff7fa3c6c  // b.none
   0x0000fffff7fa3c00:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa3c04:	37d8034d	tbnz	w13, #27, 0xfffff7fa3c6c
   0x0000fffff7fa3c08:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa3c0c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa3c10:	36d80211	tbz	w17, #27, 0xfffff7fa3c50
   0x0000fffff7fa3c14:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa3c18:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa3c1c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa3c20:	54000261	b.ne	0xfffff7fa3c6c  // b.any
   0x0000fffff7fa3c24:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa3c28:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa3c2c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa3c30:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa3c34:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa3c38:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa3c3c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa3c40:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa3c44:	54000149	b.ls	0xfffff7fa3c6c  // b.plast
   0x0000fffff7fa3c48:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa3c4c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa3c50:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa3c54:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa3c58:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa3c5c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa3c60:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa3c64:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa3c68:	1400000e	b	0xfffff7fa3ca0
   0x0000fffff7fa3c6c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa3c70:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3c74:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3c78:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3c7c:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fa3c80:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3c84:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3c88:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa3c8c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa3c90:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3c94:	d63f0200	blr	x16
   0x0000fffff7fa3c98:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3c9c:	54009020	b.eq	0xfffff7fa4ea0  // b.none
   0x0000fffff7fa3ca0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3ca4:	37d806a9	tbnz	w9, #27, 0xfffff7fa3d78
   0x0000fffff7fa3ca8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3cac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3cb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3cb4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3cb8:	540001c1	b.ne	0xfffff7fa3cf0  // b.any
   0x0000fffff7fa3cbc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa3cc0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3cc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3cc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3ccc:	54000121	b.ne	0xfffff7fa3cf0  // b.any
   0x0000fffff7fa3cd0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa3cd4:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa3cd8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa3cdc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3ce0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3ce4:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa3ce8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa3cec:	14000030	b	0xfffff7fa3dac
   0x0000fffff7fa3cf0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3cf4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3cf8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3cfc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3d00:	54000120	b.eq	0xfffff7fa3d24  // b.none
   0x0000fffff7fa3d04:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3d08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3d0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3d10:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3d14:	54000321	b.ne	0xfffff7fa3d78  // b.any
   0x0000fffff7fa3d18:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa3d1c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa3d20:	14000002	b	0xfffff7fa3d28
   0x0000fffff7fa3d24:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa3d28:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa3d2c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3d30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3d34:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3d38:	54000120	b.eq	0xfffff7fa3d5c  // b.none
   0x0000fffff7fa3d3c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa3d40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3d44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3d48:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3d4c:	54000161	b.ne	0xfffff7fa3d78  // b.any
   0x0000fffff7fa3d50:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa3d54:	9e620121	scvtf	d1, x9
   0x0000fffff7fa3d58:	14000002	b	0xfffff7fa3d60
   0x0000fffff7fa3d5c:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa3d60:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa3d64:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa3d68:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3d6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3d70:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa3d74:	17ffffde	b	0xfffff7fa3cec
   0x0000fffff7fa3d78:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa3d7c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3d80:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3d84:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3d88:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fa3d8c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3d90:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3d94:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa3d98:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa3d9c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3da0:	d63f0200	blr	x16
   0x0000fffff7fa3da4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3da8:	54008800	b.eq	0xfffff7fa4ea8  // b.none
   0x0000fffff7fa3dac:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa3db0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa3db4:	54000380	b.eq	0xfffff7fa3e24  // b.none
   0x0000fffff7fa3db8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa3dbc:	37d8034d	tbnz	w13, #27, 0xfffff7fa3e24
   0x0000fffff7fa3dc0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa3dc4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa3dc8:	36d80211	tbz	w17, #27, 0xfffff7fa3e08
   0x0000fffff7fa3dcc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa3dd0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa3dd4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa3dd8:	54000261	b.ne	0xfffff7fa3e24  // b.any
   0x0000fffff7fa3ddc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa3de0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa3de4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa3de8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa3dec:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa3df0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa3df4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa3df8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa3dfc:	54000149	b.ls	0xfffff7fa3e24  // b.plast
   0x0000fffff7fa3e00:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa3e04:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa3e08:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa3e0c:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa3e10:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa3e14:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa3e18:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa3e1c:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa3e20:	1400000e	b	0xfffff7fa3e58
   0x0000fffff7fa3e24:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa3e28:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3e2c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3e30:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3e34:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fa3e38:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3e3c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3e40:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa3e44:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa3e48:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3e4c:	d63f0200	blr	x16
   0x0000fffff7fa3e50:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3e54:	540082e0	b.eq	0xfffff7fa4eb0  // b.none
   0x0000fffff7fa3e58:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3e5c:	37d806a9	tbnz	w9, #27, 0xfffff7fa3f30
   0x0000fffff7fa3e60:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3e64:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3e68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3e6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3e70:	540001c1	b.ne	0xfffff7fa3ea8  // b.any
   0x0000fffff7fa3e74:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa3e78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3e7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3e80:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3e84:	54000121	b.ne	0xfffff7fa3ea8  // b.any
   0x0000fffff7fa3e88:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa3e8c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa3e90:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa3e94:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3e98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3e9c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa3ea0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa3ea4:	14000030	b	0xfffff7fa3f64
   0x0000fffff7fa3ea8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3eac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3eb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3eb4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3eb8:	54000120	b.eq	0xfffff7fa3edc  // b.none
   0x0000fffff7fa3ebc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3ec0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3ec4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3ec8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3ecc:	54000321	b.ne	0xfffff7fa3f30  // b.any
   0x0000fffff7fa3ed0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa3ed4:	9e620120	scvtf	d0, x9
   0x0000fffff7fa3ed8:	14000002	b	0xfffff7fa3ee0
   0x0000fffff7fa3edc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa3ee0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa3ee4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3ee8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3eec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3ef0:	54000120	b.eq	0xfffff7fa3f14  // b.none
   0x0000fffff7fa3ef4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa3ef8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3efc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3f00:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3f04:	54000161	b.ne	0xfffff7fa3f30  // b.any
   0x0000fffff7fa3f08:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa3f0c:	9e620121	scvtf	d1, x9
   0x0000fffff7fa3f10:	14000002	b	0xfffff7fa3f18
   0x0000fffff7fa3f14:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa3f18:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa3f1c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa3f20:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3f24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3f28:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa3f2c:	17ffffde	b	0xfffff7fa3ea4
   0x0000fffff7fa3f30:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa3f34:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3f38:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3f3c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3f40:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fa3f44:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3f48:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3f4c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa3f50:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa3f54:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3f58:	d63f0200	blr	x16
   0x0000fffff7fa3f5c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3f60:	54007ac0	b.eq	0xfffff7fa4eb8  // b.none
   0x0000fffff7fa3f64:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa3f68:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa3f6c:	54000380	b.eq	0xfffff7fa3fdc  // b.none
   0x0000fffff7fa3f70:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa3f74:	37d8034d	tbnz	w13, #27, 0xfffff7fa3fdc
   0x0000fffff7fa3f78:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa3f7c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa3f80:	36d80211	tbz	w17, #27, 0xfffff7fa3fc0
   0x0000fffff7fa3f84:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa3f88:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa3f8c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa3f90:	54000261	b.ne	0xfffff7fa3fdc  // b.any
   0x0000fffff7fa3f94:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa3f98:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa3f9c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa3fa0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa3fa4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa3fa8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa3fac:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa3fb0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa3fb4:	54000149	b.ls	0xfffff7fa3fdc  // b.plast
   0x0000fffff7fa3fb8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa3fbc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa3fc0:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa3fc4:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa3fc8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa3fcc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa3fd0:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa3fd4:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa3fd8:	1400000e	b	0xfffff7fa4010
   0x0000fffff7fa3fdc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa3fe0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3fe4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3fe8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3fec:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fa3ff0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3ff4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3ff8:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa3ffc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa4000:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4004:	d63f0200	blr	x16
   0x0000fffff7fa4008:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa400c:	540075a0	b.eq	0xfffff7fa4ec0  // b.none
   0x0000fffff7fa4010:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4014:	37d806a9	tbnz	w9, #27, 0xfffff7fa40e8
   0x0000fffff7fa4018:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa401c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4020:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4024:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4028:	540001c1	b.ne	0xfffff7fa4060  // b.any
   0x0000fffff7fa402c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa4030:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4034:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4038:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa403c:	54000121	b.ne	0xfffff7fa4060  // b.any
   0x0000fffff7fa4040:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa4044:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa4048:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa404c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4050:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4054:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa4058:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa405c:	14000030	b	0xfffff7fa411c
   0x0000fffff7fa4060:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4064:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4068:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa406c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4070:	54000120	b.eq	0xfffff7fa4094  // b.none
   0x0000fffff7fa4074:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4078:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa407c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4080:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4084:	54000321	b.ne	0xfffff7fa40e8  // b.any
   0x0000fffff7fa4088:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa408c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa4090:	14000002	b	0xfffff7fa4098
   0x0000fffff7fa4094:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa4098:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa409c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa40a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa40a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa40a8:	54000120	b.eq	0xfffff7fa40cc  // b.none
   0x0000fffff7fa40ac:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa40b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa40b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa40b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa40bc:	54000161	b.ne	0xfffff7fa40e8  // b.any
   0x0000fffff7fa40c0:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa40c4:	9e620121	scvtf	d1, x9
   0x0000fffff7fa40c8:	14000002	b	0xfffff7fa40d0
   0x0000fffff7fa40cc:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa40d0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa40d4:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa40d8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa40dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa40e0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa40e4:	17ffffde	b	0xfffff7fa405c
   0x0000fffff7fa40e8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa40ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa40f0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa40f4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa40f8:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fa40fc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4100:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4104:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa4108:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa410c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4110:	d63f0200	blr	x16
   0x0000fffff7fa4114:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4118:	54006d80	b.eq	0xfffff7fa4ec8  // b.none
   0x0000fffff7fa411c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa4120:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa4124:	54000380	b.eq	0xfffff7fa4194  // b.none
   0x0000fffff7fa4128:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa412c:	37d8034d	tbnz	w13, #27, 0xfffff7fa4194
   0x0000fffff7fa4130:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa4134:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa4138:	36d80211	tbz	w17, #27, 0xfffff7fa4178
   0x0000fffff7fa413c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa4140:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa4144:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa4148:	54000261	b.ne	0xfffff7fa4194  // b.any
   0x0000fffff7fa414c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa4150:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4154:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa4158:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa415c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa4160:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa4164:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa4168:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa416c:	54000149	b.ls	0xfffff7fa4194  // b.plast
   0x0000fffff7fa4170:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa4174:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa4178:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa417c:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa4180:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa4184:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa4188:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa418c:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa4190:	1400000e	b	0xfffff7fa41c8
   0x0000fffff7fa4194:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa4198:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa419c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa41a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa41a4:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fa41a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa41ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fa41b0:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa41b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa41b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa41bc:	d63f0200	blr	x16
   0x0000fffff7fa41c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa41c4:	54006860	b.eq	0xfffff7fa4ed0  // b.none
   0x0000fffff7fa41c8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa41cc:	37d806a9	tbnz	w9, #27, 0xfffff7fa42a0
   0x0000fffff7fa41d0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa41d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa41d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa41dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa41e0:	540001c1	b.ne	0xfffff7fa4218  // b.any
   0x0000fffff7fa41e4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa41e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa41ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa41f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa41f4:	54000121	b.ne	0xfffff7fa4218  // b.any
   0x0000fffff7fa41f8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa41fc:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa4200:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa4204:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4208:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa420c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa4210:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa4214:	14000030	b	0xfffff7fa42d4
   0x0000fffff7fa4218:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa421c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4220:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4224:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4228:	54000120	b.eq	0xfffff7fa424c  // b.none
   0x0000fffff7fa422c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4230:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4234:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4238:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa423c:	54000321	b.ne	0xfffff7fa42a0  // b.any
   0x0000fffff7fa4240:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa4244:	9e620120	scvtf	d0, x9
   0x0000fffff7fa4248:	14000002	b	0xfffff7fa4250
   0x0000fffff7fa424c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa4250:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa4254:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4258:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa425c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4260:	54000120	b.eq	0xfffff7fa4284  // b.none
   0x0000fffff7fa4264:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa4268:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa426c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4270:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4274:	54000161	b.ne	0xfffff7fa42a0  // b.any
   0x0000fffff7fa4278:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa427c:	9e620121	scvtf	d1, x9
   0x0000fffff7fa4280:	14000002	b	0xfffff7fa4288
   0x0000fffff7fa4284:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa4288:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa428c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa4290:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4294:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4298:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa429c:	17ffffde	b	0xfffff7fa4214
   0x0000fffff7fa42a0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa42a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa42a8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa42ac:	aa1503e2	mov	x2, x21
   0x0000fffff7fa42b0:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fa42b4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa42b8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa42bc:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa42c0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa42c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa42c8:	d63f0200	blr	x16
   0x0000fffff7fa42cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa42d0:	54006040	b.eq	0xfffff7fa4ed8  // b.none
   0x0000fffff7fa42d4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa42d8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa42dc:	54000380	b.eq	0xfffff7fa434c  // b.none
   0x0000fffff7fa42e0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa42e4:	37d8034d	tbnz	w13, #27, 0xfffff7fa434c
   0x0000fffff7fa42e8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa42ec:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa42f0:	36d80211	tbz	w17, #27, 0xfffff7fa4330
   0x0000fffff7fa42f4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa42f8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa42fc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa4300:	54000261	b.ne	0xfffff7fa434c  // b.any
   0x0000fffff7fa4304:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa4308:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa430c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa4310:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa4314:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa4318:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa431c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa4320:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa4324:	54000149	b.ls	0xfffff7fa434c  // b.plast
   0x0000fffff7fa4328:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa432c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa4330:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa4334:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa4338:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa433c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa4340:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa4344:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa4348:	1400000e	b	0xfffff7fa4380
   0x0000fffff7fa434c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa4350:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4354:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4358:	aa1503e2	mov	x2, x21
   0x0000fffff7fa435c:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fa4360:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4364:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4368:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa436c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa4370:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4374:	d63f0200	blr	x16
   0x0000fffff7fa4378:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa437c:	54005b20	b.eq	0xfffff7fa4ee0  // b.none
   0x0000fffff7fa4380:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4384:	37d806a9	tbnz	w9, #27, 0xfffff7fa4458
   0x0000fffff7fa4388:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa438c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4390:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4394:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4398:	540001c1	b.ne	0xfffff7fa43d0  // b.any
   0x0000fffff7fa439c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa43a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa43a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa43a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa43ac:	54000121	b.ne	0xfffff7fa43d0  // b.any
   0x0000fffff7fa43b0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa43b4:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa43b8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa43bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa43c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa43c4:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa43c8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa43cc:	14000030	b	0xfffff7fa448c
   0x0000fffff7fa43d0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa43d4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa43d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa43dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa43e0:	54000120	b.eq	0xfffff7fa4404  // b.none
   0x0000fffff7fa43e4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa43e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa43ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa43f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa43f4:	54000321	b.ne	0xfffff7fa4458  // b.any
   0x0000fffff7fa43f8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa43fc:	9e620120	scvtf	d0, x9
   0x0000fffff7fa4400:	14000002	b	0xfffff7fa4408
   0x0000fffff7fa4404:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa4408:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa440c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4410:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4414:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4418:	54000120	b.eq	0xfffff7fa443c  // b.none
   0x0000fffff7fa441c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa4420:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4424:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4428:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa442c:	54000161	b.ne	0xfffff7fa4458  // b.any
   0x0000fffff7fa4430:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa4434:	9e620121	scvtf	d1, x9
   0x0000fffff7fa4438:	14000002	b	0xfffff7fa4440
   0x0000fffff7fa443c:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa4440:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa4444:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa4448:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa444c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4450:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa4454:	17ffffde	b	0xfffff7fa43cc
   0x0000fffff7fa4458:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa445c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4460:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4464:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4468:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fa446c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4470:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4474:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa4478:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa447c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4480:	d63f0200	blr	x16
   0x0000fffff7fa4484:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4488:	54005300	b.eq	0xfffff7fa4ee8  // b.none
   0x0000fffff7fa448c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa4490:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa4494:	54000380	b.eq	0xfffff7fa4504  // b.none
   0x0000fffff7fa4498:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa449c:	37d8034d	tbnz	w13, #27, 0xfffff7fa4504
   0x0000fffff7fa44a0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa44a4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa44a8:	36d80211	tbz	w17, #27, 0xfffff7fa44e8
   0x0000fffff7fa44ac:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa44b0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa44b4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa44b8:	54000261	b.ne	0xfffff7fa4504  // b.any
   0x0000fffff7fa44bc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa44c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa44c4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa44c8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa44cc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa44d0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa44d4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa44d8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa44dc:	54000149	b.ls	0xfffff7fa4504  // b.plast
   0x0000fffff7fa44e0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa44e4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa44e8:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa44ec:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa44f0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa44f4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa44f8:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa44fc:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa4500:	1400000e	b	0xfffff7fa4538
   0x0000fffff7fa4504:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa4508:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa450c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4510:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4514:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fa4518:	aa1403e4	mov	x4, x20
   0x0000fffff7fa451c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4520:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa4524:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa4528:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa452c:	d63f0200	blr	x16
   0x0000fffff7fa4530:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4534:	54004de0	b.eq	0xfffff7fa4ef0  // b.none
   0x0000fffff7fa4538:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa453c:	37d806a9	tbnz	w9, #27, 0xfffff7fa4610
   0x0000fffff7fa4540:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4544:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4548:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa454c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4550:	540001c1	b.ne	0xfffff7fa4588  // b.any
   0x0000fffff7fa4554:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa4558:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa455c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4560:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4564:	54000121	b.ne	0xfffff7fa4588  // b.any
   0x0000fffff7fa4568:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa456c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa4570:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa4574:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4578:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa457c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa4580:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa4584:	14000030	b	0xfffff7fa4644
   0x0000fffff7fa4588:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa458c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4590:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4594:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4598:	54000120	b.eq	0xfffff7fa45bc  // b.none
   0x0000fffff7fa459c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa45a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa45a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa45a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa45ac:	54000321	b.ne	0xfffff7fa4610  // b.any
   0x0000fffff7fa45b0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa45b4:	9e620120	scvtf	d0, x9
   0x0000fffff7fa45b8:	14000002	b	0xfffff7fa45c0
   0x0000fffff7fa45bc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa45c0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa45c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa45c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa45cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa45d0:	54000120	b.eq	0xfffff7fa45f4  // b.none
   0x0000fffff7fa45d4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa45d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa45dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa45e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa45e4:	54000161	b.ne	0xfffff7fa4610  // b.any
   0x0000fffff7fa45e8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa45ec:	9e620121	scvtf	d1, x9
   0x0000fffff7fa45f0:	14000002	b	0xfffff7fa45f8
   0x0000fffff7fa45f4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa45f8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa45fc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa4600:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4604:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4608:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa460c:	17ffffde	b	0xfffff7fa4584
   0x0000fffff7fa4610:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa4614:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4618:	aa1303e1	mov	x1, x19
   0x0000fffff7fa461c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4620:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fa4624:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4628:	aa1603e5	mov	x5, x22
   0x0000fffff7fa462c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa4630:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa4634:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4638:	d63f0200	blr	x16
   0x0000fffff7fa463c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4640:	540045c0	b.eq	0xfffff7fa4ef8  // b.none
   0x0000fffff7fa4644:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa4648:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa464c:	54000380	b.eq	0xfffff7fa46bc  // b.none
   0x0000fffff7fa4650:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa4654:	37d8034d	tbnz	w13, #27, 0xfffff7fa46bc
   0x0000fffff7fa4658:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa465c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa4660:	36d80211	tbz	w17, #27, 0xfffff7fa46a0
   0x0000fffff7fa4664:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa4668:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa466c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa4670:	54000261	b.ne	0xfffff7fa46bc  // b.any
   0x0000fffff7fa4674:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa4678:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa467c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa4680:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa4684:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa4688:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa468c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa4690:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa4694:	54000149	b.ls	0xfffff7fa46bc  // b.plast
   0x0000fffff7fa4698:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa469c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa46a0:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa46a4:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa46a8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa46ac:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa46b0:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa46b4:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa46b8:	1400000e	b	0xfffff7fa46f0
   0x0000fffff7fa46bc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa46c0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa46c4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa46c8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa46cc:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fa46d0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa46d4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa46d8:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa46dc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa46e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa46e4:	d63f0200	blr	x16
   0x0000fffff7fa46e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa46ec:	540040a0	b.eq	0xfffff7fa4f00  // b.none
   0x0000fffff7fa46f0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa46f4:	37d806a9	tbnz	w9, #27, 0xfffff7fa47c8
   0x0000fffff7fa46f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa46fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4700:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4704:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4708:	540001c1	b.ne	0xfffff7fa4740  // b.any
   0x0000fffff7fa470c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa4710:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4714:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4718:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa471c:	54000121	b.ne	0xfffff7fa4740  // b.any
   0x0000fffff7fa4720:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa4724:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa4728:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa472c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4730:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4734:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa4738:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa473c:	14000030	b	0xfffff7fa47fc
   0x0000fffff7fa4740:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4744:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4748:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa474c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4750:	54000120	b.eq	0xfffff7fa4774  // b.none
   0x0000fffff7fa4754:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4758:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa475c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4760:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4764:	54000321	b.ne	0xfffff7fa47c8  // b.any
   0x0000fffff7fa4768:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa476c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa4770:	14000002	b	0xfffff7fa4778
   0x0000fffff7fa4774:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa4778:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa477c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4780:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4784:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4788:	54000120	b.eq	0xfffff7fa47ac  // b.none
   0x0000fffff7fa478c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa4790:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4794:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4798:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa479c:	54000161	b.ne	0xfffff7fa47c8  // b.any
   0x0000fffff7fa47a0:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa47a4:	9e620121	scvtf	d1, x9
   0x0000fffff7fa47a8:	14000002	b	0xfffff7fa47b0
   0x0000fffff7fa47ac:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa47b0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa47b4:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa47b8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa47bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa47c0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa47c4:	17ffffde	b	0xfffff7fa473c
   0x0000fffff7fa47c8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa47cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa47d0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa47d4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa47d8:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fa47dc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa47e0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa47e4:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa47e8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa47ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa47f0:	d63f0200	blr	x16
   0x0000fffff7fa47f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa47f8:	54003880	b.eq	0xfffff7fa4f08  // b.none
   0x0000fffff7fa47fc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa4800:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa4804:	54000380	b.eq	0xfffff7fa4874  // b.none
   0x0000fffff7fa4808:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa480c:	37d8034d	tbnz	w13, #27, 0xfffff7fa4874
   0x0000fffff7fa4810:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa4814:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa4818:	36d80211	tbz	w17, #27, 0xfffff7fa4858
   0x0000fffff7fa481c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa4820:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa4824:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa4828:	54000261	b.ne	0xfffff7fa4874  // b.any
   0x0000fffff7fa482c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa4830:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4834:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa4838:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa483c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa4840:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa4844:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa4848:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa484c:	54000149	b.ls	0xfffff7fa4874  // b.plast
   0x0000fffff7fa4850:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa4854:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa4858:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa485c:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa4860:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa4864:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa4868:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa486c:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa4870:	1400000e	b	0xfffff7fa48a8
   0x0000fffff7fa4874:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa4878:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa487c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4880:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4884:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fa4888:	aa1403e4	mov	x4, x20
   0x0000fffff7fa488c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4890:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa4894:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa4898:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa489c:	d63f0200	blr	x16
   0x0000fffff7fa48a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa48a4:	54003360	b.eq	0xfffff7fa4f10  // b.none
   0x0000fffff7fa48a8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa48ac:	37d806a9	tbnz	w9, #27, 0xfffff7fa4980
   0x0000fffff7fa48b0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa48b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa48b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa48bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa48c0:	540001c1	b.ne	0xfffff7fa48f8  // b.any
   0x0000fffff7fa48c4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa48c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa48cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa48d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa48d4:	54000121	b.ne	0xfffff7fa48f8  // b.any
   0x0000fffff7fa48d8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa48dc:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa48e0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa48e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa48e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa48ec:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa48f0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa48f4:	14000030	b	0xfffff7fa49b4
   0x0000fffff7fa48f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa48fc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4900:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4904:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4908:	54000120	b.eq	0xfffff7fa492c  // b.none
   0x0000fffff7fa490c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4910:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4914:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4918:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa491c:	54000321	b.ne	0xfffff7fa4980  // b.any
   0x0000fffff7fa4920:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa4924:	9e620120	scvtf	d0, x9
   0x0000fffff7fa4928:	14000002	b	0xfffff7fa4930
   0x0000fffff7fa492c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa4930:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa4934:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4938:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa493c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4940:	54000120	b.eq	0xfffff7fa4964  // b.none
   0x0000fffff7fa4944:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa4948:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa494c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4950:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4954:	54000161	b.ne	0xfffff7fa4980  // b.any
   0x0000fffff7fa4958:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa495c:	9e620121	scvtf	d1, x9
   0x0000fffff7fa4960:	14000002	b	0xfffff7fa4968
   0x0000fffff7fa4964:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa4968:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa496c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa4970:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4974:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4978:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa497c:	17ffffde	b	0xfffff7fa48f4
   0x0000fffff7fa4980:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa4984:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4988:	aa1303e1	mov	x1, x19
   0x0000fffff7fa498c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4990:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fa4994:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4998:	aa1603e5	mov	x5, x22
   0x0000fffff7fa499c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa49a0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa49a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa49a8:	d63f0200	blr	x16
   0x0000fffff7fa49ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa49b0:	54002b40	b.eq	0xfffff7fa4f18  // b.none
   0x0000fffff7fa49b4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa49b8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa49bc:	54000380	b.eq	0xfffff7fa4a2c  // b.none
   0x0000fffff7fa49c0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa49c4:	37d8034d	tbnz	w13, #27, 0xfffff7fa4a2c
   0x0000fffff7fa49c8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa49cc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa49d0:	36d80211	tbz	w17, #27, 0xfffff7fa4a10
   0x0000fffff7fa49d4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa49d8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa49dc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa49e0:	54000261	b.ne	0xfffff7fa4a2c  // b.any
   0x0000fffff7fa49e4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa49e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa49ec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa49f0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa49f4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa49f8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa49fc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa4a00:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa4a04:	54000149	b.ls	0xfffff7fa4a2c  // b.plast
   0x0000fffff7fa4a08:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa4a0c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa4a10:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa4a14:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa4a18:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa4a1c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa4a20:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa4a24:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa4a28:	1400000e	b	0xfffff7fa4a60
   0x0000fffff7fa4a2c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa4a30:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4a34:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4a38:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4a3c:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fa4a40:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4a44:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4a48:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa4a4c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa4a50:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4a54:	d63f0200	blr	x16
   0x0000fffff7fa4a58:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4a5c:	54002620	b.eq	0xfffff7fa4f20  // b.none
   0x0000fffff7fa4a60:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4a64:	37d806a9	tbnz	w9, #27, 0xfffff7fa4b38
   0x0000fffff7fa4a68:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4a6c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4a70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4a74:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4a78:	540001c1	b.ne	0xfffff7fa4ab0  // b.any
   0x0000fffff7fa4a7c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa4a80:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4a84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4a88:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4a8c:	54000121	b.ne	0xfffff7fa4ab0  // b.any
   0x0000fffff7fa4a90:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa4a94:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa4a98:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa4a9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4aa0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4aa4:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa4aa8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa4aac:	14000030	b	0xfffff7fa4b6c
   0x0000fffff7fa4ab0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4ab4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4ab8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4abc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4ac0:	54000120	b.eq	0xfffff7fa4ae4  // b.none
   0x0000fffff7fa4ac4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4ac8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4acc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4ad0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4ad4:	54000321	b.ne	0xfffff7fa4b38  // b.any
   0x0000fffff7fa4ad8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa4adc:	9e620120	scvtf	d0, x9
   0x0000fffff7fa4ae0:	14000002	b	0xfffff7fa4ae8
   0x0000fffff7fa4ae4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa4ae8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa4aec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4af0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4af4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4af8:	54000120	b.eq	0xfffff7fa4b1c  // b.none
   0x0000fffff7fa4afc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa4b00:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4b04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4b08:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4b0c:	54000161	b.ne	0xfffff7fa4b38  // b.any
   0x0000fffff7fa4b10:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa4b14:	9e620121	scvtf	d1, x9
   0x0000fffff7fa4b18:	14000002	b	0xfffff7fa4b20
   0x0000fffff7fa4b1c:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa4b20:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa4b24:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa4b28:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4b2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4b30:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa4b34:	17ffffde	b	0xfffff7fa4aac
   0x0000fffff7fa4b38:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa4b3c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4b40:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4b44:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4b48:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fa4b4c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4b50:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4b54:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa4b58:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa4b5c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4b60:	d63f0200	blr	x16
   0x0000fffff7fa4b64:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4b68:	54001e00	b.eq	0xfffff7fa4f28  // b.none
   0x0000fffff7fa4b6c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa4b70:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa4b74:	54000380	b.eq	0xfffff7fa4be4  // b.none
   0x0000fffff7fa4b78:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa4b7c:	37d8034d	tbnz	w13, #27, 0xfffff7fa4be4
   0x0000fffff7fa4b80:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa4b84:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa4b88:	36d80211	tbz	w17, #27, 0xfffff7fa4bc8
   0x0000fffff7fa4b8c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa4b90:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa4b94:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa4b98:	54000261	b.ne	0xfffff7fa4be4  // b.any
   0x0000fffff7fa4b9c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa4ba0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa4ba4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa4ba8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa4bac:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa4bb0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa4bb4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa4bb8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa4bbc:	54000149	b.ls	0xfffff7fa4be4  // b.plast
   0x0000fffff7fa4bc0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa4bc4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa4bc8:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fa4bcc:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa4bd0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa4bd4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa4bd8:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa4bdc:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa4be0:	1400000e	b	0xfffff7fa4c18
   0x0000fffff7fa4be4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa4be8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4bec:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4bf0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4bf4:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fa4bf8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4bfc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4c00:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa4c04:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa4c08:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4c0c:	d63f0200	blr	x16
   0x0000fffff7fa4c10:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4c14:	540018e0	b.eq	0xfffff7fa4f30  // b.none
   0x0000fffff7fa4c18:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4c1c:	37d806a9	tbnz	w9, #27, 0xfffff7fa4cf0
   0x0000fffff7fa4c20:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4c24:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4c28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4c2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4c30:	540001c1	b.ne	0xfffff7fa4c68  // b.any
   0x0000fffff7fa4c34:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa4c38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4c3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4c40:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4c44:	54000121	b.ne	0xfffff7fa4c68  // b.any
   0x0000fffff7fa4c48:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa4c4c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fa4c50:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa4c54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4c58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4c5c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa4c60:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa4c64:	14000030	b	0xfffff7fa4d24
   0x0000fffff7fa4c68:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4c6c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4c70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4c74:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4c78:	54000120	b.eq	0xfffff7fa4c9c  // b.none
   0x0000fffff7fa4c7c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa4c80:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4c84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4c88:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4c8c:	54000321	b.ne	0xfffff7fa4cf0  // b.any
   0x0000fffff7fa4c90:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa4c94:	9e620120	scvtf	d0, x9
   0x0000fffff7fa4c98:	14000002	b	0xfffff7fa4ca0
   0x0000fffff7fa4c9c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa4ca0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa4ca4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4ca8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4cac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4cb0:	54000120	b.eq	0xfffff7fa4cd4  // b.none
   0x0000fffff7fa4cb4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa4cb8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4cbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4cc0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4cc4:	54000161	b.ne	0xfffff7fa4cf0  // b.any
   0x0000fffff7fa4cc8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa4ccc:	9e620121	scvtf	d1, x9
   0x0000fffff7fa4cd0:	14000002	b	0xfffff7fa4cd8
   0x0000fffff7fa4cd4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fa4cd8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa4cdc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa4ce0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa4ce4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4ce8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa4cec:	17ffffde	b	0xfffff7fa4c64
   0x0000fffff7fa4cf0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa4cf4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4cf8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4cfc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4d00:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fa4d04:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4d08:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4d0c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa4d10:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa4d14:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4d18:	d63f0200	blr	x16
   0x0000fffff7fa4d1c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4d20:	540010c0	b.eq	0xfffff7fa4f38  // b.none
   0x0000fffff7fa4d24:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa4d28:	37d80269	tbnz	w9, #27, 0xfffff7fa4d74
   0x0000fffff7fa4d2c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa4d30:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4d34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4d38:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa4d3c:	540001c1	b.ne	0xfffff7fa4d74  // b.any
   0x0000fffff7fa4d40:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa4d44:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7fa4d48:	8b0a012b	add	x11, x9, x10
   0x0000fffff7fa4d4c:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7fa4d50:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4d54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4d58:	b900526a	str	w10, [x19, #80]
   0x0000fffff7fa4d5c:	aa0b03e9	mov	x9, x11
   0x0000fffff7fa4d60:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4d64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4d68:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa4d6c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa4d70:	1400000e	b	0xfffff7fa4da8
   0x0000fffff7fa4d74:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa4d78:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4d7c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4d80:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4d84:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fa4d88:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4d8c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4d90:	d290bc10	mov	x16, #0x85e0                	// #34272
   0x0000fffff7fa4d94:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa4d98:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4d9c:	d63f0200	blr	x16
   0x0000fffff7fa4da0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa4da4:	54000ce0	b.eq	0xfffff7fa4f40  // b.none
   0x0000fffff7fa4da8:	17fff8d6	b	0xfffff7fa3100
   0x0000fffff7fa4dac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa4db0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa4db4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa4db8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa4dbc:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fa4dc0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa4dc4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa4dc8:	d286be90	mov	x16, #0x35f4                	// #13812
   0x0000fffff7fa4dcc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa4dd0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa4dd4:	d63f0200	blr	x16
   0x0000fffff7fa4dd8:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa4ddc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa4de0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa4de4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa4de8:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fa4dec:	d65f03c0	ret
   0x0000fffff7fa4df0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa4df4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa4df8:	b900028a	str	w10, [x20]
   0x0000fffff7fa4dfc:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fa4e00:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa4e04:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa4e08:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa4e0c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa4e10:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fa4e14:	d65f03c0	ret
   0x0000fffff7fa4e18:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fa4e1c:	17fffff5	b	0xfffff7fa4df0
   0x0000fffff7fa4e20:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fa4e24:	17fffff3	b	0xfffff7fa4df0
   0x0000fffff7fa4e28:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fa4e2c:	17fffff1	b	0xfffff7fa4df0
   0x0000fffff7fa4e30:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7fa4e34:	17ffffef	b	0xfffff7fa4df0
   0x0000fffff7fa4e38:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7fa4e3c:	17ffffed	b	0xfffff7fa4df0
   0x0000fffff7fa4e40:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fa4e44:	17ffffeb	b	0xfffff7fa4df0
   0x0000fffff7fa4e48:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fa4e4c:	17ffffe9	b	0xfffff7fa4df0
   0x0000fffff7fa4e50:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fa4e54:	17ffffe7	b	0xfffff7fa4df0
   0x0000fffff7fa4e58:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fa4e5c:	17ffffe5	b	0xfffff7fa4df0
   0x0000fffff7fa4e60:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fa4e64:	17ffffe3	b	0xfffff7fa4df0
   0x0000fffff7fa4e68:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fa4e6c:	17ffffe1	b	0xfffff7fa4df0
   0x0000fffff7fa4e70:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fa4e74:	17ffffdf	b	0xfffff7fa4df0
   0x0000fffff7fa4e78:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fa4e7c:	17ffffdd	b	0xfffff7fa4df0
   0x0000fffff7fa4e80:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fa4e84:	17ffffdb	b	0xfffff7fa4df0
   0x0000fffff7fa4e88:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fa4e8c:	17ffffd9	b	0xfffff7fa4df0
   0x0000fffff7fa4e90:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fa4e94:	17ffffd7	b	0xfffff7fa4df0
   0x0000fffff7fa4e98:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fa4e9c:	17ffffd5	b	0xfffff7fa4df0
   0x0000fffff7fa4ea0:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fa4ea4:	17ffffd3	b	0xfffff7fa4df0
   0x0000fffff7fa4ea8:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fa4eac:	17ffffd1	b	0xfffff7fa4df0
   0x0000fffff7fa4eb0:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fa4eb4:	17ffffcf	b	0xfffff7fa4df0
   0x0000fffff7fa4eb8:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fa4ebc:	17ffffcd	b	0xfffff7fa4df0
   0x0000fffff7fa4ec0:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fa4ec4:	17ffffcb	b	0xfffff7fa4df0
   0x0000fffff7fa4ec8:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fa4ecc:	17ffffc9	b	0xfffff7fa4df0
   0x0000fffff7fa4ed0:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fa4ed4:	17ffffc7	b	0xfffff7fa4df0
   0x0000fffff7fa4ed8:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fa4edc:	17ffffc5	b	0xfffff7fa4df0
   0x0000fffff7fa4ee0:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fa4ee4:	17ffffc3	b	0xfffff7fa4df0
   0x0000fffff7fa4ee8:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fa4eec:	17ffffc1	b	0xfffff7fa4df0
   0x0000fffff7fa4ef0:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fa4ef4:	17ffffbf	b	0xfffff7fa4df0
   0x0000fffff7fa4ef8:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fa4efc:	17ffffbd	b	0xfffff7fa4df0
   0x0000fffff7fa4f00:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fa4f04:	17ffffbb	b	0xfffff7fa4df0
   0x0000fffff7fa4f08:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fa4f0c:	17ffffb9	b	0xfffff7fa4df0
   0x0000fffff7fa4f10:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fa4f14:	17ffffb7	b	0xfffff7fa4df0
   0x0000fffff7fa4f18:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fa4f1c:	17ffffb5	b	0xfffff7fa4df0
   0x0000fffff7fa4f20:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fa4f24:	17ffffb3	b	0xfffff7fa4df0
   0x0000fffff7fa4f28:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fa4f2c:	17ffffb1	b	0xfffff7fa4df0
   0x0000fffff7fa4f30:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fa4f34:	17ffffaf	b	0xfffff7fa4df0
   0x0000fffff7fa4f38:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fa4f3c:	17ffffad	b	0xfffff7fa4df0
   0x0000fffff7fa4f40:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fa4f44:	17ffffab	b	0xfffff7fa4df0
   0x0000fffff7fa4f48:	00000000	udf	#0
   0x0000fffff7fa4f4c:	00000000	udf	#0
   0x0000fffff7fa4f50:	00000000	udf	#0
   0x0000fffff7fa4f54:	00000000	udf	#0
   0x0000fffff7fa4f58:	00000000	udf	#0
   0x0000fffff7fa4f5c:	00000000	udf	#0
   0x0000fffff7fa4f60:	00000000	udf	#0
   0x0000fffff7fa4f64:	00000000	udf	#0
   0x0000fffff7fa4f68:	00000000	udf	#0
   0x0000fffff7fa4f6c:	00000000	udf	#0
   0x0000fffff7fa4f70:	00000000	udf	#0
   0x0000fffff7fa4f74:	00000000	udf	#0
   0x0000fffff7fa4f78:	00000000	udf	#0
   0x0000fffff7fa4f7c:	00000000	udf	#0
   0x0000fffff7fa4f80:	00000000	udf	#0
   0x0000fffff7fa4f84:	00000000	udf	#0
   0x0000fffff7fa4f88:	00000000	udf	#0
   0x0000fffff7fa4f8c:	00000000	udf	#0
   0x0000fffff7fa4f90:	00000000	udf	#0
   0x0000fffff7fa4f94:	00000000	udf	#0
   0x0000fffff7fa4f98:	00000000	udf	#0
   0x0000fffff7fa4f9c:	00000000	udf	#0
   0x0000fffff7fa4fa0:	00000000	udf	#0
   0x0000fffff7fa4fa4:	00000000	udf	#0
   0x0000fffff7fa4fa8:	00000000	udf	#0
   0x0000fffff7fa4fac:	00000000	udf	#0
   0x0000fffff7fa4fb0:	00000000	udf	#0
   0x0000fffff7fa4fb4:	00000000	udf	#0
   0x0000fffff7fa4fb8:	00000000	udf	#0
   0x0000fffff7fa4fbc:	00000000	udf	#0
   0x0000fffff7fa4fc0:	00000000	udf	#0
   0x0000fffff7fa4fc4:	00000000	udf	#0
   0x0000fffff7fa4fc8:	00000000	udf	#0
   0x0000fffff7fa4fcc:	00000000	udf	#0
   0x0000fffff7fa4fd0:	00000000	udf	#0
   0x0000fffff7fa4fd4:	00000000	udf	#0
   0x0000fffff7fa4fd8:	00000000	udf	#0
   0x0000fffff7fa4fdc:	00000000	udf	#0
   0x0000fffff7fa4fe0:	00000000	udf	#0
   0x0000fffff7fa4fe4:	00000000	udf	#0
   0x0000fffff7fa4fe8:	00000000	udf	#0
   0x0000fffff7fa4fec:	00000000	udf	#0
   0x0000fffff7fa4ff0:	00000000	udf	#0
   0x0000fffff7fa4ff4:	00000000	udf	#0
   0x0000fffff7fa4ff8:	00000000	udf	#0
   0x0000fffff7fa4ffc:	00000000	udf	#0
End of assembler dump.
