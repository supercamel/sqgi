/* sqgi_async.c — JS-style async/await for SQGI.
 *
 * Public Squirrel surface (under root.sqgi):
 *
 *   sqgi.Task()                  — new pending Task.
 *   sqgi.sleep(ms)               — Task that resolves with elapsed ms.
 *   sqgi.timeout_add(ms, fn)     — low-level GLib timeout. Returns source id.
 *   sqgi.source_remove(id)       — cancel a timeout source.
 *
 *   On a Task t:
 *     t.resolve(v)   — fulfill with v; wakes waiters.
 *     t.reject(e)    — reject with e; wakes waiters.
 *     t.then(fn)     — register continuation; returns a derived Task.
 *     t.catch(fn)    — register rejection handler; returns a derived Task.
 *
 * The compiler emits `::sqgi.__make_async(<closure>)` for `async function`
 * literals. The wrapped closure, when called with `(this, ...args)`,
 *   1. creates a Task,
 *   2. spawns a fresh Squirrel thread,
 *   3. calls the inner closure on the thread,
 *   4. resolves the Task with the body's return value when it completes
 *      (synchronously or after suspending on `await`),
 *   5. rejects the Task if the body throws.
 *
 * `await x` is sugar for `::sqgi.__await(x)`:
 *   - integer: suspend for that many ms, resume with elapsed ms.
 *   - Task: suspend until settled; resume with result, or throw on rejection.
 */

#include "sqgi_async.h"
#include "sqgi_vm.h"
#include <string.h>
#include <stdio.h>
#include <gio/gio.h>

/* ── Forward decls ───────────────────────────────────────────────────────── */

static void    sqgi_task_init     (HSQUIRRELVM v, SQInteger idx);
static SQBool  sqgi_idx_is_task   (HSQUIRRELVM v, SQInteger idx);
static void    sqgi_task_settle   (HSQUIRRELVM v, SQInteger task_idx, SQInteger value_idx, SQBool is_error);
static void    sqgi_async_check_complete(HSQUIRRELVM thread_v);

/* Hidden delegate carrying t.resolve/t.reject/t.then/t.catch methods. */
static HSQOBJECT g_task_delegate;
static SQBool    g_task_delegate_inited = SQFalse;

/* HSQOBJECT(thread) → SQVM pointer. */
static inline HSQUIRRELVM sqgi_obj_thread(HSQOBJECT *obj)
{
    return (HSQUIRRELVM)obj->_unVal.pThread;
}

/* ── Async binding: per-thread state for async function wrappers ─────── */

typedef struct {
    HSQUIRRELVM parent_v;
    HSQOBJECT   thread_ref;
    HSQOBJECT   task_ref;
} SqgiAsyncBinding;

static GHashTable *g_async_bindings = NULL; /* HSQUIRRELVM → SqgiAsyncBinding* */

static void sqgi_async_binding_install(HSQUIRRELVM child_v, SqgiAsyncBinding *b)
{
    if (!g_async_bindings) g_async_bindings = g_hash_table_new(g_direct_hash, g_direct_equal);
    g_hash_table_insert(g_async_bindings, child_v, b);
}

static SqgiAsyncBinding* sqgi_async_binding_get(HSQUIRRELVM child_v)
{
    return g_async_bindings ? g_hash_table_lookup(g_async_bindings, child_v) : NULL;
}

static void sqgi_async_binding_free(SqgiAsyncBinding *b)
{
    if (!b) return;
    sq_release(b->parent_v, &b->task_ref);
    sq_release(b->parent_v, &b->thread_ref);
    g_hash_table_remove(g_async_bindings, b);
    g_free(b);
}

/* ── Task helpers ────────────────────────────────────────────────────────── */

static SQBool sqgi_idx_is_task(HSQUIRRELVM v, SQInteger idx)
{
    if (sq_gettype(v, idx) != OT_TABLE) return SQFalse;
    SQInteger top = sq_gettop(v);
    sq_push(v, idx);
    sq_pushstring(v, "__sqgi_task", -1);
    if (SQ_FAILED(sq_rawget(v, -2))) { sq_settop(v, top); return SQFalse; }
    SQBool b = SQFalse;
    if (sq_gettype(v, -1) == OT_BOOL) sq_getbool(v, -1, &b);
    sq_settop(v, top);
    return b;
}

static SQBool sqgi_task_get_bool(HSQUIRRELVM v, SQInteger task_idx, const char *key, SQBool *out)
{
    SQInteger top = sq_gettop(v);
    sq_push(v, task_idx);
    sq_pushstring(v, key, -1);
    if (SQ_FAILED(sq_rawget(v, -2))) { sq_settop(v, top); return SQFalse; }
    SQBool ok = SQ_SUCCEEDED(sq_getbool(v, -1, out));
    sq_settop(v, top);
    return ok;
}

static SQBool sqgi_task_get_obj(HSQUIRRELVM v, SQInteger task_idx, const char *key, HSQOBJECT *out)
{
    SQInteger top = sq_gettop(v);
    sq_push(v, task_idx);
    sq_pushstring(v, key, -1);
    if (SQ_FAILED(sq_rawget(v, -2))) { sq_settop(v, top); return SQFalse; }
    sq_resetobject(out);
    sq_getstackobj(v, -1, out);
    sq_settop(v, top);
    return SQTrue;
}

static void sqgi_task_init(HSQUIRRELVM v, SQInteger idx)
{
    SQInteger top = sq_gettop(v);
    if (idx < 0) idx = top + idx + 1;

    sq_push(v, idx);
    sq_pushstring(v, "__sqgi_task", -1);  sq_pushbool(v, SQTrue);  sq_rawset(v, -3);
    sq_pushstring(v, "__done", -1);       sq_pushbool(v, SQFalse); sq_rawset(v, -3);
    sq_pushstring(v, "__has_error", -1);  sq_pushbool(v, SQFalse); sq_rawset(v, -3);
    sq_pushstring(v, "__result", -1);     sq_pushnull(v);          sq_rawset(v, -3);
    sq_pushstring(v, "__error", -1);      sq_pushnull(v);          sq_rawset(v, -3);
    sq_pushstring(v, "__waiters", -1);    sq_newarray(v, 0);       sq_rawset(v, -3);
    sq_pushstring(v, "__rejection_handled", -1); sq_pushbool(v, SQFalse); sq_rawset(v, -3);

    if (g_task_delegate_inited) {
        sq_pushobject(v, g_task_delegate);
        sq_setdelegate(v, -2);
    }
    sq_settop(v, top);
}

static SQInteger sq_fn_task_new(HSQUIRRELVM v)
{
    sq_newtable(v);
    sqgi_task_init(v, -1);
    return 1;
}

/* ── Wake jobs (deferred to GLib idle) ───────────────────────────────────── */

typedef struct {
    HSQUIRRELVM parent_v;
    HSQOBJECT   thread_ref;   /* HSQOBJECT of thread to wake */
    HSQOBJECT   value;        /* result or error to push */
    SQBool      is_error;
} SqgiWakeJob;

static gboolean sqgi_wake_idle_cb(gpointer user_data)
{
    SqgiWakeJob *j = (SqgiWakeJob *)user_data;
    HSQUIRRELVM coro = sqgi_obj_thread(&j->thread_ref);

    if (coro && sq_getvmstate(coro) == SQ_VMSTATE_SUSPENDED) {
        SQRESULT wr;
        sq_pushobject(coro, j->value);
        if (j->is_error) {
            sq_throwobject(coro);
            wr = sq_wakeupvm(coro, SQFalse, SQTrue, SQFalse, SQTrue);
        } else {
            wr = sq_wakeupvm(coro, SQTrue, SQTrue, SQFalse, SQFalse);
        }

        if (SQ_FAILED(wr)) {
            /* Body threw out of the async function: reject the bound Task. */
            SqgiAsyncBinding *b = sqgi_async_binding_get(coro);
            if (b) {
                sq_getlasterror(coro);
                HSQOBJECT err; sq_resetobject(&err);
                sq_getstackobj(coro, -1, &err);
                sq_pop(coro, 1);

                HSQUIRRELVM parent = b->parent_v;
                sq_pushobject(parent, b->task_ref);
                sq_pushobject(parent, err);
                sqgi_task_settle(parent, -2, -1, SQTrue);
                sq_pop(parent, 2);

                sqgi_async_binding_free(b);
            }
        } else {
            sqgi_async_check_complete(coro);
        }
    }

    sq_release(j->parent_v, &j->thread_ref);
    sq_release(j->parent_v, &j->value);
    g_free(j);
    return G_SOURCE_REMOVE;
}

static void sqgi_wake_schedule(HSQUIRRELVM v, HSQOBJECT *thread_ref, HSQOBJECT *value, SQBool is_error)
{
    /* Always anchor the wake job to the root VM. The caller `v` may be a
     * coroutine thread that gets freed before the idle fires — using it for
     * later sq_release would UAF inside _ss(v). */
    HSQUIRRELVM rv = sqgi_root_vm(v);
    SqgiWakeJob *j = g_new0(SqgiWakeJob, 1);
    j->parent_v   = rv;
    j->thread_ref = *thread_ref;
    j->value      = *value;
    j->is_error   = is_error;
    sq_addref(rv, &j->thread_ref);
    sq_addref(rv, &j->value);
    g_idle_add(sqgi_wake_idle_cb, j);
}

/* Continuation job for t.then / t.catch. */
typedef struct {
    HSQUIRRELVM parent_v;
    HSQOBJECT   handler_succ;  /* may be null → propagate */
    HSQOBJECT   handler_rej;   /* may be null → propagate */
    HSQOBJECT   downstream;
    HSQOBJECT   value;
    SQBool      is_error;
} SqgiThenJob;

static gboolean sqgi_then_idle_cb(gpointer user_data)
{
    SqgiThenJob *j = (SqgiThenJob *)user_data;
    HSQUIRRELVM v = j->parent_v;
    SQInteger top = sq_gettop(v);

    HSQOBJECT *use = j->is_error ? &j->handler_rej : &j->handler_succ;

    if (sq_isnull(*use)) {
        /* No applicable handler → propagate unchanged. */
        sq_pushobject(v, j->downstream);
        sq_pushobject(v, j->value);
        sqgi_task_settle(v, -2, -1, j->is_error);
        sq_settop(v, top);
    } else {
        sq_pushobject(v, *use);
        SQInteger nparams = -1, nfreevars = 0;
        sq_getclosureinfo(v, -1, &nparams, &nfreevars);
        sq_pop(v, 1);

        sq_pushobject(v, *use);
        sq_pushroottable(v);
        SQInteger call_args = 1;
        if (nparams < 0 || nparams >= 2) {
            sq_pushobject(v, j->value);
            call_args = 2;
        }
        if (SQ_SUCCEEDED(sq_call(v, call_args, SQTrue, SQFalse))) {
            sq_pushobject(v, j->downstream);
            sq_push(v, -2); /* result */
            sqgi_task_settle(v, -2, -1, SQFalse);
            sq_settop(v, top);
        } else {
            HSQOBJECT err; sq_resetobject(&err);
            sq_getlasterror(v);
            sq_getstackobj(v, -1, &err);
            sq_settop(v, top);
            sq_pushobject(v, j->downstream);
            sq_pushobject(v, err);
            sqgi_task_settle(v, -2, -1, SQTrue);
            sq_settop(v, top);
        }
    }

    sq_release(v, &j->handler_succ);
    sq_release(v, &j->handler_rej);
    sq_release(v, &j->downstream);
    sq_release(v, &j->value);
    g_free(j);
    return G_SOURCE_REMOVE;
}

/* ── Unhandled rejection reporting ───────────────────────────────────────── */

typedef struct {
    HSQUIRRELVM parent_v;
    HSQOBJECT   task_ref;
} SqgiUnhandledJob;

static gboolean sqgi_unhandled_idle_cb(gpointer ud)
{
    SqgiUnhandledJob *j = (SqgiUnhandledJob *)ud;
    HSQUIRRELVM v = j->parent_v;
    SQInteger top = sq_gettop(v);
    sq_pushobject(v, j->task_ref);
    SQBool handled = SQFalse;
    sqgi_task_get_bool(v, -1, "__rejection_handled", &handled);
    if (!handled) {
        HSQOBJECT err; sq_resetobject(&err);
        sqgi_task_get_obj(v, -1, "__error", &err);
        sq_pushobject(v, err);
        sq_tostring(v, -1);
        const SQChar *msg = NULL;
        sq_getstring(v, -1, &msg);
        fprintf(stderr, "[sqgi] Unhandled promise rejection: %s\n",
                msg ? msg : "(unknown)");
        fflush(stderr);
        sq_pop(v, 2);
    }
    sq_settop(v, top);
    sq_release(v, &j->task_ref);
    g_free(j);
    return G_SOURCE_REMOVE;
}

static void sqgi_task_mark_rejection_handled(HSQUIRRELVM v, SQInteger task_idx)
{
    SQInteger top = sq_gettop(v);
    if (task_idx < 0) task_idx = top + task_idx + 1;
    sq_push(v, task_idx);
    sq_pushstring(v, "__rejection_handled", -1);
    sq_pushbool(v, SQTrue);
    sq_rawset(v, -3);
    sq_settop(v, top);
}

/* ── Settle a Task: set state + dispatch waiters ────────────────────────── */

static void sqgi_task_settle(HSQUIRRELVM v, SQInteger task_idx, SQInteger value_idx, SQBool is_error)
{
    SQInteger top = sq_gettop(v);
    if (task_idx  < 0) task_idx  = top + task_idx  + 1;
    if (value_idx < 0) value_idx = top + value_idx + 1;

    SQBool already = SQFalse;
    sqgi_task_get_bool(v, task_idx, "__done", &already);
    if (already) return;

    sq_push(v, task_idx);
    sq_pushstring(v, "__done", -1);      sq_pushbool(v, SQTrue);    sq_rawset(v, -3);
    sq_pushstring(v, "__has_error", -1); sq_pushbool(v, is_error);  sq_rawset(v, -3);
    sq_pushstring(v, is_error ? "__error" : "__result", -1);
    sq_push(v, value_idx); sq_rawset(v, -3);
    sq_pop(v, 1); /* pop task */

    /* Capture value as HSQOBJECT for waiter dispatch. */
    HSQOBJECT value_obj; sq_resetobject(&value_obj);
    sq_getstackobj(v, value_idx, &value_obj);

    /* Walk waiters. */
    sq_push(v, task_idx);
    sq_pushstring(v, "__waiters", -1);
    if (SQ_FAILED(sq_rawget(v, -2))) { sq_settop(v, top); return; }

    SQInteger nw = sq_getsize(v, -1);
    for (SQInteger i = 0; i < nw; i++) {
        sq_pushinteger(v, i);
        if (SQ_FAILED(sq_get(v, -2))) continue;

        sq_pushstring(v, "kind", -1);
        if (SQ_FAILED(sq_get(v, -2))) { sq_pop(v, 1); continue; }
        const SQChar *kind = NULL;
        sq_getstring(v, -1, &kind);

        if (kind && strcmp(kind, "await") == 0) {
            sq_pop(v, 1); /* kind */
            sq_pushstring(v, "coro", -1);
            sq_get(v, -2);
            HSQOBJECT coro; sq_resetobject(&coro);
            sq_getstackobj(v, -1, &coro);
            sq_pop(v, 1);
            sqgi_wake_schedule(v, &coro, &value_obj, is_error);
        } else if (kind && strcmp(kind, "then") == 0) {
            sq_pop(v, 1); /* kind */
            HSQUIRRELVM rv = sqgi_root_vm(v);
            SqgiThenJob *j = g_new0(SqgiThenJob, 1);
            j->parent_v = rv;
            j->is_error = is_error;
            sq_resetobject(&j->handler_succ);
            sq_resetobject(&j->handler_rej);
            sq_resetobject(&j->downstream);

            sq_pushstring(v, "succ", -1);
            if (SQ_SUCCEEDED(sq_get(v, -2))) {
                sq_getstackobj(v, -1, &j->handler_succ);
                sq_addref(rv, &j->handler_succ);
                sq_pop(v, 1);
            }
            sq_pushstring(v, "rej", -1);
            if (SQ_SUCCEEDED(sq_get(v, -2))) {
                sq_getstackobj(v, -1, &j->handler_rej);
                sq_addref(rv, &j->handler_rej);
                sq_pop(v, 1);
            }
            sq_pushstring(v, "down", -1);
            if (SQ_SUCCEEDED(sq_get(v, -2))) {
                sq_getstackobj(v, -1, &j->downstream);
                sq_addref(rv, &j->downstream);
                sq_pop(v, 1);
            }
            j->value = value_obj;
            sq_addref(rv, &j->value);
            g_idle_add(sqgi_then_idle_cb, j);
        } else {
            sq_pop(v, 1); /* unknown kind */
        }
        sq_pop(v, 1); /* waiter */
    }

    sq_settop(v, top);

    /* Clear waiters list. */
    sq_push(v, task_idx);
    sq_pushstring(v, "__waiters", -1);
    sq_newarray(v, 0);
    sq_rawset(v, -3);
    sq_pop(v, 1);

    /* If rejected and no rejection handler attached yet, schedule a deferred
     * unhandled-rejection check (matches Node.js semantics: gives synchronous
     * follow-up code one tick to attach a .catch). */
    if (is_error) {
        SQBool handled = SQFalse;
        sqgi_task_get_bool(v, task_idx, "__rejection_handled", &handled);
        if (!handled) {
            HSQUIRRELVM rv = sqgi_root_vm(v);
            SqgiUnhandledJob *uj = g_new0(SqgiUnhandledJob, 1);
            uj->parent_v = rv;
            sq_resetobject(&uj->task_ref);
            sq_getstackobj(v, task_idx, &uj->task_ref);
            sq_addref(rv, &uj->task_ref);
            g_idle_add(sqgi_unhandled_idle_cb, uj);
        }
    }
}

/* ── Task delegate methods ───────────────────────────────────────────────── */

static SQInteger sq_fn_task_resolve_m(HSQUIRRELVM v)
{
    if (!sqgi_idx_is_task(v, 1)) return sq_throwerror(v, "resolve: not a Task");
    if (sq_gettop(v) < 2) sq_pushnull(v);
    sqgi_task_settle(v, 1, 2, SQFalse);
    sq_push(v, 1);
    return 1;
}

static SQInteger sq_fn_task_reject_m(HSQUIRRELVM v)
{
    if (!sqgi_idx_is_task(v, 1)) return sq_throwerror(v, "reject: not a Task");
    if (sq_gettop(v) < 2) return sq_throwerror(v, "reject: expected value");
    sqgi_task_settle(v, 1, 2, SQTrue);
    sq_push(v, 1);
    return 1;
}

/* Register a then-waiter on `task_idx`. Either succ_idx or rej_idx may be 0,
 * meaning "no handler — propagate". The downstream task is settled with the
 * handler's return value, or rejected if the handler throws, or passed
 * through unchanged if no applicable handler was provided. */
static SQInteger sqgi_register_then(HSQUIRRELVM v, SQInteger task_idx,
                                   SQInteger succ_idx, SQInteger rej_idx,
                                   SQInteger down_idx)
{
    /* Either handler registration counts as "handled" for the upstream:
     * even .then(succ) without a rejection handler propagates rejection to
     * the downstream task, which is itself watched for unhandled errors. */
    sqgi_task_mark_rejection_handled(v, task_idx);

    SQBool done = SQFalse;
    sqgi_task_get_bool(v, task_idx, "__done", &done);

    if (done) {
        SQBool err = SQFalse;
        sqgi_task_get_bool(v, task_idx, "__has_error", &err);
        HSQOBJECT value; sq_resetobject(&value);
        sqgi_task_get_obj(v, task_idx, err ? "__error" : "__result", &value);

        HSQUIRRELVM rv = sqgi_root_vm(v);
        SqgiThenJob *j = g_new0(SqgiThenJob, 1);
        j->parent_v = rv;
        j->is_error = err;
        sq_resetobject(&j->handler_succ);
        sq_resetobject(&j->handler_rej);
        sq_resetobject(&j->downstream);
        if (succ_idx > 0) {
            sq_getstackobj(v, succ_idx, &j->handler_succ);
            sq_addref(rv, &j->handler_succ);
        }
        if (rej_idx > 0) {
            sq_getstackobj(v, rej_idx, &j->handler_rej);
            sq_addref(rv, &j->handler_rej);
        }
        sq_getstackobj(v, down_idx, &j->downstream); sq_addref(rv, &j->downstream);
        j->value = value; sq_addref(rv, &j->value);
        g_idle_add(sqgi_then_idle_cb, j);
        return SQ_OK;
    }

    sq_push(v, task_idx);
    sq_pushstring(v, "__waiters", -1);
    if (SQ_FAILED(sq_rawget(v, -2))) { sq_pop(v, 1); return SQ_ERROR; }
    sq_newtable(v);
    sq_pushstring(v, "kind", -1); sq_pushstring(v, "then", -1); sq_rawset(v, -3);
    if (succ_idx > 0) {
        sq_pushstring(v, "succ", -1); sq_push(v, succ_idx); sq_rawset(v, -3);
    }
    if (rej_idx > 0) {
        sq_pushstring(v, "rej", -1); sq_push(v, rej_idx); sq_rawset(v, -3);
    }
    sq_pushstring(v, "down", -1); sq_push(v, down_idx); sq_rawset(v, -3);
    sq_arrayappend(v, -2);
    sq_pop(v, 2);
    return SQ_OK;
}

static SQInteger sq_fn_task_then_m(HSQUIRRELVM v)
{
    if (!sqgi_idx_is_task(v, 1)) return sq_throwerror(v, "then: not a Task");
    SQInteger top = sq_gettop(v);
    if (top < 2) return sq_throwerror(v, "then: expected handler");

    /* Optional second arg: rejection handler (Promise-style two-arg then). */
    SQBool has_rej = (top >= 3 &&
                      (sq_gettype(v, 3) == OT_CLOSURE ||
                       sq_gettype(v, 3) == OT_NATIVECLOSURE));

    sq_newtable(v);
    sqgi_task_init(v, -1);
    SQInteger down = sq_gettop(v);
    sqgi_register_then(v, 1, 2, has_rej ? 3 : 0, down);
    sq_push(v, down);
    return 1;
}

static SQInteger sq_fn_task_catch_m(HSQUIRRELVM v)
{
    if (!sqgi_idx_is_task(v, 1)) return sq_throwerror(v, "catch: not a Task");
    if (sq_gettop(v) < 2) return sq_throwerror(v, "catch: expected handler");

    sq_newtable(v);
    sqgi_task_init(v, -1);
    SQInteger down = sq_gettop(v);
    sqgi_register_then(v, 1, 0, 2, down);
    sq_push(v, down);
    return 1;
}

/* ── task.cancel(reason?) ────────────────────────────────────────────────── */

static SQInteger sq_fn_task_cancel_m(HSQUIRRELVM v)
{
    if (!sqgi_idx_is_task(v, 1)) return sq_throwerror(v, "cancel: not a Task");

    SQBool done = SQFalse;
    sqgi_task_get_bool(v, 1, "__done", &done);
    if (done) { sq_push(v, 1); return 1; }

    /* If the task tracks a GLib source id, remove it. */
    SQInteger top = sq_gettop(v);
    sq_push(v, 1);
    sq_pushstring(v, "__source_id", -1);
    if (SQ_SUCCEEDED(sq_rawget(v, -2))) {
        SQInteger sid = 0;
        if (SQ_SUCCEEDED(sq_getinteger(v, -1, &sid)) && sid > 0) {
            g_source_remove((guint)sid);
        }
        sq_pop(v, 1);
    }
    /* If the task carries a Gio.Cancellable, cancel it. The wrapper is
     * stored as an opaque GObject pointer in __cancellable_ptr (userpointer)
     * so we don't depend on the GI binding being loaded here. */
    sq_pushstring(v, "__cancellable_ptr", -1);
    if (SQ_SUCCEEDED(sq_rawget(v, -2))) {
        SQUserPointer up = NULL;
        if (SQ_SUCCEEDED(sq_getuserpointer(v, -1, &up)) && up != NULL) {
            g_cancellable_cancel((GCancellable *)up);
        }
        sq_pop(v, 1);
    }
    sq_settop(v, top);

    /* Build cancellation error: { __cancelled = true, reason = <arg or null> } */
    sq_newtable(v);
    sq_pushstring(v, "__cancelled", -1); sq_pushbool(v, SQTrue); sq_rawset(v, -3);
    sq_pushstring(v, "reason", -1);
    if (sq_gettop(v) >= 3) sq_push(v, 2); else sq_pushnull(v);
    sq_rawset(v, -3);

    sqgi_task_settle(v, 1, -1, SQTrue);
    sq_pop(v, 1); /* pop error table */
    sq_push(v, 1);
    return 1;
}

static void sqgi_task_delegate_init(HSQUIRRELVM v)
{
    if (g_task_delegate_inited) return;

    sq_newtable(v);

    sq_pushstring(v, "resolve", -1);
    sq_newclosure(v, sq_fn_task_resolve_m, 0);
    sq_setnativeclosurename(v, -1, "Task.resolve");
    sq_newslot(v, -3, SQFalse);

    sq_pushstring(v, "reject", -1);
    sq_newclosure(v, sq_fn_task_reject_m, 0);
    sq_setnativeclosurename(v, -1, "Task.reject");
    sq_newslot(v, -3, SQFalse);

    sq_pushstring(v, "then", -1);
    sq_newclosure(v, sq_fn_task_then_m, 0);
    sq_setnativeclosurename(v, -1, "Task.then");
    sq_newslot(v, -3, SQFalse);

    sq_pushstring(v, "catch", -1);
    sq_newclosure(v, sq_fn_task_catch_m, 0);
    sq_setnativeclosurename(v, -1, "Task.catch");
    sq_newslot(v, -3, SQFalse);

    sq_pushstring(v, "cancel", -1);
    sq_newclosure(v, sq_fn_task_cancel_m, 0);
    sq_setnativeclosurename(v, -1, "Task.cancel");
    sq_newslot(v, -3, SQFalse);

    sq_resetobject(&g_task_delegate);
    sq_getstackobj(v, -1, &g_task_delegate);
    sq_addref(v, &g_task_delegate);
    sq_pop(v, 1);

    g_task_delegate_inited = SQTrue;
}

/* ── timeout_add / source_remove ────────────────────────────────────────── */

typedef struct {
    HSQUIRRELVM v;
    HSQOBJECT   fn;
} SqgiTimeoutData;

static gboolean sqgi_timeout_cb(gpointer user_data)
{
    SqgiTimeoutData *d = (SqgiTimeoutData *)user_data;
    HSQUIRRELVM v = d->v;

    sq_pushobject(v, d->fn);
    sq_pushroottable(v);
    SQRESULT res = sq_call(v, 1, SQTrue, SQTrue);

    gboolean keep = G_SOURCE_REMOVE;
    if (SQ_SUCCEEDED(res)) {
        SQBool b = SQFalse;
        if (sq_gettype(v, -1) == OT_BOOL) {
            sq_getbool(v, -1, &b);
            keep = b ? G_SOURCE_CONTINUE : G_SOURCE_REMOVE;
        }
        sq_pop(v, 1);
    }
    sq_pop(v, 1);

    return keep;
}

static void sqgi_timeout_destroy(gpointer user_data)
{
    SqgiTimeoutData *d = (SqgiTimeoutData *)user_data;
    sq_release(d->v, &d->fn);
    g_free(d);
}

static SQInteger sq_fn_timeout_add(HSQUIRRELVM v)
{
    SQInteger ms;
    if (SQ_FAILED(sq_getinteger(v, 2, &ms))) return sq_throwerror(v, "timeout_add: expected integer ms");
    if (sq_gettype(v, 3) != OT_CLOSURE && sq_gettype(v, 3) != OT_NATIVECLOSURE)
        return sq_throwerror(v, "timeout_add: expected function");

    HSQUIRRELVM rv = sqgi_root_vm(v);
    SqgiTimeoutData *d = g_new0(SqgiTimeoutData, 1);
    d->v = rv;
    sq_resetobject(&d->fn);
    sq_getstackobj(v, 3, &d->fn);
    sq_addref(rv, &d->fn);

    guint id = g_timeout_add_full(G_PRIORITY_DEFAULT, (guint)ms,
                                  sqgi_timeout_cb, d, sqgi_timeout_destroy);
    sq_pushinteger(v, (SQInteger)id);
    return 1;
}

static SQInteger sq_fn_source_remove(HSQUIRRELVM v)
{
    SQInteger id;
    if (SQ_FAILED(sq_getinteger(v, 2, &id))) return sq_throwerror(v, "source_remove: expected integer id");
    gboolean removed = g_source_remove((guint)id);
    sq_pushbool(v, removed ? SQTrue : SQFalse);
    return 1;
}

/* ── sqgi.sleep(ms) → Task ────────────────────────────────────────────────── */

typedef struct {
    HSQUIRRELVM v;
    HSQOBJECT   task_ref;
    gint64      start_us;
} SqgiSleepData;

static gboolean sqgi_sleep_cb(gpointer user_data)
{
    SqgiSleepData *d = (SqgiSleepData *)user_data;
    gint64 elapsed_us = g_get_monotonic_time() - d->start_us;

    sq_pushobject(d->v, d->task_ref);
    sq_pushinteger(d->v, (SQInteger)(elapsed_us / 1000));
    sqgi_task_settle(d->v, -2, -1, SQFalse);
    sq_pop(d->v, 2);
    return G_SOURCE_REMOVE;
}

static void sqgi_sleep_destroy(gpointer user_data)
{
    SqgiSleepData *d = (SqgiSleepData *)user_data;
    sq_release(d->v, &d->task_ref);
    g_free(d);
}

static SQInteger sq_fn_sleep(HSQUIRRELVM v)
{
    SQInteger ms;
    if (SQ_FAILED(sq_getinteger(v, 2, &ms))) return sq_throwerror(v, "sleep: expected integer ms");

    sq_newtable(v);
    sqgi_task_init(v, -1);

    HSQUIRRELVM rv = sqgi_root_vm(v);
    SqgiSleepData *d = g_new0(SqgiSleepData, 1);
    d->v = rv;
    d->start_us = g_get_monotonic_time();
    sq_resetobject(&d->task_ref);
    sq_getstackobj(v, -1, &d->task_ref);
    sq_addref(rv, &d->task_ref);

    guint sid = g_timeout_add_full(G_PRIORITY_DEFAULT, (guint)ms,
                                   sqgi_sleep_cb, d, sqgi_sleep_destroy);

    /* Record source id so task.cancel() can remove it. */
    sq_pushstring(v, "__source_id", -1);
    sq_pushinteger(v, (SQInteger)sid);
    sq_rawset(v, -3);

    return 1;
}

/* ── __await ─────────────────────────────────────────────────────────────── */

typedef struct {
    HSQUIRRELVM v;
    HSQOBJECT   thread_ref;
    gint64      start_us;
} SqgiAwaitTimeoutData;

static gboolean sqgi_await_timeout_cb(gpointer user_data)
{
    SqgiAwaitTimeoutData *d = (SqgiAwaitTimeoutData *)user_data;
    HSQUIRRELVM coro = sqgi_obj_thread(&d->thread_ref);

    if (coro && sq_getvmstate(coro) == SQ_VMSTATE_SUSPENDED) {
        gint64 elapsed_us = g_get_monotonic_time() - d->start_us;
        sq_pushinteger(coro, (SQInteger)(elapsed_us / 1000));
        SQRESULT wr = sq_wakeupvm(coro, SQTrue, SQTrue, SQFalse, SQFalse);
        if (SQ_FAILED(wr)) {
            SqgiAsyncBinding *b = sqgi_async_binding_get(coro);
            if (b) {
                sq_getlasterror(coro);
                HSQOBJECT err; sq_resetobject(&err);
                sq_getstackobj(coro, -1, &err);
                sq_pop(coro, 1);

                HSQUIRRELVM parent = b->parent_v;
                sq_pushobject(parent, b->task_ref);
                sq_pushobject(parent, err);
                sqgi_task_settle(parent, -2, -1, SQTrue);
                sq_pop(parent, 2);

                sqgi_async_binding_free(b);
            }
        } else {
            sqgi_async_check_complete(coro);
        }
    }

    sq_release(d->v, &d->thread_ref);
    g_free(d);
    return G_SOURCE_REMOVE;
}

static SQInteger sqgi_suspend_for_timeout(HSQUIRRELVM v, SQInteger ms)
{
    HSQUIRRELVM rv = sqgi_root_vm(v);
    SqgiAwaitTimeoutData *d = g_new0(SqgiAwaitTimeoutData, 1);
    d->v = rv;
    d->start_us = g_get_monotonic_time();

    sq_resetobject(&d->thread_ref);
    sq_pushthread(v, v);
    sq_getstackobj(v, -1, &d->thread_ref);
    sq_addref(rv, &d->thread_ref);
    sq_pop(v, 1);

    g_timeout_add((guint)ms, sqgi_await_timeout_cb, d);
    return sq_suspendvm(v);
}

static SQInteger sqgi_suspend_for_task(HSQUIRRELVM v, SQInteger task_idx)
{
    /* await rethrows on rejection, so an awaited task counts as handled. */
    sqgi_task_mark_rejection_handled(v, task_idx);

    SQBool done = SQFalse;
    sqgi_task_get_bool(v, task_idx, "__done", &done);

    if (done) {
        SQBool err = SQFalse;
        sqgi_task_get_bool(v, task_idx, "__has_error", &err);
        if (err) {
            HSQOBJECT e; sq_resetobject(&e);
            sqgi_task_get_obj(v, task_idx, "__error", &e);
            sq_pushobject(v, e);
            return sq_throwobject(v);
        }
        HSQOBJECT r; sq_resetobject(&r);
        sqgi_task_get_obj(v, task_idx, "__result", &r);
        sq_pushobject(v, r);
        return 1;
    }

    sq_push(v, task_idx);
    sq_pushstring(v, "__waiters", -1);
    if (SQ_FAILED(sq_rawget(v, -2))) return sq_throwerror(v, "await: bad task");
    sq_newtable(v);
    sq_pushstring(v, "kind", -1); sq_pushstring(v, "await", -1); sq_rawset(v, -3);
    sq_pushstring(v, "coro", -1); sq_pushthread(v, v);          sq_rawset(v, -3);
    sq_arrayappend(v, -2);
    sq_pop(v, 2);

    return sq_suspendvm(v);
}

static SQInteger sq_fn___await(HSQUIRRELVM v)
{
    SQObjectType t = sq_gettype(v, 2);
    if (t == OT_INTEGER) {
        SQInteger ms; sq_getinteger(v, 2, &ms);
        return sqgi_suspend_for_timeout(v, ms);
    }
    if (sqgi_idx_is_task(v, 2)) {
        return sqgi_suspend_for_task(v, 2);
    }
    /* Non-thenable: pass through. */
    sq_push(v, 2);
    return 1;
}

/* ── Async function wrapper ─────────────────────────────────────────────── */

static void sqgi_async_check_complete(HSQUIRRELVM thread_v)
{
    if (sq_getvmstate(thread_v) != SQ_VMSTATE_IDLE) return;

    SqgiAsyncBinding *b = sqgi_async_binding_get(thread_v);
    if (!b) return;

    HSQUIRRELVM v = b->parent_v;
    HSQOBJECT ret; sq_resetobject(&ret);
    sq_getstackobj(thread_v, -1, &ret);

    sq_pushobject(v, b->task_ref);
    sq_pushobject(v, ret);
    sqgi_task_settle(v, -2, -1, SQFalse);
    sq_pop(v, 2);

    sqgi_async_binding_free(b);
}

static SQInteger sq_fn___async_run(HSQUIRRELVM v)
{
    /* Stack layout (1-indexed): [this, ...user_args, INNER_CLOSURE (free var)].
     * sq_gettop returns the last slot, which holds the free var. */
    SQInteger total_top = sq_gettop(v);
    SQInteger inner_idx = total_top;
    SQInteger nuser_args = total_top - 2; /* exclude 'this' and free var */
    if (nuser_args < 0) nuser_args = 0;

    HSQOBJECT inner; sq_resetobject(&inner);
    sq_getstackobj(v, inner_idx, &inner);

    HSQOBJECT this_obj; sq_resetobject(&this_obj);
    sq_getstackobj(v, 1, &this_obj);

    /* Create Task. Leave it on the stack so it stays alive until we return. */
    sq_newtable(v);
    sqgi_task_init(v, -1);
    HSQOBJECT task_obj; sq_resetobject(&task_obj);
    sq_getstackobj(v, -1, &task_obj);

    /* Create thread (also leaves it on stack with a stack-held ref). */
    HSQUIRRELVM child = sq_newthread(v, 1024);
    if (!child) return sq_throwerror(v, "__async_run: failed to create thread");
    HSQOBJECT thread_obj; sq_resetobject(&thread_obj);
    sq_getstackobj(v, -1, &thread_obj);

    /* Install binding so wakers can finalize. Each ref is owned by the binding. */
    HSQUIRRELVM rv = sqgi_root_vm(v);
    SqgiAsyncBinding *b = g_new0(SqgiAsyncBinding, 1);
    b->parent_v   = rv;
    b->thread_ref = thread_obj;
    b->task_ref   = task_obj;
    sq_addref(rv, &b->thread_ref);
    sq_addref(rv, &b->task_ref);
    sqgi_async_binding_install(child, b);

    /* Push closure + this + user args on the child. */
    sq_pushobject(child, inner);
    sq_pushobject(child, this_obj);
    for (SQInteger i = 0; i < nuser_args; i++) {
        HSQOBJECT a; sq_resetobject(&a);
        sq_getstackobj(v, 2 + i, &a);
        sq_pushobject(child, a);
    }

    SQRESULT cr = sq_call(child, 1 + nuser_args, SQTrue, SQFalse);

    if (SQ_FAILED(cr)) {
        sq_getlasterror(child);
        HSQOBJECT err; sq_resetobject(&err);
        sq_getstackobj(child, -1, &err);
        sq_pop(child, 1);

        sq_pushobject(v, task_obj);
        sq_pushobject(v, err);
        sqgi_task_settle(v, -2, -1, SQTrue);
        sq_pop(v, 2);

        sqgi_async_binding_free(b);
    } else if (sq_getvmstate(child) == SQ_VMSTATE_IDLE) {
        sqgi_async_check_complete(child);
    }
    /* else SUSPENDED: binding lives on; wakers will finalize. */

    /* Drop thread from parent stack (binding still holds a ref). */
    sq_remove(v, -1);
    /* Task is now at the top of stack — that's our return value. */
    return 1;
}

static SQInteger sq_fn___make_async(HSQUIRRELVM v)
{
    if (sq_gettype(v, 2) != OT_CLOSURE && sq_gettype(v, 2) != OT_NATIVECLOSURE)
        return sq_throwerror(v, "__make_async: expected function");

    sq_push(v, 2);                              /* push inner_fn to capture */
    sq_newclosure(v, sq_fn___async_run, 1);     /* capture as free var 0 */
    sq_setnativeclosurename(v, -1, "<async>");
    return 1;
}

/* sqgi.__task_attach_cancellable(task, cancellable_instance)
 *
 * Wires a Gio.Cancellable into a Task so that task.cancel() calls
 * g_cancellable_cancel() on it. Used by sqgi.gio_async (Squirrel bootstrap)
 * to thread cancellation through GIO async calls.
 *
 * Stores both:
 *   __cancellable_ptr  — raw GObject* (userpointer) for the fast-cancel
 *                        path in sq_fn_task_cancel_m
 *   __cancellable      — the Squirrel wrapper instance, to keep the
 *                        GObject alive for the duration of the task
 */
static SQInteger sq_fn___task_attach_cancellable(HSQUIRRELVM v)
{
    if (sq_gettop(v) < 3)
        return sq_throwerror(v, "__task_attach_cancellable: expected (task, cancellable)");
    if (!sqgi_idx_is_task(v, 2))
        return sq_throwerror(v, "__task_attach_cancellable: arg 1 not a Task");

    SQUserPointer up = NULL;
    if (sq_gettype(v, 3) != OT_INSTANCE ||
        SQ_FAILED(sq_getinstanceup(v, 3, &up, NULL, SQFalse)) ||
        up == NULL)
    {
        return sq_throwerror(v, "__task_attach_cancellable: arg 2 not a GObject instance");
    }
    if (!G_IS_CANCELLABLE(up)) {
        return sq_throwerror(v, "__task_attach_cancellable: arg 2 is not a Gio.Cancellable");
    }

    sq_push(v, 2); /* task */
    sq_pushstring(v, "__cancellable_ptr", -1);
    sq_pushuserpointer(v, up);
    sq_rawset(v, -3);

    sq_pushstring(v, "__cancellable", -1);
    sq_push(v, 3);
    sq_rawset(v, -3);
    sq_poptop(v); /* task */
    return 0;
}

/* ── Registration ────────────────────────────────────────────────────────── */

static void reg_fn(HSQUIRRELVM v, const SQChar *name, SQFUNCTION fn)
{
    sq_pushstring(v, name, -1);
    sq_newclosure(v, fn, 0);
    sq_setnativeclosurename(v, -1, name);
    sq_newslot(v, -3, SQFalse);
}

/* sqgi.bytes_to_array(buf) → array of integers (0..255)
 *
 * Inverse of bytes_from_array. Mostly useful when a script wants to inspect
 * or mutate individual bytes — SQGI's normal GI marshaller keeps byte
 * buffers as Squirrel strings for performance (see src/sqgi_gi.c). Accepts
 * either a string or an existing integer-array (pass-through). */
static SQInteger sq_fn_bytes_to_array(HSQUIRRELVM v)
{
    if (sq_gettop(v) < 2) return sq_throwerror(v, "bytes_to_array: missing argument");
    SQObjectType t = sq_gettype(v, 2);
    if (t == OT_ARRAY) { sq_push(v, 2); return 1; }
    if (t != OT_STRING) return sq_throwerror(v, "bytes_to_array: expected string");
    const SQChar *s = NULL;
    if (SQ_FAILED(sq_getstring(v, 2, &s))) return SQ_ERROR;
    SQInteger n = sq_getsize(v, 2);
    sq_newarray(v, 0);
    for (SQInteger i = 0; i < n; i++) {
        sq_pushinteger(v, (SQInteger)(unsigned char)s[i]);
        sq_arrayappend(v, -2);
    }
    return 1;
}

/* sqgi.bytes_from_array(arr) → byte-string
 *
 * Builds an 8-bit-clean Squirrel string from an array of integers in
 * [0,255]. Values outside that range are truncated to their low 8 bits.
 * Accepts a string for pass-through symmetry. */
static SQInteger sq_fn_bytes_from_array(HSQUIRRELVM v)
{
    if (sq_gettop(v) < 2) return sq_throwerror(v, "bytes_from_array: missing argument");
    SQObjectType t = sq_gettype(v, 2);
    if (t == OT_STRING) { sq_push(v, 2); return 1; }
    if (t != OT_ARRAY) return sq_throwerror(v, "bytes_from_array: expected array");
    SQInteger n = sq_getsize(v, 2);
    if (n < 0) return sq_throwerror(v, "bytes_from_array: bad array size");
    char *buf = (char *)g_malloc((gsize)(n > 0 ? n : 1));
    for (SQInteger i = 0; i < n; i++) {
        sq_pushinteger(v, i);
        if (SQ_FAILED(sq_get(v, 2))) { g_free(buf); return SQ_ERROR; }
        SQInteger iv = 0;
        if (SQ_FAILED(sq_getinteger(v, -1, &iv))) {
            sq_pop(v, 1);
            g_free(buf);
            return sq_throwerror(v, "bytes_from_array: non-integer element");
        }
        sq_pop(v, 1);
        buf[i] = (char)(unsigned char)(iv & 0xFF);
    }
    sq_pushstring(v, buf, n);
    g_free(buf);
    return 1;
}

void sqgi_async_register(HSQUIRRELVM v)
{
    sqgi_task_delegate_init(v);

    sq_pushroottable(v);
    sq_pushstring(v, "sqgi", -1);
    sq_newtable(v);

    reg_fn(v, "timeout_add",    sq_fn_timeout_add);
    reg_fn(v, "source_remove",  sq_fn_source_remove);
    reg_fn(v, "sleep",          sq_fn_sleep);
    reg_fn(v, "Task",           sq_fn_task_new);
    reg_fn(v, "__await",        sq_fn___await);
    reg_fn(v, "__make_async",   sq_fn___make_async);
    reg_fn(v, "__task_attach_cancellable", sq_fn___task_attach_cancellable);
    reg_fn(v, "bytes_to_array",   sq_fn_bytes_to_array);
    reg_fn(v, "bytes_from_array", sq_fn_bytes_from_array);

    sq_newslot(v, -3, SQFalse);
    sq_pop(v, 1);

    /* Bootstrap pure-Squirrel helpers (Promise.all / Promise.race style). */
    static const char k_bootstrap[] =
        "sqgi.all <- function(tasks) {\n"
        "  local agg = sqgi.Task()\n"
        "  local n = tasks.len()\n"
        "  if (n == 0) { agg.resolve([]); return agg }\n"
        "  local results = array(n, null)\n"
        "  local remaining = n\n"
        "  for (local i = 0; i < n; i++) {\n"
        "    local idx = i\n"
        "    local t = tasks[i]\n"
        "    if (typeof t != \"table\" || !(\"__sqgi_task\" in t)) {\n"
        "      results[idx] = t\n"
        "      remaining--\n"
        "      if (remaining == 0) agg.resolve(results)\n"
        "      continue\n"
        "    }\n"
        "    t.then(function(v) {\n"
        "        results[idx] = v\n"
        "        remaining--\n"
        "        if (remaining == 0) agg.resolve(results)\n"
        "    }).catch(function(e) { agg.reject(e) })\n"
        "  }\n"
        "  return agg\n"
        "}\n"
        "sqgi.race <- function(tasks) {\n"
        "  local agg = sqgi.Task()\n"
        "  foreach (t in tasks) {\n"
        "    if (typeof t != \"table\" || !(\"__sqgi_task\" in t)) {\n"
        "      agg.resolve(t)\n"
        "      return agg\n"
        "    }\n"
        "    t.then(function(v) { agg.resolve(v) })\n"
        "     .catch(function(e) { agg.reject(e) })\n"
        "  }\n"
        "  return agg\n"
        "}\n"
        /* sqgi.gio_async(initiator, finisher) — wrap a GIO _async/_finish pair
         * as an awaitable Task whose cancel() propagates through a GCancellable.
         *
         *   initiator(cancellable, ready_cb)  invokes the *_async call
         *   finisher(async_result)            calls *_finish, returns value
         *
         * Example:
         *   local Gio = import(\"Gio\")
         *   local f = Gio.File.new_for_path(path)
         *   local stream = await sqgi.gio_async(
         *     @(c, cb) f.read_async(0, c, cb),
         *     @(res) f.read_finish(res))
         */
        "sqgi.gio_async <- function(initiator, finisher) {\n"
        "  local root = ::getroottable()\n"
        "  if (!(\"Gio\" in root)) ::import(\"Gio\")\n"
        "  local Gio = root[\"Gio\"]\n"
        "  local task = sqgi.Task()\n"
        "  local cancellable = sqgi.new_object(Gio.Cancellable, {})\n"
        "  sqgi.__task_attach_cancellable(task, cancellable)\n"
        "  local ready = function(source, async_result) {\n"
        "    try {\n"
        "      local value = finisher(async_result)\n"
        "      if (!task.__done) task.resolve(value)\n"
        "    } catch (e) {\n"
        "      if (!task.__done) task.reject(e)\n"
        "    }\n"
        "  }\n"
        "  initiator(cancellable, ready)\n"
        "  return task\n"
        "}\n"
        /* sqgi.__find_async_pairs(klass) — return an array of base names for
         * which both `<bn>_async` and `<bn>_finish` exist on klass (including
         * inherited slots; Squirrel-side foreach walks the inheritance chain
         * whereas C sq_next only sees own slots). */
        "sqgi.__find_async_pairs <- function(klass) {\n"
        "  local seen = {}\n"
        "  foreach (k, dummy in klass) {\n"
        "    if (typeof(k) != \"string\") continue\n"
        "    local L = k.len()\n"
        "    if (L <= 6) continue\n"
        "    if (k.slice(L - 6) != \"_async\") continue\n"
        "    local bn = k.slice(0, L - 6)\n"
        "    if (!((bn + \"_finish\") in klass)) continue\n"
        "    seen[bn] <- true\n"
        "  }\n"
        "  local out = []\n"
        "  foreach (bn, dummy in seen) out.append(bn)\n"
        "  return out\n"
        "}\n"
        /* sqgi.__make_async_wrapper(bn) — return a closure that, when invoked
         * as a method (this = instance), calls `<bn>_async_raw(...args, c, cb)`
         * on the instance and returns an awaitable Task whose resolved value
         * is `<bn>_finish(res)`. The C side (sqgi_install_async_wrappers in
         * sqgi_gi_object.c) preserves the raw GI method as `<bn>_async_raw`
         * and overrides `<bn>_async` with this wrapper, so user code can
         * write `await obj.foo_async(args)` without the two-lambda dance and
         * without args being shifted into the cancellable/callback slots.
         *
         * IMPORTANT: when the wrapper runs, `this` is the GObject instance
         * whose `_get` metamethod is `gobject_get`. Squirrel's identifier
         * resolution first searches `this` for free names — so an unqualified
         * `sqgi` or `foreach` literal would trigger `gobject_get` and throw
         * "property not found" before we get a chance to do anything. All
         * globals therefore use the explicit `::` root prefix. */
        "sqgi.__make_async_wrapper <- function(bn) {\n"
        "  local raw = bn + \"_async_raw\"\n"
        "  local fn  = bn + \"_finish\"\n"
        "  return function(...) {\n"
        "    local self = this\n"
        "    local args = vargv\n"
        /* Pass-through to raw GI form when the caller is using the native
         * callback shape: …, cancellable, callback[, user_data]. Detect by
         * looking for a closure in the trailing two slots — this catches both
         * `obj.foo_async(arg, c, cb)` and `obj.foo_async(arg, c, cb, ud)`.
         * Without this, code inside signal handlers (where you can't `await`)
         * has no way to use the native API, and existing GI scripts break
         * the moment the wrapper is installed. */
        "    local n = args.len()\n"
        "    if (n >= 1 && typeof(args[n-1]) == \"function\") {\n"
        "      local call_args = [self]\n"
        "      foreach (a in args) call_args.append(a)\n"
        "      return self[raw].acall(call_args)\n"
        "    }\n"
        "    if (n >= 2 && typeof(args[n-2]) == \"function\") {\n"
        "      local call_args = [self]\n"
        "      foreach (a in args) call_args.append(a)\n"
        "      return self[raw].acall(call_args)\n"
        "    }\n"
        /* If the caller passed an explicit trailing cancellable (the natural
         * GI shape: `foo_async(..., cancellable)`), strip it and let
         * sqgi.gio_async manage its own cancellable so `task.cancel()` keeps
         * working. A trailing `null` is the same idiom — drop it too. This
         * makes `await f.load_contents_async(null)` work even though the
         * wrapper appends its own cancellable+callback slots. */
        "    local root = ::getroottable()\n"
        "    if (!(\"Gio\" in root)) ::import(\"Gio\")\n"
        "    local Gio = root[\"Gio\"]\n"
        "    if (n >= 1) {\n"
        "      local tail = args[n-1]\n"
        "      if (tail == null || (typeof(tail) == \"instance\" &&\n"
        "                           tail instanceof Gio.Cancellable)) {\n"
        "        local trimmed = []\n"
        "        for (local i = 0; i < n - 1; i++) trimmed.append(args[i])\n"
        "        args = trimmed\n"
        "      }\n"
        "    }\n"
        "    return ::sqgi.gio_async(\n"
        "      function(c, cb) {\n"
        "        local call_args = [self]\n"
        "        foreach (a in args) call_args.append(a)\n"
        "        call_args.append(c)\n"
        "        call_args.append(cb)\n"
        "        self[raw].acall(call_args)\n"
        "      },\n"
        "      function(r) { return self[fn](r) })\n"
        "  }\n"
        "}\n"
        /* sqgi.socket_add_watch(socket, condition, fn[, cancellable])
         *
         * Convenience wrapper around g_socket_create_source(). Returns the
         * GSource id (suitable for sqgi.source_remove). The user's `fn` is
         * invoked as `fn(socket, condition)` whenever the source dispatches,
         * and should return a bool: true to keep the watch, false to remove.
         *
         * Why this exists: GLib's `g_source_set_callback` is introspected as
         * taking a plain `GSourceFunc(gpointer)`, so the FFI trampoline SQGI
         * builds for `src.set_callback(fn)` is a 1-arg function. When GLib
         * later dispatches a typed source like GSocketSource, it casts the
         * stored callback to `GSocketSourceFunc(GSocket*, GIOCondition,
         * gpointer)` and calls it with 3 args — only the first register is
         * read by the trampoline (and that slot is consumed as user_data per
         * the GSourceFunc closure annotation), so the script-visible callback
         * receives ZERO arguments. This helper captures `socket` and the
         * requested `condition` via Squirrel closure scope and delivers them
         * to `fn` directly, which is what callers usually want. */
        "sqgi.socket_add_watch <- function(socket, condition, fn, cancellable = null) {\n"
        "  local src = socket.create_source(condition, cancellable)\n"
        "  src.set_callback(function() { return fn(socket, condition) })\n"
        "  return src.attach(null)\n"
        "}\n";

    if (SQ_SUCCEEDED(sq_compilebuffer(v, k_bootstrap,
                                      (SQInteger)(sizeof(k_bootstrap) - 1),
                                      "<sqgi async bootstrap>", SQFalse))) {
        sq_pushroottable(v);
        sq_call(v, 1, SQFalse, SQTrue);
        sq_pop(v, 1); /* closure */
    }
}
