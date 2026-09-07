/* Internal observation API: snapshots never trigger compilation or execution. */
#ifndef _SQJIT_OBSERVE_H_
#define _SQJIT_OBSERVE_H_
#include "sqjit_backend.h"

struct SQVM;
struct SQJitRouteStats {
    SQInteger attempts;
    SQInteger successes;
    SQInteger guard_failures;
};

struct SQJitObservation {
    SQJitCompileResult compilation;
    SQInteger compile_attempts;
    SQJitRouteStats frame;
    SQJitRouteStats direct;
    SQJitCompileResult loop_compilation;
    SQInteger loop_compile_attempts;
    SQJitRouteStats loop;
};

void sqjit_observe_enable(SQVM *v);
bool sqjit_observe_proto(SQFunctionProto *proto, SQJitObservation &out);
#endif
