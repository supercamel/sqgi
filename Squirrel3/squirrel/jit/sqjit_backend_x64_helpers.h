/* Runtime operations used by the x86 compiler. */
#ifndef _SQJIT_BACKEND_X64_HELPERS_H_
#define _SQJIT_BACKEND_X64_HELPERS_H_
#include "sqpcheader.h"
#include "sqjit_backend.h"
SQInteger sqjit_helper_array_get_integer(SQObjectPtr *stack, SQInteger array_reg, SQInteger index, SQInteger *out);
SQInteger sqjit_helper_array_get_float(SQObjectPtr *stack, SQInteger array_reg, SQInteger index, SQFloat *out);
SQInteger sqjit_helper_array_get_array_ptr(SQObjectPtr *stack, SQInteger array_reg, SQInteger index, SQInteger *out);
SQInteger sqjit_helper_array_ptr_get_integer(SQInteger array_ptr, SQInteger index, SQInteger *out);
SQInteger sqjit_helper_array_ptr_get_array_ptr(SQInteger array_ptr, SQInteger index, SQInteger *out);
SQInteger sqjit_helper_table_get_integer(SQObjectPtr *stack, SQInteger table_reg, const SQObjectPtr *key, SQInteger *out);
SQInteger sqjit_helper_table_get_float(SQObjectPtr *stack, SQInteger table_reg, const SQObjectPtr *key, SQFloat *out);
void sqjit_helper_write_log_commit(SQInteger *slot);
void sqjit_helper_write_log_rollback(SQInteger *slot);
SQInteger sqjit_helper_array_set_integer_logged(SQInteger *log_slot, SQObjectPtr *stack,
    SQInteger array_reg, SQInteger index, SQInteger value);
SQInteger sqjit_helper_array_set_float_logged(SQInteger *log_slot, SQObjectPtr *stack,
    SQInteger array_reg, SQInteger index, const SQFloat *value);
SQInteger sqjit_helper_array_ptr_set_integer_logged(SQInteger *log_slot, SQInteger array_ptr,
    SQInteger index, SQInteger value);
SQInteger sqjit_helper_array_ptr_set_float_logged(SQInteger *log_slot, SQInteger array_ptr,
    SQInteger index, const SQFloat *value);
SQInteger sqjit_helper_table_set_integer_logged(SQInteger *log_slot, SQObjectPtr *stack,
    SQInteger table_reg, const SQObjectPtr *key, SQInteger value);
SQInteger sqjit_helper_table_set_float_logged(SQInteger *log_slot, SQObjectPtr *stack,
    SQInteger table_reg, const SQObjectPtr *key, const SQFloat *value);
SQInteger sqjit_helper_outer_get_integer(SQClosure *closure, SQInteger outer_index, SQInteger *out);
SQInteger sqjit_helper_outer_get_float(SQClosure *closure, SQInteger outer_index, SQFloat *out);
SQInteger sqjit_helper_new_array(SQObjectPtr *stack, SQClosure *closure, SQInteger target, SQInteger reserve);
SQInteger sqjit_helper_array_append_integer_local(SQObjectPtr *stack, SQInteger array_reg, SQInteger value);
SQInteger sqjit_helper_array_append_float_local(SQObjectPtr *stack, SQInteger array_reg, const SQFloat *value);
SQInteger sqjit_helper_return_stack_object(SQObjectPtr *stack, SQInteger reg, SQObjectPtr *out);
void sqjit_helper_store_stack_integer(SQObjectPtr *stack, SQInteger slot, const SQInteger *value);
void sqjit_helper_store_stack_float(SQObjectPtr *stack, SQInteger slot, const SQFloat *value);
SQObjectPtr *sqjit_outer_value_ptr(SQClosure *closure, SQInteger outer_index);
#endif
