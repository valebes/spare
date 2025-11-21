# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/curve25519/edwards25519_decode.S"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 467 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/curve25519/edwards25519_decode.S" 2
# 28 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/curve25519/edwards25519_decode.S"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/include/_internal_s2n_bignum.h" 1
# 29 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/curve25519/edwards25519_decode.S" 2

        .globl _edwards25519_decode


        .text
        .balign 4
# 81 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/curve25519/edwards25519_decode.S"
_edwards25519_decode:



        stp x19, x20, [sp, -16]!
        stp x21, x30, [sp, -16]!
        sub sp, sp, #(24*8)



        mov x19, x0





        ldrb w0, [x1]
        lsl x4, x0, #56
        ldrb w0, [x1, #1]
        extr x4, x0, x4, #8
        ldrb w0, [x1, #2]
        extr x4, x0, x4, #8
        ldrb w0, [x1, #3]
        extr x4, x0, x4, #8
        ldrb w0, [x1, #4]
        extr x4, x0, x4, #8
        ldrb w0, [x1, #5]
        extr x4, x0, x4, #8
        ldrb w0, [x1, #6]
        extr x4, x0, x4, #8
        ldrb w0, [x1, #7]
        extr x4, x0, x4, #8

        ldrb w0, [x1, #8]
        lsl x5, x0, #56
        ldrb w0, [x1, #9]
        extr x5, x0, x5, #8
        ldrb w0, [x1, #10]
        extr x5, x0, x5, #8
        ldrb w0, [x1, #11]
        extr x5, x0, x5, #8
        ldrb w0, [x1, #12]
        extr x5, x0, x5, #8
        ldrb w0, [x1, #13]
        extr x5, x0, x5, #8
        ldrb w0, [x1, #14]
        extr x5, x0, x5, #8
        ldrb w0, [x1, #15]
        extr x5, x0, x5, #8

        ldrb w0, [x1, #16]
        lsl x6, x0, #56
        ldrb w0, [x1, #17]
        extr x6, x0, x6, #8
        ldrb w0, [x1, #18]
        extr x6, x0, x6, #8
        ldrb w0, [x1, #19]
        extr x6, x0, x6, #8
        ldrb w0, [x1, #20]
        extr x6, x0, x6, #8
        ldrb w0, [x1, #21]
        extr x6, x0, x6, #8
        ldrb w0, [x1, #22]
        extr x6, x0, x6, #8
        ldrb w0, [x1, #23]
        extr x6, x0, x6, #8

        ldrb w0, [x1, #24]
        lsl x7, x0, #56
        ldrb w0, [x1, #25]
        extr x7, x0, x7, #8
        ldrb w0, [x1, #26]
        extr x7, x0, x7, #8
        ldrb w0, [x1, #27]
        extr x7, x0, x7, #8
        ldrb w0, [x1, #28]
        extr x7, x0, x7, #8
        ldrb w0, [x1, #29]
        extr x7, x0, x7, #8
        ldrb w0, [x1, #30]
        extr x7, x0, x7, #8
        ldrb w0, [x1, #31]
        extr x7, x0, x7, #8

        stp x4, x5, [sp, #0]
        lsr x20, x7, #63
        and x7, x7, #0x7FFFFFFFFFFFFFFF
        stp x6, x7, [sp, #0 +16]

        adds xzr, x4, #19
        adcs xzr, x5, xzr
        adcs xzr, x6, xzr
        adcs xzr, x7, xzr
        cset x21, mi





        add x0, sp, #(16*8)
	 mov x1, 1
	 add x2, sp, #0
	 bl edwards25519_decode_nsqr_p25519
        ldp x0, x1, [sp, #(16*8)]
        ldp x2, x3, [sp, #(16*8)+16]
        mov x4, #0x8000000000000000
        subs x0, x0, #20
        sbcs x1, x1, xzr
        sbcs x2, x2, xzr
        sbc x3, x3, x4
        stp x0, x1, [sp, #(12*8)]
        stp x2, x3, [sp, #(12*8)+16]

        movz x0, #0x78a3
	 movk x0, #0x1359, lsl #16
	 movk x0, #0x4dca, lsl #32
	 movk x0, #0x75eb, lsl #48
        movz x1, #0xd8ab
	 movk x1, #0x4141, lsl #16
	 movk x1, #0x0a4d, lsl #32
	 movk x1, #0x0070, lsl #48
        movz x2, #0xe898
	 movk x2, #0x7779, lsl #16
	 movk x2, #0x4079, lsl #32
	 movk x2, #0x8cc7, lsl #48
        movz x3, #0xfe73
	 movk x3, #0x2b6f, lsl #16
	 movk x3, #0x6cee, lsl #32
	 movk x3, #0x5203, lsl #48
        stp x0, x1, [sp, #(20*8)]
        stp x2, x3, [sp, #(20*8)+16]
        add x0, sp, #(16*8)
	 add x1, sp, #(20*8)
	 add x2, sp, #(16*8)
	 bl edwards25519_decode_mul_p25519
        ldp x0, x1, [sp, #(16*8)]
        ldp x2, x3, [sp, #(16*8)+16]
        adds x0, x0, #1
        adcs x1, x1, xzr
        adcs x2, x2, xzr
        adcs x3, x3, xzr
        stp x0, x1, [sp, #(16*8)]
        stp x2, x3, [sp, #(16*8)+16]

        add x0, sp, #(20*8)
	 add x1, sp, #(12*8)
	 add x2, sp, #(16*8)
	 bl edwards25519_decode_mul_p25519




        add x0, sp, #(8*8)
	 mov x1, 1
	 add x2, sp, #(20*8)
	 bl edwards25519_decode_nsqr_p25519
        add x0, sp, #(8*8)
	 add x1, sp, #(8*8)
	 add x2, sp, #(20*8)
	 bl edwards25519_decode_mul_p25519
        add x0, sp, #(4*8)
	 mov x1, 2
	 add x2, sp, #(8*8)
	 bl edwards25519_decode_nsqr_p25519
        add x0, sp, #(8*8)
	 add x1, sp, #(4*8)
	 add x2, sp, #(8*8)
	 bl edwards25519_decode_mul_p25519
        add x0, sp, #(4*8)
	 mov x1, 1
	 add x2, sp, #(8*8)
	 bl edwards25519_decode_nsqr_p25519
        add x0, sp, #(16*8)
	 add x1, sp, #(4*8)
	 add x2, sp, #(20*8)
	 bl edwards25519_decode_mul_p25519
        add x0, sp, #(4*8)
	 mov x1, 5
	 add x2, sp, #(16*8)
	 bl edwards25519_decode_nsqr_p25519
        add x0, sp, #(8*8)
	 add x1, sp, #(4*8)
	 add x2, sp, #(16*8)
	 bl edwards25519_decode_mul_p25519
        add x0, sp, #(4*8)
	 mov x1, 10
	 add x2, sp, #(8*8)
	 bl edwards25519_decode_nsqr_p25519
        add x0, sp, #(8*8)
	 add x1, sp, #(4*8)
	 add x2, sp, #(8*8)
	 bl edwards25519_decode_mul_p25519
        add x0, sp, #(4*8)
	 mov x1, 5
	 add x2, sp, #(8*8)
	 bl edwards25519_decode_nsqr_p25519
        add x0, sp, #(16*8)
	 add x1, sp, #(4*8)
	 add x2, sp, #(16*8)
	 bl edwards25519_decode_mul_p25519
        add x0, sp, #(4*8)
	 mov x1, 25
	 add x2, sp, #(16*8)
	 bl edwards25519_decode_nsqr_p25519
        add x0, sp, #(8*8)
	 add x1, sp, #(4*8)
	 add x2, sp, #(16*8)
	 bl edwards25519_decode_mul_p25519
        add x0, sp, #(4*8)
	 mov x1, 50
	 add x2, sp, #(8*8)
	 bl edwards25519_decode_nsqr_p25519
        add x0, sp, #(8*8)
	 add x1, sp, #(4*8)
	 add x2, sp, #(8*8)
	 bl edwards25519_decode_mul_p25519
        add x0, sp, #(4*8)
	 mov x1, 25
	 add x2, sp, #(8*8)
	 bl edwards25519_decode_nsqr_p25519
        add x0, sp, #(16*8)
	 add x1, sp, #(4*8)
	 add x2, sp, #(16*8)
	 bl edwards25519_decode_mul_p25519
        add x0, sp, #(4*8)
	 mov x1, 125
	 add x2, sp, #(16*8)
	 bl edwards25519_decode_nsqr_p25519
        add x0, sp, #(16*8)
	 add x1, sp, #(4*8)
	 add x2, sp, #(16*8)
	 bl edwards25519_decode_mul_p25519
        add x0, sp, #(4*8)
	 mov x1, 2
	 add x2, sp, #(16*8)
	 bl edwards25519_decode_nsqr_p25519
        add x0, sp, #(4*8)
	 add x1, sp, #(4*8)
	 add x2, sp, #(20*8)
	 bl edwards25519_decode_mul_p25519




        add x0, sp, #(16*8)
	 mov x1, 1
	 add x2, sp, #(4*8)
	 bl edwards25519_decode_nsqr_p25519
        add x0, sp, #(16*8)
	 add x1, sp, #(16*8)
	 add x2, sp, #(20*8)
	 bl edwards25519_decode_mul_p25519




        add x0, sp, #(4*8)
	 add x1, sp, #(12*8)
	 add x2, sp, #(4*8)
	 bl edwards25519_decode_mul_p25519
        movz x0, #0xa0b0
	 movk x0, #0x4a0e, lsl #16
	 movk x0, #0x1b27, lsl #32
	 movk x0, #0xc4ee, lsl #48
        movz x1, #0xe478
	 movk x1, #0xad2f, lsl #16
	 movk x1, #0x1806, lsl #32
	 movk x1, #0x2f43, lsl #48
        movz x2, #0xd7a7
	 movk x2, #0x3dfb, lsl #16
	 movk x2, #0x0099, lsl #32
	 movk x2, #0x2b4d, lsl #48
        movz x3, #0xdf0b
	 movk x3, #0x4fc1, lsl #16
	 movk x3, #0x2480, lsl #32
	 movk x3, #0x2b83, lsl #48
        stp x0, x1, [sp, #(8*8)]
        stp x2, x3, [sp, #(8*8)+16]
        add x0, sp, #(8*8)
	 add x1, sp, #(4*8)
	 add x2, sp, #(8*8)
	 bl edwards25519_decode_mul_p25519



        ldp x0, x1, [sp, #(16*8)]
        ldp x2, x3, [sp, #(16*8)+16]
        bic x4, x0, #1
        orr x4, x4, x1
        orr x5, x2, x3
        orr x4, x4, x5



        add x0, x0, #20
        add x1, x1, #1
        orr x0, x0, x1
        add x2, x2, #1
        eor x3, x3, #0x7FFFFFFFFFFFFFFF
        orr x2, x2, x3
        orr x0, x0, x2



        cmp x4, xzr
        ldp x10, x11, [sp, #(4*8)]
        ldp x14, x15, [sp, #(8*8)]
        csel x10, x10, x14, eq
        csel x11, x11, x15, eq
        ldp x12, x13, [sp, #(4*8)+16]
        ldp x16, x17, [sp, #(8*8)+16]
        csel x12, x12, x16, eq
        csel x13, x13, x17, eq
        stp x10, x11, [sp, #(4*8)]
        stp x12, x13, [sp, #(4*8)+16]



        ccmp x0, xzr, 4, ne
        cset x0, ne
        orr x21, x21, x0



        ldp x0, x1, [sp, #(4*8)]
        ldp x2, x3, [sp, #(4*8)+16]
        mov x4, #-19
        subs x4, x4, x0
        mov x6, #-1
        sbcs x5, x6, x1
        sbcs x6, x6, x2
        mov x7, #0x7FFFFFFFFFFFFFFF
        sbc x7, x7, x3






        and x9, x0, #1
        eor x20, x9, x20
        orr x8, x0, x1
        orr x9, x2, x3
        orr x8, x8, x9
        orr x10, x21, x20
        cmp x8, xzr
        csel x21, x10, x21, eq
        ccmp x20, xzr, #4, ne



        csel x0, x0, x4, eq
        csel x1, x1, x5, eq
        csel x2, x2, x6, eq
        csel x3, x3, x7, eq
        ldp x8, x9, [sp, #0]
        ldp x10, x11, [sp, #0 +16]

        stp x0, x1, [x19]
        stp x2, x3, [x19, #16]
        stp x8, x9, [x19, #32]
        stp x10, x11, [x19, #48]

        mov x0, x21



        add sp, sp, #(24*8)

        ldp x21, x30, [sp], 16
        ldp x19, x20, [sp], 16
        ret





edwards25519_decode_mul_p25519:
        ldp x3, x4, [x1]
        ldp x5, x6, [x2]
        umull x7, w3, w5
        lsr x17, x3, #32
        umull x15, w17, w5
        lsr x16, x5, #32
        umull x8, w16, w17
        umull x16, w3, w16
        adds x7, x7, x15, lsl #32
        lsr x15, x15, #32
        adc x8, x8, x15
        adds x7, x7, x16, lsl #32
        lsr x16, x16, #32
        adc x8, x8, x16
        mul x9, x4, x6
        umulh x10, x4, x6
        subs x4, x4, x3
        cneg x4, x4, lo
        csetm x16, lo
        adds x9, x9, x8
        adc x10, x10, xzr
        subs x3, x5, x6
        cneg x3, x3, lo
        cinv x16, x16, lo
        mul x15, x4, x3
        umulh x3, x4, x3
        adds x8, x7, x9
        adcs x9, x9, x10
        adc x10, x10, xzr
        cmn x16, #1
        eor x15, x15, x16
        adcs x8, x15, x8
        eor x3, x3, x16
        adcs x9, x3, x9
        adc x10, x10, x16
        ldp x3, x4, [x1, #16]
        ldp x5, x6, [x2, #16]
        umull x11, w3, w5
        lsr x17, x3, #32
        umull x15, w17, w5
        lsr x16, x5, #32
        umull x12, w16, w17
        umull x16, w3, w16
        adds x11, x11, x15, lsl #32
        lsr x15, x15, #32
        adc x12, x12, x15
        adds x11, x11, x16, lsl #32
        lsr x16, x16, #32
        adc x12, x12, x16
        mul x13, x4, x6
        umulh x14, x4, x6
        subs x4, x4, x3
        cneg x4, x4, lo
        csetm x16, lo
        adds x13, x13, x12
        adc x14, x14, xzr
        subs x3, x5, x6
        cneg x3, x3, lo
        cinv x16, x16, lo
        mul x15, x4, x3
        umulh x3, x4, x3
        adds x12, x11, x13
        adcs x13, x13, x14
        adc x14, x14, xzr
        cmn x16, #1
        eor x15, x15, x16
        adcs x12, x15, x12
        eor x3, x3, x16
        adcs x13, x3, x13
        adc x14, x14, x16
        ldp x3, x4, [x1, #16]
        ldp x15, x16, [x1]
        subs x3, x3, x15
        sbcs x4, x4, x16
        csetm x16, lo
        ldp x15, x17, [x2]
        subs x5, x15, x5
        sbcs x6, x17, x6
        csetm x17, lo
        eor x3, x3, x16
        subs x3, x3, x16
        eor x4, x4, x16
        sbc x4, x4, x16
        eor x5, x5, x17
        subs x5, x5, x17
        eor x6, x6, x17
        sbc x6, x6, x17
        eor x16, x17, x16
        adds x11, x11, x9
        adcs x12, x12, x10
        adcs x13, x13, xzr
        adc x14, x14, xzr
        mul x2, x3, x5
        umulh x17, x3, x5
        mul x15, x4, x6
        umulh x1, x4, x6
        subs x4, x4, x3
        cneg x4, x4, lo
        csetm x9, lo
        adds x15, x15, x17
        adc x1, x1, xzr
        subs x6, x5, x6
        cneg x6, x6, lo
        cinv x9, x9, lo
        mul x5, x4, x6
        umulh x6, x4, x6
        adds x17, x2, x15
        adcs x15, x15, x1
        adc x1, x1, xzr
        cmn x9, #1
        eor x5, x5, x9
        adcs x17, x5, x17
        eor x6, x6, x9
        adcs x15, x6, x15
        adc x1, x1, x9
        adds x9, x11, x7
        adcs x10, x12, x8
        adcs x11, x13, x11
        adcs x12, x14, x12
        adcs x13, x13, xzr
        adc x14, x14, xzr
        cmn x16, #1
        eor x2, x2, x16
        adcs x9, x2, x9
        eor x17, x17, x16
        adcs x10, x17, x10
        eor x15, x15, x16
        adcs x11, x15, x11
        eor x1, x1, x16
        adcs x12, x1, x12
        adcs x13, x13, x16
        adc x14, x14, x16
        mov x3, #38
        umull x4, w11, w3
        add x4, x4, w7, uxtw
        lsr x7, x7, #32
        lsr x11, x11, #32
        umaddl x11, w11, w3, x7
        mov x7, x4
        umull x4, w12, w3
        add x4, x4, w8, uxtw
        lsr x8, x8, #32
        lsr x12, x12, #32
        umaddl x12, w12, w3, x8
        mov x8, x4
        umull x4, w13, w3
        add x4, x4, w9, uxtw
        lsr x9, x9, #32
        lsr x13, x13, #32
        umaddl x13, w13, w3, x9
        mov x9, x4
        umull x4, w14, w3
        add x4, x4, w10, uxtw
        lsr x10, x10, #32
        lsr x14, x14, #32
        umaddl x14, w14, w3, x10
        mov x10, x4
        lsr x17, x14, #31
        mov x5, #19
        umaddl x5, w5, w17, x5
        add x7, x7, x5
        adds x7, x7, x11, lsl #32
        extr x3, x12, x11, #32
        adcs x8, x8, x3
        extr x3, x13, x12, #32
        adcs x9, x9, x3
        extr x3, x14, x13, #32
        lsl x5, x17, #63
        eor x10, x10, x5
        adc x10, x10, x3
        mov x3, #19
        tst x10, #0x8000000000000000
        csel x3, x3, xzr, pl
        subs x7, x7, x3
        sbcs x8, x8, xzr
        sbcs x9, x9, xzr
        sbc x10, x10, xzr
        and x10, x10, #0x7fffffffffffffff
        stp x7, x8, [x0]
        stp x9, x10, [x0, #16]
        ret





edwards25519_decode_nsqr_p25519:



        ldp x10, x11, [x2]
        ldp x12, x13, [x2, #16]




edwards25519_decode_loop:
        umull x2, w10, w10
        lsr x14, x10, #32
        umull x3, w14, w14
        umull x14, w10, w14
        adds x2, x2, x14, lsl #33
        lsr x14, x14, #31
        adc x3, x3, x14
        umull x4, w11, w11
        lsr x14, x11, #32
        umull x5, w14, w14
        umull x14, w11, w14
        mul x15, x10, x11
        umulh x16, x10, x11
        adds x4, x4, x14, lsl #33
        lsr x14, x14, #31
        adc x5, x5, x14
        adds x15, x15, x15
        adcs x16, x16, x16
        adc x5, x5, xzr
        adds x3, x3, x15
        adcs x4, x4, x16
        adc x5, x5, xzr
        umull x6, w12, w12
        lsr x14, x12, #32
        umull x7, w14, w14
        umull x14, w12, w14
        adds x6, x6, x14, lsl #33
        lsr x14, x14, #31
        adc x7, x7, x14
        umull x8, w13, w13
        lsr x14, x13, #32
        umull x9, w14, w14
        umull x14, w13, w14
        mul x15, x12, x13
        umulh x16, x12, x13
        adds x8, x8, x14, lsl #33
        lsr x14, x14, #31
        adc x9, x9, x14
        adds x15, x15, x15
        adcs x16, x16, x16
        adc x9, x9, xzr
        adds x7, x7, x15
        adcs x8, x8, x16
        adc x9, x9, xzr
        subs x10, x10, x12
        sbcs x11, x11, x13
        csetm x16, lo
        eor x10, x10, x16
        subs x10, x10, x16
        eor x11, x11, x16
        sbc x11, x11, x16
        adds x6, x6, x4
        adcs x7, x7, x5
        adcs x8, x8, xzr
        adc x9, x9, xzr
        umull x12, w10, w10
        lsr x5, x10, #32
        umull x13, w5, w5
        umull x5, w10, w5
        adds x12, x12, x5, lsl #33
        lsr x5, x5, #31
        adc x13, x13, x5
        umull x15, w11, w11
        lsr x5, x11, #32
        umull x14, w5, w5
        umull x5, w11, w5
        mul x4, x10, x11
        umulh x16, x10, x11
        adds x15, x15, x5, lsl #33
        lsr x5, x5, #31
        adc x14, x14, x5
        adds x4, x4, x4
        adcs x16, x16, x16
        adc x14, x14, xzr
        adds x13, x13, x4
        adcs x15, x15, x16
        adc x14, x14, xzr
        adds x4, x2, x6
        adcs x5, x3, x7
        adcs x6, x6, x8
        adcs x7, x7, x9
        csetm x16, lo
        subs x4, x4, x12
        sbcs x5, x5, x13
        sbcs x6, x6, x15
        sbcs x7, x7, x14
        adcs x8, x8, x16
        adc x9, x9, x16
        mov x10, #38
        umull x12, w6, w10
        add x12, x12, w2, uxtw
        lsr x2, x2, #32
        lsr x6, x6, #32
        umaddl x6, w6, w10, x2
        mov x2, x12
        umull x12, w7, w10
        add x12, x12, w3, uxtw
        lsr x3, x3, #32
        lsr x7, x7, #32
        umaddl x7, w7, w10, x3
        mov x3, x12
        umull x12, w8, w10
        add x12, x12, w4, uxtw
        lsr x4, x4, #32
        lsr x8, x8, #32
        umaddl x8, w8, w10, x4
        mov x4, x12
        umull x12, w9, w10
        add x12, x12, w5, uxtw
        lsr x5, x5, #32
        lsr x9, x9, #32
        umaddl x9, w9, w10, x5
        mov x5, x12
        lsr x13, x9, #31
        mov x11, #19
        umull x11, w11, w13
        add x2, x2, x11
        adds x10, x2, x6, lsl #32
        extr x12, x7, x6, #32
        adcs x11, x3, x12
        extr x12, x8, x7, #32
        adcs x12, x4, x12
        extr x14, x9, x8, #32
        lsl x15, x13, #63
        eor x5, x5, x15
        adc x13, x5, x14



        subs x1, x1, #1
        bne edwards25519_decode_loop





        adds x6, x10, #19
        adcs x7, x11, xzr
        adcs x8, x12, xzr
        adcs x9, x13, xzr

        csel x10, x10, x6, pl
        csel x11, x11, x7, pl
        csel x12, x12, x8, pl
        csel x13, x13, x9, pl
        bic x13, x13, #0x8000000000000000



        stp x10, x11, [x0]
        stp x12, x13, [x0, #16]
        ret
