/*  see copyright notice in squirrel.h */
#include "sqpcheader.h"
#include "sqfuncproto.h"
#include "sqstring.h"
#include "sqjit_context.h"
#include "sqjit_diagnostics.h"
#include <string.h>

static const char *sqjit_diag_reject_category_names[SQ_JIT_REJECT_COUNT] = {
    "unknown",
    "invalid-bytecode",
    "opcode",
    "loop",
    "array",
    "array-append",
    "member",
    "call",
    "constructor",
    "guard",
    "write",
    "resource",
    "other"
};

const char *sqjit_diag_reject_category_name(SQJitRejectCategory category)
{
    if(category < 0 || category >= SQ_JIT_REJECT_COUNT) {
        return sqjit_diag_reject_category_names[SQ_JIT_REJECT_UNKNOWN];
    }
    return sqjit_diag_reject_category_names[category];
}

const SQChar *sqjit_diag_proto_name(SQFunctionProto *proto)
{
    return proto && sq_type(proto->_name) == OT_STRING ?
        _stringval(proto->_name) : _SC("<anonymous>");
}

static const SQChar *sqjit_diag_proto_source(SQFunctionProto *proto)
{
    return proto && sq_type(proto->_sourcename) == OT_STRING ?
        _stringval(proto->_sourcename) : _SC("<unknown>");
}

static void sqjit_diag_copy_string(SQChar *dst, SQInteger dst_size,
    const SQChar *src)
{
    if(!dst) {
        return;
    }
    if(!src) {
        src = _SC("");
    }

    SQInteger n = 0;
    while(src[n] && n < dst_size - 1) {
        dst[n] = src[n];
        n++;
    }
    dst[n] = _SC('\0');
}

static void sqjit_diag_copy_name(SQChar *dst, SQFunctionProto *proto)
{
    sqjit_diag_copy_string(dst, SQ_JIT_DIAG_NAME_SIZE,
        sqjit_diag_proto_name(proto));
}

static void sqjit_diag_copy_source(SQChar *dst, SQFunctionProto *proto)
{
    sqjit_diag_copy_string(dst, SQ_JIT_DIAG_SOURCE_SIZE,
        sqjit_diag_proto_source(proto));
}

static SQInteger sqjit_diag_proto_line(SQFunctionProto *proto, SQInteger ip)
{
    if(!proto || ip < 0 || ip >= proto->_ninstructions) {
        return -1;
    }
    return proto->GetLine(&proto->_instructions[ip]);
}

SQJitDiagProtoStats *sqjit_diag_get_proto(SQFunctionProto *proto)
{
    if(!proto) {
        return NULL;
    }
    SQJitContext &ctx = sqjit_context(proto->_sharedstate);
    for(SQInteger n = 0; n < ctx.Diagnostics().proto_count; n++) {
        if(ctx.Diagnostics().protos[n].proto == proto) {
            return &ctx.Diagnostics().protos[n];
        }
    }
    if(ctx.Diagnostics().proto_count >= SQ_JIT_DIAG_MAX_PROTOS) {
        return NULL;
    }

    SQJitDiagProtoStats *entry = &ctx.Diagnostics().protos[ctx.Diagnostics().proto_count++];
    memset(entry, 0, sizeof(*entry));
    entry->proto = proto;
    entry->last_reject_ip = -1;
    sqjit_diag_copy_name(entry->name, proto);
    sqjit_diag_copy_source(entry->source, proto);
    return entry;
}

SQJitDiagLoopStats *sqjit_diag_get_loop(SQFunctionProto *proto,
    SQInteger header_ip)
{
    if(!proto || header_ip < 0) {
        return NULL;
    }
    SQJitContext &ctx = sqjit_context(proto->_sharedstate);
    for(SQInteger n = 0; n < ctx.Diagnostics().loop_count; n++) {
        if(ctx.Diagnostics().loops[n].proto == proto &&
            ctx.Diagnostics().loops[n].header_ip == header_ip) {
            return &ctx.Diagnostics().loops[n];
        }
    }
    if(ctx.Diagnostics().loop_count >= SQ_JIT_DIAG_MAX_LOOPS) {
        return NULL;
    }

    SQJitDiagLoopStats *entry = &ctx.Diagnostics().loops[ctx.Diagnostics().loop_count++];
    memset(entry, 0, sizeof(*entry));
    entry->proto = proto;
    entry->header_ip = header_ip;
    entry->line = sqjit_diag_proto_line(proto, header_ip);
    sqjit_diag_copy_name(entry->name, proto);
    sqjit_diag_copy_source(entry->source, proto);
    return entry;
}

static SQJitDiagRejectSite *sqjit_diag_get_reject_site(SQFunctionProto *proto,
    SQInteger ip, const char *reason)
{
    if(!proto || !reason) {
        return NULL;
    }
    SQJitContext &ctx = sqjit_context(proto->_sharedstate);
    for(SQInteger n = 0; n < ctx.Diagnostics().site_count; n++) {
        SQJitDiagRejectSite *entry = &ctx.Diagnostics().sites[n];
        if(entry->proto == proto && entry->ip == ip &&
            strcmp(entry->reason, reason) == 0) {
            return entry;
        }
    }
    if(ctx.Diagnostics().site_count >= SQ_JIT_DIAG_MAX_REJECT_SITES) {
        return NULL;
    }

    SQJitDiagRejectSite *entry =
        &ctx.Diagnostics().sites[ctx.Diagnostics().site_count++];
    memset(entry, 0, sizeof(*entry));
    entry->proto = proto;
    entry->ip = ip;
    entry->line = sqjit_diag_proto_line(proto, ip);
    entry->reason = reason;
    sqjit_diag_copy_name(entry->name, proto);
    sqjit_diag_copy_source(entry->source, proto);
    return entry;
}

void sqjit_diag_dump_stats(SQJitContext &ctx)
{
    if(!ctx.trace_stats) {
        return;
    }

    scprintf(_SC("[sqjit:stats] proto enters=%d hot=%d compile=%d success=%d fail=%d\n"),
        (SQInt32)ctx.Diagnostics().total.proto_enters,
        (SQInt32)ctx.Diagnostics().total.proto_hot,
        (SQInt32)ctx.Diagnostics().total.proto_compile_attempts,
        (SQInt32)ctx.Diagnostics().total.proto_compile_successes,
        (SQInt32)ctx.Diagnostics().total.proto_compile_failures);
    scprintf(_SC("[sqjit:stats] proto exec attempts=%d success=%d guard_fail=%d\n"),
        (SQInt32)ctx.Diagnostics().total.proto_exec_attempts,
        (SQInt32)ctx.Diagnostics().total.proto_exec_successes,
        (SQInt32)ctx.Diagnostics().total.proto_exec_guard_failures);
    scprintf(_SC("[sqjit:stats] proto side_exits=%d\n"),
        (SQInt32)ctx.Diagnostics().total.proto_exec_side_exits);
    scprintf(_SC("[sqjit:stats] direct calls attempts=%d success=%d miss=%d guard_fail=%d\n"),
        (SQInt32)ctx.Diagnostics().total.direct_call_attempts,
        (SQInt32)ctx.Diagnostics().total.direct_call_successes,
        (SQInt32)ctx.Diagnostics().total.direct_call_misses,
        (SQInt32)ctx.Diagnostics().total.direct_call_guard_failures);
    scprintf(_SC("[sqjit:stats] loops try=%d find_fail=%d compile=%d success=%d fail=%d exec=%d exec_success=%d guard_fail=%d\n"),
        (SQInt32)ctx.Diagnostics().total.loop_try_attempts,
        (SQInt32)ctx.Diagnostics().total.loop_find_failures,
        (SQInt32)ctx.Diagnostics().total.loop_compile_attempts,
        (SQInt32)ctx.Diagnostics().total.loop_compile_successes,
        (SQInt32)ctx.Diagnostics().total.loop_compile_failures,
        (SQInt32)ctx.Diagnostics().total.loop_exec_attempts,
        (SQInt32)ctx.Diagnostics().total.loop_exec_successes,
        (SQInt32)ctx.Diagnostics().total.loop_exec_guard_failures);
    scprintf(_SC("[sqjit:stats] rejects=%d unique_reasons=%d\n"),
        (SQInt32)ctx.Diagnostics().total.rejects,
        (SQInt32)ctx.Diagnostics().total.nreasons);
    scprintf(_SC("[sqjit:stats] backoff proto=%d proto_skips=%d loop=%d loop_skips=%d\n"),
        (SQInt32)ctx.Diagnostics().total.proto_backoffs,
        (SQInt32)ctx.Diagnostics().total.proto_backoff_skips,
        (SQInt32)ctx.Diagnostics().total.loop_backoffs,
        (SQInt32)ctx.Diagnostics().total.loop_backoff_skips);
    for(SQInteger n = 0; n < SQ_JIT_REJECT_COUNT; n++) {
        if(ctx.Diagnostics().total.reject_categories[n] <= 0) {
            continue;
        }
        scprintf(_SC("[sqjit:stats] reject category count=%d category=%s\n"),
            (SQInt32)ctx.Diagnostics().total.reject_categories[n],
            sqjit_diag_reject_category_name((SQJitRejectCategory)n));
    }
    for(SQInteger n = 0; n < ctx.Diagnostics().total.nreasons; n++) {
        scprintf(_SC("[sqjit:stats] reject reason count=%d reason=%s\n"),
            (SQInt32)ctx.Diagnostics().total.reasons[n].count,
            ctx.Diagnostics().total.reasons[n].reason);
    }

    bool printed_protos[SQ_JIT_DIAG_MAX_PROTOS];
    memset(printed_protos, 0, sizeof(printed_protos));
    for(SQInteger rank = 0; rank < 12; rank++) {
        SQInteger best = -1;
        SQInteger best_score = 0;
        for(SQInteger n = 0; n < ctx.Diagnostics().proto_count; n++) {
            SQInteger score = ctx.Diagnostics().protos[n].exec_guard_failures +
                ctx.Diagnostics().protos[n].direct_guard_failures;
            if(!printed_protos[n] && score > best_score) {
                best = n;
                best_score = score;
            }
        }
        if(best < 0 || best_score <= 0) {
            break;
        }
        printed_protos[best] = true;
        SQJitDiagProtoStats *entry = &ctx.Diagnostics().protos[best];
        scprintf(_SC("[sqjit:stats] proto_guard rank=%d proto=%p name=%s source=%s guard_fail=%d exec=%d exec_ok=%d direct=%d direct_ok=%d backoffs=%d skips=%d rejects=%d last_reject_ip=%d reason=%s\n"),
            (SQInt32)(rank + 1), (void *)entry->proto, entry->name,
            entry->source, (SQInt32)best_score,
            (SQInt32)entry->exec_attempts, (SQInt32)entry->exec_successes,
            (SQInt32)entry->direct_attempts, (SQInt32)entry->direct_successes,
            (SQInt32)entry->backoffs, (SQInt32)entry->backoff_skips,
            (SQInt32)entry->rejects, (SQInt32)entry->last_reject_ip,
            entry->last_reject_reason ? entry->last_reject_reason : "none");
    }

    bool printed_loops[SQ_JIT_DIAG_MAX_LOOPS];
    memset(printed_loops, 0, sizeof(printed_loops));
    for(SQInteger rank = 0; rank < 12; rank++) {
        SQInteger best = -1;
        SQInteger best_score = 0;
        for(SQInteger n = 0; n < ctx.Diagnostics().loop_count; n++) {
            SQInteger score = ctx.Diagnostics().loops[n].exec_guard_failures;
            if(!printed_loops[n] && score > best_score) {
                best = n;
                best_score = score;
            }
        }
        if(best < 0 || best_score <= 0) {
            break;
        }
        printed_loops[best] = true;
        SQJitDiagLoopStats *entry = &ctx.Diagnostics().loops[best];
        scprintf(_SC("[sqjit:stats] loop_guard rank=%d proto=%p name=%s source=%s line=%d ip=%d guard_fail=%d exec=%d exec_ok=%d compile=%d compile_ok=%d backoffs=%d skips=%d\n"),
            (SQInt32)(rank + 1), (void *)entry->proto, entry->name,
            entry->source, (SQInt32)entry->line, (SQInt32)entry->header_ip,
            (SQInt32)entry->exec_guard_failures, (SQInt32)entry->exec_attempts,
            (SQInt32)entry->exec_successes, (SQInt32)entry->compile_attempts,
            (SQInt32)entry->compile_successes, (SQInt32)entry->backoffs,
            (SQInt32)entry->backoff_skips);
    }

    bool printed_rejects[SQ_JIT_DIAG_MAX_REJECT_SITES];
    memset(printed_rejects, 0, sizeof(printed_rejects));
    for(SQInteger rank = 0; rank < 12; rank++) {
        SQInteger best = -1;
        SQInteger best_score = 0;
        for(SQInteger n = 0; n < ctx.Diagnostics().site_count; n++) {
            SQInteger score = ctx.Diagnostics().sites[n].count;
            if(!printed_rejects[n] && score > best_score) {
                best = n;
                best_score = score;
            }
        }
        if(best < 0 || best_score <= 0) {
            break;
        }
        printed_rejects[best] = true;
        SQJitDiagRejectSite *entry = &ctx.Diagnostics().sites[best];
        scprintf(_SC("[sqjit:stats] reject_site rank=%d proto=%p name=%s source=%s line=%d ip=%d count=%d reason=%s\n"),
            (SQInt32)(rank + 1), (void *)entry->proto, entry->name,
            entry->source, (SQInt32)entry->line, (SQInt32)entry->ip,
            (SQInt32)entry->count, entry->reason ? entry->reason : "unknown");
    }
}

void sqjit_diag_record_reject(SQFunctionProto *proto, const SQJitCompileResult &result)
{
    const char *reason = result.reason;
    SQInteger ip = result.ip;
    SQJitContext &ctx = sqjit_context(proto->_sharedstate);
    if(!ctx.collect_stats) {
        return;
    }

    ctx.Diagnostics().total.rejects++;
    if(!reason) {
        reason = "unknown";
    }
    SQJitRejectCategory category = result.category;
    ctx.Diagnostics().total.reject_categories[category]++;
    bool reason_recorded = false;
    for(SQInteger n = 0; n < ctx.Diagnostics().total.nreasons; n++) {
        if(strcmp(ctx.Diagnostics().total.reasons[n].reason, reason) == 0) {
            ctx.Diagnostics().total.reasons[n].count++;
            reason_recorded = true;
            break;
        }
    }
    if(!reason_recorded && ctx.Diagnostics().total.nreasons < SQ_JIT_DIAG_MAX_REASONS) {
        SQJitDiagReason &entry = ctx.Diagnostics().total.reasons[ctx.Diagnostics().total.nreasons++];
        entry.reason = reason;
        entry.count = 1;
    }

    SQJitDiagProtoStats *proto_entry = sqjit_diag_get_proto(proto);
    if(proto_entry) {
        proto_entry->rejects++;
        proto_entry->last_reject_ip = ip;
        proto_entry->last_reject_reason = reason;
    }
    SQJitDiagRejectSite *site = sqjit_diag_get_reject_site(proto, ip, reason);
    if(site) {
        site->count++;
    }
}

// Keep copied diagnostic names, but never identify a later proto by a reused address.
void sqjit_diag_forget_proto(SQFunctionProto *proto)
{
    SQJitContext *ctx = proto->_sharedstate->_jit_context;
    SQJitDiagnostics *diag = ctx ? ctx->ExistingDiagnostics() : NULL;
    if(!diag) return;
    for(SQInteger n = 0; n < diag->proto_count; ++n)
        if(diag->protos[n].proto == proto) diag->protos[n].proto = NULL;
    for(SQInteger n = 0; n < diag->loop_count; ++n)
        if(diag->loops[n].proto == proto) diag->loops[n].proto = NULL;
    for(SQInteger n = 0; n < diag->site_count; ++n)
        if(diag->sites[n].proto == proto) diag->sites[n].proto = NULL;
}
bool sqjit_diag_trace_enabled(SQFunctionProto *proto)
{
    SQJitContext &ctx = sqjit_context(proto->_sharedstate);
    return ctx.trace;
}
