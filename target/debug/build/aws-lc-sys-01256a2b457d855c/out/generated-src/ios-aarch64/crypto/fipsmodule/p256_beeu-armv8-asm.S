# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/p256_beeu-armv8-asm.S"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 467 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/p256_beeu-armv8-asm.S" 2



# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h" 1
# 18 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/target.h" 1
# 19 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h" 2
# 41 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/generated-include/openssl/boringssl_prefix_symbols_asm.h" 1
# 42 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h" 2
# 5 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/p256_beeu-armv8-asm.S" 2


# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/arm_arch.h" 1
# 8 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/p256_beeu-armv8-asm.S" 2

.text
.globl _aws_lc_0_27_1_beeu_mod_inverse_vartime
.private_extern _aws_lc_0_27_1_beeu_mod_inverse_vartime

.align 4
_aws_lc_0_27_1_beeu_mod_inverse_vartime:
# 25 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/p256_beeu-armv8-asm.S"
 stp x29,x30,[sp,#-112]!
 add x29,sp,#0
 stp x19,x20,[sp,#16]
 stp x21,x22,[sp,#32]
 stp x23,x24,[sp,#48]
 stp x25,x26,[sp,#64]
 stp x27,x28,[sp,#80]
 stp x0,x2,[sp,#96]


 ldp x25,x26,[x1]
 ldp x27,x28,[x1,#16]



 ldp x0,x1,[x2]
 ldp x2,x30,[x2,#16]


 mov x21, x0
 mov x22, x1
 mov x23, x2
 mov x24, x30


 mov x3, #1
 eor x4, x4, x4
 eor x5, x5, x5
 eor x6, x6, x6
 eor x7, x7, x7


 eor x8, x8, x8
 eor x9, x9, x9
 eor x10, x10, x10
 eor x11, x11, x11
 eor x12, x12, x12

Lbeeu_loop:

 orr x14, x25, x26
 orr x14, x14, x27


 rbit x15, x25

 orr x14, x14, x28
 cbz x14,Lbeeu_loop_end
# 86 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/p256_beeu-armv8-asm.S"
 clz x13, x15


 cbz x13, Lbeeu_shift_A_Y


 neg x14, x13
 lsr x25, x25, x13
 lsl x15, x26, x14

 lsr x26, x26, x13
 lsl x19, x27, x14

 orr x25, x25, x15

 lsr x27, x27, x13
 lsl x20, x28, x14

 orr x26, x26, x19

 lsr x28, x28, x13

 orr x27, x27, x20





 eor x14, x14, x14
Lbeeu_shift_loop_X:
 tbz x3, #0, Lshift1_0
 adds x3, x3, x0
 adcs x4, x4, x1
 adcs x5, x5, x2
 adcs x6, x6, x30
 adc x7, x7, x14
Lshift1_0:




 extr x3, x4, x3, #1
 extr x4, x5, x4, #1
 extr x5, x6, x5, #1
 extr x6, x7, x6, #1
 lsr x7, x7, #1

 subs x13, x13, #1
 bne Lbeeu_shift_loop_X
# 144 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/p256_beeu-armv8-asm.S"
Lbeeu_shift_A_Y:




 rbit x15, x21
 clz x13, x15


 cbz x13, Lbeeu_update_B_X_or_A_Y


 neg x14, x13
 lsr x21, x21, x13
 lsl x15, x22, x14

 lsr x22, x22, x13
 lsl x19, x23, x14

 orr x21, x21, x15

 lsr x23, x23, x13
 lsl x20, x24, x14

 orr x22, x22, x19

 lsr x24, x24, x13

 orr x23, x23, x20





 eor x14, x14, x14
Lbeeu_shift_loop_Y:
 tbz x8, #0, Lshift1_1
 adds x8, x8, x0
 adcs x9, x9, x1
 adcs x10, x10, x2
 adcs x11, x11, x30
 adc x12, x12, x14
Lshift1_1:




 extr x8, x9, x8, #1
 extr x9, x10, x9, #1
 extr x10, x11, x10, #1
 extr x11, x12, x11, #1
 lsr x12, x12, #1

 subs x13, x13, #1
 bne Lbeeu_shift_loop_Y

Lbeeu_update_B_X_or_A_Y:





 subs x14, x25, x21
 sbcs x15, x26, x22
 sbcs x19, x27, x23
 sbcs x20, x28, x24
 bcs Lbeeu_B_greater_than_A



 subs x21, x21, x25
 sbcs x22, x22, x26
 sbcs x23, x23, x27
 sbcs x24, x24, x28

 adds x8, x8, x3
 adcs x9, x9, x4
 adcs x10, x10, x5
 adcs x11, x11, x6
 adc x12, x12, x7
 b Lbeeu_loop

Lbeeu_B_greater_than_A:


 mov x25, x14
 mov x26, x15
 mov x27, x19
 mov x28, x20

 adds x3, x3, x8
 adcs x4, x4, x9
 adcs x5, x5, x10
 adcs x6, x6, x11
 adc x7, x7, x12
 b Lbeeu_loop

Lbeeu_loop_end:
# 250 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/p256_beeu-armv8-asm.S"
 sub x14, x21, #1
 orr x14, x14, x22
 orr x14, x14, x23
 orr x14, x14, x24
 cbnz x14, Lbeeu_err


Lbeeu_reduction_loop:


 subs x3, x8, x0
 sbcs x4, x9, x1
 sbcs x5, x10, x2
 sbcs x6, x11, x30
 sbcs x7, x12, x14





 csel x8, x3, x8, cs
 csel x9, x4, x9, cs
 csel x10, x5, x10, cs
 csel x11, x6, x11, cs
 csel x12, x7, x12, cs
 bcs Lbeeu_reduction_loop



 subs x8, x0, x8
 sbcs x9, x1, x9
 sbcs x10, x2, x10
 sbcs x11, x30, x11


 ldr x3, [sp,#96]
 stp x8, x9, [x3]
 stp x10, x11, [x3,#16]

 mov x0, #1
 b Lbeeu_finish

Lbeeu_err:

 eor x0, x0, x0

Lbeeu_finish:

 add sp,x29,#0
 ldp x19,x20,[sp,#16]
 ldp x21,x22,[sp,#32]
 ldp x23,x24,[sp,#48]
 ldp x25,x26,[sp,#64]
 ldp x27,x28,[sp,#80]
 ldp x29,x30,[sp],#112


 ret
