# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p384/p384_montjscalarmul_alt.S"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 467 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p384/p384_montjscalarmul_alt.S" 2
# 29 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p384/p384_montjscalarmul_alt.S"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/include/_internal_s2n_bignum.h" 1
# 30 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p384/p384_montjscalarmul_alt.S" 2

        .globl _p384_montjscalarmul_alt


        .text
        .balign 4
# 102 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p384/p384_montjscalarmul_alt.S"
_p384_montjscalarmul_alt:

        stp x19, x20, [sp, #-16]!
        stp x21, x22, [sp, #-16]!
        stp x23, x24, [sp, #-16]!
        stp x25, x30, [sp, #-16]!
        sub sp, sp, #(55*48)



        mov x25, x0




        ldp x3, x4, [x1]
        movz x15, #0x2973
	 movk x15, #0xccc5, lsl #16
	 movk x15, #0x196a, lsl #32
	 movk x15, #0xecec, lsl #48
        ldp x5, x6, [x1, #16]
        movz x16, #0xa77a
	 movk x16, #0x48b0, lsl #16
	 movk x16, #0x0db2, lsl #32
	 movk x16, #0x581a, lsl #48
        ldp x7, x8, [x1, #32]
        movz x17, #0x2ddf
	 movk x17, #0xf437, lsl #16
	 movk x17, #0x4d81, lsl #32
	 movk x17, #0xc763, lsl #48

        subs x9, x3, x15
        sbcs x10, x4, x16
        sbcs x11, x5, x17
        adcs x12, x6, xzr
        adcs x13, x7, xzr
        adcs x14, x8, xzr

        csel x3, x3, x9, cc
        csel x4, x4, x10, cc
        csel x5, x5, x11, cc
        csel x6, x6, x12, cc
        csel x7, x7, x13, cc
        csel x8, x8, x14, cc

        stp x3, x4, [sp, #(0*48)]
        stp x5, x6, [sp, #(0*48)+16]
        stp x7, x8, [sp, #(0*48)+32]



        ldp x10, x11, [x2]
        stp x10, x11, [sp, #(7*48)]
        ldp x12, x13, [x2, #16]
        stp x12, x13, [sp, #(7*48)+16]
        ldp x14, x15, [x2, #32]
        stp x14, x15, [sp, #(7*48)+32]

        ldp x10, x11, [x2, #48]
        stp x10, x11, [sp, #(7*48)+48]
        ldp x12, x13, [x2, #64]
        stp x12, x13, [sp, #(7*48)+64]
        ldp x14, x15, [x2, #80]
        stp x14, x15, [sp, #(7*48)+80]

        ldp x10, x11, [x2, #96]
        stp x10, x11, [sp, #(7*48)+96]
        ldp x12, x13, [x2, #112]
        stp x12, x13, [sp, #(7*48)+112]
        ldp x14, x15, [x2, #128]
        stp x14, x15, [sp, #(7*48)+128]



        add x0, sp, #(7*48)+(3*48)*1
        add x1, sp, #(7*48)
        bl p384_montjscalarmul_alt_p384_montjdouble

        add x0, sp, #(7*48)+(3*48)*2
        add x1, sp, #(7*48)+(3*48)*1
        add x2, sp, #(7*48)
        bl p384_montjscalarmul_alt_p384_montjadd

        add x0, sp, #(7*48)+(3*48)*3
        add x1, sp, #(7*48)+(3*48)*1
        bl p384_montjscalarmul_alt_p384_montjdouble

        add x0, sp, #(7*48)+(3*48)*4
        add x1, sp, #(7*48)+(3*48)*3
        add x2, sp, #(7*48)
        bl p384_montjscalarmul_alt_p384_montjadd

        add x0, sp, #(7*48)+(3*48)*5
        add x1, sp, #(7*48)+(3*48)*2
        bl p384_montjscalarmul_alt_p384_montjdouble

        add x0, sp, #(7*48)+(3*48)*6
        add x1, sp, #(7*48)+(3*48)*5
        add x2, sp, #(7*48)
        bl p384_montjscalarmul_alt_p384_montjadd

        add x0, sp, #(7*48)+(3*48)*7
        add x1, sp, #(7*48)+(3*48)*3
        bl p384_montjscalarmul_alt_p384_montjdouble

        add x0, sp, #(7*48)+(3*48)*8
        add x1, sp, #(7*48)+(3*48)*7
        add x2, sp, #(7*48)
        bl p384_montjscalarmul_alt_p384_montjadd

        add x0, sp, #(7*48)+(3*48)*9
        add x1, sp, #(7*48)+(3*48)*4
        bl p384_montjscalarmul_alt_p384_montjdouble

        add x0, sp, #(7*48)+(3*48)*10
        add x1, sp, #(7*48)+(3*48)*9
        add x2, sp, #(7*48)
        bl p384_montjscalarmul_alt_p384_montjadd

        add x0, sp, #(7*48)+(3*48)*11
        add x1, sp, #(7*48)+(3*48)*5
        bl p384_montjscalarmul_alt_p384_montjdouble

        add x0, sp, #(7*48)+(3*48)*12
        add x1, sp, #(7*48)+(3*48)*11
        add x2, sp, #(7*48)
        bl p384_montjscalarmul_alt_p384_montjadd

        add x0, sp, #(7*48)+(3*48)*13
        add x1, sp, #(7*48)+(3*48)*6
        bl p384_montjscalarmul_alt_p384_montjdouble

        add x0, sp, #(7*48)+(3*48)*14
        add x1, sp, #(7*48)+(3*48)*13
        add x2, sp, #(7*48)
        bl p384_montjscalarmul_alt_p384_montjadd

        add x0, sp, #(7*48)+(3*48)*15
        add x1, sp, #(7*48)+(3*48)*7
        bl p384_montjscalarmul_alt_p384_montjdouble
# 245 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/p384/p384_montjscalarmul_alt.S"
        ldp x0, x1, [sp, #(0*48)]
        ldp x2, x3, [sp, #(0*48)+16]
        ldp x4, x5, [sp, #(0*48)+32]
        movz x8, #0x8421
	 movk x8, #0x4210, lsl #16
	 movk x8, #0x2108, lsl #32
	 movk x8, #0x1084, lsl #48
        adds x0, x0, x8, lsr #1
        adcs x1, x1, x8
        lsl x8, x8, #1
        adcs x2, x2, x8
        lsl x8, x8, #1
        adcs x3, x3, x8
        lsl x8, x8, #1
        adcs x4, x4, x8
        lsr x8, x8, #4
        adcs x5, x5, x8
        cset x6, cs




        extr x22, x6, x5, #60
        extr x5, x5, x4, #60
        extr x4, x4, x3, #60
        extr x3, x3, x2, #60
        extr x2, x2, x1, #60
        extr x1, x1, x0, #60
        lsl x0, x0, #4
        stp x0, x1, [sp, #(0*48)]
        stp x2, x3, [sp, #(0*48)+16]
        stp x4, x5, [sp, #(0*48)+32]





        mov x0, xzr
        mov x1, xzr
        mov x2, xzr
        mov x3, xzr
        mov x4, xzr
        mov x5, xzr
        mov x6, xzr
        mov x7, xzr
        mov x8, xzr
        mov x9, xzr
        mov x10, xzr
        mov x11, xzr
        mov x12, xzr
        mov x13, xzr
        mov x14, xzr
        mov x15, xzr
        mov x16, xzr
        mov x17, xzr

        add x19, sp, #(7*48)

        cmp x22, #(1*1)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*2)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*3)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*4)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*5)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*6)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*7)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*8)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*9)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*10)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*11)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*12)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*13)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*14)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*15)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*16)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)

        stp x0, x1, [sp, #(1*48)]
        stp x2, x3, [sp, #(1*48)+16]
        stp x4, x5, [sp, #(1*48)+32]
        stp x6, x7, [sp, #(1*48)+48]
        stp x8, x9, [sp, #(1*48)+64]
        stp x10, x11, [sp, #(1*48)+80]
        stp x12, x13, [sp, #(1*48)+96]
        stp x14, x15, [sp, #(1*48)+112]
        stp x16, x17, [sp, #(1*48)+128]

        mov x24, #380





p384_montjscalarmul_alt_mainloop:
        sub x24, x24, #5

        add x0, sp, #(1*48)
        add x1, sp, #(1*48)
        bl p384_montjscalarmul_alt_p384_montjdouble

        add x0, sp, #(1*48)
        add x1, sp, #(1*48)
        bl p384_montjscalarmul_alt_p384_montjdouble

        add x0, sp, #(1*48)
        add x1, sp, #(1*48)
        bl p384_montjscalarmul_alt_p384_montjdouble

        add x0, sp, #(1*48)
        add x1, sp, #(1*48)
        bl p384_montjscalarmul_alt_p384_montjdouble

        add x0, sp, #(1*48)
        add x1, sp, #(1*48)
        bl p384_montjscalarmul_alt_p384_montjdouble



        ldp x0, x1, [sp, #(0*48)]
        ldp x2, x3, [sp, #(0*48)+16]
        ldp x4, x5, [sp, #(0*48)+32]
        lsr x22, x5, #59
        extr x5, x5, x4, #59
        extr x4, x4, x3, #59
        extr x3, x3, x2, #59
        extr x2, x2, x1, #59
        extr x1, x1, x0, #59
        lsl x0, x0, #5
        stp x0, x1, [sp, #(0*48)]
        stp x2, x3, [sp, #(0*48)+16]
        stp x4, x5, [sp, #(0*48)+32]

        subs x22, x22, #16
        cset x23, lo
        cneg x22, x22, lo



        mov x0, xzr
        mov x1, xzr
        mov x2, xzr
        mov x3, xzr
        mov x4, xzr
        mov x5, xzr
        mov x6, xzr
        mov x7, xzr
        mov x8, xzr
        mov x9, xzr
        mov x10, xzr
        mov x11, xzr
        mov x12, xzr
        mov x13, xzr
        mov x14, xzr
        mov x15, xzr
        mov x16, xzr
        mov x17, xzr

        add x19, sp, #(7*48)

        cmp x22, #(1*1)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*2)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*3)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*4)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*5)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*6)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*7)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*8)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*9)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*10)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*11)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*12)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*13)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*14)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*15)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)
        cmp x22, #(1*16)
	 ldp x20, x21, [x19]
	 csel x0, x20, x0, eq
	 csel x1, x21, x1, eq
	 ldp x20, x21, [x19, #16]
	 csel x2, x20, x2, eq
	 csel x3, x21, x3, eq
	 ldp x20, x21, [x19, #32]
	 csel x4, x20, x4, eq
	 csel x5, x21, x5, eq
	 ldp x20, x21, [x19, #48]
	 csel x6, x20, x6, eq
	 csel x7, x21, x7, eq
	 ldp x20, x21, [x19, #64]
	 csel x8, x20, x8, eq
	 csel x9, x21, x9, eq
	 ldp x20, x21, [x19, #80]
	 csel x10, x20, x10, eq
	 csel x11, x21, x11, eq
	 ldp x20, x21, [x19, #96]
	 csel x12, x20, x12, eq
	 csel x13, x21, x13, eq
	 ldp x20, x21, [x19, #112]
	 csel x14, x20, x14, eq
	 csel x15, x21, x15, eq
	 ldp x20, x21, [x19, #128]
	 csel x16, x20, x16, eq
	 csel x17, x21, x17, eq
	 add x19, x19, #(3*48)





        stp x0, x1, [sp, #(4*48)]
        stp x2, x3, [sp, #(4*48)+16]
        stp x4, x5, [sp, #(4*48)+32]

        stp x12, x13, [sp, #(4*48)+96]
        stp x14, x15, [sp, #(4*48)+112]
        stp x16, x17, [sp, #(4*48)+128]

        mov x0, #0x00000000ffffffff
        subs x0, x0, x6
        orr x12, x6, x7
        mov x1, #0xffffffff00000000
        sbcs x1, x1, x7
        orr x13, x8, x9
        mov x2, #0xfffffffffffffffe
        sbcs x2, x2, x8
        orr x14, x10, x11
        mov x5, #0xffffffffffffffff
        sbcs x3, x5, x9
        orr x12, x12, x13
        sbcs x4, x5, x10
        orr x12, x12, x14
        sbcs x5, x5, x11

        cmp x23, xzr
        ccmp x12, xzr, #4, ne

        csel x6, x0, x6, ne
        csel x7, x1, x7, ne
        csel x8, x2, x8, ne
        csel x9, x3, x9, ne
        csel x10, x4, x10, ne
        csel x11, x5, x11, ne

        stp x6, x7, [sp, #(4*48)+48]
        stp x8, x9, [sp, #(4*48)+64]
        stp x10, x11, [sp, #(4*48)+80]



        add x0, sp, #(1*48)
        add x1, sp, #(1*48)
        add x2, sp, #(4*48)
        bl p384_montjscalarmul_alt_p384_montjadd

        cbnz x24, p384_montjscalarmul_alt_mainloop




        ldp x0, x1, [sp, #(1*48)]
        stp x0, x1, [x25]
        ldp x0, x1, [sp, #(1*48)+16]
        stp x0, x1, [x25, #16]
        ldp x0, x1, [sp, #(1*48)+32]
        stp x0, x1, [x25, #32]
        ldp x0, x1, [sp, #(1*48)+48]
        stp x0, x1, [x25, #48]
        ldp x0, x1, [sp, #(1*48)+64]
        stp x0, x1, [x25, #64]
        ldp x0, x1, [sp, #(1*48)+80]
        stp x0, x1, [x25, #80]
        ldp x0, x1, [sp, #(1*48)+96]
        stp x0, x1, [x25, #96]
        ldp x0, x1, [sp, #(1*48)+112]
        stp x0, x1, [x25, #112]
        ldp x0, x1, [sp, #(1*48)+128]
        stp x0, x1, [x25, #128]



        add sp, sp, #(55*48)
        ldp x25, x30, [sp], 16
        ldp x23, x24, [sp], 16
        ldp x21, x22, [sp], 16
        ldp x19, x20, [sp], 16
        ret



p384_montjscalarmul_alt_p384_montjadd:
        stp x19, x20, [sp, #-16]!
        stp x21, x22, [sp, #-16]!
        stp x23, x24, [sp, #-16]!
        stp x25, x26, [sp, #-16]!
        sub sp, sp, #336
        mov x24, x0
        mov x25, x1
        mov x26, x2
        ldp x2, x3, [x25, #96]
        mul x9, x2, x3
        umulh x10, x2, x3
        ldp x4, x5, [x25, #112]
        mul x8, x2, x4
        adds x10, x10, x8
        mul x11, x2, x5
        mul x8, x3, x4
        adcs x11, x11, x8
        umulh x12, x2, x5
        mul x8, x3, x5
        adcs x12, x12, x8
        ldp x6, x7, [x25, #128]
        mul x13, x2, x7
        mul x8, x3, x6
        adcs x13, x13, x8
        umulh x14, x2, x7
        mul x8, x3, x7
        adcs x14, x14, x8
        mul x15, x5, x6
        adcs x15, x15, xzr
        umulh x16, x5, x6
        adc x16, x16, xzr
        umulh x8, x2, x4
        adds x11, x11, x8
        umulh x8, x3, x4
        adcs x12, x12, x8
        umulh x8, x3, x5
        adcs x13, x13, x8
        umulh x8, x3, x6
        adcs x14, x14, x8
        umulh x8, x3, x7
        adcs x15, x15, x8
        adc x16, x16, xzr
        mul x8, x2, x6
        adds x12, x12, x8
        mul x8, x4, x5
        adcs x13, x13, x8
        mul x8, x4, x6
        adcs x14, x14, x8
        mul x8, x4, x7
        adcs x15, x15, x8
        mul x8, x5, x7
        adcs x16, x16, x8
        mul x17, x6, x7
        adcs x17, x17, xzr
        umulh x19, x6, x7
        adc x19, x19, xzr
        umulh x8, x2, x6
        adds x13, x13, x8
        umulh x8, x4, x5
        adcs x14, x14, x8
        umulh x8, x4, x6
        adcs x15, x15, x8
        umulh x8, x4, x7
        adcs x16, x16, x8
        umulh x8, x5, x7
        adcs x17, x17, x8
        adc x19, x19, xzr
        adds x9, x9, x9
        adcs x10, x10, x10
        adcs x11, x11, x11
        adcs x12, x12, x12
        adcs x13, x13, x13
        adcs x14, x14, x14
        adcs x15, x15, x15
        adcs x16, x16, x16
        adcs x17, x17, x17
        adcs x19, x19, x19
        cset x20, hs
        umulh x8, x2, x2
        mul x2, x2, x2
        adds x9, x9, x8
        mul x8, x3, x3
        adcs x10, x10, x8
        umulh x8, x3, x3
        adcs x11, x11, x8
        mul x8, x4, x4
        adcs x12, x12, x8
        umulh x8, x4, x4
        adcs x13, x13, x8
        mul x8, x5, x5
        adcs x14, x14, x8
        umulh x8, x5, x5
        adcs x15, x15, x8
        mul x8, x6, x6
        adcs x16, x16, x8
        umulh x8, x6, x6
        adcs x17, x17, x8
        mul x8, x7, x7
        adcs x19, x19, x8
        umulh x8, x7, x7
        adc x20, x20, x8
        lsl x5, x2, #32
        add x2, x5, x2
        mov x5, #-4294967295
        umulh x5, x5, x2
        mov x4, #4294967295
        mul x3, x4, x2
        umulh x4, x4, x2
        adds x5, x5, x3
        adcs x4, x4, x2
        adc x3, xzr, xzr
        subs x9, x9, x5
        sbcs x10, x10, x4
        sbcs x11, x11, x3
        sbcs x12, x12, xzr
        sbcs x13, x13, xzr
        sbc x2, x2, xzr
        lsl x5, x9, #32
        add x9, x5, x9
        mov x5, #-4294967295
        umulh x5, x5, x9
        mov x4, #4294967295
        mul x3, x4, x9
        umulh x4, x4, x9
        adds x5, x5, x3
        adcs x4, x4, x9
        adc x3, xzr, xzr
        subs x10, x10, x5
        sbcs x11, x11, x4
        sbcs x12, x12, x3
        sbcs x13, x13, xzr
        sbcs x2, x2, xzr
        sbc x9, x9, xzr
        lsl x5, x10, #32
        add x10, x5, x10
        mov x5, #-4294967295
        umulh x5, x5, x10
        mov x4, #4294967295
        mul x3, x4, x10
        umulh x4, x4, x10
        adds x5, x5, x3
        adcs x4, x4, x10
        adc x3, xzr, xzr
        subs x11, x11, x5
        sbcs x12, x12, x4
        sbcs x13, x13, x3
        sbcs x2, x2, xzr
        sbcs x9, x9, xzr
        sbc x10, x10, xzr
        lsl x5, x11, #32
        add x11, x5, x11
        mov x5, #-4294967295
        umulh x5, x5, x11
        mov x4, #4294967295
        mul x3, x4, x11
        umulh x4, x4, x11
        adds x5, x5, x3
        adcs x4, x4, x11
        adc x3, xzr, xzr
        subs x12, x12, x5
        sbcs x13, x13, x4
        sbcs x2, x2, x3
        sbcs x9, x9, xzr
        sbcs x10, x10, xzr
        sbc x11, x11, xzr
        lsl x5, x12, #32
        add x12, x5, x12
        mov x5, #-4294967295
        umulh x5, x5, x12
        mov x4, #4294967295
        mul x3, x4, x12
        umulh x4, x4, x12
        adds x5, x5, x3
        adcs x4, x4, x12
        adc x3, xzr, xzr
        subs x13, x13, x5
        sbcs x2, x2, x4
        sbcs x9, x9, x3
        sbcs x10, x10, xzr
        sbcs x11, x11, xzr
        sbc x12, x12, xzr
        lsl x5, x13, #32
        add x13, x5, x13
        mov x5, #-4294967295
        umulh x5, x5, x13
        mov x4, #4294967295
        mul x3, x4, x13
        umulh x4, x4, x13
        adds x5, x5, x3
        adcs x4, x4, x13
        adc x3, xzr, xzr
        subs x2, x2, x5
        sbcs x9, x9, x4
        sbcs x10, x10, x3
        sbcs x11, x11, xzr
        sbcs x12, x12, xzr
        sbc x13, x13, xzr
        adds x2, x2, x14
        adcs x9, x9, x15
        adcs x10, x10, x16
        adcs x11, x11, x17
        adcs x12, x12, x19
        adcs x13, x13, x20
        mov x14, #-4294967295
        mov x15, #4294967295
        csel x14, x14, xzr, hs
        csel x15, x15, xzr, hs
        cset x16, hs
        adds x2, x2, x14
        adcs x9, x9, x15
        adcs x10, x10, x16
        adcs x11, x11, xzr
        adcs x12, x12, xzr
        adc x13, x13, xzr
        stp x2, x9, [sp]
        stp x10, x11, [sp, #16]
        stp x12, x13, [sp, #32]
        ldp x2, x3, [x26, #96]
        mul x9, x2, x3
        umulh x10, x2, x3
        ldp x4, x5, [x26, #112]
        mul x8, x2, x4
        adds x10, x10, x8
        mul x11, x2, x5
        mul x8, x3, x4
        adcs x11, x11, x8
        umulh x12, x2, x5
        mul x8, x3, x5
        adcs x12, x12, x8
        ldp x6, x7, [x26, #128]
        mul x13, x2, x7
        mul x8, x3, x6
        adcs x13, x13, x8
        umulh x14, x2, x7
        mul x8, x3, x7
        adcs x14, x14, x8
        mul x15, x5, x6
        adcs x15, x15, xzr
        umulh x16, x5, x6
        adc x16, x16, xzr
        umulh x8, x2, x4
        adds x11, x11, x8
        umulh x8, x3, x4
        adcs x12, x12, x8
        umulh x8, x3, x5
        adcs x13, x13, x8
        umulh x8, x3, x6
        adcs x14, x14, x8
        umulh x8, x3, x7
        adcs x15, x15, x8
        adc x16, x16, xzr
        mul x8, x2, x6
        adds x12, x12, x8
        mul x8, x4, x5
        adcs x13, x13, x8
        mul x8, x4, x6
        adcs x14, x14, x8
        mul x8, x4, x7
        adcs x15, x15, x8
        mul x8, x5, x7
        adcs x16, x16, x8
        mul x17, x6, x7
        adcs x17, x17, xzr
        umulh x19, x6, x7
        adc x19, x19, xzr
        umulh x8, x2, x6
        adds x13, x13, x8
        umulh x8, x4, x5
        adcs x14, x14, x8
        umulh x8, x4, x6
        adcs x15, x15, x8
        umulh x8, x4, x7
        adcs x16, x16, x8
        umulh x8, x5, x7
        adcs x17, x17, x8
        adc x19, x19, xzr
        adds x9, x9, x9
        adcs x10, x10, x10
        adcs x11, x11, x11
        adcs x12, x12, x12
        adcs x13, x13, x13
        adcs x14, x14, x14
        adcs x15, x15, x15
        adcs x16, x16, x16
        adcs x17, x17, x17
        adcs x19, x19, x19
        cset x20, hs
        umulh x8, x2, x2
        mul x2, x2, x2
        adds x9, x9, x8
        mul x8, x3, x3
        adcs x10, x10, x8
        umulh x8, x3, x3
        adcs x11, x11, x8
        mul x8, x4, x4
        adcs x12, x12, x8
        umulh x8, x4, x4
        adcs x13, x13, x8
        mul x8, x5, x5
        adcs x14, x14, x8
        umulh x8, x5, x5
        adcs x15, x15, x8
        mul x8, x6, x6
        adcs x16, x16, x8
        umulh x8, x6, x6
        adcs x17, x17, x8
        mul x8, x7, x7
        adcs x19, x19, x8
        umulh x8, x7, x7
        adc x20, x20, x8
        lsl x5, x2, #32
        add x2, x5, x2
        mov x5, #-4294967295
        umulh x5, x5, x2
        mov x4, #4294967295
        mul x3, x4, x2
        umulh x4, x4, x2
        adds x5, x5, x3
        adcs x4, x4, x2
        adc x3, xzr, xzr
        subs x9, x9, x5
        sbcs x10, x10, x4
        sbcs x11, x11, x3
        sbcs x12, x12, xzr
        sbcs x13, x13, xzr
        sbc x2, x2, xzr
        lsl x5, x9, #32
        add x9, x5, x9
        mov x5, #-4294967295
        umulh x5, x5, x9
        mov x4, #4294967295
        mul x3, x4, x9
        umulh x4, x4, x9
        adds x5, x5, x3
        adcs x4, x4, x9
        adc x3, xzr, xzr
        subs x10, x10, x5
        sbcs x11, x11, x4
        sbcs x12, x12, x3
        sbcs x13, x13, xzr
        sbcs x2, x2, xzr
        sbc x9, x9, xzr
        lsl x5, x10, #32
        add x10, x5, x10
        mov x5, #-4294967295
        umulh x5, x5, x10
        mov x4, #4294967295
        mul x3, x4, x10
        umulh x4, x4, x10
        adds x5, x5, x3
        adcs x4, x4, x10
        adc x3, xzr, xzr
        subs x11, x11, x5
        sbcs x12, x12, x4
        sbcs x13, x13, x3
        sbcs x2, x2, xzr
        sbcs x9, x9, xzr
        sbc x10, x10, xzr
        lsl x5, x11, #32
        add x11, x5, x11
        mov x5, #-4294967295
        umulh x5, x5, x11
        mov x4, #4294967295
        mul x3, x4, x11
        umulh x4, x4, x11
        adds x5, x5, x3
        adcs x4, x4, x11
        adc x3, xzr, xzr
        subs x12, x12, x5
        sbcs x13, x13, x4
        sbcs x2, x2, x3
        sbcs x9, x9, xzr
        sbcs x10, x10, xzr
        sbc x11, x11, xzr
        lsl x5, x12, #32
        add x12, x5, x12
        mov x5, #-4294967295
        umulh x5, x5, x12
        mov x4, #4294967295
        mul x3, x4, x12
        umulh x4, x4, x12
        adds x5, x5, x3
        adcs x4, x4, x12
        adc x3, xzr, xzr
        subs x13, x13, x5
        sbcs x2, x2, x4
        sbcs x9, x9, x3
        sbcs x10, x10, xzr
        sbcs x11, x11, xzr
        sbc x12, x12, xzr
        lsl x5, x13, #32
        add x13, x5, x13
        mov x5, #-4294967295
        umulh x5, x5, x13
        mov x4, #4294967295
        mul x3, x4, x13
        umulh x4, x4, x13
        adds x5, x5, x3
        adcs x4, x4, x13
        adc x3, xzr, xzr
        subs x2, x2, x5
        sbcs x9, x9, x4
        sbcs x10, x10, x3
        sbcs x11, x11, xzr
        sbcs x12, x12, xzr
        sbc x13, x13, xzr
        adds x2, x2, x14
        adcs x9, x9, x15
        adcs x10, x10, x16
        adcs x11, x11, x17
        adcs x12, x12, x19
        adcs x13, x13, x20
        mov x14, #-4294967295
        mov x15, #4294967295
        csel x14, x14, xzr, hs
        csel x15, x15, xzr, hs
        cset x16, hs
        adds x2, x2, x14
        adcs x9, x9, x15
        adcs x10, x10, x16
        adcs x11, x11, xzr
        adcs x12, x12, xzr
        adc x13, x13, xzr
        stp x2, x9, [sp, #240]
        stp x10, x11, [sp, #256]
        stp x12, x13, [sp, #272]
        ldp x3, x4, [x26, #96]
        ldp x5, x6, [x25, #48]
        mul x12, x3, x5
        umulh x13, x3, x5
        mul x11, x3, x6
        umulh x14, x3, x6
        adds x13, x13, x11
        ldp x7, x8, [x25, #64]
        mul x11, x3, x7
        umulh x15, x3, x7
        adcs x14, x14, x11
        mul x11, x3, x8
        umulh x16, x3, x8
        adcs x15, x15, x11
        ldp x9, x10, [x25, #80]
        mul x11, x3, x9
        umulh x17, x3, x9
        adcs x16, x16, x11
        mul x11, x3, x10
        umulh x19, x3, x10
        adcs x17, x17, x11
        adc x19, x19, xzr
        mul x11, x4, x5
        adds x13, x13, x11
        mul x11, x4, x6
        adcs x14, x14, x11
        mul x11, x4, x7
        adcs x15, x15, x11
        mul x11, x4, x8
        adcs x16, x16, x11
        mul x11, x4, x9
        adcs x17, x17, x11
        mul x11, x4, x10
        adcs x19, x19, x11
        cset x20, hs
        umulh x11, x4, x5
        adds x14, x14, x11
        umulh x11, x4, x6
        adcs x15, x15, x11
        umulh x11, x4, x7
        adcs x16, x16, x11
        umulh x11, x4, x8
        adcs x17, x17, x11
        umulh x11, x4, x9
        adcs x19, x19, x11
        umulh x11, x4, x10
        adc x20, x20, x11
        ldp x3, x4, [x26, #112]
        mul x11, x3, x5
        adds x14, x14, x11
        mul x11, x3, x6
        adcs x15, x15, x11
        mul x11, x3, x7
        adcs x16, x16, x11
        mul x11, x3, x8
        adcs x17, x17, x11
        mul x11, x3, x9
        adcs x19, x19, x11
        mul x11, x3, x10
        adcs x20, x20, x11
        cset x21, hs
        umulh x11, x3, x5
        adds x15, x15, x11
        umulh x11, x3, x6
        adcs x16, x16, x11
        umulh x11, x3, x7
        adcs x17, x17, x11
        umulh x11, x3, x8
        adcs x19, x19, x11
        umulh x11, x3, x9
        adcs x20, x20, x11
        umulh x11, x3, x10
        adc x21, x21, x11
        mul x11, x4, x5
        adds x15, x15, x11
        mul x11, x4, x6
        adcs x16, x16, x11
        mul x11, x4, x7
        adcs x17, x17, x11
        mul x11, x4, x8
        adcs x19, x19, x11
        mul x11, x4, x9
        adcs x20, x20, x11
        mul x11, x4, x10
        adcs x21, x21, x11
        cset x22, hs
        umulh x11, x4, x5
        adds x16, x16, x11
        umulh x11, x4, x6
        adcs x17, x17, x11
        umulh x11, x4, x7
        adcs x19, x19, x11
        umulh x11, x4, x8
        adcs x20, x20, x11
        umulh x11, x4, x9
        adcs x21, x21, x11
        umulh x11, x4, x10
        adc x22, x22, x11
        ldp x3, x4, [x26, #128]
        mul x11, x3, x5
        adds x16, x16, x11
        mul x11, x3, x6
        adcs x17, x17, x11
        mul x11, x3, x7
        adcs x19, x19, x11
        mul x11, x3, x8
        adcs x20, x20, x11
        mul x11, x3, x9
        adcs x21, x21, x11
        mul x11, x3, x10
        adcs x22, x22, x11
        cset x2, hs
        umulh x11, x3, x5
        adds x17, x17, x11
        umulh x11, x3, x6
        adcs x19, x19, x11
        umulh x11, x3, x7
        adcs x20, x20, x11
        umulh x11, x3, x8
        adcs x21, x21, x11
        umulh x11, x3, x9
        adcs x22, x22, x11
        umulh x11, x3, x10
        adc x2, x2, x11
        mul x11, x4, x5
        adds x17, x17, x11
        mul x11, x4, x6
        adcs x19, x19, x11
        mul x11, x4, x7
        adcs x20, x20, x11
        mul x11, x4, x8
        adcs x21, x21, x11
        mul x11, x4, x9
        adcs x22, x22, x11
        mul x11, x4, x10
        adcs x2, x2, x11
        cset x1, hs
        umulh x11, x4, x5
        adds x19, x19, x11
        umulh x11, x4, x6
        adcs x20, x20, x11
        umulh x11, x4, x7
        adcs x21, x21, x11
        umulh x11, x4, x8
        adcs x22, x22, x11
        umulh x11, x4, x9
        adcs x2, x2, x11
        umulh x11, x4, x10
        adc x1, x1, x11
        lsl x7, x12, #32
        add x12, x7, x12
        mov x7, #-4294967295
        umulh x7, x7, x12
        mov x6, #4294967295
        mul x5, x6, x12
        umulh x6, x6, x12
        adds x7, x7, x5
        adcs x6, x6, x12
        adc x5, xzr, xzr
        subs x13, x13, x7
        sbcs x14, x14, x6
        sbcs x15, x15, x5
        sbcs x16, x16, xzr
        sbcs x17, x17, xzr
        sbc x12, x12, xzr
        lsl x7, x13, #32
        add x13, x7, x13
        mov x7, #-4294967295
        umulh x7, x7, x13
        mov x6, #4294967295
        mul x5, x6, x13
        umulh x6, x6, x13
        adds x7, x7, x5
        adcs x6, x6, x13
        adc x5, xzr, xzr
        subs x14, x14, x7
        sbcs x15, x15, x6
        sbcs x16, x16, x5
        sbcs x17, x17, xzr
        sbcs x12, x12, xzr
        sbc x13, x13, xzr
        lsl x7, x14, #32
        add x14, x7, x14
        mov x7, #-4294967295
        umulh x7, x7, x14
        mov x6, #4294967295
        mul x5, x6, x14
        umulh x6, x6, x14
        adds x7, x7, x5
        adcs x6, x6, x14
        adc x5, xzr, xzr
        subs x15, x15, x7
        sbcs x16, x16, x6
        sbcs x17, x17, x5
        sbcs x12, x12, xzr
        sbcs x13, x13, xzr
        sbc x14, x14, xzr
        lsl x7, x15, #32
        add x15, x7, x15
        mov x7, #-4294967295
        umulh x7, x7, x15
        mov x6, #4294967295
        mul x5, x6, x15
        umulh x6, x6, x15
        adds x7, x7, x5
        adcs x6, x6, x15
        adc x5, xzr, xzr
        subs x16, x16, x7
        sbcs x17, x17, x6
        sbcs x12, x12, x5
        sbcs x13, x13, xzr
        sbcs x14, x14, xzr
        sbc x15, x15, xzr
        lsl x7, x16, #32
        add x16, x7, x16
        mov x7, #-4294967295
        umulh x7, x7, x16
        mov x6, #4294967295
        mul x5, x6, x16
        umulh x6, x6, x16
        adds x7, x7, x5
        adcs x6, x6, x16
        adc x5, xzr, xzr
        subs x17, x17, x7
        sbcs x12, x12, x6
        sbcs x13, x13, x5
        sbcs x14, x14, xzr
        sbcs x15, x15, xzr
        sbc x16, x16, xzr
        lsl x7, x17, #32
        add x17, x7, x17
        mov x7, #-4294967295
        umulh x7, x7, x17
        mov x6, #4294967295
        mul x5, x6, x17
        umulh x6, x6, x17
        adds x7, x7, x5
        adcs x6, x6, x17
        adc x5, xzr, xzr
        subs x12, x12, x7
        sbcs x13, x13, x6
        sbcs x14, x14, x5
        sbcs x15, x15, xzr
        sbcs x16, x16, xzr
        sbc x17, x17, xzr
        adds x12, x12, x19
        adcs x13, x13, x20
        adcs x14, x14, x21
        adcs x15, x15, x22
        adcs x16, x16, x2
        adcs x17, x17, x1
        adc x10, xzr, xzr
        mov x11, #-4294967295
        adds x19, x12, x11
        mov x11, #4294967295
        adcs x20, x13, x11
        mov x11, #1
        adcs x21, x14, x11
        adcs x22, x15, xzr
        adcs x2, x16, xzr
        adcs x1, x17, xzr
        adcs x10, x10, xzr
        csel x12, x12, x19, eq
        csel x13, x13, x20, eq
        csel x14, x14, x21, eq
        csel x15, x15, x22, eq
        csel x16, x16, x2, eq
        csel x17, x17, x1, eq
        stp x12, x13, [sp, #288]
        stp x14, x15, [sp, #304]
        stp x16, x17, [sp, #320]
        ldp x3, x4, [x25, #96]
        ldp x5, x6, [x26, #48]
        mul x12, x3, x5
        umulh x13, x3, x5
        mul x11, x3, x6
        umulh x14, x3, x6
        adds x13, x13, x11
        ldp x7, x8, [x26, #64]
        mul x11, x3, x7
        umulh x15, x3, x7
        adcs x14, x14, x11
        mul x11, x3, x8
        umulh x16, x3, x8
        adcs x15, x15, x11
        ldp x9, x10, [x26, #80]
        mul x11, x3, x9
        umulh x17, x3, x9
        adcs x16, x16, x11
        mul x11, x3, x10
        umulh x19, x3, x10
        adcs x17, x17, x11
        adc x19, x19, xzr
        mul x11, x4, x5
        adds x13, x13, x11
        mul x11, x4, x6
        adcs x14, x14, x11
        mul x11, x4, x7
        adcs x15, x15, x11
        mul x11, x4, x8
        adcs x16, x16, x11
        mul x11, x4, x9
        adcs x17, x17, x11
        mul x11, x4, x10
        adcs x19, x19, x11
        cset x20, hs
        umulh x11, x4, x5
        adds x14, x14, x11
        umulh x11, x4, x6
        adcs x15, x15, x11
        umulh x11, x4, x7
        adcs x16, x16, x11
        umulh x11, x4, x8
        adcs x17, x17, x11
        umulh x11, x4, x9
        adcs x19, x19, x11
        umulh x11, x4, x10
        adc x20, x20, x11
        ldp x3, x4, [x25, #112]
        mul x11, x3, x5
        adds x14, x14, x11
        mul x11, x3, x6
        adcs x15, x15, x11
        mul x11, x3, x7
        adcs x16, x16, x11
        mul x11, x3, x8
        adcs x17, x17, x11
        mul x11, x3, x9
        adcs x19, x19, x11
        mul x11, x3, x10
        adcs x20, x20, x11
        cset x21, hs
        umulh x11, x3, x5
        adds x15, x15, x11
        umulh x11, x3, x6
        adcs x16, x16, x11
        umulh x11, x3, x7
        adcs x17, x17, x11
        umulh x11, x3, x8
        adcs x19, x19, x11
        umulh x11, x3, x9
        adcs x20, x20, x11
        umulh x11, x3, x10
        adc x21, x21, x11
        mul x11, x4, x5
        adds x15, x15, x11
        mul x11, x4, x6
        adcs x16, x16, x11
        mul x11, x4, x7
        adcs x17, x17, x11
        mul x11, x4, x8
        adcs x19, x19, x11
        mul x11, x4, x9
        adcs x20, x20, x11
        mul x11, x4, x10
        adcs x21, x21, x11
        cset x22, hs
        umulh x11, x4, x5
        adds x16, x16, x11
        umulh x11, x4, x6
        adcs x17, x17, x11
        umulh x11, x4, x7
        adcs x19, x19, x11
        umulh x11, x4, x8
        adcs x20, x20, x11
        umulh x11, x4, x9
        adcs x21, x21, x11
        umulh x11, x4, x10
        adc x22, x22, x11
        ldp x3, x4, [x25, #128]
        mul x11, x3, x5
        adds x16, x16, x11
        mul x11, x3, x6
        adcs x17, x17, x11
        mul x11, x3, x7
        adcs x19, x19, x11
        mul x11, x3, x8
        adcs x20, x20, x11
        mul x11, x3, x9
        adcs x21, x21, x11
        mul x11, x3, x10
        adcs x22, x22, x11
        cset x2, hs
        umulh x11, x3, x5
        adds x17, x17, x11
        umulh x11, x3, x6
        adcs x19, x19, x11
        umulh x11, x3, x7
        adcs x20, x20, x11
        umulh x11, x3, x8
        adcs x21, x21, x11
        umulh x11, x3, x9
        adcs x22, x22, x11
        umulh x11, x3, x10
        adc x2, x2, x11
        mul x11, x4, x5
        adds x17, x17, x11
        mul x11, x4, x6
        adcs x19, x19, x11
        mul x11, x4, x7
        adcs x20, x20, x11
        mul x11, x4, x8
        adcs x21, x21, x11
        mul x11, x4, x9
        adcs x22, x22, x11
        mul x11, x4, x10
        adcs x2, x2, x11
        cset x1, hs
        umulh x11, x4, x5
        adds x19, x19, x11
        umulh x11, x4, x6
        adcs x20, x20, x11
        umulh x11, x4, x7
        adcs x21, x21, x11
        umulh x11, x4, x8
        adcs x22, x22, x11
        umulh x11, x4, x9
        adcs x2, x2, x11
        umulh x11, x4, x10
        adc x1, x1, x11
        lsl x7, x12, #32
        add x12, x7, x12
        mov x7, #-4294967295
        umulh x7, x7, x12
        mov x6, #4294967295
        mul x5, x6, x12
        umulh x6, x6, x12
        adds x7, x7, x5
        adcs x6, x6, x12
        adc x5, xzr, xzr
        subs x13, x13, x7
        sbcs x14, x14, x6
        sbcs x15, x15, x5
        sbcs x16, x16, xzr
        sbcs x17, x17, xzr
        sbc x12, x12, xzr
        lsl x7, x13, #32
        add x13, x7, x13
        mov x7, #-4294967295
        umulh x7, x7, x13
        mov x6, #4294967295
        mul x5, x6, x13
        umulh x6, x6, x13
        adds x7, x7, x5
        adcs x6, x6, x13
        adc x5, xzr, xzr
        subs x14, x14, x7
        sbcs x15, x15, x6
        sbcs x16, x16, x5
        sbcs x17, x17, xzr
        sbcs x12, x12, xzr
        sbc x13, x13, xzr
        lsl x7, x14, #32
        add x14, x7, x14
        mov x7, #-4294967295
        umulh x7, x7, x14
        mov x6, #4294967295
        mul x5, x6, x14
        umulh x6, x6, x14
        adds x7, x7, x5
        adcs x6, x6, x14
        adc x5, xzr, xzr
        subs x15, x15, x7
        sbcs x16, x16, x6
        sbcs x17, x17, x5
        sbcs x12, x12, xzr
        sbcs x13, x13, xzr
        sbc x14, x14, xzr
        lsl x7, x15, #32
        add x15, x7, x15
        mov x7, #-4294967295
        umulh x7, x7, x15
        mov x6, #4294967295
        mul x5, x6, x15
        umulh x6, x6, x15
        adds x7, x7, x5
        adcs x6, x6, x15
        adc x5, xzr, xzr
        subs x16, x16, x7
        sbcs x17, x17, x6
        sbcs x12, x12, x5
        sbcs x13, x13, xzr
        sbcs x14, x14, xzr
        sbc x15, x15, xzr
        lsl x7, x16, #32
        add x16, x7, x16
        mov x7, #-4294967295
        umulh x7, x7, x16
        mov x6, #4294967295
        mul x5, x6, x16
        umulh x6, x6, x16
        adds x7, x7, x5
        adcs x6, x6, x16
        adc x5, xzr, xzr
        subs x17, x17, x7
        sbcs x12, x12, x6
        sbcs x13, x13, x5
        sbcs x14, x14, xzr
        sbcs x15, x15, xzr
        sbc x16, x16, xzr
        lsl x7, x17, #32
        add x17, x7, x17
        mov x7, #-4294967295
        umulh x7, x7, x17
        mov x6, #4294967295
        mul x5, x6, x17
        umulh x6, x6, x17
        adds x7, x7, x5
        adcs x6, x6, x17
        adc x5, xzr, xzr
        subs x12, x12, x7
        sbcs x13, x13, x6
        sbcs x14, x14, x5
        sbcs x15, x15, xzr
        sbcs x16, x16, xzr
        sbc x17, x17, xzr
        adds x12, x12, x19
        adcs x13, x13, x20
        adcs x14, x14, x21
        adcs x15, x15, x22
        adcs x16, x16, x2
        adcs x17, x17, x1
        adc x10, xzr, xzr
        mov x11, #-4294967295
        adds x19, x12, x11
        mov x11, #4294967295
        adcs x20, x13, x11
        mov x11, #1
        adcs x21, x14, x11
        adcs x22, x15, xzr
        adcs x2, x16, xzr
        adcs x1, x17, xzr
        adcs x10, x10, xzr
        csel x12, x12, x19, eq
        csel x13, x13, x20, eq
        csel x14, x14, x21, eq
        csel x15, x15, x22, eq
        csel x16, x16, x2, eq
        csel x17, x17, x1, eq
        stp x12, x13, [sp, #48]
        stp x14, x15, [sp, #64]
        stp x16, x17, [sp, #80]
        ldp x3, x4, [sp]
        ldp x5, x6, [x26]
        mul x12, x3, x5
        umulh x13, x3, x5
        mul x11, x3, x6
        umulh x14, x3, x6
        adds x13, x13, x11
        ldp x7, x8, [x26, #16]
        mul x11, x3, x7
        umulh x15, x3, x7
        adcs x14, x14, x11
        mul x11, x3, x8
        umulh x16, x3, x8
        adcs x15, x15, x11
        ldp x9, x10, [x26, #32]
        mul x11, x3, x9
        umulh x17, x3, x9
        adcs x16, x16, x11
        mul x11, x3, x10
        umulh x19, x3, x10
        adcs x17, x17, x11
        adc x19, x19, xzr
        mul x11, x4, x5
        adds x13, x13, x11
        mul x11, x4, x6
        adcs x14, x14, x11
        mul x11, x4, x7
        adcs x15, x15, x11
        mul x11, x4, x8
        adcs x16, x16, x11
        mul x11, x4, x9
        adcs x17, x17, x11
        mul x11, x4, x10
        adcs x19, x19, x11
        cset x20, hs
        umulh x11, x4, x5
        adds x14, x14, x11
        umulh x11, x4, x6
        adcs x15, x15, x11
        umulh x11, x4, x7
        adcs x16, x16, x11
        umulh x11, x4, x8
        adcs x17, x17, x11
        umulh x11, x4, x9
        adcs x19, x19, x11
        umulh x11, x4, x10
        adc x20, x20, x11
        ldp x3, x4, [sp, #16]
        mul x11, x3, x5
        adds x14, x14, x11
        mul x11, x3, x6
        adcs x15, x15, x11
        mul x11, x3, x7
        adcs x16, x16, x11
        mul x11, x3, x8
        adcs x17, x17, x11
        mul x11, x3, x9
        adcs x19, x19, x11
        mul x11, x3, x10
        adcs x20, x20, x11
        cset x21, hs
        umulh x11, x3, x5
        adds x15, x15, x11
        umulh x11, x3, x6
        adcs x16, x16, x11
        umulh x11, x3, x7
        adcs x17, x17, x11
        umulh x11, x3, x8
        adcs x19, x19, x11
        umulh x11, x3, x9
        adcs x20, x20, x11
        umulh x11, x3, x10
        adc x21, x21, x11
        mul x11, x4, x5
        adds x15, x15, x11
        mul x11, x4, x6
        adcs x16, x16, x11
        mul x11, x4, x7
        adcs x17, x17, x11
        mul x11, x4, x8
        adcs x19, x19, x11
        mul x11, x4, x9
        adcs x20, x20, x11
        mul x11, x4, x10
        adcs x21, x21, x11
        cset x22, hs
        umulh x11, x4, x5
        adds x16, x16, x11
        umulh x11, x4, x6
        adcs x17, x17, x11
        umulh x11, x4, x7
        adcs x19, x19, x11
        umulh x11, x4, x8
        adcs x20, x20, x11
        umulh x11, x4, x9
        adcs x21, x21, x11
        umulh x11, x4, x10
        adc x22, x22, x11
        ldp x3, x4, [sp, #32]
        mul x11, x3, x5
        adds x16, x16, x11
        mul x11, x3, x6
        adcs x17, x17, x11
        mul x11, x3, x7
        adcs x19, x19, x11
        mul x11, x3, x8
        adcs x20, x20, x11
        mul x11, x3, x9
        adcs x21, x21, x11
        mul x11, x3, x10
        adcs x22, x22, x11
        cset x2, hs
        umulh x11, x3, x5
        adds x17, x17, x11
        umulh x11, x3, x6
        adcs x19, x19, x11
        umulh x11, x3, x7
        adcs x20, x20, x11
        umulh x11, x3, x8
        adcs x21, x21, x11
        umulh x11, x3, x9
        adcs x22, x22, x11
        umulh x11, x3, x10
        adc x2, x2, x11
        mul x11, x4, x5
        adds x17, x17, x11
        mul x11, x4, x6
        adcs x19, x19, x11
        mul x11, x4, x7
        adcs x20, x20, x11
        mul x11, x4, x8
        adcs x21, x21, x11
        mul x11, x4, x9
        adcs x22, x22, x11
        mul x11, x4, x10
        adcs x2, x2, x11
        cset x1, hs
        umulh x11, x4, x5
        adds x19, x19, x11
        umulh x11, x4, x6
        adcs x20, x20, x11
        umulh x11, x4, x7
        adcs x21, x21, x11
        umulh x11, x4, x8
        adcs x22, x22, x11
        umulh x11, x4, x9
        adcs x2, x2, x11
        umulh x11, x4, x10
        adc x1, x1, x11
        lsl x7, x12, #32
        add x12, x7, x12
        mov x7, #-4294967295
        umulh x7, x7, x12
        mov x6, #4294967295
        mul x5, x6, x12
        umulh x6, x6, x12
        adds x7, x7, x5
        adcs x6, x6, x12
        adc x5, xzr, xzr
        subs x13, x13, x7
        sbcs x14, x14, x6
        sbcs x15, x15, x5
        sbcs x16, x16, xzr
        sbcs x17, x17, xzr
        sbc x12, x12, xzr
        lsl x7, x13, #32
        add x13, x7, x13
        mov x7, #-4294967295
        umulh x7, x7, x13
        mov x6, #4294967295
        mul x5, x6, x13
        umulh x6, x6, x13
        adds x7, x7, x5
        adcs x6, x6, x13
        adc x5, xzr, xzr
        subs x14, x14, x7
        sbcs x15, x15, x6
        sbcs x16, x16, x5
        sbcs x17, x17, xzr
        sbcs x12, x12, xzr
        sbc x13, x13, xzr
        lsl x7, x14, #32
        add x14, x7, x14
        mov x7, #-4294967295
        umulh x7, x7, x14
        mov x6, #4294967295
        mul x5, x6, x14
        umulh x6, x6, x14
        adds x7, x7, x5
        adcs x6, x6, x14
        adc x5, xzr, xzr
        subs x15, x15, x7
        sbcs x16, x16, x6
        sbcs x17, x17, x5
        sbcs x12, x12, xzr
        sbcs x13, x13, xzr
        sbc x14, x14, xzr
        lsl x7, x15, #32
        add x15, x7, x15
        mov x7, #-4294967295
        umulh x7, x7, x15
        mov x6, #4294967295
        mul x5, x6, x15
        umulh x6, x6, x15
        adds x7, x7, x5
        adcs x6, x6, x15
        adc x5, xzr, xzr
        subs x16, x16, x7
        sbcs x17, x17, x6
        sbcs x12, x12, x5
        sbcs x13, x13, xzr
        sbcs x14, x14, xzr
        sbc x15, x15, xzr
        lsl x7, x16, #32
        add x16, x7, x16
        mov x7, #-4294967295
        umulh x7, x7, x16
        mov x6, #4294967295
        mul x5, x6, x16
        umulh x6, x6, x16
        adds x7, x7, x5
        adcs x6, x6, x16
        adc x5, xzr, xzr
        subs x17, x17, x7
        sbcs x12, x12, x6
        sbcs x13, x13, x5
        sbcs x14, x14, xzr
        sbcs x15, x15, xzr
        sbc x16, x16, xzr
        lsl x7, x17, #32
        add x17, x7, x17
        mov x7, #-4294967295
        umulh x7, x7, x17
        mov x6, #4294967295
        mul x5, x6, x17
        umulh x6, x6, x17
        adds x7, x7, x5
        adcs x6, x6, x17
        adc x5, xzr, xzr
        subs x12, x12, x7
        sbcs x13, x13, x6
        sbcs x14, x14, x5
        sbcs x15, x15, xzr
        sbcs x16, x16, xzr
        sbc x17, x17, xzr
        adds x12, x12, x19
        adcs x13, x13, x20
        adcs x14, x14, x21
        adcs x15, x15, x22
        adcs x16, x16, x2
        adcs x17, x17, x1
        adc x10, xzr, xzr
        mov x11, #-4294967295
        adds x19, x12, x11
        mov x11, #4294967295
        adcs x20, x13, x11
        mov x11, #1
        adcs x21, x14, x11
        adcs x22, x15, xzr
        adcs x2, x16, xzr
        adcs x1, x17, xzr
        adcs x10, x10, xzr
        csel x12, x12, x19, eq
        csel x13, x13, x20, eq
        csel x14, x14, x21, eq
        csel x15, x15, x22, eq
        csel x16, x16, x2, eq
        csel x17, x17, x1, eq
        stp x12, x13, [sp, #96]
        stp x14, x15, [sp, #112]
        stp x16, x17, [sp, #128]
        ldp x3, x4, [sp, #240]
        ldp x5, x6, [x25]
        mul x12, x3, x5
        umulh x13, x3, x5
        mul x11, x3, x6
        umulh x14, x3, x6
        adds x13, x13, x11
        ldp x7, x8, [x25, #16]
        mul x11, x3, x7
        umulh x15, x3, x7
        adcs x14, x14, x11
        mul x11, x3, x8
        umulh x16, x3, x8
        adcs x15, x15, x11
        ldp x9, x10, [x25, #32]
        mul x11, x3, x9
        umulh x17, x3, x9
        adcs x16, x16, x11
        mul x11, x3, x10
        umulh x19, x3, x10
        adcs x17, x17, x11
        adc x19, x19, xzr
        mul x11, x4, x5
        adds x13, x13, x11
        mul x11, x4, x6
        adcs x14, x14, x11
        mul x11, x4, x7
        adcs x15, x15, x11
        mul x11, x4, x8
        adcs x16, x16, x11
        mul x11, x4, x9
        adcs x17, x17, x11
        mul x11, x4, x10
        adcs x19, x19, x11
        cset x20, hs
        umulh x11, x4, x5
        adds x14, x14, x11
        umulh x11, x4, x6
        adcs x15, x15, x11
        umulh x11, x4, x7
        adcs x16, x16, x11
        umulh x11, x4, x8
        adcs x17, x17, x11
        umulh x11, x4, x9
        adcs x19, x19, x11
        umulh x11, x4, x10
        adc x20, x20, x11
        ldp x3, x4, [sp, #256]
        mul x11, x3, x5
        adds x14, x14, x11
        mul x11, x3, x6
        adcs x15, x15, x11
        mul x11, x3, x7
        adcs x16, x16, x11
        mul x11, x3, x8
        adcs x17, x17, x11
        mul x11, x3, x9
        adcs x19, x19, x11
        mul x11, x3, x10
        adcs x20, x20, x11
        cset x21, hs
        umulh x11, x3, x5
        adds x15, x15, x11
        umulh x11, x3, x6
        adcs x16, x16, x11
        umulh x11, x3, x7
        adcs x17, x17, x11
        umulh x11, x3, x8
        adcs x19, x19, x11
        umulh x11, x3, x9
        adcs x20, x20, x11
        umulh x11, x3, x10
        adc x21, x21, x11
        mul x11, x4, x5
        adds x15, x15, x11
        mul x11, x4, x6
        adcs x16, x16, x11
        mul x11, x4, x7
        adcs x17, x17, x11
        mul x11, x4, x8
        adcs x19, x19, x11
        mul x11, x4, x9
        adcs x20, x20, x11
        mul x11, x4, x10
        adcs x21, x21, x11
        cset x22, hs
        umulh x11, x4, x5
        adds x16, x16, x11
        umulh x11, x4, x6
        adcs x17, x17, x11
        umulh x11, x4, x7
        adcs x19, x19, x11
        umulh x11, x4, x8
        adcs x20, x20, x11
        umulh x11, x4, x9
        adcs x21, x21, x11
        umulh x11, x4, x10
        adc x22, x22, x11
        ldp x3, x4, [sp, #272]
        mul x11, x3, x5
        adds x16, x16, x11
        mul x11, x3, x6
        adcs x17, x17, x11
        mul x11, x3, x7
        adcs x19, x19, x11
        mul x11, x3, x8
        adcs x20, x20, x11
        mul x11, x3, x9
        adcs x21, x21, x11
        mul x11, x3, x10
        adcs x22, x22, x11
        cset x2, hs
        umulh x11, x3, x5
        adds x17, x17, x11
        umulh x11, x3, x6
        adcs x19, x19, x11
        umulh x11, x3, x7
        adcs x20, x20, x11
        umulh x11, x3, x8
        adcs x21, x21, x11
        umulh x11, x3, x9
        adcs x22, x22, x11
        umulh x11, x3, x10
        adc x2, x2, x11
        mul x11, x4, x5
        adds x17, x17, x11
        mul x11, x4, x6
        adcs x19, x19, x11
        mul x11, x4, x7
        adcs x20, x20, x11
        mul x11, x4, x8
        adcs x21, x21, x11
        mul x11, x4, x9
        adcs x22, x22, x11
        mul x11, x4, x10
        adcs x2, x2, x11
        cset x1, hs
        umulh x11, x4, x5
        adds x19, x19, x11
        umulh x11, x4, x6
        adcs x20, x20, x11
        umulh x11, x4, x7
        adcs x21, x21, x11
        umulh x11, x4, x8
        adcs x22, x22, x11
        umulh x11, x4, x9
        adcs x2, x2, x11
        umulh x11, x4, x10
        adc x1, x1, x11
        lsl x7, x12, #32
        add x12, x7, x12
        mov x7, #-4294967295
        umulh x7, x7, x12
        mov x6, #4294967295
        mul x5, x6, x12
        umulh x6, x6, x12
        adds x7, x7, x5
        adcs x6, x6, x12
        adc x5, xzr, xzr
        subs x13, x13, x7
        sbcs x14, x14, x6
        sbcs x15, x15, x5
        sbcs x16, x16, xzr
        sbcs x17, x17, xzr
        sbc x12, x12, xzr
        lsl x7, x13, #32
        add x13, x7, x13
        mov x7, #-4294967295
        umulh x7, x7, x13
        mov x6, #4294967295
        mul x5, x6, x13
        umulh x6, x6, x13
        adds x7, x7, x5
        adcs x6, x6, x13
        adc x5, xzr, xzr
        subs x14, x14, x7
        sbcs x15, x15, x6
        sbcs x16, x16, x5
        sbcs x17, x17, xzr
        sbcs x12, x12, xzr
        sbc x13, x13, xzr
        lsl x7, x14, #32
        add x14, x7, x14
        mov x7, #-4294967295
        umulh x7, x7, x14
        mov x6, #4294967295
        mul x5, x6, x14
        umulh x6, x6, x14
        adds x7, x7, x5
        adcs x6, x6, x14
        adc x5, xzr, xzr
        subs x15, x15, x7
        sbcs x16, x16, x6
        sbcs x17, x17, x5
        sbcs x12, x12, xzr
        sbcs x13, x13, xzr
        sbc x14, x14, xzr
        lsl x7, x15, #32
        add x15, x7, x15
        mov x7, #-4294967295
        umulh x7, x7, x15
        mov x6, #4294967295
        mul x5, x6, x15
        umulh x6, x6, x15
        adds x7, x7, x5
        adcs x6, x6, x15
        adc x5, xzr, xzr
        subs x16, x16, x7
        sbcs x17, x17, x6
        sbcs x12, x12, x5
        sbcs x13, x13, xzr
        sbcs x14, x14, xzr
        sbc x15, x15, xzr
        lsl x7, x16, #32
        add x16, x7, x16
        mov x7, #-4294967295
        umulh x7, x7, x16
        mov x6, #4294967295
        mul x5, x6, x16
        umulh x6, x6, x16
        adds x7, x7, x5
        adcs x6, x6, x16
        adc x5, xzr, xzr
        subs x17, x17, x7
        sbcs x12, x12, x6
        sbcs x13, x13, x5
        sbcs x14, x14, xzr
        sbcs x15, x15, xzr
        sbc x16, x16, xzr
        lsl x7, x17, #32
        add x17, x7, x17
        mov x7, #-4294967295
        umulh x7, x7, x17
        mov x6, #4294967295
        mul x5, x6, x17
        umulh x6, x6, x17
        adds x7, x7, x5
        adcs x6, x6, x17
        adc x5, xzr, xzr
        subs x12, x12, x7
        sbcs x13, x13, x6
        sbcs x14, x14, x5
        sbcs x15, x15, xzr
        sbcs x16, x16, xzr
        sbc x17, x17, xzr
        adds x12, x12, x19
        adcs x13, x13, x20
        adcs x14, x14, x21
        adcs x15, x15, x22
        adcs x16, x16, x2
        adcs x17, x17, x1
        adc x10, xzr, xzr
        mov x11, #-4294967295
        adds x19, x12, x11
        mov x11, #4294967295
        adcs x20, x13, x11
        mov x11, #1
        adcs x21, x14, x11
        adcs x22, x15, xzr
        adcs x2, x16, xzr
        adcs x1, x17, xzr
        adcs x10, x10, xzr
        csel x12, x12, x19, eq
        csel x13, x13, x20, eq
        csel x14, x14, x21, eq
        csel x15, x15, x22, eq
        csel x16, x16, x2, eq
        csel x17, x17, x1, eq
        stp x12, x13, [sp, #192]
        stp x14, x15, [sp, #208]
        stp x16, x17, [sp, #224]
        ldp x3, x4, [sp]
        ldp x5, x6, [sp, #48]
        mul x12, x3, x5
        umulh x13, x3, x5
        mul x11, x3, x6
        umulh x14, x3, x6
        adds x13, x13, x11
        ldp x7, x8, [sp, #64]
        mul x11, x3, x7
        umulh x15, x3, x7
        adcs x14, x14, x11
        mul x11, x3, x8
        umulh x16, x3, x8
        adcs x15, x15, x11
        ldp x9, x10, [sp, #80]
        mul x11, x3, x9
        umulh x17, x3, x9
        adcs x16, x16, x11
        mul x11, x3, x10
        umulh x19, x3, x10
        adcs x17, x17, x11
        adc x19, x19, xzr
        mul x11, x4, x5
        adds x13, x13, x11
        mul x11, x4, x6
        adcs x14, x14, x11
        mul x11, x4, x7
        adcs x15, x15, x11
        mul x11, x4, x8
        adcs x16, x16, x11
        mul x11, x4, x9
        adcs x17, x17, x11
        mul x11, x4, x10
        adcs x19, x19, x11
        cset x20, hs
        umulh x11, x4, x5
        adds x14, x14, x11
        umulh x11, x4, x6
        adcs x15, x15, x11
        umulh x11, x4, x7
        adcs x16, x16, x11
        umulh x11, x4, x8
        adcs x17, x17, x11
        umulh x11, x4, x9
        adcs x19, x19, x11
        umulh x11, x4, x10
        adc x20, x20, x11
        ldp x3, x4, [sp, #16]
        mul x11, x3, x5
        adds x14, x14, x11
        mul x11, x3, x6
        adcs x15, x15, x11
        mul x11, x3, x7
        adcs x16, x16, x11
        mul x11, x3, x8
        adcs x17, x17, x11
        mul x11, x3, x9
        adcs x19, x19, x11
        mul x11, x3, x10
        adcs x20, x20, x11
        cset x21, hs
        umulh x11, x3, x5
        adds x15, x15, x11
        umulh x11, x3, x6
        adcs x16, x16, x11
        umulh x11, x3, x7
        adcs x17, x17, x11
        umulh x11, x3, x8
        adcs x19, x19, x11
        umulh x11, x3, x9
        adcs x20, x20, x11
        umulh x11, x3, x10
        adc x21, x21, x11
        mul x11, x4, x5
        adds x15, x15, x11
        mul x11, x4, x6
        adcs x16, x16, x11
        mul x11, x4, x7
        adcs x17, x17, x11
        mul x11, x4, x8
        adcs x19, x19, x11
        mul x11, x4, x9
        adcs x20, x20, x11
        mul x11, x4, x10
        adcs x21, x21, x11
        cset x22, hs
        umulh x11, x4, x5
        adds x16, x16, x11
        umulh x11, x4, x6
        adcs x17, x17, x11
        umulh x11, x4, x7
        adcs x19, x19, x11
        umulh x11, x4, x8
        adcs x20, x20, x11
        umulh x11, x4, x9
        adcs x21, x21, x11
        umulh x11, x4, x10
        adc x22, x22, x11
        ldp x3, x4, [sp, #32]
        mul x11, x3, x5
        adds x16, x16, x11
        mul x11, x3, x6
        adcs x17, x17, x11
        mul x11, x3, x7
        adcs x19, x19, x11
        mul x11, x3, x8
        adcs x20, x20, x11
        mul x11, x3, x9
        adcs x21, x21, x11
        mul x11, x3, x10
        adcs x22, x22, x11
        cset x2, hs
        umulh x11, x3, x5
        adds x17, x17, x11
        umulh x11, x3, x6
        adcs x19, x19, x11
        umulh x11, x3, x7
        adcs x20, x20, x11
        umulh x11, x3, x8
        adcs x21, x21, x11
        umulh x11, x3, x9
        adcs x22, x22, x11
        umulh x11, x3, x10
        adc x2, x2, x11
        mul x11, x4, x5
        adds x17, x17, x11
        mul x11, x4, x6
        adcs x19, x19, x11
        mul x11, x4, x7
        adcs x20, x20, x11
        mul x11, x4, x8
        adcs x21, x21, x11
        mul x11, x4, x9
        adcs x22, x22, x11
        mul x11, x4, x10
        adcs x2, x2, x11
        cset x1, hs
        umulh x11, x4, x5
        adds x19, x19, x11
        umulh x11, x4, x6
        adcs x20, x20, x11
        umulh x11, x4, x7
        adcs x21, x21, x11
        umulh x11, x4, x8
        adcs x22, x22, x11
        umulh x11, x4, x9
        adcs x2, x2, x11
        umulh x11, x4, x10
        adc x1, x1, x11
        lsl x7, x12, #32
        add x12, x7, x12
        mov x7, #-4294967295
        umulh x7, x7, x12
        mov x6, #4294967295
        mul x5, x6, x12
        umulh x6, x6, x12
        adds x7, x7, x5
        adcs x6, x6, x12
        adc x5, xzr, xzr
        subs x13, x13, x7
        sbcs x14, x14, x6
        sbcs x15, x15, x5
        sbcs x16, x16, xzr
        sbcs x17, x17, xzr
        sbc x12, x12, xzr
        lsl x7, x13, #32
        add x13, x7, x13
        mov x7, #-4294967295
        umulh x7, x7, x13
        mov x6, #4294967295
        mul x5, x6, x13
        umulh x6, x6, x13
        adds x7, x7, x5
        adcs x6, x6, x13
        adc x5, xzr, xzr
        subs x14, x14, x7
        sbcs x15, x15, x6
        sbcs x16, x16, x5
        sbcs x17, x17, xzr
        sbcs x12, x12, xzr
        sbc x13, x13, xzr
        lsl x7, x14, #32
        add x14, x7, x14
        mov x7, #-4294967295
        umulh x7, x7, x14
        mov x6, #4294967295
        mul x5, x6, x14
        umulh x6, x6, x14
        adds x7, x7, x5
        adcs x6, x6, x14
        adc x5, xzr, xzr
        subs x15, x15, x7
        sbcs x16, x16, x6
        sbcs x17, x17, x5
        sbcs x12, x12, xzr
        sbcs x13, x13, xzr
        sbc x14, x14, xzr
        lsl x7, x15, #32
        add x15, x7, x15
        mov x7, #-4294967295
        umulh x7, x7, x15
        mov x6, #4294967295
        mul x5, x6, x15
        umulh x6, x6, x15
        adds x7, x7, x5
        adcs x6, x6, x15
        adc x5, xzr, xzr
        subs x16, x16, x7
        sbcs x17, x17, x6
        sbcs x12, x12, x5
        sbcs x13, x13, xzr
        sbcs x14, x14, xzr
        sbc x15, x15, xzr
        lsl x7, x16, #32
        add x16, x7, x16
        mov x7, #-4294967295
        umulh x7, x7, x16
        mov x6, #4294967295
        mul x5, x6, x16
        umulh x6, x6, x16
        adds x7, x7, x5
        adcs x6, x6, x16
        adc x5, xzr, xzr
        subs x17, x17, x7
        sbcs x12, x12, x6
        sbcs x13, x13, x5
        sbcs x14, x14, xzr
        sbcs x15, x15, xzr
        sbc x16, x16, xzr
        lsl x7, x17, #32
        add x17, x7, x17
        mov x7, #-4294967295
        umulh x7, x7, x17
        mov x6, #4294967295
        mul x5, x6, x17
        umulh x6, x6, x17
        adds x7, x7, x5
        adcs x6, x6, x17
        adc x5, xzr, xzr
        subs x12, x12, x7
        sbcs x13, x13, x6
        sbcs x14, x14, x5
        sbcs x15, x15, xzr
        sbcs x16, x16, xzr
        sbc x17, x17, xzr
        adds x12, x12, x19
        adcs x13, x13, x20
        adcs x14, x14, x21
        adcs x15, x15, x22
        adcs x16, x16, x2
        adcs x17, x17, x1
        adc x10, xzr, xzr
        mov x11, #-4294967295
        adds x19, x12, x11
        mov x11, #4294967295
        adcs x20, x13, x11
        mov x11, #1
        adcs x21, x14, x11
        adcs x22, x15, xzr
        adcs x2, x16, xzr
        adcs x1, x17, xzr
        adcs x10, x10, xzr
        csel x12, x12, x19, eq
        csel x13, x13, x20, eq
        csel x14, x14, x21, eq
        csel x15, x15, x22, eq
        csel x16, x16, x2, eq
        csel x17, x17, x1, eq
        stp x12, x13, [sp, #48]
        stp x14, x15, [sp, #64]
        stp x16, x17, [sp, #80]
        ldp x3, x4, [sp, #240]
        ldp x5, x6, [sp, #288]
        mul x12, x3, x5
        umulh x13, x3, x5
        mul x11, x3, x6
        umulh x14, x3, x6
        adds x13, x13, x11
        ldp x7, x8, [sp, #304]
        mul x11, x3, x7
        umulh x15, x3, x7
        adcs x14, x14, x11
        mul x11, x3, x8
        umulh x16, x3, x8
        adcs x15, x15, x11
        ldp x9, x10, [sp, #320]
        mul x11, x3, x9
        umulh x17, x3, x9
        adcs x16, x16, x11
        mul x11, x3, x10
        umulh x19, x3, x10
        adcs x17, x17, x11
        adc x19, x19, xzr
        mul x11, x4, x5
        adds x13, x13, x11
        mul x11, x4, x6
        adcs x14, x14, x11
        mul x11, x4, x7
        adcs x15, x15, x11
        mul x11, x4, x8
        adcs x16, x16, x11
        mul x11, x4, x9
        adcs x17, x17, x11
        mul x11, x4, x10
        adcs x19, x19, x11
        cset x20, hs
        umulh x11, x4, x5
        adds x14, x14, x11
        umulh x11, x4, x6
        adcs x15, x15, x11
        umulh x11, x4, x7
        adcs x16, x16, x11
        umulh x11, x4, x8
        adcs x17, x17, x11
        umulh x11, x4, x9
        adcs x19, x19, x11
        umulh x11, x4, x10
        adc x20, x20, x11
        ldp x3, x4, [sp, #256]
        mul x11, x3, x5
        adds x14, x14, x11
        mul x11, x3, x6
        adcs x15, x15, x11
        mul x11, x3, x7
        adcs x16, x16, x11
        mul x11, x3, x8
        adcs x17, x17, x11
        mul x11, x3, x9
        adcs x19, x19, x11
        mul x11, x3, x10
        adcs x20, x20, x11
        cset x21, hs
        umulh x11, x3, x5
        adds x15, x15, x11
        umulh x11, x3, x6
        adcs x16, x16, x11
        umulh x11, x3, x7
        adcs x17, x17, x11
        umulh x11, x3, x8
        adcs x19, x19, x11
        umulh x11, x3, x9
        adcs x20, x20, x11
        umulh x11, x3, x10
        adc x21, x21, x11
        mul x11, x4, x5
        adds x15, x15, x11
        mul x11, x4, x6
        adcs x16, x16, x11
        mul x11, x4, x7
        adcs x17, x17, x11
        mul x11, x4, x8
        adcs x19, x19, x11
        mul x11, x4, x9
        adcs x20, x20, x11
        mul x11, x4, x10
        adcs x21, x21, x11
        cset x22, hs
        umulh x11, x4, x5
        adds x16, x16, x11
        umulh x11, x4, x6
        adcs x17, x17, x11
        umulh x11, x4, x7
        adcs x19, x19, x11
        umulh x11, x4, x8
        adcs x20, x20, x11
        umulh x11, x4, x9
        adcs x21, x21, x11
        umulh x11, x4, x10
        adc x22, x22, x11
        ldp x3, x4, [sp, #272]
        mul x11, x3, x5
        adds x16, x16, x11
        mul x11, x3, x6
        adcs x17, x17, x11
        mul x11, x3, x7
        adcs x19, x19, x11
        mul x11, x3, x8
        adcs x20, x20, x11
        mul x11, x3, x9
        adcs x21, x21, x11
        mul x11, x3, x10
        adcs x22, x22, x11
        cset x2, hs
        umulh x11, x3, x5
        adds x17, x17, x11
        umulh x11, x3, x6
        adcs x19, x19, x11
        umulh x11, x3, x7
        adcs x20, x20, x11
        umulh x11, x3, x8
        adcs x21, x21, x11
        umulh x11, x3, x9
        adcs x22, x22, x11
        umulh x11, x3, x10
        adc x2, x2, x11
        mul x11, x4, x5
        adds x17, x17, x11
        mul x11, x4, x6
        adcs x19, x19, x11
        mul x11, x4, x7
        adcs x20, x20, x11
        mul x11, x4, x8
        adcs x21, x21, x11
        mul x11, x4, x9
        adcs x22, x22, x11
        mul x11, x4, x10
        adcs x2, x2, x11
        cset x1, hs
        umulh x11, x4, x5
        adds x19, x19, x11
        umulh x11, x4, x6
        adcs x20, x20, x11
        umulh x11, x4, x7
        adcs x21, x21, x11
        umulh x11, x4, x8
        adcs x22, x22, x11
        umulh x11, x4, x9
        adcs x2, x2, x11
        umulh x11, x4, x10
        adc x1, x1, x11
        lsl x7, x12, #32
        add x12, x7, x12
        mov x7, #-4294967295
        umulh x7, x7, x12
        mov x6, #4294967295
        mul x5, x6, x12
        umulh x6, x6, x12
        adds x7, x7, x5
        adcs x6, x6, x12
        adc x5, xzr, xzr
        subs x13, x13, x7
        sbcs x14, x14, x6
        sbcs x15, x15, x5
        sbcs x16, x16, xzr
        sbcs x17, x17, xzr
        sbc x12, x12, xzr
        lsl x7, x13, #32
        add x13, x7, x13
        mov x7, #-4294967295
        umulh x7, x7, x13
        mov x6, #4294967295
        mul x5, x6, x13
        umulh x6, x6, x13
        adds x7, x7, x5
        adcs x6, x6, x13
        adc x5, xzr, xzr
        subs x14, x14, x7
        sbcs x15, x15, x6
        sbcs x16, x16, x5
        sbcs x17, x17, xzr
        sbcs x12, x12, xzr
        sbc x13, x13, xzr
        lsl x7, x14, #32
        add x14, x7, x14
        mov x7, #-4294967295
        umulh x7, x7, x14
        mov x6, #4294967295
        mul x5, x6, x14
        umulh x6, x6, x14
        adds x7, x7, x5
        adcs x6, x6, x14
        adc x5, xzr, xzr
        subs x15, x15, x7
        sbcs x16, x16, x6
        sbcs x17, x17, x5
        sbcs x12, x12, xzr
        sbcs x13, x13, xzr
        sbc x14, x14, xzr
        lsl x7, x15, #32
        add x15, x7, x15
        mov x7, #-4294967295
        umulh x7, x7, x15
        mov x6, #4294967295
        mul x5, x6, x15
        umulh x6, x6, x15
        adds x7, x7, x5
        adcs x6, x6, x15
        adc x5, xzr, xzr
        subs x16, x16, x7
        sbcs x17, x17, x6
        sbcs x12, x12, x5
        sbcs x13, x13, xzr
        sbcs x14, x14, xzr
        sbc x15, x15, xzr
        lsl x7, x16, #32
        add x16, x7, x16
        mov x7, #-4294967295
        umulh x7, x7, x16
        mov x6, #4294967295
        mul x5, x6, x16
        umulh x6, x6, x16
        adds x7, x7, x5
        adcs x6, x6, x16
        adc x5, xzr, xzr
        subs x17, x17, x7
        sbcs x12, x12, x6
        sbcs x13, x13, x5
        sbcs x14, x14, xzr
        sbcs x15, x15, xzr
        sbc x16, x16, xzr
        lsl x7, x17, #32
        add x17, x7, x17
        mov x7, #-4294967295
        umulh x7, x7, x17
        mov x6, #4294967295
        mul x5, x6, x17
        umulh x6, x6, x17
        adds x7, x7, x5
        adcs x6, x6, x17
        adc x5, xzr, xzr
        subs x12, x12, x7
        sbcs x13, x13, x6
        sbcs x14, x14, x5
        sbcs x15, x15, xzr
        sbcs x16, x16, xzr
        sbc x17, x17, xzr
        adds x12, x12, x19
        adcs x13, x13, x20
        adcs x14, x14, x21
        adcs x15, x15, x22
        adcs x16, x16, x2
        adcs x17, x17, x1
        adc x10, xzr, xzr
        mov x11, #-4294967295
        adds x19, x12, x11
        mov x11, #4294967295
        adcs x20, x13, x11
        mov x11, #1
        adcs x21, x14, x11
        adcs x22, x15, xzr
        adcs x2, x16, xzr
        adcs x1, x17, xzr
        adcs x10, x10, xzr
        csel x12, x12, x19, eq
        csel x13, x13, x20, eq
        csel x14, x14, x21, eq
        csel x15, x15, x22, eq
        csel x16, x16, x2, eq
        csel x17, x17, x1, eq
        stp x12, x13, [sp, #288]
        stp x14, x15, [sp, #304]
        stp x16, x17, [sp, #320]
        ldp x5, x6, [sp, #96]
        ldp x4, x3, [sp, #192]
        subs x5, x5, x4
        sbcs x6, x6, x3
        ldp x7, x8, [sp, #112]
        ldp x4, x3, [sp, #208]
        sbcs x7, x7, x4
        sbcs x8, x8, x3
        ldp x9, x10, [sp, #128]
        ldp x4, x3, [sp, #224]
        sbcs x9, x9, x4
        sbcs x10, x10, x3
        csetm x3, lo
        mov x4, #4294967295
        and x4, x4, x3
        adds x5, x5, x4
        eor x4, x4, x3
        adcs x6, x6, x4
        mov x4, #-2
        and x4, x4, x3
        adcs x7, x7, x4
        adcs x8, x8, x3
        adcs x9, x9, x3
        adc x10, x10, x3
        stp x5, x6, [sp, #240]
        stp x7, x8, [sp, #256]
        stp x9, x10, [sp, #272]
        ldp x5, x6, [sp, #48]
        ldp x4, x3, [sp, #288]
        subs x5, x5, x4
        sbcs x6, x6, x3
        ldp x7, x8, [sp, #64]
        ldp x4, x3, [sp, #304]
        sbcs x7, x7, x4
        sbcs x8, x8, x3
        ldp x9, x10, [sp, #80]
        ldp x4, x3, [sp, #320]
        sbcs x9, x9, x4
        sbcs x10, x10, x3
        csetm x3, lo
        mov x4, #4294967295
        and x4, x4, x3
        adds x5, x5, x4
        eor x4, x4, x3
        adcs x6, x6, x4
        mov x4, #-2
        and x4, x4, x3
        adcs x7, x7, x4
        adcs x8, x8, x3
        adcs x9, x9, x3
        adc x10, x10, x3
        stp x5, x6, [sp, #48]
        stp x7, x8, [sp, #64]
        stp x9, x10, [sp, #80]
        ldp x2, x3, [sp, #240]
        mul x9, x2, x3
        umulh x10, x2, x3
        ldp x4, x5, [sp, #256]
        mul x8, x2, x4
        adds x10, x10, x8
        mul x11, x2, x5
        mul x8, x3, x4
        adcs x11, x11, x8
        umulh x12, x2, x5
        mul x8, x3, x5
        adcs x12, x12, x8
        ldp x6, x7, [sp, #272]
        mul x13, x2, x7
        mul x8, x3, x6
        adcs x13, x13, x8
        umulh x14, x2, x7
        mul x8, x3, x7
        adcs x14, x14, x8
        mul x15, x5, x6
        adcs x15, x15, xzr
        umulh x16, x5, x6
        adc x16, x16, xzr
        umulh x8, x2, x4
        adds x11, x11, x8
        umulh x8, x3, x4
        adcs x12, x12, x8
        umulh x8, x3, x5
        adcs x13, x13, x8
        umulh x8, x3, x6
        adcs x14, x14, x8
        umulh x8, x3, x7
        adcs x15, x15, x8
        adc x16, x16, xzr
        mul x8, x2, x6
        adds x12, x12, x8
        mul x8, x4, x5
        adcs x13, x13, x8
        mul x8, x4, x6
        adcs x14, x14, x8
        mul x8, x4, x7
        adcs x15, x15, x8
        mul x8, x5, x7
        adcs x16, x16, x8
        mul x17, x6, x7
        adcs x17, x17, xzr
        umulh x19, x6, x7
        adc x19, x19, xzr
        umulh x8, x2, x6
        adds x13, x13, x8
        umulh x8, x4, x5
        adcs x14, x14, x8
        umulh x8, x4, x6
        adcs x15, x15, x8
        umulh x8, x4, x7
        adcs x16, x16, x8
        umulh x8, x5, x7
        adcs x17, x17, x8
        adc x19, x19, xzr
        adds x9, x9, x9
        adcs x10, x10, x10
        adcs x11, x11, x11
        adcs x12, x12, x12
        adcs x13, x13, x13
        adcs x14, x14, x14
        adcs x15, x15, x15
        adcs x16, x16, x16
        adcs x17, x17, x17
        adcs x19, x19, x19
        cset x20, hs
        umulh x8, x2, x2
        mul x2, x2, x2
        adds x9, x9, x8
        mul x8, x3, x3
        adcs x10, x10, x8
        umulh x8, x3, x3
        adcs x11, x11, x8
        mul x8, x4, x4
        adcs x12, x12, x8
        umulh x8, x4, x4
        adcs x13, x13, x8
        mul x8, x5, x5
        adcs x14, x14, x8
        umulh x8, x5, x5
        adcs x15, x15, x8
        mul x8, x6, x6
        adcs x16, x16, x8
        umulh x8, x6, x6
        adcs x17, x17, x8
        mul x8, x7, x7
        adcs x19, x19, x8
        umulh x8, x7, x7
        adc x20, x20, x8
        lsl x5, x2, #32
        add x2, x5, x2
        mov x5, #-4294967295
        umulh x5, x5, x2
        mov x4, #4294967295
        mul x3, x4, x2
        umulh x4, x4, x2
        adds x5, x5, x3
        adcs x4, x4, x2
        adc x3, xzr, xzr
        subs x9, x9, x5
        sbcs x10, x10, x4
        sbcs x11, x11, x3
        sbcs x12, x12, xzr
        sbcs x13, x13, xzr
        sbc x2, x2, xzr
        lsl x5, x9, #32
        add x9, x5, x9
        mov x5, #-4294967295
        umulh x5, x5, x9
        mov x4, #4294967295
        mul x3, x4, x9
        umulh x4, x4, x9
        adds x5, x5, x3
        adcs x4, x4, x9
        adc x3, xzr, xzr
        subs x10, x10, x5
        sbcs x11, x11, x4
        sbcs x12, x12, x3
        sbcs x13, x13, xzr
        sbcs x2, x2, xzr
        sbc x9, x9, xzr
        lsl x5, x10, #32
        add x10, x5, x10
        mov x5, #-4294967295
        umulh x5, x5, x10
        mov x4, #4294967295
        mul x3, x4, x10
        umulh x4, x4, x10
        adds x5, x5, x3
        adcs x4, x4, x10
        adc x3, xzr, xzr
        subs x11, x11, x5
        sbcs x12, x12, x4
        sbcs x13, x13, x3
        sbcs x2, x2, xzr
        sbcs x9, x9, xzr
        sbc x10, x10, xzr
        lsl x5, x11, #32
        add x11, x5, x11
        mov x5, #-4294967295
        umulh x5, x5, x11
        mov x4, #4294967295
        mul x3, x4, x11
        umulh x4, x4, x11
        adds x5, x5, x3
        adcs x4, x4, x11
        adc x3, xzr, xzr
        subs x12, x12, x5
        sbcs x13, x13, x4
        sbcs x2, x2, x3
        sbcs x9, x9, xzr
        sbcs x10, x10, xzr
        sbc x11, x11, xzr
        lsl x5, x12, #32
        add x12, x5, x12
        mov x5, #-4294967295
        umulh x5, x5, x12
        mov x4, #4294967295
        mul x3, x4, x12
        umulh x4, x4, x12
        adds x5, x5, x3
        adcs x4, x4, x12
        adc x3, xzr, xzr
        subs x13, x13, x5
        sbcs x2, x2, x4
        sbcs x9, x9, x3
        sbcs x10, x10, xzr
        sbcs x11, x11, xzr
        sbc x12, x12, xzr
        lsl x5, x13, #32
        add x13, x5, x13
        mov x5, #-4294967295
        umulh x5, x5, x13
        mov x4, #4294967295
        mul x3, x4, x13
        umulh x4, x4, x13
        adds x5, x5, x3
        adcs x4, x4, x13
        adc x3, xzr, xzr
        subs x2, x2, x5
        sbcs x9, x9, x4
        sbcs x10, x10, x3
        sbcs x11, x11, xzr
        sbcs x12, x12, xzr
        sbc x13, x13, xzr
        adds x2, x2, x14
        adcs x9, x9, x15
        adcs x10, x10, x16
        adcs x11, x11, x17
        adcs x12, x12, x19
        adcs x13, x13, x20
        mov x14, #-4294967295
        mov x15, #4294967295
        csel x14, x14, xzr, hs
        csel x15, x15, xzr, hs
        cset x16, hs
        adds x2, x2, x14
        adcs x9, x9, x15
        adcs x10, x10, x16
        adcs x11, x11, xzr
        adcs x12, x12, xzr
        adc x13, x13, xzr
        stp x2, x9, [sp, #144]
        stp x10, x11, [sp, #160]
        stp x12, x13, [sp, #176]
        ldp x2, x3, [sp, #48]
        mul x9, x2, x3
        umulh x10, x2, x3
        ldp x4, x5, [sp, #64]
        mul x8, x2, x4
        adds x10, x10, x8
        mul x11, x2, x5
        mul x8, x3, x4
        adcs x11, x11, x8
        umulh x12, x2, x5
        mul x8, x3, x5
        adcs x12, x12, x8
        ldp x6, x7, [sp, #80]
        mul x13, x2, x7
        mul x8, x3, x6
        adcs x13, x13, x8
        umulh x14, x2, x7
        mul x8, x3, x7
        adcs x14, x14, x8
        mul x15, x5, x6
        adcs x15, x15, xzr
        umulh x16, x5, x6
        adc x16, x16, xzr
        umulh x8, x2, x4
        adds x11, x11, x8
        umulh x8, x3, x4
        adcs x12, x12, x8
        umulh x8, x3, x5
        adcs x13, x13, x8
        umulh x8, x3, x6
        adcs x14, x14, x8
        umulh x8, x3, x7
        adcs x15, x15, x8
        adc x16, x16, xzr
        mul x8, x2, x6
        adds x12, x12, x8
        mul x8, x4, x5
        adcs x13, x13, x8
        mul x8, x4, x6
        adcs x14, x14, x8
        mul x8, x4, x7
        adcs x15, x15, x8
        mul x8, x5, x7
        adcs x16, x16, x8
        mul x17, x6, x7
        adcs x17, x17, xzr
        umulh x19, x6, x7
        adc x19, x19, xzr
        umulh x8, x2, x6
        adds x13, x13, x8
        umulh x8, x4, x5
        adcs x14, x14, x8
        umulh x8, x4, x6
        adcs x15, x15, x8
        umulh x8, x4, x7
        adcs x16, x16, x8
        umulh x8, x5, x7
        adcs x17, x17, x8
        adc x19, x19, xzr
        adds x9, x9, x9
        adcs x10, x10, x10
        adcs x11, x11, x11
        adcs x12, x12, x12
        adcs x13, x13, x13
        adcs x14, x14, x14
        adcs x15, x15, x15
        adcs x16, x16, x16
        adcs x17, x17, x17
        adcs x19, x19, x19
        cset x20, hs
        umulh x8, x2, x2
        mul x2, x2, x2
        adds x9, x9, x8
        mul x8, x3, x3
        adcs x10, x10, x8
        umulh x8, x3, x3
        adcs x11, x11, x8
        mul x8, x4, x4
        adcs x12, x12, x8
        umulh x8, x4, x4
        adcs x13, x13, x8
        mul x8, x5, x5
        adcs x14, x14, x8
        umulh x8, x5, x5
        adcs x15, x15, x8
        mul x8, x6, x6
        adcs x16, x16, x8
        umulh x8, x6, x6
        adcs x17, x17, x8
        mul x8, x7, x7
        adcs x19, x19, x8
        umulh x8, x7, x7
        adc x20, x20, x8
        lsl x5, x2, #32
        add x2, x5, x2
        mov x5, #-4294967295
        umulh x5, x5, x2
        mov x4, #4294967295
        mul x3, x4, x2
        umulh x4, x4, x2
        adds x5, x5, x3
        adcs x4, x4, x2
        adc x3, xzr, xzr
        subs x9, x9, x5
        sbcs x10, x10, x4
        sbcs x11, x11, x3
        sbcs x12, x12, xzr
        sbcs x13, x13, xzr
        sbc x2, x2, xzr
        lsl x5, x9, #32
        add x9, x5, x9
        mov x5, #-4294967295
        umulh x5, x5, x9
        mov x4, #4294967295
        mul x3, x4, x9
        umulh x4, x4, x9
        adds x5, x5, x3
        adcs x4, x4, x9
        adc x3, xzr, xzr
        subs x10, x10, x5
        sbcs x11, x11, x4
        sbcs x12, x12, x3
        sbcs x13, x13, xzr
        sbcs x2, x2, xzr
        sbc x9, x9, xzr
        lsl x5, x10, #32
        add x10, x5, x10
        mov x5, #-4294967295
        umulh x5, x5, x10
        mov x4, #4294967295
        mul x3, x4, x10
        umulh x4, x4, x10
        adds x5, x5, x3
        adcs x4, x4, x10
        adc x3, xzr, xzr
        subs x11, x11, x5
        sbcs x12, x12, x4
        sbcs x13, x13, x3
        sbcs x2, x2, xzr
        sbcs x9, x9, xzr
        sbc x10, x10, xzr
        lsl x5, x11, #32
        add x11, x5, x11
        mov x5, #-4294967295
        umulh x5, x5, x11
        mov x4, #4294967295
        mul x3, x4, x11
        umulh x4, x4, x11
        adds x5, x5, x3
        adcs x4, x4, x11
        adc x3, xzr, xzr
        subs x12, x12, x5
        sbcs x13, x13, x4
        sbcs x2, x2, x3
        sbcs x9, x9, xzr
        sbcs x10, x10, xzr
        sbc x11, x11, xzr
        lsl x5, x12, #32
        add x12, x5, x12
        mov x5, #-4294967295
        umulh x5, x5, x12
        mov x4, #4294967295
        mul x3, x4, x12
        umulh x4, x4, x12
        adds x5, x5, x3
        adcs x4, x4, x12
        adc x3, xzr, xzr
        subs x13, x13, x5
        sbcs x2, x2, x4
        sbcs x9, x9, x3
        sbcs x10, x10, xzr
        sbcs x11, x11, xzr
        sbc x12, x12, xzr
        lsl x5, x13, #32
        add x13, x5, x13
        mov x5, #-4294967295
        umulh x5, x5, x13
        mov x4, #4294967295
        mul x3, x4, x13
        umulh x4, x4, x13
        adds x5, x5, x3
        adcs x4, x4, x13
        adc x3, xzr, xzr
        subs x2, x2, x5
        sbcs x9, x9, x4
        sbcs x10, x10, x3
        sbcs x11, x11, xzr
        sbcs x12, x12, xzr
        sbc x13, x13, xzr
        adds x2, x2, x14
        adcs x9, x9, x15
        adcs x10, x10, x16
        adcs x11, x11, x17
        adcs x12, x12, x19
        adcs x13, x13, x20
        adc x6, xzr, xzr
        mov x8, #-4294967295
        adds x14, x2, x8
        mov x8, #4294967295
        adcs x15, x9, x8
        mov x8, #1
        adcs x16, x10, x8
        adcs x17, x11, xzr
        adcs x19, x12, xzr
        adcs x20, x13, xzr
        adcs x6, x6, xzr
        csel x2, x2, x14, eq
        csel x9, x9, x15, eq
        csel x10, x10, x16, eq
        csel x11, x11, x17, eq
        csel x12, x12, x19, eq
        csel x13, x13, x20, eq
        stp x2, x9, [sp]
        stp x10, x11, [sp, #16]
        stp x12, x13, [sp, #32]
        ldp x3, x4, [sp, #144]
        ldp x5, x6, [sp, #192]
        mul x12, x3, x5
        umulh x13, x3, x5
        mul x11, x3, x6
        umulh x14, x3, x6
        adds x13, x13, x11
        ldp x7, x8, [sp, #208]
        mul x11, x3, x7
        umulh x15, x3, x7
        adcs x14, x14, x11
        mul x11, x3, x8
        umulh x16, x3, x8
        adcs x15, x15, x11
        ldp x9, x10, [sp, #224]
        mul x11, x3, x9
        umulh x17, x3, x9
        adcs x16, x16, x11
        mul x11, x3, x10
        umulh x19, x3, x10
        adcs x17, x17, x11
        adc x19, x19, xzr
        mul x11, x4, x5
        adds x13, x13, x11
        mul x11, x4, x6
        adcs x14, x14, x11
        mul x11, x4, x7
        adcs x15, x15, x11
        mul x11, x4, x8
        adcs x16, x16, x11
        mul x11, x4, x9
        adcs x17, x17, x11
        mul x11, x4, x10
        adcs x19, x19, x11
        cset x20, hs
        umulh x11, x4, x5
        adds x14, x14, x11
        umulh x11, x4, x6
        adcs x15, x15, x11
        umulh x11, x4, x7
        adcs x16, x16, x11
        umulh x11, x4, x8
        adcs x17, x17, x11
        umulh x11, x4, x9
        adcs x19, x19, x11
        umulh x11, x4, x10
        adc x20, x20, x11
        ldp x3, x4, [sp, #160]
        mul x11, x3, x5
        adds x14, x14, x11
        mul x11, x3, x6
        adcs x15, x15, x11
        mul x11, x3, x7
        adcs x16, x16, x11
        mul x11, x3, x8
        adcs x17, x17, x11
        mul x11, x3, x9
        adcs x19, x19, x11
        mul x11, x3, x10
        adcs x20, x20, x11
        cset x21, hs
        umulh x11, x3, x5
        adds x15, x15, x11
        umulh x11, x3, x6
        adcs x16, x16, x11
        umulh x11, x3, x7
        adcs x17, x17, x11
        umulh x11, x3, x8
        adcs x19, x19, x11
        umulh x11, x3, x9
        adcs x20, x20, x11
        umulh x11, x3, x10
        adc x21, x21, x11
        mul x11, x4, x5
        adds x15, x15, x11
        mul x11, x4, x6
        adcs x16, x16, x11
        mul x11, x4, x7
        adcs x17, x17, x11
        mul x11, x4, x8
        adcs x19, x19, x11
        mul x11, x4, x9
        adcs x20, x20, x11
        mul x11, x4, x10
        adcs x21, x21, x11
        cset x22, hs
        umulh x11, x4, x5
        adds x16, x16, x11
        umulh x11, x4, x6
        adcs x17, x17, x11
        umulh x11, x4, x7
        adcs x19, x19, x11
        umulh x11, x4, x8
        adcs x20, x20, x11
        umulh x11, x4, x9
        adcs x21, x21, x11
        umulh x11, x4, x10
        adc x22, x22, x11
        ldp x3, x4, [sp, #176]
        mul x11, x3, x5
        adds x16, x16, x11
        mul x11, x3, x6
        adcs x17, x17, x11
        mul x11, x3, x7
        adcs x19, x19, x11
        mul x11, x3, x8
        adcs x20, x20, x11
        mul x11, x3, x9
        adcs x21, x21, x11
        mul x11, x3, x10
        adcs x22, x22, x11
        cset x2, hs
        umulh x11, x3, x5
        adds x17, x17, x11
        umulh x11, x3, x6
        adcs x19, x19, x11
        umulh x11, x3, x7
        adcs x20, x20, x11
        umulh x11, x3, x8
        adcs x21, x21, x11
        umulh x11, x3, x9
        adcs x22, x22, x11
        umulh x11, x3, x10
        adc x2, x2, x11
        mul x11, x4, x5
        adds x17, x17, x11
        mul x11, x4, x6
        adcs x19, x19, x11
        mul x11, x4, x7
        adcs x20, x20, x11
        mul x11, x4, x8
        adcs x21, x21, x11
        mul x11, x4, x9
        adcs x22, x22, x11
        mul x11, x4, x10
        adcs x2, x2, x11
        cset x1, hs
        umulh x11, x4, x5
        adds x19, x19, x11
        umulh x11, x4, x6
        adcs x20, x20, x11
        umulh x11, x4, x7
        adcs x21, x21, x11
        umulh x11, x4, x8
        adcs x22, x22, x11
        umulh x11, x4, x9
        adcs x2, x2, x11
        umulh x11, x4, x10
        adc x1, x1, x11
        lsl x7, x12, #32
        add x12, x7, x12
        mov x7, #-4294967295
        umulh x7, x7, x12
        mov x6, #4294967295
        mul x5, x6, x12
        umulh x6, x6, x12
        adds x7, x7, x5
        adcs x6, x6, x12
        adc x5, xzr, xzr
        subs x13, x13, x7
        sbcs x14, x14, x6
        sbcs x15, x15, x5
        sbcs x16, x16, xzr
        sbcs x17, x17, xzr
        sbc x12, x12, xzr
        lsl x7, x13, #32
        add x13, x7, x13
        mov x7, #-4294967295
        umulh x7, x7, x13
        mov x6, #4294967295
        mul x5, x6, x13
        umulh x6, x6, x13
        adds x7, x7, x5
        adcs x6, x6, x13
        adc x5, xzr, xzr
        subs x14, x14, x7
        sbcs x15, x15, x6
        sbcs x16, x16, x5
        sbcs x17, x17, xzr
        sbcs x12, x12, xzr
        sbc x13, x13, xzr
        lsl x7, x14, #32
        add x14, x7, x14
        mov x7, #-4294967295
        umulh x7, x7, x14
        mov x6, #4294967295
        mul x5, x6, x14
        umulh x6, x6, x14
        adds x7, x7, x5
        adcs x6, x6, x14
        adc x5, xzr, xzr
        subs x15, x15, x7
        sbcs x16, x16, x6
        sbcs x17, x17, x5
        sbcs x12, x12, xzr
        sbcs x13, x13, xzr
        sbc x14, x14, xzr
        lsl x7, x15, #32
        add x15, x7, x15
        mov x7, #-4294967295
        umulh x7, x7, x15
        mov x6, #4294967295
        mul x5, x6, x15
        umulh x6, x6, x15
        adds x7, x7, x5
        adcs x6, x6, x15
        adc x5, xzr, xzr
        subs x16, x16, x7
        sbcs x17, x17, x6
        sbcs x12, x12, x5
        sbcs x13, x13, xzr
        sbcs x14, x14, xzr
        sbc x15, x15, xzr
        lsl x7, x16, #32
        add x16, x7, x16
        mov x7, #-4294967295
        umulh x7, x7, x16
        mov x6, #4294967295
        mul x5, x6, x16
        umulh x6, x6, x16
        adds x7, x7, x5
        adcs x6, x6, x16
        adc x5, xzr, xzr
        subs x17, x17, x7
        sbcs x12, x12, x6
        sbcs x13, x13, x5
        sbcs x14, x14, xzr
        sbcs x15, x15, xzr
        sbc x16, x16, xzr
        lsl x7, x17, #32
        add x17, x7, x17
        mov x7, #-4294967295
        umulh x7, x7, x17
        mov x6, #4294967295
        mul x5, x6, x17
        umulh x6, x6, x17
        adds x7, x7, x5
        adcs x6, x6, x17
        adc x5, xzr, xzr
        subs x12, x12, x7
        sbcs x13, x13, x6
        sbcs x14, x14, x5
        sbcs x15, x15, xzr
        sbcs x16, x16, xzr
        sbc x17, x17, xzr
        adds x12, x12, x19
        adcs x13, x13, x20
        adcs x14, x14, x21
        adcs x15, x15, x22
        adcs x16, x16, x2
        adcs x17, x17, x1
        adc x10, xzr, xzr
        mov x11, #-4294967295
        adds x19, x12, x11
        mov x11, #4294967295
        adcs x20, x13, x11
        mov x11, #1
        adcs x21, x14, x11
        adcs x22, x15, xzr
        adcs x2, x16, xzr
        adcs x1, x17, xzr
        adcs x10, x10, xzr
        csel x12, x12, x19, eq
        csel x13, x13, x20, eq
        csel x14, x14, x21, eq
        csel x15, x15, x22, eq
        csel x16, x16, x2, eq
        csel x17, x17, x1, eq
        stp x12, x13, [sp, #192]
        stp x14, x15, [sp, #208]
        stp x16, x17, [sp, #224]
        ldp x3, x4, [sp, #144]
        ldp x5, x6, [sp, #96]
        mul x12, x3, x5
        umulh x13, x3, x5
        mul x11, x3, x6
        umulh x14, x3, x6
        adds x13, x13, x11
        ldp x7, x8, [sp, #112]
        mul x11, x3, x7
        umulh x15, x3, x7
        adcs x14, x14, x11
        mul x11, x3, x8
        umulh x16, x3, x8
        adcs x15, x15, x11
        ldp x9, x10, [sp, #128]
        mul x11, x3, x9
        umulh x17, x3, x9
        adcs x16, x16, x11
        mul x11, x3, x10
        umulh x19, x3, x10
        adcs x17, x17, x11
        adc x19, x19, xzr
        mul x11, x4, x5
        adds x13, x13, x11
        mul x11, x4, x6
        adcs x14, x14, x11
        mul x11, x4, x7
        adcs x15, x15, x11
        mul x11, x4, x8
        adcs x16, x16, x11
        mul x11, x4, x9
        adcs x17, x17, x11
        mul x11, x4, x10
        adcs x19, x19, x11
        cset x20, hs
        umulh x11, x4, x5
        adds x14, x14, x11
        umulh x11, x4, x6
        adcs x15, x15, x11
        umulh x11, x4, x7
        adcs x16, x16, x11
        umulh x11, x4, x8
        adcs x17, x17, x11
        umulh x11, x4, x9
        adcs x19, x19, x11
        umulh x11, x4, x10
        adc x20, x20, x11
        ldp x3, x4, [sp, #160]
        mul x11, x3, x5
        adds x14, x14, x11
        mul x11, x3, x6
        adcs x15, x15, x11
        mul x11, x3, x7
        adcs x16, x16, x11
        mul x11, x3, x8
        adcs x17, x17, x11
        mul x11, x3, x9
        adcs x19, x19, x11
        mul x11, x3, x10
        adcs x20, x20, x11
        cset x21, hs
        umulh x11, x3, x5
        adds x15, x15, x11
        umulh x11, x3, x6
        adcs x16, x16, x11
        umulh x11, x3, x7
        adcs x17, x17, x11
        umulh x11, x3, x8
        adcs x19, x19, x11
        umulh x11, x3, x9
        adcs x20, x20, x11
        umulh x11, x3, x10
        adc x21, x21, x11
        mul x11, x4, x5
        adds x15, x15, x11
        mul x11, x4, x6
        adcs x16, x16, x11
        mul x11, x4, x7
        adcs x17, x17, x11
        mul x11, x4, x8
        adcs x19, x19, x11
        mul x11, x4, x9
        adcs x20, x20, x11
        mul x11, x4, x10
        adcs x21, x21, x11
        cset x22, hs
        umulh x11, x4, x5
        adds x16, x16, x11
        umulh x11, x4, x6
        adcs x17, x17, x11
        umulh x11, x4, x7
        adcs x19, x19, x11
        umulh x11, x4, x8
        adcs x20, x20, x11
        umulh x11, x4, x9
        adcs x21, x21, x11
        umulh x11, x4, x10
        adc x22, x22, x11
        ldp x3, x4, [sp, #176]
        mul x11, x3, x5
        adds x16, x16, x11
        mul x11, x3, x6
        adcs x17, x17, x11
        mul x11, x3, x7
        adcs x19, x19, x11
        mul x11, x3, x8
        adcs x20, x20, x11
        mul x11, x3, x9
        adcs x21, x21, x11
        mul x11, x3, x10
        adcs x22, x22, x11
        cset x2, hs
        umulh x11, x3, x5
        adds x17, x17, x11
        umulh x11, x3, x6
        adcs x19, x19, x11
        umulh x11, x3, x7
        adcs x20, x20, x11
        umulh x11, x3, x8
        adcs x21, x21, x11
        umulh x11, x3, x9
        adcs x22, x22, x11
        umulh x11, x3, x10
        adc x2, x2, x11
        mul x11, x4, x5
        adds x17, x17, x11
        mul x11, x4, x6
        adcs x19, x19, x11
        mul x11, x4, x7
        adcs x20, x20, x11
        mul x11, x4, x8
        adcs x21, x21, x11
        mul x11, x4, x9
        adcs x22, x22, x11
        mul x11, x4, x10
        adcs x2, x2, x11
        cset x1, hs
        umulh x11, x4, x5
        adds x19, x19, x11
        umulh x11, x4, x6
        adcs x20, x20, x11
        umulh x11, x4, x7
        adcs x21, x21, x11
        umulh x11, x4, x8
        adcs x22, x22, x11
        umulh x11, x4, x9
        adcs x2, x2, x11
        umulh x11, x4, x10
        adc x1, x1, x11
        lsl x7, x12, #32
        add x12, x7, x12
        mov x7, #-4294967295
        umulh x7, x7, x12
        mov x6, #4294967295
        mul x5, x6, x12
        umulh x6, x6, x12
        adds x7, x7, x5
        adcs x6, x6, x12
        adc x5, xzr, xzr
        subs x13, x13, x7
        sbcs x14, x14, x6
        sbcs x15, x15, x5
        sbcs x16, x16, xzr
        sbcs x17, x17, xzr
        sbc x12, x12, xzr
        lsl x7, x13, #32
        add x13, x7, x13
        mov x7, #-4294967295
        umulh x7, x7, x13
        mov x6, #4294967295
        mul x5, x6, x13
        umulh x6, x6, x13
        adds x7, x7, x5
        adcs x6, x6, x13
        adc x5, xzr, xzr
        subs x14, x14, x7
        sbcs x15, x15, x6
        sbcs x16, x16, x5
        sbcs x17, x17, xzr
        sbcs x12, x12, xzr
        sbc x13, x13, xzr
        lsl x7, x14, #32
        add x14, x7, x14
        mov x7, #-4294967295
        umulh x7, x7, x14
        mov x6, #4294967295
        mul x5, x6, x14
        umulh x6, x6, x14
        adds x7, x7, x5
        adcs x6, x6, x14
        adc x5, xzr, xzr
        subs x15, x15, x7
        sbcs x16, x16, x6
        sbcs x17, x17, x5
        sbcs x12, x12, xzr
        sbcs x13, x13, xzr
        sbc x14, x14, xzr
        lsl x7, x15, #32
        add x15, x7, x15
        mov x7, #-4294967295
        umulh x7, x7, x15
        mov x6, #4294967295
        mul x5, x6, x15
        umulh x6, x6, x15
        adds x7, x7, x5
        adcs x6, x6, x15
        adc x5, xzr, xzr
        subs x16, x16, x7
        sbcs x17, x17, x6
        sbcs x12, x12, x5
        sbcs x13, x13, xzr
        sbcs x14, x14, xzr
        sbc x15, x15, xzr
        lsl x7, x16, #32
        add x16, x7, x16
        mov x7, #-4294967295
        umulh x7, x7, x16
        mov x6, #4294967295
        mul x5, x6, x16
        umulh x6, x6, x16
        adds x7, x7, x5
        adcs x6, x6, x16
        adc x5, xzr, xzr
        subs x17, x17, x7
        sbcs x12, x12, x6
        sbcs x13, x13, x5
        sbcs x14, x14, xzr
        sbcs x15, x15, xzr
        sbc x16, x16, xzr
        lsl x7, x17, #32
        add x17, x7, x17
        mov x7, #-4294967295
        umulh x7, x7, x17
        mov x6, #4294967295
        mul x5, x6, x17
        umulh x6, x6, x17
        adds x7, x7, x5
        adcs x6, x6, x17
        adc x5, xzr, xzr
        subs x12, x12, x7
        sbcs x13, x13, x6
        sbcs x14, x14, x5
        sbcs x15, x15, xzr
        sbcs x16, x16, xzr
        sbc x17, x17, xzr
        adds x12, x12, x19
        adcs x13, x13, x20
        adcs x14, x14, x21
        adcs x15, x15, x22
        adcs x16, x16, x2
        adcs x17, x17, x1
        adc x10, xzr, xzr
        mov x11, #-4294967295
        adds x19, x12, x11
        mov x11, #4294967295
        adcs x20, x13, x11
        mov x11, #1
        adcs x21, x14, x11
        adcs x22, x15, xzr
        adcs x2, x16, xzr
        adcs x1, x17, xzr
        adcs x10, x10, xzr
        csel x12, x12, x19, eq
        csel x13, x13, x20, eq
        csel x14, x14, x21, eq
        csel x15, x15, x22, eq
        csel x16, x16, x2, eq
        csel x17, x17, x1, eq
        stp x12, x13, [sp, #96]
        stp x14, x15, [sp, #112]
        stp x16, x17, [sp, #128]
        ldp x5, x6, [sp]
        ldp x4, x3, [sp, #192]
        subs x5, x5, x4
        sbcs x6, x6, x3
        ldp x7, x8, [sp, #16]
        ldp x4, x3, [sp, #208]
        sbcs x7, x7, x4
        sbcs x8, x8, x3
        ldp x9, x10, [sp, #32]
        ldp x4, x3, [sp, #224]
        sbcs x9, x9, x4
        sbcs x10, x10, x3
        csetm x3, lo
        mov x4, #4294967295
        and x4, x4, x3
        adds x5, x5, x4
        eor x4, x4, x3
        adcs x6, x6, x4
        mov x4, #-2
        and x4, x4, x3
        adcs x7, x7, x4
        adcs x8, x8, x3
        adcs x9, x9, x3
        adc x10, x10, x3
        stp x5, x6, [sp]
        stp x7, x8, [sp, #16]
        stp x9, x10, [sp, #32]
        ldp x5, x6, [sp, #96]
        ldp x4, x3, [sp, #192]
        subs x5, x5, x4
        sbcs x6, x6, x3
        ldp x7, x8, [sp, #112]
        ldp x4, x3, [sp, #208]
        sbcs x7, x7, x4
        sbcs x8, x8, x3
        ldp x9, x10, [sp, #128]
        ldp x4, x3, [sp, #224]
        sbcs x9, x9, x4
        sbcs x10, x10, x3
        csetm x3, lo
        mov x4, #4294967295
        and x4, x4, x3
        adds x5, x5, x4
        eor x4, x4, x3
        adcs x6, x6, x4
        mov x4, #-2
        and x4, x4, x3
        adcs x7, x7, x4
        adcs x8, x8, x3
        adcs x9, x9, x3
        adc x10, x10, x3
        stp x5, x6, [sp, #144]
        stp x7, x8, [sp, #160]
        stp x9, x10, [sp, #176]
        ldp x3, x4, [sp, #240]
        ldp x5, x6, [x25, #96]
        mul x12, x3, x5
        umulh x13, x3, x5
        mul x11, x3, x6
        umulh x14, x3, x6
        adds x13, x13, x11
        ldp x7, x8, [x25, #112]
        mul x11, x3, x7
        umulh x15, x3, x7
        adcs x14, x14, x11
        mul x11, x3, x8
        umulh x16, x3, x8
        adcs x15, x15, x11
        ldp x9, x10, [x25, #128]
        mul x11, x3, x9
        umulh x17, x3, x9
        adcs x16, x16, x11
        mul x11, x3, x10
        umulh x19, x3, x10
        adcs x17, x17, x11
        adc x19, x19, xzr
        mul x11, x4, x5
        adds x13, x13, x11
        mul x11, x4, x6
        adcs x14, x14, x11
        mul x11, x4, x7
        adcs x15, x15, x11
        mul x11, x4, x8
        adcs x16, x16, x11
        mul x11, x4, x9
        adcs x17, x17, x11
        mul x11, x4, x10
        adcs x19, x19, x11
        cset x20, hs
        umulh x11, x4, x5
        adds x14, x14, x11
        umulh x11, x4, x6
        adcs x15, x15, x11
        umulh x11, x4, x7
        adcs x16, x16, x11
        umulh x11, x4, x8
        adcs x17, x17, x11
        umulh x11, x4, x9
        adcs x19, x19, x11
        umulh x11, x4, x10
        adc x20, x20, x11
        ldp x3, x4, [sp, #256]
        mul x11, x3, x5
        adds x14, x14, x11
        mul x11, x3, x6
        adcs x15, x15, x11
        mul x11, x3, x7
        adcs x16, x16, x11
        mul x11, x3, x8
        adcs x17, x17, x11
        mul x11, x3, x9
        adcs x19, x19, x11
        mul x11, x3, x10
        adcs x20, x20, x11
        cset x21, hs
        umulh x11, x3, x5
        adds x15, x15, x11
        umulh x11, x3, x6
        adcs x16, x16, x11
        umulh x11, x3, x7
        adcs x17, x17, x11
        umulh x11, x3, x8
        adcs x19, x19, x11
        umulh x11, x3, x9
        adcs x20, x20, x11
        umulh x11, x3, x10
        adc x21, x21, x11
        mul x11, x4, x5
        adds x15, x15, x11
        mul x11, x4, x6
        adcs x16, x16, x11
        mul x11, x4, x7
        adcs x17, x17, x11
        mul x11, x4, x8
        adcs x19, x19, x11
        mul x11, x4, x9
        adcs x20, x20, x11
        mul x11, x4, x10
        adcs x21, x21, x11
        cset x22, hs
        umulh x11, x4, x5
        adds x16, x16, x11
        umulh x11, x4, x6
        adcs x17, x17, x11
        umulh x11, x4, x7
        adcs x19, x19, x11
        umulh x11, x4, x8
        adcs x20, x20, x11
        umulh x11, x4, x9
        adcs x21, x21, x11
        umulh x11, x4, x10
        adc x22, x22, x11
        ldp x3, x4, [sp, #272]
        mul x11, x3, x5
        adds x16, x16, x11
        mul x11, x3, x6
        adcs x17, x17, x11
        mul x11, x3, x7
        adcs x19, x19, x11
        mul x11, x3, x8
        adcs x20, x20, x11
        mul x11, x3, x9
        adcs x21, x21, x11
        mul x11, x3, x10
        adcs x22, x22, x11
        cset x2, hs
        umulh x11, x3, x5
        adds x17, x17, x11
        umulh x11, x3, x6
        adcs x19, x19, x11
        umulh x11, x3, x7
        adcs x20, x20, x11
        umulh x11, x3, x8
        adcs x21, x21, x11
        umulh x11, x3, x9
        adcs x22, x22, x11
        umulh x11, x3, x10
        adc x2, x2, x11
        mul x11, x4, x5
        adds x17, x17, x11
        mul x11, x4, x6
        adcs x19, x19, x11
        mul x11, x4, x7
        adcs x20, x20, x11
        mul x11, x4, x8
        adcs x21, x21, x11
        mul x11, x4, x9
        adcs x22, x22, x11
        mul x11, x4, x10
        adcs x2, x2, x11
        cset x1, hs
        umulh x11, x4, x5
        adds x19, x19, x11
        umulh x11, x4, x6
        adcs x20, x20, x11
        umulh x11, x4, x7
        adcs x21, x21, x11
        umulh x11, x4, x8
        adcs x22, x22, x11
        umulh x11, x4, x9
        adcs x2, x2, x11
        umulh x11, x4, x10
        adc x1, x1, x11
        lsl x7, x12, #32
        add x12, x7, x12
        mov x7, #-4294967295
        umulh x7, x7, x12
        mov x6, #4294967295
        mul x5, x6, x12
        umulh x6, x6, x12
        adds x7, x7, x5
        adcs x6, x6, x12
        adc x5, xzr, xzr
        subs x13, x13, x7
        sbcs x14, x14, x6
        sbcs x15, x15, x5
        sbcs x16, x16, xzr
        sbcs x17, x17, xzr
        sbc x12, x12, xzr
        lsl x7, x13, #32
        add x13, x7, x13
        mov x7, #-4294967295
        umulh x7, x7, x13
        mov x6, #4294967295
        mul x5, x6, x13
        umulh x6, x6, x13
        adds x7, x7, x5
        adcs x6, x6, x13
        adc x5, xzr, xzr
        subs x14, x14, x7
        sbcs x15, x15, x6
        sbcs x16, x16, x5
        sbcs x17, x17, xzr
        sbcs x12, x12, xzr
        sbc x13, x13, xzr
        lsl x7, x14, #32
        add x14, x7, x14
        mov x7, #-4294967295
        umulh x7, x7, x14
        mov x6, #4294967295
        mul x5, x6, x14
        umulh x6, x6, x14
        adds x7, x7, x5
        adcs x6, x6, x14
        adc x5, xzr, xzr
        subs x15, x15, x7
        sbcs x16, x16, x6
        sbcs x17, x17, x5
        sbcs x12, x12, xzr
        sbcs x13, x13, xzr
        sbc x14, x14, xzr
        lsl x7, x15, #32
        add x15, x7, x15
        mov x7, #-4294967295
        umulh x7, x7, x15
        mov x6, #4294967295
        mul x5, x6, x15
        umulh x6, x6, x15
        adds x7, x7, x5
        adcs x6, x6, x15
        adc x5, xzr, xzr
        subs x16, x16, x7
        sbcs x17, x17, x6
        sbcs x12, x12, x5
        sbcs x13, x13, xzr
        sbcs x14, x14, xzr
        sbc x15, x15, xzr
        lsl x7, x16, #32
        add x16, x7, x16
        mov x7, #-4294967295
        umulh x7, x7, x16
        mov x6, #4294967295
        mul x5, x6, x16
        umulh x6, x6, x16
        adds x7, x7, x5
        adcs x6, x6, x16
        adc x5, xzr, xzr
        subs x17, x17, x7
        sbcs x12, x12, x6
        sbcs x13, x13, x5
        sbcs x14, x14, xzr
        sbcs x15, x15, xzr
        sbc x16, x16, xzr
        lsl x7, x17, #32
        add x17, x7, x17
        mov x7, #-4294967295
        umulh x7, x7, x17
        mov x6, #4294967295
        mul x5, x6, x17
        umulh x6, x6, x17
        adds x7, x7, x5
        adcs x6, x6, x17
        adc x5, xzr, xzr
        subs x12, x12, x7
        sbcs x13, x13, x6
        sbcs x14, x14, x5
        sbcs x15, x15, xzr
        sbcs x16, x16, xzr
        sbc x17, x17, xzr
        adds x12, x12, x19
        adcs x13, x13, x20
        adcs x14, x14, x21
        adcs x15, x15, x22
        adcs x16, x16, x2
        adcs x17, x17, x1
        adc x10, xzr, xzr
        mov x11, #-4294967295
        adds x19, x12, x11
        mov x11, #4294967295
        adcs x20, x13, x11
        mov x11, #1
        adcs x21, x14, x11
        adcs x22, x15, xzr
        adcs x2, x16, xzr
        adcs x1, x17, xzr
        adcs x10, x10, xzr
        csel x12, x12, x19, eq
        csel x13, x13, x20, eq
        csel x14, x14, x21, eq
        csel x15, x15, x22, eq
        csel x16, x16, x2, eq
        csel x17, x17, x1, eq
        stp x12, x13, [sp, #240]
        stp x14, x15, [sp, #256]
        stp x16, x17, [sp, #272]
        ldp x5, x6, [sp]
        ldp x4, x3, [sp, #96]
        subs x5, x5, x4
        sbcs x6, x6, x3
        ldp x7, x8, [sp, #16]
        ldp x4, x3, [sp, #112]
        sbcs x7, x7, x4
        sbcs x8, x8, x3
        ldp x9, x10, [sp, #32]
        ldp x4, x3, [sp, #128]
        sbcs x9, x9, x4
        sbcs x10, x10, x3
        csetm x3, lo
        mov x4, #4294967295
        and x4, x4, x3
        adds x5, x5, x4
        eor x4, x4, x3
        adcs x6, x6, x4
        mov x4, #-2
        and x4, x4, x3
        adcs x7, x7, x4
        adcs x8, x8, x3
        adcs x9, x9, x3
        adc x10, x10, x3
        stp x5, x6, [sp]
        stp x7, x8, [sp, #16]
        stp x9, x10, [sp, #32]
        ldp x5, x6, [sp, #192]
        ldp x4, x3, [sp]
        subs x5, x5, x4
        sbcs x6, x6, x3
        ldp x7, x8, [sp, #208]
        ldp x4, x3, [sp, #16]
        sbcs x7, x7, x4
        sbcs x8, x8, x3
        ldp x9, x10, [sp, #224]
        ldp x4, x3, [sp, #32]
        sbcs x9, x9, x4
        sbcs x10, x10, x3
        csetm x3, lo
        mov x4, #4294967295
        and x4, x4, x3
        adds x5, x5, x4
        eor x4, x4, x3
        adcs x6, x6, x4
        mov x4, #-2
        and x4, x4, x3
        adcs x7, x7, x4
        adcs x8, x8, x3
        adcs x9, x9, x3
        adc x10, x10, x3
        stp x5, x6, [sp, #192]
        stp x7, x8, [sp, #208]
        stp x9, x10, [sp, #224]
        ldp x3, x4, [sp, #144]
        ldp x5, x6, [sp, #288]
        mul x12, x3, x5
        umulh x13, x3, x5
        mul x11, x3, x6
        umulh x14, x3, x6
        adds x13, x13, x11
        ldp x7, x8, [sp, #304]
        mul x11, x3, x7
        umulh x15, x3, x7
        adcs x14, x14, x11
        mul x11, x3, x8
        umulh x16, x3, x8
        adcs x15, x15, x11
        ldp x9, x10, [sp, #320]
        mul x11, x3, x9
        umulh x17, x3, x9
        adcs x16, x16, x11
        mul x11, x3, x10
        umulh x19, x3, x10
        adcs x17, x17, x11
        adc x19, x19, xzr
        mul x11, x4, x5
        adds x13, x13, x11
        mul x11, x4, x6
        adcs x14, x14, x11
        mul x11, x4, x7
        adcs x15, x15, x11
        mul x11, x4, x8
        adcs x16, x16, x11
        mul x11, x4, x9
        adcs x17, x17, x11
        mul x11, x4, x10
        adcs x19, x19, x11
        cset x20, hs
        umulh x11, x4, x5
        adds x14, x14, x11
        umulh x11, x4, x6
        adcs x15, x15, x11
        umulh x11, x4, x7
        adcs x16, x16, x11
        umulh x11, x4, x8
        adcs x17, x17, x11
        umulh x11, x4, x9
        adcs x19, x19, x11
        umulh x11, x4, x10
        adc x20, x20, x11
        ldp x3, x4, [sp, #160]
        mul x11, x3, x5
        adds x14, x14, x11
        mul x11, x3, x6
        adcs x15, x15, x11
        mul x11, x3, x7
        adcs x16, x16, x11
        mul x11, x3, x8
        adcs x17, x17, x11
        mul x11, x3, x9
        adcs x19, x19, x11
        mul x11, x3, x10
        adcs x20, x20, x11
        cset x21, hs
        umulh x11, x3, x5
        adds x15, x15, x11
        umulh x11, x3, x6
        adcs x16, x16, x11
        umulh x11, x3, x7
        adcs x17, x17, x11
        umulh x11, x3, x8
        adcs x19, x19, x11
        umulh x11, x3, x9
        adcs x20, x20, x11
        umulh x11, x3, x10
        adc x21, x21, x11
        mul x11, x4, x5
        adds x15, x15, x11
        mul x11, x4, x6
        adcs x16, x16, x11
        mul x11, x4, x7
        adcs x17, x17, x11
        mul x11, x4, x8
        adcs x19, x19, x11
        mul x11, x4, x9
        adcs x20, x20, x11
        mul x11, x4, x10
        adcs x21, x21, x11
        cset x22, hs
        umulh x11, x4, x5
        adds x16, x16, x11
        umulh x11, x4, x6
        adcs x17, x17, x11
        umulh x11, x4, x7
        adcs x19, x19, x11
        umulh x11, x4, x8
        adcs x20, x20, x11
        umulh x11, x4, x9
        adcs x21, x21, x11
        umulh x11, x4, x10
        adc x22, x22, x11
        ldp x3, x4, [sp, #176]
        mul x11, x3, x5
        adds x16, x16, x11
        mul x11, x3, x6
        adcs x17, x17, x11
        mul x11, x3, x7
        adcs x19, x19, x11
        mul x11, x3, x8
        adcs x20, x20, x11
        mul x11, x3, x9
        adcs x21, x21, x11
        mul x11, x3, x10
        adcs x22, x22, x11
        cset x2, hs
        umulh x11, x3, x5
        adds x17, x17, x11
        umulh x11, x3, x6
        adcs x19, x19, x11
        umulh x11, x3, x7
        adcs x20, x20, x11
        umulh x11, x3, x8
        adcs x21, x21, x11
        umulh x11, x3, x9
        adcs x22, x22, x11
        umulh x11, x3, x10
        adc x2, x2, x11
        mul x11, x4, x5
        adds x17, x17, x11
        mul x11, x4, x6
        adcs x19, x19, x11
        mul x11, x4, x7
        adcs x20, x20, x11
        mul x11, x4, x8
        adcs x21, x21, x11
        mul x11, x4, x9
        adcs x22, x22, x11
        mul x11, x4, x10
        adcs x2, x2, x11
        cset x1, hs
        umulh x11, x4, x5
        adds x19, x19, x11
        umulh x11, x4, x6
        adcs x20, x20, x11
        umulh x11, x4, x7
        adcs x21, x21, x11
        umulh x11, x4, x8
        adcs x22, x22, x11
        umulh x11, x4, x9
        adcs x2, x2, x11
        umulh x11, x4, x10
        adc x1, x1, x11
        lsl x7, x12, #32
        add x12, x7, x12
        mov x7, #-4294967295
        umulh x7, x7, x12
        mov x6, #4294967295
        mul x5, x6, x12
        umulh x6, x6, x12
        adds x7, x7, x5
        adcs x6, x6, x12
        adc x5, xzr, xzr
        subs x13, x13, x7
        sbcs x14, x14, x6
        sbcs x15, x15, x5
        sbcs x16, x16, xzr
        sbcs x17, x17, xzr
        sbc x12, x12, xzr
        lsl x7, x13, #32
        add x13, x7, x13
        mov x7, #-4294967295
        umulh x7, x7, x13
        mov x6, #4294967295
        mul x5, x6, x13
        umulh x6, x6, x13
        adds x7, x7, x5
        adcs x6, x6, x13
        adc x5, xzr, xzr
        subs x14, x14, x7
        sbcs x15, x15, x6
        sbcs x16, x16, x5
        sbcs x17, x17, xzr
        sbcs x12, x12, xzr
        sbc x13, x13, xzr
        lsl x7, x14, #32
        add x14, x7, x14
        mov x7, #-4294967295
        umulh x7, x7, x14
        mov x6, #4294967295
        mul x5, x6, x14
        umulh x6, x6, x14
        adds x7, x7, x5
        adcs x6, x6, x14
        adc x5, xzr, xzr
        subs x15, x15, x7
        sbcs x16, x16, x6
        sbcs x17, x17, x5
        sbcs x12, x12, xzr
        sbcs x13, x13, xzr
        sbc x14, x14, xzr
        lsl x7, x15, #32
        add x15, x7, x15
        mov x7, #-4294967295
        umulh x7, x7, x15
        mov x6, #4294967295
        mul x5, x6, x15
        umulh x6, x6, x15
        adds x7, x7, x5
        adcs x6, x6, x15
        adc x5, xzr, xzr
        subs x16, x16, x7
        sbcs x17, x17, x6
        sbcs x12, x12, x5
        sbcs x13, x13, xzr
        sbcs x14, x14, xzr
        sbc x15, x15, xzr
        lsl x7, x16, #32
        add x16, x7, x16
        mov x7, #-4294967295
        umulh x7, x7, x16
        mov x6, #4294967295
        mul x5, x6, x16
        umulh x6, x6, x16
        adds x7, x7, x5
        adcs x6, x6, x16
        adc x5, xzr, xzr
        subs x17, x17, x7
        sbcs x12, x12, x6
        sbcs x13, x13, x5
        sbcs x14, x14, xzr
        sbcs x15, x15, xzr
        sbc x16, x16, xzr
        lsl x7, x17, #32
        add x17, x7, x17
        mov x7, #-4294967295
        umulh x7, x7, x17
        mov x6, #4294967295
        mul x5, x6, x17
        umulh x6, x6, x17
        adds x7, x7, x5
        adcs x6, x6, x17
        adc x5, xzr, xzr
        subs x12, x12, x7
        sbcs x13, x13, x6
        sbcs x14, x14, x5
        sbcs x15, x15, xzr
        sbcs x16, x16, xzr
        sbc x17, x17, xzr
        adds x12, x12, x19
        adcs x13, x13, x20
        adcs x14, x14, x21
        adcs x15, x15, x22
        adcs x16, x16, x2
        adcs x17, x17, x1
        adc x10, xzr, xzr
        mov x11, #-4294967295
        adds x19, x12, x11
        mov x11, #4294967295
        adcs x20, x13, x11
        mov x11, #1
        adcs x21, x14, x11
        adcs x22, x15, xzr
        adcs x2, x16, xzr
        adcs x1, x17, xzr
        adcs x10, x10, xzr
        csel x12, x12, x19, eq
        csel x13, x13, x20, eq
        csel x14, x14, x21, eq
        csel x15, x15, x22, eq
        csel x16, x16, x2, eq
        csel x17, x17, x1, eq
        stp x12, x13, [sp, #144]
        stp x14, x15, [sp, #160]
        stp x16, x17, [sp, #176]
        ldp x3, x4, [sp, #240]
        ldp x5, x6, [x26, #96]
        mul x12, x3, x5
        umulh x13, x3, x5
        mul x11, x3, x6
        umulh x14, x3, x6
        adds x13, x13, x11
        ldp x7, x8, [x26, #112]
        mul x11, x3, x7
        umulh x15, x3, x7
        adcs x14, x14, x11
        mul x11, x3, x8
        umulh x16, x3, x8
        adcs x15, x15, x11
        ldp x9, x10, [x26, #128]
        mul x11, x3, x9
        umulh x17, x3, x9
        adcs x16, x16, x11
        mul x11, x3, x10
        umulh x19, x3, x10
        adcs x17, x17, x11
        adc x19, x19, xzr
        mul x11, x4, x5
        adds x13, x13, x11
        mul x11, x4, x6
        adcs x14, x14, x11
        mul x11, x4, x7
        adcs x15, x15, x11
        mul x11, x4, x8
        adcs x16, x16, x11
        mul x11, x4, x9
        adcs x17, x17, x11
        mul x11, x4, x10
        adcs x19, x19, x11
        cset x20, hs
        umulh x11, x4, x5
        adds x14, x14, x11
        umulh x11, x4, x6
        adcs x15, x15, x11
        umulh x11, x4, x7
        adcs x16, x16, x11
        umulh x11, x4, x8
        adcs x17, x17, x11
        umulh x11, x4, x9
        adcs x19, x19, x11
        umulh x11, x4, x10
        adc x20, x20, x11
        ldp x3, x4, [sp, #256]
        mul x11, x3, x5
        adds x14, x14, x11
        mul x11, x3, x6
        adcs x15, x15, x11
        mul x11, x3, x7
        adcs x16, x16, x11
        mul x11, x3, x8
        adcs x17, x17, x11
        mul x11, x3, x9
        adcs x19, x19, x11
        mul x11, x3, x10
        adcs x20, x20, x11
        cset x21, hs
        umulh x11, x3, x5
        adds x15, x15, x11
        umulh x11, x3, x6
        adcs x16, x16, x11
        umulh x11, x3, x7
        adcs x17, x17, x11
        umulh x11, x3, x8
        adcs x19, x19, x11
        umulh x11, x3, x9
        adcs x20, x20, x11
        umulh x11, x3, x10
        adc x21, x21, x11
        mul x11, x4, x5
        adds x15, x15, x11
        mul x11, x4, x6
        adcs x16, x16, x11
        mul x11, x4, x7
        adcs x17, x17, x11
        mul x11, x4, x8
        adcs x19, x19, x11
        mul x11, x4, x9
        adcs x20, x20, x11
        mul x11, x4, x10
        adcs x21, x21, x11
        cset x22, hs
        umulh x11, x4, x5
        adds x16, x16, x11
        umulh x11, x4, x6
        adcs x17, x17, x11
        umulh x11, x4, x7
        adcs x19, x19, x11
        umulh x11, x4, x8
        adcs x20, x20, x11
        umulh x11, x4, x9
        adcs x21, x21, x11
        umulh x11, x4, x10
        adc x22, x22, x11
        ldp x3, x4, [sp, #272]
        mul x11, x3, x5
        adds x16, x16, x11
        mul x11, x3, x6
        adcs x17, x17, x11
        mul x11, x3, x7
        adcs x19, x19, x11
        mul x11, x3, x8
        adcs x20, x20, x11
        mul x11, x3, x9
        adcs x21, x21, x11
        mul x11, x3, x10
        adcs x22, x22, x11
        cset x2, hs
        umulh x11, x3, x5
        adds x17, x17, x11
        umulh x11, x3, x6
        adcs x19, x19, x11
        umulh x11, x3, x7
        adcs x20, x20, x11
        umulh x11, x3, x8
        adcs x21, x21, x11
        umulh x11, x3, x9
        adcs x22, x22, x11
        umulh x11, x3, x10
        adc x2, x2, x11
        mul x11, x4, x5
        adds x17, x17, x11
        mul x11, x4, x6
        adcs x19, x19, x11
        mul x11, x4, x7
        adcs x20, x20, x11
        mul x11, x4, x8
        adcs x21, x21, x11
        mul x11, x4, x9
        adcs x22, x22, x11
        mul x11, x4, x10
        adcs x2, x2, x11
        cset x1, hs
        umulh x11, x4, x5
        adds x19, x19, x11
        umulh x11, x4, x6
        adcs x20, x20, x11
        umulh x11, x4, x7
        adcs x21, x21, x11
        umulh x11, x4, x8
        adcs x22, x22, x11
        umulh x11, x4, x9
        adcs x2, x2, x11
        umulh x11, x4, x10
        adc x1, x1, x11
        lsl x7, x12, #32
        add x12, x7, x12
        mov x7, #-4294967295
        umulh x7, x7, x12
        mov x6, #4294967295
        mul x5, x6, x12
        umulh x6, x6, x12
        adds x7, x7, x5
        adcs x6, x6, x12
        adc x5, xzr, xzr
        subs x13, x13, x7
        sbcs x14, x14, x6
        sbcs x15, x15, x5
        sbcs x16, x16, xzr
        sbcs x17, x17, xzr
        sbc x12, x12, xzr
        lsl x7, x13, #32
        add x13, x7, x13
        mov x7, #-4294967295
        umulh x7, x7, x13
        mov x6, #4294967295
        mul x5, x6, x13
        umulh x6, x6, x13
        adds x7, x7, x5
        adcs x6, x6, x13
        adc x5, xzr, xzr
        subs x14, x14, x7
        sbcs x15, x15, x6
        sbcs x16, x16, x5
        sbcs x17, x17, xzr
        sbcs x12, x12, xzr
        sbc x13, x13, xzr
        lsl x7, x14, #32
        add x14, x7, x14
        mov x7, #-4294967295
        umulh x7, x7, x14
        mov x6, #4294967295
        mul x5, x6, x14
        umulh x6, x6, x14
        adds x7, x7, x5
        adcs x6, x6, x14
        adc x5, xzr, xzr
        subs x15, x15, x7
        sbcs x16, x16, x6
        sbcs x17, x17, x5
        sbcs x12, x12, xzr
        sbcs x13, x13, xzr
        sbc x14, x14, xzr
        lsl x7, x15, #32
        add x15, x7, x15
        mov x7, #-4294967295
        umulh x7, x7, x15
        mov x6, #4294967295
        mul x5, x6, x15
        umulh x6, x6, x15
        adds x7, x7, x5
        adcs x6, x6, x15
        adc x5, xzr, xzr
        subs x16, x16, x7
        sbcs x17, x17, x6
        sbcs x12, x12, x5
        sbcs x13, x13, xzr
        sbcs x14, x14, xzr
        sbc x15, x15, xzr
        lsl x7, x16, #32
        add x16, x7, x16
        mov x7, #-4294967295
        umulh x7, x7, x16
        mov x6, #4294967295
        mul x5, x6, x16
        umulh x6, x6, x16
        adds x7, x7, x5
        adcs x6, x6, x16
        adc x5, xzr, xzr
        subs x17, x17, x7
        sbcs x12, x12, x6
        sbcs x13, x13, x5
        sbcs x14, x14, xzr
        sbcs x15, x15, xzr
        sbc x16, x16, xzr
        lsl x7, x17, #32
        add x17, x7, x17
        mov x7, #-4294967295
        umulh x7, x7, x17
        mov x6, #4294967295
        mul x5, x6, x17
        umulh x6, x6, x17
        adds x7, x7, x5
        adcs x6, x6, x17
        adc x5, xzr, xzr
        subs x12, x12, x7
        sbcs x13, x13, x6
        sbcs x14, x14, x5
        sbcs x15, x15, xzr
        sbcs x16, x16, xzr
        sbc x17, x17, xzr
        adds x12, x12, x19
        adcs x13, x13, x20
        adcs x14, x14, x21
        adcs x15, x15, x22
        adcs x16, x16, x2
        adcs x17, x17, x1
        adc x10, xzr, xzr
        mov x11, #-4294967295
        adds x19, x12, x11
        mov x11, #4294967295
        adcs x20, x13, x11
        mov x11, #1
        adcs x21, x14, x11
        adcs x22, x15, xzr
        adcs x2, x16, xzr
        adcs x1, x17, xzr
        adcs x10, x10, xzr
        csel x12, x12, x19, eq
        csel x13, x13, x20, eq
        csel x14, x14, x21, eq
        csel x15, x15, x22, eq
        csel x16, x16, x2, eq
        csel x17, x17, x1, eq
        stp x12, x13, [sp, #240]
        stp x14, x15, [sp, #256]
        stp x16, x17, [sp, #272]
        ldp x3, x4, [sp, #48]
        ldp x5, x6, [sp, #192]
        mul x12, x3, x5
        umulh x13, x3, x5
        mul x11, x3, x6
        umulh x14, x3, x6
        adds x13, x13, x11
        ldp x7, x8, [sp, #208]
        mul x11, x3, x7
        umulh x15, x3, x7
        adcs x14, x14, x11
        mul x11, x3, x8
        umulh x16, x3, x8
        adcs x15, x15, x11
        ldp x9, x10, [sp, #224]
        mul x11, x3, x9
        umulh x17, x3, x9
        adcs x16, x16, x11
        mul x11, x3, x10
        umulh x19, x3, x10
        adcs x17, x17, x11
        adc x19, x19, xzr
        mul x11, x4, x5
        adds x13, x13, x11
        mul x11, x4, x6
        adcs x14, x14, x11
        mul x11, x4, x7
        adcs x15, x15, x11
        mul x11, x4, x8
        adcs x16, x16, x11
        mul x11, x4, x9
        adcs x17, x17, x11
        mul x11, x4, x10
        adcs x19, x19, x11
        cset x20, hs
        umulh x11, x4, x5
        adds x14, x14, x11
        umulh x11, x4, x6
        adcs x15, x15, x11
        umulh x11, x4, x7
        adcs x16, x16, x11
        umulh x11, x4, x8
        adcs x17, x17, x11
        umulh x11, x4, x9
        adcs x19, x19, x11
        umulh x11, x4, x10
        adc x20, x20, x11
        ldp x3, x4, [sp, #64]
        mul x11, x3, x5
        adds x14, x14, x11
        mul x11, x3, x6
        adcs x15, x15, x11
        mul x11, x3, x7
        adcs x16, x16, x11
        mul x11, x3, x8
        adcs x17, x17, x11
        mul x11, x3, x9
        adcs x19, x19, x11
        mul x11, x3, x10
        adcs x20, x20, x11
        cset x21, hs
        umulh x11, x3, x5
        adds x15, x15, x11
        umulh x11, x3, x6
        adcs x16, x16, x11
        umulh x11, x3, x7
        adcs x17, x17, x11
        umulh x11, x3, x8
        adcs x19, x19, x11
        umulh x11, x3, x9
        adcs x20, x20, x11
        umulh x11, x3, x10
        adc x21, x21, x11
        mul x11, x4, x5
        adds x15, x15, x11
        mul x11, x4, x6
        adcs x16, x16, x11
        mul x11, x4, x7
        adcs x17, x17, x11
        mul x11, x4, x8
        adcs x19, x19, x11
        mul x11, x4, x9
        adcs x20, x20, x11
        mul x11, x4, x10
        adcs x21, x21, x11
        cset x22, hs
        umulh x11, x4, x5
        adds x16, x16, x11
        umulh x11, x4, x6
        adcs x17, x17, x11
        umulh x11, x4, x7
        adcs x19, x19, x11
        umulh x11, x4, x8
        adcs x20, x20, x11
        umulh x11, x4, x9
        adcs x21, x21, x11
        umulh x11, x4, x10
        adc x22, x22, x11
        ldp x3, x4, [sp, #80]
        mul x11, x3, x5
        adds x16, x16, x11
        mul x11, x3, x6
        adcs x17, x17, x11
        mul x11, x3, x7
        adcs x19, x19, x11
        mul x11, x3, x8
        adcs x20, x20, x11
        mul x11, x3, x9
        adcs x21, x21, x11
        mul x11, x3, x10
        adcs x22, x22, x11
        cset x2, hs
        umulh x11, x3, x5
        adds x17, x17, x11
        umulh x11, x3, x6
        adcs x19, x19, x11
        umulh x11, x3, x7
        adcs x20, x20, x11
        umulh x11, x3, x8
        adcs x21, x21, x11
        umulh x11, x3, x9
        adcs x22, x22, x11
        umulh x11, x3, x10
        adc x2, x2, x11
        mul x11, x4, x5
        adds x17, x17, x11
        mul x11, x4, x6
        adcs x19, x19, x11
        mul x11, x4, x7
        adcs x20, x20, x11
        mul x11, x4, x8
        adcs x21, x21, x11
        mul x11, x4, x9
        adcs x22, x22, x11
        mul x11, x4, x10
        adcs x2, x2, x11
        cset x1, hs
        umulh x11, x4, x5
        adds x19, x19, x11
        umulh x11, x4, x6
        adcs x20, x20, x11
        umulh x11, x4, x7
        adcs x21, x21, x11
        umulh x11, x4, x8
        adcs x22, x22, x11
        umulh x11, x4, x9
        adcs x2, x2, x11
        umulh x11, x4, x10
        adc x1, x1, x11
        lsl x7, x12, #32
        add x12, x7, x12
        mov x7, #-4294967295
        umulh x7, x7, x12
        mov x6, #4294967295
        mul x5, x6, x12
        umulh x6, x6, x12
        adds x7, x7, x5
        adcs x6, x6, x12
        adc x5, xzr, xzr
        subs x13, x13, x7
        sbcs x14, x14, x6
        sbcs x15, x15, x5
        sbcs x16, x16, xzr
        sbcs x17, x17, xzr
        sbc x12, x12, xzr
        lsl x7, x13, #32
        add x13, x7, x13
        mov x7, #-4294967295
        umulh x7, x7, x13
        mov x6, #4294967295
        mul x5, x6, x13
        umulh x6, x6, x13
        adds x7, x7, x5
        adcs x6, x6, x13
        adc x5, xzr, xzr
        subs x14, x14, x7
        sbcs x15, x15, x6
        sbcs x16, x16, x5
        sbcs x17, x17, xzr
        sbcs x12, x12, xzr
        sbc x13, x13, xzr
        lsl x7, x14, #32
        add x14, x7, x14
        mov x7, #-4294967295
        umulh x7, x7, x14
        mov x6, #4294967295
        mul x5, x6, x14
        umulh x6, x6, x14
        adds x7, x7, x5
        adcs x6, x6, x14
        adc x5, xzr, xzr
        subs x15, x15, x7
        sbcs x16, x16, x6
        sbcs x17, x17, x5
        sbcs x12, x12, xzr
        sbcs x13, x13, xzr
        sbc x14, x14, xzr
        lsl x7, x15, #32
        add x15, x7, x15
        mov x7, #-4294967295
        umulh x7, x7, x15
        mov x6, #4294967295
        mul x5, x6, x15
        umulh x6, x6, x15
        adds x7, x7, x5
        adcs x6, x6, x15
        adc x5, xzr, xzr
        subs x16, x16, x7
        sbcs x17, x17, x6
        sbcs x12, x12, x5
        sbcs x13, x13, xzr
        sbcs x14, x14, xzr
        sbc x15, x15, xzr
        lsl x7, x16, #32
        add x16, x7, x16
        mov x7, #-4294967295
        umulh x7, x7, x16
        mov x6, #4294967295
        mul x5, x6, x16
        umulh x6, x6, x16
        adds x7, x7, x5
        adcs x6, x6, x16
        adc x5, xzr, xzr
        subs x17, x17, x7
        sbcs x12, x12, x6
        sbcs x13, x13, x5
        sbcs x14, x14, xzr
        sbcs x15, x15, xzr
        sbc x16, x16, xzr
        lsl x7, x17, #32
        add x17, x7, x17
        mov x7, #-4294967295
        umulh x7, x7, x17
        mov x6, #4294967295
        mul x5, x6, x17
        umulh x6, x6, x17
        adds x7, x7, x5
        adcs x6, x6, x17
        adc x5, xzr, xzr
        subs x12, x12, x7
        sbcs x13, x13, x6
        sbcs x14, x14, x5
        sbcs x15, x15, xzr
        sbcs x16, x16, xzr
        sbc x17, x17, xzr
        adds x12, x12, x19
        adcs x13, x13, x20
        adcs x14, x14, x21
        adcs x15, x15, x22
        adcs x16, x16, x2
        adcs x17, x17, x1
        adc x10, xzr, xzr
        mov x11, #-4294967295
        adds x19, x12, x11
        mov x11, #4294967295
        adcs x20, x13, x11
        mov x11, #1
        adcs x21, x14, x11
        adcs x22, x15, xzr
        adcs x2, x16, xzr
        adcs x1, x17, xzr
        adcs x10, x10, xzr
        csel x12, x12, x19, eq
        csel x13, x13, x20, eq
        csel x14, x14, x21, eq
        csel x15, x15, x22, eq
        csel x16, x16, x2, eq
        csel x17, x17, x1, eq
        stp x12, x13, [sp, #192]
        stp x14, x15, [sp, #208]
        stp x16, x17, [sp, #224]
        ldp x5, x6, [sp, #192]
        ldp x4, x3, [sp, #144]
        subs x5, x5, x4
        sbcs x6, x6, x3
        ldp x7, x8, [sp, #208]
        ldp x4, x3, [sp, #160]
        sbcs x7, x7, x4
        sbcs x8, x8, x3
        ldp x9, x10, [sp, #224]
        ldp x4, x3, [sp, #176]
        sbcs x9, x9, x4
        sbcs x10, x10, x3
        csetm x3, lo
        mov x4, #4294967295
        and x4, x4, x3
        adds x5, x5, x4
        eor x4, x4, x3
        adcs x6, x6, x4
        mov x4, #-2
        and x4, x4, x3
        adcs x7, x7, x4
        adcs x8, x8, x3
        adcs x9, x9, x3
        adc x10, x10, x3
        stp x5, x6, [sp, #192]
        stp x7, x8, [sp, #208]
        stp x9, x10, [sp, #224]
        ldp x0, x1, [x25, #96]
        ldp x2, x3, [x25, #112]
        ldp x4, x5, [x25, #128]
        orr x20, x0, x1
        orr x21, x2, x3
        orr x22, x4, x5
        orr x20, x20, x21
        orr x20, x20, x22
        cmp x20, xzr
        cset x20, ne
        ldp x6, x7, [x26, #96]
        ldp x8, x9, [x26, #112]
        ldp x10, x11, [x26, #128]
        orr x21, x6, x7
        orr x22, x8, x9
        orr x23, x10, x11
        orr x21, x21, x22
        orr x21, x21, x23
        cmp x21, xzr
        cset x21, ne
        cmp x21, x20
        ldp x12, x13, [sp, #240]
        csel x12, x0, x12, lo
        csel x13, x1, x13, lo
        csel x12, x6, x12, hi
        csel x13, x7, x13, hi
        ldp x14, x15, [sp, #256]
        csel x14, x2, x14, lo
        csel x15, x3, x15, lo
        csel x14, x8, x14, hi
        csel x15, x9, x15, hi
        ldp x16, x17, [sp, #272]
        csel x16, x4, x16, lo
        csel x17, x5, x17, lo
        csel x16, x10, x16, hi
        csel x17, x11, x17, hi
        ldp x20, x21, [x25]
        ldp x0, x1, [sp]
        csel x0, x20, x0, lo
        csel x1, x21, x1, lo
        ldp x20, x21, [x26]
        csel x0, x20, x0, hi
        csel x1, x21, x1, hi
        ldp x20, x21, [x25, #16]
        ldp x2, x3, [sp, #16]
        csel x2, x20, x2, lo
        csel x3, x21, x3, lo
        ldp x20, x21, [x26, #16]
        csel x2, x20, x2, hi
        csel x3, x21, x3, hi
        ldp x20, x21, [x25, #32]
        ldp x4, x5, [sp, #32]
        csel x4, x20, x4, lo
        csel x5, x21, x5, lo
        ldp x20, x21, [x26, #32]
        csel x4, x20, x4, hi
        csel x5, x21, x5, hi
        ldp x20, x21, [x25, #48]
        ldp x6, x7, [sp, #192]
        csel x6, x20, x6, lo
        csel x7, x21, x7, lo
        ldp x20, x21, [x26, #48]
        csel x6, x20, x6, hi
        csel x7, x21, x7, hi
        ldp x20, x21, [x25, #64]
        ldp x8, x9, [sp, #208]
        csel x8, x20, x8, lo
        csel x9, x21, x9, lo
        ldp x20, x21, [x26, #64]
        csel x8, x20, x8, hi
        csel x9, x21, x9, hi
        ldp x20, x21, [x25, #80]
        ldp x10, x11, [sp, #224]
        csel x10, x20, x10, lo
        csel x11, x21, x11, lo
        ldp x20, x21, [x26, #80]
        csel x10, x20, x10, hi
        csel x11, x21, x11, hi
        stp x0, x1, [x24]
        stp x2, x3, [x24, #16]
        stp x4, x5, [x24, #32]
        stp x6, x7, [x24, #48]
        stp x8, x9, [x24, #64]
        stp x10, x11, [x24, #80]
        stp x12, x13, [x24, #96]
        stp x14, x15, [x24, #112]
        stp x16, x17, [x24, #128]
        add sp, sp, #336
        ldp x25, x26, [sp], #16
        ldp x23, x24, [sp], #16
        ldp x21, x22, [sp], #16
        ldp x19, x20, [sp], #16
        ret

p384_montjscalarmul_alt_p384_montjdouble:
        stp x19, x20, [sp, #-16]!
        stp x21, x22, [sp, #-16]!
        stp x23, x24, [sp, #-16]!
        sub sp, sp, #336
        mov x23, x0
        mov x24, x1
        ldp x2, x3, [x24, #96]
        mul x9, x2, x3
        umulh x10, x2, x3
        ldp x4, x5, [x24, #112]
        mul x8, x2, x4
        adds x10, x10, x8
        mul x11, x2, x5
        mul x8, x3, x4
        adcs x11, x11, x8
        umulh x12, x2, x5
        mul x8, x3, x5
        adcs x12, x12, x8
        ldp x6, x7, [x24, #128]
        mul x13, x2, x7
        mul x8, x3, x6
        adcs x13, x13, x8
        umulh x14, x2, x7
        mul x8, x3, x7
        adcs x14, x14, x8
        mul x15, x5, x6
        adcs x15, x15, xzr
        umulh x16, x5, x6
        adc x16, x16, xzr
        umulh x8, x2, x4
        adds x11, x11, x8
        umulh x8, x3, x4
        adcs x12, x12, x8
        umulh x8, x3, x5
        adcs x13, x13, x8
        umulh x8, x3, x6
        adcs x14, x14, x8
        umulh x8, x3, x7
        adcs x15, x15, x8
        adc x16, x16, xzr
        mul x8, x2, x6
        adds x12, x12, x8
        mul x8, x4, x5
        adcs x13, x13, x8
        mul x8, x4, x6
        adcs x14, x14, x8
        mul x8, x4, x7
        adcs x15, x15, x8
        mul x8, x5, x7
        adcs x16, x16, x8
        mul x17, x6, x7
        adcs x17, x17, xzr
        umulh x19, x6, x7
        adc x19, x19, xzr
        umulh x8, x2, x6
        adds x13, x13, x8
        umulh x8, x4, x5
        adcs x14, x14, x8
        umulh x8, x4, x6
        adcs x15, x15, x8
        umulh x8, x4, x7
        adcs x16, x16, x8
        umulh x8, x5, x7
        adcs x17, x17, x8
        adc x19, x19, xzr
        adds x9, x9, x9
        adcs x10, x10, x10
        adcs x11, x11, x11
        adcs x12, x12, x12
        adcs x13, x13, x13
        adcs x14, x14, x14
        adcs x15, x15, x15
        adcs x16, x16, x16
        adcs x17, x17, x17
        adcs x19, x19, x19
        cset x20, hs
        umulh x8, x2, x2
        mul x2, x2, x2
        adds x9, x9, x8
        mul x8, x3, x3
        adcs x10, x10, x8
        umulh x8, x3, x3
        adcs x11, x11, x8
        mul x8, x4, x4
        adcs x12, x12, x8
        umulh x8, x4, x4
        adcs x13, x13, x8
        mul x8, x5, x5
        adcs x14, x14, x8
        umulh x8, x5, x5
        adcs x15, x15, x8
        mul x8, x6, x6
        adcs x16, x16, x8
        umulh x8, x6, x6
        adcs x17, x17, x8
        mul x8, x7, x7
        adcs x19, x19, x8
        umulh x8, x7, x7
        adc x20, x20, x8
        lsl x5, x2, #32
        add x2, x5, x2
        mov x5, #-4294967295
        umulh x5, x5, x2
        mov x4, #4294967295
        mul x3, x4, x2
        umulh x4, x4, x2
        adds x5, x5, x3
        adcs x4, x4, x2
        adc x3, xzr, xzr
        subs x9, x9, x5
        sbcs x10, x10, x4
        sbcs x11, x11, x3
        sbcs x12, x12, xzr
        sbcs x13, x13, xzr
        sbc x2, x2, xzr
        lsl x5, x9, #32
        add x9, x5, x9
        mov x5, #-4294967295
        umulh x5, x5, x9
        mov x4, #4294967295
        mul x3, x4, x9
        umulh x4, x4, x9
        adds x5, x5, x3
        adcs x4, x4, x9
        adc x3, xzr, xzr
        subs x10, x10, x5
        sbcs x11, x11, x4
        sbcs x12, x12, x3
        sbcs x13, x13, xzr
        sbcs x2, x2, xzr
        sbc x9, x9, xzr
        lsl x5, x10, #32
        add x10, x5, x10
        mov x5, #-4294967295
        umulh x5, x5, x10
        mov x4, #4294967295
        mul x3, x4, x10
        umulh x4, x4, x10
        adds x5, x5, x3
        adcs x4, x4, x10
        adc x3, xzr, xzr
        subs x11, x11, x5
        sbcs x12, x12, x4
        sbcs x13, x13, x3
        sbcs x2, x2, xzr
        sbcs x9, x9, xzr
        sbc x10, x10, xzr
        lsl x5, x11, #32
        add x11, x5, x11
        mov x5, #-4294967295
        umulh x5, x5, x11
        mov x4, #4294967295
        mul x3, x4, x11
        umulh x4, x4, x11
        adds x5, x5, x3
        adcs x4, x4, x11
        adc x3, xzr, xzr
        subs x12, x12, x5
        sbcs x13, x13, x4
        sbcs x2, x2, x3
        sbcs x9, x9, xzr
        sbcs x10, x10, xzr
        sbc x11, x11, xzr
        lsl x5, x12, #32
        add x12, x5, x12
        mov x5, #-4294967295
        umulh x5, x5, x12
        mov x4, #4294967295
        mul x3, x4, x12
        umulh x4, x4, x12
        adds x5, x5, x3
        adcs x4, x4, x12
        adc x3, xzr, xzr
        subs x13, x13, x5
        sbcs x2, x2, x4
        sbcs x9, x9, x3
        sbcs x10, x10, xzr
        sbcs x11, x11, xzr
        sbc x12, x12, xzr
        lsl x5, x13, #32
        add x13, x5, x13
        mov x5, #-4294967295
        umulh x5, x5, x13
        mov x4, #4294967295
        mul x3, x4, x13
        umulh x4, x4, x13
        adds x5, x5, x3
        adcs x4, x4, x13
        adc x3, xzr, xzr
        subs x2, x2, x5
        sbcs x9, x9, x4
        sbcs x10, x10, x3
        sbcs x11, x11, xzr
        sbcs x12, x12, xzr
        sbc x13, x13, xzr
        adds x2, x2, x14
        adcs x9, x9, x15
        adcs x10, x10, x16
        adcs x11, x11, x17
        adcs x12, x12, x19
        adcs x13, x13, x20
        adc x6, xzr, xzr
        mov x8, #-4294967295
        adds x14, x2, x8
        mov x8, #4294967295
        adcs x15, x9, x8
        mov x8, #1
        adcs x16, x10, x8
        adcs x17, x11, xzr
        adcs x19, x12, xzr
        adcs x20, x13, xzr
        adcs x6, x6, xzr
        csel x2, x2, x14, eq
        csel x9, x9, x15, eq
        csel x10, x10, x16, eq
        csel x11, x11, x17, eq
        csel x12, x12, x19, eq
        csel x13, x13, x20, eq
        stp x2, x9, [sp]
        stp x10, x11, [sp, #16]
        stp x12, x13, [sp, #32]
        ldp x2, x3, [x24, #48]
        mul x9, x2, x3
        umulh x10, x2, x3
        ldp x4, x5, [x24, #64]
        mul x8, x2, x4
        adds x10, x10, x8
        mul x11, x2, x5
        mul x8, x3, x4
        adcs x11, x11, x8
        umulh x12, x2, x5
        mul x8, x3, x5
        adcs x12, x12, x8
        ldp x6, x7, [x24, #80]
        mul x13, x2, x7
        mul x8, x3, x6
        adcs x13, x13, x8
        umulh x14, x2, x7
        mul x8, x3, x7
        adcs x14, x14, x8
        mul x15, x5, x6
        adcs x15, x15, xzr
        umulh x16, x5, x6
        adc x16, x16, xzr
        umulh x8, x2, x4
        adds x11, x11, x8
        umulh x8, x3, x4
        adcs x12, x12, x8
        umulh x8, x3, x5
        adcs x13, x13, x8
        umulh x8, x3, x6
        adcs x14, x14, x8
        umulh x8, x3, x7
        adcs x15, x15, x8
        adc x16, x16, xzr
        mul x8, x2, x6
        adds x12, x12, x8
        mul x8, x4, x5
        adcs x13, x13, x8
        mul x8, x4, x6
        adcs x14, x14, x8
        mul x8, x4, x7
        adcs x15, x15, x8
        mul x8, x5, x7
        adcs x16, x16, x8
        mul x17, x6, x7
        adcs x17, x17, xzr
        umulh x19, x6, x7
        adc x19, x19, xzr
        umulh x8, x2, x6
        adds x13, x13, x8
        umulh x8, x4, x5
        adcs x14, x14, x8
        umulh x8, x4, x6
        adcs x15, x15, x8
        umulh x8, x4, x7
        adcs x16, x16, x8
        umulh x8, x5, x7
        adcs x17, x17, x8
        adc x19, x19, xzr
        adds x9, x9, x9
        adcs x10, x10, x10
        adcs x11, x11, x11
        adcs x12, x12, x12
        adcs x13, x13, x13
        adcs x14, x14, x14
        adcs x15, x15, x15
        adcs x16, x16, x16
        adcs x17, x17, x17
        adcs x19, x19, x19
        cset x20, hs
        umulh x8, x2, x2
        mul x2, x2, x2
        adds x9, x9, x8
        mul x8, x3, x3
        adcs x10, x10, x8
        umulh x8, x3, x3
        adcs x11, x11, x8
        mul x8, x4, x4
        adcs x12, x12, x8
        umulh x8, x4, x4
        adcs x13, x13, x8
        mul x8, x5, x5
        adcs x14, x14, x8
        umulh x8, x5, x5
        adcs x15, x15, x8
        mul x8, x6, x6
        adcs x16, x16, x8
        umulh x8, x6, x6
        adcs x17, x17, x8
        mul x8, x7, x7
        adcs x19, x19, x8
        umulh x8, x7, x7
        adc x20, x20, x8
        lsl x5, x2, #32
        add x2, x5, x2
        mov x5, #-4294967295
        umulh x5, x5, x2
        mov x4, #4294967295
        mul x3, x4, x2
        umulh x4, x4, x2
        adds x5, x5, x3
        adcs x4, x4, x2
        adc x3, xzr, xzr
        subs x9, x9, x5
        sbcs x10, x10, x4
        sbcs x11, x11, x3
        sbcs x12, x12, xzr
        sbcs x13, x13, xzr
        sbc x2, x2, xzr
        lsl x5, x9, #32
        add x9, x5, x9
        mov x5, #-4294967295
        umulh x5, x5, x9
        mov x4, #4294967295
        mul x3, x4, x9
        umulh x4, x4, x9
        adds x5, x5, x3
        adcs x4, x4, x9
        adc x3, xzr, xzr
        subs x10, x10, x5
        sbcs x11, x11, x4
        sbcs x12, x12, x3
        sbcs x13, x13, xzr
        sbcs x2, x2, xzr
        sbc x9, x9, xzr
        lsl x5, x10, #32
        add x10, x5, x10
        mov x5, #-4294967295
        umulh x5, x5, x10
        mov x4, #4294967295
        mul x3, x4, x10
        umulh x4, x4, x10
        adds x5, x5, x3
        adcs x4, x4, x10
        adc x3, xzr, xzr
        subs x11, x11, x5
        sbcs x12, x12, x4
        sbcs x13, x13, x3
        sbcs x2, x2, xzr
        sbcs x9, x9, xzr
        sbc x10, x10, xzr
        lsl x5, x11, #32
        add x11, x5, x11
        mov x5, #-4294967295
        umulh x5, x5, x11
        mov x4, #4294967295
        mul x3, x4, x11
        umulh x4, x4, x11
        adds x5, x5, x3
        adcs x4, x4, x11
        adc x3, xzr, xzr
        subs x12, x12, x5
        sbcs x13, x13, x4
        sbcs x2, x2, x3
        sbcs x9, x9, xzr
        sbcs x10, x10, xzr
        sbc x11, x11, xzr
        lsl x5, x12, #32
        add x12, x5, x12
        mov x5, #-4294967295
        umulh x5, x5, x12
        mov x4, #4294967295
        mul x3, x4, x12
        umulh x4, x4, x12
        adds x5, x5, x3
        adcs x4, x4, x12
        adc x3, xzr, xzr
        subs x13, x13, x5
        sbcs x2, x2, x4
        sbcs x9, x9, x3
        sbcs x10, x10, xzr
        sbcs x11, x11, xzr
        sbc x12, x12, xzr
        lsl x5, x13, #32
        add x13, x5, x13
        mov x5, #-4294967295
        umulh x5, x5, x13
        mov x4, #4294967295
        mul x3, x4, x13
        umulh x4, x4, x13
        adds x5, x5, x3
        adcs x4, x4, x13
        adc x3, xzr, xzr
        subs x2, x2, x5
        sbcs x9, x9, x4
        sbcs x10, x10, x3
        sbcs x11, x11, xzr
        sbcs x12, x12, xzr
        sbc x13, x13, xzr
        adds x2, x2, x14
        adcs x9, x9, x15
        adcs x10, x10, x16
        adcs x11, x11, x17
        adcs x12, x12, x19
        adcs x13, x13, x20
        adc x6, xzr, xzr
        mov x8, #-4294967295
        adds x14, x2, x8
        mov x8, #4294967295
        adcs x15, x9, x8
        mov x8, #1
        adcs x16, x10, x8
        adcs x17, x11, xzr
        adcs x19, x12, xzr
        adcs x20, x13, xzr
        adcs x6, x6, xzr
        csel x2, x2, x14, eq
        csel x9, x9, x15, eq
        csel x10, x10, x16, eq
        csel x11, x11, x17, eq
        csel x12, x12, x19, eq
        csel x13, x13, x20, eq
        stp x2, x9, [sp, #48]
        stp x10, x11, [sp, #64]
        stp x12, x13, [sp, #80]
        ldp x5, x6, [x24]
        ldp x4, x3, [sp]
        adds x5, x5, x4
        adcs x6, x6, x3
        ldp x7, x8, [x24, #16]
        ldp x4, x3, [sp, #16]
        adcs x7, x7, x4
        adcs x8, x8, x3
        ldp x9, x10, [x24, #32]
        ldp x4, x3, [sp, #32]
        adcs x9, x9, x4
        adcs x10, x10, x3
        csetm x3, hs
        mov x4, #4294967295
        and x4, x4, x3
        subs x5, x5, x4
        eor x4, x4, x3
        sbcs x6, x6, x4
        mov x4, #-2
        and x4, x4, x3
        sbcs x7, x7, x4
        sbcs x8, x8, x3
        sbcs x9, x9, x3
        sbc x10, x10, x3
        stp x5, x6, [sp, #240]
        stp x7, x8, [sp, #256]
        stp x9, x10, [sp, #272]
        ldp x5, x6, [x24]
        ldp x4, x3, [sp]
        subs x5, x5, x4
        sbcs x6, x6, x3
        ldp x7, x8, [x24, #16]
        ldp x4, x3, [sp, #16]
        sbcs x7, x7, x4
        sbcs x8, x8, x3
        ldp x9, x10, [x24, #32]
        ldp x4, x3, [sp, #32]
        sbcs x9, x9, x4
        sbcs x10, x10, x3
        csetm x3, lo
        mov x4, #4294967295
        and x4, x4, x3
        adds x5, x5, x4
        eor x4, x4, x3
        adcs x6, x6, x4
        mov x4, #-2
        and x4, x4, x3
        adcs x7, x7, x4
        adcs x8, x8, x3
        adcs x9, x9, x3
        adc x10, x10, x3
        stp x5, x6, [sp, #192]
        stp x7, x8, [sp, #208]
        stp x9, x10, [sp, #224]
        ldp x3, x4, [sp, #240]
        ldp x5, x6, [sp, #192]
        mul x12, x3, x5
        umulh x13, x3, x5
        mul x11, x3, x6
        umulh x14, x3, x6
        adds x13, x13, x11
        ldp x7, x8, [sp, #208]
        mul x11, x3, x7
        umulh x15, x3, x7
        adcs x14, x14, x11
        mul x11, x3, x8
        umulh x16, x3, x8
        adcs x15, x15, x11
        ldp x9, x10, [sp, #224]
        mul x11, x3, x9
        umulh x17, x3, x9
        adcs x16, x16, x11
        mul x11, x3, x10
        umulh x19, x3, x10
        adcs x17, x17, x11
        adc x19, x19, xzr
        mul x11, x4, x5
        adds x13, x13, x11
        mul x11, x4, x6
        adcs x14, x14, x11
        mul x11, x4, x7
        adcs x15, x15, x11
        mul x11, x4, x8
        adcs x16, x16, x11
        mul x11, x4, x9
        adcs x17, x17, x11
        mul x11, x4, x10
        adcs x19, x19, x11
        cset x20, hs
        umulh x11, x4, x5
        adds x14, x14, x11
        umulh x11, x4, x6
        adcs x15, x15, x11
        umulh x11, x4, x7
        adcs x16, x16, x11
        umulh x11, x4, x8
        adcs x17, x17, x11
        umulh x11, x4, x9
        adcs x19, x19, x11
        umulh x11, x4, x10
        adc x20, x20, x11
        ldp x3, x4, [sp, #256]
        mul x11, x3, x5
        adds x14, x14, x11
        mul x11, x3, x6
        adcs x15, x15, x11
        mul x11, x3, x7
        adcs x16, x16, x11
        mul x11, x3, x8
        adcs x17, x17, x11
        mul x11, x3, x9
        adcs x19, x19, x11
        mul x11, x3, x10
        adcs x20, x20, x11
        cset x21, hs
        umulh x11, x3, x5
        adds x15, x15, x11
        umulh x11, x3, x6
        adcs x16, x16, x11
        umulh x11, x3, x7
        adcs x17, x17, x11
        umulh x11, x3, x8
        adcs x19, x19, x11
        umulh x11, x3, x9
        adcs x20, x20, x11
        umulh x11, x3, x10
        adc x21, x21, x11
        mul x11, x4, x5
        adds x15, x15, x11
        mul x11, x4, x6
        adcs x16, x16, x11
        mul x11, x4, x7
        adcs x17, x17, x11
        mul x11, x4, x8
        adcs x19, x19, x11
        mul x11, x4, x9
        adcs x20, x20, x11
        mul x11, x4, x10
        adcs x21, x21, x11
        cset x22, hs
        umulh x11, x4, x5
        adds x16, x16, x11
        umulh x11, x4, x6
        adcs x17, x17, x11
        umulh x11, x4, x7
        adcs x19, x19, x11
        umulh x11, x4, x8
        adcs x20, x20, x11
        umulh x11, x4, x9
        adcs x21, x21, x11
        umulh x11, x4, x10
        adc x22, x22, x11
        ldp x3, x4, [sp, #272]
        mul x11, x3, x5
        adds x16, x16, x11
        mul x11, x3, x6
        adcs x17, x17, x11
        mul x11, x3, x7
        adcs x19, x19, x11
        mul x11, x3, x8
        adcs x20, x20, x11
        mul x11, x3, x9
        adcs x21, x21, x11
        mul x11, x3, x10
        adcs x22, x22, x11
        cset x2, hs
        umulh x11, x3, x5
        adds x17, x17, x11
        umulh x11, x3, x6
        adcs x19, x19, x11
        umulh x11, x3, x7
        adcs x20, x20, x11
        umulh x11, x3, x8
        adcs x21, x21, x11
        umulh x11, x3, x9
        adcs x22, x22, x11
        umulh x11, x3, x10
        adc x2, x2, x11
        mul x11, x4, x5
        adds x17, x17, x11
        mul x11, x4, x6
        adcs x19, x19, x11
        mul x11, x4, x7
        adcs x20, x20, x11
        mul x11, x4, x8
        adcs x21, x21, x11
        mul x11, x4, x9
        adcs x22, x22, x11
        mul x11, x4, x10
        adcs x2, x2, x11
        cset x1, hs
        umulh x11, x4, x5
        adds x19, x19, x11
        umulh x11, x4, x6
        adcs x20, x20, x11
        umulh x11, x4, x7
        adcs x21, x21, x11
        umulh x11, x4, x8
        adcs x22, x22, x11
        umulh x11, x4, x9
        adcs x2, x2, x11
        umulh x11, x4, x10
        adc x1, x1, x11
        lsl x7, x12, #32
        add x12, x7, x12
        mov x7, #-4294967295
        umulh x7, x7, x12
        mov x6, #4294967295
        mul x5, x6, x12
        umulh x6, x6, x12
        adds x7, x7, x5
        adcs x6, x6, x12
        adc x5, xzr, xzr
        subs x13, x13, x7
        sbcs x14, x14, x6
        sbcs x15, x15, x5
        sbcs x16, x16, xzr
        sbcs x17, x17, xzr
        sbc x12, x12, xzr
        lsl x7, x13, #32
        add x13, x7, x13
        mov x7, #-4294967295
        umulh x7, x7, x13
        mov x6, #4294967295
        mul x5, x6, x13
        umulh x6, x6, x13
        adds x7, x7, x5
        adcs x6, x6, x13
        adc x5, xzr, xzr
        subs x14, x14, x7
        sbcs x15, x15, x6
        sbcs x16, x16, x5
        sbcs x17, x17, xzr
        sbcs x12, x12, xzr
        sbc x13, x13, xzr
        lsl x7, x14, #32
        add x14, x7, x14
        mov x7, #-4294967295
        umulh x7, x7, x14
        mov x6, #4294967295
        mul x5, x6, x14
        umulh x6, x6, x14
        adds x7, x7, x5
        adcs x6, x6, x14
        adc x5, xzr, xzr
        subs x15, x15, x7
        sbcs x16, x16, x6
        sbcs x17, x17, x5
        sbcs x12, x12, xzr
        sbcs x13, x13, xzr
        sbc x14, x14, xzr
        lsl x7, x15, #32
        add x15, x7, x15
        mov x7, #-4294967295
        umulh x7, x7, x15
        mov x6, #4294967295
        mul x5, x6, x15
        umulh x6, x6, x15
        adds x7, x7, x5
        adcs x6, x6, x15
        adc x5, xzr, xzr
        subs x16, x16, x7
        sbcs x17, x17, x6
        sbcs x12, x12, x5
        sbcs x13, x13, xzr
        sbcs x14, x14, xzr
        sbc x15, x15, xzr
        lsl x7, x16, #32
        add x16, x7, x16
        mov x7, #-4294967295
        umulh x7, x7, x16
        mov x6, #4294967295
        mul x5, x6, x16
        umulh x6, x6, x16
        adds x7, x7, x5
        adcs x6, x6, x16
        adc x5, xzr, xzr
        subs x17, x17, x7
        sbcs x12, x12, x6
        sbcs x13, x13, x5
        sbcs x14, x14, xzr
        sbcs x15, x15, xzr
        sbc x16, x16, xzr
        lsl x7, x17, #32
        add x17, x7, x17
        mov x7, #-4294967295
        umulh x7, x7, x17
        mov x6, #4294967295
        mul x5, x6, x17
        umulh x6, x6, x17
        adds x7, x7, x5
        adcs x6, x6, x17
        adc x5, xzr, xzr
        subs x12, x12, x7
        sbcs x13, x13, x6
        sbcs x14, x14, x5
        sbcs x15, x15, xzr
        sbcs x16, x16, xzr
        sbc x17, x17, xzr
        adds x12, x12, x19
        adcs x13, x13, x20
        adcs x14, x14, x21
        adcs x15, x15, x22
        adcs x16, x16, x2
        adcs x17, x17, x1
        adc x10, xzr, xzr
        mov x11, #-4294967295
        adds x19, x12, x11
        mov x11, #4294967295
        adcs x20, x13, x11
        mov x11, #1
        adcs x21, x14, x11
        adcs x22, x15, xzr
        adcs x2, x16, xzr
        adcs x1, x17, xzr
        adcs x10, x10, xzr
        csel x12, x12, x19, eq
        csel x13, x13, x20, eq
        csel x14, x14, x21, eq
        csel x15, x15, x22, eq
        csel x16, x16, x2, eq
        csel x17, x17, x1, eq
        stp x12, x13, [sp, #96]
        stp x14, x15, [sp, #112]
        stp x16, x17, [sp, #128]
        ldp x5, x6, [x24, #48]
        ldp x4, x3, [x24, #96]
        adds x5, x5, x4
        adcs x6, x6, x3
        ldp x7, x8, [x24, #64]
        ldp x4, x3, [x24, #112]
        adcs x7, x7, x4
        adcs x8, x8, x3
        ldp x9, x10, [x24, #80]
        ldp x4, x3, [x24, #128]
        adcs x9, x9, x4
        adcs x10, x10, x3
        adc x3, xzr, xzr
        mov x4, #4294967295
        cmp x5, x4
        mov x4, #-4294967296
        sbcs xzr, x6, x4
        mov x4, #-2
        sbcs xzr, x7, x4
        adcs xzr, x8, xzr
        adcs xzr, x9, xzr
        adcs xzr, x10, xzr
        adcs x3, x3, xzr
        csetm x3, ne
        mov x4, #4294967295
        and x4, x4, x3
        subs x5, x5, x4
        eor x4, x4, x3
        sbcs x6, x6, x4
        mov x4, #-2
        and x4, x4, x3
        sbcs x7, x7, x4
        sbcs x8, x8, x3
        sbcs x9, x9, x3
        sbc x10, x10, x3
        stp x5, x6, [sp, #240]
        stp x7, x8, [sp, #256]
        stp x9, x10, [sp, #272]
        ldp x2, x3, [sp, #96]
        mul x9, x2, x3
        umulh x10, x2, x3
        ldp x4, x5, [sp, #112]
        mul x8, x2, x4
        adds x10, x10, x8
        mul x11, x2, x5
        mul x8, x3, x4
        adcs x11, x11, x8
        umulh x12, x2, x5
        mul x8, x3, x5
        adcs x12, x12, x8
        ldp x6, x7, [sp, #128]
        mul x13, x2, x7
        mul x8, x3, x6
        adcs x13, x13, x8
        umulh x14, x2, x7
        mul x8, x3, x7
        adcs x14, x14, x8
        mul x15, x5, x6
        adcs x15, x15, xzr
        umulh x16, x5, x6
        adc x16, x16, xzr
        umulh x8, x2, x4
        adds x11, x11, x8
        umulh x8, x3, x4
        adcs x12, x12, x8
        umulh x8, x3, x5
        adcs x13, x13, x8
        umulh x8, x3, x6
        adcs x14, x14, x8
        umulh x8, x3, x7
        adcs x15, x15, x8
        adc x16, x16, xzr
        mul x8, x2, x6
        adds x12, x12, x8
        mul x8, x4, x5
        adcs x13, x13, x8
        mul x8, x4, x6
        adcs x14, x14, x8
        mul x8, x4, x7
        adcs x15, x15, x8
        mul x8, x5, x7
        adcs x16, x16, x8
        mul x17, x6, x7
        adcs x17, x17, xzr
        umulh x19, x6, x7
        adc x19, x19, xzr
        umulh x8, x2, x6
        adds x13, x13, x8
        umulh x8, x4, x5
        adcs x14, x14, x8
        umulh x8, x4, x6
        adcs x15, x15, x8
        umulh x8, x4, x7
        adcs x16, x16, x8
        umulh x8, x5, x7
        adcs x17, x17, x8
        adc x19, x19, xzr
        adds x9, x9, x9
        adcs x10, x10, x10
        adcs x11, x11, x11
        adcs x12, x12, x12
        adcs x13, x13, x13
        adcs x14, x14, x14
        adcs x15, x15, x15
        adcs x16, x16, x16
        adcs x17, x17, x17
        adcs x19, x19, x19
        cset x20, hs
        umulh x8, x2, x2
        mul x2, x2, x2
        adds x9, x9, x8
        mul x8, x3, x3
        adcs x10, x10, x8
        umulh x8, x3, x3
        adcs x11, x11, x8
        mul x8, x4, x4
        adcs x12, x12, x8
        umulh x8, x4, x4
        adcs x13, x13, x8
        mul x8, x5, x5
        adcs x14, x14, x8
        umulh x8, x5, x5
        adcs x15, x15, x8
        mul x8, x6, x6
        adcs x16, x16, x8
        umulh x8, x6, x6
        adcs x17, x17, x8
        mul x8, x7, x7
        adcs x19, x19, x8
        umulh x8, x7, x7
        adc x20, x20, x8
        lsl x5, x2, #32
        add x2, x5, x2
        mov x5, #-4294967295
        umulh x5, x5, x2
        mov x4, #4294967295
        mul x3, x4, x2
        umulh x4, x4, x2
        adds x5, x5, x3
        adcs x4, x4, x2
        adc x3, xzr, xzr
        subs x9, x9, x5
        sbcs x10, x10, x4
        sbcs x11, x11, x3
        sbcs x12, x12, xzr
        sbcs x13, x13, xzr
        sbc x2, x2, xzr
        lsl x5, x9, #32
        add x9, x5, x9
        mov x5, #-4294967295
        umulh x5, x5, x9
        mov x4, #4294967295
        mul x3, x4, x9
        umulh x4, x4, x9
        adds x5, x5, x3
        adcs x4, x4, x9
        adc x3, xzr, xzr
        subs x10, x10, x5
        sbcs x11, x11, x4
        sbcs x12, x12, x3
        sbcs x13, x13, xzr
        sbcs x2, x2, xzr
        sbc x9, x9, xzr
        lsl x5, x10, #32
        add x10, x5, x10
        mov x5, #-4294967295
        umulh x5, x5, x10
        mov x4, #4294967295
        mul x3, x4, x10
        umulh x4, x4, x10
        adds x5, x5, x3
        adcs x4, x4, x10
        adc x3, xzr, xzr
        subs x11, x11, x5
        sbcs x12, x12, x4
        sbcs x13, x13, x3
        sbcs x2, x2, xzr
        sbcs x9, x9, xzr
        sbc x10, x10, xzr
        lsl x5, x11, #32
        add x11, x5, x11
        mov x5, #-4294967295
        umulh x5, x5, x11
        mov x4, #4294967295
        mul x3, x4, x11
        umulh x4, x4, x11
        adds x5, x5, x3
        adcs x4, x4, x11
        adc x3, xzr, xzr
        subs x12, x12, x5
        sbcs x13, x13, x4
        sbcs x2, x2, x3
        sbcs x9, x9, xzr
        sbcs x10, x10, xzr
        sbc x11, x11, xzr
        lsl x5, x12, #32
        add x12, x5, x12
        mov x5, #-4294967295
        umulh x5, x5, x12
        mov x4, #4294967295
        mul x3, x4, x12
        umulh x4, x4, x12
        adds x5, x5, x3
        adcs x4, x4, x12
        adc x3, xzr, xzr
        subs x13, x13, x5
        sbcs x2, x2, x4
        sbcs x9, x9, x3
        sbcs x10, x10, xzr
        sbcs x11, x11, xzr
        sbc x12, x12, xzr
        lsl x5, x13, #32
        add x13, x5, x13
        mov x5, #-4294967295
        umulh x5, x5, x13
        mov x4, #4294967295
        mul x3, x4, x13
        umulh x4, x4, x13
        adds x5, x5, x3
        adcs x4, x4, x13
        adc x3, xzr, xzr
        subs x2, x2, x5
        sbcs x9, x9, x4
        sbcs x10, x10, x3
        sbcs x11, x11, xzr
        sbcs x12, x12, xzr
        sbc x13, x13, xzr
        adds x2, x2, x14
        adcs x9, x9, x15
        adcs x10, x10, x16
        adcs x11, x11, x17
        adcs x12, x12, x19
        adcs x13, x13, x20
        adc x6, xzr, xzr
        mov x8, #-4294967295
        adds x14, x2, x8
        mov x8, #4294967295
        adcs x15, x9, x8
        mov x8, #1
        adcs x16, x10, x8
        adcs x17, x11, xzr
        adcs x19, x12, xzr
        adcs x20, x13, xzr
        adcs x6, x6, xzr
        csel x2, x2, x14, eq
        csel x9, x9, x15, eq
        csel x10, x10, x16, eq
        csel x11, x11, x17, eq
        csel x12, x12, x19, eq
        csel x13, x13, x20, eq
        stp x2, x9, [sp, #288]
        stp x10, x11, [sp, #304]
        stp x12, x13, [sp, #320]
        ldp x3, x4, [x24]
        ldp x5, x6, [sp, #48]
        mul x12, x3, x5
        umulh x13, x3, x5
        mul x11, x3, x6
        umulh x14, x3, x6
        adds x13, x13, x11
        ldp x7, x8, [sp, #64]
        mul x11, x3, x7
        umulh x15, x3, x7
        adcs x14, x14, x11
        mul x11, x3, x8
        umulh x16, x3, x8
        adcs x15, x15, x11
        ldp x9, x10, [sp, #80]
        mul x11, x3, x9
        umulh x17, x3, x9
        adcs x16, x16, x11
        mul x11, x3, x10
        umulh x19, x3, x10
        adcs x17, x17, x11
        adc x19, x19, xzr
        mul x11, x4, x5
        adds x13, x13, x11
        mul x11, x4, x6
        adcs x14, x14, x11
        mul x11, x4, x7
        adcs x15, x15, x11
        mul x11, x4, x8
        adcs x16, x16, x11
        mul x11, x4, x9
        adcs x17, x17, x11
        mul x11, x4, x10
        adcs x19, x19, x11
        cset x20, hs
        umulh x11, x4, x5
        adds x14, x14, x11
        umulh x11, x4, x6
        adcs x15, x15, x11
        umulh x11, x4, x7
        adcs x16, x16, x11
        umulh x11, x4, x8
        adcs x17, x17, x11
        umulh x11, x4, x9
        adcs x19, x19, x11
        umulh x11, x4, x10
        adc x20, x20, x11
        ldp x3, x4, [x24, #16]
        mul x11, x3, x5
        adds x14, x14, x11
        mul x11, x3, x6
        adcs x15, x15, x11
        mul x11, x3, x7
        adcs x16, x16, x11
        mul x11, x3, x8
        adcs x17, x17, x11
        mul x11, x3, x9
        adcs x19, x19, x11
        mul x11, x3, x10
        adcs x20, x20, x11
        cset x21, hs
        umulh x11, x3, x5
        adds x15, x15, x11
        umulh x11, x3, x6
        adcs x16, x16, x11
        umulh x11, x3, x7
        adcs x17, x17, x11
        umulh x11, x3, x8
        adcs x19, x19, x11
        umulh x11, x3, x9
        adcs x20, x20, x11
        umulh x11, x3, x10
        adc x21, x21, x11
        mul x11, x4, x5
        adds x15, x15, x11
        mul x11, x4, x6
        adcs x16, x16, x11
        mul x11, x4, x7
        adcs x17, x17, x11
        mul x11, x4, x8
        adcs x19, x19, x11
        mul x11, x4, x9
        adcs x20, x20, x11
        mul x11, x4, x10
        adcs x21, x21, x11
        cset x22, hs
        umulh x11, x4, x5
        adds x16, x16, x11
        umulh x11, x4, x6
        adcs x17, x17, x11
        umulh x11, x4, x7
        adcs x19, x19, x11
        umulh x11, x4, x8
        adcs x20, x20, x11
        umulh x11, x4, x9
        adcs x21, x21, x11
        umulh x11, x4, x10
        adc x22, x22, x11
        ldp x3, x4, [x24, #32]
        mul x11, x3, x5
        adds x16, x16, x11
        mul x11, x3, x6
        adcs x17, x17, x11
        mul x11, x3, x7
        adcs x19, x19, x11
        mul x11, x3, x8
        adcs x20, x20, x11
        mul x11, x3, x9
        adcs x21, x21, x11
        mul x11, x3, x10
        adcs x22, x22, x11
        cset x2, hs
        umulh x11, x3, x5
        adds x17, x17, x11
        umulh x11, x3, x6
        adcs x19, x19, x11
        umulh x11, x3, x7
        adcs x20, x20, x11
        umulh x11, x3, x8
        adcs x21, x21, x11
        umulh x11, x3, x9
        adcs x22, x22, x11
        umulh x11, x3, x10
        adc x2, x2, x11
        mul x11, x4, x5
        adds x17, x17, x11
        mul x11, x4, x6
        adcs x19, x19, x11
        mul x11, x4, x7
        adcs x20, x20, x11
        mul x11, x4, x8
        adcs x21, x21, x11
        mul x11, x4, x9
        adcs x22, x22, x11
        mul x11, x4, x10
        adcs x2, x2, x11
        cset x1, hs
        umulh x11, x4, x5
        adds x19, x19, x11
        umulh x11, x4, x6
        adcs x20, x20, x11
        umulh x11, x4, x7
        adcs x21, x21, x11
        umulh x11, x4, x8
        adcs x22, x22, x11
        umulh x11, x4, x9
        adcs x2, x2, x11
        umulh x11, x4, x10
        adc x1, x1, x11
        lsl x7, x12, #32
        add x12, x7, x12
        mov x7, #-4294967295
        umulh x7, x7, x12
        mov x6, #4294967295
        mul x5, x6, x12
        umulh x6, x6, x12
        adds x7, x7, x5
        adcs x6, x6, x12
        adc x5, xzr, xzr
        subs x13, x13, x7
        sbcs x14, x14, x6
        sbcs x15, x15, x5
        sbcs x16, x16, xzr
        sbcs x17, x17, xzr
        sbc x12, x12, xzr
        lsl x7, x13, #32
        add x13, x7, x13
        mov x7, #-4294967295
        umulh x7, x7, x13
        mov x6, #4294967295
        mul x5, x6, x13
        umulh x6, x6, x13
        adds x7, x7, x5
        adcs x6, x6, x13
        adc x5, xzr, xzr
        subs x14, x14, x7
        sbcs x15, x15, x6
        sbcs x16, x16, x5
        sbcs x17, x17, xzr
        sbcs x12, x12, xzr
        sbc x13, x13, xzr
        lsl x7, x14, #32
        add x14, x7, x14
        mov x7, #-4294967295
        umulh x7, x7, x14
        mov x6, #4294967295
        mul x5, x6, x14
        umulh x6, x6, x14
        adds x7, x7, x5
        adcs x6, x6, x14
        adc x5, xzr, xzr
        subs x15, x15, x7
        sbcs x16, x16, x6
        sbcs x17, x17, x5
        sbcs x12, x12, xzr
        sbcs x13, x13, xzr
        sbc x14, x14, xzr
        lsl x7, x15, #32
        add x15, x7, x15
        mov x7, #-4294967295
        umulh x7, x7, x15
        mov x6, #4294967295
        mul x5, x6, x15
        umulh x6, x6, x15
        adds x7, x7, x5
        adcs x6, x6, x15
        adc x5, xzr, xzr
        subs x16, x16, x7
        sbcs x17, x17, x6
        sbcs x12, x12, x5
        sbcs x13, x13, xzr
        sbcs x14, x14, xzr
        sbc x15, x15, xzr
        lsl x7, x16, #32
        add x16, x7, x16
        mov x7, #-4294967295
        umulh x7, x7, x16
        mov x6, #4294967295
        mul x5, x6, x16
        umulh x6, x6, x16
        adds x7, x7, x5
        adcs x6, x6, x16
        adc x5, xzr, xzr
        subs x17, x17, x7
        sbcs x12, x12, x6
        sbcs x13, x13, x5
        sbcs x14, x14, xzr
        sbcs x15, x15, xzr
        sbc x16, x16, xzr
        lsl x7, x17, #32
        add x17, x7, x17
        mov x7, #-4294967295
        umulh x7, x7, x17
        mov x6, #4294967295
        mul x5, x6, x17
        umulh x6, x6, x17
        adds x7, x7, x5
        adcs x6, x6, x17
        adc x5, xzr, xzr
        subs x12, x12, x7
        sbcs x13, x13, x6
        sbcs x14, x14, x5
        sbcs x15, x15, xzr
        sbcs x16, x16, xzr
        sbc x17, x17, xzr
        adds x12, x12, x19
        adcs x13, x13, x20
        adcs x14, x14, x21
        adcs x15, x15, x22
        adcs x16, x16, x2
        adcs x17, x17, x1
        adc x10, xzr, xzr
        mov x11, #-4294967295
        adds x19, x12, x11
        mov x11, #4294967295
        adcs x20, x13, x11
        mov x11, #1
        adcs x21, x14, x11
        adcs x22, x15, xzr
        adcs x2, x16, xzr
        adcs x1, x17, xzr
        adcs x10, x10, xzr
        csel x12, x12, x19, eq
        csel x13, x13, x20, eq
        csel x14, x14, x21, eq
        csel x15, x15, x22, eq
        csel x16, x16, x2, eq
        csel x17, x17, x1, eq
        stp x12, x13, [sp, #144]
        stp x14, x15, [sp, #160]
        stp x16, x17, [sp, #176]
        ldp x2, x3, [sp, #240]
        mul x9, x2, x3
        umulh x10, x2, x3
        ldp x4, x5, [sp, #256]
        mul x8, x2, x4
        adds x10, x10, x8
        mul x11, x2, x5
        mul x8, x3, x4
        adcs x11, x11, x8
        umulh x12, x2, x5
        mul x8, x3, x5
        adcs x12, x12, x8
        ldp x6, x7, [sp, #272]
        mul x13, x2, x7
        mul x8, x3, x6
        adcs x13, x13, x8
        umulh x14, x2, x7
        mul x8, x3, x7
        adcs x14, x14, x8
        mul x15, x5, x6
        adcs x15, x15, xzr
        umulh x16, x5, x6
        adc x16, x16, xzr
        umulh x8, x2, x4
        adds x11, x11, x8
        umulh x8, x3, x4
        adcs x12, x12, x8
        umulh x8, x3, x5
        adcs x13, x13, x8
        umulh x8, x3, x6
        adcs x14, x14, x8
        umulh x8, x3, x7
        adcs x15, x15, x8
        adc x16, x16, xzr
        mul x8, x2, x6
        adds x12, x12, x8
        mul x8, x4, x5
        adcs x13, x13, x8
        mul x8, x4, x6
        adcs x14, x14, x8
        mul x8, x4, x7
        adcs x15, x15, x8
        mul x8, x5, x7
        adcs x16, x16, x8
        mul x17, x6, x7
        adcs x17, x17, xzr
        umulh x19, x6, x7
        adc x19, x19, xzr
        umulh x8, x2, x6
        adds x13, x13, x8
        umulh x8, x4, x5
        adcs x14, x14, x8
        umulh x8, x4, x6
        adcs x15, x15, x8
        umulh x8, x4, x7
        adcs x16, x16, x8
        umulh x8, x5, x7
        adcs x17, x17, x8
        adc x19, x19, xzr
        adds x9, x9, x9
        adcs x10, x10, x10
        adcs x11, x11, x11
        adcs x12, x12, x12
        adcs x13, x13, x13
        adcs x14, x14, x14
        adcs x15, x15, x15
        adcs x16, x16, x16
        adcs x17, x17, x17
        adcs x19, x19, x19
        cset x20, hs
        umulh x8, x2, x2
        mul x2, x2, x2
        adds x9, x9, x8
        mul x8, x3, x3
        adcs x10, x10, x8
        umulh x8, x3, x3
        adcs x11, x11, x8
        mul x8, x4, x4
        adcs x12, x12, x8
        umulh x8, x4, x4
        adcs x13, x13, x8
        mul x8, x5, x5
        adcs x14, x14, x8
        umulh x8, x5, x5
        adcs x15, x15, x8
        mul x8, x6, x6
        adcs x16, x16, x8
        umulh x8, x6, x6
        adcs x17, x17, x8
        mul x8, x7, x7
        adcs x19, x19, x8
        umulh x8, x7, x7
        adc x20, x20, x8
        lsl x5, x2, #32
        add x2, x5, x2
        mov x5, #-4294967295
        umulh x5, x5, x2
        mov x4, #4294967295
        mul x3, x4, x2
        umulh x4, x4, x2
        adds x5, x5, x3
        adcs x4, x4, x2
        adc x3, xzr, xzr
        subs x9, x9, x5
        sbcs x10, x10, x4
        sbcs x11, x11, x3
        sbcs x12, x12, xzr
        sbcs x13, x13, xzr
        sbc x2, x2, xzr
        lsl x5, x9, #32
        add x9, x5, x9
        mov x5, #-4294967295
        umulh x5, x5, x9
        mov x4, #4294967295
        mul x3, x4, x9
        umulh x4, x4, x9
        adds x5, x5, x3
        adcs x4, x4, x9
        adc x3, xzr, xzr
        subs x10, x10, x5
        sbcs x11, x11, x4
        sbcs x12, x12, x3
        sbcs x13, x13, xzr
        sbcs x2, x2, xzr
        sbc x9, x9, xzr
        lsl x5, x10, #32
        add x10, x5, x10
        mov x5, #-4294967295
        umulh x5, x5, x10
        mov x4, #4294967295
        mul x3, x4, x10
        umulh x4, x4, x10
        adds x5, x5, x3
        adcs x4, x4, x10
        adc x3, xzr, xzr
        subs x11, x11, x5
        sbcs x12, x12, x4
        sbcs x13, x13, x3
        sbcs x2, x2, xzr
        sbcs x9, x9, xzr
        sbc x10, x10, xzr
        lsl x5, x11, #32
        add x11, x5, x11
        mov x5, #-4294967295
        umulh x5, x5, x11
        mov x4, #4294967295
        mul x3, x4, x11
        umulh x4, x4, x11
        adds x5, x5, x3
        adcs x4, x4, x11
        adc x3, xzr, xzr
        subs x12, x12, x5
        sbcs x13, x13, x4
        sbcs x2, x2, x3
        sbcs x9, x9, xzr
        sbcs x10, x10, xzr
        sbc x11, x11, xzr
        lsl x5, x12, #32
        add x12, x5, x12
        mov x5, #-4294967295
        umulh x5, x5, x12
        mov x4, #4294967295
        mul x3, x4, x12
        umulh x4, x4, x12
        adds x5, x5, x3
        adcs x4, x4, x12
        adc x3, xzr, xzr
        subs x13, x13, x5
        sbcs x2, x2, x4
        sbcs x9, x9, x3
        sbcs x10, x10, xzr
        sbcs x11, x11, xzr
        sbc x12, x12, xzr
        lsl x5, x13, #32
        add x13, x5, x13
        mov x5, #-4294967295
        umulh x5, x5, x13
        mov x4, #4294967295
        mul x3, x4, x13
        umulh x4, x4, x13
        adds x5, x5, x3
        adcs x4, x4, x13
        adc x3, xzr, xzr
        subs x2, x2, x5
        sbcs x9, x9, x4
        sbcs x10, x10, x3
        sbcs x11, x11, xzr
        sbcs x12, x12, xzr
        sbc x13, x13, xzr
        adds x2, x2, x14
        adcs x9, x9, x15
        adcs x10, x10, x16
        adcs x11, x11, x17
        adcs x12, x12, x19
        adcs x13, x13, x20
        adc x6, xzr, xzr
        mov x8, #-4294967295
        adds x14, x2, x8
        mov x8, #4294967295
        adcs x15, x9, x8
        mov x8, #1
        adcs x16, x10, x8
        adcs x17, x11, xzr
        adcs x19, x12, xzr
        adcs x20, x13, xzr
        adcs x6, x6, xzr
        csel x2, x2, x14, eq
        csel x9, x9, x15, eq
        csel x10, x10, x16, eq
        csel x11, x11, x17, eq
        csel x12, x12, x19, eq
        csel x13, x13, x20, eq
        stp x2, x9, [sp, #192]
        stp x10, x11, [sp, #208]
        stp x12, x13, [sp, #224]
        ldp x0, x1, [sp, #288]
        mov x6, #4294967295
        subs x6, x6, x0
        mov x7, #-4294967296
        sbcs x7, x7, x1
        ldp x0, x1, [sp, #304]
        mov x8, #-2
        sbcs x8, x8, x0
        mov x13, #-1
        sbcs x9, x13, x1
        ldp x0, x1, [sp, #320]
        sbcs x10, x13, x0
        sbc x11, x13, x1
        mov x12, #9
        mul x0, x12, x6
        mul x1, x12, x7
        mul x2, x12, x8
        mul x3, x12, x9
        mul x4, x12, x10
        mul x5, x12, x11
        umulh x6, x12, x6
        umulh x7, x12, x7
        umulh x8, x12, x8
        umulh x9, x12, x9
        umulh x10, x12, x10
        umulh x12, x12, x11
        adds x1, x1, x6
        adcs x2, x2, x7
        adcs x3, x3, x8
        adcs x4, x4, x9
        adcs x5, x5, x10
        mov x6, #1
        adc x6, x12, x6
        ldp x8, x9, [sp, #144]
        ldp x10, x11, [sp, #160]
        ldp x12, x13, [sp, #176]
        mov x14, #12
        mul x15, x14, x8
        umulh x8, x14, x8
        adds x0, x0, x15
        mul x15, x14, x9
        umulh x9, x14, x9
        adcs x1, x1, x15
        mul x15, x14, x10
        umulh x10, x14, x10
        adcs x2, x2, x15
        mul x15, x14, x11
        umulh x11, x14, x11
        adcs x3, x3, x15
        mul x15, x14, x12
        umulh x12, x14, x12
        adcs x4, x4, x15
        mul x15, x14, x13
        umulh x13, x14, x13
        adcs x5, x5, x15
        adc x6, x6, xzr
        adds x1, x1, x8
        adcs x2, x2, x9
        adcs x3, x3, x10
        adcs x4, x4, x11
        adcs x5, x5, x12
        adcs x6, x6, x13
        lsl x7, x6, #32
        subs x8, x6, x7
        sbc x7, x7, xzr
        adds x0, x0, x8
        adcs x1, x1, x7
        adcs x2, x2, x6
        adcs x3, x3, xzr
        adcs x4, x4, xzr
        adcs x5, x5, xzr
        csetm x6, lo
        mov x7, #4294967295
        and x7, x7, x6
        adds x0, x0, x7
        eor x7, x7, x6
        adcs x1, x1, x7
        mov x7, #-2
        and x7, x7, x6
        adcs x2, x2, x7
        adcs x3, x3, x6
        adcs x4, x4, x6
        adc x5, x5, x6
        stp x0, x1, [sp, #288]
        stp x2, x3, [sp, #304]
        stp x4, x5, [sp, #320]
        ldp x5, x6, [sp, #192]
        ldp x4, x3, [sp]
        subs x5, x5, x4
        sbcs x6, x6, x3
        ldp x7, x8, [sp, #208]
        ldp x4, x3, [sp, #16]
        sbcs x7, x7, x4
        sbcs x8, x8, x3
        ldp x9, x10, [sp, #224]
        ldp x4, x3, [sp, #32]
        sbcs x9, x9, x4
        sbcs x10, x10, x3
        csetm x3, lo
        mov x4, #4294967295
        and x4, x4, x3
        adds x5, x5, x4
        eor x4, x4, x3
        adcs x6, x6, x4
        mov x4, #-2
        and x4, x4, x3
        adcs x7, x7, x4
        adcs x8, x8, x3
        adcs x9, x9, x3
        adc x10, x10, x3
        stp x5, x6, [sp, #240]
        stp x7, x8, [sp, #256]
        stp x9, x10, [sp, #272]
        ldp x2, x3, [sp, #48]
        mul x9, x2, x3
        umulh x10, x2, x3
        ldp x4, x5, [sp, #64]
        mul x8, x2, x4
        adds x10, x10, x8
        mul x11, x2, x5
        mul x8, x3, x4
        adcs x11, x11, x8
        umulh x12, x2, x5
        mul x8, x3, x5
        adcs x12, x12, x8
        ldp x6, x7, [sp, #80]
        mul x13, x2, x7
        mul x8, x3, x6
        adcs x13, x13, x8
        umulh x14, x2, x7
        mul x8, x3, x7
        adcs x14, x14, x8
        mul x15, x5, x6
        adcs x15, x15, xzr
        umulh x16, x5, x6
        adc x16, x16, xzr
        umulh x8, x2, x4
        adds x11, x11, x8
        umulh x8, x3, x4
        adcs x12, x12, x8
        umulh x8, x3, x5
        adcs x13, x13, x8
        umulh x8, x3, x6
        adcs x14, x14, x8
        umulh x8, x3, x7
        adcs x15, x15, x8
        adc x16, x16, xzr
        mul x8, x2, x6
        adds x12, x12, x8
        mul x8, x4, x5
        adcs x13, x13, x8
        mul x8, x4, x6
        adcs x14, x14, x8
        mul x8, x4, x7
        adcs x15, x15, x8
        mul x8, x5, x7
        adcs x16, x16, x8
        mul x17, x6, x7
        adcs x17, x17, xzr
        umulh x19, x6, x7
        adc x19, x19, xzr
        umulh x8, x2, x6
        adds x13, x13, x8
        umulh x8, x4, x5
        adcs x14, x14, x8
        umulh x8, x4, x6
        adcs x15, x15, x8
        umulh x8, x4, x7
        adcs x16, x16, x8
        umulh x8, x5, x7
        adcs x17, x17, x8
        adc x19, x19, xzr
        adds x9, x9, x9
        adcs x10, x10, x10
        adcs x11, x11, x11
        adcs x12, x12, x12
        adcs x13, x13, x13
        adcs x14, x14, x14
        adcs x15, x15, x15
        adcs x16, x16, x16
        adcs x17, x17, x17
        adcs x19, x19, x19
        cset x20, hs
        umulh x8, x2, x2
        mul x2, x2, x2
        adds x9, x9, x8
        mul x8, x3, x3
        adcs x10, x10, x8
        umulh x8, x3, x3
        adcs x11, x11, x8
        mul x8, x4, x4
        adcs x12, x12, x8
        umulh x8, x4, x4
        adcs x13, x13, x8
        mul x8, x5, x5
        adcs x14, x14, x8
        umulh x8, x5, x5
        adcs x15, x15, x8
        mul x8, x6, x6
        adcs x16, x16, x8
        umulh x8, x6, x6
        adcs x17, x17, x8
        mul x8, x7, x7
        adcs x19, x19, x8
        umulh x8, x7, x7
        adc x20, x20, x8
        lsl x5, x2, #32
        add x2, x5, x2
        mov x5, #-4294967295
        umulh x5, x5, x2
        mov x4, #4294967295
        mul x3, x4, x2
        umulh x4, x4, x2
        adds x5, x5, x3
        adcs x4, x4, x2
        adc x3, xzr, xzr
        subs x9, x9, x5
        sbcs x10, x10, x4
        sbcs x11, x11, x3
        sbcs x12, x12, xzr
        sbcs x13, x13, xzr
        sbc x2, x2, xzr
        lsl x5, x9, #32
        add x9, x5, x9
        mov x5, #-4294967295
        umulh x5, x5, x9
        mov x4, #4294967295
        mul x3, x4, x9
        umulh x4, x4, x9
        adds x5, x5, x3
        adcs x4, x4, x9
        adc x3, xzr, xzr
        subs x10, x10, x5
        sbcs x11, x11, x4
        sbcs x12, x12, x3
        sbcs x13, x13, xzr
        sbcs x2, x2, xzr
        sbc x9, x9, xzr
        lsl x5, x10, #32
        add x10, x5, x10
        mov x5, #-4294967295
        umulh x5, x5, x10
        mov x4, #4294967295
        mul x3, x4, x10
        umulh x4, x4, x10
        adds x5, x5, x3
        adcs x4, x4, x10
        adc x3, xzr, xzr
        subs x11, x11, x5
        sbcs x12, x12, x4
        sbcs x13, x13, x3
        sbcs x2, x2, xzr
        sbcs x9, x9, xzr
        sbc x10, x10, xzr
        lsl x5, x11, #32
        add x11, x5, x11
        mov x5, #-4294967295
        umulh x5, x5, x11
        mov x4, #4294967295
        mul x3, x4, x11
        umulh x4, x4, x11
        adds x5, x5, x3
        adcs x4, x4, x11
        adc x3, xzr, xzr
        subs x12, x12, x5
        sbcs x13, x13, x4
        sbcs x2, x2, x3
        sbcs x9, x9, xzr
        sbcs x10, x10, xzr
        sbc x11, x11, xzr
        lsl x5, x12, #32
        add x12, x5, x12
        mov x5, #-4294967295
        umulh x5, x5, x12
        mov x4, #4294967295
        mul x3, x4, x12
        umulh x4, x4, x12
        adds x5, x5, x3
        adcs x4, x4, x12
        adc x3, xzr, xzr
        subs x13, x13, x5
        sbcs x2, x2, x4
        sbcs x9, x9, x3
        sbcs x10, x10, xzr
        sbcs x11, x11, xzr
        sbc x12, x12, xzr
        lsl x5, x13, #32
        add x13, x5, x13
        mov x5, #-4294967295
        umulh x5, x5, x13
        mov x4, #4294967295
        mul x3, x4, x13
        umulh x4, x4, x13
        adds x5, x5, x3
        adcs x4, x4, x13
        adc x3, xzr, xzr
        subs x2, x2, x5
        sbcs x9, x9, x4
        sbcs x10, x10, x3
        sbcs x11, x11, xzr
        sbcs x12, x12, xzr
        sbc x13, x13, xzr
        adds x2, x2, x14
        adcs x9, x9, x15
        adcs x10, x10, x16
        adcs x11, x11, x17
        adcs x12, x12, x19
        adcs x13, x13, x20
        adc x6, xzr, xzr
        mov x8, #-4294967295
        adds x14, x2, x8
        mov x8, #4294967295
        adcs x15, x9, x8
        mov x8, #1
        adcs x16, x10, x8
        adcs x17, x11, xzr
        adcs x19, x12, xzr
        adcs x20, x13, xzr
        adcs x6, x6, xzr
        csel x2, x2, x14, eq
        csel x9, x9, x15, eq
        csel x10, x10, x16, eq
        csel x11, x11, x17, eq
        csel x12, x12, x19, eq
        csel x13, x13, x20, eq
        stp x2, x9, [sp, #192]
        stp x10, x11, [sp, #208]
        stp x12, x13, [sp, #224]
        ldp x5, x6, [sp, #240]
        ldp x4, x3, [sp, #48]
        subs x5, x5, x4
        sbcs x6, x6, x3
        ldp x7, x8, [sp, #256]
        ldp x4, x3, [sp, #64]
        sbcs x7, x7, x4
        sbcs x8, x8, x3
        ldp x9, x10, [sp, #272]
        ldp x4, x3, [sp, #80]
        sbcs x9, x9, x4
        sbcs x10, x10, x3
        csetm x3, lo
        mov x4, #4294967295
        and x4, x4, x3
        adds x5, x5, x4
        eor x4, x4, x3
        adcs x6, x6, x4
        mov x4, #-2
        and x4, x4, x3
        adcs x7, x7, x4
        adcs x8, x8, x3
        adcs x9, x9, x3
        adc x10, x10, x3
        stp x5, x6, [x23, #96]
        stp x7, x8, [x23, #112]
        stp x9, x10, [x23, #128]
        ldp x3, x4, [sp, #288]
        ldp x5, x6, [sp, #96]
        mul x12, x3, x5
        umulh x13, x3, x5
        mul x11, x3, x6
        umulh x14, x3, x6
        adds x13, x13, x11
        ldp x7, x8, [sp, #112]
        mul x11, x3, x7
        umulh x15, x3, x7
        adcs x14, x14, x11
        mul x11, x3, x8
        umulh x16, x3, x8
        adcs x15, x15, x11
        ldp x9, x10, [sp, #128]
        mul x11, x3, x9
        umulh x17, x3, x9
        adcs x16, x16, x11
        mul x11, x3, x10
        umulh x19, x3, x10
        adcs x17, x17, x11
        adc x19, x19, xzr
        mul x11, x4, x5
        adds x13, x13, x11
        mul x11, x4, x6
        adcs x14, x14, x11
        mul x11, x4, x7
        adcs x15, x15, x11
        mul x11, x4, x8
        adcs x16, x16, x11
        mul x11, x4, x9
        adcs x17, x17, x11
        mul x11, x4, x10
        adcs x19, x19, x11
        cset x20, hs
        umulh x11, x4, x5
        adds x14, x14, x11
        umulh x11, x4, x6
        adcs x15, x15, x11
        umulh x11, x4, x7
        adcs x16, x16, x11
        umulh x11, x4, x8
        adcs x17, x17, x11
        umulh x11, x4, x9
        adcs x19, x19, x11
        umulh x11, x4, x10
        adc x20, x20, x11
        ldp x3, x4, [sp, #304]
        mul x11, x3, x5
        adds x14, x14, x11
        mul x11, x3, x6
        adcs x15, x15, x11
        mul x11, x3, x7
        adcs x16, x16, x11
        mul x11, x3, x8
        adcs x17, x17, x11
        mul x11, x3, x9
        adcs x19, x19, x11
        mul x11, x3, x10
        adcs x20, x20, x11
        cset x21, hs
        umulh x11, x3, x5
        adds x15, x15, x11
        umulh x11, x3, x6
        adcs x16, x16, x11
        umulh x11, x3, x7
        adcs x17, x17, x11
        umulh x11, x3, x8
        adcs x19, x19, x11
        umulh x11, x3, x9
        adcs x20, x20, x11
        umulh x11, x3, x10
        adc x21, x21, x11
        mul x11, x4, x5
        adds x15, x15, x11
        mul x11, x4, x6
        adcs x16, x16, x11
        mul x11, x4, x7
        adcs x17, x17, x11
        mul x11, x4, x8
        adcs x19, x19, x11
        mul x11, x4, x9
        adcs x20, x20, x11
        mul x11, x4, x10
        adcs x21, x21, x11
        cset x22, hs
        umulh x11, x4, x5
        adds x16, x16, x11
        umulh x11, x4, x6
        adcs x17, x17, x11
        umulh x11, x4, x7
        adcs x19, x19, x11
        umulh x11, x4, x8
        adcs x20, x20, x11
        umulh x11, x4, x9
        adcs x21, x21, x11
        umulh x11, x4, x10
        adc x22, x22, x11
        ldp x3, x4, [sp, #320]
        mul x11, x3, x5
        adds x16, x16, x11
        mul x11, x3, x6
        adcs x17, x17, x11
        mul x11, x3, x7
        adcs x19, x19, x11
        mul x11, x3, x8
        adcs x20, x20, x11
        mul x11, x3, x9
        adcs x21, x21, x11
        mul x11, x3, x10
        adcs x22, x22, x11
        cset x2, hs
        umulh x11, x3, x5
        adds x17, x17, x11
        umulh x11, x3, x6
        adcs x19, x19, x11
        umulh x11, x3, x7
        adcs x20, x20, x11
        umulh x11, x3, x8
        adcs x21, x21, x11
        umulh x11, x3, x9
        adcs x22, x22, x11
        umulh x11, x3, x10
        adc x2, x2, x11
        mul x11, x4, x5
        adds x17, x17, x11
        mul x11, x4, x6
        adcs x19, x19, x11
        mul x11, x4, x7
        adcs x20, x20, x11
        mul x11, x4, x8
        adcs x21, x21, x11
        mul x11, x4, x9
        adcs x22, x22, x11
        mul x11, x4, x10
        adcs x2, x2, x11
        cset x1, hs
        umulh x11, x4, x5
        adds x19, x19, x11
        umulh x11, x4, x6
        adcs x20, x20, x11
        umulh x11, x4, x7
        adcs x21, x21, x11
        umulh x11, x4, x8
        adcs x22, x22, x11
        umulh x11, x4, x9
        adcs x2, x2, x11
        umulh x11, x4, x10
        adc x1, x1, x11
        lsl x7, x12, #32
        add x12, x7, x12
        mov x7, #-4294967295
        umulh x7, x7, x12
        mov x6, #4294967295
        mul x5, x6, x12
        umulh x6, x6, x12
        adds x7, x7, x5
        adcs x6, x6, x12
        adc x5, xzr, xzr
        subs x13, x13, x7
        sbcs x14, x14, x6
        sbcs x15, x15, x5
        sbcs x16, x16, xzr
        sbcs x17, x17, xzr
        sbc x12, x12, xzr
        lsl x7, x13, #32
        add x13, x7, x13
        mov x7, #-4294967295
        umulh x7, x7, x13
        mov x6, #4294967295
        mul x5, x6, x13
        umulh x6, x6, x13
        adds x7, x7, x5
        adcs x6, x6, x13
        adc x5, xzr, xzr
        subs x14, x14, x7
        sbcs x15, x15, x6
        sbcs x16, x16, x5
        sbcs x17, x17, xzr
        sbcs x12, x12, xzr
        sbc x13, x13, xzr
        lsl x7, x14, #32
        add x14, x7, x14
        mov x7, #-4294967295
        umulh x7, x7, x14
        mov x6, #4294967295
        mul x5, x6, x14
        umulh x6, x6, x14
        adds x7, x7, x5
        adcs x6, x6, x14
        adc x5, xzr, xzr
        subs x15, x15, x7
        sbcs x16, x16, x6
        sbcs x17, x17, x5
        sbcs x12, x12, xzr
        sbcs x13, x13, xzr
        sbc x14, x14, xzr
        lsl x7, x15, #32
        add x15, x7, x15
        mov x7, #-4294967295
        umulh x7, x7, x15
        mov x6, #4294967295
        mul x5, x6, x15
        umulh x6, x6, x15
        adds x7, x7, x5
        adcs x6, x6, x15
        adc x5, xzr, xzr
        subs x16, x16, x7
        sbcs x17, x17, x6
        sbcs x12, x12, x5
        sbcs x13, x13, xzr
        sbcs x14, x14, xzr
        sbc x15, x15, xzr
        lsl x7, x16, #32
        add x16, x7, x16
        mov x7, #-4294967295
        umulh x7, x7, x16
        mov x6, #4294967295
        mul x5, x6, x16
        umulh x6, x6, x16
        adds x7, x7, x5
        adcs x6, x6, x16
        adc x5, xzr, xzr
        subs x17, x17, x7
        sbcs x12, x12, x6
        sbcs x13, x13, x5
        sbcs x14, x14, xzr
        sbcs x15, x15, xzr
        sbc x16, x16, xzr
        lsl x7, x17, #32
        add x17, x7, x17
        mov x7, #-4294967295
        umulh x7, x7, x17
        mov x6, #4294967295
        mul x5, x6, x17
        umulh x6, x6, x17
        adds x7, x7, x5
        adcs x6, x6, x17
        adc x5, xzr, xzr
        subs x12, x12, x7
        sbcs x13, x13, x6
        sbcs x14, x14, x5
        sbcs x15, x15, xzr
        sbcs x16, x16, xzr
        sbc x17, x17, xzr
        adds x12, x12, x19
        adcs x13, x13, x20
        adcs x14, x14, x21
        adcs x15, x15, x22
        adcs x16, x16, x2
        adcs x17, x17, x1
        adc x10, xzr, xzr
        mov x11, #-4294967295
        adds x19, x12, x11
        mov x11, #4294967295
        adcs x20, x13, x11
        mov x11, #1
        adcs x21, x14, x11
        adcs x22, x15, xzr
        adcs x2, x16, xzr
        adcs x1, x17, xzr
        adcs x10, x10, xzr
        csel x12, x12, x19, eq
        csel x13, x13, x20, eq
        csel x14, x14, x21, eq
        csel x15, x15, x22, eq
        csel x16, x16, x2, eq
        csel x17, x17, x1, eq
        stp x12, x13, [sp, #240]
        stp x14, x15, [sp, #256]
        stp x16, x17, [sp, #272]
        ldp x1, x2, [sp, #144]
        ldp x3, x4, [sp, #160]
        ldp x5, x6, [sp, #176]
        lsl x0, x1, #2
        ldp x7, x8, [sp, #288]
        subs x0, x0, x7
        extr x1, x2, x1, #62
        sbcs x1, x1, x8
        ldp x7, x8, [sp, #304]
        extr x2, x3, x2, #62
        sbcs x2, x2, x7
        extr x3, x4, x3, #62
        sbcs x3, x3, x8
        extr x4, x5, x4, #62
        ldp x7, x8, [sp, #320]
        sbcs x4, x4, x7
        extr x5, x6, x5, #62
        sbcs x5, x5, x8
        lsr x6, x6, #62
        adc x6, x6, xzr
        lsl x7, x6, #32
        subs x8, x6, x7
        sbc x7, x7, xzr
        adds x0, x0, x8
        adcs x1, x1, x7
        adcs x2, x2, x6
        adcs x3, x3, xzr
        adcs x4, x4, xzr
        adcs x5, x5, xzr
        csetm x8, lo
        mov x9, #4294967295
        and x9, x9, x8
        adds x0, x0, x9
        eor x9, x9, x8
        adcs x1, x1, x9
        mov x9, #-2
        and x9, x9, x8
        adcs x2, x2, x9
        adcs x3, x3, x8
        adcs x4, x4, x8
        adc x5, x5, x8
        stp x0, x1, [x23]
        stp x2, x3, [x23, #16]
        stp x4, x5, [x23, #32]
        ldp x0, x1, [sp, #192]
        mov x6, #4294967295
        subs x6, x6, x0
        mov x7, #-4294967296
        sbcs x7, x7, x1
        ldp x0, x1, [sp, #208]
        mov x8, #-2
        sbcs x8, x8, x0
        mov x13, #-1
        sbcs x9, x13, x1
        ldp x0, x1, [sp, #224]
        sbcs x10, x13, x0
        sbc x11, x13, x1
        lsl x0, x6, #3
        extr x1, x7, x6, #61
        extr x2, x8, x7, #61
        extr x3, x9, x8, #61
        extr x4, x10, x9, #61
        extr x5, x11, x10, #61
        lsr x6, x11, #61
        add x6, x6, #1
        ldp x8, x9, [sp, #240]
        ldp x10, x11, [sp, #256]
        ldp x12, x13, [sp, #272]
        mov x14, #3
        mul x15, x14, x8
        umulh x8, x14, x8
        adds x0, x0, x15
        mul x15, x14, x9
        umulh x9, x14, x9
        adcs x1, x1, x15
        mul x15, x14, x10
        umulh x10, x14, x10
        adcs x2, x2, x15
        mul x15, x14, x11
        umulh x11, x14, x11
        adcs x3, x3, x15
        mul x15, x14, x12
        umulh x12, x14, x12
        adcs x4, x4, x15
        mul x15, x14, x13
        umulh x13, x14, x13
        adcs x5, x5, x15
        adc x6, x6, xzr
        adds x1, x1, x8
        adcs x2, x2, x9
        adcs x3, x3, x10
        adcs x4, x4, x11
        adcs x5, x5, x12
        adcs x6, x6, x13
        lsl x7, x6, #32
        subs x8, x6, x7
        sbc x7, x7, xzr
        adds x0, x0, x8
        adcs x1, x1, x7
        adcs x2, x2, x6
        adcs x3, x3, xzr
        adcs x4, x4, xzr
        adcs x5, x5, xzr
        csetm x6, lo
        mov x7, #4294967295
        and x7, x7, x6
        adds x0, x0, x7
        eor x7, x7, x6
        adcs x1, x1, x7
        mov x7, #-2
        and x7, x7, x6
        adcs x2, x2, x7
        adcs x3, x3, x6
        adcs x4, x4, x6
        adc x5, x5, x6
        stp x0, x1, [x23, #48]
        stp x2, x3, [x23, #64]
        stp x4, x5, [x23, #80]
        add sp, sp, #336
        ldp x23, x24, [sp], #16
        ldp x21, x22, [sp], #16
        ldp x19, x20, [sp], #16
        ret
