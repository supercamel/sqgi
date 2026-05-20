/*  see copyright notice in squirrel.h */
#ifndef _SQJIT_H_
#define _SQJIT_H_

#include "sqopcodes.h"

struct SQVM;
struct SQFunctionProto;
struct SQObjectPtr;

enum SQJitEligibility {
    SQ_JIT_UNKNOWN = 0,
    SQ_JIT_NEVER = 1,
    SQ_JIT_BASELINE_CANDIDATE = 2
};

enum SQJitExecResult {
    SQ_JIT_EXEC_NOT_EXECUTED = 0,
    SQ_JIT_EXEC_FRAME_RETURNED = 1,
    SQ_JIT_EXEC_ROOT_RETURNED = 2,
    SQ_JIT_EXEC_ERROR = 3
};

struct SQJitProto {
    void *_entry;
    SQInteger _hot_count;
    SQInteger _fail_count;
    SQInteger _version;
    SQJitEligibility _eligibility;
};

bool sqjit_runtime_enabled();
SQInteger sqjit_hot_threshold();
void sqjit_on_function_enter(SQVM *v, SQFunctionProto *proto);
SQJitExecResult sqjit_try_execute_current(SQVM *v, SQObjectPtr &outres);
void sqjit_release_proto(SQFunctionProto *proto);

#endif // _SQJIT_H_
