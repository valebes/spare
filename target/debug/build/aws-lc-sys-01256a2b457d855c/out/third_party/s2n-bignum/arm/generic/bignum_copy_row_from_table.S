# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_copy_row_from_table.S"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 467 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_copy_row_from_table.S" 2
# 17 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_copy_row_from_table.S"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/include/_internal_s2n_bignum.h" 1
# 18 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_copy_row_from_table.S" 2

        .globl _bignum_copy_row_from_table

        .text
        .balign 4
# 34 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/third_party/s2n-bignum/arm/generic/bignum_copy_row_from_table.S"
_bignum_copy_row_from_table:

        cbz x2, bignum_copy_row_from_table_end
        cbz x3, bignum_copy_row_from_table_end
        mov x5, x3
        mov x6, x0

bignum_copy_row_from_table_initzero:
        str xzr, [x6]
        add x6, x6, #8
        subs x5, x5, #1
        bne bignum_copy_row_from_table_initzero

        mov x5, xzr
        mov x8, x1

bignum_copy_row_from_table_outerloop:

        cmp x5, x4
        csetm x6, eq

        mov x7, x3
        mov x9, x0

bignum_copy_row_from_table_innerloop:

        ldr x10, [x8]
        ldr x11, [x9]
        and x10, x10, x6
        orr x11, x11, x10
        str x11, [x9]

        add x8, x8, #8
        add x9, x9, #8
        subs x7, x7, #1
        bne bignum_copy_row_from_table_innerloop

bignum_copy_row_from_table_innerloop_done:
        add x5, x5, #1
        cmp x5, x2
        bne bignum_copy_row_from_table_outerloop

bignum_copy_row_from_table_end:
        ret
