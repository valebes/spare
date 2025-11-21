# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/cipher_extra/chacha20_poly1305_armv8.S"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 467 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/cipher_extra/chacha20_poly1305_armv8.S" 2



# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h" 1
# 18 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/target.h" 1
# 19 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h" 2
# 41 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/generated-include/openssl/boringssl_prefix_symbols_asm.h" 1
# 42 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h" 2
# 5 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/cipher_extra/chacha20_poly1305_armv8.S" 2


# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/arm_arch.h" 1
# 8 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/cipher_extra/chacha20_poly1305_armv8.S" 2
.section __TEXT,__const

.align 7
Lchacha20_consts:
.byte 'e','x','p','a','n','d',' ','3','2','-','b','y','t','e',' ','k'
Linc:
.long 1,2,3,4
Lrol8:
.byte 3,0,1,2, 7,4,5,6, 11,8,9,10, 15,12,13,14
Lclamp:
.quad 0x0FFFFFFC0FFFFFFF, 0x0FFFFFFC0FFFFFFC

.text


.align 6
Lpoly_hash_ad_internal:
.cfi_startproc
 cbnz x4, Lpoly_hash_intro
 ret

Lpoly_hash_intro:
 cmp x4, #16
 b.lt Lpoly_hash_ad_tail
 ldp x11, x12, [x3], 16
 adds x8, x8, x11
 adcs x9, x9, x12
 adc x10, x10, x15
 mul x11, x8, x16
 umulh x12, x8, x16
 mul x13, x9, x16
 umulh x14, x9, x16
 adds x12, x12, x13
 mul x13, x10, x16
 adc x13, x13, x14
 mul x14, x8, x17
 umulh x8, x8, x17
 adds x12, x12, x14
 mul x14, x9, x17
 umulh x9, x9, x17
 adcs x14, x14, x8
 mul x10, x10, x17
 adc x10, x10, x9
 adds x13, x13, x14
 adc x14, x10, xzr
 and x10, x13, #3
 and x8, x13, #-4
 extr x13, x14, x13, #2
 adds x8, x8, x11
 lsr x11, x14, #2
 adc x9, x14, x11
 adds x8, x8, x13
 adcs x9, x9, x12
 adc x10, x10, xzr
 sub x4, x4, #16
 b Lpoly_hash_ad_internal

Lpoly_hash_ad_tail:
 cbz x4, Lpoly_hash_ad_ret

 eor v20.16b, v20.16b, v20.16b
 sub x4, x4, #1

Lpoly_hash_tail_16_compose:
 ext v20.16b, v20.16b, v20.16b, #15
 ldrb w11, [x3, x4]
 mov v20.b[0], w11
 subs x4, x4, #1
 b.ge Lpoly_hash_tail_16_compose
 mov x11, v20.d[0]
 mov x12, v20.d[1]
 adds x8, x8, x11
 adcs x9, x9, x12
 adc x10, x10, x15
 mul x11, x8, x16
 umulh x12, x8, x16
 mul x13, x9, x16
 umulh x14, x9, x16
 adds x12, x12, x13
 mul x13, x10, x16
 adc x13, x13, x14
 mul x14, x8, x17
 umulh x8, x8, x17
 adds x12, x12, x14
 mul x14, x9, x17
 umulh x9, x9, x17
 adcs x14, x14, x8
 mul x10, x10, x17
 adc x10, x10, x9
 adds x13, x13, x14
 adc x14, x10, xzr
 and x10, x13, #3
 and x8, x13, #-4
 extr x13, x14, x13, #2
 adds x8, x8, x11
 lsr x11, x14, #2
 adc x9, x14, x11
 adds x8, x8, x13
 adcs x9, x9, x12
 adc x10, x10, xzr

Lpoly_hash_ad_ret:
 ret
.cfi_endproc






.globl _aws_lc_0_27_1_chacha20_poly1305_seal
.private_extern _aws_lc_0_27_1_chacha20_poly1305_seal

.align 6
_aws_lc_0_27_1_chacha20_poly1305_seal:

.cfi_startproc
 stp x29, x30, [sp, #-80]!
.cfi_def_cfa_offset 80
.cfi_offset w30, -72
.cfi_offset w29, -80
 mov x29, sp



 stp d8, d9, [sp, #16]
 stp d10, d11, [sp, #32]
 stp d12, d13, [sp, #48]
 stp d14, d15, [sp, #64]
.cfi_offset b15, -8
.cfi_offset b14, -16
.cfi_offset b13, -24
.cfi_offset b12, -32
.cfi_offset b11, -40
.cfi_offset b10, -48
.cfi_offset b9, -56
.cfi_offset b8, -64

 adrp x11, Lchacha20_consts@PAGE
 add x11, x11, Lchacha20_consts@PAGEOFF

 ld1 {v24.16b - v27.16b}, [x11]
 ld1 {v28.16b - v30.16b}, [x5]

 mov x15, #1
 mov x8, #0
 mov x9, #0
 mov x10, #0

 ldr x12, [x5, #56]
 add x12, x12, x2
 mov v31.d[0], x4
 mov v31.d[1], x12

 cmp x2, #128
 b.le Lseal_128




 ld4r {v0.4s,v1.4s,v2.4s,v3.4s}, [x11]
 mov v4.16b, v24.16b

 ld4r {v5.4s,v6.4s,v7.4s,v8.4s}, [x5], #16
 mov v9.16b, v28.16b

 ld4r {v10.4s,v11.4s,v12.4s,v13.4s}, [x5], #16
 mov v14.16b, v29.16b

 ld4r {v15.4s,v16.4s,v17.4s,v18.4s}, [x5]
 add v15.4s, v15.4s, v25.4s
 mov v19.16b, v30.16b

 sub x5, x5, #32

 mov x6, #10

.align 5
Lseal_init_rounds:
 add v0.4s, v0.4s, v5.4s
 add v1.4s, v1.4s, v6.4s
 add v2.4s, v2.4s, v7.4s
 add v3.4s, v3.4s, v8.4s
 add v4.4s, v4.4s, v9.4s

 eor v15.16b, v15.16b, v0.16b
 eor v16.16b, v16.16b, v1.16b
 eor v17.16b, v17.16b, v2.16b
 eor v18.16b, v18.16b, v3.16b
 eor v19.16b, v19.16b, v4.16b

 rev32 v15.8h, v15.8h
 rev32 v16.8h, v16.8h
 rev32 v17.8h, v17.8h
 rev32 v18.8h, v18.8h
 rev32 v19.8h, v19.8h

 add v10.4s, v10.4s, v15.4s
 add v11.4s, v11.4s, v16.4s
 add v12.4s, v12.4s, v17.4s
 add v13.4s, v13.4s, v18.4s
 add v14.4s, v14.4s, v19.4s

 eor v5.16b, v5.16b, v10.16b
 eor v6.16b, v6.16b, v11.16b
 eor v7.16b, v7.16b, v12.16b
 eor v8.16b, v8.16b, v13.16b
 eor v9.16b, v9.16b, v14.16b

 ushr v20.4s, v5.4s, #20
 sli v20.4s, v5.4s, #12
 ushr v5.4s, v6.4s, #20
 sli v5.4s, v6.4s, #12
 ushr v6.4s, v7.4s, #20
 sli v6.4s, v7.4s, #12
 ushr v7.4s, v8.4s, #20
 sli v7.4s, v8.4s, #12
 ushr v8.4s, v9.4s, #20
 sli v8.4s, v9.4s, #12

 add v0.4s, v0.4s, v20.4s
 add v1.4s, v1.4s, v5.4s
 add v2.4s, v2.4s, v6.4s
 add v3.4s, v3.4s, v7.4s
 add v4.4s, v4.4s, v8.4s

 eor v15.16b, v15.16b, v0.16b
 eor v16.16b, v16.16b, v1.16b
 eor v17.16b, v17.16b, v2.16b
 eor v18.16b, v18.16b, v3.16b
 eor v19.16b, v19.16b, v4.16b

 tbl v15.16b, {v15.16b}, v26.16b
 tbl v16.16b, {v16.16b}, v26.16b
 tbl v17.16b, {v17.16b}, v26.16b
 tbl v18.16b, {v18.16b}, v26.16b
 tbl v19.16b, {v19.16b}, v26.16b

 add v10.4s, v10.4s, v15.4s
 add v11.4s, v11.4s, v16.4s
 add v12.4s, v12.4s, v17.4s
 add v13.4s, v13.4s, v18.4s
 add v14.4s, v14.4s, v19.4s

 eor v20.16b, v20.16b, v10.16b
 eor v5.16b, v5.16b, v11.16b
 eor v6.16b, v6.16b, v12.16b
 eor v7.16b, v7.16b, v13.16b
 eor v8.16b, v8.16b, v14.16b

 ushr v9.4s, v8.4s, #25
 sli v9.4s, v8.4s, #7
 ushr v8.4s, v7.4s, #25
 sli v8.4s, v7.4s, #7
 ushr v7.4s, v6.4s, #25
 sli v7.4s, v6.4s, #7
 ushr v6.4s, v5.4s, #25
 sli v6.4s, v5.4s, #7
 ushr v5.4s, v20.4s, #25
 sli v5.4s, v20.4s, #7

 ext v9.16b, v9.16b, v9.16b, #4
 ext v14.16b, v14.16b, v14.16b, #8
 ext v19.16b, v19.16b, v19.16b, #12
 add v0.4s, v0.4s, v6.4s
 add v1.4s, v1.4s, v7.4s
 add v2.4s, v2.4s, v8.4s
 add v3.4s, v3.4s, v5.4s
 add v4.4s, v4.4s, v9.4s

 eor v18.16b, v18.16b, v0.16b
 eor v15.16b, v15.16b, v1.16b
 eor v16.16b, v16.16b, v2.16b
 eor v17.16b, v17.16b, v3.16b
 eor v19.16b, v19.16b, v4.16b

 rev32 v18.8h, v18.8h
 rev32 v15.8h, v15.8h
 rev32 v16.8h, v16.8h
 rev32 v17.8h, v17.8h
 rev32 v19.8h, v19.8h

 add v12.4s, v12.4s, v18.4s
 add v13.4s, v13.4s, v15.4s
 add v10.4s, v10.4s, v16.4s
 add v11.4s, v11.4s, v17.4s
 add v14.4s, v14.4s, v19.4s

 eor v6.16b, v6.16b, v12.16b
 eor v7.16b, v7.16b, v13.16b
 eor v8.16b, v8.16b, v10.16b
 eor v5.16b, v5.16b, v11.16b
 eor v9.16b, v9.16b, v14.16b

 ushr v20.4s, v6.4s, #20
 sli v20.4s, v6.4s, #12
 ushr v6.4s, v7.4s, #20
 sli v6.4s, v7.4s, #12
 ushr v7.4s, v8.4s, #20
 sli v7.4s, v8.4s, #12
 ushr v8.4s, v5.4s, #20
 sli v8.4s, v5.4s, #12
 ushr v5.4s, v9.4s, #20
 sli v5.4s, v9.4s, #12

 add v0.4s, v0.4s, v20.4s
 add v1.4s, v1.4s, v6.4s
 add v2.4s, v2.4s, v7.4s
 add v3.4s, v3.4s, v8.4s
 add v4.4s, v4.4s, v5.4s

 eor v18.16b, v18.16b, v0.16b
 eor v15.16b, v15.16b, v1.16b
 eor v16.16b, v16.16b, v2.16b
 eor v17.16b, v17.16b, v3.16b
 eor v19.16b, v19.16b, v4.16b

 tbl v18.16b, {v18.16b}, v26.16b
 tbl v15.16b, {v15.16b}, v26.16b
 tbl v16.16b, {v16.16b}, v26.16b
 tbl v17.16b, {v17.16b}, v26.16b
 tbl v19.16b, {v19.16b}, v26.16b

 add v12.4s, v12.4s, v18.4s
 add v13.4s, v13.4s, v15.4s
 add v10.4s, v10.4s, v16.4s
 add v11.4s, v11.4s, v17.4s
 add v14.4s, v14.4s, v19.4s

 eor v20.16b, v20.16b, v12.16b
 eor v6.16b, v6.16b, v13.16b
 eor v7.16b, v7.16b, v10.16b
 eor v8.16b, v8.16b, v11.16b
 eor v5.16b, v5.16b, v14.16b

 ushr v9.4s, v5.4s, #25
 sli v9.4s, v5.4s, #7
 ushr v5.4s, v8.4s, #25
 sli v5.4s, v8.4s, #7
 ushr v8.4s, v7.4s, #25
 sli v8.4s, v7.4s, #7
 ushr v7.4s, v6.4s, #25
 sli v7.4s, v6.4s, #7
 ushr v6.4s, v20.4s, #25
 sli v6.4s, v20.4s, #7

 ext v9.16b, v9.16b, v9.16b, #12
 ext v14.16b, v14.16b, v14.16b, #8
 ext v19.16b, v19.16b, v19.16b, #4
 subs x6, x6, #1
 b.hi Lseal_init_rounds

 add v15.4s, v15.4s, v25.4s
 mov x11, #4
 dup v20.4s, w11
 add v25.4s, v25.4s, v20.4s

 zip1 v20.4s, v0.4s, v1.4s
 zip2 v21.4s, v0.4s, v1.4s
 zip1 v22.4s, v2.4s, v3.4s
 zip2 v23.4s, v2.4s, v3.4s

 zip1 v0.2d, v20.2d, v22.2d
 zip2 v1.2d, v20.2d, v22.2d
 zip1 v2.2d, v21.2d, v23.2d
 zip2 v3.2d, v21.2d, v23.2d

 zip1 v20.4s, v5.4s, v6.4s
 zip2 v21.4s, v5.4s, v6.4s
 zip1 v22.4s, v7.4s, v8.4s
 zip2 v23.4s, v7.4s, v8.4s

 zip1 v5.2d, v20.2d, v22.2d
 zip2 v6.2d, v20.2d, v22.2d
 zip1 v7.2d, v21.2d, v23.2d
 zip2 v8.2d, v21.2d, v23.2d

 zip1 v20.4s, v10.4s, v11.4s
 zip2 v21.4s, v10.4s, v11.4s
 zip1 v22.4s, v12.4s, v13.4s
 zip2 v23.4s, v12.4s, v13.4s

 zip1 v10.2d, v20.2d, v22.2d
 zip2 v11.2d, v20.2d, v22.2d
 zip1 v12.2d, v21.2d, v23.2d
 zip2 v13.2d, v21.2d, v23.2d

 zip1 v20.4s, v15.4s, v16.4s
 zip2 v21.4s, v15.4s, v16.4s
 zip1 v22.4s, v17.4s, v18.4s
 zip2 v23.4s, v17.4s, v18.4s

 zip1 v15.2d, v20.2d, v22.2d
 zip2 v16.2d, v20.2d, v22.2d
 zip1 v17.2d, v21.2d, v23.2d
 zip2 v18.2d, v21.2d, v23.2d

 add v4.4s, v4.4s, v24.4s
 add v9.4s, v9.4s, v28.4s
 and v4.16b, v4.16b, v27.16b

 add v0.4s, v0.4s, v24.4s
 add v5.4s, v5.4s, v28.4s
 add v10.4s, v10.4s, v29.4s
 add v15.4s, v15.4s, v30.4s

 add v1.4s, v1.4s, v24.4s
 add v6.4s, v6.4s, v28.4s
 add v11.4s, v11.4s, v29.4s
 add v16.4s, v16.4s, v30.4s

 add v2.4s, v2.4s, v24.4s
 add v7.4s, v7.4s, v28.4s
 add v12.4s, v12.4s, v29.4s
 add v17.4s, v17.4s, v30.4s

 add v3.4s, v3.4s, v24.4s
 add v8.4s, v8.4s, v28.4s
 add v13.4s, v13.4s, v29.4s
 add v18.4s, v18.4s, v30.4s

 mov x16, v4.d[0]
 mov x17, v4.d[1]
 mov v27.16b, v9.16b

 bl Lpoly_hash_ad_internal

 mov x3, x0
 cmp x2, #256
 b.le Lseal_tail

 ld1 {v20.16b - v23.16b}, [x1], #64
 eor v20.16b, v20.16b, v0.16b
 eor v21.16b, v21.16b, v5.16b
 eor v22.16b, v22.16b, v10.16b
 eor v23.16b, v23.16b, v15.16b
 st1 {v20.16b - v23.16b}, [x0], #64

 ld1 {v20.16b - v23.16b}, [x1], #64
 eor v20.16b, v20.16b, v1.16b
 eor v21.16b, v21.16b, v6.16b
 eor v22.16b, v22.16b, v11.16b
 eor v23.16b, v23.16b, v16.16b
 st1 {v20.16b - v23.16b}, [x0], #64

 ld1 {v20.16b - v23.16b}, [x1], #64
 eor v20.16b, v20.16b, v2.16b
 eor v21.16b, v21.16b, v7.16b
 eor v22.16b, v22.16b, v12.16b
 eor v23.16b, v23.16b, v17.16b
 st1 {v20.16b - v23.16b}, [x0], #64

 ld1 {v20.16b - v23.16b}, [x1], #64
 eor v20.16b, v20.16b, v3.16b
 eor v21.16b, v21.16b, v8.16b
 eor v22.16b, v22.16b, v13.16b
 eor v23.16b, v23.16b, v18.16b
 st1 {v20.16b - v23.16b}, [x0], #64

 sub x2, x2, #256

 mov x6, #4
 mov x7, #6

Lseal_main_loop:
 adrp x11, Lchacha20_consts@PAGE
 add x11, x11, Lchacha20_consts@PAGEOFF

 ld4r {v0.4s,v1.4s,v2.4s,v3.4s}, [x11]
 mov v4.16b, v24.16b

 ld4r {v5.4s,v6.4s,v7.4s,v8.4s}, [x5], #16
 mov v9.16b, v28.16b

 ld4r {v10.4s,v11.4s,v12.4s,v13.4s}, [x5], #16
 mov v14.16b, v29.16b

 ld4r {v15.4s,v16.4s,v17.4s,v18.4s}, [x5]
 add v15.4s, v15.4s, v25.4s
 mov v19.16b, v30.16b

 eor v20.16b, v20.16b, v20.16b
 not v21.16b, v20.16b
 sub v21.4s, v25.4s, v21.4s
 ext v20.16b, v21.16b, v20.16b, #12
 add v19.4s, v19.4s, v20.4s

 sub x5, x5, #32
.align 5
Lseal_main_loop_rounds:
 add v0.4s, v0.4s, v5.4s
 add v1.4s, v1.4s, v6.4s
 add v2.4s, v2.4s, v7.4s
 add v3.4s, v3.4s, v8.4s
 add v4.4s, v4.4s, v9.4s

 eor v15.16b, v15.16b, v0.16b
 eor v16.16b, v16.16b, v1.16b
 eor v17.16b, v17.16b, v2.16b
 eor v18.16b, v18.16b, v3.16b
 eor v19.16b, v19.16b, v4.16b

 rev32 v15.8h, v15.8h
 rev32 v16.8h, v16.8h
 rev32 v17.8h, v17.8h
 rev32 v18.8h, v18.8h
 rev32 v19.8h, v19.8h

 add v10.4s, v10.4s, v15.4s
 add v11.4s, v11.4s, v16.4s
 add v12.4s, v12.4s, v17.4s
 add v13.4s, v13.4s, v18.4s
 add v14.4s, v14.4s, v19.4s

 eor v5.16b, v5.16b, v10.16b
 eor v6.16b, v6.16b, v11.16b
 eor v7.16b, v7.16b, v12.16b
 eor v8.16b, v8.16b, v13.16b
 eor v9.16b, v9.16b, v14.16b

 ushr v20.4s, v5.4s, #20
 sli v20.4s, v5.4s, #12
 ushr v5.4s, v6.4s, #20
 sli v5.4s, v6.4s, #12
 ushr v6.4s, v7.4s, #20
 sli v6.4s, v7.4s, #12
 ushr v7.4s, v8.4s, #20
 sli v7.4s, v8.4s, #12
 ushr v8.4s, v9.4s, #20
 sli v8.4s, v9.4s, #12

 add v0.4s, v0.4s, v20.4s
 add v1.4s, v1.4s, v5.4s
 add v2.4s, v2.4s, v6.4s
 add v3.4s, v3.4s, v7.4s
 add v4.4s, v4.4s, v8.4s

 eor v15.16b, v15.16b, v0.16b
 eor v16.16b, v16.16b, v1.16b
 eor v17.16b, v17.16b, v2.16b
 eor v18.16b, v18.16b, v3.16b
 eor v19.16b, v19.16b, v4.16b

 tbl v15.16b, {v15.16b}, v26.16b
 tbl v16.16b, {v16.16b}, v26.16b
 tbl v17.16b, {v17.16b}, v26.16b
 tbl v18.16b, {v18.16b}, v26.16b
 tbl v19.16b, {v19.16b}, v26.16b

 add v10.4s, v10.4s, v15.4s
 add v11.4s, v11.4s, v16.4s
 add v12.4s, v12.4s, v17.4s
 add v13.4s, v13.4s, v18.4s
 add v14.4s, v14.4s, v19.4s

 eor v20.16b, v20.16b, v10.16b
 eor v5.16b, v5.16b, v11.16b
 eor v6.16b, v6.16b, v12.16b
 eor v7.16b, v7.16b, v13.16b
 eor v8.16b, v8.16b, v14.16b

 ushr v9.4s, v8.4s, #25
 sli v9.4s, v8.4s, #7
 ushr v8.4s, v7.4s, #25
 sli v8.4s, v7.4s, #7
 ushr v7.4s, v6.4s, #25
 sli v7.4s, v6.4s, #7
 ushr v6.4s, v5.4s, #25
 sli v6.4s, v5.4s, #7
 ushr v5.4s, v20.4s, #25
 sli v5.4s, v20.4s, #7

 ext v9.16b, v9.16b, v9.16b, #4
 ext v14.16b, v14.16b, v14.16b, #8
 ext v19.16b, v19.16b, v19.16b, #12
 ldp x11, x12, [x3], 16
 adds x8, x8, x11
 adcs x9, x9, x12
 adc x10, x10, x15
 mul x11, x8, x16
 umulh x12, x8, x16
 mul x13, x9, x16
 umulh x14, x9, x16
 adds x12, x12, x13
 mul x13, x10, x16
 adc x13, x13, x14
 mul x14, x8, x17
 umulh x8, x8, x17
 adds x12, x12, x14
 mul x14, x9, x17
 umulh x9, x9, x17
 adcs x14, x14, x8
 mul x10, x10, x17
 adc x10, x10, x9
 adds x13, x13, x14
 adc x14, x10, xzr
 and x10, x13, #3
 and x8, x13, #-4
 extr x13, x14, x13, #2
 adds x8, x8, x11
 lsr x11, x14, #2
 adc x9, x14, x11
 adds x8, x8, x13
 adcs x9, x9, x12
 adc x10, x10, xzr
 add v0.4s, v0.4s, v6.4s
 add v1.4s, v1.4s, v7.4s
 add v2.4s, v2.4s, v8.4s
 add v3.4s, v3.4s, v5.4s
 add v4.4s, v4.4s, v9.4s

 eor v18.16b, v18.16b, v0.16b
 eor v15.16b, v15.16b, v1.16b
 eor v16.16b, v16.16b, v2.16b
 eor v17.16b, v17.16b, v3.16b
 eor v19.16b, v19.16b, v4.16b

 rev32 v18.8h, v18.8h
 rev32 v15.8h, v15.8h
 rev32 v16.8h, v16.8h
 rev32 v17.8h, v17.8h
 rev32 v19.8h, v19.8h

 add v12.4s, v12.4s, v18.4s
 add v13.4s, v13.4s, v15.4s
 add v10.4s, v10.4s, v16.4s
 add v11.4s, v11.4s, v17.4s
 add v14.4s, v14.4s, v19.4s

 eor v6.16b, v6.16b, v12.16b
 eor v7.16b, v7.16b, v13.16b
 eor v8.16b, v8.16b, v10.16b
 eor v5.16b, v5.16b, v11.16b
 eor v9.16b, v9.16b, v14.16b

 ushr v20.4s, v6.4s, #20
 sli v20.4s, v6.4s, #12
 ushr v6.4s, v7.4s, #20
 sli v6.4s, v7.4s, #12
 ushr v7.4s, v8.4s, #20
 sli v7.4s, v8.4s, #12
 ushr v8.4s, v5.4s, #20
 sli v8.4s, v5.4s, #12
 ushr v5.4s, v9.4s, #20
 sli v5.4s, v9.4s, #12

 add v0.4s, v0.4s, v20.4s
 add v1.4s, v1.4s, v6.4s
 add v2.4s, v2.4s, v7.4s
 add v3.4s, v3.4s, v8.4s
 add v4.4s, v4.4s, v5.4s

 eor v18.16b, v18.16b, v0.16b
 eor v15.16b, v15.16b, v1.16b
 eor v16.16b, v16.16b, v2.16b
 eor v17.16b, v17.16b, v3.16b
 eor v19.16b, v19.16b, v4.16b

 tbl v18.16b, {v18.16b}, v26.16b
 tbl v15.16b, {v15.16b}, v26.16b
 tbl v16.16b, {v16.16b}, v26.16b
 tbl v17.16b, {v17.16b}, v26.16b
 tbl v19.16b, {v19.16b}, v26.16b

 add v12.4s, v12.4s, v18.4s
 add v13.4s, v13.4s, v15.4s
 add v10.4s, v10.4s, v16.4s
 add v11.4s, v11.4s, v17.4s
 add v14.4s, v14.4s, v19.4s

 eor v20.16b, v20.16b, v12.16b
 eor v6.16b, v6.16b, v13.16b
 eor v7.16b, v7.16b, v10.16b
 eor v8.16b, v8.16b, v11.16b
 eor v5.16b, v5.16b, v14.16b

 ushr v9.4s, v5.4s, #25
 sli v9.4s, v5.4s, #7
 ushr v5.4s, v8.4s, #25
 sli v5.4s, v8.4s, #7
 ushr v8.4s, v7.4s, #25
 sli v8.4s, v7.4s, #7
 ushr v7.4s, v6.4s, #25
 sli v7.4s, v6.4s, #7
 ushr v6.4s, v20.4s, #25
 sli v6.4s, v20.4s, #7

 ext v9.16b, v9.16b, v9.16b, #12
 ext v14.16b, v14.16b, v14.16b, #8
 ext v19.16b, v19.16b, v19.16b, #4
 subs x6, x6, #1
 b.ge Lseal_main_loop_rounds
 ldp x11, x12, [x3], 16
 adds x8, x8, x11
 adcs x9, x9, x12
 adc x10, x10, x15
 mul x11, x8, x16
 umulh x12, x8, x16
 mul x13, x9, x16
 umulh x14, x9, x16
 adds x12, x12, x13
 mul x13, x10, x16
 adc x13, x13, x14
 mul x14, x8, x17
 umulh x8, x8, x17
 adds x12, x12, x14
 mul x14, x9, x17
 umulh x9, x9, x17
 adcs x14, x14, x8
 mul x10, x10, x17
 adc x10, x10, x9
 adds x13, x13, x14
 adc x14, x10, xzr
 and x10, x13, #3
 and x8, x13, #-4
 extr x13, x14, x13, #2
 adds x8, x8, x11
 lsr x11, x14, #2
 adc x9, x14, x11
 adds x8, x8, x13
 adcs x9, x9, x12
 adc x10, x10, xzr
 subs x7, x7, #1
 b.gt Lseal_main_loop_rounds

 eor v20.16b, v20.16b, v20.16b
 not v21.16b, v20.16b
 sub v21.4s, v25.4s, v21.4s
 ext v20.16b, v21.16b, v20.16b, #12
 add v19.4s, v19.4s, v20.4s

 add v15.4s, v15.4s, v25.4s
 mov x11, #5
 dup v20.4s, w11
 add v25.4s, v25.4s, v20.4s

 zip1 v20.4s, v0.4s, v1.4s
 zip2 v21.4s, v0.4s, v1.4s
 zip1 v22.4s, v2.4s, v3.4s
 zip2 v23.4s, v2.4s, v3.4s

 zip1 v0.2d, v20.2d, v22.2d
 zip2 v1.2d, v20.2d, v22.2d
 zip1 v2.2d, v21.2d, v23.2d
 zip2 v3.2d, v21.2d, v23.2d

 zip1 v20.4s, v5.4s, v6.4s
 zip2 v21.4s, v5.4s, v6.4s
 zip1 v22.4s, v7.4s, v8.4s
 zip2 v23.4s, v7.4s, v8.4s

 zip1 v5.2d, v20.2d, v22.2d
 zip2 v6.2d, v20.2d, v22.2d
 zip1 v7.2d, v21.2d, v23.2d
 zip2 v8.2d, v21.2d, v23.2d

 zip1 v20.4s, v10.4s, v11.4s
 zip2 v21.4s, v10.4s, v11.4s
 zip1 v22.4s, v12.4s, v13.4s
 zip2 v23.4s, v12.4s, v13.4s

 zip1 v10.2d, v20.2d, v22.2d
 zip2 v11.2d, v20.2d, v22.2d
 zip1 v12.2d, v21.2d, v23.2d
 zip2 v13.2d, v21.2d, v23.2d

 zip1 v20.4s, v15.4s, v16.4s
 zip2 v21.4s, v15.4s, v16.4s
 zip1 v22.4s, v17.4s, v18.4s
 zip2 v23.4s, v17.4s, v18.4s

 zip1 v15.2d, v20.2d, v22.2d
 zip2 v16.2d, v20.2d, v22.2d
 zip1 v17.2d, v21.2d, v23.2d
 zip2 v18.2d, v21.2d, v23.2d

 add v0.4s, v0.4s, v24.4s
 add v5.4s, v5.4s, v28.4s
 add v10.4s, v10.4s, v29.4s
 add v15.4s, v15.4s, v30.4s

 add v1.4s, v1.4s, v24.4s
 add v6.4s, v6.4s, v28.4s
 add v11.4s, v11.4s, v29.4s
 add v16.4s, v16.4s, v30.4s

 add v2.4s, v2.4s, v24.4s
 add v7.4s, v7.4s, v28.4s
 add v12.4s, v12.4s, v29.4s
 add v17.4s, v17.4s, v30.4s

 add v3.4s, v3.4s, v24.4s
 add v8.4s, v8.4s, v28.4s
 add v13.4s, v13.4s, v29.4s
 add v18.4s, v18.4s, v30.4s

 add v4.4s, v4.4s, v24.4s
 add v9.4s, v9.4s, v28.4s
 add v14.4s, v14.4s, v29.4s
 add v19.4s, v19.4s, v30.4s

 cmp x2, #320
 b.le Lseal_tail

 ld1 {v20.16b - v23.16b}, [x1], #64
 eor v20.16b, v20.16b, v0.16b
 eor v21.16b, v21.16b, v5.16b
 eor v22.16b, v22.16b, v10.16b
 eor v23.16b, v23.16b, v15.16b
 st1 {v20.16b - v23.16b}, [x0], #64

 ld1 {v20.16b - v23.16b}, [x1], #64
 eor v20.16b, v20.16b, v1.16b
 eor v21.16b, v21.16b, v6.16b
 eor v22.16b, v22.16b, v11.16b
 eor v23.16b, v23.16b, v16.16b
 st1 {v20.16b - v23.16b}, [x0], #64

 ld1 {v20.16b - v23.16b}, [x1], #64
 eor v20.16b, v20.16b, v2.16b
 eor v21.16b, v21.16b, v7.16b
 eor v22.16b, v22.16b, v12.16b
 eor v23.16b, v23.16b, v17.16b
 st1 {v20.16b - v23.16b}, [x0], #64

 ld1 {v20.16b - v23.16b}, [x1], #64
 eor v20.16b, v20.16b, v3.16b
 eor v21.16b, v21.16b, v8.16b
 eor v22.16b, v22.16b, v13.16b
 eor v23.16b, v23.16b, v18.16b
 st1 {v20.16b - v23.16b}, [x0], #64

 ld1 {v20.16b - v23.16b}, [x1], #64
 eor v20.16b, v20.16b, v4.16b
 eor v21.16b, v21.16b, v9.16b
 eor v22.16b, v22.16b, v14.16b
 eor v23.16b, v23.16b, v19.16b
 st1 {v20.16b - v23.16b}, [x0], #64

 sub x2, x2, #320

 mov x6, #0
 mov x7, #10

 b Lseal_main_loop

Lseal_tail:


 cmp x2, #64
 b.lt Lseal_tail_64


 ld1 {v20.16b - v23.16b}, [x1], #64

 eor v20.16b, v20.16b, v0.16b
 eor v21.16b, v21.16b, v5.16b
 eor v22.16b, v22.16b, v10.16b
 eor v23.16b, v23.16b, v15.16b
 mov x11, v20.d[0]
 mov x12, v20.d[1]
 adds x8, x8, x11
 adcs x9, x9, x12
 adc x10, x10, x15
 mul x11, x8, x16
 umulh x12, x8, x16
 mul x13, x9, x16
 umulh x14, x9, x16
 adds x12, x12, x13
 mul x13, x10, x16
 adc x13, x13, x14
 mul x14, x8, x17
 umulh x8, x8, x17
 adds x12, x12, x14
 mul x14, x9, x17
 umulh x9, x9, x17
 adcs x14, x14, x8
 mul x10, x10, x17
 adc x10, x10, x9
 adds x13, x13, x14
 adc x14, x10, xzr
 and x10, x13, #3
 and x8, x13, #-4
 extr x13, x14, x13, #2
 adds x8, x8, x11
 lsr x11, x14, #2
 adc x9, x14, x11
 adds x8, x8, x13
 adcs x9, x9, x12
 adc x10, x10, xzr
 mov x11, v21.d[0]
 mov x12, v21.d[1]
 adds x8, x8, x11
 adcs x9, x9, x12
 adc x10, x10, x15
 mul x11, x8, x16
 umulh x12, x8, x16
 mul x13, x9, x16
 umulh x14, x9, x16
 adds x12, x12, x13
 mul x13, x10, x16
 adc x13, x13, x14
 mul x14, x8, x17
 umulh x8, x8, x17
 adds x12, x12, x14
 mul x14, x9, x17
 umulh x9, x9, x17
 adcs x14, x14, x8
 mul x10, x10, x17
 adc x10, x10, x9
 adds x13, x13, x14
 adc x14, x10, xzr
 and x10, x13, #3
 and x8, x13, #-4
 extr x13, x14, x13, #2
 adds x8, x8, x11
 lsr x11, x14, #2
 adc x9, x14, x11
 adds x8, x8, x13
 adcs x9, x9, x12
 adc x10, x10, xzr
 mov x11, v22.d[0]
 mov x12, v22.d[1]
 adds x8, x8, x11
 adcs x9, x9, x12
 adc x10, x10, x15
 mul x11, x8, x16
 umulh x12, x8, x16
 mul x13, x9, x16
 umulh x14, x9, x16
 adds x12, x12, x13
 mul x13, x10, x16
 adc x13, x13, x14
 mul x14, x8, x17
 umulh x8, x8, x17
 adds x12, x12, x14
 mul x14, x9, x17
 umulh x9, x9, x17
 adcs x14, x14, x8
 mul x10, x10, x17
 adc x10, x10, x9
 adds x13, x13, x14
 adc x14, x10, xzr
 and x10, x13, #3
 and x8, x13, #-4
 extr x13, x14, x13, #2
 adds x8, x8, x11
 lsr x11, x14, #2
 adc x9, x14, x11
 adds x8, x8, x13
 adcs x9, x9, x12
 adc x10, x10, xzr
 mov x11, v23.d[0]
 mov x12, v23.d[1]
 adds x8, x8, x11
 adcs x9, x9, x12
 adc x10, x10, x15
 mul x11, x8, x16
 umulh x12, x8, x16
 mul x13, x9, x16
 umulh x14, x9, x16
 adds x12, x12, x13
 mul x13, x10, x16
 adc x13, x13, x14
 mul x14, x8, x17
 umulh x8, x8, x17
 adds x12, x12, x14
 mul x14, x9, x17
 umulh x9, x9, x17
 adcs x14, x14, x8
 mul x10, x10, x17
 adc x10, x10, x9
 adds x13, x13, x14
 adc x14, x10, xzr
 and x10, x13, #3
 and x8, x13, #-4
 extr x13, x14, x13, #2
 adds x8, x8, x11
 lsr x11, x14, #2
 adc x9, x14, x11
 adds x8, x8, x13
 adcs x9, x9, x12
 adc x10, x10, xzr
 st1 {v20.16b - v23.16b}, [x0], #64
 sub x2, x2, #64


 mov v0.16b, v1.16b
 mov v5.16b, v6.16b
 mov v10.16b, v11.16b
 mov v15.16b, v16.16b

 mov v1.16b, v2.16b
 mov v6.16b, v7.16b
 mov v11.16b, v12.16b
 mov v16.16b, v17.16b

 mov v2.16b, v3.16b
 mov v7.16b, v8.16b
 mov v12.16b, v13.16b
 mov v17.16b, v18.16b

 mov v3.16b, v4.16b
 mov v8.16b, v9.16b
 mov v13.16b, v14.16b
 mov v18.16b, v19.16b

 b Lseal_tail

Lseal_tail_64:
 ldp x3, x4, [x5, #48]


 cmp x2, #16
 b.lt Lseal_tail_16

 ld1 {v20.16b}, [x1], #16
 eor v20.16b, v20.16b, v0.16b
 mov x11, v20.d[0]
 mov x12, v20.d[1]
 adds x8, x8, x11
 adcs x9, x9, x12
 adc x10, x10, x15
 mul x11, x8, x16
 umulh x12, x8, x16
 mul x13, x9, x16
 umulh x14, x9, x16
 adds x12, x12, x13
 mul x13, x10, x16
 adc x13, x13, x14
 mul x14, x8, x17
 umulh x8, x8, x17
 adds x12, x12, x14
 mul x14, x9, x17
 umulh x9, x9, x17
 adcs x14, x14, x8
 mul x10, x10, x17
 adc x10, x10, x9
 adds x13, x13, x14
 adc x14, x10, xzr
 and x10, x13, #3
 and x8, x13, #-4
 extr x13, x14, x13, #2
 adds x8, x8, x11
 lsr x11, x14, #2
 adc x9, x14, x11
 adds x8, x8, x13
 adcs x9, x9, x12
 adc x10, x10, xzr
 st1 {v20.16b}, [x0], #16

 sub x2, x2, #16


 mov v0.16b, v5.16b
 mov v5.16b, v10.16b
 mov v10.16b, v15.16b

 b Lseal_tail_64

Lseal_tail_16:

 cbz x2, Lseal_hash_extra

 eor v20.16b, v20.16b, v20.16b
 eor v21.16b, v21.16b, v21.16b
 not v22.16b, v20.16b

 mov x6, x2
 add x1, x1, x2

 cbz x4, Lseal_tail_16_compose

 mov x7, #16
 sub x7, x7, x2
 cmp x4, x7
 csel x7, x4, x7, lt
 mov x12, x7
 add x3, x3, x7
 sub x4, x4, x7

Lseal_tail16_compose_extra_in:
 ext v20.16b, v20.16b, v20.16b, #15
 ldrb w11, [x3, #-1]!
 mov v20.b[0], w11
 subs x7, x7, #1
 b.gt Lseal_tail16_compose_extra_in

 add x3, x3, x12

Lseal_tail_16_compose:
 ext v20.16b, v20.16b, v20.16b, #15
 ldrb w11, [x1, #-1]!
 mov v20.b[0], w11
 ext v21.16b, v22.16b, v21.16b, #15
 subs x2, x2, #1
 b.gt Lseal_tail_16_compose

 and v0.16b, v0.16b, v21.16b
 eor v20.16b, v20.16b, v0.16b
 mov v21.16b, v20.16b

Lseal_tail_16_store:
 umov w11, v20.b[0]
 strb w11, [x0], #1
 ext v20.16b, v20.16b, v20.16b, #1
 subs x6, x6, #1
 b.gt Lseal_tail_16_store


 mov x11, v21.d[0]
 mov x12, v21.d[1]
 adds x8, x8, x11
 adcs x9, x9, x12
 adc x10, x10, x15
 mul x11, x8, x16
 umulh x12, x8, x16
 mul x13, x9, x16
 umulh x14, x9, x16
 adds x12, x12, x13
 mul x13, x10, x16
 adc x13, x13, x14
 mul x14, x8, x17
 umulh x8, x8, x17
 adds x12, x12, x14
 mul x14, x9, x17
 umulh x9, x9, x17
 adcs x14, x14, x8
 mul x10, x10, x17
 adc x10, x10, x9
 adds x13, x13, x14
 adc x14, x10, xzr
 and x10, x13, #3
 and x8, x13, #-4
 extr x13, x14, x13, #2
 adds x8, x8, x11
 lsr x11, x14, #2
 adc x9, x14, x11
 adds x8, x8, x13
 adcs x9, x9, x12
 adc x10, x10, xzr

Lseal_hash_extra:
 cbz x4, Lseal_finalize

Lseal_hash_extra_loop:
 cmp x4, #16
 b.lt Lseal_hash_extra_tail
 ld1 {v20.16b}, [x3], #16
 mov x11, v20.d[0]
 mov x12, v20.d[1]
 adds x8, x8, x11
 adcs x9, x9, x12
 adc x10, x10, x15
 mul x11, x8, x16
 umulh x12, x8, x16
 mul x13, x9, x16
 umulh x14, x9, x16
 adds x12, x12, x13
 mul x13, x10, x16
 adc x13, x13, x14
 mul x14, x8, x17
 umulh x8, x8, x17
 adds x12, x12, x14
 mul x14, x9, x17
 umulh x9, x9, x17
 adcs x14, x14, x8
 mul x10, x10, x17
 adc x10, x10, x9
 adds x13, x13, x14
 adc x14, x10, xzr
 and x10, x13, #3
 and x8, x13, #-4
 extr x13, x14, x13, #2
 adds x8, x8, x11
 lsr x11, x14, #2
 adc x9, x14, x11
 adds x8, x8, x13
 adcs x9, x9, x12
 adc x10, x10, xzr
 sub x4, x4, #16
 b Lseal_hash_extra_loop

Lseal_hash_extra_tail:
 cbz x4, Lseal_finalize
 eor v20.16b, v20.16b, v20.16b
 add x3, x3, x4

Lseal_hash_extra_load:
 ext v20.16b, v20.16b, v20.16b, #15
 ldrb w11, [x3, #-1]!
 mov v20.b[0], w11
 subs x4, x4, #1
 b.gt Lseal_hash_extra_load


 mov x11, v20.d[0]
 mov x12, v20.d[1]
 adds x8, x8, x11
 adcs x9, x9, x12
 adc x10, x10, x15
 mul x11, x8, x16
 umulh x12, x8, x16
 mul x13, x9, x16
 umulh x14, x9, x16
 adds x12, x12, x13
 mul x13, x10, x16
 adc x13, x13, x14
 mul x14, x8, x17
 umulh x8, x8, x17
 adds x12, x12, x14
 mul x14, x9, x17
 umulh x9, x9, x17
 adcs x14, x14, x8
 mul x10, x10, x17
 adc x10, x10, x9
 adds x13, x13, x14
 adc x14, x10, xzr
 and x10, x13, #3
 and x8, x13, #-4
 extr x13, x14, x13, #2
 adds x8, x8, x11
 lsr x11, x14, #2
 adc x9, x14, x11
 adds x8, x8, x13
 adcs x9, x9, x12
 adc x10, x10, xzr

Lseal_finalize:
 mov x11, v31.d[0]
 mov x12, v31.d[1]
 adds x8, x8, x11
 adcs x9, x9, x12
 adc x10, x10, x15
 mul x11, x8, x16
 umulh x12, x8, x16
 mul x13, x9, x16
 umulh x14, x9, x16
 adds x12, x12, x13
 mul x13, x10, x16
 adc x13, x13, x14
 mul x14, x8, x17
 umulh x8, x8, x17
 adds x12, x12, x14
 mul x14, x9, x17
 umulh x9, x9, x17
 adcs x14, x14, x8
 mul x10, x10, x17
 adc x10, x10, x9
 adds x13, x13, x14
 adc x14, x10, xzr
 and x10, x13, #3
 and x8, x13, #-4
 extr x13, x14, x13, #2
 adds x8, x8, x11
 lsr x11, x14, #2
 adc x9, x14, x11
 adds x8, x8, x13
 adcs x9, x9, x12
 adc x10, x10, xzr

 sub x12, xzr, x15
 orr x13, xzr, #3
 subs x11, x8, #-5
 sbcs x12, x9, x12
 sbcs x13, x10, x13
 csel x8, x11, x8, cs
 csel x9, x12, x9, cs
 csel x10, x13, x10, cs
 mov x11, v27.d[0]
 mov x12, v27.d[1]
 adds x8, x8, x11
 adcs x9, x9, x12
 adc x10, x10, x15

 stp x8, x9, [x5]

 ldp d8, d9, [sp, #16]
 ldp d10, d11, [sp, #32]
 ldp d12, d13, [sp, #48]
 ldp d14, d15, [sp, #64]
.cfi_restore b15
.cfi_restore b14
.cfi_restore b13
.cfi_restore b12
.cfi_restore b11
.cfi_restore b10
.cfi_restore b9
.cfi_restore b8
 ldp x29, x30, [sp], 80
.cfi_restore w29
.cfi_restore w30
.cfi_def_cfa_offset 0

 ret

Lseal_128:

 eor v25.16b, v25.16b, v25.16b
 mov x11, #1
 mov v25.s[0], w11
 mov v0.16b, v24.16b
 mov v1.16b, v24.16b
 mov v2.16b, v24.16b
 mov v5.16b, v28.16b
 mov v6.16b, v28.16b
 mov v7.16b, v28.16b
 mov v10.16b, v29.16b
 mov v11.16b, v29.16b
 mov v12.16b, v29.16b
 mov v17.16b, v30.16b
 add v15.4s, v17.4s, v25.4s
 add v16.4s, v15.4s, v25.4s

 mov x6, #10

Lseal_128_rounds:
 add v0.4s, v0.4s, v5.4s
 add v1.4s, v1.4s, v6.4s
 add v2.4s, v2.4s, v7.4s
 eor v15.16b, v15.16b, v0.16b
 eor v16.16b, v16.16b, v1.16b
 eor v17.16b, v17.16b, v2.16b
 rev32 v15.8h, v15.8h
 rev32 v16.8h, v16.8h
 rev32 v17.8h, v17.8h

 add v10.4s, v10.4s, v15.4s
 add v11.4s, v11.4s, v16.4s
 add v12.4s, v12.4s, v17.4s
 eor v5.16b, v5.16b, v10.16b
 eor v6.16b, v6.16b, v11.16b
 eor v7.16b, v7.16b, v12.16b
 ushr v20.4s, v5.4s, #20
 sli v20.4s, v5.4s, #12
 ushr v5.4s, v6.4s, #20
 sli v5.4s, v6.4s, #12
 ushr v6.4s, v7.4s, #20
 sli v6.4s, v7.4s, #12

 add v0.4s, v0.4s, v20.4s
 add v1.4s, v1.4s, v5.4s
 add v2.4s, v2.4s, v6.4s
 eor v15.16b, v15.16b, v0.16b
 eor v16.16b, v16.16b, v1.16b
 eor v17.16b, v17.16b, v2.16b
 tbl v15.16b, {v15.16b}, v26.16b
 tbl v16.16b, {v16.16b}, v26.16b
 tbl v17.16b, {v17.16b}, v26.16b

 add v10.4s, v10.4s, v15.4s
 add v11.4s, v11.4s, v16.4s
 add v12.4s, v12.4s, v17.4s
 eor v20.16b, v20.16b, v10.16b
 eor v5.16b, v5.16b, v11.16b
 eor v6.16b, v6.16b, v12.16b
 ushr v7.4s, v6.4s, #25
 sli v7.4s, v6.4s, #7
 ushr v6.4s, v5.4s, #25
 sli v6.4s, v5.4s, #7
 ushr v5.4s, v20.4s, #25
 sli v5.4s, v20.4s, #7

 ext v5.16b, v5.16b, v5.16b, #4
 ext v6.16b, v6.16b, v6.16b, #4
 ext v7.16b, v7.16b, v7.16b, #4

 ext v10.16b, v10.16b, v10.16b, #8
 ext v11.16b, v11.16b, v11.16b, #8
 ext v12.16b, v12.16b, v12.16b, #8

 ext v15.16b, v15.16b, v15.16b, #12
 ext v16.16b, v16.16b, v16.16b, #12
 ext v17.16b, v17.16b, v17.16b, #12
 add v0.4s, v0.4s, v5.4s
 add v1.4s, v1.4s, v6.4s
 add v2.4s, v2.4s, v7.4s
 eor v15.16b, v15.16b, v0.16b
 eor v16.16b, v16.16b, v1.16b
 eor v17.16b, v17.16b, v2.16b
 rev32 v15.8h, v15.8h
 rev32 v16.8h, v16.8h
 rev32 v17.8h, v17.8h

 add v10.4s, v10.4s, v15.4s
 add v11.4s, v11.4s, v16.4s
 add v12.4s, v12.4s, v17.4s
 eor v5.16b, v5.16b, v10.16b
 eor v6.16b, v6.16b, v11.16b
 eor v7.16b, v7.16b, v12.16b
 ushr v20.4s, v5.4s, #20
 sli v20.4s, v5.4s, #12
 ushr v5.4s, v6.4s, #20
 sli v5.4s, v6.4s, #12
 ushr v6.4s, v7.4s, #20
 sli v6.4s, v7.4s, #12

 add v0.4s, v0.4s, v20.4s
 add v1.4s, v1.4s, v5.4s
 add v2.4s, v2.4s, v6.4s
 eor v15.16b, v15.16b, v0.16b
 eor v16.16b, v16.16b, v1.16b
 eor v17.16b, v17.16b, v2.16b
 tbl v15.16b, {v15.16b}, v26.16b
 tbl v16.16b, {v16.16b}, v26.16b
 tbl v17.16b, {v17.16b}, v26.16b

 add v10.4s, v10.4s, v15.4s
 add v11.4s, v11.4s, v16.4s
 add v12.4s, v12.4s, v17.4s
 eor v20.16b, v20.16b, v10.16b
 eor v5.16b, v5.16b, v11.16b
 eor v6.16b, v6.16b, v12.16b
 ushr v7.4s, v6.4s, #25
 sli v7.4s, v6.4s, #7
 ushr v6.4s, v5.4s, #25
 sli v6.4s, v5.4s, #7
 ushr v5.4s, v20.4s, #25
 sli v5.4s, v20.4s, #7

 ext v5.16b, v5.16b, v5.16b, #12
 ext v6.16b, v6.16b, v6.16b, #12
 ext v7.16b, v7.16b, v7.16b, #12

 ext v10.16b, v10.16b, v10.16b, #8
 ext v11.16b, v11.16b, v11.16b, #8
 ext v12.16b, v12.16b, v12.16b, #8

 ext v15.16b, v15.16b, v15.16b, #4
 ext v16.16b, v16.16b, v16.16b, #4
 ext v17.16b, v17.16b, v17.16b, #4
 subs x6, x6, #1
 b.hi Lseal_128_rounds

 add v0.4s, v0.4s, v24.4s
 add v1.4s, v1.4s, v24.4s
 add v2.4s, v2.4s, v24.4s

 add v5.4s, v5.4s, v28.4s
 add v6.4s, v6.4s, v28.4s
 add v7.4s, v7.4s, v28.4s



 add v10.4s, v10.4s, v29.4s
 add v11.4s, v11.4s, v29.4s

 add v30.4s, v30.4s, v25.4s
 add v15.4s, v15.4s, v30.4s
 add v30.4s, v30.4s, v25.4s
 add v16.4s, v16.4s, v30.4s

 and v2.16b, v2.16b, v27.16b
 mov x16, v2.d[0]
 mov x17, v2.d[1]
 mov v27.16b, v7.16b

 bl Lpoly_hash_ad_internal
 b Lseal_tail
.cfi_endproc






.globl _aws_lc_0_27_1_chacha20_poly1305_open
.private_extern _aws_lc_0_27_1_chacha20_poly1305_open

.align 6
_aws_lc_0_27_1_chacha20_poly1305_open:

.cfi_startproc
 stp x29, x30, [sp, #-80]!
.cfi_def_cfa_offset 80
.cfi_offset w30, -72
.cfi_offset w29, -80
 mov x29, sp



 stp d8, d9, [sp, #16]
 stp d10, d11, [sp, #32]
 stp d12, d13, [sp, #48]
 stp d14, d15, [sp, #64]
.cfi_offset b15, -8
.cfi_offset b14, -16
.cfi_offset b13, -24
.cfi_offset b12, -32
.cfi_offset b11, -40
.cfi_offset b10, -48
.cfi_offset b9, -56
.cfi_offset b8, -64

 adrp x11, Lchacha20_consts@PAGE
 add x11, x11, Lchacha20_consts@PAGEOFF

 ld1 {v24.16b - v27.16b}, [x11]
 ld1 {v28.16b - v30.16b}, [x5]

 mov x15, #1
 mov x8, #0
 mov x9, #0
 mov x10, #0

 mov v31.d[0], x4
 mov v31.d[1], x2

 cmp x2, #128
 b.le Lopen_128


 mov v0.16b, v24.16b
 mov v5.16b, v28.16b
 mov v10.16b, v29.16b
 mov v15.16b, v30.16b

 mov x6, #10

.align 5
Lopen_init_rounds:
 add v0.4s, v0.4s, v5.4s
 eor v15.16b, v15.16b, v0.16b
 rev32 v15.8h, v15.8h

 add v10.4s, v10.4s, v15.4s
 eor v5.16b, v5.16b, v10.16b
 ushr v20.4s, v5.4s, #20
 sli v20.4s, v5.4s, #12
 add v0.4s, v0.4s, v20.4s
 eor v15.16b, v15.16b, v0.16b
 tbl v15.16b, {v15.16b}, v26.16b

 add v10.4s, v10.4s, v15.4s
 eor v20.16b, v20.16b, v10.16b
 ushr v5.4s, v20.4s, #25
 sli v5.4s, v20.4s, #7
 ext v5.16b, v5.16b, v5.16b, #4
 ext v10.16b, v10.16b, v10.16b, #8
 ext v15.16b, v15.16b, v15.16b, #12
 add v0.4s, v0.4s, v5.4s
 eor v15.16b, v15.16b, v0.16b
 rev32 v15.8h, v15.8h

 add v10.4s, v10.4s, v15.4s
 eor v5.16b, v5.16b, v10.16b
 ushr v20.4s, v5.4s, #20
 sli v20.4s, v5.4s, #12
 add v0.4s, v0.4s, v20.4s
 eor v15.16b, v15.16b, v0.16b
 tbl v15.16b, {v15.16b}, v26.16b

 add v10.4s, v10.4s, v15.4s
 eor v20.16b, v20.16b, v10.16b
 ushr v5.4s, v20.4s, #25
 sli v5.4s, v20.4s, #7
 ext v5.16b, v5.16b, v5.16b, #12
 ext v10.16b, v10.16b, v10.16b, #8
 ext v15.16b, v15.16b, v15.16b, #4
 subs x6, x6, #1
 b.hi Lopen_init_rounds

 add v0.4s, v0.4s, v24.4s
 add v5.4s, v5.4s, v28.4s

 and v0.16b, v0.16b, v27.16b
 mov x16, v0.d[0]
 mov x17, v0.d[1]
 mov v27.16b, v5.16b

 bl Lpoly_hash_ad_internal

Lopen_ad_done:
 mov x3, x1


Lopen_main_loop:

 cmp x2, #192
 b.lt Lopen_tail

 adrp x11, Lchacha20_consts@PAGE
 add x11, x11, Lchacha20_consts@PAGEOFF

 ld4r {v0.4s,v1.4s,v2.4s,v3.4s}, [x11]
 mov v4.16b, v24.16b

 ld4r {v5.4s,v6.4s,v7.4s,v8.4s}, [x5], #16
 mov v9.16b, v28.16b

 ld4r {v10.4s,v11.4s,v12.4s,v13.4s}, [x5], #16
 mov v14.16b, v29.16b

 ld4r {v15.4s,v16.4s,v17.4s,v18.4s}, [x5]
 sub x5, x5, #32
 add v15.4s, v15.4s, v25.4s
 mov v19.16b, v30.16b

 eor v20.16b, v20.16b, v20.16b
 not v21.16b, v20.16b
 sub v21.4s, v25.4s, v21.4s
 ext v20.16b, v21.16b, v20.16b, #12
 add v19.4s, v19.4s, v20.4s

 lsr x4, x2, #4
 sub x4, x4, #10

 mov x7, #10
 subs x6, x7, x4
 subs x6, x7, x4
 csel x7, x7, x4, le

 cbz x7, Lopen_main_loop_rounds_short

.align 5
Lopen_main_loop_rounds:
 ldp x11, x12, [x3], 16
 adds x8, x8, x11
 adcs x9, x9, x12
 adc x10, x10, x15
 mul x11, x8, x16
 umulh x12, x8, x16
 mul x13, x9, x16
 umulh x14, x9, x16
 adds x12, x12, x13
 mul x13, x10, x16
 adc x13, x13, x14
 mul x14, x8, x17
 umulh x8, x8, x17
 adds x12, x12, x14
 mul x14, x9, x17
 umulh x9, x9, x17
 adcs x14, x14, x8
 mul x10, x10, x17
 adc x10, x10, x9
 adds x13, x13, x14
 adc x14, x10, xzr
 and x10, x13, #3
 and x8, x13, #-4
 extr x13, x14, x13, #2
 adds x8, x8, x11
 lsr x11, x14, #2
 adc x9, x14, x11
 adds x8, x8, x13
 adcs x9, x9, x12
 adc x10, x10, xzr
Lopen_main_loop_rounds_short:
 add v0.4s, v0.4s, v5.4s
 add v1.4s, v1.4s, v6.4s
 add v2.4s, v2.4s, v7.4s
 add v3.4s, v3.4s, v8.4s
 add v4.4s, v4.4s, v9.4s

 eor v15.16b, v15.16b, v0.16b
 eor v16.16b, v16.16b, v1.16b
 eor v17.16b, v17.16b, v2.16b
 eor v18.16b, v18.16b, v3.16b
 eor v19.16b, v19.16b, v4.16b

 rev32 v15.8h, v15.8h
 rev32 v16.8h, v16.8h
 rev32 v17.8h, v17.8h
 rev32 v18.8h, v18.8h
 rev32 v19.8h, v19.8h

 add v10.4s, v10.4s, v15.4s
 add v11.4s, v11.4s, v16.4s
 add v12.4s, v12.4s, v17.4s
 add v13.4s, v13.4s, v18.4s
 add v14.4s, v14.4s, v19.4s

 eor v5.16b, v5.16b, v10.16b
 eor v6.16b, v6.16b, v11.16b
 eor v7.16b, v7.16b, v12.16b
 eor v8.16b, v8.16b, v13.16b
 eor v9.16b, v9.16b, v14.16b

 ushr v20.4s, v5.4s, #20
 sli v20.4s, v5.4s, #12
 ushr v5.4s, v6.4s, #20
 sli v5.4s, v6.4s, #12
 ushr v6.4s, v7.4s, #20
 sli v6.4s, v7.4s, #12
 ushr v7.4s, v8.4s, #20
 sli v7.4s, v8.4s, #12
 ushr v8.4s, v9.4s, #20
 sli v8.4s, v9.4s, #12

 add v0.4s, v0.4s, v20.4s
 add v1.4s, v1.4s, v5.4s
 add v2.4s, v2.4s, v6.4s
 add v3.4s, v3.4s, v7.4s
 add v4.4s, v4.4s, v8.4s

 eor v15.16b, v15.16b, v0.16b
 eor v16.16b, v16.16b, v1.16b
 eor v17.16b, v17.16b, v2.16b
 eor v18.16b, v18.16b, v3.16b
 eor v19.16b, v19.16b, v4.16b

 tbl v15.16b, {v15.16b}, v26.16b
 tbl v16.16b, {v16.16b}, v26.16b
 tbl v17.16b, {v17.16b}, v26.16b
 tbl v18.16b, {v18.16b}, v26.16b
 tbl v19.16b, {v19.16b}, v26.16b

 add v10.4s, v10.4s, v15.4s
 add v11.4s, v11.4s, v16.4s
 add v12.4s, v12.4s, v17.4s
 add v13.4s, v13.4s, v18.4s
 add v14.4s, v14.4s, v19.4s

 eor v20.16b, v20.16b, v10.16b
 eor v5.16b, v5.16b, v11.16b
 eor v6.16b, v6.16b, v12.16b
 eor v7.16b, v7.16b, v13.16b
 eor v8.16b, v8.16b, v14.16b

 ushr v9.4s, v8.4s, #25
 sli v9.4s, v8.4s, #7
 ushr v8.4s, v7.4s, #25
 sli v8.4s, v7.4s, #7
 ushr v7.4s, v6.4s, #25
 sli v7.4s, v6.4s, #7
 ushr v6.4s, v5.4s, #25
 sli v6.4s, v5.4s, #7
 ushr v5.4s, v20.4s, #25
 sli v5.4s, v20.4s, #7

 ext v9.16b, v9.16b, v9.16b, #4
 ext v14.16b, v14.16b, v14.16b, #8
 ext v19.16b, v19.16b, v19.16b, #12
 ldp x11, x12, [x3], 16
 adds x8, x8, x11
 adcs x9, x9, x12
 adc x10, x10, x15
 mul x11, x8, x16
 umulh x12, x8, x16
 mul x13, x9, x16
 umulh x14, x9, x16
 adds x12, x12, x13
 mul x13, x10, x16
 adc x13, x13, x14
 mul x14, x8, x17
 umulh x8, x8, x17
 adds x12, x12, x14
 mul x14, x9, x17
 umulh x9, x9, x17
 adcs x14, x14, x8
 mul x10, x10, x17
 adc x10, x10, x9
 adds x13, x13, x14
 adc x14, x10, xzr
 and x10, x13, #3
 and x8, x13, #-4
 extr x13, x14, x13, #2
 adds x8, x8, x11
 lsr x11, x14, #2
 adc x9, x14, x11
 adds x8, x8, x13
 adcs x9, x9, x12
 adc x10, x10, xzr
 add v0.4s, v0.4s, v6.4s
 add v1.4s, v1.4s, v7.4s
 add v2.4s, v2.4s, v8.4s
 add v3.4s, v3.4s, v5.4s
 add v4.4s, v4.4s, v9.4s

 eor v18.16b, v18.16b, v0.16b
 eor v15.16b, v15.16b, v1.16b
 eor v16.16b, v16.16b, v2.16b
 eor v17.16b, v17.16b, v3.16b
 eor v19.16b, v19.16b, v4.16b

 rev32 v18.8h, v18.8h
 rev32 v15.8h, v15.8h
 rev32 v16.8h, v16.8h
 rev32 v17.8h, v17.8h
 rev32 v19.8h, v19.8h

 add v12.4s, v12.4s, v18.4s
 add v13.4s, v13.4s, v15.4s
 add v10.4s, v10.4s, v16.4s
 add v11.4s, v11.4s, v17.4s
 add v14.4s, v14.4s, v19.4s

 eor v6.16b, v6.16b, v12.16b
 eor v7.16b, v7.16b, v13.16b
 eor v8.16b, v8.16b, v10.16b
 eor v5.16b, v5.16b, v11.16b
 eor v9.16b, v9.16b, v14.16b

 ushr v20.4s, v6.4s, #20
 sli v20.4s, v6.4s, #12
 ushr v6.4s, v7.4s, #20
 sli v6.4s, v7.4s, #12
 ushr v7.4s, v8.4s, #20
 sli v7.4s, v8.4s, #12
 ushr v8.4s, v5.4s, #20
 sli v8.4s, v5.4s, #12
 ushr v5.4s, v9.4s, #20
 sli v5.4s, v9.4s, #12

 add v0.4s, v0.4s, v20.4s
 add v1.4s, v1.4s, v6.4s
 add v2.4s, v2.4s, v7.4s
 add v3.4s, v3.4s, v8.4s
 add v4.4s, v4.4s, v5.4s

 eor v18.16b, v18.16b, v0.16b
 eor v15.16b, v15.16b, v1.16b
 eor v16.16b, v16.16b, v2.16b
 eor v17.16b, v17.16b, v3.16b
 eor v19.16b, v19.16b, v4.16b

 tbl v18.16b, {v18.16b}, v26.16b
 tbl v15.16b, {v15.16b}, v26.16b
 tbl v16.16b, {v16.16b}, v26.16b
 tbl v17.16b, {v17.16b}, v26.16b
 tbl v19.16b, {v19.16b}, v26.16b

 add v12.4s, v12.4s, v18.4s
 add v13.4s, v13.4s, v15.4s
 add v10.4s, v10.4s, v16.4s
 add v11.4s, v11.4s, v17.4s
 add v14.4s, v14.4s, v19.4s

 eor v20.16b, v20.16b, v12.16b
 eor v6.16b, v6.16b, v13.16b
 eor v7.16b, v7.16b, v10.16b
 eor v8.16b, v8.16b, v11.16b
 eor v5.16b, v5.16b, v14.16b

 ushr v9.4s, v5.4s, #25
 sli v9.4s, v5.4s, #7
 ushr v5.4s, v8.4s, #25
 sli v5.4s, v8.4s, #7
 ushr v8.4s, v7.4s, #25
 sli v8.4s, v7.4s, #7
 ushr v7.4s, v6.4s, #25
 sli v7.4s, v6.4s, #7
 ushr v6.4s, v20.4s, #25
 sli v6.4s, v20.4s, #7

 ext v9.16b, v9.16b, v9.16b, #12
 ext v14.16b, v14.16b, v14.16b, #8
 ext v19.16b, v19.16b, v19.16b, #4
 subs x7, x7, #1
 b.gt Lopen_main_loop_rounds
 subs x6, x6, #1
 b.ge Lopen_main_loop_rounds_short

 eor v20.16b, v20.16b, v20.16b
 not v21.16b, v20.16b
 sub v21.4s, v25.4s, v21.4s
 ext v20.16b, v21.16b, v20.16b, #12
 add v19.4s, v19.4s, v20.4s

 add v15.4s, v15.4s, v25.4s
 mov x11, #5
 dup v20.4s, w11
 add v25.4s, v25.4s, v20.4s

 zip1 v20.4s, v0.4s, v1.4s
 zip2 v21.4s, v0.4s, v1.4s
 zip1 v22.4s, v2.4s, v3.4s
 zip2 v23.4s, v2.4s, v3.4s

 zip1 v0.2d, v20.2d, v22.2d
 zip2 v1.2d, v20.2d, v22.2d
 zip1 v2.2d, v21.2d, v23.2d
 zip2 v3.2d, v21.2d, v23.2d

 zip1 v20.4s, v5.4s, v6.4s
 zip2 v21.4s, v5.4s, v6.4s
 zip1 v22.4s, v7.4s, v8.4s
 zip2 v23.4s, v7.4s, v8.4s

 zip1 v5.2d, v20.2d, v22.2d
 zip2 v6.2d, v20.2d, v22.2d
 zip1 v7.2d, v21.2d, v23.2d
 zip2 v8.2d, v21.2d, v23.2d

 zip1 v20.4s, v10.4s, v11.4s
 zip2 v21.4s, v10.4s, v11.4s
 zip1 v22.4s, v12.4s, v13.4s
 zip2 v23.4s, v12.4s, v13.4s

 zip1 v10.2d, v20.2d, v22.2d
 zip2 v11.2d, v20.2d, v22.2d
 zip1 v12.2d, v21.2d, v23.2d
 zip2 v13.2d, v21.2d, v23.2d

 zip1 v20.4s, v15.4s, v16.4s
 zip2 v21.4s, v15.4s, v16.4s
 zip1 v22.4s, v17.4s, v18.4s
 zip2 v23.4s, v17.4s, v18.4s

 zip1 v15.2d, v20.2d, v22.2d
 zip2 v16.2d, v20.2d, v22.2d
 zip1 v17.2d, v21.2d, v23.2d
 zip2 v18.2d, v21.2d, v23.2d

 add v0.4s, v0.4s, v24.4s
 add v5.4s, v5.4s, v28.4s
 add v10.4s, v10.4s, v29.4s
 add v15.4s, v15.4s, v30.4s

 add v1.4s, v1.4s, v24.4s
 add v6.4s, v6.4s, v28.4s
 add v11.4s, v11.4s, v29.4s
 add v16.4s, v16.4s, v30.4s

 add v2.4s, v2.4s, v24.4s
 add v7.4s, v7.4s, v28.4s
 add v12.4s, v12.4s, v29.4s
 add v17.4s, v17.4s, v30.4s

 add v3.4s, v3.4s, v24.4s
 add v8.4s, v8.4s, v28.4s
 add v13.4s, v13.4s, v29.4s
 add v18.4s, v18.4s, v30.4s

 add v4.4s, v4.4s, v24.4s
 add v9.4s, v9.4s, v28.4s
 add v14.4s, v14.4s, v29.4s
 add v19.4s, v19.4s, v30.4s


 ld1 {v20.16b - v23.16b}, [x1], #64
 eor v20.16b, v20.16b, v0.16b
 eor v21.16b, v21.16b, v5.16b
 eor v22.16b, v22.16b, v10.16b
 eor v23.16b, v23.16b, v15.16b
 st1 {v20.16b - v23.16b}, [x0], #64

 ld1 {v20.16b - v23.16b}, [x1], #64
 eor v20.16b, v20.16b, v1.16b
 eor v21.16b, v21.16b, v6.16b
 eor v22.16b, v22.16b, v11.16b
 eor v23.16b, v23.16b, v16.16b
 st1 {v20.16b - v23.16b}, [x0], #64

 ld1 {v20.16b - v23.16b}, [x1], #64
 eor v20.16b, v20.16b, v2.16b
 eor v21.16b, v21.16b, v7.16b
 eor v22.16b, v22.16b, v12.16b
 eor v23.16b, v23.16b, v17.16b
 st1 {v20.16b - v23.16b}, [x0], #64

 sub x2, x2, #192

 mov v0.16b, v3.16b
 mov v5.16b, v8.16b
 mov v10.16b, v13.16b
 mov v15.16b, v18.16b

 cmp x2, #64
 b.lt Lopen_tail_64_store

 ld1 {v20.16b - v23.16b}, [x1], #64
 eor v20.16b, v20.16b, v3.16b
 eor v21.16b, v21.16b, v8.16b
 eor v22.16b, v22.16b, v13.16b
 eor v23.16b, v23.16b, v18.16b
 st1 {v20.16b - v23.16b}, [x0], #64

 sub x2, x2, #64

 mov v0.16b, v4.16b
 mov v5.16b, v9.16b
 mov v10.16b, v14.16b
 mov v15.16b, v19.16b

 cmp x2, #64
 b.lt Lopen_tail_64_store

 ld1 {v20.16b - v23.16b}, [x1], #64
 eor v20.16b, v20.16b, v4.16b
 eor v21.16b, v21.16b, v9.16b
 eor v22.16b, v22.16b, v14.16b
 eor v23.16b, v23.16b, v19.16b
 st1 {v20.16b - v23.16b}, [x0], #64

 sub x2, x2, #64
 b Lopen_main_loop

Lopen_tail:

 cbz x2, Lopen_finalize

 lsr x4, x2, #4

 cmp x2, #64
 b.le Lopen_tail_64
 cmp x2, #128
 b.le Lopen_tail_128

Lopen_tail_192:

 mov v0.16b, v24.16b
 mov v1.16b, v24.16b
 mov v2.16b, v24.16b
 mov v5.16b, v28.16b
 mov v6.16b, v28.16b
 mov v7.16b, v28.16b
 mov v10.16b, v29.16b
 mov v11.16b, v29.16b
 mov v12.16b, v29.16b
 mov v15.16b, v30.16b
 mov v16.16b, v30.16b
 mov v17.16b, v30.16b
 eor v23.16b, v23.16b, v23.16b
 eor v21.16b, v21.16b, v21.16b
 ins v23.s[0], v25.s[0]
 ins v21.d[0], x15

 add v22.4s, v23.4s, v21.4s
 add v21.4s, v22.4s, v21.4s

 add v15.4s, v15.4s, v21.4s
 add v16.4s, v16.4s, v23.4s
 add v17.4s, v17.4s, v22.4s

 mov x7, #10
 subs x6, x7, x4
 csel x7, x7, x4, le
 sub x4, x4, x7

 cbz x7, Lopen_tail_192_rounds_no_hash

Lopen_tail_192_rounds:
 ldp x11, x12, [x3], 16
 adds x8, x8, x11
 adcs x9, x9, x12
 adc x10, x10, x15
 mul x11, x8, x16
 umulh x12, x8, x16
 mul x13, x9, x16
 umulh x14, x9, x16
 adds x12, x12, x13
 mul x13, x10, x16
 adc x13, x13, x14
 mul x14, x8, x17
 umulh x8, x8, x17
 adds x12, x12, x14
 mul x14, x9, x17
 umulh x9, x9, x17
 adcs x14, x14, x8
 mul x10, x10, x17
 adc x10, x10, x9
 adds x13, x13, x14
 adc x14, x10, xzr
 and x10, x13, #3
 and x8, x13, #-4
 extr x13, x14, x13, #2
 adds x8, x8, x11
 lsr x11, x14, #2
 adc x9, x14, x11
 adds x8, x8, x13
 adcs x9, x9, x12
 adc x10, x10, xzr
Lopen_tail_192_rounds_no_hash:
 add v0.4s, v0.4s, v5.4s
 add v1.4s, v1.4s, v6.4s
 add v2.4s, v2.4s, v7.4s
 eor v15.16b, v15.16b, v0.16b
 eor v16.16b, v16.16b, v1.16b
 eor v17.16b, v17.16b, v2.16b
 rev32 v15.8h, v15.8h
 rev32 v16.8h, v16.8h
 rev32 v17.8h, v17.8h

 add v10.4s, v10.4s, v15.4s
 add v11.4s, v11.4s, v16.4s
 add v12.4s, v12.4s, v17.4s
 eor v5.16b, v5.16b, v10.16b
 eor v6.16b, v6.16b, v11.16b
 eor v7.16b, v7.16b, v12.16b
 ushr v20.4s, v5.4s, #20
 sli v20.4s, v5.4s, #12
 ushr v5.4s, v6.4s, #20
 sli v5.4s, v6.4s, #12
 ushr v6.4s, v7.4s, #20
 sli v6.4s, v7.4s, #12

 add v0.4s, v0.4s, v20.4s
 add v1.4s, v1.4s, v5.4s
 add v2.4s, v2.4s, v6.4s
 eor v15.16b, v15.16b, v0.16b
 eor v16.16b, v16.16b, v1.16b
 eor v17.16b, v17.16b, v2.16b
 tbl v15.16b, {v15.16b}, v26.16b
 tbl v16.16b, {v16.16b}, v26.16b
 tbl v17.16b, {v17.16b}, v26.16b

 add v10.4s, v10.4s, v15.4s
 add v11.4s, v11.4s, v16.4s
 add v12.4s, v12.4s, v17.4s
 eor v20.16b, v20.16b, v10.16b
 eor v5.16b, v5.16b, v11.16b
 eor v6.16b, v6.16b, v12.16b
 ushr v7.4s, v6.4s, #25
 sli v7.4s, v6.4s, #7
 ushr v6.4s, v5.4s, #25
 sli v6.4s, v5.4s, #7
 ushr v5.4s, v20.4s, #25
 sli v5.4s, v20.4s, #7

 ext v5.16b, v5.16b, v5.16b, #4
 ext v6.16b, v6.16b, v6.16b, #4
 ext v7.16b, v7.16b, v7.16b, #4

 ext v10.16b, v10.16b, v10.16b, #8
 ext v11.16b, v11.16b, v11.16b, #8
 ext v12.16b, v12.16b, v12.16b, #8

 ext v15.16b, v15.16b, v15.16b, #12
 ext v16.16b, v16.16b, v16.16b, #12
 ext v17.16b, v17.16b, v17.16b, #12
 add v0.4s, v0.4s, v5.4s
 add v1.4s, v1.4s, v6.4s
 add v2.4s, v2.4s, v7.4s
 eor v15.16b, v15.16b, v0.16b
 eor v16.16b, v16.16b, v1.16b
 eor v17.16b, v17.16b, v2.16b
 rev32 v15.8h, v15.8h
 rev32 v16.8h, v16.8h
 rev32 v17.8h, v17.8h

 add v10.4s, v10.4s, v15.4s
 add v11.4s, v11.4s, v16.4s
 add v12.4s, v12.4s, v17.4s
 eor v5.16b, v5.16b, v10.16b
 eor v6.16b, v6.16b, v11.16b
 eor v7.16b, v7.16b, v12.16b
 ushr v20.4s, v5.4s, #20
 sli v20.4s, v5.4s, #12
 ushr v5.4s, v6.4s, #20
 sli v5.4s, v6.4s, #12
 ushr v6.4s, v7.4s, #20
 sli v6.4s, v7.4s, #12

 add v0.4s, v0.4s, v20.4s
 add v1.4s, v1.4s, v5.4s
 add v2.4s, v2.4s, v6.4s
 eor v15.16b, v15.16b, v0.16b
 eor v16.16b, v16.16b, v1.16b
 eor v17.16b, v17.16b, v2.16b
 tbl v15.16b, {v15.16b}, v26.16b
 tbl v16.16b, {v16.16b}, v26.16b
 tbl v17.16b, {v17.16b}, v26.16b

 add v10.4s, v10.4s, v15.4s
 add v11.4s, v11.4s, v16.4s
 add v12.4s, v12.4s, v17.4s
 eor v20.16b, v20.16b, v10.16b
 eor v5.16b, v5.16b, v11.16b
 eor v6.16b, v6.16b, v12.16b
 ushr v7.4s, v6.4s, #25
 sli v7.4s, v6.4s, #7
 ushr v6.4s, v5.4s, #25
 sli v6.4s, v5.4s, #7
 ushr v5.4s, v20.4s, #25
 sli v5.4s, v20.4s, #7

 ext v5.16b, v5.16b, v5.16b, #12
 ext v6.16b, v6.16b, v6.16b, #12
 ext v7.16b, v7.16b, v7.16b, #12

 ext v10.16b, v10.16b, v10.16b, #8
 ext v11.16b, v11.16b, v11.16b, #8
 ext v12.16b, v12.16b, v12.16b, #8

 ext v15.16b, v15.16b, v15.16b, #4
 ext v16.16b, v16.16b, v16.16b, #4
 ext v17.16b, v17.16b, v17.16b, #4
 subs x7, x7, #1
 b.gt Lopen_tail_192_rounds
 subs x6, x6, #1
 b.ge Lopen_tail_192_rounds_no_hash


Lopen_tail_192_hash:
 cbz x4, Lopen_tail_192_hash_done
 ldp x11, x12, [x3], 16
 adds x8, x8, x11
 adcs x9, x9, x12
 adc x10, x10, x15
 mul x11, x8, x16
 umulh x12, x8, x16
 mul x13, x9, x16
 umulh x14, x9, x16
 adds x12, x12, x13
 mul x13, x10, x16
 adc x13, x13, x14
 mul x14, x8, x17
 umulh x8, x8, x17
 adds x12, x12, x14
 mul x14, x9, x17
 umulh x9, x9, x17
 adcs x14, x14, x8
 mul x10, x10, x17
 adc x10, x10, x9
 adds x13, x13, x14
 adc x14, x10, xzr
 and x10, x13, #3
 and x8, x13, #-4
 extr x13, x14, x13, #2
 adds x8, x8, x11
 lsr x11, x14, #2
 adc x9, x14, x11
 adds x8, x8, x13
 adcs x9, x9, x12
 adc x10, x10, xzr
 sub x4, x4, #1
 b Lopen_tail_192_hash

Lopen_tail_192_hash_done:

 add v0.4s, v0.4s, v24.4s
 add v1.4s, v1.4s, v24.4s
 add v2.4s, v2.4s, v24.4s
 add v5.4s, v5.4s, v28.4s
 add v6.4s, v6.4s, v28.4s
 add v7.4s, v7.4s, v28.4s
 add v10.4s, v10.4s, v29.4s
 add v11.4s, v11.4s, v29.4s
 add v12.4s, v12.4s, v29.4s
 add v15.4s, v15.4s, v30.4s
 add v16.4s, v16.4s, v30.4s
 add v17.4s, v17.4s, v30.4s

 add v15.4s, v15.4s, v21.4s
 add v16.4s, v16.4s, v23.4s
 add v17.4s, v17.4s, v22.4s

 ld1 {v20.16b - v23.16b}, [x1], #64

 eor v20.16b, v20.16b, v1.16b
 eor v21.16b, v21.16b, v6.16b
 eor v22.16b, v22.16b, v11.16b
 eor v23.16b, v23.16b, v16.16b

 st1 {v20.16b - v23.16b}, [x0], #64

 ld1 {v20.16b - v23.16b}, [x1], #64

 eor v20.16b, v20.16b, v2.16b
 eor v21.16b, v21.16b, v7.16b
 eor v22.16b, v22.16b, v12.16b
 eor v23.16b, v23.16b, v17.16b

 st1 {v20.16b - v23.16b}, [x0], #64

 sub x2, x2, #128
 b Lopen_tail_64_store

Lopen_tail_128:

 mov v0.16b, v24.16b
 mov v1.16b, v24.16b
 mov v5.16b, v28.16b
 mov v6.16b, v28.16b
 mov v10.16b, v29.16b
 mov v11.16b, v29.16b
 mov v15.16b, v30.16b
 mov v16.16b, v30.16b
 eor v23.16b, v23.16b, v23.16b
 eor v22.16b, v22.16b, v22.16b
 ins v23.s[0], v25.s[0]
 ins v22.d[0], x15
 add v22.4s, v22.4s, v23.4s

 add v15.4s, v15.4s, v22.4s
 add v16.4s, v16.4s, v23.4s

 mov x6, #10
 sub x6, x6, x4

Lopen_tail_128_rounds:
 add v0.4s, v0.4s, v5.4s
 eor v15.16b, v15.16b, v0.16b
 rev32 v15.8h, v15.8h

 add v10.4s, v10.4s, v15.4s
 eor v5.16b, v5.16b, v10.16b
 ushr v20.4s, v5.4s, #20
 sli v20.4s, v5.4s, #12
 add v0.4s, v0.4s, v20.4s
 eor v15.16b, v15.16b, v0.16b
 tbl v15.16b, {v15.16b}, v26.16b

 add v10.4s, v10.4s, v15.4s
 eor v20.16b, v20.16b, v10.16b
 ushr v5.4s, v20.4s, #25
 sli v5.4s, v20.4s, #7
 ext v5.16b, v5.16b, v5.16b, #4
 ext v10.16b, v10.16b, v10.16b, #8
 ext v15.16b, v15.16b, v15.16b, #12
 add v1.4s, v1.4s, v6.4s
 eor v16.16b, v16.16b, v1.16b
 rev32 v16.8h, v16.8h

 add v11.4s, v11.4s, v16.4s
 eor v6.16b, v6.16b, v11.16b
 ushr v20.4s, v6.4s, #20
 sli v20.4s, v6.4s, #12
 add v1.4s, v1.4s, v20.4s
 eor v16.16b, v16.16b, v1.16b
 tbl v16.16b, {v16.16b}, v26.16b

 add v11.4s, v11.4s, v16.4s
 eor v20.16b, v20.16b, v11.16b
 ushr v6.4s, v20.4s, #25
 sli v6.4s, v20.4s, #7
 ext v6.16b, v6.16b, v6.16b, #4
 ext v11.16b, v11.16b, v11.16b, #8
 ext v16.16b, v16.16b, v16.16b, #12
 add v0.4s, v0.4s, v5.4s
 eor v15.16b, v15.16b, v0.16b
 rev32 v15.8h, v15.8h

 add v10.4s, v10.4s, v15.4s
 eor v5.16b, v5.16b, v10.16b
 ushr v20.4s, v5.4s, #20
 sli v20.4s, v5.4s, #12
 add v0.4s, v0.4s, v20.4s
 eor v15.16b, v15.16b, v0.16b
 tbl v15.16b, {v15.16b}, v26.16b

 add v10.4s, v10.4s, v15.4s
 eor v20.16b, v20.16b, v10.16b
 ushr v5.4s, v20.4s, #25
 sli v5.4s, v20.4s, #7
 ext v5.16b, v5.16b, v5.16b, #12
 ext v10.16b, v10.16b, v10.16b, #8
 ext v15.16b, v15.16b, v15.16b, #4
 add v1.4s, v1.4s, v6.4s
 eor v16.16b, v16.16b, v1.16b
 rev32 v16.8h, v16.8h

 add v11.4s, v11.4s, v16.4s
 eor v6.16b, v6.16b, v11.16b
 ushr v20.4s, v6.4s, #20
 sli v20.4s, v6.4s, #12
 add v1.4s, v1.4s, v20.4s
 eor v16.16b, v16.16b, v1.16b
 tbl v16.16b, {v16.16b}, v26.16b

 add v11.4s, v11.4s, v16.4s
 eor v20.16b, v20.16b, v11.16b
 ushr v6.4s, v20.4s, #25
 sli v6.4s, v20.4s, #7
 ext v6.16b, v6.16b, v6.16b, #12
 ext v11.16b, v11.16b, v11.16b, #8
 ext v16.16b, v16.16b, v16.16b, #4
 subs x6, x6, #1
 b.gt Lopen_tail_128_rounds
 cbz x4, Lopen_tail_128_rounds_done
 subs x4, x4, #1
 ldp x11, x12, [x3], 16
 adds x8, x8, x11
 adcs x9, x9, x12
 adc x10, x10, x15
 mul x11, x8, x16
 umulh x12, x8, x16
 mul x13, x9, x16
 umulh x14, x9, x16
 adds x12, x12, x13
 mul x13, x10, x16
 adc x13, x13, x14
 mul x14, x8, x17
 umulh x8, x8, x17
 adds x12, x12, x14
 mul x14, x9, x17
 umulh x9, x9, x17
 adcs x14, x14, x8
 mul x10, x10, x17
 adc x10, x10, x9
 adds x13, x13, x14
 adc x14, x10, xzr
 and x10, x13, #3
 and x8, x13, #-4
 extr x13, x14, x13, #2
 adds x8, x8, x11
 lsr x11, x14, #2
 adc x9, x14, x11
 adds x8, x8, x13
 adcs x9, x9, x12
 adc x10, x10, xzr
 b Lopen_tail_128_rounds

Lopen_tail_128_rounds_done:
 add v0.4s, v0.4s, v24.4s
 add v1.4s, v1.4s, v24.4s
 add v5.4s, v5.4s, v28.4s
 add v6.4s, v6.4s, v28.4s
 add v10.4s, v10.4s, v29.4s
 add v11.4s, v11.4s, v29.4s
 add v15.4s, v15.4s, v30.4s
 add v16.4s, v16.4s, v30.4s
 add v15.4s, v15.4s, v22.4s
 add v16.4s, v16.4s, v23.4s

 ld1 {v20.16b - v23.16b}, [x1], #64

 eor v20.16b, v20.16b, v1.16b
 eor v21.16b, v21.16b, v6.16b
 eor v22.16b, v22.16b, v11.16b
 eor v23.16b, v23.16b, v16.16b

 st1 {v20.16b - v23.16b}, [x0], #64
 sub x2, x2, #64

 b Lopen_tail_64_store

Lopen_tail_64:

 mov v0.16b, v24.16b
 mov v5.16b, v28.16b
 mov v10.16b, v29.16b
 mov v15.16b, v30.16b
 eor v23.16b, v23.16b, v23.16b
 ins v23.s[0], v25.s[0]
 add v15.4s, v15.4s, v23.4s

 mov x6, #10
 sub x6, x6, x4

Lopen_tail_64_rounds:
 add v0.4s, v0.4s, v5.4s
 eor v15.16b, v15.16b, v0.16b
 rev32 v15.8h, v15.8h

 add v10.4s, v10.4s, v15.4s
 eor v5.16b, v5.16b, v10.16b
 ushr v20.4s, v5.4s, #20
 sli v20.4s, v5.4s, #12
 add v0.4s, v0.4s, v20.4s
 eor v15.16b, v15.16b, v0.16b
 tbl v15.16b, {v15.16b}, v26.16b

 add v10.4s, v10.4s, v15.4s
 eor v20.16b, v20.16b, v10.16b
 ushr v5.4s, v20.4s, #25
 sli v5.4s, v20.4s, #7
 ext v5.16b, v5.16b, v5.16b, #4
 ext v10.16b, v10.16b, v10.16b, #8
 ext v15.16b, v15.16b, v15.16b, #12
 add v0.4s, v0.4s, v5.4s
 eor v15.16b, v15.16b, v0.16b
 rev32 v15.8h, v15.8h

 add v10.4s, v10.4s, v15.4s
 eor v5.16b, v5.16b, v10.16b
 ushr v20.4s, v5.4s, #20
 sli v20.4s, v5.4s, #12
 add v0.4s, v0.4s, v20.4s
 eor v15.16b, v15.16b, v0.16b
 tbl v15.16b, {v15.16b}, v26.16b

 add v10.4s, v10.4s, v15.4s
 eor v20.16b, v20.16b, v10.16b
 ushr v5.4s, v20.4s, #25
 sli v5.4s, v20.4s, #7
 ext v5.16b, v5.16b, v5.16b, #12
 ext v10.16b, v10.16b, v10.16b, #8
 ext v15.16b, v15.16b, v15.16b, #4
 subs x6, x6, #1
 b.gt Lopen_tail_64_rounds
 cbz x4, Lopen_tail_64_rounds_done
 subs x4, x4, #1
 ldp x11, x12, [x3], 16
 adds x8, x8, x11
 adcs x9, x9, x12
 adc x10, x10, x15
 mul x11, x8, x16
 umulh x12, x8, x16
 mul x13, x9, x16
 umulh x14, x9, x16
 adds x12, x12, x13
 mul x13, x10, x16
 adc x13, x13, x14
 mul x14, x8, x17
 umulh x8, x8, x17
 adds x12, x12, x14
 mul x14, x9, x17
 umulh x9, x9, x17
 adcs x14, x14, x8
 mul x10, x10, x17
 adc x10, x10, x9
 adds x13, x13, x14
 adc x14, x10, xzr
 and x10, x13, #3
 and x8, x13, #-4
 extr x13, x14, x13, #2
 adds x8, x8, x11
 lsr x11, x14, #2
 adc x9, x14, x11
 adds x8, x8, x13
 adcs x9, x9, x12
 adc x10, x10, xzr
 b Lopen_tail_64_rounds

Lopen_tail_64_rounds_done:
 add v0.4s, v0.4s, v24.4s
 add v5.4s, v5.4s, v28.4s
 add v10.4s, v10.4s, v29.4s
 add v15.4s, v15.4s, v30.4s
 add v15.4s, v15.4s, v23.4s

Lopen_tail_64_store:
 cmp x2, #16
 b.lt Lopen_tail_16

 ld1 {v20.16b}, [x1], #16
 eor v20.16b, v20.16b, v0.16b
 st1 {v20.16b}, [x0], #16
 mov v0.16b, v5.16b
 mov v5.16b, v10.16b
 mov v10.16b, v15.16b
 sub x2, x2, #16
 b Lopen_tail_64_store

Lopen_tail_16:

 cbz x2, Lopen_finalize

 eor v20.16b, v20.16b, v20.16b
 eor v21.16b, v21.16b, v21.16b
 not v22.16b, v20.16b

 add x7, x1, x2
 mov x6, x2

Lopen_tail_16_compose:
 ext v20.16b, v20.16b, v20.16b, #15
 ldrb w11, [x7, #-1]!
 mov v20.b[0], w11
 ext v21.16b, v22.16b, v21.16b, #15
 subs x2, x2, #1
 b.gt Lopen_tail_16_compose

 and v20.16b, v20.16b, v21.16b

 mov x11, v20.d[0]
 mov x12, v20.d[1]
 adds x8, x8, x11
 adcs x9, x9, x12
 adc x10, x10, x15
 mul x11, x8, x16
 umulh x12, x8, x16
 mul x13, x9, x16
 umulh x14, x9, x16
 adds x12, x12, x13
 mul x13, x10, x16
 adc x13, x13, x14
 mul x14, x8, x17
 umulh x8, x8, x17
 adds x12, x12, x14
 mul x14, x9, x17
 umulh x9, x9, x17
 adcs x14, x14, x8
 mul x10, x10, x17
 adc x10, x10, x9
 adds x13, x13, x14
 adc x14, x10, xzr
 and x10, x13, #3
 and x8, x13, #-4
 extr x13, x14, x13, #2
 adds x8, x8, x11
 lsr x11, x14, #2
 adc x9, x14, x11
 adds x8, x8, x13
 adcs x9, x9, x12
 adc x10, x10, xzr
 eor v20.16b, v20.16b, v0.16b

Lopen_tail_16_store:
 umov w11, v20.b[0]
 strb w11, [x0], #1
 ext v20.16b, v20.16b, v20.16b, #1
 subs x6, x6, #1
 b.gt Lopen_tail_16_store

Lopen_finalize:
 mov x11, v31.d[0]
 mov x12, v31.d[1]
 adds x8, x8, x11
 adcs x9, x9, x12
 adc x10, x10, x15
 mul x11, x8, x16
 umulh x12, x8, x16
 mul x13, x9, x16
 umulh x14, x9, x16
 adds x12, x12, x13
 mul x13, x10, x16
 adc x13, x13, x14
 mul x14, x8, x17
 umulh x8, x8, x17
 adds x12, x12, x14
 mul x14, x9, x17
 umulh x9, x9, x17
 adcs x14, x14, x8
 mul x10, x10, x17
 adc x10, x10, x9
 adds x13, x13, x14
 adc x14, x10, xzr
 and x10, x13, #3
 and x8, x13, #-4
 extr x13, x14, x13, #2
 adds x8, x8, x11
 lsr x11, x14, #2
 adc x9, x14, x11
 adds x8, x8, x13
 adcs x9, x9, x12
 adc x10, x10, xzr

 sub x12, xzr, x15
 orr x13, xzr, #3
 subs x11, x8, #-5
 sbcs x12, x9, x12
 sbcs x13, x10, x13
 csel x8, x11, x8, cs
 csel x9, x12, x9, cs
 csel x10, x13, x10, cs
 mov x11, v27.d[0]
 mov x12, v27.d[1]
 adds x8, x8, x11
 adcs x9, x9, x12
 adc x10, x10, x15

 stp x8, x9, [x5]

 ldp d8, d9, [sp, #16]
 ldp d10, d11, [sp, #32]
 ldp d12, d13, [sp, #48]
 ldp d14, d15, [sp, #64]
.cfi_restore b15
.cfi_restore b14
.cfi_restore b13
.cfi_restore b12
.cfi_restore b11
.cfi_restore b10
.cfi_restore b9
.cfi_restore b8
 ldp x29, x30, [sp], 80
.cfi_restore w29
.cfi_restore w30
.cfi_def_cfa_offset 0

 ret

Lopen_128:

 eor v25.16b, v25.16b, v25.16b
 mov x11, #1
 mov v25.s[0], w11
 mov v0.16b, v24.16b
 mov v1.16b, v24.16b
 mov v2.16b, v24.16b
 mov v5.16b, v28.16b
 mov v6.16b, v28.16b
 mov v7.16b, v28.16b
 mov v10.16b, v29.16b
 mov v11.16b, v29.16b
 mov v12.16b, v29.16b
 mov v17.16b, v30.16b
 add v15.4s, v17.4s, v25.4s
 add v16.4s, v15.4s, v25.4s

 mov x6, #10

Lopen_128_rounds:
 add v0.4s, v0.4s, v5.4s
 add v1.4s, v1.4s, v6.4s
 add v2.4s, v2.4s, v7.4s
 eor v15.16b, v15.16b, v0.16b
 eor v16.16b, v16.16b, v1.16b
 eor v17.16b, v17.16b, v2.16b
 rev32 v15.8h, v15.8h
 rev32 v16.8h, v16.8h
 rev32 v17.8h, v17.8h

 add v10.4s, v10.4s, v15.4s
 add v11.4s, v11.4s, v16.4s
 add v12.4s, v12.4s, v17.4s
 eor v5.16b, v5.16b, v10.16b
 eor v6.16b, v6.16b, v11.16b
 eor v7.16b, v7.16b, v12.16b
 ushr v20.4s, v5.4s, #20
 sli v20.4s, v5.4s, #12
 ushr v5.4s, v6.4s, #20
 sli v5.4s, v6.4s, #12
 ushr v6.4s, v7.4s, #20
 sli v6.4s, v7.4s, #12

 add v0.4s, v0.4s, v20.4s
 add v1.4s, v1.4s, v5.4s
 add v2.4s, v2.4s, v6.4s
 eor v15.16b, v15.16b, v0.16b
 eor v16.16b, v16.16b, v1.16b
 eor v17.16b, v17.16b, v2.16b
 tbl v15.16b, {v15.16b}, v26.16b
 tbl v16.16b, {v16.16b}, v26.16b
 tbl v17.16b, {v17.16b}, v26.16b

 add v10.4s, v10.4s, v15.4s
 add v11.4s, v11.4s, v16.4s
 add v12.4s, v12.4s, v17.4s
 eor v20.16b, v20.16b, v10.16b
 eor v5.16b, v5.16b, v11.16b
 eor v6.16b, v6.16b, v12.16b
 ushr v7.4s, v6.4s, #25
 sli v7.4s, v6.4s, #7
 ushr v6.4s, v5.4s, #25
 sli v6.4s, v5.4s, #7
 ushr v5.4s, v20.4s, #25
 sli v5.4s, v20.4s, #7

 ext v5.16b, v5.16b, v5.16b, #4
 ext v6.16b, v6.16b, v6.16b, #4
 ext v7.16b, v7.16b, v7.16b, #4

 ext v10.16b, v10.16b, v10.16b, #8
 ext v11.16b, v11.16b, v11.16b, #8
 ext v12.16b, v12.16b, v12.16b, #8

 ext v15.16b, v15.16b, v15.16b, #12
 ext v16.16b, v16.16b, v16.16b, #12
 ext v17.16b, v17.16b, v17.16b, #12
 add v0.4s, v0.4s, v5.4s
 add v1.4s, v1.4s, v6.4s
 add v2.4s, v2.4s, v7.4s
 eor v15.16b, v15.16b, v0.16b
 eor v16.16b, v16.16b, v1.16b
 eor v17.16b, v17.16b, v2.16b
 rev32 v15.8h, v15.8h
 rev32 v16.8h, v16.8h
 rev32 v17.8h, v17.8h

 add v10.4s, v10.4s, v15.4s
 add v11.4s, v11.4s, v16.4s
 add v12.4s, v12.4s, v17.4s
 eor v5.16b, v5.16b, v10.16b
 eor v6.16b, v6.16b, v11.16b
 eor v7.16b, v7.16b, v12.16b
 ushr v20.4s, v5.4s, #20
 sli v20.4s, v5.4s, #12
 ushr v5.4s, v6.4s, #20
 sli v5.4s, v6.4s, #12
 ushr v6.4s, v7.4s, #20
 sli v6.4s, v7.4s, #12

 add v0.4s, v0.4s, v20.4s
 add v1.4s, v1.4s, v5.4s
 add v2.4s, v2.4s, v6.4s
 eor v15.16b, v15.16b, v0.16b
 eor v16.16b, v16.16b, v1.16b
 eor v17.16b, v17.16b, v2.16b
 tbl v15.16b, {v15.16b}, v26.16b
 tbl v16.16b, {v16.16b}, v26.16b
 tbl v17.16b, {v17.16b}, v26.16b

 add v10.4s, v10.4s, v15.4s
 add v11.4s, v11.4s, v16.4s
 add v12.4s, v12.4s, v17.4s
 eor v20.16b, v20.16b, v10.16b
 eor v5.16b, v5.16b, v11.16b
 eor v6.16b, v6.16b, v12.16b
 ushr v7.4s, v6.4s, #25
 sli v7.4s, v6.4s, #7
 ushr v6.4s, v5.4s, #25
 sli v6.4s, v5.4s, #7
 ushr v5.4s, v20.4s, #25
 sli v5.4s, v20.4s, #7

 ext v5.16b, v5.16b, v5.16b, #12
 ext v6.16b, v6.16b, v6.16b, #12
 ext v7.16b, v7.16b, v7.16b, #12

 ext v10.16b, v10.16b, v10.16b, #8
 ext v11.16b, v11.16b, v11.16b, #8
 ext v12.16b, v12.16b, v12.16b, #8

 ext v15.16b, v15.16b, v15.16b, #4
 ext v16.16b, v16.16b, v16.16b, #4
 ext v17.16b, v17.16b, v17.16b, #4
 subs x6, x6, #1
 b.hi Lopen_128_rounds

 add v0.4s, v0.4s, v24.4s
 add v1.4s, v1.4s, v24.4s
 add v2.4s, v2.4s, v24.4s

 add v5.4s, v5.4s, v28.4s
 add v6.4s, v6.4s, v28.4s
 add v7.4s, v7.4s, v28.4s

 add v10.4s, v10.4s, v29.4s
 add v11.4s, v11.4s, v29.4s

 add v30.4s, v30.4s, v25.4s
 add v15.4s, v15.4s, v30.4s
 add v30.4s, v30.4s, v25.4s
 add v16.4s, v16.4s, v30.4s

 and v2.16b, v2.16b, v27.16b
 mov x16, v2.d[0]
 mov x17, v2.d[1]
 mov v27.16b, v7.16b

 bl Lpoly_hash_ad_internal

Lopen_128_store:
 cmp x2, #64
 b.lt Lopen_128_store_64

 ld1 {v20.16b - v23.16b}, [x1], #64

 mov x11, v20.d[0]
 mov x12, v20.d[1]
 adds x8, x8, x11
 adcs x9, x9, x12
 adc x10, x10, x15
 mul x11, x8, x16
 umulh x12, x8, x16
 mul x13, x9, x16
 umulh x14, x9, x16
 adds x12, x12, x13
 mul x13, x10, x16
 adc x13, x13, x14
 mul x14, x8, x17
 umulh x8, x8, x17
 adds x12, x12, x14
 mul x14, x9, x17
 umulh x9, x9, x17
 adcs x14, x14, x8
 mul x10, x10, x17
 adc x10, x10, x9
 adds x13, x13, x14
 adc x14, x10, xzr
 and x10, x13, #3
 and x8, x13, #-4
 extr x13, x14, x13, #2
 adds x8, x8, x11
 lsr x11, x14, #2
 adc x9, x14, x11
 adds x8, x8, x13
 adcs x9, x9, x12
 adc x10, x10, xzr
 mov x11, v21.d[0]
 mov x12, v21.d[1]
 adds x8, x8, x11
 adcs x9, x9, x12
 adc x10, x10, x15
 mul x11, x8, x16
 umulh x12, x8, x16
 mul x13, x9, x16
 umulh x14, x9, x16
 adds x12, x12, x13
 mul x13, x10, x16
 adc x13, x13, x14
 mul x14, x8, x17
 umulh x8, x8, x17
 adds x12, x12, x14
 mul x14, x9, x17
 umulh x9, x9, x17
 adcs x14, x14, x8
 mul x10, x10, x17
 adc x10, x10, x9
 adds x13, x13, x14
 adc x14, x10, xzr
 and x10, x13, #3
 and x8, x13, #-4
 extr x13, x14, x13, #2
 adds x8, x8, x11
 lsr x11, x14, #2
 adc x9, x14, x11
 adds x8, x8, x13
 adcs x9, x9, x12
 adc x10, x10, xzr
 mov x11, v22.d[0]
 mov x12, v22.d[1]
 adds x8, x8, x11
 adcs x9, x9, x12
 adc x10, x10, x15
 mul x11, x8, x16
 umulh x12, x8, x16
 mul x13, x9, x16
 umulh x14, x9, x16
 adds x12, x12, x13
 mul x13, x10, x16
 adc x13, x13, x14
 mul x14, x8, x17
 umulh x8, x8, x17
 adds x12, x12, x14
 mul x14, x9, x17
 umulh x9, x9, x17
 adcs x14, x14, x8
 mul x10, x10, x17
 adc x10, x10, x9
 adds x13, x13, x14
 adc x14, x10, xzr
 and x10, x13, #3
 and x8, x13, #-4
 extr x13, x14, x13, #2
 adds x8, x8, x11
 lsr x11, x14, #2
 adc x9, x14, x11
 adds x8, x8, x13
 adcs x9, x9, x12
 adc x10, x10, xzr
 mov x11, v23.d[0]
 mov x12, v23.d[1]
 adds x8, x8, x11
 adcs x9, x9, x12
 adc x10, x10, x15
 mul x11, x8, x16
 umulh x12, x8, x16
 mul x13, x9, x16
 umulh x14, x9, x16
 adds x12, x12, x13
 mul x13, x10, x16
 adc x13, x13, x14
 mul x14, x8, x17
 umulh x8, x8, x17
 adds x12, x12, x14
 mul x14, x9, x17
 umulh x9, x9, x17
 adcs x14, x14, x8
 mul x10, x10, x17
 adc x10, x10, x9
 adds x13, x13, x14
 adc x14, x10, xzr
 and x10, x13, #3
 and x8, x13, #-4
 extr x13, x14, x13, #2
 adds x8, x8, x11
 lsr x11, x14, #2
 adc x9, x14, x11
 adds x8, x8, x13
 adcs x9, x9, x12
 adc x10, x10, xzr

 eor v20.16b, v20.16b, v0.16b
 eor v21.16b, v21.16b, v5.16b
 eor v22.16b, v22.16b, v10.16b
 eor v23.16b, v23.16b, v15.16b

 st1 {v20.16b - v23.16b}, [x0], #64

 sub x2, x2, #64

 mov v0.16b, v1.16b
 mov v5.16b, v6.16b
 mov v10.16b, v11.16b
 mov v15.16b, v16.16b

Lopen_128_store_64:

 lsr x4, x2, #4
 mov x3, x1

Lopen_128_hash_64:
 cbz x4, Lopen_tail_64_store
 ldp x11, x12, [x3], 16
 adds x8, x8, x11
 adcs x9, x9, x12
 adc x10, x10, x15
 mul x11, x8, x16
 umulh x12, x8, x16
 mul x13, x9, x16
 umulh x14, x9, x16
 adds x12, x12, x13
 mul x13, x10, x16
 adc x13, x13, x14
 mul x14, x8, x17
 umulh x8, x8, x17
 adds x12, x12, x14
 mul x14, x9, x17
 umulh x9, x9, x17
 adcs x14, x14, x8
 mul x10, x10, x17
 adc x10, x10, x9
 adds x13, x13, x14
 adc x14, x10, xzr
 and x10, x13, #3
 and x8, x13, #-4
 extr x13, x14, x13, #2
 adds x8, x8, x11
 lsr x11, x14, #2
 adc x9, x14, x11
 adds x8, x8, x13
 adcs x9, x9, x12
 adc x10, x10, xzr
 sub x4, x4, #1
 b Lopen_128_hash_64
.cfi_endproc
