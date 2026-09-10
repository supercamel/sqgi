/*  see copyright notice in squirrel.h */
#include "sqjit_backend_aarch64_private.h"
#include "sqjit_code.h"
#include "sqjit_typeflow.h"
#include "sqjit_member_plan.h"
#include "sqmemberslot.h"
#include "sqjit_context.h"

#if defined(__aarch64__) && defined(__linux__)

static bool sqjit_a64_instruction_slots_valid(const SQInstruction &inst)
{
    switch(inst.op) {
        case _OP_LINE:
        case _OP_JMP:
            return true;
        case _OP_LOAD:
        case _OP_LOADINT:
        case _OP_LOADFLOAT:
        case _OP_LOADBOOL:
        case _OP_GETOUTER:
        case _OP_NEWOBJ:
            return sqjit_a64_slot_index_valid(inst._arg0);
        case _OP_DLOAD:
            return sqjit_a64_slot_index_valid(inst._arg0) &&
                sqjit_a64_slot_index_valid(inst._arg2);
        case _OP_LOADNULLS:
            return sqjit_a64_slot_range_valid(inst._arg0, inst._arg1);
        case _OP_MOVE:
            return sqjit_a64_result_slot_valid(inst._arg0) &&
                sqjit_a64_slot_index_valid(inst._arg1);
        case _OP_DMOVE:
            return sqjit_a64_result_slot_valid(inst._arg0) &&
                sqjit_a64_slot_index_valid(inst._arg1) &&
                sqjit_a64_result_slot_valid(inst._arg2) &&
                sqjit_a64_slot_index_valid(inst._arg3);
        case _OP_GETK:
            return sqjit_a64_slot_index_valid(inst._arg0) &&
                sqjit_a64_slot_index_valid(inst._arg2);
        case _OP_GET:
            return sqjit_a64_slot_index_valid(inst._arg0) &&
                sqjit_a64_slot_index_valid(inst._arg1) &&
                sqjit_a64_slot_index_valid(inst._arg2);
        case _OP_PREPCALL:
            return sqjit_a64_slot_index_valid(inst._arg0) &&
                sqjit_a64_slot_index_valid(inst._arg1) &&
                sqjit_a64_slot_index_valid(inst._arg2) &&
                sqjit_a64_result_slot_valid(inst._arg3);
        case _OP_PREPCALLK:
            return sqjit_a64_slot_index_valid(inst._arg0) &&
                sqjit_a64_slot_index_valid(inst._arg2) &&
                sqjit_a64_result_slot_valid(inst._arg3);
        case _OP_CALL:
        case _OP_TAILCALL:
            return sqjit_a64_result_slot_valid(inst._arg0) &&
                sqjit_a64_slot_index_valid(inst._arg1) &&
                sqjit_a64_call_args_valid(inst._arg2, inst._arg3);
        case _OP_SET:
            return sqjit_a64_result_slot_valid(inst._arg0) &&
                sqjit_a64_slot_index_valid(inst._arg1) &&
                sqjit_a64_slot_index_valid(inst._arg2) &&
                sqjit_a64_slot_index_valid(inst._arg3);
        case _OP_ADD:
        case _OP_SUB:
        case _OP_MUL:
        case _OP_DIV:
        case _OP_MOD:
            return sqjit_a64_slot_index_valid(inst._arg0) &&
                sqjit_a64_slot_index_valid(inst._arg1) &&
                sqjit_a64_slot_index_valid(inst._arg2);
        case _OP_NEG:
            return sqjit_a64_slot_index_valid(inst._arg0) &&
                sqjit_a64_slot_index_valid(inst._arg1);
        case _OP_INCL:
            return sqjit_a64_slot_index_valid(inst._arg1);
        case _OP_PINCL:
            return sqjit_a64_result_slot_valid(inst._arg0) &&
                sqjit_a64_slot_index_valid(inst._arg1);
        case _OP_NEWSLOT:
            return sqjit_a64_result_slot_valid(inst._arg0) &&
                sqjit_a64_slot_index_valid(inst._arg1) &&
                sqjit_a64_slot_index_valid(inst._arg2) &&
                sqjit_a64_slot_index_valid(inst._arg3);
        case _OP_APPENDARRAY:
            return sqjit_a64_slot_index_valid(inst._arg0) &&
                (inst._arg2 != AAT_STACK ||
                sqjit_a64_slot_index_valid(inst._arg1));
        case _OP_EQ:
        case _OP_NE:
            return sqjit_a64_slot_index_valid(inst._arg0) &&
                sqjit_a64_slot_index_valid(inst._arg2) &&
                (inst._arg3 != 0 || sqjit_a64_slot_index_valid(inst._arg1));
        case _OP_JZ:
        case _OP_THROW:
            return sqjit_a64_slot_index_valid(inst._arg0);
        case _OP_JCMP:
            return sqjit_a64_slot_index_valid(inst._arg0) &&
                sqjit_a64_slot_index_valid(inst._arg2);
        case _OP_RETURN:
            return inst._arg0 == SQ_JIT_A64_NO_RESULT_SLOT || sqjit_a64_slot_index_valid(inst._arg1);
        case _OP_COMPARITH: {
            SQInteger source = (SQInteger)(((SQUnsignedInteger)inst._arg1 &
                0xFFFF0000u) >> 16);
            SQInteger value = (SQInteger)((SQUnsignedInteger)inst._arg1 &
                0x0000FFFFu);
            return sqjit_a64_slot_index_valid(inst._arg0) &&
                sqjit_a64_slot_index_valid(source) &&
                sqjit_a64_slot_index_valid(inst._arg2) &&
                sqjit_a64_slot_index_valid(value);
        }
        default:
            return true;
    }
}

static const SQChar *sqjit_a64_proto_name(SQFunctionProto *proto)
{
    return proto && sq_type(proto->_name) == OT_STRING ? _stringval(proto->_name) : _SC("<anonymous>");
}

#define SQJIT_A64_OPCODE_LIST(X) \
    X(_OP_LINE) \
    X(_OP_LOAD) \
    X(_OP_LOADINT) \
    X(_OP_LOADFLOAT) \
    X(_OP_DLOAD) \
    X(_OP_TAILCALL) \
    X(_OP_CALL) \
    X(_OP_PREPCALL) \
    X(_OP_PREPCALLK) \
    X(_OP_GETK) \
    X(_OP_MOVE) \
    X(_OP_NEWSLOT) \
    X(_OP_DELETE) \
    X(_OP_SET) \
    X(_OP_GET) \
    X(_OP_EQ) \
    X(_OP_NE) \
    X(_OP_ADD) \
    X(_OP_SUB) \
    X(_OP_MUL) \
    X(_OP_DIV) \
    X(_OP_MOD) \
    X(_OP_BITW) \
    X(_OP_RETURN) \
    X(_OP_LOADNULLS) \
    X(_OP_LOADROOT) \
    X(_OP_LOADBOOL) \
    X(_OP_DMOVE) \
    X(_OP_JMP) \
    X(_OP_JCMP) \
    X(_OP_JZ) \
    X(_OP_SETOUTER) \
    X(_OP_GETOUTER) \
    X(_OP_NEWOBJ) \
    X(_OP_APPENDARRAY) \
    X(_OP_COMPARITH) \
    X(_OP_INC) \
    X(_OP_INCL) \
    X(_OP_PINC) \
    X(_OP_PINCL) \
    X(_OP_CMP) \
    X(_OP_EXISTS) \
    X(_OP_INSTANCEOF) \
    X(_OP_AND) \
    X(_OP_OR) \
    X(_OP_NEG) \
    X(_OP_NOT) \
    X(_OP_BWNOT) \
    X(_OP_CLOSURE) \
    X(_OP_YIELD) \
    X(_OP_RESUME) \
    X(_OP_FOREACH) \
    X(_OP_POSTFOREACH) \
    X(_OP_CLONE) \
    X(_OP_TYPEOF) \
    X(_OP_PUSHTRAP) \
    X(_OP_POPTRAP) \
    X(_OP_THROW) \
    X(_OP_NEWSLOTA) \
    X(_OP_GETBASE) \
    X(_OP_CLOSE)

#define SQJIT_A64_OPCODE_REASON_CASE(op) case op: return "unsupported opcode " #op;
#define SQJIT_A64_LOOP_OPCODE_REASON_CASE(op) case op: return "unsupported loop opcode " #op;

static const char *sqjit_a64_unsupported_opcode_reason(unsigned char op)
{
    switch((SQOpcode)op) {
        SQJIT_A64_OPCODE_LIST(SQJIT_A64_OPCODE_REASON_CASE)
        default: return "unsupported opcode <invalid>";
    }
}

static const char *sqjit_a64_unsupported_loop_opcode_reason(unsigned char op)
{
    switch((SQOpcode)op) {
        SQJIT_A64_OPCODE_LIST(SQJIT_A64_LOOP_OPCODE_REASON_CASE)
        default: return "unsupported loop opcode <invalid>";
    }
}

#undef SQJIT_A64_LOOP_OPCODE_REASON_CASE
#undef SQJIT_A64_OPCODE_REASON_CASE
#undef SQJIT_A64_OPCODE_LIST

// The implementation fragments stay in one translation unit so static helper
// calls remain local while the backend is still being pruned.
#include "sqjit_backend_aarch64_helpers.inc"

// Keep the journal object in the native invocation, like the x64 backend.
// Entries and indexes still grow through the checked heap-allocation path.
static bool sqjit_a64_emit_init_write_log(SQJitA64Buffer *buf,
    SQInteger log_slot, SQInteger storage_slot, SQJitContext *context)
{
    static_assert(alignof(SQJitWriteLog) <= sizeof(SQInteger), "native frame alignment");
    return sqjit_a64_emit_add_imm(buf, 0, 31, sqjit_a64_local_disp(log_slot)) &&
        sqjit_a64_emit_add_imm(buf, 1, 31, sqjit_a64_local_disp(storage_slot)) &&
        sqjit_a64_emit_mov_imm_x(buf, 2, (SQInteger)(intptr_t)context) &&
        sqjit_a64_emit_mov_imm_x(buf, 16, (SQInteger)(intptr_t)sqjit_write_log_init_frame) &&
        sqjit_a64_emit_blr_x16(buf);
}

static SQSlotSet sqjit_a64_overwritten_inputs(SQFunctionProto *proto,
    const SQBytecodeAnalysis &analysis, SQInteger first, SQInteger last)
{
    SQSlotSet written;
    bool may_write_stack = false;
    for(SQInteger ip = first; ip <= last; ++ip) {
        written |= analysis.facts[ip].writes;
        switch(proto->_instructions[ip].op) {
        case _OP_GET: case _OP_GETK: case _OP_CALL: case _OP_TAILCALL:
        case _OP_NEWOBJ: case _OP_LOADNULLS:
            may_write_stack = true; break;
        default: break;
        }
    }
    // Scalar locals live in the native frame, but generic object getters and
    // call materialization can publish to the VM stack before later guards.
    // Preserve only overwritten entry inputs, not every temporary or slot.
    return may_write_stack ? written & analysis.live_in[first] : SQSlotSet();
}

static bool sqjit_a64_emit_capture_stack_inputs(SQJitA64Buffer *buf,
    const SQSlotSet &inputs, SQInteger log_slot, SQJitA64Reloc *guards,
    SQInteger *nguards)
{
    for(SQInteger reg = 0; reg < MAX_FUNC_STACKSIZE; ++reg) if(inputs.test(reg)) {
        SQInteger patch = 0;
        if(!sqjit_a64_emit_add_imm(buf, 0, 31, sqjit_a64_local_disp(log_slot)) ||
            !sqjit_a64_emit_mov_reg(buf, 1, 19) ||
            !sqjit_a64_emit_mov_imm_x(buf, 2, reg) ||
            !sqjit_a64_emit_mov_imm_x(buf, 16, (SQInteger)(intptr_t)sqjit_a64_helper_capture_stack_input) ||
            !sqjit_a64_emit_blr_x16(buf) || !sqjit_a64_emit_cmp_imm(buf, 0, 0) ||
            !sqjit_a64_emit_bcond_placeholder(buf, SQ_JIT_A64_EQ, &patch) ||
            !sqjit_a64_record_reloc(guards, nguards, SQ_JIT_A64_MAX_GUARD_RELOCS,
                patch, -1, true, SQ_JIT_A64_EQ)) return false;
    }
    return true;
}

static bool sqjit_a64_emit_store_out_scalar(SQJitA64Buffer *buf, SQObjectType type, SQInteger slot,
    SQJitSlotKind kind)
{
    SQObjectType out_type = kind == SQ_JIT_SLOT_BOOL ? OT_BOOL : type;
    if(!sqjit_a64_emit_mov_imm_w(buf, 9, (uint32_t)out_type) ||
        !sqjit_a64_emit_str_w(buf, 9, 20, (SQInteger)offsetof(SQObject, _type))) {
        return false;
    }
    if(kind == SQ_JIT_SLOT_FLOAT) {
        return sqjit_a64_emit_mov_imm_x(buf, 10, 0) &&
            sqjit_a64_emit_str_x(buf, 10, 20, (SQInteger)offsetof(SQObject, _unVal)) &&
            sqjit_a64_emit_ldr_float(buf, 0, 31, sqjit_a64_local_disp(slot)) &&
            sqjit_a64_emit_str_float(buf, 0, 20, (SQInteger)offsetof(SQObject, _unVal));
    }
    return sqjit_a64_emit_ldr_x(buf, 10, 31, sqjit_a64_local_disp(slot)) &&
        sqjit_a64_emit_str_x(buf, 10, 20, (SQInteger)offsetof(SQObject, _unVal));
}

static bool sqjit_a64_emit_store_stack_scalar(SQJitA64Buffer *buf, SQInteger stack_slot,
    SQInteger local_slot, SQJitSlotKind kind)
{
    SQObjectType type = OT_INTEGER;
    if(kind == SQ_JIT_SLOT_FLOAT) {
        type = OT_FLOAT;
    }
    else if(kind == SQ_JIT_SLOT_BOOL) {
        type = OT_BOOL;
    }

    if(!sqjit_a64_emit_mov_imm_w(buf, 9, (uint32_t)type) ||
        !sqjit_a64_emit_str_w(buf, 9, 19, sqjit_a64_stack_type_disp(stack_slot))) {
        return false;
    }

    if(kind == SQ_JIT_SLOT_FLOAT) {
        return sqjit_a64_emit_mov_imm_x(buf, 10, 0) &&
            sqjit_a64_emit_str_x(buf, 10, 19, sqjit_a64_stack_value_disp(stack_slot)) &&
            sqjit_a64_emit_ldr_float(buf, 0, 31, sqjit_a64_local_disp(local_slot)) &&
            sqjit_a64_emit_str_float(buf, 0, 19, sqjit_a64_stack_value_disp(stack_slot));
    }

    return sqjit_a64_emit_ldr_x(buf, 10, 31, sqjit_a64_local_disp(local_slot)) &&
        sqjit_a64_emit_str_x(buf, 10, 19, sqjit_a64_stack_value_disp(stack_slot));
}

// Emit a receiver-independent slot hint for a constant-key typed read. Every
// miss enters the caller's ordinary lookup helper, not the region's rollback
// exit. The observed receiver supplies only an index; generated code retains
// no receiver/node pointer and rechecks the current table on every access.
// Reference results have the same borrowed lifetime as the existing getter
// helpers: the heap slot owns them, and logged writes retain displaced owners.
// Weak references must miss, so normal lookup still dereferences them.
static bool sqjit_a64_emit_table_read_hint(SQJitA64Buffer *buf,
    const SQJitA64SlotState *slots, const SQObjectPtr *entry_stack,
    SQInteger dst, SQInteger base, const SQObjectPtr *key,
    SQObjectType value_type, SQInteger *done_patch)
{
    *done_patch = -1;
    if(value_type != OT_INTEGER && value_type != OT_FLOAT &&
        value_type != OT_ARRAY && !sqjit_a64_type_is_object_ptr(value_type)) return true;
    const SQJitA64SlotState &state = slots[base];
    SQTable *table = NULL;
    if(state.kind == SQ_JIT_SLOT_OBJECT_PTR) {
        if(state.object_ptr_observed_type == OT_TABLE)
            table = (SQTable *)(intptr_t)state.object_ptr_observed;
    }
    else if(state.kind == SQ_JIT_SLOT_STACK_OBJECT) {
        if(state.stack_object_observed_type == OT_TABLE)
            table = (SQTable *)(intptr_t)state.stack_object_observed_ptr;
        else if(state.stack_object_observed_type == OT_NULL && entry_stack &&
            sqjit_a64_slot_index_valid(state.stack_object_reg) &&
            sq_type(entry_stack[state.stack_object_reg]) == OT_TABLE)
            table = _table(entry_stack[state.stack_object_reg]);
    }
    SQInteger index = -1;
    SQObjectPtr ignored;
    if(!table || !table->GetCacheSlot(*key, index, ignored)) return true;

    SQInteger misses[5];
    unsigned conditions[5];
    unsigned count = 0;
    auto miss = [&](unsigned cond) -> bool {
        conditions[count] = cond;
        return sqjit_a64_emit_bcond_placeholder(buf, cond, &misses[count++]);
    };
    if(state.kind == SQ_JIT_SLOT_STACK_OBJECT) {
        if(!sqjit_a64_emit_ldr_w(buf, 9, 19,
                sqjit_a64_stack_type_disp(state.stack_object_reg)) ||
            !sqjit_a64_emit_mov_imm_w(buf, 10, OT_TABLE) ||
            !sqjit_a64_emit_cmp_reg(buf, 9, 10) || !miss(SQ_JIT_A64_NE) ||
            !sqjit_a64_emit_ldr_x(buf, 11, 19,
                sqjit_a64_stack_value_disp(state.stack_object_reg))) return false;
    }
    else if(!sqjit_a64_emit_ldr_x(buf, 11, 31, sqjit_a64_local_disp(base))) {
        return false;
    }
    if(!sqjit_a64_emit_ldr_x(buf, 9, 11, SQTable::RawNodeCountOffset()) ||
        !sqjit_a64_emit_mov_imm_x(buf, 10, index) ||
        !sqjit_a64_emit_cmp_reg(buf, 10, 9) || !miss(SQ_JIT_A64_GE) ||
        !sqjit_a64_emit_ldr_x(buf, 11, 11, SQTable::RawNodesOffset()) ||
        !sqjit_a64_emit_mov_imm_x(buf, 10, index * SQTable::RawNodeSize()) ||
        !sqjit_a64_emit_add_reg(buf, 11, 11, 10) ||
        !sqjit_a64_emit_ldr_w(buf, 9, 11,
            SQTable::RawNodeKeyOffset() + offsetof(SQObject, _type)) ||
        !sqjit_a64_emit_mov_imm_w(buf, 10, (uint32_t)sq_type(*key)) ||
        !sqjit_a64_emit_cmp_reg(buf, 9, 10) || !miss(SQ_JIT_A64_NE) ||
        !sqjit_a64_emit_ldr_x(buf, 9, 11,
            SQTable::RawNodeKeyOffset() + offsetof(SQObject, _unVal)) ||
        !sqjit_a64_emit_mov_imm_x(buf, 10, (SQInteger)_rawval(*key)) ||
        !sqjit_a64_emit_cmp_reg(buf, 9, 10) || !miss(SQ_JIT_A64_NE) ||
        !sqjit_a64_emit_ldr_w(buf, 9, 11,
            SQTable::RawNodeValueOffset() + offsetof(SQObject, _type)) ||
        !sqjit_a64_emit_mov_imm_w(buf, 10, (uint32_t)value_type) ||
        !sqjit_a64_emit_cmp_reg(buf, 9, 10) || !miss(SQ_JIT_A64_NE)) return false;
    SQInteger value_offset = SQTable::RawNodeValueOffset() + offsetof(SQObject, _unVal);
    if(value_type == OT_FLOAT) {
        if(!sqjit_a64_emit_ldr_float(buf, 0, 11, value_offset) ||
            !sqjit_a64_emit_str_float(buf, 0, 31, sqjit_a64_local_disp(dst))) return false;
    }
    else if(!sqjit_a64_emit_ldr_x(buf, 9, 11, value_offset) ||
        !sqjit_a64_emit_str_x(buf, 9, 31, sqjit_a64_local_disp(dst))) return false;
    if(!sqjit_a64_emit_b_placeholder(buf, done_patch)) return false;
    for(unsigned n = 0; n < count; ++n)
        if(!sqjit_a64_patch_branch(buf, misses[n], buf->size, true, conditions[n])) return false;
    return true;
}

static bool sqjit_a64_emit_reference_operand(SQJitA64Buffer *buf,
    const SQJitA64SlotState *slots, SQInteger slot, unsigned bits, unsigned type)
{
    if(!sqjit_a64_slot_index_valid(slot)) return false;
    const SQJitA64SlotState &state = slots[slot];
    if(state.kind == SQ_JIT_SLOT_STACK_OBJECT) {
        return sqjit_a64_slot_index_valid(state.stack_object_reg) &&
            sqjit_a64_emit_add_imm(buf, bits, 19,
                state.stack_object_reg * (SQInteger)sizeof(SQObjectPtr)) &&
            sqjit_a64_emit_mov_imm_x(buf, type, 0);
    }
    SQObjectType observed = state.kind == SQ_JIT_SLOT_ARRAY_PTR ? OT_ARRAY :
        state.kind == SQ_JIT_SLOT_OBJECT_PTR ? state.object_ptr_observed_type : OT_NULL;
    return observed != OT_NULL &&
        sqjit_a64_emit_ldr_x(buf, bits, 31, sqjit_a64_local_disp(slot)) &&
        sqjit_a64_emit_mov_imm_x(buf, type, (SQInteger)observed);
}

static bool sqjit_a64_emit_reference_member_store(SQJitA64Buffer *buf,
    const SQJitA64SlotState *slots, SQInteger log_slot, SQInteger base,
    const SQObjectPtr *key, SQInteger value, SQJitContext *store_context,
    bool capture_result)
{
    if(!key || !sqjit_a64_slot_index_valid(base) ||
        (slots[base].kind != SQ_JIT_SLOT_STACK_OBJECT &&
        slots[base].kind != SQ_JIT_SLOT_OBJECT_PTR)) return false;
    return sqjit_a64_emit_add_imm(buf, 0, 31, sqjit_a64_local_disp(log_slot)) &&
        sqjit_a64_emit_reference_operand(buf, slots, base, 1, 2) &&
        sqjit_a64_emit_mov_imm_x(buf, 3, (SQInteger)(intptr_t)key) &&
        sqjit_a64_emit_reference_operand(buf, slots, value, 4, 5) &&
        sqjit_a64_emit_mov_imm_x(buf, 6, (SQInteger)(intptr_t)store_context) &&
        sqjit_a64_emit_mov_imm_x(buf, 7, capture_result ? 1 : 0) &&
        sqjit_a64_emit_mov_imm_x(buf, 16,
            (SQInteger)(intptr_t)sqjit_a64_helper_member_set_reference_logged) &&
        sqjit_a64_emit_blr_x16(buf);
}

static bool sqjit_a64_has_single_stack_write(const SQInstruction &inst)
{
    if(inst._arg0 == SQ_JIT_A64_NO_RESULT_SLOT) return false;
    switch(inst.op) {
    case _OP_LOAD: case _OP_LOADINT: case _OP_LOADFLOAT: case _OP_LOADBOOL:
    case _OP_MOVE: case _OP_GET: case _OP_GETK: case _OP_GETOUTER:
    case _OP_ADD: case _OP_SUB: case _OP_MUL: case _OP_DIV: case _OP_MOD:
    case _OP_BITW: case _OP_NEG: case _OP_BWNOT: case _OP_NOT:
    case _OP_EQ: case _OP_NE: case _OP_CMP: case _OP_SET:
        return true;
    default: return false;
    }
}

static bool sqjit_a64_writes_private_result(const SQInstruction &inst)
{
    // These lowerings compute into native registers without publishing to the
    // VM stack or calling user code. Their old destination can be staged after
    // computation, and scalar results only need to release an owning slot.
    switch(inst.op) {
    case _OP_LOAD: case _OP_LOADINT: case _OP_LOADFLOAT: case _OP_LOADBOOL:
    case _OP_MOVE: case _OP_ADD: case _OP_SUB: case _OP_MUL: case _OP_DIV:
    case _OP_MOD: case _OP_NEG: case _OP_NOT: case _OP_EQ: case _OP_NE: case _OP_CMP:
        return true;
    default: return false;
    }
}

#include "sqjit_backend_aarch64_precise.inc"
#include "sqjit_backend_aarch64_compile_proto.inc"

#include "sqjit_backend_aarch64_compile_loop.inc"

#endif
