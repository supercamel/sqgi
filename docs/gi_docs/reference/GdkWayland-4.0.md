# GdkWayland 4.0

SQGI import: `import("GdkWayland", "4.0")`

Packages: `gtk4-wayland`
Includes: `Gdk-4.0`
Libraries: `libgtk-4.so.1`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 8 |
| Interfaces | 0 |
| Records | 5 |
| Unions | 0 |
| Enums | 0 |
| Flags | 0 |
| Functions | 0 |
| Callbacks | 1 |
| Constants | 0 |
| Aliases | 0 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| WaylandDevice | Gdk.Device | 0 | 0 | 5 | The Wayland implementation of `GdkDevice`. Beyond the regular [class@Gdk.Device] API, the Wayland implementation provides access to Wayland objects... |
| WaylandDisplay | Gdk.Display | 0 | 0 | 7 | The Wayland implementation of `GdkDisplay`. Beyond the regular [class@Gdk.Display] API, the Wayland implementation provides access to Wayland objec... |
| WaylandGLContext | Gdk.GLContext | 0 | 0 | 0 | The Wayland implementation of `GdkGLContext`. |
| WaylandMonitor | Gdk.Monitor | 0 | 0 | 1 | The Wayland implementation of `GdkMonitor`. Beyond the [class@Gdk.Monitor] API, the Wayland implementation offers access to the Wayland `wl_output`... |
| WaylandPopup | WaylandSurface | 0 | 0 | 0 | The Wayland implementation of `GdkPopup`. |
| WaylandSeat | Gdk.Seat | 0 | 0 | 1 | The Wayland implementation of `GdkSeat`. Beyond the regular [class@Gdk.Seat] API, the Wayland implementation provides access to the Wayland `wl_sea... |
| WaylandSurface | Gdk.Surface | 2 | 0 | 1 | The Wayland implementation of `GdkSurface`. Beyond the [class@Gdk.Surface] API, the Wayland implementation offers access to the Wayland `wl_surface... |
| WaylandToplevel | WaylandSurface | 0 | 0 | 5 | The Wayland implementation of `GdkToplevel`. Beyond the [iface@Gdk.Toplevel] API, the Wayland implementation has API to set up cross-process parent... |

### GdkWayland.WaylandDevice

Parent: `Gdk.Device` ?? GType: `GdkWaylandDevice` ?? C type: `GdkWaylandDevice`

The Wayland implementation of `GdkDevice`. Beyond the regular [class@Gdk.Device] API, the Wayland implementation provides access to Wayland objects...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_node_path | `WaylandDevice.get_node_path() -> utf8` | gdk_wayland_device_get_node_path |  | Returns the `/dev/input/event*` path of this device. For `GdkDevice`s that possibly coalesce multiple hardware devices (eg. mouse, keyboard, touch,... |
| get_wl_keyboard | `WaylandDevice.get_wl_keyboard() -> gpointer` | gdk_wayland_device_get_wl_keyboard |  | Returns the Wayland `wl_keyboard` of a `GdkDevice`. |
| get_wl_pointer | `WaylandDevice.get_wl_pointer() -> gpointer` | gdk_wayland_device_get_wl_pointer |  | Returns the Wayland `wl_pointer` of a `GdkDevice`. |
| get_wl_seat | `WaylandDevice.get_wl_seat() -> gpointer` | gdk_wayland_device_get_wl_seat |  | Returns the Wayland `wl_seat` of a `GdkDevice`. |
| get_xkb_keymap | `WaylandDevice.get_xkb_keymap() -> gpointer` | gdk_wayland_device_get_xkb_keymap | 4.4 | Returns the `xkb_keymap` of a `GdkDevice`. |

### GdkWayland.WaylandDisplay

Parent: `Gdk.Display` ?? GType: `GdkWaylandDisplay` ?? C type: `GdkWaylandDisplay`

The Wayland implementation of `GdkDisplay`. Beyond the regular [class@Gdk.Display] API, the Wayland implementation provides access to Wayland objec...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_egl_display | `WaylandDisplay.get_egl_display() -> gpointer` | gdk_wayland_display_get_egl_display | 4.4 | Retrieves the EGL display connection object for the given GDK display. |
| get_startup_notification_id | `WaylandDisplay.get_startup_notification_id() -> utf8` | gdk_wayland_display_get_startup_notification_id |  | Gets the startup notification ID for a Wayland display, or %NULL if no ID has been defined. |
| get_wl_compositor | `WaylandDisplay.get_wl_compositor() -> gpointer` | gdk_wayland_display_get_wl_compositor |  | Returns the Wayland `wl_compositor` of a `GdkDisplay`. |
| get_wl_display | `WaylandDisplay.get_wl_display() -> gpointer` | gdk_wayland_display_get_wl_display |  | Returns the Wayland `wl_display` of a `GdkDisplay`. |
| query_registry | `WaylandDisplay.query_registry(global: utf8) -> gboolean` | gdk_wayland_display_query_registry |  | Returns %TRUE if the interface was found in the display `wl_registry.global` handler. |
| set_cursor_theme | `WaylandDisplay.set_cursor_theme(name: utf8, size: gint) -> none` | gdk_wayland_display_set_cursor_theme |  | Sets the cursor theme for the given @display. |
| set_startup_notification_id | `WaylandDisplay.set_startup_notification_id(startup_id: utf8) -> none` | gdk_wayland_display_set_startup_notification_id |  | Sets the startup notification ID for a display. This is usually taken from the value of the `DESKTOP_STARTUP_ID` environment variable, but in some ... |

### GdkWayland.WaylandGLContext

Parent: `Gdk.GLContext` ?? GType: `GdkWaylandGLContext` ?? C type: `GdkWaylandGLContext`

The Wayland implementation of `GdkGLContext`.

### GdkWayland.WaylandMonitor

Parent: `Gdk.Monitor` ?? GType: `GdkWaylandMonitor` ?? C type: `GdkWaylandMonitor`

The Wayland implementation of `GdkMonitor`. Beyond the [class@Gdk.Monitor] API, the Wayland implementation offers access to the Wayland `wl_output`...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_wl_output | `WaylandMonitor.get_wl_output() -> gpointer` | gdk_wayland_monitor_get_wl_output |  | Returns the Wayland `wl_output` of a `GdkMonitor`. |

### GdkWayland.WaylandPopup

Parent: `WaylandSurface` ?? Implements: `Gdk.Popup` ?? GType: `GdkWaylandPopup` ?? C type: `GdkWaylandPopup`

The Wayland implementation of `GdkPopup`.

### GdkWayland.WaylandSeat

Parent: `Gdk.Seat` ?? GType: `GdkWaylandSeat` ?? C type: `GdkWaylandSeat`

The Wayland implementation of `GdkSeat`. Beyond the regular [class@Gdk.Seat] API, the Wayland implementation provides access to the Wayland `wl_sea...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_wl_seat | `WaylandSeat.get_wl_seat() -> gpointer` | gdk_wayland_seat_get_wl_seat |  | Returns the Wayland `wl_seat` of a `GdkSeat`. |

### GdkWayland.WaylandSurface

Parent: `Gdk.Surface` ?? Subclasses: `WaylandPopup`, `WaylandToplevel` ?? GType: `GdkWaylandSurface` ?? C type: `GdkWaylandSurface`

The Wayland implementation of `GdkSurface`. Beyond the [class@Gdk.Surface] API, the Wayland implementation offers access to the Wayland `wl_surface...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_wl_surface | `WaylandSurface.get_wl_surface() -> gpointer` | gdk_wayland_surface_get_wl_surface |  | Returns the Wayland `wl_surface` of a `GdkSurface`. |

### GdkWayland.WaylandToplevel

Parent: `WaylandSurface` ?? Implements: `Gdk.Toplevel` ?? GType: `GdkWaylandToplevel` ?? C type: `GdkWaylandToplevel`

The Wayland implementation of `GdkToplevel`. Beyond the [iface@Gdk.Toplevel] API, the Wayland implementation has API to set up cross-process parent...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| drop_exported_handle | `WaylandToplevel.drop_exported_handle(handle: utf8) -> none` | gdk_wayland_toplevel_drop_exported_handle | 4.12 | Destroy a handle that was obtained with gdk_wayland_toplevel_export_handle(). Note that this API depends on an unstable Wayland protocol, and thus ... |
| export_handle | `WaylandToplevel.export_handle(callback: WaylandToplevelExported, user_data: gpointer?, destroy_func: GLib.DestroyNotify) -> gboolean` | gdk_wayland_toplevel_export_handle |  | Asynchronously obtains a handle for a surface that can be passed to other processes. When the handle has been obtained, @callback will be called. I... |
| set_application_id | `WaylandToplevel.set_application_id(application_id: utf8) -> none` | gdk_wayland_toplevel_set_application_id |  | Sets the application id on a `GdkToplevel`. |
| set_transient_for_exported | `WaylandToplevel.set_transient_for_exported(parent_handle_str: utf8) -> gboolean` | gdk_wayland_toplevel_set_transient_for_exported |  | Marks @toplevel as transient for the surface to which the given @parent_handle_str refers. Typically, the handle will originate from a [method@GdkW... |
| unexport_handle | `WaylandToplevel.unexport_handle() -> none` | gdk_wayland_toplevel_unexport_handle |  | Destroys the handle that was obtained with gdk_wayland_toplevel_export_handle(). It is an error to call this function on a surface that does not ha... |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| WaylandDeviceClass |  | 0 | 0 | 0 |  |
| WaylandDisplayClass |  | 0 | 0 | 0 |  |
| WaylandGLContextClass |  | 0 | 0 | 0 |  |
| WaylandMonitorClass |  | 0 | 0 | 0 |  |
| WaylandSeatClass |  | 0 | 0 | 0 |  |

### GdkWayland.WaylandDeviceClass

C type: `GdkWaylandDeviceClass`

### GdkWayland.WaylandDisplayClass

C type: `GdkWaylandDisplayClass`

### GdkWayland.WaylandGLContextClass

C type: `GdkWaylandGLContextClass`

### GdkWayland.WaylandMonitorClass

C type: `GdkWaylandMonitorClass`

### GdkWayland.WaylandSeatClass

C type: `GdkWaylandSeatClass`

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| WaylandToplevelExported | `WaylandToplevelExported(toplevel: WaylandToplevel, handle: utf8, user_data: gpointer?) -> none` |  |  | Callback that gets called when the handle for a surface has been obtained from the Wayland compositor. This callback is used in [method@GdkWayland.... |

