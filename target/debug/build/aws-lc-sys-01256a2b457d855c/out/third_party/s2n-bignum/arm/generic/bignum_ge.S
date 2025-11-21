# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_ge.S"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 467 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_ge.S" 2
# 13 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_ge.S"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/include/_internal_s2n_bignum.h" 1
# 14 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_ge.S" 2

        .globl _bignum_ge

        .text
        .balign 4
# 29 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_ge.S"
_bignum_ge:



        mov x4, xzr



        subs x0, x0, x2
        bcc bignum_ge_ylonger




        cbz x2, bignum_ge_xtest
bignum_ge_xmainloop:
        ldr x5, [x1, x4, lsl #3]
        ldr x6, [x3, x4, lsl #3]
        sbcs xzr, x5, x6
        add x4, x4, #1
        sub x2, x2, #1
        cbnz x2, bignum_ge_xmainloop
bignum_ge_xtest:
        cbz x0, bignum_ge_xskip
bignum_ge_xtoploop:
        ldr x5, [x1, x4, lsl #3]
        sbcs xzr, x5, xzr
        add x4, x4, #1
        sub x0, x0, #1
        cbnz x0, bignum_ge_xtoploop
bignum_ge_xskip:
        cset x0, cs
        ret




bignum_ge_ylonger:
        adds x0, x0, x2
        cbz x0, bignum_ge_ytoploop
        sub x2, x2, x0
bignum_ge_ymainloop:
        ldr x5, [x1, x4, lsl #3]
        ldr x6, [x3, x4, lsl #3]
        sbcs xzr, x5, x6
        add x4, x4, #1
        sub x0, x0, #1
        cbnz x0, bignum_ge_ymainloop
bignum_ge_ytoploop:
        ldr x5, [x3, x4, lsl #3]
        sbcs xzr, xzr, x5
        add x4, x4, #1
        sub x2, x2, #1
        cbnz x2, bignum_ge_ytoploop

        cset x0, cs
        ret
