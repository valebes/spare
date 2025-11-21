# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p384/bignum_littleendian_6.S"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 467 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p384/bignum_littleendian_6.S" 2
# 26 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p384/bignum_littleendian_6.S"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/include/_internal_s2n_bignum.h" 1
# 27 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p384/bignum_littleendian_6.S" 2

        .globl _bignum_littleendian_6

        .globl _bignum_fromlebytes_6

        .globl _bignum_tolebytes_6


        .text
        .balign 4
# 45 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p384/bignum_littleendian_6.S"
_bignum_littleendian_6:
_bignum_fromlebytes_6:
_bignum_tolebytes_6:



        ldrb w2, [x1]
        extr x3, x2, xzr, #8
        ldrb w2, [x1, #1]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #2]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #3]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #4]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #5]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #6]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #7]
        extr x3, x2, x3, #8
        str x3, [x0]



        ldrb w2, [x1, #8]
        extr x3, x2, xzr, #8
        ldrb w2, [x1, #9]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #10]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #11]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #12]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #13]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #14]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #15]
        extr x3, x2, x3, #8
        str x3, [x0, #8]



        ldrb w2, [x1, #16]
        extr x3, x2, xzr, #8
        ldrb w2, [x1, #17]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #18]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #19]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #20]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #21]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #22]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #23]
        extr x3, x2, x3, #8
        str x3, [x0, #16]



        ldrb w2, [x1, #24]
        extr x3, x2, xzr, #8
        ldrb w2, [x1, #25]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #26]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #27]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #28]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #29]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #30]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #31]
        extr x3, x2, x3, #8
        str x3, [x0, #24]



        ldrb w2, [x1, #32]
        extr x3, x2, xzr, #8
        ldrb w2, [x1, #33]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #34]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #35]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #36]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #37]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #38]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #39]
        extr x3, x2, x3, #8
        str x3, [x0, #32]



        ldrb w2, [x1, #40]
        extr x3, x2, xzr, #8
        ldrb w2, [x1, #41]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #42]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #43]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #44]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #45]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #46]
        extr x3, x2, x3, #8
        ldrb w2, [x1, #47]
        extr x3, x2, x3, #8
        str x3, [x0, #40]

        ret
