#include "sqpcheader.h"
#include "sqstate.h"
#include "sqjit_context.h"
#include "sqjit_diagnostics.h"
#include <stdlib.h>
#include <string.h>

static bool truthy(const char *value)
{
    return value && value[0] && value[0] != '0';
}

SQJitContext::SQJitContext()
    : enabled(truthy(getenv("SQGI_JIT"))), trace(false), trace_stats(false),
      collect_stats(false), threshold(1000), proto_tick(0), loop_tick(0),
      diagnostics(NULL)
{
    const char *value = getenv("SQGI_JIT_TRACE");
    trace_stats = value && strcmp(value, "stats") == 0;
    trace = truthy(value) && !trace_stats;
    collect_stats = trace_stats;
    value = getenv("SQGI_JIT_THRESHOLD");
    if(value && *value) {
        SQInteger parsed = (SQInteger)strtoll(value, NULL, 10);
        if(parsed >= 0) threshold = parsed;
    }
}

SQJitContext::~SQJitContext()
{
    sqjit_diag_dump_stats(*this);
    delete diagnostics;
}

SQJitDiagnostics &SQJitContext::Diagnostics()
{
    if(!diagnostics) diagnostics = new SQJitDiagnostics();
    return *diagnostics;
}

SQJitContext &sqjit_context(SQSharedState *state)
{
    if(!state->_jit_context) state->_jit_context = new SQJitContext();
    return *state->_jit_context;
}

void sqjit_context_release(SQSharedState *state)
{
    delete state->_jit_context;
    state->_jit_context = NULL;
}
