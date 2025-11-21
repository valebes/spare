# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/curve25519/curve25519_x25519_byte_alt.S"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 467 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/curve25519/curve25519_x25519_byte_alt.S" 2
# 21 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/curve25519/curve25519_x25519_byte_alt.S"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/include/_internal_s2n_bignum.h" 1
# 22 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/curve25519/curve25519_x25519_byte_alt.S" 2

        .globl _curve25519_x25519_byte_alt


        .text
        .balign 4
# 457 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/curve25519/curve25519_x25519_byte_alt.S"
_curve25519_x25519_byte_alt:



        stp x19, x20, [sp, -16]!
        stp x21, x22, [sp, -16]!
        stp x23, x24, [sp, -16]!
        sub sp, sp, #(10*32)



        mov x23, x0
# 479 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/curve25519/curve25519_x25519_byte_alt.S"
        ldrb w10, [x1]
        ldrb w0, [x1, #1]
        orr x10, x10, x0, lsl #8
        ldrb w0, [x1, #2]
        orr x10, x10, x0, lsl #16
        ldrb w0, [x1, #3]
        orr x10, x10, x0, lsl #24
        ldrb w0, [x1, #4]
        orr x10, x10, x0, lsl #32
        ldrb w0, [x1, #5]
        orr x10, x10, x0, lsl #40
        ldrb w0, [x1, #6]
        orr x10, x10, x0, lsl #48
        ldrb w0, [x1, #7]
        orr x10, x10, x0, lsl #56
        ldrb w11, [x1, #8]
        ldrb w0, [x1, #9]
        orr x11, x11, x0, lsl #8
        ldrb w0, [x1, #10]
        orr x11, x11, x0, lsl #16
        ldrb w0, [x1, #11]
        orr x11, x11, x0, lsl #24
        ldrb w0, [x1, #12]
        orr x11, x11, x0, lsl #32
        ldrb w0, [x1, #13]
        orr x11, x11, x0, lsl #40
        ldrb w0, [x1, #14]
        orr x11, x11, x0, lsl #48
        ldrb w0, [x1, #15]
        orr x11, x11, x0, lsl #56
        stp x10, x11, [sp, #(0*32)]

        ldrb w12, [x1, #16]
        ldrb w0, [x1, #17]
        orr x12, x12, x0, lsl #8
        ldrb w0, [x1, #18]
        orr x12, x12, x0, lsl #16
        ldrb w0, [x1, #19]
        orr x12, x12, x0, lsl #24
        ldrb w0, [x1, #20]
        orr x12, x12, x0, lsl #32
        ldrb w0, [x1, #21]
        orr x12, x12, x0, lsl #40
        ldrb w0, [x1, #22]
        orr x12, x12, x0, lsl #48
        ldrb w0, [x1, #23]
        orr x12, x12, x0, lsl #56
        ldrb w13, [x1, #24]
        ldrb w0, [x1, #25]
        orr x13, x13, x0, lsl #8
        ldrb w0, [x1, #26]
        orr x13, x13, x0, lsl #16
        ldrb w0, [x1, #27]
        orr x13, x13, x0, lsl #24
        ldrb w0, [x1, #28]
        orr x13, x13, x0, lsl #32
        ldrb w0, [x1, #29]
        orr x13, x13, x0, lsl #40
        ldrb w0, [x1, #30]
        orr x13, x13, x0, lsl #48
        ldrb w0, [x1, #31]
        orr x13, x13, x0, lsl #56
        stp x12, x13, [sp, #(0*32)+16]

        ldrb w10, [x2]
        ldrb w0, [x2, #1]
        orr x10, x10, x0, lsl #8
        ldrb w0, [x2, #2]
        orr x10, x10, x0, lsl #16
        ldrb w0, [x2, #3]
        orr x10, x10, x0, lsl #24
        ldrb w0, [x2, #4]
        orr x10, x10, x0, lsl #32
        ldrb w0, [x2, #5]
        orr x10, x10, x0, lsl #40
        ldrb w0, [x2, #6]
        orr x10, x10, x0, lsl #48
        ldrb w0, [x2, #7]
        orr x10, x10, x0, lsl #56
        ldrb w11, [x2, #8]
        ldrb w0, [x2, #9]
        orr x11, x11, x0, lsl #8
        ldrb w0, [x2, #10]
        orr x11, x11, x0, lsl #16
        ldrb w0, [x2, #11]
        orr x11, x11, x0, lsl #24
        ldrb w0, [x2, #12]
        orr x11, x11, x0, lsl #32
        ldrb w0, [x2, #13]
        orr x11, x11, x0, lsl #40
        ldrb w0, [x2, #14]
        orr x11, x11, x0, lsl #48
        ldrb w0, [x2, #15]
        orr x11, x11, x0, lsl #56
        stp x10, x11, [sp, #(1*32)]

        ldrb w12, [x2, #16]
        ldrb w0, [x2, #17]
        orr x12, x12, x0, lsl #8
        ldrb w0, [x2, #18]
        orr x12, x12, x0, lsl #16
        ldrb w0, [x2, #19]
        orr x12, x12, x0, lsl #24
        ldrb w0, [x2, #20]
        orr x12, x12, x0, lsl #32
        ldrb w0, [x2, #21]
        orr x12, x12, x0, lsl #40
        ldrb w0, [x2, #22]
        orr x12, x12, x0, lsl #48
        ldrb w0, [x2, #23]
        orr x12, x12, x0, lsl #56
        ldrb w13, [x2, #24]
        ldrb w0, [x2, #25]
        orr x13, x13, x0, lsl #8
        ldrb w0, [x2, #26]
        orr x13, x13, x0, lsl #16
        ldrb w0, [x2, #27]
        orr x13, x13, x0, lsl #24
        ldrb w0, [x2, #28]
        orr x13, x13, x0, lsl #32
        ldrb w0, [x2, #29]
        orr x13, x13, x0, lsl #40
        ldrb w0, [x2, #30]
        orr x13, x13, x0, lsl #48
        ldrb w0, [x2, #31]
        orr x13, x13, x0, lsl #56
        and x13, x13, #0x7fffffffffffffff
        stp x12, x13, [sp, #(1*32)+16]
# 615 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/curve25519/curve25519_x25519_byte_alt.S"
        mov x21, #1
        stp x10, x11, [sp, #(7*32)]
        stp x12, x13, [sp, #(7*32)+16]
        stp x21, xzr, [sp, #(2*32)]
        stp xzr, xzr, [sp, #(2*32)+16]

        ldp x5, x6, [sp, #(7*32)]
	 ldp x4, x3, [sp, #(2*32)]
	 subs x5, x5, x4
	 sbcs x6, x6, x3
	 ldp x7, x8, [sp, #(7*32)+16]
	 ldp x4, x3, [sp, #(2*32)+16]
	 sbcs x7, x7, x4
	 sbcs x8, x8, x3
	 mov x4, #38
	 csel x3, x4, xzr, lo
	 subs x5, x5, x3
	 sbcs x6, x6, xzr
	 sbcs x7, x7, xzr
	 sbc x8, x8, xzr
	 stp x5, x6, [sp, #(8*32)]
	 stp x7, x8, [sp, #(8*32)+16]
        ldp x3, x4, [sp, #(7*32)]
	 ldp x7, x8, [sp, #(2*32)]
	 adds x3, x3, x7
	 adcs x4, x4, x8
	 ldp x5, x6, [sp, #(7*32)+16]
	 ldp x7, x8, [sp, #(2*32)+16]
	 adcs x5, x5, x7
	 adcs x6, x6, x8
	 mov x9, #38
	 csel x9, x9, xzr, cs
	 adds x3, x3, x9
	 adcs x4, x4, xzr
	 adcs x5, x5, xzr
	 adc x6, x6, xzr
	 stp x3, x4, [sp, #(9*32)]
	 stp x5, x6, [sp, #(9*32)+16]
        ldp x2, x3, [sp, #(8*32)]
	 mul x9, x2, x3
	 umulh x10, x2, x3
	 ldp x4, x5, [sp, #(8*32)+16]
	 mul x11, x2, x5
	 umulh x12, x2, x5
	 mul x7, x2, x4
	 umulh x6, x2, x4
	 adds x10, x10, x7
	 adcs x11, x11, x6
	 mul x7, x3, x4
	 umulh x6, x3, x4
	 adc x6, x6, xzr
	 adds x11, x11, x7
	 mul x13, x4, x5
	 umulh x14, x4, x5
	 adcs x12, x12, x6
	 mul x7, x3, x5
	 umulh x6, x3, x5
	 adc x6, x6, xzr
	 adds x12, x12, x7
	 adcs x13, x13, x6
	 adc x14, x14, xzr
	 adds x9, x9, x9
	 adcs x10, x10, x10
	 adcs x11, x11, x11
	 adcs x12, x12, x12
	 adcs x13, x13, x13
	 adcs x14, x14, x14
	 cset x6, cs
	 umulh x7, x2, x2
	 mul x8, x2, x2
	 adds x9, x9, x7
	 mul x7, x3, x3
	 adcs x10, x10, x7
	 umulh x7, x3, x3
	 adcs x11, x11, x7
	 mul x7, x4, x4
	 adcs x12, x12, x7
	 umulh x7, x4, x4
	 adcs x13, x13, x7
	 mul x7, x5, x5
	 adcs x14, x14, x7
	 umulh x7, x5, x5
	 adc x6, x6, x7
	 mov x3, #0x26
	 mul x7, x3, x12
	 umulh x4, x3, x12
	 adds x8, x8, x7
	 mul x7, x3, x13
	 umulh x13, x3, x13
	 adcs x9, x9, x7
	 mul x7, x3, x14
	 umulh x14, x3, x14
	 adcs x10, x10, x7
	 mul x7, x3, x6
	 umulh x6, x3, x6
	 adcs x11, x11, x7
	 cset x12, cs
	 adds x11, x11, x14
	 adc x12, x12, x6
	 cmn x11, x11
	 bic x11, x11, #0x8000000000000000
	 adc x2, x12, x12
	 mov x3, #0x13
	 mul x7, x3, x2
	 adds x8, x8, x7
	 adcs x9, x9, x4
	 adcs x10, x10, x13
	 adc x11, x11, xzr
	 stp x8, x9, [sp, #(8*32)]
	 stp x10, x11, [sp, #(8*32)+16]
        ldp x2, x3, [sp, #(9*32)]
	 mul x9, x2, x3
	 umulh x10, x2, x3
	 ldp x4, x5, [sp, #(9*32)+16]
	 mul x11, x2, x5
	 umulh x12, x2, x5
	 mul x7, x2, x4
	 umulh x6, x2, x4
	 adds x10, x10, x7
	 adcs x11, x11, x6
	 mul x7, x3, x4
	 umulh x6, x3, x4
	 adc x6, x6, xzr
	 adds x11, x11, x7
	 mul x13, x4, x5
	 umulh x14, x4, x5
	 adcs x12, x12, x6
	 mul x7, x3, x5
	 umulh x6, x3, x5
	 adc x6, x6, xzr
	 adds x12, x12, x7
	 adcs x13, x13, x6
	 adc x14, x14, xzr
	 adds x9, x9, x9
	 adcs x10, x10, x10
	 adcs x11, x11, x11
	 adcs x12, x12, x12
	 adcs x13, x13, x13
	 adcs x14, x14, x14
	 cset x6, cs
	 umulh x7, x2, x2
	 mul x8, x2, x2
	 adds x9, x9, x7
	 mul x7, x3, x3
	 adcs x10, x10, x7
	 umulh x7, x3, x3
	 adcs x11, x11, x7
	 mul x7, x4, x4
	 adcs x12, x12, x7
	 umulh x7, x4, x4
	 adcs x13, x13, x7
	 mul x7, x5, x5
	 adcs x14, x14, x7
	 umulh x7, x5, x5
	 adc x6, x6, x7
	 mov x3, #0x26
	 mul x7, x3, x12
	 umulh x4, x3, x12
	 adds x8, x8, x7
	 mul x7, x3, x13
	 umulh x13, x3, x13
	 adcs x9, x9, x7
	 mul x7, x3, x14
	 umulh x14, x3, x14
	 adcs x10, x10, x7
	 mul x7, x3, x6
	 umulh x6, x3, x6
	 adcs x11, x11, x7
	 cset x12, cs
	 adds x11, x11, x14
	 adc x12, x12, x6
	 cmn x11, x11
	 bic x11, x11, #0x8000000000000000
	 adc x2, x12, x12
	 mov x3, #0x13
	 mul x7, x3, x2
	 adds x8, x8, x7
	 adcs x9, x9, x4
	 adcs x10, x10, x13
	 adc x11, x11, xzr
	 stp x8, x9, [sp, #(9*32)]
	 stp x10, x11, [sp, #(9*32)+16]
        ldp x5, x6, [sp, #(9*32)]
	 ldp x4, x3, [sp, #(8*32)]
	 subs x5, x5, x4
	 sbcs x6, x6, x3
	 ldp x7, x8, [sp, #(9*32)+16]
	 ldp x4, x3, [sp, #(8*32)+16]
	 sbcs x7, x7, x4
	 sbcs x8, x8, x3
	 mov x4, #38
	 csel x3, x4, xzr, lo
	 subs x5, x5, x3
	 sbcs x6, x6, xzr
	 sbcs x7, x7, xzr
	 sbc x8, x8, xzr
	 stp x5, x6, [sp, #(6*32)]
	 stp x7, x8, [sp, #(6*32)+16]
        mov x1, 0xdb42
        orr x1, x1, 0x10000
        ldp x7, x8, [sp, #(6*32)]
	 ldp x9, x10, [sp, #(6*32)+16]
	 mul x3, x1, x7
	 mul x4, x1, x8
	 mul x5, x1, x9
	 mul x6, x1, x10
	 umulh x7, x1, x7
	 umulh x8, x1, x8
	 umulh x9, x1, x9
	 umulh x10, x1, x10
	 adds x4, x4, x7
	 adcs x5, x5, x8
	 adcs x6, x6, x9
	 adc x10, x10, xzr
	 ldp x7, x8, [sp, #(8*32)]
	 adds x3, x3, x7
	 adcs x4, x4, x8
	 ldp x7, x8, [sp, #(8*32)+16]
	 adcs x5, x5, x7
	 adcs x6, x6, x8
	 adc x10, x10, xzr
	 cmn x6, x6
	 bic x6, x6, #0x8000000000000000
	 adc x8, x10, x10
	 mov x9, #19
	 mul x7, x8, x9
	 adds x3, x3, x7
	 adcs x4, x4, xzr
	 adcs x5, x5, xzr
	 adc x6, x6, xzr
	 stp x3, x4, [sp, #(5*32)]
	 stp x5, x6, [sp, #(5*32)+16]
        ldp x3, x4, [sp, #(9*32)]
	 ldp x7, x8, [sp, #(8*32)]
	 mul x12, x3, x7
	 umulh x13, x3, x7
	 mul x11, x3, x8
	 umulh x14, x3, x8
	 adds x13, x13, x11
	 ldp x9, x10, [sp, #(8*32)+16]
	 mul x11, x3, x9
	 umulh x15, x3, x9
	 adcs x14, x14, x11
	 mul x11, x3, x10
	 umulh x16, x3, x10
	 adcs x15, x15, x11
	 adc x16, x16, xzr
	 ldp x5, x6, [sp, #(9*32)+16]
	 mul x11, x4, x7
	 adds x13, x13, x11
	 mul x11, x4, x8
	 adcs x14, x14, x11
	 mul x11, x4, x9
	 adcs x15, x15, x11
	 mul x11, x4, x10
	 adcs x16, x16, x11
	 umulh x3, x4, x10
	 adc x3, x3, xzr
	 umulh x11, x4, x7
	 adds x14, x14, x11
	 umulh x11, x4, x8
	 adcs x15, x15, x11
	 umulh x11, x4, x9
	 adcs x16, x16, x11
	 adc x3, x3, xzr
	 mul x11, x5, x7
	 adds x14, x14, x11
	 mul x11, x5, x8
	 adcs x15, x15, x11
	 mul x11, x5, x9
	 adcs x16, x16, x11
	 mul x11, x5, x10
	 adcs x3, x3, x11
	 umulh x4, x5, x10
	 adc x4, x4, xzr
	 umulh x11, x5, x7
	 adds x15, x15, x11
	 umulh x11, x5, x8
	 adcs x16, x16, x11
	 umulh x11, x5, x9
	 adcs x3, x3, x11
	 adc x4, x4, xzr
	 mul x11, x6, x7
	 adds x15, x15, x11
	 mul x11, x6, x8
	 adcs x16, x16, x11
	 mul x11, x6, x9
	 adcs x3, x3, x11
	 mul x11, x6, x10
	 adcs x4, x4, x11
	 umulh x5, x6, x10
	 adc x5, x5, xzr
	 umulh x11, x6, x7
	 adds x16, x16, x11
	 umulh x11, x6, x8
	 adcs x3, x3, x11
	 umulh x11, x6, x9
	 adcs x4, x4, x11
	 adc x5, x5, xzr
	 mov x7, #0x26
	 mul x11, x7, x16
	 umulh x9, x7, x16
	 adds x12, x12, x11
	 mul x11, x7, x3
	 umulh x3, x7, x3
	 adcs x13, x13, x11
	 mul x11, x7, x4
	 umulh x4, x7, x4
	 adcs x14, x14, x11
	 mul x11, x7, x5
	 umulh x5, x7, x5
	 adcs x15, x15, x11
	 cset x16, cs
	 adds x15, x15, x4
	 adc x16, x16, x5
	 cmn x15, x15
	 bic x15, x15, #0x8000000000000000
	 adc x8, x16, x16
	 mov x7, #0x13
	 mul x11, x7, x8
	 adds x12, x12, x11
	 adcs x13, x13, x9
	 adcs x14, x14, x3
	 adc x15, x15, xzr
	 stp x12, x13, [sp, #(9*32)]
	 stp x14, x15, [sp, #(9*32)+16]
        ldp x3, x4, [sp, #(6*32)]
	 ldp x7, x8, [sp, #(5*32)]
	 mul x12, x3, x7
	 umulh x13, x3, x7
	 mul x11, x3, x8
	 umulh x14, x3, x8
	 adds x13, x13, x11
	 ldp x9, x10, [sp, #(5*32)+16]
	 mul x11, x3, x9
	 umulh x15, x3, x9
	 adcs x14, x14, x11
	 mul x11, x3, x10
	 umulh x16, x3, x10
	 adcs x15, x15, x11
	 adc x16, x16, xzr
	 ldp x5, x6, [sp, #(6*32)+16]
	 mul x11, x4, x7
	 adds x13, x13, x11
	 mul x11, x4, x8
	 adcs x14, x14, x11
	 mul x11, x4, x9
	 adcs x15, x15, x11
	 mul x11, x4, x10
	 adcs x16, x16, x11
	 umulh x3, x4, x10
	 adc x3, x3, xzr
	 umulh x11, x4, x7
	 adds x14, x14, x11
	 umulh x11, x4, x8
	 adcs x15, x15, x11
	 umulh x11, x4, x9
	 adcs x16, x16, x11
	 adc x3, x3, xzr
	 mul x11, x5, x7
	 adds x14, x14, x11
	 mul x11, x5, x8
	 adcs x15, x15, x11
	 mul x11, x5, x9
	 adcs x16, x16, x11
	 mul x11, x5, x10
	 adcs x3, x3, x11
	 umulh x4, x5, x10
	 adc x4, x4, xzr
	 umulh x11, x5, x7
	 adds x15, x15, x11
	 umulh x11, x5, x8
	 adcs x16, x16, x11
	 umulh x11, x5, x9
	 adcs x3, x3, x11
	 adc x4, x4, xzr
	 mul x11, x6, x7
	 adds x15, x15, x11
	 mul x11, x6, x8
	 adcs x16, x16, x11
	 mul x11, x6, x9
	 adcs x3, x3, x11
	 mul x11, x6, x10
	 adcs x4, x4, x11
	 umulh x5, x6, x10
	 adc x5, x5, xzr
	 umulh x11, x6, x7
	 adds x16, x16, x11
	 umulh x11, x6, x8
	 adcs x3, x3, x11
	 umulh x11, x6, x9
	 adcs x4, x4, x11
	 adc x5, x5, xzr
	 mov x7, #0x26
	 mul x11, x7, x16
	 umulh x9, x7, x16
	 adds x12, x12, x11
	 mul x11, x7, x3
	 umulh x3, x7, x3
	 adcs x13, x13, x11
	 mul x11, x7, x4
	 umulh x4, x7, x4
	 adcs x14, x14, x11
	 mul x11, x7, x5
	 umulh x5, x7, x5
	 adcs x15, x15, x11
	 cset x16, cs
	 adds x15, x15, x4
	 adc x16, x16, x5
	 cmn x15, x15
	 bic x15, x15, #0x8000000000000000
	 adc x8, x16, x16
	 mov x7, #0x13
	 mul x11, x7, x8
	 adds x12, x12, x11
	 adcs x13, x13, x9
	 adcs x14, x14, x3
	 adc x15, x15, xzr
	 stp x12, x13, [sp, #(5*32)]
	 stp x14, x15, [sp, #(5*32)+16]





        mov x20, #253

curve25519_x25519_byte_alt_scalarloop:



        ldp x5, x6, [sp, #(7*32)]
	 ldp x4, x3, [sp, #(2*32)]
	 subs x5, x5, x4
	 sbcs x6, x6, x3
	 ldp x7, x8, [sp, #(7*32)+16]
	 ldp x4, x3, [sp, #(2*32)+16]
	 sbcs x7, x7, x4
	 sbcs x8, x8, x3
	 mov x4, #38
	 csel x3, x4, xzr, lo
	 subs x5, x5, x3
	 sbcs x6, x6, xzr
	 sbcs x7, x7, xzr
	 sbc x8, x8, xzr
	 stp x5, x6, [sp, #(4*32)]
	 stp x7, x8, [sp, #(4*32)+16]
        ldp x3, x4, [sp, #(9*32)]
	 ldp x7, x8, [sp, #(5*32)]
	 adds x3, x3, x7
	 adcs x4, x4, x8
	 ldp x5, x6, [sp, #(9*32)+16]
	 ldp x7, x8, [sp, #(5*32)+16]
	 adcs x5, x5, x7
	 adcs x6, x6, x8
	 mov x9, #38
	 csel x9, x9, xzr, cs
	 adds x3, x3, x9
	 adcs x4, x4, xzr
	 adcs x5, x5, xzr
	 adc x6, x6, xzr
	 stp x3, x4, [sp, #(3*32)]
	 stp x5, x6, [sp, #(3*32)+16]
        ldp x5, x6, [sp, #(9*32)]
	 ldp x4, x3, [sp, #(5*32)]
	 subs x5, x5, x4
	 sbcs x6, x6, x3
	 ldp x7, x8, [sp, #(9*32)+16]
	 ldp x4, x3, [sp, #(5*32)+16]
	 sbcs x7, x7, x4
	 sbcs x8, x8, x3
	 mov x4, #38
	 csel x3, x4, xzr, lo
	 subs x5, x5, x3
	 sbcs x6, x6, xzr
	 sbcs x7, x7, xzr
	 sbc x8, x8, xzr
	 stp x5, x6, [sp, #(5*32)]
	 stp x7, x8, [sp, #(5*32)+16]
        ldp x3, x4, [sp, #(7*32)]
	 ldp x7, x8, [sp, #(2*32)]
	 adds x3, x3, x7
	 adcs x4, x4, x8
	 ldp x5, x6, [sp, #(7*32)+16]
	 ldp x7, x8, [sp, #(2*32)+16]
	 adcs x5, x5, x7
	 adcs x6, x6, x8
	 mov x9, #38
	 csel x9, x9, xzr, cs
	 adds x3, x3, x9
	 adcs x4, x4, xzr
	 adcs x5, x5, xzr
	 adc x6, x6, xzr
	 stp x3, x4, [sp, #(2*32)]
	 stp x5, x6, [sp, #(2*32)+16]




        ldp x3, x4, [sp, #(3*32)]
	 ldp x7, x8, [sp, #(4*32)]
	 mul x12, x3, x7
	 umulh x13, x3, x7
	 mul x11, x3, x8
	 umulh x14, x3, x8
	 adds x13, x13, x11
	 ldp x9, x10, [sp, #(4*32)+16]
	 mul x11, x3, x9
	 umulh x15, x3, x9
	 adcs x14, x14, x11
	 mul x11, x3, x10
	 umulh x16, x3, x10
	 adcs x15, x15, x11
	 adc x16, x16, xzr
	 ldp x5, x6, [sp, #(3*32)+16]
	 mul x11, x4, x7
	 adds x13, x13, x11
	 mul x11, x4, x8
	 adcs x14, x14, x11
	 mul x11, x4, x9
	 adcs x15, x15, x11
	 mul x11, x4, x10
	 adcs x16, x16, x11
	 umulh x3, x4, x10
	 adc x3, x3, xzr
	 umulh x11, x4, x7
	 adds x14, x14, x11
	 umulh x11, x4, x8
	 adcs x15, x15, x11
	 umulh x11, x4, x9
	 adcs x16, x16, x11
	 adc x3, x3, xzr
	 mul x11, x5, x7
	 adds x14, x14, x11
	 mul x11, x5, x8
	 adcs x15, x15, x11
	 mul x11, x5, x9
	 adcs x16, x16, x11
	 mul x11, x5, x10
	 adcs x3, x3, x11
	 umulh x4, x5, x10
	 adc x4, x4, xzr
	 umulh x11, x5, x7
	 adds x15, x15, x11
	 umulh x11, x5, x8
	 adcs x16, x16, x11
	 umulh x11, x5, x9
	 adcs x3, x3, x11
	 adc x4, x4, xzr
	 mul x11, x6, x7
	 adds x15, x15, x11
	 mul x11, x6, x8
	 adcs x16, x16, x11
	 mul x11, x6, x9
	 adcs x3, x3, x11
	 mul x11, x6, x10
	 adcs x4, x4, x11
	 umulh x5, x6, x10
	 adc x5, x5, xzr
	 umulh x11, x6, x7
	 adds x16, x16, x11
	 umulh x11, x6, x8
	 adcs x3, x3, x11
	 umulh x11, x6, x9
	 adcs x4, x4, x11
	 adc x5, x5, xzr
	 mov x7, #0x26
	 mul x11, x7, x16
	 umulh x9, x7, x16
	 adds x12, x12, x11
	 mul x11, x7, x3
	 umulh x3, x7, x3
	 adcs x13, x13, x11
	 mul x11, x7, x4
	 umulh x4, x7, x4
	 adcs x14, x14, x11
	 mul x11, x7, x5
	 umulh x5, x7, x5
	 adcs x15, x15, x11
	 cset x16, cs
	 adds x15, x15, x4
	 adc x16, x16, x5
	 cmn x15, x15
	 bic x15, x15, #0x8000000000000000
	 adc x8, x16, x16
	 mov x7, #0x13
	 mul x11, x7, x8
	 adds x12, x12, x11
	 adcs x13, x13, x9
	 adcs x14, x14, x3
	 adc x15, x15, xzr
	 stp x12, x13, [sp, #(6*32)]
	 stp x14, x15, [sp, #(6*32)+16]

        lsr x0, x20, #6
        ldr x2, [sp, x0, lsl #3]
        lsr x2, x2, x20
        and x2, x2, #1

        cmp x21, x2
        mov x21, x2

        ldp x0, x1, [sp, #(4*32)]
	 ldp x2, x3, [sp, #(5*32)]
	 csel x0, x0, x2, ne
	 csel x1, x1, x3, ne
	 stp x0, x1, [sp, #(8*32)]
	 ldp x0, x1, [sp, #(4*32)+16]
	 ldp x2, x3, [sp, #(5*32)+16]
	 csel x0, x0, x2, ne
	 csel x1, x1, x3, ne
	 stp x0, x1, [sp, #(8*32)+16]
        ldp x0, x1, [sp, #(2*32)]
	 ldp x2, x3, [sp, #(3*32)]
	 csel x0, x0, x2, ne
	 csel x1, x1, x3, ne
	 stp x0, x1, [sp, #(9*32)]
	 ldp x0, x1, [sp, #(2*32)+16]
	 ldp x2, x3, [sp, #(3*32)+16]
	 csel x0, x0, x2, ne
	 csel x1, x1, x3, ne
	 stp x0, x1, [sp, #(9*32)+16]



        ldp x3, x4, [sp, #(2*32)]
	 ldp x7, x8, [sp, #(5*32)]
	 mul x12, x3, x7
	 umulh x13, x3, x7
	 mul x11, x3, x8
	 umulh x14, x3, x8
	 adds x13, x13, x11
	 ldp x9, x10, [sp, #(5*32)+16]
	 mul x11, x3, x9
	 umulh x15, x3, x9
	 adcs x14, x14, x11
	 mul x11, x3, x10
	 umulh x16, x3, x10
	 adcs x15, x15, x11
	 adc x16, x16, xzr
	 ldp x5, x6, [sp, #(2*32)+16]
	 mul x11, x4, x7
	 adds x13, x13, x11
	 mul x11, x4, x8
	 adcs x14, x14, x11
	 mul x11, x4, x9
	 adcs x15, x15, x11
	 mul x11, x4, x10
	 adcs x16, x16, x11
	 umulh x3, x4, x10
	 adc x3, x3, xzr
	 umulh x11, x4, x7
	 adds x14, x14, x11
	 umulh x11, x4, x8
	 adcs x15, x15, x11
	 umulh x11, x4, x9
	 adcs x16, x16, x11
	 adc x3, x3, xzr
	 mul x11, x5, x7
	 adds x14, x14, x11
	 mul x11, x5, x8
	 adcs x15, x15, x11
	 mul x11, x5, x9
	 adcs x16, x16, x11
	 mul x11, x5, x10
	 adcs x3, x3, x11
	 umulh x4, x5, x10
	 adc x4, x4, xzr
	 umulh x11, x5, x7
	 adds x15, x15, x11
	 umulh x11, x5, x8
	 adcs x16, x16, x11
	 umulh x11, x5, x9
	 adcs x3, x3, x11
	 adc x4, x4, xzr
	 mul x11, x6, x7
	 adds x15, x15, x11
	 mul x11, x6, x8
	 adcs x16, x16, x11
	 mul x11, x6, x9
	 adcs x3, x3, x11
	 mul x11, x6, x10
	 adcs x4, x4, x11
	 umulh x5, x6, x10
	 adc x5, x5, xzr
	 umulh x11, x6, x7
	 adds x16, x16, x11
	 umulh x11, x6, x8
	 adcs x3, x3, x11
	 umulh x11, x6, x9
	 adcs x4, x4, x11
	 adc x5, x5, xzr
	 mov x7, #0x26
	 mul x11, x7, x16
	 umulh x9, x7, x16
	 adds x12, x12, x11
	 mul x11, x7, x3
	 umulh x3, x7, x3
	 adcs x13, x13, x11
	 mul x11, x7, x4
	 umulh x4, x7, x4
	 adcs x14, x14, x11
	 mul x11, x7, x5
	 umulh x5, x7, x5
	 adcs x15, x15, x11
	 cset x16, cs
	 adds x15, x15, x4
	 adc x16, x16, x5
	 cmn x15, x15
	 bic x15, x15, #0x8000000000000000
	 adc x8, x16, x16
	 mov x7, #0x13
	 mul x11, x7, x8
	 adds x12, x12, x11
	 adcs x13, x13, x9
	 adcs x14, x14, x3
	 adc x15, x15, xzr
	 stp x12, x13, [sp, #(7*32)]
	 stp x14, x15, [sp, #(7*32)+16]



        ldp x2, x3, [sp, #(8*32)]
	 mul x9, x2, x3
	 umulh x10, x2, x3
	 ldp x4, x5, [sp, #(8*32)+16]
	 mul x11, x2, x5
	 umulh x12, x2, x5
	 mul x7, x2, x4
	 umulh x6, x2, x4
	 adds x10, x10, x7
	 adcs x11, x11, x6
	 mul x7, x3, x4
	 umulh x6, x3, x4
	 adc x6, x6, xzr
	 adds x11, x11, x7
	 mul x13, x4, x5
	 umulh x14, x4, x5
	 adcs x12, x12, x6
	 mul x7, x3, x5
	 umulh x6, x3, x5
	 adc x6, x6, xzr
	 adds x12, x12, x7
	 adcs x13, x13, x6
	 adc x14, x14, xzr
	 adds x9, x9, x9
	 adcs x10, x10, x10
	 adcs x11, x11, x11
	 adcs x12, x12, x12
	 adcs x13, x13, x13
	 adcs x14, x14, x14
	 cset x6, cs
	 umulh x7, x2, x2
	 mul x8, x2, x2
	 adds x9, x9, x7
	 mul x7, x3, x3
	 adcs x10, x10, x7
	 umulh x7, x3, x3
	 adcs x11, x11, x7
	 mul x7, x4, x4
	 adcs x12, x12, x7
	 umulh x7, x4, x4
	 adcs x13, x13, x7
	 mul x7, x5, x5
	 adcs x14, x14, x7
	 umulh x7, x5, x5
	 adc x6, x6, x7
	 mov x3, #0x26
	 mul x7, x3, x12
	 umulh x4, x3, x12
	 adds x8, x8, x7
	 mul x7, x3, x13
	 umulh x13, x3, x13
	 adcs x9, x9, x7
	 mul x7, x3, x14
	 umulh x14, x3, x14
	 adcs x10, x10, x7
	 mul x7, x3, x6
	 umulh x6, x3, x6
	 adcs x11, x11, x7
	 cset x12, cs
	 adds x11, x11, x14
	 adc x12, x12, x6
	 cmn x11, x11
	 bic x11, x11, #0x8000000000000000
	 adc x2, x12, x12
	 mov x3, #0x13
	 mul x7, x3, x2
	 adds x8, x8, x7
	 adcs x9, x9, x4
	 adcs x10, x10, x13
	 adc x11, x11, xzr
	 stp x8, x9, [sp, #(8*32)]
	 stp x10, x11, [sp, #(8*32)+16]




        ldp x5, x6, [sp, #(6*32)]
	 ldp x4, x3, [sp, #(7*32)]
	 subs x5, x5, x4
	 sbcs x6, x6, x3
	 ldp x7, x8, [sp, #(6*32)+16]
	 ldp x4, x3, [sp, #(7*32)+16]
	 sbcs x7, x7, x4
	 sbcs x8, x8, x3
	 mov x4, #38
	 csel x3, x4, xzr, lo
	 subs x5, x5, x3
	 sbcs x6, x6, xzr
	 sbcs x7, x7, xzr
	 sbc x8, x8, xzr
	 stp x5, x6, [sp, #(2*32)]
	 stp x7, x8, [sp, #(2*32)+16]
        ldp x2, x3, [sp, #(9*32)]
	 mul x9, x2, x3
	 umulh x10, x2, x3
	 ldp x4, x5, [sp, #(9*32)+16]
	 mul x11, x2, x5
	 umulh x12, x2, x5
	 mul x7, x2, x4
	 umulh x6, x2, x4
	 adds x10, x10, x7
	 adcs x11, x11, x6
	 mul x7, x3, x4
	 umulh x6, x3, x4
	 adc x6, x6, xzr
	 adds x11, x11, x7
	 mul x13, x4, x5
	 umulh x14, x4, x5
	 adcs x12, x12, x6
	 mul x7, x3, x5
	 umulh x6, x3, x5
	 adc x6, x6, xzr
	 adds x12, x12, x7
	 adcs x13, x13, x6
	 adc x14, x14, xzr
	 adds x9, x9, x9
	 adcs x10, x10, x10
	 adcs x11, x11, x11
	 adcs x12, x12, x12
	 adcs x13, x13, x13
	 adcs x14, x14, x14
	 cset x6, cs
	 umulh x7, x2, x2
	 mul x8, x2, x2
	 adds x9, x9, x7
	 mul x7, x3, x3
	 adcs x10, x10, x7
	 umulh x7, x3, x3
	 adcs x11, x11, x7
	 mul x7, x4, x4
	 adcs x12, x12, x7
	 umulh x7, x4, x4
	 adcs x13, x13, x7
	 mul x7, x5, x5
	 adcs x14, x14, x7
	 umulh x7, x5, x5
	 adc x6, x6, x7
	 mov x3, #0x26
	 mul x7, x3, x12
	 umulh x4, x3, x12
	 adds x8, x8, x7
	 mul x7, x3, x13
	 umulh x13, x3, x13
	 adcs x9, x9, x7
	 mul x7, x3, x14
	 umulh x14, x3, x14
	 adcs x10, x10, x7
	 mul x7, x3, x6
	 umulh x6, x3, x6
	 adcs x11, x11, x7
	 cset x12, cs
	 adds x11, x11, x14
	 adc x12, x12, x6
	 cmn x11, x11
	 bic x11, x11, #0x8000000000000000
	 adc x2, x12, x12
	 mov x3, #0x13
	 mul x7, x3, x2
	 adds x8, x8, x7
	 adcs x9, x9, x4
	 adcs x10, x10, x13
	 adc x11, x11, xzr
	 stp x8, x9, [sp, #(9*32)]
	 stp x10, x11, [sp, #(9*32)+16]
        ldp x3, x4, [sp, #(6*32)]
	 ldp x7, x8, [sp, #(7*32)]
	 adds x3, x3, x7
	 adcs x4, x4, x8
	 ldp x5, x6, [sp, #(6*32)+16]
	 ldp x7, x8, [sp, #(7*32)+16]
	 adcs x5, x5, x7
	 adcs x6, x6, x8
	 mov x9, #38
	 csel x9, x9, xzr, cs
	 adds x3, x3, x9
	 adcs x4, x4, xzr
	 adcs x5, x5, xzr
	 adc x6, x6, xzr
	 stp x3, x4, [sp, #(7*32)]
	 stp x5, x6, [sp, #(7*32)+16]
        ldp x2, x3, [sp, #(2*32)]
	 mul x9, x2, x3
	 umulh x10, x2, x3
	 ldp x4, x5, [sp, #(2*32)+16]
	 mul x11, x2, x5
	 umulh x12, x2, x5
	 mul x7, x2, x4
	 umulh x6, x2, x4
	 adds x10, x10, x7
	 adcs x11, x11, x6
	 mul x7, x3, x4
	 umulh x6, x3, x4
	 adc x6, x6, xzr
	 adds x11, x11, x7
	 mul x13, x4, x5
	 umulh x14, x4, x5
	 adcs x12, x12, x6
	 mul x7, x3, x5
	 umulh x6, x3, x5
	 adc x6, x6, xzr
	 adds x12, x12, x7
	 adcs x13, x13, x6
	 adc x14, x14, xzr
	 adds x9, x9, x9
	 adcs x10, x10, x10
	 adcs x11, x11, x11
	 adcs x12, x12, x12
	 adcs x13, x13, x13
	 adcs x14, x14, x14
	 cset x6, cs
	 umulh x7, x2, x2
	 mul x8, x2, x2
	 adds x9, x9, x7
	 mul x7, x3, x3
	 adcs x10, x10, x7
	 umulh x7, x3, x3
	 adcs x11, x11, x7
	 mul x7, x4, x4
	 adcs x12, x12, x7
	 umulh x7, x4, x4
	 adcs x13, x13, x7
	 mul x7, x5, x5
	 adcs x14, x14, x7
	 umulh x7, x5, x5
	 adc x6, x6, x7
	 mov x3, #0x26
	 mul x7, x3, x12
	 umulh x4, x3, x12
	 adds x8, x8, x7
	 mul x7, x3, x13
	 umulh x13, x3, x13
	 adcs x9, x9, x7
	 mul x7, x3, x14
	 umulh x14, x3, x14
	 adcs x10, x10, x7
	 mul x7, x3, x6
	 umulh x6, x3, x6
	 adcs x11, x11, x7
	 cset x12, cs
	 adds x11, x11, x14
	 adc x12, x12, x6
	 cmn x11, x11
	 bic x11, x11, #0x8000000000000000
	 adc x2, x12, x12
	 mov x3, #0x13
	 mul x7, x3, x2
	 adds x8, x8, x7
	 adcs x9, x9, x4
	 adcs x10, x10, x13
	 adc x11, x11, xzr
	 stp x8, x9, [sp, #(2*32)]
	 stp x10, x11, [sp, #(2*32)+16]



        ldp x5, x6, [sp, #(9*32)]
	 ldp x4, x3, [sp, #(8*32)]
	 subs x5, x5, x4
	 sbcs x6, x6, x3
	 ldp x7, x8, [sp, #(9*32)+16]
	 ldp x4, x3, [sp, #(8*32)+16]
	 sbcs x7, x7, x4
	 sbcs x8, x8, x3
	 mov x4, #38
	 csel x3, x4, xzr, lo
	 subs x5, x5, x3
	 sbcs x6, x6, xzr
	 sbcs x7, x7, xzr
	 sbc x8, x8, xzr
	 stp x5, x6, [sp, #(6*32)]
	 stp x7, x8, [sp, #(6*32)+16]



        ldp x2, x3, [sp, #(7*32)]
	 mul x9, x2, x3
	 umulh x10, x2, x3
	 ldp x4, x5, [sp, #(7*32)+16]
	 mul x11, x2, x5
	 umulh x12, x2, x5
	 mul x7, x2, x4
	 umulh x6, x2, x4
	 adds x10, x10, x7
	 adcs x11, x11, x6
	 mul x7, x3, x4
	 umulh x6, x3, x4
	 adc x6, x6, xzr
	 adds x11, x11, x7
	 mul x13, x4, x5
	 umulh x14, x4, x5
	 adcs x12, x12, x6
	 mul x7, x3, x5
	 umulh x6, x3, x5
	 adc x6, x6, xzr
	 adds x12, x12, x7
	 adcs x13, x13, x6
	 adc x14, x14, xzr
	 adds x9, x9, x9
	 adcs x10, x10, x10
	 adcs x11, x11, x11
	 adcs x12, x12, x12
	 adcs x13, x13, x13
	 adcs x14, x14, x14
	 cset x6, cs
	 umulh x7, x2, x2
	 mul x8, x2, x2
	 adds x9, x9, x7
	 mul x7, x3, x3
	 adcs x10, x10, x7
	 umulh x7, x3, x3
	 adcs x11, x11, x7
	 mul x7, x4, x4
	 adcs x12, x12, x7
	 umulh x7, x4, x4
	 adcs x13, x13, x7
	 mul x7, x5, x5
	 adcs x14, x14, x7
	 umulh x7, x5, x5
	 adc x6, x6, x7
	 mov x3, #0x26
	 mul x7, x3, x12
	 umulh x4, x3, x12
	 adds x8, x8, x7
	 mul x7, x3, x13
	 umulh x13, x3, x13
	 adcs x9, x9, x7
	 mul x7, x3, x14
	 umulh x14, x3, x14
	 adcs x10, x10, x7
	 mul x7, x3, x6
	 umulh x6, x3, x6
	 adcs x11, x11, x7
	 cset x12, cs
	 adds x11, x11, x14
	 adc x12, x12, x6
	 cmn x11, x11
	 bic x11, x11, #0x8000000000000000
	 adc x2, x12, x12
	 mov x3, #0x13
	 mul x7, x3, x2
	 adds x8, x8, x7
	 adcs x9, x9, x4
	 adcs x10, x10, x13
	 adc x11, x11, xzr
	 stp x8, x9, [sp, #(7*32)]
	 stp x10, x11, [sp, #(7*32)+16]



        mov x1, 0xdb42
        orr x1, x1, 0x10000
        ldp x7, x8, [sp, #(6*32)]
	 ldp x9, x10, [sp, #(6*32)+16]
	 mul x3, x1, x7
	 mul x4, x1, x8
	 mul x5, x1, x9
	 mul x6, x1, x10
	 umulh x7, x1, x7
	 umulh x8, x1, x8
	 umulh x9, x1, x9
	 umulh x10, x1, x10
	 adds x4, x4, x7
	 adcs x5, x5, x8
	 adcs x6, x6, x9
	 adc x10, x10, xzr
	 ldp x7, x8, [sp, #(8*32)]
	 adds x3, x3, x7
	 adcs x4, x4, x8
	 ldp x7, x8, [sp, #(8*32)+16]
	 adcs x5, x5, x7
	 adcs x6, x6, x8
	 adc x10, x10, xzr
	 cmn x6, x6
	 bic x6, x6, #0x8000000000000000
	 adc x8, x10, x10
	 mov x9, #19
	 mul x7, x8, x9
	 adds x3, x3, x7
	 adcs x4, x4, xzr
	 adcs x5, x5, xzr
	 adc x6, x6, xzr
	 stp x3, x4, [sp, #(5*32)]
	 stp x5, x6, [sp, #(5*32)+16]



        ldp x3, x4, [sp, #(9*32)]
	 ldp x7, x8, [sp, #(8*32)]
	 mul x12, x3, x7
	 umulh x13, x3, x7
	 mul x11, x3, x8
	 umulh x14, x3, x8
	 adds x13, x13, x11
	 ldp x9, x10, [sp, #(8*32)+16]
	 mul x11, x3, x9
	 umulh x15, x3, x9
	 adcs x14, x14, x11
	 mul x11, x3, x10
	 umulh x16, x3, x10
	 adcs x15, x15, x11
	 adc x16, x16, xzr
	 ldp x5, x6, [sp, #(9*32)+16]
	 mul x11, x4, x7
	 adds x13, x13, x11
	 mul x11, x4, x8
	 adcs x14, x14, x11
	 mul x11, x4, x9
	 adcs x15, x15, x11
	 mul x11, x4, x10
	 adcs x16, x16, x11
	 umulh x3, x4, x10
	 adc x3, x3, xzr
	 umulh x11, x4, x7
	 adds x14, x14, x11
	 umulh x11, x4, x8
	 adcs x15, x15, x11
	 umulh x11, x4, x9
	 adcs x16, x16, x11
	 adc x3, x3, xzr
	 mul x11, x5, x7
	 adds x14, x14, x11
	 mul x11, x5, x8
	 adcs x15, x15, x11
	 mul x11, x5, x9
	 adcs x16, x16, x11
	 mul x11, x5, x10
	 adcs x3, x3, x11
	 umulh x4, x5, x10
	 adc x4, x4, xzr
	 umulh x11, x5, x7
	 adds x15, x15, x11
	 umulh x11, x5, x8
	 adcs x16, x16, x11
	 umulh x11, x5, x9
	 adcs x3, x3, x11
	 adc x4, x4, xzr
	 mul x11, x6, x7
	 adds x15, x15, x11
	 mul x11, x6, x8
	 adcs x16, x16, x11
	 mul x11, x6, x9
	 adcs x3, x3, x11
	 mul x11, x6, x10
	 adcs x4, x4, x11
	 umulh x5, x6, x10
	 adc x5, x5, xzr
	 umulh x11, x6, x7
	 adds x16, x16, x11
	 umulh x11, x6, x8
	 adcs x3, x3, x11
	 umulh x11, x6, x9
	 adcs x4, x4, x11
	 adc x5, x5, xzr
	 mov x7, #0x26
	 mul x11, x7, x16
	 umulh x9, x7, x16
	 adds x12, x12, x11
	 mul x11, x7, x3
	 umulh x3, x7, x3
	 adcs x13, x13, x11
	 mul x11, x7, x4
	 umulh x4, x7, x4
	 adcs x14, x14, x11
	 mul x11, x7, x5
	 umulh x5, x7, x5
	 adcs x15, x15, x11
	 cset x16, cs
	 adds x15, x15, x4
	 adc x16, x16, x5
	 cmn x15, x15
	 bic x15, x15, #0x8000000000000000
	 adc x8, x16, x16
	 mov x7, #0x13
	 mul x11, x7, x8
	 adds x12, x12, x11
	 adcs x13, x13, x9
	 adcs x14, x14, x3
	 adc x15, x15, xzr
	 stp x12, x13, [sp, #(9*32)]
	 stp x14, x15, [sp, #(9*32)+16]



        ldp x3, x4, [sp, #(2*32)]
	 ldp x7, x8, [sp, #(1*32)]
	 mul x12, x3, x7
	 umulh x13, x3, x7
	 mul x11, x3, x8
	 umulh x14, x3, x8
	 adds x13, x13, x11
	 ldp x9, x10, [sp, #(1*32)+16]
	 mul x11, x3, x9
	 umulh x15, x3, x9
	 adcs x14, x14, x11
	 mul x11, x3, x10
	 umulh x16, x3, x10
	 adcs x15, x15, x11
	 adc x16, x16, xzr
	 ldp x5, x6, [sp, #(2*32)+16]
	 mul x11, x4, x7
	 adds x13, x13, x11
	 mul x11, x4, x8
	 adcs x14, x14, x11
	 mul x11, x4, x9
	 adcs x15, x15, x11
	 mul x11, x4, x10
	 adcs x16, x16, x11
	 umulh x3, x4, x10
	 adc x3, x3, xzr
	 umulh x11, x4, x7
	 adds x14, x14, x11
	 umulh x11, x4, x8
	 adcs x15, x15, x11
	 umulh x11, x4, x9
	 adcs x16, x16, x11
	 adc x3, x3, xzr
	 mul x11, x5, x7
	 adds x14, x14, x11
	 mul x11, x5, x8
	 adcs x15, x15, x11
	 mul x11, x5, x9
	 adcs x16, x16, x11
	 mul x11, x5, x10
	 adcs x3, x3, x11
	 umulh x4, x5, x10
	 adc x4, x4, xzr
	 umulh x11, x5, x7
	 adds x15, x15, x11
	 umulh x11, x5, x8
	 adcs x16, x16, x11
	 umulh x11, x5, x9
	 adcs x3, x3, x11
	 adc x4, x4, xzr
	 mul x11, x6, x7
	 adds x15, x15, x11
	 mul x11, x6, x8
	 adcs x16, x16, x11
	 mul x11, x6, x9
	 adcs x3, x3, x11
	 mul x11, x6, x10
	 adcs x4, x4, x11
	 umulh x5, x6, x10
	 adc x5, x5, xzr
	 umulh x11, x6, x7
	 adds x16, x16, x11
	 umulh x11, x6, x8
	 adcs x3, x3, x11
	 umulh x11, x6, x9
	 adcs x4, x4, x11
	 adc x5, x5, xzr
	 mov x7, #0x26
	 mul x11, x7, x16
	 umulh x9, x7, x16
	 adds x12, x12, x11
	 mul x11, x7, x3
	 umulh x3, x7, x3
	 adcs x13, x13, x11
	 mul x11, x7, x4
	 umulh x4, x7, x4
	 adcs x14, x14, x11
	 mul x11, x7, x5
	 umulh x5, x7, x5
	 adcs x15, x15, x11
	 cset x16, cs
	 adds x15, x15, x4
	 adc x16, x16, x5
	 cmn x15, x15
	 bic x15, x15, #0x8000000000000000
	 adc x8, x16, x16
	 mov x7, #0x13
	 mul x11, x7, x8
	 adds x12, x12, x11
	 adcs x13, x13, x9
	 adcs x14, x14, x3
	 adc x15, x15, xzr
	 stp x12, x13, [sp, #(2*32)]
	 stp x14, x15, [sp, #(2*32)+16]




        ldp x3, x4, [sp, #(6*32)]
	 ldp x7, x8, [sp, #(5*32)]
	 mul x12, x3, x7
	 umulh x13, x3, x7
	 mul x11, x3, x8
	 umulh x14, x3, x8
	 adds x13, x13, x11
	 ldp x9, x10, [sp, #(5*32)+16]
	 mul x11, x3, x9
	 umulh x15, x3, x9
	 adcs x14, x14, x11
	 mul x11, x3, x10
	 umulh x16, x3, x10
	 adcs x15, x15, x11
	 adc x16, x16, xzr
	 ldp x5, x6, [sp, #(6*32)+16]
	 mul x11, x4, x7
	 adds x13, x13, x11
	 mul x11, x4, x8
	 adcs x14, x14, x11
	 mul x11, x4, x9
	 adcs x15, x15, x11
	 mul x11, x4, x10
	 adcs x16, x16, x11
	 umulh x3, x4, x10
	 adc x3, x3, xzr
	 umulh x11, x4, x7
	 adds x14, x14, x11
	 umulh x11, x4, x8
	 adcs x15, x15, x11
	 umulh x11, x4, x9
	 adcs x16, x16, x11
	 adc x3, x3, xzr
	 mul x11, x5, x7
	 adds x14, x14, x11
	 mul x11, x5, x8
	 adcs x15, x15, x11
	 mul x11, x5, x9
	 adcs x16, x16, x11
	 mul x11, x5, x10
	 adcs x3, x3, x11
	 umulh x4, x5, x10
	 adc x4, x4, xzr
	 umulh x11, x5, x7
	 adds x15, x15, x11
	 umulh x11, x5, x8
	 adcs x16, x16, x11
	 umulh x11, x5, x9
	 adcs x3, x3, x11
	 adc x4, x4, xzr
	 mul x11, x6, x7
	 adds x15, x15, x11
	 mul x11, x6, x8
	 adcs x16, x16, x11
	 mul x11, x6, x9
	 adcs x3, x3, x11
	 mul x11, x6, x10
	 adcs x4, x4, x11
	 umulh x5, x6, x10
	 adc x5, x5, xzr
	 umulh x11, x6, x7
	 adds x16, x16, x11
	 umulh x11, x6, x8
	 adcs x3, x3, x11
	 umulh x11, x6, x9
	 adcs x4, x4, x11
	 adc x5, x5, xzr
	 mov x7, #0x26
	 mul x11, x7, x16
	 umulh x9, x7, x16
	 adds x12, x12, x11
	 mul x11, x7, x3
	 umulh x3, x7, x3
	 adcs x13, x13, x11
	 mul x11, x7, x4
	 umulh x4, x7, x4
	 adcs x14, x14, x11
	 mul x11, x7, x5
	 umulh x5, x7, x5
	 adcs x15, x15, x11
	 cset x16, cs
	 adds x15, x15, x4
	 adc x16, x16, x5
	 cmn x15, x15
	 bic x15, x15, #0x8000000000000000
	 adc x8, x16, x16
	 mov x7, #0x13
	 mul x11, x7, x8
	 adds x12, x12, x11
	 adcs x13, x13, x9
	 adcs x14, x14, x3
	 adc x15, x15, xzr
	 stp x12, x13, [sp, #(5*32)]
	 stp x14, x15, [sp, #(5*32)+16]



        sub x20, x20, #1
        cmp x20, #3
        bcs curve25519_x25519_byte_alt_scalarloop





        cmp x21, xzr
        ldp x0, x1, [sp, #(7*32)]
	 ldp x2, x3, [sp, #(9*32)]
	 csel x0, x0, x2, ne
	 csel x1, x1, x3, ne
	 stp x0, x1, [sp, #(9*32)]
	 ldp x0, x1, [sp, #(7*32)+16]
	 ldp x2, x3, [sp, #(9*32)+16]
	 csel x0, x0, x2, ne
	 csel x1, x1, x3, ne
	 stp x0, x1, [sp, #(9*32)+16]
        ldp x0, x1, [sp, #(2*32)]
	 ldp x2, x3, [sp, #(5*32)]
	 csel x0, x0, x2, ne
	 csel x1, x1, x3, ne
	 stp x0, x1, [sp, #(5*32)]
	 ldp x0, x1, [sp, #(2*32)+16]
	 ldp x2, x3, [sp, #(5*32)+16]
	 csel x0, x0, x2, ne
	 csel x1, x1, x3, ne
	 stp x0, x1, [sp, #(5*32)+16]

        ldp x5, x6, [sp, #(9*32)]
	 ldp x4, x3, [sp, #(5*32)]
	 subs x5, x5, x4
	 sbcs x6, x6, x3
	 ldp x7, x8, [sp, #(9*32)+16]
	 ldp x4, x3, [sp, #(5*32)+16]
	 sbcs x7, x7, x4
	 sbcs x8, x8, x3
	 mov x4, #38
	 csel x3, x4, xzr, lo
	 subs x5, x5, x3
	 sbcs x6, x6, xzr
	 sbcs x7, x7, xzr
	 sbc x8, x8, xzr
	 stp x5, x6, [sp, #(8*32)]
	 stp x7, x8, [sp, #(8*32)+16]
        ldp x3, x4, [sp, #(9*32)]
	 ldp x7, x8, [sp, #(5*32)]
	 adds x3, x3, x7
	 adcs x4, x4, x8
	 ldp x5, x6, [sp, #(9*32)+16]
	 ldp x7, x8, [sp, #(5*32)+16]
	 adcs x5, x5, x7
	 adcs x6, x6, x8
	 mov x9, #38
	 csel x9, x9, xzr, cs
	 adds x3, x3, x9
	 adcs x4, x4, xzr
	 adcs x5, x5, xzr
	 adc x6, x6, xzr
	 stp x3, x4, [sp, #(9*32)]
	 stp x5, x6, [sp, #(9*32)+16]
        ldp x2, x3, [sp, #(8*32)]
	 mul x9, x2, x3
	 umulh x10, x2, x3
	 ldp x4, x5, [sp, #(8*32)+16]
	 mul x11, x2, x5
	 umulh x12, x2, x5
	 mul x7, x2, x4
	 umulh x6, x2, x4
	 adds x10, x10, x7
	 adcs x11, x11, x6
	 mul x7, x3, x4
	 umulh x6, x3, x4
	 adc x6, x6, xzr
	 adds x11, x11, x7
	 mul x13, x4, x5
	 umulh x14, x4, x5
	 adcs x12, x12, x6
	 mul x7, x3, x5
	 umulh x6, x3, x5
	 adc x6, x6, xzr
	 adds x12, x12, x7
	 adcs x13, x13, x6
	 adc x14, x14, xzr
	 adds x9, x9, x9
	 adcs x10, x10, x10
	 adcs x11, x11, x11
	 adcs x12, x12, x12
	 adcs x13, x13, x13
	 adcs x14, x14, x14
	 cset x6, cs
	 umulh x7, x2, x2
	 mul x8, x2, x2
	 adds x9, x9, x7
	 mul x7, x3, x3
	 adcs x10, x10, x7
	 umulh x7, x3, x3
	 adcs x11, x11, x7
	 mul x7, x4, x4
	 adcs x12, x12, x7
	 umulh x7, x4, x4
	 adcs x13, x13, x7
	 mul x7, x5, x5
	 adcs x14, x14, x7
	 umulh x7, x5, x5
	 adc x6, x6, x7
	 mov x3, #0x26
	 mul x7, x3, x12
	 umulh x4, x3, x12
	 adds x8, x8, x7
	 mul x7, x3, x13
	 umulh x13, x3, x13
	 adcs x9, x9, x7
	 mul x7, x3, x14
	 umulh x14, x3, x14
	 adcs x10, x10, x7
	 mul x7, x3, x6
	 umulh x6, x3, x6
	 adcs x11, x11, x7
	 cset x12, cs
	 adds x11, x11, x14
	 adc x12, x12, x6
	 cmn x11, x11
	 bic x11, x11, #0x8000000000000000
	 adc x2, x12, x12
	 mov x3, #0x13
	 mul x7, x3, x2
	 adds x8, x8, x7
	 adcs x9, x9, x4
	 adcs x10, x10, x13
	 adc x11, x11, xzr
	 stp x8, x9, [sp, #(8*32)]
	 stp x10, x11, [sp, #(8*32)+16]
        ldp x2, x3, [sp, #(9*32)]
	 mul x9, x2, x3
	 umulh x10, x2, x3
	 ldp x4, x5, [sp, #(9*32)+16]
	 mul x11, x2, x5
	 umulh x12, x2, x5
	 mul x7, x2, x4
	 umulh x6, x2, x4
	 adds x10, x10, x7
	 adcs x11, x11, x6
	 mul x7, x3, x4
	 umulh x6, x3, x4
	 adc x6, x6, xzr
	 adds x11, x11, x7
	 mul x13, x4, x5
	 umulh x14, x4, x5
	 adcs x12, x12, x6
	 mul x7, x3, x5
	 umulh x6, x3, x5
	 adc x6, x6, xzr
	 adds x12, x12, x7
	 adcs x13, x13, x6
	 adc x14, x14, xzr
	 adds x9, x9, x9
	 adcs x10, x10, x10
	 adcs x11, x11, x11
	 adcs x12, x12, x12
	 adcs x13, x13, x13
	 adcs x14, x14, x14
	 cset x6, cs
	 umulh x7, x2, x2
	 mul x8, x2, x2
	 adds x9, x9, x7
	 mul x7, x3, x3
	 adcs x10, x10, x7
	 umulh x7, x3, x3
	 adcs x11, x11, x7
	 mul x7, x4, x4
	 adcs x12, x12, x7
	 umulh x7, x4, x4
	 adcs x13, x13, x7
	 mul x7, x5, x5
	 adcs x14, x14, x7
	 umulh x7, x5, x5
	 adc x6, x6, x7
	 mov x3, #0x26
	 mul x7, x3, x12
	 umulh x4, x3, x12
	 adds x8, x8, x7
	 mul x7, x3, x13
	 umulh x13, x3, x13
	 adcs x9, x9, x7
	 mul x7, x3, x14
	 umulh x14, x3, x14
	 adcs x10, x10, x7
	 mul x7, x3, x6
	 umulh x6, x3, x6
	 adcs x11, x11, x7
	 cset x12, cs
	 adds x11, x11, x14
	 adc x12, x12, x6
	 cmn x11, x11
	 bic x11, x11, #0x8000000000000000
	 adc x2, x12, x12
	 mov x3, #0x13
	 mul x7, x3, x2
	 adds x8, x8, x7
	 adcs x9, x9, x4
	 adcs x10, x10, x13
	 adc x11, x11, xzr
	 stp x8, x9, [sp, #(9*32)]
	 stp x10, x11, [sp, #(9*32)+16]
        ldp x5, x6, [sp, #(9*32)]
	 ldp x4, x3, [sp, #(8*32)]
	 subs x5, x5, x4
	 sbcs x6, x6, x3
	 ldp x7, x8, [sp, #(9*32)+16]
	 ldp x4, x3, [sp, #(8*32)+16]
	 sbcs x7, x7, x4
	 sbcs x8, x8, x3
	 mov x4, #38
	 csel x3, x4, xzr, lo
	 subs x5, x5, x3
	 sbcs x6, x6, xzr
	 sbcs x7, x7, xzr
	 sbc x8, x8, xzr
	 stp x5, x6, [sp, #(6*32)]
	 stp x7, x8, [sp, #(6*32)+16]
        mov x1, 0xdb42
        orr x1, x1, 0x10000
        ldp x7, x8, [sp, #(6*32)]
	 ldp x9, x10, [sp, #(6*32)+16]
	 mul x3, x1, x7
	 mul x4, x1, x8
	 mul x5, x1, x9
	 mul x6, x1, x10
	 umulh x7, x1, x7
	 umulh x8, x1, x8
	 umulh x9, x1, x9
	 umulh x10, x1, x10
	 adds x4, x4, x7
	 adcs x5, x5, x8
	 adcs x6, x6, x9
	 adc x10, x10, xzr
	 ldp x7, x8, [sp, #(8*32)]
	 adds x3, x3, x7
	 adcs x4, x4, x8
	 ldp x7, x8, [sp, #(8*32)+16]
	 adcs x5, x5, x7
	 adcs x6, x6, x8
	 adc x10, x10, xzr
	 cmn x6, x6
	 bic x6, x6, #0x8000000000000000
	 adc x8, x10, x10
	 mov x9, #19
	 mul x7, x8, x9
	 adds x3, x3, x7
	 adcs x4, x4, xzr
	 adcs x5, x5, xzr
	 adc x6, x6, xzr
	 stp x3, x4, [sp, #(5*32)]
	 stp x5, x6, [sp, #(5*32)+16]
        ldp x3, x4, [sp, #(9*32)]
	 ldp x7, x8, [sp, #(8*32)]
	 mul x12, x3, x7
	 umulh x13, x3, x7
	 mul x11, x3, x8
	 umulh x14, x3, x8
	 adds x13, x13, x11
	 ldp x9, x10, [sp, #(8*32)+16]
	 mul x11, x3, x9
	 umulh x15, x3, x9
	 adcs x14, x14, x11
	 mul x11, x3, x10
	 umulh x16, x3, x10
	 adcs x15, x15, x11
	 adc x16, x16, xzr
	 ldp x5, x6, [sp, #(9*32)+16]
	 mul x11, x4, x7
	 adds x13, x13, x11
	 mul x11, x4, x8
	 adcs x14, x14, x11
	 mul x11, x4, x9
	 adcs x15, x15, x11
	 mul x11, x4, x10
	 adcs x16, x16, x11
	 umulh x3, x4, x10
	 adc x3, x3, xzr
	 umulh x11, x4, x7
	 adds x14, x14, x11
	 umulh x11, x4, x8
	 adcs x15, x15, x11
	 umulh x11, x4, x9
	 adcs x16, x16, x11
	 adc x3, x3, xzr
	 mul x11, x5, x7
	 adds x14, x14, x11
	 mul x11, x5, x8
	 adcs x15, x15, x11
	 mul x11, x5, x9
	 adcs x16, x16, x11
	 mul x11, x5, x10
	 adcs x3, x3, x11
	 umulh x4, x5, x10
	 adc x4, x4, xzr
	 umulh x11, x5, x7
	 adds x15, x15, x11
	 umulh x11, x5, x8
	 adcs x16, x16, x11
	 umulh x11, x5, x9
	 adcs x3, x3, x11
	 adc x4, x4, xzr
	 mul x11, x6, x7
	 adds x15, x15, x11
	 mul x11, x6, x8
	 adcs x16, x16, x11
	 mul x11, x6, x9
	 adcs x3, x3, x11
	 mul x11, x6, x10
	 adcs x4, x4, x11
	 umulh x5, x6, x10
	 adc x5, x5, xzr
	 umulh x11, x6, x7
	 adds x16, x16, x11
	 umulh x11, x6, x8
	 adcs x3, x3, x11
	 umulh x11, x6, x9
	 adcs x4, x4, x11
	 adc x5, x5, xzr
	 mov x7, #0x26
	 mul x11, x7, x16
	 umulh x9, x7, x16
	 adds x12, x12, x11
	 mul x11, x7, x3
	 umulh x3, x7, x3
	 adcs x13, x13, x11
	 mul x11, x7, x4
	 umulh x4, x7, x4
	 adcs x14, x14, x11
	 mul x11, x7, x5
	 umulh x5, x7, x5
	 adcs x15, x15, x11
	 cset x16, cs
	 adds x15, x15, x4
	 adc x16, x16, x5
	 cmn x15, x15
	 bic x15, x15, #0x8000000000000000
	 adc x8, x16, x16
	 mov x7, #0x13
	 mul x11, x7, x8
	 adds x12, x12, x11
	 adcs x13, x13, x9
	 adcs x14, x14, x3
	 adc x15, x15, xzr
	 stp x12, x13, [sp, #(9*32)]
	 stp x14, x15, [sp, #(9*32)+16]
        ldp x3, x4, [sp, #(6*32)]
	 ldp x7, x8, [sp, #(5*32)]
	 mul x12, x3, x7
	 umulh x13, x3, x7
	 mul x11, x3, x8
	 umulh x14, x3, x8
	 adds x13, x13, x11
	 ldp x9, x10, [sp, #(5*32)+16]
	 mul x11, x3, x9
	 umulh x15, x3, x9
	 adcs x14, x14, x11
	 mul x11, x3, x10
	 umulh x16, x3, x10
	 adcs x15, x15, x11
	 adc x16, x16, xzr
	 ldp x5, x6, [sp, #(6*32)+16]
	 mul x11, x4, x7
	 adds x13, x13, x11
	 mul x11, x4, x8
	 adcs x14, x14, x11
	 mul x11, x4, x9
	 adcs x15, x15, x11
	 mul x11, x4, x10
	 adcs x16, x16, x11
	 umulh x3, x4, x10
	 adc x3, x3, xzr
	 umulh x11, x4, x7
	 adds x14, x14, x11
	 umulh x11, x4, x8
	 adcs x15, x15, x11
	 umulh x11, x4, x9
	 adcs x16, x16, x11
	 adc x3, x3, xzr
	 mul x11, x5, x7
	 adds x14, x14, x11
	 mul x11, x5, x8
	 adcs x15, x15, x11
	 mul x11, x5, x9
	 adcs x16, x16, x11
	 mul x11, x5, x10
	 adcs x3, x3, x11
	 umulh x4, x5, x10
	 adc x4, x4, xzr
	 umulh x11, x5, x7
	 adds x15, x15, x11
	 umulh x11, x5, x8
	 adcs x16, x16, x11
	 umulh x11, x5, x9
	 adcs x3, x3, x11
	 adc x4, x4, xzr
	 mul x11, x6, x7
	 adds x15, x15, x11
	 mul x11, x6, x8
	 adcs x16, x16, x11
	 mul x11, x6, x9
	 adcs x3, x3, x11
	 mul x11, x6, x10
	 adcs x4, x4, x11
	 umulh x5, x6, x10
	 adc x5, x5, xzr
	 umulh x11, x6, x7
	 adds x16, x16, x11
	 umulh x11, x6, x8
	 adcs x3, x3, x11
	 umulh x11, x6, x9
	 adcs x4, x4, x11
	 adc x5, x5, xzr
	 mov x7, #0x26
	 mul x11, x7, x16
	 umulh x9, x7, x16
	 adds x12, x12, x11
	 mul x11, x7, x3
	 umulh x3, x7, x3
	 adcs x13, x13, x11
	 mul x11, x7, x4
	 umulh x4, x7, x4
	 adcs x14, x14, x11
	 mul x11, x7, x5
	 umulh x5, x7, x5
	 adcs x15, x15, x11
	 cset x16, cs
	 adds x15, x15, x4
	 adc x16, x16, x5
	 cmn x15, x15
	 bic x15, x15, #0x8000000000000000
	 adc x8, x16, x16
	 mov x7, #0x13
	 mul x11, x7, x8
	 adds x12, x12, x11
	 adcs x13, x13, x9
	 adcs x14, x14, x3
	 adc x15, x15, xzr
	 stp x12, x13, [sp, #(5*32)]
	 stp x14, x15, [sp, #(5*32)+16]

        ldp x5, x6, [sp, #(9*32)]
	 ldp x4, x3, [sp, #(5*32)]
	 subs x5, x5, x4
	 sbcs x6, x6, x3
	 ldp x7, x8, [sp, #(9*32)+16]
	 ldp x4, x3, [sp, #(5*32)+16]
	 sbcs x7, x7, x4
	 sbcs x8, x8, x3
	 mov x4, #38
	 csel x3, x4, xzr, lo
	 subs x5, x5, x3
	 sbcs x6, x6, xzr
	 sbcs x7, x7, xzr
	 sbc x8, x8, xzr
	 stp x5, x6, [sp, #(8*32)]
	 stp x7, x8, [sp, #(8*32)+16]
        ldp x3, x4, [sp, #(9*32)]
	 ldp x7, x8, [sp, #(5*32)]
	 adds x3, x3, x7
	 adcs x4, x4, x8
	 ldp x5, x6, [sp, #(9*32)+16]
	 ldp x7, x8, [sp, #(5*32)+16]
	 adcs x5, x5, x7
	 adcs x6, x6, x8
	 mov x9, #38
	 csel x9, x9, xzr, cs
	 adds x3, x3, x9
	 adcs x4, x4, xzr
	 adcs x5, x5, xzr
	 adc x6, x6, xzr
	 stp x3, x4, [sp, #(9*32)]
	 stp x5, x6, [sp, #(9*32)+16]
        ldp x2, x3, [sp, #(8*32)]
	 mul x9, x2, x3
	 umulh x10, x2, x3
	 ldp x4, x5, [sp, #(8*32)+16]
	 mul x11, x2, x5
	 umulh x12, x2, x5
	 mul x7, x2, x4
	 umulh x6, x2, x4
	 adds x10, x10, x7
	 adcs x11, x11, x6
	 mul x7, x3, x4
	 umulh x6, x3, x4
	 adc x6, x6, xzr
	 adds x11, x11, x7
	 mul x13, x4, x5
	 umulh x14, x4, x5
	 adcs x12, x12, x6
	 mul x7, x3, x5
	 umulh x6, x3, x5
	 adc x6, x6, xzr
	 adds x12, x12, x7
	 adcs x13, x13, x6
	 adc x14, x14, xzr
	 adds x9, x9, x9
	 adcs x10, x10, x10
	 adcs x11, x11, x11
	 adcs x12, x12, x12
	 adcs x13, x13, x13
	 adcs x14, x14, x14
	 cset x6, cs
	 umulh x7, x2, x2
	 mul x8, x2, x2
	 adds x9, x9, x7
	 mul x7, x3, x3
	 adcs x10, x10, x7
	 umulh x7, x3, x3
	 adcs x11, x11, x7
	 mul x7, x4, x4
	 adcs x12, x12, x7
	 umulh x7, x4, x4
	 adcs x13, x13, x7
	 mul x7, x5, x5
	 adcs x14, x14, x7
	 umulh x7, x5, x5
	 adc x6, x6, x7
	 mov x3, #0x26
	 mul x7, x3, x12
	 umulh x4, x3, x12
	 adds x8, x8, x7
	 mul x7, x3, x13
	 umulh x13, x3, x13
	 adcs x9, x9, x7
	 mul x7, x3, x14
	 umulh x14, x3, x14
	 adcs x10, x10, x7
	 mul x7, x3, x6
	 umulh x6, x3, x6
	 adcs x11, x11, x7
	 cset x12, cs
	 adds x11, x11, x14
	 adc x12, x12, x6
	 cmn x11, x11
	 bic x11, x11, #0x8000000000000000
	 adc x2, x12, x12
	 mov x3, #0x13
	 mul x7, x3, x2
	 adds x8, x8, x7
	 adcs x9, x9, x4
	 adcs x10, x10, x13
	 adc x11, x11, xzr
	 stp x8, x9, [sp, #(8*32)]
	 stp x10, x11, [sp, #(8*32)+16]
        ldp x2, x3, [sp, #(9*32)]
	 mul x9, x2, x3
	 umulh x10, x2, x3
	 ldp x4, x5, [sp, #(9*32)+16]
	 mul x11, x2, x5
	 umulh x12, x2, x5
	 mul x7, x2, x4
	 umulh x6, x2, x4
	 adds x10, x10, x7
	 adcs x11, x11, x6
	 mul x7, x3, x4
	 umulh x6, x3, x4
	 adc x6, x6, xzr
	 adds x11, x11, x7
	 mul x13, x4, x5
	 umulh x14, x4, x5
	 adcs x12, x12, x6
	 mul x7, x3, x5
	 umulh x6, x3, x5
	 adc x6, x6, xzr
	 adds x12, x12, x7
	 adcs x13, x13, x6
	 adc x14, x14, xzr
	 adds x9, x9, x9
	 adcs x10, x10, x10
	 adcs x11, x11, x11
	 adcs x12, x12, x12
	 adcs x13, x13, x13
	 adcs x14, x14, x14
	 cset x6, cs
	 umulh x7, x2, x2
	 mul x8, x2, x2
	 adds x9, x9, x7
	 mul x7, x3, x3
	 adcs x10, x10, x7
	 umulh x7, x3, x3
	 adcs x11, x11, x7
	 mul x7, x4, x4
	 adcs x12, x12, x7
	 umulh x7, x4, x4
	 adcs x13, x13, x7
	 mul x7, x5, x5
	 adcs x14, x14, x7
	 umulh x7, x5, x5
	 adc x6, x6, x7
	 mov x3, #0x26
	 mul x7, x3, x12
	 umulh x4, x3, x12
	 adds x8, x8, x7
	 mul x7, x3, x13
	 umulh x13, x3, x13
	 adcs x9, x9, x7
	 mul x7, x3, x14
	 umulh x14, x3, x14
	 adcs x10, x10, x7
	 mul x7, x3, x6
	 umulh x6, x3, x6
	 adcs x11, x11, x7
	 cset x12, cs
	 adds x11, x11, x14
	 adc x12, x12, x6
	 cmn x11, x11
	 bic x11, x11, #0x8000000000000000
	 adc x2, x12, x12
	 mov x3, #0x13
	 mul x7, x3, x2
	 adds x8, x8, x7
	 adcs x9, x9, x4
	 adcs x10, x10, x13
	 adc x11, x11, xzr
	 stp x8, x9, [sp, #(9*32)]
	 stp x10, x11, [sp, #(9*32)+16]
        ldp x5, x6, [sp, #(9*32)]
	 ldp x4, x3, [sp, #(8*32)]
	 subs x5, x5, x4
	 sbcs x6, x6, x3
	 ldp x7, x8, [sp, #(9*32)+16]
	 ldp x4, x3, [sp, #(8*32)+16]
	 sbcs x7, x7, x4
	 sbcs x8, x8, x3
	 mov x4, #38
	 csel x3, x4, xzr, lo
	 subs x5, x5, x3
	 sbcs x6, x6, xzr
	 sbcs x7, x7, xzr
	 sbc x8, x8, xzr
	 stp x5, x6, [sp, #(6*32)]
	 stp x7, x8, [sp, #(6*32)+16]
        mov x1, 0xdb42
        orr x1, x1, 0x10000
        ldp x7, x8, [sp, #(6*32)]
	 ldp x9, x10, [sp, #(6*32)+16]
	 mul x3, x1, x7
	 mul x4, x1, x8
	 mul x5, x1, x9
	 mul x6, x1, x10
	 umulh x7, x1, x7
	 umulh x8, x1, x8
	 umulh x9, x1, x9
	 umulh x10, x1, x10
	 adds x4, x4, x7
	 adcs x5, x5, x8
	 adcs x6, x6, x9
	 adc x10, x10, xzr
	 ldp x7, x8, [sp, #(8*32)]
	 adds x3, x3, x7
	 adcs x4, x4, x8
	 ldp x7, x8, [sp, #(8*32)+16]
	 adcs x5, x5, x7
	 adcs x6, x6, x8
	 adc x10, x10, xzr
	 cmn x6, x6
	 bic x6, x6, #0x8000000000000000
	 adc x8, x10, x10
	 mov x9, #19
	 mul x7, x8, x9
	 adds x3, x3, x7
	 adcs x4, x4, xzr
	 adcs x5, x5, xzr
	 adc x6, x6, xzr
	 stp x3, x4, [sp, #(5*32)]
	 stp x5, x6, [sp, #(5*32)+16]
        ldp x3, x4, [sp, #(9*32)]
	 ldp x7, x8, [sp, #(8*32)]
	 mul x12, x3, x7
	 umulh x13, x3, x7
	 mul x11, x3, x8
	 umulh x14, x3, x8
	 adds x13, x13, x11
	 ldp x9, x10, [sp, #(8*32)+16]
	 mul x11, x3, x9
	 umulh x15, x3, x9
	 adcs x14, x14, x11
	 mul x11, x3, x10
	 umulh x16, x3, x10
	 adcs x15, x15, x11
	 adc x16, x16, xzr
	 ldp x5, x6, [sp, #(9*32)+16]
	 mul x11, x4, x7
	 adds x13, x13, x11
	 mul x11, x4, x8
	 adcs x14, x14, x11
	 mul x11, x4, x9
	 adcs x15, x15, x11
	 mul x11, x4, x10
	 adcs x16, x16, x11
	 umulh x3, x4, x10
	 adc x3, x3, xzr
	 umulh x11, x4, x7
	 adds x14, x14, x11
	 umulh x11, x4, x8
	 adcs x15, x15, x11
	 umulh x11, x4, x9
	 adcs x16, x16, x11
	 adc x3, x3, xzr
	 mul x11, x5, x7
	 adds x14, x14, x11
	 mul x11, x5, x8
	 adcs x15, x15, x11
	 mul x11, x5, x9
	 adcs x16, x16, x11
	 mul x11, x5, x10
	 adcs x3, x3, x11
	 umulh x4, x5, x10
	 adc x4, x4, xzr
	 umulh x11, x5, x7
	 adds x15, x15, x11
	 umulh x11, x5, x8
	 adcs x16, x16, x11
	 umulh x11, x5, x9
	 adcs x3, x3, x11
	 adc x4, x4, xzr
	 mul x11, x6, x7
	 adds x15, x15, x11
	 mul x11, x6, x8
	 adcs x16, x16, x11
	 mul x11, x6, x9
	 adcs x3, x3, x11
	 mul x11, x6, x10
	 adcs x4, x4, x11
	 umulh x5, x6, x10
	 adc x5, x5, xzr
	 umulh x11, x6, x7
	 adds x16, x16, x11
	 umulh x11, x6, x8
	 adcs x3, x3, x11
	 umulh x11, x6, x9
	 adcs x4, x4, x11
	 adc x5, x5, xzr
	 mov x7, #0x26
	 mul x11, x7, x16
	 umulh x9, x7, x16
	 adds x12, x12, x11
	 mul x11, x7, x3
	 umulh x3, x7, x3
	 adcs x13, x13, x11
	 mul x11, x7, x4
	 umulh x4, x7, x4
	 adcs x14, x14, x11
	 mul x11, x7, x5
	 umulh x5, x7, x5
	 adcs x15, x15, x11
	 cset x16, cs
	 adds x15, x15, x4
	 adc x16, x16, x5
	 cmn x15, x15
	 bic x15, x15, #0x8000000000000000
	 adc x8, x16, x16
	 mov x7, #0x13
	 mul x11, x7, x8
	 adds x12, x12, x11
	 adcs x13, x13, x9
	 adcs x14, x14, x3
	 adc x15, x15, xzr
	 stp x12, x13, [sp, #(9*32)]
	 stp x14, x15, [sp, #(9*32)+16]
        ldp x3, x4, [sp, #(6*32)]
	 ldp x7, x8, [sp, #(5*32)]
	 mul x12, x3, x7
	 umulh x13, x3, x7
	 mul x11, x3, x8
	 umulh x14, x3, x8
	 adds x13, x13, x11
	 ldp x9, x10, [sp, #(5*32)+16]
	 mul x11, x3, x9
	 umulh x15, x3, x9
	 adcs x14, x14, x11
	 mul x11, x3, x10
	 umulh x16, x3, x10
	 adcs x15, x15, x11
	 adc x16, x16, xzr
	 ldp x5, x6, [sp, #(6*32)+16]
	 mul x11, x4, x7
	 adds x13, x13, x11
	 mul x11, x4, x8
	 adcs x14, x14, x11
	 mul x11, x4, x9
	 adcs x15, x15, x11
	 mul x11, x4, x10
	 adcs x16, x16, x11
	 umulh x3, x4, x10
	 adc x3, x3, xzr
	 umulh x11, x4, x7
	 adds x14, x14, x11
	 umulh x11, x4, x8
	 adcs x15, x15, x11
	 umulh x11, x4, x9
	 adcs x16, x16, x11
	 adc x3, x3, xzr
	 mul x11, x5, x7
	 adds x14, x14, x11
	 mul x11, x5, x8
	 adcs x15, x15, x11
	 mul x11, x5, x9
	 adcs x16, x16, x11
	 mul x11, x5, x10
	 adcs x3, x3, x11
	 umulh x4, x5, x10
	 adc x4, x4, xzr
	 umulh x11, x5, x7
	 adds x15, x15, x11
	 umulh x11, x5, x8
	 adcs x16, x16, x11
	 umulh x11, x5, x9
	 adcs x3, x3, x11
	 adc x4, x4, xzr
	 mul x11, x6, x7
	 adds x15, x15, x11
	 mul x11, x6, x8
	 adcs x16, x16, x11
	 mul x11, x6, x9
	 adcs x3, x3, x11
	 mul x11, x6, x10
	 adcs x4, x4, x11
	 umulh x5, x6, x10
	 adc x5, x5, xzr
	 umulh x11, x6, x7
	 adds x16, x16, x11
	 umulh x11, x6, x8
	 adcs x3, x3, x11
	 umulh x11, x6, x9
	 adcs x4, x4, x11
	 adc x5, x5, xzr
	 mov x7, #0x26
	 mul x11, x7, x16
	 umulh x9, x7, x16
	 adds x12, x12, x11
	 mul x11, x7, x3
	 umulh x3, x7, x3
	 adcs x13, x13, x11
	 mul x11, x7, x4
	 umulh x4, x7, x4
	 adcs x14, x14, x11
	 mul x11, x7, x5
	 umulh x5, x7, x5
	 adcs x15, x15, x11
	 cset x16, cs
	 adds x15, x15, x4
	 adc x16, x16, x5
	 cmn x15, x15
	 bic x15, x15, #0x8000000000000000
	 adc x8, x16, x16
	 mov x7, #0x13
	 mul x11, x7, x8
	 adds x12, x12, x11
	 adcs x13, x13, x9
	 adcs x14, x14, x3
	 adc x15, x15, xzr
	 stp x12, x13, [sp, #(5*32)]
	 stp x14, x15, [sp, #(5*32)+16]

        ldp x5, x6, [sp, #(9*32)]
	 ldp x4, x3, [sp, #(5*32)]
	 subs x5, x5, x4
	 sbcs x6, x6, x3
	 ldp x7, x8, [sp, #(9*32)+16]
	 ldp x4, x3, [sp, #(5*32)+16]
	 sbcs x7, x7, x4
	 sbcs x8, x8, x3
	 mov x4, #38
	 csel x3, x4, xzr, lo
	 subs x5, x5, x3
	 sbcs x6, x6, xzr
	 sbcs x7, x7, xzr
	 sbc x8, x8, xzr
	 stp x5, x6, [sp, #(8*32)]
	 stp x7, x8, [sp, #(8*32)+16]
        ldp x3, x4, [sp, #(9*32)]
	 ldp x7, x8, [sp, #(5*32)]
	 adds x3, x3, x7
	 adcs x4, x4, x8
	 ldp x5, x6, [sp, #(9*32)+16]
	 ldp x7, x8, [sp, #(5*32)+16]
	 adcs x5, x5, x7
	 adcs x6, x6, x8
	 mov x9, #38
	 csel x9, x9, xzr, cs
	 adds x3, x3, x9
	 adcs x4, x4, xzr
	 adcs x5, x5, xzr
	 adc x6, x6, xzr
	 stp x3, x4, [sp, #(9*32)]
	 stp x5, x6, [sp, #(9*32)+16]
        ldp x2, x3, [sp, #(8*32)]
	 mul x9, x2, x3
	 umulh x10, x2, x3
	 ldp x4, x5, [sp, #(8*32)+16]
	 mul x11, x2, x5
	 umulh x12, x2, x5
	 mul x7, x2, x4
	 umulh x6, x2, x4
	 adds x10, x10, x7
	 adcs x11, x11, x6
	 mul x7, x3, x4
	 umulh x6, x3, x4
	 adc x6, x6, xzr
	 adds x11, x11, x7
	 mul x13, x4, x5
	 umulh x14, x4, x5
	 adcs x12, x12, x6
	 mul x7, x3, x5
	 umulh x6, x3, x5
	 adc x6, x6, xzr
	 adds x12, x12, x7
	 adcs x13, x13, x6
	 adc x14, x14, xzr
	 adds x9, x9, x9
	 adcs x10, x10, x10
	 adcs x11, x11, x11
	 adcs x12, x12, x12
	 adcs x13, x13, x13
	 adcs x14, x14, x14
	 cset x6, cs
	 umulh x7, x2, x2
	 mul x8, x2, x2
	 adds x9, x9, x7
	 mul x7, x3, x3
	 adcs x10, x10, x7
	 umulh x7, x3, x3
	 adcs x11, x11, x7
	 mul x7, x4, x4
	 adcs x12, x12, x7
	 umulh x7, x4, x4
	 adcs x13, x13, x7
	 mul x7, x5, x5
	 adcs x14, x14, x7
	 umulh x7, x5, x5
	 adc x6, x6, x7
	 mov x3, #0x26
	 mul x7, x3, x12
	 umulh x4, x3, x12
	 adds x8, x8, x7
	 mul x7, x3, x13
	 umulh x13, x3, x13
	 adcs x9, x9, x7
	 mul x7, x3, x14
	 umulh x14, x3, x14
	 adcs x10, x10, x7
	 mul x7, x3, x6
	 umulh x6, x3, x6
	 adcs x11, x11, x7
	 cset x12, cs
	 adds x11, x11, x14
	 adc x12, x12, x6
	 cmn x11, x11
	 bic x11, x11, #0x8000000000000000
	 adc x2, x12, x12
	 mov x3, #0x13
	 mul x7, x3, x2
	 adds x8, x8, x7
	 adcs x9, x9, x4
	 adcs x10, x10, x13
	 adc x11, x11, xzr
	 stp x8, x9, [sp, #(8*32)]
	 stp x10, x11, [sp, #(8*32)+16]
        ldp x2, x3, [sp, #(9*32)]
	 mul x9, x2, x3
	 umulh x10, x2, x3
	 ldp x4, x5, [sp, #(9*32)+16]
	 mul x11, x2, x5
	 umulh x12, x2, x5
	 mul x7, x2, x4
	 umulh x6, x2, x4
	 adds x10, x10, x7
	 adcs x11, x11, x6
	 mul x7, x3, x4
	 umulh x6, x3, x4
	 adc x6, x6, xzr
	 adds x11, x11, x7
	 mul x13, x4, x5
	 umulh x14, x4, x5
	 adcs x12, x12, x6
	 mul x7, x3, x5
	 umulh x6, x3, x5
	 adc x6, x6, xzr
	 adds x12, x12, x7
	 adcs x13, x13, x6
	 adc x14, x14, xzr
	 adds x9, x9, x9
	 adcs x10, x10, x10
	 adcs x11, x11, x11
	 adcs x12, x12, x12
	 adcs x13, x13, x13
	 adcs x14, x14, x14
	 cset x6, cs
	 umulh x7, x2, x2
	 mul x8, x2, x2
	 adds x9, x9, x7
	 mul x7, x3, x3
	 adcs x10, x10, x7
	 umulh x7, x3, x3
	 adcs x11, x11, x7
	 mul x7, x4, x4
	 adcs x12, x12, x7
	 umulh x7, x4, x4
	 adcs x13, x13, x7
	 mul x7, x5, x5
	 adcs x14, x14, x7
	 umulh x7, x5, x5
	 adc x6, x6, x7
	 mov x3, #0x26
	 mul x7, x3, x12
	 umulh x4, x3, x12
	 adds x8, x8, x7
	 mul x7, x3, x13
	 umulh x13, x3, x13
	 adcs x9, x9, x7
	 mul x7, x3, x14
	 umulh x14, x3, x14
	 adcs x10, x10, x7
	 mul x7, x3, x6
	 umulh x6, x3, x6
	 adcs x11, x11, x7
	 cset x12, cs
	 adds x11, x11, x14
	 adc x12, x12, x6
	 cmn x11, x11
	 bic x11, x11, #0x8000000000000000
	 adc x2, x12, x12
	 mov x3, #0x13
	 mul x7, x3, x2
	 adds x8, x8, x7
	 adcs x9, x9, x4
	 adcs x10, x10, x13
	 adc x11, x11, xzr
	 stp x8, x9, [sp, #(9*32)]
	 stp x10, x11, [sp, #(9*32)+16]
        ldp x5, x6, [sp, #(9*32)]
	 ldp x4, x3, [sp, #(8*32)]
	 subs x5, x5, x4
	 sbcs x6, x6, x3
	 ldp x7, x8, [sp, #(9*32)+16]
	 ldp x4, x3, [sp, #(8*32)+16]
	 sbcs x7, x7, x4
	 sbcs x8, x8, x3
	 mov x4, #38
	 csel x3, x4, xzr, lo
	 subs x5, x5, x3
	 sbcs x6, x6, xzr
	 sbcs x7, x7, xzr
	 sbc x8, x8, xzr
	 stp x5, x6, [sp, #(6*32)]
	 stp x7, x8, [sp, #(6*32)+16]
        mov x1, 0xdb42
        orr x1, x1, 0x10000
        ldp x7, x8, [sp, #(6*32)]
	 ldp x9, x10, [sp, #(6*32)+16]
	 mul x3, x1, x7
	 mul x4, x1, x8
	 mul x5, x1, x9
	 mul x6, x1, x10
	 umulh x7, x1, x7
	 umulh x8, x1, x8
	 umulh x9, x1, x9
	 umulh x10, x1, x10
	 adds x4, x4, x7
	 adcs x5, x5, x8
	 adcs x6, x6, x9
	 adc x10, x10, xzr
	 ldp x7, x8, [sp, #(8*32)]
	 adds x3, x3, x7
	 adcs x4, x4, x8
	 ldp x7, x8, [sp, #(8*32)+16]
	 adcs x5, x5, x7
	 adcs x6, x6, x8
	 adc x10, x10, xzr
	 cmn x6, x6
	 bic x6, x6, #0x8000000000000000
	 adc x8, x10, x10
	 mov x9, #19
	 mul x7, x8, x9
	 adds x3, x3, x7
	 adcs x4, x4, xzr
	 adcs x5, x5, xzr
	 adc x6, x6, xzr
	 stp x3, x4, [sp, #(5*32)]
	 stp x5, x6, [sp, #(5*32)+16]
        ldp x3, x4, [sp, #(9*32)]
	 ldp x7, x8, [sp, #(8*32)]
	 mul x12, x3, x7
	 umulh x13, x3, x7
	 mul x11, x3, x8
	 umulh x14, x3, x8
	 adds x13, x13, x11
	 ldp x9, x10, [sp, #(8*32)+16]
	 mul x11, x3, x9
	 umulh x15, x3, x9
	 adcs x14, x14, x11
	 mul x11, x3, x10
	 umulh x16, x3, x10
	 adcs x15, x15, x11
	 adc x16, x16, xzr
	 ldp x5, x6, [sp, #(9*32)+16]
	 mul x11, x4, x7
	 adds x13, x13, x11
	 mul x11, x4, x8
	 adcs x14, x14, x11
	 mul x11, x4, x9
	 adcs x15, x15, x11
	 mul x11, x4, x10
	 adcs x16, x16, x11
	 umulh x3, x4, x10
	 adc x3, x3, xzr
	 umulh x11, x4, x7
	 adds x14, x14, x11
	 umulh x11, x4, x8
	 adcs x15, x15, x11
	 umulh x11, x4, x9
	 adcs x16, x16, x11
	 adc x3, x3, xzr
	 mul x11, x5, x7
	 adds x14, x14, x11
	 mul x11, x5, x8
	 adcs x15, x15, x11
	 mul x11, x5, x9
	 adcs x16, x16, x11
	 mul x11, x5, x10
	 adcs x3, x3, x11
	 umulh x4, x5, x10
	 adc x4, x4, xzr
	 umulh x11, x5, x7
	 adds x15, x15, x11
	 umulh x11, x5, x8
	 adcs x16, x16, x11
	 umulh x11, x5, x9
	 adcs x3, x3, x11
	 adc x4, x4, xzr
	 mul x11, x6, x7
	 adds x15, x15, x11
	 mul x11, x6, x8
	 adcs x16, x16, x11
	 mul x11, x6, x9
	 adcs x3, x3, x11
	 mul x11, x6, x10
	 adcs x4, x4, x11
	 umulh x5, x6, x10
	 adc x5, x5, xzr
	 umulh x11, x6, x7
	 adds x16, x16, x11
	 umulh x11, x6, x8
	 adcs x3, x3, x11
	 umulh x11, x6, x9
	 adcs x4, x4, x11
	 adc x5, x5, xzr
	 mov x7, #0x26
	 mul x11, x7, x16
	 umulh x9, x7, x16
	 adds x12, x12, x11
	 mul x11, x7, x3
	 umulh x3, x7, x3
	 adcs x13, x13, x11
	 mul x11, x7, x4
	 umulh x4, x7, x4
	 adcs x14, x14, x11
	 mul x11, x7, x5
	 umulh x5, x7, x5
	 adcs x15, x15, x11
	 cset x16, cs
	 adds x15, x15, x4
	 adc x16, x16, x5
	 cmn x15, x15
	 bic x15, x15, #0x8000000000000000
	 adc x8, x16, x16
	 mov x7, #0x13
	 mul x11, x7, x8
	 adds x12, x12, x11
	 adcs x13, x13, x9
	 adcs x14, x14, x3
	 adc x15, x15, xzr
	 stp x12, x13, [sp, #(9*32)]
	 stp x14, x15, [sp, #(9*32)+16]
        ldp x3, x4, [sp, #(6*32)]
	 ldp x7, x8, [sp, #(5*32)]
	 mul x12, x3, x7
	 umulh x13, x3, x7
	 mul x11, x3, x8
	 umulh x14, x3, x8
	 adds x13, x13, x11
	 ldp x9, x10, [sp, #(5*32)+16]
	 mul x11, x3, x9
	 umulh x15, x3, x9
	 adcs x14, x14, x11
	 mul x11, x3, x10
	 umulh x16, x3, x10
	 adcs x15, x15, x11
	 adc x16, x16, xzr
	 ldp x5, x6, [sp, #(6*32)+16]
	 mul x11, x4, x7
	 adds x13, x13, x11
	 mul x11, x4, x8
	 adcs x14, x14, x11
	 mul x11, x4, x9
	 adcs x15, x15, x11
	 mul x11, x4, x10
	 adcs x16, x16, x11
	 umulh x3, x4, x10
	 adc x3, x3, xzr
	 umulh x11, x4, x7
	 adds x14, x14, x11
	 umulh x11, x4, x8
	 adcs x15, x15, x11
	 umulh x11, x4, x9
	 adcs x16, x16, x11
	 adc x3, x3, xzr
	 mul x11, x5, x7
	 adds x14, x14, x11
	 mul x11, x5, x8
	 adcs x15, x15, x11
	 mul x11, x5, x9
	 adcs x16, x16, x11
	 mul x11, x5, x10
	 adcs x3, x3, x11
	 umulh x4, x5, x10
	 adc x4, x4, xzr
	 umulh x11, x5, x7
	 adds x15, x15, x11
	 umulh x11, x5, x8
	 adcs x16, x16, x11
	 umulh x11, x5, x9
	 adcs x3, x3, x11
	 adc x4, x4, xzr
	 mul x11, x6, x7
	 adds x15, x15, x11
	 mul x11, x6, x8
	 adcs x16, x16, x11
	 mul x11, x6, x9
	 adcs x3, x3, x11
	 mul x11, x6, x10
	 adcs x4, x4, x11
	 umulh x5, x6, x10
	 adc x5, x5, xzr
	 umulh x11, x6, x7
	 adds x16, x16, x11
	 umulh x11, x6, x8
	 adcs x3, x3, x11
	 umulh x11, x6, x9
	 adcs x4, x4, x11
	 adc x5, x5, xzr
	 mov x7, #0x26
	 mul x11, x7, x16
	 umulh x9, x7, x16
	 adds x12, x12, x11
	 mul x11, x7, x3
	 umulh x3, x7, x3
	 adcs x13, x13, x11
	 mul x11, x7, x4
	 umulh x4, x7, x4
	 adcs x14, x14, x11
	 mul x11, x7, x5
	 umulh x5, x7, x5
	 adcs x15, x15, x11
	 cset x16, cs
	 adds x15, x15, x4
	 adc x16, x16, x5
	 cmn x15, x15
	 bic x15, x15, #0x8000000000000000
	 adc x8, x16, x16
	 mov x7, #0x13
	 mul x11, x7, x8
	 adds x12, x12, x11
	 adcs x13, x13, x9
	 adcs x14, x14, x3
	 adc x15, x15, xzr
	 stp x12, x13, [sp, #(5*32)]
	 stp x14, x15, [sp, #(5*32)+16]




        add x0, sp, #(5*32)
        add x1, sp, #(5*32)
# 766 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/curve25519/curve25519_x25519_byte_alt.S"
        mov x20, x0
        mov x10, #0xffffffffffffffed
        mov x11, #0xffffffffffffffff
        stp x10, x11, [sp]
        mov x12, #0x7fffffffffffffff
        stp x11, x12, [sp, #16]
        ldp x2, x3, [x1]
        ldp x4, x5, [x1, #16]
        mov x7, #0x13
        lsr x6, x5, #63
        madd x6, x7, x6, x7
        adds x2, x2, x6
        adcs x3, x3, xzr
        adcs x4, x4, xzr
        orr x5, x5, #0x8000000000000000
        adcs x5, x5, xzr
        csel x6, x7, xzr, cc
        subs x2, x2, x6
        sbcs x3, x3, xzr
        sbcs x4, x4, xzr
        sbc x5, x5, xzr
        and x5, x5, #0x7fffffffffffffff
        stp x2, x3, [sp, #32]
        stp x4, x5, [sp, #48]
        stp xzr, xzr, [sp, #64]
        stp xzr, xzr, [sp, #80]
        mov x10, #0x2099
        movk x10, #0x7502, lsl #16
        movk x10, #0x9e23, lsl #32
        movk x10, #0xa0f9, lsl #48
        mov x11, #0x2595
        movk x11, #0x1d13, lsl #16
        movk x11, #0x8f3f, lsl #32
        movk x11, #0xa8c6, lsl #48
        mov x12, #0x5242
        movk x12, #0x5ac, lsl #16
        movk x12, #0x8938, lsl #32
        movk x12, #0x6c6c, lsl #48
        mov x13, #0x615
        movk x13, #0x4177, lsl #16
        movk x13, #0x8b2, lsl #32
        movk x13, #0x2765, lsl #48
        stp x10, x11, [sp, #96]
        stp x12, x13, [sp, #112]
        mov x21, #0xa
        mov x22, #0x1
        b curve25519_x25519_byte_alt_invmidloop
curve25519_x25519_byte_alt_invloop:
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
        ldr x7, [sp]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x4, x9, x0
        adc x2, xzr, x1
        ldr x8, [sp, #32]
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
        ldr x7, [sp, #8]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x2, x2, x0
        adc x6, xzr, x1
        ldr x8, [sp, #40]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x2, x2, x0
        adc x6, x6, x1
        extr x4, x2, x4, #59
        str x4, [sp]
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
        str x5, [sp, #32]
        ldr x7, [sp, #16]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x6, x6, x0
        adc x5, xzr, x1
        ldr x8, [sp, #48]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x6, x6, x0
        adc x5, x5, x1
        extr x2, x6, x2, #59
        str x2, [sp, #8]
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
        str x3, [sp, #40]
        ldr x7, [sp, #24]
        eor x1, x7, x14
        asr x3, x1, #63
        and x3, x3, x10
        neg x3, x3
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x5, x5, x0
        adc x3, x3, x1
        ldr x8, [sp, #56]
        eor x1, x8, x15
        asr x0, x1, #63
        and x0, x0, x11
        sub x3, x3, x0
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x5, x5, x0
        adc x3, x3, x1
        extr x6, x5, x6, #59
        str x6, [sp, #16]
        extr x5, x3, x5, #59
        str x5, [sp, #24]
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
        str x4, [sp, #48]
        extr x2, x5, x2, #59
        str x2, [sp, #56]
        ldr x7, [sp, #64]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x4, x9, x0
        adc x2, xzr, x1
        ldr x8, [sp, #96]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x4, x4, x0
        str x4, [sp, #64]
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
        str x5, [sp, #96]
        adc x3, x3, x1
        ldr x7, [sp, #72]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x2, x2, x0
        adc x6, xzr, x1
        ldr x8, [sp, #104]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x2, x2, x0
        str x2, [sp, #72]
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
        str x3, [sp, #104]
        adc x4, x4, x1
        ldr x7, [sp, #80]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x6, x6, x0
        adc x5, xzr, x1
        ldr x8, [sp, #112]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x6, x6, x0
        str x6, [sp, #80]
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
        str x4, [sp, #112]
        adc x2, x2, x1
        ldr x7, [sp, #88]
        eor x1, x7, x14
        and x3, x14, x10
        neg x3, x3
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x5, x5, x0
        adc x3, x3, x1
        ldr x8, [sp, #120]
        eor x1, x8, x15
        and x0, x15, x11
        sub x3, x3, x0
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x5, x5, x0
        adc x3, x3, x1
        extr x6, x3, x5, #63
        ldp x0, x1, [sp, #64]
        add x6, x6, x3, asr #63
        mov x3, #0x13
        mul x4, x6, x3
        add x5, x5, x6, lsl #63
        smulh x3, x6, x3
        ldr x6, [sp, #80]
        adds x0, x0, x4
        adcs x1, x1, x3
        asr x3, x3, #63
        adcs x6, x6, x3
        adc x5, x5, x3
        stp x0, x1, [sp, #64]
        stp x6, x5, [sp, #80]
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
        extr x6, x5, x2, #63
        ldp x0, x1, [sp, #96]
        add x6, x6, x5, asr #63
        mov x5, #0x13
        mul x4, x6, x5
        add x2, x2, x6, lsl #63
        smulh x5, x6, x5
        ldr x3, [sp, #112]
        adds x0, x0, x4
        adcs x1, x1, x5
        asr x5, x5, #63
        adcs x3, x3, x5
        adc x2, x2, x5
        stp x0, x1, [sp, #96]
        stp x3, x2, [sp, #112]
curve25519_x25519_byte_alt_invmidloop:
        mov x1, x22
        ldr x2, [sp]
        ldr x3, [sp, #32]
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
        subs x21, x21, #0x1
        b.ne curve25519_x25519_byte_alt_invloop
        ldr x0, [sp]
        ldr x1, [sp, #32]
        mul x0, x0, x10
        madd x1, x1, x11, x0
        asr x0, x1, #63
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
        ldr x7, [sp, #64]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x4, x9, x0
        adc x2, xzr, x1
        ldr x8, [sp, #96]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x4, x4, x0
        str x4, [sp, #64]
        adc x2, x2, x1
        ldr x7, [sp, #72]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x2, x2, x0
        adc x6, xzr, x1
        ldr x8, [sp, #104]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x2, x2, x0
        str x2, [sp, #72]
        adc x6, x6, x1
        ldr x7, [sp, #80]
        eor x1, x7, x14
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x6, x6, x0
        adc x5, xzr, x1
        ldr x8, [sp, #112]
        eor x1, x8, x15
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x6, x6, x0
        str x6, [sp, #80]
        adc x5, x5, x1
        ldr x7, [sp, #88]
        eor x1, x7, x14
        and x3, x14, x10
        neg x3, x3
        mul x0, x1, x10
        umulh x1, x1, x10
        adds x5, x5, x0
        adc x3, x3, x1
        ldr x8, [sp, #120]
        eor x1, x8, x15
        and x0, x15, x11
        sub x3, x3, x0
        mul x0, x1, x11
        umulh x1, x1, x11
        adds x5, x5, x0
        adc x3, x3, x1
        extr x6, x3, x5, #63
        ldp x0, x1, [sp, #64]
        tst x3, x3
        cinc x6, x6, pl
        mov x3, #0x13
        mul x4, x6, x3
        add x5, x5, x6, lsl #63
        smulh x6, x6, x3
        ldr x2, [sp, #80]
        adds x0, x0, x4
        adcs x1, x1, x6
        asr x6, x6, #63
        adcs x2, x2, x6
        adcs x5, x5, x6
        csel x3, x3, xzr, mi
        subs x0, x0, x3
        sbcs x1, x1, xzr
        sbcs x2, x2, xzr
        sbc x5, x5, xzr
        and x5, x5, #0x7fffffffffffffff
        mov x4, x20
        stp x0, x1, [x4]
        stp x2, x5, [x4, #16]







        ldp x3, x4, [sp, #(9*32)]
	 ldp x7, x8, [sp, #(5*32)]
	 mul x12, x3, x7
	 umulh x13, x3, x7
	 mul x11, x3, x8
	 umulh x14, x3, x8
	 adds x13, x13, x11
	 ldp x9, x10, [sp, #(5*32)+16]
	 mul x11, x3, x9
	 umulh x15, x3, x9
	 adcs x14, x14, x11
	 mul x11, x3, x10
	 umulh x16, x3, x10
	 adcs x15, x15, x11
	 adc x16, x16, xzr
	 ldp x5, x6, [sp, #(9*32)+16]
	 mul x11, x4, x7
	 adds x13, x13, x11
	 mul x11, x4, x8
	 adcs x14, x14, x11
	 mul x11, x4, x9
	 adcs x15, x15, x11
	 mul x11, x4, x10
	 adcs x16, x16, x11
	 umulh x3, x4, x10
	 adc x3, x3, xzr
	 umulh x11, x4, x7
	 adds x14, x14, x11
	 umulh x11, x4, x8
	 adcs x15, x15, x11
	 umulh x11, x4, x9
	 adcs x16, x16, x11
	 adc x3, x3, xzr
	 mul x11, x5, x7
	 adds x14, x14, x11
	 mul x11, x5, x8
	 adcs x15, x15, x11
	 mul x11, x5, x9
	 adcs x16, x16, x11
	 mul x11, x5, x10
	 adcs x3, x3, x11
	 umulh x4, x5, x10
	 adc x4, x4, xzr
	 umulh x11, x5, x7
	 adds x15, x15, x11
	 umulh x11, x5, x8
	 adcs x16, x16, x11
	 umulh x11, x5, x9
	 adcs x3, x3, x11
	 adc x4, x4, xzr
	 mul x11, x6, x7
	 adds x15, x15, x11
	 mul x11, x6, x8
	 adcs x16, x16, x11
	 mul x11, x6, x9
	 adcs x3, x3, x11
	 mul x11, x6, x10
	 adcs x4, x4, x11
	 umulh x5, x6, x10
	 adc x5, x5, xzr
	 umulh x11, x6, x7
	 adds x16, x16, x11
	 umulh x11, x6, x8
	 adcs x3, x3, x11
	 umulh x11, x6, x9
	 adcs x4, x4, x11
	 adc x5, x5, xzr
	 mov x7, #0x26
	 mul x11, x7, x16
	 umulh x9, x7, x16
	 adds x12, x12, x11
	 mul x11, x7, x3
	 umulh x3, x7, x3
	 adcs x13, x13, x11
	 mul x11, x7, x4
	 umulh x4, x7, x4
	 adcs x14, x14, x11
	 mul x11, x7, x5
	 umulh x5, x7, x5
	 adcs x15, x15, x11
	 cset x16, cs
	 adds x15, x15, x4
	 adc x16, x16, x5
	 cmn x15, x15
	 orr x15, x15, #0x8000000000000000
	 adc x8, x16, x16
	 mov x7, #0x13
	 madd x11, x7, x8, x7
	 adds x12, x12, x11
	 adcs x13, x13, x9
	 adcs x14, x14, x3
	 adcs x15, x15, xzr
	 csel x7, x7, xzr, cc
	 subs x12, x12, x7
	 sbcs x13, x13, xzr
	 sbcs x14, x14, xzr
	 sbc x15, x15, xzr
	 and x15, x15, #0x7fffffffffffffff
	 stp x12, x13, [sp, #(5*32)]
	 stp x14, x15, [sp, #(5*32)+16]

        ldp x10, x11, [sp, #(5*32)]
        strb w10, [x23, #0]
        lsr x10, x10, #8
        strb w10, [x23, #0 +1]
        lsr x10, x10, #8
        strb w10, [x23, #0 +2]
        lsr x10, x10, #8
        strb w10, [x23, #0 +3]
        lsr x10, x10, #8
        strb w10, [x23, #0 +4]
        lsr x10, x10, #8
        strb w10, [x23, #0 +5]
        lsr x10, x10, #8
        strb w10, [x23, #0 +6]
        lsr x10, x10, #8
        strb w10, [x23, #0 +7]

        strb w11, [x23, #0 +8]
        lsr x11, x11, #8
        strb w11, [x23, #0 +9]
        lsr x11, x11, #8
        strb w11, [x23, #0 +10]
        lsr x11, x11, #8
        strb w11, [x23, #0 +11]
        lsr x11, x11, #8
        strb w11, [x23, #0 +12]
        lsr x11, x11, #8
        strb w11, [x23, #0 +13]
        lsr x11, x11, #8
        strb w11, [x23, #0 +14]
        lsr x11, x11, #8
        strb w11, [x23, #0 +15]

        ldp x12, x13, [sp, #(5*32)+16]
        strb w12, [x23, #0 +16]
        lsr x12, x12, #8
        strb w12, [x23, #0 +17]
        lsr x12, x12, #8
        strb w12, [x23, #0 +18]
        lsr x12, x12, #8
        strb w12, [x23, #0 +19]
        lsr x12, x12, #8
        strb w12, [x23, #0 +20]
        lsr x12, x12, #8
        strb w12, [x23, #0 +21]
        lsr x12, x12, #8
        strb w12, [x23, #0 +22]
        lsr x12, x12, #8
        strb w12, [x23, #0 +23]

        strb w13, [x23, #0 +24]
        lsr x13, x13, #8
        strb w13, [x23, #0 +25]
        lsr x13, x13, #8
        strb w13, [x23, #0 +26]
        lsr x13, x13, #8
        strb w13, [x23, #0 +27]
        lsr x13, x13, #8
        strb w13, [x23, #0 +28]
        lsr x13, x13, #8
        strb w13, [x23, #0 +29]
        lsr x13, x13, #8
        strb w13, [x23, #0 +30]
        lsr x13, x13, #8
        strb w13, [x23, #0 +31]



        add sp, sp, #(10*32)
        ldp x23, x24, [sp], 16
        ldp x21, x22, [sp], 16
        ldp x19, x20, [sp], 16

        ret
