# GdkX11 3.0

SQGI import: `import("GdkX11", "3.0")`

Packages: `gdk-x11-3.0`
Includes: `Gdk-3.0`, `GdkPixbuf-2.0`, `Gio-2.0`, `Pango-1.0`, `cairo-1.0`, `xlib-2.0`
Libraries: `libgdk-3.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 15 |
| Interfaces | 0 |
| Records | 15 |
| Unions | 0 |
| Enums | 0 |
| Flags | 0 |
| Functions | 22 |
| Callbacks | 0 |
| Constants | 0 |
| Aliases | 0 |

## Classes

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| X11AppLaunchContext | Gdk.AppLaunchContext | 0 | 0 | 0 |  |
| X11Cursor | Gdk.Cursor | 0 | 0 | 2 | Returns the X cursor belonging to a #GdkCursor. |
| X11DeviceCore | Gdk.Device | 0 | 0 | 0 |  |
| X11DeviceManagerCore | Gdk.DeviceManager | 1 | 0 | 0 |  |
| X11DeviceManagerXI2 | X11DeviceManagerCore | 0 | 0 | 0 |  |
| X11DeviceXI2 | Gdk.Device | 0 | 0 | 0 |  |
| X11Display | Gdk.Display | 0 | 0 | 16 | Retrieves the version of the GLX implementation. |
| X11DisplayManager | Gdk.DisplayManager | 0 | 0 | 0 |  |
| X11DragContext | Gdk.DragContext | 0 | 0 | 0 |  |
| X11GLContext | Gdk.GLContext | 0 | 0 | 0 |  |
| X11Keymap | Gdk.Keymap | 0 | 0 | 2 | Extracts the group from the state field sent in an X Key event. This is only needed for code processing raw X events, since #GdkEventKey directly i... |
| X11Monitor | Gdk.Monitor | 0 | 0 | 1 |  |
| X11Screen | Gdk.Screen | 0 | 1 | 8 | Returns the current workspace for @screen when running under a window manager that supports multiple workspaces, as described in the Extended Windo... |
| X11Visual | Gdk.Visual | 0 | 0 | 1 | Returns the X visual belonging to a #GdkVisual. |
| X11Window | Gdk.Window | 0 | 0 | 12 | Wraps a native window in a #GdkWindow. The function will try to look up the window using gdk_x11_window_lookup_for_display() first. If it does not ... |

### GdkX11.X11AppLaunchContext

Parent: `Gdk.AppLaunchContext` ?? GType: `GdkX11AppLaunchContext` ?? C type: `GdkX11AppLaunchContext`

### GdkX11.X11Cursor

Parent: `Gdk.Cursor` ?? GType: `GdkX11Cursor` ?? C type: `GdkX11Cursor`

Returns the X cursor belonging to a #GdkCursor.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_xcursor | `X11Cursor.get_xcursor() -> xlib.Cursor` | gdk_x11_cursor_get_xcursor |  | Returns the X cursor belonging to a #GdkCursor. |
| get_xdisplay | `X11Cursor.get_xdisplay() -> xlib.Display` | gdk_x11_cursor_get_xdisplay |  | Returns the display of a #GdkCursor. |

### GdkX11.X11DeviceCore

Parent: `Gdk.Device` ?? GType: `GdkX11DeviceCore` ?? C type: `GdkX11DeviceCore`

### GdkX11.X11DeviceManagerCore

Parent: `Gdk.DeviceManager` ?? Subclasses: `X11DeviceManagerXI2` ?? GType: `GdkX11DeviceManagerCore` ?? C type: `GdkX11DeviceManagerCore`

### GdkX11.X11DeviceManagerXI2

Parent: `X11DeviceManagerCore` ?? GType: `GdkX11DeviceManagerXI2` ?? C type: `GdkX11DeviceManagerXI2`

#### Properties

| Name | Type | Access | Notes |
| --- | --- | --- | --- |
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

Retrieves the version of the GLX implementation.

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_glx_version | `get_glx_version(display: Gdk.Display, major: out gint, minor: out gint) -> gboolean` | gdk_x11_display_get_glx_version | 3.16 | Retrieves the version of the GLX implementation. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| broadcast_startup_message | `X11Display.broadcast_startup_message(message_type: utf8, ...: void) -> none` | gdk_x11_display_broadcast_startup_message | 2.12 | Sends a startup notification message of type @message_type to @display. This is a convenience function for use by code that implements the freedesk... |
| error_trap_pop | `X11Display.error_trap_pop() -> gint` | gdk_x11_display_error_trap_pop | 3.0 | Pops the error trap pushed by gdk_x11_display_error_trap_push(). Will XSync() if necessary and will always block until the error is known to have o... |
| error_trap_pop_ignored | `X11Display.error_trap_pop_ignored() -> none` | gdk_x11_display_error_trap_pop_ignored | 3.0 | Pops the error trap pushed by gdk_x11_display_error_trap_push(). Does not block to see if an error occurred; merely records the range of requests t... |
| error_trap_push | `X11Display.error_trap_push() -> none` | gdk_x11_display_error_trap_push | 3.0 | Begins a range of X requests on @display for which X error events will be ignored. Unignored errors (when no trap is pushed) will abort the applica... |
| get_startup_notification_id | `X11Display.get_startup_notification_id() -> utf8` | gdk_x11_display_get_startup_notification_id | 2.12 | Gets the startup notification ID for a display. |
| get_user_time | `X11Display.get_user_time() -> guint32` | gdk_x11_display_get_user_time | 2.8 | Returns the timestamp of the last user interaction on @display. The timestamp is taken from events caused by user interaction such as key presses o... |
| get_xdisplay | `X11Display.get_xdisplay() -> xlib.Display` | gdk_x11_display_get_xdisplay | 2.2 | Returns the X display of a #GdkDisplay. |
| grab | `X11Display.grab() -> none` | gdk_x11_display_grab | 2.2 | Call XGrabServer() on @display. To ungrab the display again, use gdk_x11_display_ungrab(). gdk_x11_display_grab()/gdk_x11_display_ungrab() calls ca... |
| set_cursor_theme | `X11Display.set_cursor_theme(theme: utf8?, size: gint) -> none` | gdk_x11_display_set_cursor_theme | 2.8 | Sets the cursor theme from which the images for cursor should be taken. If the windowing system supports it, existing cursors created with gdk_curs... |
| set_startup_notification_id | `X11Display.set_startup_notification_id(startup_id: utf8) -> none` | gdk_x11_display_set_startup_notification_id | 3.0 | Sets the startup notification ID for a display. This is usually taken from the value of the DESKTOP_STARTUP_ID environment variable, but in some ca... |
| set_window_scale | `X11Display.set_window_scale(scale: gint) -> none` | gdk_x11_display_set_window_scale | 3.10 | Forces a specific window scale for all windows on this display, instead of using the default or user configured scale. This is can be used to disab... |
| string_to_compound_text | `X11Display.string_to_compound_text(str: utf8, encoding: out Gdk.Atom, format: out gint, ctext: out guint8, length: out gint) -> gint` | gdk_x11_display_string_to_compound_text | 2.24 | Convert a string from the encoding of the current locale into a form suitable for storing in a window property. |
| text_property_to_text_list | `X11Display.text_property_to_text_list(encoding: Gdk.Atom, format: gint, text: guint8, length: gint, list: utf8) -> gint` | gdk_x11_display_text_property_to_text_list | 2.24 | Convert a text string from the encoding as it is stored in a property into an array of strings in the encoding of the current locale. (The elements... |
| ungrab | `X11Display.ungrab() -> none` | gdk_x11_display_ungrab | 2.2 | Ungrab @display after it has been grabbed with gdk_x11_display_grab(). |
| utf8_to_compound_text | `X11Display.utf8_to_compound_text(str: utf8, encoding: out Gdk.Atom, format: out gint, ctext: out guint8, length: out gint) -> gboolean` | gdk_x11_display_utf8_to_compound_text | 2.24 | Converts from UTF-8 to compound text. |

### GdkX11.X11DisplayManager

Parent: `Gdk.DisplayManager` ?? GType: `GdkX11DisplayManager` ?? C type: `GdkX11DisplayManager`

### GdkX11.X11DragContext

Parent: `Gdk.DragContext` ?? GType: `GdkX11DragContext` ?? C type: `GdkX11DragContext`

### GdkX11.X11GLContext

Parent: `Gdk.GLContext` ?? GType: `GdkX11GLContext` ?? C type: `GdkX11GLContext`

### GdkX11.X11Keymap

Parent: `Gdk.Keymap` ?? GType: `GdkX11Keymap` ?? C type: `GdkX11Keymap`

Extracts the group from the state field sent in an X Key event. This is only needed for code processing raw X events, since #GdkEventKey directly i...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_group_for_state | `X11Keymap.get_group_for_state(state: guint) -> gint` | gdk_x11_keymap_get_group_for_state | 3.6 | Extracts the group from the state field sent in an X Key event. This is only needed for code processing raw X events, since #GdkEventKey directly i... |
| key_is_modifier | `X11Keymap.key_is_modifier(keycode: guint) -> gboolean` | gdk_x11_keymap_key_is_modifier | 3.6 | Determines whether a particular key code represents a key that is a modifier. That is, it???s a key that normally just affects the keyboard state a... |

### GdkX11.X11Monitor

Parent: `Gdk.Monitor` ?? GType: `GdkX11Monitor` ?? C type: `GdkX11Monitor`

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_output | `get_output(monitor: Gdk.Monitor) -> xlib.XID` | gdk_x11_monitor_get_output |  |  |

### GdkX11.X11Screen

Parent: `Gdk.Screen` ?? GType: `GdkX11Screen` ?? C type: `GdkX11Screen`

Returns the current workspace for @screen when running under a window manager that supports multiple workspaces, as described in the Extended Windo...

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_current_desktop | `X11Screen.get_current_desktop() -> guint32` | gdk_x11_screen_get_current_desktop | 3.10 | Returns the current workspace for @screen when running under a window manager that supports multiple workspaces, as described in the Extended Windo... |
| get_monitor_output | `X11Screen.get_monitor_output(monitor_num: gint) -> xlib.XID` | gdk_x11_screen_get_monitor_output | 2.14 | Gets the XID of the specified output/monitor. If the X server does not support version 1.2 of the RANDR extension, 0 is returned. |
| get_number_of_desktops | `X11Screen.get_number_of_desktops() -> guint32` | gdk_x11_screen_get_number_of_desktops | 3.10 | Returns the number of workspaces for @screen when running under a window manager that supports multiple workspaces, as described in the Extended Wi... |
| get_screen_number | `X11Screen.get_screen_number() -> gint` | gdk_x11_screen_get_screen_number | 2.2 | Returns the index of a #GdkScreen. |
| get_window_manager_name | `X11Screen.get_window_manager_name() -> utf8` | gdk_x11_screen_get_window_manager_name | 2.2 | Returns the name of the window manager for @screen. |
| get_xscreen | `X11Screen.get_xscreen() -> xlib.Screen` | gdk_x11_screen_get_xscreen | 2.2 | Returns the screen of a #GdkScreen. |
| lookup_visual | `X11Screen.lookup_visual(xvisualid: xlib.VisualID) -> X11Visual` | gdk_x11_screen_lookup_visual | 2.2 | Looks up the #GdkVisual for a particular screen and X Visual ID. |
| supports_net_wm_hint | `X11Screen.supports_net_wm_hint(property: Gdk.Atom) -> gboolean` | gdk_x11_screen_supports_net_wm_hint | 2.2 | This function is specific to the X11 backend of GDK, and indicates whether the window manager supports a certain hint from the Extended Window Mana... |

#### Signals

Connect in SQGI with `instance.connect("signal-name", handler)`.

| Signal | Handler Arguments | Returns | When | Since | Notes |
| --- | --- | --- | --- | --- | --- |
| window-manager-changed | `` | none | last |  |  |

### GdkX11.X11Visual

Parent: `Gdk.Visual` ?? GType: `GdkX11Visual` ?? C type: `GdkX11Visual`

Returns the X visual belonging to a #GdkVisual.

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_xvisual | `X11Visual.get_xvisual() -> xlib.Visual` | gdk_x11_visual_get_xvisual |  | Returns the X visual belonging to a #GdkVisual. |

### GdkX11.X11Window

Parent: `Gdk.Window` ?? GType: `GdkX11Window` ?? C type: `GdkX11Window`

Wraps a native window in a #GdkWindow. The function will try to look up the window using gdk_x11_window_lookup_for_display() first. If it does not ...

#### Constructors

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| foreign_new_for_display | `X11Window.foreign_new_for_display(display: X11Display, window: xlib.Window) -> Gdk.Window` | gdk_x11_window_foreign_new_for_display | 2.24 | Wraps a native window in a #GdkWindow. The function will try to look up the window using gdk_x11_window_lookup_for_display() first. If it does not ... |

#### Static Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| lookup_for_display | `lookup_for_display(display: X11Display, window: xlib.Window) -> X11Window` | gdk_x11_window_lookup_for_display | 2.24 | Looks up the #GdkWindow that wraps the given native window handle. |

#### Methods

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| get_desktop | `X11Window.get_desktop() -> guint32` | gdk_x11_window_get_desktop | 3.10 | Gets the number of the workspace @window is on. |
| get_xid | `X11Window.get_xid() -> xlib.Window` | gdk_x11_window_get_xid |  | Returns the X resource (window) belonging to a #GdkWindow. |
| move_to_current_desktop | `X11Window.move_to_current_desktop() -> none` | gdk_x11_window_move_to_current_desktop | 2.8 | Moves the window to the correct workspace when running under a window manager that supports multiple workspaces, as described in the Extended Windo... |
| move_to_desktop | `X11Window.move_to_desktop(desktop: guint32) -> none` | gdk_x11_window_move_to_desktop | 3.10 | Moves the window to the given workspace when running unde a window manager that supports multiple workspaces, as described in the Extended Window M... |
| set_frame_extents | `X11Window.set_frame_extents(left: gint, right: gint, top: gint, bottom: gint) -> none` | gdk_x11_window_set_frame_extents | 3.10 | This is the same as gdk_window_set_shadow_width() but it only works on GdkX11Window. |
| set_frame_sync_enabled | `X11Window.set_frame_sync_enabled(frame_sync_enabled: gboolean) -> none` | gdk_x11_window_set_frame_sync_enabled | 3.8 | This function can be used to disable frame synchronization for a window. Normally frame synchronziation will be enabled or disabled based on whethe... |
| set_hide_titlebar_when_maximized | `X11Window.set_hide_titlebar_when_maximized(hide_titlebar_when_maximized: gboolean) -> none` | gdk_x11_window_set_hide_titlebar_when_maximized | 3.4 | Set a hint for the window manager, requesting that the titlebar should be hidden when the window is maximized. Note that this property is automatic... |
| set_theme_variant | `X11Window.set_theme_variant(variant: utf8) -> none` | gdk_x11_window_set_theme_variant | 3.2 | GTK+ applications can request a dark theme variant. In order to make other applications - namely window managers using GTK+ for themeing - aware of... |
| set_user_time | `X11Window.set_user_time(timestamp: guint32) -> none` | gdk_x11_window_set_user_time | 2.6 | The application can use this call to update the _NET_WM_USER_TIME property on a toplevel window. This property stores an Xserver time which represe... |
| set_utf8_property | `X11Window.set_utf8_property(name: utf8, value: utf8?) -> none` | gdk_x11_window_set_utf8_property | 3.4 | This function modifies or removes an arbitrary X11 window property of type UTF8_STRING. If the given @window is not a toplevel window, it is ignored. |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| X11AppLaunchContextClass |  | 0 | 0 | 0 |  |
| X11CursorClass |  | 0 | 0 | 0 |  |
| X11DeviceCoreClass |  | 0 | 0 | 0 |  |
| X11DeviceManagerCoreClass |  | 0 | 0 | 0 |  |
| X11DeviceManagerXI2Class |  | 0 | 0 | 0 |  |
| X11DeviceXI2Class |  | 0 | 0 | 0 |  |
| X11DisplayClass |  | 0 | 0 | 0 |  |
| X11DisplayManagerClass |  | 0 | 0 | 0 |  |
| X11DragContextClass |  | 0 | 0 | 0 |  |
| X11GLContextClass |  | 0 | 0 | 0 |  |
| X11KeymapClass |  | 0 | 0 | 0 |  |
| X11MonitorClass |  | 0 | 0 | 0 |  |
| X11ScreenClass |  | 0 | 0 | 0 |  |
| X11VisualClass |  | 0 | 0 | 0 |  |
| X11WindowClass |  | 0 | 0 | 0 |  |

### GdkX11.X11AppLaunchContextClass

C type: `GdkX11AppLaunchContextClass`

### GdkX11.X11CursorClass

C type: `GdkX11CursorClass`

### GdkX11.X11DeviceCoreClass

C type: `GdkX11DeviceCoreClass`

### GdkX11.X11DeviceManagerCoreClass

C type: `GdkX11DeviceManagerCoreClass`

### GdkX11.X11DeviceManagerXI2Class

C type: `GdkX11DeviceManagerXI2Class`

### GdkX11.X11DeviceXI2Class

C type: `GdkX11DeviceXI2Class`

### GdkX11.X11DisplayClass

C type: `GdkX11DisplayClass`

### GdkX11.X11DisplayManagerClass

C type: `GdkX11DisplayManagerClass`

### GdkX11.X11DragContextClass

C type: `GdkX11DragContextClass`

### GdkX11.X11GLContextClass

C type: `GdkX11GLContextClass`

### GdkX11.X11KeymapClass

C type: `GdkX11KeymapClass`

### GdkX11.X11MonitorClass

C type: `GdkX11MonitorClass`

### GdkX11.X11ScreenClass

C type: `GdkX11ScreenClass`

### GdkX11.X11VisualClass

C type: `GdkX11VisualClass`

### GdkX11.X11WindowClass

C type: `GdkX11WindowClass`

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| x11_atom_to_xatom | `x11_atom_to_xatom(atom: Gdk.Atom) -> xlib.Atom` | gdk_x11_atom_to_xatom |  | Converts from a #GdkAtom to the X atom for the default GDK display with the same string value. |
| x11_atom_to_xatom_for_display | `x11_atom_to_xatom_for_display(display: X11Display, atom: Gdk.Atom) -> xlib.Atom` | gdk_x11_atom_to_xatom_for_display | 2.2 | Converts from a #GdkAtom to the X atom for a #GdkDisplay with the same string value. The special value %GDK_NONE is converted to %None. |
| x11_device_get_id | `x11_device_get_id(device: X11DeviceCore) -> gint` | gdk_x11_device_get_id | 3.2 | Returns the device ID as seen by XInput2. > If gdk_disable_multidevice() has been called, this function > will respectively return 2/3 for the core... |
| x11_device_manager_lookup | `x11_device_manager_lookup(device_manager: X11DeviceManagerCore, device_id: gint) -> X11DeviceCore` | gdk_x11_device_manager_lookup | 3.2 | Returns the #GdkDevice that wraps the given device ID. |
| x11_free_compound_text | `x11_free_compound_text(ctext: guint8) -> none` | gdk_x11_free_compound_text | 2.24 | Frees the data returned from gdk_x11_display_string_to_compound_text(). |
| x11_free_text_list | `x11_free_text_list(list: utf8) -> none` | gdk_x11_free_text_list | 2.24 | Frees the array of strings created by gdk_x11_display_text_property_to_text_list(). |
| x11_get_default_root_xwindow | `x11_get_default_root_xwindow() -> xlib.Window` | gdk_x11_get_default_root_xwindow |  | Gets the root window of the default screen (see gdk_x11_get_default_screen()). |
| x11_get_default_screen | `x11_get_default_screen() -> gint` | gdk_x11_get_default_screen |  | Gets the default GTK+ screen number. |
| x11_get_default_xdisplay | `x11_get_default_xdisplay() -> xlib.Display` | gdk_x11_get_default_xdisplay |  | Gets the default GTK+ display. |
| x11_get_parent_relative_pattern | `x11_get_parent_relative_pattern() -> cairo.Pattern` | gdk_x11_get_parent_relative_pattern | 3.24.2 | Used with gdk_window_set_background_pattern() to inherit background from parent window. Useful for imitating transparency when compositing is not a... |
| x11_get_server_time | `x11_get_server_time(window: X11Window) -> guint32` | gdk_x11_get_server_time |  | Routine to get the current X server time stamp. |
| x11_get_xatom_by_name | `x11_get_xatom_by_name(atom_name: utf8) -> xlib.Atom` | gdk_x11_get_xatom_by_name |  | Returns the X atom for GDK???s default display corresponding to @atom_name. This function caches the result, so if called repeatedly it is much fas... |
| x11_get_xatom_by_name_for_display | `x11_get_xatom_by_name_for_display(display: X11Display, atom_name: utf8) -> xlib.Atom` | gdk_x11_get_xatom_by_name_for_display | 2.2 | Returns the X atom for a #GdkDisplay corresponding to @atom_name. This function caches the result, so if called repeatedly it is much faster than X... |
| x11_get_xatom_name | `x11_get_xatom_name(xatom: xlib.Atom) -> utf8` | gdk_x11_get_xatom_name |  | Returns the name of an X atom for GDK???s default display. This function is meant mainly for debugging, so for convenience, unlike XAtomName() and ... |
| x11_get_xatom_name_for_display | `x11_get_xatom_name_for_display(display: X11Display, xatom: xlib.Atom) -> utf8` | gdk_x11_get_xatom_name_for_display | 2.2 | Returns the name of an X atom for its display. This function is meant mainly for debugging, so for convenience, unlike XAtomName() and gdk_atom_nam... |
| x11_grab_server | `x11_grab_server() -> none` | gdk_x11_grab_server |  | Call gdk_x11_display_grab() on the default display. To ungrab the server again, use gdk_x11_ungrab_server(). gdk_x11_grab_server()/gdk_x11_ungrab_s... |
| x11_lookup_xdisplay | `x11_lookup_xdisplay(xdisplay: xlib.Display) -> X11Display` | gdk_x11_lookup_xdisplay | 2.2 | Find the #GdkDisplay corresponding to @xdisplay, if any exists. |
| x11_register_standard_event_type | `x11_register_standard_event_type(display: X11Display, event_base: gint, n_events: gint) -> none` | gdk_x11_register_standard_event_type | 2.4 | Registers interest in receiving extension events with type codes between @event_base and `event_base + n_events - 1`. The registered events must ha... |
| x11_set_sm_client_id | `x11_set_sm_client_id(sm_client_id: utf8?) -> none` | gdk_x11_set_sm_client_id | 2.24 | Sets the `SM_CLIENT_ID` property on the application???s leader window so that the window manager can save the application???s state using the X11R6... |
| x11_ungrab_server | `x11_ungrab_server() -> none` | gdk_x11_ungrab_server |  | Ungrab the default display after it has been grabbed with gdk_x11_grab_server(). |
| x11_xatom_to_atom | `x11_xatom_to_atom(xatom: xlib.Atom) -> Gdk.Atom` | gdk_x11_xatom_to_atom |  | Convert from an X atom for the default display to the corresponding #GdkAtom. |
| x11_xatom_to_atom_for_display | `x11_xatom_to_atom_for_display(display: X11Display, xatom: xlib.Atom) -> Gdk.Atom` | gdk_x11_xatom_to_atom_for_display | 2.2 | Convert from an X atom for a #GdkDisplay to the corresponding #GdkAtom. |

