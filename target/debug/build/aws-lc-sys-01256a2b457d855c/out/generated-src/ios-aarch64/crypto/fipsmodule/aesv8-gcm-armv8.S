# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/aesv8-gcm-armv8.S"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 467 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/aesv8-gcm-armv8.S" 2



# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h" 1
# 18 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/target.h" 1
# 19 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h" 2
# 41 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/generated-include/openssl/boringssl_prefix_symbols_asm.h" 1
# 42 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h" 2
# 5 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/aesv8-gcm-armv8.S" 2


# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/arm_arch.h" 1
# 8 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/aesv8-gcm-armv8.S" 2



.text
.globl _aws_lc_0_27_1_aes_gcm_enc_kernel
.private_extern _aws_lc_0_27_1_aes_gcm_enc_kernel

.align 4
_aws_lc_0_27_1_aes_gcm_enc_kernel:
# 25 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/aesv8-gcm-armv8.S"
 stp x29, x30, [sp, #-128]!
 mov x29, sp
 stp x19, x20, [sp, #16]
 mov x16, x4
 mov x8, x5
 stp x21, x22, [sp, #32]
 stp x23, x24, [sp, #48]
 stp d8, d9, [sp, #64]
 stp d10, d11, [sp, #80]
 stp d12, d13, [sp, #96]
 stp d14, d15, [sp, #112]
 ldr w17, [x8, #240]
 add x19, x8, x17, lsl #4
 ldp x13, x14, [x19]
 ldr q31, [x19, #-16]
 add x4, x0, x1, lsr #3
 lsr x5, x1, #3
 mov x15, x5
 ldp x10, x11, [x16]
 ld1 { v0.16b}, [x16]
 sub x5, x5, #1
 ldr q18, [x8, #0]
 and x5, x5, #0xffffffffffffffc0
 ldr q25, [x8, #112]
 add x5, x5, x0
 lsr x12, x11, #32
 fmov d2, x10
 orr w11, w11, w11
 rev w12, w12
 fmov d1, x10
 aese v0.16b, v18.16b
 aesmc v0.16b, v0.16b
 add w12, w12, #1
 rev w9, w12
 fmov d3, x10
 orr x9, x11, x9, lsl #32
 add w12, w12, #1
 ldr q19, [x8, #16]
 fmov v1.d[1], x9
 rev w9, w12
 add w12, w12, #1
 orr x9, x11, x9, lsl #32
 ldr q20, [x8, #32]
 fmov v2.d[1], x9
 rev w9, w12
 aese v0.16b, v19.16b
 aesmc v0.16b, v0.16b
 orr x9, x11, x9, lsl #32
 fmov v3.d[1], x9
 aese v1.16b, v18.16b
 aesmc v1.16b, v1.16b
 ldr q21, [x8, #48]
 aese v0.16b, v20.16b
 aesmc v0.16b, v0.16b
 ldr q24, [x8, #96]
 aese v2.16b, v18.16b
 aesmc v2.16b, v2.16b
 ldr q23, [x8, #80]
 aese v1.16b, v19.16b
 aesmc v1.16b, v1.16b
 ldr q14, [x6, #48]
 aese v3.16b, v18.16b
 aesmc v3.16b, v3.16b
 aese v2.16b, v19.16b
 aesmc v2.16b, v2.16b
 ldr q22, [x8, #64]
 aese v1.16b, v20.16b
 aesmc v1.16b, v1.16b
 ldr q13, [x6, #32]
 aese v3.16b, v19.16b
 aesmc v3.16b, v3.16b
 ldr q30, [x8, #192]
 aese v2.16b, v20.16b
 aesmc v2.16b, v2.16b
 ldr q15, [x6, #80]
 aese v1.16b, v21.16b
 aesmc v1.16b, v1.16b
 ldr q29, [x8, #176]
 aese v3.16b, v20.16b
 aesmc v3.16b, v3.16b
 ldr q26, [x8, #128]
 aese v2.16b, v21.16b
 aesmc v2.16b, v2.16b
 add w12, w12, #1
 aese v0.16b, v21.16b
 aesmc v0.16b, v0.16b
 aese v3.16b, v21.16b
 aesmc v3.16b, v3.16b
 ld1 { v11.16b}, [x3]
 ext v11.16b, v11.16b, v11.16b, #8
 rev64 v11.16b, v11.16b
 aese v2.16b, v22.16b
 aesmc v2.16b, v2.16b
 aese v0.16b, v22.16b
 aesmc v0.16b, v0.16b
 aese v1.16b, v22.16b
 aesmc v1.16b, v1.16b
 aese v3.16b, v22.16b
 aesmc v3.16b, v3.16b
 cmp x17, #12
 aese v0.16b, v23.16b
 aesmc v0.16b, v0.16b
 aese v1.16b, v23.16b
 aesmc v1.16b, v1.16b
 aese v3.16b, v23.16b
 aesmc v3.16b, v3.16b
 aese v2.16b, v23.16b
 aesmc v2.16b, v2.16b
 aese v1.16b, v24.16b
 aesmc v1.16b, v1.16b
 trn2 v17.2d, v14.2d, v15.2d
 aese v3.16b, v24.16b
 aesmc v3.16b, v3.16b
 ldr q27, [x8, #144]
 aese v0.16b, v24.16b
 aesmc v0.16b, v0.16b
 ldr q12, [x6]
 aese v2.16b, v24.16b
 aesmc v2.16b, v2.16b
 ldr q28, [x8, #160]
 aese v1.16b, v25.16b
 aesmc v1.16b, v1.16b
 trn1 v9.2d, v14.2d, v15.2d
 aese v0.16b, v25.16b
 aesmc v0.16b, v0.16b
 aese v2.16b, v25.16b
 aesmc v2.16b, v2.16b
 aese v3.16b, v25.16b
 aesmc v3.16b, v3.16b
 trn2 v16.2d, v12.2d, v13.2d
 aese v1.16b, v26.16b
 aesmc v1.16b, v1.16b
 aese v2.16b, v26.16b
 aesmc v2.16b, v2.16b
 aese v3.16b, v26.16b
 aesmc v3.16b, v3.16b
 aese v0.16b, v26.16b
 aesmc v0.16b, v0.16b
 b.lt Lenc_finish_first_blocks

 aese v1.16b, v27.16b
 aesmc v1.16b, v1.16b
 aese v2.16b, v27.16b
 aesmc v2.16b, v2.16b
 aese v3.16b, v27.16b
 aesmc v3.16b, v3.16b
 aese v0.16b, v27.16b
 aesmc v0.16b, v0.16b
 aese v1.16b, v28.16b
 aesmc v1.16b, v1.16b
 aese v2.16b, v28.16b
 aesmc v2.16b, v2.16b
 aese v3.16b, v28.16b
 aesmc v3.16b, v3.16b
 aese v0.16b, v28.16b
 aesmc v0.16b, v0.16b
 b.eq Lenc_finish_first_blocks

 aese v1.16b, v29.16b
 aesmc v1.16b, v1.16b
 aese v2.16b, v29.16b
 aesmc v2.16b, v2.16b
 aese v0.16b, v29.16b
 aesmc v0.16b, v0.16b
 aese v3.16b, v29.16b
 aesmc v3.16b, v3.16b
 aese v1.16b, v30.16b
 aesmc v1.16b, v1.16b
 aese v2.16b, v30.16b
 aesmc v2.16b, v2.16b
 aese v0.16b, v30.16b
 aesmc v0.16b, v0.16b
 aese v3.16b, v30.16b
 aesmc v3.16b, v3.16b

Lenc_finish_first_blocks:
 cmp x0, x5
 eor v17.16b, v17.16b, v9.16b
 aese v2.16b, v31.16b
 trn1 v8.2d, v12.2d, v13.2d
 aese v1.16b, v31.16b
 aese v0.16b, v31.16b
 aese v3.16b, v31.16b
 eor v16.16b, v16.16b, v8.16b
 b.ge Lenc_tail

 ldp x19, x20, [x0, #16]
 rev w9, w12
 ldp x6, x7, [x0, #0]
 ldp x23, x24, [x0, #48]
 ldp x21, x22, [x0, #32]
 add x0, x0, #64
 eor x19, x19, x13
 eor x20, x20, x14
 fmov d5, x19
 eor x6, x6, x13
 eor x7, x7, x14
 eor x24, x24, x14
 fmov d4, x6
 cmp x0, x5
 fmov v4.d[1], x7
 eor x23, x23, x13
 eor x21, x21, x13
 fmov v5.d[1], x20
 fmov d6, x21
 add w12, w12, #1
 orr x9, x11, x9, lsl #32
 fmov d7, x23
 eor x22, x22, x14
 fmov v6.d[1], x22
 eor v4.16b, v4.16b, v0.16b
 fmov d0, x10
 fmov v0.d[1], x9
 rev w9, w12
 add w12, w12, #1
 eor v5.16b, v5.16b, v1.16b
 fmov d1, x10
 orr x9, x11, x9, lsl #32
 fmov v1.d[1], x9
 rev w9, w12
 st1 { v4.16b}, [x2], #16
 fmov v7.d[1], x24
 orr x9, x11, x9, lsl #32
 eor v6.16b, v6.16b, v2.16b
 st1 { v5.16b}, [x2], #16
 add w12, w12, #1
 fmov d2, x10
 fmov v2.d[1], x9
 st1 { v6.16b}, [x2], #16
 rev w9, w12
 orr x9, x11, x9, lsl #32
 eor v7.16b, v7.16b, v3.16b
 st1 { v7.16b}, [x2], #16
 b.ge Lenc_prepretail

Lenc_main_loop:
 aese v0.16b, v18.16b
 aesmc v0.16b, v0.16b
 rev64 v4.16b, v4.16b
 aese v1.16b, v18.16b
 aesmc v1.16b, v1.16b
 fmov d3, x10
 aese v2.16b, v18.16b
 aesmc v2.16b, v2.16b
 ext v11.16b, v11.16b, v11.16b, #8
 aese v0.16b, v19.16b
 aesmc v0.16b, v0.16b
 fmov v3.d[1], x9
 aese v1.16b, v19.16b
 aesmc v1.16b, v1.16b
 ldp x23, x24, [x0, #48]
 aese v2.16b, v19.16b
 aesmc v2.16b, v2.16b
 ldp x21, x22, [x0, #32]
 aese v0.16b, v20.16b
 aesmc v0.16b, v0.16b
 eor v4.16b, v4.16b, v11.16b
 aese v1.16b, v20.16b
 aesmc v1.16b, v1.16b
 aese v3.16b, v18.16b
 aesmc v3.16b, v3.16b
 eor x23, x23, x13
 aese v0.16b, v21.16b
 aesmc v0.16b, v0.16b
 mov d10, v17.d[1]
 pmull2 v9.1q, v4.2d, v15.2d
 eor x22, x22, x14
 mov d8, v4.d[1]
 aese v3.16b, v19.16b
 aesmc v3.16b, v3.16b
 rev64 v5.16b, v5.16b
 aese v0.16b, v22.16b
 aesmc v0.16b, v0.16b
 pmull v11.1q, v4.1d, v15.1d
 eor v8.8b, v8.8b, v4.8b
 aese v2.16b, v20.16b
 aesmc v2.16b, v2.16b
 aese v0.16b, v23.16b
 aesmc v0.16b, v0.16b
 rev64 v7.16b, v7.16b
 pmull2 v4.1q, v5.2d, v14.2d
 pmull v10.1q, v8.1d, v10.1d
 rev64 v6.16b, v6.16b
 pmull v8.1q, v5.1d, v14.1d
 eor v9.16b, v9.16b, v4.16b
 mov d4, v5.d[1]
 aese v1.16b, v21.16b
 aesmc v1.16b, v1.16b
 aese v3.16b, v20.16b
 aesmc v3.16b, v3.16b
 eor v11.16b, v11.16b, v8.16b
 aese v2.16b, v21.16b
 aesmc v2.16b, v2.16b
 aese v1.16b, v22.16b
 aesmc v1.16b, v1.16b
 mov d8, v6.d[1]
 aese v3.16b, v21.16b
 aesmc v3.16b, v3.16b
 eor v4.8b, v4.8b, v5.8b
 aese v2.16b, v22.16b
 aesmc v2.16b, v2.16b
 aese v0.16b, v24.16b
 aesmc v0.16b, v0.16b
 eor v8.8b, v8.8b, v6.8b
 aese v3.16b, v22.16b
 aesmc v3.16b, v3.16b
 pmull v4.1q, v4.1d, v17.1d
 aese v0.16b, v25.16b
 aesmc v0.16b, v0.16b
 aese v3.16b, v23.16b
 aesmc v3.16b, v3.16b
 ins v8.d[1], v8.d[0]
 aese v1.16b, v23.16b
 aesmc v1.16b, v1.16b
 aese v0.16b, v26.16b
 aesmc v0.16b, v0.16b
 aese v2.16b, v23.16b
 aesmc v2.16b, v2.16b
 aese v1.16b, v24.16b
 aesmc v1.16b, v1.16b
 eor v10.16b, v10.16b, v4.16b
 pmull2 v4.1q, v6.2d, v13.2d
 pmull v5.1q, v6.1d, v13.1d
 aese v1.16b, v25.16b
 aesmc v1.16b, v1.16b
 pmull v6.1q, v7.1d, v12.1d
 eor v9.16b, v9.16b, v4.16b
 aese v3.16b, v24.16b
 aesmc v3.16b, v3.16b
 ldp x19, x20, [x0, #16]
 aese v1.16b, v26.16b
 aesmc v1.16b, v1.16b
 mov d4, v7.d[1]
 aese v2.16b, v24.16b
 aesmc v2.16b, v2.16b
 eor v11.16b, v11.16b, v5.16b
 pmull2 v8.1q, v8.2d, v16.2d
 pmull2 v5.1q, v7.2d, v12.2d
 eor v4.8b, v4.8b, v7.8b
 aese v2.16b, v25.16b
 aesmc v2.16b, v2.16b
 eor x19, x19, x13
 aese v2.16b, v26.16b
 aesmc v2.16b, v2.16b
 eor v10.16b, v10.16b, v8.16b
 aese v3.16b, v25.16b
 aesmc v3.16b, v3.16b
 eor x21, x21, x13
 aese v3.16b, v26.16b
 aesmc v3.16b, v3.16b
 movi v8.8b, #0xc2
 pmull v4.1q, v4.1d, v16.1d
 eor v9.16b, v9.16b, v5.16b
 cmp x17, #12
 fmov d5, x19
 ldp x6, x7, [x0, #0]
 b.lt Lenc_main_loop_continue

 aese v1.16b, v27.16b
 aesmc v1.16b, v1.16b
 aese v0.16b, v27.16b
 aesmc v0.16b, v0.16b
 aese v2.16b, v27.16b
 aesmc v2.16b, v2.16b
 aese v3.16b, v27.16b
 aesmc v3.16b, v3.16b
 aese v0.16b, v28.16b
 aesmc v0.16b, v0.16b
 aese v1.16b, v28.16b
 aesmc v1.16b, v1.16b
 aese v2.16b, v28.16b
 aesmc v2.16b, v2.16b
 aese v3.16b, v28.16b
 aesmc v3.16b, v3.16b
 b.eq Lenc_main_loop_continue

 aese v0.16b, v29.16b
 aesmc v0.16b, v0.16b
 aese v1.16b, v29.16b
 aesmc v1.16b, v1.16b
 aese v2.16b, v29.16b
 aesmc v2.16b, v2.16b
 aese v3.16b, v29.16b
 aesmc v3.16b, v3.16b
 aese v1.16b, v30.16b
 aesmc v1.16b, v1.16b
 aese v0.16b, v30.16b
 aesmc v0.16b, v0.16b
 aese v2.16b, v30.16b
 aesmc v2.16b, v2.16b
 aese v3.16b, v30.16b
 aesmc v3.16b, v3.16b

Lenc_main_loop_continue:
 shl d8, d8, #56
 eor v11.16b, v11.16b, v6.16b
 eor v10.16b, v10.16b, v4.16b
 add w12, w12, #1
 eor v4.16b, v11.16b, v9.16b
 add x0, x0, #64
 pmull v7.1q, v9.1d, v8.1d
 rev w9, w12
 ext v9.16b, v9.16b, v9.16b, #8
 eor x6, x6, x13
 eor v10.16b, v10.16b, v4.16b
 eor x7, x7, x14
 fmov d4, x6
 orr x9, x11, x9, lsl #32
 eor v7.16b, v9.16b, v7.16b
 eor x20, x20, x14
 eor x24, x24, x14
 add w12, w12, #1
 aese v0.16b, v31.16b
 fmov v4.d[1], x7
 eor v10.16b, v10.16b, v7.16b
 fmov d7, x23
 aese v1.16b, v31.16b
 fmov v5.d[1], x20
 fmov d6, x21
 cmp x0, x5
 fmov v6.d[1], x22
 pmull v9.1q, v10.1d, v8.1d
 eor v4.16b, v4.16b, v0.16b
 fmov d0, x10
 fmov v0.d[1], x9
 rev w9, w12
 add w12, w12, #1
 eor v5.16b, v5.16b, v1.16b
 fmov d1, x10
 orr x9, x11, x9, lsl #32
 fmov v1.d[1], x9
 aese v2.16b, v31.16b
 rev w9, w12
 st1 { v4.16b}, [x2], #16
 orr x9, x11, x9, lsl #32
 eor v11.16b, v11.16b, v9.16b
 fmov v7.d[1], x24
 ext v10.16b, v10.16b, v10.16b, #8
 st1 { v5.16b}, [x2], #16
 add w12, w12, #1
 aese v3.16b, v31.16b
 eor v6.16b, v6.16b, v2.16b
 fmov d2, x10
 st1 { v6.16b}, [x2], #16
 fmov v2.d[1], x9
 rev w9, w12
 eor v11.16b, v11.16b, v10.16b
 orr x9, x11, x9, lsl #32
 eor v7.16b, v7.16b, v3.16b
 st1 { v7.16b}, [x2], #16
 b.lt Lenc_main_loop

Lenc_prepretail:
 aese v1.16b, v18.16b
 aesmc v1.16b, v1.16b
 rev64 v6.16b, v6.16b
 aese v2.16b, v18.16b
 aesmc v2.16b, v2.16b
 fmov d3, x10
 aese v0.16b, v18.16b
 aesmc v0.16b, v0.16b
 rev64 v4.16b, v4.16b
 fmov v3.d[1], x9
 ext v11.16b, v11.16b, v11.16b, #8
 aese v2.16b, v19.16b
 aesmc v2.16b, v2.16b
 aese v0.16b, v19.16b
 aesmc v0.16b, v0.16b
 eor v4.16b, v4.16b, v11.16b
 rev64 v5.16b, v5.16b
 aese v2.16b, v20.16b
 aesmc v2.16b, v2.16b
 aese v3.16b, v18.16b
 aesmc v3.16b, v3.16b
 mov d10, v17.d[1]
 aese v1.16b, v19.16b
 aesmc v1.16b, v1.16b
 pmull v11.1q, v4.1d, v15.1d
 mov d8, v4.d[1]
 pmull2 v9.1q, v4.2d, v15.2d
 aese v2.16b, v21.16b
 aesmc v2.16b, v2.16b
 aese v1.16b, v20.16b
 aesmc v1.16b, v1.16b
 eor v8.8b, v8.8b, v4.8b
 aese v0.16b, v20.16b
 aesmc v0.16b, v0.16b
 aese v3.16b, v19.16b
 aesmc v3.16b, v3.16b
 aese v1.16b, v21.16b
 aesmc v1.16b, v1.16b
 pmull v10.1q, v8.1d, v10.1d
 pmull2 v4.1q, v5.2d, v14.2d
 pmull v8.1q, v5.1d, v14.1d
 aese v3.16b, v20.16b
 aesmc v3.16b, v3.16b
 eor v9.16b, v9.16b, v4.16b
 mov d4, v5.d[1]
 aese v0.16b, v21.16b
 aesmc v0.16b, v0.16b
 eor v11.16b, v11.16b, v8.16b
 aese v3.16b, v21.16b
 aesmc v3.16b, v3.16b
 eor v4.8b, v4.8b, v5.8b
 mov d8, v6.d[1]
 aese v0.16b, v22.16b
 aesmc v0.16b, v0.16b
 rev64 v7.16b, v7.16b
 aese v3.16b, v22.16b
 aesmc v3.16b, v3.16b
 pmull v4.1q, v4.1d, v17.1d
 eor v8.8b, v8.8b, v6.8b
 add w12, w12, #1
 pmull v5.1q, v6.1d, v13.1d
 aese v3.16b, v23.16b
 aesmc v3.16b, v3.16b
 aese v2.16b, v22.16b
 aesmc v2.16b, v2.16b
 eor v10.16b, v10.16b, v4.16b
 pmull2 v4.1q, v6.2d, v13.2d
 eor v11.16b, v11.16b, v5.16b
 ins v8.d[1], v8.d[0]
 aese v2.16b, v23.16b
 aesmc v2.16b, v2.16b
 eor v9.16b, v9.16b, v4.16b
 mov d4, v7.d[1]
 aese v1.16b, v22.16b
 aesmc v1.16b, v1.16b
 pmull2 v8.1q, v8.2d, v16.2d
 eor v4.8b, v4.8b, v7.8b
 pmull2 v5.1q, v7.2d, v12.2d
 aese v1.16b, v23.16b
 aesmc v1.16b, v1.16b
 pmull v4.1q, v4.1d, v16.1d
 eor v10.16b, v10.16b, v8.16b
 aese v0.16b, v23.16b
 aesmc v0.16b, v0.16b
 aese v1.16b, v24.16b
 aesmc v1.16b, v1.16b
 aese v2.16b, v24.16b
 aesmc v2.16b, v2.16b
 aese v0.16b, v24.16b
 aesmc v0.16b, v0.16b
 movi v8.8b, #0xc2
 aese v3.16b, v24.16b
 aesmc v3.16b, v3.16b
 aese v1.16b, v25.16b
 aesmc v1.16b, v1.16b
 eor v9.16b, v9.16b, v5.16b
 aese v0.16b, v25.16b
 aesmc v0.16b, v0.16b
 aese v3.16b, v25.16b
 aesmc v3.16b, v3.16b
 shl d8, d8, #56
 aese v1.16b, v26.16b
 aesmc v1.16b, v1.16b
 eor v10.16b, v10.16b, v4.16b
 pmull v6.1q, v7.1d, v12.1d
 aese v3.16b, v26.16b
 aesmc v3.16b, v3.16b
 cmp x17, #12
 aese v0.16b, v26.16b
 aesmc v0.16b, v0.16b
 eor v11.16b, v11.16b, v6.16b
 aese v2.16b, v25.16b
 aesmc v2.16b, v2.16b
 eor v10.16b, v10.16b, v9.16b
 aese v2.16b, v26.16b
 aesmc v2.16b, v2.16b
 pmull v4.1q, v9.1d, v8.1d
 ext v9.16b, v9.16b, v9.16b, #8
 eor v10.16b, v10.16b, v11.16b
 b.lt Lenc_finish_prepretail

 aese v1.16b, v27.16b
 aesmc v1.16b, v1.16b
 aese v3.16b, v27.16b
 aesmc v3.16b, v3.16b
 aese v0.16b, v27.16b
 aesmc v0.16b, v0.16b
 aese v2.16b, v27.16b
 aesmc v2.16b, v2.16b
 aese v3.16b, v28.16b
 aesmc v3.16b, v3.16b
 aese v1.16b, v28.16b
 aesmc v1.16b, v1.16b
 aese v0.16b, v28.16b
 aesmc v0.16b, v0.16b
 aese v2.16b, v28.16b
 aesmc v2.16b, v2.16b
 b.eq Lenc_finish_prepretail

 aese v1.16b, v29.16b
 aesmc v1.16b, v1.16b
 aese v0.16b, v29.16b
 aesmc v0.16b, v0.16b
 aese v3.16b, v29.16b
 aesmc v3.16b, v3.16b
 aese v2.16b, v29.16b
 aesmc v2.16b, v2.16b
 aese v1.16b, v30.16b
 aesmc v1.16b, v1.16b
 aese v0.16b, v30.16b
 aesmc v0.16b, v0.16b
 aese v3.16b, v30.16b
 aesmc v3.16b, v3.16b
 aese v2.16b, v30.16b
 aesmc v2.16b, v2.16b

Lenc_finish_prepretail:
 eor v10.16b, v10.16b, v4.16b
 eor v10.16b, v10.16b, v9.16b
 pmull v4.1q, v10.1d, v8.1d
 ext v10.16b, v10.16b, v10.16b, #8
 aese v1.16b, v31.16b
 eor v11.16b, v11.16b, v4.16b
 aese v3.16b, v31.16b
 aese v0.16b, v31.16b
 aese v2.16b, v31.16b
 eor v11.16b, v11.16b, v10.16b

Lenc_tail:
 ext v8.16b, v11.16b, v11.16b, #8
 sub x5, x4, x0
 ldp x6, x7, [x0], #16
 eor x6, x6, x13
 eor x7, x7, x14
 cmp x5, #48
 fmov d4, x6
 fmov v4.d[1], x7
 eor v5.16b, v4.16b, v0.16b
 b.gt Lenc_blocks_4_remaining
 cmp x5, #32
 mov v3.16b, v2.16b
 movi v11.8b, #0
 movi v9.8b, #0
 sub w12, w12, #1
 mov v2.16b, v1.16b
 movi v10.8b, #0
 b.gt Lenc_blocks_3_remaining
 mov v3.16b, v1.16b
 sub w12, w12, #1
 cmp x5, #16
 b.gt Lenc_blocks_2_remaining
 sub w12, w12, #1
 b Lenc_blocks_1_remaining
Lenc_blocks_4_remaining:
 st1 { v5.16b}, [x2], #16
 ldp x6, x7, [x0], #16
 rev64 v4.16b, v5.16b
 eor x6, x6, x13
 eor v4.16b, v4.16b, v8.16b
 eor x7, x7, x14
 mov d22, v4.d[1]
 fmov d5, x6
 fmov v5.d[1], x7
 eor v22.8b, v22.8b, v4.8b
 movi v8.8b, #0
 mov d10, v17.d[1]
 pmull v11.1q, v4.1d, v15.1d
 pmull2 v9.1q, v4.2d, v15.2d
 pmull v10.1q, v22.1d, v10.1d
 eor v5.16b, v5.16b, v1.16b
Lenc_blocks_3_remaining:
 st1 { v5.16b}, [x2], #16
 ldp x6, x7, [x0], #16
 rev64 v4.16b, v5.16b
 eor x6, x6, x13
 eor v4.16b, v4.16b, v8.16b
 fmov d5, x6
 eor x7, x7, x14
 fmov v5.d[1], x7
 movi v8.8b, #0
 pmull2 v20.1q, v4.2d, v14.2d
 mov d22, v4.d[1]
 pmull v21.1q, v4.1d, v14.1d
 eor v22.8b, v22.8b, v4.8b
 eor v5.16b, v5.16b, v2.16b
 eor v9.16b, v9.16b, v20.16b
 pmull v22.1q, v22.1d, v17.1d
 eor v11.16b, v11.16b, v21.16b
 eor v10.16b, v10.16b, v22.16b
Lenc_blocks_2_remaining:
 st1 { v5.16b}, [x2], #16
 rev64 v4.16b, v5.16b
 ldp x6, x7, [x0], #16
 eor v4.16b, v4.16b, v8.16b
 movi v8.8b, #0
 eor x6, x6, x13
 mov d22, v4.d[1]
 pmull2 v20.1q, v4.2d, v13.2d
 eor x7, x7, x14
 eor v22.8b, v22.8b, v4.8b
 eor v9.16b, v9.16b, v20.16b
 ins v22.d[1], v22.d[0]
 fmov d5, x6
 fmov v5.d[1], x7
 pmull2 v22.1q, v22.2d, v16.2d
 pmull v21.1q, v4.1d, v13.1d
 eor v5.16b, v5.16b, v3.16b
 eor v10.16b, v10.16b, v22.16b
 eor v11.16b, v11.16b, v21.16b
Lenc_blocks_1_remaining:
 rev64 v4.16b, v5.16b
 eor v4.16b, v4.16b, v8.16b
 pmull2 v20.1q, v4.2d, v12.2d
 mov d8, v4.d[1]
 rev w9, w12
 pmull v21.1q, v4.1d, v12.1d
 eor v9.16b, v9.16b, v20.16b
 eor v8.8b, v8.8b, v4.8b
 pmull v8.1q, v8.1d, v16.1d
 eor v11.16b, v11.16b, v21.16b
 eor v10.16b, v10.16b, v8.16b
 movi v8.8b, #0xc2
 eor v4.16b, v11.16b, v9.16b
 shl d8, d8, #56
 eor v10.16b, v10.16b, v4.16b
 pmull v7.1q, v9.1d, v8.1d
 ext v9.16b, v9.16b, v9.16b, #8
 eor v10.16b, v10.16b, v7.16b
 eor v10.16b, v10.16b, v9.16b
 pmull v9.1q, v10.1d, v8.1d
 ext v10.16b, v10.16b, v10.16b, #8
 str w9, [x16, #12]
 st1 { v5.16b}, [x2]
 eor v11.16b, v11.16b, v9.16b
 eor v11.16b, v11.16b, v10.16b
 ext v11.16b, v11.16b, v11.16b, #8
 rev64 v11.16b, v11.16b
 mov x0, x15
 st1 { v11.16b }, [x3]
 ldp x19, x20, [sp, #16]
 ldp x21, x22, [sp, #32]
 ldp x23, x24, [sp, #48]
 ldp d8, d9, [sp, #64]
 ldp d10, d11, [sp, #80]
 ldp d12, d13, [sp, #96]
 ldp d14, d15, [sp, #112]
 ldp x29, x30, [sp], #128

 ret

.globl _aws_lc_0_27_1_aes_gcm_dec_kernel
.private_extern _aws_lc_0_27_1_aes_gcm_dec_kernel

.align 4
_aws_lc_0_27_1_aes_gcm_dec_kernel:

 stp x29, x30, [sp, #-128]!
 mov x29, sp
 stp x19, x20, [sp, #16]
 mov x16, x4
 mov x8, x5
 stp x21, x22, [sp, #32]
 stp x23, x24, [sp, #48]
 stp d8, d9, [sp, #64]
 stp d10, d11, [sp, #80]
 stp d12, d13, [sp, #96]
 stp d14, d15, [sp, #112]
 ldr w17, [x8, #240]
 add x19, x8, x17, lsl #4
 ldp x13, x14, [x19]
 ldr q31, [x19, #-16]
 lsr x5, x1, #3
 mov x15, x5
 ldp x10, x11, [x16]
 ldr q26, [x8, #128]
 sub x5, x5, #1
 ldr q25, [x8, #112]
 and x5, x5, #0xffffffffffffffc0
 add x4, x0, x1, lsr #3
 ldr q24, [x8, #96]
 lsr x12, x11, #32
 ldr q23, [x8, #80]
 orr w11, w11, w11
 ldr q21, [x8, #48]
 add x5, x5, x0
 rev w12, w12
 add w12, w12, #1
 fmov d3, x10
 rev w9, w12
 add w12, w12, #1
 fmov d1, x10
 orr x9, x11, x9, lsl #32
 ld1 { v0.16b}, [x16]
 fmov v1.d[1], x9
 rev w9, w12
 add w12, w12, #1
 fmov d2, x10
 orr x9, x11, x9, lsl #32
 fmov v2.d[1], x9
 rev w9, w12
 orr x9, x11, x9, lsl #32
 ldr q18, [x8, #0]
 fmov v3.d[1], x9
 add w12, w12, #1
 ldr q22, [x8, #64]
 ldr q19, [x8, #16]
 aese v0.16b, v18.16b
 aesmc v0.16b, v0.16b
 ldr q14, [x6, #48]
 aese v3.16b, v18.16b
 aesmc v3.16b, v3.16b
 ldr q15, [x6, #80]
 aese v1.16b, v18.16b
 aesmc v1.16b, v1.16b
 ldr q13, [x6, #32]
 aese v2.16b, v18.16b
 aesmc v2.16b, v2.16b
 ldr q20, [x8, #32]
 aese v0.16b, v19.16b
 aesmc v0.16b, v0.16b
 aese v1.16b, v19.16b
 aesmc v1.16b, v1.16b
 ld1 { v11.16b}, [x3]
 ext v11.16b, v11.16b, v11.16b, #8
 rev64 v11.16b, v11.16b
 aese v2.16b, v19.16b
 aesmc v2.16b, v2.16b
 ldr q27, [x8, #144]
 aese v3.16b, v19.16b
 aesmc v3.16b, v3.16b
 ldr q30, [x8, #192]
 aese v0.16b, v20.16b
 aesmc v0.16b, v0.16b
 ldr q12, [x6]
 aese v2.16b, v20.16b
 aesmc v2.16b, v2.16b
 ldr q28, [x8, #160]
 aese v3.16b, v20.16b
 aesmc v3.16b, v3.16b
 aese v0.16b, v21.16b
 aesmc v0.16b, v0.16b
 aese v1.16b, v20.16b
 aesmc v1.16b, v1.16b
 aese v3.16b, v21.16b
 aesmc v3.16b, v3.16b
 aese v0.16b, v22.16b
 aesmc v0.16b, v0.16b
 aese v2.16b, v21.16b
 aesmc v2.16b, v2.16b
 aese v1.16b, v21.16b
 aesmc v1.16b, v1.16b
 aese v3.16b, v22.16b
 aesmc v3.16b, v3.16b
 aese v2.16b, v22.16b
 aesmc v2.16b, v2.16b
 aese v1.16b, v22.16b
 aesmc v1.16b, v1.16b
 aese v3.16b, v23.16b
 aesmc v3.16b, v3.16b
 aese v0.16b, v23.16b
 aesmc v0.16b, v0.16b
 aese v1.16b, v23.16b
 aesmc v1.16b, v1.16b
 aese v2.16b, v23.16b
 aesmc v2.16b, v2.16b
 aese v0.16b, v24.16b
 aesmc v0.16b, v0.16b
 aese v3.16b, v24.16b
 aesmc v3.16b, v3.16b
 cmp x17, #12
 aese v1.16b, v24.16b
 aesmc v1.16b, v1.16b
 aese v2.16b, v24.16b
 aesmc v2.16b, v2.16b
 aese v0.16b, v25.16b
 aesmc v0.16b, v0.16b
 aese v1.16b, v25.16b
 aesmc v1.16b, v1.16b
 aese v3.16b, v25.16b
 aesmc v3.16b, v3.16b
 aese v0.16b, v26.16b
 aesmc v0.16b, v0.16b
 aese v2.16b, v25.16b
 aesmc v2.16b, v2.16b
 aese v3.16b, v26.16b
 aesmc v3.16b, v3.16b
 aese v1.16b, v26.16b
 aesmc v1.16b, v1.16b
 ldr q29, [x8, #176]
 aese v2.16b, v26.16b
 aesmc v2.16b, v2.16b
 b.lt Ldec_finish_first_blocks

 aese v0.16b, v27.16b
 aesmc v0.16b, v0.16b
 aese v1.16b, v27.16b
 aesmc v1.16b, v1.16b
 aese v3.16b, v27.16b
 aesmc v3.16b, v3.16b
 aese v2.16b, v27.16b
 aesmc v2.16b, v2.16b
 aese v0.16b, v28.16b
 aesmc v0.16b, v0.16b
 aese v1.16b, v28.16b
 aesmc v1.16b, v1.16b
 aese v3.16b, v28.16b
 aesmc v3.16b, v3.16b
 aese v2.16b, v28.16b
 aesmc v2.16b, v2.16b
 b.eq Ldec_finish_first_blocks

 aese v0.16b, v29.16b
 aesmc v0.16b, v0.16b
 aese v3.16b, v29.16b
 aesmc v3.16b, v3.16b
 aese v1.16b, v29.16b
 aesmc v1.16b, v1.16b
 aese v2.16b, v29.16b
 aesmc v2.16b, v2.16b
 aese v1.16b, v30.16b
 aesmc v1.16b, v1.16b
 aese v0.16b, v30.16b
 aesmc v0.16b, v0.16b
 aese v2.16b, v30.16b
 aesmc v2.16b, v2.16b
 aese v3.16b, v30.16b
 aesmc v3.16b, v3.16b

Ldec_finish_first_blocks:
 cmp x0, x5
 trn1 v9.2d, v14.2d, v15.2d
 trn2 v17.2d, v14.2d, v15.2d
 trn1 v8.2d, v12.2d, v13.2d
 trn2 v16.2d, v12.2d, v13.2d
 eor v17.16b, v17.16b, v9.16b
 aese v1.16b, v31.16b
 aese v2.16b, v31.16b
 eor v16.16b, v16.16b, v8.16b
 aese v3.16b, v31.16b
 aese v0.16b, v31.16b
 b.ge Ldec_tail

 ldr q4, [x0, #0]
 ldr q5, [x0, #16]
 rev w9, w12
 eor v0.16b, v4.16b, v0.16b
 eor v1.16b, v5.16b, v1.16b
 rev64 v5.16b, v5.16b
 ldr q7, [x0, #48]
 mov x7, v0.d[1]
 mov x6, v0.d[0]
 rev64 v4.16b, v4.16b
 add w12, w12, #1
 fmov d0, x10
 orr x9, x11, x9, lsl #32
 fmov v0.d[1], x9
 rev w9, w12
 add w12, w12, #1
 mov x19, v1.d[0]
 orr x9, x11, x9, lsl #32
 mov x20, v1.d[1]
 eor x7, x7, x14
 eor x6, x6, x13
 stp x6, x7, [x2], #16
 fmov d1, x10
 ldr q6, [x0, #32]
 add x0, x0, #64
 fmov v1.d[1], x9
 rev w9, w12
 add w12, w12, #1
 eor x19, x19, x13
 orr x9, x11, x9, lsl #32
 eor x20, x20, x14
 stp x19, x20, [x2], #16
 eor v2.16b, v6.16b, v2.16b
 cmp x0, x5
 b.ge Ldec_prepretail

Ldec_main_loop:
 mov x21, v2.d[0]
 ext v11.16b, v11.16b, v11.16b, #8
 eor v3.16b, v7.16b, v3.16b
 aese v0.16b, v18.16b
 aesmc v0.16b, v0.16b
 mov x22, v2.d[1]
 aese v1.16b, v18.16b
 aesmc v1.16b, v1.16b
 fmov d2, x10
 fmov v2.d[1], x9
 eor v4.16b, v4.16b, v11.16b
 rev w9, w12
 aese v0.16b, v19.16b
 aesmc v0.16b, v0.16b
 mov x24, v3.d[1]
 aese v1.16b, v19.16b
 aesmc v1.16b, v1.16b
 mov x23, v3.d[0]
 pmull2 v9.1q, v4.2d, v15.2d
 mov d8, v4.d[1]
 fmov d3, x10
 aese v0.16b, v20.16b
 aesmc v0.16b, v0.16b
 orr x9, x11, x9, lsl #32
 aese v2.16b, v18.16b
 aesmc v2.16b, v2.16b
 fmov v3.d[1], x9
 aese v1.16b, v20.16b
 aesmc v1.16b, v1.16b
 eor v8.8b, v8.8b, v4.8b
 aese v0.16b, v21.16b
 aesmc v0.16b, v0.16b
 eor x22, x22, x14
 aese v2.16b, v19.16b
 aesmc v2.16b, v2.16b
 mov d10, v17.d[1]
 aese v1.16b, v21.16b
 aesmc v1.16b, v1.16b
 rev64 v6.16b, v6.16b
 aese v3.16b, v18.16b
 aesmc v3.16b, v3.16b
 eor x21, x21, x13
 aese v2.16b, v20.16b
 aesmc v2.16b, v2.16b
 stp x21, x22, [x2], #16
 pmull v11.1q, v4.1d, v15.1d
 pmull2 v4.1q, v5.2d, v14.2d
 aese v2.16b, v21.16b
 aesmc v2.16b, v2.16b
 rev64 v7.16b, v7.16b
 pmull v10.1q, v8.1d, v10.1d
 eor x23, x23, x13
 pmull v8.1q, v5.1d, v14.1d
 eor x24, x24, x14
 eor v9.16b, v9.16b, v4.16b
 aese v2.16b, v22.16b
 aesmc v2.16b, v2.16b
 aese v3.16b, v19.16b
 aesmc v3.16b, v3.16b
 mov d4, v5.d[1]
 aese v0.16b, v22.16b
 aesmc v0.16b, v0.16b
 eor v11.16b, v11.16b, v8.16b
 aese v2.16b, v23.16b
 aesmc v2.16b, v2.16b
 add w12, w12, #1
 aese v3.16b, v20.16b
 aesmc v3.16b, v3.16b
 mov d8, v6.d[1]
 aese v1.16b, v22.16b
 aesmc v1.16b, v1.16b
 eor v4.8b, v4.8b, v5.8b
 pmull v5.1q, v6.1d, v13.1d
 aese v3.16b, v21.16b
 aesmc v3.16b, v3.16b
 eor v8.8b, v8.8b, v6.8b
 aese v1.16b, v23.16b
 aesmc v1.16b, v1.16b
 aese v0.16b, v23.16b
 aesmc v0.16b, v0.16b
 eor v11.16b, v11.16b, v5.16b
 pmull v4.1q, v4.1d, v17.1d
 rev w9, w12
 aese v1.16b, v24.16b
 aesmc v1.16b, v1.16b
 ins v8.d[1], v8.d[0]
 aese v0.16b, v24.16b
 aesmc v0.16b, v0.16b
 add w12, w12, #1
 aese v3.16b, v22.16b
 aesmc v3.16b, v3.16b
 aese v1.16b, v25.16b
 aesmc v1.16b, v1.16b
 eor v10.16b, v10.16b, v4.16b
 aese v0.16b, v25.16b
 aesmc v0.16b, v0.16b
 pmull2 v4.1q, v6.2d, v13.2d
 mov d6, v7.d[1]
 aese v3.16b, v23.16b
 aesmc v3.16b, v3.16b
 pmull2 v8.1q, v8.2d, v16.2d
 aese v0.16b, v26.16b
 aesmc v0.16b, v0.16b
 eor v9.16b, v9.16b, v4.16b
 aese v3.16b, v24.16b
 aesmc v3.16b, v3.16b
 pmull v4.1q, v7.1d, v12.1d
 orr x9, x11, x9, lsl #32
 eor v10.16b, v10.16b, v8.16b
 pmull2 v5.1q, v7.2d, v12.2d
 cmp x17, #12
 eor v6.8b, v6.8b, v7.8b
 aese v1.16b, v26.16b
 aesmc v1.16b, v1.16b
 aese v2.16b, v24.16b
 aesmc v2.16b, v2.16b
 eor v9.16b, v9.16b, v5.16b
 pmull v6.1q, v6.1d, v16.1d
 movi v8.8b, #0xc2
 aese v2.16b, v25.16b
 aesmc v2.16b, v2.16b
 eor v11.16b, v11.16b, v4.16b
 aese v3.16b, v25.16b
 aesmc v3.16b, v3.16b
 shl d8, d8, #56
 aese v2.16b, v26.16b
 aesmc v2.16b, v2.16b
 eor v10.16b, v10.16b, v6.16b
 aese v3.16b, v26.16b
 aesmc v3.16b, v3.16b
 b.lt Ldec_main_loop_continue

 aese v0.16b, v27.16b
 aesmc v0.16b, v0.16b
 aese v2.16b, v27.16b
 aesmc v2.16b, v2.16b
 aese v1.16b, v27.16b
 aesmc v1.16b, v1.16b
 aese v3.16b, v27.16b
 aesmc v3.16b, v3.16b
 aese v0.16b, v28.16b
 aesmc v0.16b, v0.16b
 aese v1.16b, v28.16b
 aesmc v1.16b, v1.16b
 aese v2.16b, v28.16b
 aesmc v2.16b, v2.16b
 aese v3.16b, v28.16b
 aesmc v3.16b, v3.16b
 b.eq Ldec_main_loop_continue

 aese v0.16b, v29.16b
 aesmc v0.16b, v0.16b
 aese v1.16b, v29.16b
 aesmc v1.16b, v1.16b
 aese v2.16b, v29.16b
 aesmc v2.16b, v2.16b
 aese v3.16b, v29.16b
 aesmc v3.16b, v3.16b
 aese v0.16b, v30.16b
 aesmc v0.16b, v0.16b
 aese v1.16b, v30.16b
 aesmc v1.16b, v1.16b
 aese v2.16b, v30.16b
 aesmc v2.16b, v2.16b
 aese v3.16b, v30.16b
 aesmc v3.16b, v3.16b

Ldec_main_loop_continue:
 pmull v7.1q, v9.1d, v8.1d
 eor v6.16b, v11.16b, v9.16b
 ldr q4, [x0, #0]
 aese v0.16b, v31.16b
 ext v9.16b, v9.16b, v9.16b, #8
 eor v10.16b, v10.16b, v6.16b
 ldr q5, [x0, #16]
 eor v0.16b, v4.16b, v0.16b
 stp x23, x24, [x2], #16
 eor v10.16b, v10.16b, v7.16b
 ldr q7, [x0, #48]
 ldr q6, [x0, #32]
 mov x7, v0.d[1]
 eor v10.16b, v10.16b, v9.16b
 aese v1.16b, v31.16b
 add x0, x0, #64
 mov x6, v0.d[0]
 fmov d0, x10
 fmov v0.d[1], x9
 pmull v8.1q, v10.1d, v8.1d
 eor v1.16b, v5.16b, v1.16b
 rev w9, w12
 aese v2.16b, v31.16b
 orr x9, x11, x9, lsl #32
 cmp x0, x5
 add w12, w12, #1
 eor x6, x6, x13
 eor x7, x7, x14
 mov x20, v1.d[1]
 eor v2.16b, v6.16b, v2.16b
 eor v11.16b, v11.16b, v8.16b
 mov x19, v1.d[0]
 fmov d1, x10
 ext v10.16b, v10.16b, v10.16b, #8
 fmov v1.d[1], x9
 rev w9, w12
 add w12, w12, #1
 aese v3.16b, v31.16b
 orr x9, x11, x9, lsl #32
 rev64 v5.16b, v5.16b
 eor x20, x20, x14
 stp x6, x7, [x2], #16
 eor x19, x19, x13
 stp x19, x20, [x2], #16
 rev64 v4.16b, v4.16b
 eor v11.16b, v11.16b, v10.16b
 b.lt Ldec_main_loop

Ldec_prepretail:
 ext v11.16b, v11.16b, v11.16b, #8
 mov x21, v2.d[0]
 eor v3.16b, v7.16b, v3.16b
 aese v0.16b, v18.16b
 aesmc v0.16b, v0.16b
 mov x22, v2.d[1]
 aese v1.16b, v18.16b
 aesmc v1.16b, v1.16b
 fmov d2, x10
 fmov v2.d[1], x9
 rev w9, w12
 eor v4.16b, v4.16b, v11.16b
 rev64 v6.16b, v6.16b
 orr x9, x11, x9, lsl #32
 mov x23, v3.d[0]
 aese v1.16b, v19.16b
 aesmc v1.16b, v1.16b
 mov x24, v3.d[1]
 pmull v11.1q, v4.1d, v15.1d
 mov d8, v4.d[1]
 fmov d3, x10
 pmull2 v9.1q, v4.2d, v15.2d
 fmov v3.d[1], x9
 aese v2.16b, v18.16b
 aesmc v2.16b, v2.16b
 mov d10, v17.d[1]
 aese v0.16b, v19.16b
 aesmc v0.16b, v0.16b
 eor v8.8b, v8.8b, v4.8b
 pmull2 v4.1q, v5.2d, v14.2d
 aese v2.16b, v19.16b
 aesmc v2.16b, v2.16b
 rev64 v7.16b, v7.16b
 aese v3.16b, v18.16b
 aesmc v3.16b, v3.16b
 pmull v10.1q, v8.1d, v10.1d
 eor v9.16b, v9.16b, v4.16b
 pmull v8.1q, v5.1d, v14.1d
 aese v3.16b, v19.16b
 aesmc v3.16b, v3.16b
 mov d4, v5.d[1]
 aese v0.16b, v20.16b
 aesmc v0.16b, v0.16b
 aese v1.16b, v20.16b
 aesmc v1.16b, v1.16b
 eor v11.16b, v11.16b, v8.16b
 aese v2.16b, v20.16b
 aesmc v2.16b, v2.16b
 aese v0.16b, v21.16b
 aesmc v0.16b, v0.16b
 mov d8, v6.d[1]
 aese v3.16b, v20.16b
 aesmc v3.16b, v3.16b
 eor v4.8b, v4.8b, v5.8b
 pmull v5.1q, v6.1d, v13.1d
 aese v0.16b, v22.16b
 aesmc v0.16b, v0.16b
 aese v3.16b, v21.16b
 aesmc v3.16b, v3.16b
 eor v8.8b, v8.8b, v6.8b
 pmull v4.1q, v4.1d, v17.1d
 aese v0.16b, v23.16b
 aesmc v0.16b, v0.16b
 eor v11.16b, v11.16b, v5.16b
 aese v3.16b, v22.16b
 aesmc v3.16b, v3.16b
 pmull2 v5.1q, v7.2d, v12.2d
 eor v10.16b, v10.16b, v4.16b
 pmull2 v4.1q, v6.2d, v13.2d
 aese v3.16b, v23.16b
 aesmc v3.16b, v3.16b
 ins v8.d[1], v8.d[0]
 aese v2.16b, v21.16b
 aesmc v2.16b, v2.16b
 aese v1.16b, v21.16b
 aesmc v1.16b, v1.16b
 eor v9.16b, v9.16b, v4.16b
 pmull v4.1q, v7.1d, v12.1d
 aese v2.16b, v22.16b
 aesmc v2.16b, v2.16b
 mov d6, v7.d[1]
 aese v1.16b, v22.16b
 aesmc v1.16b, v1.16b
 pmull2 v8.1q, v8.2d, v16.2d
 aese v2.16b, v23.16b
 aesmc v2.16b, v2.16b
 eor v6.8b, v6.8b, v7.8b
 aese v1.16b, v23.16b
 aesmc v1.16b, v1.16b
 aese v3.16b, v24.16b
 aesmc v3.16b, v3.16b
 eor v10.16b, v10.16b, v8.16b
 aese v2.16b, v24.16b
 aesmc v2.16b, v2.16b
 aese v0.16b, v24.16b
 aesmc v0.16b, v0.16b
 movi v8.8b, #0xc2
 aese v1.16b, v24.16b
 aesmc v1.16b, v1.16b
 eor v11.16b, v11.16b, v4.16b
 pmull v6.1q, v6.1d, v16.1d
 aese v3.16b, v25.16b
 aesmc v3.16b, v3.16b
 cmp x17, #12
 eor v9.16b, v9.16b, v5.16b
 aese v1.16b, v25.16b
 aesmc v1.16b, v1.16b
 aese v0.16b, v25.16b
 aesmc v0.16b, v0.16b
 eor v10.16b, v10.16b, v6.16b
 aese v3.16b, v26.16b
 aesmc v3.16b, v3.16b
 aese v2.16b, v25.16b
 aesmc v2.16b, v2.16b
 eor v6.16b, v11.16b, v9.16b
 aese v1.16b, v26.16b
 aesmc v1.16b, v1.16b
 aese v0.16b, v26.16b
 aesmc v0.16b, v0.16b
 shl d8, d8, #56
 aese v2.16b, v26.16b
 aesmc v2.16b, v2.16b
 b.lt Ldec_finish_prepretail

 aese v1.16b, v27.16b
 aesmc v1.16b, v1.16b
 aese v2.16b, v27.16b
 aesmc v2.16b, v2.16b
 aese v3.16b, v27.16b
 aesmc v3.16b, v3.16b
 aese v0.16b, v27.16b
 aesmc v0.16b, v0.16b
 aese v2.16b, v28.16b
 aesmc v2.16b, v2.16b
 aese v3.16b, v28.16b
 aesmc v3.16b, v3.16b
 aese v0.16b, v28.16b
 aesmc v0.16b, v0.16b
 aese v1.16b, v28.16b
 aesmc v1.16b, v1.16b
 b.eq Ldec_finish_prepretail

 aese v2.16b, v29.16b
 aesmc v2.16b, v2.16b
 aese v0.16b, v29.16b
 aesmc v0.16b, v0.16b
 aese v1.16b, v29.16b
 aesmc v1.16b, v1.16b
 aese v2.16b, v30.16b
 aesmc v2.16b, v2.16b
 aese v3.16b, v29.16b
 aesmc v3.16b, v3.16b
 aese v1.16b, v30.16b
 aesmc v1.16b, v1.16b
 aese v0.16b, v30.16b
 aesmc v0.16b, v0.16b
 aese v3.16b, v30.16b
 aesmc v3.16b, v3.16b

Ldec_finish_prepretail:
 eor v10.16b, v10.16b, v6.16b
 pmull v7.1q, v9.1d, v8.1d
 ext v9.16b, v9.16b, v9.16b, #8
 eor v10.16b, v10.16b, v7.16b
 eor x22, x22, x14
 eor x23, x23, x13
 eor v10.16b, v10.16b, v9.16b
 add w12, w12, #1
 eor x21, x21, x13
 pmull v8.1q, v10.1d, v8.1d
 eor x24, x24, x14
 stp x21, x22, [x2], #16
 ext v10.16b, v10.16b, v10.16b, #8
 stp x23, x24, [x2], #16

 eor v11.16b, v11.16b, v8.16b
 aese v1.16b, v31.16b
 aese v0.16b, v31.16b
 aese v3.16b, v31.16b
 aese v2.16b, v31.16b
 eor v11.16b, v11.16b, v10.16b

Ldec_tail:
 sub x5, x4, x0
 ld1 { v5.16b}, [x0], #16
 eor v0.16b, v5.16b, v0.16b
 mov x6, v0.d[0]
 mov x7, v0.d[1]
 ext v8.16b, v11.16b, v11.16b, #8
 cmp x5, #48
 eor x6, x6, x13
 eor x7, x7, x14
 b.gt Ldec_blocks_4_remaining
 sub w12, w12, #1
 mov v3.16b, v2.16b
 movi v10.8b, #0
 movi v11.8b, #0
 cmp x5, #32
 movi v9.8b, #0
 mov v2.16b, v1.16b
 b.gt Ldec_blocks_3_remaining
 sub w12, w12, #1
 mov v3.16b, v1.16b
 cmp x5, #16
 b.gt Ldec_blocks_2_remaining
 sub w12, w12, #1
 b Ldec_blocks_1_remaining
Ldec_blocks_4_remaining:
 rev64 v4.16b, v5.16b
 ld1 { v5.16b}, [x0], #16
 stp x6, x7, [x2], #16
 mov d10, v17.d[1]
 eor v4.16b, v4.16b, v8.16b
 eor v0.16b, v5.16b, v1.16b
 mov d22, v4.d[1]
 mov x6, v0.d[0]
 mov x7, v0.d[1]
 eor v22.8b, v22.8b, v4.8b
 movi v8.8b, #0
 pmull2 v9.1q, v4.2d, v15.2d
 pmull v10.1q, v22.1d, v10.1d
 eor x6, x6, x13
 pmull v11.1q, v4.1d, v15.1d
 eor x7, x7, x14
Ldec_blocks_3_remaining:
 rev64 v4.16b, v5.16b
 ld1 { v5.16b}, [x0], #16
 eor v4.16b, v4.16b, v8.16b
 stp x6, x7, [x2], #16
 eor v0.16b, v5.16b, v2.16b
 mov d22, v4.d[1]
 pmull v21.1q, v4.1d, v14.1d
 pmull2 v20.1q, v4.2d, v14.2d
 eor v22.8b, v22.8b, v4.8b
 mov x6, v0.d[0]
 mov x7, v0.d[1]
 eor v11.16b, v11.16b, v21.16b
 movi v8.8b, #0
 pmull v22.1q, v22.1d, v17.1d
 eor v9.16b, v9.16b, v20.16b
 eor x6, x6, x13
 eor v10.16b, v10.16b, v22.16b
 eor x7, x7, x14
Ldec_blocks_2_remaining:
 stp x6, x7, [x2], #16
 rev64 v4.16b, v5.16b
 ld1 { v5.16b}, [x0], #16
 eor v4.16b, v4.16b, v8.16b
 movi v8.8b, #0
 mov d22, v4.d[1]
 eor v0.16b, v5.16b, v3.16b
 pmull2 v20.1q, v4.2d, v13.2d
 eor v22.8b, v22.8b, v4.8b
 pmull v21.1q, v4.1d, v13.1d
 mov x6, v0.d[0]
 ins v22.d[1], v22.d[0]
 mov x7, v0.d[1]
 pmull2 v22.1q, v22.2d, v16.2d
 eor x6, x6, x13
 eor v11.16b, v11.16b, v21.16b
 eor v9.16b, v9.16b, v20.16b
 eor v10.16b, v10.16b, v22.16b
 eor x7, x7, x14
Ldec_blocks_1_remaining:
 rev w9, w12
 rev64 v4.16b, v5.16b
 eor v4.16b, v4.16b, v8.16b
 pmull v21.1q, v4.1d, v12.1d
 mov d8, v4.d[1]
 eor v8.8b, v8.8b, v4.8b
 pmull2 v20.1q, v4.2d, v12.2d
 pmull v8.1q, v8.1d, v16.1d
 eor v9.16b, v9.16b, v20.16b
 eor v11.16b, v11.16b, v21.16b
 eor v10.16b, v10.16b, v8.16b
 movi v8.8b, #0xc2
 eor v6.16b, v11.16b, v9.16b
 shl d8, d8, #56
 eor v10.16b, v10.16b, v6.16b
 pmull v7.1q, v9.1d, v8.1d
 ext v9.16b, v9.16b, v9.16b, #8
 eor v10.16b, v10.16b, v7.16b
 eor v10.16b, v10.16b, v9.16b
 pmull v8.1q, v10.1d, v8.1d
 ext v10.16b, v10.16b, v10.16b, #8
 eor v11.16b, v11.16b, v8.16b
 stp x6, x7, [x2]
 str w9, [x16, #12]
 eor v11.16b, v11.16b, v10.16b
 ext v11.16b, v11.16b, v11.16b, #8
 rev64 v11.16b, v11.16b
 mov x0, x15
 st1 { v11.16b }, [x3]
 ldp x19, x20, [sp, #16]
 ldp x21, x22, [sp, #32]
 ldp x23, x24, [sp, #48]
 ldp d8, d9, [sp, #64]
 ldp d10, d11, [sp, #80]
 ldp d12, d13, [sp, #96]
 ldp d14, d15, [sp, #112]
 ldp x29, x30, [sp], #128

 ret
