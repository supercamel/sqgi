#pragma once

#include <squirrel.h>
#include <glib-object.h>

#ifdef __cplusplus
extern "C" {
#endif

/*
 * sqgi_signal_connect
 *
 * Connect Squirrel closure at stack index `handler_idx` to `signal` on `obj`.
 * Returns the handler id (>0) on success, or 0 on failure.
 *
 * The closure is referenced via sq_addref and released when the connection is
 * invalidated (gobject destruction or explicit disconnect).
 */
gulong sqgi_signal_connect(HSQUIRRELVM v, GObject *obj, const char *signal,
                           SQInteger handler_idx);

/*
 * sqgi_signal_disconnect
 *
 * Disconnect a signal handler by id. The Squirrel closure reference is
 * released automatically via the GClosure invalidate notifier.
 */
void sqgi_signal_disconnect(GObject *obj, gulong handler_id);

/*
 * sqgi_signal_mark_vm_closing
 *
 * Marks a VM as shutting down. Signal closure invalidation callbacks will
 * avoid calling back into Squirrel for marked VMs.
 */
void sqgi_signal_mark_vm_closing(HSQUIRRELVM v);

/*
 * sqgi_signal_unmark_vm_closing
 *
 * Clears the closing-VM mark. Call only if a VM is reused after a prior
 * shutdown signal — usually for tests. Releases the internal hash entry.
 */
void sqgi_signal_unmark_vm_closing(HSQUIRRELVM v);

/*
 * sqgi_signal_vm_is_closing
 *
 * Returns TRUE if `v` is currently in shutdown. Other modules that release
 * Squirrel objects from GLib teardown callbacks consult this to avoid
 * touching the reftable after sq_close has begun.
 */
gboolean sqgi_signal_vm_is_closing(HSQUIRRELVM v);

#ifdef __cplusplus
}
#endif
