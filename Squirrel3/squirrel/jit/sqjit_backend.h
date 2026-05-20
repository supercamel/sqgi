/*  see copyright notice in squirrel.h */
#ifndef _SQJIT_BACKEND_H_
#define _SQJIT_BACKEND_H_

#include "sqopcodes.h"

struct SQClosure;
struct SQFunctionProto;
struct SQObjectPtr;
struct SQJitProto;

enum SQJitNativeStatus {
    SQ_JIT_NATIVE_GUARD_FAILED = 0,
    SQ_JIT_NATIVE_RETURNED = 1
};

typedef SQInteger (*SQJitNativeObjectFn)(SQObjectPtr *, SQObjectPtr *, SQClosure *);
typedef SQInteger (*SQJitNativeLoopFn)(SQObjectPtr *, SQInteger *, SQClosure *);

struct SQJitNative {
    SQInteger _ninstructions;
    void *_native_entry;
    SQInteger _native_size;
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

#endif // _SQJIT_BACKEND_H_
