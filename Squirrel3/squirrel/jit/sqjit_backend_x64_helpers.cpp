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
#include "sqjit_backend_x64_helpers.h"

enum SQJitWriteKind {
    SQ_JIT_WRITE_ARRAY_INDEX,
    SQ_JIT_WRITE_TABLE_KEY
};

struct SQJitWriteLogEntry {
    SQJitWriteKind kind;
    SQObjectPtr target;
    SQObjectPtr key;
    SQObjectPtr old_value;
    SQInteger index;
};

struct SQJitWriteLog {
    sqvector<SQJitWriteLogEntry> entries;
};

SQInteger sqjit_helper_array_get_integer(SQObjectPtr *stack, SQInteger array_reg, SQInteger index, SQInteger *out)
{
    if(!stack || !out || array_reg < 0 || sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!_array(stack[array_reg])->Get(index, value) || sq_type(value) != OT_INTEGER) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    *out = _integer(value);
    return SQ_JIT_NATIVE_RETURNED;
}

SQInteger sqjit_helper_array_get_float(SQObjectPtr *stack, SQInteger array_reg, SQInteger index, SQFloat *out)
{
    if(!stack || !out || array_reg < 0 || sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!_array(stack[array_reg])->Get(index, value) || sq_type(value) != OT_FLOAT) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    *out = _float(value);
    return SQ_JIT_NATIVE_RETURNED;
}

SQInteger sqjit_helper_array_get_array_ptr(SQObjectPtr *stack, SQInteger array_reg, SQInteger index, SQInteger *out)
{
    if(!stack || !out || array_reg < 0 || sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!_array(stack[array_reg])->Get(index, value) || sq_type(value) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    *out = (SQInteger)(intptr_t)_array(value);
    return SQ_JIT_NATIVE_RETURNED;
}

SQInteger sqjit_helper_array_ptr_get_integer(SQInteger array_ptr, SQInteger index, SQInteger *out)
{
    if(!array_ptr || !out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    SQArray *array = (SQArray *)(intptr_t)array_ptr;
    if(!array->Get(index, value) || sq_type(value) != OT_INTEGER) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    *out = _integer(value);
    return SQ_JIT_NATIVE_RETURNED;
}

SQInteger sqjit_helper_array_ptr_get_array_ptr(SQInteger array_ptr, SQInteger index, SQInteger *out)
{
    if(!array_ptr || !out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    SQArray *array = (SQArray *)(intptr_t)array_ptr;
    if(!array->Get(index, value) || sq_type(value) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    *out = (SQInteger)(intptr_t)_array(value);
    return SQ_JIT_NATIVE_RETURNED;
}

SQInteger sqjit_helper_table_get_integer(SQObjectPtr *stack, SQInteger table_reg, const SQObjectPtr *key, SQInteger *out)
{
    if(!stack || !out || !key || table_reg < 0 || sq_type(stack[table_reg]) != OT_TABLE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!_table(stack[table_reg])->Get(*key, value) || sq_type(value) != OT_INTEGER) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    *out = _integer(value);
    return SQ_JIT_NATIVE_RETURNED;
}

SQInteger sqjit_helper_table_get_float(SQObjectPtr *stack, SQInteger table_reg, const SQObjectPtr *key, SQFloat *out)
{
    if(!stack || !out || !key || table_reg < 0 || sq_type(stack[table_reg]) != OT_TABLE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!_table(stack[table_reg])->Get(*key, value) || sq_type(value) != OT_FLOAT) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    *out = _float(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQJitWriteLog *sqjit_write_log_from_slot(SQInteger *slot)
{
    return slot ? (SQJitWriteLog *)(intptr_t)(*slot) : NULL;
}

static SQJitWriteLog *sqjit_write_log_ensure(SQInteger *slot)
{
    SQJitWriteLog *log = sqjit_write_log_from_slot(slot);
    if(log) {
        return log;
    }

    void *mem = sq_vm_malloc(sizeof(SQJitWriteLog));
    if(!mem) {
        return NULL;
    }
    log = new (mem) SQJitWriteLog;
    *slot = (SQInteger)(intptr_t)log;
    return log;
}

static void sqjit_write_log_free(SQInteger *slot)
{
    SQJitWriteLog *log = sqjit_write_log_from_slot(slot);
    if(!log) {
        return;
    }

    log->~SQJitWriteLog();
    sq_vm_free(log, sizeof(SQJitWriteLog));
    *slot = 0;
}

static SQInteger sqjit_write_log_record_array(SQInteger *slot, const SQObjectPtr &target,
    SQInteger index, const SQObjectPtr &old_value)
{
    SQJitWriteLog *log = sqjit_write_log_ensure(slot);
    if(!log) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQJitWriteLogEntry entry;
    entry.kind = SQ_JIT_WRITE_ARRAY_INDEX;
    entry.target = target;
    entry.key.Null();
    entry.old_value = old_value;
    entry.index = index;
    log->entries.push_back(entry);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_write_log_record_table(SQInteger *slot, const SQObjectPtr &target,
    const SQObjectPtr &key, const SQObjectPtr &old_value)
{
    SQJitWriteLog *log = sqjit_write_log_ensure(slot);
    if(!log) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQJitWriteLogEntry entry;
    entry.kind = SQ_JIT_WRITE_TABLE_KEY;
    entry.target = target;
    entry.key = key;
    entry.old_value = old_value;
    entry.index = 0;
    log->entries.push_back(entry);
    return SQ_JIT_NATIVE_RETURNED;
}

void sqjit_helper_write_log_commit(SQInteger *slot)
{
    sqjit_write_log_free(slot);
}

void sqjit_helper_write_log_rollback(SQInteger *slot)
{
    SQJitWriteLog *log = sqjit_write_log_from_slot(slot);
    if(!log) {
        return;
    }

    SQUnsignedInteger count = log->entries.size();
    while(count > 0) {
        SQJitWriteLogEntry &entry = log->entries[--count];
        if(entry.kind == SQ_JIT_WRITE_ARRAY_INDEX && sq_type(entry.target) == OT_ARRAY) {
            _array(entry.target)->Set(entry.index, entry.old_value);
        }
        else if(entry.kind == SQ_JIT_WRITE_TABLE_KEY && sq_type(entry.target) == OT_TABLE) {
            _table(entry.target)->Set(entry.key, entry.old_value);
        }
    }

    sqjit_write_log_free(slot);
}

SQInteger sqjit_helper_array_set_integer_logged(SQInteger *log_slot, SQObjectPtr *stack,
    SQInteger array_reg, SQInteger index, SQInteger value)
{
    if(!log_slot || !stack || array_reg < 0 || sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr old_value;
    if(!_array(stack[array_reg])->Get(index, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_write_log_record_array(log_slot, stack[array_reg], index, old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value);
    if(!_array(stack[array_reg])->Set(index, new_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

SQInteger sqjit_helper_array_set_float_logged(SQInteger *log_slot, SQObjectPtr *stack,
    SQInteger array_reg, SQInteger index, const SQFloat *value)
{
    if(!log_slot || !stack || !value || array_reg < 0 || sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr old_value;
    if(!_array(stack[array_reg])->Get(index, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_write_log_record_array(log_slot, stack[array_reg], index, old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(*value);
    if(!_array(stack[array_reg])->Set(index, new_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

SQInteger sqjit_helper_array_ptr_set_integer_logged(SQInteger *log_slot, SQInteger array_ptr,
    SQInteger index, SQInteger value)
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
    if(sqjit_write_log_record_array(log_slot, target, index, old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value);
    if(!array->Set(index, new_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

SQInteger sqjit_helper_array_ptr_set_float_logged(SQInteger *log_slot, SQInteger array_ptr,
    SQInteger index, const SQFloat *value)
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
    if(sqjit_write_log_record_array(log_slot, target, index, old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(*value);
    if(!array->Set(index, new_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

SQInteger sqjit_helper_table_set_integer_logged(SQInteger *log_slot, SQObjectPtr *stack,
    SQInteger table_reg, const SQObjectPtr *key, SQInteger value)
{
    if(!log_slot || !stack || !key || table_reg < 0 || sq_type(stack[table_reg]) != OT_TABLE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr old_value;
    if(!_table(stack[table_reg])->Get(*key, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_write_log_record_table(log_slot, stack[table_reg], *key, old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value);
    if(!_table(stack[table_reg])->Set(*key, new_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

SQInteger sqjit_helper_table_set_float_logged(SQInteger *log_slot, SQObjectPtr *stack,
    SQInteger table_reg, const SQObjectPtr *key, const SQFloat *value)
{
    if(!log_slot || !stack || !key || !value || table_reg < 0 || sq_type(stack[table_reg]) != OT_TABLE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr old_value;
    if(!_table(stack[table_reg])->Get(*key, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_write_log_record_table(log_slot, stack[table_reg], *key, old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(*value);
    if(!_table(stack[table_reg])->Set(*key, new_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

SQInteger sqjit_helper_outer_get_integer(SQClosure *closure, SQInteger outer_index, SQInteger *out)
{
    if(!out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr *value = sqjit_outer_value_ptr(closure, outer_index);
    if(!value || sq_type(*value) != OT_INTEGER) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    *out = _integer(*value);
    return SQ_JIT_NATIVE_RETURNED;
}

SQInteger sqjit_helper_outer_get_float(SQClosure *closure, SQInteger outer_index, SQFloat *out)
{
    if(!out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr *value = sqjit_outer_value_ptr(closure, outer_index);
    if(!value || sq_type(*value) != OT_FLOAT) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    *out = _float(*value);
    return SQ_JIT_NATIVE_RETURNED;
}

SQInteger sqjit_helper_new_array(SQObjectPtr *stack, SQClosure *closure, SQInteger target, SQInteger reserve)
{
    if(!stack || !closure || target < 0 || reserve < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQArray *array = SQArray::Create(_opt_ss(closure), 0);
    if(!array) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    array->Reserve(reserve);
    stack[target] = array;
    return SQ_JIT_NATIVE_RETURNED;
}

SQInteger sqjit_helper_array_append_integer_local(SQObjectPtr *stack, SQInteger array_reg, SQInteger value)
{
    if(!stack || array_reg < 0 || sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr obj(value);
    _array(stack[array_reg])->Append(obj);
    return SQ_JIT_NATIVE_RETURNED;
}

SQInteger sqjit_helper_array_append_float_local(SQObjectPtr *stack, SQInteger array_reg, const SQFloat *value)
{
    if(!stack || !value || array_reg < 0 || sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr obj(*value);
    _array(stack[array_reg])->Append(obj);
    return SQ_JIT_NATIVE_RETURNED;
}

SQInteger sqjit_helper_return_stack_object(SQObjectPtr *stack, SQInteger reg, SQObjectPtr *out)
{
    if(!stack || !out || reg < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    *out = stack[reg];
    return SQ_JIT_NATIVE_RETURNED;
}

void sqjit_helper_store_stack_integer(SQObjectPtr *stack, SQInteger slot, const SQInteger *value)
{
    stack[slot] = *value;
}

void sqjit_helper_store_stack_float(SQObjectPtr *stack, SQInteger slot, const SQFloat *value)
{
    stack[slot] = *value;
}


SQObjectPtr *sqjit_outer_value_ptr(SQClosure *closure, SQInteger outer_index)
{
    if(!closure || !closure->_function || outer_index < 0 ||
        outer_index >= closure->_function->_noutervalues ||
        sq_type(closure->_outervalues[outer_index]) != OT_OUTER) {
        return NULL;
    }

    SQOuter *outer = _outer(closure->_outervalues[outer_index]);
    return outer ? outer->_valptr : NULL;
}
