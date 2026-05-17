/* test/c/test_signal_crossthread.c
 *
 * Hits sqgi_signal.c's cross-thread marshal path (lines 140-191), which is
 * unreachable from pure-Squirrel tests because Squirrel has no native
 * thread-spawn primitive.
 *
 * Strategy:
 *   1. Create a VM on the main thread.
 *   2. Construct a GSimpleAction in C and push it into the VM's root table.
 *   3. From Squirrel, connect "activate" and "change-state" handlers.
 *   4. Spawn a GThread that calls g_signal_emit_by_name(action, "activate", ...).
 *   5. Pump the main loop; the marshal posts the call back to us.
 *   6. Assert that handlers fired with the right argument values.
 */

#include <sqgi_vm.h>
#include <sqgi_marshal.h>
#include <sqgi_signal.h>

#include <gio/gio.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    GSimpleAction *action;
    GMainLoop     *loop;
    guint          n_emits;
} WorkerCtx;

static gpointer worker_thread(gpointer user_data)
{
    WorkerCtx *wc = (WorkerCtx *)user_data;
    for (guint i = 0; i < wc->n_emits; i++) {
        GVariant *param = g_variant_new_int32((gint32)(100 + i));
        g_variant_ref_sink(param);
        /* GSimpleAction "activate" signature: (GVariant *parameter) */
        g_signal_emit_by_name(wc->action, "activate", param);
        g_variant_unref(param);
    }
    /* Schedule loop quit from the main thread side via idle. */
    g_main_context_invoke(NULL, (GSourceFunc)g_main_loop_quit, wc->loop);
    return NULL;
}

int main(void)
{
    HSQUIRRELVM v = sqgi_vm_new();
    if (!v) { fprintf(stderr, "sqgi_vm_new failed\n"); return 1; }

    /* The marshal captures g_main_context_ref_thread_default() at connect
     * time. We must acquire a context so signal dispatch can post back. */
    GMainContext *ctx = g_main_context_default();
    g_main_context_push_thread_default(ctx);

    /* Build a GSimpleAction with a parameter type so "activate" carries a
     * GVariant payload — exercises the cross-thread param deep-copy path. */
    GSimpleAction *action = g_simple_action_new("test-action",
                                                G_VARIANT_TYPE_INT32);

    /* Make sure Gio is imported and its classes registered before we wrap
     * the GObject — sqgi_push_gobject looks up the class for the type. */
    const char *setup = "Gio <- import(\"Gio\")\n";
    if (SQ_FAILED(sqgi_vm_dobuffer(v, setup, (SQInteger)strlen(setup),
                                   "setup"))) {
        fprintf(stderr, "setup eval failed\n"); return 1;
    }

    /* Expose it to Squirrel: stash in the root table under "the_action". */
    sq_pushroottable(v);
    sq_pushstring(v, "the_action", -1);
    sqgi_push_gobject(v, G_OBJECT(action));
    sq_newslot(v, -3, SQFalse);
    sq_pop(v, 1);

    /* The wrapper took a ref; drop ours so the wrapper owns it. */
    g_object_unref(action);

    /* Squirrel side: connect handlers that record what they saw into
     * globals. We can read those globals from C after the loop runs. */
    const char *script =
        "results <- { count = 0, values = [] }\n"
        "the_action.connect(\"activate\", function(param) {\n"
        "    results.count++\n"
        "    results.values.append(param)\n"
        "})\n";
    if (SQ_FAILED(sqgi_vm_dobuffer(v, script, (SQInteger)strlen(script),
                                   "test-script"))) {
        fprintf(stderr, "script eval failed\n");
        return 1;
    }

    /* Spawn the worker; it emits 3 times then quits the loop. */
    GMainLoop *loop = g_main_loop_new(ctx, FALSE);
    WorkerCtx wc = { .action = action, .loop = loop, .n_emits = 3 };
    GThread *t = g_thread_new("emit-worker", worker_thread, &wc);

    /* Safety timeout so a hang doesn't wedge CI. */
    guint timeout_id = g_timeout_add_seconds(5,
        (GSourceFunc)g_main_loop_quit, loop);

    g_main_loop_run(loop);
    g_source_remove(timeout_id);
    g_thread_join(t);
    g_main_loop_unref(loop);

    /* Pull results out of the VM. */
    sq_pushroottable(v);
    sq_pushstring(v, "results", -1);
    sq_get(v, -2);
    /* results table now on top */
    sq_pushstring(v, "count", -1);
    sq_get(v, -2);
    SQInteger handler_count = 0;
    sq_getinteger(v, -1, &handler_count);
    sq_pop(v, 1);

    sq_pushstring(v, "values", -1);
    sq_get(v, -2);
    SQInteger arr_len = sq_getsize(v, -1);
    int rc = 0;

    if (handler_count != 3) {
        fprintf(stderr, "FAIL: expected 3 handler invocations, got %lld\n",
                (long long)handler_count);
        rc = 1;
    }
    if (arr_len != 3) {
        fprintf(stderr, "FAIL: expected 3 recorded values, got %lld\n",
                (long long)arr_len);
        rc = 1;
    }
    /* Verify each recorded value matches what the worker sent. */
    for (SQInteger i = 0; i < arr_len; i++) {
        sq_pushinteger(v, i);
        sq_get(v, -2);
        SQInteger got = 0;
        sq_getinteger(v, -1, &got);
        sq_pop(v, 1);
        if (got != 100 + i) {
            fprintf(stderr, "FAIL: index %lld = %lld, want %lld\n",
                    (long long)i, (long long)got, (long long)(100 + i));
            rc = 1;
        }
    }
    sq_pop(v, 3); /* values array + results table + root */

    g_main_context_pop_thread_default(ctx);
    sqgi_vm_free(v);

    if (rc == 0) printf("[OK] test_signal_crossthread\n");
    return rc;
}
