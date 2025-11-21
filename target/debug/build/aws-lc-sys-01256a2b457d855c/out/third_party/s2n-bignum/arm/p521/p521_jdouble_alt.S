# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p521/p521_jdouble_alt.S"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 467 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p521/p521_jdouble_alt.S" 2
# 17 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p521/p521_jdouble_alt.S"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/include/_internal_s2n_bignum.h" 1
# 18 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p521/p521_jdouble_alt.S" 2

        .globl _p521_jdouble_alt


        .text
        .balign 4
# 1378 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p521/p521_jdouble_alt.S"
_p521_jdouble_alt:



        stp x19, x20, [sp, #-16]!
        stp x21, x22, [sp, #-16]!
        stp x23, x24, [sp, #-16]!
        stp x25, x26, [sp, #-16]!
        stp x27, x28, [sp, #-16]!
        sub sp, sp, (72*7+8)



        mov x26, x0
        mov x27, x1






        ldp x2, x3, [x27, #(2*72)]
	 mul x11, x2, x3
	 umulh x12, x2, x3
	 ldp x4, x5, [x27, #(2*72)+16]
	 mul x10, x2, x4
	 umulh x13, x2, x4
	 adds x12, x12, x10
	 ldp x6, x7, [x27, #(2*72)+32]
	 mul x10, x2, x5
	 umulh x14, x2, x5
	 adcs x13, x13, x10
	 ldp x8, x9, [x27, #(2*72)+48]
	 mul x10, x2, x6
	 umulh x15, x2, x6
	 adcs x14, x14, x10
	 mul x10, x2, x7
	 umulh x16, x2, x7
	 adcs x15, x15, x10
	 mul x10, x2, x8
	 umulh x17, x2, x8
	 adcs x16, x16, x10
	 mul x10, x2, x9
	 umulh x19, x2, x9
	 adcs x17, x17, x10
	 adc x19, x19, xzr
	 mul x10, x3, x4
	 adds x13, x13, x10
	 mul x10, x3, x5
	 adcs x14, x14, x10
	 mul x10, x3, x6
	 adcs x15, x15, x10
	 mul x10, x3, x7
	 adcs x16, x16, x10
	 mul x10, x3, x8
	 adcs x17, x17, x10
	 mul x10, x3, x9
	 adcs x19, x19, x10
	 cset x20, hs
	 umulh x10, x3, x4
	 adds x14, x14, x10
	 umulh x10, x3, x5
	 adcs x15, x15, x10
	 umulh x10, x3, x6
	 adcs x16, x16, x10
	 umulh x10, x3, x7
	 adcs x17, x17, x10
	 umulh x10, x3, x8
	 adcs x19, x19, x10
	 umulh x10, x3, x9
	 adc x20, x20, x10
	 mul x10, x6, x7
	 umulh x21, x6, x7
	 adds x20, x20, x10
	 adc x21, x21, xzr
	 mul x10, x4, x5
	 adds x15, x15, x10
	 mul x10, x4, x6
	 adcs x16, x16, x10
	 mul x10, x4, x7
	 adcs x17, x17, x10
	 mul x10, x4, x8
	 adcs x19, x19, x10
	 mul x10, x4, x9
	 adcs x20, x20, x10
	 mul x10, x6, x8
	 adcs x21, x21, x10
	 cset x22, hs
	 umulh x10, x4, x5
	 adds x16, x16, x10
	 umulh x10, x4, x6
	 adcs x17, x17, x10
	 umulh x10, x4, x7
	 adcs x19, x19, x10
	 umulh x10, x4, x8
	 adcs x20, x20, x10
	 umulh x10, x4, x9
	 adcs x21, x21, x10
	 umulh x10, x6, x8
	 adc x22, x22, x10
	 mul x10, x7, x8
	 umulh x23, x7, x8
	 adds x22, x22, x10
	 adc x23, x23, xzr
	 mul x10, x5, x6
	 adds x17, x17, x10
	 mul x10, x5, x7
	 adcs x19, x19, x10
	 mul x10, x5, x8
	 adcs x20, x20, x10
	 mul x10, x5, x9
	 adcs x21, x21, x10
	 mul x10, x6, x9
	 adcs x22, x22, x10
	 mul x10, x7, x9
	 adcs x23, x23, x10
	 cset x24, hs
	 umulh x10, x5, x6
	 adds x19, x19, x10
	 umulh x10, x5, x7
	 adcs x20, x20, x10
	 umulh x10, x5, x8
	 adcs x21, x21, x10
	 umulh x10, x5, x9
	 adcs x22, x22, x10
	 umulh x10, x6, x9
	 adcs x23, x23, x10
	 umulh x10, x7, x9
	 adc x24, x24, x10
	 mul x10, x8, x9
	 umulh x25, x8, x9
	 adds x24, x24, x10
	 adc x25, x25, xzr
	 adds x11, x11, x11
	 adcs x12, x12, x12
	 adcs x13, x13, x13
	 adcs x14, x14, x14
	 adcs x15, x15, x15
	 adcs x16, x16, x16
	 adcs x17, x17, x17
	 adcs x19, x19, x19
	 adcs x20, x20, x20
	 adcs x21, x21, x21
	 adcs x22, x22, x22
	 adcs x23, x23, x23
	 adcs x24, x24, x24
	 adcs x25, x25, x25
	 cset x0, hs
	 umulh x10, x2, x2
	 adds x11, x11, x10
	 mul x10, x3, x3
	 adcs x12, x12, x10
	 umulh x10, x3, x3
	 adcs x13, x13, x10
	 mul x10, x4, x4
	 adcs x14, x14, x10
	 umulh x10, x4, x4
	 adcs x15, x15, x10
	 mul x10, x5, x5
	 adcs x16, x16, x10
	 umulh x10, x5, x5
	 adcs x17, x17, x10
	 mul x10, x6, x6
	 adcs x19, x19, x10
	 umulh x10, x6, x6
	 adcs x20, x20, x10
	 mul x10, x7, x7
	 adcs x21, x21, x10
	 umulh x10, x7, x7
	 adcs x22, x22, x10
	 mul x10, x8, x8
	 adcs x23, x23, x10
	 umulh x10, x8, x8
	 adcs x24, x24, x10
	 mul x10, x9, x9
	 adcs x25, x25, x10
	 umulh x10, x9, x9
	 adc x0, x0, x10
	 ldr x1, [x27, #(2*72)+64]
	 add x1, x1, x1
	 mul x10, x1, x2
	 adds x19, x19, x10
	 umulh x10, x1, x2
	 adcs x20, x20, x10
	 mul x10, x1, x4
	 adcs x21, x21, x10
	 umulh x10, x1, x4
	 adcs x22, x22, x10
	 mul x10, x1, x6
	 adcs x23, x23, x10
	 umulh x10, x1, x6
	 adcs x24, x24, x10
	 mul x10, x1, x8
	 adcs x25, x25, x10
	 umulh x10, x1, x8
	 adcs x0, x0, x10
	 lsr x4, x1, #1
	 mul x4, x4, x4
	 adc x4, x4, xzr
	 mul x10, x1, x3
	 adds x20, x20, x10
	 umulh x10, x1, x3
	 adcs x21, x21, x10
	 mul x10, x1, x5
	 adcs x22, x22, x10
	 umulh x10, x1, x5
	 adcs x23, x23, x10
	 mul x10, x1, x7
	 adcs x24, x24, x10
	 umulh x10, x1, x7
	 adcs x25, x25, x10
	 mul x10, x1, x9
	 adcs x0, x0, x10
	 umulh x10, x1, x9
	 adc x4, x4, x10
	 mul x2, x2, x2
	 cmp xzr, xzr
	 extr x10, x20, x19, #9
	 adcs x2, x2, x10
	 extr x10, x21, x20, #9
	 adcs x11, x11, x10
	 extr x10, x22, x21, #9
	 adcs x12, x12, x10
	 extr x10, x23, x22, #9
	 adcs x13, x13, x10
	 extr x10, x24, x23, #9
	 adcs x14, x14, x10
	 extr x10, x25, x24, #9
	 adcs x15, x15, x10
	 extr x10, x0, x25, #9
	 adcs x16, x16, x10
	 extr x10, x4, x0, #9
	 adcs x17, x17, x10
	 orr x19, x19, #0xfffffffffffffe00
	 lsr x10, x4, #9
	 adcs x19, x19, x10
	 sbcs x2, x2, xzr
	 sbcs x11, x11, xzr
	 sbcs x12, x12, xzr
	 sbcs x13, x13, xzr
	 sbcs x14, x14, xzr
	 sbcs x15, x15, xzr
	 sbcs x16, x16, xzr
	 sbcs x17, x17, xzr
	 sbc x19, x19, xzr
	 and x19, x19, #0x1ff
	 stp x2, x11, [sp, #(72*0)]
	 stp x12, x13, [sp, #(72*0)+16]
	 stp x14, x15, [sp, #(72*0)+32]
	 stp x16, x17, [sp, #(72*0)+48]
	 str x19, [sp, #(72*0)+64]
        ldp x2, x3, [x27, #72]
	 mul x11, x2, x3
	 umulh x12, x2, x3
	 ldp x4, x5, [x27, #72 +16]
	 mul x10, x2, x4
	 umulh x13, x2, x4
	 adds x12, x12, x10
	 ldp x6, x7, [x27, #72 +32]
	 mul x10, x2, x5
	 umulh x14, x2, x5
	 adcs x13, x13, x10
	 ldp x8, x9, [x27, #72 +48]
	 mul x10, x2, x6
	 umulh x15, x2, x6
	 adcs x14, x14, x10
	 mul x10, x2, x7
	 umulh x16, x2, x7
	 adcs x15, x15, x10
	 mul x10, x2, x8
	 umulh x17, x2, x8
	 adcs x16, x16, x10
	 mul x10, x2, x9
	 umulh x19, x2, x9
	 adcs x17, x17, x10
	 adc x19, x19, xzr
	 mul x10, x3, x4
	 adds x13, x13, x10
	 mul x10, x3, x5
	 adcs x14, x14, x10
	 mul x10, x3, x6
	 adcs x15, x15, x10
	 mul x10, x3, x7
	 adcs x16, x16, x10
	 mul x10, x3, x8
	 adcs x17, x17, x10
	 mul x10, x3, x9
	 adcs x19, x19, x10
	 cset x20, hs
	 umulh x10, x3, x4
	 adds x14, x14, x10
	 umulh x10, x3, x5
	 adcs x15, x15, x10
	 umulh x10, x3, x6
	 adcs x16, x16, x10
	 umulh x10, x3, x7
	 adcs x17, x17, x10
	 umulh x10, x3, x8
	 adcs x19, x19, x10
	 umulh x10, x3, x9
	 adc x20, x20, x10
	 mul x10, x6, x7
	 umulh x21, x6, x7
	 adds x20, x20, x10
	 adc x21, x21, xzr
	 mul x10, x4, x5
	 adds x15, x15, x10
	 mul x10, x4, x6
	 adcs x16, x16, x10
	 mul x10, x4, x7
	 adcs x17, x17, x10
	 mul x10, x4, x8
	 adcs x19, x19, x10
	 mul x10, x4, x9
	 adcs x20, x20, x10
	 mul x10, x6, x8
	 adcs x21, x21, x10
	 cset x22, hs
	 umulh x10, x4, x5
	 adds x16, x16, x10
	 umulh x10, x4, x6
	 adcs x17, x17, x10
	 umulh x10, x4, x7
	 adcs x19, x19, x10
	 umulh x10, x4, x8
	 adcs x20, x20, x10
	 umulh x10, x4, x9
	 adcs x21, x21, x10
	 umulh x10, x6, x8
	 adc x22, x22, x10
	 mul x10, x7, x8
	 umulh x23, x7, x8
	 adds x22, x22, x10
	 adc x23, x23, xzr
	 mul x10, x5, x6
	 adds x17, x17, x10
	 mul x10, x5, x7
	 adcs x19, x19, x10
	 mul x10, x5, x8
	 adcs x20, x20, x10
	 mul x10, x5, x9
	 adcs x21, x21, x10
	 mul x10, x6, x9
	 adcs x22, x22, x10
	 mul x10, x7, x9
	 adcs x23, x23, x10
	 cset x24, hs
	 umulh x10, x5, x6
	 adds x19, x19, x10
	 umulh x10, x5, x7
	 adcs x20, x20, x10
	 umulh x10, x5, x8
	 adcs x21, x21, x10
	 umulh x10, x5, x9
	 adcs x22, x22, x10
	 umulh x10, x6, x9
	 adcs x23, x23, x10
	 umulh x10, x7, x9
	 adc x24, x24, x10
	 mul x10, x8, x9
	 umulh x25, x8, x9
	 adds x24, x24, x10
	 adc x25, x25, xzr
	 adds x11, x11, x11
	 adcs x12, x12, x12
	 adcs x13, x13, x13
	 adcs x14, x14, x14
	 adcs x15, x15, x15
	 adcs x16, x16, x16
	 adcs x17, x17, x17
	 adcs x19, x19, x19
	 adcs x20, x20, x20
	 adcs x21, x21, x21
	 adcs x22, x22, x22
	 adcs x23, x23, x23
	 adcs x24, x24, x24
	 adcs x25, x25, x25
	 cset x0, hs
	 umulh x10, x2, x2
	 adds x11, x11, x10
	 mul x10, x3, x3
	 adcs x12, x12, x10
	 umulh x10, x3, x3
	 adcs x13, x13, x10
	 mul x10, x4, x4
	 adcs x14, x14, x10
	 umulh x10, x4, x4
	 adcs x15, x15, x10
	 mul x10, x5, x5
	 adcs x16, x16, x10
	 umulh x10, x5, x5
	 adcs x17, x17, x10
	 mul x10, x6, x6
	 adcs x19, x19, x10
	 umulh x10, x6, x6
	 adcs x20, x20, x10
	 mul x10, x7, x7
	 adcs x21, x21, x10
	 umulh x10, x7, x7
	 adcs x22, x22, x10
	 mul x10, x8, x8
	 adcs x23, x23, x10
	 umulh x10, x8, x8
	 adcs x24, x24, x10
	 mul x10, x9, x9
	 adcs x25, x25, x10
	 umulh x10, x9, x9
	 adc x0, x0, x10
	 ldr x1, [x27, #72 +64]
	 add x1, x1, x1
	 mul x10, x1, x2
	 adds x19, x19, x10
	 umulh x10, x1, x2
	 adcs x20, x20, x10
	 mul x10, x1, x4
	 adcs x21, x21, x10
	 umulh x10, x1, x4
	 adcs x22, x22, x10
	 mul x10, x1, x6
	 adcs x23, x23, x10
	 umulh x10, x1, x6
	 adcs x24, x24, x10
	 mul x10, x1, x8
	 adcs x25, x25, x10
	 umulh x10, x1, x8
	 adcs x0, x0, x10
	 lsr x4, x1, #1
	 mul x4, x4, x4
	 adc x4, x4, xzr
	 mul x10, x1, x3
	 adds x20, x20, x10
	 umulh x10, x1, x3
	 adcs x21, x21, x10
	 mul x10, x1, x5
	 adcs x22, x22, x10
	 umulh x10, x1, x5
	 adcs x23, x23, x10
	 mul x10, x1, x7
	 adcs x24, x24, x10
	 umulh x10, x1, x7
	 adcs x25, x25, x10
	 mul x10, x1, x9
	 adcs x0, x0, x10
	 umulh x10, x1, x9
	 adc x4, x4, x10
	 mul x2, x2, x2
	 cmp xzr, xzr
	 extr x10, x20, x19, #9
	 adcs x2, x2, x10
	 extr x10, x21, x20, #9
	 adcs x11, x11, x10
	 extr x10, x22, x21, #9
	 adcs x12, x12, x10
	 extr x10, x23, x22, #9
	 adcs x13, x13, x10
	 extr x10, x24, x23, #9
	 adcs x14, x14, x10
	 extr x10, x25, x24, #9
	 adcs x15, x15, x10
	 extr x10, x0, x25, #9
	 adcs x16, x16, x10
	 extr x10, x4, x0, #9
	 adcs x17, x17, x10
	 orr x19, x19, #0xfffffffffffffe00
	 lsr x10, x4, #9
	 adcs x19, x19, x10
	 sbcs x2, x2, xzr
	 sbcs x11, x11, xzr
	 sbcs x12, x12, xzr
	 sbcs x13, x13, xzr
	 sbcs x14, x14, xzr
	 sbcs x15, x15, xzr
	 sbcs x16, x16, xzr
	 sbcs x17, x17, xzr
	 sbc x19, x19, xzr
	 and x19, x19, #0x1ff
	 stp x2, x11, [sp, #(72*1)]
	 stp x12, x13, [sp, #(72*1)+16]
	 stp x14, x15, [sp, #(72*1)+32]
	 stp x16, x17, [sp, #(72*1)+48]
	 str x19, [sp, #(72*1)+64]



        cmp xzr, xzr
	 ldp x5, x6, [x27, #0]
	 ldp x4, x3, [sp, #(72*0)]
	 adcs x5, x5, x4
	 adcs x6, x6, x3
	 ldp x7, x8, [x27, #0 +16]
	 ldp x4, x3, [sp, #(72*0)+16]
	 adcs x7, x7, x4
	 adcs x8, x8, x3
	 ldp x9, x10, [x27, #0 +32]
	 ldp x4, x3, [sp, #(72*0)+32]
	 adcs x9, x9, x4
	 adcs x10, x10, x3
	 ldp x11, x12, [x27, #0 +48]
	 ldp x4, x3, [sp, #(72*0)+48]
	 adcs x11, x11, x4
	 adcs x12, x12, x3
	 ldr x13, [x27, #0 +64]
	 ldr x4, [sp, #(72*0)+64]
	 adc x13, x13, x4
	 subs x4, x13, #512
	 csetm x4, hs
	 sbcs x5, x5, xzr
	 and x4, x4, #0x200
	 sbcs x6, x6, xzr
	 sbcs x7, x7, xzr
	 sbcs x8, x8, xzr
	 sbcs x9, x9, xzr
	 sbcs x10, x10, xzr
	 sbcs x11, x11, xzr
	 sbcs x12, x12, xzr
	 sbc x13, x13, x4
	 stp x5, x6, [sp, #(72*5)]
	 stp x7, x8, [sp, #(72*5)+16]
	 stp x9, x10, [sp, #(72*5)+32]
	 stp x11, x12, [sp, #(72*5)+48]
	 str x13, [sp, #(72*5)+64]
        ldp x5, x6, [x27, #0]
	 ldp x4, x3, [sp, #(72*0)]
	 subs x5, x5, x4
	 sbcs x6, x6, x3
	 ldp x7, x8, [x27, #0 +16]
	 ldp x4, x3, [sp, #(72*0)+16]
	 sbcs x7, x7, x4
	 sbcs x8, x8, x3
	 ldp x9, x10, [x27, #0 +32]
	 ldp x4, x3, [sp, #(72*0)+32]
	 sbcs x9, x9, x4
	 sbcs x10, x10, x3
	 ldp x11, x12, [x27, #0 +48]
	 ldp x4, x3, [sp, #(72*0)+48]
	 sbcs x11, x11, x4
	 sbcs x12, x12, x3
	 ldr x13, [x27, #0 +64]
	 ldr x4, [sp, #(72*0)+64]
	 sbcs x13, x13, x4
	 sbcs x5, x5, xzr
	 sbcs x6, x6, xzr
	 sbcs x7, x7, xzr
	 sbcs x8, x8, xzr
	 sbcs x9, x9, xzr
	 sbcs x10, x10, xzr
	 sbcs x11, x11, xzr
	 sbcs x12, x12, xzr
	 sbcs x13, x13, xzr
	 and x13, x13, #0x1ff
	 stp x5, x6, [sp, #(72*4)]
	 stp x7, x8, [sp, #(72*4)+16]
	 stp x9, x10, [sp, #(72*4)+32]
	 stp x11, x12, [sp, #(72*4)+48]
	 str x13, [sp, #(72*4)+64]
        ldp x3, x4, [sp, #(72*5)]
	 ldp x5, x6, [sp, #(72*4)]
	 mul x15, x3, x5
	 umulh x16, x3, x5
	 mul x14, x3, x6
	 umulh x17, x3, x6
	 adds x16, x16, x14
	 ldp x7, x8, [sp, #(72*4)+16]
	 mul x14, x3, x7
	 umulh x19, x3, x7
	 adcs x17, x17, x14
	 mul x14, x3, x8
	 umulh x20, x3, x8
	 adcs x19, x19, x14
	 ldp x9, x10, [sp, #(72*4)+32]
	 mul x14, x3, x9
	 umulh x21, x3, x9
	 adcs x20, x20, x14
	 mul x14, x3, x10
	 umulh x22, x3, x10
	 adcs x21, x21, x14
	 ldp x11, x12, [sp, #(72*4)+48]
	 mul x14, x3, x11
	 umulh x23, x3, x11
	 adcs x22, x22, x14
	 ldr x13, [sp, #(72*4)+64]
	 mul x14, x3, x12
	 umulh x24, x3, x12
	 adcs x23, x23, x14
	 mul x14, x3, x13
	 umulh x1, x3, x13
	 adcs x24, x24, x14
	 adc x1, x1, xzr
	 mul x14, x4, x5
	 adds x16, x16, x14
	 mul x14, x4, x6
	 adcs x17, x17, x14
	 mul x14, x4, x7
	 adcs x19, x19, x14
	 mul x14, x4, x8
	 adcs x20, x20, x14
	 mul x14, x4, x9
	 adcs x21, x21, x14
	 mul x14, x4, x10
	 adcs x22, x22, x14
	 mul x14, x4, x11
	 adcs x23, x23, x14
	 mul x14, x4, x12
	 adcs x24, x24, x14
	 mul x14, x4, x13
	 adcs x1, x1, x14
	 cset x0, hs
	 umulh x14, x4, x5
	 adds x17, x17, x14
	 umulh x14, x4, x6
	 adcs x19, x19, x14
	 umulh x14, x4, x7
	 adcs x20, x20, x14
	 umulh x14, x4, x8
	 adcs x21, x21, x14
	 umulh x14, x4, x9
	 adcs x22, x22, x14
	 umulh x14, x4, x10
	 adcs x23, x23, x14
	 umulh x14, x4, x11
	 adcs x24, x24, x14
	 umulh x14, x4, x12
	 adcs x1, x1, x14
	 umulh x14, x4, x13
	 adc x0, x0, x14
	 stp x15, x16, [sp, #(72*2)]
	 ldp x3, x4, [sp, #(72*5)+16]
	 mul x14, x3, x5
	 adds x17, x17, x14
	 mul x14, x3, x6
	 adcs x19, x19, x14
	 mul x14, x3, x7
	 adcs x20, x20, x14
	 mul x14, x3, x8
	 adcs x21, x21, x14
	 mul x14, x3, x9
	 adcs x22, x22, x14
	 mul x14, x3, x10
	 adcs x23, x23, x14
	 mul x14, x3, x11
	 adcs x24, x24, x14
	 mul x14, x3, x12
	 adcs x1, x1, x14
	 mul x14, x3, x13
	 adcs x0, x0, x14
	 cset x15, hs
	 umulh x14, x3, x5
	 adds x19, x19, x14
	 umulh x14, x3, x6
	 adcs x20, x20, x14
	 umulh x14, x3, x7
	 adcs x21, x21, x14
	 umulh x14, x3, x8
	 adcs x22, x22, x14
	 umulh x14, x3, x9
	 adcs x23, x23, x14
	 umulh x14, x3, x10
	 adcs x24, x24, x14
	 umulh x14, x3, x11
	 adcs x1, x1, x14
	 umulh x14, x3, x12
	 adcs x0, x0, x14
	 umulh x14, x3, x13
	 adc x15, x15, x14
	 mul x14, x4, x5
	 adds x19, x19, x14
	 mul x14, x4, x6
	 adcs x20, x20, x14
	 mul x14, x4, x7
	 adcs x21, x21, x14
	 mul x14, x4, x8
	 adcs x22, x22, x14
	 mul x14, x4, x9
	 adcs x23, x23, x14
	 mul x14, x4, x10
	 adcs x24, x24, x14
	 mul x14, x4, x11
	 adcs x1, x1, x14
	 mul x14, x4, x12
	 adcs x0, x0, x14
	 mul x14, x4, x13
	 adcs x15, x15, x14
	 cset x16, hs
	 umulh x14, x4, x5
	 adds x20, x20, x14
	 umulh x14, x4, x6
	 adcs x21, x21, x14
	 umulh x14, x4, x7
	 adcs x22, x22, x14
	 umulh x14, x4, x8
	 adcs x23, x23, x14
	 umulh x14, x4, x9
	 adcs x24, x24, x14
	 umulh x14, x4, x10
	 adcs x1, x1, x14
	 umulh x14, x4, x11
	 adcs x0, x0, x14
	 umulh x14, x4, x12
	 adcs x15, x15, x14
	 umulh x14, x4, x13
	 adc x16, x16, x14
	 stp x17, x19, [sp, #(72*2)+16]
	 ldp x3, x4, [sp, #(72*5)+32]
	 mul x14, x3, x5
	 adds x20, x20, x14
	 mul x14, x3, x6
	 adcs x21, x21, x14
	 mul x14, x3, x7
	 adcs x22, x22, x14
	 mul x14, x3, x8
	 adcs x23, x23, x14
	 mul x14, x3, x9
	 adcs x24, x24, x14
	 mul x14, x3, x10
	 adcs x1, x1, x14
	 mul x14, x3, x11
	 adcs x0, x0, x14
	 mul x14, x3, x12
	 adcs x15, x15, x14
	 mul x14, x3, x13
	 adcs x16, x16, x14
	 cset x17, hs
	 umulh x14, x3, x5
	 adds x21, x21, x14
	 umulh x14, x3, x6
	 adcs x22, x22, x14
	 umulh x14, x3, x7
	 adcs x23, x23, x14
	 umulh x14, x3, x8
	 adcs x24, x24, x14
	 umulh x14, x3, x9
	 adcs x1, x1, x14
	 umulh x14, x3, x10
	 adcs x0, x0, x14
	 umulh x14, x3, x11
	 adcs x15, x15, x14
	 umulh x14, x3, x12
	 adcs x16, x16, x14
	 umulh x14, x3, x13
	 adc x17, x17, x14
	 mul x14, x4, x5
	 adds x21, x21, x14
	 mul x14, x4, x6
	 adcs x22, x22, x14
	 mul x14, x4, x7
	 adcs x23, x23, x14
	 mul x14, x4, x8
	 adcs x24, x24, x14
	 mul x14, x4, x9
	 adcs x1, x1, x14
	 mul x14, x4, x10
	 adcs x0, x0, x14
	 mul x14, x4, x11
	 adcs x15, x15, x14
	 mul x14, x4, x12
	 adcs x16, x16, x14
	 mul x14, x4, x13
	 adcs x17, x17, x14
	 cset x19, hs
	 umulh x14, x4, x5
	 adds x22, x22, x14
	 umulh x14, x4, x6
	 adcs x23, x23, x14
	 umulh x14, x4, x7
	 adcs x24, x24, x14
	 umulh x14, x4, x8
	 adcs x1, x1, x14
	 umulh x14, x4, x9
	 adcs x0, x0, x14
	 umulh x14, x4, x10
	 adcs x15, x15, x14
	 umulh x14, x4, x11
	 adcs x16, x16, x14
	 umulh x14, x4, x12
	 adcs x17, x17, x14
	 umulh x14, x4, x13
	 adc x19, x19, x14
	 stp x20, x21, [sp, #(72*2)+32]
	 ldp x3, x4, [sp, #(72*5)+48]
	 mul x14, x3, x5
	 adds x22, x22, x14
	 mul x14, x3, x6
	 adcs x23, x23, x14
	 mul x14, x3, x7
	 adcs x24, x24, x14
	 mul x14, x3, x8
	 adcs x1, x1, x14
	 mul x14, x3, x9
	 adcs x0, x0, x14
	 mul x14, x3, x10
	 adcs x15, x15, x14
	 mul x14, x3, x11
	 adcs x16, x16, x14
	 mul x14, x3, x12
	 adcs x17, x17, x14
	 mul x14, x3, x13
	 adcs x19, x19, x14
	 cset x20, hs
	 umulh x14, x3, x5
	 adds x23, x23, x14
	 umulh x14, x3, x6
	 adcs x24, x24, x14
	 umulh x14, x3, x7
	 adcs x1, x1, x14
	 umulh x14, x3, x8
	 adcs x0, x0, x14
	 umulh x14, x3, x9
	 adcs x15, x15, x14
	 umulh x14, x3, x10
	 adcs x16, x16, x14
	 umulh x14, x3, x11
	 adcs x17, x17, x14
	 umulh x14, x3, x12
	 adcs x19, x19, x14
	 umulh x14, x3, x13
	 adc x20, x20, x14
	 mul x14, x4, x5
	 adds x23, x23, x14
	 mul x14, x4, x6
	 adcs x24, x24, x14
	 mul x14, x4, x7
	 adcs x1, x1, x14
	 mul x14, x4, x8
	 adcs x0, x0, x14
	 mul x14, x4, x9
	 adcs x15, x15, x14
	 mul x14, x4, x10
	 adcs x16, x16, x14
	 mul x14, x4, x11
	 adcs x17, x17, x14
	 mul x14, x4, x12
	 adcs x19, x19, x14
	 mul x14, x4, x13
	 adcs x20, x20, x14
	 cset x21, hs
	 umulh x14, x4, x5
	 adds x24, x24, x14
	 umulh x14, x4, x6
	 adcs x1, x1, x14
	 umulh x14, x4, x7
	 adcs x0, x0, x14
	 umulh x14, x4, x8
	 adcs x15, x15, x14
	 umulh x14, x4, x9
	 adcs x16, x16, x14
	 umulh x14, x4, x10
	 adcs x17, x17, x14
	 umulh x14, x4, x11
	 adcs x19, x19, x14
	 umulh x14, x4, x12
	 adcs x20, x20, x14
	 umulh x14, x4, x13
	 adc x21, x21, x14
	 stp x22, x23, [sp, #(72*2)+48]
	 ldr x3, [sp, #(72*5)+64]
	 mul x14, x3, x5
	 adds x24, x24, x14
	 mul x14, x3, x6
	 adcs x1, x1, x14
	 mul x14, x3, x7
	 adcs x0, x0, x14
	 mul x14, x3, x8
	 adcs x15, x15, x14
	 mul x14, x3, x9
	 adcs x16, x16, x14
	 mul x14, x3, x10
	 adcs x17, x17, x14
	 mul x14, x3, x11
	 adcs x19, x19, x14
	 mul x14, x3, x12
	 adcs x20, x20, x14
	 mul x14, x3, x13
	 adc x21, x21, x14
	 umulh x14, x3, x5
	 adds x1, x1, x14
	 umulh x14, x3, x6
	 adcs x0, x0, x14
	 umulh x14, x3, x7
	 adcs x15, x15, x14
	 umulh x14, x3, x8
	 adcs x16, x16, x14
	 umulh x14, x3, x9
	 adcs x17, x17, x14
	 umulh x14, x3, x10
	 adcs x19, x19, x14
	 umulh x14, x3, x11
	 adcs x20, x20, x14
	 umulh x14, x3, x12
	 adc x21, x21, x14
	 cmp xzr, xzr
	 ldp x5, x6, [sp, #(72*2)]
	 extr x14, x1, x24, #9
	 adcs x5, x5, x14
	 extr x14, x0, x1, #9
	 adcs x6, x6, x14
	 ldp x7, x8, [sp, #(72*2)+16]
	 extr x14, x15, x0, #9
	 adcs x7, x7, x14
	 extr x14, x16, x15, #9
	 adcs x8, x8, x14
	 ldp x9, x10, [sp, #(72*2)+32]
	 extr x14, x17, x16, #9
	 adcs x9, x9, x14
	 extr x14, x19, x17, #9
	 adcs x10, x10, x14
	 ldp x11, x12, [sp, #(72*2)+48]
	 extr x14, x20, x19, #9
	 adcs x11, x11, x14
	 extr x14, x21, x20, #9
	 adcs x12, x12, x14
	 orr x13, x24, #0xfffffffffffffe00
	 lsr x14, x21, #9
	 adcs x13, x13, x14
	 sbcs x5, x5, xzr
	 sbcs x6, x6, xzr
	 sbcs x7, x7, xzr
	 sbcs x8, x8, xzr
	 sbcs x9, x9, xzr
	 sbcs x10, x10, xzr
	 sbcs x11, x11, xzr
	 sbcs x12, x12, xzr
	 sbc x13, x13, xzr
	 and x13, x13, #0x1ff
	 stp x5, x6, [sp, #(72*2)]
	 stp x7, x8, [sp, #(72*2)+16]
	 stp x9, x10, [sp, #(72*2)+32]
	 stp x11, x12, [sp, #(72*2)+48]
	 str x13, [sp, #(72*2)+64]





        cmp xzr, xzr
	 ldp x5, x6, [x27, #72]
	 ldp x4, x3, [x27, #(2*72)]
	 adcs x5, x5, x4
	 adcs x6, x6, x3
	 ldp x7, x8, [x27, #72 +16]
	 ldp x4, x3, [x27, #(2*72)+16]
	 adcs x7, x7, x4
	 adcs x8, x8, x3
	 ldp x9, x10, [x27, #72 +32]
	 ldp x4, x3, [x27, #(2*72)+32]
	 adcs x9, x9, x4
	 adcs x10, x10, x3
	 ldp x11, x12, [x27, #72 +48]
	 ldp x4, x3, [x27, #(2*72)+48]
	 adcs x11, x11, x4
	 adcs x12, x12, x3
	 ldr x13, [x27, #72 +64]
	 ldr x4, [x27, #(2*72)+64]
	 adc x13, x13, x4
	 subs x4, x13, #512
	 csetm x4, hs
	 sbcs x5, x5, xzr
	 and x4, x4, #0x200
	 sbcs x6, x6, xzr
	 sbcs x7, x7, xzr
	 sbcs x8, x8, xzr
	 sbcs x9, x9, xzr
	 sbcs x10, x10, xzr
	 sbcs x11, x11, xzr
	 sbcs x12, x12, xzr
	 sbc x13, x13, x4
	 stp x5, x6, [sp, #(72*5)]
	 stp x7, x8, [sp, #(72*5)+16]
	 stp x9, x10, [sp, #(72*5)+32]
	 stp x11, x12, [sp, #(72*5)+48]
	 str x13, [sp, #(72*5)+64]
        ldp x2, x3, [sp, #(72*2)]
	 mul x11, x2, x3
	 umulh x12, x2, x3
	 ldp x4, x5, [sp, #(72*2)+16]
	 mul x10, x2, x4
	 umulh x13, x2, x4
	 adds x12, x12, x10
	 ldp x6, x7, [sp, #(72*2)+32]
	 mul x10, x2, x5
	 umulh x14, x2, x5
	 adcs x13, x13, x10
	 ldp x8, x9, [sp, #(72*2)+48]
	 mul x10, x2, x6
	 umulh x15, x2, x6
	 adcs x14, x14, x10
	 mul x10, x2, x7
	 umulh x16, x2, x7
	 adcs x15, x15, x10
	 mul x10, x2, x8
	 umulh x17, x2, x8
	 adcs x16, x16, x10
	 mul x10, x2, x9
	 umulh x19, x2, x9
	 adcs x17, x17, x10
	 adc x19, x19, xzr
	 mul x10, x3, x4
	 adds x13, x13, x10
	 mul x10, x3, x5
	 adcs x14, x14, x10
	 mul x10, x3, x6
	 adcs x15, x15, x10
	 mul x10, x3, x7
	 adcs x16, x16, x10
	 mul x10, x3, x8
	 adcs x17, x17, x10
	 mul x10, x3, x9
	 adcs x19, x19, x10
	 cset x20, hs
	 umulh x10, x3, x4
	 adds x14, x14, x10
	 umulh x10, x3, x5
	 adcs x15, x15, x10
	 umulh x10, x3, x6
	 adcs x16, x16, x10
	 umulh x10, x3, x7
	 adcs x17, x17, x10
	 umulh x10, x3, x8
	 adcs x19, x19, x10
	 umulh x10, x3, x9
	 adc x20, x20, x10
	 mul x10, x6, x7
	 umulh x21, x6, x7
	 adds x20, x20, x10
	 adc x21, x21, xzr
	 mul x10, x4, x5
	 adds x15, x15, x10
	 mul x10, x4, x6
	 adcs x16, x16, x10
	 mul x10, x4, x7
	 adcs x17, x17, x10
	 mul x10, x4, x8
	 adcs x19, x19, x10
	 mul x10, x4, x9
	 adcs x20, x20, x10
	 mul x10, x6, x8
	 adcs x21, x21, x10
	 cset x22, hs
	 umulh x10, x4, x5
	 adds x16, x16, x10
	 umulh x10, x4, x6
	 adcs x17, x17, x10
	 umulh x10, x4, x7
	 adcs x19, x19, x10
	 umulh x10, x4, x8
	 adcs x20, x20, x10
	 umulh x10, x4, x9
	 adcs x21, x21, x10
	 umulh x10, x6, x8
	 adc x22, x22, x10
	 mul x10, x7, x8
	 umulh x23, x7, x8
	 adds x22, x22, x10
	 adc x23, x23, xzr
	 mul x10, x5, x6
	 adds x17, x17, x10
	 mul x10, x5, x7
	 adcs x19, x19, x10
	 mul x10, x5, x8
	 adcs x20, x20, x10
	 mul x10, x5, x9
	 adcs x21, x21, x10
	 mul x10, x6, x9
	 adcs x22, x22, x10
	 mul x10, x7, x9
	 adcs x23, x23, x10
	 cset x24, hs
	 umulh x10, x5, x6
	 adds x19, x19, x10
	 umulh x10, x5, x7
	 adcs x20, x20, x10
	 umulh x10, x5, x8
	 adcs x21, x21, x10
	 umulh x10, x5, x9
	 adcs x22, x22, x10
	 umulh x10, x6, x9
	 adcs x23, x23, x10
	 umulh x10, x7, x9
	 adc x24, x24, x10
	 mul x10, x8, x9
	 umulh x25, x8, x9
	 adds x24, x24, x10
	 adc x25, x25, xzr
	 adds x11, x11, x11
	 adcs x12, x12, x12
	 adcs x13, x13, x13
	 adcs x14, x14, x14
	 adcs x15, x15, x15
	 adcs x16, x16, x16
	 adcs x17, x17, x17
	 adcs x19, x19, x19
	 adcs x20, x20, x20
	 adcs x21, x21, x21
	 adcs x22, x22, x22
	 adcs x23, x23, x23
	 adcs x24, x24, x24
	 adcs x25, x25, x25
	 cset x0, hs
	 umulh x10, x2, x2
	 adds x11, x11, x10
	 mul x10, x3, x3
	 adcs x12, x12, x10
	 umulh x10, x3, x3
	 adcs x13, x13, x10
	 mul x10, x4, x4
	 adcs x14, x14, x10
	 umulh x10, x4, x4
	 adcs x15, x15, x10
	 mul x10, x5, x5
	 adcs x16, x16, x10
	 umulh x10, x5, x5
	 adcs x17, x17, x10
	 mul x10, x6, x6
	 adcs x19, x19, x10
	 umulh x10, x6, x6
	 adcs x20, x20, x10
	 mul x10, x7, x7
	 adcs x21, x21, x10
	 umulh x10, x7, x7
	 adcs x22, x22, x10
	 mul x10, x8, x8
	 adcs x23, x23, x10
	 umulh x10, x8, x8
	 adcs x24, x24, x10
	 mul x10, x9, x9
	 adcs x25, x25, x10
	 umulh x10, x9, x9
	 adc x0, x0, x10
	 ldr x1, [sp, #(72*2)+64]
	 add x1, x1, x1
	 mul x10, x1, x2
	 adds x19, x19, x10
	 umulh x10, x1, x2
	 adcs x20, x20, x10
	 mul x10, x1, x4
	 adcs x21, x21, x10
	 umulh x10, x1, x4
	 adcs x22, x22, x10
	 mul x10, x1, x6
	 adcs x23, x23, x10
	 umulh x10, x1, x6
	 adcs x24, x24, x10
	 mul x10, x1, x8
	 adcs x25, x25, x10
	 umulh x10, x1, x8
	 adcs x0, x0, x10
	 lsr x4, x1, #1
	 mul x4, x4, x4
	 adc x4, x4, xzr
	 mul x10, x1, x3
	 adds x20, x20, x10
	 umulh x10, x1, x3
	 adcs x21, x21, x10
	 mul x10, x1, x5
	 adcs x22, x22, x10
	 umulh x10, x1, x5
	 adcs x23, x23, x10
	 mul x10, x1, x7
	 adcs x24, x24, x10
	 umulh x10, x1, x7
	 adcs x25, x25, x10
	 mul x10, x1, x9
	 adcs x0, x0, x10
	 umulh x10, x1, x9
	 adc x4, x4, x10
	 mul x2, x2, x2
	 cmp xzr, xzr
	 extr x10, x20, x19, #9
	 adcs x2, x2, x10
	 extr x10, x21, x20, #9
	 adcs x11, x11, x10
	 extr x10, x22, x21, #9
	 adcs x12, x12, x10
	 extr x10, x23, x22, #9
	 adcs x13, x13, x10
	 extr x10, x24, x23, #9
	 adcs x14, x14, x10
	 extr x10, x25, x24, #9
	 adcs x15, x15, x10
	 extr x10, x0, x25, #9
	 adcs x16, x16, x10
	 extr x10, x4, x0, #9
	 adcs x17, x17, x10
	 orr x19, x19, #0xfffffffffffffe00
	 lsr x10, x4, #9
	 adcs x19, x19, x10
	 sbcs x2, x2, xzr
	 sbcs x11, x11, xzr
	 sbcs x12, x12, xzr
	 sbcs x13, x13, xzr
	 sbcs x14, x14, xzr
	 sbcs x15, x15, xzr
	 sbcs x16, x16, xzr
	 sbcs x17, x17, xzr
	 sbc x19, x19, xzr
	 and x19, x19, #0x1ff
	 stp x2, x11, [sp, #(72*6)]
	 stp x12, x13, [sp, #(72*6)+16]
	 stp x14, x15, [sp, #(72*6)+32]
	 stp x16, x17, [sp, #(72*6)+48]
	 str x19, [sp, #(72*6)+64]
        ldp x3, x4, [x27, #0]
	 ldp x5, x6, [sp, #(72*1)]
	 mul x15, x3, x5
	 umulh x16, x3, x5
	 mul x14, x3, x6
	 umulh x17, x3, x6
	 adds x16, x16, x14
	 ldp x7, x8, [sp, #(72*1)+16]
	 mul x14, x3, x7
	 umulh x19, x3, x7
	 adcs x17, x17, x14
	 mul x14, x3, x8
	 umulh x20, x3, x8
	 adcs x19, x19, x14
	 ldp x9, x10, [sp, #(72*1)+32]
	 mul x14, x3, x9
	 umulh x21, x3, x9
	 adcs x20, x20, x14
	 mul x14, x3, x10
	 umulh x22, x3, x10
	 adcs x21, x21, x14
	 ldp x11, x12, [sp, #(72*1)+48]
	 mul x14, x3, x11
	 umulh x23, x3, x11
	 adcs x22, x22, x14
	 ldr x13, [sp, #(72*1)+64]
	 mul x14, x3, x12
	 umulh x24, x3, x12
	 adcs x23, x23, x14
	 mul x14, x3, x13
	 umulh x1, x3, x13
	 adcs x24, x24, x14
	 adc x1, x1, xzr
	 mul x14, x4, x5
	 adds x16, x16, x14
	 mul x14, x4, x6
	 adcs x17, x17, x14
	 mul x14, x4, x7
	 adcs x19, x19, x14
	 mul x14, x4, x8
	 adcs x20, x20, x14
	 mul x14, x4, x9
	 adcs x21, x21, x14
	 mul x14, x4, x10
	 adcs x22, x22, x14
	 mul x14, x4, x11
	 adcs x23, x23, x14
	 mul x14, x4, x12
	 adcs x24, x24, x14
	 mul x14, x4, x13
	 adcs x1, x1, x14
	 cset x0, hs
	 umulh x14, x4, x5
	 adds x17, x17, x14
	 umulh x14, x4, x6
	 adcs x19, x19, x14
	 umulh x14, x4, x7
	 adcs x20, x20, x14
	 umulh x14, x4, x8
	 adcs x21, x21, x14
	 umulh x14, x4, x9
	 adcs x22, x22, x14
	 umulh x14, x4, x10
	 adcs x23, x23, x14
	 umulh x14, x4, x11
	 adcs x24, x24, x14
	 umulh x14, x4, x12
	 adcs x1, x1, x14
	 umulh x14, x4, x13
	 adc x0, x0, x14
	 stp x15, x16, [sp, #(72*3)]
	 ldp x3, x4, [x27, #0 +16]
	 mul x14, x3, x5
	 adds x17, x17, x14
	 mul x14, x3, x6
	 adcs x19, x19, x14
	 mul x14, x3, x7
	 adcs x20, x20, x14
	 mul x14, x3, x8
	 adcs x21, x21, x14
	 mul x14, x3, x9
	 adcs x22, x22, x14
	 mul x14, x3, x10
	 adcs x23, x23, x14
	 mul x14, x3, x11
	 adcs x24, x24, x14
	 mul x14, x3, x12
	 adcs x1, x1, x14
	 mul x14, x3, x13
	 adcs x0, x0, x14
	 cset x15, hs
	 umulh x14, x3, x5
	 adds x19, x19, x14
	 umulh x14, x3, x6
	 adcs x20, x20, x14
	 umulh x14, x3, x7
	 adcs x21, x21, x14
	 umulh x14, x3, x8
	 adcs x22, x22, x14
	 umulh x14, x3, x9
	 adcs x23, x23, x14
	 umulh x14, x3, x10
	 adcs x24, x24, x14
	 umulh x14, x3, x11
	 adcs x1, x1, x14
	 umulh x14, x3, x12
	 adcs x0, x0, x14
	 umulh x14, x3, x13
	 adc x15, x15, x14
	 mul x14, x4, x5
	 adds x19, x19, x14
	 mul x14, x4, x6
	 adcs x20, x20, x14
	 mul x14, x4, x7
	 adcs x21, x21, x14
	 mul x14, x4, x8
	 adcs x22, x22, x14
	 mul x14, x4, x9
	 adcs x23, x23, x14
	 mul x14, x4, x10
	 adcs x24, x24, x14
	 mul x14, x4, x11
	 adcs x1, x1, x14
	 mul x14, x4, x12
	 adcs x0, x0, x14
	 mul x14, x4, x13
	 adcs x15, x15, x14
	 cset x16, hs
	 umulh x14, x4, x5
	 adds x20, x20, x14
	 umulh x14, x4, x6
	 adcs x21, x21, x14
	 umulh x14, x4, x7
	 adcs x22, x22, x14
	 umulh x14, x4, x8
	 adcs x23, x23, x14
	 umulh x14, x4, x9
	 adcs x24, x24, x14
	 umulh x14, x4, x10
	 adcs x1, x1, x14
	 umulh x14, x4, x11
	 adcs x0, x0, x14
	 umulh x14, x4, x12
	 adcs x15, x15, x14
	 umulh x14, x4, x13
	 adc x16, x16, x14
	 stp x17, x19, [sp, #(72*3)+16]
	 ldp x3, x4, [x27, #0 +32]
	 mul x14, x3, x5
	 adds x20, x20, x14
	 mul x14, x3, x6
	 adcs x21, x21, x14
	 mul x14, x3, x7
	 adcs x22, x22, x14
	 mul x14, x3, x8
	 adcs x23, x23, x14
	 mul x14, x3, x9
	 adcs x24, x24, x14
	 mul x14, x3, x10
	 adcs x1, x1, x14
	 mul x14, x3, x11
	 adcs x0, x0, x14
	 mul x14, x3, x12
	 adcs x15, x15, x14
	 mul x14, x3, x13
	 adcs x16, x16, x14
	 cset x17, hs
	 umulh x14, x3, x5
	 adds x21, x21, x14
	 umulh x14, x3, x6
	 adcs x22, x22, x14
	 umulh x14, x3, x7
	 adcs x23, x23, x14
	 umulh x14, x3, x8
	 adcs x24, x24, x14
	 umulh x14, x3, x9
	 adcs x1, x1, x14
	 umulh x14, x3, x10
	 adcs x0, x0, x14
	 umulh x14, x3, x11
	 adcs x15, x15, x14
	 umulh x14, x3, x12
	 adcs x16, x16, x14
	 umulh x14, x3, x13
	 adc x17, x17, x14
	 mul x14, x4, x5
	 adds x21, x21, x14
	 mul x14, x4, x6
	 adcs x22, x22, x14
	 mul x14, x4, x7
	 adcs x23, x23, x14
	 mul x14, x4, x8
	 adcs x24, x24, x14
	 mul x14, x4, x9
	 adcs x1, x1, x14
	 mul x14, x4, x10
	 adcs x0, x0, x14
	 mul x14, x4, x11
	 adcs x15, x15, x14
	 mul x14, x4, x12
	 adcs x16, x16, x14
	 mul x14, x4, x13
	 adcs x17, x17, x14
	 cset x19, hs
	 umulh x14, x4, x5
	 adds x22, x22, x14
	 umulh x14, x4, x6
	 adcs x23, x23, x14
	 umulh x14, x4, x7
	 adcs x24, x24, x14
	 umulh x14, x4, x8
	 adcs x1, x1, x14
	 umulh x14, x4, x9
	 adcs x0, x0, x14
	 umulh x14, x4, x10
	 adcs x15, x15, x14
	 umulh x14, x4, x11
	 adcs x16, x16, x14
	 umulh x14, x4, x12
	 adcs x17, x17, x14
	 umulh x14, x4, x13
	 adc x19, x19, x14
	 stp x20, x21, [sp, #(72*3)+32]
	 ldp x3, x4, [x27, #0 +48]
	 mul x14, x3, x5
	 adds x22, x22, x14
	 mul x14, x3, x6
	 adcs x23, x23, x14
	 mul x14, x3, x7
	 adcs x24, x24, x14
	 mul x14, x3, x8
	 adcs x1, x1, x14
	 mul x14, x3, x9
	 adcs x0, x0, x14
	 mul x14, x3, x10
	 adcs x15, x15, x14
	 mul x14, x3, x11
	 adcs x16, x16, x14
	 mul x14, x3, x12
	 adcs x17, x17, x14
	 mul x14, x3, x13
	 adcs x19, x19, x14
	 cset x20, hs
	 umulh x14, x3, x5
	 adds x23, x23, x14
	 umulh x14, x3, x6
	 adcs x24, x24, x14
	 umulh x14, x3, x7
	 adcs x1, x1, x14
	 umulh x14, x3, x8
	 adcs x0, x0, x14
	 umulh x14, x3, x9
	 adcs x15, x15, x14
	 umulh x14, x3, x10
	 adcs x16, x16, x14
	 umulh x14, x3, x11
	 adcs x17, x17, x14
	 umulh x14, x3, x12
	 adcs x19, x19, x14
	 umulh x14, x3, x13
	 adc x20, x20, x14
	 mul x14, x4, x5
	 adds x23, x23, x14
	 mul x14, x4, x6
	 adcs x24, x24, x14
	 mul x14, x4, x7
	 adcs x1, x1, x14
	 mul x14, x4, x8
	 adcs x0, x0, x14
	 mul x14, x4, x9
	 adcs x15, x15, x14
	 mul x14, x4, x10
	 adcs x16, x16, x14
	 mul x14, x4, x11
	 adcs x17, x17, x14
	 mul x14, x4, x12
	 adcs x19, x19, x14
	 mul x14, x4, x13
	 adcs x20, x20, x14
	 cset x21, hs
	 umulh x14, x4, x5
	 adds x24, x24, x14
	 umulh x14, x4, x6
	 adcs x1, x1, x14
	 umulh x14, x4, x7
	 adcs x0, x0, x14
	 umulh x14, x4, x8
	 adcs x15, x15, x14
	 umulh x14, x4, x9
	 adcs x16, x16, x14
	 umulh x14, x4, x10
	 adcs x17, x17, x14
	 umulh x14, x4, x11
	 adcs x19, x19, x14
	 umulh x14, x4, x12
	 adcs x20, x20, x14
	 umulh x14, x4, x13
	 adc x21, x21, x14
	 stp x22, x23, [sp, #(72*3)+48]
	 ldr x3, [x27, #0 +64]
	 mul x14, x3, x5
	 adds x24, x24, x14
	 mul x14, x3, x6
	 adcs x1, x1, x14
	 mul x14, x3, x7
	 adcs x0, x0, x14
	 mul x14, x3, x8
	 adcs x15, x15, x14
	 mul x14, x3, x9
	 adcs x16, x16, x14
	 mul x14, x3, x10
	 adcs x17, x17, x14
	 mul x14, x3, x11
	 adcs x19, x19, x14
	 mul x14, x3, x12
	 adcs x20, x20, x14
	 mul x14, x3, x13
	 adc x21, x21, x14
	 umulh x14, x3, x5
	 adds x1, x1, x14
	 umulh x14, x3, x6
	 adcs x0, x0, x14
	 umulh x14, x3, x7
	 adcs x15, x15, x14
	 umulh x14, x3, x8
	 adcs x16, x16, x14
	 umulh x14, x3, x9
	 adcs x17, x17, x14
	 umulh x14, x3, x10
	 adcs x19, x19, x14
	 umulh x14, x3, x11
	 adcs x20, x20, x14
	 umulh x14, x3, x12
	 adc x21, x21, x14
	 ldp x5, x6, [sp, #(72*3)]
	 extr x14, x1, x24, #9
	 adds x5, x5, x14
	 extr x14, x0, x1, #9
	 adcs x6, x6, x14
	 ldp x7, x8, [sp, #(72*3)+16]
	 extr x14, x15, x0, #9
	 adcs x7, x7, x14
	 extr x14, x16, x15, #9
	 adcs x8, x8, x14
	 ldp x9, x10, [sp, #(72*3)+32]
	 extr x14, x17, x16, #9
	 adcs x9, x9, x14
	 extr x14, x19, x17, #9
	 adcs x10, x10, x14
	 ldp x11, x12, [sp, #(72*3)+48]
	 extr x14, x20, x19, #9
	 adcs x11, x11, x14
	 extr x14, x21, x20, #9
	 adcs x12, x12, x14
	 and x13, x24, #0x1ff
	 lsr x14, x21, #9
	 adc x13, x13, x14
	 stp x5, x6, [sp, #(72*3)]
	 stp x7, x8, [sp, #(72*3)+16]
	 stp x9, x10, [sp, #(72*3)+32]
	 stp x11, x12, [sp, #(72*3)+48]
	 str x13, [sp, #(72*3)+64]



        ldp x2, x3, [sp, #(72*5)]
	 mul x11, x2, x3
	 umulh x12, x2, x3
	 ldp x4, x5, [sp, #(72*5)+16]
	 mul x10, x2, x4
	 umulh x13, x2, x4
	 adds x12, x12, x10
	 ldp x6, x7, [sp, #(72*5)+32]
	 mul x10, x2, x5
	 umulh x14, x2, x5
	 adcs x13, x13, x10
	 ldp x8, x9, [sp, #(72*5)+48]
	 mul x10, x2, x6
	 umulh x15, x2, x6
	 adcs x14, x14, x10
	 mul x10, x2, x7
	 umulh x16, x2, x7
	 adcs x15, x15, x10
	 mul x10, x2, x8
	 umulh x17, x2, x8
	 adcs x16, x16, x10
	 mul x10, x2, x9
	 umulh x19, x2, x9
	 adcs x17, x17, x10
	 adc x19, x19, xzr
	 mul x10, x3, x4
	 adds x13, x13, x10
	 mul x10, x3, x5
	 adcs x14, x14, x10
	 mul x10, x3, x6
	 adcs x15, x15, x10
	 mul x10, x3, x7
	 adcs x16, x16, x10
	 mul x10, x3, x8
	 adcs x17, x17, x10
	 mul x10, x3, x9
	 adcs x19, x19, x10
	 cset x20, hs
	 umulh x10, x3, x4
	 adds x14, x14, x10
	 umulh x10, x3, x5
	 adcs x15, x15, x10
	 umulh x10, x3, x6
	 adcs x16, x16, x10
	 umulh x10, x3, x7
	 adcs x17, x17, x10
	 umulh x10, x3, x8
	 adcs x19, x19, x10
	 umulh x10, x3, x9
	 adc x20, x20, x10
	 mul x10, x6, x7
	 umulh x21, x6, x7
	 adds x20, x20, x10
	 adc x21, x21, xzr
	 mul x10, x4, x5
	 adds x15, x15, x10
	 mul x10, x4, x6
	 adcs x16, x16, x10
	 mul x10, x4, x7
	 adcs x17, x17, x10
	 mul x10, x4, x8
	 adcs x19, x19, x10
	 mul x10, x4, x9
	 adcs x20, x20, x10
	 mul x10, x6, x8
	 adcs x21, x21, x10
	 cset x22, hs
	 umulh x10, x4, x5
	 adds x16, x16, x10
	 umulh x10, x4, x6
	 adcs x17, x17, x10
	 umulh x10, x4, x7
	 adcs x19, x19, x10
	 umulh x10, x4, x8
	 adcs x20, x20, x10
	 umulh x10, x4, x9
	 adcs x21, x21, x10
	 umulh x10, x6, x8
	 adc x22, x22, x10
	 mul x10, x7, x8
	 umulh x23, x7, x8
	 adds x22, x22, x10
	 adc x23, x23, xzr
	 mul x10, x5, x6
	 adds x17, x17, x10
	 mul x10, x5, x7
	 adcs x19, x19, x10
	 mul x10, x5, x8
	 adcs x20, x20, x10
	 mul x10, x5, x9
	 adcs x21, x21, x10
	 mul x10, x6, x9
	 adcs x22, x22, x10
	 mul x10, x7, x9
	 adcs x23, x23, x10
	 cset x24, hs
	 umulh x10, x5, x6
	 adds x19, x19, x10
	 umulh x10, x5, x7
	 adcs x20, x20, x10
	 umulh x10, x5, x8
	 adcs x21, x21, x10
	 umulh x10, x5, x9
	 adcs x22, x22, x10
	 umulh x10, x6, x9
	 adcs x23, x23, x10
	 umulh x10, x7, x9
	 adc x24, x24, x10
	 mul x10, x8, x9
	 umulh x25, x8, x9
	 adds x24, x24, x10
	 adc x25, x25, xzr
	 adds x11, x11, x11
	 adcs x12, x12, x12
	 adcs x13, x13, x13
	 adcs x14, x14, x14
	 adcs x15, x15, x15
	 adcs x16, x16, x16
	 adcs x17, x17, x17
	 adcs x19, x19, x19
	 adcs x20, x20, x20
	 adcs x21, x21, x21
	 adcs x22, x22, x22
	 adcs x23, x23, x23
	 adcs x24, x24, x24
	 adcs x25, x25, x25
	 cset x0, hs
	 umulh x10, x2, x2
	 adds x11, x11, x10
	 mul x10, x3, x3
	 adcs x12, x12, x10
	 umulh x10, x3, x3
	 adcs x13, x13, x10
	 mul x10, x4, x4
	 adcs x14, x14, x10
	 umulh x10, x4, x4
	 adcs x15, x15, x10
	 mul x10, x5, x5
	 adcs x16, x16, x10
	 umulh x10, x5, x5
	 adcs x17, x17, x10
	 mul x10, x6, x6
	 adcs x19, x19, x10
	 umulh x10, x6, x6
	 adcs x20, x20, x10
	 mul x10, x7, x7
	 adcs x21, x21, x10
	 umulh x10, x7, x7
	 adcs x22, x22, x10
	 mul x10, x8, x8
	 adcs x23, x23, x10
	 umulh x10, x8, x8
	 adcs x24, x24, x10
	 mul x10, x9, x9
	 adcs x25, x25, x10
	 umulh x10, x9, x9
	 adc x0, x0, x10
	 ldr x1, [sp, #(72*5)+64]
	 add x1, x1, x1
	 mul x10, x1, x2
	 adds x19, x19, x10
	 umulh x10, x1, x2
	 adcs x20, x20, x10
	 mul x10, x1, x4
	 adcs x21, x21, x10
	 umulh x10, x1, x4
	 adcs x22, x22, x10
	 mul x10, x1, x6
	 adcs x23, x23, x10
	 umulh x10, x1, x6
	 adcs x24, x24, x10
	 mul x10, x1, x8
	 adcs x25, x25, x10
	 umulh x10, x1, x8
	 adcs x0, x0, x10
	 lsr x4, x1, #1
	 mul x4, x4, x4
	 adc x4, x4, xzr
	 mul x10, x1, x3
	 adds x20, x20, x10
	 umulh x10, x1, x3
	 adcs x21, x21, x10
	 mul x10, x1, x5
	 adcs x22, x22, x10
	 umulh x10, x1, x5
	 adcs x23, x23, x10
	 mul x10, x1, x7
	 adcs x24, x24, x10
	 umulh x10, x1, x7
	 adcs x25, x25, x10
	 mul x10, x1, x9
	 adcs x0, x0, x10
	 umulh x10, x1, x9
	 adc x4, x4, x10
	 mul x2, x2, x2
	 cmp xzr, xzr
	 extr x10, x20, x19, #9
	 adcs x2, x2, x10
	 extr x10, x21, x20, #9
	 adcs x11, x11, x10
	 extr x10, x22, x21, #9
	 adcs x12, x12, x10
	 extr x10, x23, x22, #9
	 adcs x13, x13, x10
	 extr x10, x24, x23, #9
	 adcs x14, x14, x10
	 extr x10, x25, x24, #9
	 adcs x15, x15, x10
	 extr x10, x0, x25, #9
	 adcs x16, x16, x10
	 extr x10, x4, x0, #9
	 adcs x17, x17, x10
	 orr x19, x19, #0xfffffffffffffe00
	 lsr x10, x4, #9
	 adcs x19, x19, x10
	 sbcs x2, x2, xzr
	 sbcs x11, x11, xzr
	 sbcs x12, x12, xzr
	 sbcs x13, x13, xzr
	 sbcs x14, x14, xzr
	 sbcs x15, x15, xzr
	 sbcs x16, x16, xzr
	 sbcs x17, x17, xzr
	 sbc x19, x19, xzr
	 and x19, x19, #0x1ff
	 stp x2, x11, [sp, #(72*4)]
	 stp x12, x13, [sp, #(72*4)+16]
	 stp x14, x15, [sp, #(72*4)+32]
	 stp x16, x17, [sp, #(72*4)+48]
	 str x19, [sp, #(72*4)+64]




        ldp x6, x7, [sp, #(72*3)]
	 mov x1, #(12)
	 mul x3, x1, x6
	 mul x4, x1, x7
	 umulh x6, x1, x6
	 adds x4, x4, x6
	 umulh x7, x1, x7
	 ldp x8, x9, [sp, #(72*3)+16]
	 mul x5, x1, x8
	 mul x6, x1, x9
	 umulh x8, x1, x8
	 adcs x5, x5, x7
	 umulh x9, x1, x9
	 adcs x6, x6, x8
	 ldp x10, x11, [sp, #(72*3)+32]
	 mul x7, x1, x10
	 mul x8, x1, x11
	 umulh x10, x1, x10
	 adcs x7, x7, x9
	 umulh x11, x1, x11
	 adcs x8, x8, x10
	 ldp x12, x13, [sp, #(72*3)+48]
	 mul x9, x1, x12
	 mul x10, x1, x13
	 umulh x12, x1, x12
	 adcs x9, x9, x11
	 umulh x13, x1, x13
	 adcs x10, x10, x12
	 ldr x14, [sp, #(72*3)+64]
	 mul x11, x1, x14
	 adc x11, x11, x13
	 mov x1, #(9)
	 ldp x20, x21, [sp, #(72*6)]
	 mvn x20, x20
	 mul x0, x1, x20
	 umulh x20, x1, x20
	 adds x3, x3, x0
	 mvn x21, x21
	 mul x0, x1, x21
	 umulh x21, x1, x21
	 adcs x4, x4, x0
	 ldp x22, x23, [sp, #(72*6)+16]
	 mvn x22, x22
	 mul x0, x1, x22
	 umulh x22, x1, x22
	 adcs x5, x5, x0
	 mvn x23, x23
	 mul x0, x1, x23
	 umulh x23, x1, x23
	 adcs x6, x6, x0
	 ldp x17, x19, [sp, #(72*6)+32]
	 mvn x17, x17
	 mul x0, x1, x17
	 umulh x17, x1, x17
	 adcs x7, x7, x0
	 mvn x19, x19
	 mul x0, x1, x19
	 umulh x19, x1, x19
	 adcs x8, x8, x0
	 ldp x2, x16, [sp, #(72*6)+48]
	 mvn x2, x2
	 mul x0, x1, x2
	 umulh x2, x1, x2
	 adcs x9, x9, x0
	 mvn x16, x16
	 mul x0, x1, x16
	 umulh x16, x1, x16
	 adcs x10, x10, x0
	 ldr x0, [sp, #(72*6)+64]
	 eor x0, x0, #0x1ff
	 mul x0, x1, x0
	 adc x11, x11, x0
	 adds x4, x4, x20
	 adcs x5, x5, x21
	 and x15, x4, x5
	 adcs x6, x6, x22
	 and x15, x15, x6
	 adcs x7, x7, x23
	 and x15, x15, x7
	 adcs x8, x8, x17
	 and x15, x15, x8
	 adcs x9, x9, x19
	 and x15, x15, x9
	 adcs x10, x10, x2
	 and x15, x15, x10
	 adc x11, x11, x16
	 lsr x12, x11, #9
	 orr x11, x11, #0xfffffffffffffe00
	 cmp xzr, xzr
	 adcs xzr, x3, x12
	 adcs xzr, x15, xzr
	 adcs xzr, x11, xzr
	 adcs x3, x3, x12
	 adcs x4, x4, xzr
	 adcs x5, x5, xzr
	 adcs x6, x6, xzr
	 adcs x7, x7, xzr
	 adcs x8, x8, xzr
	 adcs x9, x9, xzr
	 adcs x10, x10, xzr
	 adc x11, x11, xzr
	 and x11, x11, #0x1ff
	 stp x3, x4, [sp, #(72*6)]
	 stp x5, x6, [sp, #(72*6)+16]
	 stp x7, x8, [sp, #(72*6)+32]
	 stp x9, x10, [sp, #(72*6)+48]
	 str x11, [sp, #(72*6)+64]
        ldp x5, x6, [sp, #(72*4)]
	 ldp x4, x3, [sp, #(72*0)]
	 subs x5, x5, x4
	 sbcs x6, x6, x3
	 ldp x7, x8, [sp, #(72*4)+16]
	 ldp x4, x3, [sp, #(72*0)+16]
	 sbcs x7, x7, x4
	 sbcs x8, x8, x3
	 ldp x9, x10, [sp, #(72*4)+32]
	 ldp x4, x3, [sp, #(72*0)+32]
	 sbcs x9, x9, x4
	 sbcs x10, x10, x3
	 ldp x11, x12, [sp, #(72*4)+48]
	 ldp x4, x3, [sp, #(72*0)+48]
	 sbcs x11, x11, x4
	 sbcs x12, x12, x3
	 ldr x13, [sp, #(72*4)+64]
	 ldr x4, [sp, #(72*0)+64]
	 sbcs x13, x13, x4
	 sbcs x5, x5, xzr
	 sbcs x6, x6, xzr
	 sbcs x7, x7, xzr
	 sbcs x8, x8, xzr
	 sbcs x9, x9, xzr
	 sbcs x10, x10, xzr
	 sbcs x11, x11, xzr
	 sbcs x12, x12, xzr
	 sbcs x13, x13, xzr
	 and x13, x13, #0x1ff
	 stp x5, x6, [sp, #(72*5)]
	 stp x7, x8, [sp, #(72*5)+16]
	 stp x9, x10, [sp, #(72*5)+32]
	 stp x11, x12, [sp, #(72*5)+48]
	 str x13, [sp, #(72*5)+64]



        ldp x2, x3, [sp, #(72*1)]
	 mul x11, x2, x3
	 umulh x12, x2, x3
	 ldp x4, x5, [sp, #(72*1)+16]
	 mul x10, x2, x4
	 umulh x13, x2, x4
	 adds x12, x12, x10
	 ldp x6, x7, [sp, #(72*1)+32]
	 mul x10, x2, x5
	 umulh x14, x2, x5
	 adcs x13, x13, x10
	 ldp x8, x9, [sp, #(72*1)+48]
	 mul x10, x2, x6
	 umulh x15, x2, x6
	 adcs x14, x14, x10
	 mul x10, x2, x7
	 umulh x16, x2, x7
	 adcs x15, x15, x10
	 mul x10, x2, x8
	 umulh x17, x2, x8
	 adcs x16, x16, x10
	 mul x10, x2, x9
	 umulh x19, x2, x9
	 adcs x17, x17, x10
	 adc x19, x19, xzr
	 mul x10, x3, x4
	 adds x13, x13, x10
	 mul x10, x3, x5
	 adcs x14, x14, x10
	 mul x10, x3, x6
	 adcs x15, x15, x10
	 mul x10, x3, x7
	 adcs x16, x16, x10
	 mul x10, x3, x8
	 adcs x17, x17, x10
	 mul x10, x3, x9
	 adcs x19, x19, x10
	 cset x20, hs
	 umulh x10, x3, x4
	 adds x14, x14, x10
	 umulh x10, x3, x5
	 adcs x15, x15, x10
	 umulh x10, x3, x6
	 adcs x16, x16, x10
	 umulh x10, x3, x7
	 adcs x17, x17, x10
	 umulh x10, x3, x8
	 adcs x19, x19, x10
	 umulh x10, x3, x9
	 adc x20, x20, x10
	 mul x10, x6, x7
	 umulh x21, x6, x7
	 adds x20, x20, x10
	 adc x21, x21, xzr
	 mul x10, x4, x5
	 adds x15, x15, x10
	 mul x10, x4, x6
	 adcs x16, x16, x10
	 mul x10, x4, x7
	 adcs x17, x17, x10
	 mul x10, x4, x8
	 adcs x19, x19, x10
	 mul x10, x4, x9
	 adcs x20, x20, x10
	 mul x10, x6, x8
	 adcs x21, x21, x10
	 cset x22, hs
	 umulh x10, x4, x5
	 adds x16, x16, x10
	 umulh x10, x4, x6
	 adcs x17, x17, x10
	 umulh x10, x4, x7
	 adcs x19, x19, x10
	 umulh x10, x4, x8
	 adcs x20, x20, x10
	 umulh x10, x4, x9
	 adcs x21, x21, x10
	 umulh x10, x6, x8
	 adc x22, x22, x10
	 mul x10, x7, x8
	 umulh x23, x7, x8
	 adds x22, x22, x10
	 adc x23, x23, xzr
	 mul x10, x5, x6
	 adds x17, x17, x10
	 mul x10, x5, x7
	 adcs x19, x19, x10
	 mul x10, x5, x8
	 adcs x20, x20, x10
	 mul x10, x5, x9
	 adcs x21, x21, x10
	 mul x10, x6, x9
	 adcs x22, x22, x10
	 mul x10, x7, x9
	 adcs x23, x23, x10
	 cset x24, hs
	 umulh x10, x5, x6
	 adds x19, x19, x10
	 umulh x10, x5, x7
	 adcs x20, x20, x10
	 umulh x10, x5, x8
	 adcs x21, x21, x10
	 umulh x10, x5, x9
	 adcs x22, x22, x10
	 umulh x10, x6, x9
	 adcs x23, x23, x10
	 umulh x10, x7, x9
	 adc x24, x24, x10
	 mul x10, x8, x9
	 umulh x25, x8, x9
	 adds x24, x24, x10
	 adc x25, x25, xzr
	 adds x11, x11, x11
	 adcs x12, x12, x12
	 adcs x13, x13, x13
	 adcs x14, x14, x14
	 adcs x15, x15, x15
	 adcs x16, x16, x16
	 adcs x17, x17, x17
	 adcs x19, x19, x19
	 adcs x20, x20, x20
	 adcs x21, x21, x21
	 adcs x22, x22, x22
	 adcs x23, x23, x23
	 adcs x24, x24, x24
	 adcs x25, x25, x25
	 cset x0, hs
	 umulh x10, x2, x2
	 adds x11, x11, x10
	 mul x10, x3, x3
	 adcs x12, x12, x10
	 umulh x10, x3, x3
	 adcs x13, x13, x10
	 mul x10, x4, x4
	 adcs x14, x14, x10
	 umulh x10, x4, x4
	 adcs x15, x15, x10
	 mul x10, x5, x5
	 adcs x16, x16, x10
	 umulh x10, x5, x5
	 adcs x17, x17, x10
	 mul x10, x6, x6
	 adcs x19, x19, x10
	 umulh x10, x6, x6
	 adcs x20, x20, x10
	 mul x10, x7, x7
	 adcs x21, x21, x10
	 umulh x10, x7, x7
	 adcs x22, x22, x10
	 mul x10, x8, x8
	 adcs x23, x23, x10
	 umulh x10, x8, x8
	 adcs x24, x24, x10
	 mul x10, x9, x9
	 adcs x25, x25, x10
	 umulh x10, x9, x9
	 adc x0, x0, x10
	 ldr x1, [sp, #(72*1)+64]
	 add x1, x1, x1
	 mul x10, x1, x2
	 adds x19, x19, x10
	 umulh x10, x1, x2
	 adcs x20, x20, x10
	 mul x10, x1, x4
	 adcs x21, x21, x10
	 umulh x10, x1, x4
	 adcs x22, x22, x10
	 mul x10, x1, x6
	 adcs x23, x23, x10
	 umulh x10, x1, x6
	 adcs x24, x24, x10
	 mul x10, x1, x8
	 adcs x25, x25, x10
	 umulh x10, x1, x8
	 adcs x0, x0, x10
	 lsr x4, x1, #1
	 mul x4, x4, x4
	 adc x4, x4, xzr
	 mul x10, x1, x3
	 adds x20, x20, x10
	 umulh x10, x1, x3
	 adcs x21, x21, x10
	 mul x10, x1, x5
	 adcs x22, x22, x10
	 umulh x10, x1, x5
	 adcs x23, x23, x10
	 mul x10, x1, x7
	 adcs x24, x24, x10
	 umulh x10, x1, x7
	 adcs x25, x25, x10
	 mul x10, x1, x9
	 adcs x0, x0, x10
	 umulh x10, x1, x9
	 adc x4, x4, x10
	 mul x2, x2, x2
	 cmp xzr, xzr
	 extr x10, x20, x19, #9
	 adcs x2, x2, x10
	 extr x10, x21, x20, #9
	 adcs x11, x11, x10
	 extr x10, x22, x21, #9
	 adcs x12, x12, x10
	 extr x10, x23, x22, #9
	 adcs x13, x13, x10
	 extr x10, x24, x23, #9
	 adcs x14, x14, x10
	 extr x10, x25, x24, #9
	 adcs x15, x15, x10
	 extr x10, x0, x25, #9
	 adcs x16, x16, x10
	 extr x10, x4, x0, #9
	 adcs x17, x17, x10
	 orr x19, x19, #0xfffffffffffffe00
	 lsr x10, x4, #9
	 adcs x19, x19, x10
	 sbcs x2, x2, xzr
	 sbcs x11, x11, xzr
	 sbcs x12, x12, xzr
	 sbcs x13, x13, xzr
	 sbcs x14, x14, xzr
	 sbcs x15, x15, xzr
	 sbcs x16, x16, xzr
	 sbcs x17, x17, xzr
	 sbc x19, x19, xzr
	 and x19, x19, #0x1ff
	 stp x2, x11, [sp, #(72*4)]
	 stp x12, x13, [sp, #(72*4)+16]
	 stp x14, x15, [sp, #(72*4)+32]
	 stp x16, x17, [sp, #(72*4)+48]
	 str x19, [sp, #(72*4)+64]




        ldp x5, x6, [sp, #(72*5)]
	 ldp x4, x3, [sp, #(72*1)]
	 subs x5, x5, x4
	 sbcs x6, x6, x3
	 ldp x7, x8, [sp, #(72*5)+16]
	 ldp x4, x3, [sp, #(72*1)+16]
	 sbcs x7, x7, x4
	 sbcs x8, x8, x3
	 ldp x9, x10, [sp, #(72*5)+32]
	 ldp x4, x3, [sp, #(72*1)+32]
	 sbcs x9, x9, x4
	 sbcs x10, x10, x3
	 ldp x11, x12, [sp, #(72*5)+48]
	 ldp x4, x3, [sp, #(72*1)+48]
	 sbcs x11, x11, x4
	 sbcs x12, x12, x3
	 ldr x13, [sp, #(72*5)+64]
	 ldr x4, [sp, #(72*1)+64]
	 sbcs x13, x13, x4
	 sbcs x5, x5, xzr
	 sbcs x6, x6, xzr
	 sbcs x7, x7, xzr
	 sbcs x8, x8, xzr
	 sbcs x9, x9, xzr
	 sbcs x10, x10, xzr
	 sbcs x11, x11, xzr
	 sbcs x12, x12, xzr
	 sbcs x13, x13, xzr
	 and x13, x13, #0x1ff
	 stp x5, x6, [x26, #(2*72)]
	 stp x7, x8, [x26, #(2*72)+16]
	 stp x9, x10, [x26, #(2*72)+32]
	 stp x11, x12, [x26, #(2*72)+48]
	 str x13, [x26, #(2*72)+64]
        ldp x3, x4, [sp, #(72*6)]
	 ldp x5, x6, [sp, #(72*2)]
	 mul x15, x3, x5
	 umulh x16, x3, x5
	 mul x14, x3, x6
	 umulh x17, x3, x6
	 adds x16, x16, x14
	 ldp x7, x8, [sp, #(72*2)+16]
	 mul x14, x3, x7
	 umulh x19, x3, x7
	 adcs x17, x17, x14
	 mul x14, x3, x8
	 umulh x20, x3, x8
	 adcs x19, x19, x14
	 ldp x9, x10, [sp, #(72*2)+32]
	 mul x14, x3, x9
	 umulh x21, x3, x9
	 adcs x20, x20, x14
	 mul x14, x3, x10
	 umulh x22, x3, x10
	 adcs x21, x21, x14
	 ldp x11, x12, [sp, #(72*2)+48]
	 mul x14, x3, x11
	 umulh x23, x3, x11
	 adcs x22, x22, x14
	 ldr x13, [sp, #(72*2)+64]
	 mul x14, x3, x12
	 umulh x24, x3, x12
	 adcs x23, x23, x14
	 mul x14, x3, x13
	 umulh x1, x3, x13
	 adcs x24, x24, x14
	 adc x1, x1, xzr
	 mul x14, x4, x5
	 adds x16, x16, x14
	 mul x14, x4, x6
	 adcs x17, x17, x14
	 mul x14, x4, x7
	 adcs x19, x19, x14
	 mul x14, x4, x8
	 adcs x20, x20, x14
	 mul x14, x4, x9
	 adcs x21, x21, x14
	 mul x14, x4, x10
	 adcs x22, x22, x14
	 mul x14, x4, x11
	 adcs x23, x23, x14
	 mul x14, x4, x12
	 adcs x24, x24, x14
	 mul x14, x4, x13
	 adcs x1, x1, x14
	 cset x0, hs
	 umulh x14, x4, x5
	 adds x17, x17, x14
	 umulh x14, x4, x6
	 adcs x19, x19, x14
	 umulh x14, x4, x7
	 adcs x20, x20, x14
	 umulh x14, x4, x8
	 adcs x21, x21, x14
	 umulh x14, x4, x9
	 adcs x22, x22, x14
	 umulh x14, x4, x10
	 adcs x23, x23, x14
	 umulh x14, x4, x11
	 adcs x24, x24, x14
	 umulh x14, x4, x12
	 adcs x1, x1, x14
	 umulh x14, x4, x13
	 adc x0, x0, x14
	 stp x15, x16, [sp, #(72*5)]
	 ldp x3, x4, [sp, #(72*6)+16]
	 mul x14, x3, x5
	 adds x17, x17, x14
	 mul x14, x3, x6
	 adcs x19, x19, x14
	 mul x14, x3, x7
	 adcs x20, x20, x14
	 mul x14, x3, x8
	 adcs x21, x21, x14
	 mul x14, x3, x9
	 adcs x22, x22, x14
	 mul x14, x3, x10
	 adcs x23, x23, x14
	 mul x14, x3, x11
	 adcs x24, x24, x14
	 mul x14, x3, x12
	 adcs x1, x1, x14
	 mul x14, x3, x13
	 adcs x0, x0, x14
	 cset x15, hs
	 umulh x14, x3, x5
	 adds x19, x19, x14
	 umulh x14, x3, x6
	 adcs x20, x20, x14
	 umulh x14, x3, x7
	 adcs x21, x21, x14
	 umulh x14, x3, x8
	 adcs x22, x22, x14
	 umulh x14, x3, x9
	 adcs x23, x23, x14
	 umulh x14, x3, x10
	 adcs x24, x24, x14
	 umulh x14, x3, x11
	 adcs x1, x1, x14
	 umulh x14, x3, x12
	 adcs x0, x0, x14
	 umulh x14, x3, x13
	 adc x15, x15, x14
	 mul x14, x4, x5
	 adds x19, x19, x14
	 mul x14, x4, x6
	 adcs x20, x20, x14
	 mul x14, x4, x7
	 adcs x21, x21, x14
	 mul x14, x4, x8
	 adcs x22, x22, x14
	 mul x14, x4, x9
	 adcs x23, x23, x14
	 mul x14, x4, x10
	 adcs x24, x24, x14
	 mul x14, x4, x11
	 adcs x1, x1, x14
	 mul x14, x4, x12
	 adcs x0, x0, x14
	 mul x14, x4, x13
	 adcs x15, x15, x14
	 cset x16, hs
	 umulh x14, x4, x5
	 adds x20, x20, x14
	 umulh x14, x4, x6
	 adcs x21, x21, x14
	 umulh x14, x4, x7
	 adcs x22, x22, x14
	 umulh x14, x4, x8
	 adcs x23, x23, x14
	 umulh x14, x4, x9
	 adcs x24, x24, x14
	 umulh x14, x4, x10
	 adcs x1, x1, x14
	 umulh x14, x4, x11
	 adcs x0, x0, x14
	 umulh x14, x4, x12
	 adcs x15, x15, x14
	 umulh x14, x4, x13
	 adc x16, x16, x14
	 stp x17, x19, [sp, #(72*5)+16]
	 ldp x3, x4, [sp, #(72*6)+32]
	 mul x14, x3, x5
	 adds x20, x20, x14
	 mul x14, x3, x6
	 adcs x21, x21, x14
	 mul x14, x3, x7
	 adcs x22, x22, x14
	 mul x14, x3, x8
	 adcs x23, x23, x14
	 mul x14, x3, x9
	 adcs x24, x24, x14
	 mul x14, x3, x10
	 adcs x1, x1, x14
	 mul x14, x3, x11
	 adcs x0, x0, x14
	 mul x14, x3, x12
	 adcs x15, x15, x14
	 mul x14, x3, x13
	 adcs x16, x16, x14
	 cset x17, hs
	 umulh x14, x3, x5
	 adds x21, x21, x14
	 umulh x14, x3, x6
	 adcs x22, x22, x14
	 umulh x14, x3, x7
	 adcs x23, x23, x14
	 umulh x14, x3, x8
	 adcs x24, x24, x14
	 umulh x14, x3, x9
	 adcs x1, x1, x14
	 umulh x14, x3, x10
	 adcs x0, x0, x14
	 umulh x14, x3, x11
	 adcs x15, x15, x14
	 umulh x14, x3, x12
	 adcs x16, x16, x14
	 umulh x14, x3, x13
	 adc x17, x17, x14
	 mul x14, x4, x5
	 adds x21, x21, x14
	 mul x14, x4, x6
	 adcs x22, x22, x14
	 mul x14, x4, x7
	 adcs x23, x23, x14
	 mul x14, x4, x8
	 adcs x24, x24, x14
	 mul x14, x4, x9
	 adcs x1, x1, x14
	 mul x14, x4, x10
	 adcs x0, x0, x14
	 mul x14, x4, x11
	 adcs x15, x15, x14
	 mul x14, x4, x12
	 adcs x16, x16, x14
	 mul x14, x4, x13
	 adcs x17, x17, x14
	 cset x19, hs
	 umulh x14, x4, x5
	 adds x22, x22, x14
	 umulh x14, x4, x6
	 adcs x23, x23, x14
	 umulh x14, x4, x7
	 adcs x24, x24, x14
	 umulh x14, x4, x8
	 adcs x1, x1, x14
	 umulh x14, x4, x9
	 adcs x0, x0, x14
	 umulh x14, x4, x10
	 adcs x15, x15, x14
	 umulh x14, x4, x11
	 adcs x16, x16, x14
	 umulh x14, x4, x12
	 adcs x17, x17, x14
	 umulh x14, x4, x13
	 adc x19, x19, x14
	 stp x20, x21, [sp, #(72*5)+32]
	 ldp x3, x4, [sp, #(72*6)+48]
	 mul x14, x3, x5
	 adds x22, x22, x14
	 mul x14, x3, x6
	 adcs x23, x23, x14
	 mul x14, x3, x7
	 adcs x24, x24, x14
	 mul x14, x3, x8
	 adcs x1, x1, x14
	 mul x14, x3, x9
	 adcs x0, x0, x14
	 mul x14, x3, x10
	 adcs x15, x15, x14
	 mul x14, x3, x11
	 adcs x16, x16, x14
	 mul x14, x3, x12
	 adcs x17, x17, x14
	 mul x14, x3, x13
	 adcs x19, x19, x14
	 cset x20, hs
	 umulh x14, x3, x5
	 adds x23, x23, x14
	 umulh x14, x3, x6
	 adcs x24, x24, x14
	 umulh x14, x3, x7
	 adcs x1, x1, x14
	 umulh x14, x3, x8
	 adcs x0, x0, x14
	 umulh x14, x3, x9
	 adcs x15, x15, x14
	 umulh x14, x3, x10
	 adcs x16, x16, x14
	 umulh x14, x3, x11
	 adcs x17, x17, x14
	 umulh x14, x3, x12
	 adcs x19, x19, x14
	 umulh x14, x3, x13
	 adc x20, x20, x14
	 mul x14, x4, x5
	 adds x23, x23, x14
	 mul x14, x4, x6
	 adcs x24, x24, x14
	 mul x14, x4, x7
	 adcs x1, x1, x14
	 mul x14, x4, x8
	 adcs x0, x0, x14
	 mul x14, x4, x9
	 adcs x15, x15, x14
	 mul x14, x4, x10
	 adcs x16, x16, x14
	 mul x14, x4, x11
	 adcs x17, x17, x14
	 mul x14, x4, x12
	 adcs x19, x19, x14
	 mul x14, x4, x13
	 adcs x20, x20, x14
	 cset x21, hs
	 umulh x14, x4, x5
	 adds x24, x24, x14
	 umulh x14, x4, x6
	 adcs x1, x1, x14
	 umulh x14, x4, x7
	 adcs x0, x0, x14
	 umulh x14, x4, x8
	 adcs x15, x15, x14
	 umulh x14, x4, x9
	 adcs x16, x16, x14
	 umulh x14, x4, x10
	 adcs x17, x17, x14
	 umulh x14, x4, x11
	 adcs x19, x19, x14
	 umulh x14, x4, x12
	 adcs x20, x20, x14
	 umulh x14, x4, x13
	 adc x21, x21, x14
	 stp x22, x23, [sp, #(72*5)+48]
	 ldr x3, [sp, #(72*6)+64]
	 mul x14, x3, x5
	 adds x24, x24, x14
	 mul x14, x3, x6
	 adcs x1, x1, x14
	 mul x14, x3, x7
	 adcs x0, x0, x14
	 mul x14, x3, x8
	 adcs x15, x15, x14
	 mul x14, x3, x9
	 adcs x16, x16, x14
	 mul x14, x3, x10
	 adcs x17, x17, x14
	 mul x14, x3, x11
	 adcs x19, x19, x14
	 mul x14, x3, x12
	 adcs x20, x20, x14
	 mul x14, x3, x13
	 adc x21, x21, x14
	 umulh x14, x3, x5
	 adds x1, x1, x14
	 umulh x14, x3, x6
	 adcs x0, x0, x14
	 umulh x14, x3, x7
	 adcs x15, x15, x14
	 umulh x14, x3, x8
	 adcs x16, x16, x14
	 umulh x14, x3, x9
	 adcs x17, x17, x14
	 umulh x14, x3, x10
	 adcs x19, x19, x14
	 umulh x14, x3, x11
	 adcs x20, x20, x14
	 umulh x14, x3, x12
	 adc x21, x21, x14
	 ldp x5, x6, [sp, #(72*5)]
	 extr x14, x1, x24, #9
	 adds x5, x5, x14
	 extr x14, x0, x1, #9
	 adcs x6, x6, x14
	 ldp x7, x8, [sp, #(72*5)+16]
	 extr x14, x15, x0, #9
	 adcs x7, x7, x14
	 extr x14, x16, x15, #9
	 adcs x8, x8, x14
	 ldp x9, x10, [sp, #(72*5)+32]
	 extr x14, x17, x16, #9
	 adcs x9, x9, x14
	 extr x14, x19, x17, #9
	 adcs x10, x10, x14
	 ldp x11, x12, [sp, #(72*5)+48]
	 extr x14, x20, x19, #9
	 adcs x11, x11, x14
	 extr x14, x21, x20, #9
	 adcs x12, x12, x14
	 and x13, x24, #0x1ff
	 lsr x14, x21, #9
	 adc x13, x13, x14
	 stp x5, x6, [sp, #(72*5)]
	 stp x7, x8, [sp, #(72*5)+16]
	 stp x9, x10, [sp, #(72*5)+32]
	 stp x11, x12, [sp, #(72*5)+48]
	 str x13, [sp, #(72*5)+64]



        ldp x6, x7, [sp, #(72*3)]
	 lsl x3, x6, #2
	 extr x4, x7, x6, #62
	 ldp x8, x9, [sp, #(72*3)+16]
	 extr x5, x8, x7, #62
	 extr x6, x9, x8, #62
	 ldp x10, x11, [sp, #(72*3)+32]
	 extr x7, x10, x9, #62
	 extr x8, x11, x10, #62
	 ldp x12, x13, [sp, #(72*3)+48]
	 extr x9, x12, x11, #62
	 extr x10, x13, x12, #62
	 ldr x14, [sp, #(72*3)+64]
	 extr x11, x14, x13, #62
	 ldp x0, x1, [sp, #(72*6)]
	 mvn x0, x0
	 adds x3, x3, x0
	 sbcs x4, x4, x1
	 ldp x0, x1, [sp, #(72*6)+16]
	 sbcs x5, x5, x0
	 and x15, x4, x5
	 sbcs x6, x6, x1
	 and x15, x15, x6
	 ldp x0, x1, [sp, #(72*6)+32]
	 sbcs x7, x7, x0
	 and x15, x15, x7
	 sbcs x8, x8, x1
	 and x15, x15, x8
	 ldp x0, x1, [sp, #(72*6)+48]
	 sbcs x9, x9, x0
	 and x15, x15, x9
	 sbcs x10, x10, x1
	 and x15, x15, x10
	 ldr x0, [sp, #(72*6)+64]
	 eor x0, x0, #0x1ff
	 adc x11, x11, x0
	 lsr x12, x11, #9
	 orr x11, x11, #0xfffffffffffffe00
	 cmp xzr, xzr
	 adcs xzr, x3, x12
	 adcs xzr, x15, xzr
	 adcs xzr, x11, xzr
	 adcs x3, x3, x12
	 adcs x4, x4, xzr
	 adcs x5, x5, xzr
	 adcs x6, x6, xzr
	 adcs x7, x7, xzr
	 adcs x8, x8, xzr
	 adcs x9, x9, xzr
	 adcs x10, x10, xzr
	 adc x11, x11, xzr
	 and x11, x11, #0x1ff
	 stp x3, x4, [x26, #0]
	 stp x5, x6, [x26, #0 +16]
	 stp x7, x8, [x26, #0 +32]
	 stp x9, x10, [x26, #0 +48]
	 str x11, [x26, #0 +64]



        ldp x6, x7, [sp, #(72*5)]
	 lsl x3, x6, #1
	 adds x3, x3, x6
	 extr x4, x7, x6, #63
	 adcs x4, x4, x7
	 ldp x8, x9, [sp, #(72*5)+16]
	 extr x5, x8, x7, #63
	 adcs x5, x5, x8
	 extr x6, x9, x8, #63
	 adcs x6, x6, x9
	 ldp x10, x11, [sp, #(72*5)+32]
	 extr x7, x10, x9, #63
	 adcs x7, x7, x10
	 extr x8, x11, x10, #63
	 adcs x8, x8, x11
	 ldp x12, x13, [sp, #(72*5)+48]
	 extr x9, x12, x11, #63
	 adcs x9, x9, x12
	 extr x10, x13, x12, #63
	 adcs x10, x10, x13
	 ldr x14, [sp, #(72*5)+64]
	 extr x11, x14, x13, #63
	 adc x11, x11, x14
	 ldp x20, x21, [sp, #(72*4)]
	 mvn x20, x20
	 lsl x0, x20, #3
	 adds x3, x3, x0
	 mvn x21, x21
	 extr x0, x21, x20, #61
	 adcs x4, x4, x0
	 ldp x22, x23, [sp, #(72*4)+16]
	 mvn x22, x22
	 extr x0, x22, x21, #61
	 adcs x5, x5, x0
	 and x15, x4, x5
	 mvn x23, x23
	 extr x0, x23, x22, #61
	 adcs x6, x6, x0
	 and x15, x15, x6
	 ldp x20, x21, [sp, #(72*4)+32]
	 mvn x20, x20
	 extr x0, x20, x23, #61
	 adcs x7, x7, x0
	 and x15, x15, x7
	 mvn x21, x21
	 extr x0, x21, x20, #61
	 adcs x8, x8, x0
	 and x15, x15, x8
	 ldp x22, x23, [sp, #(72*4)+48]
	 mvn x22, x22
	 extr x0, x22, x21, #61
	 adcs x9, x9, x0
	 and x15, x15, x9
	 mvn x23, x23
	 extr x0, x23, x22, #61
	 adcs x10, x10, x0
	 and x15, x15, x10
	 ldr x0, [sp, #(72*4)+64]
	 eor x0, x0, #0x1ff
	 extr x0, x0, x23, #61
	 adc x11, x11, x0
	 lsr x12, x11, #9
	 orr x11, x11, #0xfffffffffffffe00
	 cmp xzr, xzr
	 adcs xzr, x3, x12
	 adcs xzr, x15, xzr
	 adcs xzr, x11, xzr
	 adcs x3, x3, x12
	 adcs x4, x4, xzr
	 adcs x5, x5, xzr
	 adcs x6, x6, xzr
	 adcs x7, x7, xzr
	 adcs x8, x8, xzr
	 adcs x9, x9, xzr
	 adcs x10, x10, xzr
	 adc x11, x11, xzr
	 and x11, x11, #0x1ff
	 stp x3, x4, [x26, #72]
	 stp x5, x6, [x26, #72 +16]
	 stp x7, x8, [x26, #72 +32]
	 stp x9, x10, [x26, #72 +48]
	 str x11, [x26, #72 +64]



        add sp, sp, (72*7+8)

        ldp x27, x28, [sp], 16
        ldp x25, x26, [sp], 16
        ldp x23, x24, [sp], 16
        ldp x21, x22, [sp], 16
        ldp x19, x20, [sp], 16

        ret
