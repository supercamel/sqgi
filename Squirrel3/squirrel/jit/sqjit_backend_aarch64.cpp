/*  see copyright notice in squirrel.h */
#include "sqjit_backend_aarch64_private.h"
#include <sys/mman.h>
#include <unistd.h>

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

static bool sqjit_a64_reject(SQFunctionProto *proto, SQInteger ip, const char *reason)
{
    sqjit_diag_record_reject(proto, ip, reason);
    if(sqjit_diag_trace_enabled()) {
        if(proto && ip >= 0 && ip < proto->_ninstructions) {
            const SQInstruction &inst = proto->_instructions[ip];
            scprintf(_SC("[sqjit:a64] reject proto '%s' ip %d: %s args=%d,%d,%d,%d\n"),
                sqjit_a64_proto_name(proto), (SQInt32)ip, reason,
                (SQInt32)inst._arg0, (SQInt32)inst._arg1,
                (SQInt32)inst._arg2, (SQInt32)inst._arg3);
        }
        else {
            scprintf(_SC("[sqjit:a64] reject proto '%s' ip %d: %s\n"),
                sqjit_a64_proto_name(proto), (SQInt32)ip, reason);
        }
    }
    return false;
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

#include "sqjit_backend_aarch64_compile_proto.inc"

#include "sqjit_backend_aarch64_compile_loop.inc"

#endif
