# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/keccak1600-armv8.S"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 467 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/keccak1600-armv8.S" 2



# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h" 1
# 18 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/target.h" 1
# 19 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h" 2
# 41 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h"
# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/generated-include/openssl/boringssl_prefix_symbols_asm.h" 1
# 42 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/asm_base.h" 2
# 5 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/keccak1600-armv8.S" 2


# 1 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/include/openssl/arm_arch.h" 1
# 8 "/Users/valebes/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.27.1/aws-lc/generated-src/ios-aarch64/crypto/fipsmodule/keccak1600-armv8.S" 2
.text
.align 8

.quad 0,0,0,0,0,0,0,0

iotas:
.quad 0x0000000000000001
.quad 0x0000000000008082
.quad 0x800000000000808a
.quad 0x8000000080008000
.quad 0x000000000000808b
.quad 0x0000000080000001
.quad 0x8000000080008081
.quad 0x8000000000008009
.quad 0x000000000000008a
.quad 0x0000000000000088
.quad 0x0000000080008009
.quad 0x000000008000000a
.quad 0x000000008000808b
.quad 0x800000000000008b
.quad 0x8000000000008089
.quad 0x8000000000008003
.quad 0x8000000000008002
.quad 0x8000000000000080
.quad 0x000000000000800a
.quad 0x800000008000000a
.quad 0x8000000080008081
.quad 0x8000000000008080
.quad 0x0000000080000001
.quad 0x8000000080008008


.align 5
KeccakF1600_int:

 adr x28,iotas
 stp x28,x30,[sp,#16]
 b Loop
.align 4
Loop:

 eor x26,x0,x5
 stp x4,x9,[sp,#0]
 eor x27,x1,x6
 eor x28,x2,x7
 eor x30,x3,x8
 eor x4,x4,x9
 eor x26,x26,x10
 eor x27,x27,x11
 eor x28,x28,x12
 eor x30,x30,x13
 eor x4,x4,x14
 eor x26,x26,x15
 eor x27,x27,x16
 eor x28,x28,x17
 eor x30,x30,x25
 eor x4,x4,x19
 eor x26,x26,x20
 eor x28,x28,x22
 eor x27,x27,x21
 eor x30,x30,x23
 eor x4,x4,x24
 eor x9,x26,x28,ror#63
 eor x1,x1,x9
 eor x6,x6,x9
 eor x11,x11,x9
 eor x16,x16,x9
 eor x21,x21,x9
 eor x9,x27,x30,ror#63
 eor x28,x28,x4,ror#63
 eor x30,x30,x26,ror#63
 eor x4,x4,x27,ror#63
 eor x27, x2,x9
 eor x7,x7,x9
 eor x12,x12,x9
 eor x17,x17,x9
 eor x22,x22,x9
 eor x0,x0,x4
 eor x5,x5,x4
 eor x10,x10,x4
 eor x15,x15,x4
 eor x20,x20,x4
 ldp x4,x9,[sp,#0]
 eor x26, x3,x28
 eor x8,x8,x28
 eor x13,x13,x28
 eor x25,x25,x28
 eor x23,x23,x28
 eor x28, x4,x30
 eor x9,x9,x30
 eor x14,x14,x30
 eor x19,x19,x30
 eor x24,x24,x30

 mov x30,x1
 ror x1,x6,#20

 ror x2,x12,#21

 ror x3,x25,#43

 ror x4,x24,#50
 ror x6,x9,#44
 ror x12,x13,#39
 ror x25,x17,#49
 ror x24,x21,#62
 ror x9,x22,#3
 ror x13,x19,#56
 ror x17,x11,#54
 ror x21,x8,#9
 ror x22,x14,#25
 ror x19,x23,#8
 ror x11,x7,#58
 ror x8,x16,#19
 ror x14,x20,#46
 ror x23,x15,#23
 ror x7,x10,#61
 ror x16,x5,#28
 ror x5,x26,#36
 ror x10,x30,#63
 ror x15,x28,#37
 ror x20,x27,#2

 bic x26,x2,x1
 bic x27,x3,x2
 bic x28,x0,x4
 bic x30,x1,x0
 eor x0,x0,x26
 bic x26,x4,x3
 eor x1,x1,x27
 ldr x27,[sp,#16]
 eor x3,x3,x28
 eor x4,x4,x30
 eor x2,x2,x26
 ldr x30,[x27],#8
 bic x26,x7,x6
 tst x27,#255
 str x27,[sp,#16]
 bic x27,x8,x7
 bic x28,x5,x9
 eor x0,x0,x30
 bic x30,x6,x5
 eor x5,x5,x26
 bic x26,x9,x8
 eor x6,x6,x27
 eor x8,x8,x28
 eor x9,x9,x30
 eor x7,x7,x26
 bic x26,x12,x11
 bic x27,x13,x12
 bic x28,x10,x14
 bic x30,x11,x10
 eor x10,x10,x26
 bic x26,x14,x13
 eor x11,x11,x27
 eor x13,x13,x28
 eor x14,x14,x30
 eor x12,x12,x26
 bic x26,x17,x16
 bic x27,x25,x17
 bic x28,x15,x19
 bic x30,x16,x15
 eor x15,x15,x26
 bic x26,x19,x25
 eor x16,x16,x27
 eor x25,x25,x28
 eor x19,x19,x30
 eor x17,x17,x26
 bic x26,x22,x21
 bic x27,x23,x22
 bic x28,x20,x24
 bic x30,x21,x20
 eor x20,x20,x26
 bic x26,x24,x23
 eor x21,x21,x27
 eor x23,x23,x28
 eor x24,x24,x30
 eor x22,x22,x26
 bne Loop
 ldr x30,[sp,#24]

 ret


.align 5
KeccakF1600:

 stp x29,x30,[sp,#-128]!
 add x29,sp,#0
 stp x19,x20,[sp,#16]
 stp x21,x22,[sp,#32]
 stp x23,x24,[sp,#48]
 stp x25,x26,[sp,#64]
 stp x27,x28,[sp,#80]
 sub sp,sp,#48
 str x0,[sp,#32]
 mov x26,x0
 ldp x0,x1,[x0,#16*0]
 ldp x2,x3,[x26,#16*1]
 ldp x4,x5,[x26,#16*2]
 ldp x6,x7,[x26,#16*3]
 ldp x8,x9,[x26,#16*4]
 ldp x10,x11,[x26,#16*5]
 ldp x12,x13,[x26,#16*6]
 ldp x14,x15,[x26,#16*7]
 ldp x16,x17,[x26,#16*8]
 ldp x25,x19,[x26,#16*9]
 ldp x20,x21,[x26,#16*10]
 ldp x22,x23,[x26,#16*11]
 ldr x24,[x26,#16*12]
 bl KeccakF1600_int
 ldr x26,[sp,#32]
 stp x0,x1,[x26,#16*0]
 stp x2,x3,[x26,#16*1]
 stp x4,x5,[x26,#16*2]
 stp x6,x7,[x26,#16*3]
 stp x8,x9,[x26,#16*4]
 stp x10,x11,[x26,#16*5]
 stp x12,x13,[x26,#16*6]
 stp x14,x15,[x26,#16*7]
 stp x16,x17,[x26,#16*8]
 stp x25,x19,[x26,#16*9]
 stp x20,x21,[x26,#16*10]
 stp x22,x23,[x26,#16*11]
 str x24,[x26,#16*12]
 ldp x19,x20,[x29,#16]
 add sp,sp,#48
 ldp x21,x22,[x29,#32]
 ldp x23,x24,[x29,#48]
 ldp x25,x26,[x29,#64]
 ldp x27,x28,[x29,#80]
 ldp x29,x30,[sp],#128

 ret

.globl _aws_lc_0_27_1_Keccak1600_Absorb_hw
.private_extern _aws_lc_0_27_1_Keccak1600_Absorb_hw

.align 5
_aws_lc_0_27_1_Keccak1600_Absorb_hw:

 stp x29,x30,[sp,#-128]!
 add x29,sp,#0
 stp x19,x20,[sp,#16]
 stp x21,x22,[sp,#32]
 stp x23,x24,[sp,#48]
 stp x25,x26,[sp,#64]
 stp x27,x28,[sp,#80]
 sub sp,sp,#64
 stp x0,x1,[sp,#32]
 stp x2,x3,[sp,#48]
 mov x26,x0
 mov x27,x1
 mov x28,x2
 mov x30,x3
 ldp x0,x1,[x26,#16*0]
 ldp x2,x3,[x26,#16*1]
 ldp x4,x5,[x26,#16*2]
 ldp x6,x7,[x26,#16*3]
 ldp x8,x9,[x26,#16*4]
 ldp x10,x11,[x26,#16*5]
 ldp x12,x13,[x26,#16*6]
 ldp x14,x15,[x26,#16*7]
 ldp x16,x17,[x26,#16*8]
 ldp x25,x19,[x26,#16*9]
 ldp x20,x21,[x26,#16*10]
 ldp x22,x23,[x26,#16*11]
 ldr x24,[x26,#16*12]
 b Loop_absorb
.align 4
Loop_absorb:
 subs x26,x28,x30
 blo Labsorbed
 str x26,[sp,#48]
 ldr x26,[x27],#8



 eor x0,x0,x26
 cmp x30,#8*(0+2)
 blo Lprocess_block
 ldr x26,[x27],#8



 eor x1,x1,x26
 beq Lprocess_block
 ldr x26,[x27],#8



 eor x2,x2,x26
 cmp x30,#8*(2+2)
 blo Lprocess_block
 ldr x26,[x27],#8



 eor x3,x3,x26
 beq Lprocess_block
 ldr x26,[x27],#8



 eor x4,x4,x26
 cmp x30,#8*(4+2)
 blo Lprocess_block
 ldr x26,[x27],#8



 eor x5,x5,x26
 beq Lprocess_block
 ldr x26,[x27],#8



 eor x6,x6,x26
 cmp x30,#8*(6+2)
 blo Lprocess_block
 ldr x26,[x27],#8



 eor x7,x7,x26
 beq Lprocess_block
 ldr x26,[x27],#8



 eor x8,x8,x26
 cmp x30,#8*(8+2)
 blo Lprocess_block
 ldr x26,[x27],#8



 eor x9,x9,x26
 beq Lprocess_block
 ldr x26,[x27],#8



 eor x10,x10,x26
 cmp x30,#8*(10+2)
 blo Lprocess_block
 ldr x26,[x27],#8



 eor x11,x11,x26
 beq Lprocess_block
 ldr x26,[x27],#8



 eor x12,x12,x26
 cmp x30,#8*(12+2)
 blo Lprocess_block
 ldr x26,[x27],#8



 eor x13,x13,x26
 beq Lprocess_block
 ldr x26,[x27],#8



 eor x14,x14,x26
 cmp x30,#8*(14+2)
 blo Lprocess_block
 ldr x26,[x27],#8



 eor x15,x15,x26
 beq Lprocess_block
 ldr x26,[x27],#8



 eor x16,x16,x26
 cmp x30,#8*(16+2)
 blo Lprocess_block
 ldr x26,[x27],#8



 eor x17,x17,x26
 beq Lprocess_block
 ldr x26,[x27],#8



 eor x25,x25,x26
 cmp x30,#8*(18+2)
 blo Lprocess_block
 ldr x26,[x27],#8



 eor x19,x19,x26
 beq Lprocess_block
 ldr x26,[x27],#8



 eor x20,x20,x26
 cmp x30,#8*(20+2)
 blo Lprocess_block
 ldr x26,[x27],#8



 eor x21,x21,x26
 beq Lprocess_block
 ldr x26,[x27],#8



 eor x22,x22,x26
 cmp x30,#8*(22+2)
 blo Lprocess_block
 ldr x26,[x27],#8



 eor x23,x23,x26
 beq Lprocess_block
 ldr x26,[x27],#8



 eor x24,x24,x26
Lprocess_block:
 str x27,[sp,#40]
 bl KeccakF1600_int
 ldr x27,[sp,#40]
 ldp x28,x30,[sp,#48]
 b Loop_absorb
.align 4
Labsorbed:
 ldr x27,[sp,#32]
 stp x0,x1,[x27,#16*0]
 stp x2,x3,[x27,#16*1]
 stp x4,x5,[x27,#16*2]
 stp x6,x7,[x27,#16*3]
 stp x8,x9,[x27,#16*4]
 stp x10,x11,[x27,#16*5]
 stp x12,x13,[x27,#16*6]
 stp x14,x15,[x27,#16*7]
 stp x16,x17,[x27,#16*8]
 stp x25,x19,[x27,#16*9]
 stp x20,x21,[x27,#16*10]
 stp x22,x23,[x27,#16*11]
 str x24,[x27,#16*12]
 mov x0,x28
 ldp x19,x20,[x29,#16]
 add sp,sp,#64
 ldp x21,x22,[x29,#32]
 ldp x23,x24,[x29,#48]
 ldp x25,x26,[x29,#64]
 ldp x27,x28,[x29,#80]
 ldp x29,x30,[sp],#128

 ret

.globl _aws_lc_0_27_1_Keccak1600_Squeeze_hw
.private_extern _aws_lc_0_27_1_Keccak1600_Squeeze_hw

.align 5
_aws_lc_0_27_1_Keccak1600_Squeeze_hw:

 stp x29,x30,[sp,#-48]!
 add x29,sp,#0
 cmp x2,#0
 beq Lsqueeze_abort
 stp x19,x20,[sp,#16]
 stp x21,x22,[sp,#32]
 mov x19,x0
 mov x20,x1
 mov x21,x2
 mov x22,x3
 cmp x4, #0
 bne Lnext_block
Loop_squeeze:
 ldr x4,[x0],#8
 cmp x21,#8
 blo Lsqueeze_tail



 str x4,[x20],#8
 subs x21,x21,#8
 beq Lsqueeze_done
 subs x3,x3,#8
 bhi Loop_squeeze
Lnext_block:
 mov x0,x19
 bl KeccakF1600
 mov x0,x19
 mov x3,x22
 b Loop_squeeze
.align 4
Lsqueeze_tail:
 strb w4,[x20],#1
 lsr x4,x4,#8
 subs x21,x21,#1
 beq Lsqueeze_done
 strb w4,[x20],#1
 lsr x4,x4,#8
 subs x21,x21,#1
 beq Lsqueeze_done
 strb w4,[x20],#1
 lsr x4,x4,#8
 subs x21,x21,#1
 beq Lsqueeze_done
 strb w4,[x20],#1
 lsr x4,x4,#8
 subs x21,x21,#1
 beq Lsqueeze_done
 strb w4,[x20],#1
 lsr x4,x4,#8
 subs x21,x21,#1
 beq Lsqueeze_done
 strb w4,[x20],#1
 lsr x4,x4,#8
 subs x21,x21,#1
 beq Lsqueeze_done
 strb w4,[x20],#1
Lsqueeze_done:
 ldp x19,x20,[sp,#16]
 ldp x21,x22,[sp,#32]
Lsqueeze_abort:
 ldp x29,x30,[sp],#48

 ret


.align 5
KeccakF1600_ce:
 mov x9,#24
 adr x10,iotas
 b Loop_ce
.align 4
Loop_ce:

.long 0xce0f2a99
.long 0xce102eba
.long 0xce1132db
.long 0xce1236fc
.long 0xce133b1d
.long 0xce050339
.long 0xce06075a
.long 0xce070b7b
.long 0xce080f9c
.long 0xce0913bd
.long 0xce7b8f3e
.long 0xce7c8f5f
.long 0xce7d8f7b
.long 0xce798f9c
.long 0xce7a8fbd

.long 0xce9efc39
.long 0xce9e50c1
.long 0xce9cb126
.long 0xce9f0ec9
.long 0xce9c65d6
.long 0xce9dba8e
.long 0xce9f085a
.long 0xce9f5582
.long 0xce9b9dac
.long 0xce9ce26d
.long 0xce9b22f3
.long 0xce9d5df7
.long 0xce9c948f
.long 0xce9ccb1c
.long 0xce9efab8
.long 0xce9b2508
.long 0xce9e4e04
.long 0xce9d70b0
.long 0xce9b9065
 eor v0.16b,v0.16b,v29.16b
.long 0xce9bae5b
.long 0xce9fc623
.long 0xce9ed97e
.long 0xce9fe8ff
.long 0xce9df55d

.long 0xce362354
.long 0xce375915
.long 0xce385ed6
.long 0xce3a62f7
.long 0xce286b18
 ld1r {v26.2d},[x10],#8
.long 0xce330fd1
.long 0xce2f4c72
.long 0xce303e73
.long 0xce3e41ef
.long 0xce237a10
.long 0xce2c7f2a
.long 0xce2d33eb
.long 0xce2e358c
.long 0xce3939ad
.long 0xce3f65ce
.long 0xce2913a7
.long 0xce252488
.long 0xce261529
.long 0xce3d18a5
.long 0xce2474c6
.long 0xce207363
.long 0xce210384
.long 0xce220400
.long 0xce3b0821
.long 0xce3c6c42
 eor v0.16b,v0.16b,v26.16b
 subs x9,x9,#1
 bne Loop_ce
 ret


.align 5
KeccakF1600_cext:

 stp x29,x30,[sp,#-80]!
 add x29,sp,#0
 stp d8,d9,[sp,#16]
 stp d10,d11,[sp,#32]
 stp d12,d13,[sp,#48]
 stp d14,d15,[sp,#64]
 ldp d0,d1,[x0,#8*0]
 ldp d2,d3,[x0,#8*2]
 ldp d4,d5,[x0,#8*4]
 ldp d6,d7,[x0,#8*6]
 ldp d8,d9,[x0,#8*8]
 ldp d10,d11,[x0,#8*10]
 ldp d12,d13,[x0,#8*12]
 ldp d14,d15,[x0,#8*14]
 ldp d16,d17,[x0,#8*16]
 ldp d18,d19,[x0,#8*18]
 ldp d20,d21,[x0,#8*20]
 ldp d22,d23,[x0,#8*22]
 ldr d24,[x0,#8*24]
 bl KeccakF1600_ce
 ldr x30,[sp,#8]
 stp d0,d1,[x0,#8*0]
 stp d2,d3,[x0,#8*2]
 stp d4,d5,[x0,#8*4]
 stp d6,d7,[x0,#8*6]
 stp d8,d9,[x0,#8*8]
 stp d10,d11,[x0,#8*10]
 stp d12,d13,[x0,#8*12]
 stp d14,d15,[x0,#8*14]
 stp d16,d17,[x0,#8*16]
 stp d18,d19,[x0,#8*18]
 stp d20,d21,[x0,#8*20]
 stp d22,d23,[x0,#8*22]
 str d24,[x0,#8*24]
 ldp d8,d9,[sp,#16]
 ldp d10,d11,[sp,#32]
 ldp d12,d13,[sp,#48]
 ldp d14,d15,[sp,#64]
 ldr x29,[sp],#80

 ret

.globl _aws_lc_0_27_1_Keccak1600_Absorb_cext
.private_extern _aws_lc_0_27_1_Keccak1600_Absorb_cext

.align 5
_aws_lc_0_27_1_Keccak1600_Absorb_cext:

 stp x29,x30,[sp,#-80]!
 add x29,sp,#0
 stp d8,d9,[sp,#16]
 stp d10,d11,[sp,#32]
 stp d12,d13,[sp,#48]
 stp d14,d15,[sp,#64]
 ldp d0,d1,[x0,#8*0]
 ldp d2,d3,[x0,#8*2]
 ldp d4,d5,[x0,#8*4]
 ldp d6,d7,[x0,#8*6]
 ldp d8,d9,[x0,#8*8]
 ldp d10,d11,[x0,#8*10]
 ldp d12,d13,[x0,#8*12]
 ldp d14,d15,[x0,#8*14]
 ldp d16,d17,[x0,#8*16]
 ldp d18,d19,[x0,#8*18]
 ldp d20,d21,[x0,#8*20]
 ldp d22,d23,[x0,#8*22]
 ldr d24,[x0,#8*24]
 b Loop_absorb_ce
.align 4
Loop_absorb_ce:
 subs x2,x2,x3
 blo Labsorbed_ce
 ldr d31,[x1],#8



 eor v0.16b,v0.16b,v31.16b
 cmp x3,#8*(0+2)
 blo Lprocess_block_ce
 ldr d31,[x1],#8



 eor v1.16b,v1.16b,v31.16b
 beq Lprocess_block_ce
 ldr d31,[x1],#8



 eor v2.16b,v2.16b,v31.16b
 cmp x3,#8*(2+2)
 blo Lprocess_block_ce
 ldr d31,[x1],#8



 eor v3.16b,v3.16b,v31.16b
 beq Lprocess_block_ce
 ldr d31,[x1],#8



 eor v4.16b,v4.16b,v31.16b
 cmp x3,#8*(4+2)
 blo Lprocess_block_ce
 ldr d31,[x1],#8



 eor v5.16b,v5.16b,v31.16b
 beq Lprocess_block_ce
 ldr d31,[x1],#8



 eor v6.16b,v6.16b,v31.16b
 cmp x3,#8*(6+2)
 blo Lprocess_block_ce
 ldr d31,[x1],#8



 eor v7.16b,v7.16b,v31.16b
 beq Lprocess_block_ce
 ldr d31,[x1],#8



 eor v8.16b,v8.16b,v31.16b
 cmp x3,#8*(8+2)
 blo Lprocess_block_ce
 ldr d31,[x1],#8



 eor v9.16b,v9.16b,v31.16b
 beq Lprocess_block_ce
 ldr d31,[x1],#8



 eor v10.16b,v10.16b,v31.16b
 cmp x3,#8*(10+2)
 blo Lprocess_block_ce
 ldr d31,[x1],#8



 eor v11.16b,v11.16b,v31.16b
 beq Lprocess_block_ce
 ldr d31,[x1],#8



 eor v12.16b,v12.16b,v31.16b
 cmp x3,#8*(12+2)
 blo Lprocess_block_ce
 ldr d31,[x1],#8



 eor v13.16b,v13.16b,v31.16b
 beq Lprocess_block_ce
 ldr d31,[x1],#8



 eor v14.16b,v14.16b,v31.16b
 cmp x3,#8*(14+2)
 blo Lprocess_block_ce
 ldr d31,[x1],#8



 eor v15.16b,v15.16b,v31.16b
 beq Lprocess_block_ce
 ldr d31,[x1],#8



 eor v16.16b,v16.16b,v31.16b
 cmp x3,#8*(16+2)
 blo Lprocess_block_ce
 ldr d31,[x1],#8



 eor v17.16b,v17.16b,v31.16b
 beq Lprocess_block_ce
 ldr d31,[x1],#8



 eor v18.16b,v18.16b,v31.16b
 cmp x3,#8*(18+2)
 blo Lprocess_block_ce
 ldr d31,[x1],#8



 eor v19.16b,v19.16b,v31.16b
 beq Lprocess_block_ce
 ldr d31,[x1],#8



 eor v20.16b,v20.16b,v31.16b
 cmp x3,#8*(20+2)
 blo Lprocess_block_ce
 ldr d31,[x1],#8



 eor v21.16b,v21.16b,v31.16b
 beq Lprocess_block_ce
 ldr d31,[x1],#8



 eor v22.16b,v22.16b,v31.16b
 cmp x3,#8*(22+2)
 blo Lprocess_block_ce
 ldr d31,[x1],#8



 eor v23.16b,v23.16b,v31.16b
 beq Lprocess_block_ce
 ldr d31,[x1],#8



 eor v24.16b,v24.16b,v31.16b
Lprocess_block_ce:
 bl KeccakF1600_ce
 b Loop_absorb_ce
.align 4
Labsorbed_ce:
 stp d0,d1,[x0,#8*0]
 stp d2,d3,[x0,#8*2]
 stp d4,d5,[x0,#8*4]
 stp d6,d7,[x0,#8*6]
 stp d8,d9,[x0,#8*8]
 stp d10,d11,[x0,#8*10]
 stp d12,d13,[x0,#8*12]
 stp d14,d15,[x0,#8*14]
 stp d16,d17,[x0,#8*16]
 stp d18,d19,[x0,#8*18]
 stp d20,d21,[x0,#8*20]
 stp d22,d23,[x0,#8*22]
 str d24,[x0,#8*24]
 add x0,x2,x3
 ldp d8,d9,[sp,#16]
 ldp d10,d11,[sp,#32]
 ldp d12,d13,[sp,#48]
 ldp d14,d15,[sp,#64]
 ldp x29,x30,[sp],#80

 ret

.globl _aws_lc_0_27_1_Keccak1600_Squeeze_cext
.private_extern _aws_lc_0_27_1_Keccak1600_Squeeze_cext

.align 5
_aws_lc_0_27_1_Keccak1600_Squeeze_cext:

 stp x29,x30,[sp,#-16]!
 add x29,sp,#0
 cmp x2,#0
 beq Lsqueeze_done_ce
 mov x9,x0
 mov x10,x3
Loop_squeeze_ce:
 ldr x4,[x9],#8
 cmp x2,#8
 blo Lsqueeze_tail_ce



 str x4,[x1],#8
 beq Lsqueeze_done_ce
 sub x2,x2,#8
 subs x10,x10,#8
 bhi Loop_squeeze_ce
 bl KeccakF1600_cext
 ldr x30,[sp,#8]
 mov x9,x0
 mov x10,x3
 b Loop_squeeze_ce
.align 4
Lsqueeze_tail_ce:
 strb w4,[x1],#1
 lsr x4,x4,#8
 subs x2,x2,#1
 beq Lsqueeze_done_ce
 strb w4,[x1],#1
 lsr x4,x4,#8
 subs x2,x2,#1
 beq Lsqueeze_done_ce
 strb w4,[x1],#1
 lsr x4,x4,#8
 subs x2,x2,#1
 beq Lsqueeze_done_ce
 strb w4,[x1],#1
 lsr x4,x4,#8
 subs x2,x2,#1
 beq Lsqueeze_done_ce
 strb w4,[x1],#1
 lsr x4,x4,#8
 subs x2,x2,#1
 beq Lsqueeze_done_ce
 strb w4,[x1],#1
 lsr x4,x4,#8
 subs x2,x2,#1
 beq Lsqueeze_done_ce
 strb w4,[x1],#1
Lsqueeze_done_ce:
 ldr x29,[sp],#16

 ret

.byte 75,101,99,99,97,107,45,49,54,48,48,32,97,98,115,111,114,98,32,97,110,100,32,115,113,117,101,101,122,101,32,102,111,114,32,65,82,77,118,56,44,32,67,82,89,80,84,79,71,65,77,83,32,98,121,32,60,97,112,112,114,111,64,111,112,101,110,115,115,108,46,111,114,103,62,0
.align 2
