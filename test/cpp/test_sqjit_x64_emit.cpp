#include "sqpcheader.h"
#include "jit/sqjit_backend_x64_emit.h"
#include <stdio.h>
#include <string.h>
#include <limits.h>

#define CHECK(cond, msg) do { if(!(cond)) { fprintf(stderr, "FAIL: %s\n", msg); ++rc; } } while(0)

int main()
{
    int rc = 0;
    SQJitNativeCodeBuffer buf = {};
    CHECK(sqjit_native_emit_mov_rax_imm64(&buf, 0x12345678), "immediate emits");
    CHECK(sqjit_native_emit_ret(&buf), "return emits");
    const unsigned char immediate[] = {0x48, 0xb8, 0x78, 0x56, 0x34, 0x12, 0, 0, 0, 0, 0xc3};
    CHECK(buf.size == sizeof(immediate) && !memcmp(buf.bytes, immediate, sizeof(immediate)),
        "64-bit immediate encoding");

    buf = {};
    SQInteger patch = -1;
    CHECK(sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_NE, &patch), "branch emits");
    CHECK(sqjit_native_patch_i32(&buf, patch, -6), "backwards relative branch patches");
    const unsigned char branch[] = {0x0f, 0x85, 0xfa, 0xff, 0xff, 0xff};
    CHECK(buf.size == sizeof(branch) && !memcmp(buf.bytes, branch, sizeof(branch)),
        "backwards branch encoding");
    CHECK(!sqjit_native_patch_i32(&buf, -1, 0), "negative patch offset rejected");
    CHECK(!sqjit_native_patch_i32(&buf, buf.size - 3, 0), "partial patch rejected");
#ifdef _SQ64
    CHECK(!sqjit_native_patch_i32(&buf, patch, (SQInteger)INT_MAX + 1), "overflowing displacement rejected");
#endif
    CHECK(!memcmp(buf.bytes, branch, sizeof(branch)), "rejected patches preserve bytes");
    SQJitNativeReloc relocs[1] = {};
    SQInteger count = 0;
    CHECK(sqjit_native_record_reloc(relocs, &count, 1, patch, 17), "relocation records target");
    CHECK(!sqjit_native_record_reloc(relocs, &count, 1, 0, 0), "relocation capacity enforced");
    CHECK(count == 1 && relocs[0].patch_offset == patch && relocs[0].target_ip == 17,
        "overflow preserves relocation");

    buf = {};
    CHECK(sqjit_native_emit_mov_local_mem_rax(&buf, 1), "pinned slot can spill to memory");
    const unsigned char spill[] = {0x48, 0x89, 0x85, (unsigned char)(-2 * (SQInteger)sizeof(SQInteger)), 0xff, 0xff, 0xff};
    CHECK(buf.size == sizeof(spill) && !memcmp(buf.bytes, spill, sizeof(spill)), "slot 1 spill encoding");
    CHECK(sqjit_native_pinned_slot_reg(1) == 14 && sqjit_native_pinned_slot_reg(2) == 15 &&
        sqjit_native_pinned_slot_reg(3) == 3, "callee-saved pinned registers");
    buf = {};
    buf.pinned_slots[0] = 9;
    CHECK(sqjit_native_pinned_slot_reg(&buf, 9) == 14 && sqjit_native_pinned_slot_reg(&buf, 1) == -1,
        "register assignment is local to the compilation buffer");
    CHECK(sqjit_native_emit_mov_mem_rax(&buf, 9), "selected slot writes its assigned register");
    const unsigned char selected[] = {0x49, 0x89, 0xc6};
    CHECK(buf.size == sizeof(selected) && !memcmp(buf.bytes, selected, sizeof(selected)), "selected r14 move encoding");

    buf = {};
    CHECK(sqjit_native_emit_mov_r13_rdi(&buf) && sqjit_native_emit_mov_r12_rsi(&buf) &&
        sqjit_native_emit_mov_rax_arg3(&buf), "incoming ABI arguments emit");
#if SQJIT_ABI_WIN64
    const unsigned char args[] = {0x49,0x89,0xcd, 0x49,0x89,0xd4, 0x4c,0x89,0xc0};
#else
    const unsigned char args[] = {0x49,0x89,0xfd, 0x49,0x89,0xf4, 0x48,0x89,0xd0};
#endif
    CHECK(buf.size == sizeof(args) && !memcmp(buf.bytes, args, sizeof(args)), "incoming ABI encoding");
    buf = {};
    CHECK(sqjit_native_emit_push_abi_preserved_arg_regs(&buf) &&
        sqjit_native_emit_pop_abi_preserved_arg_regs(&buf), "ABI save and restore emit");
#if SQJIT_ABI_WIN64
    const unsigned char saved[] = {0x57, 0x56, 0x5e, 0x5f};
    CHECK(buf.size == sizeof(saved) && !memcmp(buf.bytes, saved, sizeof(saved)), "Win64 nonvolatile argument registers");
#else
    CHECK(buf.size == 0, "SysV argument registers are volatile");
#endif
    buf = {};
    CHECK(sqjit_native_emit_call_rax(&buf), "helper call emits");
#if SQJIT_ABI_WIN64
    const unsigned char call[] = {0x49,0x89,0xc3, 0x48,0x83,0xec,0x30, 0x4c,0x89,0x44,0x24,0x20,
        0x49,0x89,0xc9, 0x49,0x89,0xd0, 0x48,0x89,0xf2, 0x48,0x89,0xf9, 0x41,0xff,0xd3, 0x48,0x83,0xc4,0x30};
    CHECK(buf.size == sizeof(call) && !memcmp(buf.bytes, call, sizeof(call)),
        "Win64 helper arguments, shadow space and 16-byte alignment");
#else
    CHECK(buf.size == 2 && buf.bytes[0] == 0xff && buf.bytes[1] == 0xd0, "SysV helper call encoding");
#endif
    buf = {};
    CHECK(sqjit_native_emit_convert_rax_float(&buf), "integer-to-float conversion emits");
    const unsigned char convert[] = {
        sizeof(SQFloat) == 4 ? (unsigned char)0xf3 : (unsigned char)0xf2,
#ifdef _SQ64
        0x48,
#endif
        0x0f, 0x2a, 0xc0};
    CHECK(buf.size == sizeof(convert) && !memcmp(buf.bytes, convert, sizeof(convert)),
        "native signed integer conversion encoding");
    buf = {};
    CHECK(sqjit_native_emit_mov_xmm1_local_float(&buf, 1), "second floating argument emits");
    const unsigned char fp_arg[] = {sizeof(SQFloat) == 4 ? (unsigned char)0xf3 : (unsigned char)0xf2,
        0x0f, 0x10, 0x8d, (unsigned char)(-2 * (SQInteger)sizeof(SQInteger)), 0xff, 0xff, 0xff};
    CHECK(buf.size == sizeof(fp_arg) && !memcmp(buf.bytes, fp_arg, sizeof(fp_arg)),
        "XMM1 floating argument encoding");

    buf = {}; buf.cache_floats = true;
    CHECK(sqjit_native_emit_mov_local_float_const(&buf, 7, 1.5), "floating cache write");
    CHECK(buf.float_slots[0] == 7, "volatile XMM register assigned");
    CHECK(sqjit_native_emit_call_rax(&buf), "cached float reconciled before helper ABI");
    for(int n=0;n<4;++n) CHECK(buf.float_slots[n] == -1, "helper cannot retain volatile cached values");
    CHECK(sqjit_native_emit_mov_local_float_const(&buf, 7, 2.5) &&
        sqjit_native_emit_lea_rdx_mem(&buf, 7), "address exposure reconciles floating cache");
    for(int n=0;n<4;++n) CHECK(buf.float_slots[n] != 7, "exposed address sees authoritative memory");

    buf.size = sizeof(buf.bytes) - 3;
    const SQInteger before = buf.size;
    CHECK(!sqjit_native_emit_i32(&buf, 1) && buf.size == before, "full buffer rejects 32-bit immediate");
    buf.size = sizeof(buf.bytes);
    CHECK(!sqjit_native_emit_u8(&buf, 0), "full buffer rejects byte");
    if(!rc) puts("[OK] x64 encoding and ABI contracts");
    return rc ? 1 : 0;
}
