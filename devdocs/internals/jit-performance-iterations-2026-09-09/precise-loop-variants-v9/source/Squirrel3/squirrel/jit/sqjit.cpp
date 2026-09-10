/*  see copyright notice in squirrel.h */
#include "sqpcheader.h"
#include "sqfuncproto.h"
#include "sqvm.h"
#include "sqclosure.h"
#include "sqjit.h"
#include "sqjit_backend.h"
#include "sqjit_platform.h"
#include "sqjit_specialize.h"
#include "sqjit_context.h"
#include "sqjit_diagnostics.h"
#include "sqjit_policy.h"
#include "sqjit_object_plan.h"
#include <new>

static SQJitProto *sqjit_ensure_proto(SQFunctionProto *proto)
{
    if(!proto->_jit) {
        void *storage = sq_vm_malloc(sizeof(SQJitProto));
        if(storage) proto->_jit = new (storage) SQJitProto();
        if(!proto->_jit) {
            return NULL;
        }
    }
    return proto->_jit;
}

static bool sqjit_compile_proto(SQFunctionProto *proto, SQObjectPtr *entry_stack, SQClosure *closure,
    SQJitProto *jit)
{
    SQJitContext &ctx = sqjit_context(proto->_sharedstate);
    if(!entry_stack || jit->_entry || jit->_eligibility == SQ_JIT_NEVER) {
        return jit->_entry != NULL;
    }

    if(ctx.collect_stats) {
        ctx.Diagnostics().total.proto_compile_attempts++;
        SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
        if(entry) {
            entry->compile_attempts++;
        }
    }

    void *storage = sq_vm_malloc(sizeof(SQJitNative));
    SQJitNative *native = storage ? new (storage) SQJitNative() : NULL;
    if(!native) {
        SQJitCompileResult failure = {false, true, SQ_JIT_BACKEND_NONE,
            SQ_JIT_REJECT_RESOURCE, -1, "compiled artifact allocation failed"};
        sqjit_diag_record_reject(proto, failure);
        jit->_fail_count++;
        if(ctx.collect_stats) {
            ctx.Diagnostics().total.proto_compile_failures++;
            SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
            if(entry) {
                entry->compile_failures++;
                entry->compile_result = failure;
            }
        }
        return false;
    }

    native->_ninstructions = proto->_ninstructions;

    SQJitCompileResult result = sqjit_compile_specialized_proto(proto, entry_stack, native) ?
        SQJitCompileResult::Success(SQ_JIT_BACKEND_CPP) :
        SQJitCompileResult{false, false, SQ_JIT_BACKEND_NONE, SQ_JIT_REJECT_OTHER, -1, NULL};
    if(!result) {
        // Proven allocation elimination and inlining take precedence over
        // materialized native calls. Otherwise warming a constructor/method
        // first can permanently select an entry that repeatedly guards out,
        // preventing the same pure object program from ever scalarizing.
        std::unique_ptr<SQJitObjectPlan> plan(new SQJitObjectPlan());
        if(plan->Build(proto,entry_stack,closure)) {
            plan->body._scalarized = true;
            plan->body._ninstructions = plan->Lowered()->_ninstructions;
            SQJitCompileResult lowered = sqjit_backend_compile_proto(plan->Lowered(),entry_stack,closure,&plan->body);
            if(lowered) {
                native->_code.SetStub((void *)sqjit_object_plan_entry);
                native->_stack_live_slots = plan->body._stack_live_slots;
                native->_stack_storage_slots = plan->body._stack_storage_slots;
                native->_object_plan = plan.release();
                result = lowered;
            }
        }
        if(!result) {
            result = sqjit_backend_compile_proto(proto, entry_stack, closure, native, true);
            if(!result && plan->retryable) result.retryable = true;
        }
    }
    if(ctx.collect_stats) {
        SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
        if(entry) entry->compile_result = result;
    }
    if(!result) {
        sqjit_diag_record_reject(proto, result);
        native->~SQJitNative();
        sq_vm_free(native, sizeof(SQJitNative));
        bool transient_reject = result.retryable;
        jit->_fail_count++;
        if(transient_reject && jit->_fail_count < SQ_JIT_TRANSIENT_RETRY_LIMIT) {
            jit->_hot_count = 0;
        }
        else {
            jit->_eligibility = SQ_JIT_NEVER;
        }
        if(ctx.collect_stats) {
            ctx.Diagnostics().total.proto_compile_failures++;
            SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
            if(entry) {
                entry->compile_failures++;
            }
        }
        if(ctx.trace) {
            scprintf(_SC("[sqjit] proto '%s' is not native eligible\n"), sqjit_diag_proto_name(proto));
        }
        return false;
    }

    jit->_entry = native;
    jit->_eligibility = SQ_JIT_NATIVE_CANDIDATE;
    jit->_version++;
    if(ctx.collect_stats) {
        ctx.Diagnostics().total.proto_compile_successes++;
        SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
        if(entry) {
            entry->compile_successes++;
        }
    }

    if(ctx.trace) {
        scprintf(_SC("[sqjit] compiled native proto '%s'\n"), sqjit_diag_proto_name(proto));
        if(native->_requires_vm_frame)
            scprintf(_SC("[sqjit] precise side-exit entry '%s'\n"), sqjit_diag_proto_name(proto));
        if(native->_object_plan) {
            const SQJitObjectPlan &plan = *native->_object_plan;
            scprintf(_SC("[sqjit] scalarized '%s': %d allocation sites, %d calls, %d scalar instructions\n"),
                sqjit_diag_proto_name(proto), (SQInt32)plan.allocations_removed,
                (SQInt32)plan.calls_inlined, (SQInt32)plan.Lowered()->_ninstructions);
        }
    }
    return true;
}

bool sqjit_runtime_enabled(SQVM *v)
{
    if(!v) { return false; }
    SQJitContext &ctx = sqjit_context(v->_sharedstate);
    return ctx.enabled;
}

SQInteger sqjit_hot_threshold(SQVM *v)
{
    if(!v) { return 0; }
    SQJitContext &ctx = sqjit_context(v->_sharedstate);
    return ctx.threshold;
}

void sqjit_on_function_enter(SQVM *v, SQFunctionProto *proto)
{
    if(!v) { return; }
    SQJitContext &ctx = sqjit_context(v->_sharedstate);
    if(!ctx.enabled || !proto) {
        return;
    }
    if(ctx.collect_stats) {
        ctx.Diagnostics().total.proto_enters++;
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
    if(jit->_hot_count >= ctx.threshold && !jit->_entry && jit->_eligibility != SQ_JIT_NEVER) {
        if(ctx.collect_stats) {
            ctx.Diagnostics().total.proto_hot++;
            SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
            if(entry) {
                entry->hot++;
            }
        }
        if(ctx.trace) {
            scprintf(_SC("[sqjit] hot proto '%s' reached JIT threshold\n"),
                sqjit_diag_proto_name(proto));
        }
        SQClosure *closure = (v && v->ci) ? _closure(v->ci->_closure) : NULL;
        SQObjectPtr *entry_stack = (v && v->ci) ? &v->_stack._vals[v->_stackbase] : NULL;
        sqjit_compile_proto(proto, entry_stack, closure, jit);
    }
}

bool sqjit_native_call_fits_stack(SQVM *v, SQObjectPtr *stack, SQInteger slots, SQInteger live_slots)
{
    if(!stack || slots <= 0 || slots > MAX_FUNC_STACKSIZE) return false;
    if(live_slots < -1) return false;
    if(live_slots < 0) live_slots = slots;
    if(live_slots > slots) return false;
    if(!v) return true;
    const uintptr_t address = (uintptr_t)stack;
    const uintptr_t base = (uintptr_t)v->_stack._vals;
    // Compare integer addresses, not unrelated C++ pointers. Include the
    // one-past address so it cannot be mistaken for a separate raw buffer.
    if(address < base) return true;
    const uintptr_t bytes = address - base;
    if(bytes > (uintptr_t)v->_stack.size() * sizeof(SQObjectPtr)) return true;
    if(bytes % sizeof(SQObjectPtr) || v->_top < 0) return false;
    const SQUnsignedInteger first = bytes / sizeof(SQObjectPtr);
    if(first > v->_stack.size() || (SQUnsignedInteger)slots > v->_stack.size() - first) return false;
    return live_slots == 0 || (first <= (SQUnsignedInteger)v->_top &&
        (SQUnsignedInteger)live_slots <= (SQUnsignedInteger)v->_top - first);
}

bool sqjit_try_execute_closure(SQVM *v, SQClosure *closure, SQObjectPtr *stack, SQInteger nargs, SQObjectPtr &outres)
{
    if(!v) { return false; }
    SQJitContext &ctx = sqjit_context(v->_sharedstate);
    if(!ctx.enabled || !closure || !stack || v->_debughook) {
        return false;
    }
    ctx.proto_tick++;
    if(ctx.collect_stats) {
        ctx.Diagnostics().total.direct_call_attempts++;
    }

    SQFunctionProto *proto = closure->_function;
    if(ctx.collect_stats && proto) {
        SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
        if(entry) {
            entry->direct_attempts++;
        }
    }
    if(!proto || proto->_bgenerator || proto->_varparams || proto->_ndefaultparams != 0 ||
        proto->_nparameters != nargs || !proto->_jit || !proto->_jit->_entry ||
        proto->_jit->_entry->_requires_vm_frame ||
        !sqjit_native_call_fits_stack(v, stack,
            proto->_jit->_entry->_stack_storage_slots < 0 ? proto->_stacksize : proto->_jit->_entry->_stack_storage_slots,
            proto->_jit->_entry->_stack_live_slots)) {
        if(ctx.collect_stats) {
            ctx.Diagnostics().total.direct_call_misses++;
            SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
            if(entry) {
                entry->direct_misses++;
            }
        }
        return false;
    }
    if(sqjit_proto_backoff_active(proto, proto->_jit)) {
        if(ctx.collect_stats) {
            ctx.Diagnostics().total.direct_call_misses++;
            SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
            if(entry) {
                entry->direct_misses++;
            }
        }
        return false;
    }

    SQJitNative *native = proto->_jit->_entry;
    if(!native || native->_ninstructions != proto->_ninstructions || !native->_code.Entry()) {
        if(ctx.collect_stats) {
            ctx.Diagnostics().total.direct_call_misses++;
            SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
            if(entry) {
                entry->direct_misses++;
            }
        }
        return false;
    }
    if(!sqjit_native_precheck(native, stack)) {
        if(ctx.collect_stats) {
            ctx.Diagnostics().total.direct_call_misses++;
            ctx.Diagnostics().total.direct_call_guard_failures++;
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

    SQJitNativeObjectFn fn = (SQJitNativeObjectFn)native->_code.Entry();
    SQObjectPtr result;
    SQInteger status;
    { SQJitExecutionScope execution(ctx, v); status = fn(stack, &result, closure); }
    if(status != SQ_JIT_NATIVE_RETURNED) {
        if(ctx.collect_stats) {
            ctx.Diagnostics().total.direct_call_misses++;
            SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
            if(entry) {
                entry->direct_misses++;
            }
            if(status == SQ_JIT_NATIVE_GUARD_FAILED) {
                ctx.Diagnostics().total.direct_call_guard_failures++;
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
    if(ctx.collect_stats) {
        ctx.Diagnostics().total.direct_call_successes++;
        SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
        if(entry) {
            entry->direct_successes++;
        }
    }
    if(ctx.trace && !native->_native_trace_executed) {
        native->_native_trace_executed = true;
        scprintf(_SC("[sqjit] executed native proto '%s' by direct call\n"), sqjit_diag_proto_name(proto));
    }
    return true;
}

bool sqjit_try_execute_current_loop(SQVM *v, SQInteger header_ip)
{
    if(!v) { return false; }
    SQJitContext &ctx = sqjit_context(v->_sharedstate);
#if !SQJIT_HAS_X64_NATIVE && !SQJIT_HAS_EXTERNAL_NATIVE
    (void)v;
    (void)header_ip;
    return false;
#else
    if(!ctx.enabled || !v->ci || v->_debughook) {
        return false;
    }
    ctx.loop_tick++;
    if(ctx.collect_stats) {
        ctx.Diagnostics().total.loop_try_attempts++;
    }

    SQClosure *closure = _closure(v->ci->_closure);
    SQFunctionProto *proto = closure->_function;
    if(!proto || proto->_bgenerator || header_ip < 0 || header_ip >= proto->_ninstructions) {
        return false;
    }
    if(ctx.collect_stats) {
        SQJitDiagLoopStats *entry = sqjit_diag_get_loop(proto, header_ip);
        if(entry) {
            entry->try_attempts++;
        }
    }

    SQInteger start_ip = -1;
    SQInteger end_ip = -1;
    SQInteger exit_ip = -1;
    SQJitProto *jit = proto->_jit;
    // A precise exit must execute the failing bytecode's remaining effects.
    // Legacy loop entries do not yet model JCMP temporary release, so they
    // cannot take over a continuation from this experimental frame tier.
    if(jit && jit->_entry && jit->_entry->_requires_vm_frame) return false;
    if(jit) {
        if(sqjit_loop_header_is_rejected(jit, header_ip)) {
            return false;
        }
        if(jit->_loop_header_ip == header_ip &&
            sqjit_loop_backoff_active(proto, jit, header_ip)) {
            return false;
        }
        if(jit->_loop_code.Entry()) {
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
        if(ctx.collect_stats) {
            ctx.Diagnostics().total.loop_find_failures++;
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

    if(jit->_loop_code.Entry() && jit->_loop_header_ip != header_ip) {
        return false;
    }

    if(!jit->_loop_code.Entry()) {
        jit->_loop_hot_count++;
        if(jit->_loop_hot_count < ctx.threshold) {
            return false;
        }
        if(ctx.trace) {
            scprintf(_SC("[sqjit] hot loop in proto '%s' reached JIT threshold at ip %d\n"),
                sqjit_diag_proto_name(proto), (SQInt32)header_ip);
        }
        if(ctx.collect_stats) {
            ctx.Diagnostics().total.loop_compile_attempts++;
            SQJitDiagLoopStats *entry = sqjit_diag_get_loop(proto, header_ip);
            if(entry) {
                entry->compile_attempts++;
            }
        }
        SQJitCompileResult result = sqjit_backend_compile_loop(proto,
            &v->_stack._vals[v->_stackbase], closure, start_ip, header_ip, end_ip, exit_ip, jit);
        if(ctx.collect_stats) {
            SQJitDiagLoopStats *entry = sqjit_diag_get_loop(proto, header_ip);
            if(entry) entry->compile_result = result;
        }
        if(!result) {
            sqjit_diag_record_reject(proto, result);
            jit->_loop_fail_count++;
            jit->_loop_header_ip = header_ip;
            jit->_loop_exit_ip = exit_ip;
            sqjit_loop_reject_header(jit, header_ip);
            if(ctx.trace) {
                scprintf(_SC("[sqjit] loop in proto '%s' at ip %d is not native eligible\n"),
                    sqjit_diag_proto_name(proto), (SQInt32)header_ip);
            }
            if(ctx.collect_stats) {
                ctx.Diagnostics().total.loop_compile_failures++;
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
        if(ctx.collect_stats) {
            ctx.Diagnostics().total.loop_compile_successes++;
            SQJitDiagLoopStats *entry = sqjit_diag_get_loop(proto, header_ip);
            if(entry) {
                entry->compile_successes++;
            }
        }
        if(ctx.trace) {
            scprintf(_SC("[sqjit] compiled native loop in proto '%s' ip %d..%d\n"),
                sqjit_diag_proto_name(proto), (SQInt32)header_ip, (SQInt32)end_ip);
        }
    }

execute_loop:
    SQInteger next_ip = header_ip;
    // The experimental second mapping never replaces a live mapping. Keep the
    // original backend rollback contract: retry only a GUARD_FAILED execution.
    const bool adapt = ctx.precise_exits && SQJIT_HAS_EXTERNAL_NATIVE;
    bool alternate = adapt && jit->_loop_alternate_code.Entry() && jit->_loop_prefer_alternate;
    auto execute = [&](SQJitCode &code) -> SQInteger {
        if(ctx.collect_stats) {
            ctx.Diagnostics().total.loop_exec_attempts++;
            SQJitDiagLoopStats *entry = sqjit_diag_get_loop(proto, header_ip);
            if(entry) entry->exec_attempts++;
        }
        next_ip = header_ip;
        SQJitNativeLoopFn fn = (SQJitNativeLoopFn)code.Entry();
        SQInteger status;
        { SQJitExecutionScope execution(ctx, v);
          status = fn(&v->_stack._vals[v->_stackbase], &next_ip, closure); }
        if(status != SQ_JIT_NATIVE_RETURNED && ctx.collect_stats) {
            ctx.Diagnostics().total.loop_exec_guard_failures++;
            SQJitDiagLoopStats *entry = sqjit_diag_get_loop(proto, header_ip);
            if(entry) entry->exec_guard_failures++;
        }
        return status;
    };
    SQInteger status = execute(alternate ? jit->_loop_alternate_code : jit->_loop_code);
    if(status == SQ_JIT_NATIVE_GUARD_FAILED && adapt) {
        if(jit->_loop_alternate_code.Entry()) {
            alternate = !alternate;
            status = execute(alternate ? jit->_loop_alternate_code : jit->_loop_code);
        }
        else if(jit->_loop_has_succeeded && !jit->_loop_alternate_attempted) {
            // One extra compilation after demonstrated success, never an
            // unbounded recompile loop on unsupported inputs or allocation failure.
            jit->_loop_alternate_attempted = true;
            if(sqjit_backend_loop_find_region(proto,header_ip,&start_ip,&end_ip,&exit_ip)) {
                if(ctx.collect_stats) {
                    ctx.Diagnostics().total.loop_compile_attempts++;
                    SQJitDiagLoopStats *entry = sqjit_diag_get_loop(proto,header_ip);
                    if(entry) entry->compile_attempts++;
                }
                SQJitCompileResult result = {false,true,SQ_JIT_BACKEND_AARCH64,
                    SQ_JIT_REJECT_RESOURCE,-1,"alternate loop allocation failed"};
                try {
                    result = sqjit_backend_compile_loop(proto,
                        &v->_stack._vals[v->_stackbase],closure,start_ip,header_ip,end_ip,exit_ip,jit,
                        &jit->_loop_alternate_code);
                }
                catch(const std::bad_alloc &) {
                    // Optional recompilation must not turn a replayable guard
                    // into an allocation exception. This mapping has never run;
                    // cleanup also covers failure while retaining dependencies.
                    jit->_loop_alternate_code.Reset();
                }
                if(ctx.collect_stats) {
                    SQJitDiagLoopStats *entry = sqjit_diag_get_loop(proto,header_ip);
                    if(result) {
                        ctx.Diagnostics().total.loop_compile_successes++;
                        if(entry) entry->compile_successes++;
                    }
                    else {
                        ctx.Diagnostics().total.loop_compile_failures++;
                        if(entry) entry->compile_failures++;
                    }
                }
                if(result) {
                    ++jit->_version;
                    alternate = true;
                    status = execute(jit->_loop_alternate_code);
                    if(ctx.trace) scprintf(_SC("[sqjit] compiled alternate loop in proto '%s' at ip %d\n"),
                        sqjit_diag_proto_name(proto),(SQInt32)header_ip);
                }
                else sqjit_diag_record_reject(proto,result);
            }
        }
    }
    if(status != SQ_JIT_NATIVE_RETURNED) {
        if(status == SQ_JIT_NATIVE_GUARD_FAILED) sqjit_loop_note_guard_fail(proto,jit,header_ip);
        return false;
    }
    if(next_ip < 0 || next_ip > proto->_ninstructions) return false;
    jit->_loop_has_succeeded = true;
    jit->_loop_prefer_alternate = alternate;

    v->ci->_ip = &proto->_instructions[next_ip];
    if(ctx.collect_stats) {
        ctx.Diagnostics().total.loop_exec_successes++;
        SQJitDiagLoopStats *entry = sqjit_diag_get_loop(proto, header_ip);
        if(entry) {
            entry->exec_successes++;
        }
    }
    sqjit_loop_note_success(jit);
    if(ctx.trace && !jit->_loop_trace_executed) {
        jit->_loop_trace_executed = true;
        scprintf(_SC("[sqjit] executed native loop in proto '%s' at ip %d\n"),
            sqjit_diag_proto_name(proto), (SQInt32)header_ip);
    }
    return true;
#endif
}

SQJitExecResult sqjit_try_execute_current(SQVM *v, SQObjectPtr &outres)
{
    if(!v) { return SQ_JIT_EXEC_NOT_EXECUTED; }
    SQJitContext &ctx = sqjit_context(v->_sharedstate);
    if(!ctx.enabled || !v->ci || v->_debughook) {
        return SQ_JIT_EXEC_NOT_EXECUTED;
    }
    ctx.proto_tick++;
    if(ctx.collect_stats) {
        ctx.Diagnostics().total.proto_exec_attempts++;
    }

    SQClosure *closure = _closure(v->ci->_closure);
    SQFunctionProto *proto = closure->_function;
    if(ctx.collect_stats && proto) {
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

    SQJitNative *native = proto->_jit->_entry;
    if(!native || native->_ninstructions != proto->_ninstructions || !native->_code.Entry()) {
        return SQ_JIT_EXEC_NOT_EXECUTED;
    }

    SQObjectPtr *stack = &v->_stack._vals[v->_stackbase];
    if(!sqjit_native_call_fits_stack(v, stack,
        native->_stack_storage_slots < 0 ? proto->_stacksize : native->_stack_storage_slots,
        native->_stack_live_slots) || !sqjit_native_precheck(native, stack)) {
        return SQ_JIT_EXEC_NOT_EXECUTED;
    }
    SQJitNativeObjectFn fn = (SQJitNativeObjectFn)native->_code.Entry();
    SQObjectPtr result;
    SQInteger status;
    const SQInteger frame_depth = v->_callsstacksize, frame_base = v->_stackbase;
    { SQJitExecutionScope execution(ctx, v); status = fn(stack, &result, closure); }
    if(status == SQ_JIT_NATIVE_SIDE_EXIT) {
        // A native exit has committed effects. An invalid continuation is an
        // execution error, never an invitation to replay from the beginning.
        if(!native->_requires_vm_frame || native->_scalarized || native->_object_plan ||
            sq_type(result) != OT_INTEGER || _integer(result) < 0 ||
            _integer(result) >= proto->_ninstructions || !v->ci ||
            v->_callsstacksize != frame_depth || v->_stackbase != frame_base ||
            sq_type(v->ci->_closure) != OT_CLOSURE || _closure(v->ci->_closure) != closure) {
            v->Raise_Error(_SC("invalid native side exit"));
            return SQ_JIT_EXEC_ERROR;
        }
        v->ci->_ip = &proto->_instructions[_integer(result)];
        if(ctx.collect_stats) {
            ctx.Diagnostics().total.proto_exec_side_exits++;
            SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
            if(entry) entry->exec_side_exits++;
        }
        sqjit_proto_note_guard_fail(proto, proto->_jit);
        return SQ_JIT_EXEC_RESUMED;
    }
    if(status == SQ_JIT_NATIVE_GUARD_FAILED) {
        if(ctx.collect_stats) {
            ctx.Diagnostics().total.proto_exec_guard_failures++;
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
        if(ctx.trace && !native->_native_trace_executed) {
            native->_native_trace_executed = true;
            scprintf(_SC("[sqjit] executed native proto '%s' as root\n"), sqjit_diag_proto_name(proto));
        }
        if(ctx.collect_stats) {
            ctx.Diagnostics().total.proto_exec_successes++;
            SQJitDiagProtoStats *entry = sqjit_diag_get_proto(proto);
            if(entry) {
                entry->exec_successes++;
            }
        }
        sqjit_proto_note_success(proto->_jit);
        return SQ_JIT_EXEC_ROOT_RETURNED;
    }
    if(ctx.trace && !native->_native_trace_executed) {
        native->_native_trace_executed = true;
        scprintf(_SC("[sqjit] executed native proto '%s'\n"), sqjit_diag_proto_name(proto));
    }
    if(ctx.collect_stats) {
        ctx.Diagnostics().total.proto_exec_successes++;
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
    if(!proto) return;
    sqjit_diag_forget_proto(proto);
    if(proto->_jit) {
        proto->_jit->~SQJitProto();
        sq_vm_free(proto->_jit, sizeof(SQJitProto));
        proto->_jit = NULL;
    }
}
