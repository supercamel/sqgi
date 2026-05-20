/*  see copyright notice in squirrel.h */
#include "sqpcheader.h"
#include "sqfuncproto.h"
#include "sqstring.h"
#include "sqvm.h"
#include "sqarray.h"
#include "sqtable.h"
#include "sqclosure.h"
#include "sqjit.h"
#include "sqjit_backend.h"
#include <limits.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>

#if defined(__aarch64__) && defined(__linux__)

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

enum SQJitA64SlotKind {
    SQ_JIT_A64_SLOT_UNKNOWN = 0,
    SQ_JIT_A64_SLOT_INT,
    SQ_JIT_A64_SLOT_FLOAT,
    SQ_JIT_A64_SLOT_BOOL,
    SQ_JIT_A64_SLOT_STACK_OBJECT
};

enum SQJitA64Cond {
    SQ_JIT_A64_EQ = 0,
    SQ_JIT_A64_NE = 1,
    SQ_JIT_A64_LT = 11,
    SQ_JIT_A64_GE = 10,
    SQ_JIT_A64_GT = 12,
    SQ_JIT_A64_LE = 13
};

static bool sqjit_a64_is_i12(SQInteger value)
{
    return value >= 0 && value <= 4095;
}

static bool sqjit_a64_emit_u32(SQJitA64Buffer *buf, uint32_t value)
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

static bool sqjit_a64_emit_mov_reg(SQJitA64Buffer *buf, unsigned dst, unsigned src)
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

static bool sqjit_a64_emit_mov_imm_x(SQJitA64Buffer *buf, unsigned rd, SQInteger value)
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

static bool sqjit_a64_emit_mov_imm_w(SQJitA64Buffer *buf, unsigned rd, uint32_t value)
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

static bool sqjit_a64_emit_ldr_x(SQJitA64Buffer *buf, unsigned rt, unsigned rn, SQInteger offset)
{
    if(offset < 0 || (offset & 7) != 0 || offset / 8 > 4095) {
        return false;
    }
    return sqjit_a64_emit_u32(buf, 0xF9400000u | (((uint32_t)(offset / 8)) << 10) | (rn << 5) | rt);
}

static bool sqjit_a64_emit_str_x(SQJitA64Buffer *buf, unsigned rt, unsigned rn, SQInteger offset)
{
    if(offset < 0 || (offset & 7) != 0 || offset / 8 > 4095) {
        return false;
    }
    return sqjit_a64_emit_u32(buf, 0xF9000000u | (((uint32_t)(offset / 8)) << 10) | (rn << 5) | rt);
}

static bool sqjit_a64_emit_ldr_w(SQJitA64Buffer *buf, unsigned rt, unsigned rn, SQInteger offset)
{
    if(offset < 0 || (offset & 3) != 0 || offset / 4 > 4095) {
        return false;
    }
    return sqjit_a64_emit_u32(buf, 0xB9400000u | (((uint32_t)(offset / 4)) << 10) | (rn << 5) | rt);
}

static bool sqjit_a64_emit_str_w(SQJitA64Buffer *buf, unsigned rt, unsigned rn, SQInteger offset)
{
    if(offset < 0 || (offset & 3) != 0 || offset / 4 > 4095) {
        return false;
    }
    return sqjit_a64_emit_u32(buf, 0xB9000000u | (((uint32_t)(offset / 4)) << 10) | (rn << 5) | rt);
}

static bool sqjit_a64_emit_ldr_s(SQJitA64Buffer *buf, unsigned rt, unsigned rn, SQInteger offset)
{
    if(offset < 0 || (offset & 3) != 0 || offset / 4 > 4095) {
        return false;
    }
    return sqjit_a64_emit_u32(buf, 0xBD400000u | (((uint32_t)(offset / 4)) << 10) | (rn << 5) | rt);
}

static bool sqjit_a64_emit_str_s(SQJitA64Buffer *buf, unsigned rt, unsigned rn, SQInteger offset)
{
    if(offset < 0 || (offset & 3) != 0 || offset / 4 > 4095) {
        return false;
    }
    return sqjit_a64_emit_u32(buf, 0xBD000000u | (((uint32_t)(offset / 4)) << 10) | (rn << 5) | rt);
}

static bool sqjit_a64_emit_add_imm(SQJitA64Buffer *buf, unsigned rd, unsigned rn, SQInteger imm)
{
    if(!sqjit_a64_is_i12(imm)) {
        return false;
    }
    return sqjit_a64_emit_u32(buf, 0x91000000u | ((uint32_t)imm << 10) | (rn << 5) | rd);
}

static bool sqjit_a64_emit_sub_imm(SQJitA64Buffer *buf, unsigned rd, unsigned rn, SQInteger imm)
{
    if(!sqjit_a64_is_i12(imm)) {
        return false;
    }
    return sqjit_a64_emit_u32(buf, 0xD1000000u | ((uint32_t)imm << 10) | (rn << 5) | rd);
}

static bool sqjit_a64_emit_add_reg(SQJitA64Buffer *buf, unsigned rd, unsigned rn, unsigned rm)
{
    return sqjit_a64_emit_u32(buf, 0x8B000000u | (rm << 16) | (rn << 5) | rd);
}

static bool sqjit_a64_emit_sub_reg(SQJitA64Buffer *buf, unsigned rd, unsigned rn, unsigned rm)
{
    return sqjit_a64_emit_u32(buf, 0xCB000000u | (rm << 16) | (rn << 5) | rd);
}

static bool sqjit_a64_emit_mul_reg(SQJitA64Buffer *buf, unsigned rd, unsigned rn, unsigned rm)
{
    return sqjit_a64_emit_u32(buf, 0x9B007C00u | (rm << 16) | (rn << 5) | rd);
}

static bool sqjit_a64_emit_sdiv_reg(SQJitA64Buffer *buf, unsigned rd, unsigned rn, unsigned rm)
{
    return sqjit_a64_emit_u32(buf, 0x9AC00C00u | (rm << 16) | (rn << 5) | rd);
}

static bool sqjit_a64_emit_msub_reg(SQJitA64Buffer *buf, unsigned rd, unsigned rn, unsigned rm, unsigned ra)
{
    return sqjit_a64_emit_u32(buf, 0x9B008000u | (rm << 16) | (ra << 10) | (rn << 5) | rd);
}

static bool sqjit_a64_emit_blr_x16(SQJitA64Buffer *buf)
{
    return sqjit_a64_emit_u32(buf, 0xD63F0200u);
}

static bool sqjit_a64_emit_fop_s(SQJitA64Buffer *buf, SQOpcode op, unsigned rd, unsigned rn, unsigned rm)
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

static bool sqjit_a64_emit_fcmp_s(SQJitA64Buffer *buf, unsigned rn, unsigned rm)
{
    return sqjit_a64_emit_u32(buf, 0x1E202000u | (rm << 16) | (rn << 5));
}

static bool sqjit_a64_emit_cmp_reg(SQJitA64Buffer *buf, unsigned rn, unsigned rm)
{
    return sqjit_a64_emit_u32(buf, 0xEB00001Fu | (rm << 16) | (rn << 5));
}

static bool sqjit_a64_emit_cmp_imm(SQJitA64Buffer *buf, unsigned rn, SQInteger imm)
{
    if(!sqjit_a64_is_i12(imm)) {
        return false;
    }
    return sqjit_a64_emit_u32(buf, 0xF100001Fu | ((uint32_t)imm << 10) | (rn << 5));
}

static bool sqjit_a64_emit_cset(SQJitA64Buffer *buf, unsigned rd, unsigned cond)
{
    unsigned inv = cond ^ 1u;
    return sqjit_a64_emit_u32(buf, 0x9A9F07E0u | (inv << 12) | rd);
}

static bool sqjit_a64_emit_b_placeholder(SQJitA64Buffer *buf, SQInteger *patch_offset)
{
    *patch_offset = buf->size;
    return sqjit_a64_emit_u32(buf, 0x14000000u);
}

static bool sqjit_a64_emit_bcond_placeholder(SQJitA64Buffer *buf, unsigned cond, SQInteger *patch_offset)
{
    *patch_offset = buf->size;
    return sqjit_a64_emit_u32(buf, 0x54000000u | cond);
}

static bool sqjit_a64_patch_branch(SQJitA64Buffer *buf, SQInteger patch_offset, SQInteger target_offset,
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

static bool sqjit_a64_record_reloc(SQJitA64Reloc *relocs, SQInteger *nrelocs, SQInteger maxrelocs,
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

static SQInteger sqjit_a64_stack_type_disp(SQInteger slot)
{
    return slot * (SQInteger)sizeof(SQObjectPtr) + (SQInteger)offsetof(SQObject, _type);
}

static SQInteger sqjit_a64_stack_value_disp(SQInteger slot)
{
    return slot * (SQInteger)sizeof(SQObjectPtr) + (SQInteger)offsetof(SQObject, _unVal);
}

static SQInteger sqjit_a64_local_disp(SQInteger slot)
{
    return slot * (SQInteger)sizeof(SQInteger);
}

static SQInteger sqjit_loadint_value(const SQInstruction &inst)
{
#ifndef _SQ64
    return (SQInteger)inst._arg1;
#else
    return (SQInteger)((SQInt32)inst._arg1);
#endif
}

static bool sqjit_loadfloat_value(const SQInstruction &inst, SQFloat *value)
{
    if(!value || sizeof(SQFloat) != sizeof(SQInt32)) {
        return false;
    }
    SQInt32 bits = inst._arg1;
    memcpy(value, &bits, sizeof(bits));
    return true;
}

static SQInteger sqjit_signed_arg1(const SQInstruction &inst)
{
    return (SQInteger)((SQInt32)inst._arg1);
}

static SQInteger sqjit_signed_arg3(const SQInstruction &inst)
{
    return (SQInteger)((signed char)inst._arg3);
}

static const SQChar *sqjit_a64_proto_name(SQFunctionProto *proto)
{
    return proto && sq_type(proto->_name) == OT_STRING ? _stringval(proto->_name) : _SC("<anonymous>");
}

static bool sqjit_a64_reject(SQFunctionProto *proto, SQInteger ip, const char *reason)
{
    if(getenv("SQGI_JIT_TRACE")) {
        scprintf(_SC("[sqjit:a64] reject proto '%s' ip %d: %s\n"),
            sqjit_a64_proto_name(proto), (SQInt32)ip, reason);
    }
    return false;
}

static bool sqjit_a64_emit_prologue(SQJitA64Buffer *buf, SQInteger frame_size)
{
    return sqjit_a64_emit_u32(buf, 0xA9BF7BFDu) && // stp x29, x30, [sp, #-16]!
        sqjit_a64_emit_u32(buf, 0x910003FDu) &&    // mov x29, sp
        sqjit_a64_emit_u32(buf, 0xA9BF53F3u) &&    // stp x19, x20, [sp, #-16]!
        sqjit_a64_emit_sub_imm(buf, 31, 31, frame_size) &&
        sqjit_a64_emit_mov_reg(buf, 19, 0) &&
        sqjit_a64_emit_mov_reg(buf, 20, 1);
}

static bool sqjit_a64_emit_epilogue(SQJitA64Buffer *buf, SQInteger frame_size, SQInteger status)
{
    return sqjit_a64_emit_add_imm(buf, 31, 31, frame_size) &&
        sqjit_a64_emit_u32(buf, 0xA8C153F3u) && // ldp x19, x20, [sp], #16
        sqjit_a64_emit_u32(buf, 0xA8C17BFDu) && // ldp x29, x30, [sp], #16
        sqjit_a64_emit_mov_imm_x(buf, 0, status) &&
        sqjit_a64_emit_u32(buf, 0xD65F03C0u);
}

static bool sqjit_a64_emit_type_guard(SQJitA64Buffer *buf, SQInteger stack_slot, SQObjectType type,
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

static SQInteger sqjit_a64_helper_array_get_integer(SQObjectPtr *stack, SQInteger array_reg,
    SQInteger index, SQInteger *out)
{
    if(!stack || !out || array_reg < 0 || index < 0 || sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!_array(stack[array_reg])->Get(index, value) || sq_type(value) != OT_INTEGER) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = _integer(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_get_float(SQObjectPtr *stack, SQInteger array_reg,
    SQInteger index, SQFloat *out)
{
    if(!stack || !out || array_reg < 0 || index < 0 || sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!_array(stack[array_reg])->Get(index, value) || sq_type(value) != OT_FLOAT) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = _float(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQObjectType sqjit_a64_observed_array_value_type(SQObjectPtr *entry_stack,
    SQInteger array_reg, SQInteger index)
{
    if(!entry_stack || array_reg < 0 || index < 0 || sq_type(entry_stack[array_reg]) != OT_ARRAY) {
        return OT_NULL;
    }
    SQObjectPtr value;
    if(!_array(entry_stack[array_reg])->Get(index, value)) {
        return OT_NULL;
    }
    return sq_type(value);
}

static SQInteger sqjit_a64_helper_table_get_integer(SQObjectPtr *stack, SQInteger table_reg,
    const SQObjectPtr *key, SQInteger *out)
{
    if(!stack || !key || !out || table_reg < 0 || sq_type(stack[table_reg]) != OT_TABLE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!_table(stack[table_reg])->Get(*key, value) || sq_type(value) != OT_INTEGER) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = _integer(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_table_get_float(SQObjectPtr *stack, SQInteger table_reg,
    const SQObjectPtr *key, SQFloat *out)
{
    if(!stack || !key || !out || table_reg < 0 || sq_type(stack[table_reg]) != OT_TABLE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!_table(stack[table_reg])->Get(*key, value) || sq_type(value) != OT_FLOAT) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = _float(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQObjectType sqjit_a64_observed_table_value_type(SQObjectPtr *entry_stack,
    SQInteger table_reg, const SQObjectPtr *key)
{
    if(!entry_stack || !key || table_reg < 0 || sq_type(entry_stack[table_reg]) != OT_TABLE) {
        return OT_NULL;
    }
    SQObjectPtr value;
    if(!_table(entry_stack[table_reg])->Get(*key, value)) {
        return OT_NULL;
    }
    return sq_type(value);
}

static bool sqjit_a64_emit_store_out_scalar(SQJitA64Buffer *buf, SQObjectType type, SQInteger slot,
    SQJitA64SlotKind kind)
{
    SQObjectType out_type = kind == SQ_JIT_A64_SLOT_BOOL ? OT_BOOL : type;
    if(!sqjit_a64_emit_mov_imm_w(buf, 9, (uint32_t)out_type) ||
        !sqjit_a64_emit_str_w(buf, 9, 20, (SQInteger)offsetof(SQObject, _type))) {
        return false;
    }
    if(kind == SQ_JIT_A64_SLOT_FLOAT) {
        return sqjit_a64_emit_mov_imm_x(buf, 10, 0) &&
            sqjit_a64_emit_str_x(buf, 10, 20, (SQInteger)offsetof(SQObject, _unVal)) &&
            sqjit_a64_emit_ldr_s(buf, 0, 31, sqjit_a64_local_disp(slot)) &&
            sqjit_a64_emit_str_s(buf, 0, 20, (SQInteger)offsetof(SQObject, _unVal));
    }
    return sqjit_a64_emit_ldr_x(buf, 10, 31, sqjit_a64_local_disp(slot)) &&
        sqjit_a64_emit_str_x(buf, 10, 20, (SQInteger)offsetof(SQObject, _unVal));
}

static bool sqjit_a64_emit_store_stack_scalar(SQJitA64Buffer *buf, SQInteger stack_slot,
    SQInteger local_slot, SQJitA64SlotKind kind)
{
    SQObjectType type = OT_INTEGER;
    if(kind == SQ_JIT_A64_SLOT_FLOAT) {
        type = OT_FLOAT;
    }
    else if(kind == SQ_JIT_A64_SLOT_BOOL) {
        type = OT_BOOL;
    }

    if(!sqjit_a64_emit_mov_imm_w(buf, 9, (uint32_t)type) ||
        !sqjit_a64_emit_str_w(buf, 9, 19, sqjit_a64_stack_type_disp(stack_slot))) {
        return false;
    }

    if(kind == SQ_JIT_A64_SLOT_FLOAT) {
        return sqjit_a64_emit_mov_imm_x(buf, 10, 0) &&
            sqjit_a64_emit_str_x(buf, 10, 19, sqjit_a64_stack_value_disp(stack_slot)) &&
            sqjit_a64_emit_ldr_s(buf, 0, 31, sqjit_a64_local_disp(local_slot)) &&
            sqjit_a64_emit_str_s(buf, 0, 19, sqjit_a64_stack_value_disp(stack_slot));
    }

    return sqjit_a64_emit_ldr_x(buf, 10, 31, sqjit_a64_local_disp(local_slot)) &&
        sqjit_a64_emit_str_x(buf, 10, 19, sqjit_a64_stack_value_disp(stack_slot));
}

static bool sqjit_a64_install_raw(void **entry_out, SQInteger *mapped_size_out, SQJitA64Buffer *buf)
{
    long page_size = sysconf(_SC_PAGESIZE);
    if(page_size <= 0) {
        page_size = 4096;
    }

    SQInteger alloc_size = ((buf->size + page_size - 1) / page_size) * page_size;
    void *mem = mmap(NULL, alloc_size, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    if(mem == MAP_FAILED) {
        return false;
    }

    memcpy(mem, buf->bytes, (size_t)buf->size);
    __builtin___clear_cache((char *)mem, (char *)mem + buf->size);
    if(mprotect(mem, alloc_size, PROT_READ | PROT_EXEC) != 0) {
        munmap(mem, alloc_size);
        return false;
    }

    *entry_out = mem;
    *mapped_size_out = alloc_size;
    return true;
}

static bool sqjit_a64_compile_integer_proto(SQFunctionProto *proto, SQObjectPtr *entry_stack,
    SQJitNative *native)
{
    if(!proto || !entry_stack || proto->_nparameters < 1 || proto->_varparams ||
        proto->_ndefaultparams != 0 || proto->_stacksize <= 0 ||
        proto->_stacksize > MAX_FUNC_STACKSIZE || proto->_ninstructions <= 0 ||
        proto->_ninstructions > 512 || proto->_bgenerator) {
        return false;
    }

    SQInteger ip_to_offset[513];
    SQJitA64Reloc relocs[512];
    SQJitA64Reloc guard_relocs[MAX_FUNC_STACKSIZE + 512];
    SQInteger nrelocs = 0;
    SQInteger nguard_relocs = 0;
    SQJitA64SlotKind slot_kind[MAX_FUNC_STACKSIZE];
    SQInteger stack_object_reg[MAX_FUNC_STACKSIZE];
    bool known_const[MAX_FUNC_STACKSIZE];
    SQInteger const_value[MAX_FUNC_STACKSIZE];

    for(SQInteger n = 0; n < 513; n++) {
        ip_to_offset[n] = -1;
    }
    for(SQInteger n = 0; n < MAX_FUNC_STACKSIZE; n++) {
        slot_kind[n] = SQ_JIT_A64_SLOT_UNKNOWN;
        stack_object_reg[n] = -1;
        known_const[n] = false;
        const_value[n] = 0;
    }
    for(SQInteger n = 1; n < proto->_nparameters; n++) {
        slot_kind[n] = SQ_JIT_A64_SLOT_STACK_OBJECT;
        stack_object_reg[n] = n;
    }

    SQInteger frame_size = proto->_stacksize * (SQInteger)sizeof(SQInteger);
    frame_size = (frame_size + 15) & ~(SQInteger)15;
    if(frame_size <= 0 || frame_size > 4095) {
        return false;
    }

    SQJitA64Buffer buf;
    buf.size = 0;
    if(!sqjit_a64_emit_prologue(&buf, frame_size)) {
        return false;
    }

    auto ensure_int_slot = [&](SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slot_kind[slot] == SQ_JIT_A64_SLOT_INT || slot_kind[slot] == SQ_JIT_A64_SLOT_BOOL) {
            return true;
        }
        if(slot_kind[slot] != SQ_JIT_A64_SLOT_STACK_OBJECT || stack_object_reg[slot] < 0) {
            return false;
        }
        if(!sqjit_a64_emit_type_guard(&buf, stack_object_reg[slot], OT_INTEGER,
            guard_relocs, &nguard_relocs) ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 19, sqjit_a64_stack_value_disp(stack_object_reg[slot])) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(slot))) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_A64_SLOT_INT;
        stack_object_reg[slot] = -1;
        known_const[slot] = false;
        return true;
    };

    auto ensure_float_slot = [&](SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slot_kind[slot] == SQ_JIT_A64_SLOT_FLOAT) {
            return true;
        }
        if(slot_kind[slot] != SQ_JIT_A64_SLOT_STACK_OBJECT || stack_object_reg[slot] < 0) {
            return false;
        }
        if(!sqjit_a64_emit_type_guard(&buf, stack_object_reg[slot], OT_FLOAT,
            guard_relocs, &nguard_relocs) ||
            !sqjit_a64_emit_ldr_s(&buf, 0, 19, sqjit_a64_stack_value_disp(stack_object_reg[slot])) ||
            !sqjit_a64_emit_str_s(&buf, 0, 31, sqjit_a64_local_disp(slot))) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_A64_SLOT_FLOAT;
        stack_object_reg[slot] = -1;
        known_const[slot] = false;
        return true;
    };

    auto mark_int_slot = [&](SQInteger slot) -> bool {
        if(slot == 0xFF) {
            return true;
        }
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_A64_SLOT_INT;
        stack_object_reg[slot] = -1;
        known_const[slot] = false;
        return true;
    };

    auto mark_bool_slot = [&](SQInteger slot) -> bool {
        if(slot == 0xFF) {
            return true;
        }
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_A64_SLOT_BOOL;
        stack_object_reg[slot] = -1;
        known_const[slot] = false;
        return true;
    };

    auto mark_float_slot = [&](SQInteger slot) -> bool {
        if(slot == 0xFF) {
            return true;
        }
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_A64_SLOT_FLOAT;
        stack_object_reg[slot] = -1;
        known_const[slot] = false;
        return true;
    };

    auto emit_load_int = [&](SQInteger dst, SQInteger value) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        return sqjit_a64_emit_mov_imm_x(&buf, 9, value) &&
            sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) &&
            mark_int_slot(dst) &&
            (known_const[dst] = true, const_value[dst] = value, true);
    };

    auto emit_load_float = [&](SQInteger dst, SQFloat value) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        SQInt32 bits = 0;
        memcpy(&bits, &value, sizeof(bits));
        return sqjit_a64_emit_mov_imm_w(&buf, 9, (uint32_t)bits) &&
            sqjit_a64_emit_str_w(&buf, 9, 31, sqjit_a64_local_disp(dst)) &&
            mark_float_slot(dst);
    };

    auto emit_binary = [&](SQOpcode op, SQInteger dst, SQInteger left, SQInteger right) -> bool {
        SQInteger guard_patch = 0;
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || !ensure_int_slot(left) || !ensure_int_slot(right) ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(left)) ||
            !sqjit_a64_emit_ldr_x(&buf, 10, 31, sqjit_a64_local_disp(right))) {
            return false;
        }
        switch(op) {
            case _OP_ADD:
                if(!sqjit_a64_emit_add_reg(&buf, 9, 9, 10)) {
                    return false;
                }
                break;
            case _OP_SUB:
                if(!sqjit_a64_emit_sub_reg(&buf, 9, 9, 10)) {
                    return false;
                }
                break;
            case _OP_MUL:
                if(!sqjit_a64_emit_mul_reg(&buf, 9, 9, 10)) {
                    return false;
                }
                break;
            case _OP_DIV:
                if(!sqjit_a64_emit_cmp_imm(&buf, 10, 0) ||
                    !sqjit_a64_emit_bcond_placeholder(&buf, SQ_JIT_A64_EQ, &guard_patch) ||
                    !sqjit_a64_record_reloc(guard_relocs, &nguard_relocs, MAX_FUNC_STACKSIZE + 512,
                        guard_patch, -1, true, SQ_JIT_A64_EQ) ||
                    !sqjit_a64_emit_sdiv_reg(&buf, 9, 9, 10)) {
                    return false;
                }
                break;
            case _OP_MOD:
                if(!sqjit_a64_emit_cmp_imm(&buf, 10, 0) ||
                    !sqjit_a64_emit_bcond_placeholder(&buf, SQ_JIT_A64_EQ, &guard_patch) ||
                    !sqjit_a64_record_reloc(guard_relocs, &nguard_relocs, MAX_FUNC_STACKSIZE + 512,
                        guard_patch, -1, true, SQ_JIT_A64_EQ) ||
                    !sqjit_a64_emit_sdiv_reg(&buf, 11, 9, 10) ||
                    !sqjit_a64_emit_msub_reg(&buf, 9, 11, 10, 9)) {
                    return false;
                }
                break;
            default:
                return false;
        }
        return sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) && mark_int_slot(dst);
    };

    auto emit_float_binary = [&](SQOpcode op, SQInteger dst, SQInteger left, SQInteger right) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || !ensure_float_slot(left) ||
            !ensure_float_slot(right) ||
            !sqjit_a64_emit_ldr_s(&buf, 0, 31, sqjit_a64_local_disp(left)) ||
            !sqjit_a64_emit_ldr_s(&buf, 1, 31, sqjit_a64_local_disp(right)) ||
            !sqjit_a64_emit_fop_s(&buf, op, 0, 0, 1) ||
            !sqjit_a64_emit_str_s(&buf, 0, 31, sqjit_a64_local_disp(dst)) ||
            !mark_float_slot(dst)) {
            return false;
        }
        return true;
    };

    auto emit_guard_on_x0_zero = [&]() -> bool {
        SQInteger patch_offset = 0;
        return sqjit_a64_emit_cmp_imm(&buf, 0, 0) &&
            sqjit_a64_emit_bcond_placeholder(&buf, SQ_JIT_A64_EQ, &patch_offset) &&
            sqjit_a64_record_reloc(guard_relocs, &nguard_relocs, MAX_FUNC_STACKSIZE + 512,
                patch_offset, -1, true, SQ_JIT_A64_EQ);
    };

    auto emit_array_get = [&](SQInteger dst, SQInteger base, SQInteger index, SQObjectType observed) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            index < 0 || slot_kind[base] != SQ_JIT_A64_SLOT_STACK_OBJECT ||
            stack_object_reg[base] < 0) {
            return false;
        }
        const void *helper = NULL;
        if(observed == OT_FLOAT) {
            helper = (const void *)sqjit_a64_helper_array_get_float;
        }
        else if(observed == OT_INTEGER) {
            helper = (const void *)sqjit_a64_helper_array_get_integer;
        }
        else {
            return false;
        }
        if(!sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 1, stack_object_reg[base]) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 2, index) ||
            !sqjit_a64_emit_add_imm(&buf, 3, 31, sqjit_a64_local_disp(dst)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)helper) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        if(observed == OT_FLOAT) {
            return mark_float_slot(dst);
        }
        return mark_int_slot(dst);
    };

    auto emit_array_get_dynamic = [&](SQInteger dst, SQInteger base, SQInteger key,
        SQObjectType observed) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE ||
            slot_kind[base] != SQ_JIT_A64_SLOT_STACK_OBJECT || stack_object_reg[base] < 0 ||
            !ensure_int_slot(key)) {
            return false;
        }
        const void *helper = observed == OT_FLOAT ?
            (const void *)sqjit_a64_helper_array_get_float :
            (const void *)sqjit_a64_helper_array_get_integer;
        if(observed != OT_FLOAT && observed != OT_INTEGER) {
            return false;
        }
        if(!sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 1, stack_object_reg[base]) ||
            !sqjit_a64_emit_ldr_x(&buf, 2, 31, sqjit_a64_local_disp(key)) ||
            !sqjit_a64_emit_add_imm(&buf, 3, 31, sqjit_a64_local_disp(dst)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)helper) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        if(observed == OT_FLOAT) {
            return mark_float_slot(dst);
        }
        return mark_int_slot(dst);
    };

    auto emit_table_get = [&](SQInteger dst, SQInteger base, SQInteger literal_index,
        SQObjectType observed) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals ||
            slot_kind[base] != SQ_JIT_A64_SLOT_STACK_OBJECT || stack_object_reg[base] < 0) {
            return false;
        }
        const void *helper = NULL;
        if(observed == OT_FLOAT) {
            helper = (const void *)sqjit_a64_helper_table_get_float;
        }
        else if(observed == OT_INTEGER) {
            helper = (const void *)sqjit_a64_helper_table_get_integer;
        }
        else {
            return false;
        }
        if(!sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 1, stack_object_reg[base]) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 2, (SQInteger)(intptr_t)&proto->_literals[literal_index]) ||
            !sqjit_a64_emit_add_imm(&buf, 3, 31, sqjit_a64_local_disp(dst)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)helper) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        if(observed == OT_FLOAT) {
            return mark_float_slot(dst);
        }
        return mark_int_slot(dst);
    };

    for(SQInteger ip = 0; ip < proto->_ninstructions; ip++) {
        ip_to_offset[ip] = buf.size;
        const SQInstruction &inst = proto->_instructions[ip];
        switch(inst.op) {
            case _OP_LINE:
                break;
            case _OP_LOADINT:
                if(!emit_load_int(inst._arg0, sqjit_loadint_value(inst))) {
                    return false;
                }
                break;
            case _OP_LOADFLOAT: {
                SQFloat value;
                if(!sqjit_loadfloat_value(inst, &value) || !emit_load_float(inst._arg0, value)) {
                    return sqjit_a64_reject(proto, ip, "unsupported LOADFLOAT");
                }
                break;
            }
            case _OP_LOAD:
                if(inst._arg1 < 0 || inst._arg1 >= proto->_nliterals) {
                    return sqjit_a64_reject(proto, ip, "unsupported LOAD literal");
                }
                if(sq_type(proto->_literals[inst._arg1]) == OT_INTEGER) {
                    if(!emit_load_int(inst._arg0, _integer(proto->_literals[inst._arg1]))) {
                        return false;
                    }
                }
                else if(sq_type(proto->_literals[inst._arg1]) == OT_FLOAT) {
                    if(!emit_load_float(inst._arg0, _float(proto->_literals[inst._arg1]))) {
                        return false;
                    }
                }
                else {
                    return sqjit_a64_reject(proto, ip, "unsupported LOAD literal");
                }
                break;
            case _OP_DLOAD:
                if(inst._arg1 < 0 || inst._arg1 >= proto->_nliterals ||
                    inst._arg3 < 0 || inst._arg3 >= proto->_nliterals) {
                    return sqjit_a64_reject(proto, ip, "unsupported DLOAD literal");
                }
                if(sq_type(proto->_literals[inst._arg1]) == OT_INTEGER) {
                    if(!emit_load_int(inst._arg0, _integer(proto->_literals[inst._arg1]))) {
                        return false;
                    }
                }
                else if(sq_type(proto->_literals[inst._arg1]) == OT_FLOAT) {
                    if(!emit_load_float(inst._arg0, _float(proto->_literals[inst._arg1]))) {
                        return false;
                    }
                }
                else {
                    return sqjit_a64_reject(proto, ip, "unsupported DLOAD literal");
                }
                if(sq_type(proto->_literals[inst._arg3]) == OT_INTEGER) {
                    if(!emit_load_int(inst._arg2, _integer(proto->_literals[inst._arg3]))) {
                        return false;
                    }
                }
                else if(sq_type(proto->_literals[inst._arg3]) == OT_FLOAT) {
                    if(!emit_load_float(inst._arg2, _float(proto->_literals[inst._arg3]))) {
                        return false;
                    }
                }
                else {
                    return sqjit_a64_reject(proto, ip, "unsupported DLOAD literal");
                }
                break;
            case _OP_LOADBOOL:
                if(!emit_load_int(inst._arg0, inst._arg1 ? 1 : 0) || !mark_bool_slot(inst._arg0)) {
                    return false;
                }
                break;
            case _OP_MOVE:
                if(inst._arg0 < 0 || inst._arg0 >= MAX_FUNC_STACKSIZE ||
                    (slot_kind[inst._arg1] == SQ_JIT_A64_SLOT_FLOAT ?
                        !ensure_float_slot(inst._arg1) : !ensure_int_slot(inst._arg1)) ||
                    !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg1)) ||
                    !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg0))) {
                    return false;
                }
                slot_kind[inst._arg0] = slot_kind[inst._arg1] == SQ_JIT_A64_SLOT_BOOL ?
                    SQ_JIT_A64_SLOT_BOOL : SQ_JIT_A64_SLOT_INT;
                if(slot_kind[inst._arg1] == SQ_JIT_A64_SLOT_FLOAT) {
                    slot_kind[inst._arg0] = SQ_JIT_A64_SLOT_FLOAT;
                }
                stack_object_reg[inst._arg0] = -1;
                known_const[inst._arg0] = known_const[inst._arg1];
                const_value[inst._arg0] = const_value[inst._arg1];
                break;
            case _OP_DMOVE:
                if(inst._arg0 < 0 || inst._arg0 >= MAX_FUNC_STACKSIZE ||
                    inst._arg2 < 0 || inst._arg2 >= MAX_FUNC_STACKSIZE ||
                    (slot_kind[inst._arg1] == SQ_JIT_A64_SLOT_FLOAT ?
                        !ensure_float_slot(inst._arg1) : !ensure_int_slot(inst._arg1)) ||
                    (slot_kind[inst._arg3] == SQ_JIT_A64_SLOT_FLOAT ?
                        !ensure_float_slot(inst._arg3) : !ensure_int_slot(inst._arg3)) ||
                    !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg1)) ||
                    !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg0)) ||
                    !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg3)) ||
                    !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg2))) {
                    return false;
                }
                slot_kind[inst._arg0] = slot_kind[inst._arg1];
                slot_kind[inst._arg2] = slot_kind[inst._arg3];
                stack_object_reg[inst._arg0] = -1;
                stack_object_reg[inst._arg2] = -1;
                known_const[inst._arg0] = known_const[inst._arg1];
                known_const[inst._arg2] = known_const[inst._arg3];
                const_value[inst._arg0] = const_value[inst._arg1];
                const_value[inst._arg2] = const_value[inst._arg3];
                break;
            case _OP_GETK: {
                if(inst._arg1 < 0 || inst._arg1 >= proto->_nliterals) {
                    return sqjit_a64_reject(proto, ip, "unsupported GETK key");
                }
                if(sq_type(proto->_literals[inst._arg1]) == OT_INTEGER) {
                    SQInteger index = _integer(proto->_literals[inst._arg1]);
                    SQInteger observed_reg = (inst._arg2 >= 0 && inst._arg2 < MAX_FUNC_STACKSIZE) ?
                        stack_object_reg[inst._arg2] : -1;
                    SQObjectType observed = sqjit_a64_observed_array_value_type(entry_stack,
                        observed_reg, index);
                    if(!emit_array_get(inst._arg0, inst._arg2, index, observed)) {
                        return sqjit_a64_reject(proto, ip, "unsupported GETK array read");
                    }
                }
                else {
                    SQInteger observed_reg = (inst._arg2 >= 0 && inst._arg2 < MAX_FUNC_STACKSIZE) ?
                        stack_object_reg[inst._arg2] : -1;
                    SQObjectType observed = sqjit_a64_observed_table_value_type(entry_stack,
                        observed_reg, &proto->_literals[inst._arg1]);
                    if(!emit_table_get(inst._arg0, inst._arg2, inst._arg1, observed)) {
                        return sqjit_a64_reject(proto, ip, "unsupported GETK table read");
                    }
                }
                break;
            }
            case _OP_GET: {
                if(known_const[inst._arg2]) {
                    SQInteger observed_reg = (inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE) ?
                        stack_object_reg[inst._arg1] : -1;
                    SQObjectType observed = sqjit_a64_observed_array_value_type(entry_stack,
                        observed_reg, const_value[inst._arg2]);
                    if(!emit_array_get(inst._arg0, inst._arg1, const_value[inst._arg2], observed)) {
                        return sqjit_a64_reject(proto, ip, "unsupported const GET array read");
                    }
                }
                else {
                    SQInteger observed_reg = (inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE) ?
                        stack_object_reg[inst._arg1] : -1;
                    SQObjectType observed = sqjit_a64_observed_array_value_type(entry_stack,
                        observed_reg, 0);
                    if(!emit_array_get_dynamic(inst._arg0, inst._arg1, inst._arg2, observed)) {
                        return sqjit_a64_reject(proto, ip, "unsupported dynamic GET array read");
                    }
                }
                break;
            }
            case _OP_ADD:
            case _OP_SUB:
            case _OP_MUL:
            case _OP_DIV:
            case _OP_MOD:
                if(slot_kind[inst._arg1] == SQ_JIT_A64_SLOT_FLOAT ||
                    slot_kind[inst._arg2] == SQ_JIT_A64_SLOT_FLOAT) {
                    if(inst.op == _OP_MOD ||
                        !emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                        return false;
                    }
                }
                else if(!emit_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                    return false;
                }
                break;
            case _OP_INCL: {
                SQInteger delta = sqjit_signed_arg3(inst);
                if(!ensure_int_slot(inst._arg1) ||
                    !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg1))) {
                    return false;
                }
                if(delta >= 0) {
                    if(!sqjit_a64_emit_add_imm(&buf, 9, 9, delta)) {
                        return false;
                    }
                }
                else if(!sqjit_a64_emit_sub_imm(&buf, 9, 9, -delta)) {
                    return false;
                }
                if(!sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg1)) ||
                    !mark_int_slot(inst._arg1)) {
                    return false;
                }
                break;
            }
            case _OP_PINCL: {
                SQInteger delta = sqjit_signed_arg3(inst);
                if(!ensure_int_slot(inst._arg1) ||
                    !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg1))) {
                    return false;
                }
                if(inst._arg0 != 0xFF) {
                    if(!sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg0)) ||
                        !mark_int_slot(inst._arg0)) {
                        return false;
                    }
                }
                if(delta >= 0) {
                    if(!sqjit_a64_emit_add_imm(&buf, 9, 9, delta)) {
                        return false;
                    }
                }
                else if(!sqjit_a64_emit_sub_imm(&buf, 9, 9, -delta)) {
                    return false;
                }
                if(!sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg1)) ||
                    !mark_int_slot(inst._arg1)) {
                    return false;
                }
                break;
            }
            case _OP_EQ:
            case _OP_NE: {
                if(!ensure_int_slot(inst._arg2) ||
                    !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg2))) {
                    return false;
                }
                if(inst._arg3 != 0) {
                    if(inst._arg1 < 0 || inst._arg1 >= proto->_nliterals ||
                        sq_type(proto->_literals[inst._arg1]) != OT_INTEGER ||
                        !sqjit_a64_emit_mov_imm_x(&buf, 10, _integer(proto->_literals[inst._arg1]))) {
                        return false;
                    }
                }
                else if(!ensure_int_slot(inst._arg1) ||
                    !sqjit_a64_emit_ldr_x(&buf, 10, 31, sqjit_a64_local_disp(inst._arg1))) {
                    return false;
                }
                if(!sqjit_a64_emit_cmp_reg(&buf, 9, 10) ||
                    !sqjit_a64_emit_cset(&buf, 9, inst.op == _OP_NE ? SQ_JIT_A64_NE : SQ_JIT_A64_EQ) ||
                    !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg0)) ||
                    !mark_bool_slot(inst._arg0)) {
                    return false;
                }
                break;
            }
            case _OP_JMP: {
                SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
                SQInteger patch_offset = 0;
                if(target_ip < 0 || target_ip >= proto->_ninstructions ||
                    !sqjit_a64_emit_b_placeholder(&buf, &patch_offset) ||
                    !sqjit_a64_record_reloc(relocs, &nrelocs, 512, patch_offset,
                        target_ip, false, 0)) {
                    return sqjit_a64_reject(proto, ip, "unsupported JMP target");
                }
                break;
            }
            case _OP_JZ: {
                SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
                SQInteger patch_offset = 0;
                if(target_ip < 0 || target_ip >= proto->_ninstructions ||
                    !ensure_int_slot(inst._arg0) ||
                    !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg0)) ||
                    !sqjit_a64_emit_cmp_imm(&buf, 9, 0) ||
                    !sqjit_a64_emit_bcond_placeholder(&buf, SQ_JIT_A64_EQ, &patch_offset) ||
                    !sqjit_a64_record_reloc(relocs, &nrelocs, 512, patch_offset,
                        target_ip, true, SQ_JIT_A64_EQ)) {
                    return sqjit_a64_reject(proto, ip, "unsupported JZ target or operand");
                }
                break;
            }
            case _OP_JCMP: {
                SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
                SQInteger patch_offset = 0;
                unsigned false_cond = 0;
                switch((CmpOP)inst._arg3) {
                    case CMP_G: false_cond = SQ_JIT_A64_LE; break;
                    case CMP_GE: false_cond = SQ_JIT_A64_LT; break;
                    case CMP_L: false_cond = SQ_JIT_A64_GE; break;
                    case CMP_LE: false_cond = SQ_JIT_A64_GT; break;
                    default: return false;
                }
                if(target_ip < 0 || target_ip >= proto->_ninstructions ||
                    false_cond == 0) {
                    return false;
                }
                if(slot_kind[inst._arg2] == SQ_JIT_A64_SLOT_FLOAT ||
                    slot_kind[inst._arg0] == SQ_JIT_A64_SLOT_FLOAT) {
                    if(!ensure_float_slot(inst._arg2) || !ensure_float_slot(inst._arg0) ||
                        !sqjit_a64_emit_ldr_s(&buf, 0, 31, sqjit_a64_local_disp(inst._arg2)) ||
                        !sqjit_a64_emit_ldr_s(&buf, 1, 31, sqjit_a64_local_disp(inst._arg0)) ||
                        !sqjit_a64_emit_fcmp_s(&buf, 0, 1) ||
                        !sqjit_a64_emit_bcond_placeholder(&buf, false_cond, &patch_offset) ||
                        !sqjit_a64_record_reloc(relocs, &nrelocs, 512, patch_offset,
                            target_ip, true, false_cond)) {
                        return false;
                    }
                }
                else if(!ensure_int_slot(inst._arg2) || !ensure_int_slot(inst._arg0) ||
                    !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg2)) ||
                    !sqjit_a64_emit_ldr_x(&buf, 10, 31, sqjit_a64_local_disp(inst._arg0)) ||
                    !sqjit_a64_emit_cmp_reg(&buf, 9, 10) ||
                    !sqjit_a64_emit_bcond_placeholder(&buf, false_cond, &patch_offset) ||
                    !sqjit_a64_record_reloc(relocs, &nrelocs, 512, patch_offset,
                        target_ip, true, false_cond)) {
                    return false;
                }
                break;
            }
            case _OP_RETURN:
                if(inst._arg0 == 0xFF) {
                    if(!sqjit_a64_emit_mov_imm_w(&buf, 9, (uint32_t)OT_NULL) ||
                        !sqjit_a64_emit_str_w(&buf, 9, 20, (SQInteger)offsetof(SQObject, _type)) ||
                        !sqjit_a64_emit_mov_imm_x(&buf, 10, 0) ||
                        !sqjit_a64_emit_str_x(&buf, 10, 20, (SQInteger)offsetof(SQObject, _unVal)) ||
                        !sqjit_a64_emit_epilogue(&buf, frame_size, SQ_JIT_NATIVE_RETURNED)) {
                        return sqjit_a64_reject(proto, ip, "unsupported null RETURN");
                    }
                    break;
                }
                if((slot_kind[inst._arg1] == SQ_JIT_A64_SLOT_FLOAT ?
                    !ensure_float_slot(inst._arg1) : !ensure_int_slot(inst._arg1)) ||
                    !sqjit_a64_emit_store_out_scalar(&buf,
                        slot_kind[inst._arg1] == SQ_JIT_A64_SLOT_FLOAT ? OT_FLOAT : OT_INTEGER,
                        inst._arg1, slot_kind[inst._arg1]) ||
                    !sqjit_a64_emit_epilogue(&buf, frame_size, SQ_JIT_NATIVE_RETURNED)) {
                    return sqjit_a64_reject(proto, ip, "unsupported RETURN value");
                }
                break;
            default:
                return sqjit_a64_reject(proto, ip, "unsupported opcode");
        }
    }

    SQInteger guard_fail_offset = buf.size;
    if(!sqjit_a64_emit_epilogue(&buf, frame_size, SQ_JIT_NATIVE_GUARD_FAILED)) {
        return false;
    }

    for(SQInteger n = 0; n < nrelocs; n++) {
        SQInteger target_offset = ip_to_offset[relocs[n].target_ip];
        if(target_offset < 0 ||
            !sqjit_a64_patch_branch(&buf, relocs[n].patch_offset, target_offset,
                relocs[n].conditional, relocs[n].cond)) {
            return false;
        }
    }
    for(SQInteger n = 0; n < nguard_relocs; n++) {
        if(!sqjit_a64_patch_branch(&buf, guard_relocs[n].patch_offset, guard_fail_offset,
            true, guard_relocs[n].cond)) {
            return false;
        }
    }

    return sqjit_a64_install_raw(&native->_native_entry, &native->_native_size, &buf);
}

void sqjit_backend_native_free(void *entry, SQInteger size)
{
    if(entry && size > 0) {
        munmap(entry, size);
    }
}

bool sqjit_backend_compile_proto(SQFunctionProto *proto, SQObjectPtr *entry_stack,
    SQClosure *SQ_UNUSED_ARG(closure), SQJitNative *native)
{
    return sqjit_a64_compile_integer_proto(proto, entry_stack, native);
}

static bool sqjit_a64_cmp_false_cond(CmpOP op, unsigned *cond)
{
    if(!cond) {
        return false;
    }
    switch(op) {
        case CMP_G: *cond = SQ_JIT_A64_LE; return true;
        case CMP_GE: *cond = SQ_JIT_A64_LT; return true;
        case CMP_L: *cond = SQ_JIT_A64_GE; return true;
        case CMP_LE: *cond = SQ_JIT_A64_GT; return true;
        default: return false;
    }
}

static bool sqjit_a64_loop_instruction_reads_slot(const SQInstruction &inst, SQInteger slot)
{
    switch(inst.op) {
        case _OP_MOVE:
            return inst._arg1 == slot;
        case _OP_ADD:
        case _OP_SUB:
        case _OP_MUL:
        case _OP_DIV:
        case _OP_MOD:
            return inst._arg1 == slot || inst._arg2 == slot;
        case _OP_PINCL:
        case _OP_INCL:
            return inst._arg1 == slot;
        case _OP_JCMP:
        case _OP_CMP:
            return inst._arg0 == slot || inst._arg2 == slot;
        case _OP_JZ:
            return inst._arg0 == slot;
        case _OP_EQ:
        case _OP_NE:
            return inst._arg2 == slot || (inst._arg3 == 0 && inst._arg1 == slot);
        case _OP_GET:
        case _OP_SET:
            return inst._arg1 == slot || inst._arg2 == slot || inst._arg3 == slot;
        case _OP_GETK:
            return inst._arg2 == slot;
        case _OP_PREPCALL:
            return inst._arg1 == slot || inst._arg2 == slot;
        case _OP_PREPCALLK:
            return inst._arg2 == slot;
        case _OP_CALL:
            if(inst._arg1 == slot) {
                return true;
            }
            for(SQInteger n = 0; n < inst._arg3; n++) {
                if(inst._arg2 + n == slot) {
                    return true;
                }
            }
            return false;
        case _OP_RETURN:
            return inst._arg0 != 0xFF && inst._arg1 == slot;
        default:
            return false;
    }
}

static bool sqjit_a64_loop_instruction_reads_int_slot(const SQInstruction &inst, SQInteger slot)
{
    switch(inst.op) {
        case _OP_MOVE:
            return inst._arg1 == slot;
        case _OP_ADD:
        case _OP_SUB:
        case _OP_MUL:
        case _OP_DIV:
        case _OP_MOD:
            return inst._arg1 == slot || inst._arg2 == slot;
        case _OP_PINCL:
        case _OP_INCL:
            return inst._arg1 == slot;
        case _OP_JCMP:
        case _OP_CMP:
            return inst._arg0 == slot || inst._arg2 == slot;
        case _OP_JZ:
            return inst._arg0 == slot;
        case _OP_EQ:
        case _OP_NE:
            return inst._arg2 == slot || (inst._arg3 == 0 && inst._arg1 == slot);
        case _OP_GET:
            return inst._arg2 == slot;
        case _OP_SET:
            return inst._arg3 == slot;
        case _OP_RETURN:
            return inst._arg0 != 0xFF && inst._arg1 == slot;
        default:
            return false;
    }
}

static bool sqjit_a64_loop_instruction_writes_slot(const SQInstruction &inst, SQInteger slot)
{
    switch(inst.op) {
        case _OP_LOAD:
        case _OP_LOADINT:
        case _OP_LOADFLOAT:
        case _OP_LOADBOOL:
        case _OP_GETOUTER:
        case _OP_MOVE:
        case _OP_ADD:
        case _OP_SUB:
        case _OP_MUL:
        case _OP_DIV:
        case _OP_MOD:
        case _OP_EQ:
        case _OP_NE:
        case _OP_GET:
        case _OP_GETK:
        case _OP_CMP:
            return inst._arg0 == slot;
        case _OP_PREPCALL:
        case _OP_PREPCALLK:
            return inst._arg0 == slot || inst._arg3 == slot;
        case _OP_CALL:
            return inst._arg0 != 0xFF && inst._arg0 == slot;
        case _OP_DLOAD:
        case _OP_DMOVE:
            return inst._arg0 == slot || inst._arg2 == slot;
        case _OP_SET:
        case _OP_NEWSLOT:
            return inst._arg0 != 0xFF && inst._arg0 == slot;
        case _OP_PINCL:
            return inst._arg1 == slot || (inst._arg0 != 0xFF && inst._arg0 == slot);
        case _OP_INCL:
            return inst._arg1 == slot;
        default:
            return false;
    }
}

static bool sqjit_a64_loop_slot_is_live_out(SQFunctionProto *proto, SQInteger exit_ip, SQInteger slot)
{
    if(!proto || exit_ip < 0 || exit_ip > proto->_ninstructions) {
        return false;
    }

    for(SQInteger ip = exit_ip; ip < proto->_ninstructions; ip++) {
        const SQInstruction &inst = proto->_instructions[ip];
        if(sqjit_a64_loop_instruction_reads_slot(inst, slot)) {
            return true;
        }
        if(sqjit_a64_loop_instruction_writes_slot(inst, slot)) {
            return false;
        }
    }

    return false;
}

bool sqjit_backend_loop_find_region(SQFunctionProto *proto, SQInteger header_ip,
    SQInteger *start_ip, SQInteger *end_ip, SQInteger *exit_ip)
{
    if(!proto || header_ip < 0 || header_ip >= proto->_ninstructions) {
        return false;
    }

    const SQInstruction &header = proto->_instructions[header_ip];
    if(header.op != _OP_JCMP && header.op != _OP_JZ) {
        return false;
    }

    SQInteger candidate_exit = header_ip + 1 + sqjit_signed_arg1(header);
    if(candidate_exit <= header_ip || candidate_exit > proto->_ninstructions ||
        candidate_exit - header_ip > 512) {
        return false;
    }

    for(SQInteger ip = header_ip + 1; ip < candidate_exit; ip++) {
        const SQInstruction &inst = proto->_instructions[ip];
        SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
        if(inst.op == _OP_JMP && target_ip >= 0 && target_ip <= header_ip) {
            *start_ip = target_ip;
            *end_ip = ip;
            *exit_ip = candidate_exit;
            return true;
        }
    }

    return false;
}

bool sqjit_backend_compile_loop(SQFunctionProto *proto, SQObjectPtr *entry_stack,
    SQClosure *SQ_UNUSED_ARG(closure), SQInteger start_ip, SQInteger header_ip,
    SQInteger end_ip, SQInteger exit_ip, SQJitProto *jit)
{
    if(!proto || !entry_stack || !jit || start_ip < 0 || header_ip < start_ip ||
        end_ip < header_ip || exit_ip <= header_ip || exit_ip > proto->_ninstructions ||
        proto->_stacksize <= 0 || proto->_stacksize > MAX_FUNC_STACKSIZE ||
        proto->_ninstructions > 512 || end_ip - start_ip > 512) {
        return false;
    }

    SQInteger ip_to_offset[513];
    SQJitA64Reloc relocs[512];
    SQJitA64Reloc exit_relocs[128];
    SQJitA64Reloc guard_relocs[MAX_FUNC_STACKSIZE + 512];
    SQInteger nrelocs = 0;
    SQInteger nexit_relocs = 0;
    SQInteger nguard_relocs = 0;
    SQJitA64SlotKind slot_kind[MAX_FUNC_STACKSIZE];
    SQInteger stack_object_reg[MAX_FUNC_STACKSIZE];
    bool known_const[MAX_FUNC_STACKSIZE];
    bool entry_loaded[MAX_FUNC_STACKSIZE];
    bool dirty_slot[MAX_FUNC_STACKSIZE];
    SQInteger const_value[MAX_FUNC_STACKSIZE];

    for(SQInteger n = 0; n < 513; n++) {
        ip_to_offset[n] = -1;
    }
    for(SQInteger n = 0; n < MAX_FUNC_STACKSIZE; n++) {
        slot_kind[n] = SQ_JIT_A64_SLOT_STACK_OBJECT;
        stack_object_reg[n] = n;
        known_const[n] = false;
        entry_loaded[n] = false;
        dirty_slot[n] = false;
        const_value[n] = 0;
    }

    SQInteger frame_size = proto->_stacksize * (SQInteger)sizeof(SQInteger);
    frame_size = (frame_size + 15) & ~(SQInteger)15;
    if(frame_size <= 0 || frame_size > 4095) {
        return false;
    }

    SQJitA64Buffer buf;
    buf.size = 0;
    if(!sqjit_a64_emit_prologue(&buf, frame_size)) {
        return false;
    }

    auto emit_guard_fail_branch = [&](unsigned cond) -> bool {
        SQInteger patch_offset = 0;
        return sqjit_a64_emit_bcond_placeholder(&buf, cond, &patch_offset) &&
            sqjit_a64_record_reloc(guard_relocs, &nguard_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1, true, cond);
    };

    auto ensure_int_slot = [&](SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slot_kind[slot] == SQ_JIT_A64_SLOT_INT || slot_kind[slot] == SQ_JIT_A64_SLOT_BOOL) {
            return true;
        }
        if(slot_kind[slot] != SQ_JIT_A64_SLOT_STACK_OBJECT || stack_object_reg[slot] < 0) {
            return false;
        }
        if(!sqjit_a64_emit_type_guard(&buf, stack_object_reg[slot], OT_INTEGER,
            guard_relocs, &nguard_relocs) ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 19, sqjit_a64_stack_value_disp(stack_object_reg[slot])) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(slot))) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_A64_SLOT_INT;
        stack_object_reg[slot] = -1;
        known_const[slot] = false;
        entry_loaded[slot] = true;
        return true;
    };

    auto ensure_float_slot = [&](SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE || sizeof(SQFloat) != sizeof(SQInt32)) {
            return false;
        }
        if(slot_kind[slot] == SQ_JIT_A64_SLOT_FLOAT) {
            return true;
        }
        if(slot_kind[slot] != SQ_JIT_A64_SLOT_STACK_OBJECT || stack_object_reg[slot] < 0) {
            return false;
        }
        if(!sqjit_a64_emit_type_guard(&buf, stack_object_reg[slot], OT_FLOAT,
            guard_relocs, &nguard_relocs) ||
            !sqjit_a64_emit_ldr_s(&buf, 0, 19, sqjit_a64_stack_value_disp(stack_object_reg[slot])) ||
            !sqjit_a64_emit_str_s(&buf, 0, 31, sqjit_a64_local_disp(slot))) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_A64_SLOT_FLOAT;
        stack_object_reg[slot] = -1;
        known_const[slot] = false;
        entry_loaded[slot] = true;
        return true;
    };

    auto mark_int_slot = [&](SQInteger slot) -> bool {
        if(slot == 0xFF) {
            return true;
        }
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_A64_SLOT_INT;
        stack_object_reg[slot] = -1;
        known_const[slot] = false;
        dirty_slot[slot] = true;
        return true;
    };

    auto mark_bool_slot = [&](SQInteger slot) -> bool {
        if(slot == 0xFF) {
            return true;
        }
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_A64_SLOT_BOOL;
        stack_object_reg[slot] = -1;
        known_const[slot] = false;
        dirty_slot[slot] = true;
        return true;
    };

    auto mark_float_slot = [&](SQInteger slot) -> bool {
        if(slot == 0xFF) {
            return true;
        }
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_A64_SLOT_FLOAT;
        stack_object_reg[slot] = -1;
        known_const[slot] = false;
        dirty_slot[slot] = true;
        return true;
    };

    auto emit_load_int = [&](SQInteger dst, SQInteger value) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            !sqjit_a64_emit_mov_imm_x(&buf, 9, value) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) ||
            !mark_int_slot(dst)) {
            return false;
        }
        known_const[dst] = true;
        const_value[dst] = value;
        entry_loaded[dst] = false;
        return true;
    };

    auto emit_load_float = [&](SQInteger dst, SQFloat value) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || sizeof(SQFloat) != sizeof(SQInt32)) {
            return false;
        }
        SQInt32 bits = 0;
        memcpy(&bits, &value, sizeof(bits));
        return sqjit_a64_emit_mov_imm_x(&buf, 9, 0) &&
            sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) &&
            sqjit_a64_emit_mov_imm_w(&buf, 9, (uint32_t)bits) &&
            sqjit_a64_emit_str_w(&buf, 9, 31, sqjit_a64_local_disp(dst)) &&
            mark_float_slot(dst) &&
            (entry_loaded[dst] = false, true);
    };

    auto load_literal_slot = [&](SQInteger dst, SQInteger literal_index) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals) {
            return false;
        }
        if(sq_type(proto->_literals[literal_index]) == OT_INTEGER) {
            return emit_load_int(dst, _integer(proto->_literals[literal_index]));
        }
        if(sq_type(proto->_literals[literal_index]) == OT_FLOAT) {
            return emit_load_float(dst, _float(proto->_literals[literal_index]));
        }
        return false;
    };

    auto copy_int_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == 0xFF) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || !ensure_int_slot(src) ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(src)) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) ||
            !mark_int_slot(dst)) {
            return false;
        }
        entry_loaded[dst] = entry_loaded[src];
        known_const[dst] = known_const[src];
        const_value[dst] = const_value[src];
        return true;
    };

    auto copy_float_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == 0xFF) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || !ensure_float_slot(src) ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(src)) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) ||
            !mark_float_slot(dst)) {
            return false;
        }
        entry_loaded[dst] = entry_loaded[src];
        return true;
    };

    auto slot_is_float = [&](SQInteger slot) -> bool {
        return slot >= 0 && slot < MAX_FUNC_STACKSIZE && slot_kind[slot] == SQ_JIT_A64_SLOT_FLOAT;
    };

    auto emit_binary = [&](SQOpcode op, SQInteger dst, SQInteger left, SQInteger right) -> bool {
        SQInteger guard_patch = 0;
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || !ensure_int_slot(left) || !ensure_int_slot(right) ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(left)) ||
            !sqjit_a64_emit_ldr_x(&buf, 10, 31, sqjit_a64_local_disp(right))) {
            return false;
        }
        switch(op) {
            case _OP_ADD:
                if(!sqjit_a64_emit_add_reg(&buf, 9, 9, 10)) {
                    return false;
                }
                break;
            case _OP_SUB:
                if(!sqjit_a64_emit_sub_reg(&buf, 9, 9, 10)) {
                    return false;
                }
                break;
            case _OP_MUL:
                if(!sqjit_a64_emit_mul_reg(&buf, 9, 9, 10)) {
                    return false;
                }
                break;
            case _OP_DIV:
                if(!sqjit_a64_emit_cmp_imm(&buf, 10, 0) ||
                    !sqjit_a64_emit_bcond_placeholder(&buf, SQ_JIT_A64_EQ, &guard_patch) ||
                    !sqjit_a64_record_reloc(guard_relocs, &nguard_relocs,
                        MAX_FUNC_STACKSIZE + 512, guard_patch, -1, true, SQ_JIT_A64_EQ) ||
                    !sqjit_a64_emit_sdiv_reg(&buf, 9, 9, 10)) {
                    return false;
                }
                break;
            case _OP_MOD:
                if(!sqjit_a64_emit_cmp_imm(&buf, 10, 0) ||
                    !sqjit_a64_emit_bcond_placeholder(&buf, SQ_JIT_A64_EQ, &guard_patch) ||
                    !sqjit_a64_record_reloc(guard_relocs, &nguard_relocs,
                        MAX_FUNC_STACKSIZE + 512, guard_patch, -1, true, SQ_JIT_A64_EQ) ||
                    !sqjit_a64_emit_sdiv_reg(&buf, 11, 9, 10) ||
                    !sqjit_a64_emit_msub_reg(&buf, 9, 11, 10, 9)) {
                    return false;
                }
                break;
            default:
                return false;
        }
        if(!sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) ||
            !mark_int_slot(dst)) {
            return false;
        }
        entry_loaded[dst] = entry_loaded[left] || entry_loaded[right];
        return true;
    };

    auto emit_guard_on_x0_zero = [&]() -> bool {
        return sqjit_a64_emit_cmp_imm(&buf, 0, 0) && emit_guard_fail_branch(SQ_JIT_A64_EQ);
    };

    auto emit_float_binary = [&](SQOpcode op, SQInteger dst, SQInteger left, SQInteger right) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || op == _OP_MOD ||
            !ensure_float_slot(left) || !ensure_float_slot(right) ||
            !sqjit_a64_emit_ldr_s(&buf, 0, 31, sqjit_a64_local_disp(left)) ||
            !sqjit_a64_emit_ldr_s(&buf, 1, 31, sqjit_a64_local_disp(right)) ||
            !sqjit_a64_emit_fop_s(&buf, op, 0, 0, 1) ||
            !sqjit_a64_emit_str_s(&buf, 0, 31, sqjit_a64_local_disp(dst)) ||
            !mark_float_slot(dst)) {
            return false;
        }
        entry_loaded[dst] = entry_loaded[left] || entry_loaded[right];
        return true;
    };

    auto emit_array_get_const = [&](SQInteger dst, SQInteger base, SQInteger index,
        SQObjectType observed) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            index < 0 || slot_kind[base] != SQ_JIT_A64_SLOT_STACK_OBJECT ||
            stack_object_reg[base] < 0) {
            return false;
        }
        const void *helper = NULL;
        if(observed == OT_FLOAT) {
            helper = (const void *)sqjit_a64_helper_array_get_float;
        }
        else if(observed == OT_INTEGER) {
            helper = (const void *)sqjit_a64_helper_array_get_integer;
        }
        else {
            return false;
        }
        if(!sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 1, stack_object_reg[base]) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 2, index) ||
            !sqjit_a64_emit_add_imm(&buf, 3, 31, sqjit_a64_local_disp(dst)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)helper) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        if(observed == OT_FLOAT) {
            if(!mark_float_slot(dst)) {
                return false;
            }
        }
        else if(!mark_int_slot(dst)) {
            return false;
        }
        entry_loaded[dst] = true;
        return true;
    };

    auto emit_array_get_dynamic = [&](SQInteger dst, SQInteger base, SQInteger key,
        SQObjectType observed) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE ||
            slot_kind[base] != SQ_JIT_A64_SLOT_STACK_OBJECT || stack_object_reg[base] < 0 ||
            !ensure_int_slot(key)) {
            return false;
        }
        const void *helper = NULL;
        if(observed == OT_FLOAT) {
            helper = (const void *)sqjit_a64_helper_array_get_float;
        }
        else if(observed == OT_INTEGER) {
            helper = (const void *)sqjit_a64_helper_array_get_integer;
        }
        else {
            return false;
        }
        if(!sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 1, stack_object_reg[base]) ||
            !sqjit_a64_emit_ldr_x(&buf, 2, 31, sqjit_a64_local_disp(key)) ||
            !sqjit_a64_emit_add_imm(&buf, 3, 31, sqjit_a64_local_disp(dst)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)helper) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        if(observed == OT_FLOAT) {
            if(!mark_float_slot(dst)) {
                return false;
            }
        }
        else if(!mark_int_slot(dst)) {
            return false;
        }
        entry_loaded[dst] = true;
        return true;
    };

    auto record_branch = [&](SQInteger patch_offset, SQInteger target_ip, bool conditional,
        unsigned cond) -> bool {
        if(target_ip == exit_ip) {
            return sqjit_a64_record_reloc(exit_relocs, &nexit_relocs, 128,
                patch_offset, target_ip, conditional, cond);
        }
        if(target_ip < start_ip || target_ip > end_ip) {
            return false;
        }
        return sqjit_a64_record_reloc(relocs, &nrelocs, 512,
            patch_offset, target_ip, conditional, cond);
    };

    bool defined_in_loop[MAX_FUNC_STACKSIZE];
    bool preload_slot[MAX_FUNC_STACKSIZE];
    for(SQInteger n = 0; n < MAX_FUNC_STACKSIZE; n++) {
        defined_in_loop[n] = false;
        preload_slot[n] = false;
    }
    for(SQInteger ip = start_ip; ip <= end_ip; ip++) {
        const SQInstruction &inst = proto->_instructions[ip];
        for(SQInteger slot = 0; slot < proto->_stacksize; slot++) {
            if(sqjit_a64_loop_instruction_reads_int_slot(inst, slot) && !defined_in_loop[slot]) {
                preload_slot[slot] = true;
            }
        }
        for(SQInteger slot = 0; slot < proto->_stacksize; slot++) {
            if(sqjit_a64_loop_instruction_writes_slot(inst, slot)) {
                defined_in_loop[slot] = true;
            }
        }
    }
    for(SQInteger slot = 0; slot < proto->_stacksize; slot++) {
        if(!preload_slot[slot]) {
            continue;
        }
        if(sq_type(entry_stack[slot]) == OT_FLOAT) {
            if(!ensure_float_slot(slot)) {
                return false;
            }
        }
        else if(sq_type(entry_stack[slot]) == OT_INTEGER) {
            if(!ensure_int_slot(slot)) {
                return false;
            }
        }
        else {
            return false;
        }
    }

    for(SQInteger ip = start_ip; ip <= end_ip; ip++) {
        ip_to_offset[ip] = buf.size;
        const SQInstruction &inst = proto->_instructions[ip];
        switch(inst.op) {
            case _OP_LINE:
                break;
            case _OP_LOADINT:
                if(!emit_load_int(inst._arg0, sqjit_loadint_value(inst))) {
                    return false;
                }
                break;
            case _OP_LOADFLOAT: {
                SQFloat value;
                if(!sqjit_loadfloat_value(inst, &value) || !emit_load_float(inst._arg0, value)) {
                    return sqjit_a64_reject(proto, ip, "unsupported loop LOADFLOAT");
                }
                break;
            }
            case _OP_LOAD:
                if(!load_literal_slot(inst._arg0, inst._arg1)) {
                    return sqjit_a64_reject(proto, ip, "unsupported loop LOAD");
                }
                break;
            case _OP_DLOAD:
                if(!load_literal_slot(inst._arg0, inst._arg1) ||
                    !load_literal_slot(inst._arg2, inst._arg3)) {
                    return sqjit_a64_reject(proto, ip, "unsupported loop DLOAD");
                }
                break;
            case _OP_LOADBOOL:
                if(!emit_load_int(inst._arg0, inst._arg1 ? 1 : 0) || !mark_bool_slot(inst._arg0)) {
                    return false;
                }
                entry_loaded[inst._arg0] = false;
                break;
            case _OP_MOVE:
                if(slot_is_float(inst._arg1)) {
                    if(!copy_float_slot(inst._arg0, inst._arg1)) {
                        return false;
                    }
                }
                else if(!copy_int_slot(inst._arg0, inst._arg1)) {
                    return false;
                }
                break;
            case _OP_DMOVE:
                if(slot_is_float(inst._arg1)) {
                    if(!copy_float_slot(inst._arg0, inst._arg1)) {
                        return false;
                    }
                }
                else if(!copy_int_slot(inst._arg0, inst._arg1)) {
                    return false;
                }
                if(slot_is_float(inst._arg3)) {
                    if(!copy_float_slot(inst._arg2, inst._arg3)) {
                        return false;
                    }
                }
                else if(!copy_int_slot(inst._arg2, inst._arg3)) {
                    return false;
                }
                break;
            case _OP_GETK: {
                if(inst._arg1 < 0 || inst._arg1 >= proto->_nliterals ||
                    sq_type(proto->_literals[inst._arg1]) != OT_INTEGER) {
                    return sqjit_a64_reject(proto, ip, "unsupported loop GETK key");
                }
                SQInteger observed_reg = (inst._arg2 >= 0 && inst._arg2 < MAX_FUNC_STACKSIZE) ?
                    stack_object_reg[inst._arg2] : -1;
                SQInteger index = _integer(proto->_literals[inst._arg1]);
                SQObjectType observed = sqjit_a64_observed_array_value_type(entry_stack,
                    observed_reg, index);
                if(!emit_array_get_const(inst._arg0, inst._arg2, index, observed)) {
                    return sqjit_a64_reject(proto, ip, "unsupported loop GETK array read");
                }
                break;
            }
            case _OP_GET: {
                SQInteger observed_reg = (inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE) ?
                    stack_object_reg[inst._arg1] : -1;
                if(known_const[inst._arg2]) {
                    SQObjectType observed = sqjit_a64_observed_array_value_type(entry_stack,
                        observed_reg, const_value[inst._arg2]);
                    if(!emit_array_get_const(inst._arg0, inst._arg1, const_value[inst._arg2],
                        observed)) {
                        return sqjit_a64_reject(proto, ip, "unsupported loop const GET array read");
                    }
                }
                else {
                    SQInteger observed_index = 0;
                    if(inst._arg2 >= 0 && inst._arg2 < MAX_FUNC_STACKSIZE &&
                        sq_type(entry_stack[inst._arg2]) == OT_INTEGER) {
                        observed_index = _integer(entry_stack[inst._arg2]);
                    }
                    SQObjectType observed = sqjit_a64_observed_array_value_type(entry_stack,
                        observed_reg, observed_index);
                    if(!emit_array_get_dynamic(inst._arg0, inst._arg1, inst._arg2, observed)) {
                        return sqjit_a64_reject(proto, ip, "unsupported loop dynamic GET array read");
                    }
                }
                break;
            }
            case _OP_ADD:
            case _OP_SUB:
            case _OP_MUL:
            case _OP_DIV:
            case _OP_MOD:
                if(slot_is_float(inst._arg1) || slot_is_float(inst._arg2)) {
                    if(!emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                        return false;
                    }
                }
                else if(!emit_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                    return false;
                }
                break;
            case _OP_INCL: {
                SQInteger delta = sqjit_signed_arg3(inst);
                if(!ensure_int_slot(inst._arg1) ||
                    !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg1))) {
                    return false;
                }
                if(delta >= 0) {
                    if(!sqjit_a64_emit_add_imm(&buf, 9, 9, delta)) {
                        return false;
                    }
                }
                else if(!sqjit_a64_emit_sub_imm(&buf, 9, 9, -delta)) {
                    return false;
                }
                if(!sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg1)) ||
                    !mark_int_slot(inst._arg1)) {
                    return false;
                }
                entry_loaded[inst._arg1] = true;
                break;
            }
            case _OP_PINCL: {
                SQInteger delta = sqjit_signed_arg3(inst);
                if(!ensure_int_slot(inst._arg1) ||
                    !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg1))) {
                    return false;
                }
                if(inst._arg0 != 0xFF) {
                    if(!sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg0)) ||
                        !mark_int_slot(inst._arg0)) {
                        return false;
                    }
                    entry_loaded[inst._arg0] = entry_loaded[inst._arg1];
                }
                if(delta >= 0) {
                    if(!sqjit_a64_emit_add_imm(&buf, 9, 9, delta)) {
                        return false;
                    }
                }
                else if(!sqjit_a64_emit_sub_imm(&buf, 9, 9, -delta)) {
                    return false;
                }
                if(!sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg1)) ||
                    !mark_int_slot(inst._arg1)) {
                    return false;
                }
                entry_loaded[inst._arg1] = true;
                break;
            }
            case _OP_EQ:
            case _OP_NE: {
                if(!ensure_int_slot(inst._arg2) ||
                    !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg2))) {
                    return false;
                }
                bool rhs_entry_loaded = false;
                if(inst._arg3 != 0) {
                    if(inst._arg1 < 0 || inst._arg1 >= proto->_nliterals ||
                        sq_type(proto->_literals[inst._arg1]) != OT_INTEGER ||
                        !sqjit_a64_emit_mov_imm_x(&buf, 10, _integer(proto->_literals[inst._arg1]))) {
                        return false;
                    }
                }
                else {
                    if(!ensure_int_slot(inst._arg1) ||
                        !sqjit_a64_emit_ldr_x(&buf, 10, 31, sqjit_a64_local_disp(inst._arg1))) {
                        return false;
                    }
                    rhs_entry_loaded = entry_loaded[inst._arg1];
                }
                if(!sqjit_a64_emit_cmp_reg(&buf, 9, 10) ||
                    !sqjit_a64_emit_cset(&buf, 9, inst.op == _OP_NE ? SQ_JIT_A64_NE : SQ_JIT_A64_EQ) ||
                    !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg0)) ||
                    !mark_bool_slot(inst._arg0)) {
                    return false;
                }
                entry_loaded[inst._arg0] = entry_loaded[inst._arg2] || rhs_entry_loaded;
                break;
            }
            case _OP_JZ: {
                SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
                SQInteger patch_offset = 0;
                if(!ensure_int_slot(inst._arg0) ||
                    !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg0)) ||
                    !sqjit_a64_emit_cmp_imm(&buf, 9, 0) ||
                    !sqjit_a64_emit_bcond_placeholder(&buf, SQ_JIT_A64_EQ, &patch_offset) ||
                    !record_branch(patch_offset, target_ip, true, SQ_JIT_A64_EQ)) {
                    return sqjit_a64_reject(proto, ip, "unsupported loop JZ");
                }
                break;
            }
            case _OP_JCMP: {
                SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
                SQInteger patch_offset = 0;
                unsigned false_cond = 0;
                if(!sqjit_a64_cmp_false_cond((CmpOP)inst._arg3, &false_cond)) {
                    return false;
                }
                if(slot_is_float(inst._arg0) || slot_is_float(inst._arg2)) {
                    if(!ensure_float_slot(inst._arg0) || !ensure_float_slot(inst._arg2) ||
                        !sqjit_a64_emit_ldr_s(&buf, 0, 31, sqjit_a64_local_disp(inst._arg2)) ||
                        !sqjit_a64_emit_ldr_s(&buf, 1, 31, sqjit_a64_local_disp(inst._arg0)) ||
                        !sqjit_a64_emit_fcmp_s(&buf, 0, 1) ||
                        !sqjit_a64_emit_bcond_placeholder(&buf, false_cond, &patch_offset) ||
                        !record_branch(patch_offset, target_ip, true, false_cond)) {
                        return sqjit_a64_reject(proto, ip, "unsupported loop float JCMP");
                    }
                }
                else if(!ensure_int_slot(inst._arg0) || !ensure_int_slot(inst._arg2) ||
                    !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(inst._arg2)) ||
                    !sqjit_a64_emit_ldr_x(&buf, 10, 31, sqjit_a64_local_disp(inst._arg0)) ||
                    !sqjit_a64_emit_cmp_reg(&buf, 9, 10) ||
                    !sqjit_a64_emit_bcond_placeholder(&buf, false_cond, &patch_offset) ||
                    !record_branch(patch_offset, target_ip, true, false_cond)) {
                    return sqjit_a64_reject(proto, ip, "unsupported loop JCMP");
                }
                break;
            }
            case _OP_JMP: {
                SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
                SQInteger patch_offset = 0;
                if(!sqjit_a64_emit_b_placeholder(&buf, &patch_offset) ||
                    !record_branch(patch_offset, target_ip, false, 0)) {
                    return sqjit_a64_reject(proto, ip, "unsupported loop JMP");
                }
                break;
            }
            default:
                return sqjit_a64_reject(proto, ip, "unsupported loop opcode");
        }
    }

    SQInteger exit_offset = buf.size;
    for(SQInteger n = 0; n < proto->_stacksize; n++) {
        if(!dirty_slot[n]) {
            continue;
        }
        if(!sqjit_a64_loop_slot_is_live_out(proto, exit_ip, n)) {
            continue;
        }
        if(!entry_loaded[n]) {
            return false;
        }
        if(!sqjit_a64_emit_store_stack_scalar(&buf, n, n, slot_kind[n])) {
            return false;
        }
    }
    if(!sqjit_a64_emit_mov_imm_x(&buf, 9, exit_ip) ||
        !sqjit_a64_emit_str_x(&buf, 9, 20, 0) ||
        !sqjit_a64_emit_epilogue(&buf, frame_size, SQ_JIT_NATIVE_RETURNED)) {
        return false;
    }

    SQInteger guard_fail_offset = buf.size;
    if(!sqjit_a64_emit_epilogue(&buf, frame_size, SQ_JIT_NATIVE_GUARD_FAILED)) {
        return false;
    }

    for(SQInteger n = 0; n < nrelocs; n++) {
        SQInteger target_offset = ip_to_offset[relocs[n].target_ip];
        if(target_offset < 0 ||
            !sqjit_a64_patch_branch(&buf, relocs[n].patch_offset, target_offset,
                relocs[n].conditional, relocs[n].cond)) {
            return false;
        }
    }
    for(SQInteger n = 0; n < nexit_relocs; n++) {
        if(!sqjit_a64_patch_branch(&buf, exit_relocs[n].patch_offset, exit_offset,
            exit_relocs[n].conditional, exit_relocs[n].cond)) {
            return false;
        }
    }
    for(SQInteger n = 0; n < nguard_relocs; n++) {
        if(!sqjit_a64_patch_branch(&buf, guard_relocs[n].patch_offset, guard_fail_offset,
            true, guard_relocs[n].cond)) {
            return false;
        }
    }

    return sqjit_a64_install_raw(&jit->_loop_entry, &jit->_loop_native_size, &buf);
}

#endif
