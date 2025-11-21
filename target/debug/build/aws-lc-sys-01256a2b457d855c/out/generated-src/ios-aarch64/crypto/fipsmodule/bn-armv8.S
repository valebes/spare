# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/bn-armv8.S"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 467 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/bn-armv8.S" 2



# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h" 1
# 18 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/target.h" 1
# 19 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h" 2
# 41 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/generated-include/openssl/boringssl_prefix_symbols_asm.h" 1
# 42 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h" 2
# 5 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/bn-armv8.S" 2


# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/arm_arch.h" 1
# 8 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/bn-armv8.S" 2

.text




.globl _aws_lc_0_27_1_bn_add_words
.private_extern _aws_lc_0_27_1_bn_add_words
.align 4
_aws_lc_0_27_1_bn_add_words:

 # Clear the carry flag.
 cmn xzr, xzr

 # aarch64 can load two registers at a time, so we do two loop iterations at
 # at a time. Split x3 = 2 * x8 + x3. This allows loop
 # operations to use CBNZ without clobbering the carry flag.
 lsr x8, x3, #1
 and x3, x3, #1

 cbz x8, Ladd_tail
Ladd_loop:
 ldp x4, x5, [x1], #16
 ldp x6, x7, [x2], #16
 sub x8, x8, #1
 adcs x4, x4, x6
 adcs x5, x5, x7
 stp x4, x5, [x0], #16
 cbnz x8, Ladd_loop

Ladd_tail:
 cbz x3, Ladd_exit
 ldr x4, [x1], #8
 ldr x6, [x2], #8
 adcs x4, x4, x6
 str x4, [x0], #8

Ladd_exit:
 cset x0, cs
 ret





.globl _aws_lc_0_27_1_bn_sub_words
.private_extern _aws_lc_0_27_1_bn_sub_words
.align 4
_aws_lc_0_27_1_bn_sub_words:

 # Set the carry flag. Arm's borrow bit is flipped from the carry flag,
 # so we want C = 1 here.
 cmp xzr, xzr

 # aarch64 can load two registers at a time, so we do two loop iterations at
 # at a time. Split x3 = 2 * x8 + x3. This allows loop
 # operations to use CBNZ without clobbering the carry flag.
 lsr x8, x3, #1
 and x3, x3, #1

 cbz x8, Lsub_tail
Lsub_loop:
 ldp x4, x5, [x1], #16
 ldp x6, x7, [x2], #16
 sub x8, x8, #1
 sbcs x4, x4, x6
 sbcs x5, x5, x7
 stp x4, x5, [x0], #16
 cbnz x8, Lsub_loop

Lsub_tail:
 cbz x3, Lsub_exit
 ldr x4, [x1], #8
 ldr x6, [x2], #8
 sbcs x4, x4, x6
 str x4, [x0], #8

Lsub_exit:
 cset x0, cc
 ret
