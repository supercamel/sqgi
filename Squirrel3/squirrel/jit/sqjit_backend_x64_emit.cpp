/*  see copyright notice in squirrel.h */
#include "sqpcheader.h"
#include "sqjit_backend_x64_emit.h"
#include <limits.h>
#include <initializer_list>
#include <stddef.h>
#include <stdint.h>
#include <string.h>

static int cached_float(const SQJitNativeCodeBuffer *buf, SQInteger slot)
{
    for(int i=0; i<4; ++i) {
        if(buf->float_slots[i] == slot) return i;
        for(SQInteger alias : buf->float_aliases[i]) if(alias == slot) return i;
    }
    return -1;
}

void sqjit_native_discard_float_slot(SQJitNativeCodeBuffer *buf, SQInteger slot)
{
    int i = cached_float(buf, slot);
    if(i < 0) return;
    auto &aliases = buf->float_aliases[i];
    if(buf->float_slots[i] == slot) {
        buf->float_slots[i] = aliases.empty() ? -1 : aliases.back();
        if(!aliases.empty()) aliases.pop_back();
    }
    else for(size_t n=0; n<aliases.size(); ++n) if(aliases[n] == slot) {
        aliases[n] = aliases.back(); aliases.pop_back(); break;
    }
}

static bool spill_float_slot(SQJitNativeCodeBuffer *buf, int reg, SQInteger slot)
{
    if(!sqjit_native_emit_u8(buf, 0xf2) || !sqjit_native_emit_u8(buf, 0x0f) ||
        !sqjit_native_emit_u8(buf, 0x11) || !sqjit_native_emit_u8(buf, 0x85 | ((reg+2)<<3)) ||
        !sqjit_native_emit_rbp_disp32(buf, slot)) return false;
    sqjit_native_discard_float_slot(buf, slot);
    return true;
}

bool sqjit_native_flush_float_cache(SQJitNativeCodeBuffer *buf, SQInteger slot)
{
    if(slot >= 0) {
        int reg = cached_float(buf, slot);
        return reg < 0 || spill_float_slot(buf, reg, slot);
    }
    for(int i=0; i<4; ++i) {
        while(buf->float_slots[i] >= 0)
            if(!spill_float_slot(buf, i, buf->float_slots[i])) return false;
    }
    return true;
}

static bool float_register_move(SQJitNativeCodeBuffer *buf, int dst, int src)
{
    if(dst == src) return true;
    return sqjit_native_emit_u8(buf, 0xf2) && sqjit_native_emit_u8(buf, 0x0f) &&
        sqjit_native_emit_u8(buf, 0x10) && sqjit_native_emit_u8(buf, 0xc0 | (dst<<3) | src);
}

bool sqjit_native_reconcile_float_registers(SQJitNativeCodeBuffer *buf, const std::vector<SQInteger> &slots)
{
    if(slots.size() > 4) return false;
    // Keep selected values in registers; reconcile all other names to memory.
    auto selected = [&](SQInteger slot) {
        for(SQInteger value : slots) if(slot == value) return true;
        return false;
    };
    for(int reg=0; reg<4; ++reg) {
        std::vector<SQInteger> names = buf->float_aliases[reg];
        if(buf->float_slots[reg] >= 0) names.push_back(buf->float_slots[reg]);
        for(SQInteger slot : names)
            if(!selected(slot) && !spill_float_slot(buf, reg, slot)) return false;
    }
    int sources[4] = {-1,-1,-1,-1};
    bool pending[4] = {};
    size_t remaining = slots.size();
    for(size_t n=0; n<slots.size(); ++n) {
        int reg = cached_float(buf, slots[n]);
        sources[n] = reg < 0 ? -1 : reg + 2;
        pending[n] = true;
    }
    while(remaining) {
        bool progress = false;
        for(size_t n=0; n<slots.size(); ++n) if(pending[n]) {
            int dst = (int)n + 2;
            bool needed = false;
            for(size_t k=0; k<slots.size(); ++k)
                needed |= k != n && pending[k] && sources[k] == dst;
            if(needed && sources[n] != dst) continue;
            if(sources[n] >= 0) {
                if(!float_register_move(buf, dst, sources[n])) return false;
            }
            else if(!sqjit_native_emit_u8(buf, 0xf2) || !sqjit_native_emit_u8(buf, 0x0f) ||
                !sqjit_native_emit_u8(buf, 0x10) || !sqjit_native_emit_u8(buf, 0x85 | (dst << 3)) ||
                !sqjit_native_emit_rbp_disp32(buf, slots[n])) return false;
            pending[n] = false; --remaining; progress = true;
        }
        if(progress) continue;
        // A parallel-copy cycle: preserve one old value in ABI scratch XMM0.
        size_t n=0; while(!pending[n]) ++n;
        int saved = (int)n + 2;
        if(!float_register_move(buf, 0, saved)) return false;
        for(size_t k=0; k<slots.size(); ++k) if(pending[k] && sources[k] == saved) sources[k] = 0;
    }
    for(int n=0; n<4; ++n) {
        buf->float_slots[n] = (size_t)n < slots.size() ? slots[n] : -1;
        buf->float_aliases[n].clear();
    }
    return true;
}

bool sqjit_native_is_int32(SQInteger value)
{
    return value >= (SQInteger)INT_MIN && value <= (SQInteger)INT_MAX;
}

bool sqjit_native_emit_u8(SQJitNativeCodeBuffer *buf, unsigned char value)
{
    if(buf->size >= (SQInteger)sizeof(buf->bytes)) {
        return false;
    }
    buf->bytes[buf->size++] = value;
    return true;
}

bool sqjit_native_emit_i32(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    if(!sqjit_native_is_int32(value) || buf->size + 4 > (SQInteger)sizeof(buf->bytes)) {
        return false;
    }
    SQInt32 v = (SQInt32)value;
    memcpy(&buf->bytes[buf->size], &v, sizeof(v));
    buf->size += 4;
    return true;
}

bool sqjit_native_emit_i64(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    if(buf->size + 8 > (SQInteger)sizeof(buf->bytes)) {
        return false;
    }
    int64_t v = value;
    memcpy(&buf->bytes[buf->size], &v, sizeof(v));
    buf->size += 8;
    return true;
}

bool sqjit_native_emit_i32_unchecked(SQJitNativeCodeBuffer *buf, SQInt32 value)
{
    if(buf->size + 4 > (SQInteger)sizeof(buf->bytes)) {
        return false;
    }
    memcpy(&buf->bytes[buf->size], &value, sizeof(value));
    buf->size += 4;
    return true;
}

bool sqjit_native_patch_i32(SQJitNativeCodeBuffer *buf, SQInteger offset, SQInteger value)
{
    if(!sqjit_native_is_int32(value) || offset < 0 || offset + 4 > buf->size) {
        return false;
    }
    SQInt32 v = (SQInt32)value;
    memcpy(&buf->bytes[offset], &v, sizeof(v));
    return true;
}

SQInteger sqjit_native_slot_disp(SQInteger reg)
{
    return -((reg + 1) * (SQInteger)sizeof(SQInteger));
}

SQInteger sqjit_native_pinned_slot_reg(SQInteger slot)
{
    switch(slot) {
        case 1: return 14; // first user parameter / loop bound
        case 2: return 15; // first local accumulator
        case 3: return 3;  // common loop index
        default: return -1;
    }
}

SQInteger sqjit_native_pinned_slot_reg(const SQJitNativeCodeBuffer *buf, SQInteger slot)
{
    const SQInteger registers[] = {14, 15, 3};
    for(int n = 0; n < 3; ++n) if(buf->pinned_slots[n] == slot) return registers[n];
    return -1;
}

bool sqjit_native_emit_rex_w_rr(SQJitNativeCodeBuffer *buf, SQInteger reg, SQInteger rm)
{
    return sqjit_native_emit_u8(buf, (unsigned char)(0x48 |
        ((reg & 8) ? 0x04 : 0) |
        ((rm & 8) ? 0x01 : 0)));
}

bool sqjit_native_emit_modrm_rr(SQJitNativeCodeBuffer *buf, SQInteger reg, SQInteger rm)
{
    return sqjit_native_emit_u8(buf, (unsigned char)(0xC0 | ((reg & 7) << 3) | (rm & 7)));
}

SQInteger sqjit_native_stack_type_disp(SQInteger reg)
{
    return reg * (SQInteger)sizeof(SQObjectPtr) + (SQInteger)offsetof(SQObject, _type);
}

SQInteger sqjit_native_stack_value_disp(SQInteger reg)
{
    return reg * (SQInteger)sizeof(SQObjectPtr) + (SQInteger)offsetof(SQObject, _unVal);
}

bool sqjit_native_emit_rbp_disp32(SQJitNativeCodeBuffer *buf, SQInteger reg)
{
    return sqjit_native_emit_i32(buf, sqjit_native_slot_disp(reg));
}

bool sqjit_native_emit_mov_rax_local_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    if(!sqjit_native_flush_float_cache(buf, src)) return false;
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x8B) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

bool sqjit_native_emit_mov_local_mem_rax(SQJitNativeCodeBuffer *buf, SQInteger dst)
{
    sqjit_native_discard_float_slot(buf, dst);
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, dst);
}

bool sqjit_native_emit_mov_rax_imm64(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0xB8) &&
        sqjit_native_emit_i64(buf, value);
}

bool sqjit_native_emit_mov_rcx_imm64(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0xB9) &&
        sqjit_native_emit_i64(buf, value);
}

bool sqjit_native_emit_mov_rax_ptr(SQJitNativeCodeBuffer *buf, const void *value)
{
    return sqjit_native_emit_mov_rax_imm64(buf, (SQInteger)(intptr_t)value);
}

bool sqjit_native_emit_ret(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0xC3);
}

bool sqjit_native_emit_push_rbp(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x55);
}

bool sqjit_native_emit_push_rdi(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x57);
}

bool sqjit_native_emit_push_rsi(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x56);
}

bool sqjit_native_emit_push_r12(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x41) &&
        sqjit_native_emit_u8(buf, 0x54);
}

bool sqjit_native_emit_push_r13(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x41) &&
        sqjit_native_emit_u8(buf, 0x55);
}

bool sqjit_native_emit_push_r14(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x41) &&
        sqjit_native_emit_u8(buf, 0x56);
}

bool sqjit_native_emit_push_r15(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x41) &&
        sqjit_native_emit_u8(buf, 0x57);
}

bool sqjit_native_emit_push_rbx(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x53);
}

bool sqjit_native_emit_pop_rbp(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x5D);
}

bool sqjit_native_emit_pop_rdi(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x5F);
}

bool sqjit_native_emit_pop_rsi(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x5E);
}

bool sqjit_native_emit_pop_r12(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x41) &&
        sqjit_native_emit_u8(buf, 0x5C);
}

bool sqjit_native_emit_pop_r13(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x41) &&
        sqjit_native_emit_u8(buf, 0x5D);
}

bool sqjit_native_emit_pop_r14(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x41) &&
        sqjit_native_emit_u8(buf, 0x5E);
}

bool sqjit_native_emit_pop_r15(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x41) &&
        sqjit_native_emit_u8(buf, 0x5F);
}

bool sqjit_native_emit_pop_rbx(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x5B);
}

bool sqjit_native_emit_push_abi_preserved_arg_regs(SQJitNativeCodeBuffer *buf)
{
#if SQJIT_ABI_WIN64
    // The emitter keeps helper-call arguments in SysV-shaped staging registers.
    // Win64 treats RDI/RSI as nonvolatile, so preserve them around native JIT code.
    return sqjit_native_emit_push_rdi(buf) &&
        sqjit_native_emit_push_rsi(buf);
#else
    (void)buf;
    return true;
#endif
}

bool sqjit_native_emit_pop_abi_preserved_arg_regs(SQJitNativeCodeBuffer *buf)
{
#if SQJIT_ABI_WIN64
    return sqjit_native_emit_pop_rsi(buf) &&
        sqjit_native_emit_pop_rdi(buf);
#else
    (void)buf;
    return true;
#endif
}

bool sqjit_native_emit_mov_rbp_rsp(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xE5);
}

bool sqjit_native_emit_mov_r12_rsi(SQJitNativeCodeBuffer *buf)
{
#if SQJIT_ABI_WIN64
    // Incoming native arg2 is RDX on Win64.
    return sqjit_native_emit_u8(buf, 0x49) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xD4);
#else
    return sqjit_native_emit_u8(buf, 0x49) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xF4);
#endif
}

bool sqjit_native_emit_mov_r13_rdi(SQJitNativeCodeBuffer *buf)
{
#if SQJIT_ABI_WIN64
    // Incoming native arg1 is RCX on Win64.
    return sqjit_native_emit_u8(buf, 0x49) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xCD);
#else
    return sqjit_native_emit_u8(buf, 0x49) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xFD);
#endif
}

bool sqjit_native_emit_mov_rdi_r13(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x4C) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xEF);
}

bool sqjit_native_emit_mov_rdi_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    if(!sqjit_native_flush_float_cache(buf, src)) return false;
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x8B) &&
        sqjit_native_emit_u8(buf, 0xBD) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

bool sqjit_native_emit_mov_rdi_i64(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    return sqjit_native_emit_u8(buf, 0x48) && sqjit_native_emit_u8(buf, 0xbf) && sqjit_native_emit_i64(buf, value);
}

bool sqjit_native_emit_lea_rsi_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    if(!sqjit_native_flush_float_cache(buf, src)) return false;
    return sqjit_native_emit_u8(buf, 0x48) && sqjit_native_emit_u8(buf, 0x8d) &&
        sqjit_native_emit_u8(buf, 0xb5) && sqjit_native_emit_rbp_disp32(buf, src);
}

bool sqjit_native_emit_lea_rdi_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    if(!sqjit_native_flush_float_cache(buf, src)) return false;
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x8D) &&
        sqjit_native_emit_u8(buf, 0xBD) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

bool sqjit_native_emit_mov_rsi_r13(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x4C) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xEE);
}

bool sqjit_native_emit_mov_rsi_i64(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0xBE) &&
        sqjit_native_emit_i64(buf, value);
}

bool sqjit_native_emit_mov_rsi_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    if(!sqjit_native_flush_float_cache(buf, src)) return false;
    SQInteger reg = sqjit_native_pinned_slot_reg(buf, src);
    if(reg >= 0) {
        return sqjit_native_emit_rex_w_rr(buf, 6, reg) &&
            sqjit_native_emit_u8(buf, 0x8B) &&
            sqjit_native_emit_modrm_rr(buf, 6, reg);
    }
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x8B) &&
        sqjit_native_emit_u8(buf, 0xB5) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

bool sqjit_native_emit_mov_rsi_local_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    if(!sqjit_native_flush_float_cache(buf, src)) return false;
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x8B) &&
        sqjit_native_emit_u8(buf, 0xB5) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

bool sqjit_native_emit_mov_rdx_i64(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0xBA) &&
        sqjit_native_emit_i64(buf, value);
}

bool sqjit_native_emit_mov_rdx_r12(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x4C) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xE2);
}

bool sqjit_native_emit_mov_rdx_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    if(!sqjit_native_flush_float_cache(buf, src)) return false;
    SQInteger reg = sqjit_native_pinned_slot_reg(buf, src);
    if(reg >= 0) {
        return sqjit_native_emit_rex_w_rr(buf, 2, reg) &&
            sqjit_native_emit_u8(buf, 0x8B) &&
            sqjit_native_emit_modrm_rr(buf, 2, reg);
    }
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x8B) &&
        sqjit_native_emit_u8(buf, 0x95) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

bool sqjit_native_emit_mov_r8_i64(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    return sqjit_native_emit_u8(buf, 0x49) &&
        sqjit_native_emit_u8(buf, 0xB8) &&
        sqjit_native_emit_i64(buf, value);
}

bool sqjit_native_emit_mov_r8_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    if(!sqjit_native_flush_float_cache(buf, src)) return false;
    SQInteger reg = sqjit_native_pinned_slot_reg(buf, src);
    if(reg >= 0) {
        return sqjit_native_emit_rex_w_rr(buf, 8, reg) &&
            sqjit_native_emit_u8(buf, 0x8B) &&
            sqjit_native_emit_modrm_rr(buf, 8, reg);
    }
    return sqjit_native_emit_u8(buf, 0x4C) &&
        sqjit_native_emit_u8(buf, 0x8B) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

bool sqjit_native_emit_lea_r8_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    if(!sqjit_native_flush_float_cache(buf, src)) return false;
    return sqjit_native_emit_u8(buf, 0x4C) &&
        sqjit_native_emit_u8(buf, 0x8D) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

bool sqjit_native_emit_lea_rcx_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    if(!sqjit_native_flush_float_cache(buf, src)) return false;
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x8D) &&
        sqjit_native_emit_u8(buf, 0x8D) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

bool sqjit_native_emit_lea_rdx_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    if(!sqjit_native_flush_float_cache(buf, src)) return false;
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x8D) &&
        sqjit_native_emit_u8(buf, 0x95) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

bool sqjit_native_emit_call_rax(SQJitNativeCodeBuffer *buf)
{
    if(!sqjit_native_flush_float_cache(buf)) return false;
#if SQJIT_ABI_WIN64
    // Helper call sites stage arguments as:
    //   arg1=RDI, arg2=RSI, arg3=RDX, arg4=RCX, arg5=R8.
    // Win64 wants:
    //   arg1=RCX, arg2=RDX, arg3=R8, arg4=R9, arg5=[RSP+32],
    // with 32 bytes of shadow space. 48 keeps RSP 16-byte aligned.
    return sqjit_native_emit_u8(buf, 0x49) && // mov %rax, %r11
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xC3) &&
        sqjit_native_emit_u8(buf, 0x48) && // sub $48, %rsp
        sqjit_native_emit_u8(buf, 0x83) &&
        sqjit_native_emit_u8(buf, 0xEC) &&
        sqjit_native_emit_u8(buf, 0x30) &&
        sqjit_native_emit_u8(buf, 0x4C) && // mov %r8, 32(%rsp)
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0x44) &&
        sqjit_native_emit_u8(buf, 0x24) &&
        sqjit_native_emit_u8(buf, 0x20) &&
        sqjit_native_emit_u8(buf, 0x49) && // mov %rcx, %r9
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xC9) &&
        sqjit_native_emit_u8(buf, 0x49) && // mov %rdx, %r8
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xD0) &&
        sqjit_native_emit_u8(buf, 0x48) && // mov %rsi, %rdx
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xF2) &&
        sqjit_native_emit_u8(buf, 0x48) && // mov %rdi, %rcx
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xF9) &&
        sqjit_native_emit_u8(buf, 0x41) && // call *%r11
        sqjit_native_emit_u8(buf, 0xFF) &&
        sqjit_native_emit_u8(buf, 0xD3) &&
        sqjit_native_emit_u8(buf, 0x48) && // add $48, %rsp
        sqjit_native_emit_u8(buf, 0x83) &&
        sqjit_native_emit_u8(buf, 0xC4) &&
        sqjit_native_emit_u8(buf, 0x30);
#else
    return sqjit_native_emit_u8(buf, 0xFF) &&
        sqjit_native_emit_u8(buf, 0xD0);
#endif
}

bool sqjit_native_emit_test_rax_rax(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_u8(buf, 0xC0);
}

bool sqjit_native_emit_mov_rsp_rbp(SQJitNativeCodeBuffer *buf)
{
    if(!sqjit_native_flush_float_cache(buf)) return false;
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xEC);
}

bool sqjit_native_emit_sub_rsp_i32(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x81) &&
        sqjit_native_emit_u8(buf, 0xEC) &&
        sqjit_native_emit_i32(buf, value);
}

bool sqjit_native_emit_mov_mem_rax(SQJitNativeCodeBuffer *buf, SQInteger dst)
{
    sqjit_native_discard_float_slot(buf, dst);
    SQInteger reg = sqjit_native_pinned_slot_reg(buf, dst);
    if(reg >= 0) {
        return sqjit_native_emit_rex_w_rr(buf, 0, reg) &&
            sqjit_native_emit_u8(buf, 0x89) &&
            sqjit_native_emit_modrm_rr(buf, 0, reg);
    }
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, dst);
}

bool sqjit_native_emit_mov_rax_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    if(!sqjit_native_flush_float_cache(buf, src)) return false;
    SQInteger reg = sqjit_native_pinned_slot_reg(buf, src);
    if(reg >= 0) {
        return sqjit_native_emit_rex_w_rr(buf, 0, reg) &&
            sqjit_native_emit_u8(buf, 0x8B) &&
            sqjit_native_emit_modrm_rr(buf, 0, reg);
    }
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x8B) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

bool sqjit_native_sync_pinned_slot_from_local(SQJitNativeCodeBuffer *buf, SQInteger slot)
{
    if(sqjit_native_pinned_slot_reg(buf, slot) < 0) {
        return true;
    }
    return sqjit_native_emit_mov_rax_local_mem(buf, slot) &&
        sqjit_native_emit_mov_mem_rax(buf, slot);
}

bool sqjit_native_emit_cmp_stack_type_i32(SQJitNativeCodeBuffer *buf, SQInteger reg, SQInteger type)
{
    return sqjit_native_emit_u8(buf, 0x41) &&
        sqjit_native_emit_u8(buf, 0x81) &&
        sqjit_native_emit_u8(buf, 0xBD) &&
        sqjit_native_emit_i32(buf, sqjit_native_stack_type_disp(reg)) &&
        sqjit_native_emit_i32(buf, type);
}

bool sqjit_native_emit_mov_rax_stack_value(SQJitNativeCodeBuffer *buf, SQInteger reg)
{
    return sqjit_native_emit_u8(buf, 0x49) &&
        sqjit_native_emit_u8(buf, 0x8B) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_i32(buf, sqjit_native_stack_value_disp(reg));
}

bool sqjit_native_emit_mov_rcx_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    if(!sqjit_native_flush_float_cache(buf, src)) return false;
    SQInteger reg = sqjit_native_pinned_slot_reg(buf, src);
    if(reg >= 0) {
        return sqjit_native_emit_rex_w_rr(buf, 1, reg) &&
            sqjit_native_emit_u8(buf, 0x8B) &&
            sqjit_native_emit_modrm_rr(buf, 1, reg);
    }
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x8B) &&
        sqjit_native_emit_u8(buf, 0x8D) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

bool sqjit_native_emit_mov_mem_imm32(SQJitNativeCodeBuffer *buf, SQInteger dst, SQInteger value)
{
    sqjit_native_discard_float_slot(buf, dst);
    SQInteger reg = sqjit_native_pinned_slot_reg(buf, dst);
    if(reg >= 0) {
        return sqjit_native_emit_rex_w_rr(buf, 0, reg) &&
            sqjit_native_emit_u8(buf, 0xC7) &&
            sqjit_native_emit_modrm_rr(buf, 0, reg) &&
            sqjit_native_emit_i32(buf, value);
    }
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0xC7) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, dst) &&
        sqjit_native_emit_i32(buf, value);
}

bool sqjit_native_emit_mov_out_rax(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x49) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0x04) &&
        sqjit_native_emit_u8(buf, 0x24);
}

bool sqjit_native_emit_mov_out_value_rax(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x49) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0x84) &&
        sqjit_native_emit_u8(buf, 0x24) &&
        sqjit_native_emit_i32(buf, (SQInteger)offsetof(SQObject, _unVal));
}

bool sqjit_native_emit_mov_out_type_i32(SQJitNativeCodeBuffer *buf, SQInteger type)
{
    return sqjit_native_emit_u8(buf, 0x41) &&
        sqjit_native_emit_u8(buf, 0xC7) &&
        sqjit_native_emit_u8(buf, 0x84) &&
        sqjit_native_emit_u8(buf, 0x24) &&
        sqjit_native_emit_i32(buf, (SQInteger)offsetof(SQObject, _type)) &&
        sqjit_native_emit_i32(buf, type);
}

bool sqjit_native_emit_store_out_integer_from_rax(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_mov_out_value_rax(buf) &&
        sqjit_native_emit_mov_out_type_i32(buf, OT_INTEGER);
}

bool sqjit_native_emit_mov_stack_type_i32(SQJitNativeCodeBuffer *buf, SQInteger reg, SQInteger type)
{
    return sqjit_native_emit_u8(buf, 0x41) &&
        sqjit_native_emit_u8(buf, 0xC7) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_i32(buf, sqjit_native_stack_type_disp(reg)) &&
        sqjit_native_emit_i32(buf, type);
}

bool sqjit_native_emit_mov_stack_value_rax(SQJitNativeCodeBuffer *buf, SQInteger reg)
{
    return sqjit_native_emit_u8(buf, 0x49) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_i32(buf, sqjit_native_stack_value_disp(reg));
}

bool sqjit_native_emit_store_stack_integer_from_rax(SQJitNativeCodeBuffer *buf, SQInteger reg)
{
    return sqjit_native_emit_mov_stack_value_rax(buf, reg) &&
        sqjit_native_emit_mov_stack_type_i32(buf, reg, OT_INTEGER);
}

bool sqjit_native_emit_mov_local_float_const(SQJitNativeCodeBuffer *buf, SQInteger dst, SQFloat value)
{
    static_assert(sizeof(SQFloat) == 8, "native floating cache uses binary64");
    SQInteger bits;
    memcpy(&bits, &value, sizeof(bits));
    if(!buf->cache_floats) return sqjit_native_emit_mov_rax_imm64(buf, bits) &&
        sqjit_native_emit_mov_local_mem_rax(buf, dst);
    return sqjit_native_emit_mov_rax_imm64(buf, bits) &&
        sqjit_native_emit_u8(buf, 0x66) && sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x0f) && sqjit_native_emit_u8(buf, 0x6e) &&
        sqjit_native_emit_u8(buf, 0xc0) && // movq xmm0,rax
        sqjit_native_emit_mov_local_float_xmm0(buf, dst);
}

bool sqjit_native_emit_mov_xmm0_local_float(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    int cached = cached_float(buf, src);
    if(cached >= 0) return float_register_move(buf, 0, cached + 2);
    return sqjit_native_emit_u8(buf, sizeof(SQFloat) == sizeof(SQInt32) ? 0xF3 : 0xF2) &&
        sqjit_native_emit_u8(buf, 0x0F) &&
        sqjit_native_emit_u8(buf, 0x10) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

// Scalar floating arguments occupy XMM0/XMM1 under both supported x64 ABIs.
bool sqjit_native_emit_mov_xmm1_local_float(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    int cached = cached_float(buf, src);
    if(cached >= 0) return float_register_move(buf, 1, cached + 2);
    return sqjit_native_emit_u8(buf, sizeof(SQFloat) == sizeof(SQInt32) ? 0xF3 : 0xF2) &&
        sqjit_native_emit_u8(buf, 0x0F) && sqjit_native_emit_u8(buf, 0x10) &&
        sqjit_native_emit_u8(buf, 0x8D) && sqjit_native_emit_rbp_disp32(buf, src);
}

bool sqjit_native_emit_convert_rax_float(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, sizeof(SQFloat) == sizeof(SQInt32) ? 0xF3 : 0xF2) &&
        (sizeof(SQInteger) != 8 || sqjit_native_emit_u8(buf, 0x48)) &&
        sqjit_native_emit_u8(buf, 0x0F) && sqjit_native_emit_u8(buf, 0x2A) &&
        sqjit_native_emit_u8(buf, 0xC0); // cvtsi2ss/cvtsi2sd rax, xmm0
}

bool sqjit_native_emit_mov_local_float_xmm0(SQJitNativeCodeBuffer *buf, SQInteger dst)
{
    if(!buf->cache_floats) return sqjit_native_emit_u8(buf, 0xf2) &&
        sqjit_native_emit_u8(buf, 0x0f) && sqjit_native_emit_u8(buf, 0x11) &&
        sqjit_native_emit_u8(buf, 0x85) && sqjit_native_emit_rbp_disp32(buf, dst);
    sqjit_native_discard_float_slot(buf, dst);
    int cached = -1;
    if(cached < 0) {
        for(int i=0; i<4; ++i) if(buf->float_slots[i] < 0) { cached=i; break; }
        if(cached < 0) {
            cached=0;
            while(buf->float_slots[cached] >= 0)
                if(!spill_float_slot(buf, cached, buf->float_slots[cached])) return false;
        }
    }
    if(!float_register_move(buf, cached+2, 0)) return false;
    buf->float_slots[cached]=dst;
    return true;
}

bool sqjit_native_emit_copy_float(SQJitNativeCodeBuffer *buf, SQInteger dst, SQInteger src)
{
    if(dst == src) return true;
    int cached = cached_float(buf, src);
    sqjit_native_discard_float_slot(buf, dst);
    if(buf->cache_floats && cached >= 0) {
        buf->float_aliases[cached].push_back(dst);
        return true;
    }
    if(!sqjit_native_emit_mov_xmm0_local_float(buf, src) ||
        !sqjit_native_emit_mov_local_float_xmm0(buf, dst)) return false;
    if(buf->cache_floats) buf->float_aliases[cached_float(buf, dst)].push_back(src);
    return true;
}

bool sqjit_native_emit_mov_xmm0_stack_float_value(SQJitNativeCodeBuffer *buf, SQInteger reg)
{
    return sqjit_native_emit_u8(buf, sizeof(SQFloat) == sizeof(SQInt32) ? 0xF3 : 0xF2) &&
        sqjit_native_emit_u8(buf, 0x41) &&
        sqjit_native_emit_u8(buf, 0x0F) &&
        sqjit_native_emit_u8(buf, 0x10) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_i32(buf, sqjit_native_stack_value_disp(reg));
}

bool sqjit_native_emit_mov_stack_float_value_xmm0(SQJitNativeCodeBuffer *buf, SQInteger reg)
{
    return sqjit_native_emit_u8(buf, sizeof(SQFloat) == sizeof(SQInt32) ? 0xF3 : 0xF2) &&
        sqjit_native_emit_u8(buf, 0x41) &&
        sqjit_native_emit_u8(buf, 0x0F) &&
        sqjit_native_emit_u8(buf, 0x11) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_i32(buf, sqjit_native_stack_value_disp(reg));
}

bool sqjit_native_emit_mov_out_float_value_xmm0(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, sizeof(SQFloat) == sizeof(SQInt32) ? 0xF3 : 0xF2) &&
        sqjit_native_emit_u8(buf, 0x41) &&
        sqjit_native_emit_u8(buf, 0x0F) &&
        sqjit_native_emit_u8(buf, 0x11) &&
        sqjit_native_emit_u8(buf, 0x84) &&
        sqjit_native_emit_u8(buf, 0x24) &&
        sqjit_native_emit_i32(buf, (SQInteger)offsetof(SQObject, _unVal));
}

bool sqjit_native_emit_float_op_xmm0_local(SQJitNativeCodeBuffer *buf, SQOpcode op, SQInteger rhs)
{
    unsigned char opcode;
    switch(op) {
        case _OP_ADD: opcode = 0x58; break;
        case _OP_SUB: opcode = 0x5C; break;
        case _OP_MUL: opcode = 0x59; break;
        case _OP_DIV: opcode = 0x5E; break;
        default: return false;
    }
    int cached = cached_float(buf, rhs);
    if(cached >= 0) return sqjit_native_emit_u8(buf, 0xf2) &&
        sqjit_native_emit_u8(buf, 0x0f) && sqjit_native_emit_u8(buf, opcode) &&
        sqjit_native_emit_u8(buf, 0xc0 | (cached+2));
    return sqjit_native_emit_u8(buf, sizeof(SQFloat) == sizeof(SQInt32) ? 0xF3 : 0xF2) &&
        sqjit_native_emit_u8(buf, 0x0F) &&
        sqjit_native_emit_u8(buf, opcode) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, rhs);
}

bool sqjit_native_emit_float_binary(SQJitNativeCodeBuffer *buf, SQOpcode op,
    SQInteger dst, SQInteger left, SQInteger right, bool consume_left)
{
    int reg = cached_float(buf, left);
    bool reusable = reg >= 0 && (consume_left || dst == left);
    if(reusable) {
        reusable = buf->float_slots[reg] == left || buf->float_slots[reg] == dst;
        for(SQInteger alias : buf->float_aliases[reg]) reusable &= alias == left || alias == dst;
    }
    if(!reusable) return sqjit_native_emit_mov_xmm0_local_float(buf, left) &&
        sqjit_native_emit_float_op_xmm0_local(buf, op, right) &&
        sqjit_native_emit_mov_local_float_xmm0(buf, dst);
    unsigned char opcode;
    switch(op) {
    case _OP_ADD: opcode = 0x58; break;
    case _OP_SUB: opcode = 0x5c; break;
    case _OP_MUL: opcode = 0x59; break;
    case _OP_DIV: opcode = 0x5e; break;
    default: return false;
    }
    int rhs = cached_float(buf, right);
    if(!sqjit_native_emit_u8(buf, 0xf2) || !sqjit_native_emit_u8(buf, 0x0f) ||
        !sqjit_native_emit_u8(buf, opcode)) return false;
    if(rhs >= 0) {
        if(!sqjit_native_emit_u8(buf, 0xc0 | ((reg+2)<<3) | (rhs+2))) return false;
    }
    else if(!sqjit_native_emit_u8(buf, 0x85 | ((reg+2)<<3)) ||
        !sqjit_native_emit_rbp_disp32(buf, right)) return false;
    // Read both operands before detaching an aliased destination. Operand
    // order is unchanged, including subtraction/division and NaN propagation.
    sqjit_native_discard_float_slot(buf, left);
    sqjit_native_discard_float_slot(buf, dst);
    buf->float_slots[reg] = dst;
    return true;
}

bool sqjit_native_emit_ucomi_xmm0_local_float(SQJitNativeCodeBuffer *buf, SQInteger rhs)
{
    int cached = cached_float(buf, rhs);
    if(cached >= 0) return sqjit_native_emit_u8(buf, 0x66) &&
        sqjit_native_emit_u8(buf, 0x0f) && sqjit_native_emit_u8(buf, 0x2e) &&
        sqjit_native_emit_u8(buf, 0xc0 | (cached+2));

    if(sizeof(SQFloat) != sizeof(SQInt32) && !sqjit_native_emit_u8(buf, 0x66)) {
        return false;
    }
    return sqjit_native_emit_u8(buf, 0x0F) &&
        sqjit_native_emit_u8(buf, 0x2E) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, rhs);
}

bool sqjit_native_emit_store_stack_float_from_local(SQJitNativeCodeBuffer *buf, SQInteger reg, SQInteger local)
{
    return sqjit_native_emit_mov_xmm0_local_float(buf, local) &&
        sqjit_native_emit_mov_rax_imm64(buf, 0) &&
        sqjit_native_emit_mov_stack_value_rax(buf, reg) &&
        sqjit_native_emit_mov_stack_float_value_xmm0(buf, reg) &&
        sqjit_native_emit_mov_stack_type_i32(buf, reg, OT_FLOAT);
}

bool sqjit_native_emit_store_out_float_from_local(SQJitNativeCodeBuffer *buf, SQInteger local)
{
    return sqjit_native_emit_mov_xmm0_local_float(buf, local) &&
        sqjit_native_emit_mov_rax_imm64(buf, 0) &&
        sqjit_native_emit_mov_out_value_rax(buf) &&
        sqjit_native_emit_mov_out_float_value_xmm0(buf) &&
        sqjit_native_emit_mov_out_type_i32(buf, OT_FLOAT);
}

bool sqjit_native_emit_mov_eax_i32(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    return sqjit_native_emit_u8(buf, 0xB8) &&
        sqjit_native_emit_i32(buf, value);
}

bool sqjit_native_emit_add_rax_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    if(!sqjit_native_flush_float_cache(buf, src)) return false;
    SQInteger reg = sqjit_native_pinned_slot_reg(buf, src);
    if(reg >= 0) {
        return sqjit_native_emit_rex_w_rr(buf, 0, reg) &&
            sqjit_native_emit_u8(buf, 0x03) &&
            sqjit_native_emit_modrm_rr(buf, 0, reg);
    }
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x03) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

bool sqjit_native_emit_add_rax_i32(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x05) &&
        sqjit_native_emit_i32(buf, value);
}

bool sqjit_native_emit_sub_rax_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    if(!sqjit_native_flush_float_cache(buf, src)) return false;
    SQInteger reg = sqjit_native_pinned_slot_reg(buf, src);
    if(reg >= 0) {
        return sqjit_native_emit_rex_w_rr(buf, 0, reg) &&
            sqjit_native_emit_u8(buf, 0x2B) &&
            sqjit_native_emit_modrm_rr(buf, 0, reg);
    }
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x2B) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

bool sqjit_native_emit_sub_rax_i32(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x2D) &&
        sqjit_native_emit_i32(buf, value);
}

bool sqjit_native_emit_imul_rax_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    if(!sqjit_native_flush_float_cache(buf, src)) return false;
    SQInteger reg = sqjit_native_pinned_slot_reg(buf, src);
    if(reg >= 0) {
        return sqjit_native_emit_rex_w_rr(buf, 0, reg) &&
            sqjit_native_emit_u8(buf, 0x0F) &&
            sqjit_native_emit_u8(buf, 0xAF) &&
            sqjit_native_emit_modrm_rr(buf, 0, reg);
    }
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x0F) &&
        sqjit_native_emit_u8(buf, 0xAF) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

bool sqjit_native_emit_imul_rax_i32(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x69) &&
        sqjit_native_emit_u8(buf, 0xC0) &&
        sqjit_native_emit_i32(buf, value);
}

bool sqjit_native_emit_cmp_rax_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    if(!sqjit_native_flush_float_cache(buf, src)) return false;
    SQInteger reg = sqjit_native_pinned_slot_reg(buf, src);
    if(reg >= 0) {
        return sqjit_native_emit_rex_w_rr(buf, 0, reg) &&
            sqjit_native_emit_u8(buf, 0x3B) &&
            sqjit_native_emit_modrm_rr(buf, 0, reg);
    }
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x3B) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

bool sqjit_native_emit_cmp_rax_i32(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x3D) &&
        sqjit_native_emit_i32(buf, value);
}

bool sqjit_native_emit_cmp_rcx_i32(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x81) &&
        sqjit_native_emit_u8(buf, 0xF9) &&
        sqjit_native_emit_i32(buf, value);
}

bool sqjit_native_emit_setcc_rax(SQJitNativeCodeBuffer *buf, unsigned char setcc)
{
    return sqjit_native_emit_u8(buf, 0x0F) &&
        sqjit_native_emit_u8(buf, setcc) &&
        sqjit_native_emit_u8(buf, 0xC0) && // setcc %al
        sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x0F) &&
        sqjit_native_emit_u8(buf, 0xB6) &&
        sqjit_native_emit_u8(buf, 0xC0); // movzbq %al, %rax
}

bool sqjit_native_emit_add_mem_i32(SQJitNativeCodeBuffer *buf, SQInteger dst, SQInteger value)
{
    if(!sqjit_native_flush_float_cache(buf, dst)) return false;
    SQInteger reg = sqjit_native_pinned_slot_reg(buf, dst);
    if(reg >= 0) {
        return sqjit_native_emit_rex_w_rr(buf, 0, reg) &&
            sqjit_native_emit_u8(buf, 0x81) &&
            sqjit_native_emit_modrm_rr(buf, 0, reg) &&
            sqjit_native_emit_i32(buf, value);
    }
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x81) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, dst) &&
        sqjit_native_emit_i32(buf, value);
}

bool sqjit_native_emit_idiv_rcx(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x99) && // cqo
        sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0xF7) &&
        sqjit_native_emit_u8(buf, 0xF9); // idiv %rcx
}

bool sqjit_native_emit_divmod_constant(SQJitNativeCodeBuffer *buf, SQInteger divisor, bool remainder)
{
    if(sizeof(SQInteger) != 8 || divisor <= 0) return false;
    auto bytes = [&](std::initializer_list<unsigned char> code) {
        for(unsigned char b : code) if(!sqjit_native_emit_u8(buf, b)) return false;
        return true;
    };
    if(divisor == 1) return !remainder || bytes({0x31, 0xc0}); // xor eax,eax
    const uint64_t d = static_cast<uint64_t>(divisor);
    // Keep the dividend in a volatile register for the signed correction and r=n-q*d.
    if(!bytes({0x49,0x89,0xc0})) return false; // mov r8,rax
    if((d & (d - 1)) == 0) {
        unsigned shift = 0;
        for(uint64_t n = d; n > 1; n >>= 1) ++shift;
        // Bias negative dividends before the arithmetic shift (truncation to zero).
        if(!bytes({0x48,0x89,0xc1, 0x48,0xc1,0xf9,0x3f, 0x48,0xc1,0xe9}) ||
            !sqjit_native_emit_u8(buf, 64 - shift) ||
            !bytes({0x48,0x01,0xc8, 0x48,0xc1,0xf8}) ||
            !sqjit_native_emit_u8(buf, shift)) return false;
    }
    else {
        // Derive a signed reciprocal using quotient/remainder doubling. This is
        // the integer algorithm in Hacker's Delight, chapter 10 (also described
        // by LLVM's DivisionByConstantInfo); no floating rounding or wide host
        // integer extension is required. All generator arithmetic is unsigned.
        const uint64_t half = UINT64_C(1) << 63;
        const uint64_t boundary = half - 1 - half % d;
        uint64_t q[2] = {half / boundary, half / d};
        uint64_t r[2] = {half % boundary, half % d};
        const uint64_t denominators[2] = {boundary, d};
        unsigned power = 63;
        do {
            ++power;
            for(unsigned i = 0; i != 2; ++i) {
                q[i] <<= 1;
                r[i] <<= 1;
                if(r[i] >= denominators[i]) { r[i] -= denominators[i]; ++q[i]; }
            }
        } while(q[0] < d - r[1] || (q[0] == d - r[1] && r[0] == 0));
        const uint64_t magic = q[1] + 1;
        SQInteger bits;
        memcpy(&bits, &magic, sizeof(bits));
        if(!sqjit_native_emit_mov_rcx_imm64(buf, bits) ||
            !bytes({0x48,0xf7,0xe9})) return false; // imul rcx -> rdx:rax
        if((magic & half) && !bytes({0x4c,0x01,0xc2})) return false; // add rdx,r8
        if(power > 64 && (!bytes({0x48,0xc1,0xfa}) ||
            !sqjit_native_emit_u8(buf, power - 64))) return false;
        if(!bytes({0x48,0x89,0xd0, 0x48,0xc1,0xe8,0x3f, 0x48,0x01,0xd0})) return false;
    }
    if(!remainder) return true;
    if(sqjit_native_is_int32(divisor)) {
        if(!sqjit_native_emit_imul_rax_i32(buf, divisor)) return false;
    }
    else if(!sqjit_native_emit_mov_rcx_imm64(buf, divisor) ||
        !bytes({0x48,0x0f,0xaf,0xc1})) return false;
    return bytes({0x49,0x29,0xc0, 0x4c,0x89,0xc0}); // rax = dividend - quotient*divisor
}

bool sqjit_native_emit_mov_rax_rdx(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xD0);
}

bool sqjit_native_emit_mov_rax_arg3(SQJitNativeCodeBuffer *buf)
{
#if SQJIT_ABI_WIN64
    return sqjit_native_emit_u8(buf, 0x4C) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xC0);
#else
    return sqjit_native_emit_mov_rax_rdx(buf);
#endif
}

bool sqjit_native_emit_jcc_placeholder(SQJitNativeCodeBuffer *buf, SQJitNativeJcc jcc, SQInteger *patch_offset)
{
    if(!sqjit_native_flush_float_cache(buf)) return false;
    if(!sqjit_native_emit_u8(buf, 0x0F) || !sqjit_native_emit_u8(buf, (unsigned char)jcc)) {
        return false;
    }
    *patch_offset = buf->size;
    return sqjit_native_emit_i32_unchecked(buf, 0);
}

bool sqjit_native_record_reloc(SQJitNativeReloc *relocs, SQInteger *nrelocs, SQInteger maxrelocs,
    SQInteger patch_offset, SQInteger target_ip)
{
    if(*nrelocs >= maxrelocs) {
        return false;
    }
    relocs[*nrelocs].patch_offset = patch_offset;
    relocs[*nrelocs].target_ip = target_ip;
    (*nrelocs)++;
    return true;
}

SQInteger sqjit_signed_arg1(const SQInstruction &inst)
{
    return (SQInteger)((SQInt32)inst._arg1);
}

SQInteger sqjit_signed_arg3(const SQInstruction &inst)
{
    return (SQInteger)((signed char)inst._arg3);
}

bool sqjit_native_cmp_false_jcc(CmpOP op, SQJitNativeJcc *jcc)
{
    switch(op) {
        case CMP_G:
            *jcc = SQ_JIT_JCC_LE;
            return true;
        case CMP_GE:
            *jcc = SQ_JIT_JCC_L;
            return true;
        case CMP_L:
            *jcc = SQ_JIT_JCC_GE;
            return true;
        case CMP_LE:
            *jcc = SQ_JIT_JCC_G;
            return true;
        default:
            return false;
    }
}

bool sqjit_native_float_cmp_false_jcc(CmpOP op, SQJitNativeJcc *jcc)
{
    switch(op) {
        case CMP_G:
            *jcc = SQ_JIT_JCC_BE;
            return true;
        case CMP_GE:
            *jcc = SQ_JIT_JCC_B;
            return true;
        case CMP_L:
            *jcc = SQ_JIT_JCC_AE;
            return true;
        case CMP_LE:
            *jcc = SQ_JIT_JCC_A;
            return true;
        default:
            return false;
    }
}

bool sqjit_native_emit_jmp_placeholder(SQJitNativeCodeBuffer *buf, SQInteger *patch_offset)
{
    if(!sqjit_native_flush_float_cache(buf)) return false;
    if(!sqjit_native_emit_u8(buf, 0xE9)) {
        return false;
    }
    *patch_offset = buf->size;
    return sqjit_native_emit_i32_unchecked(buf, 0);
}
