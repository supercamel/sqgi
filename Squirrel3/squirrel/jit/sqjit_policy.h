/* Hotness, guard backoff and loop rejection policy. */
#ifndef _SQJIT_POLICY_H_
#define _SQJIT_POLICY_H_
#include "sqjit.h"
enum {
    SQ_JIT_GUARD_BACKOFF_THRESHOLD = 16,
    SQ_JIT_DIRECT_GUARD_BACKOFF_WEIGHT = 4,
    SQ_JIT_GUARD_BACKOFF_INITIAL = 256,
    SQ_JIT_GUARD_BACKOFF_MAX = 65536,
    SQ_JIT_LOOP_GUARD_BACKOFF_THRESHOLD = 16,
    SQ_JIT_LOOP_GUARD_BACKOFF_INITIAL = 128,
    SQ_JIT_LOOP_GUARD_BACKOFF_MAX = 32768,
    SQ_JIT_TRANSIENT_RETRY_LIMIT = 16
};
bool sqjit_loop_header_is_rejected(SQJitProto *jit, SQInteger header_ip);
void sqjit_loop_reject_header(SQJitProto *jit, SQInteger header_ip);
bool sqjit_proto_backoff_active(SQFunctionProto *proto, SQJitProto *jit);
void sqjit_proto_note_guard_fail(SQFunctionProto *proto, SQJitProto *jit,
    SQInteger weight = 1);
void sqjit_proto_note_success(SQJitProto *jit);
bool sqjit_loop_backoff_active(SQFunctionProto *proto, SQJitProto *jit,
    SQInteger header_ip);
void sqjit_loop_note_guard_fail(SQFunctionProto *proto, SQJitProto *jit,
    SQInteger header_ip);
void sqjit_loop_note_success(SQJitProto *jit);
#endif
