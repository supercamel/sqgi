/* test/c/test_signal_crossthread_sync.c
 *
 * Hits the SYNC (return-value) cross-thread marshal path in sqgi_signal.c
 * (lines 152-178), where the emitting worker thread blocks on a GCond
 * waiting for the main-thread Squirrel handler to compute a return value.
 *
 * We register a new signal "compute" with a gint return on GSimpleAction
 * at runtime, then emit it from a worker thread with g_signal_emit_by_name
 * and capture the returned value.
 */

#include <sqgi_vm.h>
#include <sqgi_marshal.h>

#include <gio/gio.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static guint compute_signal_id = 0;

typedef struct {
    GObject *obj;
    gint     input;
    gint     result;
    GMainLoop *loop;
} WorkerCtx;

static gpointer worker_thread(gpointer user_data)
{
    WorkerCtx *wc = (WorkerCtx *)user_data;
    /* Synchronous emit: marshal will block us until main thread responds. */
    g_signal_emit(wc->obj, compute_signal_id, 0, wc->input, &wc->result);
    g_main_context_invoke(NULL, (GSourceFunc)g_main_loop_quit, wc->loop);
    return NULL;
}

int main(void)
{
    HSQUIRRELVM v = sqgi_vm_new();
    if (!v) return 1;

    GMainContext *ctx = g_main_context_default();
    g_main_context_push_thread_default(ctx);

    /* Register a signal on GSimpleAction: gint compute(gint x) */
    compute_signal_id = g_signal_new(
        "compute",
        G_TYPE_SIMPLE_ACTION,
        G_SIGNAL_RUN_LAST,
        0, NULL, NULL, NULL,
        G_TYPE_INT,   /* return type */
        1, G_TYPE_INT);

    GSimpleAction *action = g_simple_action_new("a", NULL);

    const char *setup = "Gio <- import(\"Gio\")\n";
    if (SQ_FAILED(sqgi_vm_dobuffer(v, setup, (SQInteger)strlen(setup),
                                   "setup"))) return 1;

    sq_pushroottable(v);
    sq_pushstring(v, "the_action", -1);
    sqgi_push_gobject(v, G_OBJECT(action));
    sq_newslot(v, -3, SQFalse);
    sq_pop(v, 1);
    g_object_unref(action);

    /* Handler returns input * 7 — verifies value travels back through the
     * cross-thread sync return path. */
    const char *script =
        "the_action.connect(\"compute\", function(x) { return x * 7 })\n";
    if (SQ_FAILED(sqgi_vm_dobuffer(v, script, (SQInteger)strlen(script),
                                   "script"))) return 1;

    GMainLoop *loop = g_main_loop_new(ctx, FALSE);
    WorkerCtx wc = { .obj = G_OBJECT(action), .input = 6,
                     .result = -1, .loop = loop };
    GThread *t = g_thread_new("emit-sync", worker_thread, &wc);

    guint timeout_id = g_timeout_add_seconds(5,
        (GSourceFunc)g_main_loop_quit, loop);
    g_main_loop_run(loop);
    g_source_remove(timeout_id);
    g_thread_join(t);
    g_main_loop_unref(loop);

    int rc = 0;
    if (wc.result != 42) {
        fprintf(stderr, "FAIL: expected 42 (6*7), got %d\n", wc.result);
        rc = 1;
    }

    g_main_context_pop_thread_default(ctx);
    sqgi_vm_free(v);
    if (rc == 0) printf("[OK] test_signal_crossthread_sync\n");
    return rc;
}
