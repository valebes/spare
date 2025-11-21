# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/vpaes-armv8.S"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 467 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/vpaes-armv8.S" 2



# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h" 1
# 18 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/target.h" 1
# 19 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h" 2
# 41 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/generated-include/openssl/boringssl_prefix_symbols_asm.h" 1
# 42 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h" 2
# 5 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/vpaes-armv8.S" 2


# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/arm_arch.h" 1
# 8 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/vpaes-armv8.S" 2

.section __TEXT,__const


.align 7
_vpaes_consts:
Lk_mc_forward:
.quad 0x0407060500030201, 0x0C0F0E0D080B0A09
.quad 0x080B0A0904070605, 0x000302010C0F0E0D
.quad 0x0C0F0E0D080B0A09, 0x0407060500030201
.quad 0x000302010C0F0E0D, 0x080B0A0904070605
Lk_mc_backward:
.quad 0x0605040702010003, 0x0E0D0C0F0A09080B
.quad 0x020100030E0D0C0F, 0x0A09080B06050407
.quad 0x0E0D0C0F0A09080B, 0x0605040702010003
.quad 0x0A09080B06050407, 0x020100030E0D0C0F
Lk_sr:
.quad 0x0706050403020100, 0x0F0E0D0C0B0A0908
.quad 0x030E09040F0A0500, 0x0B06010C07020D08
.quad 0x0F060D040B020900, 0x070E050C030A0108
.quad 0x0B0E0104070A0D00, 0x0306090C0F020508




Lk_inv:
.quad 0x0E05060F0D080180, 0x040703090A0B0C02
.quad 0x01040A060F0B0780, 0x030D0E0C02050809
Lk_ipt:
.quad 0xC2B2E8985A2A7000, 0xCABAE09052227808
.quad 0x4C01307D317C4D00, 0xCD80B1FCB0FDCC81
Lk_sbo:
.quad 0xD0D26D176FBDC700, 0x15AABF7AC502A878
.quad 0xCFE474A55FBB6A00, 0x8E1E90D1412B35FA
Lk_sb1:
.quad 0x3618D415FAE22300, 0x3BF7CCC10D2ED9EF
.quad 0xB19BE18FCB503E00, 0xA5DF7A6E142AF544
Lk_sb2:
.quad 0x69EB88400AE12900, 0xC2A163C8AB82234A
.quad 0xE27A93C60B712400, 0x5EB7E955BC982FCD




Lk_dipt:
.quad 0x0F505B040B545F00, 0x154A411E114E451A
.quad 0x86E383E660056500, 0x12771772F491F194
Lk_dsbo:
.quad 0x1387EA537EF94000, 0xC7AA6DB9D4943E2D
.quad 0x12D7560F93441D00, 0xCA4B8159D8C58E9C
Lk_dsb9:
.quad 0x851C03539A86D600, 0xCAD51F504F994CC9
.quad 0xC03B1789ECD74900, 0x725E2C9EB2FBA565
Lk_dsbd:
.quad 0x7D57CCDFE6B1A200, 0xF56E9B13882A4439
.quad 0x3CE2FAF724C6CB00, 0x2931180D15DEEFD3
Lk_dsbb:
.quad 0xD022649296B44200, 0x602646F6B0F2D404
.quad 0xC19498A6CD596700, 0xF3FF0C3E3255AA6B
Lk_dsbe:
.quad 0x46F2929626D4D000, 0x2242600464B4F6B0
.quad 0x0C55A6CDFFAAC100, 0x9467F36B98593E32




Lk_dksd:
.quad 0xFEB91A5DA3E44700, 0x0740E3A45A1DBEF9
.quad 0x41C277F4B5368300, 0x5FDC69EAAB289D1E
Lk_dksb:
.quad 0x9A4FCA1F8550D500, 0x03D653861CC94C99
.quad 0x115BEDA7B6FC4A00, 0xD993256F7E3482C8
Lk_dkse:
.quad 0xD5031CCA1FC9D600, 0x53859A4C994F5086
.quad 0xA23196054FDC7BE8, 0xCD5EF96A20B31487
Lk_dks9:
.quad 0xB6116FC87ED9A700, 0x4AED933482255BFC
.quad 0x4576516227143300, 0x8BB89FACE9DAFDCE

Lk_rcon:
.quad 0x1F8391B9AF9DEEB6, 0x702A98084D7C7D81

Lk_opt:
.quad 0xFF9F4929D6B66000, 0xF7974121DEBE6808
.quad 0x01EDBD5150BCEC00, 0xE10D5DB1B05C0CE0
Lk_deskew:
.quad 0x07E4A34047A4E300, 0x1DFEB95A5DBEF91A
.quad 0x5F36B5DC83EA6900, 0x2841C2ABF49D1E77

.byte 86,101,99,116,111,114,32,80,101,114,109,117,116,97,116,105,111,110,32,65,69,83,32,102,111,114,32,65,82,77,118,56,44,32,77,105,107,101,32,72,97,109,98,117,114,103,32,40,83,116,97,110,102,111,114,100,32,85,110,105,118,101,114,115,105,116,121,41,0
.align 2

.align 6

.text
##
## _aes_preheat
##
## Fills register %r10 -> .aes_consts (so you can -fPIC)
## and %xmm9-%xmm15 as specified below.
##

.align 4
_vpaes_encrypt_preheat:
 adrp x10, Lk_inv@PAGE
 add x10, x10, Lk_inv@PAGEOFF
 movi v17.16b, #0x0f
 ld1 {v18.2d,v19.2d}, [x10],#32
 ld1 {v20.2d,v21.2d,v22.2d,v23.2d}, [x10],#64
 ld1 {v24.2d,v25.2d,v26.2d,v27.2d}, [x10]
 ret


##
## _aes_encrypt_core
##
## AES-encrypt %xmm0.
##
## Inputs:
## %xmm0 = input
## %xmm9-%xmm15 as in _vpaes_preheat
## (%rdx) = scheduled keys
##
## Output in %xmm0
## Clobbers %xmm1-%xmm5, %r9, %r10, %r11, %rax
## Preserves %xmm6 - %xmm8 so you get some local vectors
##
##

.align 4
_vpaes_encrypt_core:
 mov x9, x2
 ldr w8, [x2,#240]
 adrp x11, Lk_mc_forward@PAGE+16
 add x11, x11, Lk_mc_forward@PAGEOFF+16

 ld1 {v16.2d}, [x9], #16
 and v1.16b, v7.16b, v17.16b
 ushr v0.16b, v7.16b, #4
 tbl v1.16b, {v20.16b}, v1.16b

 tbl v2.16b, {v21.16b}, v0.16b
 eor v0.16b, v1.16b, v16.16b
 eor v0.16b, v0.16b, v2.16b
 b Lenc_entry

.align 4
Lenc_loop:

 add x10, x11, #0x40
 tbl v4.16b, {v25.16b}, v2.16b
 ld1 {v1.2d}, [x11], #16
 tbl v0.16b, {v24.16b}, v3.16b
 eor v4.16b, v4.16b, v16.16b
 tbl v5.16b, {v27.16b}, v2.16b
 eor v0.16b, v0.16b, v4.16b
 tbl v2.16b, {v26.16b}, v3.16b
 ld1 {v4.2d}, [x10]
 tbl v3.16b, {v0.16b}, v1.16b
 eor v2.16b, v2.16b, v5.16b
 tbl v0.16b, {v0.16b}, v4.16b
 eor v3.16b, v3.16b, v2.16b
 tbl v4.16b, {v3.16b}, v1.16b
 eor v0.16b, v0.16b, v3.16b
 and x11, x11, #~(1<<6)
 eor v0.16b, v0.16b, v4.16b
 sub w8, w8, #1

Lenc_entry:

 and v1.16b, v0.16b, v17.16b
 ushr v0.16b, v0.16b, #4
 tbl v5.16b, {v19.16b}, v1.16b
 eor v1.16b, v1.16b, v0.16b
 tbl v3.16b, {v18.16b}, v0.16b
 tbl v4.16b, {v18.16b}, v1.16b
 eor v3.16b, v3.16b, v5.16b
 eor v4.16b, v4.16b, v5.16b
 tbl v2.16b, {v18.16b}, v3.16b
 tbl v3.16b, {v18.16b}, v4.16b
 eor v2.16b, v2.16b, v1.16b
 eor v3.16b, v3.16b, v0.16b
 ld1 {v16.2d}, [x9],#16
 cbnz w8, Lenc_loop


 add x10, x11, #0x80


 tbl v4.16b, {v22.16b}, v2.16b
 ld1 {v1.2d}, [x10]
 tbl v0.16b, {v23.16b}, v3.16b
 eor v4.16b, v4.16b, v16.16b
 eor v0.16b, v0.16b, v4.16b
 tbl v0.16b, {v0.16b}, v1.16b
 ret


.globl _aws_lc_0_27_1_vpaes_encrypt
.private_extern _aws_lc_0_27_1_vpaes_encrypt

.align 4
_aws_lc_0_27_1_vpaes_encrypt:
# 219 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/vpaes-armv8.S"
 stp x29,x30,[sp,#-16]!
 add x29,sp,#0

 ld1 {v7.16b}, [x0]
 bl _vpaes_encrypt_preheat
 bl _vpaes_encrypt_core
 st1 {v0.16b}, [x1]

 ldp x29,x30,[sp],#16

 ret



.align 4
_vpaes_encrypt_2x:
 mov x9, x2
 ldr w8, [x2,#240]
 adrp x11, Lk_mc_forward@PAGE+16
 add x11, x11, Lk_mc_forward@PAGEOFF+16

 ld1 {v16.2d}, [x9], #16
 and v1.16b, v14.16b, v17.16b
 ushr v0.16b, v14.16b, #4
 and v9.16b, v15.16b, v17.16b
 ushr v8.16b, v15.16b, #4
 tbl v1.16b, {v20.16b}, v1.16b
 tbl v9.16b, {v20.16b}, v9.16b

 tbl v2.16b, {v21.16b}, v0.16b
 tbl v10.16b, {v21.16b}, v8.16b
 eor v0.16b, v1.16b, v16.16b
 eor v8.16b, v9.16b, v16.16b
 eor v0.16b, v0.16b, v2.16b
 eor v8.16b, v8.16b, v10.16b
 b Lenc_2x_entry

.align 4
Lenc_2x_loop:

 add x10, x11, #0x40
 tbl v4.16b, {v25.16b}, v2.16b
 tbl v12.16b, {v25.16b}, v10.16b
 ld1 {v1.2d}, [x11], #16
 tbl v0.16b, {v24.16b}, v3.16b
 tbl v8.16b, {v24.16b}, v11.16b
 eor v4.16b, v4.16b, v16.16b
 eor v12.16b, v12.16b, v16.16b
 tbl v5.16b, {v27.16b}, v2.16b
 tbl v13.16b, {v27.16b}, v10.16b
 eor v0.16b, v0.16b, v4.16b
 eor v8.16b, v8.16b, v12.16b
 tbl v2.16b, {v26.16b}, v3.16b
 tbl v10.16b, {v26.16b}, v11.16b
 ld1 {v4.2d}, [x10]
 tbl v3.16b, {v0.16b}, v1.16b
 tbl v11.16b, {v8.16b}, v1.16b
 eor v2.16b, v2.16b, v5.16b
 eor v10.16b, v10.16b, v13.16b
 tbl v0.16b, {v0.16b}, v4.16b
 tbl v8.16b, {v8.16b}, v4.16b
 eor v3.16b, v3.16b, v2.16b
 eor v11.16b, v11.16b, v10.16b
 tbl v4.16b, {v3.16b}, v1.16b
 tbl v12.16b, {v11.16b},v1.16b
 eor v0.16b, v0.16b, v3.16b
 eor v8.16b, v8.16b, v11.16b
 and x11, x11, #~(1<<6)
 eor v0.16b, v0.16b, v4.16b
 eor v8.16b, v8.16b, v12.16b
 sub w8, w8, #1

Lenc_2x_entry:

 and v1.16b, v0.16b, v17.16b
 ushr v0.16b, v0.16b, #4
 and v9.16b, v8.16b, v17.16b
 ushr v8.16b, v8.16b, #4
 tbl v5.16b, {v19.16b},v1.16b
 tbl v13.16b, {v19.16b},v9.16b
 eor v1.16b, v1.16b, v0.16b
 eor v9.16b, v9.16b, v8.16b
 tbl v3.16b, {v18.16b},v0.16b
 tbl v11.16b, {v18.16b},v8.16b
 tbl v4.16b, {v18.16b},v1.16b
 tbl v12.16b, {v18.16b},v9.16b
 eor v3.16b, v3.16b, v5.16b
 eor v11.16b, v11.16b, v13.16b
 eor v4.16b, v4.16b, v5.16b
 eor v12.16b, v12.16b, v13.16b
 tbl v2.16b, {v18.16b},v3.16b
 tbl v10.16b, {v18.16b},v11.16b
 tbl v3.16b, {v18.16b},v4.16b
 tbl v11.16b, {v18.16b},v12.16b
 eor v2.16b, v2.16b, v1.16b
 eor v10.16b, v10.16b, v9.16b
 eor v3.16b, v3.16b, v0.16b
 eor v11.16b, v11.16b, v8.16b
 ld1 {v16.2d}, [x9],#16
 cbnz w8, Lenc_2x_loop


 add x10, x11, #0x80


 tbl v4.16b, {v22.16b}, v2.16b
 tbl v12.16b, {v22.16b}, v10.16b
 ld1 {v1.2d}, [x10]
 tbl v0.16b, {v23.16b}, v3.16b
 tbl v8.16b, {v23.16b}, v11.16b
 eor v4.16b, v4.16b, v16.16b
 eor v12.16b, v12.16b, v16.16b
 eor v0.16b, v0.16b, v4.16b
 eor v8.16b, v8.16b, v12.16b
 tbl v0.16b, {v0.16b},v1.16b
 tbl v1.16b, {v8.16b},v1.16b
 ret



.align 4
_vpaes_decrypt_preheat:
 adrp x10, Lk_inv@PAGE
 add x10, x10, Lk_inv@PAGEOFF
 movi v17.16b, #0x0f
 adrp x11, Lk_dipt@PAGE
 add x11, x11, Lk_dipt@PAGEOFF
 ld1 {v18.2d,v19.2d}, [x10],#32
 ld1 {v20.2d,v21.2d,v22.2d,v23.2d}, [x11],#64
 ld1 {v24.2d,v25.2d,v26.2d,v27.2d}, [x11],#64
 ld1 {v28.2d,v29.2d,v30.2d,v31.2d}, [x11]
 ret


##
## Decryption core
##
## Same API as encryption core.
##

.align 4
_vpaes_decrypt_core:
 mov x9, x2
 ldr w8, [x2,#240]


 lsl x11, x8, #4
 eor x11, x11, #0x30
 adrp x10, Lk_sr@PAGE
 add x10, x10, Lk_sr@PAGEOFF
 and x11, x11, #0x30
 add x11, x11, x10
 adrp x10, Lk_mc_forward@PAGE+48
 add x10, x10, Lk_mc_forward@PAGEOFF+48

 ld1 {v16.2d}, [x9],#16
 and v1.16b, v7.16b, v17.16b
 ushr v0.16b, v7.16b, #4
 tbl v2.16b, {v20.16b}, v1.16b
 ld1 {v5.2d}, [x10]

 tbl v0.16b, {v21.16b}, v0.16b
 eor v2.16b, v2.16b, v16.16b
 eor v0.16b, v0.16b, v2.16b
 b Ldec_entry

.align 4
Ldec_loop:





 tbl v4.16b, {v24.16b}, v2.16b
 tbl v1.16b, {v25.16b}, v3.16b
 eor v0.16b, v4.16b, v16.16b

 eor v0.16b, v0.16b, v1.16b


 tbl v4.16b, {v26.16b}, v2.16b
 tbl v0.16b, {v0.16b}, v5.16b
 tbl v1.16b, {v27.16b}, v3.16b
 eor v0.16b, v0.16b, v4.16b

 eor v0.16b, v0.16b, v1.16b


 tbl v4.16b, {v28.16b}, v2.16b
 tbl v0.16b, {v0.16b}, v5.16b
 tbl v1.16b, {v29.16b}, v3.16b
 eor v0.16b, v0.16b, v4.16b

 eor v0.16b, v0.16b, v1.16b


 tbl v4.16b, {v30.16b}, v2.16b
 tbl v0.16b, {v0.16b}, v5.16b
 tbl v1.16b, {v31.16b}, v3.16b
 eor v0.16b, v0.16b, v4.16b
 ext v5.16b, v5.16b, v5.16b, #12
 eor v0.16b, v0.16b, v1.16b
 sub w8, w8, #1

Ldec_entry:

 and v1.16b, v0.16b, v17.16b
 ushr v0.16b, v0.16b, #4
 tbl v2.16b, {v19.16b}, v1.16b
 eor v1.16b, v1.16b, v0.16b
 tbl v3.16b, {v18.16b}, v0.16b
 tbl v4.16b, {v18.16b}, v1.16b
 eor v3.16b, v3.16b, v2.16b
 eor v4.16b, v4.16b, v2.16b
 tbl v2.16b, {v18.16b}, v3.16b
 tbl v3.16b, {v18.16b}, v4.16b
 eor v2.16b, v2.16b, v1.16b
 eor v3.16b, v3.16b, v0.16b
 ld1 {v16.2d}, [x9],#16
 cbnz w8, Ldec_loop



 tbl v4.16b, {v22.16b}, v2.16b

 ld1 {v2.2d}, [x11]
 tbl v1.16b, {v23.16b}, v3.16b
 eor v4.16b, v4.16b, v16.16b
 eor v0.16b, v1.16b, v4.16b
 tbl v0.16b, {v0.16b}, v2.16b
 ret


.globl _aws_lc_0_27_1_vpaes_decrypt
.private_extern _aws_lc_0_27_1_vpaes_decrypt

.align 4
_aws_lc_0_27_1_vpaes_decrypt:

 stp x29,x30,[sp,#-16]!
 add x29,sp,#0

 ld1 {v7.16b}, [x0]
 bl _vpaes_decrypt_preheat
 bl _vpaes_decrypt_core
 st1 {v0.16b}, [x1]

 ldp x29,x30,[sp],#16

 ret




.align 4
_vpaes_decrypt_2x:
 mov x9, x2
 ldr w8, [x2,#240]


 lsl x11, x8, #4
 eor x11, x11, #0x30
 adrp x10, Lk_sr@PAGE
 add x10, x10, Lk_sr@PAGEOFF
 and x11, x11, #0x30
 add x11, x11, x10
 adrp x10, Lk_mc_forward@PAGE+48
 add x10, x10, Lk_mc_forward@PAGEOFF+48

 ld1 {v16.2d}, [x9],#16
 and v1.16b, v14.16b, v17.16b
 ushr v0.16b, v14.16b, #4
 and v9.16b, v15.16b, v17.16b
 ushr v8.16b, v15.16b, #4
 tbl v2.16b, {v20.16b},v1.16b
 tbl v10.16b, {v20.16b},v9.16b
 ld1 {v5.2d}, [x10]

 tbl v0.16b, {v21.16b},v0.16b
 tbl v8.16b, {v21.16b},v8.16b
 eor v2.16b, v2.16b, v16.16b
 eor v10.16b, v10.16b, v16.16b
 eor v0.16b, v0.16b, v2.16b
 eor v8.16b, v8.16b, v10.16b
 b Ldec_2x_entry

.align 4
Ldec_2x_loop:





 tbl v4.16b, {v24.16b}, v2.16b
 tbl v12.16b, {v24.16b}, v10.16b
 tbl v1.16b, {v25.16b}, v3.16b
 tbl v9.16b, {v25.16b}, v11.16b
 eor v0.16b, v4.16b, v16.16b
 eor v8.16b, v12.16b, v16.16b

 eor v0.16b, v0.16b, v1.16b
 eor v8.16b, v8.16b, v9.16b


 tbl v4.16b, {v26.16b}, v2.16b
 tbl v12.16b, {v26.16b}, v10.16b
 tbl v0.16b, {v0.16b},v5.16b
 tbl v8.16b, {v8.16b},v5.16b
 tbl v1.16b, {v27.16b}, v3.16b
 tbl v9.16b, {v27.16b}, v11.16b
 eor v0.16b, v0.16b, v4.16b
 eor v8.16b, v8.16b, v12.16b

 eor v0.16b, v0.16b, v1.16b
 eor v8.16b, v8.16b, v9.16b


 tbl v4.16b, {v28.16b}, v2.16b
 tbl v12.16b, {v28.16b}, v10.16b
 tbl v0.16b, {v0.16b},v5.16b
 tbl v8.16b, {v8.16b},v5.16b
 tbl v1.16b, {v29.16b}, v3.16b
 tbl v9.16b, {v29.16b}, v11.16b
 eor v0.16b, v0.16b, v4.16b
 eor v8.16b, v8.16b, v12.16b

 eor v0.16b, v0.16b, v1.16b
 eor v8.16b, v8.16b, v9.16b


 tbl v4.16b, {v30.16b}, v2.16b
 tbl v12.16b, {v30.16b}, v10.16b
 tbl v0.16b, {v0.16b},v5.16b
 tbl v8.16b, {v8.16b},v5.16b
 tbl v1.16b, {v31.16b}, v3.16b
 tbl v9.16b, {v31.16b}, v11.16b
 eor v0.16b, v0.16b, v4.16b
 eor v8.16b, v8.16b, v12.16b
 ext v5.16b, v5.16b, v5.16b, #12
 eor v0.16b, v0.16b, v1.16b
 eor v8.16b, v8.16b, v9.16b
 sub w8, w8, #1

Ldec_2x_entry:

 and v1.16b, v0.16b, v17.16b
 ushr v0.16b, v0.16b, #4
 and v9.16b, v8.16b, v17.16b
 ushr v8.16b, v8.16b, #4
 tbl v2.16b, {v19.16b},v1.16b
 tbl v10.16b, {v19.16b},v9.16b
 eor v1.16b, v1.16b, v0.16b
 eor v9.16b, v9.16b, v8.16b
 tbl v3.16b, {v18.16b},v0.16b
 tbl v11.16b, {v18.16b},v8.16b
 tbl v4.16b, {v18.16b},v1.16b
 tbl v12.16b, {v18.16b},v9.16b
 eor v3.16b, v3.16b, v2.16b
 eor v11.16b, v11.16b, v10.16b
 eor v4.16b, v4.16b, v2.16b
 eor v12.16b, v12.16b, v10.16b
 tbl v2.16b, {v18.16b},v3.16b
 tbl v10.16b, {v18.16b},v11.16b
 tbl v3.16b, {v18.16b},v4.16b
 tbl v11.16b, {v18.16b},v12.16b
 eor v2.16b, v2.16b, v1.16b
 eor v10.16b, v10.16b, v9.16b
 eor v3.16b, v3.16b, v0.16b
 eor v11.16b, v11.16b, v8.16b
 ld1 {v16.2d}, [x9],#16
 cbnz w8, Ldec_2x_loop



 tbl v4.16b, {v22.16b}, v2.16b
 tbl v12.16b, {v22.16b}, v10.16b

 tbl v1.16b, {v23.16b}, v3.16b
 tbl v9.16b, {v23.16b}, v11.16b
 ld1 {v2.2d}, [x11]
 eor v4.16b, v4.16b, v16.16b
 eor v12.16b, v12.16b, v16.16b
 eor v0.16b, v1.16b, v4.16b
 eor v8.16b, v9.16b, v12.16b
 tbl v0.16b, {v0.16b},v2.16b
 tbl v1.16b, {v8.16b},v2.16b
 ret

########################################################
## ##
## AES key schedule ##
## ##
########################################################

.align 4
_vpaes_key_preheat:
 adrp x10, Lk_inv@PAGE
 add x10, x10, Lk_inv@PAGEOFF
 movi v16.16b, #0x5b
 adrp x11, Lk_sb1@PAGE
 add x11, x11, Lk_sb1@PAGEOFF
 movi v17.16b, #0x0f
 ld1 {v18.2d,v19.2d,v20.2d,v21.2d}, [x10]
 adrp x10, Lk_dksd@PAGE
 add x10, x10, Lk_dksd@PAGEOFF
 ld1 {v22.2d,v23.2d}, [x11]
 adrp x11, Lk_mc_forward@PAGE
 add x11, x11, Lk_mc_forward@PAGEOFF
 ld1 {v24.2d,v25.2d,v26.2d,v27.2d}, [x10],#64
 ld1 {v28.2d,v29.2d,v30.2d,v31.2d}, [x10],#64
 ld1 {v8.2d}, [x10]
 ld1 {v9.2d}, [x11]
 ret



.align 4
_vpaes_schedule_core:

 stp x29, x30, [sp,#-16]!
 add x29,sp,#0

 bl _vpaes_key_preheat

 ld1 {v0.16b}, [x0],#16


 mov v3.16b, v0.16b
 bl _vpaes_schedule_transform
 mov v7.16b, v0.16b

 adrp x10, Lk_sr@PAGE
 add x10, x10, Lk_sr@PAGEOFF

 add x8, x8, x10
 cbnz w3, Lschedule_am_decrypting


 st1 {v0.2d}, [x2]
 b Lschedule_go

Lschedule_am_decrypting:

 ld1 {v1.2d}, [x8]
 tbl v3.16b, {v3.16b}, v1.16b
 st1 {v3.2d}, [x2]
 eor x8, x8, #0x30

Lschedule_go:
 cmp w1, #192
 b.hi Lschedule_256
 b.eq Lschedule_192


##
## .schedule_128
##
## 128-bit specific part of key schedule.
##
## This schedule is really simple, because all its parts
## are accomplished by the subroutines.
##
Lschedule_128:
 mov x0, #10

Loop_schedule_128:
 sub x0, x0, #1
 bl _vpaes_schedule_round
 cbz x0, Lschedule_mangle_last
 bl _vpaes_schedule_mangle
 b Loop_schedule_128

##
## .aes_schedule_192
##
## 192-bit specific part of key schedule.
##
## The main body of this schedule is the same as the 128-bit
## schedule, but with more smearing. The long, high side is
## stored in %xmm7 as before, and the short, low side is in
## the high bits of %xmm6.
##
## This schedule is somewhat nastier, however, because each
## round produces 192 bits of key material, or 1.5 round keys.
## Therefore, on each cycle we do 2 rounds and produce 3 round
## keys.
##
.align 4
Lschedule_192:
 sub x0, x0, #8
 ld1 {v0.16b}, [x0]
 bl _vpaes_schedule_transform
 mov v6.16b, v0.16b
 eor v4.16b, v4.16b, v4.16b
 ins v6.d[0], v4.d[0]
 mov x0, #4

Loop_schedule_192:
 sub x0, x0, #1
 bl _vpaes_schedule_round
 ext v0.16b, v6.16b, v0.16b, #8
 bl _vpaes_schedule_mangle
 bl _vpaes_schedule_192_smear
 bl _vpaes_schedule_mangle
 bl _vpaes_schedule_round
 cbz x0, Lschedule_mangle_last
 bl _vpaes_schedule_mangle
 bl _vpaes_schedule_192_smear
 b Loop_schedule_192

##
## .aes_schedule_256
##
## 256-bit specific part of key schedule.
##
## The structure here is very similar to the 128-bit
## schedule, but with an additional "low side" in
## %xmm6. The low side's rounds are the same as the
## high side's, except no rcon and no rotation.
##
.align 4
Lschedule_256:
 ld1 {v0.16b}, [x0]
 bl _vpaes_schedule_transform
 mov x0, #7

Loop_schedule_256:
 sub x0, x0, #1
 bl _vpaes_schedule_mangle
 mov v6.16b, v0.16b


 bl _vpaes_schedule_round
 cbz x0, Lschedule_mangle_last
 bl _vpaes_schedule_mangle


 dup v0.4s, v0.s[3]
 movi v4.16b, #0
 mov v5.16b, v7.16b
 mov v7.16b, v6.16b
 bl _vpaes_schedule_low_round
 mov v7.16b, v5.16b

 b Loop_schedule_256

##
## .aes_schedule_mangle_last
##
## Mangler for last round of key schedule
## Mangles %xmm0
## when encrypting, outputs out(%xmm0) ^ 63
## when decrypting, outputs unskew(%xmm0)
##
## Always called right before return... jumps to cleanup and exits
##
.align 4
Lschedule_mangle_last:

 adrp x11, Lk_deskew@PAGE
 add x11, x11, Lk_deskew@PAGEOFF

 cbnz w3, Lschedule_mangle_last_dec


 ld1 {v1.2d}, [x8]
 adrp x11, Lk_opt@PAGE
 add x11, x11, Lk_opt@PAGEOFF
 add x2, x2, #32
 tbl v0.16b, {v0.16b}, v1.16b

Lschedule_mangle_last_dec:
 ld1 {v20.2d,v21.2d}, [x11]
 sub x2, x2, #16
 eor v0.16b, v0.16b, v16.16b
 bl _vpaes_schedule_transform
 st1 {v0.2d}, [x2]


 eor v0.16b, v0.16b, v0.16b
 eor v1.16b, v1.16b, v1.16b
 eor v2.16b, v2.16b, v2.16b
 eor v3.16b, v3.16b, v3.16b
 eor v4.16b, v4.16b, v4.16b
 eor v5.16b, v5.16b, v5.16b
 eor v6.16b, v6.16b, v6.16b
 eor v7.16b, v7.16b, v7.16b
 ldp x29, x30, [sp],#16

 ret


##
## .aes_schedule_192_smear
##
## Smear the short, low side in the 192-bit key schedule.
##
## Inputs:
## %xmm7: high side, b a x y
## %xmm6: low side, d c 0 0
## %xmm13: 0
##
## Outputs:
## %xmm6: b+c+d b+c 0 0
## %xmm0: b+c+d b+c b a
##

.align 4
_vpaes_schedule_192_smear:
 movi v1.16b, #0
 dup v0.4s, v7.s[3]
 ins v1.s[3], v6.s[2]
 ins v0.s[0], v7.s[2]
 eor v6.16b, v6.16b, v1.16b
 eor v1.16b, v1.16b, v1.16b
 eor v6.16b, v6.16b, v0.16b
 mov v0.16b, v6.16b
 ins v6.d[0], v1.d[0]
 ret


##
## .aes_schedule_round
##
## Runs one main round of the key schedule on %xmm0, %xmm7
##
## Specifically, runs subbytes on the high dword of %xmm0
## then rotates it by one byte and xors into the low dword of
## %xmm7.
##
## Adds rcon from low byte of %xmm8, then rotates %xmm8 for
## next rcon.
##
## Smears the dwords of %xmm7 by xoring the low into the
## second low, result into third, result into highest.
##
## Returns results in %xmm7 = %xmm0.
## Clobbers %xmm1-%xmm4, %r11.
##

.align 4
_vpaes_schedule_round:

 movi v4.16b, #0
 ext v1.16b, v8.16b, v4.16b, #15
 ext v8.16b, v8.16b, v8.16b, #15
 eor v7.16b, v7.16b, v1.16b


 dup v0.4s, v0.s[3]
 ext v0.16b, v0.16b, v0.16b, #1




_vpaes_schedule_low_round:

 ext v1.16b, v4.16b, v7.16b, #12
 eor v7.16b, v7.16b, v1.16b
 ext v4.16b, v4.16b, v7.16b, #8


 and v1.16b, v0.16b, v17.16b
 ushr v0.16b, v0.16b, #4
 eor v7.16b, v7.16b, v4.16b
 tbl v2.16b, {v19.16b}, v1.16b
 eor v1.16b, v1.16b, v0.16b
 tbl v3.16b, {v18.16b}, v0.16b
 eor v3.16b, v3.16b, v2.16b
 tbl v4.16b, {v18.16b}, v1.16b
 eor v7.16b, v7.16b, v16.16b
 tbl v3.16b, {v18.16b}, v3.16b
 eor v4.16b, v4.16b, v2.16b
 tbl v2.16b, {v18.16b}, v4.16b
 eor v3.16b, v3.16b, v1.16b
 eor v2.16b, v2.16b, v0.16b
 tbl v4.16b, {v23.16b}, v3.16b
 tbl v1.16b, {v22.16b}, v2.16b
 eor v1.16b, v1.16b, v4.16b


 eor v0.16b, v1.16b, v7.16b
 eor v7.16b, v1.16b, v7.16b
 ret


##
## .aes_schedule_transform
##
## Linear-transform %xmm0 according to tables at (%r11)
##
## Requires that %xmm9 = 0x0F0F... as in preheat
## Output in %xmm0
## Clobbers %xmm1, %xmm2
##

.align 4
_vpaes_schedule_transform:
 and v1.16b, v0.16b, v17.16b
 ushr v0.16b, v0.16b, #4

 tbl v2.16b, {v20.16b}, v1.16b

 tbl v0.16b, {v21.16b}, v0.16b
 eor v0.16b, v0.16b, v2.16b
 ret


##
## .aes_schedule_mangle
##
## Mangle xmm0 from (basis-transformed) standard version
## to our version.
##
## On encrypt,
## xor with 0x63
## multiply by circulant 0,1,1,1
## apply shiftrows transform
##
## On decrypt,
## xor with 0x63
## multiply by "inverse mixcolumns" circulant E,B,D,9
## deskew
## apply shiftrows transform
##
##
## Writes out to (%rdx), and increments or decrements it
## Keeps track of round number mod 4 in %r8
## Preserves xmm0
## Clobbers xmm1-xmm5
##

.align 4
_vpaes_schedule_mangle:
 mov v4.16b, v0.16b

 cbnz w3, Lschedule_mangle_dec


 eor v4.16b, v0.16b, v16.16b
 add x2, x2, #16
 tbl v4.16b, {v4.16b}, v9.16b
 tbl v1.16b, {v4.16b}, v9.16b
 tbl v3.16b, {v1.16b}, v9.16b
 eor v4.16b, v4.16b, v1.16b
 ld1 {v1.2d}, [x8]
 eor v3.16b, v3.16b, v4.16b

 b Lschedule_mangle_both
.align 4
Lschedule_mangle_dec:


 ushr v1.16b, v4.16b, #4
 and v4.16b, v4.16b, v17.16b


 tbl v2.16b, {v24.16b}, v4.16b

 tbl v3.16b, {v25.16b}, v1.16b
 eor v3.16b, v3.16b, v2.16b
 tbl v3.16b, {v3.16b}, v9.16b


 tbl v2.16b, {v26.16b}, v4.16b
 eor v2.16b, v2.16b, v3.16b

 tbl v3.16b, {v27.16b}, v1.16b
 eor v3.16b, v3.16b, v2.16b
 tbl v3.16b, {v3.16b}, v9.16b


 tbl v2.16b, {v28.16b}, v4.16b
 eor v2.16b, v2.16b, v3.16b

 tbl v3.16b, {v29.16b}, v1.16b
 eor v3.16b, v3.16b, v2.16b


 tbl v2.16b, {v30.16b}, v4.16b
 tbl v3.16b, {v3.16b}, v9.16b

 tbl v4.16b, {v31.16b}, v1.16b
 ld1 {v1.2d}, [x8]
 eor v2.16b, v2.16b, v3.16b
 eor v3.16b, v4.16b, v2.16b

 sub x2, x2, #16

Lschedule_mangle_both:
 tbl v3.16b, {v3.16b}, v1.16b
 add x8, x8, #48
 and x8, x8, #~(1<<6)
 st1 {v3.2d}, [x2]
 ret


.globl _aws_lc_0_27_1_vpaes_set_encrypt_key
.private_extern _aws_lc_0_27_1_vpaes_set_encrypt_key

.align 4
_aws_lc_0_27_1_vpaes_set_encrypt_key:
# 1029 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/vpaes-armv8.S"
 stp x29,x30,[sp,#-16]!
 add x29,sp,#0
 stp d8,d9,[sp,#-16]!

 lsr w9, w1, #5
 add w9, w9, #5
 str w9, [x2,#240]

 mov w3, #0
 mov x8, #0x30
 bl _vpaes_schedule_core
 eor x0, x0, x0

 ldp d8,d9,[sp],#16
 ldp x29,x30,[sp],#16

 ret


.globl _aws_lc_0_27_1_vpaes_set_decrypt_key
.private_extern _aws_lc_0_27_1_vpaes_set_decrypt_key

.align 4
_aws_lc_0_27_1_vpaes_set_decrypt_key:

 stp x29,x30,[sp,#-16]!
 add x29,sp,#0
 stp d8,d9,[sp,#-16]!

 lsr w9, w1, #5
 add w9, w9, #5
 str w9, [x2,#240]
 lsl w9, w9, #4
 add x2, x2, #16
 add x2, x2, x9

 mov w3, #1
 lsr w8, w1, #1
 and x8, x8, #32
 eor x8, x8, #32
 bl _vpaes_schedule_core

 ldp d8,d9,[sp],#16
 ldp x29,x30,[sp],#16

 ret

.globl _aws_lc_0_27_1_vpaes_cbc_encrypt
.private_extern _aws_lc_0_27_1_vpaes_cbc_encrypt

.align 4
_aws_lc_0_27_1_vpaes_cbc_encrypt:

 cbz x2, Lcbc_abort
 cmp w5, #0
 b.eq vpaes_cbc_decrypt

 stp x29,x30,[sp,#-16]!
 add x29,sp,#0

 mov x17, x2
 mov x2, x3

 ld1 {v0.16b}, [x4]
 bl _vpaes_encrypt_preheat
 b Lcbc_enc_loop

.align 4
Lcbc_enc_loop:
 ld1 {v7.16b}, [x0],#16
 eor v7.16b, v7.16b, v0.16b
 bl _vpaes_encrypt_core
 st1 {v0.16b}, [x1],#16
 subs x17, x17, #16
 b.hi Lcbc_enc_loop

 st1 {v0.16b}, [x4]

 ldp x29,x30,[sp],#16
Lcbc_abort:

 ret



.align 4
vpaes_cbc_decrypt:


 stp x29,x30,[sp,#-16]!
 add x29,sp,#0
 stp d8,d9,[sp,#-16]!
 stp d10,d11,[sp,#-16]!
 stp d12,d13,[sp,#-16]!
 stp d14,d15,[sp,#-16]!

 mov x17, x2
 mov x2, x3
 ld1 {v6.16b}, [x4]
 bl _vpaes_decrypt_preheat
 tst x17, #16
 b.eq Lcbc_dec_loop2x

 ld1 {v7.16b}, [x0], #16
 bl _vpaes_decrypt_core
 eor v0.16b, v0.16b, v6.16b
 orr v6.16b, v7.16b, v7.16b
 st1 {v0.16b}, [x1], #16
 subs x17, x17, #16
 b.ls Lcbc_dec_done

.align 4
Lcbc_dec_loop2x:
 ld1 {v14.16b,v15.16b}, [x0], #32
 bl _vpaes_decrypt_2x
 eor v0.16b, v0.16b, v6.16b
 eor v1.16b, v1.16b, v14.16b
 orr v6.16b, v15.16b, v15.16b
 st1 {v0.16b,v1.16b}, [x1], #32
 subs x17, x17, #32
 b.hi Lcbc_dec_loop2x

Lcbc_dec_done:
 st1 {v6.16b}, [x4]

 ldp d14,d15,[sp],#16
 ldp d12,d13,[sp],#16
 ldp d10,d11,[sp],#16
 ldp d8,d9,[sp],#16
 ldp x29,x30,[sp],#16

 ret

.globl _aws_lc_0_27_1_vpaes_ctr32_encrypt_blocks
.private_extern _aws_lc_0_27_1_vpaes_ctr32_encrypt_blocks

.align 4
_aws_lc_0_27_1_vpaes_ctr32_encrypt_blocks:

 stp x29,x30,[sp,#-16]!
 add x29,sp,#0
 stp d8,d9,[sp,#-16]!
 stp d10,d11,[sp,#-16]!
 stp d12,d13,[sp,#-16]!
 stp d14,d15,[sp,#-16]!

 cbz x2, Lctr32_done



 mov x17, x2
 mov x2, x3


 ldr w6, [x4, #12]
 ld1 {v7.16b}, [x4]

 bl _vpaes_encrypt_preheat
 tst x17, #1
 rev w6, w6
 b.eq Lctr32_prep_loop



 ld1 {v6.16b}, [x0], #16
 bl _vpaes_encrypt_core
 eor v0.16b, v0.16b, v6.16b
 st1 {v0.16b}, [x1], #16
 subs x17, x17, #1

 add w6, w6, #1
 rev w7, w6
 mov v7.s[3], w7
 b.ls Lctr32_done

Lctr32_prep_loop:


 mov v15.16b, v7.16b
 mov v14.16b, v7.16b
 add w6, w6, #1
 rev w7, w6
 mov v15.s[3], w7

Lctr32_loop:
 ld1 {v6.16b,v7.16b}, [x0], #32
 bl _vpaes_encrypt_2x
 eor v0.16b, v0.16b, v6.16b
 eor v1.16b, v1.16b, v7.16b
 st1 {v0.16b,v1.16b}, [x1], #32
 subs x17, x17, #2

 add w7, w6, #1
 add w6, w6, #2
 rev w7, w7
 mov v14.s[3], w7
 rev w7, w6
 mov v15.s[3], w7
 b.hi Lctr32_loop

Lctr32_done:
 ldp d14,d15,[sp],#16
 ldp d12,d13,[sp],#16
 ldp d10,d11,[sp],#16
 ldp d8,d9,[sp],#16
 ldp x29,x30,[sp],#16

 ret
