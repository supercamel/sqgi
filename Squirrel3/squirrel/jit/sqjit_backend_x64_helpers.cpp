/*  see copyright notice in squirrel.h */
#include "sqpcheader.h"
#include "sqfuncproto.h"
#include "sqstring.h"
#include "sqvm.h"
#include "sqarray.h"
#include "sqtable.h"
#include "sqclass.h"
#include "sqmemberslot.h"
#include "sqclosure.h"
#include "sqjit.h"
#include "sqjit_backend.h"
#include <limits.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>
#include "sqjit_platform.h"
#include "sqjit_backend_x64_helpers.h"
#include "sqjit_write_log.h"

bool sqjit_member_raw(const SQObjectPtr &owner, const SQObjectPtr &key, SQObjectPtr &out)
{
    SQObjectPtr *value = sq_member_raw_slot(owner, key);
    if(!value) return false;
    out = *value;
    return true;
}

static SQInteger get_member_pointer(SQObjectPtr *stack, SQInteger base, const SQObjectPtr *key,
    SQInteger *out, SQObjectType type)
{
    if(!stack || !key || !out || base < 0) return SQ_JIT_NATIVE_GUARD_FAILED;
    SQObjectPtr *value = sq_member_raw_slot(stack[base], *key);
    if(!value || sq_type(*value) != type) return SQ_JIT_NATIVE_GUARD_FAILED;
    *out = (SQInteger)(intptr_t)_refcounted(*value);
    return SQ_JIT_NATIVE_RETURNED;
}

SQInteger sqjit_helper_member_get_array(SQObjectPtr *s, SQInteger b, const SQObjectPtr *k, SQInteger *o)
{ return get_member_pointer(s, b, k, o, OT_ARRAY); }
SQInteger sqjit_helper_member_get_string(SQObjectPtr *s, SQInteger b, const SQObjectPtr *k, SQInteger *o)
{ return get_member_pointer(s, b, k, o, OT_STRING); }

static SQInteger set_member_pointer(SQInteger *slot, SQObjectPtr *stack, SQInteger base,
    SQString *string, const SQObjectPtr &value)
{
    if(!slot || !stack || base < 0 || !string) return SQ_JIT_NATIVE_GUARD_FAILED;
    SQObjectPtr key(string);
    SQObjectPtr *member = sq_member_raw_slot(stack[base], key);
    if(!member) return SQ_JIT_NATIVE_GUARD_FAILED;
    SQJitWriteLog *log = sqjit_write_log_ensure(slot);
    // The old owner is retained before normal SQObjectPtr assignment. Borrowed
    // pointers stay owned by the VM stack, heap or undo log until the loop exits.
    if(!log || !log->RecordMember(stack[base], key, *member)) return SQ_JIT_NATIVE_GUARD_FAILED;
    // Recording only retains owners and allocates log storage. It cannot
    // change the table layout or run callbacks, so the address is still valid.
    *member = value;
    return SQ_JIT_NATIVE_RETURNED;
}
SQInteger sqjit_helper_member_set_array(SQInteger *l, SQObjectPtr *s, SQInteger b, SQString *k, SQInteger v)
{ return v ? set_member_pointer(l,s,b,k,SQObjectPtr((SQArray *)(intptr_t)v)) : SQ_JIT_NATIVE_GUARD_FAILED; }
SQInteger sqjit_helper_member_set_string(SQInteger *l, SQObjectPtr *s, SQInteger b, SQString *k, SQInteger v)
{ return v ? set_member_pointer(l,s,b,k,SQObjectPtr((SQString *)(intptr_t)v)) : SQ_JIT_NATIVE_GUARD_FAILED; }

SQInteger sqjit_helper_table_get_integer(SQObjectPtr *stack, SQInteger table_reg, const SQObjectPtr *key, SQInteger *out)
{
    if(!stack || !out || !key || table_reg < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr *value = sq_member_raw_slot(stack[table_reg], *key);
    if(!value || sq_type(*value) != OT_INTEGER) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    *out = _integer(*value);
    return SQ_JIT_NATIVE_RETURNED;
}

SQInteger sqjit_helper_table_get_float(SQObjectPtr *stack, SQInteger table_reg, const SQObjectPtr *key, SQFloat *out)
{
    if(!stack || !out || !key || table_reg < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr *value = sq_member_raw_slot(stack[table_reg], *key);
    if(!value || sq_type(*value) != OT_FLOAT) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    *out = _float(*value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_write_log_record_array(SQInteger *slot, const SQObjectPtr &target,
    SQInteger index)
{
    SQJitWriteLog *log = sqjit_write_log_ensure(slot);
    return log && log->RecordArray(target, index) ? SQ_JIT_NATIVE_RETURNED : SQ_JIT_NATIVE_GUARD_FAILED;
}

static SQInteger sqjit_write_log_record_table(SQInteger *slot, const SQObjectPtr &target,
    const SQObjectPtr &key, const SQObjectPtr &old_value)
{
    SQJitWriteLog *log = sqjit_write_log_ensure(slot);
    return log && log->RecordMember(target, key, old_value) ? SQ_JIT_NATIVE_RETURNED : SQ_JIT_NATIVE_GUARD_FAILED;
}

void sqjit_helper_write_log_commit(SQInteger *slot) { sqjit_write_log_release(slot, false, false); }
void sqjit_helper_write_log_rollback(SQInteger *slot) { sqjit_write_log_release(slot, true, false); }

SQInteger sqjit_helper_array_set_integer_logged(SQInteger *log_slot, SQObjectPtr *stack,
    SQInteger array_reg, SQInteger index, SQInteger value)
{
    if(!log_slot || !stack || array_reg < 0 || sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    if(sqjit_write_log_record_array(log_slot, stack[array_reg], index) != SQ_JIT_NATIVE_RETURNED) {
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

    if(sqjit_write_log_record_array(log_slot, stack[array_reg], index) != SQ_JIT_NATIVE_RETURNED) {
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
    if(sqjit_write_log_record_array(log_slot, target, index) != SQ_JIT_NATIVE_RETURNED) {
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
    if(sqjit_write_log_record_array(log_slot, target, index) != SQ_JIT_NATIVE_RETURNED) {
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
    if(!log_slot || !stack || !key || table_reg < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr *member = sq_member_raw_slot(stack[table_reg], *key);
    if(!member) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_write_log_record_table(log_slot, stack[table_reg], *key, *member) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value);
    *member = new_value;
    return SQ_JIT_NATIVE_RETURNED;
}

SQInteger sqjit_helper_table_get_integer_string(SQObjectPtr *stack, SQInteger table_reg,
    SQString *string, SQInteger *out)
{
    if(!string || !stack || !out || table_reg < 0) return SQ_JIT_NATIVE_GUARD_FAILED;
    SQObjectPtr key(string);
    return sqjit_helper_table_get_integer(stack, table_reg, &key, out);
}

SQInteger sqjit_helper_table_set_integer_string_logged(SQInteger *log_slot, SQObjectPtr *stack,
    SQInteger table_reg, SQString *string, SQInteger value)
{
    if(!string || !stack || !log_slot || table_reg < 0) return SQ_JIT_NATIVE_GUARD_FAILED;
    SQObjectPtr key(string);
    return sqjit_helper_table_set_integer_logged(log_slot, stack, table_reg, &key, value);
}

SQInteger sqjit_helper_table_set_float_logged(SQInteger *log_slot, SQObjectPtr *stack,
    SQInteger table_reg, const SQObjectPtr *key, const SQFloat *value)
{
    if(!log_slot || !stack || !key || !value || table_reg < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr *member = sq_member_raw_slot(stack[table_reg], *key);
    if(!member) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_write_log_record_table(log_slot, stack[table_reg], *key, *member) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(*value);
    *member = new_value;
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

void sqjit_helper_store_stack_bool(SQObjectPtr *stack, SQInteger slot, const SQInteger *value)
{
    stack[slot] = SQObjectPtr(*value != 0);
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
