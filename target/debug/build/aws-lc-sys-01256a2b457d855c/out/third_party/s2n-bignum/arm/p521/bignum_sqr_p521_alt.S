# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p521/bignum_sqr_p521_alt.S"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 467 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p521/bignum_sqr_p521_alt.S" 2
# 12 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p521/bignum_sqr_p521_alt.S"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/include/_internal_s2n_bignum.h" 1
# 13 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p521/bignum_sqr_p521_alt.S" 2

        .globl _bignum_sqr_p521_alt

        .text
        .balign 4
# 52 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p521/bignum_sqr_p521_alt.S"
_bignum_sqr_p521_alt:



        stp x19, x20, [sp, #-16]!
        stp x21, x22, [sp, #-16]!
        stp x23, x24, [sp, #-16]!
        stp x25, x26, [sp, #-16]!




        ldp x2, x3, [x1]

        mul x11, x2, x3
        umulh x12, x2, x3

        ldp x4, x5, [x1, #16]

        mul x10, x2, x4
        umulh x13, x2, x4
        adds x12, x12, x10

        ldp x6, x7, [x1, #32]

        mul x10, x2, x5
        umulh x14, x2, x5
        adcs x13, x13, x10

        ldp x8, x9, [x1, #48]

        mul x10, x2, x6
        umulh x15, x2, x6
        adcs x14, x14, x10

        mul x10, x2, x7
        umulh x16, x2, x7
        adcs x15, x15, x10

        mul x10, x2, x8
        umulh x17, x2, x8
        adcs x16, x16, x10

        mul x10, x2, x9
        umulh x19, x2, x9
        adcs x17, x17, x10

        adc x19, x19, xzr



        mul x10, x3, x4
        adds x13, x13, x10
        mul x10, x3, x5
        adcs x14, x14, x10
        mul x10, x3, x6
        adcs x15, x15, x10
        mul x10, x3, x7
        adcs x16, x16, x10
        mul x10, x3, x8
        adcs x17, x17, x10
        mul x10, x3, x9
        adcs x19, x19, x10
        cset x20, cs

        umulh x10, x3, x4
        adds x14, x14, x10
        umulh x10, x3, x5
        adcs x15, x15, x10
        umulh x10, x3, x6
        adcs x16, x16, x10
        umulh x10, x3, x7
        adcs x17, x17, x10
        umulh x10, x3, x8
        adcs x19, x19, x10
        umulh x10, x3, x9
        adc x20, x20, x10
        mul x10, x6, x7
        umulh x21, x6, x7
        adds x20, x20, x10
        adc x21, x21, xzr



        mul x10, x4, x5
        adds x15, x15, x10
        mul x10, x4, x6
        adcs x16, x16, x10
        mul x10, x4, x7
        adcs x17, x17, x10
        mul x10, x4, x8
        adcs x19, x19, x10
        mul x10, x4, x9
        adcs x20, x20, x10
        mul x10, x6, x8
        adcs x21, x21, x10
        cset x22, cs

        umulh x10, x4, x5
        adds x16, x16, x10
        umulh x10, x4, x6
        adcs x17, x17, x10
        umulh x10, x4, x7
        adcs x19, x19, x10
        umulh x10, x4, x8
        adcs x20, x20, x10
        umulh x10, x4, x9
        adcs x21, x21, x10
        umulh x10, x6, x8
        adc x22, x22, x10
        mul x10, x7, x8
        umulh x23, x7, x8
        adds x22, x22, x10
        adc x23, x23, xzr



        mul x10, x5, x6
        adds x17, x17, x10
        mul x10, x5, x7
        adcs x19, x19, x10
        mul x10, x5, x8
        adcs x20, x20, x10
        mul x10, x5, x9
        adcs x21, x21, x10
        mul x10, x6, x9
        adcs x22, x22, x10
        mul x10, x7, x9
        adcs x23, x23, x10
        cset x24, cs

        umulh x10, x5, x6
        adds x19, x19, x10
        umulh x10, x5, x7
        adcs x20, x20, x10
        umulh x10, x5, x8
        adcs x21, x21, x10
        umulh x10, x5, x9
        adcs x22, x22, x10
        umulh x10, x6, x9
        adcs x23, x23, x10
        umulh x10, x7, x9
        adc x24, x24, x10
        mul x10, x8, x9
        umulh x25, x8, x9
        adds x24, x24, x10
        adc x25, x25, xzr



        adds x11, x11, x11
        adcs x12, x12, x12
        adcs x13, x13, x13
        adcs x14, x14, x14
        adcs x15, x15, x15
        adcs x16, x16, x16
        adcs x17, x17, x17
        adcs x19, x19, x19
        adcs x20, x20, x20
        adcs x21, x21, x21
        adcs x22, x22, x22
        adcs x23, x23, x23
        adcs x24, x24, x24
        adcs x25, x25, x25
        cset x26, cs



        umulh x10, x2, x2
        adds x11, x11, x10

        mul x10, x3, x3
        adcs x12, x12, x10
        umulh x10, x3, x3
        adcs x13, x13, x10

        mul x10, x4, x4
        adcs x14, x14, x10
        umulh x10, x4, x4
        adcs x15, x15, x10

        mul x10, x5, x5
        adcs x16, x16, x10
        umulh x10, x5, x5
        adcs x17, x17, x10

        mul x10, x6, x6
        adcs x19, x19, x10
        umulh x10, x6, x6
        adcs x20, x20, x10

        mul x10, x7, x7
        adcs x21, x21, x10
        umulh x10, x7, x7
        adcs x22, x22, x10

        mul x10, x8, x8
        adcs x23, x23, x10
        umulh x10, x8, x8
        adcs x24, x24, x10

        mul x10, x9, x9
        adcs x25, x25, x10
        umulh x10, x9, x9
        adc x26, x26, x10



        ldr x1, [x1, #64]
        add x1, x1, x1






        mul x10, x1, x2
        adds x19, x19, x10
        umulh x10, x1, x2
        adcs x20, x20, x10
        mul x10, x1, x4
        adcs x21, x21, x10
        umulh x10, x1, x4
        adcs x22, x22, x10
        mul x10, x1, x6
        adcs x23, x23, x10
        umulh x10, x1, x6
        adcs x24, x24, x10
        mul x10, x1, x8
        adcs x25, x25, x10
        umulh x10, x1, x8
        adcs x26, x26, x10
        lsr x4, x1, #1
        mul x4, x4, x4
        adc x4, x4, xzr

        mul x10, x1, x3
        adds x20, x20, x10
        umulh x10, x1, x3
        adcs x21, x21, x10
        mul x10, x1, x5
        adcs x22, x22, x10
        umulh x10, x1, x5
        adcs x23, x23, x10
        mul x10, x1, x7
        adcs x24, x24, x10
        umulh x10, x1, x7
        adcs x25, x25, x10
        mul x10, x1, x9
        adcs x26, x26, x10
        umulh x10, x1, x9
        adc x4, x4, x10




        mul x2, x2, x2




        subs xzr, xzr, xzr
        extr x10, x20, x19, #9
        adcs x2, x2, x10
        extr x10, x21, x20, #9
        adcs x11, x11, x10
        extr x10, x22, x21, #9
        adcs x12, x12, x10
        extr x10, x23, x22, #9
        adcs x13, x13, x10
        extr x10, x24, x23, #9
        adcs x14, x14, x10
        extr x10, x25, x24, #9
        adcs x15, x15, x10
        extr x10, x26, x25, #9
        adcs x16, x16, x10
        extr x10, x4, x26, #9
        adcs x17, x17, x10
        orr x19, x19, #~0x1FF
        lsr x10, x4, #9
        adcs x19, x19, x10





        sbcs x2, x2, xzr
        sbcs x11, x11, xzr
        sbcs x12, x12, xzr
        sbcs x13, x13, xzr
        sbcs x14, x14, xzr
        sbcs x15, x15, xzr
        sbcs x16, x16, xzr
        sbcs x17, x17, xzr
        sbc x19, x19, xzr
        and x19, x19, #0x1FF



        stp x2, x11, [x0]
        stp x12, x13, [x0, #16]
        stp x14, x15, [x0, #32]
        stp x16, x17, [x0, #48]
        str x19, [x0, #64]



        ldp x25, x26, [sp], #16
        ldp x23, x24, [sp], #16
        ldp x21, x22, [sp], #16
        ldp x19, x20, [sp], #16

        ret
