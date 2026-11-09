#include "sq-mobile.h"

struct _SqMobileWorker { GObject parent_instance; gchar *label; };
G_DEFINE_TYPE(SqMobileWorker, sq_mobile_worker, G_TYPE_OBJECT)
static guint alive, progressed;
enum { PROP_0, PROP_LABEL, PROP_COUNT };
static GParamSpec *properties[PROP_COUNT];

gint sq_mobile_sum(gint a, gint b) { return a + b; }
guint sq_mobile_layout_size(void) { return sizeof(SqMobileLayout); }
guint64 sq_mobile_layout_read(const SqMobileLayout *layout) { return layout->value; }
const gchar *sq_mobile_abi(void) {
#ifdef __aarch64__
    return "arm64-v8a";
#else
    return "x86_64";
#endif
}
guint sq_mobile_alive_count(void) { return alive; }

static void get_property(GObject *object, guint property, GValue *value, GParamSpec *pspec) {
    if (property == PROP_LABEL) g_value_set_string(value, SQ_MOBILE_WORKER(object)->label);
    else G_OBJECT_WARN_INVALID_PROPERTY_ID(object, property, pspec);
}
static void set_property(GObject *object, guint property, const GValue *value, GParamSpec *pspec) {
    SqMobileWorker *self = SQ_MOBILE_WORKER(object);
    if (property == PROP_LABEL) { g_free(self->label); self->label = g_value_dup_string(value); }
    else G_OBJECT_WARN_INVALID_PROPERTY_ID(object, property, pspec);
}
static void finalize(GObject *object) {
    g_free(SQ_MOBILE_WORKER(object)->label); --alive;
    G_OBJECT_CLASS(sq_mobile_worker_parent_class)->finalize(object);
}
static void sq_mobile_worker_class_init(SqMobileWorkerClass *klass) {
    GObjectClass *object = G_OBJECT_CLASS(klass);
    object->get_property = get_property; object->set_property = set_property; object->finalize = finalize;
    properties[PROP_LABEL] = g_param_spec_string("label", "Label", "Worker label", "worker", G_PARAM_READWRITE);
    g_object_class_install_properties(object, PROP_COUNT, properties);
    progressed = g_signal_new("progressed", G_TYPE_FROM_CLASS(klass), G_SIGNAL_RUN_LAST,
        0, NULL, NULL, NULL, G_TYPE_NONE, 1, G_TYPE_INT);
}
static void sq_mobile_worker_init(SqMobileWorker *self) { self->label = g_strdup("worker"); ++alive; }
/**
 * sq_mobile_worker_new:
 * @label: worker label
 * Returns: (transfer full): a worker
 */
SqMobileWorker *sq_mobile_worker_new(const gchar *label) {
    return g_object_new(SQ_MOBILE_TYPE_WORKER, "label", label, NULL);
}
void sq_mobile_worker_emit_progress(SqMobileWorker *self, gint value) { g_signal_emit(self, progressed, 0, value); }
static gboolean complete_sum(gpointer data) {
    GTask *task = data;
    gint *operands = g_task_get_task_data(task);
    if (operands[0] < 0) g_task_return_new_error(task, G_IO_ERROR, G_IO_ERROR_FAILED, "planned C error");
    else {
        gint sum = operands[0] + operands[1];
        sq_mobile_worker_emit_progress(g_task_get_source_object(task), sum);
        g_task_return_int(task, sum);
    }
    return G_SOURCE_REMOVE;
}
void sq_mobile_worker_sum_async(SqMobileWorker *self, gint a, gint b,
    GCancellable *cancellable, GAsyncReadyCallback callback, gpointer user_data) {
    GTask *task = g_task_new(self, cancellable, callback, user_data);
    gint *operands = g_new(gint, 2); operands[0] = a; operands[1] = b;
    g_task_set_task_data(task, operands, g_free);
    g_idle_add_full(G_PRIORITY_DEFAULT, complete_sum, task, g_object_unref);
}
gint sq_mobile_worker_sum_finish(SqMobileWorker *self, GAsyncResult *result, GError **error) {
    g_return_val_if_fail(g_task_is_valid(result, self), -1);
    return g_task_propagate_int(G_TASK(result), error);
}
