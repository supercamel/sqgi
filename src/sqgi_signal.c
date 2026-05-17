#include "sqgi_signal.h"
#include "sqgi_marshal.h"

#include <string.h>

/* ── Per-connection data ─────────────────────────────────────────────────── */

typedef struct {
    HSQUIRRELVM    v;
    HSQOBJECT      handler;       /* sq_addref'd Squirrel closure */
    GThread       *vm_thread;     /* thread that owns the VM */
    GMainContext  *vm_context;    /* main context to dispatch back to */
} SqgiClosureData;

/* VM pointers marked as closing to avoid callbacks into dead Squirrel states.
 * Protected by a mutex so signal teardown on a worker thread doesn't race
 * with VM shutdown on the main thread. */
static GHashTable *g_closing_vms = NULL;
static GMutex      g_closing_vms_mutex;

gboolean sqgi_signal_vm_is_closing(HSQUIRRELVM v)
{
    gboolean result;
    g_mutex_lock(&g_closing_vms_mutex);
    result = (g_closing_vms != NULL &&
              g_hash_table_contains(g_closing_vms, v));
    g_mutex_unlock(&g_closing_vms_mutex);
    return result;
}

void sqgi_signal_mark_vm_closing(HSQUIRRELVM v)
{
    if (!v) return;
    g_mutex_lock(&g_closing_vms_mutex);
    if (!g_closing_vms) {
        g_closing_vms = g_hash_table_new(g_direct_hash, g_direct_equal);
    }
    g_hash_table_add(g_closing_vms, v);
    g_mutex_unlock(&g_closing_vms_mutex);
}

void sqgi_signal_unmark_vm_closing(HSQUIRRELVM v)
{
    if (!v) return;
    g_mutex_lock(&g_closing_vms_mutex);
    if (g_closing_vms) {
        g_hash_table_remove(g_closing_vms, v);
        if (g_hash_table_size(g_closing_vms) == 0) {
            g_hash_table_destroy(g_closing_vms);
            g_closing_vms = NULL;
        }
    }
    g_mutex_unlock(&g_closing_vms_mutex);
}

/* ── GClosure marshal ────────────────────────────────────────────────────── */

/* Deep-copyable bundle for cross-thread signal dispatch. */
typedef struct {
    SqgiClosureData *cd;
    GValue         *params;       /* deep copy of param_values */
    guint           n_params;
    GValue         *return_value; /* writable target if signal has return */
    GMutex          mtx;
    GCond           cond;
    gboolean        done;
} SqgiMarshalJob;

static void sqgi_signal_marshal_direct(SqgiClosureData *data,
                                       GValue *return_value,
                                       guint n_param_values,
                                       const GValue *param_values)
{
    HSQUIRRELVM v = data->v;
    SQInteger top = sq_gettop(v);

    gboolean need_retval = (return_value != NULL &&
                            G_VALUE_TYPE(return_value) != G_TYPE_INVALID &&
                            G_VALUE_TYPE(return_value) != G_TYPE_NONE);

    sq_pushobject(v, data->handler);   /* [..., handler] */
    sq_pushnull(v);                    /* [..., handler, null(this)] */

    /* Push signal params, skipping index 0 (the emitting object) */
    guint nreal = (n_param_values > 0) ? (n_param_values - 1) : 0;
    for (guint i = 1; i < n_param_values; i++) {
        sqgi_push_gvalue(v, &param_values[i]);
    }

    SQRESULT res = sq_call(v, (SQInteger)(nreal + 1), need_retval ? SQTrue : SQFalse, SQTrue);

    if (SQ_SUCCEEDED(res) && need_retval) {
        sqgi_get_gvalue(v, -1, return_value);
        sq_pop(v, 1);
    }

    /* Restore to original top to avoid leaking or underflowing slots. */
    sq_settop(v, top);
}

static gboolean sqgi_signal_marshal_job_run(gpointer user_data)
{
    SqgiMarshalJob *job = (SqgiMarshalJob *)user_data;

    if (!sqgi_signal_vm_is_closing(job->cd->v)) {
        sqgi_signal_marshal_direct(job->cd, job->return_value,
                                  job->n_params, job->params);
    }

    /* Always sync: notify the emitting thread, which owns + frees the job. */
    g_mutex_lock(&job->mtx);
    job->done = TRUE;
    g_cond_signal(&job->cond);
    g_mutex_unlock(&job->mtx);
    return G_SOURCE_REMOVE;
}

static void sqgi_signal_marshal(GClosure     *closure,
                                GValue       *return_value,
                                guint         n_param_values,
                                const GValue *param_values,
                                gpointer      invocation_hint,
                                gpointer      marshal_data)
{
    (void)invocation_hint;
    (void)marshal_data;

    SqgiClosureData *data = (SqgiClosureData *)closure->data;

    if (sqgi_signal_vm_is_closing(data->v)) {
        return; /* VM gone — drop the signal silently */
    }

    /* Fast path: emitted from the VM's own thread → call inline. */
    if (data->vm_thread == g_thread_self() || data->vm_thread == NULL) {
        sqgi_signal_marshal_direct(data, return_value, n_param_values, param_values);
        return;
    }

    /* Cross-thread: marshal into the VM's main context and wait.
     *
     * We always run synchronously here, matching GObject signal semantics:
     * the handler must complete before g_signal_emit returns. Signals such
     * as GstCairoOverlay::draw pass transient pointers (a cairo_t valid
     * only during emission) — a fire-and-forget idle dispatch would run
     * the handler against freed state. Callers that emit from worker
     * threads must keep the VM's main context pumping (see ctx.iteration
     * in the demos) or this will deadlock, just as it would for any other
     * GObject signal binding. */
    SqgiMarshalJob *job = g_new0(SqgiMarshalJob, 1);
    job->cd = data;
    job->n_params = n_param_values;
    job->params = g_new0(GValue, n_param_values);
    for (guint i = 0; i < n_param_values; i++) {
        g_value_init(&job->params[i], G_VALUE_TYPE(&param_values[i]));
        g_value_copy(&param_values[i], &job->params[i]);
    }
    job->return_value = return_value;     /* may be NULL — direct handles it */
    g_mutex_init(&job->mtx);
    g_cond_init(&job->cond);
    job->done = FALSE;

    GSource *src = g_idle_source_new();
    g_source_set_priority(src, G_PRIORITY_DEFAULT);
    g_source_set_callback(src, sqgi_signal_marshal_job_run, job, NULL);
    g_source_attach(src, data->vm_context);
    g_source_unref(src);

    g_mutex_lock(&job->mtx);
    while (!job->done) g_cond_wait(&job->cond, &job->mtx);
    g_mutex_unlock(&job->mtx);

    for (guint i = 0; i < job->n_params; i++) g_value_unset(&job->params[i]);
    g_free(job->params);
    g_mutex_clear(&job->mtx);
    g_cond_clear(&job->cond);
    g_free(job);
}

/* ── GClosure invalidate notifier ────────────────────────────────────────── */

static void sqgi_closure_invalidate(gpointer user_data, GClosure *closure)
{
    (void)closure;
    SqgiClosureData *data = (SqgiClosureData *)user_data;

    /* During complex teardown paths (e.g. Gio.Application run/shutdown),
     * the closure can be invalidated after the VM has already dropped the
     * tracked reference. Avoid triggering Squirrel RefTable assertions by
     * releasing only when the object is still tracked. */
    if (!sqgi_signal_vm_is_closing(data->v) &&
        sq_getrefcount(data->v, &data->handler) > 0) {
        sq_release(data->v, &data->handler);
    }
    sq_resetobject(&data->handler);
    if (data->vm_context) {
        g_main_context_unref(data->vm_context);
        data->vm_context = NULL;
    }
    g_free(data);
}

/* ── Public API ──────────────────────────────────────────────────────────── */

gulong sqgi_signal_connect(HSQUIRRELVM v, GObject *obj, const char *signal,
                           SQInteger handler_idx)
{
    /* Normalise negative index */
    if (handler_idx < 0) handler_idx = sq_gettop(v) + handler_idx + 1;

    SqgiClosureData *data = g_new0(SqgiClosureData, 1);
    data->v = v;
    /* Capture the VM's owning thread + its thread-default main context so
     * signal callbacks dispatched from worker threads are routed back here. */
    data->vm_thread  = g_thread_self();
    data->vm_context = g_main_context_ref_thread_default();
    sq_resetobject(&data->handler);
    sq_getstackobj(v, handler_idx, &data->handler);
    sq_addref(v, &data->handler);

    GClosure *closure = g_closure_new_simple(sizeof(GClosure), data);
    g_closure_ref(closure);
    g_closure_sink(closure);
    g_closure_set_marshal(closure, sqgi_signal_marshal);
    g_closure_add_invalidate_notifier(closure, data, sqgi_closure_invalidate);

    gulong id = g_signal_connect_closure(obj, signal, closure, FALSE);
    g_closure_unref(closure);

    return id;
}

void sqgi_signal_disconnect(GObject *obj, gulong handler_id)
{
    g_signal_handler_disconnect(obj, handler_id);
    /* The invalidate notifier fires automatically, releasing the Squirrel ref */
}
