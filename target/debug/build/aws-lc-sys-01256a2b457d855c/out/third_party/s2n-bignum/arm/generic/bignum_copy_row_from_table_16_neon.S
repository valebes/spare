# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_copy_row_from_table_16_neon.S"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 467 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_copy_row_from_table_16_neon.S" 2
# 17 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_copy_row_from_table_16_neon.S"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/include/_internal_s2n_bignum.h" 1
# 18 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_copy_row_from_table_16_neon.S" 2

        .globl _bignum_copy_row_from_table_16_neon

        .text
        .balign 4
# 60 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_copy_row_from_table_16_neon.S"
_bignum_copy_row_from_table_16_neon:



    dup v20.2d, xzr
    mov v21.16b, v20.16b
    mov v22.16b, v20.16b
    mov v23.16b, v20.16b
    mov v24.16b, v20.16b
    mov v25.16b, v20.16b
    mov v26.16b, v20.16b
    mov v27.16b, v20.16b

    mov x6, #0
bignum_copy_row_from_table_16_neon_loop:


    subs xzr, x6, x3
    cinv x5, xzr, eq
    dup v17.2d, x5

    ldr q16, [x1, #16*0]
    bit v20.16b, v16.16b, v17.16b

    ldr q16, [x1, #16*1]
    bit v21.16b, v16.16b, v17.16b

    ldr q16, [x1, #16*2]
    bit v22.16b, v16.16b, v17.16b

    ldr q16, [x1, #16*3]
    bit v23.16b, v16.16b, v17.16b

    ldr q16, [x1, #16*4]
    bit v24.16b, v16.16b, v17.16b

    ldr q16, [x1, #16*5]
    bit v25.16b, v16.16b, v17.16b

    ldr q16, [x1, #16*6]
    bit v26.16b, v16.16b, v17.16b

    ldr q16, [x1, #16*7]
    bit v27.16b, v16.16b, v17.16b

    add x1, x1, #16*8

    add x6, x6, #1
    subs xzr, x2, x6
    b.ne bignum_copy_row_from_table_16_neon_loop

bignum_copy_row_from_table_16_neon_end:

    str q20, [x0, #16*0]
    str q21, [x0, #16*1]
    str q22, [x0, #16*2]
    str q23, [x0, #16*3]
    str q24, [x0, #16*4]
    str q25, [x0, #16*5]
    str q26, [x0, #16*6]
    str q27, [x0, #16*7]

    ret
