#include "sqpcheader.h"
#include "sqfuncproto.h"
#include "sqstring.h"
#include "sqjit_backend.h"

SQJitCompileAttempt::SQJitCompileAttempt(SQFunctionProto *p, SQJitBackendKind backend)
    : proto(p), result{false, false, backend, SQ_JIT_REJECT_OTHER, -1,
        "unsupported instruction or operand combination"}
{
}

bool SQJitCompileAttempt::Reject(SQInteger ip, SQJitRejectCategory category,
    const char *reason)
{
    result.ip = ip;
    result.category = category;
    result.reason = reason;
    if(proto && sqjit_diag_trace_enabled(proto)) {
        scprintf(_SC("[sqjit] reject proto '%s' ip %d: %s\n"),
            sq_type(proto->_name) == OT_STRING ? _stringval(proto->_name) : _SC("<anonymous>"),
            (SQInt32)ip, reason);
    }
    return false;
}

SQJitCompileResult SQJitCompileAttempt::Finish(bool compiled) const
{
    return compiled ? SQJitCompileResult::Success(result.backend) : result;
}
