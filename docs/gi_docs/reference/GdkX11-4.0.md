# GdkX11 4.0

SQGI import: `import("GdkX11", "4.0")`

Packages: `gtk4-x11`
Includes: `Gdk-4.0`, `xlib-2.0`
Libraries: `libgtk-4.so.1`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 9 |
| Interfaces | 0 |
| Records | 9 |
| Unions | 0 |
| Enums | 1 |
| Flags | 0 |
| Functions | 9 |
| Callbacks | 0 |
| Constants | 0 |
| Aliases | 0 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| X11AppLaunchContext | Gdk.AppLaunchContext | 0 | 0 | 0 |  |
| X11DeviceManagerXI2 | GObject.Object | 0 | 0 | 0 |  |
| X11DeviceXI2 | Gdk.Device | 0 | 0 | 0 |  |
| X11Display | Gdk.Display | 0 | 1 | 26 | Tries to open a new display to the X server given by @display_name. If opening the display fails, %NULL is returned. |
| X11Drag | Gdk.Drag | 0 | 0 | 0 |  |
| X11GLContext | Gdk.GLContext | 0 | 0 | 0 |  |
| X11Monitor | Gdk.Monitor | 0 | 0 | 2 | Returns the XID of the Output corresponding to @monitor. |
| X11Screen | GObject.Object | 0 | 1 | 7 | Returns the current workspace for @screen when running under a window manager that supports multiple workspaces, as described in the Extended Windo... |
| X11Surface | Gdk.Surface | 0 | 0 | 14 | Looks up the `GdkSurface` that wraps the given native window handle. |

### GdkX11.X11AppLaunchContext

Parent: `Gdk.AppLaunchContext` ?? GType: `GdkX11AppLaunchContext` ?? C type: `GdkX11AppLaunchContext`

### GdkX11.X11DeviceManagerXI2

Parent: `GObject.Object` ?? GType: `GdkX11DeviceManagerXI2` ?? C type: `GdkX11DeviceManagerXI2`

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| display | Gdk.Display | read, write, construct-only |  |
| major | gint | read, write, construct-only |  |
| minor | gint | read, write, construct-only |  |
| opcode | gint | read, write, construct-only |  |

### GdkX11.X11DeviceXI2

Parent: `Gdk.Device` ?? GType: `GdkX11DeviceXI2` ?? C type: `GdkX11DeviceXI2`

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
| device-id | gint | read, write, construct-only |  |

### GdkX11.X11Display

Parent: `Gdk.Display` ?? GType: `GdkX11Display` ?? C type: `GdkX11Display`

Tries to open a new display to the X server given by @display_name. If opening the display fails, %NULL is returned.

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| open | `open(display_name: utf8?) -> Gdk.Display` | gdk_x11_display_open |  | Tries to open a new display to the X server given by @display_name. If opening the display fails, %NULL is returned. |
| set_program_class | `set_program_class(display: Gdk.Display, program_class: utf8) -> none` | gdk_x11_display_set_program_class |  | Sets the program class. The X11 backend uses the program class to set the class name part of the `WM_CLASS` property on toplevel windows; see the I... |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| broadcast_startup_message | `X11Display.broadcast_startup_message(message_type: utf8, ...: void) -> none` | gdk_x11_display_broadcast_startup_message |  | Sends a startup notification message of type @message_type to @display. This is a convenience function for use by code that implements the freedesk... |
| error_trap_pop | `X11Display.error_trap_pop() -> gint` | gdk_x11_display_error_trap_pop |  | Pops the error trap pushed by gdk_x11_display_error_trap_push(). Will XSync() if necessary and will always block until the error is known to have o... |
| error_trap_pop_ignored | `X11Display.error_trap_pop_ignored() -> none` | gdk_x11_display_error_trap_pop_ignored |  | Pops the error trap pushed by gdk_x11_display_error_trap_push(). Does not block to see if an error occurred; merely records the range of requests t... |
| error_trap_push | `X11Display.error_trap_push() -> none` | gdk_x11_display_error_trap_push |  | Begins a range of X requests on @display for which X error events will be ignored. Unignored errors (when no trap is pushed) will abort the applica... |
| get_default_group | `X11Display.get_default_group() -> Gdk.Surface` | gdk_x11_display_get_default_group |  | Returns the default group leader surface for all toplevel surfaces on @display. This surface is implicitly created by GDK. See gdk_x11_surface_set_... |
| get_egl_display | `X11Display.get_egl_display() -> gpointer` | gdk_x11_display_get_egl_display | 4.4 | Retrieves the EGL display connection object for the given GDK display. This function returns `NULL` if GDK is using GLX. |
| get_egl_version | `X11Display.get_egl_version(major: out gint, minor: out gint) -> gboolean` | gdk_x11_display_get_egl_version | 4.4 | Retrieves the version of the EGL implementation. |
| get_glx_version | `X11Display.get_glx_version(major: out gint, minor: out gint) -> gboolean` | gdk_x11_display_get_glx_version |  | Retrieves the version of the GLX implementation. |
| get_primary_monitor | `X11Display.get_primary_monitor() -> Gdk.Monitor` | gdk_x11_display_get_primary_monitor |  | Gets the primary monitor for the display. The primary monitor is considered the monitor where the ???main desktop??? lives. While normal applicatio... |
| get_screen | `X11Display.get_screen() -> X11Screen` | gdk_x11_display_get_screen |  | Retrieves the `GdkX11Screen` of the @display. |
| get_startup_notification_id | `X11Display.get_startup_notification_id() -> utf8` | gdk_x11_display_get_startup_notification_id |  | Gets the startup notification ID for a display. |
| get_user_time | `X11Display.get_user_time() -> guint32` | gdk_x11_display_get_user_time |  | Returns the timestamp of the last user interaction on @display. The timestamp is taken from events caused by user interaction such as key presses o... |
| get_xcursor | `X11Display.get_xcursor(cursor: Gdk.Cursor) -> xlib.Cursor` | gdk_x11_display_get_xcursor |  | Returns the X cursor belonging to a `GdkCursor`, potentially creating the cursor. Be aware that the returned cursor may not be unique to @cursor. I... |
| get_xdisplay | `X11Display.get_xdisplay() -> xlib.Display` | gdk_x11_display_get_xdisplay |  | Returns the X display of a `GdkDisplay`. |
| get_xrootwindow | `X11Display.get_xrootwindow() -> xlib.Window` | gdk_x11_display_get_xrootwindow |  | Returns the root X window used by `GdkDisplay`. |
| get_xscreen | `X11Display.get_xscreen() -> xlib.Screen` | gdk_x11_display_get_xscreen |  | Returns the X Screen used by `GdkDisplay`. |
| grab | `X11Display.grab() -> none` | gdk_x11_display_grab |  | Call XGrabServer() on @display. To ungrab the display again, use gdk_x11_display_ungrab(). gdk_x11_display_grab()/gdk_x11_display_ungrab() calls ca... |
| set_cursor_theme | `X11Display.set_cursor_theme(theme: utf8?, size: gint) -> none` | gdk_x11_display_set_cursor_theme |  | Sets the cursor theme from which the images for cursor should be taken. If the windowing system supports it, existing cursors created with [ctor@Gd... |
| set_startup_notification_id | `X11Display.set_startup_notification_id(startup_id: utf8) -> none` | gdk_x11_display_set_startup_notification_id |  | Sets the startup notification ID for a display. This is usually taken from the value of the DESKTOP_STARTUP_ID environment variable, but in some ca... |
| set_surface_scale | `X11Display.set_surface_scale(scale: gint) -> none` | gdk_x11_display_set_surface_scale |  | Forces a specific window scale for all windows on this display, instead of using the default or user configured scale. This is can be used to disab... |
| string_to_compound_text | `X11Display.string_to_compound_text(str: utf8, encoding: out utf8, format: out gint, ctext: out guint8, length: out gint) -> gint` | gdk_x11_display_string_to_compound_text |  | Convert a string from the encoding of the current locale into a form suitable for storing in a window property. |
| text_property_to_text_list | `X11Display.text_property_to_text_list(encoding: utf8, format: gint, text: guint8, length: gint, list: utf8) -> gint` | gdk_x11_display_text_property_to_text_list |  | Convert a text string from the encoding as it is stored in a property into an array of strings in the encoding of the current locale. (The elements... |
| ungrab | `X11Display.ungrab() -> none` | gdk_x11_display_ungrab |  | Ungrab @display after it has been grabbed with gdk_x11_display_grab(). |
| utf8_to_compound_text | `X11Display.utf8_to_compound_text(str: utf8, encoding: out utf8, format: out gint, ctext: out guint8, length: out gint) -> gboolean` | gdk_x11_display_utf8_to_compound_text |  | Converts from UTF-8 to compound text. |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| xevent | `xevent: gpointer?` | gboolean | last |  | The ::xevent signal is a low level signal that is emitted whenever an XEvent has been received. When handlers to this signal return %TRUE, no other... |

### GdkX11.X11Drag

Parent: `Gdk.Drag` ?? GType: `GdkX11Drag` ?? C type: `GdkX11Drag`

### GdkX11.X11GLContext

Parent: `Gdk.GLContext` ?? GType: `GdkX11GLContext` ?? C type: `GdkX11GLContext` ?? Abstract

### GdkX11.X11Monitor

Parent: `Gdk.Monitor` ?? GType: `GdkX11Monitor` ?? C type: `GdkX11Monitor`

Returns the XID of the Output corresponding to @monitor.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_output | `X11Monitor.get_output() -> xlib.XID` | gdk_x11_monitor_get_output |  | Returns the XID of the Output corresponding to @monitor. |
| get_workarea | `X11Monitor.get_workarea(workarea: out Gdk.Rectangle) -> none` | gdk_x11_monitor_get_workarea |  | Retrieves the size and position of the ???work area??? on a monitor within the display coordinate space. The returned geometry is in ???application... |

### GdkX11.X11Screen

Parent: `GObject.Object` ?? GType: `GdkX11Screen` ?? C type: `GdkX11Screen`

Returns the current workspace for @screen when running under a window manager that supports multiple workspaces, as described in the Extended Windo...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_current_desktop | `X11Screen.get_current_desktop() -> guint32` | gdk_x11_screen_get_current_desktop |  | Returns the current workspace for @screen when running under a window manager that supports multiple workspaces, as described in the Extended Windo... |
| get_monitor_output | `X11Screen.get_monitor_output(monitor_num: gint) -> xlib.XID` | gdk_x11_screen_get_monitor_output |  | Gets the XID of the specified output/monitor. If the X server does not support version 1.2 of the RANDR extension, 0 is returned. |
| get_number_of_desktops | `X11Screen.get_number_of_desktops() -> guint32` | gdk_x11_screen_get_number_of_desktops |  | Returns the number of workspaces for @screen when running under a window manager that supports multiple workspaces, as described in the Extended Wi... |
| get_screen_number | `X11Screen.get_screen_number() -> gint` | gdk_x11_screen_get_screen_number |  | Returns the index of a `GdkX11Screen`. |
| get_window_manager_name | `X11Screen.get_window_manager_name() -> utf8` | gdk_x11_screen_get_window_manager_name |  | Returns the name of the window manager for @screen. |
| get_xscreen | `X11Screen.get_xscreen() -> xlib.Screen` | gdk_x11_screen_get_xscreen |  | Returns the screen of a `GdkX11Screen`. |
| supports_net_wm_hint | `X11Screen.supports_net_wm_hint(property_name: utf8) -> gboolean` | gdk_x11_screen_supports_net_wm_hint |  | This function is specific to the X11 backend of GDK, and indicates whether the window manager supports a certain hint from the Extended Window Mana... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| window-manager-changed | `` | none | last |  |  |

### GdkX11.X11Surface

Parent: `Gdk.Surface` ?? GType: `GdkX11Surface` ?? C type: `GdkX11Surface`

Looks up the `GdkSurface` that wraps the given native window handle.

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| lookup_for_display | `lookup_for_display(display: X11Display, window: xlib.Window) -> X11Surface` | gdk_x11_surface_lookup_for_display |  | Looks up the `GdkSurface` that wraps the given native window handle. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_desktop | `X11Surface.get_desktop() -> guint32` | gdk_x11_surface_get_desktop |  | Gets the number of the workspace @surface is on. |
| get_group | `X11Surface.get_group() -> Gdk.Surface` | gdk_x11_surface_get_group |  | Returns the group this surface belongs to. |
| get_xid | `X11Surface.get_xid() -> xlib.Window` | gdk_x11_surface_get_xid |  | Returns the X resource (surface) belonging to a `GdkSurface`. |
| move_to_current_desktop | `X11Surface.move_to_current_desktop() -> none` | gdk_x11_surface_move_to_current_desktop |  | Moves the surface to the correct workspace when running under a window manager that supports multiple workspaces, as described in the Extended Wind... |
| move_to_desktop | `X11Surface.move_to_desktop(desktop: guint32) -> none` | gdk_x11_surface_move_to_desktop |  | Moves the surface to the given workspace when running unde a window manager that supports multiple workspaces, as described in the Extended Window ... |
| set_frame_sync_enabled | `X11Surface.set_frame_sync_enabled(frame_sync_enabled: gboolean) -> none` | gdk_x11_surface_set_frame_sync_enabled |  | This function can be used to disable frame synchronization for a surface. Normally frame synchronziation will be enabled or disabled based on wheth... |
| set_group | `X11Surface.set_group(leader: Gdk.Surface) -> none` | gdk_x11_surface_set_group |  | Sets the group leader of @surface to be @leader. See the ICCCM for details. |
| set_skip_pager_hint | `X11Surface.set_skip_pager_hint(skips_pager: gboolean) -> none` | gdk_x11_surface_set_skip_pager_hint |  | Sets a hint on @surface that pagers should not display it. See the EWMH for details. |
| set_skip_taskbar_hint | `X11Surface.set_skip_taskbar_hint(skips_taskbar: gboolean) -> none` | gdk_x11_surface_set_skip_taskbar_hint |  | Sets a hint on @surface that taskbars should not display it. See the EWMH for details. |
| set_theme_variant | `X11Surface.set_theme_variant(variant: utf8) -> none` | gdk_x11_surface_set_theme_variant |  | GTK applications can request a dark theme variant. In order to make other applications - namely window managers using GTK for themeing - aware of t... |
| set_urgency_hint | `X11Surface.set_urgency_hint(urgent: gboolean) -> none` | gdk_x11_surface_set_urgency_hint |  | Sets a hint on @surface that it needs user attention. See the ICCCM for details. |
| set_user_time | `X11Surface.set_user_time(timestamp: guint32) -> none` | gdk_x11_surface_set_user_time |  | The application can use this call to update the _NET_WM_USER_TIME property on a toplevel surface. This property stores an Xserver time which repres... |
| set_utf8_property | `X11Surface.set_utf8_property(name: utf8, value: utf8?) -> none` | gdk_x11_surface_set_utf8_property |  | This function modifies or removes an arbitrary X11 window property of type UTF8_STRING. If the given @surface is not a toplevel surface, it is igno... |

## Enums

### GdkX11.X11DeviceType

C type: `GdkX11DeviceType`

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| floating | 2 |  |  |
| logical | 0 |  |  |
| physical | 1 |  |  |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| X11AppLaunchContextClass |  | 0 | 0 | 0 |  |
| X11DeviceManagerXI2Class |  | 0 | 0 | 0 |  |
| X11DeviceXI2Class |  | 0 | 0 | 0 |  |
| X11DisplayClass |  | 0 | 0 | 0 |  |
| X11DragClass |  | 0 | 0 | 0 |  |
| X11GLContextClass |  | 0 | 0 | 0 |  |
| X11MonitorClass |  | 0 | 0 | 0 |  |
| X11ScreenClass |  | 0 | 0 | 0 |  |
| X11SurfaceClass |  | 0 | 0 | 0 |  |

### GdkX11.X11AppLaunchContextClass

C type: `GdkX11AppLaunchContextClass`

### GdkX11.X11DeviceManagerXI2Class

C type: `GdkX11DeviceManagerXI2Class`

### GdkX11.X11DeviceXI2Class

C type: `GdkX11DeviceXI2Class`

### GdkX11.X11DisplayClass

C type: `GdkX11DisplayClass`

### GdkX11.X11DragClass

C type: `GdkX11DragClass`

### GdkX11.X11GLContextClass

C type: `GdkX11GLContextClass`

### GdkX11.X11MonitorClass

C type: `GdkX11MonitorClass`

### GdkX11.X11ScreenClass

C type: `GdkX11ScreenClass`

### GdkX11.X11SurfaceClass

C type: `GdkX11SurfaceClass`

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| x11_device_get_id | `x11_device_get_id(device: X11DeviceXI2) -> gint` | gdk_x11_device_get_id |  | Returns the device ID as seen by XInput2. |
| x11_device_manager_lookup | `x11_device_manager_lookup(device_manager: X11DeviceManagerXI2, device_id: gint) -> X11DeviceXI2` | gdk_x11_device_manager_lookup |  | Returns the `GdkDevice` that wraps the given device ID. |
| x11_free_compound_text | `x11_free_compound_text(ctext: guint8) -> none` | gdk_x11_free_compound_text |  | Frees the data returned from gdk_x11_display_string_to_compound_text(). |
| x11_free_text_list | `x11_free_text_list(list: utf8) -> none` | gdk_x11_free_text_list |  | Frees the array of strings created by gdk_x11_display_text_property_to_text_list(). |
| x11_get_server_time | `x11_get_server_time(surface: X11Surface) -> guint32` | gdk_x11_get_server_time |  | Routine to get the current X server time stamp. |
| x11_get_xatom_by_name_for_display | `x11_get_xatom_by_name_for_display(display: X11Display, atom_name: utf8) -> xlib.Atom` | gdk_x11_get_xatom_by_name_for_display |  | Returns the X atom for a `GdkDisplay` corresponding to @atom_name. This function caches the result, so if called repeatedly it is much faster than ... |
| x11_get_xatom_name_for_display | `x11_get_xatom_name_for_display(display: X11Display, xatom: xlib.Atom) -> utf8` | gdk_x11_get_xatom_name_for_display |  | Returns the name of an X atom for its display. This function is meant mainly for debugging, so for convenience, unlike XAtomName() and the result d... |
| x11_lookup_xdisplay | `x11_lookup_xdisplay(xdisplay: xlib.Display) -> X11Display` | gdk_x11_lookup_xdisplay |  | Find the `GdkDisplay` corresponding to @xdisplay, if any exists. |
| x11_set_sm_client_id | `x11_set_sm_client_id(sm_client_id: utf8?) -> none` | gdk_x11_set_sm_client_id |  | Sets the `SM_CLIENT_ID` property on the application???s leader window so that the window manager can save the application???s state using the X11R6... |

