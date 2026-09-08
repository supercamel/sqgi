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
#include "sqjit_backend_x64_calls.h"
#include "sqjit_backend_x64_memory.h"
#include "sqjit_backend_x64_float_loops.h"
#include "sqbytecode.h"
#include "sqjit_typeflow.h"
#include "sqjit_write_log.h"

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

static bool sqjit_previous_loads_int_const(SQFunctionProto *proto, const SQBytecodeAnalysis &analysis, SQInteger ip, SQInteger reg, SQInteger *value)
{
    // Keep immediate lowering local; whole-function constants are unsafe across backedges.
    if(ip <= 0 || analysis.leaders[ip]) {
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

static bool sqjit_previous_loads_positive_int_const(SQFunctionProto *proto, const SQBytecodeAnalysis &analysis, SQInteger ip, SQInteger reg)
{
    SQInteger value = 0;
    return sqjit_previous_loads_int_const(proto, analysis, ip, reg, &value) && value > 0;
}

static SQObjectType sqjit_observed_table_value_type(SQObjectPtr *entry_stack, SQInteger table_reg, const SQObjectPtr *key)
{
    if(!entry_stack || !key || table_reg < 0) {
        return OT_NULL;
    }

    SQObjectPtr value;
    if(!sqjit_member_raw(entry_stack[table_reg], *key, value)) {
        return OT_NULL;
    }
    return sq_type(value);
}


static SQObjectType sqjit_observed_outer_value_type(SQClosure *closure, SQInteger outer_index)
{
    SQObjectPtr *value = sqjit_outer_value_ptr(closure, outer_index);
    return value ? sq_type(*value) : OT_NULL;
}

static bool sqjit_next_consumes_load_as_immediate(SQFunctionProto *proto, const SQBytecodeAnalysis &analysis, SQInteger ip, SQInteger reg)
{
    if(analysis.leaders[ip + 1]) return false;
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


// Assign the three callee-saved value registers to the most-used scalar
// slots. Slot identity stays stable across branches, guards and helper calls.
static void assign_scalar_registers(SQFunctionProto *proto, SQObjectPtr *entry,
    const SQBytecodeAnalysis &analysis, SQJitNativeCodeBuffer &buf)
{
    SQInteger scores[MAX_FUNC_STACKSIZE] = {};
    SQSlotSet scalar, excluded;
    for(SQInteger n = 1; n < proto->_nparameters; ++n) {
        if(sq_type(entry[n]) == OT_INTEGER || sq_type(entry[n]) == OT_BOOL) scalar.set(n);
        else excluded.set(n);
    }
    std::vector<bool> hot(proto->_ninstructions, false);
    for(SQInteger ip = 0; ip < proto->_ninstructions; ++ip) {
        SQInteger target = analysis.facts[ip].target;
        if(target >= 0 && target <= ip)
            for(SQInteger n = target; n <= ip; ++n) hot[n] = true;
    }
    for(SQInteger ip = 0; ip < proto->_ninstructions; ++ip) {
        const SQInstruction &i = proto->_instructions[ip];
        const SQBytecodeFacts &f = analysis.facts[ip];
        if(i.op == _OP_LOADINT || i.op == _OP_LOADBOOL || i.op == _OP_INCL || i.op == _OP_PINCL ||
            i.op == _OP_ADD || i.op == _OP_SUB || i.op == _OP_MUL || i.op == _OP_MOD || i.op == _OP_EQ || i.op == _OP_NE)
            scalar |= f.writes;
        if(i.op == _OP_LOADFLOAT || i.op == _OP_NEWOBJ || i.op == _OP_CALL || i.op == _OP_TAILCALL)
            excluded |= f.writes;
        for(SQInteger n = 1; n < proto->_stacksize; ++n)
            scores[n] += (hot[ip] ? 8 : 1) * (2 * f.reads.test(n) + f.writes.test(n));
    }
    for(int reg = 0; reg < 3; ++reg) {
        SQInteger best = -1;
        for(SQInteger n = 1; n < proto->_stacksize; ++n)
            if(scalar.test(n) && !excluded.test(n) && (best < 0 || scores[n] > scores[best])) best = n;
        buf.pinned_slots[reg] = best;
        if(best >= 0) excluded.set(best);
    }
}

static bool compile_proto(SQFunctionProto *proto, SQObjectPtr *entry_stack,
    SQClosure *closure, SQJitNative *native, SQJitCompileAttempt &attempt)
{
    if(!proto || !entry_stack || !native || proto->_nparameters < 1 ||
        proto->_stacksize <= 0 || proto->_stacksize > MAX_FUNC_STACKSIZE ||
        proto->_nparameters > proto->_stacksize || proto->_ninstructions <= 0) {
        return attempt.Reject(-1, SQ_JIT_REJECT_INVALID_BYTECODE, "invalid compilation input or function bounds");
    }
    if(proto->_varparams || proto->_ndefaultparams != 0 || proto->_bgenerator ||
        proto->_ninstructions > (native->_scalarized ? 2048 : 512)) {
        return attempt.Reject(-1, SQ_JIT_REJECT_OTHER, "unsupported function shape or instruction limit");
    }

    SQBytecodeAnalysis analysis;
    if(!analysis.Build(proto->_instructions, proto->_ninstructions, proto->_stacksize))
        return attempt.Reject(-1, SQ_JIT_REJECT_INVALID_BYTECODE, "invalid bytecode operands or control flow");

    std::vector<SQInteger> ip_to_offset(proto->_ninstructions + 1, -1);
    SQJitNativeReloc relocs[512];
    SQInteger nrelocs = 0;
    SQJitNativeReloc guard_fail_relocs[MAX_FUNC_STACKSIZE + 512];
    SQInteger nguard_fail_relocs = 0;
    SQJitTypeFlow typeflow(analysis, 0, proto->_ninstructions - 1, proto->_stacksize);
    SQJitSlotState slots[MAX_FUNC_STACKSIZE];

    SQJitNativeCodeBuffer buf;
    buf.size = 0;
    assign_scalar_registers(proto, entry_stack, analysis, buf);

    bool uses_write_log = false;
    for(SQInteger ip = 0; ip < proto->_ninstructions; ip++) {
        if(proto->_instructions[ip].op == _OP_SET) {
            uses_write_log = true;
            break;
        }
    }

    // Reserved slots must stay outside the emitter's pinned slots 1..3.
    const SQInteger closure_slot = proto->_stacksize > 3 ? proto->_stacksize : 4;
    const SQInteger write_log_slot = closure_slot + 1;
    bool has_calls = false;
    for(SQInteger ip = 0; ip < proto->_ninstructions; ++ip)
        has_calls = has_calls || proto->_instructions[ip].op == _OP_CALL || proto->_instructions[ip].op == _OP_TAILCALL;
    SQInteger leaf_scratch_slots = SQJitX64Calls::LeafScratchSlots(proto, entry_stack, 0, proto->_ninstructions - 1);
    // Register retention pays for inlined scalar chains; helper-heavy math
    // regressed when every call forced the cache to spill. Keep it scoped.
    buf.cache_floats = leaf_scratch_slots > 0 && !uses_write_log;
    SQJitVirtualArrayPlan virtual_arrays;
    virtual_arrays.Build(proto, analysis, 0, proto->_ninstructions - 1);
    if(virtual_arrays.slots && !has_calls && !uses_write_log) buf.cache_floats = true;
    SQInteger last_reserved_slot = has_calls ? closure_slot + 3 + leaf_scratch_slots : uses_write_log ? write_log_slot : closure_slot;
    const SQInteger virtual_base = last_reserved_slot + 1;
    last_reserved_slot += virtual_arrays.slots;
    const SQInteger numeric_scratch = last_reserved_slot + 1;
    last_reserved_slot += 2;
    SQJitMemberPlan member_plan;
    member_plan.Build(proto, entry_stack, analysis, 0, proto->_ninstructions - 1);
    const SQInteger member_base = last_reserved_slot + 1;
    last_reserved_slot += member_plan.Words();
    static_assert(alignof(SQJitWriteLog) <= sizeof(SQInteger), "native frame alignment");
    if(uses_write_log) last_reserved_slot += (sizeof(SQJitWriteLog) + sizeof(SQInteger) - 1) / sizeof(SQInteger);
    const SQInteger log_storage = last_reserved_slot;
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
        !sqjit_native_emit_mov_local_mem_rax(&buf, closure_slot)) {
        return false;
    }
    if(uses_write_log && (!sqjit_native_emit_lea_rdi_mem(&buf, write_log_slot) ||
        !sqjit_native_emit_lea_rsi_mem(&buf, log_storage) ||
        !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_write_log_init_frame) ||
        !sqjit_native_emit_call_rax(&buf))) return false;

    for(SQInteger n = 0; n < proto->_nparameters; n++) {
        slots[n].kind = SQ_JIT_SLOT_STACK_OBJECT;
        slots[n].stack_object_reg = n;
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
        return sqjit_native_emit_lea_rdi_mem(&buf, write_log_slot) &&
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
            slots[dst].kind = SQ_JIT_SLOT_INT;
            slots[dst].stack_object_reg = -1;
            slots[dst].literal_object_index = -1;
            slots[dst].int_materialized = materialize_int;
            slots[dst].float_materialized = false;
            slots[dst].known_const = true;
            slots[dst].const_value = value;
        }
        else if(sq_type(proto->_literals[literal_index]) == OT_FLOAT) {
            SQFloat value = _float(proto->_literals[literal_index]);
            if(!sqjit_native_emit_mov_local_float_const(&buf, dst, value)) {
                return false;
            }
            slots[dst].kind = SQ_JIT_SLOT_FLOAT;
            slots[dst].stack_object_reg = -1;
            slots[dst].literal_object_index = -1;
            slots[dst].int_materialized = false;
            slots[dst].float_materialized = true;
            slots[dst].known_const = true;
            slots[dst].float_const_value = value;
        }
        else {
            slots[dst].kind = SQ_JIT_SLOT_LITERAL_OBJECT;
            slots[dst].stack_object_reg = -1;
            slots[dst].literal_object_index = literal_index;
            slots[dst].int_materialized = false;
            slots[dst].float_materialized = false;
            slots[dst].known_const = false;
        }
        return true;
    };

    auto ensure_int_slot = [&](SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slots[slot].kind == SQ_JIT_SLOT_INT) {
            if(!slots[slot].int_materialized) {
                if(!slots[slot].known_const || !sqjit_native_emit_mov_mem_imm32(&buf, slot, slots[slot].const_value)) {
                    return false;
                }
                slots[slot].int_materialized = true;
            }
            return true;
        }
        if(slots[slot].kind != SQ_JIT_SLOT_STACK_OBJECT || slots[slot].stack_object_reg < 0) {
            return false;
        }
        if(!sqjit_native_emit_cmp_stack_type_i32(&buf, slots[slot].stack_object_reg, OT_INTEGER) ||
            !emit_guard_fail_jump() ||
            !sqjit_native_emit_mov_rax_stack_value(&buf, slots[slot].stack_object_reg) ||
            !sqjit_native_emit_mov_mem_rax(&buf, slot)) {
            return false;
        }
        slots[slot].kind = SQ_JIT_SLOT_INT;
        slots[slot].stack_object_reg = -1;
        slots[slot].literal_object_index = -1;
        slots[slot].int_materialized = true;
        slots[slot].float_materialized = false;
        slots[slot].known_const = false;
        return true;
    };

    auto ensure_float_slot = [&](SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slots[slot].kind == SQ_JIT_SLOT_FLOAT) {
            if(!slots[slot].float_materialized) {
                if(!slots[slot].known_const ||
                    !sqjit_native_emit_mov_local_float_const(&buf, slot, slots[slot].float_const_value)) {
                    return false;
                }
                slots[slot].float_materialized = true;
            }
            return true;
        }
        if(slots[slot].kind != SQ_JIT_SLOT_STACK_OBJECT || slots[slot].stack_object_reg < 0) {
            return false;
        }
        if(!sqjit_native_emit_cmp_stack_type_i32(&buf, slots[slot].stack_object_reg, OT_FLOAT) ||
            !emit_guard_fail_jump() ||
            !sqjit_native_emit_mov_xmm0_stack_float_value(&buf, slots[slot].stack_object_reg) ||
            !sqjit_native_emit_mov_local_float_xmm0(&buf, slot)) {
            return false;
        }
        slots[slot].kind = SQ_JIT_SLOT_FLOAT;
        slots[slot].stack_object_reg = -1;
        slots[slot].literal_object_index = -1;
        slots[slot].int_materialized = false;
        slots[slot].float_materialized = true;
        slots[slot].known_const = false;
        return true;
    };

    auto emit_table_get_integer_literal = [&](SQInteger dst, SQInteger base, SQInteger literal_index) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals ||
            slots[base].kind != SQ_JIT_SLOT_STACK_OBJECT || slots[base].stack_object_reg < 0) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_mov_rdi_r13(&buf) ||
            !sqjit_native_emit_mov_rsi_i64(&buf, slots[base].stack_object_reg) ||
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
        slots[dst].kind = SQ_JIT_SLOT_INT;
        slots[dst].stack_object_reg = -1;
        slots[dst].literal_object_index = -1;
        slots[dst].int_materialized = true;
        slots[dst].known_const = false;
        return true;
    };

    auto emit_table_get_float_literal = [&](SQInteger dst, SQInteger base, SQInteger literal_index) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals ||
            slots[base].kind != SQ_JIT_SLOT_STACK_OBJECT || slots[base].stack_object_reg < 0) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_mov_rdi_r13(&buf) ||
            !sqjit_native_emit_mov_rsi_i64(&buf, slots[base].stack_object_reg) ||
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
        slots[dst].kind = SQ_JIT_SLOT_FLOAT;
        slots[dst].stack_object_reg = -1;
        slots[dst].literal_object_index = -1;
        slots[dst].int_materialized = false;
        slots[dst].float_materialized = true;
        slots[dst].known_const = false;
        return true;
    };

    auto emit_outer_get_integer = [&](SQInteger dst, SQInteger outer_index) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || outer_index < 0 ||
            outer_index >= proto->_noutervalues) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_mov_rdi_mem(&buf, closure_slot) ||
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
        slots[dst].kind = SQ_JIT_SLOT_INT;
        slots[dst].stack_object_reg = -1;
        slots[dst].literal_object_index = -1;
        slots[dst].int_materialized = true;
        slots[dst].float_materialized = false;
        slots[dst].known_const = false;
        return true;
    };

    auto emit_outer_get_float = [&](SQInteger dst, SQInteger outer_index) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || outer_index < 0 ||
            outer_index >= proto->_noutervalues) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_mov_rdi_mem(&buf, closure_slot) ||
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
        slots[dst].kind = SQ_JIT_SLOT_FLOAT;
        slots[dst].stack_object_reg = -1;
        slots[dst].literal_object_index = -1;
        slots[dst].int_materialized = false;
        slots[dst].float_materialized = true;
        slots[dst].known_const = false;
        return true;
    };

    auto emit_new_array = [&](SQInteger dst, SQInteger reserve) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || reserve < 0) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_mov_rdi_r13(&buf) ||
            !sqjit_native_emit_mov_rsi_local_mem(&buf, closure_slot) ||
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
        slots[dst].kind = SQ_JIT_SLOT_STACK_OBJECT;
        slots[dst].stack_object_reg = dst;
        slots[dst].literal_object_index = -1;
        slots[dst].int_materialized = false;
        slots[dst].float_materialized = false;
        slots[dst].known_const = false;
        return true;
    };

    auto emit_append_array_stack = [&](SQInteger array_reg, SQInteger value_reg) -> bool {
        if(array_reg < 0 || array_reg >= MAX_FUNC_STACKSIZE ||
            value_reg < 0 || value_reg >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(slots[value_reg].kind == SQ_JIT_SLOT_FLOAT) {
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
        if(slot == 0xFF) return true;
        if(slot < 0 || slot >= proto->_stacksize) return false;
        slots[slot].MarkScalar(SQ_JIT_SLOT_INT, false);
        return true;
    };

    auto mark_float_slot = [&](SQInteger slot) -> bool {
        if(slot == 0xFF) return true;
        if(slot < 0 || slot >= proto->_stacksize) return false;
        slots[slot].MarkScalar(SQ_JIT_SLOT_FLOAT, false);
        return true;
    };

    auto mark_bool_slot = [&](SQInteger slot) -> bool {
        if(!mark_int_slot(slot)) return false;
        if(slot != 0xFF) slots[slot].kind = SQ_JIT_SLOT_BOOL;
        return true;
    };

    auto copy_bool_slot = [&](SQInteger dst, SQInteger src) -> bool {
        return dst == 0xFF ||
            (src >= 0 && src < proto->_stacksize && slots[src].kind == SQ_JIT_SLOT_BOOL &&
             sqjit_native_emit_mov_rax_mem(&buf, src) &&
             sqjit_native_emit_mov_mem_rax(&buf, dst) && mark_bool_slot(dst));
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
        slots[dst].known_const = slots[src].known_const;
        slots[dst].const_value = slots[src].const_value;
        return true;
    };

    auto copy_float_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == 0xFF) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || !ensure_float_slot(src) ||
            !sqjit_native_emit_copy_float(&buf, dst, src) ||
            !mark_float_slot(dst)) {
            return false;
        }
        slots[dst].known_const = slots[src].known_const;
        slots[dst].float_const_value = slots[src].float_const_value;
        return true;
    };

    auto emit_table_set_integer_literal = [&](SQInteger target, SQInteger base, SQInteger literal_index, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals ||
            value < 0 || value >= MAX_FUNC_STACKSIZE ||
            slots[base].kind != SQ_JIT_SLOT_STACK_OBJECT || slots[base].stack_object_reg < 0 ||
            !ensure_int_slot(value)) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_lea_rdi_mem(&buf, write_log_slot) ||
            !sqjit_native_emit_mov_rsi_r13(&buf) ||
            !sqjit_native_emit_mov_rdx_i64(&buf, slots[base].stack_object_reg) ||
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
            slots[base].kind != SQ_JIT_SLOT_STACK_OBJECT || slots[base].stack_object_reg < 0 ||
            !ensure_float_slot(value)) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_lea_rdi_mem(&buf, write_log_slot) ||
            !sqjit_native_emit_mov_rsi_r13(&buf) ||
            !sqjit_native_emit_mov_rdx_i64(&buf, slots[base].stack_object_reg) ||
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
            ((slots[slot].kind == SQ_JIT_SLOT_FLOAT) ||
            (slots[slot].kind == SQ_JIT_SLOT_STACK_OBJECT && slots[slot].stack_object_reg >= 0 &&
                sq_type(entry_stack[slots[slot].stack_object_reg]) == OT_FLOAT));
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
            !mark_bool_slot(target)) {
            return false;
        }
        return true;
    };

    auto slot_is_float = [&](SQInteger slot) -> bool {
        return slot >= 0 && slot < MAX_FUNC_STACKSIZE && slots[slot].kind == SQ_JIT_SLOT_FLOAT;
    };

    auto float_operand = [&](SQInteger slot, SQInteger scratch) -> SQInteger {
        if(slot_is_observed_float(slot)) return ensure_float_slot(slot) ? slot : -1;
        if(!ensure_int_slot(slot) || !sqjit_native_emit_mov_rax_mem(&buf,slot) ||
            !sqjit_native_emit_convert_rax_float(&buf) ||
            !sqjit_native_emit_mov_local_float_xmm0(&buf,scratch)) return -1;
        return scratch; // Preserve the original integer slot and its tag.
    };
    auto emit_float_binary = [&](SQOpcode op, SQInteger dst, SQInteger left, SQInteger right) -> bool {
        // Integer/integer division retains truncating interpreter semantics.
        if(!slot_is_observed_float(left) && !slot_is_observed_float(right)) return false;
        SQInteger lhs = float_operand(left,numeric_scratch);
        SQInteger rhs = float_operand(right,numeric_scratch+1);
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || lhs < 0 || rhs < 0 ||
            !sqjit_native_emit_mov_xmm0_local_float(&buf, lhs) ||
            !sqjit_native_emit_float_op_xmm0_local(&buf, op, rhs) ||
            !sqjit_native_emit_mov_local_float_xmm0(&buf, dst) ||
            !mark_float_slot(dst)) {
            return false;
        }
        return true;
    };

    auto observed_stack_reg = [&](SQInteger slot) -> SQInteger {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE || slots[slot].kind != SQ_JIT_SLOT_STACK_OBJECT) {
            return -1;
        }
        return slots[slot].stack_object_reg;
    };

    SQJitX64Memory memory(proto, entry_stack, buf, slots, analysis, proto->_ninstructions - 1, false,
        ensure_int_slot, [&](SQJitNativeJcc condition) {
            SQInteger patch = 0;
            return sqjit_native_emit_jcc_placeholder(&buf, condition, &patch) &&
                sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                    MAX_FUNC_STACKSIZE + 512, patch, -1);
        }, &virtual_arrays, virtual_base, ensure_float_slot, &member_plan, member_base);

    SQJitX64Calls calls(proto, entry_stack, buf, slots, closure_slot, false,
        ensure_int_slot, ensure_float_slot, emit_guard_fail_jump, leaf_scratch_slots);
    if(!member_plan.fields.empty()) calls.RequireStableHeap();
    if(!calls.HoistGuards(analysis, 0, proto->_ninstructions - 1) ||
        !memory.HoistArrayGuards(0) || !memory.HoistMembers()) return false;

    // Parameter loads must dominate every native use. Loading on the first
    // lowered branch leaves later arms uninitialized if that arm is skipped.
    // Loading inside a loop also reinitializes parameters changed by a backedge.
    SQSlotSet entry_parameters;
    bool has_branches = false;
    for(SQInteger ip=0; ip<proto->_ninstructions; ++ip) {
        entry_parameters |= analysis.loop_written[ip];
        has_branches = has_branches || analysis.facts[ip].target >= 0;
    }
    if(has_branches) entry_parameters |= analysis.live_in[0];
    for(SQInteger n=0; n<proto->_nparameters; ++n) if(entry_parameters.test(n)) {
        if(sq_type(entry_stack[n]) == OT_INTEGER) { if(!ensure_int_slot(n)) return false; }
        else if(sq_type(entry_stack[n]) == OT_FLOAT) { if(!ensure_float_slot(n)) return false; }
    }

    SQJitX64FloatLoops float_loops(proto, analysis, 0, proto->_ninstructions - 1, buf.cache_floats);

    for(SQInteger ip = 0; ip < proto->_ninstructions; ip++) {
        // A value initialized before a loop is not constant in its body when
        // the backedge can change it (notably an array index incremented at
        // the end). Materialize the initial value before the jump target.
        for(SQInteger slot = 0; slot < proto->_stacksize; ++slot) {
            if(!slots[slot].known_const || !analysis.loop_written[ip].test(slot)) continue;
            if(slots[slot].kind == SQ_JIT_SLOT_INT && !ensure_int_slot(slot)) return false;
            if(slots[slot].kind == SQ_JIT_SLOT_FLOAT && !ensure_float_slot(slot)) return false;
            slots[slot].known_const = false;
        }
        // Constants from only one predecessor cannot describe a join. Any
        // delayed load is emitted on its own predecessor before the label.
        if(analysis.leaders[ip]) for(SQInteger n = 0; n < proto->_stacksize; ++n) {
            if(!slots[n].known_const) continue;
            if(slots[n].kind == SQ_JIT_SLOT_INT && !ensure_int_slot(n)) return false;
            if(slots[n].kind == SQ_JIT_SLOT_FLOAT && !ensure_float_slot(n)) return false;
            slots[n].known_const = false; slots[n].const_value = 0;
        }
        // Native scalar temporaries are private; guards replay from the VM
        // stack. Whole functions only need live values, while loop regions
        // conservatively retain VM locals for their existing exit writeback.
        for(SQInteger n=0; n<proto->_stacksize; ++n)
            if(!analysis.live_in[ip].test(n)) sqjit_native_discard_float_slot(&buf, n);
        sqjit_native_discard_float_slot(&buf, numeric_scratch);
        sqjit_native_discard_float_slot(&buf, numeric_scratch + 1);
        if(analysis.leaders[ip] && !float_loops.Enter(ip, buf, slots)) return false;
        ip_to_offset[ip] = buf.size;
        attempt.SetIP(ip);
        const SQInstruction &inst = proto->_instructions[ip];
        calls.Begin(inst);

        switch(inst.op) {
            case _OP_DMOVE:
                if(!calls.CopyScalar(inst._arg0, inst._arg1) || !calls.CopyScalar(inst._arg2, inst._arg3))
                    return attempt.Reject(ip, SQ_JIT_REJECT_OTHER, "unsupported paired scalar move");
                break;
            case _OP_PREPCALLK:
                if(!calls.Prepare(inst)) return attempt.Reject(ip, SQ_JIT_REJECT_CALL, "unsupported callee or receiver");
                break;
            case _OP_CALL:
            case _OP_TAILCALL:
                if(!calls.Call(inst)) return attempt.Reject(ip, SQ_JIT_REJECT_CALL, "unsupported call arguments");
                break;
            case _OP_LINE:
                break;
            case _OP_LOADINT: {
                SQInteger value = sqjit_loadint_value(inst);
                bool materialize_int = !sqjit_next_consumes_load_as_immediate(proto, analysis, ip, inst._arg0);
                if(materialize_int && !sqjit_native_emit_mov_mem_imm32(&buf, inst._arg0, value)) {
                    return false;
                }
                slots[inst._arg0].kind = SQ_JIT_SLOT_INT;
                slots[inst._arg0].stack_object_reg = -1;
                slots[inst._arg0].literal_object_index = -1;
                slots[inst._arg0].int_materialized = materialize_int;
                slots[inst._arg0].known_const = true;
                slots[inst._arg0].const_value = value;
                break;
            }
            case _OP_LOADFLOAT: {
                SQFloat value;
                if(!sqjit_loadfloat_value(inst, &value) ||
                    !sqjit_native_emit_mov_local_float_const(&buf, inst._arg0, value)) {
                    return false;
                }
                slots[inst._arg0].kind = SQ_JIT_SLOT_FLOAT;
                slots[inst._arg0].stack_object_reg = -1;
                slots[inst._arg0].literal_object_index = -1;
                slots[inst._arg0].int_materialized = false;
                slots[inst._arg0].float_materialized = true;
                slots[inst._arg0].known_const = true;
                slots[inst._arg0].float_const_value = value;
                break;
            }
            case _OP_LOAD: {
                if(!load_literal_slot(inst._arg0, inst._arg1,
                    !sqjit_next_consumes_load_as_immediate(proto, analysis, ip, inst._arg0))) {
                    return false;
                }
                break;
            }
            case _OP_DLOAD: {
                if(!load_literal_slot(inst._arg0, inst._arg1,
                    !sqjit_next_consumes_load_as_immediate(proto, analysis, ip, inst._arg0)) ||
                    !load_literal_slot(inst._arg2, inst._arg3,
                    !sqjit_next_consumes_load_as_immediate(proto, analysis, ip, inst._arg2))) {
                    return false;
                }
                break;
            }
            case _OP_LOADBOOL:
                if(!sqjit_native_emit_mov_mem_imm32(&buf, inst._arg0, inst._arg1 != 0) ||
                    !mark_bool_slot(inst._arg0)) return false;
                break;
            case _OP_MOVE:
                if((slots[inst._arg1].kind == SQ_JIT_SLOT_ARRAY_PTR || slots[inst._arg1].kind == SQ_JIT_SLOT_STRING_PTR) &&
                    memory.CopyObject(inst._arg0, inst._arg1)) break;
                if(slots[inst._arg1].kind == SQ_JIT_SLOT_BOOL) {
                    if(!copy_bool_slot(inst._arg0, inst._arg1)) return false;
                }
                else if(slots[inst._arg1].kind == SQ_JIT_SLOT_FLOAT) {
                    if(!copy_float_slot(inst._arg0, inst._arg1)) {
                        return false;
                    }
                }
                else if(slots[inst._arg1].kind == SQ_JIT_SLOT_INT) {
                    if(!ensure_int_slot(inst._arg1) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                    slots[inst._arg0].kind = SQ_JIT_SLOT_INT;
                    slots[inst._arg0].stack_object_reg = -1;
                    slots[inst._arg0].literal_object_index = -1;
                    slots[inst._arg0].int_materialized = true;
                    slots[inst._arg0].float_materialized = false;
                }
                else if(slots[inst._arg1].kind == SQ_JIT_SLOT_STACK_OBJECT) {
                    slots[inst._arg0].kind = SQ_JIT_SLOT_STACK_OBJECT;
                    slots[inst._arg0].stack_object_reg = slots[inst._arg1].stack_object_reg;
                    slots[inst._arg0].literal_object_index = -1;
                    slots[inst._arg0].int_materialized = false;
                    slots[inst._arg0].float_materialized = false;
                }
                else if(slots[inst._arg1].kind == SQ_JIT_SLOT_LITERAL_OBJECT) {
                    slots[inst._arg0].kind = SQ_JIT_SLOT_LITERAL_OBJECT;
                    slots[inst._arg0].stack_object_reg = -1;
                    slots[inst._arg0].literal_object_index = slots[inst._arg1].literal_object_index;
                    slots[inst._arg0].int_materialized = false;
                    slots[inst._arg0].float_materialized = false;
                }
                else {
                    return false;
                }
                slots[inst._arg0].known_const = slots[inst._arg1].kind != SQ_JIT_SLOT_BOOL && slots[inst._arg1].known_const;
                slots[inst._arg0].const_value = slots[inst._arg1].const_value;
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
            case _OP_GETK: {
                SQInteger base = inst.op == _OP_GETK ? inst._arg2 : inst._arg1;
                SQInteger key = inst._arg2;
                SQInteger cached_key = inst.op == _OP_GETK ? inst._arg1 : member_plan.Key(ip, key);
                if(memory.HasMember(base, cached_key)) {
                    if(!memory.MemberGet(inst._arg0, base, cached_key)) return false;
                    break;
                }
                SQInteger literal = inst.op == _OP_GETK ? inst._arg1 :
                    slots[key].kind == SQ_JIT_SLOT_LITERAL_OBJECT ? slots[key].literal_object_index : -1;
                if(literal >= 0) {
                    if(literal >= proto->_nliterals) return false;
                    if(sq_type(proto->_literals[literal]) == OT_INTEGER) {
                        if(!memory.ArrayGet(ip, inst._arg0, base, -1, true,
                            _integer(proto->_literals[literal]))) return false;
                    }
                    else if(sqjit_observed_table_value_type(entry_stack,
                        observed_stack_reg(base), &proto->_literals[literal]) == OT_ARRAY) {
                        if(!memory.MemberGet(inst._arg0, base, literal)) return false;
                    }
                    else if(sqjit_observed_table_value_type(entry_stack,
                        observed_stack_reg(base), &proto->_literals[literal]) == OT_FLOAT) {
                        if(!emit_table_get_float_literal(inst._arg0, base, literal)) return false;
                    }
                    else if(!emit_table_get_integer_literal(inst._arg0, base, literal)) return false;
                }
                else if(inst.op == _OP_GETK || !memory.ArrayGet(ip, inst._arg0, base, key,
                    slots[key].known_const, slots[key].const_value)) return false;
                break;
            }
            case _OP_NEWOBJ:
                if(memory.VirtualNew(ip)) break;
                if(inst._arg3 != NOT_ARRAY || !emit_new_array(inst._arg0, inst._arg1)) {
                    return false;
                }
                break;
            case _OP_APPENDARRAY:
                if(slots[inst._arg0].kind == SQ_JIT_SLOT_VIRTUAL_ARRAY) {
                    if(!memory.VirtualAppend(ip)) return false;
                    break;
                }
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
                {
                    SQInteger literal = member_plan.Key(ip, inst._arg2);
                    if(memory.HasMember(inst._arg1, literal)) {
                        if(!uses_write_log || !memory.MemberSetLiteral(inst._arg0, inst._arg1,
                            literal, inst._arg3, write_log_slot)) return false;
                        break;
                    }
                }
                if(slots[inst._arg2].kind == SQ_JIT_SLOT_LITERAL_OBJECT) {
                    SQInteger literal_index = slots[inst._arg2].literal_object_index;
                    if(literal_index < 0 || literal_index >= proto->_nliterals) {
                        return false;
                    }
                    if(sq_type(proto->_literals[literal_index]) == OT_INTEGER) {
                        if(slot_is_observed_float(inst._arg3)) {
                            if(!memory.ArraySet(inst._arg0, inst._arg1, -1, inst._arg3, write_log_slot, true, true, _integer(proto->_literals[literal_index]))) {
                                return false;
                            }
                        }
                        else if(!memory.ArraySet(inst._arg0, inst._arg1, -1, inst._arg3, write_log_slot, false, true, _integer(proto->_literals[literal_index]))) {
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
                else if(slots[inst._arg2].known_const) {
                    if(slot_is_observed_float(inst._arg3)) {
                        if(!memory.ArraySet(inst._arg0, inst._arg1, -1, inst._arg3, write_log_slot, true, true, slots[inst._arg2].const_value)) {
                            return false;
                        }
                    }
                    else if(!memory.ArraySet(inst._arg0, inst._arg1, -1, inst._arg3, write_log_slot, false, true, slots[inst._arg2].const_value)) {
                        return false;
                    }
                }
                else if(slot_is_observed_float(inst._arg3)) {
                    if(!memory.ArraySet(inst._arg0, inst._arg1, inst._arg2, inst._arg3, write_log_slot, true)) {
                        return false;
                    }
                }
                else if(!memory.ArraySet(inst._arg0, inst._arg1, inst._arg2, inst._arg3, write_log_slot, false)) {
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
                if(slot_is_observed_float(inst._arg1) || slot_is_observed_float(inst._arg2)) {
                    if(!emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                        return false;
                    }
                    break;
                }
                SQInteger imm = 0;
                if(sqjit_previous_loads_int_const(proto, analysis, ip, inst._arg1, &imm) && sqjit_native_is_int32(imm)) {
                    if(!ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_add_rax_i32(&buf, imm) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                }
                else if(sqjit_previous_loads_int_const(proto, analysis, ip, inst._arg2, &imm) && sqjit_native_is_int32(imm)) {
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
                slots[inst._arg0].kind = SQ_JIT_SLOT_INT;
                slots[inst._arg0].stack_object_reg = -1;
                slots[inst._arg0].literal_object_index = -1;
                slots[inst._arg0].int_materialized = true;
                slots[inst._arg0].float_materialized = false;
                slots[inst._arg0].known_const = false;
                break;
                }
            case _OP_SUB:
                {
                if(slot_is_observed_float(inst._arg1) || slot_is_observed_float(inst._arg2)) {
                    if(!emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                        return false;
                    }
                    break;
                }
                SQInteger imm = 0;
                if(sqjit_previous_loads_int_const(proto, analysis, ip, inst._arg1, &imm) && sqjit_native_is_int32(imm)) {
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
                slots[inst._arg0].kind = SQ_JIT_SLOT_INT;
                slots[inst._arg0].stack_object_reg = -1;
                slots[inst._arg0].literal_object_index = -1;
                slots[inst._arg0].int_materialized = true;
                slots[inst._arg0].float_materialized = false;
                slots[inst._arg0].known_const = false;
                break;
                }
            case _OP_MUL:
                {
                if(slot_is_observed_float(inst._arg1) || slot_is_observed_float(inst._arg2)) {
                    if(!emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                        return false;
                    }
                    break;
                }
                SQInteger imm = 0;
                if(sqjit_previous_loads_int_const(proto, analysis, ip, inst._arg1, &imm) && sqjit_native_is_int32(imm)) {
                    if(!ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_imul_rax_i32(&buf, imm) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                }
                else if(sqjit_previous_loads_int_const(proto, analysis, ip, inst._arg2, &imm) && sqjit_native_is_int32(imm)) {
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
                slots[inst._arg0].kind = SQ_JIT_SLOT_INT;
                slots[inst._arg0].stack_object_reg = -1;
                slots[inst._arg0].literal_object_index = -1;
                slots[inst._arg0].int_materialized = true;
                slots[inst._arg0].float_materialized = false;
                slots[inst._arg0].known_const = false;
                break;
                }
            case _OP_DIV: {
                SQInteger divisor = 0;
                if(!slot_is_float(inst._arg2) &&
                    sqjit_previous_loads_int_const(proto, analysis, ip, inst._arg1, &divisor) && divisor > 0) {
                    if(!ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_divmod_constant(&buf, divisor, false) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) return false;
                    slots[inst._arg0].MarkScalar(SQ_JIT_SLOT_INT, true);
                    break;
                }
                if(!emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                    return false;
                }
                break;
            }
            case _OP_MOD: {
                SQInteger divisor = 0;
                if(!ensure_int_slot(inst._arg2) || !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2)) {
                    return false;
                }
                if(sqjit_previous_loads_positive_int_const(proto, analysis, ip, inst._arg1) &&
                    sqjit_previous_loads_int_const(proto, analysis, ip, inst._arg1, &divisor)) {
                    // Compact IDIV wins in helper-heavy mutation loops; the
                    // reciprocal sequence pays off in scalar-only kernels.
                    if(uses_write_log) {
                        if(!sqjit_native_emit_mov_rcx_imm64(&buf,divisor) ||
                            !sqjit_native_emit_idiv_rcx(&buf) ||
                            !sqjit_native_emit_mov_rax_rdx(&buf)) return false;
                    }
                    else if(!sqjit_native_emit_divmod_constant(&buf, divisor, true)) return false;
                }
                else {
                    SQInteger patch_offset = 0;
                    // Materializing the divisor can use RAX. Reload the
                    // dividend afterwards, including on the first frame call.
                    if(!ensure_int_slot(inst._arg1) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_mov_rcx_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_cmp_rcx_i32(&buf, 0) ||
                        !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_LE, &patch_offset) ||
                        !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                            MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
                        !sqjit_native_emit_idiv_rcx(&buf) ||
                        !sqjit_native_emit_mov_rax_rdx(&buf)) {
                        return false;
                    }
                }
                if(!sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                    return false;
                }
                slots[inst._arg0].kind = SQ_JIT_SLOT_INT;
                slots[inst._arg0].stack_object_reg = -1;
                slots[inst._arg0].literal_object_index = -1;
                slots[inst._arg0].int_materialized = true;
                slots[inst._arg0].float_materialized = false;
                slots[inst._arg0].known_const = false;
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
                slots[inst._arg0].kind = SQ_JIT_SLOT_INT;
                slots[inst._arg0].stack_object_reg = -1;
                slots[inst._arg0].literal_object_index = -1;
                slots[inst._arg0].int_materialized = true;
                slots[inst._arg0].float_materialized = false;
                slots[inst._arg0].known_const = slots[inst._arg1].kind != SQ_JIT_SLOT_BOOL && slots[inst._arg1].known_const;
                slots[inst._arg0].const_value = slots[inst._arg1].const_value;
                slots[inst._arg1].known_const = false;
                break;
            }
            case _OP_JMP: {
                SQInteger patch_offset = 0;
                SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
                if(target_ip < 0 || target_ip > proto->_ninstructions ||
                    !float_loops.Jump(target_ip, buf, &patch_offset) ||
                    !sqjit_native_record_reloc(relocs, &nrelocs, 512, patch_offset, target_ip)) {
                    return false;
                }
                break;
            }
            case _OP_JZ: {
                SQInteger patch_offset = 0;
                SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
                if((slots[inst._arg0].kind != SQ_JIT_SLOT_BOOL && !ensure_int_slot(inst._arg0)) ||
                    target_ip < 0 || target_ip > proto->_ninstructions ||
                    !sqjit_native_emit_mov_rax_mem(&buf, inst._arg0) ||
                    !sqjit_native_emit_cmp_rax_i32(&buf, 0) ||
                    !float_loops.Condition(ip, buf, SQ_JIT_JCC_E, &patch_offset) ||
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
                        !float_loops.Condition(ip, buf, jcc, &patch_offset) ||
                        !sqjit_native_record_reloc(relocs, &nrelocs, 512, patch_offset, target_ip)) {
                        return false;
                    }
                }
                else if(!ensure_int_slot(inst._arg0) || !ensure_int_slot(inst._arg2) ||
                    !sqjit_native_cmp_false_jcc((CmpOP)inst._arg3, &jcc) ||
                    !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                    !sqjit_native_emit_cmp_rax_mem(&buf, inst._arg0) ||
                    !float_loops.Condition(ip, buf, jcc, &patch_offset) ||
                    !sqjit_native_record_reloc(relocs, &nrelocs, 512, patch_offset, target_ip)) {
                    return false;
                }
                break;
            }
            case _OP_THROW: {
                // Scalar replacement has no externally visible writes. A
                // failed virtual-array bound check replays the original code.
                if(!native->_scalarized) return false;
                SQInteger patch = 0;
                if(!sqjit_native_emit_jmp_placeholder(&buf,&patch) ||
                    !sqjit_native_record_reloc(guard_fail_relocs,&nguard_fail_relocs,
                        MAX_FUNC_STACKSIZE+512,patch,-1)) return false;
                break;
            }
            case _OP_RETURN:
                if(inst._arg0 == 0xFF) {
                    if(!sqjit_native_emit_mov_rax_imm64(&buf,0) ||
                        !sqjit_native_emit_mov_out_value_rax(&buf) ||
                        !sqjit_native_emit_mov_out_type_i32(&buf,OT_NULL)) return false;
                }
                else if(slots[inst._arg1].kind == SQ_JIT_SLOT_BOOL) {
                    if(!sqjit_native_emit_mov_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_mov_out_value_rax(&buf) ||
                        !sqjit_native_emit_mov_out_type_i32(&buf, OT_BOOL)) return false;
                }
                else if(slot_is_float(inst._arg1)) {
                    if(!ensure_float_slot(inst._arg1) ||
                        !sqjit_native_emit_store_out_float_from_local(&buf, inst._arg1)) {
                        return false;
                    }
                }
                else if(slots[inst._arg1].kind == SQ_JIT_SLOT_STACK_OBJECT &&
                    slots[inst._arg1].stack_object_reg >= 0) {
                    if(!emit_return_stack_object(slots[inst._arg1].stack_object_reg)) {
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
        typeflow.Record(ip, slots);
    }
    if(!typeflow.Validate(proto, entry_stack))
        return attempt.Reject(-1, SQ_JIT_REJECT_OTHER, "incompatible scalar types at branch join");

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

    if(!sqjit_native_install(native, &buf))
        return attempt.Reject(-1, SQ_JIT_REJECT_RESOURCE, "executable memory installation failed");
    calls.RetainDependencies(native->_code);
    return true;
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

    SQBytecodeAnalysis analysis;
    if(!analysis.Build(proto->_instructions, proto->_ninstructions, proto->_stacksize))
        return attempt.Reject(-1, SQ_JIT_REJECT_INVALID_BYTECODE, "invalid bytecode operands or control flow");

    std::vector<SQInteger> ip_to_offset(proto->_ninstructions + 1, -1);
    SQJitNativeReloc relocs[512];
    SQInteger nrelocs = 0;
    SQJitNativeReloc exit_relocs[128];
    SQInteger nexit_relocs = 0;
    SQJitNativeReloc guard_fail_relocs[MAX_FUNC_STACKSIZE + 512];
    SQInteger nguard_fail_relocs = 0;
    SQJitTypeFlow typeflow(analysis, start_ip, end_ip, proto->_stacksize);
    SQJitSlotState slots[MAX_FUNC_STACKSIZE];
    for(SQInteger n = 0; n < MAX_FUNC_STACKSIZE; n++) {
        slots[n].kind = SQ_JIT_SLOT_STACK_OBJECT;
        slots[n].stack_object_reg = n;
        slots[n].literal_object_index = -1;
        slots[n].int_materialized = false;
        slots[n].float_materialized = false;
        slots[n].known_const = false;
        slots[n].entry_loaded = false;
        slots[n].dirty = false;
        slots[n].const_value = 0;
        slots[n].float_const_value = 0;
    }

    SQJitNativeCodeBuffer buf;
    buf.size = 0;
    assign_scalar_registers(proto, entry_stack, analysis, buf);

    bool uses_write_log = false;
    for(SQInteger ip = start_ip; ip <= end_ip; ip++) {
        if(proto->_instructions[ip].op == _OP_SET) {
            uses_write_log = true;
            break;
        }
    }

    // Reserved slots must stay outside the emitter's pinned slots 1..3.
    const SQInteger closure_slot = proto->_stacksize > 3 ? proto->_stacksize : 4;
    const SQInteger write_log_slot = closure_slot + 1;
    bool has_calls = false;
    for(SQInteger ip = 0; ip < proto->_ninstructions; ++ip)
        has_calls = has_calls || proto->_instructions[ip].op == _OP_CALL || proto->_instructions[ip].op == _OP_TAILCALL;
    SQInteger leaf_scratch_slots = SQJitX64Calls::LeafScratchSlots(proto, entry_stack, start_ip, end_ip);
    // Register retention pays for inlined scalar chains; helper-heavy math
    // regressed when every call forced the cache to spill. Keep it scoped.
    buf.cache_floats = leaf_scratch_slots > 0 && !uses_write_log;
    SQJitVirtualArrayPlan virtual_arrays;
    virtual_arrays.Build(proto, analysis, start_ip, end_ip);
    if(virtual_arrays.slots && !has_calls && !uses_write_log) buf.cache_floats = true;
    SQInteger last_reserved_slot = has_calls ? closure_slot + 3 + leaf_scratch_slots : uses_write_log ? write_log_slot : closure_slot;
    const SQInteger virtual_base = last_reserved_slot + 1;
    last_reserved_slot += virtual_arrays.slots;
    const SQInteger numeric_scratch = last_reserved_slot + 1;
    last_reserved_slot += 2;
    SQJitMemberPlan member_plan;
    member_plan.Build(proto, entry_stack, analysis, start_ip, end_ip);
    const SQInteger member_base = last_reserved_slot + 1;
    last_reserved_slot += member_plan.Words();
    static_assert(alignof(SQJitWriteLog) <= sizeof(SQInteger), "native frame alignment");
    if(uses_write_log) last_reserved_slot += (sizeof(SQJitWriteLog) + sizeof(SQInteger) - 1) / sizeof(SQInteger);
    const SQInteger log_storage = last_reserved_slot;
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
        !sqjit_native_emit_mov_local_mem_rax(&buf, closure_slot)) {
        return false;
    }
    if(uses_write_log && (!sqjit_native_emit_lea_rdi_mem(&buf, write_log_slot) ||
        !sqjit_native_emit_lea_rsi_mem(&buf, log_storage) ||
        !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_write_log_init_frame) ||
        !sqjit_native_emit_call_rax(&buf))) return false;

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
        return sqjit_native_emit_lea_rdi_mem(&buf, write_log_slot) &&
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
            slots[dst].kind = SQ_JIT_SLOT_INT;
            slots[dst].int_materialized = materialize_int;
            slots[dst].float_materialized = false;
            slots[dst].known_const = true;
            slots[dst].const_value = value;
        }
        else if(sq_type(proto->_literals[literal_index]) == OT_FLOAT) {
            SQFloat value = _float(proto->_literals[literal_index]);
            if(!sqjit_native_emit_mov_local_float_const(&buf, dst, value)) {
                return false;
            }
            slots[dst].kind = SQ_JIT_SLOT_FLOAT;
            slots[dst].int_materialized = false;
            slots[dst].float_materialized = true;
            slots[dst].known_const = true;
            slots[dst].float_const_value = value;
        }
        else if(sq_type(proto->_literals[literal_index]) == OT_STRING) {
            if(!sqjit_native_emit_mov_rax_ptr(&buf, _string(proto->_literals[literal_index])) ||
                !sqjit_native_emit_mov_mem_rax(&buf, dst)) return false;
            slots[dst].MarkScalar(SQ_JIT_SLOT_INT, true);
            slots[dst].kind = SQ_JIT_SLOT_STRING_PTR;
            slots[dst].literal_object_index = literal_index;
        }
        else {
            slots[dst].kind = SQ_JIT_SLOT_LITERAL_OBJECT;
            slots[dst].int_materialized = false;
            slots[dst].float_materialized = false;
            slots[dst].known_const = false;
            slots[dst].literal_object_index = literal_index;
            slots[dst].stack_object_reg = -1;
            slots[dst].dirty = true;
            return true;
        }
        slots[dst].stack_object_reg = -1;
        if(slots[dst].kind != SQ_JIT_SLOT_STRING_PTR) slots[dst].literal_object_index = -1;
        slots[dst].dirty = true;
        return true;
    };

    auto ensure_int_slot = [&](SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slots[slot].kind == SQ_JIT_SLOT_INT) {
            if(!slots[slot].int_materialized) {
                if(!slots[slot].known_const || !sqjit_native_emit_mov_mem_imm32(&buf, slot, slots[slot].const_value)) {
                    return false;
                }
                slots[slot].int_materialized = true;
            }
            return true;
        }
        if(slots[slot].kind != SQ_JIT_SLOT_STACK_OBJECT || slots[slot].stack_object_reg < 0) {
            return false;
        }
        if(!sqjit_native_emit_cmp_stack_type_i32(&buf, slots[slot].stack_object_reg, OT_INTEGER) ||
            !emit_guard_fail_jump() ||
            !sqjit_native_emit_mov_rax_stack_value(&buf, slots[slot].stack_object_reg) ||
            !sqjit_native_emit_mov_mem_rax(&buf, slot)) {
            return false;
        }
        slots[slot].kind = SQ_JIT_SLOT_INT;
        slots[slot].stack_object_reg = -1;
        slots[slot].literal_object_index = -1;
        slots[slot].int_materialized = true;
        slots[slot].float_materialized = false;
        slots[slot].known_const = false;
        slots[slot].entry_loaded = true;
        return true;
    };

    auto ensure_float_slot = [&](SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slots[slot].kind == SQ_JIT_SLOT_FLOAT) {
            if(!slots[slot].float_materialized) {
                if(!slots[slot].known_const ||
                    !sqjit_native_emit_mov_local_float_const(&buf, slot, slots[slot].float_const_value)) {
                    return false;
                }
                slots[slot].float_materialized = true;
            }
            return true;
        }
        if(slots[slot].kind != SQ_JIT_SLOT_STACK_OBJECT || slots[slot].stack_object_reg < 0) {
            return false;
        }
        if(!sqjit_native_emit_cmp_stack_type_i32(&buf, slots[slot].stack_object_reg, OT_FLOAT) ||
            !emit_guard_fail_jump() ||
            !sqjit_native_emit_mov_xmm0_stack_float_value(&buf, slots[slot].stack_object_reg) ||
            !sqjit_native_emit_mov_local_float_xmm0(&buf, slot)) {
            return false;
        }
        slots[slot].kind = SQ_JIT_SLOT_FLOAT;
        slots[slot].stack_object_reg = -1;
        slots[slot].literal_object_index = -1;
        slots[slot].int_materialized = false;
        slots[slot].float_materialized = true;
        slots[slot].known_const = false;
        slots[slot].entry_loaded = true;
        return true;
    };

    auto ensure_bool_slot = [&](SQInteger slot) -> bool {
        if(slot < 0 || slot >= proto->_stacksize) return false;
        if(slots[slot].kind == SQ_JIT_SLOT_BOOL) return true;
        if(slots[slot].kind != SQ_JIT_SLOT_STACK_OBJECT || slots[slot].stack_object_reg < 0 ||
            !sqjit_native_emit_cmp_stack_type_i32(&buf, slots[slot].stack_object_reg, OT_BOOL) ||
            !emit_guard_fail_jump() ||
            !sqjit_native_emit_mov_rax_stack_value(&buf, slots[slot].stack_object_reg) ||
            !sqjit_native_emit_mov_mem_rax(&buf, slot)) return false;
        slots[slot].kind = SQ_JIT_SLOT_BOOL;
        slots[slot].stack_object_reg = slots[slot].literal_object_index = -1;
        slots[slot].int_materialized = slots[slot].entry_loaded = true;
        slots[slot].float_materialized = slots[slot].known_const = false;
        return true;
    };

    auto mark_int_slot = [&](SQInteger slot) -> bool {
        if(slot == 0xFF) return true;
        if(slot < 0 || slot >= proto->_stacksize) return false;
        slots[slot].MarkScalar(SQ_JIT_SLOT_INT, true);
        return true;
    };

    auto mark_float_slot = [&](SQInteger slot) -> bool {
        if(slot == 0xFF) return true;
        if(slot < 0 || slot >= proto->_stacksize) return false;
        slots[slot].MarkScalar(SQ_JIT_SLOT_FLOAT, true);
        return true;
    };

    auto mark_bool_slot = [&](SQInteger slot) -> bool {
        if(!mark_int_slot(slot)) return false;
        if(slot != 0xFF) slots[slot].kind = SQ_JIT_SLOT_BOOL;
        return true;
    };

    auto copy_bool_slot = [&](SQInteger dst, SQInteger src) -> bool {
        return dst == 0xFF ||
            (src >= 0 && src < proto->_stacksize && slots[src].kind == SQ_JIT_SLOT_BOOL &&
             sqjit_native_emit_mov_rax_mem(&buf, src) &&
             sqjit_native_emit_mov_mem_rax(&buf, dst) && mark_bool_slot(dst));
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
        slots[dst].entry_loaded = slots[dst].entry_loaded || slots[src].entry_loaded;
        slots[dst].known_const = slots[src].known_const;
        slots[dst].const_value = slots[src].const_value;
        return true;
    };

    auto copy_float_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == 0xFF) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || !ensure_float_slot(src) ||
            !sqjit_native_emit_copy_float(&buf, dst, src) ||
            !mark_float_slot(dst)) {
            return false;
        }
        slots[dst].entry_loaded = slots[dst].entry_loaded || slots[src].entry_loaded;
        slots[dst].known_const = slots[src].known_const;
        slots[dst].float_const_value = slots[src].float_const_value;
        return true;
    };

    auto slot_is_observed_float = [&](SQInteger slot) -> bool {
        return slot >= 0 && slot < MAX_FUNC_STACKSIZE &&
            ((slots[slot].kind == SQ_JIT_SLOT_FLOAT) ||
            (slots[slot].kind == SQ_JIT_SLOT_STACK_OBJECT && slots[slot].stack_object_reg >= 0 &&
                sq_type(entry_stack[slots[slot].stack_object_reg]) == OT_FLOAT));
    };

    auto emit_table_set_integer_literal = [&](SQInteger target, SQInteger base, SQInteger literal_index, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals ||
            value < 0 || value >= MAX_FUNC_STACKSIZE ||
            slots[base].kind != SQ_JIT_SLOT_STACK_OBJECT || slots[base].stack_object_reg < 0 ||
            !ensure_int_slot(value)) {
            return false;
        }
        SQInteger patch_offset = 0;
        return sqjit_native_emit_lea_rdi_mem(&buf, write_log_slot) &&
            sqjit_native_emit_mov_rsi_r13(&buf) &&
            sqjit_native_emit_mov_rdx_i64(&buf, slots[base].stack_object_reg) &&
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
            slots[base].kind != SQ_JIT_SLOT_STACK_OBJECT || slots[base].stack_object_reg < 0 ||
            !ensure_float_slot(value)) {
            return false;
        }
        SQInteger patch_offset = 0;
        return sqjit_native_emit_lea_rdi_mem(&buf, write_log_slot) &&
            sqjit_native_emit_mov_rsi_r13(&buf) &&
            sqjit_native_emit_mov_rdx_i64(&buf, slots[base].stack_object_reg) &&
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

    auto emit_outer_get_integer = [&](SQInteger dst, SQInteger outer_index) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || outer_index < 0 ||
            outer_index >= proto->_noutervalues) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_mov_rdi_mem(&buf, closure_slot) ||
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
        slots[dst].entry_loaded = true;
        return true;
    };

    auto emit_outer_get_float = [&](SQInteger dst, SQInteger outer_index) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || outer_index < 0 ||
            outer_index >= proto->_noutervalues) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_mov_rdi_mem(&buf, closure_slot) ||
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
        slots[dst].entry_loaded = true;
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
        return slot >= 0 && slot < MAX_FUNC_STACKSIZE && slots[slot].kind == SQ_JIT_SLOT_FLOAT;
    };

    auto float_operand = [&](SQInteger slot, SQInteger scratch) -> SQInteger {
        if(slot_is_observed_float(slot)) return ensure_float_slot(slot) ? slot : -1;
        if(!ensure_int_slot(slot) || !sqjit_native_emit_mov_rax_mem(&buf,slot) ||
            !sqjit_native_emit_convert_rax_float(&buf) ||
            !sqjit_native_emit_mov_local_float_xmm0(&buf,scratch)) return -1;
        return scratch; // Preserve the original integer slot and its tag.
    };
    auto emit_float_binary = [&](SQOpcode op, SQInteger dst, SQInteger left, SQInteger right) -> bool {
        // Integer/integer division retains truncating interpreter semantics.
        if(!slot_is_observed_float(left) && !slot_is_observed_float(right)) return false;
        SQInteger lhs = float_operand(left,numeric_scratch);
        SQInteger rhs = float_operand(right,numeric_scratch+1);
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || lhs < 0 || rhs < 0 ||
            !sqjit_native_emit_mov_xmm0_local_float(&buf, lhs) ||
            !sqjit_native_emit_float_op_xmm0_local(&buf, op, rhs) ||
            !sqjit_native_emit_mov_local_float_xmm0(&buf, dst) ||
            !mark_float_slot(dst)) {
            return false;
        }
        slots[dst].entry_loaded = slots[dst].entry_loaded || slots[left].entry_loaded || slots[right].entry_loaded;
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
            if(analysis.facts[ip].writes.test(slot)) {
                defined_in_loop[slot] = true;
            }
        }
    }
    SQJitSlotKind exit_entry_kind[MAX_FUNC_STACKSIZE] = {};
    for(SQInteger slot = 0; slot < proto->_stacksize; slot++) {
        // A zero-trip loop must preserve its live-out values. Also initialize
        // values assigned only on some body paths before any native exit.
        bool live_out = analysis.live_in[exit_ip].test(slot);
        if(defined_in_loop[slot] && live_out) preload_slot[slot] = true;
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
        else if(sq_type(entry_stack[slot]) == OT_BOOL) {
            if(!ensure_bool_slot(slot)) return false;
        }
        else {
            return false;
        }
        if(live_out) exit_entry_kind[slot] = slots[slot].kind;
    }

    SQJitX64Memory memory(proto, entry_stack, buf, slots, analysis, end_ip, true,
        ensure_int_slot, [&](SQJitNativeJcc condition) {
            SQInteger patch = 0;
            return sqjit_native_emit_jcc_placeholder(&buf, condition, &patch) &&
                sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                    MAX_FUNC_STACKSIZE + 512, patch, -1);
        }, &virtual_arrays, virtual_base, ensure_float_slot, &member_plan, member_base);

    SQJitX64Calls calls(proto, entry_stack, buf, slots, closure_slot, true,
        ensure_int_slot, ensure_float_slot, emit_guard_fail_jump, leaf_scratch_slots);
    if(!member_plan.fields.empty()) calls.RequireStableHeap();
    if(!calls.HoistGuards(analysis, start_ip, end_ip) ||
        !memory.HoistArrayGuards(start_ip) || !memory.HoistMembers()) return false;

    SQJitX64FloatLoops float_loops(proto, analysis, start_ip, end_ip, buf.cache_floats);

    for(SQInteger ip = start_ip; ip <= end_ip; ip++) {
        // Constants from only one predecessor cannot describe a join. Any
        // delayed load is emitted on its own predecessor before the label.
        if(analysis.leaders[ip]) for(SQInteger n = 0; n < proto->_stacksize; ++n) {
            if(slots[n].kind == SQ_JIT_SLOT_STRING_PTR) slots[n].literal_object_index = -1;
            if(!slots[n].known_const) continue;
            if(slots[n].kind == SQ_JIT_SLOT_INT && !ensure_int_slot(n)) return false;
            if(slots[n].kind == SQ_JIT_SLOT_FLOAT && !ensure_float_slot(n)) return false;
            slots[n].known_const = false; slots[n].const_value = 0;
        }
        sqjit_native_discard_float_slot(&buf, numeric_scratch);
        sqjit_native_discard_float_slot(&buf, numeric_scratch + 1);
        if(analysis.leaders[ip] && !float_loops.Enter(ip, buf, slots)) return false;
        ip_to_offset[ip] = buf.size;
        attempt.SetIP(ip);
        const SQInstruction &inst = proto->_instructions[ip];
        calls.Begin(inst);

        switch(inst.op) {
            case _OP_DMOVE:
                if(!(memory.CopyObject(inst._arg0, inst._arg1) || calls.CopyScalar(inst._arg0, inst._arg1)) ||
                    !(memory.CopyObject(inst._arg2, inst._arg3) || calls.CopyScalar(inst._arg2, inst._arg3)))
                    return attempt.Reject(ip, SQ_JIT_REJECT_OTHER, "unsupported paired scalar move");
                break;
            case _OP_PREPCALLK:
                if(!calls.Prepare(inst)) return attempt.Reject(ip, SQ_JIT_REJECT_CALL, "unsupported callee or receiver");
                break;
            case _OP_CALL:
            case _OP_TAILCALL:
                if(!calls.Call(inst)) return attempt.Reject(ip, SQ_JIT_REJECT_CALL, "unsupported call arguments");
                break;
            case _OP_NEWOBJ:
                if(!memory.VirtualNew(ip)) return attempt.Reject(ip, SQ_JIT_REJECT_ARRAY, "array escapes scalar replacement");
                break;
            case _OP_APPENDARRAY:
                if(!memory.VirtualAppend(ip)) return attempt.Reject(ip, SQ_JIT_REJECT_ARRAY, "array element is not scalar");
                break;
            case _OP_LINE:
                break;
            case _OP_LOADINT: {
                SQInteger value = sqjit_loadint_value(inst);
                bool materialize_int = !sqjit_next_consumes_load_as_immediate(proto, analysis, ip, inst._arg0);
                if(materialize_int && !sqjit_native_emit_mov_mem_imm32(&buf, inst._arg0, value)) {
                    return false;
                }
                slots[inst._arg0].kind = SQ_JIT_SLOT_INT;
                slots[inst._arg0].stack_object_reg = -1;
                slots[inst._arg0].literal_object_index = -1;
                slots[inst._arg0].int_materialized = materialize_int;
                slots[inst._arg0].float_materialized = false;
                slots[inst._arg0].known_const = true;
                slots[inst._arg0].const_value = value;
                slots[inst._arg0].dirty = true;
                break;
            }
            case _OP_LOADFLOAT: {
                SQFloat value;
                if(!sqjit_loadfloat_value(inst, &value) ||
                    !sqjit_native_emit_mov_local_float_const(&buf, inst._arg0, value)) {
                    return false;
                }
                slots[inst._arg0].kind = SQ_JIT_SLOT_FLOAT;
                slots[inst._arg0].stack_object_reg = -1;
                slots[inst._arg0].literal_object_index = -1;
                slots[inst._arg0].int_materialized = false;
                slots[inst._arg0].float_materialized = true;
                slots[inst._arg0].known_const = true;
                slots[inst._arg0].float_const_value = value;
                slots[inst._arg0].dirty = true;
                break;
            }
            case _OP_LOAD:
                if(!load_literal_slot(inst._arg0, inst._arg1,
                    !sqjit_next_consumes_load_as_immediate(proto, analysis, ip, inst._arg0))) {
                    return false;
                }
                break;
            case _OP_DLOAD:
                if(!load_literal_slot(inst._arg0, inst._arg1,
                    !sqjit_next_consumes_load_as_immediate(proto, analysis, ip, inst._arg0)) ||
                    !load_literal_slot(inst._arg2, inst._arg3,
                    !sqjit_next_consumes_load_as_immediate(proto, analysis, ip, inst._arg2))) {
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
            case _OP_LOADBOOL:
                if(!sqjit_native_emit_mov_mem_imm32(&buf, inst._arg0, inst._arg1 != 0) ||
                    !mark_bool_slot(inst._arg0)) return false;
                break;
            case _OP_MOVE:
                if(slots[inst._arg1].kind == SQ_JIT_SLOT_ARRAY_PTR || slots[inst._arg1].kind == SQ_JIT_SLOT_STRING_PTR) {
                    if(!memory.CopyObject(inst._arg0, inst._arg1)) return false;
                }
                else if(slots[inst._arg1].kind == SQ_JIT_SLOT_BOOL) {
                    if(!copy_bool_slot(inst._arg0, inst._arg1)) return false;
                }
                else if(slots[inst._arg1].kind == SQ_JIT_SLOT_FLOAT) {
                    if(!copy_float_slot(inst._arg0, inst._arg1)) {
                        return false;
                    }
                }
                else if(!copy_int_slot(inst._arg0, inst._arg1)) {
                    return false;
                }
                break;
            case _OP_GET:
            case _OP_GETK: {
                SQInteger base = inst.op == _OP_GETK ? inst._arg2 : inst._arg1;
                SQInteger key = inst._arg2;
                SQInteger cached_key = inst.op == _OP_GETK ? inst._arg1 : member_plan.Key(ip, key);
                if(memory.HasMember(base, cached_key)) {
                    if(!memory.MemberGet(inst._arg0, base, cached_key)) return false;
                    break;
                }
                if(inst.op == _OP_GET && slots[key].kind == SQ_JIT_SLOT_STRING_PTR && slots[key].literal_object_index < 0) {
                    if(!memory.TableGet(inst._arg0, base, key)) return false;
                    break;
                }
                SQInteger literal = inst.op == _OP_GETK ? inst._arg1 :
                    (slots[key].kind == SQ_JIT_SLOT_LITERAL_OBJECT || slots[key].kind == SQ_JIT_SLOT_STRING_PTR) ? slots[key].literal_object_index : -1;
                if(literal >= 0) {
                    if(literal >= proto->_nliterals) return false;
                    if(sq_type(proto->_literals[literal]) == OT_INTEGER) {
                        if(!memory.ArrayGet(ip, inst._arg0, base, -1, true, _integer(proto->_literals[literal]))) return false;
                    }
                    else if(!memory.MemberGet(inst._arg0, base, literal)) return false;
                }
                else if(inst.op == _OP_GETK || !memory.ArrayGet(ip, inst._arg0, base, key,
                    slots[key].known_const, slots[key].const_value)) return false;
                break;
            }
            case _OP_SET:
                {
                    SQInteger literal = member_plan.Key(ip, inst._arg2);
                    if(memory.HasMember(inst._arg1, literal)) {
                        if(!uses_write_log || !memory.MemberSetLiteral(inst._arg0, inst._arg1,
                            literal, inst._arg3, write_log_slot)) return false;
                        break;
                    }
                }
                if(slots[inst._arg2].kind == SQ_JIT_SLOT_STRING_PTR) {
                    if(!uses_write_log) return false;
                    if(slots[inst._arg3].kind == SQ_JIT_SLOT_ARRAY_PTR || slots[inst._arg3].kind == SQ_JIT_SLOT_STRING_PTR) {
                        if(!memory.MemberSet(inst._arg0, inst._arg1, inst._arg2, inst._arg3, write_log_slot)) return false;
                    }
                    else if(slot_is_observed_float(inst._arg3) && slots[inst._arg2].literal_object_index >= 0) {
                        if(!emit_table_set_float_literal(inst._arg0, inst._arg1, slots[inst._arg2].literal_object_index, inst._arg3)) return false;
                    }
                    else if(!memory.TableSet(inst._arg0, inst._arg1, inst._arg2, inst._arg3, write_log_slot)) return false;
                    break;
                }
                if(slots[inst._arg2].kind == SQ_JIT_SLOT_LITERAL_OBJECT) {
                    SQInteger literal_index = slots[inst._arg2].literal_object_index;
                    if(literal_index < 0 || literal_index >= proto->_nliterals) {
                        return false;
                    }
                    if(sq_type(proto->_literals[literal_index]) == OT_INTEGER) {
                        if(slot_is_observed_float(inst._arg3)) {
                            if(!memory.ArraySet(inst._arg0, inst._arg1, -1, inst._arg3, write_log_slot, true, true, _integer(proto->_literals[literal_index]))) {
                                return false;
                            }
                        }
                        else if(!memory.ArraySet(inst._arg0, inst._arg1, -1, inst._arg3, write_log_slot, false, true, _integer(proto->_literals[literal_index]))) {
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
                else if(slots[inst._arg2].known_const) {
                    if(slot_is_observed_float(inst._arg3)) {
                        if(!memory.ArraySet(inst._arg0, inst._arg1, -1, inst._arg3, write_log_slot, true, true, slots[inst._arg2].const_value)) {
                            return false;
                        }
                    }
                    else if(!memory.ArraySet(inst._arg0, inst._arg1, -1, inst._arg3, write_log_slot, false, true, slots[inst._arg2].const_value)) {
                        return false;
                    }
                }
                else if(slot_is_observed_float(inst._arg3)) {
                    if(!memory.ArraySet(inst._arg0, inst._arg1, inst._arg2, inst._arg3, write_log_slot, true)) {
                        return false;
                    }
                }
                else if(!memory.ArraySet(inst._arg0, inst._arg1, inst._arg2, inst._arg3, write_log_slot, false)) {
                    return false;
                }
                break;
            case _OP_ADD: {
                if(slot_is_observed_float(inst._arg1) || slot_is_observed_float(inst._arg2)) {
                    if(!emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                        return false;
                    }
                    break;
                }
                SQInteger imm = 0;
                if(sqjit_previous_loads_int_const(proto, analysis, ip, inst._arg1, &imm) && sqjit_native_is_int32(imm)) {
                    if(!ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_add_rax_i32(&buf, imm) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                    slots[inst._arg0].entry_loaded = slots[inst._arg0].entry_loaded || slots[inst._arg2].entry_loaded;
                }
                else if(sqjit_previous_loads_int_const(proto, analysis, ip, inst._arg2, &imm) && sqjit_native_is_int32(imm)) {
                    if(!ensure_int_slot(inst._arg1) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_add_rax_i32(&buf, imm) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                    slots[inst._arg0].entry_loaded = slots[inst._arg0].entry_loaded || slots[inst._arg1].entry_loaded;
                }
                else {
                    if(!ensure_int_slot(inst._arg1) || !ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_add_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                    slots[inst._arg0].entry_loaded = slots[inst._arg0].entry_loaded ||
                        slots[inst._arg1].entry_loaded || slots[inst._arg2].entry_loaded;
                }
                if(!mark_int_slot(inst._arg0)) {
                    return false;
                }
                break;
            }
            case _OP_SUB: {
                if(slot_is_observed_float(inst._arg1) || slot_is_observed_float(inst._arg2)) {
                    if(!emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                        return false;
                    }
                    break;
                }
                SQInteger imm = 0;
                if(sqjit_previous_loads_int_const(proto, analysis, ip, inst._arg1, &imm) && sqjit_native_is_int32(imm)) {
                    if(!ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_sub_rax_i32(&buf, imm) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                    slots[inst._arg0].entry_loaded = slots[inst._arg0].entry_loaded || slots[inst._arg2].entry_loaded;
                }
                else {
                    if(!ensure_int_slot(inst._arg1) || !ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_sub_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                    slots[inst._arg0].entry_loaded = slots[inst._arg0].entry_loaded ||
                        slots[inst._arg1].entry_loaded || slots[inst._arg2].entry_loaded;
                }
                if(!mark_int_slot(inst._arg0)) {
                    return false;
                }
                break;
            }
            case _OP_MUL: {
                if(slot_is_observed_float(inst._arg1) || slot_is_observed_float(inst._arg2)) {
                    if(!emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                        return false;
                    }
                    break;
                }
                SQInteger imm = 0;
                if(sqjit_previous_loads_int_const(proto, analysis, ip, inst._arg1, &imm) && sqjit_native_is_int32(imm)) {
                    if(!ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_imul_rax_i32(&buf, imm) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                    slots[inst._arg0].entry_loaded = slots[inst._arg0].entry_loaded || slots[inst._arg2].entry_loaded;
                }
                else if(sqjit_previous_loads_int_const(proto, analysis, ip, inst._arg2, &imm) && sqjit_native_is_int32(imm)) {
                    if(!ensure_int_slot(inst._arg1) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_imul_rax_i32(&buf, imm) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                    slots[inst._arg0].entry_loaded = slots[inst._arg0].entry_loaded || slots[inst._arg1].entry_loaded;
                }
                else {
                    if(!ensure_int_slot(inst._arg1) || !ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_imul_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                    slots[inst._arg0].entry_loaded = slots[inst._arg0].entry_loaded ||
                        slots[inst._arg1].entry_loaded || slots[inst._arg2].entry_loaded;
                }
                if(!mark_int_slot(inst._arg0)) {
                    return false;
                }
                break;
            }
            case _OP_DIV: {
                SQInteger divisor = 0;
                if(!slot_is_float(inst._arg2) &&
                    sqjit_previous_loads_int_const(proto, analysis, ip, inst._arg1, &divisor) && divisor > 0) {
                    if(!ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_divmod_constant(&buf, divisor, false) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) return false;
                    slots[inst._arg0].MarkScalar(SQ_JIT_SLOT_INT, true);
                    break;
                }
                if(!emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                    return false;
                }
                break;
            }
            case _OP_MOD: {
                SQInteger divisor = 0;
                if(!ensure_int_slot(inst._arg2) ||
                    !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2)) {
                    return false;
                }
                if(sqjit_previous_loads_positive_int_const(proto, analysis, ip, inst._arg1) &&
                    sqjit_previous_loads_int_const(proto, analysis, ip, inst._arg1, &divisor)) {
                    // Compact IDIV wins in helper-heavy mutation loops; the
                    // reciprocal sequence pays off in scalar-only kernels.
                    if(uses_write_log) {
                        if(!sqjit_native_emit_mov_rcx_imm64(&buf,divisor) ||
                            !sqjit_native_emit_idiv_rcx(&buf) ||
                            !sqjit_native_emit_mov_rax_rdx(&buf)) return false;
                    }
                    else if(!sqjit_native_emit_divmod_constant(&buf, divisor, true)) return false;
                }
                else {
                    SQInteger patch_offset = 0;
                    // Materializing the divisor can use RAX. Reload the
                    // dividend afterwards, including on the first frame call.
                    if(!ensure_int_slot(inst._arg1) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_mov_rcx_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_cmp_rcx_i32(&buf, 0) ||
                        !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_LE, &patch_offset) ||
                        !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                            MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
                        !sqjit_native_emit_idiv_rcx(&buf) ||
                        !sqjit_native_emit_mov_rax_rdx(&buf)) {
                        return false;
                    }
                }
                if(!sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                    return false;
                }
                slots[inst._arg0].entry_loaded = slots[inst._arg0].entry_loaded || slots[inst._arg2].entry_loaded;
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
                    slots[inst._arg0].entry_loaded = slots[inst._arg0].entry_loaded || slots[inst._arg1].entry_loaded;
                }
                if(!mark_int_slot(inst._arg0) || !mark_int_slot(inst._arg1)) {
                    return false;
                }
                slots[inst._arg1].entry_loaded = true;
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
                slots[inst._arg0].entry_loaded = slots[inst._arg0].entry_loaded ||
                    slots[inst._arg2].entry_loaded || (inst._arg3 == 0 && slots[inst._arg1].entry_loaded);
                if(!mark_bool_slot(inst._arg0)) {
                    return false;
                }
                break;
            case _OP_JZ: {
                SQInteger patch_offset = 0;
                SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
                if((slots[inst._arg0].kind != SQ_JIT_SLOT_BOOL && !ensure_int_slot(inst._arg0)) ||
                    !sqjit_native_emit_mov_rax_mem(&buf, inst._arg0) ||
                    !sqjit_native_emit_cmp_rax_i32(&buf, 0) ||
                    !float_loops.Condition(ip, buf, SQ_JIT_JCC_E, &patch_offset) ||
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
                        !float_loops.Condition(ip, buf, jcc, &patch_offset) ||
                        !record_branch(patch_offset, target_ip)) {
                        return false;
                    }
                }
                else {
                    if(!ensure_int_slot(inst._arg0) || !ensure_int_slot(inst._arg2) ||
                        !sqjit_native_cmp_false_jcc((CmpOP)inst._arg3, &jcc) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_cmp_rax_mem(&buf, inst._arg0) ||
                        !float_loops.Condition(ip, buf, jcc, &patch_offset) ||
                        !record_branch(patch_offset, target_ip)) {
                        return false;
                    }
                }
                break;
            }
            case _OP_JMP: {
                SQInteger patch_offset = 0;
                SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
                if(!float_loops.Jump(target_ip, buf, &patch_offset) ||
                    !record_branch(patch_offset, target_ip)) {
                    return false;
                }
                break;
            }
            default:
                return attempt.Reject(ip, SQ_JIT_REJECT_OPCODE, "unsupported opcode");
        }
        typeflow.Record(ip, slots);
    }
    if(!typeflow.Validate(proto, entry_stack))
        return attempt.Reject(-1, SQ_JIT_REJECT_OTHER, "incompatible scalar types at branch join");

    SQInteger exit_offset = buf.size;
    for(SQInteger n = 0; n < proto->_stacksize; n++) {
        if(!slots[n].dirty) {
            continue;
        }
        if(exit_entry_kind[n] != SQ_JIT_SLOT_UNKNOWN && exit_entry_kind[n] != slots[n].kind) {
            return attempt.Reject(exit_ip, SQ_JIT_REJECT_OTHER, "loop live-out changes entry type");
        }
        if(!slots[n].entry_loaded) {
            if(analysis.live_in[exit_ip].test(n)) {
                return false;
            }
            continue;
        }
        if(slots[n].kind != SQ_JIT_SLOT_FLOAT && slots[n].kind != SQ_JIT_SLOT_INT && slots[n].kind != SQ_JIT_SLOT_BOOL) {
            if(analysis.live_in[exit_ip].test(n)) return false;
            continue;
        }
        // Stack slots can still own objects from earlier interpreter work.
        // Assignment must release those references before changing the tag.
        // Integer locals may reside in a callee-saved register; spill before
        // passing their address to the assignment helper.
        if((slots[n].kind == SQ_JIT_SLOT_INT || slots[n].kind == SQ_JIT_SLOT_BOOL) &&
            (!sqjit_native_emit_mov_rax_mem(&buf, n) ||
             !sqjit_native_emit_mov_local_mem_rax(&buf, n))) return false;
        if(!sqjit_native_emit_mov_rdi_r13(&buf) ||
            !sqjit_native_emit_mov_rsi_i64(&buf, n) ||
            !sqjit_native_emit_lea_rdx_mem(&buf, n) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, slots[n].kind == SQ_JIT_SLOT_FLOAT ?
                (const void *)sqjit_helper_store_stack_float :
                slots[n].kind == SQ_JIT_SLOT_BOOL ? (const void *)sqjit_helper_store_stack_bool :
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

    if(!jit->_loop_code.Install(buf.bytes, buf.size))
        return attempt.Reject(-1, SQ_JIT_REJECT_RESOURCE, "executable memory installation failed");
    calls.RetainDependencies(jit->_loop_code);
    return true;
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
