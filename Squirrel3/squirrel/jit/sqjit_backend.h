/*  see copyright notice in squirrel.h */
#ifndef _SQJIT_BACKEND_H_
#define _SQJIT_BACKEND_H_

#include "sqopcodes.h"

struct SQClosure;
struct SQClass;
struct SQFunctionProto;
struct SQObjectPtr;
struct SQJitProto;

enum SQJitNativeStatus {
    SQ_JIT_NATIVE_GUARD_FAILED = 0,
    SQ_JIT_NATIVE_RETURNED = 1
};

typedef SQInteger (*SQJitNativeObjectFn)(SQObjectPtr *, SQObjectPtr *, SQClosure *);
typedef SQInteger (*SQJitNativeLoopFn)(SQObjectPtr *, SQInteger *, SQClosure *);

enum SQJitNativeKind {
    SQ_JIT_NATIVE_RAW_CODE = 0,
    SQ_JIT_NATIVE_FIELD_ACCESSOR,
    SQ_JIT_NATIVE_FIELD_ARRAY_CONST_ACCESSOR,
    SQ_JIT_NATIVE_FIELD_ARRAY_DYNAMIC_ACCESSOR,
    SQ_JIT_NATIVE_FIELD_ARRAY_LEN_ACCESSOR,
    SQ_JIT_NATIVE_SETTER,
    SQ_JIT_NATIVE_NUMERIC_ABS,
    SQ_JIT_NATIVE_NUMERIC_MIN,
    SQ_JIT_NATIVE_NUMERIC_MAX,
    SQ_JIT_NATIVE_NUMERIC_CLAMP
};

enum SQJitNativeReturnShape {
    SQ_JIT_NATIVE_RETURN_UNKNOWN = 0,
    SQ_JIT_NATIVE_RETURN_ARRAY_FIELD_INSTANCE = 1
};

enum {
    SQ_JIT_NATIVE_MAX_SETTERS = 4
};

struct SQJitNative {
    SQInteger _ninstructions;
    void *_native_entry;
    SQInteger _native_size;
    SQInteger _native_kind;
    SQInteger _base_slot;
    SQInteger _field_literal_index;
    SQInteger _array_index;
    SQInteger _index_slot;
    SQInteger _setter_count;
    SQInteger _setter_base_slots[SQ_JIT_NATIVE_MAX_SETTERS];
    SQInteger _setter_field_literal_indices[SQ_JIT_NATIVE_MAX_SETTERS];
    SQInteger _setter_array_indices[SQ_JIT_NATIVE_MAX_SETTERS];
    SQInteger _setter_index_slots[SQ_JIT_NATIVE_MAX_SETTERS];
    SQInteger _setter_value_slots[SQ_JIT_NATIVE_MAX_SETTERS];
    SQInteger _return_slot;
    SQInteger _return_shape;
    SQClass *_return_shape_class;
    SQInteger _return_shape_field_index;
    bool _native_trace_executed;
};

void sqjit_backend_native_free(void *entry, SQInteger size);
bool sqjit_backend_compile_proto(SQFunctionProto *proto, SQObjectPtr *entry_stack,
    SQClosure *closure, SQJitNative *native);
bool sqjit_backend_loop_find_region(SQFunctionProto *proto, SQInteger header_ip,
    SQInteger *start_ip, SQInteger *end_ip, SQInteger *exit_ip);
bool sqjit_backend_compile_loop(SQFunctionProto *proto, SQObjectPtr *entry_stack,
    SQClosure *closure, SQInteger start_ip, SQInteger header_ip,
    SQInteger end_ip, SQInteger exit_ip, SQJitProto *jit);
bool sqjit_diag_trace_enabled();
void sqjit_diag_record_reject(SQFunctionProto *proto, SQInteger ip, const char *reason);
void sqjit_diag_mark_transient_reject();
void sqjit_diag_clear_transient_reject();
bool sqjit_diag_consume_transient_reject();

#endif // _SQJIT_BACKEND_H_
