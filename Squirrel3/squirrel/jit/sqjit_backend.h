/*  see copyright notice in squirrel.h */
#ifndef _SQJIT_BACKEND_H_
#define _SQJIT_BACKEND_H_

#include "sqopcodes.h"
#include "sqjit_code.h"

struct SQClosure;
struct SQClass;
struct SQFunctionProto;
struct SQObjectPtr;
struct SQJitProto;
struct SQJitObjectPlan;

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

enum SQJitRejectCategory {
    SQ_JIT_REJECT_UNKNOWN = 0,
    SQ_JIT_REJECT_INVALID_BYTECODE,
    SQ_JIT_REJECT_OPCODE,
    SQ_JIT_REJECT_LOOP,
    SQ_JIT_REJECT_ARRAY,
    SQ_JIT_REJECT_ARRAY_APPEND,
    SQ_JIT_REJECT_MEMBER,
    SQ_JIT_REJECT_CALL,
    SQ_JIT_REJECT_CONSTRUCTOR,
    SQ_JIT_REJECT_GUARD,
    SQ_JIT_REJECT_WRITE,
    SQ_JIT_REJECT_RESOURCE,
    SQ_JIT_REJECT_OTHER,
    SQ_JIT_REJECT_COUNT
};

enum SQJitBackendKind {
    SQ_JIT_BACKEND_NONE = 0,
    SQ_JIT_BACKEND_CPP,
    SQ_JIT_BACKEND_X64,
    SQ_JIT_BACKEND_AARCH64
};

struct SQJitCompileResult {
    bool compiled;
    bool retryable;
    SQJitBackendKind backend;
    SQJitRejectCategory category;
    SQInteger ip;
    const char *reason; // static diagnostic text

    explicit operator bool() const { return compiled; }
    static SQJitCompileResult Success(SQJitBackendKind backend) {
        return {true, false, backend, SQ_JIT_REJECT_UNKNOWN, -1, NULL};
    }
};

// One attempt owns its failure details; there is no global failure side channel.
class SQJitCompileAttempt {
public:
    SQJitCompileAttempt(SQFunctionProto *proto, SQJitBackendKind backend);
    void SetIP(SQInteger ip) { result.ip = ip; }
    void MarkTransient() { result.retryable = true; }
    bool Reject(SQInteger ip, SQJitRejectCategory category, const char *reason);
    SQJitCompileResult Finish(bool compiled) const;
private:
    SQFunctionProto *proto;
    SQJitCompileResult result;
};

enum {
    SQ_JIT_NATIVE_MAX_SETTERS = 4
};

struct SQJitNative {
    SQJitNative();
    ~SQJitNative();
    SQJitObjectPlan *_object_plan;
    bool _scalarized;
    SQInteger _ninstructions;
    SQJitCode _code;
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

SQJitCompileResult sqjit_backend_compile_proto(SQFunctionProto *proto, SQObjectPtr *entry_stack,
    SQClosure *closure, SQJitNative *native);
bool sqjit_backend_loop_find_region(SQFunctionProto *proto, SQInteger header_ip,
    SQInteger *start_ip, SQInteger *end_ip, SQInteger *exit_ip);
SQJitCompileResult sqjit_backend_compile_loop(SQFunctionProto *proto, SQObjectPtr *entry_stack,
    SQClosure *closure, SQInteger start_ip, SQInteger header_ip,
    SQInteger end_ip, SQInteger exit_ip, SQJitProto *jit);
const SQChar *sqjit_diag_proto_name(SQFunctionProto *proto);
const char *sqjit_diag_reject_category_name(SQJitRejectCategory category);
bool sqjit_diag_trace_enabled(SQFunctionProto *proto);
void sqjit_diag_record_reject(SQFunctionProto *proto, const SQJitCompileResult &result);

#endif // _SQJIT_BACKEND_H_
