/* Per-shared-state policy and diagnostic storage. */
#ifndef _SQJIT_CONTEXT_H_
#define _SQJIT_CONTEXT_H_
#include "squirrel.h"
struct SQSharedState;
struct SQVM;
struct SQFunctionProto;
struct SQJitDiagnostics;
struct SQJitDiagProtoStats;
struct SQJitDiagLoopStats;
class SQJitWriteLog;
struct SQJitContext {
    SQJitContext();
    ~SQJitContext();
    SQJitDiagnostics &Diagnostics();
    SQJitDiagnostics *ExistingDiagnostics() { return diagnostics; }
    bool enabled;
    bool precise_exits; // Experimental whole-function side-exit compiler.
    bool trace;
    bool trace_stats;
    bool collect_stats;
    SQInteger threshold;
    SQInteger proto_tick;
    SQInteger loop_tick;
    // Borrowed only during a native invocation; nested VM entries restore it.
    // Generated code keeps its three-argument ABI and may inherit this scope.
    SQVM *active_vm;
    // Active journals borrow this chain; pins are not program ownership.
    SQJitWriteLog *active_logs;
private:
    SQJitContext(const SQJitContext &) = delete;
    SQJitContext &operator=(const SQJitContext &) = delete;
    SQJitDiagnostics *diagnostics;
};

class SQJitExecutionScope {
public:
    SQJitExecutionScope(SQJitContext &context, SQVM *vm)
        : context(context), previous(context.active_vm) { context.active_vm = vm; }
    ~SQJitExecutionScope() { context.active_vm = previous; }
private:
    SQJitExecutionScope(const SQJitExecutionScope &) = delete;
    SQJitExecutionScope &operator=(const SQJitExecutionScope &) = delete;
    SQJitContext &context;
    SQVM *previous;
};

SQJitContext &sqjit_context(SQSharedState *state);
void sqjit_context_release(SQSharedState *state);
SQJitDiagProtoStats *sqjit_diag_get_proto(SQFunctionProto *proto);
SQJitDiagLoopStats *sqjit_diag_get_loop(SQFunctionProto *proto, SQInteger header_ip);
void sqjit_diag_forget_proto(SQFunctionProto *proto);
void sqjit_diag_dump_stats(SQJitContext &ctx);
#endif
