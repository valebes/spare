# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/p256-armv8-asm.S"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 467 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/p256-armv8-asm.S" 2



# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h" 1
# 18 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/target.h" 1
# 19 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h" 2
# 41 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/generated-include/openssl/boringssl_prefix_symbols_asm.h" 1
# 42 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h" 2
# 5 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/p256-armv8-asm.S" 2


# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/arm_arch.h" 1
# 8 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/p256-armv8-asm.S" 2

.section __TEXT,__const
.align 5
Lpoly:
.quad 0xffffffffffffffff,0x00000000ffffffff,0x0000000000000000,0xffffffff00000001
LRR:
.quad 0x0000000000000003,0xfffffffbffffffff,0xfffffffffffffffe,0x00000004fffffffd
Lone_mont:
.quad 0x0000000000000001,0xffffffff00000000,0xffffffffffffffff,0x00000000fffffffe
Lone:
.quad 1,0,0,0
Lord:
.quad 0xf3b9cac2fc632551,0xbce6faada7179e84,0xffffffffffffffff,0xffffffff00000000
LordK:
.quad 0xccd1c8aaee00bc4f
.byte 69,67,80,95,78,73,83,84,90,50,53,54,32,102,111,114,32,65,82,77,118,56,44,32,67,82,89,80,84,79,71,65,77,83,32,98,121,32,60,97,112,112,114,111,64,111,112,101,110,115,115,108,46,111,114,103,62,0
.align 2
.text



.globl _aws_lc_0_27_1_ecp_nistz256_mul_mont
.private_extern _aws_lc_0_27_1_ecp_nistz256_mul_mont

.align 4
_aws_lc_0_27_1_ecp_nistz256_mul_mont:

 stp x29,x30,[sp,#-32]!
 add x29,sp,#0
 stp x19,x20,[sp,#16]

 ldr x3,[x2]
 ldp x4,x5,[x1]
 ldp x6,x7,[x1,#16]
 adrp x13,Lpoly@PAGE
 add x13,x13,Lpoly@PAGEOFF
 ldr x12,[x13,#8]
 ldr x13,[x13,#24]

 bl __ecp_nistz256_mul_mont

 ldp x19,x20,[sp,#16]
 ldp x29,x30,[sp],#32

 ret



.globl _aws_lc_0_27_1_ecp_nistz256_sqr_mont
.private_extern _aws_lc_0_27_1_ecp_nistz256_sqr_mont

.align 4
_aws_lc_0_27_1_ecp_nistz256_sqr_mont:

 stp x29,x30,[sp,#-32]!
 add x29,sp,#0
 stp x19,x20,[sp,#16]

 ldp x4,x5,[x1]
 ldp x6,x7,[x1,#16]
 adrp x13,Lpoly@PAGE
 add x13,x13,Lpoly@PAGEOFF
 ldr x12,[x13,#8]
 ldr x13,[x13,#24]

 bl __ecp_nistz256_sqr_mont

 ldp x19,x20,[sp,#16]
 ldp x29,x30,[sp],#32

 ret



.globl _aws_lc_0_27_1_ecp_nistz256_div_by_2
.private_extern _aws_lc_0_27_1_ecp_nistz256_div_by_2

.align 4
_aws_lc_0_27_1_ecp_nistz256_div_by_2:

 stp x29,x30,[sp,#-16]!
 add x29,sp,#0

 ldp x14,x15,[x1]
 ldp x16,x17,[x1,#16]
 adrp x13,Lpoly@PAGE
 add x13,x13,Lpoly@PAGEOFF
 ldr x12,[x13,#8]
 ldr x13,[x13,#24]

 bl __ecp_nistz256_div_by_2

 ldp x29,x30,[sp],#16

 ret



.globl _aws_lc_0_27_1_ecp_nistz256_mul_by_2
.private_extern _aws_lc_0_27_1_ecp_nistz256_mul_by_2

.align 4
_aws_lc_0_27_1_ecp_nistz256_mul_by_2:

 stp x29,x30,[sp,#-16]!
 add x29,sp,#0

 ldp x14,x15,[x1]
 ldp x16,x17,[x1,#16]
 adrp x13,Lpoly@PAGE
 add x13,x13,Lpoly@PAGEOFF
 ldr x12,[x13,#8]
 ldr x13,[x13,#24]
 mov x8,x14
 mov x9,x15
 mov x10,x16
 mov x11,x17

 bl __ecp_nistz256_add_to

 ldp x29,x30,[sp],#16

 ret



.globl _aws_lc_0_27_1_ecp_nistz256_mul_by_3
.private_extern _aws_lc_0_27_1_ecp_nistz256_mul_by_3

.align 4
_aws_lc_0_27_1_ecp_nistz256_mul_by_3:

 stp x29,x30,[sp,#-16]!
 add x29,sp,#0

 ldp x14,x15,[x1]
 ldp x16,x17,[x1,#16]
 adrp x13,Lpoly@PAGE
 add x13,x13,Lpoly@PAGEOFF
 ldr x12,[x13,#8]
 ldr x13,[x13,#24]
 mov x8,x14
 mov x9,x15
 mov x10,x16
 mov x11,x17
 mov x4,x14
 mov x5,x15
 mov x6,x16
 mov x7,x17

 bl __ecp_nistz256_add_to

 mov x8,x4
 mov x9,x5
 mov x10,x6
 mov x11,x7

 bl __ecp_nistz256_add_to

 ldp x29,x30,[sp],#16

 ret




.globl _aws_lc_0_27_1_ecp_nistz256_sub
.private_extern _aws_lc_0_27_1_ecp_nistz256_sub

.align 4
_aws_lc_0_27_1_ecp_nistz256_sub:

 stp x29,x30,[sp,#-16]!
 add x29,sp,#0

 ldp x14,x15,[x1]
 ldp x16,x17,[x1,#16]
 adrp x13,Lpoly@PAGE
 add x13,x13,Lpoly@PAGEOFF
 ldr x12,[x13,#8]
 ldr x13,[x13,#24]

 bl __ecp_nistz256_sub_from

 ldp x29,x30,[sp],#16

 ret



.globl _aws_lc_0_27_1_ecp_nistz256_neg
.private_extern _aws_lc_0_27_1_ecp_nistz256_neg

.align 4
_aws_lc_0_27_1_ecp_nistz256_neg:

 stp x29,x30,[sp,#-16]!
 add x29,sp,#0

 mov x2,x1
 mov x14,xzr
 mov x15,xzr
 mov x16,xzr
 mov x17,xzr
 adrp x13,Lpoly@PAGE
 add x13,x13,Lpoly@PAGEOFF
 ldr x12,[x13,#8]
 ldr x13,[x13,#24]

 bl __ecp_nistz256_sub_from

 ldp x29,x30,[sp],#16

 ret





.align 4
__ecp_nistz256_mul_mont:
 mul x14,x4,x3
 umulh x8,x4,x3

 mul x15,x5,x3
 umulh x9,x5,x3

 mul x16,x6,x3
 umulh x10,x6,x3

 mul x17,x7,x3
 umulh x11,x7,x3
 ldr x3,[x2,#8]

 adds x15,x15,x8
 lsl x8,x14,#32
 adcs x16,x16,x9
 lsr x9,x14,#32
 adcs x17,x17,x10
 adc x19,xzr,x11
 mov x20,xzr
 subs x10,x14,x8
 sbc x11,x14,x9
 adds x14,x15,x8
 mul x8,x4,x3
 adcs x15,x16,x9
 mul x9,x5,x3
 adcs x16,x17,x10
 mul x10,x6,x3
 adcs x17,x19,x11
 mul x11,x7,x3
 adc x19,x20,xzr

 adds x14,x14,x8
 umulh x8,x4,x3
 adcs x15,x15,x9
 umulh x9,x5,x3
 adcs x16,x16,x10
 umulh x10,x6,x3
 adcs x17,x17,x11
 umulh x11,x7,x3
 adc x19,x19,xzr
 ldr x3,[x2,#8*(1+1)]
 adds x15,x15,x8
 lsl x8,x14,#32
 adcs x16,x16,x9
 lsr x9,x14,#32
 adcs x17,x17,x10
 adcs x19,x19,x11
 adc x20,xzr,xzr
 subs x10,x14,x8
 sbc x11,x14,x9
 adds x14,x15,x8
 mul x8,x4,x3
 adcs x15,x16,x9
 mul x9,x5,x3
 adcs x16,x17,x10
 mul x10,x6,x3
 adcs x17,x19,x11
 mul x11,x7,x3
 adc x19,x20,xzr

 adds x14,x14,x8
 umulh x8,x4,x3
 adcs x15,x15,x9
 umulh x9,x5,x3
 adcs x16,x16,x10
 umulh x10,x6,x3
 adcs x17,x17,x11
 umulh x11,x7,x3
 adc x19,x19,xzr
 ldr x3,[x2,#8*(2+1)]
 adds x15,x15,x8
 lsl x8,x14,#32
 adcs x16,x16,x9
 lsr x9,x14,#32
 adcs x17,x17,x10
 adcs x19,x19,x11
 adc x20,xzr,xzr
 subs x10,x14,x8
 sbc x11,x14,x9
 adds x14,x15,x8
 mul x8,x4,x3
 adcs x15,x16,x9
 mul x9,x5,x3
 adcs x16,x17,x10
 mul x10,x6,x3
 adcs x17,x19,x11
 mul x11,x7,x3
 adc x19,x20,xzr

 adds x14,x14,x8
 umulh x8,x4,x3
 adcs x15,x15,x9
 umulh x9,x5,x3
 adcs x16,x16,x10
 umulh x10,x6,x3
 adcs x17,x17,x11
 umulh x11,x7,x3
 adc x19,x19,xzr
 adds x15,x15,x8
 lsl x8,x14,#32
 adcs x16,x16,x9
 lsr x9,x14,#32
 adcs x17,x17,x10
 adcs x19,x19,x11
 adc x20,xzr,xzr

 subs x10,x14,x8
 sbc x11,x14,x9
 adds x14,x15,x8
 adcs x15,x16,x9
 adcs x16,x17,x10
 adcs x17,x19,x11
 adc x19,x20,xzr

 adds x8,x14,#1
 sbcs x9,x15,x12
 sbcs x10,x16,xzr
 sbcs x11,x17,x13
 sbcs xzr,x19,xzr

 csel x14,x14,x8,lo
 csel x15,x15,x9,lo
 csel x16,x16,x10,lo
 stp x14,x15,[x0]
 csel x17,x17,x11,lo
 stp x16,x17,[x0,#16]

 ret





.align 4
__ecp_nistz256_sqr_mont:
# 379 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/p256-armv8-asm.S"
 mul x15,x5,x4
 umulh x9,x5,x4
 mul x16,x6,x4
 umulh x10,x6,x4
 mul x17,x7,x4
 umulh x19,x7,x4

 adds x16,x16,x9
 mul x8,x6,x5
 umulh x9,x6,x5
 adcs x17,x17,x10
 mul x10,x7,x5
 umulh x11,x7,x5
 adc x19,x19,xzr

 mul x20,x7,x6
 umulh x1,x7,x6

 adds x9,x9,x10
 mul x14,x4,x4
 adc x10,x11,xzr

 adds x17,x17,x8
 umulh x4,x4,x4
 adcs x19,x19,x9
 mul x9,x5,x5
 adcs x20,x20,x10
 umulh x5,x5,x5
 adc x1,x1,xzr

 adds x15,x15,x15
 mul x10,x6,x6
 adcs x16,x16,x16
 umulh x6,x6,x6
 adcs x17,x17,x17
 mul x11,x7,x7
 adcs x19,x19,x19
 umulh x7,x7,x7
 adcs x20,x20,x20
 adcs x1,x1,x1
 adc x2,xzr,xzr

 adds x15,x15,x4
 adcs x16,x16,x9
 adcs x17,x17,x5
 adcs x19,x19,x10
 adcs x20,x20,x6
 lsl x8,x14,#32
 adcs x1,x1,x11
 lsr x9,x14,#32
 adc x2,x2,x7
 subs x10,x14,x8
 sbc x11,x14,x9
 adds x14,x15,x8
 adcs x15,x16,x9
 lsl x8,x14,#32
 adcs x16,x17,x10
 lsr x9,x14,#32
 adc x17,x11,xzr
 subs x10,x14,x8
 sbc x11,x14,x9
 adds x14,x15,x8
 adcs x15,x16,x9
 lsl x8,x14,#32
 adcs x16,x17,x10
 lsr x9,x14,#32
 adc x17,x11,xzr
 subs x10,x14,x8
 sbc x11,x14,x9
 adds x14,x15,x8
 adcs x15,x16,x9
 lsl x8,x14,#32
 adcs x16,x17,x10
 lsr x9,x14,#32
 adc x17,x11,xzr
 subs x10,x14,x8
 sbc x11,x14,x9
 adds x14,x15,x8
 adcs x15,x16,x9
 adcs x16,x17,x10
 adc x17,x11,xzr

 adds x14,x14,x19
 adcs x15,x15,x20
 adcs x16,x16,x1
 adcs x17,x17,x2
 adc x19,xzr,xzr

 adds x8,x14,#1
 sbcs x9,x15,x12
 sbcs x10,x16,xzr
 sbcs x11,x17,x13
 sbcs xzr,x19,xzr

 csel x14,x14,x8,lo
 csel x15,x15,x9,lo
 csel x16,x16,x10,lo
 stp x14,x15,[x0]
 csel x17,x17,x11,lo
 stp x16,x17,[x0,#16]

 ret






.align 4
__ecp_nistz256_add_to:
 adds x14,x14,x8
 adcs x15,x15,x9
 adcs x16,x16,x10
 adcs x17,x17,x11
 adc x1,xzr,xzr

 adds x8,x14,#1
 sbcs x9,x15,x12
 sbcs x10,x16,xzr
 sbcs x11,x17,x13
 sbcs xzr,x1,xzr

 csel x14,x14,x8,lo
 csel x15,x15,x9,lo
 csel x16,x16,x10,lo
 stp x14,x15,[x0]
 csel x17,x17,x11,lo
 stp x16,x17,[x0,#16]

 ret



.align 4
__ecp_nistz256_sub_from:
 ldp x8,x9,[x2]
 ldp x10,x11,[x2,#16]
 subs x14,x14,x8
 sbcs x15,x15,x9
 sbcs x16,x16,x10
 sbcs x17,x17,x11
 sbc x1,xzr,xzr

 subs x8,x14,#1
 adcs x9,x15,x12
 adcs x10,x16,xzr
 adc x11,x17,x13
 cmp x1,xzr

 csel x14,x14,x8,eq
 csel x15,x15,x9,eq
 csel x16,x16,x10,eq
 stp x14,x15,[x0]
 csel x17,x17,x11,eq
 stp x16,x17,[x0,#16]

 ret



.align 4
__ecp_nistz256_sub_morf:
 ldp x8,x9,[x2]
 ldp x10,x11,[x2,#16]
 subs x14,x8,x14
 sbcs x15,x9,x15
 sbcs x16,x10,x16
 sbcs x17,x11,x17
 sbc x1,xzr,xzr

 subs x8,x14,#1
 adcs x9,x15,x12
 adcs x10,x16,xzr
 adc x11,x17,x13
 cmp x1,xzr

 csel x14,x14,x8,eq
 csel x15,x15,x9,eq
 csel x16,x16,x10,eq
 stp x14,x15,[x0]
 csel x17,x17,x11,eq
 stp x16,x17,[x0,#16]

 ret



.align 4
__ecp_nistz256_div_by_2:
 subs x8,x14,#1
 adcs x9,x15,x12
 adcs x10,x16,xzr
 adcs x11,x17,x13
 adc x1,xzr,xzr
 tst x14,#1

 csel x14,x14,x8,eq
 csel x15,x15,x9,eq
 csel x16,x16,x10,eq
 csel x17,x17,x11,eq
 csel x1,xzr,x1,eq

 lsr x14,x14,#1
 orr x14,x14,x15,lsl#63
 lsr x15,x15,#1
 orr x15,x15,x16,lsl#63
 lsr x16,x16,#1
 orr x16,x16,x17,lsl#63
 lsr x17,x17,#1
 stp x14,x15,[x0]
 orr x17,x17,x1,lsl#63
 stp x16,x17,[x0,#16]

 ret

.globl _aws_lc_0_27_1_ecp_nistz256_point_double
.private_extern _aws_lc_0_27_1_ecp_nistz256_point_double

.align 5
_aws_lc_0_27_1_ecp_nistz256_point_double:

 stp x29,x30,[sp,#-96]!
 add x29,sp,#0
 stp x19,x20,[sp,#16]
 stp x21,x22,[sp,#32]
 sub sp,sp,#32*4

Ldouble_shortcut:
 ldp x14,x15,[x1,#32]
 mov x21,x0
 ldp x16,x17,[x1,#48]
 mov x22,x1
 adrp x13,Lpoly@PAGE
 add x13,x13,Lpoly@PAGEOFF
 ldr x12,[x13,#8]
 mov x8,x14
 ldr x13,[x13,#24]
 mov x9,x15
 ldp x4,x5,[x22,#64]
 mov x10,x16
 mov x11,x17
 ldp x6,x7,[x22,#64+16]
 add x0,sp,#0
 bl __ecp_nistz256_add_to

 add x0,sp,#64
 bl __ecp_nistz256_sqr_mont

 ldp x8,x9,[x22]
 ldp x10,x11,[x22,#16]
 mov x4,x14
 mov x5,x15
 mov x6,x16
 mov x7,x17
 add x0,sp,#32
 bl __ecp_nistz256_add_to

 add x2,x22,#0
 mov x14,x4
 mov x15,x5
 ldp x4,x5,[sp,#0]
 mov x16,x6
 mov x17,x7
 ldp x6,x7,[sp,#0+16]
 add x0,sp,#64
 bl __ecp_nistz256_sub_morf

 add x0,sp,#0
 bl __ecp_nistz256_sqr_mont

 ldr x3,[x22,#32]
 ldp x4,x5,[x22,#64]
 ldp x6,x7,[x22,#64+16]
 add x2,x22,#32
 add x0,sp,#96
 bl __ecp_nistz256_mul_mont

 mov x8,x14
 mov x9,x15
 ldp x4,x5,[sp,#0]
 mov x10,x16
 mov x11,x17
 ldp x6,x7,[sp,#0+16]
 add x0,x21,#64
 bl __ecp_nistz256_add_to

 add x0,sp,#96
 bl __ecp_nistz256_sqr_mont

 ldr x3,[sp,#64]
 ldp x4,x5,[sp,#32]
 ldp x6,x7,[sp,#32+16]
 add x0,x21,#32
 bl __ecp_nistz256_div_by_2

 add x2,sp,#64
 add x0,sp,#32
 bl __ecp_nistz256_mul_mont

 mov x8,x14
 mov x9,x15
 mov x10,x16
 mov x11,x17
 mov x4,x14
 mov x5,x15
 mov x6,x16
 mov x7,x17
 add x0,sp,#32
 bl __ecp_nistz256_add_to
 mov x8,x4
 mov x9,x5
 ldr x3,[x22]
 mov x10,x6
 ldp x4,x5,[sp,#0]
 mov x11,x7
 ldp x6,x7,[sp,#0+16]
 bl __ecp_nistz256_add_to

 add x2,x22,#0
 add x0,sp,#0
 bl __ecp_nistz256_mul_mont

 mov x8,x14
 mov x9,x15
 ldp x4,x5,[sp,#32]
 mov x10,x16
 mov x11,x17
 ldp x6,x7,[sp,#32+16]
 add x0,sp,#96
 bl __ecp_nistz256_add_to

 add x0,x21,#0
 bl __ecp_nistz256_sqr_mont

 add x2,sp,#96
 bl __ecp_nistz256_sub_from

 add x2,sp,#0
 add x0,sp,#0
 bl __ecp_nistz256_sub_morf

 ldr x3,[sp,#32]
 mov x4,x14
 mov x5,x15
 mov x6,x16
 mov x7,x17
 add x2,sp,#32
 bl __ecp_nistz256_mul_mont

 add x2,x21,#32
 add x0,x21,#32
 bl __ecp_nistz256_sub_from

 add sp,x29,#0
 ldp x19,x20,[x29,#16]
 ldp x21,x22,[x29,#32]
 ldp x29,x30,[sp],#96

 ret

.globl _aws_lc_0_27_1_ecp_nistz256_point_add
.private_extern _aws_lc_0_27_1_ecp_nistz256_point_add

.align 5
_aws_lc_0_27_1_ecp_nistz256_point_add:

 stp x29,x30,[sp,#-96]!
 add x29,sp,#0
 stp x19,x20,[sp,#16]
 stp x21,x22,[sp,#32]
 stp x23,x24,[sp,#48]
 stp x25,x26,[sp,#64]
 stp x27,x28,[sp,#80]
 sub sp,sp,#32*12

 ldp x4,x5,[x2,#64]
 ldp x6,x7,[x2,#64+16]
 mov x21,x0
 mov x22,x1
 mov x23,x2
 adrp x13,Lpoly@PAGE
 add x13,x13,Lpoly@PAGEOFF
 ldr x12,[x13,#8]
 ldr x13,[x13,#24]
 orr x8,x4,x5
 orr x10,x6,x7
 orr x25,x8,x10
 cmp x25,#0
 csetm x25,ne
 add x0,sp,#192
 bl __ecp_nistz256_sqr_mont

 ldp x4,x5,[x22,#64]
 ldp x6,x7,[x22,#64+16]
 orr x8,x4,x5
 orr x10,x6,x7
 orr x24,x8,x10
 cmp x24,#0
 csetm x24,ne
 add x0,sp,#128
 bl __ecp_nistz256_sqr_mont

 ldr x3,[x23,#64]
 ldp x4,x5,[sp,#192]
 ldp x6,x7,[sp,#192+16]
 add x2,x23,#64
 add x0,sp,#320
 bl __ecp_nistz256_mul_mont

 ldr x3,[x22,#64]
 ldp x4,x5,[sp,#128]
 ldp x6,x7,[sp,#128+16]
 add x2,x22,#64
 add x0,sp,#352
 bl __ecp_nistz256_mul_mont

 ldr x3,[x22,#32]
 ldp x4,x5,[sp,#320]
 ldp x6,x7,[sp,#320+16]
 add x2,x22,#32
 add x0,sp,#320
 bl __ecp_nistz256_mul_mont

 ldr x3,[x23,#32]
 ldp x4,x5,[sp,#352]
 ldp x6,x7,[sp,#352+16]
 add x2,x23,#32
 add x0,sp,#352
 bl __ecp_nistz256_mul_mont

 add x2,sp,#320
 ldr x3,[sp,#192]
 ldp x4,x5,[x22]
 ldp x6,x7,[x22,#16]
 add x0,sp,#160
 bl __ecp_nistz256_sub_from

 orr x14,x14,x15
 orr x16,x16,x17
 orr x26,x14,x16

 add x2,sp,#192
 add x0,sp,#256
 bl __ecp_nistz256_mul_mont

 ldr x3,[sp,#128]
 ldp x4,x5,[x23]
 ldp x6,x7,[x23,#16]
 add x2,sp,#128
 add x0,sp,#288
 bl __ecp_nistz256_mul_mont

 add x2,sp,#256
 ldp x4,x5,[sp,#160]
 ldp x6,x7,[sp,#160+16]
 add x0,sp,#96
 bl __ecp_nistz256_sub_from

 orr x14,x14,x15
 orr x16,x16,x17
 orr x14,x14,x16

 mvn x27,x24
 mvn x28,x25
 orr x14,x14,x27
 orr x14,x14,x28
 orr x14,x14,x26
 cbnz x14,Ladd_proceed

Ladd_double:
 mov x1,x22
 mov x0,x21
 ldp x23,x24,[x29,#48]
 ldp x25,x26,[x29,#64]
 ldp x27,x28,[x29,#80]
 add sp,sp,#256
 b Ldouble_shortcut

.align 4
Ladd_proceed:
 add x0,sp,#192
 bl __ecp_nistz256_sqr_mont

 ldr x3,[x22,#64]
 ldp x4,x5,[sp,#96]
 ldp x6,x7,[sp,#96+16]
 add x2,x22,#64
 add x0,sp,#64
 bl __ecp_nistz256_mul_mont

 ldp x4,x5,[sp,#96]
 ldp x6,x7,[sp,#96+16]
 add x0,sp,#128
 bl __ecp_nistz256_sqr_mont

 ldr x3,[x23,#64]
 ldp x4,x5,[sp,#64]
 ldp x6,x7,[sp,#64+16]
 add x2,x23,#64
 add x0,sp,#64
 bl __ecp_nistz256_mul_mont

 ldr x3,[sp,#96]
 ldp x4,x5,[sp,#128]
 ldp x6,x7,[sp,#128+16]
 add x2,sp,#96
 add x0,sp,#224
 bl __ecp_nistz256_mul_mont

 ldr x3,[sp,#128]
 ldp x4,x5,[sp,#256]
 ldp x6,x7,[sp,#256+16]
 add x2,sp,#128
 add x0,sp,#288
 bl __ecp_nistz256_mul_mont

 mov x8,x14
 mov x9,x15
 mov x10,x16
 mov x11,x17
 add x0,sp,#128
 bl __ecp_nistz256_add_to

 add x2,sp,#192
 add x0,sp,#0
 bl __ecp_nistz256_sub_morf

 add x2,sp,#224
 bl __ecp_nistz256_sub_from

 add x2,sp,#288
 ldr x3,[sp,#224]
 ldp x4,x5,[sp,#320]
 ldp x6,x7,[sp,#320+16]
 add x0,sp,#32
 bl __ecp_nistz256_sub_morf

 add x2,sp,#224
 add x0,sp,#352
 bl __ecp_nistz256_mul_mont

 ldr x3,[sp,#160]
 ldp x4,x5,[sp,#32]
 ldp x6,x7,[sp,#32+16]
 add x2,sp,#160
 add x0,sp,#32
 bl __ecp_nistz256_mul_mont

 add x2,sp,#352
 bl __ecp_nistz256_sub_from

 ldp x4,x5,[sp,#0]
 ldp x6,x7,[sp,#0+16]
 ldp x8,x9,[x23]
 ldp x10,x11,[x23,#16]
 ldp x14,x15,[x22,#0]
 cmp x24,#0
 ldp x16,x17,[x22,#0+16]
 csel x8,x4,x8,ne
 csel x9,x5,x9,ne
 ldp x4,x5,[sp,#0+0+32]
 csel x10,x6,x10,ne
 csel x11,x7,x11,ne
 cmp x25,#0
 ldp x6,x7,[sp,#0+0+48]
 csel x14,x8,x14,ne
 csel x15,x9,x15,ne
 ldp x8,x9,[x23,#0+32]
 csel x16,x10,x16,ne
 csel x17,x11,x17,ne
 ldp x10,x11,[x23,#0+48]
 stp x14,x15,[x21,#0]
 stp x16,x17,[x21,#0+16]
 ldp x14,x15,[x22,#32]
 cmp x24,#0
 ldp x16,x17,[x22,#32+16]
 csel x8,x4,x8,ne
 csel x9,x5,x9,ne
 ldp x4,x5,[sp,#0+32+32]
 csel x10,x6,x10,ne
 csel x11,x7,x11,ne
 cmp x25,#0
 ldp x6,x7,[sp,#0+32+48]
 csel x14,x8,x14,ne
 csel x15,x9,x15,ne
 ldp x8,x9,[x23,#32+32]
 csel x16,x10,x16,ne
 csel x17,x11,x17,ne
 ldp x10,x11,[x23,#32+48]
 stp x14,x15,[x21,#32]
 stp x16,x17,[x21,#32+16]
 ldp x14,x15,[x22,#64]
 cmp x24,#0
 ldp x16,x17,[x22,#64+16]
 csel x8,x4,x8,ne
 csel x9,x5,x9,ne
 csel x10,x6,x10,ne
 csel x11,x7,x11,ne
 cmp x25,#0
 csel x14,x8,x14,ne
 csel x15,x9,x15,ne
 csel x16,x10,x16,ne
 csel x17,x11,x17,ne
 stp x14,x15,[x21,#64]
 stp x16,x17,[x21,#64+16]

Ladd_done:
 add sp,x29,#0
 ldp x19,x20,[x29,#16]
 ldp x21,x22,[x29,#32]
 ldp x23,x24,[x29,#48]
 ldp x25,x26,[x29,#64]
 ldp x27,x28,[x29,#80]
 ldp x29,x30,[sp],#96

 ret

.globl _aws_lc_0_27_1_ecp_nistz256_point_add_affine
.private_extern _aws_lc_0_27_1_ecp_nistz256_point_add_affine

.align 5
_aws_lc_0_27_1_ecp_nistz256_point_add_affine:

 stp x29,x30,[sp,#-80]!
 add x29,sp,#0
 stp x19,x20,[sp,#16]
 stp x21,x22,[sp,#32]
 stp x23,x24,[sp,#48]
 stp x25,x26,[sp,#64]
 sub sp,sp,#32*10

 mov x21,x0
 mov x22,x1
 mov x23,x2
 adrp x13,Lpoly@PAGE
 add x13,x13,Lpoly@PAGEOFF
 ldr x12,[x13,#8]
 ldr x13,[x13,#24]

 ldp x4,x5,[x1,#64]
 ldp x6,x7,[x1,#64+16]
 orr x8,x4,x5
 orr x10,x6,x7
 orr x24,x8,x10
 cmp x24,#0
 csetm x24,ne

 ldp x14,x15,[x2]
 ldp x16,x17,[x2,#16]
 ldp x8,x9,[x2,#32]
 ldp x10,x11,[x2,#48]
 orr x14,x14,x15
 orr x16,x16,x17
 orr x8,x8,x9
 orr x10,x10,x11
 orr x14,x14,x16
 orr x8,x8,x10
 orr x25,x14,x8
 cmp x25,#0
 csetm x25,ne

 add x0,sp,#128
 bl __ecp_nistz256_sqr_mont

 mov x4,x14
 mov x5,x15
 mov x6,x16
 mov x7,x17
 ldr x3,[x23]
 add x2,x23,#0
 add x0,sp,#96
 bl __ecp_nistz256_mul_mont

 add x2,x22,#0
 ldr x3,[x22,#64]
 ldp x4,x5,[sp,#128]
 ldp x6,x7,[sp,#128+16]
 add x0,sp,#160
 bl __ecp_nistz256_sub_from

 add x2,x22,#64
 add x0,sp,#128
 bl __ecp_nistz256_mul_mont

 ldr x3,[x22,#64]
 ldp x4,x5,[sp,#160]
 ldp x6,x7,[sp,#160+16]
 add x2,x22,#64
 add x0,sp,#64
 bl __ecp_nistz256_mul_mont

 ldr x3,[x23,#32]
 ldp x4,x5,[sp,#128]
 ldp x6,x7,[sp,#128+16]
 add x2,x23,#32
 add x0,sp,#128
 bl __ecp_nistz256_mul_mont

 add x2,x22,#32
 ldp x4,x5,[sp,#160]
 ldp x6,x7,[sp,#160+16]
 add x0,sp,#192
 bl __ecp_nistz256_sub_from

 add x0,sp,#224
 bl __ecp_nistz256_sqr_mont

 ldp x4,x5,[sp,#192]
 ldp x6,x7,[sp,#192+16]
 add x0,sp,#288
 bl __ecp_nistz256_sqr_mont

 ldr x3,[sp,#160]
 ldp x4,x5,[sp,#224]
 ldp x6,x7,[sp,#224+16]
 add x2,sp,#160
 add x0,sp,#256
 bl __ecp_nistz256_mul_mont

 ldr x3,[x22]
 ldp x4,x5,[sp,#224]
 ldp x6,x7,[sp,#224+16]
 add x2,x22,#0
 add x0,sp,#96
 bl __ecp_nistz256_mul_mont

 mov x8,x14
 mov x9,x15
 mov x10,x16
 mov x11,x17
 add x0,sp,#224
 bl __ecp_nistz256_add_to

 add x2,sp,#288
 add x0,sp,#0
 bl __ecp_nistz256_sub_morf

 add x2,sp,#256
 bl __ecp_nistz256_sub_from

 add x2,sp,#96
 ldr x3,[x22,#32]
 ldp x4,x5,[sp,#256]
 ldp x6,x7,[sp,#256+16]
 add x0,sp,#32
 bl __ecp_nistz256_sub_morf

 add x2,x22,#32
 add x0,sp,#128
 bl __ecp_nistz256_mul_mont

 ldr x3,[sp,#192]
 ldp x4,x5,[sp,#32]
 ldp x6,x7,[sp,#32+16]
 add x2,sp,#192
 add x0,sp,#32
 bl __ecp_nistz256_mul_mont

 add x2,sp,#128
 bl __ecp_nistz256_sub_from

 ldp x4,x5,[sp,#0]
 ldp x6,x7,[sp,#0+16]
 ldp x8,x9,[x23]
 ldp x10,x11,[x23,#16]
 ldp x14,x15,[x22,#0]
 cmp x24,#0
 ldp x16,x17,[x22,#0+16]
 csel x8,x4,x8,ne
 csel x9,x5,x9,ne
 ldp x4,x5,[sp,#0+0+32]
 csel x10,x6,x10,ne
 csel x11,x7,x11,ne
 cmp x25,#0
 ldp x6,x7,[sp,#0+0+48]
 csel x14,x8,x14,ne
 csel x15,x9,x15,ne
 ldp x8,x9,[x23,#0+32]
 csel x16,x10,x16,ne
 csel x17,x11,x17,ne
 ldp x10,x11,[x23,#0+48]
 stp x14,x15,[x21,#0]
 stp x16,x17,[x21,#0+16]
 adrp x23,Lone_mont@PAGE-64
 add x23,x23,Lone_mont@PAGEOFF-64
 ldp x14,x15,[x22,#32]
 cmp x24,#0
 ldp x16,x17,[x22,#32+16]
 csel x8,x4,x8,ne
 csel x9,x5,x9,ne
 ldp x4,x5,[sp,#0+32+32]
 csel x10,x6,x10,ne
 csel x11,x7,x11,ne
 cmp x25,#0
 ldp x6,x7,[sp,#0+32+48]
 csel x14,x8,x14,ne
 csel x15,x9,x15,ne
 ldp x8,x9,[x23,#32+32]
 csel x16,x10,x16,ne
 csel x17,x11,x17,ne
 ldp x10,x11,[x23,#32+48]
 stp x14,x15,[x21,#32]
 stp x16,x17,[x21,#32+16]
 ldp x14,x15,[x22,#64]
 cmp x24,#0
 ldp x16,x17,[x22,#64+16]
 csel x8,x4,x8,ne
 csel x9,x5,x9,ne
 csel x10,x6,x10,ne
 csel x11,x7,x11,ne
 cmp x25,#0
 csel x14,x8,x14,ne
 csel x15,x9,x15,ne
 csel x16,x10,x16,ne
 csel x17,x11,x17,ne
 stp x14,x15,[x21,#64]
 stp x16,x17,[x21,#64+16]

 add sp,x29,#0
 ldp x19,x20,[x29,#16]
 ldp x21,x22,[x29,#32]
 ldp x23,x24,[x29,#48]
 ldp x25,x26,[x29,#64]
 ldp x29,x30,[sp],#80

 ret




.globl _aws_lc_0_27_1_ecp_nistz256_ord_mul_mont
.private_extern _aws_lc_0_27_1_ecp_nistz256_ord_mul_mont

.align 4
_aws_lc_0_27_1_ecp_nistz256_ord_mul_mont:


 stp x29,x30,[sp,#-64]!
 add x29,sp,#0
 stp x19,x20,[sp,#16]
 stp x21,x22,[sp,#32]
 stp x23,x24,[sp,#48]

 adrp x23,Lord@PAGE
 add x23,x23,Lord@PAGEOFF
 ldr x3,[x2]
 ldp x4,x5,[x1]
 ldp x6,x7,[x1,#16]

 ldp x12,x13,[x23,#0]
 ldp x21,x22,[x23,#16]
 ldr x23,[x23,#32]

 mul x14,x4,x3
 umulh x8,x4,x3

 mul x15,x5,x3
 umulh x9,x5,x3

 mul x16,x6,x3
 umulh x10,x6,x3

 mul x17,x7,x3
 umulh x19,x7,x3

 mul x24,x14,x23

 adds x15,x15,x8
 adcs x16,x16,x9
 adcs x17,x17,x10
 adc x19,x19,xzr
 mov x20,xzr
 ldr x3,[x2,#8*1]

 lsl x8,x24,#32
 subs x16,x16,x24
 lsr x9,x24,#32
 sbcs x17,x17,x8
 sbcs x19,x19,x9
 sbc x20,x20,xzr

 subs xzr,x14,#1
 umulh x9,x12,x24
 mul x10,x13,x24
 umulh x11,x13,x24

 adcs x10,x10,x9
 mul x8,x4,x3
 adc x11,x11,xzr
 mul x9,x5,x3

 adds x14,x15,x10
 mul x10,x6,x3
 adcs x15,x16,x11
 mul x11,x7,x3
 adcs x16,x17,x24
 adcs x17,x19,x24
 adc x19,x20,xzr

 adds x14,x14,x8
 umulh x8,x4,x3
 adcs x15,x15,x9
 umulh x9,x5,x3
 adcs x16,x16,x10
 umulh x10,x6,x3
 adcs x17,x17,x11
 umulh x11,x7,x3
 adc x19,x19,xzr
 mul x24,x14,x23
 adds x15,x15,x8
 adcs x16,x16,x9
 adcs x17,x17,x10
 adcs x19,x19,x11
 adc x20,xzr,xzr
 ldr x3,[x2,#8*2]

 lsl x8,x24,#32
 subs x16,x16,x24
 lsr x9,x24,#32
 sbcs x17,x17,x8
 sbcs x19,x19,x9
 sbc x20,x20,xzr

 subs xzr,x14,#1
 umulh x9,x12,x24
 mul x10,x13,x24
 umulh x11,x13,x24

 adcs x10,x10,x9
 mul x8,x4,x3
 adc x11,x11,xzr
 mul x9,x5,x3

 adds x14,x15,x10
 mul x10,x6,x3
 adcs x15,x16,x11
 mul x11,x7,x3
 adcs x16,x17,x24
 adcs x17,x19,x24
 adc x19,x20,xzr

 adds x14,x14,x8
 umulh x8,x4,x3
 adcs x15,x15,x9
 umulh x9,x5,x3
 adcs x16,x16,x10
 umulh x10,x6,x3
 adcs x17,x17,x11
 umulh x11,x7,x3
 adc x19,x19,xzr
 mul x24,x14,x23
 adds x15,x15,x8
 adcs x16,x16,x9
 adcs x17,x17,x10
 adcs x19,x19,x11
 adc x20,xzr,xzr
 ldr x3,[x2,#8*3]

 lsl x8,x24,#32
 subs x16,x16,x24
 lsr x9,x24,#32
 sbcs x17,x17,x8
 sbcs x19,x19,x9
 sbc x20,x20,xzr

 subs xzr,x14,#1
 umulh x9,x12,x24
 mul x10,x13,x24
 umulh x11,x13,x24

 adcs x10,x10,x9
 mul x8,x4,x3
 adc x11,x11,xzr
 mul x9,x5,x3

 adds x14,x15,x10
 mul x10,x6,x3
 adcs x15,x16,x11
 mul x11,x7,x3
 adcs x16,x17,x24
 adcs x17,x19,x24
 adc x19,x20,xzr

 adds x14,x14,x8
 umulh x8,x4,x3
 adcs x15,x15,x9
 umulh x9,x5,x3
 adcs x16,x16,x10
 umulh x10,x6,x3
 adcs x17,x17,x11
 umulh x11,x7,x3
 adc x19,x19,xzr
 mul x24,x14,x23
 adds x15,x15,x8
 adcs x16,x16,x9
 adcs x17,x17,x10
 adcs x19,x19,x11
 adc x20,xzr,xzr
 lsl x8,x24,#32
 subs x16,x16,x24
 lsr x9,x24,#32
 sbcs x17,x17,x8
 sbcs x19,x19,x9
 sbc x20,x20,xzr

 subs xzr,x14,#1
 umulh x9,x12,x24
 mul x10,x13,x24
 umulh x11,x13,x24

 adcs x10,x10,x9
 adc x11,x11,xzr

 adds x14,x15,x10
 adcs x15,x16,x11
 adcs x16,x17,x24
 adcs x17,x19,x24
 adc x19,x20,xzr

 subs x8,x14,x12
 sbcs x9,x15,x13
 sbcs x10,x16,x21
 sbcs x11,x17,x22
 sbcs xzr,x19,xzr

 csel x14,x14,x8,lo
 csel x15,x15,x9,lo
 csel x16,x16,x10,lo
 stp x14,x15,[x0]
 csel x17,x17,x11,lo
 stp x16,x17,[x0,#16]

 ldp x19,x20,[sp,#16]
 ldp x21,x22,[sp,#32]
 ldp x23,x24,[sp,#48]
 ldr x29,[sp],#64
 ret





.globl _aws_lc_0_27_1_ecp_nistz256_ord_sqr_mont
.private_extern _aws_lc_0_27_1_ecp_nistz256_ord_sqr_mont

.align 4
_aws_lc_0_27_1_ecp_nistz256_ord_sqr_mont:


 stp x29,x30,[sp,#-64]!
 add x29,sp,#0
 stp x19,x20,[sp,#16]
 stp x21,x22,[sp,#32]
 stp x23,x24,[sp,#48]

 adrp x23,Lord@PAGE
 add x23,x23,Lord@PAGEOFF
 ldp x4,x5,[x1]
 ldp x6,x7,[x1,#16]

 ldp x12,x13,[x23,#0]
 ldp x21,x22,[x23,#16]
 ldr x23,[x23,#32]
 b Loop_ord_sqr

.align 4
Loop_ord_sqr:
 sub x2,x2,#1
# 1462 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/p256-armv8-asm.S"
 mul x15,x5,x4
 umulh x9,x5,x4
 mul x16,x6,x4
 umulh x10,x6,x4
 mul x17,x7,x4
 umulh x19,x7,x4

 adds x16,x16,x9
 mul x8,x6,x5
 umulh x9,x6,x5
 adcs x17,x17,x10
 mul x10,x7,x5
 umulh x11,x7,x5
 adc x19,x19,xzr

 mul x20,x7,x6
 umulh x1,x7,x6

 adds x9,x9,x10
 mul x14,x4,x4
 adc x10,x11,xzr

 adds x17,x17,x8
 umulh x4,x4,x4
 adcs x19,x19,x9
 mul x9,x5,x5
 adcs x20,x20,x10
 umulh x5,x5,x5
 adc x1,x1,xzr

 adds x15,x15,x15
 mul x10,x6,x6
 adcs x16,x16,x16
 umulh x6,x6,x6
 adcs x17,x17,x17
 mul x11,x7,x7
 adcs x19,x19,x19
 umulh x7,x7,x7
 adcs x20,x20,x20
 adcs x1,x1,x1
 adc x3,xzr,xzr

 adds x15,x15,x4
 mul x24,x14,x23
 adcs x16,x16,x9
 adcs x17,x17,x5
 adcs x19,x19,x10
 adcs x20,x20,x6
 adcs x1,x1,x11
 adc x3,x3,x7
 subs xzr,x14,#1
 umulh x9,x12,x24
 mul x10,x13,x24
 umulh x11,x13,x24

 adcs x10,x10,x9
 adc x11,x11,xzr

 adds x14,x15,x10
 adcs x15,x16,x11
 adcs x16,x17,x24
 adc x17,xzr,x24
 mul x11,x14,x23
 lsl x8,x24,#32
 subs x15,x15,x24
 lsr x9,x24,#32
 sbcs x16,x16,x8
 sbc x17,x17,x9
 subs xzr,x14,#1
 umulh x9,x12,x11
 mul x10,x13,x11
 umulh x24,x13,x11

 adcs x10,x10,x9
 adc x24,x24,xzr

 adds x14,x15,x10
 adcs x15,x16,x24
 adcs x16,x17,x11
 adc x17,xzr,x11
 mul x24,x14,x23
 lsl x8,x11,#32
 subs x15,x15,x11
 lsr x9,x11,#32
 sbcs x16,x16,x8
 sbc x17,x17,x9
 subs xzr,x14,#1
 umulh x9,x12,x24
 mul x10,x13,x24
 umulh x11,x13,x24

 adcs x10,x10,x9
 adc x11,x11,xzr

 adds x14,x15,x10
 adcs x15,x16,x11
 adcs x16,x17,x24
 adc x17,xzr,x24
 mul x11,x14,x23
 lsl x8,x24,#32
 subs x15,x15,x24
 lsr x9,x24,#32
 sbcs x16,x16,x8
 sbc x17,x17,x9
 subs xzr,x14,#1
 umulh x9,x12,x11
 mul x10,x13,x11
 umulh x24,x13,x11

 adcs x10,x10,x9
 adc x24,x24,xzr

 adds x14,x15,x10
 adcs x15,x16,x24
 adcs x16,x17,x11
 adc x17,xzr,x11
 lsl x8,x11,#32
 subs x15,x15,x11
 lsr x9,x11,#32
 sbcs x16,x16,x8
 sbc x17,x17,x9
 adds x14,x14,x19
 adcs x15,x15,x20
 adcs x16,x16,x1
 adcs x17,x17,x3
 adc x19,xzr,xzr

 subs x8,x14,x12
 sbcs x9,x15,x13
 sbcs x10,x16,x21
 sbcs x11,x17,x22
 sbcs xzr,x19,xzr

 csel x4,x14,x8,lo
 csel x5,x15,x9,lo
 csel x6,x16,x10,lo
 csel x7,x17,x11,lo

 cbnz x2,Loop_ord_sqr

 stp x4,x5,[x0]
 stp x6,x7,[x0,#16]

 ldp x19,x20,[sp,#16]
 ldp x21,x22,[sp,#32]
 ldp x23,x24,[sp,#48]
 ldr x29,[sp],#64
 ret



.globl _aws_lc_0_27_1_ecp_nistz256_select_w5
.private_extern _aws_lc_0_27_1_ecp_nistz256_select_w5

.align 4
_aws_lc_0_27_1_ecp_nistz256_select_w5:




 mov x10, x0
 mov w9, #0


 movi v16.16b, #0
 movi v17.16b, #0
 movi v18.16b, #0
 movi v19.16b, #0
 movi v20.16b, #0
 movi v21.16b, #0

Lselect_w5_loop:



 add w9, w9, #1



 ld1 {v22.2d, v23.2d, v24.2d, v25.2d}, [x1],#64


 cmp w9, w2
 csetm x11, eq


 ld1 {v26.2d, v27.2d}, [x1],#32


 dup v3.2d, x11



 bit v16.16b, v22.16b, v3.16b
 bit v17.16b, v23.16b, v3.16b

 bit v18.16b, v24.16b, v3.16b
 bit v19.16b, v25.16b, v3.16b

 bit v20.16b, v26.16b, v3.16b
 bit v21.16b, v27.16b, v3.16b


 tbz w9, #4, Lselect_w5_loop


 st1 {v16.2d, v17.2d, v18.2d, v19.2d}, [x10],#64
 st1 {v20.2d, v21.2d}, [x10]

 ret





.globl _aws_lc_0_27_1_ecp_nistz256_select_w7
.private_extern _aws_lc_0_27_1_ecp_nistz256_select_w7

.align 4
_aws_lc_0_27_1_ecp_nistz256_select_w7:



 mov w9, #0


 movi v16.16b, #0
 movi v17.16b, #0
 movi v18.16b, #0
 movi v19.16b, #0

Lselect_w7_loop:



 add w9, w9, #1



 ld1 {v22.2d, v23.2d, v24.2d, v25.2d}, [x1],#64


 cmp w9, w2
 csetm x11, eq


 dup v3.2d, x11



 bit v16.16b, v22.16b, v3.16b
 bit v17.16b, v23.16b, v3.16b

 bit v18.16b, v24.16b, v3.16b
 bit v19.16b, v25.16b, v3.16b


 tbz w9, #6, Lselect_w7_loop


 st1 {v16.2d, v17.2d, v18.2d, v19.2d}, [x0]

 ret
