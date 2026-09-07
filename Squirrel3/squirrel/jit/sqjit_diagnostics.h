/* Bounded diagnostics collected only when explicitly enabled. */
#ifndef _SQJIT_DIAGNOSTICS_H_
#define _SQJIT_DIAGNOSTICS_H_
#include "sqjit_backend.h"

enum {
    SQ_JIT_DIAG_MAX_REASONS = 96,
    SQ_JIT_DIAG_MAX_PROTOS = 256,
    SQ_JIT_DIAG_MAX_LOOPS = 256,
    SQ_JIT_DIAG_MAX_REJECT_SITES = 256,
    SQ_JIT_DIAG_NAME_SIZE = 96,
    SQ_JIT_DIAG_SOURCE_SIZE = 160
};

struct SQJitDiagReason {
    const char *reason;
    SQInteger count;
};

struct SQJitDiagStats {
    SQInteger proto_enters;
    SQInteger proto_hot;
    SQInteger proto_compile_attempts;
    SQInteger proto_compile_successes;
    SQInteger proto_compile_failures;
    SQInteger proto_exec_attempts;
    SQInteger proto_exec_successes;
    SQInteger proto_exec_guard_failures;
    SQInteger direct_call_attempts;
    SQInteger direct_call_successes;
    SQInteger direct_call_misses;
    SQInteger direct_call_guard_failures;
    SQInteger loop_try_attempts;
    SQInteger loop_find_failures;
    SQInteger loop_compile_attempts;
    SQInteger loop_compile_successes;
    SQInteger loop_compile_failures;
    SQInteger loop_exec_attempts;
    SQInteger loop_exec_successes;
    SQInteger loop_exec_guard_failures;
    SQInteger proto_backoffs;
    SQInteger proto_backoff_skips;
    SQInteger loop_backoffs;
    SQInteger loop_backoff_skips;
    SQInteger rejects;
    SQInteger reject_categories[SQ_JIT_REJECT_COUNT];
    SQInteger nreasons;
    SQJitDiagReason reasons[SQ_JIT_DIAG_MAX_REASONS];
};

struct SQJitDiagProtoStats {
    SQJitCompileResult compile_result;
    SQFunctionProto *proto;
    SQChar name[SQ_JIT_DIAG_NAME_SIZE];
    SQChar source[SQ_JIT_DIAG_SOURCE_SIZE];
    SQInteger enters;
    SQInteger hot;
    SQInteger compile_attempts;
    SQInteger compile_successes;
    SQInteger compile_failures;
    SQInteger exec_attempts;
    SQInteger exec_successes;
    SQInteger exec_guard_failures;
    SQInteger direct_attempts;
    SQInteger direct_successes;
    SQInteger direct_misses;
    SQInteger direct_guard_failures;
    SQInteger backoffs;
    SQInteger backoff_skips;
    SQInteger rejects;
    SQInteger last_reject_ip;
    const char *last_reject_reason;
};

struct SQJitDiagLoopStats {
    SQJitCompileResult compile_result;
    SQFunctionProto *proto;
    SQInteger header_ip;
    SQChar name[SQ_JIT_DIAG_NAME_SIZE];
    SQChar source[SQ_JIT_DIAG_SOURCE_SIZE];
    SQInteger line;
    SQInteger try_attempts;
    SQInteger find_failures;
    SQInteger compile_attempts;
    SQInteger compile_successes;
    SQInteger compile_failures;
    SQInteger exec_attempts;
    SQInteger exec_successes;
    SQInteger exec_guard_failures;
    SQInteger backoffs;
    SQInteger backoff_skips;
};

struct SQJitDiagRejectSite {
    SQFunctionProto *proto;
    SQInteger ip;
    SQChar name[SQ_JIT_DIAG_NAME_SIZE];
    SQChar source[SQ_JIT_DIAG_SOURCE_SIZE];
    SQInteger line;
    const char *reason;
    SQInteger count;
};


struct SQJitDiagnostics {
    SQJitDiagStats total;
    SQJitDiagProtoStats protos[SQ_JIT_DIAG_MAX_PROTOS];
    SQInteger proto_count;
    SQJitDiagLoopStats loops[SQ_JIT_DIAG_MAX_LOOPS];
    SQInteger loop_count;
    SQJitDiagRejectSite sites[SQ_JIT_DIAG_MAX_REJECT_SITES];
    SQInteger site_count;
};

#endif
