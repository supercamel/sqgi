/*  see copyright notice in squirrel.h */
#include "sqpcheader.h"
#include "sqjit_backend_aarch64_emit.h"
#include <stddef.h>
#include <string.h>
#include <vector>
#include <algorithm>


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

bool sqjit_a64_emit_ldr_float(SQJitA64Buffer *buf, unsigned rt, unsigned rn, SQInteger offset)
{
    static_assert(sizeof(SQFloat) == 8, "AArch64 floating instructions require binary64");
    if(offset < 0 || (offset & 7) != 0 || offset / 8 > 4095) return false;
    return sqjit_a64_emit_u32(buf, 0xFD400000u | (((uint32_t)(offset / 8)) << 10) | (rn << 5) | rt);
}

bool sqjit_a64_emit_str_float(SQJitA64Buffer *buf, unsigned rt, unsigned rn, SQInteger offset)
{
    static_assert(sizeof(SQFloat) == 8, "AArch64 floating instructions require binary64");
    if(offset < 0 || (offset & 7) != 0 || offset / 8 > 4095) return false;
    return sqjit_a64_emit_u32(buf, 0xFD000000u | (((uint32_t)(offset / 8)) << 10) | (rn << 5) | rt);
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

bool sqjit_a64_emit_and_reg(SQJitA64Buffer *buf, unsigned rd, unsigned rn, unsigned rm)
{
    if(rd > 31 || rn > 31 || rm > 31) return false;
    return sqjit_a64_emit_u32(buf, 0x8A000000u | (rm << 16) | (rn << 5) | rd);
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

// Signed dividend in x9, result in x9; x10/x11 are scratch. Only a proven
// positive divisor is admitted. Zero and negative divisors retain the caller's
// existing guards and hardware operation. NZCV is unchanged.
bool sqjit_a64_emit_divmod_constant(SQJitA64Buffer *buf, SQInteger divisor, bool remainder)
{
    if(sizeof(SQInteger)!=8 || divisor<=0) return false;
    if(divisor==1) return !remainder || sqjit_a64_emit_mov_imm_x(buf,9,0);
    const uint64_t d=static_cast<uint64_t>(divisor);
    auto shift=[&](unsigned rd,unsigned rn,unsigned amount,bool arithmetic) {
        return amount<64 && sqjit_a64_emit_u32(buf,
            (arithmetic ? 0x9340fc00u : 0xd340fc00u) |
            (amount<<16) | (rn<<5) | rd);
    };
    if((d&(d-1))==0) {
        unsigned power=0;
        for(uint64_t n=d;n>1;n>>=1) ++power;
        // Add 2^power-1 only for negative dividends, then arithmetic shift.
        if(!shift(11,9,63,true) || !shift(11,11,64-power,false) ||
            !sqjit_a64_emit_add_reg(buf,11,9,11) || !shift(11,11,power,true)) return false;
    }
    else {
        // Same unsigned reciprocal derivation as the x64 emitter. Quotient
        // and remainder doubling avoids host floating rounding and __int128.
        const uint64_t half=UINT64_C(1)<<63;
        const uint64_t boundary=half-1-half%d;
        uint64_t q[2]={half/boundary,half/d}, r[2]={half%boundary,half%d};
        const uint64_t denominators[2]={boundary,d};
        unsigned power=63;
        do {
            ++power;
            for(unsigned n=0;n<2;++n) {
                q[n]<<=1; r[n]<<=1;
                if(r[n]>=denominators[n]) { r[n]-=denominators[n]; ++q[n]; }
            }
        } while(q[0]<d-r[1] || (q[0]==d-r[1] && r[0]==0));
        const uint64_t magic=q[1]+1;
        SQInteger bits; memcpy(&bits,&magic,sizeof(bits));
        if(!sqjit_a64_emit_mov_imm_x(buf,10,bits) ||
            !sqjit_a64_emit_u32(buf,0x9b407c00u | (10u<<16) | (9u<<5) | 11u)) return false; // smulh x11,x9,x10
        if((magic&half) && !sqjit_a64_emit_add_reg(buf,11,11,9)) return false;
        if(power>64 && !shift(11,11,power-64,true)) return false;
        // Correct the negative quotient toward zero: add x11,x11,x11,lsr #63.
        if(!sqjit_a64_emit_u32(buf,0x8b400000u | (11u<<16) | (63u<<10) | (11u<<5) | 11u)) return false;
    }
    if(!remainder) return sqjit_a64_emit_mov_reg(buf,9,11);
    return sqjit_a64_emit_mov_imm_x(buf,10,divisor) &&
        sqjit_a64_emit_msub_reg(buf,9,11,10,9);
}

bool sqjit_a64_emit_blr_x16(SQJitA64Buffer *buf)
{
    return sqjit_a64_emit_u32(buf, 0xD63F0200u);
}

bool sqjit_a64_emit_scvtf_float_x(SQJitA64Buffer *buf, unsigned sd, unsigned rn)
{
    return sqjit_a64_emit_u32(buf, 0x9E620000u | (rn << 5) | sd);
}

bool sqjit_a64_emit_fop_float(SQJitA64Buffer *buf, SQOpcode op, unsigned rd, unsigned rn, unsigned rm)
{
    uint32_t base = 0;
    switch(op) {
        case _OP_ADD: base = 0x1E602800u; break;
        case _OP_SUB: base = 0x1E603800u; break;
        case _OP_MUL: base = 0x1E600800u; break;
        case _OP_DIV: base = 0x1E601800u; break;
        default: return false;
    }
    return sqjit_a64_emit_u32(buf, base | (rm << 16) | (rn << 5) | rd);
}

bool sqjit_a64_emit_fneg_float(SQJitA64Buffer *buf, unsigned rd, unsigned rn)
{
    return sqjit_a64_emit_u32(buf, 0x1E614000u | (rn << 5) | rd);
}

bool sqjit_a64_emit_fcmp_float(SQJitA64Buffer *buf, unsigned rn, unsigned rm)
{
    return sqjit_a64_emit_u32(buf, 0x1E602000u | (rm << 16) | (rn << 5));
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

bool sqjit_a64_emit_test_branch(SQJitA64Buffer *buf, unsigned rt, unsigned bit,
    bool nonzero, SQInteger *patch_offset)
{
    if(!buf || !patch_offset || rt > 31 || bit > 63 || buf->size < 0 ||
        (buf->size & 3) || buf->size > (SQInteger)sizeof(buf->bytes) - 4) return false;
    SQInteger offset = buf->size;
    uint32_t word = 0x36000000u | (nonzero ? 0x01000000u : 0) |
        ((bit & 32u) << 26) | ((bit & 31u) << 19) | rt;
    if(!sqjit_a64_emit_u32(buf, word)) return false;
    *patch_offset = offset;
    return true;
}

bool sqjit_a64_patch_test_branch(SQJitA64Buffer *buf, SQInteger patch_offset,
    SQInteger target_offset)
{
    if(!buf || buf->size < 4 || buf->size > (SQInteger)sizeof(buf->bytes) ||
        patch_offset < 0 || patch_offset > buf->size - 4 || (patch_offset & 3) ||
        target_offset < patch_offset - 32768 || target_offset > patch_offset + 32764)
        return false;
    SQInteger rel = target_offset - patch_offset;
    if(rel & 3) return false;
    uint32_t word;
    memcpy(&word, &buf->bytes[patch_offset], sizeof(word));
    if((word & 0x7E000000u) != 0x36000000u) return false;
    word = (word & ~(0x3FFFu << 5)) | (((uint32_t)(rel / 4) & 0x3FFFu) << 5);
    return sqjit_a64_patch_u32(buf, patch_offset, word);
}

bool sqjit_a64_emit_scalar_get_skip(SQJitA64Buffer *buf, SQInteger slot,
    SQInteger active_vm_address, SQInteger temp_type_offset, SQInteger *skip)
{
    if(!buf || !skip || buf->size < 0 || buf->size > (SQInteger)sizeof(buf->bytes) ||
        (buf->size & 3) || slot < 0 || slot >= MAX_FUNC_STACKSIZE || !active_vm_address ||
        temp_type_offset < 0 || temp_type_offset >= 16384 || (temp_type_offset & 3)) return false;
    SQInteger no_vm = -1, owning_slot = -1;
    if(!sqjit_a64_emit_mov_imm_x(buf, 9, active_vm_address) ||
        !sqjit_a64_emit_ldr_x(buf, 9, 9, 0) ||
        !sqjit_a64_emit_cmp_imm(buf, 9, 0) ||
        !sqjit_a64_emit_bcond_placeholder(buf, SQ_JIT_A64_EQ, &no_vm) ||
        !sqjit_a64_emit_ldr_w(buf, 10, 19, sqjit_a64_stack_type_disp(slot)) ||
        !sqjit_a64_emit_test_branch(buf, 10, SQ_JIT_A64_REF_COUNTED_BIT, true, &owning_slot) ||
        !sqjit_a64_emit_ldr_w(buf, 10, 9, temp_type_offset) ||
        !sqjit_a64_emit_test_branch(buf, 10, SQ_JIT_A64_REF_COUNTED_BIT, false, skip)) return false;
    // Raw calls with no active VM must use the journal-local temporary and
    // its checked path. Do not load a temporary through a null VM pointer.
    return sqjit_a64_patch_branch(buf, no_vm, buf->size, true, SQ_JIT_A64_EQ) &&
        sqjit_a64_patch_test_branch(buf, owning_slot, buf->size);
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

// Forward private 64-bit slot traffic inside straight-line regions. Scratch
// d16-d31 are caller-clobbered; reject input code that uses them. Every branch,
// helper call, unknown operation, SP change or possible alias materializes the
// private frame first. All branch displacements are rebuilt transactionally.
bool sqjit_a64_forward_local_slots(SQJitA64Buffer *buf, SQInteger slots,
    const SQInteger *float_copies, SQInteger nfloat_copies)
{
    if(!buf || sizeof(SQInteger)!=8 || sizeof(SQFloat)!=8 || slots<=0 ||
        slots>MAX_FUNC_STACKSIZE || buf->size<=0 || buf->size%4 ||
        buf->size>(SQInteger)sizeof(buf->bytes)) return false;
    const SQInteger count=buf->size/4;
    if(nfloat_copies<0 || nfloat_copies>count/2 || (nfloat_copies && !float_copies)) return false;
    std::vector<uint32_t> input((size_t)count);
    memcpy(input.data(),buf->bytes,(size_t)buf->size);
    std::vector<SQInteger> targets((size_t)count,-1), offsets((size_t)count+1,-1);
    std::vector<unsigned char> leaders((size_t)count+1,0);
    leaders[0]=leaders[count]=1;
    auto branch_bits=[](uint32_t w)->unsigned {
        if((w&0x7c000000u)==0x14000000u) return 26;
        if((w&0xff000010u)==0x54000000u || (w&0x7e000000u)==0x34000000u) return 19;
        if((w&0x7e000000u)==0x36000000u) return 14;
        return 0;
    };
    auto fp_safe=[](uint32_t w)->bool {
        const unsigned rd=w&31, rn=(w>>5)&31, rm=(w>>16)&31;
        // Generated double arithmetic, negate, comparison and int conversion.
        const uint32_t binary=w&0xffe0fc00u;
        if(binary==0x1e602800u || binary==0x1e603800u ||
            binary==0x1e600800u || binary==0x1e601800u)
            return rd<8 && rn<8 && rm<8;
        if((w&0xfffffc00u)==0x1e614000u) return rd<8 && rn<8;
        if((w&0xffe0fc1fu)==0x1e602000u) return rn<8 && rm<8;
        if((w&0xfffffc00u)==0x9e620000u) return rd<8;
        return false;
    };
    for(SQInteger i=0;i<count;++i) {
        const uint32_t w=input[i];const unsigned bits=branch_bits(w);
        if(bits) {
            const unsigned shift=bits==26 ? 0 : 5;
            SQInteger displacement=(w>>shift)&((1u<<bits)-1);
            if(displacement&(SQInteger(1)<<(bits-1))) displacement-=SQInteger(1)<<bits;
            SQInteger target=i+displacement;
            if(target<0 || target>count) return false;
            targets[i]=target;leaders[target]=1;leaders[i+1]=1;
        }
        // No unhandled PC-relative literal/address relocations.
        if((w&0x1f000000u)==0x10000000u || (w&0x3b000000u)==0x18000000u) return false;
        const bool memory=(w&0x0a000000u)==0x08000000u;
        if(memory && (w&0x04000000u)) {
            // Only scalar double loads/stores to the emitter's d0-d7 are known.
            if(((w&0xffc00000u)!=0xfd000000u && (w&0xffc00000u)!=0xfd400000u) || (w&31)>=8)
                return false;
        }
        else if((w&0x1e000000u)==0x0e000000u || (w&0x1e000000u)==0x1e000000u) {
            if(!fp_safe(w)) return false;
        }
    }
    // The emitter retains GP copies on every unoptimized/fallback path. Only
    // this private transaction uses FP copies to avoid cross-bank transfers.
    // Refusal at any later step preserves the complete original GP artifact.
    for(SQInteger n=0;n<nfloat_copies;++n) {
        const SQInteger offset=float_copies[n];
        if(offset<0 || offset%4 || offset/4>=count-1) return false;
        const SQInteger i=offset/4;
        if(leaders[i+1] || (input[i]&0xffc003ffu)!=0xf94003e9u ||
            (input[i+1]&0xffc003ffu)!=0xf90003e9u ||
            SQInteger((input[i]>>10)&4095)>=slots ||
            SQInteger((input[i+1]>>10)&4095)>=slots) return false;
        input[i]=(input[i]&~0x0400001fu)|0x04000000u;
        input[i+1]=(input[i+1]&~0x0400001fu)|0x04000000u;
    }
    SQJitA64Buffer output={};
    struct Entry { SQInteger slot; unsigned age; } cache[16];
    for(unsigned r=0;r<16;++r) { cache[r].slot=-1;cache[r].age=0; }
    unsigned age=0, forwarded=0;
    auto spill=[&](unsigned r)->bool {
        if(cache[r].slot<0) return true;
        // STR D keeps integer, pointer and floating payload bits unchanged.
        return sqjit_a64_emit_u32(&output,0xfd0003e0u |
            ((uint32_t)cache[r].slot<<10) | (16+r));
    };
    auto flush=[&]()->bool {
        for(unsigned r=0;r<16;++r) { if(!spill(r)) return false;cache[r].slot=-1; }
        return true;
    };
    auto pure=[&](uint32_t w)->bool {
        if(fp_safe(w)) return true;
        if((w&0x1f800000u)==0x12800000u) return true; // MOVZ/MOVN/MOVK
        if((w&0x1f000000u)==0x11000000u) // add/sub immediate; SP changes are barriers
            return (w&31)!=31 || (w&0x20000000u);
        if((w&0x1f200000u)==0x0b000000u || (w&0x1f000000u)==0x0a000000u) return true;
        if((w&0xffe0fc00u)==0x9ac00c00u || (w&0xff000000u)==0x9b000000u) return true;
        if((w&0xffc0fc00u)==0x9340fc00u || (w&0xffc0fc00u)==0xd340fc00u) return true; // ASR/LSR X immediate
        return false;
    };
    // Cache only stores that feed a later access in this region. An
    // overwritten, unread store is dead; a final write can stay in memory
    // without paying for a scratch move followed by a spill at the boundary.
    std::vector<unsigned char> next_access((size_t)count,0), next((size_t)slots,0);
    for(SQInteger i=count;i-- > 0;) {
        if(leaders[i+1]) std::fill(next.begin(),next.end(),0);
        const uint32_t w=input[i],op=w&0xffc00000u;
        const bool load=op==0xf9400000u || op==0xfd400000u;
        const bool store=op==0xf9000000u || op==0xfd000000u;
        const SQInteger slot=(w>>10)&4095;
        if((load || store) && ((w>>5)&31)==31 && slot<slots &&
            ((op==0xfd400000u || op==0xfd000000u) || (w&31)!=31)) {
            next_access[i]=next[slot];next[slot]=load ? 1 : 2;
        }
        else if(!pure(w)) std::fill(next.begin(),next.end(),0);
    }
    for(SQInteger i=0;i<count;++i) {
        if(leaders[i] && !flush()) return false;
        offsets[i]=output.size;
        const uint32_t w=input[i], op=w&0xffc00000u;
        const bool load=op==0xf9400000u || op==0xfd400000u;
        const bool store=op==0xf9000000u || op==0xfd000000u;
        const bool floating=op==0xfd400000u || op==0xfd000000u;
        const SQInteger slot=(w>>10)&4095;
        const unsigned rt=w&31;
        if((load || store) && ((w>>5)&31)==31 && slot<slots && (floating || rt!=31)) {
            int selected=-1;
            for(unsigned r=0;r<16;++r) if(cache[r].slot==slot) selected=(int)r;
            if(store) {
                if(next_access[i]!=1) {
                    if(selected>=0) cache[selected].slot=-1;
                    if(next_access[i]==2) { ++forwarded;continue; }
                    if(!sqjit_a64_emit_u32(&output,w)) return false;
                    continue;
                }
                if(selected<0) {
                    for(unsigned r=0;r<16;++r) if(cache[r].slot<0) {selected=(int)r;break;}
                    if(selected<0) {
                        selected=0;
                        for(unsigned r=1;r<16;++r) if(cache[r].age<cache[selected].age) selected=(int)r;
                        if(!spill((unsigned)selected)) return false;
                    }
                }
                else ++forwarded;
                cache[selected].slot=slot;cache[selected].age=++age;
                // FMOV Dcache,Dsrc or FMOV Dcache,Xsrc; both preserve all bits.
                if(!sqjit_a64_emit_u32(&output,(floating ? 0x1e604000u : 0x9e670000u) |
                    (rt<<5) | (16+(unsigned)selected))) return false;
                continue;
            }
            if(selected>=0) {
                ++forwarded;cache[selected].age=++age;
                if(!sqjit_a64_emit_u32(&output,(floating ? 0x1e604000u : 0x9e660000u) |
                    ((16+(unsigned)selected)<<5) | rt)) return false;
                continue;
            }
            if(!sqjit_a64_emit_u32(&output,w)) return false;
            continue;
        }
        // Memory outside the exact private slot, calls and unknown operations
        // can observe aliases or clobber scratch state. Flush before them.
        if(!pure(w) && !flush()) return false;
        // A relocated branch must name its instruction, after preceding spills.
        if(targets[i]>=0) offsets[i]=output.size;
        if(!sqjit_a64_emit_u32(&output,w)) return false;
    }
    if(!flush() || !forwarded) return false;
    offsets[count]=output.size;
    for(SQInteger i=0;i<count;++i) if(targets[i]>=0) {
        const unsigned bits=branch_bits(input[i]), shift=bits==26 ? 0 : 5;
        const SQInteger displacement=(offsets[targets[i]]-offsets[i])/4;
        if(displacement<-(SQInteger(1)<<(bits-1)) || displacement>=(SQInteger(1)<<(bits-1))) return false;
        const uint32_t mask=((1u<<bits)-1)<<shift;
        const uint32_t word=(input[i]&~mask) | (((uint32_t)displacement<<shift)&mask);
        memcpy(output.bytes+offsets[i],&word,4);
    }
    *buf=output;
    return true;
}
