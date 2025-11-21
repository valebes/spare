# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/curve25519/bignum_neg_p25519.S"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 467 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/curve25519/bignum_neg_p25519.S" 2
# 13 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/curve25519/bignum_neg_p25519.S"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/include/_internal_s2n_bignum.h" 1
# 14 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/curve25519/bignum_neg_p25519.S" 2

        .globl _bignum_neg_p25519

        .text
        .balign 4
# 30 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/curve25519/bignum_neg_p25519.S"
_bignum_neg_p25519:




        ldp x2, x3, [x1]
        mov x7, #-19
        orr x6, x2, x3
        subs x2, x7, x2
        mov x7, #-1
        sbcs x3, x7, x3
        ldp x4, x5, [x1, #16]
        orr x6, x6, x4
        sbcs x4, x7, x4
        mov x7, #0x7FFFFFFFFFFFFFFF
        orr x6, x6, x5
        sbc x5, x7, x5



        cmp x6, xzr
        csel x2, x2, xzr, ne
        csel x3, x3, xzr, ne
        csel x4, x4, xzr, ne
        csel x5, x5, xzr, ne



        stp x2, x3, [x0]
        stp x4, x5, [x0, #16]

        ret
