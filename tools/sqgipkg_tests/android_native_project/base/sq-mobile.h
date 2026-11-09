#pragma once
#include <gio/gio.h>
G_BEGIN_DECLS

typedef struct {
    guint32 marker;
    guint64 padding;
#ifdef __aarch64__
    guint64 arm64_only;
#endif
    guint64 value;
} SqMobileLayout;

gint sq_mobile_sum(gint a, gint b);
guint sq_mobile_layout_size(void);
guint64 sq_mobile_layout_read(const SqMobileLayout *layout);
const gchar *sq_mobile_abi(void);
guint sq_mobile_alive_count(void);

#define SQ_MOBILE_TYPE_WORKER (sq_mobile_worker_get_type())
G_DECLARE_FINAL_TYPE(SqMobileWorker, sq_mobile_worker, SQ_MOBILE, WORKER, GObject)
SqMobileWorker *sq_mobile_worker_new(const gchar *label);
void sq_mobile_worker_emit_progress(SqMobileWorker *self, gint value);
/**
 * sq_mobile_worker_sum_async:
 * @self: the worker
 * @a: first operand; negative requests an error
 * @b: second operand
 * @cancellable: (nullable): cancellation
 * @callback: (scope async) (nullable): completion callback
 * @user_data: (closure): callback state
 */
void sq_mobile_worker_sum_async(SqMobileWorker *self, gint a, gint b,
    GCancellable *cancellable, GAsyncReadyCallback callback, gpointer user_data);
gint sq_mobile_worker_sum_finish(SqMobileWorker *self, GAsyncResult *result, GError **error);
G_END_DECLS
