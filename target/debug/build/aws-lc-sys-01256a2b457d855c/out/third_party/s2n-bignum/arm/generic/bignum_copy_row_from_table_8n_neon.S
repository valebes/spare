# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_copy_row_from_table_8n_neon.S"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 467 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_copy_row_from_table_8n_neon.S" 2
# 16 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_copy_row_from_table_8n_neon.S"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/include/_internal_s2n_bignum.h" 1
# 17 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_copy_row_from_table_8n_neon.S" 2

        .globl _bignum_copy_row_from_table_8n_neon

        .text
        .balign 4
# 36 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_copy_row_from_table_8n_neon.S"
_bignum_copy_row_from_table_8n_neon:

        cbz x2, bignum_copy_row_from_table_8n_neon_end
        cbz x3, bignum_copy_row_from_table_8n_neon_end
        mov x5, x3
        mov x6, x0
        dup v16.2d, xzr

bignum_copy_row_from_table_8n_neon_initzero:
        str q16, [x6]
        str q16, [x6, #16]
        str q16, [x6, #32]
        str q16, [x6, #48]
        add x6, x6, #64
        subs x5, x5, #8
        bne bignum_copy_row_from_table_8n_neon_initzero

        mov x5, xzr
        mov x8, x1

bignum_copy_row_from_table_8n_neon_outerloop:

        cmp x5, x4
        csetm x6, eq
        dup v16.2d, x6

        mov x7, x3
        mov x9, x0

bignum_copy_row_from_table_8n_neon_innerloop:

        ldr q17, [x8]
        ldr q18, [x9]
        bit v18.16b, v17.16b, v16.16b
        str q18, [x9]

        ldr q17, [x8, #16]
        ldr q18, [x9, #16]
        bit v18.16b, v17.16b, v16.16b
        str q18, [x9, #16]

        ldr q17, [x8, #32]
        ldr q18, [x9, #32]
        bit v18.16b, v17.16b, v16.16b
        str q18, [x9, #32]

        ldr q17, [x8, #48]
        ldr q18, [x9, #48]
        bit v18.16b, v17.16b, v16.16b
        str q18, [x9, #48]

        add x8, x8, #64
        add x9, x9, #64
        subs x7, x7, #8
        bne bignum_copy_row_from_table_8n_neon_innerloop

bignum_copy_row_from_table_8n_neon_innerloop_done:
        add x5, x5, #1
        cmp x5, x2
        bne bignum_copy_row_from_table_8n_neon_outerloop

bignum_copy_row_from_table_8n_neon_end:
        ret
