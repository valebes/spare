# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_sqr.S"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 467 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_sqr.S" 2
# 16 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_sqr.S"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/include/_internal_s2n_bignum.h" 1
# 17 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_sqr.S" 2

        .globl _bignum_sqr

        .text
        .balign 4
# 41 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_sqr.S"
_bignum_sqr:



        cbz x0, bignum_sqr_end



        mov x15, xzr
        mov x14, xzr



        mov x7, xzr
bignum_sqr_outerloop:







        add x8, x7, #1
        lsr x13, x8, #1
        cmp x13, x2
        csel x13, x13, x2, cc
        subs x8, x8, x2
        csel x8, x8, xzr, cs



        mov x4, xzr
        mov x5, xzr
        mov x6, xzr



        cmp x13, x8
        bls bignum_sqr_nosumming



        sub x12, x7, x8
        lsl x12, x12, #3
        add x12, x3, x12



bignum_sqr_innerloop:
        ldr x9, [x3, x8, lsl #3]
        ldr x10, [x12], #-8
        mul x11, x9, x10
        umulh x9, x9, x10
        adds x4, x4, x11
        adcs x5, x5, x9
        adc x6, x6, xzr
        add x8, x8, #1
        cmp x8, x13
        bne bignum_sqr_innerloop



        adds x4, x4, x4
        adcs x5, x5, x5
        adc x6, x6, x6



bignum_sqr_nosumming:

        ands xzr, x7, #1
        bne bignum_sqr_innerend
        cmp x8, x2
        bcs bignum_sqr_innerend

        ldr x9, [x3, x8, lsl #3]
        mul x11, x9, x9
        umulh x9, x9, x9
        adds x15, x15, x11
        adcs x14, x14, x9
        adc x6, x6, xzr



bignum_sqr_innerend:
        adds x4, x4, x15
        str x4, [x1, x7, lsl #3]
        adcs x15, x5, x14
        adc x14, x6, xzr

        add x7, x7, #1
        cmp x7, x0
        bcc bignum_sqr_outerloop

bignum_sqr_end:
        ret
