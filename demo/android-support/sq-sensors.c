#include "sq-sensors.h"
#include <android/sensor.h>
#include <android/looper.h>
#include <math.h>
#include <time.h>

struct _SqAndroidSensor {
    GObject parent_instance;
    const ASensor *native;
    GMutex mutex;
    const char *state;
    double values[16];
    gsize length;
    gint64 timestamp;
};
G_DEFINE_TYPE(SqAndroidSensor, sq_android_sensor, G_TYPE_OBJECT)
static void sensor_finalize(GObject *object) {
    g_mutex_clear(&SQ_ANDROID_SENSOR(object)->mutex);
    G_OBJECT_CLASS(sq_android_sensor_parent_class)->finalize(object);
}
static void sq_android_sensor_class_init(SqAndroidSensorClass *klass) { G_OBJECT_CLASS(klass)->finalize = sensor_finalize; }
static void sq_android_sensor_init(SqAndroidSensor *self) { g_mutex_init(&self->mutex); self->state = "Paused"; }
const gchar *sq_android_sensor_get_name(SqAndroidSensor *self) { return ASensor_getName(self->native); }
const gchar *sq_android_sensor_get_vendor(SqAndroidSensor *self) { return ASensor_getVendor(self->native); }
const gchar *sq_android_sensor_get_kind(SqAndroidSensor *self) { return ASensor_getStringType(self->native); }
gint sq_android_sensor_get_sensor_type(SqAndroidSensor *self) { return ASensor_getType(self->native); }
gdouble sq_android_sensor_get_resolution(SqAndroidSensor *self) { return ASensor_getResolution(self->native); }
gboolean sq_android_sensor_is_wake_up(SqAndroidSensor *self) { return ASensor_isWakeUpSensor(self->native); }
static void set_state(SqAndroidSensor *self, const char *state) {
    g_mutex_lock(&self->mutex); self->state = state; g_mutex_unlock(&self->mutex);
}
gchar *sq_android_sensor_get_state(SqAndroidSensor *self) {
    g_mutex_lock(&self->mutex); gchar *state = g_strdup(self->state); g_mutex_unlock(&self->mutex); return state;
}
gdouble *sq_android_sensor_get_values(SqAndroidSensor *self, gsize *length) {
    g_mutex_lock(&self->mutex); *length = self->length;
    gdouble *values = g_memdup2(self->values, self->length * sizeof(double));
    g_mutex_unlock(&self->mutex); return values;
}
gdouble sq_android_sensor_get_age(SqAndroidSensor *self) {
    struct timespec now; clock_gettime(CLOCK_BOOTTIME, &now);
    g_mutex_lock(&self->mutex); gint64 timestamp = self->timestamp; g_mutex_unlock(&self->mutex);
    return timestamp ? now.tv_sec + now.tv_nsec / 1e9 - timestamp / 1e9 : -1;
}

struct _SqAndroidSensors {
    GObject parent_instance;
    ASensorManager *manager;
    GPtrArray *items;
    GdkToplevel *surface;
    gulong state_handler;
    GThread *thread;
    gint wanted, focused, quit;
};
G_DEFINE_TYPE(SqAndroidSensors, sq_android_sensors, G_TYPE_OBJECT)
static void sensors_dispose(GObject *object) {
    SqAndroidSensors *self = SQ_ANDROID_SENSORS(object);
    g_atomic_int_set(&self->quit, TRUE);
    if (self->thread) { g_thread_join(self->thread); self->thread = NULL; }
    if (self->state_handler) { g_signal_handler_disconnect(self->surface, self->state_handler); self->state_handler = 0; }
    g_clear_object(&self->surface);
    g_clear_pointer(&self->items, g_ptr_array_unref);
    G_OBJECT_CLASS(sq_android_sensors_parent_class)->dispose(object);
}
static void sq_android_sensors_class_init(SqAndroidSensorsClass *klass) { G_OBJECT_CLASS(klass)->dispose = sensors_dispose; }
static void sq_android_sensors_init(SqAndroidSensors *self) { self->items = g_ptr_array_new_with_free_func(g_object_unref); }
static void focus_changed(GObject *surface, GParamSpec *unused, gpointer data) {
    (void)unused; SqAndroidSensors *self = data;
    g_atomic_int_set(&self->focused, !!(gdk_toplevel_get_state(GDK_TOPLEVEL(surface)) & GDK_TOPLEVEL_STATE_FOCUSED));
}
/* Android defines different payload lengths for each standard sensor type.
 * Unknown/vendor-specific formats stay visible without inventing readings. */
static int value_count(int type) {
    switch (type) {
    case 1: case 2: case 3: case 4: case 9: case 10: return 3;
    case 11: case 20: return 5;
    case 15: return 4;
    case 14: case 16: case 35: return 6;
    case 5: case 6: case 7: case 8: case 12: case 13: case 17: case 18: case 19:
    case 21: case 22: case 23: case 24: case 25: case 26: case 27: case 28:
    case 29: case 30: case 31: case 34: case 36: return 1;
    default: return 0;
    }
}
static gpointer sensor_worker(gpointer data) {
    SqAndroidSensors *self = data;
    ALooper *looper = ALooper_prepare(ALOOPER_PREPARE_ALLOW_NON_CALLBACKS);
    ASensorEventQueue *queue = ASensorManager_createEventQueue(self->manager, looper, 1, NULL, NULL);
    if (!queue) {
        for (guint i = 0; i < self->items->len; i++) set_state(g_ptr_array_index(self->items, i), "Sensor queue unavailable");
        return NULL;
    }
    gboolean active = FALSE;
    while (!g_atomic_int_get(&self->quit)) {
        gboolean enabled = sq_android_sensors_is_active(self);
        if (active != enabled) {
            for (guint i = 0; i < self->items->len; i++) {
                SqAndroidSensor *item = g_ptr_array_index(self->items, i);
                if (!enabled) { ASensorEventQueue_disableSensor(queue, item->native); set_state(item, "Paused"); }
                else if (ASensor_getReportingMode(item->native) == AREPORTING_MODE_ONE_SHOT)
                    set_state(item, "One-shot sensor");
                else {
                    int rate = MAX(100000, ASensor_getMinDelay(item->native));
                    int result = ASensorEventQueue_registerSensor(queue, item->native, rate, 0);
                    set_state(item, result < 0 ? "Unavailable or permission required" : "Waiting for a reading");
                }
            }
            active = enabled;
        }
        ALooper_pollOnce(50, NULL, NULL, NULL);
        ASensorEvent events[32]; ssize_t count;
        while ((count = ASensorEventQueue_getEvents(queue, events, G_N_ELEMENTS(events))) > 0) {
            if (!active) continue;
            for (ssize_t j = 0; j < count; j++) for (guint i = 0; i < self->items->len; i++) {
                SqAndroidSensor *item = g_ptr_array_index(self->items, i);
                if (ASensor_getHandle(item->native) != events[j].sensor) continue;
                g_mutex_lock(&item->mutex);
                item->length = value_count(events[j].type); item->timestamp = events[j].timestamp;
                for (gsize k = 0; k < item->length; k++) item->values[k] = events[j].data[k];
                if (events[j].type == ASENSOR_TYPE_STEP_COUNTER) item->values[0] = events[j].u64.step_counter;
                item->state = item->length ? "Live" : "Unsupported value format";
                for (gsize k = 0; k < item->length; k++) if (!isfinite(item->values[k])) {
                    item->length = 0; item->state = "Invalid reading"; break;
                }
                g_mutex_unlock(&item->mutex); break;
            }
        }
    }
    ASensorManager_destroyEventQueue(self->manager, queue); return NULL;
}
SqAndroidSensors *sq_android_sensors_new(GdkSurface *surface, const gchar *package_name, GError **error) {
    if (!GDK_IS_TOPLEVEL(surface)) {
        g_set_error_literal(error, G_IO_ERROR, G_IO_ERROR_INVALID_ARGUMENT, "Present the GTK window first"); return NULL;
    }
    SqAndroidSensors *self = g_object_new(SQ_ANDROID_TYPE_SENSORS, NULL);
    self->manager = ASensorManager_getInstanceForPackage(package_name);
    ASensorList list; int count = self->manager ? ASensorManager_getSensorList(self->manager, &list) : -1;
    if (count < 0) {
        g_set_error_literal(error, G_IO_ERROR, G_IO_ERROR_FAILED, "Android sensor service unavailable");
        g_object_unref(self); return NULL;
    }
    for (int i = 0; i < count; i++) {
        SqAndroidSensor *item = g_object_new(SQ_ANDROID_TYPE_SENSOR, NULL);
        item->native = list[i]; g_ptr_array_add(self->items, item);
    }
    self->surface = g_object_ref(GDK_TOPLEVEL(surface));
    self->state_handler = g_signal_connect(surface, "notify::state", G_CALLBACK(focus_changed), self);
    focus_changed(G_OBJECT(surface), NULL, self);
    self->thread = g_thread_new("android-sensors", sensor_worker, self); return self;
}
GPtrArray *sq_android_sensors_get_items(SqAndroidSensors *self) {
    GPtrArray *items = g_ptr_array_new();
    for (guint i = 0; i < self->items->len; i++) g_ptr_array_add(items, g_ptr_array_index(self->items, i));
    return items;
}
void sq_android_sensors_start(SqAndroidSensors *self) { g_atomic_int_set(&self->wanted, TRUE); }
void sq_android_sensors_stop(SqAndroidSensors *self) { g_atomic_int_set(&self->wanted, FALSE); }
gboolean sq_android_sensors_is_active(SqAndroidSensors *self) { return g_atomic_int_get(&self->wanted) && g_atomic_int_get(&self->focused); }
gdouble sq_android_sensors_get_heading(SqAndroidSensors *self) {
    double a[3], m[3]; gboolean have_a = FALSE, have_m = FALSE;
    if (!sq_android_sensors_is_active(self)) return -1;
    for (guint i = 0; i < self->items->len; i++) {
        SqAndroidSensor *item = g_ptr_array_index(self->items, i); int type = ASensor_getType(item->native);
        if (type != 1 && type != 2) continue;
        g_mutex_lock(&item->mutex);
        if (item->length >= 3 && item->state[0] == 'L') {
            if (type == 1 && !have_a) { memcpy(a, item->values, sizeof(a)); have_a = TRUE; }
            if (type == 2 && !have_m) { memcpy(m, item->values, sizeof(m)); have_m = TRUE; }
        }
        g_mutex_unlock(&item->mutex);
    }
    if (!have_a || !have_m) return -1;
    double norm = sqrt(a[0]*a[0]+a[1]*a[1]+a[2]*a[2]); if (norm < 1) return -1;
    for (int i = 0; i < 3; i++) a[i] /= norm;
    double east[3] = {m[1]*a[2]-m[2]*a[1], m[2]*a[0]-m[0]*a[2], m[0]*a[1]-m[1]*a[0]};
    norm = sqrt(east[0]*east[0]+east[1]*east[1]+east[2]*east[2]); if (norm < 0.1) return -1;
    for (int i = 0; i < 3; i++) east[i] /= norm;
    double north_y = a[2]*east[0]-a[0]*east[2];
    return fmod(atan2(east[1], north_y)*180.0/G_PI + 360.0, 360.0);
}
