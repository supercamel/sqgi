/*  see copyright notice in squirrel.h */
#include "sqpcheader.h"
#include "sqfuncproto.h"
#include "sqstring.h"
#include "sqvm.h"
#include "sqarray.h"
#include "sqtable.h"
#include "sqclass.h"
#include "sqclosure.h"
#include "sqjit.h"
#include "sqjit_backend.h"
#include <limits.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>
#include "sqjit_platform.h"
#include "sqjit_code.h"
#include "sqjit_backend_x64_emit.h"
#include "sqjit_backend_x64_helpers.h"

static bool sqjit_native_install(SQJitNative *native, SQJitNativeCodeBuffer *buf)
{
    return native->_code.Install(buf->bytes, buf->size);
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

static bool sqjit_previous_loads_int_const(SQFunctionProto *proto, SQInteger ip, SQInteger reg, SQInteger *value)
{
    // Keep immediate lowering local; whole-function constants are unsafe across backedges.
    if(ip <= 0) {
        return false;
    }
    const SQInstruction &prev = proto->_instructions[ip - 1];
    if(prev._arg0 != reg) {
        return false;
    }
    if(prev.op == _OP_LOADINT) {
        *value = sqjit_loadint_value(prev);
        return true;
    }
    if(prev.op == _OP_LOAD && prev._arg1 >= 0 && prev._arg1 < proto->_nliterals &&
        sq_type(proto->_literals[prev._arg1]) == OT_INTEGER) {
        *value = _integer(proto->_literals[prev._arg1]);
        return true;
    }
    return false;
}

static bool sqjit_previous_loads_positive_int_const(SQFunctionProto *proto, SQInteger ip, SQInteger reg)
{
    SQInteger value = 0;
    return sqjit_previous_loads_int_const(proto, ip, reg, &value) && value > 0;
}

static SQObjectType sqjit_observed_array_value_type(SQObjectPtr *entry_stack, SQInteger array_reg, SQInteger index)
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

static SQObjectType sqjit_observed_table_value_type(SQObjectPtr *entry_stack, SQInteger table_reg, const SQObjectPtr *key)
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


static SQObjectType sqjit_observed_outer_value_type(SQClosure *closure, SQInteger outer_index)
{
    SQObjectPtr *value = sqjit_outer_value_ptr(closure, outer_index);
    return value ? sq_type(*value) : OT_NULL;
}

static bool sqjit_next_consumes_load_as_immediate(SQFunctionProto *proto, SQInteger ip, SQInteger reg)
{
    if(!proto || ip + 1 >= proto->_ninstructions) {
        return false;
    }

    const SQInstruction &next = proto->_instructions[ip + 1];
    switch(next.op) {
        case _OP_ADD:
        case _OP_MUL:
            return next._arg1 == reg || next._arg2 == reg;
        case _OP_SUB:
        case _OP_MOD:
            return next._arg1 == reg;
        default:
            return false;
    }
}

static bool sqjit_loop_instruction_writes_slot(const SQInstruction &inst, SQInteger slot);

static bool compile_proto(SQFunctionProto *proto, SQObjectPtr *entry_stack,
    SQClosure *closure, SQJitNative *native, SQJitCompileAttempt &attempt)
{
    if(!proto || !entry_stack || !native || proto->_nparameters < 1 ||
        proto->_stacksize <= 0 || proto->_stacksize > MAX_FUNC_STACKSIZE ||
        proto->_nparameters > proto->_stacksize || proto->_ninstructions <= 0) {
        return attempt.Reject(-1, SQ_JIT_REJECT_INVALID_BYTECODE, "invalid compilation input or function bounds");
    }
    if(proto->_varparams || proto->_ndefaultparams != 0 || proto->_bgenerator ||
        proto->_ninstructions > 512) {
        return attempt.Reject(-1, SQ_JIT_REJECT_OTHER, "unsupported function shape or instruction limit");
    }

    SQInteger ip_to_offset[513];
    SQJitNativeReloc relocs[512];
    SQInteger nrelocs = 0;
    SQJitNativeReloc guard_fail_relocs[MAX_FUNC_STACKSIZE + 512];
    SQInteger nguard_fail_relocs = 0;
    SQJitSlotKind slot_kind[MAX_FUNC_STACKSIZE];
    SQInteger stack_object_reg[MAX_FUNC_STACKSIZE];
    SQInteger literal_object_index[MAX_FUNC_STACKSIZE];
    bool int_materialized[MAX_FUNC_STACKSIZE];
    bool float_materialized[MAX_FUNC_STACKSIZE];
    bool known_const[MAX_FUNC_STACKSIZE];
    SQInteger const_value[MAX_FUNC_STACKSIZE];
    SQFloat float_const_value[MAX_FUNC_STACKSIZE];
    for(SQInteger n = 0; n < 513; n++) {
        ip_to_offset[n] = -1;
    }
    for(SQInteger n = 0; n < MAX_FUNC_STACKSIZE; n++) {
        slot_kind[n] = SQ_JIT_SLOT_UNKNOWN;
        stack_object_reg[n] = -1;
        literal_object_index[n] = -1;
        int_materialized[n] = false;
        float_materialized[n] = false;
        known_const[n] = false;
        const_value[n] = 0;
        float_const_value[n] = 0;
    }

    SQJitNativeCodeBuffer buf;
    buf.size = 0;

    bool uses_write_log = false;
    for(SQInteger ip = 0; ip < proto->_ninstructions; ip++) {
        if(proto->_instructions[ip].op == _OP_SET) {
            uses_write_log = true;
            break;
        }
    }

    SQInteger last_reserved_slot = uses_write_log ? SQ_JIT_NATIVE_WRITE_LOG_SLOT : SQ_JIT_NATIVE_CLOSURE_SLOT;
    SQInteger frame_size = (last_reserved_slot + 1) * (SQInteger)sizeof(SQInteger);
    frame_size = ((frame_size + 15) & ~(SQInteger)15) + 8;

    if(!sqjit_native_emit_push_rbp(&buf) ||
        !sqjit_native_emit_push_abi_preserved_arg_regs(&buf) ||
        !sqjit_native_emit_push_r12(&buf) ||
        !sqjit_native_emit_push_r13(&buf) ||
        !sqjit_native_emit_push_rbx(&buf) ||
        !sqjit_native_emit_push_r14(&buf) ||
        !sqjit_native_emit_push_r15(&buf) ||
        !sqjit_native_emit_mov_rbp_rsp(&buf) ||
        !sqjit_native_emit_sub_rsp_i32(&buf, frame_size) ||
        !sqjit_native_emit_mov_r12_rsi(&buf) ||
        !sqjit_native_emit_mov_r13_rdi(&buf) ||
        !sqjit_native_emit_mov_rax_arg3(&buf) ||
        !sqjit_native_emit_mov_local_mem_rax(&buf, SQ_JIT_NATIVE_CLOSURE_SLOT)) {
        return false;
    }
    if(uses_write_log && !sqjit_native_emit_mov_mem_imm32(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT, 0)) {
        return false;
    }

    for(SQInteger n = 1; n < proto->_nparameters; n++) {
        slot_kind[n] = SQ_JIT_SLOT_STACK_OBJECT;
        stack_object_reg[n] = n;
    }

    auto emit_guard_fail_jump = [&]() -> bool {
        SQInteger patch_offset = 0;
        return sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_NE, &patch_offset) &&
            sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1);
    };

    auto emit_write_log_release = [&](bool rollback) -> bool {
        if(!uses_write_log) {
            return true;
        }
        return sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) &&
            sqjit_native_emit_mov_rax_ptr(&buf, rollback ?
                (const void *)sqjit_helper_write_log_rollback :
                (const void *)sqjit_helper_write_log_commit) &&
            sqjit_native_emit_call_rax(&buf);
    };

    auto load_literal_slot = [&](SQInteger dst, SQInteger literal_index, bool materialize_int) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals) {
            return false;
        }
        if(sq_type(proto->_literals[literal_index]) == OT_INTEGER) {
            if(!sqjit_native_is_int32(_integer(proto->_literals[literal_index]))) {
                return false;
            }
            SQInteger value = _integer(proto->_literals[literal_index]);
            if(materialize_int && !sqjit_native_emit_mov_mem_imm32(&buf, dst, value)) {
                return false;
            }
            slot_kind[dst] = SQ_JIT_SLOT_INT;
            stack_object_reg[dst] = -1;
            literal_object_index[dst] = -1;
            int_materialized[dst] = materialize_int;
            float_materialized[dst] = false;
            known_const[dst] = true;
            const_value[dst] = value;
        }
        else if(sq_type(proto->_literals[literal_index]) == OT_FLOAT) {
            SQFloat value = _float(proto->_literals[literal_index]);
            if(!sqjit_native_emit_mov_local_float_const(&buf, dst, value)) {
                return false;
            }
            slot_kind[dst] = SQ_JIT_SLOT_FLOAT;
            stack_object_reg[dst] = -1;
            literal_object_index[dst] = -1;
            int_materialized[dst] = false;
            float_materialized[dst] = true;
            known_const[dst] = true;
            float_const_value[dst] = value;
        }
        else {
            slot_kind[dst] = SQ_JIT_SLOT_LITERAL_OBJECT;
            stack_object_reg[dst] = -1;
            literal_object_index[dst] = literal_index;
            int_materialized[dst] = false;
            float_materialized[dst] = false;
            known_const[dst] = false;
        }
        return true;
    };

    auto ensure_int_slot = [&](SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slot_kind[slot] == SQ_JIT_SLOT_INT) {
            if(!int_materialized[slot]) {
                if(!known_const[slot] || !sqjit_native_emit_mov_mem_imm32(&buf, slot, const_value[slot])) {
                    return false;
                }
                int_materialized[slot] = true;
            }
            return true;
        }
        if(slot_kind[slot] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[slot] < 0) {
            return false;
        }
        if(!sqjit_native_emit_cmp_stack_type_i32(&buf, stack_object_reg[slot], OT_INTEGER) ||
            !emit_guard_fail_jump() ||
            !sqjit_native_emit_mov_rax_stack_value(&buf, stack_object_reg[slot]) ||
            !sqjit_native_emit_mov_mem_rax(&buf, slot)) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_SLOT_INT;
        stack_object_reg[slot] = -1;
        literal_object_index[slot] = -1;
        int_materialized[slot] = true;
        float_materialized[slot] = false;
        known_const[slot] = false;
        return true;
    };

    auto ensure_float_slot = [&](SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slot_kind[slot] == SQ_JIT_SLOT_FLOAT) {
            if(!float_materialized[slot]) {
                if(!known_const[slot] ||
                    !sqjit_native_emit_mov_local_float_const(&buf, slot, float_const_value[slot])) {
                    return false;
                }
                float_materialized[slot] = true;
            }
            return true;
        }
        if(slot_kind[slot] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[slot] < 0) {
            return false;
        }
        if(!sqjit_native_emit_cmp_stack_type_i32(&buf, stack_object_reg[slot], OT_FLOAT) ||
            !emit_guard_fail_jump() ||
            !sqjit_native_emit_mov_xmm0_stack_float_value(&buf, stack_object_reg[slot]) ||
            !sqjit_native_emit_mov_local_float_xmm0(&buf, slot)) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_SLOT_FLOAT;
        stack_object_reg[slot] = -1;
        literal_object_index[slot] = -1;
        int_materialized[slot] = false;
        float_materialized[slot] = true;
        known_const[slot] = false;
        return true;
    };

    auto emit_array_get_integer = [&](SQInteger dst, SQInteger base, SQInteger key) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || slot_kind[base] != SQ_JIT_SLOT_STACK_OBJECT ||
            stack_object_reg[base] < 0 || !ensure_int_slot(key)) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_mov_rdi_r13(&buf) ||
            !sqjit_native_emit_mov_rsi_i64(&buf, stack_object_reg[base]) ||
            !sqjit_native_emit_mov_rdx_mem(&buf, key) ||
            !sqjit_native_emit_lea_rcx_mem(&buf, dst) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_get_integer) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
            !sqjit_native_sync_pinned_slot_from_local(&buf, dst)) {
            return false;
        }
        slot_kind[dst] = SQ_JIT_SLOT_INT;
        stack_object_reg[dst] = -1;
        literal_object_index[dst] = -1;
        int_materialized[dst] = true;
        known_const[dst] = false;
        return true;
    };

    auto emit_array_get_integer_const = [&](SQInteger dst, SQInteger base, SQInteger index) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            slot_kind[base] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[base] < 0) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_mov_rdi_r13(&buf) ||
            !sqjit_native_emit_mov_rsi_i64(&buf, stack_object_reg[base]) ||
            !sqjit_native_emit_mov_rdx_i64(&buf, index) ||
            !sqjit_native_emit_lea_rcx_mem(&buf, dst) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_get_integer) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
            !sqjit_native_sync_pinned_slot_from_local(&buf, dst)) {
            return false;
        }
        slot_kind[dst] = SQ_JIT_SLOT_INT;
        stack_object_reg[dst] = -1;
        literal_object_index[dst] = -1;
        int_materialized[dst] = true;
        known_const[dst] = false;
        return true;
    };

    auto emit_array_get_float_const = [&](SQInteger dst, SQInteger base, SQInteger index) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            slot_kind[base] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[base] < 0) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_mov_rdi_r13(&buf) ||
            !sqjit_native_emit_mov_rsi_i64(&buf, stack_object_reg[base]) ||
            !sqjit_native_emit_mov_rdx_i64(&buf, index) ||
            !sqjit_native_emit_lea_rcx_mem(&buf, dst) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_get_float) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1)) {
            return false;
        }
        slot_kind[dst] = SQ_JIT_SLOT_FLOAT;
        stack_object_reg[dst] = -1;
        literal_object_index[dst] = -1;
        int_materialized[dst] = false;
        float_materialized[dst] = true;
        known_const[dst] = false;
        return true;
    };

    auto emit_table_get_integer_literal = [&](SQInteger dst, SQInteger base, SQInteger literal_index) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals ||
            slot_kind[base] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[base] < 0) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_mov_rdi_r13(&buf) ||
            !sqjit_native_emit_mov_rsi_i64(&buf, stack_object_reg[base]) ||
            !sqjit_native_emit_mov_rdx_i64(&buf, (SQInteger)(intptr_t)&proto->_literals[literal_index]) ||
            !sqjit_native_emit_lea_rcx_mem(&buf, dst) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_table_get_integer) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
            !sqjit_native_sync_pinned_slot_from_local(&buf, dst)) {
            return false;
        }
        slot_kind[dst] = SQ_JIT_SLOT_INT;
        stack_object_reg[dst] = -1;
        literal_object_index[dst] = -1;
        int_materialized[dst] = true;
        known_const[dst] = false;
        return true;
    };

    auto emit_table_get_float_literal = [&](SQInteger dst, SQInteger base, SQInteger literal_index) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals ||
            slot_kind[base] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[base] < 0) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_mov_rdi_r13(&buf) ||
            !sqjit_native_emit_mov_rsi_i64(&buf, stack_object_reg[base]) ||
            !sqjit_native_emit_mov_rdx_i64(&buf, (SQInteger)(intptr_t)&proto->_literals[literal_index]) ||
            !sqjit_native_emit_lea_rcx_mem(&buf, dst) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_table_get_float) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1)) {
            return false;
        }
        slot_kind[dst] = SQ_JIT_SLOT_FLOAT;
        stack_object_reg[dst] = -1;
        literal_object_index[dst] = -1;
        int_materialized[dst] = false;
        float_materialized[dst] = true;
        known_const[dst] = false;
        return true;
    };

    auto emit_outer_get_integer = [&](SQInteger dst, SQInteger outer_index) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || outer_index < 0 ||
            outer_index >= proto->_noutervalues) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_mov_rdi_mem(&buf, SQ_JIT_NATIVE_CLOSURE_SLOT) ||
            !sqjit_native_emit_mov_rsi_i64(&buf, outer_index) ||
            !sqjit_native_emit_lea_rdx_mem(&buf, dst) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_outer_get_integer) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
            !sqjit_native_sync_pinned_slot_from_local(&buf, dst)) {
            return false;
        }
        slot_kind[dst] = SQ_JIT_SLOT_INT;
        stack_object_reg[dst] = -1;
        literal_object_index[dst] = -1;
        int_materialized[dst] = true;
        float_materialized[dst] = false;
        known_const[dst] = false;
        return true;
    };

    auto emit_outer_get_float = [&](SQInteger dst, SQInteger outer_index) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || outer_index < 0 ||
            outer_index >= proto->_noutervalues) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_mov_rdi_mem(&buf, SQ_JIT_NATIVE_CLOSURE_SLOT) ||
            !sqjit_native_emit_mov_rsi_i64(&buf, outer_index) ||
            !sqjit_native_emit_lea_rdx_mem(&buf, dst) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_outer_get_float) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1)) {
            return false;
        }
        slot_kind[dst] = SQ_JIT_SLOT_FLOAT;
        stack_object_reg[dst] = -1;
        literal_object_index[dst] = -1;
        int_materialized[dst] = false;
        float_materialized[dst] = true;
        known_const[dst] = false;
        return true;
    };

    auto emit_new_array = [&](SQInteger dst, SQInteger reserve) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || reserve < 0) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_mov_rdi_r13(&buf) ||
            !sqjit_native_emit_mov_rsi_local_mem(&buf, SQ_JIT_NATIVE_CLOSURE_SLOT) ||
            !sqjit_native_emit_mov_rdx_i64(&buf, dst) ||
            !sqjit_native_emit_mov_rcx_imm64(&buf, reserve) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_new_array) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1)) {
            return false;
        }
        slot_kind[dst] = SQ_JIT_SLOT_STACK_OBJECT;
        stack_object_reg[dst] = dst;
        literal_object_index[dst] = -1;
        int_materialized[dst] = false;
        float_materialized[dst] = false;
        known_const[dst] = false;
        return true;
    };

    auto emit_append_array_stack = [&](SQInteger array_reg, SQInteger value_reg) -> bool {
        if(array_reg < 0 || array_reg >= MAX_FUNC_STACKSIZE ||
            value_reg < 0 || value_reg >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(slot_kind[value_reg] == SQ_JIT_SLOT_FLOAT) {
            if(!ensure_float_slot(value_reg) ||
                !sqjit_native_emit_mov_rdi_r13(&buf) ||
                !sqjit_native_emit_mov_rsi_i64(&buf, array_reg) ||
                !sqjit_native_emit_lea_rdx_mem(&buf, value_reg) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_append_float_local)) {
                return false;
            }
        }
        else {
            if(!ensure_int_slot(value_reg) ||
                !sqjit_native_emit_mov_rdi_r13(&buf) ||
                !sqjit_native_emit_mov_rsi_i64(&buf, array_reg) ||
                !sqjit_native_emit_mov_rdx_mem(&buf, value_reg) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_append_integer_local)) {
                return false;
            }
        }
        return sqjit_native_emit_call_rax(&buf) &&
            sqjit_native_emit_test_rax_rax(&buf) &&
            sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) &&
            sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1);
    };

    auto emit_append_array_integer = [&](SQInteger array_reg, SQInteger value) -> bool {
        if(array_reg < 0 || array_reg >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        SQInteger patch_offset = 0;
        return sqjit_native_emit_mov_rdi_r13(&buf) &&
            sqjit_native_emit_mov_rsi_i64(&buf, array_reg) &&
            sqjit_native_emit_mov_rdx_i64(&buf, value) &&
            sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_append_integer_local) &&
            sqjit_native_emit_call_rax(&buf) &&
            sqjit_native_emit_test_rax_rax(&buf) &&
            sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) &&
            sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1);
    };

    auto emit_return_stack_object = [&](SQInteger reg) -> bool {
        if(reg < 0 || reg >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        SQInteger patch_offset = 0;
        return sqjit_native_emit_mov_rdi_r13(&buf) &&
            sqjit_native_emit_mov_rsi_i64(&buf, reg) &&
            sqjit_native_emit_mov_rdx_r12(&buf) &&
            sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_return_stack_object) &&
            sqjit_native_emit_call_rax(&buf) &&
            sqjit_native_emit_test_rax_rax(&buf) &&
            sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) &&
            sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1);
    };

    auto mark_int_slot = [&](SQInteger slot) -> bool {
        if(slot == 0xFF) {
            return true;
        }
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_SLOT_INT;
        stack_object_reg[slot] = -1;
        literal_object_index[slot] = -1;
        int_materialized[slot] = true;
        float_materialized[slot] = false;
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
        slot_kind[slot] = SQ_JIT_SLOT_FLOAT;
        stack_object_reg[slot] = -1;
        literal_object_index[slot] = -1;
        int_materialized[slot] = false;
        float_materialized[slot] = true;
        known_const[slot] = false;
        return true;
    };

    auto copy_int_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == 0xFF) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || !ensure_int_slot(src) ||
            !sqjit_native_emit_mov_rax_mem(&buf, src) ||
            !sqjit_native_emit_mov_mem_rax(&buf, dst) ||
            !mark_int_slot(dst)) {
            return false;
        }
        known_const[dst] = known_const[src];
        const_value[dst] = const_value[src];
        return true;
    };

    auto copy_float_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == 0xFF) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || !ensure_float_slot(src) ||
            !sqjit_native_emit_mov_xmm0_local_float(&buf, src) ||
            !sqjit_native_emit_mov_local_float_xmm0(&buf, dst) ||
            !mark_float_slot(dst)) {
            return false;
        }
        known_const[dst] = known_const[src];
        float_const_value[dst] = float_const_value[src];
        return true;
    };

    auto emit_array_set_integer = [&](SQInteger target, SQInteger base, SQInteger key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || value < 0 || value >= MAX_FUNC_STACKSIZE ||
            slot_kind[base] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[base] < 0 ||
            !ensure_int_slot(key) || !ensure_int_slot(value)) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) ||
            !sqjit_native_emit_mov_rsi_r13(&buf) ||
            !sqjit_native_emit_mov_rdx_i64(&buf, stack_object_reg[base]) ||
            !sqjit_native_emit_mov_rcx_mem(&buf, key) ||
            !sqjit_native_emit_mov_r8_mem(&buf, value) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_set_integer_logged) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
            !copy_int_slot(target, value)) {
            return false;
        }
        return true;
    };

    auto emit_array_set_integer_const = [&](SQInteger target, SQInteger base, SQInteger index, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            value < 0 || value >= MAX_FUNC_STACKSIZE ||
            slot_kind[base] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[base] < 0 ||
            !ensure_int_slot(value)) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) ||
            !sqjit_native_emit_mov_rsi_r13(&buf) ||
            !sqjit_native_emit_mov_rdx_i64(&buf, stack_object_reg[base]) ||
            !sqjit_native_emit_mov_rcx_imm64(&buf, index) ||
            !sqjit_native_emit_mov_r8_mem(&buf, value) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_set_integer_logged) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
            !copy_int_slot(target, value)) {
            return false;
        }
        return true;
    };

    auto emit_array_set_float = [&](SQInteger target, SQInteger base, SQInteger key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || value < 0 || value >= MAX_FUNC_STACKSIZE ||
            slot_kind[base] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[base] < 0 ||
            !ensure_int_slot(key) || !ensure_float_slot(value)) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) ||
            !sqjit_native_emit_mov_rsi_r13(&buf) ||
            !sqjit_native_emit_mov_rdx_i64(&buf, stack_object_reg[base]) ||
            !sqjit_native_emit_mov_rcx_mem(&buf, key) ||
            !sqjit_native_emit_lea_r8_mem(&buf, value) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_set_float_logged) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
            !copy_float_slot(target, value)) {
            return false;
        }
        return true;
    };

    auto emit_array_set_float_const = [&](SQInteger target, SQInteger base, SQInteger index, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            value < 0 || value >= MAX_FUNC_STACKSIZE ||
            slot_kind[base] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[base] < 0 ||
            !ensure_float_slot(value)) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) ||
            !sqjit_native_emit_mov_rsi_r13(&buf) ||
            !sqjit_native_emit_mov_rdx_i64(&buf, stack_object_reg[base]) ||
            !sqjit_native_emit_mov_rcx_imm64(&buf, index) ||
            !sqjit_native_emit_lea_r8_mem(&buf, value) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_set_float_logged) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
            !copy_float_slot(target, value)) {
            return false;
        }
        return true;
    };

    auto emit_table_set_integer_literal = [&](SQInteger target, SQInteger base, SQInteger literal_index, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals ||
            value < 0 || value >= MAX_FUNC_STACKSIZE ||
            slot_kind[base] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[base] < 0 ||
            !ensure_int_slot(value)) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) ||
            !sqjit_native_emit_mov_rsi_r13(&buf) ||
            !sqjit_native_emit_mov_rdx_i64(&buf, stack_object_reg[base]) ||
            !sqjit_native_emit_mov_rcx_imm64(&buf, (SQInteger)(intptr_t)&proto->_literals[literal_index]) ||
            !sqjit_native_emit_mov_r8_mem(&buf, value) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_table_set_integer_logged) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
            !copy_int_slot(target, value)) {
            return false;
        }
        return true;
    };

    auto emit_table_set_float_literal = [&](SQInteger target, SQInteger base, SQInteger literal_index, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals ||
            value < 0 || value >= MAX_FUNC_STACKSIZE ||
            slot_kind[base] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[base] < 0 ||
            !ensure_float_slot(value)) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) ||
            !sqjit_native_emit_mov_rsi_r13(&buf) ||
            !sqjit_native_emit_mov_rdx_i64(&buf, stack_object_reg[base]) ||
            !sqjit_native_emit_mov_rcx_imm64(&buf, (SQInteger)(intptr_t)&proto->_literals[literal_index]) ||
            !sqjit_native_emit_lea_r8_mem(&buf, value) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_table_set_float_logged) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
            !copy_float_slot(target, value)) {
            return false;
        }
        return true;
    };

    auto slot_is_observed_float = [&](SQInteger slot) -> bool {
        return slot >= 0 && slot < MAX_FUNC_STACKSIZE &&
            ((slot_kind[slot] == SQ_JIT_SLOT_FLOAT) ||
            (slot_kind[slot] == SQ_JIT_SLOT_STACK_OBJECT && stack_object_reg[slot] >= 0 &&
                sq_type(entry_stack[stack_object_reg[slot]]) == OT_FLOAT));
    };

    auto emit_integer_equality = [&](SQInteger target, SQInteger left, SQInteger right, bool negated, bool right_is_literal) -> bool {
        if(target < 0 || target >= MAX_FUNC_STACKSIZE || !ensure_int_slot(left) ||
            !sqjit_native_emit_mov_rax_mem(&buf, left)) {
            return false;
        }
        if(right_is_literal) {
            if(right < 0 || right >= proto->_nliterals ||
                sq_type(proto->_literals[right]) != OT_INTEGER ||
                !sqjit_native_is_int32(_integer(proto->_literals[right])) ||
                !sqjit_native_emit_cmp_rax_i32(&buf, _integer(proto->_literals[right]))) {
                return false;
            }
        }
        else {
            if(!ensure_int_slot(right) || !sqjit_native_emit_cmp_rax_mem(&buf, right)) {
                return false;
            }
        }
        if(!sqjit_native_emit_setcc_rax(&buf, negated ? 0x95 : 0x94) ||
            !sqjit_native_emit_mov_mem_rax(&buf, target) ||
            !mark_int_slot(target)) {
            return false;
        }
        return true;
    };

    auto slot_is_float = [&](SQInteger slot) -> bool {
        return slot >= 0 && slot < MAX_FUNC_STACKSIZE && slot_kind[slot] == SQ_JIT_SLOT_FLOAT;
    };

    auto emit_float_binary = [&](SQOpcode op, SQInteger dst, SQInteger left, SQInteger right) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            !ensure_float_slot(left) || !ensure_float_slot(right) ||
            !sqjit_native_emit_mov_xmm0_local_float(&buf, left) ||
            !sqjit_native_emit_float_op_xmm0_local(&buf, op, right) ||
            !sqjit_native_emit_mov_local_float_xmm0(&buf, dst) ||
            !mark_float_slot(dst)) {
            return false;
        }
        return true;
    };

    auto observed_stack_reg = [&](SQInteger slot) -> SQInteger {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE || slot_kind[slot] != SQ_JIT_SLOT_STACK_OBJECT) {
            return -1;
        }
        return stack_object_reg[slot];
    };

    for(SQInteger ip = 0; ip < proto->_ninstructions; ip++) {
        // A value initialized before a loop is not constant in its body when
        // the backedge can change it (notably an array index incremented at
        // the end). Materialize the initial value before the jump target.
        for(SQInteger back = ip; back < proto->_ninstructions; back++) {
            const SQInstruction &branch = proto->_instructions[back];
            if((branch.op != _OP_JMP && branch.op != _OP_JZ && branch.op != _OP_JCMP) ||
                back + 1 + sqjit_signed_arg1(branch) != ip) continue;
            for(SQInteger slot = 0; slot < proto->_stacksize; slot++) {
                if(!known_const[slot]) continue;
                bool written = false;
                for(SQInteger body = ip; body <= back && !written; body++)
                    written = sqjit_loop_instruction_writes_slot(proto->_instructions[body], slot);
                if(!written) continue;
                if(slot_kind[slot] == SQ_JIT_SLOT_INT && !ensure_int_slot(slot)) return false;
                if(slot_kind[slot] == SQ_JIT_SLOT_FLOAT && !ensure_float_slot(slot)) return false;
                known_const[slot] = false;
            }
        }
        ip_to_offset[ip] = buf.size;
        attempt.SetIP(ip);
        const SQInstruction &inst = proto->_instructions[ip];

        switch(inst.op) {
            case _OP_LINE:
                break;
            case _OP_LOADINT: {
                SQInteger value = sqjit_loadint_value(inst);
                bool materialize_int = !sqjit_next_consumes_load_as_immediate(proto, ip, inst._arg0);
                if(materialize_int && !sqjit_native_emit_mov_mem_imm32(&buf, inst._arg0, value)) {
                    return false;
                }
                slot_kind[inst._arg0] = SQ_JIT_SLOT_INT;
                stack_object_reg[inst._arg0] = -1;
                literal_object_index[inst._arg0] = -1;
                int_materialized[inst._arg0] = materialize_int;
                known_const[inst._arg0] = true;
                const_value[inst._arg0] = value;
                break;
            }
            case _OP_LOADFLOAT: {
                SQFloat value;
                if(!sqjit_loadfloat_value(inst, &value) ||
                    !sqjit_native_emit_mov_local_float_const(&buf, inst._arg0, value)) {
                    return false;
                }
                slot_kind[inst._arg0] = SQ_JIT_SLOT_FLOAT;
                stack_object_reg[inst._arg0] = -1;
                literal_object_index[inst._arg0] = -1;
                int_materialized[inst._arg0] = false;
                float_materialized[inst._arg0] = true;
                known_const[inst._arg0] = true;
                float_const_value[inst._arg0] = value;
                break;
            }
            case _OP_LOAD: {
                if(!load_literal_slot(inst._arg0, inst._arg1,
                    !sqjit_next_consumes_load_as_immediate(proto, ip, inst._arg0))) {
                    return false;
                }
                break;
            }
            case _OP_DLOAD: {
                if(!load_literal_slot(inst._arg0, inst._arg1,
                    !sqjit_next_consumes_load_as_immediate(proto, ip, inst._arg0)) ||
                    !load_literal_slot(inst._arg2, inst._arg3,
                    !sqjit_next_consumes_load_as_immediate(proto, ip, inst._arg2))) {
                    return false;
                }
                break;
            }
            case _OP_MOVE:
                if(slot_kind[inst._arg1] == SQ_JIT_SLOT_FLOAT) {
                    if(!copy_float_slot(inst._arg0, inst._arg1)) {
                        return false;
                    }
                }
                else if(slot_kind[inst._arg1] == SQ_JIT_SLOT_INT) {
                    if(!ensure_int_slot(inst._arg1) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                    slot_kind[inst._arg0] = SQ_JIT_SLOT_INT;
                    stack_object_reg[inst._arg0] = -1;
                    literal_object_index[inst._arg0] = -1;
                    int_materialized[inst._arg0] = true;
                    float_materialized[inst._arg0] = false;
                }
                else if(slot_kind[inst._arg1] == SQ_JIT_SLOT_STACK_OBJECT) {
                    slot_kind[inst._arg0] = SQ_JIT_SLOT_STACK_OBJECT;
                    stack_object_reg[inst._arg0] = stack_object_reg[inst._arg1];
                    literal_object_index[inst._arg0] = -1;
                    int_materialized[inst._arg0] = false;
                    float_materialized[inst._arg0] = false;
                }
                else if(slot_kind[inst._arg1] == SQ_JIT_SLOT_LITERAL_OBJECT) {
                    slot_kind[inst._arg0] = SQ_JIT_SLOT_LITERAL_OBJECT;
                    stack_object_reg[inst._arg0] = -1;
                    literal_object_index[inst._arg0] = literal_object_index[inst._arg1];
                    int_materialized[inst._arg0] = false;
                    float_materialized[inst._arg0] = false;
                }
                else {
                    return false;
                }
                known_const[inst._arg0] = known_const[inst._arg1];
                const_value[inst._arg0] = const_value[inst._arg1];
                break;
            case _OP_GETOUTER:
                if(sqjit_observed_outer_value_type(closure, inst._arg1) == OT_FLOAT) {
                    if(!emit_outer_get_float(inst._arg0, inst._arg1)) {
                        return false;
                    }
                }
                else if(!emit_outer_get_integer(inst._arg0, inst._arg1)) {
                    return false;
                }
                break;
            case _OP_GET:
                if(slot_kind[inst._arg2] == SQ_JIT_SLOT_LITERAL_OBJECT) {
                    SQInteger literal_index = literal_object_index[inst._arg2];
                    if(literal_index < 0 || literal_index >= proto->_nliterals) {
                        return false;
                    }
                    if(sq_type(proto->_literals[literal_index]) == OT_INTEGER) {
                        SQInteger index = _integer(proto->_literals[literal_index]);
                        SQObjectType observed = sqjit_observed_array_value_type(entry_stack,
                            observed_stack_reg(inst._arg1), index);
                        if(observed == OT_FLOAT) {
                            if(!emit_array_get_float_const(inst._arg0, inst._arg1, index)) {
                                return false;
                            }
                        }
                        else if(!emit_array_get_integer_const(inst._arg0, inst._arg1, index)) {
                            return false;
                        }
                    }
                    else {
                        SQObjectType observed = sqjit_observed_table_value_type(entry_stack,
                            observed_stack_reg(inst._arg1), &proto->_literals[literal_index]);
                        if(observed == OT_FLOAT) {
                            if(!emit_table_get_float_literal(inst._arg0, inst._arg1, literal_index)) {
                                return false;
                            }
                        }
                        else if(!emit_table_get_integer_literal(inst._arg0, inst._arg1, literal_index)) {
                            return false;
                        }
                    }
                }
                else if(known_const[inst._arg2]) {
                    SQInteger index = const_value[inst._arg2];
                    SQObjectType observed = sqjit_observed_array_value_type(entry_stack,
                        observed_stack_reg(inst._arg1), index);
                    if(observed == OT_FLOAT) {
                        if(!emit_array_get_float_const(inst._arg0, inst._arg1, index)) {
                            return false;
                        }
                    }
                    else if(!emit_array_get_integer_const(inst._arg0, inst._arg1, index)) {
                        return false;
                    }
                }
                else {
                    if(!emit_array_get_integer(inst._arg0, inst._arg1, inst._arg2)) {
                        return false;
                    }
                }
                break;
            case _OP_GETK:
                if(inst._arg1 < 0 || inst._arg1 >= proto->_nliterals) {
                    return false;
                }
                if(sq_type(proto->_literals[inst._arg1]) == OT_INTEGER) {
                    SQInteger index = _integer(proto->_literals[inst._arg1]);
                    SQObjectType observed = sqjit_observed_array_value_type(entry_stack,
                        observed_stack_reg(inst._arg2), index);
                    if(observed == OT_FLOAT) {
                        if(!emit_array_get_float_const(inst._arg0, inst._arg2, index)) {
                            return false;
                        }
                    }
                    else if(!emit_array_get_integer_const(inst._arg0, inst._arg2, index)) {
                        return false;
                    }
                }
                else {
                    SQObjectType observed = sqjit_observed_table_value_type(entry_stack,
                        observed_stack_reg(inst._arg2), &proto->_literals[inst._arg1]);
                    if(observed == OT_FLOAT) {
                        if(!emit_table_get_float_literal(inst._arg0, inst._arg2, inst._arg1)) {
                            return false;
                        }
                    }
                    else if(!emit_table_get_integer_literal(inst._arg0, inst._arg2, inst._arg1)) {
                        return false;
                    }
                }
                break;
            case _OP_NEWOBJ:
                if(inst._arg3 != NOT_ARRAY || !emit_new_array(inst._arg0, inst._arg1)) {
                    return false;
                }
                break;
            case _OP_APPENDARRAY:
                if(inst._arg2 == AAT_STACK) {
                    if(!emit_append_array_stack(inst._arg0, inst._arg1)) {
                        return false;
                    }
                }
                else if(inst._arg2 == AAT_INT) {
                    if(!emit_append_array_integer(inst._arg0, sqjit_loadint_value(inst))) {
                        return false;
                    }
                }
                else {
                    return false;
                }
                break;
            case _OP_SET:
                if(slot_kind[inst._arg2] == SQ_JIT_SLOT_LITERAL_OBJECT) {
                    SQInteger literal_index = literal_object_index[inst._arg2];
                    if(literal_index < 0 || literal_index >= proto->_nliterals) {
                        return false;
                    }
                    if(sq_type(proto->_literals[literal_index]) == OT_INTEGER) {
                        if(slot_is_observed_float(inst._arg3)) {
                            if(!emit_array_set_float_const(inst._arg0, inst._arg1,
                                _integer(proto->_literals[literal_index]), inst._arg3)) {
                                return false;
                            }
                        }
                        else if(!emit_array_set_integer_const(inst._arg0, inst._arg1,
                            _integer(proto->_literals[literal_index]), inst._arg3)) {
                            return false;
                        }
                    }
                    else if(slot_is_observed_float(inst._arg3)) {
                        if(!emit_table_set_float_literal(inst._arg0, inst._arg1,
                            literal_index, inst._arg3)) {
                            return false;
                        }
                    }
                    else if(!emit_table_set_integer_literal(inst._arg0, inst._arg1,
                        literal_index, inst._arg3)) {
                        return false;
                    }
                }
                else if(known_const[inst._arg2]) {
                    if(slot_is_observed_float(inst._arg3)) {
                        if(!emit_array_set_float_const(inst._arg0, inst._arg1,
                            const_value[inst._arg2], inst._arg3)) {
                            return false;
                        }
                    }
                    else if(!emit_array_set_integer_const(inst._arg0, inst._arg1,
                        const_value[inst._arg2], inst._arg3)) {
                        return false;
                    }
                }
                else if(slot_is_observed_float(inst._arg3)) {
                    if(!emit_array_set_float(inst._arg0, inst._arg1, inst._arg2, inst._arg3)) {
                        return false;
                    }
                }
                else if(!emit_array_set_integer(inst._arg0, inst._arg1, inst._arg2, inst._arg3)) {
                    return false;
                }
                break;
            case _OP_EQ:
            case _OP_NE:
                if(!emit_integer_equality(inst._arg0, inst._arg2, inst._arg1,
                    inst.op == _OP_NE, inst._arg3 != 0)) {
                    return false;
                }
                break;
            case _OP_ADD:
                {
                if(slot_is_float(inst._arg1) || slot_is_float(inst._arg2)) {
                    if(!emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                        return false;
                    }
                    break;
                }
                SQInteger imm = 0;
                if(sqjit_previous_loads_int_const(proto, ip, inst._arg1, &imm) && sqjit_native_is_int32(imm)) {
                    if(!ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_add_rax_i32(&buf, imm) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                }
                else if(sqjit_previous_loads_int_const(proto, ip, inst._arg2, &imm) && sqjit_native_is_int32(imm)) {
                    if(!ensure_int_slot(inst._arg1) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_add_rax_i32(&buf, imm) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                }
                else {
                    if(!ensure_int_slot(inst._arg1) || !ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_add_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                }
                slot_kind[inst._arg0] = SQ_JIT_SLOT_INT;
                stack_object_reg[inst._arg0] = -1;
                literal_object_index[inst._arg0] = -1;
                int_materialized[inst._arg0] = true;
                float_materialized[inst._arg0] = false;
                known_const[inst._arg0] = false;
                break;
                }
            case _OP_SUB:
                {
                if(slot_is_float(inst._arg1) || slot_is_float(inst._arg2)) {
                    if(!emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                        return false;
                    }
                    break;
                }
                SQInteger imm = 0;
                if(sqjit_previous_loads_int_const(proto, ip, inst._arg1, &imm) && sqjit_native_is_int32(imm)) {
                    if(!ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_sub_rax_i32(&buf, imm) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                }
                else {
                    if(!ensure_int_slot(inst._arg1) || !ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_sub_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                }
                slot_kind[inst._arg0] = SQ_JIT_SLOT_INT;
                stack_object_reg[inst._arg0] = -1;
                literal_object_index[inst._arg0] = -1;
                int_materialized[inst._arg0] = true;
                float_materialized[inst._arg0] = false;
                known_const[inst._arg0] = false;
                break;
                }
            case _OP_MUL:
                {
                if(slot_is_float(inst._arg1) || slot_is_float(inst._arg2)) {
                    if(!emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                        return false;
                    }
                    break;
                }
                SQInteger imm = 0;
                if(sqjit_previous_loads_int_const(proto, ip, inst._arg1, &imm) && sqjit_native_is_int32(imm)) {
                    if(!ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_imul_rax_i32(&buf, imm) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                }
                else if(sqjit_previous_loads_int_const(proto, ip, inst._arg2, &imm) && sqjit_native_is_int32(imm)) {
                    if(!ensure_int_slot(inst._arg1) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_imul_rax_i32(&buf, imm) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                }
                else {
                    if(!ensure_int_slot(inst._arg1) || !ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_imul_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                }
                slot_kind[inst._arg0] = SQ_JIT_SLOT_INT;
                stack_object_reg[inst._arg0] = -1;
                literal_object_index[inst._arg0] = -1;
                int_materialized[inst._arg0] = true;
                float_materialized[inst._arg0] = false;
                known_const[inst._arg0] = false;
                break;
                }
            case _OP_DIV:
                if(!emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                    return false;
                }
                break;
            case _OP_MOD: {
                SQInteger divisor = 0;
                if(!ensure_int_slot(inst._arg2) || !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2)) {
                    return false;
                }
                if(sqjit_previous_loads_positive_int_const(proto, ip, inst._arg1) &&
                    sqjit_previous_loads_int_const(proto, ip, inst._arg1, &divisor) &&
                    sqjit_native_is_int32(divisor)) {
                    if(!sqjit_native_emit_mov_rcx_imm64(&buf, divisor)) {
                        return false;
                    }
                }
                else {
                    SQInteger patch_offset = 0;
                    if(!ensure_int_slot(inst._arg1) ||
                        !sqjit_native_emit_mov_rcx_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_cmp_rcx_i32(&buf, 0) ||
                        !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_LE, &patch_offset) ||
                        !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                            MAX_FUNC_STACKSIZE + 512, patch_offset, -1)) {
                        return false;
                    }
                }
                if(!sqjit_native_emit_idiv_rcx(&buf) ||
                    !sqjit_native_emit_mov_rax_rdx(&buf) ||
                    !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                    return false;
                }
                slot_kind[inst._arg0] = SQ_JIT_SLOT_INT;
                stack_object_reg[inst._arg0] = -1;
                literal_object_index[inst._arg0] = -1;
                int_materialized[inst._arg0] = true;
                float_materialized[inst._arg0] = false;
                known_const[inst._arg0] = false;
                break;
            }
            case _OP_PINCL: {
                SQInteger delta = sqjit_signed_arg3(inst);
                if(!ensure_int_slot(inst._arg1) || !sqjit_native_is_int32(delta)) {
                    return false;
                }
                if(!sqjit_native_emit_mov_rax_mem(&buf, inst._arg1) ||
                    !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0) ||
                    !sqjit_native_emit_add_mem_i32(&buf, inst._arg1, delta)) {
                    return false;
                }
                slot_kind[inst._arg0] = SQ_JIT_SLOT_INT;
                stack_object_reg[inst._arg0] = -1;
                literal_object_index[inst._arg0] = -1;
                int_materialized[inst._arg0] = true;
                float_materialized[inst._arg0] = false;
                known_const[inst._arg0] = known_const[inst._arg1];
                const_value[inst._arg0] = const_value[inst._arg1];
                known_const[inst._arg1] = false;
                break;
            }
            case _OP_JMP: {
                SQInteger patch_offset = 0;
                SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
                if(target_ip < 0 || target_ip > proto->_ninstructions ||
                    !sqjit_native_emit_jmp_placeholder(&buf, &patch_offset) ||
                    !sqjit_native_record_reloc(relocs, &nrelocs, 512, patch_offset, target_ip)) {
                    return false;
                }
                break;
            }
            case _OP_JZ: {
                SQInteger patch_offset = 0;
                SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
                if(!ensure_int_slot(inst._arg0) ||
                    target_ip < 0 || target_ip > proto->_ninstructions ||
                    !sqjit_native_emit_mov_rax_mem(&buf, inst._arg0) ||
                    !sqjit_native_emit_cmp_rax_i32(&buf, 0) ||
                    !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
                    !sqjit_native_record_reloc(relocs, &nrelocs, 512, patch_offset, target_ip)) {
                    return false;
                }
                break;
            }
            case _OP_JCMP: {
                SQJitNativeJcc jcc;
                SQInteger patch_offset = 0;
                SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
                if(target_ip < 0 || target_ip > proto->_ninstructions) {
                    return false;
                }
                if(slot_is_float(inst._arg0) || slot_is_float(inst._arg2)) {
                    if(!ensure_float_slot(inst._arg0) || !ensure_float_slot(inst._arg2) ||
                        !sqjit_native_float_cmp_false_jcc((CmpOP)inst._arg3, &jcc) ||
                        !sqjit_native_emit_mov_xmm0_local_float(&buf, inst._arg2) ||
                        !sqjit_native_emit_ucomi_xmm0_local_float(&buf, inst._arg0) ||
                        !sqjit_native_emit_jcc_placeholder(&buf, jcc, &patch_offset) ||
                        !sqjit_native_record_reloc(relocs, &nrelocs, 512, patch_offset, target_ip)) {
                        return false;
                    }
                }
                else if(!ensure_int_slot(inst._arg0) || !ensure_int_slot(inst._arg2) ||
                    !sqjit_native_cmp_false_jcc((CmpOP)inst._arg3, &jcc) ||
                    !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                    !sqjit_native_emit_cmp_rax_mem(&buf, inst._arg0) ||
                    !sqjit_native_emit_jcc_placeholder(&buf, jcc, &patch_offset) ||
                    !sqjit_native_record_reloc(relocs, &nrelocs, 512, patch_offset, target_ip)) {
                    return false;
                }
                break;
            }
            case _OP_RETURN:
                if(inst._arg0 == 0xFF) {
                    if(ip == 0 ||
                        (proto->_instructions[ip - 1].op != _OP_RETURN && proto->_instructions[ip - 1].op != _OP_JMP)) {
                        return false;
                    }
                    for(SQInteger n = 0; n < nrelocs; n++) {
                        if(relocs[n].target_ip == ip) {
                            return false;
                        }
                    }
                    break;
                }
                if(slot_is_float(inst._arg1)) {
                    if(!ensure_float_slot(inst._arg1) ||
                        !sqjit_native_emit_store_out_float_from_local(&buf, inst._arg1)) {
                        return false;
                    }
                }
                else if(slot_kind[inst._arg1] == SQ_JIT_SLOT_STACK_OBJECT &&
                    stack_object_reg[inst._arg1] >= 0) {
                    if(!emit_return_stack_object(stack_object_reg[inst._arg1])) {
                        return false;
                    }
                }
                else {
                    if(!ensure_int_slot(inst._arg1) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_store_out_integer_from_rax(&buf)) {
                        return false;
                    }
                }
                if(!emit_write_log_release(false) ||
                    !sqjit_native_emit_mov_rsp_rbp(&buf) ||
                    !sqjit_native_emit_pop_r15(&buf) ||
                    !sqjit_native_emit_pop_r14(&buf) ||
                    !sqjit_native_emit_pop_rbx(&buf) ||
                    !sqjit_native_emit_pop_r13(&buf) ||
                    !sqjit_native_emit_pop_r12(&buf) ||
                    !sqjit_native_emit_pop_abi_preserved_arg_regs(&buf) ||
                    !sqjit_native_emit_pop_rbp(&buf) ||
                    !sqjit_native_emit_mov_eax_i32(&buf, SQ_JIT_NATIVE_RETURNED) ||
                    !sqjit_native_emit_ret(&buf)) {
                    return false;
                }
                break;
            default:
                return attempt.Reject(ip, SQ_JIT_REJECT_OPCODE, "unsupported opcode");
        }
    }

    ip_to_offset[proto->_ninstructions] = buf.size;
    SQInteger guard_fail_offset = buf.size;
    if(!emit_write_log_release(true) ||
        !sqjit_native_emit_mov_rsp_rbp(&buf) ||
        !sqjit_native_emit_pop_r15(&buf) ||
        !sqjit_native_emit_pop_r14(&buf) ||
        !sqjit_native_emit_pop_rbx(&buf) ||
        !sqjit_native_emit_pop_r13(&buf) ||
        !sqjit_native_emit_pop_r12(&buf) ||
        !sqjit_native_emit_pop_abi_preserved_arg_regs(&buf) ||
        !sqjit_native_emit_pop_rbp(&buf) ||
        !sqjit_native_emit_mov_eax_i32(&buf, SQ_JIT_NATIVE_GUARD_FAILED) ||
        !sqjit_native_emit_ret(&buf)) {
        return false;
    }

    for(SQInteger n = 0; n < nrelocs; n++) {
        SQInteger target_offset = ip_to_offset[relocs[n].target_ip];
        if(target_offset < 0) {
            return false;
        }
        SQInteger rel = target_offset - (relocs[n].patch_offset + 4);
        if(!sqjit_native_patch_i32(&buf, relocs[n].patch_offset, rel)) {
            return false;
        }
    }
    for(SQInteger n = 0; n < nguard_fail_relocs; n++) {
        SQInteger rel = guard_fail_offset - (guard_fail_relocs[n].patch_offset + 4);
        if(!sqjit_native_patch_i32(&buf, guard_fail_relocs[n].patch_offset, rel)) {
            return false;
        }
    }

    return sqjit_native_install(native, &buf) ||
        attempt.Reject(-1, SQ_JIT_REJECT_RESOURCE, "executable memory installation failed");
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

static bool sqjit_loop_instruction_reads_slot(const SQInstruction &inst, SQInteger slot)
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

static bool sqjit_loop_instruction_reads_int_slot(const SQInstruction &inst, SQInteger slot)
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

static bool sqjit_loop_instruction_writes_slot(const SQInstruction &inst, SQInteger slot)
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

static bool sqjit_loop_slot_is_live_out(SQFunctionProto *proto, SQInteger exit_ip, SQInteger slot)
{
    if(!proto || exit_ip < 0 || exit_ip > proto->_ninstructions) {
        return false;
    }

    for(SQInteger ip = exit_ip; ip < proto->_ninstructions; ip++) {
        const SQInstruction &inst = proto->_instructions[ip];
        if(sqjit_loop_instruction_reads_slot(inst, slot)) {
            return true;
        }
        if(sqjit_loop_instruction_writes_slot(inst, slot)) {
            return false;
        }
    }

    return false;
}

static bool compile_loop(SQFunctionProto *proto, SQObjectPtr *entry_stack,
    SQClosure *closure, SQInteger start_ip, SQInteger header_ip, SQInteger end_ip, SQInteger exit_ip,
    SQJitProto *jit, SQJitCompileAttempt &attempt)
{
    if(!proto || !entry_stack || !jit || start_ip < 0 || header_ip < start_ip || end_ip < header_ip || end_ip >= proto->_ninstructions ||
        exit_ip <= header_ip || exit_ip > proto->_ninstructions ||
        proto->_stacksize <= 0 || proto->_stacksize > MAX_FUNC_STACKSIZE ||
        end_ip - start_ip > 512) {
        return attempt.Reject(-1, SQ_JIT_REJECT_INVALID_BYTECODE, "invalid compilation bounds or unsupported function shape");
    }

    SQInteger ip_to_offset[513];
    SQJitNativeReloc relocs[512];
    SQInteger nrelocs = 0;
    SQJitNativeReloc exit_relocs[128];
    SQInteger nexit_relocs = 0;
    SQJitNativeReloc guard_fail_relocs[MAX_FUNC_STACKSIZE + 512];
    SQInteger nguard_fail_relocs = 0;
    SQJitSlotKind slot_kind[MAX_FUNC_STACKSIZE];
    SQInteger stack_object_reg[MAX_FUNC_STACKSIZE];
    SQInteger literal_object_index[MAX_FUNC_STACKSIZE];
    bool int_materialized[MAX_FUNC_STACKSIZE];
    bool float_materialized[MAX_FUNC_STACKSIZE];
    bool known_const[MAX_FUNC_STACKSIZE];
    bool entry_loaded[MAX_FUNC_STACKSIZE];
    bool dirty_slot[MAX_FUNC_STACKSIZE];
    SQInteger const_value[MAX_FUNC_STACKSIZE];
    SQFloat float_const_value[MAX_FUNC_STACKSIZE];
    for(SQInteger n = 0; n < 513; n++) {
        ip_to_offset[n] = -1;
    }
    for(SQInteger n = 0; n < MAX_FUNC_STACKSIZE; n++) {
        slot_kind[n] = SQ_JIT_SLOT_STACK_OBJECT;
        stack_object_reg[n] = n;
        literal_object_index[n] = -1;
        int_materialized[n] = false;
        float_materialized[n] = false;
        known_const[n] = false;
        entry_loaded[n] = false;
        dirty_slot[n] = false;
        const_value[n] = 0;
        float_const_value[n] = 0;
    }

    SQJitNativeCodeBuffer buf;
    buf.size = 0;

    bool uses_write_log = false;
    for(SQInteger ip = start_ip; ip <= end_ip; ip++) {
        if(proto->_instructions[ip].op == _OP_SET) {
            uses_write_log = true;
            break;
        }
    }

    SQInteger last_reserved_slot = uses_write_log ? SQ_JIT_NATIVE_WRITE_LOG_SLOT : SQ_JIT_NATIVE_CLOSURE_SLOT;
    SQInteger frame_size = (last_reserved_slot + 1) * (SQInteger)sizeof(SQInteger);
    frame_size = ((frame_size + 15) & ~(SQInteger)15) + 8;

    if(!sqjit_native_emit_push_rbp(&buf) ||
        !sqjit_native_emit_push_abi_preserved_arg_regs(&buf) ||
        !sqjit_native_emit_push_r12(&buf) ||
        !sqjit_native_emit_push_r13(&buf) ||
        !sqjit_native_emit_push_rbx(&buf) ||
        !sqjit_native_emit_push_r14(&buf) ||
        !sqjit_native_emit_push_r15(&buf) ||
        !sqjit_native_emit_mov_rbp_rsp(&buf) ||
        !sqjit_native_emit_sub_rsp_i32(&buf, frame_size) ||
        !sqjit_native_emit_mov_r12_rsi(&buf) ||
        !sqjit_native_emit_mov_r13_rdi(&buf) ||
        !sqjit_native_emit_mov_rax_arg3(&buf) ||
        !sqjit_native_emit_mov_local_mem_rax(&buf, SQ_JIT_NATIVE_CLOSURE_SLOT)) {
        return false;
    }
    if(uses_write_log && !sqjit_native_emit_mov_mem_imm32(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT, 0)) {
        return false;
    }

    if(sqjit_diag_trace_enabled(proto)) {
        scprintf(_SC("[sqjit] compiling loop region '%s' ip %d..%d branch %d exit %d\n"),
            (sq_type(proto->_name) == OT_STRING ? _stringval(proto->_name) : _SC("<anonymous>")), (SQInt32)start_ip, (SQInt32)end_ip,
            (SQInt32)header_ip, (SQInt32)exit_ip);
    }

    auto emit_guard_fail_jump = [&]() -> bool {
        SQInteger patch_offset = 0;
        return sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_NE, &patch_offset) &&
            sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1);
    };

    auto emit_write_log_release = [&](bool rollback) -> bool {
        if(!uses_write_log) {
            return true;
        }
        return sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) &&
            sqjit_native_emit_mov_rax_ptr(&buf, rollback ?
                (const void *)sqjit_helper_write_log_rollback :
                (const void *)sqjit_helper_write_log_commit) &&
            sqjit_native_emit_call_rax(&buf);
    };

    auto load_literal_slot = [&](SQInteger dst, SQInteger literal_index, bool materialize_int) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals) {
            return false;
        }
        if(sq_type(proto->_literals[literal_index]) == OT_INTEGER) {
            if(!sqjit_native_is_int32(_integer(proto->_literals[literal_index]))) {
                return false;
            }
            SQInteger value = _integer(proto->_literals[literal_index]);
            if(materialize_int && !sqjit_native_emit_mov_mem_imm32(&buf, dst, value)) {
                return false;
            }
            slot_kind[dst] = SQ_JIT_SLOT_INT;
            int_materialized[dst] = materialize_int;
            float_materialized[dst] = false;
            known_const[dst] = true;
            const_value[dst] = value;
        }
        else if(sq_type(proto->_literals[literal_index]) == OT_FLOAT) {
            SQFloat value = _float(proto->_literals[literal_index]);
            if(!sqjit_native_emit_mov_local_float_const(&buf, dst, value)) {
                return false;
            }
            slot_kind[dst] = SQ_JIT_SLOT_FLOAT;
            int_materialized[dst] = false;
            float_materialized[dst] = true;
            known_const[dst] = true;
            float_const_value[dst] = value;
        }
        else {
            slot_kind[dst] = SQ_JIT_SLOT_LITERAL_OBJECT;
            int_materialized[dst] = false;
            float_materialized[dst] = false;
            known_const[dst] = false;
            literal_object_index[dst] = literal_index;
            stack_object_reg[dst] = -1;
            dirty_slot[dst] = true;
            return true;
        }
        stack_object_reg[dst] = -1;
        literal_object_index[dst] = -1;
        dirty_slot[dst] = true;
        return true;
    };

    auto ensure_int_slot = [&](SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slot_kind[slot] == SQ_JIT_SLOT_INT) {
            if(!int_materialized[slot]) {
                if(!known_const[slot] || !sqjit_native_emit_mov_mem_imm32(&buf, slot, const_value[slot])) {
                    return false;
                }
                int_materialized[slot] = true;
            }
            return true;
        }
        if(slot_kind[slot] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[slot] < 0) {
            return false;
        }
        if(!sqjit_native_emit_cmp_stack_type_i32(&buf, stack_object_reg[slot], OT_INTEGER) ||
            !emit_guard_fail_jump() ||
            !sqjit_native_emit_mov_rax_stack_value(&buf, stack_object_reg[slot]) ||
            !sqjit_native_emit_mov_mem_rax(&buf, slot)) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_SLOT_INT;
        stack_object_reg[slot] = -1;
        literal_object_index[slot] = -1;
        int_materialized[slot] = true;
        float_materialized[slot] = false;
        known_const[slot] = false;
        entry_loaded[slot] = true;
        return true;
    };

    auto ensure_float_slot = [&](SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slot_kind[slot] == SQ_JIT_SLOT_FLOAT) {
            if(!float_materialized[slot]) {
                if(!known_const[slot] ||
                    !sqjit_native_emit_mov_local_float_const(&buf, slot, float_const_value[slot])) {
                    return false;
                }
                float_materialized[slot] = true;
            }
            return true;
        }
        if(slot_kind[slot] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[slot] < 0) {
            return false;
        }
        if(!sqjit_native_emit_cmp_stack_type_i32(&buf, stack_object_reg[slot], OT_FLOAT) ||
            !emit_guard_fail_jump() ||
            !sqjit_native_emit_mov_xmm0_stack_float_value(&buf, stack_object_reg[slot]) ||
            !sqjit_native_emit_mov_local_float_xmm0(&buf, slot)) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_SLOT_FLOAT;
        stack_object_reg[slot] = -1;
        literal_object_index[slot] = -1;
        int_materialized[slot] = false;
        float_materialized[slot] = true;
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
        slot_kind[slot] = SQ_JIT_SLOT_INT;
        stack_object_reg[slot] = -1;
        literal_object_index[slot] = -1;
        int_materialized[slot] = true;
        float_materialized[slot] = false;
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
        slot_kind[slot] = SQ_JIT_SLOT_FLOAT;
        stack_object_reg[slot] = -1;
        literal_object_index[slot] = -1;
        int_materialized[slot] = false;
        float_materialized[slot] = true;
        known_const[slot] = false;
        dirty_slot[slot] = true;
        return true;
    };

    auto mark_array_ptr_slot = [&](SQInteger slot) -> bool {
        if(slot == 0xFF) {
            return true;
        }
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_SLOT_ARRAY_PTR;
        stack_object_reg[slot] = -1;
        literal_object_index[slot] = -1;
        int_materialized[slot] = true;
        float_materialized[slot] = false;
        known_const[slot] = false;
        dirty_slot[slot] = true;
        return true;
    };

    auto copy_int_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == 0xFF) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || !ensure_int_slot(src) ||
            !sqjit_native_emit_mov_rax_mem(&buf, src) ||
            !sqjit_native_emit_mov_mem_rax(&buf, dst) ||
            !mark_int_slot(dst)) {
            return false;
        }
        entry_loaded[dst] = entry_loaded[dst] || entry_loaded[src];
        known_const[dst] = known_const[src];
        const_value[dst] = const_value[src];
        return true;
    };

    auto copy_float_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == 0xFF) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || !ensure_float_slot(src) ||
            !sqjit_native_emit_mov_xmm0_local_float(&buf, src) ||
            !sqjit_native_emit_mov_local_float_xmm0(&buf, dst) ||
            !mark_float_slot(dst)) {
            return false;
        }
        entry_loaded[dst] = entry_loaded[dst] || entry_loaded[src];
        known_const[dst] = known_const[src];
        float_const_value[dst] = float_const_value[src];
        return true;
    };

    auto slot_is_observed_float = [&](SQInteger slot) -> bool {
        return slot >= 0 && slot < MAX_FUNC_STACKSIZE &&
            ((slot_kind[slot] == SQ_JIT_SLOT_FLOAT) ||
            (slot_kind[slot] == SQ_JIT_SLOT_STACK_OBJECT && stack_object_reg[slot] >= 0 &&
                sq_type(entry_stack[stack_object_reg[slot]]) == OT_FLOAT));
    };

    auto emit_array_set_integer = [&](SQInteger target, SQInteger base, SQInteger key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || value < 0 || value >= MAX_FUNC_STACKSIZE ||
            !ensure_int_slot(key) || !ensure_int_slot(value)) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(slot_kind[base] == SQ_JIT_SLOT_STACK_OBJECT && stack_object_reg[base] >= 0) {
            if(!sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) ||
                !sqjit_native_emit_mov_rsi_r13(&buf) ||
                !sqjit_native_emit_mov_rdx_i64(&buf, stack_object_reg[base]) ||
                !sqjit_native_emit_mov_rcx_mem(&buf, key) ||
                !sqjit_native_emit_mov_r8_mem(&buf, value) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_set_integer_logged)) {
                return false;
            }
        }
        else if(slot_kind[base] == SQ_JIT_SLOT_ARRAY_PTR) {
            if(!sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) ||
                !sqjit_native_emit_mov_rsi_mem(&buf, base) ||
                !sqjit_native_emit_mov_rdx_mem(&buf, key) ||
                !sqjit_native_emit_mov_rcx_mem(&buf, value) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_ptr_set_integer_logged)) {
                return false;
            }
        }
        else {
            return false;
        }
        return sqjit_native_emit_call_rax(&buf) &&
            sqjit_native_emit_test_rax_rax(&buf) &&
            sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) &&
            sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) &&
            copy_int_slot(target, value);
    };

    auto emit_array_set_integer_const = [&](SQInteger target, SQInteger base, SQInteger index, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            value < 0 || value >= MAX_FUNC_STACKSIZE || !ensure_int_slot(value)) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(slot_kind[base] == SQ_JIT_SLOT_STACK_OBJECT && stack_object_reg[base] >= 0) {
            if(!sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) ||
                !sqjit_native_emit_mov_rsi_r13(&buf) ||
                !sqjit_native_emit_mov_rdx_i64(&buf, stack_object_reg[base]) ||
                !sqjit_native_emit_mov_rcx_imm64(&buf, index) ||
                !sqjit_native_emit_mov_r8_mem(&buf, value) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_set_integer_logged)) {
                return false;
            }
        }
        else if(slot_kind[base] == SQ_JIT_SLOT_ARRAY_PTR) {
            if(!sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) ||
                !sqjit_native_emit_mov_rsi_mem(&buf, base) ||
                !sqjit_native_emit_mov_rdx_i64(&buf, index) ||
                !sqjit_native_emit_mov_rcx_mem(&buf, value) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_ptr_set_integer_logged)) {
                return false;
            }
        }
        else {
            return false;
        }
        return sqjit_native_emit_call_rax(&buf) &&
            sqjit_native_emit_test_rax_rax(&buf) &&
            sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) &&
            sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) &&
            copy_int_slot(target, value);
    };

    auto emit_array_set_float = [&](SQInteger target, SQInteger base, SQInteger key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || value < 0 || value >= MAX_FUNC_STACKSIZE ||
            !ensure_int_slot(key) || !ensure_float_slot(value)) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(slot_kind[base] == SQ_JIT_SLOT_STACK_OBJECT && stack_object_reg[base] >= 0) {
            if(!sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) ||
                !sqjit_native_emit_mov_rsi_r13(&buf) ||
                !sqjit_native_emit_mov_rdx_i64(&buf, stack_object_reg[base]) ||
                !sqjit_native_emit_mov_rcx_mem(&buf, key) ||
                !sqjit_native_emit_lea_r8_mem(&buf, value) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_set_float_logged)) {
                return false;
            }
        }
        else if(slot_kind[base] == SQ_JIT_SLOT_ARRAY_PTR) {
            if(!sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) ||
                !sqjit_native_emit_mov_rsi_mem(&buf, base) ||
                !sqjit_native_emit_mov_rdx_mem(&buf, key) ||
                !sqjit_native_emit_lea_rcx_mem(&buf, value) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_ptr_set_float_logged)) {
                return false;
            }
        }
        else {
            return false;
        }
        return sqjit_native_emit_call_rax(&buf) &&
            sqjit_native_emit_test_rax_rax(&buf) &&
            sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) &&
            sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) &&
            copy_float_slot(target, value);
    };

    auto emit_array_set_float_const = [&](SQInteger target, SQInteger base, SQInteger index, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            value < 0 || value >= MAX_FUNC_STACKSIZE || !ensure_float_slot(value)) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(slot_kind[base] == SQ_JIT_SLOT_STACK_OBJECT && stack_object_reg[base] >= 0) {
            if(!sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) ||
                !sqjit_native_emit_mov_rsi_r13(&buf) ||
                !sqjit_native_emit_mov_rdx_i64(&buf, stack_object_reg[base]) ||
                !sqjit_native_emit_mov_rcx_imm64(&buf, index) ||
                !sqjit_native_emit_lea_r8_mem(&buf, value) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_set_float_logged)) {
                return false;
            }
        }
        else if(slot_kind[base] == SQ_JIT_SLOT_ARRAY_PTR) {
            if(!sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) ||
                !sqjit_native_emit_mov_rsi_mem(&buf, base) ||
                !sqjit_native_emit_mov_rdx_i64(&buf, index) ||
                !sqjit_native_emit_lea_rcx_mem(&buf, value) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_ptr_set_float_logged)) {
                return false;
            }
        }
        else {
            return false;
        }
        return sqjit_native_emit_call_rax(&buf) &&
            sqjit_native_emit_test_rax_rax(&buf) &&
            sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) &&
            sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) &&
            copy_float_slot(target, value);
    };

    auto emit_table_set_integer_literal = [&](SQInteger target, SQInteger base, SQInteger literal_index, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals ||
            value < 0 || value >= MAX_FUNC_STACKSIZE ||
            slot_kind[base] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[base] < 0 ||
            !ensure_int_slot(value)) {
            return false;
        }
        SQInteger patch_offset = 0;
        return sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) &&
            sqjit_native_emit_mov_rsi_r13(&buf) &&
            sqjit_native_emit_mov_rdx_i64(&buf, stack_object_reg[base]) &&
            sqjit_native_emit_mov_rcx_imm64(&buf, (SQInteger)(intptr_t)&proto->_literals[literal_index]) &&
            sqjit_native_emit_mov_r8_mem(&buf, value) &&
            sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_table_set_integer_logged) &&
            sqjit_native_emit_call_rax(&buf) &&
            sqjit_native_emit_test_rax_rax(&buf) &&
            sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) &&
            sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) &&
            copy_int_slot(target, value);
    };

    auto emit_table_set_float_literal = [&](SQInteger target, SQInteger base, SQInteger literal_index, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals ||
            value < 0 || value >= MAX_FUNC_STACKSIZE ||
            slot_kind[base] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[base] < 0 ||
            !ensure_float_slot(value)) {
            return false;
        }
        SQInteger patch_offset = 0;
        return sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) &&
            sqjit_native_emit_mov_rsi_r13(&buf) &&
            sqjit_native_emit_mov_rdx_i64(&buf, stack_object_reg[base]) &&
            sqjit_native_emit_mov_rcx_imm64(&buf, (SQInteger)(intptr_t)&proto->_literals[literal_index]) &&
            sqjit_native_emit_lea_r8_mem(&buf, value) &&
            sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_table_set_float_logged) &&
            sqjit_native_emit_call_rax(&buf) &&
            sqjit_native_emit_test_rax_rax(&buf) &&
            sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) &&
            sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) &&
            copy_float_slot(target, value);
    };

    auto emit_array_get_integer = [&](SQInteger dst, SQInteger base, SQInteger key) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || !ensure_int_slot(key)) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(slot_kind[base] == SQ_JIT_SLOT_STACK_OBJECT && stack_object_reg[base] >= 0) {
            if(!sqjit_native_emit_mov_rdi_r13(&buf) ||
                !sqjit_native_emit_mov_rsi_i64(&buf, stack_object_reg[base]) ||
                !sqjit_native_emit_mov_rdx_mem(&buf, key) ||
                !sqjit_native_emit_lea_rcx_mem(&buf, dst) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_get_integer) ||
                !sqjit_native_emit_call_rax(&buf) ||
                !sqjit_native_emit_test_rax_rax(&buf) ||
                !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
                !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                    MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
                !sqjit_native_sync_pinned_slot_from_local(&buf, dst) ||
                !mark_int_slot(dst)) {
                return false;
            }
        }
        else if(slot_kind[base] == SQ_JIT_SLOT_ARRAY_PTR) {
            if(!sqjit_native_emit_mov_rdi_mem(&buf, base) ||
                !sqjit_native_emit_mov_rsi_mem(&buf, key) ||
                !sqjit_native_emit_lea_rdx_mem(&buf, dst) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_ptr_get_integer) ||
                !sqjit_native_emit_call_rax(&buf) ||
                !sqjit_native_emit_test_rax_rax(&buf) ||
                !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
                !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                    MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
                !mark_int_slot(dst)) {
                return false;
            }
        }
        else {
            return false;
        }
        entry_loaded[dst] = true;
        return true;
    };

    auto emit_array_get_array_ptr = [&](SQInteger dst, SQInteger base, SQInteger key) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || !ensure_int_slot(key)) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(slot_kind[base] == SQ_JIT_SLOT_STACK_OBJECT && stack_object_reg[base] >= 0) {
            if(!sqjit_native_emit_mov_rdi_r13(&buf) ||
                !sqjit_native_emit_mov_rsi_i64(&buf, stack_object_reg[base]) ||
                !sqjit_native_emit_mov_rdx_mem(&buf, key) ||
                !sqjit_native_emit_lea_rcx_mem(&buf, dst) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_get_array_ptr) ||
                !sqjit_native_emit_call_rax(&buf) ||
                !sqjit_native_emit_test_rax_rax(&buf) ||
                !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
                !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                    MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
                !mark_array_ptr_slot(dst)) {
                return false;
            }
        }
        else if(slot_kind[base] == SQ_JIT_SLOT_ARRAY_PTR) {
            if(!sqjit_native_emit_mov_rdi_mem(&buf, base) ||
                !sqjit_native_emit_mov_rsi_mem(&buf, key) ||
                !sqjit_native_emit_lea_rdx_mem(&buf, dst) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_ptr_get_array_ptr) ||
                !sqjit_native_emit_call_rax(&buf) ||
                !sqjit_native_emit_test_rax_rax(&buf) ||
                !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
                !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                    MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
                !mark_array_ptr_slot(dst)) {
                return false;
            }
        }
        else {
            return false;
        }
        return true;
    };

    auto emit_array_get_integer_const = [&](SQInteger dst, SQInteger base, SQInteger index) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(slot_kind[base] == SQ_JIT_SLOT_STACK_OBJECT && stack_object_reg[base] >= 0) {
            if(!sqjit_native_emit_mov_rdi_r13(&buf) ||
                !sqjit_native_emit_mov_rsi_i64(&buf, stack_object_reg[base]) ||
                !sqjit_native_emit_mov_rdx_i64(&buf, index) ||
                !sqjit_native_emit_lea_rcx_mem(&buf, dst) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_get_integer) ||
                !sqjit_native_emit_call_rax(&buf) ||
                !sqjit_native_emit_test_rax_rax(&buf) ||
                !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
                !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                    MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
                !sqjit_native_sync_pinned_slot_from_local(&buf, dst) ||
                !mark_int_slot(dst)) {
                return false;
            }
        }
        else if(slot_kind[base] == SQ_JIT_SLOT_ARRAY_PTR) {
            if(!sqjit_native_emit_mov_rdi_mem(&buf, base) ||
                !sqjit_native_emit_mov_rsi_i64(&buf, index) ||
                !sqjit_native_emit_lea_rdx_mem(&buf, dst) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_ptr_get_integer) ||
                !sqjit_native_emit_call_rax(&buf) ||
                !sqjit_native_emit_test_rax_rax(&buf) ||
                !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
                !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                    MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
                !mark_int_slot(dst)) {
                return false;
            }
        }
        else {
            return false;
        }
        entry_loaded[dst] = true;
        return true;
    };

    auto emit_outer_get_integer = [&](SQInteger dst, SQInteger outer_index) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || outer_index < 0 ||
            outer_index >= proto->_noutervalues) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_mov_rdi_mem(&buf, SQ_JIT_NATIVE_CLOSURE_SLOT) ||
            !sqjit_native_emit_mov_rsi_i64(&buf, outer_index) ||
            !sqjit_native_emit_lea_rdx_mem(&buf, dst) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_outer_get_integer) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
            !sqjit_native_sync_pinned_slot_from_local(&buf, dst) ||
            !mark_int_slot(dst)) {
            return false;
        }
        entry_loaded[dst] = true;
        return true;
    };

    auto emit_outer_get_float = [&](SQInteger dst, SQInteger outer_index) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || outer_index < 0 ||
            outer_index >= proto->_noutervalues) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_mov_rdi_mem(&buf, SQ_JIT_NATIVE_CLOSURE_SLOT) ||
            !sqjit_native_emit_mov_rsi_i64(&buf, outer_index) ||
            !sqjit_native_emit_lea_rdx_mem(&buf, dst) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_outer_get_float) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
            !mark_float_slot(dst)) {
            return false;
        }
        entry_loaded[dst] = true;
        return true;
    };

    auto record_branch = [&](SQInteger patch_offset, SQInteger target_ip) -> bool {
        if(target_ip == exit_ip) {
            return sqjit_native_record_reloc(exit_relocs, &nexit_relocs, 128, patch_offset, target_ip);
        }
        if(target_ip < start_ip || target_ip > end_ip) {
            return false;
        }
        return sqjit_native_record_reloc(relocs, &nrelocs, 512, patch_offset, target_ip);
    };

    auto slot_is_float = [&](SQInteger slot) -> bool {
        return slot >= 0 && slot < MAX_FUNC_STACKSIZE && slot_kind[slot] == SQ_JIT_SLOT_FLOAT;
    };

    auto emit_float_binary = [&](SQOpcode op, SQInteger dst, SQInteger left, SQInteger right) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            !ensure_float_slot(left) || !ensure_float_slot(right) ||
            !sqjit_native_emit_mov_xmm0_local_float(&buf, left) ||
            !sqjit_native_emit_float_op_xmm0_local(&buf, op, right) ||
            !sqjit_native_emit_mov_local_float_xmm0(&buf, dst) ||
            !mark_float_slot(dst)) {
            return false;
        }
        entry_loaded[dst] = entry_loaded[dst] || entry_loaded[left] || entry_loaded[right];
        return true;
    };

    bool defined_in_loop[MAX_FUNC_STACKSIZE];
    bool preload_slot[MAX_FUNC_STACKSIZE];
    for(SQInteger n = 0; n < MAX_FUNC_STACKSIZE; n++) {
        defined_in_loop[n] = false;
        preload_slot[n] = false;
    }
    for(SQInteger ip = start_ip; ip <= end_ip; ip++) {
        attempt.SetIP(ip);
        const SQInstruction &inst = proto->_instructions[ip];
        for(SQInteger slot = 0; slot < proto->_stacksize; slot++) {
            if(sqjit_loop_instruction_reads_int_slot(inst, slot) && !defined_in_loop[slot]) {
                preload_slot[slot] = true;
            }
        }
        for(SQInteger slot = 0; slot < proto->_stacksize; slot++) {
            if(sqjit_loop_instruction_writes_slot(inst, slot)) {
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
        attempt.SetIP(ip);
        const SQInstruction &inst = proto->_instructions[ip];

        switch(inst.op) {
            case _OP_LINE:
                break;
            case _OP_LOADINT: {
                SQInteger value = sqjit_loadint_value(inst);
                bool materialize_int = !sqjit_next_consumes_load_as_immediate(proto, ip, inst._arg0);
                if(materialize_int && !sqjit_native_emit_mov_mem_imm32(&buf, inst._arg0, value)) {
                    return false;
                }
                slot_kind[inst._arg0] = SQ_JIT_SLOT_INT;
                stack_object_reg[inst._arg0] = -1;
                literal_object_index[inst._arg0] = -1;
                int_materialized[inst._arg0] = materialize_int;
                float_materialized[inst._arg0] = false;
                known_const[inst._arg0] = true;
                const_value[inst._arg0] = value;
                dirty_slot[inst._arg0] = true;
                break;
            }
            case _OP_LOADFLOAT: {
                SQFloat value;
                if(!sqjit_loadfloat_value(inst, &value) ||
                    !sqjit_native_emit_mov_local_float_const(&buf, inst._arg0, value)) {
                    return false;
                }
                slot_kind[inst._arg0] = SQ_JIT_SLOT_FLOAT;
                stack_object_reg[inst._arg0] = -1;
                literal_object_index[inst._arg0] = -1;
                int_materialized[inst._arg0] = false;
                float_materialized[inst._arg0] = true;
                known_const[inst._arg0] = true;
                float_const_value[inst._arg0] = value;
                dirty_slot[inst._arg0] = true;
                break;
            }
            case _OP_LOAD:
                if(!load_literal_slot(inst._arg0, inst._arg1,
                    !sqjit_next_consumes_load_as_immediate(proto, ip, inst._arg0))) {
                    return false;
                }
                break;
            case _OP_DLOAD:
                if(!load_literal_slot(inst._arg0, inst._arg1,
                    !sqjit_next_consumes_load_as_immediate(proto, ip, inst._arg0)) ||
                    !load_literal_slot(inst._arg2, inst._arg3,
                    !sqjit_next_consumes_load_as_immediate(proto, ip, inst._arg2))) {
                    return false;
                }
                break;
            case _OP_GETOUTER:
                if(sqjit_observed_outer_value_type(closure, inst._arg1) == OT_FLOAT) {
                    if(!emit_outer_get_float(inst._arg0, inst._arg1)) {
                        return false;
                    }
                }
                else if(!emit_outer_get_integer(inst._arg0, inst._arg1)) {
                    return false;
                }
                break;
            case _OP_MOVE:
                if(slot_kind[inst._arg1] == SQ_JIT_SLOT_FLOAT) {
                    if(!copy_float_slot(inst._arg0, inst._arg1)) {
                        return false;
                    }
                }
                else if(!copy_int_slot(inst._arg0, inst._arg1)) {
                    return false;
                }
                break;
            case _OP_GET:
                if(slot_kind[inst._arg2] == SQ_JIT_SLOT_LITERAL_OBJECT) {
                    SQInteger literal_index = literal_object_index[inst._arg2];
                    if(literal_index < 0 || literal_index >= proto->_nliterals ||
                        sq_type(proto->_literals[literal_index]) != OT_INTEGER ||
                        !emit_array_get_integer_const(inst._arg0, inst._arg1,
                            _integer(proto->_literals[literal_index]))) {
                        return false;
                    }
                }
                else {
                    SQObjectType observed = OT_NULL;
                    if(inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE &&
                        inst._arg2 >= 0 && inst._arg2 < MAX_FUNC_STACKSIZE &&
                        slot_kind[inst._arg1] == SQ_JIT_SLOT_STACK_OBJECT &&
                        stack_object_reg[inst._arg1] >= 0 &&
                        sq_type(entry_stack[inst._arg2]) == OT_INTEGER) {
                        observed = sqjit_observed_array_value_type(entry_stack,
                            stack_object_reg[inst._arg1], _integer(entry_stack[inst._arg2]));
                    }
                    if(observed == OT_ARRAY) {
                        if(!emit_array_get_array_ptr(inst._arg0, inst._arg1, inst._arg2)) {
                            return false;
                        }
                    }
                    else if(!emit_array_get_integer(inst._arg0, inst._arg1, inst._arg2)) {
                        return false;
                    }
                }
                break;
            case _OP_GETK:
                if(inst._arg1 < 0 || inst._arg1 >= proto->_nliterals ||
                    sq_type(proto->_literals[inst._arg1]) != OT_INTEGER) {
                    return false;
                }
                if(!emit_array_get_integer_const(inst._arg0, inst._arg2,
                    _integer(proto->_literals[inst._arg1]))) {
                    return false;
                }
                break;
            case _OP_SET:
                if(slot_kind[inst._arg2] == SQ_JIT_SLOT_LITERAL_OBJECT) {
                    SQInteger literal_index = literal_object_index[inst._arg2];
                    if(literal_index < 0 || literal_index >= proto->_nliterals) {
                        return false;
                    }
                    if(sq_type(proto->_literals[literal_index]) == OT_INTEGER) {
                        if(slot_is_observed_float(inst._arg3)) {
                            if(!emit_array_set_float_const(inst._arg0, inst._arg1,
                                _integer(proto->_literals[literal_index]), inst._arg3)) {
                                return false;
                            }
                        }
                        else if(!emit_array_set_integer_const(inst._arg0, inst._arg1,
                            _integer(proto->_literals[literal_index]), inst._arg3)) {
                            return false;
                        }
                    }
                    else if(slot_is_observed_float(inst._arg3)) {
                        if(!emit_table_set_float_literal(inst._arg0, inst._arg1,
                            literal_index, inst._arg3)) {
                            return false;
                        }
                    }
                    else if(!emit_table_set_integer_literal(inst._arg0, inst._arg1,
                        literal_index, inst._arg3)) {
                        return false;
                    }
                }
                else if(known_const[inst._arg2]) {
                    if(slot_is_observed_float(inst._arg3)) {
                        if(!emit_array_set_float_const(inst._arg0, inst._arg1,
                            const_value[inst._arg2], inst._arg3)) {
                            return false;
                        }
                    }
                    else if(!emit_array_set_integer_const(inst._arg0, inst._arg1,
                        const_value[inst._arg2], inst._arg3)) {
                        return false;
                    }
                }
                else if(slot_is_observed_float(inst._arg3)) {
                    if(!emit_array_set_float(inst._arg0, inst._arg1, inst._arg2, inst._arg3)) {
                        return false;
                    }
                }
                else if(!emit_array_set_integer(inst._arg0, inst._arg1, inst._arg2, inst._arg3)) {
                    return false;
                }
                break;
            case _OP_ADD: {
                if(slot_is_float(inst._arg1) || slot_is_float(inst._arg2)) {
                    if(!emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                        return false;
                    }
                    break;
                }
                SQInteger imm = 0;
                if(sqjit_previous_loads_int_const(proto, ip, inst._arg1, &imm) && sqjit_native_is_int32(imm)) {
                    if(!ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_add_rax_i32(&buf, imm) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                    entry_loaded[inst._arg0] = entry_loaded[inst._arg0] || entry_loaded[inst._arg2];
                }
                else if(sqjit_previous_loads_int_const(proto, ip, inst._arg2, &imm) && sqjit_native_is_int32(imm)) {
                    if(!ensure_int_slot(inst._arg1) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_add_rax_i32(&buf, imm) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                    entry_loaded[inst._arg0] = entry_loaded[inst._arg0] || entry_loaded[inst._arg1];
                }
                else {
                    if(!ensure_int_slot(inst._arg1) || !ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_add_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                    entry_loaded[inst._arg0] = entry_loaded[inst._arg0] ||
                        entry_loaded[inst._arg1] || entry_loaded[inst._arg2];
                }
                if(!mark_int_slot(inst._arg0)) {
                    return false;
                }
                break;
            }
            case _OP_SUB: {
                if(slot_is_float(inst._arg1) || slot_is_float(inst._arg2)) {
                    if(!emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                        return false;
                    }
                    break;
                }
                SQInteger imm = 0;
                if(sqjit_previous_loads_int_const(proto, ip, inst._arg1, &imm) && sqjit_native_is_int32(imm)) {
                    if(!ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_sub_rax_i32(&buf, imm) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                    entry_loaded[inst._arg0] = entry_loaded[inst._arg0] || entry_loaded[inst._arg2];
                }
                else {
                    if(!ensure_int_slot(inst._arg1) || !ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_sub_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                    entry_loaded[inst._arg0] = entry_loaded[inst._arg0] ||
                        entry_loaded[inst._arg1] || entry_loaded[inst._arg2];
                }
                if(!mark_int_slot(inst._arg0)) {
                    return false;
                }
                break;
            }
            case _OP_MUL: {
                if(slot_is_float(inst._arg1) || slot_is_float(inst._arg2)) {
                    if(!emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                        return false;
                    }
                    break;
                }
                SQInteger imm = 0;
                if(sqjit_previous_loads_int_const(proto, ip, inst._arg1, &imm) && sqjit_native_is_int32(imm)) {
                    if(!ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_imul_rax_i32(&buf, imm) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                    entry_loaded[inst._arg0] = entry_loaded[inst._arg0] || entry_loaded[inst._arg2];
                }
                else if(sqjit_previous_loads_int_const(proto, ip, inst._arg2, &imm) && sqjit_native_is_int32(imm)) {
                    if(!ensure_int_slot(inst._arg1) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_imul_rax_i32(&buf, imm) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                    entry_loaded[inst._arg0] = entry_loaded[inst._arg0] || entry_loaded[inst._arg1];
                }
                else {
                    if(!ensure_int_slot(inst._arg1) || !ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_imul_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                    entry_loaded[inst._arg0] = entry_loaded[inst._arg0] ||
                        entry_loaded[inst._arg1] || entry_loaded[inst._arg2];
                }
                if(!mark_int_slot(inst._arg0)) {
                    return false;
                }
                break;
            }
            case _OP_DIV:
                if(!emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                    return false;
                }
                break;
            case _OP_MOD: {
                SQInteger divisor = 0;
                if(!ensure_int_slot(inst._arg2) ||
                    !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2)) {
                    return false;
                }
                if(sqjit_previous_loads_positive_int_const(proto, ip, inst._arg1) &&
                    sqjit_previous_loads_int_const(proto, ip, inst._arg1, &divisor) &&
                    sqjit_native_is_int32(divisor)) {
                    if(!sqjit_native_emit_mov_rcx_imm64(&buf, divisor)) {
                        return false;
                    }
                }
                else {
                    SQInteger patch_offset = 0;
                    if(!ensure_int_slot(inst._arg1) ||
                        !sqjit_native_emit_mov_rcx_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_cmp_rcx_i32(&buf, 0) ||
                        !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_LE, &patch_offset) ||
                        !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                            MAX_FUNC_STACKSIZE + 512, patch_offset, -1)) {
                        return false;
                    }
                }
                if(!sqjit_native_emit_idiv_rcx(&buf) ||
                    !sqjit_native_emit_mov_rax_rdx(&buf) ||
                    !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                    return false;
                }
                entry_loaded[inst._arg0] = entry_loaded[inst._arg0] || entry_loaded[inst._arg2];
                if(!mark_int_slot(inst._arg0)) {
                    return false;
                }
                break;
            }
            case _OP_PINCL: {
                SQInteger delta = sqjit_signed_arg3(inst);
                if(!ensure_int_slot(inst._arg1) || !sqjit_native_is_int32(delta) ||
                    !sqjit_native_emit_mov_rax_mem(&buf, inst._arg1)) {
                    return false;
                }
                if(inst._arg0 != 0xFF && !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                    return false;
                }
                if(!sqjit_native_emit_add_mem_i32(&buf, inst._arg1, delta)) {
                    return false;
                }
                if(inst._arg0 != 0xFF) {
                    entry_loaded[inst._arg0] = entry_loaded[inst._arg0] || entry_loaded[inst._arg1];
                }
                if(!mark_int_slot(inst._arg0) || !mark_int_slot(inst._arg1)) {
                    return false;
                }
                entry_loaded[inst._arg1] = true;
                break;
            }
            case _OP_EQ:
            case _OP_NE:
                if(!ensure_int_slot(inst._arg2) ||
                    !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2)) {
                    return false;
                }
                if(inst._arg3 != 0) {
                    if(inst._arg1 < 0 || inst._arg1 >= proto->_nliterals ||
                        sq_type(proto->_literals[inst._arg1]) != OT_INTEGER ||
                        !sqjit_native_is_int32(_integer(proto->_literals[inst._arg1])) ||
                        !sqjit_native_emit_cmp_rax_i32(&buf, _integer(proto->_literals[inst._arg1]))) {
                        return false;
                    }
                }
                else if(!ensure_int_slot(inst._arg1) ||
                    !sqjit_native_emit_cmp_rax_mem(&buf, inst._arg1)) {
                    return false;
                }
                if(!sqjit_native_emit_setcc_rax(&buf, inst.op == _OP_NE ? 0x95 : 0x94) ||
                    !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                    return false;
                }
                entry_loaded[inst._arg0] = entry_loaded[inst._arg0] ||
                    entry_loaded[inst._arg2] || (inst._arg3 == 0 && entry_loaded[inst._arg1]);
                if(!mark_int_slot(inst._arg0)) {
                    return false;
                }
                break;
            case _OP_JZ: {
                SQInteger patch_offset = 0;
                SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
                if(!ensure_int_slot(inst._arg0) ||
                    !sqjit_native_emit_mov_rax_mem(&buf, inst._arg0) ||
                    !sqjit_native_emit_cmp_rax_i32(&buf, 0) ||
                    !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
                    !record_branch(patch_offset, target_ip)) {
                    return false;
                }
                break;
            }
            case _OP_JCMP: {
                SQJitNativeJcc jcc;
                SQInteger patch_offset = 0;
                SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
                if(slot_is_float(inst._arg0) || slot_is_float(inst._arg2)) {
                    if(!ensure_float_slot(inst._arg0) || !ensure_float_slot(inst._arg2) ||
                        !sqjit_native_float_cmp_false_jcc((CmpOP)inst._arg3, &jcc) ||
                        !sqjit_native_emit_mov_xmm0_local_float(&buf, inst._arg2) ||
                        !sqjit_native_emit_ucomi_xmm0_local_float(&buf, inst._arg0) ||
                        !sqjit_native_emit_jcc_placeholder(&buf, jcc, &patch_offset) ||
                        !record_branch(patch_offset, target_ip)) {
                        return false;
                    }
                }
                else {
                    if(!ensure_int_slot(inst._arg0) || !ensure_int_slot(inst._arg2) ||
                        !sqjit_native_cmp_false_jcc((CmpOP)inst._arg3, &jcc) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_cmp_rax_mem(&buf, inst._arg0) ||
                        !sqjit_native_emit_jcc_placeholder(&buf, jcc, &patch_offset) ||
                        !record_branch(patch_offset, target_ip)) {
                        return false;
                    }
                }
                break;
            }
            case _OP_JMP: {
                SQInteger patch_offset = 0;
                SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
                if(!sqjit_native_emit_jmp_placeholder(&buf, &patch_offset) ||
                    !record_branch(patch_offset, target_ip)) {
                    return false;
                }
                break;
            }
            default:
                return attempt.Reject(ip, SQ_JIT_REJECT_OPCODE, "unsupported opcode");
        }
    }

    SQInteger exit_offset = buf.size;
    for(SQInteger n = 0; n < proto->_stacksize; n++) {
        if(!dirty_slot[n]) {
            continue;
        }
        if(!entry_loaded[n]) {
            if(sqjit_loop_slot_is_live_out(proto, exit_ip, n)) {
                return false;
            }
            continue;
        }
        if(slot_kind[n] != SQ_JIT_SLOT_FLOAT && slot_kind[n] != SQ_JIT_SLOT_INT) {
            if(sqjit_loop_slot_is_live_out(proto, exit_ip, n)) return false;
            continue;
        }
        // Stack slots can still own objects from earlier interpreter work.
        // Assignment must release those references before changing the tag.
        // Integer locals may reside in a callee-saved register; spill before
        // passing their address to the assignment helper.
        if(slot_kind[n] == SQ_JIT_SLOT_INT &&
            (!sqjit_native_emit_mov_rax_mem(&buf, n) ||
             !sqjit_native_emit_mov_local_mem_rax(&buf, n))) return false;
        if(!sqjit_native_emit_mov_rdi_r13(&buf) ||
            !sqjit_native_emit_mov_rsi_i64(&buf, n) ||
            !sqjit_native_emit_lea_rdx_mem(&buf, n) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, slot_kind[n] == SQ_JIT_SLOT_FLOAT ?
                (const void *)sqjit_helper_store_stack_float :
                (const void *)sqjit_helper_store_stack_integer) ||
            !sqjit_native_emit_call_rax(&buf)) {
            return false;
        }
    }
    if(!sqjit_native_emit_mov_rax_imm64(&buf, exit_ip) ||
        !sqjit_native_emit_mov_out_rax(&buf) ||
        !emit_write_log_release(false) ||
        !sqjit_native_emit_mov_rsp_rbp(&buf) ||
        !sqjit_native_emit_pop_r15(&buf) ||
        !sqjit_native_emit_pop_r14(&buf) ||
        !sqjit_native_emit_pop_rbx(&buf) ||
        !sqjit_native_emit_pop_r13(&buf) ||
        !sqjit_native_emit_pop_r12(&buf) ||
        !sqjit_native_emit_pop_abi_preserved_arg_regs(&buf) ||
        !sqjit_native_emit_pop_rbp(&buf) ||
        !sqjit_native_emit_mov_eax_i32(&buf, SQ_JIT_NATIVE_RETURNED) ||
        !sqjit_native_emit_ret(&buf)) {
        return false;
    }

    SQInteger guard_fail_offset = buf.size;
    if(!emit_write_log_release(true) ||
        !sqjit_native_emit_mov_rsp_rbp(&buf) ||
        !sqjit_native_emit_pop_r15(&buf) ||
        !sqjit_native_emit_pop_r14(&buf) ||
        !sqjit_native_emit_pop_rbx(&buf) ||
        !sqjit_native_emit_pop_r13(&buf) ||
        !sqjit_native_emit_pop_r12(&buf) ||
        !sqjit_native_emit_pop_abi_preserved_arg_regs(&buf) ||
        !sqjit_native_emit_pop_rbp(&buf) ||
        !sqjit_native_emit_mov_eax_i32(&buf, SQ_JIT_NATIVE_GUARD_FAILED) ||
        !sqjit_native_emit_ret(&buf)) {
        return false;
    }

    for(SQInteger n = 0; n < nrelocs; n++) {
        SQInteger target_offset = ip_to_offset[relocs[n].target_ip];
        if(target_offset < 0) {
            return false;
        }
        SQInteger rel = target_offset - (relocs[n].patch_offset + 4);
        if(!sqjit_native_patch_i32(&buf, relocs[n].patch_offset, rel)) {
            return false;
        }
    }
    for(SQInteger n = 0; n < nexit_relocs; n++) {
        SQInteger rel = exit_offset - (exit_relocs[n].patch_offset + 4);
        if(!sqjit_native_patch_i32(&buf, exit_relocs[n].patch_offset, rel)) {
            return false;
        }
    }
    for(SQInteger n = 0; n < nguard_fail_relocs; n++) {
        SQInteger rel = guard_fail_offset - (guard_fail_relocs[n].patch_offset + 4);
        if(!sqjit_native_patch_i32(&buf, guard_fail_relocs[n].patch_offset, rel)) {
            return false;
        }
    }

    return jit->_loop_code.Install(buf.bytes, buf.size) ||
        attempt.Reject(-1, SQ_JIT_REJECT_RESOURCE, "executable memory installation failed");
}


SQJitCompileResult sqjit_backend_compile_proto(SQFunctionProto *proto,
    SQObjectPtr *stack, SQClosure *closure, SQJitNative *native)
{
    SQJitCompileAttempt attempt(proto, SQ_JIT_BACKEND_X64);
    return attempt.Finish(compile_proto(proto, stack, closure, native, attempt));
}

SQJitCompileResult sqjit_backend_compile_loop(SQFunctionProto *proto,
    SQObjectPtr *stack, SQClosure *closure, SQInteger start, SQInteger header,
    SQInteger end, SQInteger exit, SQJitProto *jit)
{
    SQJitCompileAttempt attempt(proto, SQ_JIT_BACKEND_X64);
    return attempt.Finish(compile_loop(proto, stack, closure, start, header,
        end, exit, jit, attempt));
}
