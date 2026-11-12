#pragma once
#include <gio/gio.h>

G_BEGIN_DECLS
#define SQ_WORKER_TYPE_LAUNCHER (sq_worker_launcher_get_type())
G_DECLARE_FINAL_TYPE(SqWorkerLauncher, sq_worker_launcher, SQ_WORKER, LAUNCHER, GObject)
#define SQ_WORKER_TYPE_PROCESS (sq_worker_process_get_type())
G_DECLARE_FINAL_TYPE(SqWorkerProcess, sq_worker_process, SQ_WORKER, PROCESS, GObject)

/**
 * sq_worker_launcher_new:
 * @flags: standard stream selection
 *
 * Creates a launcher for an isolated Android service running a SQGI script.
 * Returns: (transfer full): a launcher
 */
SqWorkerLauncher *sq_worker_launcher_new(GSubprocessFlags flags);
void sq_worker_launcher_set_cwd(SqWorkerLauncher *self, const gchar *directory);
void sq_worker_launcher_setenv(SqWorkerLauncher *self, const gchar *name,
                              const gchar *value, gboolean overwrite);
void sq_worker_launcher_unsetenv(SqWorkerLauncher *self, const gchar *name);
/**
 * sq_worker_launcher_spawnv:
 * @self: a launcher
 * @argv: (array zero-terminated=1): runtime name, script and script arguments
 * @error: return location for an error
 *
 * The first argument identifies SQGI; arbitrary native executables are not
 * launched. Each script has its own process, VM, environment and main context.
 * Returns: (transfer full): the worker
 */
SqWorkerProcess *sq_worker_launcher_spawnv(SqWorkerLauncher *self,
                                         const gchar *const *argv, GError **error);
/**
 * sq_worker_process_get_stdin_pipe:
 * @self: a worker
 * Returns: (transfer none) (nullable): the writable standard input pipe
 */
GOutputStream *sq_worker_process_get_stdin_pipe(SqWorkerProcess *self);
/**
 * sq_worker_process_get_stdout_pipe:
 * @self: a worker
 * Returns: (transfer none) (nullable): the readable standard output pipe
 */
GInputStream *sq_worker_process_get_stdout_pipe(SqWorkerProcess *self);
/**
 * sq_worker_process_get_stderr_pipe:
 * @self: a worker
 * Returns: (transfer none) (nullable): the readable standard error pipe
 */
GInputStream *sq_worker_process_get_stderr_pipe(SqWorkerProcess *self);
/**
 * sq_worker_process_wait:
 * @self: a worker
 * @cancellable: (nullable): cancellation of this wait, without stopping the worker
 * @error: return location for an error
 * Returns: whether the wait completed
 */
gboolean sq_worker_process_wait(SqWorkerProcess *self, GCancellable *cancellable, GError **error);
/**
 * sq_worker_process_wait_async:
 * @self: a worker
 * @cancellable: (nullable): cancellation of this wait
 * @callback: (scope async): completion callback
 * @user_data: (closure): callback data
 */
void sq_worker_process_wait_async(SqWorkerProcess *self, GCancellable *cancellable,
                                 GAsyncReadyCallback callback, gpointer user_data);
gboolean sq_worker_process_wait_finish(SqWorkerProcess *self, GAsyncResult *result, GError **error);
void sq_worker_process_force_exit(SqWorkerProcess *self);
gboolean sq_worker_process_get_if_exited(SqWorkerProcess *self);
gint sq_worker_process_get_exit_status(SqWorkerProcess *self);
gint sq_worker_process_get_term_sig(SqWorkerProcess *self);
gboolean sq_worker_process_get_successful(SqWorkerProcess *self);
G_END_DECLS
