# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/curve25519/edwards25519_encode.S"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 467 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/curve25519/edwards25519_encode.S" 2
# 26 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/curve25519/edwards25519_encode.S"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/include/_internal_s2n_bignum.h" 1
# 27 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/curve25519/edwards25519_encode.S" 2

        .globl _edwards25519_encode

        .text
        .balign 4
# 46 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/curve25519/edwards25519_encode.S"
_edwards25519_encode:



        ldr x6, [x1]
        ldp x2, x3, [x1, #32]
        ldp x4, x5, [x1, #48]



        and x5, x5, #0x7FFFFFFFFFFFFFFF
        orr x5, x5, x6, lsl #63



        strb w2, [x0]
        lsr x2, x2, #8
        strb w2, [x0, #1]
        lsr x2, x2, #8
        strb w2, [x0, #2]
        lsr x2, x2, #8
        strb w2, [x0, #3]
        lsr x2, x2, #8
        strb w2, [x0, #4]
        lsr x2, x2, #8
        strb w2, [x0, #5]
        lsr x2, x2, #8
        strb w2, [x0, #6]
        lsr x2, x2, #8
        strb w2, [x0, #7]

        strb w3, [x0, #8]
        lsr x3, x3, #8
        strb w3, [x0, #9]
        lsr x3, x3, #8
        strb w3, [x0, #10]
        lsr x3, x3, #8
        strb w3, [x0, #11]
        lsr x3, x3, #8
        strb w3, [x0, #12]
        lsr x3, x3, #8
        strb w3, [x0, #13]
        lsr x3, x3, #8
        strb w3, [x0, #14]
        lsr x3, x3, #8
        strb w3, [x0, #15]

        strb w4, [x0, #16]
        lsr x4, x4, #8
        strb w4, [x0, #17]
        lsr x4, x4, #8
        strb w4, [x0, #18]
        lsr x4, x4, #8
        strb w4, [x0, #19]
        lsr x4, x4, #8
        strb w4, [x0, #20]
        lsr x4, x4, #8
        strb w4, [x0, #21]
        lsr x4, x4, #8
        strb w4, [x0, #22]
        lsr x4, x4, #8
        strb w4, [x0, #23]

        strb w5, [x0, #24]
        lsr x5, x5, #8
        strb w5, [x0, #25]
        lsr x5, x5, #8
        strb w5, [x0, #26]
        lsr x5, x5, #8
        strb w5, [x0, #27]
        lsr x5, x5, #8
        strb w5, [x0, #28]
        lsr x5, x5, #8
        strb w5, [x0, #29]
        lsr x5, x5, #8
        strb w5, [x0, #30]
        lsr x5, x5, #8
        strb w5, [x0, #31]



        ret
