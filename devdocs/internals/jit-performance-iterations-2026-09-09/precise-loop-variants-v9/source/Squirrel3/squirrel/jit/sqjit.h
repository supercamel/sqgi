/*  see copyright notice in squirrel.h */
#ifndef _SQJIT_H_
#define _SQJIT_H_

#include "sqopcodes.h"
#include "sqjit_code.h"

struct SQJitNative;

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
    SQ_JIT_EXEC_ERROR = 3,
    SQ_JIT_EXEC_RESUMED = 4
};

enum {
    SQ_JIT_LOOP_REJECT_CACHE_SIZE = 8
};

struct SQJitProto {
    SQJitProto();
    ~SQJitProto();
    SQJitProto(const SQJitProto &) = delete;
    SQJitProto &operator=(const SQJitProto &) = delete;
    SQJitNative *_entry;
    SQJitCode _loop_code;
    // Once installed, both mappings live until the prototype dies. A nested
    // activation can keep executing either mapping while the other is compiled.
    SQJitCode _loop_alternate_code;
    bool _loop_alternate_attempted, _loop_has_succeeded, _loop_prefer_alternate;
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

bool sqjit_runtime_enabled(SQVM *v);
SQInteger sqjit_hot_threshold(SQVM *v);
void sqjit_on_function_enter(SQVM *v, SQFunctionProto *proto);
bool sqjit_try_execute_closure(SQVM *v, SQClosure *closure, SQObjectPtr *stack, SQInteger nargs, SQObjectPtr &outres);
// A frameless call may borrow only live VM slots. Raw native callers retain
// their existing caller-provided-storage contract and have no VM frame to pop.
bool sqjit_native_call_fits_stack(SQVM *v, SQObjectPtr *stack, SQInteger slots, SQInteger live_slots = -1);
bool sqjit_try_execute_current_loop(SQVM *v, SQInteger header_ip);
SQJitExecResult sqjit_try_execute_current(SQVM *v, SQObjectPtr &outres);
void sqjit_release_proto(SQFunctionProto *proto);

#endif // _SQJIT_H_
