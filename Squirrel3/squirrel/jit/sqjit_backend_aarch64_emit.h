/*  see copyright notice in squirrel.h */
#ifndef _SQJIT_BACKEND_AARCH64_EMIT_H_
#define _SQJIT_BACKEND_AARCH64_EMIT_H_

#include "sqpcheader.h"
#include "sqobject.h"
#include "sqopcodes.h"
#include <stdint.h>

struct SQJitA64Buffer {
    unsigned char bytes[8192];
    SQInteger size;
};

struct SQJitA64Reloc {
    SQInteger patch_offset;
    SQInteger target_ip;
    unsigned char cond;
    bool conditional;
};

enum SQJitA64Cond {
    SQ_JIT_A64_EQ = 0,
    SQ_JIT_A64_NE = 1,
    SQ_JIT_A64_LT = 11,
    SQ_JIT_A64_GE = 10,
    SQ_JIT_A64_GT = 12,
    SQ_JIT_A64_LE = 13
};

bool sqjit_a64_emit_u32(SQJitA64Buffer *buf, uint32_t value);
bool sqjit_a64_emit_mov_reg(SQJitA64Buffer *buf, unsigned dst, unsigned src);
bool sqjit_a64_emit_mov_imm_x(SQJitA64Buffer *buf, unsigned rd, SQInteger value);
bool sqjit_a64_emit_mov_imm_w(SQJitA64Buffer *buf, unsigned rd, uint32_t value);
bool sqjit_a64_emit_ldr_x(SQJitA64Buffer *buf, unsigned rt, unsigned rn, SQInteger offset);
bool sqjit_a64_emit_str_x(SQJitA64Buffer *buf, unsigned rt, unsigned rn, SQInteger offset);
bool sqjit_a64_emit_ldr_w(SQJitA64Buffer *buf, unsigned rt, unsigned rn, SQInteger offset);
bool sqjit_a64_emit_str_w(SQJitA64Buffer *buf, unsigned rt, unsigned rn, SQInteger offset);
bool sqjit_a64_emit_ldr_s(SQJitA64Buffer *buf, unsigned rt, unsigned rn, SQInteger offset);
bool sqjit_a64_emit_str_s(SQJitA64Buffer *buf, unsigned rt, unsigned rn, SQInteger offset);
bool sqjit_a64_emit_add_imm(SQJitA64Buffer *buf, unsigned rd, unsigned rn, SQInteger imm);
bool sqjit_a64_emit_sub_imm(SQJitA64Buffer *buf, unsigned rd, unsigned rn, SQInteger imm);
bool sqjit_a64_emit_add_reg(SQJitA64Buffer *buf, unsigned rd, unsigned rn, unsigned rm);
bool sqjit_a64_emit_add_reg_lsl(SQJitA64Buffer *buf, unsigned rd, unsigned rn,
    unsigned rm, unsigned shift);
bool sqjit_a64_emit_sub_reg(SQJitA64Buffer *buf, unsigned rd, unsigned rn, unsigned rm);
bool sqjit_a64_emit_mul_reg(SQJitA64Buffer *buf, unsigned rd, unsigned rn, unsigned rm);
bool sqjit_a64_emit_sdiv_reg(SQJitA64Buffer *buf, unsigned rd, unsigned rn, unsigned rm);
bool sqjit_a64_emit_msub_reg(SQJitA64Buffer *buf, unsigned rd, unsigned rn, unsigned rm, unsigned ra);
bool sqjit_a64_emit_blr_x16(SQJitA64Buffer *buf);
bool sqjit_a64_emit_scvtf_s_x(SQJitA64Buffer *buf, unsigned sd, unsigned rn);
bool sqjit_a64_emit_fop_s(SQJitA64Buffer *buf, SQOpcode op, unsigned rd, unsigned rn, unsigned rm);
bool sqjit_a64_emit_fneg_s(SQJitA64Buffer *buf, unsigned rd, unsigned rn);
bool sqjit_a64_emit_fcmp_s(SQJitA64Buffer *buf, unsigned rn, unsigned rm);
bool sqjit_a64_emit_cmp_reg(SQJitA64Buffer *buf, unsigned rn, unsigned rm);
bool sqjit_a64_emit_cmp_imm(SQJitA64Buffer *buf, unsigned rn, SQInteger imm);
bool sqjit_a64_emit_cset(SQJitA64Buffer *buf, unsigned rd, unsigned cond);
bool sqjit_a64_emit_b_placeholder(SQJitA64Buffer *buf, SQInteger *patch_offset);
bool sqjit_a64_emit_bcond_placeholder(SQJitA64Buffer *buf, unsigned cond, SQInteger *patch_offset);
bool sqjit_a64_patch_branch(SQJitA64Buffer *buf, SQInteger patch_offset, SQInteger target_offset,
    bool conditional, unsigned cond);
bool sqjit_a64_record_reloc(SQJitA64Reloc *relocs, SQInteger *nrelocs, SQInteger maxrelocs,
    SQInteger patch_offset, SQInteger target_ip, bool conditional, unsigned cond);

SQInteger sqjit_a64_stack_type_disp(SQInteger slot);
SQInteger sqjit_a64_stack_value_disp(SQInteger slot);
SQInteger sqjit_a64_local_disp(SQInteger slot);

bool sqjit_a64_emit_prologue(SQJitA64Buffer *buf, SQInteger frame_size);
bool sqjit_a64_emit_epilogue(SQJitA64Buffer *buf, SQInteger frame_size, SQInteger status);
bool sqjit_a64_emit_type_guard(SQJitA64Buffer *buf, SQInteger stack_slot, SQObjectType type,
    SQJitA64Reloc *guard_relocs, SQInteger *nguard_relocs);

#endif
