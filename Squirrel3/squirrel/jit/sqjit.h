/*  see copyright notice in squirrel.h */
#ifndef _SQJIT_H_
#define _SQJIT_H_

#include "sqopcodes.h"

struct SQVM;
struct SQFunctionProto;
struct SQObjectPtr;
struct SQClosure;

enum SQJitEligibility {
    SQ_JIT_UNKNOWN = 0,
    SQ_JIT_NEVER = 1,
    SQ_JIT_NATIVE_CANDIDATE = 2
};

enum SQJitExecResult {
    SQ_JIT_EXEC_NOT_EXECUTED = 0,
    SQ_JIT_EXEC_FRAME_RETURNED = 1,
    SQ_JIT_EXEC_ROOT_RETURNED = 2,
    SQ_JIT_EXEC_ERROR = 3
};

enum {
    SQ_JIT_LOOP_REJECT_CACHE_SIZE = 8
};

struct SQJitProto {
    void *_entry;
    void *_loop_entry;
    SQInteger _loop_native_size;
    SQInteger _loop_header_ip;
    SQInteger _loop_exit_ip;
    SQInteger _loop_hot_count;
    SQInteger _loop_fail_count;
    SQInteger _loop_guard_fail_count;
    SQInteger _loop_guard_backoff_until;
    SQInteger _loop_guard_backoff_delay;
    SQInteger _loop_reject_count;
    SQInteger _loop_reject_next;
    SQInteger _loop_reject_headers[SQ_JIT_LOOP_REJECT_CACHE_SIZE];
    bool _loop_trace_executed;
    SQInteger _hot_count;
    SQInteger _fail_count;
    SQInteger _guard_fail_count;
    SQInteger _guard_backoff_until;
    SQInteger _guard_backoff_delay;
    SQInteger _version;
    SQJitEligibility _eligibility;
};

bool sqjit_runtime_enabled();
SQInteger sqjit_hot_threshold();
void sqjit_on_function_enter(SQVM *v, SQFunctionProto *proto);
bool sqjit_try_execute_closure(SQVM *v, SQClosure *closure, SQObjectPtr *stack, SQInteger nargs, SQObjectPtr &outres);
bool sqjit_try_execute_current_loop(SQVM *v, SQInteger header_ip);
SQJitExecResult sqjit_try_execute_current(SQVM *v, SQObjectPtr &outres);
void sqjit_release_proto(SQFunctionProto *proto);

#endif // _SQJIT_H_
