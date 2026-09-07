/* Per-shared-state policy and diagnostic storage. */
#ifndef _SQJIT_CONTEXT_H_
#define _SQJIT_CONTEXT_H_
#include "squirrel.h"
struct SQSharedState;
struct SQFunctionProto;
struct SQJitDiagnostics;
struct SQJitDiagProtoStats;
struct SQJitDiagLoopStats;
struct SQJitContext {
    SQJitContext();
    ~SQJitContext();
    SQJitDiagnostics &Diagnostics();
    SQJitDiagnostics *ExistingDiagnostics() { return diagnostics; }
    bool enabled;
    bool trace;
    bool trace_stats;
    bool collect_stats;
    SQInteger threshold;
    SQInteger proto_tick;
    SQInteger loop_tick;
private:
    SQJitContext(const SQJitContext &) = delete;
    SQJitContext &operator=(const SQJitContext &) = delete;
    SQJitDiagnostics *diagnostics;
};

SQJitContext &sqjit_context(SQSharedState *state);
void sqjit_context_release(SQSharedState *state);
SQJitDiagProtoStats *sqjit_diag_get_proto(SQFunctionProto *proto);
SQJitDiagLoopStats *sqjit_diag_get_loop(SQFunctionProto *proto, SQInteger header_ip);
void sqjit_diag_forget_proto(SQFunctionProto *proto);
void sqjit_diag_dump_stats(SQJitContext &ctx);
#endif
