# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p521/bignum_inv_p521.S"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 467 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p521/bignum_inv_p521.S" 2
# 16 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p521/bignum_inv_p521.S"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/include/_internal_s2n_bignum.h" 1
# 17 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p521/bignum_inv_p521.S" 2

        .globl _bignum_inv_p521


        .text
        .balign 4
# 697 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p521/bignum_inv_p521.S"
_bignum_inv_p521:



        stp x19, x20, [sp, -16]!
        stp x21, x22, [sp, -16]!
        sub sp, sp, #(36*8)



        mov x20, x0



        mov x10, #0xFFFFFFFFFFFFFFFF
        stp x10, x10, [sp, #0]
        stp x10, x10, [sp, #0 +16]
        stp x10, x10, [sp, #0 +32]
        stp x10, x10, [sp, #0 +48]
        mov x11, #0x1FF
        str x11, [sp, #0 +64]





        ldr x8, [x1, #64]
        lsr x9, x8, #9

        subs xzr, xzr, xzr
        ldp x10, x11, [x1]
        adcs xzr, x10, x9
        adcs xzr, x11, xzr
        ldp x12, x13, [x1, #16]
        and x7, x12, x13
        adcs xzr, x7, xzr
        ldp x14, x15, [x1, #32]
        and x7, x14, x15
        adcs xzr, x7, xzr
        ldp x16, x17, [x1, #48]
        and x7, x16, x17
        adcs xzr, x7, xzr
        orr x7, x8, #~0x1FF
        adcs x7, x7, xzr

        adcs x10, x10, x9
        adcs x11, x11, xzr
        adcs x12, x12, xzr
        adcs x13, x13, xzr
        adcs x14, x14, xzr
        adcs x15, x15, xzr
        adcs x16, x16, xzr
        adcs x17, x17, xzr
        adc x8, x8, xzr
        and x8, x8, #0x1FF

        stp x10, x11, [sp, #(9*8)]
        stp x12, x13, [sp, #(9*8)+16]
        stp x14, x15, [sp, #(9*8)+32]
        stp x16, x17, [sp, #(9*8)+48]
        str x8, [sp, #(9*8)+64]
# 773 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p521/bignum_inv_p521.S"
        stp xzr, xzr, [sp, #(18*8)]
        stp xzr, xzr, [sp, #(18*8)+16]
        stp xzr, xzr, [sp, #(18*8)+32]
        stp xzr, xzr, [sp, #(18*8)+48]
        str xzr, [sp, #(18*8)+64]

        mov x10, #16
        stp xzr, xzr, [sp, #(27*8)]
        stp xzr, xzr, [sp, #(27*8)+16]
        stp xzr, x10, [sp, #(27*8)+32]
        stp xzr, xzr, [sp, #(27*8)+48]
        str xzr, [sp, #(27*8)+64]





        mov x21, #21
        mov x22, #1
        b bignum_inv_p521_midloop

bignum_inv_p521_loop:



        cmp x10, xzr
        csetm x14, mi
        cneg x10, x10, mi

        cmp x11, xzr
        csetm x15, mi
        cneg x11, x11, mi

        cmp x12, xzr
        csetm x16, mi
        cneg x12, x12, mi

        cmp x13, xzr
        csetm x17, mi
        cneg x13, x13, mi





        and x0, x10, x14
        and x1, x11, x15
        add x9, x0, x1

        and x0, x12, x16
        and x1, x13, x17
        add x19, x0, x1
# 833 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p521/bignum_inv_p521.S"
        ldr x7, [sp, #0]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x4, x9, x0
        adc x2, xzr, x1
        ldr x8, [sp, #(9*8)]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x4, x4, x0
        adc x2, x2, x1

        eor x1, x7, x16
        mul x0, x1, x12
        umulh x1, x1, x12
        adds x5, x19, x0
        adc x3, xzr, x1
        eor x1, x8, x17
        mul x0, x1, x13
        umulh x1, x1, x13
        adds x5, x5, x0
        adc x3, x3, x1



        ldr x7, [sp, #0 +8]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x2, x2, x0
        adc x6, xzr, x1
        ldr x8, [sp, #(9*8)+8]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x2, x2, x0
        adc x6, x6, x1
        extr x4, x2, x4, #59
        str x4, [sp, #0]

        eor x1, x7, x16
        mul x0, x1, x12
        umulh x1, x1, x12
        adds x3, x3, x0
        adc x4, xzr, x1
        eor x1, x8, x17
        mul x0, x1, x13
        umulh x1, x1, x13
        adds x3, x3, x0
        adc x4, x4, x1
        extr x5, x3, x5, #59
        str x5, [sp, #(9*8)]



        ldr x7, [sp, #0 +2*8]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x6, x6, x0
        adc x5, xzr, x1
        ldr x8, [sp, #(9*8)+2*8]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x6, x6, x0
        adc x5, x5, x1
        extr x2, x6, x2, #59
        str x2, [sp, #0 +8]

        eor x1, x7, x16
        mul x0, x1, x12
        umulh x1, x1, x12
        adds x4, x4, x0
        adc x2, xzr, x1
        eor x1, x8, x17
        mul x0, x1, x13
        umulh x1, x1, x13
        adds x4, x4, x0
        adc x2, x2, x1
        extr x3, x4, x3, #59
        str x3, [sp, #(9*8)+8]



        ldr x7, [sp, #0 +3*8]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x5, x5, x0
        adc x3, xzr, x1
        ldr x8, [sp, #(9*8)+3*8]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x5, x5, x0
        adc x3, x3, x1
        extr x6, x5, x6, #59
        str x6, [sp, #0 +2*8]

        eor x1, x7, x16
        mul x0, x1, x12
        umulh x1, x1, x12
        adds x2, x2, x0
        adc x6, xzr, x1
        eor x1, x8, x17
        mul x0, x1, x13
        umulh x1, x1, x13
        adds x2, x2, x0
        adc x6, x6, x1
        extr x4, x2, x4, #59
        str x4, [sp, #(9*8)+2*8]



        ldr x7, [sp, #0 +4*8]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x3, x3, x0
        adc x4, xzr, x1
        ldr x8, [sp, #(9*8)+4*8]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x3, x3, x0
        adc x4, x4, x1
        extr x5, x3, x5, #59
        str x5, [sp, #0 +3*8]

        eor x1, x7, x16
        mul x0, x1, x12
        umulh x1, x1, x12
        adds x6, x6, x0
        adc x5, xzr, x1
        eor x1, x8, x17
        mul x0, x1, x13
        umulh x1, x1, x13
        adds x6, x6, x0
        adc x5, x5, x1
        extr x2, x6, x2, #59
        str x2, [sp, #(9*8)+3*8]



        ldr x7, [sp, #0 +5*8]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x4, x4, x0
        adc x2, xzr, x1
        ldr x8, [sp, #(9*8)+5*8]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x4, x4, x0
        adc x2, x2, x1
        extr x3, x4, x3, #59
        str x3, [sp, #0 +4*8]

        eor x1, x7, x16
        mul x0, x1, x12
        umulh x1, x1, x12
        adds x5, x5, x0
        adc x3, xzr, x1
        eor x1, x8, x17
        mul x0, x1, x13
        umulh x1, x1, x13
        adds x5, x5, x0
        adc x3, x3, x1
        extr x6, x5, x6, #59
        str x6, [sp, #(9*8)+4*8]



        ldr x7, [sp, #0 +6*8]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x2, x2, x0
        adc x6, xzr, x1
        ldr x8, [sp, #(9*8)+6*8]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x2, x2, x0
        adc x6, x6, x1
        extr x4, x2, x4, #59
        str x4, [sp, #0 +5*8]

        eor x1, x7, x16
        mul x0, x1, x12
        umulh x1, x1, x12
        adds x3, x3, x0
        adc x4, xzr, x1
        eor x1, x8, x17
        mul x0, x1, x13
        umulh x1, x1, x13
        adds x3, x3, x0
        adc x4, x4, x1
        extr x5, x3, x5, #59
        str x5, [sp, #(9*8)+5*8]



        ldr x7, [sp, #0 +7*8]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x6, x6, x0
        adc x5, xzr, x1
        ldr x8, [sp, #(9*8)+7*8]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x6, x6, x0
        adc x5, x5, x1
        extr x2, x6, x2, #59
        str x2, [sp, #0 +6*8]

        eor x1, x7, x16
        mul x0, x1, x12
        umulh x1, x1, x12
        adds x4, x4, x0
        adc x2, xzr, x1
        eor x1, x8, x17
        mul x0, x1, x13
        umulh x1, x1, x13
        adds x4, x4, x0
        adc x2, x2, x1
        extr x3, x4, x3, #59
        str x3, [sp, #(9*8)+6*8]



        ldr x7, [sp, #0 +8*8]
        eor x1, x7, x14
        asr x3, x1, #63
        and x3, x3, x10
        neg x3, x3
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x5, x5, x0
        adc x3, x3, x1
        ldr x8, [sp, #(9*8)+8*8]
        eor x1, x8, x15
        asr x0, x1, #63
        and x0, x0, x11
        sub x3, x3, x0
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x5, x5, x0
        adc x3, x3, x1
        extr x6, x5, x6, #59
        str x6, [sp, #0 +7*8]
        extr x5, x3, x5, #59
        str x5, [sp, #0 +8*8]

        eor x1, x7, x16
        asr x5, x1, #63
        and x5, x5, x12
        neg x5, x5
        mul x0, x1, x12
        umulh x1, x1, x12
        adds x2, x2, x0
        adc x5, x5, x1
        eor x1, x8, x17
        asr x0, x1, #63
        and x0, x0, x13
        sub x5, x5, x0
        mul x0, x1, x13
        umulh x1, x1, x13
        adds x2, x2, x0
        adc x5, x5, x1
        extr x4, x2, x4, #59
        str x4, [sp, #(9*8)+7*8]
        extr x2, x5, x2, #59
        str x2, [sp, #(9*8)+8*8]







        ldr x7, [sp, #(18*8)]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x4, x9, x0
        adc x2, xzr, x1
        ldr x8, [sp, #(27*8)]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x4, x4, x0
        str x4, [sp, #(18*8)]
        adc x2, x2, x1

        eor x1, x7, x16
        mul x0, x1, x12
        umulh x1, x1, x12
        adds x5, x19, x0
        adc x3, xzr, x1
        eor x1, x8, x17
        mul x0, x1, x13
        umulh x1, x1, x13
        adds x5, x5, x0
        str x5, [sp, #(27*8)]
        adc x3, x3, x1



        ldr x7, [sp, #(18*8)+8]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x2, x2, x0
        adc x6, xzr, x1
        ldr x8, [sp, #(27*8)+8]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x2, x2, x0
        str x2, [sp, #(18*8)+8]
        adc x6, x6, x1

        eor x1, x7, x16
        mul x0, x1, x12
        umulh x1, x1, x12
        adds x3, x3, x0
        adc x4, xzr, x1
        eor x1, x8, x17
        mul x0, x1, x13
        umulh x1, x1, x13
        adds x3, x3, x0
        str x3, [sp, #(27*8)+8]
        adc x4, x4, x1



        ldr x7, [sp, #(18*8)+2*8]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x6, x6, x0
        adc x5, xzr, x1
        ldr x8, [sp, #(27*8)+2*8]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x6, x6, x0
        str x6, [sp, #(18*8)+2*8]
        adc x5, x5, x1

        eor x1, x7, x16
        mul x0, x1, x12
        umulh x1, x1, x12
        adds x4, x4, x0
        adc x2, xzr, x1
        eor x1, x8, x17
        mul x0, x1, x13
        umulh x1, x1, x13
        adds x4, x4, x0
        str x4, [sp, #(27*8)+2*8]
        adc x2, x2, x1



        ldr x7, [sp, #(18*8)+3*8]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x5, x5, x0
        adc x3, xzr, x1
        ldr x8, [sp, #(27*8)+3*8]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x5, x5, x0
        str x5, [sp, #(18*8)+3*8]
        adc x3, x3, x1

        eor x1, x7, x16
        mul x0, x1, x12
        umulh x1, x1, x12
        adds x2, x2, x0
        adc x6, xzr, x1
        eor x1, x8, x17
        mul x0, x1, x13
        umulh x1, x1, x13
        adds x2, x2, x0
        str x2, [sp, #(27*8)+3*8]
        adc x6, x6, x1



        ldr x7, [sp, #(18*8)+4*8]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x3, x3, x0
        adc x4, xzr, x1
        ldr x8, [sp, #(27*8)+4*8]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x3, x3, x0
        str x3, [sp, #(18*8)+4*8]
        adc x4, x4, x1

        eor x1, x7, x16
        mul x0, x1, x12
        umulh x1, x1, x12
        adds x6, x6, x0
        adc x5, xzr, x1
        eor x1, x8, x17
        mul x0, x1, x13
        umulh x1, x1, x13
        adds x6, x6, x0
        str x6, [sp, #(27*8)+4*8]
        adc x5, x5, x1



        ldr x7, [sp, #(18*8)+5*8]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x4, x4, x0
        adc x2, xzr, x1
        ldr x8, [sp, #(27*8)+5*8]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x4, x4, x0
        str x4, [sp, #(18*8)+5*8]
        adc x2, x2, x1

        eor x1, x7, x16
        mul x0, x1, x12
        umulh x1, x1, x12
        adds x5, x5, x0
        adc x3, xzr, x1
        eor x1, x8, x17
        mul x0, x1, x13
        umulh x1, x1, x13
        adds x5, x5, x0
        str x5, [sp, #(27*8)+5*8]
        adc x3, x3, x1



        ldr x7, [sp, #(18*8)+6*8]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x2, x2, x0
        adc x6, xzr, x1
        ldr x8, [sp, #(27*8)+6*8]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x2, x2, x0
        str x2, [sp, #(18*8)+6*8]
        adc x6, x6, x1

        eor x1, x7, x16
        mul x0, x1, x12
        umulh x1, x1, x12
        adds x3, x3, x0
        adc x4, xzr, x1
        eor x1, x8, x17
        mul x0, x1, x13
        umulh x1, x1, x13
        adds x3, x3, x0
        str x3, [sp, #(27*8)+6*8]
        adc x4, x4, x1



        ldr x7, [sp, #(18*8)+7*8]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x6, x6, x0
        adc x5, xzr, x1
        ldr x8, [sp, #(27*8)+7*8]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x6, x6, x0
        str x6, [sp, #(18*8)+7*8]
        adc x5, x5, x1

        eor x1, x7, x16
        mul x0, x1, x12
        umulh x1, x1, x12
        adds x4, x4, x0
        adc x2, xzr, x1
        eor x1, x8, x17
        mul x0, x1, x13
        umulh x1, x1, x13
        adds x4, x4, x0
        str x4, [sp, #(27*8)+7*8]
        adc x2, x2, x1



        ldr x7, [sp, #(18*8)+8*8]
        eor x1, x7, x14
        and x3, x14, x10
        neg x3, x3
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x5, x5, x0
        adc x3, x3, x1
        ldr x8, [sp, #(27*8)+8*8]
        eor x1, x8, x15
        and x0, x15, x11
        sub x3, x3, x0
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x5, x5, x0
        adc x3, x3, x1



        extr x6, x3, x5, #9
        ldp x0, x1, [sp, #(18*8)]
        add x6, x6, x3, asr #63
        sub x5, x5, x6, lsl #9
        adds x0, x0, x6
        asr x6, x6, #63
        adcs x1, x1, x6
        stp x0, x1, [sp, #(18*8)]
        ldp x0, x1, [sp, #(18*8)+16]
        adcs x0, x0, x6
        adcs x1, x1, x6
        stp x0, x1, [sp, #(18*8)+16]
        ldp x0, x1, [sp, #(18*8)+32]
        adcs x0, x0, x6
        adcs x1, x1, x6
        stp x0, x1, [sp, #(18*8)+32]
        ldp x0, x1, [sp, #(18*8)+48]
        adcs x0, x0, x6
        adcs x1, x1, x6
        stp x0, x1, [sp, #(18*8)+48]
        adc x5, x5, x6
        str x5, [sp, #(18*8)+64]



        eor x1, x7, x16
        and x5, x16, x12
        neg x5, x5
        mul x0, x1, x12
        umulh x1, x1, x12
        adds x2, x2, x0
        adc x5, x5, x1
        eor x1, x8, x17
        and x0, x17, x13
        sub x5, x5, x0
        mul x0, x1, x13
        umulh x1, x1, x13
        adds x2, x2, x0
        adc x5, x5, x1



        extr x6, x5, x2, #9
        ldp x0, x1, [sp, #(27*8)]
        add x6, x6, x5, asr #63
        sub x2, x2, x6, lsl #9
        adds x0, x0, x6
        asr x6, x6, #63
        adcs x1, x1, x6
        stp x0, x1, [sp, #(27*8)]
        ldp x0, x1, [sp, #(27*8)+16]
        adcs x0, x0, x6
        adcs x1, x1, x6
        stp x0, x1, [sp, #(27*8)+16]
        ldp x0, x1, [sp, #(27*8)+32]
        adcs x0, x0, x6
        adcs x1, x1, x6
        stp x0, x1, [sp, #(27*8)+32]
        ldp x0, x1, [sp, #(27*8)+48]
        adcs x0, x0, x6
        adcs x1, x1, x6
        stp x0, x1, [sp, #(27*8)+48]
        adc x2, x2, x6
        str x2, [sp, #(27*8)+64]

bignum_inv_p521_midloop:

        mov x1, x22
        ldr x2, [sp, #0]
        ldr x3, [sp, #(9*8)]
        and x4, x2, #0xfffff
	 orr x4, x4, #0xfffffe0000000000
	 and x5, x3, #0xfffff
	 orr x5, x5, #0xc000000000000000
	 tst x5, #0x1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 asr x5, x5, #1
	 add x8, x4, #0x100, lsl #12
	 sbfx x8, x8, #21, #21
	 mov x11, #0x100000
	 add x11, x11, x11, lsl #21
	 add x9, x4, x11
	 asr x9, x9, #42
	 add x10, x5, #0x100, lsl #12
	 sbfx x10, x10, #21, #21
	 add x11, x5, x11
	 asr x11, x11, #42
	 mul x6, x8, x2
	 mul x7, x9, x3
	 mul x2, x10, x2
	 mul x3, x11, x3
	 add x4, x6, x7
	 add x5, x2, x3
	 asr x2, x4, #20
	 asr x3, x5, #20
	 and x4, x2, #0xfffff
	 orr x4, x4, #0xfffffe0000000000
	 and x5, x3, #0xfffff
	 orr x5, x5, #0xc000000000000000
	 tst x5, #0x1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 asr x5, x5, #1
	 add x12, x4, #0x100, lsl #12
	 sbfx x12, x12, #21, #21
	 mov x15, #0x100000
	 add x15, x15, x15, lsl #21
	 add x13, x4, x15
	 asr x13, x13, #42
	 add x14, x5, #0x100, lsl #12
	 sbfx x14, x14, #21, #21
	 add x15, x5, x15
	 asr x15, x15, #42
	 mul x6, x12, x2
	 mul x7, x13, x3
	 mul x2, x14, x2
	 mul x3, x15, x3
	 add x4, x6, x7
	 add x5, x2, x3
	 asr x2, x4, #20
	 asr x3, x5, #20
	 and x4, x2, #0xfffff
	 orr x4, x4, #0xfffffe0000000000
	 and x5, x3, #0xfffff
	 orr x5, x5, #0xc000000000000000
	 tst x5, #0x1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 mul x2, x12, x8
	 mul x3, x12, x9
	 mul x6, x14, x8
	 mul x7, x14, x9
	 madd x8, x13, x10, x2
	 madd x9, x13, x11, x3
	 madd x16, x15, x10, x6
	 madd x17, x15, x11, x7
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 tst x5, #0x2
	 asr x5, x5, #1
	 csel x6, x4, xzr, ne
	 ccmp x1, xzr, #0x8, ne
	 cneg x1, x1, ge
	 cneg x6, x6, ge
	 csel x4, x5, x4, ge
	 add x5, x5, x6
	 add x1, x1, #0x2
	 asr x5, x5, #1
	 add x12, x4, #0x100, lsl #12
	 sbfx x12, x12, #22, #21
	 mov x15, #0x100000
	 add x15, x15, x15, lsl #21
	 add x13, x4, x15
	 asr x13, x13, #43
	 add x14, x5, #0x100, lsl #12
	 sbfx x14, x14, #22, #21
	 add x15, x5, x15
	 asr x15, x15, #43
	 mneg x2, x12, x8
	 mneg x3, x12, x9
	 mneg x4, x14, x8
	 mneg x5, x14, x9
	 msub x10, x13, x16, x2
	 msub x11, x13, x17, x3
	 msub x12, x15, x16, x4
	 msub x13, x15, x17, x5
        mov x22, x1



        subs x21, x21, #1
        bne bignum_inv_p521_loop
# 1449 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p521/bignum_inv_p521.S"
        ldr x0, [sp, #0]
        ldr x1, [sp, #(9*8)]
        mul x0, x0, x10
        madd x1, x1, x11, x0
        asr x0, x1, #63
# 1462 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p521/bignum_inv_p521.S"
        cmp x10, xzr
        csetm x14, mi
        cneg x10, x10, mi
        eor x14, x14, x0

        cmp x11, xzr
        csetm x15, mi
        cneg x11, x11, mi
        eor x15, x15, x0

        cmp x12, xzr
        csetm x16, mi
        cneg x12, x12, mi
        eor x16, x16, x0

        cmp x13, xzr
        csetm x17, mi
        cneg x13, x13, mi
        eor x17, x17, x0



        and x0, x10, x14
        and x1, x11, x15
        add x9, x0, x1



        ldr x7, [sp, #(18*8)]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x4, x9, x0
        adc x2, xzr, x1
        ldr x8, [sp, #(27*8)]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x4, x4, x0
        str x4, [sp, #(18*8)]
        adc x2, x2, x1



        ldr x7, [sp, #(18*8)+8]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x2, x2, x0
        adc x6, xzr, x1
        ldr x8, [sp, #(27*8)+8]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x2, x2, x0
        str x2, [sp, #(18*8)+8]
        adc x6, x6, x1



        ldr x7, [sp, #(18*8)+2*8]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x6, x6, x0
        adc x5, xzr, x1
        ldr x8, [sp, #(27*8)+2*8]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x6, x6, x0
        str x6, [sp, #(18*8)+2*8]
        adc x5, x5, x1



        ldr x7, [sp, #(18*8)+3*8]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x5, x5, x0
        adc x3, xzr, x1
        ldr x8, [sp, #(27*8)+3*8]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x5, x5, x0
        str x5, [sp, #(18*8)+3*8]
        adc x3, x3, x1



        ldr x7, [sp, #(18*8)+4*8]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x3, x3, x0
        adc x4, xzr, x1
        ldr x8, [sp, #(27*8)+4*8]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x3, x3, x0
        str x3, [sp, #(18*8)+4*8]
        adc x4, x4, x1



        ldr x7, [sp, #(18*8)+5*8]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x4, x4, x0
        adc x2, xzr, x1
        ldr x8, [sp, #(27*8)+5*8]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x4, x4, x0
        str x4, [sp, #(18*8)+5*8]
        adc x2, x2, x1



        ldr x7, [sp, #(18*8)+6*8]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x2, x2, x0
        adc x6, xzr, x1
        ldr x8, [sp, #(27*8)+6*8]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x2, x2, x0
        str x2, [sp, #(18*8)+6*8]
        adc x6, x6, x1



        ldr x7, [sp, #(18*8)+7*8]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x6, x6, x0
        adc x5, xzr, x1
        ldr x8, [sp, #(27*8)+7*8]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x6, x6, x0
        str x6, [sp, #(18*8)+7*8]
        adc x5, x5, x1



        ldr x7, [sp, #(18*8)+8*8]
        eor x1, x7, x14
        and x3, x14, x10
        neg x3, x3
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x5, x5, x0
        adc x3, x3, x1
        ldr x8, [sp, #(27*8)+8*8]
        eor x1, x8, x15
        and x0, x15, x11
        sub x3, x3, x0
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x5, x5, x0
        adc x3, x3, x1



        extr x6, x3, x5, #9
        ldp x10, x11, [sp, #(18*8)]
        add x6, x6, x3, asr #63
        sub x5, x5, x6, lsl #9
        adds x10, x10, x6
        asr x6, x6, #63
        adcs x11, x11, x6
        ldp x12, x13, [sp, #(18*8)+16]
        adcs x12, x12, x6
        adcs x13, x13, x6
        ldp x14, x15, [sp, #(18*8)+32]
        adcs x14, x14, x6
        adcs x15, x15, x6
        ldp x16, x17, [sp, #(18*8)+48]
        adcs x16, x16, x6
        adcs x17, x17, x6
        adc x19, x5, x6




        subs x0, x10, #-1
        adcs x1, x11, xzr
        adcs x2, x12, xzr
        adcs x3, x13, xzr
        adcs x4, x14, xzr
        adcs x5, x15, xzr
        adcs x6, x16, xzr
        adcs x7, x17, xzr
        mov x8, #0x1FF
        sbcs x8, x19, x8

        csel x0, x0, x10, cs
        csel x1, x1, x11, cs
        csel x2, x2, x12, cs
        csel x3, x3, x13, cs
        csel x4, x4, x14, cs
        csel x5, x5, x15, cs
        csel x6, x6, x16, cs
        csel x7, x7, x17, cs
        csel x8, x8, x19, cs



        stp x0, x1, [x20]
        stp x2, x3, [x20, #16]
        stp x4, x5, [x20, #32]
        stp x6, x7, [x20, #48]
        str x8, [x20, #64]



        add sp, sp, #(36*8)
        ldp x21, x22, [sp], 16
        ldp x19, x20, [sp], 16
        ret
