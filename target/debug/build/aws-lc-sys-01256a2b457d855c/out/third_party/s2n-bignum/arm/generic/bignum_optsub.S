# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_optsub.S"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 467 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_optsub.S" 2
# 16 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_optsub.S"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/include/_internal_s2n_bignum.h" 1
# 17 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_optsub.S" 2

        .globl _bignum_optsub

        .text
        .balign 4
# 34 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_optsub.S"
_bignum_optsub:



        cbz x0, bignum_optsub_end



        cmp x3, xzr
        csetm x3, ne



        subs x7, xzr, xzr



bignum_optsub_loop:
        ldr x5, [x2, x7]
        ldr x6, [x4, x7]
        and x6, x6, x3
        sbcs x5, x5, x6
        str x5, [x1, x7]
        add x7, x7, #8
        sub x0, x0, #1
        cbnz x0, bignum_optsub_loop



        cset x0, cc

bignum_optsub_end:
        ret
