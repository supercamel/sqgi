#include "sqpcheader.h"
#include "sqobject.h"
#include "jit/sqjit_backend_aarch64_emit.h"

#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <limits>
#include <initializer_list>
#if defined(__aarch64__) && defined(__linux__)
#include <sys/mman.h>
#endif

#define CHECK(cond, msg) \
    do { if (!(cond)) { fprintf(stderr, "FAIL: %s\n", msg); rc = 1; } } while (0)

static uint32_t word_at(const SQJitA64Buffer &buf, SQInteger index)
{
    uint32_t value = 0;
    memcpy(&value, &buf.bytes[index * 4], sizeof(value));
    return value;
}

static int forwarding_encoding_tests()
{
    int rc=0;SQJitA64Buffer buf={};
    sqjit_a64_emit_mov_imm_x(&buf,9,42);
    sqjit_a64_emit_str_x(&buf,9,31,0);
    sqjit_a64_emit_ldr_x(&buf,10,31,0);
    sqjit_a64_emit_u32(&buf,0xd65f03c0u);
    CHECK(sqjit_a64_forward_local_slots(&buf,1),"private store/load is forwarded");
    CHECK(word_at(buf,1)==0x9e670130u && word_at(buf,2)==0x9e66020au,
        "integer payload forwarding uses bit-preserving FP moves");
    CHECK(word_at(buf,3)==0xfd0003f0u && word_at(buf,4)==0xd65f03c0u,
        "dirty private slot materializes before return");
    SQJitA64Buffer bad={};sqjit_a64_emit_u32(&bad,0x14000010u);
    SQJitA64Buffer old=bad;
    CHECK(!sqjit_a64_forward_local_slots(&bad,1) && memcmp(&old,&bad,sizeof(bad))==0,
        "out-of-range branch refuses transaction without changing bytes");
    bad={};sqjit_a64_emit_u32(&bad,0x1e702800u);old=bad; // fadd d0,d0,d16
    CHECK(!sqjit_a64_forward_local_slots(&bad,1) && memcmp(&old,&bad,sizeof(bad))==0,
        "input scratch-FP use refuses forwarding");
    bad={};sqjit_a64_emit_mov_imm_x(&bad,9,42);sqjit_a64_emit_str_x(&bad,9,31,0);
    sqjit_a64_emit_ldr_x(&bad,10,31,0);
    while(bad.size<(SQInteger)sizeof(bad.bytes)) sqjit_a64_emit_u32(&bad,0xd503201fu);
    old=bad;
    CHECK(!sqjit_a64_forward_local_slots(&bad,1) && memcmp(&old,&bad,sizeof(bad))==0,
        "forwarding buffer exhaustion preserves the complete prior artifact");
    return rc;
}

#if defined(__aarch64__) && defined(__linux__)
static SQUnsignedInteger forwarding_helper_saw=0;
static void forwarding_clobber(SQUnsignedInteger *slots)
{
    forwarding_helper_saw=slots[0];++slots[0];
    asm volatile(
        "movi v16.16b,#90\n\tmovi v17.16b,#90\n\tmovi v18.16b,#90\n\tmovi v19.16b,#90\n\t"
        "movi v20.16b,#90\n\tmovi v21.16b,#90\n\tmovi v22.16b,#90\n\tmovi v23.16b,#90\n\t"
        "movi v24.16b,#90\n\tmovi v25.16b,#90\n\tmovi v26.16b,#90\n\tmovi v27.16b,#90\n\t"
        "movi v28.16b,#90\n\tmovi v29.16b,#90\n\tmovi v30.16b,#90\n\tmovi v31.16b,#90"
        ::: "v16","v17","v18","v19","v20","v21","v22","v23",
            "v24","v25","v26","v27","v28","v29","v30","v31","memory");
}
static int forwarding_native_tests()
{
    int rc=0;
    for(int mode=0;mode<5;++mode) {
        SQJitA64Buffer original={};sqjit_a64_emit_prologue(&original,256);
        SQInteger target=-1;
        if(mode==0) {
            sqjit_a64_emit_ldr_x(&original,9,19,8);
            sqjit_a64_emit_str_x(&original,9,31,0);
            sqjit_a64_emit_ldr_float(&original,0,31,0);
            sqjit_a64_emit_str_float(&original,0,31,8);
            sqjit_a64_emit_ldr_x(&original,9,31,8);
        }
        else if(mode==1) {
            sqjit_a64_emit_mov_imm_x(&original,9,41);sqjit_a64_emit_str_x(&original,9,31,0);
            sqjit_a64_emit_ldr_x(&original,9,31,0);sqjit_a64_emit_add_imm(&original,9,9,1);
            sqjit_a64_emit_str_x(&original,9,31,0);
            sqjit_a64_emit_add_imm(&original,0,31,0);
            sqjit_a64_emit_mov_imm_x(&original,16,(SQInteger)(intptr_t)forwarding_clobber);
            sqjit_a64_emit_blr_x16(&original);sqjit_a64_emit_ldr_x(&original,9,31,0);
        }
        else if(mode==2 || mode==3) {
            sqjit_a64_emit_ldr_x(&original,10,19,8);
            sqjit_a64_emit_mov_imm_x(&original,9,42);sqjit_a64_emit_str_x(&original,9,31,0);
            sqjit_a64_emit_ldr_x(&original,11,31,0);
            sqjit_a64_emit_cmp_imm(&original,10,0);
            if(mode==2) sqjit_a64_emit_bcond_placeholder(&original,SQ_JIT_A64_EQ,&target);
            else sqjit_a64_emit_test_branch(&original,10,0,true,&target);
            sqjit_a64_emit_mov_imm_x(&original,9,7);sqjit_a64_emit_str_x(&original,9,31,0);
            if(mode==2) sqjit_a64_patch_branch(&original,target,original.size,true,SQ_JIT_A64_EQ);
            else sqjit_a64_patch_test_branch(&original,target,original.size);
            sqjit_a64_emit_ldr_x(&original,9,31,0);
        }
        else {
            for(int n=0;n<20;++n) {
                sqjit_a64_emit_mov_imm_x(&original,9,100+n);sqjit_a64_emit_str_x(&original,9,31,n*8);
                sqjit_a64_emit_ldr_x(&original,10,31,n*8);
            }
            for(int n=0;n<20;++n) {
                sqjit_a64_emit_ldr_x(&original,9,31,n*8);sqjit_a64_emit_str_x(&original,9,19,n*8);
            }
        }
        if(mode!=4) sqjit_a64_emit_str_x(&original,9,19,0);
        sqjit_a64_emit_epilogue(&original,256,1);
        SQJitA64Buffer forwarded=original;
        CHECK(sqjit_a64_forward_local_slots(&forwarded,32),"synthetic native contract actually forwards slots");
        for(int enabled=0;enabled<2;++enabled) {
            SQJitA64Buffer &code=enabled ? forwarded : original;
            void *mapping=mmap(NULL,8192,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS,-1,0);
            CHECK(mapping!=MAP_FAILED,"map native forwarding contract");if(mapping==MAP_FAILED) continue;
            memcpy(mapping,code.bytes,(size_t)code.size);
            __builtin___clear_cache((char *)mapping,(char *)mapping+code.size);
            bool executable=mprotect(mapping,8192,PROT_READ|PROT_EXEC)==0;
            CHECK(executable,"make native forwarding contract executable");
            if(executable) for(SQUnsignedInteger input : {SQUnsignedInteger(0),SQUnsignedInteger(1),SQUnsignedInteger(0x8000000000000000ULL),SQUnsignedInteger(0x7ff8000000001234ULL)}) {
                SQUnsignedInteger output[32]={};output[1]=input;forwarding_helper_saw=0;
                typedef SQInteger (*Entry)(SQUnsignedInteger *,void *,void *);
                CHECK(((Entry)mapping)(output,NULL,NULL)==1,"forwarded native return ABI");
                if(mode==0) CHECK(output[0]==input,"mixed integer/float copies preserve zero sign and NaN payload bits");
                if(mode==1) CHECK(output[0]==43 && forwarding_helper_saw==42,"helper sees materialized frame and scratch clobbers are invalidated");
                if(mode==2) CHECK(output[0]==(input==0 ? 42u : 7u),"conditional target and NZCV survive slot spills");
                if(mode==3) CHECK(output[0]==(input&1 ? 42u : 7u),"test-bit target survives slot spills");
                if(mode==4) for(int n=0;n<20;++n) CHECK(output[n]==SQUnsignedInteger(100+n),"cache eviction and alias barriers preserve every slot");
            }
            munmap(mapping,8192);
        }
    }
    printf("[coverage] executed AArch64 local-slot forwarding contracts (bits, calls, branches, eviction)\n");
    return rc;
}
#endif

int main(void)
{
    int rc = 0;

    SQJitA64Buffer buf = {};
    CHECK(sqjit_a64_emit_mov_reg(&buf, 1, 2), "mov register emits");
    CHECK(sqjit_a64_emit_add_imm(&buf, 3, 4, 32), "add immediate emits");
    CHECK(sqjit_a64_emit_add_reg_lsl(&buf, 1, 2, 3, 4), "add shifted register emits");
    CHECK(sqjit_a64_emit_mov_imm_w(&buf, 5, 0x12345678u), "wide immediate emits");
    CHECK(buf.size == 20, "expected instruction count");
    CHECK(word_at(buf, 0) == 0xAA0203E1u, "mov register encoding");
    CHECK(word_at(buf, 1) == 0x91008083u, "add immediate encoding");
    CHECK(word_at(buf, 2) == 0x8B031041u, "add shifted register encoding");
    CHECK(word_at(buf, 3) == 0x528ACF05u, "movz w immediate encoding");
    CHECK(word_at(buf, 4) == 0x72A24685u, "movk w immediate encoding");

    SQJitA64Buffer mem_buf = {};
    CHECK(sqjit_a64_emit_str_x(&mem_buf, 2, 3, 16), "str x emits");
    CHECK(sqjit_a64_emit_ldr_w(&mem_buf, 4, 5, 12), "ldr w emits");
    CHECK(sqjit_a64_emit_str_w(&mem_buf, 6, 7, 20), "str w emits");
    CHECK(sqjit_a64_emit_ldr_float(&mem_buf, 8, 9, 24), "ldr d emits");
    CHECK(sqjit_a64_emit_str_float(&mem_buf, 10, 11, 32), "str d emits");
    CHECK(mem_buf.size == 20, "memory instruction count");
    CHECK(word_at(mem_buf, 0) == 0xF9000862u, "str x encoding");
    CHECK(word_at(mem_buf, 1) == 0xB9400CA4u, "ldr w encoding");
    CHECK(word_at(mem_buf, 2) == 0xB90014E6u, "str w encoding");
    CHECK(word_at(mem_buf, 3) == 0xFD400D28u, "ldr d encoding");
    CHECK(word_at(mem_buf, 4) == 0xFD00116Au, "str d encoding");

    SQJitA64Buffer alu_buf = {};
    CHECK(sqjit_a64_emit_sub_imm(&alu_buf, 1, 2, 7), "sub immediate emits");
    CHECK(sqjit_a64_emit_add_reg(&alu_buf, 1, 2, 3), "add register emits");
    CHECK(sqjit_a64_emit_sub_reg(&alu_buf, 4, 5, 6), "sub register emits");
    CHECK(sqjit_a64_emit_mul_reg(&alu_buf, 7, 8, 9), "mul register emits");
    CHECK(sqjit_a64_emit_sdiv_reg(&alu_buf, 10, 11, 12), "sdiv register emits");
    CHECK(sqjit_a64_emit_msub_reg(&alu_buf, 13, 14, 15, 16), "msub register emits");
    CHECK(sqjit_a64_emit_blr_x16(&alu_buf), "blr x16 emits");
    CHECK(alu_buf.size == 28, "alu instruction count");
    CHECK(word_at(alu_buf, 0) == 0xD1001C41u, "sub immediate encoding");
    CHECK(word_at(alu_buf, 1) == 0x8B030041u, "add register encoding");
    CHECK(word_at(alu_buf, 2) == 0xCB0600A4u, "sub register encoding");
    CHECK(word_at(alu_buf, 3) == 0x9B097D07u, "mul register encoding");
    CHECK(word_at(alu_buf, 4) == 0x9ACC0D6Au, "sdiv register encoding");
    CHECK(word_at(alu_buf, 5) == 0x9B0FC1CDu, "msub register encoding");
    CHECK(word_at(alu_buf, 6) == 0xD63F0200u, "blr x16 encoding");
    SQJitA64Buffer mask_buf = {};
    CHECK(sqjit_a64_emit_and_reg(&mask_buf, 4, 5, 6), "and register emits");
    CHECK(word_at(mask_buf, 0) == 0x8A0600A4u, "and register encoding");
    CHECK(!sqjit_a64_emit_and_reg(&mask_buf, 32, 5, 6) &&
        !sqjit_a64_emit_and_reg(&mask_buf, 4, 32, 6) &&
        !sqjit_a64_emit_and_reg(&mask_buf, 4, 5, 32) && mask_buf.size == 4,
        "and rejects invalid registers without emitting code");

    SQJitA64Buffer fp_buf = {};
    CHECK(sqjit_a64_emit_scvtf_float_x(&fp_buf, 0, 9), "scvtf emits");
    CHECK(sqjit_a64_emit_fop_float(&fp_buf, _OP_ADD, 1, 2, 3), "fadd emits");
    CHECK(sqjit_a64_emit_fop_float(&fp_buf, _OP_SUB, 4, 5, 6), "fsub emits");
    CHECK(sqjit_a64_emit_fop_float(&fp_buf, _OP_MUL, 7, 8, 9), "fmul emits");
    CHECK(sqjit_a64_emit_fop_float(&fp_buf, _OP_DIV, 10, 11, 12), "fdiv emits");
    CHECK(sqjit_a64_emit_fneg_float(&fp_buf, 13, 14), "fneg emits");
    CHECK(sqjit_a64_emit_fcmp_float(&fp_buf, 15, 16), "fcmp emits");
    CHECK(sqjit_a64_emit_cmp_reg(&fp_buf, 17, 18), "cmp register emits");
    CHECK(sqjit_a64_emit_cmp_imm(&fp_buf, 19, 33), "cmp immediate emits");
    CHECK(sqjit_a64_emit_cset(&fp_buf, 20, SQ_JIT_A64_EQ), "cset emits");
    CHECK(fp_buf.size == 40, "fp/comparison instruction count");
    CHECK(word_at(fp_buf, 0) == 0x9E620120u, "scvtf encoding");
    CHECK(word_at(fp_buf, 1) == 0x1E632841u, "fadd encoding");
    CHECK(word_at(fp_buf, 2) == 0x1E6638A4u, "fsub encoding");
    CHECK(word_at(fp_buf, 3) == 0x1E690907u, "fmul encoding");
    CHECK(word_at(fp_buf, 4) == 0x1E6C196Au, "fdiv encoding");
    CHECK(word_at(fp_buf, 5) == 0x1E6141CDu, "fneg encoding");
    CHECK(word_at(fp_buf, 6) == 0x1E7021E0u, "fcmp encoding");
    CHECK(word_at(fp_buf, 7) == 0xEB12023Fu, "cmp register encoding");
    CHECK(word_at(fp_buf, 8) == 0xF100867Fu, "cmp immediate encoding");
    CHECK(word_at(fp_buf, 9) == 0x9A9F17F4u, "cset encoding");

    SQInteger size_before_bad_load = buf.size;
    CHECK(!sqjit_a64_emit_ldr_x(&buf, 0, 1, 2), "misaligned load is rejected");
    CHECK(buf.size == size_before_bad_load, "rejected load does not grow buffer");
    CHECK(!sqjit_a64_emit_add_reg_lsl(&buf, 1, 2, 3, 64),
        "oversized shift is rejected");
    CHECK(buf.size == size_before_bad_load, "rejected shift does not grow buffer");
    CHECK(!sqjit_a64_emit_cmp_imm(&buf, 1, 4096),
        "oversized compare immediate is rejected");
    CHECK(buf.size == size_before_bad_load, "rejected compare immediate does not grow buffer");
    CHECK(!sqjit_a64_emit_fop_float(&buf, _OP_MOD, 1, 2, 3),
        "unsupported float op is rejected");
    CHECK(buf.size == size_before_bad_load, "rejected float op does not grow buffer");

    SQJitA64Buffer branch_buf = {};
    SQInteger branch_patch = -1;
    CHECK(sqjit_a64_emit_b_placeholder(&branch_buf, &branch_patch), "branch placeholder emits");
    CHECK(sqjit_a64_emit_mov_reg(&branch_buf, 0, 0), "branch filler emits");
    CHECK(sqjit_a64_patch_branch(&branch_buf, branch_patch, branch_buf.size, false, 0),
        "unconditional branch patches");
    CHECK(word_at(branch_buf, 0) == 0x14000002u, "unconditional branch encoding");

    SQInteger cond_patch = -1;
    CHECK(sqjit_a64_emit_bcond_placeholder(&branch_buf, SQ_JIT_A64_NE, &cond_patch),
        "conditional branch placeholder emits");
    CHECK(sqjit_a64_patch_branch(&branch_buf, cond_patch, branch_patch, true, SQ_JIT_A64_NE),
        "conditional branch patches backwards");
    CHECK(word_at(branch_buf, 2) ==
        (0x54000000u | (((uint32_t)-2 & 0x7FFFFu) << 5) | SQ_JIT_A64_NE),
        "conditional branch encoding");
    CHECK(!sqjit_a64_patch_branch(&branch_buf, cond_patch, cond_patch + 2, true,
        SQ_JIT_A64_NE), "unaligned branch target is rejected");

    SQJitA64Buffer bits = {};
    SQInteger bit_patch = -1;
    CHECK(sqjit_a64_emit_test_branch(&bits, 9, 27, false, &bit_patch) &&
        sqjit_a64_patch_test_branch(&bits, bit_patch, bit_patch + 8) &&
        word_at(bits, 0) == 0x36D80049u, "TBZ encoding matches assembler");
    CHECK(sqjit_a64_emit_test_branch(&bits, 10, 63, true, &bit_patch) &&
        sqjit_a64_patch_test_branch(&bits, bit_patch, bit_patch - 8) &&
        word_at(bits, 1) == 0xB7FFFFCAu, "TBNZ high-bit/backward encoding matches assembler");
    CHECK(sqjit_a64_emit_test_branch(&bits, 31, 0, false, &bit_patch) &&
        sqjit_a64_patch_test_branch(&bits, bit_patch, bit_patch - 32768) &&
        word_at(bits, 2) == 0x3604001Fu, "TBZ negative range boundary matches assembler");
    CHECK(sqjit_a64_emit_test_branch(&bits, 0, 32, true, &bit_patch) &&
        sqjit_a64_patch_test_branch(&bits, bit_patch, bit_patch + 32764) &&
        word_at(bits, 3) == 0xB703FFE0u, "TBNZ positive range boundary matches assembler");
    uint32_t saved_bit_word = word_at(bits, 3);
    CHECK(!sqjit_a64_patch_test_branch(&bits, bit_patch, bit_patch + 32768) &&
        !sqjit_a64_patch_test_branch(&bits, bit_patch, bit_patch - 32772) &&
        !sqjit_a64_patch_test_branch(&bits, bit_patch, bit_patch + 2) &&
        !sqjit_a64_patch_test_branch(&bits, bit_patch, std::numeric_limits<SQInteger>::min()) &&
        !sqjit_a64_patch_test_branch(&bits, bit_patch, std::numeric_limits<SQInteger>::max()) &&
        word_at(bits, 3) == saved_bit_word, "invalid TBZ displacement preserves instruction");
    CHECK(!sqjit_a64_patch_test_branch(&bits, -4, 0) &&
        !sqjit_a64_patch_test_branch(&bits, bits.size, 0) &&
        !sqjit_a64_patch_test_branch(&bits, 2, 0) &&
        !sqjit_a64_patch_test_branch(&branch_buf, 0, 0), "TBZ patch validates source offset and opcode");
    SQInteger saved_patch = bit_patch;
    CHECK(!sqjit_a64_emit_test_branch(&bits, 32, 0, false, &bit_patch) &&
        !sqjit_a64_emit_test_branch(&bits, 0, 64, false, &bit_patch) &&
        !sqjit_a64_emit_test_branch(NULL, 0, 0, false, &bit_patch) &&
        !sqjit_a64_emit_test_branch(&bits, 0, 0, false, NULL) &&
        bits.size == 16 && bit_patch == saved_patch, "invalid TBZ operands preserve output and patch");
    SQJitA64Buffer full_bits = {};
    full_bits.size = sizeof(full_bits.bytes);
    CHECK(!sqjit_a64_emit_test_branch(&full_bits, 0, 0, false, &bit_patch) &&
        bit_patch == saved_patch && full_bits.size == (SQInteger)sizeof(full_bits.bytes),
        "full TBZ buffer does not publish a patch");

    SQJitA64Buffer bad_predicate = {};
    SQInteger bad_skip = -1;
    CHECK(!sqjit_a64_emit_scalar_get_skip(&bad_predicate, -1, 1, 0, &bad_skip) &&
        !sqjit_a64_emit_scalar_get_skip(&bad_predicate, MAX_FUNC_STACKSIZE, 1, 0, &bad_skip) &&
        !sqjit_a64_emit_scalar_get_skip(&bad_predicate, 0, 0, 0, &bad_skip) &&
        !sqjit_a64_emit_scalar_get_skip(&bad_predicate, 0, 1, -4, &bad_skip) &&
        !sqjit_a64_emit_scalar_get_skip(&bad_predicate, 0, 1, 2, &bad_skip) &&
        !sqjit_a64_emit_scalar_get_skip(&bad_predicate, 0, 1, 16384, &bad_skip) &&
        !sqjit_a64_emit_scalar_get_skip(NULL, 0, 1, 0, &bad_skip) &&
        !sqjit_a64_emit_scalar_get_skip(&bad_predicate, 0, 1, 0, NULL) &&
        bad_predicate.size == 0 && bad_skip == -1,
        "invalid ownership predicate arguments emit no code");
    bad_predicate.size = -1;
    CHECK(!sqjit_a64_emit_scalar_get_skip(&bad_predicate, 0, 1, 0, &bad_skip) &&
        bad_predicate.size == -1 && bad_skip == -1, "invalid predicate buffer is rejected");


    SQJitA64Reloc relocs[2] = {};
    SQInteger nrelocs = 0;
    SQJitA64Buffer guard_buf = {};
    CHECK(sqjit_a64_emit_type_guard(&guard_buf, 3, OT_INTEGER, relocs, &nrelocs),
        "type guard emits");
    CHECK(nrelocs == 1, "type guard records one relocation");
    CHECK(relocs[0].conditional && relocs[0].cond == SQ_JIT_A64_NE &&
        relocs[0].target_ip == -1, "type guard relocation fields");

    CHECK(sqjit_a64_stack_type_disp(2) ==
        2 * (SQInteger)sizeof(SQObjectPtr) + (SQInteger)offsetof(SQObject, _type),
        "stack type displacement");
    CHECK(sqjit_a64_stack_value_disp(2) ==
        2 * (SQInteger)sizeof(SQObjectPtr) + (SQInteger)offsetof(SQObject, _unVal),
        "stack value displacement");
    CHECK(sqjit_a64_local_disp(3) == 3 * (SQInteger)sizeof(SQInteger),
        "local displacement");

    rc |= forwarding_encoding_tests();
#if defined(__aarch64__) && defined(__linux__)
    rc |= forwarding_native_tests();
#endif
    if (rc == 0) printf("[OK] test_sqjit_aarch64_emit\n");
    return rc;
}
