/*  see copyright notice in squirrel.h */
#ifndef _SQJIT_H_
#define _SQJIT_H_

#include "sqopcodes.h"

struct SQVM;
struct SQFunctionProto;

enum SQJitEligibility {
    SQ_JIT_UNKNOWN = 0,
    SQ_JIT_NEVER = 1,
    SQ_JIT_BASELINE_CANDIDATE = 2
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
void sqjit_release_proto(SQFunctionProto *proto);

#endif // _SQJIT_H_
