/*  see copyright notice in squirrel.h */
#include "sqpcheader.h"
#include "sqfuncproto.h"
#include "sqstring.h"
#include "sqvm.h"
#include "sqarray.h"
#include "sqtable.h"
#include "sqclass.h"
#include "sqclosure.h"
#include "sqjit.h"
#include "sqjit_backend.h"
#include <limits.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>
#if defined(__x86_64__) || defined(_M_X64)
#if defined(_WIN64)
#ifndef WIN32_LEAN_AND_MEAN
#define WIN32_LEAN_AND_MEAN
#endif
#ifndef NOMINMAX
#define NOMINMAX
#endif
#include <windows.h>
#define SQJIT_ABI_WIN64 1
#else
#include <sys/mman.h>
#include <unistd.h>
#define SQJIT_ABI_WIN64 0
#endif
#define SQJIT_HAS_X64_NATIVE 1
#define SQJIT_HAS_EXTERNAL_NATIVE 0
#elif defined(__aarch64__) && defined(__linux__)
#define SQJIT_ABI_WIN64 0
#define SQJIT_HAS_X64_NATIVE 0
#define SQJIT_HAS_EXTERNAL_NATIVE 1
#else
#define SQJIT_ABI_WIN64 0
#define SQJIT_HAS_X64_NATIVE 0
#define SQJIT_HAS_EXTERNAL_NATIVE 0
#endif

static bool sqjit_env_checked = false;
static bool sqjit_env_enabled = false;
static bool sqjit_trace_enabled = false;
static bool sqjit_trace_stats_enabled = false;
static SQInteger sqjit_threshold = 1000;

enum {
    SQ_JIT_DIAG_MAX_REASONS = 96,
    SQ_JIT_DIAG_MAX_PROTOS = 256,
    SQ_JIT_DIAG_MAX_LOOPS = 256,
    SQ_JIT_DIAG_MAX_REJECT_SITES = 256,
    SQ_JIT_DIAG_NAME_SIZE = 96,
    SQ_JIT_DIAG_SOURCE_SIZE = 160,
    SQ_JIT_GUARD_BACKOFF_THRESHOLD = 16,
    SQ_JIT_DIRECT_GUARD_BACKOFF_WEIGHT = 4,
    SQ_JIT_GUARD_BACKOFF_INITIAL = 256,
    SQ_JIT_GUARD_BACKOFF_MAX = 65536,
    SQ_JIT_LOOP_GUARD_BACKOFF_THRESHOLD = 16,
    SQ_JIT_LOOP_GUARD_BACKOFF_INITIAL = 128,
    SQ_JIT_LOOP_GUARD_BACKOFF_MAX = 32768,
    SQ_JIT_TRANSIENT_RETRY_LIMIT = 16
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

static SQJitDiagStats sqjit_diag_stats;
static SQJitDiagProtoStats sqjit_diag_proto_stats[SQ_JIT_DIAG_MAX_PROTOS];
static SQInteger sqjit_diag_proto_count = 0;
static SQJitDiagLoopStats sqjit_diag_loop_stats[SQ_JIT_DIAG_MAX_LOOPS];
static SQInteger sqjit_diag_loop_count = 0;
static SQJitDiagRejectSite sqjit_diag_reject_sites[SQ_JIT_DIAG_MAX_REJECT_SITES];
static SQInteger sqjit_diag_reject_site_count = 0;
static bool sqjit_diag_registered_atexit = false;
static SQInteger sqjit_proto_runtime_tick = 0;
static SQInteger sqjit_loop_runtime_tick = 0;
static bool sqjit_last_reject_transient = false;

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
    "other"
};

const char *sqjit_diag_reject_category_name(SQJitRejectCategory category)
{
    if(category < 0 || category >= SQ_JIT_REJECT_COUNT) {
        return sqjit_diag_reject_category_names[SQ_JIT_REJECT_UNKNOWN];
    }
    return sqjit_diag_reject_category_names[category];
}

static SQJitRejectCategory sqjit_diag_classify_reject_reason(const char *reason)
{
    if(!reason) {
        return SQ_JIT_REJECT_UNKNOWN;
    }
    if(strstr(reason, "invalid") || strstr(reason, "operand")) {
        return SQ_JIT_REJECT_INVALID_BYTECODE;
    }
    if(strstr(reason, "append") || strstr(reason, "push")) {
        return SQ_JIT_REJECT_ARRAY_APPEND;
    }
    if(strstr(reason, "loop")) {
        return SQ_JIT_REJECT_LOOP;
    }
    if(strstr(reason, "array")) {
        return SQ_JIT_REJECT_ARRAY;
    }
    if(strstr(reason, "member") || strstr(reason, "field")) {
        return SQ_JIT_REJECT_MEMBER;
    }
    if(strstr(reason, "unsupported opcode")) {
        return SQ_JIT_REJECT_OPCODE;
    }
    if(strstr(reason, "CALL") || strstr(reason, "call") ||
        strstr(reason, "closure") || strstr(reason, "native")) {
        return SQ_JIT_REJECT_CALL;
    }
    if(strstr(reason, "class") || strstr(reason, "constructor")) {
        return SQ_JIT_REJECT_CONSTRUCTOR;
    }
    if(strstr(reason, "guard")) {
        return SQ_JIT_REJECT_GUARD;
    }
    if(strstr(reason, "SET") || strstr(reason, "write")) {
        return SQ_JIT_REJECT_WRITE;
    }
    return SQ_JIT_REJECT_OTHER;
}

static const SQChar *sqjit_diag_proto_name(SQFunctionProto *proto)
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

static SQJitDiagProtoStats *sqjit_diag_get_proto(SQFunctionProto *proto)
{
    if(!proto) {
        return NULL;
    }
    for(SQInteger n = 0; n < sqjit_diag_proto_count; n++) {
        if(sqjit_diag_proto_stats[n].proto == proto) {
            return &sqjit_diag_proto_stats[n];
        }
    }
    if(sqjit_diag_proto_count >= SQ_JIT_DIAG_MAX_PROTOS) {
        return NULL;
    }

    SQJitDiagProtoStats *entry = &sqjit_diag_proto_stats[sqjit_diag_proto_count++];
    memset(entry, 0, sizeof(*entry));
    entry->proto = proto;
    entry->last_reject_ip = -1;
    sqjit_diag_copy_name(entry->name, proto);
    sqjit_diag_copy_source(entry->source, proto);
    return entry;
}

static SQJitDiagLoopStats *sqjit_diag_get_loop(SQFunctionProto *proto,
    SQInteger header_ip)
{
    if(!proto || header_ip < 0) {
        return NULL;
    }
    for(SQInteger n = 0; n < sqjit_diag_loop_count; n++) {
        if(sqjit_diag_loop_stats[n].proto == proto &&
            sqjit_diag_loop_stats[n].header_ip == header_ip) {
            return &sqjit_diag_loop_stats[n];
        }
    }
    if(sqjit_diag_loop_count >= SQ_JIT_DIAG_MAX_LOOPS) {
        return NULL;
    }

    SQJitDiagLoopStats *entry = &sqjit_diag_loop_stats[sqjit_diag_loop_count++];
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
    for(SQInteger n = 0; n < sqjit_diag_reject_site_count; n++) {
        SQJitDiagRejectSite *entry = &sqjit_diag_reject_sites[n];
        if(entry->proto == proto && entry->ip == ip &&
            strcmp(entry->reason, reason) == 0) {
            return entry;
        }
    }
    if(sqjit_diag_reject_site_count >= SQ_JIT_DIAG_MAX_REJECT_SITES) {
        return NULL;
    }

    SQJitDiagRejectSite *entry =
        &sqjit_diag_reject_sites[sqjit_diag_reject_site_count++];
    memset(entry, 0, sizeof(*entry));
    entry->proto = proto;
    entry->ip = ip;
    entry->line = sqjit_diag_proto_line(proto, ip);
    entry->reason = reason;
    sqjit_diag_copy_name(entry->name, proto);
    sqjit_diag_copy_source(entry->source, proto);
    return entry;
}

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

static void sqjit_diag_dump_stats()
{
    if(!sqjit_trace_stats_enabled) {
        return;
    }

    scprintf(_SC("[sqjit:stats] proto enters=%d hot=%d compile=%d success=%d fail=%d\n"),
        (SQInt32)sqjit_diag_stats.proto_enters,
        (SQInt32)sqjit_diag_stats.proto_hot,
        (SQInt32)sqjit_diag_stats.proto_compile_attempts,
        (SQInt32)sqjit_diag_stats.proto_compile_successes,
        (SQInt32)sqjit_diag_stats.proto_compile_failures);
    scprintf(_SC("[sqjit:stats] proto exec attempts=%d success=%d guard_fail=%d\n"),
        (SQInt32)sqjit_diag_stats.proto_exec_attempts,
        (SQInt32)sqjit_diag_stats.proto_exec_successes,
        (SQInt32)sqjit_diag_stats.proto_exec_guard_failures);
    scprintf(_SC("[sqjit:stats] direct calls attempts=%d success=%d miss=%d guard_fail=%d\n"),
        (SQInt32)sqjit_diag_stats.direct_call_attempts,
        (SQInt32)sqjit_diag_stats.direct_call_successes,
        (SQInt32)sqjit_diag_stats.direct_call_misses,
        (SQInt32)sqjit_diag_stats.direct_call_guard_failures);
    scprintf(_SC("[sqjit:stats] loops try=%d find_fail=%d compile=%d success=%d fail=%d exec=%d exec_success=%d guard_fail=%d\n"),
        (SQInt32)sqjit_diag_stats.loop_try_attempts,
        (SQInt32)sqjit_diag_stats.loop_find_failures,
        (SQInt32)sqjit_diag_stats.loop_compile_attempts,
        (SQInt32)sqjit_diag_stats.loop_compile_successes,
        (SQInt32)sqjit_diag_stats.loop_compile_failures,
        (SQInt32)sqjit_diag_stats.loop_exec_attempts,
        (SQInt32)sqjit_diag_stats.loop_exec_successes,
        (SQInt32)sqjit_diag_stats.loop_exec_guard_failures);
    scprintf(_SC("[sqjit:stats] rejects=%d unique_reasons=%d\n"),
        (SQInt32)sqjit_diag_stats.rejects,
        (SQInt32)sqjit_diag_stats.nreasons);
    scprintf(_SC("[sqjit:stats] backoff proto=%d proto_skips=%d loop=%d loop_skips=%d\n"),
        (SQInt32)sqjit_diag_stats.proto_backoffs,
        (SQInt32)sqjit_diag_stats.proto_backoff_skips,
        (SQInt32)sqjit_diag_stats.loop_backoffs,
        (SQInt32)sqjit_diag_stats.loop_backoff_skips);
    for(SQInteger n = 0; n < SQ_JIT_REJECT_COUNT; n++) {
        if(sqjit_diag_stats.reject_categories[n] <= 0) {
            continue;
        }
        scprintf(_SC("[sqjit:stats] reject category count=%d category=%s\n"),
            (SQInt32)sqjit_diag_stats.reject_categories[n],
            sqjit_diag_reject_category_name((SQJitRejectCategory)n));
    }
    for(SQInteger n = 0; n < sqjit_diag_stats.nreasons; n++) {
        scprintf(_SC("[sqjit:stats] reject reason count=%d reason=%s\n"),
            (SQInt32)sqjit_diag_stats.reasons[n].count,
            sqjit_diag_stats.reasons[n].reason);
    }

    bool printed_protos[SQ_JIT_DIAG_MAX_PROTOS];
    memset(printed_protos, 0, sizeof(printed_protos));
    for(SQInteger rank = 0; rank < 12; rank++) {
        SQInteger best = -1;
        SQInteger best_score = 0;
        for(SQInteger n = 0; n < sqjit_diag_proto_count; n++) {
            SQInteger score = sqjit_diag_proto_stats[n].exec_guard_failures +
                sqjit_diag_proto_stats[n].direct_guard_failures;
            if(!printed_protos[n] && score > best_score) {
                best = n;
                best_score = score;
            }
        }
        if(best < 0 || best_score <= 0) {
            break;
        }
        printed_protos[best] = true;
        SQJitDiagProtoStats *entry = &sqjit_diag_proto_stats[best];
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
        for(SQInteger n = 0; n < sqjit_diag_loop_count; n++) {
            SQInteger score = sqjit_diag_loop_stats[n].exec_guard_failures;
            if(!printed_loops[n] && score > best_score) {
                best = n;
                best_score = score;
            }
        }
        if(best < 0 || best_score <= 0) {
            break;
        }
        printed_loops[best] = true;
        SQJitDiagLoopStats *entry = &sqjit_diag_loop_stats[best];
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
        for(SQInteger n = 0; n < sqjit_diag_reject_site_count; n++) {
            SQInteger score = sqjit_diag_reject_sites[n].count;
            if(!printed_rejects[n] && score > best_score) {
                best = n;
                best_score = score;
            }
        }
        if(best < 0 || best_score <= 0) {
            break;
        }
        printed_rejects[best] = true;
        SQJitDiagRejectSite *entry = &sqjit_diag_reject_sites[best];
        scprintf(_SC("[sqjit:stats] reject_site rank=%d proto=%p name=%s source=%s line=%d ip=%d count=%d reason=%s\n"),
            (SQInt32)(rank + 1), (void *)entry->proto, entry->name,
            entry->source, (SQInt32)entry->line, (SQInt32)entry->ip,
            (SQInt32)entry->count, entry->reason ? entry->reason : "unknown");
    }
}

static bool sqjit_is_truthy_env(const char *value)
{
    return value && value[0] != '\0' && value[0] != '0';
}

static void sqjit_read_env_once()
{
    if(sqjit_env_checked) {
        return;
    }
    sqjit_env_checked = true;

    sqjit_env_enabled = sqjit_is_truthy_env(getenv("SQGI_JIT"));
    const char *trace = getenv("SQGI_JIT_TRACE");
    sqjit_trace_enabled = sqjit_is_truthy_env(trace) &&
        (!trace || strcmp(trace, "stats") != 0);
    sqjit_trace_stats_enabled = trace && strcmp(trace, "stats") == 0;
    if(sqjit_trace_stats_enabled && !sqjit_diag_registered_atexit) {
        atexit(sqjit_diag_dump_stats);
        sqjit_diag_registered_atexit = true;
    }

    const char *threshold = getenv("SQGI_JIT_THRESHOLD");
    if(threshold && threshold[0] != '\0') {
        SQInteger parsed = (SQInteger)strtoll(threshold, NULL, 10);
        if(parsed >= 0) {
            sqjit_threshold = parsed;
        }
    }
}

static SQJitProto *sqjit_ensure_proto(SQFunctionProto *proto)
{
    if(!proto->_jit) {
        proto->_jit = (SQJitProto *)sq_vm_malloc(sizeof(SQJitProto));
        if(!proto->_jit) {
            return NULL;
        }
        proto->_jit->_entry = NULL;
        proto->_jit->_loop_entry = NULL;
        proto->_jit->_loop_native_size = 0;
        proto->_jit->_loop_header_ip = -1;
        proto->_jit->_loop_exit_ip = -1;
        proto->_jit->_loop_hot_count = 0;
        proto->_jit->_loop_fail_count = 0;
        proto->_jit->_loop_guard_fail_count = 0;
        proto->_jit->_loop_guard_backoff_until = 0;
        proto->_jit->_loop_guard_backoff_delay = 0;
        proto->_jit->_loop_reject_count = 0;
        proto->_jit->_loop_reject_next = 0;
        for(SQInteger n = 0; n < SQ_JIT_LOOP_REJECT_CACHE_SIZE; n++) {
            proto->_jit->_loop_reject_headers[n] = -1;
        }
        proto->_jit->_loop_trace_executed = false;
        proto->_jit->_hot_count = 0;
        proto->_jit->_fail_count = 0;
        proto->_jit->_guard_fail_count = 0;
        proto->_jit->_guard_backoff_until = 0;
        proto->_jit->_guard_backoff_delay = 0;
        proto->_jit->_version = 0;
        proto->_jit->_eligibility = SQ_JIT_UNKNOWN;
    }
    return proto->_jit;
}

static const SQChar *sqjit_proto_name(SQFunctionProto *proto)
{
    return sq_type(proto->_name) == OT_STRING ? _stringval(proto->_name) : _SC("<anonymous>");
}

static bool sqjit_loop_header_is_rejected(SQJitProto *jit, SQInteger header_ip)
{
    if(!jit) {
        return false;
    }
    for(SQInteger n = 0; n < jit->_loop_reject_count; n++) {
        if(jit->_loop_reject_headers[n] == header_ip) {
            return true;
        }
    }
    return false;
}

static void sqjit_loop_reject_header(SQJitProto *jit, SQInteger header_ip)
{
    if(!jit || header_ip < 0 || sqjit_loop_header_is_rejected(jit, header_ip)) {
        return;
    }

    if(jit->_loop_reject_count < SQ_JIT_LOOP_REJECT_CACHE_SIZE) {
        jit->_loop_reject_headers[jit->_loop_reject_count++] = header_ip;
        return;
    }

    jit->_loop_reject_headers[jit->_loop_reject_next] = header_ip;
    jit->_loop_reject_next = (jit->_loop_reject_next + 1) % SQ_JIT_LOOP_REJECT_CACHE_SIZE;
}

bool sqjit_diag_trace_enabled()
{
    sqjit_read_env_once();
    return sqjit_trace_enabled;
}

void sqjit_diag_record_reject(SQFunctionProto *proto, SQInteger ip, const char *reason)
{
    sqjit_read_env_once();
    if(!sqjit_trace_stats_enabled) {
        return;
    }

    sqjit_diag_stats.rejects++;
    if(!reason) {
        reason = "unknown";
    }
    SQJitRejectCategory category = sqjit_diag_classify_reject_reason(reason);
    sqjit_diag_stats.reject_categories[category]++;
    bool reason_recorded = false;
    for(SQInteger n = 0; n < sqjit_diag_stats.nreasons; n++) {
        if(strcmp(sqjit_diag_stats.reasons[n].reason, reason) == 0) {
            sqjit_diag_stats.reasons[n].count++;
            reason_recorded = true;
            break;
        }
    }
    if(!reason_recorded && sqjit_diag_stats.nreasons < SQ_JIT_DIAG_MAX_REASONS) {
        SQJitDiagReason &entry = sqjit_diag_stats.reasons[sqjit_diag_stats.nreasons++];
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

void sqjit_diag_mark_transient_reject()
{
    sqjit_last_reject_transient = true;
}

void sqjit_diag_clear_transient_reject()
{
    sqjit_last_reject_transient = false;
}

bool sqjit_diag_consume_transient_reject()
{
    bool transient = sqjit_last_reject_transient;
    sqjit_last_reject_transient = false;
    return transient;
}

static bool sqjit_proto_backoff_active(SQFunctionProto *proto, SQJitProto *jit)
{
    if(!jit || jit->_guard_backoff_until <= sqjit_proto_runtime_tick) {
        return false;
    }
    if(sqjit_trace_stats_enabled) {
        sqjit_diag_stats.proto_backoff_skips++;
        SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
        if(entry) {
            entry->backoff_skips++;
        }
    }
    return true;
}

static void sqjit_proto_note_guard_fail(SQFunctionProto *proto, SQJitProto *jit,
    SQInteger weight = 1)
{
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
    jit->_guard_backoff_until = sqjit_proto_runtime_tick + jit->_guard_backoff_delay;
    jit->_guard_fail_count = 0;

    if(sqjit_trace_stats_enabled) {
        sqjit_diag_stats.proto_backoffs++;
        SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
        if(entry) {
            entry->backoffs++;
        }
    }
    if(sqjit_trace_enabled) {
        scprintf(_SC("[sqjit] backing off native proto '%s' for %d attempts after guard churn\n"),
            sqjit_diag_proto_name(proto), (SQInt32)jit->_guard_backoff_delay);
    }
}

static void sqjit_proto_note_success(SQJitProto *jit)
{
    if(!jit) {
        return;
    }
    jit->_guard_fail_count = 0;
    jit->_guard_backoff_until = 0;
    jit->_guard_backoff_delay = 0;
}

static bool sqjit_loop_backoff_active(SQFunctionProto *proto, SQJitProto *jit,
    SQInteger header_ip)
{
    if(!jit || jit->_loop_guard_backoff_until <= sqjit_loop_runtime_tick) {
        return false;
    }
    if(sqjit_trace_stats_enabled) {
        sqjit_diag_stats.loop_backoff_skips++;
        SQJitDiagLoopStats *entry = sqjit_diag_get_loop(proto, header_ip);
        if(entry) {
            entry->backoff_skips++;
        }
    }
    return true;
}

static void sqjit_loop_note_guard_fail(SQFunctionProto *proto, SQJitProto *jit,
    SQInteger header_ip)
{
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
    jit->_loop_guard_backoff_until = sqjit_loop_runtime_tick +
        jit->_loop_guard_backoff_delay;
    jit->_loop_guard_fail_count = 0;

    if(sqjit_trace_stats_enabled) {
        sqjit_diag_stats.loop_backoffs++;
        SQJitDiagLoopStats *entry = sqjit_diag_get_loop(proto, header_ip);
        if(entry) {
            entry->backoffs++;
        }
    }
    if(sqjit_trace_enabled) {
        scprintf(_SC("[sqjit] backing off native loop in proto '%s' at ip %d for %d attempts after guard churn\n"),
            sqjit_diag_proto_name(proto), (SQInt32)header_ip,
            (SQInt32)jit->_loop_guard_backoff_delay);
    }
}

static void sqjit_loop_note_success(SQJitProto *jit)
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

#if SQJIT_HAS_X64_NATIVE
struct SQJitNativeCodeBuffer {
    unsigned char bytes[8192];
    SQInteger size;
};

static const SQInteger SQ_JIT_NATIVE_CLOSURE_SLOT = MAX_FUNC_STACKSIZE;
static const SQInteger SQ_JIT_NATIVE_WRITE_LOG_SLOT = MAX_FUNC_STACKSIZE + 1;

struct SQJitNativeReloc {
    SQInteger patch_offset;
    SQInteger target_ip;
};

enum SQJitSlotKind {
    SQ_JIT_SLOT_UNKNOWN = 0,
    SQ_JIT_SLOT_INT,
    SQ_JIT_SLOT_FLOAT,
    SQ_JIT_SLOT_ARRAY_PTR,
    SQ_JIT_SLOT_STACK_OBJECT,
    SQ_JIT_SLOT_LITERAL_OBJECT
};

enum SQJitNativeJcc {
    SQ_JIT_JCC_B = 0x82,
    SQ_JIT_JCC_AE = 0x83,
    SQ_JIT_JCC_E = 0x84,
    SQ_JIT_JCC_NE = 0x85,
    SQ_JIT_JCC_BE = 0x86,
    SQ_JIT_JCC_A = 0x87,
    SQ_JIT_JCC_L = 0x8C,
    SQ_JIT_JCC_GE = 0x8D,
    SQ_JIT_JCC_LE = 0x8E,
    SQ_JIT_JCC_G = 0x8F
};

enum SQJitWriteKind {
    SQ_JIT_WRITE_ARRAY_INDEX,
    SQ_JIT_WRITE_TABLE_KEY
};

struct SQJitWriteLogEntry {
    SQJitWriteKind kind;
    SQObjectPtr target;
    SQObjectPtr key;
    SQObjectPtr old_value;
    SQInteger index;
};

struct SQJitWriteLog {
    sqvector<SQJitWriteLogEntry> entries;
};

static bool sqjit_native_is_int32(SQInteger value)
{
    return value >= (SQInteger)INT_MIN && value <= (SQInteger)INT_MAX;
}

static bool sqjit_native_emit_u8(SQJitNativeCodeBuffer *buf, unsigned char value)
{
    if(buf->size >= (SQInteger)sizeof(buf->bytes)) {
        return false;
    }
    buf->bytes[buf->size++] = value;
    return true;
}

static bool sqjit_native_emit_i32(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    if(!sqjit_native_is_int32(value) || buf->size + 4 > (SQInteger)sizeof(buf->bytes)) {
        return false;
    }
    SQInt32 v = (SQInt32)value;
    memcpy(&buf->bytes[buf->size], &v, sizeof(v));
    buf->size += 4;
    return true;
}

static bool sqjit_native_emit_i64(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    if(buf->size + 8 > (SQInteger)sizeof(buf->bytes)) {
        return false;
    }
    SQInteger v = value;
    memcpy(&buf->bytes[buf->size], &v, sizeof(v));
    buf->size += 8;
    return true;
}

static bool sqjit_native_emit_i32_unchecked(SQJitNativeCodeBuffer *buf, SQInt32 value)
{
    if(buf->size + 4 > (SQInteger)sizeof(buf->bytes)) {
        return false;
    }
    memcpy(&buf->bytes[buf->size], &value, sizeof(value));
    buf->size += 4;
    return true;
}

static bool sqjit_native_patch_i32(SQJitNativeCodeBuffer *buf, SQInteger offset, SQInteger value)
{
    if(!sqjit_native_is_int32(value) || offset < 0 || offset + 4 > buf->size) {
        return false;
    }
    SQInt32 v = (SQInt32)value;
    memcpy(&buf->bytes[offset], &v, sizeof(v));
    return true;
}

static SQInteger sqjit_native_slot_disp(SQInteger reg)
{
    return -((reg + 1) * (SQInteger)sizeof(SQInteger));
}

static SQInteger sqjit_native_pinned_slot_reg(SQInteger slot)
{
    switch(slot) {
        case 1: return 14; // first user parameter / loop bound
        case 2: return 15; // first local accumulator
        case 3: return 3;  // common loop index
        default: return -1;
    }
}

static bool sqjit_native_emit_rex_w_rr(SQJitNativeCodeBuffer *buf, SQInteger reg, SQInteger rm)
{
    return sqjit_native_emit_u8(buf, (unsigned char)(0x48 |
        ((reg & 8) ? 0x04 : 0) |
        ((rm & 8) ? 0x01 : 0)));
}

static bool sqjit_native_emit_modrm_rr(SQJitNativeCodeBuffer *buf, SQInteger reg, SQInteger rm)
{
    return sqjit_native_emit_u8(buf, (unsigned char)(0xC0 | ((reg & 7) << 3) | (rm & 7)));
}

static SQInteger sqjit_native_stack_type_disp(SQInteger reg)
{
    return reg * (SQInteger)sizeof(SQObjectPtr) + (SQInteger)offsetof(SQObject, _type);
}

static SQInteger sqjit_native_stack_value_disp(SQInteger reg)
{
    return reg * (SQInteger)sizeof(SQObjectPtr) + (SQInteger)offsetof(SQObject, _unVal);
}

static bool sqjit_native_emit_rbp_disp32(SQJitNativeCodeBuffer *buf, SQInteger reg)
{
    return sqjit_native_emit_i32(buf, sqjit_native_slot_disp(reg));
}

static bool sqjit_native_emit_mov_rax_local_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x8B) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

static bool sqjit_native_emit_mov_local_mem_rax(SQJitNativeCodeBuffer *buf, SQInteger dst)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, dst);
}

static bool sqjit_native_emit_mov_rax_imm64(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0xB8) &&
        sqjit_native_emit_i64(buf, value);
}

static bool sqjit_native_emit_mov_rcx_imm64(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0xB9) &&
        sqjit_native_emit_i64(buf, value);
}

static bool sqjit_native_emit_mov_rax_ptr(SQJitNativeCodeBuffer *buf, const void *value)
{
    return sqjit_native_emit_mov_rax_imm64(buf, (SQInteger)(intptr_t)value);
}

static bool sqjit_native_emit_ret(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0xC3);
}

static bool sqjit_native_emit_push_rbp(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x55);
}

static bool sqjit_native_emit_push_rdi(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x57);
}

static bool sqjit_native_emit_push_rsi(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x56);
}

static bool sqjit_native_emit_push_r12(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x41) &&
        sqjit_native_emit_u8(buf, 0x54);
}

static bool sqjit_native_emit_push_r13(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x41) &&
        sqjit_native_emit_u8(buf, 0x55);
}

static bool sqjit_native_emit_push_r14(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x41) &&
        sqjit_native_emit_u8(buf, 0x56);
}

static bool sqjit_native_emit_push_r15(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x41) &&
        sqjit_native_emit_u8(buf, 0x57);
}

static bool sqjit_native_emit_push_rbx(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x53);
}

static bool sqjit_native_emit_pop_rbp(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x5D);
}

static bool sqjit_native_emit_pop_rdi(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x5F);
}

static bool sqjit_native_emit_pop_rsi(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x5E);
}

static bool sqjit_native_emit_pop_r12(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x41) &&
        sqjit_native_emit_u8(buf, 0x5C);
}

static bool sqjit_native_emit_pop_r13(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x41) &&
        sqjit_native_emit_u8(buf, 0x5D);
}

static bool sqjit_native_emit_pop_r14(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x41) &&
        sqjit_native_emit_u8(buf, 0x5E);
}

static bool sqjit_native_emit_pop_r15(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x41) &&
        sqjit_native_emit_u8(buf, 0x5F);
}

static bool sqjit_native_emit_pop_rbx(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x5B);
}

static bool sqjit_native_emit_push_abi_preserved_arg_regs(SQJitNativeCodeBuffer *buf)
{
#if SQJIT_ABI_WIN64
    // The emitter keeps helper-call arguments in SysV-shaped staging registers.
    // Win64 treats RDI/RSI as nonvolatile, so preserve them around native JIT code.
    return sqjit_native_emit_push_rdi(buf) &&
        sqjit_native_emit_push_rsi(buf);
#else
    (void)buf;
    return true;
#endif
}

static bool sqjit_native_emit_pop_abi_preserved_arg_regs(SQJitNativeCodeBuffer *buf)
{
#if SQJIT_ABI_WIN64
    return sqjit_native_emit_pop_rsi(buf) &&
        sqjit_native_emit_pop_rdi(buf);
#else
    (void)buf;
    return true;
#endif
}

static bool sqjit_native_emit_mov_rbp_rsp(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xE5);
}

static bool sqjit_native_emit_mov_r12_rsi(SQJitNativeCodeBuffer *buf)
{
#if SQJIT_ABI_WIN64
    // Incoming native arg2 is RDX on Win64.
    return sqjit_native_emit_u8(buf, 0x49) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xD4);
#else
    return sqjit_native_emit_u8(buf, 0x49) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xF4);
#endif
}

static bool sqjit_native_emit_mov_r13_rdi(SQJitNativeCodeBuffer *buf)
{
#if SQJIT_ABI_WIN64
    // Incoming native arg1 is RCX on Win64.
    return sqjit_native_emit_u8(buf, 0x49) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xCD);
#else
    return sqjit_native_emit_u8(buf, 0x49) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xFD);
#endif
}

static bool sqjit_native_emit_mov_rdi_r13(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x4C) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xEF);
}

static bool sqjit_native_emit_mov_rdi_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x8B) &&
        sqjit_native_emit_u8(buf, 0xBD) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

static bool sqjit_native_emit_lea_rdi_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x8D) &&
        sqjit_native_emit_u8(buf, 0xBD) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

static bool sqjit_native_emit_mov_rsi_r13(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x4C) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xEE);
}

static bool sqjit_native_emit_mov_rsi_i64(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0xBE) &&
        sqjit_native_emit_i64(buf, value);
}

static bool sqjit_native_emit_mov_rsi_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    SQInteger reg = sqjit_native_pinned_slot_reg(src);
    if(reg >= 0) {
        return sqjit_native_emit_rex_w_rr(buf, 6, reg) &&
            sqjit_native_emit_u8(buf, 0x8B) &&
            sqjit_native_emit_modrm_rr(buf, 6, reg);
    }
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x8B) &&
        sqjit_native_emit_u8(buf, 0xB5) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

static bool sqjit_native_emit_mov_rsi_local_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x8B) &&
        sqjit_native_emit_u8(buf, 0xB5) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

static bool sqjit_native_emit_mov_rdx_i64(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0xBA) &&
        sqjit_native_emit_i64(buf, value);
}

static bool sqjit_native_emit_mov_rdx_r12(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x4C) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xE2);
}

static bool sqjit_native_emit_mov_rdx_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    SQInteger reg = sqjit_native_pinned_slot_reg(src);
    if(reg >= 0) {
        return sqjit_native_emit_rex_w_rr(buf, 2, reg) &&
            sqjit_native_emit_u8(buf, 0x8B) &&
            sqjit_native_emit_modrm_rr(buf, 2, reg);
    }
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x8B) &&
        sqjit_native_emit_u8(buf, 0x95) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

static bool sqjit_native_emit_mov_r8_i64(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    return sqjit_native_emit_u8(buf, 0x49) &&
        sqjit_native_emit_u8(buf, 0xB8) &&
        sqjit_native_emit_i64(buf, value);
}

static bool sqjit_native_emit_mov_r8_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    SQInteger reg = sqjit_native_pinned_slot_reg(src);
    if(reg >= 0) {
        return sqjit_native_emit_rex_w_rr(buf, 8, reg) &&
            sqjit_native_emit_u8(buf, 0x8B) &&
            sqjit_native_emit_modrm_rr(buf, 8, reg);
    }
    return sqjit_native_emit_u8(buf, 0x4C) &&
        sqjit_native_emit_u8(buf, 0x8B) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

static bool sqjit_native_emit_lea_r8_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    return sqjit_native_emit_u8(buf, 0x4C) &&
        sqjit_native_emit_u8(buf, 0x8D) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

static bool sqjit_native_emit_lea_rcx_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x8D) &&
        sqjit_native_emit_u8(buf, 0x8D) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

static bool sqjit_native_emit_lea_rdx_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x8D) &&
        sqjit_native_emit_u8(buf, 0x95) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

static bool sqjit_native_emit_call_rax(SQJitNativeCodeBuffer *buf)
{
#if SQJIT_ABI_WIN64
    // Helper call sites stage arguments as:
    //   arg1=RDI, arg2=RSI, arg3=RDX, arg4=RCX, arg5=R8.
    // Win64 wants:
    //   arg1=RCX, arg2=RDX, arg3=R8, arg4=R9, arg5=[RSP+32],
    // with 32 bytes of shadow space. 48 keeps RSP 16-byte aligned.
    return sqjit_native_emit_u8(buf, 0x49) && // mov %rax, %r11
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xC3) &&
        sqjit_native_emit_u8(buf, 0x48) && // sub $48, %rsp
        sqjit_native_emit_u8(buf, 0x83) &&
        sqjit_native_emit_u8(buf, 0xEC) &&
        sqjit_native_emit_u8(buf, 0x30) &&
        sqjit_native_emit_u8(buf, 0x4C) && // mov %r8, 32(%rsp)
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0x44) &&
        sqjit_native_emit_u8(buf, 0x24) &&
        sqjit_native_emit_u8(buf, 0x20) &&
        sqjit_native_emit_u8(buf, 0x49) && // mov %rcx, %r9
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xC9) &&
        sqjit_native_emit_u8(buf, 0x49) && // mov %rdx, %r8
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xD0) &&
        sqjit_native_emit_u8(buf, 0x48) && // mov %rsi, %rdx
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xF2) &&
        sqjit_native_emit_u8(buf, 0x48) && // mov %rdi, %rcx
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xF9) &&
        sqjit_native_emit_u8(buf, 0x41) && // call *%r11
        sqjit_native_emit_u8(buf, 0xFF) &&
        sqjit_native_emit_u8(buf, 0xD3) &&
        sqjit_native_emit_u8(buf, 0x48) && // add $48, %rsp
        sqjit_native_emit_u8(buf, 0x83) &&
        sqjit_native_emit_u8(buf, 0xC4) &&
        sqjit_native_emit_u8(buf, 0x30);
#else
    return sqjit_native_emit_u8(buf, 0xFF) &&
        sqjit_native_emit_u8(buf, 0xD0);
#endif
}

static bool sqjit_native_emit_test_rax_rax(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_u8(buf, 0xC0);
}

static bool sqjit_native_emit_mov_rsp_rbp(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xEC);
}

static bool sqjit_native_emit_sub_rsp_i32(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x81) &&
        sqjit_native_emit_u8(buf, 0xEC) &&
        sqjit_native_emit_i32(buf, value);
}

static bool sqjit_native_emit_mov_mem_rax(SQJitNativeCodeBuffer *buf, SQInteger dst)
{
    SQInteger reg = sqjit_native_pinned_slot_reg(dst);
    if(reg >= 0) {
        return sqjit_native_emit_rex_w_rr(buf, 0, reg) &&
            sqjit_native_emit_u8(buf, 0x89) &&
            sqjit_native_emit_modrm_rr(buf, 0, reg);
    }
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, dst);
}

static bool sqjit_native_emit_mov_rax_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    SQInteger reg = sqjit_native_pinned_slot_reg(src);
    if(reg >= 0) {
        return sqjit_native_emit_rex_w_rr(buf, 0, reg) &&
            sqjit_native_emit_u8(buf, 0x8B) &&
            sqjit_native_emit_modrm_rr(buf, 0, reg);
    }
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x8B) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

static bool sqjit_native_sync_pinned_slot_from_local(SQJitNativeCodeBuffer *buf, SQInteger slot)
{
    if(sqjit_native_pinned_slot_reg(slot) < 0) {
        return true;
    }
    return sqjit_native_emit_mov_rax_local_mem(buf, slot) &&
        sqjit_native_emit_mov_mem_rax(buf, slot);
}

static bool sqjit_native_emit_cmp_stack_type_i32(SQJitNativeCodeBuffer *buf, SQInteger reg, SQInteger type)
{
    return sqjit_native_emit_u8(buf, 0x41) &&
        sqjit_native_emit_u8(buf, 0x81) &&
        sqjit_native_emit_u8(buf, 0xBD) &&
        sqjit_native_emit_i32(buf, sqjit_native_stack_type_disp(reg)) &&
        sqjit_native_emit_i32(buf, type);
}

static bool sqjit_native_emit_mov_rax_stack_value(SQJitNativeCodeBuffer *buf, SQInteger reg)
{
    return sqjit_native_emit_u8(buf, 0x49) &&
        sqjit_native_emit_u8(buf, 0x8B) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_i32(buf, sqjit_native_stack_value_disp(reg));
}

static bool sqjit_native_emit_mov_rcx_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    SQInteger reg = sqjit_native_pinned_slot_reg(src);
    if(reg >= 0) {
        return sqjit_native_emit_rex_w_rr(buf, 1, reg) &&
            sqjit_native_emit_u8(buf, 0x8B) &&
            sqjit_native_emit_modrm_rr(buf, 1, reg);
    }
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x8B) &&
        sqjit_native_emit_u8(buf, 0x8D) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

static bool sqjit_native_emit_mov_mem_imm32(SQJitNativeCodeBuffer *buf, SQInteger dst, SQInteger value)
{
    SQInteger reg = sqjit_native_pinned_slot_reg(dst);
    if(reg >= 0) {
        return sqjit_native_emit_rex_w_rr(buf, 0, reg) &&
            sqjit_native_emit_u8(buf, 0xC7) &&
            sqjit_native_emit_modrm_rr(buf, 0, reg) &&
            sqjit_native_emit_i32(buf, value);
    }
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0xC7) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, dst) &&
        sqjit_native_emit_i32(buf, value);
}

static bool sqjit_native_emit_mov_out_rax(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x49) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0x04) &&
        sqjit_native_emit_u8(buf, 0x24);
}

static bool sqjit_native_emit_mov_out_value_rax(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x49) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0x84) &&
        sqjit_native_emit_u8(buf, 0x24) &&
        sqjit_native_emit_i32(buf, (SQInteger)offsetof(SQObject, _unVal));
}

static bool sqjit_native_emit_mov_out_type_i32(SQJitNativeCodeBuffer *buf, SQInteger type)
{
    return sqjit_native_emit_u8(buf, 0x41) &&
        sqjit_native_emit_u8(buf, 0xC7) &&
        sqjit_native_emit_u8(buf, 0x84) &&
        sqjit_native_emit_u8(buf, 0x24) &&
        sqjit_native_emit_i32(buf, (SQInteger)offsetof(SQObject, _type)) &&
        sqjit_native_emit_i32(buf, type);
}

static bool sqjit_native_emit_store_out_integer_from_rax(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_mov_out_value_rax(buf) &&
        sqjit_native_emit_mov_out_type_i32(buf, OT_INTEGER);
}

static bool sqjit_native_emit_mov_stack_type_i32(SQJitNativeCodeBuffer *buf, SQInteger reg, SQInteger type)
{
    return sqjit_native_emit_u8(buf, 0x41) &&
        sqjit_native_emit_u8(buf, 0xC7) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_i32(buf, sqjit_native_stack_type_disp(reg)) &&
        sqjit_native_emit_i32(buf, type);
}

static bool sqjit_native_emit_mov_stack_value_rax(SQJitNativeCodeBuffer *buf, SQInteger reg)
{
    return sqjit_native_emit_u8(buf, 0x49) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_i32(buf, sqjit_native_stack_value_disp(reg));
}

static bool sqjit_native_emit_store_stack_integer_from_rax(SQJitNativeCodeBuffer *buf, SQInteger reg)
{
    return sqjit_native_emit_mov_stack_value_rax(buf, reg) &&
        sqjit_native_emit_mov_stack_type_i32(buf, reg, OT_INTEGER);
}

static bool sqjit_native_emit_mov_local_float_const(SQJitNativeCodeBuffer *buf, SQInteger dst, SQFloat value)
{
    if(sizeof(SQFloat) == sizeof(SQInt32)) {
        SQInt32 bits;
        memcpy(&bits, &value, sizeof(bits));
        return sqjit_native_emit_u8(buf, 0xB8) &&
            sqjit_native_emit_i32_unchecked(buf, bits) &&
            sqjit_native_emit_u8(buf, 0x89) &&
            sqjit_native_emit_u8(buf, 0x85) &&
            sqjit_native_emit_rbp_disp32(buf, dst);
    }
    if(sizeof(SQFloat) == sizeof(SQInteger)) {
        SQInteger bits;
        memcpy(&bits, &value, sizeof(bits));
        return sqjit_native_emit_mov_rax_imm64(buf, bits) &&
            sqjit_native_emit_mov_local_mem_rax(buf, dst);
    }
    return false;
}

static bool sqjit_native_emit_mov_xmm0_local_float(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    return sqjit_native_emit_u8(buf, sizeof(SQFloat) == sizeof(SQInt32) ? 0xF3 : 0xF2) &&
        sqjit_native_emit_u8(buf, 0x0F) &&
        sqjit_native_emit_u8(buf, 0x10) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

static bool sqjit_native_emit_mov_local_float_xmm0(SQJitNativeCodeBuffer *buf, SQInteger dst)
{
    return sqjit_native_emit_u8(buf, sizeof(SQFloat) == sizeof(SQInt32) ? 0xF3 : 0xF2) &&
        sqjit_native_emit_u8(buf, 0x0F) &&
        sqjit_native_emit_u8(buf, 0x11) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, dst);
}

static bool sqjit_native_emit_mov_xmm0_stack_float_value(SQJitNativeCodeBuffer *buf, SQInteger reg)
{
    return sqjit_native_emit_u8(buf, sizeof(SQFloat) == sizeof(SQInt32) ? 0xF3 : 0xF2) &&
        sqjit_native_emit_u8(buf, 0x41) &&
        sqjit_native_emit_u8(buf, 0x0F) &&
        sqjit_native_emit_u8(buf, 0x10) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_i32(buf, sqjit_native_stack_value_disp(reg));
}

static bool sqjit_native_emit_mov_stack_float_value_xmm0(SQJitNativeCodeBuffer *buf, SQInteger reg)
{
    return sqjit_native_emit_u8(buf, sizeof(SQFloat) == sizeof(SQInt32) ? 0xF3 : 0xF2) &&
        sqjit_native_emit_u8(buf, 0x41) &&
        sqjit_native_emit_u8(buf, 0x0F) &&
        sqjit_native_emit_u8(buf, 0x11) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_i32(buf, sqjit_native_stack_value_disp(reg));
}

static bool sqjit_native_emit_mov_out_float_value_xmm0(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, sizeof(SQFloat) == sizeof(SQInt32) ? 0xF3 : 0xF2) &&
        sqjit_native_emit_u8(buf, 0x41) &&
        sqjit_native_emit_u8(buf, 0x0F) &&
        sqjit_native_emit_u8(buf, 0x11) &&
        sqjit_native_emit_u8(buf, 0x84) &&
        sqjit_native_emit_u8(buf, 0x24) &&
        sqjit_native_emit_i32(buf, (SQInteger)offsetof(SQObject, _unVal));
}

static bool sqjit_native_emit_float_op_xmm0_local(SQJitNativeCodeBuffer *buf, SQOpcode op, SQInteger rhs)
{
    unsigned char opcode;
    switch(op) {
        case _OP_ADD: opcode = 0x58; break;
        case _OP_SUB: opcode = 0x5C; break;
        case _OP_MUL: opcode = 0x59; break;
        case _OP_DIV: opcode = 0x5E; break;
        default: return false;
    }
    return sqjit_native_emit_u8(buf, sizeof(SQFloat) == sizeof(SQInt32) ? 0xF3 : 0xF2) &&
        sqjit_native_emit_u8(buf, 0x0F) &&
        sqjit_native_emit_u8(buf, opcode) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, rhs);
}

static bool sqjit_native_emit_ucomi_xmm0_local_float(SQJitNativeCodeBuffer *buf, SQInteger rhs)
{
    if(sizeof(SQFloat) != sizeof(SQInt32) && !sqjit_native_emit_u8(buf, 0x66)) {
        return false;
    }
    return sqjit_native_emit_u8(buf, 0x0F) &&
        sqjit_native_emit_u8(buf, 0x2E) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, rhs);
}

static bool sqjit_native_emit_store_stack_float_from_local(SQJitNativeCodeBuffer *buf, SQInteger reg, SQInteger local)
{
    return sqjit_native_emit_mov_xmm0_local_float(buf, local) &&
        sqjit_native_emit_mov_rax_imm64(buf, 0) &&
        sqjit_native_emit_mov_stack_value_rax(buf, reg) &&
        sqjit_native_emit_mov_stack_float_value_xmm0(buf, reg) &&
        sqjit_native_emit_mov_stack_type_i32(buf, reg, OT_FLOAT);
}

static bool sqjit_native_emit_store_out_float_from_local(SQJitNativeCodeBuffer *buf, SQInteger local)
{
    return sqjit_native_emit_mov_xmm0_local_float(buf, local) &&
        sqjit_native_emit_mov_rax_imm64(buf, 0) &&
        sqjit_native_emit_mov_out_value_rax(buf) &&
        sqjit_native_emit_mov_out_float_value_xmm0(buf) &&
        sqjit_native_emit_mov_out_type_i32(buf, OT_FLOAT);
}

static bool sqjit_native_emit_mov_eax_i32(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    return sqjit_native_emit_u8(buf, 0xB8) &&
        sqjit_native_emit_i32(buf, value);
}

static bool sqjit_native_emit_add_rax_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    SQInteger reg = sqjit_native_pinned_slot_reg(src);
    if(reg >= 0) {
        return sqjit_native_emit_rex_w_rr(buf, 0, reg) &&
            sqjit_native_emit_u8(buf, 0x03) &&
            sqjit_native_emit_modrm_rr(buf, 0, reg);
    }
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x03) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

static bool sqjit_native_emit_add_rax_i32(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x05) &&
        sqjit_native_emit_i32(buf, value);
}

static bool sqjit_native_emit_sub_rax_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    SQInteger reg = sqjit_native_pinned_slot_reg(src);
    if(reg >= 0) {
        return sqjit_native_emit_rex_w_rr(buf, 0, reg) &&
            sqjit_native_emit_u8(buf, 0x2B) &&
            sqjit_native_emit_modrm_rr(buf, 0, reg);
    }
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x2B) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

static bool sqjit_native_emit_sub_rax_i32(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x2D) &&
        sqjit_native_emit_i32(buf, value);
}

static bool sqjit_native_emit_imul_rax_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    SQInteger reg = sqjit_native_pinned_slot_reg(src);
    if(reg >= 0) {
        return sqjit_native_emit_rex_w_rr(buf, 0, reg) &&
            sqjit_native_emit_u8(buf, 0x0F) &&
            sqjit_native_emit_u8(buf, 0xAF) &&
            sqjit_native_emit_modrm_rr(buf, 0, reg);
    }
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x0F) &&
        sqjit_native_emit_u8(buf, 0xAF) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

static bool sqjit_native_emit_imul_rax_i32(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x69) &&
        sqjit_native_emit_u8(buf, 0xC0) &&
        sqjit_native_emit_i32(buf, value);
}

static bool sqjit_native_emit_cmp_rax_mem(SQJitNativeCodeBuffer *buf, SQInteger src)
{
    SQInteger reg = sqjit_native_pinned_slot_reg(src);
    if(reg >= 0) {
        return sqjit_native_emit_rex_w_rr(buf, 0, reg) &&
            sqjit_native_emit_u8(buf, 0x3B) &&
            sqjit_native_emit_modrm_rr(buf, 0, reg);
    }
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x3B) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, src);
}

static bool sqjit_native_emit_cmp_rax_i32(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x3D) &&
        sqjit_native_emit_i32(buf, value);
}

static bool sqjit_native_emit_cmp_rcx_i32(SQJitNativeCodeBuffer *buf, SQInteger value)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x81) &&
        sqjit_native_emit_u8(buf, 0xF9) &&
        sqjit_native_emit_i32(buf, value);
}

static bool sqjit_native_emit_setcc_rax(SQJitNativeCodeBuffer *buf, unsigned char setcc)
{
    return sqjit_native_emit_u8(buf, 0x0F) &&
        sqjit_native_emit_u8(buf, setcc) &&
        sqjit_native_emit_u8(buf, 0xC0) && // setcc %al
        sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x0F) &&
        sqjit_native_emit_u8(buf, 0xB6) &&
        sqjit_native_emit_u8(buf, 0xC0); // movzbq %al, %rax
}

static bool sqjit_native_emit_add_mem_i32(SQJitNativeCodeBuffer *buf, SQInteger dst, SQInteger value)
{
    SQInteger reg = sqjit_native_pinned_slot_reg(dst);
    if(reg >= 0) {
        return sqjit_native_emit_rex_w_rr(buf, 0, reg) &&
            sqjit_native_emit_u8(buf, 0x81) &&
            sqjit_native_emit_modrm_rr(buf, 0, reg) &&
            sqjit_native_emit_i32(buf, value);
    }
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x81) &&
        sqjit_native_emit_u8(buf, 0x85) &&
        sqjit_native_emit_rbp_disp32(buf, dst) &&
        sqjit_native_emit_i32(buf, value);
}

static bool sqjit_native_emit_idiv_rcx(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x99) && // cqo
        sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0xF7) &&
        sqjit_native_emit_u8(buf, 0xF9); // idiv %rcx
}

static bool sqjit_native_emit_mov_rax_rdx(SQJitNativeCodeBuffer *buf)
{
    return sqjit_native_emit_u8(buf, 0x48) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xD0);
}

static bool sqjit_native_emit_mov_rax_arg3(SQJitNativeCodeBuffer *buf)
{
#if SQJIT_ABI_WIN64
    return sqjit_native_emit_u8(buf, 0x4C) &&
        sqjit_native_emit_u8(buf, 0x89) &&
        sqjit_native_emit_u8(buf, 0xC0);
#else
    return sqjit_native_emit_mov_rax_rdx(buf);
#endif
}

static SQObjectPtr *sqjit_outer_value_ptr(SQClosure *closure, SQInteger outer_index);

static SQInteger sqjit_helper_array_get_integer(SQObjectPtr *stack, SQInteger array_reg, SQInteger index, SQInteger *out)
{
    if(!stack || !out || array_reg < 0 || sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!_array(stack[array_reg])->Get(index, value) || sq_type(value) != OT_INTEGER) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    *out = _integer(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_helper_array_get_float(SQObjectPtr *stack, SQInteger array_reg, SQInteger index, SQFloat *out)
{
    if(!stack || !out || array_reg < 0 || sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!_array(stack[array_reg])->Get(index, value) || sq_type(value) != OT_FLOAT) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    *out = _float(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_helper_array_get_array_ptr(SQObjectPtr *stack, SQInteger array_reg, SQInteger index, SQInteger *out)
{
    if(!stack || !out || array_reg < 0 || sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!_array(stack[array_reg])->Get(index, value) || sq_type(value) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    *out = (SQInteger)(intptr_t)_array(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_helper_array_ptr_get_integer(SQInteger array_ptr, SQInteger index, SQInteger *out)
{
    if(!array_ptr || !out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    SQArray *array = (SQArray *)(intptr_t)array_ptr;
    if(!array->Get(index, value) || sq_type(value) != OT_INTEGER) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    *out = _integer(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_helper_array_ptr_get_array_ptr(SQInteger array_ptr, SQInteger index, SQInteger *out)
{
    if(!array_ptr || !out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    SQArray *array = (SQArray *)(intptr_t)array_ptr;
    if(!array->Get(index, value) || sq_type(value) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    *out = (SQInteger)(intptr_t)_array(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_helper_table_get_integer(SQObjectPtr *stack, SQInteger table_reg, const SQObjectPtr *key, SQInteger *out)
{
    if(!stack || !out || !key || table_reg < 0 || sq_type(stack[table_reg]) != OT_TABLE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!_table(stack[table_reg])->Get(*key, value) || sq_type(value) != OT_INTEGER) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    *out = _integer(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_helper_table_get_float(SQObjectPtr *stack, SQInteger table_reg, const SQObjectPtr *key, SQFloat *out)
{
    if(!stack || !out || !key || table_reg < 0 || sq_type(stack[table_reg]) != OT_TABLE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!_table(stack[table_reg])->Get(*key, value) || sq_type(value) != OT_FLOAT) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    *out = _float(value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQJitWriteLog *sqjit_write_log_from_slot(SQInteger *slot)
{
    return slot ? (SQJitWriteLog *)(intptr_t)(*slot) : NULL;
}

static SQJitWriteLog *sqjit_write_log_ensure(SQInteger *slot)
{
    SQJitWriteLog *log = sqjit_write_log_from_slot(slot);
    if(log) {
        return log;
    }

    void *mem = sq_vm_malloc(sizeof(SQJitWriteLog));
    if(!mem) {
        return NULL;
    }
    log = new (mem) SQJitWriteLog;
    *slot = (SQInteger)(intptr_t)log;
    return log;
}

static void sqjit_write_log_free(SQInteger *slot)
{
    SQJitWriteLog *log = sqjit_write_log_from_slot(slot);
    if(!log) {
        return;
    }

    log->~SQJitWriteLog();
    sq_vm_free(log, sizeof(SQJitWriteLog));
    *slot = 0;
}

static SQInteger sqjit_write_log_record_array(SQInteger *slot, const SQObjectPtr &target,
    SQInteger index, const SQObjectPtr &old_value)
{
    SQJitWriteLog *log = sqjit_write_log_ensure(slot);
    if(!log) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQJitWriteLogEntry entry;
    entry.kind = SQ_JIT_WRITE_ARRAY_INDEX;
    entry.target = target;
    entry.key.Null();
    entry.old_value = old_value;
    entry.index = index;
    log->entries.push_back(entry);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_write_log_record_table(SQInteger *slot, const SQObjectPtr &target,
    const SQObjectPtr &key, const SQObjectPtr &old_value)
{
    SQJitWriteLog *log = sqjit_write_log_ensure(slot);
    if(!log) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQJitWriteLogEntry entry;
    entry.kind = SQ_JIT_WRITE_TABLE_KEY;
    entry.target = target;
    entry.key = key;
    entry.old_value = old_value;
    entry.index = 0;
    log->entries.push_back(entry);
    return SQ_JIT_NATIVE_RETURNED;
}

static void sqjit_helper_write_log_commit(SQInteger *slot)
{
    sqjit_write_log_free(slot);
}

static void sqjit_helper_write_log_rollback(SQInteger *slot)
{
    SQJitWriteLog *log = sqjit_write_log_from_slot(slot);
    if(!log) {
        return;
    }

    SQUnsignedInteger count = log->entries.size();
    while(count > 0) {
        SQJitWriteLogEntry &entry = log->entries[--count];
        if(entry.kind == SQ_JIT_WRITE_ARRAY_INDEX && sq_type(entry.target) == OT_ARRAY) {
            _array(entry.target)->Set(entry.index, entry.old_value);
        }
        else if(entry.kind == SQ_JIT_WRITE_TABLE_KEY && sq_type(entry.target) == OT_TABLE) {
            _table(entry.target)->Set(entry.key, entry.old_value);
        }
    }

    sqjit_write_log_free(slot);
}

static SQInteger sqjit_helper_array_set_integer_logged(SQInteger *log_slot, SQObjectPtr *stack,
    SQInteger array_reg, SQInteger index, SQInteger value)
{
    if(!log_slot || !stack || array_reg < 0 || sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr old_value;
    if(!_array(stack[array_reg])->Get(index, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_write_log_record_array(log_slot, stack[array_reg], index, old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value);
    if(!_array(stack[array_reg])->Set(index, new_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_helper_array_set_float_logged(SQInteger *log_slot, SQObjectPtr *stack,
    SQInteger array_reg, SQInteger index, const SQFloat *value)
{
    if(!log_slot || !stack || !value || array_reg < 0 || sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr old_value;
    if(!_array(stack[array_reg])->Get(index, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_write_log_record_array(log_slot, stack[array_reg], index, old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(*value);
    if(!_array(stack[array_reg])->Set(index, new_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_helper_array_ptr_set_integer_logged(SQInteger *log_slot, SQInteger array_ptr,
    SQInteger index, SQInteger value)
{
    if(!log_slot || !array_ptr) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQArray *array = (SQArray *)(intptr_t)array_ptr;
    SQObjectPtr target(array);
    SQObjectPtr old_value;
    if(!array->Get(index, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_write_log_record_array(log_slot, target, index, old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value);
    if(!array->Set(index, new_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_helper_array_ptr_set_float_logged(SQInteger *log_slot, SQInteger array_ptr,
    SQInteger index, const SQFloat *value)
{
    if(!log_slot || !array_ptr || !value) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQArray *array = (SQArray *)(intptr_t)array_ptr;
    SQObjectPtr target(array);
    SQObjectPtr old_value;
    if(!array->Get(index, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_write_log_record_array(log_slot, target, index, old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(*value);
    if(!array->Set(index, new_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_helper_table_set_integer_logged(SQInteger *log_slot, SQObjectPtr *stack,
    SQInteger table_reg, const SQObjectPtr *key, SQInteger value)
{
    if(!log_slot || !stack || !key || table_reg < 0 || sq_type(stack[table_reg]) != OT_TABLE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr old_value;
    if(!_table(stack[table_reg])->Get(*key, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_write_log_record_table(log_slot, stack[table_reg], *key, old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(value);
    if(!_table(stack[table_reg])->Set(*key, new_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_helper_table_set_float_logged(SQInteger *log_slot, SQObjectPtr *stack,
    SQInteger table_reg, const SQObjectPtr *key, const SQFloat *value)
{
    if(!log_slot || !stack || !key || !value || table_reg < 0 || sq_type(stack[table_reg]) != OT_TABLE) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr old_value;
    if(!_table(stack[table_reg])->Get(*key, old_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    if(sqjit_write_log_record_table(log_slot, stack[table_reg], *key, old_value) != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr new_value(*value);
    if(!_table(stack[table_reg])->Set(*key, new_value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_helper_outer_get_integer(SQClosure *closure, SQInteger outer_index, SQInteger *out)
{
    if(!out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr *value = sqjit_outer_value_ptr(closure, outer_index);
    if(!value || sq_type(*value) != OT_INTEGER) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    *out = _integer(*value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_helper_outer_get_float(SQClosure *closure, SQInteger outer_index, SQFloat *out)
{
    if(!out) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr *value = sqjit_outer_value_ptr(closure, outer_index);
    if(!value || sq_type(*value) != OT_FLOAT) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    *out = _float(*value);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_helper_new_array(SQObjectPtr *stack, SQClosure *closure, SQInteger target, SQInteger reserve)
{
    if(!stack || !closure || target < 0 || reserve < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQArray *array = SQArray::Create(_opt_ss(closure), 0);
    if(!array) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }
    array->Reserve(reserve);
    stack[target] = array;
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_helper_array_append_integer_local(SQObjectPtr *stack, SQInteger array_reg, SQInteger value)
{
    if(!stack || array_reg < 0 || sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr obj(value);
    _array(stack[array_reg])->Append(obj);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_helper_array_append_float_local(SQObjectPtr *stack, SQInteger array_reg, const SQFloat *value)
{
    if(!stack || !value || array_reg < 0 || sq_type(stack[array_reg]) != OT_ARRAY) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr obj(*value);
    _array(stack[array_reg])->Append(obj);
    return SQ_JIT_NATIVE_RETURNED;
}

static SQInteger sqjit_helper_return_stack_object(SQObjectPtr *stack, SQInteger reg, SQObjectPtr *out)
{
    if(!stack || !out || reg < 0) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    *out = stack[reg];
    return SQ_JIT_NATIVE_RETURNED;
}

static bool sqjit_native_emit_jmp_placeholder(SQJitNativeCodeBuffer *buf, SQInteger *patch_offset)
{
    if(!sqjit_native_emit_u8(buf, 0xE9)) {
        return false;
    }
    *patch_offset = buf->size;
    return sqjit_native_emit_i32_unchecked(buf, 0);
}

static bool sqjit_native_emit_jcc_placeholder(SQJitNativeCodeBuffer *buf, SQJitNativeJcc jcc, SQInteger *patch_offset)
{
    if(!sqjit_native_emit_u8(buf, 0x0F) || !sqjit_native_emit_u8(buf, (unsigned char)jcc)) {
        return false;
    }
    *patch_offset = buf->size;
    return sqjit_native_emit_i32_unchecked(buf, 0);
}

static bool sqjit_native_record_reloc(SQJitNativeReloc *relocs, SQInteger *nrelocs, SQInteger maxrelocs,
    SQInteger patch_offset, SQInteger target_ip)
{
    if(*nrelocs >= maxrelocs) {
        return false;
    }
    relocs[*nrelocs].patch_offset = patch_offset;
    relocs[*nrelocs].target_ip = target_ip;
    (*nrelocs)++;
    return true;
}

static SQInteger sqjit_signed_arg1(const SQInstruction &inst)
{
    return (SQInteger)((SQInt32)inst._arg1);
}

static SQInteger sqjit_signed_arg3(const SQInstruction &inst)
{
    return (SQInteger)((signed char)inst._arg3);
}

static bool sqjit_native_cmp_false_jcc(CmpOP op, SQJitNativeJcc *jcc)
{
    switch(op) {
        case CMP_G:
            *jcc = SQ_JIT_JCC_LE;
            return true;
        case CMP_GE:
            *jcc = SQ_JIT_JCC_L;
            return true;
        case CMP_L:
            *jcc = SQ_JIT_JCC_GE;
            return true;
        case CMP_LE:
            *jcc = SQ_JIT_JCC_G;
            return true;
        default:
            return false;
    }
}

static bool sqjit_native_float_cmp_false_jcc(CmpOP op, SQJitNativeJcc *jcc)
{
    switch(op) {
        case CMP_G:
            *jcc = SQ_JIT_JCC_BE;
            return true;
        case CMP_GE:
            *jcc = SQ_JIT_JCC_B;
            return true;
        case CMP_L:
            *jcc = SQ_JIT_JCC_AE;
            return true;
        case CMP_LE:
            *jcc = SQ_JIT_JCC_A;
            return true;
        default:
            return false;
    }
}

static void *sqjit_native_alloc(const unsigned char *code, SQInteger size, SQInteger *mapped_size)
{
#if SQJIT_ABI_WIN64
    SYSTEM_INFO info;
    GetSystemInfo(&info);
    SQInteger page_size = info.dwPageSize > 0 ? (SQInteger)info.dwPageSize : 4096;
    SQInteger alloc_size = ((size + page_size - 1) / page_size) * page_size;
    void *mem = VirtualAlloc(NULL, (SIZE_T)alloc_size, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
    if(!mem) {
        return NULL;
    }

    memcpy(mem, code, (size_t)size);
    DWORD old_protect = 0;
    if(!VirtualProtect(mem, (SIZE_T)alloc_size, PAGE_EXECUTE_READ, &old_protect)) {
        VirtualFree(mem, 0, MEM_RELEASE);
        return NULL;
    }
    FlushInstructionCache(GetCurrentProcess(), mem, (SIZE_T)size);

    *mapped_size = alloc_size;
    return mem;
#else
    long page_size = sysconf(_SC_PAGESIZE);
    if(page_size <= 0) {
        page_size = 4096;
    }

    SQInteger alloc_size = ((size + page_size - 1) / page_size) * page_size;
    void *mem = mmap(NULL, alloc_size, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    if(mem == MAP_FAILED) {
        return NULL;
    }

    memcpy(mem, code, size);
    __builtin___clear_cache((char *)mem, (char *)mem + size);
    if(mprotect(mem, alloc_size, PROT_READ | PROT_EXEC) != 0) {
        munmap(mem, alloc_size);
        return NULL;
    }

    *mapped_size = alloc_size;
    return mem;
#endif
}

static bool sqjit_native_install(SQJitNative *native, SQJitNativeCodeBuffer *buf)
{
    SQInteger mapped_size = 0;
    void *entry = sqjit_native_alloc(buf->bytes, buf->size, &mapped_size);
    if(!entry) {
        return false;
    }
    native->_native_entry = entry;
    native->_native_size = mapped_size;
    return true;
}

static bool sqjit_native_install_raw(void **entry_out, SQInteger *mapped_size_out, SQJitNativeCodeBuffer *buf)
{
    SQInteger mapped_size = 0;
    void *entry = sqjit_native_alloc(buf->bytes, buf->size, &mapped_size);
    if(!entry) {
        return false;
    }
    *entry_out = entry;
    *mapped_size_out = mapped_size;
    return true;
}

void sqjit_backend_native_free(void *entry, SQInteger size)
{
    if(entry && size > 0) {
#if SQJIT_ABI_WIN64
        VirtualFree(entry, 0, MEM_RELEASE);
#else
        munmap(entry, size);
#endif
    }
}

static SQInteger sqjit_loadint_value(const SQInstruction &inst)
{
#ifndef _SQ64
    return (SQInteger)inst._arg1;
#else
    return (SQInteger)((SQInt32)inst._arg1);
#endif
}

static bool sqjit_loadfloat_value(const SQInstruction &inst, SQFloat *value)
{
    if(!value || sizeof(SQFloat) != sizeof(SQInt32)) {
        return false;
    }
    SQInt32 bits = inst._arg1;
    memcpy(value, &bits, sizeof(bits));
    return true;
}

static bool sqjit_previous_loads_int_const(SQFunctionProto *proto, SQInteger ip, SQInteger reg, SQInteger *value)
{
    // Keep immediate lowering local; whole-function constants are unsafe across backedges.
    if(ip <= 0) {
        return false;
    }
    const SQInstruction &prev = proto->_instructions[ip - 1];
    if(prev._arg0 != reg) {
        return false;
    }
    if(prev.op == _OP_LOADINT) {
        *value = sqjit_loadint_value(prev);
        return true;
    }
    if(prev.op == _OP_LOAD && prev._arg1 >= 0 && prev._arg1 < proto->_nliterals &&
        sq_type(proto->_literals[prev._arg1]) == OT_INTEGER) {
        *value = _integer(proto->_literals[prev._arg1]);
        return true;
    }
    return false;
}

static bool sqjit_previous_loads_positive_int_const(SQFunctionProto *proto, SQInteger ip, SQInteger reg)
{
    SQInteger value = 0;
    return sqjit_previous_loads_int_const(proto, ip, reg, &value) && value > 0;
}

static SQObjectType sqjit_observed_array_value_type(SQObjectPtr *entry_stack, SQInteger array_reg, SQInteger index)
{
    if(!entry_stack || array_reg < 0 || index < 0 || sq_type(entry_stack[array_reg]) != OT_ARRAY) {
        return OT_NULL;
    }

    SQObjectPtr value;
    if(!_array(entry_stack[array_reg])->Get(index, value)) {
        return OT_NULL;
    }
    return sq_type(value);
}

static SQObjectType sqjit_observed_table_value_type(SQObjectPtr *entry_stack, SQInteger table_reg, const SQObjectPtr *key)
{
    if(!entry_stack || !key || table_reg < 0 || sq_type(entry_stack[table_reg]) != OT_TABLE) {
        return OT_NULL;
    }

    SQObjectPtr value;
    if(!_table(entry_stack[table_reg])->Get(*key, value)) {
        return OT_NULL;
    }
    return sq_type(value);
}

static SQObjectPtr *sqjit_outer_value_ptr(SQClosure *closure, SQInteger outer_index)
{
    if(!closure || !closure->_function || outer_index < 0 ||
        outer_index >= closure->_function->_noutervalues ||
        sq_type(closure->_outervalues[outer_index]) != OT_OUTER) {
        return NULL;
    }

    SQOuter *outer = _outer(closure->_outervalues[outer_index]);
    return outer ? outer->_valptr : NULL;
}

static SQObjectType sqjit_observed_outer_value_type(SQClosure *closure, SQInteger outer_index)
{
    SQObjectPtr *value = sqjit_outer_value_ptr(closure, outer_index);
    return value ? sq_type(*value) : OT_NULL;
}

static bool sqjit_next_consumes_load_as_immediate(SQFunctionProto *proto, SQInteger ip, SQInteger reg)
{
    if(!proto || ip + 1 >= proto->_ninstructions) {
        return false;
    }

    const SQInstruction &next = proto->_instructions[ip + 1];
    switch(next.op) {
        case _OP_ADD:
        case _OP_MUL:
            return next._arg1 == reg || next._arg2 == reg;
        case _OP_SUB:
        case _OP_MOD:
            return next._arg1 == reg;
        default:
            return false;
    }
}

bool sqjit_backend_compile_proto(SQFunctionProto *proto, SQObjectPtr *entry_stack,
    SQClosure *closure, SQJitNative *native)
{
    if(!proto || !entry_stack || proto->_nparameters < 1 || proto->_varparams || proto->_ndefaultparams != 0 ||
        proto->_stacksize <= 0 || proto->_stacksize > MAX_FUNC_STACKSIZE ||
        proto->_ninstructions <= 0 || proto->_ninstructions > 512) {
        return false;
    }

    SQInteger ip_to_offset[513];
    SQJitNativeReloc relocs[512];
    SQInteger nrelocs = 0;
    SQJitNativeReloc guard_fail_relocs[MAX_FUNC_STACKSIZE + 512];
    SQInteger nguard_fail_relocs = 0;
    SQJitSlotKind slot_kind[MAX_FUNC_STACKSIZE];
    SQInteger stack_object_reg[MAX_FUNC_STACKSIZE];
    SQInteger literal_object_index[MAX_FUNC_STACKSIZE];
    bool int_materialized[MAX_FUNC_STACKSIZE];
    bool float_materialized[MAX_FUNC_STACKSIZE];
    bool known_const[MAX_FUNC_STACKSIZE];
    SQInteger const_value[MAX_FUNC_STACKSIZE];
    SQFloat float_const_value[MAX_FUNC_STACKSIZE];
    for(SQInteger n = 0; n < 513; n++) {
        ip_to_offset[n] = -1;
    }
    for(SQInteger n = 0; n < MAX_FUNC_STACKSIZE; n++) {
        slot_kind[n] = SQ_JIT_SLOT_UNKNOWN;
        stack_object_reg[n] = -1;
        literal_object_index[n] = -1;
        int_materialized[n] = false;
        float_materialized[n] = false;
        known_const[n] = false;
        const_value[n] = 0;
        float_const_value[n] = 0;
    }

    SQJitNativeCodeBuffer buf;
    buf.size = 0;

    bool uses_write_log = false;
    for(SQInteger ip = 0; ip < proto->_ninstructions; ip++) {
        if(proto->_instructions[ip].op == _OP_SET) {
            uses_write_log = true;
            break;
        }
    }

    SQInteger last_reserved_slot = uses_write_log ? SQ_JIT_NATIVE_WRITE_LOG_SLOT : SQ_JIT_NATIVE_CLOSURE_SLOT;
    SQInteger frame_size = (last_reserved_slot + 1) * (SQInteger)sizeof(SQInteger);
    frame_size = ((frame_size + 15) & ~(SQInteger)15) + 8;

    if(!sqjit_native_emit_push_rbp(&buf) ||
        !sqjit_native_emit_push_abi_preserved_arg_regs(&buf) ||
        !sqjit_native_emit_push_r12(&buf) ||
        !sqjit_native_emit_push_r13(&buf) ||
        !sqjit_native_emit_push_rbx(&buf) ||
        !sqjit_native_emit_push_r14(&buf) ||
        !sqjit_native_emit_push_r15(&buf) ||
        !sqjit_native_emit_mov_rbp_rsp(&buf) ||
        !sqjit_native_emit_sub_rsp_i32(&buf, frame_size) ||
        !sqjit_native_emit_mov_r12_rsi(&buf) ||
        !sqjit_native_emit_mov_r13_rdi(&buf) ||
        !sqjit_native_emit_mov_rax_arg3(&buf) ||
        !sqjit_native_emit_mov_local_mem_rax(&buf, SQ_JIT_NATIVE_CLOSURE_SLOT)) {
        return false;
    }
    if(uses_write_log && !sqjit_native_emit_mov_mem_imm32(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT, 0)) {
        return false;
    }

    for(SQInteger n = 1; n < proto->_nparameters; n++) {
        slot_kind[n] = SQ_JIT_SLOT_STACK_OBJECT;
        stack_object_reg[n] = n;
    }

    auto emit_guard_fail_jump = [&]() -> bool {
        SQInteger patch_offset = 0;
        return sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_NE, &patch_offset) &&
            sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1);
    };

    auto emit_write_log_release = [&](bool rollback) -> bool {
        if(!uses_write_log) {
            return true;
        }
        return sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) &&
            sqjit_native_emit_mov_rax_ptr(&buf, rollback ?
                (const void *)sqjit_helper_write_log_rollback :
                (const void *)sqjit_helper_write_log_commit) &&
            sqjit_native_emit_call_rax(&buf);
    };

    auto load_literal_slot = [&](SQInteger dst, SQInteger literal_index, bool materialize_int) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals) {
            return false;
        }
        if(sq_type(proto->_literals[literal_index]) == OT_INTEGER) {
            if(!sqjit_native_is_int32(_integer(proto->_literals[literal_index]))) {
                return false;
            }
            SQInteger value = _integer(proto->_literals[literal_index]);
            if(materialize_int && !sqjit_native_emit_mov_mem_imm32(&buf, dst, value)) {
                return false;
            }
            slot_kind[dst] = SQ_JIT_SLOT_INT;
            stack_object_reg[dst] = -1;
            literal_object_index[dst] = -1;
            int_materialized[dst] = materialize_int;
            float_materialized[dst] = false;
            known_const[dst] = true;
            const_value[dst] = value;
        }
        else if(sq_type(proto->_literals[literal_index]) == OT_FLOAT) {
            SQFloat value = _float(proto->_literals[literal_index]);
            if(!sqjit_native_emit_mov_local_float_const(&buf, dst, value)) {
                return false;
            }
            slot_kind[dst] = SQ_JIT_SLOT_FLOAT;
            stack_object_reg[dst] = -1;
            literal_object_index[dst] = -1;
            int_materialized[dst] = false;
            float_materialized[dst] = true;
            known_const[dst] = true;
            float_const_value[dst] = value;
        }
        else {
            slot_kind[dst] = SQ_JIT_SLOT_LITERAL_OBJECT;
            stack_object_reg[dst] = -1;
            literal_object_index[dst] = literal_index;
            int_materialized[dst] = false;
            float_materialized[dst] = false;
            known_const[dst] = false;
        }
        return true;
    };

    auto ensure_int_slot = [&](SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slot_kind[slot] == SQ_JIT_SLOT_INT) {
            if(!int_materialized[slot]) {
                if(!known_const[slot] || !sqjit_native_emit_mov_mem_imm32(&buf, slot, const_value[slot])) {
                    return false;
                }
                int_materialized[slot] = true;
            }
            return true;
        }
        if(slot_kind[slot] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[slot] < 0) {
            return false;
        }
        if(!sqjit_native_emit_cmp_stack_type_i32(&buf, stack_object_reg[slot], OT_INTEGER) ||
            !emit_guard_fail_jump() ||
            !sqjit_native_emit_mov_rax_stack_value(&buf, stack_object_reg[slot]) ||
            !sqjit_native_emit_mov_mem_rax(&buf, slot)) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_SLOT_INT;
        stack_object_reg[slot] = -1;
        literal_object_index[slot] = -1;
        int_materialized[slot] = true;
        float_materialized[slot] = false;
        known_const[slot] = false;
        return true;
    };

    auto ensure_float_slot = [&](SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slot_kind[slot] == SQ_JIT_SLOT_FLOAT) {
            if(!float_materialized[slot]) {
                if(!known_const[slot] ||
                    !sqjit_native_emit_mov_local_float_const(&buf, slot, float_const_value[slot])) {
                    return false;
                }
                float_materialized[slot] = true;
            }
            return true;
        }
        if(slot_kind[slot] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[slot] < 0) {
            return false;
        }
        if(!sqjit_native_emit_cmp_stack_type_i32(&buf, stack_object_reg[slot], OT_FLOAT) ||
            !emit_guard_fail_jump() ||
            !sqjit_native_emit_mov_xmm0_stack_float_value(&buf, stack_object_reg[slot]) ||
            !sqjit_native_emit_mov_local_float_xmm0(&buf, slot)) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_SLOT_FLOAT;
        stack_object_reg[slot] = -1;
        literal_object_index[slot] = -1;
        int_materialized[slot] = false;
        float_materialized[slot] = true;
        known_const[slot] = false;
        return true;
    };

    auto emit_array_get_integer = [&](SQInteger dst, SQInteger base, SQInteger key) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || slot_kind[base] != SQ_JIT_SLOT_STACK_OBJECT ||
            stack_object_reg[base] < 0 || !ensure_int_slot(key)) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_mov_rdi_r13(&buf) ||
            !sqjit_native_emit_mov_rsi_i64(&buf, stack_object_reg[base]) ||
            !sqjit_native_emit_mov_rdx_mem(&buf, key) ||
            !sqjit_native_emit_lea_rcx_mem(&buf, dst) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_get_integer) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
            !sqjit_native_sync_pinned_slot_from_local(&buf, dst)) {
            return false;
        }
        slot_kind[dst] = SQ_JIT_SLOT_INT;
        stack_object_reg[dst] = -1;
        literal_object_index[dst] = -1;
        int_materialized[dst] = true;
        known_const[dst] = false;
        return true;
    };

    auto emit_array_get_integer_const = [&](SQInteger dst, SQInteger base, SQInteger index) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            slot_kind[base] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[base] < 0) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_mov_rdi_r13(&buf) ||
            !sqjit_native_emit_mov_rsi_i64(&buf, stack_object_reg[base]) ||
            !sqjit_native_emit_mov_rdx_i64(&buf, index) ||
            !sqjit_native_emit_lea_rcx_mem(&buf, dst) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_get_integer) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
            !sqjit_native_sync_pinned_slot_from_local(&buf, dst)) {
            return false;
        }
        slot_kind[dst] = SQ_JIT_SLOT_INT;
        stack_object_reg[dst] = -1;
        literal_object_index[dst] = -1;
        int_materialized[dst] = true;
        known_const[dst] = false;
        return true;
    };

    auto emit_array_get_float_const = [&](SQInteger dst, SQInteger base, SQInteger index) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            slot_kind[base] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[base] < 0) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_mov_rdi_r13(&buf) ||
            !sqjit_native_emit_mov_rsi_i64(&buf, stack_object_reg[base]) ||
            !sqjit_native_emit_mov_rdx_i64(&buf, index) ||
            !sqjit_native_emit_lea_rcx_mem(&buf, dst) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_get_float) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1)) {
            return false;
        }
        slot_kind[dst] = SQ_JIT_SLOT_FLOAT;
        stack_object_reg[dst] = -1;
        literal_object_index[dst] = -1;
        int_materialized[dst] = false;
        float_materialized[dst] = true;
        known_const[dst] = false;
        return true;
    };

    auto emit_table_get_integer_literal = [&](SQInteger dst, SQInteger base, SQInteger literal_index) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals ||
            slot_kind[base] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[base] < 0) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_mov_rdi_r13(&buf) ||
            !sqjit_native_emit_mov_rsi_i64(&buf, stack_object_reg[base]) ||
            !sqjit_native_emit_mov_rdx_i64(&buf, (SQInteger)(intptr_t)&proto->_literals[literal_index]) ||
            !sqjit_native_emit_lea_rcx_mem(&buf, dst) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_table_get_integer) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
            !sqjit_native_sync_pinned_slot_from_local(&buf, dst)) {
            return false;
        }
        slot_kind[dst] = SQ_JIT_SLOT_INT;
        stack_object_reg[dst] = -1;
        literal_object_index[dst] = -1;
        int_materialized[dst] = true;
        known_const[dst] = false;
        return true;
    };

    auto emit_table_get_float_literal = [&](SQInteger dst, SQInteger base, SQInteger literal_index) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals ||
            slot_kind[base] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[base] < 0) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_mov_rdi_r13(&buf) ||
            !sqjit_native_emit_mov_rsi_i64(&buf, stack_object_reg[base]) ||
            !sqjit_native_emit_mov_rdx_i64(&buf, (SQInteger)(intptr_t)&proto->_literals[literal_index]) ||
            !sqjit_native_emit_lea_rcx_mem(&buf, dst) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_table_get_float) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1)) {
            return false;
        }
        slot_kind[dst] = SQ_JIT_SLOT_FLOAT;
        stack_object_reg[dst] = -1;
        literal_object_index[dst] = -1;
        int_materialized[dst] = false;
        float_materialized[dst] = true;
        known_const[dst] = false;
        return true;
    };

    auto emit_outer_get_integer = [&](SQInteger dst, SQInteger outer_index) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || outer_index < 0 ||
            outer_index >= proto->_noutervalues) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_mov_rdi_mem(&buf, SQ_JIT_NATIVE_CLOSURE_SLOT) ||
            !sqjit_native_emit_mov_rsi_i64(&buf, outer_index) ||
            !sqjit_native_emit_lea_rdx_mem(&buf, dst) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_outer_get_integer) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
            !sqjit_native_sync_pinned_slot_from_local(&buf, dst)) {
            return false;
        }
        slot_kind[dst] = SQ_JIT_SLOT_INT;
        stack_object_reg[dst] = -1;
        literal_object_index[dst] = -1;
        int_materialized[dst] = true;
        float_materialized[dst] = false;
        known_const[dst] = false;
        return true;
    };

    auto emit_outer_get_float = [&](SQInteger dst, SQInteger outer_index) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || outer_index < 0 ||
            outer_index >= proto->_noutervalues) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_mov_rdi_mem(&buf, SQ_JIT_NATIVE_CLOSURE_SLOT) ||
            !sqjit_native_emit_mov_rsi_i64(&buf, outer_index) ||
            !sqjit_native_emit_lea_rdx_mem(&buf, dst) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_outer_get_float) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1)) {
            return false;
        }
        slot_kind[dst] = SQ_JIT_SLOT_FLOAT;
        stack_object_reg[dst] = -1;
        literal_object_index[dst] = -1;
        int_materialized[dst] = false;
        float_materialized[dst] = true;
        known_const[dst] = false;
        return true;
    };

    auto emit_new_array = [&](SQInteger dst, SQInteger reserve) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || reserve < 0) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_mov_rdi_r13(&buf) ||
            !sqjit_native_emit_mov_rsi_local_mem(&buf, SQ_JIT_NATIVE_CLOSURE_SLOT) ||
            !sqjit_native_emit_mov_rdx_i64(&buf, dst) ||
            !sqjit_native_emit_mov_rcx_imm64(&buf, reserve) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_new_array) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1)) {
            return false;
        }
        slot_kind[dst] = SQ_JIT_SLOT_STACK_OBJECT;
        stack_object_reg[dst] = dst;
        literal_object_index[dst] = -1;
        int_materialized[dst] = false;
        float_materialized[dst] = false;
        known_const[dst] = false;
        return true;
    };

    auto emit_append_array_stack = [&](SQInteger array_reg, SQInteger value_reg) -> bool {
        if(array_reg < 0 || array_reg >= MAX_FUNC_STACKSIZE ||
            value_reg < 0 || value_reg >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(slot_kind[value_reg] == SQ_JIT_SLOT_FLOAT) {
            if(!ensure_float_slot(value_reg) ||
                !sqjit_native_emit_mov_rdi_r13(&buf) ||
                !sqjit_native_emit_mov_rsi_i64(&buf, array_reg) ||
                !sqjit_native_emit_lea_rdx_mem(&buf, value_reg) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_append_float_local)) {
                return false;
            }
        }
        else {
            if(!ensure_int_slot(value_reg) ||
                !sqjit_native_emit_mov_rdi_r13(&buf) ||
                !sqjit_native_emit_mov_rsi_i64(&buf, array_reg) ||
                !sqjit_native_emit_mov_rdx_mem(&buf, value_reg) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_append_integer_local)) {
                return false;
            }
        }
        return sqjit_native_emit_call_rax(&buf) &&
            sqjit_native_emit_test_rax_rax(&buf) &&
            sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) &&
            sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1);
    };

    auto emit_append_array_integer = [&](SQInteger array_reg, SQInteger value) -> bool {
        if(array_reg < 0 || array_reg >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        SQInteger patch_offset = 0;
        return sqjit_native_emit_mov_rdi_r13(&buf) &&
            sqjit_native_emit_mov_rsi_i64(&buf, array_reg) &&
            sqjit_native_emit_mov_rdx_i64(&buf, value) &&
            sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_append_integer_local) &&
            sqjit_native_emit_call_rax(&buf) &&
            sqjit_native_emit_test_rax_rax(&buf) &&
            sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) &&
            sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1);
    };

    auto emit_return_stack_object = [&](SQInteger reg) -> bool {
        if(reg < 0 || reg >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        SQInteger patch_offset = 0;
        return sqjit_native_emit_mov_rdi_r13(&buf) &&
            sqjit_native_emit_mov_rsi_i64(&buf, reg) &&
            sqjit_native_emit_mov_rdx_r12(&buf) &&
            sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_return_stack_object) &&
            sqjit_native_emit_call_rax(&buf) &&
            sqjit_native_emit_test_rax_rax(&buf) &&
            sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) &&
            sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1);
    };

    auto mark_int_slot = [&](SQInteger slot) -> bool {
        if(slot == 0xFF) {
            return true;
        }
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_SLOT_INT;
        stack_object_reg[slot] = -1;
        literal_object_index[slot] = -1;
        int_materialized[slot] = true;
        float_materialized[slot] = false;
        known_const[slot] = false;
        return true;
    };

    auto mark_float_slot = [&](SQInteger slot) -> bool {
        if(slot == 0xFF) {
            return true;
        }
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_SLOT_FLOAT;
        stack_object_reg[slot] = -1;
        literal_object_index[slot] = -1;
        int_materialized[slot] = false;
        float_materialized[slot] = true;
        known_const[slot] = false;
        return true;
    };

    auto copy_int_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == 0xFF) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || !ensure_int_slot(src) ||
            !sqjit_native_emit_mov_rax_mem(&buf, src) ||
            !sqjit_native_emit_mov_mem_rax(&buf, dst) ||
            !mark_int_slot(dst)) {
            return false;
        }
        known_const[dst] = known_const[src];
        const_value[dst] = const_value[src];
        return true;
    };

    auto copy_float_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == 0xFF) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || !ensure_float_slot(src) ||
            !sqjit_native_emit_mov_xmm0_local_float(&buf, src) ||
            !sqjit_native_emit_mov_local_float_xmm0(&buf, dst) ||
            !mark_float_slot(dst)) {
            return false;
        }
        known_const[dst] = known_const[src];
        float_const_value[dst] = float_const_value[src];
        return true;
    };

    auto emit_array_set_integer = [&](SQInteger target, SQInteger base, SQInteger key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || value < 0 || value >= MAX_FUNC_STACKSIZE ||
            slot_kind[base] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[base] < 0 ||
            !ensure_int_slot(key) || !ensure_int_slot(value)) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) ||
            !sqjit_native_emit_mov_rsi_r13(&buf) ||
            !sqjit_native_emit_mov_rdx_i64(&buf, stack_object_reg[base]) ||
            !sqjit_native_emit_mov_rcx_mem(&buf, key) ||
            !sqjit_native_emit_mov_r8_mem(&buf, value) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_set_integer_logged) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
            !copy_int_slot(target, value)) {
            return false;
        }
        return true;
    };

    auto emit_array_set_integer_const = [&](SQInteger target, SQInteger base, SQInteger index, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            value < 0 || value >= MAX_FUNC_STACKSIZE ||
            slot_kind[base] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[base] < 0 ||
            !ensure_int_slot(value)) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) ||
            !sqjit_native_emit_mov_rsi_r13(&buf) ||
            !sqjit_native_emit_mov_rdx_i64(&buf, stack_object_reg[base]) ||
            !sqjit_native_emit_mov_rcx_imm64(&buf, index) ||
            !sqjit_native_emit_mov_r8_mem(&buf, value) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_set_integer_logged) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
            !copy_int_slot(target, value)) {
            return false;
        }
        return true;
    };

    auto emit_array_set_float = [&](SQInteger target, SQInteger base, SQInteger key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || value < 0 || value >= MAX_FUNC_STACKSIZE ||
            slot_kind[base] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[base] < 0 ||
            !ensure_int_slot(key) || !ensure_float_slot(value)) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) ||
            !sqjit_native_emit_mov_rsi_r13(&buf) ||
            !sqjit_native_emit_mov_rdx_i64(&buf, stack_object_reg[base]) ||
            !sqjit_native_emit_mov_rcx_mem(&buf, key) ||
            !sqjit_native_emit_lea_r8_mem(&buf, value) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_set_float_logged) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
            !copy_float_slot(target, value)) {
            return false;
        }
        return true;
    };

    auto emit_array_set_float_const = [&](SQInteger target, SQInteger base, SQInteger index, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            value < 0 || value >= MAX_FUNC_STACKSIZE ||
            slot_kind[base] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[base] < 0 ||
            !ensure_float_slot(value)) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) ||
            !sqjit_native_emit_mov_rsi_r13(&buf) ||
            !sqjit_native_emit_mov_rdx_i64(&buf, stack_object_reg[base]) ||
            !sqjit_native_emit_mov_rcx_imm64(&buf, index) ||
            !sqjit_native_emit_lea_r8_mem(&buf, value) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_set_float_logged) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
            !copy_float_slot(target, value)) {
            return false;
        }
        return true;
    };

    auto emit_table_set_integer_literal = [&](SQInteger target, SQInteger base, SQInteger literal_index, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals ||
            value < 0 || value >= MAX_FUNC_STACKSIZE ||
            slot_kind[base] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[base] < 0 ||
            !ensure_int_slot(value)) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) ||
            !sqjit_native_emit_mov_rsi_r13(&buf) ||
            !sqjit_native_emit_mov_rdx_i64(&buf, stack_object_reg[base]) ||
            !sqjit_native_emit_mov_rcx_imm64(&buf, (SQInteger)(intptr_t)&proto->_literals[literal_index]) ||
            !sqjit_native_emit_mov_r8_mem(&buf, value) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_table_set_integer_logged) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
            !copy_int_slot(target, value)) {
            return false;
        }
        return true;
    };

    auto emit_table_set_float_literal = [&](SQInteger target, SQInteger base, SQInteger literal_index, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals ||
            value < 0 || value >= MAX_FUNC_STACKSIZE ||
            slot_kind[base] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[base] < 0 ||
            !ensure_float_slot(value)) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) ||
            !sqjit_native_emit_mov_rsi_r13(&buf) ||
            !sqjit_native_emit_mov_rdx_i64(&buf, stack_object_reg[base]) ||
            !sqjit_native_emit_mov_rcx_imm64(&buf, (SQInteger)(intptr_t)&proto->_literals[literal_index]) ||
            !sqjit_native_emit_lea_r8_mem(&buf, value) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_table_set_float_logged) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
            !copy_float_slot(target, value)) {
            return false;
        }
        return true;
    };

    auto slot_is_observed_float = [&](SQInteger slot) -> bool {
        return slot >= 0 && slot < MAX_FUNC_STACKSIZE &&
            ((slot_kind[slot] == SQ_JIT_SLOT_FLOAT) ||
            (slot_kind[slot] == SQ_JIT_SLOT_STACK_OBJECT && stack_object_reg[slot] >= 0 &&
                sq_type(entry_stack[stack_object_reg[slot]]) == OT_FLOAT));
    };

    auto emit_integer_equality = [&](SQInteger target, SQInteger left, SQInteger right, bool negated, bool right_is_literal) -> bool {
        if(target < 0 || target >= MAX_FUNC_STACKSIZE || !ensure_int_slot(left) ||
            !sqjit_native_emit_mov_rax_mem(&buf, left)) {
            return false;
        }
        if(right_is_literal) {
            if(right < 0 || right >= proto->_nliterals ||
                sq_type(proto->_literals[right]) != OT_INTEGER ||
                !sqjit_native_is_int32(_integer(proto->_literals[right])) ||
                !sqjit_native_emit_cmp_rax_i32(&buf, _integer(proto->_literals[right]))) {
                return false;
            }
        }
        else {
            if(!ensure_int_slot(right) || !sqjit_native_emit_cmp_rax_mem(&buf, right)) {
                return false;
            }
        }
        if(!sqjit_native_emit_setcc_rax(&buf, negated ? 0x95 : 0x94) ||
            !sqjit_native_emit_mov_mem_rax(&buf, target) ||
            !mark_int_slot(target)) {
            return false;
        }
        return true;
    };

    auto slot_is_float = [&](SQInteger slot) -> bool {
        return slot >= 0 && slot < MAX_FUNC_STACKSIZE && slot_kind[slot] == SQ_JIT_SLOT_FLOAT;
    };

    auto emit_float_binary = [&](SQOpcode op, SQInteger dst, SQInteger left, SQInteger right) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            !ensure_float_slot(left) || !ensure_float_slot(right) ||
            !sqjit_native_emit_mov_xmm0_local_float(&buf, left) ||
            !sqjit_native_emit_float_op_xmm0_local(&buf, op, right) ||
            !sqjit_native_emit_mov_local_float_xmm0(&buf, dst) ||
            !mark_float_slot(dst)) {
            return false;
        }
        return true;
    };

    auto observed_stack_reg = [&](SQInteger slot) -> SQInteger {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE || slot_kind[slot] != SQ_JIT_SLOT_STACK_OBJECT) {
            return -1;
        }
        return stack_object_reg[slot];
    };

    for(SQInteger ip = 0; ip < proto->_ninstructions; ip++) {
        ip_to_offset[ip] = buf.size;
        const SQInstruction &inst = proto->_instructions[ip];

        switch(inst.op) {
            case _OP_LINE:
                break;
            case _OP_LOADINT: {
                SQInteger value = sqjit_loadint_value(inst);
                bool materialize_int = !sqjit_next_consumes_load_as_immediate(proto, ip, inst._arg0);
                if(materialize_int && !sqjit_native_emit_mov_mem_imm32(&buf, inst._arg0, value)) {
                    return false;
                }
                slot_kind[inst._arg0] = SQ_JIT_SLOT_INT;
                stack_object_reg[inst._arg0] = -1;
                literal_object_index[inst._arg0] = -1;
                int_materialized[inst._arg0] = materialize_int;
                known_const[inst._arg0] = true;
                const_value[inst._arg0] = value;
                break;
            }
            case _OP_LOADFLOAT: {
                SQFloat value;
                if(!sqjit_loadfloat_value(inst, &value) ||
                    !sqjit_native_emit_mov_local_float_const(&buf, inst._arg0, value)) {
                    return false;
                }
                slot_kind[inst._arg0] = SQ_JIT_SLOT_FLOAT;
                stack_object_reg[inst._arg0] = -1;
                literal_object_index[inst._arg0] = -1;
                int_materialized[inst._arg0] = false;
                float_materialized[inst._arg0] = true;
                known_const[inst._arg0] = true;
                float_const_value[inst._arg0] = value;
                break;
            }
            case _OP_LOAD: {
                if(!load_literal_slot(inst._arg0, inst._arg1,
                    !sqjit_next_consumes_load_as_immediate(proto, ip, inst._arg0))) {
                    return false;
                }
                break;
            }
            case _OP_DLOAD: {
                if(!load_literal_slot(inst._arg0, inst._arg1,
                    !sqjit_next_consumes_load_as_immediate(proto, ip, inst._arg0)) ||
                    !load_literal_slot(inst._arg2, inst._arg3,
                    !sqjit_next_consumes_load_as_immediate(proto, ip, inst._arg2))) {
                    return false;
                }
                break;
            }
            case _OP_MOVE:
                if(slot_kind[inst._arg1] == SQ_JIT_SLOT_FLOAT) {
                    if(!copy_float_slot(inst._arg0, inst._arg1)) {
                        return false;
                    }
                }
                else if(slot_kind[inst._arg1] == SQ_JIT_SLOT_INT) {
                    if(!ensure_int_slot(inst._arg1) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                    slot_kind[inst._arg0] = SQ_JIT_SLOT_INT;
                    stack_object_reg[inst._arg0] = -1;
                    literal_object_index[inst._arg0] = -1;
                    int_materialized[inst._arg0] = true;
                    float_materialized[inst._arg0] = false;
                }
                else if(slot_kind[inst._arg1] == SQ_JIT_SLOT_STACK_OBJECT) {
                    slot_kind[inst._arg0] = SQ_JIT_SLOT_STACK_OBJECT;
                    stack_object_reg[inst._arg0] = stack_object_reg[inst._arg1];
                    literal_object_index[inst._arg0] = -1;
                    int_materialized[inst._arg0] = false;
                    float_materialized[inst._arg0] = false;
                }
                else if(slot_kind[inst._arg1] == SQ_JIT_SLOT_LITERAL_OBJECT) {
                    slot_kind[inst._arg0] = SQ_JIT_SLOT_LITERAL_OBJECT;
                    stack_object_reg[inst._arg0] = -1;
                    literal_object_index[inst._arg0] = literal_object_index[inst._arg1];
                    int_materialized[inst._arg0] = false;
                    float_materialized[inst._arg0] = false;
                }
                else {
                    return false;
                }
                known_const[inst._arg0] = known_const[inst._arg1];
                const_value[inst._arg0] = const_value[inst._arg1];
                break;
            case _OP_GETOUTER:
                if(sqjit_observed_outer_value_type(closure, inst._arg1) == OT_FLOAT) {
                    if(!emit_outer_get_float(inst._arg0, inst._arg1)) {
                        return false;
                    }
                }
                else if(!emit_outer_get_integer(inst._arg0, inst._arg1)) {
                    return false;
                }
                break;
            case _OP_GET:
                if(slot_kind[inst._arg2] == SQ_JIT_SLOT_LITERAL_OBJECT) {
                    SQInteger literal_index = literal_object_index[inst._arg2];
                    if(literal_index < 0 || literal_index >= proto->_nliterals) {
                        return false;
                    }
                    if(sq_type(proto->_literals[literal_index]) == OT_INTEGER) {
                        SQInteger index = _integer(proto->_literals[literal_index]);
                        SQObjectType observed = sqjit_observed_array_value_type(entry_stack,
                            observed_stack_reg(inst._arg1), index);
                        if(observed == OT_FLOAT) {
                            if(!emit_array_get_float_const(inst._arg0, inst._arg1, index)) {
                                return false;
                            }
                        }
                        else if(!emit_array_get_integer_const(inst._arg0, inst._arg1, index)) {
                            return false;
                        }
                    }
                    else {
                        SQObjectType observed = sqjit_observed_table_value_type(entry_stack,
                            observed_stack_reg(inst._arg1), &proto->_literals[literal_index]);
                        if(observed == OT_FLOAT) {
                            if(!emit_table_get_float_literal(inst._arg0, inst._arg1, literal_index)) {
                                return false;
                            }
                        }
                        else if(!emit_table_get_integer_literal(inst._arg0, inst._arg1, literal_index)) {
                            return false;
                        }
                    }
                }
                else if(known_const[inst._arg2]) {
                    SQInteger index = const_value[inst._arg2];
                    SQObjectType observed = sqjit_observed_array_value_type(entry_stack,
                        observed_stack_reg(inst._arg1), index);
                    if(observed == OT_FLOAT) {
                        if(!emit_array_get_float_const(inst._arg0, inst._arg1, index)) {
                            return false;
                        }
                    }
                    else if(!emit_array_get_integer_const(inst._arg0, inst._arg1, index)) {
                        return false;
                    }
                }
                else {
                    if(!emit_array_get_integer(inst._arg0, inst._arg1, inst._arg2)) {
                        return false;
                    }
                }
                break;
            case _OP_GETK:
                if(inst._arg1 < 0 || inst._arg1 >= proto->_nliterals) {
                    return false;
                }
                if(sq_type(proto->_literals[inst._arg1]) == OT_INTEGER) {
                    SQInteger index = _integer(proto->_literals[inst._arg1]);
                    SQObjectType observed = sqjit_observed_array_value_type(entry_stack,
                        observed_stack_reg(inst._arg2), index);
                    if(observed == OT_FLOAT) {
                        if(!emit_array_get_float_const(inst._arg0, inst._arg2, index)) {
                            return false;
                        }
                    }
                    else if(!emit_array_get_integer_const(inst._arg0, inst._arg2, index)) {
                        return false;
                    }
                }
                else {
                    SQObjectType observed = sqjit_observed_table_value_type(entry_stack,
                        observed_stack_reg(inst._arg2), &proto->_literals[inst._arg1]);
                    if(observed == OT_FLOAT) {
                        if(!emit_table_get_float_literal(inst._arg0, inst._arg2, inst._arg1)) {
                            return false;
                        }
                    }
                    else if(!emit_table_get_integer_literal(inst._arg0, inst._arg2, inst._arg1)) {
                        return false;
                    }
                }
                break;
            case _OP_NEWOBJ:
                if(inst._arg3 != NOT_ARRAY || !emit_new_array(inst._arg0, inst._arg1)) {
                    return false;
                }
                break;
            case _OP_APPENDARRAY:
                if(inst._arg2 == AAT_STACK) {
                    if(!emit_append_array_stack(inst._arg0, inst._arg1)) {
                        return false;
                    }
                }
                else if(inst._arg2 == AAT_INT) {
                    if(!emit_append_array_integer(inst._arg0, sqjit_loadint_value(inst))) {
                        return false;
                    }
                }
                else {
                    return false;
                }
                break;
            case _OP_SET:
                if(slot_kind[inst._arg2] == SQ_JIT_SLOT_LITERAL_OBJECT) {
                    SQInteger literal_index = literal_object_index[inst._arg2];
                    if(literal_index < 0 || literal_index >= proto->_nliterals) {
                        return false;
                    }
                    if(sq_type(proto->_literals[literal_index]) == OT_INTEGER) {
                        if(slot_is_observed_float(inst._arg3)) {
                            if(!emit_array_set_float_const(inst._arg0, inst._arg1,
                                _integer(proto->_literals[literal_index]), inst._arg3)) {
                                return false;
                            }
                        }
                        else if(!emit_array_set_integer_const(inst._arg0, inst._arg1,
                            _integer(proto->_literals[literal_index]), inst._arg3)) {
                            return false;
                        }
                    }
                    else if(slot_is_observed_float(inst._arg3)) {
                        if(!emit_table_set_float_literal(inst._arg0, inst._arg1,
                            literal_index, inst._arg3)) {
                            return false;
                        }
                    }
                    else if(!emit_table_set_integer_literal(inst._arg0, inst._arg1,
                        literal_index, inst._arg3)) {
                        return false;
                    }
                }
                else if(known_const[inst._arg2]) {
                    if(slot_is_observed_float(inst._arg3)) {
                        if(!emit_array_set_float_const(inst._arg0, inst._arg1,
                            const_value[inst._arg2], inst._arg3)) {
                            return false;
                        }
                    }
                    else if(!emit_array_set_integer_const(inst._arg0, inst._arg1,
                        const_value[inst._arg2], inst._arg3)) {
                        return false;
                    }
                }
                else if(slot_is_observed_float(inst._arg3)) {
                    if(!emit_array_set_float(inst._arg0, inst._arg1, inst._arg2, inst._arg3)) {
                        return false;
                    }
                }
                else if(!emit_array_set_integer(inst._arg0, inst._arg1, inst._arg2, inst._arg3)) {
                    return false;
                }
                break;
            case _OP_EQ:
            case _OP_NE:
                if(!emit_integer_equality(inst._arg0, inst._arg2, inst._arg1,
                    inst.op == _OP_NE, inst._arg3 != 0)) {
                    return false;
                }
                break;
            case _OP_ADD:
                {
                if(slot_is_float(inst._arg1) || slot_is_float(inst._arg2)) {
                    if(!emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                        return false;
                    }
                    break;
                }
                SQInteger imm = 0;
                if(sqjit_previous_loads_int_const(proto, ip, inst._arg1, &imm) && sqjit_native_is_int32(imm)) {
                    if(!ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_add_rax_i32(&buf, imm) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                }
                else if(sqjit_previous_loads_int_const(proto, ip, inst._arg2, &imm) && sqjit_native_is_int32(imm)) {
                    if(!ensure_int_slot(inst._arg1) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_add_rax_i32(&buf, imm) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                }
                else {
                    if(!ensure_int_slot(inst._arg1) || !ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_add_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                }
                slot_kind[inst._arg0] = SQ_JIT_SLOT_INT;
                stack_object_reg[inst._arg0] = -1;
                literal_object_index[inst._arg0] = -1;
                int_materialized[inst._arg0] = true;
                float_materialized[inst._arg0] = false;
                known_const[inst._arg0] = false;
                break;
                }
            case _OP_SUB:
                {
                if(slot_is_float(inst._arg1) || slot_is_float(inst._arg2)) {
                    if(!emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                        return false;
                    }
                    break;
                }
                SQInteger imm = 0;
                if(sqjit_previous_loads_int_const(proto, ip, inst._arg1, &imm) && sqjit_native_is_int32(imm)) {
                    if(!ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_sub_rax_i32(&buf, imm) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                }
                else {
                    if(!ensure_int_slot(inst._arg1) || !ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_sub_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                }
                slot_kind[inst._arg0] = SQ_JIT_SLOT_INT;
                stack_object_reg[inst._arg0] = -1;
                literal_object_index[inst._arg0] = -1;
                int_materialized[inst._arg0] = true;
                float_materialized[inst._arg0] = false;
                known_const[inst._arg0] = false;
                break;
                }
            case _OP_MUL:
                {
                if(slot_is_float(inst._arg1) || slot_is_float(inst._arg2)) {
                    if(!emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                        return false;
                    }
                    break;
                }
                SQInteger imm = 0;
                if(sqjit_previous_loads_int_const(proto, ip, inst._arg1, &imm) && sqjit_native_is_int32(imm)) {
                    if(!ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_imul_rax_i32(&buf, imm) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                }
                else if(sqjit_previous_loads_int_const(proto, ip, inst._arg2, &imm) && sqjit_native_is_int32(imm)) {
                    if(!ensure_int_slot(inst._arg1) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_imul_rax_i32(&buf, imm) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                }
                else {
                    if(!ensure_int_slot(inst._arg1) || !ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_imul_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                }
                slot_kind[inst._arg0] = SQ_JIT_SLOT_INT;
                stack_object_reg[inst._arg0] = -1;
                literal_object_index[inst._arg0] = -1;
                int_materialized[inst._arg0] = true;
                float_materialized[inst._arg0] = false;
                known_const[inst._arg0] = false;
                break;
                }
            case _OP_DIV:
                if(!emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                    return false;
                }
                break;
            case _OP_MOD: {
                SQInteger divisor = 0;
                if(!ensure_int_slot(inst._arg2) || !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2)) {
                    return false;
                }
                if(sqjit_previous_loads_positive_int_const(proto, ip, inst._arg1) &&
                    sqjit_previous_loads_int_const(proto, ip, inst._arg1, &divisor) &&
                    sqjit_native_is_int32(divisor)) {
                    if(!sqjit_native_emit_mov_rcx_imm64(&buf, divisor)) {
                        return false;
                    }
                }
                else {
                    SQInteger patch_offset = 0;
                    if(!ensure_int_slot(inst._arg1) ||
                        !sqjit_native_emit_mov_rcx_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_cmp_rcx_i32(&buf, 0) ||
                        !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_LE, &patch_offset) ||
                        !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                            MAX_FUNC_STACKSIZE + 512, patch_offset, -1)) {
                        return false;
                    }
                }
                if(!sqjit_native_emit_idiv_rcx(&buf) ||
                    !sqjit_native_emit_mov_rax_rdx(&buf) ||
                    !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                    return false;
                }
                slot_kind[inst._arg0] = SQ_JIT_SLOT_INT;
                stack_object_reg[inst._arg0] = -1;
                literal_object_index[inst._arg0] = -1;
                int_materialized[inst._arg0] = true;
                float_materialized[inst._arg0] = false;
                known_const[inst._arg0] = false;
                break;
            }
            case _OP_PINCL: {
                SQInteger delta = sqjit_signed_arg3(inst);
                if(!ensure_int_slot(inst._arg1) || !sqjit_native_is_int32(delta)) {
                    return false;
                }
                if(!sqjit_native_emit_mov_rax_mem(&buf, inst._arg1) ||
                    !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0) ||
                    !sqjit_native_emit_add_mem_i32(&buf, inst._arg1, delta)) {
                    return false;
                }
                slot_kind[inst._arg0] = SQ_JIT_SLOT_INT;
                stack_object_reg[inst._arg0] = -1;
                literal_object_index[inst._arg0] = -1;
                int_materialized[inst._arg0] = true;
                float_materialized[inst._arg0] = false;
                known_const[inst._arg0] = known_const[inst._arg1];
                const_value[inst._arg0] = const_value[inst._arg1];
                known_const[inst._arg1] = false;
                break;
            }
            case _OP_JMP: {
                SQInteger patch_offset = 0;
                SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
                if(target_ip < 0 || target_ip > proto->_ninstructions ||
                    !sqjit_native_emit_jmp_placeholder(&buf, &patch_offset) ||
                    !sqjit_native_record_reloc(relocs, &nrelocs, 512, patch_offset, target_ip)) {
                    return false;
                }
                break;
            }
            case _OP_JZ: {
                SQInteger patch_offset = 0;
                SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
                if(!ensure_int_slot(inst._arg0) ||
                    target_ip < 0 || target_ip > proto->_ninstructions ||
                    !sqjit_native_emit_mov_rax_mem(&buf, inst._arg0) ||
                    !sqjit_native_emit_cmp_rax_i32(&buf, 0) ||
                    !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
                    !sqjit_native_record_reloc(relocs, &nrelocs, 512, patch_offset, target_ip)) {
                    return false;
                }
                break;
            }
            case _OP_JCMP: {
                SQJitNativeJcc jcc;
                SQInteger patch_offset = 0;
                SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
                if(target_ip < 0 || target_ip > proto->_ninstructions) {
                    return false;
                }
                if(slot_is_float(inst._arg0) || slot_is_float(inst._arg2)) {
                    if(!ensure_float_slot(inst._arg0) || !ensure_float_slot(inst._arg2) ||
                        !sqjit_native_float_cmp_false_jcc((CmpOP)inst._arg3, &jcc) ||
                        !sqjit_native_emit_mov_xmm0_local_float(&buf, inst._arg2) ||
                        !sqjit_native_emit_ucomi_xmm0_local_float(&buf, inst._arg0) ||
                        !sqjit_native_emit_jcc_placeholder(&buf, jcc, &patch_offset) ||
                        !sqjit_native_record_reloc(relocs, &nrelocs, 512, patch_offset, target_ip)) {
                        return false;
                    }
                }
                else if(!ensure_int_slot(inst._arg0) || !ensure_int_slot(inst._arg2) ||
                    !sqjit_native_cmp_false_jcc((CmpOP)inst._arg3, &jcc) ||
                    !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                    !sqjit_native_emit_cmp_rax_mem(&buf, inst._arg0) ||
                    !sqjit_native_emit_jcc_placeholder(&buf, jcc, &patch_offset) ||
                    !sqjit_native_record_reloc(relocs, &nrelocs, 512, patch_offset, target_ip)) {
                    return false;
                }
                break;
            }
            case _OP_RETURN:
                if(inst._arg0 == 0xFF) {
                    if(ip == 0 ||
                        (proto->_instructions[ip - 1].op != _OP_RETURN && proto->_instructions[ip - 1].op != _OP_JMP)) {
                        return false;
                    }
                    for(SQInteger n = 0; n < nrelocs; n++) {
                        if(relocs[n].target_ip == ip) {
                            return false;
                        }
                    }
                    break;
                }
                if(slot_is_float(inst._arg1)) {
                    if(!ensure_float_slot(inst._arg1) ||
                        !sqjit_native_emit_store_out_float_from_local(&buf, inst._arg1)) {
                        return false;
                    }
                }
                else if(slot_kind[inst._arg1] == SQ_JIT_SLOT_STACK_OBJECT &&
                    stack_object_reg[inst._arg1] >= 0) {
                    if(!emit_return_stack_object(stack_object_reg[inst._arg1])) {
                        return false;
                    }
                }
                else {
                    if(!ensure_int_slot(inst._arg1) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_store_out_integer_from_rax(&buf)) {
                        return false;
                    }
                }
                if(!emit_write_log_release(false) ||
                    !sqjit_native_emit_mov_rsp_rbp(&buf) ||
                    !sqjit_native_emit_pop_r15(&buf) ||
                    !sqjit_native_emit_pop_r14(&buf) ||
                    !sqjit_native_emit_pop_rbx(&buf) ||
                    !sqjit_native_emit_pop_r13(&buf) ||
                    !sqjit_native_emit_pop_r12(&buf) ||
                    !sqjit_native_emit_pop_abi_preserved_arg_regs(&buf) ||
                    !sqjit_native_emit_pop_rbp(&buf) ||
                    !sqjit_native_emit_mov_eax_i32(&buf, SQ_JIT_NATIVE_RETURNED) ||
                    !sqjit_native_emit_ret(&buf)) {
                    return false;
                }
                break;
            default:
                return false;
        }
    }

    ip_to_offset[proto->_ninstructions] = buf.size;
    SQInteger guard_fail_offset = buf.size;
    if(!emit_write_log_release(true) ||
        !sqjit_native_emit_mov_rsp_rbp(&buf) ||
        !sqjit_native_emit_pop_r15(&buf) ||
        !sqjit_native_emit_pop_r14(&buf) ||
        !sqjit_native_emit_pop_rbx(&buf) ||
        !sqjit_native_emit_pop_r13(&buf) ||
        !sqjit_native_emit_pop_r12(&buf) ||
        !sqjit_native_emit_pop_abi_preserved_arg_regs(&buf) ||
        !sqjit_native_emit_pop_rbp(&buf) ||
        !sqjit_native_emit_mov_eax_i32(&buf, SQ_JIT_NATIVE_GUARD_FAILED) ||
        !sqjit_native_emit_ret(&buf)) {
        return false;
    }

    for(SQInteger n = 0; n < nrelocs; n++) {
        SQInteger target_offset = ip_to_offset[relocs[n].target_ip];
        if(target_offset < 0) {
            return false;
        }
        SQInteger rel = target_offset - (relocs[n].patch_offset + 4);
        if(!sqjit_native_patch_i32(&buf, relocs[n].patch_offset, rel)) {
            return false;
        }
    }
    for(SQInteger n = 0; n < nguard_fail_relocs; n++) {
        SQInteger rel = guard_fail_offset - (guard_fail_relocs[n].patch_offset + 4);
        if(!sqjit_native_patch_i32(&buf, guard_fail_relocs[n].patch_offset, rel)) {
            return false;
        }
    }

    return sqjit_native_install(native, &buf);
}

bool sqjit_backend_loop_find_region(SQFunctionProto *proto, SQInteger header_ip,
    SQInteger *start_ip, SQInteger *end_ip, SQInteger *exit_ip)
{
    if(!proto || header_ip < 0 || header_ip >= proto->_ninstructions) {
        return false;
    }

    const SQInstruction &header = proto->_instructions[header_ip];
    if(header.op != _OP_JCMP && header.op != _OP_JZ) {
        return false;
    }

    SQInteger candidate_exit = header_ip + 1 + sqjit_signed_arg1(header);
    if(candidate_exit <= header_ip || candidate_exit > proto->_ninstructions ||
        candidate_exit - header_ip > 512) {
        return false;
    }

    for(SQInteger ip = header_ip + 1; ip < candidate_exit; ip++) {
        const SQInstruction &inst = proto->_instructions[ip];
        SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
        if(inst.op == _OP_JMP && target_ip >= 0 && target_ip <= header_ip) {
            *start_ip = target_ip;
            *end_ip = ip;
            *exit_ip = candidate_exit;
            return true;
        }
    }

    return false;
}

static bool sqjit_loop_instruction_reads_slot(const SQInstruction &inst, SQInteger slot)
{
    switch(inst.op) {
        case _OP_MOVE:
            return inst._arg1 == slot;
        case _OP_ADD:
        case _OP_SUB:
        case _OP_MUL:
        case _OP_DIV:
        case _OP_MOD:
            return inst._arg1 == slot || inst._arg2 == slot;
        case _OP_PINCL:
        case _OP_INCL:
            return inst._arg1 == slot;
        case _OP_JCMP:
        case _OP_CMP:
            return inst._arg0 == slot || inst._arg2 == slot;
        case _OP_JZ:
            return inst._arg0 == slot;
        case _OP_EQ:
        case _OP_NE:
            return inst._arg2 == slot || (inst._arg3 == 0 && inst._arg1 == slot);
        case _OP_GET:
        case _OP_SET:
            return inst._arg1 == slot || inst._arg2 == slot || inst._arg3 == slot;
        case _OP_GETK:
            return inst._arg2 == slot;
        case _OP_PREPCALL:
            return inst._arg1 == slot || inst._arg2 == slot;
        case _OP_PREPCALLK:
            return inst._arg2 == slot;
        case _OP_CALL:
            if(inst._arg1 == slot) {
                return true;
            }
            for(SQInteger n = 0; n < inst._arg3; n++) {
                if(inst._arg2 + n == slot) {
                    return true;
                }
            }
            return false;
        case _OP_RETURN:
            return inst._arg0 != 0xFF && inst._arg1 == slot;
        default:
            return false;
    }
}

static bool sqjit_loop_instruction_reads_int_slot(const SQInstruction &inst, SQInteger slot)
{
    switch(inst.op) {
        case _OP_MOVE:
            return inst._arg1 == slot;
        case _OP_ADD:
        case _OP_SUB:
        case _OP_MUL:
        case _OP_DIV:
        case _OP_MOD:
            return inst._arg1 == slot || inst._arg2 == slot;
        case _OP_PINCL:
        case _OP_INCL:
            return inst._arg1 == slot;
        case _OP_JCMP:
        case _OP_CMP:
            return inst._arg0 == slot || inst._arg2 == slot;
        case _OP_JZ:
            return inst._arg0 == slot;
        case _OP_EQ:
        case _OP_NE:
            return inst._arg2 == slot || (inst._arg3 == 0 && inst._arg1 == slot);
        case _OP_GET:
            return inst._arg2 == slot;
        case _OP_SET:
            return inst._arg3 == slot;
        case _OP_RETURN:
            return inst._arg0 != 0xFF && inst._arg1 == slot;
        default:
            return false;
    }
}

static bool sqjit_loop_instruction_writes_slot(const SQInstruction &inst, SQInteger slot)
{
    switch(inst.op) {
        case _OP_LOAD:
        case _OP_LOADINT:
        case _OP_LOADFLOAT:
        case _OP_LOADBOOL:
        case _OP_GETOUTER:
        case _OP_MOVE:
        case _OP_ADD:
        case _OP_SUB:
        case _OP_MUL:
        case _OP_DIV:
        case _OP_MOD:
        case _OP_EQ:
        case _OP_NE:
        case _OP_GET:
        case _OP_GETK:
        case _OP_CMP:
            return inst._arg0 == slot;
        case _OP_PREPCALL:
        case _OP_PREPCALLK:
            return inst._arg0 == slot || inst._arg3 == slot;
        case _OP_CALL:
            return inst._arg0 != 0xFF && inst._arg0 == slot;
        case _OP_DLOAD:
        case _OP_DMOVE:
            return inst._arg0 == slot || inst._arg2 == slot;
        case _OP_SET:
        case _OP_NEWSLOT:
            return inst._arg0 != 0xFF && inst._arg0 == slot;
        case _OP_PINCL:
            return inst._arg1 == slot || (inst._arg0 != 0xFF && inst._arg0 == slot);
        case _OP_INCL:
            return inst._arg1 == slot;
        default:
            return false;
    }
}

static bool sqjit_loop_slot_is_live_out(SQFunctionProto *proto, SQInteger exit_ip, SQInteger slot)
{
    if(!proto || exit_ip < 0 || exit_ip > proto->_ninstructions) {
        return false;
    }

    for(SQInteger ip = exit_ip; ip < proto->_ninstructions; ip++) {
        const SQInstruction &inst = proto->_instructions[ip];
        if(sqjit_loop_instruction_reads_slot(inst, slot)) {
            return true;
        }
        if(sqjit_loop_instruction_writes_slot(inst, slot)) {
            return false;
        }
    }

    return false;
}

bool sqjit_backend_compile_loop(SQFunctionProto *proto, SQObjectPtr *entry_stack,
    SQClosure *closure, SQInteger start_ip, SQInteger header_ip, SQInteger end_ip, SQInteger exit_ip,
    SQJitProto *jit)
{
    if(!proto || !entry_stack || !jit || start_ip < 0 || header_ip < start_ip || end_ip < header_ip ||
        exit_ip <= header_ip || exit_ip > proto->_ninstructions ||
        proto->_stacksize <= 0 || proto->_stacksize > MAX_FUNC_STACKSIZE ||
        end_ip - start_ip > 512) {
        return false;
    }

    SQInteger ip_to_offset[513];
    SQJitNativeReloc relocs[512];
    SQInteger nrelocs = 0;
    SQJitNativeReloc exit_relocs[128];
    SQInteger nexit_relocs = 0;
    SQJitNativeReloc guard_fail_relocs[MAX_FUNC_STACKSIZE + 512];
    SQInteger nguard_fail_relocs = 0;
    SQJitSlotKind slot_kind[MAX_FUNC_STACKSIZE];
    SQInteger stack_object_reg[MAX_FUNC_STACKSIZE];
    SQInteger literal_object_index[MAX_FUNC_STACKSIZE];
    bool int_materialized[MAX_FUNC_STACKSIZE];
    bool float_materialized[MAX_FUNC_STACKSIZE];
    bool known_const[MAX_FUNC_STACKSIZE];
    bool entry_loaded[MAX_FUNC_STACKSIZE];
    bool dirty_slot[MAX_FUNC_STACKSIZE];
    SQInteger const_value[MAX_FUNC_STACKSIZE];
    SQFloat float_const_value[MAX_FUNC_STACKSIZE];
    for(SQInteger n = 0; n < 513; n++) {
        ip_to_offset[n] = -1;
    }
    for(SQInteger n = 0; n < MAX_FUNC_STACKSIZE; n++) {
        slot_kind[n] = SQ_JIT_SLOT_STACK_OBJECT;
        stack_object_reg[n] = n;
        literal_object_index[n] = -1;
        int_materialized[n] = false;
        float_materialized[n] = false;
        known_const[n] = false;
        entry_loaded[n] = false;
        dirty_slot[n] = false;
        const_value[n] = 0;
        float_const_value[n] = 0;
    }

    SQJitNativeCodeBuffer buf;
    buf.size = 0;

    bool uses_write_log = false;
    for(SQInteger ip = start_ip; ip <= end_ip; ip++) {
        if(proto->_instructions[ip].op == _OP_SET) {
            uses_write_log = true;
            break;
        }
    }

    SQInteger last_reserved_slot = uses_write_log ? SQ_JIT_NATIVE_WRITE_LOG_SLOT : SQ_JIT_NATIVE_CLOSURE_SLOT;
    SQInteger frame_size = (last_reserved_slot + 1) * (SQInteger)sizeof(SQInteger);
    frame_size = ((frame_size + 15) & ~(SQInteger)15) + 8;

    if(!sqjit_native_emit_push_rbp(&buf) ||
        !sqjit_native_emit_push_abi_preserved_arg_regs(&buf) ||
        !sqjit_native_emit_push_r12(&buf) ||
        !sqjit_native_emit_push_r13(&buf) ||
        !sqjit_native_emit_push_rbx(&buf) ||
        !sqjit_native_emit_push_r14(&buf) ||
        !sqjit_native_emit_push_r15(&buf) ||
        !sqjit_native_emit_mov_rbp_rsp(&buf) ||
        !sqjit_native_emit_sub_rsp_i32(&buf, frame_size) ||
        !sqjit_native_emit_mov_r12_rsi(&buf) ||
        !sqjit_native_emit_mov_r13_rdi(&buf) ||
        !sqjit_native_emit_mov_rax_arg3(&buf) ||
        !sqjit_native_emit_mov_local_mem_rax(&buf, SQ_JIT_NATIVE_CLOSURE_SLOT)) {
        return false;
    }
    if(uses_write_log && !sqjit_native_emit_mov_mem_imm32(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT, 0)) {
        return false;
    }

    if(sqjit_trace_enabled) {
        scprintf(_SC("[sqjit] compiling loop region '%s' ip %d..%d branch %d exit %d\n"),
            sqjit_proto_name(proto), (SQInt32)start_ip, (SQInt32)end_ip,
            (SQInt32)header_ip, (SQInt32)exit_ip);
    }

    auto emit_guard_fail_jump = [&]() -> bool {
        SQInteger patch_offset = 0;
        return sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_NE, &patch_offset) &&
            sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1);
    };

    auto emit_write_log_release = [&](bool rollback) -> bool {
        if(!uses_write_log) {
            return true;
        }
        return sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) &&
            sqjit_native_emit_mov_rax_ptr(&buf, rollback ?
                (const void *)sqjit_helper_write_log_rollback :
                (const void *)sqjit_helper_write_log_commit) &&
            sqjit_native_emit_call_rax(&buf);
    };

    auto load_literal_slot = [&](SQInteger dst, SQInteger literal_index, bool materialize_int) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals) {
            return false;
        }
        if(sq_type(proto->_literals[literal_index]) == OT_INTEGER) {
            if(!sqjit_native_is_int32(_integer(proto->_literals[literal_index]))) {
                return false;
            }
            SQInteger value = _integer(proto->_literals[literal_index]);
            if(materialize_int && !sqjit_native_emit_mov_mem_imm32(&buf, dst, value)) {
                return false;
            }
            slot_kind[dst] = SQ_JIT_SLOT_INT;
            int_materialized[dst] = materialize_int;
            float_materialized[dst] = false;
            known_const[dst] = true;
            const_value[dst] = value;
        }
        else if(sq_type(proto->_literals[literal_index]) == OT_FLOAT) {
            SQFloat value = _float(proto->_literals[literal_index]);
            if(!sqjit_native_emit_mov_local_float_const(&buf, dst, value)) {
                return false;
            }
            slot_kind[dst] = SQ_JIT_SLOT_FLOAT;
            int_materialized[dst] = false;
            float_materialized[dst] = true;
            known_const[dst] = true;
            float_const_value[dst] = value;
        }
        else {
            slot_kind[dst] = SQ_JIT_SLOT_LITERAL_OBJECT;
            int_materialized[dst] = false;
            float_materialized[dst] = false;
            known_const[dst] = false;
            literal_object_index[dst] = literal_index;
            stack_object_reg[dst] = -1;
            dirty_slot[dst] = true;
            return true;
        }
        stack_object_reg[dst] = -1;
        literal_object_index[dst] = -1;
        dirty_slot[dst] = true;
        return true;
    };

    auto ensure_int_slot = [&](SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slot_kind[slot] == SQ_JIT_SLOT_INT) {
            if(!int_materialized[slot]) {
                if(!known_const[slot] || !sqjit_native_emit_mov_mem_imm32(&buf, slot, const_value[slot])) {
                    return false;
                }
                int_materialized[slot] = true;
            }
            return true;
        }
        if(slot_kind[slot] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[slot] < 0) {
            return false;
        }
        if(!sqjit_native_emit_cmp_stack_type_i32(&buf, stack_object_reg[slot], OT_INTEGER) ||
            !emit_guard_fail_jump() ||
            !sqjit_native_emit_mov_rax_stack_value(&buf, stack_object_reg[slot]) ||
            !sqjit_native_emit_mov_mem_rax(&buf, slot)) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_SLOT_INT;
        stack_object_reg[slot] = -1;
        literal_object_index[slot] = -1;
        int_materialized[slot] = true;
        float_materialized[slot] = false;
        known_const[slot] = false;
        entry_loaded[slot] = true;
        return true;
    };

    auto ensure_float_slot = [&](SQInteger slot) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        if(slot_kind[slot] == SQ_JIT_SLOT_FLOAT) {
            if(!float_materialized[slot]) {
                if(!known_const[slot] ||
                    !sqjit_native_emit_mov_local_float_const(&buf, slot, float_const_value[slot])) {
                    return false;
                }
                float_materialized[slot] = true;
            }
            return true;
        }
        if(slot_kind[slot] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[slot] < 0) {
            return false;
        }
        if(!sqjit_native_emit_cmp_stack_type_i32(&buf, stack_object_reg[slot], OT_FLOAT) ||
            !emit_guard_fail_jump() ||
            !sqjit_native_emit_mov_xmm0_stack_float_value(&buf, stack_object_reg[slot]) ||
            !sqjit_native_emit_mov_local_float_xmm0(&buf, slot)) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_SLOT_FLOAT;
        stack_object_reg[slot] = -1;
        literal_object_index[slot] = -1;
        int_materialized[slot] = false;
        float_materialized[slot] = true;
        known_const[slot] = false;
        entry_loaded[slot] = true;
        return true;
    };

    auto mark_int_slot = [&](SQInteger slot) -> bool {
        if(slot == 0xFF) {
            return true;
        }
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_SLOT_INT;
        stack_object_reg[slot] = -1;
        literal_object_index[slot] = -1;
        int_materialized[slot] = true;
        float_materialized[slot] = false;
        known_const[slot] = false;
        dirty_slot[slot] = true;
        return true;
    };

    auto mark_float_slot = [&](SQInteger slot) -> bool {
        if(slot == 0xFF) {
            return true;
        }
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_SLOT_FLOAT;
        stack_object_reg[slot] = -1;
        literal_object_index[slot] = -1;
        int_materialized[slot] = false;
        float_materialized[slot] = true;
        known_const[slot] = false;
        dirty_slot[slot] = true;
        return true;
    };

    auto mark_array_ptr_slot = [&](SQInteger slot) -> bool {
        if(slot == 0xFF) {
            return true;
        }
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        slot_kind[slot] = SQ_JIT_SLOT_ARRAY_PTR;
        stack_object_reg[slot] = -1;
        literal_object_index[slot] = -1;
        int_materialized[slot] = true;
        float_materialized[slot] = false;
        known_const[slot] = false;
        dirty_slot[slot] = true;
        return true;
    };

    auto copy_int_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == 0xFF) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || !ensure_int_slot(src) ||
            !sqjit_native_emit_mov_rax_mem(&buf, src) ||
            !sqjit_native_emit_mov_mem_rax(&buf, dst) ||
            !mark_int_slot(dst)) {
            return false;
        }
        entry_loaded[dst] = entry_loaded[dst] || entry_loaded[src];
        known_const[dst] = known_const[src];
        const_value[dst] = const_value[src];
        return true;
    };

    auto copy_float_slot = [&](SQInteger dst, SQInteger src) -> bool {
        if(dst == 0xFF) {
            return true;
        }
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || !ensure_float_slot(src) ||
            !sqjit_native_emit_mov_xmm0_local_float(&buf, src) ||
            !sqjit_native_emit_mov_local_float_xmm0(&buf, dst) ||
            !mark_float_slot(dst)) {
            return false;
        }
        entry_loaded[dst] = entry_loaded[dst] || entry_loaded[src];
        known_const[dst] = known_const[src];
        float_const_value[dst] = float_const_value[src];
        return true;
    };

    auto slot_is_observed_float = [&](SQInteger slot) -> bool {
        return slot >= 0 && slot < MAX_FUNC_STACKSIZE &&
            ((slot_kind[slot] == SQ_JIT_SLOT_FLOAT) ||
            (slot_kind[slot] == SQ_JIT_SLOT_STACK_OBJECT && stack_object_reg[slot] >= 0 &&
                sq_type(entry_stack[stack_object_reg[slot]]) == OT_FLOAT));
    };

    auto emit_array_set_integer = [&](SQInteger target, SQInteger base, SQInteger key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || value < 0 || value >= MAX_FUNC_STACKSIZE ||
            !ensure_int_slot(key) || !ensure_int_slot(value)) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(slot_kind[base] == SQ_JIT_SLOT_STACK_OBJECT && stack_object_reg[base] >= 0) {
            if(!sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) ||
                !sqjit_native_emit_mov_rsi_r13(&buf) ||
                !sqjit_native_emit_mov_rdx_i64(&buf, stack_object_reg[base]) ||
                !sqjit_native_emit_mov_rcx_mem(&buf, key) ||
                !sqjit_native_emit_mov_r8_mem(&buf, value) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_set_integer_logged)) {
                return false;
            }
        }
        else if(slot_kind[base] == SQ_JIT_SLOT_ARRAY_PTR) {
            if(!sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) ||
                !sqjit_native_emit_mov_rsi_mem(&buf, base) ||
                !sqjit_native_emit_mov_rdx_mem(&buf, key) ||
                !sqjit_native_emit_mov_rcx_mem(&buf, value) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_ptr_set_integer_logged)) {
                return false;
            }
        }
        else {
            return false;
        }
        return sqjit_native_emit_call_rax(&buf) &&
            sqjit_native_emit_test_rax_rax(&buf) &&
            sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) &&
            sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) &&
            copy_int_slot(target, value);
    };

    auto emit_array_set_integer_const = [&](SQInteger target, SQInteger base, SQInteger index, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            value < 0 || value >= MAX_FUNC_STACKSIZE || !ensure_int_slot(value)) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(slot_kind[base] == SQ_JIT_SLOT_STACK_OBJECT && stack_object_reg[base] >= 0) {
            if(!sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) ||
                !sqjit_native_emit_mov_rsi_r13(&buf) ||
                !sqjit_native_emit_mov_rdx_i64(&buf, stack_object_reg[base]) ||
                !sqjit_native_emit_mov_rcx_imm64(&buf, index) ||
                !sqjit_native_emit_mov_r8_mem(&buf, value) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_set_integer_logged)) {
                return false;
            }
        }
        else if(slot_kind[base] == SQ_JIT_SLOT_ARRAY_PTR) {
            if(!sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) ||
                !sqjit_native_emit_mov_rsi_mem(&buf, base) ||
                !sqjit_native_emit_mov_rdx_i64(&buf, index) ||
                !sqjit_native_emit_mov_rcx_mem(&buf, value) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_ptr_set_integer_logged)) {
                return false;
            }
        }
        else {
            return false;
        }
        return sqjit_native_emit_call_rax(&buf) &&
            sqjit_native_emit_test_rax_rax(&buf) &&
            sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) &&
            sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) &&
            copy_int_slot(target, value);
    };

    auto emit_array_set_float = [&](SQInteger target, SQInteger base, SQInteger key, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || value < 0 || value >= MAX_FUNC_STACKSIZE ||
            !ensure_int_slot(key) || !ensure_float_slot(value)) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(slot_kind[base] == SQ_JIT_SLOT_STACK_OBJECT && stack_object_reg[base] >= 0) {
            if(!sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) ||
                !sqjit_native_emit_mov_rsi_r13(&buf) ||
                !sqjit_native_emit_mov_rdx_i64(&buf, stack_object_reg[base]) ||
                !sqjit_native_emit_mov_rcx_mem(&buf, key) ||
                !sqjit_native_emit_lea_r8_mem(&buf, value) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_set_float_logged)) {
                return false;
            }
        }
        else if(slot_kind[base] == SQ_JIT_SLOT_ARRAY_PTR) {
            if(!sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) ||
                !sqjit_native_emit_mov_rsi_mem(&buf, base) ||
                !sqjit_native_emit_mov_rdx_mem(&buf, key) ||
                !sqjit_native_emit_lea_rcx_mem(&buf, value) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_ptr_set_float_logged)) {
                return false;
            }
        }
        else {
            return false;
        }
        return sqjit_native_emit_call_rax(&buf) &&
            sqjit_native_emit_test_rax_rax(&buf) &&
            sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) &&
            sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) &&
            copy_float_slot(target, value);
    };

    auto emit_array_set_float_const = [&](SQInteger target, SQInteger base, SQInteger index, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            value < 0 || value >= MAX_FUNC_STACKSIZE || !ensure_float_slot(value)) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(slot_kind[base] == SQ_JIT_SLOT_STACK_OBJECT && stack_object_reg[base] >= 0) {
            if(!sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) ||
                !sqjit_native_emit_mov_rsi_r13(&buf) ||
                !sqjit_native_emit_mov_rdx_i64(&buf, stack_object_reg[base]) ||
                !sqjit_native_emit_mov_rcx_imm64(&buf, index) ||
                !sqjit_native_emit_lea_r8_mem(&buf, value) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_set_float_logged)) {
                return false;
            }
        }
        else if(slot_kind[base] == SQ_JIT_SLOT_ARRAY_PTR) {
            if(!sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) ||
                !sqjit_native_emit_mov_rsi_mem(&buf, base) ||
                !sqjit_native_emit_mov_rdx_i64(&buf, index) ||
                !sqjit_native_emit_lea_rcx_mem(&buf, value) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_ptr_set_float_logged)) {
                return false;
            }
        }
        else {
            return false;
        }
        return sqjit_native_emit_call_rax(&buf) &&
            sqjit_native_emit_test_rax_rax(&buf) &&
            sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) &&
            sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) &&
            copy_float_slot(target, value);
    };

    auto emit_table_set_integer_literal = [&](SQInteger target, SQInteger base, SQInteger literal_index, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals ||
            value < 0 || value >= MAX_FUNC_STACKSIZE ||
            slot_kind[base] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[base] < 0 ||
            !ensure_int_slot(value)) {
            return false;
        }
        SQInteger patch_offset = 0;
        return sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) &&
            sqjit_native_emit_mov_rsi_r13(&buf) &&
            sqjit_native_emit_mov_rdx_i64(&buf, stack_object_reg[base]) &&
            sqjit_native_emit_mov_rcx_imm64(&buf, (SQInteger)(intptr_t)&proto->_literals[literal_index]) &&
            sqjit_native_emit_mov_r8_mem(&buf, value) &&
            sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_table_set_integer_logged) &&
            sqjit_native_emit_call_rax(&buf) &&
            sqjit_native_emit_test_rax_rax(&buf) &&
            sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) &&
            sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) &&
            copy_int_slot(target, value);
    };

    auto emit_table_set_float_literal = [&](SQInteger target, SQInteger base, SQInteger literal_index, SQInteger value) -> bool {
        if(!uses_write_log || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals ||
            value < 0 || value >= MAX_FUNC_STACKSIZE ||
            slot_kind[base] != SQ_JIT_SLOT_STACK_OBJECT || stack_object_reg[base] < 0 ||
            !ensure_float_slot(value)) {
            return false;
        }
        SQInteger patch_offset = 0;
        return sqjit_native_emit_lea_rdi_mem(&buf, SQ_JIT_NATIVE_WRITE_LOG_SLOT) &&
            sqjit_native_emit_mov_rsi_r13(&buf) &&
            sqjit_native_emit_mov_rdx_i64(&buf, stack_object_reg[base]) &&
            sqjit_native_emit_mov_rcx_imm64(&buf, (SQInteger)(intptr_t)&proto->_literals[literal_index]) &&
            sqjit_native_emit_lea_r8_mem(&buf, value) &&
            sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_table_set_float_logged) &&
            sqjit_native_emit_call_rax(&buf) &&
            sqjit_native_emit_test_rax_rax(&buf) &&
            sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) &&
            sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) &&
            copy_float_slot(target, value);
    };

    auto emit_array_get_integer = [&](SQInteger dst, SQInteger base, SQInteger key) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || !ensure_int_slot(key)) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(slot_kind[base] == SQ_JIT_SLOT_STACK_OBJECT && stack_object_reg[base] >= 0) {
            if(!sqjit_native_emit_mov_rdi_r13(&buf) ||
                !sqjit_native_emit_mov_rsi_i64(&buf, stack_object_reg[base]) ||
                !sqjit_native_emit_mov_rdx_mem(&buf, key) ||
                !sqjit_native_emit_lea_rcx_mem(&buf, dst) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_get_integer) ||
                !sqjit_native_emit_call_rax(&buf) ||
                !sqjit_native_emit_test_rax_rax(&buf) ||
                !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
                !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                    MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
                !sqjit_native_sync_pinned_slot_from_local(&buf, dst) ||
                !mark_int_slot(dst)) {
                return false;
            }
        }
        else if(slot_kind[base] == SQ_JIT_SLOT_ARRAY_PTR) {
            if(!sqjit_native_emit_mov_rdi_mem(&buf, base) ||
                !sqjit_native_emit_mov_rsi_mem(&buf, key) ||
                !sqjit_native_emit_lea_rdx_mem(&buf, dst) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_ptr_get_integer) ||
                !sqjit_native_emit_call_rax(&buf) ||
                !sqjit_native_emit_test_rax_rax(&buf) ||
                !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
                !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                    MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
                !mark_int_slot(dst)) {
                return false;
            }
        }
        else {
            return false;
        }
        entry_loaded[dst] = true;
        return true;
    };

    auto emit_array_get_array_ptr = [&](SQInteger dst, SQInteger base, SQInteger key) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE ||
            key < 0 || key >= MAX_FUNC_STACKSIZE || !ensure_int_slot(key)) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(slot_kind[base] == SQ_JIT_SLOT_STACK_OBJECT && stack_object_reg[base] >= 0) {
            if(!sqjit_native_emit_mov_rdi_r13(&buf) ||
                !sqjit_native_emit_mov_rsi_i64(&buf, stack_object_reg[base]) ||
                !sqjit_native_emit_mov_rdx_mem(&buf, key) ||
                !sqjit_native_emit_lea_rcx_mem(&buf, dst) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_get_array_ptr) ||
                !sqjit_native_emit_call_rax(&buf) ||
                !sqjit_native_emit_test_rax_rax(&buf) ||
                !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
                !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                    MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
                !mark_array_ptr_slot(dst)) {
                return false;
            }
        }
        else if(slot_kind[base] == SQ_JIT_SLOT_ARRAY_PTR) {
            if(!sqjit_native_emit_mov_rdi_mem(&buf, base) ||
                !sqjit_native_emit_mov_rsi_mem(&buf, key) ||
                !sqjit_native_emit_lea_rdx_mem(&buf, dst) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_ptr_get_array_ptr) ||
                !sqjit_native_emit_call_rax(&buf) ||
                !sqjit_native_emit_test_rax_rax(&buf) ||
                !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
                !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                    MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
                !mark_array_ptr_slot(dst)) {
                return false;
            }
        }
        else {
            return false;
        }
        return true;
    };

    auto emit_array_get_integer_const = [&](SQInteger dst, SQInteger base, SQInteger index) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || base < 0 || base >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(slot_kind[base] == SQ_JIT_SLOT_STACK_OBJECT && stack_object_reg[base] >= 0) {
            if(!sqjit_native_emit_mov_rdi_r13(&buf) ||
                !sqjit_native_emit_mov_rsi_i64(&buf, stack_object_reg[base]) ||
                !sqjit_native_emit_mov_rdx_i64(&buf, index) ||
                !sqjit_native_emit_lea_rcx_mem(&buf, dst) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_get_integer) ||
                !sqjit_native_emit_call_rax(&buf) ||
                !sqjit_native_emit_test_rax_rax(&buf) ||
                !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
                !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                    MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
                !sqjit_native_sync_pinned_slot_from_local(&buf, dst) ||
                !mark_int_slot(dst)) {
                return false;
            }
        }
        else if(slot_kind[base] == SQ_JIT_SLOT_ARRAY_PTR) {
            if(!sqjit_native_emit_mov_rdi_mem(&buf, base) ||
                !sqjit_native_emit_mov_rsi_i64(&buf, index) ||
                !sqjit_native_emit_lea_rdx_mem(&buf, dst) ||
                !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_array_ptr_get_integer) ||
                !sqjit_native_emit_call_rax(&buf) ||
                !sqjit_native_emit_test_rax_rax(&buf) ||
                !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
                !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                    MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
                !mark_int_slot(dst)) {
                return false;
            }
        }
        else {
            return false;
        }
        entry_loaded[dst] = true;
        return true;
    };

    auto emit_outer_get_integer = [&](SQInteger dst, SQInteger outer_index) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || outer_index < 0 ||
            outer_index >= proto->_noutervalues) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_mov_rdi_mem(&buf, SQ_JIT_NATIVE_CLOSURE_SLOT) ||
            !sqjit_native_emit_mov_rsi_i64(&buf, outer_index) ||
            !sqjit_native_emit_lea_rdx_mem(&buf, dst) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_outer_get_integer) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
            !sqjit_native_sync_pinned_slot_from_local(&buf, dst) ||
            !mark_int_slot(dst)) {
            return false;
        }
        entry_loaded[dst] = true;
        return true;
    };

    auto emit_outer_get_float = [&](SQInteger dst, SQInteger outer_index) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE || outer_index < 0 ||
            outer_index >= proto->_noutervalues) {
            return false;
        }
        SQInteger patch_offset = 0;
        if(!sqjit_native_emit_mov_rdi_mem(&buf, SQ_JIT_NATIVE_CLOSURE_SLOT) ||
            !sqjit_native_emit_mov_rsi_i64(&buf, outer_index) ||
            !sqjit_native_emit_lea_rdx_mem(&buf, dst) ||
            !sqjit_native_emit_mov_rax_ptr(&buf, (const void *)sqjit_helper_outer_get_float) ||
            !sqjit_native_emit_call_rax(&buf) ||
            !sqjit_native_emit_test_rax_rax(&buf) ||
            !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
            !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                MAX_FUNC_STACKSIZE + 512, patch_offset, -1) ||
            !mark_float_slot(dst)) {
            return false;
        }
        entry_loaded[dst] = true;
        return true;
    };

    auto record_branch = [&](SQInteger patch_offset, SQInteger target_ip) -> bool {
        if(target_ip == exit_ip) {
            return sqjit_native_record_reloc(exit_relocs, &nexit_relocs, 128, patch_offset, target_ip);
        }
        if(target_ip < start_ip || target_ip > end_ip) {
            return false;
        }
        return sqjit_native_record_reloc(relocs, &nrelocs, 512, patch_offset, target_ip);
    };

    auto slot_is_float = [&](SQInteger slot) -> bool {
        return slot >= 0 && slot < MAX_FUNC_STACKSIZE && slot_kind[slot] == SQ_JIT_SLOT_FLOAT;
    };

    auto emit_float_binary = [&](SQOpcode op, SQInteger dst, SQInteger left, SQInteger right) -> bool {
        if(dst < 0 || dst >= MAX_FUNC_STACKSIZE ||
            !ensure_float_slot(left) || !ensure_float_slot(right) ||
            !sqjit_native_emit_mov_xmm0_local_float(&buf, left) ||
            !sqjit_native_emit_float_op_xmm0_local(&buf, op, right) ||
            !sqjit_native_emit_mov_local_float_xmm0(&buf, dst) ||
            !mark_float_slot(dst)) {
            return false;
        }
        entry_loaded[dst] = entry_loaded[dst] || entry_loaded[left] || entry_loaded[right];
        return true;
    };

    bool defined_in_loop[MAX_FUNC_STACKSIZE];
    bool preload_slot[MAX_FUNC_STACKSIZE];
    for(SQInteger n = 0; n < MAX_FUNC_STACKSIZE; n++) {
        defined_in_loop[n] = false;
        preload_slot[n] = false;
    }
    for(SQInteger ip = start_ip; ip <= end_ip; ip++) {
        const SQInstruction &inst = proto->_instructions[ip];
        for(SQInteger slot = 0; slot < proto->_stacksize; slot++) {
            if(sqjit_loop_instruction_reads_int_slot(inst, slot) && !defined_in_loop[slot]) {
                preload_slot[slot] = true;
            }
        }
        for(SQInteger slot = 0; slot < proto->_stacksize; slot++) {
            if(sqjit_loop_instruction_writes_slot(inst, slot)) {
                defined_in_loop[slot] = true;
            }
        }
    }
    for(SQInteger slot = 0; slot < proto->_stacksize; slot++) {
        if(!preload_slot[slot]) {
            continue;
        }
        if(sq_type(entry_stack[slot]) == OT_FLOAT) {
            if(!ensure_float_slot(slot)) {
                return false;
            }
        }
        else if(sq_type(entry_stack[slot]) == OT_INTEGER) {
            if(!ensure_int_slot(slot)) {
                return false;
            }
        }
        else {
            return false;
        }
    }

    for(SQInteger ip = start_ip; ip <= end_ip; ip++) {
        ip_to_offset[ip] = buf.size;
        const SQInstruction &inst = proto->_instructions[ip];

        switch(inst.op) {
            case _OP_LINE:
                break;
            case _OP_LOADINT: {
                SQInteger value = sqjit_loadint_value(inst);
                bool materialize_int = !sqjit_next_consumes_load_as_immediate(proto, ip, inst._arg0);
                if(materialize_int && !sqjit_native_emit_mov_mem_imm32(&buf, inst._arg0, value)) {
                    return false;
                }
                slot_kind[inst._arg0] = SQ_JIT_SLOT_INT;
                stack_object_reg[inst._arg0] = -1;
                literal_object_index[inst._arg0] = -1;
                int_materialized[inst._arg0] = materialize_int;
                float_materialized[inst._arg0] = false;
                known_const[inst._arg0] = true;
                const_value[inst._arg0] = value;
                dirty_slot[inst._arg0] = true;
                break;
            }
            case _OP_LOADFLOAT: {
                SQFloat value;
                if(!sqjit_loadfloat_value(inst, &value) ||
                    !sqjit_native_emit_mov_local_float_const(&buf, inst._arg0, value)) {
                    return false;
                }
                slot_kind[inst._arg0] = SQ_JIT_SLOT_FLOAT;
                stack_object_reg[inst._arg0] = -1;
                literal_object_index[inst._arg0] = -1;
                int_materialized[inst._arg0] = false;
                float_materialized[inst._arg0] = true;
                known_const[inst._arg0] = true;
                float_const_value[inst._arg0] = value;
                dirty_slot[inst._arg0] = true;
                break;
            }
            case _OP_LOAD:
                if(!load_literal_slot(inst._arg0, inst._arg1,
                    !sqjit_next_consumes_load_as_immediate(proto, ip, inst._arg0))) {
                    return false;
                }
                break;
            case _OP_DLOAD:
                if(!load_literal_slot(inst._arg0, inst._arg1,
                    !sqjit_next_consumes_load_as_immediate(proto, ip, inst._arg0)) ||
                    !load_literal_slot(inst._arg2, inst._arg3,
                    !sqjit_next_consumes_load_as_immediate(proto, ip, inst._arg2))) {
                    return false;
                }
                break;
            case _OP_GETOUTER:
                if(sqjit_observed_outer_value_type(closure, inst._arg1) == OT_FLOAT) {
                    if(!emit_outer_get_float(inst._arg0, inst._arg1)) {
                        return false;
                    }
                }
                else if(!emit_outer_get_integer(inst._arg0, inst._arg1)) {
                    return false;
                }
                break;
            case _OP_MOVE:
                if(slot_kind[inst._arg1] == SQ_JIT_SLOT_FLOAT) {
                    if(!copy_float_slot(inst._arg0, inst._arg1)) {
                        return false;
                    }
                }
                else if(!copy_int_slot(inst._arg0, inst._arg1)) {
                    return false;
                }
                break;
            case _OP_GET:
                if(slot_kind[inst._arg2] == SQ_JIT_SLOT_LITERAL_OBJECT) {
                    SQInteger literal_index = literal_object_index[inst._arg2];
                    if(literal_index < 0 || literal_index >= proto->_nliterals ||
                        sq_type(proto->_literals[literal_index]) != OT_INTEGER ||
                        !emit_array_get_integer_const(inst._arg0, inst._arg1,
                            _integer(proto->_literals[literal_index]))) {
                        return false;
                    }
                }
                else {
                    SQObjectType observed = OT_NULL;
                    if(inst._arg1 >= 0 && inst._arg1 < MAX_FUNC_STACKSIZE &&
                        inst._arg2 >= 0 && inst._arg2 < MAX_FUNC_STACKSIZE &&
                        slot_kind[inst._arg1] == SQ_JIT_SLOT_STACK_OBJECT &&
                        stack_object_reg[inst._arg1] >= 0 &&
                        sq_type(entry_stack[inst._arg2]) == OT_INTEGER) {
                        observed = sqjit_observed_array_value_type(entry_stack,
                            stack_object_reg[inst._arg1], _integer(entry_stack[inst._arg2]));
                    }
                    if(observed == OT_ARRAY) {
                        if(!emit_array_get_array_ptr(inst._arg0, inst._arg1, inst._arg2)) {
                            return false;
                        }
                    }
                    else if(!emit_array_get_integer(inst._arg0, inst._arg1, inst._arg2)) {
                        return false;
                    }
                }
                break;
            case _OP_GETK:
                if(inst._arg1 < 0 || inst._arg1 >= proto->_nliterals ||
                    sq_type(proto->_literals[inst._arg1]) != OT_INTEGER) {
                    return false;
                }
                if(!emit_array_get_integer_const(inst._arg0, inst._arg2,
                    _integer(proto->_literals[inst._arg1]))) {
                    return false;
                }
                break;
            case _OP_SET:
                if(slot_kind[inst._arg2] == SQ_JIT_SLOT_LITERAL_OBJECT) {
                    SQInteger literal_index = literal_object_index[inst._arg2];
                    if(literal_index < 0 || literal_index >= proto->_nliterals) {
                        return false;
                    }
                    if(sq_type(proto->_literals[literal_index]) == OT_INTEGER) {
                        if(slot_is_observed_float(inst._arg3)) {
                            if(!emit_array_set_float_const(inst._arg0, inst._arg1,
                                _integer(proto->_literals[literal_index]), inst._arg3)) {
                                return false;
                            }
                        }
                        else if(!emit_array_set_integer_const(inst._arg0, inst._arg1,
                            _integer(proto->_literals[literal_index]), inst._arg3)) {
                            return false;
                        }
                    }
                    else if(slot_is_observed_float(inst._arg3)) {
                        if(!emit_table_set_float_literal(inst._arg0, inst._arg1,
                            literal_index, inst._arg3)) {
                            return false;
                        }
                    }
                    else if(!emit_table_set_integer_literal(inst._arg0, inst._arg1,
                        literal_index, inst._arg3)) {
                        return false;
                    }
                }
                else if(known_const[inst._arg2]) {
                    if(slot_is_observed_float(inst._arg3)) {
                        if(!emit_array_set_float_const(inst._arg0, inst._arg1,
                            const_value[inst._arg2], inst._arg3)) {
                            return false;
                        }
                    }
                    else if(!emit_array_set_integer_const(inst._arg0, inst._arg1,
                        const_value[inst._arg2], inst._arg3)) {
                        return false;
                    }
                }
                else if(slot_is_observed_float(inst._arg3)) {
                    if(!emit_array_set_float(inst._arg0, inst._arg1, inst._arg2, inst._arg3)) {
                        return false;
                    }
                }
                else if(!emit_array_set_integer(inst._arg0, inst._arg1, inst._arg2, inst._arg3)) {
                    return false;
                }
                break;
            case _OP_ADD: {
                if(slot_is_float(inst._arg1) || slot_is_float(inst._arg2)) {
                    if(!emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                        return false;
                    }
                    break;
                }
                SQInteger imm = 0;
                if(sqjit_previous_loads_int_const(proto, ip, inst._arg1, &imm) && sqjit_native_is_int32(imm)) {
                    if(!ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_add_rax_i32(&buf, imm) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                    entry_loaded[inst._arg0] = entry_loaded[inst._arg0] || entry_loaded[inst._arg2];
                }
                else if(sqjit_previous_loads_int_const(proto, ip, inst._arg2, &imm) && sqjit_native_is_int32(imm)) {
                    if(!ensure_int_slot(inst._arg1) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_add_rax_i32(&buf, imm) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                    entry_loaded[inst._arg0] = entry_loaded[inst._arg0] || entry_loaded[inst._arg1];
                }
                else {
                    if(!ensure_int_slot(inst._arg1) || !ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_add_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                    entry_loaded[inst._arg0] = entry_loaded[inst._arg0] ||
                        entry_loaded[inst._arg1] || entry_loaded[inst._arg2];
                }
                if(!mark_int_slot(inst._arg0)) {
                    return false;
                }
                break;
            }
            case _OP_SUB: {
                if(slot_is_float(inst._arg1) || slot_is_float(inst._arg2)) {
                    if(!emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                        return false;
                    }
                    break;
                }
                SQInteger imm = 0;
                if(sqjit_previous_loads_int_const(proto, ip, inst._arg1, &imm) && sqjit_native_is_int32(imm)) {
                    if(!ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_sub_rax_i32(&buf, imm) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                    entry_loaded[inst._arg0] = entry_loaded[inst._arg0] || entry_loaded[inst._arg2];
                }
                else {
                    if(!ensure_int_slot(inst._arg1) || !ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_sub_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                    entry_loaded[inst._arg0] = entry_loaded[inst._arg0] ||
                        entry_loaded[inst._arg1] || entry_loaded[inst._arg2];
                }
                if(!mark_int_slot(inst._arg0)) {
                    return false;
                }
                break;
            }
            case _OP_MUL: {
                if(slot_is_float(inst._arg1) || slot_is_float(inst._arg2)) {
                    if(!emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                        return false;
                    }
                    break;
                }
                SQInteger imm = 0;
                if(sqjit_previous_loads_int_const(proto, ip, inst._arg1, &imm) && sqjit_native_is_int32(imm)) {
                    if(!ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_imul_rax_i32(&buf, imm) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                    entry_loaded[inst._arg0] = entry_loaded[inst._arg0] || entry_loaded[inst._arg2];
                }
                else if(sqjit_previous_loads_int_const(proto, ip, inst._arg2, &imm) && sqjit_native_is_int32(imm)) {
                    if(!ensure_int_slot(inst._arg1) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_imul_rax_i32(&buf, imm) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                    entry_loaded[inst._arg0] = entry_loaded[inst._arg0] || entry_loaded[inst._arg1];
                }
                else {
                    if(!ensure_int_slot(inst._arg1) || !ensure_int_slot(inst._arg2) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_imul_rax_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                        return false;
                    }
                    entry_loaded[inst._arg0] = entry_loaded[inst._arg0] ||
                        entry_loaded[inst._arg1] || entry_loaded[inst._arg2];
                }
                if(!mark_int_slot(inst._arg0)) {
                    return false;
                }
                break;
            }
            case _OP_DIV:
                if(!emit_float_binary((SQOpcode)inst.op, inst._arg0, inst._arg2, inst._arg1)) {
                    return false;
                }
                break;
            case _OP_MOD: {
                SQInteger divisor = 0;
                if(!ensure_int_slot(inst._arg2) ||
                    !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2)) {
                    return false;
                }
                if(sqjit_previous_loads_positive_int_const(proto, ip, inst._arg1) &&
                    sqjit_previous_loads_int_const(proto, ip, inst._arg1, &divisor) &&
                    sqjit_native_is_int32(divisor)) {
                    if(!sqjit_native_emit_mov_rcx_imm64(&buf, divisor)) {
                        return false;
                    }
                }
                else {
                    SQInteger patch_offset = 0;
                    if(!ensure_int_slot(inst._arg1) ||
                        !sqjit_native_emit_mov_rcx_mem(&buf, inst._arg1) ||
                        !sqjit_native_emit_cmp_rcx_i32(&buf, 0) ||
                        !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_LE, &patch_offset) ||
                        !sqjit_native_record_reloc(guard_fail_relocs, &nguard_fail_relocs,
                            MAX_FUNC_STACKSIZE + 512, patch_offset, -1)) {
                        return false;
                    }
                }
                if(!sqjit_native_emit_idiv_rcx(&buf) ||
                    !sqjit_native_emit_mov_rax_rdx(&buf) ||
                    !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                    return false;
                }
                entry_loaded[inst._arg0] = entry_loaded[inst._arg0] || entry_loaded[inst._arg2];
                if(!mark_int_slot(inst._arg0)) {
                    return false;
                }
                break;
            }
            case _OP_PINCL: {
                SQInteger delta = sqjit_signed_arg3(inst);
                if(!ensure_int_slot(inst._arg1) || !sqjit_native_is_int32(delta) ||
                    !sqjit_native_emit_mov_rax_mem(&buf, inst._arg1)) {
                    return false;
                }
                if(inst._arg0 != 0xFF && !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                    return false;
                }
                if(!sqjit_native_emit_add_mem_i32(&buf, inst._arg1, delta)) {
                    return false;
                }
                if(inst._arg0 != 0xFF) {
                    entry_loaded[inst._arg0] = entry_loaded[inst._arg0] || entry_loaded[inst._arg1];
                }
                if(!mark_int_slot(inst._arg0) || !mark_int_slot(inst._arg1)) {
                    return false;
                }
                entry_loaded[inst._arg1] = true;
                break;
            }
            case _OP_EQ:
            case _OP_NE:
                if(!ensure_int_slot(inst._arg2) ||
                    !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2)) {
                    return false;
                }
                if(inst._arg3 != 0) {
                    if(inst._arg1 < 0 || inst._arg1 >= proto->_nliterals ||
                        sq_type(proto->_literals[inst._arg1]) != OT_INTEGER ||
                        !sqjit_native_is_int32(_integer(proto->_literals[inst._arg1])) ||
                        !sqjit_native_emit_cmp_rax_i32(&buf, _integer(proto->_literals[inst._arg1]))) {
                        return false;
                    }
                }
                else if(!ensure_int_slot(inst._arg1) ||
                    !sqjit_native_emit_cmp_rax_mem(&buf, inst._arg1)) {
                    return false;
                }
                if(!sqjit_native_emit_setcc_rax(&buf, inst.op == _OP_NE ? 0x95 : 0x94) ||
                    !sqjit_native_emit_mov_mem_rax(&buf, inst._arg0)) {
                    return false;
                }
                entry_loaded[inst._arg0] = entry_loaded[inst._arg0] ||
                    entry_loaded[inst._arg2] || (inst._arg3 == 0 && entry_loaded[inst._arg1]);
                if(!mark_int_slot(inst._arg0)) {
                    return false;
                }
                break;
            case _OP_JZ: {
                SQInteger patch_offset = 0;
                SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
                if(!ensure_int_slot(inst._arg0) ||
                    !sqjit_native_emit_mov_rax_mem(&buf, inst._arg0) ||
                    !sqjit_native_emit_cmp_rax_i32(&buf, 0) ||
                    !sqjit_native_emit_jcc_placeholder(&buf, SQ_JIT_JCC_E, &patch_offset) ||
                    !record_branch(patch_offset, target_ip)) {
                    return false;
                }
                break;
            }
            case _OP_JCMP: {
                SQJitNativeJcc jcc;
                SQInteger patch_offset = 0;
                SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
                if(slot_is_float(inst._arg0) || slot_is_float(inst._arg2)) {
                    if(!ensure_float_slot(inst._arg0) || !ensure_float_slot(inst._arg2) ||
                        !sqjit_native_float_cmp_false_jcc((CmpOP)inst._arg3, &jcc) ||
                        !sqjit_native_emit_mov_xmm0_local_float(&buf, inst._arg2) ||
                        !sqjit_native_emit_ucomi_xmm0_local_float(&buf, inst._arg0) ||
                        !sqjit_native_emit_jcc_placeholder(&buf, jcc, &patch_offset) ||
                        !record_branch(patch_offset, target_ip)) {
                        return false;
                    }
                }
                else {
                    if(!ensure_int_slot(inst._arg0) || !ensure_int_slot(inst._arg2) ||
                        !sqjit_native_cmp_false_jcc((CmpOP)inst._arg3, &jcc) ||
                        !sqjit_native_emit_mov_rax_mem(&buf, inst._arg2) ||
                        !sqjit_native_emit_cmp_rax_mem(&buf, inst._arg0) ||
                        !sqjit_native_emit_jcc_placeholder(&buf, jcc, &patch_offset) ||
                        !record_branch(patch_offset, target_ip)) {
                        return false;
                    }
                }
                break;
            }
            case _OP_JMP: {
                SQInteger patch_offset = 0;
                SQInteger target_ip = ip + 1 + sqjit_signed_arg1(inst);
                if(!sqjit_native_emit_jmp_placeholder(&buf, &patch_offset) ||
                    !record_branch(patch_offset, target_ip)) {
                    return false;
                }
                break;
            }
            default:
                return false;
        }
    }

    SQInteger exit_offset = buf.size;
    for(SQInteger n = 0; n < proto->_stacksize; n++) {
        if(!dirty_slot[n]) {
            continue;
        }
        if(!entry_loaded[n]) {
            if(sqjit_loop_slot_is_live_out(proto, exit_ip, n)) {
                return false;
            }
            continue;
        }
        if(slot_kind[n] == SQ_JIT_SLOT_FLOAT) {
            if(!sqjit_native_emit_store_stack_float_from_local(&buf, n, n)) {
                return false;
            }
        }
        else {
            if(!sqjit_native_emit_mov_rax_mem(&buf, n) ||
                !sqjit_native_emit_store_stack_integer_from_rax(&buf, n)) {
                return false;
            }
        }
    }
    if(!sqjit_native_emit_mov_rax_imm64(&buf, exit_ip) ||
        !sqjit_native_emit_mov_out_rax(&buf) ||
        !emit_write_log_release(false) ||
        !sqjit_native_emit_mov_rsp_rbp(&buf) ||
        !sqjit_native_emit_pop_r15(&buf) ||
        !sqjit_native_emit_pop_r14(&buf) ||
        !sqjit_native_emit_pop_rbx(&buf) ||
        !sqjit_native_emit_pop_r13(&buf) ||
        !sqjit_native_emit_pop_r12(&buf) ||
        !sqjit_native_emit_pop_abi_preserved_arg_regs(&buf) ||
        !sqjit_native_emit_pop_rbp(&buf) ||
        !sqjit_native_emit_mov_eax_i32(&buf, SQ_JIT_NATIVE_RETURNED) ||
        !sqjit_native_emit_ret(&buf)) {
        return false;
    }

    SQInteger guard_fail_offset = buf.size;
    if(!emit_write_log_release(true) ||
        !sqjit_native_emit_mov_rsp_rbp(&buf) ||
        !sqjit_native_emit_pop_r15(&buf) ||
        !sqjit_native_emit_pop_r14(&buf) ||
        !sqjit_native_emit_pop_rbx(&buf) ||
        !sqjit_native_emit_pop_r13(&buf) ||
        !sqjit_native_emit_pop_r12(&buf) ||
        !sqjit_native_emit_pop_abi_preserved_arg_regs(&buf) ||
        !sqjit_native_emit_pop_rbp(&buf) ||
        !sqjit_native_emit_mov_eax_i32(&buf, SQ_JIT_NATIVE_GUARD_FAILED) ||
        !sqjit_native_emit_ret(&buf)) {
        return false;
    }

    for(SQInteger n = 0; n < nrelocs; n++) {
        SQInteger target_offset = ip_to_offset[relocs[n].target_ip];
        if(target_offset < 0) {
            return false;
        }
        SQInteger rel = target_offset - (relocs[n].patch_offset + 4);
        if(!sqjit_native_patch_i32(&buf, relocs[n].patch_offset, rel)) {
            return false;
        }
    }
    for(SQInteger n = 0; n < nexit_relocs; n++) {
        SQInteger rel = exit_offset - (exit_relocs[n].patch_offset + 4);
        if(!sqjit_native_patch_i32(&buf, exit_relocs[n].patch_offset, rel)) {
            return false;
        }
    }
    for(SQInteger n = 0; n < nguard_fail_relocs; n++) {
        SQInteger rel = guard_fail_offset - (guard_fail_relocs[n].patch_offset + 4);
        if(!sqjit_native_patch_i32(&buf, guard_fail_relocs[n].patch_offset, rel)) {
            return false;
        }
    }

    return sqjit_native_install_raw(&jit->_loop_entry, &jit->_loop_native_size, &buf);
}

#elif !SQJIT_HAS_EXTERNAL_NATIVE
void sqjit_backend_native_free(void *SQ_UNUSED_ARG(entry), SQInteger SQ_UNUSED_ARG(size))
{
}

bool sqjit_backend_compile_proto(SQFunctionProto *SQ_UNUSED_ARG(proto),
    SQObjectPtr *SQ_UNUSED_ARG(entry_stack), SQClosure *SQ_UNUSED_ARG(closure),
    SQJitNative *SQ_UNUSED_ARG(native))
{
    return false;
}

bool sqjit_backend_loop_find_region(SQFunctionProto *SQ_UNUSED_ARG(proto), SQInteger SQ_UNUSED_ARG(header_ip),
    SQInteger *SQ_UNUSED_ARG(start_ip), SQInteger *SQ_UNUSED_ARG(end_ip), SQInteger *SQ_UNUSED_ARG(exit_ip))
{
    return false;
}

bool sqjit_backend_compile_loop(SQFunctionProto *SQ_UNUSED_ARG(proto),
    SQObjectPtr *SQ_UNUSED_ARG(entry_stack), SQClosure *SQ_UNUSED_ARG(closure),
    SQInteger SQ_UNUSED_ARG(start_ip), SQInteger SQ_UNUSED_ARG(header_ip),
    SQInteger SQ_UNUSED_ARG(end_ip), SQInteger SQ_UNUSED_ARG(exit_ip),
    SQJitProto *SQ_UNUSED_ARG(jit))
{
    return false;
}
#endif

static bool sqjit_member_get_value(const SQObjectPtr &target, const SQObjectPtr *key,
    SQObjectPtr &value)
{
    if(!key) {
        return false;
    }
    if(sq_type(target) == OT_TABLE) {
        return _table(target)->Get(*key, value);
    }
    if(sq_type(target) == OT_INSTANCE) {
        return _instance(target)->Get(*key, value);
    }
    return false;
}

static bool sqjit_member_set_value(const SQObjectPtr &target, const SQObjectPtr *key,
    const SQObjectPtr &value)
{
    if(!key) {
        return false;
    }
    if(sq_type(target) == OT_TABLE) {
        return _table(target)->Set(*key, value);
    }
    if(sq_type(target) == OT_INSTANCE) {
        return _instance(target)->Set(*key, value);
    }
    return false;
}

static SQInteger sqjit_accessor_entry(SQObjectPtr *stack, SQObjectPtr *outres,
    SQClosure *closure)
{
    if(!stack || !outres || !closure || !closure->_function || !closure->_function->_jit ||
        !closure->_function->_jit->_entry) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQJitNative *native = (SQJitNative *)closure->_function->_jit->_entry;
    SQFunctionProto *proto = closure->_function;
    if((SQJitNativeKind)native->_native_kind == SQ_JIT_NATIVE_SETTER) {
        if(native->_setter_count <= 0 ||
            native->_setter_count > SQ_JIT_NATIVE_MAX_SETTERS) {
            return SQ_JIT_NATIVE_GUARD_FAILED;
        }
        for(SQInteger n = 0; n < native->_setter_count; n++) {
            SQInteger base_slot = native->_setter_base_slots[n];
            SQInteger field_literal_index = native->_setter_field_literal_indices[n];
            SQInteger value_slot = native->_setter_value_slots[n];
            if(base_slot < 0 || base_slot >= MAX_FUNC_STACKSIZE ||
                field_literal_index < 0 || field_literal_index >= proto->_nliterals ||
                value_slot < 0 || value_slot >= MAX_FUNC_STACKSIZE) {
                return SQ_JIT_NATIVE_GUARD_FAILED;
            }
            const SQObjectPtr *field_key = &proto->_literals[field_literal_index];
            if(native->_setter_array_indices[n] >= 0 || native->_setter_index_slots[n] >= 0) {
                SQObjectPtr array_value;
                if(!sqjit_member_get_value(stack[base_slot], field_key, array_value) ||
                    sq_type(array_value) != OT_ARRAY) {
                    return SQ_JIT_NATIVE_GUARD_FAILED;
                }
                SQInteger index = native->_setter_array_indices[n];
                SQInteger index_slot = native->_setter_index_slots[n];
                if(index_slot >= 0) {
                    if(index_slot >= MAX_FUNC_STACKSIZE ||
                        sq_type(stack[index_slot]) != OT_INTEGER) {
                        return SQ_JIT_NATIVE_GUARD_FAILED;
                    }
                    index = _integer(stack[index_slot]);
                }
                if(index < 0 || !_array(array_value)->Set(index, stack[value_slot])) {
                    return SQ_JIT_NATIVE_GUARD_FAILED;
                }
            }
            else if(!sqjit_member_set_value(stack[base_slot], field_key, stack[value_slot])) {
                return SQ_JIT_NATIVE_GUARD_FAILED;
            }
        }
        if(native->_return_slot >= 0) {
            if(native->_return_slot >= MAX_FUNC_STACKSIZE) {
                return SQ_JIT_NATIVE_GUARD_FAILED;
            }
            *outres = stack[native->_return_slot];
        }
        else {
            outres->Null();
        }
        return SQ_JIT_NATIVE_RETURNED;
    }

    if(native->_base_slot < 0 || native->_base_slot >= MAX_FUNC_STACKSIZE ||
        native->_field_literal_index < 0 ||
        native->_field_literal_index >= proto->_nliterals) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQObjectPtr value;
    if(!sqjit_member_get_value(stack[native->_base_slot],
        &proto->_literals[native->_field_literal_index], value)) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    switch((SQJitNativeKind)native->_native_kind) {
        case SQ_JIT_NATIVE_FIELD_ACCESSOR:
            *outres = value;
            return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_NATIVE_FIELD_ARRAY_CONST_ACCESSOR:
            if(sq_type(value) != OT_ARRAY || native->_array_index < 0 ||
                !_array(value)->Get(native->_array_index, *outres)) {
                return SQ_JIT_NATIVE_GUARD_FAILED;
            }
            return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_NATIVE_FIELD_ARRAY_DYNAMIC_ACCESSOR:
            if(sq_type(value) != OT_ARRAY || native->_index_slot < 0 ||
                native->_index_slot >= MAX_FUNC_STACKSIZE ||
                sq_type(stack[native->_index_slot]) != OT_INTEGER ||
                !_array(value)->Get(_integer(stack[native->_index_slot]), *outres)) {
                return SQ_JIT_NATIVE_GUARD_FAILED;
            }
            return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_NATIVE_FIELD_ARRAY_LEN_ACCESSOR:
            if(sq_type(value) != OT_ARRAY) {
                return SQ_JIT_NATIVE_GUARD_FAILED;
            }
            *outres = _array(value)->Size();
            return SQ_JIT_NATIVE_RETURNED;
        default:
            return SQ_JIT_NATIVE_GUARD_FAILED;
    }
}

static SQInteger sqjit_next_effective_ip(SQFunctionProto *proto, SQInteger ip)
{
    while(proto && ip < proto->_ninstructions &&
        proto->_instructions[ip].op == _OP_LINE) {
        ip++;
    }
    return ip;
}

static bool sqjit_return_matches_slot(const SQInstruction &inst, SQInteger slot)
{
    return inst.op == _OP_RETURN && inst._arg0 != 0xFF && inst._arg1 == slot;
}

static bool sqjit_return_matches_null(const SQInstruction &inst)
{
    return inst.op == _OP_RETURN && inst._arg0 == 0xFF;
}

static SQInteger sqjit_native_loadint_value(const SQInstruction &inst)
{
#ifndef _SQ64
    return (SQInteger)inst._arg1;
#else
    return (SQInteger)((SQInt32)inst._arg1);
#endif
}

static SQInteger sqjit_native_signed_arg1(const SQInstruction &inst)
{
    return (SQInteger)((SQInt32)inst._arg1);
}

static SQInteger sqjit_native_branch_target(SQInteger ip, const SQInstruction &inst)
{
    return ip + 1 + sqjit_native_signed_arg1(inst);
}

static bool sqjit_literal_is_string(SQFunctionProto *proto, SQInteger literal_index,
    const SQChar *value)
{
    return proto && value && literal_index >= 0 && literal_index < proto->_nliterals &&
        sq_type(proto->_literals[literal_index]) == OT_STRING &&
        scstrcmp(_stringval(proto->_literals[literal_index]), value) == 0;
}

static bool sqjit_native_is_loadint_value(const SQInstruction &inst,
    SQInteger slot, SQInteger value)
{
    return inst.op == _OP_LOADINT && inst._arg0 == slot &&
        sqjit_native_loadint_value(inst) == value;
}

static bool sqjit_numeric_compare(CmpOP op, const SQObjectPtr &left,
    const SQObjectPtr &right, bool &out)
{
    if(!sq_isnumeric(left) || !sq_isnumeric(right)) {
        return false;
    }

    if(sq_type(left) == OT_INTEGER && sq_type(right) == OT_INTEGER) {
        SQInteger l = _integer(left);
        SQInteger r = _integer(right);
        switch(op) {
            case CMP_G: out = l > r; return true;
            case CMP_GE: out = l >= r; return true;
            case CMP_L: out = l < r; return true;
            case CMP_LE: out = l <= r; return true;
            default: return false;
        }
    }

    SQFloat l = tofloat(left);
    SQFloat r = tofloat(right);
    switch(op) {
        case CMP_G: out = l > r; return true;
        case CMP_GE: out = l >= r; return true;
        case CMP_L: out = l < r; return true;
        case CMP_LE: out = l <= r; return true;
        default: return false;
    }
}

static SQInteger sqjit_numeric_entry(SQObjectPtr *stack, SQObjectPtr *outres,
    SQClosure *closure)
{
    if(!stack || !outres || !closure || !closure->_function ||
        !closure->_function->_jit || !closure->_function->_jit->_entry) {
        return SQ_JIT_NATIVE_GUARD_FAILED;
    }

    SQJitNative *native = (SQJitNative *)closure->_function->_jit->_entry;
    bool selected = false;
    SQObjectPtr zero((SQInteger)0);
    switch((SQJitNativeKind)native->_native_kind) {
        case SQ_JIT_NATIVE_NUMERIC_ABS:
            if(!sq_isnumeric(stack[1]) ||
                !sqjit_numeric_compare(CMP_L, stack[1], zero, selected)) {
                return SQ_JIT_NATIVE_GUARD_FAILED;
            }
            if(!selected) {
                *outres = stack[1];
                return SQ_JIT_NATIVE_RETURNED;
            }
            if(sq_type(stack[1]) == OT_INTEGER) {
                *outres = -_integer(stack[1]);
                return SQ_JIT_NATIVE_RETURNED;
            }
            if(sq_type(stack[1]) == OT_FLOAT) {
                *outres = -_float(stack[1]);
                return SQ_JIT_NATIVE_RETURNED;
            }
            return SQ_JIT_NATIVE_GUARD_FAILED;
        case SQ_JIT_NATIVE_NUMERIC_MIN:
            if(!sqjit_numeric_compare(CMP_L, stack[1], stack[2], selected)) {
                return SQ_JIT_NATIVE_GUARD_FAILED;
            }
            *outres = selected ? stack[1] : stack[2];
            return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_NATIVE_NUMERIC_MAX:
            if(!sqjit_numeric_compare(CMP_G, stack[1], stack[2], selected)) {
                return SQ_JIT_NATIVE_GUARD_FAILED;
            }
            *outres = selected ? stack[1] : stack[2];
            return SQ_JIT_NATIVE_RETURNED;
        case SQ_JIT_NATIVE_NUMERIC_CLAMP:
            if(!sqjit_numeric_compare(CMP_L, stack[1], stack[2], selected)) {
                return SQ_JIT_NATIVE_GUARD_FAILED;
            }
            if(selected) {
                *outres = stack[2];
                return SQ_JIT_NATIVE_RETURNED;
            }
            if(!sqjit_numeric_compare(CMP_G, stack[1], stack[3], selected)) {
                return SQ_JIT_NATIVE_GUARD_FAILED;
            }
            *outres = selected ? stack[3] : stack[1];
            return SQ_JIT_NATIVE_RETURNED;
        default:
            return SQ_JIT_NATIVE_GUARD_FAILED;
    }
}

static bool sqjit_native_precheck(SQJitNative *native, SQObjectPtr *stack)
{
    if(!native || !stack) {
        return false;
    }

    switch((SQJitNativeKind)native->_native_kind) {
        case SQ_JIT_NATIVE_FIELD_ARRAY_DYNAMIC_ACCESSOR:
            return native->_index_slot >= 0 &&
                native->_index_slot < MAX_FUNC_STACKSIZE &&
                sq_type(stack[native->_index_slot]) == OT_INTEGER;
        case SQ_JIT_NATIVE_SETTER:
            if(native->_setter_count <= 0 ||
                native->_setter_count > SQ_JIT_NATIVE_MAX_SETTERS) {
                return false;
            }
            for(SQInteger n = 0; n < native->_setter_count; n++) {
                SQInteger index_slot = native->_setter_index_slots[n];
                if(index_slot >= 0 && (index_slot >= MAX_FUNC_STACKSIZE ||
                    sq_type(stack[index_slot]) != OT_INTEGER)) {
                    return false;
                }
            }
            return true;
        case SQ_JIT_NATIVE_NUMERIC_ABS:
            return sq_isnumeric(stack[1]);
        case SQ_JIT_NATIVE_NUMERIC_MIN:
        case SQ_JIT_NATIVE_NUMERIC_MAX:
            return sq_isnumeric(stack[1]) && sq_isnumeric(stack[2]);
        case SQ_JIT_NATIVE_NUMERIC_CLAMP:
            return sq_isnumeric(stack[1]) && sq_isnumeric(stack[2]) &&
                sq_isnumeric(stack[3]);
        default:
            return true;
    }
}

static bool sqjit_typeof_integer_guard_matches(SQFunctionProto *proto, SQInteger start_ip,
    SQInteger *index_slot, SQInteger *body_ip, SQInteger *fallback_ip)
{
    if(!proto || !index_slot || !body_ip || !fallback_ip) {
        return false;
    }

    SQInteger ip0 = sqjit_next_effective_ip(proto, start_ip);
    if(ip0 >= proto->_ninstructions || proto->_instructions[ip0].op != _OP_TYPEOF) {
        return false;
    }
    const SQInstruction &type_inst = proto->_instructions[ip0];
    if(type_inst._arg1 < 0 || type_inst._arg1 >= proto->_nparameters) {
        return false;
    }

    SQInteger ip1 = sqjit_next_effective_ip(proto, ip0 + 1);
    if(ip1 >= proto->_ninstructions || proto->_instructions[ip1].op != _OP_EQ) {
        return false;
    }
    const SQInstruction &eq_inst = proto->_instructions[ip1];
    if(eq_inst._arg2 != type_inst._arg0 ||
        !sqjit_literal_is_string(proto, eq_inst._arg1, _SC("integer"))) {
        return false;
    }

    SQInteger ip2 = sqjit_next_effective_ip(proto, ip1 + 1);
    if(ip2 >= proto->_ninstructions || proto->_instructions[ip2].op != _OP_JZ ||
        proto->_instructions[ip2]._arg0 != eq_inst._arg0) {
        return false;
    }

    SQInteger target_ip = ip2 + 1 + sqjit_native_signed_arg1(proto->_instructions[ip2]);
    SQInteger ip3 = sqjit_next_effective_ip(proto, ip2 + 1);
    if(ip3 >= proto->_ninstructions || target_ip <= ip3 ||
        target_ip >= proto->_ninstructions) {
        return false;
    }

    *index_slot = type_inst._arg1;
    *body_ip = ip3;
    *fallback_ip = target_ip;
    return true;
}

static bool sqjit_tail_is_throw_null(SQFunctionProto *proto, SQInteger ip)
{
    ip = sqjit_next_effective_ip(proto, ip);
    if(!proto || ip >= proto->_ninstructions ||
        proto->_instructions[ip].op != _OP_LOADNULLS) {
        return false;
    }
    ip = sqjit_next_effective_ip(proto, ip + 1);
    if(ip >= proto->_ninstructions || proto->_instructions[ip].op != _OP_THROW) {
        return false;
    }
    for(ip = sqjit_next_effective_ip(proto, ip + 1); ip < proto->_ninstructions;
        ip = sqjit_next_effective_ip(proto, ip + 1)) {
        if(!sqjit_return_matches_null(proto->_instructions[ip])) {
            return false;
        }
    }
    return true;
}

static bool sqjit_tail_is_only_null_returns(SQFunctionProto *proto, SQInteger ip)
{
    if(!proto) {
        return false;
    }
    for(ip = sqjit_next_effective_ip(proto, ip); ip < proto->_ninstructions;
        ip = sqjit_next_effective_ip(proto, ip + 1)) {
        if(!sqjit_return_matches_null(proto->_instructions[ip])) {
            return false;
        }
    }
    return true;
}

static bool sqjit_compile_numeric_select_proto(SQFunctionProto *proto,
    SQJitNative *native)
{
    if(!proto || !native || proto->_varparams || proto->_ndefaultparams != 0 ||
        proto->_bgenerator || proto->_ninstructions <= 0 ||
        proto->_ninstructions > 16) {
        return false;
    }

    auto set_numeric_native = [&](SQJitNativeKind kind) -> bool {
        native->_native_kind = kind;
        native->_base_slot = -1;
        native->_field_literal_index = -1;
        native->_array_index = -1;
        native->_index_slot = -1;
        native->_native_entry = (void *)sqjit_numeric_entry;
        native->_native_size = 0;
        return true;
    };

    if(proto->_nparameters == 2) {
        SQInteger ip0 = sqjit_next_effective_ip(proto, 0);
        SQInteger ip1 = sqjit_next_effective_ip(proto, ip0 + 1);
        SQInteger ip2 = sqjit_next_effective_ip(proto, ip1 + 1);
        SQInteger ip3 = sqjit_next_effective_ip(proto, ip2 + 1);
        SQInteger ip4 = sqjit_next_effective_ip(proto, ip3 + 1);
        SQInteger ip5 = sqjit_next_effective_ip(proto, ip4 + 1);
        if(ip5 < proto->_ninstructions &&
            sqjit_native_is_loadint_value(proto->_instructions[ip0],
                proto->_instructions[ip0]._arg0, 0) &&
            proto->_instructions[ip1].op == _OP_JCMP &&
            proto->_instructions[ip1]._arg0 == proto->_instructions[ip0]._arg0 &&
            proto->_instructions[ip1]._arg2 == 1 &&
            proto->_instructions[ip1]._arg3 == CMP_L &&
            sqjit_native_branch_target(ip1, proto->_instructions[ip1]) == ip4 &&
            proto->_instructions[ip2].op == _OP_NEG &&
            proto->_instructions[ip2]._arg1 == 1 &&
            proto->_instructions[ip3].op == _OP_JMP &&
            sqjit_native_branch_target(ip3, proto->_instructions[ip3]) == ip5 &&
            proto->_instructions[ip4].op == _OP_MOVE &&
            proto->_instructions[ip4]._arg0 == proto->_instructions[ip2]._arg0 &&
            proto->_instructions[ip4]._arg1 == 1 &&
            sqjit_return_matches_slot(proto->_instructions[ip5],
                proto->_instructions[ip2]._arg0) &&
            sqjit_tail_is_only_null_returns(proto, ip5 + 1)) {
            return set_numeric_native(SQ_JIT_NATIVE_NUMERIC_ABS);
        }
    }

    if(proto->_nparameters == 3) {
        SQInteger ip0 = sqjit_next_effective_ip(proto, 0);
        SQInteger ip1 = sqjit_next_effective_ip(proto, ip0 + 1);
        SQInteger ip2 = sqjit_next_effective_ip(proto, ip1 + 1);
        SQInteger ip3 = sqjit_next_effective_ip(proto, ip2 + 1);
        SQInteger ip4 = sqjit_next_effective_ip(proto, ip3 + 1);
        if(ip4 < proto->_ninstructions &&
            proto->_instructions[ip0].op == _OP_JCMP &&
            proto->_instructions[ip0]._arg0 == 2 &&
            proto->_instructions[ip0]._arg2 == 1 &&
            (proto->_instructions[ip0]._arg3 == CMP_L ||
            proto->_instructions[ip0]._arg3 == CMP_G) &&
            sqjit_native_branch_target(ip0, proto->_instructions[ip0]) == ip3 &&
            proto->_instructions[ip1].op == _OP_MOVE &&
            proto->_instructions[ip1]._arg1 == 1 &&
            proto->_instructions[ip2].op == _OP_JMP &&
            sqjit_native_branch_target(ip2, proto->_instructions[ip2]) == ip4 &&
            proto->_instructions[ip3].op == _OP_MOVE &&
            proto->_instructions[ip3]._arg0 == proto->_instructions[ip1]._arg0 &&
            proto->_instructions[ip3]._arg1 == 2 &&
            sqjit_return_matches_slot(proto->_instructions[ip4],
                proto->_instructions[ip1]._arg0) &&
            sqjit_tail_is_only_null_returns(proto, ip4 + 1)) {
            return set_numeric_native(
                proto->_instructions[ip0]._arg3 == CMP_L ?
                SQ_JIT_NATIVE_NUMERIC_MIN : SQ_JIT_NATIVE_NUMERIC_MAX);
        }
    }

    if(proto->_nparameters == 4) {
        SQInteger ip0 = sqjit_next_effective_ip(proto, 0);
        SQInteger ip1 = sqjit_next_effective_ip(proto, ip0 + 1);
        SQInteger ip2 = sqjit_next_effective_ip(proto, ip1 + 1);
        SQInteger ip3 = sqjit_next_effective_ip(proto, ip2 + 1);
        SQInteger ip4 = sqjit_next_effective_ip(proto, ip3 + 1);
        SQInteger ip5 = sqjit_next_effective_ip(proto, ip4 + 1);
        SQInteger ip6 = sqjit_next_effective_ip(proto, ip5 + 1);
        SQInteger ip7 = sqjit_next_effective_ip(proto, ip6 + 1);
        SQInteger ip8 = sqjit_next_effective_ip(proto, ip7 + 1);
        if(ip8 < proto->_ninstructions &&
            proto->_instructions[ip0].op == _OP_JCMP &&
            proto->_instructions[ip0]._arg0 == 2 &&
            proto->_instructions[ip0]._arg2 == 1 &&
            proto->_instructions[ip0]._arg3 == CMP_L &&
            sqjit_native_branch_target(ip0, proto->_instructions[ip0]) == ip3 &&
            proto->_instructions[ip1].op == _OP_MOVE &&
            proto->_instructions[ip1]._arg1 == 2 &&
            proto->_instructions[ip2].op == _OP_JMP &&
            sqjit_native_branch_target(ip2, proto->_instructions[ip2]) == ip8 &&
            proto->_instructions[ip3].op == _OP_JCMP &&
            proto->_instructions[ip3]._arg0 == 3 &&
            proto->_instructions[ip3]._arg2 == 1 &&
            proto->_instructions[ip3]._arg3 == CMP_G &&
            sqjit_native_branch_target(ip3, proto->_instructions[ip3]) == ip6 &&
            proto->_instructions[ip4].op == _OP_MOVE &&
            proto->_instructions[ip4]._arg1 == 3 &&
            proto->_instructions[ip5].op == _OP_JMP &&
            sqjit_native_branch_target(ip5, proto->_instructions[ip5]) == ip7 &&
            proto->_instructions[ip6].op == _OP_MOVE &&
            proto->_instructions[ip6]._arg0 == proto->_instructions[ip4]._arg0 &&
            proto->_instructions[ip6]._arg1 == 1 &&
            proto->_instructions[ip7].op == _OP_MOVE &&
            proto->_instructions[ip7]._arg0 == proto->_instructions[ip1]._arg0 &&
            proto->_instructions[ip7]._arg1 == proto->_instructions[ip4]._arg0 &&
            sqjit_return_matches_slot(proto->_instructions[ip8],
                proto->_instructions[ip1]._arg0) &&
            sqjit_tail_is_only_null_returns(proto, ip8 + 1)) {
            return set_numeric_native(SQ_JIT_NATIVE_NUMERIC_CLAMP);
        }
    }

    return false;
}

static bool sqjit_compile_accessor_proto(SQFunctionProto *proto, SQJitNative *native)
{
    if(!proto || !native || proto->_nparameters < 1 || proto->_varparams ||
        proto->_ndefaultparams != 0 || proto->_ninstructions <= 0 ||
        proto->_ninstructions > 16 || proto->_bgenerator) {
        return false;
    }

    SQInteger ip0 = sqjit_next_effective_ip(proto, 0);
    if(ip0 >= proto->_ninstructions || proto->_instructions[ip0].op != _OP_GETK) {
        return false;
    }
    const SQInstruction &field_get = proto->_instructions[ip0];
    if(field_get._arg1 < 0 || field_get._arg1 >= proto->_nliterals ||
        field_get._arg2 < 0 || field_get._arg2 >= proto->_nparameters ||
        sq_type(proto->_literals[field_get._arg1]) != OT_STRING) {
        return false;
    }

    SQInteger ip1 = sqjit_next_effective_ip(proto, ip0 + 1);
    if(ip1 >= proto->_ninstructions) {
        return false;
    }
    const SQInstruction &second = proto->_instructions[ip1];
    if(sqjit_return_matches_slot(second, field_get._arg0)) {
        native->_native_kind = SQ_JIT_NATIVE_FIELD_ACCESSOR;
        native->_base_slot = field_get._arg2;
        native->_field_literal_index = field_get._arg1;
        native->_native_entry = (void *)sqjit_accessor_entry;
        native->_native_size = 0;
        return true;
    }

    SQInteger value_slot = -1;
    SQInteger array_index = -1;
    SQInteger index_slot = -1;
    SQJitNativeKind kind = SQ_JIT_NATIVE_RAW_CODE;
    if(second.op == _OP_PREPCALLK && second._arg0 == field_get._arg0 &&
        second._arg2 == field_get._arg0 &&
        second._arg1 >= 0 && second._arg1 < proto->_nliterals &&
        sq_type(proto->_literals[second._arg1]) == OT_STRING &&
        scstrcmp(_stringval(proto->_literals[second._arg1]), _SC("len")) == 0) {
        SQInteger ip2 = sqjit_next_effective_ip(proto, ip1 + 1);
        if(ip2 >= proto->_ninstructions ||
            (proto->_instructions[ip2].op != _OP_CALL &&
            proto->_instructions[ip2].op != _OP_TAILCALL) ||
            proto->_instructions[ip2]._arg1 != field_get._arg0 ||
            proto->_instructions[ip2]._arg2 != second._arg3 ||
            proto->_instructions[ip2]._arg3 != 1) {
            return false;
        }
        SQInteger ip3 = sqjit_next_effective_ip(proto, ip2 + 1);
        if(ip3 >= proto->_ninstructions ||
            !sqjit_return_matches_slot(proto->_instructions[ip3], proto->_instructions[ip2]._arg0)) {
            return false;
        }
        native->_native_kind = SQ_JIT_NATIVE_FIELD_ARRAY_LEN_ACCESSOR;
        native->_base_slot = field_get._arg2;
        native->_field_literal_index = field_get._arg1;
        native->_array_index = -1;
        native->_index_slot = -1;
        native->_native_entry = (void *)sqjit_accessor_entry;
        native->_native_size = 0;
        return true;
    }

    if(second.op == _OP_GETK && second._arg2 == field_get._arg0 &&
        second._arg1 >= 0 && second._arg1 < proto->_nliterals &&
        sq_type(proto->_literals[second._arg1]) == OT_INTEGER) {
        value_slot = second._arg0;
        array_index = _integer(proto->_literals[second._arg1]);
        kind = SQ_JIT_NATIVE_FIELD_ARRAY_CONST_ACCESSOR;
    }
    else if(second.op == _OP_GET && second._arg1 == field_get._arg0 &&
        second._arg2 >= 0 && second._arg2 < proto->_nparameters) {
        value_slot = second._arg0;
        index_slot = second._arg2;
        kind = SQ_JIT_NATIVE_FIELD_ARRAY_DYNAMIC_ACCESSOR;
    }
    else {
        return false;
    }

    SQInteger ip2 = sqjit_next_effective_ip(proto, ip1 + 1);
    if(ip2 >= proto->_ninstructions ||
        !sqjit_return_matches_slot(proto->_instructions[ip2], value_slot)) {
        return false;
    }

    native->_native_kind = kind;
    native->_base_slot = field_get._arg2;
    native->_field_literal_index = field_get._arg1;
    native->_array_index = array_index;
    native->_index_slot = index_slot;
    native->_native_entry = (void *)sqjit_accessor_entry;
    native->_native_size = 0;
    return true;
}

static bool sqjit_compile_guarded_accessor_proto(SQFunctionProto *proto, SQJitNative *native)
{
    if(!proto || !native || proto->_nparameters < 2 || proto->_varparams ||
        proto->_ndefaultparams != 0 || proto->_ninstructions <= 0 ||
        proto->_ninstructions > 16 || proto->_bgenerator) {
        return false;
    }

    SQInteger index_slot = -1;
    SQInteger body_ip = -1;
    SQInteger fallback_ip = -1;
    if(!sqjit_typeof_integer_guard_matches(proto, 0, &index_slot, &body_ip,
        &fallback_ip)) {
        return false;
    }

    const SQInstruction &field_get = proto->_instructions[body_ip];
    if(field_get.op != _OP_GETK || field_get._arg1 < 0 ||
        field_get._arg1 >= proto->_nliterals || field_get._arg2 < 0 ||
        field_get._arg2 >= proto->_nparameters ||
        sq_type(proto->_literals[field_get._arg1]) != OT_STRING) {
        return false;
    }

    SQInteger read_ip = sqjit_next_effective_ip(proto, body_ip + 1);
    if(read_ip >= proto->_ninstructions || proto->_instructions[read_ip].op != _OP_GET ||
        proto->_instructions[read_ip]._arg1 != field_get._arg0 ||
        proto->_instructions[read_ip]._arg2 != index_slot) {
        return false;
    }
    SQInteger return_ip = sqjit_next_effective_ip(proto, read_ip + 1);
    if(return_ip >= proto->_ninstructions ||
        !sqjit_return_matches_slot(proto->_instructions[return_ip],
            proto->_instructions[read_ip]._arg0) ||
        !sqjit_tail_is_throw_null(proto, fallback_ip)) {
        return false;
    }

    native->_native_kind = SQ_JIT_NATIVE_FIELD_ARRAY_DYNAMIC_ACCESSOR;
    native->_base_slot = field_get._arg2;
    native->_field_literal_index = field_get._arg1;
    native->_array_index = -1;
    native->_index_slot = index_slot;
    native->_native_entry = (void *)sqjit_accessor_entry;
    native->_native_size = 0;
    return true;
}

static void sqjit_native_record_setter(SQJitNative *native, SQInteger base_slot,
    SQInteger field_literal_index, SQInteger array_index, SQInteger index_slot,
    SQInteger value_slot)
{
    SQInteger setter_index = native->_setter_count++;
    native->_setter_base_slots[setter_index] = base_slot;
    native->_setter_field_literal_indices[setter_index] = field_literal_index;
    native->_setter_array_indices[setter_index] = array_index;
    native->_setter_index_slots[setter_index] = index_slot;
    native->_setter_value_slots[setter_index] = value_slot;
}

static bool sqjit_compile_setter_proto(SQFunctionProto *proto, SQJitNative *native)
{
    if(!proto || !native || proto->_nparameters < 1 || proto->_varparams ||
        proto->_ndefaultparams != 0 || proto->_ninstructions <= 0 ||
        proto->_ninstructions > 32 || proto->_bgenerator) {
        return false;
    }

    SQInteger literal_slot[MAX_FUNC_STACKSIZE];
    bool integer_slot_known[MAX_FUNC_STACKSIZE];
    SQInteger integer_slot_value[MAX_FUNC_STACKSIZE];
    SQInteger field_base_slot[MAX_FUNC_STACKSIZE];
    SQInteger field_literal_slot[MAX_FUNC_STACKSIZE];
    SQInteger param_alias_slot[MAX_FUNC_STACKSIZE];
    for(SQInteger n = 0; n < MAX_FUNC_STACKSIZE; n++) {
        literal_slot[n] = -1;
        integer_slot_known[n] = false;
        integer_slot_value[n] = 0;
        field_base_slot[n] = -1;
        field_literal_slot[n] = -1;
        param_alias_slot[n] = n < proto->_nparameters ? n : -1;
    }

    native->_setter_count = 0;
    native->_return_slot = -1;

    auto clear_slot = [&](SQInteger slot) {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return;
        }
        literal_slot[slot] = -1;
        integer_slot_known[slot] = false;
        integer_slot_value[slot] = 0;
        field_base_slot[slot] = -1;
        field_literal_slot[slot] = -1;
        param_alias_slot[slot] = -1;
    };

    auto load_literal_slot = [&](SQInteger slot, SQInteger literal_index) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE ||
            literal_index < 0 || literal_index >= proto->_nliterals) {
            return false;
        }
        clear_slot(slot);
        literal_slot[slot] = literal_index;
        if(sq_type(proto->_literals[literal_index]) == OT_INTEGER) {
            integer_slot_known[slot] = true;
            integer_slot_value[slot] = _integer(proto->_literals[literal_index]);
        }
        return true;
    };

    auto load_integer_slot = [&](SQInteger slot, SQInteger value) -> bool {
        if(slot < 0 || slot >= MAX_FUNC_STACKSIZE) {
            return false;
        }
        clear_slot(slot);
        integer_slot_known[slot] = true;
        integer_slot_value[slot] = value;
        return true;
    };

    for(SQInteger ip = 0; ip < proto->_ninstructions; ip++) {
        const SQInstruction &inst = proto->_instructions[ip];
        switch(inst.op) {
            case _OP_LINE:
                break;
            case _OP_LOAD:
                if(!load_literal_slot(inst._arg0, inst._arg1)) {
                    return false;
                }
                break;
            case _OP_DLOAD:
                if(!load_literal_slot(inst._arg0, inst._arg1) ||
                    !load_literal_slot(inst._arg2, inst._arg3)) {
                    return false;
                }
                break;
            case _OP_LOADINT:
                if(!load_integer_slot(inst._arg0, sqjit_native_loadint_value(inst))) {
                    return false;
                }
                break;
            case _OP_MOVE:
                if(inst._arg0 < 0 || inst._arg0 >= MAX_FUNC_STACKSIZE ||
                    inst._arg1 < 0 || inst._arg1 >= MAX_FUNC_STACKSIZE) {
                    return false;
                }
                literal_slot[inst._arg0] = literal_slot[inst._arg1];
                integer_slot_known[inst._arg0] = integer_slot_known[inst._arg1];
                integer_slot_value[inst._arg0] = integer_slot_value[inst._arg1];
                field_base_slot[inst._arg0] = field_base_slot[inst._arg1];
                field_literal_slot[inst._arg0] = field_literal_slot[inst._arg1];
                param_alias_slot[inst._arg0] = param_alias_slot[inst._arg1];
                break;
            case _OP_GETK:
                if(inst._arg0 < 0 || inst._arg0 >= MAX_FUNC_STACKSIZE ||
                    inst._arg1 < 0 || inst._arg1 >= proto->_nliterals ||
                    inst._arg2 < 0 || inst._arg2 >= MAX_FUNC_STACKSIZE ||
                    param_alias_slot[inst._arg2] < 0 ||
                    sq_type(proto->_literals[inst._arg1]) != OT_STRING) {
                    return false;
                }
                clear_slot(inst._arg0);
                field_base_slot[inst._arg0] = param_alias_slot[inst._arg2];
                field_literal_slot[inst._arg0] = inst._arg1;
                break;
            case _OP_GET: {
                if(inst._arg0 < 0 || inst._arg0 >= MAX_FUNC_STACKSIZE ||
                    inst._arg1 < 0 || inst._arg1 >= MAX_FUNC_STACKSIZE ||
                    inst._arg2 < 0 || inst._arg2 >= MAX_FUNC_STACKSIZE ||
                    param_alias_slot[inst._arg1] < 0) {
                    return false;
                }
                SQInteger literal_index = literal_slot[inst._arg2];
                if(literal_index < 0 || literal_index >= proto->_nliterals ||
                    sq_type(proto->_literals[literal_index]) != OT_STRING) {
                    return false;
                }
                clear_slot(inst._arg0);
                field_base_slot[inst._arg0] = param_alias_slot[inst._arg1];
                field_literal_slot[inst._arg0] = literal_index;
                break;
            }
            case _OP_SET: {
                if(native->_setter_count >= SQ_JIT_NATIVE_MAX_SETTERS ||
                    inst._arg1 < 0 || inst._arg1 >= MAX_FUNC_STACKSIZE ||
                    inst._arg2 < 0 || inst._arg2 >= MAX_FUNC_STACKSIZE ||
                    inst._arg3 < 0 || inst._arg3 >= MAX_FUNC_STACKSIZE ||
                    param_alias_slot[inst._arg3] < 0) {
                    return false;
                }
                SQInteger value_slot = param_alias_slot[inst._arg3];
                if(field_literal_slot[inst._arg1] >= 0) {
                    SQInteger array_index = -1;
                    SQInteger index_slot = -1;
                    if(integer_slot_known[inst._arg2]) {
                        array_index = integer_slot_value[inst._arg2];
                    }
                    else if(param_alias_slot[inst._arg2] >= 0) {
                        index_slot = param_alias_slot[inst._arg2];
                    }
                    else {
                        return false;
                    }
                    sqjit_native_record_setter(native, field_base_slot[inst._arg1],
                        field_literal_slot[inst._arg1], array_index, index_slot, value_slot);
                }
                else {
                    SQInteger base_slot = param_alias_slot[inst._arg1];
                    SQInteger key_literal_index = literal_slot[inst._arg2];
                    if(base_slot < 0 || key_literal_index < 0 ||
                        key_literal_index >= proto->_nliterals ||
                        sq_type(proto->_literals[key_literal_index]) != OT_STRING) {
                        return false;
                    }
                    sqjit_native_record_setter(native, base_slot, key_literal_index,
                        -1, -1, value_slot);
                }
                if(inst._arg0 >= 0 && inst._arg0 < MAX_FUNC_STACKSIZE) {
                    clear_slot(inst._arg0);
                }
                break;
            }
            case _OP_RETURN:
                if(native->_setter_count <= 0) {
                    return false;
                }
                if(sqjit_return_matches_null(inst)) {
                    native->_return_slot = -1;
                }
                else if(inst._arg0 != 0xFF && inst._arg1 >= 0 &&
                    inst._arg1 < MAX_FUNC_STACKSIZE && param_alias_slot[inst._arg1] >= 0) {
                    native->_return_slot = param_alias_slot[inst._arg1];
                }
                else {
                    return false;
                }
                for(SQInteger tail_ip = sqjit_next_effective_ip(proto, ip + 1);
                    tail_ip < proto->_ninstructions;
                    tail_ip = sqjit_next_effective_ip(proto, tail_ip + 1)) {
                    if(!sqjit_return_matches_null(proto->_instructions[tail_ip])) {
                        return false;
                    }
                }
                native->_native_kind = SQ_JIT_NATIVE_SETTER;
                native->_base_slot = 0;
                native->_field_literal_index = 0;
                native->_array_index = -1;
                native->_index_slot = -1;
                native->_native_entry = (void *)sqjit_accessor_entry;
                native->_native_size = 0;
                return true;
            default:
                return false;
        }
    }

    return false;
}

static bool sqjit_compile_guarded_setter_proto(SQFunctionProto *proto, SQJitNative *native)
{
    if(!proto || !native || proto->_nparameters < 3 || proto->_varparams ||
        proto->_ndefaultparams != 0 || proto->_ninstructions <= 0 ||
        proto->_ninstructions > 16 || proto->_bgenerator) {
        return false;
    }

    SQInteger index_slot = -1;
    SQInteger body_ip = -1;
    SQInteger fallback_ip = -1;
    if(!sqjit_typeof_integer_guard_matches(proto, 0, &index_slot, &body_ip,
        &fallback_ip)) {
        return false;
    }

    const SQInstruction &field_get = proto->_instructions[body_ip];
    if(field_get.op != _OP_GETK || field_get._arg1 < 0 ||
        field_get._arg1 >= proto->_nliterals || field_get._arg2 < 0 ||
        field_get._arg2 >= proto->_nparameters ||
        sq_type(proto->_literals[field_get._arg1]) != OT_STRING) {
        return false;
    }

    SQInteger set_ip = sqjit_next_effective_ip(proto, body_ip + 1);
    if(set_ip >= proto->_ninstructions || proto->_instructions[set_ip].op != _OP_SET ||
        proto->_instructions[set_ip]._arg1 != field_get._arg0 ||
        proto->_instructions[set_ip]._arg2 != index_slot ||
        proto->_instructions[set_ip]._arg3 < 0 ||
        proto->_instructions[set_ip]._arg3 >= proto->_nparameters) {
        return false;
    }

    SQInteger return_ip = sqjit_next_effective_ip(proto, set_ip + 1);
    if(return_ip >= proto->_ninstructions ||
        !sqjit_return_matches_slot(proto->_instructions[return_ip],
            proto->_instructions[set_ip]._arg3) ||
        !sqjit_tail_is_throw_null(proto, fallback_ip)) {
        return false;
    }

    native->_native_kind = SQ_JIT_NATIVE_SETTER;
    native->_base_slot = 0;
    native->_field_literal_index = 0;
    native->_array_index = -1;
    native->_index_slot = -1;
    native->_setter_count = 0;
    sqjit_native_record_setter(native, field_get._arg2, field_get._arg1,
        -1, index_slot, proto->_instructions[set_ip]._arg3);
    native->_return_slot = proto->_instructions[set_ip]._arg3;
    native->_native_entry = (void *)sqjit_accessor_entry;
    native->_native_size = 0;
    return true;
}

static bool sqjit_compile_proto(SQFunctionProto *proto, SQObjectPtr *entry_stack, SQClosure *closure,
    SQJitProto *jit)
{
    if(!entry_stack || jit->_entry || jit->_eligibility == SQ_JIT_NEVER) {
        return jit->_entry != NULL;
    }
    sqjit_diag_clear_transient_reject();

    if(sqjit_trace_stats_enabled) {
        sqjit_diag_stats.proto_compile_attempts++;
        SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
        if(entry) {
            entry->compile_attempts++;
        }
    }

    SQJitNative *native = (SQJitNative *)sq_vm_malloc(sizeof(SQJitNative));
    if(!native) {
        jit->_fail_count++;
        if(sqjit_trace_stats_enabled) {
            sqjit_diag_stats.proto_compile_failures++;
            SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
            if(entry) {
                entry->compile_failures++;
            }
        }
        return false;
    }

    native->_ninstructions = proto->_ninstructions;
    native->_native_entry = NULL;
    native->_native_size = 0;
    native->_native_kind = SQ_JIT_NATIVE_RAW_CODE;
    native->_base_slot = -1;
    native->_field_literal_index = -1;
    native->_array_index = -1;
    native->_index_slot = -1;
    native->_setter_count = 0;
    for(SQInteger n = 0; n < SQ_JIT_NATIVE_MAX_SETTERS; n++) {
        native->_setter_base_slots[n] = -1;
        native->_setter_field_literal_indices[n] = -1;
        native->_setter_array_indices[n] = -1;
        native->_setter_index_slots[n] = -1;
        native->_setter_value_slots[n] = -1;
    }
    native->_return_slot = -1;
    native->_return_shape = SQ_JIT_NATIVE_RETURN_UNKNOWN;
    native->_return_shape_class = NULL;
    native->_return_shape_field_index = -1;
    native->_native_trace_executed = false;

    if(!sqjit_compile_numeric_select_proto(proto, native) &&
        !sqjit_compile_accessor_proto(proto, native) &&
        !sqjit_compile_guarded_accessor_proto(proto, native) &&
        !sqjit_compile_setter_proto(proto, native) &&
        !sqjit_compile_guarded_setter_proto(proto, native) &&
        !sqjit_backend_compile_proto(proto, entry_stack, closure, native)) {
        sq_vm_free(native, sizeof(SQJitNative));
        bool transient_reject = sqjit_diag_consume_transient_reject();
        jit->_fail_count++;
        if(transient_reject && jit->_fail_count < SQ_JIT_TRANSIENT_RETRY_LIMIT) {
            jit->_hot_count = 0;
        }
        else {
            jit->_eligibility = SQ_JIT_NEVER;
        }
        if(sqjit_trace_stats_enabled) {
            sqjit_diag_stats.proto_compile_failures++;
            SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
            if(entry) {
                entry->compile_failures++;
            }
        }
        if(sqjit_trace_enabled) {
            scprintf(_SC("[sqjit] proto '%s' is not native eligible\n"), sqjit_proto_name(proto));
        }
        return false;
    }

    jit->_entry = native;
    jit->_eligibility = SQ_JIT_NATIVE_CANDIDATE;
    jit->_version++;
    if(sqjit_trace_stats_enabled) {
        sqjit_diag_stats.proto_compile_successes++;
        SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
        if(entry) {
            entry->compile_successes++;
        }
    }

    if(sqjit_trace_enabled) {
        scprintf(_SC("[sqjit] compiled native proto '%s'\n"), sqjit_proto_name(proto));
    }
    return true;
}

bool sqjit_runtime_enabled()
{
    sqjit_read_env_once();
    return sqjit_env_enabled;
}

SQInteger sqjit_hot_threshold()
{
    sqjit_read_env_once();
    return sqjit_threshold;
}

void sqjit_on_function_enter(SQVM *v, SQFunctionProto *proto)
{
    sqjit_read_env_once();
    if(!sqjit_env_enabled || !proto) {
        return;
    }
    if(sqjit_trace_stats_enabled) {
        sqjit_diag_stats.proto_enters++;
        SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
        if(entry) {
            entry->enters++;
        }
    }

    SQJitProto *jit = sqjit_ensure_proto(proto);
    if(!jit) {
        return;
    }

    jit->_hot_count++;
    if(jit->_hot_count >= sqjit_threshold && !jit->_entry && jit->_eligibility != SQ_JIT_NEVER) {
        if(sqjit_trace_stats_enabled) {
            sqjit_diag_stats.proto_hot++;
            SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
            if(entry) {
                entry->hot++;
            }
        }
        if(sqjit_trace_enabled) {
            scprintf(_SC("[sqjit] hot proto '%s' reached JIT threshold\n"),
                sqjit_proto_name(proto));
        }
        SQClosure *closure = (v && v->ci) ? _closure(v->ci->_closure) : NULL;
        SQObjectPtr *entry_stack = (v && v->ci) ? &v->_stack._vals[v->_stackbase] : NULL;
        sqjit_compile_proto(proto, entry_stack, closure, jit);
    }
}

bool sqjit_try_execute_closure(SQVM *v, SQClosure *closure, SQObjectPtr *stack, SQInteger nargs, SQObjectPtr &outres)
{
    sqjit_read_env_once();
    if(!sqjit_env_enabled || !v || !closure || !stack || v->_debughook) {
        return false;
    }
    sqjit_proto_runtime_tick++;
    if(sqjit_trace_stats_enabled) {
        sqjit_diag_stats.direct_call_attempts++;
    }

    SQFunctionProto *proto = closure->_function;
    if(sqjit_trace_stats_enabled && proto) {
        SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
        if(entry) {
            entry->direct_attempts++;
        }
    }
    if(!proto || proto->_bgenerator || proto->_varparams || proto->_ndefaultparams != 0 ||
        proto->_nparameters != nargs || !proto->_jit || !proto->_jit->_entry) {
        if(sqjit_trace_stats_enabled) {
            sqjit_diag_stats.direct_call_misses++;
            SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
            if(entry) {
                entry->direct_misses++;
            }
        }
        return false;
    }
    if(sqjit_proto_backoff_active(proto, proto->_jit)) {
        if(sqjit_trace_stats_enabled) {
            sqjit_diag_stats.direct_call_misses++;
            SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
            if(entry) {
                entry->direct_misses++;
            }
        }
        return false;
    }

    SQJitNative *native = (SQJitNative *)proto->_jit->_entry;
    if(!native || native->_ninstructions != proto->_ninstructions || !native->_native_entry) {
        if(sqjit_trace_stats_enabled) {
            sqjit_diag_stats.direct_call_misses++;
            SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
            if(entry) {
                entry->direct_misses++;
            }
        }
        return false;
    }
    if(!sqjit_native_precheck(native, stack)) {
        if(sqjit_trace_stats_enabled) {
            sqjit_diag_stats.direct_call_misses++;
            sqjit_diag_stats.direct_call_guard_failures++;
            SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
            if(entry) {
                entry->direct_misses++;
                entry->direct_guard_failures++;
            }
        }
        sqjit_proto_note_guard_fail(proto, proto->_jit,
            SQ_JIT_DIRECT_GUARD_BACKOFF_WEIGHT);
        return false;
    }

    SQJitNativeObjectFn fn = (SQJitNativeObjectFn)native->_native_entry;
    SQObjectPtr result;
    SQInteger status = fn(stack, &result, closure);
    if(status != SQ_JIT_NATIVE_RETURNED) {
        if(sqjit_trace_stats_enabled) {
            sqjit_diag_stats.direct_call_misses++;
            SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
            if(entry) {
                entry->direct_misses++;
            }
            if(status == SQ_JIT_NATIVE_GUARD_FAILED) {
                sqjit_diag_stats.direct_call_guard_failures++;
                if(entry) {
                    entry->direct_guard_failures++;
                }
            }
        }
        if(status == SQ_JIT_NATIVE_GUARD_FAILED) {
            sqjit_proto_note_guard_fail(proto, proto->_jit,
                SQ_JIT_DIRECT_GUARD_BACKOFF_WEIGHT);
        }
        return false;
    }

    outres = result;
    sqjit_proto_note_success(proto->_jit);
    if(sqjit_trace_stats_enabled) {
        sqjit_diag_stats.direct_call_successes++;
        SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
        if(entry) {
            entry->direct_successes++;
        }
    }
    if(sqjit_trace_enabled && !native->_native_trace_executed) {
        native->_native_trace_executed = true;
        scprintf(_SC("[sqjit] executed native proto '%s' by direct call\n"), sqjit_proto_name(proto));
    }
    return true;
}

bool sqjit_try_execute_current_loop(SQVM *v, SQInteger header_ip)
{
    sqjit_read_env_once();
#if !SQJIT_HAS_X64_NATIVE && !SQJIT_HAS_EXTERNAL_NATIVE
    (void)v;
    (void)header_ip;
    return false;
#else
    if(!sqjit_env_enabled || !v || !v->ci || v->_debughook) {
        return false;
    }
    sqjit_loop_runtime_tick++;
    if(sqjit_trace_stats_enabled) {
        sqjit_diag_stats.loop_try_attempts++;
    }

    SQClosure *closure = _closure(v->ci->_closure);
    SQFunctionProto *proto = closure->_function;
    if(!proto || proto->_bgenerator || header_ip < 0 || header_ip >= proto->_ninstructions) {
        return false;
    }
    if(sqjit_trace_stats_enabled) {
        SQJitDiagLoopStats *entry = sqjit_diag_get_loop(proto, header_ip);
        if(entry) {
            entry->try_attempts++;
        }
    }

    SQInteger start_ip = -1;
    SQInteger end_ip = -1;
    SQInteger exit_ip = -1;
    SQJitProto *jit = proto->_jit;
    if(jit) {
        if(sqjit_loop_header_is_rejected(jit, header_ip)) {
            return false;
        }
        if(jit->_loop_header_ip == header_ip &&
            sqjit_loop_backoff_active(proto, jit, header_ip)) {
            return false;
        }
        if(jit->_loop_entry) {
            if(jit->_loop_header_ip != header_ip) {
                return false;
            }
            goto execute_loop;
        }
        if(jit->_loop_fail_count > 0 && jit->_loop_header_ip == header_ip) {
            return false;
        }
    }

    if(!sqjit_backend_loop_find_region(proto, header_ip, &start_ip, &end_ip, &exit_ip)) {
        if(sqjit_trace_stats_enabled) {
            sqjit_diag_stats.loop_find_failures++;
            SQJitDiagLoopStats *entry = sqjit_diag_get_loop(proto, header_ip);
            if(entry) {
                entry->find_failures++;
            }
        }
        jit = sqjit_ensure_proto(proto);
        if(jit) {
            sqjit_loop_reject_header(jit, header_ip);
        }
        return false;
    }

    jit = sqjit_ensure_proto(proto);
    if(!jit) {
        return false;
    }

    if(jit->_loop_entry && jit->_loop_header_ip != header_ip) {
        return false;
    }

    if(!jit->_loop_entry) {
        jit->_loop_hot_count++;
        if(jit->_loop_hot_count < sqjit_threshold) {
            return false;
        }
        if(sqjit_trace_enabled) {
            scprintf(_SC("[sqjit] hot loop in proto '%s' reached JIT threshold at ip %d\n"),
                sqjit_proto_name(proto), (SQInt32)header_ip);
        }
        if(sqjit_trace_stats_enabled) {
            sqjit_diag_stats.loop_compile_attempts++;
            SQJitDiagLoopStats *entry = sqjit_diag_get_loop(proto, header_ip);
            if(entry) {
                entry->compile_attempts++;
            }
        }
        if(!sqjit_backend_compile_loop(proto, &v->_stack._vals[v->_stackbase], closure,
            start_ip, header_ip, end_ip, exit_ip, jit)) {
            jit->_loop_fail_count++;
            jit->_loop_header_ip = header_ip;
            jit->_loop_exit_ip = exit_ip;
            sqjit_loop_reject_header(jit, header_ip);
            if(sqjit_trace_enabled) {
                scprintf(_SC("[sqjit] loop in proto '%s' at ip %d is not native eligible\n"),
                    sqjit_proto_name(proto), (SQInt32)header_ip);
            }
            if(sqjit_trace_stats_enabled) {
                sqjit_diag_stats.loop_compile_failures++;
                SQJitDiagLoopStats *entry = sqjit_diag_get_loop(proto, header_ip);
                if(entry) {
                    entry->compile_failures++;
                }
            }
            return false;
        }
        jit->_loop_header_ip = header_ip;
        jit->_loop_exit_ip = exit_ip;
        jit->_version++;
        if(sqjit_trace_stats_enabled) {
            sqjit_diag_stats.loop_compile_successes++;
            SQJitDiagLoopStats *entry = sqjit_diag_get_loop(proto, header_ip);
            if(entry) {
                entry->compile_successes++;
            }
        }
        if(sqjit_trace_enabled) {
            scprintf(_SC("[sqjit] compiled native loop in proto '%s' ip %d..%d\n"),
                sqjit_proto_name(proto), (SQInt32)header_ip, (SQInt32)end_ip);
        }
    }

execute_loop:
    if(sqjit_trace_stats_enabled) {
        sqjit_diag_stats.loop_exec_attempts++;
        SQJitDiagLoopStats *entry = sqjit_diag_get_loop(proto, header_ip);
        if(entry) {
            entry->exec_attempts++;
        }
    }
    SQJitNativeLoopFn fn = (SQJitNativeLoopFn)jit->_loop_entry;
    SQInteger next_ip = header_ip;
    SQInteger status = fn(&v->_stack._vals[v->_stackbase], &next_ip, closure);
    if(status != SQ_JIT_NATIVE_RETURNED) {
        if(sqjit_trace_stats_enabled) {
            sqjit_diag_stats.loop_exec_guard_failures++;
            SQJitDiagLoopStats *entry = sqjit_diag_get_loop(proto, header_ip);
            if(entry) {
                entry->exec_guard_failures++;
            }
        }
        if(status == SQ_JIT_NATIVE_GUARD_FAILED) {
            sqjit_loop_note_guard_fail(proto, jit, header_ip);
        }
        return false;
    }
    if(next_ip < 0 || next_ip > proto->_ninstructions) {
        return false;
    }

    v->ci->_ip = &proto->_instructions[next_ip];
    if(sqjit_trace_stats_enabled) {
        sqjit_diag_stats.loop_exec_successes++;
        SQJitDiagLoopStats *entry = sqjit_diag_get_loop(proto, header_ip);
        if(entry) {
            entry->exec_successes++;
        }
    }
    sqjit_loop_note_success(jit);
    if(sqjit_trace_enabled && !jit->_loop_trace_executed) {
        jit->_loop_trace_executed = true;
        scprintf(_SC("[sqjit] executed native loop in proto '%s' at ip %d\n"),
            sqjit_proto_name(proto), (SQInt32)header_ip);
    }
    return true;
#endif
}

SQJitExecResult sqjit_try_execute_current(SQVM *v, SQObjectPtr &outres)
{
    sqjit_read_env_once();
    if(!sqjit_env_enabled || !v || !v->ci || v->_debughook) {
        return SQ_JIT_EXEC_NOT_EXECUTED;
    }
    sqjit_proto_runtime_tick++;
    if(sqjit_trace_stats_enabled) {
        sqjit_diag_stats.proto_exec_attempts++;
    }

    SQClosure *closure = _closure(v->ci->_closure);
    SQFunctionProto *proto = closure->_function;
    if(sqjit_trace_stats_enabled && proto) {
        SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
        if(entry) {
            entry->exec_attempts++;
        }
    }
    if(!proto || !proto->_jit || !proto->_jit->_entry) {
        return SQ_JIT_EXEC_NOT_EXECUTED;
    }
    if(sqjit_proto_backoff_active(proto, proto->_jit)) {
        return SQ_JIT_EXEC_NOT_EXECUTED;
    }

    SQJitNative *native = (SQJitNative *)proto->_jit->_entry;
    if(!native || native->_ninstructions != proto->_ninstructions || !native->_native_entry) {
        return SQ_JIT_EXEC_NOT_EXECUTED;
    }

    SQObjectPtr *stack = &v->_stack._vals[v->_stackbase];
    if(!sqjit_native_precheck(native, stack)) {
        return SQ_JIT_EXEC_NOT_EXECUTED;
    }
    SQJitNativeObjectFn fn = (SQJitNativeObjectFn)native->_native_entry;
    SQObjectPtr result;
    SQInteger status = fn(stack, &result, closure);
    if(status == SQ_JIT_NATIVE_GUARD_FAILED) {
        if(sqjit_trace_stats_enabled) {
            sqjit_diag_stats.proto_exec_guard_failures++;
            SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
            if(entry) {
                entry->exec_guard_failures++;
            }
        }
        sqjit_proto_note_guard_fail(proto, proto->_jit);
        return SQ_JIT_EXEC_NOT_EXECUTED;
    }
    if(status != SQ_JIT_NATIVE_RETURNED) {
        return SQ_JIT_EXEC_ERROR;
    }
    stack[0] = result;
    if(v->Return(1, 0, v->temp_reg)) {
        _Swap(outres, v->temp_reg);
        if(sqjit_trace_enabled && !native->_native_trace_executed) {
            native->_native_trace_executed = true;
            scprintf(_SC("[sqjit] executed native proto '%s' as root\n"), sqjit_proto_name(proto));
        }
        if(sqjit_trace_stats_enabled) {
            sqjit_diag_stats.proto_exec_successes++;
            SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
            if(entry) {
                entry->exec_successes++;
            }
        }
        sqjit_proto_note_success(proto->_jit);
        return SQ_JIT_EXEC_ROOT_RETURNED;
    }
    if(sqjit_trace_enabled && !native->_native_trace_executed) {
        native->_native_trace_executed = true;
        scprintf(_SC("[sqjit] executed native proto '%s'\n"), sqjit_proto_name(proto));
    }
    if(sqjit_trace_stats_enabled) {
        sqjit_diag_stats.proto_exec_successes++;
        SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
        if(entry) {
            entry->exec_successes++;
        }
    }
    sqjit_proto_note_success(proto->_jit);
    return SQ_JIT_EXEC_FRAME_RETURNED;
}

void sqjit_release_proto(SQFunctionProto *proto)
{
    if(!proto || !proto->_jit) {
        return;
    }
    if(proto->_jit->_loop_entry) {
        sqjit_backend_native_free(proto->_jit->_loop_entry, proto->_jit->_loop_native_size);
        proto->_jit->_loop_entry = NULL;
        proto->_jit->_loop_native_size = 0;
    }
    if(proto->_jit->_entry) {
        SQJitNative *native = (SQJitNative *)proto->_jit->_entry;
        sqjit_backend_native_free(native->_native_entry, native->_native_size);
        native->_native_entry = NULL;
        native->_native_size = 0;
        sq_vm_free(native, sizeof(SQJitNative));
        proto->_jit->_entry = NULL;
    }
    sq_vm_free(proto->_jit, sizeof(SQJitProto));
    proto->_jit = NULL;
}
