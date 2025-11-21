# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/ghash-neon-armv8.S"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 467 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/ghash-neon-armv8.S" 2



# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h" 1
# 18 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/target.h" 1
# 19 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h" 2
# 41 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/generated-include/openssl/boringssl_prefix_symbols_asm.h" 1
# 42 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h" 2
# 5 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/ghash-neon-armv8.S" 2


# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/arm_arch.h" 1
# 8 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/ghash-neon-armv8.S" 2

.text

.globl _aws_lc_0_27_1_gcm_init_neon
.private_extern _aws_lc_0_27_1_gcm_init_neon

.align 4
_aws_lc_0_27_1_gcm_init_neon:


 ld1 {v17.2d}, [x1]
 movi v19.16b, #0xe1
 shl v19.2d, v19.2d, #57
 ext v3.16b, v17.16b, v17.16b, #8
 ushr v18.2d, v19.2d, #63
 dup v17.4s, v17.s[1]
 ext v16.16b, v18.16b, v19.16b, #8
 ushr v18.2d, v3.2d, #63
 sshr v17.4s, v17.4s, #31
 and v18.16b, v18.16b, v16.16b
 shl v3.2d, v3.2d, #1
 ext v18.16b, v18.16b, v18.16b, #8
 and v16.16b, v16.16b, v17.16b
 orr v3.16b, v3.16b, v18.16b
 eor v5.16b, v3.16b, v16.16b
 st1 {v5.2d}, [x0]
 ret


.globl _aws_lc_0_27_1_gcm_gmult_neon
.private_extern _aws_lc_0_27_1_gcm_gmult_neon

.align 4
_aws_lc_0_27_1_gcm_gmult_neon:

 ld1 {v3.16b}, [x0]
 ld1 {v5.1d}, [x1], #8
 ld1 {v6.1d}, [x1]
 adrp x9, Lmasks@PAGE
 add x9, x9, Lmasks@PAGEOFF
 ld1 {v24.2d, v25.2d}, [x9]
 rev64 v3.16b, v3.16b
 ext v3.16b, v3.16b, v3.16b, #8
 eor v7.8b, v5.8b, v6.8b

 mov x3, #16
 b Lgmult_neon


.globl _aws_lc_0_27_1_gcm_ghash_neon
.private_extern _aws_lc_0_27_1_gcm_ghash_neon

.align 4
_aws_lc_0_27_1_gcm_ghash_neon:

 ld1 {v0.16b}, [x0]
 ld1 {v5.1d}, [x1], #8
 ld1 {v6.1d}, [x1]
 adrp x9, Lmasks@PAGE
 add x9, x9, Lmasks@PAGEOFF
 ld1 {v24.2d, v25.2d}, [x9]
 rev64 v0.16b, v0.16b
 ext v0.16b, v0.16b, v0.16b, #8
 eor v7.8b, v5.8b, v6.8b

Loop_neon:
 ld1 {v3.16b}, [x2], #16
 rev64 v3.16b, v3.16b
 ext v3.16b, v3.16b, v3.16b, #8
 eor v3.16b, v3.16b, v0.16b

Lgmult_neon:


 ins v4.d[0], v3.d[1]
 ext v16.8b, v5.8b, v5.8b, #1
 pmull v16.8h, v16.8b, v3.8b
 ext v0.8b, v3.8b, v3.8b, #1
 pmull v0.8h, v5.8b, v0.8b
 ext v17.8b, v5.8b, v5.8b, #2
 pmull v17.8h, v17.8b, v3.8b
 ext v19.8b, v3.8b, v3.8b, #2
 pmull v19.8h, v5.8b, v19.8b
 ext v18.8b, v5.8b, v5.8b, #3
 eor v16.16b, v16.16b, v0.16b
 pmull v18.8h, v18.8b, v3.8b
 ext v0.8b, v3.8b, v3.8b, #3
 eor v17.16b, v17.16b, v19.16b
 pmull v0.8h, v5.8b, v0.8b
# 121 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/ghash-neon-armv8.S"
 ext v19.8b, v3.8b, v3.8b, #4
 eor v18.16b, v18.16b, v0.16b
 pmull v19.8h, v5.8b, v19.8b



 zip1 v20.2d, v16.2d, v17.2d
 zip1 v22.2d, v18.2d, v19.2d
 zip2 v21.2d, v16.2d, v17.2d
 zip2 v23.2d, v18.2d, v19.2d
 eor v20.16b, v20.16b, v21.16b
 eor v22.16b, v22.16b, v23.16b
 and v21.16b, v21.16b, v24.16b
 and v23.16b, v23.16b, v25.16b
 eor v20.16b, v20.16b, v21.16b
 eor v22.16b, v22.16b, v23.16b
 zip1 v16.2d, v20.2d, v21.2d
 zip1 v18.2d, v22.2d, v23.2d
 zip2 v17.2d, v20.2d, v21.2d
 zip2 v19.2d, v22.2d, v23.2d

 ext v16.16b, v16.16b, v16.16b, #15
 ext v17.16b, v17.16b, v17.16b, #14
 pmull v0.8h, v5.8b, v3.8b
 ext v19.16b, v19.16b, v19.16b, #12
 ext v18.16b, v18.16b, v18.16b, #13
 eor v16.16b, v16.16b, v17.16b
 eor v18.16b, v18.16b, v19.16b
 eor v0.16b, v0.16b, v16.16b
 eor v0.16b, v0.16b, v18.16b
 eor v3.8b, v3.8b, v4.8b
 ext v16.8b, v7.8b, v7.8b, #1
 pmull v16.8h, v16.8b, v3.8b
 ext v1.8b, v3.8b, v3.8b, #1
 pmull v1.8h, v7.8b, v1.8b
 ext v17.8b, v7.8b, v7.8b, #2
 pmull v17.8h, v17.8b, v3.8b
 ext v19.8b, v3.8b, v3.8b, #2
 pmull v19.8h, v7.8b, v19.8b
 ext v18.8b, v7.8b, v7.8b, #3
 eor v16.16b, v16.16b, v1.16b
 pmull v18.8h, v18.8b, v3.8b
 ext v1.8b, v3.8b, v3.8b, #3
 eor v17.16b, v17.16b, v19.16b
 pmull v1.8h, v7.8b, v1.8b
# 190 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/ghash-neon-armv8.S"
 ext v19.8b, v3.8b, v3.8b, #4
 eor v18.16b, v18.16b, v1.16b
 pmull v19.8h, v7.8b, v19.8b



 zip1 v20.2d, v16.2d, v17.2d
 zip1 v22.2d, v18.2d, v19.2d
 zip2 v21.2d, v16.2d, v17.2d
 zip2 v23.2d, v18.2d, v19.2d
 eor v20.16b, v20.16b, v21.16b
 eor v22.16b, v22.16b, v23.16b
 and v21.16b, v21.16b, v24.16b
 and v23.16b, v23.16b, v25.16b
 eor v20.16b, v20.16b, v21.16b
 eor v22.16b, v22.16b, v23.16b
 zip1 v16.2d, v20.2d, v21.2d
 zip1 v18.2d, v22.2d, v23.2d
 zip2 v17.2d, v20.2d, v21.2d
 zip2 v19.2d, v22.2d, v23.2d

 ext v16.16b, v16.16b, v16.16b, #15
 ext v17.16b, v17.16b, v17.16b, #14
 pmull v1.8h, v7.8b, v3.8b
 ext v19.16b, v19.16b, v19.16b, #12
 ext v18.16b, v18.16b, v18.16b, #13
 eor v16.16b, v16.16b, v17.16b
 eor v18.16b, v18.16b, v19.16b
 eor v1.16b, v1.16b, v16.16b
 eor v1.16b, v1.16b, v18.16b
 ext v16.8b, v6.8b, v6.8b, #1
 pmull v16.8h, v16.8b, v4.8b
 ext v2.8b, v4.8b, v4.8b, #1
 pmull v2.8h, v6.8b, v2.8b
 ext v17.8b, v6.8b, v6.8b, #2
 pmull v17.8h, v17.8b, v4.8b
 ext v19.8b, v4.8b, v4.8b, #2
 pmull v19.8h, v6.8b, v19.8b
 ext v18.8b, v6.8b, v6.8b, #3
 eor v16.16b, v16.16b, v2.16b
 pmull v18.8h, v18.8b, v4.8b
 ext v2.8b, v4.8b, v4.8b, #3
 eor v17.16b, v17.16b, v19.16b
 pmull v2.8h, v6.8b, v2.8b
# 258 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/ghash-neon-armv8.S"
 ext v19.8b, v4.8b, v4.8b, #4
 eor v18.16b, v18.16b, v2.16b
 pmull v19.8h, v6.8b, v19.8b



 zip1 v20.2d, v16.2d, v17.2d
 zip1 v22.2d, v18.2d, v19.2d
 zip2 v21.2d, v16.2d, v17.2d
 zip2 v23.2d, v18.2d, v19.2d
 eor v20.16b, v20.16b, v21.16b
 eor v22.16b, v22.16b, v23.16b
 and v21.16b, v21.16b, v24.16b
 and v23.16b, v23.16b, v25.16b
 eor v20.16b, v20.16b, v21.16b
 eor v22.16b, v22.16b, v23.16b
 zip1 v16.2d, v20.2d, v21.2d
 zip1 v18.2d, v22.2d, v23.2d
 zip2 v17.2d, v20.2d, v21.2d
 zip2 v19.2d, v22.2d, v23.2d

 ext v16.16b, v16.16b, v16.16b, #15
 ext v17.16b, v17.16b, v17.16b, #14
 pmull v2.8h, v6.8b, v4.8b
 ext v19.16b, v19.16b, v19.16b, #12
 ext v18.16b, v18.16b, v18.16b, #13
 eor v16.16b, v16.16b, v17.16b
 eor v18.16b, v18.16b, v19.16b
 eor v2.16b, v2.16b, v16.16b
 eor v2.16b, v2.16b, v18.16b
 ext v16.16b, v0.16b, v2.16b, #8
 eor v1.16b, v1.16b, v0.16b
 eor v1.16b, v1.16b, v2.16b
 eor v1.16b, v1.16b, v16.16b
 ins v0.d[1], v1.d[0]




 shl v17.2d, v0.2d, #57
 shl v18.2d, v0.2d, #62
 eor v18.16b, v18.16b, v17.16b
 shl v17.2d, v0.2d, #63
 eor v18.16b, v18.16b, v17.16b

 eor v18.16b, v18.16b, v1.16b
 ins v0.d[1], v18.d[0]
 ins v2.d[0], v18.d[1]

 ushr v18.2d, v0.2d, #1
 eor v2.16b, v2.16b,v0.16b
 eor v0.16b, v0.16b,v18.16b
 ushr v18.2d, v18.2d, #6
 ushr v0.2d, v0.2d, #1
 eor v0.16b, v0.16b, v2.16b
 eor v0.16b, v0.16b, v18.16b

 subs x3, x3, #16
 bne Loop_neon

 rev64 v0.16b, v0.16b
 ext v0.16b, v0.16b, v0.16b, #8
 st1 {v0.16b}, [x0]

 ret


.section __TEXT,__const
.align 4
Lmasks:
.quad 0x0000ffffffffffff
.quad 0x00000000ffffffff
.quad 0x000000000000ffff
.quad 0x0000000000000000
.byte 71,72,65,83,72,32,102,111,114,32,65,82,77,118,56,44,32,100,101,114,105,118,101,100,32,102,114,111,109,32,65,82,77,118,52,32,118,101,114,115,105,111,110,32,98,121,32,60,97,112,112,114,111,64,111,112,101,110,115,115,108,46,111,114,103,62,0
.align 2
.align 2
