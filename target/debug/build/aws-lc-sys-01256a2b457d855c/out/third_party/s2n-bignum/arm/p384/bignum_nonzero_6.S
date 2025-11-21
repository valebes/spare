# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p384/bignum_nonzero_6.S"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 467 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p384/bignum_nonzero_6.S" 2
# 12 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p384/bignum_nonzero_6.S"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/include/_internal_s2n_bignum.h" 1
# 13 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p384/bignum_nonzero_6.S" 2

        .globl _bignum_nonzero_6

        .text
        .balign 4







_bignum_nonzero_6:



        ldp x1, x2, [x0]
        orr x1, x1, x2
        ldp x3, x2, [x0, #16]
        orr x3, x3, x2
        orr x1, x1, x3
        ldp x3, x2, [x0, #32]
        orr x3, x3, x2
        orr x1, x1, x3



        cmp x1, xzr
        cset x0, ne

        ret
