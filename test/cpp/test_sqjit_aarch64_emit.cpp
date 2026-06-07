#include "sqpcheader.h"
#include "sqobject.h"
#include "jit/sqjit_backend_aarch64_emit.h"

#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

#define CHECK(cond, msg) \
    do { if (!(cond)) { fprintf(stderr, "FAIL: %s\n", msg); rc = 1; } } while (0)

static uint32_t word_at(const SQJitA64Buffer &buf, SQInteger index)
{
    uint32_t value = 0;
    memcpy(&value, &buf.bytes[index * 4], sizeof(value));
    return value;
}

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
    CHECK(sqjit_a64_emit_ldr_s(&mem_buf, 8, 9, 24), "ldr s emits");
    CHECK(sqjit_a64_emit_str_s(&mem_buf, 10, 11, 28), "str s emits");
    CHECK(mem_buf.size == 20, "memory instruction count");
    CHECK(word_at(mem_buf, 0) == 0xF9000862u, "str x encoding");
    CHECK(word_at(mem_buf, 1) == 0xB9400CA4u, "ldr w encoding");
    CHECK(word_at(mem_buf, 2) == 0xB90014E6u, "str w encoding");
    CHECK(word_at(mem_buf, 3) == 0xBD401928u, "ldr s encoding");
    CHECK(word_at(mem_buf, 4) == 0xBD001D6Au, "str s encoding");

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

    SQJitA64Buffer fp_buf = {};
    CHECK(sqjit_a64_emit_scvtf_s_x(&fp_buf, 0, 9), "scvtf emits");
    CHECK(sqjit_a64_emit_fop_s(&fp_buf, _OP_ADD, 1, 2, 3), "fadd emits");
    CHECK(sqjit_a64_emit_fop_s(&fp_buf, _OP_SUB, 4, 5, 6), "fsub emits");
    CHECK(sqjit_a64_emit_fop_s(&fp_buf, _OP_MUL, 7, 8, 9), "fmul emits");
    CHECK(sqjit_a64_emit_fop_s(&fp_buf, _OP_DIV, 10, 11, 12), "fdiv emits");
    CHECK(sqjit_a64_emit_fneg_s(&fp_buf, 13, 14), "fneg emits");
    CHECK(sqjit_a64_emit_fcmp_s(&fp_buf, 15, 16), "fcmp emits");
    CHECK(sqjit_a64_emit_cmp_reg(&fp_buf, 17, 18), "cmp register emits");
    CHECK(sqjit_a64_emit_cmp_imm(&fp_buf, 19, 33), "cmp immediate emits");
    CHECK(sqjit_a64_emit_cset(&fp_buf, 20, SQ_JIT_A64_EQ), "cset emits");
    CHECK(fp_buf.size == 40, "fp/comparison instruction count");
    CHECK(word_at(fp_buf, 0) == 0x9E220120u, "scvtf encoding");
    CHECK(word_at(fp_buf, 1) == 0x1E232841u, "fadd encoding");
    CHECK(word_at(fp_buf, 2) == 0x1E2638A4u, "fsub encoding");
    CHECK(word_at(fp_buf, 3) == 0x1E290907u, "fmul encoding");
    CHECK(word_at(fp_buf, 4) == 0x1E2C196Au, "fdiv encoding");
    CHECK(word_at(fp_buf, 5) == 0x1E2141CDu, "fneg encoding");
    CHECK(word_at(fp_buf, 6) == 0x1E3021E0u, "fcmp encoding");
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
    CHECK(!sqjit_a64_emit_fop_s(&buf, _OP_MOD, 1, 2, 3),
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

    if (rc == 0) printf("[OK] test_sqjit_aarch64_emit\n");
    return rc;
}
