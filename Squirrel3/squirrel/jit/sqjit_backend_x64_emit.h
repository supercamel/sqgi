/* x86 encoding and ABI operations; no executable allocation. */
#ifndef _SQJIT_BACKEND_X64_EMIT_H_
#define _SQJIT_BACKEND_X64_EMIT_H_
#include "sqpcheader.h"
#include "sqopcodes.h"
#include "sqjit_platform.h"
struct SQJitNativeCodeBuffer {
    unsigned char bytes[8192];
    SQInteger size;
};

static const SQInteger SQ_JIT_NATIVE_CLOSURE_SLOT = MAX_FUNC_STACKSIZE;
static const SQInteger SQ_JIT_NATIVE_WRITE_LOG_SLOT = MAX_FUNC_STACKSIZE + 1;

struct SQJitNativeReloc {
    SQInteger patch_offset;
    SQInteger target_ip;
};

enum SQJitSlotKind {
    SQ_JIT_SLOT_UNKNOWN = 0,
    SQ_JIT_SLOT_INT,
    SQ_JIT_SLOT_FLOAT,
    SQ_JIT_SLOT_ARRAY_PTR,
    SQ_JIT_SLOT_STACK_OBJECT,
    SQ_JIT_SLOT_LITERAL_OBJECT
};

enum SQJitNativeJcc {
    SQ_JIT_JCC_B = 0x82,
    SQ_JIT_JCC_AE = 0x83,
    SQ_JIT_JCC_E = 0x84,
    SQ_JIT_JCC_NE = 0x85,
    SQ_JIT_JCC_BE = 0x86,
    SQ_JIT_JCC_A = 0x87,
    SQ_JIT_JCC_L = 0x8C,
    SQ_JIT_JCC_GE = 0x8D,
    SQ_JIT_JCC_LE = 0x8E,
    SQ_JIT_JCC_G = 0x8F
};

bool sqjit_native_is_int32(SQInteger value);
bool sqjit_native_emit_u8(SQJitNativeCodeBuffer *buf, unsigned char value);
bool sqjit_native_emit_i32(SQJitNativeCodeBuffer *buf, SQInteger value);
bool sqjit_native_emit_i64(SQJitNativeCodeBuffer *buf, SQInteger value);
bool sqjit_native_emit_i32_unchecked(SQJitNativeCodeBuffer *buf, SQInt32 value);
bool sqjit_native_patch_i32(SQJitNativeCodeBuffer *buf, SQInteger offset, SQInteger value);
SQInteger sqjit_native_slot_disp(SQInteger reg);
SQInteger sqjit_native_pinned_slot_reg(SQInteger slot);
bool sqjit_native_emit_rex_w_rr(SQJitNativeCodeBuffer *buf, SQInteger reg, SQInteger rm);
bool sqjit_native_emit_modrm_rr(SQJitNativeCodeBuffer *buf, SQInteger reg, SQInteger rm);
SQInteger sqjit_native_stack_type_disp(SQInteger reg);
SQInteger sqjit_native_stack_value_disp(SQInteger reg);
bool sqjit_native_emit_rbp_disp32(SQJitNativeCodeBuffer *buf, SQInteger reg);
bool sqjit_native_emit_mov_rax_local_mem(SQJitNativeCodeBuffer *buf, SQInteger src);
bool sqjit_native_emit_mov_local_mem_rax(SQJitNativeCodeBuffer *buf, SQInteger dst);
bool sqjit_native_emit_mov_rax_imm64(SQJitNativeCodeBuffer *buf, SQInteger value);
bool sqjit_native_emit_mov_rcx_imm64(SQJitNativeCodeBuffer *buf, SQInteger value);
bool sqjit_native_emit_mov_rax_ptr(SQJitNativeCodeBuffer *buf, const void *value);
bool sqjit_native_emit_ret(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_push_rbp(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_push_rdi(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_push_rsi(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_push_r12(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_push_r13(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_push_r14(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_push_r15(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_push_rbx(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_pop_rbp(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_pop_rdi(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_pop_rsi(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_pop_r12(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_pop_r13(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_pop_r14(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_pop_r15(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_pop_rbx(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_push_abi_preserved_arg_regs(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_pop_abi_preserved_arg_regs(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_mov_rbp_rsp(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_mov_r12_rsi(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_mov_r13_rdi(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_mov_rdi_r13(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_mov_rdi_mem(SQJitNativeCodeBuffer *buf, SQInteger src);
bool sqjit_native_emit_lea_rdi_mem(SQJitNativeCodeBuffer *buf, SQInteger src);
bool sqjit_native_emit_mov_rsi_r13(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_mov_rsi_i64(SQJitNativeCodeBuffer *buf, SQInteger value);
bool sqjit_native_emit_mov_rsi_mem(SQJitNativeCodeBuffer *buf, SQInteger src);
bool sqjit_native_emit_mov_rsi_local_mem(SQJitNativeCodeBuffer *buf, SQInteger src);
bool sqjit_native_emit_mov_rdx_i64(SQJitNativeCodeBuffer *buf, SQInteger value);
bool sqjit_native_emit_mov_rdx_r12(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_mov_rdx_mem(SQJitNativeCodeBuffer *buf, SQInteger src);
bool sqjit_native_emit_mov_r8_i64(SQJitNativeCodeBuffer *buf, SQInteger value);
bool sqjit_native_emit_mov_r8_mem(SQJitNativeCodeBuffer *buf, SQInteger src);
bool sqjit_native_emit_lea_r8_mem(SQJitNativeCodeBuffer *buf, SQInteger src);
bool sqjit_native_emit_lea_rcx_mem(SQJitNativeCodeBuffer *buf, SQInteger src);
bool sqjit_native_emit_lea_rdx_mem(SQJitNativeCodeBuffer *buf, SQInteger src);
bool sqjit_native_emit_call_rax(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_test_rax_rax(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_mov_rsp_rbp(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_sub_rsp_i32(SQJitNativeCodeBuffer *buf, SQInteger value);
bool sqjit_native_emit_mov_mem_rax(SQJitNativeCodeBuffer *buf, SQInteger dst);
bool sqjit_native_emit_mov_rax_mem(SQJitNativeCodeBuffer *buf, SQInteger src);
bool sqjit_native_sync_pinned_slot_from_local(SQJitNativeCodeBuffer *buf, SQInteger slot);
bool sqjit_native_emit_cmp_stack_type_i32(SQJitNativeCodeBuffer *buf, SQInteger reg, SQInteger type);
bool sqjit_native_emit_mov_rax_stack_value(SQJitNativeCodeBuffer *buf, SQInteger reg);
bool sqjit_native_emit_mov_rcx_mem(SQJitNativeCodeBuffer *buf, SQInteger src);
bool sqjit_native_emit_mov_mem_imm32(SQJitNativeCodeBuffer *buf, SQInteger dst, SQInteger value);
bool sqjit_native_emit_mov_out_rax(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_mov_out_value_rax(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_mov_out_type_i32(SQJitNativeCodeBuffer *buf, SQInteger type);
bool sqjit_native_emit_store_out_integer_from_rax(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_mov_stack_type_i32(SQJitNativeCodeBuffer *buf, SQInteger reg, SQInteger type);
bool sqjit_native_emit_mov_stack_value_rax(SQJitNativeCodeBuffer *buf, SQInteger reg);
bool sqjit_native_emit_store_stack_integer_from_rax(SQJitNativeCodeBuffer *buf, SQInteger reg);
bool sqjit_native_emit_mov_local_float_const(SQJitNativeCodeBuffer *buf, SQInteger dst, SQFloat value);
bool sqjit_native_emit_mov_xmm0_local_float(SQJitNativeCodeBuffer *buf, SQInteger src);
bool sqjit_native_emit_mov_local_float_xmm0(SQJitNativeCodeBuffer *buf, SQInteger dst);
bool sqjit_native_emit_mov_xmm0_stack_float_value(SQJitNativeCodeBuffer *buf, SQInteger reg);
bool sqjit_native_emit_mov_stack_float_value_xmm0(SQJitNativeCodeBuffer *buf, SQInteger reg);
bool sqjit_native_emit_mov_out_float_value_xmm0(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_float_op_xmm0_local(SQJitNativeCodeBuffer *buf, SQOpcode op, SQInteger rhs);
bool sqjit_native_emit_ucomi_xmm0_local_float(SQJitNativeCodeBuffer *buf, SQInteger rhs);
bool sqjit_native_emit_store_stack_float_from_local(SQJitNativeCodeBuffer *buf, SQInteger reg, SQInteger local);
bool sqjit_native_emit_store_out_float_from_local(SQJitNativeCodeBuffer *buf, SQInteger local);
bool sqjit_native_emit_mov_eax_i32(SQJitNativeCodeBuffer *buf, SQInteger value);
bool sqjit_native_emit_add_rax_mem(SQJitNativeCodeBuffer *buf, SQInteger src);
bool sqjit_native_emit_add_rax_i32(SQJitNativeCodeBuffer *buf, SQInteger value);
bool sqjit_native_emit_sub_rax_mem(SQJitNativeCodeBuffer *buf, SQInteger src);
bool sqjit_native_emit_sub_rax_i32(SQJitNativeCodeBuffer *buf, SQInteger value);
bool sqjit_native_emit_imul_rax_mem(SQJitNativeCodeBuffer *buf, SQInteger src);
bool sqjit_native_emit_imul_rax_i32(SQJitNativeCodeBuffer *buf, SQInteger value);
bool sqjit_native_emit_cmp_rax_mem(SQJitNativeCodeBuffer *buf, SQInteger src);
bool sqjit_native_emit_cmp_rax_i32(SQJitNativeCodeBuffer *buf, SQInteger value);
bool sqjit_native_emit_cmp_rcx_i32(SQJitNativeCodeBuffer *buf, SQInteger value);
bool sqjit_native_emit_setcc_rax(SQJitNativeCodeBuffer *buf, unsigned char setcc);
bool sqjit_native_emit_add_mem_i32(SQJitNativeCodeBuffer *buf, SQInteger dst, SQInteger value);
bool sqjit_native_emit_idiv_rcx(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_mov_rax_rdx(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_mov_rax_arg3(SQJitNativeCodeBuffer *buf);
bool sqjit_native_emit_jmp_placeholder(SQJitNativeCodeBuffer *buf, SQInteger *patch_offset);
bool sqjit_native_emit_jcc_placeholder(SQJitNativeCodeBuffer *buf, SQJitNativeJcc jcc, SQInteger *patch_offset);
bool sqjit_native_record_reloc(SQJitNativeReloc *relocs, SQInteger *nrelocs, SQInteger maxrelocs,
    SQInteger patch_offset, SQInteger target_ip);
SQInteger sqjit_signed_arg1(const SQInstruction &inst);
SQInteger sqjit_signed_arg3(const SQInstruction &inst);
bool sqjit_native_cmp_false_jcc(CmpOP op, SQJitNativeJcc *jcc);
bool sqjit_native_float_cmp_false_jcc(CmpOP op, SQJitNativeJcc *jcc);
#endif
