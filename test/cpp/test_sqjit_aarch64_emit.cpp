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

    SQJitA64Buffer fp_buf = {};
    CHECK(sqjit_a64_emit_scvtf_s_x(&fp_buf, 0, 9), "scvtf emits");
    CHECK(fp_buf.size == 4, "scvtf instruction count");
    CHECK(word_at(fp_buf, 0) == 0x9E220120u, "scvtf encoding");

    SQInteger size_before_bad_load = buf.size;
    CHECK(!sqjit_a64_emit_ldr_x(&buf, 0, 1, 2), "misaligned load is rejected");
    CHECK(buf.size == size_before_bad_load, "rejected load does not grow buffer");

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
