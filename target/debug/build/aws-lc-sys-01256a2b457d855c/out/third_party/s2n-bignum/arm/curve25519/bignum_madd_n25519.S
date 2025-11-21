# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/curve25519/bignum_madd_n25519.S"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 467 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/curve25519/bignum_madd_n25519.S" 2
# 19 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/curve25519/bignum_madd_n25519.S"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/include/_internal_s2n_bignum.h" 1
# 20 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/curve25519/bignum_madd_n25519.S" 2

        .globl _bignum_madd_n25519

        .text
        .balign 4
# 101 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/curve25519/bignum_madd_n25519.S"
_bignum_madd_n25519:

        stp x19, x20, [sp, -16]!



        mov x19, x0






        ldp x0, x4, [x1]
        ldp x5, x6, [x2]
        umull x8, w0, w5
        lsr x17, x0, #32
        umull x7, w17, w5
        lsr x16, x5, #32
        umull x9, w16, w17
        umull x16, w0, w16
        adds x8, x8, x7, lsl #32
        lsr x7, x7, #32
        adc x9, x9, x7
        adds x8, x8, x16, lsl #32
        lsr x16, x16, #32
        adc x9, x9, x16
        mul x10, x4, x6
        umulh x11, x4, x6
        subs x4, x4, x0
        cneg x4, x4, cc
        csetm x16, cc
        adds x10, x10, x9
        adc x11, x11, xzr
        subs x0, x5, x6
        cneg x0, x0, cc
        cinv x16, x16, cc
        mul x7, x4, x0
        umulh x0, x4, x0
        adds x9, x8, x10
        adcs x10, x10, x11
        adc x11, x11, xzr
        cmn x16, #0x1
        eor x7, x7, x16
        adcs x9, x7, x9
        eor x0, x0, x16
        adcs x10, x0, x10
        adc x11, x11, x16
        ldp x0, x4, [x1, #16]
        ldp x5, x6, [x2, #16]
        umull x12, w0, w5
        lsr x17, x0, #32
        umull x7, w17, w5
        lsr x16, x5, #32
        umull x13, w16, w17
        umull x16, w0, w16
        adds x12, x12, x7, lsl #32
        lsr x7, x7, #32
        adc x13, x13, x7
        adds x12, x12, x16, lsl #32
        lsr x16, x16, #32
        adc x13, x13, x16
        mul x14, x4, x6
        umulh x15, x4, x6
        subs x4, x4, x0
        cneg x4, x4, cc
        csetm x16, cc
        adds x14, x14, x13
        adc x15, x15, xzr
        subs x0, x5, x6
        cneg x0, x0, cc
        cinv x16, x16, cc
        mul x7, x4, x0
        umulh x0, x4, x0
        adds x13, x12, x14
        adcs x14, x14, x15
        adc x15, x15, xzr
        cmn x16, #0x1
        eor x7, x7, x16
        adcs x13, x7, x13
        eor x0, x0, x16
        adcs x14, x0, x14
        adc x15, x15, x16
        ldp x0, x4, [x1, #16]
        ldp x7, x16, [x1]
        subs x0, x0, x7
        sbcs x4, x4, x16
        csetm x16, cc
        ldp x7, x17, [x2]
        subs x5, x7, x5
        sbcs x6, x17, x6
        csetm x17, cc
        eor x0, x0, x16
        subs x0, x0, x16
        eor x4, x4, x16
        sbc x4, x4, x16
        eor x5, x5, x17
        subs x5, x5, x17
        eor x6, x6, x17
        sbc x6, x6, x17
        eor x16, x17, x16
        adds x12, x12, x10
        adcs x13, x13, x11
        adcs x14, x14, xzr
        adc x15, x15, xzr
        mul x2, x0, x5
        umulh x17, x0, x5
        mul x7, x4, x6
        umulh x1, x4, x6
        subs x4, x4, x0
        cneg x4, x4, cc
        csetm x10, cc
        adds x7, x7, x17
        adc x1, x1, xzr
        subs x6, x5, x6
        cneg x6, x6, cc
        cinv x10, x10, cc
        mul x5, x4, x6
        umulh x6, x4, x6
        adds x17, x2, x7
        adcs x7, x7, x1
        adc x1, x1, xzr
        cmn x10, #0x1
        eor x5, x5, x10
        adcs x17, x5, x17
        eor x6, x6, x10
        adcs x7, x6, x7
        adc x1, x1, x10
        adds x10, x12, x8
        adcs x11, x13, x9
        adcs x12, x14, x12
        adcs x13, x15, x13
        adcs x14, x14, xzr
        adc x15, x15, xzr
        cmn x16, #0x1
        eor x2, x2, x16
        adcs x10, x2, x10
        eor x17, x17, x16
        adcs x11, x17, x11
        eor x7, x7, x16
        adcs x12, x7, x12
        eor x1, x1, x16
        adcs x13, x1, x13
        adcs x14, x14, x16
        adc x15, x15, x16






        ldp x0, x1, [x3]
        adds x8, x8, x0
        adcs x9, x9, x1
        ldp x0, x1, [x3, #16]
        adcs x10, x10, x0
        adcs x11, x11, x1
        adcs x12, x12, xzr
        adcs x13, x13, xzr
        adcs x14, x14, xzr
        adc x15, x15, xzr



        movz x3, #0xd3ed
	 movk x3, #0x5cf5, lsl #16
	 movk x3, #0x631a, lsl #32
	 movk x3, #0x5812, lsl #48
        movz x4, #0x9cd6
	 movk x4, #0xa2f7, lsl #16
	 movk x4, #0xf9de, lsl #32
	 movk x4, #0x14de, lsl #48

        lsr x2, x15, #60
	 and x15, x15, #0x0FFFFFFFFFFFFFFF
	 mul x5, x3, x2
	 mul x6, x4, x2
	 umulh x7, x3, x2
	 adds x6, x6, x7
	 umulh x7, x4, x2
	 adc x7, x7, xzr
	 subs x12, x12, x5
	 sbcs x13, x13, x6
	 sbcs x14, x14, x7
	 sbcs x15, x15, xzr
	 csel x5, x3, xzr, cc
	 csel x6, x4, xzr, cc
	 adds x12, x12, x5
	 and x7, x5, #0x1000000000000000
	 adcs x13, x13, x6
	 adcs x14, x14, xzr
	 adc x15, x15, x7
        extr x2, x15, x14, #60
	 and x14, x14, #0x0FFFFFFFFFFFFFFF
	 sub x2, x2, x15, lsr #60
	 and x5, x15, #0xF000000000000000
	 add x14, x14, x5
	 mul x5, x3, x2
	 mul x6, x4, x2
	 umulh x7, x3, x2
	 adds x6, x6, x7
	 umulh x7, x4, x2
	 adc x7, x7, xzr
	 subs x11, x11, x5
	 sbcs x12, x12, x6
	 sbcs x13, x13, x7
	 sbcs x14, x14, xzr
	 csel x5, x3, xzr, cc
	 csel x6, x4, xzr, cc
	 adds x11, x11, x5
	 and x7, x5, #0x1000000000000000
	 adcs x12, x12, x6
	 adcs x13, x13, xzr
	 adc x14, x14, x7
        extr x2, x14, x13, #60
	 and x13, x13, #0x0FFFFFFFFFFFFFFF
	 sub x2, x2, x14, lsr #60
	 and x5, x14, #0xF000000000000000
	 add x13, x13, x5
	 mul x5, x3, x2
	 mul x6, x4, x2
	 umulh x7, x3, x2
	 adds x6, x6, x7
	 umulh x7, x4, x2
	 adc x7, x7, xzr
	 subs x10, x10, x5
	 sbcs x11, x11, x6
	 sbcs x12, x12, x7
	 sbcs x13, x13, xzr
	 csel x5, x3, xzr, cc
	 csel x6, x4, xzr, cc
	 adds x10, x10, x5
	 and x7, x5, #0x1000000000000000
	 adcs x11, x11, x6
	 adcs x12, x12, xzr
	 adc x13, x13, x7
        extr x2, x13, x12, #60
	 and x12, x12, #0x0FFFFFFFFFFFFFFF
	 sub x2, x2, x13, lsr #60
	 and x5, x13, #0xF000000000000000
	 add x12, x12, x5
	 mul x5, x3, x2
	 mul x6, x4, x2
	 umulh x7, x3, x2
	 adds x6, x6, x7
	 umulh x7, x4, x2
	 adc x7, x7, xzr
	 subs x9, x9, x5
	 sbcs x10, x10, x6
	 sbcs x11, x11, x7
	 sbcs x12, x12, xzr
	 csel x5, x3, xzr, cc
	 csel x6, x4, xzr, cc
	 adds x9, x9, x5
	 and x7, x5, #0x1000000000000000
	 adcs x10, x10, x6
	 adcs x11, x11, xzr
	 adc x12, x12, x7
        extr x2, x12, x11, #60
	 and x11, x11, #0x0FFFFFFFFFFFFFFF
	 sub x2, x2, x12, lsr #60
	 and x5, x12, #0xF000000000000000
	 add x11, x11, x5
	 mul x5, x3, x2
	 mul x6, x4, x2
	 umulh x7, x3, x2
	 adds x6, x6, x7
	 umulh x7, x4, x2
	 adc x7, x7, xzr
	 subs x8, x8, x5
	 sbcs x9, x9, x6
	 sbcs x10, x10, x7
	 sbcs x11, x11, xzr
	 csel x5, x3, xzr, cc
	 csel x6, x4, xzr, cc
	 adds x8, x8, x5
	 and x7, x5, #0x1000000000000000
	 adcs x9, x9, x6
	 adcs x10, x10, xzr
	 adc x11, x11, x7

        stp x8, x9, [x19]
        stp x10, x11, [x19, #16]



        ldp x19, x20, [sp], 16
        ret
