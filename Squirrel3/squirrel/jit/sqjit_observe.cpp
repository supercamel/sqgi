#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqjit_context.h"
#include "sqjit_diagnostics.h"
#include "sqjit_observe.h"

void sqjit_observe_enable(SQVM *v)
{
    sqjit_context(v->_sharedstate).collect_stats = true;
}

bool sqjit_observe_proto(SQFunctionProto *proto, SQJitObservation &out)
{
    out = {};
    if(!proto) return false;
    SQJitContext *ctx = proto->_sharedstate->_jit_context;
    SQJitDiagnostics *diag = ctx ? ctx->ExistingDiagnostics() : NULL;
    if(!diag) return false;
    bool found = false;
    for(SQInteger n = 0; n < diag->proto_count; ++n) {
        const SQJitDiagProtoStats &p = diag->protos[n];
        if(p.proto != proto) continue;
        found = true;
        out.compilation = p.compile_result;
        out.compile_attempts = p.compile_attempts;
        out.frame = {p.exec_attempts, p.exec_successes, p.exec_guard_failures, p.exec_side_exits};
        out.direct = {p.direct_attempts, p.direct_successes, p.direct_guard_failures};
        break;
    }
    for(SQInteger n = 0; n < diag->loop_count; ++n) {
        const SQJitDiagLoopStats &p = diag->loops[n];
        if(p.proto != proto) continue;
        found = true;
        if(p.compile_attempts) out.loop_compilation = p.compile_result;
        out.loop_compile_attempts += p.compile_attempts;
        out.loop.attempts += p.exec_attempts;
        out.loop.successes += p.exec_successes;
        out.loop.guard_failures += p.exec_guard_failures;
    }
    return found;
}
