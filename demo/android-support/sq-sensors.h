#pragma once
#include <gdk/gdk.h>
G_BEGIN_DECLS
#define SQ_ANDROID_TYPE_SENSOR (sq_android_sensor_get_type())
G_DECLARE_FINAL_TYPE(SqAndroidSensor, sq_android_sensor, SQ_ANDROID, SENSOR, GObject)
const gchar *sq_android_sensor_get_name(SqAndroidSensor *self);
const gchar *sq_android_sensor_get_vendor(SqAndroidSensor *self);
const gchar *sq_android_sensor_get_kind(SqAndroidSensor *self);
gint sq_android_sensor_get_sensor_type(SqAndroidSensor *self);
gdouble sq_android_sensor_get_resolution(SqAndroidSensor *self);
gboolean sq_android_sensor_is_wake_up(SqAndroidSensor *self);
/**
 * sq_android_sensor_get_state:
 * @self: a sensor
 * Returns: (transfer full): current acquisition state
 */
gchar *sq_android_sensor_get_state(SqAndroidSensor *self);
/**
 * sq_android_sensor_get_values:
 * @self: a sensor
 * @length: (out): number of values
 * Returns: (array length=length) (transfer full): latest values, empty before a reading
 */
gdouble *sq_android_sensor_get_values(SqAndroidSensor *self, gsize *length);
/**
 * sq_android_sensor_get_age:
 * @self: a sensor
 * Returns: seconds since the last reading, or -1 if none has arrived
 */
gdouble sq_android_sensor_get_age(SqAndroidSensor *self);

#define SQ_ANDROID_TYPE_SENSORS (sq_android_sensors_get_type())
G_DECLARE_FINAL_TYPE(SqAndroidSensors, sq_android_sensors, SQ_ANDROID, SENSORS, GObject)
/**
 * sq_android_sensors_new:
 * @surface: the presented window surface
 * @package_name: Android application ID
 * @error: return location for an initialization error
 * Returns: (transfer full): native Android sensor collection
 */
SqAndroidSensors *sq_android_sensors_new(GdkSurface *surface, const gchar *package_name, GError **error);
/**
 * sq_android_sensors_get_items:
 * @self: sensor collection
 * Returns: (element-type SqAndroidSensor) (transfer container): available sensors
 */
GPtrArray *sq_android_sensors_get_items(SqAndroidSensors *self);
void sq_android_sensors_start(SqAndroidSensors *self);
void sq_android_sensors_stop(SqAndroidSensors *self);
gboolean sq_android_sensors_is_active(SqAndroidSensors *self);
/**
 * sq_android_sensors_get_heading:
 * @self: sensor collection
 * Returns: magnetic heading of the phone's physical top, in degrees, or -1 if unavailable
 */
gdouble sq_android_sensors_get_heading(SqAndroidSensors *self);
G_END_DECLS
