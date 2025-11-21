# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_mul.S"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 467 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_mul.S" 2
# 17 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_mul.S"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/include/_internal_s2n_bignum.h" 1
# 18 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_mul.S" 2

        .globl _bignum_mul

        .text
        .balign 4
# 42 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_mul.S"
_bignum_mul:



        cbz x0, bignum_mul_end



        mov x6, xzr
        mov x7, xzr



        mov x9, xzr
bignum_mul_outerloop:



        mov x8, xzr




        add x11, x9, #1
        cmp x11, x2
        csel x12, x11, x2, cc
        subs x11, x11, x4
        csel x11, x11, xzr, cs



        subs x10, x12, x11
        bls bignum_mul_innerend





        lsl x14, x11, #3
        add x14, x14, x3

        sub x15, x9, x12
        lsl x15, x15, #3
        add x15, x15, x5



bignum_mul_innerloop:
        ldr x11, [x14], #8
        ldr x12, [x15, x10, lsl #3]
        mul x13, x11, x12
        umulh x11, x11, x12
        adds x6, x6, x13
        adcs x7, x7, x11
        adc x8, x8, xzr
        subs x10, x10, #1
        bne bignum_mul_innerloop

bignum_mul_innerend:
        str x6, [x1, x9, lsl #3]
        mov x6, x7
        mov x7, x8

        add x9, x9, #1
        cmp x9, x0
        bcc bignum_mul_outerloop

bignum_mul_end:
        ret
