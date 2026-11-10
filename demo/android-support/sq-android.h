#pragma once
#include <gdk/gdk.h>
G_BEGIN_DECLS
#define SQ_ANDROID_TYPE_DEVICE (sq_android_device_get_type())
G_DECLARE_FINAL_TYPE(SqAndroidDevice, sq_android_device, SQ_ANDROID, DEVICE, GObject)
/**
 * sq_android_device_new:
 * @surface: the presented GTK window's Android surface
 * @error: return location for an initialization error
 *
 * Attach to Android services without starting capture or requesting permissions.
 * Returns: (transfer full): the device service object
 */
SqAndroidDevice *sq_android_device_new(GdkSurface *surface, GError **error);
void sq_android_device_request_location(SqAndroidDevice *self, GError **error);
void sq_android_device_stop_location(SqAndroidDevice *self, GError **error);
void sq_android_device_request_camera(SqAndroidDevice *self, GError **error);
gboolean sq_android_device_has_camera_permission(SqAndroidDevice *self, GError **error);
/**
 * sq_android_device_snapshot:
 * @self: a device service object
 * @error: return location for a service error
 *
 * Read the latest foreground location state.
 * Returns: (transfer full): a JSON snapshot; missing readings are null or empty
 */
gchar *sq_android_device_snapshot(SqAndroidDevice *self, GError **error);
/**
 * sq_android_device_cameras:
 * @self: a device service object
 * @error: return location for a service error
 *
 * Enumerate camera IDs, facing directions and sensor orientations.
 * Returns: (transfer full): a JSON array of cameras supported by ahcsrc
 */
gchar *sq_android_device_cameras(SqAndroidDevice *self, GError **error);
G_END_DECLS
