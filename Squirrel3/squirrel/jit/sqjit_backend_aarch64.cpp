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
#include "sqjit_backend_aarch64_emit.h"
#include <limits.h>
#include <math.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>

#if defined(__aarch64__) && defined(__linux__)

enum SQJitA64SlotKind {
    SQ_JIT_A64_SLOT_UNKNOWN = 0,
    SQ_JIT_A64_SLOT_INT,
    SQ_JIT_A64_SLOT_FLOAT,
    SQ_JIT_A64_SLOT_BOOL,
    SQ_JIT_A64_SLOT_STACK_OBJECT,
    SQ_JIT_A64_SLOT_ARRAY_PTR,
    SQ_JIT_A64_SLOT_OBJECT_PTR
};

enum SQJitA64WriteKind {
    SQ_JIT_A64_WRITE_ARRAY_INDEX,
    SQ_JIT_A64_WRITE_ARRAY_SIZE,
    SQ_JIT_A64_WRITE_MEMBER_VALUE
};

enum SQJitA64MathIntrinsic {
    SQ_JIT_A64_MATH_NONE = 0,
    SQ_JIT_A64_MATH_SQRT,
    SQ_JIT_A64_MATH_SIN,
    SQ_JIT_A64_MATH_COS,
    SQ_JIT_A64_MATH_ASIN,
    SQ_JIT_A64_MATH_ACOS,
    SQ_JIT_A64_MATH_LOG,
    SQ_JIT_A64_MATH_LOG10,
    SQ_JIT_A64_MATH_TAN,
    SQ_JIT_A64_MATH_ATAN,
    SQ_JIT_A64_MATH_FLOOR,
    SQ_JIT_A64_MATH_CEIL,
    SQ_JIT_A64_MATH_EXP,
    SQ_JIT_A64_MATH_FABS,
    SQ_JIT_A64_MATH_ATAN2,
    SQ_JIT_A64_MATH_POW
};

enum SQJitA64NumberConversion {
    SQ_JIT_A64_NUMBER_CONVERSION_NONE = 0,
    SQ_JIT_A64_NUMBER_CONVERSION_TOFLOAT,
    SQ_JIT_A64_NUMBER_CONVERSION_TOINTEGER
};

enum SQJitA64CtorArrayFieldMode {
    SQ_JIT_A64_CTOR_ARRAY_FIELD_DEFAULT3 = 1,
    SQ_JIT_A64_CTOR_ARRAY_FIELD_CLONE_ARRAY,
    SQ_JIT_A64_CTOR_ARRAY_FIELD_PACK1,
    SQ_JIT_A64_CTOR_ARRAY_FIELD_PACK2,
    SQ_JIT_A64_CTOR_ARRAY_FIELD_PACK3,
    SQ_JIT_A64_CTOR_ARRAY_FIELD_PACK4
};

struct SQJitA64WriteLogEntry {
    SQJitA64WriteKind kind;
    SQInteger target_index;
    SQObjectPtr key;
    SQObjectPtr old_value;
    SQInteger index;
};

struct SQJitA64WriteLog {
    SQJitA64WriteLog()
        : last_target_type(OT_NULL), last_target_raw(0), last_target_index(-1)
    {
    }

    sqvector<SQObjectPtr> targets;
    sqvector<SQJitA64WriteLogEntry> entries;
    SQObjectType last_target_type;
    SQRawObjectVal last_target_raw;
    SQInteger last_target_index;
};

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

static SQInteger sqjit_a64_helper_array_get_array_ptr(SQObjectPtr *stack, SQInteger array_reg,
    SQInteger index, SQInteger *out)
{
    if(!stack || !out || array_reg < 0 || index < 0 || sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!_array(stack[array_reg])->Get(index, value) || sq_type(value) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = (SQInteger)(intptr_t)_array(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_get_object(SQObjectPtr *stack, SQInteger array_reg,
    SQInteger index, SQInteger out_reg)
{
    if(!stack || array_reg < 0 || array_reg >= MAX_FUNC_STACKSIZE ||
        out_reg < 0 || out_reg >= MAX_FUNC_STACKSIZE || index < 0 ||
        sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!_array(stack[array_reg])->Get(index, value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    stack[out_reg] = value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_get_integer_raw(SQInteger array_ptr,
    SQInteger index, SQInteger *out)
{
    if(!array_ptr || !out || index < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQArray *array = (SQArray *)(intptr_t)array_ptr;
    if(index >= (SQInteger)array->_values.size()) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr &value = array->_values[index];
    if(sq_type(value) != OT_INTEGER) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = _integer(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_get_float_raw(SQInteger array_ptr,
    SQInteger index, SQFloat *out)
{
    if(!array_ptr || !out || index < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQArray *array = (SQArray *)(intptr_t)array_ptr;
    if(index >= (SQInteger)array->_values.size()) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr &value = array->_values[index];
    if(sq_type(value) != OT_FLOAT) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = _float(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_get_array_ptr_raw(SQInteger array_ptr,
    SQInteger index, SQInteger *out)
{
    if(!array_ptr || !out || index < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQArray *array = (SQArray *)(intptr_t)array_ptr;
    if(index >= (SQInteger)array->_values.size()) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr &value = array->_values[index];
    if(sq_type(value) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = (SQInteger)(intptr_t)_array(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_get_object_raw(SQInteger array_ptr,
    SQInteger index, SQObjectPtr *stack, SQInteger out_reg)
{
    if(!array_ptr || !stack || out_reg < 0 || out_reg >= MAX_FUNC_STACKSIZE ||
        index < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQArray *array = (SQArray *)(intptr_t)array_ptr;
    if(index >= (SQInteger)array->_values.size()) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    stack[out_reg] = array->_values[index];
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_math_unary(SQInteger op, const SQFloat *arg,
    SQFloat *out)
{
    if(!arg || !out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    switch((SQJitA64MathIntrinsic)op) {
        case SQ_JIT_A64_MATH_SQRT: *out = (SQFloat)sqrt(*arg); return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_A64_MATH_SIN: *out = (SQFloat)sin(*arg); return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_A64_MATH_COS: *out = (SQFloat)cos(*arg); return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_A64_MATH_ASIN: *out = (SQFloat)asin(*arg); return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_A64_MATH_ACOS: *out = (SQFloat)acos(*arg); return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_A64_MATH_LOG: *out = (SQFloat)log(*arg); return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_A64_MATH_LOG10: *out = (SQFloat)log10(*arg); return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_A64_MATH_TAN: *out = (SQFloat)tan(*arg); return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_A64_MATH_ATAN: *out = (SQFloat)atan(*arg); return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_A64_MATH_FLOOR: *out = (SQFloat)floor(*arg); return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_A64_MATH_CEIL: *out = (SQFloat)ceil(*arg); return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_A64_MATH_EXP: *out = (SQFloat)exp(*arg); return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_A64_MATH_FABS: *out = (SQFloat)fabs(*arg); return SQ_JIT_NATIVE_RETURNED;
        default: return SQ_JIT_NATIVE_GUARD_FAILED;
    }
}

static SQInteger sqjit_a64_helper_math_binary(SQInteger op, const SQFloat *left,
    const SQFloat *right, SQFloat *out)
{
    if(!left || !right || !out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    switch((SQJitA64MathIntrinsic)op) {
        case SQ_JIT_A64_MATH_ATAN2: *out = (SQFloat)atan2(*left, *right); return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_A64_MATH_POW: *out = (SQFloat)pow(*left, *right); return SQ_JIT_NATIVE_RETURNED;
        default: return SQ_JIT_NATIVE_GUARD_FAILED;
    }
}

static SQInteger sqjit_a64_helper_integer_to_float(SQInteger value, SQFloat *out)
{
    if(!out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = (SQFloat)value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_float_to_integer(const SQFloat *value, SQInteger *out)
{
    if(!value || !out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = (SQInteger)*value;
    return SQ_JIT_NATIVE_RETURNED;
}

static void sqjit_a64_helper_store_stack_integer(SQObjectPtr *stack, SQInteger slot,
    SQInteger value)
{
    if(stack && slot >= 0) {
        stack[slot] = value;
    }
}

static void sqjit_a64_helper_store_stack_bool(SQObjectPtr *stack, SQInteger slot,
    SQInteger value)
{
    if(stack && slot >= 0) {
        stack[slot] = value != 0;
    }
}

static void sqjit_a64_helper_store_stack_float(SQObjectPtr *stack, SQInteger slot,
    const SQFloat *value)
{
    if(stack && slot >= 0 && value) {
        stack[slot] = *value;
    }
}

static bool sqjit_a64_get_member_value(const SQObjectPtr &target,
    const SQObjectPtr *key, SQObjectPtr &value);
static bool sqjit_a64_set_member_value(const SQObjectPtr &target,
    const SQObjectPtr *key, const SQObjectPtr &value);
static bool sqjit_a64_object_ptr_to_value(SQInteger target_ptr,
    SQObjectType target_type, SQObjectPtr &value);
static bool sqjit_a64_value_to_object_ptr(const SQObjectPtr &value,
    SQObjectType expected, SQInteger *out);
static bool sqjit_a64_get_member_target_with_root(SQObjectPtr *stack,
    SQInteger base_reg, const SQObjectPtr *key, const SQObjectPtr *root,
    SQObjectPtr &target, SQObjectPtr &value);

static SQObjectPtr *sqjit_a64_outer_value_ptr(SQClosure *closure,
    SQInteger outer_index)
{
    if(!closure || !closure->_function || outer_index < 0 ||
        outer_index >= closure->_function->_noutervalues ||
        sq_type(closure->_outervalues[outer_index]) != OT_OUTER) {
        return NULL;
    }

    SQOuter *outer = _outer(closure->_outervalues[outer_index]);
    return outer ? outer->_valptr : NULL;
}

static SQInteger sqjit_a64_helper_outer_get_integer(SQClosure *closure,
    SQInteger outer_index, SQInteger *out)
{
    if(!out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr *value = sqjit_a64_outer_value_ptr(closure, outer_index);
    if(!value || sq_type(*value) != OT_INTEGER) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = _integer(*value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_outer_get_float(SQClosure *closure,
    SQInteger outer_index, SQFloat *out)
{
    if(!out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr *value = sqjit_a64_outer_value_ptr(closure, outer_index);
    if(!value || sq_type(*value) != OT_FLOAT) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = _float(*value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_outer_get_array_ptr(SQClosure *closure,
    SQInteger outer_index, SQInteger expected_ptr, SQInteger *out)
{
    if(!expected_ptr || !out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr *value = sqjit_a64_outer_value_ptr(closure, outer_index);
    if(!value || sq_type(*value) != OT_ARRAY ||
        (SQInteger)(intptr_t)_array(*value) != expected_ptr) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = expected_ptr;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_outer_get_object_ptr(SQClosure *closure,
    SQInteger outer_index, SQInteger expected_type, SQInteger expected_ptr,
    SQInteger *out)
{
    if(!expected_ptr || !out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr *value = sqjit_a64_outer_value_ptr(closure, outer_index);
    SQInteger object_ptr = 0;
    if(!value || !sqjit_a64_value_to_object_ptr(*value,
        (SQObjectType)expected_type, &object_ptr) ||
        object_ptr != expected_ptr) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = expected_ptr;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_load_nulls(SQObjectPtr *stack, SQInteger start,
    SQInteger count)
{
    if(!stack || start < 0 || count < 0 ||
        start + count > MAX_FUNC_STACKSIZE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    for(SQInteger n = 0; n < count; n++) {
        stack[start + n].Null();
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_new_array(SQObjectPtr *stack, SQClosure *closure,
    SQInteger target, SQInteger reserve, SQInteger *out)
{
    if(!stack || !closure || !out || target < 0 || target >= MAX_FUNC_STACKSIZE ||
        reserve < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQArray *array = SQArray::Create(_opt_ss(closure), 0);
    if(!array) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    array->Reserve(reserve);
    stack[target] = array;
    *out = (SQInteger)(intptr_t)array;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_new_table(SQObjectPtr *stack, SQClosure *closure,
    SQInteger target, SQInteger reserve, SQInteger *out)
{
    if(!stack || !closure || !out || target < 0 || target >= MAX_FUNC_STACKSIZE ||
        reserve < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQTable *table = SQTable::Create(_opt_ss(closure), reserve);
    if(!table) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    stack[target] = table;
    *out = (SQInteger)(intptr_t)table;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_store_stack_array_ptr(SQObjectPtr *stack,
    SQInteger slot, SQInteger array_ptr)
{
    if(!stack || slot < 0 || slot >= MAX_FUNC_STACKSIZE || !array_ptr) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    stack[slot] = (SQArray *)(intptr_t)array_ptr;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_store_stack_object_ptr(SQObjectPtr *stack,
    SQInteger slot, SQInteger object_ptr, SQInteger object_type)
{
    if(!stack || slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!sqjit_a64_object_ptr_to_value(object_ptr, (SQObjectType)object_type, value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    stack[slot] = value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_table_ptr_new_slot_stack(SQInteger table_ptr,
    SQObjectPtr *stack, SQInteger key_reg, SQInteger value_reg)
{
    if(!table_ptr || !stack || key_reg < 0 || key_reg >= MAX_FUNC_STACKSIZE ||
        value_reg < 0 || value_reg >= MAX_FUNC_STACKSIZE ||
        sq_type(stack[key_reg]) == OT_NULL) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    ((SQTable *)(intptr_t)table_ptr)->NewSlot(stack[key_reg], stack[value_reg]);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_copy_stack_object(SQObjectPtr *stack,
    SQInteger dst, SQInteger src)
{
    if(!stack || dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
        src < 0 || src >= MAX_FUNC_STACKSIZE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    stack[dst] = stack[src];
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_append_integer(SQInteger array_ptr,
    SQInteger value)
{
    if(!array_ptr) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value);
    ((SQArray *)(intptr_t)array_ptr)->Append(new_value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_append_bool(SQInteger array_ptr,
    SQInteger value)
{
    if(!array_ptr) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value != 0);
    ((SQArray *)(intptr_t)array_ptr)->Append(new_value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_append_float(SQInteger array_ptr,
    const SQFloat *value)
{
    if(!array_ptr || !value) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(*value);
    ((SQArray *)(intptr_t)array_ptr)->Append(new_value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_append_float_bits(SQInteger array_ptr,
    SQInteger bits)
{
    if(!array_ptr) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQInt32 raw_bits = (SQInt32)bits;
    SQFloat value;
    memcpy(&value, &raw_bits, sizeof(value));
    SQObjectPtr new_value(value);
    ((SQArray *)(intptr_t)array_ptr)->Append(new_value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_append_stack(SQInteger array_ptr,
    SQObjectPtr *stack, SQInteger value_reg)
{
    if(!array_ptr || !stack || value_reg < 0 || value_reg >= MAX_FUNC_STACKSIZE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    ((SQArray *)(intptr_t)array_ptr)->Append(stack[value_reg]);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_append_array_ptr(SQInteger array_ptr,
    SQInteger value_ptr)
{
    if(!array_ptr || !value_ptr) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value((SQArray *)(intptr_t)value_ptr);
    ((SQArray *)(intptr_t)array_ptr)->Append(new_value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_append_object_ptr(SQInteger array_ptr,
    SQInteger value_ptr, SQInteger value_type)
{
    if(!array_ptr) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value;
    if(!sqjit_a64_object_ptr_to_value(value_ptr, (SQObjectType)value_type, new_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    ((SQArray *)(intptr_t)array_ptr)->Append(new_value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_append_literal(SQInteger array_ptr,
    const SQObjectPtr *value)
{
    if(!array_ptr || !value) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    ((SQArray *)(intptr_t)array_ptr)->Append(*value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_call_native_closure(SQClosure *callee,
    SQObjectPtr *stack, SQInteger arg_base, SQInteger nargs, SQInteger out_slot)
{
    if(!callee || !stack || arg_base < 0 || nargs <= 0 || out_slot < 0 ||
        arg_base + nargs > MAX_FUNC_STACKSIZE || out_slot >= MAX_FUNC_STACKSIZE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQFunctionProto *proto = callee->_function;
    if(!proto || proto->_bgenerator || proto->_varparams ||
        proto->_ndefaultparams != 0 || proto->_nparameters != nargs ||
        !proto->_jit || !proto->_jit->_entry) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQJitNative *native = (SQJitNative *)proto->_jit->_entry;
    if(!native || native->_ninstructions != proto->_ninstructions ||
        !native->_native_entry || native->_native_kind == SQ_JIT_NATIVE_SETTER) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQJitNativeObjectFn fn = (SQJitNativeObjectFn)native->_native_entry;
    return fn(&stack[arg_base], &stack[out_slot], callee);
}

static SQInteger sqjit_a64_helper_store_out_array_ptr(SQInteger array_ptr,
    SQObjectPtr *out)
{
    if(!array_ptr || !out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    *out = (SQArray *)(intptr_t)array_ptr;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_store_out_object_ptr(SQInteger object_ptr,
    SQInteger object_type, SQObjectPtr *out)
{
    if(!out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!sqjit_a64_object_ptr_to_value(object_ptr, (SQObjectType)object_type, value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_store_out_stack_object(SQObjectPtr *stack,
    SQInteger reg, SQObjectPtr *out)
{
    if(!stack || !out || reg < 0 || reg >= MAX_FUNC_STACKSIZE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    *out = stack[reg];
    return SQ_JIT_NATIVE_RETURNED;
}

static SQJitA64WriteLog *sqjit_a64_write_log_from_slot(SQInteger *slot)
{
    if(!slot || !*slot) {
        return NULL;
    }
    return (SQJitA64WriteLog *)(intptr_t)*slot;
}

static SQJitA64WriteLog *sqjit_a64_write_log_ensure(SQInteger *slot)
{
    if(!slot) {
        return NULL;
    }
    SQJitA64WriteLog *log = sqjit_a64_write_log_from_slot(slot);
    if(log) {
        return log;
    }

    void *mem = sq_vm_malloc(sizeof(SQJitA64WriteLog));
    if(!mem) {
        return NULL;
    }
    log = new (mem) SQJitA64WriteLog;
    *slot = (SQInteger)(intptr_t)log;
    return log;
}

static SQInteger sqjit_a64_write_log_target_index(SQJitA64WriteLog *log,
    const SQObjectPtr &target)
{
    if(!log) {
        return -1;
    }
    SQObjectType target_type = sq_type(target);
    SQRawObjectVal target_raw = _rawval(target);
    if(log->last_target_index >= 0 &&
        log->last_target_index < (SQInteger)log->targets.size() &&
        log->last_target_type == target_type &&
        log->last_target_raw == target_raw) {
        return log->last_target_index;
    }
    for(SQUnsignedInteger n = 0; n < log->targets.size(); n++) {
        if(sq_type(log->targets[n]) == target_type &&
            _rawval(log->targets[n]) == target_raw) {
            log->last_target_type = target_type;
            log->last_target_raw = target_raw;
            log->last_target_index = (SQInteger)n;
            return (SQInteger)n;
        }
    }
    SQInteger index = (SQInteger)log->targets.size();
    log->targets.push_back(target);
    log->last_target_type = target_type;
    log->last_target_raw = target_raw;
    log->last_target_index = index;
    return index;
}

static void sqjit_a64_write_log_free(SQInteger *slot)
{
    SQJitA64WriteLog *log = sqjit_a64_write_log_from_slot(slot);
    if(!log) {
        return;
    }

    log->~SQJitA64WriteLog();
    sq_vm_free(log, sizeof(SQJitA64WriteLog));
    *slot = 0;
}

static SQInteger sqjit_a64_write_log_record_array(SQInteger *slot,
    const SQObjectPtr &target, SQInteger index, const SQObjectPtr &old_value)
{
    SQJitA64WriteLog *log = sqjit_a64_write_log_ensure(slot);
    if(!log) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQInteger target_index = sqjit_a64_write_log_target_index(log, target);
    if(target_index < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQJitA64WriteLogEntry entry;
    entry.kind = SQ_JIT_A64_WRITE_ARRAY_INDEX;
    entry.target_index = target_index;
    entry.key.Null();
    entry.old_value = old_value;
    entry.index = index;
    log->entries.push_back(entry);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_write_log_record_array_size(SQInteger *slot,
    const SQObjectPtr &target, SQInteger old_size)
{
    SQJitA64WriteLog *log = sqjit_a64_write_log_ensure(slot);
    if(!log) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQInteger target_index = sqjit_a64_write_log_target_index(log, target);
    if(target_index < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQJitA64WriteLogEntry entry;
    entry.kind = SQ_JIT_A64_WRITE_ARRAY_SIZE;
    entry.target_index = target_index;
    entry.key.Null();
    entry.old_value.Null();
    entry.index = old_size;
    log->entries.push_back(entry);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_write_log_record_member(SQInteger *slot,
    const SQObjectPtr &target, const SQObjectPtr &key, const SQObjectPtr &old_value)
{
    SQJitA64WriteLog *log = sqjit_a64_write_log_ensure(slot);
    if(!log) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQInteger target_index = sqjit_a64_write_log_target_index(log, target);
    if(target_index < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQJitA64WriteLogEntry entry;
    entry.kind = SQ_JIT_A64_WRITE_MEMBER_VALUE;
    entry.target_index = target_index;
    entry.key = key;
    entry.old_value = old_value;
    entry.index = 0;
    log->entries.push_back(entry);
    return SQ_JIT_NATIVE_RETURNED;
}

static void sqjit_a64_helper_write_log_commit(SQInteger *slot)
{
    sqjit_a64_write_log_free(slot);
}

static void sqjit_a64_helper_write_log_rollback(SQInteger *slot)
{
    SQJitA64WriteLog *log = sqjit_a64_write_log_from_slot(slot);
    if(!log) {
        return;
    }

    SQUnsignedInteger count = log->entries.size();
    while(count > 0) {
        SQJitA64WriteLogEntry &entry = log->entries[--count];
        if(entry.target_index < 0 ||
            entry.target_index >= (SQInteger)log->targets.size()) {
            continue;
        }
        SQObjectPtr &target = log->targets[entry.target_index];
        if(entry.kind == SQ_JIT_A64_WRITE_ARRAY_INDEX && sq_type(target) == OT_ARRAY) {
            _array(target)->Set(entry.index, entry.old_value);
        }
        else if(entry.kind == SQ_JIT_A64_WRITE_ARRAY_SIZE && sq_type(target) == OT_ARRAY) {
            _array(target)->Resize(entry.index);
        }
        else if(entry.kind == SQ_JIT_A64_WRITE_MEMBER_VALUE) {
            sqjit_a64_set_member_value(target, &entry.key, entry.old_value);
        }
    }

    sqjit_a64_write_log_free(slot);
}

static SQInteger sqjit_a64_helper_array_set_integer_logged(SQInteger *log_slot,
    SQObjectPtr *stack, SQInteger array_reg, SQInteger index, SQInteger value)
{
    if(!log_slot || !stack || array_reg < 0 || sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr old_value;
    if(!_array(stack[array_reg])->Get(index, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_a64_write_log_record_array(log_slot, stack[array_reg], index,
        old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value);
    _array(stack[array_reg])->_values[index] = new_value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_set_bool_logged(SQInteger *log_slot,
    SQObjectPtr *stack, SQInteger array_reg, SQInteger index, SQInteger value)
{
    if(!log_slot || !stack || array_reg < 0 || sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr old_value;
    if(!_array(stack[array_reg])->Get(index, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_a64_write_log_record_array(log_slot, stack[array_reg], index,
        old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value != 0);
    _array(stack[array_reg])->_values[index] = new_value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_set_float_logged(SQInteger *log_slot,
    SQObjectPtr *stack, SQInteger array_reg, SQInteger index, const SQFloat *value)
{
    if(!log_slot || !stack || !value || array_reg < 0 ||
        sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr old_value;
    if(!_array(stack[array_reg])->Get(index, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_a64_write_log_record_array(log_slot, stack[array_reg], index,
        old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(*value);
    _array(stack[array_reg])->_values[index] = new_value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_set_integer_logged(SQInteger *log_slot,
    SQInteger array_ptr, SQInteger index, SQInteger value)
{
    if(!log_slot || !array_ptr) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQArray *array = (SQArray *)(intptr_t)array_ptr;
    SQObjectPtr target(array);
    SQObjectPtr old_value;
    if(!array->Get(index, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_a64_write_log_record_array(log_slot, target, index,
        old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value);
    array->_values[index] = new_value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_set_bool_logged(SQInteger *log_slot,
    SQInteger array_ptr, SQInteger index, SQInteger value)
{
    if(!log_slot || !array_ptr) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQArray *array = (SQArray *)(intptr_t)array_ptr;
    SQObjectPtr target(array);
    SQObjectPtr old_value;
    if(!array->Get(index, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_a64_write_log_record_array(log_slot, target, index,
        old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value != 0);
    array->_values[index] = new_value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_set_float_logged(SQInteger *log_slot,
    SQInteger array_ptr, SQInteger index, const SQFloat *value)
{
    if(!log_slot || !array_ptr || !value) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQArray *array = (SQArray *)(intptr_t)array_ptr;
    SQObjectPtr target(array);
    SQObjectPtr old_value;
    if(!array->Get(index, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_a64_write_log_record_array(log_slot, target, index,
        old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(*value);
    array->_values[index] = new_value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_append_integer_logged(SQInteger *log_slot,
    SQObjectPtr *stack, SQInteger array_reg, SQInteger value)
{
    if(!log_slot || !stack || array_reg < 0 || sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQArray *array = _array(stack[array_reg]);
    if(sqjit_a64_write_log_record_array_size(log_slot, stack[array_reg],
        array->Size()) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value);
    array->Append(new_value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_append_float_logged(SQInteger *log_slot,
    SQObjectPtr *stack, SQInteger array_reg, const SQFloat *value)
{
    if(!log_slot || !stack || !value || array_reg < 0 ||
        sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQArray *array = _array(stack[array_reg]);
    if(sqjit_a64_write_log_record_array_size(log_slot, stack[array_reg],
        array->Size()) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(*value);
    array->Append(new_value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_append_integer_logged(SQInteger *log_slot,
    SQInteger array_ptr, SQInteger value)
{
    if(!log_slot || !array_ptr) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQArray *array = (SQArray *)(intptr_t)array_ptr;
    SQObjectPtr target(array);
    if(sqjit_a64_write_log_record_array_size(log_slot, target,
        array->Size()) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value);
    array->Append(new_value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_array_ptr_append_float_logged(SQInteger *log_slot,
    SQInteger array_ptr, const SQFloat *value)
{
    if(!log_slot || !array_ptr || !value) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQArray *array = (SQArray *)(intptr_t)array_ptr;
    SQObjectPtr target(array);
    if(sqjit_a64_write_log_record_array_size(log_slot, target,
        array->Size()) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(*value);
    array->Append(new_value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_member_set_integer_logged(SQInteger *log_slot,
    SQObjectPtr *stack, SQInteger base_reg, const SQObjectPtr *key,
    SQInteger value, const SQObjectPtr *root)
{
    if(!log_slot || !stack || !key || base_reg < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr target;
    SQObjectPtr old_value;
    if(!sqjit_a64_get_member_target_with_root(stack, base_reg, key, root,
        target, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_a64_write_log_record_member(log_slot, target, *key,
        old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value);
    if(!sqjit_a64_set_member_value(target, key, new_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_member_set_bool_logged(SQInteger *log_slot,
    SQObjectPtr *stack, SQInteger base_reg, const SQObjectPtr *key,
    SQInteger value, const SQObjectPtr *root)
{
    if(!log_slot || !stack || !key || base_reg < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr target;
    SQObjectPtr old_value;
    if(!sqjit_a64_get_member_target_with_root(stack, base_reg, key, root,
        target, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_a64_write_log_record_member(log_slot, target, *key,
        old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value != 0);
    if(!sqjit_a64_set_member_value(target, key, new_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_member_set_float_logged(SQInteger *log_slot,
    SQObjectPtr *stack, SQInteger base_reg, const SQObjectPtr *key,
    const SQFloat *value, const SQObjectPtr *root)
{
    if(!log_slot || !stack || !key || !value || base_reg < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr target;
    SQObjectPtr old_value;
    if(!sqjit_a64_get_member_target_with_root(stack, base_reg, key, root,
        target, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_a64_write_log_record_member(log_slot, target, *key,
        old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(*value);
    if(!sqjit_a64_set_member_value(target, key, new_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_member_set_stack_object_logged(SQInteger *log_slot,
    SQObjectPtr *stack, SQInteger base_reg, const SQObjectPtr *key,
    SQInteger value_reg, const SQObjectPtr *root)
{
    if(!log_slot || !stack || !key || base_reg < 0 ||
        value_reg < 0 || value_reg >= MAX_FUNC_STACKSIZE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr target;
    SQObjectPtr old_value;
    if(!sqjit_a64_get_member_target_with_root(stack, base_reg, key, root,
        target, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_a64_write_log_record_member(log_slot, target, *key,
        old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    if(!sqjit_a64_set_member_value(target, key, stack[value_reg])) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_object_ptr_set_integer_logged(
    SQInteger *log_slot, SQInteger base_ptr, SQInteger base_type,
    const SQObjectPtr *key, SQInteger value)
{
    if(!log_slot || !key) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr target;
    SQObjectPtr old_value;
    if(!sqjit_a64_object_ptr_to_value(base_ptr, (SQObjectType)base_type,
        target) ||
        !sqjit_a64_get_member_value(target, key, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_a64_write_log_record_member(log_slot, target, *key,
        old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value);
    if(!sqjit_a64_set_member_value(target, key, new_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_object_ptr_set_bool_logged(
    SQInteger *log_slot, SQInteger base_ptr, SQInteger base_type,
    const SQObjectPtr *key, SQInteger value)
{
    if(!log_slot || !key) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr target;
    SQObjectPtr old_value;
    if(!sqjit_a64_object_ptr_to_value(base_ptr, (SQObjectType)base_type,
        target) ||
        !sqjit_a64_get_member_value(target, key, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_a64_write_log_record_member(log_slot, target, *key,
        old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value != 0);
    if(!sqjit_a64_set_member_value(target, key, new_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_object_ptr_set_float_logged(
    SQInteger *log_slot, SQInteger base_ptr, SQInteger base_type,
    const SQObjectPtr *key, const SQFloat *value)
{
    if(!log_slot || !key || !value) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr target;
    SQObjectPtr old_value;
    if(!sqjit_a64_object_ptr_to_value(base_ptr, (SQObjectType)base_type,
        target) ||
        !sqjit_a64_get_member_value(target, key, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_a64_write_log_record_member(log_slot, target, *key,
        old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(*value);
    if(!sqjit_a64_set_member_value(target, key, new_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_object_ptr_set_stack_object_logged(
    SQInteger *log_slot, SQInteger base_ptr, SQInteger base_type,
    const SQObjectPtr *key, SQObjectPtr *stack, SQInteger value_reg)
{
    if(!log_slot || !key || !stack ||
        value_reg < 0 || value_reg >= MAX_FUNC_STACKSIZE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr target;
    SQObjectPtr old_value;
    if(!sqjit_a64_object_ptr_to_value(base_ptr, (SQObjectType)base_type,
        target) ||
        !sqjit_a64_get_member_value(target, key, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_a64_write_log_record_member(log_slot, target, *key,
        old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    if(!sqjit_a64_set_member_value(target, key, stack[value_reg])) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_instance_field_set_integer_logged(
    SQInteger *log_slot, SQInteger instance_ptr, SQClass *expected_class,
    const SQObjectPtr *key, SQInteger field_index, SQInteger value)
{
    if(!log_slot || !instance_ptr || !expected_class || !key ||
        field_index < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQInstance *inst = (SQInstance *)(intptr_t)instance_ptr;
    if(inst->_class != expected_class ||
        field_index >= (SQInteger)expected_class->_defaultvalues.size()) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr target(inst);
    SQObjectPtr old_value(_realval(inst->_values[field_index]));
    if(sqjit_a64_write_log_record_member(log_slot, target, *key,
        old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value);
    inst->_values[field_index] = new_value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_instance_field_set_bool_logged(
    SQInteger *log_slot, SQInteger instance_ptr, SQClass *expected_class,
    const SQObjectPtr *key, SQInteger field_index, SQInteger value)
{
    if(!log_slot || !instance_ptr || !expected_class || !key ||
        field_index < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQInstance *inst = (SQInstance *)(intptr_t)instance_ptr;
    if(inst->_class != expected_class ||
        field_index >= (SQInteger)expected_class->_defaultvalues.size()) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr target(inst);
    SQObjectPtr old_value(_realval(inst->_values[field_index]));
    if(sqjit_a64_write_log_record_member(log_slot, target, *key,
        old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value != 0);
    inst->_values[field_index] = new_value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_instance_field_set_float_logged(
    SQInteger *log_slot, SQInteger instance_ptr, SQClass *expected_class,
    const SQObjectPtr *key, SQInteger field_index, const SQFloat *value)
{
    if(!log_slot || !instance_ptr || !expected_class || !key ||
        field_index < 0 || !value) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQInstance *inst = (SQInstance *)(intptr_t)instance_ptr;
    if(inst->_class != expected_class ||
        field_index >= (SQInteger)expected_class->_defaultvalues.size()) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr target(inst);
    SQObjectPtr old_value(_realval(inst->_values[field_index]));
    if(sqjit_a64_write_log_record_member(log_slot, target, *key,
        old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(*value);
    inst->_values[field_index] = new_value;
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

static SQObjectType sqjit_a64_observed_array_ptr_value_type(SQArray *array,
    SQInteger index, SQArray **array_out)
{
    if(array_out) {
        *array_out = NULL;
    }
    if(!array || index < 0) {
        return OT_NULL;
    }
    SQObjectPtr value;
    if(!array->Get(index, value)) {
        return OT_NULL;
    }
    if(sq_type(value) == OT_ARRAY && array_out) {
        *array_out = _array(value);
    }
    return sq_type(value);
}

static bool sqjit_a64_get_member_value(const SQObjectPtr &target,
    const SQObjectPtr *key, SQObjectPtr &value)
{
    if(!key) {
        return false;
    }
    if(sq_type(target) == OT_TABLE) {
        return _table(target)->Get(*key, value);
    }
    if(sq_type(target) == OT_INSTANCE) {
        return _instance(target)->Get(*key, value);
    }
    if(sq_type(target) == OT_CLASS) {
        return _class(target)->Get(*key, value);
    }
    return false;
}

static bool sqjit_a64_get_member_ptr_value(SQInteger target_ptr, SQObjectType target_type,
    const SQObjectPtr *key, SQObjectPtr &value)
{
    if(!target_ptr || !key) {
        return false;
    }
    if(target_type == OT_TABLE) {
        return ((SQTable *)(intptr_t)target_ptr)->Get(*key, value);
    }
    if(target_type == OT_INSTANCE) {
        return ((SQInstance *)(intptr_t)target_ptr)->Get(*key, value);
    }
    if(target_type == OT_CLASS) {
        return ((SQClass *)(intptr_t)target_ptr)->Get(*key, value);
    }
    return false;
}

static bool sqjit_a64_set_member_value(const SQObjectPtr &target,
    const SQObjectPtr *key, const SQObjectPtr &value)
{
    if(!key) {
        return false;
    }
    if(sq_type(target) == OT_TABLE) {
        return _table(target)->Set(*key, value);
    }
    if(sq_type(target) == OT_INSTANCE) {
        return _instance(target)->Set(*key, value);
    }
    return false;
}

static bool sqjit_a64_object_ptr_to_value(SQInteger target_ptr,
    SQObjectType target_type, SQObjectPtr &value)
{
    if(!target_ptr) {
        return false;
    }
    switch(target_type) {
        case OT_TABLE:
            value = SQObjectPtr((SQTable *)(intptr_t)target_ptr);
            return true;
        case OT_INSTANCE:
            value = SQObjectPtr((SQInstance *)(intptr_t)target_ptr);
            return true;
        case OT_CLASS:
            value = SQObjectPtr((SQClass *)(intptr_t)target_ptr);
            return true;
        case OT_CLOSURE:
            value = SQObjectPtr((SQClosure *)(intptr_t)target_ptr);
            return true;
        case OT_STRING:
            value = SQObjectPtr((SQString *)(intptr_t)target_ptr);
            return true;
        default:
            return false;
    }
}

static bool sqjit_a64_get_member_value_with_root(SQObjectPtr *stack, SQInteger base_reg,
    const SQObjectPtr *key, const SQObjectPtr *root, SQObjectPtr &value)
{
    if(!stack || base_reg < 0 || !key) {
        return false;
    }
    if(sqjit_a64_get_member_value(stack[base_reg], key, value)) {
        return true;
    }
    if(base_reg == 0 && root && sq_type(*root) != OT_NULL) {
        return sqjit_a64_get_member_value(*root, key, value);
    }
    return false;
}

static bool sqjit_a64_get_member_target_with_root(SQObjectPtr *stack,
    SQInteger base_reg, const SQObjectPtr *key, const SQObjectPtr *root,
    SQObjectPtr &target, SQObjectPtr &value)
{
    if(!stack || base_reg < 0 || !key) {
        return false;
    }
    if(sqjit_a64_get_member_value(stack[base_reg], key, value)) {
        target = stack[base_reg];
        return true;
    }
    if(base_reg == 0 && root && sq_type(*root) != OT_NULL &&
        sqjit_a64_get_member_value(*root, key, value)) {
        target = *root;
        return true;
    }
    return false;
}

static bool sqjit_a64_value_to_object_ptr(const SQObjectPtr &value, SQObjectType expected,
    SQInteger *out)
{
    if(!out || sq_type(value) != expected) {
        return false;
    }
    switch(expected) {
        case OT_TABLE:
            *out = (SQInteger)(intptr_t)_table(value);
            return true;
        case OT_INSTANCE:
            *out = (SQInteger)(intptr_t)_instance(value);
            return true;
        case OT_CLASS:
            *out = (SQInteger)(intptr_t)_class(value);
            return true;
        case OT_CLOSURE:
            *out = (SQInteger)(intptr_t)_closure(value);
            return true;
        case OT_STRING:
            *out = (SQInteger)(intptr_t)_string(value);
            return true;
        default:
            return false;
    }
}

static bool sqjit_a64_type_is_object_ptr(SQObjectType type)
{
    return type == OT_TABLE || type == OT_INSTANCE || type == OT_CLASS ||
        type == OT_CLOSURE || type == OT_STRING;
}

struct SQJitA64InstanceFieldObservation {
    SQClass *klass;
    SQInteger field_index;
    SQInteger class_disp;
    SQInteger value_disp;
    SQObjectType value_type;
    SQArray *array_value;
    SQInteger object_ptr_value;
};

static bool sqjit_a64_class_field_index(SQClass *klass, const SQObjectPtr *key,
    SQInteger *field_index)
{
    if(!klass || !key || !field_index) {
        return false;
    }
    SQObjectPtr member;
    if(!klass->_members || !klass->_members->Get(*key, member) || !_isfield(member)) {
        return false;
    }
    SQInteger index = _member_idx(member);
    if(index < 0 || index >= (SQInteger)klass->_defaultvalues.size()) {
        return false;
    }
    *field_index = index;
    return true;
}

static SQInteger sqjit_a64_instance_class_disp()
{
    SQInstance *inst = (SQInstance *)(intptr_t)4096;
    return (SQInteger)((char *)&inst->_class - (char *)inst);
}

static SQInteger sqjit_a64_instance_value_disp(SQInteger field_index)
{
    SQInstance *inst = (SQInstance *)(intptr_t)4096;
    return (SQInteger)((char *)&inst->_values[field_index] - (char *)inst);
}

static bool sqjit_a64_observed_instance_field(SQInstance *inst,
    const SQObjectPtr *key, SQJitA64InstanceFieldObservation *out)
{
    if(!inst || !inst->_class || !key || !out) {
        return false;
    }

    SQInteger field_index = -1;
    if(!sqjit_a64_class_field_index(inst->_class, key, &field_index)) {
        return false;
    }

    SQObjectPtr value(_realval(inst->_values[field_index]));
    out->klass = inst->_class;
    out->field_index = field_index;
    out->class_disp = (SQInteger)((char *)&inst->_class - (char *)inst);
    out->value_disp = (SQInteger)((char *)&inst->_values[field_index] - (char *)inst);
    out->value_type = sq_type(value);
    out->array_value = sq_type(value) == OT_ARRAY ? _array(value) : NULL;
    out->object_ptr_value = 0;
    if(sqjit_a64_type_is_object_ptr(sq_type(value))) {
        sqjit_a64_value_to_object_ptr(value, sq_type(value), &out->object_ptr_value);
    }
    return true;
}

static bool sqjit_a64_observed_stack_instance_field(SQObjectPtr *entry_stack,
    SQInteger stack_reg, const SQObjectPtr *key,
    SQJitA64InstanceFieldObservation *out)
{
    if(!entry_stack || stack_reg < 0 || sq_type(entry_stack[stack_reg]) != OT_INSTANCE) {
        return false;
    }
    return sqjit_a64_observed_instance_field(_instance(entry_stack[stack_reg]),
        key, out);
}

static bool sqjit_a64_observed_object_ptr_instance_field(SQInteger object_ptr,
    SQObjectType object_type, const SQObjectPtr *key,
    SQJitA64InstanceFieldObservation *out)
{
    if(!object_ptr || object_type != OT_INSTANCE) {
        return false;
    }
    return sqjit_a64_observed_instance_field((SQInstance *)(intptr_t)object_ptr,
        key, out);
}

static SQObjectType sqjit_a64_observed_outer_value_type(SQClosure *closure,
    SQInteger outer_index, SQArray **array_out = NULL,
    SQInteger *object_ptr_out = NULL)
{
    if(array_out) {
        *array_out = NULL;
    }
    if(object_ptr_out) {
        *object_ptr_out = 0;
    }

    SQObjectPtr *value = sqjit_a64_outer_value_ptr(closure, outer_index);
    if(!value) {
        return OT_NULL;
    }
    if(sq_type(*value) == OT_ARRAY && array_out) {
        *array_out = _array(*value);
    }
    if(sqjit_a64_type_is_object_ptr(sq_type(*value)) && object_ptr_out) {
        sqjit_a64_value_to_object_ptr(*value, sq_type(*value), object_ptr_out);
    }
    return sq_type(*value);
}

static bool sqjit_a64_math_intrinsic_from_name(const SQChar *name,
    SQJitA64MathIntrinsic *intrinsic, SQInteger *nargs)
{
    if(!name || !intrinsic || !nargs) {
        return false;
    }

    struct MathName {
        const SQChar *name;
        SQJitA64MathIntrinsic intrinsic;
        SQInteger nargs;
    };
    static const MathName math_names[] = {
        { _SC("sqrt"), SQ_JIT_A64_MATH_SQRT, 1 },
        { _SC("sin"), SQ_JIT_A64_MATH_SIN, 1 },
        { _SC("cos"), SQ_JIT_A64_MATH_COS, 1 },
        { _SC("asin"), SQ_JIT_A64_MATH_ASIN, 1 },
        { _SC("acos"), SQ_JIT_A64_MATH_ACOS, 1 },
        { _SC("log"), SQ_JIT_A64_MATH_LOG, 1 },
        { _SC("log10"), SQ_JIT_A64_MATH_LOG10, 1 },
        { _SC("tan"), SQ_JIT_A64_MATH_TAN, 1 },
        { _SC("atan"), SQ_JIT_A64_MATH_ATAN, 1 },
        { _SC("floor"), SQ_JIT_A64_MATH_FLOOR, 1 },
        { _SC("ceil"), SQ_JIT_A64_MATH_CEIL, 1 },
        { _SC("exp"), SQ_JIT_A64_MATH_EXP, 1 },
        { _SC("fabs"), SQ_JIT_A64_MATH_FABS, 1 },
        { _SC("atan2"), SQ_JIT_A64_MATH_ATAN2, 2 },
        { _SC("pow"), SQ_JIT_A64_MATH_POW, 2 },
        { NULL, SQ_JIT_A64_MATH_NONE, 0 }
    };

    for(SQInteger i = 0; math_names[i].name; i++) {
        if(scstrcmp(name, math_names[i].name) == 0) {
            *intrinsic = math_names[i].intrinsic;
            *nargs = math_names[i].nargs;
            return true;
        }
    }
    return false;
}

static bool sqjit_a64_math_intrinsic_from_native(SQNativeClosure *closure,
    SQJitA64MathIntrinsic *intrinsic, SQInteger *nargs)
{
    if(!closure || sq_type(closure->_name) != OT_STRING) {
        return false;
    }
    return sqjit_a64_math_intrinsic_from_name(_stringval(closure->_name),
        intrinsic, nargs);
}

static SQInteger sqjit_a64_helper_closure_slot_guard(SQObjectPtr *stack,
    SQInteger closure_reg, SQClosure *expected)
{
    if(!stack || closure_reg < 0 || !expected ||
        sq_type(stack[closure_reg]) != OT_CLOSURE ||
        _closure(stack[closure_reg]) != expected) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_member_closure_guard(SQObjectPtr *stack,
    SQInteger base_reg, const SQObjectPtr *key, SQClosure *expected,
    const SQObjectPtr *root)
{
    if(!stack || base_reg < 0 || !key || !expected) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!sqjit_a64_get_member_value_with_root(stack, base_reg, key, root, value) ||
        sq_type(value) != OT_CLOSURE ||
        _closure(value) != expected) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_object_ptr_member_closure_guard(SQInteger base_ptr,
    SQInteger base_type, const SQObjectPtr *key, SQClosure *expected)
{
    if(!key || !expected) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!sqjit_a64_get_member_ptr_value(base_ptr, (SQObjectType)base_type, key, value) ||
        sq_type(value) != OT_CLOSURE ||
        _closure(value) != expected) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_member_native_closure_guard(SQObjectPtr *stack,
    SQInteger base_reg, const SQObjectPtr *key, SQNativeClosure *expected,
    const SQObjectPtr *root)
{
    if(!stack || base_reg < 0 || !key || !expected) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!sqjit_a64_get_member_value_with_root(stack, base_reg, key, root, value) ||
        sq_type(value) != OT_NATIVECLOSURE ||
        _nativeclosure(value) != expected) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_object_ptr_member_native_closure_guard(
    SQInteger base_ptr, SQInteger base_type, const SQObjectPtr *key,
    SQNativeClosure *expected)
{
    if(!key || !expected) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!sqjit_a64_get_member_ptr_value(base_ptr, (SQObjectType)base_type, key, value) ||
        sq_type(value) != OT_NATIVECLOSURE ||
        _nativeclosure(value) != expected) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_member_object_ptr_guard(SQObjectPtr *stack,
    SQInteger base_reg, const SQObjectPtr *key, SQInteger expected_type,
    SQInteger expected_ptr, const SQObjectPtr *root)
{
    if(!stack || base_reg < 0 || !key || !expected_ptr) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    SQInteger actual_ptr = 0;
    if(!sqjit_a64_get_member_value_with_root(stack, base_reg, key, root, value) ||
        !sqjit_a64_value_to_object_ptr(value, (SQObjectType)expected_type,
        &actual_ptr) ||
        actual_ptr != expected_ptr) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_object_ptr_member_object_ptr_guard(
    SQInteger base_ptr, SQInteger base_type, const SQObjectPtr *key,
    SQInteger expected_type, SQInteger expected_ptr)
{
    if(!key || !expected_ptr) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    SQInteger actual_ptr = 0;
    if(!sqjit_a64_get_member_ptr_value(base_ptr, (SQObjectType)base_type, key, value) ||
        !sqjit_a64_value_to_object_ptr(value, (SQObjectType)expected_type,
        &actual_ptr) ||
        actual_ptr != expected_ptr) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_member_exists_guard(SQObjectPtr *stack,
    SQInteger base_reg, const SQObjectPtr *key, SQInteger expected,
    const SQObjectPtr *root)
{
    if(!stack || base_reg < 0 || !key) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    bool exists = sqjit_a64_get_member_value_with_root(stack, base_reg, key,
        root, value);
    return exists == (expected != 0) ? SQ_JIT_NATIVE_RETURNED :
        SQ_JIT_NATIVE_GUARD_FAILED;
}

static SQInteger sqjit_a64_helper_object_ptr_member_exists_guard(
    SQInteger base_ptr, SQInteger base_type, const SQObjectPtr *key,
    SQInteger expected)
{
    if(!key) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    bool exists = sqjit_a64_get_member_ptr_value(base_ptr,
        (SQObjectType)base_type, key, value);
    return exists == (expected != 0) ? SQ_JIT_NATIVE_RETURNED :
        SQ_JIT_NATIVE_GUARD_FAILED;
}

static bool sqjit_a64_constructor_looks_like_array_field_pack(SQClosure *closure)
{
    SQFunctionProto *proto = closure ? closure->_function : NULL;
    if(!proto || proto->_bgenerator || proto->_varparams ||
        proto->_nparameters != 5 || proto->_ndefaultparams != 4) {
        return false;
    }

    bool has_typeof = false;
    bool has_new_array = false;
    bool has_append_array = false;
    bool has_set = false;
    for(SQInteger ip = 0; ip < proto->_ninstructions; ip++) {
        const SQInstruction &inst = proto->_instructions[ip];
        switch(inst.op) {
        case _OP_TYPEOF:
            has_typeof = true;
            break;
        case _OP_NEWOBJ:
            if(inst._arg3 == NOT_ARRAY) {
                has_new_array = true;
            }
            break;
        case _OP_APPENDARRAY:
            has_append_array = true;
            break;
        case _OP_SET:
            has_set = true;
            break;
        default:
            break;
        }
    }
    return has_typeof && has_new_array && has_append_array && has_set;
}

static bool sqjit_a64_ctor_pack_mode_valid(SQObjectPtr *stack, SQInteger arg_base,
    SQInteger nargs, SQInteger mode, SQInteger *pack_count)
{
    if(!stack || !pack_count || arg_base < 0 || nargs <= 0 ||
        arg_base + nargs > MAX_FUNC_STACKSIZE) {
        return false;
    }
    *pack_count = 0;
    switch(mode) {
    case SQ_JIT_A64_CTOR_ARRAY_FIELD_DEFAULT3:
        *pack_count = 3;
        return nargs == 1;
    case SQ_JIT_A64_CTOR_ARRAY_FIELD_CLONE_ARRAY:
        return nargs == 2 && sq_type(stack[arg_base + 1]) == OT_ARRAY;
    case SQ_JIT_A64_CTOR_ARRAY_FIELD_PACK1:
    case SQ_JIT_A64_CTOR_ARRAY_FIELD_PACK2:
    case SQ_JIT_A64_CTOR_ARRAY_FIELD_PACK3:
    case SQ_JIT_A64_CTOR_ARRAY_FIELD_PACK4:
        *pack_count = mode - SQ_JIT_A64_CTOR_ARRAY_FIELD_PACK1 + 1;
        if(nargs != *pack_count + 1 || sq_type(stack[arg_base + 1]) == OT_ARRAY) {
            return false;
        }
        for(SQInteger n = 0; n < *pack_count; n++) {
            if(sq_type(stack[arg_base + 1 + n]) == OT_NULL) {
                return false;
            }
        }
        return true;
    default:
        return false;
    }
}

static SQInteger sqjit_a64_helper_call_array_field_constructor(SQClass *klass,
    SQClosure *expected_ctor, SQObjectPtr *stack, SQInteger arg_base,
    SQInteger nargs, SQInteger out_slot, SQInteger field_index, SQInteger mode)
{
    if(!klass || !expected_ctor || !stack || arg_base < 0 || nargs <= 0 ||
        arg_base + nargs > MAX_FUNC_STACKSIZE || out_slot < 0 ||
        out_slot >= MAX_FUNC_STACKSIZE || field_index < 0 ||
        field_index >= (SQInteger)klass->_defaultvalues.size() ||
        klass->_defaultvalues.size() != 1 ||
        sq_type(klass->_defaultvalues[0].val) != OT_NULL) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr constructor;
    if(!klass->GetConstructor(constructor) || sq_type(constructor) != OT_CLOSURE ||
        _closure(constructor) != expected_ctor) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQInteger pack_count = 0;
    if(!sqjit_a64_ctor_pack_mode_valid(stack, arg_base, nargs, mode, &pack_count)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQArray *array = NULL;
    if(mode == SQ_JIT_A64_CTOR_ARRAY_FIELD_CLONE_ARRAY) {
        array = _array(stack[arg_base + 1])->Clone();
    }
    else {
        array = SQArray::Create(_opt_ss(klass), 0);
        if(array) {
            array->Reserve(pack_count);
        }
    }
    if(!array) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    if(mode == SQ_JIT_A64_CTOR_ARRAY_FIELD_DEFAULT3) {
        SQObjectPtr zero((SQFloat)0);
        array->Append(zero);
        array->Append(zero);
        array->Append(zero);
    }
    else if(mode != SQ_JIT_A64_CTOR_ARRAY_FIELD_CLONE_ARRAY) {
        for(SQInteger n = 0; n < pack_count; n++) {
            array->Append(stack[arg_base + 1 + n]);
        }
    }

    SQInstance *raw_instance = klass->CreateInstance();
    if(!raw_instance) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr instance(raw_instance);
    SQObjectPtr values(array);
    raw_instance->_values[field_index] = values;
    stack[arg_base] = instance;
    stack[out_slot] = instance;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_prev_effective_ip(SQFunctionProto *proto,
    SQInteger ip)
{
    if(!proto) {
        return -1;
    }
    for(SQInteger n = ip - 1; n >= 0; n--) {
        if(proto->_instructions[n].op != _OP_LINE) {
            return n;
        }
    }
    return -1;
}

static bool sqjit_a64_constructor_tail_is_scalar_field_pack(SQClass *klass,
    SQClosure **ctor_out, SQInteger nargs, SQInteger *field_count_out)
{
    if(!klass || !ctor_out || !field_count_out || nargs < 2 ||
        nargs > MAX_FUNC_STACKSIZE) {
        return false;
    }
    *ctor_out = NULL;
    *field_count_out = 0;

    SQInteger field_count = (SQInteger)klass->_defaultvalues.size();
    if(field_count <= 0 || field_count > 16 || field_count != nargs - 1) {
        return false;
    }
    for(SQInteger n = 0; n < field_count; n++) {
        SQObjectType default_type = sq_type(klass->_defaultvalues[n].val);
        if(default_type != OT_INTEGER && default_type != OT_FLOAT &&
            default_type != OT_BOOL) {
            return false;
        }
    }

    SQObjectPtr constructor;
    if(!klass->GetConstructor(constructor) || sq_type(constructor) != OT_CLOSURE) {
        return false;
    }
    SQClosure *ctor = _closure(constructor);
    SQFunctionProto *proto = ctor ? ctor->_function : NULL;
    if(!proto || proto->_bgenerator || proto->_varparams ||
        proto->_nparameters != nargs || proto->_ninstructions <= 0) {
        return false;
    }

    bool branch_target[513];
    for(SQInteger n = 0; n < 513; n++) {
        branch_target[n] = false;
    }
    for(SQInteger ip = 0; ip < proto->_ninstructions && ip < 513; ip++) {
        const SQInstruction &inst = proto->_instructions[ip];
        if(inst.op == _OP_JMP || inst.op == _OP_JZ || inst.op == _OP_JCMP) {
            SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
            if(target_ip >= 0 && target_ip < 513) {
                branch_target[target_ip] = true;
            }
        }
    }

    SQInteger return_ip = sqjit_a64_prev_effective_ip(proto,
        proto->_ninstructions);
    if(return_ip < 0 || proto->_instructions[return_ip].op != _OP_RETURN) {
        return false;
    }

    bool seen[16];
    for(SQInteger n = 0; n < 16; n++) {
        seen[n] = false;
    }

    SQInteger ip = sqjit_a64_prev_effective_ip(proto, return_ip);
    SQInteger tail_start = -1;
    for(SQInteger n = 0; n < field_count; n++) {
        if(ip < 0 || proto->_instructions[ip].op != _OP_SET) {
            return false;
        }
        const SQInstruction &set = proto->_instructions[ip];
        if(set._arg0 != 0xFF || set._arg1 != 0 ||
            set._arg2 < 0 || set._arg2 >= MAX_FUNC_STACKSIZE ||
            set._arg3 < 1 || set._arg3 > field_count) {
            return false;
        }

        SQInteger load_ip = sqjit_a64_prev_effective_ip(proto, ip);
        if(load_ip < 0 || proto->_instructions[load_ip].op != _OP_LOAD) {
            return false;
        }
        const SQInstruction &load = proto->_instructions[load_ip];
        if(load._arg0 != set._arg2 || load._arg1 < 0 ||
            load._arg1 >= proto->_nliterals ||
            sq_type(proto->_literals[load._arg1]) != OT_STRING) {
            return false;
        }

        SQInteger field_index = -1;
        if(!sqjit_a64_class_field_index(klass, &proto->_literals[load._arg1],
            &field_index) ||
            field_index < 0 || field_index >= field_count ||
            field_index + 1 != set._arg3 || seen[field_index]) {
            return false;
        }
        seen[field_index] = true;
        tail_start = load_ip;
        ip = sqjit_a64_prev_effective_ip(proto, load_ip);
    }

    if(tail_start < 0) {
        return false;
    }
    SQInteger first_ip = -1;
    for(SQInteger n = 0; n < proto->_ninstructions; n++) {
        if(proto->_instructions[n].op != _OP_LINE) {
            first_ip = n;
            break;
        }
    }
    if(tail_start != first_ip &&
        (tail_start >= 513 || !branch_target[tail_start])) {
        return false;
    }

    for(SQInteger n = 0; n < field_count; n++) {
        if(!seen[n]) {
            return false;
        }
    }

    *ctor_out = ctor;
    *field_count_out = field_count;
    return true;
}

static SQInteger sqjit_a64_helper_call_scalar_field_constructor(SQClass *klass,
    SQClosure *expected_ctor, SQObjectPtr *stack, SQInteger arg_base,
    SQInteger nargs, SQInteger out_slot, SQInteger field_count)
{
    if(!klass || !expected_ctor || !stack || arg_base < 0 || nargs <= 0 ||
        arg_base + nargs > MAX_FUNC_STACKSIZE || out_slot < 0 ||
        out_slot >= MAX_FUNC_STACKSIZE || field_count <= 0 ||
        field_count != nargs - 1 ||
        field_count != (SQInteger)klass->_defaultvalues.size()) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr constructor;
    if(!klass->GetConstructor(constructor) || sq_type(constructor) != OT_CLOSURE ||
        _closure(constructor) != expected_ctor) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQInstance *raw_instance = klass->CreateInstance();
    if(!raw_instance) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr instance(raw_instance);
    for(SQInteger n = 0; n < field_count; n++) {
        raw_instance->_values[n] = stack[arg_base + 1 + n];
    }
    stack[arg_base] = instance;
    stack[out_slot] = instance;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_call_class(SQClass *klass, SQObjectPtr *stack,
    SQInteger arg_base, SQInteger nargs, SQInteger out_slot)
{
    if(!klass || !stack || arg_base < 0 || nargs <= 0 ||
        arg_base + nargs > MAX_FUNC_STACKSIZE || out_slot < 0 ||
        out_slot >= MAX_FUNC_STACKSIZE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr constructor;
    if(!klass->GetConstructor(constructor)) {
        stack[out_slot] = klass->CreateInstance();
        return SQ_JIT_NATIVE_RETURNED;
    }
    if(sq_type(constructor) != OT_CLOSURE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQClosure *callee = _closure(constructor);
    SQFunctionProto *proto = callee ? callee->_function : NULL;
    if(!proto || proto->_bgenerator || proto->_varparams ||
        proto->_ndefaultparams != 0 || proto->_nparameters != nargs ||
        !proto->_jit || !proto->_jit->_entry) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQJitNative *native = (SQJitNative *)proto->_jit->_entry;
    if(!native || native->_ninstructions != proto->_ninstructions ||
        !native->_native_entry || native->_native_kind == SQ_JIT_NATIVE_SETTER) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr original_self = stack[arg_base];
    SQObjectPtr instance = klass->CreateInstance();
    stack[arg_base] = instance;

    SQObjectPtr ignored;
    SQJitNativeObjectFn fn = (SQJitNativeObjectFn)native->_native_entry;
    SQInteger status = fn(&stack[arg_base], &ignored, callee);
    if(status != SQ_JIT_NATIVE_RETURNED) {
        stack[arg_base] = original_self;
        return status;
    }

    stack[out_slot] = instance;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_table_get_integer(SQObjectPtr *stack, SQInteger table_reg,
    const SQObjectPtr *key, SQInteger *out)
{
    if(!stack || !key || !out || table_reg < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_value(stack[table_reg], key, value) ||
        sq_type(value) != OT_INTEGER) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = _integer(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_table_get_float(SQObjectPtr *stack, SQInteger table_reg,
    const SQObjectPtr *key, SQFloat *out)
{
    if(!stack || !key || !out || table_reg < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_value(stack[table_reg], key, value) ||
        sq_type(value) != OT_FLOAT) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = _float(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_table_get_array_ptr(SQObjectPtr *stack, SQInteger table_reg,
    const SQObjectPtr *key, SQInteger *out)
{
    if(!stack || !key || !out || table_reg < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_value(stack[table_reg], key, value) ||
        sq_type(value) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = (SQInteger)(intptr_t)_array(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_member_get_object_ptr(SQObjectPtr *stack,
    SQInteger base_reg, const SQObjectPtr *key, SQInteger expected_type, SQInteger *out)
{
    if(!stack || !key || !out || base_reg < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_value(stack[base_reg], key, value) ||
        !sqjit_a64_value_to_object_ptr(value, (SQObjectType)expected_type, out)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_member_get_object_ptr_root(SQObjectPtr *stack,
    SQInteger base_reg, const SQObjectPtr *key, SQInteger expected_type,
    const SQObjectPtr *root, SQInteger *out)
{
    if(!stack || !key || !out || base_reg < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_value_with_root(stack, base_reg, key, root, value) ||
        !sqjit_a64_value_to_object_ptr(value, (SQObjectType)expected_type, out)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_table_get_integer_root(SQObjectPtr *stack,
    SQInteger table_reg, const SQObjectPtr *key, const SQObjectPtr *root,
    SQInteger *out)
{
    if(!stack || !key || !out || table_reg < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_value_with_root(stack, table_reg, key, root, value) ||
        sq_type(value) != OT_INTEGER) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = _integer(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_table_get_float_root(SQObjectPtr *stack,
    SQInteger table_reg, const SQObjectPtr *key, const SQObjectPtr *root,
    SQFloat *out)
{
    if(!stack || !key || !out || table_reg < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_value_with_root(stack, table_reg, key, root, value) ||
        sq_type(value) != OT_FLOAT) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = _float(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_table_get_array_ptr_root(SQObjectPtr *stack,
    SQInteger table_reg, const SQObjectPtr *key, const SQObjectPtr *root,
    SQInteger *out)
{
    if(!stack || !key || !out || table_reg < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_value_with_root(stack, table_reg, key, root, value) ||
        sq_type(value) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = (SQInteger)(intptr_t)_array(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_object_ptr_get_integer(SQInteger base_ptr,
    SQInteger base_type, const SQObjectPtr *key, SQInteger *out)
{
    if(!key || !out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_ptr_value(base_ptr, (SQObjectType)base_type, key, value) ||
        sq_type(value) != OT_INTEGER) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = _integer(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_object_ptr_get_float(SQInteger base_ptr,
    SQInteger base_type, const SQObjectPtr *key, SQFloat *out)
{
    if(!key || !out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_ptr_value(base_ptr, (SQObjectType)base_type, key, value) ||
        sq_type(value) != OT_FLOAT) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = _float(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_object_ptr_get_array_ptr(SQInteger base_ptr,
    SQInteger base_type, const SQObjectPtr *key, SQInteger *out)
{
    if(!key || !out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_ptr_value(base_ptr, (SQObjectType)base_type, key, value) ||
        sq_type(value) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    *out = (SQInteger)(intptr_t)_array(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_object_ptr_get_object_ptr(SQInteger base_ptr,
    SQInteger base_type, const SQObjectPtr *key, SQInteger expected_type, SQInteger *out)
{
    if(!key || !out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_ptr_value(base_ptr, (SQObjectType)base_type, key, value) ||
        !sqjit_a64_value_to_object_ptr(value, (SQObjectType)expected_type, out)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_member_get_object_dynamic_key(SQObjectPtr *stack,
    SQInteger base_reg, SQInteger key_ptr, SQInteger key_type, SQInteger out_reg)
{
    if(!stack || base_reg < 0 || base_reg >= MAX_FUNC_STACKSIZE ||
        out_reg < 0 || out_reg >= MAX_FUNC_STACKSIZE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr key;
    SQObjectPtr value;
    if(!sqjit_a64_object_ptr_to_value(key_ptr, (SQObjectType)key_type, key) ||
        !sqjit_a64_get_member_value(stack[base_reg], &key, value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    stack[out_reg] = value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_member_get_object_dynamic_key_root(SQObjectPtr *stack,
    SQInteger base_reg, SQInteger key_ptr, SQInteger key_type, const SQObjectPtr *root,
    SQInteger out_reg)
{
    if(!stack || base_reg < 0 || base_reg >= MAX_FUNC_STACKSIZE ||
        out_reg < 0 || out_reg >= MAX_FUNC_STACKSIZE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr key;
    SQObjectPtr value;
    if(!sqjit_a64_object_ptr_to_value(key_ptr, (SQObjectType)key_type, key) ||
        !sqjit_a64_get_member_value_with_root(stack, base_reg, &key, root, value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    stack[out_reg] = value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_a64_helper_object_ptr_get_object_dynamic_key(SQInteger base_ptr,
    SQInteger base_type, SQInteger key_ptr, SQInteger key_type, SQObjectPtr *stack,
    SQInteger out_reg)
{
    if(!stack || out_reg < 0 || out_reg >= MAX_FUNC_STACKSIZE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr key;
    SQObjectPtr value;
    if(!sqjit_a64_object_ptr_to_value(key_ptr, (SQObjectType)key_type, key) ||
        !sqjit_a64_get_member_ptr_value(base_ptr, (SQObjectType)base_type, &key, value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    stack[out_reg] = value;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQObjectType sqjit_a64_observed_table_value_type(SQObjectPtr *entry_stack,
    SQInteger table_reg, const SQObjectPtr *key, SQArray **array_out = NULL,
    SQInteger *object_ptr_out = NULL)
{
    if(array_out) {
        *array_out = NULL;
    }
    if(object_ptr_out) {
        *object_ptr_out = 0;
    }
    if(!entry_stack || !key || table_reg < 0) {
        return OT_NULL;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_value(entry_stack[table_reg], key, value)) {
        return OT_NULL;
    }
    if(sq_type(value) == OT_ARRAY && array_out) {
        *array_out = _array(value);
    }
    if(sqjit_a64_type_is_object_ptr(sq_type(value)) && object_ptr_out) {
        sqjit_a64_value_to_object_ptr(value, sq_type(value), object_ptr_out);
    }
    return sq_type(value);
}

static SQObjectType sqjit_a64_observed_object_ptr_value_type(SQInteger base_ptr,
    SQObjectType base_type, const SQObjectPtr *key, SQArray **array_out = NULL,
    SQInteger *object_ptr_out = NULL)
{
    if(array_out) {
        *array_out = NULL;
    }
    if(object_ptr_out) {
        *object_ptr_out = 0;
    }
    if(!key) {
        return OT_NULL;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_ptr_value(base_ptr, base_type, key, value)) {
        return OT_NULL;
    }
    if(sq_type(value) == OT_ARRAY && array_out) {
        *array_out = _array(value);
    }
    if(sqjit_a64_type_is_object_ptr(sq_type(value)) && object_ptr_out) {
        sqjit_a64_value_to_object_ptr(value, sq_type(value), object_ptr_out);
    }
    return sq_type(value);
}

static SQObjectType sqjit_a64_observed_root_value_type(const SQObjectPtr *root,
    const SQObjectPtr *key, SQArray **array_out = NULL,
    SQInteger *object_ptr_out = NULL)
{
    if(array_out) {
        *array_out = NULL;
    }
    if(object_ptr_out) {
        *object_ptr_out = 0;
    }
    if(!root || !key || sq_type(*root) == OT_NULL) {
        return OT_NULL;
    }
    SQObjectPtr value;
    if(!sqjit_a64_get_member_value(*root, key, value)) {
        return OT_NULL;
    }
    if(sq_type(value) == OT_ARRAY && array_out) {
        *array_out = _array(value);
    }
    if(sqjit_a64_type_is_object_ptr(sq_type(value)) && object_ptr_out) {
        sqjit_a64_value_to_object_ptr(value, sq_type(value), object_ptr_out);
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
    SQClosure *closure, SQJitNative *native)
{
    if(!proto || !entry_stack || proto->_nparameters < 1 || proto->_varparams ||
        proto->_ndefaultparams != 0 || proto->_stacksize <= 0 ||
        proto->_stacksize > MAX_FUNC_STACKSIZE || proto->_ninstructions <= 0 ||
        proto->_ninstructions > 512 || proto->_bgenerator) {
        return false;
    }

    bool has_backward_branch = false;
    bool in_backward_loop[513];
    bool branch_target[513];
    for(SQInteger ip = 0; ip < 513; ip++) {
        in_backward_loop[ip] = false;
        branch_target[ip] = false;
    }
    for(SQInteger ip = 0; ip < proto->_ninstructions; ip++) {
        const SQInstruction &inst = proto->_instructions[ip];
        if(inst.op == _OP_JMP || inst.op == _OP_JZ || inst.op == _OP_JCMP) {
            SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
            if(target_ip >= 0 && target_ip < 513) {
                branch_target[target_ip] = true;
            }
            if(target_ip <= ip) {
                has_backward_branch = true;
                if(target_ip < 0) {
                    target_ip = 0;
                }
                for(SQInteger loop_ip = target_ip; loop_ip <= ip &&
                    loop_ip < 513; loop_ip++) {
                    in_backward_loop[loop_ip] = true;
                }
            }
        }
    }

    const SQObjectPtr *root_object = NULL;
    if(closure && closure->_root && sq_type(closure->_root->_obj) != OT_NULL) {
        root_object = (const SQObjectPtr *)&closure->_root->_obj;
    }

    SQInteger ip_to_offset[513];
    SQJitA64Reloc relocs[512];
    SQJitA64Reloc guard_relocs[MAX_FUNC_STACKSIZE + 512];
    SQInteger nrelocs = 0;
    SQInteger nguard_relocs = 0;
    SQJitA64SlotKind slot_kind[MAX_FUNC_STACKSIZE];
    SQInteger stack_object_reg[MAX_FUNC_STACKSIZE];
    SQArray *array_ptr_observed[MAX_FUNC_STACKSIZE];
    bool array_ptr_fresh[MAX_FUNC_STACKSIZE];
    SQInteger object_ptr_observed[MAX_FUNC_STACKSIZE];
    SQObjectType object_ptr_observed_type[MAX_FUNC_STACKSIZE];
    bool object_ptr_fresh_table[MAX_FUNC_STACKSIZE];
    SQClass *constructed_array_field_class[MAX_FUNC_STACKSIZE];
    SQInteger constructed_array_field_index[MAX_FUNC_STACKSIZE];
    SQInteger prepared_array_len_base[MAX_FUNC_STACKSIZE];
    SQInteger prepared_array_append_base[MAX_FUNC_STACKSIZE];
    SQClosure *prepared_direct_closure[MAX_FUNC_STACKSIZE];
    SQClass *prepared_class[MAX_FUNC_STACKSIZE];
    SQJitA64MathIntrinsic prepared_math_intrinsic[MAX_FUNC_STACKSIZE];
    SQInteger prepared_math_nargs[MAX_FUNC_STACKSIZE];
    bool known_const[MAX_FUNC_STACKSIZE];
    SQInteger const_value[MAX_FUNC_STACKSIZE];
    SQClass *return_shape_class = NULL;
    SQInteger return_shape_field_index = -1;
    bool return_shape_seen = false;
    bool return_shape_conflict = false;

    for(SQInteger n = 0; n < 513; n++) {
        ip_to_offset[n] = -1;
    }
    for(SQInteger n = 0; n < MAX_FUNC_STACKSIZE; n++) {
        slot_kind[n] = SQ_JIT_A64_SLOT_UNKNOWN;
        stack_object_reg[n] = -1;
        array_ptr_observed[n] = NULL;
        array_ptr_fresh[n] = false;
        object_ptr_observed[n] = 0;
        object_ptr_observed_type[n] = OT_NULL;
        object_ptr_fresh_table[n] = false;
        constructed_array_field_class[n] = NULL;
        constructed_array_field_index[n] = -1;
        prepared_array_len_base[n] = -1;
        prepared_array_append_base[n] = -1;
        prepared_direct_closure[n] = NULL;
        prepared_class[n] = NULL;
        prepared_math_intrinsic[n] = SQ_JIT_A64_MATH_NONE;
        prepared_math_nargs[n] = 0;
        known_const[n] = false;
        const_value[n] = 0;
    }
    for(SQInteger n = 0; n < proto->_nparameters; n++) {
        slot_kind[n] = SQ_JIT_A64_SLOT_STACK_OBJECT;
        stack_object_reg[n] = n;
    }

    bool uses_write_log = false;
    for(SQInteger ip = 0; ip < proto->_ninstructions; ip++) {
        if(proto->_instructions[ip].op == _OP_SET) {
            uses_write_log = true;
            break;
        }
    }
    SQInteger write_log_slot = MAX_FUNC_STACKSIZE;
    SQInteger local_slots = MAX_FUNC_STACKSIZE + (uses_write_log ? 1 : 0);

    auto clear_prepared_call_slot = [&](SQInteger slot) -> void {
        if(slot >= 0 && slot < MAX_FUNC_STACKSIZE) {
            prepared_array_len_base[slot] = -1;
            prepared_array_append_base[slot] = -1;
            prepared_direct_closure[slot] = NULL;
            prepared_class[slot] = NULL;
            prepared_math_intrinsic[slot] = SQ_JIT_A64_MATH_NONE;
            prepared_math_nargs[slot] = 0;
        }
    };

    auto clear_constructed_array_field_slot = [&](SQInteger slot) -> void {
        if(slot >= 0 && slot < MAX_FUNC_STACKSIZE) {
            constructed_array_field_class[slot] = NULL;
            constructed_array_field_index[slot] = -1;
        }
    };

    auto mark_unknown_slot = [&](SQInteger slot) -> bool {
        if(slot == 0xFF) {
            return true;
        }
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_A64_SLOT_UNKNOWN;
        stack_object_reg[slot] = -1;
        array_ptr_observed[slot] = NULL;
        array_ptr_fresh[slot] = false;
        object_ptr_observed[slot] = 0;
        object_ptr_observed_type[slot] = OT_NULL;
        object_ptr_fresh_table[slot] = false;
        clear_constructed_array_field_slot(slot);
        clear_prepared_call_slot(slot);
        known_const[slot] = false;
        return true;
    };

    auto mark_stack_object_slot = [&](SQInteger slot, SQInteger stack_reg) -> bool {
        if(slot == 0xFF) {
            return true;
        }
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE ||
            stack_reg < 0 || stack_reg >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_A64_SLOT_STACK_OBJECT;
        stack_object_reg[slot] = stack_reg;
        array_ptr_observed[slot] = NULL;
        array_ptr_fresh[slot] = false;
        object_ptr_observed[slot] = 0;
        object_ptr_observed_type[slot] = OT_NULL;
        object_ptr_fresh_table[slot] = false;
        clear_constructed_array_field_slot(slot);
        clear_prepared_call_slot(slot);
        known_const[slot] = false;
        return true;
    };

    SQInteger frame_size = local_slots * (SQInteger)sizeof(SQInteger);
    frame_size = (frame_size + 15) & ~(SQInteger)15;
    if(frame_size <= 0 || frame_size > 4095) {
        return false;
    }

    SQJitA64Buffer buf;
    buf.size = 0;
    if(!sqjit_a64_emit_prologue(&buf, frame_size)) {
        return false;
    }
    if(uses_write_log &&
        (!sqjit_a64_emit_mov_imm_x(&buf, 9, 0) ||
        !sqjit_a64_emit_str_x(&buf, 9, 31,
        sqjit_a64_local_disp(write_log_slot)))) {
        return false;
    }

    auto emit_write_log_release = [&](bool rollback) -> bool {
        if(!uses_write_log) {
            return true;
        }
        return sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)(rollback ?
                (const void *)sqjit_a64_helper_write_log_rollback :
                (const void *)sqjit_a64_helper_write_log_commit)) &&
            sqjit_a64_emit_blr_x16(&buf);
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
        if(!sqjit_a64_emit_type_guard(&buf, stack_object_reg[slot],
            OT_INTEGER, guard_relocs, &nguard_relocs) ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 19, sqjit_a64_stack_value_disp(stack_object_reg[slot])) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(slot))) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_A64_SLOT_INT;
        stack_object_reg[slot] = -1;
        array_ptr_observed[slot] = NULL;
        array_ptr_fresh[slot] = false;
        object_ptr_observed[slot] = 0;
        object_ptr_observed_type[slot] = OT_NULL;
        object_ptr_fresh_table[slot] = false;
        clear_constructed_array_field_slot(slot);
        clear_prepared_call_slot(slot);
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
        if(!sqjit_a64_emit_type_guard(&buf, stack_object_reg[slot],
            OT_FLOAT, guard_relocs, &nguard_relocs) ||
            !sqjit_a64_emit_ldr_s(&buf, 0, 19, sqjit_a64_stack_value_disp(stack_object_reg[slot])) ||
            !sqjit_a64_emit_str_s(&buf, 0, 31, sqjit_a64_local_disp(slot))) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_A64_SLOT_FLOAT;
        stack_object_reg[slot] = -1;
        array_ptr_observed[slot] = NULL;
        array_ptr_fresh[slot] = false;
        object_ptr_observed[slot] = 0;
        object_ptr_observed_type[slot] = OT_NULL;
        object_ptr_fresh_table[slot] = false;
        clear_constructed_array_field_slot(slot);
        clear_prepared_call_slot(slot);
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
        array_ptr_observed[slot] = NULL;
        array_ptr_fresh[slot] = false;
        object_ptr_observed[slot] = 0;
        object_ptr_observed_type[slot] = OT_NULL;
        object_ptr_fresh_table[slot] = false;
        clear_constructed_array_field_slot(slot);
        clear_prepared_call_slot(slot);
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
        array_ptr_observed[slot] = NULL;
        array_ptr_fresh[slot] = false;
        object_ptr_observed[slot] = 0;
        object_ptr_observed_type[slot] = OT_NULL;
        object_ptr_fresh_table[slot] = false;
        clear_constructed_array_field_slot(slot);
        clear_prepared_call_slot(slot);
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
        array_ptr_observed[slot] = NULL;
        array_ptr_fresh[slot] = false;
        object_ptr_observed[slot] = 0;
        object_ptr_observed_type[slot] = OT_NULL;
        object_ptr_fresh_table[slot] = false;
        clear_constructed_array_field_slot(slot);
        clear_prepared_call_slot(slot);
        known_const[slot] = false;
        return true;
    };

    auto mark_array_ptr_slot = [&](SQInteger slot, SQArray *observed_array) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_A64_SLOT_ARRAY_PTR;
        stack_object_reg[slot] = -1;
        array_ptr_observed[slot] = observed_array;
        array_ptr_fresh[slot] = false;
        object_ptr_observed[slot] = 0;
        object_ptr_observed_type[slot] = OT_NULL;
        object_ptr_fresh_table[slot] = false;
        clear_constructed_array_field_slot(slot);
        clear_prepared_call_slot(slot);
        known_const[slot] = false;
        return true;
    };

    auto mark_object_ptr_slot = [&](SQInteger slot, SQObjectType observed_type,
        SQInteger observed_ptr) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE ||
            !sqjit_a64_type_is_object_ptr(observed_type)) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_A64_SLOT_OBJECT_PTR;
        stack_object_reg[slot] = -1;
        array_ptr_observed[slot] = NULL;
        array_ptr_fresh[slot] = false;
        object_ptr_observed[slot] = observed_ptr;
        object_ptr_observed_type[slot] = observed_type;
        object_ptr_fresh_table[slot] = false;
        clear_constructed_array_field_slot(slot);
        clear_prepared_call_slot(slot);
        known_const[slot] = false;
        return true;
    };

    auto mark_constructed_array_field_slot = [&](SQInteger slot,
        SQInteger stack_reg, SQClass *klass, SQInteger field_index) -> bool {
        if(!klass || field_index < 0 ||
            !mark_stack_object_slot(slot, stack_reg)) {
            return false;
        }
        constructed_array_field_class[slot] = klass;
        constructed_array_field_index[slot] = field_index;
        return true;
    };

    auto record_return_shape = [&](SQInteger slot) -> void {
        return_shape_seen = true;
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE ||
            !constructed_array_field_class[slot]) {
            return_shape_conflict = true;
            return;
        }
        if(!return_shape_class) {
            return_shape_class = constructed_array_field_class[slot];
            return_shape_field_index = constructed_array_field_index[slot];
            return;
        }
        if(return_shape_class != constructed_array_field_class[slot] ||
            return_shape_field_index != constructed_array_field_index[slot]) {
            return_shape_conflict = true;
        }
    };

    auto record_unknown_return_shape = [&]() -> void {
        return_shape_seen = true;
        return_shape_conflict = true;
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

    auto load_literal_value_slot = [&](SQInteger dst, const SQObjectPtr &literal) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(sq_type(literal) == OT_INTEGER) {
            return emit_load_int(dst, _integer(literal));
        }
        if(sq_type(literal) == OT_FLOAT) {
            return emit_load_float(dst, _float(literal));
        }
        if(sq_type(literal) == OT_ARRAY) {
            return sqjit_a64_emit_mov_imm_x(&buf, 9,
                (SQInteger)(intptr_t)_array(literal)) &&
                sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) &&
                mark_array_ptr_slot(dst, _array(literal));
        }
        if(sqjit_a64_type_is_object_ptr(sq_type(literal))) {
            SQInteger object_ptr = 0;
            return sqjit_a64_value_to_object_ptr(literal, sq_type(literal),
                &object_ptr) &&
                sqjit_a64_emit_mov_imm_x(&buf, 9, object_ptr) &&
                sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) &&
                mark_object_ptr_slot(dst, sq_type(literal), object_ptr);
        }
        return false;
    };

    auto copy_int_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == 0xFF) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            src < 0 || src >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        bool src_bool = slot_kind[src] == SQ_JIT_A64_SLOT_BOOL;
        if(!ensure_int_slot(src) ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(src)) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst))) {
            return false;
        }
        if(src_bool) {
            if(!mark_bool_slot(dst)) {
                return false;
            }
        }
        else if(!mark_int_slot(dst)) {
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
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            src < 0 || src >= MAX_FUNC_STACKSIZE ||
            !ensure_float_slot(src) ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(src)) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) ||
            !mark_float_slot(dst)) {
            return false;
        }
        return true;
    };

    auto copy_array_ptr_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == 0xFF) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            src < 0 || src >= MAX_FUNC_STACKSIZE ||
            slot_kind[src] != SQ_JIT_A64_SLOT_ARRAY_PTR ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(src)) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) ||
            !mark_array_ptr_slot(dst, array_ptr_observed[src])) {
            return false;
        }
        array_ptr_fresh[dst] = array_ptr_fresh[src];
        return true;
    };

    auto copy_object_ptr_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == 0xFF) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            src < 0 || src >= MAX_FUNC_STACKSIZE ||
            slot_kind[src] != SQ_JIT_A64_SLOT_OBJECT_PTR ||
            object_ptr_observed_type[src] == OT_NULL ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(src)) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) ||
            !mark_object_ptr_slot(dst, object_ptr_observed_type[src],
            object_ptr_observed[src])) {
            return false;
        }
        object_ptr_fresh_table[dst] = object_ptr_fresh_table[src];
        return true;
    };

    auto copy_stack_object_alias = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == 0xFF) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            src < 0 || src >= MAX_FUNC_STACKSIZE ||
            slot_kind[src] != SQ_JIT_A64_SLOT_STACK_OBJECT ||
            stack_object_reg[src] < 0) {
            return false;
        }
        slot_kind[dst] = SQ_JIT_A64_SLOT_STACK_OBJECT;
        stack_object_reg[dst] = stack_object_reg[src];
        array_ptr_observed[dst] = NULL;
        array_ptr_fresh[dst] = false;
        object_ptr_observed[dst] = 0;
        object_ptr_observed_type[dst] = OT_NULL;
        object_ptr_fresh_table[dst] = false;
        constructed_array_field_class[dst] = constructed_array_field_class[src];
        constructed_array_field_index[dst] = constructed_array_field_index[src];
        clear_prepared_call_slot(dst);
        known_const[dst] = false;
        return true;
    };

    auto copy_any_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(src < 0 || src >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slot_kind[src] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            return copy_array_ptr_slot(dst, src);
        }
        if(slot_kind[src] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            return copy_object_ptr_slot(dst, src);
        }
        if(slot_kind[src] == SQ_JIT_A64_SLOT_FLOAT) {
            return copy_float_slot(dst, src);
        }
        if(slot_kind[src] == SQ_JIT_A64_SLOT_INT ||
            slot_kind[src] == SQ_JIT_A64_SLOT_BOOL) {
            return copy_int_slot(dst, src);
        }
        if(slot_kind[src] == SQ_JIT_A64_SLOT_STACK_OBJECT) {
            SQInteger reg = stack_object_reg[src];
            if(reg < 0) {
                return false;
            }
            if(entry_stack && sq_type(entry_stack[reg]) == OT_INTEGER) {
                return copy_int_slot(dst, src);
            }
            if(entry_stack && sq_type(entry_stack[reg]) == OT_FLOAT) {
                return copy_float_slot(dst, src);
            }
            return copy_stack_object_alias(dst, src);
        }
        return false;
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

    auto slot_observed_is_float = [&](SQInteger slot) -> bool {
        return slot >= 0 && slot < MAX_FUNC_STACKSIZE &&
            (slot_kind[slot] == SQ_JIT_A64_SLOT_FLOAT ||
            (slot_kind[slot] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[slot] >= 0 &&
            sq_type(entry_stack[stack_object_reg[slot]]) == OT_FLOAT));
    };

    auto emit_load_slot_as_float = [&](SQInteger slot, unsigned fp_reg,
        unsigned int_reg) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slot_kind[slot] == SQ_JIT_A64_SLOT_FLOAT) {
            return ensure_float_slot(slot) &&
                sqjit_a64_emit_ldr_s(&buf, fp_reg, 31,
                    sqjit_a64_local_disp(slot));
        }
        if(slot_kind[slot] == SQ_JIT_A64_SLOT_INT ||
            slot_kind[slot] == SQ_JIT_A64_SLOT_BOOL) {
            return ensure_int_slot(slot) &&
                sqjit_a64_emit_ldr_x(&buf, int_reg, 31,
                    sqjit_a64_local_disp(slot)) &&
                sqjit_a64_emit_scvtf_s_x(&buf, fp_reg, int_reg);
        }
        if(slot_kind[slot] != SQ_JIT_A64_SLOT_STACK_OBJECT ||
            stack_object_reg[slot] < 0 || !entry_stack) {
            return false;
        }

        SQInteger stack_reg = stack_object_reg[slot];
        SQObjectType observed = sq_type(entry_stack[stack_reg]);
        if(observed != OT_FLOAT && observed != OT_INTEGER) {
            return false;
        }
        if(observed == OT_FLOAT) {
            return sqjit_a64_emit_type_guard(&buf, stack_reg, OT_FLOAT,
                    guard_relocs, &nguard_relocs) &&
                sqjit_a64_emit_ldr_s(&buf, fp_reg, 19,
                    sqjit_a64_stack_value_disp(stack_reg));
        }
        return sqjit_a64_emit_type_guard(&buf, stack_reg, OT_INTEGER,
                guard_relocs, &nguard_relocs) &&
            sqjit_a64_emit_ldr_x(&buf, int_reg, 19,
                sqjit_a64_stack_value_disp(stack_reg)) &&
            sqjit_a64_emit_scvtf_s_x(&buf, fp_reg, int_reg);
    };

    auto emit_float_binary = [&](SQOpcode op, SQInteger dst, SQInteger left,
        SQInteger right) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || op == _OP_MOD ||
            !emit_load_slot_as_float(left, 0, 9) ||
            !emit_load_slot_as_float(right, 1, 10) ||
            !sqjit_a64_emit_fop_s(&buf, op, 0, 0, 1) ||
            !sqjit_a64_emit_str_s(&buf, 0, 31, sqjit_a64_local_disp(dst)) ||
            !mark_float_slot(dst)) {
            return false;
        }
        return true;
    };

    auto emit_integer_neg = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || !ensure_int_slot(src) ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(src)) ||
            !sqjit_a64_emit_sub_reg(&buf, 9, 31, 9) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) ||
            !mark_int_slot(dst)) {
            return false;
        }
        return true;
    };

    auto emit_float_neg = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || !ensure_float_slot(src) ||
            !sqjit_a64_emit_ldr_s(&buf, 0, 31, sqjit_a64_local_disp(src)) ||
            !sqjit_a64_emit_fneg_s(&buf, 0, 0) ||
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

    auto emit_guard_fail_branch = [&](unsigned cond) -> bool {
        SQInteger patch_offset = 0;
        return sqjit_a64_emit_bcond_placeholder(&buf, cond, &patch_offset) &&
            sqjit_a64_record_reloc(guard_relocs, &nguard_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1, true, cond);
    };

    auto emit_load_nulls = [&](SQInteger start, SQInteger count) -> bool {
        if(start < 0 || count < 0 || start + count > MAX_FUNC_STACKSIZE ||
            !sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 1, start) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 2, count) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16,
            (SQInteger)(intptr_t)sqjit_a64_helper_load_nulls) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        for(SQInteger n = 0; n < count; n++) {
            if(!mark_stack_object_slot(start + n, start + n)) {
                return false;
            }
        }
        return true;
    };

    auto emit_instance_field_get_direct = [&](SQInteger dst, SQInteger base,
        const SQObjectPtr *key, SQObjectType observed) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            !key || (slot_kind[base] != SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slot_kind[base] != SQ_JIT_A64_SLOT_OBJECT_PTR)) {
            return false;
        }
        if(observed != OT_FLOAT && observed != OT_INTEGER && observed != OT_BOOL &&
            observed != OT_ARRAY && !sqjit_a64_type_is_object_ptr(observed)) {
            return false;
        }
        if(observed == OT_FLOAT && sizeof(SQFloat) != sizeof(SQInt32)) {
            return false;
        }

        SQJitA64InstanceFieldObservation field;
        bool have_field = false;
        if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT) {
            have_field = stack_object_reg[base] >= 0 &&
                sqjit_a64_observed_stack_instance_field(entry_stack,
                    stack_object_reg[base], key, &field);
        }
        else {
            have_field = sqjit_a64_observed_object_ptr_instance_field(
                object_ptr_observed[base], object_ptr_observed_type[base],
                key, &field);
        }
        if(!have_field || field.value_type != observed) {
            return false;
        }

        if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT) {
            if(!sqjit_a64_emit_type_guard(&buf, stack_object_reg[base], OT_INSTANCE,
                guard_relocs, &nguard_relocs) ||
                !sqjit_a64_emit_ldr_x(&buf, 11, 19,
                sqjit_a64_stack_value_disp(stack_object_reg[base]))) {
                return false;
            }
        }
        else if(!sqjit_a64_emit_ldr_x(&buf, 11, 31,
            sqjit_a64_local_disp(base))) {
            return false;
        }

        SQInteger type_disp = field.value_disp + (SQInteger)offsetof(SQObject, _type);
        SQInteger value_disp = field.value_disp + (SQInteger)offsetof(SQObject, _unVal);
        if(!sqjit_a64_emit_ldr_x(&buf, 10, 11, field.class_disp) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 12,
            (SQInteger)(intptr_t)field.klass) ||
            !sqjit_a64_emit_cmp_reg(&buf, 10, 12) ||
            !emit_guard_fail_branch(SQ_JIT_A64_NE) ||
            !sqjit_a64_emit_ldr_w(&buf, 9, 11, type_disp) ||
            !sqjit_a64_emit_mov_imm_w(&buf, 10, (uint32_t)observed) ||
            !sqjit_a64_emit_cmp_reg(&buf, 9, 10) ||
            !emit_guard_fail_branch(SQ_JIT_A64_NE)) {
            return false;
        }

        if(observed == OT_FLOAT) {
            return sqjit_a64_emit_ldr_s(&buf, 0, 11, value_disp) &&
                sqjit_a64_emit_str_s(&buf, 0, 31, sqjit_a64_local_disp(dst)) &&
                mark_float_slot(dst);
        }
        if(!sqjit_a64_emit_ldr_x(&buf, 9, 11, value_disp) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst))) {
            return false;
        }
        if(observed == OT_ARRAY) {
            return mark_array_ptr_slot(dst, field.array_value);
        }
        if(sqjit_a64_type_is_object_ptr(observed)) {
            return mark_object_ptr_slot(dst, observed, field.object_ptr_value);
        }
        return observed == OT_BOOL ? mark_bool_slot(dst) : mark_int_slot(dst);
    };

    auto emit_constructed_array_field_get = [&](SQInteger dst, SQInteger base,
        const SQObjectPtr *key) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 ||
            base >= MAX_FUNC_STACKSIZE || !key ||
            slot_kind[base] != SQ_JIT_A64_SLOT_STACK_OBJECT ||
            stack_object_reg[base] < 0 ||
            !constructed_array_field_class[base]) {
            return false;
        }

        SQClass *klass = constructed_array_field_class[base];
        SQJitA64InstanceFieldObservation field;
        bool have_field = false;
        if(entry_stack) {
            SQInteger param_limit = proto->_nparameters < MAX_FUNC_STACKSIZE ?
                proto->_nparameters : MAX_FUNC_STACKSIZE;
            for(SQInteger n = 0; n < param_limit && !have_field; n++) {
                if(sq_type(entry_stack[n]) == OT_INSTANCE &&
                    _instance(entry_stack[n])->_class == klass) {
                    have_field = sqjit_a64_observed_instance_field(
                        _instance(entry_stack[n]), key, &field);
                }
            }
        }
        if(!have_field) {
            SQInteger field_index = -1;
            if(!sqjit_a64_class_field_index(klass, key, &field_index) ||
                field_index != constructed_array_field_index[base]) {
                return false;
            }
            field.klass = klass;
            field.field_index = field_index;
            field.class_disp = sqjit_a64_instance_class_disp();
            field.value_disp = sqjit_a64_instance_value_disp(field_index);
            field.value_type = OT_ARRAY;
            field.array_value = NULL;
            field.object_ptr_value = 0;
        }
        if(field.field_index != constructed_array_field_index[base] ||
            field.value_type != OT_ARRAY) {
            return false;
        }

        SQInteger type_disp = field.value_disp + (SQInteger)offsetof(SQObject, _type);
        SQInteger value_disp = field.value_disp + (SQInteger)offsetof(SQObject, _unVal);

        if(!sqjit_a64_emit_type_guard(&buf, stack_object_reg[base], OT_INSTANCE,
            guard_relocs, &nguard_relocs) ||
            !sqjit_a64_emit_ldr_x(&buf, 11, 19,
            sqjit_a64_stack_value_disp(stack_object_reg[base])) ||
            !sqjit_a64_emit_ldr_x(&buf, 10, 11, field.class_disp) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 12,
            (SQInteger)(intptr_t)klass) ||
            !sqjit_a64_emit_cmp_reg(&buf, 10, 12) ||
            !emit_guard_fail_branch(SQ_JIT_A64_NE) ||
            !sqjit_a64_emit_ldr_w(&buf, 9, 11, type_disp) ||
            !sqjit_a64_emit_mov_imm_w(&buf, 10, (uint32_t)OT_ARRAY) ||
            !sqjit_a64_emit_cmp_reg(&buf, 9, 10) ||
            !emit_guard_fail_branch(SQ_JIT_A64_NE) ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 11, value_disp) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) ||
            !mark_array_ptr_slot(dst, NULL)) {
            return false;
        }
        array_ptr_fresh[dst] = true;
        return true;
    };

    auto emit_outer_get = [&](SQInteger dst, SQInteger outer_index) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || outer_index < 0 ||
            outer_index >= proto->_noutervalues) {
            return false;
        }

        SQArray *observed_array = NULL;
        SQInteger observed_object_ptr = 0;
        SQObjectType observed = sqjit_a64_observed_outer_value_type(closure,
            outer_index, &observed_array, &observed_object_ptr);
        const void *helper = NULL;
        if(observed == OT_INTEGER) {
            helper = (const void *)sqjit_a64_helper_outer_get_integer;
            if(!sqjit_a64_emit_mov_reg(&buf, 0, 21) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1, outer_index) ||
                !sqjit_a64_emit_add_imm(&buf, 2, 31,
                    sqjit_a64_local_disp(dst))) {
                return false;
            }
        }
        else if(observed == OT_FLOAT) {
            helper = (const void *)sqjit_a64_helper_outer_get_float;
            if(!sqjit_a64_emit_mov_reg(&buf, 0, 21) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1, outer_index) ||
                !sqjit_a64_emit_add_imm(&buf, 2, 31,
                    sqjit_a64_local_disp(dst))) {
                return false;
            }
        }
        else if(observed == OT_ARRAY && observed_array) {
            helper = (const void *)sqjit_a64_helper_outer_get_array_ptr;
            if(!sqjit_a64_emit_mov_reg(&buf, 0, 21) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1, outer_index) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2,
                    (SQInteger)(intptr_t)observed_array) ||
                !sqjit_a64_emit_add_imm(&buf, 3, 31,
                    sqjit_a64_local_disp(dst))) {
                return false;
            }
        }
        else if(sqjit_a64_type_is_object_ptr(observed) && observed_object_ptr) {
            helper = (const void *)sqjit_a64_helper_outer_get_object_ptr;
            if(!sqjit_a64_emit_mov_reg(&buf, 0, 21) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1, outer_index) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, (SQInteger)observed) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 3, observed_object_ptr) ||
                !sqjit_a64_emit_add_imm(&buf, 4, 31,
                    sqjit_a64_local_disp(dst))) {
                return false;
            }
        }
        else {
            return false;
        }

        if(!sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)helper) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        if(observed == OT_FLOAT) {
            return mark_float_slot(dst);
        }
        if(observed == OT_ARRAY) {
            return mark_array_ptr_slot(dst, observed_array);
        }
        if(sqjit_a64_type_is_object_ptr(observed)) {
            return mark_object_ptr_slot(dst, observed, observed_object_ptr);
        }
        return mark_int_slot(dst);
    };

    auto emit_new_array = [&](SQInteger dst, SQInteger reserve) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || reserve < 0) {
            return false;
        }
        if(!sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
            !sqjit_a64_emit_mov_reg(&buf, 1, 21) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 2, dst) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 3, reserve) ||
            !sqjit_a64_emit_add_imm(&buf, 4, 31, sqjit_a64_local_disp(dst)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_new_array) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero() ||
            !mark_array_ptr_slot(dst, NULL)) {
            return false;
        }
        array_ptr_fresh[dst] = true;
        return true;
    };

    auto emit_new_table = [&](SQInteger dst, SQInteger reserve) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || reserve < 0) {
            return false;
        }
        if(!sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
            !sqjit_a64_emit_mov_reg(&buf, 1, 21) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 2, dst) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 3, reserve) ||
            !sqjit_a64_emit_add_imm(&buf, 4, 31, sqjit_a64_local_disp(dst)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_new_table) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero() ||
            !mark_object_ptr_slot(dst, OT_TABLE, 0)) {
            return false;
        }
        object_ptr_fresh_table[dst] = true;
        return true;
    };

    auto emit_materialize_slot_to_stack = [&](SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slot_kind[slot] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[slot] >= 0) {
            return true;
        }

        const void *helper = NULL;
        if(slot_kind[slot] == SQ_JIT_A64_SLOT_FLOAT) {
            if(!ensure_float_slot(slot)) {
                return false;
            }
            helper = (const void *)sqjit_a64_helper_store_stack_float;
            if(!sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1, slot) ||
                !sqjit_a64_emit_add_imm(&buf, 2, 31,
                    sqjit_a64_local_disp(slot)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)helper) ||
                !sqjit_a64_emit_blr_x16(&buf)) {
                return false;
            }
            return true;
        }
        if(slot_kind[slot] == SQ_JIT_A64_SLOT_INT ||
            slot_kind[slot] == SQ_JIT_A64_SLOT_BOOL) {
            if(!ensure_int_slot(slot)) {
                return false;
            }
            helper = slot_kind[slot] == SQ_JIT_A64_SLOT_BOOL ?
                (const void *)sqjit_a64_helper_store_stack_bool :
                (const void *)sqjit_a64_helper_store_stack_integer;
            if(!sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1, slot) ||
                !sqjit_a64_emit_ldr_x(&buf, 2, 31,
                    sqjit_a64_local_disp(slot)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)helper) ||
                !sqjit_a64_emit_blr_x16(&buf)) {
                return false;
            }
            return true;
        }
        if(slot_kind[slot] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            return sqjit_a64_emit_mov_reg(&buf, 0, 19) &&
                sqjit_a64_emit_mov_imm_x(&buf, 1, slot) &&
                sqjit_a64_emit_ldr_x(&buf, 2, 31, sqjit_a64_local_disp(slot)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_store_stack_array_ptr) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero();
        }
        if(slot_kind[slot] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            if(object_ptr_observed_type[slot] == OT_NULL) {
                return false;
            }
            return sqjit_a64_emit_mov_reg(&buf, 0, 19) &&
                sqjit_a64_emit_mov_imm_x(&buf, 1, slot) &&
                sqjit_a64_emit_ldr_x(&buf, 2, 31, sqjit_a64_local_disp(slot)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 3,
                    (SQInteger)object_ptr_observed_type[slot]) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_store_stack_object_ptr) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero();
        }
        return false;
    };

    auto emit_materialize_call_slot_to_stack = [&](SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slot_kind[slot] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[slot] >= 0 &&
            stack_object_reg[slot] != slot) {
            if(!sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1, slot) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, stack_object_reg[slot]) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_copy_stack_object) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            stack_object_reg[slot] = slot;
            return true;
        }
        return emit_materialize_slot_to_stack(slot);
    };

    auto stack_reg_for_materialized_slot = [&](SQInteger slot) -> SQInteger {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return -1;
        }
        if(slot_kind[slot] == SQ_JIT_A64_SLOT_STACK_OBJECT) {
            return stack_object_reg[slot];
        }
        return slot;
    };

    auto emit_table_newslot = [&](SQInteger table_slot, SQInteger key_slot,
        SQInteger value_slot) -> bool {
        if(table_slot < 0 || table_slot >= MAX_FUNC_STACKSIZE ||
            key_slot < 0 || key_slot >= MAX_FUNC_STACKSIZE ||
            value_slot < 0 || value_slot >= MAX_FUNC_STACKSIZE ||
            slot_kind[table_slot] != SQ_JIT_A64_SLOT_OBJECT_PTR ||
            object_ptr_observed_type[table_slot] != OT_TABLE ||
            !object_ptr_fresh_table[table_slot]) {
            return false;
        }
        if(!emit_materialize_slot_to_stack(key_slot) ||
            !emit_materialize_slot_to_stack(value_slot)) {
            return false;
        }
        SQInteger key_reg = stack_reg_for_materialized_slot(key_slot);
        SQInteger value_reg = stack_reg_for_materialized_slot(value_slot);
        if(key_reg < 0 || value_reg < 0) {
            return false;
        }
        return sqjit_a64_emit_ldr_x(&buf, 0, 31,
                sqjit_a64_local_disp(table_slot)) &&
            sqjit_a64_emit_mov_reg(&buf, 1, 19) &&
            sqjit_a64_emit_mov_imm_x(&buf, 2, key_reg) &&
            sqjit_a64_emit_mov_imm_x(&buf, 3, value_reg) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_table_ptr_new_slot_stack) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero();
    };

    auto emit_append_array_stack = [&](SQInteger array_reg, SQInteger value_reg) -> bool {
        if(array_reg < 0 || array_reg >= MAX_FUNC_STACKSIZE ||
            value_reg < 0 || value_reg >= MAX_FUNC_STACKSIZE ||
            slot_kind[array_reg] != SQ_JIT_A64_SLOT_ARRAY_PTR) {
            return false;
        }

        if(!sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(array_reg))) {
            return false;
        }
        if(slot_kind[value_reg] == SQ_JIT_A64_SLOT_FLOAT) {
            if(!ensure_float_slot(value_reg) ||
                !sqjit_a64_emit_add_imm(&buf, 1, 31, sqjit_a64_local_disp(value_reg)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_float)) {
                return false;
            }
        }
        else if(slot_kind[value_reg] == SQ_JIT_A64_SLOT_INT) {
            if(!ensure_int_slot(value_reg) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(value_reg)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_integer)) {
                return false;
            }
        }
        else if(slot_kind[value_reg] == SQ_JIT_A64_SLOT_BOOL) {
            if(!ensure_int_slot(value_reg) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(value_reg)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_bool)) {
                return false;
            }
        }
        else if(slot_kind[value_reg] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[value_reg] >= 0) {
            if(!sqjit_a64_emit_mov_reg(&buf, 1, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, stack_object_reg[value_reg]) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_stack)) {
                return false;
            }
        }
        else if(slot_kind[value_reg] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(value_reg)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_array_ptr)) {
                return false;
            }
        }
        else if(slot_kind[value_reg] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            if(object_ptr_observed_type[value_reg] == OT_NULL ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(value_reg)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2,
                    (SQInteger)object_ptr_observed_type[value_reg]) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_object_ptr)) {
                return false;
            }
        }
        else {
            return false;
        }

        return sqjit_a64_emit_blr_x16(&buf) && emit_guard_on_x0_zero();
    };

    auto emit_append_array_integer = [&](SQInteger array_reg, SQInteger value) -> bool {
        if(array_reg < 0 || array_reg >= MAX_FUNC_STACKSIZE ||
            slot_kind[array_reg] != SQ_JIT_A64_SLOT_ARRAY_PTR) {
            return false;
        }
        return sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(array_reg)) &&
            sqjit_a64_emit_mov_imm_x(&buf, 1, value) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_integer) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero();
    };

    auto emit_append_array_bool = [&](SQInteger array_reg, SQInteger value) -> bool {
        if(array_reg < 0 || array_reg >= MAX_FUNC_STACKSIZE ||
            slot_kind[array_reg] != SQ_JIT_A64_SLOT_ARRAY_PTR) {
            return false;
        }
        return sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(array_reg)) &&
            sqjit_a64_emit_mov_imm_x(&buf, 1, value ? 1 : 0) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_bool) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero();
    };

    auto emit_append_array_float_bits = [&](SQInteger array_reg, SQInteger bits) -> bool {
        if(array_reg < 0 || array_reg >= MAX_FUNC_STACKSIZE ||
            slot_kind[array_reg] != SQ_JIT_A64_SLOT_ARRAY_PTR) {
            return false;
        }
        return sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(array_reg)) &&
            sqjit_a64_emit_mov_imm_x(&buf, 1, bits) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_float_bits) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero();
    };

    auto emit_append_array_literal = [&](SQInteger array_reg, SQInteger literal_index) -> bool {
        if(array_reg < 0 || array_reg >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals ||
            slot_kind[array_reg] != SQ_JIT_A64_SLOT_ARRAY_PTR) {
            return false;
        }
        return sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(array_reg)) &&
            sqjit_a64_emit_mov_imm_x(&buf, 1,
                (SQInteger)(intptr_t)&proto->_literals[literal_index]) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_literal) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero();
    };

    auto emit_array_len_raw = [&](SQInteger dst_local, SQInteger base) -> bool {
        if(dst_local < 0 || base < 0 || base >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            return sqjit_a64_emit_ldr_x(&buf, 11, 31,
                    sqjit_a64_local_disp(base)) &&
                sqjit_a64_emit_cmp_imm(&buf, 11, 0) &&
                emit_guard_fail_branch(SQ_JIT_A64_EQ) &&
                sqjit_a64_emit_ldr_x(&buf, 9, 11, SQArray::RawSizeOffset()) &&
                sqjit_a64_emit_str_x(&buf, 9, 31,
                    sqjit_a64_local_disp(dst_local));
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[base] >= 0) {
            return sqjit_a64_emit_type_guard(&buf, stack_object_reg[base],
                    OT_ARRAY, guard_relocs, &nguard_relocs) &&
                sqjit_a64_emit_ldr_x(&buf, 11, 19,
                    sqjit_a64_stack_value_disp(stack_object_reg[base])) &&
                sqjit_a64_emit_ldr_x(&buf, 9, 11, SQArray::RawSizeOffset()) &&
                sqjit_a64_emit_str_x(&buf, 9, 31,
                    sqjit_a64_local_disp(dst_local));
        }
        return false;
    };

    auto emit_array_len = [&](SQInteger dst, SQInteger base) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            !emit_array_len_raw(dst, base) ||
            !mark_int_slot(dst)) {
            return false;
        }
        return true;
    };

    auto emit_array_append_value_unlogged = [&](SQInteger base,
        SQInteger value_slot) -> bool {
        if(base < 0 || base >= MAX_FUNC_STACKSIZE ||
            value_slot < 0 || value_slot >= MAX_FUNC_STACKSIZE ||
            slot_kind[base] != SQ_JIT_A64_SLOT_ARRAY_PTR ||
            !array_ptr_fresh[base] ||
            !sqjit_a64_emit_ldr_x(&buf, 0, 31,
            sqjit_a64_local_disp(base))) {
            return false;
        }

        if(slot_kind[value_slot] == SQ_JIT_A64_SLOT_FLOAT) {
            if(!ensure_float_slot(value_slot) ||
                !sqjit_a64_emit_add_imm(&buf, 1, 31,
                    sqjit_a64_local_disp(value_slot)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_float)) {
                return false;
            }
        }
        else if(slot_kind[value_slot] == SQ_JIT_A64_SLOT_INT) {
            if(!ensure_int_slot(value_slot) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31,
                    sqjit_a64_local_disp(value_slot)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_integer)) {
                return false;
            }
        }
        else if(slot_kind[value_slot] == SQ_JIT_A64_SLOT_BOOL) {
            if(!ensure_int_slot(value_slot) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31,
                    sqjit_a64_local_disp(value_slot)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_bool)) {
                return false;
            }
        }
        else if(slot_kind[value_slot] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[value_slot] >= 0) {
            if(!sqjit_a64_emit_mov_reg(&buf, 1, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, stack_object_reg[value_slot]) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_stack)) {
                return false;
            }
        }
        else if(slot_kind[value_slot] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_ldr_x(&buf, 1, 31,
                    sqjit_a64_local_disp(value_slot)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_array_ptr)) {
                return false;
            }
        }
        else if(slot_kind[value_slot] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            if(object_ptr_observed_type[value_slot] == OT_NULL ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31,
                    sqjit_a64_local_disp(value_slot)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2,
                    (SQInteger)object_ptr_observed_type[value_slot]) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_object_ptr)) {
                return false;
            }
        }
        else {
            return false;
        }

        return sqjit_a64_emit_blr_x16(&buf) && emit_guard_on_x0_zero();
    };

    auto emit_return_object_slot = [&](SQInteger reg) -> bool {
        if(reg < 0 || reg >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slot_kind[reg] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            return sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(reg)) &&
                sqjit_a64_emit_mov_reg(&buf, 1, 20) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_store_out_array_ptr) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero();
        }
        if(slot_kind[reg] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            if(object_ptr_observed_type[reg] == OT_NULL) {
                return false;
            }
            return sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(reg)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 1,
                    (SQInteger)object_ptr_observed_type[reg]) &&
                sqjit_a64_emit_mov_reg(&buf, 2, 20) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_store_out_object_ptr) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero();
        }
        if(slot_kind[reg] == SQ_JIT_A64_SLOT_STACK_OBJECT && stack_object_reg[reg] >= 0) {
            return sqjit_a64_emit_mov_reg(&buf, 0, 19) &&
                sqjit_a64_emit_mov_imm_x(&buf, 1, stack_object_reg[reg]) &&
                sqjit_a64_emit_mov_reg(&buf, 2, 20) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_store_out_stack_object) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero();
        }
        return false;
    };

    auto emit_array_element_get_direct = [&](SQInteger dst, SQInteger base,
        bool const_index, SQInteger index, SQInteger key, SQObjectType observed,
        SQArray *observed_array) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 ||
            base >= MAX_FUNC_STACKSIZE ||
            (observed != OT_FLOAT && observed != OT_INTEGER &&
            observed != OT_ARRAY)) {
            return false;
        }
        if(observed == OT_FLOAT && sizeof(SQFloat) != sizeof(SQInt32)) {
            return false;
        }

        unsigned stride_shift = 0;
        SQInteger stride = (SQInteger)sizeof(SQObjectPtr);
        while(((SQInteger)1 << stride_shift) < stride && stride_shift < 63) {
            stride_shift++;
        }
        if(((SQInteger)1 << stride_shift) != stride) {
            return false;
        }

        if(slot_kind[base] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_ldr_x(&buf, 11, 31,
                sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_cmp_imm(&buf, 11, 0) ||
                !emit_guard_fail_branch(SQ_JIT_A64_EQ)) {
                return false;
            }
        }
        else if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[base] >= 0) {
            if(!sqjit_a64_emit_type_guard(&buf, stack_object_reg[base],
                OT_ARRAY, guard_relocs, &nguard_relocs) ||
                !sqjit_a64_emit_ldr_x(&buf, 11, 19,
                sqjit_a64_stack_value_disp(stack_object_reg[base]))) {
                return false;
            }
        }
        else {
            return false;
        }

        if(const_index) {
            if(index < 0 || !sqjit_a64_emit_mov_imm_x(&buf, 10, index)) {
                return false;
            }
        }
        else {
            if(key < 0 || key >= MAX_FUNC_STACKSIZE ||
                !ensure_int_slot(key) ||
                !sqjit_a64_emit_ldr_x(&buf, 10, 31,
                sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_cmp_imm(&buf, 10, 0) ||
                !emit_guard_fail_branch(SQ_JIT_A64_LT)) {
                return false;
            }
        }

        if(!sqjit_a64_emit_ldr_x(&buf, 12, 11, SQArray::RawSizeOffset()) ||
            !sqjit_a64_emit_cmp_reg(&buf, 10, 12) ||
            !emit_guard_fail_branch(SQ_JIT_A64_GE) ||
            !sqjit_a64_emit_ldr_x(&buf, 13, 11, SQArray::RawValuesOffset()) ||
            !sqjit_a64_emit_add_reg_lsl(&buf, 13, 13, 10, stride_shift) ||
            !sqjit_a64_emit_ldr_w(&buf, 14, 13,
            (SQInteger)offsetof(SQObject, _type)) ||
            !sqjit_a64_emit_mov_imm_w(&buf, 15, (uint32_t)observed) ||
            !sqjit_a64_emit_cmp_reg(&buf, 14, 15) ||
            !emit_guard_fail_branch(SQ_JIT_A64_NE)) {
            return false;
        }

        if(observed == OT_FLOAT) {
            return sqjit_a64_emit_ldr_s(&buf, 0, 13,
                    (SQInteger)offsetof(SQObject, _unVal)) &&
                sqjit_a64_emit_str_s(&buf, 0, 31,
                    sqjit_a64_local_disp(dst)) &&
                mark_float_slot(dst);
        }
        if(!sqjit_a64_emit_ldr_x(&buf, 9, 13,
            (SQInteger)offsetof(SQObject, _unVal)) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31,
            sqjit_a64_local_disp(dst))) {
            return false;
        }
        if(observed == OT_ARRAY) {
            return mark_array_ptr_slot(dst, observed_array);
        }
        return mark_int_slot(dst);
    };

    auto emit_array_get = [&](SQInteger dst, SQInteger base, SQInteger index,
        SQObjectType observed, SQArray *observed_array) -> bool {
        if(emit_array_element_get_direct(dst, base, true, index, -1, observed,
            observed_array)) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            index < 0 || slot_kind[base] != SQ_JIT_A64_SLOT_STACK_OBJECT ||
            stack_object_reg[base] < 0) {
            return false;
        }
        const void *helper = NULL;
        bool object_result = false;
        if(observed == OT_FLOAT) {
            helper = (const void *)sqjit_a64_helper_array_get_float;
        }
        else if(observed == OT_INTEGER) {
            helper = (const void *)sqjit_a64_helper_array_get_integer;
        }
        else if(observed == OT_ARRAY) {
            helper = (const void *)sqjit_a64_helper_array_get_array_ptr;
        }
        else {
            helper = (const void *)sqjit_a64_helper_array_get_object;
            object_result = true;
        }
        if(!sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 1, stack_object_reg[base]) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 2, index) ||
            !(object_result ?
                sqjit_a64_emit_mov_imm_x(&buf, 3, dst) :
                sqjit_a64_emit_add_imm(&buf, 3, 31, sqjit_a64_local_disp(dst))) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)helper) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        if(object_result) {
            return mark_stack_object_slot(dst, dst);
        }
        if(observed == OT_FLOAT) {
            return mark_float_slot(dst);
        }
        if(observed == OT_ARRAY) {
            return mark_array_ptr_slot(dst, observed_array);
        }
        return mark_int_slot(dst);
    };

    auto emit_array_get_dynamic = [&](SQInteger dst, SQInteger base, SQInteger key,
        SQObjectType observed, SQArray *observed_array) -> bool {
        if(emit_array_element_get_direct(dst, base, false, 0, key, observed,
            observed_array)) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE ||
            slot_kind[base] != SQ_JIT_A64_SLOT_STACK_OBJECT || stack_object_reg[base] < 0 ||
            !ensure_int_slot(key)) {
            return false;
        }
        const void *helper = NULL;
        bool object_result = false;
        if(observed == OT_FLOAT) {
            helper = (const void *)sqjit_a64_helper_array_get_float;
        }
        else if(observed == OT_INTEGER) {
            helper = (const void *)sqjit_a64_helper_array_get_integer;
        }
        else if(observed == OT_ARRAY) {
            helper = (const void *)sqjit_a64_helper_array_get_array_ptr;
        }
        else {
            helper = (const void *)sqjit_a64_helper_array_get_object;
            object_result = true;
        }
        if(!sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 1, stack_object_reg[base]) ||
            !sqjit_a64_emit_ldr_x(&buf, 2, 31, sqjit_a64_local_disp(key)) ||
            !(object_result ?
                sqjit_a64_emit_mov_imm_x(&buf, 3, dst) :
                sqjit_a64_emit_add_imm(&buf, 3, 31, sqjit_a64_local_disp(dst))) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)helper) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        if(object_result) {
            return mark_stack_object_slot(dst, dst);
        }
        if(observed == OT_FLOAT) {
            return mark_float_slot(dst);
        }
        if(observed == OT_ARRAY) {
            return mark_array_ptr_slot(dst, observed_array);
        }
        return mark_int_slot(dst);
    };

    auto emit_array_ptr_get = [&](SQInteger dst, SQInteger base, SQInteger index,
        SQObjectType observed, SQArray *observed_array) -> bool {
        if(emit_array_element_get_direct(dst, base, true, index, -1, observed,
            observed_array)) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            index < 0 || slot_kind[base] != SQ_JIT_A64_SLOT_ARRAY_PTR) {
            return false;
        }
        const void *helper = NULL;
        bool object_result = false;
        if(observed == OT_FLOAT) {
            helper = (const void *)sqjit_a64_helper_array_ptr_get_float_raw;
        }
        else if(observed == OT_INTEGER) {
            helper = (const void *)sqjit_a64_helper_array_ptr_get_integer_raw;
        }
        else if(observed == OT_ARRAY) {
            helper = (const void *)sqjit_a64_helper_array_ptr_get_array_ptr_raw;
        }
        else {
            helper = (const void *)sqjit_a64_helper_array_ptr_get_object_raw;
            object_result = true;
        }
        if(!sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(base)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 1, index) ||
            !(object_result ?
                sqjit_a64_emit_mov_reg(&buf, 2, 19) :
                sqjit_a64_emit_add_imm(&buf, 2, 31, sqjit_a64_local_disp(dst))) ||
            !(object_result ? sqjit_a64_emit_mov_imm_x(&buf, 3, dst) : true) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)helper) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        if(object_result) {
            return mark_stack_object_slot(dst, dst);
        }
        if(observed == OT_FLOAT) {
            return mark_float_slot(dst);
        }
        if(observed == OT_ARRAY) {
            return mark_array_ptr_slot(dst, observed_array);
        }
        return mark_int_slot(dst);
    };

    auto emit_array_ptr_get_dynamic = [&](SQInteger dst, SQInteger base, SQInteger key,
        SQObjectType observed, SQArray *observed_array) -> bool {
        if(emit_array_element_get_direct(dst, base, false, 0, key, observed,
            observed_array)) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE ||
            slot_kind[base] != SQ_JIT_A64_SLOT_ARRAY_PTR || !ensure_int_slot(key)) {
            return false;
        }
        const void *helper = NULL;
        bool object_result = false;
        if(observed == OT_FLOAT) {
            helper = (const void *)sqjit_a64_helper_array_ptr_get_float_raw;
        }
        else if(observed == OT_INTEGER) {
            helper = (const void *)sqjit_a64_helper_array_ptr_get_integer_raw;
        }
        else if(observed == OT_ARRAY) {
            helper = (const void *)sqjit_a64_helper_array_ptr_get_array_ptr_raw;
        }
        else {
            helper = (const void *)sqjit_a64_helper_array_ptr_get_object_raw;
            object_result = true;
        }
        if(!sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(base)) ||
            !sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(key)) ||
            !(object_result ?
                sqjit_a64_emit_mov_reg(&buf, 2, 19) :
                sqjit_a64_emit_add_imm(&buf, 2, 31, sqjit_a64_local_disp(dst))) ||
            !(object_result ? sqjit_a64_emit_mov_imm_x(&buf, 3, dst) : true) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)helper) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        if(object_result) {
            return mark_stack_object_slot(dst, dst);
        }
        if(observed == OT_FLOAT) {
            return mark_float_slot(dst);
        }
        if(observed == OT_ARRAY) {
            return mark_array_ptr_slot(dst, observed_array);
        }
        return mark_int_slot(dst);
    };

    auto emit_member_get_key = [&](SQInteger dst, SQInteger base, const SQObjectPtr *key,
        SQObjectType observed, SQArray *observed_array, SQInteger observed_object_ptr) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            !key || (slot_kind[base] != SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slot_kind[base] != SQ_JIT_A64_SLOT_OBJECT_PTR)) {
            return false;
        }
        bool use_root_fallback = slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[base] == 0 && root_object != NULL;
        bool direct_instance_field_ok = true;
        if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[base] > 0 &&
            stack_object_reg[base] < proto->_nparameters &&
            sq_type(entry_stack[0]) == OT_INSTANCE &&
            sq_type(entry_stack[stack_object_reg[base]]) == OT_INSTANCE &&
            _instance(entry_stack[0])->_class !=
            _instance(entry_stack[stack_object_reg[base]])->_class) {
            direct_instance_field_ok = false;
        }
        if(emit_constructed_array_field_get(dst, base, key)) {
            return true;
        }
        if(direct_instance_field_ok &&
            emit_instance_field_get_direct(dst, base, key, observed)) {
            return true;
        }
        const void *helper = NULL;
        if(observed == OT_FLOAT) {
            helper = slot_kind[base] == SQ_JIT_A64_SLOT_OBJECT_PTR ?
                (const void *)sqjit_a64_helper_object_ptr_get_float :
                (use_root_fallback ?
                (const void *)sqjit_a64_helper_table_get_float_root :
                (const void *)sqjit_a64_helper_table_get_float);
        }
        else if(observed == OT_INTEGER) {
            helper = slot_kind[base] == SQ_JIT_A64_SLOT_OBJECT_PTR ?
                (const void *)sqjit_a64_helper_object_ptr_get_integer :
                (use_root_fallback ?
                (const void *)sqjit_a64_helper_table_get_integer_root :
                (const void *)sqjit_a64_helper_table_get_integer);
        }
        else if(observed == OT_ARRAY) {
            helper = slot_kind[base] == SQ_JIT_A64_SLOT_OBJECT_PTR ?
                (const void *)sqjit_a64_helper_object_ptr_get_array_ptr :
                (use_root_fallback ?
                (const void *)sqjit_a64_helper_table_get_array_ptr_root :
                (const void *)sqjit_a64_helper_table_get_array_ptr);
        }
        else if(sqjit_a64_type_is_object_ptr(observed)) {
            helper = slot_kind[base] == SQ_JIT_A64_SLOT_OBJECT_PTR ?
                (const void *)sqjit_a64_helper_object_ptr_get_object_ptr :
                (use_root_fallback ?
                (const void *)sqjit_a64_helper_member_get_object_ptr_root :
                (const void *)sqjit_a64_helper_member_get_object_ptr);
        }
        else {
            return false;
        }

        if(slot_kind[base] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            if(object_ptr_observed_type[base] == OT_NULL ||
                !sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1,
                (SQInteger)object_ptr_observed_type[base]) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, (SQInteger)(intptr_t)key)) {
                return false;
            }
        }
        else if(stack_object_reg[base] < 0 ||
            !sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 1, stack_object_reg[base]) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 2, (SQInteger)(intptr_t)key)) {
            return false;
        }

        if(sqjit_a64_type_is_object_ptr(observed)) {
            if(use_root_fallback) {
                if(!sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)observed) ||
                    !sqjit_a64_emit_mov_imm_x(&buf, 4,
                    (SQInteger)(intptr_t)root_object) ||
                    !sqjit_a64_emit_add_imm(&buf, 5, 31,
                    sqjit_a64_local_disp(dst))) {
                    return false;
                }
            }
            else if(!sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)observed) ||
                !sqjit_a64_emit_add_imm(&buf, 4, 31, sqjit_a64_local_disp(dst))) {
                return false;
            }
        }
        else if(use_root_fallback) {
            if(!sqjit_a64_emit_mov_imm_x(&buf, 3,
                (SQInteger)(intptr_t)root_object) ||
                !sqjit_a64_emit_add_imm(&buf, 4, 31, sqjit_a64_local_disp(dst))) {
                return false;
            }
        }
        else if(!sqjit_a64_emit_add_imm(&buf, 3, 31, sqjit_a64_local_disp(dst))) {
            return false;
        }

        if(!sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)helper) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        if(observed == OT_FLOAT) {
            return mark_float_slot(dst);
        }
        if(observed == OT_ARRAY) {
            return mark_array_ptr_slot(dst, observed_array);
        }
        if(sqjit_a64_type_is_object_ptr(observed)) {
            return mark_object_ptr_slot(dst, observed, observed_object_ptr);
        }
        return mark_int_slot(dst);
    };

    auto emit_member_get_dynamic_key = [&](SQInteger dst, SQInteger base,
        SQInteger key_slot) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key_slot < 0 || key_slot >= MAX_FUNC_STACKSIZE ||
            slot_kind[key_slot] != SQ_JIT_A64_SLOT_OBJECT_PTR ||
            object_ptr_observed[key_slot] == 0 ||
            object_ptr_observed_type[key_slot] == OT_NULL ||
            (slot_kind[base] != SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slot_kind[base] != SQ_JIT_A64_SLOT_OBJECT_PTR)) {
            return false;
        }

        SQObjectPtr key;
        if(!sqjit_a64_object_ptr_to_value(object_ptr_observed[key_slot],
            object_ptr_observed_type[key_slot], key)) {
            return false;
        }

        SQArray *observed_array = NULL;
        SQInteger observed_object_ptr = 0;
        SQObjectType observed = OT_NULL;
        bool use_root_fallback = false;
        if(slot_kind[base] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            observed = sqjit_a64_observed_object_ptr_value_type(
                object_ptr_observed[base], object_ptr_observed_type[base],
                &key, &observed_array, &observed_object_ptr);
        }
        else {
            SQInteger observed_reg = stack_object_reg[base];
            observed = sqjit_a64_observed_table_value_type(entry_stack,
                observed_reg, &key, &observed_array, &observed_object_ptr);
            use_root_fallback = observed == OT_NULL && observed_reg == 0 &&
                root_object != NULL;
            if(use_root_fallback) {
                observed = sqjit_a64_observed_root_value_type(root_object,
                    &key, &observed_array, &observed_object_ptr);
            }
        }

        if(emit_constructed_array_field_get(dst, base, &key)) {
            return true;
        }
        if(emit_instance_field_get_direct(dst, base, &key, observed)) {
            return true;
        }

        const void *helper = NULL;
        if(slot_kind[base] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            helper = (const void *)sqjit_a64_helper_object_ptr_get_object_dynamic_key;
            if(object_ptr_observed_type[base] == OT_NULL ||
                !sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1,
                (SQInteger)object_ptr_observed_type[base]) ||
                !sqjit_a64_emit_ldr_x(&buf, 2, 31,
                sqjit_a64_local_disp(key_slot)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 3,
                (SQInteger)object_ptr_observed_type[key_slot]) ||
                !sqjit_a64_emit_mov_reg(&buf, 4, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 5, dst)) {
                return false;
            }
        }
        else {
            helper = use_root_fallback ?
                (const void *)sqjit_a64_helper_member_get_object_dynamic_key_root :
                (const void *)sqjit_a64_helper_member_get_object_dynamic_key;
            if(stack_object_reg[base] < 0 ||
                !sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1, stack_object_reg[base]) ||
                !sqjit_a64_emit_ldr_x(&buf, 2, 31,
                sqjit_a64_local_disp(key_slot)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 3,
                (SQInteger)object_ptr_observed_type[key_slot])) {
                return false;
            }
            if(use_root_fallback) {
                if(!sqjit_a64_emit_mov_imm_x(&buf, 4,
                    (SQInteger)(intptr_t)root_object) ||
                    !sqjit_a64_emit_mov_imm_x(&buf, 5, dst)) {
                    return false;
                }
            }
            else if(!sqjit_a64_emit_mov_imm_x(&buf, 4, dst)) {
                return false;
            }
        }

        return sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)helper) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero() &&
            mark_stack_object_slot(dst, dst);
    };

    auto emit_table_get = [&](SQInteger dst, SQInteger base, SQInteger literal_index,
        SQObjectType observed, SQArray *observed_array, SQInteger observed_object_ptr) -> bool {
        if(literal_index < 0 || literal_index >= proto->_nliterals) {
            return false;
        }
        return emit_member_get_key(dst, base, &proto->_literals[literal_index],
            observed, observed_array, observed_object_ptr);
    };

    auto emit_member_closure_guard = [&](SQInteger base_slot,
        SQInteger literal_index, SQClosure *expected) -> bool {
        if(base_slot < 0 || base_slot >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals ||
            (slot_kind[base_slot] != SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slot_kind[base_slot] != SQ_JIT_A64_SLOT_OBJECT_PTR) ||
            !expected) {
            return false;
        }
        if(slot_kind[base_slot] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            return object_ptr_observed_type[base_slot] != OT_NULL &&
                sqjit_a64_emit_ldr_x(&buf, 0, 31,
                    sqjit_a64_local_disp(base_slot)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 1,
                    (SQInteger)object_ptr_observed_type[base_slot]) &&
                sqjit_a64_emit_mov_imm_x(&buf, 2,
                    (SQInteger)(intptr_t)&proto->_literals[literal_index]) &&
                sqjit_a64_emit_mov_imm_x(&buf, 3,
                    (SQInteger)(intptr_t)expected) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)(const void *)
                    sqjit_a64_helper_object_ptr_member_closure_guard) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero();
        }
        return stack_object_reg[base_slot] >= 0 &&
            sqjit_a64_emit_mov_reg(&buf, 0, 19) &&
            sqjit_a64_emit_mov_imm_x(&buf, 1, stack_object_reg[base_slot]) &&
            sqjit_a64_emit_mov_imm_x(&buf, 2,
                (SQInteger)(intptr_t)&proto->_literals[literal_index]) &&
            sqjit_a64_emit_mov_imm_x(&buf, 3,
                (SQInteger)(intptr_t)expected) &&
            sqjit_a64_emit_mov_imm_x(&buf, 4,
                stack_object_reg[base_slot] == 0 && root_object ?
                (SQInteger)(intptr_t)root_object : 0) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)(const void *)
                sqjit_a64_helper_member_closure_guard) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero();
    };

    auto emit_member_object_ptr_guard = [&](SQInteger base_slot,
        SQInteger literal_index, SQObjectType expected_type,
        SQInteger expected_ptr) -> bool {
        if(base_slot < 0 || base_slot >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals ||
            (slot_kind[base_slot] != SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slot_kind[base_slot] != SQ_JIT_A64_SLOT_OBJECT_PTR) ||
            !sqjit_a64_type_is_object_ptr(expected_type) || !expected_ptr) {
            return false;
        }
        if(slot_kind[base_slot] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            return object_ptr_observed_type[base_slot] != OT_NULL &&
                sqjit_a64_emit_ldr_x(&buf, 0, 31,
                    sqjit_a64_local_disp(base_slot)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 1,
                    (SQInteger)object_ptr_observed_type[base_slot]) &&
                sqjit_a64_emit_mov_imm_x(&buf, 2,
                    (SQInteger)(intptr_t)&proto->_literals[literal_index]) &&
                sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)expected_type) &&
                sqjit_a64_emit_mov_imm_x(&buf, 4, expected_ptr) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)(const void *)
                    sqjit_a64_helper_object_ptr_member_object_ptr_guard) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero();
        }
        return stack_object_reg[base_slot] >= 0 &&
            sqjit_a64_emit_mov_reg(&buf, 0, 19) &&
            sqjit_a64_emit_mov_imm_x(&buf, 1, stack_object_reg[base_slot]) &&
            sqjit_a64_emit_mov_imm_x(&buf, 2,
                (SQInteger)(intptr_t)&proto->_literals[literal_index]) &&
            sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)expected_type) &&
            sqjit_a64_emit_mov_imm_x(&buf, 4, expected_ptr) &&
            sqjit_a64_emit_mov_imm_x(&buf, 5,
                stack_object_reg[base_slot] == 0 && root_object ?
                (SQInteger)(intptr_t)root_object : 0) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)(const void *)
                sqjit_a64_helper_member_object_ptr_guard) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero();
    };

    auto emit_member_exists_guard_key = [&](SQInteger base_slot,
        const SQObjectPtr *key, bool expected) -> bool {
        if(base_slot < 0 || base_slot >= MAX_FUNC_STACKSIZE || !key ||
            (slot_kind[base_slot] != SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slot_kind[base_slot] != SQ_JIT_A64_SLOT_OBJECT_PTR)) {
            return false;
        }
        if(slot_kind[base_slot] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            return object_ptr_observed_type[base_slot] != OT_NULL &&
                sqjit_a64_emit_ldr_x(&buf, 0, 31,
                    sqjit_a64_local_disp(base_slot)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 1,
                    (SQInteger)object_ptr_observed_type[base_slot]) &&
                sqjit_a64_emit_mov_imm_x(&buf, 2,
                    (SQInteger)(intptr_t)key) &&
                sqjit_a64_emit_mov_imm_x(&buf, 3, expected ? 1 : 0) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)(const void *)
                    sqjit_a64_helper_object_ptr_member_exists_guard) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero();
        }
        return stack_object_reg[base_slot] >= 0 &&
            sqjit_a64_emit_mov_reg(&buf, 0, 19) &&
            sqjit_a64_emit_mov_imm_x(&buf, 1, stack_object_reg[base_slot]) &&
            sqjit_a64_emit_mov_imm_x(&buf, 2, (SQInteger)(intptr_t)key) &&
            sqjit_a64_emit_mov_imm_x(&buf, 3, expected ? 1 : 0) &&
            sqjit_a64_emit_mov_imm_x(&buf, 4,
                stack_object_reg[base_slot] == 0 && root_object ?
                (SQInteger)(intptr_t)root_object : 0) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)(const void *)
                sqjit_a64_helper_member_exists_guard) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero();
    };

    auto observed_member_closure = [&](SQInteger base_slot,
        SQInteger literal_index, SQClosure **out) -> bool {
        if(!out) {
            return false;
        }
        *out = NULL;
        if(base_slot < 0 || base_slot >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals) {
            return false;
        }

        SQObjectPtr value;
        bool ok = false;
        if(slot_kind[base_slot] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            ok = sqjit_a64_get_member_ptr_value(object_ptr_observed[base_slot],
                object_ptr_observed_type[base_slot],
                &proto->_literals[literal_index], value);
        }
        else if(slot_kind[base_slot] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[base_slot] >= 0) {
            ok = sqjit_a64_get_member_value_with_root(entry_stack,
                stack_object_reg[base_slot], &proto->_literals[literal_index],
                stack_object_reg[base_slot] == 0 ? root_object : NULL, value);
        }
        if(!ok || sq_type(value) != OT_CLOSURE) {
            return false;
        }
        *out = _closure(value);
        return true;
    };

    auto observed_member_object_ptr = [&](SQInteger base_slot,
        SQInteger literal_index, SQObjectType *type_out,
        SQInteger *ptr_out) -> bool {
        if(!type_out || !ptr_out) {
            return false;
        }
        *type_out = OT_NULL;
        *ptr_out = 0;
        if(base_slot < 0 || base_slot >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals) {
            return false;
        }

        SQObjectPtr value;
        bool ok = false;
        if(slot_kind[base_slot] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            ok = sqjit_a64_get_member_ptr_value(object_ptr_observed[base_slot],
                object_ptr_observed_type[base_slot],
                &proto->_literals[literal_index], value);
        }
        else if(slot_kind[base_slot] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[base_slot] >= 0) {
            ok = sqjit_a64_get_member_value_with_root(entry_stack,
                stack_object_reg[base_slot], &proto->_literals[literal_index],
                stack_object_reg[base_slot] == 0 ? root_object : NULL, value);
        }
        if(!ok || !sqjit_a64_type_is_object_ptr(sq_type(value))) {
            return false;
        }

        SQInteger ptr = 0;
        if(!sqjit_a64_value_to_object_ptr(value, sq_type(value), &ptr)) {
            return false;
        }
        *type_out = sq_type(value);
        *ptr_out = ptr;
        return true;
    };

    auto class_call_supported = [&](SQClass *klass, SQInteger nargs) -> bool {
        if(!klass || nargs <= 0) {
            return false;
        }
        SQObjectPtr constructor;
        if(!klass->GetConstructor(constructor)) {
            return true;
        }
        if(sq_type(constructor) != OT_CLOSURE) {
            return false;
        }
        SQClosure *callee = _closure(constructor);
        SQFunctionProto *callee_proto = callee ? callee->_function : NULL;
        if(!callee_proto || callee_proto->_bgenerator || callee_proto->_varparams ||
            callee_proto->_ndefaultparams != 0 ||
            callee_proto->_nparameters != nargs || !callee_proto->_jit ||
            !callee_proto->_jit->_entry) {
            return false;
        }
        SQJitNative *callee_native = (SQJitNative *)callee_proto->_jit->_entry;
        return callee_native &&
            callee_native->_ninstructions == callee_proto->_ninstructions &&
            callee_native->_native_entry &&
            callee_native->_native_kind != SQ_JIT_NATIVE_SETTER;
    };

    auto observed_slot_type = [&](SQInteger slot, SQObjectType *type_out) -> bool {
        if(!type_out || slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        switch(slot_kind[slot]) {
        case SQ_JIT_A64_SLOT_INT:
            *type_out = OT_INTEGER;
            return true;
        case SQ_JIT_A64_SLOT_FLOAT:
            *type_out = OT_FLOAT;
            return true;
        case SQ_JIT_A64_SLOT_BOOL:
            *type_out = OT_BOOL;
            return true;
        case SQ_JIT_A64_SLOT_ARRAY_PTR:
            *type_out = OT_ARRAY;
            return true;
        case SQ_JIT_A64_SLOT_OBJECT_PTR:
            if(object_ptr_observed_type[slot] == OT_NULL) {
                return false;
            }
            *type_out = object_ptr_observed_type[slot];
            return true;
        case SQ_JIT_A64_SLOT_STACK_OBJECT:
            if(stack_object_reg[slot] < 0) {
                return false;
            }
            *type_out = sq_type(entry_stack[stack_object_reg[slot]]);
            return true;
        default:
            return false;
        }
    };

    auto array_field_constructor_mode = [&](SQClass *klass, SQInteger arg_base,
        SQInteger nargs, SQClosure **ctor_out, SQInteger *field_index_out,
        SQInteger *mode_out) -> bool {
        if(!klass || !ctor_out || !field_index_out || !mode_out ||
            arg_base < 0 || nargs <= 0 || arg_base + nargs > MAX_FUNC_STACKSIZE ||
            klass->_defaultvalues.size() != 1 ||
            sq_type(klass->_defaultvalues[0].val) != OT_NULL) {
            return false;
        }

        SQObjectPtr constructor;
        if(!klass->GetConstructor(constructor) || sq_type(constructor) != OT_CLOSURE) {
            return false;
        }
        SQClosure *ctor = _closure(constructor);
        if(!sqjit_a64_constructor_looks_like_array_field_pack(ctor)) {
            return false;
        }

        SQInteger mode = 0;
        if(nargs == 1) {
            mode = SQ_JIT_A64_CTOR_ARRAY_FIELD_DEFAULT3;
        }
        else if(nargs == 2) {
            SQObjectType arg_type = OT_NULL;
            if(observed_slot_type(arg_base + 1, &arg_type) && arg_type == OT_ARRAY) {
                mode = SQ_JIT_A64_CTOR_ARRAY_FIELD_CLONE_ARRAY;
            }
            else {
                mode = SQ_JIT_A64_CTOR_ARRAY_FIELD_PACK1;
            }
        }
        else if(nargs >= 3 && nargs <= 5) {
            SQObjectType first_arg_type = OT_NULL;
            if(observed_slot_type(arg_base + 1, &first_arg_type) &&
                first_arg_type == OT_ARRAY) {
                return false;
            }
            mode = SQ_JIT_A64_CTOR_ARRAY_FIELD_PACK1 + (nargs - 2);
        }
        else {
            return false;
        }

        *ctor_out = ctor;
        *field_index_out = 0;
        *mode_out = mode;
        return true;
    };

    auto emit_array_field_constructor_call = [&](SQInteger dst, SQClass *klass,
        SQInteger arg_base, SQInteger nargs) -> bool {
        if(dst == 0xFF || dst < 0 || dst >= MAX_FUNC_STACKSIZE || !klass ||
            arg_base < 0 || nargs <= 0 ||
            arg_base + nargs > MAX_FUNC_STACKSIZE) {
            return false;
        }

        SQClosure *ctor = NULL;
        SQInteger field_index = 0;
        SQInteger mode = 0;
        if(!array_field_constructor_mode(klass, arg_base, nargs, &ctor,
            &field_index, &mode)) {
            return false;
        }

        for(SQInteger n = 1; n < nargs; n++) {
            if(!emit_materialize_call_slot_to_stack(arg_base + n)) {
                return false;
            }
        }

        return sqjit_a64_emit_mov_imm_x(&buf, 0,
                (SQInteger)(intptr_t)klass) &&
            sqjit_a64_emit_mov_imm_x(&buf, 1,
                (SQInteger)(intptr_t)ctor) &&
            sqjit_a64_emit_mov_reg(&buf, 2, 19) &&
            sqjit_a64_emit_mov_imm_x(&buf, 3, arg_base) &&
            sqjit_a64_emit_mov_imm_x(&buf, 4, nargs) &&
            sqjit_a64_emit_mov_imm_x(&buf, 5, dst) &&
            sqjit_a64_emit_mov_imm_x(&buf, 6, field_index) &&
            sqjit_a64_emit_mov_imm_x(&buf, 7, mode) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_call_array_field_constructor) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero() &&
            mark_constructed_array_field_slot(arg_base, arg_base, klass,
                field_index) &&
            mark_constructed_array_field_slot(dst, dst, klass, field_index);
    };

    auto emit_scalar_field_constructor_call = [&](SQInteger dst, SQClass *klass,
        SQInteger arg_base, SQInteger nargs) -> bool {
        if(dst == 0xFF || dst < 0 || dst >= MAX_FUNC_STACKSIZE || !klass ||
            arg_base < 0 || nargs <= 1 ||
            arg_base + nargs > MAX_FUNC_STACKSIZE) {
            return false;
        }

        SQClosure *ctor = NULL;
        SQInteger field_count = 0;
        if(!sqjit_a64_constructor_tail_is_scalar_field_pack(klass, &ctor,
            nargs, &field_count)) {
            return false;
        }

        for(SQInteger n = 1; n < nargs; n++) {
            SQObjectType type = OT_NULL;
            SQInteger slot = arg_base + n;
            if(!observed_slot_type(slot, &type) ||
                (type != OT_INTEGER && type != OT_FLOAT && type != OT_BOOL)) {
                return false;
            }
            if(type == OT_FLOAT) {
                if(!ensure_float_slot(slot)) {
                    return false;
                }
            }
            else if(!ensure_int_slot(slot)) {
                return false;
            }
            if(!emit_materialize_call_slot_to_stack(slot)) {
                return false;
            }
        }

        return sqjit_a64_emit_mov_imm_x(&buf, 0,
                (SQInteger)(intptr_t)klass) &&
            sqjit_a64_emit_mov_imm_x(&buf, 1,
                (SQInteger)(intptr_t)ctor) &&
            sqjit_a64_emit_mov_reg(&buf, 2, 19) &&
            sqjit_a64_emit_mov_imm_x(&buf, 3, arg_base) &&
            sqjit_a64_emit_mov_imm_x(&buf, 4, nargs) &&
            sqjit_a64_emit_mov_imm_x(&buf, 5, dst) &&
            sqjit_a64_emit_mov_imm_x(&buf, 6, field_count) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)
                sqjit_a64_helper_call_scalar_field_constructor) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero() &&
            mark_stack_object_slot(arg_base, arg_base) &&
            mark_stack_object_slot(dst, dst);
    };

    auto emit_direct_native_closure_call = [&](SQInteger dst, SQClosure *callee,
        SQInteger arg_base, SQInteger nargs, SQInteger call_ip) -> bool {
        if(call_ip < 0 || call_ip >= proto->_ninstructions ||
            in_backward_loop[call_ip] || dst == 0xFF || !callee ||
            arg_base < 0 || nargs <= 0 ||
            arg_base + nargs > MAX_FUNC_STACKSIZE ||
            dst < 0 || dst >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        SQFunctionProto *callee_proto = callee->_function;
        if(!callee_proto || !callee_proto->_jit ||
            !callee_proto->_jit->_entry) {
            return false;
        }
        SQJitNative *callee_native = (SQJitNative *)callee_proto->_jit->_entry;
        if(!callee_native ||
            callee_native->_ninstructions != callee_proto->_ninstructions ||
            !callee_native->_native_entry ||
            callee_native->_native_kind == SQ_JIT_NATIVE_SETTER) {
            return false;
        }
        for(SQInteger n = 0; n < nargs; n++) {
            SQInteger slot = arg_base + n;
            if(!emit_materialize_call_slot_to_stack(slot)) {
                return false;
            }
        }
        return sqjit_a64_emit_mov_imm_x(&buf, 0,
                (SQInteger)(intptr_t)callee) &&
            sqjit_a64_emit_mov_reg(&buf, 1, 19) &&
            sqjit_a64_emit_mov_imm_x(&buf, 2, arg_base) &&
            sqjit_a64_emit_mov_imm_x(&buf, 3, nargs) &&
            sqjit_a64_emit_mov_imm_x(&buf, 4, dst) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_call_native_closure) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero() &&
            (callee_native->_return_shape ==
                SQ_JIT_NATIVE_RETURN_ARRAY_FIELD_INSTANCE &&
                callee_native->_return_shape_class ?
                mark_constructed_array_field_slot(dst, dst,
                    callee_native->_return_shape_class,
                    callee_native->_return_shape_field_index) :
                mark_stack_object_slot(dst, dst));
    };

    auto emit_class_call = [&](SQInteger dst, SQClass *klass,
        SQInteger arg_base, SQInteger nargs) -> bool {
        if(emit_array_field_constructor_call(dst, klass, arg_base, nargs)) {
            return true;
        }
        if(emit_scalar_field_constructor_call(dst, klass, arg_base, nargs)) {
            return true;
        }
        if(dst == 0xFF || dst < 0 || dst >= MAX_FUNC_STACKSIZE || !klass ||
            arg_base < 0 || nargs <= 0 ||
            arg_base + nargs > MAX_FUNC_STACKSIZE ||
            !class_call_supported(klass, nargs)) {
            return false;
        }
        for(SQInteger n = 0; n < nargs; n++) {
            if(!emit_materialize_call_slot_to_stack(arg_base + n)) {
                return false;
            }
        }
        return sqjit_a64_emit_mov_imm_x(&buf, 0,
                (SQInteger)(intptr_t)klass) &&
            sqjit_a64_emit_mov_reg(&buf, 1, 19) &&
            sqjit_a64_emit_mov_imm_x(&buf, 2, arg_base) &&
            sqjit_a64_emit_mov_imm_x(&buf, 3, nargs) &&
            sqjit_a64_emit_mov_imm_x(&buf, 4, dst) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_call_class) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero() &&
            mark_stack_object_slot(dst, dst);
    };

    auto emit_inline_simple_accessor_call = [&](SQClosure *callee_closure,
        const SQInstruction &call_inst) -> bool {
        if(!callee_closure || call_inst._arg0 == 0xFF ||
            call_inst._arg2 < 0 ||
            call_inst._arg2 + call_inst._arg3 > MAX_FUNC_STACKSIZE ||
            proto->_stacksize >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        SQFunctionProto *callee = callee_closure->_function;
        if(!callee || callee->_bgenerator || callee->_varparams ||
            callee->_ndefaultparams != 0 || callee->_noutervalues != 0 ||
            callee->_nparameters != call_inst._arg3 || callee->_nparameters < 1) {
            return false;
        }

        auto next_inline_ip = [&](SQInteger ip) -> SQInteger {
            while(ip >= 0 && ip < callee->_ninstructions &&
                callee->_instructions[ip].op == _OP_LINE) {
                ip++;
            }
            return ip;
        };

        auto detect_has_keys_predicate = [&](SQInteger *key_literals,
            SQInteger *key_count, SQInteger *subject_param) -> bool {
            if(!key_literals || !key_count || !subject_param ||
                callee->_nparameters < 2) {
                return false;
            }
            SQInteger literal_for_slot[MAX_FUNC_STACKSIZE];
            for(SQInteger n = 0; n < MAX_FUNC_STACKSIZE; n++) {
                literal_for_slot[n] = -1;
            }
            *key_count = 0;
            *subject_param = -1;
            bool has_trap = false;
            bool has_return = false;
            for(SQInteger ip = 0; ip < callee->_ninstructions; ip++) {
                const SQInstruction &inst = callee->_instructions[ip];
                switch(inst.op) {
                case _OP_LINE:
                case _OP_POPTRAP:
                case _OP_JMP:
                case _OP_JZ:
                case _OP_AND:
                case _OP_OR:
                case _OP_LOADBOOL:
                    break;
                case _OP_PUSHTRAP:
                    has_trap = true;
                    break;
                case _OP_LOAD:
                    if(inst._arg0 < 0 || inst._arg0 >= MAX_FUNC_STACKSIZE ||
                        inst._arg1 < 0 || inst._arg1 >= callee->_nliterals) {
                        return false;
                    }
                    literal_for_slot[inst._arg0] = inst._arg1;
                    break;
                case _OP_DLOAD:
                    if(inst._arg0 < 0 || inst._arg0 >= MAX_FUNC_STACKSIZE ||
                        inst._arg2 < 0 || inst._arg2 >= MAX_FUNC_STACKSIZE ||
                        inst._arg1 < 0 || inst._arg1 >= callee->_nliterals ||
                        inst._arg3 < 0 || inst._arg3 >= callee->_nliterals) {
                        return false;
                    }
                    literal_for_slot[inst._arg0] = inst._arg1;
                    literal_for_slot[inst._arg2] = inst._arg3;
                    break;
                case _OP_MOVE:
                    if(inst._arg0 < 0 || inst._arg0 >= MAX_FUNC_STACKSIZE ||
                        inst._arg1 < 0 || inst._arg1 >= MAX_FUNC_STACKSIZE) {
                        return false;
                    }
                    literal_for_slot[inst._arg0] = literal_for_slot[inst._arg1];
                    break;
                case _OP_EXISTS: {
                    if(inst._arg1 < 0 || inst._arg1 >= callee->_nparameters ||
                        inst._arg2 < 0 || inst._arg2 >= MAX_FUNC_STACKSIZE) {
                        return false;
                    }
                    SQInteger literal_index = literal_for_slot[inst._arg2];
                    if(literal_index < 0 || literal_index >= callee->_nliterals ||
                        sq_type(callee->_literals[literal_index]) != OT_STRING) {
                        return false;
                    }
                    if(*subject_param < 0) {
                        *subject_param = inst._arg1;
                    }
                    else if(*subject_param != inst._arg1) {
                        return false;
                    }
                    bool duplicate = false;
                    for(SQInteger n = 0; n < *key_count; n++) {
                        if(key_literals[n] == literal_index) {
                            duplicate = true;
                            break;
                        }
                    }
                    if(!duplicate) {
                        if(*key_count >= 8) {
                            return false;
                        }
                        key_literals[(*key_count)++] = literal_index;
                    }
                    break;
                }
                case _OP_RETURN:
                    has_return = true;
                    break;
                default:
                    return false;
                }
            }
            return has_trap && has_return && *subject_param >= 0 &&
                *key_count > 0;
        };

        auto observed_member_exists_for_key = [&](SQInteger base,
            const SQObjectPtr *key, bool *exists_out) -> bool {
            if(!exists_out || base < 0 || base >= MAX_FUNC_STACKSIZE || !key) {
                return false;
            }
            SQObjectPtr value;
            if(slot_kind[base] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
                if(object_ptr_observed_type[base] == OT_NULL) {
                    return false;
                }
                *exists_out = sqjit_a64_get_member_ptr_value(
                    object_ptr_observed[base], object_ptr_observed_type[base],
                    key, value);
                return true;
            }
            if(slot_kind[base] == SQ_JIT_A64_SLOT_INT ||
                slot_kind[base] == SQ_JIT_A64_SLOT_FLOAT ||
                slot_kind[base] == SQ_JIT_A64_SLOT_BOOL) {
                *exists_out = false;
                return true;
            }
            if(slot_kind[base] != SQ_JIT_A64_SLOT_STACK_OBJECT ||
                stack_object_reg[base] < 0 || !entry_stack) {
                return false;
            }
            *exists_out = sqjit_a64_get_member_value_with_root(entry_stack,
                stack_object_reg[base], key,
                stack_object_reg[base] == 0 ? root_object : NULL, value);
            return true;
        };

        SQInteger predicate_key_literals[8];
        SQInteger predicate_key_count = 0;
        SQInteger predicate_subject = -1;
        if(detect_has_keys_predicate(predicate_key_literals,
            &predicate_key_count, &predicate_subject)) {
            SQInteger subject_slot = call_inst._arg2 + predicate_subject;
            if(subject_slot < 0 || subject_slot >= MAX_FUNC_STACKSIZE) {
                return false;
            }
            bool result = true;
            SQInteger guard_key = -1;
            for(SQInteger n = 0; n < predicate_key_count; n++) {
                bool exists = false;
                const SQObjectPtr *key =
                    &callee->_literals[predicate_key_literals[n]];
                if(!observed_member_exists_for_key(subject_slot, key, &exists)) {
                    return false;
                }
                if(!exists) {
                    result = false;
                    guard_key = predicate_key_literals[n];
                    break;
                }
            }
            if(result) {
                for(SQInteger n = 0; n < predicate_key_count; n++) {
                    if(!emit_member_exists_guard_key(subject_slot,
                        &callee->_literals[predicate_key_literals[n]], true)) {
                        return false;
                    }
                }
            }
            else if(guard_key < 0 ||
                ((slot_kind[subject_slot] == SQ_JIT_A64_SLOT_STACK_OBJECT ||
                slot_kind[subject_slot] == SQ_JIT_A64_SLOT_OBJECT_PTR) &&
                !emit_member_exists_guard_key(subject_slot,
                &callee->_literals[guard_key], false))) {
                return false;
            }
            if(!emit_load_int(call_inst._arg0, result ? 1 : 0) ||
                !mark_bool_slot(call_inst._arg0)) {
                return false;
            }
            known_const[call_inst._arg0] = true;
            const_value[call_inst._arg0] = result ? 1 : 0;
            return true;
        }

        SQInteger ip0 = next_inline_ip(0);
        if(ip0 < 0 || ip0 >= callee->_ninstructions ||
            callee->_instructions[ip0].op != _OP_GETK) {
            return false;
        }
        const SQInstruction &field_get = callee->_instructions[ip0];
        if(field_get._arg1 < 0 || field_get._arg1 >= callee->_nliterals ||
            field_get._arg2 < 0 || field_get._arg2 >= callee->_nparameters ||
            sq_type(callee->_literals[field_get._arg1]) != OT_STRING) {
            return false;
        }
        SQInteger self_slot = call_inst._arg2 + field_get._arg2;
        SQInteger scratch = proto->_stacksize;
        if(self_slot < 0 || self_slot >= MAX_FUNC_STACKSIZE ||
            scratch < 0 || scratch >= MAX_FUNC_STACKSIZE) {
            return false;
        }

        auto observed_member_for_key = [&](SQInteger base,
            const SQObjectPtr *key, SQArray **array_out,
            SQInteger *object_ptr_out) -> SQObjectType {
            if(array_out) {
                *array_out = NULL;
            }
            if(object_ptr_out) {
                *object_ptr_out = 0;
            }
            if(base < 0 || base >= MAX_FUNC_STACKSIZE || !key) {
                return OT_NULL;
            }
            if(slot_kind[base] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
                return sqjit_a64_observed_object_ptr_value_type(
                    object_ptr_observed[base], object_ptr_observed_type[base],
                    key, array_out, object_ptr_out);
            }
            SQInteger observed_reg = stack_object_reg[base];
            SQObjectType observed = sqjit_a64_observed_table_value_type(
                entry_stack, observed_reg, key, array_out, object_ptr_out);
            if(observed == OT_NULL && observed_reg == 0) {
                observed = sqjit_a64_observed_root_value_type(root_object, key,
                    array_out, object_ptr_out);
            }
            return observed;
        };

        const SQObjectPtr *field_key = &callee->_literals[field_get._arg1];
        SQInteger ip1 = next_inline_ip(ip0 + 1);
        if(ip1 >= 0 && ip1 < callee->_ninstructions &&
            callee->_instructions[ip1].op == _OP_RETURN &&
            callee->_instructions[ip1]._arg0 != 0xFF &&
            callee->_instructions[ip1]._arg1 == field_get._arg0) {
            SQArray *observed_array = NULL;
            SQInteger observed_object_ptr = 0;
            SQObjectType observed = observed_member_for_key(self_slot, field_key,
                &observed_array, &observed_object_ptr);
            return emit_member_get_key(call_inst._arg0, self_slot, field_key,
                observed, observed_array, observed_object_ptr);
        }

        if(ip1 >= 0 && ip1 < callee->_ninstructions &&
            callee->_instructions[ip1].op == _OP_LOADINT) {
            const SQInstruction &index_load = callee->_instructions[ip1];
            SQInteger ip2 = next_inline_ip(ip1 + 1);
            if(ip2 < 0 || ip2 >= callee->_ninstructions ||
                callee->_instructions[ip2].op != _OP_GET ||
                callee->_instructions[ip2]._arg1 != field_get._arg0 ||
                callee->_instructions[ip2]._arg2 != index_load._arg0) {
                return false;
            }
            const SQInstruction &array_get = callee->_instructions[ip2];
            SQInteger ip3 = next_inline_ip(ip2 + 1);
            if(ip3 < 0 || ip3 >= callee->_ninstructions ||
                callee->_instructions[ip3].op != _OP_RETURN ||
                callee->_instructions[ip3]._arg0 == 0xFF ||
                callee->_instructions[ip3]._arg1 != array_get._arg0) {
                return false;
            }

            SQArray *field_array = NULL;
            SQInteger observed_object_ptr = 0;
            SQObjectType field_observed = observed_member_for_key(self_slot,
                field_key, &field_array, &observed_object_ptr);
            if(field_observed != OT_ARRAY ||
                !emit_member_get_key(scratch, self_slot, field_key,
                field_observed, field_array, observed_object_ptr)) {
                return false;
            }

            SQInteger index = sqjit_loadint_value(index_load);
            SQArray *observed_array = NULL;
            SQObjectType observed = sqjit_a64_observed_array_ptr_value_type(
                array_ptr_observed[scratch], index, &observed_array);
            return emit_array_ptr_get(call_inst._arg0, scratch, index, observed,
                observed_array);
        }

        if(ip1 < 0 || ip1 >= callee->_ninstructions ||
            callee->_instructions[ip1].op != _OP_GETK) {
            return false;
        }
        const SQInstruction &array_get = callee->_instructions[ip1];
        if(array_get._arg2 != field_get._arg0 ||
            array_get._arg1 < 0 || array_get._arg1 >= callee->_nliterals ||
            sq_type(callee->_literals[array_get._arg1]) != OT_INTEGER) {
            return false;
        }
        SQInteger ip2 = next_inline_ip(ip1 + 1);
        if(ip2 < 0 || ip2 >= callee->_ninstructions ||
            callee->_instructions[ip2].op != _OP_RETURN ||
            callee->_instructions[ip2]._arg0 == 0xFF ||
            callee->_instructions[ip2]._arg1 != array_get._arg0) {
            return false;
        }

        SQArray *field_array = NULL;
        SQInteger observed_object_ptr = 0;
        SQObjectType field_observed = observed_member_for_key(self_slot,
            field_key, &field_array, &observed_object_ptr);
        if(field_observed != OT_ARRAY ||
            !emit_member_get_key(scratch, self_slot, field_key,
            field_observed, field_array, observed_object_ptr)) {
            return false;
        }

        SQInteger index = _integer(callee->_literals[array_get._arg1]);
        SQArray *observed_array = NULL;
        SQObjectType observed = sqjit_a64_observed_array_ptr_value_type(
            array_ptr_observed[scratch], index, &observed_array);
        return emit_array_ptr_get(call_inst._arg0, scratch, index, observed,
            observed_array);
    };

    auto emit_math_call = [&](SQInteger dst, SQJitA64MathIntrinsic intrinsic,
        SQInteger nargs, SQInteger first_arg) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            first_arg < 0 || first_arg >= MAX_FUNC_STACKSIZE ||
            intrinsic == SQ_JIT_A64_MATH_NONE) {
            return false;
        }
        if(nargs == 1) {
            return ensure_float_slot(first_arg) &&
                sqjit_a64_emit_mov_imm_x(&buf, 0, (SQInteger)intrinsic) &&
                sqjit_a64_emit_add_imm(&buf, 1, 31,
                    sqjit_a64_local_disp(first_arg)) &&
                sqjit_a64_emit_add_imm(&buf, 2, 31,
                    sqjit_a64_local_disp(dst)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)(const void *)
                    sqjit_a64_helper_math_unary) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero() &&
                mark_float_slot(dst);
        }
        if(nargs == 2) {
            SQInteger second_arg = first_arg + 1;
            return second_arg >= 0 && second_arg < MAX_FUNC_STACKSIZE &&
                ensure_float_slot(first_arg) &&
                ensure_float_slot(second_arg) &&
                sqjit_a64_emit_mov_imm_x(&buf, 0, (SQInteger)intrinsic) &&
                sqjit_a64_emit_add_imm(&buf, 1, 31,
                    sqjit_a64_local_disp(first_arg)) &&
                sqjit_a64_emit_add_imm(&buf, 2, 31,
                    sqjit_a64_local_disp(second_arg)) &&
                sqjit_a64_emit_add_imm(&buf, 3, 31,
                    sqjit_a64_local_disp(dst)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)(const void *)
                    sqjit_a64_helper_math_binary) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero() &&
                mark_float_slot(dst);
        }
        return false;
    };

    auto emit_member_native_closure_guard_key = [&](SQInteger base_slot,
        const SQObjectPtr *key, SQNativeClosure *expected) -> bool {
        if(base_slot < 0 || base_slot >= MAX_FUNC_STACKSIZE || !key ||
            (slot_kind[base_slot] != SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slot_kind[base_slot] != SQ_JIT_A64_SLOT_OBJECT_PTR) ||
            !expected) {
            return false;
        }
        if(slot_kind[base_slot] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            return object_ptr_observed_type[base_slot] != OT_NULL &&
                sqjit_a64_emit_ldr_x(&buf, 0, 31,
                    sqjit_a64_local_disp(base_slot)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 1,
                    (SQInteger)object_ptr_observed_type[base_slot]) &&
                sqjit_a64_emit_mov_imm_x(&buf, 2,
                    (SQInteger)(intptr_t)key) &&
                sqjit_a64_emit_mov_imm_x(&buf, 3,
                    (SQInteger)(intptr_t)expected) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)(const void *)
                    sqjit_a64_helper_object_ptr_member_native_closure_guard) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero();
        }
        return stack_object_reg[base_slot] >= 0 &&
            sqjit_a64_emit_mov_reg(&buf, 0, 19) &&
            sqjit_a64_emit_mov_imm_x(&buf, 1, stack_object_reg[base_slot]) &&
            sqjit_a64_emit_mov_imm_x(&buf, 2, (SQInteger)(intptr_t)key) &&
            sqjit_a64_emit_mov_imm_x(&buf, 3,
                (SQInteger)(intptr_t)expected) &&
            sqjit_a64_emit_mov_imm_x(&buf, 4,
                stack_object_reg[base_slot] == 0 && root_object ?
                (SQInteger)(intptr_t)root_object : 0) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)(const void *)
                sqjit_a64_helper_member_native_closure_guard) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero();
    };

    auto observed_member_native_closure_key = [&](SQInteger base_slot,
        const SQObjectPtr *key, SQNativeClosure **out) -> bool {
        if(!out) {
            return false;
        }
        *out = NULL;
        if(base_slot < 0 || base_slot >= MAX_FUNC_STACKSIZE || !key) {
            return false;
        }

        SQObjectPtr value;
        bool ok = false;
        if(slot_kind[base_slot] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            ok = sqjit_a64_get_member_ptr_value(object_ptr_observed[base_slot],
                object_ptr_observed_type[base_slot], key, value);
        }
        else if(slot_kind[base_slot] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[base_slot] >= 0) {
            ok = sqjit_a64_get_member_value_with_root(entry_stack,
                stack_object_reg[base_slot], key,
                stack_object_reg[base_slot] == 0 ? root_object : NULL, value);
        }
        if(!ok || sq_type(value) != OT_NATIVECLOSURE) {
            return false;
        }
        *out = _nativeclosure(value);
        return true;
    };

    auto literal_index_for_object_ptr_slot = [&](SQInteger slot) -> SQInteger {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE ||
            slot_kind[slot] != SQ_JIT_A64_SLOT_OBJECT_PTR ||
            object_ptr_observed_type[slot] == OT_NULL) {
            return -1;
        }
        for(SQInteger i = 0; i < proto->_nliterals; i++) {
            SQInteger literal_ptr = 0;
            if(sq_type(proto->_literals[i]) == object_ptr_observed_type[slot] &&
                sqjit_a64_value_to_object_ptr(proto->_literals[i],
                sq_type(proto->_literals[i]), &literal_ptr) &&
                literal_ptr == object_ptr_observed[slot]) {
                return i;
            }
        }
        return -1;
    };

    auto observed_instance_field_for_base = [&](SQInteger base,
        const SQObjectPtr *key, SQJitA64InstanceFieldObservation *field) -> bool {
        if(base < 0 || base >= MAX_FUNC_STACKSIZE || !key || !field) {
            return false;
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT) {
            return stack_object_reg[base] >= 0 &&
                sqjit_a64_observed_stack_instance_field(entry_stack,
                    stack_object_reg[base], key, field);
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            return sqjit_a64_observed_object_ptr_instance_field(
                object_ptr_observed[base], object_ptr_observed_type[base],
                key, field);
        }
        return false;
    };

    auto emit_instance_field_set_base = [&](SQInteger base,
        const SQJitA64InstanceFieldObservation &field) -> bool {
        if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT) {
            if(stack_object_reg[base] < 0 ||
                !sqjit_a64_emit_type_guard(&buf, stack_object_reg[base],
                OT_INSTANCE, guard_relocs, &nguard_relocs) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 19,
                sqjit_a64_stack_value_disp(stack_object_reg[base]))) {
                return false;
            }
        }
        else if(slot_kind[base] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            if(!sqjit_a64_emit_ldr_x(&buf, 1, 31,
                sqjit_a64_local_disp(base))) {
                return false;
            }
        }
        else {
            return false;
        }

        return sqjit_a64_emit_ldr_x(&buf, 10, 1, field.class_disp) &&
            sqjit_a64_emit_mov_imm_x(&buf, 12,
                (SQInteger)(intptr_t)field.klass) &&
            sqjit_a64_emit_cmp_reg(&buf, 10, 12) &&
            emit_guard_fail_branch(SQ_JIT_A64_NE);
    };

    auto emit_instance_field_set_integer_key = [&](SQInteger target,
        SQInteger base, const SQObjectPtr *key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            !key || value < 0 || value >= MAX_FUNC_STACKSIZE ||
            !ensure_int_slot(value)) {
            return false;
        }

        SQJitA64InstanceFieldObservation field;
        if(!observed_instance_field_for_base(base, key, &field) ||
            !emit_instance_field_set_base(base, field) ||
            !sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 2,
                (SQInteger)(intptr_t)field.klass) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)(intptr_t)key) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 4, field.field_index) ||
            !sqjit_a64_emit_ldr_x(&buf, 5, 31,
                sqjit_a64_local_disp(value)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)
                sqjit_a64_helper_instance_field_set_integer_logged) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        return copy_int_slot(target, value);
    };

    auto emit_instance_field_set_bool_key = [&](SQInteger target,
        SQInteger base, const SQObjectPtr *key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            !key || value < 0 || value >= MAX_FUNC_STACKSIZE ||
            !ensure_int_slot(value)) {
            return false;
        }

        SQJitA64InstanceFieldObservation field;
        if(!observed_instance_field_for_base(base, key, &field) ||
            !emit_instance_field_set_base(base, field) ||
            !sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 2,
                (SQInteger)(intptr_t)field.klass) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)(intptr_t)key) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 4, field.field_index) ||
            !sqjit_a64_emit_ldr_x(&buf, 5, 31,
                sqjit_a64_local_disp(value)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)
                sqjit_a64_helper_instance_field_set_bool_logged) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        return copy_int_slot(target, value);
    };

    auto emit_instance_field_set_float_key = [&](SQInteger target,
        SQInteger base, const SQObjectPtr *key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            !key || value < 0 || value >= MAX_FUNC_STACKSIZE ||
            !ensure_float_slot(value)) {
            return false;
        }

        SQJitA64InstanceFieldObservation field;
        if(!observed_instance_field_for_base(base, key, &field) ||
            !emit_instance_field_set_base(base, field) ||
            !sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 2,
                (SQInteger)(intptr_t)field.klass) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)(intptr_t)key) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 4, field.field_index) ||
            !sqjit_a64_emit_add_imm(&buf, 5, 31,
                sqjit_a64_local_disp(value)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)
                sqjit_a64_helper_instance_field_set_float_logged) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        return copy_float_slot(target, value);
    };

    auto emit_member_set_integer_key = [&](SQInteger target, SQInteger base,
        const SQObjectPtr *key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            !key || value < 0 || value >= MAX_FUNC_STACKSIZE ||
            !ensure_int_slot(value)) {
            return false;
        }
        if(emit_instance_field_set_integer_key(target, base, key, value)) {
            return true;
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            return object_ptr_observed_type[base] != OT_NULL &&
                sqjit_a64_emit_add_imm(&buf, 0, 31,
                    sqjit_a64_local_disp(write_log_slot)) &&
                sqjit_a64_emit_ldr_x(&buf, 1, 31,
                    sqjit_a64_local_disp(base)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 2,
                    (SQInteger)object_ptr_observed_type[base]) &&
                sqjit_a64_emit_mov_imm_x(&buf, 3,
                    (SQInteger)(intptr_t)key) &&
                sqjit_a64_emit_ldr_x(&buf, 4, 31,
                    sqjit_a64_local_disp(value)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)
                    sqjit_a64_helper_object_ptr_set_integer_logged) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero() &&
                copy_int_slot(target, value);
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[base] >= 0) {
            return sqjit_a64_emit_add_imm(&buf, 0, 31,
                    sqjit_a64_local_disp(write_log_slot)) &&
                sqjit_a64_emit_mov_reg(&buf, 1, 19) &&
                sqjit_a64_emit_mov_imm_x(&buf, 2, stack_object_reg[base]) &&
                sqjit_a64_emit_mov_imm_x(&buf, 3,
                    (SQInteger)(intptr_t)key) &&
                sqjit_a64_emit_ldr_x(&buf, 4, 31,
                    sqjit_a64_local_disp(value)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 5,
                    stack_object_reg[base] == 0 && root_object ?
                    (SQInteger)(intptr_t)root_object : 0) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)
                    sqjit_a64_helper_member_set_integer_logged) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero() &&
                copy_int_slot(target, value);
        }
        return false;
    };

    auto emit_member_set_bool_key = [&](SQInteger target, SQInteger base,
        const SQObjectPtr *key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            !key || value < 0 || value >= MAX_FUNC_STACKSIZE ||
            !ensure_int_slot(value)) {
            return false;
        }
        if(emit_instance_field_set_bool_key(target, base, key, value)) {
            return true;
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            return object_ptr_observed_type[base] != OT_NULL &&
                sqjit_a64_emit_add_imm(&buf, 0, 31,
                    sqjit_a64_local_disp(write_log_slot)) &&
                sqjit_a64_emit_ldr_x(&buf, 1, 31,
                    sqjit_a64_local_disp(base)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 2,
                    (SQInteger)object_ptr_observed_type[base]) &&
                sqjit_a64_emit_mov_imm_x(&buf, 3,
                    (SQInteger)(intptr_t)key) &&
                sqjit_a64_emit_ldr_x(&buf, 4, 31,
                    sqjit_a64_local_disp(value)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)
                    sqjit_a64_helper_object_ptr_set_bool_logged) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero() &&
                copy_int_slot(target, value);
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[base] >= 0) {
            return sqjit_a64_emit_add_imm(&buf, 0, 31,
                    sqjit_a64_local_disp(write_log_slot)) &&
                sqjit_a64_emit_mov_reg(&buf, 1, 19) &&
                sqjit_a64_emit_mov_imm_x(&buf, 2, stack_object_reg[base]) &&
                sqjit_a64_emit_mov_imm_x(&buf, 3,
                    (SQInteger)(intptr_t)key) &&
                sqjit_a64_emit_ldr_x(&buf, 4, 31,
                    sqjit_a64_local_disp(value)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 5,
                    stack_object_reg[base] == 0 && root_object ?
                    (SQInteger)(intptr_t)root_object : 0) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)
                    sqjit_a64_helper_member_set_bool_logged) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero() &&
                copy_int_slot(target, value);
        }
        return false;
    };

    auto emit_array_set_integer = [&](SQInteger target, SQInteger base,
        SQInteger key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || value < 0 ||
            value >= MAX_FUNC_STACKSIZE || !ensure_int_slot(key) ||
            !ensure_int_slot(value)) {
            return false;
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31,
                sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_ldr_x(&buf, 2, 31,
                sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)
                sqjit_a64_helper_array_ptr_set_integer_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_int_slot(target, value);
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[base] >= 0) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_mov_reg(&buf, 1, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, stack_object_reg[base]) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31,
                sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_ldr_x(&buf, 4, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_array_set_integer_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_int_slot(target, value);
        }
        return false;
    };

    auto emit_array_set_bool = [&](SQInteger target, SQInteger base,
        SQInteger key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || value < 0 ||
            value >= MAX_FUNC_STACKSIZE || !ensure_int_slot(key) ||
            !ensure_int_slot(value)) {
            return false;
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31,
                sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_ldr_x(&buf, 2, 31,
                sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)
                sqjit_a64_helper_array_ptr_set_bool_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_int_slot(target, value);
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[base] >= 0) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_mov_reg(&buf, 1, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, stack_object_reg[base]) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31,
                sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_ldr_x(&buf, 4, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_array_set_bool_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_int_slot(target, value);
        }
        return false;
    };

    auto emit_array_set_float = [&](SQInteger target, SQInteger base,
        SQInteger key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || value < 0 ||
            value >= MAX_FUNC_STACKSIZE || !ensure_int_slot(key) ||
            !ensure_float_slot(value)) {
            return false;
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31,
                sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_ldr_x(&buf, 2, 31,
                sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_add_imm(&buf, 3, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)
                sqjit_a64_helper_array_ptr_set_float_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_float_slot(target, value);
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[base] >= 0) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_mov_reg(&buf, 1, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, stack_object_reg[base]) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31,
                sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_add_imm(&buf, 4, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_array_set_float_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_float_slot(target, value);
        }
        return false;
    };

    auto emit_member_set_float_key = [&](SQInteger target, SQInteger base,
        const SQObjectPtr *key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            !key || value < 0 || value >= MAX_FUNC_STACKSIZE ||
            !ensure_float_slot(value)) {
            return false;
        }
        if(emit_instance_field_set_float_key(target, base, key, value)) {
            return true;
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            return object_ptr_observed_type[base] != OT_NULL &&
                sqjit_a64_emit_add_imm(&buf, 0, 31,
                    sqjit_a64_local_disp(write_log_slot)) &&
                sqjit_a64_emit_ldr_x(&buf, 1, 31,
                    sqjit_a64_local_disp(base)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 2,
                    (SQInteger)object_ptr_observed_type[base]) &&
                sqjit_a64_emit_mov_imm_x(&buf, 3,
                    (SQInteger)(intptr_t)key) &&
                sqjit_a64_emit_add_imm(&buf, 4, 31,
                    sqjit_a64_local_disp(value)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)
                    sqjit_a64_helper_object_ptr_set_float_logged) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero() &&
                copy_float_slot(target, value);
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[base] >= 0) {
            return sqjit_a64_emit_add_imm(&buf, 0, 31,
                    sqjit_a64_local_disp(write_log_slot)) &&
                sqjit_a64_emit_mov_reg(&buf, 1, 19) &&
                sqjit_a64_emit_mov_imm_x(&buf, 2, stack_object_reg[base]) &&
                sqjit_a64_emit_mov_imm_x(&buf, 3,
                    (SQInteger)(intptr_t)key) &&
                sqjit_a64_emit_add_imm(&buf, 4, 31,
                    sqjit_a64_local_disp(value)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 5,
                    stack_object_reg[base] == 0 && root_object ?
                    (SQInteger)(intptr_t)root_object : 0) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)
                    sqjit_a64_helper_member_set_float_logged) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero() &&
                copy_float_slot(target, value);
        }
        return false;
    };

    auto emit_member_set_object_key = [&](SQInteger target, SQInteger base,
        const SQObjectPtr *key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            !key || value < 0 || value >= MAX_FUNC_STACKSIZE ||
            !emit_materialize_slot_to_stack(value)) {
            return false;
        }
        SQInteger value_reg = stack_reg_for_materialized_slot(value);
        if(value_reg < 0) {
            return false;
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            if(object_ptr_observed_type[base] == OT_NULL ||
                !sqjit_a64_emit_add_imm(&buf, 0, 31,
                    sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31,
                    sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2,
                    (SQInteger)object_ptr_observed_type[base]) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 3,
                    (SQInteger)(intptr_t)key) ||
                !sqjit_a64_emit_mov_reg(&buf, 4, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 5, value_reg) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)
                    sqjit_a64_helper_object_ptr_set_stack_object_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return mark_stack_object_slot(target, value_reg);
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[base] >= 0) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                    sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_mov_reg(&buf, 1, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, stack_object_reg[base]) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 3,
                    (SQInteger)(intptr_t)key) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 4, value_reg) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 5,
                    stack_object_reg[base] == 0 && root_object ?
                    (SQInteger)(intptr_t)root_object : 0) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)
                    sqjit_a64_helper_member_set_stack_object_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return mark_stack_object_slot(target, value_reg);
        }
        return false;
    };

    bool previous_effective_return = false;
    SQInteger dead_until_ip = -1;
    for(SQInteger ip = 0; ip < proto->_ninstructions; ip++) {
        ip_to_offset[ip] = buf.size;
        if(dead_until_ip >= 0) {
            if(ip < dead_until_ip) {
                continue;
            }
            dead_until_ip = -1;
        }
        const SQInstruction &inst = proto->_instructions[ip];
        bool return_shape_reachable =
            !(previous_effective_return && !branch_target[ip]);
        if(inst.op != _OP_LINE && inst.op != _OP_RETURN) {
            previous_effective_return = false;
        }
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
                if(!load_literal_value_slot(inst._arg0, proto->_literals[inst._arg1])) {
                    return sqjit_a64_reject(proto, ip, "unsupported LOAD literal");
                }
                break;
            case _OP_DLOAD:
                if(inst._arg1 < 0 || inst._arg1 >= proto->_nliterals ||
                    inst._arg3 < 0 || inst._arg3 >= proto->_nliterals) {
                    return sqjit_a64_reject(proto, ip, "unsupported DLOAD literal");
                }
                if(!load_literal_value_slot(inst._arg0, proto->_literals[inst._arg1])) {
                    return sqjit_a64_reject(proto, ip, "unsupported DLOAD literal");
                }
                if(!load_literal_value_slot(inst._arg2, proto->_literals[inst._arg3])) {
                    return sqjit_a64_reject(proto, ip, "unsupported DLOAD literal");
                }
                break;
            case _OP_LOADBOOL:
                if(!emit_load_int(inst._arg0, inst._arg1 ? 1 : 0) || !mark_bool_slot(inst._arg0)) {
                    return false;
                }
                break;
            case _OP_LOADNULLS:
                if(!emit_load_nulls(inst._arg0, inst._arg1)) {
                    return sqjit_a64_reject(proto, ip, "unsupported LOADNULLS");
                }
                break;
            case _OP_MOVE:
                if(!copy_any_slot(inst._arg0, inst._arg1)) {
                    return sqjit_a64_reject(proto, ip, "unsupported MOVE");
                }
                break;
            case _OP_DMOVE:
                if(!copy_any_slot(inst._arg0, inst._arg1) ||
                    !copy_any_slot(inst._arg2, inst._arg3)) {
                    return sqjit_a64_reject(proto, ip, "unsupported DMOVE");
                }
                break;
            case _OP_GETOUTER:
                if(!emit_outer_get(inst._arg0, inst._arg1)) {
                    return sqjit_a64_reject(proto, ip, "unsupported GETOUTER");
                }
                break;
            case _OP_GETK: {
                if(inst._arg1 < 0 || inst._arg1 >= proto->_nliterals) {
                    return sqjit_a64_reject(proto, ip, "unsupported GETK key");
                }
                if(sq_type(proto->_literals[inst._arg1]) == OT_INTEGER) {
                    SQInteger index = _integer(proto->_literals[inst._arg1]);
                    SQObjectType observed = OT_NULL;
                    SQArray *observed_array = NULL;
                    if(inst._arg2 >= 0 && inst._arg2 < MAX_FUNC_STACKSIZE &&
                        slot_kind[inst._arg2] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
                        observed = sqjit_a64_observed_array_ptr_value_type(
                            array_ptr_observed[inst._arg2], index, &observed_array);
                        if(!emit_array_ptr_get(inst._arg0, inst._arg2, index, observed,
                            observed_array)) {
                            return sqjit_a64_reject(proto, ip, "unsupported GETK array ptr read");
                        }
                    }
                    else {
                        SQInteger observed_reg = (inst._arg2 >= 0 && inst._arg2 < MAX_FUNC_STACKSIZE) ?
                            stack_object_reg[inst._arg2] : -1;
                        observed = sqjit_a64_observed_array_value_type(entry_stack,
                            observed_reg, index);
                        if(observed == OT_ARRAY && observed_reg >= 0) {
                            SQObjectPtr observed_value;
                            if(sq_type(entry_stack[observed_reg]) == OT_ARRAY &&
                                _array(entry_stack[observed_reg])->Get(index, observed_value) &&
                                sq_type(observed_value) == OT_ARRAY) {
                                observed_array = _array(observed_value);
                            }
                        }
                        if(!emit_array_get(inst._arg0, inst._arg2, index, observed,
                            observed_array)) {
                        return sqjit_a64_reject(proto, ip, "unsupported GETK array read");
                        }
                    }
                }
                else {
                    SQArray *observed_array = NULL;
                    SQInteger observed_object_ptr = 0;
                    SQObjectType observed = OT_NULL;
                    if(inst._arg2 >= 0 && inst._arg2 < MAX_FUNC_STACKSIZE &&
                        slot_kind[inst._arg2] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
                        observed = sqjit_a64_observed_object_ptr_value_type(
                            object_ptr_observed[inst._arg2],
                            object_ptr_observed_type[inst._arg2],
                            &proto->_literals[inst._arg1], &observed_array,
                            &observed_object_ptr);
                    }
                    else {
                        SQInteger observed_reg =
                            (inst._arg2 >= 0 && inst._arg2 < MAX_FUNC_STACKSIZE) ?
                            stack_object_reg[inst._arg2] : -1;
                        observed = sqjit_a64_observed_table_value_type(entry_stack,
                            observed_reg, &proto->_literals[inst._arg1],
                            &observed_array, &observed_object_ptr);
                        if(observed == OT_NULL && observed_reg == 0) {
                            observed = sqjit_a64_observed_root_value_type(root_object,
                                &proto->_literals[inst._arg1], &observed_array,
                                &observed_object_ptr);
                        }
                    }
                    if(!emit_table_get(inst._arg0, inst._arg2, inst._arg1, observed,
                        observed_array, observed_object_ptr)) {
                        return sqjit_a64_reject(proto, ip, "unsupported GETK table read");
                    }
                }
                break;
            }
            case _OP_GET: {
                if(known_const[inst._arg2] && !has_backward_branch) {
                    SQObjectType observed = OT_NULL;
                    SQArray *observed_array = NULL;
                    if(inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE &&
                        slot_kind[inst._arg1] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
                        observed = sqjit_a64_observed_array_ptr_value_type(
                            array_ptr_observed[inst._arg1], const_value[inst._arg2],
                            &observed_array);
                        if(!emit_array_ptr_get(inst._arg0, inst._arg1,
                            const_value[inst._arg2], observed, observed_array)) {
                            return sqjit_a64_reject(proto, ip, "unsupported const GET array ptr read");
                        }
                    }
                    else {
                        SQInteger observed_reg = (inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE) ?
                            stack_object_reg[inst._arg1] : -1;
                        observed = sqjit_a64_observed_array_value_type(entry_stack,
                            observed_reg, const_value[inst._arg2]);
                        if(observed == OT_ARRAY && observed_reg >= 0) {
                            SQObjectPtr observed_value;
                            if(sq_type(entry_stack[observed_reg]) == OT_ARRAY &&
                                _array(entry_stack[observed_reg])->Get(
                                    const_value[inst._arg2], observed_value) &&
                                sq_type(observed_value) == OT_ARRAY) {
                                observed_array = _array(observed_value);
                            }
                        }
                        if(!emit_array_get(inst._arg0, inst._arg1, const_value[inst._arg2],
                            observed, observed_array)) {
                        return sqjit_a64_reject(proto, ip, "unsupported const GET array read");
                        }
                    }
                }
                else {
                    if(inst._arg2 >= 0 && inst._arg2 < MAX_FUNC_STACKSIZE &&
                        slot_kind[inst._arg2] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
                        if(!emit_member_get_dynamic_key(inst._arg0, inst._arg1,
                            inst._arg2)) {
                            return sqjit_a64_reject(proto, ip,
                                "unsupported dynamic GET member read");
                        }
                        break;
                    }
                    SQObjectType observed = OT_NULL;
                    SQArray *observed_array = NULL;
                    if(inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE &&
                        slot_kind[inst._arg1] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
                        SQInteger observed_index = 0;
                        if(inst._arg2 >= 0 && inst._arg2 < MAX_FUNC_STACKSIZE &&
                            known_const[inst._arg2]) {
                            observed_index = const_value[inst._arg2];
                        }
                        observed = sqjit_a64_observed_array_ptr_value_type(
                            array_ptr_observed[inst._arg1], observed_index, &observed_array);
                        if(!emit_array_ptr_get_dynamic(inst._arg0, inst._arg1, inst._arg2,
                            observed, observed_array)) {
                            return sqjit_a64_reject(proto, ip, "unsupported dynamic GET array ptr read");
                        }
                    }
                    else {
                        SQInteger observed_reg = (inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE) ?
                            stack_object_reg[inst._arg1] : -1;
                        observed = sqjit_a64_observed_array_value_type(entry_stack,
                            observed_reg, 0);
                        if(observed == OT_ARRAY && observed_reg >= 0) {
                            SQObjectPtr observed_value;
                            if(sq_type(entry_stack[observed_reg]) == OT_ARRAY &&
                                _array(entry_stack[observed_reg])->Get(0, observed_value) &&
                                sq_type(observed_value) == OT_ARRAY) {
                                observed_array = _array(observed_value);
                            }
                        }
                        if(!emit_array_get_dynamic(inst._arg0, inst._arg1, inst._arg2,
                            observed, observed_array)) {
                            if(sqjit_diag_trace_enabled()) {
                                SQInteger observed_reg =
                                    (inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE) ?
                                    stack_object_reg[inst._arg1] : -1;
                                SQObjectType stack_type =
                                    (observed_reg >= 0) ? sq_type(entry_stack[observed_reg]) : OT_NULL;
                                scprintf(_SC("[sqjit:a64] dynamic GET array miss proto '%s' ip %d base=%d kind=%d stackreg=%d stacktype=%d key=%d keykind=%d observed=%d\n"),
                                    sqjit_a64_proto_name(proto), (SQInt32)ip,
                                    (SQInt32)inst._arg1,
                                    (SQInt32)((inst._arg1 >= 0 &&
                                    inst._arg1 < MAX_FUNC_STACKSIZE) ?
                                    slot_kind[inst._arg1] : SQ_JIT_A64_SLOT_UNKNOWN),
                                    (SQInt32)observed_reg, (SQInt32)stack_type,
                                    (SQInt32)inst._arg2,
                                    (SQInt32)((inst._arg2 >= 0 &&
                                    inst._arg2 < MAX_FUNC_STACKSIZE) ?
                                    slot_kind[inst._arg2] : SQ_JIT_A64_SLOT_UNKNOWN),
                                    (SQInt32)observed);
                            }
                            return sqjit_a64_reject(proto, ip, "unsupported dynamic GET array read");
                        }
                    }
                }
                break;
            }
            case _OP_PREPCALL: {
                if(inst._arg0 < 0 || inst._arg0 >= MAX_FUNC_STACKSIZE ||
                    inst._arg1 < 0 || inst._arg1 >= MAX_FUNC_STACKSIZE ||
                    inst._arg2 < 0 || inst._arg2 >= MAX_FUNC_STACKSIZE) {
                    return sqjit_a64_reject(proto, ip, "unsupported PREPCALL");
                }
                SQInteger key_literal = literal_index_for_object_ptr_slot(inst._arg1);
                if(key_literal < 0 ||
                    sq_type(proto->_literals[key_literal]) != OT_STRING) {
                    return sqjit_a64_reject(proto, ip,
                        "unsupported PREPCALL key");
                }

                SQInteger receiver_slot = inst._arg2;
                if(inst._arg3 >= 0 && inst._arg3 < MAX_FUNC_STACKSIZE) {
                    if(inst._arg3 == inst._arg0 ||
                        !copy_any_slot(inst._arg3, inst._arg2)) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported PREPCALL self copy");
                    }
                    receiver_slot = inst._arg3;
                }
                else if(inst._arg0 == inst._arg2) {
                    return sqjit_a64_reject(proto, ip,
                        "unsupported PREPCALL self copy");
                }
                if(!mark_unknown_slot(inst._arg0)) {
                    return sqjit_a64_reject(proto, ip, "unsupported PREPCALL");
                }

                const SQObjectPtr *key = &proto->_literals[key_literal];
                const SQChar *member_name = _stringval(*key);
                if(scstrcmp(member_name, _SC("len")) == 0) {
                    prepared_array_len_base[inst._arg0] = receiver_slot;
                }
                else if(scstrcmp(member_name, _SC("append")) == 0 ||
                    scstrcmp(member_name, _SC("push")) == 0) {
                    if(slot_kind[receiver_slot] != SQ_JIT_A64_SLOT_ARRAY_PTR ||
                        !array_ptr_fresh[receiver_slot]) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported PREPCALL append base");
                    }
                    prepared_array_append_base[inst._arg0] = receiver_slot;
                }
                else {
                    SQNativeClosure *native_callee = NULL;
                    SQJitA64MathIntrinsic intrinsic = SQ_JIT_A64_MATH_NONE;
                    SQInteger math_nargs = 0;
                    if(observed_member_native_closure_key(receiver_slot, key,
                        &native_callee) &&
                        sqjit_a64_math_intrinsic_from_native(native_callee,
                        &intrinsic, &math_nargs) &&
                        emit_member_native_closure_guard_key(receiver_slot, key,
                        native_callee)) {
                        prepared_math_intrinsic[inst._arg0] = intrinsic;
                        prepared_math_nargs[inst._arg0] = math_nargs;
                    }
                    else {
                        SQClosure *callee = NULL;
                        if(observed_member_closure(receiver_slot, key_literal,
                            &callee) &&
                            emit_member_closure_guard(receiver_slot, key_literal,
                            callee)) {
                            prepared_direct_closure[inst._arg0] = callee;
                        }
                        else {
                            SQObjectType member_type = OT_NULL;
                            SQInteger member_ptr = 0;
                            if(!observed_member_object_ptr(receiver_slot,
                                key_literal, &member_type, &member_ptr) ||
                                member_type != OT_CLASS ||
                                !emit_member_object_ptr_guard(receiver_slot,
                                key_literal, member_type, member_ptr)) {
                                return sqjit_a64_reject(proto, ip,
                                    "unsupported PREPCALL member");
                            }
                            prepared_class[inst._arg0] =
                                (SQClass *)(intptr_t)member_ptr;
                        }
                    }
                }
                break;
            }
            case _OP_PREPCALLK: {
                if(inst._arg0 < 0 || inst._arg0 >= MAX_FUNC_STACKSIZE ||
                    inst._arg1 < 0 || inst._arg1 >= proto->_nliterals ||
                    sq_type(proto->_literals[inst._arg1]) != OT_STRING ||
                    inst._arg2 < 0 || inst._arg2 >= MAX_FUNC_STACKSIZE) {
                    return sqjit_a64_reject(proto, ip, "unsupported PREPCALLK");
                }

                SQInteger receiver_slot = inst._arg2;
                if(inst._arg3 >= 0 && inst._arg3 < MAX_FUNC_STACKSIZE) {
                    if(inst._arg3 == inst._arg0 ||
                        !copy_any_slot(inst._arg3, inst._arg2)) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported PREPCALLK self copy");
                    }
                    receiver_slot = inst._arg3;
                }
                else if(inst._arg0 == inst._arg2) {
                    return sqjit_a64_reject(proto, ip,
                        "unsupported PREPCALLK self copy");
                }
                if(!mark_unknown_slot(inst._arg0)) {
                    return sqjit_a64_reject(proto, ip, "unsupported PREPCALLK");
                }

                const SQChar *member_name = _stringval(proto->_literals[inst._arg1]);
                if(scstrcmp(member_name, _SC("len")) == 0) {
                    prepared_array_len_base[inst._arg0] = receiver_slot;
                }
                else if(scstrcmp(member_name, _SC("append")) == 0 ||
                    scstrcmp(member_name, _SC("push")) == 0) {
                    if(slot_kind[receiver_slot] != SQ_JIT_A64_SLOT_ARRAY_PTR ||
                        !array_ptr_fresh[receiver_slot]) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported PREPCALLK append base");
                    }
                    prepared_array_append_base[inst._arg0] = receiver_slot;
                }
                else {
                    SQNativeClosure *native_callee = NULL;
                    SQJitA64MathIntrinsic intrinsic = SQ_JIT_A64_MATH_NONE;
                    SQInteger math_nargs = 0;
                    if(observed_member_native_closure_key(receiver_slot,
                        &proto->_literals[inst._arg1], &native_callee) &&
                        sqjit_a64_math_intrinsic_from_native(native_callee,
                        &intrinsic, &math_nargs) &&
                        emit_member_native_closure_guard_key(receiver_slot,
                        &proto->_literals[inst._arg1], native_callee)) {
                        prepared_math_intrinsic[inst._arg0] = intrinsic;
                        prepared_math_nargs[inst._arg0] = math_nargs;
                    }
                    else {
                        SQClosure *callee = NULL;
                        if(observed_member_closure(receiver_slot, inst._arg1,
                            &callee)) {
                            if(!emit_member_closure_guard(receiver_slot,
                                inst._arg1, callee)) {
                                return sqjit_a64_reject(proto, ip,
                                    "unsupported PREPCALLK member");
                            }
                            prepared_direct_closure[inst._arg0] = callee;
                        }
                        else {
                            SQObjectType member_type = OT_NULL;
                            SQInteger member_ptr = 0;
                            if(!observed_member_object_ptr(receiver_slot,
                                inst._arg1, &member_type, &member_ptr) ||
                                member_type != OT_CLASS ||
                                !emit_member_object_ptr_guard(receiver_slot,
                                inst._arg1, member_type, member_ptr)) {
                                return sqjit_a64_reject(proto, ip,
                                    "unsupported PREPCALLK member");
                            }
                            prepared_class[inst._arg0] =
                                (SQClass *)(intptr_t)member_ptr;
                        }
                    }
                }
                break;
            }
            case _OP_CALL:
            case _OP_TAILCALL:
                if(inst._arg1 < 0 || inst._arg1 >= MAX_FUNC_STACKSIZE) {
                    return sqjit_a64_reject(proto, ip, "unsupported CALL");
                }
                if(prepared_array_len_base[inst._arg1] >= 0) {
                    SQInteger base = prepared_array_len_base[inst._arg1];
                    if(inst._arg0 == 0xFF || inst._arg3 != 1 ||
                        !emit_array_len(inst._arg0, base)) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported CALL array len");
                    }
                    clear_prepared_call_slot(inst._arg1);
                }
                else if(prepared_array_append_base[inst._arg1] >= 0) {
                    SQInteger base = prepared_array_append_base[inst._arg1];
                    SQInteger value_slot = inst._arg2 + 1;
                    if(inst._arg3 != 2 || inst._arg2 < 0 ||
                        value_slot < 0 || value_slot >= MAX_FUNC_STACKSIZE ||
                        !emit_array_append_value_unlogged(base, value_slot)) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported CALL array append");
                    }
                    if(inst._arg0 != 0xFF && !copy_any_slot(inst._arg0, base)) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported CALL array append result");
                    }
                    clear_prepared_call_slot(inst._arg1);
                }
                else if(prepared_math_intrinsic[inst._arg1] !=
                    SQ_JIT_A64_MATH_NONE) {
                    SQJitA64MathIntrinsic intrinsic =
                        prepared_math_intrinsic[inst._arg1];
                    SQInteger math_nargs = prepared_math_nargs[inst._arg1];
                    if(inst._arg0 == 0xFF || math_nargs <= 0 ||
                        inst._arg3 != math_nargs + 1 ||
                        !emit_math_call(inst._arg0, intrinsic, math_nargs,
                        inst._arg2 + 1)) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported CALL math");
                    }
                    clear_prepared_call_slot(inst._arg1);
                }
                else if(prepared_direct_closure[inst._arg1]) {
                    SQClosure *callee = prepared_direct_closure[inst._arg1];
                    if(!emit_direct_native_closure_call(inst._arg0, callee,
                        inst._arg2, inst._arg3, ip) &&
                        !emit_inline_simple_accessor_call(callee, inst)) {
                        SQFunctionProto *callee_proto = callee ? callee->_function : NULL;
                        bool callee_can_retry = callee_proto &&
                            (!callee_proto->_jit ||
                            callee_proto->_jit->_eligibility != SQ_JIT_NEVER) &&
                            (!callee_proto->_jit || !callee_proto->_jit->_entry);
                        if(sqjit_diag_trace_enabled() && callee) {
                            scprintf(_SC("[sqjit:a64] direct closure miss proto '%s' ip %d callee '%s'\n"),
                                sqjit_a64_proto_name(proto), (SQInt32)ip,
                                sqjit_a64_proto_name(callee_proto));
                            if(callee_proto) {
                                SQInteger limit = callee_proto->_ninstructions < 8 ?
                                    callee_proto->_ninstructions : 8;
                                for(SQInteger n = 0; n < limit; n++) {
                                    const SQInstruction &ci =
                                        callee_proto->_instructions[n];
                                    scprintf(_SC("[sqjit:a64]   callee ip %d op %d args=%d,%d,%d,%d\n"),
                                        (SQInt32)n, (SQInt32)ci.op,
                                        (SQInt32)ci._arg0, (SQInt32)ci._arg1,
                                        (SQInt32)ci._arg2, (SQInt32)ci._arg3);
                                }
                            }
                        }
                        if(callee_can_retry) {
                            sqjit_diag_mark_transient_reject();
                            return sqjit_a64_reject(proto, ip,
                                "deferred CALL direct closure");
                        }
                        return sqjit_a64_reject(proto, ip,
                            "unsupported CALL direct closure");
                    }
                    clear_prepared_call_slot(inst._arg1);
                }
                else if(prepared_class[inst._arg1]) {
                    SQClass *klass = prepared_class[inst._arg1];
                    if(!emit_class_call(inst._arg0, klass, inst._arg2,
                        inst._arg3)) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported CALL class");
                    }
                    clear_prepared_call_slot(inst._arg1);
                }
                else {
                    return sqjit_a64_reject(proto, ip, "unsupported CALL");
                }
                break;
            case _OP_SET: {
                SQInteger key_literal = literal_index_for_object_ptr_slot(inst._arg2);
                if(key_literal < 0) {
                    if(inst._arg3 >= 0 && inst._arg3 < MAX_FUNC_STACKSIZE &&
                        slot_kind[inst._arg3] == SQ_JIT_A64_SLOT_BOOL) {
                        if(!emit_array_set_bool(inst._arg0, inst._arg1,
                            inst._arg2, inst._arg3)) {
                            return sqjit_a64_reject(proto, ip,
                                "unsupported SET bool array");
                        }
                    }
                    else if(slot_observed_is_float(inst._arg3)) {
                        if(!emit_array_set_float(inst._arg0, inst._arg1,
                            inst._arg2, inst._arg3)) {
                            return sqjit_a64_reject(proto, ip,
                                "unsupported SET float array");
                        }
                    }
                    else if(!emit_array_set_integer(inst._arg0,
                        inst._arg1, inst._arg2, inst._arg3)) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported SET integer array");
                    }
                    break;
                }
                if(inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE &&
                    constructed_array_field_class[inst._arg1]) {
                    SQInteger field_index = -1;
                    if(sqjit_a64_class_field_index(
                        constructed_array_field_class[inst._arg1],
                        &proto->_literals[key_literal], &field_index) &&
                        field_index == constructed_array_field_index[inst._arg1]) {
                        clear_constructed_array_field_slot(inst._arg1);
                    }
                }
                if(inst._arg3 >= 0 && inst._arg3 < MAX_FUNC_STACKSIZE &&
                    slot_kind[inst._arg3] == SQ_JIT_A64_SLOT_BOOL) {
                    if(!emit_member_set_bool_key(inst._arg0, inst._arg1,
                        &proto->_literals[key_literal], inst._arg3)) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported SET bool member");
                    }
                }
                else if(slot_observed_is_float(inst._arg3)) {
                    if(!emit_member_set_float_key(inst._arg0, inst._arg1,
                        &proto->_literals[key_literal], inst._arg3)) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported SET float member");
                    }
                }
                else if(!emit_member_set_integer_key(inst._arg0, inst._arg1,
                    &proto->_literals[key_literal], inst._arg3)) {
                    if(!emit_member_set_object_key(inst._arg0, inst._arg1,
                        &proto->_literals[key_literal], inst._arg3)) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported SET member");
                    }
                }
                break;
            }
            case _OP_ADD:
            case _OP_SUB:
            case _OP_MUL:
            case _OP_DIV:
            case _OP_MOD:
                if(slot_observed_is_float(inst._arg1) ||
                    slot_observed_is_float(inst._arg2)) {
                    if(inst.op == _OP_MOD ||
                        !emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                        return false;
                    }
                }
                else if(!emit_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                    return false;
                }
                break;
            case _OP_NEG:
                if(slot_observed_is_float(inst._arg1)) {
                    if(!emit_float_neg(inst._arg0, inst._arg1)) {
                        return false;
                    }
                }
                else if(!emit_integer_neg(inst._arg0, inst._arg1)) {
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
            case _OP_NEWOBJ:
                if(inst._arg3 == NOT_ARRAY) {
                    if(!emit_new_array(inst._arg0, inst._arg1)) {
                        return sqjit_a64_reject(proto, ip, "unsupported NEWOBJ array");
                    }
                }
                else if(inst._arg3 == NOT_TABLE) {
                    if(!emit_new_table(inst._arg0, inst._arg1)) {
                        return sqjit_a64_reject(proto, ip, "unsupported NEWOBJ table");
                    }
                }
                else {
                    return sqjit_a64_reject(proto, ip, "unsupported NEWOBJ");
                }
                break;
            case _OP_NEWSLOT:
                if(inst._arg0 != 0xFF ||
                    !emit_table_newslot(inst._arg1, inst._arg2, inst._arg3)) {
                    return sqjit_a64_reject(proto, ip, "unsupported NEWSLOT");
                }
                break;
            case _OP_APPENDARRAY:
                if(inst._arg2 == AAT_STACK) {
                    if(!emit_append_array_stack(inst._arg0, inst._arg1)) {
                        return sqjit_a64_reject(proto, ip, "unsupported APPENDARRAY stack");
                    }
                }
                else if(inst._arg2 == AAT_LITERAL) {
                    if(!emit_append_array_literal(inst._arg0, inst._arg1)) {
                        return sqjit_a64_reject(proto, ip, "unsupported APPENDARRAY literal");
                    }
                }
                else if(inst._arg2 == AAT_INT) {
                    if(!emit_append_array_integer(inst._arg0, sqjit_loadint_value(inst))) {
                        return sqjit_a64_reject(proto, ip, "unsupported APPENDARRAY int");
                    }
                }
                else if(inst._arg2 == AAT_FLOAT) {
                    if(!emit_append_array_float_bits(inst._arg0, (SQInteger)inst._arg1)) {
                        return sqjit_a64_reject(proto, ip, "unsupported APPENDARRAY float");
                    }
                }
                else if(inst._arg2 == AAT_BOOL) {
                    if(!emit_append_array_bool(inst._arg0, inst._arg1)) {
                        return sqjit_a64_reject(proto, ip, "unsupported APPENDARRAY bool");
                    }
                }
                else {
                    return sqjit_a64_reject(proto, ip, "unsupported APPENDARRAY kind");
                }
                break;
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
                if(target_ip < 0 || target_ip >= proto->_ninstructions) {
                    return sqjit_a64_reject(proto, ip, "unsupported JZ target or operand");
                }
                if(known_const[inst._arg0]) {
                    if(const_value[inst._arg0] == 0) {
                        if(!sqjit_a64_emit_b_placeholder(&buf, &patch_offset) ||
                            !sqjit_a64_record_reloc(relocs, &nrelocs, 512,
                            patch_offset, target_ip, false, 0)) {
                            return sqjit_a64_reject(proto, ip,
                                "unsupported JZ target or operand");
                        }
                        if(target_ip > ip) {
                            dead_until_ip = target_ip;
                        }
                    }
                    break;
                }
                if(!ensure_int_slot(inst._arg0) ||
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
                previous_effective_return = true;
                if(inst._arg0 == 0xFF) {
                    if(return_shape_reachable) {
                        record_unknown_return_shape();
                    }
                    if(!sqjit_a64_emit_mov_imm_w(&buf, 9, (uint32_t)OT_NULL) ||
                        !sqjit_a64_emit_str_w(&buf, 9, 20, (SQInteger)offsetof(SQObject, _type)) ||
                        !sqjit_a64_emit_mov_imm_x(&buf, 10, 0) ||
                        !sqjit_a64_emit_str_x(&buf, 10, 20, (SQInteger)offsetof(SQObject, _unVal)) ||
                        !emit_write_log_release(false) ||
                        !sqjit_a64_emit_epilogue(&buf, frame_size, SQ_JIT_NATIVE_RETURNED)) {
                        return sqjit_a64_reject(proto, ip, "unsupported null RETURN");
                    }
                    break;
                }
                if(slot_kind[inst._arg1] == SQ_JIT_A64_SLOT_ARRAY_PTR ||
                    slot_kind[inst._arg1] == SQ_JIT_A64_SLOT_OBJECT_PTR ||
                    slot_kind[inst._arg1] == SQ_JIT_A64_SLOT_STACK_OBJECT) {
                    if(return_shape_reachable) {
                        record_return_shape(inst._arg1);
                    }
                    if(!emit_return_object_slot(inst._arg1) ||
                        !emit_write_log_release(false) ||
                        !sqjit_a64_emit_epilogue(&buf, frame_size,
                            SQ_JIT_NATIVE_RETURNED)) {
                        return sqjit_a64_reject(proto, ip, "unsupported object RETURN value");
                    }
                    break;
                }
                if(return_shape_reachable) {
                    record_unknown_return_shape();
                }
                if((slot_kind[inst._arg1] == SQ_JIT_A64_SLOT_FLOAT ?
                    !ensure_float_slot(inst._arg1) : !ensure_int_slot(inst._arg1)) ||
                    !sqjit_a64_emit_store_out_scalar(&buf,
                        slot_kind[inst._arg1] == SQ_JIT_A64_SLOT_FLOAT ? OT_FLOAT : OT_INTEGER,
                        inst._arg1, slot_kind[inst._arg1]) ||
                    !emit_write_log_release(false) ||
                    !sqjit_a64_emit_epilogue(&buf, frame_size, SQ_JIT_NATIVE_RETURNED)) {
                    return sqjit_a64_reject(proto, ip, "unsupported RETURN value");
                }
                break;
            default:
                return sqjit_a64_reject(proto, ip,
                    sqjit_a64_unsupported_opcode_reason(inst.op));
        }
    }

    SQInteger guard_fail_offset = buf.size;
    if(!emit_write_log_release(true) ||
        !sqjit_a64_emit_epilogue(&buf, frame_size, SQ_JIT_NATIVE_GUARD_FAILED)) {
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

    if(!sqjit_a64_install_raw(&native->_native_entry, &native->_native_size, &buf)) {
        return false;
    }
    if(return_shape_seen && !return_shape_conflict && return_shape_class) {
        native->_return_shape = SQ_JIT_NATIVE_RETURN_ARRAY_FIELD_INSTANCE;
        native->_return_shape_class = return_shape_class;
        native->_return_shape_field_index = return_shape_field_index;
    }
    else {
        native->_return_shape = SQ_JIT_NATIVE_RETURN_UNKNOWN;
        native->_return_shape_class = NULL;
        native->_return_shape_field_index = -1;
    }
    return true;
}

void sqjit_backend_native_free(void *entry, SQInteger size)
{
    if(entry && size > 0) {
        munmap(entry, size);
    }
}

bool sqjit_backend_compile_proto(SQFunctionProto *proto, SQObjectPtr *entry_stack,
    SQClosure *closure, SQJitNative *native)
{
    return sqjit_a64_compile_integer_proto(proto, entry_stack, closure, native);
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
        case _OP_NEG:
            return inst._arg1 == slot;
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
        case _OP_COMPARITH: {
            SQInteger source = (SQInteger)(((SQUnsignedInteger)inst._arg1 & 0xFFFF0000u) >> 16);
            SQInteger value = (SQInteger)((SQUnsignedInteger)inst._arg1 & 0x0000FFFFu);
            return source == slot || inst._arg2 == slot || value == slot;
        }
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
        case _OP_NEG:
            return inst._arg1 == slot;
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
            return inst._arg2 == slot || inst._arg3 == slot;
        case _OP_COMPARITH: {
            SQInteger value = (SQInteger)((SQUnsignedInteger)inst._arg1 & 0x0000FFFFu);
            return inst._arg2 == slot || value == slot;
        }
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
        case _OP_NEG:
        case _OP_EQ:
        case _OP_NE:
        case _OP_GET:
        case _OP_GETK:
        case _OP_CMP:
        case _OP_COMPARITH:
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

struct SQJitA64LoopLenHoist {
    bool valid;
    SQInteger prepcall_ip;
    SQInteger call_ip;
    SQInteger base_slot;
    SQInteger len_slot;
    SQInteger local_slot;
};

static bool sqjit_a64_literal_is_string(SQFunctionProto *proto, SQInteger index,
    const SQChar *value)
{
    return proto && index >= 0 && index < proto->_nliterals &&
        sq_type(proto->_literals[index]) == OT_STRING &&
        scstrcmp(_stringval(proto->_literals[index]), value) == 0;
}

static bool sqjit_a64_loop_len_hoist_is_safe(SQFunctionProto *proto,
    SQInteger start_ip, SQInteger header_ip, SQInteger end_ip,
    const SQJitA64LoopLenHoist &hoist)
{
    if(!proto || !hoist.valid || start_ip < 0 || header_ip <= start_ip ||
        end_ip <= header_ip || end_ip >= proto->_ninstructions) {
        return false;
    }

    for(SQInteger ip = start_ip; ip < hoist.prepcall_ip; ip++) {
        if(sqjit_a64_loop_instruction_writes_slot(proto->_instructions[ip],
            hoist.base_slot)) {
            return false;
        }
    }

    for(SQInteger ip = hoist.call_ip + 1; ip < header_ip; ip++) {
        const SQInstruction &inst = proto->_instructions[ip];
        if(inst.op != _OP_LINE && sqjit_a64_loop_instruction_reads_slot(inst,
            hoist.len_slot)) {
            return false;
        }
    }

    for(SQInteger ip = header_ip + 1; ip < end_ip; ip++) {
        const SQInstruction &inst = proto->_instructions[ip];
        if(sqjit_a64_loop_instruction_writes_slot(inst, hoist.base_slot)) {
            return false;
        }
        switch(inst.op) {
            case _OP_TAILCALL:
            case _OP_CALL:
            case _OP_PREPCALL:
            case _OP_PREPCALLK:
            case _OP_NEWSLOT:
            case _OP_NEWSLOTA:
            case _OP_DELETE:
            case _OP_NEWOBJ:
            case _OP_APPENDARRAY:
            case _OP_CLOSURE:
            case _OP_YIELD:
            case _OP_RESUME:
            case _OP_FOREACH:
            case _OP_POSTFOREACH:
            case _OP_CLONE:
            case _OP_PUSHTRAP:
            case _OP_POPTRAP:
            case _OP_THROW:
                return false;
            default:
                break;
        }
    }

    return true;
}

static SQJitA64LoopLenHoist sqjit_a64_loop_find_len_hoist(SQFunctionProto *proto,
    SQObjectPtr *entry_stack, SQInteger start_ip, SQInteger header_ip,
    SQInteger end_ip)
{
    SQJitA64LoopLenHoist hoist;
    hoist.valid = false;
    hoist.prepcall_ip = -1;
    hoist.call_ip = -1;
    hoist.base_slot = -1;
    hoist.len_slot = -1;
    hoist.local_slot = -1;

    if(!proto || !entry_stack || start_ip < 0 || header_ip <= start_ip ||
        header_ip >= proto->_ninstructions || end_ip <= header_ip ||
        end_ip >= proto->_ninstructions ||
        proto->_instructions[header_ip].op != _OP_JCMP) {
        return hoist;
    }

    const SQInstruction &header = proto->_instructions[header_ip];
    for(SQInteger ip = start_ip; ip + 1 < header_ip; ip++) {
        const SQInstruction &prep = proto->_instructions[ip];
        if(prep.op != _OP_PREPCALLK ||
            !sqjit_a64_literal_is_string(proto, prep._arg1, _SC("len"))) {
            continue;
        }

        const SQInstruction &call = proto->_instructions[ip + 1];
        if(call.op != _OP_CALL || call._arg1 != prep._arg0 ||
            call._arg0 == 0xFF || call._arg3 != 1 ||
            (call._arg0 != header._arg0 && call._arg0 != header._arg2) ||
            prep._arg2 < 0 || prep._arg2 >= proto->_stacksize ||
            sq_type(entry_stack[prep._arg2]) != OT_ARRAY) {
            continue;
        }

        hoist.valid = true;
        hoist.prepcall_ip = ip;
        hoist.call_ip = ip + 1;
        hoist.base_slot = prep._arg2;
        hoist.len_slot = call._arg0;
        if(sqjit_a64_loop_len_hoist_is_safe(proto, start_ip, header_ip,
            end_ip, hoist)) {
            return hoist;
        }
        hoist.valid = false;
    }

    return hoist;
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
    SQClosure *closure, SQInteger start_ip, SQInteger header_ip,
    SQInteger end_ip, SQInteger exit_ip, SQJitProto *jit)
{
    if(!proto || !entry_stack || !jit || start_ip < 0 || header_ip < start_ip ||
        end_ip < header_ip || exit_ip <= header_ip || exit_ip > proto->_ninstructions ||
        proto->_stacksize <= 0 || proto->_stacksize > MAX_FUNC_STACKSIZE ||
        proto->_ninstructions > 512 || end_ip - start_ip > 512) {
        return false;
    }

    for(SQInteger ip = start_ip; ip <= end_ip; ip++) {
        const SQInstruction &inst = proto->_instructions[ip];
        if(ip == header_ip && (inst.op == _OP_JCMP || inst.op == _OP_JZ)) {
            SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
            if(target_ip == exit_ip) {
                continue;
            }
        }
        if(ip == end_ip && inst.op == _OP_JMP) {
            SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
            if(target_ip >= start_ip && target_ip <= header_ip) {
                continue;
            }
        }
        if(inst.op == _OP_JMP || inst.op == _OP_JZ || inst.op == _OP_JCMP) {
            return sqjit_a64_reject(proto, ip, "unsupported loop branch shape");
        }
    }
    SQJitA64LoopLenHoist len_hoist = sqjit_a64_loop_find_len_hoist(proto,
        entry_stack, start_ip, header_ip, end_ip);
    if(sqjit_diag_trace_enabled() && len_hoist.valid) {
        scprintf(_SC("[sqjit:a64] hoisting array len in native loop proto '%s' at ip %d base=%d\n"),
            sqjit_a64_proto_name(proto), (SQInt32)header_ip,
            (SQInt32)len_hoist.base_slot);
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
    SQArray *array_ptr_observed[MAX_FUNC_STACKSIZE];
    SQInteger object_ptr_observed[MAX_FUNC_STACKSIZE];
    SQObjectType object_ptr_observed_type[MAX_FUNC_STACKSIZE];
    SQInteger prepared_array_len_base[MAX_FUNC_STACKSIZE];
    SQInteger prepared_array_append_base[MAX_FUNC_STACKSIZE];
    SQClosure *prepared_direct_closure[MAX_FUNC_STACKSIZE];
    SQJitA64MathIntrinsic prepared_math_intrinsic[MAX_FUNC_STACKSIZE];
    SQInteger prepared_math_nargs[MAX_FUNC_STACKSIZE];
    SQJitA64NumberConversion prepared_number_conversion[MAX_FUNC_STACKSIZE];
    SQInteger prepared_number_conversion_base[MAX_FUNC_STACKSIZE];
    bool known_const[MAX_FUNC_STACKSIZE];
    bool entry_loaded[MAX_FUNC_STACKSIZE];
    bool dirty_slot[MAX_FUNC_STACKSIZE];
    SQInteger const_value[MAX_FUNC_STACKSIZE];

    for(SQInteger n = 0; n < 513; n++) {
        ip_to_offset[n] = -1;
    }
    for(SQInteger n = 0; n < MAX_FUNC_STACKSIZE; n++) {
        slot_kind[n] = n < proto->_stacksize ? SQ_JIT_A64_SLOT_STACK_OBJECT :
            SQ_JIT_A64_SLOT_UNKNOWN;
        stack_object_reg[n] = n < proto->_stacksize ? n : -1;
        array_ptr_observed[n] = NULL;
        object_ptr_observed[n] = 0;
        object_ptr_observed_type[n] = OT_NULL;
        prepared_array_len_base[n] = -1;
        prepared_array_append_base[n] = -1;
        prepared_direct_closure[n] = NULL;
        prepared_math_intrinsic[n] = SQ_JIT_A64_MATH_NONE;
        prepared_math_nargs[n] = 0;
        prepared_number_conversion[n] = SQ_JIT_A64_NUMBER_CONVERSION_NONE;
        prepared_number_conversion_base[n] = -1;
        known_const[n] = false;
        entry_loaded[n] = false;
        dirty_slot[n] = false;
        const_value[n] = 0;
    }

    const SQObjectPtr *root_object = NULL;
    if(closure && closure->_root && sq_type(closure->_root->_obj) != OT_NULL) {
        root_object = (const SQObjectPtr *)&closure->_root->_obj;
    }

    bool uses_write_log = false;
    for(SQInteger ip = start_ip; ip <= end_ip; ip++) {
        if(len_hoist.valid &&
            (ip == len_hoist.prepcall_ip || ip == len_hoist.call_ip)) {
            continue;
        }
        const SQInstruction &inst = proto->_instructions[ip];
        if(inst.op == _OP_SET || inst.op == _OP_COMPARITH || inst.op == _OP_CALL ||
            (inst.op == _OP_PREPCALLK && inst._arg1 >= 0 &&
            inst._arg1 < proto->_nliterals &&
            sq_type(proto->_literals[inst._arg1]) == OT_STRING &&
            (scstrcmp(_stringval(proto->_literals[inst._arg1]), _SC("append")) == 0 ||
            scstrcmp(_stringval(proto->_literals[inst._arg1]), _SC("push")) == 0))) {
            uses_write_log = true;
            break;
        }
    }
    SQInteger inline_scratch_base = proto->_stacksize;
    SQInteger write_log_slot = MAX_FUNC_STACKSIZE;
    SQInteger body_entered_slot = MAX_FUNC_STACKSIZE + (uses_write_log ? 1 : 0);
    if(len_hoist.valid) {
        len_hoist.local_slot = body_entered_slot + 1;
    }
    SQInteger local_slots = body_entered_slot + 1 + (len_hoist.valid ? 1 : 0);
    SQInteger frame_size = local_slots * (SQInteger)sizeof(SQInteger);
    frame_size = (frame_size + 15) & ~(SQInteger)15;
    if(frame_size <= 0 || frame_size > 4095) {
        return false;
    }

    SQJitA64Buffer buf;
    buf.size = 0;
    if(!sqjit_a64_emit_prologue(&buf, frame_size)) {
        return false;
    }
    if(uses_write_log &&
        (!sqjit_a64_emit_mov_imm_x(&buf, 9, 0) ||
        !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(write_log_slot)))) {
        return false;
    }
    if(!sqjit_a64_emit_mov_imm_x(&buf, 9, 0) ||
        !sqjit_a64_emit_str_x(&buf, 9, 31,
        sqjit_a64_local_disp(body_entered_slot))) {
        return false;
    }

    auto emit_guard_fail_branch = [&](unsigned cond) -> bool {
        SQInteger patch_offset = 0;
        return sqjit_a64_emit_bcond_placeholder(&buf, cond, &patch_offset) &&
            sqjit_a64_record_reloc(guard_relocs, &nguard_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1,
                true, cond);
    };

    auto emit_write_log_release = [&](bool rollback) -> bool {
        if(!uses_write_log) {
            return true;
        }
        return sqjit_a64_emit_add_imm(&buf, 0, 31, sqjit_a64_local_disp(write_log_slot)) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)(rollback ?
                (const void *)sqjit_a64_helper_write_log_rollback :
                (const void *)sqjit_a64_helper_write_log_commit)) &&
            sqjit_a64_emit_blr_x16(&buf);
    };

    auto emit_mark_body_entered = [&]() -> bool {
        return sqjit_a64_emit_mov_imm_x(&buf, 9, 1) &&
            sqjit_a64_emit_str_x(&buf, 9, 31,
            sqjit_a64_local_disp(body_entered_slot));
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
        if(!sqjit_a64_emit_type_guard(&buf, stack_object_reg[slot],
            OT_INTEGER, guard_relocs, &nguard_relocs) ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 19, sqjit_a64_stack_value_disp(stack_object_reg[slot])) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(slot))) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_A64_SLOT_INT;
        stack_object_reg[slot] = -1;
        array_ptr_observed[slot] = NULL;
        object_ptr_observed[slot] = 0;
        object_ptr_observed_type[slot] = OT_NULL;
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
        if(!sqjit_a64_emit_type_guard(&buf, stack_object_reg[slot],
            OT_FLOAT, guard_relocs, &nguard_relocs) ||
            !sqjit_a64_emit_ldr_s(&buf, 0, 19, sqjit_a64_stack_value_disp(stack_object_reg[slot])) ||
            !sqjit_a64_emit_str_s(&buf, 0, 31, sqjit_a64_local_disp(slot))) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_A64_SLOT_FLOAT;
        stack_object_reg[slot] = -1;
        array_ptr_observed[slot] = NULL;
        object_ptr_observed[slot] = 0;
        object_ptr_observed_type[slot] = OT_NULL;
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
        array_ptr_observed[slot] = NULL;
        object_ptr_observed[slot] = 0;
        object_ptr_observed_type[slot] = OT_NULL;
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
        array_ptr_observed[slot] = NULL;
        object_ptr_observed[slot] = 0;
        object_ptr_observed_type[slot] = OT_NULL;
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
        array_ptr_observed[slot] = NULL;
        object_ptr_observed[slot] = 0;
        object_ptr_observed_type[slot] = OT_NULL;
        known_const[slot] = false;
        dirty_slot[slot] = true;
        return true;
    };

    auto mark_array_ptr_slot = [&](SQInteger slot, SQArray *observed_array) -> bool {
        if(slot == 0xFF) {
            return true;
        }
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_A64_SLOT_ARRAY_PTR;
        stack_object_reg[slot] = -1;
        array_ptr_observed[slot] = observed_array;
        object_ptr_observed[slot] = 0;
        object_ptr_observed_type[slot] = OT_NULL;
        known_const[slot] = false;
        dirty_slot[slot] = true;
        return true;
    };

    auto mark_object_ptr_slot = [&](SQInteger slot, SQObjectType observed_type,
        SQInteger observed_ptr) -> bool {
        if(slot == 0xFF) {
            return true;
        }
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE ||
            !sqjit_a64_type_is_object_ptr(observed_type)) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_A64_SLOT_OBJECT_PTR;
        stack_object_reg[slot] = -1;
        array_ptr_observed[slot] = NULL;
        object_ptr_observed[slot] = observed_ptr;
        object_ptr_observed_type[slot] = observed_type;
        known_const[slot] = false;
        dirty_slot[slot] = true;
        return true;
    };

    auto mark_stack_object_slot = [&](SQInteger slot, SQInteger stack_reg) -> bool {
        if(slot == 0xFF) {
            return true;
        }
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE ||
            stack_reg < 0 || stack_reg >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_A64_SLOT_STACK_OBJECT;
        stack_object_reg[slot] = stack_reg;
        array_ptr_observed[slot] = NULL;
        object_ptr_observed[slot] = 0;
        object_ptr_observed_type[slot] = OT_NULL;
        known_const[slot] = false;
        entry_loaded[slot] = true;
        dirty_slot[slot] = false;
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

    auto load_literal_value_slot = [&](SQInteger dst, const SQObjectPtr &literal) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(sq_type(literal) == OT_INTEGER) {
            return emit_load_int(dst, _integer(literal));
        }
        if(sq_type(literal) == OT_FLOAT) {
            return emit_load_float(dst, _float(literal));
        }
        if(sq_type(literal) == OT_ARRAY) {
            if(!sqjit_a64_emit_mov_imm_x(&buf, 9,
                (SQInteger)(intptr_t)_array(literal)) ||
                !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) ||
                !mark_array_ptr_slot(dst, _array(literal))) {
                return false;
            }
            entry_loaded[dst] = false;
            return true;
        }
        if(sqjit_a64_type_is_object_ptr(sq_type(literal))) {
            SQInteger object_ptr = 0;
            if(!sqjit_a64_value_to_object_ptr(literal, sq_type(literal),
                &object_ptr) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 9, object_ptr) ||
                !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) ||
                !mark_object_ptr_slot(dst, sq_type(literal), object_ptr)) {
                return false;
            }
            entry_loaded[dst] = false;
            return true;
        }
        return false;
    };

    auto load_literal_slot = [&](SQInteger dst, SQInteger literal_index) -> bool {
        if(literal_index < 0 || literal_index >= proto->_nliterals) {
            return false;
        }
        return load_literal_value_slot(dst, proto->_literals[literal_index]);
    };

    auto copy_int_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == 0xFF) {
            return true;
        }
        bool src_bool = src >= 0 && src < MAX_FUNC_STACKSIZE &&
            slot_kind[src] == SQ_JIT_A64_SLOT_BOOL;
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || !ensure_int_slot(src) ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(src)) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst))) {
            return false;
        }
        if(src_bool) {
            if(!mark_bool_slot(dst)) {
                return false;
            }
        }
        else if(!mark_int_slot(dst)) {
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

    auto copy_array_ptr_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == 0xFF) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            src < 0 || src >= MAX_FUNC_STACKSIZE ||
            slot_kind[src] != SQ_JIT_A64_SLOT_ARRAY_PTR ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(src)) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) ||
            !mark_array_ptr_slot(dst, array_ptr_observed[src])) {
            return false;
        }
        entry_loaded[dst] = entry_loaded[src];
        return true;
    };

    auto copy_stack_object_alias = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == 0xFF) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            src < 0 || src >= MAX_FUNC_STACKSIZE ||
            slot_kind[src] != SQ_JIT_A64_SLOT_STACK_OBJECT ||
            stack_object_reg[src] < 0) {
            return false;
        }
        slot_kind[dst] = SQ_JIT_A64_SLOT_STACK_OBJECT;
        stack_object_reg[dst] = stack_object_reg[src];
        array_ptr_observed[dst] = NULL;
        object_ptr_observed[dst] = 0;
        object_ptr_observed_type[dst] = OT_NULL;
        known_const[dst] = false;
        entry_loaded[dst] = entry_loaded[src];
        dirty_slot[dst] = false;
        return true;
    };

    auto copy_object_ptr_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == 0xFF) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            src < 0 || src >= MAX_FUNC_STACKSIZE ||
            slot_kind[src] != SQ_JIT_A64_SLOT_OBJECT_PTR ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(src)) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) ||
            !mark_object_ptr_slot(dst, object_ptr_observed_type[src],
            object_ptr_observed[src])) {
            return false;
        }
        entry_loaded[dst] = entry_loaded[src];
        return true;
    };

    auto copy_any_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(src < 0 || src >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slot_kind[src] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            return copy_array_ptr_slot(dst, src);
        }
        if(slot_kind[src] == SQ_JIT_A64_SLOT_FLOAT) {
            return copy_float_slot(dst, src);
        }
        if(slot_kind[src] == SQ_JIT_A64_SLOT_STACK_OBJECT) {
            SQInteger reg = stack_object_reg[src];
            if(reg < 0) {
                return false;
            }
            if(sq_type(entry_stack[reg]) == OT_FLOAT) {
                return copy_float_slot(dst, src);
            }
            if(sq_type(entry_stack[reg]) == OT_INTEGER) {
                return copy_int_slot(dst, src);
            }
            if(sq_type(entry_stack[reg]) == OT_BOOL) {
                return false;
            }
            return copy_stack_object_alias(dst, src);
        }
        if(slot_kind[src] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            return copy_object_ptr_slot(dst, src);
        }
        return copy_int_slot(dst, src);
    };

    auto slot_is_float = [&](SQInteger slot) -> bool {
        return slot >= 0 && slot < MAX_FUNC_STACKSIZE && slot_kind[slot] == SQ_JIT_A64_SLOT_FLOAT;
    };

    auto slot_observed_is_float = [&](SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slot_kind[slot] == SQ_JIT_A64_SLOT_FLOAT) {
            return true;
        }
        return entry_stack && slot_kind[slot] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[slot] >= 0 &&
            sq_type(entry_stack[stack_object_reg[slot]]) == OT_FLOAT;
    };

    auto emit_load_slot_as_float = [&](SQInteger slot, unsigned fp_reg,
        unsigned int_reg) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slot_kind[slot] == SQ_JIT_A64_SLOT_FLOAT) {
            return ensure_float_slot(slot) &&
                sqjit_a64_emit_ldr_s(&buf, fp_reg, 31,
                    sqjit_a64_local_disp(slot));
        }
        if(slot_kind[slot] == SQ_JIT_A64_SLOT_INT ||
            slot_kind[slot] == SQ_JIT_A64_SLOT_BOOL) {
            return ensure_int_slot(slot) &&
                sqjit_a64_emit_ldr_x(&buf, int_reg, 31,
                    sqjit_a64_local_disp(slot)) &&
                sqjit_a64_emit_scvtf_s_x(&buf, fp_reg, int_reg);
        }
        if(slot_kind[slot] != SQ_JIT_A64_SLOT_STACK_OBJECT ||
            stack_object_reg[slot] < 0 || !entry_stack) {
            return false;
        }

        SQInteger stack_reg = stack_object_reg[slot];
        SQObjectType observed = sq_type(entry_stack[stack_reg]);
        if(observed != OT_FLOAT && observed != OT_INTEGER) {
            return false;
        }
        if(observed == OT_FLOAT) {
            return sqjit_a64_emit_type_guard(&buf, stack_reg, OT_FLOAT,
                    guard_relocs, &nguard_relocs) &&
                sqjit_a64_emit_ldr_s(&buf, fp_reg, 19,
                    sqjit_a64_stack_value_disp(stack_reg));
        }
        return sqjit_a64_emit_type_guard(&buf, stack_reg, OT_INTEGER,
                guard_relocs, &nguard_relocs) &&
            sqjit_a64_emit_ldr_x(&buf, int_reg, 19,
                sqjit_a64_stack_value_disp(stack_reg)) &&
            sqjit_a64_emit_scvtf_s_x(&buf, fp_reg, int_reg);
    };

    auto emit_conditional_select = [&](CmpOP op, SQInteger dst, SQInteger cmp_left,
        SQInteger cmp_right, SQInteger true_src, SQInteger false_src) -> bool {
        unsigned false_cond = 0;
        if(!sqjit_a64_cmp_false_cond(op, &false_cond) ||
            cmp_left < 0 || cmp_right < 0 ||
            cmp_left >= MAX_FUNC_STACKSIZE || cmp_right >= MAX_FUNC_STACKSIZE) {
            return false;
        }

        bool use_float = slot_observed_is_float(cmp_left) ||
            slot_observed_is_float(cmp_right) ||
            slot_observed_is_float(true_src) ||
            slot_observed_is_float(false_src);
        if(dst == 0xFF) {
            return use_float ?
                (ensure_float_slot(cmp_left) && ensure_float_slot(cmp_right)) :
                (ensure_int_slot(cmp_left) && ensure_int_slot(cmp_right));
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            true_src < 0 || true_src >= MAX_FUNC_STACKSIZE ||
            false_src < 0 || false_src >= MAX_FUNC_STACKSIZE) {
            return false;
        }

        SQInteger false_patch = 0;
        SQInteger end_patch = 0;
        if(use_float) {
            if(!ensure_float_slot(cmp_left) || !ensure_float_slot(cmp_right) ||
                !ensure_float_slot(true_src) || !ensure_float_slot(false_src) ||
                !sqjit_a64_emit_ldr_s(&buf, 0, 31, sqjit_a64_local_disp(cmp_left)) ||
                !sqjit_a64_emit_ldr_s(&buf, 1, 31, sqjit_a64_local_disp(cmp_right)) ||
                !sqjit_a64_emit_fcmp_s(&buf, 0, 1) ||
                !sqjit_a64_emit_bcond_placeholder(&buf, false_cond, &false_patch) ||
                !sqjit_a64_emit_ldr_s(&buf, 0, 31, sqjit_a64_local_disp(true_src)) ||
                !sqjit_a64_emit_str_s(&buf, 0, 31, sqjit_a64_local_disp(dst)) ||
                !sqjit_a64_emit_b_placeholder(&buf, &end_patch)) {
                return false;
            }
            SQInteger false_offset = buf.size;
            if(!sqjit_a64_emit_ldr_s(&buf, 0, 31, sqjit_a64_local_disp(false_src)) ||
                !sqjit_a64_emit_str_s(&buf, 0, 31, sqjit_a64_local_disp(dst))) {
                return false;
            }
            SQInteger end_offset = buf.size;
            if(!sqjit_a64_patch_branch(&buf, false_patch, false_offset, true,
                false_cond) ||
                !sqjit_a64_patch_branch(&buf, end_patch, end_offset, false, 0) ||
                !mark_float_slot(dst)) {
                return false;
            }
        }
        else {
            if(!ensure_int_slot(cmp_left) || !ensure_int_slot(cmp_right) ||
                !ensure_int_slot(true_src) || !ensure_int_slot(false_src) ||
                !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(cmp_left)) ||
                !sqjit_a64_emit_ldr_x(&buf, 10, 31, sqjit_a64_local_disp(cmp_right)) ||
                !sqjit_a64_emit_cmp_reg(&buf, 9, 10) ||
                !sqjit_a64_emit_bcond_placeholder(&buf, false_cond, &false_patch) ||
                !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(true_src)) ||
                !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) ||
                !sqjit_a64_emit_b_placeholder(&buf, &end_patch)) {
                return false;
            }
            SQInteger false_offset = buf.size;
            if(!sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(false_src)) ||
                !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst))) {
                return false;
            }
            SQInteger end_offset = buf.size;
            if(!sqjit_a64_patch_branch(&buf, false_patch, false_offset, true,
                false_cond) ||
                !sqjit_a64_patch_branch(&buf, end_patch, end_offset, false, 0) ||
                !mark_int_slot(dst)) {
                return false;
            }
        }
        entry_loaded[dst] = entry_loaded[true_src] || entry_loaded[false_src];
        return true;
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

    auto emit_load_nulls = [&](SQInteger start, SQInteger count) -> bool {
        if(start < 0 || count < 0 || start + count > MAX_FUNC_STACKSIZE ||
            !sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 1, start) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 2, count) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16,
            (SQInteger)(intptr_t)sqjit_a64_helper_load_nulls) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        for(SQInteger n = 0; n < count; n++) {
            SQInteger slot = start + n;
            slot_kind[slot] = SQ_JIT_A64_SLOT_STACK_OBJECT;
            stack_object_reg[slot] = slot;
            array_ptr_observed[slot] = NULL;
            object_ptr_observed[slot] = 0;
            object_ptr_observed_type[slot] = OT_NULL;
            prepared_array_len_base[slot] = -1;
            prepared_array_append_base[slot] = -1;
            prepared_direct_closure[slot] = NULL;
            prepared_math_intrinsic[slot] = SQ_JIT_A64_MATH_NONE;
            prepared_math_nargs[slot] = 0;
            prepared_number_conversion[slot] = SQ_JIT_A64_NUMBER_CONVERSION_NONE;
            prepared_number_conversion_base[slot] = -1;
            known_const[slot] = false;
            entry_loaded[slot] = true;
            dirty_slot[slot] = false;
        }
        return true;
    };

    auto emit_float_binary = [&](SQOpcode op, SQInteger dst, SQInteger left,
        SQInteger right) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || op == _OP_MOD ||
            !emit_load_slot_as_float(left, 0, 9) ||
            !emit_load_slot_as_float(right, 1, 10) ||
            !sqjit_a64_emit_fop_s(&buf, op, 0, 0, 1) ||
            !sqjit_a64_emit_str_s(&buf, 0, 31, sqjit_a64_local_disp(dst)) ||
            !mark_float_slot(dst)) {
            return false;
        }
        entry_loaded[dst] = entry_loaded[left] || entry_loaded[right];
        return true;
    };

    auto emit_integer_neg = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || !ensure_int_slot(src) ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 31, sqjit_a64_local_disp(src)) ||
            !sqjit_a64_emit_sub_reg(&buf, 9, 31, 9) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) ||
            !mark_int_slot(dst)) {
            return false;
        }
        entry_loaded[dst] = entry_loaded[src];
        return true;
    };

    auto emit_float_neg = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || !ensure_float_slot(src) ||
            !sqjit_a64_emit_ldr_s(&buf, 0, 31, sqjit_a64_local_disp(src)) ||
            !sqjit_a64_emit_fneg_s(&buf, 0, 0) ||
            !sqjit_a64_emit_str_s(&buf, 0, 31, sqjit_a64_local_disp(dst)) ||
            !mark_float_slot(dst)) {
            return false;
        }
        entry_loaded[dst] = entry_loaded[src];
        return true;
    };

    auto emit_math_call = [&](SQInteger dst, SQJitA64MathIntrinsic intrinsic,
        SQInteger nargs, SQInteger first_arg) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || first_arg < 0 ||
            first_arg >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(nargs == 1) {
            if(!ensure_float_slot(first_arg) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 0, (SQInteger)intrinsic) ||
                !sqjit_a64_emit_add_imm(&buf, 1, 31,
                sqjit_a64_local_disp(first_arg)) ||
                !sqjit_a64_emit_add_imm(&buf, 2, 31, sqjit_a64_local_disp(dst)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)(const void *)sqjit_a64_helper_math_unary) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero() ||
                !mark_float_slot(dst)) {
                return false;
            }
            entry_loaded[dst] = true;
            return true;
        }
        if(nargs == 2) {
            SQInteger second_arg = first_arg + 1;
            if(second_arg < 0 || second_arg >= MAX_FUNC_STACKSIZE ||
                !ensure_float_slot(first_arg) || !ensure_float_slot(second_arg) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 0, (SQInteger)intrinsic) ||
                !sqjit_a64_emit_add_imm(&buf, 1, 31,
                sqjit_a64_local_disp(first_arg)) ||
                !sqjit_a64_emit_add_imm(&buf, 2, 31,
                sqjit_a64_local_disp(second_arg)) ||
                !sqjit_a64_emit_add_imm(&buf, 3, 31, sqjit_a64_local_disp(dst)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)(const void *)sqjit_a64_helper_math_binary) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero() ||
                !mark_float_slot(dst)) {
                return false;
            }
            entry_loaded[dst] = true;
            return true;
        }
        return false;
    };

    auto emit_number_conversion = [&](SQInteger dst,
        SQJitA64NumberConversion conversion, SQInteger src) -> bool {
        if(src < 0 || src >= MAX_FUNC_STACKSIZE ||
            conversion == SQ_JIT_A64_NUMBER_CONVERSION_NONE) {
            return false;
        }
        if(dst == 0xFF) {
            if(conversion == SQ_JIT_A64_NUMBER_CONVERSION_TOFLOAT) {
                return slot_observed_is_float(src) ? ensure_float_slot(src) :
                    ensure_int_slot(src);
            }
            if(conversion == SQ_JIT_A64_NUMBER_CONVERSION_TOINTEGER) {
                return slot_observed_is_float(src) ? ensure_float_slot(src) :
                    ensure_int_slot(src);
            }
            return false;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(conversion == SQ_JIT_A64_NUMBER_CONVERSION_TOFLOAT) {
            if(slot_observed_is_float(src)) {
                return copy_float_slot(dst, src);
            }
            if(!ensure_int_slot(src) ||
                !sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(src)) ||
                !sqjit_a64_emit_add_imm(&buf, 1, 31, sqjit_a64_local_disp(dst)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)(const void *)sqjit_a64_helper_integer_to_float) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero() ||
                !mark_float_slot(dst)) {
                return false;
            }
            entry_loaded[dst] = entry_loaded[src];
            return true;
        }
        if(conversion == SQ_JIT_A64_NUMBER_CONVERSION_TOINTEGER) {
            if(!slot_observed_is_float(src)) {
                return copy_int_slot(dst, src);
            }
            if(!ensure_float_slot(src) ||
                !sqjit_a64_emit_add_imm(&buf, 0, 31, sqjit_a64_local_disp(src)) ||
                !sqjit_a64_emit_add_imm(&buf, 1, 31, sqjit_a64_local_disp(dst)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)(const void *)sqjit_a64_helper_float_to_integer) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero() ||
                !mark_int_slot(dst)) {
                return false;
            }
            entry_loaded[dst] = entry_loaded[src];
            return true;
        }
        return false;
    };

    auto emit_closure_slot_guard = [&](SQInteger closure_slot, SQClosure *expected) -> bool {
        if(closure_slot < 0 || closure_slot >= MAX_FUNC_STACKSIZE ||
            slot_kind[closure_slot] != SQ_JIT_A64_SLOT_STACK_OBJECT ||
            stack_object_reg[closure_slot] < 0 || !expected) {
            return false;
        }
        return sqjit_a64_emit_mov_reg(&buf, 0, 19) &&
            sqjit_a64_emit_mov_imm_x(&buf, 1, stack_object_reg[closure_slot]) &&
            sqjit_a64_emit_mov_imm_x(&buf, 2, (SQInteger)(intptr_t)expected) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)(const void *)sqjit_a64_helper_closure_slot_guard) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero();
    };

    auto emit_member_closure_guard = [&](SQInteger base_slot, SQInteger literal_index,
        SQClosure *expected) -> bool {
        if(base_slot < 0 || base_slot >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals ||
            (slot_kind[base_slot] != SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slot_kind[base_slot] != SQ_JIT_A64_SLOT_OBJECT_PTR) || !expected) {
            return false;
        }
        if(slot_kind[base_slot] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            return object_ptr_observed_type[base_slot] != OT_NULL &&
                sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(base_slot)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 1,
                    (SQInteger)object_ptr_observed_type[base_slot]) &&
                sqjit_a64_emit_mov_imm_x(&buf, 2,
                    (SQInteger)(intptr_t)&proto->_literals[literal_index]) &&
                sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)(intptr_t)expected) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)(const void *)sqjit_a64_helper_object_ptr_member_closure_guard) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero();
        }
        return stack_object_reg[base_slot] >= 0 &&
            sqjit_a64_emit_mov_reg(&buf, 0, 19) &&
            sqjit_a64_emit_mov_imm_x(&buf, 1, stack_object_reg[base_slot]) &&
            sqjit_a64_emit_mov_imm_x(&buf, 2,
                (SQInteger)(intptr_t)&proto->_literals[literal_index]) &&
            sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)(intptr_t)expected) &&
            sqjit_a64_emit_mov_imm_x(&buf, 4,
                stack_object_reg[base_slot] == 0 && root_object ?
                (SQInteger)(intptr_t)root_object : 0) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)(const void *)sqjit_a64_helper_member_closure_guard) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero();
    };

    auto observed_member_closure = [&](SQInteger base_slot, SQInteger literal_index,
        SQClosure **out) -> bool {
        if(!out) {
            return false;
        }
        *out = NULL;
        if(base_slot < 0 || base_slot >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals) {
            return false;
        }

        SQObjectPtr value;
        bool ok = false;
        if(slot_kind[base_slot] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            ok = sqjit_a64_get_member_ptr_value(object_ptr_observed[base_slot],
                object_ptr_observed_type[base_slot], &proto->_literals[literal_index],
                value);
        }
        else if(slot_kind[base_slot] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[base_slot] >= 0) {
            ok = sqjit_a64_get_member_value_with_root(entry_stack,
                stack_object_reg[base_slot], &proto->_literals[literal_index],
                stack_object_reg[base_slot] == 0 ? root_object : NULL, value);
        }
        if(!ok || sq_type(value) != OT_CLOSURE) {
            return false;
        }
        *out = _closure(value);
        return true;
    };

    auto emit_member_native_closure_guard = [&](SQInteger base_slot, SQInteger literal_index,
        SQNativeClosure *expected) -> bool {
        if(base_slot < 0 || base_slot >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals ||
            (slot_kind[base_slot] != SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slot_kind[base_slot] != SQ_JIT_A64_SLOT_OBJECT_PTR) || !expected) {
            return false;
        }
        if(slot_kind[base_slot] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            return object_ptr_observed_type[base_slot] != OT_NULL &&
                sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(base_slot)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 1,
                    (SQInteger)object_ptr_observed_type[base_slot]) &&
                sqjit_a64_emit_mov_imm_x(&buf, 2,
                    (SQInteger)(intptr_t)&proto->_literals[literal_index]) &&
                sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)(intptr_t)expected) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)(const void *)sqjit_a64_helper_object_ptr_member_native_closure_guard) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero();
        }
        return stack_object_reg[base_slot] >= 0 &&
            sqjit_a64_emit_mov_reg(&buf, 0, 19) &&
            sqjit_a64_emit_mov_imm_x(&buf, 1, stack_object_reg[base_slot]) &&
            sqjit_a64_emit_mov_imm_x(&buf, 2,
                (SQInteger)(intptr_t)&proto->_literals[literal_index]) &&
            sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)(intptr_t)expected) &&
            sqjit_a64_emit_mov_imm_x(&buf, 4,
                stack_object_reg[base_slot] == 0 && root_object ?
                (SQInteger)(intptr_t)root_object : 0) &&
            sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)(const void *)sqjit_a64_helper_member_native_closure_guard) &&
            sqjit_a64_emit_blr_x16(&buf) &&
            emit_guard_on_x0_zero();
    };

    auto observed_member_native_closure = [&](SQInteger base_slot,
        SQInteger literal_index, SQNativeClosure **out) -> bool {
        if(!out) {
            return false;
        }
        *out = NULL;
        if(base_slot < 0 || base_slot >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals) {
            return false;
        }

        SQObjectPtr value;
        bool ok = false;
        if(slot_kind[base_slot] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            ok = sqjit_a64_get_member_ptr_value(object_ptr_observed[base_slot],
                object_ptr_observed_type[base_slot], &proto->_literals[literal_index],
                value);
        }
        else if(slot_kind[base_slot] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[base_slot] >= 0) {
            ok = sqjit_a64_get_member_value_with_root(entry_stack,
                stack_object_reg[base_slot], &proto->_literals[literal_index],
                stack_object_reg[base_slot] == 0 ? root_object : NULL, value);
        }
        if(!ok || sq_type(value) != OT_NATIVECLOSURE) {
            return false;
        }
        *out = _nativeclosure(value);
        return true;
    };

    auto map_inline_slot = [&](SQFunctionProto *callee, const SQInstruction &call_inst,
        SQInteger slot) -> SQInteger {
        if(!callee || slot < 0 || slot >= callee->_stacksize) {
            return -1;
        }
        if(slot < callee->_nparameters) {
            SQInteger mapped = call_inst._arg2 + slot;
            return mapped >= 0 && mapped < MAX_FUNC_STACKSIZE ? mapped : -1;
        }
        SQInteger mapped = inline_scratch_base + (slot - callee->_nparameters);
        return mapped >= 0 && mapped < MAX_FUNC_STACKSIZE ? mapped : -1;
    };

    auto emit_array_element_get_direct = [&](SQInteger dst, SQInteger base,
        bool const_index, SQInteger index, SQInteger key, SQObjectType observed,
        SQArray *observed_array) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 ||
            base >= MAX_FUNC_STACKSIZE ||
            (observed != OT_FLOAT && observed != OT_INTEGER &&
            observed != OT_ARRAY)) {
            return false;
        }
        if(observed == OT_FLOAT && sizeof(SQFloat) != sizeof(SQInt32)) {
            return false;
        }

        unsigned stride_shift = 0;
        SQInteger stride = (SQInteger)sizeof(SQObjectPtr);
        while(((SQInteger)1 << stride_shift) < stride && stride_shift < 63) {
            stride_shift++;
        }
        if(((SQInteger)1 << stride_shift) != stride) {
            return false;
        }

        if(slot_kind[base] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_ldr_x(&buf, 11, 31,
                sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_cmp_imm(&buf, 11, 0) ||
                !emit_guard_fail_branch(SQ_JIT_A64_EQ)) {
                return false;
            }
        }
        else if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[base] >= 0) {
            if(!sqjit_a64_emit_type_guard(&buf, stack_object_reg[base],
                OT_ARRAY, guard_relocs, &nguard_relocs) ||
                !sqjit_a64_emit_ldr_x(&buf, 11, 19,
                sqjit_a64_stack_value_disp(stack_object_reg[base]))) {
                return false;
            }
        }
        else {
            return false;
        }

        if(const_index) {
            if(index < 0 || !sqjit_a64_emit_mov_imm_x(&buf, 10, index)) {
                return false;
            }
        }
        else {
            if(key < 0 || key >= MAX_FUNC_STACKSIZE ||
                !ensure_int_slot(key) ||
                !sqjit_a64_emit_ldr_x(&buf, 10, 31,
                sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_cmp_imm(&buf, 10, 0) ||
                !emit_guard_fail_branch(SQ_JIT_A64_LT)) {
                return false;
            }
        }

        if(!sqjit_a64_emit_ldr_x(&buf, 12, 11, SQArray::RawSizeOffset()) ||
            !sqjit_a64_emit_cmp_reg(&buf, 10, 12) ||
            !emit_guard_fail_branch(SQ_JIT_A64_GE) ||
            !sqjit_a64_emit_ldr_x(&buf, 13, 11, SQArray::RawValuesOffset()) ||
            !sqjit_a64_emit_add_reg_lsl(&buf, 13, 13, 10, stride_shift) ||
            !sqjit_a64_emit_ldr_w(&buf, 14, 13,
            (SQInteger)offsetof(SQObject, _type))) {
            return false;
        }

        if(observed == OT_FLOAT) {
            if(!sqjit_a64_emit_mov_imm_w(&buf, 15,
                (uint32_t)observed) ||
                !sqjit_a64_emit_cmp_reg(&buf, 14, 15) ||
                !emit_guard_fail_branch(SQ_JIT_A64_NE) ||
                !sqjit_a64_emit_ldr_s(&buf, 0, 13,
                (SQInteger)offsetof(SQObject, _unVal))) {
                return false;
            }
            return sqjit_a64_emit_str_s(&buf, 0, 31,
                sqjit_a64_local_disp(dst)) &&
                mark_float_slot(dst) && (entry_loaded[dst] = true, true);
        }
        if(!sqjit_a64_emit_mov_imm_w(&buf, 15, (uint32_t)observed) ||
            !sqjit_a64_emit_cmp_reg(&buf, 14, 15) ||
            !emit_guard_fail_branch(SQ_JIT_A64_NE)) {
            return false;
        }
        if(!sqjit_a64_emit_ldr_x(&buf, 9, 13,
            (SQInteger)offsetof(SQObject, _unVal)) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31,
            sqjit_a64_local_disp(dst))) {
            return false;
        }
        if(observed == OT_ARRAY) {
            return mark_array_ptr_slot(dst, observed_array) &&
                (entry_loaded[dst] = true, true);
        }
        return mark_int_slot(dst) && (entry_loaded[dst] = true, true);
    };

    auto emit_array_element_get_number_float_direct = [&](SQInteger dst,
        SQInteger base, bool const_index, SQInteger index, SQInteger key) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 ||
            base >= MAX_FUNC_STACKSIZE || sizeof(SQFloat) != sizeof(SQInt32)) {
            return false;
        }

        unsigned stride_shift = 0;
        SQInteger stride = (SQInteger)sizeof(SQObjectPtr);
        while(((SQInteger)1 << stride_shift) < stride && stride_shift < 63) {
            stride_shift++;
        }
        if(((SQInteger)1 << stride_shift) != stride) {
            return false;
        }

        if(slot_kind[base] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_ldr_x(&buf, 11, 31,
                sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_cmp_imm(&buf, 11, 0) ||
                !emit_guard_fail_branch(SQ_JIT_A64_EQ)) {
                return false;
            }
        }
        else if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[base] >= 0) {
            if(!sqjit_a64_emit_type_guard(&buf, stack_object_reg[base],
                OT_ARRAY, guard_relocs, &nguard_relocs) ||
                !sqjit_a64_emit_ldr_x(&buf, 11, 19,
                sqjit_a64_stack_value_disp(stack_object_reg[base]))) {
                return false;
            }
        }
        else {
            return false;
        }

        if(const_index) {
            if(index < 0 || !sqjit_a64_emit_mov_imm_x(&buf, 10, index)) {
                return false;
            }
        }
        else if(key < 0 || key >= MAX_FUNC_STACKSIZE ||
            !ensure_int_slot(key) ||
            !sqjit_a64_emit_ldr_x(&buf, 10, 31, sqjit_a64_local_disp(key)) ||
            !sqjit_a64_emit_cmp_imm(&buf, 10, 0) ||
            !emit_guard_fail_branch(SQ_JIT_A64_LT)) {
            return false;
        }

        SQInteger float_patch = 0;
        SQInteger done_patch = 0;
        SQInteger float_offset = 0;
        SQInteger done_offset = 0;
        if(!sqjit_a64_emit_ldr_x(&buf, 12, 11, SQArray::RawSizeOffset()) ||
            !sqjit_a64_emit_cmp_reg(&buf, 10, 12) ||
            !emit_guard_fail_branch(SQ_JIT_A64_GE) ||
            !sqjit_a64_emit_ldr_x(&buf, 13, 11, SQArray::RawValuesOffset()) ||
            !sqjit_a64_emit_add_reg_lsl(&buf, 13, 13, 10, stride_shift) ||
            !sqjit_a64_emit_ldr_w(&buf, 14, 13,
            (SQInteger)offsetof(SQObject, _type)) ||
            !sqjit_a64_emit_mov_imm_w(&buf, 15, (uint32_t)OT_FLOAT) ||
            !sqjit_a64_emit_cmp_reg(&buf, 14, 15) ||
            !sqjit_a64_emit_bcond_placeholder(&buf, SQ_JIT_A64_EQ,
            &float_patch) ||
            !sqjit_a64_emit_mov_imm_w(&buf, 15, (uint32_t)OT_INTEGER) ||
            !sqjit_a64_emit_cmp_reg(&buf, 14, 15) ||
            !emit_guard_fail_branch(SQ_JIT_A64_NE) ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 13,
            (SQInteger)offsetof(SQObject, _unVal)) ||
            !sqjit_a64_emit_scvtf_s_x(&buf, 0, 9) ||
            !sqjit_a64_emit_b_placeholder(&buf, &done_patch)) {
            return false;
        }

        float_offset = buf.size;
        if(!sqjit_a64_patch_branch(&buf, float_patch, float_offset, true,
            SQ_JIT_A64_EQ) ||
            !sqjit_a64_emit_ldr_s(&buf, 0, 13,
            (SQInteger)offsetof(SQObject, _unVal))) {
            return false;
        }

        done_offset = buf.size;
        return sqjit_a64_patch_branch(&buf, done_patch, done_offset, false, 0) &&
            sqjit_a64_emit_str_s(&buf, 0, 31, sqjit_a64_local_disp(dst)) &&
            mark_float_slot(dst) && (entry_loaded[dst] = true, true);
    };

    auto emit_array_get_const = [&](SQInteger dst, SQInteger base, SQInteger index,
        SQObjectType observed, SQArray *observed_array) -> bool {
        if(emit_array_element_get_direct(dst, base, true, index, -1, observed,
            observed_array)) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            index < 0) {
            return false;
        }
        const void *helper = NULL;
        bool object_result = false;
        if(observed == OT_FLOAT) {
            helper = slot_kind[base] == SQ_JIT_A64_SLOT_ARRAY_PTR ?
                (const void *)sqjit_a64_helper_array_ptr_get_float_raw :
                (const void *)sqjit_a64_helper_array_get_float;
        }
        else if(observed == OT_INTEGER) {
            helper = slot_kind[base] == SQ_JIT_A64_SLOT_ARRAY_PTR ?
                (const void *)sqjit_a64_helper_array_ptr_get_integer_raw :
                (const void *)sqjit_a64_helper_array_get_integer;
        }
        else if(observed == OT_ARRAY) {
            helper = slot_kind[base] == SQ_JIT_A64_SLOT_ARRAY_PTR ?
                (const void *)sqjit_a64_helper_array_ptr_get_array_ptr_raw :
                (const void *)sqjit_a64_helper_array_get_array_ptr;
        }
        else {
            helper = slot_kind[base] == SQ_JIT_A64_SLOT_ARRAY_PTR ?
                (const void *)sqjit_a64_helper_array_ptr_get_object_raw :
                (const void *)sqjit_a64_helper_array_get_object;
            object_result = true;
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1, index) ||
                !(object_result ?
                    sqjit_a64_emit_mov_reg(&buf, 2, 19) :
                    sqjit_a64_emit_add_imm(&buf, 2, 31, sqjit_a64_local_disp(dst))) ||
                !(object_result ? sqjit_a64_emit_mov_imm_x(&buf, 3, dst) : true) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)helper) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
        }
        else {
            if(slot_kind[base] != SQ_JIT_A64_SLOT_STACK_OBJECT || stack_object_reg[base] < 0 ||
                !sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1, stack_object_reg[base]) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, index) ||
                !(object_result ?
                    sqjit_a64_emit_mov_imm_x(&buf, 3, dst) :
                    sqjit_a64_emit_add_imm(&buf, 3, 31, sqjit_a64_local_disp(dst))) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)helper) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
        }
        if(object_result) {
            if(!mark_stack_object_slot(dst, dst)) {
                return false;
            }
        }
        else if(observed == OT_FLOAT) {
            if(!mark_float_slot(dst)) {
                return false;
            }
        }
        else if(observed == OT_ARRAY) {
            if(!mark_array_ptr_slot(dst, observed_array)) {
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
        SQObjectType observed, SQArray *observed_array) -> bool {
        if(emit_array_element_get_direct(dst, base, false, 0, key, observed,
            observed_array)) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE ||
            !ensure_int_slot(key)) {
            return false;
        }
        const void *helper = NULL;
        bool object_result = false;
        if(observed == OT_FLOAT) {
            helper = slot_kind[base] == SQ_JIT_A64_SLOT_ARRAY_PTR ?
                (const void *)sqjit_a64_helper_array_ptr_get_float_raw :
                (const void *)sqjit_a64_helper_array_get_float;
        }
        else if(observed == OT_INTEGER) {
            helper = slot_kind[base] == SQ_JIT_A64_SLOT_ARRAY_PTR ?
                (const void *)sqjit_a64_helper_array_ptr_get_integer_raw :
                (const void *)sqjit_a64_helper_array_get_integer;
        }
        else if(observed == OT_ARRAY) {
            helper = slot_kind[base] == SQ_JIT_A64_SLOT_ARRAY_PTR ?
                (const void *)sqjit_a64_helper_array_ptr_get_array_ptr_raw :
                (const void *)sqjit_a64_helper_array_get_array_ptr;
        }
        else {
            helper = slot_kind[base] == SQ_JIT_A64_SLOT_ARRAY_PTR ?
                (const void *)sqjit_a64_helper_array_ptr_get_object_raw :
                (const void *)sqjit_a64_helper_array_get_object;
            object_result = true;
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(key)) ||
                !(object_result ?
                    sqjit_a64_emit_mov_reg(&buf, 2, 19) :
                    sqjit_a64_emit_add_imm(&buf, 2, 31, sqjit_a64_local_disp(dst))) ||
                !(object_result ? sqjit_a64_emit_mov_imm_x(&buf, 3, dst) : true) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)helper) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
        }
        else {
            if(slot_kind[base] != SQ_JIT_A64_SLOT_STACK_OBJECT || stack_object_reg[base] < 0 ||
                !sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1, stack_object_reg[base]) ||
                !sqjit_a64_emit_ldr_x(&buf, 2, 31, sqjit_a64_local_disp(key)) ||
                !(object_result ?
                    sqjit_a64_emit_mov_imm_x(&buf, 3, dst) :
                    sqjit_a64_emit_add_imm(&buf, 3, 31, sqjit_a64_local_disp(dst))) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)helper) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
        }
        if(object_result) {
            if(!mark_stack_object_slot(dst, dst)) {
                return false;
            }
        }
        else if(observed == OT_FLOAT) {
            if(!mark_float_slot(dst)) {
                return false;
            }
        }
        else if(observed == OT_ARRAY) {
            if(!mark_array_ptr_slot(dst, observed_array)) {
                return false;
            }
        }
        else if(!mark_int_slot(dst)) {
            return false;
        }
        entry_loaded[dst] = true;
        return true;
    };

    auto emit_instance_field_get_direct = [&](SQInteger dst, SQInteger base,
        const SQObjectPtr *key, SQObjectType observed) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            !key || (slot_kind[base] != SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slot_kind[base] != SQ_JIT_A64_SLOT_OBJECT_PTR)) {
            return false;
        }
        if(observed != OT_FLOAT && observed != OT_INTEGER && observed != OT_BOOL &&
            observed != OT_ARRAY && !sqjit_a64_type_is_object_ptr(observed)) {
            return false;
        }
        if(observed == OT_FLOAT && sizeof(SQFloat) != sizeof(SQInt32)) {
            return false;
        }

        SQJitA64InstanceFieldObservation field;
        bool have_field = false;
        if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT) {
            have_field = stack_object_reg[base] >= 0 &&
                sqjit_a64_observed_stack_instance_field(entry_stack,
                    stack_object_reg[base], key, &field);
        }
        else {
            have_field = sqjit_a64_observed_object_ptr_instance_field(
                object_ptr_observed[base], object_ptr_observed_type[base],
                key, &field);
        }
        if(!have_field || field.value_type != observed) {
            return false;
        }

        if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT) {
            if(!sqjit_a64_emit_type_guard(&buf, stack_object_reg[base],
                OT_INSTANCE, guard_relocs, &nguard_relocs) ||
                !sqjit_a64_emit_ldr_x(&buf, 11, 19,
                sqjit_a64_stack_value_disp(stack_object_reg[base]))) {
                return false;
            }
        }
        else if(!sqjit_a64_emit_ldr_x(&buf, 11, 31,
            sqjit_a64_local_disp(base))) {
            return false;
        }

        SQInteger type_disp = field.value_disp + (SQInteger)offsetof(SQObject, _type);
        SQInteger value_disp = field.value_disp + (SQInteger)offsetof(SQObject, _unVal);
        if(!sqjit_a64_emit_ldr_x(&buf, 10, 11, field.class_disp) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 12,
            (SQInteger)(intptr_t)field.klass) ||
            !sqjit_a64_emit_cmp_reg(&buf, 10, 12) ||
            !emit_guard_fail_branch(SQ_JIT_A64_NE) ||
            !sqjit_a64_emit_ldr_w(&buf, 9, 11, type_disp) ||
            !sqjit_a64_emit_mov_imm_w(&buf, 10, (uint32_t)observed) ||
            !sqjit_a64_emit_cmp_reg(&buf, 9, 10) ||
            !emit_guard_fail_branch(SQ_JIT_A64_NE)) {
            return false;
        }

        if(observed == OT_FLOAT) {
            if(!sqjit_a64_emit_ldr_s(&buf, 0, 11, value_disp) ||
                !sqjit_a64_emit_str_s(&buf, 0, 31, sqjit_a64_local_disp(dst)) ||
                !mark_float_slot(dst)) {
                return false;
            }
            entry_loaded[dst] = true;
            return true;
        }
        if(!sqjit_a64_emit_ldr_x(&buf, 9, 11, value_disp) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst))) {
            return false;
        }
        bool marked = false;
        if(observed == OT_ARRAY) {
            marked = mark_array_ptr_slot(dst, field.array_value);
        }
        else if(sqjit_a64_type_is_object_ptr(observed)) {
            marked = mark_object_ptr_slot(dst, observed, field.object_ptr_value);
        }
        else if(observed == OT_BOOL) {
            marked = mark_bool_slot(dst);
        }
        else {
            marked = mark_int_slot(dst);
        }
        entry_loaded[dst] = marked;
        return marked;
    };

    auto emit_parameter_array_field_get_with_fallback = [&](SQInteger dst,
        SQInteger base, const SQObjectPtr *key, SQArray *observed_array) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 ||
            base >= MAX_FUNC_STACKSIZE || !key ||
            slot_kind[base] != SQ_JIT_A64_SLOT_STACK_OBJECT ||
            stack_object_reg[base] <= 0 ||
            stack_object_reg[base] >= proto->_nparameters ||
            sq_type(entry_stack[stack_object_reg[base]]) != OT_INSTANCE) {
            return false;
        }

        SQJitA64InstanceFieldObservation field;
        if(!sqjit_a64_observed_stack_instance_field(entry_stack,
            stack_object_reg[base], key, &field) ||
            field.value_type != OT_ARRAY) {
            return false;
        }

        SQInteger slow_type_patch = 0;
        SQInteger slow_class_patch = 0;
        SQInteger slow_value_patch = 0;
        SQInteger done_patch = 0;
        if(!sqjit_a64_emit_ldr_w(&buf, 9, 19,
            sqjit_a64_stack_type_disp(stack_object_reg[base])) ||
            !sqjit_a64_emit_mov_imm_w(&buf, 10, (uint32_t)OT_INSTANCE) ||
            !sqjit_a64_emit_cmp_reg(&buf, 9, 10) ||
            !sqjit_a64_emit_bcond_placeholder(&buf, SQ_JIT_A64_NE,
            &slow_type_patch) ||
            !sqjit_a64_emit_ldr_x(&buf, 11, 19,
            sqjit_a64_stack_value_disp(stack_object_reg[base])) ||
            !sqjit_a64_emit_ldr_x(&buf, 10, 11, field.class_disp) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 12,
            (SQInteger)(intptr_t)field.klass) ||
            !sqjit_a64_emit_cmp_reg(&buf, 10, 12) ||
            !sqjit_a64_emit_bcond_placeholder(&buf, SQ_JIT_A64_NE,
            &slow_class_patch) ||
            !sqjit_a64_emit_ldr_w(&buf, 9, 11,
            field.value_disp + (SQInteger)offsetof(SQObject, _type)) ||
            !sqjit_a64_emit_mov_imm_w(&buf, 10, (uint32_t)OT_ARRAY) ||
            !sqjit_a64_emit_cmp_reg(&buf, 9, 10) ||
            !sqjit_a64_emit_bcond_placeholder(&buf, SQ_JIT_A64_NE,
            &slow_value_patch) ||
            !sqjit_a64_emit_ldr_x(&buf, 9, 11,
            field.value_disp + (SQInteger)offsetof(SQObject, _unVal)) ||
            !sqjit_a64_emit_str_x(&buf, 9, 31, sqjit_a64_local_disp(dst)) ||
            !sqjit_a64_emit_b_placeholder(&buf, &done_patch)) {
            return false;
        }

        SQInteger slow_offset = buf.size;
        if(!sqjit_a64_patch_branch(&buf, slow_type_patch, slow_offset, true,
            SQ_JIT_A64_NE) ||
            !sqjit_a64_patch_branch(&buf, slow_class_patch, slow_offset, true,
            SQ_JIT_A64_NE) ||
            !sqjit_a64_patch_branch(&buf, slow_value_patch, slow_offset, true,
            SQ_JIT_A64_NE) ||
            !sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 1, stack_object_reg[base]) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 2, (SQInteger)(intptr_t)key) ||
            !sqjit_a64_emit_add_imm(&buf, 3, 31, sqjit_a64_local_disp(dst)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16,
            (SQInteger)(intptr_t)(const void *)sqjit_a64_helper_table_get_array_ptr) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }

        SQInteger done_offset = buf.size;
        if(!sqjit_a64_patch_branch(&buf, done_patch, done_offset, false, 0) ||
            !mark_array_ptr_slot(dst, observed_array)) {
            return false;
        }
        entry_loaded[dst] = true;
        return true;
    };

    auto emit_member_get_key = [&](SQInteger dst, SQInteger base, const SQObjectPtr *key,
        SQObjectType observed, SQArray *observed_array, SQInteger observed_object_ptr) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            !key || (slot_kind[base] != SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slot_kind[base] != SQ_JIT_A64_SLOT_OBJECT_PTR)) {
            return false;
        }
        bool use_root_fallback = slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[base] == 0 && root_object != NULL;
        if(observed == OT_ARRAY &&
            emit_parameter_array_field_get_with_fallback(dst, base, key,
            observed_array)) {
            return true;
        }
        if(emit_instance_field_get_direct(dst, base, key, observed)) {
            return true;
        }
        const void *helper = NULL;
        if(observed == OT_FLOAT) {
            if(slot_kind[base] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
                helper = (const void *)sqjit_a64_helper_object_ptr_get_float;
            }
            else {
                helper = use_root_fallback ?
                    (const void *)sqjit_a64_helper_table_get_float_root :
                    (const void *)sqjit_a64_helper_table_get_float;
            }
        }
        else if(observed == OT_INTEGER) {
            if(slot_kind[base] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
                helper = (const void *)sqjit_a64_helper_object_ptr_get_integer;
            }
            else {
                helper = use_root_fallback ?
                    (const void *)sqjit_a64_helper_table_get_integer_root :
                    (const void *)sqjit_a64_helper_table_get_integer;
            }
        }
        else if(observed == OT_ARRAY) {
            if(slot_kind[base] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
                helper = (const void *)sqjit_a64_helper_object_ptr_get_array_ptr;
            }
            else {
                helper = use_root_fallback ?
                    (const void *)sqjit_a64_helper_table_get_array_ptr_root :
                    (const void *)sqjit_a64_helper_table_get_array_ptr;
            }
        }
        else if(sqjit_a64_type_is_object_ptr(observed)) {
            if(slot_kind[base] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
                helper = (const void *)sqjit_a64_helper_object_ptr_get_object_ptr;
            }
            else {
                helper = use_root_fallback ?
                    (const void *)sqjit_a64_helper_member_get_object_ptr_root :
                    (const void *)sqjit_a64_helper_member_get_object_ptr;
            }
        }
        else {
            return false;
        }

        if(slot_kind[base] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            if(object_ptr_observed_type[base] == OT_NULL ||
                !sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1, (SQInteger)object_ptr_observed_type[base]) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, (SQInteger)(intptr_t)key)) {
                return false;
            }
        }
        else {
            if(stack_object_reg[base] < 0 ||
                !sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1, stack_object_reg[base]) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, (SQInteger)(intptr_t)key)) {
                return false;
            }
        }

        if(sqjit_a64_type_is_object_ptr(observed)) {
            if(use_root_fallback) {
                if(!sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)observed) ||
                    !sqjit_a64_emit_mov_imm_x(&buf, 4,
                    (SQInteger)(intptr_t)root_object) ||
                    !sqjit_a64_emit_add_imm(&buf, 5, 31,
                    sqjit_a64_local_disp(dst))) {
                    return false;
                }
            }
            else if(!sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)observed) ||
                !sqjit_a64_emit_add_imm(&buf, 4, 31, sqjit_a64_local_disp(dst))) {
                return false;
            }
        }
        else if(use_root_fallback) {
            if(!sqjit_a64_emit_mov_imm_x(&buf, 3,
                (SQInteger)(intptr_t)root_object) ||
                !sqjit_a64_emit_add_imm(&buf, 4, 31, sqjit_a64_local_disp(dst))) {
                return false;
            }
        }
        else if(!sqjit_a64_emit_add_imm(&buf, 3, 31, sqjit_a64_local_disp(dst))) {
            return false;
        }

        if(!sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)helper) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        if(observed == OT_FLOAT) {
            return mark_float_slot(dst) && (entry_loaded[dst] = true, true);
        }
        if(observed == OT_ARRAY) {
            return mark_array_ptr_slot(dst, observed_array) && (entry_loaded[dst] = true, true);
        }
        if(sqjit_a64_type_is_object_ptr(observed)) {
            return mark_object_ptr_slot(dst, observed, observed_object_ptr) &&
                (entry_loaded[dst] = true, true);
        }
        return mark_int_slot(dst) && (entry_loaded[dst] = true, true);
    };

    auto emit_member_get_dynamic_key = [&](SQInteger dst, SQInteger base,
        SQInteger key_slot) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key_slot < 0 || key_slot >= MAX_FUNC_STACKSIZE ||
            slot_kind[key_slot] != SQ_JIT_A64_SLOT_OBJECT_PTR ||
            object_ptr_observed[key_slot] == 0 ||
            object_ptr_observed_type[key_slot] == OT_NULL ||
            (slot_kind[base] != SQ_JIT_A64_SLOT_STACK_OBJECT &&
            slot_kind[base] != SQ_JIT_A64_SLOT_OBJECT_PTR)) {
            return false;
        }

        SQObjectPtr key;
        if(!sqjit_a64_object_ptr_to_value(object_ptr_observed[key_slot],
            object_ptr_observed_type[key_slot], key)) {
            return false;
        }

        SQArray *observed_array = NULL;
        SQInteger observed_object_ptr = 0;
        SQObjectType observed = OT_NULL;
        bool use_root_fallback = false;
        if(slot_kind[base] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            observed = sqjit_a64_observed_object_ptr_value_type(
                object_ptr_observed[base], object_ptr_observed_type[base],
                &key, &observed_array, &observed_object_ptr);
        }
        else {
            SQInteger observed_reg = stack_object_reg[base];
            observed = sqjit_a64_observed_table_value_type(entry_stack,
                observed_reg, &key, &observed_array, &observed_object_ptr);
            use_root_fallback = observed == OT_NULL && observed_reg == 0 &&
                root_object != NULL;
            if(use_root_fallback) {
                observed = sqjit_a64_observed_root_value_type(root_object,
                    &key, &observed_array, &observed_object_ptr);
            }
        }

        if(observed == OT_ARRAY &&
            emit_parameter_array_field_get_with_fallback(dst, base, &key,
            observed_array)) {
            return true;
        }
        if(emit_instance_field_get_direct(dst, base, &key, observed)) {
            return true;
        }

        const void *helper = NULL;
        if(slot_kind[base] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            helper = (const void *)sqjit_a64_helper_object_ptr_get_object_dynamic_key;
            if(object_ptr_observed_type[base] == OT_NULL ||
                !sqjit_a64_emit_ldr_x(&buf, 0, 31, sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1,
                (SQInteger)object_ptr_observed_type[base]) ||
                !sqjit_a64_emit_ldr_x(&buf, 2, 31,
                sqjit_a64_local_disp(key_slot)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 3,
                (SQInteger)object_ptr_observed_type[key_slot]) ||
                !sqjit_a64_emit_mov_reg(&buf, 4, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 5, dst)) {
                return false;
            }
        }
        else {
            helper = use_root_fallback ?
                (const void *)sqjit_a64_helper_member_get_object_dynamic_key_root :
                (const void *)sqjit_a64_helper_member_get_object_dynamic_key;
            if(stack_object_reg[base] < 0 ||
                !sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 1, stack_object_reg[base]) ||
                !sqjit_a64_emit_ldr_x(&buf, 2, 31,
                sqjit_a64_local_disp(key_slot)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 3,
                (SQInteger)object_ptr_observed_type[key_slot])) {
                return false;
            }
            if(use_root_fallback) {
                if(!sqjit_a64_emit_mov_imm_x(&buf, 4,
                    (SQInteger)(intptr_t)root_object) ||
                    !sqjit_a64_emit_mov_imm_x(&buf, 5, dst)) {
                    return false;
                }
            }
            else if(!sqjit_a64_emit_mov_imm_x(&buf, 4, dst)) {
                return false;
            }
        }

        if(!sqjit_a64_emit_mov_imm_x(&buf, 16, (SQInteger)(intptr_t)helper) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero() ||
            !mark_stack_object_slot(dst, dst)) {
            return false;
        }
        entry_loaded[dst] = true;
        return true;
    };

    auto emit_table_get = [&](SQInteger dst, SQInteger base, SQInteger literal_index,
        SQObjectType observed, SQArray *observed_array, SQInteger observed_object_ptr) -> bool {
        if(literal_index < 0 || literal_index >= proto->_nliterals) {
            return false;
        }
        return emit_member_get_key(dst, base, &proto->_literals[literal_index], observed,
            observed_array, observed_object_ptr);
    };

    auto emit_inline_array_set_integer = [&](SQInteger target, SQInteger base,
        SQInteger key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || value < 0 ||
            value >= MAX_FUNC_STACKSIZE || !ensure_int_slot(key) ||
            !ensure_int_slot(value)) {
            return false;
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_ldr_x(&buf, 2, 31, sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_set_integer_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_int_slot(target, value);
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[base] >= 0) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_mov_reg(&buf, 1, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, stack_object_reg[base]) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31, sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_ldr_x(&buf, 4, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_array_set_integer_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_int_slot(target, value);
        }
        return false;
    };

    auto emit_inline_array_set_bool = [&](SQInteger target, SQInteger base,
        SQInteger key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || value < 0 ||
            value >= MAX_FUNC_STACKSIZE || !ensure_int_slot(key) ||
            !ensure_int_slot(value)) {
            return false;
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_ldr_x(&buf, 2, 31, sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_set_bool_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_int_slot(target, value);
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[base] >= 0) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_mov_reg(&buf, 1, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, stack_object_reg[base]) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31, sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_ldr_x(&buf, 4, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_array_set_bool_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_int_slot(target, value);
        }
        return false;
    };

    auto emit_inline_array_set_float = [&](SQInteger target, SQInteger base,
        SQInteger key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || value < 0 ||
            value >= MAX_FUNC_STACKSIZE || !ensure_int_slot(key) ||
            !ensure_float_slot(value)) {
            return false;
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_ldr_x(&buf, 2, 31, sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_add_imm(&buf, 3, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_set_float_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_float_slot(target, value);
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[base] >= 0) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_mov_reg(&buf, 1, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, stack_object_reg[base]) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31, sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_add_imm(&buf, 4, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_array_set_float_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_float_slot(target, value);
        }
        return false;
    };

    auto observed_instance_field_for_base = [&](SQInteger base,
        const SQObjectPtr *key, SQJitA64InstanceFieldObservation *field) -> bool {
        if(base < 0 || base >= MAX_FUNC_STACKSIZE || !key || !field) {
            return false;
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT) {
            return stack_object_reg[base] >= 0 &&
                sqjit_a64_observed_stack_instance_field(entry_stack,
                    stack_object_reg[base], key, field);
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            return sqjit_a64_observed_object_ptr_instance_field(
                object_ptr_observed[base], object_ptr_observed_type[base],
                key, field);
        }
        return false;
    };

    auto emit_instance_field_set_base = [&](SQInteger base,
        const SQJitA64InstanceFieldObservation &field) -> bool {
        if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT) {
            if(stack_object_reg[base] < 0 ||
                !sqjit_a64_emit_type_guard(&buf, stack_object_reg[base],
                OT_INSTANCE, guard_relocs, &nguard_relocs) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 19,
                sqjit_a64_stack_value_disp(stack_object_reg[base]))) {
                return false;
            }
        }
        else if(slot_kind[base] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            if(!sqjit_a64_emit_ldr_x(&buf, 1, 31,
                sqjit_a64_local_disp(base))) {
                return false;
            }
        }
        else {
            return false;
        }

        return sqjit_a64_emit_ldr_x(&buf, 10, 1, field.class_disp) &&
            sqjit_a64_emit_mov_imm_x(&buf, 12,
                (SQInteger)(intptr_t)field.klass) &&
            sqjit_a64_emit_cmp_reg(&buf, 10, 12) &&
            emit_guard_fail_branch(SQ_JIT_A64_NE);
    };

    auto emit_instance_field_set_integer_key = [&](SQInteger target,
        SQInteger base, const SQObjectPtr *key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE || !key ||
            value < 0 || value >= MAX_FUNC_STACKSIZE || !ensure_int_slot(value)) {
            return false;
        }

        SQJitA64InstanceFieldObservation field;
        if(!observed_instance_field_for_base(base, key, &field) ||
            !emit_instance_field_set_base(base, field) ||
            !sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 2,
                (SQInteger)(intptr_t)field.klass) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)(intptr_t)key) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 4, field.field_index) ||
            !sqjit_a64_emit_ldr_x(&buf, 5, 31,
                sqjit_a64_local_disp(value)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)
                sqjit_a64_helper_instance_field_set_integer_logged) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        return copy_int_slot(target, value);
    };

    auto emit_instance_field_set_float_key = [&](SQInteger target,
        SQInteger base, const SQObjectPtr *key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE || !key ||
            value < 0 || value >= MAX_FUNC_STACKSIZE || !ensure_float_slot(value)) {
            return false;
        }

        SQJitA64InstanceFieldObservation field;
        if(!observed_instance_field_for_base(base, key, &field) ||
            !emit_instance_field_set_base(base, field) ||
            !sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 2,
                (SQInteger)(intptr_t)field.klass) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)(intptr_t)key) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 4, field.field_index) ||
            !sqjit_a64_emit_add_imm(&buf, 5, 31,
                sqjit_a64_local_disp(value)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)
                sqjit_a64_helper_instance_field_set_float_logged) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        return copy_float_slot(target, value);
    };

    auto emit_member_set_integer_key = [&](SQInteger target, SQInteger base,
        const SQObjectPtr *key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE || !key ||
            value < 0 || value >= MAX_FUNC_STACKSIZE || !ensure_int_slot(value)) {
            return false;
        }
        if(emit_instance_field_set_integer_key(target, base, key, value)) {
            return true;
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            if(object_ptr_observed_type[base] == OT_NULL ||
                !sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2,
                (SQInteger)object_ptr_observed_type[base]) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)(intptr_t)key) ||
                !sqjit_a64_emit_ldr_x(&buf, 4, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_object_ptr_set_integer_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_int_slot(target, value);
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[base] >= 0) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_mov_reg(&buf, 1, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, stack_object_reg[base]) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)(intptr_t)key) ||
                !sqjit_a64_emit_ldr_x(&buf, 4, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 5,
                stack_object_reg[base] == 0 && root_object ?
                (SQInteger)(intptr_t)root_object : 0) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_member_set_integer_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_int_slot(target, value);
        }
        return false;
    };

    auto emit_member_set_float_key = [&](SQInteger target, SQInteger base,
        const SQObjectPtr *key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE || !key ||
            value < 0 || value >= MAX_FUNC_STACKSIZE || !ensure_float_slot(value)) {
            return false;
        }
        if(emit_instance_field_set_float_key(target, base, key, value)) {
            return true;
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            if(object_ptr_observed_type[base] == OT_NULL ||
                !sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2,
                (SQInteger)object_ptr_observed_type[base]) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)(intptr_t)key) ||
                !sqjit_a64_emit_add_imm(&buf, 4, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_object_ptr_set_float_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_float_slot(target, value);
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[base] >= 0) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_mov_reg(&buf, 1, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, stack_object_reg[base]) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)(intptr_t)key) ||
                !sqjit_a64_emit_add_imm(&buf, 4, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 5,
                stack_object_reg[base] == 0 && root_object ?
                (SQInteger)(intptr_t)root_object : 0) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_member_set_float_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_float_slot(target, value);
        }
        return false;
    };

    auto emit_instance_field_set_bool_key = [&](SQInteger target,
        SQInteger base, const SQObjectPtr *key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE || !key ||
            value < 0 || value >= MAX_FUNC_STACKSIZE || !ensure_int_slot(value)) {
            return false;
        }

        SQJitA64InstanceFieldObservation field;
        if(!observed_instance_field_for_base(base, key, &field) ||
            !emit_instance_field_set_base(base, field) ||
            !sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 2,
                (SQInteger)(intptr_t)field.klass) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)(intptr_t)key) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 4, field.field_index) ||
            !sqjit_a64_emit_ldr_x(&buf, 5, 31,
                sqjit_a64_local_disp(value)) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)
                sqjit_a64_helper_instance_field_set_bool_logged) ||
            !sqjit_a64_emit_blr_x16(&buf) ||
            !emit_guard_on_x0_zero()) {
            return false;
        }
        return copy_int_slot(target, value);
    };

    auto emit_member_set_bool_key = [&](SQInteger target, SQInteger base,
        const SQObjectPtr *key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE || !key ||
            value < 0 || value >= MAX_FUNC_STACKSIZE || !ensure_int_slot(value)) {
            return false;
        }
        if(emit_instance_field_set_bool_key(target, base, key, value)) {
            return true;
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            if(object_ptr_observed_type[base] == OT_NULL ||
                !sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2,
                (SQInteger)object_ptr_observed_type[base]) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)(intptr_t)key) ||
                !sqjit_a64_emit_ldr_x(&buf, 4, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_object_ptr_set_bool_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_int_slot(target, value);
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
            stack_object_reg[base] >= 0) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31,
                sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_mov_reg(&buf, 1, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, stack_object_reg[base]) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 3, (SQInteger)(intptr_t)key) ||
                !sqjit_a64_emit_ldr_x(&buf, 4, 31,
                sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 5,
                stack_object_reg[base] == 0 && root_object ?
                (SQInteger)(intptr_t)root_object : 0) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                (SQInteger)(intptr_t)sqjit_a64_helper_member_set_bool_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero()) {
                return false;
            }
            return copy_int_slot(target, value);
        }
        return false;
    };

    auto emit_inline_leaf_call = [&](SQClosure *callee_closure,
        const SQInstruction &call_inst) -> bool {
        if(!callee_closure) {
            return false;
        }
        SQFunctionProto *callee = callee_closure->_function;
        if(!callee || callee->_bgenerator || callee->_varparams ||
            callee->_ndefaultparams != 0 || callee->_noutervalues != 0 ||
            callee->_nparameters != call_inst._arg3 ||
            call_inst._arg2 < 0 ||
            call_inst._arg2 + call_inst._arg3 > MAX_FUNC_STACKSIZE ||
            inline_scratch_base + (callee->_stacksize - callee->_nparameters) >
                MAX_FUNC_STACKSIZE) {
            return false;
        }

        const SQObjectPtr *inline_known_literal[MAX_FUNC_STACKSIZE];
        for(SQInteger n = 0; n < MAX_FUNC_STACKSIZE; n++) {
            inline_known_literal[n] = NULL;
        }

        auto load_inline_literal_value = [&](SQInteger dst,
            const SQObjectPtr &literal) -> bool {
            if(dst < 0 || dst >= MAX_FUNC_STACKSIZE) {
                return false;
            }
            if(sq_type(literal) == OT_STRING) {
                inline_known_literal[dst] = &literal;
                return true;
            }
            inline_known_literal[dst] = NULL;
            return load_literal_value_slot(dst, literal);
        };

        auto next_inline_ip = [&](SQInteger ip) -> SQInteger {
            while(ip >= 0 && ip < callee->_ninstructions &&
                callee->_instructions[ip].op == _OP_LINE) {
                ip++;
            }
            return ip;
        };

        auto inline_branch_target = [&](SQInteger ip) -> SQInteger {
            if(ip < 0 || ip >= callee->_ninstructions) {
                return -1;
            }
            return ip + 1 + sqjit_signed_arg1(callee->_instructions[ip]);
        };

        SQInteger first_ip = next_inline_ip(0);
        if(first_ip >= 0 && first_ip < callee->_ninstructions &&
            callee->_instructions[first_ip].op == _OP_JCMP) {
            const SQInstruction &cmp_inst = callee->_instructions[first_ip];
            SQInteger true_move_ip = next_inline_ip(first_ip + 1);
            SQInteger false_move_ip = next_inline_ip(inline_branch_target(first_ip));
            if(true_move_ip >= 0 && true_move_ip < callee->_ninstructions &&
                false_move_ip >= 0 && false_move_ip < callee->_ninstructions &&
                callee->_instructions[true_move_ip].op == _OP_MOVE &&
                callee->_instructions[false_move_ip].op == _OP_MOVE) {
                const SQInstruction &true_move = callee->_instructions[true_move_ip];
                const SQInstruction &false_move = callee->_instructions[false_move_ip];
                SQInteger jump_ip = next_inline_ip(true_move_ip + 1);
                if(jump_ip >= 0 && jump_ip < callee->_ninstructions &&
                    callee->_instructions[jump_ip].op == _OP_JMP) {
                    SQInteger return_ip = next_inline_ip(inline_branch_target(jump_ip));
                    SQInteger false_return_ip = next_inline_ip(false_move_ip + 1);
                    if(return_ip == false_return_ip && return_ip >= 0 &&
                        return_ip < callee->_ninstructions &&
                        callee->_instructions[return_ip].op == _OP_RETURN &&
                        true_move._arg0 == false_move._arg0 &&
                        callee->_instructions[return_ip]._arg0 != 0xFF &&
                        callee->_instructions[return_ip]._arg1 == true_move._arg0) {
                        SQInteger cmp_left = map_inline_slot(callee, call_inst,
                            cmp_inst._arg2);
                        SQInteger cmp_right = map_inline_slot(callee, call_inst,
                            cmp_inst._arg0);
                        SQInteger true_src = map_inline_slot(callee, call_inst,
                            true_move._arg1);
                        SQInteger false_src = map_inline_slot(callee, call_inst,
                            false_move._arg1);
                        if(emit_conditional_select((CmpOP)cmp_inst._arg3,
                            call_inst._arg0, cmp_left, cmp_right, true_src,
                            false_src)) {
                            return true;
                        }
                    }
                }
            }
        }

        for(SQInteger ip = 0; ip < callee->_ninstructions; ip++) {
            const SQInstruction &inst = callee->_instructions[ip];
            switch(inst.op) {
                case _OP_LINE:
                    break;
                case _OP_LOADINT: {
                    SQInteger dst = map_inline_slot(callee, call_inst, inst._arg0);
                    if(dst >= 0 && dst < MAX_FUNC_STACKSIZE) {
                        inline_known_literal[dst] = NULL;
                    }
                    if(dst < 0 || !emit_load_int(dst, sqjit_loadint_value(inst))) {
                        return false;
                    }
                    break;
                }
                case _OP_LOADFLOAT: {
                    SQFloat value;
                    SQInteger dst = map_inline_slot(callee, call_inst, inst._arg0);
                    if(dst >= 0 && dst < MAX_FUNC_STACKSIZE) {
                        inline_known_literal[dst] = NULL;
                    }
                    if(dst < 0 || !sqjit_loadfloat_value(inst, &value) ||
                        !emit_load_float(dst, value)) {
                        return false;
                    }
                    break;
                }
                case _OP_LOAD:
                    if(inst._arg1 < 0 || inst._arg1 >= callee->_nliterals ||
                        !load_inline_literal_value(
                        map_inline_slot(callee, call_inst, inst._arg0),
                        callee->_literals[inst._arg1])) {
                        return false;
                    }
                    break;
                case _OP_DLOAD:
                    if(inst._arg1 < 0 || inst._arg1 >= callee->_nliterals ||
                        inst._arg3 < 0 || inst._arg3 >= callee->_nliterals ||
                        !load_inline_literal_value(
                        map_inline_slot(callee, call_inst, inst._arg0),
                        callee->_literals[inst._arg1]) ||
                        !load_inline_literal_value(
                        map_inline_slot(callee, call_inst, inst._arg2),
                        callee->_literals[inst._arg3])) {
                        return false;
                    }
                    break;
                case _OP_LOADBOOL: {
                    SQInteger dst = map_inline_slot(callee, call_inst, inst._arg0);
                    if(dst >= 0 && dst < MAX_FUNC_STACKSIZE) {
                        inline_known_literal[dst] = NULL;
                    }
                    if(dst < 0 || !emit_load_int(dst, inst._arg1 ? 1 : 0) ||
                        !mark_bool_slot(dst)) {
                        return false;
                    }
                    break;
                }
                case _OP_MOVE: {
                    SQInteger dst = map_inline_slot(callee, call_inst, inst._arg0);
                    SQInteger src = map_inline_slot(callee, call_inst, inst._arg1);
                    if(dst < 0 || src < 0) {
                        return false;
                    }
                    if(inline_known_literal[src]) {
                        inline_known_literal[dst] = inline_known_literal[src];
                    }
                    else {
                        inline_known_literal[dst] = NULL;
                        if(!copy_any_slot(dst, src)) {
                            return false;
                        }
                    }
                    break;
                }
                case _OP_DMOVE: {
                    SQInteger dst0 = map_inline_slot(callee, call_inst, inst._arg0);
                    SQInteger src0 = map_inline_slot(callee, call_inst, inst._arg1);
                    SQInteger dst1 = map_inline_slot(callee, call_inst, inst._arg2);
                    SQInteger src1 = map_inline_slot(callee, call_inst, inst._arg3);
                    if(dst0 < 0 || src0 < 0 || dst1 < 0 || src1 < 0) {
                        return false;
                    }
                    if(inline_known_literal[src0]) {
                        inline_known_literal[dst0] = inline_known_literal[src0];
                    }
                    else {
                        inline_known_literal[dst0] = NULL;
                        if(!copy_any_slot(dst0, src0)) {
                            return false;
                        }
                    }
                    if(inline_known_literal[src1]) {
                        inline_known_literal[dst1] = inline_known_literal[src1];
                    }
                    else {
                        inline_known_literal[dst1] = NULL;
                        if(!copy_any_slot(dst1, src1)) {
                            return false;
                        }
                    }
                    break;
                }
                case _OP_GETK: {
                    if(inst._arg1 < 0 || inst._arg1 >= callee->_nliterals) {
                        return false;
                    }
                    SQInteger dst = map_inline_slot(callee, call_inst, inst._arg0);
                    SQInteger base = map_inline_slot(callee, call_inst, inst._arg2);
                    if(dst < 0 || base < 0) {
                        return false;
                    }
                    inline_known_literal[dst] = NULL;
                    const SQObjectPtr &key = callee->_literals[inst._arg1];
                    if(sq_type(key) == OT_INTEGER) {
                        SQInteger index = _integer(key);
                        SQObjectType observed = OT_NULL;
                        SQArray *observed_array = NULL;
                        if(slot_kind[base] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
                            observed = sqjit_a64_observed_array_ptr_value_type(
                                array_ptr_observed[base], index, &observed_array);
                        }
                        else {
                            SQInteger observed_reg = stack_object_reg[base];
                            observed = sqjit_a64_observed_array_value_type(entry_stack,
                                observed_reg, index);
                            if(observed == OT_ARRAY && observed_reg >= 0) {
                                SQObjectPtr observed_value;
                                if(sq_type(entry_stack[observed_reg]) == OT_ARRAY &&
                                    _array(entry_stack[observed_reg])->Get(index,
                                    observed_value) &&
                                    sq_type(observed_value) == OT_ARRAY) {
                                    observed_array = _array(observed_value);
                                }
                            }
                        }
                        if(!emit_array_get_const(dst, base, index, observed,
                            observed_array)) {
                            return false;
                        }
                    }
                    else {
                        SQArray *observed_array = NULL;
                        SQInteger observed_object_ptr = 0;
                        SQObjectType observed = OT_NULL;
                        if(slot_kind[base] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
                            observed = sqjit_a64_observed_object_ptr_value_type(
                                object_ptr_observed[base],
                                object_ptr_observed_type[base], &key,
                                &observed_array, &observed_object_ptr);
                        }
                        else {
                            observed = sqjit_a64_observed_table_value_type(entry_stack,
                                stack_object_reg[base], &key, &observed_array,
                                &observed_object_ptr);
                            if(observed == OT_NULL && stack_object_reg[base] == 0) {
                                observed = sqjit_a64_observed_root_value_type(root_object,
                                    &key, &observed_array, &observed_object_ptr);
                            }
                        }
                        if(!emit_member_get_key(dst, base, &key, observed,
                            observed_array, observed_object_ptr)) {
                            return false;
                        }
                    }
                    break;
                }
                case _OP_GET: {
                    SQInteger dst = map_inline_slot(callee, call_inst, inst._arg0);
                    SQInteger base = map_inline_slot(callee, call_inst, inst._arg1);
                    SQInteger key = map_inline_slot(callee, call_inst, inst._arg2);
                    if(dst < 0 || base < 0 || key < 0) {
                        return false;
                    }
                    inline_known_literal[dst] = NULL;
                    if(known_const[key]) {
                        SQObjectType observed = OT_NULL;
                        SQArray *observed_array = NULL;
                        if(slot_kind[base] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
                            observed = sqjit_a64_observed_array_ptr_value_type(
                                array_ptr_observed[base], const_value[key],
                                &observed_array);
                        }
                        else {
                            SQInteger observed_reg = stack_object_reg[base];
                            observed = sqjit_a64_observed_array_value_type(entry_stack,
                                observed_reg, const_value[key]);
                            if(observed == OT_ARRAY && observed_reg >= 0) {
                                SQObjectPtr observed_value;
                                if(sq_type(entry_stack[observed_reg]) == OT_ARRAY &&
                                    _array(entry_stack[observed_reg])->Get(
                                    const_value[key], observed_value) &&
                                    sq_type(observed_value) == OT_ARRAY) {
                                    observed_array = _array(observed_value);
                                }
                            }
                        }
                        if(!emit_array_get_const(dst, base, const_value[key],
                            observed, observed_array)) {
                            return false;
                        }
                    }
                    else {
                        if(slot_kind[key] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
                            if(!emit_member_get_dynamic_key(dst, base, key)) {
                                return false;
                            }
                            break;
                        }
                        SQInteger observed_index = 0;
                        if(key >= 0 && key < MAX_FUNC_STACKSIZE &&
                            sq_type(entry_stack[key]) == OT_INTEGER) {
                            observed_index = _integer(entry_stack[key]);
                        }
                        SQObjectType observed = OT_NULL;
                        SQArray *observed_array = NULL;
                        if(slot_kind[base] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
                            observed = sqjit_a64_observed_array_ptr_value_type(
                                array_ptr_observed[base], observed_index,
                                &observed_array);
                        }
                        else {
                            SQInteger observed_reg = stack_object_reg[base];
                            observed = sqjit_a64_observed_array_value_type(entry_stack,
                                observed_reg, observed_index);
                            if(observed == OT_ARRAY && observed_reg >= 0) {
                                SQObjectPtr observed_value;
                                if(sq_type(entry_stack[observed_reg]) == OT_ARRAY &&
                                    _array(entry_stack[observed_reg])->Get(
                                    observed_index, observed_value) &&
                                    sq_type(observed_value) == OT_ARRAY) {
                                    observed_array = _array(observed_value);
                                }
                            }
                        }
                        if(!emit_array_get_dynamic(dst, base, key, observed,
                            observed_array)) {
                            return false;
                        }
                    }
                    break;
                }
                case _OP_ADD:
                case _OP_SUB:
                case _OP_MUL:
                case _OP_DIV:
                case _OP_MOD: {
                    SQInteger dst = map_inline_slot(callee, call_inst, inst._arg0);
                    SQInteger right = map_inline_slot(callee, call_inst, inst._arg1);
                    SQInteger left = map_inline_slot(callee, call_inst, inst._arg2);
                    if(dst < 0 || right < 0 || left < 0) {
                        return false;
                    }
                    inline_known_literal[dst] = NULL;
                    if(slot_observed_is_float(left) ||
                        slot_observed_is_float(right)) {
                        if(!emit_float_binary((SQOpcode)inst.op, dst, left, right)) {
                            return false;
                        }
                    }
                    else if(!emit_binary((SQOpcode)inst.op, dst, left, right)) {
                        return false;
                    }
                    break;
                }
                case _OP_NEG: {
                    SQInteger dst = map_inline_slot(callee, call_inst, inst._arg0);
                    SQInteger src = map_inline_slot(callee, call_inst, inst._arg1);
                    if(dst < 0 || src < 0) {
                        return false;
                    }
                    inline_known_literal[dst] = NULL;
                    if(slot_is_float(src)) {
                        if(!emit_float_neg(dst, src)) {
                            return false;
                        }
                    }
                    else if(!emit_integer_neg(dst, src)) {
                        return false;
                    }
                    break;
                }
                case _OP_SET: {
                    SQInteger target = inst._arg0 == 0xFF ? 0xFF :
                        map_inline_slot(callee, call_inst, inst._arg0);
                    SQInteger base = map_inline_slot(callee, call_inst, inst._arg1);
                    SQInteger key = map_inline_slot(callee, call_inst, inst._arg2);
                    SQInteger value = map_inline_slot(callee, call_inst, inst._arg3);
                    if((target != 0xFF && target < 0) || base < 0 ||
                        key < 0 || value < 0) {
                        return false;
                    }
                    if(target >= 0 && target < MAX_FUNC_STACKSIZE) {
                        inline_known_literal[target] = NULL;
                    }
                    if(inline_known_literal[key] &&
                        sq_type(*inline_known_literal[key]) != OT_INTEGER) {
                        if(value >= 0 && value < MAX_FUNC_STACKSIZE &&
                            slot_kind[value] == SQ_JIT_A64_SLOT_BOOL) {
                            if(!emit_member_set_bool_key(target, base,
                                inline_known_literal[key], value)) {
                                return false;
                            }
                        }
                        else if(slot_observed_is_float(value)) {
                            if(!emit_member_set_float_key(target, base,
                                inline_known_literal[key], value)) {
                                return false;
                            }
                        }
                        else if(!emit_member_set_integer_key(target, base,
                            inline_known_literal[key], value)) {
                            return false;
                        }
                    }
                    else {
                        if(value >= 0 && value < MAX_FUNC_STACKSIZE &&
                            slot_kind[value] == SQ_JIT_A64_SLOT_BOOL) {
                            if(!emit_inline_array_set_bool(target, base, key,
                                value)) {
                                return false;
                            }
                        }
                        else if(slot_observed_is_float(value)) {
                            if(!emit_inline_array_set_float(target, base, key,
                                value)) {
                                return false;
                            }
                        }
                        else if(!emit_inline_array_set_integer(target, base, key,
                            value)) {
                            return false;
                        }
                    }
                    break;
                }
                case _OP_RETURN:
                    if(inst._arg0 == 0xFF) {
                        return call_inst._arg0 == 0xFF;
                    }
                    if(call_inst._arg0 == 0xFF) {
                        return true;
                    }
                    return copy_any_slot(call_inst._arg0,
                        map_inline_slot(callee, call_inst, inst._arg1));
                default:
                    return false;
            }
        }
        return false;
    };

    auto emit_array_len_raw = [&](SQInteger dst_local, SQInteger base) -> bool {
        if(dst_local < 0 || base < 0 || base >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            return sqjit_a64_emit_ldr_x(&buf, 11, 31,
                    sqjit_a64_local_disp(base)) &&
                sqjit_a64_emit_cmp_imm(&buf, 11, 0) &&
                emit_guard_fail_branch(SQ_JIT_A64_EQ) &&
                sqjit_a64_emit_ldr_x(&buf, 9, 11, SQArray::RawSizeOffset()) &&
                sqjit_a64_emit_str_x(&buf, 9, 31,
                    sqjit_a64_local_disp(dst_local));
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT && stack_object_reg[base] >= 0) {
            return sqjit_a64_emit_type_guard(&buf, stack_object_reg[base],
                    OT_ARRAY, guard_relocs, &nguard_relocs) &&
                sqjit_a64_emit_ldr_x(&buf, 11, 19,
                    sqjit_a64_stack_value_disp(stack_object_reg[base])) &&
                sqjit_a64_emit_ldr_x(&buf, 9, 11, SQArray::RawSizeOffset()) &&
                sqjit_a64_emit_str_x(&buf, 9, 31,
                    sqjit_a64_local_disp(dst_local));
        }
        return false;
    };

    auto emit_array_len = [&](SQInteger dst, SQInteger base) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            !emit_array_len_raw(dst, base) ||
            !mark_int_slot(dst)) {
            return false;
        }
        entry_loaded[dst] = true;
        return true;
    };

    auto emit_array_set_integer = [&](SQInteger target, SQInteger base, SQInteger key,
        SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || value < 0 || value >= MAX_FUNC_STACKSIZE ||
            !ensure_int_slot(key) || !ensure_int_slot(value)) {
            return false;
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31, sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_ldr_x(&buf, 2, 31, sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31, sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_set_integer_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero() ||
                !copy_int_slot(target, value)) {
                return false;
            }
            return true;
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT && stack_object_reg[base] >= 0) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31, sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_mov_reg(&buf, 1, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, stack_object_reg[base]) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31, sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_ldr_x(&buf, 4, 31, sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_set_integer_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero() ||
                !copy_int_slot(target, value)) {
                return false;
            }
            return true;
        }
        return false;
    };

    auto emit_array_set_bool = [&](SQInteger target, SQInteger base, SQInteger key,
        SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || value < 0 || value >= MAX_FUNC_STACKSIZE ||
            !ensure_int_slot(key) || !ensure_int_slot(value)) {
            return false;
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31, sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_ldr_x(&buf, 2, 31, sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31, sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_set_bool_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero() ||
                !copy_int_slot(target, value)) {
                return false;
            }
            return true;
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT && stack_object_reg[base] >= 0) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31, sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_mov_reg(&buf, 1, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, stack_object_reg[base]) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31, sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_ldr_x(&buf, 4, 31, sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_set_bool_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero() ||
                !copy_int_slot(target, value)) {
                return false;
            }
            return true;
        }
        return false;
    };

    auto emit_array_set_float = [&](SQInteger target, SQInteger base, SQInteger key,
        SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || value < 0 || value >= MAX_FUNC_STACKSIZE ||
            !ensure_int_slot(key) || !ensure_float_slot(value)) {
            return false;
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31, sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(base)) ||
                !sqjit_a64_emit_ldr_x(&buf, 2, 31, sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_add_imm(&buf, 3, 31, sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_set_float_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero() ||
                !copy_float_slot(target, value)) {
                return false;
            }
            return true;
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT && stack_object_reg[base] >= 0) {
            if(!sqjit_a64_emit_add_imm(&buf, 0, 31, sqjit_a64_local_disp(write_log_slot)) ||
                !sqjit_a64_emit_mov_reg(&buf, 1, 19) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 2, stack_object_reg[base]) ||
                !sqjit_a64_emit_ldr_x(&buf, 3, 31, sqjit_a64_local_disp(key)) ||
                !sqjit_a64_emit_add_imm(&buf, 4, 31, sqjit_a64_local_disp(value)) ||
                !sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_set_float_logged) ||
                !sqjit_a64_emit_blr_x16(&buf) ||
                !emit_guard_on_x0_zero() ||
                !copy_float_slot(target, value)) {
                return false;
            }
            return true;
        }
        return false;
    };

    auto emit_array_append_integer = [&](SQInteger base, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            value < 0 || value >= MAX_FUNC_STACKSIZE || !ensure_int_slot(value)) {
            return false;
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            return sqjit_a64_emit_add_imm(&buf, 0, 31, sqjit_a64_local_disp(write_log_slot)) &&
                sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(base)) &&
                sqjit_a64_emit_ldr_x(&buf, 2, 31, sqjit_a64_local_disp(value)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_integer_logged) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero();
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT && stack_object_reg[base] >= 0) {
            return sqjit_a64_emit_add_imm(&buf, 0, 31, sqjit_a64_local_disp(write_log_slot)) &&
                sqjit_a64_emit_mov_reg(&buf, 1, 19) &&
                sqjit_a64_emit_mov_imm_x(&buf, 2, stack_object_reg[base]) &&
                sqjit_a64_emit_ldr_x(&buf, 3, 31, sqjit_a64_local_disp(value)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_append_integer_logged) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero();
        }
        return false;
    };

    auto emit_array_append_float = [&](SQInteger base, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            value < 0 || value >= MAX_FUNC_STACKSIZE || !ensure_float_slot(value)) {
            return false;
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
            return sqjit_a64_emit_add_imm(&buf, 0, 31, sqjit_a64_local_disp(write_log_slot)) &&
                sqjit_a64_emit_ldr_x(&buf, 1, 31, sqjit_a64_local_disp(base)) &&
                sqjit_a64_emit_add_imm(&buf, 2, 31, sqjit_a64_local_disp(value)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_ptr_append_float_logged) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero();
        }
        if(slot_kind[base] == SQ_JIT_A64_SLOT_STACK_OBJECT && stack_object_reg[base] >= 0) {
            return sqjit_a64_emit_add_imm(&buf, 0, 31, sqjit_a64_local_disp(write_log_slot)) &&
                sqjit_a64_emit_mov_reg(&buf, 1, 19) &&
                sqjit_a64_emit_mov_imm_x(&buf, 2, stack_object_reg[base]) &&
                sqjit_a64_emit_add_imm(&buf, 3, 31, sqjit_a64_local_disp(value)) &&
                sqjit_a64_emit_mov_imm_x(&buf, 16,
                    (SQInteger)(intptr_t)sqjit_a64_helper_array_append_float_logged) &&
                sqjit_a64_emit_blr_x16(&buf) &&
                emit_guard_on_x0_zero();
        }
        return false;
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

    auto comparith_opcode = [&](SQInteger op, SQOpcode *out) -> bool {
        if(!out) {
            return false;
        }
        switch(op) {
            case '+': *out = _OP_ADD; return true;
            case '-': *out = _OP_SUB; return true;
            case '*': *out = _OP_MUL; return true;
            case '/': *out = _OP_DIV; return true;
            case '%': *out = _OP_MOD; return true;
            default: return false;
        }
    };

    auto slot_next_used_by_float_binary = [&](SQInteger from_ip,
        SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        for(SQInteger look_ip = from_ip + 1; look_ip <= end_ip; look_ip++) {
            const SQInstruction &look = proto->_instructions[look_ip];
            if(look.op == _OP_LINE) {
                continue;
            }
            if((look.op == _OP_ADD || look.op == _OP_SUB ||
                look.op == _OP_MUL || look.op == _OP_DIV) &&
                (look._arg1 == slot || look._arg2 == slot)) {
                SQInteger other = look._arg1 == slot ? look._arg2 : look._arg1;
                return slot_observed_is_float(other);
            }
            if(sqjit_a64_loop_instruction_reads_slot(look, slot) ||
                sqjit_a64_loop_instruction_writes_slot(look, slot)) {
                return false;
            }
        }
        return false;
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
    if(len_hoist.valid && !emit_array_len_raw(len_hoist.local_slot,
        len_hoist.base_slot)) {
        return sqjit_a64_reject(proto, len_hoist.prepcall_ip,
            "unsupported loop len hoist");
    }

    auto hoist_supplies_slot = [&](SQInteger slot) -> bool {
        return len_hoist.valid && slot == len_hoist.len_slot;
    };

    auto emit_loop_int_operand = [&](unsigned reg, SQInteger slot) -> bool {
        if(hoist_supplies_slot(slot)) {
            return sqjit_a64_emit_ldr_x(&buf, reg, 31,
                sqjit_a64_local_disp(len_hoist.local_slot));
        }
        return ensure_int_slot(slot) &&
            sqjit_a64_emit_ldr_x(&buf, reg, 31, sqjit_a64_local_disp(slot));
    };

    for(SQInteger ip = start_ip; ip <= end_ip; ip++) {
        ip_to_offset[ip] = buf.size;
        if(len_hoist.valid &&
            (ip == len_hoist.prepcall_ip || ip == len_hoist.call_ip)) {
            continue;
        }
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
            case _OP_LOADNULLS:
                if(!emit_load_nulls(inst._arg0, inst._arg1)) {
                    return sqjit_a64_reject(proto, ip, "unsupported loop LOADNULLS");
                }
                break;
            case _OP_MOVE:
                if(inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE &&
                    slot_kind[inst._arg1] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
                    if(!copy_array_ptr_slot(inst._arg0, inst._arg1)) {
                        return false;
                    }
                }
                else if(inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE &&
                    slot_kind[inst._arg1] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
                    if(!copy_object_ptr_slot(inst._arg0, inst._arg1)) {
                        return false;
                    }
                }
                else if(slot_is_float(inst._arg1)) {
                    if(!copy_float_slot(inst._arg0, inst._arg1)) {
                        return false;
                    }
                }
                else if(!copy_int_slot(inst._arg0, inst._arg1)) {
                    return false;
                }
                break;
            case _OP_DMOVE:
                if(inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE &&
                    slot_kind[inst._arg1] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
                    if(!copy_array_ptr_slot(inst._arg0, inst._arg1)) {
                        return false;
                    }
                }
                else if(inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE &&
                    slot_kind[inst._arg1] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
                    if(!copy_object_ptr_slot(inst._arg0, inst._arg1)) {
                        return false;
                    }
                }
                else if(slot_is_float(inst._arg1)) {
                    if(!copy_float_slot(inst._arg0, inst._arg1)) {
                        return false;
                    }
                }
                else if(!copy_int_slot(inst._arg0, inst._arg1)) {
                    return false;
                }
                if(inst._arg3 >= 0 && inst._arg3 < MAX_FUNC_STACKSIZE &&
                    slot_kind[inst._arg3] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
                    if(!copy_array_ptr_slot(inst._arg2, inst._arg3)) {
                        return false;
                    }
                }
                else if(inst._arg3 >= 0 && inst._arg3 < MAX_FUNC_STACKSIZE &&
                    slot_kind[inst._arg3] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
                    if(!copy_object_ptr_slot(inst._arg2, inst._arg3)) {
                        return false;
                    }
                }
                else if(slot_is_float(inst._arg3)) {
                    if(!copy_float_slot(inst._arg2, inst._arg3)) {
                        return false;
                    }
                }
                else if(!copy_int_slot(inst._arg2, inst._arg3)) {
                    return false;
                }
                break;
            case _OP_GETK: {
                if(inst._arg1 < 0 || inst._arg1 >= proto->_nliterals) {
                    return sqjit_a64_reject(proto, ip, "unsupported loop GETK key");
                }
                if(sq_type(proto->_literals[inst._arg1]) == OT_INTEGER) {
                    SQInteger index = _integer(proto->_literals[inst._arg1]);
                    SQObjectType observed = OT_NULL;
                    SQArray *observed_array = NULL;
                    if(inst._arg2 >= 0 && inst._arg2 < MAX_FUNC_STACKSIZE &&
                        slot_kind[inst._arg2] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
                        observed = sqjit_a64_observed_array_ptr_value_type(
                            array_ptr_observed[inst._arg2], index, &observed_array);
                    }
                    else {
                        SQInteger observed_reg = (inst._arg2 >= 0 && inst._arg2 < MAX_FUNC_STACKSIZE) ?
                            stack_object_reg[inst._arg2] : -1;
                        observed = sqjit_a64_observed_array_value_type(entry_stack,
                            observed_reg, index);
                        if(observed == OT_ARRAY && observed_reg >= 0) {
                            SQObjectPtr observed_value;
                            if(sq_type(entry_stack[observed_reg]) == OT_ARRAY &&
                                _array(entry_stack[observed_reg])->Get(index, observed_value) &&
                                sq_type(observed_value) == OT_ARRAY) {
                                observed_array = _array(observed_value);
                            }
                        }
                    }
                    bool numeric_float = (observed == OT_FLOAT ||
                        observed == OT_INTEGER) &&
                        slot_next_used_by_float_binary(ip, inst._arg0);
                    if(numeric_float) {
                        if(!emit_array_element_get_number_float_direct(inst._arg0,
                            inst._arg2, true, index, -1)) {
                            return sqjit_a64_reject(proto, ip,
                                "unsupported loop numeric GETK array read");
                        }
                    }
                    else if(!emit_array_get_const(inst._arg0, inst._arg2, index, observed,
                        observed_array)) {
                        return sqjit_a64_reject(proto, ip, "unsupported loop GETK array read");
                    }
                }
                else {
                    SQArray *observed_array = NULL;
                    SQInteger observed_object_ptr = 0;
                    SQObjectType observed = OT_NULL;
                    if(inst._arg2 >= 0 && inst._arg2 < MAX_FUNC_STACKSIZE &&
                        slot_kind[inst._arg2] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
                        observed = sqjit_a64_observed_object_ptr_value_type(
                            object_ptr_observed[inst._arg2],
                            object_ptr_observed_type[inst._arg2],
                            &proto->_literals[inst._arg1], &observed_array,
                            &observed_object_ptr);
                    }
                    else {
                        SQInteger observed_reg = (inst._arg2 >= 0 && inst._arg2 < MAX_FUNC_STACKSIZE) ?
                            stack_object_reg[inst._arg2] : -1;
                        observed = sqjit_a64_observed_table_value_type(entry_stack,
                            observed_reg, &proto->_literals[inst._arg1], &observed_array,
                            &observed_object_ptr);
                        if(observed == OT_NULL && observed_reg == 0) {
                            observed = sqjit_a64_observed_root_value_type(root_object,
                                &proto->_literals[inst._arg1], &observed_array,
                                &observed_object_ptr);
                        }
                    }
                    if(!emit_table_get(inst._arg0, inst._arg2, inst._arg1, observed,
                        observed_array, observed_object_ptr)) {
                        if(sqjit_diag_trace_enabled()) {
                            SQInteger observed_reg =
                                (inst._arg2 >= 0 && inst._arg2 < MAX_FUNC_STACKSIZE) ?
                                stack_object_reg[inst._arg2] : -1;
                            SQObjectType stack_type =
                                (observed_reg >= 0) ? sq_type(entry_stack[observed_reg]) : OT_NULL;
                            scprintf(_SC("[sqjit:a64] loop GETK miss detail proto '%s' ip %d base=%d kind=%d stackreg=%d stacktype=%d keytype=%d observed=%d\n"),
                                sqjit_a64_proto_name(proto), (SQInt32)ip,
                                (SQInt32)inst._arg2,
                                (SQInt32)((inst._arg2 >= 0 &&
                                inst._arg2 < MAX_FUNC_STACKSIZE) ?
                                slot_kind[inst._arg2] : SQ_JIT_A64_SLOT_UNKNOWN),
                                (SQInt32)observed_reg, (SQInt32)stack_type,
                                (SQInt32)sq_type(proto->_literals[inst._arg1]),
                                (SQInt32)observed);
                            if(sq_type(proto->_literals[inst._arg1]) == OT_STRING) {
                                scprintf(_SC("[sqjit:a64] loop GETK miss key '%s'\n"),
                                    _stringval(proto->_literals[inst._arg1]));
                            }
                        }
                        return sqjit_a64_reject(proto, ip, "unsupported loop GETK table read");
                    }
                }
                break;
            }
            case _OP_GET: {
                if(known_const[inst._arg2]) {
                    SQObjectType observed = OT_NULL;
                    SQArray *observed_array = NULL;
                    if(inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE &&
                        slot_kind[inst._arg1] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
                        observed = sqjit_a64_observed_array_ptr_value_type(
                            array_ptr_observed[inst._arg1], const_value[inst._arg2],
                            &observed_array);
                    }
                    else {
                        SQInteger observed_reg = (inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE) ?
                            stack_object_reg[inst._arg1] : -1;
                        observed = sqjit_a64_observed_array_value_type(entry_stack,
                            observed_reg, const_value[inst._arg2]);
                        if(observed == OT_ARRAY && observed_reg >= 0) {
                            SQObjectPtr observed_value;
                            if(sq_type(entry_stack[observed_reg]) == OT_ARRAY &&
                                _array(entry_stack[observed_reg])->Get(
                                    const_value[inst._arg2], observed_value) &&
                                sq_type(observed_value) == OT_ARRAY) {
                                observed_array = _array(observed_value);
                            }
                        }
                    }
                    bool numeric_float = (observed == OT_FLOAT ||
                        observed == OT_INTEGER) &&
                        slot_next_used_by_float_binary(ip, inst._arg0);
                    if(numeric_float) {
                        if(!emit_array_element_get_number_float_direct(inst._arg0,
                            inst._arg1, true, const_value[inst._arg2], -1)) {
                            return sqjit_a64_reject(proto, ip,
                                "unsupported loop numeric const GET array read");
                        }
                    }
                    else if(!emit_array_get_const(inst._arg0, inst._arg1,
                        const_value[inst._arg2], observed, observed_array)) {
                        return sqjit_a64_reject(proto, ip, "unsupported loop const GET array read");
                    }
                }
                else {
                    if(inst._arg2 >= 0 && inst._arg2 < MAX_FUNC_STACKSIZE &&
                        slot_kind[inst._arg2] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
                        if(!emit_member_get_dynamic_key(inst._arg0, inst._arg1,
                            inst._arg2)) {
                            return sqjit_a64_reject(proto, ip,
                                "unsupported loop dynamic GET member read");
                        }
                        break;
                    }
                    SQInteger observed_index = 0;
                    if(inst._arg2 >= 0 && inst._arg2 < MAX_FUNC_STACKSIZE &&
                        sq_type(entry_stack[inst._arg2]) == OT_INTEGER) {
                        observed_index = _integer(entry_stack[inst._arg2]);
                    }
                    SQObjectType observed = OT_NULL;
                    SQArray *observed_array = NULL;
                    if(inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE &&
                        slot_kind[inst._arg1] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
                        observed = sqjit_a64_observed_array_ptr_value_type(
                            array_ptr_observed[inst._arg1], observed_index, &observed_array);
                    }
                    else {
                        SQInteger observed_reg = (inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE) ?
                            stack_object_reg[inst._arg1] : -1;
                        observed = sqjit_a64_observed_array_value_type(entry_stack,
                            observed_reg, observed_index);
                        if(observed == OT_ARRAY && observed_reg >= 0) {
                            SQObjectPtr observed_value;
                            if(sq_type(entry_stack[observed_reg]) == OT_ARRAY &&
                                _array(entry_stack[observed_reg])->Get(observed_index, observed_value) &&
                                sq_type(observed_value) == OT_ARRAY) {
                                observed_array = _array(observed_value);
                            }
                        }
                    }
                    bool numeric_float = (observed == OT_FLOAT ||
                        observed == OT_INTEGER) &&
                        slot_next_used_by_float_binary(ip, inst._arg0);
                    if(numeric_float) {
                        if(!emit_array_element_get_number_float_direct(inst._arg0,
                            inst._arg1, false, 0, inst._arg2)) {
                            return sqjit_a64_reject(proto, ip,
                                "unsupported loop numeric dynamic GET array read");
                        }
                    }
                    else if(!emit_array_get_dynamic(inst._arg0, inst._arg1, inst._arg2, observed,
                        observed_array)) {
                        return sqjit_a64_reject(proto, ip, "unsupported loop dynamic GET array read");
                    }
                }
                break;
            }
            case _OP_PREPCALLK:
                if(inst._arg0 < 0 || inst._arg0 >= MAX_FUNC_STACKSIZE ||
                    inst._arg1 < 0 || inst._arg1 >= proto->_nliterals ||
                    sq_type(proto->_literals[inst._arg1]) != OT_STRING ||
                    inst._arg2 < 0 || inst._arg2 >= MAX_FUNC_STACKSIZE ||
                    (slot_kind[inst._arg2] != SQ_JIT_A64_SLOT_ARRAY_PTR &&
                    slot_kind[inst._arg2] != SQ_JIT_A64_SLOT_OBJECT_PTR &&
                    slot_kind[inst._arg2] != SQ_JIT_A64_SLOT_INT &&
                    slot_kind[inst._arg2] != SQ_JIT_A64_SLOT_FLOAT &&
                    slot_kind[inst._arg2] != SQ_JIT_A64_SLOT_BOOL &&
                    (slot_kind[inst._arg2] != SQ_JIT_A64_SLOT_STACK_OBJECT ||
                    stack_object_reg[inst._arg2] < 0))) {
                    return sqjit_a64_reject(proto, ip, "unsupported loop PREPCALLK");
                }
                {
                    SQInteger receiver_slot = inst._arg2;
                    if(inst._arg3 >= 0 && inst._arg3 < MAX_FUNC_STACKSIZE) {
                        if(inst._arg3 == inst._arg0) {
                            return sqjit_a64_reject(proto, ip,
                                "unsupported loop PREPCALLK");
                        }
                        if(slot_kind[inst._arg2] == SQ_JIT_A64_SLOT_STACK_OBJECT) {
                            if(!copy_stack_object_alias(inst._arg3, inst._arg2)) {
                                return sqjit_a64_reject(proto, ip,
                                    "unsupported loop PREPCALLK");
                            }
                        }
                        else if(!copy_any_slot(inst._arg3, inst._arg2)) {
                            return sqjit_a64_reject(proto, ip,
                                "unsupported loop PREPCALLK");
                        }
                        receiver_slot = inst._arg3;
                    }
                    const SQChar *member_name = _stringval(proto->_literals[inst._arg1]);
                    bool base_is_number = slot_kind[receiver_slot] == SQ_JIT_A64_SLOT_INT ||
                        slot_kind[receiver_slot] == SQ_JIT_A64_SLOT_FLOAT ||
                        slot_kind[receiver_slot] == SQ_JIT_A64_SLOT_BOOL;
                    if(slot_kind[receiver_slot] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
                        stack_object_reg[receiver_slot] >= 0) {
                        SQObjectType base_type =
                            sq_type(entry_stack[stack_object_reg[receiver_slot]]);
                        base_is_number = base_type == OT_INTEGER || base_type == OT_FLOAT ||
                            base_type == OT_BOOL;
                    }
                    if(base_is_number && scstrcmp(member_name, _SC("tofloat")) == 0) {
                        prepared_number_conversion[inst._arg0] =
                            SQ_JIT_A64_NUMBER_CONVERSION_TOFLOAT;
                        prepared_number_conversion_base[inst._arg0] = receiver_slot;
                    }
                    else if(base_is_number && scstrcmp(member_name, _SC("tointeger")) == 0) {
                        prepared_number_conversion[inst._arg0] =
                            SQ_JIT_A64_NUMBER_CONVERSION_TOINTEGER;
                        prepared_number_conversion_base[inst._arg0] = receiver_slot;
                    }
                    else if(scstrcmp(member_name, _SC("len")) == 0) {
                        prepared_array_len_base[inst._arg0] = receiver_slot;
                    }
                    else if(scstrcmp(member_name, _SC("append")) == 0 ||
                        scstrcmp(member_name, _SC("push")) == 0) {
                        prepared_array_append_base[inst._arg0] = receiver_slot;
                    }
                    else {
                        SQNativeClosure *native_callee = NULL;
                        SQJitA64MathIntrinsic intrinsic = SQ_JIT_A64_MATH_NONE;
                        SQInteger math_nargs = 0;
                        if(observed_member_native_closure(receiver_slot, inst._arg1,
                            &native_callee) &&
                            sqjit_a64_math_intrinsic_from_native(native_callee,
                            &intrinsic, &math_nargs) &&
                            emit_member_native_closure_guard(receiver_slot, inst._arg1,
                            native_callee)) {
                            prepared_math_intrinsic[inst._arg0] = intrinsic;
                            prepared_math_nargs[inst._arg0] = math_nargs;
                            break;
                        }

                        SQClosure *callee = NULL;
                        if(!observed_member_closure(receiver_slot, inst._arg1, &callee) ||
                            !emit_member_closure_guard(receiver_slot, inst._arg1, callee)) {
                            return sqjit_a64_reject(proto, ip, "unsupported loop PREPCALLK");
                        }
                        prepared_direct_closure[inst._arg0] = callee;
                    }
                }
                break;
            case _OP_CALL:
                if(inst._arg1 < 0 || inst._arg1 >= MAX_FUNC_STACKSIZE) {
                    return sqjit_a64_reject(proto, ip, "unsupported loop CALL");
                }
                if(prepared_array_len_base[inst._arg1] >= 0) {
                    if(inst._arg0 == 0xFF || inst._arg3 != 1 ||
                        !emit_array_len(inst._arg0, prepared_array_len_base[inst._arg1])) {
                        return sqjit_a64_reject(proto, ip, "unsupported loop CALL");
                    }
                    prepared_array_len_base[inst._arg1] = -1;
                }
                else if(prepared_array_append_base[inst._arg1] >= 0) {
                    SQInteger value_slot = inst._arg2 + 1;
                    if(inst._arg0 != 0xFF || inst._arg3 != 2 ||
                        inst._arg2 < 0 || value_slot >= MAX_FUNC_STACKSIZE) {
                        return sqjit_a64_reject(proto, ip, "unsupported loop CALL");
                    }
                    if(slot_is_float(value_slot)) {
                        if(!emit_array_append_float(prepared_array_append_base[inst._arg1],
                            value_slot)) {
                            return sqjit_a64_reject(proto, ip, "unsupported loop CALL");
                        }
                    }
                    else if(!emit_array_append_integer(prepared_array_append_base[inst._arg1],
                        value_slot)) {
                        return sqjit_a64_reject(proto, ip, "unsupported loop CALL");
                    }
                    prepared_array_append_base[inst._arg1] = -1;
                }
                else if(prepared_number_conversion[inst._arg1] !=
                    SQ_JIT_A64_NUMBER_CONVERSION_NONE) {
                    SQJitA64NumberConversion conversion =
                        prepared_number_conversion[inst._arg1];
                    SQInteger conversion_base =
                        prepared_number_conversion_base[inst._arg1];
                    if(inst._arg3 != 1 ||
                        !emit_number_conversion(inst._arg0, conversion,
                        conversion_base)) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported loop number conversion CALL");
                    }
                    prepared_number_conversion[inst._arg1] =
                        SQ_JIT_A64_NUMBER_CONVERSION_NONE;
                    prepared_number_conversion_base[inst._arg1] = -1;
                }
                else if(prepared_math_intrinsic[inst._arg1] != SQ_JIT_A64_MATH_NONE) {
                    SQJitA64MathIntrinsic intrinsic = prepared_math_intrinsic[inst._arg1];
                    SQInteger math_nargs = prepared_math_nargs[inst._arg1];
                    if(inst._arg0 == 0xFF || math_nargs <= 0 ||
                        inst._arg3 != math_nargs + 1 ||
                        !emit_math_call(inst._arg0, intrinsic, math_nargs,
                        inst._arg2 + 1)) {
                        return sqjit_a64_reject(proto, ip, "unsupported loop math CALL");
                    }
                    prepared_math_intrinsic[inst._arg1] = SQ_JIT_A64_MATH_NONE;
                    prepared_math_nargs[inst._arg1] = 0;
                }
                else if(prepared_direct_closure[inst._arg1]) {
                    SQClosure *callee = prepared_direct_closure[inst._arg1];
                    if(!emit_inline_leaf_call(callee, inst)) {
                        return sqjit_a64_reject(proto, ip, "unsupported loop direct CALL");
                    }
                    prepared_direct_closure[inst._arg1] = NULL;
                }
                else if(slot_kind[inst._arg1] == SQ_JIT_A64_SLOT_STACK_OBJECT &&
                    stack_object_reg[inst._arg1] >= 0 &&
                    sq_type(entry_stack[stack_object_reg[inst._arg1]]) == OT_CLOSURE) {
                    SQClosure *callee = _closure(entry_stack[stack_object_reg[inst._arg1]]);
                    if(!emit_closure_slot_guard(inst._arg1, callee) ||
                        !emit_inline_leaf_call(callee, inst)) {
                        return sqjit_a64_reject(proto, ip, "unsupported loop direct CALL");
                    }
                }
                else {
                    return sqjit_a64_reject(proto, ip, "unsupported loop CALL");
                }
                break;
            case _OP_COMPARITH: {
                SQInteger source = (SQInteger)(((SQUnsignedInteger)inst._arg1 &
                    0xFFFF0000u) >> 16);
                SQInteger value = (SQInteger)((SQUnsignedInteger)inst._arg1 &
                    0x0000FFFFu);
                SQInteger key = inst._arg2;
                SQInteger scratch = inline_scratch_base;
                SQOpcode op = _OP_ADD;
                if(source < 0 || source >= MAX_FUNC_STACKSIZE ||
                    value < 0 || value >= MAX_FUNC_STACKSIZE ||
                    key < 0 || key >= MAX_FUNC_STACKSIZE ||
                    scratch < 0 || scratch >= MAX_FUNC_STACKSIZE ||
                    !comparith_opcode(inst._arg3, &op)) {
                    return sqjit_a64_reject(proto, ip, "unsupported loop COMPARITH");
                }

                SQObjectType observed = OT_NULL;
                SQArray *observed_array = NULL;
                if(known_const[key]) {
                    if(slot_kind[source] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
                        observed = sqjit_a64_observed_array_ptr_value_type(
                            array_ptr_observed[source], const_value[key],
                            &observed_array);
                    }
                    else {
                        SQInteger observed_reg = stack_object_reg[source];
                        observed = sqjit_a64_observed_array_value_type(entry_stack,
                            observed_reg, const_value[key]);
                        if(observed == OT_ARRAY && observed_reg >= 0) {
                            SQObjectPtr observed_value;
                            if(sq_type(entry_stack[observed_reg]) == OT_ARRAY &&
                                _array(entry_stack[observed_reg])->Get(
                                const_value[key], observed_value) &&
                                sq_type(observed_value) == OT_ARRAY) {
                                observed_array = _array(observed_value);
                            }
                        }
                    }
                    if(!emit_array_get_const(scratch, source, const_value[key],
                        observed, observed_array)) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported loop COMPARITH get");
                    }
                }
                else {
                    SQInteger observed_index = 0;
                    if(sq_type(entry_stack[key]) == OT_INTEGER) {
                        observed_index = _integer(entry_stack[key]);
                    }
                    if(slot_kind[source] == SQ_JIT_A64_SLOT_ARRAY_PTR) {
                        observed = sqjit_a64_observed_array_ptr_value_type(
                            array_ptr_observed[source], observed_index,
                            &observed_array);
                    }
                    else {
                        SQInteger observed_reg = stack_object_reg[source];
                        observed = sqjit_a64_observed_array_value_type(entry_stack,
                            observed_reg, observed_index);
                        if(observed == OT_ARRAY && observed_reg >= 0) {
                            SQObjectPtr observed_value;
                            if(sq_type(entry_stack[observed_reg]) == OT_ARRAY &&
                                _array(entry_stack[observed_reg])->Get(
                                observed_index, observed_value) &&
                                sq_type(observed_value) == OT_ARRAY) {
                                observed_array = _array(observed_value);
                            }
                        }
                    }
                    if(!emit_array_get_dynamic(scratch, source, key, observed,
                        observed_array)) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported loop COMPARITH get");
                    }
                }

                if(slot_is_float(scratch) || slot_observed_is_float(value)) {
                    if(!emit_float_binary(op, scratch, scratch, value) ||
                        !emit_array_set_float(inst._arg0, source, key, scratch)) {
                        return sqjit_a64_reject(proto, ip,
                            "unsupported loop COMPARITH float");
                    }
                }
                else if(!emit_binary(op, scratch, scratch, value) ||
                    !emit_array_set_integer(inst._arg0, source, key, scratch)) {
                    return sqjit_a64_reject(proto, ip,
                        "unsupported loop COMPARITH integer");
                }
                break;
            }
            case _OP_SET:
                if(inst._arg3 >= 0 && inst._arg3 < MAX_FUNC_STACKSIZE &&
                    slot_kind[inst._arg3] == SQ_JIT_A64_SLOT_BOOL) {
                    if(!emit_array_set_bool(inst._arg0, inst._arg1, inst._arg2,
                        inst._arg3)) {
                        return sqjit_a64_reject(proto, ip, "unsupported loop SET");
                    }
                }
                else if(slot_is_float(inst._arg3)) {
                    if(!emit_array_set_float(inst._arg0, inst._arg1, inst._arg2,
                        inst._arg3)) {
                        return sqjit_a64_reject(proto, ip, "unsupported loop SET");
                    }
                }
                else if(!emit_array_set_integer(inst._arg0, inst._arg1, inst._arg2,
                    inst._arg3)) {
                    return sqjit_a64_reject(proto, ip, "unsupported loop SET");
                }
                break;
            case _OP_ADD:
            case _OP_SUB:
            case _OP_MUL:
            case _OP_DIV:
            case _OP_MOD:
                if(slot_observed_is_float(inst._arg1) ||
                    slot_observed_is_float(inst._arg2)) {
                    if(!emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                        return false;
                    }
                }
                else if(!emit_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                    return false;
                }
                break;
            case _OP_NEG:
                if(slot_is_float(inst._arg1)) {
                    if(!emit_float_neg(inst._arg0, inst._arg1)) {
                        return false;
                    }
                }
                else if(!emit_integer_neg(inst._arg0, inst._arg1)) {
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
                if(ip == header_ip && !emit_mark_body_entered()) {
                    return false;
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
                if(!hoist_supplies_slot(inst._arg0) &&
                    !hoist_supplies_slot(inst._arg2) &&
                    (slot_is_float(inst._arg0) || slot_is_float(inst._arg2))) {
                    if(!ensure_float_slot(inst._arg0) || !ensure_float_slot(inst._arg2) ||
                        !sqjit_a64_emit_ldr_s(&buf, 0, 31, sqjit_a64_local_disp(inst._arg2)) ||
                        !sqjit_a64_emit_ldr_s(&buf, 1, 31, sqjit_a64_local_disp(inst._arg0)) ||
                        !sqjit_a64_emit_fcmp_s(&buf, 0, 1) ||
                        !sqjit_a64_emit_bcond_placeholder(&buf, false_cond, &patch_offset) ||
                        !record_branch(patch_offset, target_ip, true, false_cond)) {
                        return sqjit_a64_reject(proto, ip, "unsupported loop float JCMP");
                    }
                }
                else if(!emit_loop_int_operand(9, inst._arg2) ||
                    !emit_loop_int_operand(10, inst._arg0) ||
                    !sqjit_a64_emit_cmp_reg(&buf, 9, 10) ||
                    !sqjit_a64_emit_bcond_placeholder(&buf, false_cond, &patch_offset) ||
                    !record_branch(patch_offset, target_ip, true, false_cond)) {
                    return sqjit_a64_reject(proto, ip, "unsupported loop JCMP");
                }
                if(ip == header_ip && !emit_mark_body_entered()) {
                    return false;
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
                return sqjit_a64_reject(proto, ip,
                    sqjit_a64_unsupported_loop_opcode_reason(inst.op));
        }
    }

    auto emit_refcounted_stack_store_scalar = [&](SQInteger stack_slot) -> bool {
        if(stack_slot < 0 || stack_slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        const void *helper = NULL;
        if(slot_kind[stack_slot] == SQ_JIT_A64_SLOT_FLOAT) {
            helper = (const void *)sqjit_a64_helper_store_stack_float;
        }
        else if(slot_kind[stack_slot] == SQ_JIT_A64_SLOT_BOOL) {
            helper = (const void *)sqjit_a64_helper_store_stack_bool;
        }
        else if(slot_kind[stack_slot] == SQ_JIT_A64_SLOT_INT) {
            helper = (const void *)sqjit_a64_helper_store_stack_integer;
        }
        else {
            return false;
        }

        if(!sqjit_a64_emit_mov_reg(&buf, 0, 19) ||
            !sqjit_a64_emit_mov_imm_x(&buf, 1, stack_slot)) {
            return false;
        }
        if(slot_kind[stack_slot] == SQ_JIT_A64_SLOT_FLOAT) {
            if(!sqjit_a64_emit_add_imm(&buf, 2, 31,
                sqjit_a64_local_disp(stack_slot))) {
                return false;
            }
        }
        else if(!sqjit_a64_emit_ldr_x(&buf, 2, 31,
            sqjit_a64_local_disp(stack_slot))) {
            return false;
        }

        return sqjit_a64_emit_mov_imm_x(&buf, 16,
            (SQInteger)(intptr_t)helper) &&
            sqjit_a64_emit_blr_x16(&buf);
    };

    SQInteger exit_offset = buf.size;
    SQInteger skip_writeback_patch = 0;
    if(!sqjit_a64_emit_ldr_x(&buf, 9, 31,
        sqjit_a64_local_disp(body_entered_slot)) ||
        !sqjit_a64_emit_cmp_imm(&buf, 9, 0) ||
        !sqjit_a64_emit_bcond_placeholder(&buf, SQ_JIT_A64_EQ,
        &skip_writeback_patch)) {
        return false;
    }
    for(SQInteger n = 0; n < proto->_stacksize; n++) {
        if(!dirty_slot[n]) {
            continue;
        }
        if(slot_kind[n] == SQ_JIT_A64_SLOT_ARRAY_PTR ||
            slot_kind[n] == SQ_JIT_A64_SLOT_OBJECT_PTR) {
            if(sqjit_a64_loop_slot_is_live_out(proto, exit_ip, n)) {
                return false;
            }
            continue;
        }
        if(!entry_loaded[n]) {
            if(sqjit_a64_loop_slot_is_live_out(proto, exit_ip, n)) {
                return false;
            }
            continue;
        }
        if(ISREFCOUNTED(sq_type(entry_stack[n]))) {
            if(!emit_refcounted_stack_store_scalar(n)) {
                return false;
            }
        }
        else if(!sqjit_a64_emit_store_stack_scalar(&buf, n, n, slot_kind[n])) {
            return false;
        }
    }
    SQInteger writeback_done_offset = buf.size;
    if(!sqjit_a64_patch_branch(&buf, skip_writeback_patch,
        writeback_done_offset, true, SQ_JIT_A64_EQ)) {
        return false;
    }
    if(!sqjit_a64_emit_mov_imm_x(&buf, 9, exit_ip) ||
        !sqjit_a64_emit_str_x(&buf, 9, 20, 0) ||
        !emit_write_log_release(false) ||
        !sqjit_a64_emit_epilogue(&buf, frame_size, SQ_JIT_NATIVE_RETURNED)) {
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
    SQInteger guard_fail_offset = buf.size;
    if(!emit_write_log_release(true) ||
        !sqjit_a64_emit_epilogue(&buf, frame_size,
        SQ_JIT_NATIVE_GUARD_FAILED)) {
        return false;
    }
    for(SQInteger n = 0; n < nguard_relocs; n++) {
        if(!sqjit_a64_patch_branch(&buf, guard_relocs[n].patch_offset,
            guard_fail_offset, true, guard_relocs[n].cond)) {
            return false;
        }
    }

    return sqjit_a64_install_raw(&jit->_loop_entry, &jit->_loop_native_size, &buf);
}

#endif
