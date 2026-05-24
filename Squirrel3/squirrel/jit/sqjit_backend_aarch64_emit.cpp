/*  see copyright notice in squirrel.h */
#include "sqpcheader.h"
#include "sqjit_backend_aarch64_emit.h"
#include <stddef.h>
#include <string.h>

#if defined(__aarch64__) && defined(__linux__)

static bool sqjit_a64_is_i12(SQInteger value)
{
    return value >= 0 && value <= 4095;
}

bool sqjit_a64_emit_u32(SQJitA64Buffer *buf, uint32_t value)
{
    if(buf->size + 4 > (SQInteger)sizeof(buf->bytes)) {
        return false;
    }
    memcpy(&buf->bytes[buf->size], &value, sizeof(value));
    buf->size += 4;
    return true;
}

static bool sqjit_a64_patch_u32(SQJitA64Buffer *buf, SQInteger offset, uint32_t value)
{
    if(offset < 0 || offset + 4 > buf->size) {
        return false;
    }
    memcpy(&buf->bytes[offset], &value, sizeof(value));
    return true;
}

bool sqjit_a64_emit_mov_reg(SQJitA64Buffer *buf, unsigned dst, unsigned src)
{
    return sqjit_a64_emit_u32(buf, 0xAA0003E0u | (src << 16) | dst);
}

static bool sqjit_a64_emit_movz_x(SQJitA64Buffer *buf, unsigned rd, uint16_t imm, unsigned shift)
{
    return sqjit_a64_emit_u32(buf, 0xD2800000u | ((shift / 16) << 21) | ((uint32_t)imm << 5) | rd);
}

static bool sqjit_a64_emit_movk_x(SQJitA64Buffer *buf, unsigned rd, uint16_t imm, unsigned shift)
{
    return sqjit_a64_emit_u32(buf, 0xF2800000u | ((shift / 16) << 21) | ((uint32_t)imm << 5) | rd);
}

static bool sqjit_a64_emit_movz_w(SQJitA64Buffer *buf, unsigned rd, uint16_t imm, unsigned shift)
{
    return sqjit_a64_emit_u32(buf, 0x52800000u | ((shift / 16) << 21) | ((uint32_t)imm << 5) | rd);
}

static bool sqjit_a64_emit_movk_w(SQJitA64Buffer *buf, unsigned rd, uint16_t imm, unsigned shift)
{
    return sqjit_a64_emit_u32(buf, 0x72800000u | ((shift / 16) << 21) | ((uint32_t)imm << 5) | rd);
}

bool sqjit_a64_emit_mov_imm_x(SQJitA64Buffer *buf, unsigned rd, SQInteger value)
{
    uint64_t v = (uint64_t)value;
    if(!sqjit_a64_emit_movz_x(buf, rd, (uint16_t)(v & 0xFFFFu), 0)) {
        return false;
    }
    for(unsigned shift = 16; shift < 64; shift += 16) {
        uint16_t part = (uint16_t)((v >> shift) & 0xFFFFu);
        if(part != 0 && !sqjit_a64_emit_movk_x(buf, rd, part, shift)) {
            return false;
        }
    }
    return true;
}

bool sqjit_a64_emit_mov_imm_w(SQJitA64Buffer *buf, unsigned rd, uint32_t value)
{
    if(!sqjit_a64_emit_movz_w(buf, rd, (uint16_t)(value & 0xFFFFu), 0)) {
        return false;
    }
    uint16_t high = (uint16_t)((value >> 16) & 0xFFFFu);
    if(high != 0 && !sqjit_a64_emit_movk_w(buf, rd, high, 16)) {
        return false;
    }
    return true;
}

bool sqjit_a64_emit_ldr_x(SQJitA64Buffer *buf, unsigned rt, unsigned rn, SQInteger offset)
{
    if(offset < 0 || (offset & 7) != 0 || offset / 8 > 4095) {
        return false;
    }
    return sqjit_a64_emit_u32(buf, 0xF9400000u | (((uint32_t)(offset / 8)) << 10) | (rn << 5) | rt);
}

bool sqjit_a64_emit_str_x(SQJitA64Buffer *buf, unsigned rt, unsigned rn, SQInteger offset)
{
    if(offset < 0 || (offset & 7) != 0 || offset / 8 > 4095) {
        return false;
    }
    return sqjit_a64_emit_u32(buf, 0xF9000000u | (((uint32_t)(offset / 8)) << 10) | (rn << 5) | rt);
}

bool sqjit_a64_emit_ldr_w(SQJitA64Buffer *buf, unsigned rt, unsigned rn, SQInteger offset)
{
    if(offset < 0 || (offset & 3) != 0 || offset / 4 > 4095) {
        return false;
    }
    return sqjit_a64_emit_u32(buf, 0xB9400000u | (((uint32_t)(offset / 4)) << 10) | (rn << 5) | rt);
}

bool sqjit_a64_emit_str_w(SQJitA64Buffer *buf, unsigned rt, unsigned rn, SQInteger offset)
{
    if(offset < 0 || (offset & 3) != 0 || offset / 4 > 4095) {
        return false;
    }
    return sqjit_a64_emit_u32(buf, 0xB9000000u | (((uint32_t)(offset / 4)) << 10) | (rn << 5) | rt);
}

bool sqjit_a64_emit_ldr_s(SQJitA64Buffer *buf, unsigned rt, unsigned rn, SQInteger offset)
{
    if(offset < 0 || (offset & 3) != 0 || offset / 4 > 4095) {
        return false;
    }
    return sqjit_a64_emit_u32(buf, 0xBD400000u | (((uint32_t)(offset / 4)) << 10) | (rn << 5) | rt);
}

bool sqjit_a64_emit_str_s(SQJitA64Buffer *buf, unsigned rt, unsigned rn, SQInteger offset)
{
    if(offset < 0 || (offset & 3) != 0 || offset / 4 > 4095) {
        return false;
    }
    return sqjit_a64_emit_u32(buf, 0xBD000000u | (((uint32_t)(offset / 4)) << 10) | (rn << 5) | rt);
}

bool sqjit_a64_emit_add_imm(SQJitA64Buffer *buf, unsigned rd, unsigned rn, SQInteger imm)
{
    if(!sqjit_a64_is_i12(imm)) {
        return false;
    }
    return sqjit_a64_emit_u32(buf, 0x91000000u | ((uint32_t)imm << 10) | (rn << 5) | rd);
}

bool sqjit_a64_emit_sub_imm(SQJitA64Buffer *buf, unsigned rd, unsigned rn, SQInteger imm)
{
    if(!sqjit_a64_is_i12(imm)) {
        return false;
    }
    return sqjit_a64_emit_u32(buf, 0xD1000000u | ((uint32_t)imm << 10) | (rn << 5) | rd);
}

bool sqjit_a64_emit_add_reg(SQJitA64Buffer *buf, unsigned rd, unsigned rn, unsigned rm)
{
    return sqjit_a64_emit_u32(buf, 0x8B000000u | (rm << 16) | (rn << 5) | rd);
}

bool sqjit_a64_emit_add_reg_lsl(SQJitA64Buffer *buf, unsigned rd, unsigned rn,
    unsigned rm, unsigned shift)
{
    if(shift > 63) {
        return false;
    }
    return sqjit_a64_emit_u32(buf, 0x8B000000u | (rm << 16) |
        ((uint32_t)shift << 10) | (rn << 5) | rd);
}

bool sqjit_a64_emit_sub_reg(SQJitA64Buffer *buf, unsigned rd, unsigned rn, unsigned rm)
{
    return sqjit_a64_emit_u32(buf, 0xCB000000u | (rm << 16) | (rn << 5) | rd);
}

bool sqjit_a64_emit_mul_reg(SQJitA64Buffer *buf, unsigned rd, unsigned rn, unsigned rm)
{
    return sqjit_a64_emit_u32(buf, 0x9B007C00u | (rm << 16) | (rn << 5) | rd);
}

bool sqjit_a64_emit_sdiv_reg(SQJitA64Buffer *buf, unsigned rd, unsigned rn, unsigned rm)
{
    return sqjit_a64_emit_u32(buf, 0x9AC00C00u | (rm << 16) | (rn << 5) | rd);
}

bool sqjit_a64_emit_msub_reg(SQJitA64Buffer *buf, unsigned rd, unsigned rn, unsigned rm, unsigned ra)
{
    return sqjit_a64_emit_u32(buf, 0x9B008000u | (rm << 16) | (ra << 10) | (rn << 5) | rd);
}

bool sqjit_a64_emit_blr_x16(SQJitA64Buffer *buf)
{
    return sqjit_a64_emit_u32(buf, 0xD63F0200u);
}

bool sqjit_a64_emit_scvtf_s_x(SQJitA64Buffer *buf, unsigned sd, unsigned rn)
{
    return sqjit_a64_emit_u32(buf, 0x9E220000u | (rn << 5) | sd);
}

bool sqjit_a64_emit_fop_s(SQJitA64Buffer *buf, SQOpcode op, unsigned rd, unsigned rn, unsigned rm)
{
    uint32_t base = 0;
    switch(op) {
        case _OP_ADD: base = 0x1E202800u; break;
        case _OP_SUB: base = 0x1E203800u; break;
        case _OP_MUL: base = 0x1E200800u; break;
        case _OP_DIV: base = 0x1E201800u; break;
        default: return false;
    }
    return sqjit_a64_emit_u32(buf, base | (rm << 16) | (rn << 5) | rd);
}

bool sqjit_a64_emit_fneg_s(SQJitA64Buffer *buf, unsigned rd, unsigned rn)
{
    return sqjit_a64_emit_u32(buf, 0x1E214000u | (rn << 5) | rd);
}

bool sqjit_a64_emit_fcmp_s(SQJitA64Buffer *buf, unsigned rn, unsigned rm)
{
    return sqjit_a64_emit_u32(buf, 0x1E202000u | (rm << 16) | (rn << 5));
}

bool sqjit_a64_emit_cmp_reg(SQJitA64Buffer *buf, unsigned rn, unsigned rm)
{
    return sqjit_a64_emit_u32(buf, 0xEB00001Fu | (rm << 16) | (rn << 5));
}

bool sqjit_a64_emit_cmp_imm(SQJitA64Buffer *buf, unsigned rn, SQInteger imm)
{
    if(!sqjit_a64_is_i12(imm)) {
        return false;
    }
    return sqjit_a64_emit_u32(buf, 0xF100001Fu | ((uint32_t)imm << 10) | (rn << 5));
}

bool sqjit_a64_emit_cset(SQJitA64Buffer *buf, unsigned rd, unsigned cond)
{
    unsigned inv = cond ^ 1u;
    return sqjit_a64_emit_u32(buf, 0x9A9F07E0u | (inv << 12) | rd);
}

bool sqjit_a64_emit_b_placeholder(SQJitA64Buffer *buf, SQInteger *patch_offset)
{
    *patch_offset = buf->size;
    return sqjit_a64_emit_u32(buf, 0x14000000u);
}

bool sqjit_a64_emit_bcond_placeholder(SQJitA64Buffer *buf, unsigned cond, SQInteger *patch_offset)
{
    *patch_offset = buf->size;
    return sqjit_a64_emit_u32(buf, 0x54000000u | cond);
}

bool sqjit_a64_patch_branch(SQJitA64Buffer *buf, SQInteger patch_offset, SQInteger target_offset,
    bool conditional, unsigned cond)
{
    SQInteger rel = target_offset - patch_offset;
    if((rel & 3) != 0) {
        return false;
    }
    SQInteger words = rel / 4;
    if(conditional) {
        if(words < -(1 << 18) || words >= (1 << 18)) {
            return false;
        }
        return sqjit_a64_patch_u32(buf, patch_offset,
            0x54000000u | (((uint32_t)words & 0x7FFFFu) << 5) | (cond & 0xFu));
    }
    if(words < -(1 << 25) || words >= (1 << 25)) {
        return false;
    }
    return sqjit_a64_patch_u32(buf, patch_offset,
        0x14000000u | ((uint32_t)words & 0x03FFFFFFu));
}

bool sqjit_a64_record_reloc(SQJitA64Reloc *relocs, SQInteger *nrelocs, SQInteger maxrelocs,
    SQInteger patch_offset, SQInteger target_ip, bool conditional, unsigned cond)
{
    if(*nrelocs >= maxrelocs) {
        return false;
    }
    relocs[*nrelocs].patch_offset = patch_offset;
    relocs[*nrelocs].target_ip = target_ip;
    relocs[*nrelocs].conditional = conditional;
    relocs[*nrelocs].cond = (unsigned char)cond;
    (*nrelocs)++;
    return true;
}

SQInteger sqjit_a64_stack_type_disp(SQInteger slot)
{
    return slot * (SQInteger)sizeof(SQObjectPtr) + (SQInteger)offsetof(SQObject, _type);
}

SQInteger sqjit_a64_stack_value_disp(SQInteger slot)
{
    return slot * (SQInteger)sizeof(SQObjectPtr) + (SQInteger)offsetof(SQObject, _unVal);
}

SQInteger sqjit_a64_local_disp(SQInteger slot)
{
    return slot * (SQInteger)sizeof(SQInteger);
}

bool sqjit_a64_emit_prologue(SQJitA64Buffer *buf, SQInteger frame_size)
{
    return sqjit_a64_emit_u32(buf, 0xA9BF7BFDu) && // stp x29, x30, [sp, #-16]!
        sqjit_a64_emit_u32(buf, 0x910003FDu) &&    // mov x29, sp
        sqjit_a64_emit_u32(buf, 0xA9BF53F3u) &&    // stp x19, x20, [sp, #-16]!
        sqjit_a64_emit_u32(buf, 0xA9BF5BF5u) &&    // stp x21, x22, [sp, #-16]!
        sqjit_a64_emit_sub_imm(buf, 31, 31, frame_size) &&
        sqjit_a64_emit_mov_reg(buf, 19, 0) &&
        sqjit_a64_emit_mov_reg(buf, 20, 1) &&
        sqjit_a64_emit_mov_reg(buf, 21, 2);
}

bool sqjit_a64_emit_epilogue(SQJitA64Buffer *buf, SQInteger frame_size, SQInteger status)
{
    return sqjit_a64_emit_add_imm(buf, 31, 31, frame_size) &&
        sqjit_a64_emit_u32(buf, 0xA8C15BF5u) && // ldp x21, x22, [sp], #16
        sqjit_a64_emit_u32(buf, 0xA8C153F3u) && // ldp x19, x20, [sp], #16
        sqjit_a64_emit_u32(buf, 0xA8C17BFDu) && // ldp x29, x30, [sp], #16
        sqjit_a64_emit_mov_imm_x(buf, 0, status) &&
        sqjit_a64_emit_u32(buf, 0xD65F03C0u);
}

bool sqjit_a64_emit_type_guard(SQJitA64Buffer *buf, SQInteger stack_slot, SQObjectType type,
    SQJitA64Reloc *guard_relocs, SQInteger *nguard_relocs)
{
    SQInteger patch_offset = 0;
    return sqjit_a64_emit_ldr_w(buf, 9, 19, sqjit_a64_stack_type_disp(stack_slot)) &&
        sqjit_a64_emit_mov_imm_w(buf, 10, (uint32_t)type) &&
        sqjit_a64_emit_cmp_reg(buf, 9, 10) &&
        sqjit_a64_emit_bcond_placeholder(buf, SQ_JIT_A64_NE, &patch_offset) &&
        sqjit_a64_record_reloc(guard_relocs, nguard_relocs, MAX_FUNC_STACKSIZE + 512,
            patch_offset, -1, true, SQ_JIT_A64_NE);
}

#endif
