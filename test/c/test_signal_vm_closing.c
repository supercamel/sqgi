/* test/c/test_signal_vm_closing.c
 *
 * Exercises sqgi_signal.c's VM-closing tracking machinery that is otherwise
 * untested:
 *
 *   - sqgi_signal_unmark_vm_closing() — exported but never called internally
 *     (line 42-53). Tests the hash-table teardown when the last marked VM
 *     is removed, and re-creation on the next mark.
 *
 *   - The cross-thread marshal early-return path (line 140): if the VM is
 *     marked closing while a cross-thread signal emit is racing in, the
 *     marshal must drop the signal silently rather than touching the freed
 *     VM. We simulate this by marking the VM closing *before* emitting from
 *     the worker thread, and asserting the handler never fires.
 */

#include <sqgi_vm.h>
#include <sqgi_marshal.h>
#include <sqgi_signal.h>

#include <gio/gio.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    GSimpleAction *action;
    GMainLoop     *loop;
} WorkerCtx;

static gpointer worker_emit_thread(gpointer user_data)
{
    WorkerCtx *wc = (WorkerCtx *)user_data;
    GVariant *param = g_variant_new_int32(123);
    g_variant_ref_sink(param);
    g_signal_emit_by_name(wc->action, "activate", param);
    g_variant_unref(param);
    /* Give the marshal a chance to post back (it shouldn't, but make sure
     * the main loop has time to run any spurious idles). */
    g_usleep(50 * 1000);
    g_main_context_invoke(NULL, (GSourceFunc)g_main_loop_quit, wc->loop);
    return NULL;
}

int main(void)
{
    int rc = 0;

    /* ── Part 1: mark/unmark lifecycle and hash-table teardown ─────────── */
    /* Use opaque non-NULL pointers as fake VMs — the API only does pointer
     * identity comparisons in g_hash_table, never dereferences. */
    HSQUIRRELVM fake_a = (HSQUIRRELVM)(uintptr_t)0xA;
    HSQUIRRELVM fake_b = (HSQUIRRELVM)(uintptr_t)0xB;

    sqgi_signal_mark_vm_closing(fake_a);
    sqgi_signal_mark_vm_closing(fake_b);

    /* NULL arg is a no-op. */
    sqgi_signal_mark_vm_closing(NULL);
    sqgi_signal_unmark_vm_closing(NULL);

    /* Removing one should not destroy the table. */
    sqgi_signal_unmark_vm_closing(fake_a);
    /* Removing the last should destroy and re-NULL the table. */
    sqgi_signal_unmark_vm_closing(fake_b);

    /* Re-creation path: mark again after teardown → new hash table. */
    sqgi_signal_mark_vm_closing(fake_a);
    sqgi_signal_unmark_vm_closing(fake_a);

    /* Calling unmark when the table is empty/NULL is a no-op (defensive). */
    sqgi_signal_unmark_vm_closing(fake_b);

    /* ── Part 2: cross-thread emit dropped when VM is closing ──────────── */
    HSQUIRRELVM v = sqgi_vm_new();
    if (!v) { fprintf(stderr, "sqgi_vm_new failed\n"); return 1; }

    GMainContext *ctx = g_main_context_default();
    g_main_context_push_thread_default(ctx);

    GSimpleAction *action = g_simple_action_new("a", G_VARIANT_TYPE_INT32);

    const char *setup =
        "Gio <- import(\"Gio\")\n"
        "fired <- 0\n";
    if (SQ_FAILED(sqgi_vm_dobuffer(v, setup, (SQInteger)strlen(setup),
                                   "setup"))) return 1;

    sq_pushroottable(v);
    sq_pushstring(v, "the_action", -1);
    sqgi_push_gobject(v, G_OBJECT(action));
    sq_newslot(v, -3, SQFalse);
    sq_pop(v, 1);
    g_object_unref(action);

    const char *script =
        "the_action.connect(\"activate\", function(param) { fired++ })\n";
    if (SQ_FAILED(sqgi_vm_dobuffer(v, script, (SQInteger)strlen(script),
                                   "script"))) return 1;

    /* Mark VM as closing *before* the emit, so the cross-thread marshal
     * sees the flag and drops the signal. */
    sqgi_signal_mark_vm_closing(v);

    GMainLoop *loop = g_main_loop_new(ctx, FALSE);
    WorkerCtx wc = { .action = action, .loop = loop };
    GThread *t = g_thread_new("emit", worker_emit_thread, &wc);

    guint timeout_id = g_timeout_add_seconds(3,
        (GSourceFunc)g_main_loop_quit, loop);
    g_main_loop_run(loop);
    g_source_remove(timeout_id);
    g_thread_join(t);
    g_main_loop_unref(loop);

    /* Handler must NOT have fired — verify Squirrel-side `fired` is 0. */
    sq_pushroottable(v);
    sq_pushstring(v, "fired", -1);
    sq_get(v, -2);
    SQInteger fired = -1;
    sq_getinteger(v, -1, &fired);
    sq_pop(v, 2);

    if (fired != 0) {
        fprintf(stderr, "FAIL: handler fired %lld times despite VM closing\n",
                (long long)fired);
        rc = 1;
    }

    /* Unmark before free so other tests sharing process state (none here,
     * but it's the proper API contract) see a clean slate. */
    sqgi_signal_unmark_vm_closing(v);

    g_main_context_pop_thread_default(ctx);
    sqgi_vm_free(v);

    if (rc == 0) printf("[OK] test_signal_vm_closing\n");
    return rc;
}
