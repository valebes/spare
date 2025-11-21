# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/armv8-mont.S"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 467 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/armv8-mont.S" 2



# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h" 1
# 18 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/target.h" 1
# 19 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h" 2
# 41 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/generated-include/openssl/boringssl_prefix_symbols_asm.h" 1
# 42 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h" 2
# 5 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/armv8-mont.S" 2


# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/arm_arch.h" 1
# 8 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/armv8-mont.S" 2

.text

.globl _aws_lc_0_27_1_bn_mul_mont
.private_extern _aws_lc_0_27_1_bn_mul_mont

.align 5
_aws_lc_0_27_1_bn_mul_mont:

 tst x5,#7
 b.eq __bn_sqr8x_mont
 tst x5,#3
 b.eq __bn_mul4x_mont
Lmul_mont:
 stp x29,x30,[sp,#-64]!
 add x29,sp,#0
 stp x19,x20,[sp,#16]
 stp x21,x22,[sp,#32]
 stp x23,x24,[sp,#48]

 ldr x9,[x2],#8
 sub x22,sp,x5,lsl#3
 ldp x7,x8,[x1],#16
 lsl x5,x5,#3
 ldr x4,[x4]
 and x22,x22,#-16
 ldp x13,x14,[x3],#16

 mul x6,x7,x9
 sub x21,x5,#16
 umulh x7,x7,x9
 mul x10,x8,x9
 umulh x11,x8,x9

 mul x15,x6,x4
 mov sp,x22


 umulh x13,x13,x15
 mul x16,x14,x15
# 58 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/armv8-mont.S"
 subs xzr,x6,#1
 umulh x17,x14,x15
 adc x13,x13,xzr
 cbz x21,L1st_skip

L1st:
 ldr x8,[x1],#8
 adds x6,x10,x7
 sub x21,x21,#8
 adc x7,x11,xzr

 ldr x14,[x3],#8
 adds x12,x16,x13
 mul x10,x8,x9
 adc x13,x17,xzr
 umulh x11,x8,x9

 adds x12,x12,x6
 mul x16,x14,x15
 adc x13,x13,xzr
 umulh x17,x14,x15
 str x12,[x22],#8
 cbnz x21,L1st

L1st_skip:
 adds x6,x10,x7
 sub x1,x1,x5
 adc x7,x11,xzr

 adds x12,x16,x13
 sub x3,x3,x5
 adc x13,x17,xzr

 adds x12,x12,x6
 sub x20,x5,#8
 adcs x13,x13,x7

 adc x19,xzr,xzr
 stp x12,x13,[x22]

Louter:
 ldr x9,[x2],#8
 ldp x7,x8,[x1],#16
 ldr x23,[sp]
 add x22,sp,#8

 mul x6,x7,x9
 sub x21,x5,#16
 umulh x7,x7,x9
 ldp x13,x14,[x3],#16
 mul x10,x8,x9
 adds x6,x6,x23
 umulh x11,x8,x9
 adc x7,x7,xzr

 mul x15,x6,x4
 sub x20,x20,#8


 umulh x13,x13,x15
 mul x16,x14,x15

 subs xzr,x6,#1
 umulh x17,x14,x15
 cbz x21,Linner_skip

Linner:
 ldr x8,[x1],#8
 adc x13,x13,xzr
 ldr x23,[x22],#8
 adds x6,x10,x7
 sub x21,x21,#8
 adc x7,x11,xzr

 adds x12,x16,x13
 ldr x14,[x3],#8
 adc x13,x17,xzr

 mul x10,x8,x9
 adds x6,x6,x23
 umulh x11,x8,x9
 adc x7,x7,xzr

 mul x16,x14,x15
 adds x12,x12,x6
 umulh x17,x14,x15
 str x12,[x22,#-16]
 cbnz x21,Linner

Linner_skip:
 ldr x23,[x22],#8
 adc x13,x13,xzr
 adds x6,x10,x7
 sub x1,x1,x5
 adc x7,x11,xzr

 adds x12,x16,x13
 sub x3,x3,x5
 adcs x13,x17,x19
 adc x19,xzr,xzr

 adds x6,x6,x23
 adc x7,x7,xzr

 adds x12,x12,x6
 adcs x13,x13,x7
 adc x19,x19,xzr
 stp x12,x13,[x22,#-16]

 cbnz x20,Louter





 ldr x23,[sp]
 add x22,sp,#8
 ldr x14,[x3],#8
 subs x21,x5,#8
 mov x1,x0
Lsub:
 sbcs x8,x23,x14
 ldr x23,[x22],#8
 sub x21,x21,#8
 ldr x14,[x3],#8
 str x8,[x1],#8
 cbnz x21,Lsub

 sbcs x8,x23,x14
 sbcs x19,x19,xzr
 str x8,[x1],#8

 ldr x23,[sp]
 add x22,sp,#8
 ldr x8,[x0],#8
 sub x5,x5,#8
 nop
Lcond_copy:
 sub x5,x5,#8
 csel x14,x23,x8,lo
 ldr x23,[x22],#8
 ldr x8,[x0],#8
 str xzr,[x22,#-16]
 str x14,[x0,#-16]
 cbnz x5,Lcond_copy

 csel x14,x23,x8,lo
 str xzr,[x22,#-8]
 str x14,[x0,#-8]

 ldp x19,x20,[x29,#16]
 mov sp,x29
 ldp x21,x22,[x29,#32]
 mov x0,#1
 ldp x23,x24,[x29,#48]
 ldr x29,[sp],#64

 ret


.align 5
__bn_sqr8x_mont:


 cmp x1,x2
 b.ne __bn_mul4x_mont
Lsqr8x_mont:
 stp x29,x30,[sp,#-128]!
 add x29,sp,#0
 stp x19,x20,[sp,#16]
 stp x21,x22,[sp,#32]
 stp x23,x24,[sp,#48]
 stp x25,x26,[sp,#64]
 stp x27,x28,[sp,#80]
 stp x0,x3,[sp,#96]

 ldp x6,x7,[x1,#8*0]
 ldp x8,x9,[x1,#8*2]
 ldp x10,x11,[x1,#8*4]
 ldp x12,x13,[x1,#8*6]

 sub x2,sp,x5,lsl#4
 lsl x5,x5,#3
 ldr x4,[x4]
 mov sp,x2
 sub x27,x5,#8*8
 b Lsqr8x_zero_start

Lsqr8x_zero:
 sub x27,x27,#8*8
 stp xzr,xzr,[x2,#8*0]
 stp xzr,xzr,[x2,#8*2]
 stp xzr,xzr,[x2,#8*4]
 stp xzr,xzr,[x2,#8*6]
Lsqr8x_zero_start:
 stp xzr,xzr,[x2,#8*8]
 stp xzr,xzr,[x2,#8*10]
 stp xzr,xzr,[x2,#8*12]
 stp xzr,xzr,[x2,#8*14]
 add x2,x2,#8*16
 cbnz x27,Lsqr8x_zero

 add x3,x1,x5
 add x1,x1,#8*8
 mov x19,xzr
 mov x20,xzr
 mov x21,xzr
 mov x22,xzr
 mov x23,xzr
 mov x24,xzr
 mov x25,xzr
 mov x26,xzr
 mov x2,sp
 str x4,[x29,#112]


.align 4
Lsqr8x_outer_loop:
# 305 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/armv8-mont.S"
 mul x14,x7,x6
 mul x15,x8,x6
 mul x16,x9,x6
 mul x17,x10,x6
 adds x20,x20,x14
 mul x14,x11,x6
 adcs x21,x21,x15
 mul x15,x12,x6
 adcs x22,x22,x16
 mul x16,x13,x6
 adcs x23,x23,x17
 umulh x17,x7,x6
 adcs x24,x24,x14
 umulh x14,x8,x6
 adcs x25,x25,x15
 umulh x15,x9,x6
 adcs x26,x26,x16
 umulh x16,x10,x6
 stp x19,x20,[x2],#8*2
 adc x19,xzr,xzr
 adds x21,x21,x17
 umulh x17,x11,x6
 adcs x22,x22,x14
 umulh x14,x12,x6
 adcs x23,x23,x15
 umulh x15,x13,x6
 adcs x24,x24,x16
 mul x16,x8,x7
 adcs x25,x25,x17
 mul x17,x9,x7
 adcs x26,x26,x14
 mul x14,x10,x7
 adc x19,x19,x15

 mul x15,x11,x7
 adds x22,x22,x16
 mul x16,x12,x7
 adcs x23,x23,x17
 mul x17,x13,x7
 adcs x24,x24,x14
 umulh x14,x8,x7
 adcs x25,x25,x15
 umulh x15,x9,x7
 adcs x26,x26,x16
 umulh x16,x10,x7
 adcs x19,x19,x17
 umulh x17,x11,x7
 stp x21,x22,[x2],#8*2
 adc x20,xzr,xzr
 adds x23,x23,x14
 umulh x14,x12,x7
 adcs x24,x24,x15
 umulh x15,x13,x7
 adcs x25,x25,x16
 mul x16,x9,x8
 adcs x26,x26,x17
 mul x17,x10,x8
 adcs x19,x19,x14
 mul x14,x11,x8
 adc x20,x20,x15

 mul x15,x12,x8
 adds x24,x24,x16
 mul x16,x13,x8
 adcs x25,x25,x17
 umulh x17,x9,x8
 adcs x26,x26,x14
 umulh x14,x10,x8
 adcs x19,x19,x15
 umulh x15,x11,x8
 adcs x20,x20,x16
 umulh x16,x12,x8
 stp x23,x24,[x2],#8*2
 adc x21,xzr,xzr
 adds x25,x25,x17
 umulh x17,x13,x8
 adcs x26,x26,x14
 mul x14,x10,x9
 adcs x19,x19,x15
 mul x15,x11,x9
 adcs x20,x20,x16
 mul x16,x12,x9
 adc x21,x21,x17

 mul x17,x13,x9
 adds x26,x26,x14
 umulh x14,x10,x9
 adcs x19,x19,x15
 umulh x15,x11,x9
 adcs x20,x20,x16
 umulh x16,x12,x9
 adcs x21,x21,x17
 umulh x17,x13,x9
 stp x25,x26,[x2],#8*2
 adc x22,xzr,xzr
 adds x19,x19,x14
 mul x14,x11,x10
 adcs x20,x20,x15
 mul x15,x12,x10
 adcs x21,x21,x16
 mul x16,x13,x10
 adc x22,x22,x17

 umulh x17,x11,x10
 adds x20,x20,x14
 umulh x14,x12,x10
 adcs x21,x21,x15
 umulh x15,x13,x10
 adcs x22,x22,x16
 mul x16,x12,x11
 adc x23,xzr,xzr
 adds x21,x21,x17
 mul x17,x13,x11
 adcs x22,x22,x14
 umulh x14,x12,x11
 adc x23,x23,x15

 umulh x15,x13,x11
 adds x22,x22,x16
 mul x16,x13,x12
 adcs x23,x23,x17
 umulh x17,x13,x12
 adc x24,xzr,xzr
 adds x23,x23,x14
 sub x27,x3,x1
 adc x24,x24,x15

 adds x24,x24,x16
 sub x14,x3,x5
 adc x25,xzr,xzr
 add x25,x25,x17

 cbz x27,Lsqr8x_outer_break

 mov x4,x6
 ldp x6,x7,[x2,#8*0]
 ldp x8,x9,[x2,#8*2]
 ldp x10,x11,[x2,#8*4]
 ldp x12,x13,[x2,#8*6]
 adds x19,x19,x6
 adcs x20,x20,x7
 ldp x6,x7,[x1,#8*0]
 adcs x21,x21,x8
 adcs x22,x22,x9
 ldp x8,x9,[x1,#8*2]
 adcs x23,x23,x10
 adcs x24,x24,x11
 ldp x10,x11,[x1,#8*4]
 adcs x25,x25,x12
 mov x0,x1
 adcs x26,xzr,x13
 ldp x12,x13,[x1,#8*6]
 add x1,x1,#8*8

 mov x27,#-8*8
# 483 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/armv8-mont.S"
Lsqr8x_mul:
 mul x14,x6,x4
 adc x28,xzr,xzr
 mul x15,x7,x4
 add x27,x27,#8
 mul x16,x8,x4
 mul x17,x9,x4
 adds x19,x19,x14
 mul x14,x10,x4
 adcs x20,x20,x15
 mul x15,x11,x4
 adcs x21,x21,x16
 mul x16,x12,x4
 adcs x22,x22,x17
 mul x17,x13,x4
 adcs x23,x23,x14
 umulh x14,x6,x4
 adcs x24,x24,x15
 umulh x15,x7,x4
 adcs x25,x25,x16
 umulh x16,x8,x4
 adcs x26,x26,x17
 umulh x17,x9,x4
 adc x28,x28,xzr
 str x19,[x2],#8
 adds x19,x20,x14
 umulh x14,x10,x4
 adcs x20,x21,x15
 umulh x15,x11,x4
 adcs x21,x22,x16
 umulh x16,x12,x4
 adcs x22,x23,x17
 umulh x17,x13,x4
 ldr x4,[x0,x27]
 adcs x23,x24,x14
 adcs x24,x25,x15
 adcs x25,x26,x16
 adcs x26,x28,x17

 cbnz x27,Lsqr8x_mul


 cmp x1,x3
 b.eq Lsqr8x_break

 ldp x6,x7,[x2,#8*0]
 ldp x8,x9,[x2,#8*2]
 ldp x10,x11,[x2,#8*4]
 ldp x12,x13,[x2,#8*6]
 adds x19,x19,x6
 ldr x4,[x0,#-8*8]
 adcs x20,x20,x7
 ldp x6,x7,[x1,#8*0]
 adcs x21,x21,x8
 adcs x22,x22,x9
 ldp x8,x9,[x1,#8*2]
 adcs x23,x23,x10
 adcs x24,x24,x11
 ldp x10,x11,[x1,#8*4]
 adcs x25,x25,x12
 mov x27,#-8*8
 adcs x26,x26,x13
 ldp x12,x13,[x1,#8*6]
 add x1,x1,#8*8

 b Lsqr8x_mul

.align 4
Lsqr8x_break:
 ldp x6,x7,[x0,#8*0]
 add x1,x0,#8*8
 ldp x8,x9,[x0,#8*2]
 sub x14,x3,x1
 ldp x10,x11,[x0,#8*4]
 sub x15,x2,x14
 ldp x12,x13,[x0,#8*6]
 cbz x14,Lsqr8x_outer_loop

 stp x19,x20,[x2,#8*0]
 ldp x19,x20,[x15,#8*0]
 stp x21,x22,[x2,#8*2]
 ldp x21,x22,[x15,#8*2]
 stp x23,x24,[x2,#8*4]
 ldp x23,x24,[x15,#8*4]
 stp x25,x26,[x2,#8*6]
 mov x2,x15
 ldp x25,x26,[x15,#8*6]
 b Lsqr8x_outer_loop

.align 4
Lsqr8x_outer_break:

 ldp x7,x9,[x14,#8*0]
 ldp x15,x16,[sp,#8*1]
 ldp x11,x13,[x14,#8*2]
 add x1,x14,#8*4
 ldp x17,x14,[sp,#8*3]

 stp x19,x20,[x2,#8*0]
 mul x19,x7,x7
 stp x21,x22,[x2,#8*2]
 umulh x7,x7,x7
 stp x23,x24,[x2,#8*4]
 mul x8,x9,x9
 stp x25,x26,[x2,#8*6]
 mov x2,sp
 umulh x9,x9,x9
 adds x20,x7,x15,lsl#1
 extr x15,x16,x15,#63
 sub x27,x5,#8*4

Lsqr4x_shift_n_add:
 adcs x21,x8,x15
 extr x16,x17,x16,#63
 sub x27,x27,#8*4
 adcs x22,x9,x16
 ldp x15,x16,[x2,#8*5]
 mul x10,x11,x11
 ldp x7,x9,[x1],#8*2
 umulh x11,x11,x11
 mul x12,x13,x13
 umulh x13,x13,x13
 extr x17,x14,x17,#63
 stp x19,x20,[x2,#8*0]
 adcs x23,x10,x17
 extr x14,x15,x14,#63
 stp x21,x22,[x2,#8*2]
 adcs x24,x11,x14
 ldp x17,x14,[x2,#8*7]
 extr x15,x16,x15,#63
 adcs x25,x12,x15
 extr x16,x17,x16,#63
 adcs x26,x13,x16
 ldp x15,x16,[x2,#8*9]
 mul x6,x7,x7
 ldp x11,x13,[x1],#8*2
 umulh x7,x7,x7
 mul x8,x9,x9
 umulh x9,x9,x9
 stp x23,x24,[x2,#8*4]
 extr x17,x14,x17,#63
 stp x25,x26,[x2,#8*6]
 add x2,x2,#8*8
 adcs x19,x6,x17
 extr x14,x15,x14,#63
 adcs x20,x7,x14
 ldp x17,x14,[x2,#8*3]
 extr x15,x16,x15,#63
 cbnz x27,Lsqr4x_shift_n_add
 ldp x1,x4,[x29,#104]

 adcs x21,x8,x15
 extr x16,x17,x16,#63
 adcs x22,x9,x16
 ldp x15,x16,[x2,#8*5]
 mul x10,x11,x11
 umulh x11,x11,x11
 stp x19,x20,[x2,#8*0]
 mul x12,x13,x13
 umulh x13,x13,x13
 stp x21,x22,[x2,#8*2]
 extr x17,x14,x17,#63
 adcs x23,x10,x17
 extr x14,x15,x14,#63
 ldp x19,x20,[sp,#8*0]
 adcs x24,x11,x14
 extr x15,x16,x15,#63
 ldp x6,x7,[x1,#8*0]
 adcs x25,x12,x15
 extr x16,xzr,x16,#63
 ldp x8,x9,[x1,#8*2]
 adc x26,x13,x16
 ldp x10,x11,[x1,#8*4]


 mul x28,x4,x19
 ldp x12,x13,[x1,#8*6]
 add x3,x1,x5
 ldp x21,x22,[sp,#8*2]
 stp x23,x24,[x2,#8*4]
 ldp x23,x24,[sp,#8*4]
 stp x25,x26,[x2,#8*6]
 ldp x25,x26,[sp,#8*6]
 add x1,x1,#8*8
 mov x30,xzr
 mov x2,sp
 mov x27,#8

Lsqr8x_reduction:

 mul x15,x7,x28
 sub x27,x27,#1
 mul x16,x8,x28
 str x28,[x2],#8
 mul x17,x9,x28

 subs xzr,x19,#1
 mul x14,x10,x28
 adcs x19,x20,x15
 mul x15,x11,x28
 adcs x20,x21,x16
 mul x16,x12,x28
 adcs x21,x22,x17
 mul x17,x13,x28
 adcs x22,x23,x14
 umulh x14,x6,x28
 adcs x23,x24,x15
 umulh x15,x7,x28
 adcs x24,x25,x16
 umulh x16,x8,x28
 adcs x25,x26,x17
 umulh x17,x9,x28
 adc x26,xzr,xzr
 adds x19,x19,x14
 umulh x14,x10,x28
 adcs x20,x20,x15
 umulh x15,x11,x28
 adcs x21,x21,x16
 umulh x16,x12,x28
 adcs x22,x22,x17
 umulh x17,x13,x28
 mul x28,x4,x19
 adcs x23,x23,x14
 adcs x24,x24,x15
 adcs x25,x25,x16
 adc x26,x26,x17
 cbnz x27,Lsqr8x_reduction

 ldp x14,x15,[x2,#8*0]
 ldp x16,x17,[x2,#8*2]
 mov x0,x2
 sub x27,x3,x1
 adds x19,x19,x14
 adcs x20,x20,x15
 ldp x14,x15,[x2,#8*4]
 adcs x21,x21,x16
 adcs x22,x22,x17
 ldp x16,x17,[x2,#8*6]
 adcs x23,x23,x14
 adcs x24,x24,x15
 adcs x25,x25,x16
 adcs x26,x26,x17

 cbz x27,Lsqr8x8_post_condition

 ldr x4,[x2,#-8*8]
 ldp x6,x7,[x1,#8*0]
 ldp x8,x9,[x1,#8*2]
 ldp x10,x11,[x1,#8*4]
 mov x27,#-8*8
 ldp x12,x13,[x1,#8*6]
 add x1,x1,#8*8

Lsqr8x_tail:
 mul x14,x6,x4
 adc x28,xzr,xzr
 mul x15,x7,x4
 add x27,x27,#8
 mul x16,x8,x4
 mul x17,x9,x4
 adds x19,x19,x14
 mul x14,x10,x4
 adcs x20,x20,x15
 mul x15,x11,x4
 adcs x21,x21,x16
 mul x16,x12,x4
 adcs x22,x22,x17
 mul x17,x13,x4
 adcs x23,x23,x14
 umulh x14,x6,x4
 adcs x24,x24,x15
 umulh x15,x7,x4
 adcs x25,x25,x16
 umulh x16,x8,x4
 adcs x26,x26,x17
 umulh x17,x9,x4
 adc x28,x28,xzr
 str x19,[x2],#8
 adds x19,x20,x14
 umulh x14,x10,x4
 adcs x20,x21,x15
 umulh x15,x11,x4
 adcs x21,x22,x16
 umulh x16,x12,x4
 adcs x22,x23,x17
 umulh x17,x13,x4
 ldr x4,[x0,x27]
 adcs x23,x24,x14
 adcs x24,x25,x15
 adcs x25,x26,x16
 adcs x26,x28,x17

 cbnz x27,Lsqr8x_tail


 ldp x6,x7,[x2,#8*0]
 sub x27,x3,x1
 sub x16,x3,x5
 ldp x8,x9,[x2,#8*2]
 ldp x10,x11,[x2,#8*4]
 ldp x12,x13,[x2,#8*6]
 cbz x27,Lsqr8x_tail_break

 ldr x4,[x0,#-8*8]
 adds x19,x19,x6
 adcs x20,x20,x7
 ldp x6,x7,[x1,#8*0]
 adcs x21,x21,x8
 adcs x22,x22,x9
 ldp x8,x9,[x1,#8*2]
 adcs x23,x23,x10
 adcs x24,x24,x11
 ldp x10,x11,[x1,#8*4]
 adcs x25,x25,x12
 mov x27,#-8*8
 adcs x26,x26,x13
 ldp x12,x13,[x1,#8*6]
 add x1,x1,#8*8

 b Lsqr8x_tail

.align 4
Lsqr8x_tail_break:
 ldr x4,[x29,#112]
 add x27,x2,#8*8

 subs xzr,x30,#1
 adcs x14,x19,x6
 adcs x15,x20,x7
 ldp x19,x20,[x0,#8*0]
 adcs x21,x21,x8
 ldp x6,x7,[x16,#8*0]
 adcs x22,x22,x9
 ldp x8,x9,[x16,#8*2]
 adcs x23,x23,x10
 adcs x24,x24,x11
 ldp x10,x11,[x16,#8*4]
 adcs x25,x25,x12
 adcs x26,x26,x13
 ldp x12,x13,[x16,#8*6]
 add x1,x16,#8*8
 adc x30,xzr,xzr
 mul x28,x4,x19
 stp x14,x15,[x2,#8*0]
 stp x21,x22,[x2,#8*2]
 ldp x21,x22,[x0,#8*2]
 stp x23,x24,[x2,#8*4]
 ldp x23,x24,[x0,#8*4]
 cmp x27,x29
 stp x25,x26,[x2,#8*6]
 mov x2,x0
 ldp x25,x26,[x0,#8*6]
 mov x27,#8
 b.ne Lsqr8x_reduction





 ldr x0,[x29,#96]
 add x2,x2,#8*8
 subs x14,x19,x6
 sbcs x15,x20,x7
 sub x27,x5,#8*8
 mov x3,x0

Lsqr8x_sub:
 sbcs x16,x21,x8
 ldp x6,x7,[x1,#8*0]
 sbcs x17,x22,x9
 stp x14,x15,[x0,#8*0]
 sbcs x14,x23,x10
 ldp x8,x9,[x1,#8*2]
 sbcs x15,x24,x11
 stp x16,x17,[x0,#8*2]
 sbcs x16,x25,x12
 ldp x10,x11,[x1,#8*4]
 sbcs x17,x26,x13
 ldp x12,x13,[x1,#8*6]
 add x1,x1,#8*8
 ldp x19,x20,[x2,#8*0]
 sub x27,x27,#8*8
 ldp x21,x22,[x2,#8*2]
 ldp x23,x24,[x2,#8*4]
 ldp x25,x26,[x2,#8*6]
 add x2,x2,#8*8
 stp x14,x15,[x0,#8*4]
 sbcs x14,x19,x6
 stp x16,x17,[x0,#8*6]
 add x0,x0,#8*8
 sbcs x15,x20,x7
 cbnz x27,Lsqr8x_sub

 sbcs x16,x21,x8
 mov x2,sp
 add x1,sp,x5
 ldp x6,x7,[x3,#8*0]
 sbcs x17,x22,x9
 stp x14,x15,[x0,#8*0]
 sbcs x14,x23,x10
 ldp x8,x9,[x3,#8*2]
 sbcs x15,x24,x11
 stp x16,x17,[x0,#8*2]
 sbcs x16,x25,x12
 ldp x19,x20,[x1,#8*0]
 sbcs x17,x26,x13
 ldp x21,x22,[x1,#8*2]
 sbcs xzr,x30,xzr
 ldr x30,[x29,#8]
 stp x14,x15,[x0,#8*4]
 stp x16,x17,[x0,#8*6]

 sub x27,x5,#8*4
Lsqr4x_cond_copy:
 sub x27,x27,#8*4
 csel x14,x19,x6,lo
 stp xzr,xzr,[x2,#8*0]
 csel x15,x20,x7,lo
 ldp x6,x7,[x3,#8*4]
 ldp x19,x20,[x1,#8*4]
 csel x16,x21,x8,lo
 stp xzr,xzr,[x2,#8*2]
 add x2,x2,#8*4
 csel x17,x22,x9,lo
 ldp x8,x9,[x3,#8*6]
 ldp x21,x22,[x1,#8*6]
 add x1,x1,#8*4
 stp x14,x15,[x3,#8*0]
 stp x16,x17,[x3,#8*2]
 add x3,x3,#8*4
 stp xzr,xzr,[x1,#8*0]
 stp xzr,xzr,[x1,#8*2]
 cbnz x27,Lsqr4x_cond_copy

 csel x14,x19,x6,lo
 stp xzr,xzr,[x2,#8*0]
 csel x15,x20,x7,lo
 stp xzr,xzr,[x2,#8*2]
 csel x16,x21,x8,lo
 csel x17,x22,x9,lo
 stp x14,x15,[x3,#8*0]
 stp x16,x17,[x3,#8*2]

 b Lsqr8x_done

.align 4
Lsqr8x8_post_condition:
 adc x28,xzr,xzr
 ldr x30,[x29,#8]

 subs x6,x19,x6
 ldr x1,[x29,#96]
 sbcs x7,x20,x7
 stp xzr,xzr,[sp,#8*0]
 sbcs x8,x21,x8
 stp xzr,xzr,[sp,#8*2]
 sbcs x9,x22,x9
 stp xzr,xzr,[sp,#8*4]
 sbcs x10,x23,x10
 stp xzr,xzr,[sp,#8*6]
 sbcs x11,x24,x11
 stp xzr,xzr,[sp,#8*8]
 sbcs x12,x25,x12
 stp xzr,xzr,[sp,#8*10]
 sbcs x13,x26,x13
 stp xzr,xzr,[sp,#8*12]
 sbcs x28,x28,xzr
 stp xzr,xzr,[sp,#8*14]


 csel x6,x19,x6,lo
 csel x7,x20,x7,lo
 csel x8,x21,x8,lo
 csel x9,x22,x9,lo
 stp x6,x7,[x1,#8*0]
 csel x10,x23,x10,lo
 csel x11,x24,x11,lo
 stp x8,x9,[x1,#8*2]
 csel x12,x25,x12,lo
 csel x13,x26,x13,lo
 stp x10,x11,[x1,#8*4]
 stp x12,x13,[x1,#8*6]

Lsqr8x_done:
 ldp x19,x20,[x29,#16]
 mov sp,x29
 ldp x21,x22,[x29,#32]
 mov x0,#1
 ldp x23,x24,[x29,#48]
 ldp x25,x26,[x29,#64]
 ldp x27,x28,[x29,#80]
 ldr x29,[sp],#128


 ret


.align 5
__bn_mul4x_mont:



 stp x29,x30,[sp,#-128]!
 add x29,sp,#0
 stp x19,x20,[sp,#16]
 stp x21,x22,[sp,#32]
 stp x23,x24,[sp,#48]
 stp x25,x26,[sp,#64]
 stp x27,x28,[sp,#80]

 sub x26,sp,x5,lsl#3
 lsl x5,x5,#3
 ldr x4,[x4]
 sub sp,x26,#8*4

 add x10,x2,x5
 add x27,x1,x5
 stp x0,x10,[x29,#96]

 ldr x24,[x2,#8*0]
 ldp x6,x7,[x1,#8*0]
 ldp x8,x9,[x1,#8*2]
 add x1,x1,#8*4
 mov x19,xzr
 mov x20,xzr
 mov x21,xzr
 mov x22,xzr
 ldp x14,x15,[x3,#8*0]
 ldp x16,x17,[x3,#8*2]
 adds x3,x3,#8*4
 mov x0,xzr
 mov x28,#0
 mov x26,sp

Loop_mul4x_1st_reduction:
 mul x10,x6,x24
 adc x0,x0,xzr
 mul x11,x7,x24
 add x28,x28,#8
 mul x12,x8,x24
 and x28,x28,#31
 mul x13,x9,x24
 adds x19,x19,x10
 umulh x10,x6,x24
 adcs x20,x20,x11
 mul x25,x19,x4
 adcs x21,x21,x12
 umulh x11,x7,x24
 adcs x22,x22,x13
 umulh x12,x8,x24
 adc x23,xzr,xzr
 umulh x13,x9,x24
 ldr x24,[x2,x28]
 adds x20,x20,x10

 str x25,[x26],#8
 adcs x21,x21,x11
 mul x11,x15,x25
 adcs x22,x22,x12
 mul x12,x16,x25
 adc x23,x23,x13
 mul x13,x17,x25

 subs xzr,x19,#1
 umulh x10,x14,x25
 adcs x19,x20,x11
 umulh x11,x15,x25
 adcs x20,x21,x12
 umulh x12,x16,x25
 adcs x21,x22,x13
 umulh x13,x17,x25
 adcs x22,x23,x0
 adc x0,xzr,xzr
 adds x19,x19,x10
 sub x10,x27,x1
 adcs x20,x20,x11
 adcs x21,x21,x12
 adcs x22,x22,x13

 cbnz x28,Loop_mul4x_1st_reduction

 cbz x10,Lmul4x4_post_condition

 ldp x6,x7,[x1,#8*0]
 ldp x8,x9,[x1,#8*2]
 add x1,x1,#8*4
 ldr x25,[sp]
 ldp x14,x15,[x3,#8*0]
 ldp x16,x17,[x3,#8*2]
 add x3,x3,#8*4

Loop_mul4x_1st_tail:
 mul x10,x6,x24
 adc x0,x0,xzr
 mul x11,x7,x24
 add x28,x28,#8
 mul x12,x8,x24
 and x28,x28,#31
 mul x13,x9,x24
 adds x19,x19,x10
 umulh x10,x6,x24
 adcs x20,x20,x11
 umulh x11,x7,x24
 adcs x21,x21,x12
 umulh x12,x8,x24
 adcs x22,x22,x13
 umulh x13,x9,x24
 adc x23,xzr,xzr
 ldr x24,[x2,x28]
 adds x20,x20,x10
 mul x10,x14,x25
 adcs x21,x21,x11
 mul x11,x15,x25
 adcs x22,x22,x12
 mul x12,x16,x25
 adc x23,x23,x13
 mul x13,x17,x25
 adds x19,x19,x10
 umulh x10,x14,x25
 adcs x20,x20,x11
 umulh x11,x15,x25
 adcs x21,x21,x12
 umulh x12,x16,x25
 adcs x22,x22,x13
 adcs x23,x23,x0
 umulh x13,x17,x25
 adc x0,xzr,xzr
 ldr x25,[sp,x28]
 str x19,[x26],#8
 adds x19,x20,x10
 sub x10,x27,x1
 adcs x20,x21,x11
 adcs x21,x22,x12
 adcs x22,x23,x13

 cbnz x28,Loop_mul4x_1st_tail

 sub x11,x27,x5
 cbz x10,Lmul4x_proceed

 ldp x6,x7,[x1,#8*0]
 ldp x8,x9,[x1,#8*2]
 add x1,x1,#8*4
 ldp x14,x15,[x3,#8*0]
 ldp x16,x17,[x3,#8*2]
 add x3,x3,#8*4
 b Loop_mul4x_1st_tail

.align 5
Lmul4x_proceed:
 ldr x24,[x2,#8*4]!
 adc x30,x0,xzr
 ldp x6,x7,[x11,#8*0]
 sub x3,x3,x5
 ldp x8,x9,[x11,#8*2]
 add x1,x11,#8*4

 stp x19,x20,[x26,#8*0]
 ldp x19,x20,[sp,#8*4]
 stp x21,x22,[x26,#8*2]
 ldp x21,x22,[sp,#8*6]

 ldp x14,x15,[x3,#8*0]
 mov x26,sp
 ldp x16,x17,[x3,#8*2]
 adds x3,x3,#8*4
 mov x0,xzr

.align 4
Loop_mul4x_reduction:
 mul x10,x6,x24
 adc x0,x0,xzr
 mul x11,x7,x24
 add x28,x28,#8
 mul x12,x8,x24
 and x28,x28,#31
 mul x13,x9,x24
 adds x19,x19,x10
 umulh x10,x6,x24
 adcs x20,x20,x11
 mul x25,x19,x4
 adcs x21,x21,x12
 umulh x11,x7,x24
 adcs x22,x22,x13
 umulh x12,x8,x24
 adc x23,xzr,xzr
 umulh x13,x9,x24
 ldr x24,[x2,x28]
 adds x20,x20,x10

 str x25,[x26],#8
 adcs x21,x21,x11
 mul x11,x15,x25
 adcs x22,x22,x12
 mul x12,x16,x25
 adc x23,x23,x13
 mul x13,x17,x25

 subs xzr,x19,#1
 umulh x10,x14,x25
 adcs x19,x20,x11
 umulh x11,x15,x25
 adcs x20,x21,x12
 umulh x12,x16,x25
 adcs x21,x22,x13
 umulh x13,x17,x25
 adcs x22,x23,x0
 adc x0,xzr,xzr
 adds x19,x19,x10
 adcs x20,x20,x11
 adcs x21,x21,x12
 adcs x22,x22,x13

 cbnz x28,Loop_mul4x_reduction

 adc x0,x0,xzr
 ldp x10,x11,[x26,#8*4]
 ldp x12,x13,[x26,#8*6]
 ldp x6,x7,[x1,#8*0]
 ldp x8,x9,[x1,#8*2]
 add x1,x1,#8*4
 adds x19,x19,x10
 adcs x20,x20,x11
 adcs x21,x21,x12
 adcs x22,x22,x13


 ldr x25,[sp]
 ldp x14,x15,[x3,#8*0]
 ldp x16,x17,[x3,#8*2]
 add x3,x3,#8*4

.align 4
Loop_mul4x_tail:
 mul x10,x6,x24
 adc x0,x0,xzr
 mul x11,x7,x24
 add x28,x28,#8
 mul x12,x8,x24
 and x28,x28,#31
 mul x13,x9,x24
 adds x19,x19,x10
 umulh x10,x6,x24
 adcs x20,x20,x11
 umulh x11,x7,x24
 adcs x21,x21,x12
 umulh x12,x8,x24
 adcs x22,x22,x13
 umulh x13,x9,x24
 adc x23,xzr,xzr
 ldr x24,[x2,x28]
 adds x20,x20,x10
 mul x10,x14,x25
 adcs x21,x21,x11
 mul x11,x15,x25
 adcs x22,x22,x12
 mul x12,x16,x25
 adc x23,x23,x13
 mul x13,x17,x25
 adds x19,x19,x10
 umulh x10,x14,x25
 adcs x20,x20,x11
 umulh x11,x15,x25
 adcs x21,x21,x12
 umulh x12,x16,x25
 adcs x22,x22,x13
 umulh x13,x17,x25
 adcs x23,x23,x0
 ldr x25,[sp,x28]
 adc x0,xzr,xzr
 str x19,[x26],#8
 adds x19,x20,x10
 sub x10,x27,x1
 adcs x20,x21,x11
 adcs x21,x22,x12
 adcs x22,x23,x13

 cbnz x28,Loop_mul4x_tail

 sub x11,x3,x5
 adc x0,x0,xzr
 cbz x10,Loop_mul4x_break

 ldp x10,x11,[x26,#8*4]
 ldp x12,x13,[x26,#8*6]
 ldp x6,x7,[x1,#8*0]
 ldp x8,x9,[x1,#8*2]
 add x1,x1,#8*4
 adds x19,x19,x10
 adcs x20,x20,x11
 adcs x21,x21,x12
 adcs x22,x22,x13

 ldp x14,x15,[x3,#8*0]
 ldp x16,x17,[x3,#8*2]
 add x3,x3,#8*4
 b Loop_mul4x_tail

.align 4
Loop_mul4x_break:
 ldp x12,x13,[x29,#96]
 adds x19,x19,x30
 add x2,x2,#8*4
 adcs x20,x20,xzr
 sub x1,x1,x5
 adcs x21,x21,xzr
 stp x19,x20,[x26,#8*0]
 adcs x22,x22,xzr
 ldp x19,x20,[sp,#8*4]
 adc x30,x0,xzr
 stp x21,x22,[x26,#8*2]
 cmp x2,x13
 ldp x21,x22,[sp,#8*6]
 ldp x14,x15,[x11,#8*0]
 ldp x16,x17,[x11,#8*2]
 add x3,x11,#8*4
 b.eq Lmul4x_post

 ldr x24,[x2]
 ldp x6,x7,[x1,#8*0]
 ldp x8,x9,[x1,#8*2]
 adds x1,x1,#8*4
 mov x0,xzr
 mov x26,sp
 b Loop_mul4x_reduction

.align 4
Lmul4x_post:




 mov x0,x12
 mov x27,x12
 subs x10,x19,x14
 add x26,sp,#8*8
 sbcs x11,x20,x15
 sub x28,x5,#8*4

Lmul4x_sub:
 sbcs x12,x21,x16
 ldp x14,x15,[x3,#8*0]
 sub x28,x28,#8*4
 ldp x19,x20,[x26,#8*0]
 sbcs x13,x22,x17
 ldp x16,x17,[x3,#8*2]
 add x3,x3,#8*4
 ldp x21,x22,[x26,#8*2]
 add x26,x26,#8*4
 stp x10,x11,[x0,#8*0]
 sbcs x10,x19,x14
 stp x12,x13,[x0,#8*2]
 add x0,x0,#8*4
 sbcs x11,x20,x15
 cbnz x28,Lmul4x_sub

 sbcs x12,x21,x16
 mov x26,sp
 add x1,sp,#8*4
 ldp x6,x7,[x27,#8*0]
 sbcs x13,x22,x17
 stp x10,x11,[x0,#8*0]
 ldp x8,x9,[x27,#8*2]
 stp x12,x13,[x0,#8*2]
 ldp x19,x20,[x1,#8*0]
 ldp x21,x22,[x1,#8*2]
 sbcs xzr,x30,xzr
 ldr x30,[x29,#8]

 sub x28,x5,#8*4
Lmul4x_cond_copy:
 sub x28,x28,#8*4
 csel x10,x19,x6,lo
 stp xzr,xzr,[x26,#8*0]
 csel x11,x20,x7,lo
 ldp x6,x7,[x27,#8*4]
 ldp x19,x20,[x1,#8*4]
 csel x12,x21,x8,lo
 stp xzr,xzr,[x26,#8*2]
 add x26,x26,#8*4
 csel x13,x22,x9,lo
 ldp x8,x9,[x27,#8*6]
 ldp x21,x22,[x1,#8*6]
 add x1,x1,#8*4
 stp x10,x11,[x27,#8*0]
 stp x12,x13,[x27,#8*2]
 add x27,x27,#8*4
 cbnz x28,Lmul4x_cond_copy

 csel x10,x19,x6,lo
 stp xzr,xzr,[x26,#8*0]
 csel x11,x20,x7,lo
 stp xzr,xzr,[x26,#8*2]
 csel x12,x21,x8,lo
 stp xzr,xzr,[x26,#8*3]
 csel x13,x22,x9,lo
 stp xzr,xzr,[x26,#8*4]
 stp x10,x11,[x27,#8*0]
 stp x12,x13,[x27,#8*2]

 b Lmul4x_done

.align 4
Lmul4x4_post_condition:
 adc x0,x0,xzr
 ldr x1,[x29,#96]

 subs x6,x19,x14
 ldr x30,[x29,#8]
 sbcs x7,x20,x15
 stp xzr,xzr,[sp,#8*0]
 sbcs x8,x21,x16
 stp xzr,xzr,[sp,#8*2]
 sbcs x9,x22,x17
 stp xzr,xzr,[sp,#8*4]
 sbcs xzr,x0,xzr
 stp xzr,xzr,[sp,#8*6]


 csel x6,x19,x6,lo
 csel x7,x20,x7,lo
 csel x8,x21,x8,lo
 csel x9,x22,x9,lo
 stp x6,x7,[x1,#8*0]
 stp x8,x9,[x1,#8*2]

Lmul4x_done:
 ldp x19,x20,[x29,#16]
 mov sp,x29
 ldp x21,x22,[x29,#32]
 mov x0,#1
 ldp x23,x24,[x29,#48]
 ldp x25,x26,[x29,#64]
 ldp x27,x28,[x29,#80]
 ldr x29,[sp],#128


 ret

.byte 77,111,110,116,103,111,109,101,114,121,32,77,117,108,116,105,112,108,105,99,97,116,105,111,110,32,102,111,114,32,65,82,77,118,56,44,32,67,82,89,80,84,79,71,65,77,83,32,98,121,32,60,97,112,112,114,111,64,111,112,101,110,115,115,108,46,111,114,103,62,0
.align 2
.align 4
