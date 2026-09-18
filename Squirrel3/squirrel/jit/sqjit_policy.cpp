#include "sqpcheader.h"
#include "sqfuncproto.h"
#include "sqjit_context.h"
#include "sqjit_diagnostics.h"
#include "sqjit_policy.h"

static SQInteger sqjit_backoff_next_delay(SQInteger delay, SQInteger initial,
    SQInteger max_delay)
{
    if(delay <= 0) {
        return initial;
    }
    if(delay >= max_delay / 2) {
        return max_delay;
    }
    return delay * 2;
}

bool sqjit_loop_header_is_rejected(SQJitProto *jit, SQInteger header_ip)
{
    return jit && jit->RejectedLoop(header_ip);
}

void sqjit_loop_reject_header(SQJitProto *jit, SQInteger header_ip)
{
    if(!jit || header_ip < 0 || sqjit_loop_header_is_rejected(jit, header_ip)) {
        return;
    }

    const size_t byte = (size_t)(header_ip / 8);
    if(byte >= jit->_loop_rejected.size()) jit->_loop_rejected.resize(byte + 1, 0);
    jit->_loop_rejected[byte] |= (unsigned char)(1u << (header_ip % 8));
}

bool sqjit_proto_backoff_active(SQFunctionProto *proto, SQJitProto *jit)
{
    SQJitContext &ctx = sqjit_context(proto->_sharedstate);
    if(!jit || jit->_guard_backoff_until <= ctx.proto_tick) {
        return false;
    }
    if(ctx.collect_stats) {
        ctx.Diagnostics().total.proto_backoff_skips++;
        SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
        if(entry) {
            entry->backoff_skips++;
        }
    }
    return true;
}

void sqjit_proto_note_guard_fail(SQFunctionProto *proto, SQJitProto *jit,
    SQInteger weight)
{
    SQJitContext &ctx = sqjit_context(proto->_sharedstate);
    if(!jit) {
        return;
    }
    if(weight < 1) {
        weight = 1;
    }
    jit->_guard_fail_count += weight;
    if(jit->_guard_fail_count < SQ_JIT_GUARD_BACKOFF_THRESHOLD) {
        return;
    }

    jit->_guard_backoff_delay = sqjit_backoff_next_delay(
        jit->_guard_backoff_delay, SQ_JIT_GUARD_BACKOFF_INITIAL,
        SQ_JIT_GUARD_BACKOFF_MAX);
    jit->_guard_backoff_until = ctx.proto_tick + jit->_guard_backoff_delay;
    jit->_guard_fail_count = 0;

    if(ctx.collect_stats) {
        ctx.Diagnostics().total.proto_backoffs++;
        SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
        if(entry) {
            entry->backoffs++;
        }
    }
    if(ctx.trace) {
        scprintf(_SC("[sqjit] backing off native proto '%s' for %d attempts after guard churn\n"),
            sqjit_diag_proto_name(proto), (SQInt32)jit->_guard_backoff_delay);
    }
}

void sqjit_proto_note_success(SQJitProto *jit)
{
    if(!jit) {
        return;
    }
    jit->_guard_fail_count = 0;
    jit->_guard_backoff_until = 0;
    jit->_guard_backoff_delay = 0;
}

bool sqjit_loop_backoff_active(SQFunctionProto *proto, SQJitProto *jit,
    SQInteger header_ip)
{
    SQJitContext &ctx = sqjit_context(proto->_sharedstate);
    if(!jit || jit->_loop_guard_backoff_until <= ctx.loop_tick) {
        return false;
    }
    if(ctx.collect_stats) {
        ctx.Diagnostics().total.loop_backoff_skips++;
        SQJitDiagLoopStats *entry = sqjit_diag_get_loop(proto, header_ip);
        if(entry) {
            entry->backoff_skips++;
        }
    }
    return true;
}

void sqjit_loop_note_guard_fail(SQFunctionProto *proto, SQJitProto *jit,
    SQInteger header_ip)
{
    SQJitContext &ctx = sqjit_context(proto->_sharedstate);
    if(!jit) {
        return;
    }
    jit->_loop_guard_fail_count += 2;
    if(jit->_loop_guard_fail_count < SQ_JIT_LOOP_GUARD_BACKOFF_THRESHOLD) {
        return;
    }

    jit->_loop_guard_backoff_delay = sqjit_backoff_next_delay(
        jit->_loop_guard_backoff_delay, SQ_JIT_LOOP_GUARD_BACKOFF_INITIAL,
        SQ_JIT_LOOP_GUARD_BACKOFF_MAX);
    jit->_loop_guard_backoff_until = ctx.loop_tick +
        jit->_loop_guard_backoff_delay;
    jit->_loop_guard_fail_count = 0;

    if(ctx.collect_stats) {
        ctx.Diagnostics().total.loop_backoffs++;
        SQJitDiagLoopStats *entry = sqjit_diag_get_loop(proto, header_ip);
        if(entry) {
            entry->backoffs++;
        }
    }
    if(ctx.trace) {
        scprintf(_SC("[sqjit] backing off native loop in proto '%s' at ip %d for %d attempts after guard churn\n"),
            sqjit_diag_proto_name(proto), (SQInt32)header_ip,
            (SQInt32)jit->_loop_guard_backoff_delay);
    }
}

void sqjit_loop_note_success(SQJitProto *jit)
{
    if(!jit) {
        return;
    }
    if(jit->_loop_guard_fail_count > 0) {
        jit->_loop_guard_fail_count--;
    }
    jit->_loop_guard_backoff_until = 0;
    if(jit->_loop_guard_fail_count == 0) {
        jit->_loop_guard_backoff_delay = 0;
    }
}
